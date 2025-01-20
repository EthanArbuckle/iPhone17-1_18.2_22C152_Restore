uint64_t sub_1000019E8(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  unsigned __int8 v4[8];
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  v8 = 0;
  v7 = 0;
  v6 = 8;
  result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v6, 16, (uint64_t)v4, 16);
  if (!result)
  {
    result = sub_100010B8C(v4);
    if (!result) {
      *a2 = bswap32(v5 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_100001A58(uint64_t a1, int a2)
{
  v4[1] = 0;
  v4[0] = 264;
  v4[2] = bswap32(a2 & 0xFFFFFF);
  v4[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v4, 16, (uint64_t)v3, 16);
  if (!result) {
    return sub_100010B8C(v3);
  }
  return result;
}

uint64_t DriverKit_AppleEthernetMLX5::init(IOService *this)
{
  IOParseBootArgNumber("mlx5_debug", &dword_1000284F8, 4);
  uint64_t result = IOMallocZeroTyped();
  if (result)
  {
    this[1].OSObject::OSMetaClassBase::__vftable = (IOService_vtbl *)result;
    if (IOService::init(this))
    {
      return 1;
    }
    else
    {
      uint64_t result = (uint64_t)this[1].OSObject::OSMetaClassBase::__vftable;
      if (result)
      {
        IOFree((void *)result, 0x27980uLL);
        uint64_t result = 0;
        this[1].OSObject::OSMetaClassBase::__vftable = 0;
      }
    }
  }
  return result;
}

uint64_t non-virtual thunk to'DriverKit_AppleEthernetMLX5::init(DriverKit_AppleEthernetMLX5 *this)
{
  return DriverKit_AppleEthernetMLX5::init((IOService *)((char *)this - 24));
}

void DriverKit_AppleEthernetMLX5::free(IOService *this)
{
  v2 = this[1].OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 0x27980uLL);
    this[1].OSObject::OSMetaClassBase::__vftable = 0;
  }
  IOService::free(this);
}

void non-virtual thunk to'DriverKit_AppleEthernetMLX5::free(DriverKit_AppleEthernetMLX5 *this)
{
}

uint64_t DriverKit_AppleEthernetMLX5::Start_Impl(DriverKit_AppleEthernetMLX5 *this, IOService *anObject)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d %p\n", "Start_Impl", 26, this);
  }
  v4 = (IOPCIDevice *)OSMetaClassBase::safeMetaCast(anObject, gIOPCIDeviceMetaClass);
  if (!v4) {
    return 3758097084;
  }
  v5 = v4;
  **((void **)this + 6) = this;
  qword_100028500 = (uint64_t)v4;
  uint64_t result = (uint64_t)sub_10000DF9C(*((IOService ***)this + 6), v4);
  if (!result)
  {
    if (!IOService::Start((IOService *)this, anObject, (OSDispatchMethod)&IOService::_Dispatch))
    {
      if (!OSObject::CopyDispatchQueue((OSObject *)this, "Default", (IODispatchQueue **)(*((void *)this + 6) + 8), 0))
      {
        if (!IODispatchQueue::Create("cmd_queue", 1uLL, 0, (IODispatchQueue **)(*((void *)this + 6) + 16)))
        {
          action[0] = 0;
          action[1] = 0;
          if (!IOTimerDispatchSource::Create(*(IODispatchQueue **)(*((void *)this + 6) + 8), (IOTimerDispatchSource **)(*((void *)this + 6) + 192)))
          {
            if (!DriverKit_AppleEthernetMLX5::CreateActionHealthTimerOccurred((OSObject *)this, 8uLL, action))
            {
              if (!IOTimerDispatchSource::SetHandler(*(IOTimerDispatchSource **)(*((void *)this + 6) + 192), action[0], 0))
              {
                if (!IOTimerDispatchSource::Create(*(IODispatchQueue **)(*((void *)this + 6) + 16), (IOTimerDispatchSource **)(*((void *)this + 6) + 200)))
                {
                  if (!DriverKit_AppleEthernetMLX5::CreateActionCmdTimerOccurred((OSObject *)this, 8uLL, action))
                  {
                    if (!IOTimerDispatchSource::SetHandler(*(IOTimerDispatchSource **)(*((void *)this + 6) + 200), action[0], 0))
                    {
                      IOPCIDevice::ConfigureInterrupts(v5, 0x20000u, 4u, 9u, 0, 0);
                      operator new[]();
                    }
                    sub_10001BA54();
                  }
                  sub_10001BA80();
                }
                sub_10001BAAC();
              }
              sub_10001BAD8();
            }
            sub_10001BB04();
          }
          sub_10001BB30();
        }
        sub_10001BB5C();
      }
      sub_10001BB88();
    }
    sub_10001BBB4();
  }
  return result;
}

uint64_t DriverKit_AppleEthernetMLX5::Stop_Impl(IOService *this, IOService *provider)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d %p\n", "Stop_Impl", 140, this);
  }
  LODWORD(this[1].OSObject::OSMetaClassBase::__vftable[3].init) = 3;
  init = this[1].OSObject::OSMetaClassBase::__vftable[2205].init;
  if (init)
  {
    IOService::Terminate((IOService *)init, 0, 0);
    v5 = this[1].OSObject::OSMetaClassBase::__vftable[2205].init;
    if (v5)
    {
      (*(void (**)(BOOL (__cdecl *)(IOService *__hidden)))(*(void *)v5 + 16))(v5);
      this[1].OSObject::OSMetaClassBase::__vftable[2205].init = 0;
    }
  }
  for (uint64_t i = 120; i != 192; i += 8)
  {
    uint64_t v7 = *(uint64_t *)((char *)&this[1].getMetaClass + i);
    if (v7)
    {
      (*(void (**)(uint64_t))(*(void *)v7 + 16))(v7);
      *(const OSMetaClass *(__cdecl **)(const OSMetaClassBase *__hidden))((char *)&this[1].getMetaClass + i) = 0;
    }
  }
  for (uint64_t j = 0; j != 48; j += 8)
  {
    v9 = this[1].OSObject::OSMetaClassBase::__vftable;
    uint64_t v10 = *(uint64_t *)((char *)&v9->isEqualTo + j);
    if (v10)
    {
      (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
      *(BOOL (__cdecl **)(const OSMetaClassBase *__hidden, const OSMetaClassBase *))((char *)&this[1].isEqualTo + j) = 0;
      v9 = this[1].OSObject::OSMetaClassBase::__vftable;
    }
    uint64_t v11 = *(uint64_t *)((char *)&v9[1].release + j);
    if (v11)
    {
      (*(void (**)(uint64_t))(*(void *)v11 + 16))(v11);
      *(void (__cdecl **)(const OSObject *__hidden))((char *)&this[1].OSObject::OSMetaClassBase::__vftable[1].release + j) = 0;
    }
  }
  if (qword_100028500)
  {
    uint8_t readData = 0;
    IOPCIDevice::ConfigurationRead8((IOPCIDevice *)qword_100028500, 4uLL, &readData);
    IOPCIDevice::ConfigurationWrite8((IOPCIDevice *)qword_100028500, 4uLL, readData & 0xFB);
    IOPCIDevice::Close((IOPCIDevice *)qword_100028500, this, 0);
  }
  return IOService::Stop(this, provider, (OSDispatchMethod)&IOService::_Dispatch);
}

uint64_t DriverKit_AppleEthernetMLX5::SetPowerState_Impl(IOService *this, uint32_t powerFlags)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d %p powerState=%x\n", "SetPowerState_Impl", 163, this, powerFlags);
  }
  v4 = this[1].OSObject::OSMetaClassBase::__vftable;
  if (powerFlags)
  {
    if (LODWORD(v4[3].init) != 1)
    {
      LODWORD(v4[3].init) = 1;
      uint8_t readData = 0;
      IOPCIDevice::ConfigurationRead8((IOPCIDevice *)qword_100028500, 4uLL, &readData);
      IOPCIDevice::ConfigurationWrite8((IOPCIDevice *)qword_100028500, 4uLL, readData | 4);
      sub_10000E230();
    }
  }
  else
  {
    LODWORD(v4[3].init) = 2;
    isEqualTo = this[1].OSObject::OSMetaClassBase::__vftable[3].isEqualTo;
    uint64_t v6 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    IOTimerDispatchSource::WakeAtTime((IOTimerDispatchSource *)isEqualTo, 0x88uLL, v6, 0, 0);
    sub_10000EAC4((uint64_t)this[1].OSObject::OSMetaClassBase::__vftable);
    uint8_t v8 = 0;
    IOPCIDevice::ConfigurationRead8((IOPCIDevice *)qword_100028500, 4uLL, &v8);
    IOPCIDevice::ConfigurationWrite8((IOPCIDevice *)qword_100028500, 4uLL, v8 & 0xFB);
  }
  return IOService::SetPowerState(this, powerFlags, (OSDispatchMethod)&IOService::_Dispatch);
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::SetPowerState_Impl(IOService *this, uint32_t powerFlags)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d %p powerState=%x\n", "SetPowerState_Impl", 189, this, powerFlags);
  }
  return IOService::SetPowerState(this, powerFlags, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
}

void DriverKit_AppleEthernetMLX5::CommandInterrupt_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetMLX5::PagesInterrupt_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetMLX5::AsyncInterrupt_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetMLX5::QueueInterrupt_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*((void *)this + 6) + 124072)
                 + 1152 * *(unsigned __int8 *)OSAction::GetReference(a2)
                 + 1032);
  sub_10000D9E0(v2);
}

_DWORD *DriverKit_AppleEthernetMLX5::HealthTimerOccurred_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
  uint64_t result = (_DWORD *)*((void *)this + 6);
  if (result[52] == 1)
  {
    sub_100009C0C(result);
    uint64_t v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 500000000;
    v5 = *(IOTimerDispatchSource **)(*((void *)this + 6) + 192);
    return (_DWORD *)IOTimerDispatchSource::WakeAtTime(v5, 0x88uLL, v4, 0x1F4uLL, 0);
  }
  return result;
}

uint64_t DriverKit_AppleEthernetMLX5::CmdTimerOccurred_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
  uint64_t result = sub_1000100A4(*(void *)(*((void *)this + 6) + 352));
  if (result)
  {
    uint64_t v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 10000000;
    v5 = *(IOTimerDispatchSource **)(*((void *)this + 6) + 200);
    return IOTimerDispatchSource::WakeAtTime(v5, 0x88uLL, v4, 0, 0);
  }
  return result;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::SetInterfaceEnable_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, int a2)
{
  char v2 = a2;
  if (dword_1000284F8)
  {
    uint64_t v7 = "disable";
    if (a2) {
      uint64_t v7 = "enable";
    }
    IOLog("mlx5:%s:%d <==(%s)\n", "SetInterfaceEnable_Impl", 257, v7);
  }
  uint64_t v4 = 3758097111;
  uint64_t v5 = *((void *)this + 8);
  if (*(_DWORD *)(v5 - 123312) == 1)
  {
    uint64_t v9 = 0;
    context[0] = sub_100003060;
    context[1] = v5 - 123520;
    BYTE4(v9) = v2;
    uint64_t v10 = 3758097111;
    IODispatchQueue::DispatchSync_f(*(IODispatchQueue **)(v5 - 123496), context, (IODispatchFunction)sub_100003060);
    uint64_t v4 = v10;
  }
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d ==>0x%08x\n", "SetInterfaceEnable_Impl", 287, v4);
  }
  return v4;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::SetPromiscuousModeEnable_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, int a2)
{
  return sub_100016654(*((void *)this + 8), a2);
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::SetAllMulticastModeEnable_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, int a2)
{
  if (dword_1000284F8)
  {
    uint64_t v6 = "disable";
    if (a2) {
      uint64_t v6 = "enable";
    }
    IOLog("mlx5:%s:%d - %s\n", "SetAllMulticastModeEnable_Impl", 300, v6);
  }
  uint64_t v4 = *((void *)this + 8);
  return sub_100016608(v4, a2);
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::setMulticastAddresses(DriverKit_AppleEthernetMLX5_NetIf *this, const ether_addr *a2)
{
  return sub_10001655C(*((void *)this + 8));
}

uint64_t non-virtual thunk to'DriverKit_AppleEthernetMLX5_NetIf::setMulticastAddresses(DriverKit_AppleEthernetMLX5_NetIf *this, const ether_addr *a2)
{
  return sub_10001655C(*((void *)this + 2));
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::SelectMediaType_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, int a2)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d type=0x%08x\n", "SelectMediaType_Impl", 313, a2);
  }
  uint64_t v9 = 0;
  uint64_t v4 = *((void *)this + 8);
  context[0] = sub_1000030F0;
  context[1] = v4 - 123520;
  int v7 = 0;
  int v8 = a2;
  LODWORD(v9) = -536870185;
  IODispatchQueue::DispatchSync_f(*(IODispatchQueue **)(v4 - 123496), context, (IODispatchFunction)sub_1000030F0);
  return 0;
}

void DriverKit_AppleEthernetMLX5_NetIf::TxSubmit00_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, OSAction *a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (*(_DWORD *)(v3 + 24) != 2)
  {
    IOLog("mlx5: TxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
    uint64_t v3 = *((void *)this + 8);
  }
  if (*(_DWORD *)(v3 - 123312) == 1)
  {
    uint64_t v4 = (unsigned __int16 *)(*(void *)(v3 + 552) + 384);
    sub_100009F5C(v3, v4);
  }
}

void DriverKit_AppleEthernetMLX5_NetIf::TxSubmit01_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, OSAction *a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (*(_DWORD *)(v3 + 24) != 2)
  {
    IOLog("mlx5: TxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
    uint64_t v3 = *((void *)this + 8);
  }
  if (*(_DWORD *)(v3 - 123312) == 1)
  {
    uint64_t v4 = (unsigned __int16 *)(*(void *)(v3 + 552) + 1536);
    sub_100009F5C(v3, v4);
  }
}

void DriverKit_AppleEthernetMLX5_NetIf::TxSubmit02_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, OSAction *a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (*(_DWORD *)(v3 + 24) != 2)
  {
    IOLog("mlx5: TxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
    uint64_t v3 = *((void *)this + 8);
  }
  if (*(_DWORD *)(v3 - 123312) == 1)
  {
    uint64_t v4 = (unsigned __int16 *)(*(void *)(v3 + 552) + 2688);
    sub_100009F5C(v3, v4);
  }
}

void DriverKit_AppleEthernetMLX5_NetIf::TxSubmit03_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, OSAction *a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (*(_DWORD *)(v3 + 24) != 2)
  {
    IOLog("mlx5: TxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
    uint64_t v3 = *((void *)this + 8);
  }
  if (*(_DWORD *)(v3 - 123312) == 1)
  {
    uint64_t v4 = (unsigned __int16 *)(*(void *)(v3 + 552) + 3840);
    sub_100009F5C(v3, v4);
  }
}

void DriverKit_AppleEthernetMLX5_NetIf::TxSubmit04_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, OSAction *a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (*(_DWORD *)(v3 + 24) != 2)
  {
    IOLog("mlx5: TxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
    uint64_t v3 = *((void *)this + 8);
  }
  if (*(_DWORD *)(v3 - 123312) == 1)
  {
    uint64_t v4 = (unsigned __int16 *)(*(void *)(v3 + 552) + 4992);
    sub_100009F5C(v3, v4);
  }
}

void DriverKit_AppleEthernetMLX5_NetIf::TxSubmit05_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, OSAction *a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (*(_DWORD *)(v3 + 24) != 2)
  {
    IOLog("mlx5: TxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
    uint64_t v3 = *((void *)this + 8);
  }
  if (*(_DWORD *)(v3 - 123312) == 1)
  {
    uint64_t v4 = (unsigned __int16 *)(*(void *)(v3 + 552) + 6144);
    sub_100009F5C(v3, v4);
  }
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::RxSubmit00_Impl(uint64_t this, OSAction *a2)
{
  uint64_t v2 = *(void *)(this + 64);
  if (*(_DWORD *)(v2 + 24) != 2) {
    return IOLog("mlx5: RxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
  }
  if (*(_DWORD *)(v2 - 123312) == 1) {
    return sub_10000316C((unsigned int *)(*(void *)(v2 + 552) + 128));
  }
  return this;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::RxSubmit01_Impl(uint64_t this, OSAction *a2)
{
  uint64_t v2 = *(void *)(this + 64);
  if (*(_DWORD *)(v2 + 24) != 2) {
    return IOLog("mlx5: RxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
  }
  if (*(_DWORD *)(v2 - 123312) == 1) {
    return sub_10000316C((unsigned int *)(*(void *)(v2 + 552) + 1280));
  }
  return this;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::RxSubmit02_Impl(uint64_t this, OSAction *a2)
{
  uint64_t v2 = *(void *)(this + 64);
  if (*(_DWORD *)(v2 + 24) != 2) {
    return IOLog("mlx5: RxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
  }
  if (*(_DWORD *)(v2 - 123312) == 1) {
    return sub_10000316C((unsigned int *)(*(void *)(v2 + 552) + 2432));
  }
  return this;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::RxSubmit03_Impl(uint64_t this, OSAction *a2)
{
  uint64_t v2 = *(void *)(this + 64);
  if (*(_DWORD *)(v2 + 24) != 2) {
    return IOLog("mlx5: RxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
  }
  if (*(_DWORD *)(v2 - 123312) == 1) {
    return sub_10000316C((unsigned int *)(*(void *)(v2 + 552) + 3584));
  }
  return this;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::RxSubmit04_Impl(uint64_t this, OSAction *a2)
{
  uint64_t v2 = *(void *)(this + 64);
  if (*(_DWORD *)(v2 + 24) != 2) {
    return IOLog("mlx5: RxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
  }
  if (*(_DWORD *)(v2 - 123312) == 1) {
    return sub_10000316C((unsigned int *)(*(void *)(v2 + 552) + 4736));
  }
  return this;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::RxSubmit05_Impl(uint64_t this, OSAction *a2)
{
  uint64_t v2 = *(void *)(this + 64);
  if (*(_DWORD *)(v2 + 24) != 2) {
    return IOLog("mlx5: RxSubmit called with state != MLX5E_STATE_ACTIVATED\n", a2);
  }
  if (*(_DWORD *)(v2 - 123312) == 1) {
    return sub_10000316C((unsigned int *)(*(void *)(v2 + 552) + 5888));
  }
  return this;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::GetMaxTransferUnit_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, unsigned int *a2)
{
  *a2 = 2034;
  return 0;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::GetHardwareAssists_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, unsigned int *a2)
{
  *a2 = 0;
  return 0;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::SetWakeOnMagicPacketEnable_Impl(DriverKit_AppleEthernetMLX5_NetIf *this, int a2)
{
  if (dword_1000284F8)
  {
    uint64_t v3 = "disable";
    if (a2) {
      uint64_t v3 = "enable";
    }
    IOLog("mlx5:%s:%d - %s\n", "SetWakeOnMagicPacketEnable_Impl", 470, v3);
  }
  return 0;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::SetMTU_Impl(IOUserNetworkEthernet *this, uint32_t a2)
{
  return IOUserNetworkEthernet::SetMTU(this, a2, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::getHardwareAddress(DriverKit_AppleEthernetMLX5_NetIf *this, ether_addr *a2)
{
  return sub_100015F40(*((void *)this + 8), (uint64_t)a2);
}

uint64_t non-virtual thunk to'DriverKit_AppleEthernetMLX5_NetIf::getHardwareAddress(DriverKit_AppleEthernetMLX5_NetIf *this, ether_addr *a2)
{
  return sub_100015F40(*((void *)this + 2), (uint64_t)a2);
}

void DriverKit_AppleEthernetMLX5::PlaceHolder00_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetMLX5::PlaceHolder01_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetMLX5::PlaceHolder02_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetMLX5::PlaceHolder03_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetMLX5::PlaceHolder04_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetMLX5::PlaceHolder05_Impl(DriverKit_AppleEthernetMLX5 *this, OSAction *a2)
{
}

void sub_100003060(int *context)
{
  uint64_t v2 = context[4] + 1;
  context[4] = v2;
  uint64_t v3 = *((void *)context + 1);
  int v4 = *(_DWORD *)(v3 + 320);
  int v5 = v2 - v4;
  if ((int)v2 >= v4)
  {
    if (v5 >= v4)
    {
      context[6] = sub_1000161F0(v3 + 123520, *((unsigned __int8 *)context + 20));
      return;
    }
    uint64_t v6 = *(IODispatchQueue **)(v3 + 8 * v5 + 72);
  }
  else
  {
    uint64_t v6 = *(IODispatchQueue **)(v3 + 8 * v2 + 24);
  }
  int v7 = *(void (__cdecl **)(void *))context;
  IODispatchQueue::DispatchSync_f(v6, context, v7);
}

void sub_1000030F0(int *context)
{
  uint64_t v2 = context[4] + 1;
  context[4] = v2;
  uint64_t v3 = *((void *)context + 1);
  if ((int)v2 >= *(_DWORD *)(v3 + 320))
  {
    context[6] = sub_100016398(v3 + 123520, context[5]);
  }
  else
  {
    int v4 = *(IODispatchQueue **)(v3 + 8 * v2 + 24);
    int v5 = *(void (__cdecl **)(void *))context;
    IODispatchQueue::DispatchSync_f(v4, context, v5);
  }
}

uint64_t sub_10000316C(unsigned int *a1)
{
  if (*((unsigned __int16 *)a1 - 55) == *((unsigned __int16 *)a1 - 54)) {
    goto LABEL_45;
  }
  if (*((void *)a1 - 13))
  {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(*((void *)a1 - 7) + 48) + 8) + 64);
    if (!v2) {
      sub_10001BBE0();
    }
    unsigned int v3 = a1[17];
    unint64_t v4 = *((void *)a1 + 6) + ((a1[16] & v3) << *((unsigned char *)a1 + 73));
    if ((((v3 >> *((unsigned char *)a1 + 72)) ^ *(unsigned __int8 *)(v4 + 63)) & 1) == 0)
    {
      uint64_t v5 = 0;
      uint64_t v6 = (unsigned __int16 *)(v2 + 38438);
      int v7 = -1;
      while (1)
      {
        __dmb(1u);
        if ((~*(unsigned __int8 *)(v4 + 63) & 0xC) == 0)
        {
          int v8 = 0;
          unsigned int v9 = a1[16];
          unsigned int v10 = a1[17];
          uint64_t v11 = *((void *)a1 + 6);
          char v12 = *((unsigned char *)a1 + 73);
          v13 = (long long *)(v11 + ((v9 & v10) << v12));
          long long v146 = *v13;
          int v147 = *((_DWORD *)v13 + 4);
          *(_OWORD *)sendDataAvailable = *(long long *)((char *)v13 + 22);
          *(void *)&sendDataAvailable[14] = *(void *)((char *)v13 + 36);
          unsigned int v14 = *((_DWORD *)v13 + 11);
          uint64_t v15 = *((void *)v13 + 6);
          int v144 = *((_DWORD *)v13 + 14);
          uint64_t v143 = v15;
          v16 = (long long *)(v11 + ((v9 & (v10 + 1)) << v12));
          long long v17 = *v16;
          long long v18 = v16[1];
          long long v19 = v16[2];
          long long v20 = v16[3];
          char v21 = *((unsigned char *)v13 + 62);
          int v22 = *((unsigned __int8 *)v13 + 63);
          unsigned int v23 = bswap32(*((unsigned __int16 *)v13 + 30)) >> 16;
          unsigned int v24 = bswap32(v14);
          long long v149 = v19;
          long long v150 = v20;
          *(_OWORD *)callback = v17;
          *(_OWORD *)&callback[16] = v18;
          unsigned int v25 = v22 & 0xFFFFFFF0;
          unsigned int v26 = v24 - 1;
          while (1)
          {
            v27 = &callback[8 * (v8 & 7)];
            int v28 = *((_DWORD *)v27 + 1);
            unsigned int v29 = bswap32((v23 + v8) & v9);
            LOWORD(v27) = *(_WORD *)v27;
            unsigned int v30 = v10 + v8;
            int v31 = (v30 >> *((unsigned char *)a1 + 72)) & 1 | v25;
            uint64_t v32 = v11 + ((v30 & v9) << v12);
            *(_OWORD *)uint64_t v32 = v146;
            *(_DWORD *)(v32 + 16) = v147;
            *(_WORD *)(v32 + 20) = (_WORD)v27;
            *(_OWORD *)(v32 + 22) = *(_OWORD *)sendDataAvailable;
            *(void *)(v32 + 36) = *(void *)&sendDataAvailable[14];
            *(_DWORD *)(v32 + 44) = v28;
            *(void *)(v32 + 48) = v143;
            *(_DWORD *)(v32 + 56) = v144;
            *(_WORD *)(v32 + 60) = HIWORD(v29);
            *(unsigned char *)(v32 + 62) = v21;
            *(unsigned char *)(v32 + 63) = v31;
            if (v26 == v8) {
              break;
            }
            unsigned int v9 = a1[16];
            unsigned int v10 = a1[17];
            uint64_t v11 = *((void *)a1 + 6);
            char v12 = *((unsigned char *)a1 + 73);
            if ((((_BYTE)v8 + 1) & 7) == 0)
            {
              v33 = (_OWORD *)(v11 + (((v8 + v10 + 1) & v9) << v12));
              *(_OWORD *)callback = *v33;
              *(_OWORD *)&callback[16] = v33[1];
              long long v149 = v33[2];
              long long v150 = v33[3];
            }
            ++v8;
          }
        }
        ++a1[17];
        int v34 = *(unsigned __int16 *)(v4 + 44);
        unsigned int v35 = bswap32(*(unsigned __int16 *)(v4 + 2));
        uint64_t v36 = HIWORD(v35);
        unsigned int v37 = *(unsigned __int16 *)(v4 + 60);
        if (v7 != HIWORD(v35))
        {
          v46 = *(long long **)(*((void *)a1 - 12) + 8 * v36);
          long long v48 = v46[1];
          long long v47 = v46[2];
          long long v111 = *v46;
          long long v112 = v48;
          long long v113 = v47;
          long long v50 = v46[4];
          long long v49 = v46[5];
          long long v51 = v46[3];
          *(void *)&long long v117 = *((void *)v46 + 12);
          long long v115 = v50;
          long long v116 = v49;
          long long v114 = v51;
          int v7 = v36;
        }
        unsigned int v38 = bswap32(v34 & 0xFFFFFF7F) >> 16;
        uint64_t v39 = *((void *)a1 - 13);
        unsigned __int16 v40 = *(_WORD *)(v39 + 2 * v36) + v38;
        *(_WORD *)(v39 + 2 * v36) = v40;
        unsigned int v41 = *v6;
        *(_WORD *)((char *)&v117 + 3) = *(_WORD *)((unsigned char *)&v117 + 3) & 0xFDFF | ((v41 > v40) << 9);
        if ((*(unsigned char *)(v4 + 63) & 0xF0) == 0x20 && (*(_WORD *)(v4 + 44) & 0x80) == 0) {
          break;
        }
        if (v41 <= v40)
        {
          LODWORD(v115) = 0;
          v45 = (IODataQueueDispatchSource *)*((void *)a1 - 9);
          WORD4(v115) = 0;
          *(void *)callback = _NSConcreteStackBlock;
          *(void *)&callback[8] = 0x40000000;
          *(void *)&callback[16] = sub_1000040DC;
          *(void *)&callback[24] = &unk_100024348;
          *(void *)&long long v149 = &v111;
          sendDataAvailable[0] = 0;
          if (IODataQueueDispatchSource::EnqueueWithCoalesce(v45, 0x68u, sendDataAvailable, callback))
          {
            IODataQueueDispatchSource::SendDataAvailable(v45);
            uint64_t v5 = 1;
          }
          else
          {
            uint64_t v5 = 0x10000;
          }
LABEL_26:
          *(_WORD *)(*((void *)a1 - 13) + 2 * v36) = 0;
          ++*((_WORD *)a1 - 54);
        }
LABEL_20:
        unsigned int v44 = a1[17];
        unint64_t v4 = *((void *)a1 + 6) + ((a1[16] & v44) << *((unsigned char *)a1 + 73));
        if (((v44 >> *((unsigned char *)a1 + 72)) ^ *(unsigned __int8 *)(v4 + 63)))
        {
          if (v5) {
            goto LABEL_47;
          }
          goto LABEL_48;
        }
      }
      char v42 = *((unsigned char *)v6 + 2);
      DWORD2(v114) = bswap32(v37) >> 16 << v42;
      HIDWORD(v114) = v38 << v42;
      sub_100003A9C(v4, bswap32(*(unsigned __int16 *)(v4 + 46)) >> 16, DWORD2(v114), (uint64_t)&v111);
      v43 = (IODataQueueDispatchSource *)*((void *)a1 - 9);
      *(void *)callback = _NSConcreteStackBlock;
      *(void *)&callback[8] = 0x40000000;
      *(void *)&callback[16] = sub_1000040DC;
      *(void *)&callback[24] = &unk_100024348;
      *(void *)&long long v149 = &v111;
      sendDataAvailable[0] = 0;
      BYTE8(v115) = 0;
      if (IODataQueueDispatchSource::EnqueueWithCoalesce(v43, 0x68u, sendDataAvailable, callback))
      {
        IODataQueueDispatchSource::SendDataAvailable(v43);
        uint64_t v5 = 1;
      }
      else
      {
        uint64_t v5 = 0x10000;
      }
      if ((*(_WORD *)((unsigned char *)&v117 + 3) & 0x200) != 0) {
        goto LABEL_20;
      }
      goto LABEL_26;
    }
LABEL_45:
    uint64_t v5 = 0;
    goto LABEL_48;
  }
  unsigned int v52 = a1[17];
  unint64_t v53 = *((void *)a1 + 6) + ((a1[16] & v52) << *((unsigned char *)a1 + 73));
  if (((v52 >> *((unsigned char *)a1 + 72)) ^ *(unsigned __int8 *)(v53 + 63))) {
    goto LABEL_45;
  }
  do
  {
    __dmb(1u);
    unsigned int v54 = *(unsigned __int8 *)(v53 + 63);
    if ((~v54 & 0xC) == 0)
    {
      int v55 = 0;
      unsigned int v56 = a1[16];
      unsigned int v57 = a1[17];
      uint64_t v58 = *((void *)a1 + 6);
      char v59 = *((unsigned char *)a1 + 73);
      uint64_t v60 = v58 + ((v56 & v57) << v59);
      *(_OWORD *)sendDataAvailable = *(_OWORD *)v60;
      *(_DWORD *)&sendDataAvailable[16] = *(_DWORD *)(v60 + 16);
      *(_OWORD *)callback = *(_OWORD *)(v60 + 22);
      *(void *)&callback[14] = *(void *)(v60 + 36);
      unsigned int v61 = *(_DWORD *)(v60 + 44);
      uint64_t v62 = *(void *)(v60 + 48);
      DWORD2(v146) = *(_DWORD *)(v60 + 56);
      *(void *)&long long v146 = v62;
      v63 = (long long *)(v58 + ((v56 & (v57 + 1)) << v59));
      long long v64 = *v63;
      long long v65 = v63[1];
      long long v66 = v63[2];
      long long v67 = v63[3];
      char v68 = *(unsigned char *)(v60 + 62);
      int v69 = *(unsigned __int8 *)(v60 + 63);
      unsigned int v70 = bswap32(*(unsigned __int16 *)(v60 + 60)) >> 16;
      unsigned int v71 = bswap32(v61);
      long long v113 = v66;
      long long v114 = v67;
      long long v111 = v64;
      long long v112 = v65;
      unsigned int v72 = v69 & 0xFFFFFFF0;
      unsigned int v73 = v71 - 1;
      while (1)
      {
        v74 = (char *)&v111 + 8 * (v55 & 7);
        int v75 = *((_DWORD *)v74 + 1);
        unsigned int v76 = bswap32((v70 + v55) & v56) >> 16;
        LOWORD(v74) = *(_WORD *)v74;
        unsigned int v77 = v57 + v55;
        int v78 = (v77 >> *((unsigned char *)a1 + 72)) & 1 | v72;
        uint64_t v79 = v58 + ((v77 & v56) << v59);
        *(_OWORD *)uint64_t v79 = *(_OWORD *)sendDataAvailable;
        *(_DWORD *)(v79 + 16) = *(_DWORD *)&sendDataAvailable[16];
        *(_WORD *)(v79 + 20) = (_WORD)v74;
        *(_OWORD *)(v79 + 22) = *(_OWORD *)callback;
        *(void *)(v79 + 36) = *(void *)&callback[14];
        *(_DWORD *)(v79 + 44) = v75;
        *(void *)(v79 + 48) = v146;
        *(_DWORD *)(v79 + 56) = DWORD2(v146);
        *(_WORD *)(v79 + 60) = v76;
        *(unsigned char *)(v79 + 62) = v68;
        *(unsigned char *)(v79 + 63) = v78;
        if (v73 == v55) {
          break;
        }
        unsigned int v56 = a1[16];
        unsigned int v57 = a1[17];
        uint64_t v58 = *((void *)a1 + 6);
        char v59 = *((unsigned char *)a1 + 73);
        if ((((_BYTE)v55 + 1) & 7) == 0)
        {
          v80 = (long long *)(v58 + (((v55 + v57 + 1) & v56) << v59));
          long long v111 = *v80;
          long long v112 = v80[1];
          long long v113 = v80[2];
          long long v114 = v80[3];
        }
        ++v55;
      }
      unsigned int v54 = *(unsigned __int8 *)(v53 + 63);
    }
    ++a1[17];
    uint64_t v81 = *((void *)a1 - 12);
    __int16 v82 = *((_WORD *)a1 - 54);
    __int16 v83 = *((_WORD *)a1 - 56);
    uint64_t v84 = *(void *)(v81 + 8 * (unsigned __int16)(v83 & v82++));
    *((_WORD *)a1 - 54) = v82;
    _X9 = *(void *)(v81 + 8 * (unsigned __int16)(v83 & v82));
    __asm { PRFM            #0x10, [X9] }
    unsigned int v91 = v54 >> 4;
    if (v91 == 2)
    {
      sub_100003A9C(v53, bswap32(*(_DWORD *)(v53 + 44)), 0, v84);
    }
    else
    {
      if (dword_1000284F8) {
        IOLog("mlx5:%s:%d cqe OPCODE %d\n", "rxCQComp", 305, v91);
      }
      *(_DWORD *)(v84 + 64) = 0;
    }
    v92 = (IODataQueueDispatchSource *)*((void *)a1 - 9);
    *(void *)&long long v111 = _NSConcreteStackBlock;
    *((void *)&v111 + 1) = 0x40000000;
    *(void *)&long long v112 = sub_1000040DC;
    *((void *)&v112 + 1) = &unk_100024348;
    *(void *)&long long v113 = v84;
    callback[0] = 0;
    *(unsigned char *)(v84 + 72) = 0;
    if (IODataQueueDispatchSource::EnqueueWithCoalesce(v92, 0x68u, callback, &v111))
    {
      IODataQueueDispatchSource::SendDataAvailable(v92);
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v5 = 0x10000;
    }
    unsigned int v93 = a1[17];
    unint64_t v53 = *((void *)a1 + 6) + ((a1[16] & v93) << *((unsigned char *)a1 + 73));
  }
  while ((((v93 >> *((unsigned char *)a1 + 72)) ^ *(unsigned __int8 *)(v53 + 63)) & 1) == 0);
LABEL_47:
  __dmb(0xEu);
  **((_DWORD **)a1 + 7) = bswap32(a1[17] & 0xFFFFFF);
LABEL_48:
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  unsigned __int16 v94 = *((_WORD *)a1 - 56) - *((_WORD *)a1 - 55) + *((_WORD *)a1 - 54);
  long long v111 = 0u;
  long long v112 = 0u;
  if (v94)
  {
    unsigned __int16 v95 = (*(uint64_t (**)(void, long long *, void))(**((void **)a1 - 8) + 104))(*((void *)a1 - 8), &v111, v94);
    uint64_t v96 = v95;
    if (v95)
    {
      int v97 = *((unsigned __int16 *)a1 - 56);
      uint64_t v98 = *((void *)a1 - 12);
      uint64_t v99 = *((void *)a1 - 16);
      char v100 = *((unsigned char *)a1 - 106);
      unsigned int v101 = *((unsigned __int16 *)a1 - 55);
      v102 = (uint64_t *)&v111;
      do
      {
        uint64_t v103 = *v102++;
        uint64_t v104 = *(void *)(v103 + 48);
        *(void *)(v98 + 8 * (v97 & v101)) = v104 + 8;
        int v105 = (v97 & v101++) << v100;
        *((_WORD *)a1 - 55) = v101;
        _X0 = v99 + (int)((v97 & v101) << v100);
        __asm { PRFM            #0x10, [X0] }
        *(void *)(v99 + 24 + v105) = bswap64(*(void *)(v104 + 24));
        --v96;
      }
      while (v96);
      __dmb(2u);
      **((_DWORD **)a1 - 15) = bswap32(*((unsigned __int16 *)a1 - 55));
    }
  }
  uint64_t v108 = *(void *)(*((void *)a1 + 4) + 8);
  uint64_t v109 = a1[17] & 0xFFFFFF | ((a1[11] & 3) << 28);
  **((_DWORD **)a1 + 2) = bswap32(v109);
  __dmb(0xEu);
  IOPCIDevice::MemoryWrite64((IOPCIDevice *)qword_100028500, 0, v108 + 32, bswap64(*a1 | (unint64_t)(v109 << 32)));
  if (v5 >= 0x10000) {
    IODataQueueDispatchSource::SendDataAvailable(*((IODataQueueDispatchSource **)a1 - 9));
  }
  return v5;
}

unint64_t sub_100003A9C(unint64_t result, int a2, unsigned int a3, uint64_t a4)
{
  *(unsigned char *)(a4 + 73) = 14;
  *(_DWORD *)(a4 + 64) = a2;
  if (*(unsigned __int8 *)(result + 32) >= 2u)
  {
    unint64_t v7 = result;
    if (dword_1000284F8) {
      uint64_t result = IOLog("mlx5:%s:%d HW LRO session aggregated packets counter %d\n", "build_rx_mbuf", 105, *(unsigned __int8 *)(result + 32));
    }
    uint64_t v8 = *(void *)(a4 + 8) + a3;
    int v9 = *(unsigned __int16 *)(v8 + 12);
    if (v9 == 56710)
    {
      uint64_t v11 = 0;
      uint64_t v10 = v8 + 14;
      uint64_t v12 = v8 + 54;
    }
    else
    {
      if (v9 != 8) {
        return result;
      }
      uint64_t v10 = 0;
      uint64_t v11 = v8 + 14;
      uint64_t v12 = v8 + 34;
    }
    if ((*(unsigned char *)(v7 + 4) & 0x40) != 0) {
      *(unsigned char *)(v12 + 13) |= 8u;
    }
    if (((*(unsigned __int8 *)(v7 + 29) >> 4) & 7u) - 3 <= 1)
    {
      *(unsigned char *)(v12 + 13) |= 0x10u;
      *(_DWORD *)(v12 + 8) = *(_DWORD *)(v7 + 8);
      *(_WORD *)(v12 + 14) = *(_WORD *)(v7 + 6);
    }
    char v13 = *(unsigned char *)(v7 + 5);
    if (v11)
    {
      *(unsigned char *)(v11 + 8) = v13;
      *(_WORD *)(v11 + 2) = bswap32(a2 - 14) >> 16;
      *(_WORD *)(v11 + 10) = 0;
      unint64_t v14 = *(void *)(v11 + 8);
      uint64_t v15 = (_DWORD *)(v11 + 16);
      int v16 = (*(unsigned char *)v11 & 0xF) - 4;
      unint64_t v17 = v14 + __CFADD__(v14, *(void *)v11) + *(void *)v11;
      long long v18 = (unsigned int *)(v11 + 16);
      do
      {
        unsigned int v19 = *v18++;
        v17 += v19;
        --v16;
      }
      while (v16);
      HIDWORD(v20) = (__ROR8__(v17, 32) + v17) >> 32;
      LODWORD(v20) = HIDWORD(v20);
      unint64_t v21 = HIDWORD(v14);
      *(_WORD *)(v11 + 10) = ~(((v20 >> 16) + HIDWORD(v20)) >> 16);
      *(_WORD *)(v12 + 16) = 0;
      int v22 = (_WORD *)(v12 + 16);
      unsigned int v23 = (*(unsigned __int8 *)(v12 + 12) >> 2) & 0x3C;
      if (v23)
      {
        if (v12)
        {
          unsigned int v25 = (unsigned __int16 *)(v12 + 1);
          unsigned int v24 = *(unsigned __int8 *)v12 << 8;
          --v23;
        }
        else
        {
          unsigned int v24 = 0;
          unsigned int v25 = (unsigned __int16 *)v12;
        }
        if (v23 >= 2)
        {
          if ((v25 & 2) != 0)
          {
            int v31 = *v25++;
            v24 += v31;
            v23 -= 2;
          }
          if (v23 >= 4)
          {
            int v32 = 0;
            uint64_t result = (unint64_t)v25 + (v23 & 0xFFFFFFFC);
            do
            {
              int v33 = *(_DWORD *)v25;
              v25 += 2;
              unsigned int v34 = v32 + v24;
              BOOL v35 = __CFADD__(v34, v33);
              unsigned int v24 = v34 + v33;
              int v32 = v35;
            }
            while ((unint64_t)v25 < result);
            unsigned int v24 = ((v24 + v32) >> 16) + (unsigned __int16)(v24 + v32);
          }
          if ((v23 & 2) != 0)
          {
            int v36 = *v25++;
            v24 += v36;
          }
        }
        if (v23) {
          v24 += *(unsigned __int8 *)v25;
        }
        unsigned int v37 = HIWORD(v24) + (unsigned __int16)v24 + ((HIWORD(v24) + (unsigned __int16)v24) >> 16);
        unsigned int v38 = bswap32(v37) >> 16;
        if (v12) {
          LOWORD(v30) = v38;
        }
        else {
          LOWORD(v30) = v37;
        }
        uint64_t v30 = (unsigned __int16)v30;
      }
      else
      {
        uint64_t v30 = 0;
      }
      uint64_t v39 = ((unsigned __int16)(a2 - 14) << 8) - 3584 + v21 + *(unsigned __int16 *)(v7 + 20);
      unint64_t v40 = ((v39 + v30 + (unint64_t)*v15) >> 32) + (v39 + v30 + *v15);
      unsigned int v41 = HIDWORD(v40) + v40;
    }
    else
    {
      *(unsigned char *)(v10 + 7) = v13;
      unsigned int v26 = (unsigned __int16)(a2 - 14) - 40;
      *(_WORD *)(v10 + 4) = bswap32(v26) >> 16;
      *(_WORD *)(v12 + 16) = 0;
      int v22 = (_WORD *)(v12 + 16);
      unsigned int v27 = (*(unsigned __int8 *)(v12 + 12) >> 2) & 0x3C;
      if (v27)
      {
        if (v12)
        {
          unsigned int v29 = (unsigned __int16 *)(v12 + 1);
          unsigned int v28 = *(unsigned __int8 *)v12 << 8;
          --v27;
        }
        else
        {
          unsigned int v28 = 0;
          unsigned int v29 = (unsigned __int16 *)v12;
        }
        if (v27 >= 2)
        {
          if ((v29 & 2) != 0)
          {
            int v43 = *v29++;
            v28 += v43;
            v27 -= 2;
          }
          if (v27 >= 4)
          {
            int v44 = 0;
            v45 = (unsigned __int16 *)((char *)v29 + (v27 & 0xFFFFFFFC));
            do
            {
              unsigned int v46 = *(_DWORD *)v29;
              v29 += 2;
              uint64_t result = v46;
              unsigned int v47 = v44 + v28;
              BOOL v35 = __CFADD__(v47, v46);
              unsigned int v28 = v47 + v46;
              int v44 = v35;
            }
            while (v29 < v45);
            unsigned int v28 = ((v28 + v44) >> 16) + (unsigned __int16)(v28 + v44);
          }
          if ((v27 & 2) != 0)
          {
            int v48 = *v29++;
            v28 += v48;
          }
        }
        if (v27) {
          v28 += *(unsigned __int8 *)v29;
        }
        unsigned int v49 = HIWORD(v28) + (unsigned __int16)v28 + ((HIWORD(v28) + (unsigned __int16)v28) >> 16);
        unsigned int v50 = bswap32(v49) >> 16;
        if (v12) {
          LOWORD(v42) = v50;
        }
        else {
          LOWORD(v42) = v49;
        }
        int v42 = (unsigned __int16)v42;
      }
      else
      {
        int v42 = 0;
      }
      unsigned int v51 = *(_DWORD *)(v10 + 12);
      unsigned int v52 = v42
          + *(unsigned __int16 *)(v7 + 20)
          + *(_DWORD *)(v10 + 8)
          + __CFADD__(v42 + *(unsigned __int16 *)(v7 + 20), *(_DWORD *)(v10 + 8))
          + v51;
      BOOL v35 = v52 >= v51;
      unsigned int v53 = *(_DWORD *)(v10 + 16);
      unsigned int v54 = *(_DWORD *)(v10 + 20);
      unsigned int v55 = v52 + v53;
      if (!v35) {
        ++v55;
      }
      BOOL v35 = v55 >= v53;
      unsigned int v56 = v55 + v54;
      if (!v35) {
        ++v56;
      }
      BOOL v35 = v56 >= v54;
      unsigned int v57 = *(_DWORD *)(v10 + 24);
      unsigned int v58 = *(_DWORD *)(v10 + 28);
      unsigned int v59 = v56 + v57;
      if (!v35) {
        ++v59;
      }
      BOOL v35 = v59 >= v57;
      unsigned int v60 = v59 + v58;
      if (!v35) {
        ++v60;
      }
      BOOL v35 = v60 >= v58;
      unsigned int v62 = *(_DWORD *)(v10 + 32);
      unsigned int v61 = *(_DWORD *)(v10 + 36);
      unsigned int v63 = v60 + v62;
      if (!v35) {
        ++v63;
      }
      BOOL v35 = v63 >= v62;
      unsigned int v64 = v63 + v61;
      if (!v35) {
        ++v64;
      }
      BOOL v35 = v64 >= v61;
      unsigned int v65 = bswap32(v26);
      unsigned int v66 = v64 + v65;
      if (!v35) {
        ++v66;
      }
      if (v66 < v65) {
        ++v66;
      }
      if (v66 >> 25 > 0x7C) {
        ++v66;
      }
      unsigned int v41 = v66 + 100663296;
    }
    HIDWORD(v67) = v41;
    LODWORD(v67) = v41;
    *int v22 = ~(((v67 >> 16) + v41) >> 16);
  }
  return result;
}

void sub_100003E9C(uint64_t a1, uint64_t a2)
{
                                                                                   + 544);
  int v3 = *(unsigned __int16 *)(a2 + 20);
  if (v3 == *(unsigned __int16 *)(a2 + 18))
  {
    int v4 = *(unsigned __int16 *)(a2 + 20);
  }
  else
  {
    unsigned int v5 = 0;
    while (1)
    {
      readData[0] = 0;
      IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0, readData);
      if (readData[0] == -1) {
        break;
      }
      if ((dword_1000284F8 & 4) != 0) {
        IOLog("mlx5: drainRQ phase 1: rq.wq.cc %d, rq.wq.pc %d\n", *(unsigned __int16 *)(a2 + 20), *(unsigned __int16 *)(a2 + 18));
      }
      IOSleep(1uLL);
      (*(void (**)(uint64_t))(a2 + 152))(a2 + 128);
      int v4 = *(unsigned __int16 *)(a2 + 20);
      if (v4 == (unsigned __int16)v3)
      {
        if (v5 > 0xFE) {
          goto LABEL_14;
        }
        ++v5;
      }
      else
      {
        unsigned int v5 = 0;
        LOWORD(v3) = *(_WORD *)(a2 + 20);
      }
      if (v4 == *(unsigned __int16 *)(a2 + 18)) {
        goto LABEL_14;
      }
    }
    int v4 = *(unsigned __int16 *)(a2 + 20);
LABEL_14:
    int v3 = *(unsigned __int16 *)(a2 + 18);
  }
  if ((dword_1000284F8 & 4) != 0)
  {
    IOLog("mlx5: drainRQ phase 2: rq.wq.cc %d, rq.wq.pc %d\n", v4, v3);
    int v4 = *(unsigned __int16 *)(a2 + 20);
    int v3 = *(unsigned __int16 *)(a2 + 18);
  }
  if (v4 != v3)
  {
    do
    {
      uint64_t v6 = *(void *)(*(void *)(a2 + 32) + 8 * (unsigned __int16)(*(_WORD *)(a2 + 16) & v4));
      if ((dword_1000284F8 & 4) != 0) {
        IOLog("mlx5: drainRQ rq.wq.cc=%d dma=0x%llx\n", (unsigned __int16)v4, *(void *)(v6 + 8) + *(unsigned int *)(v6 + 68));
      }
      v8.ivars = (IOUserNetworkPacket_IVars *)(v6 - 8);
      *(void *)uint8_t readData = 0;
      IOUserNetworkPacket::GetPacketBufferPool(&v8, (IOUserNetworkPacketBufferPool **)readData);
      (*(void (**)(void, IOUserNetworkPacket *))(**(void **)readData + 64))(*(void *)readData, &v8);
      LOWORD(v4) = *(_WORD *)(a2 + 20) + 1;
      *(_WORD *)(a2 + 20) = v4;
    }
    while (*(unsigned __int16 *)(a2 + 18) != (unsigned __int16)v4);
  }
}

double sub_1000040DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(v2 + 40);
  *(unsigned char *)(a2 + 73) = *(unsigned char *)(v2 + 73);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(v2 + 64);
  double result = *(double *)(v2 + 56);
  *(double *)(a2 + 56) = result;
  *(_WORD *)(a2 + 99) = *(_WORD *)(a2 + 99) & 0xFDFF | *(_WORD *)(v2 + 99) & 0x200;
  return result;
}

uint64_t sub_10000411C(uint64_t a1)
{
  do
  {
    uint64_t result = a1;
    a1 = *(void *)(a1 + 16);
  }
  while (a1);
  if (*(_DWORD *)(result + 8))
  {
    IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(result + 48));
    return 0;
  }
  return result;
}

uint64_t sub_100004168(uint64_t result, int a2)
{
  *(_DWORD *)(result + 44) = a2;
  *(void *)(result + 24) = result + 24;
  *(void *)(result + 32) = result + 24;
  return result;
}

void sub_100004178(int a1, char *__s, uint64_t a3)
{
  if (a3) {
    ++*(_DWORD *)(a3 + 44);
  }
  strlen(__s);
  operator new[]();
}

void sub_100004254(uint64_t a1, uint64_t a2, char *__s, int a4)
{
  *(_DWORD *)(a1 + 44) = a4;
  *(void *)(a1 + 24) = a1 + 24;
  *(void *)(a1 + 32) = a1 + 24;
  sub_100004178(a1, __s, a2);
}

void *sub_100004270(void *result)
{
  *uint64_t result = off_1000243A8;
  if (result[6]) {
    operator delete();
  }
  return result;
}

void *sub_1000042CC(void *result)
{
  *uint64_t result = off_1000243A8;
  if (result[6]) {
    operator delete();
  }
  return result;
}

void sub_100004328(void *a1)
{
  *a1 = off_1000243A8;
  if (a1[6]) {
    operator delete();
  }
  operator delete();
}

uint64_t sub_1000043A4(uint64_t result)
{
  return result;
}

uint64_t sub_1000043B4(uint64_t a1)
{
  uint64_t v1 = a1;
  int v3 = (_DWORD *)(a1 + 44);
  int v2 = *(_DWORD *)(a1 + 44);
  if (v2 <= 0) {
    sub_10001BC0C(a1, v2, v3);
  }
  *int v3 = v2 - 1;
  if (v2 == 1)
  {
    if (*(void *)(a1 + 16))
    {
      uint64_t v4 = *(void *)(a1 + 24);
      unsigned int v5 = *(void **)(a1 + 32);
      *(void *)(v4 + 8) = v5;
      void *v5 = v4;
      *(void *)(a1 + 24) = a1 + 24;
      *(void *)(a1 + 32) = a1 + 24;
    }
    (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
    *(unsigned char *)(v1 + 40) = 1;
    uint64_t v6 = *(void *)(v1 + 16);
    if (v6) {
      sub_1000043B4(v6, 0);
    }
    if (*(_DWORD *)(v1 + 8) == 4)
    {
      if (dword_1000284F8)
      {
        uint64_t v8 = *(void *)(v1 + 16);
        if (v8) {
          int v9 = *(const char **)(v8 + 48);
        }
        else {
          int v9 = "(ROOT)";
        }
        IOLog("mlx5:%s:%d FSBase::release(%p = %s, %s, %d) %s\n", "release", 188, (const void *)v1, *(const char **)(v1 + 48), v9, *(_DWORD *)(v1 + 44), "FS_TYPE_FLOW_ENTRY");
      }
      (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
      return 0;
    }
  }
  return v1;
}

uint64_t sub_1000044F8(uint64_t a1)
{
  if (dword_1000284F8)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    if (v6) {
      unint64_t v7 = *(const char **)(v6 + 48);
    }
    else {
      unint64_t v7 = "(ROOT)";
    }
    IOLog("mlx5:%s:%d FSBase::removeNode(%p = %s, %s, %d) %s\n", "removeNode", 201, (const void *)a1, *(const char **)(a1 + 48), v7, *(_DWORD *)(a1 + 44), off_100024368[*(unsigned int *)(a1 + 8)]);
  }
  int v3 = (int *)(a1 + 44);
  int v2 = *(_DWORD *)(a1 + 44);
  if (v2 != 1) {
    sub_10001BD3C(a1, v2, (_DWORD *)(a1 + 44));
  }
  uint64_t result = sub_1000043B4(a1);
  if (result)
  {
    if (*v3) {
      sub_10001BCA4(a1, *v3, (_DWORD *)(a1 + 44));
    }
    unsigned int v5 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v5();
  }
  return result;
}

void sub_100004608()
{
}

uint64_t sub_1000046BC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 596) != *(_DWORD *)(a1 + 592)) {
    operator new();
  }
  return 0;
}

uint64_t sub_100004820(uint64_t a1)
{
  int v3 = (void *)(a1 + 72);
  int v2 = *(void **)(a1 + 72);
  if (v2 != v3)
  {
    do
    {
      --*(_DWORD *)(a1 + 56);
      unsigned int v5 = (void *)*v2;
      uint64_t v4 = (void *)v2[1];
      v5[1] = v4;
      void *v4 = v5;
      (*(void (**)(void))(*(v2 - 3) + 8))();
      int v2 = v5;
    }
    while (v5 != v3);
  }
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v6 = *(void **)(a1 + 32);
  *(void *)(v7 + 8) = v6;
  *uint64_t v6 = v7;
  --*(_DWORD *)(*(void *)(a1 + 16) + 596);
  uint64_t v8 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 8);
  return v8(a1);
}

void sub_1000048F0()
{
}

uint64_t sub_100004A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 112) + 72);
  uint64_t v4 = *(void *)(v3 - 8);
  *(void *)(v3 + 40) = a3;
  if (a3)
  {
    memset(v11, 0, sizeof(v11));
    uint64_t result = sub_100016D74(a2, *(unsigned __int16 *)(a1 + 96), (unsigned char *)(v4 + 601), v11, *(_DWORD *)(a1 + 100), *(_DWORD *)(a1 + 92), *(_DWORD *)(v4 + 64), *(_DWORD *)(*(void *)(a1 + 104) + 600), (__n128)0, *(_DWORD *)(v4 + 60), *(unsigned __int8 *)(v4 + 600), *(_DWORD *)(v4 + 56), (void *)(v4 + 72));
    if (!result) {
      ++*(_DWORD *)(a3 + 44);
    }
  }
  else
  {
    int v7 = *(unsigned __int16 *)(a1 + 96);
    int v8 = *(_DWORD *)(a1 + 100);
    int v9 = *(_DWORD *)(a1 + 92);
    unsigned int v10 = *(_DWORD *)(v4 + 64);
    return sub_100016FA8(a2, v7, (unsigned char *)(v4 + 601), v8, v9, v10);
  }
  return result;
}

uint64_t sub_100004B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  do
  {
    uint64_t v6 = v5;
    uint64_t v5 = *(void *)(v5 + 16);
  }
  while (v5);
  uint64_t v7 = 3758097088;
  if (*(_DWORD *)(v6 + 8))
  {
    IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(v6 + 48));
  }
  else
  {
    uint64_t v8 = *(void *)(v6 + 88);
    if (v8)
    {
      int v9 = (void *)(a3 + 56);
      for (uint64_t i = *(void **)(a3 + 56); i != v9; uint64_t i = (void *)*i)
      {
        if (*((_DWORD *)i - 4) == 2)
        {
          uint64_t v11 = *(void *)(*(void *)(i[11] + 72) + 40);
          if (v11 != a4)
          {
            if (sub_100004A78((uint64_t)(i - 3), v8, a4))
            {
              IOLog("mlx5: flow steering can't connect prev and next\n");
              return 0;
            }
            if (v11) {
              sub_1000043B4(v11);
            }
          }
        }
      }
      return 0;
    }
  }
  return v7;
}

uint64_t sub_100004C74(uint64_t a1)
{
  do
  {
    uint64_t v1 = a1;
    a1 = *(void *)(a1 + 16);
  }
  while (a1);
  if (!*(_DWORD *)(v1 + 8)) {
    return *(void *)(v1 + 88);
  }
  IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(v1 + 48));
  return 0;
}

void sub_100004CC4(uint64_t a1)
{
  bzero(v2, 0x400uLL);
  unsigned int v3 = bswap32(*(_DWORD *)(a1 + 84));
  unsigned int v4 = v3;
  sub_1000048F0();
}

const char **sub_100004F44(const char **result)
{
  if (result)
  {
    uint64_t v1 = result;
    do
    {
      int v2 = (char *)v1[2];
      uint64_t result = sub_100005F34((const char **)v2, (const char ***)v1 + 3);
      uint64_t v1 = (const char **)*((void *)v2 + 2);
      if (result) {
        BOOL v3 = 1;
      }
      else {
        BOOL v3 = v1 == 0;
      }
      if (!v3) {
        uint64_t result = sub_100005E14(*((void *)v2 + 2), (uint64_t **)v2 + 3);
      }
      if (result) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = v1 == 0;
      }
    }
    while (!v4);
  }
  return result;
}

const char **sub_100004FA4(const char **result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = a2;
    uint64_t v3 = *(void *)(a2 + 56);
    if ((const char **)(v3 - 24) != result && v3 != a2 + 56 || a2 == 0)
    {
      return 0;
    }
    else
    {
      do
      {
        uint64_t v6 = *(void *)(v2 + 16);
        uint64_t result = sub_100005D04((const char **)v6, (void *)(v2 + 24));
        uint64_t v2 = *(void *)(v6 + 16);
        if (result) {
          BOOL v7 = 1;
        }
        else {
          BOOL v7 = v2 == 0;
        }
        if (!v7) {
          uint64_t result = sub_100005BE4(*(void *)(v6 + 16), (void *)(v6 + 24));
        }
        if (result) {
          BOOL v8 = 1;
        }
        else {
          BOOL v8 = v2 == 0;
        }
      }
      while (!v8);
    }
  }
  return result;
}

uint64_t sub_100005028(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = a2;
  do
  {
    uint64_t v5 = v4;
    uint64_t v4 = *(void *)(v4 + 16);
  }
  while (v4);
  if (*(_DWORD *)(v5 + 8)) {
    sub_10001BE18(v5);
  }
  uint64_t v6 = sub_100004FA4((const char **)a1, a2);
  BOOL v7 = sub_100004F44((const char **)v2);
  uint64_t v8 = (uint64_t)v7;
  if (v6)
  {
    if (sub_100004B8C((uint64_t)v7, v2, (uint64_t)v6[2], (uint64_t)v7)) {
      IOLog("mlx5: flow steering can't connect prev and next of flow table\n");
    }
    sub_1000043B4((uint64_t)v6);
  }
  uint64_t v9 = *(void *)(v5 + 88);
  uint64_t v10 = *(void *)(*(void *)(a1 + 112) + 72);
  uint64_t v11 = *(void *)(v10 - 8);
  *(void *)(v10 + 40) = 0;
  int v12 = sub_100016FA8(v9, *(unsigned __int16 *)(a1 + 96), (unsigned char *)(v11 + 601), *(_DWORD *)(a1 + 100), *(_DWORD *)(a1 + 92), *(_DWORD *)(v11 + 64));
  if (v8)
  {
    int v13 = v12;
    sub_1000043B4(v8);
    if (!v13) {
      sub_1000043B4(v8);
    }
  }
  do
  {
    uint64_t v14 = v2;
    uint64_t v2 = *(void *)(v2 + 16);
  }
  while (v2);
  if (*(_DWORD *)(v14 + 8))
  {
    IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(v14 + 48));
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = *(void *)(v14 + 88);
  }
  int v16 = sub_100016CF0(v15, *(unsigned __int16 *)(a1 + 96), *(_DWORD *)(a1 + 100), *(_DWORD *)(a1 + 92), *(_DWORD *)(*(void *)(a1 + 104) + 600));
  if (v16 != -536870185 && v16 != 0) {
    IOLog("mlx5: flow steering can't destroy star entry group(index:%d) of ft:%s\n", *(_DWORD *)(*(void *)(a1 + 104) + 588), *(const char **)(a1 + 48));
  }
  sub_100004820(*(void *)(a1 + 112));
  *(void *)(a1 + 112) = 0;
  uint64_t result = *(void *)(a1 + 104);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *(void *)(a1 + 104) = 0;
  return result;
}

uint64_t *sub_1000051D8(uint64_t a1, int a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 56);
  uint64_t v2 = (uint64_t *)(a1 + 56);
  for (uint64_t i = v4; ; uint64_t i = (uint64_t *)*i)
  {
    if (i == v2) {
      return 0;
    }
    if (*((_DWORD *)i - 4) == 1 && *((_DWORD *)i + 15) == a2) {
      break;
    }
  }
  return i - 3;
}

uint64_t sub_100005214(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(uint64_t **)(result + 56);
    if (v3 == (uint64_t *)(result + 56))
    {
      int v4 = 0;
    }
    else
    {
      int v4 = 0;
      do
      {
        if (*((_DWORD *)v3 - 4) == 1)
        {
          if (v3 - 3 == a2) {
            break;
          }
          v4 += *((_DWORD *)v3 + 12);
        }
        uint64_t v3 = (uint64_t *)*v3;
      }
      while (v3 != (uint64_t *)(result + 56));
    }
    uint64_t v5 = *(void *)(result + 16);
    if (v5)
    {
      if (dword_1000284F8) {
        IOLog("mlx5:%s:%d FlowNamespace::allocNewLevel() : (prio->type == FS_TYPE_PRIO) = %d\n", "allocNewLevel", 506, *(_DWORD *)(v5 + 8) == 1);
      }
    }
    return sub_1000052E8(v5, v2) + v4;
  }
  return result;
}

uint64_t *sub_1000052E8(uint64_t *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result[8];
    if ((uint64_t *)v2 != result + 7)
    {
      int v3 = 0;
      while (1)
      {
        int v4 = *(_DWORD *)(v2 - 16);
        if (v4)
        {
          if (v4 == 2) {
            return (uint64_t *)(v3 + *(_DWORD *)(v2 + 64) + 1);
          }
        }
        else
        {
          if (v2 - 24 == a2) {
            return (uint64_t *)(sub_100005214(result[2], result) + v3);
          }
          for (uint64_t i = *(uint64_t **)(v2 + 32); i != (uint64_t *)(v2 + 32); uint64_t i = (uint64_t *)*i)
          {
            if (*((_DWORD *)i - 4) == 1) {
              v3 += *((_DWORD *)i + 12);
            }
          }
        }
        uint64_t v2 = *(void *)(v2 + 8);
        if ((uint64_t *)v2 == result + 7) {
          return (uint64_t *)(sub_100005214(result[2], result) + v3);
        }
      }
    }
    int v3 = 0;
    return (uint64_t *)(sub_100005214(result[2], result) + v3);
  }
  return result;
}

uint64_t sub_1000053A0(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = *(void *)(a1 + 96);
  if (v4) {
    unsigned int v5 = *(_DWORD *)(v4 + 88);
  }
  else {
    unsigned int v5 = 0x7FFFFFFF;
  }
  if (a2[22] >= v5) {
    return 0;
  }
  uint64_t v6 = sub_100016ACC(*(void *)(a1 + 88), a2[25], a2[23]);
  if (v6) {
    IOLog("mlx5: Update root flow table of id=%u failed\n", a2[23]);
  }
  else {
    *(void *)(a1 + 96) = a2;
  }
  return v6;
}

uint64_t sub_100005434(uint64_t a1, int a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 56);
  if (v2 != (uint64_t *)(a1 + 56))
  {
    while (*((_DWORD *)v2 - 4) != 1 || *((_DWORD *)v2 + 15) != a2)
    {
      uint64_t v2 = (uint64_t *)*v2;
      if (v2 == (uint64_t *)(a1 + 56)) {
        return 0;
      }
    }
    do
    {
      uint64_t v3 = a1;
      a1 = *(void *)(a1 + 16);
    }
    while (a1);
    if (*(_DWORD *)(v3 + 8)) {
      sub_10001BE5C(v3);
    }
    if (*((_DWORD *)v2 + 13) != *((_DWORD *)v2 + 12)) {
      operator new();
    }
  }
  return 0;
}

uint64_t sub_1000056D0(uint64_t a1)
{
  uint64_t v2 = a1;
  do
  {
    uint64_t v3 = v2;
    uint64_t v2 = *(void *)(v2 + 16);
  }
  while (v2);
  if (*(_DWORD *)(v3 + 8))
  {
    IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(v3 + 48));
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)(v3 + 88);
  }
  uint64_t result = sub_100016BDC(v4, *(unsigned __int16 *)(a1 + 96), *(_DWORD *)(a1 + 100), *(_DWORD *)(a1 + 92));
  if (result != -536870185 && result != 0) {
    uint64_t result = IOLog("mlx5: flow steering can't destroy ft %s\n", *(const char **)(a1 + 48));
  }
  --*(_DWORD *)(*(void *)(a1 + 16) + 76);
  return result;
}

uint64_t sub_100005778(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 96) == a2)
  {
    unsigned int v5 = *(const char ***)(a2 + 16);
    uint64_t v6 = *(const char ***)(a2 + 24);
    if (v6 == v5 + 7)
    {
      BOOL v7 = sub_100004F44(v5);
      uint64_t v8 = v7;
      if (!v7)
      {
        uint64_t v2 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      BOOL v7 = 0;
      uint64_t v8 = v6 - 3;
    }
    uint64_t v9 = sub_100016ACC(*(void *)(a1 + 88), *((_DWORD *)v8 + 25), *((_DWORD *)v8 + 23));
    uint64_t v2 = v9;
    if (v9 != -536870185 && v9 != 0)
    {
      IOLog("mlx5: Update root flow table of id=%u failed\n", *(_DWORD *)(a2 + 92));
      if (!v7) {
        return v2;
      }
      goto LABEL_14;
    }
LABEL_13:
    *(void *)(a1 + 96) = v8;
    if (!v7) {
      return v2;
    }
LABEL_14:
    sub_1000043B4((uint64_t)v7);
    return v2;
  }
  return 0;
}

uint64_t sub_100005854(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = v2;
  do
  {
    uint64_t v4 = v3;
    uint64_t v3 = *(void *)(v3 + 16);
  }
  while (v3);
  if (*(_DWORD *)(v4 + 8)) {
    sub_10001BEA0(v4);
  }
  if ((*(unsigned char *)(v2 + 88) & 1) != 0 && (unsigned int v5 = *(_DWORD *)(a1 + 120), v5 >= 2))
  {
    *(_DWORD *)(a1 + 120) = v5 - 1;
    sub_1000043B4(a1);
  }
  else
  {
    uint64_t result = sub_100005778(v4, a1);
    if (result) {
      return result;
    }
    sub_100005028(a1, v2);
    sub_1000044F8(a1);
  }
  return 0;
}

void sub_1000058E8()
{
}

uint64_t sub_100005A48(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 72))
  {
    uint64_t v2 = a1;
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = *(void *)(v2 + 16);
    }
    while (v2);
    if (*(_DWORD *)(v3 + 8)) {
      IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(v3 + 48));
    }
    sub_1000058E8();
  }
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d FlowTable::createFlowGroup(): autogroup.active\n", "createFlowGroup", 742);
  }
  return 0;
}

uint64_t sub_100005B14(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v2 + 72)) {
    --*(_DWORD *)(v2 + 80);
  }
  uint64_t v3 = a1;
  do
  {
    uint64_t v4 = v3;
    uint64_t v3 = *(void *)(v3 + 16);
  }
  while (v3);
  if (*(_DWORD *)(v4 + 8))
  {
    IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(v4 + 48));
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = *(void *)(v4 + 88);
  }
  uint64_t result = sub_100016CF0(v5, *(unsigned __int16 *)(v2 + 96), *(_DWORD *)(v2 + 100), *(_DWORD *)(v2 + 92), *(_DWORD *)(a1 + 600));
  if (result != -536870185 && result != 0)
  {
    return IOLog("mlx5: flow steering can't destroy fg\n");
  }
  return result;
}

uint64_t sub_100005BDC(uint64_t a1)
{
  return sub_1000044F8(a1);
}

const char **sub_100005BE4(uint64_t a1, void *a2)
{
  if (a1)
  {
    if (dword_1000284F8) {
      IOLog("mlx5:%s:%d FlowTable::_findFirstReverse(%p = %s, %p), prio->type ==  %d\n", "_findFirstReverse", 839, (const void *)a1, *(const char **)(a1 + 48), a2, *(_DWORD *)(a1 + 8));
    }
    for (uint64_t i = a2[1]; i != a1 + 56; uint64_t i = *(void *)(i + 8))
    {
      uint64_t v5 = i - 24;
      int v6 = *(_DWORD *)(i - 16);
      if (v6)
      {
        if (v6 == 2)
        {
          ++*(_DWORD *)(i + 20);
          return (const char **)v5;
        }
      }
      else
      {
        if (dword_1000284F8) {
          IOLog("mlx5:%s:%d FlowTable::_findFirstReverse(), (ns->type == FS_TYPE_NAMESPACE) is %d\n", "_findFirstReverse", 850, 1);
        }
        BOOL v7 = sub_100005D04((const char **)(i - 24), (void *)(i + 32));
        if (v7) {
          return v7;
        }
      }
    }
  }
  return 0;
}

const char **sub_100005D04(const char **result, void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (dword_1000284F8) {
      IOLog("mlx5:%s:%d FlowTable::findFirstReverse(%p = %s, %p)\n", "findFirstReverse", 874, result, result[6], a2);
    }
    uint64_t v4 = a2[1];
    if ((const char **)v4 == v3 + 7)
    {
      return 0;
    }
    else
    {
      while (1)
      {
        if (*(_DWORD *)(v4 - 16) == 1)
        {
          if (dword_1000284F8) {
            IOLog("mlx5:%s:%d FlowTable::findFirstReverse(iterator) prio is %p = %s, %d\n", "findFirstReverse", 882, (const void *)(v4 - 24), *(const char **)(v4 + 24), 1);
          }
          uint64_t result = (const char **)sub_100005BE4(v4 - 24, v4 + 32);
          if (result) {
            break;
          }
        }
        uint64_t v4 = *(void *)(v4 + 8);
        if ((const char **)v4 == v3 + 7) {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100005E08(uint64_t a1, void *a2)
{
  if (a1) {
    return (uint64_t)sub_100005BE4(a1, a2);
  }
  return a1;
}

const char **sub_100005E14(uint64_t a1, uint64_t **a2)
{
  if (a1)
  {
    if (dword_1000284F8) {
      IOLog("mlx5:%s:%d FlowTable::_findFirst(%p = %s, %p), prio->type ==  %d\n", "_findFirst", 926, (const void *)a1, *(const char **)(a1 + 48), a2, *(_DWORD *)(a1 + 8));
    }
    for (uint64_t i = *a2; i != (uint64_t *)(a1 + 56); uint64_t i = (uint64_t *)*i)
    {
      uint64_t v5 = i - 3;
      int v6 = *((_DWORD *)i - 4);
      if (v6)
      {
        if (v6 == 2)
        {
          ++*((_DWORD *)i + 5);
          return (const char **)v5;
        }
      }
      else
      {
        if (dword_1000284F8) {
          IOLog("mlx5:%s:%d FlowTable::_findFirst(), (ns->type == FS_TYPE_NAMESPACE) is %d\n", "_findFirst", 937, 1);
        }
        BOOL v7 = sub_100005F34((const char **)i - 3, (const char ***)i + 4);
        if (v7) {
          return v7;
        }
      }
    }
  }
  return 0;
}

const char **sub_100005F34(const char **result, const char ***a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (dword_1000284F8) {
      IOLog("mlx5:%s:%d FlowTable::findFirst(%p = %s, %p)\n", "findFirst", 961, result, result[6], a2);
    }
    uint64_t v4 = *a2;
    if (*a2 == v3 + 7)
    {
      return 0;
    }
    else
    {
      while (1)
      {
        if (*((_DWORD *)v4 - 4) == 1)
        {
          if (dword_1000284F8) {
            IOLog("mlx5:%s:%d FlowTable::findFirst(iterator) prio is %p = %s, %d\n", "findFirst", 968, v4 - 3, v4[3], 1);
          }
          uint64_t result = (const char **)sub_100005E14(v4 - 3, v4 + 4);
          if (result) {
            break;
          }
        }
        uint64_t v4 = (const char **)*v4;
        if (v4 == v3 + 7) {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_100006038(uint64_t a1, uint64_t **a2)
{
  if (a1) {
    return (uint64_t)sub_100005E14(a1, a2);
  }
  return a1;
}

uint64_t sub_100006044(uint64_t a1, int a2, const void *a3)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d FlowTable::createAutogroup()\n", "createAutogroup", 1004);
  }
  if (*(unsigned char *)(a1 + 72))
  {
    bzero(v19, 0x400uLL);
    unsigned int v6 = *(_DWORD *)(a1 + 76);
    if (*(_DWORD *)(a1 + 80) >= v6)
    {
      int v9 = 1;
    }
    else
    {
      unsigned int v7 = *(_DWORD *)(a1 + 84);
      unsigned int v8 = v6 + 1;
      if (v8 > v7)
      {
        IOLog("mlx5: flow steering can't create group size of 0\n", v17, v18);
        return 0;
      }
      int v9 = v7 / v8;
    }
    uint64_t v10 = *(uint64_t **)(a1 + 56);
    if (v10 == (uint64_t *)(a1 + 56))
    {
      unsigned int v11 = 0;
    }
    else
    {
      unsigned int v11 = 0;
      do
      {
        if (*((_DWORD *)v10 - 4) == 3)
        {
          unsigned int v12 = *((_DWORD *)v10 + 141);
          if (v11 + v9 <= v12) {
            break;
          }
          unsigned int v11 = *((_DWORD *)v10 + 142) + v12;
        }
        uint64_t v10 = (uint64_t *)*v10;
      }
      while (v10 != (uint64_t *)(a1 + 56));
    }
    unsigned int v13 = v11 + v9;
    if (v13 <= *(_DWORD *)(a1 + 84))
    {
      int v22 = a2 << 24;
      unsigned int v20 = bswap32(v11);
      unsigned int v21 = bswap32(v13 - 1);
      memcpy(v23, a3, sizeof(v23));
      uint64_t v15 = a1;
      do
      {
        uint64_t v16 = v15;
        uint64_t v15 = *(void *)(v15 + 16);
      }
      while (v15);
      if (*(_DWORD *)(v16 + 8)) {
        IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(v16 + 48));
      }
      sub_1000058E8();
    }
    IOLog("mlx5: FlowTable::createAutogroup() exceeding max_fte: %d > %d\n");
  }
  else if (dword_1000284F8)
  {
    IOLog("mlx5:%s:%d FlowTable::createAutogroup(): !autogroup.active\n");
  }
  return 0;
}

void sub_100006218()
{
}

void sub_1000063A0()
{
}

uint64_t sub_100006468(uint64_t a1, uint64_t **a2)
{
  uint64_t result = *(unsigned int *)(a1 + 588);
  if (a2) {
    *a2 = (uint64_t *)(a1 + 56);
  }
  unsigned int v6 = *(uint64_t **)(a1 + 56);
  uint64_t v4 = (uint64_t *)(a1 + 56);
  for (uint64_t i = v6; i != v4; uint64_t i = (uint64_t *)*i)
  {
    if (*((_DWORD *)i - 4) == 4)
    {
      if (*((_DWORD *)i + 10) != result) {
        return result;
      }
      uint64_t result = (result + 1);
      if (a2) {
        *a2 = i;
      }
    }
  }
  return result;
}

void sub_1000064B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t **a5)
{
}

void sub_100006574()
{
}

uint64_t sub_100006618(uint64_t a1)
{
  uint64_t v2 = a1;
  do
  {
    uint64_t v3 = v2;
    uint64_t v2 = *(void *)(v2 + 16);
  }
  while (v2);
  if (*(_DWORD *)(v3 + 8))
  {
    IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(v3 + 48));
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = *(void *)(v3 + 88);
  }
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(v5 + 16);
  uint64_t result = (uint64_t)memcpy(__dst, (const void *)(v5 + 88), sizeof(__dst));
  uint64_t v9 = *(void *)(v6 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  uint64_t v10 = *(void **)(a1 + 32);
  *(void *)(v11 + 8) = v10;
  *uint64_t v10 = v11;
  int v12 = *(_DWORD *)(v5 + 56) - 1;
  *(_DWORD *)(v5 + 56) = v12;
  if (v12)
  {
    uint64_t result = sub_100016D74(v4, *(unsigned __int16 *)(v9 + 96), (unsigned char *)(v5 + 601), __dst, *(_DWORD *)(v9 + 100), *(_DWORD *)(v9 + 92), *(_DWORD *)(v5 + 64), *(_DWORD *)(v6 + 600), v8, *(_DWORD *)(v5 + 60), *(unsigned __int8 *)(v5 + 600), v12, (void *)(v5 + 72));
    if (result) {
      return IOLog("mlx5: %s can't delete dst %s\n", "cmdRemoveNode", *(const char **)(a1 + 48));
    }
  }
  return result;
}

uint64_t sub_10000671C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(v2 + 16);
  uint64_t v4 = a1;
  do
  {
    uint64_t v5 = v4;
    uint64_t v4 = *(void *)(v4 + 16);
  }
  while (v4);
  if (*(_DWORD *)(v5 + 8))
  {
    IOLog("mlx5: flow steering node %s is not in tree\n", *(const char **)(v5 + 48));
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(v5 + 88);
  }
  uint64_t result = sub_100016FA8(v6, *(unsigned __int16 *)(v3 + 96), (unsigned char *)(a1 + 601), *(_DWORD *)(v3 + 100), *(_DWORD *)(v3 + 92), *(_DWORD *)(a1 + 64));
  if (result != -536870185 && result != 0) {
    uint64_t result = IOLog("mlx5: flow steering can't delete fte %s\n", *(const char **)(a1 + 48));
  }
  --*(_DWORD *)(v2 + 596);
  return result;
}

uint64_t sub_1000067D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = 0;
  for (uint64_t i = *(uint64_t **)(a1 + 56); i != (uint64_t *)(a1 + 56); uint64_t i = (uint64_t *)*i)
  {
    if (*((_DWORD *)i - 4) == 4)
    {
      if (*(unsigned char *)(a1 + 72))
      {
        uint64_t v5 = 0;
        while (((*((unsigned __int8 *)i + v5 + 64) ^ *(unsigned __int8 *)(a2 + v5)) & *(unsigned __int8 *)(a1 + 73 + v5)) == 0)
        {
          if (++v5 == 64) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
        if ((*(unsigned char *)(a1 + 72) & 2) != 0)
        {
          uint64_t v6 = 0;
          while (((*((unsigned __int8 *)i + v6 + 128) ^ *(unsigned __int8 *)(a2 + 64 + v6)) & *(unsigned __int8 *)(a1 + 137 + v6)) == 0)
          {
            if (++v6 == 64) {
              goto LABEL_11;
            }
          }
        }
        else
        {
LABEL_11:
          if ((*(unsigned char *)(a1 + 72) & 4) != 0)
          {
            uint64_t v7 = 0;
            while (((*((unsigned __int8 *)i + v7 + 192) ^ *(unsigned __int8 *)(a2 + 128 + v7)) & *(unsigned __int8 *)(a1 + 201 + v7)) == 0)
            {
              if (++v7 == 64) {
                goto LABEL_15;
              }
            }
          }
          else
          {
LABEL_15:
            if (*((unsigned __int8 *)i + 576) == a3 && *((_DWORD *)i + 9) == a4) {
              sub_100006218();
            }
          }
        }
      }
    }
  }
  if (*(_DWORD *)(a1 + 596) != *(_DWORD *)(a1 + 592)) {
    sub_1000064B8(a1, a2, a3, a4, &v9);
  }
  return 0;
}

uint64_t sub_1000069E8(uint64_t a1, int a2, void *__s2, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = a1 + 56;
  int v12 = *(uint64_t **)(a1 + 56);
  ++*(_DWORD *)(a1 + 44);
  while (v12 != (uint64_t *)v13)
  {
    if (*((_DWORD *)v12 - 4) == 3 && *((unsigned __int8 *)v12 + 48) == a2 && !memcmp((char *)v12 + 49, __s2, 0x200uLL))
    {
      uint64_t v16 = sub_1000067D8((uint64_t)(v12 - 3), a4, a5, a6);
      sub_1000043B4(a1);
      return v16;
    }
    int v12 = (uint64_t *)*v12;
  }
  uint64_t v14 = sub_100006044(a1, a2, __s2);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = sub_1000067D8(v14, a4, a5, a6);
    sub_1000043B4(a1);
    if (!v16)
    {
      ++*(_DWORD *)(v15 + 44);
      sub_1000044F8(v15);
    }
  }
  else
  {
    sub_1000043B4(a1);
    return 0;
  }
  return v16;
}

void sub_100006B2C(uint64_t a1, int a2, void *a3, uint64_t a4, unsigned __int8 a5, uint64_t a6)
{
}

uint64_t sub_100006BE0(void *a1)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d FlowRule::del(%p parent=%s)\n", "del", 1276, a1, *(const char **)(a1[2] + 48));
  }
  return sub_1000044F8((uint64_t)a1);
}

void sub_100006C58()
{
}

uint64_t sub_100006D44(uint64_t result)
{
  *(_DWORD *)(result + 8) = 0;
  *(void *)(result + 56) = result + 56;
  *(void *)(result + 64) = result + 56;
  return result;
}

void sub_100006D54(uint64_t a1, int a2, const char *a3)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d FlowRootNamespace::create(%x, %s)\n", "create", 1311, a2, a3);
  }
  operator new();
}

void sub_100006E34()
{
}

uint64_t sub_100006EE4(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(_DWORD *)a3) {
    sub_100006E34();
  }
  if (*(_DWORD *)a3 != 1) {
    return 3758096385;
  }
  if (*(_DWORD *)(a3 + 52) <= a2)
  {
    unint64_t v3 = *(void *)(a3 + 32);
    if (!v3) {
      goto LABEL_14;
    }
    uint64_t v4 = a1 + 29032;
    uint64_t v5 = *(uint64_t **)(a3 + 40);
    uint64_t v6 = *v5 + 31;
    if (*v5 >= 0) {
      uint64_t v6 = *v5;
    }
    if ((bswap32(*(_DWORD *)(v4 + 4 * (v6 >> 5))) >> ~*v5))
    {
      uint64_t v7 = 1;
      do
      {
        unint64_t v8 = v7;
        if (v3 == v7) {
          break;
        }
        uint64_t v9 = v5[v7];
        uint64_t v10 = v9 + 31;
        if (v9 >= 0) {
          uint64_t v10 = v5[v8];
        }
        char v11 = ~(_BYTE)v9;
        uint64_t v7 = v8 + 1;
      }
      while (((bswap32(*(_DWORD *)(v4 + 4 * (v10 >> 5))) >> v11) & 1) != 0);
      if (v3 <= v8) {
LABEL_14:
      }
        sub_100006C58();
    }
  }
  return 0;
}

uint64_t sub_100007044(uint64_t a1, int a2, uint64_t a3)
{
  if (*(int *)(a3 + 24) < 1) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t result = sub_100006EE4(a1, a2, *(void *)(a3 + 16) + v6);
    if (result) {
      break;
    }
    ++v7;
    v6 += 64;
    if (v7 >= *(int *)(a3 + 24)) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000070CC(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 56);
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2 == (void *)(a1 + 56)) {
    return 0;
  }
  uint64_t v3 = 0;
  do
  {
    if (*((_DWORD *)v2 - 4) == 1) {
      uint64_t v3 = sub_100007134((uint64_t)(v2 - 3)) + v3;
    }
    uint64_t v2 = (void *)*v2;
  }
  while (v2 != v1);
  return v3;
}

uint64_t sub_100007134(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 72);
  if (!v1)
  {
    uint64_t v3 = (void *)(a1 + 56);
    uint64_t v4 = *(void **)(a1 + 56);
    if (v4 == (void *)(a1 + 56))
    {
      uint64_t v1 = 0;
    }
    else
    {
      uint64_t v1 = 0;
      do
      {
        if (!*((_DWORD *)v4 - 4))
        {
          uint64_t v5 = (void *)v4[4];
          if (v5 == v4 + 4)
          {
            int v6 = 0;
          }
          else
          {
            int v6 = 0;
            do
            {
              if (*((_DWORD *)v5 - 4) == 1) {
                v6 += sub_100007134(v5 - 3);
              }
              uint64_t v5 = (void *)*v5;
            }
            while (v5 != v4 + 4);
          }
          uint64_t v1 = (v6 + v1);
        }
        uint64_t v4 = (void *)*v4;
      }
      while (v4 != v3);
    }
    *(_DWORD *)(a1 + 72) = v1;
  }
  return v1;
}

uint64_t sub_1000071F0(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 16) + 16) + 72);
}

void *sub_100007200(uint64_t a1, void *__dst)
{
  return memcpy(__dst, (const void *)(*(void *)(a1 + 16) + 88), 0x200uLL);
}

void *sub_100007218(uint64_t a1, void *__dst)
{
  return memcpy(__dst, (const void *)(*(void *)(*(void *)(a1 + 16) + 16) + 73), 0x200uLL);
}

uint64_t sub_100007234(uint64_t a1)
{
  uint64_t v1 = (uint64_t *)(a1 + 115056);
  uint64_t result = *(void *)(a1 + 115056);
  if (result)
  {
    uint64_t v4 = (void *)(result + 56);
    uint64_t v3 = *(void **)(result + 56);
    if (v3 != (void *)(result + 56))
    {
      do
      {
        if (*((_DWORD *)v3 - 4) == 1)
        {
          uint64_t v5 = (void *)v3[4];
          if (v5 != v3 + 4)
          {
            do
            {
              if (!*((_DWORD *)v5 - 4))
              {
                uint64_t v7 = v5 + 4;
                for (uint64_t i = (void *)v5[4]; i != v7; uint64_t i = (void *)*v7)
                  sub_1000044F8((uint64_t)(i - 3));
              }
              uint64_t v5 = (void *)*v5;
            }
            while (v5 != v3 + 4);
            uint64_t result = *v1;
          }
        }
        uint64_t v3 = (void *)*v3;
      }
      while (v3 != (void *)(result + 56));
      uint64_t v4 = (void *)*v3;
    }
    while (v4 != (void *)(result + 56))
    {
      if (*((_DWORD *)v4 - 4) == 1)
      {
        uint64_t v9 = v4 + 4;
        unint64_t v8 = (void *)v4[4];
        if (v8 != v4 + 4)
        {
          do
          {
            sub_1000044F8((uint64_t)(v8 - 3));
            unint64_t v8 = (void *)*v9;
          }
          while ((void *)*v9 != v9);
          uint64_t result = *v1;
        }
      }
      uint64_t v4 = (void *)*v4;
    }
    while (1)
    {
      uint64_t v10 = *(void *)(result + 56);
      if (v10 == result + 56) {
        break;
      }
      sub_1000044F8(v10 - 24);
      uint64_t result = *v1;
    }
    uint64_t result = sub_1000044F8(result);
    *uint64_t v1 = 0;
  }
  return result;
}

uint64_t sub_10000736C(uint64_t a1)
{
  uint64_t result = sub_100007234(a1);
  *(void *)(a1 + 115064) = 0;
  return result;
}

void sub_10000739C(uint64_t a1)
{
}

uint64_t sub_10000744C(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 412) & 2) != 0) {
    sub_10000739C(a1);
  }
  uint64_t v2 = *(void *)(a1 + 115056);
  if (v2)
  {
    uint64_t v5 = *(uint64_t **)(v2 + 56);
    uint64_t v3 = v2 + 56;
    for (uint64_t i = v5; ; uint64_t i = (uint64_t *)*i)
    {
      if (i == (uint64_t *)v3)
      {
        uint64_t v2 = 0;
        goto LABEL_11;
      }
      if (*((_DWORD *)i - 4) == 1 && *((_DWORD *)i + 15) == 1) {
        break;
      }
    }
    uint64_t v2 = i[4] - 24;
  }
LABEL_11:
  uint64_t result = 0;
  *(void *)(a1 + 115064) = v2;
  return result;
}

uint64_t sub_1000074D4(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    uint64_t v2 = *(void *)(a1 + 115056);
    if (v2)
    {
      uint64_t v5 = *(uint64_t **)(v2 + 56);
      uint64_t v3 = (uint64_t *)(v2 + 56);
      for (uint64_t i = v5; i != v3; uint64_t i = (uint64_t *)*i)
      {
        if (*((_DWORD *)i - 4) == 1 && *((_DWORD *)i + 15) == 1) {
          return i[4] - 24;
        }
      }
    }
  }
  return 0;
}

void *sub_100007530(void *result)
{
  *uint64_t result = off_1000243A8;
  if (result[6]) {
    operator delete();
  }
  return result;
}

void sub_10000758C(void *a1)
{
  *a1 = off_1000243A8;
  if (a1[6]) {
    operator delete();
  }
  operator delete();
}

void *sub_100007608(void *result)
{
  *uint64_t result = off_1000243A8;
  if (result[6]) {
    operator delete();
  }
  return result;
}

void sub_100007664(void *a1)
{
  *a1 = off_1000243A8;
  if (a1[6]) {
    operator delete();
  }
  operator delete();
}

void *sub_1000076E0(void *result)
{
  *uint64_t result = off_1000243A8;
  if (result[6]) {
    operator delete();
  }
  return result;
}

void sub_10000773C(void *a1)
{
  *a1 = off_1000243A8;
  if (a1[6]) {
    operator delete();
  }
  operator delete();
}

void *sub_1000077B8(void *result)
{
  *uint64_t result = off_1000243A8;
  if (result[6]) {
    operator delete();
  }
  return result;
}

void sub_100007814(void *a1)
{
  *a1 = off_1000243A8;
  if (a1[6]) {
    operator delete();
  }
  operator delete();
}

void *sub_100007890(void *result)
{
  *uint64_t result = off_1000243A8;
  if (result[6]) {
    operator delete();
  }
  return result;
}

void sub_1000078EC(void *a1)
{
  *a1 = off_1000243A8;
  if (a1[6]) {
    operator delete();
  }
  operator delete();
}

void *sub_100007968(void *result)
{
  *uint64_t result = off_1000243A8;
  if (result[6]) {
    operator delete();
  }
  return result;
}

void sub_1000079C4(void *a1)
{
  *a1 = off_1000243A8;
  if (a1[6]) {
    operator delete();
  }
  operator delete();
}

void *sub_100007A40(void *result)
{
  *uint64_t result = off_1000243A8;
  if (result[6]) {
    operator delete();
  }
  return result;
}

void sub_100007A9C(void *a1)
{
  *a1 = off_1000243A8;
  if (a1[6]) {
    operator delete();
  }
  operator delete();
}

void sub_100007B18()
{
  uint64_t v3 = *(IOPCIDevice **)(v0 + 1280);
  uint8_t v4 = *(unsigned char *)(v1 - 17) & 0xFB;
  IOPCIDevice::ConfigurationWrite8(v3, 4uLL, v4);
}

void sub_100007B38(IOPCIDevice *a1)
{
  *(unsigned char *)(v1 - 17) = 0;
  IOPCIDevice::ConfigurationRead8(a1, 4uLL, (uint8_t *)(v1 - 17));
}

uint64_t sub_100007B54(uint64_t a1, _DWORD *a2)
{
  int v8 = 0;
  uint64_t v7 = 0;
  int v6 = 520;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v6, 16, (uint64_t)v4, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v4);
    if (!result) {
      *a2 = bswap32(v5 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_100007BC4(uint64_t a1, _DWORD *a2)
{
  uint64_t v5 = 0;
  int v4 = 776;
  HIDWORD(v5) = bswap32(*a2 & 0xFFFFFF);
  int v6 = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v4, 16, (uint64_t)v3, 16);
  if (!result) {
    return sub_100010B8C(v3);
  }
  return result;
}

uint64_t sub_100007C20(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = sub_100007B54(a1, a2);
  uint64_t v4 = v3;
  if (v3) {
    IOLog("mlx5: allocMapUAR() failed, %d\n", v3);
  }
  else {
    *((void *)a2 + 1) = (unint64_t)*a2 << 14;
  }
  return v4;
}

uint64_t sub_100007C78(uint64_t a1, unsigned int a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (a4) {
    *a4 = 0;
  }
  size_t v8 = (int)(8 * a3 + 16);
  uint64_t v9 = (unsigned int *)((char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v9, v8);
  LOWORD(v15) = 2049;
  HIWORD(v15) = 512;
  WORD1(v16) = bswap32(a2) >> 16;
  HIDWORD(v16) = bswap32(a3);
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d npages %d, outlen %d\n", "reclaimPages", 216, a3, 8 * a3 + 16);
  }
  uint64_t v10 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v15, 16, (uint64_t)v9, 8 * a3 + 16);
  if (v10)
  {
    uint64_t v11 = v10;
    IOLog("mlx5: failed to %s in %s:%d\n", "reclaim pages", "reclaimPages", 219);
  }
  else if (*(unsigned char *)v9)
  {
    return sub_100010B8C((unsigned __int8 *)v9);
  }
  else
  {
    uint64_t v11 = bswap32(v9[2]);
    if (a4) {
      *a4 = v11;
    }
    if ((int)v11 < 1)
    {
      return 0;
    }
    else
    {
      int v12 = (unint64_t *)(v9 + 4);
      do
      {
        unint64_t v13 = *v12++;
        sub_100007DF8(a1, bswap64(v13));
        --v11;
      }
      while (v11);
    }
  }
  return v11;
}

uint64_t sub_100007DF8(uint64_t result, unint64_t a2)
{
  uint64_t v2 = (unint64_t *)(result + 115128);
  unint64_t v3 = *(void *)(result + 115128);
  if (!v3) {
LABEL_6:
  }
    sub_10001BEE4();
  while (1)
  {
    unint64_t v4 = *(void *)(v3 - 32);
    if (a2 >= v4) {
      break;
    }
    v3 += 8;
LABEL_5:
    unint64_t v3 = *(void *)v3;
    if (!v3) {
      goto LABEL_6;
    }
  }
  if (v4 + 0x1FFFF < a2) {
    goto LABEL_5;
  }
  int v5 = *(_DWORD *)(v3 + 40);
  if (v5 == -1)
  {
    uint64_t v6 = *(void *)(result + 115136);
    *(void *)(v3 + 24) = v6;
    *(void *)(v6 + 8) = v3 + 24;
    *(void *)(v3 + 32) = result + 115136;
    *(void *)(result + 115136) = v3 + 24;
  }
  int v7 = v5 & ~(1 << ((a2 - v4) >> 12));
  *(_DWORD *)(v3 + 40) = v7;
  if (!v7)
  {
    uint64_t v8 = v3 - 64;
    uint64_t v10 = *(void *)(v3 + 24);
    uint64_t v9 = *(void **)(v3 + 32);
    *(void *)(v10 + 8) = v9;
    void *v9 = v10;
    unint64_t v11 = *(void *)(v3 + 8);
    if (*(void *)v3)
    {
      if (v11)
      {
        do
        {
          unint64_t v12 = v11;
          unint64_t v11 = *(void *)v11;
        }
        while (v11);
        unint64_t v11 = *(void *)(v12 + 8);
        uint64_t v13 = *(void *)(v12 + 16);
        unint64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
        if (v11)
        {
          unint64_t v15 = *(void *)(v11 + 16) & 1 | v14;
          if ((*(void *)(v11 + 16) & 1) == 0) {
            unint64_t v15 = v13 & 0xFFFFFFFFFFFFFFFELL;
          }
          *(void *)(v11 + 16) = v15;
        }
        uint64_t v16 = v2;
        if (v14)
        {
          uint64_t v16 = (void *)(v14 + 8);
          if (*(void *)v14 == v12) {
            uint64_t v16 = (void *)(v13 & 0xFFFFFFFFFFFFFFFELL);
          }
        }
        int v17 = v13 & 1;
        void *v16 = v11;
        if (v3 == (*(void *)(v12 + 16) & 0xFFFFFFFFFFFFFFFELL)) {
          unint64_t v14 = v12;
        }
        uint64_t v18 = *(void *)(v3 + 16);
        *(_OWORD *)unint64_t v12 = *(_OWORD *)v3;
        *(void *)(v12 + 16) = v18;
        unsigned int v19 = v2;
        unsigned int v20 = (void *)(*(void *)(v3 + 16) & 0xFFFFFFFFFFFFFFFELL);
        if (v20)
        {
          unsigned int v19 = v20 + 1;
          if (*v20 == v3) {
            unsigned int v19 = (void *)(*(void *)(v3 + 16) & 0xFFFFFFFFFFFFFFFELL);
          }
        }
        *unsigned int v19 = v12;
        unint64_t v22 = *(void *)v3;
        uint64_t v21 = *(void *)(v3 + 8);
        unint64_t v23 = *(void *)(v22 + 16) & 1 | v12 & 0xFFFFFFFFFFFFFFFELL;
        if ((*(void *)(v22 + 16) & 1) == 0) {
          unint64_t v23 = v12;
        }
        *(void *)(v22 + 16) = v23;
        if (v21)
        {
          if (*(void *)(v21 + 16)) {
            unint64_t v12 = *(void *)(v21 + 16) & 1 | v12 & 0xFFFFFFFFFFFFFFFELL;
          }
          *(void *)(v21 + 16) = v12;
        }
        if (!v17) {
          goto LABEL_81;
        }
        goto LABEL_147;
      }
      unint64_t v14 = *(void *)(v3 + 16) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v24 = *(void *)(v3 + 16) & 1;
      unint64_t v11 = *(void *)v3;
LABEL_36:
      uint64_t v25 = *(void *)(v11 + 16) & 1 | v14;
      if ((*(void *)(v11 + 16) & 1) == 0) {
        uint64_t v25 = v14;
      }
      *(void *)(v11 + 16) = v25;
    }
    else
    {
      unint64_t v14 = *(void *)(v3 + 16) & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v24 = *(void *)(v3 + 16) & 1;
      if (v11) {
        goto LABEL_36;
      }
    }
    unsigned int v26 = v2;
    if (v14)
    {
      unsigned int v26 = (void *)(v14 + 8);
      if (*(void *)v14 == v3) {
        unsigned int v26 = (void *)v14;
      }
    }
    *unsigned int v26 = v11;
    if (v24) {
      goto LABEL_147;
    }
    while (1)
    {
LABEL_81:
      unint64_t v53 = v11;
      unint64_t v11 = v14;
      if (v53)
      {
        uint64_t v54 = *(void *)(v53 + 16);
        if (v54) {
          goto LABEL_146;
        }
      }
      unint64_t v40 = *v2;
      if (v53 == *v2) {
        goto LABEL_144;
      }
      unint64_t v27 = *(void *)v14;
      if (*(void *)v11 == v53)
      {
        unint64_t v27 = *(void *)(v11 + 8);
        uint64_t v34 = *(void *)(v27 + 16);
        if (v34)
        {
          *(void *)(v27 + 16) = v34 & 0xFFFFFFFFFFFFFFFELL;
          uint64_t v35 = *(void *)(v11 + 16) | 1;
          int v36 = *(void **)v27;
          *(void *)(v11 + 8) = *(void *)v27;
          *(void *)(v11 + 16) = v35;
          if (v36)
          {
            unint64_t v37 = v36[2] & 1 | v11 & 0xFFFFFFFFFFFFFFFELL;
            if ((v36[2] & 1) == 0) {
              unint64_t v37 = v11;
            }
            v36[2] = v37;
            uint64_t v35 = *(void *)(v11 + 16);
          }
          *(void *)(v27 + 16) = v35 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v27 + 16) & 1;
          if ((v35 & 0xFFFFFFFFFFFFFFFELL) != 0)
          {
            uint64_t v38 = *(void *)(v11 + 16);
            uint64_t v39 = (void *)(v38 & 0xFFFFFFFFFFFFFFFELL);
            if (v11 == *(void *)(v38 & 0xFFFFFFFFFFFFFFFELL))
            {
              *uint64_t v39 = v27;
            }
            else
            {
              v39[1] = v27;
              int v36 = *(void **)(v11 + 8);
            }
          }
          else
          {
            unint64_t *v2 = v27;
            uint64_t v38 = *(void *)(v11 + 16);
            unint64_t v40 = v27;
          }
          *(void *)unint64_t v27 = v11;
          uint64_t v48 = v38 & 1;
          BOOL v41 = v48 == 0;
          unint64_t v49 = v48 | v27 & 0xFFFFFFFFFFFFFFFELL;
          if (!v41) {
            unint64_t v27 = v49;
          }
          *(void *)(v11 + 16) = v27;
          unint64_t v27 = (unint64_t)v36;
        }
        unint64_t v50 = *(void *)v27;
        if (*(void *)v27)
        {
          uint64_t v51 = *(void *)(v50 + 16);
          if (v51)
          {
            uint64_t v52 = *(void *)(v27 + 8);
            if (!v52 || (*(unsigned char *)(v52 + 16) & 1) == 0)
            {
              *(void *)(v50 + 16) = v51 & 0xFFFFFFFFFFFFFFFELL;
              uint64_t v61 = *(void *)(v27 + 16) | 1;
              *(void *)(v27 + 16) = v61;
              uint64_t v62 = *(void *)(v50 + 8);
              *(void *)unint64_t v27 = v62;
              if (v62)
              {
                unint64_t v63 = *(void *)(v62 + 16) & 1 | v27 & 0xFFFFFFFFFFFFFFFELL;
                if ((*(void *)(v62 + 16) & 1) == 0) {
                  unint64_t v63 = v27;
                }
                *(void *)(v62 + 16) = v63;
                uint64_t v61 = *(void *)(v27 + 16);
              }
              *(void *)(v50 + 16) = v61 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v50 + 16) & 1;
              if ((v61 & 0xFFFFFFFFFFFFFFFELL) != 0)
              {
                uint64_t v64 = *(void *)(v27 + 16);
                unsigned int v65 = (void *)(v64 & 0xFFFFFFFFFFFFFFFELL);
                if (v27 == *(void *)(v64 & 0xFFFFFFFFFFFFFFFELL)) {
                  *unsigned int v65 = v50;
                }
                else {
                  v65[1] = v50;
                }
              }
              else
              {
                unint64_t *v2 = v50;
                uint64_t v64 = *(void *)(v27 + 16);
                unint64_t v40 = v50;
              }
              *(void *)(v50 + 8) = v27;
              uint64_t v73 = v64 & 1;
              BOOL v41 = v73 == 0;
              unint64_t v74 = v73 | v50 & 0xFFFFFFFFFFFFFFFELL;
              if (!v41) {
                unint64_t v50 = v74;
              }
              *(void *)(v27 + 16) = v50;
              unint64_t v27 = *(void *)(v11 + 8);
              uint64_t v52 = *(void *)(v27 + 8);
            }
LABEL_129:
            *(void *)(v27 + 16) = *(void *)(v27 + 16) & 0xFFFFFFFFFFFFFFFELL | *(void *)(v11 + 16) & 1;
            *(void *)(v11 + 16) &= ~1uLL;
            if (v52) {
              *(void *)(v52 + 16) &= ~1uLL;
            }
            unint64_t v75 = *(void *)v27;
            *(void *)(v11 + 8) = *(void *)v27;
            if (v75)
            {
              unint64_t v76 = *(void *)(v75 + 16) & 1 | v11 & 0xFFFFFFFFFFFFFFFELL;
              if ((*(void *)(v75 + 16) & 1) == 0) {
                unint64_t v76 = v11;
              }
              *(void *)(v75 + 16) = v76;
            }
            uint64_t v77 = *(void *)(v11 + 16);
            *(void *)(v27 + 16) = v77 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v27 + 16) & 1;
            if ((v77 & 0xFFFFFFFFFFFFFFFELL) != 0)
            {
              uint64_t v71 = *(void *)(v11 + 16);
              int v78 = (void *)(v71 & 0xFFFFFFFFFFFFFFFELL);
              if (v11 == *(void *)(v71 & 0xFFFFFFFFFFFFFFFELL)) {
                *int v78 = v27;
              }
              else {
                v78[1] = v27;
              }
              unint64_t v60 = v27;
            }
            else
            {
              unint64_t *v2 = v27;
              uint64_t v71 = *(void *)(v11 + 16);
              unint64_t v60 = v27;
              unint64_t v40 = v27;
            }
            goto LABEL_141;
          }
        }
        uint64_t v52 = *(void *)(v27 + 8);
        if (v52 && (*(unsigned char *)(v52 + 16) & 1) != 0) {
          goto LABEL_129;
        }
      }
      else
      {
        uint64_t v28 = *(void *)(v27 + 16);
        if (v28)
        {
          *(void *)(v27 + 16) = v28 & 0xFFFFFFFFFFFFFFFELL;
          uint64_t v29 = *(void *)(v11 + 16) | 1;
          *(void *)(v11 + 16) = v29;
          uint64_t v30 = *(void **)(v27 + 8);
          *(void *)unint64_t v11 = v30;
          if (v30)
          {
            unint64_t v31 = v30[2] & 1 | v11 & 0xFFFFFFFFFFFFFFFELL;
            if ((v30[2] & 1) == 0) {
              unint64_t v31 = v11;
            }
            v30[2] = v31;
            uint64_t v29 = *(void *)(v11 + 16);
          }
          *(void *)(v27 + 16) = v29 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v27 + 16) & 1;
          if ((v29 & 0xFFFFFFFFFFFFFFFELL) != 0)
          {
            uint64_t v32 = *(void *)(v11 + 16);
            int v33 = (void *)(v32 & 0xFFFFFFFFFFFFFFFELL);
            if (v11 == *(void *)(v32 & 0xFFFFFFFFFFFFFFFELL))
            {
              void *v33 = v27;
              uint64_t v30 = *(void **)v11;
            }
            else
            {
              v33[1] = v27;
            }
          }
          else
          {
            unint64_t *v2 = v27;
            uint64_t v32 = *(void *)(v11 + 16);
            unint64_t v40 = v27;
          }
          *(void *)(v27 + 8) = v11;
          uint64_t v42 = v32 & 1;
          BOOL v41 = v42 == 0;
          unint64_t v43 = v42 | v27 & 0xFFFFFFFFFFFFFFFELL;
          if (!v41) {
            unint64_t v27 = v43;
          }
          *(void *)(v11 + 16) = v27;
          unint64_t v27 = (unint64_t)v30;
        }
        unint64_t v44 = *(void *)v27;
        if (*(void *)v27)
        {
          uint64_t v45 = *(void *)(v44 + 16);
          if (v45) {
            goto LABEL_87;
          }
        }
        unint64_t v46 = *(void *)(v27 + 8);
        if (v46)
        {
          uint64_t v47 = *(void *)(v46 + 16);
          if (v47)
          {
            if (!v44) {
              goto LABEL_90;
            }
            uint64_t v45 = *(void *)(v44 + 16);
LABEL_87:
            if (v45)
            {
              unint64_t v60 = v27;
            }
            else
            {
              unint64_t v46 = *(void *)(v27 + 8);
              if (v46)
              {
                uint64_t v47 = *(void *)(v46 + 16);
LABEL_90:
                *(void *)(v46 + 16) = v47 & 0xFFFFFFFFFFFFFFFELL;
              }
              uint64_t v55 = *(void *)(v27 + 16) | 1;
              uint64_t v56 = *(void *)v46;
              *(void *)(v27 + 8) = *(void *)v46;
              *(void *)(v27 + 16) = v55;
              if (v56)
              {
                unint64_t v57 = *(void *)(v56 + 16) & 1 | v27 & 0xFFFFFFFFFFFFFFFELL;
                if ((*(void *)(v56 + 16) & 1) == 0) {
                  unint64_t v57 = v27;
                }
                *(void *)(v56 + 16) = v57;
                uint64_t v55 = *(void *)(v27 + 16);
              }
              *(void *)(v46 + 16) = v55 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v46 + 16) & 1;
              if ((v55 & 0xFFFFFFFFFFFFFFFELL) != 0)
              {
                uint64_t v58 = *(void *)(v27 + 16);
                unsigned int v59 = (void *)(v58 & 0xFFFFFFFFFFFFFFFELL);
                if (v27 == *(void *)(v58 & 0xFFFFFFFFFFFFFFFELL)) {
                  *unsigned int v59 = v46;
                }
                else {
                  v59[1] = v46;
                }
              }
              else
              {
                unint64_t *v2 = v46;
                uint64_t v58 = *(void *)(v27 + 16);
                unint64_t v40 = v46;
              }
              *(void *)unint64_t v46 = v27;
              uint64_t v66 = v58 & 1;
              BOOL v41 = v66 == 0;
              unint64_t v67 = v66 | v46 & 0xFFFFFFFFFFFFFFFELL;
              if (!v41) {
                unint64_t v46 = v67;
              }
              *(void *)(v27 + 16) = v46;
              unint64_t v60 = *(void *)v11;
              unint64_t v44 = **(void **)v11;
            }
            *(void *)(v60 + 16) = *(void *)(v60 + 16) & 0xFFFFFFFFFFFFFFFELL | *(void *)(v11 + 16) & 1;
            *(void *)(v11 + 16) &= ~1uLL;
            if (v44) {
              *(void *)(v44 + 16) &= ~1uLL;
            }
            unint64_t v27 = v60 + 8;
            uint64_t v68 = *(void *)(v60 + 8);
            *(void *)unint64_t v11 = v68;
            if (v68)
            {
              unint64_t v69 = *(void *)(v68 + 16) & 1 | v11 & 0xFFFFFFFFFFFFFFFELL;
              if ((*(void *)(v68 + 16) & 1) == 0) {
                unint64_t v69 = v11;
              }
              *(void *)(v68 + 16) = v69;
            }
            uint64_t v70 = *(void *)(v11 + 16);
            *(void *)(v60 + 16) = v70 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v60 + 16) & 1;
            if ((v70 & 0xFFFFFFFFFFFFFFFELL) != 0)
            {
              uint64_t v71 = *(void *)(v11 + 16);
              unsigned int v72 = (void *)(v71 & 0xFFFFFFFFFFFFFFFELL);
              if (v11 == *(void *)(v71 & 0xFFFFFFFFFFFFFFFELL)) {
                *unsigned int v72 = v60;
              }
              else {
                v72[1] = v60;
              }
            }
            else
            {
              unint64_t *v2 = v60;
              uint64_t v71 = *(void *)(v11 + 16);
              unint64_t v40 = v60;
            }
LABEL_141:
            *(void *)unint64_t v27 = v11;
            uint64_t v79 = v71 & 1;
            BOOL v41 = v79 == 0;
            unint64_t v80 = v60 & 0xFFFFFFFFFFFFFFFELL | v79;
            if (v41) {
              unint64_t v80 = v60;
            }
            *(void *)(v11 + 16) = v80;
            unint64_t v53 = v40;
LABEL_144:
            if (v53)
            {
              uint64_t v54 = *(void *)(v53 + 16);
LABEL_146:
              *(void *)(v53 + 16) = v54 & 0xFFFFFFFFFFFFFFFELL;
            }
LABEL_147:
            sub_100009610(v8);
            operator delete();
          }
        }
      }
      *(void *)(v27 + 16) |= 1uLL;
      unint64_t v14 = *(void *)(v11 + 16) & 0xFFFFFFFFFFFFFFFELL;
    }
  }
  return result;
}

uint64_t sub_1000084AC(uint64_t result, unsigned int a2, signed int a3)
{
  if (a3 < 0)
  {
    uint64_t result = sub_100007C78(result, a2, -a3, 0);
    if (!result) {
      return result;
    }
  }
  else
  {
    if (!a3) {
      return result;
    }
    uint64_t result = sub_100008528(result, a2, a3, 1);
    if (!result) {
      return result;
    }
  }
  unint64_t v4 = "give";
  if (a3 < 0) {
    unint64_t v4 = "reclaim";
  }
  return IOLog("mlx5: failed to %s %d page(s)\n", v4, a3);
}

uint64_t sub_100008528(uint64_t a1, unsigned int a2, signed int a3, int a4)
{
  int v8 = 8 * a3 + 16;
  uint64_t v9 = (_WORD *)((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21[0] = 0;
  v21[1] = 0;
  bzero(v9, v8);
  __int16 v10 = __rev16(a2);
  if (a3 >= 1)
  {
    v17[3] = a2;
    uint64_t v11 = 0;
    while (1)
    {
      unint64_t v19 = 0;
      uint64_t v12 = sub_100008938(a1, &v19);
      if (v12) {
        break;
      }
      *(void *)&v9[4 * v11++ + 8] = bswap64(v19);
      if (a3 == v11)
      {
        LODWORD(v11) = a3;
        goto LABEL_7;
      }
    }
    uint64_t v14 = v12;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  LODWORD(v11) = 0;
LABEL_7:
  _WORD *v9 = 2049;
  v9[3] = 256;
  v9[5] = v10;
  *((_DWORD *)v9 + 3) = bswap32(a3);
  uint64_t v13 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v9, v8, (uint64_t)v21, 16);
  if (v13)
  {
    uint64_t v14 = v13;
    IOLog("mlx5: func_id 0x%x, npages %d, err %x\n");
    goto LABEL_9;
  }
  if (!LOBYTE(v21[0])) {
    return 0;
  }
  uint64_t v14 = sub_100010B8C((unsigned __int8 *)v21);
  if (v14)
  {
    IOLog("mlx5: func_id 0x%x, npages %d, status %x\n");
LABEL_9:
    if (!a4)
    {
LABEL_14:
      if ((int)v11 >= 1)
      {
        unint64_t v15 = v11 + 1;
        do
          sub_100007DF8(a1, bswap64(*(void *)&v9[4 * v15--]));
        while (v15 > 1);
      }
      return v14;
    }
LABEL_12:
    unint64_t v19 = 2049;
    uint64_t v20 = 0;
    WORD1(v20) = v10;
    if (sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v19, 16, (uint64_t)v18, 16)) {
      IOLog("mlx5: failed to %s in %s:%d\n", "page notify", "givePages", 194);
    }
    goto LABEL_14;
  }
  return v14;
}

uint64_t sub_100008754(uint64_t a1, int a2)
{
  uint64_t v15 = 0;
  if (a2) {
    int v4 = 0x1000000;
  }
  else {
    int v4 = 0x2000000;
  }
  v14[0] = 1793;
  v14[1] = v4;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v14, 16, (uint64_t)v11, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v11);
    if (!result)
    {
      signed int v6 = bswap32(v13);
      unsigned int v7 = __rev16(v12);
      if (dword_1000284F8)
      {
        int v8 = "init";
        if (a2) {
          int v8 = "boot";
        }
        signed int v10 = v6;
        unsigned int v9 = v7;
        IOLog("mlx5:%s:%d requested %d %s pages for func_id 0x%x\n", "satisfyStartupPages", 252, v6, v8, v7);
        unsigned int v7 = v9;
        signed int v6 = v10;
      }
      return sub_100008528(a1, v7, v6, 0);
    }
  }
  return result;
}

uint64_t sub_10000883C(uint64_t a1)
{
  __uint64_t v2 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 5000000000;
  while (1)
  {
    unint64_t v3 = 0;
    int v4 = (void *)(a1 + 115128);
    do
    {
      int v5 = v3;
      int v4 = (void *)*v4;
      unint64_t v3 = v4;
    }
    while (v4);
    if (!v5) {
      return 0;
    }
    int v11 = 0;
    uint64_t v6 = sub_100007C78(a1, 0, 0x300u, &v11);
    if (v6) {
      break;
    }
    int v7 = v11;
    __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    if (v7)
    {
      __uint64_t v2 = v8 + 5000000000;
    }
    else if (v8 > v2)
    {
      IOLog("mlx5: FW did not return all pages.\n");
      return 0;
    }
  }
  uint64_t v9 = v6;
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d failed reclaiming pages\n", "reclaimStartupPages", 268);
  }
  return v9;
}

uint64_t sub_100008938(uint64_t a1, void *a2)
{
  __uint64_t v2 = *(uint64_t **)(a1 + 115136);
  if (v2 == (uint64_t *)(a1 + 115136)) {
    operator new();
  }
  int v3 = 0;
  int v4 = *((_DWORD *)v2 + 4);
  unsigned int v5 = -4096;
  do
  {
    int v6 = 1 << v3++;
    v5 += 4096;
  }
  while ((v4 & v6) != 0);
  *((_DWORD *)v2 + 4) = v4 | v6;
  if ((v4 | v6) == 0xFFFFFFFF)
  {
    uint64_t v8 = *v2;
    int v7 = (void *)v2[1];
    *(void *)(v8 + 8) = v7;
    *int v7 = v8;
  }
  *a2 = *(v2 - 7) + v5;
  return 0;
}

uint64_t sub_100008A68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 115128;
  int v3 = *(void **)(a1 + 115128);
  if (v3)
  {
    unint64_t v4 = *(void *)(a2 + 32);
    do
    {
      unint64_t v5 = (unint64_t)v3;
      unint64_t v6 = *(v3 - 4);
      int v7 = (unint64_t *)v5;
      if (v6 >= v4)
      {
        if (v6 <= v4) {
          sub_10001BF3C();
        }
        int v7 = (unint64_t *)(v5 + 8);
      }
      int v3 = (void *)*v7;
    }
    while (*v7);
  }
  else
  {
    unint64_t v5 = 0;
    int v7 = (unint64_t *)(a1 + 115128);
  }
  *(void *)(a2 + 64) = 0;
  unint64_t v8 = a2 + 64;
  *(void *)(v8 + 8) = 0;
  *(void *)(v8 + 16) = v5 | 1;
  *int v7 = v8;
  uint64_t v9 = *(void *)(v8 + 16);
  while (1)
  {
    unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 0) {
      break;
    }
    uint64_t v11 = *(void *)(v10 + 16);
    if ((v11 & 1) == 0) {
      break;
    }
    unint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
    uint64_t v13 = *(void *)(v11 & 0xFFFFFFFFFFFFFFFELL);
    if (v13 == v10)
    {
      uint64_t v13 = *(void *)(v12 + 8);
      if (v13)
      {
        uint64_t v14 = *(void *)(v13 + 16);
        if (v14)
        {
LABEL_22:
          *(void *)(v13 + 16) = v14 & 0xFFFFFFFFFFFFFFFELL;
          *(void *)(v10 + 16) &= ~1uLL;
          *(void *)(v12 + 16) |= 1uLL;
          unint64_t v16 = v11 & 0xFFFFFFFFFFFFFFFELL;
          goto LABEL_71;
        }
      }
      int v17 = *(void **)(v10 + 8);
      if (v17 == (void *)v8)
      {
        uint64_t v24 = *(void *)v8;
        *(void *)(v10 + 8) = *(void *)v8;
        if (v24)
        {
          unint64_t v25 = *(void *)(v24 + 16) & 1 | v10;
          if ((*(void *)(v24 + 16) & 1) == 0) {
            unint64_t v25 = v9 & 0xFFFFFFFFFFFFFFFELL;
          }
          *(void *)(v24 + 16) = v25;
          uint64_t v11 = *(void *)(v10 + 16);
          uint64_t v9 = *(void *)(v8 + 16);
        }
        *(void *)(v8 + 16) = v11 & 0xFFFFFFFFFFFFFFFELL | v9 & 1;
        if ((v11 & 0xFFFFFFFFFFFFFFFELL) != 0)
        {
          uint64_t v26 = *(void *)(v10 + 16);
          unint64_t v27 = (void *)(v26 & 0xFFFFFFFFFFFFFFFELL);
          if (*(void *)(v26 & 0xFFFFFFFFFFFFFFFELL) == v10) {
            void *v27 = v8;
          }
          else {
            v27[1] = v8;
          }
        }
        else
        {
          *(void *)uint64_t v2 = v8;
          uint64_t v26 = *(void *)(v10 + 16);
        }
        *(void *)unint64_t v8 = v10;
        uint64_t v39 = v26 & 1;
        BOOL v28 = v39 == 0;
        unint64_t v40 = v39 | v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v28) {
          unint64_t v40 = v8;
        }
        *(void *)(v10 + 16) = v40;
        unint64_t v19 = *(void *)v12;
        int v17 = *(void **)(*(void *)v12 + 8);
        unint64_t v18 = *(void *)(v8 + 16) & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v16 = v10;
      }
      else
      {
        unint64_t v18 = v11 & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v19 = v9 & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v16 = v8;
        unint64_t v8 = v10;
      }
      *(void *)(v8 + 16) = v18;
      uint64_t v41 = *(void *)(v12 + 16) | 1;
      *(void *)(v12 + 16) = v41;
      *(void *)unint64_t v12 = v17;
      if (v17)
      {
        uint64_t v42 = v17[2] & 1 | v12;
        if ((v17[2] & 1) == 0) {
          uint64_t v42 = v12;
        }
        v17[2] = v42;
        uint64_t v41 = *(void *)(v12 + 16);
      }
      *(void *)(v19 + 16) = v41 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v19 + 16) & 1;
      if ((v41 & 0xFFFFFFFFFFFFFFFELL) != 0)
      {
        uint64_t v43 = *(void *)(v12 + 16);
        unint64_t v44 = (void *)(v43 & 0xFFFFFFFFFFFFFFFELL);
        if (*(void *)(v43 & 0xFFFFFFFFFFFFFFFELL) == v12) {
          *unint64_t v44 = v19;
        }
        else {
          v44[1] = v19;
        }
      }
      else
      {
        *(void *)uint64_t v2 = v19;
        uint64_t v43 = *(void *)(v12 + 16);
      }
      *(void *)(v19 + 8) = v12;
      uint64_t v45 = v43 & 1;
      BOOL v28 = v45 == 0;
      unint64_t v31 = v45 | v19 & 0xFFFFFFFFFFFFFFFELL;
      if (v28) {
        unint64_t v31 = v19;
      }
    }
    else
    {
      if (v13)
      {
        uint64_t v14 = *(void *)(v13 + 16);
        if (v14) {
          goto LABEL_22;
        }
      }
      if (*(void *)v10 == v8)
      {
        uint64_t v20 = *(void *)(v8 + 8);
        *(void *)unint64_t v10 = v20;
        if (v20)
        {
          unint64_t v21 = *(void *)(v20 + 16) & 1 | v10;
          if ((*(void *)(v20 + 16) & 1) == 0) {
            unint64_t v21 = v9 & 0xFFFFFFFFFFFFFFFELL;
          }
          *(void *)(v20 + 16) = v21;
          uint64_t v11 = *(void *)(v10 + 16);
          uint64_t v9 = *(void *)(v8 + 16);
        }
        *(void *)(v8 + 16) = v11 & 0xFFFFFFFFFFFFFFFELL | v9 & 1;
        if ((v11 & 0xFFFFFFFFFFFFFFFELL) != 0)
        {
          uint64_t v22 = *(void *)(v10 + 16);
          unint64_t v23 = (void *)(v22 & 0xFFFFFFFFFFFFFFFELL);
          if (*(void *)(v22 & 0xFFFFFFFFFFFFFFFELL) == v10) {
            *unint64_t v23 = v8;
          }
          else {
            v23[1] = v8;
          }
        }
        else
        {
          *(void *)uint64_t v2 = v8;
          uint64_t v22 = *(void *)(v10 + 16);
        }
        *(void *)(v8 + 8) = v10;
        uint64_t v29 = v22 & 1;
        BOOL v28 = v29 == 0;
        unint64_t v30 = v29 | v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v28) {
          unint64_t v30 = v8;
        }
        *(void *)(v10 + 16) = v30;
        unint64_t v15 = *(void *)(v8 + 16) & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v16 = v10;
      }
      else
      {
        unint64_t v15 = v11 & 0xFFFFFFFFFFFFFFFELL;
        unint64_t v16 = v8;
        unint64_t v8 = v10;
      }
      *(void *)(v8 + 16) = v15;
      unint64_t v31 = *(void *)(v12 + 8);
      uint64_t v32 = *(void *)(v12 + 16) | 1;
      uint64_t v33 = *(void *)v31;
      *(void *)(v12 + 8) = *(void *)v31;
      *(void *)(v12 + 16) = v32;
      if (v33)
      {
        uint64_t v34 = *(void *)(v33 + 16) & 1 | v12;
        if ((*(void *)(v33 + 16) & 1) == 0) {
          uint64_t v34 = v12;
        }
        *(void *)(v33 + 16) = v34;
        uint64_t v32 = *(void *)(v12 + 16);
      }
      *(void *)(v31 + 16) = v32 & 0xFFFFFFFFFFFFFFFELL | *(void *)(v31 + 16) & 1;
      if ((v32 & 0xFFFFFFFFFFFFFFFELL) != 0)
      {
        uint64_t v35 = *(void *)(v12 + 16);
        int v36 = (void *)(v35 & 0xFFFFFFFFFFFFFFFELL);
        if (*(void *)(v35 & 0xFFFFFFFFFFFFFFFELL) == v12) {
          *int v36 = v31;
        }
        else {
          v36[1] = v31;
        }
      }
      else
      {
        *(void *)uint64_t v2 = v31;
        uint64_t v35 = *(void *)(v12 + 16);
      }
      *(void *)unint64_t v31 = v12;
      uint64_t v37 = v35 & 1;
      BOOL v28 = v37 == 0;
      unint64_t v38 = v37 | v31 & 0xFFFFFFFFFFFFFFFELL;
      if (!v28) {
        unint64_t v31 = v38;
      }
    }
    *(void *)(v12 + 16) = v31;
LABEL_71:
    uint64_t v9 = *(void *)(v16 + 16);
    unint64_t v8 = v16;
  }
  *(void *)(*(void *)v2 + 16) &= ~1uLL;
  return 0;
}

void sub_100008DC0(uint64_t a1)
{
  sub_100009610(a1);
  operator delete();
}

uint64_t sub_100008DF8(uint64_t a1, unsigned int a2)
{
  if (a2 > 0x3FF)
  {
    uint64_t v3 = sub_100011354((uint64_t *)(a1 + 115160), a2);
    if (v3) {
      goto LABEL_3;
    }
LABEL_7:
    IOLog("mlx5: Completion event for bogus CQ 0x%x\n", a2);
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 8 * a2 + 115176);
  if (!v3) {
    goto LABEL_7;
  }
LABEL_3:
  ++*(_DWORD *)(v3 + 44);
  unint64_t v4 = *(uint64_t (**)(void))(v3 + 24);
  return v4();
}

uint64_t sub_100008E98(uint64_t a1, unsigned int *a2, _WORD *a3, int a4)
{
  *a3 = 4;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a3, a4, (uint64_t)&v9, 16);
  if (!result)
  {
    if ((_BYTE)v9)
    {
      return sub_100010B8C((unsigned __int8 *)&v9);
    }
    else
    {
      uint64_t v7 = bswap32(v10 & 0xFFFFFF00);
      *a2 = v7;
      *((void *)a2 + 5) = 0;
      uint64_t result = sub_100011540((char **)(a1 + 115160), v7, (uint64_t)a2);
      uint64_t v8 = *a2;
      if (result || v8 > 0x3FF)
      {
        if (result) {
          sub_10001BF68((int *)a2, v8);
        }
      }
      else
      {
        uint64_t result = 0;
        *(void *)(a1 + 8 * v8 + 115176) = a2;
      }
    }
  }
  return result;
}

uint64_t sub_100008F58(uint64_t a1, unsigned int *a2)
{
  uint64_t v4 = *a2;
  if (v4 <= 0x3FF) {
    *(void *)(a1 + 8 * v4 + 115176) = 0;
  }
  uint64_t v5 = sub_1000113E0(a1 + 115160, v4);
  if (!v5)
  {
    IOLog("mlx5: cq 0x%x not found in tree\n");
    return 3758096385;
  }
  if ((unsigned int *)v5 != a2)
  {
    IOLog("mlx5: corruption on srqn 0x%x\n");
    return 3758096385;
  }
  v9[0] = 0;
  v9[1] = 0;
  uint64_t v8 = 0;
  uint64_t v7 = 260;
  LODWORD(v8) = bswap32(*a2);
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v7, 16, (uint64_t)v9, 16);
  if (!result)
  {
    if (LOBYTE(v9[0])) {
      return sub_100010B8C((unsigned __int8 *)v9);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100009038(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  uint64_t v7 = 0;
  uint64_t v6 = 516;
  LODWORD(v7) = bswap32(*a2);
  uint64_t v4 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v6, 16, a3, 96);
  if (!v4 && *(unsigned char *)a3) {
    sub_100010B8C((unsigned __int8 *)a3);
  }
  return v4;
}

uint64_t sub_1000090BC(uint64_t a1, _WORD *a2, int a3)
{
  v4[0] = 0;
  v4[1] = 0;
  *a2 = 772;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a2, a3, (uint64_t)v4, 16);
  if (!result)
  {
    if (LOBYTE(v4[0])) {
      return sub_100010B8C((unsigned __int8 *)v4);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100009110(uint64_t a1, unsigned int *a2, unsigned int a3, unsigned int a4)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  unsigned int v4 = bswap32(*a2);
  LOWORD(v7) = __rev16(a3);
  WORD1(v7) = __rev16(a4);
  *((void *)&v6[0] + 1) = v4 | 0x300000000000000;
  return sub_1000090BC(a1, v6, 272);
}

uint64_t sub_100009188(uint64_t a1, unsigned int *a2, unsigned int a3, unsigned int a4, char a5)
{
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
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  unsigned int v5 = bswap32(*a2);
  LOWORD(v9) = __rev16(a3);
  WORD1(v9) = __rev16(a4);
  BYTE1(v8) = (a5 & 2) != 0;
  BYTE2(v8) = a5 << 7;
  *((void *)&v7 + 1) = v5 | 0x130000000000;
  return sub_1000090BC(a1, &v7, 272);
}

uint64_t sub_100009210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a3 + 18) = BYTE1(v4) & 0xF;
  *(_WORD *)(a3 + 16) = ~(-1 << SHIBYTE(v4));
  uint64_t v5 = sub_100009828(a1, a4 + 8);
  if (!v5) {
    operator new();
  }
  return v5;
}

uint64_t sub_1000092B8(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)(a3 + 25) = ((unsigned __int16)*a2 >> 13) + 6;
  char v4 = a2[3];
  *(unsigned char *)(a3 + 24) = v4 & 0x1F;
  *(_DWORD *)(a3 + 16) = ~(-1 << v4);
  uint64_t v5 = sub_100009828(a1, a4 + 8);
  if (!v5) {
    operator new();
  }
  return v5;
}

uint64_t sub_100009370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4 = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a3 + 22) = BYTE1(v4) & 0xF;
  *(_WORD *)(a3 + 16) = ~(-1 << SHIBYTE(v4));
  uint64_t result = sub_100009828(a1, a4 + 8);
  if (!result) {
    operator new();
  }
  return result;
}

uint64_t sub_10000944C(uint64_t a1, uint64_t *a2)
{
  sub_1000098A8(a1, (uint64_t)(a2 + 1));
  uint64_t result = *a2;
  if (*a2) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  *a2 = 0;
  return result;
}

void *sub_1000094A4(void *a1, uint64_t a2, const char *a3, uint64_t a4)
{
  kern_return_t v8;
  uint64_t address;
  uint64_t flags;
  uint32_t segmentsCount;
  IODMACommandSpecification specification;
  IOAddressSegment range;

  *a1 = off_100024508;
  a1[3] = a2;
  a1[6] = a3;
  a1[7] = a4;
  long long v7 = (IOBufferMemoryDescriptor **)(a1 + 1);
  long long v8 = IOBufferMemoryDescriptor::Create(3uLL, (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000, 0x4000uLL, (IOBufferMemoryDescriptor **)a1 + 1);
  if (v8) {
    sub_10001C058(a2, v8);
  }
  if (IOBufferMemoryDescriptor::GetAddressRange(*v7, &range)) {
    sub_10001C02C();
  }
  a1[5] = range.address;
  memset(specification._resv, 0, sizeof(specification._resv));
  specification.options = 0;
  specification.maxAddressBits = 64;
  if (IODMACommand::Create((IOService *)qword_100028500, 0, &specification, (IODMACommand **)a1 + 2)) {
    sub_10001C000();
  }
  segmentsCount = 1;
  flags = 0;
  if (IODMACommand::PrepareForDMA((IODMACommand *)a1[2], 0, *v7, 0, 0, &flags, &segmentsCount, &range, 0)) {
    sub_10001BFD4();
  }
  address = range.address;
  a1[4] = range.address;
  if ((dword_1000284F8 & 4) != 0) {
    IOLog("mlx5: DMABuf(%s) (%p) at (va=0x%llx, dma=0x%llx) size=0x%llx\n", a3, a1, a1[5], address, a2);
  }
  return a1;
}

uint64_t sub_100009610(uint64_t a1)
{
  *(void *)a1 = off_100024508;
  if ((dword_1000284F8 & 4) != 0) {
    IOLog("mlx5: ~DMABuf(%s) (%p) at (va=0x%llx, dma=0x%llx)\n", *(const char **)(a1 + 48), (const void *)a1, *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  IODMACommand::CompleteDMA(*(IODMACommand **)(a1 + 16), 0, 0);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    *(void *)(a1 + 16) = 0;
  }
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

void sub_1000096F8(uint64_t a1)
{
  sub_100009610(a1);
  operator delete();
}

uint64_t sub_100009730(uint64_t result, void *a2)
{
  unint64_t v2 = *(void *)(result + 24) + 0x3FFFLL;
  if ((int)(v2 >> 14) >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = v2 & 0x3FFFFFFFC000;
    do
    {
      *a2++ = bswap64(v3 + *(void *)(result + 32));
      v3 += 0x4000;
    }
    while (v4 != v3);
  }
  return result;
}

void sub_100009770()
{
}

BOOL sub_1000097DC(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v3 = a2[10];
  unint64_t v4 = __clz(__rbit64(v3));
  if (v4 <= 0x3F)
  {
    a2[10] = v3 & ~(1 << v4);
    *(_DWORD *)(a3 + 24) = v4;
    uint64_t v5 = a2[4];
    uint64_t v6 = (void *)(a2[5] + (v4 << 6));
    *(void *)a3 = v6;
    *(void *)(a3 + 8) = a2;
    *(void *)(a3 + 16) = v5 + (v4 << 6);
    *uint64_t v6 = 0;
  }
  return v4 < 0x40;
}

uint64_t sub_100009828(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = (void *)(a1 + 123392);
  unint64_t v4 = (void *)(a1 + 123392);
  do
  {
    unint64_t v4 = (void *)*v4;
    if (v4 == v3) {
      sub_100009770();
    }
    LOBYTE(a1) = sub_1000097DC(a1, v4 - 8, a2);
  }
  while ((a1 & 1) == 0);
  return 0;
}

void sub_1000098A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  if (v2)
  {
    *(void *)(v2 + 80 + 8 * (*(_DWORD *)(a2 + 24) / 64)) |= 1 << *(_DWORD *)(a2 + 24);
    if (!*(void *)(v2 + 80))
    {
      uint64_t v5 = v2 + 64;
      uint64_t v3 = *(void *)(v2 + 64);
      unint64_t v4 = *(void **)(v5 + 8);
      *(void *)(v3 + 8) = v4;
      void *v4 = v3;
      uint64_t v6 = *(void *)(a2 + 8);
      if (v6)
      {
        sub_100009610(v6);
        operator delete();
      }
      *(void *)(a2 + 8) = 0;
    }
  }
}

void sub_100009938(uint64_t a1)
{
  sub_100009610(a1);
  operator delete();
}

uint64_t sub_100009970(uint64_t a1)
{
  int v7 = 0;
  uint64_t v6 = 0;
  int v5 = 257;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v5, 16, (uint64_t)v3, 272);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v3);
    if (!result)
    {
      *(_OWORD *)(a1 + 212) = v4;
      IOLog("Mellanox board id: %s\n", (const char *)(a1 + 212));
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000099F0(uint64_t a1)
{
  uint64_t result = sub_10000ED1C(a1, 0);
  if (!result)
  {
    if ((*(unsigned char *)(a1 + 427) & 8) == 0 || (uint64_t result = sub_10000ED1C(a1, 1u), !result))
    {
      if ((*(unsigned char *)(a1 + 428) & 1) == 0 || (uint64_t result = sub_10000ED1C(a1, 2u), !result))
      {
        int v3 = *(_DWORD *)(a1 + 424);
        if ((v3 & 0x2000000) != 0)
        {
          uint64_t result = sub_10000ED1C(a1, 3u);
          if (result) {
            return result;
          }
          int v3 = *(_DWORD *)(a1 + 424);
        }
        if ((v3 & 0x4000000) == 0 || (uint64_t result = sub_10000ED1C(a1, 4u), !result))
        {
          int v4 = *(_DWORD *)(a1 + 412);
          if ((v4 & 0x30002) == 0x10002)
          {
            uint64_t result = sub_10000ED1C(a1, 7u);
            if (result) {
              return result;
            }
            int v4 = *(_DWORD *)(a1 + 412);
          }
          if (v4)
          {
            uint64_t result = sub_10000ED1C(a1, 8u);
            if (result) {
              return result;
            }
            int v4 = *(_DWORD *)(a1 + 412);
          }
          if ((v4 & 0x80) == 0 || (uint64_t result = sub_10000ED1C(a1, 9u), !result))
          {
            if ((*(unsigned char *)(a1 + 416) & 0x80) == 0 || (uint64_t result = sub_10000ED1C(a1, 0xAu), !result))
            {
              if ((*(unsigned char *)(a1 + 408) & 0x10) == 0 || (uint64_t result = sub_10000ED1C(a1, 0xDu), !result))
              {
                if ((*(unsigned char *)(a1 + 427) & 0x10) == 0 || (uint64_t result = sub_10000ED1C(a1, 0xCu), !result))
                {
                  int v9 = 0;
                  uint64_t v8 = 0;
                  int v7 = 770;
                  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v7, 16, (uint64_t)v5, 16);
                  if (!result)
                  {
                    uint64_t result = sub_100010B8C(v5);
                    if (!result) {
                      *(_DWORD *)(a1 + 115052) = bswap32(v6);
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
  return result;
}

uint64_t sub_100009B78(uint64_t a1)
{
  int v5 = 0;
  uint64_t v4 = 0;
  int v3 = 513;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v3, 16, (uint64_t)v2, 16);
  if (!result) {
    return sub_100010B8C(v2);
  }
  return result;
}

uint64_t sub_100009BC8(uint64_t a1)
{
  int v5 = 0;
  uint64_t v4 = 0;
  int v3 = 769;
  return sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v3, 16, (uint64_t)&v2, 16);
}

void sub_100009C0C(_DWORD *a1)
{
  if (a1[52] == 1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0x1010uLL, &readData);
    uint32_t v2 = readData;
    if (readData == -1 && (uint32_t v6 = 0, IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0, &v6), v6 == -1))
    {
      IOLog("mlx5: device removed!!!\n");
    }
    else
    {
      int v3 = a1 + 28788;
      unsigned int v4 = bswap32(v2);
      if (v4 == a1[28789])
      {
        int v5 = *v3 + 1;
        *int v3 = v5;
        a1[28789] = v4;
        if (v5 == 3) {
          sub_10001C0B8();
        }
      }
      else
      {
        *int v3 = 0;
        a1[28789] = v4;
      }
    }
  }
}

void sub_100009CD8(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3 = (unsigned __int16)(*(_WORD *)(a2 + 456) & *(_WORD *)(a2 + 128));
  uint64_t v4 = *(void *)(a2 + 440) + (int)(v3 << *(unsigned char *)(a2 + 458));
  *(void *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = 0;
  unsigned int v5 = *(unsigned __int16 *)(a2 + 128);
  unsigned int v6 = bswap32(a3 | (*(_DWORD *)(a2 + 480) << 8));
  *(_DWORD *)uint64_t v4 = (bswap32(v5) >> 8) & 0xFFFF00;
  *(_DWORD *)(v4 + 4) = v6;
  uint64_t v7 = *(void *)(a2 + 384) + 16 * v3;
  *(void *)uint64_t v7 = 0;
  *(_DWORD *)(v7 + 8) = 0;
  *(_DWORD *)(v7 + 12) = (a3 + 3) >> 2;
  *(_WORD *)(a2 + 128) = v5 + ((a3 + 3) >> 2);
}

uint64_t sub_100009D3C(unsigned int *a1)
{
  if (!*((_WORD *)a1 + 100)) {
    return 0;
  }
  unsigned int v2 = 0;
  int v3 = 0;
  uint64_t v4 = 0;
  int v5 = *((unsigned __int16 *)a1 - 128);
  do
  {
    unsigned int v6 = a1[17];
    uint64_t v7 = *((void *)a1 + 6) + ((a1[16] & v6) << *((unsigned char *)a1 + 73));
    if (((v6 >> *((unsigned char *)a1 + 72)) ^ *(unsigned __int8 *)(v7 + 63))) {
      break;
    }
    __dmb(1u);
    __dmb(9u);
    ++a1[17];
    unsigned int v8 = bswap32(*(unsigned __int16 *)(v7 + 60)) >> 16;
    uint64_t v9 = *((void *)a1 + 16);
    int v10 = v5;
    do
    {
      uint64_t v11 = (unsigned __int16)(a1[50] & v10);
      uint64_t v12 = *(void *)(v9 + 16 * v11);
      *(void *)(v9 + 16 * v11) = 0;
      if (v12)
      {
        long long v13 = (IODataQueueDispatchSource *)*((void *)a1 + 19);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 0x40000000;
        v18[2] = sub_10000A480;
        v18[3] = &unk_100024538;
        v18[4] = v12;
        BOOL sendDataAvailable = 0;
        *(unsigned char *)(v12 + 72) = 0;
        if (IODataQueueDispatchSource::EnqueueWithCoalesce(v13, 0x68u, &sendDataAvailable, v18))
        {
          IODataQueueDispatchSource::SendDataAvailable(v13);
          uint64_t v4 = 1;
        }
        else
        {
          uint64_t v4 = 0x10000;
        }
        ++v2;
        uint64_t v9 = *((void *)a1 + 16);
      }
      ++v3;
      int v5 = v10 + *(unsigned __int16 *)(v9 + 16 * v11 + 12);
      BOOL v14 = v8 == (unsigned __int16)v10;
      int v10 = v5;
    }
    while (!v14);
  }
  while (v2 < *((unsigned __int16 *)a1 + 100));
  if (v4 >= 0x10000) {
    IODataQueueDispatchSource::SendDataAvailable(*((IODataQueueDispatchSource **)a1 + 19));
  }
  if (v3)
  {
    **((_DWORD **)a1 + 7) = bswap32(a1[17] & 0xFFFFFF);
    __dmb(2u);
    __dmb(0xBu);
    *((_WORD *)a1 - 128) = v5;
    uint64_t v15 = *(void *)(*((void *)a1 + 4) + 8);
    uint64_t v16 = a1[17] & 0xFFFFFF | ((a1[11] & 3) << 28);
    **((_DWORD **)a1 + 2) = bswap32(v16);
    __dmb(0xEu);
    IOPCIDevice::MemoryWrite64((IOPCIDevice *)qword_100028500, 0, v15 + 32, bswap64(*a1 | (unint64_t)(v16 << 32)));
  }
  return v4;
}

void sub_100009F5C(uint64_t a1, unsigned __int16 *a2)
{
  memset(v27, 0, 512);
  int v2 = -1 << (*(unsigned char *)(a1 + 38392) - 2);
  __dmb(9u);
  int v3 = *a2 - a2[64];
  if (!v3) {
    LOWORD(v3) = -4;
  }
  int v4 = (unsigned __int16)(v3 & a2[228]) >> 2;
  if ((v4 & ~v2) != 0)
  {
    uint64_t v6 = (*(uint64_t (**)(void, _OWORD *, void))(**((void **)a2 + 52) + 104))(*((void *)a2 + 52), v27, v4 & ~v2);
    if (v6)
    {
      int v26 = ~v2;
      long long v7 = 0uLL;
      while (1)
      {
        uint64_t v8 = 0;
        uint64_t v9 = v6;
        int v10 = a2[64];
        do
        {
          unsigned int v11 = a2[228];
          int v12 = *a2;
          if (v12 != (unsigned __int16)v10 && ((v12 - v10) & v11) <= 0x1F) {
            sub_10001C0F0();
          }
          unsigned int v14 = v11 & ~v10;
          if (v14 <= 0xE)
          {
            sub_100009CD8(v6, (uint64_t)a2, 4 * v14 + 4);
            long long v7 = 0uLL;
            int v10 = a2[64];
            unsigned int v11 = a2[228];
          }
          unsigned int v15 = v11 & v10;
          uint64_t v16 = *((void *)a2 + 55) + (int)(v15 << *((unsigned char *)a2 + 458));
          *(_OWORD *)uint64_t v16 = v7;
          *(_OWORD *)(v16 + 16) = v7;
          *(unsigned char *)(v16 + 20) = -64;
          uint64_t v17 = *(void *)(*((void *)v27 + v8) + 48);
          uint64_t v18 = *((void *)a2 + 48) + 16 * v15;
          *(void *)uint64_t v18 = v17 + 8;
          unsigned int v19 = *(_DWORD *)(v17 + 72);
          uint64_t v20 = *(unsigned int *)(v17 + 76);
          uint64_t v21 = *(void *)(v17 + 16);
          if (v19 <= 0x3C) {
            int v22 = 60;
          }
          else {
            int v22 = *(_DWORD *)(v17 + 72);
          }
          *(_DWORD *)(v18 + 8) = v22;
          *(_DWORD *)uint64_t v16 = bswap32((a2[64] << 8) | 0xA);
          *(_OWORD *)(v16 + 30) = *(_OWORD *)(v21 + v20);
          *(_WORD *)(v16 + 28) = 4096;
          *(void *)(v16 + 56) = bswap64(v20 + *(void *)(v17 + 24) + 16);
          int v23 = *((_DWORD *)a2 + 121);
          *(_DWORD *)(v16 + 48) = bswap32(v19 - 16);
          *(_DWORD *)(v16 + 52) = v23;
          *(_DWORD *)(v16 + 4) = bswap32((*((_DWORD *)a2 + 120) << 8) | 4);
          *(_DWORD *)(*((void *)a2 + 48) + 16 * v15 + 12) = 1;
          int v10 = ++a2[64];
          ++v8;
        }
        while (v9 != v8);
        __dmb(9u);
        int v24 = *a2 - a2[64];
        if (!v24) {
          LOWORD(v24) = -4;
        }
        unsigned int v25 = (unsigned __int16)(v24 & a2[228]);
        if ((v26 & (v25 >> 2)) == 0) {
          break;
        }
        uint64_t v6 = (*(uint64_t (**)(void, _OWORD *, void))(**((void **)a2 + 52) + 104))(*((void *)a2 + 52), v27, v26 & (v25 >> 2));
        long long v7 = 0uLL;
        if (!v6)
        {
          if (!v16) {
            return;
          }
          break;
        }
      }
      __dmb(0xBu);
      *(unsigned char *)(v16 + 11) = 8;
      __dmb(0xEu);
      __dmb(2u);
      **((_DWORD **)a2 + 56) = bswap32(a2[64]);
      __dmb(0xEu);
      __dmb(2u);
      IOPCIDevice::MemoryWrite64((IOPCIDevice *)qword_100028500, 0, *((void *)a2 + 59) + 2048, *(void *)v16);
    }
  }
}

void sub_10000A25C(uint64_t a1, unsigned __int16 *a2)
{
                                                                                   + 544);
  int v3 = *a2;
  int v4 = v3;
  if (v3 != a2[64])
  {
    while (1)
    {
      readData[0] = 0;
      IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0, readData);
      if (readData[0] == -1) {
        break;
      }
      if ((dword_1000284F8 & 4) != 0) {
        IOLog("mlx5: drainSQ phase 1: sq.pc %d, sq.pc %d\n", *a2, a2[64]);
      }
      IOSleep(1uLL);
      (*((void (**)(unsigned __int16 *))a2 + 35))(a2 + 128);
      int v3 = *a2;
      if (v3 == a2[64])
      {
        int v4 = *a2;
        goto LABEL_8;
      }
    }
    int v4 = *a2;
    int v3 = a2[64];
  }
LABEL_8:
  if ((dword_1000284F8 & 4) != 0)
  {
    IOLog("mlx5: drainSQ phase 2: sq.pc %d, sq.pc %d\n", v4, v3);
    int v4 = *a2;
    int v3 = a2[64];
  }
  if (v4 != v3)
  {
    do
    {
      int v5 = (uint64_t *)(*((void *)a2 + 48) + 16 * (unsigned __int16)(a2[228] & v4));
      uint64_t v6 = *v5;
      if (*v5)
      {
        if ((dword_1000284F8 & 4) != 0)
        {
          IOLog("mlx5: drainSQ sq.cc=%d dma=0x%llx\n", (unsigned __int16)v4, *(void *)(v6 + 8) + *(unsigned int *)(v6 + 68));
          uint64_t v6 = *v5;
        }
        v8.ivars = (IOUserNetworkPacket_IVars *)(v6 - 8);
        *(void *)uint32_t readData = 0;
        IOUserNetworkPacket::GetPacketBufferPool(&v8, (IOUserNetworkPacketBufferPool **)readData);
        (*(void (**)(void, IOUserNetworkPacket *))(**(void **)readData + 64))(*(void *)readData, &v8);
        LOWORD(v4) = *a2;
        LOWORD(v3) = a2[64];
      }
      LOWORD(v4) = v4 + 1;
      *a2 = v4;
    }
    while ((unsigned __int16)v4 != (unsigned __int16)v3);
  }
}

uint64_t sub_10000A480(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(*(void *)(result + 32) + 40);
  return result;
}

uint64_t sub_10000A490(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 8);
  if ((v3 & 0x80) != 0)
  {
    uint64_t result = sub_100006BE0(*(void **)(a2 + 72));
    int v3 = *(_DWORD *)(a2 + 8);
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  uint64_t result = sub_100006BE0(*(void **)(a2 + 64));
  int v3 = *(_DWORD *)(a2 + 8);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t result = sub_100006BE0(*(void **)(a2 + 56));
  int v3 = *(_DWORD *)(a2 + 8);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t result = sub_100006BE0(*(void **)(a2 + 48));
  int v3 = *(_DWORD *)(a2 + 8);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t result = sub_100006BE0(*(void **)(a2 + 24));
  int v3 = *(_DWORD *)(a2 + 8);
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t result = sub_100006BE0(*(void **)(a2 + 16));
  int v3 = *(_DWORD *)(a2 + 8);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t result = sub_100006BE0(*(void **)(a2 + 40));
  int v3 = *(_DWORD *)(a2 + 8);
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t result = sub_100006BE0(*(void **)(a2 + 32));
  int v3 = *(_DWORD *)(a2 + 8);
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0) {
      goto LABEL_11;
    }
LABEL_23:
    uint64_t result = sub_100006BE0(*(void **)(a2 + 80));
    if ((*(_DWORD *)(a2 + 8) & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_22:
  uint64_t result = sub_100006BE0(*(void **)(a2 + 88));
  int v3 = *(_DWORD *)(a2 + 8);
  if ((v3 & 0x100) != 0) {
    goto LABEL_23;
  }
LABEL_11:
  if ((v3 & 0x400) != 0) {
LABEL_12:
  }
    uint64_t result = sub_100006BE0(*(void **)(a2 + 96));
LABEL_13:
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

void sub_10000A590(uint64_t a1, unsigned __int8 *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 16) + 115104);
  long long v7 = (unsigned char *)(a4 + 8);
  IOUserNetworkPacket v8 = (unsigned char *)(a5 + 8);
  if (a3 == 1)
  {
    int v11 = 1;
    *long long v7 = 1;
    *IOUserNetworkPacket v8 = 1;
    goto LABEL_7;
  }
  if (a3)
  {
    int v11 = 0;
    goto LABEL_7;
  }
  *(_WORD *)(a4 + 12) = -1;
  *(_DWORD *)long long v7 = -1;
  int v9 = *(_DWORD *)a2;
  *(_WORD *)(a5 + 12) = *((_WORD *)a2 + 2);
  *(_DWORD *)IOUserNetworkPacket v8 = v9;
  int v10 = *a2;
  if ((v10 & 1) == 0)
  {
    int v11 = 1;
    goto LABEL_7;
  }
  if (v10 == 51)
  {
    if (a2[1] == 51)
    {
      *(_DWORD *)(a4 + 4) |= 0xFFFF0000;
      *(_WORD *)(a5 + 6) = -8826;
      sub_100006B2C(v6, 1, (void *)a4, a5, 4u, 16777214);
    }
  }
  else if (v10 == 1)
  {
    int v11 = 1;
    if (!a2[1] && a2[2] == 94 && ((char)a2[3] & 0x80000000) == 0)
    {
      *(_DWORD *)(a4 + 4) |= 0xFFFF0000;
      *(_WORD *)(a5 + 6) = 8;
      sub_100006B2C(v6, 1, (void *)a4, a5, 4u, 16777214);
    }
LABEL_7:
    sub_100006B2C(v6, v11, (void *)a4, a5, 4u, 16777214);
  }
  int v11 = 1;
  goto LABEL_7;
}

void sub_10000A8F8(uint64_t a1, unsigned __int8 *a2, int a3)
{
  memset(v4, 0, sizeof(v4));
  memset(v3, 0, sizeof(v3));
  sub_10000A590(a1, a2, a3, (uint64_t)v3, (uint64_t)v4);
}

uint64_t sub_10000A9AC(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 5080;
  int v4 = (unint64_t *)(a1 + 5080);
  int v5 = (unint64_t *)(a1 + 5080);
  while (!*v5)
  {
    ++v5;
    v2 -= 64;
    if (v2 == -4096) {
      goto LABEL_26;
    }
  }
  uint64_t v6 = __clz(__rbit64(*v5)) - v2;
  if (v6 <= 0xFFF)
  {
    unint64_t v7 = 0;
    unint64_t v8 = v6;
    while (1)
    {
      ++v7;
      if (v8 == 4095) {
        goto LABEL_27;
      }
      char v9 = v8 + 1;
      unint64_t v10 = (v8 + 1) >> 6;
      uint64_t v11 = (v10 << 6);
      int v12 = (unint64_t *)(v3 + 8 * v10);
      int v13 = v9 & 0x3F;
      if (!v13) {
        break;
      }
      unint64_t v14 = *v12 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v13);
      if (v14)
      {
        unint64_t v8 = v11 | __clz(__rbit64(v14));
      }
      else
      {
        if ((unint64_t)(v11 - 4032) < 0x41) {
          goto LABEL_27;
        }
        uint64_t v11 = (v11 + 64);
        ++v12;
        unint64_t v15 = 4096 - v11;
        if (v10 <= 0x3E) {
          goto LABEL_14;
        }
LABEL_18:
        if (v15)
        {
          unint64_t v17 = *v12 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v15);
          BOOL v24 = v17 == 0;
          int v18 = v11 + v15;
          int v19 = v11 + __clz(__rbit64(v17));
          if (v24) {
            LODWORD(v11) = v18;
          }
          else {
            LODWORD(v11) = v19;
          }
        }
        unint64_t v8 = (int)v11;
      }
LABEL_24:
      if (v8 >= 0x1000) {
        goto LABEL_27;
      }
    }
    unint64_t v15 = 4096 - v11;
LABEL_14:
    int v16 = -(int)v11;
    while (!*v12)
    {
      v15 -= 64;
      ++v12;
      v16 -= 64;
      if (v15 <= 0x3F)
      {
        LODWORD(v11) = -v16;
        goto LABEL_18;
      }
    }
    unint64_t v8 = (int)(__clz(__rbit64(*v12)) - v16);
    goto LABEL_24;
  }
LABEL_26:
  unint64_t v7 = 0;
LABEL_27:
  int v20 = 1 << BYTE1(*(_DWORD *)(*(void *)(a1 + 16) + 484));
  if (v7 > v20)
  {
    unint64_t v21 = v20;
    IOLog("mlx5: ifnet vlans list size (%lu) > (%lu) max vport list size, some vlans will be dropped\n", v7, v20);
    unint64_t v7 = v21;
  }
  bzero((char *)&v40 - ((2 * v7 + 15) & 0xFFFFFFFFFFFFFFF0), 2 * v7);
  uint64_t v22 = 0;
  while (!*v4)
  {
    ++v4;
    v22 -= 64;
    if (v22 == -4096) {
      return sub_1000127FC(*(void *)(a1 + 16), (__int16 *)((char *)&v40 - ((2 * v7 + 15) & 0xFFFFFFFFFFFFFFF0)), v7);
    }
  }
  uint64_t v23 = __clz(__rbit64(*v4)) - v22;
  BOOL v24 = v23 > 0xFFF || v7 == 0;
  if (!v24)
  {
    unint64_t v25 = 0;
    unint64_t v26 = v23;
    while (1)
    {
      *(_WORD *)((char *)&v40 + 2 * v25 - ((2 * v7 + 15) & 0xFFFFFFFFFFFFFFF0)) = v26;
      if (v26 > 0xFFE) {
        return sub_1000127FC(*(void *)(a1 + 16), (__int16 *)((char *)&v40 - ((2 * v7 + 15) & 0xFFFFFFFFFFFFFFF0)), v7);
      }
      char v27 = v26 + 1;
      unint64_t v28 = (v26 + 1) >> 6;
      uint64_t v29 = (v28 << 6);
      unint64_t v30 = (unint64_t *)(v3 + 8 * v28);
      int v31 = v27 & 0x3F;
      if (!v31) {
        break;
      }
      unint64_t v32 = *v30 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v31);
      if (v32)
      {
        unint64_t v26 = v29 | __clz(__rbit64(v32));
      }
      else
      {
        if ((unint64_t)(v29 - 4032) < 0x41) {
          return sub_1000127FC(*(void *)(a1 + 16), (__int16 *)((char *)&v40 - ((2 * v7 + 15) & 0xFFFFFFFFFFFFFFF0)), v7);
        }
        uint64_t v29 = (v29 + 64);
        ++v30;
        unint64_t v33 = 4096 - v29;
        if (v28 <= 0x3E) {
          goto LABEL_45;
        }
LABEL_49:
        if (v33)
        {
          unint64_t v35 = *v30 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v33);
          BOOL v24 = v35 == 0;
          int v36 = v29 + v33;
          int v37 = v29 + __clz(__rbit64(v35));
          if (v24) {
            LODWORD(v29) = v36;
          }
          else {
            LODWORD(v29) = v37;
          }
        }
        unint64_t v26 = (int)v29;
      }
LABEL_55:
      ++v25;
      if (v26 > 0xFFF || v25 >= v7) {
        return sub_1000127FC(*(void *)(a1 + 16), (__int16 *)((char *)&v40 - ((2 * v7 + 15) & 0xFFFFFFFFFFFFFFF0)), v7);
      }
    }
    unint64_t v33 = 4096 - v29;
LABEL_45:
    int v34 = -(int)v29;
    while (!*v30)
    {
      v33 -= 64;
      ++v30;
      v34 -= 64;
      if (v33 <= 0x3F)
      {
        LODWORD(v29) = -v34;
        goto LABEL_49;
      }
    }
    unint64_t v26 = (int)(__clz(__rbit64(*v30)) - v34);
    goto LABEL_55;
  }
  return sub_1000127FC(*(void *)(a1 + 16), (__int16 *)((char *)&v40 - ((2 * v7 + 15) & 0xFFFFFFFFFFFFFFF0)), v7);
}

void sub_10000ACAC(uint64_t a1, int a2, __int16 a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 16) + 115080);
  if (a2 == 2)
  {
    a4[4] |= 0x400000u;
    int v8 = *(_DWORD *)(a5 + 16) | 0x400000;
  }
  else
  {
    if (a2 != 1)
    {
      a4[4] |= 0x800000u;
      if (a2)
      {
        *(_DWORD *)(a5 + 16) |= 0x800000u;
        a4[3] |= 0xFF0F0000;
        *(_DWORD *)(a5 + 12) = *(_DWORD *)(a5 + 12) & 0xF0FFFF | bswap32(a3 & 0xFFF);
        sub_10000A9AC(a1);
      }
LABEL_9:
      sub_100006B2C(v7, 1, a4, a5, 4u, 16777214);
    }
    a4[4] |= 0x800000u;
    int v8 = *(_DWORD *)(a5 + 16) | 0x800000;
  }
  *(_DWORD *)(a5 + 16) = v8;
  goto LABEL_9;
}

void sub_10000ADF0(uint64_t a1, int a2, __int16 a3)
{
  memset(v4, 0, sizeof(v4));
  memset(v3, 0, sizeof(v3));
  sub_10000ACAC(a1, a2, a3, v3, (uint64_t)v4);
}

void *sub_10000AEA4(void *result, int a2, int a3)
{
  uint64_t v3 = (uint64_t)result;
  int v4 = result + 4795;
  switch(a2)
  {
    case 0:
      uint64_t result = (void *)*v4;
      if (*v4)
      {
        uint64_t result = (void *)sub_100006BE0(result);
        void *v4 = 0;
      }
      break;
    case 1:
      uint64_t result = (void *)result[4796];
      if (result)
      {
        uint64_t result = (void *)sub_100006BE0(result);
        v4[1] = 0;
      }
      break;
    case 2:
      uint64_t result = (void *)result[4797];
      if (result)
      {
        uint64_t result = (void *)sub_100006BE0(result);
        void v4[2] = 0;
      }
      break;
    case 3:
      int v5 = &result[a3];
      uint64_t v6 = (void *)v5[699];
      if (v6)
      {
        uint64_t v7 = v5 + 699;
        sub_100006BE0(v6);
        *uint64_t v7 = 0;
      }
      uint64_t result = (void *)sub_10000A9AC(v3);
      break;
    default:
      return result;
  }
  return result;
}

void *sub_10000AF7C(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 38368);
  uint64_t v2 = *(void **)(a1 + 38368);
  if (v2)
  {
    sub_100006BE0(v2);
    *uint64_t v1 = 0;
  }
  uint64_t result = (void *)v1[1];
  if (result)
  {
    uint64_t result = (void *)sub_100006BE0(result);
    v1[1] = 0;
  }
  return result;
}

void sub_10000AFC0(uint64_t a1)
{
  memset(v2, 0, sizeof(v2));
  memset(v1, 0, sizeof(v1));
  sub_10000ACAC(a1, 1, 0, v1, (uint64_t)v2);
}

void sub_10000B120(uint64_t a1)
{
  uint64_t v1 = 0;
  uint64_t v2 = 5080;
  while (1)
  {
    unint64_t v3 = *(void *)(a1 + v2);
    if (v3) {
      break;
    }
    v1 -= 64;
    v2 += 8;
    if (v1 == -4096) {
      goto LABEL_7;
    }
  }
  uint64_t v4 = __clz(__rbit64(v3)) - v1;
  if (v4 <= 0xFFF)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
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
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    sub_10000ACAC(a1, 3, v4, &v7, (uint64_t)&v39);
  }
LABEL_7:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
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
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  int v5 = (uint64_t *)(*(void *)(a1 + 16) + 115080);
  uint64_t v6 = *v5;
  int v71 = 1;
  uint64_t v72 = v5[3];
  LODWORD(v8) = 0x800000;
  sub_100006B2C(v6, 1, &v7, (uint64_t)&v39, 4u, 16777214);
}

void *sub_10000B41C(uint64_t a1)
{
  uint64_t v2 = (void **)(a1 + 38360);
  if (*(unsigned char *)(a1 + 38384)) {
    sub_10000AF7C(a1);
  }
  uint64_t result = *v2;
  if (*v2)
  {
    uint64_t result = (void *)sub_100006BE0(result);
    void *v2 = 0;
  }
  uint64_t v4 = 0;
  for (uint64_t i = 5080; ; i += 8)
  {
    unint64_t v6 = *(void *)(a1 + i);
    if (v6) {
      break;
    }
    v4 -= 64;
    if (v4 == -4096) {
      return result;
    }
  }
  uint64_t v7 = __clz(__rbit64(v6)) - v4;
  if (v7 <= 0xFFF)
  {
    unint64_t v8 = v7;
    while (1)
    {
      uint64_t result = sub_10000AEA4((void *)a1, 3, (unsigned __int16)v8);
      if (v8 == 4095) {
        return result;
      }
      unint64_t v9 = (v8 + 1) >> 6;
      uint64_t v10 = (v9 << 6);
      long long v11 = (unint64_t *)(a1 + 5080 + 8 * v9);
      if (((v8 + 1) & 0x3F) == 0) {
        break;
      }
      unint64_t v12 = *v11 & ~(0xFFFFFFFFFFFFFFFFLL >> -((v8 + 1) & 0x3F));
      if (v12)
      {
        unint64_t v8 = v10 | __clz(__rbit64(v12));
      }
      else
      {
        if ((unint64_t)(v10 - 4032) < 0x41) {
          return result;
        }
        uint64_t v10 = (v10 + 64);
        ++v11;
        unint64_t v13 = 4096 - v10;
        if (v9 <= 0x3E) {
          goto LABEL_18;
        }
LABEL_22:
        if (v13)
        {
          unint64_t v16 = *v11 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v13);
          BOOL v15 = v16 == 0;
          int v17 = v10 + v13;
          int v18 = v10 + __clz(__rbit64(v16));
          if (v15) {
            LODWORD(v10) = v17;
          }
          else {
            LODWORD(v10) = v18;
          }
        }
        unint64_t v8 = (int)v10;
      }
LABEL_28:
      if (v8 >= 0x1000) {
        return result;
      }
    }
    unint64_t v13 = 4096 - v10;
LABEL_18:
    int v14 = -(int)v10;
    while (!*v11)
    {
      v13 -= 64;
      ++v11;
      v14 -= 64;
      if (v13 <= 0x3F)
      {
        LODWORD(v10) = -v14;
        goto LABEL_22;
      }
    }
    unint64_t v8 = (int)(__clz(__rbit64(*v11)) - v14);
    goto LABEL_28;
  }
  return result;
}

uint64_t sub_10000B5A8(uint64_t result, uint64_t *a2)
{
  int v3 = *((unsigned __int8 *)a2 + 16);
  if (v3 == 2)
  {
    int v4 = *((_DWORD *)a2 + 32);
    sub_10000A490(result, (uint64_t)(a2 + 3));
    int v5 = *((unsigned __int8 *)a2 + 24);
    if ((v5 & 1) == 0)
    {
      if (dword_1000284F8) {
        IOLog("mlx5:%s:%d removing HW mac %02x:%02x:%02x:%02x:%02x:%02x at ix %d\n", "executeAction", 534, v5, *((unsigned __int8 *)a2 + 25), *((unsigned __int8 *)a2 + 26), *((unsigned __int8 *)a2 + 27), *((unsigned __int8 *)a2 + 28), *((unsigned __int8 *)a2 + 29), v4);
      }
      uint64_t v6 = *a2;
      if (*a2) {
        *(void *)(v6 + 8) = a2[1];
      }
      *(void *)a2[1] = v6;
      operator delete();
    }
    uint64_t v7 = *a2;
    if (*a2) {
      *(void *)(v7 + 8) = a2[1];
    }
    *(void *)a2[1] = v7;
    operator delete();
  }
  if (v3 == 1)
  {
    *((_DWORD *)a2 + 32) = -1;
    memset(v9, 0, sizeof(v9));
    memset(v8, 0, sizeof(v8));
    sub_10000A590(result, (unsigned __int8 *)a2 + 24, 0, (uint64_t)v8, (uint64_t)v9);
  }
  return result;
}

uint64_t sub_10000B8AC(uint64_t a1)
{
  uint64_t v2 = a1 + 38448;
  uint64_t result = sub_10000B998(a1 + 664, a1 + 544);
  if (*(_DWORD *)(v2 + 8))
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    uint64_t v6 = a1 + 2712;
    do
    {
      if (dword_1000284F8)
      {
        uint64_t v7 = (unsigned __int8 *)(*(void *)v2 + v4);
        IOLog("mlx5:%s:%d mcast %02x:%02x:%02x:%02x:%02x:%02x\n", "syncIfAddr", 558, *v7, v7[1], v7[2], v7[3], v7[4], v7[5]);
      }
      uint64_t result = sub_10000B998(v6, *(void *)v2 + v4);
      ++v5;
      v4 += 6;
    }
    while (v5 < *(unsigned int *)(v2 + 8));
  }
  return result;
}

uint64_t sub_10000B998(uint64_t result, uint64_t a2)
{
  uint64_t v2 = (uint64_t *)(result + 8 * *(unsigned __int8 *)(a2 + 5));
  do
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (!v2) {
      operator new();
    }
  }
  while (*((_DWORD *)v2 + 6) != *(_DWORD *)a2 || *((unsigned __int16 *)v2 + 14) != *(unsigned __int16 *)(a2 + 4));
  if (*((unsigned char *)v2 + 16) == 2) {
    *((unsigned char *)v2 + 16) = 0;
  }
  return result;
}

uint64_t sub_10000BA64(uint64_t result, int a2, uint64_t a3, int a4)
{
  uint64_t v4 = result + 664;
  if (!a2)
  {
    int v6 = *(_DWORD *)(result + 544);
    *(_WORD *)(a3 + 4) = *(_WORD *)(result + 548);
    goto LABEL_5;
  }
  uint64_t v4 = result + 2712;
  int v5 = *(unsigned __int8 *)(result + 5072);
  if (*(unsigned char *)(result + 5072))
  {
    int v6 = -1;
    *(_WORD *)(a3 + 4) = -1;
LABEL_5:
    *(_DWORD *)a3 = v6;
    int v5 = 1;
  }
  for (uint64_t i = 0; i != 256; ++i)
  {
    unint64_t v8 = *(uint64_t **)(v4 + 8 * i);
    while (v8)
    {
      unint64_t v9 = v8;
      int v10 = *((unsigned __int16 *)v8 + 14);
      unint64_t v8 = (uint64_t *)*v8;
      int v12 = *((_DWORD *)v9 + 6);
      long long v11 = (int *)(v9 + 3);
      if (*(_DWORD *)(result + 544) != v12 || *(unsigned __int16 *)(result + 548) != v10)
      {
        if (v5 >= a4) {
          break;
        }
        uint64_t v14 = a3 + 6 * v5;
        int v15 = *v11;
        ++v5;
        *(_WORD *)(v14 + 4) = *((_WORD *)v11 + 2);
        *(_DWORD *)uint64_t v14 = v15;
      }
    }
  }
  return result;
}

uint64_t sub_10000BB0C(uint64_t a1, int a2)
{
  if (a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 5072);
    uint64_t v5 = *(void *)(a1 + 16);
    __int16 v6 = *(_WORD *)(v5 + 486);
  }
  else
  {
    unsigned int v4 = 0;
    uint64_t v5 = *(void *)(a1 + 16);
    LOBYTE(v6) = bswap32(*(_DWORD *)(v5 + 484));
  }
  uint64_t v7 = 0;
  char v8 = v6 & 0x1F;
  uint64_t v9 = a1 + 664;
  if (a2) {
    uint64_t v9 = a1 + 2712;
  }
  do
  {
    int v10 = (void *)(v9 + 8 * v7);
    --v4;
    do
    {
      int v10 = (void *)*v10;
      ++v4;
    }
    while (v10);
    ++v7;
  }
  while (v7 != 256);
  int v11 = 1 << v8;
  if ((int)v4 <= 1 << v8)
  {
    if (!v4)
    {
      uint64_t result = sub_1000125A8(v5, a2, 0, 0);
      goto LABEL_16;
    }
  }
  else
  {
    int v12 = "MC";
    if (!a2) {
      int v12 = "UC";
    }
    IOLog("mlx5: ifp %s list size (%d) > (%d) max vport list size, some addresses will be dropped\n", v12, v4, v11);
    unsigned int v4 = v11;
  }
  bzero((char *)&v15 - ((6 * v4 + 15) & 0xFFFFFFFF0), (int)(6 * v4));
  sub_10000BA64(a1, a2, (uint64_t)&v15 - ((6 * v4 + 15) & 0xFFFFFFFF0), v4);
  uint64_t result = sub_1000125A8(*(void *)(a1 + 16), a2, (uint64_t)&v15 - ((6 * v4 + 15) & 0xFFFFFFFF0), v4);
LABEL_16:
  if (result != -536870185 && result)
  {
    uint64_t v14 = "MC";
    if (!a2) {
      uint64_t v14 = "UC";
    }
    return IOLog("mlx5: failed to modify vport %s list err(%x)\n", v14, result);
  }
  return result;
}

uint64_t sub_10000BCA8(uint64_t a1)
{
  uint64_t v2 = (char *)(a1 + 5073);
  sub_10000BB0C(a1, 0);
  sub_10000BB0C(a1, 1);
  uint64_t v3 = *(void *)(a1 + 16);
  char v4 = *v2;
  char v5 = v2[1];
  return sub_100012F74(v3, 0, v4, v5);
}

uint64_t sub_10000BD04(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = 0;
  uint64_t v3 = result + 664;
  do
  {
    char v4 = *(uint64_t **)(v3 + 8 * v2);
    if (v4)
    {
      do
      {
        uint64_t v5 = *v4;
        uint64_t result = sub_10000B5A8(v1, v4);
        char v4 = (uint64_t *)v5;
      }
      while (v5);
    }
    ++v2;
  }
  while (v2 != 256);
  for (uint64_t i = 0; i != 256; ++i)
  {
    uint64_t v7 = *(uint64_t **)(v1 + 8 * i + 2712);
    if (v7)
    {
      do
      {
        uint64_t v8 = *v7;
        uint64_t result = sub_10000B5A8(v1, v7);
        uint64_t v7 = (uint64_t *)v8;
      }
      while (v8);
    }
  }
  return result;
}

uint64_t sub_10000BD8C(uint64_t a1, int a2)
{
  for (uint64_t i = 0; i != 256; ++i)
  {
    char v4 = *(uint64_t **)(a1 + 664 + 8 * i);
    if (v4)
    {
      do
      {
        uint64_t v5 = (uint64_t *)*v4;
        *((unsigned char *)v4 + 16) = 2;
        char v4 = v5;
      }
      while (v5);
    }
  }
  for (uint64_t j = 0; j != 256; ++j)
  {
    uint64_t v7 = *(uint64_t **)(a1 + 8 * j + 2712);
    if (v7)
    {
      do
      {
        uint64_t v8 = (uint64_t *)*v7;
        *((unsigned char *)v7 + 16) = 2;
        uint64_t v7 = v8;
      }
      while (v8);
    }
  }
  if (a2) {
    sub_10000B8AC(a1);
  }
  return sub_10000BD04(a1);
}

uint64_t sub_10000BE2C(uint64_t a1, int a2)
{
  char v2 = a2;
  char v4 = (unsigned char *)(a1 + 38384);
  uint64_t v5 = (unsigned char *)(a1 + 5072);
  char v6 = a2 ^ 1;
  if (*(unsigned char *)(a1 + 5074)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = a2 == 0;
  }
  if (v7)
  {
    BOOL v9 = *(unsigned __int8 *)(a1 + 5074) != 0;
    if (*(unsigned char *)(a1 + 5074)) {
      char v8 = a2 ^ 1;
    }
    else {
      char v8 = 1;
    }
    if (v8)
    {
      int v10 = 0;
    }
    else
    {
      int v10 = 0;
      BOOL v9 = (*(_WORD *)(a1 + 38442) & 0x100) == 0;
    }
  }
  else
  {
    BOOL v9 = 0;
    int v10 = HIBYTE(*(unsigned __int16 *)(a1 + 38442)) & 1;
  }
  if (*(unsigned char *)(a1 + 5073)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = a2 == 0;
  }
  if (v11)
  {
    BOOL v12 = *(unsigned __int8 *)(a1 + 5073) != 0;
    int v13 = 0;
    if (!*(unsigned char *)(a1 + 5073)) {
      char v6 = 1;
    }
    if ((v6 & 1) == 0) {
      BOOL v12 = (*(_WORD *)(a1 + 38442) & 0x200) == 0;
    }
  }
  else
  {
    BOOL v12 = 0;
    int v13 = (*(unsigned __int16 *)(a1 + 38442) >> 9) & 1;
  }
  if (*v5) {
    int v14 = 0;
  }
  else {
    int v14 = a2;
  }
  if (*v5) {
    char v15 = a2;
  }
  else {
    char v15 = 1;
  }
  *(_DWORD *)(a1 + 4760) = -1;
  *(_WORD *)(a1 + 4764) = -1;
  if (v10)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
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
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    sub_10000A590(a1, (unsigned __int8 *)(a1 + 4968), 2, (uint64_t)&v19, (uint64_t)&v51);
  }
  unint64_t v16 = (unsigned __int8 *)(a1 + 4760);
  if (v13)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
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
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    sub_10000A590(a1, (unsigned __int8 *)(a1 + 4864), 1, (uint64_t)&v19, (uint64_t)&v51);
  }
  if (v14)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
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
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    sub_10000A590(a1, v16, 0, (uint64_t)&v19, (uint64_t)&v51);
  }
  uint64_t v17 = sub_10000BD8C(a1, a2);
  if (v15)
  {
    if (!v12) {
      goto LABEL_35;
    }
LABEL_38:
    uint64_t v17 = sub_10000A490(v17, a1 + 4864);
    if (!v9) {
      goto LABEL_42;
    }
    goto LABEL_39;
  }
  uint64_t v17 = sub_10000A490(v17, (uint64_t)v16);
  if (v12) {
    goto LABEL_38;
  }
LABEL_35:
  if (!v9) {
    goto LABEL_42;
  }
LABEL_39:
  if (!*v4) {
    uint64_t v17 = (uint64_t)sub_10000AF7C(a1);
  }
  sub_10000A490(v17, a1 + 4968);
LABEL_42:
  v5[2] = v2;
  v5[1] = v2;
  unsigned char *v5 = v2;
  return sub_10000BCA8(a1);
}

void sub_10000C198(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = *a2;
  if ((int)v3 >= 1)
  {
    unint64_t v4 = v3 + 1;
    do
    {
      uint64_t v5 = (v4 - 2);
      uint64_t v6 = *(void *)(*((void *)a2 + 2) + 8 * v5);
      if (v6)
      {
        sub_100005BDC(v6);
        *(void *)(*((void *)a2 + 2) + 8 * v5) = 0;
      }
      --v4;
    }
    while (v4 > 1);
  }
  *a2 = 0;
}

uint64_t sub_10000C1FC(uint64_t a1, uint64_t a2)
{
  sub_10000C198(a1, (unsigned int *)a2);
  if (*(void *)(a2 + 16)) {
    operator delete[]();
  }
  *(void *)(a2 + 16) = 0;
  uint64_t result = *(void *)(a2 + 8);
  if (result) {
    uint64_t result = sub_100005854(result);
  }
  *(void *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_10000C250()
{
  return 0;
}

uint64_t sub_10000C258(uint64_t a1)
{
  uint64_t v2 = sub_100005434(*(void *)(*(void *)(a1 + 16) + 115064), 0);
  *(void *)(a1 + 624) = v2;
  if (v2) {
    return 0;
  }
  else {
    return 3758097084;
  }
}

uint64_t sub_10000C2B4(uint64_t a1, int *a2)
{
  uint64_t v3 = 3758097084;
  bzero(v25, 0x400uLL);
  int v29 = -65536;
  int v32 = 255;
  int v33 = -65536;
  int v28 = 0x1000000;
  int v27 = 251658240;
  uint64_t v4 = sub_100005A48(*((void *)a2 + 1));
  uint64_t v5 = *a2;
  *(void *)(*((void *)a2 + 2) + 8 * v5) = v4;
  if (*(void *)(*((void *)a2 + 2) + 8 * v5))
  {
    *a2 = v5 + 1;
    bzero(v25, 0x400uLL);
    int v28 = 0x1000000;
    int v29 = -65536;
    int v32 = 255;
    int v26 = 0x10000000;
    int v27 = 385875968;
    uint64_t v6 = sub_100005A48(*((void *)a2 + 1));
    uint64_t v7 = *a2;
    *(void *)(*((void *)a2 + 2) + 8 * v7) = v6;
    if (*(void *)(*((void *)a2 + 2) + 8 * v7))
    {
      *a2 = v7 + 1;
      bzero(v25, 0x400uLL);
      int v28 = 0x1000000;
      int v29 = -65536;
      int v26 = 402653184;
      int v27 = 419430400;
      uint64_t v8 = sub_100005A48(*((void *)a2 + 1));
      uint64_t v9 = *a2;
      *(void *)(*((void *)a2 + 2) + 8 * v9) = v8;
      if (*(void *)(*((void *)a2 + 2) + 8 * v9))
      {
        *a2 = v9 + 1;
        bzero(v25, 0x400uLL);
        int v26 = 436207616;
        int v27 = 436207616;
        uint64_t v10 = sub_100005A48(*((void *)a2 + 1));
        uint64_t v11 = *a2;
        *(void *)(*((void *)a2 + 2) + 8 * v11) = v10;
        if (*(void *)(*((void *)a2 + 2) + 8 * v11))
        {
          *a2 = v11 + 1;
          bzero(v25, 0x400uLL);
          int v28 = 0x1000000;
          int v29 = -65536;
          int v32 = 255;
          int v30 = -1;
          __int16 v31 = -1;
          int v26 = 452984832;
          int v27 = 440401920;
          uint64_t v12 = sub_100005A48(*((void *)a2 + 1));
          uint64_t v13 = *a2;
          *(void *)(*((void *)a2 + 2) + 8 * v13) = v12;
          if (*(void *)(*((void *)a2 + 2) + 8 * v13))
          {
            *a2 = v13 + 1;
            bzero(v25, 0x400uLL);
            int v28 = 0x1000000;
            int v29 = -65536;
            int v30 = -1;
            __int16 v31 = -1;
            int v26 = 457179136;
            int v27 = 442499072;
            uint64_t v14 = sub_100005A48(*((void *)a2 + 1));
            uint64_t v15 = *a2;
            *(void *)(*((void *)a2 + 2) + 8 * v15) = v14;
            if (*(void *)(*((void *)a2 + 2) + 8 * v15))
            {
              *a2 = v15 + 1;
              bzero(v25, 0x400uLL);
              int v28 = 0x1000000;
              int v30 = -1;
              __int16 v31 = -1;
              int v26 = 459276288;
              int v27 = 443023360;
              uint64_t v16 = sub_100005A48(*((void *)a2 + 1));
              uint64_t v17 = *a2;
              *(void *)(*((void *)a2 + 2) + 8 * v17) = v16;
              if (*(void *)(*((void *)a2 + 2) + 8 * v17))
              {
                *a2 = v17 + 1;
                bzero(v25, 0x400uLL);
                int v28 = 0x1000000;
                int v29 = -65536;
                int v32 = 255;
                LOBYTE(v30) = 1;
                int v26 = 459800576;
                int v27 = 510132224;
                uint64_t v18 = sub_100005A48(*((void *)a2 + 1));
                uint64_t v19 = *a2;
                *(void *)(*((void *)a2 + 2) + 8 * v19) = v18;
                if (*(void *)(*((void *)a2 + 2) + 8 * v19))
                {
                  *a2 = v19 + 1;
                  bzero(v25, 0x400uLL);
                  int v28 = 0x1000000;
                  int v29 = -65536;
                  LOBYTE(v30) = 1;
                  int v26 = 526909440;
                  int v27 = 543686656;
                  uint64_t v20 = sub_100005A48(*((void *)a2 + 1));
                  uint64_t v21 = *a2;
                  *(void *)(*((void *)a2 + 2) + 8 * v21) = v20;
                  if (*(void *)(*((void *)a2 + 2) + 8 * v21))
                  {
                    *a2 = v21 + 1;
                    bzero(v25, 0x400uLL);
                    int v28 = 0x1000000;
                    LOBYTE(v30) = 1;
                    int v26 = 560463872;
                    int v27 = 560463872;
                    uint64_t v22 = sub_100005A48(*((void *)a2 + 1));
                    uint64_t v23 = *a2;
                    *(void *)(*((void *)a2 + 2) + 8 * v23) = v22;
                    if (*(void *)(*((void *)a2 + 2) + 8 * v23))
                    {
                      uint64_t v3 = 0;
                      *a2 = v23 + 1;
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
  return v3;
}

uint64_t sub_10000C674(uint64_t a1)
{
  uint64_t v1 = a1 + 115064;
  *(_DWORD *)(a1 + 115096) = 0;
  uint64_t v2 = sub_100005434(*(void *)(a1 + 115064), 0);
  *(void *)(v1 + 40) = v2;
  if (v2) {
    operator new[]();
  }
  return 3758097084;
}

uint64_t sub_10000C708(uint64_t a1, int *a2)
{
  uint64_t v3 = 3758097084;
  bzero(v11, 0x400uLL);
  uint64_t v15 = 0x800000FF0F0000;
  int v14 = 0x1000000;
  int v13 = -15794176;
  uint64_t v4 = sub_100005A48(*((void *)a2 + 1));
  uint64_t v5 = *a2;
  *(void *)(*((void *)a2 + 2) + 8 * v5) = v4;
  if (*(void *)(*((void *)a2 + 2) + 8 * v5))
  {
    *a2 = v5 + 1;
    bzero(v11, 0x400uLL);
    int v14 = 0x1000000;
    HIDWORD(v15) = 0x800000;
    int v12 = 0x100000;
    int v13 = 17825792;
    uint64_t v6 = sub_100005A48(*((void *)a2 + 1));
    uint64_t v7 = *a2;
    *(void *)(*((void *)a2 + 2) + 8 * v7) = v6;
    if (*(void *)(*((void *)a2 + 2) + 8 * v7))
    {
      *a2 = v7 + 1;
      bzero(v11, 0x400uLL);
      int v14 = 0x1000000;
      HIDWORD(v15) = 0x400000;
      int v12 = 34603008;
      int v13 = 34603008;
      uint64_t v8 = sub_100005A48(*((void *)a2 + 1));
      uint64_t v9 = *a2;
      *(void *)(*((void *)a2 + 2) + 8 * v9) = v8;
      if (*(void *)(*((void *)a2 + 2) + 8 * v9))
      {
        uint64_t v3 = 0;
        *a2 = v9 + 1;
      }
    }
  }
  return v3;
}

uint64_t sub_10000C844(uint64_t a1)
{
  uint64_t v1 = a1 + 115064;
  *(_DWORD *)(a1 + 115072) = 0;
  uint64_t v2 = sub_100005434(*(void *)(a1 + 115064), 0);
  *(void *)(v1 + 16) = v2;
  if (v2) {
    operator new[]();
  }
  return 3758097084;
}

uint64_t sub_10000C8D8(uint64_t a1, int *a2)
{
  uint64_t v3 = 3758097084;
  bzero(v11, 0x400uLL);
  int v15 = -65536;
  int v16 = 255;
  int v14 = 0x4000000;
  int v13 = 117440512;
  uint64_t v4 = sub_100005A48(*((void *)a2 + 1));
  uint64_t v5 = *a2;
  *(void *)(*((void *)a2 + 2) + 8 * v5) = v4;
  if (*(void *)(*((void *)a2 + 2) + 8 * v5))
  {
    *a2 = v5 + 1;
    bzero(v11, 0x400uLL);
    int v14 = 0x4000000;
    int v15 = -65536;
    int v12 = 0x8000000;
    int v13 = 150994944;
    uint64_t v6 = sub_100005A48(*((void *)a2 + 1));
    uint64_t v7 = *a2;
    *(void *)(*((void *)a2 + 2) + 8 * v7) = v6;
    if (*(void *)(*((void *)a2 + 2) + 8 * v7))
    {
      *a2 = v7 + 1;
      bzero(v11, 0x400uLL);
      int v12 = 167772160;
      int v13 = 167772160;
      uint64_t v8 = sub_100005A48(*((void *)a2 + 1));
      uint64_t v9 = *a2;
      *(void *)(*((void *)a2 + 2) + 8 * v9) = v8;
      if (*(void *)(*((void *)a2 + 2) + 8 * v9))
      {
        uint64_t v3 = 0;
        *a2 = v9 + 1;
      }
    }
  }
  return v3;
}

uint64_t sub_10000CA0C(uint64_t a1)
{
  *(_DWORD *)(a1 + 640) = 0;
  uint64_t v2 = sub_100005434(*(void *)(*(void *)(a1 + 16) + 115064), 0);
  *(void *)(a1 + 648) = v2;
  if (v2) {
    operator new[]();
  }
  return 3758097084;
}

uint64_t sub_10000CAA8(uint64_t a1)
{
  uint64_t result = sub_10000C844(a1);
  if (!result)
  {
    return sub_10000C674(a1);
  }
  return result;
}

uint64_t sub_10000CAF0(uint64_t a1)
{
  uint64_t v2 = sub_10000C1FC(a1, a1 + 115096);
  return sub_10000C1FC(v2, a1 + 115072);
}

uint64_t sub_10000CB34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t result = sub_10000C844(v1);
  if (!result)
  {
    return sub_10000C674(v1);
  }
  return result;
}

uint64_t sub_10000CB80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = sub_10000C1FC(a1, v1 + 115096);
  return sub_10000C1FC(v2, v1 + 115072);
}

uint64_t sub_10000CBC4(uint64_t a1, _DWORD *a2)
{
  int v8 = 0;
  uint64_t v7 = 0;
  int v6 = 5640;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v6, 16, (uint64_t)v4, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v4);
    if (!result) {
      *a2 = bswap32(v5 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_10000CC34(uint64_t a1, int a2)
{
  v4[1] = 0;
  v4[0] = 5896;
  void v4[2] = bswap32(a2 & 0xFFFFFF);
  v4[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v4, 16, (uint64_t)v3, 16);
  if (!result) {
    return sub_100010B8C(v3);
  }
  return result;
}

uint64_t sub_10000CC8C(uint64_t a1, _WORD *a2, int a3, _DWORD *a4)
{
  *a2 = 2057;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a2, a3, (uint64_t)v6, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v6);
    if (!result) {
      *a4 = bswap32(v7 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_10000CCEC(uint64_t a1, _WORD *a2, int a3)
{
  *a2 = 2313;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a2, a3, (uint64_t)v4, 16);
  if (!result) {
    return sub_100010B8C(v4);
  }
  return result;
}

uint64_t sub_10000CD2C(uint64_t a1, int a2)
{
  v4[1] = 0;
  v4[0] = 2569;
  void v4[2] = bswap32(a2 & 0xFFFFFF);
  v4[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v4, 16, (uint64_t)v3, 16);
  if (!result) {
    return sub_100010B8C(v3);
  }
  return result;
}

uint64_t sub_10000CD84(uint64_t a1, int a2, unsigned __int8 *a3)
{
  v5[1] = 0;
  v5[0] = 2825;
  v5[2] = bswap32(a2 & 0xFFFFFF);
  v5[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v5, 16, (uint64_t)a3, 272);
  if (!result) {
    return sub_100010B8C(a3);
  }
  return result;
}

uint64_t sub_10000CDE8(uint64_t a1, _WORD *a2, int a3, _DWORD *a4)
{
  *a2 = 1033;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a2, a3, (uint64_t)v6, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v6);
    if (!result) {
      *a4 = bswap32(v7 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_10000CE48(uint64_t a1, _WORD *a2, int a3)
{
  *a2 = 1289;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a2, a3, (uint64_t)v4, 16);
  if (!result) {
    return sub_100010B8C(v4);
  }
  return result;
}

uint64_t sub_10000CE88(uint64_t a1, int a2)
{
  v4[1] = 0;
  v4[0] = 1545;
  void v4[2] = bswap32(a2 & 0xFFFFFF);
  v4[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v4, 16, (uint64_t)v3, 16);
  if (!result) {
    return sub_100010B8C(v3);
  }
  return result;
}

uint64_t sub_10000CEE0(uint64_t a1, int a2, unsigned __int8 *a3)
{
  v5[1] = 0;
  v5[0] = 1801;
  v5[2] = bswap32(a2 & 0xFFFFFF);
  v5[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v5, 16, (uint64_t)a3, 272);
  if (!result) {
    return sub_100010B8C(a3);
  }
  return result;
}

uint64_t sub_10000CF44(uint64_t a1, _WORD *a2, int a3, _DWORD *a4)
{
  *a2 = 9;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a2, a3, (uint64_t)v6, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v6);
    if (!result) {
      *a4 = bswap32(v7 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_10000CFA4(uint64_t a1, uint64_t a2, int a3, int a4)
{
  *(_WORD *)a2 = 265;
  *(_DWORD *)(a2 + 8) = bswap32(a4 & 0xFFFFFF | (*(_DWORD *)(a2 + 8) << 24));
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), a2, a3, (uint64_t)v5, 16);
  if (!result) {
    return sub_100010B8C(v5);
  }
  return result;
}

uint64_t sub_10000CFF4(uint64_t a1, int a2)
{
  v4[1] = 0;
  v4[0] = 521;
  void v4[2] = bswap32(a2 & 0xFFFFFF);
  v4[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v4, 16, (uint64_t)v3, 16);
  if (!result) {
    return sub_100010B8C(v3);
  }
  return result;
}

uint64_t sub_10000D04C(uint64_t a1, _WORD *a2, int a3, _DWORD *a4)
{
  *a2 = 4617;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a2, a3, (uint64_t)v6, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v6);
    if (!result) {
      *a4 = bswap32(v7 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_10000D0AC(uint64_t a1, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)(a3 + 8) = bswap32(a2 & 0xFFFFFF | (*(_DWORD *)(a3 + 8) << 24));
  *(_WORD *)a3 = 4873;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), a3, a4, (uint64_t)v5, 16);
  if (!result) {
    return sub_100010B8C(v5);
  }
  return result;
}

uint64_t sub_10000D108(uint64_t a1, int a2)
{
  v4[1] = 0;
  v4[0] = 5129;
  void v4[2] = bswap32(a2 & 0xFFFFFF);
  v4[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v4, 16, (uint64_t)v3, 16);
  if (!result) {
    return sub_100010B8C(v3);
  }
  return result;
}

uint64_t sub_10000D160(uint64_t a1, _WORD *a2, int a3, _DWORD *a4)
{
  *a2 = 5641;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a2, a3, (uint64_t)v6, 64);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v6);
    if (!result) {
      *a4 = bswap32(v7 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_10000D1C0(uint64_t a1, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)(a3 + 8) = bswap32(a2 & 0xFFFFFF | (*(_DWORD *)(a3 + 8) << 24));
  *(_WORD *)a3 = 5897;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), a3, a4, (uint64_t)v5, 16);
  if (!result) {
    return sub_100010B8C(v5);
  }
  return result;
}

uint64_t sub_10000D21C(uint64_t a1, int a2)
{
  v4[1] = 0;
  v4[0] = 6153;
  void v4[2] = bswap32(a2 & 0xFFFFFF);
  v4[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v4, 16, (uint64_t)v3, 16);
  if (!result) {
    return sub_100010B8C(v3);
  }
  return result;
}

void sub_10000D274(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 72);
  int v4 = *(_DWORD *)(a1 + 80);
  if (v2)
  {
    uint64_t v5 = v2 + ((unint64_t)((v4 - 1) & v3) << 6);
    if (((((v4 & v3) != 0) ^ *(unsigned __int8 *)(v5 + 63)) & 1) == 0)
    {
      int v6 = 0;
      do
      {
        __dmb(1u);
        int v7 = *(unsigned __int8 *)(v5 + 1);
        if (v7 == 10)
        {
          unsigned int v8 = bswap32(*(_DWORD *)(v5 + 32));
          if (dword_1000284F8) {
            IOLog("mlx5:%s:%d EQ::interrupt: cmd completion %x\n", "cmd_interrupt", 137, v8);
          }
          sub_10001010C(*(void *)(*(void *)(a1 + 56) + 352), v8);
        }
        else
        {
          IOLog("mlx5: EQ::interrupt: Unhandled event 0x%x on EQ 0x%x\n", v7, *(unsigned __int8 *)(a1 + 77));
        }
        int v3 = *(_DWORD *)(a1 + 72) + 1;
        *(_DWORD *)(a1 + 72) = v3;
        if (v6 >= 127)
        {
          sub_10000D3E4(a1, 0);
          int v6 = 0;
          int v3 = *(_DWORD *)(a1 + 72);
        }
        else
        {
          ++v6;
        }
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = *(_DWORD *)(a1 + 80);
        if (!v9) {
          break;
        }
        uint64_t v5 = v9 + ((unint64_t)((v10 - 1) & v3) << 6);
      }
      while (((((v10 & v3) != 0) ^ *(unsigned __int8 *)(v5 + 63)) & 1) == 0);
    }
  }
  IOPCIDevice::MemoryWrite32((IOPCIDevice *)qword_100028500, 0, *(void *)(a1 + 64), bswap32(v3 & 0xFFFFFF | (*(unsigned __int8 *)(a1 + 77) << 24)));
  __dmb(0xFu);
}

void sub_10000D3E4(uint64_t a1, int a2)
{
  uint64_t v2 = 8;
  if (a2) {
    uint64_t v2 = 0;
  }
  IOPCIDevice::MemoryWrite32((IOPCIDevice *)qword_100028500, 0, *(void *)(a1 + 64) + v2, bswap32(*(_DWORD *)(a1 + 72) & 0xFFFFFF | (*(unsigned __int8 *)(a1 + 77) << 24)));
  __dmb(0xFu);
}

void sub_10000D430(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 72);
  int v4 = *(_DWORD *)(a1 + 80);
  if (v2)
  {
    uint64_t v5 = v2 + ((unint64_t)((v4 - 1) & v3) << 6);
    if (((((v4 & v3) != 0) ^ *(unsigned __int8 *)(v5 + 63)) & 1) == 0)
    {
      int v6 = 0;
      do
      {
        __dmb(1u);
        int v7 = *(unsigned __int8 *)(v5 + 1);
        if (v7 == 11)
        {
          unsigned int v8 = bswap32(*(unsigned __int16 *)(v5 + 34)) >> 16;
          signed int v9 = bswap32(*(_DWORD *)(v5 + 36));
          if (dword_1000284F8) {
            IOLog("mlx5:%s:%d EQ::interrupt: page request for func 0x%x, npages %d\n", "pages_interrupt", 171, v8, v9);
          }
          sub_1000084AC(*(void *)(a1 + 56), v8, v9);
        }
        else
        {
          IOLog("mlx5: EQ::interrupt: Unhandled event 0x%x on EQ 0x%x\n", v7, *(unsigned __int8 *)(a1 + 77));
        }
        int v3 = *(_DWORD *)(a1 + 72) + 1;
        *(_DWORD *)(a1 + 72) = v3;
        if (v6 >= 127)
        {
          sub_10000D3E4(a1, 0);
          int v6 = 0;
          int v3 = *(_DWORD *)(a1 + 72);
        }
        else
        {
          ++v6;
        }
        uint64_t v10 = *(void *)(a1 + 40);
        int v11 = *(_DWORD *)(a1 + 80);
        if (!v10) {
          break;
        }
        uint64_t v5 = v10 + ((unint64_t)((v11 - 1) & v3) << 6);
      }
      while (((((v11 & v3) != 0) ^ *(unsigned __int8 *)(v5 + 63)) & 1) == 0);
    }
  }
  IOPCIDevice::MemoryWrite32((IOPCIDevice *)qword_100028500, 0, *(void *)(a1 + 64), bswap32(v3 & 0xFFFFFF | (*(unsigned __int8 *)(a1 + 77) << 24)));
  __dmb(0xFu);
}

void sub_10000D5B4(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 72);
  int v4 = *(_DWORD *)(a1 + 80);
  if (v2)
  {
    uint64_t v5 = (unsigned __int8 *)(v2 + ((unint64_t)((v4 - 1) & v3) << 6));
    if (((((v4 & v3) != 0) ^ v5[63]) & 1) == 0)
    {
      int v6 = 0;
      do
      {
        __dmb(1u);
        unsigned int v7 = v5[1];
        switch(v5[1])
        {
          case 1u:
          case 2u:
          case 3u:
          case 5u:
          case 7u:
          case 0x10u:
          case 0x11u:
          case 0x13u:
            sub_10000D8D8(v7);
            a1 = IOLog("mlx5: EQ::interrupt: event %s(%d) arrived on resource 0x%x\n");
            break;
          case 4u:
            a1 = IOLog("mlx5: EQ::interrupt: CQ error on CQN 0x%x, syndrom 0x%x\n");
            break;
          case 9u:
            int v8 = v5[3];
            if ((v8 - 4) < 6 || v8 == 1)
            {
              if (dword_1000284F8)
              {
                IOLog("mlx5:%s:%d EQ::interrupt: Port change event: %d\n", "async_interrupt", 235, v5[3]);
                int v8 = v5[3];
              }
              unsigned int v10 = v8 - 4;
              if (v10 > 5) {
                int v11 = 2;
              }
              else {
                int v11 = dword_1000218B0[(char)v10];
              }
              a1 = sub_10000ED74(*(void *)(v1 + 56), v11);
            }
            else
            {
              a1 = IOLog("mlx5: EQ::interrupt: Port event with unrecognized subtype: port %d, sub_type %d\n");
            }
            break;
          case 0xDu:
          case 0x22u:
            break;
          case 0x12u:
          case 0x14u:
            sub_10000D8D8(v7);
            a1 = IOLog("mlx5: EQ::interrupt: SRQ event %s(%d): srqn 0x%x\n");
            break;
          case 0x16u:
            sub_10000D900(a1, (uint64_t)v5);
            break;
          case 0x1Eu:
            if (v5[3] - 1 >= 4) {
              a1 = IOLog("mlx5: EQ::interrupt: dcbx event with unrecognized subtype: port %d, sub_type %d\n");
            }
            break;
          default:
            a1 = IOLog("mlx5: EQ::interrupt: Unhandled event 0x%x on EQ 0x%x\n");
            break;
        }
        int v3 = *(_DWORD *)(v1 + 72) + 1;
        *(_DWORD *)(v1 + 72) = v3;
        if (v6 >= 127)
        {
          sub_10000D3E4(v1, 0);
          int v6 = 0;
          int v3 = *(_DWORD *)(v1 + 72);
        }
        else
        {
          ++v6;
        }
        uint64_t v12 = *(void *)(v1 + 40);
        int v13 = *(_DWORD *)(v1 + 80);
        if (!v12) {
          break;
        }
        uint64_t v5 = (unsigned __int8 *)(v12 + ((unint64_t)((v13 - 1) & v3) << 6));
      }
      while (((((v13 & v3) != 0) ^ v5[63]) & 1) == 0);
    }
  }
  IOPCIDevice::MemoryWrite32((IOPCIDevice *)qword_100028500, 0, *(void *)(v1 + 64), bswap32(v3 & 0xFFFFFF | (*(unsigned __int8 *)(v1 + 77) << 24)));
  __dmb(0xFu);
}

const char *sub_10000D8D8(unsigned int a1)
{
  if (a1 > 0x22) {
    return "Unrecognized event";
  }
  else {
    return off_100024578[(char)a1];
  }
}

void sub_10000D900(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned char *)(a2 + 35) & 0xF;
  switch(v2)
  {
    case 3:
      IOLog("mlx5: Module %u, error: %s\n");
      break;
    case 2:
      if (dword_1000284F8) {
        IOLog("mlx5:%s:%d Module %u, status: unplugged\n");
      }
      break;
    case 1:
      if (dword_1000284F8) {
        IOLog("mlx5:%s:%d Module %u, status: plugged\n");
      }
      break;
    default:
      IOLog("mlx5: Module %u, unknown status\n");
      break;
  }
}

void sub_10000D9E0(uint64_t a1)
{
  int v2 = 0;
  unsigned int v3 = *(_DWORD *)(a1 + 72);
  do
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(_DWORD *)(a1 + 80);
    BOOL v6 = (v5 & v3) != 0;
    if (v4)
    {
      uint64_t v7 = v4 + ((unint64_t)((v5 - 1) & v3) << 6);
      unsigned int v8 = v3;
      if (((v6 ^ *(unsigned __int8 *)(v7 + 63)) & 1) == 0)
      {
        do
        {
          if (*(_DWORD *)(*(void *)(a1 + 56) + 123544) == 2)
          {
            __dmb(1u);
            sub_100008DF8(*(void *)(a1 + 56), bswap32(*(_DWORD *)(v7 + 56) & 0xFFFFFF00));
            unsigned int v8 = *(_DWORD *)(a1 + 72);
          }
          *(_DWORD *)(a1 + 72) = ++v8;
          if (v2 >= 127)
          {
            IOPCIDevice::MemoryWrite32((IOPCIDevice *)qword_100028500, 0, *(void *)(a1 + 64) + 8, bswap32(v8 & 0xFFFFFF | (*(unsigned __int8 *)(a1 + 77) << 24)));
            int v2 = 0;
            __dmb(0xFu);
            unsigned int v8 = *(_DWORD *)(a1 + 72);
          }
          else
          {
            ++v2;
          }
          uint64_t v9 = *(void *)(a1 + 40);
          int v10 = *(_DWORD *)(a1 + 80);
          if (!v9) {
            break;
          }
          uint64_t v7 = v9 + ((unint64_t)((v10 - 1) & v8) << 6);
        }
        while (((((v10 & v8) != 0) ^ *(unsigned __int8 *)(v7 + 63)) & 1) == 0);
      }
    }
    else
    {
      unsigned int v8 = v3;
    }
    IOPCIDevice::MemoryWrite32((IOPCIDevice *)qword_100028500, 0, *(void *)(a1 + 64), bswap32(v8 & 0xFFFFFF | (*(unsigned __int8 *)(a1 + 77) << 24)));
    __dmb(0xFu);
    BOOL v11 = v3 == *(_DWORD *)(a1 + 72);
    unsigned int v3 = *(_DWORD *)(a1 + 72);
  }
  while (!v11);
}

uint64_t sub_10000DB28(uint64_t a1, uint64_t a2, char a3, int a4, unint64_t a5, uint64_t a6)
{
  uint64_t v10 = 1 << -(char)__clz((a4 + 128) - 1);
  if (a4 == -127) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = sub_1000094A4((void *)a1, v11 << 6, "EQ", a2);
  *uint64_t v12 = &off_100024568;
  *((_DWORD *)v12 + 18) = 0;
  *((unsigned char *)v12 + 76) = a3;
  *((_DWORD *)v12 + 26) = 0;
  v12[8] = *(void *)(a6 + 8) + 64;
  *((_DWORD *)v12 + 20) = v11;
  if (v11)
  {
    int v13 = (unsigned char *)(*(void *)(a1 + 40) + 63);
    uint64_t v14 = v11;
    do
    {
      unsigned char *v13 = 1;
      v13 += 64;
      --v14;
    }
    while (v14);
  }
  int v15 = (((unint64_t)(*(void *)(a1 + 24) + 0x3FFFLL) >> 11) & 0xFFFFFFF8) + 272;
  int v16 = &v22[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  bzero(v16, v15);
  sub_100009730(a1, (void *)v16 + 34);
  _WORD *v16 = 259;
  unsigned int v17 = *(_DWORD *)(a1 + 80);
  unsigned int v18 = (__clz(v17) << 24) ^ 0x1F000000;
  if (v17) {
    int v19 = v18;
  }
  else {
    int v19 = -16777216;
  }
  *((_DWORD *)v16 + 7) = bswap32(v19 | *(_DWORD *)a6);
  *((unsigned char *)v16 + 39) = *(unsigned char *)(a1 + 76);
  *((unsigned char *)v16 + 40) = 2;
  *((void *)v16 + 11) = bswap64(a5);
  if (sub_1000104C4(*(void *)(*(void *)(a1 + 56) + 352), (uint64_t)v16, v15, (uint64_t)v22, 16)) {
    sub_10001C14C();
  }
  int v20 = v23;
  *(unsigned char *)(a1 + 77) = v23;
  if (dword_1000284F8)
  {
    IOLog("mlx5:%s:%d EQ::init() uar=0x%02x eqn=0x%02x irqn=%d irqLine=%d\n", "AppleEthernetMLX5EQ", 360, *(_DWORD *)a6, v20, *(unsigned __int8 *)(a1 + 76), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 328) + *(unsigned __int8 *)(a1 + 76)));
    LOBYTE(v20) = *(unsigned char *)(a1 + 77);
  }
  IOPCIDevice::MemoryWrite32((IOPCIDevice *)qword_100028500, 0, *(void *)(a1 + 64), bswap32(*(_DWORD *)(a1 + 72) & 0xFFFFFF | (v20 << 24)));
  __dmb(0xFu);
  return a1;
}

uint64_t sub_10000DD30(uint64_t a1)
{
  uint64_t v5 = 0;
  int v4 = 515;
  HIDWORD(v5) = *(unsigned __int8 *)(a1 + 77) << 24;
  int v6 = 0;
  sub_1000104C4(*(void *)(*(void *)(a1 + 56) + 352), (uint64_t)&v4, 16, (uint64_t)&v3, 16);
  return sub_100009610(a1);
}

void sub_10000DD98(uint64_t a1)
{
  sub_10000DD30(a1);
  operator delete();
}

void sub_10000DDD0()
{
}

uint64_t sub_10000DED8(void *a1)
{
  uint64_t v2 = a1[37];
  if (v2)
  {
    sub_10000DD30(v2);
    operator delete();
  }
  uint64_t v3 = a1[38];
  if (v3)
  {
    sub_10000DD30(v3);
    operator delete();
  }
  sub_10000FE7C(a1[44], 0);
  uint64_t result = a1[39];
  if (result)
  {
    sub_10000DD30(result);
    operator delete();
  }
  a1[37] = 0;
  a1[38] = 0;
  a1[39] = 0;
  return result;
}

void sub_10000DF70()
{
}

OSDictionary *sub_10000DF9C(IOService **a1, IOPCIDevice *a2)
{
  uint8_t returnFunctionNumber;
  uint8_t returnDeviceNumber[2];
  int v11;

  int v4 = (OSDictionary *)3758097084;
  uint64_t v11 = 1;
  IOParseBootArgNumber("dk.mlx5", &v11, 4);
  if (v11)
  {
    *(_WORD *)returnDeviceNumber = 0;
    returnFunctionNumber = 0;
    if (IOPCIDevice::GetBusDeviceFunction(a2, &returnDeviceNumber[1], returnDeviceNumber, &returnFunctionNumber, 0)) {
      sub_10001C1A4();
    }
    if (!returnFunctionNumber || (dword_1000284F8 & 0x2000) == 0)
    {
      if (IOPCIDevice::Open(a2, *a1, 0)) {
        sub_10001C178();
      }
      uint8_t readData = 0;
      IOPCIDevice::ConfigurationRead8(a2, 4uLL, &readData);
      IOPCIDevice::ConfigurationWrite8(a2, 4uLL, readData | 2);
      uint32_t v7 = 0;
      IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 4uLL, &v7);
      unsigned int v5 = bswap32(v7) >> 16;
      IOPCIDevice::Close(a2, *a1, 0);
      if (v5 == 5)
      {
        int v4 = OSDictionaryCreate();
        OSDictionarySetStringValue(v4, "IOVendor", "Mellanox");
        OSDictionarySetStringValue(v4, "IOModel", "mlx5");
        IOService::SetProperties(*a1, v4, 0);
        if (v4)
        {
          ((void (*)(OSDictionary *))v4->release)(v4);
          return 0;
        }
      }
      else
      {
        IOLog("Driver cmdif rev(%d) differs from firmware's(%d)\n", 5, v5);
      }
    }
  }
  return v4;
}

uint64_t sub_10000E148(void *a1)
{
  a1[14392] = a1 + 14392;
  a1[14393] = a1 + 14392;
  a1[15425] = a1 + 15424;
  a1[15424] = a1 + 15424;
  a1[35] = a1 + 35;
  a1[36] = a1 + 35;
  IOLog("mlx5: mlx5_debug=%x\n", dword_1000284F8);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0, &readData);
  unsigned int v1 = __rev16(HIWORD(readData));
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0, &v5);
  unsigned int v2 = bswap32(v5) >> 16;
  uint32_t v6 = 0;
  IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 4uLL, &v6);
  IOLog("mlx5: firmware version: %d.%d.%d\n", v1, v2, __rev16(HIWORD(v6)));
  return 0;
}

void sub_10000E230()
{
}

uint64_t sub_10000E50C()
{
  IOSleep(0x7D0uLL);
  uint64_t v0 = -1;
  unsigned int v1 = -2;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0x1FCuLL, &readData);
    uint64_t v2 = bswap32(readData);
    if (v0 != v2)
    {
      uint64_t v0 = v2;
      if (dword_1000284F8)
      {
        IOLog("mlx5:%s:%d OSReadBigInt32(iseg, offsetof(init_seg, initializing)) ==> %x\n", "waitFwInit", 243, v2);
        uint64_t v0 = v2;
      }
    }
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0x1FCuLL, &v5);
    uint64_t v3 = 0;
    if ((v2 & 0x80000000) == 0 || (v5 & 0x80) == 0) {
      break;
    }
    IOSleep(2uLL);
    v1 += 2;
    if (v1 >= 0x7CE)
    {
      uint64_t v3 = 3758097109;
      if (dword_1000284F8) {
        IOLog("mlx5:%s:%d waitFwInit() timed out.\n", "waitFwInit", 250);
      }
      return v3;
    }
  }
  return v3;
}

uint64_t sub_10000E634(uint64_t a1)
{
  int v15 = 0;
  uint64_t v14 = 0;
  int v13 = 2561;
  uint64_t v2 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v13, 16, (uint64_t)v11, 112);
  if (v2 || (uint64_t v2 = sub_100010B8C(v11), v2))
  {
    if (v11[0] == 2)
    {
      IOLog("mlx5: Only ISSI 0 is supported\n");
      return 0;
    }
    int v3 = 286;
    int v4 = "query ISSI";
LABEL_6:
    IOLog("mlx5: failed to %s in %s:%d\n", v4, "setISSI", v3);
    return v2;
  }
  char v6 = bswap32(v12);
  if ((v6 & 2) != 0)
  {
    uint64_t v9 = 0x100000000000000;
    int v8 = 2817;
    int v10 = 0;
    uint64_t v2 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v8, 16, (uint64_t)v7, 16);
    if (!v2)
    {
      uint64_t v2 = sub_100010B8C(v7);
      if (!v2)
      {
        *(_DWORD *)(a1 + 115048) = 1;
        return v2;
      }
    }
    int v3 = 301;
    int v4 = "set ISSI=1";
    goto LABEL_6;
  }
  if (v6) {
    return 0;
  }
  else {
    return 3758097095;
  }
}

uint64_t sub_10000E778(uint64_t a1)
{
  memset(v3, 0, sizeof(v3));
  return sub_1000166A0(a1, v3, 16, &v2, 16, 0x7004u, 0, 1);
}

uint64_t sub_10000E7C0(uint64_t a1)
{
  uint64_t result = sub_10000ED1C(a1, 0);
  if (!result)
  {
    bzero(v13, 0x1010uLL);
    long long v3 = *(_OWORD *)(a1 + 568);
    long long v26 = *(_OWORD *)(a1 + 552);
    long long v27 = v3;
    long long v4 = *(_OWORD *)(a1 + 600);
    long long v28 = *(_OWORD *)(a1 + 584);
    long long v29 = v4;
    long long v5 = *(_OWORD *)(a1 + 504);
    long long v22 = *(_OWORD *)(a1 + 488);
    long long v23 = v5;
    long long v6 = *(_OWORD *)(a1 + 536);
    long long v24 = *(_OWORD *)(a1 + 520);
    long long v25 = v6;
    long long v7 = *(_OWORD *)(a1 + 440);
    long long v18 = *(_OWORD *)(a1 + 424);
    long long v19 = v7;
    long long v8 = *(_OWORD *)(a1 + 472);
    long long v20 = *(_OWORD *)(a1 + 456);
    long long v21 = v8;
    long long v9 = *(_OWORD *)(a1 + 376);
    long long v14 = *(_OWORD *)(a1 + 360);
    long long v15 = v9;
    long long v10 = *(_OWORD *)(a1 + 408);
    long long v16 = *(_OWORD *)(a1 + 392);
    long long v17 = v10;
    if (dword_1000284F8)
    {
      unsigned int v11 = __rev16(*(unsigned __int16 *)(a1 + 410));
      if (v11 <= 5) {
        int v12 = (128 << v11) & 0xFF80;
      }
      else {
        int v12 = 0;
      }
      IOLog("mlx5:%s:%d Current Pkey table size %d Setting new size %d\n", "handleHCACap", 427, v12, 128);
    }
    LODWORD(v17) = (unsigned __int16)v17;
    LODWORD(v18) = v18 & 0xFF3FFFFF;
    WORD1(v23) = 512;
    if ((*(unsigned char *)(a1 + 57748) & 8) != 0) {
      HIDWORD(v16) |= 8u;
    }
    v13[0] = 2305;
    uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v13, 4112, (uint64_t)v30, 16);
    if (!result) {
      return sub_10001115C(v30);
    }
  }
  return result;
}

uint64_t sub_10000E8FC(uint64_t a1)
{
  if (dword_1000284F8)
  {
    unsigned int v2 = *(unsigned __int8 *)(a1 + 415) + 3;
    if (v2 >= 1 << (*(unsigned char *)(a1 + 391) & 0xF)) {
      unsigned int v2 = 1 << (*(unsigned char *)(a1 + 391) & 0xF);
    }
    IOLog("mlx5:%s:%d number of irqs required %d\n", "detectMSI", 202, v2);
  }
  return 0;
}

uint64_t sub_10000E96C(uint64_t a1)
{
  if (*(int *)(a1 + 320) >= 1) {
    operator new();
  }
  return 0;
}

uint64_t sub_10000EA6C(uint64_t a1, int a2)
{
  if (a2) {
    sub_1000154E8(a1 + 123520);
  }
  return 0;
}

uint64_t sub_10000EAC4(uint64_t a1)
{
  sub_10000736C(a1);
  uint64_t result = sub_10000EB70(a1);
  if (*(void *)(a1 + 352))
  {
    sub_10000DED8((void *)a1);
    sub_100007BC4(a1, (_DWORD *)(a1 + 336));
    sub_100009BC8(a1);
    sub_10000883C(a1);
    int v6 = 0;
    uint64_t v5 = 0;
    int v4 = 1281;
    sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v4, 16, (uint64_t)v3, 12);
    uint64_t result = *(void *)(a1 + 352);
    if (result)
    {
      sub_100011120(result);
      operator delete();
    }
    *(void *)(a1 + 352) = 0;
  }
  return result;
}

uint64_t sub_10000EB70(uint64_t result)
{
  unsigned int v1 = *(uint64_t **)(result + 280);
  if (v1 != (uint64_t *)(result + 280))
  {
    uint64_t v2 = (uint64_t)(v1 - 11);
    uint64_t v4 = *v1;
    long long v3 = (void *)v1[1];
    *(void *)(v4 + 8) = v3;
    *long long v3 = v4;
    sub_10000DD94(v2);
    operator delete();
  }
  return result;
}

uint64_t *sub_10000EBD0(uint64_t a1, int a2)
{
  uint64_t v2 = (uint64_t *)(a1 + 280);
  while (1)
  {
    uint64_t v2 = (uint64_t *)*v2;
    if (v2 == (uint64_t *)(a1 + 280)) {
      break;
    }
    if (*((_DWORD *)v2 + 4) == a2) {
      return v2 - 11;
    }
  }
  return 0;
}

uint64_t sub_10000EC00(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v13 = 0;
  v12[0] = 1;
  v12[1] = bswap32(a3 & 1 | (2 * (a2 & 0x7FFF)));
  uint64_t v6 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v12, 16, (uint64_t)v10, 4112);
  if (v6 || (uint64_t v6 = sub_10001115C(v10), v6))
  {
    uint64_t v7 = v6;
    IOLog("mlx5: QUERY_HCA_CAP : type(%x) opmode(%x) Failed(%d)\n", a2, a3, v6);
  }
  else
  {
    if (a3 == 1)
    {
      long long v8 = (void *)(a1 + ((unint64_t)a2 << 12) + 360);
    }
    else
    {
      if (a3)
      {
        IOLog("mlx5: Tried to query dev cap type(%x) with wrong opmode(%x)\n", a2, a3);
        return 3758096385;
      }
      long long v8 = (void *)(a1 + ((unint64_t)a2 << 12) + 57704);
    }
    memcpy(v8, v11, 0x1000uLL);
    return 0;
  }
  return v7;
}

uint64_t sub_10000ED1C(uint64_t a1, unsigned int a2)
{
  uint64_t result = sub_10000EC00(a1, a2, 1);
  if (!result)
  {
    return sub_10000EC00(a1, a2, 0);
  }
  return result;
}

uint64_t sub_10000ED74(uint64_t result, int a2)
{
  if ((a2 - 1) > 1) {
    return IOLog("mlx5::event %x - unsupported\n", a2);
  }
  if (*(_DWORD *)(result + 123544) == 2)
  {
    uint64_t v2 = result + 123520;
    return sub_100013724(v2);
  }
  return result;
}

uint64_t sub_10000EDE4(uint64_t a1, uint64_t a2, int a3)
{
  if ((*(unsigned char *)(a1 + 412) & 1) == 0) {
    return 0;
  }
  memset(&v7[16], 0, 28);
  *(_OWORD *)uint64_t v7 = 0u;
  long long v6 = 0u;
  int v5 = 10504;
  *(_DWORD *)uint64_t v7 = bswap32(a3 & 0xFFFFFF);
  *(_DWORD *)&v7[14] = *(_DWORD *)a2;
  *(_WORD *)&v7[18] = *(_WORD *)(a2 + 4);
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v5, 64, (uint64_t)v4, 16);
  if (!result) {
    return sub_100010B8C(v4);
  }
  return result;
}

uint64_t sub_10000EE6C(uint64_t a1, int a2)
{
  if ((*(unsigned char *)(a1 + 412) & 1) == 0) {
    return 0;
  }
  memset(v7, 0, sizeof(v7));
  long long v6 = 0u;
  long long v5 = 0u;
  int v4 = 11016;
  LODWORD(v6) = bswap32(a2 & 0xFFFFFF);
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v4, 64, (uint64_t)v3, 16);
  if (!result) {
    return sub_100010B8C(v3);
  }
  return result;
}

uint64_t sub_10000EEE4(uint64_t result, unsigned int a2)
{
  *(_OWORD *)(result + 24) = 0u;
  unsigned int v2 = a2 - 16;
  if (a2 < 0x10) {
    unsigned int v2 = 0;
  }
  unsigned int v3 = v2 + 511;
  *(_OWORD *)(result + 40) = 0uLL;
  *(_DWORD *)uint64_t result = a2;
  *(_DWORD *)(result + 4) = v3 >> 9;
  if (v3 >= 0x200) {
    operator new();
  }
  return result;
}

uint64_t sub_10000F024(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    operator delete();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

uint64_t sub_10000F0A0(uint64_t a1, int a2)
{
  unsigned int v4 = bswap32(*(unsigned __int16 *)(*(void *)(a1 + 32) + 16)) >> 16;
  uint64_t v5 = 8;
  if (a2) {
    uint64_t v5 = 0;
  }
  long long v6 = *(unsigned int **)(a1 + v5);
  char v7 = dword_1000284F8;
  if (a2) {
    long long v8 = "INPUT";
  }
  else {
    long long v8 = "OUTPUT";
  }
  long long v9 = sub_10000F224(v4);
  int v10 = *v6;
  if ((v7 & 2) != 0)
  {
    IOLog("mlx5: dump command data %s(0x%x) %s, len = %d\n", v9, v4, v8, v10);
    uint64_t v15 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v11 = v15 + 16;
    }
    else {
      uint64_t v11 = v15 + 32;
    }
    unsigned int v12 = 16;
    int v13 = 16;
    char v14 = 1;
  }
  else
  {
    IOLog("mlx5: dump command %s(0x%x) %s, len = %d\n", v9, v4, v8, v10);
    uint64_t v11 = *(void *)(a1 + 32);
    unsigned int v12 = 64;
    int v13 = 64;
    char v14 = 0;
  }
  uint64_t result = sub_10000FD70(v11, v13, v14, 0);
  for (uint64_t i = (uint64_t *)*((void *)v6 + 3); i; uint64_t i = (uint64_t *)i[2])
  {
    if (*v6 <= v12) {
      break;
    }
    if ((v7 & 2) != 0)
    {
      int v19 = 512;
      int v20 = (int)(*v6 - v12) >= 512 ? 512 : *v6 - v12;
      uint64_t v18 = *i;
      char v21 = 1;
    }
    else
    {
      IOLog("mlx5: command block:\n");
      uint64_t v18 = *i;
      int v19 = 576;
      int v20 = 576;
      char v21 = 0;
    }
    uint64_t result = sub_10000FD70(v18, v20, v21, v12);
    v12 += v19;
  }
  if ((v7 & 2) != 0)
  {
    return IOLog("\n");
  }
  return result;
}

const char *sub_10000F224(int a1)
{
  if (a1 > 2047)
  {
    switch(a1)
    {
      case 2304:
        uint64_t result = "CREATE_TIR";
        break;
      case 2305:
        uint64_t result = "MODIFY_TIR";
        break;
      case 2306:
        uint64_t result = "DESTROY_TIR";
        break;
      case 2307:
        uint64_t result = "QUERY_TIR";
        break;
      case 2308:
        uint64_t result = "CREATE_SQ";
        break;
      case 2309:
        uint64_t result = "MODIFY_SQ";
        break;
      case 2310:
        uint64_t result = "DESTROY_SQ";
        break;
      case 2311:
        uint64_t result = "QUERY_SQ";
        break;
      case 2312:
        uint64_t result = "CREATE_RQ";
        break;
      case 2313:
        uint64_t result = "MODIFY_RQ";
        break;
      case 2314:
        uint64_t result = "DESTROY_RQ";
        break;
      case 2315:
        uint64_t result = "QUERY_RQ";
        break;
      case 2316:
        uint64_t result = "CREATE_RMP";
        break;
      case 2317:
        uint64_t result = "MODIFY_RMP";
        break;
      case 2318:
        uint64_t result = "DESTROY_RMP";
        break;
      case 2319:
        uint64_t result = "QUERY_RMP";
        break;
      case 2320:
      case 2321:
      case 2330:
      case 2331:
      case 2332:
      case 2333:
      case 2334:
      case 2335:
      case 2336:
      case 2337:
      case 2338:
      case 2339:
      case 2340:
      case 2341:
      case 2342:
      case 2343:
      case 2344:
      case 2345:
      case 2346:
      case 2347:
      case 2348:
      case 2349:
      case 2350:
LABEL_149:
        uint64_t result = "unknown command opcode";
        break;
      case 2322:
        uint64_t result = "CREATE_TIS";
        break;
      case 2323:
        uint64_t result = "MODIFY_TIS";
        break;
      case 2324:
        uint64_t result = "DESTROY_TIS";
        break;
      case 2325:
        uint64_t result = "QUERY_TIS";
        break;
      case 2326:
        uint64_t result = "CREATE_RQT";
        break;
      case 2327:
        uint64_t result = "MODIFY_RQT";
        break;
      case 2328:
        uint64_t result = "DESTROY_RQT";
        break;
      case 2329:
        uint64_t result = "QUERY_RQT";
        break;
      case 2351:
        uint64_t result = "SET_FLOW_TABLE_ROOT";
        break;
      case 2352:
        uint64_t result = "CREATE_FLOW_TABLE";
        break;
      case 2353:
        uint64_t result = "DESTROY_FLOW_TABLE";
        break;
      case 2354:
        uint64_t result = "QUERY_FLOW_TABLE";
        break;
      case 2355:
        uint64_t result = "CREATE_FLOW_GROUP";
        break;
      case 2356:
        uint64_t result = "DESTROY_FLOW_GROUP";
        break;
      case 2357:
        uint64_t result = "QUERY_FLOW_GROUP";
        break;
      case 2358:
        uint64_t result = "SET_FLOW_TABLE_ENTRY";
        break;
      case 2359:
        uint64_t result = "QUERY_FLOW_TABLE_ENTRY";
        break;
      case 2360:
        uint64_t result = "DELETE_FLOW_TABLE_ENTRY";
        break;
      case 2361:
        uint64_t result = "ALLOC_FLOW_COUNTER";
        break;
      case 2362:
        uint64_t result = "DEALLOC_FLOW_COUNTER";
        break;
      case 2363:
        uint64_t result = "QUERY_FLOW_COUNTER";
        break;
      case 2364:
        uint64_t result = "MODIFY_FLOW_TABLE";
        break;
      default:
        switch(a1)
        {
          case 2048:
            uint64_t result = "ALLOC_PD";
            break;
          case 2049:
            uint64_t result = "DEALLOC_PD";
            break;
          case 2050:
            uint64_t result = "ALLOC_UAR";
            break;
          case 2051:
            uint64_t result = "DEALLOC_UAR";
            break;
          case 2052:
            uint64_t result = "CONFIG_INT_MODERATION";
            break;
          case 2053:
            uint64_t result = "ACCESS_REG";
            break;
          case 2054:
            uint64_t result = "ATTACH_TO_MCG";
            break;
          case 2055:
            uint64_t result = "DETACH_FROM_MCG";
            break;
          case 2058:
            uint64_t result = "GET_DROPPED_PACKET_LOG";
            break;
          case 2059:
            uint64_t result = "QUERY_MAD_DEMUX";
            break;
          case 2060:
            uint64_t result = "SET_MAD_DEMUX";
            break;
          case 2061:
            uint64_t result = "NOP";
            break;
          case 2062:
            uint64_t result = "ALLOC_XRCD";
            break;
          case 2063:
            uint64_t result = "DEALLOC_XRCD";
            break;
          case 2070:
            uint64_t result = "ALLOC_TRANSPORT_DOMAIN";
            break;
          case 2071:
            uint64_t result = "DEALLOC_TRANSPORT_DOMAIN";
            break;
          case 2082:
            uint64_t result = "QUERY_CONG_STATUS";
            break;
          case 2083:
            uint64_t result = "MODIFY_CONG_STATUS";
            break;
          case 2084:
            uint64_t result = "QUERY_CONG_PARAMS";
            break;
          case 2085:
            uint64_t result = "MODIFY_CONG_PARAMS";
            break;
          case 2086:
            uint64_t result = "QUERY_CONG_STATISTICS";
            break;
          case 2087:
            uint64_t result = "ADD_VXLAN_UDP_DPORT";
            break;
          case 2088:
            uint64_t result = "DELETE_VXLAN_UDP_DPORT";
            break;
          case 2089:
            uint64_t result = "SET_L2_TABLE_ENTRY";
            break;
          case 2090:
            uint64_t result = "QUERY_L2_TABLE_ENTRY";
            break;
          case 2091:
            uint64_t result = "DELETE_L2_TABLE_ENTRY";
            break;
          case 2096:
            uint64_t result = "SET_WOL_ROL";
            break;
          case 2097:
            uint64_t result = "QUERY_WOL_ROL";
            break;
          default:
            goto LABEL_149;
        }
        break;
    }
  }
  else if (a1 > 1535)
  {
    if (a1 <= 1871)
    {
      switch(a1)
      {
        case 1792:
          return "CREATE_SRQ";
        case 1793:
          return "DESTROY_SRQ";
        case 1794:
          return "QUERY_SRQ";
        case 1795:
          return "ARM_RQ";
        case 1796:
        case 1801:
        case 1802:
        case 1803:
        case 1804:
        case 1805:
        case 1806:
        case 1807:
          goto LABEL_149;
        case 1797:
          return "CREATE_XRC_SRQ";
        case 1798:
          return "DESTROY_XRC_SRQ";
        case 1799:
          return "QUERY_XRC_SRQ";
        case 1800:
          return "ARM_XRC_SRQ";
        case 1808:
          return "CREATE_DCT";
        case 1809:
          return "DESTROY_DCT";
        case 1810:
          return "DRAIN_DCT";
        case 1811:
          return "QUERY_DCT";
        case 1812:
          return "ARM_DCT_FOR_KEY_VIOLATION";
        default:
          if (a1 == 1536)
          {
            uint64_t result = "CREATE_PSV";
          }
          else
          {
            if (a1 != 1537) {
              goto LABEL_149;
            }
            uint64_t result = "DESTROY_PSV";
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 1872:
          uint64_t result = "QUERY_VPORT_STATE";
          break;
        case 1873:
          uint64_t result = "MODIFY_VPORT_STATE";
          break;
        case 1874:
          uint64_t result = "QUERY_ESW_VPORT_CONTEXT";
          break;
        case 1875:
          uint64_t result = "MODIFY_ESW_VPORT_CONTEXT";
          break;
        case 1876:
          uint64_t result = "QUERY_NIC_VPORT_CONTEXT";
          break;
        case 1877:
          uint64_t result = "MODIFY_NIC_VPORT_CONTEXT";
          break;
        case 1888:
          uint64_t result = "QUERY_ROCE_ADDRESS";
          break;
        case 1889:
          uint64_t result = "SET_ROCE_ADDRESS";
          break;
        case 1890:
          uint64_t result = "QUERY_HCA_VPORT_CONTEXT";
          break;
        case 1891:
          uint64_t result = "MODIFY_HCA_VPORT_CONTEXT";
          break;
        case 1892:
          uint64_t result = "QUERY_HCA_VPORT_GID";
          break;
        case 1893:
          uint64_t result = "QUERY_HCA_VPORT_PKEY";
          break;
        case 1904:
          uint64_t result = "QUERY_VPORT_COUNTER";
          break;
        case 1905:
          uint64_t result = "ALLOC_Q_COUNTER";
          break;
        case 1906:
          uint64_t result = "DEALLOC_Q_COUNTER";
          break;
        case 1907:
          uint64_t result = "QUERY_Q_COUNTER";
          break;
        default:
          goto LABEL_149;
      }
    }
  }
  else if (a1 > 1023)
  {
    switch(a1)
    {
      case 1280:
        uint64_t result = "CREATE_QP";
        break;
      case 1281:
        uint64_t result = "DESTROY_QP";
        break;
      case 1282:
        uint64_t result = "RST2INIT_QP";
        break;
      case 1283:
        uint64_t result = "INIT2RTR_QP";
        break;
      case 1284:
        uint64_t result = "RTR2RTS_QP";
        break;
      case 1285:
        uint64_t result = "RTS2RTS_QP";
        break;
      case 1286:
        uint64_t result = "SQERR2RTS_QP";
        break;
      case 1287:
        uint64_t result = "2ERR_QP";
        break;
      case 1288:
      case 1289:
        goto LABEL_149;
      case 1290:
        uint64_t result = "2RST_QP";
        break;
      case 1291:
        uint64_t result = "QUERY_QP";
        break;
      case 1292:
        uint64_t result = "SQD_RTS_QP";
        break;
      case 1293:
        uint64_t result = "MAD_IFC";
        break;
      case 1294:
        uint64_t result = "INIT2INIT_QP";
        break;
      default:
        switch(a1)
        {
          case 1024:
            uint64_t result = "CREATE_CQ";
            break;
          case 1025:
            uint64_t result = "DESTROY_CQ";
            break;
          case 1026:
            uint64_t result = "QUERY_CQ";
            break;
          case 1027:
            uint64_t result = "MODIFY_CQ";
            break;
          default:
            goto LABEL_149;
        }
        break;
    }
  }
  else
  {
    int v1 = a1 - 256;
    uint64_t result = "QUERY_HCA_CAP";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "QUERY_ADAPTER";
        break;
      case 2:
        uint64_t result = "INIT_HCA";
        break;
      case 3:
        uint64_t result = "TEARDOWN_HCA";
        break;
      case 4:
        uint64_t result = "ENABLE_HCA";
        break;
      case 5:
        uint64_t result = "DISABLE_HCA";
        break;
      case 6:
        goto LABEL_149;
      case 7:
        uint64_t result = "QUERY_PAGES";
        break;
      case 8:
        uint64_t result = "MANAGE_PAGES";
        break;
      case 9:
        uint64_t result = "SET_HCA_CAP";
        break;
      case 10:
        uint64_t result = "QUERY_ISSI";
        break;
      case 11:
        uint64_t result = "SET_ISSI";
        break;
      default:
        switch("QUERY_HCA_CAP")
        {
          case 0x200u:
            uint64_t result = "CREATE_MKEY";
            break;
          case 0x201u:
            uint64_t result = "QUERY_MKEY";
            break;
          case 0x202u:
            uint64_t result = "DESTROY_MKEY";
            break;
          case 0x203u:
            uint64_t result = "QUERY_SPECIAL_CONTEXTS";
            break;
          case 0x204u:
            uint64_t result = "PAGE_FAULT_RESUME";
            break;
          default:
            switch("QUERY_HCA_CAP")
            {
              case 0x301u:
                uint64_t result = "CREATE_EQ";
                break;
              case 0x302u:
                uint64_t result = "DESTROY_EQ";
                break;
              case 0x303u:
                uint64_t result = "QUERY_EQ";
                break;
              case 0x304u:
                uint64_t result = "GEN_EQE";
                break;
              default:
                goto LABEL_149;
            }
            break;
        }
        break;
    }
  }
  return result;
}

uint64_t sub_10000FD70(uint64_t result, int a2, char a3, int a4)
{
  if (a2 >= 1)
  {
    uint64_t v6 = result;
    uint64_t v7 = 0;
    do
    {
      uint64_t result = IOLog("%03x: %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n", a4 + v7, *(unsigned __int8 *)(v6 + v7), *(unsigned __int8 *)(v6 + v7 + 1), *(unsigned __int8 *)(v6 + v7 + 2), *(unsigned __int8 *)(v6 + v7 + 3), *(unsigned __int8 *)(v6 + v7 + 4), *(unsigned __int8 *)(v6 + v7 + 5), *(unsigned __int8 *)(v6 + v7 + 6), *(unsigned __int8 *)(v6 + v7 + 7), *(unsigned __int8 *)(v6 + v7 + 8), *(unsigned __int8 *)(v6 + v7 + 9), *(unsigned __int8 *)(v6 + v7 + 10), *(unsigned __int8 *)(v6 + v7 + 11), *(unsigned __int8 *)(v6 + v7 + 12), *(unsigned __int8 *)(v6 + v7 + 13), *(unsigned __int8 *)(v6 + v7 + 14), *(unsigned __int8 *)(v6 + v7 + 15));
      v7 += 16;
    }
    while ((int)v7 < a2);
  }
  if ((a3 & 1) == 0)
  {
    return IOLog("\n");
  }
  return result;
}

uint64_t sub_10000FE7C(uint64_t result, int a2)
{
  uint64_t v3 = result;
  if (dword_1000284F8) {
    uint64_t result = IOLog("mlx5:%s:%d pool0=%d, pool1=%d\n", "setCommandMode", 406, *(unsigned __int8 *)(result + 344), *(unsigned __int8 *)(result + 345));
  }
  *(_DWORD *)(v3 + 76) = a2;
  return result;
}

uint64_t sub_10000FEE4(uint64_t a1)
{
  __uint64_t v2 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 60000000000;
  while (1)
  {
    int v3 = IODispatchQueue::Sleep(*(IODispatchQueue **)(*(void *)(*(void *)(a1 + 24) + 56) + 16), (void *)(a1 + 52), 0xBEBC200uLL);
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)(a1 + 52));
    if (v4) {
      break;
    }
    if (v3 != -536870186 && v3 != 0) {
      sub_10001C1D0(v3);
    }
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 56) + 208) == 3
      || (uint32_t readData = 0, IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0, &readData), readData == -1))
    {
      if (dword_1000284F8) {
        IOLog("mlx5:%s:%d unplugged\n", "waitFor", 547);
      }
      uint64_t result = 3758097111;
      atomic_store(1u, (unsigned __int8 *)(a1 + 52));
      uint64_t v7 = *(void *)(a1 + 24);
      uint64_t v8 = 344;
      if (*(_DWORD *)(v7 + 68) != *(_DWORD *)(a1 + 16)) {
        uint64_t v8 = 345;
      }
      --*(unsigned char *)(v7 + v8);
      *(_DWORD *)(a1 + 48) = -536870185;
      return result;
    }
    if (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) >= v2) {
      sub_10001C220();
    }
  }
  if (dword_1000284F8)
  {
    unsigned int v9 = **(unsigned __int8 **)(a1 + 40);
    int v10 = *(_DWORD *)(a1 + 48);
    uint64_t v11 = sub_10001007C(v9);
    IOLog("mlx5:%s:%d ret %x, delivery status %s(%x)\n", "waitFor", 540, v10, v11, v9);
  }
  return *(unsigned int *)(a1 + 48);
}

const char *sub_10001007C(unsigned int a1)
{
  if (a1 > 0x10) {
    return "unknown status code";
  }
  else {
    return off_100024720[(char)a1];
  }
}

BOOL sub_1000100A4(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 80);
  if (v2)
  {
    unsigned int v3 = __clz(v2) ^ 0x1F;
    uint64_t v4 = *(void *)(a1 + 8 * v3 + 88);
    __dmb(1u);
    BOOL result = 1;
    if (*(unsigned char *)(*(void *)(v4 + 32) + 63)) {
      return result;
    }
    sub_10001010C(a1, 1 << v3);
  }
  return *(unsigned __int8 *)(a1 + 344) + *(unsigned __int8 *)(a1 + 345) != 0;
}

uint64_t sub_10001010C(uint64_t result, unsigned int a2)
{
  if (!a2) {
    return result;
  }
  unsigned int v2 = a2;
  uint64_t v3 = result;
  do
  {
    unsigned int v4 = __clz(v2) ^ 0x1F;
    int v5 = 1 << v4;
    uint64_t v6 = *(void *)(v3 + 8 * v4 + 88);
    LOBYTE(v4) = atomic_load((unsigned __int8 *)(v6 + 52));
    if (v4) {
      goto LABEL_26;
    }
    *(_DWORD *)(v3 + 80) &= ~v5;
    __dmb(1u);
    *(_OWORD *)(*(void *)(v6 + 8) + 8) = *(_OWORD *)(*(void *)(v6 + 32) + 32);
    if (dword_1000284F8) {
      sub_10000F0A0(v6, 0);
    }
    if (*(_DWORD *)(v6 + 48)) {
      goto LABEL_22;
    }
    uint64_t v7 = *(int8x16_t **)(v6 + 32);
    if (*(unsigned char *)(v3 + 368)) {
      goto LABEL_20;
    }
    int8x16_t v8 = veorq_s8(veorq_s8(v7[3], v7[2]), veorq_s8(v7[1], *v7));
    *(int8x8_t *)v8.i8 = veor_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL));
    if (((v8.i8[0] ^ v8.i8[4] ^ ((v8.i32[0] ^ v8.i32[1]) >> 16)) ^ ((unsigned __int16)(v8.i16[0] ^ v8.i16[2] ^ ((v8.i32[0] ^ v8.i32[1]) >> 16)) >> 8)) != -1) {
      goto LABEL_29;
    }
    unsigned int v9 = *(void **)(*(void *)(v6 + 8) + 24);
    if (!v9) {
      goto LABEL_19;
    }
    do
    {
      uint64_t v10 = 0;
      int v11 = 0;
      do
        v11 ^= *(unsigned __int8 *)(*v9 + 512 + v10++);
      while (v10 != 63);
      if (v11 != 255)
      {
        IOLog("mlx5: verifyBlockSig failed 0!!!\n");
LABEL_29:
        sub_10001C268((_DWORD *)(v6 + 48), v6);
      }
      uint64_t v12 = 0;
      int8x16_t v13 = 0uLL;
      do
      {
        int8x16_t v13 = veorq_s8(*(int8x16_t *)(*v9 + v12), v13);
        v12 += 16;
      }
      while (v12 != 576);
      int8x8_t v14 = veor_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL));
      uint64_t v15 = *(void *)&v14 ^ HIDWORD(*(void *)&v14) ^ ((*(void *)&v14 ^ HIDWORD(*(void *)&v14)) >> 16);
      unsigned __int8 v16 = v15 ^ BYTE1(v15);
      if (v16 != 0xFF)
      {
        int v17 = v16;
        IOLog("mlx5: verifyBlockSig failed 1 => %x!!!\n", v16);
        if (v17 != 254) {
          goto LABEL_29;
        }
      }
      unsigned int v9 = (void *)v9[2];
    }
    while (v9);
    uint64_t v7 = *(int8x16_t **)(v6 + 32);
LABEL_19:
    *(_DWORD *)(v6 + 48) = 0;
LABEL_20:
    **(unsigned char **)(v6 + 40) = v7[3].i8[15] >> 1;
    if (dword_1000284F8) {
      IOLog("mlx5:%s:%d command completed. ret 0x%x, delivery status 0x%x\n", "compHandler", 597, *(_DWORD *)(v6 + 48), **(unsigned __int8 **)(v6 + 40));
    }
LABEL_22:
    atomic_store(1u, (unsigned __int8 *)(v6 + 52));
    BOOL result = IODispatchQueue::Wakeup(*(IODispatchQueue **)(*(void *)(v3 + 56) + 16), (void *)(v6 + 52));
    if (*(_DWORD *)(*(void *)(v6 + 24) + 68) == *(_DWORD *)(v6 + 16)) {
      uint64_t v18 = 344;
    }
    else {
      uint64_t v18 = 345;
    }
    --*(unsigned char *)(v3 + v18);
LABEL_26:
    v2 &= ~v5;
  }
  while (v2);
  return result;
}

unsigned int *sub_100010370(uint64_t a1, unsigned int a2)
{
  if (a2 < 0x11 || (unsigned int v2 = *(uint64_t **)(a1 + 352), v2 == (uint64_t *)(a1 + 352))) {
LABEL_7:
  }
    operator new();
  uint64_t v3 = (unsigned int *)(v2 - 5);
  uint64_t v5 = *v2;
  unsigned int v4 = (void *)v2[1];
  *(void *)(v5 + 8) = v4;
  void *v4 = v5;
  uint64_t v6 = *((unsigned int *)v2 - 9);
  if (v6 != (unint64_t)((int)a2 + 495) >> 9)
  {
    sub_100010434(a1, (uint64_t)v3);
    goto LABEL_7;
  }
  *uint64_t v3 = a2;
  if ((dword_1000284F8 & 4) != 0) {
    IOLog("mlx5: reusing cached CmdMsgInp (%p) size 0x%x (%d)\n", v3, a2, v6);
  }
  return v3;
}

uint64_t sub_100010434(uint64_t result, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!*(_DWORD *)(a2 + 4)) {
    goto LABEL_4;
  }
  uint64_t v3 = *(void *)(result + 352);
  unsigned int v4 = *(void **)(result + 360);
  *(void *)(a2 + 40) = result + 352;
  *(void *)(result + 360) = a2 + 40;
  *(void *)(a2 + 48) = v4;
  void *v4 = a2 + 40;
  if (v3 != result + 352)
  {
    uint64_t v5 = *(uint64_t **)(result + 352);
    uint64_t v7 = *v5;
    uint64_t v6 = (void *)v5[1];
    *(void *)(v7 + 8) = v6;
    *uint64_t v6 = v7;
    uint64_t v2 = (uint64_t)(v5 - 5);
LABEL_4:
    sub_10000F024(v2);
    operator delete();
  }
  return result;
}

uint64_t sub_1000104C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  int v14 = 0;
  uint64_t v5 = *(IODispatchQueue **)(*(void *)(a1 + 56) + 16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 1107296256;
  block[2] = sub_100010590;
  int v9 = a3;
  int v10 = a5;
  block[5] = a1;
  block[6] = a2;
  block[3] = &unk_1000246D0;
  block[4] = &v11;
  block[7] = a4;
  IODispatchQueue::DispatchSync(v5, block);
  uint64_t v6 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t sub_100010590(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = sub_100010370(v2, *(_DWORD *)(a1 + 64));
  sub_10000EEE4((uint64_t)&v33, *(_DWORD *)(a1 + 68));
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = *v3;
  if ((int)*v3 >= 16) {
    int v6 = 16;
  }
  else {
    int v6 = *v3;
  }
  uint64_t v7 = v6;
  memcpy(v3 + 2, *(const void **)(a1 + 48), v6);
  int v8 = v5 - v6;
  if (v8)
  {
    int v9 = (void ***)(v3 + 6);
    int v10 = (char *)(v4 + v7);
    do
    {
      uint64_t v11 = *v9;
      if (!v11) {
        sub_10001C35C();
      }
      if (v8 >= 512) {
        int v12 = 512;
      }
      else {
        int v12 = v8;
      }
      uint64_t v13 = *v11;
      int v9 = (void ***)(v11 + 2);
      memcpy(v13, v10, v12);
      v10 += v12;
      v8 -= v12;
    }
    while (v8);
  }
  unsigned __int8 v32 = 0;
  unsigned int v14 = **(unsigned __int16 **)(a1 + 48);
  if ((dword_1000284F8 & 4) != 0)
  {
    int v30 = __rev16(v14);
    __int16 v31 = sub_10000F224(v30);
    IOLog("mlx5: cmd exec %s(0x%x)\n", v31, v30);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sub_100010858(v2, (uint64_t)v3, (uint64_t)&v33, (uint64_t)&v32, v14 == 2049);
  sub_100010434(v2, (uint64_t)v3);
  uint64_t v15 = *(void *)(a1 + 32);
  int v16 = *(_DWORD *)(*(void *)(v15 + 8) + 24);
  if (v16)
  {
    IOLog("mlx5: Cmd::exec => err 0x%x, status 0x%x\n", v16, v32);
    uint64_t v15 = *(void *)(a1 + 32);
  }
  if (dword_1000284F8)
  {
    IOLog("mlx5:%s:%d mlx5: err 0x%x, status 0x%x\n", "exec_block_invoke", 704, *(_DWORD *)(*(void *)(v15 + 8) + 24), v32);
    uint64_t v15 = *(void *)(a1 + 32);
  }
  int v17 = *(_DWORD *)(*(void *)(v15 + 8) + 24);
  if (v17) {
    goto LABEL_32;
  }
  if (v32)
  {
    int v18 = -536870212;
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 56);
    int v20 = v33;
    if (v33 >= 16) {
      int v21 = 16;
    }
    else {
      int v21 = v33;
    }
    memcpy(*(void **)(a1 + 56), &v34, v21);
    int v22 = v20 - v21;
    if (v22)
    {
      long long v23 = (const void ***)&v35;
      long long v24 = (char *)(v19 + v21);
      do
      {
        long long v25 = *v23;
        if (!v25) {
          sub_10001C330();
        }
        if (v22 >= 512) {
          int v26 = 512;
        }
        else {
          int v26 = v22;
        }
        long long v27 = *v25;
        long long v23 = (const void ***)(v25 + 2);
        memcpy(v24, v27, v26);
        v24 += v26;
        v22 -= v26;
      }
      while (v22);
    }
    int v18 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v18;
  int v17 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v17)
  {
LABEL_32:
    IOLog("mlx5: Cmd::exec => err 0x%x, status 0x%x\n", v17, v32);
    IOSleep(0x32uLL);
  }
  else
  {
    long long v29 = *(unsigned __int8 **)(a1 + 56);
    if (*v29)
    {
      sub_100010B8C(v29);
      IOSleep(0x32uLL);
      if ((dword_1000284F8 & 0x10000) != 0) {
        sub_10001C2D4(v29);
      }
      IOLog("mlx5: command failed, status (0x%x), syndrome 0x%x\n", *v29, bswap32(*((_DWORD *)v29 + 1)));
    }
  }
  return sub_10000F024((uint64_t)&v33);
}

uint64_t sub_100010858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a5)
  {
    if (*(unsigned char *)(a1 + 344)) {
      sub_10001C388();
    }
    *(unsigned char *)(a1 + 3++*(_DWORD *)(result + 44) = 1;
    int v6 = *(_DWORD *)(a1 + 68);
    uint64_t v7 = *(void *)(a1 + 8 * v6 + 88);
    *(_DWORD *)(a1 + 80) |= 1 << v6;
  }
  else
  {
    int v8 = *(_DWORD *)(a1 + 80);
    int v9 = *(_DWORD *)(a1 + 68);
    unsigned int v10 = __clz(__rbit32(v8 & ~(1 << v9)));
    if ((v8 & ~(1 << v9)) != 0) {
      unsigned int v11 = v10 + 1;
    }
    else {
      unsigned int v11 = 0;
    }
    uint64_t v7 = *(void *)(a1 + 8 * v11 + 88);
    *(_DWORD *)(a1 + 80) = (1 << v11) | v8;
    int v12 = *(unsigned __int8 *)(a1 + 345);
    if (v9 == v12) {
      sub_10001C3B4();
    }
    *(unsigned char *)(a1 + 345) = v12 + 1;
  }
  *(void *)uint64_t v7 = a2;
  *(void *)(v7 + 8) = a3;
  *(void *)(v7 + 40) = a4;
  *(_DWORD *)(v7 + 48) = 0;
  atomic_store(0, (unsigned __int8 *)(v7 + 52));
  uint64_t v13 = *(void *)(v7 + 32);
  *(_OWORD *)(v13 + 32) = 0u;
  *(_OWORD *)(v13 + 48) = 0u;
  *(_OWORD *)uint64_t v13 = 0u;
  *(_OWORD *)(v13 + 16) = 0u;
  char v14 = *(unsigned char *)(a1 + 72);
  do
  {
    char v15 = v14;
    char v14 = 1;
  }
  while (!v15);
  *(unsigned char *)(a1 + 72) = v15 + 1;
  *(unsigned char *)(v13 + 60) = v15;
  *(_OWORD *)(v13 + 16) = *(_OWORD *)(*(void *)v7 + 8);
  *(_WORD *)(v7 + 54) = bswap32(*(_DWORD *)(v13 + 16)) >> 16;
  int v16 = *(unsigned int **)v7;
  int v17 = *(unint64_t **)(*(void *)v7 + 24);
  if (v17) {
    *(void *)(v13 + 8) = bswap64(v17[1]);
  }
  *(_DWORD *)(v13 + 4) = bswap32(*v16);
  uint64_t v18 = *(void *)(v7 + 8);
  uint64_t v19 = *(unint64_t **)(v18 + 24);
  if (v19) {
    *(void *)(v13 + 48) = bswap64(v19[1]);
  }
  *(_DWORD *)(v13 + 56) = bswap32(*(_DWORD *)v18);
  *(unsigned char *)uint64_t v13 = 7;
  *(unsigned char *)(v13 + 63) = 1;
  int v20 = *(int8x16_t **)(v7 + 32);
  int v21 = *(unsigned __int8 *)(a1 + 368);
  int8x16_t v22 = veorq_s8(veorq_s8(v20[3], v20[2]), veorq_s8(v20[1], *v20));
  *(int8x8_t *)v22.i8 = veor_s8(*(int8x8_t *)v22.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL));
  v20[3].i8[13] = v22.i8[0] ^ v22.i8[4] ^ ((v22.i32[0] ^ v22.i32[1]) >> 16) ^ ~((v22.i32[0] ^ v22.i32[1] ^ ((unint64_t)(v22.i64[0] ^ HIDWORD(v22.i64[0])) >> 16)) >> 8);
  for (__int8 i = v20[3].i8[12]; v17; v17 = (unint64_t *)v17[2])
  {
    unint64_t v24 = *v17;
    *(unsigned char *)(*v17 + 573) = i;
    if (!v21)
    {
      uint64_t v25 = 0;
      char v26 = 0;
      do
        v26 ^= *(unsigned char *)(v24 + 512 + v25++);
      while (v25 != 62);
      uint64_t v27 = 0;
      char v28 = 0;
      *(unsigned char *)(v24 + 574) = ~v26;
      do
        v28 ^= *(unsigned char *)(v24 + v27++);
      while (v27 != 575);
      *(unsigned char *)(v24 + 575) = ~v28;
    }
  }
  for (; v19; uint64_t v19 = (unint64_t *)v19[2])
  {
    unint64_t v29 = *v19;
    *(unsigned char *)(*v19 + 573) = i;
    if (!v21)
    {
      uint64_t v30 = 0;
      char v31 = 0;
      do
        v31 ^= *(unsigned char *)(v29 + 512 + v30++);
      while (v30 != 62);
      uint64_t v32 = 0;
      char v33 = 0;
      *(unsigned char *)(v29 + 574) = ~v31;
      do
        v33 ^= *(unsigned char *)(v29 + v32++);
      while (v32 != 575);
      *(unsigned char *)(v29 + 575) = ~v33;
    }
  }
  if (dword_1000284F8)
  {
    sub_10000F0A0(v7, 1);
    if (dword_1000284F8) {
      IOLog("mlx5:%s:%d writing 0x%x to command doorbell\n", "invoke", 641, 1 << *(_DWORD *)(v7 + 16));
    }
  }
  __dmb(0xEu);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32((IOPCIDevice *)qword_100028500, 0, 0x18uLL, bswap32(1 << *(_DWORD *)(v7 + 16)));
  if (!*(_DWORD *)(a1 + 76))
  {
    __uint64_t v34 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    IOTimerDispatchSource::WakeAtTime(*(IOTimerDispatchSource **)(*(void *)(a1 + 56) + 200), 0x88uLL, v34 + 2000000, 0, 0);
  }
  return sub_10000FEE4(v7);
}

uint64_t sub_100010B8C(unsigned __int8 *a1)
{
  uint64_t result = *a1;
  if ((int)result > 47)
  {
    if ((int)result > 79)
    {
      if (result == 80)
      {
        uint64_t v3 = "bad input length";
        goto LABEL_23;
      }
      if (result == 81)
      {
        uint64_t v3 = "bad output length";
        goto LABEL_23;
      }
    }
    else
    {
      if (result == 48)
      {
        uint64_t v3 = "bad packet (discarded)";
        goto LABEL_23;
      }
      if (result == 64)
      {
        uint64_t v3 = "bad size too many outstanding CQEs";
        goto LABEL_23;
      }
    }
LABEL_22:
    uint64_t v3 = "unknown status";
LABEL_23:
    IOLog("mlx5: command failed, status %s(0x%x), syndrome 0x%x\n", v3, result, bswap32(*((_DWORD *)a1 + 1)));
    unsigned int v4 = *a1;
    if (v4 > 0x2F)
    {
      if (*a1 <= 0x4Fu && (v4 == 48 || v4 == 64)) {
        return 3758096385;
      }
      else {
        return 3758097098;
      }
    }
    else
    {
      uint64_t result = *a1;
      switch(*a1)
      {
        case 0u:
          return result;
        case 2u:
        case 3u:
        case 5u:
        case 9u:
        case 0xAu:
        case 0x10u:
          return 3758096385;
        case 6u:
          uint64_t result = 3758097109;
          break;
        case 8u:
          uint64_t result = 3758097085;
          break;
        case 0xFu:
          uint64_t result = 3758097086;
          break;
        default:
          return 3758097098;
      }
    }
    return result;
  }
  uint64_t v3 = "internal error";
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
      goto LABEL_23;
    case 2:
      uint64_t v3 = "bad operation";
      goto LABEL_23;
    case 3:
      uint64_t v3 = "bad parameter";
      goto LABEL_23;
    case 4:
      uint64_t v3 = "bad system state";
      goto LABEL_23;
    case 5:
      uint64_t v3 = "bad resource";
      goto LABEL_23;
    case 6:
      uint64_t v3 = "resource busy";
      goto LABEL_23;
    case 8:
      uint64_t v3 = "limits exceeded";
      goto LABEL_23;
    case 9:
      uint64_t v3 = "bad resource state";
      goto LABEL_23;
    case 10:
      uint64_t v3 = "bad index";
      goto LABEL_23;
    case 15:
      uint64_t v3 = "no resources";
      goto LABEL_23;
    case 16:
      uint64_t v3 = "bad QP state";
      goto LABEL_23;
    default:
      goto LABEL_22;
  }
  return result;
}

void sub_100010E10(uint64_t a1, uint64_t a2)
{
}

void sub_100010E20(uint64_t a1)
{
}

void sub_100010E2C()
{
}

uint64_t sub_10001102C(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 68);
  if ((v1 & 0x80000000) == 0)
  {
    do
    {
      if (*(void *)(a1 + 88 + 8 * v1)) {
        operator delete();
      }
    }
    while (v1-- > 0);
  }
  uint64_t v3 = *(uint64_t **)(a1 + 352);
  if (v3 != (uint64_t *)(a1 + 352))
  {
    unsigned int v4 = v3 - 5;
    uint64_t v5 = *v3;
    int v6 = *(void **)(*(void *)(a1 + 352) + 8);
    *(void *)(v5 + 8) = v6;
    *int v6 = v5;
    if ((dword_1000284F8 & 4) != 0) {
      IOLog("mlx5: releasing cached CmdMsgInp (%p)\n", v4);
    }
    sub_10000F024((uint64_t)v4);
    operator delete();
  }
  return sub_100009610(a1);
}

void sub_100011124(uint64_t a1)
{
  sub_10001102C(a1);
  operator delete();
}

uint64_t sub_10001115C(unsigned __int8 *a1)
{
  int v1 = *a1;
  if (*a1)
  {
    uint64_t v2 = 3758097098;
    unsigned int v3 = bswap32(*((_DWORD *)a1 + 1));
    if (*a1 <= 0x2Fu)
    {
      unsigned int v4 = "internal error";
      switch(*a1)
      {
        case 1u:
          goto LABEL_25;
        case 2u:
          uint64_t v2 = 3758096385;
          unsigned int v4 = "bad operation";
          break;
        case 3u:
          uint64_t v2 = 3758096385;
          unsigned int v4 = "bad parameter";
          break;
        case 4u:
          unsigned int v4 = "bad system state";
          break;
        case 5u:
          uint64_t v2 = 3758096385;
          unsigned int v4 = "bad resource";
          break;
        case 6u:
          uint64_t v2 = 3758097109;
          unsigned int v4 = "resource busy";
          break;
        case 8u:
          uint64_t v2 = 3758097085;
          unsigned int v4 = "limits exceeded";
          break;
        case 9u:
          uint64_t v2 = 3758096385;
          unsigned int v4 = "bad resource state";
          break;
        case 0xAu:
          uint64_t v2 = 3758096385;
          unsigned int v4 = "bad index";
          break;
        case 0xFu:
          uint64_t v2 = 3758097086;
          unsigned int v4 = "no resources";
          break;
        case 0x10u:
          uint64_t v2 = 3758096385;
          unsigned int v4 = "bad QP state";
          break;
        default:
          goto LABEL_24;
      }
      goto LABEL_25;
    }
    if (*a1 > 0x4Fu)
    {
      if (v1 == 80)
      {
        unsigned int v4 = "bad input length";
        goto LABEL_25;
      }
      if (v1 == 81)
      {
        unsigned int v4 = "bad output length";
        goto LABEL_25;
      }
    }
    else
    {
      if (v1 == 48)
      {
        uint64_t v2 = 3758096385;
        unsigned int v4 = "bad packet (discarded)";
        goto LABEL_25;
      }
      if (v1 == 64)
      {
        uint64_t v2 = 3758096385;
        unsigned int v4 = "bad size too many outstanding CQEs";
LABEL_25:
        IOLog("mlx5: command failed, status %s(0x%x), syndrome 0x%x\n", v4, *a1, v3);
        return v2;
      }
    }
LABEL_24:
    unsigned int v4 = "unknown status";
    goto LABEL_25;
  }
  return 0;
}

void sub_100011338(IOPCIDevice *a1)
{
  uint8_t v3 = *(unsigned char *)(v1 - 17) & 0xFB;
  IOPCIDevice::ConfigurationWrite8(a1, 4uLL, v3);
}

uint64_t sub_100011354(uint64_t *a1, uint64_t a2)
{
  int v2 = *((_DWORD *)a1 + 2);
  if (~(-1 << (6 * v2)) < (unint64_t)a2) {
    return 0;
  }
  uint64_t v3 = *a1;
  int v4 = v2 - 1;
  BOOL v5 = *a1 != 0;
  if (v2 != 1 && v3 != 0)
  {
    char v7 = 6 * (v2 - 1);
    int v8 = v4 - 1;
    do
    {
      uint64_t v3 = *(void *)(v3 + 8 * ((a2 >> (v7 & 0xFE)) & 0x3F));
      BOOL v5 = v3 != 0;
      if (!v8) {
        break;
      }
      v7 -= 6;
      --v8;
    }
    while (v3);
  }
  if (v5) {
    return *(void *)(v3 + 8 * (a2 & 0x3F));
  }
  else {
    return 0;
  }
}

uint64_t sub_1000113E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(int *)(a1 + 8);
  if (~(-1 << (6 * v2)) < (unint64_t)a2) {
    return 0;
  }
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  BOOL v5 = *(_DWORD **)a1;
  uint64_t v6 = v2 - 1;
  BOOL v7 = *(void *)a1 != 0;
  if (v6) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    char v9 = 6 * v6;
    unsigned int v10 = (void *)v19 + v6;
    do
    {
      *v10-- = v5;
      BOOL v5 = *(_DWORD **)&v5[2 * ((a2 >> (v9 & 0xFE)) & 0x3F)];
      BOOL v7 = v5 != 0;
      LODWORD(v6) = v6 - 1;
      if (!v6) {
        break;
      }
      v9 -= 6;
    }
    while (v5);
  }
  if (!v7) {
    return 0;
  }
  uint64_t v11 = *(void *)&v5[2 * (a2 & 0x3F)];
  if (v11)
  {
    *(void *)&v5[2 * (a2 & 0x3F)] = 0;
    int v12 = v5[128];
    BOOL v13 = __OFSUB__(v12--, 1);
    v5[128] = v12;
    if ((v12 < 0) ^ v13 | (v12 == 0))
    {
      uint64_t v14 = 6 * (int)v6 + 6;
      char v15 = (void *)v19 + (int)v6 + 1;
      while (1)
      {
        IOFree(v5, 0x208uLL);
        if (v5 == *(_DWORD **)a1) {
          break;
        }
        int v16 = (_DWORD *)*v15++;
        BOOL v5 = v16;
        *(void *)&v16[2 * ((a2 >> (v14 & 0xFE)) & 0x3F)] = 0;
        int v17 = v16[128];
        v16[128] = v17 - 1;
        v14 += 6;
        if (v17 >= 2) {
          return v11;
        }
      }
      *(void *)a1 = 0;
      *(_DWORD *)(a1 + 8) = 0;
    }
  }
  return v11;
}

uint64_t sub_100011540(char **a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 3758096385;
  }
  uint64_t v6 = 3758097085;
  BOOL v7 = *a1;
  if (*a1)
  {
    int v8 = *((_DWORD *)a1 + 2);
  }
  else
  {
    char v9 = (char *)IOMallocTyped();
    if (!v9) {
      return v6;
    }
    BOOL v7 = v9;
    bzero(v9, 0x208uLL);
    *a1 = v7;
    int v8 = *((_DWORD *)a1 + 2) + 1;
    *((_DWORD *)a1 + 2) = v8;
  }
  if (~(-1 << (6 * v8)) >= (unint64_t)a2)
  {
LABEL_13:
    memset(v20, 0, sizeof(v20));
    uint64_t v11 = 6 * v8;
    uint64_t v12 = (v8 - 1) + 1;
    uint64_t v13 = v8 - 1;
    int v14 = 6 * v8 - 6;
    do
    {
      char v15 = v7;
      if (!v13)
      {
        int v17 = v7;
LABEL_21:
        if (*(void *)&v17[8 * (a2 & 0x3F)]) {
          return 3758097090;
        }
        uint64_t v6 = 0;
        *(void *)&v17[8 * (a2 & 0x3F)] = a3;
        ++*((_DWORD *)v17 + 128);
        return v6;
      }
      BOOL v7 = *(char **)&v7[8 * ((a2 >> v14) & 0x3F)];
      --v12;
      --v13;
      v11 -= 6;
      v14 -= 6;
    }
    while (v7);
    while (1)
    {
      int v16 = (void *)IOMallocTyped();
      *((void *)v20 + (void)v7) = v16;
      if (!v16) {
        break;
      }
      bzero(v16, 0x208uLL);
      ++v7;
      if (!--v12)
      {
        do
        {
          int v17 = (char *)*((void *)v20 + v13);
          *(void *)&v15[8 * ((a2 >> (v11 & 0xFE)) & 0x3F)] = v17;
          ++*((_DWORD *)v15 + 128);
          v11 -= 6;
          int v18 = v13--;
          char v15 = v17;
        }
        while (v18);
        goto LABEL_21;
      }
    }
    if (v7)
    {
      do
        IOFree(*((void **)&v20[-1] + (void)v7-- + 1), 0x208uLL);
      while (v7);
    }
    uint64_t v6 = 536870211;
    if (!*((_DWORD *)*a1 + 128))
    {
      IOFree(*a1, 0x208uLL);
      *a1 = 0;
      *((_DWORD *)a1 + 2) = 0;
    }
  }
  else
  {
    while (v8 != 11)
    {
      if (*((_DWORD *)v7 + 128))
      {
        unsigned int v10 = (char *)IOMallocTyped();
        if (!v10) {
          return v6;
        }
        BOOL v7 = v10;
        bzero(v10, 0x208uLL);
        *(void *)BOOL v7 = *a1;
        *((_DWORD *)v7 + 128) = 1;
        *a1 = v7;
        int v8 = *((_DWORD *)a1 + 2);
      }
      *((_DWORD *)a1 + 2) = ++v8;
      if (~(-1 << (6 * v8)) >= (unint64_t)a2) {
        goto LABEL_13;
      }
    }
    return 3758097128;
  }
  return v6;
}

uint64_t sub_1000117D0(uint64_t a1, int a2, int a3, unsigned __int8 *a4, int a5)
{
  v9[0] = 20487;
  v9[1] = a2 << 24;
  unsigned int v6 = bswap32(a3 | 0x80000000);
  if (!a3) {
    unsigned int v6 = 0;
  }
  void v9[2] = v6;
  v9[3] = 0;
  uint64_t v7 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v9, 16, (uint64_t)a4, a5);
  if (v7 || (uint64_t v7 = sub_100010B8C(a4), v7)) {
    IOLog("mlx5: failed to %s in %s:%d\n", "MLX5_CMD_OP_QUERY_VPORT_STATE", "queryVPortState", 13);
  }
  return v7;
}

uint64_t sub_10001186C(uint64_t a1, int a2, int a3)
{
  sub_1000117D0(a1, a2, a3, v4, 16);
  return v4[15] & 0xF;
}

uint64_t sub_10001189C(uint64_t a1, int a2, int a3)
{
  sub_1000117D0(a1, a2, a3, v4, 16);
  return v5 >> 28;
}

uint64_t sub_1000118CC(uint64_t a1, int a2, int a3, int a4)
{
  v8[0] = 20743;
  v8[1] = a2 << 24;
  unsigned int v4 = bswap32(a3 | 0x80000000);
  if (!a3) {
    unsigned int v4 = 0;
  }
  v8[2] = v4;
  v8[3] = a4 << 28;
  uint64_t v5 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v8, 16, (uint64_t)v7, 16);
  if (v5 || (uint64_t v5 = sub_100010B8C(v7), v5)) {
    IOLog("mlx5: failed to %s in %s:%d\n", "MLX5_CMD_OP_MODIFY_VPORT_STATE", "modifyVPortAdminState", 47);
  }
  return v5;
}

uint64_t sub_100011970(uint64_t a1, int a2, unsigned __int8 *a3, int a4)
{
  uint64_t v8 = 0;
  int v7 = 21511;
  unsigned int v5 = bswap32(a2 | 0x80000000);
  if (!a2) {
    unsigned int v5 = 0;
  }
  HIDWORD(v8) = v5;
  int v9 = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v7, 16, (uint64_t)a3, a4);
  if (!result) {
    return sub_100010B8C(a3);
  }
  return result;
}

uint64_t sub_1000119DC(uint64_t a1, int a2)
{
  if (a2 == 1) {
    return 64;
  }
  IOLog("mlx5: Unknown Client: %d\n", a2);
  return 0;
}

uint64_t sub_100011A20(uint64_t a1, int a2, _WORD *a3)
{
  unsigned int v5 = (unsigned int *)(a1 + 4 * a2 + 115120);
  unsigned int v6 = *v5;
  if (a2 == 1)
  {
    unsigned int v7 = 64;
  }
  else
  {
    IOLog("mlx5: Unknown Client: %d\n", a2);
    unsigned int v7 = 0;
  }
  if (v6 > v7) {
    return 3758096385;
  }
  int v12 = 0;
  uint64_t v11 = 0;
  int v10 = 28935;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v10, 16, (uint64_t)v9, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v9);
    if (!result) {
      *a3 = v9[11];
    }
  }
  ++*v5;
  return result;
}

uint64_t sub_100011AE4(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = (_DWORD *)(a1 + 4 * a2 + 115120);
  if (!*v3) {
    return 3758096385;
  }
  v6[1] = 0;
  v6[0] = 29191;
  _OWORD v6[2] = a3 << 24;
  v6[3] = 0;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v6, 16, (uint64_t)v5, 16);
  if (!result) {
    uint64_t result = sub_100010B8C(v5);
  }
  --*v3;
  return result;
}

uint64_t sub_100011B68(uint64_t a1, int a2, char a3, unsigned __int8 *a4, int a5)
{
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  int v7 = 29447;
  int v10 = 0;
  int v11 = (a3 & 1) << 7;
  int v12 = a2 << 24;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v7, 32, (uint64_t)a4, a5);
  if (!result) {
    return sub_100010B8C(a4);
  }
  return result;
}

uint64_t sub_100011BCC(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t result = sub_100011B68(a1, a2, 0, v5, 256);
  if (!result) {
    *a3 = bswap32(v6);
  }
  return result;
}

uint64_t sub_100011C14(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = sub_100011970(a1, a2, v5, 272);
  if (!result)
  {
    *(_WORD *)(a3 + 4) = v7;
    *(_DWORD *)a3 = v6;
  }
  return result;
}

uint64_t sub_100011C6C(uint64_t a1, int a2, uint64_t a3)
{
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  unsigned int v3 = bswap32(a2 | 0x80000000);
  if (!a2) {
    unsigned int v3 = 0;
  }
  *((void *)&v5[0] + 1) = v3 | 0x800000000000000;
  *(_DWORD *)((char *)&v6 + 6) = *(_DWORD *)a3;
  WORD5(v6) = *(_WORD *)(a3 + 4);
  return sub_100011D10(a1, v5, 512);
}

uint64_t sub_100011D10(uint64_t a1, _WORD *a2, int a3)
{
  *a2 = 21767;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a2, a3, (uint64_t)v4, 16);
  if (!result) {
    return sub_100010B8C(v4);
  }
  return result;
}

uint64_t sub_100011D50(uint64_t a1, void *a2)
{
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = bswap64(v5);
  }
  return result;
}

uint64_t sub_100011D98(uint64_t a1, void *a2)
{
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = bswap64(v5);
  }
  return result;
}

uint64_t sub_100011DE0(uint64_t a1, void *a2)
{
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = bswap64(v5);
  }
  return result;
}

uint64_t sub_100011E28(uint64_t a1, int a2)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  memset(v4, 0, sizeof(v4));
  HIDWORD(v4[0]) = 0x2000000;
  if (a2) {
    int v2 = 0x1000000;
  }
  else {
    int v2 = 0;
  }
  LODWORD(v5) = v2;
  return sub_100011D10(a1, v4, 512);
}

uint64_t sub_100011EB4(uint64_t a1, unsigned __int16 a2, int a3, uint64_t a4)
{
  long long v37 = 0u;
  *(_OWORD *)long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  int v6 = 21767;
  if (a3) {
    unsigned int v4 = 0x80000000;
  }
  else {
    unsigned int v4 = 0;
  }
  *(void *)((char *)&v7 + 4) = bswap32(v4 & 0xFFFF0000 | a2) | 0x400000000000000;
  HIDWORD(v37) = 0x1000000;
  *(_DWORD *)&v38[14] = *(_DWORD *)a4;
  __int16 v39 = *(_WORD *)(a4 + 4);
  return sub_100011D10(a1, &v6, 520);
}

uint64_t sub_100011F90(uint64_t a1, int a2, unint64_t a3)
{
  if (!a2) {
    return 3758096385;
  }
  uint64_t v3 = 3758097095;
  if ((*(unsigned char *)(a1 + 412) & 0x80) == 0) {
    return 3758097122;
  }
  if ((*(unsigned char *)(a1 + 37227) & 2) != 0)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v25 = 0u;
    uint64_t v26 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = 0;
    long long v8 = 0u;
    unsigned int v6 = bswap32((unsigned __int16)a2 | 0x80000000);
    int v7 = 0x20000;
    unint64_t v27 = bswap64(a3);
    return sub_100011D10(a1, &v5, 512);
  }
  return v3;
}

uint64_t sub_10001205C(uint64_t a1, int a2, unint64_t a3)
{
  if (!a2) {
    return 3758096385;
  }
  uint64_t v3 = 3758097095;
  if ((*(unsigned char *)(a1 + 412) & 0x80) == 0) {
    return 3758097122;
  }
  if (*(unsigned char *)(a1 + 37227))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = 0;
    long long v8 = 0u;
    unsigned int v6 = bswap32((unsigned __int16)a2 | 0x80000000);
    int v7 = 0x10000;
    long long v26 = bswap64(a3);
    return sub_100011D10(a1, &v5, 512);
  }
  return v3;
}

uint64_t sub_100012128(uint64_t a1, int a2, __int16 *a3, int a4)
{
  int v5 = 1 << BYTE1(*(_DWORD *)(a1 + 57828));
  if (v5 >= a4)
  {
    uint64_t v10 = (8 * a4 + 512);
    long long v11 = (unsigned int *)((char *)&v18 - ((v10 + 15) & 0x1FFFFFFF0));
    bzero(v11, (int)v10);
    unsigned int v12 = *((unsigned __int16 *)v11 + 4);
    unsigned int v13 = bswap32(bswap32(v12) | a2 | 0x80000000);
    if (a2) {
      unsigned int v12 = v13;
    }
    int v14 = v11[3] | 0x4000000;
    v11[2] = v12;
    v11[3] = v14;
    v11[124] = bswap32(a4 & 0xFFF | 0x2000000) | v11[124] & 0xF0FFF8;
    if (a4 >= 1)
    {
      uint64_t v15 = a4;
      long long v16 = v11 + 128;
      do
      {
        __int16 v17 = *a3++;
        unsigned int *v16 = bswap32(v17 & 0xFFF) | *v16 & 0xF0FFFF;
        v16 += 2;
        --v15;
      }
      while (v15);
    }
    return sub_100011D10(a1, (uint64_t *)((char *)&v18 - ((v10 + 15) & 0x1FFFFFFF0)), 8 * a4 + 512);
  }
  else
  {
    IOLog("mlx5: Requested list size (%d) > (%d) max_list_size\n", a4, v5);
    return 3758097115;
  }
}

uint64_t sub_100012270(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v5 = 1 << *(_WORD *)(a1 + 57830);
  if (v5 >= a4)
  {
    uint64_t v10 = (8 * a4 + 512);
    long long v11 = (char *)&v17 - ((v10 + 15) & 0x1FFFFFFF0);
    bzero(v11, (int)v10);
    unsigned int v12 = *((unsigned __int16 *)v11 + 4);
    unsigned int v13 = bswap32(bswap32(v12) & 0xFFFF0000 | (unsigned __int16)a2 | 0x80000000);
    if (a2) {
      unsigned int v12 = v13;
    }
    int v14 = *((_DWORD *)v11 + 3) | 0x4000000;
    *((_DWORD *)v11 + 2) = v12;
    *((_DWORD *)v11 + 3) = v14;
    *((_DWORD *)v11 + 124) = bswap32(a4 & 0xFFF | 0x1000000) | *((_DWORD *)v11 + 124) & 0xF0FFF8;
    if (a4 >= 1)
    {
      uint64_t v15 = a4;
      long long v16 = v11 + 514;
      do
      {
        *(_DWORD *)long long v16 = *(_DWORD *)a3;
        *((_WORD *)v16 + 2) = *(_WORD *)(a3 + 4);
        a3 += 8;
        v16 += 8;
        --v15;
      }
      while (v15);
    }
    return sub_100011D10(a1, (uint64_t *)((char *)&v17 - ((v10 + 15) & 0x1FFFFFFF0)), 8 * a4 + 512);
  }
  else
  {
    IOLog("mlx5: Requested list size (%d) > (%d) max_list_size\n", a4, v5);
    return 3758097115;
  }
}

uint64_t sub_1000123A8(uint64_t a1, int a2, int a3, int a4, int a5)
{
  int v5 = 0;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  unsigned int v6 = bswap32((unsigned __int16)a2 | 0x80000000);
  if (!a2) {
    unsigned int v6 = 0;
  }
  *((void *)&v8[0] + 1) = v6 | 0x1000000000000000;
  if (!a3)
  {
    if (!a4) {
      goto LABEL_5;
    }
LABEL_9:
    v5 |= 0x80u;
    LODWORD(v9) = v5;
    if (!a5) {
      return sub_100011D10(a1, v8, 512);
    }
    goto LABEL_6;
  }
  int v5 = 64;
  LODWORD(v9) = 64;
  if (a4) {
    goto LABEL_9;
  }
LABEL_5:
  if (a5) {
LABEL_6:
  }
    LODWORD(v9) = v5 | 0x20;
  return sub_100011D10(a1, v8, 512);
}

uint64_t sub_10001246C(uint64_t a1, int a2, int a3, uint64_t a4, int *a5)
{
  char v7 = a3;
  int v10 = *a5;
  if (a3) {
    char v11 = 16;
  }
  else {
    char v11 = 24;
  }
  int v12 = *(_DWORD *)(a1 + 57828) >> v11;
  int v13 = 1 << v12;
  if (v10 > 1 << v12)
  {
    IOLog("mlx5: Requested list size (%d) > (%d) max_list_size\n", *a5, 1 << v12);
    int v10 = v13;
  }
  uint64_t v14 = (8 * v10 + 512);
  uint64_t v15 = (unsigned __int8 *)&v21 - ((v14 + 15) & 0x1FFFFFFF0);
  uint64_t v21 = 21511;
  unsigned int v16 = bswap32(a2 | 0x80000000);
  if (!a2) {
    unsigned int v16 = 0;
  }
  unsigned int v22 = v16;
  int v23 = v7 & 7;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v21, 16, (uint64_t)&v21 - ((v14 + 15) & 0x1FFFFFFF0), v14);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v15);
    if (!result)
    {
      BOOL v18 = (*((_DWORD *)v15 + 64) & 0xFF0F0000) == 0;
      LODWORD(v19) = bswap32(*((_DWORD *)v15 + 64) & 0xFF0F0000);
      *a5 = v19;
      if (!v18)
      {
        if (v19 <= 1) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = v19;
        }
        long long v20 = (char *)(v15 + 274);
        do
        {
          *(_DWORD *)a4 = *(_DWORD *)v20;
          *(_WORD *)(a4 + 4) = *((_WORD *)v20 + 2);
          a4 += 6;
          v20 += 8;
          --v19;
        }
        while (v19);
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000125A8(uint64_t a1, int a2, uint64_t a3, int a4)
{
  if (a2) {
    char v4 = 16;
  }
  else {
    char v4 = 24;
  }
  if (1 << (*(_DWORD *)(a1 + 484) >> v4) < a4) {
    return 3758097115;
  }
  char v8 = a2;
  uint64_t v10 = (8 * a4 + 512);
  char v11 = &v14[-((v10 + 15) & 0x1FFFFFFF0)];
  bzero(v11, (int)v10);
  *(_WORD *)char v11 = 21767;
  *((_DWORD *)v11 + 3) |= 0x4000000u;
  *((_DWORD *)v11 + 124) = bswap32(a4 & 0xFFF | ((v8 & 7) << 24)) | *((_DWORD *)v11 + 124) & 0xF0FFF8;
  if (a4 >= 1)
  {
    uint64_t v12 = a4;
    int v13 = v11 + 514;
    do
    {
      *(_DWORD *)int v13 = *(_DWORD *)a3;
      *((_WORD *)v13 + 2) = *(_WORD *)(a3 + 4);
      a3 += 6;
      v13 += 8;
      --v12;
    }
    while (v12);
  }
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v14[-((v10 + 15) & 0x1FFFFFFF0)], v10, (uint64_t)v14, 16);
  if (!result) {
    return sub_100010B8C(v14);
  }
  return result;
}

uint64_t sub_1000126E0(uint64_t a1, int a2, _WORD *a3, int *a4)
{
  int v8 = *a4;
  int v9 = 1 << BYTE1(*(_DWORD *)(a1 + 484));
  if (*a4 > v9)
  {
    IOLog("mlx5: Requested list size (%d) > (%d) max list size\n", *a4, v9);
    int v8 = v9;
  }
  uint64_t v10 = (8 * v8 + 512);
  char v11 = (char *)&v18 - ((v10 + 15) & 0x1FFFFFFF0);
  uint64_t v18 = 21511;
  unsigned int v12 = bswap32(a2 | 0x80000000);
  if (!a2) {
    unsigned int v12 = 0;
  }
  unsigned int v19 = v12;
  int v20 = 2;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v18, 16, (uint64_t)&v18 - ((v10 + 15) & 0x1FFFFFFF0), v10);
  if (!result)
  {
    uint64_t result = sub_100010B8C((unsigned __int8 *)v11);
    if (!result)
    {
      BOOL v14 = (*((_DWORD *)v11 + 64) & 0xFF0F0000) == 0;
      LODWORD(v15) = bswap32(*((_DWORD *)v11 + 64) & 0xFF0F0000);
      *a4 = v15;
      if (!v14)
      {
        if (v15 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v15;
        }
        unsigned int v16 = (int *)(v11 + 272);
        do
        {
          int v17 = *v16;
          v16 += 2;
          *a3++ = bswap32(v17 & 0xFF0F0000);
          --v15;
        }
        while (v15);
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000127FC(uint64_t a1, __int16 *a2, int a3)
{
  if (1 << BYTE1(*(_DWORD *)(a1 + 484)) < a3) {
    return 3758097115;
  }
  uint64_t v7 = (8 * a3 + 512);
  int v8 = &v12[-((v7 + 15) & 0x1FFFFFFF0)];
  bzero(v8, (int)v7);
  *(_WORD *)int v8 = 21767;
  *((_DWORD *)v8 + 3) |= 0x4000000u;
  *((_DWORD *)v8 + 124) = bswap32(a3 & 0xFFF | 0x2000000) | *((_DWORD *)v8 + 124) & 0xF0FFF8;
  if (a3 >= 1)
  {
    uint64_t v9 = a3;
    uint64_t v10 = (unsigned int *)(v8 + 512);
    do
    {
      __int16 v11 = *a2++;
      *uint64_t v10 = bswap32(v11 & 0xFFF) | *v10 & 0xF0FFFF;
      v10 += 2;
      --v9;
    }
    while (v9);
  }
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v12[-((v7 + 15) & 0x1FFFFFFF0)], v7, (uint64_t)v12, 16);
  if (!result) {
    return sub_100010B8C(v12);
  }
  return result;
}

uint64_t sub_10001292C(uint64_t a1, unsigned char *a2)
{
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = v4[19] & 1;
  }
  return result;
}

uint64_t sub_100012974(uint64_t a1, unsigned __int16 a2, uint64_t a3)
{
  long long v34 = 0u;
  memset(v35, 0, sizeof(v35));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  long long v13 = 0u;
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  int v4 = 21767;
  *(void *)((char *)&v5 + 4) = bswap32(a2 | 0x80000000) | 0x800000000000000;
  *(_DWORD *)((char *)&v35[4] + 2) = *(_DWORD *)a3;
  HIWORD(v35[5]) = *(_WORD *)(a3 + 4);
  return sub_100011D10(a1, &v4, 512);
}

uint64_t sub_100012A44(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  memset(v2, 0, sizeof(v2));
  HIDWORD(v2[0]) = 0x2000000;
  LODWORD(v3) = 0x1000000;
  return sub_100011D10(a1, v2, 512);
}

uint64_t sub_100012AC8(uint64_t a1)
{
  memset(v2, 0, sizeof(v2));
  HIDWORD(v2[0]) = 0x2000000;
  return sub_100011D10(a1, v2, 512);
}

uint64_t sub_100012B44(uint64_t a1, int a2, __int16 a3, char a4, uint64_t a5, int a6)
{
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  int v13 = 0;
  uint64_t v12 = 0;
  int v9 = 28679;
  unsigned int v6 = *(_DWORD *)(a1 + 412);
  if (a2)
  {
    if ((v6 & 0x80) == 0) {
      return 3758097122;
    }
    unsigned int v8 = bswap32((unsigned __int16)(a3 + 1) | 0x80000000);
    HIDWORD(v10) = v8;
  }
  else
  {
    unsigned int v8 = 0;
  }
  if (HIBYTE(v6) == 2) {
    HIDWORD(v10) = v8 | ((a4 & 0xF) << 8);
  }
  return sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v9, 32, a5, a6);
}

uint64_t sub_100012BDC(uint64_t a1, int a2, _WORD *a3, int a4)
{
  unsigned int v4 = (unsigned __int16)a3[4];
  unsigned int v5 = bswap32(bswap32(v4) | a2 | 0x80000000);
  if (a2) {
    unsigned int v4 = v5;
  }
  *((_DWORD *)a3 + 2) = v4;
  *a3 = 21255;
  uint64_t v6 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a3, a4, (uint64_t)v8, 16);
  if (v6 || (uint64_t v6 = sub_100010B8C(v8), v6)) {
    IOLog("mlx5: failed to %s in %s:%d\n", "MLX5_CMD_OP_MODIFY_ESW_VPORT_CONTEXT", "modifyEswitchVPortContext", 740);
  }
  return v6;
}

uint64_t sub_100012C88(uint64_t a1, int a2, int a3, char a4, __int16 a5, char a6, char a7)
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  if (a3) {
    DWORD2(v9) = bswap32(((a7 & 7) << 12) & 0x7000 | ((a6 & 1) << 15) | a5 & 0xFFF);
  }
  HIDWORD(v8) = 167772160;
  LODWORD(v9) = a3 & 3 | (8 * (a4 & 1));
  return sub_100012BDC(a1, a2, &v8, 272);
}

uint64_t sub_100012D0C(uint64_t a1, _DWORD *a2)
{
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = __rev16(v5);
  }
  return result;
}

uint64_t sub_100012D54(uint64_t a1, unsigned __int16 a2)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v4 = 0u;
  long long v5 = 0u;
  memset(v3, 0, sizeof(v3));
  HIDWORD(v3[0]) = 0x40000000;
  DWORD1(v4) = bswap32(a2);
  return sub_100011D10(a1, v3, 512);
}

uint64_t sub_100012DDC(uint64_t a1, int *a2)
{
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = v4[16] & 7;
  }
  return result;
}

uint64_t sub_100012E24(uint64_t a1, int a2, char a3)
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
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
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v4 = 0;
  long long v7 = 0u;
  LODWORD(v22) = a3 & 7;
  unsigned int v5 = bswap32(a2 | 0x80000000);
  unsigned int v6 = 0x80000000;
  return sub_100011D10(a1, &v4, 512);
}

uint64_t sub_100012EB0(uint64_t a1, int *a2)
{
  if ((*(_DWORD *)(a1 + 412) & 0x30000) != 0x10000) {
    return 3758096385;
  }
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = v4[16] & 7;
  }
  return result;
}

uint64_t sub_100012F10(uint64_t a1, int a2, int *a3, int *a4, int *a5)
{
  uint64_t result = sub_100011970(a1, a2, v10, 272);
  if (!result)
  {
    unsigned int v9 = v11;
    *a3 = (v11 >> 7) & 1;
    *a4 = (v9 >> 6) & 1;
    *a5 = (v9 >> 5) & 1;
  }
  return result;
}

uint64_t sub_100012F74(uint64_t a1, int a2, char a3, char a4)
{
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  HIDWORD(v5[0]) = 0x10000000;
  LODWORD(v6) = (((a3 & 1) << 30) | (a2 << 31) | ((a4 & 1u) << 29)) >> 24;
  return sub_100011D10(a1, v5, 512);
}

uint64_t sub_100013004(uint64_t a1, void *a2)
{
  if ((*(_DWORD *)(a1 + 412) & 0x30000) != 0x10000) {
    return 3758096385;
  }
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = bswap64(v5);
  }
  return result;
}

uint64_t sub_100013064(uint64_t a1, void *a2)
{
  if ((*(_DWORD *)(a1 + 412) & 0x30000) != 0x10000) {
    return 3758096385;
  }
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = bswap64(v5);
  }
  return result;
}

uint64_t sub_1000130C4(uint64_t a1, void *a2)
{
  if ((*(_DWORD *)(a1 + 412) & 0x30000) != 0x10000) {
    return 3758096385;
  }
  uint64_t result = sub_100011970(a1, 0, v4, 272);
  if (!result) {
    *a2 = bswap64(v5);
  }
  return result;
}

uint64_t sub_100013124(uint64_t a1, int8x16_t *a2, int8x16_t *a3, int a4)
{
  int add = atomic_fetch_add((atomic_uchar *volatile)(a1 + 123408), 1u);
  a3[1].i32[1] |= add << 24;
  a3->i16[0] = 2;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v8 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)a3, a4, (uint64_t)&v15, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    IOLog("mlx5: cmd exec failed %d\n", v8);
  }
  else if ((_BYTE)v15)
  {
    return sub_100010B8C((unsigned __int8 *)&v15);
  }
  else
  {
    *a2 = vrev64q_s8(a3[2]);
    unsigned int v10 = v16;
    unsigned int v11 = bswap32(v16 & 0xFFFFFF00);
    int v12 = add | (v11 << 8);
    a2[1].i32[0] = v12;
    a2[1].i32[1] = bswap32(a3[1].i32[3] & 0xFFFFFF00);
    if (dword_1000284F8)
    {
      IOLog("mlx5:%s:%d out 0x%x, key 0x%x, mkey 0x%x\n", "createMKey", 25, bswap32(v10), add, v12);
      unsigned int v11 = (unsigned __int32)a2[1].i32[0] >> 8;
    }
    uint64_t v13 = sub_100011540((char **)(a1 + 123368), v11, (uint64_t)a2);
    uint64_t v9 = v13;
    if (v13)
    {
      IOLog("mlx5: failed radix tree insert of mr 0x%x, %d\n", a2[1].i32[0], v13);
      sub_10001328C(a1, (uint64_t)a2);
    }
  }
  return v9;
}

uint64_t sub_10001328C(uint64_t a1, uint64_t a2)
{
  if (sub_1000113E0(a1 + 123368, (unint64_t)*(unsigned int *)(a2 + 16) >> 8))
  {
    uint64_t v7 = 0;
    int v6 = 514;
    HIDWORD(v7) = bswap32(*(_DWORD *)(a2 + 16)) << 8;
    int v8 = 0;
    uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v6, 16, (uint64_t)v5, 16);
    if (!result) {
      return sub_100010B8C(v5);
    }
  }
  else
  {
    IOLog("mlx5: failed radix tree delete of mr 0x%x\n", *(_DWORD *)(a2 + 16));
    return 3758096385;
  }
  return result;
}

uint64_t sub_10001332C(uint64_t a1, uint64_t a2, unsigned char *a3, int a4)
{
  unsigned int v11 = a3;
  bzero(a3, a4);
  uint64_t v9 = 258;
  unsigned int v10 = bswap32(*(_DWORD *)(a2 + 16)) << 8;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v9, 12, (uint64_t)a3, a4);
  if (!result)
  {
    if (*a3) {
      return sub_10001115C((unsigned __int8 *)&v11);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000133C8(uint64_t a1, _DWORD *a2)
{
  memset(&v6[1], 0, 14);
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  v6[0] = 770;
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v6, 16, (uint64_t)&v4, 16);
  if (!result)
  {
    if ((_BYTE)v4)
    {
      return sub_100010B8C((unsigned __int8 *)&v4);
    }
    else
    {
      uint64_t result = 0;
      *a2 = bswap32(v5);
    }
  }
  return result;
}

uint64_t sub_100013444(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  if (a3 > 4) {
    return 3758096385;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  v14[0] = 6;
  v14[1] = bswap32(a2 | (a3 << 28));
  uint64_t v7 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v14, 16, (uint64_t)&v12, 32);
  if (v7)
  {
    uint64_t v4 = v7;
    IOLog("mlx5: cmd exec failed %d\n", v7);
  }
  else if ((_BYTE)v12)
  {
    IOLog("mlx5: create_psv bad status %d\n", v12);
    return sub_100010B8C((unsigned __int8 *)&v12);
  }
  else
  {
    if (a3)
    {
      uint64_t v8 = a3;
      uint64_t v9 = (int *)&v13;
      do
      {
        int v10 = *v9++;
        *a4++ = bswap32(v10 & 0xFFFFFF00);
        --v8;
      }
      while (v8);
    }
    return 0;
  }
  return v4;
}

uint64_t sub_100013534(uint64_t a1, unsigned int a2)
{
  v5[0] = 0;
  v5[1] = 0;
  v6[1] = bswap32(a2);
  v6[0] = 262;
  uint64_t v2 = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v6, 16, (uint64_t)v5, 16);
  if (v2)
  {
    uint64_t v3 = v2;
    IOLog("mlx5: destroy_psv cmd exec failed %d\n", v2);
  }
  else if (LOBYTE(v5[0]))
  {
    IOLog("mlx5: destroy_psv bad status %d\n", LOBYTE(v5[0]));
    return sub_100010B8C((unsigned __int8 *)v5);
  }
  else
  {
    return 0;
  }
  return v3;
}

uint64_t sub_1000135D4(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(IODispatchQueue **)(*(void *)(a1 + 16) + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  void v5[2] = sub_100013664;
  v5[3] = &unk_1000247A8;
  _DWORD v5[4] = a1;
  int v6 = a2;
  int v7 = a3;
  IODispatchQueue::DispatchAsync(v3, v5);
  return 0;
}

uint64_t sub_100013664(uint64_t a1)
{
  return IOUserNetworkEthernet::ReportLinkStatus(**(IOUserNetworkEthernet ***)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), 0);
}

uint64_t sub_10001367C(uint64_t a1, int a2)
{
  uint64_t v2 = *(IODispatchQueue **)(*(void *)(a1 + 16) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  void v4[2] = sub_10001370C;
  v4[3] = &unk_1000247C8;
  _DWORD v4[4] = a1;
  int v5 = a2;
  IODispatchQueue::DispatchAsync(v2, v4);
  return 0;
}

uint64_t sub_10001370C(uint64_t a1)
{
  return IOUserNetworkEthernet::ReportLinkQuality(**(IOUserNetworkEthernet ***)(a1 + 32), *(_DWORD *)(a1 + 40), 0);
}

uint64_t sub_100013724(uint64_t a1)
{
  uint64_t v2 = (_DWORD *)(a1 + 38420);
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d EthInterface::updateCarrier<==\n", "updateCarrier", 135);
  }
  int v3 = sub_10001186C(*(void *)(a1 + 16), 0, 0);
  int v4 = v2[2];
  if (v3 == 1)
  {
    v2[2] = v4 | 2;
    if (sub_1000167C4(*(void *)(a1 + 16), v12, 64, 4))
    {
      v2[3] = 32;
      return IOLog("mlx5: %s: query port ptys failed: 0x%x\n");
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      unsigned int v8 = bswap32(v13);
      uint64_t v9 = &qword_100021928;
      do
      {
        if ((0xE0E00uLL >> v6) & 1) == 0 && ((v8 >> v6))
        {
          uint64_t v7 = *v9;
          int v10 = *((_DWORD *)v9 - 2);
          v2[3] = v10 | 0x100020;
          if (*v2) {
            v2[3] = v10 | 0x500020;
          }
        }
        ++v6;
        v9 += 2;
      }
      while (v6 != 32);
      int v11 = v2[3];
      if (dword_1000284F8)
      {
        IOLog("mlx5:%s:%d updateCarrier: setting Link Mode to %x, baud rate %lld\n", "updateCarrier", 170, v2[3], v7);
        int v11 = v2[3];
      }
      sub_1000135D4(a1, v2[2], v11);
      uint64_t result = sub_10001367C(a1, 100);
      if (dword_1000284F8) {
        return IOLog("mlx5:%s:%d EthInterface::updateCarrier(up)==>\n");
      }
    }
  }
  else
  {
    v2[2] = v4 & 0xFFFFFFFD;
    v2[3] = 32;
    sub_1000135D4(a1, v4 & 0xFFFFFFFD, 32);
    uint64_t result = sub_10001367C(a1, -2);
    if (dword_1000284F8) {
      return IOLog("mlx5:%s:%d EthInterface::updateCarrier(down)==>\n");
    }
  }
  return result;
}

void sub_10001390C()
{
}

uint64_t sub_100013A78(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 32)) {
    operator delete[]();
  }
  *(void *)(a2 + 32) = 0;
  if (*(void *)(a2 + 24)) {
    operator delete[]();
  }
  uint64_t result = sub_10000944C(*(void *)(a1 + 16), (uint64_t *)(a2 + 264));
  *(_DWORD *)(a2 + 304) = 0;
  return result;
}

uint64_t sub_100013AE8(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v6 = *(void *)(a2 + 264);
  uint64_t v7 = (((unint64_t)(*(void *)(v6 + 24) + 0x3FFFLL) >> 11) & 0xFFFFFFF8) + 272;
  unsigned int v8 = (char *)&v17 - ((v7 + 15) & 0x1FFFFFFF0);
  bzero(v8, (int)v7);
  long long v9 = a3[13];
  *((_OWORD *)v8 + 14) = a3[12];
  *((_OWORD *)v8 + 15) = v9;
  *((_OWORD *)v8 + 16) = a3[14];
  long long v10 = a3[9];
  *((_OWORD *)v8 + 10) = a3[8];
  *((_OWORD *)v8 + 11) = v10;
  long long v11 = a3[11];
  *((_OWORD *)v8 + 12) = a3[10];
  *((_OWORD *)v8 + 13) = v11;
  long long v12 = a3[5];
  *((_OWORD *)v8 + 6) = a3[4];
  *((_OWORD *)v8 + 7) = v12;
  long long v13 = a3[7];
  *((_OWORD *)v8 + 8) = a3[6];
  *((_OWORD *)v8 + 9) = v13;
  long long v14 = a3[1];
  *((_OWORD *)v8 + 2) = *a3;
  *((_OWORD *)v8 + 3) = v14;
  long long v15 = a3[3];
  *((_OWORD *)v8 + 4) = a3[2];
  *((_OWORD *)v8 + 5) = v15;
  *((_DWORD *)v8 + 10) = bswap32(*(_DWORD *)(a2 + 128) & 0xFFFFFF | (*((_DWORD *)v8 + 10) << 24));
  *((_DWORD *)v8 + 8) = *((_DWORD *)v8 + 8) & 0xFFFF0BFF | 0x400;
  v8[44] = *(_WORD *)(a1 + 38436);
  *((_DWORD *)v8 + 28) = *((_DWORD *)v8 + 28) & 0xFFE0FFFF | 0x20000;
  *((void *)v8 + 12) = bswap64(*(void *)(a2 + 288));
  sub_100009730(v6, (void *)v8 + 34);
  return sub_10000CC8C(*(void *)(a1 + 16), v8, v7, (_DWORD *)(a2 + 304));
}

uint64_t sub_100013C0C(uint64_t a1, uint64_t a2, int a3, char a4)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  DWORD2(v5[0]) = bswap32(*(_DWORD *)(a2 + 304) & 0xFFFFFF | (a3 << 28));
  LODWORD(v6) = (a4 & 0xF) << 12;
  return sub_10000CCEC(*(void *)(a1 + 16), v5, 272);
}

uint64_t sub_100013C84(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 304))
  {
    uint64_t v3 = result;
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(a2 + 64), 0, 0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
    memset(v4, 0, sizeof(v4));
    DWORD2(v4[0]) = bswap32(*(_DWORD *)(a2 + 304) & 0xFFFFFF | 0x10000000);
    LODWORD(v5) = 12288;
    return sub_10000CCEC(*(void *)(v3 + 16), v4, 272);
  }
  return result;
}

void sub_100013D24()
{
}

uint64_t sub_100013DFC(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 304);
  if (v4)
  {
    sub_10000CD2C(*(void *)(a1 + 16), v4);
    sub_100003E9C(a1, a2);
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(a2 + 72), 0, 0);
  }
  return sub_100013A78(a1, a2);
}

uint64_t sub_100013E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_100007C20(*(void *)(a1 + 16), (unsigned int *)(a4 + 464));
  if (!result)
  {
    *(_WORD *)(a4 + 128) = 0;
    *(_WORD *)a4 = 0;
    uint64_t result = sub_100009210(*(void *)(a1 + 16), a3 + 48, a4 + 440, a4 + 488);
    if (!result)
    {
      *(void *)(a4 + 448) += 4;
      if (dword_1000284F8) {
        IOLog("mlx5:%s:%d sq total # of entries is %d\n", "createSQ", 387, *(unsigned __int16 *)(a4 + 456) + 1);
      }
      operator new[]();
    }
  }
  return result;
}

uint64_t sub_100013F4C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 384)) {
    operator delete[]();
  }
  *(void *)(a2 + 384) = 0;
  sub_10000944C(*(void *)(a1 + 16), (uint64_t *)(a2 + 488));
  uint64_t result = sub_100007BC4(*(void *)(a1 + 16), (_DWORD *)(a2 + 464));
  *(_DWORD *)(a2 + 480) = 0;
  return result;
}

uint64_t sub_100013FAC(uint64_t a1, uint64_t a2, _OWORD *a3, int a4)
{
  uint64_t v8 = *(void *)(a2 + 488);
  uint64_t v9 = (((unint64_t)(*(void *)(v8 + 24) + 0x3FFFLL) >> 11) & 0xFFFFFFF8) + 272;
  long long v10 = (char *)&v21 - ((v9 + 15) & 0x1FFFFFFF0);
  bzero(v10, (int)v9);
  long long v11 = a3[13];
  *((_OWORD *)v10 + 14) = a3[12];
  *((_OWORD *)v10 + 15) = v11;
  *((_OWORD *)v10 + 16) = a3[14];
  long long v12 = a3[9];
  *((_OWORD *)v10 + 10) = a3[8];
  *((_OWORD *)v10 + 11) = v12;
  long long v13 = a3[11];
  *((_OWORD *)v10 + 12) = a3[10];
  *((_OWORD *)v10 + 13) = v13;
  long long v14 = a3[5];
  *((_OWORD *)v10 + 6) = a3[4];
  *((_OWORD *)v10 + 7) = v14;
  long long v15 = a3[7];
  *((_OWORD *)v10 + 8) = a3[6];
  *((_OWORD *)v10 + 9) = v15;
  long long v16 = a3[3];
  *((_OWORD *)v10 + 4) = a3[2];
  *((_OWORD *)v10 + 5) = v16;
  long long v17 = a3[1];
  int v18 = *((_DWORD *)v10 + 20);
  unsigned int v19 = a4 & 0xFFFFFF | (*((_DWORD *)v10 + 19) << 24);
  *((_OWORD *)v10 + 2) = *a3;
  *((_OWORD *)v10 + 3) = v17;
  *((_DWORD *)v10 + 10) = bswap32(*(_DWORD *)(a2 + 256) & 0xFFFFFF | (*((_DWORD *)v10 + 10) << 24));
  *((_WORD *)v10 + 32) = 256;
  *((_DWORD *)v10 + 8) = *((_DWORD *)v10 + 8) & 0xFFFF0FEF | 0x10;
  *((_DWORD *)v10 + 19) = bswap32(v19);
  *((_DWORD *)v10 + 20) = v18 & 0xFFFFFF0F | 0x10;
  *((_DWORD *)v10 + 23) = bswap32(*(_DWORD *)(a2 + 464) & 0xFFFFFF | (*((_DWORD *)v10 + 23) << 24));
  *((_DWORD *)v10 + 28) = *((_DWORD *)v10 + 28) & 0xFFE0FFFF | 0x20000;
  *((void *)v10 + 12) = bswap64(*(void *)(a2 + 512));
  sub_100009730(v8, (void *)v10 + 34);
  return sub_10000CDE8(*(void *)(a1 + 16), v10, v9, (_DWORD *)(a2 + 480));
}

uint64_t sub_100014104(uint64_t a1, uint64_t a2, int a3, char a4)
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  DWORD2(v5[0]) = bswap32(*(_DWORD *)(a2 + 480) & 0xFFFFFF | (a3 << 28));
  LODWORD(v6) = (a4 & 0xF) << 12;
  return sub_10000CE48(*(void *)(a1 + 16), v5, 272);
}

uint64_t sub_10001417C(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 480))
  {
    uint64_t v3 = result;
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(a2 + 416), 0, 0);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
    memset(v4, 0, sizeof(v4));
    DWORD2(v4[0]) = bswap32(*(_DWORD *)(a2 + 480) & 0xFFFFFF | 0x10000000);
    LODWORD(v5) = 12288;
    return sub_10000CE48(*(void *)(v3 + 16), v4, 272);
  }
  return result;
}

uint64_t sub_10001421C(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4)
{
  uint64_t result = sub_100013E64(a1, a2, (uint64_t)a3, a4);
  if (!result) {
    uint64_t result = sub_100013FAC(a1, a4, a3, *(_DWORD *)(a1 + 560));
  }
  int v8 = *(_DWORD *)(a4 + 480);
  if (!v8) {
    sub_10001C438();
  }
  if (!result)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    memset(v9, 0, sizeof(v9));
    DWORD2(v9[0]) = bswap32(v8 & 0xFFFFFF);
    LODWORD(v10) = 4096;
    uint64_t result = sub_10000CE48(*(void *)(a1 + 16), v9, 272);
    if (!result)
    {
      IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(a4 + 424), 1, 0);
      IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(a4 + 416), 1, 0);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000142F4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 480))
  {
    sub_10000A25C(a1, (unsigned __int16 *)a2);
    IOUserNetworkPacketQueue::SetEnable(*(IOUserNetworkPacketQueue **)(a2 + 424), 0, 0);
    sub_10000CE88(*(void *)(a1 + 16), *(_DWORD *)(a2 + 480));
  }
  return sub_100013F4C(a1, a2);
}

uint64_t sub_100014360(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_1000092B8(*(void *)(a1 + 16), a2, a3 + 48, a3 + 80);
  if (!result)
  {
    int v8 = *(_DWORD **)(a3 + 88);
    *(void *)(a3 + 8) = v8;
    v8[1] = 0;
    *(void *)(a3 + 16) = v8 + 1;
    *int v8 = 0;
    *(void *)(a3 + 24) = a4;
    *(void *)(a3 + 32) = a1 + 32;
    int v9 = *(_DWORD *)(a3 + 64);
    if (v9 != -1)
    {
      int v10 = 0;
      char v11 = *(unsigned char *)(a3 + 73);
      uint64_t v12 = *(void *)(a3 + 48) + 63;
      int v13 = v9 + 1;
      do
        *(unsigned char *)(v12 + (v10++ << v11)) = -15;
      while (v13 != v10);
    }
    return 0;
  }
  return result;
}

uint64_t sub_100014400(uint64_t a1, uint64_t a2)
{
  return sub_10000944C(*(void *)(a1 + 16), (uint64_t *)(a2 + 80));
}

uint64_t sub_10001440C(uint64_t a1, unsigned int *a2, _OWORD *a3, int a4)
{
  uint64_t v8 = *((void *)a2 + 10);
  uint64_t v9 = (((unint64_t)(*(void *)(v8 + 24) + 0x3FFFLL) >> 11) & 0xFFFFFFF8) + 272;
  int v10 = (char *)&v18 - ((v9 + 15) & 0x1FFFFFFF0);
  bzero(v10, (int)v9);
  long long v11 = a3[1];
  *((_OWORD *)v10 + 1) = *a3;
  *((_OWORD *)v10 + 2) = v11;
  long long v12 = a3[3];
  *((_OWORD *)v10 + 3) = a3[2];
  *((_OWORD *)v10 + 4) = v12;
  sub_100009730(v8, (void *)v10 + 34);
  v10[39] = *((unsigned char *)sub_10000EBD0(*(void *)(a1 + 16), a4) + 77);
  *((_DWORD *)v10 + 7) = bswap32(**((_DWORD **)a2 + 4) & 0xFFFFFF | (*((_DWORD *)v10 + 7) << 24));
  *((_DWORD *)v10 + 10) = *((_DWORD *)v10 + 10) & 0xFFFFFFE0 | 2;
  *((void *)v10 + 9) = bswap64(*((void *)a2 + 13));
  uint64_t v13 = sub_100008E98(*(void *)(a1 + 16), a2, v10, v9);
  if (!*a2) {
    sub_10001C464();
  }
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v15 = *(void *)(*((void *)a2 + 4) + 8);
    uint64_t v16 = a2[17] & 0xFFFFFF | ((a2[11] & 3) << 28);
    **((_DWORD **)a2 + 2) = bswap32(v16);
    __dmb(0xEu);
    IOPCIDevice::MemoryWrite64((IOPCIDevice *)qword_100028500, 0, v15 + 32, bswap64(*a2 | (unint64_t)(v16 << 32)));
  }
  return v14;
}

uint64_t sub_100014568(uint64_t result, unsigned int *a2)
{
  if (*a2) {
    uint64_t result = sub_100008F58(*(void *)(result + 16), a2);
  }
  *a2 = 0;
  return result;
}

uint64_t sub_1000145A0(uint64_t a1, _DWORD *a2, unsigned int *a3, uint64_t a4, int a5)
{
  uint64_t result = sub_100014360(a1, a2, (uint64_t)a3, a4);
  if (!result)
  {
    return sub_10001440C(a1, a3, a2, a5);
  }
  return result;
}

uint64_t sub_10001460C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2) {
    sub_100008F58(*(void *)(a1 + 16), (unsigned int *)a2);
  }
  *(_DWORD *)a2 = 0;
  uint64_t v4 = *(void *)(a1 + 16);
  return sub_10000944C(v4, (uint64_t *)(a2 + 80));
}

uint64_t sub_100014660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001421C(a1, a2, (_OWORD *)(a3 + 241), a2 + 384);
}

uint64_t sub_10001466C(uint64_t a1, unsigned int *a2, uint64_t a3, int a4)
{
  a2[256] = bswap32(*(_DWORD *)(a1 + 536));
  uint64_t result = sub_1000145A0(a1, (_DWORD *)(a3 + 547), a2 + 160, (uint64_t)sub_100009D3C, a4);
  if (!result)
  {
    uint64_t result = sub_1000145A0(a1, (_DWORD *)(a3 + 482), a2 + 32, (uint64_t)sub_10000316C, a4);
    if (!result)
    {
      uint64_t result = sub_10001421C(a1, (uint64_t)a2, (_OWORD *)(a3 + 241), (uint64_t)(a2 + 96));
      if (!result)
      {
        sub_100013D24();
      }
    }
  }
  return result;
}

uint64_t sub_100014744(uint64_t a1, uint64_t a2)
{
  sub_100013C84(a1, a2);
  return sub_10001417C(a1, a2 + 384);
}

uint64_t sub_100014784(uint64_t a1, uint64_t a2)
{
  sub_100013DFC(a1, a2);
  sub_1000142F4(a1, a2 + 384);
  sub_10001460C(a1, a2 + 128);
  return sub_10001460C(a1, a2 + 640);
}

uint64_t sub_1000147DC(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = (char *)(result + 38392);
  int v3 = *(unsigned __int8 *)(result + 38394);
  if (v3 == 2)
  {
    int v4 = (1536 - ((unsigned __int16)__clz(*(unsigned __int16 *)(result + 38438)) << 8)) & 0xF00;
    if (*(_WORD *)(result + 38438)) {
      int v5 = v4;
    }
    else {
      int v5 = 1536;
    }
    a2[21] = bswap32((v5 | bswap32(a2[21] & 0xF8F0FFFF)) & 0xFFFFFFF8 | (*(unsigned __int8 *)(result + 38440) + 2) & 7);
  }
  a2[12] = bswap32(bswap32(a2[12] & 0xFFFFFF09) | (v3 << 28) | 0x2000000);
  int v6 = *(unsigned __int8 *)(result + 38393);
  int v7 = v6 & 0x1F;
  a2[20] = a2[20] & 0xE0FFF0FF | (v7 << 24) | 0x500;
  a2[14] = bswap32(*(_DWORD *)(result + 512) & 0xFFFFFF | (a2[14] << 24));
  char v8 = *v2;
  *(_DWORD *)((char *)a2 + 321) = *(_DWORD *)((char *)a2 + 321) & 0xE0FFF0FF | ((*v2 & 0x1F) << 24) | 0x600;
  *(_DWORD *)((char *)a2 + 297) = bswap32(*(_DWORD *)(result + 512) & 0xFFFFFF | (*(_DWORD *)((char *)a2 + 297) << 24));
  if (*(unsigned char *)(result + 38411)) {
    *(_DWORD *)((char *)a2 + 482) = *(_DWORD *)((char *)a2 + 482) & 0xFF8FFFFF | 0x500000;
  }
  if (v3 == 2)
  {
    unsigned int v9 = __clz(*(unsigned __int16 *)(result + 38438));
    if (*(_WORD *)(result + 38438)) {
      int v10 = ~v9;
    }
    else {
      int v10 = 31;
    }
    int v7 = (v6 + v10) & 0x1F;
  }
  int v11 = v8 & 0x1F;
  unsigned int v12 = *(_DWORD *)((char *)a2 + 494) & 0xFFFFFFE0 | v7;
  *(_DWORD *)((char *)a2 + 494) = v12;
  *(_DWORD *)((char *)a2 + 498) = bswap32((*(_DWORD *)((char *)a2 + 498) << 24) & 0xF0000000 | ((*(_WORD *)(result + 38400) & 0xFFF) << 16) | *(unsigned __int16 *)(result + 38402));
  if (*(unsigned char *)(result + 38398)) {
    unsigned int v13 = (*(_DWORD *)(*(void *)(result + 16) + 428) << 11) & 0x800000 | *(_DWORD *)((char *)a2 + 482) & 0xFF7FFEFF;
  }
  else {
    unsigned int v13 = *(_DWORD *)((char *)a2 + 482) & 0xFF7FFEFF;
  }
  *(_DWORD *)((char *)a2 + 482) = v13;
  *(_DWORD *)((char *)a2 + 494) = bswap32(*(_DWORD *)(result + 32) & 0xFFFFFF | (v12 << 24));
  unsigned int v14 = *(_DWORD *)((char *)a2 + 559) & 0xFFFFFFE0 | v11;
  *(_DWORD *)((char *)a2 + 559) = v14;
  *(_DWORD *)((char *)a2 + 563) = bswap32((*(_DWORD *)((char *)a2 + 563) << 24) & 0xF0000000 | ((*(_WORD *)(result + 38404) & 0xFFF) << 16) | *(unsigned __int16 *)(result + 38406));
  if (*(unsigned char *)(result + 38399)) {
    unsigned int v15 = (*(_DWORD *)(*(void *)(result + 16) + 428) << 11) & 0x800000 | *(_DWORD *)((char *)a2 + 547) & 0xFF7FFEFF;
  }
  else {
    unsigned int v15 = *(_DWORD *)((char *)a2 + 547) & 0xFF7FFEFF;
  }
  *(_DWORD *)((char *)a2 + 547) = v15;
  *(_DWORD *)((char *)a2 + 559) = bswap32(*(_DWORD *)(result + 32) & 0xFFFFFF | (v14 << 24));
  return result;
}

uint64_t sub_100014A04(uint64_t a1)
{
  bzero(v7, 0x264uLL);
  sub_1000147DC(a1, v7);
  if (!*(_WORD *)(a1 + 38396)) {
    return 3758097085;
  }
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  while (1)
  {
    int v4 = sub_10000EBD0(*(void *)(a1 + 16), (int)v3 + *(_DWORD *)(a1 + 8));
    uint64_t v5 = *(void *)(a1 + 552) + v2;
    *(void *)(v5 + 1032) = v4;
    uint64_t result = sub_10001466C(a1, (unsigned int *)v5, (uint64_t)v7, (int)v3 + *(_DWORD *)(a1 + 8));
    if (result) {
      break;
    }
    ++v3;
    v2 += 1152;
    if (v3 >= *(unsigned __int16 *)(a1 + 38396)) {
      return 0;
    }
  }
  return result;
}

void sub_100014AC4(uint64_t a1)
{
  uint64_t v2 = (_WORD *)(a1 + 38396);
  if (*(_WORD *)(a1 + 38396))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(a1 + 552) + v3;
      sub_100013C84(a1, v5);
      sub_10001417C(a1, v5 + 384);
      ++v4;
      v3 += 1152;
    }
    while (v4 < (unsigned __int16)*v2);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32((IOPCIDevice *)qword_100028500, 0, 0, &readData);
  if (readData != -1) {
    IOSleep(0x64uLL);
  }
  if (*v2)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      sub_100014784(a1, *(void *)(a1 + 552) + v6);
      ++v7;
      v6 += 1152;
    }
    while (v7 < (unsigned __int16)*v2);
  }
}

uint64_t sub_100014BAC(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  memset(v2, 0, sizeof(v2));
  DWORD1(v3) = bswap32(*(_DWORD *)(a1 + 516) & 0xFFFFFF);
  return sub_10000D04C(*(void *)(a1 + 16), v2, 192, (_DWORD *)(a1 + 560));
}

uint64_t sub_100014C0C(uint64_t a1)
{
  return sub_10000D108(*(void *)(a1 + 16), *(_DWORD *)(a1 + 560));
}

uint64_t sub_100014C1C(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int16 *)(a1 + 38416);
  int v3 = 1 << v2;
  uint64_t v4 = ((4 << v2) + 272);
  long long v5 = (char *)&v10 - ((v4 + 15) & 0x1FFFFFFF0);
  bzero(v5, (int)v4);
  *(int8x8_t *)(v5 + 52) = vorr_s8(vand_s8(*(int8x8_t *)(v5 + 52), (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(bswap32((unsigned __int16)(1 << v2))));
  if (v2 != 31)
  {
    unsigned int v6 = bswap32(*(_DWORD *)(a1 + 432));
    if (v3 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v3;
    }
    long long v8 = (unsigned int *)(v5 + 272);
    do
    {
      *v8++ = v6;
      --v7;
    }
    while (v7);
  }
  return sub_10000D160(*(void *)(a1 + 16), v5, (4 << v2) + 272, (_DWORD *)(a1 + 564));
}

uint64_t sub_100014CE8(uint64_t a1)
{
  uint64_t v2 = (unsigned __int16 *)(a1 + 38396);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 38416);
  int v4 = 1 << v3;
  uint64_t v5 = ((4 << v3) + 272);
  unsigned int v6 = (char *)&v12 - ((v5 + 15) & 0x1FFFFFFF0);
  bzero(v6, (int)v5);
  *((_WORD *)v6 + 29) = bswap32(1 << v3) >> 16;
  *((_DWORD *)v6 + 5) |= 0x1000000u;
  if (v3 != 31)
  {
    uint64_t v7 = 0;
    unsigned int v8 = *v2;
    uint64_t v9 = *(void *)(a1 + 552);
    if (v4 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v4;
    }
    do
    {
      *(_DWORD *)&v6[4 * v7 + 272] = bswap32(*(_DWORD *)(v9 + 1152 * (v7 % v8) + 304));
      ++v7;
    }
    while (v10 != v7);
  }
  return sub_10000D1C0(*(void *)(a1 + 16), *(_DWORD *)(a1 + 564), (uint64_t)v6, (4 << v3) + 272);
}

uint64_t sub_100014DD0(uint64_t a1)
{
  uint64_t v4 = 0;
  int v3 = 6153;
  HIDWORD(v4) = bswap32(*(_DWORD *)(a1 + 564) & 0xFFFFFF);
  int v5 = 0;
  uint64_t result = sub_1000104C4(*(void *)(*(void *)(a1 + 16) + 352), (uint64_t)&v3, 16, (uint64_t)v2, 16);
  if (!result) {
    return sub_100010B8C(v2);
  }
  return result;
}

uint64_t sub_100014E30(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int16 *)(a1 + 38416);
  int v3 = 1 << v2;
  uint64_t v4 = ((4 << v2) + 272);
  int v5 = (unsigned int *)((char *)&v10 - ((v4 + 15) & 0x1FFFFFFF0));
  bzero(v5, (int)v4);
  *((_WORD *)v5 + 29) = bswap32(1 << v2) >> 16;
  v5[5] |= 0x1000000u;
  if (v2 != 31)
  {
    unsigned int v6 = bswap32(*(_DWORD *)(a1 + 432));
    if (v3 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v3;
    }
    unsigned int v8 = v5 + 68;
    do
    {
      *v8++ = v6;
      --v7;
    }
    while (v7);
  }
  return sub_10000D1C0(*(void *)(a1 + 16), *(_DWORD *)(a1 + 564), (uint64_t)v5, (4 << v2) + 272);
}

uint64_t sub_100014EF4()
{
  return 0;
}

uint64_t sub_100014EFC(uint64_t a1)
{
  char v18 = 0;
  memset(v17, 0, sizeof(v17));
  char v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  memset(v5, 0, sizeof(v5));
  memset(v4, 0, sizeof(v4));
  HIDWORD(v17[0]) = bswap32(*(_DWORD *)(a1 + 32) & 0xFFFFFF);
  uint64_t result = sub_1000145A0(a1, v17, (unsigned int *)(a1 + 256), (uint64_t)sub_100014EF4, *(_DWORD *)(a1 + 8));
  if (!result)
  {
    LODWORD(v6) = 1280;
    unsigned int v3 = bswap32(*(_DWORD *)(a1 + 512) & 0xFFFFFF);
    LODWORD(v5[0]) = 2;
    DWORD2(v5[0]) = v3;
    uint64_t result = sub_100009370(*(void *)(a1 + 16), (uint64_t)v5, a1 + 128, a1 + 392);
    if (!result)
    {
      DWORD2(v4[0]) = bswap32(*(_DWORD *)(a1 + 256) & 0xFFFFFF | (BYTE8(v4[0]) << 24));
      uint64_t result = sub_100013AE8(a1, a1 + 128, v4);
      if (!result)
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v20 = 0u;
        memset(v19, 0, sizeof(v19));
        DWORD2(v19[0]) = bswap32(*(_DWORD *)(a1 + 432) & 0xFFFFFF);
        LODWORD(v20) = 4096;
        return sub_10000CCEC(*(void *)(a1 + 16), v19, 272);
      }
    }
  }
  return result;
}

uint64_t sub_100015050(uint64_t result)
{
  if (*(_DWORD *)(result + 256))
  {
    uint64_t v1 = result;
    uint64_t v2 = result + 256;
    int v3 = *(_DWORD *)(result + 432);
    if (v3)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      long long v6 = 0u;
      long long v7 = 0u;
      long long v5 = 0u;
      memset(v4, 0, sizeof(v4));
      DWORD2(v4[0]) = bswap32(v3 & 0xFFFFFF | 0x10000000);
      LODWORD(v5) = 12288;
      sub_10000CCEC(*(void *)(result + 16), v4, 272);
      sub_10000CD2C(*(void *)(v1 + 16), *(_DWORD *)(v1 + 432));
    }
    sub_10000944C(*(void *)(v1 + 16), (uint64_t *)(v1 + 392));
    *(_DWORD *)(v1 + 432) = 0;
    return sub_10001460C(v1, v2);
  }
  return result;
}

uint64_t sub_10001510C(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(result + 38410))
  {
    unsigned int v2 = *(_DWORD *)(a2 + 16) & 0xFFF0FFFF | 0x30000;
    *(_DWORD *)(a2 + 16) = v2;
    unsigned int v3 = ((unsigned __int16)(*(_WORD *)(result + 38412) - 256) >> 8) | bswap32(v2 & 0xFFFFFF);
    *(_DWORD *)(a2 + 16) = bswap32(v3);
    *(_DWORD *)(a2 + 16) = bswap32(v3 & 0xF00003FF | (bswap32(*(unsigned __int16 *)(*(void *)(result + 16) + 4514)) >> 4));
  }
  return result;
}

uint64_t sub_100015170(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(a2 + 36) = bswap32(*(_DWORD *)(a1 + 516) & 0xFFFFFF | (*(_DWORD *)(a2 + 36) << 24));
  uint64_t result = sub_10001510C(a1, a2);
  unsigned int v7 = *(_DWORD *)(a2 + 4) & 0xFFFFFF0F;
  if (a3 == 10)
  {
    *(_DWORD *)(a2 + 4) = v7;
    *(_DWORD *)(a2 + 28) = bswap32(*(_DWORD *)(*(void *)(a1 + 552) + 304) & 0xFFFFFF | (*(_DWORD *)(a2 + 28) << 24));
  }
  else
  {
    *(_DWORD *)(a2 + 4) = v7 | 0x10;
    unsigned int v8 = *(_DWORD *)(a2 + 36) & 0xFFFFFF0F | 0x20;
    *(_DWORD *)(a2 + 32) = bswap32(*(_DWORD *)(a1 + 564) & 0xFFFFFF | (*(_DWORD *)(a2 + 32) << 24) | 0x80000000);
    *(_DWORD *)(a2 + 36) = v8;
    *(_OWORD *)(a2 + 40) = xmmword_100021900;
    *(_OWORD *)(a2 + 56) = xmmword_100021910;
    *(void *)(a2 + 72) = 0xFC1FDC2A063C25F3;
    switch(a3)
    {
      case 0:
        unsigned int v11 = 251658240;
        goto LABEL_13;
      case 1:
        unsigned int v11 = 251658368;
        goto LABEL_13;
      case 2:
        unsigned int v11 = 251658304;
        goto LABEL_13;
      case 3:
        unsigned int v11 = 251658432;
        goto LABEL_13;
      case 4:
      case 6:
        int v9 = *(_DWORD *)(a2 + 80) >> 6;
        int v10 = 19;
        goto LABEL_12;
      case 5:
      case 7:
        int v9 = *(_DWORD *)(a2 + 80) >> 6;
        int v10 = -2147483629;
        goto LABEL_12;
      case 8:
        int v9 = *(_DWORD *)(a2 + 80) >> 6;
        int v10 = 3;
        goto LABEL_12;
      case 9:
        int v9 = *(_DWORD *)(a2 + 80) >> 6;
        int v10 = -2147483645;
LABEL_12:
        unsigned int v11 = bswap32(v10 & 0xBFFFFFFF | ((v9 & 1) << 30));
LABEL_13:
        *(_DWORD *)(a2 + 80) = v11;
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t sub_100015308(uint64_t a1, int a2)
{
  memset(v6, 0, sizeof(v6));
  memset(v5, 0, sizeof(v5));
  sub_100015170(a1, (uint64_t)v6, a2);
  return sub_10000CF44(*(void *)(a1 + 16), v5, 272, (_DWORD *)(a1 + 4 * a2 + 568));
}

uint64_t sub_10001538C(uint64_t a1, int a2)
{
  return sub_10000CFF4(*(void *)(a1 + 16), *(_DWORD *)(a1 + 4 * a2 + 568));
}

uint64_t sub_1000153A0(uint64_t a1)
{
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = sub_100015308(a1, v2);
    if (v3) {
      break;
    }
    if (++v2 == 11) {
      return v3;
    }
  }
  if (v2)
  {
    uint64_t v4 = (int *)(a1 + 568);
    do
    {
      int v5 = *v4++;
      sub_10000CFF4(*(void *)(a1 + 16), v5);
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_100015410(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = a1 + 568;
  do
  {
    uint64_t result = sub_10000CFF4(*(void *)(a1 + 16), *(_DWORD *)(v3 + v2));
    v2 += 4;
  }
  while (v2 != 44);
  return result;
}

uint64_t sub_100015458(uint64_t a1, signed int a2)
{
  uint64_t result = sub_100016A08(*(void *)(a1 + 16), a2 + 22);
  if (!result)
  {
    unsigned int v5 = 0;
    uint64_t result = sub_100016ABC(*(void *)(a1 + 16), &v5);
    if (!result)
    {
      if ((int)(v5 - 22) < a2)
      {
        IOLog("mlx5: Port MTU %d is smaller than ifp mtu %d\n");
        return 3758096385;
      }
      if ((int)(v5 - 22) > a2)
      {
        IOLog("mlx5: Port MTU %d is bigger than ifp mtu %d\n");
        return 3758096385;
      }
      return 0;
    }
  }
  return result;
}

void sub_1000154E8(uint64_t a1)
{
  uint64_t v2 = a1 + 38392;
  *(void *)(a1 + 16) = a1 - 123520;
  *(void *)(a1 + 38428) = 0x50002000000001;
  *(_WORD *)(a1 + 38392) = 2570;
  int v3 = *(_DWORD *)(a1 - 123092);
  if ((v3 & 0x1000) != 0) {
    __int16 v4 = 3;
  }
  else {
    __int16 v4 = 16;
  }
  *(_WORD *)(a1 + 38400) = v4;
  *(unsigned char *)(a1 + 38398) = (v3 & 0x1000) != 0;
  *(_DWORD *)(a1 + 38402) = 1048608;
  *(_WORD *)(a1 + 38406) = 32;
  if ((dword_1000284F8 & 0x400) != 0) {
    int v5 = 1;
  }
  else {
    int v5 = *(_DWORD *)(a1 - 123200);
  }
  unsigned int v6 = 64 - __clz(1 << -(char)__clz(v5 - 1));
  if (v5 == 1) {
    unsigned int v6 = 1;
  }
  if (v6 <= 8) {
    __int16 v7 = 7;
  }
  else {
    __int16 v7 = v6 - 1;
  }
  *(_WORD *)(a1 + 38416) = v7;
  *(_WORD *)(a1 + 38396) = v5;
  IOLog("mlx5::startInterface num_channels %u\n", (unsigned __int16)v5);
  *(unsigned char *)(v2 + 18) = 0;
  *(_DWORD *)(v2 + 20) = 0x4000;
  uint64_t v8 = *(void *)(a1 + 16);
  *(unsigned char *)(v2 + 19) = *(unsigned char *)(v8 + 543) & 1;
  if ((dword_1000284F8 & 0x4000) == 0 && (*(unsigned char *)(v8 + 424) & 0x40) != 0)
  {
    *(unsigned char *)(v2 + 18) = (dword_1000284F8 & 0x100) == 0;
    *(_DWORD *)(v2 + 20) = 18432;
    *(_WORD *)(v2 + 1) = 515;
    *(unsigned char *)(v2 + 48) = 8;
    *(_WORD *)(v2 + 46) = 1024;
    IOLog("mlx5: Striding on: log_stride_sz %d, num_strides %d\n", 8, 1024);
  }
  else
  {
    *(unsigned char *)(v2 + 2) = 0;
  }
  operator new[]();
}

uint64_t sub_100015DF0(uint64_t a1, void *a2, unsigned int *a3)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d EthInterface::getSupportedMediaArray()<==\n", "getSupportedMediaArray", 1321);
  }
  unsigned int v15 = 0;
  uint64_t v6 = sub_100016828(*(void *)(a1 + 16), &v15, 4);
  if (!v6)
  {
    uint64_t v7 = 0;
    int v8 = 0;
    unsigned int v9 = v15;
    int v10 = &dword_100021920;
    do
    {
      if ((0xE0E00uLL >> v7) & 1) == 0 && ((v9 >> v7))
      {
        int v11 = *v10 | 0x100020;
        int v12 = v8 + 1;
        __src[v8] = v11;
        v8 += 2;
        __src[v12] = v11 | 0x400000;
      }
      ++v7;
      v10 += 4;
    }
    while (v7 != 32);
    __src[v8] = 32;
    if (*a3 >= v8 + 1) {
      unsigned int v13 = v8 + 1;
    }
    else {
      unsigned int v13 = *a3;
    }
    *a3 = v13;
    if (v13) {
      memcpy(a2, __src, 4 * v13);
    }
  }
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d EthInterface::getSupportedMediaArray()==> 0x%x\n", "getSupportedMediaArray", 1344, v6);
  }
  return v6;
}

uint64_t sub_100015F40(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 544);
  *(_WORD *)(a2 + 4) = *(_WORD *)(a1 + 548);
  *(_DWORD *)a2 = v2;
  return 0;
}

uint64_t sub_100015F58(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  int8x16_t v2 = 0u;
  BYTE2(v3) = 12;
  HIDWORD(v3) = bswap32(*(_DWORD *)(a1 + 512) | 0x80000000);
  DWORD1(v3) = 0xFFFFFF;
  return sub_100013124(*(void *)(a1 + 16), (int8x16_t *)(a1 + 520), &v2, 272);
}

uint64_t sub_100015FD8(uint64_t a1)
{
  *(void *)(a1 + 38420) = 0x100000001;
  return sub_100016A5C(*(void *)(a1 + 16), 1u, 1, 1);
}

uint64_t sub_100015FF8()
{
  if (dword_1000284F8) {
    return IOLog("mlx5:%s:%d EthInterface::stop\n", "stop", 1184);
  }
  return result;
}

uint64_t sub_100016040(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = a1 + 38420;
  if ((dword_1000284F8 & 1) == 0)
  {
    if (a2) {
      goto LABEL_3;
    }
LABEL_16:
    sub_100014DD0(a1);
    goto LABEL_17;
  }
  IOLog("mlx5:%s:%d EthInterface::setRunningState(%d)\n", "setRunningState", 1242, a2);
  if (!v2) {
    goto LABEL_16;
  }
LABEL_3:
  uint64_t v5 = sub_100011A20(*(void *)(a1 + 16), 1, (_WORD *)(a1 + 38436));
  if (v5)
  {
    uint64_t v2 = v5;
LABEL_23:
    int v6 = 0;
    goto LABEL_24;
  }
  uint64_t v2 = sub_100007C20(*(void *)(a1 + 16), (unsigned int *)(a1 + 32));
  if (v2)
  {
LABEL_22:
    sub_100011AE4(*(void *)(a1 + 16), 1, *(unsigned __int16 *)(v4 + 16));
    goto LABEL_23;
  }
  uint64_t v2 = sub_1000019E8(*(void *)(a1 + 16), (_DWORD *)(a1 + 512));
  if (v2)
  {
LABEL_21:
    sub_100007BC4(*(void *)(a1 + 16), (_DWORD *)(a1 + 32));
    goto LABEL_22;
  }
  uint64_t v2 = sub_10000CBC4(*(void *)(a1 + 16), (_DWORD *)(a1 + 516));
  if (v2)
  {
LABEL_20:
    sub_100001A58(*(void *)(a1 + 16), *(_DWORD *)(a1 + 512));
    goto LABEL_21;
  }
  uint64_t v2 = sub_100015F58(a1);
  if (v2)
  {
LABEL_19:
    sub_10000CC34(*(void *)(a1 + 16), *(_DWORD *)(a1 + 516));
    goto LABEL_20;
  }
  uint64_t v2 = sub_100015458(a1, 9000);
  if (v2
    || (*(void *)v4 = 0x100000001, uint64_t v2 = sub_100016A5C(*(void *)(a1 + 16), 1u, 1, 1), v2)
    || (uint64_t v2 = sub_10001690C(*(void *)(a1 + 16), 1), v2))
  {
LABEL_18:
    sub_10001328C(*(void *)(a1 + 16), a1 + 520);
    goto LABEL_19;
  }
  uint64_t v2 = sub_100014EFC(a1);
  if (v2 || (uint64_t v2 = sub_100014C1C(a1), v2))
  {
LABEL_17:
    sub_100015050(a1);
    goto LABEL_18;
  }
  int v6 = 1;
LABEL_24:
  *(_DWORD *)(a1 + 24) = v6;
  return v2;
}

uint64_t sub_1000161F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d EthInterface::setInterfaceEnable(%d)\n", "setInterfaceEnable", 1283, a2);
  }
  if (!v2)
  {
    sub_10000BE2C(a1, 0);
    *(_DWORD *)(a1 + 24) = 0;
    sub_10000B41C(a1);
    goto LABEL_12;
  }
  uint64_t v2 = sub_100016040(a1, 1);
  if (!v2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    memset(v6, 0, sizeof(v6));
    DWORD1(v7) = bswap32(*(_DWORD *)(a1 + 516) & 0xFFFFFF);
    uint64_t v2 = sub_10000D04C(*(void *)(a1 + 16), v6, 192, (_DWORD *)(a1 + 560));
    if (v2)
    {
LABEL_16:
      sub_100016040(a1, 0);
      return v2;
    }
    uint64_t v2 = sub_100014A04(a1);
    if (v2 || (uint64_t v2 = sub_100014CE8(a1), v2))
    {
LABEL_15:
      sub_100014AC4(a1);
      sub_10000D108(*(void *)(a1 + 16), *(_DWORD *)(a1 + 560));
      goto LABEL_16;
    }
    uint64_t v2 = sub_1000153A0(a1);
    if (v2)
    {
LABEL_14:
      sub_100014E30(a1);
      goto LABEL_15;
    }
    uint64_t v2 = sub_10000CB34(a1);
    if (!v2) {
      sub_10000B120(a1);
    }
LABEL_12:
    sub_10000CB80(a1);
    for (uint64_t i = 0; i != 44; i += 4)
      sub_10000CFF4(*(void *)(a1 + 16), *(_DWORD *)(a1 + 568 + i));
    goto LABEL_14;
  }
  return v2;
}

uint64_t sub_100016398(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = (unsigned int *)(a1 + 38420);
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d EthInterface::handleChosenMedia(%x)<==\n", "handleChosenMedia", 1350, a2);
  }
  uint64_t v5 = 0;
  int v6 = 0;
  int v7 = v2 & 0xF001F;
  long long v8 = &dword_100021920;
  do
  {
    if (((0xE0E00uLL >> v5) & 1) == 0 && *v8 == v7) {
      v6 |= 1 << v5;
    }
    ++v5;
    v8 += 4;
  }
  while (v5 != 32);
  unsigned int v12 = 0;
  uint64_t v9 = sub_100016828(*(void *)(a1 + 16), &v12, 4);
  if (!v9)
  {
    unsigned int v10 = v12;
    if (v7)
    {
      unsigned int v10 = v12 & v6;
      if ((v12 & v6) == 0)
      {
        IOLog("mlx5: Not supported link mode requested\n");
LABEL_18:
        uint64_t v9 = 3758096385;
        goto LABEL_19;
      }
    }
    else
    {
      if (!v12)
      {
        IOLog("mlx5: Port media capability is zero\n");
        goto LABEL_18;
      }
      unsigned int v2 = 0x400000;
    }
    unsigned int *v4 = (v2 >> 22) & 1;
    v4[1] = 1;
    if (dword_1000284F8) {
      IOLog("mlx5:%s:%d Setting Link Mode to %x\n", "handleChosenMedia", 1385, v10);
    }
    sub_10001690C(*(void *)(a1 + 16), 2);
    sub_1000168A4(*(void *)(a1 + 16), v10, 4);
    sub_100016A5C(*(void *)(a1 + 16), 1u, v4[1], *v4);
    sub_10001690C(*(void *)(a1 + 16), 1);
    uint64_t v9 = 0;
  }
LABEL_19:
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d EthInterface::handleChosenMedia==>0x%x\n", "handleChosenMedia", 1394, v9);
  }
  return v9;
}

uint64_t sub_10001655C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24) == 2)
  {
    if (*(void *)(a1 + 38448)) {
      operator delete[]();
    }
    operator new[]();
  }
  return 0;
}

uint64_t sub_100016608(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 24) == 2)
  {
    if (a2) {
      __int16 v2 = 512;
    }
    else {
      __int16 v2 = 0;
    }
    *(_WORD *)(a1 + 38442) = *(_WORD *)(a1 + 38442) & 0xFDFF | v2;
    sub_10000BE2C(a1, 1);
  }
  return 0;
}

uint64_t sub_100016654(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 24) == 2)
  {
    if (a2) {
      __int16 v2 = 256;
    }
    else {
      __int16 v2 = 0;
    }
    *(_WORD *)(a1 + 38442) = *(_WORD *)(a1 + 38442) & 0xFEFF | v2;
    sub_10000BE2C(a1, 1);
  }
  return 0;
}

uint64_t sub_1000166A0(uint64_t a1, const void *a2, int a3, void *a4, int a5, unsigned int a6, unsigned int a7, int a8)
{
  size_t v15 = a3;
  int v16 = a3 + 16;
  long long v17 = (char *)&v21 - ((a3 + 16 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero((char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
  memcpy(v17 + 16, a2, v15);
  size_t v18 = a5 + 16;
  long long v19 = (char *)&v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v19, v18);
  *(_WORD *)long long v17 = 1288;
  *((_WORD *)v17 + 3) = (a8 == 0) << 8;
  *((_DWORD *)v17 + 3) = bswap32(a7);
  *((_WORD *)v17 + 5) = __rev16(a6);
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)v17, v16, (uint64_t)v19, a5 + 16);
  if (!result)
  {
    if (!*v19 || (uint64_t result = sub_100010B8C(v19), !result))
    {
      memcpy(a4, v19 + 16, a5);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000167C4(uint64_t a1, void *a2, int a3, char a4)
{
  memset(v8, 0, sizeof(v8));
  long long v7 = 0u;
  long long v6 = 0u;
  unsigned int v5 = bswap32(a4 & 7 | 0x10000);
  return sub_1000166A0(a1, &v5, 64, a2, a3, 0x5004u, 0, 0);
}

uint64_t sub_100016828(uint64_t a1, _DWORD *a2, char a3)
{
  memset(v9, 0, sizeof(v9));
  long long v8 = 0u;
  long long v7 = 0u;
  unsigned int v6 = bswap32(a3 & 7 | 0x10000);
  uint64_t result = sub_1000166A0(a1, &v6, 64, v5, 64, 0x5004u, 0, 0);
  if (!result) {
    *a2 = bswap32(v5[3]);
  }
  return result;
}

uint64_t sub_1000168A4(uint64_t a1, unsigned int a2, char a3)
{
  memset(v8, 0, sizeof(v8));
  long long v7 = 0u;
  long long v6 = 0u;
  unsigned int v5 = bswap32(a3 & 7 | 0x10000);
  DWORD1(v7) = bswap32(a2);
  return sub_1000166A0(a1, &v5, 64, &v4, 64, 0x5004u, 0, 1);
}

uint64_t sub_10001690C(uint64_t a1, char a2)
{
  uint64_t v5 = 0;
  v4[0] = bswap32(((a2 & 0xF) << 8) | 0x10000);
  v4[1] = 128;
  return sub_1000166A0(a1, v4, 16, &v3, 16, 0x5006u, 0, 1);
}

uint64_t sub_100016960(uint64_t a1, unsigned int *a2, unsigned int *a3, unsigned int *a4)
{
  int v11 = 0;
  uint64_t v10 = 0;
  int v9 = 256;
  uint64_t result = sub_1000166A0(a1, &v9, 16, v8, 16, 0x5003u, 0, 0);
  if (!result)
  {
    if (a3) {
      *a3 = bswap32(v8[1]) >> 16;
    }
    if (a4) {
      *a4 = bswap32(v8[3]) >> 16;
    }
    if (a2) {
      *a2 = bswap32(v8[2]) >> 16;
    }
  }
  return result;
}

uint64_t sub_100016A08(uint64_t a1, unsigned int a2)
{
  v4[1] = 0;
  _DWORD v4[2] = bswap32(a2) >> 16;
  _OWORD v4[3] = 0;
  v4[0] = 256;
  return sub_1000166A0(a1, v4, 16, &v3, 16, 0x5003u, 0, 1);
}

uint64_t sub_100016A5C(uint64_t a1, unsigned __int8 a2, char a3, char a4)
{
  v6[1] = 0;
  int v9 = 0;
  uint64_t v8 = 0;
  v6[0] = a2 << 8;
  void v6[2] = (a4 & 1) << 7;
  uint64_t v7 = (a3 & 1) << 7;
  return sub_1000166A0(a1, v6, 32, &v5, 32, 0x5007u, 0, 1);
}

uint64_t sub_100016ABC(uint64_t a1, unsigned int *a2)
{
  return sub_100016960(a1, 0, 0, a2);
}

uint64_t sub_100016ACC(uint64_t a1, unsigned __int8 a2, int a3)
{
  memset(v8, 0, sizeof(v8));
  long long v7 = 0u;
  long long v6 = 0u;
  int v5 = 12041;
  HIDWORD(v6) = a2;
  LODWORD(v7) = bswap32(a3 & 0xFFFFFF);
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v5, 64, (uint64_t)v4, 16);
  if (!result) {
    return sub_100010B8C(v4);
  }
  return result;
}

uint64_t sub_100016B38(uint64_t a1, int a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 a5, _DWORD *a6)
{
  memset(v13, 0, sizeof(v13));
  long long v12 = 0u;
  long long v11 = 0u;
  int v10 = 12297;
  HIDWORD(v11) = a3;
  DWORD1(v12) = bswap32(a5 | (a4 << 16));
  if (a2) {
    DWORD1(v11) = bswap32(a2 | 0x80000000);
  }
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v10, 64, (uint64_t)v8, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v8);
    if (!result) {
      *a6 = bswap32(v9 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_100016BDC(uint64_t a1, int a2, unsigned __int8 a3, int a4)
{
  memset(v9, 0, sizeof(v9));
  long long v8 = 0u;
  long long v7 = 0u;
  int v6 = 12553;
  HIDWORD(v7) = a3;
  LODWORD(v8) = bswap32(a4 & 0xFFFFFF);
  if (a2) {
    DWORD1(v7) = bswap32(a2 | 0x80000000);
  }
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v6, 64, (uint64_t)v5, 16);
  if (!result) {
    return sub_100010B8C(v5);
  }
  return result;
}

uint64_t sub_100016C58(uint64_t a1, uint64_t a2, int a3, char a4, int a5, _DWORD *a6)
{
  *(_WORD *)a2 = 13065;
  *(unsigned char *)(a2 + 16) = a4;
  *(_DWORD *)(a2 + 20) = bswap32(a5 & 0xFFFFFF | (*(_DWORD *)(a2 + 20) << 24));
  if (a3) {
    *(_DWORD *)(a2 + 8) = bswap32(bswap32((unsigned __int16)*(_DWORD *)(a2 + 8)) | a3 | 0x80000000);
  }
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), a2, 1024, (uint64_t)v8, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v8);
    if (!result) {
      *a6 = bswap32(v9 & 0xFFFFFF00);
    }
  }
  return result;
}

uint64_t sub_100016CF0(uint64_t a1, int a2, unsigned __int8 a3, int a4, unsigned int a5)
{
  memset(v10, 0, sizeof(v10));
  long long v8 = 0u;
  int v7 = 13321;
  HIDWORD(v8) = a3;
  long long v9 = _byteswap_uint64(__PAIR64__(a4 & 0xFFFFFF, a5));
  if (a2) {
    DWORD1(v8) = bswap32(a2 | 0x80000000);
  }
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v7, 64, (uint64_t)v6, 16);
  if (!result) {
    return sub_100010B8C(v6);
  }
  return result;
}

uint64_t sub_100016D74(uint64_t a1, int a2, unsigned char *a3, const void *a4, __int8 a5, int a6, unsigned int a7, unsigned int a8, __n128 a9, int a10, unsigned __int16 a11, int a12, void *a13)
{
  if (a11 != 4) {
    a12 = 0;
  }
  if (*a3)
  {
    if ((*(unsigned char *)(a1 + 29096) & 0x10) == 0) {
      return 3758097095;
    }
    long long v34 = a4;
    uint64_t v35 = a1;
    long long v32 = a3;
    a9.n128_u64[0] = 0x100000004000000;
  }
  else
  {
    long long v34 = a4;
    uint64_t v35 = a1;
    long long v32 = a3;
    a9 = 0uLL;
  }
  __n128 v33 = a9;
  long long v36 = &v31;
  size_t v20 = (8 * a12 + 832);
  uint64_t v21 = (int8x8_t *)((char *)&v31 - ((v20 + 15) & 0x1FFFFFFF0));
  bzero(v21, v20);
  v22.i32[1] = v33.n128_i32[1];
  v22.i32[0] = 13833;
  __int32 v23 = v21[2].i32[1];
  unsigned __int32 v24 = v21[3].i32[0] & 0xFFFFFF | v33.n128_u32[0];
  *uint64_t v21 = vorr_s8(vand_s8(*v21, (int8x8_t)0xFFFFFFFF0000), v22);
  v21[2].i8[0] = a5;
  v21[2].i32[1] = bswap32(a6 & 0xFFFFFF | (v23 << 24));
  v21[3].i32[0] = v24;
  v21[4].i32[0] = bswap32(a7);
  if (a2) {
    v21[1].i32[0] = bswap32(bswap32((unsigned __int16)v21[1].i32[0]) | a2 | 0x80000000);
  }
  unsigned int v25 = bswap32(a10 & 0xFFFFFF | (v21[9].i32[0] << 24));
  v21[8].i32[1] = bswap32(a8);
  v21[9].i32[0] = v25;
  v21[9].i16[3] = __rev16(a11);
  v21[10].i32[0] = bswap32(a12 & 0xFFFFFF | (v21[10].i32[0] << 24));
  memcpy(&v21[16], v34, 0x200uLL);
  uint64_t v26 = v35;
  if (a12)
  {
    long long v27 = (void *)*a13;
    if ((void *)*a13 != a13)
    {
      long long v28 = v21 + 104;
      do
      {
        int v29 = *((_DWORD *)v27 + 8);
        long long v30 = v27 + 5;
        if (v29 == 1) {
          long long v30 = (void *)(*v30 + 92);
        }
        v28->i32[0] = bswap32(*(_DWORD *)v30 & 0xFFFFFF | (v29 << 24));
        ++v28;
        long long v27 = (void *)*v27;
      }
      while (v27 != a13);
    }
  }
  uint64_t result = sub_1000104C4(*(void *)(v26 + 352), (uint64_t)&v31 - ((v20 + 15) & 0x1FFFFFFF0), 8 * a12 + 832, (uint64_t)v37, 16);
  if (!result && (uint64_t result = sub_100010B8C(v37), !result) || result == -536870185)
  {
    uint64_t result = 0;
    *long long v32 = 1;
  }
  return result;
}

uint64_t sub_100016FA8(uint64_t a1, int a2, unsigned char *a3, unsigned __int8 a4, int a5, unsigned int a6)
{
  if (!*a3) {
    return 0;
  }
  memset(v12, 0, sizeof(v12));
  long long v11 = 0u;
  long long v10 = 0u;
  int v9 = 14345;
  HIDWORD(v10) = a4;
  LODWORD(v11) = bswap32(a5 & 0xFFFFFF);
  HIDWORD(v11) = bswap32(a6);
  if (a2) {
    DWORD1(v10) = bswap32(a2 | 0x80000000);
  }
  uint64_t result = sub_1000104C4(*(void *)(a1 + 352), (uint64_t)&v9, 64, (uint64_t)v8, 16);
  if (!result)
  {
    uint64_t result = sub_100010B8C(v8);
    if (!result) {
      *a3 = 0;
    }
  }
  return result;
}

uint64_t sub_100017050(void *a1)
{
  *a1 = off_100025018;
  return 0;
}

uint64_t DriverKit_AppleEthernetMLX5MetaClass::New(DriverKit_AppleEthernetMLX5MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100025058;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_1000250A0;
  return 0;
}

uint64_t DriverKit_AppleEthernetMLX5::Dispatch(IOService *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return DriverKit_AppleEthernetMLX5::_Dispatch(this, &v4, a3);
}

uint64_t DriverKit_AppleEthernetMLX5::_Dispatch(IOService *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid <= 0x2CD3FE2A11D85D10)
  {
    if (msgid <= 0x6D890ABB87B5DF4)
    {
      switch(msgid)
      {
        case 0x98E715041C459FA5:
          IORPC v61 = *a2;
          return IOService::Stop_Invoke(&v61, this, (IOService::Stop_Handler)DriverKit_AppleEthernetMLX5::Stop_Impl);
        case 0xAB6F76DDE6D693F2:
          IORPC v62 = *a2;
          return IOService::Start_Invoke(&v62, this, (IOService::Start_Handler)DriverKit_AppleEthernetMLX5::Start_Impl);
        case 0xD200FDE7D57ECCA6:
          IORPC rpc = *a2;
          return IOService::SetPowerState_Invoke(&rpc, this, (IOService::SetPowerState_Handler)DriverKit_AppleEthernetMLX5::SetPowerState_Impl);
      }
      goto LABEL_50;
    }
    if (msgid > 0x1F424A63A38451B6)
    {
      if (msgid == 0x1F424A63A38451B7)
      {
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v17 = *(_OWORD *)&a2->message;
          uint64_t v18 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v17;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        long long v15 = *(_OWORD *)&a2->message;
        uint64_t v16 = *(void *)&a2->sendSize;
        long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder05MetaClass;
        int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::PlaceHolder05_Impl;
        long long v10 = (IORPC *)&v15;
      }
      else
      {
        if (msgid != 0x2B77674110C243D4) {
          goto LABEL_50;
        }
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v50 = *(_OWORD *)&a2->message;
          uint64_t v51 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v50;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        long long v48 = *(_OWORD *)&a2->message;
        uint64_t v49 = *(void *)&a2->sendSize;
        long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_AsyncInterruptMetaClass;
        int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::AsyncInterrupt_Impl;
        long long v10 = (IORPC *)&v48;
      }
    }
    else
    {
      if (msgid != 0x6D890ABB87B5DF5)
      {
        if (msgid == 0xCDA674E61EDDE2FLL)
        {
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v28 = *(_OWORD *)&a2->message;
            uint64_t v29 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v28;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v26 = *(_OWORD *)&a2->message;
          uint64_t v27 = *(void *)&a2->sendSize;
          long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder02MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::PlaceHolder02_Impl;
          long long v10 = (IORPC *)&v26;
          return IOInterruptDispatchSource::InterruptOccurred_Invoke(v10, this, v9, v8);
        }
        goto LABEL_50;
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
      long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder01MetaClass;
      int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::PlaceHolder01_Impl;
      long long v10 = (IORPC *)&v30;
    }
  }
  else
  {
    if (msgid > 0x55AA12D566B1E00ALL)
    {
      if (msgid > 0x657FDFF0B2FB37D5)
      {
        if (msgid != 0x657FDFF0B2FB37D6)
        {
          if (msgid != 0x7A53E739921F2046) {
            goto LABEL_50;
          }
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v54 = *(_OWORD *)&a2->message;
            uint64_t v55 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v54;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v52 = *(_OWORD *)&a2->message;
          uint64_t v53 = *(void *)&a2->sendSize;
          long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_PagesInterruptMetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::PagesInterrupt_Impl;
          long long v10 = (IORPC *)&v52;
          return IOInterruptDispatchSource::InterruptOccurred_Invoke(v10, this, v9, v8);
        }
        if (OSMetaClassBase::IsRemote(this))
        {
          IORPC invoke = *a2;
          p_IORPC invoke = &invoke;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        IORPC v42 = *a2;
        long long v11 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_HealthTimerOccurredMetaClass;
        long long v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t))DriverKit_AppleEthernetMLX5::HealthTimerOccurred_Impl;
        long long v13 = &v42;
      }
      else
      {
        if (msgid != 0x55AA12D566B1E00BLL)
        {
          if (msgid != 0x60590390861633F7) {
            goto LABEL_50;
          }
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v46 = *(_OWORD *)&a2->message;
            uint64_t v47 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v46;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v44 = *(_OWORD *)&a2->message;
          uint64_t v45 = *(void *)&a2->sendSize;
          long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_QueueInterruptMetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::QueueInterrupt_Impl;
          long long v10 = (IORPC *)&v44;
          return IOInterruptDispatchSource::InterruptOccurred_Invoke(v10, this, v9, v8);
        }
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v40 = *(_OWORD *)&a2->message;
          uint64_t v41 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v40;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        long long v38 = *(_OWORD *)&a2->message;
        uint64_t v39 = *(void *)&a2->sendSize;
        long long v11 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_CmdTimerOccurredMetaClass;
        long long v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t))DriverKit_AppleEthernetMLX5::CmdTimerOccurred_Impl;
        long long v13 = (IORPC *)&v38;
      }
      return IOTimerDispatchSource::TimerOccurred_Invoke(v13, this, v12, v11);
    }
    if (msgid > 0x3C0C1B407EF68FEBLL)
    {
      if (msgid == 0x3C0C1B407EF68FECLL)
      {
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v20 = *(_OWORD *)&a2->message;
          uint64_t v21 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v20;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        IORPC v19 = *a2;
        long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder04MetaClass;
        int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::PlaceHolder04_Impl;
        long long v10 = &v19;
      }
      else
      {
        if (msgid != 0x530BA3258551F27FLL) {
          goto LABEL_50;
        }
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v24 = *(_OWORD *)&a2->message;
          uint64_t v25 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v24;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        long long v22 = *(_OWORD *)&a2->message;
        uint64_t v23 = *(void *)&a2->sendSize;
        long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder03MetaClass;
        int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::PlaceHolder03_Impl;
        long long v10 = (IORPC *)&v22;
      }
    }
    else
    {
      if (msgid != 0x2CD3FE2A11D85D11)
      {
        if (msgid == 0x32DFB096DDE0AC48)
        {
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v36 = *(_OWORD *)&a2->message;
            uint64_t v37 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v36;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v34 = *(_OWORD *)&a2->message;
          uint64_t v35 = *(void *)&a2->sendSize;
          long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder00MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::PlaceHolder00_Impl;
          long long v10 = (IORPC *)&v34;
          return IOInterruptDispatchSource::InterruptOccurred_Invoke(v10, this, v9, v8);
        }
LABEL_50:
        IORPC v14 = *a2;
        return IOService::_Dispatch(this, &v14);
      }
      if (OSMetaClassBase::IsRemote(this))
      {
        long long v58 = *(_OWORD *)&a2->message;
        uint64_t v59 = *(void *)&a2->sendSize;
        p_IORPC invoke = (IORPC *)&v58;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }
      long long v56 = *(_OWORD *)&a2->message;
      uint64_t v57 = *(void *)&a2->sendSize;
      long long v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_CommandInterruptMetaClass;
      int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *, uint64_t, uint64_t))DriverKit_AppleEthernetMLX5::CommandInterrupt_Impl;
      long long v10 = (IORPC *)&v56;
    }
  }
  return IOInterruptDispatchSource::InterruptOccurred_Invoke(v10, this, v9, v8);
}

uint64_t DriverKit_AppleEthernetMLX5MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionCommandInterrupt(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_CommandInterrupt");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x2CD3FE2A11D85D11uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionPagesInterrupt(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_PagesInterrupt");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x7A53E739921F2046uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionAsyncInterrupt(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_AsyncInterrupt");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x2B77674110C243D4uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionQueueInterrupt(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_QueueInterrupt");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x60590390861633F7uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionHealthTimerOccurred(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_HealthTimerOccurred");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x657FDFF0B2FB37D6uLL, 0xF4AB1C3CBB5AE47uLL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionCmdTimerOccurred(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_CmdTimerOccurred");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x55AA12D566B1E00BuLL, 0xF4AB1C3CBB5AE47uLL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionPlaceHolder00(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder00");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x32DFB096DDE0AC48uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionPlaceHolder01(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder01");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x6D890ABB87B5DF5uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionPlaceHolder02(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder02");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0xCDA674E61EDDE2FuLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionPlaceHolder03(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder03");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x530BA3258551F27FuLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionPlaceHolder04(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder04");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x3C0C1B407EF68FECuLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5::CreateActionPlaceHolder05(OSObject *this, size_t a2, OSAction **a3)
{
  int v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder05");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x1F424A63A38451B7uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t sub_1000180DC(void *a1)
{
  *a1 = off_1000250C0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_CommandInterruptMetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_CommandInterruptMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100025100;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100025148;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_CommandInterrupt::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_CommandInterrupt::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_CommandInterruptMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001823C(void *a1)
{
  *a1 = off_100025168;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PagesInterruptMetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_PagesInterruptMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000251A8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000251F0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PagesInterrupt::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PagesInterrupt::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PagesInterruptMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001839C(void *a1)
{
  *a1 = off_100025210;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_AsyncInterruptMetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_AsyncInterruptMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100025250;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100025298;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_AsyncInterrupt::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_AsyncInterrupt::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_AsyncInterruptMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_1000184FC(void *a1)
{
  *a1 = off_1000252B8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_QueueInterruptMetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_QueueInterruptMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000252F8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100025340;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_QueueInterrupt::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_QueueInterrupt::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_QueueInterruptMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001865C(void *a1)
{
  *a1 = off_100025360;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_HealthTimerOccurredMetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_HealthTimerOccurredMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000253A0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000253E8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_HealthTimerOccurred::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_HealthTimerOccurred::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_HealthTimerOccurredMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_1000187BC(void *a1)
{
  *a1 = off_100025408;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_CmdTimerOccurredMetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_CmdTimerOccurredMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100025448;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100025490;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_CmdTimerOccurred::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_CmdTimerOccurred::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_CmdTimerOccurredMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001891C(void *a1)
{
  *a1 = off_1000254B0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder00MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder00MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000254F0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100025538;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder00::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder00::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder00MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100018A7C(void *a1)
{
  *a1 = off_100025558;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder01MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder01MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100025598;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000255E0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder01::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder01::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder01MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100018BDC(void *a1)
{
  *a1 = off_100025600;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder02MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder02MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100025640;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100025688;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder02::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder02::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder02MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100018D3C(void *a1)
{
  *a1 = off_1000256A8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder03MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder03MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000256E8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100025730;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder03::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder03::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder03MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100018E9C(void *a1)
{
  *a1 = off_100025750;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder04MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder04MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100025790;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000257D8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder04::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder04::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder04MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_100018FFC(void *a1)
{
  *a1 = off_1000257F8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder05MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder05MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100025838;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100025880;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder05::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder05::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_PlaceHolder05MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001915C()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_CommandInterruptMetaClass;
}

uint64_t sub_100019168()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_PagesInterruptMetaClass;
}

uint64_t sub_100019174()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_AsyncInterruptMetaClass;
}

uint64_t sub_100019180()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_QueueInterruptMetaClass;
}

uint64_t sub_10001918C()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_HealthTimerOccurredMetaClass;
}

uint64_t sub_100019198()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_CmdTimerOccurredMetaClass;
}

uint64_t sub_1000191A4()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder00MetaClass;
}

uint64_t sub_1000191B0()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder01MetaClass;
}

uint64_t sub_1000191BC()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder02MetaClass;
}

uint64_t sub_1000191C8()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder03MetaClass;
}

uint64_t sub_1000191D4()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder04MetaClass;
}

uint64_t sub_1000191E0()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_PlaceHolder05MetaClass;
}

uint64_t sub_1000191EC(void *a1)
{
  *a1 = off_1000260C0;
  return 0;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIfMetaClass::New(DriverKit_AppleEthernetMLX5_NetIfMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026100;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100026290;
  *(void *)&a2[1].refcount = &off_1000262B0;
  return 0;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return DriverKit_AppleEthernetMLX5_NetIf::_Dispatch(this, &v4, a3);
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::_Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid > 0x16061157068ACF74)
  {
    if (msgid <= 0x5EFAA8FF5C284888)
    {
      if (msgid <= 0x2B08D810733D3888)
      {
        if (msgid == 0x16061157068ACF75)
        {
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v45 = *(_OWORD *)&a2->message;
            uint64_t v46 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v45;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          IORPC v44 = *a2;
          uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit01MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::RxSubmit01_Impl;
          long long v10 = &v44;
        }
        else
        {
          if (msgid != 0x205EF16268E67C26) {
            goto LABEL_68;
          }
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v26 = *(_OWORD *)&a2->message;
            uint64_t v27 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v26;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v24 = *(_OWORD *)&a2->message;
          uint64_t v25 = *(void *)&a2->sendSize;
          uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit04MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::TxSubmit04_Impl;
          long long v10 = (IORPC *)&v24;
        }
      }
      else
      {
        switch(msgid)
        {
          case 0x2B08D810733D3889:
            if (OSMetaClassBase::IsRemote(this))
            {
              long long v30 = *(_OWORD *)&a2->message;
              uint64_t v31 = *(void *)&a2->sendSize;
              p_IORPC invoke = (IORPC *)&v30;
              return OSMetaClassBase::Dispatch(this, p_invoke);
            }
            long long v28 = *(_OWORD *)&a2->message;
            uint64_t v29 = *(void *)&a2->sendSize;
            uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit03MetaClass;
            int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::RxSubmit03_Impl;
            long long v10 = (IORPC *)&v28;
            break;
          case 0x56DA22A632C956F6:
            if (OSMetaClassBase::IsRemote(this))
            {
              long long v22 = *(_OWORD *)&a2->message;
              uint64_t v23 = *(void *)&a2->sendSize;
              p_IORPC invoke = (IORPC *)&v22;
              return OSMetaClassBase::Dispatch(this, p_invoke);
            }
            long long v20 = *(_OWORD *)&a2->message;
            uint64_t v21 = *(void *)&a2->sendSize;
            uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit04MetaClass;
            int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::RxSubmit04_Impl;
            long long v10 = (IORPC *)&v20;
            break;
          case 0x5DFD70073CA4997ALL:
            if (OSMetaClassBase::IsRemote(this))
            {
              long long v53 = *(_OWORD *)&a2->message;
              uint64_t v54 = *(void *)&a2->sendSize;
              p_IORPC invoke = (IORPC *)&v53;
              return OSMetaClassBase::Dispatch(this, p_invoke);
            }
            long long v51 = *(_OWORD *)&a2->message;
            uint64_t v52 = *(void *)&a2->sendSize;
            uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit00MetaClass;
            int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::RxSubmit00_Impl;
            long long v10 = (IORPC *)&v51;
            break;
          default:
            goto LABEL_68;
        }
      }
    }
    else if (msgid > 0x6A92DD60D12A8DF1)
    {
      switch(msgid)
      {
        case 0x6A92DD60D12A8DF2:
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v34 = *(_OWORD *)&a2->message;
            uint64_t v35 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v34;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v32 = *(_OWORD *)&a2->message;
          uint64_t v33 = *(void *)&a2->sendSize;
          uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit03MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::TxSubmit03_Impl;
          long long v10 = (IORPC *)&v32;
          break;
        case 0x6B25FF7AF475DD27:
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v57 = *(_OWORD *)&a2->message;
            uint64_t v58 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v57;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v55 = *(_OWORD *)&a2->message;
          uint64_t v56 = *(void *)&a2->sendSize;
          uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit00MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::TxSubmit00_Impl;
          long long v10 = (IORPC *)&v55;
          break;
        case 0x6BE6AE72F8609A26:
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v42 = *(_OWORD *)&a2->message;
            uint64_t v43 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v42;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v40 = *(_OWORD *)&a2->message;
          uint64_t v41 = *(void *)&a2->sendSize;
          uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit02MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::TxSubmit02_Impl;
          long long v10 = (IORPC *)&v40;
          break;
        default:
          goto LABEL_68;
      }
    }
    else
    {
      switch(msgid)
      {
        case 0x5EFAA8FF5C284889:
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v14 = *(_OWORD *)&a2->message;
            uint64_t v15 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v14;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v12 = *(_OWORD *)&a2->message;
          uint64_t v13 = *(void *)&a2->sendSize;
          uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit05MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::RxSubmit05_Impl;
          long long v10 = (IORPC *)&v12;
          break;
        case 0x5F956ED273F7C6D9:
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v49 = *(_OWORD *)&a2->message;
            uint64_t v50 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v49;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v47 = *(_OWORD *)&a2->message;
          uint64_t v48 = *(void *)&a2->sendSize;
          uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit01MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::TxSubmit01_Impl;
          long long v10 = (IORPC *)&v47;
          break;
        case 0x634CE903D4840834:
          if (OSMetaClassBase::IsRemote(this))
          {
            long long v38 = *(_OWORD *)&a2->message;
            uint64_t v39 = *(void *)&a2->sendSize;
            p_IORPC invoke = (IORPC *)&v38;
            return OSMetaClassBase::Dispatch(this, p_invoke);
          }
          long long v36 = *(_OWORD *)&a2->message;
          uint64_t v37 = *(void *)&a2->sendSize;
          uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit02MetaClass;
          int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::RxSubmit02_Impl;
          long long v10 = (IORPC *)&v36;
          return IODataQueueDispatchSource::DataAvailable_Invoke(v10, this, v9, v8);
        default:
LABEL_68:
          IORPC v11 = *a2;
          return IOUserNetworkEthernet::_Dispatch(this, &v11);
      }
    }
    return IODataQueueDispatchSource::DataAvailable_Invoke(v10, this, v9, v8);
  }
  if (msgid > (uint64_t)0xE072FCC26CF639ABLL)
  {
    if (msgid <= (uint64_t)0xED7CE2CA0DF8ED0DLL)
    {
      if (msgid != 0xE072FCC26CF639ACLL)
      {
        if (msgid == 0xE77A9AA5DB9C706CLL)
        {
          IORPC rpc = *a2;
          return IOUserNetworkEthernet::GetHardwareAssists_Invoke(&rpc, this, (IOUserNetworkEthernet::GetHardwareAssists_Handler)DriverKit_AppleEthernetMLX5_NetIf::GetHardwareAssists_Impl);
        }
        goto LABEL_68;
      }
      if (OSMetaClassBase::IsRemote(this))
      {
        IORPC invoke = *a2;
        p_IORPC invoke = &invoke;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }
      IORPC v71 = *a2;
      return IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(&v71, this, (IOUserNetworkEthernet::SetPromiscuousModeEnable_Handler)DriverKit_AppleEthernetMLX5_NetIf::SetPromiscuousModeEnable_Impl);
    }
    else
    {
      if (msgid == 0xED7CE2CA0DF8ED0ELL)
      {
        IORPC v59 = *a2;
        return IOUserNetworkEthernet::SetMTU_Invoke(&v59, this, (IOUserNetworkEthernet::SetMTU_Handler)DriverKit_AppleEthernetMLX5_NetIf::SetMTU_Impl);
      }
      if (msgid != 0xF421A9D80F9A1FDALL)
      {
        if (msgid != 0x6E2402D458251B4) {
          goto LABEL_68;
        }
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v18 = *(_OWORD *)&a2->message;
          uint64_t v19 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v18;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        long long v16 = *(_OWORD *)&a2->message;
        uint64_t v17 = *(void *)&a2->sendSize;
        uint64_t v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit05MetaClass;
        int v9 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetMLX5_NetIf::TxSubmit05_Impl;
        long long v10 = (IORPC *)&v16;
        return IODataQueueDispatchSource::DataAvailable_Invoke(v10, this, v9, v8);
      }
      if (OSMetaClassBase::IsRemote(this))
      {
        long long v74 = *(_OWORD *)&a2->message;
        uint64_t v75 = *(void *)&a2->sendSize;
        p_IORPC invoke = (IORPC *)&v74;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }
      IORPC v73 = *a2;
      return IOUserNetworkEthernet::SetInterfaceEnable_Invoke(&v73, this, (IOUserNetworkEthernet::SetInterfaceEnable_Handler)DriverKit_AppleEthernetMLX5_NetIf::SetInterfaceEnable_Impl);
    }
  }
  else if (msgid <= (uint64_t)0xC3E63AC546EBD1FDLL)
  {
    if (msgid == 0xA49568F23EE8EFD5)
    {
      IORPC v64 = *a2;
      return IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(&v64, this, (IOUserNetworkEthernet::GetMaxTransferUnit_Handler)DriverKit_AppleEthernetMLX5_NetIf::GetMaxTransferUnit_Impl);
    }
    if (msgid != 0xB23EE0228705FB95) {
      goto LABEL_68;
    }
    if (OSMetaClassBase::IsRemote(this))
    {
      long long v61 = *(_OWORD *)&a2->message;
      uint64_t v62 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v61;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    IORPC v60 = *a2;
    return IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Invoke(&v60, this, (IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Handler)DriverKit_AppleEthernetMLX5_NetIf::SetWakeOnMagicPacketEnable_Impl);
  }
  else
  {
    switch(msgid)
    {
      case 0xC3E63AC546EBD1FELL:
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v66 = *(_OWORD *)&a2->message;
          uint64_t v67 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v66;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        IORPC v65 = *a2;
        return IOUserNetworkEthernet::SelectMediaType_Invoke(&v65, this, (IOUserNetworkEthernet::SelectMediaType_Handler)DriverKit_AppleEthernetMLX5_NetIf::SelectMediaType_Impl);
      case 0xD200FDE7D57ECCA6:
        IORPC v76 = *a2;
        return IOService::SetPowerState_Invoke(&v76, this, (IOService::SetPowerState_Handler)DriverKit_AppleEthernetMLX5_NetIf::SetPowerState_Impl);
      case 0xE042A87972611225:
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v69 = *(_OWORD *)&a2->message;
          uint64_t v70 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v69;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        IORPC v68 = *a2;
        return IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(&v68, this, (IOUserNetworkEthernet::SetAllMulticastModeEnable_Handler)DriverKit_AppleEthernetMLX5_NetIf::SetAllMulticastModeEnable_Impl);
      default:
        goto LABEL_68;
    }
  }
}

uint64_t DriverKit_AppleEthernetMLX5_NetIfMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionTxSubmit00(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit00");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x6B25FF7AF475DD27uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionRxSubmit00(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit00");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x5DFD70073CA4997AuLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionTxSubmit01(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit01");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x5F956ED273F7C6D9uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionRxSubmit01(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit01");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x16061157068ACF75uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionTxSubmit02(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit02");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x6BE6AE72F8609A26uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionRxSubmit02(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit02");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x634CE903D4840834uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionTxSubmit03(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit03");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x6A92DD60D12A8DF2uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionRxSubmit03(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit03");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x2B08D810733D3889uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionTxSubmit04(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit04");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x205EF16268E67C26uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionRxSubmit04(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit04");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x56DA22A632C956F6uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionTxSubmit05(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit05");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x6E2402D458251B4uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetMLX5_NetIf::CreateActionRxSubmit05(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit05");
  if (!v6) {
    return 3758097085;
  }
  int v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x5EFAA8FF5C284889uLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t sub_10001A524(void *a1)
{
  *a1 = off_100026408;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit00MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit00MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026448;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100026490;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit00::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit00::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit00MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001A684(void *a1)
{
  *a1 = off_1000264B0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit00MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit00MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000264F0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100026538;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit00::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit00::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit00MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001A7E4(void *a1)
{
  *a1 = off_100026558;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit01MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit01MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026598;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000265E0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit01::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit01::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit01MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001A944(void *a1)
{
  *a1 = off_100026600;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit01MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit01MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026640;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100026688;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit01::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit01::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit01MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001AAA4(void *a1)
{
  *a1 = off_1000266A8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit02MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit02MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000266E8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100026730;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit02::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit02::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit02MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001AC04(void *a1)
{
  *a1 = off_100026750;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit02MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit02MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026790;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000267D8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit02::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit02::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit02MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001AD64(void *a1)
{
  *a1 = off_1000267F8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit03MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit03MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026838;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100026880;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit03::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit03::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit03MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001AEC4(void *a1)
{
  *a1 = off_1000268A0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit03MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit03MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_1000268E0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100026928;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit03::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit03::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit03MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001B024(void *a1)
{
  *a1 = off_100026948;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit04MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit04MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026988;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000269D0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit04::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit04::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit04MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001B184(void *a1)
{
  *a1 = off_1000269F0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit04MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit04MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026A30;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100026A78;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit04::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit04::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit04MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001B2E4(void *a1)
{
  *a1 = off_100026A98;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit05MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit05MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026AD8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100026B20;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit05::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit05::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit05MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001B444(void *a1)
{
  *a1 = off_100026B40;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit05MetaClass::New(OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit05MetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100026B80;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100026BC8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit05::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit05::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit05MetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10001B5A4()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit00MetaClass;
}

uint64_t sub_10001B5B0()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit00MetaClass;
}

uint64_t sub_10001B5BC()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit01MetaClass;
}

uint64_t sub_10001B5C8()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit01MetaClass;
}

uint64_t sub_10001B5D4()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit02MetaClass;
}

uint64_t sub_10001B5E0()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit02MetaClass;
}

uint64_t sub_10001B5EC()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit03MetaClass;
}

uint64_t sub_10001B5F8()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit03MetaClass;
}

uint64_t sub_10001B604()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit04MetaClass;
}

uint64_t sub_10001B610()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit04MetaClass;
}

uint64_t sub_10001B61C()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_TxSubmit05MetaClass;
}

uint64_t sub_10001B628()
{
  return gOSAction_DriverKit_AppleEthernetMLX5_NetIf_RxSubmit05MetaClass;
}

void sub_10001B634()
{
}

void sub_10001B660()
{
}

void sub_10001B68C()
{
}

void sub_10001B6B8()
{
}

void sub_10001B6E4()
{
}

void sub_10001B710()
{
}

void sub_10001B73C()
{
}

void sub_10001B768()
{
}

void sub_10001B794()
{
}

void sub_10001B7C0()
{
}

void sub_10001B7EC()
{
}

void sub_10001B818()
{
}

void sub_10001B844()
{
}

void sub_10001B870()
{
}

void sub_10001B89C()
{
}

void sub_10001B8C8()
{
}

void sub_10001B8F4()
{
}

void sub_10001B920()
{
}

void sub_10001B94C()
{
}

void sub_10001B978()
{
}

void sub_10001B9A4()
{
}

void sub_10001B9D0()
{
}

void sub_10001B9FC()
{
}

void sub_10001BA28()
{
}

void sub_10001BA54()
{
}

void sub_10001BA80()
{
}

void sub_10001BAAC()
{
}

void sub_10001BAD8()
{
}

void sub_10001BB04()
{
}

void sub_10001BB30()
{
}

void sub_10001BB5C()
{
}

void sub_10001BB88()
{
}

void sub_10001BBB4()
{
}

void sub_10001BBE0()
{
}

void sub_10001BC0C(uint64_t a1, int a2, _DWORD *a3)
{
  if (*(_DWORD *)(a1 + 8) == 4)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    if (v4) {
      IORPC v5 = *(const char **)(v4 + 48);
    }
    else {
      IORPC v5 = "(ROOT)";
    }
    IOLog("FSBase::release(%p = %s, %s, %d) %s\n", (const void *)a1, *(const char **)(a1 + 48), v5, a2, "FS_TYPE_FLOW_ENTRY");
  }
  if (qword_100028500)
  {
    sub_100007B38((IOPCIDevice *)qword_100028500);
    sub_100007B18();
  }
  panic("mlx5:%s:%d refcount %d\n", "release", 170, *a3);
}

void sub_10001BCA4(uint64_t a1, int a2, _DWORD *a3)
{
  if (*(_DWORD *)(a1 + 8) == 4)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    if (v4) {
      IORPC v5 = *(const char **)(v4 + 48);
    }
    else {
      IORPC v5 = "(ROOT)";
    }
    IOLog("FSBase::release(%p = %s, %s, %d) %s\n", (const void *)a1, *(const char **)(a1 + 48), v5, a2, "FS_TYPE_FLOW_ENTRY");
  }
  if (qword_100028500)
  {
    sub_100007B38((IOPCIDevice *)qword_100028500);
    sub_100007B18();
  }
  panic("mlx5:%s:%d refcount %d\n", "removeNode", 221, *a3);
}

void sub_10001BD3C(uint64_t a1, int a2, _DWORD *a3)
{
  if (*(_DWORD *)(a1 + 8) == 4)
  {
    uint64_t v4 = *(void *)(a1 + 16);
    if (v4) {
      IORPC v5 = *(const char **)(v4 + 48);
    }
    else {
      IORPC v5 = "(ROOT)";
    }
    IOLog("FSBase::removeNode(%p = %s, %s, %d) %s\n", (const void *)a1, *(const char **)(a1 + 48), v5, a2, "FS_TYPE_FLOW_ENTRY");
  }
  if (qword_100028500)
  {
    sub_100007B38((IOPCIDevice *)qword_100028500);
    sub_100007B18();
  }
  panic("mlx5:%s:%d refcount %d\n", "removeNode", 208, *a3);
}

void sub_10001BDD4(uint64_t a1)
{
}

void sub_10001BE18(uint64_t a1)
{
}

void sub_10001BE5C(uint64_t a1)
{
}

void sub_10001BEA0(uint64_t a1)
{
}

void sub_10001BEE4()
{
}

void sub_10001BF10()
{
}

void sub_10001BF3C()
{
}

void sub_10001BF68(int *a1, int a2)
{
  if (qword_100028500)
  {
    uint8_t readData = 0;
    IOPCIDevice::ConfigurationRead8((IOPCIDevice *)qword_100028500, 4uLL, &readData);
    IOPCIDevice::ConfigurationWrite8((IOPCIDevice *)qword_100028500, 4uLL, readData & 0xFB);
    a2 = *a1;
  }
  panic("mlx5:%s:%d couldn't add cq.cqn %d\n", "createCQ", 49, a2);
}

void sub_10001BFD4()
{
}

void sub_10001C000()
{
}

void sub_10001C02C()
{
}

void sub_10001C058(uint64_t a1, int a2)
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d failed with size=%llx, err=%x\n", "AppleEthernetMLX5DMABuf", 16, a1, a2);
  }
  __assert_rtn("AppleEthernetMLX5DMABuf", "alloc.cpp", 17, "false");
}

void sub_10001C0B8()
{
}

void sub_10001C0F0()
{
  if (dword_1000284F8) {
    IOLog("mlx5:%s:%d !sq.hasRoomFor(2 * MLX5_SEND_WQE_MAX_WQEBBS)\n", "txSubmit", 130);
  }
  __assert_rtn("txSubmit", "en_tx.cpp", 131, "false");
}

void sub_10001C14C()
{
}

void sub_10001C178()
{
}

void sub_10001C1A4()
{
}

void sub_10001C1D0(int a1)
{
  if (qword_100028500)
  {
    sub_100007B38((IOPCIDevice *)qword_100028500);
    sub_100011338((IOPCIDevice *)qword_100028500);
  }
  panic("mlx5:%s:%d mlx5: CmdWorkEnt::waitFor() sleep returned with %x\n", "waitFor", 544, a1);
}

void sub_10001C220()
{
  if (qword_100028500)
  {
    sub_100007B38((IOPCIDevice *)qword_100028500);
    sub_100011338((IOPCIDevice *)qword_100028500);
  }
  panic("mlx5:%s:%d mlx5: command timed out\n", "waitFor", 553);
}

void sub_10001C268(_DWORD *a1, uint64_t a2)
{
  *a1 = -536870911;
  if (dword_1000284F8) {
    sub_10000F0A0(a2, 1);
  }
  if (qword_100028500)
  {
    sub_100007B38((IOPCIDevice *)qword_100028500);
    sub_100011338((IOPCIDevice *)qword_100028500);
  }
  panic("mlx5:%s:%d mlx5: signature validation failed\n", "compHandler", 593);
}

void sub_10001C2D4(unsigned __int8 *a1)
{
  if (qword_100028500)
  {
    sub_100007B38((IOPCIDevice *)qword_100028500);
    sub_100011338((IOPCIDevice *)qword_100028500);
  }
  panic("mlx5:%s:%d mlx5: command failed, status (0x%x), syndrome 0x%x\n", "exec_block_invoke", 718, *a1, bswap32(*((_DWORD *)a1 + 1)));
}

void sub_10001C330()
{
}

void sub_10001C35C()
{
}

void sub_10001C388()
{
}

void sub_10001C3B4()
{
  __assert_rtn("invoke", "cmd.cpp", 620, "pool1 != max_reg_cmds");
}

void sub_10001C3E0()
{
}

void sub_10001C40C()
{
}

void sub_10001C438()
{
}

void sub_10001C464()
{
}

void sub_10001C490()
{
}

void sub_10001C4BC()
{
}

void sub_10001C4E8()
{
}

void sub_10001C514()
{
}

void sub_10001C540()
{
}

void sub_10001C56C()
{
}

void sub_10001C598()
{
}

void sub_10001C5C4()
{
  __assert_rtn("startInterface", "en_main.cpp", 1133, "!IOUserNetworkRxCompletionQueue::Create(rx_pool, owner, (params.rq_wq_type == MLX5_WQ_TYPE_STRQ_LINKED_LIST) ? rx_wq_size * (1 + num_strides) : rx_wq_size, i, dispatch_queue, &channel[i].rq.cmp_q)");
}

void sub_10001C5F0()
{
}

void sub_10001C61C()
{
}

void sub_10001C648()
{
}

void sub_10001C674()
{
}

void sub_10001C6A0()
{
}

void sub_10001C6CC()
{
}

void sub_10001C6F8()
{
}

void sub_10001C724()
{
}

void sub_10001C750()
{
}

void sub_10001C77C()
{
}

void sub_10001C7A8()
{
}

void sub_10001C7D4()
{
}

void sub_10001C800()
{
}

void sub_10001C82C()
{
}

void sub_10001C858()
{
}

void sub_10001C884()
{
}

void sub_10001C8B0()
{
}

void sub_10001C8DC()
{
}

void sub_10001C908()
{
}

void sub_10001C934()
{
}

void sub_10001C960()
{
}

void sub_10001C98C()
{
}

void IOFree(void *address, size_t length)
{
}

int IOLog(const char *format, ...)
{
  return _IOLog(format);
}

uint64_t IOMallocTyped()
{
  return _IOMallocTyped();
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

void IOSleep(uint64_t ms)
{
}

OSDictionaryPtr OSDictionaryCreate(void)
{
  return _OSDictionaryCreate();
}

void OSDictionarySetStringValue(OSDictionaryPtr obj, const char *key, const char *value)
{
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void IOPCIDevice::MemoryRead32(IOPCIDevice *this, uint8_t memoryIndex, uint64_t offset, uint32_t *readData)
{
}

void IOPCIDevice::MemoryWrite32(IOPCIDevice *this, uint8_t memoryIndex, uint64_t offset, uint32_t data)
{
}

void IOPCIDevice::MemoryWrite64(IOPCIDevice *this, uint8_t memoryIndex, uint64_t offset, uint64_t data)
{
}

void IOPCIDevice::ConfigurationRead8(IOPCIDevice *this, uint64_t offset, uint8_t *readData)
{
}

void IOPCIDevice::ConfigurationWrite8(IOPCIDevice *this, uint64_t offset, uint8_t data)
{
}

uint64_t IOPCIDevice::ConfigureInterrupts(IOPCIDevice *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, int (*a6)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  return IOPCIDevice::ConfigureInterrupts(this, a2, a3, a4, a5, a6);
}

kern_return_t IOPCIDevice::GetBusDeviceFunction(IOPCIDevice *this, uint8_t *returnBusNumber, uint8_t *returnDeviceNumber, uint8_t *returnFunctionNumber, OSDispatchMethod supermethod)
{
  return IOPCIDevice::GetBusDeviceFunction(this, returnBusNumber, returnDeviceNumber, returnFunctionNumber, supermethod);
}

kern_return_t IOPCIDevice::Open(IOPCIDevice *this, IOService *forClient, IOOptionBits options)
{
  return IOPCIDevice::Open(this, forClient, options);
}

void IOPCIDevice::Close(IOPCIDevice *this, IOService *forClient, IOOptionBits options)
{
}

kern_return_t IODMACommand::CompleteDMA(IODMACommand *this, uint64_t options, OSDispatchMethod supermethod)
{
  return IODMACommand::CompleteDMA(this, options, supermethod);
}

kern_return_t IODMACommand::PrepareForDMA(IODMACommand *this, uint64_t options, IOMemoryDescriptor *memory, uint64_t offset, uint64_t length, uint64_t *flags, uint32_t *segmentsCount, IOAddressSegment *segments, OSDispatchMethod supermethod)
{
  return IODMACommand::PrepareForDMA(this, options, memory, offset, length, flags, segmentsCount, segments, supermethod);
}

kern_return_t IODMACommand::Create(IOService *device, uint64_t options, const IODMACommandSpecification *specification, IODMACommand **command)
{
  return IODMACommand::Create(device, options, specification, command);
}

void IODispatchQueue::DispatchSync(IODispatchQueue *this, IODispatchBlock block)
{
}

void IODispatchQueue::DispatchAsync(IODispatchQueue *this, IODispatchBlock block)
{
}

void IODispatchQueue::DispatchSync_f(IODispatchQueue *this, void *context, IODispatchFunction function)
{
}

uint64_t IODispatchQueue::Sleep(IODispatchQueue *this, void *a2, unint64_t a3)
{
  return IODispatchQueue::Sleep(this, a2, a3);
}

kern_return_t IODispatchQueue::Create(const IODispatchQueueName name, uint64_t options, uint64_t priority, IODispatchQueue **queue)
{
  return IODispatchQueue::Create(name, options, priority, queue);
}

uint64_t IODispatchQueue::Wakeup(IODispatchQueue *this, void *a2)
{
  return IODispatchQueue::Wakeup(this, a2);
}

const char *__cdecl IODispatchQueue::GetName(IODispatchQueue *this)
{
  return IODispatchQueue::GetName(this);
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

kern_return_t IODispatchSource::SetEnable(IODispatchSource *this, BOOL enable, OSDispatchMethod supermethod)
{
  return IODispatchSource::SetEnable(this, enable, supermethod);
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

kern_return_t IOUserNetworkEthernet::SetMTU_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetMTU_Handler func)
{
  return IOUserNetworkEthernet::SetMTU_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::ReportLinkStatus(IOUserNetworkEthernet *this, IOUserNetworkLinkStatus linkStatus, IOUserNetworkMediaType activeMediaType, OSDispatchMethod supermethod)
{
  return IOUserNetworkEthernet::ReportLinkStatus(this, linkStatus, activeMediaType, supermethod);
}

kern_return_t IOUserNetworkEthernet::ReportLinkQuality(IOUserNetworkEthernet *this, IOUserNetworkLinkQuality linkQuality, OSDispatchMethod supermethod)
{
  return IOUserNetworkEthernet::ReportLinkQuality(this, linkQuality, supermethod);
}

kern_return_t IOUserNetworkEthernet::SelectMediaType_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SelectMediaType_Handler func)
{
  return IOUserNetworkEthernet::SelectMediaType_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::GetHardwareAssists_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::GetHardwareAssists_Handler func)
{
  return IOUserNetworkEthernet::GetHardwareAssists_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::GetMaxTransferUnit_Handler func)
{
  return IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(rpc, target, func);
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

kern_return_t IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Handler func)
{
  return IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Invoke(rpc, target, func);
}

kern_return_t IOUserNetworkEthernet::SetMTU(IOUserNetworkEthernet *this, uint32_t mtu, OSDispatchMethod supermethod)
{
  return IOUserNetworkEthernet::SetMTU(this, mtu, supermethod);
}

kern_return_t IOUserNetworkEthernet::_Dispatch(IOUserNetworkEthernet *self, const IORPC *rpc)
{
  return IOUserNetworkEthernet::_Dispatch(self, rpc);
}

kern_return_t IOBufferMemoryDescriptor::GetAddressRange(IOBufferMemoryDescriptor *this, IOAddressSegment *range)
{
  return IOBufferMemoryDescriptor::GetAddressRange(this, range);
}

kern_return_t IOBufferMemoryDescriptor::Create(uint64_t options, uint64_t capacity, uint64_t alignment, IOBufferMemoryDescriptor **memory)
{
  return IOBufferMemoryDescriptor::Create(options, capacity, alignment, memory);
}

kern_return_t IOUserNetworkPacketQueue::SetEnable(IOUserNetworkPacketQueue *this, BOOL isEnable, OSDispatchMethod supermethod)
{
  return IOUserNetworkPacketQueue::SetEnable(this, isEnable, supermethod);
}

void IODataQueueDispatchSource::SendDataAvailable(IODataQueueDispatchSource *this)
{
}

kern_return_t IODataQueueDispatchSource::EnqueueWithCoalesce(IODataQueueDispatchSource *this, uint32_t dataSize, BOOL *sendDataAvailable, IODataQueueClientEnqueueEntryBlock callback)
{
  return IODataQueueDispatchSource::EnqueueWithCoalesce(this, dataSize, sendDataAvailable, callback);
}

kern_return_t IODataQueueDispatchSource::DataAvailable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::DataAvailable_Handler func, const OSMetaClass *targetActionClass)
{
  return IODataQueueDispatchSource::DataAvailable_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IODataQueueDispatchSource::SetDataAvailableHandler(IODataQueueDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  return IODataQueueDispatchSource::SetDataAvailableHandler(this, action, supermethod);
}

kern_return_t IOInterruptDispatchSource::SetHandler(IOInterruptDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  return IOInterruptDispatchSource::SetHandler(this, action, supermethod);
}

kern_return_t IOInterruptDispatchSource::GetInterruptType(IOService *provider, uint32_t index, uint64_t *interruptType)
{
  return IOInterruptDispatchSource::GetInterruptType(provider, index, interruptType);
}

kern_return_t IOInterruptDispatchSource::InterruptOccurred_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOInterruptDispatchSource::InterruptOccurred_Handler func, const OSMetaClass *targetActionClass)
{
  return IOInterruptDispatchSource::InterruptOccurred_Invoke(rpc, target, func, targetActionClass);
}

kern_return_t IOInterruptDispatchSource::Create(IOService *provider, uint32_t index, IODispatchQueue *queue, IOInterruptDispatchSource **source)
{
  return IOInterruptDispatchSource::Create(provider, index, queue, source);
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

void *__cdecl OSAction::GetReference(OSAction *this)
{
  return OSAction::GetReference(this);
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

uint64_t IOService::JoinPMTree(IOService *this, int (*a2)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  return IOService::JoinPMTree(this, a2);
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

kern_return_t IOService::RegisterService(IOService *this, OSDispatchMethod supermethod)
{
  return IOService::RegisterService(this, supermethod);
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

kern_return_t IOService::Create(IOService *this, IOService *provider, const IOPropertyName propertiesKey, IOService **result, OSDispatchMethod supermethod)
{
  return IOService::Create(this, provider, propertiesKey, result, supermethod);
}

kern_return_t IOService::Terminate(IOService *this, uint64_t options, OSDispatchMethod supermethod)
{
  return IOService::Terminate(this, options, supermethod);
}

kern_return_t IOService::_Dispatch(IOService *self, const IORPC *rpc)
{
  return IOService::_Dispatch(self, rpc);
}

kern_return_t IOUserNetworkPacket::GetPacketBufferPool(const IOUserNetworkPacket *this, IOUserNetworkPacketBufferPool **pool)
{
  return IOUserNetworkPacket::GetPacketBufferPool(this, pool);
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

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

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void panic(const char *a1, ...)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}