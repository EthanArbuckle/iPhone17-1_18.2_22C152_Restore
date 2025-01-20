uint64_t DriverKit_AppleEthernetIXGBE::init(IOUserNetworkEthernet *this)
{
  uint64_t result;

  IOParseBootArgNumber("ixgbe.log_level", &dword_10003C040, 4);
  result = IOMallocZeroTyped();
  if (result)
  {
    this[1].IOService::OSObject::OSMetaClassBase::__vftable = (IOUserNetworkEthernet_vtbl *)result;
    if (IOUserNetworkEthernet::init(this))
    {
      return 1;
    }
    else
    {
      result = (uint64_t)this[1].IOService::OSObject::OSMetaClassBase::__vftable;
      if (result)
      {
        IOFree((void *)result, 0xAE0uLL);
        result = 0;
        this[1].IOService::OSObject::OSMetaClassBase::__vftable = 0;
      }
    }
  }
  return result;
}

uint64_t non-virtual thunk to'DriverKit_AppleEthernetIXGBE::init(DriverKit_AppleEthernetIXGBE *this)
{
  return DriverKit_AppleEthernetIXGBE::init((IOUserNetworkEthernet *)((char *)this - 24));
}

void DriverKit_AppleEthernetIXGBE::free(IOUserNetworkEthernet *this)
{
  v2 = this[1].IOService::OSObject::OSMetaClassBase::__vftable;
  if (v2)
  {
    IOFree(v2, 0xAE0uLL);
    this[1].IOService::OSObject::OSMetaClassBase::__vftable = 0;
  }
  IOUserNetworkEthernet::free(this);
}

void non-virtual thunk to'DriverKit_AppleEthernetIXGBE::free(DriverKit_AppleEthernetIXGBE *this)
{
}

uint64_t DriverKit_AppleEthernetIXGBE::Start_Impl(DriverKit_AppleEthernetIXGBE *this, IOService *anObject)
{
  if ((dword_10003C040 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v12 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v12 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v13 = 2;
      }
      else {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    int v14 = v12 | v13;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v15 = 4;
      }
      else {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    int v16 = v14 | v15;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v17 = 8;
      }
      else {
        int v17 = 0;
      }
    }
    else
    {
      int v17 = 0;
    }
    int v18 = v16 | v17;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v19 = 16;
      }
      else {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    int v20 = v18 | v19;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v21 = 32;
      }
      else {
        int v21 = 0;
      }
    }
    else
    {
      int v21 = 0;
    }
    int v22 = v21 | v20;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v23 = 64;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v24 = v22 + v23;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v25 = 128;
      }
      else {
        int v25 = 0;
      }
    }
    else
    {
      int v25 = 0;
    }
    LODWORD(interruptType) = 67109890;
    HIDWORD(interruptType) = v24 + v25;
    __int16 v29 = 2080;
    v30 = "Start_Impl";
    __int16 v31 = 1024;
    int v32 = 25;
    __int16 v33 = 2048;
    v34 = this;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): %p\n", (uint8_t *)&interruptType, 0x22u);
  }
  v4 = (IOService *)OSMetaClassBase::safeMetaCast(anObject, gIOPCIDeviceMetaClass);
  if (!v4) {
    sub_100031708();
  }
  v5 = (IOPCIDevice *)v4;
  *(void *)(*((void *)this + 8) + 1960) = this;
  *(void *)(*((void *)this + 8) + 1968) = v4;
  uint64_t v6 = sub_100016660(*((void *)this + 8), v4);
  if (!v6)
  {
    if (IOService::Start((IOService *)this, anObject, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch)) {
      sub_1000319F4();
    }
    if (OSObject::CopyDispatchQueue((OSObject *)this, "Default", (IODispatchQueue **)(*((void *)this + 8) + 1976), 0))
    {
      sub_1000319C8();
    }
    if (IODispatchQueue::Create("interrupt", 0, 0, (IODispatchQueue **)(*((void *)this + 8) + 1984))) {
      sub_10003199C();
    }
    if (OSObject::SetDispatchQueue((OSObject *)this, "interrupt", *(IODispatchQueue **)(*((void *)this + 8) + 1984), 0))
    {
      sub_100031970();
    }
    uint64_t v7 = *((void *)this + 8);
    v8 = *(IODispatchQueue **)(v7 + 1984);
    qword_10003C000 = *(void *)(v7 + 1976);
    qword_10003C008 = (uint64_t)v8;
    action = 0;
    uint64_t interruptType = 0;
    if (IOTimerDispatchSource::Create(v8, (IOTimerDispatchSource **)(v7 + 2016))) {
      sub_100031944();
    }
    if (DriverKit_AppleEthernetIXGBE::CreateActionWatchdogTimerOccurred((OSObject *)this, 8uLL, &action)) {
      sub_100031918();
    }
    if (IOTimerDispatchSource::SetHandler(*(IOTimerDispatchSource **)(*((void *)this + 8) + 2016), action, 0)) {
      sub_1000318EC();
    }
    IOPCIDevice::ConfigureInterrupts(v5, 0x20000u, 2u, 2u, 0, 0);
    if (IOInterruptDispatchSource::GetInterruptType(v5, 0, &interruptType)) {
      sub_1000318C0();
    }
    uint64_t v9 = interruptType & 0x30000;
    if (IOInterruptDispatchSource::Create(v5, (interruptType & 0x30000) == 0, *(IODispatchQueue **)(*((void *)this + 8) + 1984), (IOInterruptDispatchSource **)(*((void *)this + 8) + 1992)))
    {
      sub_100031894();
    }
    if (DriverKit_AppleEthernetIXGBE::CreateActionOtherInterrupt((OSObject *)this, 8uLL, &action)) {
      sub_100031868();
    }
    if (IOInterruptDispatchSource::SetHandler(*(IOInterruptDispatchSource **)(*((void *)this + 8) + 1992), action, 0))
    {
      sub_10003183C();
    }
    if (IODispatchSource::SetEnable(*(IODispatchSource **)(*((void *)this + 8) + 1992), 1, 0)) {
      sub_100031810();
    }
    if (v9) {
      uint32_t v10 = 1;
    }
    else {
      uint32_t v10 = 2;
    }
    if (IOInterruptDispatchSource::Create(v5, v10, *(IODispatchQueue **)(*((void *)this + 8) + 1984), (IOInterruptDispatchSource **)(*((void *)this + 8) + 2000)))
    {
      sub_1000317E4();
    }
    if (DriverKit_AppleEthernetIXGBE::CreateActionQueueInterrupt((OSObject *)this, 8uLL, &action)) {
      sub_1000317B8();
    }
    if (IOInterruptDispatchSource::SetHandler(*(IOInterruptDispatchSource **)(*((void *)this + 8) + 2000), action, 0))
    {
      sub_10003178C();
    }
    if (IODispatchSource::SetEnable(*(IODispatchSource **)(*((void *)this + 8) + 2000), 1, 0)) {
      sub_100031760();
    }
    if (IOPCIDevice::Open(v5, (IOService *)this, 0)) {
      sub_100031734();
    }
    uint8_t readData = 0;
    IOPCIDevice::ConfigurationRead8(v5, 4uLL, &readData);
    IOPCIDevice::ConfigurationWrite8(v5, 4uLL, readData | 2);
    uint64_t v6 = sub_100016BEC(*((void *)this + 8));
    if (v6
      || (uint64_t v6 = sub_10001EE14(*((void *)this + 8)), v6)
      || (uint64_t v6 = IOService::RegisterService((IOService *)this, 0), v6))
    {
      IOService::Stop((IOService *)this, v5, 0);
    }
  }
  return v6;
}

uint64_t DriverKit_AppleEthernetIXGBE::Stop_Impl(DriverKit_AppleEthernetIXGBE *this, IOService *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v4 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v4 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v5 = 2;
      }
      else {
        int v5 = 0;
      }
    }
    else
    {
      int v5 = 0;
    }
    int v6 = v4 | v5;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v7 = 4;
      }
      else {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
    int v8 = v6 | v7;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v9 = 8;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    int v10 = v8 | v9;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v11 = 16;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    int v12 = v10 | v11;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v13 = 32;
      }
      else {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    int v14 = v13 | v12;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v15 = 64;
      }
      else {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    int v16 = v14 + v15;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v17 = 128;
      }
      else {
        int v17 = 0;
      }
    }
    else
    {
      int v17 = 0;
    }
    int v18 = *(unsigned __int8 *)(*((void *)this + 8) + 2748);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&buf[4] = v16 + v17;
    LOWORD(v23) = 2080;
    *(void *)((char *)&v23 + 2) = "Stop_Impl";
    WORD5(v23) = 1024;
    HIDWORD(v23) = 83;
    *(_WORD *)int v24 = 2048;
    *(void *)&v24[2] = this;
    __int16 v25 = 1024;
    int v26 = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): %p ivars->intrsEnabled=%d\n", buf, 0x28u);
  }
  uint64_t v19 = *((void *)this + 8);
  if (*(unsigned char *)(v19 + 2748)) {
    sub_100031A20();
  }
  if (!*(unsigned char *)(v19 + 2776))
  {
    *(void *)buf = 0;
    *(void *)&long long v23 = buf;
    *((void *)&v23 + 1) = 0x2000000000;
    *(_DWORD *)int v24 = 3;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 1107296256;
    handler[2] = sub_1000030D4;
    handler[3] = &unk_1000382F8;
    handler[4] = buf;
    handler[5] = this;
    handler[6] = a2;
    IODispatchSource::Cancel(*(IODispatchSource **)(v19 + 2016), handler, 0);
    IODispatchSource::Cancel(*(IODispatchSource **)(*((void *)this + 8) + 1992), handler, 0);
    IODispatchSource::Cancel(*(IODispatchSource **)(*((void *)this + 8) + 2000), handler, 0);
    *(unsigned char *)(*((void *)this + 8) + 2776) = 1;
    _Block_object_dispose(buf, 8);
  }
  return 0;
}

uint64_t sub_1000030D4(uint64_t result)
{
  v1 = *(IOService **)(result + 40);
  if (atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(*(void *)(result + 32) + 8) + 24), 0xFFFFFFFF, memory_order_relaxed) <= 1)
  {
    uint64_t v2 = result;
    (*((void (**)(OSMetaClass_vtbl *))v1[1].meta[63].getMetaClass + 2))(v1[1].meta[63].__vftable);
    (*(void (**)(void))(**(void **)&v1[1].meta[62].refcount + 16))(*(void *)&v1[1].meta[62].refcount);
    ((void (*)(OSMetaClass *))v1[1].meta[62].meta->release)(v1[1].meta[62].meta);
    (*((void (**)(OSMetaClass_vtbl *))v1[1].meta[62].getMetaClass + 2))(v1[1].meta[62].__vftable);
    IOPCIDevice::Close((IOPCIDevice *)v1[1].meta[61].meta, v1, 0);
    v3 = *(IOService **)(v2 + 48);
    return IOService::Stop(v1, v3, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
  }
  return result;
}

void sub_10000320C(uint64_t a1, uint64_t a2)
{
}

void sub_10000321C(uint64_t a1)
{
}

void DriverKit_AppleEthernetIXGBE::OtherInterrupt_Impl(DriverKit_AppleEthernetIXGBE *this, OSAction *a2)
{
  sub_10000F938(*((void *)this + 8));
  uint64_t v3 = *((void *)this + 8);
  if (!*(unsigned char *)(v3 + 2766))
  {
LABEL_86:
    __uint64_t v34 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    IOTimerDispatchSource::WakeAtTime(*(IOTimerDispatchSource **)(*((void *)this + 8) + 2016), 0x88uLL, v34 + 4000000000u, 0, 0);
    return;
  }
  if (*(_DWORD *)(v3 + 1616) != 12
    || *(_DWORD *)(v3 + 1628) != 65534
    || (*(unsigned int (**)(void))(v3 + 1424))(*((void *)this + 8)))
  {
    return;
  }
  int v4 = (*(uint64_t (**)(uint64_t))(v3 + 1440))(v3);
  *(unsigned char *)(v3 + 2766) = 0;
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v4 != -19)
  {
    if (v5)
    {
      if (qword_10003C000) {
        BOOL v7 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v7 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v9 = 2;
        }
        else {
          int v9 = 0;
        }
      }
      else
      {
        int v9 = 0;
      }
      int v12 = v7 | v9;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v13 = 4;
        }
        else {
          int v13 = 0;
        }
      }
      else
      {
        int v13 = 0;
      }
      int v16 = v12 | v13;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v17 = 8;
        }
        else {
          int v17 = 0;
        }
      }
      else
      {
        int v17 = 0;
      }
      int v20 = v16 | v17;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v21 = 16;
        }
        else {
          int v21 = 0;
        }
      }
      else
      {
        int v21 = 0;
      }
      int v24 = v20 | v21;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v25 = 32;
        }
        else {
          int v25 = 0;
        }
      }
      else
      {
        int v25 = 0;
      }
      int v28 = v25 | v24;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v29 = 64;
        }
        else {
          int v29 = 0;
        }
      }
      else
      {
        int v29 = 0;
      }
      int v32 = v28 + v29;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v33 = 128;
        }
        else {
          int v33 = 0;
        }
      }
      else
      {
        int v33 = 0;
      }
      int v35 = 67109634;
      int v36 = v32 + v33;
      __int16 v37 = 2080;
      v38 = "sfpProbe";
      __int16 v39 = 1024;
      int v40 = 215;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): SFP+ module detected!\n", (uint8_t *)&v35, 0x18u);
    }
    goto LABEL_86;
  }
  if (v5)
  {
    if (qword_10003C000) {
      BOOL v6 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v6 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v8 = 2;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v10 = v6 | v8;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v11 = 4;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    int v14 = v10 | v11;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v15 = 8;
      }
      else {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    int v18 = v14 | v15;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v19 = 16;
      }
      else {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    int v22 = v18 | v19;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v23 = 32;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v26 = v23 | v22;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v27 = 64;
      }
      else {
        int v27 = 0;
      }
    }
    else
    {
      int v27 = 0;
    }
    int v30 = v26 + v27;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v31 = 128;
      }
      else {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }
    int v35 = 67109634;
    int v36 = v30 + v31;
    __int16 v37 = 2080;
    v38 = "sfpProbe";
    __int16 v39 = 1024;
    int v40 = 212;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): Unsupported SFP+ module detected!", (uint8_t *)&v35, 0x18u);
  }
}

void DriverKit_AppleEthernetIXGBE::QueueInterrupt_Impl(DriverKit_AppleEthernetIXGBE *this, OSAction *a2)
{
}

void DriverKit_AppleEthernetIXGBE::WatchdogTimerOccurred_Impl(DriverKit_AppleEthernetIXGBE *this, OSAction *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v3 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v3 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v4 = 2;
      }
      else {
        int v4 = 0;
      }
    }
    else
    {
      int v4 = 0;
    }
    int v5 = v3 | v4;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v6 = 4;
      }
      else {
        int v6 = 0;
      }
    }
    else
    {
      int v6 = 0;
    }
    int v7 = v5 | v6;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v8 = 8;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v9 = v7 | v8;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v10 = 16;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v11 = v9 | v10;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v12 = 32;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v13 = v12 | v11;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v14 = 64;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v15 = v13 + v14;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v16 = 128;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    v18[0] = 67109890;
    v18[1] = v15 + v16;
    __int16 v19 = 2080;
    int v20 = "WatchdogTimerOccurred_Impl";
    __int16 v21 = 1024;
    int v22 = 134;
    __int16 v23 = 2048;
    int v24 = this;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): %p\n", (uint8_t *)v18, 0x22u);
  }
  uint64_t v17 = *((void *)this + 8);
  if (*(unsigned char *)(v17 + 2748))
  {
    ixgbe_check_link(v17);
    sub_100012980(*((void *)this + 8));
  }
}

uint64_t DriverKit_AppleEthernetIXGBE::SetInterfaceEnable_Impl(DriverKit_AppleEthernetIXGBE *this, int a2)
{
  if ((dword_10003C040 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v7 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v7 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v9 = 2;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    int v11 = v7 | v9;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v12 = 4;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v15 = v11 | v12;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v16 = 8;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v19 = v15 | v16;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v20 = 16;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    int v23 = v19 | v20;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v24 = 32;
      }
      else {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    int v27 = v24 | v23;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v28 = 64;
      }
      else {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }
    int v31 = v27 + v28;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v32 = 128;
      }
      else {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
    }
    *(_DWORD *)&buf[4] = v31 + v32;
    int v35 = "enable";
    *(_DWORD *)buf = 67109890;
    *(void *)((char *)&v48 + 2) = "SetInterfaceEnable_Impl";
    LOWORD(v48) = 2080;
    if (!a2) {
      int v35 = "disable";
    }
    WORD5(v48) = 1024;
    HIDWORD(v48) = 144;
    LOWORD(v49[0]) = 2080;
    *(void *)((char *)v49 + 2) = v35;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <==(%s)\n", buf, 0x22u);
  }
  uint8_t readData = 0;
  IOPCIDevice::ConfigurationRead8(*(IOPCIDevice **)(*((void *)this + 8) + 1968), 4uLL, &readData);
  if (a2) {
    IOPCIDevice::ConfigurationWrite8(*(IOPCIDevice **)(*((void *)this + 8) + 1968), 4uLL, readData | 4);
  }
  *(void *)buf = 0;
  *(void *)&long long v48 = buf;
  *((void *)&v48 + 1) = 0x2000000000;
  v49[0] = -1;
  int v4 = *(IODispatchQueue **)(*((void *)this + 8) + 1984);
  block[0] = _NSConcreteStackBlock;
  block[1] = 1107296256;
  block[2] = sub_100003CF0;
  block[4] = buf;
  block[5] = this;
  char v45 = a2;
  block[3] = &unk_100038328;
  IODispatchQueue::DispatchSync(v4, block);
  if (!a2 || *(_DWORD *)(v48 + 24)) {
    IOPCIDevice::ConfigurationWrite8(*(IOPCIDevice **)(*((void *)this + 8) + 1968), 4uLL, readData & 0xFB);
  }
  if ((dword_10003C040 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v8 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v8 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v10 = 2;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v13 = v8 | v10;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v14 = 4;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v17 = v13 | v14;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v18 = 8;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v21 = v17 | v18;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v22 = 16;
      }
      else {
        int v22 = 0;
      }
    }
    else
    {
      int v22 = 0;
    }
    int v25 = v21 | v22;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v26 = 32;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v29 = v26 | v25;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v30 = 64;
      }
      else {
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    int v33 = v29 + v30;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v34 = 128;
      }
      else {
        int v34 = 0;
      }
    }
    else
    {
      int v34 = 0;
    }
    int v36 = *(_DWORD *)(v48 + 24);
    v37[0] = 67109890;
    v37[1] = v33 + v34;
    __int16 v38 = 2080;
    __int16 v39 = "SetInterfaceEnable_Impl";
    __int16 v40 = 1024;
    int v41 = 161;
    __int16 v42 = 1024;
    int v43 = v36;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==>0x%08x\n", (uint8_t *)v37, 0x1Eu);
  }
  uint64_t v5 = *(unsigned int *)(v48 + 24);
  _Block_object_dispose(buf, 8);
  return v5;
}

uint64_t sub_100003CF0(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (*(unsigned char *)(result + 48))
  {
    result = sub_100020C54(*(IOUserNetworkPacketQueue ***)(v2 + 64));
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = result;
  }
  if (*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24)) {
    result = sub_100020EAC(*(IOUserNetworkPacketQueue ***)(v2 + 64));
  }
  if (!*(unsigned char *)(v1 + 48)) {
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = 0;
  }
  return result;
}

uint64_t DriverKit_AppleEthernetIXGBE::SetPromiscuousModeEnable_Impl(IOPCIDevice ***this, int a2)
{
  return sub_10001A3B8(this[8], a2);
}

uint64_t DriverKit_AppleEthernetIXGBE::SetAllMulticastModeEnable_Impl(IOPCIDevice ***this, int a2)
{
  if ((dword_10003C040 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v5 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v5 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v6 = 2;
      }
      else {
        int v6 = 0;
      }
    }
    else
    {
      int v6 = 0;
    }
    int v7 = v5 | v6;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v8 = 4;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v9 = v7 | v8;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v10 = 8;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v11 = v9 | v10;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v12 = 16;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v13 = v11 | v12;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v14 = 32;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v15 = v14 | v13;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v16 = 64;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v17 = v15 + v16;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v18 = 128;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    v20[1] = v17 + v18;
    int v19 = "enable";
    v20[0] = 67109890;
    int v22 = "SetAllMulticastModeEnable_Impl";
    __int16 v21 = 2080;
    if (!a2) {
      int v19 = "disable";
    }
    __int16 v23 = 1024;
    int v24 = 174;
    __int16 v25 = 2080;
    int v26 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): - %s\n", (uint8_t *)v20, 0x22u);
  }
  return sub_10001A7A4(this[8], a2);
}

uint64_t DriverKit_AppleEthernetIXGBE::setMulticastAddresses(DriverKit_AppleEthernetIXGBE *this, const ether_addr *a2, unsigned int a3)
{
  return sub_10001AB90(*((void *)this + 8), (uint64_t)a2, a3);
}

uint64_t non-virtual thunk to'DriverKit_AppleEthernetIXGBE::setMulticastAddresses(DriverKit_AppleEthernetIXGBE *this, const ether_addr *a2, unsigned int a3)
{
  return sub_10001AB90(*((void *)this + 2), (uint64_t)a2, a3);
}

uint64_t DriverKit_AppleEthernetIXGBE::SelectMediaType_Impl(DriverKit_AppleEthernetIXGBE *this, int a2)
{
  if ((dword_10003C040 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v7 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v7 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v8 = 2;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v9 = v7 | v8;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v10 = 4;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v11 = v9 | v10;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v12 = 8;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v13 = v11 | v12;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v14 = 16;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v15 = v13 | v14;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v16 = 32;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v17 = v16 | v15;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v18 = 64;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v19 = v17 + v18;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v20 = 128;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = v19 + v20;
    LOWORD(v24) = 2080;
    *(void *)((char *)&v24 + 2) = "SelectMediaType_Impl";
    WORD5(v24) = 1024;
    HIDWORD(v24) = 187;
    LOWORD(v25[0]) = 1024;
    *(_DWORD *)((char *)v25 + 2) = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): type=0x%08x\n", buf, 0x1Eu);
  }
  *(void *)buf = 0;
  *(void *)&long long v24 = buf;
  *((void *)&v24 + 1) = 0x2000000000;
  v25[0] = 0;
  int v4 = *(IODispatchQueue **)(*((void *)this + 8) + 1984);
  block[0] = _NSConcreteStackBlock;
  block[1] = 1107296256;
  block[2] = sub_10000421C;
  block[4] = buf;
  block[5] = this;
  block[3] = &unk_100038358;
  int v22 = a2;
  IODispatchQueue::DispatchSync(v4, block);
  uint64_t v5 = *(unsigned int *)(v24 + 24);
  _Block_object_dispose(buf, 8);
  return v5;
}

uint64_t sub_10000421C(uint64_t a1)
{
  uint64_t result = sub_1000145E4(*(void *)(*(void *)(a1 + 40) + 64), *(_DWORD *)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void DriverKit_AppleEthernetIXGBE::TxSubmit_Impl(DriverKit_AppleEthernetIXGBE *this, OSAction *a2)
{
  uint64_t v2 = *((void *)this + 8);
  if (!*(unsigned char *)(v2 + 2748)) {
    sub_100031A4C();
  }
  sub_1000107EC((IOPCIDevice **)v2, 0);
}

void DriverKit_AppleEthernetIXGBE::RxSubmit_Impl(DriverKit_AppleEthernetIXGBE *this, OSAction *a2)
{
  uint64_t v3 = *((void *)this + 8);
  if (*(unsigned char *)(v3 + 2748))
  {
    if (sub_100012690((IOPCIDevice **)v3, 0) >= 0x10000)
    {
      int v4 = *(IODataQueueDispatchSource **)(*((void *)this + 8) + 2720);
      IODataQueueDispatchSource::SendDataAvailable(v4);
    }
  }
  else if ((dword_10003C040 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v5 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v5 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v6 = 2;
      }
      else {
        int v6 = 0;
      }
    }
    else
    {
      int v6 = 0;
    }
    int v7 = v5 | v6;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v8 = 4;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v9 = v7 | v8;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v10 = 8;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v11 = v9 | v10;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v12 = 16;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v13 = v11 | v12;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v14 = 32;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v15 = v14 | v13;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v16 = 64;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v17 = v15 + v16;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v18 = 128;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    v19[0] = 67109634;
    v19[1] = v17 + v18;
    __int16 v20 = 2080;
    __int16 v21 = "RxSubmit_Impl";
    __int16 v22 = 1024;
    int v23 = 204;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): called with intrsEnabled == false\n", (uint8_t *)v19, 0x18u);
  }
}

uint64_t DriverKit_AppleEthernetIXGBE::GetMaxTransferUnit_Impl(DriverKit_AppleEthernetIXGBE *this, unsigned int *a2)
{
  *a2 = 2034;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXGBE::GetHardwareAssists_Impl(DriverKit_AppleEthernetIXGBE *this, unsigned int *a2)
{
  if (*(unsigned char *)(*((void *)this + 8) + 2765)) {
    unsigned int v2 = 67239936;
  }
  else {
    unsigned int v2 = 0x20000;
  }
  *a2 = v2;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXGBE::SetWakeOnMagicPacketEnable_Impl(DriverKit_AppleEthernetIXGBE *this, int a2)
{
  if ((dword_10003C040 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v5 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v5 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v6 = 2;
      }
      else {
        int v6 = 0;
      }
    }
    else
    {
      int v6 = 0;
    }
    int v7 = v5 | v6;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v8 = 4;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v9 = v7 | v8;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v10 = 8;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v11 = v9 | v10;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v12 = 16;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v13 = v11 | v12;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v14 = 32;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v15 = v14 | v13;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v16 = 64;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v17 = v15 + v16;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v18 = 128;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    v20[1] = v17 + v18;
    int v19 = "enable";
    v20[0] = 67109890;
    __int16 v22 = "SetWakeOnMagicPacketEnable_Impl";
    __int16 v21 = 2080;
    if (!a2) {
      int v19 = "disable";
    }
    __int16 v23 = 1024;
    int v24 = 230;
    __int16 v25 = 2080;
    int v26 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): - %s\n", (uint8_t *)v20, 0x22u);
  }
  *(unsigned char *)(*((void *)this + 8) + 1954) = a2;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXGBE::SetMTU_Impl(IOUserNetworkEthernet *this, uint32_t mtu)
{
  if ((mtu & 0xFFFFFFFE) == 0x682) {
    sub_10001AF70((uint64_t)this[1].IOService::OSObject::OSMetaClassBase::__vftable);
  }
  return IOUserNetworkEthernet::SetMTU(this, mtu, (OSDispatchMethod)&IOUserNetworkEthernet::_Dispatch);
}

uint64_t ixgbe_init_ops_X550(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_ops_X550", 26, "ixgbe_init_ops_X550");
  }
  uint64_t result = ixgbe_init_ops_X540(a1);
  *(void *)(a1 + 632) = ixgbe_dmac_config_X550;
  *(void *)(a1 + 624) = ixgbe_dmac_config_tcs_X550;
  *(void *)(a1 + 616) = ixgbe_dmac_update_tcs_X550;
  *(void *)(a1 + 640) = 0;
  *(void *)(a1 + 600) = ixgbe_set_source_address_pruning_X550;
  *(void *)(a1 + 608) = ixgbe_set_ethertype_anti_spoofing_X550;
  *(void *)(a1 + 576) = ixgbe_dcb_get_rtrup2tc_generic;
  *(void *)(a1 + 1720) = ixgbe_init_eeprom_params_X550;
  *(void *)(a1 + 1776) = ixgbe_calc_eeprom_checksum_X550;
  *(void *)(a1 + 1728) = ixgbe_read_ee_hostif_X550;
  *(void *)(a1 + 1736) = ixgbe_read_ee_hostif_buffer_X550;
  *(void *)(a1 + 1744) = ixgbe_write_ee_hostif_X550;
  *(void *)(a1 + 1752) = ixgbe_write_ee_hostif_buffer_X550;
  *(void *)(a1 + 1768) = ixgbe_update_eeprom_checksum_X550;
  *(void *)(a1 + 1760) = ixgbe_validate_eeprom_checksum_X550;
  *(void *)(a1 + 664) = ixgbe_disable_mdd_X550;
  *(void *)(a1 + 672) = ixgbe_enable_mdd_X550;
  *(void *)(a1 + 680) = ixgbe_mdd_event_X550;
  *(void *)(a1 + 688) = ixgbe_restore_mdd_vf_X550;
  *(void *)(a1 + 584) = ixgbe_disable_rx_x550;
  *(void *)(a1 + 536) = ixgbe_set_fw_drv_ver_x550;
  int v3 = *(unsigned __int16 *)(a1 + 1936);
  if (v3 == 5549 || v3 == 5576)
  {
    *(void *)(a1 + 312) = ixgbe_led_on_t_X550em;
    *(void *)(a1 + 320) = ixgbe_led_off_t_X550em;
  }
  else if (v3 == 5550)
  {
    *(void *)(a1 + 312) = 0;
    *(void *)(a1 + 320) = 0;
  }
  return result;
}

uint64_t ixgbe_dmac_config_X550(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_dmac_config_X550", 854, "ixgbe_dmac_config_X550");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x2400uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0x7FFFFFFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x2400uLL, v2);
  if (*(_WORD *)(a1 + 1288))
  {
    ixgbe_dmac_config_tcs_X550(a1);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x2400uLL, &v5);
    __dmb(1u);
    unsigned int v3 = ((100 * *(unsigned __int16 *)(a1 + 1288)) >> 12) | (HIBYTE(v5) << 24);
    if (*(unsigned char *)(a1 + 1290)) {
      v3 |= (0x10000 << *(unsigned char *)(a1 + 1296)) & 0xFF0000;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x2400uLL, v3 | 0x90000000);
  }
  return 0;
}

uint64_t ixgbe_dmac_config_tcs_X550(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_dmac_config_tcs_X550", 902, "ixgbe_dmac_config_tcs_X550");
  }
  int v2 = *(_DWORD *)(a1 + 1292);
  if (v2 == 32) {
    int v3 = 9;
  }
  else {
    int v3 = 85;
  }
  if (v2 == 2 || v2 == 8) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = v3;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4268uLL, &readData);
  unint64_t v6 = 0;
  __dmb(1u);
  uint32_t v7 = readData >> 26;
  uint64_t v8 = 13056;
  do
  {
    uint32_t v15 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v8, &v15);
    __dmb(1u);
    uint32_t v9 = v15 & 0xFFFFFE00;
    if (v6 < *(unsigned __int8 *)(a1 + 1297))
    {
      uint32_t v14 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v8 + 2304, &v14);
      __dmb(1u);
      uint32_t v10 = (v14 >> 10) & 0x3FF;
      BOOL v11 = v10 >= v5;
      uint32_t v12 = v10 - v5;
      if (!v11) {
        uint32_t v12 = 0;
      }
      if (v12 <= v7) {
        uint32_t v12 = v7;
      }
      v9 |= v12;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v8, v9);
    ++v6;
    v8 += 4;
  }
  while (v6 != 8);
  return 0;
}

uint64_t ixgbe_dmac_update_tcs_X550(IOPCIDevice **a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_dmac_update_tcs_X550", 957, "ixgbe_dmac_update_tcs_X550");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x2400uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0x7FFFFFFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x2400uLL, v2);
  ixgbe_dmac_config_tcs_X550((uint64_t)a1);
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x2400uLL, &v5);
  __dmb(1u);
  uint32_t v3 = v5 | 0x80000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x2400uLL, v3);
  return 0;
}

void ixgbe_set_source_address_pruning_X550(IOPCIDevice **a1, int a2, unsigned int a3)
{
  if (a3 <= 0x3F)
  {
    uint64_t v15 = v3;
    uint64_t v16 = v4;
    char v5 = a3;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0x50B0uLL, &readData);
    __dmb(1u);
    uint64_t v8 = readData;
    uint32_t v13 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0x50B4uLL, &v13);
    __dmb(1u);
    unint64_t v9 = v8 | ((unint64_t)v13 << 32);
    uint64_t v10 = v9 | (1 << v5);
    uint64_t v11 = v9 & ~(1 << v5);
    if (a2) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = v11;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x50B0uLL, v12);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x50B4uLL, HIDWORD(v12));
  }
}

void ixgbe_set_ethertype_anti_spoofing_X550(IOPCIDevice **a1, int a2, int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_ethertype_anti_spoofing_X550", 1047, "ixgbe_set_ethertype_anti_spoofing_X550");
  }
  if (a3 <= 0) {
    int v6 = -(-a3 & 7);
  }
  else {
    LOBYTE(v6) = a3 & 7;
  }
  char v7 = v6 + 16;
  uint32_t readData = 0;
  uint64_t v8 = 4 * (a3 >> 3) + 33280;
  IOPCIDevice::MemoryRead32(*a1, 0, v8, &readData);
  __dmb(1u);
  if (a2) {
    uint32_t v9 = readData | (1 << v7);
  }
  else {
    uint32_t v9 = readData & ~(1 << v7);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, v8, v9);
}

uint64_t ixgbe_init_eeprom_params_X550(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_eeprom_params_X550", 987, "ixgbe_init_eeprom_params_X550");
  }
  if (!*(_DWORD *)(a1 + 1784))
  {
    *(void *)(a1 + 1784) = 0xA00000002;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x10010uLL, &readData);
    __dmb(1u);
    int v2 = 64 << ((readData >> 11) & 0xF);
    *(_WORD *)(a1 + 1792) = v2;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Eeprom params: type = %d, size = %d\n\n", "ixgbe_init_eeprom_params_X550", 1000, *(_DWORD *)(a1 + 1784), v2 & 0xFFC0);
    }
  }
  return 0;
}

uint64_t ixgbe_calc_eeprom_checksum_X550(uint64_t a1)
{
  return ixgbe_calc_checksum_X550(a1, 0, 0);
}

uint64_t ixgbe_read_ee_hostif_X550(uint64_t a1, int a2, _WORD *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_ee_hostif_X550", 3089, "ixgbe_read_ee_hostif_X550");
  }
  v9[0] = -16383951;
  v9[1] = bswap32(2 * a2);
  v9[2] = 512;
  __int16 v10 = 0;
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1025);
  if (!v6)
  {
    uint64_t v6 = ixgbe_hic_unlocked((IOPCIDevice **)a1, v9, 0x10u, 500);
    if (!v6)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x1580CuLL, &readData);
      __dmb(1u);
      *a3 = readData;
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1025);
  }
  return v6;
}

uint64_t ixgbe_read_ee_hostif_buffer_X550(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_ee_hostif_buffer_X550", 3136, "ixgbe_read_ee_hostif_buffer_X550");
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1025);
  if (v8)
  {
    uint64_t v9 = v8;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_ee_hostif_buffer_X550", 3141, "EEPROM read buffer - semaphore failed\n");
    }
  }
  else
  {
    if (a3)
    {
      unsigned int v10 = 0;
      while (1)
      {
        unint64_t v11 = (a3 & 0xFE00) != 0 ? 512 : (unsigned __int16)a3;
        v19[0] = -16383951;
        v19[1] = bswap32(2 * (v10 + a2));
        __int16 v20 = bswap32(2 * v11) >> 16;
        __int16 v21 = 0;
        __int16 v22 = 0;
        uint64_t v12 = ixgbe_hic_unlocked((IOPCIDevice **)a1, v19, 0x10u, 500);
        if (v12) {
          break;
        }
        unint64_t v13 = 1;
        uint64_t v14 = 88076;
        do
        {
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v14, &readData);
          __dmb(1u);
          __int16 v15 = HIWORD(readData);
          *(_WORD *)(a4 + 2 * v10) = readData;
          if (v13 >= v11)
          {
            ++v10;
          }
          else
          {
            *(_WORD *)(a4 + 2 * (v10 + 1)) = v15;
            v10 += 2;
          }
          v14 += 4;
          unint64_t v16 = v13 + 1;
          v13 += 2;
        }
        while (v16 < v11);
        LOWORD(a3) = a3 - v11;
        if (!(_WORD)a3) {
          goto LABEL_18;
        }
      }
      uint64_t v9 = v12;
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_ee_hostif_buffer_X550", 3166, "Host interface command failed\n");
      }
    }
    else
    {
LABEL_18:
      uint64_t v9 = 0;
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1025);
  }
  return v9;
}

uint64_t ixgbe_write_ee_hostif_X550(uint64_t a1, int a2, __int16 a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_ee_hostif_X550", 3238, "ixgbe_write_ee_hostif_X550");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_ee_hostif_X550", 3245, "write ee hostif failed to get semaphore");
    }
    return 4294967280;
  }
  else
  {
    uint64_t v7 = ixgbe_write_ee_hostif_data_X550(a1, a2, a3);
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
    return v7;
  }
}

uint64_t ixgbe_write_ee_hostif_buffer_X550(uint64_t a1, __int16 a2, int a3, uint64_t a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_ee_hostif_buffer_X550", 3267, "ixgbe_write_ee_hostif_buffer_X550");
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1);
  if (v8)
  {
    uint64_t v9 = v8;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_ee_hostif_buffer_X550", 3272, "EEPROM write buffer - semaphore failed\n");
    }
  }
  else
  {
    if (a3)
    {
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = ixgbe_write_ee_hostif_data_X550(a1, (unsigned __int16)(v10 + a2), *(_WORD *)(a4 + 2 * v10));
        if (v11) {
          break;
        }
        if (a3 == ++v10) {
          goto LABEL_10;
        }
      }
      uint64_t v9 = v11;
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_ee_hostif_buffer_X550", 3281, "Eeprom buffered write failed\n");
      }
    }
    else
    {
LABEL_10:
      uint64_t v9 = 0;
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
  }
  return v9;
}

uint64_t ixgbe_update_eeprom_checksum_X550(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_eeprom_checksum_X550", 3524, "ixgbe_update_eeprom_checksum_X550");
  }
  uint64_t v2 = ixgbe_read_ee_hostif_X550(a1, 0, &v6);
  if (v2)
  {
    uint64_t v3 = v2;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_eeprom_checksum_X550", 3532, "EEPROM read failed\n");
    }
    return v3;
  }
  uint64_t v4 = ixgbe_calc_checksum_X550(a1, 0, 0);
  uint64_t v3 = v4;
  if ((v4 & 0x80000000) != 0) {
    return v3;
  }
  uint64_t v3 = ixgbe_write_ee_hostif_X550(a1, 63, v4);
  if (v3) {
    return v3;
  }
  return ixgbe_update_flash_X550(a1);
}

uint64_t ixgbe_validate_eeprom_checksum_X550(uint64_t a1, _WORD *a2)
{
  __int16 v8 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_eeprom_checksum_X550", 3472, "ixgbe_validate_eeprom_checksum_X550");
  }
  __int16 v9 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void, __int16 *))(a1 + 1728))(a1, 0, &v9);
  if (v4)
  {
    uint64_t v5 = v4;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_eeprom_checksum_X550", 3480, "EEPROM read failed\n");
    }
  }
  else
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1 + 1776))(a1);
    uint64_t v5 = v6;
    if ((v6 & 0x80000000) == 0)
    {
      __int16 v9 = v6;
      uint64_t v5 = ixgbe_read_ee_hostif_X550(a1, 63, &v8);
      if (!v5)
      {
        if (v8 == v9)
        {
          uint64_t v5 = 0;
        }
        else
        {
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): Invalid EEPROM checksum\n", "ixgbe_validate_eeprom_checksum_X550", 3501);
          }
          uint64_t v5 = 4294967294;
        }
        if (a2) {
          *a2 = v9;
        }
      }
    }
  }
  return v5;
}

void ixgbe_disable_mdd_X550(IOPCIDevice **a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_disable_mdd_X550", 1328, "ixgbe_disable_mdd_X550");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x4A80uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFFF9F;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x4A80uLL, v2);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x2F00uLL, &v4);
  __dmb(1u);
  uint32_t v3 = v4 & 0xCFFFFFFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x2F00uLL, v3);
}

void ixgbe_enable_mdd_X550(IOPCIDevice **a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_enable_mdd_X550", 1351, "ixgbe_enable_mdd_X550");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x4A80uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData | 0x60;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x4A80uLL, v2);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x2F00uLL, &v4);
  __dmb(1u);
  uint32_t v3 = v4 | 0x30000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x2F00uLL, v3);
}

void ixgbe_mdd_event_X550(IOPCIDevice **a1, uint64_t a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_mdd_event_X550", 1416, "ixgbe_mdd_event_X550");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x5818uLL, &readData);
  __dmb(1u);
  uint64_t v4 = (readData & 0xF) - 10;
  LOBYTE(v5) = 1;
  if (v4 <= 3) {
    int v5 = dword_1000321B0[v4];
  }
  int v6 = 0;
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint32_t v12 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 4 * i + 33072, &v12);
    __dmb(1u);
    uint32_t v8 = v12;
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 4 * i + 12208, &v11);
    __dmb(1u);
    uint32_t v9 = v11 | v8;
    if (v11 | v8)
    {
      unsigned int v10 = 0;
      do
      {
        if ((v9 & (1 << v10)) != 0)
        {
          *(_DWORD *)(a2 + 4 * ((v6 + v10) >> v5 >> 5)) |= 1 << ((v6 + v10) >> v5);
          v9 &= ~(1 << v10);
        }
        if (v10 > 0x1E) {
          break;
        }
        ++v10;
      }
      while (v9);
    }
    v6 += 32;
  }
}

void ixgbe_restore_mdd_vf_X550(IOPCIDevice **a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_restore_mdd_vf_X550", 1375, "ixgbe_restore_mdd_vf_X550");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x5818uLL, &readData);
  __dmb(1u);
  uint64_t v4 = readData & 0xF;
  uint64_t v5 = v4 - 10;
  if ((v4 - 10) > 3)
  {
    int v7 = 2;
    int v6 = 3;
  }
  else
  {
    int v6 = dword_1000321C0[v5];
    int v7 = dword_1000321D0[(int)v5];
  }
  unsigned int v8 = v7 * a2;
  uint32_t v9 = v6 << (v8 & 0x1E);
  __dmb(2u);
  int v10 = (v8 >> 3) & 0x1FFFFFFC;
  IOPCIDevice::MemoryWrite32(*a1, 0, (v10 + 33072), v9);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, (v10 + 12208), v9);
}

void ixgbe_disable_rx_x550(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_disable_rx_x550", 3681, "ixgbe_enable_rx_dma_x550");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3000uLL, &readData);
  __dmb(1u);
  if (readData)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x8220uLL, &readData);
    char v2 = 0;
    __dmb(1u);
    uint32_t v3 = readData;
    if (readData)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x8220uLL, v3 & 0xFFFFFFFE);
      char v2 = 1;
    }
    *(unsigned char *)(a1 + 1300) = v2;
    LOWORD(readData) = 478;
    HIBYTE(readData) = -1;
    char v7 = *(unsigned char *)(a1 + 1814);
    if (ixgbe_host_interface_command(a1, (uint64_t)&readData, 8u, 500, 1))
    {
      uint32_t v5 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3000uLL, &v5);
      __dmb(1u);
      uint32_t v4 = v5;
      if (v5)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x3000uLL, v4 & 0xFFFFFFFE);
      }
    }
  }
}

uint64_t ixgbe_set_fw_drv_ver_x550(uint64_t a1, char a2, char a3, char a4, char a5, size_t __n, void *__src)
{
  unsigned int v8 = __n;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_fw_drv_ver_x550", 4573, "ixgbe_set_fw_drv_ver_x550");
  }
  uint64_t result = 4294967264;
  if (v8 - 40 >= 0xFFFFFFD9 && __src)
  {
    v16[0] = -35;
    v16[1] = v8 + 5;
    __int16 v17 = 0;
    char v18 = *(unsigned char *)(a1 + 1812);
    char v22 = a2;
    char v21 = a3;
    char v20 = a4;
    char v19 = a5;
    memcpy(v23, __src, v8);
    HIBYTE(v17) = ixgbe_calculate_checksum(v16, v8 + 9);
    int v15 = 4;
    while (1)
    {
      uint64_t result = ixgbe_host_interface_command(a1, (uint64_t)v16, 0x30u, 500, 1);
      if (!result) {
        break;
      }
      if (!--v15) {
        return result;
      }
    }
    if (v17 == 1) {
      return 0;
    }
    else {
      return 4294967263;
    }
  }
  return result;
}

uint64_t ixgbe_led_on_t_X550em(IOPCIDevice **a1, unsigned int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_led_on_t_X550em", 4510, "ixgbe_led_on_t_X550em");
  }
  if (a2 > 2) {
    return 4294967291;
  }
  unsigned __int16 v6 = 0;
  ixgbe_read_phy_reg((uint64_t)a1, a2 + 50224, 30, (uint64_t)&v6);
  uint64_t v5 = v6 | 0x100u;
  v6 |= 0x100u;
  ixgbe_write_phy_reg((uint64_t)a1, a2 + 50224, 30, v5);
  return ixgbe_led_on_generic(a1, a2);
}

uint64_t ixgbe_led_off_t_X550em(IOPCIDevice **a1, unsigned int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_led_off_t_X550em", 4535, "ixgbe_led_off_t_X550em");
  }
  if (a2 > 2) {
    return 4294967291;
  }
  unsigned __int16 v5 = 0;
  ixgbe_read_phy_reg((uint64_t)a1, a2 + 50224, 30, (uint64_t)&v5);
  v5 &= ~0x100u;
  ixgbe_write_phy_reg((uint64_t)a1, a2 + 50224, 30, v5);
  return ixgbe_led_off_generic(a1, a2);
}

int8x16_t ixgbe_fw_phy_activity(uint64_t a1, __int16 a2, int8x16_t *a3)
{
  for (int i = 50; (_WORD)i; --i)
  {
    *(_OWORD *)uint32_t v9 = 0xFF00uLL;
    *(void *)&v9[14] = 0;
    __int16 v8 = 5125;
    v9[2] = *(unsigned char *)(a1 + 1814);
    *(_WORD *)&v9[4] = a2;
    *(int8x16_t *)&v9[6] = vrev32q_s8(*a3);
    if (ixgbe_host_interface_command(a1, (uint64_t)&v8, 0x18u, 500, 1)) {
      break;
    }
    if (v9[0] == 1)
    {
      int8x16_t result = vrev32q_s8(*(int8x16_t *)&v9[2]);
      *a3 = result;
      return result;
    }
    IODelay(0x14uLL);
  }
  return result;
}

double ixgbe_shutdown_fw_phy(uint64_t a1)
{
  v2.i32[3] = 0;
  *(uint64_t *)((char *)v2.i64 + 4) = 0;
  v2.i32[0] = 1;
  *(void *)&double result = ixgbe_fw_phy_activity(a1, 4, &v2).u64[0];
  return result;
}

uint64_t ixgbe_init_ops_X550EM(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_ops_X550EM", 577, "ixgbe_init_ops_X550EM");
  }
  uint64_t inited = ixgbe_init_ops_X550(a1);
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 184) = 0;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 232) = 0;
  *(_OWORD *)(a1 + 544) = 0u;
  *(_OWORD *)(a1 + 560) = 0u;
  *(_DWORD *)(a1 + 1808) = 4;
  *(void *)(a1 + 128) = ixgbe_get_bus_info_X550em;
  *(void *)(a1 + 56) = ixgbe_get_media_type_X550em;
  *(void *)(a1 + 168) = ixgbe_setup_sfp_modules_X550em;
  *(void *)(a1 + 288) = ixgbe_get_link_capabilities_X550em;
  *(void *)(a1 + 24) = ixgbe_reset_hw_X550em;
  *(void *)(a1 + 64) = ixgbe_get_supported_physical_layer_X550em;
  int media_type_X550em = ixgbe_get_media_type_X550em(a1);
  uint32_t v4 = ixgbe_setup_fc_X550em;
  if (media_type_X550em == 4) {
    uint32_t v4 = ixgbe_setup_fc_generic;
  }
  *(void *)(a1 + 520) = v4;
  *(void *)(a1 + 1432) = ixgbe_init_phy_ops_X550em;
  int v5 = *(unsigned __int16 *)(a1 + 1936);
  if ((v5 - 5604) >= 2)
  {
    if (v5 == 5550)
    {
      *(void *)(a1 + 520) = 0;
      *(void *)(a1 + 1416) = sub_100007130;
      *(void *)(a1 + 1576) = 0;
    }
    else
    {
      *(void *)(a1 + 1416) = sub_100007130;
    }
  }
  else
  {
    *(void *)(a1 + 520) = 0;
    *(void *)(a1 + 1416) = sub_100007050;
    *(void *)(a1 + 1576) = 0;
    *(void *)(a1 + 1512) = 0;
  }
  if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) != 4) {
    *(void *)(a1 + 1576) = 0;
  }
  *(void *)(a1 + 1720) = ixgbe_init_eeprom_params_X540;
  *(void *)(a1 + 1728) = ixgbe_read_ee_hostif_X550;
  *(void *)(a1 + 1736) = ixgbe_read_ee_hostif_buffer_X550;
  *(void *)(a1 + 1744) = ixgbe_write_ee_hostif_X550;
  *(void *)(a1 + 1752) = ixgbe_write_ee_hostif_buffer_X550;
  *(void *)(a1 + 1768) = ixgbe_update_eeprom_checksum_X550;
  *(void *)(a1 + 1760) = ixgbe_validate_eeprom_checksum_X550;
  *(void *)(a1 + 1776) = ixgbe_calc_eeprom_checksum_X550;
  return inited;
}

uint64_t ixgbe_get_bus_info_X550em(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_bus_info_X550em", 3659, "ixgbe_get_bus_info_x550em");
  }
  *(void *)(a1 + 1800) = 0;
  (*(void (**)(uint64_t))(a1 + 144))(a1);
  return 0;
}

uint64_t ixgbe_get_media_type_X550em(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_media_type_X550em", 1471, "ixgbe_get_media_type_X550em");
  }
  uint64_t result = 5;
  switch(*(_WORD *)(a1 + 1936))
  {
    case 0x15AA:
    case 0x15AB:
    case 0x15B0:
    case 0x15C2:
    case 0x15C3:
      return result;
    case 0x15AC:
    case 0x15C4:
    case 0x15CA:
    case 0x15CC:
    case 0x15CE:
      return 1;
    case 0x15AD:
    case 0x15AE:
    case 0x15C8:
      return 4;
    case 0x15AF:
    case 0x15B1:
    case 0x15B2:
    case 0x15B3:
    case 0x15B4:
    case 0x15B5:
    case 0x15B6:
    case 0x15B7:
    case 0x15B8:
    case 0x15B9:
    case 0x15BA:
    case 0x15BB:
    case 0x15BC:
    case 0x15BD:
    case 0x15BE:
    case 0x15BF:
    case 0x15C0:
    case 0x15C1:
    case 0x15C5:
    case 0x15C9:
    case 0x15CB:
    case 0x15CD:
      return 0;
    case 0x15C6:
    case 0x15C7:
      *(_DWORD *)(a1 + 1616) = 26;
      return result;
    default:
      if (*(unsigned __int16 *)(a1 + 1936) - 5604 >= 2) {
        return 0;
      }
      else {
        return 4;
      }
  }
}

uint64_t ixgbe_setup_sfp_modules_X550em(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_sfp_modules_X550em", 1579, "ixgbe_setup_sfp_modules_X550em");
  }
  uint64_t v2 = sub_10000886C(a1, &v4);
  if (!v2)
  {
    ixgbe_init_mac_link_ops_X550em(a1);
    *(void *)(a1 + 1440) = 0;
  }
  return v2;
}

uint64_t ixgbe_get_link_capabilities_X550em(uint64_t a1, int *a2, unsigned char *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_link_capabilities_X550em", 1850, "ixgbe_get_link_capabilities_X550em");
  }
  int v6 = *(_DWORD *)(a1 + 1616);
  if (v6 == 27)
  {
    *a3 = 1;
    int v7 = *(_DWORD *)(a1 + 1656);
LABEL_23:
    *a2 = v7;
    return 0;
  }
  if (*(_DWORD *)(a1 + 1640) == 1)
  {
    *a3 = 0;
    if ((*(_DWORD *)(a1 + 1628) - 11) > 3)
    {
      if (*(unsigned char *)(a1 + 1673)) {
        int v7 = 160;
      }
      else {
        int v7 = 128;
      }
    }
    else
    {
      int v7 = 32;
    }
    goto LABEL_23;
  }
  if (v6 == 26 || v6 == 8) {
    goto LABEL_13;
  }
  if (v6 != 4 || *(_DWORD *)(a1 + 696) != 8) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)(a1 + 1678) & 0x10) != 0)
  {
    int v9 = 1024;
    goto LABEL_21;
  }
  if (*(_WORD *)(a1 + 1936) == 5571) {
LABEL_13:
  }
    int v9 = 32;
  else {
LABEL_20:
  }
    int v9 = 160;
LABEL_21:
  *a2 = v9;
  *a3 = 1;
  return 0;
}

uint64_t ixgbe_reset_hw_X550em(uint64_t a1)
{
  char v15 = 0;
  uint64_t v2 = *(unsigned int *)(a1 + 1644);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_hw_X550em", 2399, "ixgbe_reset_hw_X550em");
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(a1 + 120))(a1);
  if (v3)
  {
    uint64_t inited = v3;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Failed to stop adapter, STATUS = %d\n\n");
    }
  }
  else
  {
    ixgbe_clear_tx_pending(a1);
    sub_100009D38(a1);
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1 + 1432))(a1);
    uint64_t inited = v6;
    if (!v6) {
      goto LABEL_55;
    }
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Failed to initialize PHY ops, STATUS = %d\n\n", "ixgbe_reset_hw_X550em", 2417, v6);
    }
    if ((inited & 0xFFFFFFFD) == 0xFFFFFFED)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n");
      }
    }
    else
    {
LABEL_55:
      if (*(_DWORD *)(a1 + 1616) == 7 && (uint64_t inited = ixgbe_init_ext_t_x550em(a1), inited))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): Failed to start the external PHY, STATUS = %d\n\n");
        }
      }
      else
      {
        if (*(unsigned char *)(a1 + 1632))
        {
          LODWORD(inited) = (*(uint64_t (**)(uint64_t))(a1 + 168))(a1);
          *(unsigned char *)(a1 + 1632) = 0;
        }
        if (inited == -19)
        {
          return 4294967277;
        }
        else if (!*(unsigned char *)(a1 + 1648) {
               && (unint64_t v13 = *(unsigned int (**)(uint64_t))(a1 + 1440)) != 0
        }
               && v13(a1) == -26)
        {
          return 4294967270;
        }
        else
        {
          int v16 = 0;
          while (1)
          {
            if (*(unsigned char *)(a1 + 1952))
            {
              int v7 = 8;
            }
            else
            {
              (*(void (**)(uint64_t, int *, char *, void))(a1 + 280))(a1, &v16, &v15, 0);
              int v7 = v15 ? 0x4000000 : 8;
            }
            int v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, v2);
            if (v8) {
              break;
            }
            uint32_t readData = 0;
            IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0, &readData);
            __dmb(1u);
            uint32_t v9 = readData | v7;
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0, v9);
            uint32_t readData = 0;
            IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
            __dmb(1u);
            (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v2);
            unsigned int v10 = 0;
            do
            {
              IODelay(1uLL);
              uint32_t readData = 0;
              IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0, &readData);
              __dmb(1u);
              uint32_t v11 = readData & 0x4000008;
            }
            while ((readData & 0x4000008) != 0 && v10++ < 9);
            if (v11)
            {
              if ((dword_10003C040 & 0x100000) != 0) {
                IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_hw_X550em", 2484, "Reset polling failed to complete.\n");
              }
              uint64_t inited = 4294967281;
            }
            else
            {
              uint64_t inited = 0;
            }
            IODelay(0xC350uLL);
            if ((*(unsigned char *)(a1 + 1285) & 1) == 0)
            {
              (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, a1 + 706);
              *(_DWORD *)(a1 + 1248) = 128;
              (*(void (**)(uint64_t))(a1 + 408))(a1);
              sub_100009D38(a1);
              if (*(_WORD *)(a1 + 1936) == 5548) {
                sub_100009374(a1);
              }
              if (v11 && (dword_10003C040 & 0x100000) != 0) {
                IOLog("ixgbe:%s(%d): Reset HW failed, STATUS = %d\n\n");
              }
              return inited;
            }
            *(unsigned char *)(a1 + 1285) &= ~1u;
          }
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): semaphore failed with %d\n", "ixgbe_reset_hw_X550em", 2466, v8);
          }
          return 4294967280;
        }
      }
    }
  }
  return inited;
}

uint64_t ixgbe_get_supported_physical_layer_X550em(uint64_t a1)
{
  unsigned __int16 v5 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_supported_physical_layer_X550em", 3588, "ixgbe_get_supported_physical_layer_X550em");
  }
  (*(void (**)(uint64_t))(a1 + 1416))(a1);
  int v2 = *(_DWORD *)(a1 + 1616);
  switch(v2)
  {
    case 4:
      if (*(_DWORD *)(a1 + 696) != 8) {
        goto LABEL_7;
      }
      if ((*(unsigned char *)(a1 + 1678) & 0x10) == 0)
      {
        if (*(_WORD *)(a1 + 1936) == 5571) {
          goto LABEL_11;
        }
        goto LABEL_7;
      }
      uint64_t v3 = 0x10000;
      break;
    case 5:
      uint64_t v3 = 640;
      break;
    case 6:
LABEL_7:
      uint64_t v3 = 2560;
      break;
    case 7:
      (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 11, 1, &v5);
      uint64_t v3 = ((unint64_t)v5 >> 4) & 2 | ((unint64_t)v5 >> 2) & 1;
      break;
    case 8:
      uint64_t v3 = 2;
      break;
    default:
      if (v2 == 26)
      {
LABEL_11:
        uint64_t v3 = 512;
      }
      else if (v2 == 27)
      {
        uint64_t v3 = (*(_DWORD *)(a1 + 1656) >> 1) & 4 | (*(_DWORD *)(a1 + 1656) >> 4) & 2 | (((*(_DWORD *)(a1 + 1656) >> 1) & 1u) << 15);
      }
      else
      {
        uint64_t v3 = 0;
      }
      break;
  }
  if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) == 1) {
    return ixgbe_get_supported_phy_sfp_layer_generic(a1);
  }
  return v3;
}

uint64_t ixgbe_setup_fc_X550em(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_fc_X550em", 3871, "ixgbe_setup_fc_X550em");
  }
  int v2 = *(_DWORD *)(a1 + 1408);
  if (*(unsigned char *)(a1 + 1399)) {
    BOOL v3 = v2 == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): ixgbe_fc_rx_pause not valid in strict IEEE mode\n\n", "ixgbe_setup_fc_X550em", 3876);
    }
    return 4294967283;
  }
  else
  {
    int v4 = 1;
    int v5 = 1;
    switch(v2)
    {
      case 0:
        goto LABEL_11;
      case 1:
      case 3:
        goto LABEL_9;
      case 2:
        goto LABEL_10;
      case 4:
        *(_DWORD *)(a1 + 1408) = 3;
LABEL_9:
        int v4 = 0;
LABEL_10:
        int v5 = 0;
LABEL_11:
        int v6 = *(unsigned __int16 *)(a1 + 1936);
        if ((v6 - 5570) < 2) {
          goto LABEL_14;
        }
        if (v6 == 5552)
        {
          uint64_t result = 0;
LABEL_31:
          *(unsigned char *)(a1 + 1400) = 1;
          return result;
        }
        if (v6 == 5547)
        {
LABEL_14:
          int v12 = 0;
          if (*(unsigned char *)(a1 + 1814)) {
            uint64_t v7 = 33324;
          }
          else {
            uint64_t v7 = 16940;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, int *))(a1 + 648))(a1, v7, 0, &v12);
          if (!result)
          {
            unsigned int v9 = v12 & 0xCFFFFFFF;
            if (!v4) {
              unsigned int v9 = v12 & 0xCFFFFFFF | 0x10000000;
            }
            if (v5) {
              int v10 = v9;
            }
            else {
              int v10 = v9 | 0x20000000;
            }
            int v12 = v10;
            if (*(unsigned char *)(a1 + 1814)) {
              uint64_t v11 = 33324;
            }
            else {
              uint64_t v11 = 16940;
            }
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v11, 0);
            goto LABEL_31;
          }
        }
        else
        {
          uint64_t result = 0;
        }
        break;
      default:
        if ((MEMORY[3] & 0x10) != 0) {
          IOLog("ixgbe:%s(%d): Flow control param set incorrectly\n\n", "ixgbe_setup_fc_X550em", 3912);
        }
        return 4294967292;
    }
  }
  return result;
}

uint64_t ixgbe_init_phy_ops_X550em(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_phy_ops_X550em", 2242, "ixgbe_init_phy_ops_X550em");
  }
  (*(void (**)(uint64_t))(a1 + 144))(a1);
  sub_100009308(a1);
  if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) == 1)
  {
    *(_DWORD *)(a1 + 1644) = 6150;
    sub_100009374(a1);
    *(void *)(a1 + 1424) = ixgbe_identify_sfp_module_X550em;
  }
  unsigned int v2 = *(unsigned __int16 *)(a1 + 1936);
  if (v2 > 0x15CD)
  {
    if (v2 - 5604 < 2)
    {
      *(_OWORD *)(a1 + 1448) = 0u;
      *(_OWORD *)(a1 + 1464) = 0u;
      *(void *)(a1 + 1568) = sub_100009414;
LABEL_14:
      int v4 = *(_DWORD *)(a1 + 1644);
      if (*(unsigned char *)(a1 + 1814)) {
        int v5 = v4 | 4;
      }
      else {
        int v5 = v4 | 2;
      }
      goto LABEL_18;
    }
    int v3 = 5582;
LABEL_12:
    if (v2 != v3) {
      goto LABEL_19;
    }
    *(void *)(a1 + 1448) = ixgbe_read_phy_reg_x550a;
    *(void *)(a1 + 1456) = ixgbe_write_phy_reg_x550a;
    goto LABEL_14;
  }
  if (v2 == 5548)
  {
    int v5 = 6150;
LABEL_18:
    *(_DWORD *)(a1 + 1644) = v5;
    goto LABEL_19;
  }
  if (v2 != 5550)
  {
    int v3 = 5576;
    goto LABEL_12;
  }
  *(void *)(a1 + 1472) = 0;
  *(void *)(a1 + 1464) = 0;
LABEL_19:
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1 + 1416))(a1);
  if ((v6 & 0xFFFFFFFD) != 0xFFFFFFED)
  {
    ixgbe_init_mac_link_ops_X550em(a1);
    if (*(_DWORD *)(a1 + 1628) != 0xFFFF) {
      *(void *)(a1 + 1440) = 0;
    }
    int v7 = *(_DWORD *)(a1 + 1616);
    switch(v7)
    {
      case 4:
        *(void *)(a1 + 1480) = ixgbe_setup_kr_x550em;
        goto LABEL_29;
      case 5:
      case 6:
        *(void *)(a1 + 1480) = 0;
LABEL_29:
        *(void *)(a1 + 1448) = sub_10000962C;
        *(void *)(a1 + 1456) = sub_100009634;
        return v6;
      case 7:
        *(void *)(a1 + 1488) = ixgbe_setup_internal_phy_t_x550em;
        if (*(_DWORD *)(a1 + 696) == 7)
        {
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x11158uLL, &readData);
          __dmb(1u);
          if ((readData & 0xC0) == 0) {
            *(void *)(a1 + 1584) = ixgbe_enter_lplu_t_x550em;
          }
        }
        *(void *)(a1 + 1592) = ixgbe_handle_lasi_ext_t_x550em;
        int v8 = ixgbe_reset_phy_t_X550em;
        goto LABEL_34;
      case 8:
        *(void *)(a1 + 1480) = 0;
        *(void *)(a1 + 1440) = 0;
        return v6;
      default:
        if (v7 == 26)
        {
          *(void *)(a1 + 1480) = 0;
        }
        else if (v7 == 27)
        {
          *(void *)(a1 + 1480) = sub_100009B78;
          int v8 = sub_100009CA8;
LABEL_34:
          *(void *)(a1 + 1440) = v8;
        }
        break;
    }
  }
  return v6;
}

void sub_100007050(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1814)) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  *(_DWORD *)(a1 + 1644) = v2;
  *(_DWORD *)(a1 + 1616) = 27;
  *(void *)(a1 + 1456) = 0;
  *(void *)(a1 + 1448) = 0;
  int8x16_t v10 = 0uLL;
  ixgbe_fw_phy_activity(a1, 7, &v10);
  if (!v3)
  {
    uint64_t v4 = 0;
    int v5 = 0;
    *(_DWORD *)(a1 + 1656) = 0;
    __int32 v6 = v10.i32[0];
    unsigned __int16 v7 = v10.i16[0] & 0xFFF;
    do
    {
      if ((v7 & (unsigned __int16)word_100032170[v4]) != 0)
      {
        v5 |= *(_DWORD *)&word_100032170[v4 + 2];
        *(_DWORD *)(a1 + 1656) = v5;
      }
      v4 += 4;
    }
    while (v4 != 24);
    if (!*(_DWORD *)(a1 + 1652)) {
      *(_DWORD *)(a1 + 1652) = v5;
    }
    unsigned int v8 = v6 & 0xFFFF0000;
    __int8 v9 = v10.i8[4];
    *(_DWORD *)(a1 + 1624) = v10.i16[2] & 0xFFF0 | v8;
    *(_DWORD *)(a1 + 1636) = v9 & 0xF;
  }
}

uint64_t sub_100007130(uint64_t a1)
{
  (*(void (**)(void))(a1 + 144))();
  sub_100009308(a1);
  uint64_t result = 0;
  unsigned int v3 = *(unsigned __int16 *)(a1 + 1936);
  if (v3 <= 0x15C1)
  {
    switch(*(_WORD *)(a1 + 1936))
    {
      case 0x15AA:
        uint64_t result = 0;
        int v4 = 5;
        goto LABEL_42;
      case 0x15AB:
        goto LABEL_12;
      case 0x15AC:
        sub_100009374(a1);
        unsigned int v7 = 0;
        uint64_t v8 = *(unsigned int *)(a1 + 1644);
        __int16 v19 = 0;
        break;
      case 0x15AD:
        goto LABEL_13;
      case 0x15AE:
        uint64_t result = 0;
        int v4 = 8;
        goto LABEL_42;
      case 0x15B0:
        uint64_t result = 0;
        int v4 = 6;
        goto LABEL_42;
      default:
        return result;
    }
    do
    {
      int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, v8);
      if (v9)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): semaphore failed with %d\n", "ixgbe_check_cs4227", 226, v9);
        }
      }
      else
      {
        int v10 = (*(uint64_t (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1688))(a1, *(unsigned __int8 *)(a1 + 1712), 2, &v19);
        if (v10) {
          BOOL v11 = 0;
        }
        else {
          BOOL v11 = v19 == 23205;
        }
        if (v11) {
          goto LABEL_68;
        }
        if (v10) {
          BOOL v12 = 0;
        }
        else {
          BOOL v12 = v19 == 4951;
        }
        if (!v12) {
          goto LABEL_45;
        }
        (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
      }
      IODelay(0x7530uLL);
    }
    while (v7++ < 0xE);
    int v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, v8);
    if (v14)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): semaphore failed with %d\n", "ixgbe_check_cs4227", 252, v14);
      }
      return ixgbe_identify_module_generic(a1);
    }
LABEL_45:
    __int16 v21 = 0;
    char v20 = 0;
    int v15 = sub_10000AC64(a1);
    if (v15) {
      goto LABEL_66;
    }
    v20 |= 2u;
    int v15 = sub_10000ACD0(a1);
    if (v15) {
      goto LABEL_66;
    }
    int v15 = sub_10000AC64(a1);
    if (v15) {
      goto LABEL_66;
    }
    v20 &= ~2u;
    int v15 = sub_10000ACD0(a1);
    if (v15
      || (int v15 = sub_10000AC64(a1)) != 0
      || (v20 &= ~2u, (int v15 = sub_10000ACD0(a1)) != 0)
      || (IODelay(0x1F4uLL), (int v15 = sub_10000AC64(a1)) != 0)
      || (v20 |= 2u, (int v15 = sub_10000ACD0(a1)) != 0))
    {
LABEL_66:
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): CS4227 reset failed: %d\n", "ixgbe_check_cs4227", 261, v15);
      }
    }
    else
    {
      IODelay(0x6DDD0uLL);
      int v16 = 15;
      while ((*(unsigned int (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1688))(a1, *(unsigned __int8 *)(a1 + 1712), 385, &v21)|| v21 != 1)
      {
        IODelay(0x7530uLL);
        if (!--v16)
        {
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): CS4227 reset did not complete.\n");
          }
LABEL_65:
          int v15 = -3;
          goto LABEL_66;
        }
      }
      if ((*(unsigned int (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1688))(a1, *(unsigned __int8 *)(a1 + 1712), 20481, &v21)|| (v21 & 1) == 0)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): CS4227 EEPROM did not load successfully.\n");
        }
        goto LABEL_65;
      }
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(a1 + 1704))(a1, *(unsigned __int8 *)(a1 + 1712), 2, 4951);
      (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
      IODelay(0x2710uLL);
      int v18 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, v8);
      if (v18)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): semaphore failed with %d\n", "ixgbe_check_cs4227", 275, v18);
        }
        return ixgbe_identify_module_generic(a1);
      }
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(a1 + 1704))(a1, *(unsigned __int8 *)(a1 + 1712), 2, 23205);
    }
LABEL_68:
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
    IODelay((1000 * *(_DWORD *)(a1 + 1788)));
    return ixgbe_identify_module_generic(a1);
  }
  if (*(unsigned __int16 *)(a1 + 1936) > 0x15C7u)
  {
    if (v3 - 5604 < 2)
    {
      *(_DWORD *)(a1 + 1616) = 27;
      int v5 = *(_DWORD *)(a1 + 1644);
      uint64_t result = 0;
      if (*(unsigned char *)(a1 + 1814)) {
        int v6 = v5 | 4;
      }
      else {
        int v6 = v5 | 2;
      }
      *(_DWORD *)(a1 + 1644) = v6;
    }
    else if (v3 == 5576)
    {
LABEL_13:
      return ixgbe_identify_phy_generic(a1);
    }
    else if (v3 == 5582)
    {
      return ixgbe_identify_module_generic(a1);
    }
    return result;
  }
  if (v3 - 5570 >= 2)
  {
    if (v3 != 5572) {
      return result;
    }
    return ixgbe_identify_module_generic(a1);
  }
LABEL_12:
  uint64_t result = 0;
  int v4 = 4;
LABEL_42:
  *(_DWORD *)(a1 + 1616) = v4;
  return result;
}

uint64_t ixgbe_init_ops_X550EM_a(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_ops_X550EM_a", 759, "ixgbe_init_ops_X550EM_a");
  }
  uint64_t inited = ixgbe_init_ops_X550EM(a1);
  int v3 = *(_WORD *)(a1 + 1936) & 0xFFFE;
  BOOL v4 = v3 == 5574;
  if (v3 == 5574) {
    int v5 = ixgbe_read_iosf_sb_reg_x550;
  }
  else {
    int v5 = ixgbe_read_iosf_sb_reg_x550a;
  }
  int v6 = ixgbe_write_iosf_sb_reg_x550a;
  if (v4) {
    int v6 = ixgbe_write_iosf_sb_reg_x550;
  }
  *(void *)(a1 + 648) = v5;
  *(void *)(a1 + 656) = v6;
  *(void *)(a1 + 200) = sub_100007B48;
  *(void *)(a1 + 208) = sub_100007CC8;
  int v7 = (*(uint64_t (**)(uint64_t))(a1 + 56))(a1);
  if (v7 == 5)
  {
    *(void *)(a1 + 528) = ixgbe_fc_autoneg_backplane_x550em_a;
    *(void *)(a1 + 520) = ixgbe_setup_fc_backplane_x550em_a;
  }
  else if (v7 == 1)
  {
    *(void *)(a1 + 520) = 0;
    *(void *)(a1 + 528) = ixgbe_fc_autoneg_fiber_x550em_a;
  }
  if ((*(_WORD *)(a1 + 1936) & 0xFFFE) == 0x15E4)
  {
    *(void *)(a1 + 528) = ixgbe_fc_autoneg_sgmii_x550em_a;
    *(void *)(a1 + 520) = sub_1000082C8;
    *(void *)(a1 + 640) = sub_1000082E0;
    *(void *)(a1 + 1660) = 0x2800000028;
  }
  return inited;
}

uint64_t ixgbe_read_iosf_sb_reg_x550(IOPCIDevice **a1, int a2, int a3, uint32_t *a4)
{
  uint64_t v8 = ixgbe_acquire_swfw_semaphore((uint64_t)a1);
  if (!v8)
  {
    uint32_t v12 = 0;
    uint64_t v8 = sub_100008578(a1, 0);
    if (!v8)
    {
      uint32_t v12 = a2 | (a3 << 28);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, 0x11144uLL, v12);
      uint64_t v9 = sub_100008578(a1, &v12);
      if ((v12 & 0xC0000) != 0)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): Failed to read, error %x\n\n", "ixgbe_read_iosf_sb_reg_x550", 1172, (v12 >> 20));
        }
        uint64_t v8 = 4294967293;
      }
      else
      {
        uint64_t v8 = v9;
        if (!v9)
        {
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*a1, 0, 0x11148uLL, &readData);
          __dmb(1u);
          *a4 = readData;
        }
      }
    }
    ixgbe_release_swfw_semaphore((uint64_t)a1);
  }
  return v8;
}

uint64_t ixgbe_write_iosf_sb_reg_x550(IOPCIDevice **a1, int a2, int a3, uint32_t a4)
{
  uint64_t v8 = ixgbe_acquire_swfw_semaphore((uint64_t)a1);
  if (!v8)
  {
    uint32_t v11 = 0;
    uint64_t v8 = sub_100008578(a1, 0);
    if (!v8)
    {
      uint32_t v11 = a2 | (a3 << 28);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, 0x11144uLL, v11);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, 0x11148uLL, a4);
      uint64_t v9 = sub_100008578(a1, &v11);
      if ((v11 & 0xC0000) != 0)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): Failed to write, error %x\n\n", "ixgbe_write_iosf_sb_reg_x550", 1129, (v11 >> 20));
        }
        uint64_t v8 = 4294967293;
      }
      else
      {
        uint64_t v8 = v9;
      }
    }
    ixgbe_release_swfw_semaphore((uint64_t)a1);
  }
  return v8;
}

uint64_t ixgbe_read_iosf_sb_reg_x550a(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  *(void *)int v7 = 65280;
  *(void *)&v7[6] = 0;
  __int16 v6 = 2571;
  v7[2] = *(unsigned char *)(a1 + 1814);
  *(void *)&v7[4] = bswap32(a2) >> 16;
  uint64_t result = ixgbe_host_interface_command(a1, (uint64_t)&v6, 0x10u, 500, 1);
  *a4 = bswap32(*(unsigned int *)&v7[2]);
  return result;
}

uint64_t ixgbe_write_iosf_sb_reg_x550a(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4)
{
  *(void *)__int16 v6 = 65280;
  *(void *)&v6[6] = 0;
  __int16 v5 = 2571;
  v6[2] = *(unsigned char *)(a1 + 1814);
  v6[3] = 1;
  *(void *)&v6[4] = bswap32(a2) >> 16;
  *(_DWORD *)&v6[8] = bswap32(a4);
  return ixgbe_host_interface_command(a1, (uint64_t)&v5, 0x10u, 500, 0);
}

uint64_t sub_100007B48(uint64_t a1, int a2)
{
  unsigned int v4 = a2 & 0xBFFFFFFF;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_swfw_sync_X550a", 4255, "ixgbe_acquire_swfw_sync_X550a");
  }
  int v5 = -999;
  while (1)
  {
    if (v4)
    {
      uint64_t v6 = ixgbe_acquire_swfw_sync_X540(a1, v4);
      if (v6) {
        break;
      }
    }
    if ((a2 & 0x40000000) == 0) {
      return 0;
    }
    uint64_t phy_token = ixgbe_get_phy_token(a1);
    uint64_t v8 = phy_token;
    if (phy_token == -40)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Could not acquire PHY token, Status = %d\n\n", "ixgbe_acquire_swfw_sync_X550a", 4272, -40);
      }
    }
    else if (!phy_token)
    {
      return v8;
    }
    if (v4) {
      ixgbe_release_swfw_sync_X540(a1, v4);
    }
    if (v8 != -40)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Unable to retry acquiring the PHY token, Status = %d\n\n");
      }
      return v8;
    }
    if (__CFADD__(v5++, 1))
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Semaphore acquisition retries failed!: PHY ID = 0x%08X\n\n", "ixgbe_acquire_swfw_sync_X550a", 4288, *(_DWORD *)(a1 + 1624));
      }
      return 4294967256;
    }
  }
  uint64_t v8 = v6;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): Could not acquire SWFW semaphore, Status = %d\n\n");
  }
  return v8;
}

void sub_100007CC8(uint64_t a1, int a2)
{
  unsigned int v4 = a2 & 0xBFFFFFFF;
  if ((dword_10003C040 & 0x100000) == 0)
  {
    if ((a2 & 0x40000000) == 0) {
      goto LABEL_3;
    }
LABEL_8:
    ixgbe_put_phy_token(a1);
    if (!v4) {
      return;
    }
    goto LABEL_4;
  }
  IOLog("ixgbe:%s(%d): %s\n", "ixgbe_release_swfw_sync_X550a", 4303, "ixgbe_release_swfw_sync_X550a");
  if ((a2 & 0x40000000) != 0) {
    goto LABEL_8;
  }
LABEL_3:
  if (!v4) {
    return;
  }
LABEL_4:
  ixgbe_release_swfw_sync_X540(a1, v4);
}

uint64_t ixgbe_fc_autoneg_fiber_x550em_a(uint64_t result)
{
  *(unsigned char *)(result + 1401) = 0;
  *(_DWORD *)(result + 1404) = *(_DWORD *)(result + 1408);
  return result;
}

uint64_t ixgbe_fc_autoneg_backplane_x550em_a(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 1400))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      uint64_t result = IOLog("ixgbe:%s(%d): Flow control autoneg is disabled\n");
    }
    goto LABEL_14;
  }
  uint64_t v8 = 0;
  int v7 = 0;
  int v6 = 0;
  char v5 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, int *, char *, void))(result + 280))(result, &v6, &v5, 0);
  if (!v5)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      uint64_t result = IOLog("ixgbe:%s(%d): The link is down\n");
    }
    goto LABEL_14;
  }
  if (*(unsigned char *)(v1 + 1814)) {
    uint64_t v2 = 33280;
  }
  else {
    uint64_t v2 = 16896;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, char *))(v1 + 648))(v1, v2, 0, (char *)&v8 + 4);
  if (result || (v8 & 0x1000000000000000) == 0)
  {
    if ((dword_10003C040 & 0x100000) == 0)
    {
LABEL_14:
      *(unsigned char *)(v1 + 1401) = 0;
      *(_DWORD *)(v1 + 1404) = *(_DWORD *)(v1 + 1408);
      return result;
    }
LABEL_11:
    uint64_t result = IOLog("ixgbe:%s(%d): %s\n");
    goto LABEL_14;
  }
  if (*(unsigned char *)(v1 + 1814)) {
    uint64_t v3 = 33324;
  }
  else {
    uint64_t v3 = 16940;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, int *))(v1 + 648))(v1, v3, 0, &v7);
  if (result)
  {
    if ((dword_10003C040 & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (*(unsigned char *)(v1 + 1814)) {
    uint64_t v4 = 33644;
  }
  else {
    uint64_t v4 = 17260;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t *))(v1 + 648))(v1, v4, 0, &v8);
  if (result)
  {
    if ((dword_10003C040 & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  uint64_t result = ixgbe_negotiate_fc(v1, v7, v8, 0x10000000, 0x20000000, 1024, 2048);
  if (result) {
    goto LABEL_14;
  }
  *(unsigned char *)(v1 + 1401) = 1;
  return result;
}

uint64_t ixgbe_setup_fc_backplane_x550em_a(uint64_t a1)
{
  unsigned int v10 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_fc_backplane_x550em_a", 4105, "ixgbe_setup_fc_backplane_x550em_a");
  }
  int v2 = *(_DWORD *)(a1 + 1408);
  if (*(unsigned char *)(a1 + 1399)) {
    BOOL v3 = v2 == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): ixgbe_fc_rx_pause not valid in strict IEEE mode\n\n", "ixgbe_setup_fc_backplane_x550em_a", 4110);
    }
    return 4294967283;
  }
  else
  {
    if (v2 == 4) {
      *(_DWORD *)(a1 + 1408) = 3;
    }
    if (*(unsigned char *)(a1 + 1814)) {
      uint64_t v4 = 33324;
    }
    else {
      uint64_t v4 = 16940;
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v4, 0, &v10);
    if (v5)
    {
      uint64_t v6 = v5;
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_fc_backplane_x550em_a", 4126, "Auto-Negotiation did not complete\n");
      }
    }
    else
    {
      switch(*(_DWORD *)(a1 + 1408))
      {
        case 0:
          unsigned int v7 = v10 & 0xCFFFFFFF;
          goto LABEL_22;
        case 1:
        case 3:
          unsigned int v7 = v10 | 0x30000000;
          goto LABEL_22;
        case 2:
          unsigned int v7 = v10 & 0xCFFFFFFF | 0x20000000;
LABEL_22:
          unsigned int v10 = v7;
          if (*(unsigned char *)(a1 + 1814)) {
            uint64_t v8 = 33324;
          }
          else {
            uint64_t v8 = 16940;
          }
          (*(void (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v8, 0);
          uint64_t v6 = sub_10000A904(a1);
          break;
        default:
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): Flow control param set incorrectly\n\n", "ixgbe_setup_fc_backplane_x550em_a", 4168);
          }
          uint64_t v6 = 4294967292;
          break;
      }
    }
  }
  return v6;
}

void ixgbe_fc_autoneg_sgmii_x550em_a(uint64_t a1)
{
  int8x16_t v5 = 0uLL;
  if (*(unsigned char *)(a1 + 1400))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Flow control autoneg is disabled\n");
    }
  }
  else
  {
    int v4 = 0;
    char v3 = 0;
    (*(void (**)(uint64_t, int *, char *, void))(a1 + 280))(a1, &v4, &v3, 0);
    if (v3)
    {
      ixgbe_fw_phy_activity(a1, 3, &v5);
      if (!v2 && (v5.i32[0] & 0x1000000) != 0)
      {
        if (!ixgbe_negotiate_fc(a1, v5.i32[0], v5.i32[0], 0x200000, 0x100000, 0x20000000, 0x10000000))
        {
          *(unsigned char *)(a1 + 1401) = 1;
          return;
        }
      }
      else if ((dword_10003C040 & 0x100000) != 0)
      {
        IOLog("ixgbe:%s(%d): %s\n");
      }
    }
    else if ((dword_10003C040 & 0x100000) != 0)
    {
      IOLog("ixgbe:%s(%d): The link is down\n");
    }
  }
  *(unsigned char *)(a1 + 1401) = 0;
  *(_DWORD *)(a1 + 1404) = *(_DWORD *)(a1 + 1408);
}

void sub_1000082C8(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1408) == 4) {
    *(_DWORD *)(a1 + 1408) = 3;
  }
  sub_100009B78(a1);
}

uint64_t sub_1000082E0(uint64_t a1, int a2)
{
  if (((*(_DWORD *)(a1 + 1664) == 0) ^ a2)) {
    return 0;
  }
  if (a2) {
    int v3 = *(_DWORD *)(a1 + 1660);
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)(a1 + 1664) = v3;
  return (*(uint64_t (**)(void))(a1 + 1480))();
}

uint64_t ixgbe_init_ops_X550EM_x(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_ops_X550EM_x", 818, "ixgbe_init_ops_X550EM_x");
  }
  uint64_t result = ixgbe_init_ops_X550EM(a1);
  *(void *)(a1 + 648) = ixgbe_read_iosf_sb_reg_x550;
  *(void *)(a1 + 656) = ixgbe_write_iosf_sb_reg_x550;
  *(void *)(a1 + 200) = ixgbe_acquire_swfw_sync_X550em;
  *(void *)(a1 + 208) = ixgbe_release_swfw_sync_X550em;
  *(void *)(a1 + 1680) = sub_100008558;
  *(void *)(a1 + 1688) = sub_100008560;
  *(void *)(a1 + 1696) = sub_100008568;
  *(void *)(a1 + 1704) = sub_100008570;
  *(unsigned char *)(a1 + 1712) = -66;
  if (*(_WORD *)(a1 + 1936) == 5550)
  {
    *(void *)(a1 + 520) = 0;
    *(void *)(a1 + 640) = 0;
    *(void *)(a1 + 344) = 0;
  }
  return result;
}

uint64_t ixgbe_acquire_swfw_sync_X550em(uint64_t a1, __int16 a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_swfw_sync_X550em", 4213, "ixgbe_acquire_swfw_sync_X550em");
  }
  uint64_t v4 = ixgbe_acquire_swfw_sync_X540(a1, a2);
  uint64_t v5 = v4;
  if ((a2 & 0x1800) != 0 && !v4) {
    sub_10000AA74(a1, 1);
  }
  return v5;
}

void ixgbe_release_swfw_sync_X550em(uint64_t a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_release_swfw_sync_X550em", 4234, "ixgbe_release_swfw_sync_X550em");
  }
  if ((a2 & 0x1800) != 0) {
    sub_10000AA74(a1, 0);
  }
  ixgbe_release_swfw_sync_X540(a1, a2);
}

uint64_t sub_100008558(uint64_t a1, unsigned int a2, unsigned int a3, _WORD *a4)
{
  return ixgbe_read_i2c_combined_generic_int(a1, a2, a3, a4, 1);
}

uint64_t sub_100008560(uint64_t a1, unsigned int a2, unsigned int a3, _WORD *a4)
{
  return ixgbe_read_i2c_combined_generic_int(a1, a2, a3, a4, 0);
}

uint64_t sub_100008568(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  return ixgbe_write_i2c_combined_generic_int(a1, a2, a3, a4, 1);
}

uint64_t sub_100008570(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  return ixgbe_write_i2c_combined_generic_int(a1, a2, a3, a4, 0);
}

uint64_t sub_100008578(IOPCIDevice **a1, uint32_t *a2)
{
  for (int i = 0; i != 100; ++i)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0x11144uLL, &readData);
    __dmb(1u);
    uint32_t v5 = readData;
    if ((readData & 0x80000000) == 0) {
      break;
    }
    IODelay(0xAuLL);
  }
  if (a2) {
    *a2 = v5;
  }
  if (i != 100) {
    return 0;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): Wait timed out\n\n", "ixgbe_iosf_wait", 1084);
  }
  return 4294967293;
}

uint64_t ixgbe_get_phy_token(uint64_t a1)
{
  int v4 = -16776694;
  char v5 = *(unsigned char *)(a1 + 1814);
  char v6 = 0;
  __int16 v7 = 0;
  uint64_t v1 = ixgbe_host_interface_command(a1, (uint64_t)&v4, 8u, 500, 1);
  if (v1)
  {
    uint64_t v2 = v1;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Issuing host interface command failed with Status = %d\n\n", "ixgbe_get_phy_token", 1207, v1);
    }
  }
  else if (BYTE2(v4) == 1)
  {
    return 0;
  }
  else if (BYTE2(v4) == 128)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_phy_token", 1218, "Returning  IXGBE_ERR_TOKEN_RETRY\n");
    }
    return 4294967256;
  }
  else
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Host interface command returned 0x%08x , returning IXGBE_ERR_FW_RESP_INVALID\n\n", "ixgbe_get_phy_token", 1214, BYTE2(v4));
    }
    return 4294967257;
  }
  return v2;
}

uint64_t ixgbe_put_phy_token(uint64_t a1)
{
  int v2 = -16776694;
  char v3 = *(unsigned char *)(a1 + 1814);
  char v4 = 1;
  __int16 v5 = 0;
  uint64_t result = ixgbe_host_interface_command(a1, (uint64_t)&v2, 8u, 500, 1);
  if (!result)
  {
    if (BYTE2(v2) == 1)
    {
      return 0;
    }
    else
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_put_phy_token", 1248, "Put PHY Token host interface command failed");
      }
      return 4294967257;
    }
  }
  return result;
}

uint64_t ixgbe_identify_sfp_module_X550em(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_sfp_module_X550em", 1557, "ixgbe_identify_sfp_module_X550em");
  }
  uint64_t result = ixgbe_identify_module_generic(a1);
  if (!result) {
    return sub_10000886C(a1, &v3);
  }
  return result;
}

uint64_t sub_10000886C(uint64_t a1, char *a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_supported_sfp_modules_X550em", 1517, "ixgbe_supported_sfp_modules_X550em");
  }
  unsigned int v4 = *(_DWORD *)(a1 + 1628);
  if (v4 <= 0xE)
  {
    char v5 = 1;
    if (((1 << v4) & 0x79E0) != 0)
    {
      char v5 = 0;
LABEL_7:
      uint64_t result = 0;
      *a2 = v5;
      return result;
    }
    if (((1 << v4) & 0x18) != 0) {
      goto LABEL_7;
    }
  }
  if (v4 == 65534) {
    return 4294967276;
  }
  else {
    return 4294967277;
  }
}

uint64_t ixgbe_init_mac_link_ops_X550em(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_mac_link_ops_X550em", 1790, "ixgbe_init_mac_link_ops_X550em");
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 56))(a1);
  switch(result)
  {
    case 5:
      if ((*(_WORD *)(a1 + 1936) & 0xFFFE) != 0x15C6) {
        return result;
      }
      char v5 = sub_100009164;
      goto LABEL_20;
    case 4:
      int v6 = *(unsigned __int16 *)(a1 + 1936);
      if (v6 == 5550) {
        return result;
      }
      if (*(_DWORD *)(a1 + 696) != 8)
      {
        *(void *)(a1 + 264) = ixgbe_setup_mac_link_t_X550em;
        __int16 v7 = ixgbe_check_link_t_X550em;
        goto LABEL_18;
      }
      if ((v6 & 0xFFFE) == 0x15E4)
      {
        *(void *)(a1 + 264) = sub_100008DFC;
        __int16 v7 = ixgbe_check_mac_link_generic;
LABEL_18:
        *(void *)(a1 + 280) = v7;
        return result;
      }
      char v5 = ixgbe_setup_mac_link_t_X550em;
LABEL_20:
      *(void *)(a1 + 264) = v5;
      return result;
    case 1:
      *(void *)(a1 + 240) = 0;
      *(void *)(a1 + 248) = 0;
      *(void *)(a1 + 256) = 0;
      *(void *)(a1 + 264) = ixgbe_setup_mac_link_multispeed_fiber;
      *(void *)(a1 + 296) = ixgbe_set_soft_rate_select_speed;
      int v3 = *(unsigned __int16 *)(a1 + 1936);
      if (v3 == 5582 || v3 == 5572) {
        unsigned int v4 = ixgbe_setup_mac_link_sfp_x550a;
      }
      else {
        unsigned int v4 = ixgbe_setup_mac_link_sfp_x550em;
      }
      *(void *)(a1 + 272) = v4;
      break;
  }
  return result;
}

uint64_t ixgbe_setup_mac_link_sfp_x550a(uint64_t a1, unsigned int a2)
{
  __int16 v17 = 0;
  char v16 = 0;
  int v15 = 0;
  uint64_t result = sub_10000886C(a1, &v16);
  if (result == -20) {
    return 0;
  }
  if (result) {
    return result;
  }
  if (*(_WORD *)(a1 + 1936) == 5572)
  {
    if (*(unsigned char *)(a1 + 1814)) {
      uint64_t v5 = 36948;
    }
    else {
      uint64_t v5 = 20564;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, int *))(a1 + 648))(a1, v5, 0, &v15);
    if (!result)
    {
      unsigned int v6 = v15 & 0xFFCFFFFF;
      v15 &= 0xFFCFFFFF;
      if (!v16) {
        int v15 = v6 | 0x100000;
      }
      uint64_t v7 = *(unsigned char *)(a1 + 1814) ? 36948 : 20564;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v7, 0);
      if (!result)
      {
        unsigned int v18 = 0;
        uint64_t v8 = *(unsigned char *)(a1 + 1814) ? 36948 : 20564;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v8, 0, &v18);
        if (!result)
        {
          if (a2 == 128)
          {
            int v9 = 805306368;
          }
          else
          {
            if (a2 != 32) {
              return 4294967288;
            }
            int v9 = 0x20000000;
          }
          unsigned int v18 = v9 | v18 & 0x81FFFFFF;
          if (*(unsigned char *)(a1 + 1814)) {
            uint64_t v14 = 36948;
          }
          else {
            uint64_t v14 = 20564;
          }
          (*(void (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v14, 0);
          return sub_10000A904(a1);
        }
      }
    }
  }
  else
  {
    sub_100009EA4(a1, a2);
    int v10 = *(_DWORD *)(a1 + 1620);
    if (v10 != 0xFFFF && v10)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, __int16 *))(a1 + 1448))(a1, 415, 0, &v17);
      if (!result)
      {
        int v11 = *(unsigned __int8 *)(a1 + 1814);
        if (v17 == 16) {
          v11 += 2 * *(unsigned __int16 *)(a1 + 1816);
        }
        uint64_t v12 = ((v11 << 12) + 4784);
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, __int16 *))(a1 + 1448))(a1, v12, 0, &v17);
        if (!result)
        {
          if (v16) {
            __int16 v13 = 5;
          }
          else {
            __int16 v13 = 9;
          }
          __int16 v17 = v13;
          (*(void (**)(uint64_t, uint64_t, void))(a1 + 1456))(a1, v12, 0);
          return (*(uint64_t (**)(uint64_t, uint64_t, void, __int16 *))(a1 + 1448))(a1, v12, 0, &v17);
        }
      }
    }
    else
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_mac_link_sfp_x550a", 2731, "Invalid NW_MNG_IF_SEL.MDIO_PHY_ADD value\n");
      }
      return 4294967279;
    }
  }
  return result;
}

uint64_t ixgbe_setup_mac_link_sfp_x550em(uint64_t a1, unsigned int a2)
{
  char v9 = 0;
  uint64_t result = sub_10000886C(a1, &v9);
  if (result == -20) {
    return 0;
  }
  if (!result)
  {
    sub_100009EA4(a1, a2);
    unsigned __int16 v5 = (*(unsigned __int8 *)(a1 + 1814) << 12) + 4784;
    unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(a1 + 1696);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 1712);
    if (v9) {
      uint64_t v8 = 5;
    }
    else {
      uint64_t v8 = 9;
    }
    return v6(a1, v7, v5 & 0xFFF0, v8);
  }
  return result;
}

uint64_t sub_100008DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = 0;
  unsigned int v14 = 0;
  if (*(unsigned char *)(a1 + 1814)) {
    uint64_t v6 = 33292;
  }
  else {
    uint64_t v6 = 16908;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, char *))(a1 + 648))(a1, v6, 0, (char *)&v15 + 4);
  if (!result)
  {
    HIDWORD(v15) = HIDWORD(v15) & 0xDFFFC8FF | 0x3000;
    uint64_t v8 = *(unsigned char *)(a1 + 1814) ? 33292 : 16908;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v8, 0);
    if (!result)
    {
      uint64_t v9 = *(unsigned char *)(a1 + 1814) ? 33440 : 17056;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t *))(a1 + 648))(a1, v9, 0, &v15);
      if (!result)
      {
        LODWORD(v15) = v15 & 0xFFF7EFFF;
        uint64_t v10 = *(unsigned char *)(a1 + 1814) ? 33440 : 17056;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v10, 0);
        if (!result)
        {
          uint64_t v11 = *(unsigned char *)(a1 + 1814) ? 33292 : 16908;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(a1 + 656))(a1, v11, 0, HIDWORD(v15));
          if (!result)
          {
            uint64_t v12 = *(unsigned char *)(a1 + 1814) ? 36948 : 20564;
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v12, 0, &v14);
            if (!result)
            {
              unsigned int v14 = v14 & 0x81FFFFFF | 0x46000000;
              if (*(unsigned char *)(a1 + 1814)) {
                uint64_t v13 = 36948;
              }
              else {
                uint64_t v13 = 20564;
              }
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v13, 0);
              if (!result)
              {
                sub_10000A904(a1);
                return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1496))(a1, a2, a3);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ixgbe_setup_mac_link_t_X550em(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_mac_link_t_X550em", 4415, "ixgbe_setup_mac_link_t_X550em");
  }
  if ((a2 & 0x80) != 0) {
    int v6 = 128;
  }
  else {
    int v6 = 32;
  }
  int v9 = v6;
  if (*(_DWORD *)(a1 + 696) != 7
    || (*(unsigned char *)(a1 + 1679) & 1) != 0
    || (uint64_t result = sub_10000A044(a1, &v9), !result))
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1496);
    return v8(a1, a2, a3);
  }
  return result;
}

uint64_t ixgbe_check_link_t_X550em(uint64_t a1, int *a2, unsigned char *a3, int a4)
{
  __int16 v11 = 0;
  if ((*(unsigned int (**)(void))(a1 + 56))() != 4) {
    return 4294967292;
  }
  uint64_t result = ixgbe_check_mac_link_generic(a1, a2, a3, a4);
  if (!result)
  {
    if (*a3)
    {
      for (char i = 1; ; char i = 0)
      {
        char v10 = i;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 1, 7, &v11);
        if (result) {
          break;
        }
        if ((v10 & 1) == 0)
        {
          if ((v11 & 4) != 0) {
            return 0;
          }
          uint64_t result = 0;
          *a3 = 0;
          return result;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100009164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = 0;
  unsigned int v13 = 0;
  if (*(unsigned char *)(a1 + 1814)) {
    uint64_t v6 = 33292;
  }
  else {
    uint64_t v6 = 16908;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, char *))(a1 + 648))(a1, v6, 0, (char *)&v14 + 4);
  if (!result)
  {
    HIDWORD(v14) = HIDWORD(v14) & 0xDFFFC8FF | 0x3200;
    uint64_t v8 = *(unsigned char *)(a1 + 1814) ? 33292 : 16908;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v8, 0);
    if (!result)
    {
      uint64_t v9 = *(unsigned char *)(a1 + 1814) ? 33440 : 17056;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t *))(a1 + 648))(a1, v9, 0, &v14);
      if (!result)
      {
        LODWORD(v14) = v14 | 0x81000;
        uint64_t v10 = *(unsigned char *)(a1 + 1814) ? 33440 : 17056;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v10, 0);
        if (!result)
        {
          uint64_t v11 = *(unsigned char *)(a1 + 1814) ? 36948 : 20564;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v11, 0, &v13);
          if (!result)
          {
            unsigned int v13 = v13 & 0x81FFFFFF | 0x26000000;
            if (*(unsigned char *)(a1 + 1814)) {
              uint64_t v12 = 36948;
            }
            else {
              uint64_t v12 = 20564;
            }
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v12, 0);
            if (!result)
            {
              uint64_t result = sub_10000A904(a1);
              if (!result) {
                return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1496))(a1, a2, a3);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_100009308(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x11178uLL, &readData);
  __dmb(1u);
  unsigned __int8 v2 = readData;
  *(_DWORD *)(a1 + 1676) = readData;
  if (*(_DWORD *)(a1 + 696) == 8 && (v2 & 2) != 0) {
    *(_DWORD *)(a1 + 1620) = v2 >> 3;
  }
}

void sub_100009374(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  if (*(unsigned char *)(a1 + 1814)) {
    uint32_t v2 = readData & 0xFFFCFCFD | 0x200;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v2 & 0xFFFEFEFF);
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v3);
  __dmb(1u);
}

void sub_100009414(uint64_t a1)
{
  int8x16_t v3 = 0uLL;
  ixgbe_fw_phy_activity(a1, 3, &v3);
  if (!v2 && (v3.i8[3] & 2) != 0)
  {
    v4.i32[3] = 0;
    *(uint64_t *)((char *)v4.i64 + 4) = 0;
    v4.i32[0] = 1;
    ixgbe_fw_phy_activity(a1, 4, &v4);
  }
}

uint64_t ixgbe_read_phy_reg_x550a(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(_DWORD *)(a1 + 1644) | 0x40000000u;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_phy_reg_x550a", 4329, "ixgbe_read_phy_reg_x550a");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, v8)) {
    return 4294967280;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1464))(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
  return v10;
}

uint64_t ixgbe_write_phy_reg_x550a(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(_DWORD *)(a1 + 1644) | 0x40000000u;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_phy_reg_x550a", 4357, "ixgbe_write_phy_reg_x550a");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, v8)) {
    return 4294967280;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1472))(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
  return v10;
}

uint64_t sub_10000962C()
{
  return 0x7FFFFFFFLL;
}

uint64_t sub_100009634()
{
  return 0x7FFFFFFFLL;
}

uint64_t ixgbe_setup_kr_x550em(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 1653) & 4) != 0 || ixgbe_check_reset_blocked(a1)) {
    return 0;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 1652);
  return sub_100009EA4(a1, v3);
}

uint64_t ixgbe_setup_internal_phy_t_x550em(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(a1 + 56))() != 4) {
    return 4294967292;
  }
  if (*(_DWORD *)(a1 + 696) != 7 || (*(unsigned char *)(a1 + 1679) & 1) != 0)
  {
    return sub_100009EA4(a1, 0xA0u);
  }
  else
  {
    BOOL v6 = 0;
    __int16 v5 = 0;
    uint64_t result = sub_100009FC8(a1, &v6);
    if (result) {
      return result;
    }
    if (!v6) {
      return 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 51200, 7, &v5);
    if (result) {
      return result;
    }
    uint64_t result = sub_100009FC8(a1, &v6);
    if (result) {
      return result;
    }
    if (!v6) {
      return 0;
    }
    int v3 = v5 & 7;
    v5 &= 7u;
    if (v3 == 7)
    {
      int v4 = 128;
      goto LABEL_19;
    }
    if (v3 == 5)
    {
      int v4 = 32;
LABEL_19:
      int v7 = v4;
      return sub_10000A044(a1, &v7);
    }
    return 4294967283;
  }
}

uint64_t ixgbe_enter_lplu_t_x550em(uint64_t a1)
{
  int v10 = 0;
  __int16 v9 = 0;
  if (*(_DWORD *)(a1 + 696) != 7
    || (uint32_t readData = 0,
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x11158uLL, &readData),
        uint64_t result = 0,
        __dmb(1u),
        (readData & 0xC0) == 0))
  {
    if (ixgbe_check_reset_blocked(a1)) {
      return 0;
    }
    BOOL v7 = 0;
    uint64_t result = sub_100009FC8(a1, &v7);
    if (!result)
    {
      uint64_t result = ixgbe_read_eeprom(a1);
      if (!result)
      {
        if (!v7 || (*(_WORD *)(a1 + 1798) & 8) == 0 || !*(unsigned char *)(a1 + 1954) && (ixgbe_mng_present(a1) & 1) == 0) {
          return ixgbe_set_copper_phy_power(a1, 0);
        }
        unsigned int v8 = 0;
        uint64_t result = ixgbe_get_lcd_t_x550em(a1, (int *)&v8);
        if (result) {
          return result;
        }
        uint64_t v3 = v8;
        if (!v8) {
          return ixgbe_set_copper_phy_power(a1, 0);
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 51200, 7, &v9);
        if (result) {
          return result;
        }
        if (sub_100009FC8(a1, &v7)) {
          return ixgbe_set_copper_phy_power(a1, 0);
        }
        int v4 = v9 & 6;
        v9 &= 6u;
        if (v3 == 32 && v4 == 4 || v3 == 128 && v4 == 6) {
          return 0;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(a1 + 1448))(a1, 52224, 7, &v10);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a1 + 1448))(a1, 32, 7, (char *)&v10 + 2);
          if (!result)
          {
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(a1 + 1448))(a1, 50176, 7, &v10);
            if (!result)
            {
              int v5 = *(_DWORD *)(a1 + 1652);
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 264))(a1, v3, 0);
              *(_DWORD *)(a1 + 1652) = v5;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ixgbe_handle_lasi_ext_t_x550em(uint64_t a1)
{
  char v3 = 0;
  uint64_t result = sub_10000AB04(a1, &v3);
  if (!result)
  {
    if (v3)
    {
      return ixgbe_setup_internal_phy(a1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ixgbe_reset_phy_t_X550em(uint64_t a1)
{
  uint64_t result = ixgbe_reset_phy_generic(a1);
  if (!result)
  {
    __int16 v4 = 0;
    sub_10000AB04(a1, &v3);
    if (*(_DWORD *)(a1 + 696) == 8
      || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 54273, 7, &v4),
          !result)
      && (v4 |= 1u,
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1456))(a1, 54273, 7),
          !result))
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 54272, 30, &v4);
      if (!result)
      {
        v4 |= 0x4010u;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1456))(a1, 54272, 30);
        if (!result)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 65281, 30, &v4);
          if (!result)
          {
            v4 |= 0x1004u;
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1456))(a1, 65281, 30);
            if (!result)
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 65280, 30, &v4);
              if (!result)
              {
                v4 |= 1u;
                return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1456))(a1, 65280, 30);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_100009B78(uint64_t a1)
{
  v6.i32[3] = 0;
  *(uint64_t *)((char *)v6.i64 + 4) = 0;
  if (!*(unsigned char *)(a1 + 1648) && !ixgbe_check_reset_blocked(a1))
  {
    int v2 = *(_DWORD *)(a1 + 1408);
    if (*(unsigned char *)(a1 + 1399) && v2 == 1)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): ixgbe_fc_rx_pause not valid in strict IEEE mode\n\n", "ixgbe_setup_fw_link", 676);
      }
    }
    else
    {
      unsigned int v3 = v2 - 1;
      if (v3 > 2) {
        int v4 = 0;
      }
      else {
        int v4 = dword_1000321A0[v3];
      }
      for (uint64_t i = 0; i != 24; i += 4)
      {
        if ((*(_DWORD *)&word_100032170[i + 2] & *(_DWORD *)(a1 + 1652)) != 0) {
          v4 |= (unsigned __int16)word_100032170[i];
        }
      }
      v6.i32[0] = v4 | 0x480000;
      if (*(_DWORD *)(a1 + 1664)) {
        v6.i32[0] = v4 | 0x580000;
      }
      ixgbe_fw_phy_activity(a1, 2, &v6);
    }
  }
}

void sub_100009CA8(uint64_t a1)
{
  int8x16_t v4 = 0uLL;
  if (!*(unsigned char *)(a1 + 1648) && !ixgbe_check_reset_blocked(a1))
  {
    ixgbe_fw_phy_activity(a1, 5, &v4);
    if (!v2)
    {
      int8x16_t v4 = 0uLL;
      ixgbe_fw_phy_activity(a1, 1, &v4);
      if (!v3)
      {
        sub_100009B78(a1);
      }
    }
  }
}

void sub_100009D38(uint64_t a1)
{
  if (*(unsigned __int16 *)(a1 + 1936) - 5549 <= 0x38)
  {
    if (((1 << (*(_WORD *)(a1 + 1936) + 83)) & 0x22E000001) != 0)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4240uLL, &readData);
      __dmb(1u);
      uint32_t v2 = readData & 0xFFFEFFFF;
      __dmb(2u);
    }
    else
    {
      if (((1 << (*(_WORD *)(a1 + 1936) + 83)) & 0x180000000000000) == 0) {
        return;
      }
      uint32_t v3 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4240uLL, &v3);
      __dmb(1u);
      uint32_t v2 = v3 | 0x10000;
      __dmb(2u);
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4240uLL, v2);
  }
}

uint64_t ixgbe_init_ext_t_x550em(uint64_t a1)
{
  __int16 v3 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 52226, 1, &v3);
  if (!result)
  {
    if ((v3 & 3) == 0) {
      return 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 50297, 30, &v3);
    if (!result)
    {
      v3 &= ~0x8000u;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1456))(a1, 50297, 30);
      if (!result) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100009EA4(uint64_t a1, unsigned int a2)
{
  unsigned int v10 = 0;
  if (*(unsigned char *)(a1 + 1814)) {
    uint64_t v4 = 33292;
  }
  else {
    uint64_t v4 = 16908;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v4, 0, &v10);
  if (!result)
  {
    if ((a2 & 0x80) != 0) {
      int v6 = 537133056;
    }
    else {
      int v6 = 0x20000000;
    }
    unsigned int v10 = v10 & 0xDFFAFFFF | v6 & 0xFFFEFFFF | (((a2 >> 5) & 1) << 16);
    if (*(unsigned char *)(a1 + 1814)) {
      uint64_t v7 = 33292;
    }
    else {
      uint64_t v7 = 16908;
    }
    (*(void (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v7, 0);
    if (*(_DWORD *)(a1 + 696) != 8) {
      return sub_10000A904(a1);
    }
    if (*(unsigned char *)(a1 + 1814)) {
      uint64_t v8 = 36948;
    }
    else {
      uint64_t v8 = 20564;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v8, 0, &v10);
    if (!result)
    {
      unsigned int v10 = v10 & 0x81FFFFFF | 0x48000000;
      if (*(unsigned char *)(a1 + 1814)) {
        uint64_t v9 = 36948;
      }
      else {
        uint64_t v9 = 20564;
      }
      (*(void (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v9, 0);
      return sub_10000A904(a1);
    }
  }
  return result;
}

uint64_t sub_100009FC8(uint64_t a1, BOOL *a2)
{
  __int16 v5 = 0;
  *a2 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 1, 7, &v5);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 1, 7, &v5);
    if (!result) {
      *a2 = (v5 & 4) != 0;
    }
  }
  return result;
}

uint64_t sub_10000A044(uint64_t a1, _DWORD *a2)
{
  if (*(_DWORD *)(a1 + 696) != 7) {
    return 4294967288;
  }
  unsigned int v16 = 0;
  if (*(unsigned char *)(a1 + 1814)) {
    uint64_t v4 = 33292;
  }
  else {
    uint64_t v4 = 16908;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v4, 0, &v16);
  if (result) {
    return result;
  }
  if (*a2 != 128)
  {
    if (*a2 == 32)
    {
      int v6 = 512;
      goto LABEL_12;
    }
    return 4294967288;
  }
  int v6 = 1024;
LABEL_12:
  unsigned int v16 = v16 & 0xDFFFF8FF | v6;
  if (*(unsigned char *)(a1 + 1814)) {
    uint64_t v7 = 33292;
  }
  else {
    uint64_t v7 = 16908;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v7, 0);
  if (!result)
  {
    if (*(_DWORD *)(a1 + 696) != 7) {
      return sub_10000A904(a1);
    }
    int v17 = 0;
    uint64_t v8 = *(unsigned char *)(a1 + 1814) ? 35584 : 19200;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, int *))(a1 + 648))(a1, v8, 0, &v17);
    if (!result)
    {
      v17 |= 0x10u;
      uint64_t v9 = *(unsigned char *)(a1 + 1814) ? 35584 : 19200;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v9, 0);
      if (!result)
      {
        uint64_t v10 = *(unsigned char *)(a1 + 1814) ? 34356 : 17972;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, int *))(a1 + 648))(a1, v10, 0, &v17);
        if (!result)
        {
          v17 &= 0xFFFE7FBF;
          uint64_t v11 = *(unsigned char *)(a1 + 1814) ? 34356 : 17972;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v11, 0);
          if (!result)
          {
            uint64_t v12 = *(unsigned char *)(a1 + 1814) ? 34360 : 17976;
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, int *))(a1 + 648))(a1, v12, 0, &v17);
            if (!result)
            {
              v17 &= 0xFFFE7FBF;
              uint64_t v13 = *(unsigned char *)(a1 + 1814) ? 34360 : 17976;
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v13, 0);
              if (!result)
              {
                uint64_t v14 = *(unsigned char *)(a1 + 1814) ? 38176 : 21792;
                uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, int *))(a1 + 648))(a1, v14, 0, &v17);
                if (!result)
                {
                  v17 |= 0x8000000E;
                  uint64_t v15 = *(unsigned char *)(a1 + 1814) ? 38176 : 21792;
                  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v15, 0);
                  if (!result) {
                    return sub_10000A904(a1);
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

uint64_t ixgbe_setup_phy_loopback_x550em(uint64_t a1)
{
  unsigned int v11 = 0;
  if (*(unsigned char *)(a1 + 1814)) {
    uint64_t v2 = 33292;
  }
  else {
    uint64_t v2 = 16908;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v2, 0, &v11);
  if (!result)
  {
    unsigned int v11 = v11 & 0xDFFFF8FF | 0x400;
    uint64_t v4 = *(unsigned char *)(a1 + 1814) ? 33292 : 16908;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v4, 0);
    if (!result)
    {
      uint64_t v5 = *(unsigned char *)(a1 + 1814) ? 32784 : 16400;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v5, 0, &v11);
      if (!result)
      {
        v11 |= 0xA00u;
        uint64_t v6 = *(unsigned char *)(a1 + 1814) ? 32784 : 16400;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v6, 0);
        if (!result)
        {
          uint64_t v7 = *(unsigned char *)(a1 + 1814) ? 36352 : 19968;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v7, 0, &v11);
          if (!result)
          {
            v11 |= 0x30000u;
            uint64_t v8 = *(unsigned char *)(a1 + 1814) ? 36352 : 19968;
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v8, 0);
            if (!result)
            {
              uint64_t v9 = *(unsigned char *)(a1 + 1814) ? 35584 : 19200;
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned int *))(a1 + 648))(a1, v9, 0, &v11);
              if (!result)
              {
                v11 |= 4u;
                if (*(unsigned char *)(a1 + 1814)) {
                  uint64_t v10 = 35584;
                }
                else {
                  uint64_t v10 = 19200;
                }
                return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v10, 0);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ixgbe_write_ee_hostif_data_X550(uint64_t a1, int a2, __int16 a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_ee_hostif_data_X550", 3206, "ixgbe_write_ee_hostif_data_X550");
  }
  v7[0] = -16121805;
  __int16 v8 = 512;
  __int16 v9 = a3;
  v7[1] = bswap32(2 * a2);
  return ixgbe_host_interface_command(a1, (uint64_t)v7, 0x10u, 500, 0);
}

uint64_t ixgbe_calc_checksum_X550(uint64_t a1, unsigned char *a2, unsigned int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_checksum_X550", 3380, "ixgbe_calc_eeprom_checksum_X550");
  }
  (*(void (**)(uint64_t))(a1 + 1720))(a1);
  if (a2)
  {
    uint64_t v6 = a2;
    if (a3 < 0x41) {
      return 4294967291;
    }
  }
  else
  {
    uint64_t v6 = v22;
    uint64_t ee_hostif_buffer_X550 = ixgbe_read_ee_hostif_buffer_X550(a1, 0, 66, (uint64_t)v22);
    if (ee_hostif_buffer_X550)
    {
      uint64_t v7 = ee_hostif_buffer_X550;
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_checksum_X550", 3390, "Failed to read EEPROM image\n");
      }
      return v7;
    }
  }
  unsigned int v21 = a3;
  uint64_t v9 = 0;
  __int16 v10 = 0;
  do
  {
    if (v9 != 126) {
      v10 += *(_WORD *)&v6[v9];
    }
    v9 += 2;
  }
  while (v9 != 132);
  uint64_t v11 = 2;
  while (1)
  {
    if ((v11 & 0xFFFE) == 4) {
      goto LABEL_40;
    }
    uint64_t v12 = *(unsigned __int16 *)&v6[2 * v11];
    if ((unsigned __int16)(v12 + 1) < 2u || v12 >= *(unsigned __int16 *)(a1 + 1792)) {
      goto LABEL_40;
    }
    LOWORD(v13) = (unsigned __int16)(v11 - 6) <= 2u ? 0x800080024uLL >> (16 * (v11 - 6)) : 0;
    if (!a2) {
      break;
    }
    if (v12 > v21) {
      return 4294967291;
    }
    uint64_t v14 = (unsigned __int16 *)&a2[2 * v12];
LABEL_24:
    if ((unsigned __int16)(v11 - 6) < 3u)
    {
      int v16 = 0;
      if (a2) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    int v13 = *v14;
    if ((unsigned __int16)(v13 + 1) >= 2u && v13 + (int)v12 < *(unsigned __int16 *)(a1 + 1792))
    {
      int v16 = 1;
      if (!a2) {
        goto LABEL_31;
      }
LABEL_30:
      if (v16 + (unsigned __int16)v13 <= v21)
      {
LABEL_31:
        LOWORD(v17) = 256;
        while (1)
        {
          if (!a2 && (unsigned __int16)v16 == (unsigned __int16)v17)
          {
            LOWORD(v12) = v12 + v16;
            if ((unsigned __int16)v13 >= (unsigned __int16)v16) {
              int v17 = (unsigned __int16)v16;
            }
            else {
              int v17 = (unsigned __int16)v13;
            }
            uint64_t v18 = ixgbe_read_ee_hostif_buffer_X550(a1, (unsigned __int16)v12, v17, (uint64_t)v23);
            if (v18)
            {
              uint64_t v7 = v18;
              if ((dword_10003C040 & 0x100000) != 0)
              {
                int v19 = 3355;
                goto LABEL_44;
              }
              return v7;
            }
            LOWORD(v16) = 0;
          }
          v10 += v14[(unsigned __int16)v16];
          LOWORD(v16) = v16 + 1;
          LOWORD(v13) = v13 - 1;
          if (!(_WORD)v13) {
            goto LABEL_40;
          }
        }
      }
      return 4294967291;
    }
LABEL_40:
    if (++v11 == 15) {
      return (unsigned __int16)(-17734 - v10);
    }
  }
  uint64_t v14 = (unsigned __int16 *)v23;
  uint64_t v15 = ixgbe_read_ee_hostif_buffer_X550(a1, *(unsigned __int16 *)&v6[2 * v11], 256, (uint64_t)v23);
  if (!v15) {
    goto LABEL_24;
  }
  uint64_t v7 = v15;
  if ((dword_10003C040 & 0x100000) != 0)
  {
    int v19 = 3318;
LABEL_44:
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_checksum_ptr_x550", v19, "Failed to read EEPROM image\n");
  }
  return v7;
}

uint64_t ixgbe_update_flash_X550(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_flash_X550", 3563, "ixgbe_update_flash_X550");
  }
  int v3 = -16777162;
  return ixgbe_host_interface_command(a1, (uint64_t)&v3, 4u, 500, 0);
}

uint64_t ixgbe_get_lcd_t_x550em(uint64_t a1, int *a2)
{
  __int16 v9 = 0;
  __int16 v4 = *(_WORD *)(a1 + 1798);
  *a2 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 59424, 7, &v9);
  if (result) {
    return result;
  }
  if (v9 < 0)
  {
    int v8 = 32;
    goto LABEL_13;
  }
  if (((v4 & 0x100) == 0 || *(unsigned char *)(a1 + 1814) == 0) && (v4 & 0x40) == 0)
  {
    int v8 = 128;
LABEL_13:
    *a2 = v8;
  }
  return result;
}

uint64_t sub_10000A904(uint64_t a1)
{
  int v12 = 0;
  if (*(unsigned char *)(a1 + 1814)) {
    uint64_t v2 = 33292;
  }
  else {
    uint64_t v2 = 16908;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, void, int *))(a1 + 648))(a1, v2, 0, &v12);
  if (v3)
  {
    uint64_t v4 = v3;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_restart_an_internal_phy_x550em", 1609, "Auto-negotiation did not complete\n");
    }
    return v4;
  }
  v12 |= 0x80000000;
  if (*(unsigned char *)(a1 + 1814)) {
    uint64_t v5 = 33292;
  }
  else {
    uint64_t v5 = 16908;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v5, 0);
  if (*(_DWORD *)(a1 + 696) != 8) {
    return v6;
  }
  int v11 = 0;
  if (*(unsigned char *)(a1 + 1814)) {
    uint64_t v7 = 36948;
  }
  else {
    uint64_t v7 = 20564;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, void, int *))(a1 + 648))(a1, v7, 0, &v11);
  if (!v8)
  {
    v11 |= 0x80000000;
    if (*(unsigned char *)(a1 + 1814)) {
      uint64_t v9 = 36948;
    }
    else {
      uint64_t v9 = 20564;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 656))(a1, v9, 0);
  }
  uint64_t v4 = v8;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_restart_an_internal_phy_x550em", 1627, "Auto-negotiation did not complete\n");
  }
  return v4;
}

void sub_10000AA74(uint64_t a1, int a2)
{
  if (*(unsigned char *)(a1 + 1814))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
    __dmb(1u);
    uint32_t v4 = readData;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v4 & 0xFFFFFFFD | (2 * (a2 != 0)));
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v5);
    __dmb(1u);
  }
}

uint64_t sub_10000AB04(uint64_t a1, unsigned char *a2)
{
  unsigned __int16 v5 = 0;
  *a2 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 64512, 30, &v5);
  if (!result)
  {
    if ((v5 & 1) == 0) {
      return 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 64513, 30, &v5);
    if (!result)
    {
      if ((v5 & 0x1004) == 0) {
        return 0;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 52224, 30, &v5);
      if (!result)
      {
        if ((v5 & 0x4000) != 0) {
          goto LABEL_17;
        }
        if ((v5 & 0x10) != 0)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 51280, 30, &v5);
          if (result) {
            return result;
          }
          if (v5 == 32775)
          {
LABEL_17:
            ixgbe_set_copper_phy_power(a1, 0);
            return 4294967270;
          }
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 64512, 7, &v5);
        if (!result)
        {
          if ((v5 & 0x200) == 0) {
            return 0;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 52225, 7, &v5);
          if (!result)
          {
            if ((v5 & 1) == 0) {
              return 0;
            }
            uint64_t result = 0;
            *a2 = 1;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000AC64(uint64_t a1)
{
  uint64_t i2c_byte_unlocked = ixgbe_read_i2c_byte_unlocked(a1);
  uint64_t v2 = i2c_byte_unlocked;
  if (i2c_byte_unlocked && (dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): port expander access failed with %d\n\n", "ixgbe_read_pe", 112, i2c_byte_unlocked);
  }
  return v2;
}

uint64_t sub_10000ACD0(uint64_t a1)
{
  uint64_t v1 = ixgbe_write_i2c_byte_unlocked(a1);
  uint64_t v2 = v1;
  if (v1 && (dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): port expander access failed with %d\n\n", "ixgbe_write_pe", 131, v1);
  }
  return v2;
}

uint64_t ixgbe_dcb_get_rtrup2tc(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 576);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_init_shared_code(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_shared_code", 55, "ixgbe_init_shared_code");
  }
  ixgbe_set_mac_type(a1);
  uint64_t result = 4294967285;
  switch(*(_DWORD *)(a1 + 696))
  {
    case 1:
      uint64_t result = ixgbe_init_ops_82598(a1);
      break;
    case 2:
      uint64_t result = ixgbe_init_ops_82599(a1);
      break;
    case 4:
      uint64_t result = ixgbe_init_ops_X540(a1);
      break;
    case 6:
      uint64_t result = ixgbe_init_ops_X550(a1);
      break;
    case 7:
      uint64_t result = ixgbe_init_ops_X550EM_x(a1);
      break;
    case 8:
      uint64_t result = ixgbe_init_ops_X550EM_a(a1);
      break;
    default:
      break;
  }
  *(_DWORD *)(a1 + 1304) = 90;
  return result;
}

uint64_t ixgbe_set_mac_type(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_mac_type", 101, "ixgbe_set_mac_type\n");
  }
  if (*(unsigned __int16 *)(a1 + 1938) == 32902)
  {
    *(void *)(a1 + 1928) = &unk_1000321E0;
    unsigned int v2 = *(unsigned __int16 *)(a1 + 1936);
    if (v2 > 0x1549)
    {
      uint64_t v3 = v2 - 5546;
      if (v3 <= 0x3B)
      {
        if (((1 << (v2 + 86)) & 0xC00001577000000) != 0)
        {
          uint64_t v4 = 0;
          *(_DWORD *)(a1 + 696) = 8;
          unsigned __int16 v5 = &unk_100032360;
LABEL_32:
          *(void *)(a1 + 1928) = v5;
LABEL_33:
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): ixgbe_set_mac_type found mac: %d, returns: %d\n\n", "ixgbe_set_mac_type", 187, *(_DWORD *)(a1 + 696), v4);
          }
          return v4;
        }
        if (((1 << (v2 + 86)) & 0x5F) != 0)
        {
          uint64_t v4 = 0;
          *(_DWORD *)(a1 + 696) = 7;
          unsigned __int16 v5 = &unk_100032300;
          goto LABEL_32;
        }
        if (v3 == 39) {
          goto LABEL_31;
        }
      }
      char v9 = v2 - 74;
      if (v2 - 5450 <= 0x19)
      {
        if (((1 << v9) & 0x86009) != 0) {
          goto LABEL_26;
        }
        if (((1 << v9) & 0x440000) != 0)
        {
LABEL_29:
          uint64_t v4 = 0;
          *(_DWORD *)(a1 + 696) = 4;
          unsigned __int16 v5 = &unk_100032240;
          goto LABEL_32;
        }
        if (v2 == 5475)
        {
LABEL_31:
          uint64_t v4 = 0;
          *(_DWORD *)(a1 + 696) = 6;
          unsigned __int16 v5 = &unk_1000322A0;
          goto LABEL_32;
        }
      }
LABEL_36:
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Unsupported device id: %x\n", "ixgbe_set_mac_type", 182, *(unsigned __int16 *)(a1 + 1936));
      }
      uint64_t v4 = 4294967285;
      goto LABEL_33;
    }
    char v6 = v2 + 58;
    if (v2 - 4294 > 0x36) {
      goto LABEL_17;
    }
    if (((1 << v6) & 0x484008A00007) != 0) {
      goto LABEL_13;
    }
    if (((1 << v6) & 0x6E000000000000) == 0)
    {
LABEL_17:
      uint64_t v8 = v2 - 5383;
      if (v8 > 0x23)
      {
LABEL_21:
        if (v2 != 4278) {
          goto LABEL_36;
        }
LABEL_13:
        uint64_t v4 = 0;
        int v7 = 1;
LABEL_27:
        *(_DWORD *)(a1 + 696) = v7;
        goto LABEL_33;
      }
      if (((1 << (v2 - 7)) & 0xC00212001) == 0)
      {
        if (((1 << (v2 - 7)) & 0x12) != 0) {
          goto LABEL_13;
        }
        if (v8 == 33) {
          goto LABEL_29;
        }
        goto LABEL_21;
      }
    }
LABEL_26:
    uint64_t v4 = 0;
    int v7 = 2;
    goto LABEL_27;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): Unsupported vendor id: %x\n", "ixgbe_set_mac_type", 105, *(unsigned __int16 *)(a1 + 1938));
  }
  return 4294967285;
}

uint64_t ixgbe_init_hw(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 16);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_reset_hw(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 24);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_start_hw(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 32);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_enable_relaxed_ordering(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 48);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_clear_hw_cntrs(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 40);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_media_type(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 56);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t ixgbe_get_mac_addr(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 72);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_san_mac_addr(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 80);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_set_san_mac_addr(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 88);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_device_caps(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 96);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_wwn_prefix(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 104);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_fcoe_boot_status(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 112);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_bus_info(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 128);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_num_of_tx_queues(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1260);
}

uint64_t ixgbe_get_num_of_rx_queues(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1264);
}

uint64_t ixgbe_stop_adapter(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 120);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_identify_phy(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1616)) {
    return 0;
  }
  unsigned int v2 = *(uint64_t (**)(void))(a1 + 1416);
  if (v2) {
    return v2();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_reset_phy(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 1616))
  {
    uint64_t v4 = *(unsigned int (**)(uint64_t))(a1 + 1416);
    if (!v4 || v4(a1)) {
      return 4294967293;
    }
  }
  unsigned int v2 = *(uint64_t (**)(uint64_t))(a1 + 1440);
  if (!v2) {
    return 0x7FFFFFFFLL;
  }
  return v2(a1);
}

uint64_t ixgbe_get_phy_firmware_version(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1512);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_read_phy_reg(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(_DWORD *)(a1 + 1624) && !*(_DWORD *)(a1 + 1616))
  {
    uint64_t v8 = *(void (**)(uint64_t))(a1 + 1416);
    if (v8) {
      v8(a1);
    }
  }
  char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1448);
  if (!v9) {
    return 0x7FFFFFFFLL;
  }
  return v9(a1, a2, a3, a4);
}

uint64_t ixgbe_write_phy_reg(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(_DWORD *)(a1 + 1624) && !*(_DWORD *)(a1 + 1616))
  {
    uint64_t v8 = *(void (**)(uint64_t))(a1 + 1416);
    if (v8) {
      v8(a1);
    }
  }
  char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1456);
  if (!v9) {
    return 0x7FFFFFFFLL;
  }
  return v9(a1, a2, a3, a4);
}

uint64_t ixgbe_setup_phy_link(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1480);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_setup_internal_phy(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1488);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t ixgbe_check_phy_link(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1504);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_setup_phy_link_speed(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1496);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_set_phy_power(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1576);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_check_link(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 280);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_disable_tx_laser(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 240);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_enable_tx_laser(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 248);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_flap_tx_laser(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 256);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_setup_link(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 264);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_setup_mac_link(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 272);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_link_capabilities(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 288);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_led_on(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 312);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_led_off(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 320);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_blink_led_start(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 328);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_blink_led_stop(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 336);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_init_eeprom_params(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1720);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_write_eeprom(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1744);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_write_eeprom_buffer(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1752);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_read_eeprom(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1728);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_read_eeprom_buffer(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1736);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_validate_eeprom_checksum(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1760);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_update_eeprom_checksum(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1768);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_insert_mac_addr(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 376);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_set_rar(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 352);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_clear_rar(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 368);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_set_vmdq(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 384);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_set_vmdq_san_mac(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 392);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_clear_vmdq(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 400);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_init_rx_addrs(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 408);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_num_rx_addrs(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1248);
}

uint64_t ixgbe_update_uc_addr_list(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 416);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_update_mc_addr_list(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 424);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_enable_mc(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 440);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_disable_mc(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 448);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_clear_vfta(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 456);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_set_vfta(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 464);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_set_vlvf(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 472);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_fc_enable(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 512);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_setup_fc(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 520);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_set_fw_drv_ver(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 536);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_dmac_config(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 632);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_dmac_update_tcs(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 616);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_dmac_config_tcs(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 624);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_setup_eee(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 640);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_set_source_address_pruning(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 600);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_set_ethertype_anti_spoofing(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 608);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_read_iosf_sb_reg(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 648);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_write_iosf_sb_reg(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 656);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_disable_mdd(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 664);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_enable_mdd(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 672);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_mdd_event(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 680);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_restore_mdd_vf(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 688);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_enter_lplu(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1584);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_handle_lasi(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1592);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_bypass_rw(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 544);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_bypass_valid_rd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 552);
  if (v3) {
    return v3(a2, a3);
  }
  else {
    return 1;
  }
}

uint64_t ixgbe_bypass_set(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 560);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_bypass_rd_eep(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 568);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_read_analog_reg8(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 152);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_write_analog_reg8(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 160);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_init_uta_tables(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 488);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_read_i2c_byte(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1520);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_read_i2c_byte_unlocked(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1600);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_read_link(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1680);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_read_link_unlocked(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1688);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_write_i2c_byte(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1528);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_write_i2c_byte_unlocked(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1608);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_write_link(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1696);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_write_link_unlocked(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1704);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_write_i2c_eeprom(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1552);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_read_i2c_eeprom(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 1544);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_get_supported_physical_layer(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 64);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t ixgbe_enable_rx_dma(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 176);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_disable_sec_rx_path(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 184);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_enable_sec_rx_path(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 192);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_acquire_swfw_semaphore(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 200);
  if (v1) {
    return v1();
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_release_swfw_semaphore(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 208);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_init_swfw_semaphore(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 216);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_disable_rx(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 584);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_enable_rx(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 592);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_set_rate_select_speed(uint64_t result)
{
  uint64_t v1 = *(uint64_t (**)(void))(result + 296);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t ixgbe_read_i2c_combined_generic_int(uint64_t a1, unsigned int a2, unsigned int a3, _WORD *a4, int a5)
{
  uint64_t v8 = *(unsigned int *)(a1 + 1644);
  __int16 v17 = 0;
  unsigned __int8 v16 = 0;
  unsigned int v15 = (a3 >> 7) | 1;
  unsigned int v12 = a2 | 1;
  int v9 = 2;
  unsigned int v14 = a3;
  unsigned int v13 = ~(v15 + a3 + ((unsigned __int16)(v15 + a3) >> 8));
  if (a5)
  {
LABEL_2:
    if (!(*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, v8)) {
      goto LABEL_3;
    }
    return 4294967280;
  }
  else
  {
LABEL_3:
    while (1)
    {
      sub_10000BE44(a1);
      if (!sub_10000F5E0(a1, a2)
        && !sub_10000F6D8(a1)
        && !sub_10000F5E0(a1, v15)
        && !sub_10000F6D8(a1)
        && !sub_10000F5E0(a1, v14)
        && !sub_10000F6D8(a1)
        && !sub_10000F5E0(a1, v13)
        && !sub_10000F6D8(a1))
      {
        sub_10000BE44(a1);
        if (!sub_10000F5E0(a1, v12) && !sub_10000F6D8(a1))
        {
          sub_10000BF68(a1, &v17);
          if (!sub_10000C110(a1, 0))
          {
            sub_10000BF68(a1, &v16);
            if (!sub_10000C110(a1, 0))
            {
              sub_10000BF68(a1, (unsigned char *)&v17 + 1);
              if (!sub_10000C110(a1, 0)) {
                break;
              }
            }
          }
        }
      }
      ixgbe_i2c_bus_clear(a1);
      if (a5) {
        (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
      }
      if (!v9)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_combined_generic_int", 141, "I2C byte read combined error.\n");
        }
        return 4294967278;
      }
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_combined_generic_int", 139, "I2C byte read combined error - Retrying.\n");
      }
      --v9;
      if (a5) {
        goto LABEL_2;
      }
    }
    sub_10000C210(a1);
    if (a5) {
      (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
    }
    uint64_t result = 0;
    *a4 = v16 | (v17 << 8);
  }
  return result;
}

void sub_10000BE44(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_i2c_start", 2196, "ixgbe_i2c_start");
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 1928) + 84) | v2;
  sub_10000F18C(a1, (uint32_t *)&v4, 1);
  sub_10000F32C(a1, (uint32_t *)&v4);
  IODelay(5uLL);
  sub_10000F18C(a1, (uint32_t *)&v4, 0);
  IODelay(4uLL);
  sub_10000F45C(a1, (uint32_t *)&v4);
  IODelay(5uLL);
}

uint64_t sub_10000BF20(uint64_t a1, unsigned int a2)
{
  uint64_t result = sub_10000F5E0(a1, a2);
  if (!result)
  {
    return sub_10000F6D8(a1);
  }
  return result;
}

void sub_10000BF68(uint64_t a1, unsigned char *a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_clock_in_i2c_byte", 2268, "ixgbe_clock_in_i2c_byte");
  }
  *a2 = 0;
  for (int i = 7; i != -1; --i)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &readData);
    __dmb(1u);
    uint32_t v5 = readData;
    int v6 = *(_DWORD *)(*(void *)(a1 + 1928) + 80);
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_clock_in_i2c_bit", 2377, "ixgbe_clock_in_i2c_bit");
    }
    if (v6)
    {
      uint32_t v7 = v5 | *(_DWORD *)(*(void *)(a1 + 1928) + 76) | v6;
      uint32_t readData = v7;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), v7);
      uint32_t v9 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v9);
      __dmb(1u);
    }
    sub_10000F32C(a1, &readData);
    IODelay(4uLL);
    uint32_t v9 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &v9);
    __dmb(1u);
    uint32_t readData = v9;
    char v8 = sub_10000F868(a1, &readData);
    sub_10000F45C(a1, &readData);
    IODelay(5uLL);
    *a2 |= v8 << i;
  }
}

uint64_t sub_10000C110(uint64_t a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_clock_out_i2c_bit", 2413, "ixgbe_clock_out_i2c_bit");
  }
  if (sub_10000F18C(a1, &v6, a2))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): I2C data was not set to %X\n\n", "ixgbe_clock_out_i2c_bit", 2431, a2);
    }
    return 4294967278;
  }
  else
  {
    sub_10000F32C(a1, &v6);
    IODelay(4uLL);
    sub_10000F45C(a1, &v6);
    IODelay(5uLL);
    return 0;
  }
}

void sub_10000C210(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &readData);
  __dmb(1u);
  uint32_t v11 = readData;
  uint32_t v2 = *(_DWORD **)(a1 + 1928);
  int v4 = v2[21];
  int v3 = v2[22];
  int v5 = v2[20];
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_i2c_stop", 2234, "ixgbe_i2c_stop");
  }
  sub_10000F18C(a1, &v11, 0);
  sub_10000F32C(a1, &v11);
  IODelay(4uLL);
  sub_10000F18C(a1, &v11, 1);
  IODelay(5uLL);
  if (v4) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6 || v3 != 0)
  {
    uint32_t v8 = v5 | v3 | v11 & ~v4;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), v8);
    uint32_t v9 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v9);
    __dmb(1u);
  }
}

void ixgbe_i2c_bus_clear(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_i2c_bus_clear", 2586, "ixgbe_i2c_bus_clear");
  }
  sub_10000BE44(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  sub_10000F18C(a1, &v4, 1);
  int v2 = 9;
  do
  {
    sub_10000F32C(a1, &v4);
    IODelay(4uLL);
    sub_10000F45C(a1, &v4);
    IODelay(5uLL);
    --v2;
  }
  while (v2);
  sub_10000BE44(a1);
  sub_10000C210(a1);
}

uint64_t ixgbe_write_i2c_combined_generic_int(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v10 = *(unsigned int *)(a1 + 1644);
  if (a5 && (*(unsigned int (**)(uint64_t, void))(a1 + 200))(a1, *(unsigned int *)(a1 + 1644))) {
    return 4294967280;
  }
  sub_10000BE44(a1);
  if (sub_10000F5E0(a1, a2)
    || sub_10000F6D8(a1)
    || sub_10000F5E0(a1, (a3 >> 7) & 0xFE)
    || sub_10000F6D8(a1)
    || sub_10000F5E0(a1, a3)
    || sub_10000F6D8(a1)
    || sub_10000F5E0(a1, a4 >> 8)
    || sub_10000F6D8(a1)
    || sub_10000BF20(a1, a4)
    || (__int16 v12 = (a4 >> 8)
            + (((a3 >> 7) & 0xFE)
                              + a3
                              + ((unsigned __int16)(((a3 >> 7) & 0xFE) + a3) >> 8)),
        sub_10000BF20(a1, ~(v12+ HIBYTE(v12)+ a4+ (((v12 + HIBYTE(v12)) + a4) >> 8)))))
  {
    ixgbe_i2c_bus_clear(a1);
    if (a5) {
      (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v10);
    }
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_i2c_combined_generic_int", 206, "I2C byte write combined error.\n");
    }
    return 4294967278;
  }
  else
  {
    sub_10000C210(a1);
    if (a5) {
      (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v10);
    }
    return 0;
  }
}

uint64_t ixgbe_init_phy_ops_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_phy_ops_generic", 222, "ixgbe_init_phy_ops_generic");
  }
  *(void *)(a1 + 1416) = ixgbe_identify_phy_generic;
  *(void *)(a1 + 1440) = ixgbe_reset_phy_generic;
  *(void *)(a1 + 1448) = ixgbe_read_phy_reg_generic;
  *(void *)(a1 + 1456) = ixgbe_write_phy_reg_generic;
  *(void *)(a1 + 1464) = ixgbe_read_phy_reg_mdi;
  *(void *)(a1 + 1472) = ixgbe_write_phy_reg_mdi;
  *(void *)(a1 + 1480) = ixgbe_setup_phy_link_generic;
  *(void *)(a1 + 1496) = ixgbe_setup_phy_link_speed_generic;
  *(void *)(a1 + 1504) = 0;
  *(void *)(a1 + 1512) = ixgbe_get_phy_firmware_version_generic;
  *(void *)(a1 + 1520) = ixgbe_read_i2c_byte_generic;
  *(void *)(a1 + 1528) = ixgbe_write_i2c_byte_generic;
  *(void *)(a1 + 1536) = sub_10000D1EC;
  *(void *)(a1 + 1544) = ixgbe_read_i2c_eeprom_generic;
  *(void *)(a1 + 1552) = ixgbe_write_i2c_eeprom_generic;
  *(void *)(a1 + 1560) = ixgbe_i2c_bus_clear;
  *(void *)(a1 + 1424) = ixgbe_identify_module_generic;
  *(_DWORD *)(a1 + 1628) = 0xFFFF;
  *(void *)(a1 + 1600) = ixgbe_read_i2c_byte_generic_unlocked;
  *(void *)(a1 + 1608) = ixgbe_write_i2c_byte_generic_unlocked;
  *(void *)(a1 + 1568) = ixgbe_tn_check_overtemp;
  return 0;
}

uint64_t ixgbe_identify_phy_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_phy_generic", 297, "ixgbe_identify_phy_generic");
  }
  if (!*(_DWORD *)(a1 + 1644))
  {
    if (*(unsigned char *)(a1 + 1814)) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    *(_DWORD *)(a1 + 1644) = v2;
  }
  if (*(_DWORD *)(a1 + 1616)) {
    return 0;
  }
  int v4 = *(_DWORD *)(a1 + 1676);
  if (!v4)
  {
    for (unsigned __int16 i = 0; ; ++i)
    {
      unsigned int v6 = i;
      if (sub_10000D4BC(a1, i)) {
        break;
      }
      if (v6 > 0x1E)
      {
        *(_DWORD *)(a1 + 1620) = 0;
        return 4294967279;
      }
    }
    return 0;
  }
  if (sub_10000D4BC(a1, v4 >> 3)) {
    return 0;
  }
  else {
    return 4294967279;
  }
}

uint64_t ixgbe_reset_phy_generic(uint64_t a1)
{
  __int16 v6 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_phy_generic", 472, "ixgbe_reset_phy_generic");
  }
  int v2 = *(_DWORD *)(a1 + 1616);
  if (!v2)
  {
    uint64_t result = ixgbe_identify_phy_generic(a1);
    if (result) {
      return result;
    }
    int v2 = *(_DWORD *)(a1 + 1616);
  }
  if (v2 == 1
    || !*(unsigned char *)(a1 + 1674) && (*(unsigned int (**)(uint64_t))(a1 + 1568))(a1) == -26
    || ixgbe_check_reset_blocked(a1))
  {
    return 0;
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(a1 + 1456))(a1, 0, 4, 0x8000);
  int v4 = 30;
  while (1)
  {
    IODelay(0x186A0uLL);
    int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448);
    if (*(_DWORD *)(a1 + 1616) != 7) {
      break;
    }
    uint64_t result = v5(a1, 52226, 1, &v6);
    if (result) {
      return result;
    }
    if ((v6 & 3) != 0) {
      goto LABEL_21;
    }
LABEL_19:
    if (!--v4) {
      goto LABEL_22;
    }
  }
  uint64_t result = v5(a1, 0, 4, &v6);
  if (result) {
    return result;
  }
  if (v6 < 0) {
    goto LABEL_19;
  }
LABEL_21:
  IODelay(2uLL);
LABEL_22:
  if ((v6 & 0x80000000) == 0) {
    return 0;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): PHY reset polling failed to complete.\n\n", "ixgbe_reset_phy_generic", 534);
  }
  return 4294967281;
}

uint64_t ixgbe_read_phy_reg_generic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(unsigned int *)(a1 + 1644);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_phy_reg_generic", 637, "ixgbe_read_phy_reg_generic");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, v8)) {
    return 4294967280;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1464))(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
  return v10;
}

uint64_t ixgbe_write_phy_reg_generic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(unsigned int *)(a1 + 1644);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_phy_reg_generic", 737, "ixgbe_write_phy_reg_generic");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, v8)) {
    return 4294967280;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1472))(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
  return v10;
}

uint64_t ixgbe_read_phy_reg_mdi(uint64_t a1, int a2, int a3, _WORD *a4)
{
  int v6 = a2 | (a3 << 16);
  uint32_t v7 = v6 | (*(_DWORD *)(a1 + 1620) << 21) | 0x40000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x425CuLL, v7);
  int v8 = 100;
  while (1)
  {
    IODelay(0xAuLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x425CuLL, &readData);
    __dmb(1u);
    if ((readData & 0x40000000) == 0) {
      break;
    }
    if (!--v8)
    {
      if ((dword_10003C040 & 0x100000) != 0)
      {
        IOLog("ixgbe:%s(%d): PHY address command did not complete.\n\n", "ixgbe_read_phy_reg_mdi", 577);
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_phy_reg_mdi", 578, "PHY address command did not complete, returning IXGBE_ERR_PHY\n");
        }
      }
      return 4294967293;
    }
  }
  uint32_t v9 = v6 | (*(_DWORD *)(a1 + 1620) << 21) | 0x4C000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x425CuLL, v9);
  int v10 = 100;
  do
  {
    IODelay(0xAuLL);
    uint32_t v13 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x425CuLL, &v13);
    __dmb(1u);
    if ((v13 & 0x40000000) == 0)
    {
      uint32_t v12 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4260uLL, &v12);
      uint64_t result = 0;
      __dmb(1u);
      *a4 = HIWORD(v12);
      return result;
    }
    --v10;
  }
  while (v10);
  if ((dword_10003C040 & 0x100000) != 0)
  {
    IOLog("ixgbe:%s(%d): PHY read command didn't complete\n\n", "ixgbe_read_phy_reg_mdi", 607);
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_phy_reg_mdi", 608, "PHY read command didn't complete, returning IXGBE_ERR_PHY\n");
    }
  }
  return 4294967293;
}

uint64_t ixgbe_write_phy_reg_mdi(uint64_t a1, int a2, int a3, uint32_t a4)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4260uLL, a4);
  int v7 = a2 | (a3 << 16);
  uint32_t v8 = v7 | (*(_DWORD *)(a1 + 1620) << 21) | 0x40000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x425CuLL, v8);
  int v9 = 100;
  while (1)
  {
    IODelay(0xAuLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x425CuLL, &readData);
    __dmb(1u);
    if ((readData & 0x40000000) == 0) {
      break;
    }
    if (!--v9)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): PHY address cmd didn't complete\n\n");
      }
      return 4294967293;
    }
  }
  uint32_t v10 = v7 | (*(_DWORD *)(a1 + 1620) << 21) | 0x44000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x425CuLL, v10);
  int v11 = 100;
  do
  {
    IODelay(0xAuLL);
    uint32_t v13 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x425CuLL, &v13);
    __dmb(1u);
    if ((v13 & 0x40000000) == 0) {
      return 0;
    }
    --v11;
  }
  while (v11);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): PHY write cmd didn't complete\n\n");
  }
  return 4294967293;
}

uint64_t ixgbe_setup_phy_link_generic(uint64_t a1)
{
  __int16 v11 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_phy_link_generic", 763, "ixgbe_setup_phy_link_generic");
  }
  int v9 = 0;
  ixgbe_get_copper_link_capabilities_generic(a1, &v9, &v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 32, 7, &v11);
  __int16 v2 = v11;
  unsigned __int16 v3 = v11 & 0xEFFF;
  v11 &= ~0x1000u;
  if ((*(unsigned char *)(a1 + 1652) & 0x80) != 0 && (v9 & 0x80) != 0)
  {
    unsigned __int16 v3 = v2 | 0x1000;
    __int16 v11 = v2 | 0x1000;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 1456))(a1, 32, 7, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 50176, 7, &v11);
  __int16 v4 = v11;
  int v5 = *(_DWORD *)(a1 + 1652);
  if (*(_DWORD *)(a1 + 696) == 6)
  {
    __int16 v4 = v11 & 0xF3FF | v9 & v5 & 0x800;
    if ((v5 & 0x400) != 0) {
      v4 |= v9 & 0x400;
    }
  }
  unsigned __int16 v6 = v4 & 0x7FFF;
  __int16 v11 = v4 & 0x7FFF;
  if ((v5 & 0x20) != 0 && (v9 & 0x20) != 0)
  {
    unsigned __int16 v6 = v4 | 0x8000;
    __int16 v11 = v4 | 0x8000;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 1456))(a1, 50176, 7, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 16, 7, &v11);
  unsigned __int16 v7 = v11 & 0xFE7F;
  v11 &= 0xFE7Fu;
  if ((*(unsigned char *)(a1 + 1652) & 8) != 0 && (v9 & 8) != 0)
  {
    v7 |= 0x100u;
    __int16 v11 = v7;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 1456))(a1, 16, 7, v7);
  if (!ixgbe_check_reset_blocked(a1))
  {
    (*(void (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1448))(a1, 0, 7, &v11);
    v11 |= 0x200u;
    (*(void (**)(uint64_t, void, uint64_t))(a1 + 1456))(a1, 0, 7);
  }
  return 0;
}

uint64_t ixgbe_setup_phy_link_speed_generic(uint64_t a1, __int16 a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_phy_link_speed_generic", 853, "ixgbe_setup_phy_link_speed_generic");
  }
  *(_DWORD *)(a1 + 1652) = a2 & 0xCAA;
  ixgbe_setup_phy_link(a1);
  return 0;
}

uint64_t ixgbe_get_phy_firmware_version_generic(uint64_t a1, uint64_t a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_phy_firmware_version_generic", 1106, "ixgbe_get_phy_firmware_version_generic");
  }
  __int16 v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1448);
  return v4(a1, 32, 30, a2);
}

uint64_t ixgbe_read_i2c_byte_generic(uint64_t a1, unsigned int a2, unsigned int a3, unsigned char *a4)
{
  return sub_10000EDA0(a1, a2, a3, a4, 1);
}

uint64_t ixgbe_write_i2c_byte_generic(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  return sub_10000F004(a1, a2, a3, a4, 1);
}

uint64_t sub_10000D1EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1520))(a1, a2, 162, a3);
}

uint64_t ixgbe_read_i2c_eeprom_generic(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_eeprom_generic", 1897, "ixgbe_read_i2c_eeprom_generic");
  }
  unsigned __int16 v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1520);
  return v6(a1, a2, 160, a3);
}

uint64_t ixgbe_write_i2c_eeprom_generic(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_i2c_eeprom_generic", 1931, "ixgbe_write_i2c_eeprom_generic");
  }
  unsigned __int16 v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1528);
  return v6(a1, a2, 160, a3);
}

uint64_t ixgbe_identify_module_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_module_generic", 1241, "ixgbe_identify_module_generic");
  }
  int v2 = (*(uint64_t (**)(uint64_t))(a1 + 56))(a1);
  if (v2 == 3)
  {
    return ixgbe_identify_qsfp_module_generic(a1);
  }
  else if (v2 == 1)
  {
    return ixgbe_identify_sfp_module_generic(a1);
  }
  else
  {
    *(_DWORD *)(a1 + 1628) = 65534;
    return 4294967276;
  }
}

uint64_t ixgbe_read_i2c_byte_generic_unlocked(uint64_t a1, unsigned int a2, unsigned int a3, unsigned char *a4)
{
  return sub_10000EDA0(a1, a2, a3, a4, 0);
}

uint64_t ixgbe_write_i2c_byte_generic_unlocked(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  return sub_10000F004(a1, a2, a3, a4, 0);
}

uint64_t ixgbe_tn_check_overtemp(uint64_t a1)
{
  __int16 v3 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_tn_check_overtemp", 2622, "ixgbe_tn_check_overtemp");
  }
  if (*(_WORD *)(a1 + 1936) != 5404) {
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 36869, 1, &v3);
  if ((v3 & 8) == 0) {
    return 0;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): Device over temperature\n", "ixgbe_tn_check_overtemp", 2635);
  }
  return 4294967270;
}

uint64_t sub_10000D4BC(uint64_t a1, int a2)
{
  __int16 v7 = 0;
  if (!ixgbe_validate_phy_addr(a1, a2))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Unable to validate PHY address 0x%04X\n\n", "ixgbe_probe_phy", 263, a2);
    }
    return 0;
  }
  if (ixgbe_get_phy_id(a1)) {
    return 0;
  }
  int phy_type_from_id = ixgbe_get_phy_type_from_id(*(_DWORD *)(a1 + 1624));
  *(_DWORD *)(a1 + 1616) = phy_type_from_id;
  if (!phy_type_from_id)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 11, 1, &v7);
    if ((v7 & 0x24) != 0) {
      int v5 = 9;
    }
    else {
      int v5 = 28;
    }
    *(_DWORD *)(a1 + 1616) = v5;
  }
  return 1;
}

uint64_t ixgbe_check_reset_blocked(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_reset_blocked", 349, "ixgbe_check_reset_blocked");
  }
  if (*(_DWORD *)(a1 + 696) == 1) {
    return 0;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42D0uLL, &readData);
  uint64_t result = 0;
  __dmb(1u);
  if (readData)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): MNG_VETO bit detected.\n\n", "ixgbe_check_reset_blocked", 358);
    }
    return 1;
  }
  return result;
}

BOOL ixgbe_validate_phy_addr(uint64_t a1, int a2)
{
  unsigned __int16 v6 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_phy_addr", 376, "ixgbe_validate_phy_addr");
  }
  *(_DWORD *)(a1 + 1620) = a2;
  (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 2, 1, &v6);
  int v4 = v6;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): PHY ID HIGH is 0x%04X\n\n", "ixgbe_validate_phy_addr", 385, v6);
  }
  return (v4 - 1) < 0xFFFE;
}

uint64_t ixgbe_get_phy_id(uint64_t a1)
{
  int v6 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_phy_id", 401, "ixgbe_get_phy_id");
  }
  uint64_t v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a1 + 1448))(a1, 2, 1, (char *)&v6 + 2);
  if (v2)
  {
    uint64_t v3 = v2;
    int v4 = 0;
  }
  else
  {
    *(_DWORD *)(a1 + 1624) = HIWORD(v6) << 16;
    uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(a1 + 1448))(a1, 3, 1, &v6);
    int v4 = (unsigned __int16)v6;
    *(_DWORD *)(a1 + 1624) |= v6 & 0xFFF0;
    *(_DWORD *)(a1 + 1636) = v4 & 0xF;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): PHY_ID_HIGH 0x%04X, PHY_ID_LOW 0x%04X\n\n", "ixgbe_get_phy_id", 416, HIWORD(v6), v4);
  }
  return v3;
}

uint64_t ixgbe_get_phy_type_from_id(int a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_phy_type_from_id", 430, "ixgbe_get_phy_type_from_id");
  }
  if (a1 > 22282784)
  {
    if (a1 > 22282815)
    {
      if (a1 == 22282816 || a1 == 22282832) {
        return 7;
      }
      if (a1 == 54693968) {
        return 12;
      }
      return 0;
    }
    if (a1 == 22282785) {
      return 3;
    }
    unsigned __int16 v2 = 547;
    goto LABEL_18;
  }
  if (a1 > 21040591)
  {
    if (a1 == 21040592 || a1 == 21040800) {
      return 8;
    }
    unsigned __int16 v2 = 512;
LABEL_18:
    if (a1 == (v2 | 0x1540000)) {
      return 3;
    }
    return 0;
  }
  if (a1 == 4432896) {
    return 10;
  }
  if (a1 == 10589200) {
    return 2;
  }
  return 0;
}

uint64_t ixgbe_get_copper_link_capabilities_generic(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_copper_link_capabilities_generic", 938, "ixgbe_get_copper_link_capabilities_generic");
  }
  *a3 = 1;
  int v6 = *(_DWORD *)(a1 + 1656);
  if (!v6)
  {
    __int16 v11 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 4, 1, &v11);
    if (result) {
      goto LABEL_18;
    }
    char v8 = v11;
    if (v11)
    {
      *(_DWORD *)(a1 + 1656) |= 0x80u;
      if ((v8 & 0x10) == 0)
      {
LABEL_8:
        if ((v8 & 0x20) == 0)
        {
LABEL_10:
          int v9 = *(_DWORD *)(a1 + 696);
          if ((v9 - 7) < 2)
          {
            unsigned int v10 = *(_DWORD *)(a1 + 1656) & 0xFFFFFFF7;
LABEL_17:
            *(_DWORD *)(a1 + 1656) = v10;
            goto LABEL_18;
          }
          if (v9 == 6)
          {
            unsigned int v10 = *(_DWORD *)(a1 + 1656) | 0xC00;
            goto LABEL_17;
          }
LABEL_18:
          int v6 = *(_DWORD *)(a1 + 1656);
          goto LABEL_19;
        }
LABEL_9:
        *(_DWORD *)(a1 + 1656) |= 8u;
        goto LABEL_10;
      }
    }
    else if ((v11 & 0x10) == 0)
    {
      goto LABEL_8;
    }
    *(_DWORD *)(a1 + 1656) |= 0x20u;
    if ((v8 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t result = 0;
LABEL_19:
  *a2 = v6;
  return result;
}

uint64_t ixgbe_check_phy_link_tnx(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  __int16 v9 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_phy_link_tnx", 967, "ixgbe_check_phy_link_tnx");
  }
  *a3 = 0;
  *a2 = 128;
  int v6 = 10;
  while (1)
  {
    IODelay(0xAuLL);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 1, 30, &v9);
    char v8 = v9;
    if ((v9 & 8) != 0) {
      break;
    }
    if (!--v6) {
      return result;
    }
  }
  *a3 = 1;
  if ((v8 & 0x10) != 0) {
    *a2 = 32;
  }
  return result;
}

uint64_t ixgbe_setup_phy_link_tnx(uint64_t a1)
{
  __int16 v12 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_phy_link_tnx", 1012, "ixgbe_setup_phy_link_tnx");
  }
  int v10 = 0;
  ixgbe_get_copper_link_capabilities_generic(a1, &v10, &v11);
  char v2 = v10;
  if ((v10 & 0x80) != 0)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 32, 7, &v12);
    __int16 v3 = v12;
    unsigned __int16 v4 = v12 & 0xEFFF;
    v12 &= ~0x1000u;
    if ((*(unsigned char *)(a1 + 1652) & 0x80) != 0)
    {
      unsigned __int16 v4 = v3 | 0x1000;
      __int16 v12 = v3 | 0x1000;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 1456))(a1, 32, 7, v4);
    if ((v2 & 0x20) == 0)
    {
LABEL_5:
      if ((v2 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 23, 7, &v12);
  __int16 v5 = v12;
  unsigned __int16 v6 = v12 & 0xBFFF;
  v12 &= ~0x4000u;
  if ((*(unsigned char *)(a1 + 1652) & 0x20) != 0)
  {
    unsigned __int16 v6 = v5 | 0x4000;
    __int16 v12 = v5 | 0x4000;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 1456))(a1, 23, 7, v6);
  if ((v2 & 8) != 0)
  {
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 16, 7, &v12);
    __int16 v7 = v12;
    unsigned __int16 v8 = v12 & 0xFEFF;
    v12 &= ~0x100u;
    if ((*(unsigned char *)(a1 + 1652) & 8) != 0)
    {
      unsigned __int16 v8 = v7 | 0x100;
      __int16 v12 = v7 | 0x100;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 1456))(a1, 16, 7, v8);
  }
LABEL_16:
  if (!ixgbe_check_reset_blocked(a1))
  {
    (*(void (**)(uint64_t, void, uint64_t, __int16 *))(a1 + 1448))(a1, 0, 7, &v12);
    v12 |= 0x200u;
    (*(void (**)(uint64_t, void, uint64_t))(a1 + 1456))(a1, 0, 7);
  }
  return 0;
}

uint64_t ixgbe_get_phy_firmware_version_tnx(uint64_t a1, uint64_t a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_phy_firmware_version_tnx", 1087, "ixgbe_get_phy_firmware_version_tnx");
  }
  unsigned __int16 v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1448);
  return v4(a1, 11, 30, a2);
}

uint64_t ixgbe_reset_phy_nl(uint64_t a1)
{
  unsigned __int16 v7 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_phy_nl", 1128, "ixgbe_reset_phy_nl");
  }
  if (ixgbe_check_reset_blocked(a1)) {
    return 0;
  }
  int v9 = 0;
  int v10 = 0;
  unsigned __int16 v8 = 0;
  (*(void (**)(uint64_t, void, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 0, 4, &v7);
  (*(void (**)(uint64_t, void, uint64_t, void))(a1 + 1456))(a1, 0, 4, v7 | 0x8000u);
  int v3 = 100;
  while (1)
  {
    (*(void (**)(uint64_t, void, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 0, 4, &v7);
    if (((__int16)v7 & 0x80000000) == 0) {
      break;
    }
    IODelay(0x2710uLL);
    if (!--v3)
    {
      if ((__int16)v7 < 0)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          goto LABEL_14;
        }
        return 4294967293;
      }
      break;
    }
  }
  uint64_t result = ixgbe_get_sfp_init_sequence_offsets(a1, (unsigned __int16 *)&v9, &v8);
  if (result) {
    return result;
  }
  (*(void (**)(uint64_t, void, char *))(a1 + 1728))(a1, v8++, (char *)&v9 + 2);
  if ((*(unsigned int (**)(uint64_t, void, int *))(a1 + 1728))(a1, v8, &v10))
  {
LABEL_11:
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n");
    }
    return 4294967293;
  }
  while (1)
  {
    int v4 = (unsigned __int16)v10 >> 12;
    unsigned int v5 = v10 & 0xFFF;
    if (v4 == 15) {
      break;
    }
    if (v4 == 1)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_phy_nl", 1181, "DATA:\n");
      }
      if ((*(unsigned int (**)(uint64_t, void, char *))(a1 + 1728))(a1, ++v8, (char *)&v10 + 2)) {
        goto LABEL_11;
      }
      unsigned __int16 v6 = ++v8;
      if (v5)
      {
        while (!(*(unsigned int (**)(uint64_t, void, int *))(a1 + 1728))(a1, v6, &v10))
        {
          (*(void (**)(uint64_t, void, uint64_t, void))(a1 + 1456))(a1, HIWORD(v10), 1, (unsigned __int16)v10);
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): Wrote %4.4x to %4.4x\n\n", "ixgbe_reset_phy_nl", 1196, (unsigned __int16)v10, HIWORD(v10));
          }
          unsigned __int16 v6 = ++v8;
          ++HIWORD(v10);
          if (!--v5) {
            goto LABEL_36;
          }
        }
        goto LABEL_11;
      }
    }
    else
    {
      if (v4)
      {
        if ((dword_10003C040 & 0x100000) == 0) {
          return 4294967293;
        }
        goto LABEL_14;
      }
      ++v8;
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): DELAY: %d MS\n\n", "ixgbe_reset_phy_nl", 1177, v10 & 0xFFF);
      }
      IODelay(1000 * v5);
    }
LABEL_36:
    if ((*(unsigned int (**)(uint64_t, void, int *))(a1 + 1728))(a1, v8, &v10)) {
      goto LABEL_11;
    }
  }
  ++v8;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_phy_nl", 1203, "CONTROL:\n");
  }
  if (!v5)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_phy_nl", 1208, "SOL\n");
    }
    goto LABEL_36;
  }
  if (v5 == 4095)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_phy_nl", 1205, "EOL\n");
    }
    return 0;
  }
  if ((dword_10003C040 & 0x100000) == 0) {
    return 4294967293;
  }
LABEL_14:
  IOLog("ixgbe:%s(%d): %s\n");
  return 4294967293;
}

uint64_t ixgbe_get_sfp_init_sequence_offsets(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  int v6 = *(_DWORD *)(a1 + 1628);
  int v7 = v6;
  if ((dword_10003C040 & 0x100000) != 0)
  {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_sfp_init_sequence_offsets", 1807, "ixgbe_get_sfp_init_sequence_offsets");
    int v7 = *(_DWORD *)(a1 + 1628);
  }
  if (v7 == 0xFFFF) {
    return 4294967277;
  }
  if (v7 == 65534) {
    return 4294967276;
  }
  if (!v7 && *(_WORD *)(a1 + 1936) == 4321) {
    return 4294967277;
  }
  if ((v6 & 0xFFF9) == 8) {
    int v9 = 6;
  }
  else {
    int v9 = (unsigned __int16)v6;
  }
  if ((unsigned __int16)v6 == 11) {
    int v9 = 5;
  }
  if ((unsigned __int16)v6 == 7) {
    int v10 = 5;
  }
  else {
    int v10 = v9;
  }
  if ((v6 & 0xFFFB) == 9) {
    int v11 = 5;
  }
  else {
    int v11 = v10;
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 1728))(a1, 43, a2))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n", "ixgbe_get_sfp_init_sequence_offsets", 1838, 43);
    }
    return 4294967275;
  }
  else
  {
    int v12 = *a2;
    uint64_t result = 4294967275;
    if (*a2 && v12 != 0xFFFF)
    {
      unsigned __int16 v19 = 0;
      unsigned __int16 v13 = v12 + 1;
      *a2 = v13;
      if (!(*(unsigned int (**)(uint64_t, void, unsigned __int16 *))(a1 + 1728))(a1, v13, &v19))
      {
        while (1)
        {
          if (v19 == 0xFFFF) {
            goto LABEL_45;
          }
          unsigned __int16 v14 = *a2;
          if (v11 == v19) {
            break;
          }
          unsigned __int16 v15 = v14 + 2;
          *a2 = v15;
          if ((*(unsigned int (**)(uint64_t, void, unsigned __int16 *))(a1 + 1728))(a1, v15, &v19)) {
            goto LABEL_28;
          }
        }
        unsigned __int16 v16 = v14 + 1;
        *a2 = v16;
        if ((*(unsigned int (**)(uint64_t, void, unsigned __int16 *))(a1 + 1728))(a1, v16, a3)) {
          goto LABEL_28;
        }
        int v17 = *a3;
        if (v17 != 0xFFFF && v17 != 0)
        {
          if ((__int16)v19 != -1) {
            return 0;
          }
LABEL_45:
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_sfp_init_sequence_offsets", 1874, "No matching SFP+ module found\n");
          }
          return 4294967277;
        }
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_sfp_init_sequence_offsets", 1861, "SFP+ module not supported\n");
        }
        return 4294967277;
      }
LABEL_28:
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n", "ixgbe_get_sfp_init_sequence_offsets", 1882, *a2);
      }
      return 4294967293;
    }
  }
  return result;
}

uint64_t ixgbe_identify_sfp_module_generic(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1628);
  __int16 v13 = 0;
  __int16 v12 = 0;
  __int16 v11 = 0;
  char v10 = 0;
  char v9 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_sfp_module_generic", 1280, "ixgbe_identify_sfp_module_generic");
  }
  if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) == 1)
  {
    (*(void (**)(uint64_t))(a1 + 144))(a1);
    if ((*(unsigned int (**)(uint64_t, void, char *))(a1 + 1544))(a1, 0, (char *)&v13 + 1))
    {
LABEL_5:
      *(_DWORD *)(a1 + 1628) = 65534;
      if (*(_DWORD *)(a1 + 1616) != 12)
      {
        *(_DWORD *)(a1 + 1624) = 0;
        *(_DWORD *)(a1 + 1616) = 0;
      }
      return 4294967276;
    }
    if (HIBYTE(v13) != 3) {
      goto LABEL_81;
    }
    if ((*(unsigned int (**)(uint64_t, uint64_t, __int16 *))(a1 + 1544))(a1, 6, &v13)
      || (*(unsigned int (**)(uint64_t, uint64_t, char *))(a1 + 1544))(a1, 3, (char *)&v12 + 1)
      || (*(unsigned int (**)(uint64_t, uint64_t, char *))(a1 + 1544))(a1, 8, &v10))
    {
      goto LABEL_5;
    }
    if (*(_DWORD *)(a1 + 696) == 1)
    {
      if ((v10 & 4) != 0)
      {
        int v4 = 0;
      }
      else if ((v12 & 0x1000) != 0)
      {
        int v4 = 1;
      }
      else if ((v12 & 0x2000) != 0)
      {
        int v4 = 2;
      }
      else
      {
        int v4 = 0xFFFF;
      }
      goto LABEL_38;
    }
    if ((v10 & 4) != 0)
    {
      BOOL v5 = *(unsigned char *)(a1 + 1814) == 0;
      int v4 = 3;
      goto LABEL_36;
    }
    if ((v10 & 8) == 0)
    {
      if ((v12 & 0x3000) != 0)
      {
        BOOL v5 = *(unsigned char *)(a1 + 1814) == 0;
        int v4 = 5;
        goto LABEL_36;
      }
      if ((v13 & 8) != 0)
      {
        BOOL v5 = *(unsigned char *)(a1 + 1814) == 0;
        int v4 = 9;
      }
      else
      {
        if ((v13 & 1) == 0)
        {
          if ((v13 & 2) != 0)
          {
            BOOL v5 = *(unsigned char *)(a1 + 1814) == 0;
            int v4 = 13;
            goto LABEL_36;
          }
LABEL_28:
          int v4 = 0xFFFF;
          goto LABEL_38;
        }
        BOOL v5 = *(unsigned char *)(a1 + 1814) == 0;
        int v4 = 11;
      }
LABEL_36:
      if (!v5) {
        ++v4;
      }
LABEL_38:
      *(_DWORD *)(a1 + 1628) = v4;
      if (v4 != v2) {
        *(unsigned char *)(a1 + 1632) = 1;
      }
      *(unsigned char *)(a1 + 1673) = 0;
      if ((v13 & 1) != 0 && (v12 & 0x1000) != 0 || (v13 & 2) != 0 && (v12 & 0x2000) != 0) {
        *(unsigned char *)(a1 + 1673) = 1;
      }
      if (*(_DWORD *)(a1 + 1616) == 12) {
        goto LABEL_46;
      }
      *(_DWORD *)(a1 + 1624) = HIBYTE(v13);
      if ((*(unsigned int (**)(uint64_t, uint64_t, __int16 *))(a1 + 1544))(a1, 37, &v11)
        || (*(unsigned int (**)(uint64_t, uint64_t, char *))(a1 + 1544))(a1, 38, (char *)&v11 + 1)
        || (*(unsigned int (**)(uint64_t, uint64_t, __int16 *))(a1 + 1544))(a1, 39, &v12))
      {
        goto LABEL_5;
      }
      int v7 = (v11 << 24) | (HIBYTE(v11) << 16) | (v12 << 8);
      if (v7 > 4224511)
      {
        if (v7 == 9463040)
        {
          if ((v10 & 8) != 0) {
            int v8 = 18;
          }
          else {
            int v8 = 17;
          }
          goto LABEL_78;
        }
        if (v7 == 4224512)
        {
          if ((v10 & 4) == 0)
          {
LABEL_46:
            if ((v10 & 0xC) != 0)
            {
              if ((v10 & 4) != 0)
              {
                uint64_t result = 0;
                int v6 = 14;
                goto LABEL_68;
              }
              if ((v10 & 8) != 0)
              {
                uint64_t result = 0;
                int v6 = 15;
LABEL_68:
                *(_DWORD *)(a1 + 1616) = v6;
                return result;
              }
              return 0;
            }
            if (HIBYTE(v12) || (*(_DWORD *)(a1 + 1628) - 9) < 6)
            {
              if (*(_DWORD *)(a1 + 696) == 1) {
                return 0;
              }
              ixgbe_get_device_caps(a1);
              if ((*(_DWORD *)(a1 + 1628) - 9) < 6 || *(_DWORD *)(a1 + 1616) == 20) {
                return 0;
              }
              if (*(unsigned char *)(a1 + 1953))
              {
                if ((dword_10003C040 & 0x100000) != 0) {
                  IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_sfp_module_generic", 1513, "WARNING: Intel (R) Network Connections are quality tested using Intel (R) Ethernet Optics. Using untested modules is not supported and may cause unstable operation or damage to the module or the adapter. Intel Corporation is not responsible for any harm caused by using untested modules.\n");
                }
                return 0;
              }
              if ((dword_10003C040 & 0x100000) != 0) {
                IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_sfp_module_generic", 1516, "SFP+ module not supported\n");
              }
            }
LABEL_81:
            *(_DWORD *)(a1 + 1616) = 25;
            return 4294967277;
          }
          int v8 = 13;
LABEL_78:
          *(_DWORD *)(a1 + 1616) = v8;
          goto LABEL_46;
        }
      }
      else
      {
        if (v7 == 1534464)
        {
          int v8 = 16;
          goto LABEL_78;
        }
        if (v7 == 1777920)
        {
          int v8 = 20;
          goto LABEL_78;
        }
      }
      int v8 = 19;
      goto LABEL_78;
    }
    (*(void (**)(uint64_t, uint64_t, char *))(a1 + 1544))(a1, 60, &v9);
    if ((v9 & 4) != 0)
    {
      BOOL v5 = *(unsigned char *)(a1 + 1814) == 0;
      int v4 = 7;
      goto LABEL_36;
    }
    goto LABEL_28;
  }
  *(_DWORD *)(a1 + 1628) = 65534;
  return 4294967276;
}

uint64_t ixgbe_identify_qsfp_module_generic(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 1628);
  __int16 v13 = 0;
  __int16 v12 = 0;
  __int16 v11 = 0;
  __int16 v10 = 0;
  __int16 v9 = 0;
  unsigned __int8 v8 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_qsfp_module_generic", 1622, "ixgbe_identify_qsfp_module_generic");
  }
  if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) != 3)
  {
    *(_DWORD *)(a1 + 1628) = 65534;
    return 4294967276;
  }
  (*(void (**)(uint64_t))(a1 + 144))(a1);
  if (!(*(unsigned int (**)(uint64_t, void, char *))(a1 + 1544))(a1, 0, (char *)&v13 + 1))
  {
    if (HIBYTE(v13) == 13)
    {
      *(_DWORD *)(a1 + 1624) = 13;
      if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(a1 + 1544))(a1, 131, (char *)&v12 + 1)
        || (*(unsigned int (**)(uint64_t, uint64_t, __int16 *))(a1 + 1544))(a1, 134, &v13))
      {
        goto LABEL_5;
      }
      if ((v12 & 0x800) != 0)
      {
        *(_DWORD *)(a1 + 1616) = 21;
        BOOL v4 = *(unsigned char *)(a1 + 1814) == 0;
        int v5 = 3;
      }
      else if ((v12 & 0x3000) != 0)
      {
        BOOL v4 = *(unsigned char *)(a1 + 1814) == 0;
        int v5 = 5;
      }
      else
      {
        if ((v12 & 0x100) == 0)
        {
          (*(void (**)(uint64_t, uint64_t, char *))(a1 + 1544))(a1, 130, (char *)&v9 + 1);
          (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 1544))(a1, 146, &v9);
          (*(void (**)(uint64_t, uint64_t, unsigned __int8 *))(a1 + 1544))(a1, 147, &v8);
          if (HIBYTE(v9) != 35 || !(_BYTE)v9 || v8 > 0xFu) {
            goto LABEL_45;
          }
        }
        *(_DWORD *)(a1 + 1616) = 22;
        BOOL v4 = *(unsigned char *)(a1 + 1814) == 0;
        int v5 = 7;
      }
      if (!v4) {
        ++v5;
      }
      *(_DWORD *)(a1 + 1628) = v5;
      if (v5 != v2) {
        *(unsigned char *)(a1 + 1632) = 1;
      }
      *(unsigned char *)(a1 + 1673) = 0;
      char v6 = HIBYTE(v12);
      if ((v13 & 1) != 0 && (v12 & 0x1000) != 0 || (v13 & 2) != 0 && (v12 & 0x2000) != 0) {
        *(unsigned char *)(a1 + 1673) = 1;
      }
      if ((v6 & 0x30) == 0) {
        return 0;
      }
      if ((*(unsigned int (**)(uint64_t, uint64_t, __int16 *))(a1 + 1544))(a1, 165, &v11)
        || (*(unsigned int (**)(uint64_t, uint64_t, char *))(a1 + 1544))(a1, 166, (char *)&v11 + 1)
        || (*(unsigned int (**)(uint64_t, uint64_t, __int16 *))(a1 + 1544))(a1, 167, &v12))
      {
        goto LABEL_5;
      }
      int v7 = ((v11 << 24) | (HIBYTE(v11) << 16) | (v12 << 8)) == 0x1B2100 ? 23 : 24;
      *(_DWORD *)(a1 + 1616) = v7;
      ixgbe_get_device_caps(a1);
      if ((v10 & 1) != 0 || *(_DWORD *)(a1 + 1616) == 23) {
        return 0;
      }
      if (*(unsigned char *)(a1 + 1953))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_qsfp_module_generic", 1766, "WARNING: Intel (R) Network Connections are quality tested using Intel (R) Ethernet Optics. Using untested modules is not supported and may cause unstable operation or damage to the module or the adapter. Intel Corporation is not responsible for any harm caused by using untested modules.\n");
        }
        return 0;
      }
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_qsfp_module_generic", 1769, "QSFP module not supported\n");
      }
    }
LABEL_45:
    *(_DWORD *)(a1 + 1616) = 25;
    return 4294967277;
  }
LABEL_5:
  *(void *)(a1 + 1624) = 0xFFFE00000000;
  *(_DWORD *)(a1 + 1616) = 0;
  return 4294967276;
}

uint64_t ixgbe_get_supported_phy_sfp_layer_generic(uint64_t a1)
{
  __int16 v7 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_supported_phy_sfp_layer_generic", 1551, "ixgbe_get_supported_phy_sfp_layer_generic");
  }
  (*(void (**)(uint64_t))(a1 + 1424))(a1);
  if (*(_DWORD *)(a1 + 1628) == 65534)
  {
    return 0;
  }
  else
  {
    switch(*(_DWORD *)(a1 + 1616))
    {
      case 0xD:
      case 0xE:
      case 0x15:
        return 8;
      case 0xF:
      case 0x12:
      case 0x16:
        return 0x2000;
      case 0x10:
      case 0x11:
      case 0x13:
      case 0x14:
        (*(void (**)(uint64_t, uint64_t, __int16 *))(a1 + 1544))(a1, 6, &v7);
        (*(void (**)(uint64_t, uint64_t, char *))(a1 + 1544))(a1, 3, (char *)&v7 + 1);
        if ((v7 & 0x1000) != 0)
        {
          unsigned int v2 = 64;
        }
        else if ((v7 & 0x2000) != 0)
        {
          unsigned int v2 = 16;
        }
        else
        {
          int v4 = 2;
          int v5 = (v7 & 1) << 14;
          BOOL v6 = (v7 & 8) == 0;
LABEL_13:
          if (v6) {
            unsigned int v2 = v5;
          }
          else {
            unsigned int v2 = v4;
          }
        }
        break;
      case 0x17:
      case 0x18:
        (*(void (**)(uint64_t, uint64_t, char *))(a1 + 1544))(a1, 131, (char *)&v7 + 1);
        int v4 = 64;
        int v5 = (HIBYTE(v7) >> 1) & 0x10;
        BOOL v6 = (v7 & 0x1000) == 0;
        goto LABEL_13;
      default:
        return 0;
    }
  }
  return v2;
}

uint64_t sub_10000EDA0(uint64_t a1, unsigned int a2, unsigned int a3, unsigned char *a4, int a5)
{
  uint64_t v9 = *(unsigned int *)(a1 + 1644);
  *a4 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_byte_generic_int", 1974, "ixgbe_read_i2c_byte_generic");
  }
  if (*(int *)(a1 + 696) <= 5) {
    int v10 = 10;
  }
  else {
    int v10 = 3;
  }
  unsigned int v15 = a2;
  if (!a2 && a3 == 160 && *(_DWORD *)(a1 + 1628) == 65534) {
    int v10 = 10;
  }
  int v11 = v10 - 1;
  if (a5)
  {
LABEL_11:
    if (!(*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, v9)) {
      goto LABEL_12;
    }
    return 4294967280;
  }
  else
  {
LABEL_12:
    while (1)
    {
      sub_10000BE44(a1);
      uint64_t v12 = sub_10000F5E0(a1, a3);
      if (!v12)
      {
        uint64_t v12 = sub_10000F6D8(a1);
        if (!v12)
        {
          uint64_t v12 = sub_10000F5E0(a1, v15);
          if (!v12)
          {
            uint64_t v12 = sub_10000F6D8(a1);
            if (!v12)
            {
              sub_10000BE44(a1);
              uint64_t v12 = sub_10000F5E0(a1, a3 | 1);
              if (!v12)
              {
                uint64_t v12 = sub_10000F6D8(a1);
                if (!v12)
                {
                  sub_10000BF68(a1, a4);
                  uint64_t v12 = sub_10000C110(a1, 1);
                  if (!v12) {
                    break;
                  }
                }
              }
            }
          }
        }
      }
      ixgbe_i2c_bus_clear(a1);
      if (a5)
      {
        (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v9);
        IODelay(0x186A0uLL);
      }
      if (!v11)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_byte_generic_int", 2038, "I2C byte read error.\n");
        }
        return v12;
      }
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_byte_generic_int", 2036, "I2C byte read error - Retrying.\n");
      }
      --v11;
      if (a5) {
        goto LABEL_11;
      }
    }
    sub_10000C210(a1);
    if (a5) {
      (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v9);
    }
    return 0;
  }
}

uint64_t sub_10000F004(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v10 = *(unsigned int *)(a1 + 1644);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_i2c_byte_generic_int", 2098, "ixgbe_write_i2c_byte_generic");
  }
  if (a5 && (*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, v10)) {
    return 4294967280;
  }
  sub_10000BE44(a1);
  uint64_t v11 = sub_10000F5E0(a1, a3);
  if (!v11)
  {
    uint64_t v11 = sub_10000F6D8(a1);
    if (!v11)
    {
      uint64_t v11 = sub_10000F5E0(a1, a2);
      if (!v11)
      {
        uint64_t v11 = sub_10000F6D8(a1);
        if (!v11)
        {
          uint64_t v11 = sub_10000F5E0(a1, a4);
          if (!v11)
          {
            uint64_t v11 = sub_10000F6D8(a1);
            if (!v11)
            {
              sub_10000C210(a1);
              if ((a5 & 1) == 0) {
                return v11;
              }
              goto LABEL_15;
            }
          }
        }
      }
    }
  }
  ixgbe_i2c_bus_clear(a1);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_i2c_byte_generic_int", 2142, "I2C byte write error.\n");
  }
  if (a5) {
LABEL_15:
  }
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v10);
  return v11;
}

uint64_t sub_10000F18C(uint64_t a1, uint32_t *a2, int a3)
{
  int v6 = *(_DWORD *)(*(void *)(a1 + 1928) + 80);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_i2c_data", 2509, "ixgbe_set_i2c_data");
  }
  int v7 = *(_DWORD *)(*(void *)(a1 + 1928) + 76);
  if (a3) {
    int v8 = *a2 | v7;
  }
  else {
    int v8 = *a2 & ~v7;
  }
  *a2 = v8 & ~v6;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), *a2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(3uLL);
  uint64_t result = 0;
  if (a3)
  {
    if (v6)
    {
      *a2 |= v6;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), *a2);
      uint32_t v12 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v12);
      __dmb(1u);
    }
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &v11);
    __dmb(1u);
    *a2 = v11;
    BOOL v10 = sub_10000F868(a1, a2);
    uint64_t result = 0;
    if (!v10)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Error - I2C data was not set to %X.\n\n", "ixgbe_set_i2c_data", 2537, 1);
      }
      return 4294967278;
    }
  }
  return result;
}

void sub_10000F32C(uint64_t a1, uint32_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(a1 + 1928) + 88);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_raise_i2c_clk", 2452, "ixgbe_raise_i2c_clk");
  }
  if (v4)
  {
    *a2 |= v4;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), *a2);
  }
  uint64_t v5 = *(void *)(a1 + 1928);
  int v6 = 499;
  do
  {
    *a2 |= *(_DWORD *)(v5 + 68);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), *a2);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(1uLL);
    uint32_t v8 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &v8);
    __dmb(1u);
    uint64_t v5 = *(void *)(a1 + 1928);
  }
  while ((*(_DWORD *)(v5 + 64) & v8) == 0 && v6-- != 0);
}

void sub_10000F45C(uint64_t a1, uint32_t *a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_lower_i2c_clk", 2483, "ixgbe_lower_i2c_clk");
  }
  uint64_t v4 = *(void *)(a1 + 1928);
  int v5 = *a2 & ~*(_DWORD *)(v4 + 68);
  *a2 = v5;
  *a2 = v5 & ~*(_DWORD *)(v4 + 88);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), *a2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(1uLL);
}

uint64_t ixgbe_set_copper_phy_power(uint64_t a1, char a2)
{
  unsigned __int16 v5 = 0;
  if ((a2 & 1) == 0)
  {
    if ((ixgbe_mng_present(a1) & 1) == 0)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 0, 30, &v5);
      if (result) {
        return result;
      }
      if (!ixgbe_check_reset_blocked(a1))
      {
        unsigned __int16 v4 = v5 | 0x800;
        goto LABEL_4;
      }
    }
    return 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 0, 30, &v5);
  if (!result)
  {
    unsigned __int16 v4 = v5 & 0xF7FF;
LABEL_4:
    unsigned __int16 v5 = v4;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void))(a1 + 1456))(a1, 0, 30, v4);
  }
  return result;
}

uint64_t sub_10000F5E0(uint64_t a1, unsigned int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_clock_out_i2c_byte", 2293, "ixgbe_clock_out_i2c_byte");
  }
  int v4 = 7;
  do
  {
    uint64_t v5 = sub_10000C110(a1, (a2 >> v4) & 1);
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    --v4;
  }
  while (!v6);
  uint64_t v7 = v5;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &readData);
  __dmb(1u);
  uint32_t v8 = *(_DWORD *)(*(void *)(a1 + 1928) + 76) | readData | *(_DWORD *)(*(void *)(a1 + 1928) + 80);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), v8);
  uint32_t v10 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v10);
  __dmb(1u);
  return v7;
}

uint64_t sub_10000F6D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 1928);
  int v3 = *(_DWORD *)(v2 + 80);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(v2 + 92), &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_i2c_ack", 2328, "ixgbe_get_i2c_ack");
  }
  if (v3)
  {
    uint32_t v5 = v3 | *(_DWORD *)(*(void *)(a1 + 1928) + 76) | v4;
    uint32_t readData = v5;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), v5);
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v10);
    __dmb(1u);
  }
  sub_10000F32C(a1, &readData);
  IODelay(4uLL);
  int v6 = 10;
  do
  {
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), &v10);
    __dmb(1u);
    uint32_t readData = v10;
    BOOL v7 = sub_10000F868(a1, &readData);
    IODelay(1uLL);
    if (!v7)
    {
      uint64_t v8 = 0;
      goto LABEL_12;
    }
    --v6;
  }
  while (v6);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_i2c_ack", 2353, "I2C ack was not received.\n");
  }
  uint64_t v8 = 4294967278;
LABEL_12:
  sub_10000F45C(a1, &readData);
  IODelay(5uLL);
  return v8;
}

BOOL sub_10000F868(uint64_t a1, uint32_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(a1 + 1928) + 80);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_i2c_data", 2557, "ixgbe_get_i2c_data");
  }
  if (v4)
  {
    *a2 |= v4;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 92), *a2);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(1uLL);
  }
  return (*(_DWORD *)(*(void *)(a1 + 1928) + 72) & *a2) != 0;
}

void sub_10000F938(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 2748))
  {
    uint32_t v92 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x808uLL, &v92);
    __dmb(1u);
    uint32_t v2 = v92;
    uint32_t v3 = v92 & 0xFFFF0000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x800uLL, v3);
    if ((dword_10003C040 & 0x10) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v9 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v9 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v11 = 2;
        }
        else {
          int v11 = 0;
        }
      }
      else
      {
        int v11 = 0;
      }
      int v12 = v9 | v11;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v13 = 4;
        }
        else {
          int v13 = 0;
        }
      }
      else
      {
        int v13 = 0;
      }
      int v14 = v12 | v13;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v15 = 8;
        }
        else {
          int v15 = 0;
        }
      }
      else
      {
        int v15 = 0;
      }
      int v16 = v14 | v15;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v17 = 16;
        }
        else {
          int v17 = 0;
        }
      }
      else
      {
        int v17 = 0;
      }
      int v18 = v16 | v17;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v19 = 32;
        }
        else {
          int v19 = 0;
        }
      }
      else
      {
        int v19 = 0;
      }
      int v20 = v19 | v18;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v21 = 64;
        }
        else {
          int v21 = 0;
        }
      }
      else
      {
        int v21 = 0;
      }
      int v22 = v20 + v21;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v23 = 128;
        }
        else {
          int v23 = 0;
        }
      }
      else
      {
        int v23 = 0;
      }
      uint32_t v92 = 67109890;
      int v93 = v22 + v23;
      __int16 v94 = 2080;
      v95 = "otherIntrHandler";
      __int16 v96 = 1024;
      int v97 = 14;
      __int16 v98 = 1024;
      uint32_t v99 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): - eicr=0x%08x\n", (uint8_t *)&v92, 0x1Eu);
    }
    if ((v2 & 0x100000) != 0)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x888uLL, 0x100000u);
      *(_DWORD *)(a1 + 2772) |= 0x20u;
    }
    int v4 = *(_DWORD *)(a1 + 696);
    if (v4 != 1)
    {
      if ((v2 & 0x10000000) != 0)
      {
        if ((dword_10003C040 & 0x10) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if (qword_10003C000) {
            BOOL v10 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
          }
          else {
            BOOL v10 = 0;
          }
          if (qword_10003C008)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
              int v25 = 2;
            }
            else {
              int v25 = 0;
            }
          }
          else
          {
            int v25 = 0;
          }
          int v26 = v10 | v25;
          if (qword_10003C010)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
              int v27 = 4;
            }
            else {
              int v27 = 0;
            }
          }
          else
          {
            int v27 = 0;
          }
          int v28 = v26 | v27;
          if (qword_10003C018)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
              int v29 = 8;
            }
            else {
              int v29 = 0;
            }
          }
          else
          {
            int v29 = 0;
          }
          int v30 = v28 | v29;
          if (qword_10003C020)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
              int v31 = 16;
            }
            else {
              int v31 = 0;
            }
          }
          else
          {
            int v31 = 0;
          }
          int v32 = v30 | v31;
          if (qword_10003C028)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
              int v33 = 32;
            }
            else {
              int v33 = 0;
            }
          }
          else
          {
            int v33 = 0;
          }
          int v34 = v33 | v32;
          if (qword_10003C030)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
              int v35 = 64;
            }
            else {
              int v35 = 0;
            }
          }
          else
          {
            int v35 = 0;
          }
          int v36 = v34 + v35;
          if (qword_10003C038)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
              int v37 = 128;
            }
            else {
              int v37 = 0;
            }
          }
          else
          {
            int v37 = 0;
          }
          uint32_t v92 = 67109634;
          int v93 = v36 + v37;
          __int16 v94 = 2080;
          v95 = "otherIntrHandler";
          __int16 v96 = 1024;
          int v97 = 30;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): CRITICAL: ECC ERROR!!\n", (uint8_t *)&v92, 0x18u);
        }
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x800uLL, 0x10000000u);
        *(_DWORD *)(a1 + 2772) |= 0x80u;
        int v4 = *(_DWORD *)(a1 + 696);
      }
      if (v4 == 8)
      {
        if ((v2 & 0x2000000) != 0)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x888uLL, 0x2000000u);
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x800uLL, 0x2000000u);
          if ((*(unsigned int (**)(uint64_t))(a1 + 1568))(a1) == -26 && (dword_10003C040 & 0x10) != 0)
          {
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_283;
            }
            BOOL v5 = qword_10003C000 && IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
            if (qword_10003C008) {
              int v38 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008) ? 2 : 0;
            }
            else {
              int v38 = 0;
            }
            int v40 = v5 | v38;
            if (qword_10003C010) {
              int v41 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010) ? 4 : 0;
            }
            else {
              int v41 = 0;
            }
            int v44 = v40 | v41;
            if (qword_10003C018) {
              int v45 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018) ? 8 : 0;
            }
            else {
              int v45 = 0;
            }
            int v48 = v44 | v45;
            if (qword_10003C020) {
              int v49 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020) ? 16 : 0;
            }
            else {
              int v49 = 0;
            }
            int v52 = v48 | v49;
            if (qword_10003C028) {
              int v53 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028) ? 32 : 0;
            }
            else {
              int v53 = 0;
            }
            int v56 = v53 | v52;
            if (qword_10003C030) {
              int v57 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030) ? 64 : 0;
            }
            else {
              int v57 = 0;
            }
            int v60 = v56 + v57;
            if (qword_10003C038) {
              int v61 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038) ? 128 : 0;
            }
            else {
              int v61 = 0;
            }
            uint32_t v92 = 67109634;
            int v93 = v60 + v61;
            __int16 v94 = 2080;
            v95 = "otherIntrHandler";
            __int16 v96 = 1024;
            int v97 = 43;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): CRITICAL: OVER TEMP!! PHY IS SHUT DOWN!!\n", (uint8_t *)&v92, 0x18u);
            if ((dword_10003C040 & 0x10) != 0)
            {
LABEL_283:
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                if (qword_10003C000) {
                  BOOL v64 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                }
                else {
                  BOOL v64 = 0;
                }
                if (qword_10003C008)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                    int v66 = 2;
                  }
                  else {
                    int v66 = 0;
                  }
                }
                else
                {
                  int v66 = 0;
                }
                int v68 = v64 | v66;
                if (qword_10003C010)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                    int v69 = 4;
                  }
                  else {
                    int v69 = 0;
                  }
                }
                else
                {
                  int v69 = 0;
                }
                int v72 = v68 | v69;
                if (qword_10003C018)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                    int v73 = 8;
                  }
                  else {
                    int v73 = 0;
                  }
                }
                else
                {
                  int v73 = 0;
                }
                int v76 = v72 | v73;
                if (qword_10003C020)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                    int v77 = 16;
                  }
                  else {
                    int v77 = 0;
                  }
                }
                else
                {
                  int v77 = 0;
                }
                int v80 = v76 | v77;
                if (qword_10003C028)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                    int v81 = 32;
                  }
                  else {
                    int v81 = 0;
                  }
                }
                else
                {
                  int v81 = 0;
                }
                int v84 = v81 | v80;
                if (qword_10003C030)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                    int v85 = 64;
                  }
                  else {
                    int v85 = 0;
                  }
                }
                else
                {
                  int v85 = 0;
                }
                int v88 = v84 + v85;
                if (qword_10003C038)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                    int v89 = 128;
                  }
                  else {
                    int v89 = 0;
                  }
                }
                else
                {
                  int v89 = 0;
                }
                uint32_t v92 = 67109634;
                int v93 = v88 + v89;
                __int16 v94 = 2080;
                v95 = "otherIntrHandler";
                __int16 v96 = 1024;
                int v97 = 44;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): System shutdown required!\n", (uint8_t *)&v92, 0x18u);
              }
            }
          }
        }
      }
      else if ((v2 & 0x800000) != 0 && (*(unsigned int (**)(uint64_t))(a1 + 1568))(a1) == -26)
      {
        if ((dword_10003C040 & 0x10) != 0)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_284;
          }
          BOOL v24 = qword_10003C000 && IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
          if (qword_10003C008) {
            int v39 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008) ? 2 : 0;
          }
          else {
            int v39 = 0;
          }
          int v42 = v24 | v39;
          if (qword_10003C010) {
            int v43 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010) ? 4 : 0;
          }
          else {
            int v43 = 0;
          }
          int v46 = v42 | v43;
          if (qword_10003C018) {
            int v47 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018) ? 8 : 0;
          }
          else {
            int v47 = 0;
          }
          int v50 = v46 | v47;
          if (qword_10003C020) {
            int v51 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020) ? 16 : 0;
          }
          else {
            int v51 = 0;
          }
          int v54 = v50 | v51;
          if (qword_10003C028) {
            int v55 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028) ? 32 : 0;
          }
          else {
            int v55 = 0;
          }
          int v58 = v55 | v54;
          if (qword_10003C030) {
            int v59 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030) ? 64 : 0;
          }
          else {
            int v59 = 0;
          }
          int v62 = v58 + v59;
          if (qword_10003C038) {
            int v63 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038) ? 128 : 0;
          }
          else {
            int v63 = 0;
          }
          uint32_t v92 = 67109634;
          int v93 = v62 + v63;
          __int16 v94 = 2080;
          v95 = "otherIntrHandler";
          __int16 v96 = 1024;
          int v97 = 49;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): CRITICAL: OVER TEMP!! PHY IS SHUT DOWN!!\n", (uint8_t *)&v92, 0x18u);
          if ((dword_10003C040 & 0x10) != 0)
          {
LABEL_284:
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              if (qword_10003C000) {
                BOOL v65 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
              }
              else {
                BOOL v65 = 0;
              }
              if (qword_10003C008)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                  int v67 = 2;
                }
                else {
                  int v67 = 0;
                }
              }
              else
              {
                int v67 = 0;
              }
              int v70 = v65 | v67;
              if (qword_10003C010)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                  int v71 = 4;
                }
                else {
                  int v71 = 0;
                }
              }
              else
              {
                int v71 = 0;
              }
              int v74 = v70 | v71;
              if (qword_10003C018)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                  int v75 = 8;
                }
                else {
                  int v75 = 0;
                }
              }
              else
              {
                int v75 = 0;
              }
              int v78 = v74 | v75;
              if (qword_10003C020)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                  int v79 = 16;
                }
                else {
                  int v79 = 0;
                }
              }
              else
              {
                int v79 = 0;
              }
              int v82 = v78 | v79;
              if (qword_10003C028)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                  int v83 = 32;
                }
                else {
                  int v83 = 0;
                }
              }
              else
              {
                int v83 = 0;
              }
              int v86 = v83 | v82;
              if (qword_10003C030)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                  int v87 = 64;
                }
                else {
                  int v87 = 0;
                }
              }
              else
              {
                int v87 = 0;
              }
              int v90 = v86 + v87;
              if (qword_10003C038)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                  int v91 = 128;
                }
                else {
                  int v91 = 0;
                }
              }
              else
              {
                int v91 = 0;
              }
              uint32_t v92 = 67109634;
              int v93 = v90 + v91;
              __int16 v94 = 2080;
              v95 = "otherIntrHandler";
              __int16 v96 = 1024;
              int v97 = 50;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): System shutdown required!\n", (uint8_t *)&v92, 0x18u);
            }
          }
        }
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x800uLL, 0x800000u);
      }
      int v6 = *(_DWORD *)(a1 + 696);
      if ((v6 - 7) < 2)
      {
        if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) != 1) {
          goto LABEL_37;
        }
LABEL_29:
        int v7 = *(_DWORD *)(a1 + 696);
        if (v7 <= 3) {
          uint32_t v8 = *(_DWORD *)(*(void *)(a1 + 1928) + 52);
        }
        else {
          uint32_t v8 = 0x2000000;
        }
        if ((v8 & v3) != 0)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x800uLL, v8);
          *(_DWORD *)(a1 + 2772) |= 1u;
          int v7 = *(_DWORD *)(a1 + 696);
        }
        if (v7 == 2 && (*(_DWORD *)(*(void *)(a1 + 1928) + 48) & v3) != 0)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x800uLL, *(_DWORD *)(*(void *)(a1 + 1928) + 48));
          *(_DWORD *)(a1 + 2772) |= 2u;
        }
LABEL_37:
        if (*(_DWORD *)(a1 + 1616) == 7 && (v2 & 0x2000000) != 0)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x800uLL, 0x2000000u);
          *(_DWORD *)(a1 + 2772) |= 0x10u;
        }
        else if (!*(_DWORD *)(a1 + 2772))
        {
LABEL_42:
          sub_100018010(a1, 1, 0);
          return;
        }
        sub_100012980(a1);
        goto LABEL_42;
      }
      if (v6 == 2)
      {
        if ((((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) - 1) & 0xFFFFFFFD) != 0) {
          goto LABEL_37;
        }
        goto LABEL_29;
      }
      if (v6 != 1) {
        goto LABEL_37;
      }
    }
    if (*(_DWORD *)(a1 + 1616) != 12) {
      goto LABEL_37;
    }
    goto LABEL_29;
  }
}

void sub_10001060C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 2748))
  {
    unsigned int v2 = 0;
    __dmb(1u);
    do
    {
      int v3 = sub_1000106A8(a1, 0);
      unsigned int v4 = sub_100012690((IOPCIDevice **)a1, 0);
      if (v4) {
        unsigned int v2 = HIWORD(v4);
      }
    }
    while (v4 | v3);
    if (v2) {
      IODataQueueDispatchSource::SendDataAvailable(*(IODataQueueDispatchSource **)(a1 + 2720));
    }
    sub_100017D00(a1, 0xFFFFFFFFFFFFFFFFLL);
  }
}

uint64_t sub_1000106A8(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = a1 + 352 * a2;
  unsigned int v3 = *(_DWORD *)(v2 + 2168);
  if (v3 == atomic_load_explicit((atomic_uint *volatile)(v2 + 2172), memory_order_acquire)) {
    return 0;
  }
  uint64_t v4 = v2 + 2040;
  int v5 = *(_DWORD *)(*(void *)(v2 + 2304) + 4096);
  if (v3 == v5) {
    return 0;
  }
  uint64_t v6 = 0;
  do
  {
    uint64_t v8 = *(void *)(*(void *)(v4 + 304) + 8 * v3);
    if (v8)
    {
      BOOL v9 = *(IODataQueueDispatchSource **)(v4 + 328);
      LODWORD(v6) = v6 + 1;
      BOOL sendDataAvailable = 0;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 0x40000000;
      v10[2] = sub_100010958;
      v10[3] = &unk_100038388;
      v10[4] = v8;
      if (IODataQueueDispatchSource::EnqueueWithCoalesce(v9, 0x68u, &sendDataAvailable, v10))
      {
        IODataQueueDispatchSource::SendDataAvailable(v9);
        uint64_t v6 = (unsigned __int16)v6;
      }
      else
      {
        uint64_t v6 = v6 | 0x10000;
      }
    }
    unsigned int v3 = (v3 + 1);
  }
  while (v3 != v5);
  *(_DWORD *)(v4 + 128) = v5;
  if (v6 >= 0x10000) {
    IODataQueueDispatchSource::SendDataAvailable(*(IODataQueueDispatchSource **)(v4 + 328));
  }
  return v6;
}

void sub_1000107EC(IOPCIDevice **a1, unsigned int a2)
{
  uint64_t v2 = &a1[44 * a2];
  unsigned int v3 = *((_DWORD *)v2 + 543);
  memset(v18, 0, 512);
  int v4 = *((_DWORD *)v2 + 542);
  if ((_BYTE)v4 + ~(_BYTE)v3)
  {
    int v7 = a1[44 * a2 + 297];
    unsigned int v8 = ((uint64_t (*)(IOPCIDevice *, _OWORD *, void))v7->IOService::OSObject::OSMetaClassBase::__vftable[1].free)(v7, v18, (v4 + ~(_BYTE)v3));
    if (v8)
    {
      uint64_t v9 = v8 - 1;
      BOOL v10 = (uint64_t *)v18;
      uint64_t v11 = v8;
      do
      {
        uint64_t v12 = *v10++;
        uint64_t v13 = *(void *)(v12 + 48);
        *((void *)&v2[293]->IOService::OSObject::OSMetaClassBase::__vftable + v3) = v13 + 8;
        int v14 = *(_DWORD *)(v13 + 72);
        uint64_t v15 = *(void *)(v13 + 24) + *(unsigned int *)(v13 + 76);
        if (v9) {
          int v16 = 590348288;
        }
        else {
          int v16 = 724566016;
        }
        uint64_t v17 = (uint64_t)v2[288] + 16 * v3;
        *(void *)uint64_t v17 = v15;
        *(_DWORD *)(v17 + 8) = v14 | v16;
        *(_DWORD *)(v17 + 12) = v14 << 14;
        unsigned int v3 = (v3 + 1);
        --v9;
        --v11;
      }
      while (v11);
      atomic_store(v3, (unsigned int *)v2 + 543);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, (a2 << 6) + 24600, v3);
    }
  }
}

uint64_t sub_100010958(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(*(void *)(result + 32) + 40);
  return result;
}

uint64_t ixgbe_dcb_get_tc_stats_82599(IOPCIDevice **a1, uint64_t a2, unsigned int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_dcb_get_tc_stats_82599", 19, "dcb_get_tc_stats");
  }
  if (a3 > 8) {
    return 4294967291;
  }
  if (a3)
  {
    uint64_t v7 = 0;
    unsigned int v8 = (void *)(a2 + 728);
    uint64_t v9 = 34564;
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v7 + 24624, &readData);
      __dmb(1u);
      v8[16] += readData;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v9 - 4, &readData);
      __dmb(1u);
      v8[48] += readData;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v9, &readData);
      __dmb(1u);
      v8[48] += (unint64_t)readData << 32;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v7 + 4144, &readData);
      __dmb(1u);
      *v8 += readData;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v7 + 4148, &readData);
      __dmb(1u);
      v8[32] += readData;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v7 + 4152, &readData);
      __dmb(1u);
      v8[32] += (unint64_t)readData << 32;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v7 + 5168, &readData);
      __dmb(1u);
      v8[64] += readData;
      v7 += 64;
      v9 += 8;
      ++v8;
    }
    while ((unint64_t)a3 << 6 != v7);
  }
  return 0;
}

uint64_t ixgbe_dcb_get_pfc_stats_82599(IOPCIDevice **a1, uint64_t a2, int a3)
{
  LODWORD(v3) = a3;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_dcb_get_pfc_stats_82599", 60, "dcb_get_pfc_stats");
  }
  if (v3 > 8) {
    return 4294967291;
  }
  if (v3)
  {
    uint64_t v3 = v3;
    uint64_t v7 = (void *)(a2 + 352);
    uint64_t v8 = 16160;
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v8, &readData);
      __dmb(1u);
      *(v7 - 8) += readData;
      uint32_t v9 = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v8 + 576, &v9);
      __dmb(1u);
      *v7++ += v9;
      v8 += 4;
      --v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t ixgbe_dcb_config_rx_arbiter_82599(IOPCIDevice **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x2430uLL, 0x46u);
  uint64_t v12 = 0;
  uint32_t v13 = 0;
  do
  {
    int v14 = *a6++;
    v13 |= v14 << v12;
    v12 += 3;
  }
  while (v12 != 24);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x3020uLL, v13);
  uint64_t v15 = 0;
  uint64_t v16 = 8512;
  do
  {
    if (*(unsigned char *)(a5 + v15) == 2) {
      uint32_t v17 = *(unsigned __int16 *)(a2 + 2 * v15) | (*(unsigned __int16 *)(a3 + 2 * v15) << 12) | (*(unsigned __int8 *)(a4 + v15) << 9) | 0x80000000;
    }
    else {
      uint32_t v17 = *(unsigned __int16 *)(a2 + 2 * v15) | (*(unsigned __int16 *)(a3 + 2 * v15) << 12) | (*(unsigned __int8 *)(a4 + v15) << 9);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, v16, v17);
    ++v15;
    v16 += 4;
  }
  while (v15 != 8);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x2430uLL, 6u);
  return 0;
}

uint64_t ixgbe_dcb_config_tx_desc_arbiter_82599(IOPCIDevice **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  for (uint32_t i = 0; i != 128; ++i)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x4904uLL, i);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x4908uLL, 0);
  }
  uint64_t v11 = 0;
  uint64_t v12 = 18704;
  do
  {
    int v13 = *(unsigned __int16 *)(a2 + 2 * v11) | (*(unsigned __int16 *)(a3 + 2 * v11) << 12) | (*(unsigned __int8 *)(a4 + v11) << 9);
    int v14 = *(unsigned __int8 *)(a5 + v11);
    if (v14 == 1) {
      v13 |= 0x40000000u;
    }
    if (v14 == 2) {
      uint32_t v15 = v13 | 0x80000000;
    }
    else {
      uint32_t v15 = v13;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, v12, v15);
    ++v11;
    v12 += 4;
  }
  while (v11 != 8);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x4900uLL, 0x11u);
  return 0;
}

uint64_t ixgbe_dcb_config_tx_data_arbiter_82599(IOPCIDevice **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xCD00uLL, 0x1000160u);
  uint64_t v12 = 0;
  uint32_t v13 = 0;
  do
  {
    int v14 = *a6++;
    v13 |= v14 << v12;
    v12 += 3;
  }
  while (v12 != 24);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xC800uLL, v13);
  uint64_t v15 = 0;
  uint64_t v16 = 52512;
  do
  {
    int v17 = *(unsigned __int16 *)(a2 + 2 * v15) | (*(unsigned __int16 *)(a3 + 2 * v15) << 12) | (*(unsigned __int8 *)(a4 + v15) << 9);
    int v18 = *(unsigned __int8 *)(a5 + v15);
    if (v18 == 1) {
      v17 |= 0x40000000u;
    }
    if (v18 == 2) {
      uint32_t v19 = v17 | 0x80000000;
    }
    else {
      uint32_t v19 = v17;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, v16, v19);
    ++v15;
    v16 += 4;
  }
  while (v15 != 8);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xCD00uLL, 0x1000120u);
  return 0;
}

uint64_t ixgbe_dcb_config_pfc_82599(uint64_t a1, unsigned int a2, uint8x8_t *a3)
{
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x3D00uLL, 0x10u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4294uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData & 0xFFFFF001;
  if (*(int *)(a1 + 696) <= 3) {
    int v7 = 0;
  }
  else {
    int v7 = 16 * a2;
  }
  if (a2) {
    int v8 = 6;
  }
  else {
    int v8 = 2;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4294uLL, v6 | v8 | v7);
  unint64_t v9 = 0;
  uint64_t v10 = vmaxv_u8(*a3);
  uint64_t v11 = 12836;
  do
  {
    uint64_t v12 = 0;
    unint64_t v13 = v9;
    uint64_t v14 = v11;
    while (v9 != a3->u8[v12] || ((a2 >> v12) & 1) == 0)
    {
      if (++v12 == 8)
      {
        uint32_t v23 = 0;
        uint64_t v15 = 4 * v9;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 4 * v9 + 15360, &v23);
        __dmb(1u);
        uint32_t v16 = v23 - 24576;
        __dmb(2u);
        int v17 = *(IOPCIDevice **)a1;
        uint64_t v18 = 4 * v13 + 12832;
        uint32_t v19 = 0;
        goto LABEL_14;
      }
    }
    uint64_t v15 = 4 * v9;
    uint32_t v16 = (*(_DWORD *)(a1 + 1332 + 4 * v9) << 10) | 0x80000000;
    uint32_t v19 = (*(_DWORD *)(a1 + 4 * v9 + 1364) << 10) | 0x80000000;
    __dmb(2u);
    int v17 = *(IOPCIDevice **)a1;
    uint64_t v18 = 4 * v9 + 12832;
LABEL_14:
    IOPCIDevice::MemoryWrite32(v17, 0, v18, v19);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v15 + 12896, v16);
    unint64_t v9 = v13 + 1;
    uint64_t v11 = v14 + 4;
  }
  while (v13 != v10);
  if (v13 <= 6)
  {
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v14, 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v14 + 64, 0);
      ++v13;
      v14 += 4;
    }
    while (v13 < 7);
  }
  uint64_t v20 = 0;
  uint32_t v21 = *(unsigned __int16 *)(a1 + 1396) | (*(unsigned __int16 *)(a1 + 1396) << 16);
  do
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v20 + 12800, v21);
    v20 += 4;
  }
  while (v20 != 16);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x32A0uLL, *(unsigned __int16 *)(a1 + 1396) >> 1);
  return 0;
}

uint64_t ixgbe_dcb_config_tc_stats_82599(IOPCIDevice **a1, uint64_t a2)
{
  if (a2)
  {
    int v3 = *(unsigned __int8 *)(a2 + 264);
    if (v3 == 4)
    {
      if (*(unsigned char *)(a2 + 296))
      {
        for (uint64_t i = 0; i != 128; i += 4)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*a1, 0, i + 8960, 0x3020100u);
        }
        for (uint64_t j = 0; j != 128; j += 4)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*a1, 0, j | 0x8600, 0x3020100u);
        }
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v14 = 8960;
        do
        {
          if ((v13 & 4) == 0)
          {
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*a1, 0, v14, 16843009 * (v13 >> 3));
          }
          ++v13;
          v14 += 4;
        }
        while (v13 != 32);
        unint64_t v15 = 0;
        uint64_t v16 = 34304;
        do
        {
          if (v15 >= 0x1C) {
            int v17 = 50529027;
          }
          else {
            int v17 = 33686018;
          }
          if (v15 < 0x18) {
            int v17 = 16843009;
          }
          if (v15 >= 0x10) {
            uint32_t v18 = v17;
          }
          else {
            uint32_t v18 = 0;
          }
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*a1, 0, v16, v18);
          ++v15;
          v16 += 4;
        }
        while (v15 != 32);
      }
      return 0;
    }
    if (v3 != 8 || *(unsigned char *)(a2 + 296)) {
      return 4294967291;
    }
  }
  uint64_t v5 = 0;
  uint64_t v6 = 8960;
  do
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, v6, 16843009 * (v5++ >> 2));
    v6 += 4;
  }
  while (v5 != 32);
  unint64_t v7 = 0;
  uint64_t v8 = 34304;
  do
  {
    if (v7 >= 0x1E) {
      int v9 = 117901063;
    }
    else {
      int v9 = 101058054;
    }
    if (v7 < 0x1C) {
      int v9 = 84215045;
    }
    if (v7 < 0x1A) {
      int v9 = 67372036;
    }
    if (v7 < 0x18) {
      int v9 = 50529027;
    }
    if (v7 < 0x14) {
      int v9 = 33686018;
    }
    if (v7 < 0x10) {
      int v9 = 16843009;
    }
    if (v7 >= 8) {
      uint32_t v10 = v9;
    }
    else {
      uint32_t v10 = 0;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, v8, v10);
    ++v7;
    v8 += 4;
  }
  while (v7 != 32);
  return 0;
}

uint64_t ixgbe_dcb_config_82599(IOPCIDevice **a1, uint64_t a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x4900uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x4900uLL, v4);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x5818uLL, &readData);
  __dmb(1u);
  uint32_t v5 = readData;
  int v6 = *(unsigned __int8 *)(a2 + 264);
  if (v6 == 4)
  {
    if (*(unsigned char *)(a2 + 296)) {
      uint32_t v5 = readData & 0xFFFFFFF0 | 0xD;
    }
    else {
      uint32_t v5 = readData & 0xFFFFFFF0 | 5;
    }
  }
  else if (v6 == 8)
  {
    switch(readData & 0xF)
    {
      case 0u:
      case 3u:
        uint32_t v5 = readData & 0xFFFFFFF0 | 2;
        break;
      case 1u:
      case 5u:
        uint32_t v5 = readData & 0xFFFFFFF0 | 4;
        break;
      default:
        sub_100031A78();
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x5818uLL, v5);
  if (*(unsigned char *)(a2 + 264) == 8)
  {
    uint32_t v7 = 13;
  }
  else if (*(unsigned char *)(a2 + 296))
  {
    uint32_t v7 = 11;
  }
  else
  {
    uint32_t v7 = 9;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x8120uLL, v7);
  for (int i = 0; i != 0x8000; i += 256)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x2F04uLL, i | 0x10000);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x4900uLL, &readData);
  __dmb(1u);
  uint32_t v9 = readData & 0xFFFFFFBF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x4900uLL, v9);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x8810uLL, &readData);
  __dmb(1u);
  uint32_t v10 = readData | 0x1F00;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x8810uLL, v10);
  return 0;
}

uint64_t ixgbe_dcb_hw_config_82599(IOPCIDevice **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7)
{
  return 0;
}

uint64_t ixgbe_init_ops_vf(void *a1)
{
  a1[2] = ixgbe_init_hw_vf;
  a1[3] = ixgbe_reset_hw_vf;
  a1[4] = ixgbe_start_hw_vf;
  a1[5] = 0;
  a1[7] = 0;
  a1[9] = ixgbe_get_mac_addr_vf;
  a1[15] = ixgbe_stop_adapter_vf;
  a1[16] = 0;
  a1[17] = ixgbevf_negotiate_api_version;
  a1[33] = ixgbe_setup_mac_link_vf;
  a1[35] = ixgbe_check_mac_link_vf;
  a1[36] = 0;
  a1[44] = ixgbe_set_rar_vf;
  a1[45] = ixgbevf_set_uc_addr_vf;
  a1[51] = 0;
  a1[53] = &ixgbe_update_mc_addr_list_vf;
  a1[54] = ixgbevf_update_xcast_mode;
  a1[55] = 0;
  a1[56] = 0;
  a1[57] = 0;
  a1[58] = ixgbe_set_vfta_vf;
  a1[60] = ixgbevf_rlpml_set_vf;
  *(void *)((char *)a1 + 1260) = 0x100000001;
  a1[228] = ixgbe_init_mbx_params_vf;
  return 0;
}

uint64_t ixgbe_init_hw_vf(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(a1 + 32))();
  (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, a1 + 700);
  return v2;
}

uint64_t ixgbe_reset_hw_vf(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_hw_vf", 149, "ixgbevf_reset_hw_vf");
  }
  (*(void (**)(uint64_t))(a1 + 120))(a1);
  *(_DWORD *)(a1 + 1948) = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_hw_vf", 157, "Issuing a function level reset to MAC\n");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0, 0x4000000u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0xC350uLL);
  if ((*(unsigned int (**)(uint64_t, void))(a1 + 1880))(a1, 0)) {
    goto LABEL_13;
  }
  int v2 = -199;
  do
  {
    int v3 = v2;
    IODelay(5uLL);
    int v4 = (*(uint64_t (**)(uint64_t, void))(a1 + 1880))(a1, 0);
    int v2 = v3 + 1;
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v3 == 0;
    }
  }
  while (!v5);
  if (!v3) {
    return 4294967281;
  }
LABEL_13:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x300uLL, 0);
  for (uint64_t i = 0; i != 448; i += 64)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 4112, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 4120, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 4136, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 4116, 0x402u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 8208, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 8216, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 8232, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 8252, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 8248, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 4108, 0xA200u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, i + 8204, 0x2A00u);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  *(_DWORD *)(a1 + 1908) = 2000;
  v8[0] = 1;
  (*(void (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1856))(a1, v8, 1, 0);
  IODelay(0x2710uLL);
  uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1848))(a1, v8, 4, 0);
  if (!result)
  {
    if (v8[0] == 1073741825)
    {
LABEL_19:
      uint64_t result = 0;
      *(_DWORD *)(a1 + 1236) = v10;
      return result;
    }
    if (v8[0] == -2147483647)
    {
      *(_DWORD *)(a1 + 706) = v8[1];
      *(_WORD *)(a1 + 710) = v9;
      goto LABEL_19;
    }
    return 4294967286;
  }
  return result;
}

uint64_t ixgbe_start_hw_vf(uint64_t a1)
{
  *(unsigned char *)(a1 + 1945) = 0;
  return 0;
}

uint64_t ixgbe_get_mac_addr_vf(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = 0; i != 6; ++i)
    *(unsigned char *)(a2 + i) = *(unsigned char *)(a1 + 706 + i);
  return 0;
}

uint64_t ixgbe_stop_adapter_vf(uint64_t a1)
{
  *(unsigned char *)(a1 + 1945) = 1;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x10CuLL, 7u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x100uLL, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 1260))
  {
    int v2 = 0;
    int v3 = 0;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, ((v2 << 6) + 8232), 0x4000000u);
      int v2 = (unsigned __int16)++v3;
    }
    while (*(_DWORD *)(a1 + 1260) > (unsigned __int16)v3);
  }
  if (*(_DWORD *)(a1 + 1264))
  {
    int v4 = 0;
    int v5 = 0;
    do
    {
      uint32_t v10 = 0;
      uint64_t v6 = ((v4 << 6) + 4136);
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v6, &v10);
      __dmb(1u);
      uint32_t v7 = v10 & 0xFDFFFFFF;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v6, v7);
      int v4 = (unsigned __int16)++v5;
    }
    while (*(_DWORD *)(a1 + 1264) > (unsigned __int16)v5);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x300uLL, 0);
  uint32_t v9 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v9);
  __dmb(1u);
  IODelay(0x7D0uLL);
  return 0;
}

uint64_t ixgbevf_negotiate_api_version(uint64_t a1, int a2)
{
  v5[0] = 8;
  v5[1] = a2;
  v5[2] = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1856))(a1, v5, 3, 0);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1848))(a1, v5, 3, 0);
    if (!result)
    {
      if ((v5[0] & 0xDFFFFFFF) == 0x80000008)
      {
        uint64_t result = 0;
        *(_DWORD *)(a1 + 1948) = a2;
      }
      else
      {
        return 4294967264;
      }
    }
  }
  return result;
}

uint64_t ixgbe_setup_mac_link_vf()
{
  return 0;
}

uint64_t ixgbe_check_mac_link_vf(uint64_t a1, int *a2, unsigned char *a3)
{
  int v17 = 0;
  if ((*(unsigned int (**)(uint64_t, void))(a1 + 1880))(a1, 0) && *(_DWORD *)(a1 + 1908))
  {
    uint64_t v6 = (unsigned char *)(a1 + 1273);
    if (!*(unsigned char *)(a1 + 1273)) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v6 = (unsigned char *)(a1 + 1273);
    *(unsigned char *)(a1 + 1273) = 1;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x10uLL, &readData);
  __dmb(1u);
  uint32_t v7 = readData;
  if ((readData & 0x40000000) == 0) {
    goto LABEL_24;
  }
  if (*(_DWORD *)(a1 + 696) == 3)
  {
    int v8 = 5;
    do
    {
      IODelay(0x64uLL);
      uint32_t v15 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x10uLL, &v15);
      __dmb(1u);
      uint32_t v7 = v15;
      if ((v15 & 0x40000000) == 0) {
        goto LABEL_24;
      }
    }
    while (--v8);
  }
  int v9 = 32;
  switch((v7 >> 28) & 3)
  {
    case 1u:
      int v10 = v7 & 0x8000000;
      BOOL v11 = *(_DWORD *)(a1 + 696) != 6 || v10 == 0;
      int v12 = 2048;
      int v9 = 8;
      goto LABEL_21;
    case 2u:
      break;
    case 3u:
      int v13 = v7 & 0x8000000;
      BOOL v11 = *(int *)(a1 + 696) < 6 || v13 == 0;
      int v12 = 1024;
      int v9 = 128;
LABEL_21:
      if (!v11) {
        int v9 = v12;
      }
      break;
    default:
      int v9 = 2 * (*(_DWORD *)(a1 + 696) > 5);
      break;
  }
  *a2 = v9;
  if ((*(unsigned int (**)(uint64_t, int *, uint64_t, void))(a1 + 1832))(a1, &v17, 1, 0))
  {
LABEL_24:
    uint64_t result = 0;
    goto LABEL_25;
  }
  if ((v17 & 0x20000000) != 0)
  {
    if (*(_DWORD *)(a1 + 1908))
    {
      uint64_t result = 0;
      *uint64_t v6 = 0;
    }
    else
    {
      uint64_t result = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t result = ((2 * v17) >> 31);
  }
LABEL_25:
  *a3 = *v6 ^ 1;
  return result;
}

uint64_t ixgbe_set_rar_vf(uint64_t a1, uint64_t a2, int *a3)
{
  int v4 = *a3;
  v7[0] = 2;
  v7[1] = v4;
  int v8 = 0;
  LOWORD(v8) = *((_WORD *)a3 + 2);
  uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1856))(a1, v7, 3, 0);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1848))(a1, v7, 3, 0);
    if (result) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = (v7[0] & 0xDFFFFFFF) == 1073741826;
    }
    if (v6)
    {
      *(_WORD *)(a1 + 704) = *(_WORD *)(a1 + 710);
      *(_DWORD *)(a1 + 700) = *(_DWORD *)(a1 + 706);
      return 4294967196;
    }
  }
  return result;
}

uint64_t ixgbevf_set_uc_addr_vf(uint64_t a1, int a2, uint64_t a3)
{
  int v7 = 0;
  uint64_t v6 = ((unsigned __int16)a2 << 16) | 6u;
  if (a3)
  {
    HIDWORD(v6) = *(_DWORD *)a3;
    LOWORD(v7) = *(_WORD *)(a3 + 4);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, void))(a1 + 1856))(a1, &v6, 3, 0);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, void))(a1 + 1848))(a1, &v6, 3, 0);
    if (!result)
    {
      if ((v6 & 0xDFFFFFFF) == ((a2 << 16) | 0x40000006)) {
        return 4294967262;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

uint64_t ixgbevf_update_xcast_mode(uint64_t a1, int a2)
{
  int v3 = *(_DWORD *)(a1 + 1948);
  if (v3 != 4 && (v3 != 3 || a2 > 2)) {
    return 4294967260;
  }
  v5[0] = 12;
  v5[1] = a2;
  uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1856))(a1, v5, 2, 0);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1848))(a1, v5, 2, 0);
    if (!result)
    {
      if ((v5[0] & 0xDFFFFFFF) == 0x4000000C) {
        return 4294967260;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

uint64_t ixgbe_set_vfta_vf(uint64_t a1, int a2, uint64_t a3, int a4)
{
  if (a4) {
    int v5 = 65540;
  }
  else {
    int v5 = 4;
  }
  v9[0] = v5;
  v9[1] = a2;
  unsigned int v6 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1856))(a1, v9, 2, 0);
  if (!v6) {
    unsigned int v6 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1848))(a1, v9, 2, 0);
  }
  if (v9[0] <= -1 && v6 == 0) {
    return 0;
  }
  else {
    return v9[0] & 0x40000000 | v6;
  }
}

uint64_t ixgbevf_rlpml_set_vf(uint64_t a1, int a2)
{
  v5[0] = 5;
  v5[1] = a2;
  uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1856))(a1, v5, 2, 0);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, void))(a1 + 1848))(a1, v5, 2, 0);
    if (!result)
    {
      if ((v5[0] & 0x40000000) == 0 || (v5[0] & 5) == 0) {
        return 0;
      }
      else {
        return 4294967196;
      }
    }
  }
  return result;
}

uint64_t ixgbe_get_num_of_tx_queues_vf()
{
  return 8;
}

uint64_t ixgbe_get_num_of_rx_queues_vf()
{
  return 8;
}

uint64_t ixgbevf_get_queues(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  if ((*(_DWORD *)(a1 + 1948) - 2) > 2) {
    return 0;
  }
  int v10 = 9;
  int32x2_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, int *, uint64_t, void))(a1 + 1856))(a1, &v10, 5, 0);
  if (!result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, int *, uint64_t, void))(a1 + 1848))(a1, &v10, 5, 0);
    if (!result)
    {
      if ((v10 & 0xDFFFFFFF) == 0x80000009)
      {
        uint64_t result = 0;
        *(int8x8_t *)(a1 + 1260) = vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)0x700000007, (uint32x2_t)vadd_s32(v11, (int32x2_t)0x800000008)), (int8x8_t)0x800000008, (int8x8_t)v11);
        unsigned int v7 = v12;
        unsigned int v8 = HIDWORD(v12);
        *a2 = v12;
        if (v7 > *(_DWORD *)(a1 + 1264)) {
          unsigned int v7 = 1;
        }
        *a2 = v7;
        *a3 = v8;
        if (v8 >= *(_DWORD *)(a1 + 1260)) {
          unsigned int v9 = 0;
        }
        else {
          unsigned int v9 = v8;
        }
        *a3 = v9;
      }
      else
      {
        return 4294967196;
      }
    }
  }
  return result;
}

uint64_t sub_100012590(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 280);
  unsigned int v3 = *(_DWORD *)(a2 + 128);
  if (v3 != *(_DWORD *)(a2 + 132))
  {
    uint64_t v5 = result;
    int v6 = v2 - 1;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(a2 + 304) + 8 * v3);
      if (v7) {
        v9[6] = v7 - 8;
      }
      uint64_t result = (*(uint64_t (**)(void, void *))(**(void **)(v5 + 2024) + 64))(*(void *)(v5 + 2024), v9);
      int v8 = *(_DWORD *)(a2 + 132);
      unsigned int v3 = (*(_DWORD *)(a2 + 128) + 1) & v6;
      *(_DWORD *)(a2 + 128) = v3;
    }
    while (v3 != v8);
  }
  return result;
}

uint64_t sub_100012690(IOPCIDevice **a1, unsigned int a2)
{
  unsigned int v2 = a2;
  unsigned int v3 = a1;
  int v4 = &a1[44 * a2];
  uint64_t v5 = v4 + 299;
  uint32_t v6 = *((_DWORD *)v4 + 630);
  uint32_t v7 = *((_DWORD *)v4 + 631);
  if (v7 == v6)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
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
    long long v26 = 0u;
    long long v27 = 0u;
    while (1)
    {
      uint64_t v9 = (uint64_t)v4[332] + 16 * v6;
      if ((*(unsigned char *)(v9 + 8) & 1) == 0) {
        break;
      }
      uint64_t v10 = *((void *)&v4[337]->IOService::OSObject::OSMetaClassBase::__vftable + v6);
      uint64_t v11 = (v8 + 1);
      *((void *)&v26 + v8) = v10;
      *(_DWORD *)(v10 + 64) = *(unsigned __int16 *)(v9 + 12);
      unsigned __int8 v12 = v6 + 1;
      uint32_t v6 = (v6 + 1);
      uint64_t v8 = v11;
      if (v7 == v12)
      {
        uint32_t v6 = v7;
        uint64_t v8 = v11;
        break;
      }
    }
    if (v8)
    {
      unsigned int v13 = 0;
      __dmb(1u);
      uint64_t v14 = (IODataQueueDispatchSource *)v4[340];
      BOOL sendDataAvailable = 0;
      do
      {
        while (1)
        {
          uint64_t v15 = *((void *)&v26 + v13);
          callback[0] = _NSConcreteStackBlock;
          callback[1] = 0x40000000;
          callback[2] = sub_100012960;
          callback[3] = &unk_1000383A8;
          callback[4] = v15;
          if (!IODataQueueDispatchSource::EnqueueWithCoalesce(v14, 0x68u, &sendDataAvailable, callback)) {
            break;
          }
          IODataQueueDispatchSource::SendDataAvailable(v14);
          if (++v13 >= v8) {
            goto LABEL_14;
          }
        }
        ++v13;
      }
      while (v13 < v8);
      uint64_t v8 = v8 | 0x10000;
LABEL_14:
      unsigned int v3 = a1;
      unsigned int v2 = a2;
      *((_DWORD *)v5 + 32) = v6;
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
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
  long long v26 = 0u;
  long long v27 = 0u;
  if ((_BYTE)v6 + ~(_BYTE)v7)
  {
    uint64_t v16 = v3[44 * v2 + 341];
    unsigned int v17 = ((uint64_t (*)(IOPCIDevice *, long long *, void))v16->IOService::OSObject::OSMetaClassBase::__vftable[1].free)(v16, &v26, (v6 + ~(_BYTE)v7));
    if (v17)
    {
      uint64_t v18 = v17;
      uint32_t v19 = (uint64_t *)&v26;
      do
      {
        uint64_t v20 = *v19++;
        uint32_t v21 = (IOPCIDevice_vtbl **)((char *)v5[33] + 16 * v7);
        uint64_t v22 = *(void *)(v20 + 48);
        *((void *)&v5[38]->IOService::OSObject::OSMetaClassBase::__vftable + v7) = v22 + 8;
        *uint32_t v21 = *(IOPCIDevice_vtbl **)(v22 + 24);
        v21[1] = 0;
        uint32_t v7 = (v7 + 1);
        --v18;
      }
      while (v18);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*v3, 0, (v2 << 6) | 0x1018, v7);
      *((_DWORD *)v5 + 33) = v7;
    }
  }
  return v8;
}

uint64_t sub_100012960(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(v2 + 40);
  *(unsigned char *)(a2 + 73) = *(unsigned char *)(v2 + 73);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(v2 + 64);
  return result;
}

void sub_100012980(uint64_t a1)
{
  if ((dword_10003C040 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v21 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v21 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v26 = 2;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v28 = v21 | v26;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v29 = 4;
      }
      else {
        int v29 = 0;
      }
    }
    else
    {
      int v29 = 0;
    }
    int v32 = v28 | v29;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v33 = 8;
      }
      else {
        int v33 = 0;
      }
    }
    else
    {
      int v33 = 0;
    }
    int v36 = v32 | v33;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v37 = 16;
      }
      else {
        int v37 = 0;
      }
    }
    else
    {
      int v37 = 0;
    }
    int v40 = v36 | v37;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v41 = 32;
      }
      else {
        int v41 = 0;
      }
    }
    else
    {
      int v41 = 0;
    }
    int v44 = v41 | v40;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v45 = 64;
      }
      else {
        int v45 = 0;
      }
    }
    else
    {
      int v45 = 0;
    }
    int v48 = v44 + v45;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v49 = 128;
      }
      else {
        int v49 = 0;
      }
    }
    else
    {
      int v49 = 0;
    }
    LODWORD(v93) = 67109634;
    HIDWORD(v93) = v48 + v49;
    LOWORD(v94) = 2080;
    *(void *)((char *)&v94 + 2) = "updateAdminStatus";
    WORD5(v94) = 1024;
    HIDWORD(v94) = 12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <==\n", (uint8_t *)&v93, 0x18u);
  }
  if (*(unsigned char *)(a1 + 2764))
  {
    if ((dword_10003C040 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v23 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v23 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v52 = 2;
        }
        else {
          int v52 = 0;
        }
      }
      else
      {
        int v52 = 0;
      }
      int v54 = v23 | v52;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v55 = 4;
        }
        else {
          int v55 = 0;
        }
      }
      else
      {
        int v55 = 0;
      }
      int v58 = v54 | v55;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v59 = 8;
        }
        else {
          int v59 = 0;
        }
      }
      else
      {
        int v59 = 0;
      }
      int v62 = v58 | v59;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v63 = 16;
        }
        else {
          int v63 = 0;
        }
      }
      else
      {
        int v63 = 0;
      }
      int v66 = v62 | v63;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v67 = 32;
        }
        else {
          int v67 = 0;
        }
      }
      else
      {
        int v67 = 0;
      }
      int v70 = v67 | v66;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v71 = 64;
        }
        else {
          int v71 = 0;
        }
      }
      else
      {
        int v71 = 0;
      }
      int v74 = v70 + v71;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v75 = 128;
        }
        else {
          int v75 = 0;
        }
      }
      else
      {
        int v75 = 0;
      }
      int v78 = v74 + v75;
      if (*(_DWORD *)(a1 + 2760) == 128) {
        int v79 = 10;
      }
      else {
        int v79 = 1;
      }
      LODWORD(v93) = 67110146;
      HIDWORD(v93) = v78;
      LOWORD(v94) = 2080;
      *(void *)((char *)&v94 + 2) = "updateAdminStatus";
      WORD5(v94) = 1024;
      HIDWORD(v94) = 15;
      LOWORD(v95) = 1024;
      *(_DWORD *)((char *)&v95 + 2) = v79;
      HIWORD(v95) = 2080;
      __int16 v96 = "Full Duplex";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): Link is up %d Gbps %s \n", (uint8_t *)&v93, 0x28u);
    }
    uint64_t v2 = 10000000000;
    ixgbe_fc_enable(a1);
    sub_100019CB4(a1);
    uint64_t v3 = *(void *)(a1 + 2752);
    if ((v3 & 0x8007) != 0)
    {
      uint64_t v4 = 0;
      int v5 = *(_DWORD *)(a1 + 2760);
      int v6 = 32;
      if (v5 > 31)
      {
        if (v5 == 32)
        {
          uint64_t v4 = 1000000000;
          int v6 = 1048624;
        }
        else if (v5 == 128)
        {
          int v6 = 1048629;
          uint64_t v4 = 10000000000;
        }
      }
      else if (v5 == 2)
      {
        int v6 = 1048611;
        uint64_t v4 = 10000000;
      }
      else if (v5 == 8)
      {
        int v6 = 1048614;
        uint64_t v4 = 100000000;
      }
    }
    else
    {
      uint64_t v4 = 0;
      int v6 = 32;
    }
    if (*(_DWORD *)(a1 + 696) == 6)
    {
      int v10 = *(_DWORD *)(a1 + 2760);
      if (v10 == 1024)
      {
        uint64_t v4 = 2500000000;
        v6 |= 0x100016u;
      }
      else if (v10 == 2048)
      {
        int v6 = 1048631;
        uint64_t v4 = 5000000000;
      }
    }
    if ((v3 & 0x2008) != 0 && *(_DWORD *)(a1 + 2760) == 128)
    {
      v6 |= 0x110001u;
      uint64_t v4 = 10000000000;
    }
    if ((v3 & 0x10) != 0)
    {
      int v11 = *(_DWORD *)(a1 + 2760);
      if (v11 == 32)
      {
        uint64_t v4 = 1000000000;
        v6 |= 0x10000Eu;
        if ((v3 & 0x20) == 0) {
          goto LABEL_36;
        }
        goto LABEL_30;
      }
      if (v11 == 128)
      {
        v6 |= 0x100013u;
        uint64_t v4 = 10000000000;
      }
    }
    if ((v3 & 0x20) == 0) {
      goto LABEL_36;
    }
LABEL_30:
    int v12 = *(_DWORD *)(a1 + 2760);
    if (v12 == 32)
    {
      uint64_t v4 = 1000000000;
      v6 |= 0x10000Eu;
    }
    else if (v12 == 128)
    {
      v6 |= 0x110003u;
      uint64_t v4 = 10000000000;
    }
LABEL_36:
    if ((v3 & 0x4040) != 0)
    {
      int v13 = *(_DWORD *)(a1 + 2760);
      if (v13 == 32)
      {
        uint64_t v4 = 1000000000;
        v6 |= 0x10000Bu;
        if ((v3 & 0x100) == 0) {
          goto LABEL_43;
        }
        goto LABEL_41;
      }
      if (v13 == 128)
      {
        v6 |= 0x100012u;
        uint64_t v4 = 10000000000;
      }
    }
    if ((v3 & 0x100) == 0) {
      goto LABEL_43;
    }
LABEL_41:
    if (*(_DWORD *)(a1 + 2760) == 128)
    {
      v6 |= 0x100014u;
      uint64_t v4 = 10000000000;
    }
LABEL_43:
    if ((v3 & 0x800) != 0)
    {
      int v16 = *(_DWORD *)(a1 + 2760);
      if (v16 != 32)
      {
        if (v16 != 1024)
        {
          if (v16 == 128)
          {
            int v15 = 1048594;
            goto LABEL_58;
          }
LABEL_53:
          uint64_t v2 = v4;
LABEL_59:
          int v17 = *(_DWORD *)(a1 + 1404);
          if ((v17 | 2) == 3) {
            v6 |= 0x400000u;
          }
          if ((v17 & 0xFFFFFFFE) == 2) {
            int v18 = v6 | 0x400000;
          }
          else {
            int v18 = v6;
          }
          if ((dword_10003C040 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            if (qword_10003C000) {
              BOOL v24 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
            }
            else {
              BOOL v24 = 0;
            }
            if (qword_10003C008)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                int v53 = 2;
              }
              else {
                int v53 = 0;
              }
            }
            else
            {
              int v53 = 0;
            }
            int v56 = v24 | v53;
            if (qword_10003C010)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                int v57 = 4;
              }
              else {
                int v57 = 0;
              }
            }
            else
            {
              int v57 = 0;
            }
            int v60 = v56 | v57;
            if (qword_10003C018)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                int v61 = 8;
              }
              else {
                int v61 = 0;
              }
            }
            else
            {
              int v61 = 0;
            }
            int v64 = v60 | v61;
            if (qword_10003C020)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                int v65 = 16;
              }
              else {
                int v65 = 0;
              }
            }
            else
            {
              int v65 = 0;
            }
            int v68 = v64 | v65;
            if (qword_10003C028)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                int v69 = 32;
              }
              else {
                int v69 = 0;
              }
            }
            else
            {
              int v69 = 0;
            }
            int v72 = v69 | v68;
            if (qword_10003C030)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                int v73 = 64;
              }
              else {
                int v73 = 0;
              }
            }
            else
            {
              int v73 = 0;
            }
            int v76 = v72 + v73;
            if (qword_10003C038)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                int v77 = 128;
              }
              else {
                int v77 = 0;
              }
            }
            else
            {
              int v77 = 0;
            }
            LODWORD(v93) = 67110146;
            HIDWORD(v93) = v76 + v77;
            LOWORD(v94) = 2080;
            *(void *)((char *)&v94 + 2) = "updateAdminStatus";
            WORD5(v94) = 1024;
            HIDWORD(v94) = 189;
            LOWORD(v95) = 1024;
            *(_DWORD *)((char *)&v95 + 2) = v18;
            HIWORD(v95) = 2048;
            __int16 v96 = (const char *)v2;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): setting Link mode=0%08x, baud=%lld\n", (uint8_t *)&v93, 0x28u);
          }
          uint32_t v19 = *(IODispatchQueue **)(a1 + 1976);
          int v93 = _NSConcreteStackBlock;
          *(void *)&long long v94 = 0x40000000;
          *((void *)&v94 + 1) = sub_10001499C;
          v95 = &unk_1000383C8;
          __int16 v96 = (const char *)a1;
          LODWORD(v97) = 3;
          HIDWORD(v97) = v18;
          IODispatchQueue::DispatchAsync(v19, &v93);
          uint64_t v8 = *(IODispatchQueue **)(a1 + 1976);
          int v93 = _NSConcreteStackBlock;
          *(void *)&long long v94 = 0x40000000;
          *((void *)&v94 + 1) = sub_1000149B4;
          v95 = &unk_1000383E8;
          __int16 v96 = (const char *)a1;
          int v9 = 100;
          goto LABEL_66;
        }
LABEL_57:
        uint64_t v2 = 2500000000;
        int v15 = 1114112;
        goto LABEL_58;
      }
    }
    else
    {
      if ((v3 & 0x10280) == 0) {
        goto LABEL_53;
      }
      int v14 = *(_DWORD *)(a1 + 2760);
      if (v14 != 32)
      {
        if (v14 != 1024)
        {
          if (v14 == 128)
          {
            int v15 = 1048596;
LABEL_58:
            v6 |= v15;
            goto LABEL_59;
          }
          goto LABEL_53;
        }
        goto LABEL_57;
      }
    }
    uint64_t v2 = 1000000000;
    int v15 = 1048591;
    goto LABEL_58;
  }
  if ((dword_10003C040 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v25 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v25 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v80 = 2;
      }
      else {
        int v80 = 0;
      }
    }
    else
    {
      int v80 = 0;
    }
    int v81 = v25 | v80;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v82 = 4;
      }
      else {
        int v82 = 0;
      }
    }
    else
    {
      int v82 = 0;
    }
    int v83 = v81 | v82;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v84 = 8;
      }
      else {
        int v84 = 0;
      }
    }
    else
    {
      int v84 = 0;
    }
    int v85 = v83 | v84;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v86 = 16;
      }
      else {
        int v86 = 0;
      }
    }
    else
    {
      int v86 = 0;
    }
    int v87 = v85 | v86;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v88 = 32;
      }
      else {
        int v88 = 0;
      }
    }
    else
    {
      int v88 = 0;
    }
    int v89 = v88 | v87;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v90 = 64;
      }
      else {
        int v90 = 0;
      }
    }
    else
    {
      int v90 = 0;
    }
    int v91 = v89 + v90;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v92 = 128;
      }
      else {
        int v92 = 0;
      }
    }
    else
    {
      int v92 = 0;
    }
    LODWORD(v93) = 67109634;
    HIDWORD(v93) = v91 + v92;
    LOWORD(v94) = 2080;
    *(void *)((char *)&v94 + 2) = "updateAdminStatus";
    WORD5(v94) = 1024;
    HIDWORD(v94) = 196;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): Link is Down\n", (uint8_t *)&v93, 0x18u);
  }
  uint32_t v7 = *(IODispatchQueue **)(a1 + 1976);
  int v93 = _NSConcreteStackBlock;
  *(void *)&long long v94 = 0x40000000;
  *((void *)&v94 + 1) = sub_10001499C;
  v95 = &unk_1000383C8;
  __int16 v96 = (const char *)a1;
  uint64_t v97 = 0x2200000001;
  IODispatchQueue::DispatchAsync(v7, &v93);
  uint64_t v8 = *(IODispatchQueue **)(a1 + 1976);
  int v93 = _NSConcreteStackBlock;
  *(void *)&long long v94 = 0x40000000;
  *((void *)&v94 + 1) = sub_1000149B4;
  v95 = &unk_1000383E8;
  __int16 v96 = (const char *)a1;
  int v9 = -2;
LABEL_66:
  LODWORD(v97) = v9;
  IODispatchQueue::DispatchAsync(v8, &v93);
  int v20 = *(_DWORD *)(a1 + 2772);
  *(_DWORD *)(a1 + 2772) = 0;
  if ((v20 & 1) == 0)
  {
    if ((v20 & 2) == 0) {
      goto LABEL_68;
    }
LABEL_73:
    sub_100013B18(a1);
    if ((v20 & 0x80) == 0) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
  sub_1000136E4(a1);
  if ((v20 & 2) != 0) {
    goto LABEL_73;
  }
LABEL_68:
  if ((v20 & 0x80) != 0) {
LABEL_69:
  }
    sub_10001B7AC(a1);
LABEL_70:
  if ((dword_10003C040 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v22 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v22 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v27 = 2;
      }
      else {
        int v27 = 0;
      }
    }
    else
    {
      int v27 = 0;
    }
    int v30 = v22 | v27;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v31 = 4;
      }
      else {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }
    int v34 = v30 | v31;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v35 = 8;
      }
      else {
        int v35 = 0;
      }
    }
    else
    {
      int v35 = 0;
    }
    int v38 = v34 | v35;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v39 = 16;
      }
      else {
        int v39 = 0;
      }
    }
    else
    {
      int v39 = 0;
    }
    int v42 = v38 | v39;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v43 = 32;
      }
      else {
        int v43 = 0;
      }
    }
    else
    {
      int v43 = 0;
    }
    int v46 = v43 | v42;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v47 = 64;
      }
      else {
        int v47 = 0;
      }
    }
    else
    {
      int v47 = 0;
    }
    int v50 = v46 + v47;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v51 = 128;
      }
      else {
        int v51 = 0;
      }
    }
    else
    {
      int v51 = 0;
    }
    LODWORD(v93) = 67109634;
    HIDWORD(v93) = v50 + v51;
    LOWORD(v94) = 2080;
    *(void *)((char *)&v94 + 2) = "updateAdminStatus";
    WORD5(v94) = 1024;
    HIDWORD(v94) = 216;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==>\n", (uint8_t *)&v93, 0x18u);
  }
}

void sub_1000136E4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1955))
  {
    int v2 = *(_DWORD *)(a1 + 696);
    if ((v2 - 7) >= 2)
    {
      if (v2 != 2) {
        goto LABEL_93;
      }
      uint32_t v34 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &v34);
      __dmb(1u);
      if ((v34 & 4) == 0) {
        goto LABEL_93;
      }
    }
    else
    {
      uint32_t v34 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &v34);
      __dmb(1u);
      if ((v34 & 1) == 0) {
        goto LABEL_93;
      }
    }
  }
  if ((*(unsigned int (**)(uint64_t))(a1 + 1424))(a1) == -19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v3 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v3 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v7 = 2;
        }
        else {
          int v7 = 0;
        }
      }
      else
      {
        int v7 = 0;
      }
      int v8 = v3 | v7;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v9 = 4;
        }
        else {
          int v9 = 0;
        }
      }
      else
      {
        int v9 = 0;
      }
      int v10 = v8 | v9;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v11 = 8;
        }
        else {
          int v11 = 0;
        }
      }
      else
      {
        int v11 = 0;
      }
      int v12 = v10 | v11;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v13 = 16;
        }
        else {
          int v13 = 0;
        }
      }
      else
      {
        int v13 = 0;
      }
      int v14 = v12 | v13;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v15 = 32;
        }
        else {
          int v15 = 0;
        }
      }
      else
      {
        int v15 = 0;
      }
      int v16 = v15 | v14;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v17 = 64;
        }
        else {
          int v17 = 0;
        }
      }
      else
      {
        int v17 = 0;
      }
      int v18 = v16 + v17;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v19 = 128;
        }
        else {
          int v19 = 0;
        }
      }
      else
      {
        int v19 = 0;
      }
      uint32_t v34 = 67109634;
      int v35 = v18 + v19;
      __int16 v36 = 2080;
      int v37 = "handleMOD";
      __int16 v38 = 1024;
      int v39 = 438;
      int v20 = "ixgbe: [%x] %s(%d): Unsupported SFP+ module type was detected.\n";
LABEL_92:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v34, 0x18u);
      goto LABEL_93;
    }
    goto LABEL_93;
  }
  uint64_t v4 = 168;
  if (*(_DWORD *)(a1 + 696) == 1) {
    uint64_t v4 = 1440;
  }
  if ((*(unsigned int (**)(uint64_t))(a1 + v4))(a1) == -19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v5 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v5 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v21 = 2;
        }
        else {
          int v21 = 0;
        }
      }
      else
      {
        int v21 = 0;
      }
      int v22 = v5 | v21;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v23 = 4;
        }
        else {
          int v23 = 0;
        }
      }
      else
      {
        int v23 = 0;
      }
      int v24 = v22 | v23;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v25 = 8;
        }
        else {
          int v25 = 0;
        }
      }
      else
      {
        int v25 = 0;
      }
      int v26 = v24 | v25;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v27 = 16;
        }
        else {
          int v27 = 0;
        }
      }
      else
      {
        int v27 = 0;
      }
      int v28 = v26 | v27;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v29 = 32;
        }
        else {
          int v29 = 0;
        }
      }
      else
      {
        int v29 = 0;
      }
      int v30 = v29 | v28;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v31 = 64;
        }
        else {
          int v31 = 0;
        }
      }
      else
      {
        int v31 = 0;
      }
      int v32 = v30 + v31;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v33 = 128;
        }
        else {
          int v33 = 0;
        }
      }
      else
      {
        int v33 = 0;
      }
      uint32_t v34 = 67109634;
      int v35 = v32 + v33;
      __int16 v36 = 2080;
      int v37 = "handleMOD";
      __int16 v38 = 1024;
      int v39 = 443;
      int v20 = "ixgbe: [%x] %s(%d): Setup failure - unsupported SFP+ module type.\n";
      goto LABEL_92;
    }
LABEL_93:
    unsigned int v6 = *(_DWORD *)(a1 + 2772) & 0xFFFFFFFD;
    goto LABEL_94;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 2772) | 2;
LABEL_94:
  *(_DWORD *)(a1 + 2772) = v6;
}

uint64_t sub_100013B18(uint64_t a1)
{
  char v8 = 0;
  *(void *)(a1 + 2752) = ixgbe_get_supported_physical_layer(a1);
  unsigned int v7 = *(_DWORD *)(a1 + 1652);
  if (!v7)
  {
    int v2 = *(void (**)(uint64_t, unsigned int *, char *))(a1 + 288);
    if (v2) {
      v2(a1, &v7, &v8);
    }
  }
  BOOL v3 = *(void (**)(uint64_t, void, uint64_t))(a1 + 264);
  if (v3) {
    v3(a1, v7, 1);
  }
  unsigned int v6 = 256;
  sub_100013BD8(a1, (uint64_t)v5, &v6);
  return (*(uint64_t (**)(void, unsigned char *, void))(**(void **)(a1 + 1960) + 72))(*(void *)(a1 + 1960), v5, v6);
}

uint64_t sub_100013BD8(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v11 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v11 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v13 = 2;
      }
      else {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    int v15 = v11 | v13;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v16 = 4;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v19 = v15 | v16;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v20 = 8;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    int v23 = v19 | v20;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v24 = 16;
      }
      else {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    int v27 = v23 | v24;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v28 = 32;
      }
      else {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }
    int v31 = v28 | v27;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v32 = 64;
      }
      else {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
    }
    int v35 = v31 + v32;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v36 = 128;
      }
      else {
        int v36 = 0;
      }
    }
    else
    {
      int v36 = 0;
    }
    int v39 = 67109634;
    int v40 = v35 + v36;
    __int16 v41 = 2080;
    int v42 = "getSupportedMediaArray";
    __int16 v43 = 1024;
    int v44 = 221;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <==\n", (uint8_t *)&v39, 0x18u);
  }
  *(void *)a2 = 0x2000000022;
  uint64_t v6 = *(void *)(a1 + 2752);
  if (v6)
  {
    *(_DWORD *)(a2 + 8) = 1048629;
    unsigned int v7 = 3;
    if ((v6 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  unsigned int v7 = 2;
  if ((v6 & 2) != 0) {
LABEL_6:
  }
    *(_DWORD *)(a2 + 4 * v7++) = 1048624;
LABEL_7:
  if ((v6 & 4) == 0)
  {
    if ((v6 & 0x8000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  *(_DWORD *)(a2 + 4 * v7++) = 1048614;
  if ((v6 & 0x8000) != 0) {
LABEL_9:
  }
    *(_DWORD *)(a2 + 4 * v7++) = 1048611;
LABEL_10:
  if (*(_DWORD *)(a1 + 696) == 6)
  {
    *(void *)(a2 + 4 * v7) = 0x10003700100036;
    v7 += 2;
  }
  if ((v6 & 0x2008) != 0) {
    *(_DWORD *)(a2 + 4 * v7++) = 1114145;
  }
  if ((v6 & 0x10) != 0)
  {
    *(_DWORD *)(a2 + 4 * v7) = 1048627;
    if (!*(unsigned char *)(a1 + 1673))
    {
      ++v7;
      if ((v6 & 0x40) == 0) {
        goto LABEL_18;
      }
      goto LABEL_24;
    }
    *(_DWORD *)(a2 + 4 * (v7 + 1)) = 1048622;
    v7 += 2;
  }
  if ((v6 & 0x40) == 0)
  {
LABEL_18:
    if ((v6 & 0x4000) == 0)
    {
      unsigned int v8 = v7;
      goto LABEL_27;
    }
    int v9 = 1;
    unsigned int v8 = v7;
    goto LABEL_26;
  }
LABEL_24:
  *(_DWORD *)(a2 + 4 * v7) = 1048626;
  unsigned int v8 = v7 + 1;
  if (!*(unsigned char *)(a1 + 1673)) {
    goto LABEL_27;
  }
  int v9 = 2;
LABEL_26:
  *(_DWORD *)(a2 + 4 * v8) = 1048619;
  unsigned int v8 = v7 + v9;
LABEL_27:
  if ((v6 & 0x100) != 0)
  {
    *(_DWORD *)(a2 + 4 * v8++) = 1048628;
    if ((v6 & 0x800) == 0)
    {
LABEL_29:
      if ((v6 & 0x80) == 0) {
        goto LABEL_30;
      }
      goto LABEL_39;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_29;
  }
  *(_DWORD *)(a2 + 4 * v8++) = 1048635;
  if ((v6 & 0x80) == 0)
  {
LABEL_30:
    if ((v6 & 0x200) == 0) {
      goto LABEL_31;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(a2 + 4 * v8++) = 1048634;
  if ((v6 & 0x200) == 0)
  {
LABEL_31:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_40:
  *(_DWORD *)(a2 + 4 * v8++) = 1048633;
  if ((v6 & 0x10000) != 0) {
LABEL_32:
  }
    *(_DWORD *)(a2 + 4 * v8++) = 1114148;
LABEL_33:
  if (*(_WORD *)(a1 + 1936) == 4296)
  {
    *(void *)(a2 + 4 * v8) = 0x10003000000030;
    v8 += 2;
  }
  *a3 = v8;
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v12 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v12 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v14 = 2;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v17 = v12 | v14;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v18 = 4;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v21 = v17 | v18;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v22 = 8;
      }
      else {
        int v22 = 0;
      }
    }
    else
    {
      int v22 = 0;
    }
    int v25 = v21 | v22;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v26 = 16;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v29 = v25 | v26;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v30 = 32;
      }
      else {
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    int v33 = v30 | v29;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v34 = 64;
      }
      else {
        int v34 = 0;
      }
    }
    else
    {
      int v34 = 0;
    }
    int v37 = v33 + v34;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v38 = 128;
      }
      else {
        int v38 = 0;
      }
    }
    else
    {
      int v38 = 0;
    }
    int v39 = 67109634;
    int v40 = v37 + v38;
    __int16 v41 = 2080;
    int v42 = "getSupportedMediaArray";
    __int16 v43 = 1024;
    int v44 = 316;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==>\n", (uint8_t *)&v39, 0x18u);
  }
  return 0;
}

uint64_t sub_10001411C(uint64_t a1, int a2)
{
  if ((dword_10003C040 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v9 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v9 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v12 = 2;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v14 = v9 | v12;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v15 = 4;
      }
      else {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    int v18 = v14 | v15;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v19 = 8;
      }
      else {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    int v22 = v18 | v19;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v23 = 16;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v26 = v22 | v23;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v27 = 32;
      }
      else {
        int v27 = 0;
      }
    }
    else
    {
      int v27 = 0;
    }
    int v30 = v27 | v26;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v31 = 64;
      }
      else {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }
    int v34 = v30 + v31;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v35 = 128;
      }
      else {
        int v35 = 0;
      }
    }
    else
    {
      int v35 = 0;
    }
    int v38 = 67109890;
    int v39 = v34 + v35;
    __int16 v40 = 2080;
    __int16 v41 = "selMed";
    __int16 v42 = 1024;
    int v43 = 324;
    __int16 v44 = 1024;
    int v45 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <== for type=0%08x\n", (uint8_t *)&v38, 0x1Eu);
  }
  int v4 = a2 & 0xF001F;
  uint64_t result = 1;
  int v6 = 8;
  int v7 = 1032;
  uint64_t v8 = 168;
  switch(a2 & 0xF001F)
  {
    case 0:
    case 0x15:
      goto LABEL_13;
    case 1:
    case 2:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 0xA:
    case 0xC:
    case 0xD:
    case 0xF:
    case 0x11:
    case 0x12:
    case 0x14:
    case 0x18:
      return result;
    case 3:
      uint64_t v8 = 2;
      goto LABEL_13;
    case 6:
      uint64_t v8 = 8;
      goto LABEL_13;
    case 0xB:
    case 0xE:
    case 0x19:
      uint64_t v8 = 32;
      goto LABEL_13;
    case 0x10:
      goto LABEL_11;
    case 0x13:
    case 0x1A:
    case 0x1B:
      goto LABEL_6;
    case 0x16:
      goto LABEL_10;
    case 0x17:
      int v7 = 3080;
LABEL_10:
      int v6 = v7;
LABEL_11:
      uint64_t v8 = v6 | 0x20u;
      goto LABEL_13;
    default:
      if (v4 == 65537)
      {
        uint64_t v8 = 128;
      }
      else
      {
        if (v4 != 65539) {
          return result;
        }
LABEL_6:
        uint64_t v8 = 160;
      }
LABEL_13:
      *(unsigned char *)(a1 + 1284) = 1;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 264))(a1, v8, 1);
      if ((dword_10003C040 & 4) == 0) {
        return 0;
      }
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      uint64_t result = 0;
      if (v10)
      {
        if (qword_10003C000) {
          BOOL v11 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
        }
        else {
          BOOL v11 = 0;
        }
        if (qword_10003C008)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
            int v13 = 2;
          }
          else {
            int v13 = 0;
          }
        }
        else
        {
          int v13 = 0;
        }
        int v16 = v11 | v13;
        if (qword_10003C010)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
            int v17 = 4;
          }
          else {
            int v17 = 0;
          }
        }
        else
        {
          int v17 = 0;
        }
        int v20 = v16 | v17;
        if (qword_10003C018)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
            int v21 = 8;
          }
          else {
            int v21 = 0;
          }
        }
        else
        {
          int v21 = 0;
        }
        int v24 = v20 | v21;
        if (qword_10003C020)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
            int v25 = 16;
          }
          else {
            int v25 = 0;
          }
        }
        else
        {
          int v25 = 0;
        }
        int v28 = v24 | v25;
        if (qword_10003C028)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
            int v29 = 32;
          }
          else {
            int v29 = 0;
          }
        }
        else
        {
          int v29 = 0;
        }
        int v32 = v29 | v28;
        if (qword_10003C030)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
            int v33 = 64;
          }
          else {
            int v33 = 0;
          }
        }
        else
        {
          int v33 = 0;
        }
        int v36 = v32 + v33;
        if (qword_10003C038)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
            int v37 = 128;
          }
          else {
            int v37 = 0;
          }
        }
        else
        {
          int v37 = 0;
        }
        int v38 = 67109634;
        int v39 = v36 + v37;
        __int16 v40 = 2080;
        __int16 v41 = "selMed";
        __int16 v42 = 1024;
        int v43 = 369;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==>\n", (uint8_t *)&v38, 0x18u);
        return 0;
      }
      return result;
  }
}

uint64_t sub_1000145E4(uint64_t a1, int a2)
{
  if ((dword_10003C040 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v5 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v5 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v7 = 2;
      }
      else {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
    int v9 = v5 | v7;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v10 = 4;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v13 = v9 | v10;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v14 = 8;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v17 = v13 | v14;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v18 = 16;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v21 = v17 | v18;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v22 = 32;
      }
      else {
        int v22 = 0;
      }
    }
    else
    {
      int v22 = 0;
    }
    int v25 = v22 | v21;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v26 = 64;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v29 = v25 + v26;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v30 = 128;
      }
      else {
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    int v33 = 67109890;
    int v34 = v29 + v30;
    __int16 v35 = 2080;
    int v36 = "handleChosenMedia";
    __int16 v37 = 1024;
    int v38 = 376;
    __int16 v39 = 1024;
    int v40 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <== (%x)\n", (uint8_t *)&v33, 0x1Eu);
  }
  sub_10001411C(a1, a2);
  sub_100012980(a1);
  if ((dword_10003C040 & 4) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v6 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v6 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v8 = 2;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v11 = v6 | v8;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v12 = 4;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v15 = v11 | v12;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v16 = 8;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v19 = v15 | v16;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v20 = 16;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    int v23 = v19 | v20;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v24 = 32;
      }
      else {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    int v27 = v24 | v23;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v28 = 64;
      }
      else {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }
    int v31 = v27 + v28;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v32 = 128;
      }
      else {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
    }
    int v33 = 67109634;
    int v34 = v31 + v32;
    __int16 v35 = 2080;
    int v36 = "handleChosenMedia";
    __int16 v37 = 1024;
    int v38 = 415;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==>\n", (uint8_t *)&v33, 0x18u);
  }
  return 0;
}

uint64_t sub_10001499C(uint64_t a1)
{
  return IOUserNetworkEthernet::ReportLinkStatus(*(IOUserNetworkEthernet **)(*(void *)(a1 + 32) + 1960), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), 0);
}

uint64_t sub_1000149B4(uint64_t a1)
{
  return IOUserNetworkEthernet::ReportLinkQuality(*(IOUserNetworkEthernet **)(*(void *)(a1 + 32) + 1960), *(_DWORD *)(a1 + 40), 0);
}

uint64_t ixgbe_init_ops_X540(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_ops_X540", 32, "ixgbe_init_ops_X540");
  }
  ixgbe_init_phy_ops_generic(a1);
  uint64_t inited = ixgbe_init_ops_generic(a1);
  *(void *)(a1 + 1720) = ixgbe_init_eeprom_params_X540;
  *(void *)(a1 + 1728) = ixgbe_read_eerd_X540;
  *(void *)(a1 + 1736) = ixgbe_read_eerd_buffer_X540;
  *(void *)(a1 + 1744) = ixgbe_write_eewr_X540;
  *(void *)(a1 + 1752) = ixgbe_write_eewr_buffer_X540;
  *(void *)(a1 + 1768) = ixgbe_update_eeprom_checksum_X540;
  *(void *)(a1 + 1760) = ixgbe_validate_eeprom_checksum_X540;
  *(void *)(a1 + 1776) = ixgbe_calc_eeprom_checksum_X540;
  *(void *)(a1 + 1432) = ixgbe_init_phy_ops_generic;
  *(void *)(a1 + 1440) = 0;
  *(void *)(a1 + 1576) = ixgbe_set_copper_phy_power;
  *(void *)(a1 + 24) = ixgbe_reset_hw_X540;
  *(void *)(a1 + 48) = ixgbe_enable_relaxed_ordering_gen2;
  *(void *)(a1 + 56) = ixgbe_get_media_type_X540;
  *(void *)(a1 + 64) = ixgbe_get_supported_physical_layer_X540;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = 0;
  *(void *)(a1 + 32) = ixgbe_start_hw_X540;
  *(void *)(a1 + 80) = ixgbe_get_san_mac_addr_generic;
  *(void *)(a1 + 88) = ixgbe_set_san_mac_addr_generic;
  *(void *)(a1 + 96) = ixgbe_get_device_caps_generic;
  *(void *)(a1 + 104) = ixgbe_get_wwn_prefix_generic;
  *(void *)(a1 + 112) = ixgbe_get_fcoe_boot_status_generic;
  *(void *)(a1 + 200) = ixgbe_acquire_swfw_sync_X540;
  *(void *)(a1 + 208) = ixgbe_release_swfw_sync_X540;
  *(void *)(a1 + 216) = ixgbe_init_swfw_sync_X540;
  *(void *)(a1 + 184) = ixgbe_disable_sec_rx_path_generic;
  *(void *)(a1 + 192) = ixgbe_enable_sec_rx_path_generic;
  *(void *)(a1 + 384) = ixgbe_set_vmdq_generic;
  *(void *)(a1 + 392) = ixgbe_set_vmdq_san_mac_generic;
  *(void *)(a1 + 400) = ixgbe_clear_vmdq_generic;
  *(void *)(a1 + 376) = ixgbe_insert_mac_addr_generic;
  *(void *)(a1 + 464) = ixgbe_set_vfta_generic;
  *(void *)(a1 + 472) = ixgbe_set_vlvf_generic;
  *(void *)(a1 + 456) = ixgbe_clear_vfta_generic;
  *(void *)(a1 + 488) = ixgbe_init_uta_tables_generic;
  *(void *)(a1 + 496) = ixgbe_set_mac_anti_spoofing;
  *(void *)(a1 + 504) = ixgbe_set_vlan_anti_spoofing;
  *(void *)(a1 + 288) = ixgbe_get_copper_link_capabilities_generic;
  *(void *)(a1 + 264) = ixgbe_setup_mac_link_X540;
  *(void *)(a1 + 304) = ixgbe_set_rxpba_generic;
  *(void *)(a1 + 280) = ixgbe_check_mac_link_generic;
  *(void *)(a1 + 544) = ixgbe_bypass_rw_generic;
  *(void *)(a1 + 552) = ixgbe_bypass_valid_rd_generic;
  *(void *)(a1 + 560) = ixgbe_bypass_set_generic;
  *(void *)(a1 + 568) = ixgbe_bypass_rd_eep_generic;
  *(_OWORD *)(a1 + 1240) = xmmword_1000323F0;
  *(_DWORD *)(a1 + 1264) = 128;
  *(void *)(a1 + 1256) = 0x8000000180;
  *(_WORD *)(a1 + 1280) = ixgbe_get_pcie_msix_count_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 28), &readData);
  __dmb(1u);
  *(unsigned char *)(a1 + 1282) = (readData & 0xE) != 0;
  *(void *)(a1 + 1824) = ixgbe_init_mbx_params_pf;
  *(void *)(a1 + 328) = ixgbe_blink_led_start_X540;
  *(void *)(a1 + 336) = ixgbe_blink_led_stop_X540;
  *(void *)(a1 + 536) = ixgbe_set_fw_drv_ver_generic;
  *(void *)(a1 + 576) = ixgbe_dcb_get_rtrup2tc_generic;
  return inited;
}

uint64_t ixgbe_init_eeprom_params_X540(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_eeprom_params_X540", 335, "ixgbe_init_eeprom_params_X540");
  }
  if (!*(_DWORD *)(a1 + 1784))
  {
    *(void *)(a1 + 1784) = 0xA00000002;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
    __dmb(1u);
    int v2 = 64 << ((readData >> 11) & 0xF);
    *(_WORD *)(a1 + 1792) = v2;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Eeprom params: type = %d, size = %d\n\n", "ixgbe_init_eeprom_params_X540", 348, *(_DWORD *)(a1 + 1784), v2 & 0xFFC0);
    }
  }
  return 0;
}

uint64_t ixgbe_read_eerd_X540(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_eerd_X540", 366, "ixgbe_read_eerd_X540");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1)) {
    return 4294967280;
  }
  uint64_t eerd_generic = ixgbe_read_eerd_generic(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
  return eerd_generic;
}

uint64_t ixgbe_read_eerd_buffer_X540(uint64_t a1, unsigned int a2, int a3, _WORD *a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_eerd_buffer_X540", 392, "ixgbe_read_eerd_buffer_X540");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1)) {
    return 4294967280;
  }
  uint64_t eerd_buffer_generic = ixgbe_read_eerd_buffer_generic(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
  return eerd_buffer_generic;
}

uint64_t ixgbe_write_eewr_X540(uint64_t a1, unsigned int a2, unsigned __int16 a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_eewr_X540", 417, "ixgbe_write_eewr_X540");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1)) {
    return 4294967280;
  }
  uint64_t v7 = ixgbe_write_eewr_generic(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
  return v7;
}

uint64_t ixgbe_write_eewr_buffer_X540(uint64_t a1, unsigned int a2, int a3, unsigned __int16 *a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_eewr_buffer_X540", 443, "ixgbe_write_eewr_buffer_X540");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1)) {
    return 4294967280;
  }
  uint64_t v9 = ixgbe_write_eewr_buffer_generic(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
  return v9;
}

uint64_t ixgbe_update_eeprom_checksum_X540(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_eeprom_checksum_X540", 610, "ixgbe_update_eeprom_checksum_X540");
  }
  __int16 v6 = 0;
  uint64_t v2 = (*(uint64_t (**)(uint64_t, void, __int16 *))(a1 + 1728))(a1, 0, &v6);
  if (v2)
  {
    uint64_t updated = v2;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_eeprom_checksum_X540", 618, "EEPROM read failed\n");
    }
  }
  else if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1))
  {
    return 4294967280;
  }
  else
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(a1 + 1776))(a1);
    uint64_t updated = v4;
    if ((v4 & 0x80000000) == 0)
    {
      __int16 v6 = v4;
      uint64_t updated = ixgbe_write_eewr_generic(a1, 0x3Fu, v4);
      if (!updated) {
        uint64_t updated = ixgbe_update_flash_X540(a1);
      }
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
  }
  return updated;
}

uint64_t ixgbe_validate_eeprom_checksum_X540(uint64_t a1, _WORD *a2)
{
  __int16 v8 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_eeprom_checksum_X540", 549, "ixgbe_validate_eeprom_checksum_X540");
  }
  __int16 v9 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void, __int16 *))(a1 + 1728))(a1, 0, &v9);
  if (v4)
  {
    uint64_t v5 = v4;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_eeprom_checksum_X540", 557, "EEPROM read failed\n");
    }
  }
  else if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1))
  {
    return 4294967280;
  }
  else
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1 + 1776))(a1);
    uint64_t v5 = v6;
    if ((v6 & 0x80000000) == 0)
    {
      __int16 v9 = v6;
      uint64_t v5 = ixgbe_read_eerd_generic(a1, 0x3Fu, &v8);
      if (!v5)
      {
        if (v8 == v9)
        {
          uint64_t v5 = 0;
        }
        else
        {
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): Invalid EEPROM checksum\n", "ixgbe_validate_eeprom_checksum_X540", 583);
          }
          uint64_t v5 = 4294967294;
        }
        if (a2) {
          *a2 = v9;
        }
      }
    }
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
  }
  return v5;
}

uint64_t ixgbe_calc_eeprom_checksum_X540(uint64_t a1)
{
  int v11 = 0;
  __int16 v10 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_X540", 480, "ixgbe_calc_eeprom_checksum_X540");
  }
  __int16 v2 = 0;
  unsigned __int16 v3 = 0;
  do
  {
    unsigned int v4 = v3;
    if (ixgbe_read_eerd_generic(a1, v3, &v10))
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_X540", 487, "EEPROM read failed\n");
      }
      return 0xFFFFFFFFLL;
    }
    v2 += v10;
    ++v3;
  }
  while (v4 < 0x3E);
  unsigned __int16 v5 = 3;
  while (1)
  {
    if ((v5 & 0x7FFE) == 4) {
      goto LABEL_18;
    }
    if (ixgbe_read_eerd_generic(a1, v5, &v11)) {
      break;
    }
    if ((unsigned __int16)(v11 + 1) >= 2u && (unsigned __int16)v11 < *(unsigned __int16 *)(a1 + 1792))
    {
      if (ixgbe_read_eerd_generic(a1, (unsigned __int16)v11, (_WORD *)&v11 + 1))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_X540", 511, "EEPROM read failed\n");
        }
        return 0xFFFFFFFFLL;
      }
      if ((unsigned __int16)(HIWORD(v11) + 1) >= 2u)
      {
        unsigned int v6 = (unsigned __int16)v11 + HIWORD(v11);
        if (v6 < *(unsigned __int16 *)(a1 + 1792))
        {
          for (unsigned __int16 i = v11 + 1; v6 >= i; ++i)
          {
            if (ixgbe_read_eerd_generic(a1, i, &v10))
            {
              if ((dword_10003C040 & 0x100000) != 0) {
                IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_X540", 522, "EEPROM read failed\n");
              }
              return 0xFFFFFFFFLL;
            }
            v2 += v10;
            unsigned int v6 = HIWORD(v11) + (unsigned __int16)v11;
          }
        }
      }
    }
LABEL_18:
    unsigned int v8 = v5++;
    if (v8 >= 0xE) {
      return (unsigned __int16)(-17734 - v2);
    }
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_X540", 501, "EEPROM read failed\n");
  }
  return 0xFFFFFFFFLL;
}

uint64_t ixgbe_reset_hw_X540(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 1644);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_hw_X540", 184, "ixgbe_reset_hw_X540");
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(a1 + 120))(a1);
  if (!v3)
  {
    ixgbe_clear_tx_pending(a1);
    int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, v2);
    if (v4)
    {
LABEL_18:
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): semaphore failed with %d\n", "ixgbe_reset_hw_X540", 198, v4);
      }
      return 4294967280;
    }
    else
    {
      while (1)
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0, &readData);
        __dmb(1u);
        uint32_t v5 = readData | 0x4000000;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0, v5);
        uint32_t v11 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v11);
        __dmb(1u);
        (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v2);
        unsigned int v6 = 0;
        do
        {
          IODelay(1uLL);
          uint32_t v10 = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0, &v10);
          __dmb(1u);
        }
        while ((v10 & 0x4000008) != 0 && v6++ < 9);
        if ((v10 & 0x4000008) != 0)
        {
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): Reset polling failed to complete.\n\n", "ixgbe_reset_hw_X540", 218);
          }
          uint64_t v3 = 4294967281;
        }
        else
        {
          uint64_t v3 = 0;
        }
        IODelay(0x186A0uLL);
        if ((*(unsigned char *)(a1 + 1285) & 1) == 0) {
          break;
        }
        *(unsigned char *)(a1 + 1285) &= ~1u;
        int v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, v2);
        if (v4) {
          goto LABEL_18;
        }
      }
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x3C00uLL, 0x60000u);
      (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, a1 + 706);
      *(_DWORD *)(a1 + 1248) = 128;
      (*(void (**)(uint64_t))(a1 + 408))(a1);
      (*(void (**)(uint64_t, uint64_t))(a1 + 80))(a1, a1 + 712);
      if (!ixgbe_validate_mac_addr((unsigned __int8 *)(a1 + 712)))
      {
        unsigned __int8 v9 = *(unsigned char *)(a1 + 1248) - 1;
        *(unsigned char *)(a1 + 1272) = v9;
        (*(void (**)(uint64_t, void, uint64_t, void, uint64_t))(a1 + 352))(a1, v9, a1 + 712, 0, 0x80000000);
        (*(void (**)(uint64_t, void, uint64_t))(a1 + 400))(a1, *(unsigned __int8 *)(a1 + 1272), 0xFFFFFFFFLL);
        --*(_DWORD *)(a1 + 1248);
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 104))(a1, a1 + 718, a1 + 720);
    }
  }
  return v3;
}

uint64_t ixgbe_get_media_type_X540()
{
  return 4;
}

uint64_t ixgbe_get_supported_physical_layer_X540(uint64_t a1)
{
  unsigned __int16 v3 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_supported_physical_layer_X540", 308, "ixgbe_get_supported_physical_layer_X540");
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 11, 1, &v3);
  return (v3 >> 4) & 2 | (v3 >> 2) & 1 | (v3 >> 5) & 4u;
}

uint64_t ixgbe_start_hw_X540(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_start_hw_X540", 285, "ixgbe_start_hw_X540");
  }
  uint64_t result = ixgbe_start_hw_generic(a1);
  if (!result)
  {
    return ixgbe_start_hw_gen2(a1);
  }
  return result;
}

uint64_t ixgbe_acquire_swfw_sync_X540(uint64_t a1, __int16 a2)
{
  int v4 = 32 * (a2 & 0xF);
  int v5 = a2 & 0x1800;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_swfw_sync_X540", 742, "ixgbe_acquire_swfw_sync_X540");
  }
  int v6 = 16 * (a2 & 1);
  int v7 = a2 & 0x1C0F;
  int v8 = v4 | (4 * v5);
  if (*(int *)(a1 + 696) <= 5) {
    int v9 = 200;
  }
  else {
    int v9 = 1000;
  }
  int v10 = a2 & 0x1C0F | (16 * (a2 & 1)) | v8;
  do
  {
    if (sub_100016434(a1))
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_swfw_sync_X540", 761, "Failed to get NVM access and register semaphore, returning IXGBE_ERR_SWFW_SYNC\n");
      }
      return 4294967280;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 24), &readData);
    __dmb(1u);
    uint32_t v11 = readData;
    if ((readData & v10) == 0)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 24), v11 | v7);
      sub_10001656C(a1);
      return 0;
    }
    sub_10001656C(a1);
    IODelay(0x1388uLL);
    --v9;
  }
  while (v9);
  if (sub_100016434(a1))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_swfw_sync_X540", 787, "Failed to get NVM sempahore and register semaphore while forcefully ignoring FW sempahore bit(s) and setting SW semaphore bit(s), returning IXGBE_ERR_SWFW_SYNC\n");
    }
    return 4294967280;
  }
  uint32_t v15 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 24), &v15);
  __dmb(1u);
  uint32_t v13 = v15;
  if ((v15 & (v8 | v6)) == 0)
  {
    if ((v15 & v7) != 0)
    {
      if (v5) {
        int v14 = 7183;
      }
      else {
        int v14 = 1039;
      }
      ixgbe_release_swfw_sync_X540(a1, v14);
      sub_10001656C(a1);
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_swfw_sync_X540", 812, "Resource not released by other SW, returning IXGBE_ERR_SWFW_SYNC\n");
      }
    }
    else
    {
      sub_10001656C(a1);
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_swfw_sync_X540", 816, "Returning error IXGBE_ERR_SWFW_SYNC\n");
      }
    }
    return 4294967280;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 24), v13 | v7);
  sub_10001656C(a1);
  IODelay(0x1388uLL);
  return 0;
}

void ixgbe_release_swfw_sync_X540(uint64_t a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_release_swfw_sync_X540", 834, "ixgbe_release_swfw_sync_X540");
  }
  if ((a2 & 0x1800) != 0) {
    int v4 = 7183;
  }
  else {
    int v4 = 1039;
  }
  int v5 = v4 & a2;
  sub_100016434(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 24), &readData);
  __dmb(1u);
  uint32_t v6 = readData & ~v5;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 24), v6);
  sub_10001656C(a1);
  IODelay(0x7D0uLL);
}

void ixgbe_init_swfw_sync_X540(uint64_t a1)
{
  sub_100016434(a1);
  sub_10001656C(a1);
  ixgbe_acquire_swfw_sync_X540(a1, 7183);
  ixgbe_release_swfw_sync_X540(a1, 7183);
}

uint64_t ixgbe_setup_mac_link_X540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_mac_link_X540", 167, "ixgbe_setup_mac_link_X540");
  }
  uint32_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1496);
  return v6(a1, a2, a3);
}

uint64_t ixgbe_blink_led_start_X540(uint64_t a1, unsigned int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_blink_led_start_X540", 976, "ixgbe_blink_led_start_X540");
  }
  if (a2 > 3) {
    return 4294967291;
  }
  int v9 = 0;
  char v8 = 0;
  (*(void (**)(uint64_t, int *, char *, void))(a1 + 280))(a1, &v9, &v8, 0);
  if (!v8)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4330uLL, &readData);
    __dmb(1u);
    uint32_t v5 = readData | 0x70001;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4330uLL, v5);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x200uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData & ~(15 << (8 * a2)) | (128 << (8 * a2));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x200uLL, v6);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  uint64_t result = 0;
  __dmb(1u);
  return result;
}

uint64_t ixgbe_blink_led_stop_X540(IOPCIDevice **a1, unsigned int a2)
{
  if (a2 > 3) {
    return 4294967291;
  }
  uint64_t v12 = v2;
  uint64_t v13 = v3;
  char v5 = a2;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_blink_led_stop_X540", 1018, "ixgbe_blink_led_stop_X540");
  }
  uint32_t v11 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x200uLL, &v11);
  __dmb(1u);
  uint32_t v7 = (v11 & ~(15 << (8 * v5)) | (4 << (8 * v5))) & ~(128 << (8 * v5));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x200uLL, v7);
  uint32_t v10 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x4330uLL, &v10);
  __dmb(1u);
  uint32_t v8 = v10 & 0xFFF8FFFE;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x4330uLL, v8);
  uint32_t v9 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v9);
  uint64_t result = 0;
  __dmb(1u);
  return result;
}

uint64_t ixgbe_get_link_capabilities_X540(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  return 0;
}

uint64_t ixgbe_update_flash_X540(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_flash_X540", 658, "ixgbe_update_flash_X540");
  }
  if (sub_100016368(a1) == -1)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_flash_X540", 662, "Flash update time out\n");
    }
    return 0xFFFFFFFFLL;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
  __dmb(1u);
  uint32_t v2 = readData | 0x800000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v2);
  uint64_t v3 = sub_100016368(a1);
  if (v3)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_flash_X540", 673, "Flash update time out\n");
    }
  }
  else if ((dword_10003C040 & 0x100000) != 0)
  {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_flash_X540", 671, "Flash update complete\n");
  }
  if (*(_DWORD *)(a1 + 696) == 4 && !*(unsigned char *)(a1 + 1944))
  {
    uint32_t v6 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &v6);
    __dmb(1u);
    uint32_t v5 = v6;
    if ((v6 & 0x2000000) != 0)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v5 | 0x800000);
    }
    if (!sub_100016368(a1))
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_flash_X540", 685, "Flash update complete\n");
      }
      return 0;
    }
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_flash_X540", 687, "Flash update time out\n");
    }
    return 0xFFFFFFFFLL;
  }
  return v3;
}

uint64_t sub_100016368(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_poll_flash_update_done_X540", 706, "ixgbe_poll_flash_update_done_X540");
  }
  int v2 = 20000;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
    __dmb(1u);
    if ((readData & 0x4000000) != 0) {
      return 0;
    }
    IODelay(0x1388uLL);
    --v2;
  }
  while (v2);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): Flash update status polling timed out\n", "ixgbe_poll_flash_update_done_X540", 719);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100016434(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_swfw_sync_semaphore", 861, "ixgbe_get_swfw_sync_semaphore");
  }
  int v2 = 2000;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 20), &readData);
    __dmb(1u);
    if ((readData & 1) == 0) {
      break;
    }
    IODelay(0x32uLL);
    if (!--v2)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Software semaphore SMBI between device drivers not granted.\n\n", "ixgbe_get_swfw_sync_semaphore", 900);
      }
      return 0xFFFFFFFFLL;
    }
  }
  int v3 = 2000;
  do
  {
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 24), &v5);
    __dmb(1u);
    if ((v5 & 0x80000000) == 0) {
      return 0;
    }
    IODelay(0x32uLL);
    --v3;
  }
  while (v3);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): REGSMP Software NVM semaphore not granted.\n\n", "ixgbe_get_swfw_sync_semaphore", 893);
  }
  sub_10001656C(a1);
  return 0xFFFFFFFFLL;
}

void sub_10001656C(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_release_swfw_sync_semaphore", 916, "ixgbe_release_swfw_sync_semaphore");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 24), &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0x7FFFFFFF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 24), v2);
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 20), &v5);
  __dmb(1u);
  uint32_t v3 = v5 & 0xFFFFFFFE;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 20), v3);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v4);
  __dmb(1u);
}

uint64_t sub_100016660(uint64_t a1, IOService *a2)
{
  uint64_t v4 = 3758097088;
  int v54 = 1;
  IOParseBootArgNumber("ixgbe", &v54, 4);
  if (!v54) {
    return 3758097084;
  }
  properties = 0;
  if (IOService::CopyProperties(a2, &properties, 0)) {
    sub_100031B0C();
  }
  Object = OSDictionary::getObject(properties, "device-id");
  uint32_t v6 = (const OSData *)OSMetaClassBase::safeMetaCast(Object, gOSDataMetaClass);
  uint64_t v7 = 0;
  int v8 = *(_DWORD *)OSData::getBytesNoCopy(v6);
  while (dword_100038408[v7] != v8)
  {
    v7 += 4;
    if (v7 == 180)
    {
      if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        if (qword_10003C000) {
          BOOL v9 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
        }
        else {
          BOOL v9 = 0;
        }
        if (qword_10003C008)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
            int v18 = 2;
          }
          else {
            int v18 = 0;
          }
        }
        else
        {
          int v18 = 0;
        }
        int v20 = v9 | v18;
        if (qword_10003C010)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
            int v21 = 4;
          }
          else {
            int v21 = 0;
          }
        }
        else
        {
          int v21 = 0;
        }
        int v24 = v20 | v21;
        if (qword_10003C018)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
            int v25 = 8;
          }
          else {
            int v25 = 0;
          }
        }
        else
        {
          int v25 = 0;
        }
        int v28 = v24 | v25;
        if (qword_10003C020)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
            int v29 = 16;
          }
          else {
            int v29 = 0;
          }
        }
        else
        {
          int v29 = 0;
        }
        int v32 = v28 | v29;
        if (qword_10003C028)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
            int v33 = 32;
          }
          else {
            int v33 = 0;
          }
        }
        else
        {
          int v33 = 0;
        }
        int v36 = v33 | v32;
        if (qword_10003C030)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
            int v37 = 64;
          }
          else {
            int v37 = 0;
          }
        }
        else
        {
          int v37 = 0;
        }
        int v40 = v36 + v37;
        if (qword_10003C038)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
            int v41 = 128;
          }
          else {
            int v41 = 0;
          }
        }
        else
        {
          int v41 = 0;
        }
        int v45 = 67109890;
        int v46 = v40 + v41;
        __int16 v47 = 2080;
        int v48 = "probe";
        __int16 v49 = 1024;
        int v50 = 102;
        __int16 v51 = 1024;
        LODWORD(v52) = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): not handling dev_id 0x%x\n", (uint8_t *)&v45, 0x1Eu);
      }
      goto LABEL_19;
    }
  }
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v17 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v17 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v19 = 2;
      }
      else {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    int v22 = v17 | v19;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v23 = 4;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v26 = v22 | v23;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v27 = 8;
      }
      else {
        int v27 = 0;
      }
    }
    else
    {
      int v27 = 0;
    }
    int v30 = v26 | v27;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v31 = 16;
      }
      else {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }
    int v34 = v30 | v31;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v35 = 32;
      }
      else {
        int v35 = 0;
      }
    }
    else
    {
      int v35 = 0;
    }
    int v38 = v35 | v34;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v39 = 64;
      }
      else {
        int v39 = 0;
      }
    }
    else
    {
      int v39 = 0;
    }
    int v42 = v38 + v39;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v43 = 128;
      }
      else {
        int v43 = 0;
      }
    }
    else
    {
      int v43 = 0;
    }
    uint64_t v44 = *(void *)&dword_100038408[v7 + 2];
    int v45 = 67109890;
    int v46 = v42 + v43;
    __int16 v47 = 2080;
    int v48 = "probe";
    __int16 v49 = 1024;
    int v50 = 76;
    __int16 v51 = 2080;
    uint64_t v52 = v44;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): %s\n", (uint8_t *)&v45, 0x22u);
  }
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a1;
  *(_WORD *)(a1 + 1938) = -32634;
  *(_WORD *)(a1 + 1936) = v8;
  uint32_t v10 = OSDictionary::getObject(properties, "subsystem-vendor-id");
  uint32_t v11 = (const OSData *)OSMetaClassBase::safeMetaCast(v10, gOSDataMetaClass);
  if (v11) {
    *(_WORD *)(a1 + 1942) = *(_DWORD *)OSData::getBytesNoCopy(v11);
  }
  uint64_t v12 = OSDictionary::getObject(properties, "subsystem-id");
  uint64_t v13 = (const OSData *)OSMetaClassBase::safeMetaCast(v12, gOSDataMetaClass);
  if (v13) {
    *(_WORD *)(a1 + 1940) = *(_DWORD *)OSData::getBytesNoCopy(v13);
  }
  int v14 = OSDictionary::getObject(properties, "revision-id");
  uint32_t v15 = (const OSData *)OSMetaClassBase::safeMetaCast(v14, gOSDataMetaClass);
  *(unsigned char *)(a1 + 1944) = *(_DWORD *)OSData::getBytesNoCopy(v15);
  if (properties)
  {
    ((void (*)(OSDictionary *))properties->release)(properties);
    properties = 0;
  }
  properties = OSDictionaryCreate();
  OSDictionarySetStringValue(properties, "IOVendor", "Intel");
  OSDictionarySetStringValue(properties, "IOModel", *(const char **)&dword_100038408[v7 + 2]);
  IOService::SetProperties(*(IOService **)(a1 + 1960), properties, 0);
  uint64_t v4 = 0;
LABEL_19:
  if (properties) {
    ((void (*)(OSDictionary *))properties->release)(properties);
  }
  return v4;
}

uint64_t sub_100016BEC(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x18uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData | 0x10000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x18uLL, v2);
  uint64_t inited = ixgbe_init_shared_code(a1);
  if (inited)
  {
    uint64_t v4 = inited;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_274:
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x18uLL, &readData);
      __dmb(1u);
      uint32_t v98 = readData & 0xEFFFFFFF;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x18uLL, v98);
      return v4;
    }
    if (qword_10003C000) {
      BOOL v5 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v5 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v8 = 2;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v9 = v5 | v8;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v10 = 4;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v11 = v9 | v10;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v12 = 8;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v13 = v11 | v12;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v14 = 16;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v15 = v13 | v14;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v16 = 32;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v17 = v16 | v15;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v18 = 64;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v19 = v17 + v18;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v20 = 128;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    uint32_t readData = 67109634;
    int v145 = v19 + v20;
    __int16 v146 = 2080;
    v147 = "start";
    __int16 v148 = 1024;
    int v149 = 118;
    int v21 = "ixgbe: [%x] %s(%d): Unable to initialize the shared code\n";
LABEL_49:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&readData, 0x18u);
    goto LABEL_274;
  }
  uint32_t v6 = *(void (**)(uint64_t))(a1 + 1824);
  if (v6) {
    v6(a1);
  }
  if (*(_DWORD *)(a1 + 696) != 1) {
    *(_DWORD *)(a1 + 1668) = 1;
  }
  *(unsigned char *)(a1 + 1953) = 1;
  LOWORD(readData) = 0;
  ixgbe_get_device_caps(a1);
  BOOL v7 = 1;
  if ((readData & 4) == 0) {
    BOOL v7 = (readData & 8) != 0 && *(_WORD *)(a1 + 1812) == 0;
  }
  *(unsigned char *)(a1 + 1954) = v7;
  *(unsigned char *)(a1 + 2765) = v7;
  ixgbe_init_swfw_semaphore(a1);
  *(unsigned char *)(a1 + 1674) = 1;
  uint64_t v22 = ixgbe_reset_hw(a1);
  *(unsigned char *)(a1 + 1674) = 0;
  if (v22)
  {
    uint64_t v4 = v22;
    if (v22 == -19)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        if (qword_10003C000) {
          BOOL v24 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
        }
        else {
          BOOL v24 = 0;
        }
        if (qword_10003C008)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
            int v27 = 2;
          }
          else {
            int v27 = 0;
          }
        }
        else
        {
          int v27 = 0;
        }
        int v31 = v24 | v27;
        if (qword_10003C010)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
            int v32 = 4;
          }
          else {
            int v32 = 0;
          }
        }
        else
        {
          int v32 = 0;
        }
        int v37 = v31 | v32;
        if (qword_10003C018)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
            int v38 = 8;
          }
          else {
            int v38 = 0;
          }
        }
        else
        {
          int v38 = 0;
        }
        int v43 = v37 | v38;
        if (qword_10003C020)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
            int v44 = 16;
          }
          else {
            int v44 = 0;
          }
        }
        else
        {
          int v44 = 0;
        }
        int v49 = v43 | v44;
        if (qword_10003C028)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
            int v50 = 32;
          }
          else {
            int v50 = 0;
          }
        }
        else
        {
          int v50 = 0;
        }
        int v55 = v50 | v49;
        if (qword_10003C030)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
            int v56 = 64;
          }
          else {
            int v56 = 0;
          }
        }
        else
        {
          int v56 = 0;
        }
        int v61 = v55 + v56;
        if (qword_10003C038)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
            int v62 = 128;
          }
          else {
            int v62 = 0;
          }
        }
        else
        {
          int v62 = 0;
        }
        uint32_t readData = 67109634;
        int v145 = v61 + v62;
        __int16 v146 = 2080;
        v147 = "start";
        __int16 v148 = 1024;
        int v149 = 150;
        int v71 = "ixgbe: [%x] %s(%d): Unsupported SFP+ module detected!\n";
        goto LABEL_272;
      }
LABEL_273:
      uint64_t v4 = 4294967277;
      goto LABEL_274;
    }
    if (v22 != -20)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_274;
      }
      if (qword_10003C000) {
        BOOL v25 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v25 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v28 = 2;
        }
        else {
          int v28 = 0;
        }
      }
      else
      {
        int v28 = 0;
      }
      int v33 = v25 | v28;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v34 = 4;
        }
        else {
          int v34 = 0;
        }
      }
      else
      {
        int v34 = 0;
      }
      int v39 = v33 | v34;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v40 = 8;
        }
        else {
          int v40 = 0;
        }
      }
      else
      {
        int v40 = 0;
      }
      int v45 = v39 | v40;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v46 = 16;
        }
        else {
          int v46 = 0;
        }
      }
      else
      {
        int v46 = 0;
      }
      int v51 = v45 | v46;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v52 = 32;
        }
        else {
          int v52 = 0;
        }
      }
      else
      {
        int v52 = 0;
      }
      int v57 = v52 | v51;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v58 = 64;
        }
        else {
          int v58 = 0;
        }
      }
      else
      {
        int v58 = 0;
      }
      int v63 = v57 + v58;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v64 = 128;
        }
        else {
          int v64 = 0;
        }
      }
      else
      {
        int v64 = 0;
      }
      uint32_t readData = 67109634;
      int v145 = v63 + v64;
      __int16 v146 = 2080;
      v147 = "start";
      __int16 v148 = 1024;
      int v149 = 153;
      int v21 = "ixgbe: [%x] %s(%d): Hardware initialization failed\n";
      goto LABEL_49;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v23 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v23 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v26 = 2;
        }
        else {
          int v26 = 0;
        }
      }
      else
      {
        int v26 = 0;
      }
      int v29 = v23 | v26;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v30 = 4;
        }
        else {
          int v30 = 0;
        }
      }
      else
      {
        int v30 = 0;
      }
      int v35 = v29 | v30;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v36 = 8;
        }
        else {
          int v36 = 0;
        }
      }
      else
      {
        int v36 = 0;
      }
      int v41 = v35 | v36;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v42 = 16;
        }
        else {
          int v42 = 0;
        }
      }
      else
      {
        int v42 = 0;
      }
      int v47 = v41 | v42;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v48 = 32;
        }
        else {
          int v48 = 0;
        }
      }
      else
      {
        int v48 = 0;
      }
      int v53 = v48 | v47;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v54 = 64;
        }
        else {
          int v54 = 0;
        }
      }
      else
      {
        int v54 = 0;
      }
      int v59 = v53 + v54;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v60 = 128;
        }
        else {
          int v60 = 0;
        }
      }
      else
      {
        int v60 = 0;
      }
      uint32_t readData = 67109634;
      int v145 = v59 + v60;
      __int16 v146 = 2080;
      v147 = "start";
      __int16 v148 = 1024;
      int v149 = 146;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): IXGBE_ERR_SFP_NOT_PRESENT\n", (uint8_t *)&readData, 0x18u);
    }
    *(unsigned char *)(a1 + 2766) = 1;
  }
  if ((ixgbe_validate_eeprom_checksum(a1) & 0x80000000) != 0)
  {
    uint64_t v4 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v67 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v67 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v72 = 2;
        }
        else {
          int v72 = 0;
        }
      }
      else
      {
        int v72 = 0;
      }
      int v73 = v67 | v72;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v74 = 4;
        }
        else {
          int v74 = 0;
        }
      }
      else
      {
        int v74 = 0;
      }
      int v75 = v73 | v74;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v76 = 8;
        }
        else {
          int v76 = 0;
        }
      }
      else
      {
        int v76 = 0;
      }
      int v77 = v75 | v76;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v78 = 16;
        }
        else {
          int v78 = 0;
        }
      }
      else
      {
        int v78 = 0;
      }
      int v79 = v77 | v78;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v80 = 32;
        }
        else {
          int v80 = 0;
        }
      }
      else
      {
        int v80 = 0;
      }
      int v81 = v80 | v79;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v82 = 64;
        }
        else {
          int v82 = 0;
        }
      }
      else
      {
        int v82 = 0;
      }
      int v83 = v81 + v82;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v84 = 128;
        }
        else {
          int v84 = 0;
        }
      }
      else
      {
        int v84 = 0;
      }
      uint32_t readData = 67109634;
      int v145 = v83 + v84;
      __int16 v146 = 2080;
      v147 = "start";
      __int16 v148 = 1024;
      int v149 = 159;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): The EEPROM Checksum Is Not Valid\n", (uint8_t *)&readData, 0x18u);
      uint64_t v4 = 0;
    }
    goto LABEL_274;
  }
  uint64_t started = ixgbe_start_hw(a1);
  if (started == -19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v68 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v68 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v85 = 2;
        }
        else {
          int v85 = 0;
        }
      }
      else
      {
        int v85 = 0;
      }
      int v86 = v68 | v85;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v87 = 4;
        }
        else {
          int v87 = 0;
        }
      }
      else
      {
        int v87 = 0;
      }
      int v88 = v86 | v87;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v89 = 8;
        }
        else {
          int v89 = 0;
        }
      }
      else
      {
        int v89 = 0;
      }
      int v90 = v88 | v89;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v91 = 16;
        }
        else {
          int v91 = 0;
        }
      }
      else
      {
        int v91 = 0;
      }
      int v92 = v90 | v91;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v93 = 32;
        }
        else {
          int v93 = 0;
        }
      }
      else
      {
        int v93 = 0;
      }
      int v94 = v93 | v92;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v95 = 64;
        }
        else {
          int v95 = 0;
        }
      }
      else
      {
        int v95 = 0;
      }
      int v96 = v94 + v95;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v97 = 128;
        }
        else {
          int v97 = 0;
        }
      }
      else
      {
        int v97 = 0;
      }
      uint32_t readData = 67109634;
      int v145 = v96 + v97;
      __int16 v146 = 2080;
      v147 = "start";
      __int16 v148 = 1024;
      int v149 = 169;
      int v71 = "ixgbe: [%x] %s(%d): Unsupported SFP+ Module\n";
LABEL_272:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v71, (uint8_t *)&readData, 0x18u);
      goto LABEL_273;
    }
    goto LABEL_273;
  }
  uint64_t v4 = started;
  if (started == -20)
  {
    if ((dword_10003C040 & 1) == 0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_186;
    }
    if (qword_10003C000) {
      BOOL v101 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v101 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v116 = 2;
      }
      else {
        int v116 = 0;
      }
    }
    else
    {
      int v116 = 0;
    }
    int v119 = v101 | v116;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v120 = 4;
      }
      else {
        int v120 = 0;
      }
    }
    else
    {
      int v120 = 0;
    }
    int v123 = v119 | v120;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v124 = 8;
      }
      else {
        int v124 = 0;
      }
    }
    else
    {
      int v124 = 0;
    }
    int v127 = v123 | v124;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v128 = 16;
      }
      else {
        int v128 = 0;
      }
    }
    else
    {
      int v128 = 0;
    }
    int v131 = v127 | v128;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v132 = 32;
      }
      else {
        int v132 = 0;
      }
    }
    else
    {
      int v132 = 0;
    }
    int v135 = v132 | v131;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v136 = 64;
      }
      else {
        int v136 = 0;
      }
    }
    else
    {
      int v136 = 0;
    }
    int v139 = v135 + v136;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v140 = 128;
      }
      else {
        int v140 = 0;
      }
    }
    else
    {
      int v140 = 0;
    }
    uint32_t readData = 67109634;
    int v145 = v139 + v140;
    __int16 v146 = 2080;
    v147 = "start";
    __int16 v148 = 1024;
    int v149 = 172;
    v141 = "ixgbe: [%x] %s(%d): No SFP+ Module found\n";
  }
  else
  {
    if (started != -24
      || (dword_10003C040 & 1) == 0
      || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      goto LABEL_186;
    }
    if (qword_10003C000) {
      BOOL v66 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v66 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v115 = 2;
      }
      else {
        int v115 = 0;
      }
    }
    else
    {
      int v115 = 0;
    }
    int v117 = v66 | v115;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v118 = 4;
      }
      else {
        int v118 = 0;
      }
    }
    else
    {
      int v118 = 0;
    }
    int v121 = v117 | v118;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v122 = 8;
      }
      else {
        int v122 = 0;
      }
    }
    else
    {
      int v122 = 0;
    }
    int v125 = v121 | v122;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v126 = 16;
      }
      else {
        int v126 = 0;
      }
    }
    else
    {
      int v126 = 0;
    }
    int v129 = v125 | v126;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v130 = 32;
      }
      else {
        int v130 = 0;
      }
    }
    else
    {
      int v130 = 0;
    }
    int v133 = v130 | v129;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v134 = 64;
      }
      else {
        int v134 = 0;
      }
    }
    else
    {
      int v134 = 0;
    }
    int v137 = v133 + v134;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v138 = 128;
      }
      else {
        int v138 = 0;
      }
    }
    else
    {
      int v138 = 0;
    }
    uint32_t readData = 67109634;
    int v145 = v137 + v138;
    __int16 v146 = 2080;
    v147 = "start";
    __int16 v148 = 1024;
    int v149 = 166;
    v141 = "ixgbe: [%x] %s(%d): This device is a pre-production adapter/LOM.\n";
  }
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v141, (uint8_t *)&readData, 0x18u);
LABEL_186:
  int v143 = 0;
  char v142 = 0;
  int v69 = *(uint64_t (**)(uint64_t, int *, char *))(a1 + 288);
  if (v69) {
    uint64_t v4 = v69(a1, &v143, &v142);
  }
  if (v4)
  {
    if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v100 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v100 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v102 = 2;
        }
        else {
          int v102 = 0;
        }
      }
      else
      {
        int v102 = 0;
      }
      int v103 = v100 | v102;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v104 = 4;
        }
        else {
          int v104 = 0;
        }
      }
      else
      {
        int v104 = 0;
      }
      int v105 = v103 | v104;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v106 = 8;
        }
        else {
          int v106 = 0;
        }
      }
      else
      {
        int v106 = 0;
      }
      int v107 = v105 | v106;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v108 = 16;
        }
        else {
          int v108 = 0;
        }
      }
      else
      {
        int v108 = 0;
      }
      int v109 = v107 | v108;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v110 = 32;
        }
        else {
          int v110 = 0;
        }
      }
      else
      {
        int v110 = 0;
      }
      int v111 = v110 | v109;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v112 = 64;
        }
        else {
          int v112 = 0;
        }
      }
      else
      {
        int v112 = 0;
      }
      int v113 = v111 + v112;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v114 = 128;
        }
        else {
          int v114 = 0;
        }
      }
      else
      {
        int v114 = 0;
      }
      uint32_t readData = 67109634;
      int v145 = v113 + v114;
      __int16 v146 = 2080;
      v147 = "start";
      __int16 v148 = 1024;
      int v149 = 184;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): Unable to determine supported advertise speeds\n", (uint8_t *)&readData, 0x18u);
    }
    *(unsigned char *)(a1 + 1284) = 1;
    (*(void (**)(uint64_t, void, uint64_t))(a1 + 264))(a1, 0, 1);
  }
  else
  {
    *(unsigned char *)(a1 + 1284) = 1;
    (*(void (**)(uint64_t, void, uint64_t))(a1 + 264))(a1, 0, 1);
    int v70 = *(void (**)(uint64_t))(a1 + 248);
    if (v70) {
      v70(a1);
    }
    ixgbe_set_phy_power(a1);
    uint64_t v4 = 0;
    *(void *)(a1 + 2752) = ixgbe_get_supported_physical_layer(a1);
    *(void *)(a1 + 1404) = 0x300000003;
    *(_WORD *)(a1 + 2032) = 257;
  }
  return v4;
}

void sub_100017D00(uint64_t a1, unint64_t data)
{
  unsigned int v2 = *(_DWORD *)(a1 + 696);
  if (v2 > 8) {
    return;
  }
  if (((1 << v2) & 0x1D4) == 0)
  {
    if (v2 != 1) {
      return;
    }
    LODWORD(v5) = (unsigned __int16)data;
    __dmb(2u);
    uint32_t v6 = *(IOPCIDevice **)a1;
    uint64_t v7 = 2176;
    goto LABEL_9;
  }
  if (data)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xAA0uLL, data);
  }
  unint64_t v5 = HIDWORD(data);
  if (HIDWORD(data))
  {
    __dmb(2u);
    uint32_t v6 = *(IOPCIDevice **)a1;
    uint64_t v7 = 2724;
LABEL_9:
    IOPCIDevice::MemoryWrite32(v6, 0, v7, v5);
  }
}

void sub_100017DB4(uint64_t a1)
{
  v20[0] = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x898uLL, v20);
  __dmb(1u);
  uint32_t v2 = v20[0];
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v6 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v6 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v7 = 2;
      }
      else {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
    int v8 = v6 | v7;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v9 = 4;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    int v10 = v8 | v9;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v11 = 8;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    int v12 = v10 | v11;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v13 = 16;
      }
      else {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    int v14 = v12 | v13;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v15 = 32;
      }
      else {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    int v16 = v15 | v14;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v17 = 64;
      }
      else {
        int v17 = 0;
      }
    }
    else
    {
      int v17 = 0;
    }
    int v18 = v16 + v17;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v19 = 128;
      }
      else {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    v20[0] = 67109890;
    v20[1] = v18 + v19;
    __int16 v21 = 2080;
    uint64_t v22 = "configGPIE";
    __int16 v23 = 1024;
    int v24 = 257;
    __int16 v25 = 1024;
    uint32_t v26 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <== gpie=0x%08x\n", (uint8_t *)v20, 0x1Eu);
  }
  *(unsigned char *)(a1 + 2748) = 1;
  int v3 = *(_DWORD *)(a1 + 696);
  unsigned int v4 = v2 | 0xC0000036;
  if (v3 != 2) {
    unsigned int v4 = v2 | 0xC0000030;
  }
  if ((v3 - 7) >= 2) {
    uint32_t v5 = v4;
  }
  else {
    uint32_t v5 = v2 | 0xC0000032;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x898uLL, v5);
}

void sub_100018010(uint64_t a1, int a2, int a3)
{
  uint32_t v6 = -1072693248;
  switch(*(_DWORD *)(a1 + 696))
  {
    case 2:
      uint32_t v6 = -686817280;
      break;
    case 4:
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x10148uLL, &readData);
      __dmb(1u);
      if (readData) {
        uint32_t v6 = -795869184;
      }
      else {
        uint32_t v6 = -804257792;
      }
      break;
    case 6:
      uint32_t v6 = -795869184;
      break;
    case 7:
    case 8:
      if (*(unsigned __int16 *)(a1 + 1936) - 5548 <= 0x22
        && ((1 << (*(_WORD *)(a1 + 1936) + 84)) & 0x401000003) != 0)
      {
        uint32_t v6 = *(_DWORD *)(*(void *)(a1 + 1928) + 44) | 0xC0100000;
      }
      if (*(_DWORD *)(a1 + 1616) == 7) {
        int v8 = v6 | 0x2000000;
      }
      else {
        int v8 = v6;
      }
      uint32_t v6 = v8 | 0x10000000;
      break;
    default:
      break;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x880uLL, v6);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x810uLL, 0x4000FFFFu);
  if (a2) {
    sub_100017D00(a1, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a3)
  {
    uint32_t v9 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v9);
    __dmb(1u);
  }
}

void sub_10001818C(uint64_t a1)
{
  if ((dword_10003C040 & 0x400) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v5 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v5 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v7 = 2;
      }
      else {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
    int v9 = v5 | v7;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v10 = 4;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v13 = v9 | v10;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v14 = 8;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v17 = v13 | v14;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v18 = 16;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v21 = v17 | v18;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v22 = 32;
      }
      else {
        int v22 = 0;
      }
    }
    else
    {
      int v22 = 0;
    }
    int v25 = v22 | v21;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v26 = 64;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v29 = v25 + v26;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v30 = 128;
      }
      else {
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    uint32_t v33 = 67109634;
    int v34 = v29 + v30;
    __int16 v35 = 2080;
    int v36 = "disableIntrs";
    __int16 v37 = 1024;
    int v38 = 366;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <==\n", (uint8_t *)&v33, 0x18u);
  }
  *(unsigned char *)(a1 + 2748) = 0;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x810uLL, 0);
  int v2 = *(_DWORD *)(a1 + 696);
  __dmb(2u);
  int v3 = *(IOPCIDevice **)a1;
  if (v2 == 1)
  {
    uint64_t v4 = 2184;
  }
  else
  {
    IOPCIDevice::MemoryWrite32(v3, 0, 0x888uLL, 0xFFFF0000);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xAB0uLL, 0xFFFFFFFF);
    __dmb(2u);
    int v3 = *(IOPCIDevice **)a1;
    uint64_t v4 = 2740;
  }
  IOPCIDevice::MemoryWrite32(v3, 0, v4, 0xFFFFFFFF);
  uint32_t v33 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v33);
  __dmb(1u);
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v6 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v6 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v8 = 2;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v11 = v6 | v8;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v12 = 4;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v15 = v11 | v12;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v16 = 8;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v19 = v15 | v16;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v20 = 16;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    int v23 = v19 | v20;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v24 = 32;
      }
      else {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    int v27 = v24 | v23;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v28 = 64;
      }
      else {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }
    int v31 = v27 + v28;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v32 = 128;
      }
      else {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
    }
    uint32_t v33 = 67109634;
    int v34 = v31 + v32;
    __int16 v35 = 2080;
    int v36 = "disableIntrs";
    __int16 v37 = 1024;
    int v38 = 382;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==>\n", (uint8_t *)&v33, 0x18u);
  }
}

void sub_1000185B4(uint64_t a1, int a2, char a3, int a4)
{
  unsigned int v4 = *(_DWORD *)(a1 + 696);
  if (v4 <= 8)
  {
    unsigned __int8 v6 = a3 | 0x80;
    if (((1 << v4) & 0x1D4) != 0)
    {
      if (a4 == -1)
      {
        char v10 = 8 * (a2 & 1);
        uint32_t v15 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0xA00uLL, &v15);
        __dmb(1u);
        uint32_t v9 = v15 & ~(255 << v10) | (v6 << v10);
        __dmb(2u);
        int v11 = *(IOPCIDevice **)a1;
        uint64_t v12 = 2560;
LABEL_12:
        IOPCIDevice::MemoryWrite32(v11, 0, v12, v9);
        return;
      }
      char v7 = 16 * (a2 & 1) + 8 * a4;
      uint32_t readData = 0;
      uint64_t v8 = ((2 * a2) & 0x1FCu) + 2304;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v8, &readData);
      __dmb(1u);
      uint32_t v9 = readData & ~(255 << v7) | (v6 << v7);
      __dmb(2u);
    }
    else
    {
      if (v4 != 1) {
        return;
      }
      if (a4 == -1) {
        char v13 = 97;
      }
      else {
        char v13 = a2 + ((_BYTE)a4 << 6);
      }
      uint32_t v16 = 0;
      uint64_t v8 = v13 & 0x7C | 0x900u;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v8, &v16);
      __dmb(1u);
      uint32_t v9 = v16 & ~(255 << (8 * (v13 & 3))) | (v6 << (8 * (v13 & 3)));
      __dmb(2u);
    }
    int v11 = *(IOPCIDevice **)a1;
    uint64_t v12 = v8;
    goto LABEL_12;
  }
}

void sub_100018728(uint64_t a1)
{
  *(_WORD *)(a1 + 2768) = 1000;
  sub_1000185B4(a1, 1, 0, -1);
  if (*(unsigned char *)(a1 + 2033))
  {
    int v2 = 0;
    unsigned int v3 = 0;
    do
    {
      unsigned int v4 = v3 + 1;
      sub_1000185B4(a1, v3, v3 + 1, 0);
      __dmb(2u);
      if (v3 >= 0x17) {
        uint64_t v5 = (v2 + 74404);
      }
      else {
        uint64_t v5 = (v2 + 2084);
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5, 0x79Eu);
      v2 += 4;
      ++v3;
    }
    while (v4 < *(unsigned __int8 *)(a1 + 2033));
  }
  if (*(unsigned char *)(a1 + 2032))
  {
    unsigned int v6 = 0;
    do
    {
      unsigned int v7 = v6 + 1;
      sub_1000185B4(a1, v6, v6 + 1, 1);
      unsigned int v6 = v7;
    }
    while (v7 < *(unsigned __int8 *)(a1 + 2032));
  }
}

uint64_t sub_10001880C(uint64_t a1)
{
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v21 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v21 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v23 = 2;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v25 = v21 | v23;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v26 = 4;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v29 = v25 | v26;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v30 = 8;
      }
      else {
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    int v33 = v29 | v30;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v34 = 16;
      }
      else {
        int v34 = 0;
      }
    }
    else
    {
      int v34 = 0;
    }
    int v37 = v33 | v34;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v38 = 32;
      }
      else {
        int v38 = 0;
      }
    }
    else
    {
      int v38 = 0;
    }
    int v41 = v38 | v37;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v42 = 64;
      }
      else {
        int v42 = 0;
      }
    }
    else
    {
      int v42 = 0;
    }
    int v45 = v41 + v42;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v46 = 128;
      }
      else {
        int v46 = 0;
      }
    }
    else
    {
      int v46 = 0;
    }
    uint32_t readData = 67109634;
    int v51 = v45 + v46;
    __int16 v52 = 2080;
    int v53 = "initReceiveUnit";
    __int16 v54 = 1024;
    int v55 = 446;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <==\n", (uint8_t *)&readData, 0x18u);
  }
  ixgbe_disable_rx(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x5080uLL, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 696) == 1) {
    int v2 = 13312;
  }
  else {
    int v2 = 1024;
  }
  uint32_t v3 = v2 | readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5080uLL, v3);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4240uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & 0xFFFFFFFB;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4240uLL, v4);
  if (*(unsigned char *)(a1 + 2033))
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    unsigned int v49 = (*(_DWORD *)(a1 + 2744) + 1023) >> 10;
    unsigned int v7 = (uint32_t *)(a1 + 2664);
    do
    {
      __dmb(2u);
      int v8 = v6 << 6;
      if (v6 >= 0x40) {
        int v9 = 49152;
      }
      else {
        int v9 = 4096;
      }
      if (v6 >= 0x40) {
        int v10 = 49156;
      }
      else {
        int v10 = 4100;
      }
      if (v6 >= 0x40) {
        int v11 = 49160;
      }
      else {
        int v11 = 4104;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v9 + v5) & 0xFFFFFFC0, *v7);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v10 + v5) & 0xFFFFFFC4, v7[1]);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v11 + v5) & 0xFFFFFFC8, 0x1000u);
      uint32_t readData = 0;
      unsigned int v12 = v5 + 49172;
      if (v6 <= 0x3F) {
        unsigned int v12 = v8 + 4116;
      }
      if (v6 <= 0xF) {
        uint64_t v13 = (4 * v6 + 8448);
      }
      else {
        uint64_t v13 = v12;
      }
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v13, &readData);
      __dmb(1u);
      if (*(unsigned __int8 *)(a1 + 2033) < 2u || *(_DWORD *)(a1 + 1408)) {
        uint32_t v14 = readData & 0xEDFFC080 | v49 & 0xEDFFFFFF | 0x2000000;
      }
      else {
        uint32_t v14 = readData & 0xFDFFC080 | v49 | 0x12000000;
      }
      __dmb(2u);
      unsigned int v15 = v5 + 49172;
      if (v6 <= 0x3F) {
        unsigned int v15 = v8 + 4116;
      }
      if (v6 <= 0xF) {
        uint64_t v16 = (4 * v6 + 8448);
      }
      else {
        uint64_t v16 = v15;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v16, v14);
      __dmb(2u);
      uint64_t v17 = 49168;
      if (v6 >= 0x40)
      {
        uint64_t v18 = 49176;
      }
      else
      {
        uint64_t v17 = 4112;
        uint64_t v18 = 4120;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v17 + v5) & 0xFFFFFFD0, *(v7 - 36));
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v18 + v5) & 0xFFFFFFD8, *(v7 - 35));
      ++v6;
      v5 += 64;
      v7 += 88;
    }
    while (v6 < *(unsigned __int8 *)(a1 + 2033));
  }
  if (*(_DWORD *)(a1 + 696) != 1)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5480uLL, 0x330u);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x5000uLL, &readData);
  __dmb(1u);
  uint32_t v19 = readData;
  if (*(unsigned __int8 *)(a1 + 2033) > 1u) {
    uint32_t v19 = readData | 0x2000;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5000uLL, ~(v19 >> 1) & 0x1000 | v19);
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v22 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v22 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v24 = 2;
      }
      else {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    int v27 = v22 | v24;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v28 = 4;
      }
      else {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }
    int v31 = v27 | v28;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v32 = 8;
      }
      else {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
    }
    int v35 = v31 | v32;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v36 = 16;
      }
      else {
        int v36 = 0;
      }
    }
    else
    {
      int v36 = 0;
    }
    int v39 = v35 | v36;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v40 = 32;
      }
      else {
        int v40 = 0;
      }
    }
    else
    {
      int v40 = 0;
    }
    int v43 = v40 | v39;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v44 = 64;
      }
      else {
        int v44 = 0;
      }
    }
    else
    {
      int v44 = 0;
    }
    int v47 = v43 + v44;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v48 = 128;
      }
      else {
        int v48 = 0;
      }
    }
    else
    {
      int v48 = 0;
    }
    uint32_t readData = 67109890;
    int v51 = v47 + v48;
    __int16 v52 = 2080;
    int v53 = "initReceiveUnit";
    __int16 v54 = 1024;
    int v55 = 530;
    __int16 v56 = 1024;
    int v57 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==> 0x%08x\n", (uint8_t *)&readData, 0x1Eu);
  }
  return 0;
}

uint64_t sub_100018E9C(uint64_t a1)
{
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v14 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v14 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v16 = 2;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v18 = v14 | v16;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v19 = 4;
      }
      else {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    int v22 = v18 | v19;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v23 = 8;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v26 = v22 | v23;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v27 = 16;
      }
      else {
        int v27 = 0;
      }
    }
    else
    {
      int v27 = 0;
    }
    int v30 = v26 | v27;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v31 = 32;
      }
      else {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }
    int v34 = v31 | v30;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v35 = 64;
      }
      else {
        int v35 = 0;
      }
    }
    else
    {
      int v35 = 0;
    }
    int v38 = v34 + v35;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v39 = 128;
      }
      else {
        int v39 = 0;
      }
    }
    else
    {
      int v39 = 0;
    }
    uint32_t v42 = 67109634;
    int v43 = v38 + v39;
    __int16 v44 = 2080;
    int v45 = "initTransmitUnit";
    __int16 v46 = 1024;
    int v47 = 537;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <==\n", (uint8_t *)&v42, 0x18u);
  }
  if (*(unsigned char *)(a1 + 2032))
  {
    unint64_t v2 = 0;
    uint32_t v3 = (uint32_t *)(a1 + 2312);
    uint64_t v4 = 29184;
    uint64_t v5 = 24576;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5, *v3);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5 + 4, v3[1]);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5 + 8, 0x1000u);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5 + 16, *(v3 - 36));
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5 + 24, *(v3 - 35));
      uint64_t v6 = *(void *)v3 + 4096;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5 + 56, v6 | 1);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5 + 60, HIDWORD(v6));
      if (*(_DWORD *)(a1 + 696) == 1)
      {
        uint32_t v42 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v4, &v42);
      }
      else
      {
        uint32_t v42 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v5 + 12, &v42);
      }
      __dmb(1u);
      v3 += 88;
      uint32_t v7 = v42 & 0xFFFFF7FF;
      int v8 = *(_DWORD *)(a1 + 696);
      __dmb(2u);
      if (v8 == 1) {
        uint64_t v9 = v4;
      }
      else {
        uint64_t v9 = v5 + 12;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v9, v7);
      ++v2;
      v4 += 4;
      v5 += 64;
    }
    while (v2 < *(unsigned __int8 *)(a1 + 2032));
  }
  if (*(_DWORD *)(a1 + 696) != 1)
  {
    uint32_t v42 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4A80uLL, &v42);
    __dmb(1u);
    uint32_t v10 = v42 | 1;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4A80uLL, v10);
    uint32_t v42 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4900uLL, &v42);
    __dmb(1u);
    uint32_t v11 = v42;
    uint32_t v12 = v42 | 0x40;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4900uLL, v12);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4900uLL, v11 & 0xFFFFFFBF);
  }
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v15 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v15 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v17 = 2;
      }
      else {
        int v17 = 0;
      }
    }
    else
    {
      int v17 = 0;
    }
    int v20 = v15 | v17;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v21 = 4;
      }
      else {
        int v21 = 0;
      }
    }
    else
    {
      int v21 = 0;
    }
    int v24 = v20 | v21;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v25 = 8;
      }
      else {
        int v25 = 0;
      }
    }
    else
    {
      int v25 = 0;
    }
    int v28 = v24 | v25;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v29 = 16;
      }
      else {
        int v29 = 0;
      }
    }
    else
    {
      int v29 = 0;
    }
    int v32 = v28 | v29;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v33 = 32;
      }
      else {
        int v33 = 0;
      }
    }
    else
    {
      int v33 = 0;
    }
    int v36 = v33 | v32;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v37 = 64;
      }
      else {
        int v37 = 0;
      }
    }
    else
    {
      int v37 = 0;
    }
    int v40 = v36 + v37;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v41 = 128;
      }
      else {
        int v41 = 0;
      }
    }
    else
    {
      int v41 = 0;
    }
    uint32_t v42 = 67109890;
    int v43 = v40 + v41;
    __int16 v44 = 2080;
    int v45 = "initTransmitUnit";
    __int16 v46 = 1024;
    int v47 = 594;
    __int16 v48 = 1024;
    int v49 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==> 0x%08x\n", (uint8_t *)&v42, 0x1Eu);
  }
  return 0;
}

uint64_t sub_100019434(uint64_t a1)
{
  uint64_t v2 = sub_10001E8F0(a1);
  if (v2)
  {
    uint64_t v3 = v2;
    if ((dword_10003C040 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v4 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v4 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v20 = 2;
        }
        else {
          int v20 = 0;
        }
      }
      else
      {
        int v20 = 0;
      }
      int v21 = v4 | v20;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v22 = 4;
        }
        else {
          int v22 = 0;
        }
      }
      else
      {
        int v22 = 0;
      }
      int v23 = v21 | v22;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v24 = 8;
        }
        else {
          int v24 = 0;
        }
      }
      else
      {
        int v24 = 0;
      }
      int v25 = v23 | v24;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v26 = 16;
        }
        else {
          int v26 = 0;
        }
      }
      else
      {
        int v26 = 0;
      }
      int v27 = v25 | v26;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v28 = 32;
        }
        else {
          int v28 = 0;
        }
      }
      else
      {
        int v28 = 0;
      }
      int v29 = v28 | v27;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v30 = 64;
        }
        else {
          int v30 = 0;
        }
      }
      else
      {
        int v30 = 0;
      }
      int v31 = v29 + v30;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v32 = 128;
        }
        else {
          int v32 = 0;
        }
      }
      else
      {
        int v32 = 0;
      }
      uint32_t v48 = 67109890;
      int v49 = v31 + v32;
      __int16 v50 = 2080;
      int v51 = "up";
      __int16 v52 = 1024;
      int v53 = 602;
      __int16 v54 = 1024;
      int v55 = v3;
      int v33 = "ixgbe: [%x] %s(%d): allocateRings failed err=%d\n";
      uint32_t v34 = 30;
LABEL_72:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)&v48, v34);
      return v3;
    }
    return v3;
  }
  ixgbe_init_hw(a1);
  sub_100018E9C(a1);
  sub_10001880C(a1);
  sub_100017DB4(a1);
  if (*(unsigned char *)(a1 + 2032))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 24616;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v6, 0x2000120u);
      ++v5;
      v6 += 64;
    }
    while (v5 < *(unsigned __int8 *)(a1 + 2032));
  }
  if (*(unsigned char *)(a1 + 2033))
  {
    unsigned int v7 = 0;
    do
    {
      uint32_t v48 = 0;
      if (v7 >= 0x40) {
        int v8 = 49192;
      }
      else {
        int v8 = 4136;
      }
      uint64_t v9 = v8 + (v7 << 6);
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v9, &v48);
      __dmb(1u);
      uint32_t v10 = v48;
      if (*(_DWORD *)(a1 + 696) == 1) {
        uint32_t v10 = v48 & 0xFDC00000 | 0x80420;
      }
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v9, v10 | 0x2000000);
      int v11 = 10;
      do
      {
        uint32_t v48 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v9, &v48);
        __dmb(1u);
        if ((v48 & 0x2000000) != 0) {
          break;
        }
        IODelay(0x3E8uLL);
        --v11;
      }
      while (v11);
      __dmb(0xEu);
      ++v7;
    }
    while (v7 < *(unsigned __int8 *)(a1 + 2033));
  }
  uint32_t v48 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3000uLL, &v48);
  __dmb(1u);
  ixgbe_enable_rx_dma(a1);
  sub_100018728(a1);
  int v12 = *(_DWORD *)(a1 + 696);
  __dmb(2u);
  uint64_t v13 = *(IOPCIDevice **)a1;
  if (v12 == 1)
  {
    uint64_t v14 = 2192;
    uint32_t v15 = 0xFFFF;
  }
  else
  {
    IOPCIDevice::MemoryWrite32(v13, 0, 0xAD0uLL, 0xFFFFFFFF);
    __dmb(2u);
    uint64_t v13 = *(IOPCIDevice **)a1;
    uint64_t v14 = 2772;
    uint32_t v15 = -1;
  }
  IOPCIDevice::MemoryWrite32(v13, 0, v14, v15);
  if (*(_DWORD *)(a1 + 1616) != 1)
  {
    uint64_t v3 = 0;
    goto LABEL_30;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(a1 + 1416))(a1);
  if (v3 != -19)
  {
LABEL_30:
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x820uLL, 0xFF8u);
    int v17 = *(_DWORD *)(a1 + 696) - 1;
    if (v17 > 7) {
      uint32_t v18 = 200;
    }
    else {
      uint32_t v18 = dword_100032420[v17];
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x824uLL, v18);
    ixgbe_set_phy_power(a1);
    sub_100019A64(a1);
    sub_100019BB0(a1);
    ixgbe_start_hw(a1);
    sub_100019CB4(a1);
    sub_100018010(a1, 1, 1);
    return v3;
  }
  uint64_t v3 = 3758097084;
  if ((dword_10003C040 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v16 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v16 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v35 = 2;
      }
      else {
        int v35 = 0;
      }
    }
    else
    {
      int v35 = 0;
    }
    int v36 = v16 | v35;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v37 = 4;
      }
      else {
        int v37 = 0;
      }
    }
    else
    {
      int v37 = 0;
    }
    int v38 = v36 | v37;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v39 = 8;
      }
      else {
        int v39 = 0;
      }
    }
    else
    {
      int v39 = 0;
    }
    int v40 = v38 | v39;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v41 = 16;
      }
      else {
        int v41 = 0;
      }
    }
    else
    {
      int v41 = 0;
    }
    int v42 = v40 | v41;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v43 = 32;
      }
      else {
        int v43 = 0;
      }
    }
    else
    {
      int v43 = 0;
    }
    int v44 = v43 | v42;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v45 = 64;
      }
      else {
        int v45 = 0;
      }
    }
    else
    {
      int v45 = 0;
    }
    int v46 = v44 + v45;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v47 = 128;
      }
      else {
        int v47 = 0;
      }
    }
    else
    {
      int v47 = 0;
    }
    uint32_t v48 = 67109634;
    int v49 = v46 + v47;
    __int16 v50 = 2080;
    int v51 = "up";
    __int16 v52 = 1024;
    int v53 = 692;
    int v33 = "ixgbe: [%x] %s(%d): Unsupported SFP+ module type was detected.\n";
    uint32_t v34 = 24;
    goto LABEL_72;
  }
  return v3;
}

uint64_t sub_100019A64(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 696);
  if ((v2 - 7) < 2)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(result + 56))(result);
    if (result == 1) {
      goto LABEL_7;
    }
LABEL_11:
    if (!*(void *)(v1 + 280) || (uint64_t result = ixgbe_check_link(v1), !result))
    {
      unsigned int v6 = *(_DWORD *)(v1 + 1652);
      if (v6
        || (BOOL v4 = *(uint64_t (**)(uint64_t, unsigned int *, char *))(v1 + 288)) == 0
        || (char v5 = 0, result = v4(v1, &v6, &v5), !result))
      {
        if (*(_DWORD *)(v1 + 696) == 6 && !*(_DWORD *)(v1 + 1652)) {
          v6 &= 0xFFFFF3FF;
        }
        uint64_t v3 = *(uint64_t (**)(uint64_t, void, void))(v1 + 264);
        if (v3) {
          return v3(v1, v6, *(unsigned __int8 *)(v1 + 2764));
        }
      }
    }
    return result;
  }
  if (v2 == 2)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(result + 56))(result);
    if (((result - 1) & 0xFFFFFFFD) == 0) {
      goto LABEL_7;
    }
    goto LABEL_11;
  }
  if (v2 != 1 || *(_DWORD *)(result + 1616) != 12) {
    goto LABEL_11;
  }
LABEL_7:
  *(_DWORD *)(v1 + 2772) |= 1u;
  return sub_100012980(v1);
}

void sub_100019BB0(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 2744);
  int v3 = *(_DWORD *)(a1 + 696) - 4;
  if (v3 > 4) {
    int v4 = 2009376;
  }
  else {
    int v4 = dword_100032440[v3];
  }
  unsigned int v5 = (v4 + 288 * v2) / 0x19u + 16 * v2 + 0x2000;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3C00uLL, &readData);
  __dmb(1u);
  *(_DWORD *)(a1 + 1332) = (readData >> 10) - (v5 >> 13);
  int v6 = *(_DWORD *)(a1 + 696) - 4;
  if (v6 > 4)
  {
    int v8 = 28802;
    LOBYTE(v7) = 5;
  }
  else
  {
    int v7 = dword_100032454[v6];
    int v8 = dword_100032468[v6];
  }
  *(_DWORD *)(a1 + 1364) = ((v2 << v7) + v8 + 0x1FFF) >> 13;
  *(_WORD *)(a1 + 1396) = -1;
  *(unsigned char *)(a1 + 1398) = 1;
}

uint64_t sub_100019CB4(uint64_t result)
{
  if (*(int *)(result + 696) >= 6)
  {
    uint64_t v1 = result;
    int v2 = *(uint64_t (**)(uint64_t))(result + 632);
    if (v2)
    {
      int v3 = *(unsigned __int16 *)(result + 2768);
      if (*(unsigned __int16 *)(result + 1288) == v3)
      {
        int v4 = *(_DWORD *)(result + 2760);
        if (*(_DWORD *)(result + 1292) == v4) {
          return result;
        }
      }
      else
      {
        int v4 = *(_DWORD *)(result + 2760);
      }
      *(_WORD *)(result + 1288) = v3;
      *(unsigned char *)(result + 1290) = 0;
      *(_DWORD *)(result + 1292) = v4;
      *(unsigned char *)(result + 1297) = 1;
      if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        if (qword_10003C000) {
          BOOL v5 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
        }
        else {
          BOOL v5 = 0;
        }
        if (qword_10003C008)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
            int v6 = 2;
          }
          else {
            int v6 = 0;
          }
        }
        else
        {
          int v6 = 0;
        }
        int v7 = v5 | v6;
        if (qword_10003C010)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
            int v8 = 4;
          }
          else {
            int v8 = 0;
          }
        }
        else
        {
          int v8 = 0;
        }
        int v9 = v7 | v8;
        if (qword_10003C018)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
            int v10 = 8;
          }
          else {
            int v10 = 0;
          }
        }
        else
        {
          int v10 = 0;
        }
        int v11 = v9 | v10;
        if (qword_10003C020)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
            int v12 = 16;
          }
          else {
            int v12 = 0;
          }
        }
        else
        {
          int v12 = 0;
        }
        int v13 = v11 | v12;
        if (qword_10003C028)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
            int v14 = 32;
          }
          else {
            int v14 = 0;
          }
        }
        else
        {
          int v14 = 0;
        }
        int v15 = v14 | v13;
        if (qword_10003C030)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
            int v16 = 64;
          }
          else {
            int v16 = 0;
          }
        }
        else
        {
          int v16 = 0;
        }
        int v17 = v15 + v16;
        if (qword_10003C038)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
            int v18 = 128;
          }
          else {
            int v18 = 0;
          }
        }
        else
        {
          int v18 = 0;
        }
        int v19 = *(unsigned __int16 *)(v1 + 1288);
        int v20 = *(_DWORD *)(v1 + 1292);
        v21[0] = 67110146;
        v21[1] = v17 + v18;
        __int16 v22 = 2080;
        int v23 = "configDMAC";
        __int16 v24 = 1024;
        int v25 = 958;
        __int16 v26 = 1024;
        int v27 = v19;
        __int16 v28 = 1024;
        int v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): dmac settings: watchdog %d, link speed %d\n", (uint8_t *)v21, 0x24u);
        return (*(uint64_t (**)(uint64_t))(v1 + 632))(v1);
      }
      else
      {
        return v2(v1);
      }
    }
  }
  return result;
}

uint64_t sub_100019F08(uint64_t a1)
{
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v3 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v3 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v5 = 2;
      }
      else {
        int v5 = 0;
      }
    }
    else
    {
      int v5 = 0;
    }
    int v7 = v3 | v5;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v8 = 4;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v11 = v7 | v8;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v12 = 8;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v15 = v11 | v12;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v16 = 16;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v19 = v15 | v16;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v20 = 32;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    int v23 = v20 | v19;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v24 = 64;
      }
      else {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    int v27 = v23 + v24;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v28 = 128;
      }
      else {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }
    int v31 = 67109634;
    int v32 = v27 + v28;
    __int16 v33 = 2080;
    uint32_t v34 = "down";
    __int16 v35 = 1024;
    int v36 = 763;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <==\n", (uint8_t *)&v31, 0x18u);
  }
  sub_10001818C(a1);
  if (!*(unsigned char *)(a1 + 1954)) {
    ixgbe_set_phy_power(a1);
  }
  if (*(_WORD *)(a1 + 1936) == 5549 && *(void *)(a1 + 1584))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5810uLL, 0xFFFFFFFF);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5808uLL, 2u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5800uLL, 0x12u);
    *(unsigned char *)(a1 + 1648) = 1;
    ixgbe_reset_hw(a1);
    ixgbe_stop_adapter(a1);
    if (*(_DWORD *)(a1 + 696) == 2) {
      ixgbe_stop_mac_link_on_d3_82599(a1);
    }
    ixgbe_disable_tx_laser(a1);
    *(unsigned char *)(a1 + 2764) = 0;
    sub_100012980(a1);
    (*(void (**)(uint64_t))(a1 + 1584))(a1);
    *(unsigned char *)(a1 + 1648) = 0;
  }
  else
  {
    ixgbe_reset_hw(a1);
    *(unsigned char *)(a1 + 1945) = 0;
    ixgbe_stop_adapter(a1);
    if (*(_DWORD *)(a1 + 696) == 2) {
      ixgbe_stop_mac_link_on_d3_82599(a1);
    }
    ixgbe_disable_tx_laser(a1);
    *(unsigned char *)(a1 + 2764) = 0;
    sub_100012980(a1);
  }
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v4 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v4 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v6 = 2;
      }
      else {
        int v6 = 0;
      }
    }
    else
    {
      int v6 = 0;
    }
    int v9 = v4 | v6;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v10 = 4;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v13 = v9 | v10;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v14 = 8;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v17 = v13 | v14;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v18 = 16;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v21 = v17 | v18;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v22 = 32;
      }
      else {
        int v22 = 0;
      }
    }
    else
    {
      int v22 = 0;
    }
    int v25 = v22 | v21;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v26 = 64;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v29 = v25 + v26;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v30 = 128;
      }
      else {
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    int v31 = 67109890;
    int v32 = v29 + v30;
    __int16 v33 = 2080;
    uint32_t v34 = "down";
    __int16 v35 = 1024;
    int v36 = 818;
    __int16 v37 = 1024;
    int v38 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==> 0x%08x\n", (uint8_t *)&v31, 0x1Eu);
  }
  return 0;
}

uint64_t sub_10001A3B8(IOPCIDevice **a1, int a2)
{
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v7 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v7 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v9 = 2;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    int v11 = v7 | v9;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v12 = 4;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v15 = v11 | v12;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v16 = 8;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v19 = v15 | v16;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v20 = 16;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    int v23 = v19 | v20;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v24 = 32;
      }
      else {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    int v27 = v24 | v23;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v28 = 64;
      }
      else {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }
    int v31 = v27 + v28;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v32 = 128;
      }
      else {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
    }
    uint32_t v35 = 67109890;
    int v36 = v31 + v32;
    __int16 v37 = 2080;
    int v38 = "setPromiscuousModeEnable";
    __int16 v39 = 1024;
    int v40 = 825;
    __int16 v41 = 1024;
    int v42 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <== enable=%d\n", (uint8_t *)&v35, 0x1Eu);
  }
  uint32_t v35 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x5080uLL, &v35);
  __dmb(1u);
  uint32_t v4 = v35 & 0xFFFFFCFF;
  if (a2) {
    int v5 = 768;
  }
  else {
    int v5 = 0;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x5080uLL, v4 | v5);
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v8 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v8 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v10 = 2;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v13 = v8 | v10;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v14 = 4;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v17 = v13 | v14;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v18 = 8;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v21 = v17 | v18;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v22 = 16;
      }
      else {
        int v22 = 0;
      }
    }
    else
    {
      int v22 = 0;
    }
    int v25 = v21 | v22;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v26 = 32;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v29 = v26 | v25;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v30 = 64;
      }
      else {
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    int v33 = v29 + v30;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v34 = 128;
      }
      else {
        int v34 = 0;
      }
    }
    else
    {
      int v34 = 0;
    }
    uint32_t v35 = 67109634;
    int v36 = v33 + v34;
    __int16 v37 = 2080;
    int v38 = "setPromiscuousModeEnable";
    __int16 v39 = 1024;
    int v40 = 836;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==>\n", (uint8_t *)&v35, 0x18u);
  }
  return 0;
}

uint64_t sub_10001A7A4(IOPCIDevice **a1, int a2)
{
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v7 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v7 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v9 = 2;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    int v11 = v7 | v9;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v12 = 4;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v15 = v11 | v12;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v16 = 8;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v19 = v15 | v16;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v20 = 16;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    int v23 = v19 | v20;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v24 = 32;
      }
      else {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    int v27 = v24 | v23;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v28 = 64;
      }
      else {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }
    int v31 = v27 + v28;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v32 = 128;
      }
      else {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
    }
    uint32_t v35 = 67109890;
    int v36 = v31 + v32;
    __int16 v37 = 2080;
    int v38 = "setAllMulticastModeEnable";
    __int16 v39 = 1024;
    int v40 = 842;
    __int16 v41 = 1024;
    int v42 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <== enable=%d\n", (uint8_t *)&v35, 0x1Eu);
  }
  uint32_t v35 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x5080uLL, &v35);
  __dmb(1u);
  uint32_t v4 = v35 & 0xFFFFFEFF;
  if (a2) {
    int v5 = 256;
  }
  else {
    int v5 = 0;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x5080uLL, v4 | v5);
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v8 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v8 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v10 = 2;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v13 = v8 | v10;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v14 = 4;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v17 = v13 | v14;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v18 = 8;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v21 = v17 | v18;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v22 = 16;
      }
      else {
        int v22 = 0;
      }
    }
    else
    {
      int v22 = 0;
    }
    int v25 = v21 | v22;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v26 = 32;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v29 = v26 | v25;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v30 = 64;
      }
      else {
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    int v33 = v29 + v30;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v34 = 128;
      }
      else {
        int v34 = 0;
      }
    }
    else
    {
      int v34 = 0;
    }
    uint32_t v35 = 67109634;
    int v36 = v33 + v34;
    __int16 v37 = 2080;
    int v38 = "setAllMulticastModeEnable";
    __int16 v39 = 1024;
    int v40 = 853;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==>\n", (uint8_t *)&v35, 0x18u);
  }
  return 0;
}

uint64_t sub_10001AB90(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v6 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v6 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v8 = 2;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v10 = v6 | v8;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v11 = 4;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    int v14 = v10 | v11;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v15 = 8;
      }
      else {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    int v18 = v14 | v15;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v19 = 16;
      }
      else {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    int v22 = v18 | v19;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v23 = 32;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v26 = v23 | v22;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v27 = 64;
      }
      else {
        int v27 = 0;
      }
    }
    else
    {
      int v27 = 0;
    }
    int v30 = v26 + v27;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v31 = 128;
      }
      else {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }
    int v34 = 67109890;
    int v35 = v30 + v31;
    __int16 v36 = 2080;
    __int16 v37 = "setMcastAddresses";
    __int16 v38 = 1024;
    int v39 = 859;
    __int16 v40 = 1024;
    unsigned int v41 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <== mcnt=%d\n", (uint8_t *)&v34, 0x1Eu);
  }
  if (a3 <= 0x7F) {
    ixgbe_update_mc_addr_list(a1);
  }
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v7 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v7 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v9 = 2;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    int v12 = v7 | v9;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v13 = 4;
      }
      else {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    int v16 = v12 | v13;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v17 = 8;
      }
      else {
        int v17 = 0;
      }
    }
    else
    {
      int v17 = 0;
    }
    int v20 = v16 | v17;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v21 = 16;
      }
      else {
        int v21 = 0;
      }
    }
    else
    {
      int v21 = 0;
    }
    int v24 = v20 | v21;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v25 = 32;
      }
      else {
        int v25 = 0;
      }
    }
    else
    {
      int v25 = 0;
    }
    int v28 = v25 | v24;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v29 = 64;
      }
      else {
        int v29 = 0;
      }
    }
    else
    {
      int v29 = 0;
    }
    int v32 = v28 + v29;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v33 = 128;
      }
      else {
        int v33 = 0;
      }
    }
    else
    {
      int v33 = 0;
    }
    int v34 = 67109634;
    int v35 = v32 + v33;
    __int16 v36 = 2080;
    __int16 v37 = "setMcastAddresses";
    __int16 v38 = 1024;
    int v39 = 878;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==>\n", (uint8_t *)&v34, 0x18u);
  }
  return 0;
}

void sub_10001AF70(uint64_t a1)
{
  uint64_t v1 = a1;
  int v2 = *(_DWORD *)(a1 + 2520);
  int v3 = *(_DWORD *)(a1 + 2524);
  readData[0] = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x1018uLL, readData);
  __dmb(1u);
  uint32_t v4 = readData[0];
  readData[0] = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v1, 0, 0x1010uLL, readData);
  __dmb(1u);
  uint32_t v5 = readData[0];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v6 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v6 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v7 = 2;
      }
      else {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
    int v8 = v6 | v7;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v9 = 4;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    int v10 = v8 | v9;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v11 = 8;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    int v12 = v10 | v11;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v13 = 16;
      }
      else {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    int v14 = v12 | v13;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v15 = 32;
      }
      else {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    int v16 = v15 | v14;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v17 = 64;
      }
      else {
        int v17 = 0;
      }
    }
    else
    {
      int v17 = 0;
    }
    int v18 = v16 + v17;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v19 = 128;
      }
      else {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    readData[0] = 67110658;
    readData[1] = v18 + v19;
    LOWORD(readData[2]) = 2080;
    *(void *)((char *)&readData[2] + 2) = "logState";
    HIWORD(readData[4]) = 1024;
    readData[5] = 974;
    LOWORD(readData[6]) = 1024;
    *(uint32_t *)((char *)&readData[6] + 2) = v4;
    HIWORD(readData[7]) = 1024;
    LODWORD(v79) = v5;
    WORD2(v79) = 1024;
    *(_DWORD *)((char *)&v79 + 6) = v3;
    WORD5(v79) = 1024;
    HIDWORD(v79) = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): RDT=0x%04x RDH=0x%04x tail=0x%04x head=0x%04x\n", (uint8_t *)readData, 0x30u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v20 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v20 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v21 = 2;
      }
      else {
        int v21 = 0;
      }
    }
    else
    {
      int v21 = 0;
    }
    int v22 = v20 | v21;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v23 = 4;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v24 = v22 | v23;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v25 = 8;
      }
      else {
        int v25 = 0;
      }
    }
    else
    {
      int v25 = 0;
    }
    int v26 = v24 | v25;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v27 = 16;
      }
      else {
        int v27 = 0;
      }
    }
    else
    {
      int v27 = 0;
    }
    int v28 = v26 | v27;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v29 = 32;
      }
      else {
        int v29 = 0;
      }
    }
    else
    {
      int v29 = 0;
    }
    int v30 = v29 | v28;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v31 = 64;
      }
      else {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }
    int v32 = v30 + v31;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v33 = 128;
      }
      else {
        int v33 = 0;
      }
    }
    else
    {
      int v33 = 0;
    }
    readData[0] = 67109634;
    readData[1] = v32 + v33;
    LOWORD(readData[2]) = 2080;
    *(void *)((char *)&readData[2] + 2) = "logState";
    HIWORD(readData[4]) = 1024;
    readData[5] = 976;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d):    : 0               1               2               3\n", (uint8_t *)readData, 0x18u);
  }
  unint64_t v34 = 0;
  uint64_t v35 = 8;
  uint64_t v67 = v1;
  do
  {
    uint64_t v36 = 0;
    char v81 = 0;
    long long v79 = 0u;
    long long v80 = 0u;
    memset(readData, 0, sizeof(readData));
    __int16 v37 = (char *)(*(void *)(v1 + 2656) + v35);
    do
    {
      char v38 = *v37;
      v37 += 16;
      *((unsigned char *)readData + v36++) = v38 & 1 | 0x30;
    }
    while (v36 != 64);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v39 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v39 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v40 = 2;
        }
        else {
          int v40 = 0;
        }
      }
      else
      {
        int v40 = 0;
      }
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v41 = 4;
        }
        else {
          int v41 = 0;
        }
      }
      else
      {
        int v41 = 0;
      }
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v42 = 8;
        }
        else {
          int v42 = 0;
        }
      }
      else
      {
        int v42 = 0;
      }
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v43 = 16;
        }
        else {
          int v43 = 0;
        }
      }
      else
      {
        int v43 = 0;
      }
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v44 = 32;
        }
        else {
          int v44 = 0;
        }
      }
      else
      {
        int v44 = 0;
      }
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v45 = 64;
        }
        else {
          int v45 = 0;
        }
      }
      else
      {
        int v45 = 0;
      }
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v46 = 128;
        }
        else {
          int v46 = 0;
        }
      }
      else
      {
        int v46 = 0;
      }
      *(_DWORD *)buf = 67110146;
      int v69 = (v44 | v39 | v40 | v41 | v42 | v43) + v45 + v46;
      __int16 v70 = 2080;
      int v71 = "logState";
      __int16 v72 = 1024;
      int v73 = 981;
      __int16 v74 = 1024;
      int v75 = v34;
      __int16 v76 = 2080;
      int v77 = readData;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): %03x: %s\n", buf, 0x28u);
      uint64_t v1 = v67;
    }
    v35 += 1024;
    BOOL v47 = v34 >= 0xC0;
    v34 += 64;
  }
  while (!v47);
  int v48 = *(_DWORD *)(v1 + 2168);
  int v49 = *(_DWORD *)(v1 + 2172);
  readData[0] = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v1, 0, 0x6018uLL, readData);
  __dmb(1u);
  uint32_t v50 = readData[0];
  readData[0] = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)v1, 0, 0x6010uLL, readData);
  __dmb(1u);
  uint32_t v51 = readData[0];
  __dmb(1u);
  int v52 = *(_DWORD *)(*(void *)(v1 + 2304) + 4096);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v53 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v53 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v54 = 2;
      }
      else {
        int v54 = 0;
      }
    }
    else
    {
      int v54 = 0;
    }
    int v55 = v53 | v54;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v56 = 4;
      }
      else {
        int v56 = 0;
      }
    }
    else
    {
      int v56 = 0;
    }
    int v57 = v55 | v56;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v58 = 8;
      }
      else {
        int v58 = 0;
      }
    }
    else
    {
      int v58 = 0;
    }
    int v59 = v57 | v58;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v60 = 16;
      }
      else {
        int v60 = 0;
      }
    }
    else
    {
      int v60 = 0;
    }
    int v61 = v59 | v60;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v62 = 32;
      }
      else {
        int v62 = 0;
      }
    }
    else
    {
      int v62 = 0;
    }
    int v63 = v62 | v61;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v64 = 64;
      }
      else {
        int v64 = 0;
      }
    }
    else
    {
      int v64 = 0;
    }
    int v65 = v63 + v64;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v66 = 128;
      }
      else {
        int v66 = 0;
      }
    }
    else
    {
      int v66 = 0;
    }
    readData[0] = 67110914;
    readData[1] = v65 + v66;
    LOWORD(readData[2]) = 2080;
    *(void *)((char *)&readData[2] + 2) = "logState";
    HIWORD(readData[4]) = 1024;
    readData[5] = 993;
    LOWORD(readData[6]) = 1024;
    *(uint32_t *)((char *)&readData[6] + 2) = v50;
    HIWORD(readData[7]) = 1024;
    LODWORD(v79) = v51;
    WORD2(v79) = 1024;
    *(_DWORD *)((char *)&v79 + 6) = v49;
    WORD5(v79) = 1024;
    HIDWORD(v79) = v48;
    LOWORD(v80) = 1024;
    *(_DWORD *)((char *)&v80 + 2) = v52;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): TDT=0x%04x TDH=0x%04x tail=0x%04x head=0x%04x WBH=0x%04x\n", (uint8_t *)readData, 0x36u);
  }
}

void sub_10001B7AC(uint64_t a1)
{
  sub_10001AF70(a1);
  int v2 = *(IODispatchQueue **)(a1 + 1976);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001B83C;
  block[3] = &unk_1000386F8;
  block[4] = a1;
  IODispatchQueue::DispatchAsync(v2, block);
}

void sub_10001B83C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(IODispatchQueue **)(v1 + 1984);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001B8C0;
  block[3] = &unk_1000386D8;
  block[4] = v1;
  IODispatchQueue::DispatchSync(v2, block);
}

uint64_t sub_10001B8C0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 2748))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v2 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v2 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v3 = 2;
        }
        else {
          int v3 = 0;
        }
      }
      else
      {
        int v3 = 0;
      }
      int v4 = v2 | v3;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v5 = 4;
        }
        else {
          int v5 = 0;
        }
      }
      else
      {
        int v5 = 0;
      }
      int v6 = v4 | v5;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v7 = 8;
        }
        else {
          int v7 = 0;
        }
      }
      else
      {
        int v7 = 0;
      }
      int v8 = v6 | v7;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v9 = 16;
        }
        else {
          int v9 = 0;
        }
      }
      else
      {
        int v9 = 0;
      }
      int v10 = v8 | v9;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v11 = 32;
        }
        else {
          int v11 = 0;
        }
      }
      else
      {
        int v11 = 0;
      }
      int v12 = v11 | v10;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v13 = 64;
        }
        else {
          int v13 = 0;
        }
      }
      else
      {
        int v13 = 0;
      }
      int v14 = v12 + v13;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v15 = 128;
        }
        else {
          int v15 = 0;
        }
      }
      else
      {
        int v15 = 0;
      }
      v16[0] = 67109634;
      v16[1] = v14 + v15;
      __int16 v17 = 2080;
      int v18 = "handleReset_block_invoke_2";
      __int16 v19 = 1024;
      int v20 = 1005;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): Reset adapter\n", (uint8_t *)v16, 0x18u);
    }
    sub_100020EAC((IOUserNetworkPacketQueue **)v1);
    return sub_100020C54((IOUserNetworkPacketQueue **)v1);
  }
  return result;
}

unsigned __int8 *sub_10001BAA4(uint64_t a1, unsigned __int8 **a2, _DWORD *a3)
{
  int v5 = *a2;
  if ((dword_10003C040 & 0x40000000) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v7 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v7 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v8 = 2;
      }
      else {
        int v8 = 0;
      }
    }
    else
    {
      int v8 = 0;
    }
    int v9 = v7 | v8;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v10 = 4;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v11 = v9 | v10;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v12 = 8;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v13 = v11 | v12;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v14 = 16;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v15 = v13 | v14;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v16 = 32;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v17 = v16 | v15;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v18 = 64;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v19 = v17 + v18;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v20 = 128;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    int v21 = *v5;
    int v22 = v5[1];
    int v23 = v5[2];
    int v24 = v5[3];
    int v25 = v5[4];
    int v26 = v5[5];
    v27[0] = 67111170;
    v27[1] = v19 + v20;
    __int16 v28 = 2080;
    int v29 = "operator()";
    __int16 v30 = 1024;
    int v31 = 867;
    __int16 v32 = 1024;
    int v33 = v21;
    __int16 v34 = 1024;
    int v35 = v22;
    __int16 v36 = 1024;
    int v37 = v23;
    __int16 v38 = 1024;
    int v39 = v24;
    __int16 v40 = 1024;
    int v41 = v25;
    __int16 v42 = 1024;
    int v43 = v26;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): mcast addr %02x:%02x:%02x:%02x:%02x:%02x\n", (uint8_t *)v27, 0x3Cu);
  }
  *a3 = 0;
  *a2 = v5 + 6;
  return v5;
}

void ixgbe_set_pcie_completion_timeout(IOPCIDevice **a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x11000uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  if ((readData & 0xF000) == 0)
  {
    if ((readData & 0x40000) != 0)
    {
      uint16_t v3 = 0;
      IOPCIDevice::ConfigurationRead16(*a1, 0xC8uLL, &v3);
      IOPCIDevice::ConfigurationWrite16(*a1, 0xC8uLL, v3 | 5);
    }
    else
    {
      uint32_t v2 = readData | 0x1000;
    }
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x11000uLL, v2 & 0xFFFEFFFF);
}

uint64_t ixgbe_init_ops_82598(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_ops_82598", 91, "ixgbe_init_ops_82598");
  }
  ixgbe_init_phy_ops_generic(a1);
  uint64_t inited = ixgbe_init_ops_generic(a1);
  *(void *)(a1 + 1432) = ixgbe_init_phy_ops_82598;
  *(void *)(a1 + 32) = ixgbe_start_hw_82598;
  *(void *)(a1 + 48) = ixgbe_enable_relaxed_ordering_82598;
  *(void *)(a1 + 24) = sub_10001C3C0;
  *(void *)(a1 + 56) = sub_10001C760;
  *(void *)(a1 + 64) = ixgbe_get_supported_physical_layer_82598;
  *(void *)(a1 + 152) = ixgbe_read_analog_reg8_82598;
  *(void *)(a1 + 160) = ixgbe_write_analog_reg8_82598;
  *(void *)(a1 + 144) = ixgbe_set_lan_id_multi_port_pcie_82598;
  *(void *)(a1 + 176) = ixgbe_enable_rx_dma_82598;
  *(void *)(a1 + 384) = ixgbe_set_vmdq_82598;
  *(void *)(a1 + 400) = sub_10001CE14;
  *(void *)(a1 + 464) = ixgbe_set_vfta_82598;
  *(void *)(a1 + 472) = 0;
  *(void *)(a1 + 456) = sub_10001D020;
  *(void *)(a1 + 512) = ixgbe_fc_enable_82598;
  *(void *)(a1 + 1240) = 0x8000000080;
  *(_DWORD *)(a1 + 1248) = 16;
  *(_DWORD *)(a1 + 1264) = 64;
  *(void *)(a1 + 1256) = 0x2000000200;
  *(_WORD *)(a1 + 1280) = ixgbe_get_pcie_msix_count_generic(a1);
  *(void *)(a1 + 1544) = ixgbe_read_i2c_eeprom_82598;
  *(void *)(a1 + 1536) = sub_10001D464;
  *(void *)(a1 + 280) = sub_10001D474;
  *(void *)(a1 + 256) = 0;
  *(void *)(a1 + 264) = sub_10001D720;
  *(void *)(a1 + 288) = sub_10001D81C;
  *(void *)(a1 + 304) = sub_10001D934;
  *(void *)(a1 + 536) = 0;
  *(void *)(a1 + 576) = 0;
  return inited;
}

uint64_t ixgbe_init_phy_ops_82598(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_phy_ops_82598", 164, "ixgbe_init_phy_ops_82598");
  }
  (*(void (**)(uint64_t))(a1 + 1416))(a1);
  if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) == 4)
  {
    *(void *)(a1 + 264) = sub_10001DA04;
    *(void *)(a1 + 288) = ixgbe_get_copper_link_capabilities_generic;
  }
  int v2 = *(_DWORD *)(a1 + 1616);
  if (v2 == 12)
  {
    *(void *)(a1 + 1440) = ixgbe_reset_phy_nl;
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(a1 + 1424))(a1);
    if (!v3)
    {
      uint64_t v3 = 4294967277;
      if (*(_DWORD *)(a1 + 1628) != 0xFFFF)
      {
        int v5 = 0;
        if (ixgbe_get_sfp_init_sequence_offsets(a1, (unsigned __int16 *)&v5 + 1, (unsigned __int16 *)&v5)) {
          return 4294967277;
        }
        else {
          return 0;
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (v2 == 2)
    {
      *(void *)(a1 + 1480) = ixgbe_setup_phy_link_tnx;
      *(void *)(a1 + 1504) = ixgbe_check_phy_link_tnx;
      *(void *)(a1 + 1512) = ixgbe_get_phy_firmware_version_tnx;
    }
  }
  return v3;
}

uint64_t ixgbe_start_hw_82598(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_start_hw_82598", 226, "ixgbe_start_hw_82598");
  }
  uint64_t started = ixgbe_start_hw_generic(a1);
  if (!started)
  {
    if (*(_DWORD *)(a1 + 1260))
    {
      unint64_t v3 = 0;
      uint64_t v4 = 29184;
      do
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v4, &readData);
        __dmb(1u);
        uint32_t v5 = readData & 0xFFFFF7FF;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v4, v5);
        if (v3 > 0xE) {
          break;
        }
        ++v3;
        v4 += 4;
      }
      while (v3 < *(unsigned int *)(a1 + 1260));
    }
    if (*(_DWORD *)(a1 + 1264))
    {
      unint64_t v6 = 0;
      uint64_t v7 = 8704;
      do
      {
        uint32_t v10 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v7, &v10);
        __dmb(1u);
        uint32_t v8 = v10 & 0xFFFF5FFF;
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v7, v8);
        if (v6 > 0xE) {
          break;
        }
        ++v6;
        v7 += 4;
      }
      while (v6 < *(unsigned int *)(a1 + 1264));
    }
    ixgbe_set_pcie_completion_timeout((IOPCIDevice **)a1);
  }
  return started;
}

void ixgbe_enable_relaxed_ordering_82598(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_enable_relaxed_ordering_82598", 1333, "ixgbe_enable_relaxed_ordering_82598");
  }
  if (*(_DWORD *)(a1 + 1260))
  {
    unint64_t v2 = 0;
    uint64_t v3 = 29184;
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v3, &readData);
      __dmb(1u);
      uint32_t v4 = readData | 0x800;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v3, v4);
      if (v2 > 0xE) {
        break;
      }
      ++v2;
      v3 += 4;
    }
    while (v2 < *(unsigned int *)(a1 + 1260));
  }
  if (*(_DWORD *)(a1 + 1264))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 8704;
    do
    {
      uint32_t v8 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v6, &v8);
      __dmb(1u);
      uint32_t v7 = v8 | 0xA000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v6, v7);
      if (v5 > 0xE) {
        break;
      }
      ++v5;
      v6 += 4;
    }
    while (v5 < *(unsigned int *)(a1 + 1264));
  }
}

uint64_t sub_10001C3C0(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_hw_82598", 786, "ixgbe_reset_hw_82598");
  }
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 120))(a1);
  if (v2) {
    return v2;
  }
  char v11 = 0;
  (*(void (**)(uint64_t, uint64_t, char *))(a1 + 152))(a1, 36, &v11);
  if ((v11 & 0x10) != 0)
  {
    (*(void (**)(uint64_t, uint64_t, char *))(a1 + 152))(a1, 36, &v11);
    v11 &= ~0x10u;
    (*(void (**)(uint64_t, uint64_t))(a1 + 160))(a1, 36);
    (*(void (**)(uint64_t, uint64_t, char *))(a1 + 152))(a1, 11, &v11);
    v11 &= 0xFu;
    (*(void (**)(uint64_t, uint64_t))(a1 + 160))(a1, 11);
    (*(void (**)(uint64_t, uint64_t, char *))(a1 + 152))(a1, 12, &v11);
    v11 &= 0xFu;
    (*(void (**)(uint64_t, uint64_t))(a1 + 160))(a1, 12);
    (*(void (**)(uint64_t, uint64_t, char *))(a1 + 152))(a1, 13, &v11);
    v11 &= 0xFu;
    (*(void (**)(uint64_t, uint64_t))(a1 + 160))(a1, 13);
  }
  if (*(unsigned char *)(a1 + 1648))
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t))(a1 + 1432))(a1);
    uint64_t v3 = v8;
    if (v8 != -20)
    {
      if (v8 == -19) {
        return v3;
      }
      (*(void (**)(uint64_t))(a1 + 1440))(a1);
    }
  }
  uint64_t v2 = 0;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0, &readData);
    __dmb(1u);
    uint32_t v4 = readData | 0x4000000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0, v4);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    unsigned int v5 = 0;
    __dmb(1u);
    do
    {
      IODelay(1uLL);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0, &readData);
      __dmb(1u);
      if ((readData & 0x4000000) == 0) {
        break;
      }
    }
    while (v5++ < 9);
    if ((readData & 0x4000000) != 0)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_hw_82598", 858, "Reset polling failed to complete.\n");
      }
      uint64_t v2 = 4294967281;
    }
    IODelay(0xC350uLL);
    if ((*(unsigned char *)(a1 + 1285) & 1) == 0) {
      break;
    }
    *(unsigned char *)(a1 + 1285) &= ~1u;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x110B0uLL, &readData);
  __dmb(1u);
  uint32_t v7 = readData & 0xFFDBFDBF;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x110B0uLL, v7);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
  __dmb(1u);
  if (*(unsigned char *)(a1 + 1283))
  {
    if (readData != *(_DWORD *)(a1 + 1268))
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, *(_DWORD *)(a1 + 1268));
    }
  }
  else
  {
    *(_DWORD *)(a1 + 1268) = readData;
    *(unsigned char *)(a1 + 1283) = 1;
  }
  (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, a1 + 706);
  (*(void (**)(uint64_t))(a1 + 408))(a1);
  if (!v3) {
    return v2;
  }
  return v3;
}

uint64_t sub_10001C760(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_media_type_82598", 325, "ixgbe_get_media_type_82598");
  }
  int v2 = *(_DWORD *)(a1 + 1616);
  if (v2 == 2 || v2 == 9) {
    return 4;
  }
  unsigned int v5 = *(unsigned __int16 *)(a1 + 1936);
  uint64_t result = 5;
  if (v5 > 0x1507)
  {
    if (v5 == 5384) {
      return result;
    }
    if (v5 != 5387) {
      return 0;
    }
    return 4;
  }
  uint64_t v6 = v5 - 4294;
  if (v6 <= 0x2E)
  {
    if (((1 << (v5 + 58)) & 0x480008200003) != 0) {
      return 1;
    }
    if (((1 << (v5 + 58)) & 0x4000800000) != 0) {
      return 6;
    }
    if (v6 == 2) {
      return 4;
    }
  }
  if (v5 != 4278) {
    return 0;
  }
  return result;
}

uint64_t ixgbe_get_supported_physical_layer_82598(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
  __dmb(1u);
  unint64_t v2 = readData;
  unsigned __int16 v9 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_supported_physical_layer_82598", 1201, "ixgbe_get_supported_physical_layer_82598");
  }
  (*(void (**)(uint64_t))(a1 + 1416))(a1);
  int v3 = *(_DWORD *)(a1 + 1616);
  if (v3 == 9 || v3 == 2)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 11, 1, &v9);
    return (v9 >> 4) & 2 | (v9 >> 2) & 1 | (v9 >> 5) & 4u;
  }
  else
  {
    uint64_t result = 0;
    switch((unsigned __int16)v2 >> 13)
    {
      case 0:
      case 2:
        if ((v2 & 0x200) != 0) {
          uint64_t result = 512;
        }
        else {
          uint64_t result = 1024;
        }
        break;
      case 1:
        if ((v2 & 0x180) == 0x100) {
          uint64_t result = 256;
        }
        else {
          uint64_t result = (unint64_t)((v2 & 0x180) == 128) << 7;
        }
        break;
      case 4:
      case 6:
        if ((v2 & 0x80000000) == 0) {
          uint64_t result = (v2 >> 21) & 0x200;
        }
        else {
          uint64_t result = (v2 >> 21) & 0x200 | 0x80;
        }
        break;
      default:
        break;
    }
    if (v3 == 12)
    {
      (*(void (**)(uint64_t))(a1 + 1424))(a1);
      uint64_t v6 = *(int *)(a1 + 1628);
      if (v6 > 2) {
        uint64_t result = 0;
      }
      else {
        uint64_t result = qword_100032488[v6];
      }
    }
    unsigned int v7 = *(unsigned __int16 *)(a1 + 1936);
    if (v7 > 0x10F0)
    {
      uint64_t v8 = 8;
      if (v7 != 4337) {
        uint64_t v8 = result;
      }
      if (v7 == 4340) {
        return 16;
      }
      else {
        return v8;
      }
    }
    else if (v7 - 4294 < 2 || v7 == 4321)
    {
      return 64;
    }
  }
  return result;
}

uint64_t ixgbe_read_analog_reg8_82598(IOPCIDevice **a1, int a2, unsigned char *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_analog_reg8_82598", 1049, "ixgbe_read_analog_reg8_82598");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x4800uLL, (a2 << 8) | 0x10000);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0xAuLL);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x4800uLL, &v7);
  __dmb(1u);
  *a3 = v7;
  return 0;
}

uint64_t ixgbe_write_analog_reg8_82598(IOPCIDevice **a1, int a2, int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_analog_reg8_82598", 1073, "ixgbe_write_analog_reg8_82598");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x4800uLL, a3 | (a2 << 8));
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0xAuLL);
  return 0;
}

uint64_t ixgbe_set_lan_id_multi_port_pcie_82598(uint64_t a1)
{
  int v3 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_lan_id_multi_port_pcie_82598", 1303, "ixgbe_set_lan_id_multi_port_pcie_82598");
  }
  ixgbe_set_lan_id_multi_port_pcie(a1);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 1728))(a1, 6, (char *)&v3 + 2);
  if ((unsigned __int16)(HIWORD(v3) - 1) <= 0xFFFDu)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, int *))(a1 + 1728))(a1, (unsigned __int16)(HIWORD(v3) + 5), &v3);
    if ((v3 & 0xB) == 2) {
      *(_WORD *)(a1 + 1812) = 0;
    }
  }
  return result;
}

uint64_t ixgbe_enable_rx_dma_82598(IOPCIDevice **a1, uint32_t data)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_enable_rx_dma_82598", 1402, "ixgbe_enable_rx_dma_82598");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x3000uLL, data);
  return 0;
}

uint64_t ixgbe_set_vmdq_82598(uint64_t a1, unsigned int a2, char a3)
{
  unsigned int v6 = *(_DWORD *)(a1 + 1248);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_vmdq_82598", 917, "ixgbe_set_vmdq_82598");
  }
  if (v6 <= a2)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): RAR index %d is out of range.\n\n", "ixgbe_set_vmdq_82598", 921, a2);
    }
    return 4294967264;
  }
  else
  {
    uint32_t readData = 0;
    if (a2 >= 0x10) {
      int v7 = 41476;
    }
    else {
      int v7 = 21508;
    }
    uint64_t v8 = v7 + 8 * a2;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v8, &readData);
    __dmb(1u);
    uint32_t v9 = readData & 0xFFC3FFFF | ((a3 & 0xF) << 18);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v8, v9);
    return 0;
  }
}

uint64_t sub_10001CE14(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 1248) <= a2)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): RAR index %d is out of range.\n\n", "ixgbe_clear_vmdq_82598", 947, a2);
    }
    return 4294967264;
  }
  else
  {
    uint32_t readData = 0;
    int v3 = *(IOPCIDevice **)a1;
    if (a2 >= 0x10) {
      int v4 = 41476;
    }
    else {
      int v4 = 21508;
    }
    uint64_t v5 = v4 + 8 * a2;
    IOPCIDevice::MemoryRead32(v3, 0, v5, &readData);
    __dmb(1u);
    uint32_t v6 = readData;
    if ((readData & 0x3C0000) != 0)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5, v6 & 0xFFC3FFFF);
    }
    return 0;
  }
}

uint64_t ixgbe_set_vfta_82598(IOPCIDevice **a1, unsigned int a2, int a3, int a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_vfta_82598", 980, "ixgbe_set_vfta_82598");
  }
  if (a2 > 0xFFF) {
    return 4294967291;
  }
  uint32_t readData = 0;
  int v9 = (a2 >> 3) & 0x1FC;
  IOPCIDevice::MemoryRead32(*a1, 0, (v9 | (((a2 >> 3) & 3) << 9)) + 41472, &readData);
  __dmb(1u);
  uint32_t v10 = readData & ~(15 << (4 * (a2 & 7))) | (a3 << (4 * (a2 & 7)));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, (v9 | (((a2 >> 3) & 3) << 9)) + 41472, v10);
  uint32_t v12 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, v9 | 0xA000u, &v12);
  __dmb(1u);
  if (a4) {
    uint32_t v11 = v12 | (1 << a2);
  }
  else {
    uint32_t v11 = v12 & ~(1 << a2);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, v9 | 0xA000u, v11);
  return 0;
}

uint64_t sub_10001D020(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_clear_vfta_82598", 1024, "ixgbe_clear_vfta_82598");
  }
  LODWORD(v2) = *(_DWORD *)(a1 + 1244);
  if (v2)
  {
    unint64_t v3 = 0;
    int v4 = 40960;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v4 & 0xFFFFFFFC, 0);
      ++v3;
      unint64_t v2 = *(unsigned int *)(a1 + 1244);
      v4 += 4;
    }
    while (v3 < v2);
  }
  int v5 = 0;
  int v6 = 41472;
  do
  {
    if (v2)
    {
      unint64_t v7 = 0;
      unsigned int v8 = v6;
      do
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v8, 0);
        ++v7;
        unint64_t v2 = *(unsigned int *)(a1 + 1244);
        v8 += 4;
      }
      while (v7 < v2);
    }
    ++v5;
    v6 += 512;
  }
  while (v5 != 4);
  return 0;
}

uint64_t ixgbe_fc_enable_82598(uint64_t a1)
{
  int v24 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fc_enable_82598", 385, "ixgbe_fc_enable_82598");
  }
  if (*(_WORD *)(a1 + 1396))
  {
    uint64_t v2 = 0;
    while (1)
    {
      if ((*(_DWORD *)(a1 + 1404) & 2) != 0)
      {
        unsigned int v3 = *(_DWORD *)(a1 + v2 + 1332);
        if (v3)
        {
          unsigned int v4 = *(_DWORD *)(a1 + v2 + 1364);
          if (!v4 || v4 >= v3) {
            break;
          }
        }
      }
      v2 += 4;
      if (v2 == 32)
      {
        char v23 = 0;
        (*(void (**)(uint64_t, int *, char *, void))(a1 + 280))(a1, &v24, &v23, 0);
        if (v23 && v24 == 32)
        {
          int v6 = *(_DWORD *)(a1 + 1408);
          if (v6 == 3)
          {
            int v7 = 2;
LABEL_21:
            *(_DWORD *)(a1 + 1408) = v7;
          }
          else if (v6 == 1)
          {
            int v7 = 0;
            goto LABEL_21;
          }
        }
        ixgbe_fc_autoneg(a1);
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x5080uLL, &readData);
        __dmb(1u);
        uint32_t v9 = readData;
        uint32_t v21 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3D00uLL, &v21);
        __dmb(1u);
        unsigned int v10 = v9 & 0xFFFF3FFF;
        uint64_t v11 = v21 & 0xFFFFFFE7;
        switch(*(_DWORD *)(a1 + 1404))
        {
          case 0:
            goto LABEL_26;
          case 1:
            v10 |= 0x8000u;
            goto LABEL_26;
          case 2:
            goto LABEL_25;
          case 3:
            v10 |= 0x8000u;
LABEL_25:
            LODWORD(v11) = v11 | 8;
LABEL_26:
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5080uLL, v10 | 0x2000);
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x3D00uLL, v11);
            uint64_t v12 = 0;
            uint64_t v13 = 0;
            int v14 = (_DWORD *)(a1 + 1364);
            do
            {
              if ((*(unsigned char *)(a1 + 1404) & 2) != 0 && (int v15 = *(v14 - 8)) != 0)
              {
                uint32_t v16 = (*v14 << 10) | 0x80000000;
                uint32_t v17 = (v15 << 10) | 0x80000000;
                __dmb(2u);
                uint64_t v18 = 8 * v13;
                IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v12 + 12832, v16);
                __dmb(2u);
              }
              else
              {
                __dmb(2u);
                IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v12 + 12832, 0);
                uint32_t v17 = 0;
                __dmb(2u);
                uint64_t v18 = v12;
              }
              IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v18 + 12896, v17);
              ++v13;
              v12 += 8;
              ++v14;
            }
            while (v12 != 64);
            uint64_t v19 = 0;
            uint32_t v20 = *(unsigned __int16 *)(a1 + 1396) | (*(unsigned __int16 *)(a1 + 1396) << 16);
            do
            {
              __dmb(2u);
              IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v19 + 12800, v20);
              v19 += 4;
            }
            while (v19 != 16);
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x32A0uLL, *(unsigned __int16 *)(a1 + 1396) >> 1);
            uint64_t result = 0;
            break;
          default:
            if ((*(unsigned char *)(v11 + 2) & 0x10) != 0) {
              IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fc_enable_82598", 477, "Flow control param set incorrectly\n");
            }
            uint64_t result = 4294967292;
            break;
        }
        return result;
      }
    }
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fc_enable_82598", 399, "Invalid water mark configuration\n");
    }
  }
  return 4294967283;
}

uint64_t ixgbe_read_i2c_eeprom_82598(uint64_t a1, int a2, unsigned char *a3)
{
  return sub_10001DA98(a1, 160, a2, a3);
}

uint64_t sub_10001D464(uint64_t a1, int a2, unsigned char *a3)
{
  return sub_10001DA98(a1, 162, a2, a3);
}

uint64_t sub_10001D474(uint64_t a1, int *a2, unsigned char *a3, int a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_mac_link_82598", 616, "ixgbe_check_mac_link_82598");
  }
  __int16 v18 = 0;
  __int16 v17 = 0;
  if (*(_DWORD *)(a1 + 1616) == 12)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 51103, 1, &v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 51103, 1, &v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 49164, 1, &v17);
    if (!a4)
    {
      if (v18 & 1) == 0 || (v17)
      {
LABEL_34:
        *a3 = 0;
        return 0;
      }
      goto LABEL_14;
    }
    if (*(_DWORD *)(a1 + 1304))
    {
      int v8 = 0;
      while ((v18 & 1) == 0 || (v17 & 1) != 0)
      {
        *a3 = 0;
        IODelay(0x186A0uLL);
        (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 51103, 1, &v18);
        (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 49164, 1, &v17);
        if (++v8 >= *(_DWORD *)(a1 + 1304)) {
          goto LABEL_10;
        }
      }
LABEL_14:
      *a3 = 1;
      goto LABEL_15;
    }
LABEL_10:
    if (!*a3) {
      return 0;
    }
  }
LABEL_15:
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A4uLL, &readData);
  __dmb(1u);
  uint32_t v9 = readData;
  if (a4)
  {
    if (!*(_DWORD *)(a1 + 1304)) {
      goto LABEL_24;
    }
    int v10 = 0;
    while ((v9 & 0x40000000) == 0)
    {
      *a3 = 0;
      IODelay(0x186A0uLL);
      uint32_t v15 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A4uLL, &v15);
      __dmb(1u);
      uint32_t v9 = v15;
      if (++v10 >= *(_DWORD *)(a1 + 1304)) {
        goto LABEL_24;
      }
    }
    LOBYTE(v11) = 1;
  }
  else
  {
    uint32_t v11 = (readData >> 30) & 1;
  }
  *a3 = v11;
LABEL_24:
  if ((v9 & 0x20000000) != 0) {
    int v12 = 128;
  }
  else {
    int v12 = 32;
  }
  *a2 = v12;
  if (*(_WORD *)(a1 + 1936) == 5387 && *a3)
  {
    unsigned __int16 v19 = 0;
    int v13 = 50;
    while (1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 1, 7, &v19);
      if ((~v19 & 0x24) == 0) {
        break;
      }
      IODelay(0x186A0uLL);
      if (!--v13)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_link_ready", 592, "Link was indicated but link is down\n");
        }
        goto LABEL_34;
      }
    }
  }
  return 0;
}

uint64_t sub_10001D720(IOPCIDevice **a1, unsigned int a2, int a3)
{
  char v11 = 0;
  uint32_t readData = 0;
  int v10 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x42A0uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_mac_link_82598", 708, "ixgbe_setup_mac_link_82598");
  }
  ixgbe_get_link_capabilities((uint64_t)a1);
  if ((v10 & a2) == 0) {
    return 4294967288;
  }
  if ((v6 & 0xA000) == 0x8000)
  {
    uint32_t v7 = v6 & 0x3FFFFFFF | (((v10 & a2) >> 7) << 31) | ((((v10 & a2) >> 5) & 1) << 30);
    if (v7 != v6)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, 0x42A0uLL, v7);
    }
  }
  return sub_10001DC5C(a1, a3);
}

uint64_t sub_10001D81C(uint64_t a1, int *a2, char *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_link_capabilities_82598", 269, "ixgbe_get_link_capabilities_82598");
  }
  if (*(unsigned char *)(a1 + 1283))
  {
    uint32_t v6 = *(_DWORD *)(a1 + 1268);
  }
  else
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
    __dmb(1u);
    uint32_t v6 = readData;
  }
  uint64_t result = 4294967288;
  char v8 = 0;
  int v9 = 32;
  switch((unsigned __int16)v6 >> 13)
  {
    case 0:
      goto LABEL_10;
    case 1:
      char v8 = 0;
      int v9 = 128;
      goto LABEL_10;
    case 2:
      goto LABEL_8;
    case 4:
    case 6:
      int v9 = (v6 >> 25) & 0x20 | (v6 >> 31 << 7);
LABEL_8:
      char v8 = 1;
LABEL_10:
      uint64_t result = 0;
      *a2 = v9;
      *a3 = v8;
      break;
    default:
      return result;
  }
  return result;
}

void sub_10001D934(IOPCIDevice **a1, int a2, uint64_t a3, int a4)
{
  if (a2)
  {
    if (a4 == 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 4;
      do
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*a1, 0, v5 | 0x3C00, 0x14000u);
        v5 += 4;
      }
      while (v5 != 16);
      uint32_t v7 = 49152;
    }
    else
    {
      uint64_t v6 = 0;
      uint32_t v7 = 0x10000;
    }
    uint64_t v8 = 4 * v6;
    unint64_t v9 = v6 | 0xFFFFFFFFFFFFFFF8;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, v8 | 0x3C00, v7);
      v8 += 4;
    }
    while (!__CFADD__(v9++, 1));
    for (uint64_t i = 0; i != 32; i += 4)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*a1, 0, i | 0xCC00, 0xA000u);
    }
  }
}

uint64_t sub_10001DA04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_copper_link_82598", 757, "ixgbe_setup_copper_link_82598");
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1496))(a1, a2, a3);
  sub_10001DC5C((IOPCIDevice **)a1, a3);
  return v6;
}

uint64_t sub_10001DA98(uint64_t a1, int a2, int a3, unsigned char *a4)
{
  int v14 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_phy_82598", 1102, "ixgbe_read_i2c_phy_82598");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  if ((readData & 4) != 0) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 2;
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, v8)) {
    return 4294967280;
  }
  if (*(_DWORD *)(a1 + 1616) == 12)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 1472))(a1, 49930, 1, a3 | (a2 << 8) | 0x100u);
    int v10 = 100;
    while (1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, int *))(a1 + 1464))(a1, 49932, 1, &v14);
      int v11 = v14 & 3;
      LOWORD(v14) = v14 & 3;
      if (v11 != 3) {
        break;
      }
      IODelay(0x2710uLL);
      if (!--v10)
      {
        int v11 = (unsigned __int16)v14;
        break;
      }
    }
    if (v11 == 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, char *))(a1 + 1464))(a1, 49931, 1, (char *)&v14 + 2);
      uint64_t v9 = 0;
      *a4 = HIBYTE(v14);
    }
    else
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_phy_82598", 1138, "EEPROM read did not pass.\n");
      }
      uint64_t v9 = 4294967276;
    }
  }
  else
  {
    uint64_t v9 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, v8);
  return v9;
}

uint64_t sub_10001DC5C(IOPCIDevice **a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_start_mac_link_82598", 531, "ixgbe_start_mac_link_82598");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x42A0uLL, &readData);
  __dmb(1u);
  __int16 v4 = readData;
  uint32_t v5 = readData | 0x1000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x42A0uLL, v5);
  uint64_t v6 = 0;
  if (a2)
  {
    if ((v4 & 0xA000 | 0x4000) == 0xC000)
    {
      int v7 = 45;
      while (1)
      {
        uint32_t v9 = 0;
        IOPCIDevice::MemoryRead32(*a1, 0, 0x42A4uLL, &v9);
        __dmb(1u);
        if ((v9 & 0x80000000) != 0) {
          break;
        }
        IODelay(0x186A0uLL);
        if (!--v7)
        {
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): %s\n", "ixgbe_start_mac_link_82598", 553, "Autonegotiation did not complete.\n");
          }
          uint64_t v6 = 4294967282;
          goto LABEL_12;
        }
      }
    }
    uint64_t v6 = 0;
  }
LABEL_12:
  IODelay(0xC350uLL);
  return v6;
}

uint64_t sub_10001DD9C(uint64_t a1, uint64_t a2, int a3)
{
  uint32_t segmentsCount = 1;
  uint64_t flags = 0;
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v16 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v16 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v18 = 2;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v20 = v16 | v18;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v21 = 4;
      }
      else {
        int v21 = 0;
      }
    }
    else
    {
      int v21 = 0;
    }
    int v24 = v20 | v21;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v25 = 8;
      }
      else {
        int v25 = 0;
      }
    }
    else
    {
      int v25 = 0;
    }
    int v28 = v24 | v25;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v29 = 16;
      }
      else {
        int v29 = 0;
      }
    }
    else
    {
      int v29 = 0;
    }
    int v32 = v28 | v29;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v33 = 32;
      }
      else {
        int v33 = 0;
      }
    }
    else
    {
      int v33 = 0;
    }
    int v36 = v33 | v32;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v37 = 64;
      }
      else {
        int v37 = 0;
      }
    }
    else
    {
      int v37 = 0;
    }
    int v40 = v36 + v37;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v41 = 128;
      }
      else {
        int v41 = 0;
      }
    }
    else
    {
      int v41 = 0;
    }
    int v44 = *(_DWORD *)(a2 + 280);
    *(_DWORD *)buf = 67109890;
    int v101 = v40 + v41;
    __int16 v102 = 2080;
    int v103 = "allocRing";
    __int16 v104 = 1024;
    int v105 = 14;
    __int16 v106 = 1024;
    int v107 = v44;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <== ringsize=%d\n", buf, 0x1Eu);
  }
  uint64_t v6 = (IOBufferMemoryDescriptor **)(a2 + 296);
  uint64_t v7 = IOBufferMemoryDescriptor::Create(3uLL, (IOVMPageSize + 16 * (*(_DWORD *)(a2 + 280) + a3) - 1) / IOVMPageSize * IOVMPageSize, IOVMPageSize, (IOBufferMemoryDescriptor **)(a2 + 296));
  if (v7)
  {
    uint64_t v8 = v7;
    if ((dword_10003C040 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v9 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v9 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v45 = 2;
        }
        else {
          int v45 = 0;
        }
      }
      else
      {
        int v45 = 0;
      }
      int v46 = v9 | v45;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v47 = 4;
        }
        else {
          int v47 = 0;
        }
      }
      else
      {
        int v47 = 0;
      }
      int v48 = v46 | v47;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v49 = 8;
        }
        else {
          int v49 = 0;
        }
      }
      else
      {
        int v49 = 0;
      }
      int v50 = v48 | v49;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v51 = 16;
        }
        else {
          int v51 = 0;
        }
      }
      else
      {
        int v51 = 0;
      }
      int v52 = v50 | v51;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v53 = 32;
        }
        else {
          int v53 = 0;
        }
      }
      else
      {
        int v53 = 0;
      }
      int v54 = v53 | v52;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v55 = 64;
        }
        else {
          int v55 = 0;
        }
      }
      else
      {
        int v55 = 0;
      }
      int v56 = v54 + v55;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v57 = 128;
        }
        else {
          int v57 = 0;
        }
      }
      else
      {
        int v57 = 0;
      }
      *(_DWORD *)buf = 67109634;
      int v101 = v56 + v57;
      __int16 v102 = 2080;
      int v103 = "allocRing";
      __int16 v104 = 1024;
      int v105 = 22;
      int v58 = "ixgbe: [%x] %s(%d): can't alloc IOBufferMemoryDescriptor\n";
LABEL_253:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v58, buf, 0x18u);
    }
  }
  else
  {
    uint64_t AddressRange = IOBufferMemoryDescriptor::GetAddressRange(*v6, &range);
    if (AddressRange)
    {
      uint64_t v8 = AddressRange;
      if ((dword_10003C040 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        if (qword_10003C000) {
          BOOL v11 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
        }
        else {
          BOOL v11 = 0;
        }
        if (qword_10003C008)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
            int v59 = 2;
          }
          else {
            int v59 = 0;
          }
        }
        else
        {
          int v59 = 0;
        }
        int v60 = v11 | v59;
        if (qword_10003C010)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
            int v61 = 4;
          }
          else {
            int v61 = 0;
          }
        }
        else
        {
          int v61 = 0;
        }
        int v62 = v60 | v61;
        if (qword_10003C018)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
            int v63 = 8;
          }
          else {
            int v63 = 0;
          }
        }
        else
        {
          int v63 = 0;
        }
        int v64 = v62 | v63;
        if (qword_10003C020)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
            int v65 = 16;
          }
          else {
            int v65 = 0;
          }
        }
        else
        {
          int v65 = 0;
        }
        int v66 = v64 | v65;
        if (qword_10003C028)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
            int v67 = 32;
          }
          else {
            int v67 = 0;
          }
        }
        else
        {
          int v67 = 0;
        }
        int v68 = v67 | v66;
        if (qword_10003C030)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
            int v69 = 64;
          }
          else {
            int v69 = 0;
          }
        }
        else
        {
          int v69 = 0;
        }
        int v70 = v68 + v69;
        if (qword_10003C038)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
            int v71 = 128;
          }
          else {
            int v71 = 0;
          }
        }
        else
        {
          int v71 = 0;
        }
        *(_DWORD *)buf = 67109634;
        int v101 = v70 + v71;
        __int16 v102 = 2080;
        int v103 = "allocRing";
        __int16 v104 = 1024;
        int v105 = 30;
        int v58 = "ixgbe: [%x] %s(%d): GetAddressRange failed\n";
        goto LABEL_253;
      }
    }
    else
    {
      *(void *)(a2 + 264) = range.address;
      specification.options = 0;
      memset(specification._resv, 0, sizeof(specification._resv));
      specification.maxAddressBits = 64;
      uint64_t v12 = IODMACommand::Create(*(IOService **)(a1 + 1968), 0, &specification, (IODMACommand **)(a2 + 288));
      if (v12)
      {
        uint64_t v8 = v12;
        if ((dword_10003C040 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if (qword_10003C000) {
            BOOL v13 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
          }
          else {
            BOOL v13 = 0;
          }
          if (qword_10003C008)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
              int v72 = 2;
            }
            else {
              int v72 = 0;
            }
          }
          else
          {
            int v72 = 0;
          }
          int v73 = v13 | v72;
          if (qword_10003C010)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
              int v74 = 4;
            }
            else {
              int v74 = 0;
            }
          }
          else
          {
            int v74 = 0;
          }
          int v75 = v73 | v74;
          if (qword_10003C018)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
              int v76 = 8;
            }
            else {
              int v76 = 0;
            }
          }
          else
          {
            int v76 = 0;
          }
          int v77 = v75 | v76;
          if (qword_10003C020)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
              int v78 = 16;
            }
            else {
              int v78 = 0;
            }
          }
          else
          {
            int v78 = 0;
          }
          int v79 = v77 | v78;
          if (qword_10003C028)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
              int v80 = 32;
            }
            else {
              int v80 = 0;
            }
          }
          else
          {
            int v80 = 0;
          }
          int v81 = v80 | v79;
          if (qword_10003C030)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
              int v82 = 64;
            }
            else {
              int v82 = 0;
            }
          }
          else
          {
            int v82 = 0;
          }
          int v83 = v81 + v82;
          if (qword_10003C038)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
              int v84 = 128;
            }
            else {
              int v84 = 0;
            }
          }
          else
          {
            int v84 = 0;
          }
          *(_DWORD *)buf = 67109634;
          int v101 = v83 + v84;
          __int16 v102 = 2080;
          int v103 = "allocRing";
          __int16 v104 = 1024;
          int v105 = 41;
          int v58 = "ixgbe: [%x] %s(%d): can't alloc IODMACommand\n";
          goto LABEL_253;
        }
      }
      else
      {
        uint64_t v8 = IODMACommand::PrepareForDMA(*(IODMACommand **)(a2 + 288), 0, *v6, 0, 0, &flags, &segmentsCount, &range, 0);
        if (!v8)
        {
          *(void *)(a2 + 272) = range.address;
          operator new[]();
        }
        if ((dword_10003C040 & 2) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if (qword_10003C000) {
            BOOL v14 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
          }
          else {
            BOOL v14 = 0;
          }
          if (qword_10003C008)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
              int v85 = 2;
            }
            else {
              int v85 = 0;
            }
          }
          else
          {
            int v85 = 0;
          }
          int v86 = v14 | v85;
          if (qword_10003C010)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
              int v87 = 4;
            }
            else {
              int v87 = 0;
            }
          }
          else
          {
            int v87 = 0;
          }
          int v88 = v86 | v87;
          if (qword_10003C018)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
              int v89 = 8;
            }
            else {
              int v89 = 0;
            }
          }
          else
          {
            int v89 = 0;
          }
          int v90 = v88 | v89;
          if (qword_10003C020)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
              int v91 = 16;
            }
            else {
              int v91 = 0;
            }
          }
          else
          {
            int v91 = 0;
          }
          int v92 = v90 | v91;
          if (qword_10003C028)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
              int v93 = 32;
            }
            else {
              int v93 = 0;
            }
          }
          else
          {
            int v93 = 0;
          }
          int v94 = v93 | v92;
          if (qword_10003C030)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
              int v95 = 64;
            }
            else {
              int v95 = 0;
            }
          }
          else
          {
            int v95 = 0;
          }
          int v96 = v94 + v95;
          if (qword_10003C038)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
              int v97 = 128;
            }
            else {
              int v97 = 0;
            }
          }
          else
          {
            int v97 = 0;
          }
          *(_DWORD *)buf = 67109634;
          int v101 = v96 + v97;
          __int16 v102 = 2080;
          int v103 = "allocRing";
          __int16 v104 = 1024;
          int v105 = 49;
          int v58 = "ixgbe: [%x] %s(%d): PrepareForDMA failed\n";
          goto LABEL_253;
        }
      }
    }
  }
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v17 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v17 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v19 = 2;
      }
      else {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    int v22 = v17 | v19;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v23 = 4;
      }
      else {
        int v23 = 0;
      }
    }
    else
    {
      int v23 = 0;
    }
    int v26 = v22 | v23;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v27 = 8;
      }
      else {
        int v27 = 0;
      }
    }
    else
    {
      int v27 = 0;
    }
    int v30 = v26 | v27;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v31 = 16;
      }
      else {
        int v31 = 0;
      }
    }
    else
    {
      int v31 = 0;
    }
    int v34 = v30 | v31;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v35 = 32;
      }
      else {
        int v35 = 0;
      }
    }
    else
    {
      int v35 = 0;
    }
    int v38 = v35 | v34;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v39 = 64;
      }
      else {
        int v39 = 0;
      }
    }
    else
    {
      int v39 = 0;
    }
    int v42 = v38 + v39;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v43 = 128;
      }
      else {
        int v43 = 0;
      }
    }
    else
    {
      int v43 = 0;
    }
    *(_DWORD *)buf = 67109890;
    int v101 = v42 + v43;
    __int16 v102 = 2080;
    int v103 = "allocRing";
    __int16 v104 = 1024;
    int v105 = 61;
    __int16 v106 = 1024;
    int v107 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==> 0x%08x\n", buf, 0x1Eu);
  }
  return v8;
}

uint64_t sub_10001E8F0(uint64_t a1)
{
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v7 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v7 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v9 = 2;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    int v11 = v7 | v9;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v12 = 4;
      }
      else {
        int v12 = 0;
      }
    }
    else
    {
      int v12 = 0;
    }
    int v15 = v11 | v12;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v16 = 8;
      }
      else {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 0;
    }
    int v19 = v15 | v16;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v20 = 16;
      }
      else {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
    int v23 = v19 | v20;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v24 = 32;
      }
      else {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
    }
    int v27 = v24 | v23;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v28 = 64;
      }
      else {
        int v28 = 0;
      }
    }
    else
    {
      int v28 = 0;
    }
    int v31 = v27 + v28;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v32 = 128;
      }
      else {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
    }
    int v35 = 67109634;
    int v36 = v31 + v32;
    __int16 v37 = 2080;
    int v38 = "allocateRings";
    __int16 v39 = 1024;
    int v40 = 69;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): <==\n", (uint8_t *)&v35, 0x18u);
  }
  uint64_t v2 = a1 + 2040;
  uint64_t v3 = -1;
  while (++v3 < (unint64_t)*(unsigned __int8 *)(a1 + 2033))
  {
    *(_DWORD *)(v2 + 632) = 256;
    uint64_t v4 = sub_10001DD9C(a1, v2 + 352, 0);
    if (!v4)
    {
      *(_DWORD *)(v2 + 280) = 256;
      uint64_t v4 = sub_10001DD9C(a1, v2, 1);
      v2 += 352;
      if (!v4) {
        continue;
      }
    }
    uint64_t v5 = v4;
    goto LABEL_8;
  }
  uint64_t v5 = 0;
LABEL_8:
  if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v8 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v8 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v10 = 2;
      }
      else {
        int v10 = 0;
      }
    }
    else
    {
      int v10 = 0;
    }
    int v13 = v8 | v10;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v14 = 4;
      }
      else {
        int v14 = 0;
      }
    }
    else
    {
      int v14 = 0;
    }
    int v17 = v13 | v14;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v18 = 8;
      }
      else {
        int v18 = 0;
      }
    }
    else
    {
      int v18 = 0;
    }
    int v21 = v17 | v18;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v22 = 16;
      }
      else {
        int v22 = 0;
      }
    }
    else
    {
      int v22 = 0;
    }
    int v25 = v21 | v22;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v26 = 32;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
    }
    int v29 = v26 | v25;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v30 = 64;
      }
      else {
        int v30 = 0;
      }
    }
    else
    {
      int v30 = 0;
    }
    int v33 = v29 + v30;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v34 = 128;
      }
      else {
        int v34 = 0;
      }
    }
    else
    {
      int v34 = 0;
    }
    int v35 = 67109890;
    int v36 = v33 + v34;
    __int16 v37 = 2080;
    int v38 = "allocateRings";
    __int16 v39 = 1024;
    int v40 = 80;
    __int16 v41 = 1024;
    int v42 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==> 0x%08x\n", (uint8_t *)&v35, 0x1Eu);
  }
  return v5;
}

uint64_t sub_10001ED00(uint64_t a1, void *a2)
{
  uint64_t v3 = (IODMACommand *)a2[36];
  if (v3)
  {
    IODMACommand::CompleteDMA(v3, 0, 0);
    uint64_t v4 = a2[36];
    if (v4)
    {
      (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
      a2[36] = 0;
    }
  }
  uint64_t v5 = a2[37];
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
    a2[37] = 0;
  }
  uint64_t result = a2[38];
  if (result) {
    operator delete[]();
  }
  a2[38] = 0;
  a2[16] = 0;
  return result;
}

uint64_t sub_10001EDB8(uint64_t result)
{
  if (*(unsigned char *)(result + 2033))
  {
    uint64_t v1 = result;
    unint64_t v2 = 0;
    uint64_t v3 = (void *)(result + 2392);
    do
    {
      uint64_t v4 = sub_10001ED00(result, v3);
      uint64_t result = sub_10001ED00(v4, v3 - 44);
      ++v2;
      v3 += 44;
    }
    while (v2 < *(unsigned __int8 *)(v1 + 2033));
  }
  return result;
}

uint64_t sub_10001EE14(uint64_t a1)
{
  uint8_t returnFunctionNumber;
  uint8_t returnDeviceNumber[2];
  char __str[16];
  long long v265;
  IOUserNetworkPacketBufferPoolOptions options;

  sub_10001411C(a1, 32);
  *(_DWORD *)(a1 + 2744) = 2048;
  v265 = 0u;
  *(_OWORD *)__str = 0u;
  *(_WORD *)returnDeviceNumber = 0;
  returnFunctionNumber = 0;
  IOPCIDevice::GetBusDeviceFunction(*(IOPCIDevice **)(a1 + 1968), &returnDeviceNumber[1], returnDeviceNumber, &returnFunctionNumber, 0);
  snprintf(__str, 0x20uLL, "ixgbe:%d:%d:%d:%s", returnDeviceNumber[1], returnDeviceNumber[0], returnFunctionNumber, "");
  *(void *)&options.packetCount = 0x40000000400;
  options.bufferSize = *(_DWORD *)(a1 + 2744);
  *(void *)&options.maxBuffersPerPacket = 1;
  options.poolFlags = 0x20000000;
  options.dmaSpecification.maxAddressBits = 64;
  uint64_t v2 = IOUserNetworkPacketBufferPool::CreateWithOptions(*(IOService **)(a1 + 1968), "ixgbe", &options, (IOUserNetworkPacketBufferPool **)(a1 + 2024));
  if (v2)
  {
    uint64_t v3 = v2;
    if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_10003C000) {
        BOOL v4 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
      }
      else {
        BOOL v4 = 0;
      }
      if (qword_10003C008)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
          int v37 = 2;
        }
        else {
          int v37 = 0;
        }
      }
      else
      {
        int v37 = 0;
      }
      int v38 = v4 | v37;
      if (qword_10003C010)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
          int v39 = 4;
        }
        else {
          int v39 = 0;
        }
      }
      else
      {
        int v39 = 0;
      }
      int v40 = v38 | v39;
      if (qword_10003C018)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
          int v41 = 8;
        }
        else {
          int v41 = 0;
        }
      }
      else
      {
        int v41 = 0;
      }
      int v42 = v40 | v41;
      if (qword_10003C020)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
          int v43 = 16;
        }
        else {
          int v43 = 0;
        }
      }
      else
      {
        int v43 = 0;
      }
      int v44 = v42 | v43;
      if (qword_10003C028)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
          int v45 = 32;
        }
        else {
          int v45 = 0;
        }
      }
      else
      {
        int v45 = 0;
      }
      int v46 = v45 | v44;
      if (qword_10003C030)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
          int v47 = 64;
        }
        else {
          int v47 = 0;
        }
      }
      else
      {
        int v47 = 0;
      }
      int v48 = v46 + v47;
      if (qword_10003C038)
      {
        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
          int v49 = 128;
        }
        else {
          int v49 = 0;
        }
      }
      else
      {
        int v49 = 0;
      }
      *(_DWORD *)buf = 67109890;
      int v254 = v48 + v49;
      __int16 v255 = 2080;
      v256 = "startInterface";
      __int16 v257 = 1024;
      int v258 = 127;
      __int16 v259 = 1024;
      int v260 = v3;
LABEL_80:
      int v34 = buf;
LABEL_81:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==> 0x%08x\n", v34, 0x1Eu);
    }
  }
  else
  {
    uint64_t v5 = IOUserNetworkTxSubmissionQueue::Create(*(IOUserNetworkPacketBufferPool **)(a1 + 2024), *(OSObject **)(a1 + 1960), 0x100u, 0, *(IODispatchQueue **)(a1 + 1976), (IOUserNetworkTxSubmissionQueue **)(a1 + 2376));
    if (v5)
    {
      uint64_t v3 = v5;
      if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        if (qword_10003C000) {
          BOOL v6 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
        }
        else {
          BOOL v6 = 0;
        }
        if (qword_10003C008)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
            int v52 = 2;
          }
          else {
            int v52 = 0;
          }
        }
        else
        {
          int v52 = 0;
        }
        int v53 = v6 | v52;
        if (qword_10003C010)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
            int v54 = 4;
          }
          else {
            int v54 = 0;
          }
        }
        else
        {
          int v54 = 0;
        }
        int v55 = v53 | v54;
        if (qword_10003C018)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
            int v56 = 8;
          }
          else {
            int v56 = 0;
          }
        }
        else
        {
          int v56 = 0;
        }
        int v57 = v55 | v56;
        if (qword_10003C020)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
            int v58 = 16;
          }
          else {
            int v58 = 0;
          }
        }
        else
        {
          int v58 = 0;
        }
        int v59 = v57 | v58;
        if (qword_10003C028)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
            int v60 = 32;
          }
          else {
            int v60 = 0;
          }
        }
        else
        {
          int v60 = 0;
        }
        int v61 = v60 | v59;
        if (qword_10003C030)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
            int v62 = 64;
          }
          else {
            int v62 = 0;
          }
        }
        else
        {
          int v62 = 0;
        }
        int v63 = v61 + v62;
        if (qword_10003C038)
        {
          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
            int v64 = 128;
          }
          else {
            int v64 = 0;
          }
        }
        else
        {
          int v64 = 0;
        }
        *(_DWORD *)buf = 67109890;
        int v254 = v63 + v64;
        __int16 v255 = 2080;
        v256 = "startInterface";
        __int16 v257 = 1024;
        int v258 = 134;
        __int16 v259 = 1024;
        int v260 = v3;
        goto LABEL_80;
      }
    }
    else
    {
      uint64_t ActionTxSubmit = DriverKit_AppleEthernetIXGBE::CreateActionTxSubmit(*(OSObject **)(a1 + 1960), 8uLL, (OSAction **)(a1 + 2352));
      if (ActionTxSubmit)
      {
        uint64_t v3 = ActionTxSubmit;
        if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if (qword_10003C000) {
            BOOL v8 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
          }
          else {
            BOOL v8 = 0;
          }
          if (qword_10003C008)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
              int v67 = 2;
            }
            else {
              int v67 = 0;
            }
          }
          else
          {
            int v67 = 0;
          }
          int v68 = v8 | v67;
          if (qword_10003C010)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
              int v69 = 4;
            }
            else {
              int v69 = 0;
            }
          }
          else
          {
            int v69 = 0;
          }
          int v70 = v68 | v69;
          if (qword_10003C018)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
              int v71 = 8;
            }
            else {
              int v71 = 0;
            }
          }
          else
          {
            int v71 = 0;
          }
          int v72 = v70 | v71;
          if (qword_10003C020)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
              int v73 = 16;
            }
            else {
              int v73 = 0;
            }
          }
          else
          {
            int v73 = 0;
          }
          int v74 = v72 | v73;
          if (qword_10003C028)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
              int v75 = 32;
            }
            else {
              int v75 = 0;
            }
          }
          else
          {
            int v75 = 0;
          }
          int v76 = v75 | v74;
          if (qword_10003C030)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
              int v77 = 64;
            }
            else {
              int v77 = 0;
            }
          }
          else
          {
            int v77 = 0;
          }
          int v78 = v76 + v77;
          if (qword_10003C038)
          {
            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
              int v79 = 128;
            }
            else {
              int v79 = 0;
            }
          }
          else
          {
            int v79 = 0;
          }
          *(_DWORD *)buf = 67109890;
          int v254 = v78 + v79;
          __int16 v255 = 2080;
          v256 = "startInterface";
          __int16 v257 = 1024;
          int v258 = 140;
          __int16 v259 = 1024;
          int v260 = v3;
          goto LABEL_80;
        }
      }
      else
      {
        uint64_t v9 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 2376) + 72))(*(void *)(a1 + 2376), a1 + 2360);
        if (v9)
        {
          uint64_t v3 = v9;
          if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            if (qword_10003C000) {
              BOOL v10 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
            }
            else {
              BOOL v10 = 0;
            }
            if (qword_10003C008)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                int v82 = 2;
              }
              else {
                int v82 = 0;
              }
            }
            else
            {
              int v82 = 0;
            }
            int v83 = v10 | v82;
            if (qword_10003C010)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                int v84 = 4;
              }
              else {
                int v84 = 0;
              }
            }
            else
            {
              int v84 = 0;
            }
            int v85 = v83 | v84;
            if (qword_10003C018)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                int v86 = 8;
              }
              else {
                int v86 = 0;
              }
            }
            else
            {
              int v86 = 0;
            }
            int v87 = v85 | v86;
            if (qword_10003C020)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                int v88 = 16;
              }
              else {
                int v88 = 0;
              }
            }
            else
            {
              int v88 = 0;
            }
            int v89 = v87 | v88;
            if (qword_10003C028)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                int v90 = 32;
              }
              else {
                int v90 = 0;
              }
            }
            else
            {
              int v90 = 0;
            }
            int v91 = v90 | v89;
            if (qword_10003C030)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                int v92 = 64;
              }
              else {
                int v92 = 0;
              }
            }
            else
            {
              int v92 = 0;
            }
            int v93 = v91 + v92;
            if (qword_10003C038)
            {
              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                int v94 = 128;
              }
              else {
                int v94 = 0;
              }
            }
            else
            {
              int v94 = 0;
            }
            *(_DWORD *)buf = 67109890;
            int v254 = v93 + v94;
            __int16 v255 = 2080;
            v256 = "startInterface";
            __int16 v257 = 1024;
            int v258 = 146;
            __int16 v259 = 1024;
            int v260 = v3;
            goto LABEL_80;
          }
        }
        else
        {
          uint64_t v11 = IODataQueueDispatchSource::SetDataAvailableHandler(*(IODataQueueDispatchSource **)(a1 + 2360), *(OSAction **)(a1 + 2352), 0);
          if (v11)
          {
            uint64_t v3 = v11;
            if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              if (qword_10003C000) {
                BOOL v12 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
              }
              else {
                BOOL v12 = 0;
              }
              if (qword_10003C008)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                  int v98 = 2;
                }
                else {
                  int v98 = 0;
                }
              }
              else
              {
                int v98 = 0;
              }
              int v99 = v12 | v98;
              if (qword_10003C010)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                  int v100 = 4;
                }
                else {
                  int v100 = 0;
                }
              }
              else
              {
                int v100 = 0;
              }
              int v101 = v99 | v100;
              if (qword_10003C018)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                  int v102 = 8;
                }
                else {
                  int v102 = 0;
                }
              }
              else
              {
                int v102 = 0;
              }
              int v103 = v101 | v102;
              if (qword_10003C020)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                  int v104 = 16;
                }
                else {
                  int v104 = 0;
                }
              }
              else
              {
                int v104 = 0;
              }
              int v105 = v103 | v104;
              if (qword_10003C028)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                  int v106 = 32;
                }
                else {
                  int v106 = 0;
                }
              }
              else
              {
                int v106 = 0;
              }
              int v107 = v106 | v105;
              if (qword_10003C030)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                  int v108 = 64;
                }
                else {
                  int v108 = 0;
                }
              }
              else
              {
                int v108 = 0;
              }
              int v109 = v107 + v108;
              if (qword_10003C038)
              {
                if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                  int v110 = 128;
                }
                else {
                  int v110 = 0;
                }
              }
              else
              {
                int v110 = 0;
              }
              *(_DWORD *)buf = 67109890;
              int v254 = v109 + v110;
              __int16 v255 = 2080;
              v256 = "startInterface";
              __int16 v257 = 1024;
              int v258 = 152;
              __int16 v259 = 1024;
              int v260 = v3;
              goto LABEL_80;
            }
          }
          else
          {
            uint64_t v13 = IOUserNetworkTxCompletionQueue::Create(*(IOUserNetworkPacketBufferPool **)(a1 + 2024), *(OSObject **)(a1 + 1960), 0x100u, 0, *(IODispatchQueue **)(a1 + 1976), (IOUserNetworkTxCompletionQueue **)(a1 + 2384));
            if (v13)
            {
              uint64_t v3 = v13;
              if ((dword_10003C040 & 1) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                if (qword_10003C000) {
                  BOOL v97 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                }
                else {
                  BOOL v97 = 0;
                }
                if (qword_10003C008)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                    int v126 = 2;
                  }
                  else {
                    int v126 = 0;
                  }
                }
                else
                {
                  int v126 = 0;
                }
                int v127 = v97 | v126;
                if (qword_10003C010)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                    int v128 = 4;
                  }
                  else {
                    int v128 = 0;
                  }
                }
                else
                {
                  int v128 = 0;
                }
                int v129 = v127 | v128;
                if (qword_10003C018)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                    int v130 = 8;
                  }
                  else {
                    int v130 = 0;
                  }
                }
                else
                {
                  int v130 = 0;
                }
                int v131 = v129 | v130;
                if (qword_10003C020)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                    int v132 = 16;
                  }
                  else {
                    int v132 = 0;
                  }
                }
                else
                {
                  int v132 = 0;
                }
                int v133 = v131 | v132;
                if (qword_10003C028)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                    int v134 = 32;
                  }
                  else {
                    int v134 = 0;
                  }
                }
                else
                {
                  int v134 = 0;
                }
                int v135 = v134 | v133;
                if (qword_10003C030)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                    int v136 = 64;
                  }
                  else {
                    int v136 = 0;
                  }
                }
                else
                {
                  int v136 = 0;
                }
                int v137 = v135 + v136;
                if (qword_10003C038)
                {
                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                    int v138 = 128;
                  }
                  else {
                    int v138 = 0;
                  }
                }
                else
                {
                  int v138 = 0;
                }
                *(_DWORD *)buf = 67109890;
                int v254 = v137 + v138;
                __int16 v255 = 2080;
                v256 = "startInterface";
                __int16 v257 = 1024;
                int v258 = 158;
                __int16 v259 = 1024;
                int v260 = v3;
                goto LABEL_80;
              }
            }
            else
            {
              uint64_t v15 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 2384) + 72))(*(void *)(a1 + 2384), a1 + 2368);
              if (v15)
              {
                uint64_t v3 = v15;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  if (qword_10003C000) {
                    BOOL v16 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                  }
                  else {
                    BOOL v16 = 0;
                  }
                  if (qword_10003C008)
                  {
                    if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                      int v21 = 2;
                    }
                    else {
                      int v21 = 0;
                    }
                  }
                  else
                  {
                    int v21 = 0;
                  }
                  int v22 = v16 | v21;
                  if (qword_10003C010)
                  {
                    if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                      int v23 = 4;
                    }
                    else {
                      int v23 = 0;
                    }
                  }
                  else
                  {
                    int v23 = 0;
                  }
                  int v24 = v22 | v23;
                  if (qword_10003C018)
                  {
                    if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                      int v25 = 8;
                    }
                    else {
                      int v25 = 0;
                    }
                  }
                  else
                  {
                    int v25 = 0;
                  }
                  int v26 = v24 | v25;
                  if (qword_10003C020)
                  {
                    if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                      int v27 = 16;
                    }
                    else {
                      int v27 = 0;
                    }
                  }
                  else
                  {
                    int v27 = 0;
                  }
                  int v28 = v26 | v27;
                  if (qword_10003C028)
                  {
                    if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                      int v29 = 32;
                    }
                    else {
                      int v29 = 0;
                    }
                  }
                  else
                  {
                    int v29 = 0;
                  }
                  int v30 = v29 | v28;
                  if (qword_10003C030)
                  {
                    if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                      int v31 = 64;
                    }
                    else {
                      int v31 = 0;
                    }
                  }
                  else
                  {
                    int v31 = 0;
                  }
                  int v32 = v30 + v31;
                  if (qword_10003C038)
                  {
                    if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                      int v33 = 128;
                    }
                    else {
                      int v33 = 0;
                    }
                  }
                  else
                  {
                    int v33 = 0;
                  }
                  *(_DWORD *)buf = 67109890;
                  int v254 = v32 + v33;
                  __int16 v255 = 2080;
                  v256 = "startInterface";
                  __int16 v257 = 1024;
                  int v258 = 164;
                  __int16 v259 = 1024;
                  int v260 = v3;
                  goto LABEL_80;
                }
              }
              else
              {
                uint64_t v17 = IOUserNetworkRxSubmissionQueue::Create(*(IOUserNetworkPacketBufferPool **)(a1 + 2024), *(OSObject **)(a1 + 1960), 0x100u, 0, *(IODispatchQueue **)(a1 + 1976), (IOUserNetworkRxSubmissionQueue **)(a1 + 2728));
                if (v17)
                {
                  uint64_t v3 = v17;
                  if ((dword_10003C040 & 1) != 0
                    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    if (qword_10003C000) {
                      BOOL v18 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                    }
                    else {
                      BOOL v18 = 0;
                    }
                    if (qword_10003C008)
                    {
                      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                        int v141 = 2;
                      }
                      else {
                        int v141 = 0;
                      }
                    }
                    else
                    {
                      int v141 = 0;
                    }
                    int v142 = v18 | v141;
                    if (qword_10003C010)
                    {
                      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                        int v143 = 4;
                      }
                      else {
                        int v143 = 0;
                      }
                    }
                    else
                    {
                      int v143 = 0;
                    }
                    int v144 = v142 | v143;
                    if (qword_10003C018)
                    {
                      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                        int v145 = 8;
                      }
                      else {
                        int v145 = 0;
                      }
                    }
                    else
                    {
                      int v145 = 0;
                    }
                    int v146 = v144 | v145;
                    if (qword_10003C020)
                    {
                      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                        int v147 = 16;
                      }
                      else {
                        int v147 = 0;
                      }
                    }
                    else
                    {
                      int v147 = 0;
                    }
                    int v148 = v146 | v147;
                    if (qword_10003C028)
                    {
                      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                        int v149 = 32;
                      }
                      else {
                        int v149 = 0;
                      }
                    }
                    else
                    {
                      int v149 = 0;
                    }
                    int v150 = v149 | v148;
                    if (qword_10003C030)
                    {
                      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                        int v151 = 64;
                      }
                      else {
                        int v151 = 0;
                      }
                    }
                    else
                    {
                      int v151 = 0;
                    }
                    int v152 = v150 + v151;
                    if (qword_10003C038)
                    {
                      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                        int v153 = 128;
                      }
                      else {
                        int v153 = 0;
                      }
                    }
                    else
                    {
                      int v153 = 0;
                    }
                    *(_DWORD *)buf = 67109890;
                    int v254 = v152 + v153;
                    __int16 v255 = 2080;
                    v256 = "startInterface";
                    __int16 v257 = 1024;
                    int v258 = 171;
                    __int16 v259 = 1024;
                    int v260 = v3;
                    goto LABEL_80;
                  }
                }
                else
                {
                  uint64_t ActionRxSubmit = DriverKit_AppleEthernetIXGBE::CreateActionRxSubmit(*(OSObject **)(a1 + 1960), 8uLL, (OSAction **)(a1 + 2704));
                  if (ActionRxSubmit)
                  {
                    uint64_t v3 = ActionRxSubmit;
                    if ((dword_10003C040 & 1) != 0
                      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      if (qword_10003C000) {
                        BOOL v20 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                      }
                      else {
                        BOOL v20 = 0;
                      }
                      if (qword_10003C008)
                      {
                        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                          int v154 = 2;
                        }
                        else {
                          int v154 = 0;
                        }
                      }
                      else
                      {
                        int v154 = 0;
                      }
                      int v155 = v20 | v154;
                      if (qword_10003C010)
                      {
                        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                          int v156 = 4;
                        }
                        else {
                          int v156 = 0;
                        }
                      }
                      else
                      {
                        int v156 = 0;
                      }
                      int v157 = v155 | v156;
                      if (qword_10003C018)
                      {
                        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                          int v158 = 8;
                        }
                        else {
                          int v158 = 0;
                        }
                      }
                      else
                      {
                        int v158 = 0;
                      }
                      int v159 = v157 | v158;
                      if (qword_10003C020)
                      {
                        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                          int v160 = 16;
                        }
                        else {
                          int v160 = 0;
                        }
                      }
                      else
                      {
                        int v160 = 0;
                      }
                      int v161 = v159 | v160;
                      if (qword_10003C028)
                      {
                        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                          int v162 = 32;
                        }
                        else {
                          int v162 = 0;
                        }
                      }
                      else
                      {
                        int v162 = 0;
                      }
                      int v163 = v162 | v161;
                      if (qword_10003C030)
                      {
                        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                          int v164 = 64;
                        }
                        else {
                          int v164 = 0;
                        }
                      }
                      else
                      {
                        int v164 = 0;
                      }
                      int v165 = v163 + v164;
                      if (qword_10003C038)
                      {
                        if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                          int v166 = 128;
                        }
                        else {
                          int v166 = 0;
                        }
                      }
                      else
                      {
                        int v166 = 0;
                      }
                      *(_DWORD *)buf = 67109890;
                      int v254 = v165 + v166;
                      __int16 v255 = 2080;
                      v256 = "startInterface";
                      __int16 v257 = 1024;
                      int v258 = 177;
                      __int16 v259 = 1024;
                      int v260 = v3;
                      goto LABEL_80;
                    }
                  }
                  else
                  {
                    uint64_t v35 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 2728) + 72))(*(void *)(a1 + 2728), a1 + 2712);
                    if (v35)
                    {
                      uint64_t v3 = v35;
                      if ((dword_10003C040 & 1) != 0
                        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        if (qword_10003C000) {
                          BOOL v36 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                        }
                        else {
                          BOOL v36 = 0;
                        }
                        if (qword_10003C008)
                        {
                          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                            int v167 = 2;
                          }
                          else {
                            int v167 = 0;
                          }
                        }
                        else
                        {
                          int v167 = 0;
                        }
                        int v168 = v36 | v167;
                        if (qword_10003C010)
                        {
                          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                            int v169 = 4;
                          }
                          else {
                            int v169 = 0;
                          }
                        }
                        else
                        {
                          int v169 = 0;
                        }
                        int v170 = v168 | v169;
                        if (qword_10003C018)
                        {
                          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                            int v171 = 8;
                          }
                          else {
                            int v171 = 0;
                          }
                        }
                        else
                        {
                          int v171 = 0;
                        }
                        int v172 = v170 | v171;
                        if (qword_10003C020)
                        {
                          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                            int v173 = 16;
                          }
                          else {
                            int v173 = 0;
                          }
                        }
                        else
                        {
                          int v173 = 0;
                        }
                        int v174 = v172 | v173;
                        if (qword_10003C028)
                        {
                          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                            int v175 = 32;
                          }
                          else {
                            int v175 = 0;
                          }
                        }
                        else
                        {
                          int v175 = 0;
                        }
                        int v176 = v175 | v174;
                        if (qword_10003C030)
                        {
                          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                            int v177 = 64;
                          }
                          else {
                            int v177 = 0;
                          }
                        }
                        else
                        {
                          int v177 = 0;
                        }
                        int v178 = v176 + v177;
                        if (qword_10003C038)
                        {
                          if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                            int v179 = 128;
                          }
                          else {
                            int v179 = 0;
                          }
                        }
                        else
                        {
                          int v179 = 0;
                        }
                        *(_DWORD *)buf = 67109890;
                        int v254 = v178 + v179;
                        __int16 v255 = 2080;
                        v256 = "startInterface";
                        __int16 v257 = 1024;
                        int v258 = 183;
                        __int16 v259 = 1024;
                        int v260 = v3;
                        goto LABEL_80;
                      }
                    }
                    else
                    {
                      uint64_t v50 = IODataQueueDispatchSource::SetDataAvailableHandler(*(IODataQueueDispatchSource **)(a1 + 2712), *(OSAction **)(a1 + 2704), 0);
                      if (v50)
                      {
                        uint64_t v3 = v50;
                        if ((dword_10003C040 & 1) != 0
                          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          if (qword_10003C000) {
                            BOOL v51 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                          }
                          else {
                            BOOL v51 = 0;
                          }
                          if (qword_10003C008)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                              int v180 = 2;
                            }
                            else {
                              int v180 = 0;
                            }
                          }
                          else
                          {
                            int v180 = 0;
                          }
                          int v181 = v51 | v180;
                          if (qword_10003C010)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                              int v182 = 4;
                            }
                            else {
                              int v182 = 0;
                            }
                          }
                          else
                          {
                            int v182 = 0;
                          }
                          int v183 = v181 | v182;
                          if (qword_10003C018)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                              int v184 = 8;
                            }
                            else {
                              int v184 = 0;
                            }
                          }
                          else
                          {
                            int v184 = 0;
                          }
                          int v185 = v183 | v184;
                          if (qword_10003C020)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                              int v186 = 16;
                            }
                            else {
                              int v186 = 0;
                            }
                          }
                          else
                          {
                            int v186 = 0;
                          }
                          int v187 = v185 | v186;
                          if (qword_10003C028)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                              int v188 = 32;
                            }
                            else {
                              int v188 = 0;
                            }
                          }
                          else
                          {
                            int v188 = 0;
                          }
                          int v189 = v188 | v187;
                          if (qword_10003C030)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                              int v190 = 64;
                            }
                            else {
                              int v190 = 0;
                            }
                          }
                          else
                          {
                            int v190 = 0;
                          }
                          int v191 = v189 + v190;
                          if (qword_10003C038)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                              int v192 = 128;
                            }
                            else {
                              int v192 = 0;
                            }
                          }
                          else
                          {
                            int v192 = 0;
                          }
                          *(_DWORD *)buf = 67109890;
                          int v254 = v191 + v192;
                          __int16 v255 = 2080;
                          v256 = "startInterface";
                          __int16 v257 = 1024;
                          int v258 = 189;
                          __int16 v259 = 1024;
                          int v260 = v3;
                          goto LABEL_80;
                        }
                      }
                      else
                      {
                        uint64_t v65 = IOUserNetworkRxCompletionQueue::Create(*(IOUserNetworkPacketBufferPool **)(a1 + 2024), *(OSObject **)(a1 + 1960), 0x100u, 0, *(IODispatchQueue **)(a1 + 1976), (IOUserNetworkRxCompletionQueue **)(a1 + 2736));
                        if (!v65)
                        {
                          uint64_t v80 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 2736) + 72))(*(void *)(a1 + 2736), a1 + 2720);
                          if (v80)
                          {
                            uint64_t v3 = v80;
                            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                              return v3;
                            }
                            if (qword_10003C000) {
                              BOOL v81 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                            }
                            else {
                              BOOL v81 = 0;
                            }
                            if (qword_10003C008)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                                int v113 = 2;
                              }
                              else {
                                int v113 = 0;
                              }
                            }
                            else
                            {
                              int v113 = 0;
                            }
                            int v114 = v81 | v113;
                            if (qword_10003C010)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                                int v115 = 4;
                              }
                              else {
                                int v115 = 0;
                              }
                            }
                            else
                            {
                              int v115 = 0;
                            }
                            int v116 = v114 | v115;
                            if (qword_10003C018)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                                int v117 = 8;
                              }
                              else {
                                int v117 = 0;
                              }
                            }
                            else
                            {
                              int v117 = 0;
                            }
                            int v118 = v116 | v117;
                            if (qword_10003C020)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                                int v119 = 16;
                              }
                              else {
                                int v119 = 0;
                              }
                            }
                            else
                            {
                              int v119 = 0;
                            }
                            int v120 = v118 | v119;
                            if (qword_10003C028)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                                int v121 = 32;
                              }
                              else {
                                int v121 = 0;
                              }
                            }
                            else
                            {
                              int v121 = 0;
                            }
                            int v122 = v121 | v120;
                            if (qword_10003C030)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                                int v123 = 64;
                              }
                              else {
                                int v123 = 0;
                              }
                            }
                            else
                            {
                              int v123 = 0;
                            }
                            int v124 = v122 + v123;
                            if (qword_10003C038)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                                int v125 = 128;
                              }
                              else {
                                int v125 = 0;
                              }
                            }
                            else
                            {
                              int v125 = 0;
                            }
                            *(_DWORD *)buf = 67109890;
                            int v254 = v124 + v125;
                            __int16 v255 = 2080;
                            v256 = "startInterface";
                            __int16 v257 = 1024;
                            int v258 = 201;
                            __int16 v259 = 1024;
                            int v260 = v3;
                            goto LABEL_80;
                          }
                          unsigned int v261 = 256;
                          uint64_t v95 = sub_100013BD8(a1, (uint64_t)buf, &v261);
                          if (v95)
                          {
                            uint64_t v3 = v95;
                            if ((dword_10003C040 & 1) == 0
                              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                            {
                              return v3;
                            }
                            if (qword_10003C000) {
                              BOOL v96 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                            }
                            else {
                              BOOL v96 = 0;
                            }
                            if (qword_10003C008)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                                int v206 = 2;
                              }
                              else {
                                int v206 = 0;
                              }
                            }
                            else
                            {
                              int v206 = 0;
                            }
                            int v207 = v96 | v206;
                            if (qword_10003C010)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                                int v208 = 4;
                              }
                              else {
                                int v208 = 0;
                              }
                            }
                            else
                            {
                              int v208 = 0;
                            }
                            int v209 = v207 | v208;
                            if (qword_10003C018)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                                int v210 = 8;
                              }
                              else {
                                int v210 = 0;
                              }
                            }
                            else
                            {
                              int v210 = 0;
                            }
                            int v211 = v209 | v210;
                            if (qword_10003C020)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                                int v212 = 16;
                              }
                              else {
                                int v212 = 0;
                              }
                            }
                            else
                            {
                              int v212 = 0;
                            }
                            int v213 = v211 | v212;
                            if (qword_10003C028)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                                int v214 = 32;
                              }
                              else {
                                int v214 = 0;
                              }
                            }
                            else
                            {
                              int v214 = 0;
                            }
                            int v215 = v214 | v213;
                            if (qword_10003C030)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                                int v216 = 64;
                              }
                              else {
                                int v216 = 0;
                              }
                            }
                            else
                            {
                              int v216 = 0;
                            }
                            int v217 = v215 + v216;
                            if (qword_10003C038)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                                int v218 = 128;
                              }
                              else {
                                int v218 = 0;
                              }
                            }
                            else
                            {
                              int v218 = 0;
                            }
                            *(_DWORD *)v252 = 67109890;
                            *(_DWORD *)&v252[4] = v217 + v218;
                            *(_WORD *)&v252[8] = 2080;
                            *(void *)&v252[10] = "startInterface";
                            *(_WORD *)&v252[18] = 1024;
                            *(_DWORD *)&v252[20] = 212;
                            *(_WORD *)&v252[24] = 1024;
                            *(_DWORD *)&v252[26] = v3;
                          }
                          else
                          {
                            uint64_t v111 = (*(uint64_t (**)(void, uint8_t *, void))(**(void **)(a1 + 1960) + 72))(*(void *)(a1 + 1960), buf, v261);
                            if (!v111)
                            {
                              long long v139 = *(_OWORD *)(a1 + 2728);
                              *(_OWORD *)v252 = *(_OWORD *)(a1 + 2376);
                              *(_OWORD *)&v252[16] = v139;
                              uint64_t v3 = (*(uint64_t (**)(void, unint64_t, void, unsigned char *, uint64_t))(**(void **)(a1 + 1960) + 272))(*(void *)(a1 + 1960), *(unsigned int *)(a1 + 700) | ((unint64_t)*(unsigned __int16 *)(a1 + 704) << 32), *(void *)(a1 + 2024), v252, 4);
                              if ((dword_10003C040 & 1) != 0
                                && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                              {
                                if (qword_10003C000) {
                                  BOOL v140 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                                }
                                else {
                                  BOOL v140 = 0;
                                }
                                if (qword_10003C008)
                                {
                                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                                    int v232 = 2;
                                  }
                                  else {
                                    int v232 = 0;
                                  }
                                }
                                else
                                {
                                  int v232 = 0;
                                }
                                int v233 = v140 | v232;
                                if (qword_10003C010)
                                {
                                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                                    int v234 = 4;
                                  }
                                  else {
                                    int v234 = 0;
                                  }
                                }
                                else
                                {
                                  int v234 = 0;
                                }
                                int v235 = v233 | v234;
                                if (qword_10003C018)
                                {
                                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                                    int v236 = 8;
                                  }
                                  else {
                                    int v236 = 0;
                                  }
                                }
                                else
                                {
                                  int v236 = 0;
                                }
                                int v237 = v235 | v236;
                                if (qword_10003C020)
                                {
                                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                                    int v238 = 16;
                                  }
                                  else {
                                    int v238 = 0;
                                  }
                                }
                                else
                                {
                                  int v238 = 0;
                                }
                                int v239 = v237 | v238;
                                if (qword_10003C028)
                                {
                                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                                    int v240 = 32;
                                  }
                                  else {
                                    int v240 = 0;
                                  }
                                }
                                else
                                {
                                  int v240 = 0;
                                }
                                int v241 = v240 | v239;
                                if (qword_10003C030)
                                {
                                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                                    int v242 = 64;
                                  }
                                  else {
                                    int v242 = 0;
                                  }
                                }
                                else
                                {
                                  int v242 = 0;
                                }
                                int v243 = v241 + v242;
                                if (qword_10003C038)
                                {
                                  if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                                    int v244 = 128;
                                  }
                                  else {
                                    int v244 = 0;
                                  }
                                }
                                else
                                {
                                  int v244 = 0;
                                }
                                v245[0] = 67109890;
                                v245[1] = v243 + v244;
                                __int16 v246 = 2080;
                                v247 = "startInterface";
                                __int16 v248 = 1024;
                                int v249 = 227;
                                __int16 v250 = 1024;
                                int v251 = v3;
                                int v34 = (uint8_t *)v245;
                                goto LABEL_81;
                              }
                              return v3;
                            }
                            uint64_t v3 = v111;
                            if ((dword_10003C040 & 1) == 0
                              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                            {
                              return v3;
                            }
                            if (qword_10003C000) {
                              BOOL v112 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                            }
                            else {
                              BOOL v112 = 0;
                            }
                            if (qword_10003C008)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                                int v219 = 2;
                              }
                              else {
                                int v219 = 0;
                              }
                            }
                            else
                            {
                              int v219 = 0;
                            }
                            int v220 = v112 | v219;
                            if (qword_10003C010)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                                int v221 = 4;
                              }
                              else {
                                int v221 = 0;
                              }
                            }
                            else
                            {
                              int v221 = 0;
                            }
                            int v222 = v220 | v221;
                            if (qword_10003C018)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                                int v223 = 8;
                              }
                              else {
                                int v223 = 0;
                              }
                            }
                            else
                            {
                              int v223 = 0;
                            }
                            int v224 = v222 | v223;
                            if (qword_10003C020)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                                int v225 = 16;
                              }
                              else {
                                int v225 = 0;
                              }
                            }
                            else
                            {
                              int v225 = 0;
                            }
                            int v226 = v224 | v225;
                            if (qword_10003C028)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                                int v227 = 32;
                              }
                              else {
                                int v227 = 0;
                              }
                            }
                            else
                            {
                              int v227 = 0;
                            }
                            int v228 = v227 | v226;
                            if (qword_10003C030)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                                int v229 = 64;
                              }
                              else {
                                int v229 = 0;
                              }
                            }
                            else
                            {
                              int v229 = 0;
                            }
                            int v230 = v228 + v229;
                            if (qword_10003C038)
                            {
                              if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                                int v231 = 128;
                              }
                              else {
                                int v231 = 0;
                              }
                            }
                            else
                            {
                              int v231 = 0;
                            }
                            *(_DWORD *)v252 = 67109890;
                            *(_DWORD *)&v252[4] = v230 + v231;
                            *(_WORD *)&v252[8] = 2080;
                            *(void *)&v252[10] = "startInterface";
                            *(_WORD *)&v252[18] = 1024;
                            *(_DWORD *)&v252[20] = 217;
                            *(_WORD *)&v252[24] = 1024;
                            *(_DWORD *)&v252[26] = v3;
                          }
                          int v34 = v252;
                          goto LABEL_81;
                        }
                        uint64_t v3 = v65;
                        if ((dword_10003C040 & 1) != 0
                          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          if (qword_10003C000) {
                            BOOL v66 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
                          }
                          else {
                            BOOL v66 = 0;
                          }
                          if (qword_10003C008)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
                              int v193 = 2;
                            }
                            else {
                              int v193 = 0;
                            }
                          }
                          else
                          {
                            int v193 = 0;
                          }
                          int v194 = v66 | v193;
                          if (qword_10003C010)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
                              int v195 = 4;
                            }
                            else {
                              int v195 = 0;
                            }
                          }
                          else
                          {
                            int v195 = 0;
                          }
                          int v196 = v194 | v195;
                          if (qword_10003C018)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
                              int v197 = 8;
                            }
                            else {
                              int v197 = 0;
                            }
                          }
                          else
                          {
                            int v197 = 0;
                          }
                          int v198 = v196 | v197;
                          if (qword_10003C020)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
                              int v199 = 16;
                            }
                            else {
                              int v199 = 0;
                            }
                          }
                          else
                          {
                            int v199 = 0;
                          }
                          int v200 = v198 | v199;
                          if (qword_10003C028)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
                              int v201 = 32;
                            }
                            else {
                              int v201 = 0;
                            }
                          }
                          else
                          {
                            int v201 = 0;
                          }
                          int v202 = v201 | v200;
                          if (qword_10003C030)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
                              int v203 = 64;
                            }
                            else {
                              int v203 = 0;
                            }
                          }
                          else
                          {
                            int v203 = 0;
                          }
                          int v204 = v202 + v203;
                          if (qword_10003C038)
                          {
                            if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
                              int v205 = 128;
                            }
                            else {
                              int v205 = 0;
                            }
                          }
                          else
                          {
                            int v205 = 0;
                          }
                          *(_DWORD *)buf = 67109890;
                          int v254 = v204 + v205;
                          __int16 v255 = 2080;
                          v256 = "startInterface";
                          __int16 v257 = 1024;
                          int v258 = 195;
                          __int16 v259 = 1024;
                          int v260 = v3;
                          goto LABEL_80;
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
  }
  return v3;
}

uint64_t sub_100020C54(IOUserNetworkPacketQueue **a1)
{
  uint64_t v2 = sub_100019434((uint64_t)a1);
  if (!v2)
  {
    sub_100012980(a1);
    uint64_t v2 = IOUserNetworkPacketQueue::SetEnable(a1[342], 1, 0);
    if (!v2)
    {
      uint64_t v2 = IOUserNetworkPacketQueue::SetEnable(a1[341], 1, 0);
      if (!v2)
      {
        uint64_t v2 = IOUserNetworkPacketQueue::SetEnable(a1[298], 1, 0);
        if (!v2) {
          uint64_t v2 = IOUserNetworkPacketQueue::SetEnable(a1[297], 1, 0);
        }
      }
    }
  }
  if ((dword_10003C040 & 0x40) != 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (qword_10003C000) {
      BOOL v4 = IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C000);
    }
    else {
      BOOL v4 = 0;
    }
    if (qword_10003C008)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C008)) {
        int v5 = 2;
      }
      else {
        int v5 = 0;
      }
    }
    else
    {
      int v5 = 0;
    }
    int v6 = v4 | v5;
    if (qword_10003C010)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C010)) {
        int v7 = 4;
      }
      else {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
    int v8 = v6 | v7;
    if (qword_10003C018)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C018)) {
        int v9 = 8;
      }
      else {
        int v9 = 0;
      }
    }
    else
    {
      int v9 = 0;
    }
    int v10 = v8 | v9;
    if (qword_10003C020)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C020)) {
        int v11 = 16;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    int v12 = v10 | v11;
    if (qword_10003C028)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C028)) {
        int v13 = 32;
      }
      else {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    int v14 = v13 | v12;
    if (qword_10003C030)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C030)) {
        int v15 = 64;
      }
      else {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    int v16 = v14 + v15;
    if (qword_10003C038)
    {
      if (IODispatchQueue::OnQueue((IODispatchQueue *)qword_10003C038)) {
        int v17 = 128;
      }
      else {
        int v17 = 0;
      }
    }
    else
    {
      int v17 = 0;
    }
    v18[0] = 67109890;
    v18[1] = v16 + v17;
    __int16 v19 = 2080;
    BOOL v20 = "enable";
    __int16 v21 = 1024;
    int v22 = 244;
    __int16 v23 = 1024;
    int v24 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ixgbe: [%x] %s(%d): ==> 0x%08x\n", (uint8_t *)v18, 0x1Eu);
  }
  return v2;
}

uint64_t sub_100020EAC(IOUserNetworkPacketQueue **a1)
{
  sub_100019F08((uint64_t)a1);
  IOUserNetworkPacketQueue::SetEnable(a1[341], 0, 0);
  sub_100012590((uint64_t)a1, (uint64_t)(a1 + 299));
  IOUserNetworkPacketQueue::SetEnable(a1[342], 0, 0);
  IOUserNetworkPacketQueue::SetEnable(a1[297], 0, 0);
  sub_100012590((uint64_t)a1, (uint64_t)(a1 + 255));
  IOUserNetworkPacketQueue::SetEnable(a1[298], 0, 0);
  return sub_10001EDB8((uint64_t)a1);
}

uint64_t ixgbe_init_ops_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
  __dmb(1u);
  __int16 v2 = readData;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_ops_generic", 41, "ixgbe_init_ops_generic");
  }
  *(void *)(a1 + 1720) = ixgbe_init_eeprom_params_generic;
  if ((v2 & 0x100) != 0) {
    uint64_t v3 = ixgbe_read_eerd_generic;
  }
  else {
    uint64_t v3 = ixgbe_read_eeprom_bit_bang_generic;
  }
  BOOL v4 = ixgbe_read_eerd_buffer_generic;
  if ((v2 & 0x100) == 0) {
    BOOL v4 = ixgbe_read_eeprom_buffer_bit_bang_generic;
  }
  *(void *)(a1 + 1728) = v3;
  *(void *)(a1 + 1736) = v4;
  *(void *)(a1 + 1744) = ixgbe_write_eeprom_generic;
  *(void *)(a1 + 1752) = ixgbe_write_eeprom_buffer_bit_bang_generic;
  *(void *)(a1 + 1760) = ixgbe_validate_eeprom_checksum_generic;
  *(void *)(a1 + 1768) = ixgbe_update_eeprom_checksum_generic;
  *(void *)(a1 + 1776) = ixgbe_calc_eeprom_checksum_generic;
  *(void *)(a1 + 16) = ixgbe_init_hw_generic;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = ixgbe_start_hw_generic;
  *(void *)(a1 + 40) = ixgbe_clear_hw_cntrs_generic;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 176) = ixgbe_enable_rx_dma_generic;
  *(void *)(a1 + 72) = ixgbe_get_mac_addr_generic;
  *(void *)(a1 + 120) = ixgbe_stop_adapter_generic;
  *(void *)(a1 + 128) = ixgbe_get_bus_info_generic;
  *(void *)(a1 + 144) = ixgbe_set_lan_id_multi_port_pcie;
  *(void *)(a1 + 200) = ixgbe_acquire_swfw_sync;
  *(void *)(a1 + 208) = ixgbe_release_swfw_sync;
  *(void *)(a1 + 224) = prot_autoc_read_generic;
  *(void *)(a1 + 232) = prot_autoc_write_generic;
  *(void *)(a1 + 312) = ixgbe_led_on_generic;
  *(void *)(a1 + 320) = ixgbe_led_off_generic;
  *(void *)(a1 + 328) = ixgbe_blink_led_start_generic;
  *(void *)(a1 + 336) = ixgbe_blink_led_stop_generic;
  *(void *)(a1 + 344) = ixgbe_init_led_link_act_generic;
  *(void *)(a1 + 352) = ixgbe_set_rar_generic;
  *(void *)(a1 + 368) = ixgbe_clear_rar_generic;
  *(_OWORD *)(a1 + 376) = 0u;
  *(void *)(a1 + 400) = 0;
  *(void *)(a1 + 408) = ixgbe_init_rx_addrs_generic;
  *(void *)(a1 + 416) = ixgbe_update_uc_addr_list_generic;
  *(void *)(a1 + 424) = ixgbe_update_mc_addr_list_generic;
  *(void *)(a1 + 440) = ixgbe_enable_mc_generic;
  *(void *)(a1 + 448) = ixgbe_disable_mc_generic;
  *(void *)(a1 + 488) = 0;
  *(void *)(a1 + 472) = 0;
  *(_OWORD *)(a1 + 456) = 0u;
  *(void *)(a1 + 592) = ixgbe_enable_rx_generic;
  *(void *)(a1 + 584) = ixgbe_disable_rx_generic;
  *(void *)(a1 + 512) = ixgbe_fc_enable_generic;
  *(void *)(a1 + 520) = ixgbe_setup_fc_generic;
  *(void *)(a1 + 528) = ixgbe_fc_autoneg;
  *(void *)(a1 + 264) = 0;
  *(_OWORD *)(a1 + 280) = 0u;
  *(void *)(a1 + 632) = 0;
  *(_OWORD *)(a1 + 616) = 0u;
  return 0;
}

uint64_t ixgbe_init_eeprom_params_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_eeprom_params_generic", 1223, "ixgbe_init_eeprom_params_generic");
  }
  if (!*(_DWORD *)(a1 + 1784))
  {
    *(void *)(a1 + 1784) = 0xA00000003;
    *(_WORD *)(a1 + 1796) = 0;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
    __dmb(1u);
    uint32_t v2 = readData;
    if ((readData & 0x100) != 0)
    {
      *(_DWORD *)(a1 + 1784) = 1;
      *(_WORD *)(a1 + 1792) = 64 << ((v2 >> 11) & 0xF);
    }
    if ((v2 & 0x400) != 0) {
      int v3 = 16;
    }
    else {
      int v3 = 8;
    }
    *(_WORD *)(a1 + 1794) = v3;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Eeprom params: type = %d, size = %d, address bits: %d\n\n", "ixgbe_init_eeprom_params_generic", 1257, *(_DWORD *)(a1 + 1784), *(unsigned __int16 *)(a1 + 1792), v3);
    }
  }
  return 0;
}

uint64_t ixgbe_read_eerd_generic(uint64_t a1, unsigned int a2, _WORD *a3)
{
  return ixgbe_read_eerd_buffer_generic(a1, a2, 1, a3);
}

uint64_t ixgbe_read_eerd_buffer_generic(uint64_t a1, unsigned int a2, int a3, _WORD *a4)
{
  LODWORD(v5) = a3;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_eerd_buffer_generic", 1581, "ixgbe_read_eerd_buffer_generic");
  }
  (*(void (**)(uint64_t))(a1 + 1720))(a1);
  if (v5)
  {
    if (*(unsigned __int16 *)(a1 + 1792) <= a2)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Invalid EEPROM offset\n");
      }
    }
    else
    {
      uint64_t v5 = v5;
      for (uint32_t i = (4 * a2) | 1; ; i += 4)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x10014uLL, i);
        if (ixgbe_poll_eerd_eewr_done((IOPCIDevice **)a1, 0)) {
          break;
        }
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x10014uLL, &readData);
        __dmb(1u);
        *a4++ = HIWORD(readData);
        if (!--v5) {
          return 0;
        }
      }
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n");
      }
    }
    return 0xFFFFFFFFLL;
  }
  else
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Invalid EEPROM words\n", "ixgbe_read_eerd_buffer_generic", 1587);
    }
    return 4294967264;
  }
}

uint64_t ixgbe_read_eeprom_bit_bang_generic(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_eeprom_bit_bang_generic", 1550, "ixgbe_read_eeprom_bit_bang_generic");
  }
  (*(void (**)(uint64_t))(a1 + 1720))(a1);
  if (*(unsigned __int16 *)(a1 + 1792) <= a2) {
    return 0xFFFFFFFFLL;
  }
  return sub_100025A64(a1, a2, 1, a3);
}

uint64_t ixgbe_read_eeprom_buffer_bit_bang_generic(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_eeprom_buffer_bit_bang_generic", 1445, "ixgbe_read_eeprom_buffer_bit_bang_generic");
  }
  (*(void (**)(uint64_t))(a1 + 1720))(a1);
  if (!a3) {
    return 4294967264;
  }
  if (a3 + a2 > *(unsigned __int16 *)(a1 + 1792)) {
    return 0xFFFFFFFFLL;
  }
  unsigned __int16 v9 = 0;
  while (1)
  {
    int v10 = a3 - v9;
    if (v10 >= 256) {
      LOWORD(v10) = 256;
    }
    uint64_t result = sub_100025A64(a1, (unsigned __int16)(v9 + a2), (unsigned __int16)v10, a4 + 2 * v9);
    if (result) {
      break;
    }
    v9 += 256;
    if (a3 <= v9) {
      return 0;
    }
  }
  return result;
}

uint64_t ixgbe_write_eeprom_generic(uint64_t a1, unsigned int a2, __int16 a3)
{
  __int16 v6 = a3;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_eeprom_generic", 1415, "ixgbe_write_eeprom_generic");
  }
  (*(void (**)(uint64_t))(a1 + 1720))(a1);
  if (*(unsigned __int16 *)(a1 + 1792) <= a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return sub_1000258D4(a1, a2, 1u, (uint64_t)&v6);
  }
}

uint64_t ixgbe_write_eeprom_buffer_bit_bang_generic(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_eeprom_buffer_bit_bang_generic", 1278, "ixgbe_write_eeprom_buffer_bit_bang_generic");
  }
  (*(void (**)(uint64_t))(a1 + 1720))(a1);
  if (!a3) {
    return 4294967264;
  }
  if (a3 + a2 > *(unsigned __int16 *)(a1 + 1792)) {
    return 0xFFFFFFFFLL;
  }
  if (a3 >= 0x81 && !*(_WORD *)(a1 + 1796))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_detect_eeprom_page_size_generic", 1632, "ixgbe_detect_eeprom_page_size_generic");
    }
    uint64_t v9 = 0;
    int16x8_t v10 = (int16x8_t)xmmword_1000324C0;
    v11.i64[0] = 0x8000800080008;
    v11.i64[1] = 0x8000800080008;
    do
    {
      *(int16x8_t *)&v16[v9] = v10;
      int16x8_t v10 = vaddq_s16(v10, v11);
      v9 += 8;
    }
    while (v9 != 128);
    *(_WORD *)(a1 + 1796) = 128;
    int v12 = sub_1000258D4(a1, a2, 0x80u, (uint64_t)v16);
    *(_WORD *)(a1 + 1796) = 0;
    if (!v12 && !sub_100025A64(a1, a2, 1, (uint64_t)v16))
    {
      unsigned __int16 v13 = 128 - v16[0];
      *(_WORD *)(a1 + 1796) = 128 - v16[0];
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Detected EEPROM page size = %d words.\n", "ixgbe_detect_eeprom_page_size_generic", 1655, v13);
      }
    }
  }
  unsigned __int16 v14 = 0;
  while (1)
  {
    int v15 = a3 - v14;
    if (v15 >= 256) {
      LOWORD(v15) = 256;
    }
    uint64_t result = sub_1000258D4(a1, (unsigned __int16)(v14 + a2), (unsigned __int16)v15, a4 + 2 * v14);
    if (result) {
      break;
    }
    v14 += 256;
    if (a3 <= v14) {
      return 0;
    }
  }
  return result;
}

uint64_t ixgbe_validate_eeprom_checksum_generic(uint64_t a1, _WORD *a2)
{
  __int16 v9 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_eeprom_checksum_generic", 2247, "ixgbe_validate_eeprom_checksum_generic");
  }
  __int16 v10 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void, __int16 *))(a1 + 1728))(a1, 0, &v10);
  if (v4)
  {
    uint64_t v5 = v4;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_eeprom_checksum_generic", 2255, "EEPROM read failed\n");
    }
  }
  else
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1 + 1776))(a1);
    uint64_t v5 = v6;
    if ((v6 & 0x80000000) == 0)
    {
      __int16 v10 = v6;
      uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 1728))(a1, 63, &v9);
      if (v7)
      {
        uint64_t v5 = v7;
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_eeprom_checksum_generic", 2267, "EEPROM read failed\n");
        }
      }
      else
      {
        if (v9 == v10) {
          uint64_t v5 = 0;
        }
        else {
          uint64_t v5 = 4294967294;
        }
        if (a2) {
          *a2 = v10;
        }
      }
    }
  }
  return v5;
}

uint64_t ixgbe_update_eeprom_checksum_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_eeprom_checksum_generic", 2293, "ixgbe_update_eeprom_checksum_generic");
  }
  __int16 v6 = 0;
  uint64_t v2 = (*(uint64_t (**)(uint64_t, void, __int16 *))(a1 + 1728))(a1, 0, &v6);
  if (v2)
  {
    uint64_t v3 = v2;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_eeprom_checksum_generic", 2301, "EEPROM read failed\n");
    }
  }
  else
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(a1 + 1776))(a1);
    uint64_t v3 = v4;
    if ((v4 & 0x80000000) == 0)
    {
      __int16 v6 = v4;
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 1744))(a1, 63, (unsigned __int16)v4);
    }
  }
  return v3;
}

uint64_t ixgbe_calc_eeprom_checksum_generic(uint64_t a1)
{
  int v11 = 0;
  __int16 v10 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_generic", 2188, "ixgbe_calc_eeprom_checksum_generic");
  }
  __int16 v2 = 0;
  unsigned __int16 v3 = 0;
  do
  {
    unsigned int v4 = v3;
    if ((*(unsigned int (**)(uint64_t, void, __int16 *))(a1 + 1728))(a1, v3, &v10))
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_generic", 2193, "EEPROM read failed\n");
      }
      return 0xFFFFFFFFLL;
    }
    v2 += v10;
    ++v3;
  }
  while (v4 < 0x3E);
  unsigned __int16 v5 = 3;
  while (!(*(unsigned int (**)(uint64_t, void, int *))(a1 + 1728))(a1, v5, &v11))
  {
    if ((unsigned __int16)(v11 + 1) >= 2u)
    {
      if ((*(unsigned int (**)(uint64_t))(a1 + 1728))(a1))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_generic", 2211, "EEPROM read failed\n");
        }
        return 0xFFFFFFFFLL;
      }
      if ((unsigned __int16)(HIWORD(v11) + 1) >= 2u)
      {
        unsigned __int16 v7 = v11 + 1;
        for (unsigned int i = HIWORD(v11) + (unsigned __int16)v11; i >= v7; unsigned int i = HIWORD(v11) + (unsigned __int16)v11)
        {
          if ((*(unsigned int (**)(uint64_t, void, __int16 *))(a1 + 1728))(a1, v7, &v10))
          {
            if ((dword_10003C040 & 0x100000) != 0) {
              IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_generic", 2220, "EEPROM read failed\n");
            }
            return 0xFFFFFFFFLL;
          }
          v2 += v10;
          ++v7;
        }
      }
    }
    unsigned int v6 = v5++;
    if (v6 >= 0xE) {
      return (unsigned __int16)(-17734 - v2);
    }
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calc_eeprom_checksum_generic", 2202, "EEPROM read failed\n");
  }
  return 0xFFFFFFFFLL;
}

uint64_t ixgbe_init_hw_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_hw_generic", 468, "ixgbe_init_hw_generic");
  }
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 24))(a1);
  if (v2) {
    BOOL v3 = v2 == -20;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
  }
  uint64_t v4 = v2;
  unsigned __int16 v5 = *(void (**)(uint64_t))(a1 + 344);
  if (v5) {
    v5(a1);
  }
  if (v4 && (dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): Failed to initialize HW, STATUS = %d\n\n", "ixgbe_init_hw_generic", 483, v4);
  }
  return v4;
}

uint64_t ixgbe_start_hw_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_start_hw_generic", 367, "ixgbe_start_hw_generic");
  }
  __int16 v9 = 0;
  *(_DWORD *)(a1 + 1640) = (*(uint64_t (**)(uint64_t))(a1 + 56))(a1);
  (*(void (**)(uint64_t))(a1 + 456))(a1);
  (*(void (**)(uint64_t))(a1 + 40))(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x18uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData | 0x10000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x18uLL, v2);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v7);
  __dmb(1u);
  uint64_t v3 = ixgbe_setup_fc(a1);
  if (v3 && (uint64_t v4 = v3, v3 != 0x7FFFFFFF))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Flow control setup failed, returning %d\n\n", "ixgbe_start_hw_generic", 389, v3);
    }
  }
  else
  {
    unsigned int v5 = *(_DWORD *)(a1 + 696);
    *(unsigned char *)(a1 + 1955) = v5 <= 8
                         && ((1 << v5) & 0x184) != 0
                         && ((*(void (**)(uint64_t, __int16 *))(a1 + 96))(a1, &v9), (v9 & 0x80) == 0);
    uint64_t v4 = 0;
    *(unsigned char *)(a1 + 1945) = 0;
  }
  return v4;
}

uint64_t ixgbe_clear_hw_cntrs_generic(uint64_t a1)
{
  __int16 v14 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_clear_hw_cntrs_generic", 499, "ixgbe_clear_hw_cntrs_generic");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4000uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4004uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4008uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4010uLL, &readData);
  unsigned int v2 = 0;
  __dmb(1u);
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (4 * v2) | 0x3FA0, &readData);
    __dmb(1u);
    __int16 v14 = v2 + 1;
    BOOL v3 = v2++ >= 7;
  }
  while (!v3);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4034uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4038uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4040uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3F60uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3F68uLL, &readData);
  __dmb(1u);
  if (*(int *)(a1 + 696) < 2)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0xCF60uLL, &readData);
    __dmb(1u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0xCF68uLL, &readData);
  }
  else
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x41A4uLL, &readData);
    __dmb(1u);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x41A8uLL, &readData);
  }
  __dmb(1u);
  unsigned __int16 v4 = 0;
  __int16 v14 = 0;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (unsigned __int16)(4 * v4) | 0x3F00u, &readData);
    __dmb(1u);
    uint32_t readData = 0;
    uint64_t v5 = 4 * v4;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v5 + 16160, &readData);
    __dmb(1u);
    if (*(int *)(a1 + 696) < 2)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v5 + 52992, &readData);
      __dmb(1u);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v5 + 53024, &readData);
    }
    else
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v5 + 16704, &readData);
      __dmb(1u);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v5 + 16736, &readData);
    }
    __dmb(1u);
    __int16 v14 = ++v4;
  }
  while (v4 < 8u);
  if (*(int *)(a1 + 696) >= 2)
  {
    unsigned int v6 = 0;
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (4 * v6) | 0x3240, &readData);
      __dmb(1u);
      __int16 v14 = v6 + 1;
      BOOL v3 = v6++ >= 7;
    }
    while (!v3);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x405CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4060uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4064uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4068uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x406CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4070uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4074uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4078uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x407CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4080uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4088uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x408CuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4090uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4094uLL, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 696) == 1)
  {
    unsigned int v7 = 0;
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (4 * v7) | 0x3FC0, &readData);
      __dmb(1u);
      __int16 v14 = v7 + 1;
      BOOL v3 = v7++ >= 7;
    }
    while (!v3);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40A4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40A8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40ACuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40B0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40B4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40B8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0xCF90uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40C0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40C4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40D0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40D4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40D8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40DCuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40E0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40E4uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40E8uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40ECuLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40F0uLL, &readData);
  __dmb(1u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x40F4uLL, &readData);
  unsigned __int16 v8 = 0;
  __dmb(1u);
  __int16 v14 = 0;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (unsigned __int16)(v8 << 6) | 0x1030u, &readData);
    __dmb(1u);
    uint32_t readData = 0;
    uint64_t v9 = v8;
    unint64_t v10 = (unint64_t)v8 << 6;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v9 << 6) + 24624, &readData);
    __dmb(1u);
    uint64_t v11 = (v9 << 6) + 4148;
    if (*(int *)(a1 + 696) < 2)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v11, &readData);
      __dmb(1u);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v10 + 24628, &readData);
    }
    else
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v11, &readData);
      __dmb(1u);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v10 + 4152, &readData);
      __dmb(1u);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8 * v9 + 34560, &readData);
      __dmb(1u);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8 * v9 + 34564, &readData);
      __dmb(1u);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v10 + 5168, &readData);
    }
    __dmb(1u);
    unsigned __int16 v8 = v9 + 1;
    __int16 v14 = v9 + 1;
  }
  while ((unsigned __int16)(v9 + 1) < 0x10u);
  if ((*(_DWORD *)(a1 + 696) | 2) == 6)
  {
    if (!*(_DWORD *)(a1 + 1624)) {
      ixgbe_identify_phy(a1);
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 59408, 3, &v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 59409, 3, &v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 59424, 3, &v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1448))(a1, 59425, 3, &v14);
  }
  return 0;
}

uint64_t ixgbe_enable_rx_dma_generic(uint64_t a1, char a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_enable_rx_dma_generic", 3414, "ixgbe_enable_rx_dma_generic");
  }
  if (a2) {
    ixgbe_enable_rx(a1);
  }
  else {
    ixgbe_disable_rx(a1);
  }
  return 0;
}

uint64_t ixgbe_get_mac_addr_generic(IOPCIDevice **a1, uint64_t a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_mac_addr_generic", 951, "ixgbe_get_mac_addr_generic");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x5404uLL, &readData);
  __dmb(1u);
  __int16 v4 = readData;
  uint32_t v8 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x5400uLL, &v8);
  __dmb(1u);
  uint32x4_t v5 = (uint32x4_t)vld1q_dup_f32((const float *)&v8);
  int16x8_t v6 = (int16x8_t)vshlq_u32(v5, (uint32x4_t)xmmword_1000324D0);
  *(int16x4_t *)v6.i8 = vmovn_s32((int32x4_t)v6);
  *(_DWORD *)a2 = vmovn_s16(v6).u32[0];
  *(_WORD *)(a2 + 4) = v4;
  return 0;
}

uint64_t ixgbe_stop_adapter_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_stop_adapter_generic", 1083, "ixgbe_stop_adapter_generic");
  }
  *(unsigned char *)(a1 + 1945) = 1;
  ixgbe_disable_rx(a1);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x888uLL, 0xFFFFFFFF);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x800uLL, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 1260))
  {
    int v2 = 0;
    int v3 = 0;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, ((v2 << 6) + 24616), 0x4000000u);
      int v2 = (unsigned __int16)++v3;
    }
    while (*(_DWORD *)(a1 + 1260) > (unsigned __int16)v3);
  }
  if (*(_DWORD *)(a1 + 1264))
  {
    int v4 = 0;
    unsigned __int16 v5 = 0;
    do
    {
      uint32_t v11 = 0;
      if ((v5 & 0xFFC0) != 0) {
        int v6 = 49192;
      }
      else {
        int v6 = 4136;
      }
      uint64_t v7 = (v6 + (v4 << 6));
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v7, &v11);
      __dmb(1u);
      uint32_t v8 = v11 & 0xF9FFFFFF | 0x4000000;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v7, v8);
      int v4 = ++v5;
    }
    while (*(_DWORD *)(a1 + 1264) > v5);
  }
  uint32_t v10 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v10);
  __dmb(1u);
  IODelay(0x7D0uLL);
  return ixgbe_disable_pcie_master(a1);
}

uint64_t ixgbe_get_bus_info_generic(IOPCIDevice **a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_bus_info_generic", 1026, "ixgbe_get_bus_info_generic");
  }
  uint16_t readData = 0;
  IOPCIDevice::ConfigurationRead16(*a1, 0xB2uLL, &readData);
  ixgbe_set_pci_config_data_generic((uint64_t)a1, readData);
  return 0;
}

void ixgbe_set_lan_id_multi_port_pcie(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_lan_id_multi_port_pcie", 1050, "ixgbe_set_lan_id_multi_port_pcie");
  }
  unsigned __int16 v5 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  __int16 v2 = ((unsigned __int16)readData >> 2) & 3;
  *(_WORD *)(a1 + 1812) = v2;
  *(unsigned char *)(a1 + 1814) = v2;
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 16), &v3);
  __dmb(1u);
  if ((v3 & 0x40000000) != 0) {
    *(_WORD *)(a1 + 1812) ^= 1u;
  }
  if (*(_WORD *)(a1 + 1936) == 5582)
  {
    (*(void (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 1728))(a1, 69, &v5);
    *(_WORD *)(a1 + 1816) = (v5 >> 4) & 1;
  }
}

uint64_t ixgbe_acquire_swfw_sync(IOPCIDevice **a1, int a2)
{
  int v4 = 32 * a2;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_swfw_sync", 3261, "ixgbe_acquire_swfw_sync");
  }
  int v5 = v4 | a2;
  int v6 = 200;
  while (1)
  {
    if (sub_1000263D8((uint64_t)a1)) {
      return 4294967280;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0x10160uLL, &readData);
    __dmb(1u);
    uint32_t v7 = readData & v5;
    if ((readData & v5) == 0) {
      break;
    }
    sub_1000265B8(a1);
    IODelay(0x1388uLL);
    if (!--v6)
    {
      ixgbe_release_swfw_sync(a1, v7);
      IODelay(0x1388uLL);
      return 4294967280;
    }
  }
  uint32_t v9 = readData | a2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x10160uLL, v9);
  sub_1000265B8(a1);
  return 0;
}

void ixgbe_release_swfw_sync(IOPCIDevice **a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_release_swfw_sync", 3305, "ixgbe_release_swfw_sync");
  }
  sub_1000263D8((uint64_t)a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x10160uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & ~a2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x10160uLL, v4);
  sub_1000265B8(a1);
}

uint64_t prot_autoc_read_generic(IOPCIDevice **a1, unsigned char *a2, uint32_t *a3)
{
  *a2 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x42A0uLL, &readData);
  __dmb(1u);
  *a3 = readData;
  return 0;
}

uint64_t prot_autoc_write_generic(IOPCIDevice **a1, uint32_t data)
{
  return 0;
}

uint64_t ixgbe_led_on_generic(IOPCIDevice **a1, unsigned int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x200uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_led_on_generic", 1173, "ixgbe_led_on_generic");
  }
  if (a2 > 3) {
    return 4294967291;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x200uLL, v4 & ~(15 << (8 * a2)) | (14 << (8 * a2)));
  uint32_t v6 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v6);
  uint64_t result = 0;
  __dmb(1u);
  return result;
}

uint64_t ixgbe_led_off_generic(IOPCIDevice **a1, unsigned int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x200uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_led_off_generic", 1196, "ixgbe_led_off_generic");
  }
  if (a2 > 3) {
    return 4294967291;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x200uLL, v4 | (15 << (8 * a2)));
  uint32_t v6 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v6);
  uint64_t result = 0;
  __dmb(1u);
  return result;
}

uint64_t ixgbe_blink_led_start_generic(uint64_t a1, unsigned int a2)
{
  int v9 = 0;
  char v8 = 0;
  *(void *)uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x200uLL, readData);
  __dmb(1u);
  uint32_t v4 = readData[0];
  char v6 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_blink_led_start_generic", 3438, "ixgbe_blink_led_start_generic");
  }
  if (a2 > 3) {
    return 4294967291;
  }
  (*(void (**)(uint64_t, int *, char *, void))(a1 + 280))(a1, &v9, &v8, 0);
  if (v8) {
    goto LABEL_6;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint32_t *))(a1 + 224))(a1, &v6, &readData[1]);
  if (!result)
  {
    readData[1] |= 0x1001u;
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 232))(a1);
    if (!result)
    {
      readData[0] = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, readData);
      __dmb(1u);
      IODelay(0x2710uLL);
LABEL_6:
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x200uLL, v4 & ~(15 << (8 * a2)) | (128 << (8 * a2)));
      readData[0] = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, readData);
      uint64_t result = 0;
      __dmb(1u);
    }
  }
  return result;
}

uint64_t ixgbe_blink_led_stop_generic(uint64_t a1, unsigned int a2)
{
  unsigned int v9 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x200uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData;
  char v7 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_blink_led_stop_generic", 3486, "ixgbe_blink_led_stop_generic");
  }
  if (a2 > 3) {
    return 4294967291;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, unsigned int *))(a1 + 224))(a1, &v7, &v9);
  if (!result)
  {
    unsigned int v9 = v9 & 0xFFFFEFFE | 0x1000;
    uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 232))(a1);
    if (!result)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x200uLL, v4 & ~(143 << (8 * a2)) | (4 << (8 * a2)));
      uint32_t v6 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v6);
      uint64_t result = 0;
      __dmb(1u);
    }
  }
  return result;
}

uint64_t ixgbe_init_led_link_act_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x200uLL, &readData);
  char v2 = 0;
  int v3 = 0;
  __dmb(1u);
  while (((readData >> v2) & 0xF) != 4)
  {
    ++v3;
    v2 += 8;
    if (v3 == 4)
    {
      if ((*(_DWORD *)(a1 + 696) - 7) > 1) {
        LOBYTE(v3) = 2;
      }
      else {
        LOBYTE(v3) = 1;
      }
      break;
    }
  }
  *(unsigned char *)(a1 + 1308) = v3;
  return 0;
}

uint64_t ixgbe_set_rar_generic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v10 = *(_DWORD *)(a1 + 1248);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_rar_generic", 2358, "ixgbe_set_rar_generic");
  }
  if (v10 <= a2)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): RAR index %d is out of range.\n\n", "ixgbe_set_rar_generic", 2363, a2);
    }
    return 4294967264;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 384))(a1, a2, a4);
    uint32_t v11 = *(_DWORD *)a3;
    uint32_t readData = 0;
    if (a2 >= 0x10) {
      int v12 = 41476;
    }
    else {
      int v12 = 21508;
    }
    uint64_t v13 = (v12 + 8 * a2);
    if (a2 >= 0x10) {
      int v14 = 41472;
    }
    else {
      int v14 = 21504;
    }
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v13, &readData);
    __dmb(1u);
    uint32_t v15 = readData & 0x7FFF0000 | *(unsigned __int8 *)(a3 + 4) | (*(unsigned __int8 *)(a3 + 5) << 8);
    __dmb(2u);
    if (a5) {
      uint32_t v16 = v15 | 0x80000000;
    }
    else {
      uint32_t v16 = v15;
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v14 + 8 * a2), v11);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v13, v16);
    return 0;
  }
}

uint64_t ixgbe_clear_rar_generic(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a1 + 1248);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_clear_rar_generic", 2408, "ixgbe_clear_rar_generic");
  }
  if (v4 <= a2)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): RAR index %d is out of range.\n\n", "ixgbe_clear_rar_generic", 2413, a2);
    }
    return 4294967264;
  }
  else
  {
    uint32_t readData = 0;
    if (a2 >= 0x10) {
      int v5 = 41476;
    }
    else {
      int v5 = 21508;
    }
    uint64_t v6 = (v5 + 8 * a2);
    if (a2 >= 0x10) {
      int v7 = 41472;
    }
    else {
      int v7 = 21504;
    }
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v6, &readData);
    __dmb(1u);
    uint32_t v8 = readData & 0x7FFF0000;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v7 + 8 * a2), 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v6, v8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 400))(a1, a2, 0xFFFFFFFFLL);
    return 0;
  }
}

uint64_t ixgbe_init_rx_addrs_generic(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 1248);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_rx_addrs_generic", 2447, "ixgbe_init_rx_addrs_generic");
  }
  if (ixgbe_validate_mac_addr((unsigned __int8 *)(a1 + 700)) == -10)
  {
    (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, a1 + 700);
    if ((dword_10003C040 & 0x100000) != 0)
    {
      IOLog("ixgbe:%s(%d):  Keeping Current RAR0 Addr =%.2X %.2X %.2X \n", "ixgbe_init_rx_addrs_generic", 2461, *(unsigned __int8 *)(a1 + 700), *(unsigned __int8 *)(a1 + 701), *(unsigned __int8 *)(a1 + 702));
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %.2X %.2X %.2X\n\n", "ixgbe_init_rx_addrs_generic", 2463, *(unsigned __int8 *)(a1 + 703), *(unsigned __int8 *)(a1 + 704), *(unsigned __int8 *)(a1 + 705));
      }
    }
  }
  else
  {
    if ((dword_10003C040 & 0x100000) != 0)
    {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_rx_addrs_generic", 2466, "Overriding MAC Address in RAR[0]\n");
      if ((dword_10003C040 & 0x100000) != 0)
      {
        IOLog("ixgbe:%s(%d):  New MAC Addr =%.2X %.2X %.2X \n", "ixgbe_init_rx_addrs_generic", 2469, *(unsigned __int8 *)(a1 + 700), *(unsigned __int8 *)(a1 + 701), *(unsigned __int8 *)(a1 + 702));
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %.2X %.2X %.2X\n\n", "ixgbe_init_rx_addrs_generic", 2471, *(unsigned __int8 *)(a1 + 703), *(unsigned __int8 *)(a1 + 704), *(unsigned __int8 *)(a1 + 705));
        }
      }
    }
    (*(void (**)(uint64_t, void, uint64_t, void, uint64_t))(a1 + 352))(a1, 0, a1 + 700, 0, 0x80000000);
  }
  (*(void (**)(uint64_t, void, uint64_t))(a1 + 400))(a1, 0, 0xFFFFFFFFLL);
  *(_DWORD *)(a1 + 1324) = 0;
  *(_DWORD *)(a1 + 1316) = 1;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): Clearing RAR[1-%d]\n\n", "ixgbe_init_rx_addrs_generic", 2484, v2 - 1);
  }
  if (v2 >= 2)
  {
    unsigned int v3 = 1;
    int v4 = 8;
    do
    {
      __dmb(2u);
      if (v3 >= 0x10) {
        int v5 = 41472;
      }
      else {
        int v5 = 21504;
      }
      if (v3 >= 0x10) {
        int v6 = 41476;
      }
      else {
        int v6 = 21508;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v5 + v4), 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v6 + v4), 0);
      ++v3;
      v4 += 8;
    }
    while (v2 != v3);
  }
  *(_DWORD *)(a1 + 1320) = 0;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5090uLL, *(_DWORD *)(a1 + 1236));
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_rx_addrs_generic", 2494, " Clearing MTA\n");
  }
  if (*(_DWORD *)(a1 + 1240))
  {
    unint64_t v7 = 0;
    int v8 = 20992;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v8 & 0xFFFFFFFC, 0);
      ++v7;
      v8 += 4;
    }
    while (v7 < *(unsigned int *)(a1 + 1240));
  }
  ixgbe_init_uta_tables(a1);
  return 0;
}

uint64_t ixgbe_update_uc_addr_list_generic(uint64_t a1, uint64_t a2, int a3, uint64_t (*a4)(uint64_t, uint64_t *, unsigned int *))
{
  uint64_t v22 = a2;
  int v18 = *(_DWORD *)(a1 + 1324);
  if ((dword_10003C040 & 0x100000) != 0)
  {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_uc_addr_list_generic", 2561, "ixgbe_update_uc_addr_list_generic");
    int v7 = dword_10003C040;
    int v6 = *(_DWORD *)(a1 + 1316);
    *(_DWORD *)(a1 + 1316) = 1;
    *(_DWORD *)(a1 + 1324) = 0;
    if ((v7 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Clearing RAR[1-%d]\n\n", "ixgbe_update_uc_addr_list_generic", 2572, v6);
    }
  }
  else
  {
    int v6 = *(_DWORD *)(a1 + 1316);
    *(_DWORD *)(a1 + 1316) = 1;
    *(_DWORD *)(a1 + 1324) = 0;
  }
  int v8 = v6 - 1;
  if (v8)
  {
    unsigned int v9 = 0;
    int v10 = 8;
    do
    {
      __dmb(2u);
      unsigned int v11 = v9 + 1;
      BOOL v12 = v9 >= 0xF;
      if (v9 >= 0xF) {
        int v13 = 41472;
      }
      else {
        int v13 = 21504;
      }
      if (v12) {
        int v14 = 41476;
      }
      else {
        int v14 = 21508;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v13 + v10), 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v14 + v10), 0);
      v10 += 8;
      unsigned int v9 = v11;
    }
    while (v8 != v11);
  }
  for (unsigned int i = 0; a3; --a3)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_uc_addr_list_generic", 2580, " Adding the secondary addresses:\n");
    }
    uint32_t v15 = (unsigned __int8 *)a4(a1, &v22, &i);
    ixgbe_add_uc_addr(a1, v15, i);
  }
  if (*(_DWORD *)(a1 + 1324))
  {
    if (!v18 && !*(unsigned char *)(a1 + 1328))
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_uc_addr_list_generic", 2588, " Entering address overflow promisc mode\n");
      }
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x5080uLL, &readData);
      __dmb(1u);
      uint32_t v16 = readData | 0x200;
      __dmb(2u);
LABEL_29:
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5080uLL, v16);
    }
  }
  else if (v18 && !*(unsigned char *)(a1 + 1328))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_uc_addr_list_generic", 2596, " Leaving address overflow promisc mode\n");
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x5080uLL, &readData);
    __dmb(1u);
    uint32_t v16 = readData & 0xFFFFFDFF;
    __dmb(2u);
    goto LABEL_29;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_uc_addr_list_generic", 2603, "ixgbe_update_uc_addr_list_generic Complete\n");
  }
  return 0;
}

uint64_t ixgbe_update_mc_addr_list_generic(uint64_t a1, uint64_t a2, int a3, uint64_t (*a4)(uint64_t, uint64_t *, int *), int a5)
{
  uint64_t v15 = a2;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_mc_addr_list_generic", 2701, "ixgbe_update_mc_addr_list_generic");
  }
  *(_DWORD *)(a1 + 1312) = a3;
  *(_DWORD *)(a1 + 1320) = 0;
  if (a5)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_mc_addr_list_generic", 2712, " Clearing MTA\n");
    }
    *(_OWORD *)(a1 + 1204) = 0u;
    *(_OWORD *)(a1 + 1220) = 0u;
    *(_OWORD *)(a1 + 1172) = 0u;
    *(_OWORD *)(a1 + 1188) = 0u;
    *(_OWORD *)(a1 + 1140) = 0u;
    *(_OWORD *)(a1 + 1156) = 0u;
    *(_OWORD *)(a1 + 1108) = 0u;
    *(_OWORD *)(a1 + 1124) = 0u;
    *(_OWORD *)(a1 + 1076) = 0u;
    *(_OWORD *)(a1 + 1092) = 0u;
    *(_OWORD *)(a1 + 1044) = 0u;
    *(_OWORD *)(a1 + 1060) = 0u;
    *(_OWORD *)(a1 + 1012) = 0u;
    *(_OWORD *)(a1 + 1028) = 0u;
    *(_OWORD *)(a1 + 980) = 0u;
    *(_OWORD *)(a1 + 996) = 0u;
    *(_OWORD *)(a1 + 948) = 0u;
    *(_OWORD *)(a1 + 964) = 0u;
    *(_OWORD *)(a1 + 916) = 0u;
    *(_OWORD *)(a1 + 932) = 0u;
    *(_OWORD *)(a1 + 884) = 0u;
    *(_OWORD *)(a1 + 900) = 0u;
    *(_OWORD *)(a1 + 852) = 0u;
    *(_OWORD *)(a1 + 868) = 0u;
    *(_OWORD *)(a1 + 820) = 0u;
    *(_OWORD *)(a1 + 836) = 0u;
    *(_OWORD *)(a1 + 788) = 0u;
    *(_OWORD *)(a1 + 804) = 0u;
    *(_OWORD *)(a1 + 756) = 0u;
    *(_OWORD *)(a1 + 772) = 0u;
    *(_OWORD *)(a1 + 724) = 0u;
    *(_OWORD *)(a1 + 740) = 0u;
  }
  for (int i = 0; a3; --a3)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_mc_addr_list_generic", 2718, " Adding the multicast addresses:\n");
    }
    uint64_t v9 = a4(a1, &v15, &i);
    ((void (*)(uint64_t, uint64_t))ixgbe_set_mta)(a1, v9);
  }
  if (*(_DWORD *)(a1 + 1240))
  {
    int v10 = 20992;
    uint64_t v11 = 181;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v10 & 0xFFFFFFFC, *(_DWORD *)(a1 + 4 * v11));
      v10 += 4;
      unint64_t v12 = v11 - 180;
      ++v11;
    }
    while (v12 < *(unsigned int *)(a1 + 1240));
  }
  if (*(_DWORD *)(a1 + 1320))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5090uLL, *(_DWORD *)(a1 + 1236) | 4);
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_update_mc_addr_list_generic", 2731, "ixgbe_update_mc_addr_list_generic Complete\n");
  }
  return 0;
}

uint64_t ixgbe_enable_mc_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_enable_mc_generic", 2745, "ixgbe_enable_mc_generic");
  }
  if (*(_DWORD *)(a1 + 1320))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5090uLL, *(_DWORD *)(a1 + 1236) | 4);
  }
  return 0;
}

uint64_t ixgbe_disable_mc_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_disable_mc_generic", 2764, "ixgbe_disable_mc_generic");
  }
  if (*(_DWORD *)(a1 + 1320))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5090uLL, *(_DWORD *)(a1 + 1236));
  }
  return 0;
}

void ixgbe_enable_rx_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3000uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x3000uLL, v2 | 1);
  if (*(_DWORD *)(a1 + 696) != 1)
  {
    if (*(unsigned char *)(a1 + 1300))
    {
      uint32_t v4 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x8220uLL, &v4);
      __dmb(1u);
      uint32_t v3 = v4 | 1;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x8220uLL, v3);
      *(unsigned char *)(a1 + 1300) = 0;
    }
  }
}

void ixgbe_disable_rx_generic(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3000uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  if (readData)
  {
    if (*(_DWORD *)(a1 + 696) != 1)
    {
      uint32_t v5 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x8220uLL, &v5);
      char v3 = 0;
      __dmb(1u);
      uint32_t v4 = v5;
      if (v5)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x8220uLL, v4 & 0xFFFFFFFE);
        char v3 = 1;
      }
      *(unsigned char *)(a1 + 1300) = v3;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x3000uLL, v2 & 0xFFFFFFFE);
  }
}

uint64_t ixgbe_fc_enable_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fc_enable_generic", 2786, "ixgbe_fc_enable_generic");
  }
  if (*(_WORD *)(a1 + 1396))
  {
    uint64_t v2 = 0;
    while (1)
    {
      if ((*(_DWORD *)(a1 + 1404) & 2) != 0)
      {
        unsigned int v3 = *(_DWORD *)(a1 + v2 + 1332);
        if (v3)
        {
          unsigned int v4 = *(_DWORD *)(a1 + v2 + 1364);
          if (!v4 || v4 >= v3) {
            break;
          }
        }
      }
      v2 += 4;
      if (v2 == 32)
      {
        (*(void (**)(uint64_t))(a1 + 528))(a1);
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4294uLL, &readData);
        __dmb(1u);
        uint32_t v6 = readData;
        uint32_t v19 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3D00uLL, &v19);
        __dmb(1u);
        unsigned int v7 = v6 & 0xFFFFF003;
        uint64_t v8 = v19 & 0xFFFFFFE7;
        switch(*(_DWORD *)(a1 + 1404))
        {
          case 0:
            goto LABEL_19;
          case 1:
            v7 |= 8u;
            goto LABEL_19;
          case 2:
            goto LABEL_18;
          case 3:
            v7 |= 8u;
LABEL_18:
            LODWORD(v8) = v8 | 8;
LABEL_19:
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4294uLL, v7 | 2);
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x3D00uLL, v8);
            uint64_t v10 = 0;
            uint64_t v11 = 0;
            do
            {
              if ((*(unsigned char *)(a1 + 1404) & 2) != 0 && (uint64_t v12 = a1 + v10, *(_DWORD *)(a1 + v10 + 1332)))
              {
                uint32_t v13 = (*(_DWORD *)(v12 + 1364) << 10) | 0x80000000;
                __dmb(2u);
                IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v10 + 12832, v13);
                uint32_t v14 = (*(_DWORD *)(v12 + 1332) << 10) | 0x80000000;
                uint64_t v15 = v10;
              }
              else
              {
                __dmb(2u);
                uint64_t v15 = 4 * v11;
                IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v10 + 12832, 0);
                uint32_t v18 = 0;
                IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v10 + 15360, &v18);
                __dmb(1u);
                uint32_t v14 = v18 - 24576;
              }
              __dmb(2u);
              IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v15 + 12896, v14);
              ++v11;
              v10 += 4;
            }
            while (v10 != 32);
            uint64_t v16 = 0;
            uint32_t v17 = *(unsigned __int16 *)(a1 + 1396) | (*(unsigned __int16 *)(a1 + 1396) << 16);
            do
            {
              __dmb(2u);
              IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v16 + 12800, v17);
              v16 += 4;
            }
            while (v16 != 16);
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x32A0uLL, *(unsigned __int16 *)(a1 + 1396) >> 1);
            uint64_t result = 0;
            break;
          default:
            if ((*(unsigned char *)(v8 + 2) & 0x10) != 0) {
              IOLog("ixgbe:%s(%d): Flow control param set incorrectly\n\n", "ixgbe_fc_enable_generic", 2859);
            }
            uint64_t result = 4294967292;
            break;
        }
        return result;
      }
    }
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fc_enable_generic", 2800, "Invalid water mark configuration\n");
    }
  }
  return 4294967283;
}

uint64_t ixgbe_setup_fc_generic(uint64_t a1)
{
  unsigned int v18 = 0;
  unsigned __int16 v17 = 0;
  char v16 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_fc_generic", 208, "ixgbe_setup_fc_generic");
  }
  int v2 = *(_DWORD *)(a1 + 1408);
  if (*(unsigned char *)(a1 + 1399)) {
    BOOL v3 = v2 == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    if (v2 == 4) {
      *(_DWORD *)(a1 + 1408) = 3;
    }
    int v4 = *(_DWORD *)(a1 + 1640);
    if ((v4 - 1) < 3)
    {
LABEL_10:
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4218uLL, &readData);
      __dmb(1u);
      uint32_t v5 = readData;
      goto LABEL_20;
    }
    if (v4 == 4)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 16, 7, &v17);
    }
    else if (v4 == 5)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, unsigned int *))(a1 + 224))(a1, &v16, &v18);
      if (result) {
        return result;
      }
      goto LABEL_10;
    }
    uint32_t v5 = 0;
LABEL_20:
    switch(*(_DWORD *)(a1 + 1408))
    {
      case 0:
        uint32_t v7 = v5 & 0xFFFFFE7F;
        int v10 = *(_DWORD *)(a1 + 1640);
        if (v10 == 4)
        {
          unsigned __int16 v12 = v17 & 0xF3FF;
          goto LABEL_37;
        }
        if (v10 != 5) {
          goto LABEL_38;
        }
        unsigned int v9 = v18 & 0xCFFFFFFF;
        goto LABEL_33;
      case 1:
      case 3:
        uint32_t v7 = v5 | 0x180;
        int v8 = *(_DWORD *)(a1 + 1640);
        if (v8 == 4)
        {
          unsigned __int16 v12 = v17 | 0xC00;
          goto LABEL_37;
        }
        if (v8 != 5) {
          goto LABEL_38;
        }
        unsigned int v9 = v18 | 0x30000000;
        goto LABEL_33;
      case 2:
        uint32_t v7 = v5 & 0xFFFFFE7F | 0x100;
        int v11 = *(_DWORD *)(a1 + 1640);
        if (v11 == 4)
        {
          unsigned __int16 v12 = v17 & 0xF3FF | 0x800;
LABEL_37:
          unsigned __int16 v17 = v12;
        }
        else if (v11 == 5)
        {
          unsigned int v9 = v18 & 0xCFFFFFFF | 0x20000000;
LABEL_33:
          unsigned int v18 = v9;
        }
LABEL_38:
        if (*(int *)(a1 + 696) <= 3)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4218uLL, v7);
          uint32_t v14 = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4208uLL, &v14);
          __dmb(1u);
          uint32_t v7 = *(unsigned char *)(a1 + 1399) ? v14 & 0xFFFBFFFF : v14;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4208uLL, v7);
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): Set up FC; PCS1GLCTL = 0x%08X\n\n", "ixgbe_setup_fc_generic", 328, v7);
          }
        }
        int v13 = *(_DWORD *)(a1 + 1640);
        if (v13 == 4)
        {
          if (ixgbe_device_supports_autoneg_fc(a1)) {
            (*(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 1456))(a1, 16, 7, v17);
          }
        }
        else if (v13 == 5)
        {
          v18 |= 0x1000u;
          uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 232))(a1);
          if (result) {
            return result;
          }
        }
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): Set up FC; PCS1GLCTL = 0x%08X\n\n", "ixgbe_setup_fc_generic", 347, v7);
        }
        uint64_t result = 0;
        break;
      default:
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): Flow control param set incorrectly\n\n", "ixgbe_setup_fc_generic", 309);
        }
        return 4294967292;
    }
    return result;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): ixgbe_fc_rx_pause not valid in strict IEEE mode\n\n", "ixgbe_setup_fc_generic", 213);
  }
  return 4294967283;
}

void ixgbe_fc_autoneg(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fc_autoneg", 3077, "ixgbe_fc_autoneg");
  }
  if (*(unsigned char *)(a1 + 1400))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Flow control autoneg is disabled\n");
    }
    goto LABEL_6;
  }
  int v13 = 0;
  char v12 = 0;
  (*(void (**)(uint64_t, int *, char *, void))(a1 + 280))(a1, &v13, &v12, 0);
  if (!v12)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): The link is down\n");
    }
    goto LABEL_6;
  }
  int v2 = *(_DWORD *)(a1 + 1640);
  if ((v2 - 1) < 3)
  {
    if (v13 == 32)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x420CuLL, &readData);
      __dmb(1u);
      if ((readData & 0x50000) == 0x10000)
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4218uLL, &readData);
        __dmb(1u);
        uint32_t v3 = readData;
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x421CuLL, &readData);
        __dmb(1u);
        uint32_t v4 = readData;
        uint64_t v5 = a1;
        int v6 = v3;
        int v7 = 128;
        int v8 = 256;
        int v9 = 128;
        int v10 = 256;
        goto LABEL_29;
      }
      if ((dword_10003C040 & 0x100000) != 0) {
        goto LABEL_22;
      }
    }
    goto LABEL_6;
  }
  if (v2 == 4)
  {
    if (!ixgbe_device_supports_autoneg_fc(a1)) {
      goto LABEL_6;
    }
    LOWORD(readData) = 0;
    unsigned __int16 v15 = 0;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint32_t *))(a1 + 1448))(a1, 16, 7, &readData);
    (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 19, 7, &v15);
    int v6 = (unsigned __int16)readData;
    uint32_t v4 = v15;
    uint64_t v5 = a1;
    int v7 = 1024;
    int v8 = 2048;
  }
  else
  {
    if (v2 != 5) {
      goto LABEL_6;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A4uLL, &readData);
    __dmb(1u);
    if ((readData & 0x80000000) == 0)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
LABEL_22:
      }
        IOLog("ixgbe:%s(%d): %s\n");
LABEL_6:
      *(unsigned char *)(a1 + 1401) = 0;
      *(_DWORD *)(a1 + 1404) = *(_DWORD *)(a1 + 1408);
      return;
    }
    if (*(_DWORD *)(a1 + 696) == 2)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4324uLL, &readData);
      __dmb(1u);
      if ((readData & 0x40) == 0)
      {
        if ((dword_10003C040 & 0x100000) == 0) {
          goto LABEL_6;
        }
        goto LABEL_22;
      }
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
    __dmb(1u);
    uint32_t v11 = readData;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42B0uLL, &readData);
    __dmb(1u);
    uint32_t v4 = readData;
    uint64_t v5 = a1;
    int v6 = v11;
    int v7 = 0x10000000;
    int v8 = 0x20000000;
  }
  int v9 = 1024;
  int v10 = 2048;
LABEL_29:
  if (ixgbe_negotiate_fc(v5, v6, v4, v7, v8, v9, v10)) {
    goto LABEL_6;
  }
  *(unsigned char *)(a1 + 1401) = 1;
}

uint64_t ixgbe_device_supports_autoneg_fc(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_device_supports_autoneg_fc", 134, "ixgbe_device_supports_autoneg_fc");
  }
  int v12 = 0;
  char v11 = 0;
  int v2 = *(_DWORD *)(a1 + 1640);
  if ((v2 - 1) < 3)
  {
    HIDWORD(v4) = *(unsigned __int16 *)(a1 + 1936);
    LODWORD(v4) = HIDWORD(v4) - 5572;
    unsigned int v3 = v4 >> 1;
    BOOL v5 = v3 > 5;
    int v6 = (1 << v3) & 0x39;
    if (v5 || v6 == 0)
    {
      (*(void (**)(uint64_t, int *, char *, void))(a1 + 280))(a1, &v12, &v11, 0);
      uint64_t result = 1;
      if (!v11 || v12 == 32) {
        return result;
      }
    }
    goto LABEL_15;
  }
  if (v2 != 4)
  {
    if (v2 == 5 && *(_WORD *)(a1 + 1936) != 5552) {
      return 1;
    }
    goto LABEL_15;
  }
  int v9 = *(unsigned __int16 *)(a1 + 1936);
  uint64_t result = 1;
  BOOL v10 = (v9 - 5549) > 0x38 || ((1 << (v9 + 83)) & 0x180001008000001) == 0;
  if (v10
    && ((v9 - 5416) > 0x3B || ((1 << (v9 - 40)) & 0x910000000000001) == 0)
    && v9 != 5404)
  {
LABEL_15:
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Device %x does not support flow control autoneg\n", "ixgbe_device_supports_autoneg_fc", 190, *(unsigned __int16 *)(a1 + 1936));
    }
    return 0;
  }
  return result;
}

uint64_t ixgbe_start_hw_gen2(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1260))
  {
    uint32_t v2 = 0;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4904uLL, v2);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4984uLL, 0);
      ++v2;
    }
    while (v2 < *(_DWORD *)(a1 + 1260));
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  if (*(_DWORD *)(a1 + 1260))
  {
    unint64_t v3 = 0;
    int v4 = 24588;
    do
    {
      uint32_t v15 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v4 & 0xFFFFFFCC, &v15);
      __dmb(1u);
      uint32_t v5 = v15 & 0xFFFFF7FF;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v4 & 0xFFFFFFCC, v5);
      ++v3;
      v4 += 64;
    }
    while (v3 < *(unsigned int *)(a1 + 1260));
  }
  if (*(_DWORD *)(a1 + 1264))
  {
    unsigned int v6 = 0;
    unsigned int v7 = 8704;
    do
    {
      uint32_t v14 = 0;
      if (v6 <= 0x3F) {
        unsigned int v8 = (v6 << 6) + 4108;
      }
      else {
        unsigned int v8 = (v6 << 6) + 49164;
      }
      if (v6 >= 0x10) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v7;
      }
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v9, &v14);
      __dmb(1u);
      uint32_t v10 = v14 & 0xFFFF5FFF;
      __dmb(2u);
      if (v6 <= 0x3F) {
        unsigned int v11 = (v6 << 6) + 4108;
      }
      else {
        unsigned int v11 = (v6 << 6) + 49164;
      }
      if (v6 >= 0x10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v7;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v12, v10);
      ++v6;
      v7 += 4;
    }
    while (v6 < *(_DWORD *)(a1 + 1264));
  }
  return 0;
}

uint64_t ixgbe_read_pba_string_generic(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 619, "ixgbe_read_pba_string_generic");
  }
  if (!a2)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 622, "PBA string buffer was null\n");
    }
    return 4294967264;
  }
  int v20 = 0;
  unsigned __int16 v19 = 0;
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 1728))(a1, 21, (char *)&v20 + 2);
  if (v6)
  {
    uint64_t v7 = v6;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 628, "NVM Read Error\n");
    }
    return v7;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 1728))(a1, 22, &v20);
  if (v8)
  {
    uint64_t v7 = v8;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 634, "NVM Read Error\n");
    }
    return v7;
  }
  if (SHIWORD(v20) != -1286)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 644, "NVM PBA number is not stored as string\n");
    }
    if (a3 <= 0xA)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 648, "PBA string buffer too small\n");
      }
      return 4294967271;
    }
    uint64_t v11 = 0;
    __int16 v12 = HIWORD(v20);
    *(unsigned char *)a2 = HIWORD(v20) >> 12;
    *(unsigned char *)(a2 + 1) = HIBYTE(v12) & 0xF;
    *(unsigned char *)(a2 + 2) = v12 >> 4;
    *(unsigned char *)(a2 + 3) = v12 & 0xF;
    __int16 v13 = v20;
    *(unsigned char *)(a2 + 4) = (unsigned __int16)v20 >> 12;
    *(unsigned char *)(a2 + 5) = HIBYTE(v13) & 0xF;
    *(_WORD *)(a2 + 6) = 45;
    *(unsigned char *)(a2 + 8) = v13 >> 4;
    *(_WORD *)(a2 + 9) = v13 & 0xF;
    while (1)
    {
      unsigned int v14 = *(unsigned __int8 *)(a2 + v11);
      if (v14 < 0xA) {
        break;
      }
      if (v14 <= 0xF)
      {
        char v15 = 55;
        goto LABEL_29;
      }
LABEL_30:
      uint64_t v7 = 0;
      if (++v11 == 10) {
        return v7;
      }
    }
    char v15 = 48;
LABEL_29:
    *(unsigned char *)(a2 + v11) = v14 + v15;
    goto LABEL_30;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void, unsigned __int16 *))(a1 + 1728))(a1, (unsigned __int16)v20, &v19);
  if (v10)
  {
    uint64_t v7 = v10;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 680, "NVM Read Error\n");
    }
    return v7;
  }
  if ((unsigned __int16)(v19 + 1) <= 1u)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 685, "NVM PBA number section invalid length\n");
    }
    return 4294967265;
  }
  if (2 * v19 - 1 > a3)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 691, "PBA string buffer too small\n");
    }
    return 4294967271;
  }
  LOWORD(v20) = v20 + 1;
  if (--v19)
  {
    uint64_t v16 = 0;
    unsigned int v17 = 0;
    while (1)
    {
      uint64_t v18 = (*(uint64_t (**)(uint64_t, void, char *))(a1 + 1728))(a1, (unsigned __int16)(v20 + v17), (char *)&v20 + 2);
      if (v18) {
        break;
      }
      *(_WORD *)(a2 + v16) = bswap32(HIWORD(v20)) >> 16;
      ++v17;
      v16 += 2;
      if (v17 >= v19) {
        goto LABEL_45;
      }
    }
    uint64_t v7 = v18;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_string_generic", 702, "NVM Read Error\n");
    }
  }
  else
  {
    uint64_t v16 = 0;
LABEL_45:
    uint64_t v7 = 0;
    *(unsigned char *)(a2 + v16) = 0;
  }
  return v7;
}

uint64_t ixgbe_read_pba_num_generic(uint64_t a1, _DWORD *a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_num_generic", 725, "ixgbe_read_pba_num_generic");
  }
  unsigned __int16 v7 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 1728))(a1, 21, &v7);
  if (v4)
  {
    uint64_t v5 = v4;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_num_generic", 729, "NVM Read Error\n");
    }
  }
  else if (v7 == 64250)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_num_generic", 732, "NVM Not supported\n");
    }
    return 0x7FFFFFFFLL;
  }
  else
  {
    *a2 = v7 << 16;
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned __int16 *))(a1 + 1728))(a1, 22, &v7);
    if (v5)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_pba_num_generic", 739, "NVM Read Error\n");
      }
    }
    else
    {
      *a2 |= v7;
    }
  }
  return v5;
}

uint64_t ixgbe_read_pba_raw(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned __int16 *a5)
{
  if (!a5) {
    return 4294967291;
  }
  if (a2)
  {
    if (a3 < 0x17) {
      return 4294967291;
    }
    int v10 = *(unsigned __int16 *)(a2 + 42);
    *a5 = v10;
    a5[1] = *(_WORD *)(a2 + 44);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1736))(a1, 21, 2, a5);
    if (result) {
      return result;
    }
    int v10 = *a5;
  }
  if (v10 == 64250)
  {
    if (*((void *)a5 + 1))
    {
      unsigned __int16 v13 = 0;
      uint64_t result = ixgbe_get_pba_block_size(a1, a2, a3, &v13);
      if (result) {
        return result;
      }
      if (v13 <= a4)
      {
        if (!a2)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 1736))(a1, a5[1]);
          if (result) {
            return result;
          }
          return 0;
        }
        uint64_t v12 = a5[1];
        if (v12 + v13 < a3)
        {
          memcpy(*((void **)a5 + 1), (const void *)(a2 + 2 * v12), 2 * v13);
          return 0;
        }
      }
    }
    return 4294967291;
  }
  return 0;
}

uint64_t ixgbe_get_pba_block_size(uint64_t a1, uint64_t a2, unsigned int a3, _WORD *a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_pba_block_size", 894, "ixgbe_get_pba_block_size");
  }
  if (a2)
  {
    if (a3 <= 0x16) {
      return 4294967291;
    }
    if (*(__int16 *)(a2 + 42) == -1286)
    {
      if (*(unsigned __int16 *)(a2 + 44) < a3)
      {
        uint64_t v8 = (__int16 *)(a2 + 2 * *(unsigned __int16 *)(a2 + 44));
        goto LABEL_12;
      }
      return 4294967291;
    }
LABEL_14:
    __int16 v10 = 0;
    goto LABEL_15;
  }
  __int16 v11 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _WORD *))(a1 + 1736))(a1, 21, 2, v12);
  if (result) {
    return result;
  }
  if (v12[0] != -1286) {
    goto LABEL_14;
  }
  uint64_t v8 = &v11;
  uint64_t result = (*(uint64_t (**)(uint64_t, void, __int16 *))(a1 + 1728))(a1, v12[1], &v11);
  if (result) {
    return result;
  }
LABEL_12:
  __int16 v10 = *v8;
  if ((unsigned __int16)(*v8 + 1) < 2u) {
    return 4294967265;
  }
LABEL_15:
  uint64_t result = 0;
  if (a4) {
    *a4 = v10;
  }
  return result;
}

uint64_t ixgbe_write_pba_raw(uint64_t a1, uint64_t a2, unsigned int a3, __int16 *a4)
{
  if (!a4) {
    return 4294967291;
  }
  if (a2)
  {
    if (a3 < 0x17) {
      return 4294967291;
    }
    *(_WORD *)(a2 + 42) = *a4;
    *(_WORD *)(a2 + 44) = a4[1];
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __int16 *))(a1 + 1752))(a1, 21, 2, a4);
    if (result) {
      return result;
    }
  }
  if (*a4 == -1286)
  {
    uint64_t v9 = (unsigned __int16 *)*((void *)a4 + 1);
    if (v9)
    {
      if (!a2)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 1752))(a1, (unsigned __int16)a4[1], *v9);
        if (result) {
          return result;
        }
        return 0;
      }
      uint64_t v10 = (unsigned __int16)a4[1];
      uint64_t v11 = *v9;
      if ((int)v11 + (int)v10 < a3)
      {
        memcpy((void *)(a2 + 2 * v10), *((const void **)a4 + 1), 2 * v11);
        return 0;
      }
    }
    return 4294967291;
  }
  return 0;
}

uint64_t ixgbe_set_pci_config_data_generic(uint64_t a1, __int16 a2)
{
  if (!*(_DWORD *)(a1 + 1808)) {
    *(_DWORD *)(a1 + 1808) = 3;
  }
  unsigned int v2 = (a2 & 0x3F0) - 16;
  if (v2 > 0x7F) {
    int v3 = 0;
  }
  else {
    int v3 = dword_100032510[v2 >> 4];
  }
  *(_DWORD *)(a1 + 1804) = v3;
  uint64_t v4 = (a2 & 0xF) - 1;
  if (v4 > 2) {
    int v5 = 0;
  }
  else {
    int v5 = dword_100032530[v4];
  }
  *(_DWORD *)(a1 + 1800) = v5;
  return (*(uint64_t (**)(void))(a1 + 144))();
}

uint64_t ixgbe_disable_pcie_master(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_disable_pcie_master", 3192, "ixgbe_disable_pcie_master");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0, 4u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  uint64_t result = 0;
  __dmb(1u);
  if ((readData & 0x80000) != 0)
  {
    int v3 = 800;
    while (1)
    {
      IODelay(0x64uLL);
      uint32_t v6 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v6);
      __dmb(1u);
      if ((v6 & 0x80000) == 0) {
        break;
      }
      if (!--v3)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_disable_pcie_master", 3217, "GIO Master Disable bit didn't clear - requesting resets\n");
        }
        *(unsigned char *)(a1 + 1285) |= 1u;
        if (*(int *)(a1 + 696) <= 5)
        {
          int v4 = sub_100026380((IOPCIDevice **)a1);
          while (1)
          {
            IODelay(0x64uLL);
            uint16_t v5 = 0;
            IOPCIDevice::ConfigurationRead16(*(IOPCIDevice **)a1, 0xAAuLL, &v5);
            if ((v5 & 0x20) == 0) {
              break;
            }
            if (!--v4)
            {
              if ((dword_10003C040 & 0x100000) != 0) {
                IOLog("ixgbe:%s(%d): PCIe transaction pending bit also did not clear.\n\n", "ixgbe_disable_pcie_master", 3238);
              }
              return 4294967284;
            }
          }
        }
        return 0;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_1000258D4(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_eeprom_buffer_bit_bang", 1338, "ixgbe_write_eeprom_buffer_bit_bang");
  }
  uint64_t v8 = sub_100029638(a1);
  if (!v8)
  {
    if (sub_1000297E0(a1))
    {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else
    {
      if (a3)
      {
        unsigned int v9 = 0;
        int v10 = 0;
        unsigned __int8 v11 = 2;
        do
        {
          sub_1000299C8(a1);
          sub_100029AC4(a1, 6, 8);
          sub_1000299C8(a1);
          if (v9 + a2 > 0x7F && *(_WORD *)(a1 + 1794) == 8) {
            v11 |= 8u;
          }
          sub_100029AC4(a1, v11, 8);
          sub_100029AC4(a1, 2 * (((_WORD)v10 + (_WORD)a2) & 0x7FFF), *(unsigned __int16 *)(a1 + 1794));
          int v13 = *(unsigned __int16 *)(a1 + 1796);
          int v14 = v10;
          while (1)
          {
            sub_100029AC4(a1, bswap32(*(unsigned __int16 *)(a4 + 2 * (unsigned __int16)v14)) >> 16, 16);
            if (!v13) {
              break;
            }
            if (((v13 - 1) & ~(a2 + (unsigned __int16)v14)) != 0 && a3 > (unsigned __int16)++v14) {
              continue;
            }
            goto LABEL_19;
          }
          int v14 = v10;
LABEL_19:
          sub_1000299C8(a1);
          IODelay(0x2710uLL);
          int v10 = v14 + 1;
          unsigned int v9 = (unsigned __int16)(v14 + 1);
        }
        while (v9 < a3);
      }
      uint64_t v8 = 0;
    }
    sub_1000298C4(a1);
  }
  return v8;
}

uint64_t sub_100025A64(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_eeprom_buffer_bit_bang", 1496, "ixgbe_read_eeprom_buffer_bit_bang");
  }
  uint64_t v8 = sub_100029638(a1);
  if (!v8)
  {
    if (sub_1000297E0(a1))
    {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else
    {
      if (a3)
      {
        uint64_t v9 = 0;
        unsigned __int8 v10 = 3;
        do
        {
          sub_1000299C8(a1);
          if ((a2 + v9) > 0x7F && *(_WORD *)(a1 + 1794) == 8) {
            v10 |= 8u;
          }
          sub_100029AC4(a1, v10, 8);
          sub_100029AC4(a1, 2 * (((_WORD)v9 + (_WORD)a2) & 0x7FFF), *(unsigned __int16 *)(a1 + 1794));
          *(_WORD *)(a4 + 2 * v9++) = __rev16(sub_100029C14(a1, 16));
        }
        while (a3 != v9);
      }
      uint64_t v8 = 0;
    }
    sub_1000298C4(a1);
  }
  return v8;
}

uint64_t ixgbe_poll_eerd_eewr_done(IOPCIDevice **a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_poll_eerd_eewr_done", 1756, "ixgbe_poll_eerd_eewr_done");
  }
  int v4 = 100000;
  do
  {
    if (a2)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, 0x10018uLL, &readData);
      __dmb(1u);
      if ((readData & 2) != 0) {
        return 0;
      }
    }
    else
    {
      uint32_t v7 = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, 0x10014uLL, &v7);
      __dmb(1u);
      if ((v7 & 2) != 0) {
        return 0;
      }
    }
    IODelay(5uLL);
    --v4;
  }
  while (v4);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): EEPROM read/write done polling timed out\n", "ixgbe_poll_eerd_eewr_done", 1773);
  }
  return 0xFFFFFFFFLL;
}

uint64_t ixgbe_write_eewr_buffer_generic(uint64_t a1, unsigned int a2, int a3, unsigned __int16 *a4)
{
  LODWORD(v5) = a3;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_eewr_buffer_generic", 1689, "ixgbe_write_eewr_generic");
  }
  (*(void (**)(uint64_t))(a1 + 1720))(a1);
  if (v5)
  {
    if (*(unsigned __int16 *)(a1 + 1792) <= a2)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Invalid EEPROM offset\n");
      }
    }
    else
    {
      int v8 = 4 * a2;
      uint64_t v5 = v5;
      while (1)
      {
        int v10 = *a4++;
        int v9 = v10;
        if (ixgbe_poll_eerd_eewr_done((IOPCIDevice **)a1, 1))
        {
          if ((dword_10003C040 & 0x100000) == 0) {
            return 0xFFFFFFFFLL;
          }
          goto LABEL_18;
        }
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x10018uLL, v8 | (v9 << 16) | 1);
        if (ixgbe_poll_eerd_eewr_done((IOPCIDevice **)a1, 1)) {
          break;
        }
        v8 += 4;
        if (!--v5) {
          return 0;
        }
      }
      if ((dword_10003C040 & 0x100000) == 0) {
        return 0xFFFFFFFFLL;
      }
LABEL_18:
      IOLog("ixgbe:%s(%d): %s\n");
    }
    return 0xFFFFFFFFLL;
  }
  else
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Invalid EEPROM words\n", "ixgbe_write_eewr_buffer_generic", 1695);
    }
    return 4294967264;
  }
}

uint64_t ixgbe_write_eewr_generic(uint64_t a1, unsigned int a2, unsigned __int16 a3)
{
  unsigned __int16 v4 = a3;
  return ixgbe_write_eewr_buffer_generic(a1, a2, 1, &v4);
}

uint64_t ixgbe_validate_mac_addr(unsigned __int8 *a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_validate_mac_addr", 2326, "ixgbe_validate_mac_addr");
  }
  if (*a1) {
    return 4294967286;
  }
  if (*a1 || a1[1] || a1[2] || a1[3] || a1[4]) {
    return 0;
  }
  if (a1[5]) {
    return 0;
  }
  return 4294967286;
}

uint64_t ixgbe_add_uc_addr(uint64_t result, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = result;
  unsigned int v6 = *(_DWORD *)(result + 1248);
  if ((dword_10003C040 & 0x100000) != 0)
  {
    uint64_t result = IOLog("ixgbe:%s(%d): %s\n", "ixgbe_add_uc_addr", 2516, "ixgbe_add_uc_addr");
    if ((dword_10003C040 & 0x100000) != 0) {
      uint64_t result = IOLog("ixgbe:%s(%d):  UC Addr = %.2X %.2X %.2X %.2X %.2X %.2X\n\n", "ixgbe_add_uc_addr", 2519, *a2, a2[1], a2[2], a2[3], a2[4], a2[5]);
    }
  }
  unsigned int v7 = *(_DWORD *)(v5 + 1316);
  if (v7 >= v6)
  {
    int v8 = (_DWORD *)(v5 + 1324);
  }
  else
  {
    int v8 = (_DWORD *)(v5 + 1316);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, unsigned __int8 *, uint64_t, uint64_t))(v5 + 352))(v5, *(unsigned int *)(v5 + 1316), a2, a3, 0x80000000);
    if ((dword_10003C040 & 0x100000) != 0) {
      uint64_t result = IOLog("ixgbe:%s(%d): Added a secondary address to RAR[%d]\n\n", "ixgbe_add_uc_addr", 2528, v7);
    }
  }
  ++*v8;
  if ((dword_10003C040 & 0x100000) != 0) {
    return IOLog("ixgbe:%s(%d): %s\n", "ixgbe_add_uc_addr", 2534, "ixgbe_add_uc_addr Complete\n");
  }
  return result;
}

uint64_t ixgbe_negotiate_fc(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  if (a2 && a3)
  {
    int v7 = a6 & a3;
    int v8 = a4 & a2;
    if ((a4 & a2) != 0 && v7)
    {
      if (*(_DWORD *)(a1 + 1408) == 3)
      {
        *(_DWORD *)(a1 + 1404) = 3;
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_negotiate_fc", 2939, "Flow Control = FULL.\n");
        }
      }
      else
      {
        *(_DWORD *)(a1 + 1404) = 1;
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_negotiate_fc", 2942, "Flow Control=RX PAUSE frames only\n");
        }
      }
      return 0;
    }
    int v10 = a7 & a3;
    if ((a5 & a2) != 0 && !v8 && v7 && v10)
    {
      *(_DWORD *)(a1 + 1404) = 2;
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_negotiate_fc", 2947, "Flow Control = TX PAUSE frames only.\n");
      }
      return 0;
    }
    if (v10 && v8 && (a5 & a2) != 0 && !v7)
    {
      *(_DWORD *)(a1 + 1404) = 1;
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_negotiate_fc", 2951, "Flow Control = RX PAUSE frames only.\n");
      }
      return 0;
    }
    uint64_t v9 = 0;
    *(_DWORD *)(a1 + 1404) = 0;
    if ((dword_10003C040 & 0x100000) != 0)
    {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_negotiate_fc", 2954, "Flow Control = NONE.\n");
      return 0;
    }
  }
  else
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Local or link partner's advertised flow control settings are NULL. Local: %x, link partner: %x\n\n", "ixgbe_negotiate_fc", 2925, a2, a3);
    }
    return 4294967269;
  }
  return v9;
}

uint64_t sub_100026380(IOPCIDevice **a1)
{
  uint16_t readData = 0;
  IOPCIDevice::ConfigurationRead16(*a1, 0xC8uLL, &readData);
  uint64_t v1 = (readData & 0xF) - 6;
  if (v1 > 8) {
    return 880;
  }
  else {
    return dword_10003253C[v1];
  }
}

uint64_t sub_1000263D8(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_eeprom_semaphore", 1846, "ixgbe_get_eeprom_semaphore");
  }
  int v2 = 2000;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 20), &readData);
    __dmb(1u);
    if ((readData & 1) == 0) {
      break;
    }
    IODelay(0x32uLL);
    if (!--v2)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_eeprom_semaphore", 1865, "Driver can't access the Eeprom - SMBI Semaphore not granted.\n");
      }
      sub_1000265B8((IOPCIDevice **)a1);
      IODelay(0x32uLL);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 20), &readData);
      __dmb(1u);
      if (readData)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): Software semaphore SMBI between device drivers not granted.\n\n", "ixgbe_get_eeprom_semaphore", 1918);
        }
        return 0xFFFFFFFFLL;
      }
      break;
    }
  }
  int v3 = 2000;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 20), &readData);
    __dmb(1u);
    uint32_t v4 = readData | 2;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 20), v4);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 20), &readData);
    __dmb(1u);
    if ((readData & 2) != 0) {
      return 0;
    }
    IODelay(0x32uLL);
    --v3;
  }
  while (v3);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): SWESMBI Software EEPROM semaphore not granted.\n\n", "ixgbe_get_eeprom_semaphore", 1911);
  }
  sub_1000265B8((IOPCIDevice **)a1);
  return 0xFFFFFFFFLL;
}

void sub_1000265B8(IOPCIDevice **a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_release_eeprom_semaphore", 1934, "ixgbe_release_eeprom_semaphore");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x10140uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFFFFC;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x10140uLL, v2);
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v3);
  __dmb(1u);
}

uint64_t ixgbe_disable_sec_rx_path_generic(IOPCIDevice **a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_disable_sec_rx_path_generic", 3330, "ixgbe_disable_sec_rx_path_generic");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x8D00uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData | 2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x8D00uLL, v2);
  int v3 = 40;
  while (1)
  {
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0x8D04uLL, &v5);
    __dmb(1u);
    if (v5) {
      break;
    }
    IODelay(0x3E8uLL);
    if (!--v3)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_disable_sec_rx_path_generic", 3348, "Rx unit being enabled before security path fully disabled.  Continuing with init.\n");
      }
      return 0;
    }
  }
  return 0;
}

uint64_t ixgbe_enable_sec_rx_path_generic(IOPCIDevice **a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_enable_sec_rx_path_generic", 3395, "ixgbe_enable_sec_rx_path_generic");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x8D00uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFFFFD;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x8D00uLL, v2);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v4);
  __dmb(1u);
  return 0;
}

uint64_t ixgbe_get_san_mac_addr_generic(uint64_t a1, uint64_t a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_san_mac_addr_generic", 3559, "ixgbe_get_san_mac_addr_generic");
  }
  int v7 = 0;
  if (!sub_100026954(a1, (uint64_t)&v7) && (_WORD)v7 && (unsigned __int16)v7 != 0xFFFF)
  {
    (*(void (**)(uint64_t))(a1 + 144))(a1);
    unsigned __int16 v5 = v7;
    if (*(_WORD *)(a1 + 1812))
    {
      unsigned __int16 v5 = v7 + 3;
      LOWORD(v7) = v7 + 3;
    }
    uint64_t v6 = 0;
    while (!(*(unsigned int (**)(uint64_t, void, char *))(a1 + 1728))(a1, v5, (char *)&v7 + 2))
    {
      *(_WORD *)(a2 + v6) = HIWORD(v7);
      unsigned __int16 v5 = v7 + 1;
      LOWORD(v7) = v7 + 1;
      v6 += 2;
      if (v6 == 6) {
        return 0;
      }
    }
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n", "ixgbe_get_san_mac_addr_generic", 3580, (unsigned __int16)v7);
    }
  }
  *(_WORD *)(a2 + 4) = -1;
  *(_DWORD *)a2 = -1;
  return 0;
}

uint64_t sub_100026954(uint64_t a1, uint64_t a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_san_mac_addr_offset", 3526, "ixgbe_get_san_mac_addr_offset");
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1728))(a1, 40, a2);
  if (v4 && (dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): eeprom at offset %d failed\n", "ixgbe_get_san_mac_addr_offset", 3537, 40);
  }
  return v4;
}

uint64_t ixgbe_set_san_mac_addr_generic(uint64_t a1, uint64_t a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_san_mac_addr_generic", 3612, "ixgbe_set_san_mac_addr_generic");
  }
  unsigned __int16 v7 = 0;
  if (sub_100026954(a1, (uint64_t)&v7)) {
    return 4294967274;
  }
  uint64_t result = 4294967274;
  if (v7 && v7 != 0xFFFF)
  {
    (*(void (**)(uint64_t))(a1 + 144))(a1);
    unsigned __int16 v5 = v7;
    if (*(_WORD *)(a1 + 1812))
    {
      unsigned __int16 v5 = v7 + 3;
      v7 += 3;
    }
    for (uint64_t i = 0; i != 6; i += 2)
    {
      (*(void (**)(uint64_t, void, void))(a1 + 1744))(a1, v5, *(unsigned __int16 *)(a2 + i));
      unsigned __int16 v5 = ++v7;
    }
    return 0;
  }
  return result;
}

uint64_t ixgbe_get_pcie_msix_count_generic(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 696) - 1;
  if (v1 > 7 || ((0xEBu >> v1) & 1) == 0) {
    return 1;
  }
  unsigned int v4 = word_100032500[v1];
  uint64_t v5 = qword_100032560[v1];
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_pcie_msix_count_generic", 3665, "ixgbe_get_pcie_msix_count_generic");
  }
  uint16_t readData = 0;
  IOPCIDevice::ConfigurationRead16(*(IOPCIDevice **)a1, v5, &readData);
  unsigned int v6 = readData & 0x7FF;
  if (v6 < v4) {
    return v6 + 1;
  }
  else {
    return v4;
  }
}

uint64_t ixgbe_insert_mac_addr_generic(uint64_t a1, int *a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_insert_mac_addr_generic", 3697, "ixgbe_insert_mac_addr_generic");
  }
  if (!*(_DWORD *)(a1 + 1252))
  {
    uint64_t v12 = 0;
    goto LABEL_19;
  }
  int v4 = 0;
  uint64_t v5 = 0;
  int v6 = *a2;
  uint64_t v7 = 0xFFFFFFFFLL;
  int v8 = *((unsigned __int16 *)a2 + 2);
  while (1)
  {
    uint64_t v9 = v7;
    uint32_t readData = 0;
    if (v5 >= 0x10) {
      int v10 = 41476;
    }
    else {
      int v10 = 21508;
    }
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v10 + v4), &readData);
    __dmb(1u);
    if ((readData & 0x80000000) == 0)
    {
      uint64_t v7 = v5;
      if (v9 == -1) {
        goto LABEL_16;
      }
    }
    if (v8 == (unsigned __int16)readData)
    {
      uint32_t v14 = 0;
      int v11 = v5 >= 0x10 ? 41472 : 21504;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (v11 + v4), &v14);
      __dmb(1u);
      if (v14 == v6) {
        break;
      }
    }
    uint64_t v7 = v9;
LABEL_16:
    uint64_t v5 = (v5 + 1);
    uint64_t v12 = *(unsigned int *)(a1 + 1252);
    v4 += 8;
    if (v5 >= v12)
    {
      uint64_t v9 = v7;
      goto LABEL_21;
    }
  }
  uint64_t v12 = *(unsigned int *)(a1 + 1252);
LABEL_21:
  if (v5 < v12)
  {
    ixgbe_set_vmdq(a1);
    goto LABEL_25;
  }
  if (v9 != -1)
  {
    ixgbe_set_rar(a1);
    uint64_t v5 = v9;
    goto LABEL_25;
  }
  if (v5 != v12)
  {
    if (v5 < *(_DWORD *)(a1 + 1248)) {
      goto LABEL_25;
    }
    return 4294967286;
  }
LABEL_19:
  ixgbe_set_rar(a1);
  ++*(_DWORD *)(a1 + 1252);
  uint64_t v5 = v12;
LABEL_25:
  if (!v5) {
    ixgbe_clear_vmdq(a1);
  }
  return v5;
}

uint64_t ixgbe_clear_vmdq_generic(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = *(_DWORD *)(a1 + 1248);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_clear_vmdq_generic", 3760, "ixgbe_clear_vmdq_generic");
  }
  if (v6 <= a2)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): RAR index %d is out of range.\n\n", "ixgbe_clear_vmdq_generic", 3765, a2);
    }
    return 4294967264;
  }
  else
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (8 * a2 + 42496), &readData);
    __dmb(1u);
    uint32_t v7 = readData;
    uint32_t v14 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, (8 * a2 + 42500), &v14);
    uint64_t result = 0;
    __dmb(1u);
    uint32_t v9 = v14;
    if (v7 | v14)
    {
      if (a3 == -1)
      {
        if (v7)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (8 * a2 + 42496), 0);
        }
        if (v9)
        {
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (8 * a2 + 42500), 0);
          uint32_t v9 = 0;
        }
        uint32_t v7 = 0;
      }
      else
      {
        int v10 = 1 << a3;
        if (a3 > 0x1F)
        {
          uint32_t v9 = v14 & ~v10;
          __dmb(2u);
          int v11 = *(IOPCIDevice **)a1;
          uint64_t v12 = (8 * a2 + 42500);
          uint32_t v13 = v9;
        }
        else
        {
          v7 &= ~v10;
          __dmb(2u);
          int v11 = *(IOPCIDevice **)a1;
          uint64_t v12 = (8 * a2 + 42496);
          uint32_t v13 = v7;
        }
        IOPCIDevice::MemoryWrite32(v11, 0, v12, v13);
      }
      uint64_t result = 0;
      if (a2 && !v7 && !v9)
      {
        if (*(unsigned __int8 *)(a1 + 1272) != a2) {
          (*(void (**)(uint64_t, uint64_t))(a1 + 368))(a1, a2);
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t ixgbe_set_vmdq_generic(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v6 = *(_DWORD *)(a1 + 1248);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_vmdq_generic", 3814, "ixgbe_set_vmdq_generic");
  }
  if (v6 <= a2)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): RAR index %d is out of range.\n\n", "ixgbe_set_vmdq_generic", 3819, a2);
    }
    return 4294967264;
  }
  else
  {
    int v7 = 8 * a2;
    if (a3 > 0x1F)
    {
      uint32_t v11 = 0;
      uint64_t v8 = (v7 + 42500);
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v8, &v11);
      __dmb(1u);
      uint32_t v9 = v11 | (1 << a3);
      __dmb(2u);
    }
    else
    {
      uint32_t readData = 0;
      uint64_t v8 = (v7 + 42496);
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v8, &readData);
      __dmb(1u);
      uint32_t v9 = readData | (1 << a3);
      __dmb(2u);
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v8, v9);
    return 0;
  }
}

uint64_t ixgbe_set_vmdq_san_mac_generic(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(unsigned __int8 *)(a1 + 1272);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_vmdq_san_mac_generic", 3849, "ixgbe_set_vmdq_san_mac");
  }
  __dmb(2u);
  uint64_t v5 = *(IOPCIDevice **)a1;
  int v6 = 8 * v4;
  uint64_t v7 = 8 * v4 + 42496;
  if (a2 > 0x1F)
  {
    IOPCIDevice::MemoryWrite32(v5, 0, v7, 0);
    __dmb(2u);
    uint64_t v8 = *(IOPCIDevice **)a1;
    uint64_t v9 = (v6 + 42500);
    uint32_t v10 = 1 << a2;
  }
  else
  {
    IOPCIDevice::MemoryWrite32(v5, 0, v7, 1 << a2);
    __dmb(2u);
    uint64_t v8 = *(IOPCIDevice **)a1;
    uint64_t v9 = (v6 + 42500);
    uint32_t v10 = 0;
  }
  IOPCIDevice::MemoryWrite32(v8, 0, v9, v10);
  return 0;
}

uint64_t ixgbe_init_uta_tables_generic(IOPCIDevice **a1)
{
  if ((dword_10003C040 & 0x100000) != 0)
  {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_uta_tables_generic", 3870, "ixgbe_init_uta_tables_generic");
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_uta_tables_generic", 3871, " Clearing UTA\n");
    }
  }
  for (uint64_t i = 0; i != 512; i += 4)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, i + 62464, 0);
  }
  return 0;
}

uint64_t ixgbe_find_vlvf_slot(IOPCIDevice **a1, int a2, int a3)
{
  if (!a2) {
    return 0;
  }
  if (a3) {
    LODWORD(v4) = -25;
  }
  else {
    LODWORD(v4) = 0;
  }
  unsigned int v5 = a2 | 0x80000000;
  uint64_t v6 = 63;
  uint64_t v7 = 61948;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, v7, &readData);
    __dmb(1u);
    if (readData == v5) {
      return v6;
    }
    if (readData | v4) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = v6;
    }
    v7 -= 4;
    --v6;
  }
  while (v6);
  if (!v4)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): No space in VLVF.\n\n", "ixgbe_find_vlvf_slot", 3925);
    }
    return 4294967271;
  }
  return v4;
}

uint64_t ixgbe_set_vfta_generic(IOPCIDevice **a1, unsigned int a2, unsigned int a3, int a4, int a5)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_vfta_generic", 3946, "ixgbe_set_vfta_generic");
  }
  uint64_t result = 4294967291;
  if (a2 <= 0xFFF && a3 <= 0x3F)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, ((a2 >> 3) & 0x1FFFFFFC) + 40960, &readData);
    __dmb(1u);
    uint32_t v14 = (readData ^ (a4 << 31 >> 31)) & (1 << a2);
    uint32_t v11 = v14 ^ readData;
    uint64_t result = ixgbe_set_vlvf_generic(a1, a2, a3, a4, &v14, v14 ^ readData, a5);
    if (!result || a5 != 0)
    {
      if (v14)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*a1, 0, ((a2 >> 3) & 0x1FFFFFFC) + 40960, v11);
      }
      return 0;
    }
  }
  return result;
}

uint64_t ixgbe_set_vlvf_generic(IOPCIDevice **a1, unsigned int a2, unsigned int a3, char a4, _DWORD *a5, uint32_t a6, int a7)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_vlvf_generic", 4014, "ixgbe_set_vlvf_generic");
  }
  uint64_t vlvf_slot = 4294967291;
  if (a2 <= 0xFFF && a3 <= 0x3F)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0x51B0uLL, &readData);
    uint64_t vlvf_slot = 0;
    __dmb(1u);
    if (readData)
    {
      uint64_t vlvf_slot = ixgbe_find_vlvf_slot(a1, a2, a7);
      if ((vlvf_slot & 0x80000000) == 0)
      {
        uint32_t v21 = 0;
        IOPCIDevice::MemoryRead32(*a1, 0, 4 * (2 * vlvf_slot + (a3 >> 5)) + 61952, &v21);
        __dmb(1u);
        uint32_t v15 = v21 | (1 << a3);
        if ((a4 & 1) == 0)
        {
          v15 ^= 1 << a3;
          if (!v15)
          {
            uint32_t v20 = 0;
            IOPCIDevice::MemoryRead32(*a1, 0, 4 * (2 * vlvf_slot - (a3 >> 5)) + 61956, &v20);
            __dmb(1u);
            if (!v20)
            {
              if (*a5)
              {
                __dmb(2u);
                IOPCIDevice::MemoryWrite32(*a1, 0, ((a2 >> 3) & 0x1FFFFFFC) + 40960, a6);
              }
              __dmb(2u);
              IOPCIDevice::MemoryWrite32(*a1, 0, 4 * (int)vlvf_slot + 61696, 0);
              __dmb(2u);
              uint64_t v16 = *a1;
              uint64_t v17 = 4 * (2 * vlvf_slot + (a3 >> 5)) + 61952;
              uint32_t v18 = 0;
              goto LABEL_12;
            }
          }
          *a5 = 0;
        }
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*a1, 0, 4 * (2 * vlvf_slot + (a3 >> 5)) + 61952, v15);
        __dmb(2u);
        uint64_t v16 = *a1;
        uint64_t v17 = 4 * (int)vlvf_slot + 61696;
        uint32_t v18 = a2 | 0x80000000;
LABEL_12:
        IOPCIDevice::MemoryWrite32(v16, 0, v17, v18);
        return 0;
      }
    }
  }
  return vlvf_slot;
}

uint64_t ixgbe_clear_vfta_generic(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_clear_vfta_generic", 4093, "ixgbe_clear_vfta_generic");
  }
  if (*(_DWORD *)(a1 + 1244))
  {
    unint64_t v2 = 0;
    int v3 = 40960;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v3 & 0xFFFFFFFC, 0);
      ++v2;
      v3 += 4;
    }
    while (v2 < *(unsigned int *)(a1 + 1244));
  }
  uint64_t v4 = -256;
  uint64_t v5 = 61952;
  do
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v4 + 61952, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5, 0);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v5 + 4, 0);
    v5 += 8;
    v4 += 4;
  }
  while (v4);
  return 0;
}

uint64_t ixgbe_check_mac_link_generic(uint64_t a1, int *a2, unsigned char *a3, int a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_mac_link_generic", 4148, "ixgbe_check_mac_link_generic");
  }
  if (*(unsigned char *)(a1 + 1955) && (((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) - 1) & 0xFFFFFFFD) == 0)
  {
    int v12 = *(_DWORD *)(a1 + 696);
    if ((v12 - 7) >= 2)
    {
      if (v12 == 2)
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
        __dmb(1u);
        if ((readData & 4) != 0) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
      __dmb(1u);
      if (readData) {
        goto LABEL_5;
      }
    }
    int v13 = 0;
    *a3 = 0;
    goto LABEL_36;
  }
LABEL_5:
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A4uLL, &readData);
  __dmb(1u);
  uint32_t v8 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A4uLL, &readData);
  __dmb(1u);
  uint32_t v9 = readData;
  if (v8 != readData && (dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): LINKS changed from %08X to %08X\n\n", "ixgbe_check_mac_link_generic", 4186, v8, readData);
  }
  if (a4)
  {
    if (!*(_DWORD *)(a1 + 1304)) {
      goto LABEL_20;
    }
    int v10 = 0;
    while ((v9 & 0x40000000) == 0)
    {
      *a3 = 0;
      IODelay(0x186A0uLL);
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A4uLL, &readData);
      __dmb(1u);
      uint32_t v9 = readData;
      if (++v10 >= *(_DWORD *)(a1 + 1304)) {
        goto LABEL_20;
      }
    }
    LOBYTE(v11) = 1;
  }
  else
  {
    int v11 = (v9 >> 30) & 1;
  }
  *a3 = v11;
LABEL_20:
  int v13 = 32;
  switch((v9 >> 28) & 3)
  {
    case 1u:
      BOOL v14 = *(_DWORD *)(a1 + 696) != 6 || (v9 & 0x8000000) == 0;
      int v13 = 2048;
      int v15 = 8;
      goto LABEL_30;
    case 2u:
      break;
    case 3u:
      BOOL v14 = *(int *)(a1 + 696) < 6 || (v9 & 0x8000000) == 0;
      int v13 = 1024;
      int v15 = 128;
LABEL_30:
      if (v14) {
        int v13 = v15;
      }
      break;
    default:
      int v13 = 2 * ((*(_WORD *)(a1 + 1936) & 0xFFFE) == 5604);
      break;
  }
LABEL_36:
  *a2 = v13;
  return 0;
}

uint64_t ixgbe_get_wwn_prefix_generic(uint64_t a1, _WORD *a2, _WORD *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_wwn_prefix_generic", 4254, "ixgbe_get_wwn_prefix_generic");
  }
  int v9 = 0;
  *a2 = -1;
  *a3 = -1;
  unsigned __int16 v6 = 39;
  if ((*(unsigned int (**)(uint64_t, uint64_t, int *))(a1 + 1728))(a1, 39, &v9)) {
    goto LABEL_4;
  }
  unsigned __int16 v6 = v9;
  if ((unsigned __int16)(v9 + 1) >= 2u)
  {
    if ((*(unsigned int (**)(uint64_t, void, char *))(a1 + 1728))(a1, (unsigned __int16)v9, (char *)&v9 + 2))
    {
      goto LABEL_4;
    }
    if ((v9 & 0x10000) != 0)
    {
      unsigned __int16 v8 = v9 + 7;
      if ((*(unsigned int (**)(uint64_t, void, _WORD *))(a1 + 1728))(a1, (unsigned __int16)(v9 + 7), a2)
        && (dword_10003C040 & 0x100000) != 0)
      {
        IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n", "ixgbe_get_wwn_prefix_generic", 4280, v8);
      }
      unsigned __int16 v6 = v9 + 8;
      if ((*(unsigned int (**)(uint64_t, void, _WORD *))(a1 + 1728))(a1, (unsigned __int16)(v9 + 8), a3))
      {
LABEL_4:
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n", "ixgbe_get_wwn_prefix_generic", 4292, v6);
        }
      }
    }
  }
  return 0;
}

uint64_t ixgbe_get_fcoe_boot_status_generic(uint64_t a1, _WORD *a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_fcoe_boot_status_generic", 4308, "ixgbe_get_fcoe_boot_status_generic");
  }
  int v5 = 0;
  *a2 = -1;
  __int16 v6 = 51;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 1728))(a1, 51, (char *)&v5 + 2);
  if (!result)
  {
    if ((v5 & 0x200000) == 0) {
      return 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 1728))(a1, 23, &v6);
    if (!result)
    {
      if ((unsigned __int16)(v6 + 1) < 2u) {
        return 0;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 1728))(a1);
      if (!result) {
        *a2 = v5 & 1;
      }
    }
  }
  return result;
}

void ixgbe_set_mac_anti_spoofing(uint64_t a1, int a2, int a3)
{
  if (*(_DWORD *)(a1 + 696) != 1)
  {
    char v3 = a3;
    uint32_t readData = 0;
    uint64_t v6 = 4 * (a3 >> 3) + 33280;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v6, &readData);
    __dmb(1u);
    int v7 = 1 << (v3 & 7);
    if (a2) {
      uint32_t v8 = readData | v7;
    }
    else {
      uint32_t v8 = readData & ~v7;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v6, v8);
  }
}

void ixgbe_set_vlan_anti_spoofing(uint64_t a1, int a2, int a3)
{
  if (*(_DWORD *)(a1 + 696) != 1)
  {
    if (a3 <= 0) {
      int v5 = -(-a3 & 7);
    }
    else {
      LOBYTE(v5) = a3 & 7;
    }
    char v6 = v5 + 8;
    uint32_t readData = 0;
    uint64_t v7 = 4 * (a3 >> 3) + 33280;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v7, &readData);
    __dmb(1u);
    if (a2) {
      uint32_t v8 = readData | (1 << v6);
    }
    else {
      uint32_t v8 = readData & ~(1 << v6);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v7, v8);
  }
}

uint64_t ixgbe_get_device_caps_generic(uint64_t a1, uint64_t a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_device_caps_generic", 4403, "ixgbe_get_device_caps_generic");
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 1728))(a1, 44, a2);
  return 0;
}

void ixgbe_enable_relaxed_ordering_gen2(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_enable_relaxed_ordering_gen2", 4420, "ixgbe_enable_relaxed_ordering_gen2");
  }
  if (*(_DWORD *)(a1 + 1260))
  {
    unint64_t v2 = 0;
    int v3 = 24588;
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v3 & 0xFFFFFFCC, &readData);
      __dmb(1u);
      uint32_t v4 = readData | 0x800;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v3 & 0xFFFFFFCC, v4);
      ++v2;
      v3 += 64;
    }
    while (v2 < *(unsigned int *)(a1 + 1260));
  }
  if (*(_DWORD *)(a1 + 1264))
  {
    unsigned int v5 = 0;
    unsigned int v6 = 8704;
    do
    {
      uint32_t v12 = 0;
      if (v5 <= 0x3F) {
        unsigned int v7 = (v5 << 6) + 4108;
      }
      else {
        unsigned int v7 = (v5 << 6) + 49164;
      }
      if (v5 >= 0x10) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = v6;
      }
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v8, &v12);
      __dmb(1u);
      uint32_t v9 = v12 | 0xA000;
      __dmb(2u);
      if (v5 <= 0x3F) {
        unsigned int v10 = (v5 << 6) + 4108;
      }
      else {
        unsigned int v10 = (v5 << 6) + 49164;
      }
      if (v5 >= 0x10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = v6;
      }
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v11, v9);
      ++v5;
      v6 += 4;
    }
    while (v5 < *(_DWORD *)(a1 + 1264));
  }
}

uint64_t ixgbe_calculate_checksum(unsigned __int8 *a1, unsigned int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_calculate_checksum", 4450, "ixgbe_calculate_checksum");
  }
  int v4 = 0;
  if (a1)
  {
    if (a2)
    {
      uint64_t v5 = a2;
      do
      {
        int v6 = *a1++;
        v4 += v6;
        --v5;
      }
      while (v5);
    }
    return -v4;
  }
  return v4;
}

uint64_t ixgbe_hic_unlocked(IOPCIDevice **a1, uint32_t *a2, unsigned int a3, int a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_hic_unlocked", 4481, "ixgbe_hic_unlocked");
  }
  if (a3 - 1793 <= 0xFFFFF8FF)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Buffer length failure buffersize=%d.\n\n");
    }
    return 4294967263;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x15F0CuLL, &readData);
  __dmb(1u);
  uint32_t v8 = readData;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x15F0CuLL, v8 | 0x200);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x15F00uLL, &readData);
  __dmb(1u);
  uint32_t v9 = readData;
  if ((readData & 1) == 0)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n");
    }
    return 4294967263;
  }
  if ((a3 & 3) != 0)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_hic_unlocked", 4501, "Buffer length failure, not aligned to dword");
    }
    return 4294967264;
  }
  else
  {
    if (a3 >= 4)
    {
      uint64_t v11 = a3 >> 2;
      uint64_t v12 = 88064;
      do
      {
        __dmb(2u);
        uint32_t v13 = *a2++;
        IOPCIDevice::MemoryWrite32(*a1, 0, v12, v13);
        v12 += 4;
        --v11;
      }
      while (v11);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x15F00uLL, v9 | 2);
    if (a4)
    {
      int v14 = 0;
      while (1)
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*a1, 0, 0x15F00uLL, &readData);
        __dmb(1u);
        if ((readData & 2) == 0) {
          break;
        }
        IODelay(0x3E8uLL);
        if (a4 == ++v14)
        {
          int v14 = a4;
          break;
        }
      }
      if (v14 == a4) {
        goto LABEL_23;
      }
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0x15F00uLL, &readData);
    uint64_t result = 0;
    __dmb(1u);
    if ((readData & 4) == 0)
    {
LABEL_23:
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Command has failed with no status valid.\n\n");
      }
      return 4294967263;
    }
  }
  return result;
}

uint64_t ixgbe_host_interface_command(uint64_t a1, uint64_t a2, unsigned int a3, int a4, int a5)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_host_interface_command", 4563, "ixgbe_host_interface_command");
  }
  if (a3 - 1793 > 0xFFFFF8FF)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1024);
    if (v10) {
      return v10;
    }
    uint64_t v10 = ixgbe_hic_unlocked((IOPCIDevice **)a1, (uint32_t *)a2, a3, a4);
    if (v10 || !a5)
    {
LABEL_24:
      (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1024);
      return v10;
    }
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x15800uLL, &readData);
    __dmb(1u);
    __int16 v11 = readData;
    *(_DWORD *)a2 = readData;
    if (v11 == 48)
    {
      for (uint64_t i = 0; i != 8; i += 4)
      {
        uint32_t v21 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, i + 88068, &v21);
        __dmb(1u);
        *(_DWORD *)(a2 + 4 + i) = v21;
      }
      unsigned int v13 = *(unsigned __int8 *)(a2 + 1) | (((*(unsigned __int8 *)(a2 + 2) >> 5) & 7) << 8);
      int v14 = 12;
      unsigned int v15 = 3;
      if (!v13) {
        goto LABEL_23;
      }
    }
    else
    {
      unsigned int v13 = HIBYTE(v11);
      int v14 = 4;
      unsigned int v15 = 1;
      if (!v13)
      {
LABEL_23:
        uint64_t v10 = 0;
        goto LABEL_24;
      }
    }
    if (v14 + v13 > a3)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_host_interface_command", 4612, "Buffer not large enough for reply message.\n");
      }
      uint64_t v10 = 4294967263;
      goto LABEL_24;
    }
    if (v15 <= (v13 + 3) >> 2)
    {
      uint64_t v16 = 4 * v15 + 88064;
      uint64_t v17 = (uint32_t *)(a2 + 4 * v15);
      unint64_t v18 = (((unint64_t)v13 + 3) >> 2) - v15 + 1;
      do
      {
        uint32_t v20 = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v16, &v20);
        __dmb(1u);
        *v17++ = v20;
        v16 += 4;
        --v18;
      }
      while (v18);
    }
    goto LABEL_23;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): Buffer length failure buffersize=%d.\n\n", "ixgbe_host_interface_command", 4566, a3);
  }
  return 4294967263;
}

uint64_t ixgbe_set_fw_drv_ver_generic(uint64_t a1, char a2, char a3, char a4, char a5)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_fw_drv_ver_generic", 4655, "ixgbe_set_fw_drv_ver_generic");
  }
  char v13 = *(unsigned char *)(a1 + 1812);
  char v17 = a2;
  char v16 = a3;
  char v15 = a4;
  char v14 = a5;
  *(_DWORD *)uint64_t v12 = 1501;
  char v18 = 0;
  __int16 v19 = 0;
  v12[3] = ixgbe_calculate_checksum(v12, 9u);
  int v10 = 4;
  while (1)
  {
    uint64_t result = ixgbe_host_interface_command(a1, (uint64_t)v12, 0xCu, 500, 1);
    if (!result) {
      break;
    }
    if (!--v10) {
      return result;
    }
  }
  if (v12[2] == 1) {
    return 0;
  }
  else {
    return 4294967263;
  }
}

void ixgbe_set_rxpba_generic(uint64_t a1, unsigned int a2, int a3, int a4)
{
  int v4 = a4;
  unsigned int v6 = *(_DWORD *)(a1 + 1256) - a3;
  if (a2 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_17;
    }
    unsigned int v8 = 5 * v6 / (4 * (int)v7);
    if ((int)v7 >= 0) {
      int v9 = v7;
    }
    else {
      int v9 = v7 + 1;
    }
    int v4 = v9 >> 1;
    v6 -= v8 * (v9 >> 1);
    if ((int)v7 < 2)
    {
      int v4 = 0;
    }
    else
    {
      uint32_t v10 = v8 << 10;
      uint64_t v11 = 15360;
      uint64_t v12 = (v9 >> 1);
      do
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v11, v10);
        v11 += 4;
        --v12;
      }
      while (v12);
    }
  }
  if ((int)v7 > v4)
  {
    uint32_t v13 = (v6 / ((int)v7 - v4)) << 10;
    int v14 = 4 * v4 + 15360;
    uint64_t v15 = v7 - v4;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v14 & 0xFFFFFFFC, v13);
      v14 += 4;
      --v15;
    }
    while (v15);
  }
LABEL_17:
  if ((int)v7 < 1)
  {
    LODWORD(v7) = 0;
LABEL_23:
    int v19 = 4 * v7;
    uint64_t v20 = v7 - 8;
    do
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v19 + 15360), 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v19 + 52224), 0);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, (v19 + 18768), 0);
      v19 += 4;
    }
    while (!__CFADD__(v20++, 1));
    return;
  }
  unsigned int v16 = 52224;
  unsigned int v17 = 18768;
  uint64_t v18 = v7;
  do
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v16, 163840 / (int)v7);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v17, ((163840 / (int)v7) >> 10) - 10);
    v16 += 4;
    v17 += 4;
    --v18;
  }
  while (v18);
  if (v7 <= 7) {
    goto LABEL_23;
  }
}

void ixgbe_clear_tx_pending(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 1285))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x4240uLL, &readData);
    __dmb(1u);
    uint32_t v2 = readData;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4240uLL, v2 | 0x8000);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(0xBB8uLL);
    int v3 = sub_100026380((IOPCIDevice **)a1) - 1;
    do
    {
      int v4 = v3;
      IODelay(0x64uLL);
      LOWORD(readData) = 0;
      IOPCIDevice::ConfigurationRead16(*(IOPCIDevice **)a1, 0xAAuLL, (uint16_t *)&readData);
      if ((readData & 0x20) == 0) {
        break;
      }
      int v3 = v4 - 1;
    }
    while (v4);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x11050uLL, &readData);
    __dmb(1u);
    uint32_t v5 = readData;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x11050uLL, v5 | 0x40000000);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(0x14uLL);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x11050uLL, v5);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x4240uLL, v2);
  }
}

uint64_t ixgbe_bypass_rw_generic(uint64_t a1, int a2, _DWORD *a3)
{
  if (!a3) {
    return 4294967291;
  }
  *a3 = 0;
  int v6 = *(_DWORD *)(a1 + 696);
  if (v6 == 2)
  {
    int v7 = 128;
    int v8 = 64;
    int v9 = 33024;
    int v10 = -16385;
  }
  else
  {
    if (v6 != 4) {
      return 4294967285;
    }
    int v7 = 4;
    int v8 = 2;
    int v9 = 1280;
    int v10 = -513;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
  __dmb(1u);
  uint32_t v12 = (v9 | readData) & v10 | v7;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v12 | 1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x3E8uLL);
  v12 &= ~1u;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v12);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x3E8uLL);
  uint32_t v13 = v12 & ~v7;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v13);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x3E8uLL);
  for (int i = 0; i != 32; ++i)
  {
    __dmb(2u);
    uint32_t v15 = v13 & 0xFFFFFFFE | ((a2 << i) >> 31);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v15);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(0x3E8uLL);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v15 | v7);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(0x3E8uLL);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v15 & ~v7);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
    IODelay(0x3E8uLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
    __dmb(1u);
    uint32_t v13 = readData;
    *a3 = ((readData & v8) != 0) | (2 * *a3);
    IODelay(0x3E8uLL);
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v13 & 0xFFFFFFFE | v7);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0x3E8uLL);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v13 & 0xFFFFFFFE | v7 | 1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  uint64_t result = 0;
  __dmb(1u);
  *a3 = a2 & 0xC0000000 | *a3 & 0x3FFFFFFF;
  return result;
}

BOOL ixgbe_bypass_valid_rd_generic(int a1, int a2)
{
  uint64_t v2 = a1 & 0xC0000000;
  if (v2 != (a2 & 0xC0000000)) {
    return 0;
  }
  if (v2 == 0x40000000) {
    return ((a2 ^ a1) & 0x3FFFFFF) == 0;
  }
  if (v2 || (a2 & 0xC) != 0 && ((a2 ^ a1) & 0x73FF0) == 0) {
    return 1;
  }
  return v2;
}

uint64_t ixgbe_bypass_set_generic(uint64_t a1, int a2, int a3, int a4)
{
  unsigned int v12 = 0;
  if (ixgbe_bypass_rw_generic(a1, a2, &v12)) {
    return 4294967264;
  }
  unsigned int v7 = v12 & ~a3 | a4;
  int v8 = v7 | 0x20000000;
  if (ixgbe_bypass_rw_generic(a1, v7 | 0x20000000, &v12)) {
    return 4294967264;
  }
  if (v7 >> 30)
  {
    IODelay(0x186A0uLL);
    return 0;
  }
  else
  {
    int v10 = 7;
    while (--v10)
    {
      if (ixgbe_bypass_rw_generic(a1, 0, &v12)) {
        return 4294967264;
      }
      BOOL valid = ixgbe_bypass_valid_rd_generic(v8, v12);
      uint64_t result = 0;
      if (valid) {
        return result;
      }
    }
    return 4294967261;
  }
}

uint64_t ixgbe_bypass_rd_eep_generic(uint64_t a1, unsigned __int8 a2, unsigned char *a3)
{
  int v7 = 0;
  if (ixgbe_bypass_rw_generic(a1, (a2 << 8) | 0xA0000000, &v7)) {
    return 4294967264;
  }
  IODelay(0x186A0uLL);
  uint64_t result = ixgbe_bypass_rw_generic(a1, (a2 << 8) | 0x80000000, &v7);
  if (result) {
    return 4294967264;
  }
  *a3 = v7;
  return result;
}

uint64_t ixgbe_get_orom_version(uint64_t a1, uint64_t a2)
{
  int v9 = 0;
  unsigned __int16 v8 = 0;
  *(unsigned char *)(a2 + 14) = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 1728))(a1, 23, (char *)&v9 + 2);
  if ((unsigned __int16)(HIWORD(v9) + 1) >= 2u)
  {
    (*(void (**)(uint64_t, void, int *))(a1 + 1728))(a1, (unsigned __int16)(HIWORD(v9) + 132), &v9);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, unsigned __int16 *))(a1 + 1728))(a1, (unsigned __int16)(HIWORD(v9) + 131), &v8);
    int v5 = (unsigned __int16)v9;
    if ((unsigned __int16)v9 != 0xFFFF)
    {
      int v6 = v8;
      if (v8 != 0xFFFF)
      {
        if ((unsigned __int16)v9 | v8)
        {
          *(unsigned char *)(a2 + 14) = 1;
          *(unsigned char *)(a2 + 15) = BYTE1(v6);
          HIDWORD(v7) = v6;
          LODWORD(v7) = v5 << 16;
          *(_WORD *)(a2 + 16) = v7 >> 24;
          *(unsigned char *)(a2 + 18) = v5;
        }
      }
    }
  }
  return result;
}

uint64_t ixgbe_get_oem_prod_version(uint64_t a1, uint64_t a2)
{
  int v8 = 0;
  int v9 = 0;
  __int16 v7 = 0;
  *(unsigned char *)(a2 + 9) = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(a1 + 1728))(a1, 27, &v7);
  if ((unsigned __int16)(v7 + 1) >= 2u)
  {
    (*(void (**)(uint64_t))(a1 + 1728))(a1);
    uint64_t result = (*(uint64_t (**)(uint64_t, void, int *))(a1 + 1728))(a1, (unsigned __int16)(v7 + 1), &v8);
    if (HIWORD(v8) == 3 && (v8 & 0xF) == 0)
    {
      (*(void (**)(uint64_t, void, int *))(a1 + 1728))(a1, (unsigned __int16)(v7 + 2), &v9);
      uint64_t result = (*(uint64_t (**)(uint64_t, void, char *))(a1 + 1728))(a1, (unsigned __int16)(v7 + 3), (char *)&v9 + 2);
      char v5 = v9;
      if ((unsigned __int16)v9 != 0xFFFF)
      {
        __int16 v6 = HIWORD(v9);
        if (HIWORD(v9) != 0xFFFF)
        {
          if ((unsigned __int16)v9 | HIWORD(v9))
          {
            *(unsigned char *)(a2 + 10) = BYTE1(v9);
            *(unsigned char *)(a2 + 11) = v5;
            *(_WORD *)(a2 + 12) = v6;
            *(unsigned char *)(a2 + 9) = 1;
          }
        }
      }
    }
  }
  return result;
}

uint64_t ixgbe_get_etk_id(uint64_t a1, int *a2)
{
  int v7 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(a1 + 1728))(a1, 45, (char *)&v7 + 2)) {
    HIWORD(v7) = -1;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, int *))(a1 + 1728))(a1, 46, &v7);
  if (result)
  {
    unsigned __int16 v5 = -1;
  }
  else
  {
    unsigned __int16 v5 = v7;
    if (((__int16)v7 & 0x80000000) == 0)
    {
      unsigned __int16 v6 = HIWORD(v7);
      goto LABEL_8;
    }
  }
  unsigned __int16 v6 = v5;
  unsigned __int16 v5 = HIWORD(v7);
LABEL_8:
  *a2 = v5 | (v6 << 16);
  return result;
}

int8x8_t ixgbe_dcb_get_rtrup2tc_generic(IOPCIDevice **a1, int8x8_t *a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x3020uLL, &readData);
  __dmb(1u);
  uint32x4_t v3 = (uint32x4_t)vld1q_dup_f32((const float *)&readData);
  int8x8_t result = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vshlq_u32(v3, (uint32x4_t)xmmword_1000324F0), (int16x8_t)vshlq_u32(v3, (uint32x4_t)xmmword_1000324E0))), (int8x8_t)0x707070707070707);
  *a2 = result;
  return result;
}

uint64_t ixgbe_mng_present(uint64_t a1)
{
  if (*(int *)(a1 + 696) < 2) {
    return 0;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 28), &readData);
  __dmb(1u);
  return (readData >> 2) & 1;
}

uint64_t ixgbe_mng_enabled(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 28), &readData);
  uint64_t result = 0;
  __dmb(1u);
  if ((readData & 0xE) == 4)
  {
    uint32_t v4 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x5820uLL, &v4);
    uint64_t result = 0;
    __dmb(1u);
    if ((v4 & 0x20000) != 0)
    {
      if (*(int *)(a1 + 696) > 4) {
        return 1;
      }
      uint32_t v3 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 16), &v3);
      uint64_t result = 0;
      __dmb(1u);
      if ((v3 & 0x20000000) == 0) {
        return 1;
      }
    }
  }
  return result;
}

uint64_t ixgbe_setup_mac_link_multispeed_fiber(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_mac_link_multispeed_fiber", 5292, "ixgbe_setup_mac_link_multispeed_fiber");
  }
  uint64_t result = ixgbe_get_link_capabilities(a1);
  if (!result)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 1652) = 0;
  }
  return result;
}

uint64_t ixgbe_set_soft_rate_select_speed(uint64_t result, int a2)
{
  uint64_t v2 = result;
  if (a2 == 128)
  {
    char v3 = 8;
LABEL_5:
    unsigned __int8 v4 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(result + 1520))(result, 110, 162, &v4);
    if (result)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        return IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_soft_rate_select_speed", 5451, "Failed to read Rx Rate Select RS0\n");
      }
    }
    else
    {
      unsigned __int8 v4 = v4 & 0xF7 | v3;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v2 + 1528))(v2, 110, 162, v4);
      if (result)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          return IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_soft_rate_select_speed", 5461, "Failed to write Rx Rate Select RS0\n");
        }
      }
      else
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(v2 + 1520))(v2, 118, 162, &v4);
        if (result)
        {
          if ((dword_10003C040 & 0x100000) != 0) {
            return IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_soft_rate_select_speed", 5470, "Failed to read Rx Rate Select RS1\n");
          }
        }
        else
        {
          unsigned __int8 v4 = v4 & 0xF7 | v3;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v2 + 1528))(v2, 118, 162, v4);
          if (result && (dword_10003C040 & 0x100000) != 0) {
            return IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_soft_rate_select_speed", 5480, "Failed to write Rx Rate Select RS1\n");
          }
        }
      }
    }
    return result;
  }
  if (a2 == 32)
  {
    char v3 = 0;
    goto LABEL_5;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    return IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_soft_rate_select_speed", 5442, "Invalid fixed module speed\n");
  }
  return result;
}

uint64_t sub_100029638(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_eeprom", 1791, "ixgbe_acquire_eeprom");
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 1)) {
    return 4294967280;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
  __dmb(1u);
  uint32_t v3 = readData | 0x40;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v3);
  int v4 = 1000;
  do
  {
    uint32_t v7 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &v7);
    __dmb(1u);
    uint32_t v5 = v7;
    if ((v7 & 0x80) != 0)
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v5 & 0xFFFFFFFC);
      uint32_t v6 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v6);
      __dmb(1u);
      IODelay(1uLL);
      return 0;
    }
    IODelay(5uLL);
    --v4;
  }
  while (v4);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v5 & 0xFFFFFFBF);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_acquire_eeprom", 1815, "Could not acquire EEPROM grant\n");
  }
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000297E0(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_ready_eeprom", 1954, "ixgbe_ready_eeprom");
  }
  unsigned __int16 v2 = 0;
  do
  {
    sub_100029AC4(a1, 5, 8);
    if ((sub_100029C14(a1, 8) & 1) == 0) {
      return 0;
    }
    IODelay(5uLL);
    sub_1000299C8(a1);
    v2 += 5;
  }
  while ((unsigned __int16)(v2 >> 3) < 0x271u);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_ready_eeprom", 1978, "SPI EEPROM Status error\n");
  }
  return 0xFFFFFFFFLL;
}

void sub_1000298C4(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_release_eeprom", 2151, "ixgbe_release_eeprom");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFFFFC | 2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v2);
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v3);
  __dmb(1u);
  IODelay(1uLL);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v2 & 0xFFFFFFBF);
  (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 1);
  IODelay((1000 * *(_DWORD *)(a1 + 1788)));
}

void sub_1000299C8(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_standby_eeprom", 1993, "ixgbe_standby_eeprom");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  uint32_t v3 = readData | 2;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v3);
  uint32_t v5 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v5);
  __dmb(1u);
  IODelay(1uLL);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v2 & 0xFFFFFFFD);
  uint32_t v4 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v4);
  __dmb(1u);
  IODelay(1uLL);
}

void sub_100029AC4(uint64_t a1, int a2, int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_shift_out_eeprom_bits", 2021, "ixgbe_shift_out_eeprom_bits");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  if (a3)
  {
    unsigned int v7 = 1 << (a3 - 1);
    do
    {
      uint32_t v8 = readData & 0xFFFFFFFB | (4 * ((v7 & a2) != 0));
      uint32_t readData = v8;
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v8);
      uint32_t v9 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v9);
      __dmb(1u);
      IODelay(1uLL);
      sub_100029D04(a1, &readData);
      sub_100029DAC(a1, &readData);
      v7 >>= 1;
      --a3;
    }
    while (a3);
    uint32_t v6 = readData;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), v6 & 0xFFFFFFFB);
  uint32_t v9 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v9);
  __dmb(1u);
}

uint64_t sub_100029C14(uint64_t a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_shift_in_eeprom_bits", 2076, "ixgbe_shift_in_eeprom_bits");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &readData);
  __dmb(1u);
  uint32_t v8 = readData & 0xFFFFFFF3;
  for (uint32_t i = 0; a2; --a2)
  {
    sub_100029D04(a1, &v8);
    uint32_t v6 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), &v6);
    __dmb(1u);
    uint32_t v8 = v6 & 0xFFFFFFFB;
    uint32_t i = (2 * i) | (v6 >> 3) & 1;
    sub_100029DAC(a1, &v8);
  }
  return (unsigned __int16)i;
}

void sub_100029D04(uint64_t a1, uint32_t *a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_raise_eeprom_clk", 2112, "ixgbe_raise_eeprom_clk");
  }
  *a2 |= 1u;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), *a2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(1uLL);
}

void sub_100029DAC(uint64_t a1, uint32_t *a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_lower_eeprom_clk", 2131, "ixgbe_lower_eeprom_clk");
  }
  *a2 &= ~1u;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, **(unsigned int **)(a1 + 1928), *a2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(1uLL);
}

uint64_t ixgbe_init_mac_link_ops_82599(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_mac_link_ops_82599", 31, "ixgbe_init_mac_link_ops_82599");
  }
  if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) == 1 && (ixgbe_mng_enabled(a1) & 1) == 0)
  {
    *(void *)(a1 + 240) = ixgbe_disable_tx_laser_multispeed_fiber;
    *(void *)(a1 + 248) = ixgbe_enable_tx_laser_multispeed_fiber;
    *(void *)(a1 + 256) = ixgbe_flap_tx_laser_multispeed_fiber;
  }
  else
  {
    *(void *)(a1 + 240) = 0;
    *(void *)(a1 + 248) = 0;
    *(void *)(a1 + 256) = 0;
  }
  if (*(unsigned char *)(a1 + 1673))
  {
    *(void *)(a1 + 264) = ixgbe_setup_mac_link_multispeed_fiber;
    *(void *)(a1 + 272) = ixgbe_setup_mac_link_82599;
    *(void *)(a1 + 296) = ixgbe_set_hard_rate_select_speed;
    uint64_t result = ixgbe_get_media_type(a1);
    if (result == 2) {
      *(void *)(a1 + 296) = ixgbe_set_soft_rate_select_speed;
    }
  }
  else
  {
    uint64_t result = ixgbe_get_media_type(a1);
    if (result == 5
      && *(_DWORD *)(a1 + 1668) <= 1u
      && (uint64_t result = ixgbe_verify_lesm_fw_enabled_82599(a1), (result & 1) == 0))
    {
      uint32_t v3 = ixgbe_setup_mac_link_smartspeed;
    }
    else
    {
      uint32_t v3 = ixgbe_setup_mac_link_82599;
    }
    *(void *)(a1 + 264) = v3;
  }
  return result;
}

void ixgbe_disable_tx_laser_multispeed_fiber(IOPCIDevice **a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x20uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  if (!ixgbe_check_reset_blocked((uint64_t)a1))
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x20uLL, v2 | 8);
    uint32_t v3 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v3);
    __dmb(1u);
    IODelay(0x64uLL);
  }
}

void ixgbe_enable_tx_laser_multispeed_fiber(IOPCIDevice **a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x20uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData & 0xFFFFFFF7;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x20uLL, v2);
  uint32_t v3 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v3);
  __dmb(1u);
  IODelay(0x186A0uLL);
}

void ixgbe_flap_tx_laser_multispeed_fiber(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_flap_tx_laser_multispeed_fiber", 693, "ixgbe_flap_tx_laser_multispeed_fiber");
  }
  if (!ixgbe_check_reset_blocked(a1))
  {
    if (*(unsigned char *)(a1 + 1284))
    {
      ixgbe_disable_tx_laser_multispeed_fiber((IOPCIDevice **)a1);
      ixgbe_enable_tx_laser_multispeed_fiber((IOPCIDevice **)a1);
      *(unsigned char *)(a1 + 1284) = 0;
    }
  }
}

uint64_t ixgbe_setup_mac_link_82599(uint64_t a1, int a2, int a3)
{
  char v21 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A8uLL, &readData);
  __dmb(1u);
  uint32_t v7 = readData;
  uint32_t readData = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_mac_link_82599", 871, "ixgbe_setup_mac_link_82599");
  }
  uint64_t link_capabilities = ixgbe_get_link_capabilities(a1);
  if (!link_capabilities)
  {
    uint32_t v10 = readData & a2;
    if ((readData & a2) == 0) {
      return 4294967288;
    }
    if (*(unsigned char *)(a1 + 1283)) {
      int v11 = *(_DWORD *)(a1 + 1268);
    }
    else {
      int v11 = v6;
    }
    int v12 = v6 & 0xE000;
    BOOL v13 = (v6 & 0xA000) == 0x8000 || v12 == 57344;
    int v14 = !v13;
    if (v13)
    {
      int v17 = v6 & 0x3FFEFFFF;
      if ((v10 & 0x80) != 0)
      {
        if (v11 < 0) {
          v17 |= 0x80000000;
        }
        if ((v11 & 0x10000) != 0 && !*(unsigned char *)(a1 + 1672)) {
          v17 |= 0x10000u;
        }
      }
      uint64_t v16 = v17 | (v10 << 25) & 0x40000000;
    }
    else
    {
      int v15 = v7 & 0x30000;
      if ((v6 & 0xA200) != 0)
      {
        uint64_t link_capabilities = 0;
        if (v12 != 24576 || v15 != 0x20000 || (v6 & 0x200) != 0 || v10 != 32) {
          return link_capabilities;
        }
        uint64_t v16 = v6 & 0xFFFF1FFF;
        if (v21 || *(_DWORD *)(a1 + 1616) == 23) {
          uint64_t v16 = v16 | 0x4000;
        }
      }
      else
      {
        uint64_t link_capabilities = 0;
        if (v10 != 128 || v15 != 0x20000) {
          return link_capabilities;
        }
        uint64_t v16 = v6 & 0xFFFF1FFF | 0x6000;
      }
    }
    if (v16 == v6)
    {
      return 0;
    }
    else
    {
      uint64_t link_capabilities = (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 232))(a1, v16, 0);
      if (!link_capabilities)
      {
        if (((v14 | a3 ^ 1) & 1) == 0)
        {
          int v18 = 45;
          while (1)
          {
            uint32_t v19 = 0;
            IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A4uLL, &v19);
            __dmb(1u);
            if ((v19 & 0x80000000) != 0) {
              break;
            }
            IODelay(0x186A0uLL);
            if (!--v18)
            {
              if ((dword_10003C040 & 0x100000) != 0) {
                IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_mac_link_82599", 952, "Autoneg did not complete.\n");
              }
              uint64_t link_capabilities = 4294967282;
              goto LABEL_46;
            }
          }
        }
        uint64_t link_capabilities = 0;
LABEL_46:
        IODelay(0xC350uLL);
      }
    }
  }
  return link_capabilities;
}

void ixgbe_set_hard_rate_select_speed(IOPCIDevice **a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x20uLL, &readData);
  __dmb(1u);
  if (a2 == 32)
  {
    uint32_t v4 = readData & 0xFFFFDFDF | 0x2000;
    goto LABEL_5;
  }
  if (a2 == 128)
  {
    uint32_t v4 = readData | 0x2020;
LABEL_5:
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x20uLL, v4);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v5);
    __dmb(1u);
    return;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_hard_rate_select_speed", 727, "Invalid fixed module speed\n");
  }
}

uint64_t ixgbe_verify_lesm_fw_enabled_82599(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_verify_lesm_fw_enabled_82599", 2342, "ixgbe_verify_lesm_fw_enabled_82599");
  }
  int v7 = 0;
  __int16 v6 = 0;
  int v2 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 1728))(a1, 15, (char *)&v7 + 2);
  uint64_t result = 0;
  if (!v2)
  {
    if (HIWORD(v7)) {
      BOOL v4 = HIWORD(v7) == 0xFFFF;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4) {
      return 0;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, void, int *))(a1 + 1728))(a1, (unsigned __int16)(HIWORD(v7) + 2), &v7);
    if (result)
    {
      return 0;
    }
    else if ((_WORD)v7 && (unsigned __int16)v7 != 0xFFFF)
    {
      return !(*(unsigned int (**)(uint64_t, void, __int16 *))(a1 + 1728))(a1, (unsigned __int16)(v7 + 1), &v6)&& v6 < 0;
    }
  }
  return result;
}

uint64_t ixgbe_setup_mac_link_smartspeed(uint64_t a1, int a2, int a3)
{
  int v15 = 0;
  char v14 = 0;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
  __dmb(1u);
  uint32_t v6 = readData;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_mac_link_smartspeed", 753, "ixgbe_setup_mac_link_smartspeed");
  }
  int v7 = 0;
  *(_DWORD *)(a1 + 1652) = a2 & 0xA8;
  *(unsigned char *)(a1 + 1672) = 0;
LABEL_4:
  uint64_t v8 = ixgbe_setup_mac_link_82599(a1, a2, a3);
  if (!v8)
  {
    int v9 = 5;
    while (1)
    {
      IODelay(0x186A0uLL);
      uint64_t v8 = ixgbe_check_link(a1);
      if (v8) {
        break;
      }
      if (v14)
      {
LABEL_19:
        uint64_t v10 = 0;
        goto LABEL_20;
      }
      if (!--v9)
      {
        if (++v7 != 3) {
          goto LABEL_4;
        }
        uint64_t v10 = 0;
        if (v6 >> 30)
        {
          if ((v6 & 0x10000) != 0)
          {
            *(unsigned char *)(a1 + 1672) = 1;
            uint64_t v10 = ixgbe_setup_mac_link_82599(a1, a2, a3);
            if (!v10)
            {
              int v11 = 6;
              while (1)
              {
                IODelay(0x186A0uLL);
                uint64_t v8 = ixgbe_check_link(a1);
                if (v8) {
                  goto LABEL_18;
                }
                if (v14) {
                  goto LABEL_19;
                }
                if (!--v11)
                {
                  *(unsigned char *)(a1 + 1672) = 0;
                  uint64_t v8 = ixgbe_setup_mac_link_82599(a1, a2, a3);
                  goto LABEL_18;
                }
              }
            }
          }
        }
        goto LABEL_20;
      }
    }
  }
LABEL_18:
  uint64_t v10 = v8;
LABEL_20:
  if (v14 && v15 == 32 && (dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_mac_link_smartspeed", 843, "Smartspeed has downgraded the link speed from the maximum advertised\n");
  }
  return v10;
}

uint64_t ixgbe_init_phy_ops_82599(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_phy_ops_82599", 88, "ixgbe_init_phy_ops_82599");
  }
  if (*(_WORD *)(a1 + 1936) == 5464)
  {
    *(unsigned char *)(a1 + 1675) = 1;
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
    __dmb(1u);
    uint32_t v2 = readData & 0xFFFCFCFE | 0x100;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v2);
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &v5);
    __dmb(1u);
    *(void *)(a1 + 1520) = sub_10002A968;
    *(void *)(a1 + 1528) = sub_10002AB20;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(a1 + 1416))(a1);
  if (v3 != -19)
  {
    ixgbe_init_mac_link_ops_82599(a1);
    if (*(_DWORD *)(a1 + 1628) != 0xFFFF) {
      *(void *)(a1 + 1440) = 0;
    }
    if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) == 4)
    {
      *(void *)(a1 + 264) = sub_10002ACD8;
      *(void *)(a1 + 288) = ixgbe_get_copper_link_capabilities_generic;
    }
    if (*(_DWORD *)(a1 + 1616) == 2)
    {
      *(void *)(a1 + 1480) = ixgbe_setup_phy_link_tnx;
      *(void *)(a1 + 1504) = ixgbe_check_phy_link_tnx;
      *(void *)(a1 + 1512) = ixgbe_get_phy_firmware_version_tnx;
    }
  }
  return v3;
}

uint64_t sub_10002A968(uint64_t a1, unsigned int a2, unsigned int a3, unsigned char *a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_byte_82599", 2507, "ixgbe_read_i2c_byte_82599");
  }
  if (*(unsigned char *)(a1 + 1675))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
    __dmb(1u);
    uint32_t v8 = readData | 1;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v8);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
    int v9 = -200;
    while (1)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
      __dmb(1u);
      if ((readData & 2) != 0) {
        break;
      }
      IODelay(0x1388uLL);
      if (__CFADD__(v9++, 1))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_i2c_byte_82599", 2527, "Driver can't access resource, acquiring I2C bus timeout.\n");
        }
        uint64_t i2c_byte_generic = 4294967278;
        goto LABEL_12;
      }
    }
  }
  uint64_t i2c_byte_generic = ixgbe_read_i2c_byte_generic(a1, a2, a3, a4);
LABEL_12:
  if (*(unsigned char *)(a1 + 1675))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
    __dmb(1u);
    uint32_t v12 = readData & 0xFFFFFFFE;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v12);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
  }
  return i2c_byte_generic;
}

uint64_t sub_10002AB20(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_i2c_byte_82599", 2565, "ixgbe_write_i2c_byte_82599");
  }
  if (*(unsigned char *)(a1 + 1675))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
    __dmb(1u);
    uint32_t v8 = readData | 1;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v8);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
    int v9 = -200;
    while (1)
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
      __dmb(1u);
      if ((readData & 2) != 0) {
        break;
      }
      IODelay(0x1388uLL);
      if (__CFADD__(v9++, 1))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_i2c_byte_82599", 2585, "Driver can't access resource, acquiring I2C bus timeout.\n");
        }
        uint64_t v11 = 4294967278;
        goto LABEL_12;
      }
    }
  }
  uint64_t v11 = ixgbe_write_i2c_byte_generic(a1, a2, a3, a4);
LABEL_12:
  if (*(unsigned char *)(a1 + 1675))
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x20uLL, &readData);
    __dmb(1u);
    uint32_t v12 = readData & 0xFFFFFFFE;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x20uLL, v12);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
    __dmb(1u);
  }
  return v11;
}

uint64_t sub_10002ACD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_copper_link_82599", 979, "ixgbe_setup_copper_link_82599");
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1496))(a1, a2, a3);
  ixgbe_start_mac_link_82599(a1, a3);
  return v6;
}

uint64_t ixgbe_setup_sfp_modules_82599(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_sfp_modules_82599", 144, "ixgbe_setup_sfp_modules_82599");
  }
  if (*(_DWORD *)(a1 + 1628) == 0xFFFF) {
    return 0;
  }
  int v6 = 0;
  unsigned __int16 v5 = 0;
  ixgbe_init_mac_link_ops_82599(a1);
  *(void *)(a1 + 1440) = 0;
  uint64_t result = ixgbe_get_sfp_init_sequence_offsets(a1, (unsigned __int16 *)&v6 + 1, (unsigned __int16 *)&v6);
  if (!result)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 8))
    {
      return 4294967280;
    }
    else
    {
      while (1)
      {
        uint64_t v3 = *(unsigned int (**)(uint64_t, void, unsigned __int16 *))(a1 + 1728);
        LOWORD(v6) = v6 + 1;
        if (v3(a1, (unsigned __int16)v6, &v5))
        {
          (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 8);
          IODelay((1000 * *(_DWORD *)(a1 + 1788)));
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n", "ixgbe_setup_sfp_modules_82599", 202, (unsigned __int16)v6);
          }
          return 4294967293;
        }
        if ((__int16)v5 == -1) {
          break;
        }
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x14F00uLL, v5);
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
        __dmb(1u);
      }
      (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 8);
      IODelay((1000 * *(_DWORD *)(a1 + 1788)));
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 232))(a1, *(_DWORD *)(a1 + 1268) | 0x6000u, 0);
      if (result)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_setup_sfp_modules_82599", 186, "sfp module setup not complete\n");
        }
        return 4294967266;
      }
    }
  }
  return result;
}

uint64_t prot_autoc_read_82599(uint64_t a1, unsigned char *a2, uint32_t *a3)
{
  *a2 = 0;
  if (ixgbe_verify_lesm_fw_enabled_82599(a1))
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 8)) {
      return 4294967280;
    }
    *a2 = 1;
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
  uint64_t result = 0;
  __dmb(1u);
  *a3 = readData;
  return result;
}

uint64_t prot_autoc_write_82599(uint64_t a1, uint32_t a2, int a3)
{
  if (ixgbe_check_reset_blocked(a1))
  {
    uint64_t v6 = 0;
    if (!a3) {
      return v6;
    }
    goto LABEL_11;
  }
  if (a3)
  {
LABEL_5:
    char v7 = 1;
    goto LABEL_10;
  }
  if (ixgbe_verify_lesm_fw_enabled_82599(a1))
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t))(a1 + 200))(a1, 8)) {
      return 4294967280;
    }
    goto LABEL_5;
  }
  char v7 = 0;
LABEL_10:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, a2);
  uint64_t v6 = ixgbe_reset_pipeline_82599((IOPCIDevice **)a1);
  if (v7) {
LABEL_11:
  }
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 8);
  return v6;
}

uint64_t ixgbe_reset_pipeline_82599(IOPCIDevice **a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x42A8uLL, &readData);
  __dmb(1u);
  if ((readData & 0x70000000) != 0)
  {
    uint32_t v2 = readData & 0x8FFFFFFF;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0x42A8uLL, v2);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &readData);
    __dmb(1u);
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x42A0uLL, &readData);
  __dmb(1u);
  uint32_t v3 = readData | 0x1000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x42A0uLL, v3 ^ 0x8000);
  int v4 = 10;
  do
  {
    IODelay(0xFA0uLL);
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0x42B0uLL, &readData);
    __dmb(1u);
    if ((readData & 0xF0000) != 0)
    {
      uint64_t v5 = 0;
      goto LABEL_10;
    }
    --v4;
  }
  while (v4);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_pipeline_82599", 2475, "auto negotiation not completed\n");
  }
  uint64_t v5 = 4294967281;
LABEL_10:
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x42A0uLL, v3);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &readData);
  __dmb(1u);
  return v5;
}

uint64_t ixgbe_init_ops_82599(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_ops_82599", 294, "ixgbe_init_ops_82599");
  }
  ixgbe_init_phy_ops_generic(a1);
  uint64_t inited = ixgbe_init_ops_generic(a1);
  *(void *)(a1 + 1416) = ixgbe_identify_phy_82599;
  *(void *)(a1 + 1432) = ixgbe_init_phy_ops_82599;
  *(void *)(a1 + 24) = ixgbe_reset_hw_82599;
  *(void *)(a1 + 48) = ixgbe_enable_relaxed_ordering_gen2;
  *(void *)(a1 + 56) = ixgbe_get_media_type_82599;
  *(void *)(a1 + 64) = ixgbe_get_supported_physical_layer_82599;
  *(void *)(a1 + 184) = ixgbe_disable_sec_rx_path_generic;
  *(void *)(a1 + 192) = ixgbe_enable_sec_rx_path_generic;
  *(void *)(a1 + 176) = ixgbe_enable_rx_dma_82599;
  *(void *)(a1 + 152) = ixgbe_read_analog_reg8_82599;
  *(void *)(a1 + 160) = ixgbe_write_analog_reg8_82599;
  *(void *)(a1 + 32) = ixgbe_start_hw_82599;
  *(void *)(a1 + 80) = ixgbe_get_san_mac_addr_generic;
  *(void *)(a1 + 88) = ixgbe_set_san_mac_addr_generic;
  *(void *)(a1 + 96) = ixgbe_get_device_caps_generic;
  *(void *)(a1 + 104) = ixgbe_get_wwn_prefix_generic;
  *(void *)(a1 + 112) = ixgbe_get_fcoe_boot_status_generic;
  *(void *)(a1 + 224) = prot_autoc_read_82599;
  *(void *)(a1 + 232) = prot_autoc_write_82599;
  *(void *)(a1 + 384) = ixgbe_set_vmdq_generic;
  *(void *)(a1 + 392) = ixgbe_set_vmdq_san_mac_generic;
  *(void *)(a1 + 400) = ixgbe_clear_vmdq_generic;
  *(void *)(a1 + 376) = ixgbe_insert_mac_addr_generic;
  *(_DWORD *)(a1 + 1252) = 1;
  *(void *)(a1 + 464) = ixgbe_set_vfta_generic;
  *(void *)(a1 + 472) = ixgbe_set_vlvf_generic;
  *(void *)(a1 + 456) = ixgbe_clear_vfta_generic;
  *(void *)(a1 + 488) = ixgbe_init_uta_tables_generic;
  *(void *)(a1 + 168) = ixgbe_setup_sfp_modules_82599;
  *(void *)(a1 + 496) = ixgbe_set_mac_anti_spoofing;
  *(void *)(a1 + 504) = ixgbe_set_vlan_anti_spoofing;
  *(void *)(a1 + 288) = ixgbe_get_link_capabilities_82599;
  *(void *)(a1 + 280) = ixgbe_check_mac_link_generic;
  *(void *)(a1 + 304) = ixgbe_set_rxpba_generic;
  ixgbe_init_mac_link_ops_82599(a1);
  *(void *)(a1 + 1240) = 0x8000000080;
  *(_DWORD *)(a1 + 1248) = 128;
  *(_DWORD *)(a1 + 1264) = 128;
  *(void *)(a1 + 1256) = 0x8000000200;
  *(_WORD *)(a1 + 1280) = ixgbe_get_pcie_msix_count_generic(a1);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, *(unsigned int *)(*(void *)(a1 + 1928) + 28), &readData);
  __dmb(1u);
  *(unsigned char *)(a1 + 1282) = (readData & 0xE) != 0;
  *(void *)(a1 + 1824) = ixgbe_init_mbx_params_pf;
  *(void *)(a1 + 1728) = sub_10002C414;
  *(void *)(a1 + 1736) = sub_10002C4DC;
  *(void *)(a1 + 536) = ixgbe_set_fw_drv_ver_generic;
  *(void *)(a1 + 544) = ixgbe_bypass_rw_generic;
  *(void *)(a1 + 552) = ixgbe_bypass_valid_rd_generic;
  *(void *)(a1 + 560) = ixgbe_bypass_set_generic;
  *(void *)(a1 + 568) = ixgbe_bypass_rd_eep_generic;
  *(void *)(a1 + 576) = ixgbe_dcb_get_rtrup2tc_generic;
  return inited;
}

uint64_t ixgbe_identify_phy_82599(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_identify_phy_82599", 2122, "ixgbe_identify_phy_82599");
  }
  uint64_t v2 = ixgbe_identify_phy_generic(a1);
  if (v2)
  {
    if ((*(unsigned int (**)(uint64_t))(a1 + 56))(a1) == 4) {
      return v2;
    }
    uint64_t v2 = ixgbe_identify_module_generic(a1);
  }
  int v3 = *(_DWORD *)(a1 + 1616);
  if (v3 == 25) {
    return 4294967277;
  }
  if (!v3)
  {
    uint64_t v2 = 0;
    *(_DWORD *)(a1 + 1616) = 1;
  }
  return v2;
}

uint64_t ixgbe_reset_hw_82599(uint64_t a1)
{
  char v16 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_hw_82599", 1007, "ixgbe_reset_hw_82599");
  }
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 120))(a1);
  if (!v2)
  {
    ixgbe_clear_tx_pending(a1);
    uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 1432))(a1);
    if (v2 != -19)
    {
      if (!*(unsigned char *)(a1 + 1632)
        || (uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 168))(a1), *(unsigned char *)(a1 + 1632) = 0, v2 != -19))
      {
        if (!*(unsigned char *)(a1 + 1648))
        {
          int v3 = *(void (**)(uint64_t))(a1 + 1440);
          if (v3) {
            v3(a1);
          }
        }
        int v17 = 0;
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
        __dmb(1u);
        __int16 v14 = readData;
        while (1)
        {
          if (*(unsigned char *)(a1 + 1952))
          {
            int v4 = 8;
          }
          else
          {
            (*(void (**)(uint64_t, int *, char *, void))(a1 + 280))(a1, &v17, &v16, 0);
            if (v16) {
              int v4 = 0x4000000;
            }
            else {
              int v4 = 8;
            }
          }
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0, &readData);
          __dmb(1u);
          uint32_t v5 = readData | v4;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0, v5);
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
          unsigned int v6 = 0;
          __dmb(1u);
          do
          {
            IODelay(1uLL);
            uint32_t readData = 0;
            IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0, &readData);
            __dmb(1u);
          }
          while ((readData & 0x4000008) != 0 && v6++ < 9);
          if ((readData & 0x4000008) != 0)
          {
            if ((dword_10003C040 & 0x100000) != 0) {
              IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reset_hw_82599", 1069, "Reset polling failed to complete.\n");
            }
            uint64_t v2 = 4294967281;
          }
          IODelay(0xC350uLL);
          if ((*(unsigned char *)(a1 + 1285) & 1) == 0) {
            break;
          }
          *(unsigned char *)(a1 + 1285) &= ~1u;
        }
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
        __dmb(1u);
        uint32_t v8 = readData;
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A8uLL, &readData);
        __dmb(1u);
        uint32_t v9 = readData;
        if ((readData & 0x70000000) != 0)
        {
          uint32_t v9 = readData & 0x8FFFFFFF;
          __dmb(2u);
          IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x42A8uLL, v9);
          uint32_t readData = 0;
          IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
          __dmb(1u);
        }
        if (!*(unsigned char *)(a1 + 1283))
        {
          *(_DWORD *)(a1 + 1268) = v8;
          *(_DWORD *)(a1 + 1276) = v9;
          *(unsigned char *)(a1 + 1283) = 1;
LABEL_41:
          (*(void (**)(uint64_t, uint64_t))(a1 + 72))(a1, a1 + 706);
          *(_DWORD *)(a1 + 1248) = 128;
          (*(void (**)(uint64_t))(a1 + 408))(a1);
          (*(void (**)(uint64_t, uint64_t))(a1 + 80))(a1, a1 + 712);
          if (!ixgbe_validate_mac_addr((unsigned __int8 *)(a1 + 712)))
          {
            unsigned __int8 v12 = *(unsigned char *)(a1 + 1248) - 1;
            *(unsigned char *)(a1 + 1272) = v12;
            (*(void (**)(uint64_t, void, uint64_t, void, uint64_t))(a1 + 352))(a1, v12, a1 + 712, 0, 0x80000000);
            (*(void (**)(uint64_t, void, uint64_t))(a1 + 400))(a1, *(unsigned __int8 *)(a1 + 1272), 0xFFFFFFFFLL);
            --*(_DWORD *)(a1 + 1248);
          }
          (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 104))(a1, a1 + 718, a1 + 720);
          return v2;
        }
        if (*(unsigned char *)(a1 + 1673) && (ixgbe_mng_enabled(a1) & 1) != 0 || *(unsigned char *)(a1 + 1954))
        {
          unsigned int v10 = *(_DWORD *)(a1 + 1268) & 0xFFFF1FFF | v14 & 0xE000;
          *(_DWORD *)(a1 + 1268) = v10;
        }
        else
        {
          unsigned int v10 = *(_DWORD *)(a1 + 1268);
        }
        if (v8 == v10 || (uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 232))(a1), !v2))
        {
          int v11 = *(unsigned __int16 *)(a1 + 1278);
          if ((v9 & 0xFFFF0000) != v11 << 16)
          {
            __dmb(2u);
            IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x42A8uLL, (v11 << 16) | (unsigned __int16)v9);
          }
          goto LABEL_41;
        }
      }
    }
  }
  return v2;
}

uint64_t ixgbe_get_media_type_82599(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_media_type_82599", 495, "ixgbe_get_media_type_82599");
  }
  int v2 = *(_DWORD *)(a1 + 1616);
  if (v2 == 2 || v2 == 9) {
    return 4;
  }
  unsigned int v5 = *(unsigned __int16 *)(a1 + 1936);
  if (v5 <= 0x1549)
  {
    uint64_t result = 5;
    uint64_t v7 = v5 - 5383;
    if (v7 > 0x23) {
      goto LABEL_19;
    }
    if (((1 << (v5 - 7)) & 0x800012000) != 0) {
      return result;
    }
    if (((1 << (v5 - 7)) & 0x400000001) != 0) {
      return 1;
    }
    if (v7 != 21)
    {
LABEL_19:
      switch(*(_WORD *)(a1 + 1936))
      {
        case 0x10F7:
        case 0x10F8:
        case 0x10FC:
          return result;
        case 0x10F9:
          uint64_t result = 6;
          break;
        case 0x10FB:
          return 1;
        default:
          return 0;
      }
      return result;
    }
    return 4;
  }
  if (*(unsigned __int16 *)(a1 + 1936) > 0x1556u)
  {
    if (v5 == 5469)
    {
      *(unsigned char *)(a1 + 1673) = 1;
      return 2;
    }
    if (v5 == 5464) {
      return 3;
    }
    int v6 = 5463;
    return v5 == v6;
  }
  if (v5 == 5450) {
    return 1;
  }
  int v6 = 5453;
  return v5 == v6;
}

uint64_t ixgbe_get_supported_physical_layer_82599(uint64_t a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
  __dmb(1u);
  unint64_t v2 = readData;
  uint32_t v8 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A8uLL, &v8);
  __dmb(1u);
  uint32_t v3 = v8;
  unsigned __int16 v7 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_supported_physical_layer_82599", 2163, "ixgbe_get_support_physical_layer_82599");
  }
  (*(void (**)(uint64_t))(a1 + 1416))(a1);
  int v4 = *(_DWORD *)(a1 + 1616);
  if (v4 == 9 || v4 == 2)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 1448))(a1, 11, 1, &v7);
    return (v7 >> 4) & 2 | (v7 >> 2) & 1 | (v7 >> 5) & 4u;
  }
  else
  {
    uint64_t result = 0;
    switch((unsigned __int16)v2 >> 13)
    {
      case 0:
      case 2:
        if ((v2 & 0x200) == 0) {
          goto LABEL_18;
        }
        uint64_t result = 1536;
        break;
      case 1:
        uint64_t result = v2 & 0x180;
        if ((v2 & 0x180) != 0)
        {
          if (result != 256)
          {
            if (result == 128) {
              uint64_t result = 128;
            }
            else {
              uint64_t result = 0;
            }
          }
        }
        else
        {
          uint64_t result = 4096;
        }
        break;
      case 3:
        if ((v3 & 0x30000) != 0) {
LABEL_18:
        }
          uint64_t result = ixgbe_get_supported_phy_sfp_layer_generic(a1);
        else {
          uint64_t result = 2048;
        }
        break;
      case 4:
      case 6:
        uint64_t v6 = (v2 >> 21) & 0x200;
        if ((v2 & 0x80000000) != 0) {
          v6 |= 0x80uLL;
        }
        uint64_t result = v6 | (v2 >> 5) & 0x800;
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t ixgbe_enable_rx_dma_82599(uint64_t a1, char a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_enable_rx_dma_82599", 2244, "ixgbe_enable_rx_dma_82599");
  }
  (*(void (**)(uint64_t))(a1 + 184))(a1);
  if (a2) {
    ixgbe_enable_rx(a1);
  }
  else {
    ixgbe_disable_rx(a1);
  }
  (*(void (**)(uint64_t))(a1 + 192))(a1);
  return 0;
}

uint64_t ixgbe_read_analog_reg8_82599(IOPCIDevice **a1, int a2, unsigned char *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_analog_reg8_82599", 2045, "ixgbe_read_analog_reg8_82599");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x14F00uLL, (a2 << 8) | 0x10000);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0xAuLL);
  uint32_t v7 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x14F00uLL, &v7);
  __dmb(1u);
  *a3 = v7;
  return 0;
}

uint64_t ixgbe_write_analog_reg8_82599(IOPCIDevice **a1, int a2, int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_analog_reg8_82599", 2069, "ixgbe_write_analog_reg8_82599");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x14F00uLL, a3 | (a2 << 8));
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &readData);
  __dmb(1u);
  IODelay(0xAuLL);
  return 0;
}

uint64_t ixgbe_start_hw_82599(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_start_hw_82599", 2091, "ixgbe_start_hw_82599");
  }
  uint64_t result = ixgbe_start_hw_generic(a1);
  if (!result)
  {
    uint64_t result = ixgbe_start_hw_gen2(a1);
    if (!result)
    {
      *(unsigned char *)(a1 + 1284) = 1;
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_verify_fw_version_82599", 2281, "ixgbe_verify_fw_version_82599");
      }
      if (*(_DWORD *)(a1 + 1640) != 1) {
        return 0;
      }
      int v4 = 0;
      unsigned __int16 v3 = 0;
      if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(a1 + 1728))(a1, 15, (char *)&v4 + 2))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n", "ixgbe_verify_fw_version_82599", 2292, 15);
        }
        return 4294967272;
      }
      if ((unsigned __int16)(HIWORD(v4) + 1) < 2u) {
        return 4294967272;
      }
      if ((*(unsigned int (**)(uint64_t, void, int *))(a1 + 1728))(a1, (unsigned __int16)(HIWORD(v4) + 4), &v4))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n", "ixgbe_verify_fw_version_82599", 2306, HIWORD(v4) + 4);
        }
        return 4294967272;
      }
      if ((unsigned __int16)(v4 + 1) < 2u) {
        return 4294967272;
      }
      if ((*(unsigned int (**)(uint64_t, void, unsigned __int16 *))(a1 + 1728))(a1, (unsigned __int16)(v4 + 7), &v3))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): eeprom read at offset %d failed\n", "ixgbe_verify_fw_version_82599", 2318, (unsigned __int16)v4 + 7);
        }
        return 4294967272;
      }
      if (v3 <= 5u) {
        return 4294967272;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

uint64_t ixgbe_get_link_capabilities_82599(uint64_t a1, int *a2, unsigned char *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_get_link_capabilities_82599", 388, "ixgbe_get_link_capabilities_82599");
  }
  if ((*(_DWORD *)(a1 + 1628) - 9) <= 5)
  {
    *a2 = 32;
    BOOL v6 = 1;
LABEL_20:
    *a3 = v6;
    return 0;
  }
  if (*(unsigned char *)(a1 + 1283))
  {
    uint32_t v7 = *(_DWORD *)(a1 + 1268);
  }
  else
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
    __dmb(1u);
    uint32_t v7 = readData;
  }
  int v8 = 32;
  char v9 = 0;
  switch((unsigned __int16)v7 >> 13)
  {
    case 1:
    case 3:
      char v9 = 0;
      int v8 = 128;
      break;
    case 2:
      goto LABEL_17;
    case 4:
    case 6:
      int v10 = (v7 >> 9) & 0x80;
      if ((v7 & 0x80000000) != 0) {
        int v10 = 128;
      }
      goto LABEL_16;
    case 5:
      char v9 = 0;
      int v8 = 40;
      break;
    case 7:
      if ((v7 & 0x80010000) != 0) {
        int v10 = 136;
      }
      else {
        int v10 = 8;
      }
LABEL_16:
      int v8 = (v7 >> 25) & 0x20 | v10;
LABEL_17:
      char v9 = 1;
      break;
    default:
      break;
  }
  *a2 = v8;
  *a3 = v9;
  if (*(unsigned char *)(a1 + 1673))
  {
    *a2 = v8 | 0xA0;
    BOOL v6 = *(_DWORD *)(a1 + 1640) != 3;
    goto LABEL_20;
  }
  return 0;
}

uint64_t sub_10002C414(uint64_t a1, unsigned int a2, _WORD *a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_eeprom_82599", 2424, "ixgbe_read_eeprom_82599");
  }
  if ((a2 & 0xC000) != 0 || *(_DWORD *)(a1 + 1784) != 1)
  {
    return ixgbe_read_eeprom_bit_bang_generic(a1, a2, (uint64_t)a3);
  }
  else
  {
    return ixgbe_read_eerd_generic(a1, a2, a3);
  }
}

uint64_t sub_10002C4DC(uint64_t a1, unsigned int a2, unsigned int a3, _WORD *a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_eeprom_buffer_82599", 2390, "ixgbe_read_eeprom_buffer_82599");
  }
  if (*(_DWORD *)(a1 + 1784) == 1 && (int)(a2 + a3 - 1) < 0x4000)
  {
    return ixgbe_read_eerd_buffer_generic(a1, a2, a3, a4);
  }
  else
  {
    return ixgbe_read_eeprom_buffer_bit_bang_generic(a1, a2, a3, (uint64_t)a4);
  }
}

void ixgbe_stop_mac_link_on_d3_82599(uint64_t a1)
{
  __int16 v2 = 0;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_stop_mac_link_on_d3_82599", 558, "ixgbe_stop_mac_link_on_d3_82599");
  }
  ixgbe_read_eeprom(a1);
  ixgbe_mng_present(a1);
}

uint64_t ixgbe_start_mac_link_82599(uint64_t a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_start_mac_link_82599", 586, "ixgbe_start_mac_link_82599");
  }
  if (!ixgbe_verify_lesm_fw_enabled_82599(a1))
  {
    ixgbe_reset_pipeline_82599((IOPCIDevice **)a1);
    if (!a2) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 200))(a1, 8);
  if (!v4)
  {
    ixgbe_reset_pipeline_82599((IOPCIDevice **)a1);
    (*(void (**)(uint64_t, uint64_t))(a1 + 208))(a1, 8);
    if (!a2) {
      goto LABEL_17;
    }
LABEL_8:
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A0uLL, &readData);
    __dmb(1u);
    uint32_t v5 = readData & 0xE000;
    if (v5 != 0x8000 && v5 != 57344)
    {
      uint64_t v4 = 0;
      if (v5 != 49152) {
        goto LABEL_18;
      }
    }
    int v6 = 45;
    while (1)
    {
      uint32_t v8 = 0;
      IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x42A4uLL, &v8);
      __dmb(1u);
      if ((v8 & 0x80000000) != 0) {
        break;
      }
      IODelay(0x186A0uLL);
      if (!--v6)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_start_mac_link_82599", 625, "Autoneg did not complete.\n");
        }
        uint64_t v4 = 4294967282;
        goto LABEL_18;
      }
    }
LABEL_17:
    uint64_t v4 = 0;
LABEL_18:
    IODelay(0xC350uLL);
  }
  return v4;
}

uint64_t ixgbe_reinit_fdir_tables_82599(IOPCIDevice **a1)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0xEE00uLL, &readData);
  __dmb(1u);
  uint32_t v2 = readData;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reinit_fdir_tables_82599", 1203, "ixgbe_reinit_fdir_tables_82599");
  }
  uint64_t v3 = sub_10002CB18(a1, &readData);
  if (v3)
  {
    uint64_t v4 = v3;
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reinit_fdir_tables_82599", 1211, "Flow Director previous command did not complete, aborting table re-initialization.\n");
    }
  }
  else
  {
    uint32_t v5 = v2 & 0xFFFFFFF7;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE38uLL, 0);
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v10);
    __dmb(1u);
    __dmb(2u);
    int v6 = *a1;
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(v6, 0, 0xEE2CuLL, &v10);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v6, 0, 0xEE2CuLL, v10 | 0x100);
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v10);
    __dmb(1u);
    __dmb(2u);
    uint32_t v7 = *a1;
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(v7, 0, 0xEE2CuLL, &v10);
    __dmb(1u);
    IOPCIDevice::MemoryWrite32(v7, 0, 0xEE2CuLL, v10 & 0xFFFFFEFF);
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v10);
    __dmb(1u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE28uLL, 0);
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v10);
    __dmb(1u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE00uLL, v5);
    uint32_t v10 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v10);
    __dmb(1u);
    int v8 = 10;
    do
    {
      uint32_t v10 = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, 0xEE00uLL, &v10);
      __dmb(1u);
      if ((v10 & 8) != 0)
      {
        uint32_t v10 = 0;
        IOPCIDevice::MemoryRead32(*a1, 0, 0xEE50uLL, &v10);
        __dmb(1u);
        uint32_t v10 = 0;
        IOPCIDevice::MemoryRead32(*a1, 0, 0xEE54uLL, &v10);
        __dmb(1u);
        uint32_t v10 = 0;
        IOPCIDevice::MemoryRead32(*a1, 0, 0xEE58uLL, &v10);
        __dmb(1u);
        uint32_t v10 = 0;
        IOPCIDevice::MemoryRead32(*a1, 0, 0xEE5CuLL, &v10);
        __dmb(1u);
        uint32_t v10 = 0;
        IOPCIDevice::MemoryRead32(*a1, 0, 0xEE4CuLL, &v10);
        uint64_t v4 = 0;
        __dmb(1u);
        return v4;
      }
      IODelay(0x3E8uLL);
      --v8;
    }
    while (v8);
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_reinit_fdir_tables_82599", 1250, "Flow Director Signature poll time exceeded!\n");
    }
    return 4294967273;
  }
  return v4;
}

uint64_t sub_10002CB18(IOPCIDevice **a1, uint32_t *a2)
{
  int v4 = 10;
  while (1)
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0xEE2CuLL, &readData);
    __dmb(1u);
    char v5 = readData;
    *a2 = readData;
    if ((v5 & 3) == 0) {
      break;
    }
    IODelay(0xAuLL);
    if (!--v4) {
      return 4294967258;
    }
  }
  return 0;
}

uint64_t ixgbe_init_fdir_signature_82599(IOPCIDevice **a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_fdir_signature_82599", 1313, "ixgbe_init_fdir_signature_82599");
  }
  sub_10002CC08(a1, a2 | 0x4A060000);
  return 0;
}

void sub_10002CC08(IOPCIDevice **a1, uint32_t a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_enable_82599", 1273, "ixgbe_fdir_enable_82599");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE68uLL, 0x3DAD14E2u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE6CuLL, 0x174D3614u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE00uLL, a2);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &readData);
  __dmb(1u);
  int v4 = 10;
  while (1)
  {
    uint32_t v5 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 0xEE00uLL, &v5);
    __dmb(1u);
    if ((v5 & 8) != 0) {
      break;
    }
    IODelay(0x3E8uLL);
    if (!--v4)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_enable_82599", 1302, "Flow Director poll time exceeded!\n");
      }
      return;
    }
  }
}

uint64_t ixgbe_init_fdir_perfect_82599(IOPCIDevice **a1, int a2, int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_init_fdir_perfect_82599", 1342, "ixgbe_init_fdir_perfect_82599");
  }
  if (a3) {
    int v6 = 1246134064;
  }
  else {
    int v6 = 1241939760;
  }
  sub_10002CC08(a1, v6 | a2);
  return 0;
}

void ixgbe_set_fdir_drop_queue_82599(uint64_t a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_set_fdir_drop_queue_82599", 1379, "ixgbe_set_fdir_drop_queue_82599");
  }
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0xEE00uLL, &readData);
  __dmb(1u);
  if ((*(_DWORD *)(a1 + 696) - 6) >= 3) {
    uint32_t v4 = readData & 0xFFFF80F7 | (a2 << 8);
  }
  else {
    uint32_t v4 = readData & 0xFFFF80F7 | (a2 << 8) | 0x8000;
  }
  __dmb(2u);
  uint32_t v5 = *(IOPCIDevice **)a1;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(v5, 0, 0xEE2CuLL, &readData);
  __dmb(1u);
  IOPCIDevice::MemoryWrite32(v5, 0, 0xEE2CuLL, readData | 0x100);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  __dmb(2u);
  int v6 = *(IOPCIDevice **)a1;
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(v6, 0, 0xEE2CuLL, &readData);
  __dmb(1u);
  IOPCIDevice::MemoryWrite32(v6, 0, 0xEE2CuLL, readData & 0xFFFFFEFF);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 8uLL, &readData);
  __dmb(1u);
  sub_10002CC08((IOPCIDevice **)a1, v4);
}

uint64_t ixgbe_atr_compute_sig_hash_82599(unsigned int a1, unsigned int a2)
{
  unsigned int v2 = bswap32(a1);
  unsigned int v3 = bswap32(a2);
  int v4 = __ROR4__(v3, 16);
  unsigned int v5 = v2 ^ HIWORD(v2) ^ v3;
  unsigned int v6 = (v2 << 16) ^ v4 ^ v2;
  int v7 = (v5 >> 3) ^ (v5 >> 2) ^ (v5 >> 8) ^ (v5 >> 10) ^ (v5 >> 12) ^ (v6 >> 10) ^ (v6 >> 12) ^ v5;
  return ((v5 << 7) ^ (v5 << 10) ^ (v6 << 12) ^ (v6 << 14) ^ (v6 << 7) ^ (8 * v6) ^ (v7 << 16)) & 0x7FFF0000 | ((v5 >> 7) ^ (v5 >> 5) ^ (v5 >> 11) ^ (v5 >> 13) ^ (v6 >> 5) ^ (v6 >> 1) ^ (v6 >> 6) ^ (v6 >> 7) ^ v7) & 0x7FFF;
}

void ixgbe_fdir_add_signature_filter_82599(IOPCIDevice **a1, unsigned int a2, unsigned int a3, int a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_add_signature_filter_82599", 1515, "ixgbe_fdir_add_signature_filter_82599");
  }
  unsigned int v8 = (a2 >> 8) & 0xF;
  if (v8 <= 7 && ((1 << v8) & 0xEE) != 0)
  {
    int v9 = (a4 << 16) | (32 * v8);
    if ((a2 & 0x1000) != 0) {
      int v10 = 8423433;
    }
    else {
      int v10 = 34825;
    }
    uint32_t v11 = v9 | v10;
    uint32_t v12 = ixgbe_atr_compute_sig_hash_82599(a2, a3);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE28uLL, v12);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE2CuLL, v11);
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Tx Queue=%x hash=%x\n\n");
    }
  }
  else if ((dword_10003C040 & 0x100000) != 0)
  {
    IOLog("ixgbe:%s(%d): %s\n");
  }
}

int8x8_t ixgbe_atr_compute_perfect_hash_82599(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = 0; i != 56; i += 4)
    *(_DWORD *)(a1 + i) &= *(_DWORD *)(a2 + i);
  unsigned int v3 = 0;
  for (uint64_t j = 4; j != 56; j += 4)
    v3 ^= *(_DWORD *)(a1 + j);
  unsigned int v5 = bswap32(*(_DWORD *)a1);
  unsigned int v6 = bswap32(v3);
  unsigned long long v7 = v5 ^ HIWORD(v5) ^ (unsigned __int128)v6;
  uint32x4_t v8 = (uint32x4_t)vdupq_n_s32((v5 << 16) ^ __ROR4__(v6, 16) ^ v5);
  uint32x4_t v9 = (uint32x4_t)vdupq_n_s32(v7);
  int32x4_t v10 = (int32x4_t)xmmword_1000325B0;
  int v11 = -4;
  int8x16_t v12 = (int8x16_t)vdupq_n_s32(0x3DAD14E2u);
  v13.i64[0] = 0x100000001;
  v13.i64[1] = 0x100000001;
  v14.i64[0] = 0x1000000010000;
  v14.i64[1] = 0x1000000010000;
  int8x16_t v15 = (int8x16_t)vdupq_n_s32(0x3DAD0000u);
  v16.i64[0] = 0x400000004;
  v16.i64[1] = 0x400000004;
  do
  {
    int8x16_t v17 = (int8x16_t)v7;
    uint32x4_t v18 = (uint32x4_t)vnegq_s32(v10);
    unsigned long long v7 = (unsigned __int128)veorq_s8(veorq_s8(vbicq_s8((int8x16_t)vshlq_u32(v9, v18), (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vshlq_u32(v14, (uint32x4_t)v10), v15))), vbicq_s8((int8x16_t)vshlq_u32(v8, v18), (int8x16_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vshlq_u32(v13, (uint32x4_t)v10), v12)))), (int8x16_t)v7);
    int32x4_t v10 = vaddq_s32(v10, v16);
    v11 += 4;
  }
  while (v11 != 12);
  v19.i64[0] = 0xF0000000FLL;
  v19.i64[1] = 0xF0000000FLL;
  int8x16_t v20 = vbslq_s8((int8x16_t)vcgtq_u32(v19, (uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(0xCu), (int8x16_t)xmmword_1000325C0)), (int8x16_t)v7, v17);
  int8x8_t result = veor_s8(*(int8x8_t *)v20.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v20, v20, 8uLL));
  *(_WORD *)(a1 + 54) = (result.i16[0] ^ result.i16[2]) & 0x1FFF;
  return result;
}

uint64_t ixgbe_fdir_set_input_mask_82599(uint64_t a1, uint64_t a2, int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1672, "ixgbe_fdir_set_atr_input_mask_82599");
  }
  if (*(_WORD *)(a2 + 54) && (dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1686, " bucket hash should always be 0 in mask\n");
  }
  if ((*(unsigned char *)a2 & 0x7F) == 0x7F)
  {
    uint32_t v6 = 32;
  }
  else
  {
    if ((*(unsigned char *)a2 & 0x7F) != 0)
    {
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1695, " Error on vm pool mask\n");
      }
      return 4294967292;
    }
    uint32_t v6 = 36;
  }
  if ((*(unsigned char *)(a2 + 1) & 3) == 3)
  {
LABEL_21:
    signed int v7 = bswap32(*(_WORD *)(a2 + 2) & 0xFFEF) >> 16;
    if (v7 >= 57344)
    {
      if (v7 == 57344)
      {
        v6 |= 1u;
      }
      else if (v7 != 61439)
      {
        goto LABEL_27;
      }
    }
    else
    {
      if (v7)
      {
        if (v7 != 4095)
        {
LABEL_27:
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1731, " Error on VLAN mask\n");
          }
          return 4294967292;
        }
      }
      else
      {
        v6 |= 1u;
      }
      v6 |= 2u;
    }
    if (*(unsigned __int16 *)(a2 + 52) != 0xFFFF)
    {
      if (*(_WORD *)(a2 + 52))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1743, " Error on flexible byte mask\n");
        }
        return 4294967292;
      }
      v6 |= 0x10u;
    }
    if (a3)
    {
      if (*(unsigned __int8 *)(a2 + 36) == 255)
      {
        unsigned int v8 = -64497;
      }
      else
      {
        if (*(unsigned char *)(a2 + 36))
        {
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1759, " Error on inner_mac byte mask\n");
          }
          return 4294967292;
        }
        unsigned int v8 = -63489;
      }
      int v18 = *(_DWORD *)(a2 + 44);
      if (v18 != -1)
      {
        if (v18 == 0xFFFFFF)
        {
          v8 |= 0x1000u;
        }
        else
        {
          if (v18)
          {
            if ((dword_10003C040 & 0x100000) != 0) {
              IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1774, " Error on TNI/VNI byte mask\n");
            }
            return 4294967292;
          }
          v8 |= 0xF000u;
        }
      }
      if (*(unsigned __int16 *)(a2 + 42) != 0xFFFF)
      {
        if (*(_WORD *)(a2 + 42))
        {
          if ((dword_10003C040 & 0x100000) != 0) {
            IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1785, " Error on tunnel type byte mask\n");
          }
          return 4294967292;
        }
        v8 |= 0x800u;
      }
      int v19 = v6 | 0x40;
      __dmb(2u);
      unsigned int v20 = bswap32(v8);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE74uLL, HIBYTE(v20) & 0xFF00FFFF | (v20 << 24) | (v20 >> 8) & 0xFF00 | (BYTE1(v20) << 16));
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE44uLL, 0xFFFFFFFF);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE48uLL, 0xFFFFFFFF);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE3CuLL, 0xFFFFFFFF);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE40uLL, 0xFFFFFFFF);
      if ((*(_DWORD *)(a1 + 696) - 6) <= 2)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE78uLL, 0xFFFFFFFF);
      }
      __dmb(2u);
      uint32x4_t v14 = *(IOPCIDevice **)a1;
      uint64_t v17 = 61040;
      uint32_t v16 = v19;
    }
    else
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE70uLL, v6);
      unsigned int v9 = bswap32(*(unsigned __int16 *)(a2 + 50) | (*(unsigned __int16 *)(a2 + 48) << 16));
      unsigned int v10 = (2 * v9) & 0xAAAAAAAA | (v9 >> 1) & 0x55555555;
      unsigned int v11 = (4 * v10) & 0xCCCCCCCC | (v10 >> 2) & 0x33333333;
      __dmb(2u);
      uint32_t v12 = ~__ROR4__(bswap32((16 * v11) & 0xF0F0F0F0 | (v11 >> 4) & 0xF0F0F0F), 16);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE44uLL, v12);
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE48uLL, v12);
      if ((*(_DWORD *)(a1 + 696) - 6) <= 2)
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE78uLL, v12);
      }
      __dmb(2u);
      unsigned int v13 = bswap32(~*(_DWORD *)(a2 + 20));
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0xEE40uLL, HIBYTE(v13) & 0xFF00FFFF | (v13 << 24) | (v13 >> 8) & 0xFF00 | (BYTE1(v13) << 16));
      __dmb(2u);
      uint32x4_t v14 = *(IOPCIDevice **)a1;
      unsigned int v15 = bswap32(~*(_DWORD *)(a2 + 4));
      uint32_t v16 = HIBYTE(v15) & 0xFF00FFFF | (v15 << 24) | (v15 >> 8) & 0xFF00 | (BYTE1(v15) << 16);
      uint64_t v17 = 60988;
    }
    IOPCIDevice::MemoryWrite32(v14, 0, v17, v16);
    return 0;
  }
  if ((*(unsigned char *)(a2 + 1) & 3) != 0)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1710, " Error on flow type mask\n");
    }
    return 4294967292;
  }
  if (!*(_WORD *)(a2 + 50) && !*(_WORD *)(a2 + 48))
  {
    v6 |= 8u;
    goto LABEL_21;
  }
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_set_input_mask_82599", 1704, " Error on src/dst port mask\n");
  }
  return 4294967292;
}

uint64_t ixgbe_fdir_write_perfect_filter_82599(IOPCIDevice **a1, unsigned __int8 *a2, int a3, int a4, int a5)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_write_perfect_filter_82599", 1850, "ixgbe_fdir_write_perfect_filter_82599");
  }
  if ((a5 & 1) == 0)
  {
    __dmb(2u);
    unsigned int v10 = bswap32(*((_DWORD *)a2 + 5));
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE0CuLL, HIBYTE(v10) & 0xFF00FFFF | (v10 << 24) | (v10 >> 8) & 0xFF00 | (BYTE1(v10) << 16));
    __dmb(2u);
    unsigned int v11 = bswap32(*((_DWORD *)a2 + 6));
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE10uLL, HIBYTE(v11) & 0xFF00FFFF | (v11 << 24) | (v11 >> 8) & 0xFF00 | (BYTE1(v11) << 16));
    __dmb(2u);
    unsigned int v12 = bswap32(*((_DWORD *)a2 + 7));
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE14uLL, HIBYTE(v12) & 0xFF00FFFF | (v12 << 24) | (v12 >> 8) & 0xFF00 | (BYTE1(v12) << 16));
    __dmb(2u);
    unsigned int v13 = bswap32(*((_DWORD *)a2 + 5));
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE18uLL, HIBYTE(v13) & 0xFF00FFFF | (v13 << 24) | (v13 >> 8) & 0xFF00 | (BYTE1(v13) << 16));
    __dmb(2u);
    unsigned int v14 = bswap32(*((_DWORD *)a2 + 1));
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE1CuLL, HIBYTE(v14) & 0xFF00FFFF | (v14 << 24) | (v14 >> 8) & 0xFF00 | (BYTE1(v14) << 16));
    uint32_t v15 = bswap32(*((unsigned __int16 *)a2 + 25) | (*((unsigned __int16 *)a2 + 24) << 16));
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE20uLL, v15);
  }
  HIDWORD(v16) = *((unsigned __int16 *)a2 + 26);
  LODWORD(v16) = bswap32(*((unsigned __int16 *)a2 + 1));
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE24uLL, v16 >> 16);
  if (a5)
  {
    unsigned int v17 = *((_DWORD *)a2 + 9);
    unsigned int v18 = a2[40] | ((*((_WORD *)a2 + 21) != 0) << 31) | (a2[41] << 8);
    __dmb(2u);
    unsigned int v19 = bswap32(v17);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE0CuLL, HIBYTE(v19) & 0xFF00FFFF | (v19 << 24) | (v19 >> 8) & 0xFF00 | (BYTE1(v19) << 16));
    __dmb(2u);
    unsigned int v20 = bswap32(v18);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE10uLL, (v20 >> 8) & 0xFF00 | HIBYTE(v20) | ((v20 >> 7) << 31));
    __dmb(2u);
    unsigned int v21 = bswap32(*((_DWORD *)a2 + 11));
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE14uLL, HIBYTE(v21) & 0xFF00FFFF | (v21 << 24) | (v21 >> 8) & 0xFF00 | (BYTE1(v21) << 16));
  }
  uint32_t v22 = *((unsigned __int16 *)a2 + 27) | (a3 << 16);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE28uLL, v22);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &readData);
  __dmb(1u);
  if (a4 == 127) {
    int v23 = 35337;
  }
  else {
    int v23 = 34825;
  }
  uint32_t v24 = (a4 << 16) | (32 * a2[1]) | v23 & 0xFF7FFFFF | ((((a2[1] & 0x10) >> 4) & 1) << 23) | (*a2 << 24);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE2CuLL, v24);
  uint64_t v25 = sub_10002CB18(a1, &v28);
  if (v25 && (dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_write_perfect_filter_82599", 1923, "Flow Director command did not complete!\n");
  }
  return v25;
}

uint64_t ixgbe_fdir_erase_perfect_filter_82599(IOPCIDevice **a1, uint64_t a2, int a3)
{
  uint32_t v9 = 0;
  uint32_t v4 = *(unsigned __int16 *)(a2 + 54) | (a3 << 16);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE28uLL, v4);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &readData);
  __dmb(1u);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE2CuLL, 3u);
  uint64_t v5 = sub_10002CB18(a1, &v9);
  if (v5)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_erase_perfect_filter_82599", 1951, "Flow Director command did not complete!\n");
    }
  }
  else if ((v9 & 4) != 0)
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE28uLL, v4);
    uint32_t v7 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, 8uLL, &v7);
    __dmb(1u);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, 0xEE2CuLL, 2u);
  }
  return v5;
}

uint64_t ixgbe_fdir_add_perfect_filter_82599(IOPCIDevice **a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_add_perfect_filter_82599", 1986, "ixgbe_fdir_add_perfect_filter_82599");
  }
  unsigned int v12 = *(unsigned __int8 *)(a2 + 1);
  if (v12 > 0x13) {
    goto LABEL_20;
  }
  if (((1 << v12) & 0x60006) != 0)
  {
LABEL_11:
    *(unsigned char *)(a3 + 1) = 7;
    goto LABEL_12;
  }
  if (((1 << v12) & 0x10001) == 0)
  {
    if (((1 << v12) & 0x80008) != 0)
    {
      if (*(_WORD *)(a2 + 50) || *(_WORD *)(a2 + 48))
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_add_perfect_filter_82599", 2004, " Error on src/dst port\n");
        }
        return 4294967292;
      }
      goto LABEL_11;
    }
LABEL_20:
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_add_perfect_filter_82599", 2016, " Error on flow type input\n");
    }
    return 4294967292;
  }
  *(unsigned char *)(a3 + 1) = 4;
  if (*(_WORD *)(a2 + 50) || *(_WORD *)(a2 + 48))
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_fdir_add_perfect_filter_82599", 1997, " Error on src/dst port\n");
    }
    return 4294967292;
  }
LABEL_12:
  uint64_t result = ixgbe_fdir_set_input_mask_82599((uint64_t)a1, a3, a6);
  if (!result)
  {
    ixgbe_atr_compute_perfect_hash_82599(a2, a3);
    return ixgbe_fdir_write_perfect_filter_82599(a1, (unsigned __int8 *)a2, a4, a5, a6);
  }
  return result;
}

uint64_t ixgbe_dcb_calculate_tc_credits(unsigned __int8 *a1, unsigned __int16 *a2, unsigned __int16 *a3, int a4)
{
  uint64_t v4 = 0;
  if (a4 >= 0) {
    int v5 = a4;
  }
  else {
    int v5 = a4 + 1;
  }
  int v6 = (v5 >> 1) + 63;
  int v7 = 100;
  do
  {
    int v8 = a1[v4];
    if (v7 > v8 && v8 != 0) {
      int v7 = a1[v4];
    }
    ++v4;
  }
  while (v4 != 8);
  uint64_t v10 = 0;
  int v11 = v6 / 64;
  int v12 = v11 / v7 + 1;
  do
  {
    int v13 = v12 * a1[v10];
    if (v13 >= 0xC8) {
      int v13 = 200;
    }
    if (v13 <= v11) {
      LOWORD(v13) = v11;
    }
    a2[v10] = v13;
    if (a1[v10]) {
      unsigned __int16 v14 = 4 * a1[v10];
    }
    else {
      unsigned __int16 v14 = v11;
    }
    a3[v10++] = v14;
  }
  while (v10 != 8);
  return 0;
}

uint64_t ixgbe_dcb_calculate_tc_credits_cee(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (!a2) {
    return 4294967292;
  }
  uint64_t v4 = 0;
  unsigned __int16 v5 = 100;
  do
  {
    unsigned int v6 = *(unsigned __int8 *)(a2 + 12 * a4 + v4 + 1)
       * *(unsigned __int8 *)(a2 + 8 * a4 + *(unsigned __int8 *)(a2 + 12 * a4 + v4) + 266);
    if ((5243 * (v6 >> 2)) >> 17 < v5 && v6 > 0x63) {
      unsigned __int16 v5 = (unsigned __int16)v6 / 0x64u;
    }
    v4 += 32;
  }
  while (v4 != 256);
  uint64_t v8 = 0;
  unsigned int v9 = ((a3 >> 1) + 63) >> 6;
  unsigned int v10 = v9 / v5 + 1;
  uint64_t v11 = a2 + 12 * a4;
  do
  {
    uint64_t v12 = v11 + v8;
    int v13 = *(unsigned __int8 *)(v11 + v8 + 1);
    unsigned int v14 = v13 * *(unsigned __int8 *)(a2 + 8 * a4 + *(unsigned __int8 *)(v11 + v8) + 266);
    BOOL v15 = v14 >= 0x64 || v13 == 0;
    unsigned int v16 = (5243 * (v14 >> 2)) >> 17;
    if (!v15) {
      unsigned int v16 = 1;
    }
    *(unsigned char *)(v12 + 2) = v16;
    unsigned int v17 = v10 * v16;
    if (v10 * v16 >= 0xC8) {
      unsigned int v17 = 200;
    }
    if (v17 <= v9) {
      LOWORD(v17) = v9;
    }
    *(_WORD *)(v12 + 4) = v17;
    int v18 = 4 * v16;
    if (4 * v16 <= v9) {
      int v18 = v9;
    }
    if (!a4)
    {
      if ((v18 - 1) <= 0x1FF && *(_DWORD *)(a1 + 696) == 1) {
        LOWORD(v18) = 513;
      }
      *(_WORD *)(a2 + 28 + v8) = v18;
    }
    *(_WORD *)(v11 + v8 + 6) = v18;
    v8 += 32;
  }
  while (v8 != 256);
  return 0;
}

uint64_t ixgbe_dcb_unpack_pfc_cee(uint64_t result, uint64_t a2, unsigned char *a3)
{
  int v3 = 0;
  uint64_t v4 = 0;
  *a3 = 0;
  do
  {
    if (*(_DWORD *)(result + 32 * *(unsigned __int8 *)(a2 + v4) + 24))
    {
      v3 |= 1 << v4;
      *a3 = v3;
    }
    ++v4;
  }
  while (v4 != 8);
  return result;
}

uint64_t ixgbe_dcb_unpack_refill_cee(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = (__int16 *)(result + 12 * a2 + 4);
  do
  {
    __int16 v5 = *v4;
    v4 += 16;
    *(_WORD *)(a3 + v3) = v5;
    v3 += 2;
  }
  while (v3 != 16);
  return result;
}

uint64_t ixgbe_dcb_unpack_max_cee(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = (__int16 *)(result + 28);
  do
  {
    __int16 v4 = *v3;
    v3 += 16;
    *(_WORD *)(a2 + v2) = v4;
    v2 += 2;
  }
  while (v2 != 16);
  return result;
}

uint64_t ixgbe_dcb_unpack_bwgid_cee(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  __int16 v4 = (char *)(result + 12 * a2);
  do
  {
    char v5 = *v4;
    v4 += 32;
    *(unsigned char *)(a3 + v3++) = v5;
  }
  while (v3 != 8);
  return result;
}

uint64_t ixgbe_dcb_unpack_tsa_cee(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  __int16 v4 = (int *)(result + 12 * a2 + 8);
  do
  {
    int v5 = *v4;
    v4 += 8;
    *(unsigned char *)(a3 + v3++) = v5;
  }
  while (v3 != 8);
  return result;
}

uint64_t ixgbe_dcb_get_tc_from_up(uint64_t a1, int a2, char a3)
{
  char v3 = *(unsigned char *)(a1 + 264);
  if (v3)
  {
    __int16 v4 = (unsigned __int8 *)(32 * (v3 - 1) + 12 * a2 + a1 + 3);
    for (unsigned __int8 i = v3 - 1; i; --i)
    {
      unsigned __int8 v6 = i;
      int v7 = *v4;
      v4 -= 32;
      if (((1 << a3) & v7) != 0) {
        return v6;
      }
    }
  }
  return 0;
}

uint64_t ixgbe_dcb_unpack_map_cee(uint64_t result, int a2, uint64_t a3)
{
  for (uint64_t i = 0; i != 8; ++i)
  {
    char v4 = *(unsigned char *)(result + 264);
    if (v4)
    {
      int v5 = (unsigned __int8 *)(result + 12 * a2 + 3 + 32 * (v4 - 1));
      char v6 = v4 - 1;
      while (v6)
      {
        char v7 = v6;
        int v8 = *v5;
        v5 -= 32;
        --v6;
        if (((1 << i) & v8) != 0) {
          goto LABEL_8;
        }
      }
    }
    char v7 = 0;
LABEL_8:
    *(unsigned char *)(a3 + i) = v7;
  }
  return result;
}

uint64_t ixgbe_dcb_check_config_cee(uint64_t a1)
{
  unsigned __int8 v1 = 0;
  v18[0] = 0;
  v18[1] = 0;
  v17[0] = 0;
  v17[1] = 0;
  do
  {
    uint64_t v2 = 0;
    char v3 = v1;
    uint64_t v4 = a1 + 12 * v1;
    do
    {
      uint64_t v5 = v4 + v2;
      unint64_t v6 = *(unsigned __int8 *)(v4 + v2);
      if (v6 > 7)
      {
LABEL_25:
        uint64_t v14 = 4294967292;
        goto LABEL_26;
      }
      int v7 = *(unsigned __int8 *)(v5 + 1);
      if (*(_DWORD *)(v5 + 8) == 2)
      {
        *((unsigned char *)&v17[v1] + v6) = 1;
        if (v7) {
          goto LABEL_25;
        }
      }
      else if (!*(unsigned char *)(v5 + 1))
      {
        goto LABEL_25;
      }
      int v8 = &v18[v1];
      *((unsigned char *)v8 + v6) += v7;
      v2 += 32;
    }
    while (v2 != 256);
    uint64_t v9 = 0;
    char v10 = 0;
    do
    {
      int v11 = *((unsigned __int8 *)v8 + v9);
      if (*((unsigned char *)&v17[v1] + v9))
      {
        if (*((unsigned char *)v8 + v9)) {
          goto LABEL_25;
        }
      }
      else if (v11 != 100 && v11 != 0)
      {
        goto LABEL_25;
      }
      v10 += *(unsigned char *)(a1 + 266 + 8 * v1 + v9++);
    }
    while (v9 != 8);
    unsigned __int8 v13 = v1 ^ 1;
    unsigned __int8 v1 = 1;
  }
  while (((v10 == 100) & v13) != 0);
  if (v10 == 100) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = 4294967292;
  }
  if (v10 == 100) {
    char v3 = 2;
  }
LABEL_26:
  if ((dword_10003C040 & 0x100000) != 0)
  {
    if (v3) {
      BOOL v15 = "Rx";
    }
    else {
      BOOL v15 = "Tx";
    }
    IOLog("ixgbe:%s(%d): DCB error code %d while checking %s settings.\n\n", "ixgbe_dcb_check_config_cee", 350, v14, v15);
  }
  return v14;
}

uint64_t ixgbe_dcb_get_tc_stats(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 696);
  if (v3 > 8) {
    return 0x7FFFFFFFLL;
  }
  if (((1 << v3) & 0x1D4) != 0) {
    return ixgbe_dcb_get_tc_stats_82599((IOPCIDevice **)a1, a2, a3);
  }
  if (v3 == 1) {
    return ixgbe_dcb_get_tc_stats_82598((IOPCIDevice **)a1, a2, a3);
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_dcb_get_pfc_stats(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 696);
  if (v3 > 8) {
    return 0x7FFFFFFFLL;
  }
  if (((1 << v3) & 0x1D4) != 0) {
    return ixgbe_dcb_get_pfc_stats_82599((IOPCIDevice **)a1, a2, a3);
  }
  if (v3 == 1) {
    return ixgbe_dcb_get_pfc_stats_82598((IOPCIDevice **)a1, a2, a3);
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_dcb_config_rx_arbiter_cee(uint64_t a1, unsigned char *a2)
{
  uint64_t v2 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v24 = 0;
  v23[0] = 0;
  v23[1] = 0;
  unsigned int v3 = a2 + 68;
  v22[0] = 0;
  v22[1] = 0;
  do
  {
    LOWORD(v4) = *(v3 - 32);
    WORD1(v4) = *(v3 - 16);
    WORD2(v4) = *v3;
    HIWORD(v4) = v3[16];
    v23[v2] = v4;
    v3 += 64;
    ++v2;
  }
  while (v2 != 2);
  uint64_t v5 = 0;
  unint64_t v6 = a2 + 92;
  do
  {
    LOWORD(v7) = *(v6 - 32);
    WORD1(v7) = *(v6 - 16);
    WORD2(v7) = *v6;
    HIWORD(v7) = v6[16];
    v22[v5] = v7;
    v6 += 64;
    ++v5;
  }
  while (v5 != 2);
  uint64_t v8 = 0;
  LOBYTE(v9) = *a2;
  BYTE1(v9) = a2[32];
  BYTE2(v9) = a2[64];
  BYTE3(v9) = a2[96];
  BYTE4(v9) = a2[128];
  BYTE5(v9) = a2[160];
  BYTE6(v9) = a2[192];
  HIBYTE(v9) = a2[224];
  uint64_t v25 = v9;
  char v10 = (int *)(a2 + 8);
  do
  {
    int v11 = *v10;
    v10 += 8;
    *((unsigned char *)&v26 + v8++) = v11;
  }
  while (v8 != 8);
  uint64_t v12 = 0;
  int v13 = a2[264];
  do
  {
    if (v13)
    {
      char v14 = v13 - 1;
      BOOL v15 = &a2[32 * (v13 - 1) + 3];
      while (v14)
      {
        char v16 = v14;
        int v17 = *v15;
        v15 -= 32;
        --v14;
        if (((1 << v12) & v17) != 0) {
          goto LABEL_14;
        }
      }
    }
    char v16 = 0;
LABEL_14:
    *((unsigned char *)&v24 + v12++) = v16;
  }
  while (v12 != 8);
  unsigned int v18 = *(_DWORD *)(a1 + 696);
  uint64_t v19 = 0x7FFFFFFFLL;
  if (v18 <= 8)
  {
    if (((1 << v18) & 0x1D4) != 0) {
      return ixgbe_dcb_config_rx_arbiter_82599((IOPCIDevice **)a1, (uint64_t)v23, (uint64_t)v22, (uint64_t)&v25, (uint64_t)&v26, (unsigned __int8 *)&v24);
    }
    if (v18 != 1) {
      return v19;
    }
    return ixgbe_dcb_config_rx_arbiter_82598((IOPCIDevice **)a1, (uint64_t)v23, (uint64_t)v22, (uint64_t)&v26);
  }
  return v19;
}

uint64_t ixgbe_dcb_config_tx_desc_arbiter_cee(uint64_t a1, unsigned char *a2)
{
  uint64_t v2 = 0;
  unsigned int v3 = a2 + 68;
  do
  {
    LOWORD(v4) = *(v3 - 32);
    WORD1(v4) = *(v3 - 16);
    WORD2(v4) = *v3;
    HIWORD(v4) = v3[16];
    *(void *)&v17[v2] = v4;
    v3 += 64;
    v2 += 4;
  }
  while (v2 != 8);
  uint64_t v5 = 0;
  unint64_t v6 = a2 + 92;
  do
  {
    LOWORD(v7) = *(v6 - 32);
    WORD1(v7) = *(v6 - 16);
    WORD2(v7) = *v6;
    HIWORD(v7) = v6[16];
    *(void *)&v16[v5] = v7;
    v6 += 64;
    v5 += 4;
  }
  while (v5 != 8);
  uint64_t v8 = 0;
  LOBYTE(v9) = *a2;
  BYTE1(v9) = a2[32];
  BYTE2(v9) = a2[64];
  BYTE3(v9) = a2[96];
  BYTE4(v9) = a2[128];
  BYTE5(v9) = a2[160];
  BYTE6(v9) = a2[192];
  HIBYTE(v9) = a2[224];
  uint64_t v18 = v9;
  char v10 = (int *)(a2 + 8);
  do
  {
    int v11 = *v10;
    v10 += 8;
    v19[v8++] = v11;
  }
  while (v8 != 8);
  unsigned int v12 = *(_DWORD *)(a1 + 696);
  uint64_t v13 = 0x7FFFFFFFLL;
  if (v12 <= 8)
  {
    if (((1 << v12) & 0x1D4) != 0) {
      return ixgbe_dcb_config_tx_desc_arbiter_82599((IOPCIDevice **)a1, (uint64_t)v17, (uint64_t)v16, (uint64_t)&v18, (uint64_t)v19);
    }
    if (v12 != 1) {
      return v13;
    }
    return ixgbe_dcb_config_tx_desc_arbiter_82598((IOPCIDevice **)a1, v17, v16, (unsigned __int8 *)&v18, v19);
  }
  return v13;
}

uint64_t ixgbe_dcb_config_tx_data_arbiter_cee(uint64_t a1, unsigned char *a2)
{
  uint64_t v2 = 0;
  uint64_t v24 = 0;
  unsigned int v3 = a2 + 68;
  do
  {
    LOWORD(v4) = *(v3 - 32);
    WORD1(v4) = *(v3 - 16);
    WORD2(v4) = *v3;
    HIWORD(v4) = v3[16];
    *(void *)&v23[v2] = v4;
    v3 += 64;
    v2 += 8;
  }
  while (v2 != 16);
  uint64_t v5 = 0;
  unint64_t v6 = a2 + 92;
  do
  {
    LOWORD(v7) = *(v6 - 32);
    WORD1(v7) = *(v6 - 16);
    WORD2(v7) = *v6;
    HIWORD(v7) = v6[16];
    *(void *)&v22[v5] = v7;
    v6 += 64;
    v5 += 8;
  }
  while (v5 != 16);
  uint64_t v8 = 0;
  LOBYTE(v9) = *a2;
  BYTE1(v9) = a2[32];
  BYTE2(v9) = a2[64];
  BYTE3(v9) = a2[96];
  BYTE4(v9) = a2[128];
  BYTE5(v9) = a2[160];
  BYTE6(v9) = a2[192];
  HIBYTE(v9) = a2[224];
  uint64_t v25 = v9;
  char v10 = (int *)(a2 + 8);
  do
  {
    int v11 = *v10;
    v10 += 8;
    v26[v8++] = v11;
  }
  while (v8 != 8);
  uint64_t v12 = 0;
  int v13 = a2[264];
  do
  {
    if (v13)
    {
      char v14 = v13 - 1;
      BOOL v15 = &a2[32 * (v13 - 1) + 3];
      while (v14)
      {
        char v16 = v14;
        int v17 = *v15;
        v15 -= 32;
        --v14;
        if (((1 << v12) & v17) != 0) {
          goto LABEL_14;
        }
      }
    }
    char v16 = 0;
LABEL_14:
    *((unsigned char *)&v24 + v12++) = v16;
  }
  while (v12 != 8);
  unsigned int v18 = *(_DWORD *)(a1 + 696);
  uint64_t v19 = 0x7FFFFFFFLL;
  if (v18 <= 8)
  {
    if (((1 << v18) & 0x1D4) != 0) {
      return ixgbe_dcb_config_tx_data_arbiter_82599((IOPCIDevice **)a1, (uint64_t)v23, (uint64_t)v22, (uint64_t)&v25, (uint64_t)v26, (unsigned __int8 *)&v24);
    }
    if (v18 != 1) {
      return v19;
    }
    return ixgbe_dcb_config_tx_data_arbiter_82598((IOPCIDevice **)a1, (uint64_t)v23, (uint64_t)v22, (uint64_t)&v25, (uint64_t)v26);
  }
  return v19;
}

uint64_t ixgbe_dcb_config_pfc_cee(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint8x8_t v14 = 0;
  int v3 = *(unsigned __int8 *)(a2 + 264);
  do
  {
    if (v3)
    {
      __int8 v4 = v3 - 1;
      uint64_t v5 = (unsigned __int8 *)(a2 + 32 * (v3 - 1) + 3);
      while (v4)
      {
        __int8 v6 = v4;
        int v7 = *v5;
        v5 -= 32;
        --v4;
        if (((1 << v2) & v7) != 0) {
          goto LABEL_8;
        }
      }
    }
    __int8 v6 = 0;
LABEL_8:
    v14.i8[v2++] = v6;
  }
  while (v2 != 8);
  LOBYTE(v8) = 0;
  int v9 = 0;
  for (uint64_t i = 0; i != 8; ++i)
  {
    if (*(_DWORD *)(a2 + 32 * v14.u8[i] + 24))
    {
      int v8 = v9 | (1 << i);
      int v9 = v8;
    }
  }
  unsigned int v11 = *(_DWORD *)(a1 + 696);
  uint64_t v12 = 0x7FFFFFFFLL;
  if (v11 > 8) {
    return v12;
  }
  if (((1 << v11) & 0x1D4) != 0) {
    return ixgbe_dcb_config_pfc_82599(a1, v8, &v14);
  }
  if (v11 != 1) {
    return v12;
  }
  return ixgbe_dcb_config_pfc_82598(a1, v8);
}

uint64_t ixgbe_dcb_config_tc_stats(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 696);
  if (v1 > 8) {
    return 0x7FFFFFFFLL;
  }
  if (((1 << v1) & 0x1D4) != 0) {
    return ixgbe_dcb_config_tc_stats_82599((IOPCIDevice **)a1, 0);
  }
  if (v1 == 1) {
    return ixgbe_dcb_config_tc_stats_82598((IOPCIDevice **)a1);
  }
  else {
    return 0x7FFFFFFFLL;
  }
}

uint64_t ixgbe_dcb_hw_config_cee(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0;
  uint8x8_t v28 = 0;
  uint64_t v5 = (_WORD *)(a2 + 68);
  do
  {
    LOWORD(v6) = *(v5 - 32);
    WORD1(v6) = *(v5 - 16);
    WORD2(v6) = *v5;
    HIWORD(v6) = v5[16];
    *(void *)&v27[v4] = v6;
    v5 += 64;
    v4 += 4;
  }
  while (v4 != 8);
  uint64_t v7 = 0;
  int v8 = (_WORD *)(a2 + 92);
  do
  {
    LOWORD(v9) = *(v8 - 32);
    WORD1(v9) = *(v8 - 16);
    WORD2(v9) = *v8;
    HIWORD(v9) = v8[16];
    *(void *)&v26[v7] = v9;
    v8 += 64;
    v7 += 4;
  }
  while (v7 != 8);
  uint64_t v10 = 0;
  LOBYTE(v11) = *(unsigned char *)a2;
  BYTE1(v11) = *(unsigned char *)(a2 + 32);
  BYTE2(v11) = *(unsigned char *)(a2 + 64);
  BYTE3(v11) = *(unsigned char *)(a2 + 96);
  BYTE4(v11) = *(unsigned char *)(a2 + 128);
  BYTE5(v11) = *(unsigned char *)(a2 + 160);
  BYTE6(v11) = *(unsigned char *)(a2 + 192);
  HIBYTE(v11) = *(unsigned char *)(a2 + 224);
  uint64_t v29 = v11;
  uint64_t v12 = (int *)(a2 + 8);
  do
  {
    int v13 = *v12;
    v12 += 8;
    v30[v10++] = v13;
  }
  while (v10 != 8);
  uint64_t v14 = 0;
  int v15 = *(unsigned __int8 *)(a2 + 264);
  do
  {
    if (v15)
    {
      __int8 v16 = v15 - 1;
      int v17 = (unsigned __int8 *)(a2 + 32 * (v15 - 1) + 3);
      while (v16)
      {
        __int8 v18 = v16;
        int v19 = *v17;
        v17 -= 32;
        --v16;
        if (((1 << v14) & v19) != 0) {
          goto LABEL_14;
        }
      }
    }
    __int8 v18 = 0;
LABEL_14:
    v28.i8[v14++] = v18;
  }
  while (v14 != 8);
  (*(void (**)(uint64_t))(a1 + 304))(a1);
  unsigned int v20 = *(_DWORD *)(a1 + 696);
  uint64_t v21 = 0x7FFFFFFFLL;
  if (v20 <= 8)
  {
    if (((1 << v20) & 0x1D4) != 0)
    {
      ixgbe_dcb_config_82599((IOPCIDevice **)a1, a2);
      uint64_t v21 = ixgbe_dcb_hw_config_82599((IOPCIDevice **)a1, *(unsigned int *)(a2 + 292), (uint64_t)v27, (uint64_t)v26, (uint64_t)&v29, (uint64_t)v30, (unsigned __int8 *)&v28);
      ixgbe_dcb_config_tc_stats_82599((IOPCIDevice **)a1, a2);
      if (v21) {
        return v21;
      }
    }
    else
    {
      if (v20 != 1) {
        return v21;
      }
      uint64_t v21 = ixgbe_dcb_hw_config_82598((IOPCIDevice **)a1, *(unsigned int *)(a2 + 292), v27, v26, (unsigned __int8 *)&v29, v30);
      if (v21) {
        return v21;
      }
    }
    if (*(unsigned char *)(a2 + 282))
    {
      LOBYTE(v22) = 0;
      int v23 = 0;
      for (uint64_t i = 0; i != 8; ++i)
      {
        if (*(_DWORD *)(a2 + 32 * v28.u8[i] + 24))
        {
          int v22 = v23 | (1 << i);
          int v23 = v22;
        }
      }
      return ixgbe_dcb_config_pfc(a1, v22, &v28);
    }
    else
    {
      return 0;
    }
  }
  return v21;
}

uint64_t ixgbe_dcb_config_pfc(uint64_t a1, unsigned int a2, uint8x8_t *a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 696);
  if (v3 > 8) {
    return 4294967291;
  }
  if (((1 << v3) & 0x1D4) != 0) {
    return ixgbe_dcb_config_pfc_82599(a1, a2, a3);
  }
  if (v3 == 1) {
    return ixgbe_dcb_config_pfc_82598(a1, a2);
  }
  else {
    return 4294967291;
  }
}

uint64_t ixgbe_dcb_hw_config(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  unsigned int v6 = *(_DWORD *)(a1 + 696);
  if (v6 <= 8)
  {
    if (((1 << v6) & 0x1D4) != 0)
    {
      ixgbe_dcb_config_rx_arbiter_82599((IOPCIDevice **)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6);
      ixgbe_dcb_config_tx_desc_arbiter_82599((IOPCIDevice **)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
      ixgbe_dcb_config_tx_data_arbiter_82599((IOPCIDevice **)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6);
    }
    else if (v6 == 1)
    {
      ixgbe_dcb_config_rx_arbiter_82598((IOPCIDevice **)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a5);
      ixgbe_dcb_config_tx_desc_arbiter_82598((IOPCIDevice **)a1, a2, a3, a4, a5);
      ixgbe_dcb_config_tx_data_arbiter_82598((IOPCIDevice **)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    }
  }
  return 0;
}

uint64_t ixgbe_init_mbx_ops_generic(uint64_t result)
{
  *(void *)(result + 1848) = sub_10002ECBC;
  *(void *)(result + 1856) = sub_10002EE0C;
  return result;
}

uint64_t sub_10002ECBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_posted_mbx", 84, "ixgbe_read_posted_mbx");
  }
  if (!*(void *)(a1 + 1832)) {
    return 4294967196;
  }
  int v8 = *(_DWORD *)(a1 + 1908);
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_poll_for_msg", 16, "ixgbe_poll_for_msg");
  }
  if (!v8) {
    return 4294967196;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1864);
  if (v9)
  {
    for (int i = v9(a1, a4); i; int i = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1864))(a1, a4))
    {
      if (!--v8)
      {
        if ((dword_10003C040 & 0x100000) != 0) {
          IOLog("ixgbe:%s(%d): Polling for VF%d mailbox message timedout\n", "ixgbe_poll_for_msg", 30, a4);
        }
        return 4294967196;
      }
      IODelay(*(unsigned int *)(a1 + 1912));
    }
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1832);
  return v11(a1, a2, a3, a4);
}

uint64_t sub_10002EE0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_posted_mbx", 114, "ixgbe_write_posted_mbx");
  }
  int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1840);
  if (v8 && *(_DWORD *)(a1 + 1908))
  {
    uint64_t result = v8(a1, a2, a3, a4);
    if (result) {
      return result;
    }
    int v10 = *(_DWORD *)(a1 + 1908);
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): %s\n", "ixgbe_poll_for_ack", 48, "ixgbe_poll_for_ack");
    }
    if (v10)
    {
      uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1872);
      if (!v11) {
        return 0;
      }
      uint64_t result = v11(a1, a4);
      if (!result) {
        return result;
      }
      while (--v10)
      {
        IODelay(*(unsigned int *)(a1 + 1912));
        int v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 1872))(a1, a4);
        uint64_t result = 0;
        if (!v12) {
          return result;
        }
      }
      if ((dword_10003C040 & 0x100000) != 0) {
        IOLog("ixgbe:%s(%d): Polling for VF%d mailbox ack timedout\n", "ixgbe_poll_for_ack", 62, a4);
      }
    }
  }
  return 4294967196;
}

uint64_t ixgbe_init_mbx_params_vf(uint64_t result)
{
  *(_DWORD *)(result + 1912) = 500;
  *(_WORD *)(result + 1920) = 16;
  *(void *)(result + 1832) = sub_10002F010;
  *(void *)(result + 1840) = sub_10002F0F4;
  *(void *)(result + 1848) = sub_10002ECBC;
  *(void *)(result + 1856) = sub_10002EE0C;
  *(void *)(result + 1864) = sub_10002F1E4;
  *(void *)(result + 1872) = sub_10002F260;
  *(void *)(result + 1880) = sub_10002F2DC;
  *(void *)(result + 1904) = 0;
  *(void *)(result + 1896) = 0;
  *(void *)(result + 1888) = 0;
  return result;
}

uint64_t sub_10002F010(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_mbx_vf", 328, "ixgbe_read_mbx_vf");
  }
  uint64_t v6 = sub_10002F874(a1);
  if (!v6)
  {
    if (a3)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 4 * a3;
      do
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v7 + 512, &readData);
        __dmb(1u);
        *(_DWORD *)(a2 + v7) = readData;
        v7 += 4;
      }
      while (v8 != v7);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x2FCuLL, 2u);
    ++*(_DWORD *)(a1 + 1892);
  }
  return v6;
}

uint64_t sub_10002F0F4(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_mbx_vf", 288, "ixgbe_write_mbx_vf");
  }
  uint64_t v6 = sub_10002F874(a1);
  if (!v6)
  {
    sub_10002F1E4(a1);
    sub_10002F260(a1);
    if (a3)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 4 * a3;
      do
      {
        __dmb(2u);
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v7 + 512, *(_DWORD *)(a2 + v7));
        v7 += 4;
      }
      while (v8 != v7);
    }
    ++*(_DWORD *)(a1 + 1888);
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x2FCuLL, 1u);
  }
  return v6;
}

uint64_t sub_10002F1E4(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_for_msg_vf", 194, "ixgbe_check_for_msg_vf");
  }
  uint64_t result = sub_10002F928(a1, 16);
  if (result) {
    return 4294967196;
  }
  ++*(_DWORD *)(a1 + 1900);
  return result;
}

uint64_t sub_10002F260(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_for_ack_vf", 216, "ixgbe_check_for_ack_vf");
  }
  uint64_t result = sub_10002F928(a1, 32);
  if (result) {
    return 4294967196;
  }
  ++*(_DWORD *)(a1 + 1896);
  return result;
}

uint64_t sub_10002F2DC(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_for_rst_vf", 238, "ixgbe_check_for_rst_vf");
  }
  uint64_t result = sub_10002F928(a1, 192);
  if (result) {
    return 4294967196;
  }
  ++*(_DWORD *)(a1 + 1904);
  return result;
}

uint64_t ixgbe_init_mbx_params_pf(uint64_t result)
{
  unsigned int v1 = *(_DWORD *)(result + 696);
  BOOL v2 = v1 > 8;
  int v3 = (1 << v1) & 0x1D4;
  if (!v2 && v3 != 0)
  {
    *(_DWORD *)(result + 1912) = 0;
    *(_WORD *)(result + 1920) = 16;
    *(void *)(result + 1832) = sub_10002F420;
    *(void *)(result + 1840) = sub_10002F518;
    *(void *)(result + 1848) = sub_10002ECBC;
    *(void *)(result + 1856) = sub_10002EE0C;
    *(void *)(result + 1864) = sub_10002F61C;
    *(void *)(result + 1872) = sub_10002F6B0;
    *(void *)(result + 1880) = sub_10002F744;
    *(void *)(result + 1904) = 0;
    *(void *)(result + 1896) = 0;
    *(void *)(result + 1888) = 0;
  }
  return result;
}

uint64_t sub_10002F420(uint64_t a1, uint32_t *a2, int a3, unsigned int a4)
{
  LODWORD(v5) = a3;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_read_mbx_pf", 569, "ixgbe_read_mbx_pf");
  }
  uint64_t v8 = sub_10002F99C((IOPCIDevice **)a1, a4);
  if (!v8)
  {
    uint64_t v9 = a4;
    if (v5)
    {
      uint64_t v10 = ((unint64_t)a4 << 6) + 77824;
      uint64_t v5 = v5;
      do
      {
        uint32_t readData = 0;
        IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v10, &readData);
        __dmb(1u);
        *a2++ = readData;
        v10 += 4;
        --v5;
      }
      while (v5);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 4 * v9 + 19200, 2u);
    ++*(_DWORD *)(a1 + 1892);
  }
  return v8;
}

uint64_t sub_10002F518(uint64_t a1, uint32_t *a2, int a3, unsigned int a4)
{
  LODWORD(v5) = a3;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_write_mbx_pf", 526, "ixgbe_write_mbx_pf");
  }
  uint64_t v8 = sub_10002F99C((IOPCIDevice **)a1, a4);
  if (!v8)
  {
    sub_10002F61C(a1, a4);
    sub_10002F6B0(a1, a4);
    uint64_t v9 = a4;
    if (v5)
    {
      uint64_t v10 = ((unint64_t)a4 << 6) + 77824;
      uint64_t v5 = v5;
      do
      {
        __dmb(2u);
        uint32_t v11 = *a2++;
        IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v10, v11);
        v10 += 4;
        --v5;
      }
      while (v5);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 4 * v9 + 19200, 1u);
    ++*(_DWORD *)(a1 + 1888);
  }
  return v8;
}

uint64_t sub_10002F61C(uint64_t a1, unsigned int a2)
{
  int v3 = a2 >> 4;
  char v4 = a2 & 0xF;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_for_msg_pf", 408, "ixgbe_check_for_msg_pf");
  }
  uint64_t result = sub_10002FA74((IOPCIDevice **)a1, 1 << v4, v3);
  if (result) {
    return 4294967196;
  }
  ++*(_DWORD *)(a1 + 1900);
  return result;
}

uint64_t sub_10002F6B0(uint64_t a1, unsigned int a2)
{
  int v3 = a2 >> 4;
  char v4 = a2 & 0xF;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_for_ack_pf", 432, "ixgbe_check_for_ack_pf");
  }
  uint64_t result = sub_10002FA74((IOPCIDevice **)a1, 0x10000 << v4, v3);
  if (result) {
    return 4294967196;
  }
  ++*(_DWORD *)(a1 + 1896);
  return result;
}

uint64_t sub_10002F744(uint64_t a1, unsigned int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_check_for_rst_pf", 457, "ixgbe_check_for_rst_pf");
  }
  char v4 = a2 & 0x1F;
  int v5 = *(_DWORD *)(a1 + 696);
  if ((v5 - 6) < 3 || v5 == 4)
  {
    uint32_t readData = 0;
    if (a2 <= 0x1F) {
      uint64_t v7 = 1792;
    }
    else {
      uint64_t v7 = 1796;
    }
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v7, &readData);
    __dmb(1u);
    uint32_t v8 = readData;
  }
  else if (v5 == 2)
  {
    uint32_t v13 = 0;
    if (a2 <= 0x1F) {
      uint64_t v9 = 1536;
    }
    else {
      uint64_t v9 = 448;
    }
    IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, v9, &v13);
    __dmb(1u);
    uint32_t v8 = v13;
  }
  else
  {
    uint32_t v8 = 0;
  }
  if ((v8 & (1 << v4)) == 0) {
    return 4294967196;
  }
  __dmb(2u);
  if (a2 <= 0x1F) {
    uint64_t v10 = 1792;
  }
  else {
    uint64_t v10 = 1796;
  }
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v10, 1 << v4);
  uint64_t result = 0;
  ++*(_DWORD *)(a1 + 1904);
  return result;
}

uint64_t sub_10002F874(uint64_t a1)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_obtain_mbx_lock_vf", 259, "ixgbe_obtain_mbx_lock_vf");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x2FCuLL, 4u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x2FCuLL, &readData);
  __dmb(1u);
  int v2 = *(_DWORD *)(a1 + 1916);
  char v3 = v2 | readData;
  *(_DWORD *)(a1 + 1916) = v2 | readData & 0xB0;
  if ((v3 & 4) != 0) {
    return 0;
  }
  else {
    return 4294967196;
  }
}

uint64_t sub_10002F928(uint64_t a1, int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x2FCuLL, &readData);
  __dmb(1u);
  int v4 = *(_DWORD *)(a1 + 1916);
  if (((v4 | readData) & a2) != 0) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = 4294967196;
  }
  *(_DWORD *)(a1 + 1916) = (v4 | readData & 0xB0) & ~a2;
  return result;
}

uint64_t sub_10002F99C(IOPCIDevice **a1, int a2)
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_obtain_mbx_lock_pf", 494, "ixgbe_obtain_mbx_lock_pf");
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, (4 * a2 + 19200), 8u);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, (4 * a2 + 19200), &readData);
  uint64_t result = 0;
  __dmb(1u);
  if ((readData & 8) == 0)
  {
    if ((dword_10003C040 & 0x100000) != 0) {
      IOLog("ixgbe:%s(%d): Failed to obtain mailbox lock for VF%d\n", "ixgbe_obtain_mbx_lock_pf", 505, a2);
    }
    return 4294967196;
  }
  return result;
}

uint64_t sub_10002FA74(IOPCIDevice **a1, uint32_t a2, int a3)
{
  uint32_t readData = 0;
  uint64_t v5 = (4 * a3 + 1808);
  IOPCIDevice::MemoryRead32(*a1, 0, v5, &readData);
  __dmb(1u);
  if ((readData & a2) == 0) {
    return 4294967196;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, v5, a2);
  return 0;
}

uint64_t ixgbe_dcb_get_tc_stats_82598(IOPCIDevice **a1, uint64_t a2, int a3)
{
  LODWORD(v3) = a3;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_dcb_get_tc_stats_82598", 19, "dcb_get_tc_stats");
  }
  if (v3 > 8) {
    return 4294967291;
  }
  if (v3)
  {
    uint64_t v7 = (void *)(a2 + 728);
    uint64_t v8 = 24624;
    uint64_t v9 = 4148;
    uint64_t v3 = v3;
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v8, &readData);
      __dmb(1u);
      v7[16] += readData;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v8 + 4, &readData);
      __dmb(1u);
      v7[48] += readData;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v8 - 20480, &readData);
      __dmb(1u);
      *v7 += readData;
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v9, &readData);
      __dmb(1u);
      v7[32] += readData;
      v8 += 64;
      v9 += 64;
      ++v7;
      --v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t ixgbe_dcb_get_pfc_stats_82598(IOPCIDevice **a1, uint64_t a2, int a3)
{
  LODWORD(v3) = a3;
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_dcb_get_pfc_stats_82598", 61, "dcb_get_pfc_stats");
  }
  if (v3 > 8) {
    return 4294967291;
  }
  if (v3)
  {
    uint64_t v3 = v3;
    uint64_t v7 = (void *)(a2 + 352);
    uint64_t v8 = 53024;
    do
    {
      uint32_t readData = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v8 - 36864, &readData);
      __dmb(1u);
      *(v7 - 8) += readData;
      uint32_t v9 = 0;
      IOPCIDevice::MemoryRead32(*a1, 0, v8, &v9);
      __dmb(1u);
      *v7++ += v9;
      v8 += 4;
      --v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t ixgbe_dcb_config_rx_arbiter_82598(IOPCIDevice **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x50A0uLL, &readData);
  __dmb(1u);
  uint32_t v8 = readData | 0x80000000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x50A0uLL, v8);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x3D00uLL, &readData);
  __dmb(1u);
  uint32_t v9 = readData & 0xFFFFFFB9 | 6;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x3D00uLL, v9);
  uint64_t v10 = 0;
  uint64_t v11 = 15392;
  do
  {
    if (*(unsigned char *)(a4 + v10) == 2) {
      uint32_t v12 = *(unsigned __int16 *)(a2 + 2 * v10) | (*(unsigned __int16 *)(a3 + 2 * v10) << 12) | 0x80000000;
    }
    else {
      uint32_t v12 = *(unsigned __int16 *)(a2 + 2 * v10) | (*(unsigned __int16 *)(a3 + 2 * v10) << 12);
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, v11, v12);
    ++v10;
    v11 += 4;
  }
  while (v10 != 8);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x2F00uLL, &readData);
  __dmb(1u);
  uint32_t v13 = readData | 0x50;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x2F00uLL, v13);
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x3000uLL, &readData);
  __dmb(1u);
  uint32_t v14 = readData & 0xFFFFFFFD;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x3000uLL, v14);
  return 0;
}

uint64_t ixgbe_dcb_config_tx_desc_arbiter_82598(IOPCIDevice **a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int8 *a4, unsigned __int8 *a5)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x7F40uLL, &readData);
  __dmb(1u);
  uint32_t v10 = readData & 0xFFF3FFBF | 0xC0000;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x7F40uLL, v10);
  for (uint64_t i = 0; i != 512; i += 64)
  {
    int v13 = *a3++;
    int v12 = v13;
    int v14 = *a2++;
    int v15 = v14 | (v12 << 12);
    int v16 = *a4++;
    int v17 = v15 | (v16 << 9);
    int v19 = *a5++;
    int v18 = v19;
    if (v19 == 1) {
      v17 |= 0x40000000u;
    }
    if (v18 == 2) {
      uint32_t v20 = v17 | 0x80000000;
    }
    else {
      uint32_t v20 = v17;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, i | 0x602C, v20);
  }
  return 0;
}

uint64_t ixgbe_dcb_config_tx_data_arbiter_82598(IOPCIDevice **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0xCD00uLL, &readData);
  __dmb(1u);
  uint32_t v10 = readData & 0xFFFFFE9F | 0x120;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0xCD00uLL, v10);
  uint64_t v11 = 0;
  uint64_t v12 = 52512;
  do
  {
    int v13 = *(unsigned __int16 *)(a2 + 2 * v11) | (*(unsigned __int16 *)(a3 + 2 * v11) << 12) | (*(unsigned __int8 *)(a4 + v11) << 9);
    int v14 = *(unsigned __int8 *)(a5 + v11);
    if (v14 == 1) {
      v13 |= 0x40000000u;
    }
    if (v14 == 2) {
      uint32_t v15 = v13 | 0x80000000;
    }
    else {
      uint32_t v15 = v13;
    }
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, v12, v15);
    ++v11;
    v12 += 4;
  }
  while (v11 != 8);
  uint32_t v18 = 0;
  IOPCIDevice::MemoryRead32(*a1, 0, 0x7E00uLL, &v18);
  __dmb(1u);
  uint32_t v16 = v18 | 4;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*a1, 0, 0x7E00uLL, v16);
  return 0;
}

uint64_t ixgbe_dcb_config_pfc_82598(uint64_t a1, unsigned int a2)
{
  uint32_t readData = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x3D00uLL, &readData);
  __dmb(1u);
  uint32_t v4 = readData & 0xFFFFFFE7 | 0x10;
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x3D00uLL, v4);
  uint32_t v15 = 0;
  IOPCIDevice::MemoryRead32(*(IOPCIDevice **)a1, 0, 0x5080uLL, &v15);
  __dmb(1u);
  if (a2) {
    uint32_t v5 = v15 & 0xFFFF3FFF | 0x4000;
  }
  else {
    uint32_t v5 = v15 & 0xFFFF3FFF;
  }
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x5080uLL, v5);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint32_t v8 = (_DWORD *)(a1 + 1364);
  do
  {
    if ((a2 >> v7))
    {
      uint32_t v9 = (*v8 << 10) | 0x80000000;
      uint32_t v10 = (*(v8 - 8) << 10) | 0x80000000;
      __dmb(2u);
      uint64_t v11 = 8 * v7;
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v6 + 12832, v9);
      __dmb(2u);
    }
    else
    {
      __dmb(2u);
      IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v6 + 12832, 0);
      uint32_t v10 = 0;
      __dmb(2u);
      uint64_t v11 = v6;
    }
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v11 + 12896, v10);
    ++v7;
    ++v8;
    v6 += 8;
  }
  while (v7 != 8);
  uint64_t v12 = 0;
  uint32_t v13 = *(unsigned __int16 *)(a1 + 1396) | (*(unsigned __int16 *)(a1 + 1396) << 16);
  do
  {
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, v12 | 0x3200, v13);
    v12 += 4;
  }
  while (v12 != 16);
  __dmb(2u);
  IOPCIDevice::MemoryWrite32(*(IOPCIDevice **)a1, 0, 0x32A0uLL, *(unsigned __int16 *)(a1 + 1396) >> 1);
  return 0;
}

uint64_t ixgbe_dcb_config_tc_stats_82598(IOPCIDevice **a1)
{
  int v2 = 0;
  int v3 = 0;
  int v4 = 8;
  do
  {
    uint32_t readData = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, (4 * v3 + 8960), &readData);
    __dmb(1u);
    uint32_t v5 = readData | v2;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, (4 * v3 + 8960), v5);
    uint32_t v12 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, (4 * v3 + 8964), &v12);
    __dmb(1u);
    uint32_t v6 = v12 | v2;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, (4 * v3 + 8964), v6);
    int v3 = (v3 + 2);
    v2 += 16843009;
    --v4;
  }
  while (v4);
  uint64_t v7 = 0;
  int v8 = 0;
  do
  {
    uint32_t v11 = 0;
    IOPCIDevice::MemoryRead32(*a1, 0, v7 + 29440, &v11);
    __dmb(1u);
    uint32_t v9 = v11 | v8;
    __dmb(2u);
    IOPCIDevice::MemoryWrite32(*a1, 0, v7 + 29440, v9);
    v8 += 16843009;
    v7 += 4;
  }
  while (v7 != 32);
  return 0;
}

uint64_t ixgbe_dcb_hw_config_82598(IOPCIDevice **a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 *a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  return 0;
}

uint64_t sub_10003046C(void *a1)
{
  *a1 = off_100038AE8;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXGBEMetaClass::New(DriverKit_AppleEthernetIXGBEMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100038B28;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)off_100038CB8;
  *(void *)&a2[1].refcount = &off_100038CD8;
  return 0;
}

uint64_t DriverKit_AppleEthernetIXGBE::Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return DriverKit_AppleEthernetIXGBE::_Dispatch(this, &v4, a3);
}

uint64_t DriverKit_AppleEthernetIXGBE::_Dispatch(IOUserNetworkEthernet *this, IORPC *a2, IORPC *a3)
{
  int64_t msgid = IORPCMessageFromMach(a2->message, 0)->msgid;
  if (msgid > (uint64_t)0xE77A9AA5DB9C706BLL)
  {
    if (msgid <= 0x293D4E9DE6CD31DFLL)
    {
      if (msgid <= (uint64_t)0xF421A9D80F9A1FD9)
      {
        if (msgid == 0xE77A9AA5DB9C706CLL)
        {
          IORPC v35 = *a2;
          return IOUserNetworkEthernet::GetHardwareAssists_Invoke(&v35, this, (IOUserNetworkEthernet::GetHardwareAssists_Handler)DriverKit_AppleEthernetIXGBE::GetHardwareAssists_Impl);
        }
        if (msgid == 0xED7CE2CA0DF8ED0ELL)
        {
          IORPC rpc = *a2;
          return IOUserNetworkEthernet::SetMTU_Invoke(&rpc, this, (IOUserNetworkEthernet::SetMTU_Handler)DriverKit_AppleEthernetIXGBE::SetMTU_Impl);
        }
        goto LABEL_49;
      }
      if (msgid == 0xF421A9D80F9A1FDALL)
      {
        if (!OSMetaClassBase::IsRemote(this))
        {
          IORPC v46 = *a2;
          return IOUserNetworkEthernet::SetInterfaceEnable_Invoke(&v46, this, (IOUserNetworkEthernet::SetInterfaceEnable_Handler)DriverKit_AppleEthernetIXGBE::SetInterfaceEnable_Impl);
        }
        long long v47 = *(_OWORD *)&a2->message;
        uint64_t v48 = *(void *)&a2->sendSize;
        p_IORPC invoke = (IORPC *)&v47;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }
      if (msgid == 0xFF064BE82B35CC0)
      {
        if (!OSMetaClassBase::IsRemote(this))
        {
          IORPC v15 = *a2;
          return IOTimerDispatchSource::TimerOccurred_Invoke(&v15, this, (IOTimerDispatchSource::TimerOccurred_Handler)DriverKit_AppleEthernetIXGBE::WatchdogTimerOccurred_Impl, (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXGBE_WatchdogTimerOccurredMetaClass);
        }
        long long v16 = *(_OWORD *)&a2->message;
        uint64_t v17 = *(void *)&a2->sendSize;
        p_IORPC invoke = (IORPC *)&v16;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }
LABEL_49:
      IORPC v14 = *a2;
      return IOUserNetworkEthernet::_Dispatch(this, &v14);
    }
    if (msgid > 0x617E0E64AAB61C2DLL)
    {
      if (msgid == 0x617E0E64AAB61C2ELL)
      {
        if (OSMetaClassBase::IsRemote(this))
        {
          IORPC invoke = *a2;
          p_IORPC invoke = &invoke;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        IORPC v22 = *a2;
        uint32_t v11 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXGBE_TxSubmitMetaClass;
        uint32_t v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetIXGBE::TxSubmit_Impl;
        uint32_t v13 = &v22;
      }
      else
      {
        if (msgid != 0x6256EB720E3510EFLL) {
          goto LABEL_49;
        }
        if (OSMetaClassBase::IsRemote(this))
        {
          long long v20 = *(_OWORD *)&a2->message;
          uint64_t v21 = *(void *)&a2->sendSize;
          p_IORPC invoke = (IORPC *)&v20;
          return OSMetaClassBase::Dispatch(this, p_invoke);
        }
        long long v18 = *(_OWORD *)&a2->message;
        uint64_t v19 = *(void *)&a2->sendSize;
        uint32_t v11 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXGBE_RxSubmitMetaClass;
        uint32_t v12 = (void (__cdecl *)(OSMetaClassBase *, OSAction *))DriverKit_AppleEthernetIXGBE::RxSubmit_Impl;
        uint32_t v13 = (IORPC *)&v18;
      }
      return IODataQueueDispatchSource::DataAvailable_Invoke(v13, this, v12, v11);
    }
    if (msgid == 0x293D4E9DE6CD31E0)
    {
      if (OSMetaClassBase::IsRemote(this))
      {
        long long v29 = *(_OWORD *)&a2->message;
        uint64_t v30 = *(void *)&a2->sendSize;
        p_IORPC invoke = (IORPC *)&v29;
        return OSMetaClassBase::Dispatch(this, p_invoke);
      }
      IORPC v28 = *a2;
      int v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXGBE_QueueInterruptMetaClass;
      uint32_t v9 = DriverKit_AppleEthernetIXGBE::QueueInterrupt_Impl;
      uint32_t v10 = &v28;
    }
    else
    {
      if (msgid != 0x564B1E9BB6CAC97ELL) {
        goto LABEL_49;
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
      int v8 = (const OSMetaClass *)gOSAction_DriverKit_AppleEthernetIXGBE_OtherInterruptMetaClass;
      uint32_t v9 = DriverKit_AppleEthernetIXGBE::OtherInterrupt_Impl;
      uint32_t v10 = (IORPC *)&v24;
    }
    return IOInterruptDispatchSource::InterruptOccurred_Invoke(v10, this, (IOInterruptDispatchSource::InterruptOccurred_Handler)v9, v8);
  }
  if (msgid <= (uint64_t)0xB23EE0228705FB94)
  {
    switch(msgid)
    {
      case 0x98E715041C459FA5:
        IORPC v49 = *a2;
        return IOService::Stop_Invoke(&v49, this, (IOService::Stop_Handler)DriverKit_AppleEthernetIXGBE::Stop_Impl);
      case 0xA49568F23EE8EFD5:
        IORPC v36 = *a2;
        return IOUserNetworkEthernet::GetMaxTransferUnit_Invoke(&v36, this, (IOUserNetworkEthernet::GetMaxTransferUnit_Handler)DriverKit_AppleEthernetIXGBE::GetMaxTransferUnit_Impl);
      case 0xAB6F76DDE6D693F2:
        IORPC v50 = *a2;
        return IOService::Start_Invoke(&v50, this, (IOService::Start_Handler)DriverKit_AppleEthernetIXGBE::Start_Impl);
    }
    goto LABEL_49;
  }
  if (msgid > (uint64_t)0xE042A87972611224)
  {
    if (msgid == 0xE042A87972611225)
    {
      if (!OSMetaClassBase::IsRemote(this))
      {
        IORPC v40 = *a2;
        return IOUserNetworkEthernet::SetAllMulticastModeEnable_Invoke(&v40, this, (IOUserNetworkEthernet::SetAllMulticastModeEnable_Handler)DriverKit_AppleEthernetIXGBE::SetAllMulticastModeEnable_Impl);
      }
      long long v41 = *(_OWORD *)&a2->message;
      uint64_t v42 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v41;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    if (msgid == 0xE072FCC26CF639ACLL)
    {
      if (!OSMetaClassBase::IsRemote(this))
      {
        IORPC v43 = *a2;
        return IOUserNetworkEthernet::SetPromiscuousModeEnable_Invoke(&v43, this, (IOUserNetworkEthernet::SetPromiscuousModeEnable_Handler)DriverKit_AppleEthernetIXGBE::SetPromiscuousModeEnable_Impl);
      }
      long long v44 = *(_OWORD *)&a2->message;
      uint64_t v45 = *(void *)&a2->sendSize;
      p_IORPC invoke = (IORPC *)&v44;
      return OSMetaClassBase::Dispatch(this, p_invoke);
    }
    goto LABEL_49;
  }
  if (msgid == 0xB23EE0228705FB95)
  {
    if (!OSMetaClassBase::IsRemote(this))
    {
      IORPC v32 = *a2;
      return IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Invoke(&v32, this, (IOUserNetworkEthernet::SetWakeOnMagicPacketEnable_Handler)DriverKit_AppleEthernetIXGBE::SetWakeOnMagicPacketEnable_Impl);
    }
    long long v33 = *(_OWORD *)&a2->message;
    uint64_t v34 = *(void *)&a2->sendSize;
    p_IORPC invoke = (IORPC *)&v33;
    return OSMetaClassBase::Dispatch(this, p_invoke);
  }
  if (msgid != 0xC3E63AC546EBD1FELL) {
    goto LABEL_49;
  }
  if (!OSMetaClassBase::IsRemote(this))
  {
    IORPC v37 = *a2;
    return IOUserNetworkEthernet::SelectMediaType_Invoke(&v37, this, (IOUserNetworkEthernet::SelectMediaType_Handler)DriverKit_AppleEthernetIXGBE::SelectMediaType_Impl);
  }
  long long v38 = *(_OWORD *)&a2->message;
  uint64_t v39 = *(void *)&a2->sendSize;
  p_IORPC invoke = (IORPC *)&v38;
  return OSMetaClassBase::Dispatch(this, p_invoke);
}

uint64_t DriverKit_AppleEthernetIXGBEMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t DriverKit_AppleEthernetIXGBE::CreateActionQueueInterrupt(OSObject *this, size_t a2, OSAction **a3)
{
  uint32_t v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXGBE_QueueInterrupt");
  if (!v6) {
    return 3758097085;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x293D4E9DE6CD31E0uLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetIXGBE::CreateActionOtherInterrupt(OSObject *this, size_t a2, OSAction **a3)
{
  uint32_t v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXGBE_OtherInterrupt");
  if (!v6) {
    return 3758097085;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x564B1E9BB6CAC97EuLL, 0xCE0513291CFA1EE1, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetIXGBE::CreateActionTxSubmit(OSObject *this, size_t a2, OSAction **a3)
{
  uint32_t v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXGBE_TxSubmit");
  if (!v6) {
    return 3758097085;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x617E0E64AAB61C2EuLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetIXGBE::CreateActionRxSubmit(OSObject *this, size_t a2, OSAction **a3)
{
  uint32_t v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXGBE_RxSubmit");
  if (!v6) {
    return 3758097085;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0x6256EB720E3510EFuLL, 0xF799C876BAF566F3, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t DriverKit_AppleEthernetIXGBE::CreateActionWatchdogTimerOccurred(OSObject *this, size_t a2, OSAction **a3)
{
  uint32_t v6 = OSString::withCString("OSAction_DriverKit_AppleEthernetIXGBE_WatchdogTimerOccurred");
  if (!v6) {
    return 3758097085;
  }
  uint64_t v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0xFF064BE82B35CC0uLL, 0xF4AB1C3CBB5AE47uLL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t sub_100030FEC(void *a1)
{
  *a1 = off_100038E30;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_QueueInterruptMetaClass::New(OSAction_DriverKit_AppleEthernetIXGBE_QueueInterruptMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100038E70;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100038EB8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_QueueInterrupt::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_QueueInterrupt::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_QueueInterruptMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10003114C(void *a1)
{
  *a1 = off_100038ED8;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_OtherInterruptMetaClass::New(OSAction_DriverKit_AppleEthernetIXGBE_OtherInterruptMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100038F18;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100038F60;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_OtherInterrupt::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_OtherInterrupt::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_OtherInterruptMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_1000312AC(void *a1)
{
  *a1 = off_100038F80;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_TxSubmitMetaClass::New(OSAction_DriverKit_AppleEthernetIXGBE_TxSubmitMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100038FC0;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100039008;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_TxSubmit::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_TxSubmit::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_TxSubmitMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10003140C(void *a1)
{
  *a1 = off_100039028;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_RxSubmitMetaClass::New(OSAction_DriverKit_AppleEthernetIXGBE_RxSubmitMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100039068;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_1000390B0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_RxSubmit::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_RxSubmit::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_RxSubmitMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_10003156C(void *a1)
{
  *a1 = off_1000390D0;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_WatchdogTimerOccurredMetaClass::New(OSAction_DriverKit_AppleEthernetIXGBE_WatchdogTimerOccurredMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&off_100039110;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&off_100039158;
  return 0;
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_WatchdogTimerOccurred::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_WatchdogTimerOccurred::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction_DriverKit_AppleEthernetIXGBE_WatchdogTimerOccurredMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t sub_1000316CC()
{
  return gOSAction_DriverKit_AppleEthernetIXGBE_QueueInterruptMetaClass;
}

uint64_t sub_1000316D8()
{
  return gOSAction_DriverKit_AppleEthernetIXGBE_OtherInterruptMetaClass;
}

uint64_t sub_1000316E4()
{
  return gOSAction_DriverKit_AppleEthernetIXGBE_TxSubmitMetaClass;
}

uint64_t sub_1000316F0()
{
  return gOSAction_DriverKit_AppleEthernetIXGBE_RxSubmitMetaClass;
}

uint64_t sub_1000316FC()
{
  return gOSAction_DriverKit_AppleEthernetIXGBE_WatchdogTimerOccurredMetaClass;
}

void sub_100031708()
{
}

void sub_100031734()
{
}

void sub_100031760()
{
}

void sub_10003178C()
{
}

void sub_1000317B8()
{
}

void sub_1000317E4()
{
}

void sub_100031810()
{
}

void sub_10003183C()
{
}

void sub_100031868()
{
}

void sub_100031894()
{
}

void sub_1000318C0()
{
}

void sub_1000318EC()
{
}

void sub_100031918()
{
}

void sub_100031944()
{
}

void sub_100031970()
{
}

void sub_10003199C()
{
}

void sub_1000319C8()
{
}

void sub_1000319F4()
{
}

void sub_100031A20()
{
}

void sub_100031A4C()
{
}

void sub_100031A78()
{
}

void sub_100031AA4()
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_mta_vector", 282, "MC filter type param set incorrectly\n");
  }
  __assert_rtn("ixgbe_mta_vector", "ixgbe_vf.c", 283, "0");
}

void sub_100031B0C()
{
}

void sub_100031B38()
{
  if ((dword_10003C040 & 0x100000) != 0) {
    IOLog("ixgbe:%s(%d): %s\n", "ixgbe_mta_vector", 2639, "MC filter type param set incorrectly\n");
  }
  __assert_rtn("ixgbe_mta_vector", "ixgbe_common.c", 2640, "0");
}

void IODelay(uint64_t us)
{
}

void IOFree(void *address, size_t length)
{
}

int IOLog(const char *format, ...)
{
  return _IOLog(format);
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

void IOPCIDevice::ConfigurationRead8(IOPCIDevice *this, uint64_t offset, uint8_t *readData)
{
}

void IOPCIDevice::ConfigurationRead16(IOPCIDevice *this, uint64_t offset, uint16_t *readData)
{
}

void IOPCIDevice::ConfigurationWrite8(IOPCIDevice *this, uint64_t offset, uint8_t data)
{
}

uint64_t IOPCIDevice::ConfigureInterrupts(IOPCIDevice *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, int (*a6)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  return IOPCIDevice::ConfigureInterrupts(this, a2, a3, a4, a5, a6);
}

void IOPCIDevice::ConfigurationWrite16(IOPCIDevice *this, uint64_t offset, uint16_t data)
{
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

kern_return_t IODispatchQueue::Create(const IODispatchQueueName name, uint64_t options, uint64_t priority, IODispatchQueue **queue)
{
  return IODispatchQueue::Create(name, options, priority, queue);
}

BOOL IODispatchQueue::OnQueue(IODispatchQueue *this)
{
  return IODispatchQueue::OnQueue(this);
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

void IOUserNetworkEthernet::free(IOUserNetworkEthernet *this)
{
}

BOOL IOUserNetworkEthernet::init(IOUserNetworkEthernet *this)
{
  return IOUserNetworkEthernet::init(this);
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

kern_return_t IOService::Stop(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Stop(this, provider, supermethod);
}

kern_return_t IOService::Start(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  return IOService::Start(this, provider, supermethod);
}

OSObject *__cdecl OSDictionary::getObject(const OSDictionary *this, const char *aKey)
{
  return OSDictionary::getObject(this, aKey);
}

const void *__cdecl OSData::getBytesNoCopy(const OSData *this)
{
  return OSData::getBytesNoCopy(this);
}

void operator delete[]()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}