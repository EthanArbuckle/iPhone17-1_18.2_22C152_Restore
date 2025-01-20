OSMetaClass *AppleH15IO::MetaClass::MetaClass(OSMetaClass *this)
{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleH15IO", &AppleARMIO::gMetaClass, 0x120u);
  result->__vftable = (OSMetaClass_vtbl *)off_208D0;
  return result;
}

{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "AppleH15IO", &AppleARMIO::gMetaClass, 0x120u);
  result->__vftable = (OSMetaClass_vtbl *)off_208D0;
  return result;
}

void AppleH15IO::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleH15IO::AppleH15IO(AppleH15IO *this, const OSMetaClass *a2)
{
  AppleARMIO::AppleARMIO(this, a2);
  void *v2 = off_202E8;
}

{
  void *v2;

  AppleARMIO::AppleARMIO(this, a2);
  void *v2 = off_202E8;
}

void AppleH15IO::~AppleH15IO(AppleH15IO *this)
{
}

{
  AppleARMIO::~AppleARMIO(this);
}

{
  uint64_t vars8;

  AppleARMIO::~AppleARMIO(this);

  _OSObject_typed_operator_delete(&AppleH15IO_ktv, this, 288);
}

void AppleH15IO::operator delete(void *a1, uint64_t a2)
{
}

void *AppleH15IO::getMetaClass(AppleH15IO *this)
{
  return &AppleH15IO::gMetaClass;
}

AppleARMIO *AppleH15IO::MetaClass::alloc(AppleH15IO::MetaClass *this)
{
  v1 = (AppleARMIO *)OSObject_typed_operator_new();
  AppleARMIO::AppleARMIO(v1, &AppleH15IO::gMetaClass);
  void *v2 = off_202E8;
  OSMetaClass::instanceConstructed(&AppleH15IO::gMetaClass);
  return v1;
}

uint64_t AppleH15IO::operator new(AppleH15IO *this)
{
  return OSObject_typed_operator_new();
}

void AppleH15IO::AppleH15IO(AppleH15IO *this)
{
  AppleARMIO::AppleARMIO(this, &AppleH15IO::gMetaClass);
  void *v1 = off_202E8;
  OSMetaClass::instanceConstructed(&AppleH15IO::gMetaClass);
}

{
  void *v1;

  AppleARMIO::AppleARMIO(this, &AppleH15IO::gMetaClass);
  void *v1 = off_202E8;
  OSMetaClass::instanceConstructed(&AppleH15IO::gMetaClass);
}

IOCommandGate *AppleH15IO::start(AppleH15IO *this, IOService *a2)
{
  if (result)
  {
    v5 = (const OSMetaClassBase *)((uint64_t (*)(IOService *, const char *))a2->getProperty_1)(a2, "chip-revision");
    v6 = OSMetaClassBase::safeMetaCast(v5, OSData::metaClass);
    if (v6)
    {
      int v7 = *(_DWORD *)((uint64_t (*)(OSMetaClassBase *))v6->__vftable[2].~OSMetaClassBase_0)(v6);
      *((_DWORD *)this + 58) = v7;
    }
    else
    {
      int v7 = *((_DWORD *)this + 58);
    }
    kprintf("start: chip-revision: %c%c\n", (((v7 << 20) + 1090519040) >> 24), v7 & 0xF | 0x30u);
    PMRootDomain = IOService::getPMRootDomain();
    ((void (*)(IOPMrootDomain *, const char *, uint64_t, uint64_t))PMRootDomain->setProperty_4)(PMRootDomain, "IOPMSystemSleepType", 7, 32);
    if (!(*(uint64_t (**)(AppleH15IO *, void, uint64_t, uint64_t))(*(void *)this + 1480))(this, 0, 1, 256))kprintf("start: clock frequencies not published in device tree\n"); {
    *((void *)this + 28) = AppleH15IO::_waitGate;
    }
    result = IOCommandGate::commandGate((OSObject *)this, 0);
    *((void *)this + 27) = result;
    if (result)
    {
      uint64_t v9 = (*(uint64_t (**)(AppleH15IO *))(*(void *)this + 888))(this);
      (*(void (**)(uint64_t, void))(*(void *)v9 + 160))(v9, *((void *)this + 27));
      if ((*(uint64_t (**)(void))(**((void **)this + 18) + 280))()) {
        *((unsigned char *)this + 236) = 1;
      }
      if ((*(uint64_t (**)(void, const char *))(**((void **)this + 18) + 280))(*((void *)this + 18), "no-power-gate"))
      {
        *((unsigned char *)this + 237) = 1;
      }
      uint64_t v10 = ((uint64_t (*)(IOService *, void, void))a2->mapDeviceMemoryWithIndex)(a2, 0, 0);
      *((void *)this + 32) = v10;
      if (v10)
      {
        *((void *)this + 33) = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 120))(v10);
        uint64_t v11 = ((uint64_t (*)(IOService *, uint64_t, void))a2->mapDeviceMemoryWithIndex)(a2, 1, 0);
        *((void *)this + 34) = v11;
        if (v11)
        {
          *((void *)this + 35) = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 120))(v11);
          uint64_t v12 = *((void *)this + 33);
          IOPhysicalAddress PhysicalAddress = IOMemoryMap::getPhysicalAddress(*((IOMemoryMap **)this + 32));
          kprintf("start: this: %#lx, ACCE virt addr: %#lx, phys addr: %#lx\n", this, v12, PhysicalAddress);
          uint64_t v14 = *((void *)this + 35);
          IOPhysicalAddress v15 = IOMemoryMap::getPhysicalAddress(*((IOMemoryMap **)this + 34));
          kprintf("start: this: %#lx, ACCP virt addr: %#lx, phys addr: %#lx\n", this, v14, v15);
          AppleARMFunction::registerFunctionParent((AppleARMFunction *)a2, (IOService *)this, v16);
          (*(void (**)(AppleH15IO *, IOService *))(*(void *)this + 1424))(this, a2);
          if (!*((unsigned char *)this + 236))
          {
            uint64_t v18 = AppleARMFunction::withProvider(*((AppleARMFunction **)this + 18), (IORegistryEntry *)"function-clock_gate", v17);
            *((void *)this + 30) = v18;
            if (!v18) {
              AppleH15IO::start();
            }
            (*(void (**)(void, void, void, char *, void, void))(**((void **)this + 27) + 232))(*((void *)this + 27), *((void *)this + 28), 0, (char *)this + 240, 0, 0);
          }
          if (!*((unsigned char *)this + 237))
          {
            uint64_t v19 = AppleARMFunction::withProvider(*((AppleARMFunction **)this + 18), (IORegistryEntry *)"function-power_gate", v17);
            *((void *)this + 31) = v19;
            if (!v19) {
              AppleH15IO::start();
            }
            (*(void (**)(void, void, void, char *, void, void))(**((void **)this + 27) + 232))(*((void *)this + 27), *((void *)this + 28), 0, (char *)this + 248, 0, 0);
          }
          v20 = (AppleARM64ErrorHandler *)AppleARM64ErrorHandler::operator new((AppleARM64ErrorHandler *)&stru_20.vmaddr);
          AppleARM64ErrorHandler::AppleARM64ErrorHandler(v20);
          *((void *)this + 23) = v21;
          if (!v21) {
            AppleH15IO::start();
          }
          (*(void (**)(AppleH15IO *, void))(*(void *)this + 672))(this, 0);
          return (IOCommandGate *)(&dword_0 + 1);
        }
        kprintf("start: failed to get accp_impl register map\n");
      }
      else
      {
        kprintf("start: failed to get acce_impl register map\n");
      }
      return 0;
    }
  }
  return result;
}

uint64_t AppleH15IO::_waitGate(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    while (!*a2)
      (*(void (**)(void, void *, void))(**(void **)(a1 + 216) + 256))(*(void *)(a1 + 216), a2, 0);
    return 0;
  }
  if (a3)
  {
    (*(void (**)(void, uint64_t, void))(**(void **)(a1 + 216) + 264))(*(void *)(a1 + 216), a3, 0);
    return 0;
  }
  return 3758097090;
}

uint64_t AppleH15IO::callPlatformFunction(AppleH15IO *this, const OSSymbol *a2, uint64_t a3, void *a4, void *a5, OSMetaClassBase *anObject, void *a7)
{
  if ((const OSSymbol *)gAppleARMFunctionNew == a2)
  {
    IOPhysicalAddress v15 = OSMetaClassBase::safeMetaCast(anObject, OSData::metaClass);
    if (!v15) {
      return 3758097090;
    }
    if (*(_DWORD *)(((uint64_t (*)(OSMetaClassBase *))v15->__vftable[2].~OSMetaClassBase_0)(v15) + 4) == 1165128264)
    {
      uint64_t result = 0;
      *a7 = *((void *)this + 23);
      return result;
    }
  }
  else if (gIOPlatformActiveActionKey == a2)
  {
    return 0;
  }

  return ((uint64_t (*)(AppleH15IO *, const OSSymbol *, uint64_t, void *, void *, OSMetaClassBase *, void *))v16)(this, a2, a3, a4, a5, anObject, a7);
}

uint64_t AppleH15IO::isDMACoherent(AppleH15IO *this, IOService *a2)
{
  return 1;
}

uint64_t AppleH15IO::processDevice(AppleH15IO *this, IOService *a2)
{
}

uint64_t AppleH15IO::enableDeviceClock(AppleH15IO *this)
{
  if (*((unsigned char *)this + 236)) {
    return 3758097095;
  }
  v4 = (char *)this + 240;
  uint64_t v3 = *((void *)this + 30);
  if (!v3)
  {
    (*(void (**)(void, void, char *, void, void, void))(**((void **)this + 27) + 232))(*((void *)this + 27), *((void *)this + 28), v4, 0, 0, 0);
    uint64_t v3 = *((void *)this + 30);
  }
  v5 = *(uint64_t (**)(void))(*(void *)v3 + 128);

  return v5();
}

uint64_t AppleH15IO::enableDevicePower(AppleH15IO *this, unsigned int a2, unsigned int a3, unsigned int *a4)
{
  if (*((unsigned char *)this + 237)) {
    return 3758097095;
  }
  int v7 = (char *)this + 248;
  uint64_t v6 = *((void *)this + 31);
  if (!v6)
  {
    (*(void (**)(void, void, char *, void, void, void))(**((void **)this + 27) + 232))(*((void *)this + 27), *((void *)this + 28), v7, 0, 0, 0);
    uint64_t v6 = *((void *)this + 31);
  }
  v8 = *(uint64_t (**)(void))(*(void *)v6 + 128);

  return v8();
}

OSMetaClass *_GLOBAL__sub_I_AppleH15IO_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&AppleH15IO::gMetaClass, "AppleH15IO", &AppleARMIO::gMetaClass, 0x120u);
  result->__vftable = (OSMetaClass_vtbl *)off_208D0;
  return result;
}

void global destructor keyed to'_a()
{
}

void AppleH15PlatformErrorHandler::_amccNonPlaneDecodeACTT(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, uint64_t a5)
{
  unsigned int v9 = *a4;
  long long v21 = off_22808;
  long long v22 = unk_22818;
  uint64_t v23 = 0;
  if (v9)
  {
    DWORD2(v21) = 0;
    uint64_t v10 = a1 + 8232;
    uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, 0x100448u);
    HIDWORD(v21) = Register32;
    uint64_t v12 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v10, a2, 0x10044Cu);
    LODWORD(v22) = v12;
    uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v12, v10, a2, 0x100450u);
    DWORD1(v22) = v13;
    uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v13, v10, a2, 0x100454u);
    DWORD2(v22) = v14;
    uint64_t v15 = AppleH15PlatformErrorHandler::_readRegister32(v14, v10, a2, 0x100458u);
    HIDWORD(v22) = v15;
    uint64_t v16 = AppleH15PlatformErrorHandler::_readRegister32(v15, v10, a2, 0x10045Cu);
    LODWORD(v23) = v16;
  }
  else
  {
    if ((v9 & 0x40) == 0)
    {
      if ((v9 & 0x2000) == 0) {
        panic("\"AMCC%u Non-Plane %s %s error: INTSTS%u 0x%08x\" @%s:%d", a2, "*UNKNOWN*", "ACTT", a3, *a4, "AppleH15PlatformErrorHandler.cpp", 1651);
      }
      panic("\"AMCC%u Non-Plane %s %s error: INTSTS%u 0x%08x\" @%s:%d", a2, *(const char **)(a5 + 8), "ACTT", a3, *a4, "AppleH15PlatformErrorHandler.cpp", 1647);
    }
    DWORD2(v21) = 1;
    uint64_t v17 = a1 + 8232;
    uint64_t v18 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, 0x100438u);
    HIDWORD(v21) = v18;
    uint64_t v19 = AppleH15PlatformErrorHandler::_readRegister32(v18, v17, a2, 0x10043Cu);
    LODWORD(v22) = v19;
    uint64_t v20 = AppleH15PlatformErrorHandler::_readRegister32(v19, v17, a2, 0x100440u);
    DWORD1(v22) = v20;
    uint64_t v16 = AppleH15PlatformErrorHandler::_readRegister32(v20, v17, a2, 0x100444u);
    DWORD2(v22) = v16;
  }
  AppleH15PlatformErrorHandler::_amccNonPlaneDecodeXCTT(v16, a2, a3, a4, a5, (const char **)&v21);
}

void AppleH15PlatformErrorHandler::_amccNonPlaneDecodeSCTT(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, uint64_t a5)
{
  unsigned int v9 = *a4;
  long long v21 = off_22880;
  long long v22 = *(_OWORD *)algn_22890;
  uint64_t v23 = 0;
  if ((v9 & 2) != 0)
  {
    DWORD2(v21) = 0;
    uint64_t v10 = a1 + 8232;
    uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, 0x100C78u);
    HIDWORD(v21) = Register32;
    uint64_t v12 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v10, a2, 0x100C7Cu);
    LODWORD(v22) = v12;
    uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v12, v10, a2, 0x100C80u);
    DWORD1(v22) = v13;
    uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v13, v10, a2, 0x100C84u);
    DWORD2(v22) = v14;
    uint64_t v15 = AppleH15PlatformErrorHandler::_readRegister32(v14, v10, a2, 0x100C88u);
    HIDWORD(v22) = v15;
    uint64_t v16 = AppleH15PlatformErrorHandler::_readRegister32(v15, v10, a2, 0x100C8Cu);
    LODWORD(v23) = v16;
  }
  else
  {
    if ((v9 & 0x80) == 0)
    {
      if ((v9 & 0x1000) == 0) {
        panic("\"AMCC%u Non-Plane %s %s error: INTSTS%u 0x%08x\" @%s:%d", a2, "*UNKNOWN*", "SCTT", a3, *a4, "AppleH15PlatformErrorHandler.cpp", 1792);
      }
      panic("\"AMCC%u Non-Plane %s %s error: INTSTS%u 0x%08x\" @%s:%d", a2, *(const char **)(a5 + 8), "SCTT", a3, *a4, "AppleH15PlatformErrorHandler.cpp", 1788);
    }
    DWORD2(v21) = 1;
    uint64_t v17 = a1 + 8232;
    uint64_t v18 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, 0x100C68u);
    HIDWORD(v21) = v18;
    uint64_t v19 = AppleH15PlatformErrorHandler::_readRegister32(v18, v17, a2, 0x100C6Cu);
    LODWORD(v22) = v19;
    uint64_t v20 = AppleH15PlatformErrorHandler::_readRegister32(v19, v17, a2, 0x100C70u);
    DWORD1(v22) = v20;
    uint64_t v16 = AppleH15PlatformErrorHandler::_readRegister32(v20, v17, a2, 0x100C74u);
    DWORD2(v22) = v16;
  }
  AppleH15PlatformErrorHandler::_amccNonPlaneDecodeXCTT(v16, a2, a3, a4, a5, (const char **)&v21);
}

void AppleH15PlatformErrorHandler::_amccNonPlaneDecodeGCTT0(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, uint64_t a5)
{
  long long v19 = off_22830;
  long long v20 = unk_22840;
  uint64_t v21 = 0;
  if (!a3)
  {
    if ((*a4 & 0x4008) != 0)
    {
      DWORD2(v19) = 0;
      uint64_t v8 = a1 + 8232;
      uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, 0x140848u);
      HIDWORD(v19) = Register32;
      uint64_t v10 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v8, a2, 0x14084Cu);
      LODWORD(v20) = v10;
      uint64_t v11 = AppleH15PlatformErrorHandler::_readRegister32(v10, v8, a2, 0x140850u);
      DWORD1(v20) = v11;
      uint64_t v12 = AppleH15PlatformErrorHandler::_readRegister32(v11, v8, a2, 0x140854u);
      DWORD2(v20) = v12;
      uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v12, v8, a2, 0x140858u);
      HIDWORD(v20) = v13;
      uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v13, v8, a2, 0x14085Cu);
      LODWORD(v21) = v14;
    }
    else
    {
      if ((*a4 & 0x200) == 0) {
        goto LABEL_4;
      }
      DWORD2(v19) = 1;
      uint64_t v15 = a1 + 8232;
      uint64_t v16 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, 0x140838u);
      HIDWORD(v19) = v16;
      uint64_t v17 = AppleH15PlatformErrorHandler::_readRegister32(v16, v15, a2, 0x14083Cu);
      LODWORD(v20) = v17;
      uint64_t v18 = AppleH15PlatformErrorHandler::_readRegister32(v17, v15, a2, 0x140840u);
      DWORD1(v20) = v18;
      uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v18, v15, a2, 0x140844u);
      DWORD2(v20) = v14;
    }
    AppleH15PlatformErrorHandler::_amccNonPlaneDecodeXCTT(v14, a2, 0, a4, a5, (const char **)&v19);
  }
LABEL_4:
  panic("\"AMCC%u Non-Plane %s %s error: INTSTS%u 0x%08x\" @%s:%d", a2, "*UNKNOWN*", "GCTT-0", a3, *a4, "AppleH15PlatformErrorHandler.cpp", 1687);
}

void AppleH15PlatformErrorHandler::_amccNonPlaneDecodeGCTT1(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, uint64_t a5)
{
  long long v19 = off_22858;
  long long v20 = unk_22868;
  uint64_t v21 = 0;
  if (!a3)
  {
    if ((*a4 & 0x8010) != 0)
    {
      DWORD2(v19) = 0;
      uint64_t v8 = a1 + 8232;
      uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, 0x140C48u);
      HIDWORD(v19) = Register32;
      uint64_t v10 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v8, a2, 0x140C4Cu);
      LODWORD(v20) = v10;
      uint64_t v11 = AppleH15PlatformErrorHandler::_readRegister32(v10, v8, a2, 0x140C50u);
      DWORD1(v20) = v11;
      uint64_t v12 = AppleH15PlatformErrorHandler::_readRegister32(v11, v8, a2, 0x140C54u);
      DWORD2(v20) = v12;
      uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v12, v8, a2, 0x140C58u);
      HIDWORD(v20) = v13;
      uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v13, v8, a2, 0x140C5Cu);
      LODWORD(v21) = v14;
    }
    else
    {
      if ((*a4 & 0x400) == 0) {
        goto LABEL_4;
      }
      DWORD2(v19) = 1;
      uint64_t v15 = a1 + 8232;
      uint64_t v16 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, 0x140C38u);
      HIDWORD(v19) = v16;
      uint64_t v17 = AppleH15PlatformErrorHandler::_readRegister32(v16, v15, a2, 0x140C3Cu);
      LODWORD(v20) = v17;
      uint64_t v18 = AppleH15PlatformErrorHandler::_readRegister32(v17, v15, a2, 0x140C40u);
      DWORD1(v20) = v18;
      uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v18, v15, a2, 0x140C44u);
      DWORD2(v20) = v14;
    }
    AppleH15PlatformErrorHandler::_amccNonPlaneDecodeXCTT(v14, a2, 0, a4, a5, (const char **)&v19);
  }
LABEL_4:
  panic("\"AMCC%u Non-Plane %s %s error: INTSTS%u 0x%08x\" @%s:%d", a2, "*UNKNOWN*", "GCTT-1", a3, *a4, "AppleH15PlatformErrorHandler.cpp", 1723);
}

void AppleH15PlatformErrorHandler::_amccNonPlaneDecodePoisonedData(uint64_t a1, int a2, int a3, _DWORD *a4, uint64_t a5)
{
}

void AppleH15PlatformErrorHandler::_amccNonPlanePanic(uint64_t a1, int a2, int a3, _DWORD *a4, uint64_t a5)
{
}

OSMetaClass *AppleH15PlatformErrorHandler::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleH15PlatformErrorHandler", &IOService::gMetaClass, 0x3960u);
  result->__vftable = (OSMetaClass_vtbl *)off_22380;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleH15PlatformErrorHandler", &IOService::gMetaClass, 0x3960u);
  result->__vftable = (OSMetaClass_vtbl *)off_22380;
  return result;
}

void AppleH15PlatformErrorHandler::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleH15PlatformErrorHandler::AppleH15PlatformErrorHandler(AppleH15PlatformErrorHandler *this, const OSMetaClass *a2)
{
  v2 = IOService::IOService((IOService *)this, a2);
  v2->__vftable = (IOService_vtbl *)off_21E28;
  LODWORD(v2[1].__vftable) = 0;
  LODWORD(v2[1].IORegistryEntry::reserved) = 0;
}

{
  IOService *v2;

  v2 = IOService::IOService((IOService *)this, a2);
  v2->__vftable = (IOService_vtbl *)off_21E28;
  LODWORD(v2[1].__vftable) = 0;
  LODWORD(v2[1].IORegistryEntry::reserved) = 0;
}

void AppleH15PlatformErrorHandler::~AppleH15PlatformErrorHandler(IOService *this)
{
}

{
  IOService::~IOService(this);
}

{
  uint64_t vars8;

  IOService::~IOService(this);

  _OSObject_typed_operator_delete(&AppleH15PlatformErrorHandler_ktv, this, 14688);
}

void AppleH15PlatformErrorHandler::operator delete(void *a1, uint64_t a2)
{
}

void *AppleH15PlatformErrorHandler::getMetaClass(AppleH15PlatformErrorHandler *this)
{
  return &AppleH15PlatformErrorHandler::gMetaClass;
}

IOService *AppleH15PlatformErrorHandler::MetaClass::alloc(AppleH15PlatformErrorHandler::MetaClass *this)
{
  v1 = (IOService *)OSObject_typed_operator_new();
  v2 = IOService::IOService(v1, &AppleH15PlatformErrorHandler::gMetaClass);
  v2->__vftable = (IOService_vtbl *)off_21E28;
  LODWORD(v2[1].__vftable) = 0;
  LODWORD(v2[1].IORegistryEntry::reserved) = 0;
  OSMetaClass::instanceConstructed(&AppleH15PlatformErrorHandler::gMetaClass);
  return v1;
}

uint64_t AppleH15PlatformErrorHandler::operator new(AppleH15PlatformErrorHandler *this)
{
  return OSObject_typed_operator_new();
}

void AppleH15PlatformErrorHandler::AppleH15PlatformErrorHandler(AppleH15PlatformErrorHandler *this)
{
  v1 = IOService::IOService((IOService *)this, &AppleH15PlatformErrorHandler::gMetaClass);
  v1->__vftable = (IOService_vtbl *)off_21E28;
  LODWORD(v1[1].__vftable) = 0;
  LODWORD(v1[1].IORegistryEntry::reserved) = 0;
  OSMetaClass::instanceConstructed(&AppleH15PlatformErrorHandler::gMetaClass);
}

{
  IOService *v1;

  v1 = IOService::IOService((IOService *)this, &AppleH15PlatformErrorHandler::gMetaClass);
  v1->__vftable = (IOService_vtbl *)off_21E28;
  LODWORD(v1[1].__vftable) = 0;
  LODWORD(v1[1].IORegistryEntry::reserved) = 0;
  OSMetaClass::instanceConstructed(&AppleH15PlatformErrorHandler::gMetaClass);
}

uint64_t AppleH15PlatformErrorHandler::init(AppleH15PlatformErrorHandler *this, OSDictionary *a2)
{
}

BOOL AppleH15PlatformErrorHandler::start(AppleH15PlatformErrorHandler *this, IOService *a2)
{
  *((void *)this + 20) = a2;
    AppleH15PlatformErrorHandler::start();
  v4 = OSMetaClassBase::safeMetaCast(a2, AppleARMIODevice::metaClass);
  *((void *)this + 21) = v4;
  if (v4)
  {
    *((unsigned char *)this + 141) = PE_i_can_has_debugger(0) != 0;
    v108[0] = 4;
    if (sysctlbyname("kern.development", (char *)this + 152, v108, 0, 0))
    {
      *((_DWORD *)this + 38) = 0;
      kprintf("%s::%s: Could not read sysctl kern.development!\n", "AppleH15PlatformErrorHandler", "start");
    }
    *((void *)this + 22) = 0;
    v5 = (const OSMetaClassBase *)((uint64_t (*)(IOService *, const char *))a2->getProperty_1)(a2, "error-reflector");
    uint64_t v6 = (const OSMetaClass *)OSData::metaClass;
    int v7 = OSMetaClassBase::safeMetaCast(v5, OSData::metaClass);
    if (v7)
    {
      uint64_t v8 = v7;
      if (((unsigned int (*)(OSMetaClassBase *))v7->__vftable[1].getMetaClass)(v7) == 8) {
        *((void *)this + 22) = *(void *)((uint64_t (*)(OSMetaClassBase *))v8->__vftable[2].~OSMetaClassBase_0)(v8);
      }
    }
    *((unsigned char *)this + 142) = 1;
    unsigned int v9 = (const OSMetaClassBase *)((uint64_t (*)(IOService *, const char *))a2->getProperty_1)(a2, "no-panic-on-corr-ecc-err");
    uint64_t v10 = OSMetaClassBase::safeMetaCast(v9, v6);
    *((unsigned char *)this + 144) = 0;
    PE_parse_boot_argn("no_panic_on_corr_ecc_err", (char *)this + 144, 1);
    if (v10 || *((unsigned char *)this + 144)) {
      *((unsigned char *)this + 142) = 0;
    }
    *((unsigned char *)this + 143) = 1;
    PE_parse_boot_argn("trueuc-irq-enable", (char *)this + 143, 1);
    if (*((unsigned char *)this + 143)) {
      kprintf("%s::%s: Enabling panics on True-UC violations\n", "AppleH15PlatformErrorHandler", "start");
    }
    *((unsigned char *)this + 145) = 0;
    uint64_t v11 = (const OSMetaClassBase *)((uint64_t (*)(IOService *, const char *))a2->getProperty_1)(a2, "disable-spll-interrupt");
    if (OSMetaClassBase::safeMetaCast(v11, v6))
    {
      *((unsigned char *)this + 145) = 1;
      kprintf("%s::%s: Disabling SPLL interrupts\n", "AppleH15PlatformErrorHandler", "start");
    }
    *((unsigned char *)this + 146) = 0;
    uint64_t v12 = (const OSMetaClassBase *)((uint64_t (*)(IOService *, const char *))a2->getProperty_1)(a2, "disable-inband-dsid-drop");
    if (OSMetaClassBase::safeMetaCast(v12, v6))
    {
      *((unsigned char *)this + 146) = 1;
      kprintf("%s::%s: Disabling Illegal DSID drop interrupt\n", "AppleH15PlatformErrorHandler", "start");
    }
    *((unsigned char *)this + 147) = 0;
    PE_parse_boot_argn("disable-sram-parity-error-panic", (char *)this + 147, 1);
    service = (uint64_t)this;
    int PropertyCount = AppleH15PlatformErrorHandler::_getPropertyCount(this, "reg", 0x10uLL);
    *((_DWORD *)this + 46) = PropertyCount;
    if (!PropertyCount) {
      AppleH15PlatformErrorHandler::start();
    }
    v62 = v6;
    v63 = (AppleARMFunction *)a2;
    int v14 = AppleH15PlatformErrorHandler::_getPropertyCount(this, "interrupts", 4uLL);
    *((_DWORD *)this + 47) = v14;
    if (!v14) {
      AppleH15PlatformErrorHandler::start();
    }
    *((_DWORD *)this + 48) = 0;
    *(_OWORD *)((char *)this + 824) = 0u;
    *(_OWORD *)((char *)this + 840) = 0u;
    *(_OWORD *)((char *)this + 856) = 0u;
    *(_OWORD *)((char *)this + 872) = 0u;
    *(_OWORD *)((char *)this + 888) = 0u;
    *(_OWORD *)((char *)this + 904) = 0u;
    *(_OWORD *)((char *)this + 920) = 0u;
    *(_OWORD *)((char *)this + 936) = 0u;
    *(_OWORD *)((char *)this + 952) = 0u;
    *(_OWORD *)((char *)this + 968) = 0u;
    *(_OWORD *)((char *)this + 984) = 0u;
    *(_OWORD *)((char *)this + 1000) = 0u;
    *(_OWORD *)((char *)this + 1016) = 0u;
    (*(void (**)(void))(**((void **)this + 21) + 1384))();
    v107 = (_DWORD *)((char *)this + 532);
    BOOL Metadata = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 532, "amcc-metadata", 0x10u, 0);
    BOOL v93 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 700, "dcs-metadata", 0, 0);
    v106 = (_DWORD *)((char *)this + 724);
    BOOL v91 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 724, "ioa-metadata", 0x10u, 0);
    BOOL v89 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 748, "pmgr-metadata", 4u, 0);
    v104 = (_DWORD *)((char *)this + 772);
    BOOL v87 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 772, "sep-metadata", 2u, 0);
    v97 = (_DWORD *)((char *)this + 796);
    BOOL v85 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 796, "sram-metadata", 5u, 1);
    v105 = (_DWORD *)((char *)this + 268);
    BOOL v83 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 268, "ni0-metadata", 0x10u, 0);
    BOOL v81 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 292, "ni1-metadata", 6u, 1);
    v103 = (_DWORD *)((char *)this + 316);
    BOOL v79 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 316, "ni2-metadata", 6u, 0);
    BOOL v77 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 340, "ni3-metadata", 4u, 1);
    BOOL v75 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 364, "ni4-metadata", 8u, 1);
    BOOL v73 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 388, "ni5-metadata", 0x10u, 1);
    BOOL v71 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 412, "ni6-metadata", 0x10u, 1);
    v102 = (_DWORD *)((char *)this + 436);
    BOOL v69 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 436, "ni7-metadata", 0x10u, 0);
    v101 = (_DWORD *)((char *)this + 460);
    BOOL v67 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 460, "ni8-metadata", 0x10u, 0);
    BOOL v65 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 484, "ni9-metadata", 4u, 1);
    BOOL v64 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 508, "ni10-metadata", 4u, 1);
    v100 = (_DWORD *)((char *)this + 196);
    BOOL v15 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 196, "nsc-metadata", 0xCu, 0);
    v99 = (_DWORD *)((char *)this + 220);
    BOOL v16 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 220, "nsi-metadata", 0x24u, 0);
    v98 = (_DWORD *)((char *)this + 244);
    BOOL v17 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 244, "nsr-metadata", 0x14u, 1);
    BOOL v18 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 556, "d2dc-metadata", 4u, 1);
    BOOL v19 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 580, "d2di-metadata", 4u, 1);
    BOOL v20 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 604, "d2dr-metadata", 4u, 1);
    BOOL v21 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 652, "giba-metadata", 0x20u, 1);
    BOOL v22 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 628, "gibm-metadata", 4u, 1);
    BOOL v23 = AppleH15PlatformErrorHandler::_getMetadata((uint64_t)this, (uint64_t)this + 676, "gibd-metadata", 8u, 1);
    if (Metadata
      || v93
      || v91
      || v89
      || v87
      || v85
      || v83
      || v81
      || v79
      || v77
      || v75
      || v73
      || v71
      || v69
      || v67
      || v65
      || v64
      || v15
      || v16
      || v17
      || v18
      || v19
      || v20
      || v21
      || v22
      || v23)
    {
      AppleH15PlatformErrorHandler::start();
    }
    char NsApertureNames = AppleH15PlatformErrorHandler::_getNsApertureNames(this, "afc", (unsigned int *)this + 3328, 0xCu, 0);
    char v25 = AppleH15PlatformErrorHandler::_getNsApertureNames(this, "afi", (unsigned int *)this + 3340, 0x24u, 0);
    int v26 = AppleH15PlatformErrorHandler::_getNsApertureNames(this, "afr", (unsigned int *)this + 3376, 0x14u, 1);
    if ((NsApertureNames & 1) != 0 || (v25 & 1) != 0 || v26) {
      AppleH15PlatformErrorHandler::start();
    }
    v61 = v4;
    char v96 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v107, (uint64_t)this + 8232, 0x10u);
    char v94 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v106, (uint64_t)this + 12232, 0x10u);
    char v92 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 187, (uint64_t)this + 12872, 4u);
    char v90 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v104, (uint64_t)this + 13032, 2u);
    char v88 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v97, (uint64_t)this + 13112, 5u);
    char v86 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v105, (uint64_t)this + 3752, 0x10u);
    char v84 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 73, (uint64_t)this + 4392, 6u);
    char v82 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v103, (uint64_t)this + 4632, 6u);
    char v80 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 85, (uint64_t)this + 4872, 4u);
    char v78 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 91, (uint64_t)this + 5032, 8u);
    char v76 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 97, (uint64_t)this + 5352, 0x10u);
    char v74 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 103, (uint64_t)this + 5992, 0x10u);
    char v72 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v102, (uint64_t)this + 6632, 0x10u);
    char v70 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v101, (uint64_t)this + 7272, 0x10u);
    char v68 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 121, (uint64_t)this + 7912, 4u);
    char v66 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 127, (uint64_t)this + 8072, 4u);
    char v27 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v100, (uint64_t)this + 1032, 0xCu);
    char v28 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v99, (uint64_t)this + 1512, 0x24u);
    char v29 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, v98, (uint64_t)this + 2952, 0x14u);
    char v30 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 139, (uint64_t)this + 8872, 4u);
    char v31 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 145, (uint64_t)this + 9032, 4u);
    char v32 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 151, (uint64_t)this + 9192, 4u);
    char v33 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 163, (uint64_t)this + 10632, 0x20u);
    char v34 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 157, (uint64_t)this + 9352, 4u);
    int v35 = AppleH15PlatformErrorHandler::_mapApertures((uint64_t)this, (_DWORD *)this + 169, (uint64_t)this + 11912, 8u);
    if ((v96 & 1) != 0
      || (v94 & 1) != 0
      || (v92 & 1) != 0
      || (v90 & 1) != 0
      || (v88 & 1) != 0
      || (v86 & 1) != 0
      || (v84 & 1) != 0
      || (v82 & 1) != 0
      || (v80 & 1) != 0
      || (v78 & 1) != 0
      || (v76 & 1) != 0
      || (v74 & 1) != 0
      || (v72 & 1) != 0
      || (v70 & 1) != 0
      || (v68 & 1) != 0
      || (v66 & 1) != 0
      || (v27 & 1) != 0
      || (v28 & 1) != 0
      || (v29 & 1) != 0
      || (v30 & 1) != 0
      || (v31 & 1) != 0
      || (v32 & 1) != 0
      || (v33 & 1) != 0
      || (v34 & 1) != 0
      || v35)
    {
      AppleH15PlatformErrorHandler::start();
    }
    *((void *)this + 1700) = (char *)this + 3752;
    *((_DWORD *)this + 3402) = *((_DWORD *)this + 69);
    *((void *)this + 1704) = (char *)this + 4632;
    *((_DWORD *)this + 3410) = *((_DWORD *)this + 81);
    *((void *)this + 1714) = (char *)this + 6632;
    *((_DWORD *)this + 3430) = *((_DWORD *)this + 111);
    *((void *)this + 1716) = (char *)this + 7272;
    *((_DWORD *)this + 3434) = *((_DWORD *)this + 117);
    int v36 = AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v107, (uint64_t)AppleH15PlatformErrorHandler::_amccHandleInterrupt, 0);
    int v37 = v36 | AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, (_DWORD *)this + 175, (uint64_t)AppleH15PlatformErrorHandler::_dcsHandleInterrupt, 0);
    int v38 = AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v106, (uint64_t)AppleH15PlatformErrorHandler::_ioaHandleInterrupt, 0);
    int v39 = v37 | v38 | AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v104, (uint64_t)AppleH15PlatformErrorHandler::_sepHandleInterrupt, 0);
    if (!*((unsigned char *)this + 147)) {
      LOBYTE(v39) = v39 | AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v97, (uint64_t)AppleH15PlatformErrorHandler::_sramHandleInterrupt, 0);
    }
    char v40 = AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v105, (uint64_t)AppleH15PlatformErrorHandler::_afxNiHandleInterrupt, (uint64_t)&AppleH15PlatformErrorHandler::_afxNi0Decoder);
    char v41 = AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v103, (uint64_t)AppleH15PlatformErrorHandler::_afxNiHandleInterrupt, (uint64_t)&AppleH15PlatformErrorHandler::_afxNi2Decoder);
    char v42 = AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v102, (uint64_t)AppleH15PlatformErrorHandler::_afxNiHandleInterrupt, (uint64_t)&AppleH15PlatformErrorHandler::_afxNi7Decoder);
    char v43 = AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v101, (uint64_t)AppleH15PlatformErrorHandler::_afxNiHandleInterrupt, (uint64_t)&AppleH15PlatformErrorHandler::_afxNi8Decoder);
    char v44 = AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v100, (uint64_t)AppleH15PlatformErrorHandler::_afxNsHandleInterrupt, (uint64_t)AppleH15PlatformErrorHandler::_afcNsDecoder);
    char v45 = AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v99, (uint64_t)AppleH15PlatformErrorHandler::_afxNsHandleInterrupt, (uint64_t)AppleH15PlatformErrorHandler::_afiNsDecoder);
    int v46 = AppleH15PlatformErrorHandler::_registerInterrupts((uint64_t)this, v98, (uint64_t)AppleH15PlatformErrorHandler::_afxNsHandleInterrupt, (uint64_t)&AppleH15PlatformErrorHandler::_afrNsDecoder);
    if ((v39 & 1) != 0
      || (v40 & 1) != 0
      || (v41 & 1) != 0
      || (v42 & 1) != 0
      || (v43 & 1) != 0
      || (v44 & 1) != 0
      || (v45 & 1) != 0
      || v46)
    {
      AppleH15PlatformErrorHandler::start();
    }
    AppleH15PlatformErrorHandler::_amccGenerateEnableMask(this);
    AppleH15PlatformErrorHandler::_dcsGenerateEnableMask((uint64_t)this);
    uint64_t v47 = 0;
    *((void *)this + 1782) = 523775;
    char v48 = 1;
    v4 = v61;
    do
    {
      char v49 = v48;
      uint64_t v50 = *((void *)&AppleH15PlatformErrorHandler::_afxNi0Decoder + 5 * v47 + 4);
      uint64_t v51 = *(void *)(v50 + 8);
      if (v51)
      {
        uint64_t v52 = 0;
        LODWORD(v51) = 0;
        unsigned int v53 = 1;
        do
        {
          LODWORD(v51) = *(_DWORD *)(v50 + 16 * v52) | v51;
          uint64_t v52 = v53;
        }
        while (*(void *)(v50 + 16 * v53++ + 8));
      }
      char v48 = 0;
      *((_DWORD *)this + v47 + 3396) = v51;
      uint64_t v47 = 1;
    }
    while ((v49 & 1) != 0);
    AppleH15PlatformErrorHandler::_amccEnableErrors(this, 1);
    AppleH15PlatformErrorHandler::_dcsEnableErrors(this, 1);
    AppleH15PlatformErrorHandler::_ioaEnableErrors(this, 1);
    AppleH15PlatformErrorHandler::_afxNiEnableErrors(this, 1);
    AppleH15PlatformErrorHandler::_afcNsDisableErrors(this, 1);
    AppleH15PlatformErrorHandler::_afiNsDisableErrors(this, 1);
    AppleH15PlatformErrorHandler::_enableInterrupts((uint64_t)this, 1);
    (*(void (**)(void))(**((void **)this + 21) + 1384))();
    AppleARMFunction::registerFunctionParent(v63, (IOService *)this, v55);
    (*(void (**)(AppleH15PlatformErrorHandler *, uint64_t))(*(void *)this + 672))(this, 2);
    *((void *)this + 1756) = 0;
    v56 = IOService::getPMRootDomain()->__vftable;
    v57 = (const OSMetaClassBase *)((uint64_t (*)(void))v56->getProperty_1)();
    v58 = OSMetaClassBase::safeMetaCast(v57, v62);
    if (v58)
    {
      v59 = v58;
      if (((unsigned int (*)(OSMetaClassBase *))v58->__vftable[1].getMetaClass)(v58) == 4) {
        *((void *)this + 1756) = ((uint64_t (*)(OSMetaClassBase *))v59->__vftable[2].~OSMetaClassBase_0)(v59);
      }
    }
  }
  return v4 != 0;
}

uint64_t AppleH15PlatformErrorHandler::_getPropertyCount(AppleH15PlatformErrorHandler *this, const char *a2, unint64_t a3)
{
  v4 = (const OSMetaClassBase *)(*(uint64_t (**)(void, const char *))(**((void **)this + 20) + 280))(*((void *)this + 20), a2);
  uint64_t result = (uint64_t)OSMetaClassBase::safeMetaCast(v4, OSData::metaClass);
  if (result)
  {
    unsigned int v6 = (*(uint64_t (**)(uint64_t))(*(void *)result + 160))(result);
    uint64_t result = v6 / a3;
    if (result * a3 != v6) {
      AppleH15PlatformErrorHandler::_getPropertyCount();
    }
  }
  return result;
}

BOOL AppleH15PlatformErrorHandler::_getMetadata(uint64_t a1, uint64_t a2, const char *a3, unsigned int a4, char a5)
{
  unsigned int v9 = (_DWORD *)a1;
  uint64_t v10 = (const OSMetaClassBase *)(*(uint64_t (**)(void, const char *))(**(void **)(a1 + 160) + 280))(*(void *)(a1 + 160), a3);
  uint64_t v11 = OSMetaClassBase::safeMetaCast(v10, OSData::metaClass);
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = ((uint64_t (*)(OSMetaClassBase *))v11->__vftable[1].getMetaClass)(v11);
    int v14 = v12->__vftable;
    if (v13 != 24)
    {
      ((void (*)(OSMetaClassBase *))v14[1].getMetaClass)(v12);
      kprintf("%s::%s: '%s' property length is %d expected %lu\n");
      return 1;
    }
    uint64_t v15 = ((uint64_t (*)(OSMetaClassBase *))v14[2].~OSMetaClassBase_0)(v12);
    unsigned int v16 = *(_DWORD *)(v15 + 4);
    unsigned int v40 = *(_DWORD *)v15;
    unsigned int v17 = *(_DWORD *)(v15 + 8);
    unsigned int v18 = *(_DWORD *)(v15 + 12);
    uint64_t v38 = *(void *)(v15 + 16);
    BOOL v19 = v17 > a4;
    if (v17 > a4) {
      kprintf("%s::%s: %16s: 'reg' property count (%u) exceeds max %u\n", "AppleH15PlatformErrorHandler", "_getMetadata", a3, v17, a4);
    }
    unsigned int v20 = v9[46];
    if (v16 >= v20 || v17 + v16 > v20)
    {
      kprintf("%s::%s: %s: regIndex(%u) regCount(%u) exceeds _regCount(%u)\n", "AppleH15PlatformErrorHandler", "_getMetadata", a3, v16, v17, v20);
      BOOL v19 = 1;
    }
    if (!strcmp(a3, "amcc-metadata")) {
      v9[34] = v17;
    }
    unsigned int v22 = v9[47];
    unsigned int v23 = v38 + v18;
    if (v18 >= v22 || v23 > v22)
    {
      kprintf("%s::%s: %s: irqIndex(%u) irqCount(%u) exceeds _irqCount(%u)\n", "AppleH15PlatformErrorHandler", "_getMetadata", a3, v18, v38, v22);
      BOOL v19 = 1;
    }
    if (v9[48])
    {
      uint64_t v37 = a2;
      unint64_t v25 = 0;
      uint64_t v26 = HIBYTE(v40);
      int v39 = v9;
      char v27 = v9 + 206;
      unsigned int v28 = v17 + v16;
      do
      {
        char v29 = *(_DWORD **)&v27[2 * v25];
        if (v40 == *v29)
        {
          kprintf("%s::%s: Duplicate metadata type: %c%c%c%c\n", "AppleH15PlatformErrorHandler", "_getMetadata", v26, BYTE2(v40), BYTE1(v40), v40);
          unsigned int v28 = v17 + v16;
          char v29 = *(_DWORD **)&v27[2 * v25];
          BOOL v19 = 1;
        }
        unsigned int v30 = v29[1];
        if (v16 >= v30 && (unsigned int v31 = v29[2] + v30, v16 < v31) || v28 > v30 && (unsigned int v31 = v29[2] + v30, v28 <= v31))
        {
          kprintf("%s::%s: %c%c%c%c reg range[%u,%u) overlaps %c%c%c%c reg range [%u,%u)\n", "AppleH15PlatformErrorHandler", "_getMetadata", v26, BYTE2(v40), BYTE1(v40), v40, v16, v28, HIBYTE(*v29), BYTE2(*v29), BYTE1(*v29), *v29, v30, v31);
          unsigned int v28 = v17 + v16;
          char v29 = *(_DWORD **)&v27[2 * v25];
          BOOL v19 = 1;
        }
        unsigned int v32 = v29[3];
        if (v18 >= v32 && (unsigned int v33 = v29[4] + v32, v18 < v33) || v23 > v32 && (unsigned int v33 = v29[4] + v32, v23 <= v33))
        {
          kprintf("%s::%s: %c%c%c%c irq range[%u,%u) overlaps %c%c%c%c irq range [%u,%u)\n", "AppleH15PlatformErrorHandler", "_getMetadata", v26, BYTE2(v40), BYTE1(v40), v40, v18, v23, HIBYTE(*v29), BYTE2(*v29), BYTE1(*v29), *v29, v32, v33);
          unsigned int v28 = v17 + v16;
          BOOL v19 = 1;
        }
        ++v25;
        unint64_t v34 = v39[48];
      }
      while (v25 < v34);
      a2 = v37;
      unsigned int v9 = v39;
      if (v34 > 0x19)
      {
        kprintf("%s::%s: Too many metadata instances (MAX=%d): %c%c%c%c\n");
        return 1;
      }
    }
    *(_DWORD *)a2 = v40;
    *(_DWORD *)(a2 + 4) = v16;
    *(_DWORD *)(a2 + 8) = v17;
    *(_DWORD *)(a2 + 12) = v18;
    *(void *)(a2 + 16) = v38;
    uint64_t v35 = v9[48];
    v9[48] = v35 + 1;
    *(void *)&v9[2 * v35 + 206] = a2;
  }
  else
  {
    if ((a5 & 1) == 0)
    {
      kprintf("%s::%s: '%s' property not present\n");
      return 1;
    }
    return 0;
  }
  return v19;
}

uint64_t AppleH15PlatformErrorHandler::_getNsApertureNames(AppleH15PlatformErrorHandler *this, const char *a2, unsigned int *a3, unsigned int a4, int a5)
{
  *(void *)__str = 0;
  uint64_t v19 = 0;
  uint64_t v5 = a4 >> 1;
  if (a4 != 2 * v5) {
    AppleH15PlatformErrorHandler::_getNsApertureNames();
  }
  snprintf(__str, 0x10uLL, "%s-ns-names", a2);
  unsigned int v9 = (const OSMetaClassBase *)(*(uint64_t (**)(void))(**((void **)this + 20) + 280))();
  uint64_t v10 = OSMetaClassBase::safeMetaCast(v9, OSData::metaClass);
  if (v10)
  {
    uint64_t v11 = v10;
    unsigned int v12 = ((uint64_t (*)(OSMetaClassBase *))v10->__vftable[1].getMetaClass)(v10);
    unint64_t v13 = v12;
    if (4 * v5 >= (unint64_t)v12)
    {
      uint64_t v15 = (unsigned int *)((uint64_t (*)(OSMetaClassBase *))v11->__vftable[2].~OSMetaClassBase_0)(v11);
      if (v13 >= 4)
      {
        if (v13 >> 2 <= 1) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v13 >> 2;
        }
        do
        {
          *a3 = *v15;
          unsigned int v17 = *v15++;
          a3[v13 >> 2] = v17;
          ++a3;
          --v16;
        }
        while (v16);
      }
      return 0;
    }
    else
    {
      kprintf("%s::%s: Unexpected %s property length: expected %u actual %u\n", "AppleH15PlatformErrorHandler", "_getNsApertureNames", __str, 4 * v5, v12);
      return 1;
    }
  }
  else
  {
    kprintf("%s::%s: Missing %s property\n", "AppleH15PlatformErrorHandler", "_getNsApertureNames", __str);
    return a5 ^ 1u;
  }
}

uint64_t AppleH15PlatformErrorHandler::_mapApertures(uint64_t a1, _DWORD *a2, uint64_t a3, unsigned int a4)
{
  unsigned int v4 = a2[2];
  if (v4 > a4) {
    AppleH15PlatformErrorHandler::_mapApertures();
  }
  if (v4)
  {
    unint64_t v7 = 0;
    char v8 = 0;
    unsigned int v9 = (void *)(a3 + 16);
    do
    {
      uint64_t v10 = (*(uint64_t (**)(void, void, void))(**(void **)(a1 + 160) + 976))(*(void *)(a1 + 160), (v7 + a2[1]), 0);
      *(v9 - 1) = v10;
      if (v10)
      {
        *unsigned int v9 = (*(uint64_t (**)(uint64_t))(*(void *)v10 + 120))(v10);
        v9[1] = IOMemoryMap::getPhysicalAddress((IOMemoryMap *)*(v9 - 1));
        v9[2] = (*(uint64_t (**)(void))(*(void *)*(v9 - 1) + 136))(*(v9 - 1));
        *(v9 - 2) = a2;
      }
      else
      {
        kprintf("%s::%s: Failed to map %c%c%c%c aperture %u\n", "AppleH15PlatformErrorHandler", "_mapApertures", HIBYTE(*a2), BYTE2(*a2), BYTE1(*a2), *a2, v7);
        char v8 = 1;
      }
      ++v7;
      v9 += 5;
    }
    while (v7 < a2[2]);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

uint64_t AppleH15PlatformErrorHandler::_registerInterrupts(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  if (a2[4])
  {
    char v8 = 0;
    unsigned int v9 = 0;
    do
    {
      if ((*(unsigned int (**)(void, void, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 160) + 1000))(*(void *)(a1 + 160), v9 + a2[3], a1, a3, a4))
      {
        kprintf("%s::%s: Failed to register %c%c%c%c interrupt %u\n", "AppleH15PlatformErrorHandler", "_registerInterrupts", HIBYTE(*a2), BYTE2(*a2), BYTE1(*a2), *a2, v9 + a2[3]);
        char v8 = 1;
      }
      ++v9;
    }
    while (v9 < a2[4]);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

void AppleH15PlatformErrorHandler::_amccHandleInterrupt(const OSMetaClassBase *this, OSObject *a2, void *a3, IOService *a4)
{
  int v4 = (int)a4;
  uint64_t v5 = OSMetaClassBase::safeMetaCast(this, &AppleH15PlatformErrorHandler::gMetaClass);
  if (!v5) {
    AppleH15PlatformErrorHandler::_amccHandleInterrupt();
  }

  AppleH15PlatformErrorHandler::_amccDecodeInterrupts((AppleH15PlatformErrorHandler *)v5, v4, v6);
}

uint64_t AppleH15PlatformErrorHandler::_dcsHandleInterrupt(const OSMetaClassBase *this, OSObject *a2, void *a3, IOService *a4)
{
  int v4 = (int)a4;
  uint64_t v5 = OSMetaClassBase::safeMetaCast(this, &AppleH15PlatformErrorHandler::gMetaClass);
  if (!v5) {
    AppleH15PlatformErrorHandler::_dcsHandleInterrupt();
  }

  return AppleH15PlatformErrorHandler::_dcsDecodeInterrupts((uint64_t)v5, v4, v6);
}

uint64_t AppleH15PlatformErrorHandler::_ioaHandleInterrupt(const OSMetaClassBase *this, OSObject *a2, void *a3, IOService *a4)
{
  int v4 = (int)a4;
  uint64_t v5 = OSMetaClassBase::safeMetaCast(this, &AppleH15PlatformErrorHandler::gMetaClass);
  if (!v5) {
    AppleH15PlatformErrorHandler::_ioaHandleInterrupt();
  }

  return AppleH15PlatformErrorHandler::_ioaDecodeInterrupts((AppleH15PlatformErrorHandler *)v5, v4, v6);
}

void AppleH15PlatformErrorHandler::_sepHandleInterrupt(const OSMetaClassBase *this, OSObject *a2, void *a3, IOService *a4)
{
  int v4 = (int)a4;
  unsigned int v6 = OSMetaClassBase::safeMetaCast(this, &AppleH15PlatformErrorHandler::gMetaClass);
  if (!v6) {
    panic("\"%s::%s: REQUIRE failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_sepHandleInterrupt", "AppleH15PlatformErrorHandler.cpp", 4680);
  }
  AppleH15PlatformErrorHandler::_sepDecodeInterrupts((AppleH15PlatformErrorHandler *)v6, v4, a2);
}

OSMetaClassBase *AppleH15PlatformErrorHandler::_sramHandleInterrupt(const OSMetaClassBase *this, OSObject *a2, void *a3, IOService *a4)
{
  uint64_t result = OSMetaClassBase::safeMetaCast(this, &AppleH15PlatformErrorHandler::gMetaClass);
  if (!result) {
    AppleH15PlatformErrorHandler::_sramHandleInterrupt();
  }
  return result;
}

uint64_t AppleH15PlatformErrorHandler::_afxNiHandleInterrupt(const OSMetaClassBase *this, OSObject *a2, void *a3, IOService *a4)
{
  int v4 = (int)a4;
  unsigned int v6 = OSMetaClassBase::safeMetaCast(this, &AppleH15PlatformErrorHandler::gMetaClass);
  if (!v6) {
    AppleH15PlatformErrorHandler::_afxNiHandleInterrupt();
  }

  return AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts((uint64_t)v6, v4, a2);
}

uint64_t AppleH15PlatformErrorHandler::_afxNsHandleInterrupt(const OSMetaClassBase *this, OSObject *a2, void *a3, IOService *a4)
{
  int v4 = (int)a4;
  unsigned int v6 = OSMetaClassBase::safeMetaCast(this, &AppleH15PlatformErrorHandler::gMetaClass);
  if (!v6) {
    AppleH15PlatformErrorHandler::_afxNsHandleInterrupt();
  }

  return AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts((AppleH15PlatformErrorHandler *)v6, v4, a2);
}

void AppleH15PlatformErrorHandler::_amccGenerateEnableMask(AppleH15PlatformErrorHandler *this)
{
  uint64_t v2 = 0;
  *((void *)this + 1757) = 0;
  do
  {
    AppleH15PlatformErrorHandler::_amccGenerateEnableMaskforInputTable((uint64_t)this, (uint64_t)&AppleH15PlatformErrorHandler::_amccNonPlaneDecoders + v2);
    v2 += 32;
  }
  while (v2 != 128);
  AppleH15PlatformErrorHandler::_amccGenerateEnableMaskforInputTable((uint64_t)this, (uint64_t)AppleH15PlatformErrorHandler::_amccNonPlaneDecoders_EFL);
  AppleH15PlatformErrorHandler::_amccGenerateEnableMaskforInputTable(v3, (uint64_t)dword_181C0);
  uint64_t v4 = 0;
  int v5 = *((unsigned __int8 *)this + 146);
  do
  {
    uint64_t v6 = AppleH15PlatformErrorHandler::_amccPlaneDecoders[6 * v4 + 2];
    if (v6)
    {
      int v7 = 0;
      int v8 = 0;
      uint64_t v9 = *(void *)&AppleH15PlatformErrorHandler::_amccPlaneDecoders[6 * v4 + 4];
      do
      {
        int v10 = *(_DWORD *)(v9 + 4);
        uint64_t v11 = *(void *)(v9 + 16);
        if (*(void *)(v9 + 24)) {
          BOOL v12 = (*(void *)(v9 + 24) & 1 | v11) == 0;
        }
        else {
          BOOL v12 = 1;
        }
        BOOL v14 = !v12 || v11 != 0;
        if (v4 == 1 && v10 == 256)
        {
          BOOL v14 = *((unsigned char *)this + 143) != 0;
          *((void *)this + 1757) = v9;
        }
        BOOL v15 = !v14;
        if (v14) {
          int v16 = v10;
        }
        else {
          int v16 = 0;
        }
        v8 |= v16;
        if (!v15) {
          int v10 = 0;
        }
        v7 |= v10;
        v9 += 32;
        --v6;
      }
      while (v6);
    }
    else
    {
      int v8 = 0;
      int v7 = 0;
    }
    unsigned int v17 = &AppleH15PlatformErrorHandler::_amccPlaneDecoders[6 * v4];
    int *v17 = v8;
    v17[1] = v7;
    if (v5)
    {
      v17[1] = v7 | 0x80;
      int *v17 = v8 & 0xFFFFFF7F;
    }
    ++v4;
  }
  while (v4 != 3);
}

uint64_t AppleH15PlatformErrorHandler::_dcsGenerateEnableMask(uint64_t this)
{
  uint64_t v1 = this;
  for (uint64_t i = 0; i != 15; ++i)
  {
    uint64_t v3 = (_DWORD *)((char *)&AppleH15PlatformErrorHandler::_dcsDecoders + 24 * i);
    uint64_t v4 = v3[2];
    if (v4)
    {
      int v5 = 0;
      int v6 = 0;
      uint64_t v7 = *((void *)&AppleH15PlatformErrorHandler::_dcsDecoders + 3 * i + 2);
      int v8 = (void *)(v7 + 48);
      do
      {
        uint64_t v9 = *(v8 - 1);
        BOOL v10 = v9 == 0;
        uint64_t v11 = *v8 & 1 | v9;
        if (*v8) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        int v13 = v12;
        BOOL v14 = (v10 & v13) == 0;
        if ((v10 & v13) != 0) {
          int v15 = 0;
        }
        else {
          int v15 = *((_DWORD *)v8 - 11);
        }
        v6 |= v15;
        if (v14) {
          int v16 = 0;
        }
        else {
          int v16 = *((_DWORD *)v8 - 11);
        }
        v5 |= v16;
        v8 += 7;
        --v4;
      }
      while (v4);
      if (*(unsigned char *)(v1 + 145))
      {
        unsigned int v17 = *(const char **)(v7 + 24);
        size_t v18 = strlen("spll");
        this = strncmp(v17, "spll", v18);
        if (!this) {
          int v6 = 0;
        }
      }
      *uint64_t v3 = v6;
      *((_DWORD *)&AppleH15PlatformErrorHandler::_dcsDecoders + 6 * i + 1) = v5;
    }
  }
  return this;
}

double AppleH15PlatformErrorHandler::_ioaGenerateEnableMask(AppleH15PlatformErrorHandler *this)
{
  *(void *)&double result = 523775;
  *((void *)this + 1782) = 523775;
  return result;
}

uint64_t AppleH15PlatformErrorHandler::_afxNiGenerateEnableMask(uint64_t this)
{
  uint64_t v1 = 0;
  char v2 = 1;
  do
  {
    char v3 = v2;
    uint64_t v4 = *((void *)&AppleH15PlatformErrorHandler::_afxNi0Decoder + 5 * v1 + 4);
    uint64_t v5 = *(void *)(v4 + 8);
    if (v5)
    {
      uint64_t v6 = 0;
      LODWORD(v5) = 0;
      unsigned int v7 = 1;
      do
      {
        LODWORD(v5) = *(_DWORD *)(v4 + 16 * v6) | v5;
        uint64_t v6 = v7;
      }
      while (*(void *)(v4 + 16 * v7++ + 8));
    }
    char v2 = 0;
    *(_DWORD *)(this + 4 * v1 + 13584) = v5;
    uint64_t v1 = 1;
  }
  while ((v3 & 1) != 0);
  return this;
}

void AppleH15PlatformErrorHandler::_amccEnableErrors(AppleH15PlatformErrorHandler *this, int a2)
{
  if (*((_DWORD *)this + 135))
  {
    unsigned int v4 = 0;
    uint64_t v5 = (void *)((char *)this + 8232);
    do
    {
      for (uint64_t i = 0; i != 128; i += 32)
        AppleH15PlatformErrorHandler::_amccEnableErrorsForInputTable((uint64_t)this, (char *)&AppleH15PlatformErrorHandler::_amccNonPlaneDecoders + i, v4, a2);
      uint64_t v8 = 0;
      int v9 = 139264;
      do
      {
        uint64_t v10 = 0;
        unsigned int v11 = v9;
        do
        {
          uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(v7, (uint64_t)v5, v4, v11 - 4096);
          int v13 = AppleH15PlatformErrorHandler::_amccPlaneDecoders[v10];
          int v14 = v13 | Register32;
          int v15 = Register32 & ~v13;
          if (a2) {
            int v15 = v14;
          }
          AppleH15PlatformErrorHandler::_writeRegister32(Register32, v5, v4, v11 - 4096, v15 & ~AppleH15PlatformErrorHandler::_amccPlaneDecoders[v10 + 1]);
          AppleH15PlatformErrorHandler::_writeRegister32(v16, v5, v4, v11, 0);
          v10 += 6;
          v11 += 8;
        }
        while (v10 != 18);
        ++v8;
        v9 += 0x40000;
      }
      while (v8 != 3);
      ++v4;
    }
    while (v4 < *((_DWORD *)this + 135));
  }
}

void AppleH15PlatformErrorHandler::_dcsEnableErrors(AppleH15PlatformErrorHandler *this, int a2)
{
  if (*((_DWORD *)this + 135))
  {
    unsigned int v4 = 0;
    uint64_t v5 = (void *)((char *)this + 8232);
    do
    {
      for (int i = 0; i != 6; ++i)
      {
        for (uint64_t j = 0; j != 360; j += 24)
        {
          uint64_t v8 = (char *)&AppleH15PlatformErrorHandler::_dcsDecoders + j;
          if (*(_DWORD *)((char *)&AppleH15PlatformErrorHandler::_dcsDecoders + j + 8))
          {
            unsigned int v9 = *(_DWORD *)(*((void *)v8 + 2) + 8) + (i << 21) + *(_DWORD *)(*((void *)v8 + 2) + 12);
            uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32((uint64_t)this, (uint64_t)v5, v4, v9);
            int v11 = Register32 & ~*(_DWORD *)v8;
            if (a2) {
              int v11 = *(_DWORD *)v8 | Register32;
            }
            AppleH15PlatformErrorHandler::_writeRegister32(Register32, v5, v4, v9, v11 & ~*((_DWORD *)v8 + 1));
          }
        }
      }
      ++v4;
    }
    while (v4 < *((_DWORD *)this + 135));
  }
}

void AppleH15PlatformErrorHandler::_ioaEnableErrors(AppleH15PlatformErrorHandler *this, int a2)
{
  if (*((_DWORD *)this + 183))
  {
    unsigned int v4 = 0;
    uint64_t v5 = (char *)this + 12872;
    uint64_t v6 = (void *)((char *)this + 12232);
    do
    {
      if (v4 < 8) {
        unsigned int v7 = 2;
      }
      else {
        unsigned int v7 = 3;
      }
      uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32((uint64_t)this, (uint64_t)v5, v7, 0x80Cu);
      if (Register32 >> 28)
      {
        uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v5, v7, 0x810u);
        AppleH15PlatformErrorHandler::_readRegister32(v13, (uint64_t)v5, v7, 0x814u);
        kprintf("%s::%s: IOA%d does not exist\n", "AppleH15PlatformErrorHandler", "_ioaEnableErrors", v4 & 7);
      }
      else
      {
        uint64_t v9 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v6, v4, 0xA00u);
        int v10 = *((_DWORD *)this + 3564);
        int v11 = v10 | v9;
        int v12 = v9 & ~v10;
        if (a2) {
          int v12 = v11;
        }
        AppleH15PlatformErrorHandler::_writeRegister32(v9, v6, v4, 0xA00u, v12 & ~*((_DWORD *)this + 3565));
      }
      ++v4;
    }
    while (v4 < *((_DWORD *)this + 183));
  }
}

void AppleH15PlatformErrorHandler::_afxNiEnableErrors(AppleH15PlatformErrorHandler *this, int a2)
{
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = (uint64_t)*(&AppleH15PlatformErrorHandler::_afxNiAllDecoders + v4);
    uint64_t v19 = v4;
    if (v5)
    {
      uint64_t v6 = (char *)this + 16 * v4;
      if (*((_DWORD *)v6 + 3402))
      {
        unsigned int v7 = 0;
        uint64_t v8 = (uint64_t *)(v6 + 13600);
        uint64_t v9 = (unsigned int *)(v6 + 13608);
        do
        {
          uint64_t v10 = 0;
          char v11 = 1;
          do
          {
            char v12 = v11;
            unsigned int v13 = *(_DWORD *)(v5 + 40 * v10 + 4);
            uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32((uint64_t)this, *v8, v7, v13);
            int v15 = *((_DWORD *)this + v10 + 3396);
            int v16 = v15 | Register32;
            int v17 = Register32 & ~v15;
            if (a2) {
              int v18 = v16;
            }
            else {
              int v18 = v17;
            }
            AppleH15PlatformErrorHandler::_writeRegister32(Register32, (void *)*v8, v7, v13, v18);
            char v11 = 0;
            uint64_t v10 = 1;
          }
          while ((v12 & 1) != 0);
          ++v7;
        }
        while (v7 < *v9);
      }
    }
    else
    {
      IOLog("NI%d doesn't exist, skip\n", v4);
    }
    uint64_t v4 = v19 + 1;
  }
  while (v19 != 10);
}

void AppleH15PlatformErrorHandler::_afcNsDisableErrors(AppleH15PlatformErrorHandler *this, int a2)
{
  if (*((_DWORD *)this + 51))
  {
    unint64_t v4 = 0;
    uint64_t v5 = (void *)((char *)this + 1032);
    uint64_t v6 = (char *)this + 13776;
    do
    {
      if (a2) {
        int v7 = *(_DWORD *)&v6[4 * v4];
      }
      else {
        int v7 = -1;
      }
      AppleH15PlatformErrorHandler::_writeRegister32((uint64_t)this, v5, v4++, 0x104u, v7);
    }
    while (v4 < *((unsigned int *)this + 51));
  }
}

void AppleH15PlatformErrorHandler::_afiNsDisableErrors(AppleH15PlatformErrorHandler *this, int a2)
{
  if (*((_DWORD *)this + 57))
  {
    unint64_t v4 = 0;
    uint64_t v5 = (void *)((char *)this + 1512);
    uint64_t v6 = (char *)this + 13824;
    do
    {
      if (a2) {
        int v7 = *(_DWORD *)&v6[4 * v4];
      }
      else {
        int v7 = -1;
      }
      AppleH15PlatformErrorHandler::_writeRegister32((uint64_t)this, v5, v4++, 0x104u, v7);
    }
    while (v4 < *((unsigned int *)this + 57));
  }
}

uint64_t AppleH15PlatformErrorHandler::_enableInterrupts(uint64_t this, char a2)
{
  if (*(_DWORD *)(this + 192))
  {
    uint64_t v3 = this;
    uint64_t v4 = 103;
    do
    {
      this = AppleH15PlatformErrorHandler::_enableInterrupts(v3, *(void *)(v3 + 8 * v4), a2);
      unint64_t v5 = v4 - 102;
      ++v4;
    }
    while (v5 < *(unsigned int *)(v3 + 192));
  }
  return this;
}

uint64_t AppleH15PlatformErrorHandler::callPlatformFunction(AppleH15PlatformErrorHandler *this, const OSSymbol *a2, BOOL a3, void *a4, void *a5, void *a6, void *a7)
{
  if (gIOPlatformActiveActionKey == a2)
  {
    AppleH15PlatformErrorHandler::_amccPostHibernateClean(this);
    AppleH15PlatformErrorHandler::_amccEnableErrors(this, 1);
    AppleH15PlatformErrorHandler::_dcsEnableErrors(this, 1);
    AppleH15PlatformErrorHandler::_ioaEnableErrors(this, 1);
    (*(void (**)(void))(**((void **)this + 21) + 1384))();
    AppleH15PlatformErrorHandler::_afxNiEnableErrors(this, 1);
    AppleH15PlatformErrorHandler::_afcNsDisableErrors(this, 1);
    AppleH15PlatformErrorHandler::_afiNsDisableErrors(this, 1);
    (*(void (**)(void))(**((void **)this + 21) + 1384))();
    uint64_t v10 = this;
    char v11 = 1;
LABEL_8:
    AppleH15PlatformErrorHandler::_enableInterrupts((uint64_t)v10, v11);
    return 0;
  }
  if (gIOPlatformQuiesceActionKey == a2)
  {
    AppleH15PlatformErrorHandler::_amccEnableErrors(this, 0);
    AppleH15PlatformErrorHandler::_dcsEnableErrors(this, 0);
    AppleH15PlatformErrorHandler::_ioaEnableErrors(this, 0);
    uint64_t v10 = this;
    char v11 = 0;
    goto LABEL_8;
  }

  return callPlatformFunction();
}

void AppleH15PlatformErrorHandler::_amccPostHibernateClean(AppleH15PlatformErrorHandler *this)
{
  uint64_t v1 = (_DWORD *)*((void *)this + 1756);
  if (v1 && *v1 == 2 && *((void *)this + 1757) && *((_DWORD *)this + 135))
  {
    unsigned int v3 = 0;
    do
    {
      for (int i = 0; i != 786432; i += 0x40000)
        AppleH15PlatformErrorHandler::_writeRegister32((uint64_t)this, (void *)this + 1029, v3, i + 8 * **((_DWORD **)this + 1757) + 135172, *(_DWORD *)(*((void *)this + 1757) + 4));
      ++v3;
    }
    while (v3 < *((_DWORD *)this + 135));
  }
}

uint64_t AppleH15PlatformErrorHandler::_getHibernateState(AppleH15PlatformErrorHandler *this)
{
  uint64_t v1 = (unsigned int *)*((void *)this + 1756);
  if (v1) {
    return *v1;
  }
  else {
    return 0;
  }
}

uint64_t AppleH15PlatformErrorHandler::_enableInterrupts(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v4 = result;
  int v5 = *(_DWORD *)(a2 + 16);
  if (a3)
  {
    if (v5)
    {
      unsigned int v6 = 0;
      do
      {
        double result = (*(uint64_t (**)(void, void))(**(void **)(v4 + 160) + 1024))(*(void *)(v4 + 160), v6 + *(_DWORD *)(a2 + 12));
        ++v6;
      }
      while (v6 < *(_DWORD *)(a2 + 16));
    }
  }
  else if (v5)
  {
    unsigned int v7 = 0;
    do
    {
      double result = (*(uint64_t (**)(void, void))(**(void **)(v4 + 160) + 1032))(*(void *)(v4 + 160), v7 + *(_DWORD *)(a2 + 12));
      ++v7;
    }
    while (v7 < *(_DWORD *)(a2 + 16));
  }
  return result;
}

uint64_t AppleH15PlatformErrorHandler::_readRegister32(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (*(_DWORD *)(*(void *)a2 + 8) <= a3 || *(void *)(a2 + 40 * a3 + 32) <= (unint64_t)a4) {
    AppleH15PlatformErrorHandler::_readRegister32();
  }
  return *(unsigned int *)(*(void *)(a2 + 40 * a3 + 16) + a4);
}

void AppleH15PlatformErrorHandler::_writeRegister32(uint64_t a1, void *a2, unsigned int a3, unsigned int a4, int a5)
{
  if (*(_DWORD *)(*a2 + 8) <= a3 || a2[4] <= (unint64_t)a4) {
    AppleH15PlatformErrorHandler::_writeRegister32();
  }
  *(_DWORD *)(a2[5 * a3 + 2] + a4) = a5;
}

const char *AppleH15PlatformErrorHandler::_fabricCommand(AppleH15PlatformErrorHandler *this)
{
  unsigned int v1 = this;
  double result = "???";
  if (v1 <= 0x3F)
  {
    unsigned int v3 = AppleH15PlatformErrorHandler::_fabricCommands[v1];
    if (v3) {
      return v3;
    }
  }
  return result;
}

void AppleH15PlatformErrorHandler::amccNoPlaneFetchCeflLog(IOSimpleLock **this, unsigned int a2, unint64_t *a3, unsigned int *a4)
{
  uint64_t v8 = this + 1029;
  int Register32 = AppleH15PlatformErrorHandler::_readRegister32((uint64_t)this, (uint64_t)(this + 1029), a2, 0x156304u);
  unsigned int v22 = (AppleH15PlatformErrorHandler *)this;
  uint64_t v10 = this[1783];
  BOOLean_t enable = ml_set_interrupts_enabled(0);
  IOSimpleLockLock(v10);
  if (Register32)
  {
    unsigned int v12 = Register32;
    int v13 = 0;
    int v14 = 0;
    do
    {
      if (v12)
      {
        uint64_t v15 = AppleH15PlatformErrorHandler::_readRegister32(v11, (uint64_t)v8, a2, 12 * v13 + 1401608);
        int v16 = v15;
        uint64_t v11 = AppleH15PlatformErrorHandler::_readRegister32(v15, (uint64_t)v8, a2, 12 * v13 + 1401612);
        int v17 = BYTE1(v11);
        if (BYTE1(v11))
        {
          int v18 = v14 + BYTE1(v11);
          do
          {
            a3[v14 + *a4] = v16 & 0xFFFFFF80 | ((unint64_t)v11 << 32) | 0x10000000000;
            ++v14;
            --v17;
          }
          while (v17);
          int v14 = v18;
        }
      }
      ++v13;
      BOOL v19 = v12 > 1;
      v12 >>= 1;
    }
    while (v19);
  }
  else
  {
    int v14 = 0;
  }
  *a4 += v14;
  IOSimpleLockUnlock(*((IOSimpleLock **)v22 + 1783));
  uint64_t v20 = ml_set_interrupts_enabled(enable);

  AppleH15PlatformErrorHandler::_writeRegister32(v20, v8, a2, 0x156304u, Register32);
}

uint64_t AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts(uint64_t this, int a2, _DWORD *a3)
{
  if (!a3) {
    AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts();
  }
  uint64_t v4 = a3[3];
  if (v4 >= 0xB) {
    AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts();
  }
  int v5 = *(void **)(this + 16 * v4 + 13600);
  if (!v5) {
    AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts();
  }
  unsigned int v6 = (_DWORD *)*v5;
  if (!*v5) {
    AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts();
  }
  unsigned int v7 = v6[4];
  unsigned int v8 = a2 - v6[3];
  if (v8 >= v7) {
    AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts();
  }
  unsigned int v9 = v6[2];
  if (v8 >= v9) {
    AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts();
  }
  if (v7 != v9) {
    AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts();
  }
  uint64_t v10 = 0;
  char v11 = 1;
  do
  {
    char v12 = v11;
    this = AppleH15PlatformErrorHandler::_readRegister32(this, (uint64_t)v5, v8, a3[10 * v10]);
    if (this)
    {
      int v39 = v4;
      int v40 = this;
      uint64_t v13 = *(void *)&a3[10 * v10 + 8];
      char v41 = *(const char **)(v13 + 8);
      if (v41)
      {
        if ((*(_DWORD *)v13 & this) == 0)
        {
          unsigned int v14 = 1;
          char v41 = "*UNKNOWN*";
          do
          {
            uint64_t v15 = *(const char **)(v13 + 16 * v14 + 8);
            if (!v15) {
              goto LABEL_19;
            }
            int v16 = *(_DWORD *)(v13 + 16 * v14++);
          }
          while ((v16 & this) == 0);
          char v41 = v15;
        }
      }
      else
      {
        char v41 = "*UNKNOWN*";
      }
LABEL_19:
      int v17 = (char *)&a3[10 * v10];
      uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(this, (uint64_t)v5, v8, *((_DWORD *)v17 + 2));
      unsigned int v19 = Register32;
      uint64_t v20 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v5, v8, *((_DWORD *)v17 + 2) + 4);
      unsigned int v21 = v20;
      uint64_t v22 = AppleH15PlatformErrorHandler::_readRegister32(v20, (uint64_t)v5, v8, *((_DWORD *)v17 + 2) + 8);
      int v23 = v22;
      uint64_t v24 = AppleH15PlatformErrorHandler::_readRegister32(v22, (uint64_t)v5, v8, *((_DWORD *)v17 + 2) + 12);
      int v25 = v23 & 0xFFFFF;
      int v38 = (v21 >> 22) & 7;
      int v35 = (v21 >> 17) & 0x1F;
      int v26 = (v21 >> 11) & 0x3F;
      int v37 = v21 & 0x7FF;
      unsigned int v27 = v19 >> 30;
      int v36 = (v19 >> 7) & 0xFFFFF;
      int v28 = (v19 >> 4) & 7;
      int v29 = v19 & 0xF;
      uint64_t v30 = AppleH15PlatformErrorHandler::_readRegister32(v24, (uint64_t)v5, v8, *((_DWORD *)v17 + 2) + 16);
      uint64_t v31 = AppleH15PlatformErrorHandler::_readRegister32(v30, (uint64_t)v5, v8, *((_DWORD *)v17 + 2) + 20);
      int v32 = v31 & 0x3FF;
      int v33 = AppleH15PlatformErrorHandler::_readRegister32(v31, (uint64_t)v5, v8, *((_DWORD *)v17 + 2) + 28);
      unint64_t v34 = AppleH15PlatformErrorHandler::_fabricCommands[v26];
      if (!v34) {
        unint64_t v34 = "???";
      }
      snprintf(AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts(int,void *)::msg, 0x100uLL, "%s NI%d %s %d %s error (0x%08x) cmd/st:0x%x(%s)/0x%x src/dst/tid:%x/%x/%x vc/sc/tz/crh:0x%x/0x%x/0x%x/0x%x user:0x%x addrl:0x%x addrh:0x%x errorvec 0x%x", *((const char **)v17 + 2), v39, *((const char **)v17 + 3), v8, v41, v40, v26, v34, v38, 0, v36, v37, v29, v28, v35,
        v27,
        v25,
        v30,
        v32,
        v33);
      panic("%s @%s:%d", AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts(int,void *)::msg, "AppleH15PlatformErrorHandler.cpp", 1383);
    }
    char v11 = 0;
    uint64_t v10 = 1;
  }
  while ((v12 & 1) != 0);
  return this;
}

void AppleH15PlatformErrorHandler::_afxNsDecodeStatus(uint64_t a1, unsigned int a2, int a3, const char **a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (!*(void *)a7) {
LABEL_2:
  }
    panic("\"%s %c%c%c%c (index %u) unknown error\" @%s:%d", *a4, HIBYTE(*(_DWORD *)(a6 + 4 * a2)), BYTE2(*(_DWORD *)(a6 + 4 * a2)), BYTE1(*(_DWORD *)(a6 + 4 * a2)), *(_DWORD *)(a6 + 4 * a2), a2, "AppleH15PlatformErrorHandler.cpp", 1534);
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a5, a2, *(_DWORD *)(a7 + 8));
  if (Register32)
  {
    unsigned int v17 = Register32;
    int v25 = a3;
    unsigned int v16 = 0;
    uint64_t v15 = (const char **)a7;
  }
  else
  {
    unsigned int v14 = 1;
    do
    {
      uint64_t v15 = (const char **)(a7 + 24 * v14);
      if (!*v15) {
        goto LABEL_2;
      }
      unsigned int v16 = v14;
      uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(Register32, a5, a2, *(_DWORD *)(a7 + 24 * v14 + 8));
      unsigned int v14 = v16 + 1;
    }
    while (!Register32);
    unsigned int v17 = Register32;
    int v25 = a3;
  }
  unsigned int v18 = __clz(__rbit32(v17));
  uint64_t v24 = *v15;
  uint64_t v19 = a7 + 24 * v16;
  if (*(unsigned char *)(v19 + 16)) {
    uint64_t v20 = "TX";
  }
  else {
    uint64_t v20 = "RX";
  }
  uint64_t v21 = AppleH15PlatformErrorHandler::_readRegister32(Register32, a5, a2, *(_DWORD *)(v19 + 12));
  uint64_t v22 = AppleH15PlatformErrorHandler::_readRegister32(v21, a5, a2, *(_DWORD *)(v19 + 12) + 4);
  unsigned int v23 = AppleH15PlatformErrorHandler::_readRegister32(v22, a5, a2, *(_DWORD *)(v19 + 12) + 8);
  panic("\"Die %u %s %c%c%c%c (index %u) %s %s%s error (0x%08x/0x%08x/0x%08x/0x%08x) on port %u->%u srcId/dstNi/tid:0x%x/0x%x/0x%x vc/vn/subnet:0x%x/0x%x/0x%x pktSize:0x%x\" @%s:%d", v25, *a4, HIBYTE(*(_DWORD *)(a6 + 4 * a2)), BYTE2(*(_DWORD *)(a6 + 4 * a2)), BYTE1(*(_DWORD *)(a6 + 4 * a2)), *(_DWORD *)(a6 + 4 * a2), a2, a4[1], v20, v24, v17, v21, v22, v23, v18, v22 & 7, (unsigned __int16)v23,
    WORD1(v22),
    HIWORD(v23),
    (v22 >> 4) & 3,
    (v22 >> 6) & 1,
    (v21 >> 4) & 7,
    (v22 >> 8) & 0x7F,
    "AppleH15PlatformErrorHandler.cpp",
    1529);
}

uint64_t AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts(AppleH15PlatformErrorHandler *this, int a2, _DWORD *a3)
{
  if (!a3) {
    AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts();
  }
  int v3 = a3[10];
  if (v3 == 2)
  {
    uint64_t v4 = (char *)this + 2952;
    unsigned int v5 = 10;
  }
  else if (v3 == 1)
  {
    uint64_t v4 = (char *)this + 1512;
    unsigned int v5 = 18;
  }
  else
  {
    if (v3) {
      panic("\"Invalid AFx NS decoder %p aperture index: %u\" @%s:%d", a3, a3[10], "AppleH15PlatformErrorHandler.cpp", 1467);
    }
    uint64_t v4 = (char *)this + 1032;
    unsigned int v5 = 6;
  }
  unsigned int v6 = *(_DWORD **)v4;
  if (!*(void *)v4) {
    AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts();
  }
  if (!*((void *)a3 + 2)) {
    AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts();
  }
  unsigned int v7 = v6[4];
  uint64_t v8 = (a2 - v6[3]);
  if (v8 >= v7) {
    AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts();
  }
  unsigned int v9 = v6[2];
  if (v8 >= v9) {
    AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts();
  }
  if (v7 != v9) {
    AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts();
  }
  char v11 = (void (*)(uint64_t, unsigned int, int, const char **, uint64_t, uint64_t, uint64_t))*((void *)a3 + 3);
  uint64_t v10 = *((void *)a3 + 4);
  if (v10) {
    BOOL v12 = (*((void *)a3 + 4) & 1 | (unint64_t)v11) == 0;
  }
  else {
    BOOL v12 = 1;
  }
  char v13 = v12;
  if (v11 != AppleH15PlatformErrorHandler::_afxNsDecodeStatus || (v13 & 1) == 0) {
    AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts();
  }
  unsigned int v14 = (void *)((char *)this + (v10 >> 1));
  uint64_t v15 = AppleH15PlatformErrorHandler::_afxNsDecodeStatus;
  if (v10) {
    uint64_t v15 = *(void (**)(uint64_t, unsigned int, int, const char **, uint64_t, uint64_t, uint64_t))(*v14 + AppleH15PlatformErrorHandler::_afxNsDecodeStatus);
  }

  return ((uint64_t (*)(void *, uint64_t, void, _DWORD *))v15)(v14, v8, v8 / v5, a3);
}

void AppleH15PlatformErrorHandler::_afrNsDisableErrors(AppleH15PlatformErrorHandler *this, int a2)
{
  if (*((_DWORD *)this + 63))
  {
    unint64_t v4 = 0;
    unsigned int v5 = (void *)((char *)this + 2952);
    unsigned int v6 = (char *)this + 13968;
    do
    {
      if (a2) {
        int v7 = *(_DWORD *)&v6[4 * v4];
      }
      else {
        int v7 = -1;
      }
      AppleH15PlatformErrorHandler::_writeRegister32((uint64_t)this, v5, v4++, 0x104u, v7);
    }
    while (v4 < *((unsigned int *)this + 63));
  }
}

void AppleH15PlatformErrorHandler::_amccNonPlaneDecodeXCTT(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, uint64_t a5, const char **a6)
{
  if (!a3)
  {
    int v6 = *((_DWORD *)a6 + 2);
    if (v6 == 1) {
      panic("\"AMCC%u Non-Plane %s %s error TYPE %#x: INTSTS%u 0x%08x ADDR %#llx CMD/SRC/TID/SIZ %#x(%s)/%#x/%#x/%#x\" @%s:%d", a2, *(void *)(a5 + 8), *a6, 0, *((unsigned int *)a6 + 7), *a4);
    }
    if (!v6)
    {
      uint64_t v7 = *((_DWORD *)a6 + 3) & 0x3FLL;
      uint64_t v8 = AppleH15PlatformErrorHandler::_fabricCommands[v7];
      if (!v8) {
        uint64_t v8 = "???";
      }
      panic("\"AMCC%u Non-Plane %s %s error: INTSTS%u 0x%08x ADDR %#llx CMD/SRC/TID/SIZ %#x(%s)/%#x/%#x/%#x INFO 0x%08x/0x%08x/0x%08x/0x%08x/0x%08x/0x%08x\" @%s:%d", a2, *(void *)(a5 + 8), *a6, 0, *a4, ((unint64_t)*((unsigned int *)a6 + 4) >> 9) & 0xFFFFFC00007FFFFFLL | ((unint64_t)(*((_DWORD *)a6 + 5) & 0x7FFFF) << 23), v7, v8);
    }
  }
  panic("\"AMCC%u Non-Plane %s %s error: INTSTS%u 0x%08x\" @%s:%d", a2, "*UNKNOWN*", *a6, a3, *a4, "AppleH15PlatformErrorHandler.cpp", 1826);
}

void AppleH15PlatformErrorHandler::_amccPlaneDecodeTagPipeParity(uint64_t a1, unsigned int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v11 = a1 + 8232;
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, ((unsigned __int16)a3 << 18) | 0x744u);
  uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v11, a2, ((unsigned __int16)a3 << 18) | 0x748u);
  int v14 = AppleH15PlatformErrorHandler::_readRegister32(v13, v11, a2, (a3 << 18) | 0x74Cu);
  panic("\"AMCC%u PLANE%u %s error: INTSTS%u 0x%08x TAG_PAR_ERR_LOG0/1/2=%#x/%#x/%#x\" @%s:%d", a2, a3, *(const char **)(a6 + 8), a4, *a5, Register32, v13, v14, "AppleH15PlatformErrorHandler.cpp", 2489);
}

void AppleH15PlatformErrorHandler::_amccPlaneDecodeDataPipeSBE(uint64_t a1, unsigned int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v10 = (void *)(a1 + 8232);
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, ((unsigned __int16)a3 << 18) | 0xC14u);
  unsigned int v11 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v10, a2, ((unsigned __int16)a3 << 18) | 0xC1Cu);
  uint64_t v12 = mcc_log_memory_error();
  if (*(_DWORD *)(a1 + 152) && *(unsigned char *)(a1 + 142)) {
    panic("\"AMCC%u PLANE%u %s error: INTSTS%u 0x%08x ECCONEBITERRLOG(Bank/Way/Index/BitOffCL/BitOffHCL) %#x(%#x/%#x/%#x/%#x/%#x) ERRBITCNT %#x\" @%s:%d", a2, a3, *(const char **)(a6 + 8), a4, *a5, v11, (v11 >> 28) & 3, HIBYTE(v11) & 0xF, BYTE2(v11), (v11 >> 10) & 1, v11 & 0x3FF, Register32, "AppleH15PlatformErrorHandler.cpp", 2254);
  }
  AppleH15PlatformErrorHandler::_writeRegister32(v12, v10, a2, ((a3 << 18) | 0x21004) + 8 * a4, *(_DWORD *)(a6 + 4));
}

void AppleH15PlatformErrorHandler::_amccPlaneDecodeDataPipeMBE(uint64_t a1, unsigned int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
  int Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, (a3 << 18) | 0xC20u);
  panic("\"AMCC%u PLANE%u %s error: INTSTS%u 0x%08x ECCMULTIBITSERRLOG(Bank/Way/Entry) %#x(%#x/%#x/%#x)\" @%s:%d", a2, a3, *(const char **)(a6 + 8), a4, *a5, Register32, 0, 0, Register32, "AppleH15PlatformErrorHandler.cpp", 2217);
}

void AppleH15PlatformErrorHandler::_amccPlaneDecodeDirectoryParity(uint64_t a1, unsigned int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v10 = a1 + 8232;
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, ((unsigned __int16)a3 << 18) | 0xA00u);
  uint64_t v12 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v10, a2, ((unsigned __int16)a3 << 18) | 0xA04u);
  uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v12, v10, a2, ((unsigned __int16)a3 << 18) | 0xA08u);
  uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v13, v10, a2, ((unsigned __int16)a3 << 18) | 0xA0Cu);
  uint64_t v15 = AppleH15PlatformErrorHandler::_readRegister32(v14, v10, a2, ((unsigned __int16)a3 << 18) | 0xA14u);
  uint64_t v16 = AppleH15PlatformErrorHandler::_readRegister32(v15, v10, a2, (a3 << 18) | 0xA18u) & 0x3FF | v15;
  unsigned int v17 = AppleH15PlatformErrorHandler::_fabricCommands[v14 & 0x3F];
  if (!v17) {
    unsigned int v17 = "???";
  }
  panic("\"AMCC%u PLANE%u %s error: INTSTS%u 0x%08x FLAG/STATE %#x/%#x INFO %#x/%#x/%#x ADDR %#llx CMD/AID/TID %#x(%s)/%#x/%#x WAY/TAG/PARITY %#x/%#x/%#x\" @%s:%d", a2, a3, *(const char **)(a6 + 8), a4, *a5, Register32, (v12 >> 5), v12, v13, v14, v16, v14 & 0x3F, v17, v14 & 0xFFFFF, (v14 >> 6) & 0x7FF, v12 & 0x1F, v13 & 0x3FFFF,
    v13 >> 31,
    "AppleH15PlatformErrorHandler.cpp",
    2355);
}

void AppleH15PlatformErrorHandler::_amccPlaneDecodeDirectoryMultiHit(uint64_t a1, unsigned int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v10 = a1 + 8232;
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, ((unsigned __int16)a3 << 18) | 0xA1Cu);
  uint64_t v12 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v10, a2, ((unsigned __int16)a3 << 18) | 0xA20u);
  uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v12, v10, a2, ((unsigned __int16)a3 << 18) | 0xA24u);
  uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v13, v10, a2, ((unsigned __int16)a3 << 18) | 0xA28u);
  uint64_t v15 = AppleH15PlatformErrorHandler::_readRegister32(v14, v10, a2, ((unsigned __int16)a3 << 18) | 0xA30u);
  unsigned int v16 = v15;
  __int16 v17 = AppleH15PlatformErrorHandler::_readRegister32(v15, v10, a2, (a3 << 18) | 0xA34u);
  unsigned int v18 = AppleH15PlatformErrorHandler::_fabricCommands[v14 & 0x3F];
  if (!v18) {
    unsigned int v18 = "???";
  }
  panic("\"AMCC%u PLANE%u %s error: INTSTS%u 0x%08x FLAG/STATE %#x/%#x INFO %#x/%#x/%#x ADDR %#llx CMD/AID/TID %#x(%s)/%#x/%#x WAYS %#x\" @%s:%d", a2, a3, *(const char **)(a6 + 8), a4, *a5, Register32, (unsigned __int16)v12, v12, v13, v14, v17 & 0x3FF | v16, v14 & 0x3F, v18, v14 & 0xFFFFF, (v14 >> 6) & 0x7FF, v13 & 0xFFFFFF, "AppleH15PlatformErrorHandler.cpp",
    2323);
}

void AppleH15PlatformErrorHandler::_amccPlaneDecodeTagPipeAFError(uint64_t a1, unsigned int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v10 = (void *)(a1 + 8232);
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, ((unsigned __int16)a3 << 18) | 0x750u);
  uint64_t v12 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v10, a2, ((unsigned __int16)a3 << 18) | 0x754u);
  uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v12, (uint64_t)v10, a2, ((unsigned __int16)a3 << 18) | 0x758u);
  uint64_t v20 = AppleH15PlatformErrorHandler::_readRegister32(v13, (uint64_t)v10, a2, ((unsigned __int16)a3 << 18) | 0x75Cu);
  uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v20, (uint64_t)v10, a2, ((unsigned __int16)a3 << 18) | 0x760u);
  uint64_t v15 = AppleH15PlatformErrorHandler::_readRegister32(v14, (uint64_t)v10, a2, ((unsigned __int16)a3 << 18) | 0x764u);
  unsigned int v16 = AppleH15PlatformErrorHandler::_readRegister32(v15, (uint64_t)v10, a2, ((unsigned __int16)a3 << 18) | 0x778u);
  __int16 v17 = AppleH15PlatformErrorHandler::_fabricCommands[(v12 >> 11) & 0x3F];
  if (!v17) {
    __int16 v17 = "???";
  }
  uint64_t v18 = snprintf(AppleH15PlatformErrorHandler::_amccPlaneDecodeTagPipeAFError(unsigned int,unsigned int,unsigned int,unsigned int &,AppleH15PlatformErrorHandler::AMCCPlaneDecoder_t const*)::msg, 0x100uLL, "AMCC%u PLANE%d %s error: INTSTS%u 0x%08x AFERRLOG0/1/2/3/4/5 %#x/%#x/%#x/%#x/%#x/%#x ADDR %#llx CMD/SIZE %#x(%s)/%#x AID/TID/DSID %#x/%#x/%#x", a2, a3, *(const char **)(a6 + 8), a4, *a5, Register32, v12, v13, v20, v14, v15, Register32 | ((unint64_t)(v12 & 0x3FF) << 32), (v12 >> 11) & 0x3F, v17, (v12 >> 17) & 0x7F,
          v13 & 0x3FFFF,
          (v13 >> 20) & 0x7FF,
          HIBYTE(v16));
  int v19 = AppleH15PlatformErrorHandler::_amccPlaneDecodeTagPipeAFError(unsigned int,unsigned int,unsigned int,unsigned int &,AppleH15PlatformErrorHandler::AMCCPlaneDecoder_t const*)::dap_whitelist[a4] & *a5;
  if (!v19 || (v13 & 0x3FFFE) != 0x12630) {
    AppleH15PlatformErrorHandler::_amccPlaneDecodeTagPipeAFError();
  }

  AppleH15PlatformErrorHandler::_writeRegister32(v18, v10, a2, ((a3 << 18) | 0x21004) + 8 * a4, v19);
}

void AppleH15PlatformErrorHandler::_amccPlanePanic(uint64_t a1, int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
}

void AppleH15PlatformErrorHandler::_amccPlaneDecodeDirectoryInconsistent(uint64_t a1, unsigned int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v10 = a1 + 8232;
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, ((unsigned __int16)a3 << 18) | 0xA38u);
  uint64_t v12 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v10, a2, ((unsigned __int16)a3 << 18) | 0xA3Cu);
  uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v12, v10, a2, ((unsigned __int16)a3 << 18) | 0xA40u);
  uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v13, v10, a2, ((unsigned __int16)a3 << 18) | 0xA44u);
  uint64_t v15 = AppleH15PlatformErrorHandler::_readRegister32(v14, v10, a2, ((unsigned __int16)a3 << 18) | 0xA48u);
  unsigned int v16 = v15;
  __int16 v17 = AppleH15PlatformErrorHandler::_readRegister32(v15, v10, a2, (a3 << 18) | 0xA4Cu);
  uint64_t v18 = AppleH15PlatformErrorHandler::_fabricCommands[v13 & 0x3F];
  if (!v18) {
    uint64_t v18 = "???";
  }
  panic("\"AMCC%u PLANE%u %s error: INTSTS%u 0x%08x FLAG/STATE %#x/%#x INFO %#x/%#x/%#x ADDR %#llx CMD/AID/TID %#x(%s)/%#x/%#x WAY/SIZE %#x/%#x\" @%s:%d", a2, a3, *(const char **)(a6 + 8), a4, *a5, Register32, (v12 >> 5), v12, v13, v14, v17 & 0x3FF | v16, v13 & 0x3F, v18, (v13 >> 7) & 0xFFFFF, (v13 >> 6) & 0x7FF, v12 & 0x1F, v14 & 0x7F,
    "AppleH15PlatformErrorHandler.cpp",
    2292);
}

uint64_t AppleH15PlatformErrorHandler::_amccPlaneDsidAgeOut(uint64_t a1, unsigned int a2, int a3, int a4)
{
  int v6 = a3 << 18;
  unsigned int v7 = (a3 << 18) + 8 * a4 + 135172;
  uint64_t v8 = (void *)(a1 + 8232);
  int v9 = 10;
  while (1)
  {
    uint64_t result = AppleH15PlatformErrorHandler::_readRegister32(a1, (uint64_t)v8, a2, v7);
    if ((result & 0x4000000) == 0) {
      break;
    }
    int v11 = result;
    AppleH15PlatformErrorHandler::_writeRegister32(result, v8, a2, v7, 0x4000000);
    if (!--v9)
    {
      uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, (uint64_t)v8, a2, v6 | 0x750u);
      uint64_t v24 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v8, a2, v6 | 0x754u);
      uint64_t v23 = AppleH15PlatformErrorHandler::_readRegister32(v24, (uint64_t)v8, a2, v6 | 0x758u);
      uint64_t v22 = AppleH15PlatformErrorHandler::_readRegister32(v23, (uint64_t)v8, a2, v6 | 0x75Cu);
      uint64_t v21 = AppleH15PlatformErrorHandler::_readRegister32(v22, (uint64_t)v8, a2, v6 | 0x760u);
      uint64_t v20 = AppleH15PlatformErrorHandler::_readRegister32(v21, (uint64_t)v8, a2, v6 | 0x764u);
      uint64_t v19 = AppleH15PlatformErrorHandler::_readRegister32(v20, (uint64_t)v8, a2, v6 | 0x778u);
      int v12 = v6 | 0x15000;
      uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v19, (uint64_t)v8, a2, v6 | 0x15000u);
      uint64_t v14 = AppleH15PlatformErrorHandler::_readRegister32(v13, (uint64_t)v8, a2, v12 | 4u);
      uint64_t v15 = AppleH15PlatformErrorHandler::_readRegister32(v14, (uint64_t)v8, a2, v12 | 8u);
      uint64_t v16 = AppleH15PlatformErrorHandler::_readRegister32(v15, (uint64_t)v8, a2, v12 | 0xCu);
      uint64_t v17 = AppleH15PlatformErrorHandler::_readRegister32(v16, (uint64_t)v8, a2, v12 | 0x10u);
      int v18 = AppleH15PlatformErrorHandler::_readRegister32(v17, (uint64_t)v8, a2, v12 | 0x14u);
      panic("\"AMCC%u PLANE%u error: Too many vDSID Ageout interrupts. INTSTS 0x%08x AFERRLOG0/1/2/3/4/5 %#x/%#x/%#x/%#x/%#x/%#x ErrDsid:%#x TimeoutSts0/1/2/3/4/5  %#x/%#x/%#x/%#x/%#x/%#x\" @%s:%d", a2, a3, v11, Register32, v24, v23, v22, v21, v20, v19, v13, v14, v15, v16, v17, v18, "AppleH15PlatformErrorHandler.cpp",
        2406);
    }
  }
  return result;
}

void AppleH15PlatformErrorHandler::_amccPlaneDecodeDirectoryUnexpectedVictim(uint64_t a1, unsigned int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v11 = a1 + 8232;
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a2, ((unsigned __int16)a3 << 18) | 0xA50u);
  int v13 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v11, a2, (a3 << 18) | 0xA54u);
  panic("\"AMCC%u PLANE%u %s error: INTSTS%u 0x%08x FLAG %#x INFO %#x\" @%s:%d", a2, a3, *(const char **)(a6 + 8), a4, *a5, Register32, v13, "AppleH15PlatformErrorHandler.cpp", 2368);
}

void AppleH15PlatformErrorHandler::_amccGenerateEnableMaskforInputTable(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a2 + 20);
  if (v2)
  {
    int v3 = 0;
    int v4 = 0;
    unsigned int v5 = (void *)(*(void *)(a2 + 24) + 16);
    do
    {
      BOOL v6 = *v5 == 0;
      if (v5[1]) {
        BOOL v7 = (v5[1] & 1 | *v5) == 0;
      }
      else {
        BOOL v7 = 1;
      }
      int v8 = v7;
      BOOL v9 = (v6 & v8) == 0;
      if ((v6 & v8) != 0) {
        int v10 = 0;
      }
      else {
        int v10 = *((_DWORD *)v5 - 3);
      }
      v4 |= v10;
      if (v9) {
        int v11 = 0;
      }
      else {
        int v11 = *((_DWORD *)v5 - 3);
      }
      v3 |= v11;
      v5 += 4;
      --v2;
    }
    while (v2);
  }
  else
  {
    int v4 = 0;
    int v3 = 0;
  }
  *(_DWORD *)a2 = v4;
  *(_DWORD *)(a2 + 4) = v3;
}

void AppleH15PlatformErrorHandler::_amccEnableErrorsForInputTable(uint64_t a1, _DWORD *a2, unsigned int a3, int a4)
{
  int v7 = a2[3];
  unsigned int v8 = a2[2] + 1376256;
  BOOL v9 = (void *)(a1 + 8232);
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a3, v8);
  int v11 = Register32 & ~*a2;
  if (a4) {
    int v11 = *a2 | Register32;
  }
  AppleH15PlatformErrorHandler::_writeRegister32(Register32, v9, a3, v8, v11 & ~a2[1]);

  AppleH15PlatformErrorHandler::_writeRegister32(v12, v9, a3, v7 + 1376256, 0);
}

uint64_t AppleH15PlatformErrorHandler::_amccDumpRegsForInputTable(uint64_t a1, _DWORD *a2, unsigned int a3, char *a4, uint64_t a5)
{
  uint64_t v9 = a1 + 8232;
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a3, a2[2] + 1376256);
  int v11 = Register32;
  int v12 = AppleH15PlatformErrorHandler::_readRegister32(Register32, v9, a3, a2[4] + 1376256);
  return snprintf(a4, a5 - (void)a4, "intsts: %x\tinten: %x\tblock enable: %x\n", v12, v11, *a2);
}

void AppleH15PlatformErrorHandler::_amccDumpRegs(AppleH15PlatformErrorHandler *this, unsigned int a2)
{
  bzero(__str, 0x7D0uLL);
  int v4 = snprintf(__str, 0x7CFuLL, "Unhandled AMCC%u Interrupt\n", a2);
  uint64_t v5 = 0;
  BOOL v6 = &__str[v4 + snprintf(&__str[v4], 1999 - v4, "NON PLANE REGISTERS\n")];
  do
  {
    AppleH15PlatformErrorHandler::_amccDumpRegsForInputTable((uint64_t)this, (char *)&AppleH15PlatformErrorHandler::_amccNonPlaneDecoders + v5, a2, v6, (uint64_t)&v18);
    v5 += 32;
  }
  while (v5 != 128);
  AppleH15PlatformErrorHandler::_amccDumpRegsForInputTable((uint64_t)this, AppleH15PlatformErrorHandler::_amccNonPlaneDecoders_EFL, a2, v6, (uint64_t)&v18);
  AppleH15PlatformErrorHandler::_amccDumpRegsForInputTable((uint64_t)this, dword_181C0, a2, v6, (uint64_t)&v18);
  uint64_t v7 = snprintf(v6, &v18 - v6, "PLANE REGISTERS\n");
  uint64_t v8 = 0;
  uint64_t v9 = &v6[(int)v7];
  int v10 = (char *)this + 8232;
  int v11 = 135172;
  do
  {
    uint64_t v16 = v8;
    uint64_t v12 = 0;
    unsigned int v13 = v11;
    do
    {
      uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(v7, (uint64_t)v10, a2, v13 - 4);
      int v15 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v10, a2, v13);
      uint64_t v7 = snprintf(v9, &v18 - v9, "intsts: %x\tinten: %x\tblock enable: %x\n", v15, Register32, AppleH15PlatformErrorHandler::_amccPlaneDecoders[v12]);
      v9 += (int)v7;
      v12 += 6;
      v13 += 8;
    }
    while (v12 != 18);
    uint64_t v8 = v16 + 1;
    v11 += 0x40000;
  }
  while (v16 != 2);
  kprintf("%s::%s: %s\n", "AppleH15PlatformErrorHandler", "_amccDumpRegs", __str);
}

void AppleH15PlatformErrorHandler::_amccDecodeInterrupts(AppleH15PlatformErrorHandler *this, int a2, void *a3)
{
  unsigned __int8 v28 = 0;
  uint64_t v3 = (a2 - *((_DWORD *)this + 136));
  if (v3 >= *((_DWORD *)this + 137)) {
    AppleH15PlatformErrorHandler::_amccDecodeInterrupts();
  }
  if (v3 >= *((_DWORD *)this + 135)) {
    AppleH15PlatformErrorHandler::_amccDecodeInterrupts();
  }
  for (uint64_t i = 0; i != 128; i += 32)
    AppleH15PlatformErrorHandler::_amccDecodeInterruptsForInputTable((uint64_t)this, (int *)((char *)&AppleH15PlatformErrorHandler::_amccNonPlaneDecoders + i), v3, &v28);
  AppleH15PlatformErrorHandler::_amccDecodeInterruptsForInputTable((uint64_t)this, AppleH15PlatformErrorHandler::_amccNonPlaneDecoders_EFL, v3, &v28);
  uint64_t Register32 = AppleH15PlatformErrorHandler::_amccDecodeInterruptsForInputTable((uint64_t)this, dword_181C0, v3, &v28);
  uint64_t v7 = 0;
  uint64_t v8 = (char *)this + 8232;
  int v9 = v28;
  do
  {
    for (uint64_t j = 0; j != 3; ++j)
    {
      unsigned int v27 = 0;
      uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v8, v3, ((v7 << 18) | 0x21004) + 8 * j);
      unsigned int v27 = Register32;
      int v11 = &AppleH15PlatformErrorHandler::_amccPlaneDecoders[6 * j];
      int v12 = *v11;
      if ((*v11 & Register32) != 0)
      {
        unsigned int v13 = &AppleH15PlatformErrorHandler::_amccPlaneDecoders[6 * j];
        unsigned int v16 = v13[2];
        int v15 = (unsigned int *)(v13 + 2);
        unint64_t v14 = v16;
        if (v16)
        {
          unint64_t v17 = 0;
          int v18 = 0;
          uint64_t v19 = *((void *)v15 + 1);
          do
          {
            int v20 = *(_DWORD *)(v19 + 4);
            if ((*v11 & v20) != 0 && (v27 & v20) != 0)
            {
              unint64_t v21 = *(void *)(v19 + 16);
              uint64_t v22 = *(void *)(v19 + 24);
              BOOL v23 = !v22 || (*(void *)(v19 + 24) & 1 | v21) == 0;
              BOOL v24 = !v23;
              if (v21 || v24)
              {
                int v26 = (void *)((char *)this + (v22 >> 1));
                if (v22) {
                  unint64_t v21 = *(void *)(*v26 + v21);
                }
                ((void (*)(void *, uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t))v21)(v26, v3, v7, j, &v27, v19);
                v18 |= *(_DWORD *)(v19 + 4);
                unint64_t v14 = *v15;
                int v9 = 1;
              }
            }
            ++v17;
            v19 += 32;
          }
          while (v17 < v14);
          int v12 = *v11;
          uint64_t Register32 = v27;
          uint64_t v8 = (char *)this + 8232;
        }
        else
        {
          int v18 = 0;
        }
        if ((v12 & ~v18 & Register32) != 0) {
          AppleH15PlatformErrorHandler::_amccDecodeInterrupts();
        }
      }
    }
    ++v7;
  }
  while (v7 != 3);
  if (!v9) {
    AppleH15PlatformErrorHandler::_amccDumpRegs(this, v3);
  }
}

uint64_t AppleH15PlatformErrorHandler::_amccDecodeInterruptsForInputTable(uint64_t a1, int *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 8232, a3, a2[4] + 1376256);
  unsigned int v20 = result;
  int v9 = *a2;
  if ((*a2 & result) != 0)
  {
    unint64_t v10 = a2[5];
    if (v10)
    {
      unint64_t v11 = 0;
      int v12 = 0;
      unsigned int v13 = (unsigned int *)*((void *)a2 + 3);
      do
      {
        if ((v13[1] & v20) != 0)
        {
          unint64_t v14 = *((void *)v13 + 2);
          uint64_t v15 = *((void *)v13 + 3);
          BOOL v16 = !v15 || (*((void *)v13 + 3) & 1 | v14) == 0;
          BOOL v17 = !v16;
          if (v14 || v17)
          {
            uint64_t v19 = (void *)(a1 + (v15 >> 1));
            if (v15) {
              unint64_t v14 = *(void *)(*v19 + v14);
            }
            ((void (*)(void *, uint64_t, void, unsigned int *, unsigned int *))v14)(v19, a3, *v13, &v20, v13);
            v12 |= v13[1];
            *a4 = 1;
            unint64_t v10 = a2[5];
          }
        }
        ++v11;
        v13 += 8;
      }
      while (v11 < v10);
      int v9 = *a2;
      uint64_t result = v20;
    }
    else
    {
      int v12 = 0;
    }
    if ((v9 & ~v12 & result) != 0) {
      AppleH15PlatformErrorHandler::_amccDecodeInterruptsForInputTable();
    }
  }
  return result;
}

void AppleH15PlatformErrorHandler::_dcsDecodeMCUError(uint64_t a1, unsigned int a2, int a3, int a4, _DWORD *a5, uint64_t a6)
{
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
  long long v24 = 0u;
  long long v25 = 0u;
  *(_OWORD *)__str = 0u;
  long long v23 = 0u;
  unsigned int v11 = snprintf(__str, 0x200uLL, "AMCC%u DCS GROUP %u CHANNEL %u %s error: INTSTS 0x%08x", a2, a3, a4, *(const char **)(a6 + 32), *a5);
  int v12 = *(const char **)(a6 + 24);
  uint64_t v13 = strcmp(v12, "mcu");
  if (v13)
  {
    uint64_t v14 = strcmp(v12, "evt");
    if (v14 && (uint64_t v14 = strcmp(v12, "spll_evt"), v14))
    {
      uint64_t v18 = strcmp(*(const char **)(a6 + 32), "M3_AIC_IRQ_EN_FLD");
      if (!v18)
      {
        for (uint64_t i = 0; i != 28; i += 2)
        {
          unsigned int v20 = (&CLLT_Registers)[i];
          int Register32 = AppleH15PlatformErrorHandler::_readRegister32(v18, a1 + 12872, 1u, (&CLLT_Registers)[i + 1]);
          uint64_t v18 = snprintf(&__str[v11], 512 - v11, " %s:0x%x", v20, Register32);
          v11 += v18;
        }
      }
    }
    else
    {
      int v15 = *(_DWORD *)(a6 + 8) + (a3 << 21);
      uint64_t v16 = a1 + 8232;
      uint64_t v17 = AppleH15PlatformErrorHandler::_readRegister32(v14, v16, a2, *(_DWORD *)(a6 + 16) + v15 + 4);
      AppleH15PlatformErrorHandler::_readRegister32(v17, v16, a2, v15 + *(_DWORD *)(a6 + 16) + 8);
      snprintf(&__str[v11], 512 - v11, " DATA0 @ 0x%012lx 0x%08x, DATA1 @ 0x%012lx 0x%08x");
    }
  }
  else if ((*a5 & 0x400000) != 0)
  {
    AppleH15PlatformErrorHandler::_readRegister32(v13, a1 + 8232, a2, *(_DWORD *)(a6 + 8) + (a3 << 21) + 2032);
    snprintf(&__str[v11], 512 - v11, " UFDI_ERR_STS: 0x%08x");
  }
  else if ((*a5 & 0x240000) != 0)
  {
    AppleH15PlatformErrorHandler::_readRegister32(v13, a1 + 8232, a2, *(_DWORD *)(a6 + 8) + (a3 << 21) + 1052);
    snprintf(&__str[v11], 512 - v11, " CS0Odts: 0x%x CS1Odts: 0x%x");
  }
  panic("\"%s\" @%s:%d", __str, "AppleH15PlatformErrorHandler.cpp", 3331);
}

uint64_t AppleH15PlatformErrorHandler::_dscChannelAndGroupToOffset(AppleH15PlatformErrorHandler *this, unsigned int a2, int a3)
{
  return (this + (a3 << 21));
}

uint64_t AppleH15PlatformErrorHandler::_dcsDecodeInterrupts(uint64_t this, int a2, void *a3)
{
  memset(v38, 0, 60);
  unsigned int v3 = a2 - *(_DWORD *)(this + 712);
  if (v3 >= *(_DWORD *)(this + 716)) {
    AppleH15PlatformErrorHandler::_dcsDecodeInterrupts();
  }
  uint64_t v4 = this;
  unsigned int v5 = *(_DWORD *)(this + 540);
  if (v3 >= 6 * v5) {
    int v6 = 6 * v5;
  }
  else {
    int v6 = 0;
  }
  unsigned int v7 = v3 - v6;
  unint64_t v8 = v7 / 6uLL;
  if (v8 >= v5) {
    AppleH15PlatformErrorHandler::_dcsDecodeInterrupts();
  }
  uint64_t v9 = 0;
  char v10 = 0;
  uint64_t v11 = v7 % 6;
  int v12 = v11 << 21;
  uint64_t v36 = this + 8232;
  do
  {
    uint64_t v13 = (_DWORD *)((char *)&AppleH15PlatformErrorHandler::_dcsDecoders + 24 * v9);
    uint64_t v14 = v13 + 2;
    if (v13[2])
    {
      int v15 = (char *)&AppleH15PlatformErrorHandler::_dcsDecoders + 24 * v9;
      uint64_t v17 = *((void *)v15 + 2);
      uint64_t v16 = (uint64_t *)(v15 + 16);
      int v18 = *(_DWORD *)(v17 + 8) + v12;
      int v19 = *(_DWORD *)(v17 + 16);
      *(_DWORD *)long long v37 = 0;
      this = AppleH15PlatformErrorHandler::_readRegister32(this, v36, v8, v18 + v19);
      *(_DWORD *)long long v37 = this;
      int v20 = *v13 & this;
      if (v20)
      {
        unint64_t v21 = *v14;
        if (v21)
        {
          unint64_t v22 = 0;
          uint64_t v23 = *v16;
          do
          {
            if ((*(_DWORD *)(v23 + 4) & *(_DWORD *)v37) != 0)
            {
              unint64_t v24 = *(void *)(v23 + 40);
              uint64_t v25 = *(void *)(v23 + 48);
              BOOL v26 = !v25 || (*(void *)(v23 + 48) & 1 | v24) == 0;
              BOOL v27 = !v26;
              if (v24 || v27)
              {
                long long v29 = (void *)(v4 + (v25 >> 1));
                if (v25) {
                  unint64_t v24 = *(void *)(*v29 + v24);
                }
                this = ((uint64_t (*)(void *, unint64_t, uint64_t, void, char *, uint64_t))v24)(v29, v8, v11, 0, v37, v23);
                *((_DWORD *)v38 + v9) |= *(_DWORD *)(v23 + 4);
                unint64_t v21 = *v14;
                char v10 = 1;
              }
            }
            ++v22;
            v23 += 56;
          }
          while (v22 < v21);
          int v20 = *(_DWORD *)v37 & *v13;
          int v12 = v11 << 21;
        }
        if ((v20 & ~*((_DWORD *)v38 + v9)) != 0) {
          AppleH15PlatformErrorHandler::_dcsDecodeInterrupts();
        }
      }
    }
    ++v9;
  }
  while (v9 != 15);
  if ((v10 & 1) == 0)
  {
    bzero(v37, 0x7D0uLL);
    unint64_t v31 = 0;
    uint64_t v32 = 0;
    unsigned int v33 = 0;
    long long v34 = &off_18518;
    while (1)
    {
      if (*((_DWORD *)v34 - 2))
      {
        int Register32 = AppleH15PlatformErrorHandler::_readRegister32(v30, v36, v8, *((_DWORD *)*v34 + 2) + v12 + *((_DWORD *)*v34 + 4));
        uint64_t v30 = snprintf(&v37[v32], 2000 - v32, "%d:%08x/%08x ", v31, Register32, *((_DWORD *)v38 + v31));
        v33 += v30;
      }
      if (v31 <= 0xD)
      {
        v34 += 3;
        ++v31;
        uint64_t v32 = v33;
        if (v33 < 0x7D0) {
          continue;
        }
      }
      panic("\"Unhandled DCS interrupt: AMCC%u DCS Group %u Channel %u: %s\" @%s:%d", v8, v11, 0, v37, "AppleH15PlatformErrorHandler.cpp", 3277);
    }
  }
  return this;
}

uint64_t AppleH15PlatformErrorHandler::_d2dAfxDecodeInterrupts(uint64_t result, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  unsigned int v26 = 0;
  unsigned int v8 = a5[4];
  uint64_t v9 = (a3 - a5[3]);
  if (v9 >= v8) {
    AppleH15PlatformErrorHandler::_d2dAfxDecodeInterrupts();
  }
  unsigned int v10 = a5[2];
  if (v9 >= v10) {
    AppleH15PlatformErrorHandler::_d2dAfxDecodeInterrupts();
  }
  if (v10 != v8) {
    AppleH15PlatformErrorHandler::_d2dAfxDecodeInterrupts();
  }
  if (a8)
  {
    uint64_t v15 = result;
    unint64_t v16 = 0;
    unsigned int v17 = 1;
    do
    {
      unsigned int v18 = *(_DWORD *)(a7 + 56 * v16 + 8);
      if (v18 == -1)
      {
        uint64_t result = v26;
      }
      else
      {
        uint64_t result = AppleH15PlatformErrorHandler::_readRegister32(result, a6, v9, v18);
        unsigned int v26 = result;
      }
      if ((*(_DWORD *)(a7 + 56 * v16 + 12) & result) != 0)
      {
        uint64_t v19 = a7 + 56 * v16;
        unint64_t v20 = *(void *)(v19 + 40);
        uint64_t v21 = *(void *)(v19 + 48);
        BOOL v22 = !v21 || (*(void *)(v19 + 48) & 1 | v20) == 0;
        BOOL v23 = !v22;
        if (v20 || v23)
        {
          uint64_t v25 = (void *)(v15 + (v21 >> 1));
          if (v21) {
            unint64_t v20 = *(void *)(*v25 + v20);
          }
          uint64_t result = ((uint64_t (*)(void *, uint64_t, uint64_t, unsigned int *, uint64_t, unint64_t))v20)(v25, a2, v9, &v26, a6, a7 + 56 * v16);
        }
      }
      unint64_t v16 = v17++;
    }
    while (v16 < a8);
  }
  return result;
}

void AppleH15PlatformErrorHandler::_d2dAfxErrorNoData(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4, uint64_t a5, uint64_t a6)
{
  if (a3 < 4)
  {
    int v6 = "right";
    if ((a3 & 1) == 0) {
      int v6 = "left";
    }
    panic("\"Die %u %s D2D %s %s error: 0x%08x\" @%s:%d", a3 >> 1, v6, *(const char **)(a6 + 24), *(const char **)(a6 + 32), *a4, "AppleH15PlatformErrorHandler.cpp", 3817);
  }
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_d2dAfxErrorNoData", "AppleH15PlatformErrorHandler.cpp", 3814);
}

void AppleH15PlatformErrorHandler::_d2dAfxErrorWithData(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4, uint64_t a5, uint64_t a6)
{
  if (a3 < 4)
  {
    char v8 = a3;
    unsigned int v9 = a3 >> 1;
    int Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a5, a3, *(_DWORD *)(a6 + 16));
    uint64_t v11 = "right";
    if ((v8 & 1) == 0) {
      uint64_t v11 = "left";
    }
    panic("\"Die %u %s D2D %s %s error: 0x%08x data 0x%08x\" @%s:%d", v9, v11, *(const char **)(a6 + 24), *(const char **)(a6 + 32), *a4, Register32, "AppleH15PlatformErrorHandler.cpp", 3835);
  }
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_d2dAfxErrorWithData", "AppleH15PlatformErrorHandler.cpp", 3830);
}

void AppleH15PlatformErrorHandler::_ioaPanic(uint64_t a1, unsigned int a2, _DWORD *a3, uint64_t a4)
{
  int v7 = *(_DWORD *)(a4 + 4);
  char v8 = (void *)(a1 + 12232);
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32(a1, a1 + 12232, a2, v7 + 4);
  unsigned int v10 = Register32;
  uint64_t v11 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v8, a2, v7 + 8);
  unsigned int v12 = v11;
  uint64_t v13 = AppleH15PlatformErrorHandler::_readRegister32(v11, (uint64_t)v8, a2, v7 + 12);
  unsigned int v14 = v13;
  uint64_t v15 = AppleH15PlatformErrorHandler::_readRegister32(v13, (uint64_t)v8, a2, v7 + 16);
  unsigned int v16 = v15;
  unsigned int v17 = AppleH15PlatformErrorHandler::_readRegister32(v15, (uint64_t)v8, a2, v7 + 20);
  unsigned int v18 = AppleH15PlatformErrorHandler::_fabricCommands[v10 & 0x3F];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v19 = v12 | ((unint64_t)((v14 >> 20) & 0x3FF) << 32);
  long long v31 = 0u;
  long long v32 = 0u;
  int v20 = (v17 >> 25) & 3;
  int v21 = v17 & 0x1FFFFFF;
  if (!v18) {
    unsigned int v18 = "???";
  }
  long long v29 = 0uLL;
  long long v30 = 0uLL;
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  *(_OWORD *)__str = 0uLL;
  long long v26 = 0uLL;
  uint64_t v22 = snprintf(__str, 0x100uLL, "IOA%u Die %d %s Error: intsts0 0x%08x ADDR/SIZE 0x%016llx/%#x CMD/AFID/TID/STAT %#x(%s)/%#x/%#x/%#x VC/SubCH %#x/%#x USR/EXT/TZ/CRH %#x/%#x/%#x/%#x", a2, (v14 >> 11) & 3, *(const char **)(a4 + 8), *a3, v12 | ((unint64_t)((v14 >> 20) & 0x3FF) << 32), v16 & 0x7F, v10 & 0x3F, v18, (v10 >> 9) & 0x3FFFF, v14 & 0x7FF, (v10 >> 6) & 7, (v14 >> 13) & 0xF, (v14 >> 17) & 7, v16 >> 12, v21,
          (v16 >> 7) & 0x1F,
          v20);
  int v23 = *(_DWORD *)a4 & *a3;
  if ((!v23 || (v10 & 0x7FFFC00) != 0x24C6000)
    && (!v23 || (v19 & 0x3FFFFFFC000) != 0x27F000000 || (*(_DWORD *)a4 & 0x2000) == 0))
  {
    panic("%s @%s:%d", __str, "AppleH15PlatformErrorHandler.cpp", 4609);
  }
  AppleH15PlatformErrorHandler::_writeRegister32(v22, v8, a2, 0xA0Cu, v23);
  AppleH15PlatformErrorHandler::_writeRegister32(v24, v8, a2, 0xA6Cu, v23);
  *a3 &= ~*(_DWORD *)a4;
}

uint64_t AppleH15PlatformErrorHandler::_ioaDecodeInterrupts(AppleH15PlatformErrorHandler *this, int a2, void *a3)
{
  unsigned int v3 = a2 - *((_DWORD *)this + 184);
  if (v3 >= *((_DWORD *)this + 185)) {
    AppleH15PlatformErrorHandler::_ioaDecodeInterrupts();
  }
  if (v3 >= *((_DWORD *)this + 183)) {
    AppleH15PlatformErrorHandler::_ioaDecodeInterrupts();
  }
  uint64_t result = AppleH15PlatformErrorHandler::_readRegister32((uint64_t)this, (uint64_t)this + 12232, v3, 0xA0Cu);
  unsigned int v9 = result;
  if (result)
  {
    unint64_t v6 = 0;
    int v7 = &AppleH15PlatformErrorHandler::_ioaDecoder;
    do
    {
      if ((*v7 & result) != 0)
      {
        AppleH15PlatformErrorHandler::_ioaPanic((uint64_t)this, v3, &v9, (uint64_t)v7);
        uint64_t result = v9;
      }
      if (!result) {
        break;
      }
      v7 += 8;
    }
    while (v6++ < 0x11);
    if (result) {
      panic("\"Unhandled IOA interrupt: IOA%u status 0x%08x\" @%s:%d", v3, result, "AppleH15PlatformErrorHandler.cpp", 4553);
    }
  }
  return result;
}

void AppleH15PlatformErrorHandler::_sepDecodeInterrupts(AppleH15PlatformErrorHandler *this, int a2, void *a3)
{
  unsigned int v3 = a2 - *((_DWORD *)this + 196);
  if (v3 < *((_DWORD *)this + 197))
  {
    if (v3 < *((_DWORD *)this + 195)) {
      AppleH15PlatformErrorHandler::_sepDecodeMonInterrupts(this, a2, a3);
    }
    panic("\"SEP IRQ: %s\" @%s:%d", *((const char **)&AppleH15PlatformErrorHandler::_sepIRQDecoder + 2 * v3 + 1), "AppleH15PlatformErrorHandler.cpp", 4758);
  }
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_sepDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 4753);
}

void AppleH15PlatformErrorHandler::_sepDecodeMonInterrupts(AppleH15PlatformErrorHandler *this, int a2, void *a3)
{
  if (!*((unsigned char *)this + 141)) {
    panic("\"SEP monitor error\" @%s:%d", "AppleH15PlatformErrorHandler.cpp", 4703);
  }
  uint64_t v4 = (char *)this + 13032;
  uint64_t Register32 = AppleH15PlatformErrorHandler::_readRegister32((uint64_t)this, (uint64_t)this + 13032, 0, 0x14000u);
  uint64_t v6 = AppleH15PlatformErrorHandler::_readRegister32(Register32, (uint64_t)v4, 0, 0x14008u);
  uint64_t v7 = AppleH15PlatformErrorHandler::_readRegister32(v6, (uint64_t)v4, 0, 0x14400u);
  uint64_t v8 = AppleH15PlatformErrorHandler::_readRegister32(v7, (uint64_t)v4, 0, 0x14408u);
  uint64_t v9 = AppleH15PlatformErrorHandler::_readRegister32(v8, (uint64_t)v4, 0, 0x15400u);
  uint64_t v10 = AppleH15PlatformErrorHandler::_readRegister32(v9, (uint64_t)v4, 0, 0x14C00u);
  uint64_t v11 = (char *)this + 12872;
  uint64_t v12 = AppleH15PlatformErrorHandler::_readRegister32(v10, (uint64_t)this + 12872, 0, 0x5C000u);
  int v13 = AppleH15PlatformErrorHandler::_readRegister32(v12, (uint64_t)v11, 1u, 0x38u);
  if (!Register32)
  {
    unsigned int v14 = (const char *)&unk_404D;
    if (!v6) {
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  uint64_t v15 = 0;
  unsigned int v14 = "*UNKNOWN*";
  while ((AppleH15PlatformErrorHandler::_sepMonDecoder[v15] & Register32) == 0)
  {
    v15 += 4;
    if (v15 == 44)
    {
      if (!v6) {
        goto LABEL_10;
      }
LABEL_12:
      uint64_t v17 = 0;
      unsigned int v16 = "*UNKNOWN*";
      while ((AppleH15PlatformErrorHandler::_sepCPMDecoder[v17] & v6) == 0)
      {
        v17 += 4;
        if (v17 == 36) {
          goto LABEL_17;
        }
      }
      unsigned int v16 = *(const char **)&AppleH15PlatformErrorHandler::_sepCPMDecoder[v17 + 2];
LABEL_17:
      panic("\"SEP monitor error: MON_ERROR_STATUS 0x%08x(%s) MON_CPM_STATUS 0x%08x(%s) SEPCLK_DFREQ_MON_MEAS 0x%08x NCLK_DFREQ_MON_MEAS 0x%08x BOOT_NUMBER 0x%08x THERMAL_TEMP 0x%08x SOC_PERF_STATE_CTL 0x%08x VOLMAN_SOC_VOLTAGE 0x%08x\" @%s:%d", Register32, v14, v6, v16, v7, v8, v9, v10, v12, v13, "AppleH15PlatformErrorHandler.cpp", 4743);
    }
  }
  unsigned int v14 = *(const char **)&AppleH15PlatformErrorHandler::_sepMonDecoder[v15 + 2];
  if (v6) {
    goto LABEL_12;
  }
LABEL_10:
  unsigned int v16 = (const char *)&unk_404D;
  goto LABEL_17;
}

void AppleH15PlatformErrorHandler::_sramDecodeInterrupts(AppleH15PlatformErrorHandler *this, int a2, void *a3)
{
}

OSMetaClass *_GLOBAL__sub_I_AppleH15PlatformErrorHandler_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&AppleH15PlatformErrorHandler::gMetaClass, "AppleH15PlatformErrorHandler", &IOService::gMetaClass, 0x3960u);
  result->__vftable  = (OSMetaClass_vtbl *)off_22380;
  return result;
}

void global destructor keyed to'_a_0()
{
}

OSMetaClass *AppleH15MemCacheController::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleH15MemCacheController", &AppleMemCacheController::gMetaClass, 0x850u);
  result->__vftable  = (OSMetaClass_vtbl *)off_23FA0;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleH15MemCacheController", &AppleMemCacheController::gMetaClass, 0x850u);
  result->__vftable  = (OSMetaClass_vtbl *)off_23FA0;
  return result;
}

void AppleH15MemCacheController::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleH15MemCacheController::AppleH15MemCacheController(AppleH15MemCacheController *this, const OSMetaClass *a2)
{
  AppleMemCacheController::AppleMemCacheController(this, a2);
  void *v2 = off_23930;
}

{
  void *v2;

  AppleMemCacheController::AppleMemCacheController(this, a2);
  void *v2 = off_23930;
}

void AppleH15MemCacheController::~AppleH15MemCacheController(AppleH15MemCacheController *this)
{
}

{
  AppleMemCacheController::~AppleMemCacheController(this);
}

{
  uint64_t vars8;

  AppleMemCacheController::~AppleMemCacheController(this);

  _OSObject_typed_operator_delete(&AppleH15MemCacheController_ktv, this, 2128);
}

void AppleH15MemCacheController::operator delete(void *a1, uint64_t a2)
{
}

void *AppleH15MemCacheController::getMetaClass(AppleH15MemCacheController *this)
{
  return &AppleH15MemCacheController::gMetaClass;
}

AppleMemCacheController *AppleH15MemCacheController::MetaClass::alloc(AppleH15MemCacheController::MetaClass *this)
{
  unsigned int v1 = (AppleMemCacheController *)OSObject_typed_operator_new();
  AppleMemCacheController::AppleMemCacheController(v1, &AppleH15MemCacheController::gMetaClass);
  void *v2 = off_23930;
  OSMetaClass::instanceConstructed(&AppleH15MemCacheController::gMetaClass);
  return v1;
}

uint64_t AppleH15MemCacheController::operator new(AppleH15MemCacheController *this)
{
  return OSObject_typed_operator_new();
}

void AppleH15MemCacheController::AppleH15MemCacheController(AppleH15MemCacheController *this)
{
  AppleMemCacheController::AppleMemCacheController(this, &AppleH15MemCacheController::gMetaClass);
  void *v1 = off_23930;
  OSMetaClass::instanceConstructed(&AppleH15MemCacheController::gMetaClass);
}

{
  void *v1;

  AppleMemCacheController::AppleMemCacheController(this, &AppleH15MemCacheController::gMetaClass);
  void *v1 = off_23930;
  OSMetaClass::instanceConstructed(&AppleH15MemCacheController::gMetaClass);
}

uint64_t AppleH15MemCacheController::ml_mcache_flush_callback(AppleH15MemCacheController *this)
{
  return 0;
}

void AppleH15MemCacheController::_mccFlush(AppleH15MemCacheController *this)
{
  if (*((_DWORD *)this + 36))
  {
    if ((gMccDebug & 0xFC) != 0)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Flushing Mem Cache ...");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Flushing Mem Cache ...\n", "_mccFlush", 1232);
      }
    }
    OSSynchronizeIO();
    if (*((_DWORD *)this + 493))
    {
      unsigned int v2 = 0;
      do
        AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, v2++, 0x1C1C00u, 0);
      while (v2 < *((_DWORD *)this + 493));
    }
    AppleH15MemCacheController::_mccWaitForWaysPwrOn(this, 0);
    if (*((_DWORD *)this + 493))
    {
      unsigned int v3 = 0;
      do
        AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, v3++, 0x1C1C00u, 1u);
      while (v3 < *((_DWORD *)this + 493));
    }
    OSSynchronizeIO();
  }
}

uint64_t AppleH15MemCacheController::init(AppleH15MemCacheController *this, OSDictionary *a2)
{
}

uint64_t AppleH15MemCacheController::_bitsSetCount(AppleH15MemCacheController *this, unsigned int a2)
{
  uint64_t result = 0;
  if (a2)
  {
    do
    {
      uint64_t result = result + (a2 & 1);
      BOOL v3 = a2 > 1;
      a2 >>= 1;
    }
    while (v3);
  }
  return result;
}

uint64_t AppleH15MemCacheController::start(AppleH15MemCacheController *this, OSDictionary *a2)
{
  *((void *)this + 242)  = a2;
  uint64_t v4 = IORegistryEntry::fromPath("IODeviceTree:/chosen", 0, 0, 0, 0);
  if (v4)
  {
    unsigned int v5 = v4;
    uint64_t v6 = (const OSMetaClassBase *)((uint64_t (*)(IORegistryEntry *, const char *))v4->getProperty_1)(v4, "chip-id");
    uint64_t v7 = OSMetaClassBase::safeMetaCast(v6, OSData::metaClass);
    if (v7)
    {
      uint64_t v8 = v7;
      if (((unsigned int (*)(OSMetaClassBase *))v7->__vftable[1].getMetaClass)(v7) == 4) {
        *((_DWORD *)this + 486)  = *(_DWORD *)((uint64_t (*)(OSMetaClassBase *))v8->__vftable[2].~OSMetaClassBase_0)(v8);
      }
    }
    ((void (*)(IORegistryEntry *))v5->release_0)(v5);
  }
  if (gMccDebug >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: _chipId  = 0x%x", *((_DWORD *)this + 486));
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: start: _chipId  = 0x%x\n", "start", 466, *((_DWORD *)this + 486));
    }
  }
  if (*((_DWORD *)this + 486) == 24626) {
    int v9 = 2;
  }
  else {
    int v9 = 1;
  }
  if (*((_DWORD *)this + 486) == 24626) {
    int v10 = 4;
  }
  else {
    int v10 = 3;
  }
  *((_DWORD *)this + 489)  = v9;
  *((_DWORD *)this + 494)  = v10;
  uint64_t v11 = *(void *)((uint64_t (*)(OSDictionary *))a2->__vftable[2].initWithCapacity)(a2);
  uint64_t v12 = *(void *)(*(uint64_t (**)(void))(v11 + 880))();
  int v13 = (const OSMetaClassBase *)(*(uint64_t (**)(void))(v12 + 280))();
  unsigned int v14 = (const OSMetaClass *)OSData::metaClass;
  uint64_t v15 = OSMetaClassBase::safeMetaCast(v13, OSData::metaClass);
  if (v15) {
    int v16 = *(_DWORD *)((uint64_t (*)(OSMetaClassBase *))v15->__vftable[2].~OSMetaClassBase_0)(v15);
  }
  else {
    int v16 = 0;
  }
  *((_DWORD *)this + 487)  = v16;
  unsigned __int8 v17 = gMccDebug;
  if (gMccDebug >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: _chipRevision  = 0x%x", v16);
    unsigned __int8 v17 = gMccDebug;
    if ((gMccDebug & 0xFF00) != 0)
    {
      kprintf("%s:%d: start: _chipRevision  = 0x%x\n", "start", 484, *((_DWORD *)this + 487));
      unsigned __int8 v17 = gMccDebug;
    }
  }
  if (v17 >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: AMCCPlaneStride  = %x", 0x40000);
    unsigned __int8 v17 = gMccDebug;
    if ((gMccDebug & 0xFF00) != 0)
    {
      kprintf("%s:%d: start: AMCCPlaneStride  = %x\n", "start", 485, 0x40000);
      unsigned __int8 v17 = gMccDebug;
    }
  }
  if (v17 >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: AMCCPlaneOffset  = %x", 0);
    unsigned __int8 v17 = gMccDebug;
    if ((gMccDebug & 0xFF00) != 0)
    {
      kprintf("%s:%d: start: AMCCPlaneOffset  = %x\n", "start", 486, 0);
      unsigned __int8 v17 = gMccDebug;
    }
  }
  if (v17 >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: AMCNonPlaneOffset  = %x", 0x100000);
    unsigned __int8 v17 = gMccDebug;
    if ((gMccDebug & 0xFF00) != 0)
    {
      kprintf("%s:%d: start: AMCNonPlaneOffset  = %x\n", "start", 487, 0x100000);
      unsigned __int8 v17 = gMccDebug;
    }
  }
  if (v17 >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: AMCCDCSStride  = %x", 0x200000);
    unsigned __int8 v17 = gMccDebug;
    if ((gMccDebug & 0xFF00) != 0)
    {
      kprintf("%s:%d: start: AMCCDCSStride  = %x\n", "start", 488, 0x200000);
      unsigned __int8 v17 = gMccDebug;
    }
  }
  if (v17 >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: AMCCDCSOffset  = %x", 0x400000);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: start: AMCCDCSOffset  = %x\n", "start", 489, 0x400000);
    }
  }
  int PropertyCount = AppleH15MemCacheController::_getPropertyCount(this, "reg", 0x10uLL);
  if (!PropertyCount) {
    AppleH15MemCacheController::start();
  }
  *((_DWORD *)this + 493)  = PropertyCount - *((_DWORD *)this + 494);
  unint64_t v19 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->removeObject_1)(a2, "plane-count-per-amcc");
  int v20 = OSMetaClassBase::safeMetaCast(v19, v14);
  if (!v20) {
    AppleH15MemCacheController::start();
  }
  *((_DWORD *)this + 491)  = *(_DWORD *)((uint64_t (*)(OSMetaClassBase *))v20->__vftable[2].~OSMetaClassBase_0)(v20);
  int v21 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->removeObject_1)(a2, "dcs-count-per-amcc");
  uint64_t v22 = OSMetaClassBase::safeMetaCast(v21, v14);
  if (!v22) {
    AppleH15MemCacheController::start();
  }
  int v23 = (int *)((uint64_t (*)(OSMetaClassBase *))v22->__vftable[2].~OSMetaClassBase_0)(v22);
  int v24 = *v23;
  *((_DWORD *)this + 492)  = *v23;
  int v25 = *((_DWORD *)this + 493);
  *((_DWORD *)this + 490)  = v25 * v24;
  unsigned __int8 v26 = gMccDebug;
  if (gMccDebug >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: _amccNum  = %d", v25);
    unsigned __int8 v26 = gMccDebug;
    if ((gMccDebug & 0xFF00) != 0)
    {
      kprintf("%s:%d: start: _amccNum  = %d\n", "start", 510, *((_DWORD *)this + 493));
      unsigned __int8 v26 = gMccDebug;
    }
  }
  if (v26 >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: _planeNumPerAMCC  = %d", *((_DWORD *)this + 491));
    unsigned __int8 v26 = gMccDebug;
    if ((gMccDebug & 0xFF00) != 0)
    {
      kprintf("%s:%d: start: _planeNumPerAMCC  = %d\n", "start", 511, *((_DWORD *)this + 491));
      unsigned __int8 v26 = gMccDebug;
    }
  }
  if (v26 >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: _dcsNumChannelsPerAMCC  = %d", *((_DWORD *)this + 492));
    unsigned __int8 v26 = gMccDebug;
    if ((gMccDebug & 0xFF00) != 0)
    {
      kprintf("%s:%d: start: _dcsNumChannelsPerAMCC  = %d\n", "start", 512, *((_DWORD *)this + 492));
      unsigned __int8 v26 = gMccDebug;
    }
  }
  long long v27 = (_DWORD *)((char *)this + 1960);
  if (v26 >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: _dcsNumChannels  = %d", *v27);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: start: _dcsNumChannels  = %d\n", "start", 513, *v27);
    }
  }
  if (!*((_DWORD *)this + 493)) {
    AppleH15MemCacheController::start();
  }
  if (gMccDebug >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: Number of AMCCs Defined %d", *((_DWORD *)this + 493));
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: start: Number of AMCCs Defined %d\n", "start", 519, *((_DWORD *)this + 493));
    }
  }
  if (AppleH15MemCacheController::_mapApertures((uint64_t)this, (uint64_t)this + 920, 0x10u)) {
    AppleH15MemCacheController::start();
  }
  (*(void (**)(AppleH15MemCacheController *, char *))(*(void *)this + 1464))(this, (char *)this + 1952);
  *((unsigned char *)this + 2080)  = 0;
  if (!(*(uint64_t (**)(void))(**((void **)this + 242) + 280))()) {
    AppleH15MemCacheController::start();
  }
  *((unsigned char *)this + 2080)  = 1;
  if (*((_DWORD *)this + 489))
  {
    unsigned __int8 v28 = 0;
    do
    {
      uint64_t v29 = ((uint64_t (*)(OSDictionary *, void, void))a2->__vftable[2].getObject_0)(a2, (v28 + 2), 0);
      *((void *)this + 261)  = v29;
      if (!v29) {
        AppleH15MemCacheController::start();
      }
      *((void *)this + v28++ + 262)  = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 120))(v29);
    }
    while (*((_DWORD *)this + 489) > v28);
  }
  uint64_t v30 = (*(uint64_t (**)(void, uint64_t, void))(**((void **)this + 242) + 976))(*((void *)this + 242), 1, 0);
  *((void *)this + 163)  = v30;
  if (!v30) {
    AppleH15MemCacheController::start();
  }
  uint64_t v31 = (*(uint64_t (**)(uint64_t))(*(void *)v30 + 120))(v30);
  *((void *)this + 164)  = v31;
  if ((gMccDebug & 0xFC) != 0)
  {
    uint64_t v32 = v31;
    long long v33 = (const void *)*((void *)this + 163);
    uint64_t v34 = (*(uint64_t (**)(const void *))(*(void *)v33 + 136))(v33);
    IOPhysicalAddress PhysicalAddress = IOMemoryMap::getPhysicalAddress(*((IOMemoryMap **)this + 163));
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MCW map %p base %llu length %llu physical address %llu", v33, v32, v34, PhysicalAddress);
    if (*((unsigned char *)&gMccDebug + 1))
    {
      long long v36 = (const void *)*((void *)this + 163);
      uint64_t v37 = *((void *)this + 164);
      uint64_t v38 = (*(uint64_t (**)(const void *))(*(void *)v36 + 136))(v36);
      IOPhysicalAddress v39 = IOMemoryMap::getPhysicalAddress(*((IOMemoryMap **)this + 163));
      kprintf("%s:%d: MCW map %p base %llu length %llu physical address %llu\n", "start", 550, v36, v37, v38, v39);
    }
  }
  long long v40 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->removeObject_1)(a2, "dramcfg-data");
  long long v41 = OSMetaClassBase::safeMetaCast(v40, v14);
  if (v41 && (long long v42 = v41, ((unsigned int (*)(OSMetaClassBase *))v41->__vftable[1].getMetaClass)(v41) >= 4))
  {
    *((_DWORD *)this + 330)  = ((unsigned int (*)(OSMetaClassBase *))v42->__vftable[1].getMetaClass)(v42) >> 2;
    uint64_t v43 = ((uint64_t (*)(OSMetaClassBase *))v42->__vftable[2].~OSMetaClassBase_0)(v42);
  }
  else
  {
    uint64_t v43 = 0;
    *((_DWORD *)this + 330)  = 0;
  }
  *((void *)this + 167)  = v43;
  if (gMccDebug >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: found %u DRAMCFGMode entries\n", *((_DWORD *)this + 330));
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: start: found %u DRAMCFGMode entries\n\n", "start", 562, *((_DWORD *)this + 330));
    }
  }
  uint64_t v44 = IOMallocData();
  *((void *)this + 166)  = v44;
  if (!v44) {
    AppleH15MemCacheController::start((_DWORD *)this + 490);
  }
  if (*v27)
  {
    unint64_t v45 = 0;
    do
    {
      *(_DWORD *)(*((void *)this + 166) + 4 * v45)  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v45 / *((_DWORD *)this + 492), ((v45 % *((_DWORD *)this + 492)) << 21) + 4199368);
      ++v45;
    }
    while (v45 < *((unsigned int *)this + 490));
  }
  long long v46 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->removeObject_1)(a2, "dcs-true-mr4-read-support");
  if (OSMetaClassBase::safeMetaCast(v46, v14)) {
    *((_WORD *)this + 1058)  = 269;
  }
  {
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "super start failed");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: super start failed\n");
      }
    }
    return 0;
  }
  MCPolicyMgrFactory  = AppleMemCacheController::getMCPolicyMgrFactory(this);
  *((void *)this + 259)  = MCPolicyMgrFactory;
  if (!MCPolicyMgrFactory) {
    AppleH15MemCacheController::start();
  }
  long long v48 = IOCommandGate::commandGate((OSObject *)this, 0);
  *((void *)this + 248)  = v48;
  if (!v48)
  {
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start:failed to create commandgate");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: start:failed to create commandgate\n");
      }
    }
    return 0;
  }
  uint64_t v49 = (*(uint64_t (**)(AppleH15MemCacheController *))(*(void *)this + 888))(this);
  if ((*(unsigned int (**)(uint64_t, void))(*(void *)v49 + 160))(v49, *((void *)this + 248)))
  {
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start:failed to add commandgate to workloop event source");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: start:failed to add commandgate to workloop event source\n");
      }
    }
    return 0;
  }
  long long v51 = IOService::nameMatching("pram", 0);
  if (v51)
  {
    long long v52 = v51;
    long long v53 = IOService::waitForMatchingService(v51, 0xFFFFFFFFFFFFFFFFLL);
    if (!v53) {
      AppleH15MemCacheController::start();
    }
    v54  = v53;
    v55  = (const OSMetaClassBase *)((uint64_t (*)(IOService *, const char *))v53->getProperty_1)(v53, "reg");
    v56  = OSMetaClassBase::safeMetaCast(v55, v14);
    if (!v56) {
      AppleH15MemCacheController::start();
    }
    v57  = (uint64_t)v56;
    if (((unsigned int (*)(OSMetaClassBase *))v56->__vftable[1].getMetaClass)(v56) != 16) {
      AppleH15MemCacheController::start(v57);
    }
    v58  = (unint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)v57 + 216))(v57);
    v59  = *v58;
    *((void *)this + 253)  = v58[1];
    ((void (*)(IOService *))v54->release_0)(v54);
    ((void (*)(OSDictionary *))v52->release_0)(v52);
    v60  = gMccDebug;
    if ((gMccDebug & 0xFC) != 0)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "panicPhys=0x%llx", v59);
      v60  = gMccDebug;
      if ((gMccDebug & 0xFF00) != 0)
      {
        kprintf("%s:%d: panicPhys=0x%llx\n", "start", 640, v59);
        v60  = gMccDebug;
      }
    }
    if ((v60 & 0xFC) != 0)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_mccPanicSize=0x%llx", *((void *)this + 253));
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: _mccPanicSize=0x%llx\n", "start", 641, *((void *)this + 253));
      }
    }
    v61  = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->removeObject_1)(a2, "panic-max-size");
    v62  = OSMetaClassBase::safeMetaCast(v61, v14);
    if (!v62) {
      AppleH15MemCacheController::start();
    }
    v63  = (unint64_t *)((uint64_t (*)(OSMetaClassBase *))v62->__vftable[2].~OSMetaClassBase_0)(v62);
    unint64_t v64 = *v63;
    if ((gMccDebug & 0xFC) != 0)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "panicMaxSize=0x%llx", *v63);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: panicMaxSize=0x%llx\n", "start", 648, v64);
      }
    }
    BOOL v65 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->removeObject_1)(a2, "dram-base");
    char v66 = OSMetaClassBase::safeMetaCast(v65, v14);
    if (!v66) {
      AppleH15MemCacheController::start();
    }
    BOOL v67 = (uint64_t *)((uint64_t (*)(OSMetaClassBase *))v66->__vftable[2].~OSMetaClassBase_0)(v66);
    uint64_t v68 = *v67;
    if ((gMccDebug & 0xFC) != 0)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dramBasePhy=0x%llx", *v67);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: dramBasePhy=0x%llx\n", "start", 655, v68);
      }
    }
    BOOL v69 = (const OSMetaClassBase *)((uint64_t (*)(OSDictionary *, const char *))a2->removeObject_1)(a2, "dram-limit");
    char v70 = OSMetaClassBase::safeMetaCast(v69, v14);
    if (!v70) {
      AppleH15MemCacheController::start();
    }
    BOOL v71 = (uint64_t *)((uint64_t (*)(OSMetaClassBase *))v70->__vftable[2].~OSMetaClassBase_0)(v70);
    uint64_t v72 = *v71;
    if ((gMccDebug & 0xFC) != 0)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dramLimit=0x%llx", *v71);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: dramLimit=0x%llx\n", "start", 662, v72);
      }
    }
    unint64_t v73 = *((void *)this + 253);
    if (((v73 | v59) & 0x3F) != 0 || v73 > v64 || v59 >= v72 - v73) {
      panic("STR_CLASS \"::%s:%d: \" \"start:illegal pram range: base=%llx bytes=%llx\" @%s:%d", "start", 669, v59, *((void *)this + 253), "AppleH15MemCacheController.cpp", 669);
    }
    *((void *)this + 252)  = v59 - v68;
    if ((gMccDebug & 0xFC) != 0)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_mccPanicOffset=0x%llx", v59 - v68);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: _mccPanicOffset=0x%llx\n", "start", 674, *((void *)this + 252));
      }
    }
  }
  else
  {
    if ((gMccDebug & 0xFC) != 0)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start:Unable to locate panic memory");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: start:Unable to locate panic memory\n", "start", 676);
      }
    }
    *((void *)this + 253)  = 0;
  }
  uint64_t v74 = 1680;
  *(void *)&long long v75 = -1;
  *((void *)&v75 + 1)  = -1;
  do
  {
    *(_OWORD *)((char *)this + v74)  = v75;
    v74 += 16;
  }
  while (v74 != 1936);
  AppleH15MemCacheController::_mccInitPerfCounters(this);
  AppleH15MemCacheController::_enableDsidProfileCounters(this);
  *((_DWORD *)this + 502)  = 0;
  if (*((_DWORD *)this + 36)) {
    (*(void (**)(AppleH15MemCacheController *, uint64_t))(*(void *)this + 1376))(this, 1);
  }
  AppleARMFunction::registerFunctionParent((AppleARMFunction *)a2, (IOService *)this, v76);
  (*(void (**)(AppleH15MemCacheController *, uint64_t))(*(void *)this + 672))(this, 2);
  AppleH15MemCacheController::_getRankCfgByteMode(this);
  ml_mcache_flush_callback_register();
  if (gMccDebug >= 3u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start: finished");
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: start: finished\n", "start", 708);
    }
  }
  return 1;
}

uint64_t AppleH15MemCacheController::_getPropertyCount(AppleH15MemCacheController *this, const char *a2, unint64_t a3)
{
  uint64_t v4 = (const OSMetaClassBase *)(*(uint64_t (**)(void, const char *))(**((void **)this + 242) + 280))(*((void *)this + 242), a2);
  uint64_t result = (uint64_t)OSMetaClassBase::safeMetaCast(v4, OSData::metaClass);
  if (result)
  {
    unsigned int v6 = (*(uint64_t (**)(uint64_t))(*(void *)result + 160))(result);
    uint64_t result = v6 / a3;
    if (result * a3 != v6) {
      AppleH15MemCacheController::_getPropertyCount();
    }
  }
  return result;
}

uint64_t AppleH15MemCacheController::_mapApertures(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 1972);
  if (v3 > a3) {
    AppleH15MemCacheController::_mapApertures();
  }
  if (v3)
  {
    unint64_t v5 = 0;
    char v6 = 0;
    uint64_t v7 = (const void **)(a2 + 8);
    do
    {
      uint64_t v8 = (*(uint64_t (**)(void, void, void))(**(void **)(a1 + 1936) + 976))(*(void *)(a1 + 1936), (v5 + *(_DWORD *)(a1 + 1976)), 0);
      *(v7 - 1)  = (const void *)v8;
      if (v8)
      {
        *uint64_t v7 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v8 + 120))(v8);
        uint64_t v9 = (*(uint64_t (**)(void))(*(void *)*(v7 - 1) + 136))(*(v7 - 1));
        v7[1]  = (const void *)v9;
        if ((gMccDebug & 0xFC) != 0)
        {
          int v10 = (const void *)v9;
          uint64_t v12 = (IOMemoryMap *)*(v7 - 1);
          uint64_t v11 = *v7;
          IOPhysicalAddress PhysicalAddress = (const void *)IOMemoryMap::getPhysicalAddress(v12);
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amcc aperture %u map %p base %p length %p physical address %p", v5, v12, v11, v10, PhysicalAddress);
          if (*((unsigned char *)&gMccDebug + 1))
          {
            uint64_t v15 = (IOMemoryMap *)*(v7 - 1);
            unsigned int v14 = *v7;
            int v16 = v7[1];
            unsigned __int8 v17 = (const void *)IOMemoryMap::getPhysicalAddress(v15);
            kprintf("%s:%d: amcc aperture %u map %p base %p length %p physical address %p\n", "_mapApertures", 901, v5, v15, v14, v16, v17);
          }
        }
      }
      else
      {
        if ((gMccDebug & 0xFC) != 0)
        {
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to map amcc aperture %u", v5);
          if (*((unsigned char *)&gMccDebug + 1)) {
            kprintf("%s:%d: Failed to map amcc aperture %u\n", "_mapApertures", 890, v5);
          }
        }
        char v6 = 1;
      }
      ++v5;
      v7 += 3;
    }
    while (v5 < *(unsigned int *)(a1 + 1972));
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t AppleH15MemCacheController::_mccReadReg32(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (!a2 || *(_DWORD *)(a1 + 1972) <= a3 || *(void *)(a2 + 16) <= (unint64_t)a4) {
    AppleH15MemCacheController::_mccReadReg32();
  }
  char v6 = (unsigned int *)(*(void *)(a2 + 24 * a3 + 8) + a4);
  uint64_t v7 = *v6;
  if (gMccDebug >= 5u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amcc %u offset %#x @ %p -> %#x", a3, a4, (const void *)(*(void *)(a2 + 24 * a3 + 8) + a4), v7);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: amcc %u offset %#x @ %p -> %#x\n", "_mccReadReg32", 2059, a3, a4, v6, v7);
    }
  }
  return v7;
}

void AppleH15MemCacheController::_mccInitPerfCounters(AppleH15MemCacheController *this)
{
  unsigned int v2 = OSSet::withCapacity(3u);
  *((void *)this + 258)  = v2;
  if (v2)
  {
    unsigned int v3 = IOSimpleLockAlloc();
    *((void *)this + 254)  = v3;
    if (v3)
    {
      *((void *)this + 255)  = IOSimpleReporter::with(this, (IOService *)((char *)&dword_0 + 2), 0, v4);
      *((void *)this + 256)  = IOSimpleReporter::with(this, (IOService *)((char *)&dword_0 + 2), 0, v5);
      uint64_t v7 = IOSimpleReporter::with(this, (IOService *)&stru_B8.reserved2, 0, v6);
      *((void *)this + 257)  = v7;
      if (!*((void *)this + 255) || !*((void *)this + 256) || !v7) {
        AppleH15MemCacheController::_mccInitPerfCounters();
      }
      for (uint64_t i = 0; i != 4; ++i)
      {
        uint64_t v9 = &AppleH15MemCacheController::_kCounterTypes + 2 * i;
        int v11 = *((_DWORD *)v9 + 2);
        int v10 = (unsigned int *)(v9 + 1);
        if (v11)
        {
          uint64_t v12 = 0;
          unint64_t v13 = 0;
          uint64_t v14 = (uint64_t)*(&AppleH15MemCacheController::_kCounterTypes + 2 * i);
          do
          {
            uint64_t v15 = v14 + v12;
            if (*(_DWORD *)(v14 + v12 + 16) >= *((_DWORD *)this + 493)) {
              break;
            }
            AppleH15MemCacheController::_setCntrCtrlParmeters(this, v14, v13);
            switch(*(_DWORD *)(v15 + 4))
            {
              case 0:
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
              case 6:
              case 7:
              case 9:
              case 0xA:
                __asm { BTI             j; jumptable 0000000000010740 cases 0-7,9,10 }
                int v20 = *(const char **)(v14 + v12 + 128);
                if (!v20) {
                  break;
                }
                int v21 = (IOReporter *)*((void *)this + 255);
                unint64_t v22 = *(void *)(v14 + v12 + 120);
                goto LABEL_16;
              case 8:
              case 0xB:
                __asm { BTI             j; jumptable 0000000000010740 cases 8,11 }
                int v21 = (IOReporter *)*((void *)this + 256);
                goto LABEL_15;
              case 0xC:
                __asm { BTI             j; jumptable 0000000000010740 case 12 }
                int v21 = (IOReporter *)*((void *)this + 257);
LABEL_15:
                unint64_t v22 = *(void *)(v14 + v12 + 120);
                int v20 = *(const char **)(v14 + v12 + 128);
LABEL_16:
                IOReporter::addChannel(v21, v22, v20);
                break;
              case 0xD:
              case 0xE:
              case 0xF:
              case 0x11:
              case 0x12:
              case 0x13:
                break;
              default:
                __asm { BTI             j; jumptable 0000000000010740 default case, case 16 }
                AppleH15MemCacheController::_mccInitPerfCounters((_DWORD *)(v14 + v12 + 4));
            }
            __asm { BTI             j; jumptable 0000000000010740 cases 13-15,17-19 }
            *(unsigned char *)v15 |= 1u;
            ++v13;
            v12 += 160;
          }
          while (v13 < *v10);
        }
      }
      AppleH15MemCacheController::_mccRestoreAMCPerfCounterConfig(this);
      IOReportLegend::addReporterLegend(this, *((IOService **)this + 255), (IOReporter *)"AMC Stats", "Perf Counters", v23);
      (*(void (**)(void, void))(**((void **)this + 258) + 240))(*((void *)this + 258), *((void *)this + 255));
      IOReportLegend::addReporterLegend(this, *((IOService **)this + 256), (IOReporter *)"AMC Stats", "Perf Counters", v24);
      (*(void (**)(void, void))(**((void **)this + 258) + 240))(*((void *)this + 258), *((void *)this + 256));
      IOReportLegend::addReporterLegend(this, *((IOService **)this + 257), (IOReporter *)"AMC Stats", "DSID Group Stats", v25);
      unsigned __int8 v26 = *(void (**)(void))(**((void **)this + 258) + 240);
      v26();
    }
    else if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not alloc _mccPerfCountersLock");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Could not alloc _mccPerfCountersLock\n");
      }
    }
  }
  else if (gMccDebug)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not allocation reporter set");
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: Could not allocation reporter set\n");
    }
  }
}

void AppleH15MemCacheController::_enableDsidProfileCounters(AppleH15MemCacheController *this)
{
  unsigned int v2 = (char *)this + 920;
  AppleH15MemCacheController::_mccWriteReg64((uint64_t)this, (uint64_t)this + 920, 0, 0x27018u, 0x10000000);
  if (*((_DWORD *)this + 493))
  {
    unsigned int v3 = 0;
    unsigned int v4 = 0;
    do
    {
      if ((gMccDebug & 0xFC) != 0)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AMCC %d NonPlane vDSID Profile counter(offset: 0x%x) sampling interval set to 0x%x\n", v4, 1433600, 256);
        if (*((unsigned char *)&gMccDebug + 1)) {
          kprintf("%s:%d: AMCC %d NonPlane vDSID Profile counter(offset: 0x%x) sampling interval set to 0x%x\n\n", "_enableDsidProfileCounters", 1568, v4, 1433600, 256);
        }
      }
      AppleH15MemCacheController::_mccWriteReg32((uint64_t)this, (uint64_t)v2, v4, 0x15E000u, 256);
      if (*((_DWORD *)this + 491))
      {
        unsigned int v5 = 1;
        unsigned int v6 = 159752;
        unsigned int v7 = v3;
        do
        {
          AppleH15MemCacheController::_mccWriteReg64((uint64_t)this, (uint64_t)v2, v4, v6, v7 | 0x700);
          if ((gMccDebug & 0xFC) != 0)
          {
            _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AMCC %d Plane %d vDSID Profile counter(offset: 0x%x) set to 0x%llx\n", v4, v5 - 1, v6, v7 | 0x700);
            if (*((unsigned char *)&gMccDebug + 1)) {
              kprintf("%s:%d: AMCC %d Plane %d vDSID Profile counter(offset: 0x%x) set to 0x%llx\n\n", "_enableDsidProfileCounters", 1580, v4, v5 - 1, v6, v7 | 0x700);
            }
          }
          if ((v5 - 1) | v4) {
            uint64_t v8 = 1;
          }
          else {
            uint64_t v8 = 17;
          }
          AppleH15MemCacheController::_mccWriteReg64((uint64_t)this, (uint64_t)v2, v4, v6 - 8, v8);
          if ((gMccDebug & 0xFC) != 0)
          {
            _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AMCC %d Plane %d vDSID Profile counter Enable(offset: 0x%x) set to 0x%llx\n", v4, v5 - 1, v6 - 8, v8);
            if (*((unsigned char *)&gMccDebug + 1)) {
              kprintf("%s:%d: AMCC %d Plane %d vDSID Profile counter Enable(offset: 0x%x) set to 0x%llx\n\n", "_enableDsidProfileCounters", 1588, v4, v5 - 1, v6 - 8, v8);
            }
          }
          unsigned int v3 = v7 + 8;
          if (v5 >= *((_DWORD *)this + 491)) {
            break;
          }
          ++v5;
          v6 += 0x40000;
          BOOL v9 = v7 >= 0x18;
          v7 += 8;
        }
        while (!v9);
      }
      ++v4;
    }
    while (v4 < *((_DWORD *)this + 493) && v3 < 0x20);
  }
}

uint64_t AppleH15MemCacheController::_getRankCfgByteMode(AppleH15MemCacheController *this)
{
  unsigned int v2 = (const OSMetaClassBase *)(*(uint64_t (**)(void, const char *))(**((void **)this + 242) + 280))(*((void *)this + 242), "byte-mode");
  unsigned int v3 = OSMetaClassBase::safeMetaCast(v2, OSData::metaClass);
  if (!v3 || (unsigned int v4 = v3, ((unsigned int (*)(OSMetaClassBase *))v3->__vftable[1].getMetaClass)(v3) != 4)) {
    AppleH15MemCacheController::_getRankCfgByteMode();
  }
  int v5 = *(_DWORD *)((uint64_t (*)(OSMetaClassBase *))v4->__vftable[2].~OSMetaClassBase_0)(v4);
  *((_DWORD *)this + 530)  = v5;
  if ((gMccDebug & 0xFC) != 0)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Byte Mode is %d", v5);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: Byte Mode is %d\n", "_getRankCfgByteMode", 2699, *((_DWORD *)this + 530));
    }
  }
  return 0;
}

uint64_t AppleH15MemCacheController::readCacheSize(AppleH15MemCacheController *this, unsigned int *a2)
{
  Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, 0, 0x100024u);
  *a2  = (Reg32 << 12) & 0xFF00000;
  if ((gMccDebug & 0xFC) != 0)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AMCC cache size: %d bytes\n", (Reg32 << 12) & 0xFF00000);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: AMCC cache size: %d bytes\n\n", "readCacheSize", 723, *a2);
    }
  }
  return 0;
}

uint64_t AppleH15MemCacheController::getMCPolicyMgr(AppleH15MemCacheController *this)
{
  return 0;
}

uint64_t AppleH15MemCacheController::getMCPolicyMgrV2(AppleH15MemCacheController *this)
{
  return *((void *)this + 259);
}

uint64_t AppleH15MemCacheController::getAmccCount(AppleH15MemCacheController *this)
{
  return *((unsigned int *)this + 493);
}

uint64_t AppleH15MemCacheController::callPlatformFunction(AppleH15MemCacheController *this, const OSSymbol *a2, uint64_t a3, void *a4, void *a5, OSMetaClassBase *anObject, AppleARMFunction **a7)
{
  uint64_t v14 = 3758097084;
  if ((const OSSymbol *)gAppleARMFunctionNew == a2)
  {
    uint64_t v15 = OSMetaClassBase::safeMetaCast(anObject, OSData::metaClass);
    if (v15)
    {
      int v16 = *(_DWORD *)(((uint64_t (*)(OSMetaClassBase *))v15->__vftable[2].~OSMetaClassBase_0)(v15) + 4);
      switch(v16)
      {
        case 1298492705:
          unsigned __int8 v17 = (AppleARMFunction *)OSObject_typed_operator_new();
          unsigned int v18 = &AppleMemCachePanicFunction::gMetaClass;
          AppleARMFunction::AppleARMFunction(v17, &AppleMemCachePanicFunction::gMetaClass);
          unint64_t v19 = off_24190;
          break;
        case 1298492736:
          unsigned __int8 v17 = (AppleARMFunction *)OSObject_typed_operator_new();
          unsigned int v18 = &AppleMemCacheFlushFunction::gMetaClass;
          AppleARMFunction::AppleARMFunction(v17, &AppleMemCacheFlushFunction::gMetaClass);
          unint64_t v19 = off_242C8;
          break;
        case 1298492708:
          unsigned __int8 v17 = (AppleARMFunction *)OSObject_typed_operator_new();
          unsigned int v18 = &AppleMemCacheModeFunction::gMetaClass;
          AppleARMFunction::AppleARMFunction(v17, &AppleMemCacheModeFunction::gMetaClass);
          unint64_t v19 = off_24058;
          break;
        default:
      }
      *(void *)unsigned __int8 v17 = v19;
      OSMetaClass::instanceConstructed(v18);
      uint64_t v14 = 0;
      *a7  = v17;
      return v14;
    }
    return 3758097090;
  }
  else if ((const OSSymbol *)gAppleARMFunctionCall != a2)
  {
    if (gIOPlatformActiveActionKey == a2)
    {
      if ((gMccDebug & 0xFC) != 0)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "gIOPlatformActiveActionKey");
        if (*((unsigned char *)&gMccDebug + 1)) {
          kprintf("%s:%d: gIOPlatformActiveActionKey\n", "callPlatformFunction", 780);
        }
      }
      if (*((_DWORD *)this + 36)) {
        (*(void (**)(AppleH15MemCacheController *, uint64_t))(*(void *)this + 1376))(this, 1);
      }
      AppleH15MemCacheController::_mccRestoreAMCPerfCounterConfig(this);
      AppleH15MemCacheController::_enableDsidProfileCounters(this);
      return 0;
    }
    if (gIOPlatformWakeActionKey == a2)
    {
      if ((gMccDebug & 0xFC) != 0)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "gIOPlatformWakeActionKey");
        if (*((unsigned char *)&gMccDebug + 1)) {
          kprintf("%s:%d: gIOPlatformWakeActionKey\n", "callPlatformFunction", 793);
        }
      }
      int v20 = (IOWorkLoop *)(*(uint64_t (**)(AppleH15MemCacheController *))(*(void *)this + 888))(this);
      action[0]  = _NSConcreteStackBlock;
      action[1]  = 0x40000000;
      action[2]  = ___ZN26AppleH15MemCacheController20callPlatformFunctionEPK8OSSymbolbPvS3_S3_S3__block_invoke;
      action[3]  = &__block_descriptor_tmp;
      action[4]  = this;
      IOWorkLoop::runActionBlock(v20, action);
    }
    else
    {
      if (gIOPlatformQuiesceActionKey == a2)
      {
        if (*((_DWORD *)this + 36)) {
          (*(void (**)(AppleH15MemCacheController *, void))(*(void *)this + 1376))(this, 0);
        }
        if (*((unsigned char *)this + 2117)
          && !(unsigned __int16)AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, 0, 0x1000u))
        {
          AppleH15MemCacheController::callPlatformFunction();
        }
        AppleH15MemCacheController::_mccSampleAllPerfCounters(this, 1);
        return 0;
      }
      if (gIOPlatformPanicActionKey == a2)
      {
        if (*((_DWORD *)this + 36)) {
          (*(void (**)(AppleH15MemCacheController *, void))(*(void *)this + 1376))(this, 0);
        }
        return 0;
      }
    }
  }
  return v14;
}

uint64_t AppleMemCacheModeFunction::operator new(AppleMemCacheModeFunction *this)
{
  return OSObject_typed_operator_new();
}

void AppleMemCacheModeFunction::AppleMemCacheModeFunction(AppleMemCacheModeFunction *this)
{
  AppleARMFunction::AppleARMFunction(this, &AppleMemCacheModeFunction::gMetaClass);
  void *v1 = off_24058;
  OSMetaClass::instanceConstructed(&AppleMemCacheModeFunction::gMetaClass);
}

{
  void *v1;

  AppleARMFunction::AppleARMFunction(this, &AppleMemCacheModeFunction::gMetaClass);
  void *v1 = off_24058;
  OSMetaClass::instanceConstructed(&AppleMemCacheModeFunction::gMetaClass);
}

uint64_t AppleMemCachePanicFunction::operator new(AppleMemCachePanicFunction *this)
{
  return OSObject_typed_operator_new();
}

void AppleMemCachePanicFunction::AppleMemCachePanicFunction(AppleMemCachePanicFunction *this)
{
  AppleARMFunction::AppleARMFunction(this, &AppleMemCachePanicFunction::gMetaClass);
  void *v1 = off_24190;
  OSMetaClass::instanceConstructed(&AppleMemCachePanicFunction::gMetaClass);
}

{
  void *v1;

  AppleARMFunction::AppleARMFunction(this, &AppleMemCachePanicFunction::gMetaClass);
  void *v1 = off_24190;
  OSMetaClass::instanceConstructed(&AppleMemCachePanicFunction::gMetaClass);
}

uint64_t AppleMemCacheFlushFunction::operator new(AppleMemCacheFlushFunction *this)
{
  return OSObject_typed_operator_new();
}

void AppleMemCacheFlushFunction::AppleMemCacheFlushFunction(AppleMemCacheFlushFunction *this)
{
  AppleARMFunction::AppleARMFunction(this, &AppleMemCacheFlushFunction::gMetaClass);
  void *v1 = off_242C8;
  OSMetaClass::instanceConstructed(&AppleMemCacheFlushFunction::gMetaClass);
}

{
  void *v1;

  AppleARMFunction::AppleARMFunction(this, &AppleMemCacheFlushFunction::gMetaClass);
  void *v1 = off_242C8;
  OSMetaClass::instanceConstructed(&AppleMemCacheFlushFunction::gMetaClass);
}

void AppleH15MemCacheController::_mccRestoreAMCPerfCounterConfig(AppleH15MemCacheController *this)
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    unsigned int v3 = &AppleH15MemCacheController::_kCounterTypes + 2 * i;
    unsigned int v6 = *((_DWORD *)v3 + 2);
    int v5 = (unsigned int *)(v3 + 1);
    unint64_t v4 = v6;
    if (v6)
    {
      unint64_t v7 = 0;
      uint64_t v8 = (uint64_t)*(&AppleH15MemCacheController::_kCounterTypes + 2 * i);
      do
      {
        if (*(unsigned char *)(v8 + 160 * v7))
        {
          for (unsigned int j = 0; j != 6; ++j)
          {
            if (j >= *(_DWORD *)(v8 + 160 * v7 + 64)) {
              break;
            }
            AppleH15MemCacheController::_writePerfCtrl((uint64_t)this, v8, v7, j);
          }
          AppleH15MemCacheController::_enablePerfCtrl((uint64_t)this, v8, v7, 1);
          unint64_t v4 = *v5;
        }
        ++v7;
      }
      while (v7 < v4);
    }
  }
}

uint64_t ___ZN26AppleH15MemCacheController20callPlatformFunctionEPK8OSSymbolbPvS3_S3_S3__block_invoke(uint64_t a1)
{
  unsigned int v1 = *(void ***)(a1 + 32);
  uint64_t v2 = 210;
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1)  = -1;
  do
  {
    *(_OWORD *)&v1[v2]  = v3;
    v2 += 2;
  }
  while (v2 != 242);
  ((void (*)(void **))(*v1)[171])(v1);
  (*(void (**)(void *, void *, uint64_t))(*v1[259] + 88))(v1[259], &mcDataStreams, 20);
  return 0;
}

void AppleH15MemCacheController::_mccSampleAllPerfCounters(AppleH15MemCacheController *this, int a2)
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    int v5 = &AppleH15MemCacheController::_kCounterTypes + 2 * i;
    int v7 = *((_DWORD *)v5 + 2);
    unsigned int v6 = (unsigned int *)(v5 + 1);
    if (v7)
    {
      unint64_t v8 = 0;
      uint64_t v9 = (uint64_t)*(&AppleH15MemCacheController::_kCounterTypes + 2 * i);
      int v10 = (char *)v9;
      do
      {
        char v11 = *v10;
        v10 += 160;
        if (v11)
        {
          AppleH15MemCacheController::_mccSamplePerfCounter((uint64_t)this, v9, v8, 0);
          if (a2) {
            AppleH15MemCacheController::_enablePerfCtrl((uint64_t)this, v9, v8, 0);
          }
        }
        ++v8;
      }
      while (v8 < *v6);
    }
  }
}

void AppleH15MemCacheController::_mccWaitForWaysPwrOn(AppleH15MemCacheController *this, int a2)
{
  if ((gMccDebug & 0xFC) != 0)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_mccWaitForWaysPwrOn() called with tgt_way_cnt  = %d", a2);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: _mccWaitForWaysPwrOn() called with tgt_way_cnt  = %d\n", "_mccWaitForWaysPwrOn", 913, a2);
    }
  }
  unsigned int v4 = *((_DWORD *)this + 493);
  if (v4)
  {
    unsigned int v5 = 0;
    unsigned int v6 = *((_DWORD *)this + 491);
    do
    {
      if (v6)
      {
        for (unsigned int i = 0; i < v6; ++i)
        {
          unsigned __int8 v8 = gMccDebug;
          if ((gMccDebug & 0xFC) != 0)
          {
            _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amcc %d plane %d", v5, i);
            unsigned __int8 v8 = gMccDebug;
            if ((gMccDebug & 0xFF00) != 0)
            {
              kprintf("%s:%d: amcc %d plane %d\n", "_mccWaitForWaysPwrOn", 917, v5, i);
              unsigned __int8 v8 = gMccDebug;
            }
          }
          if (v8 >= 5u)
          {
            _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "plane_id  = %d", i);
            if (*((unsigned char *)&gMccDebug + 1)) {
              kprintf("%s:%d: plane_id  = %d\n", "_mccWaitForWaysPwrOn", 919, i);
            }
          }
          do
          {
            Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v5, (i << 18) | 0x1C04);
            int v13 = Reg32;
            int v10 = (Reg32 >> 9) & 0x1F;
            if (gMccDebug >= 5u)
            {
              _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Waiting for Data Ways:   target  = %d cur_data_way_count  = %d     reg  = %x", a2, (Reg32 >> 9) & 0x1F, Reg32);
              if (*((unsigned char *)&gMccDebug + 1)) {
                kprintf("%s:%d: Waiting for Data Ways:   target  = %d cur_data_way_count  = %d     reg  = %x\n", "_mccWaitForWaysPwrOn", 926, a2, v10, v13);
              }
            }
          }
          while (v10 != a2);
          do
          {
            unsigned int v11 = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v5, (i << 18) | 0x1C04);
            int v12 = (v11 >> 4) & 0x1F;
            if (gMccDebug >= 5u)
            {
              _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Waiting for Tag Ways:  cur_tag_way_count  = %d", (v11 >> 4) & 0x1F);
              if (*((unsigned char *)&gMccDebug + 1)) {
                kprintf("%s:%d: Waiting for Tag Ways:  cur_tag_way_count  = %d\n", "_mccWaitForWaysPwrOn", 932, v12);
              }
            }
          }
          while (v12 != a2);
          unsigned int v6 = *((_DWORD *)this + 491);
        }
        unsigned int v4 = *((_DWORD *)this + 493);
      }
      ++v5;
    }
    while (v5 < v4);
  }
}

uint64_t AppleH15MemCacheController::setWayMask(AppleH15MemCacheController *this)
{
  if (*((_DWORD *)this + 36) >= 0x11u) {
    *((_DWORD *)this + 36)  = 16;
  }
  Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, 0, 0x1C08u);
  int v3 = *((_DWORD *)this + 36);
  if (v3)
  {
    unsigned int v4 = (v3 + 3) & 0xFFFFFFFC;
    int8x16_t v5 = (int8x16_t)xmmword_6650;
    int32x4_t v6 = (int32x4_t)xmmword_6660;
    uint32x4_t v7 = (uint32x4_t)vdupq_n_s32(v3 - 1);
    v8.i64[0]  = 0x100000001;
    v8.i64[1]  = 0x100000001;
    v9.i64[0]  = 0x400000004;
    v9.i64[1]  = 0x400000004;
    do
    {
      int8x16_t v10 = v5;
      uint32x4_t v11 = (uint32x4_t)v6;
      int8x16_t v5 = vbicq_s8(v5, (int8x16_t)vshlq_u32(v8, (uint32x4_t)v6));
      int32x4_t v6 = vaddq_s32(v6, v9);
      v4 -= 4;
    }
    while (v4);
    int8x16_t v12 = vbslq_s8((int8x16_t)vcgtq_u32(v11, v7), v10, v5);
    *(int8x8_t *)v12.i8  = vand_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL));
    unsigned int v13 = v12.i32[0] & v12.i32[1];
  }
  else
  {
    unsigned int v13 = 0xFFFF;
  }
  if (Reg32 == v13)
  {
    unsigned int v14 = *((_DWORD *)this + 493);
    goto LABEL_10;
  }
  if ((gMccDebug & 0xFC) != 0)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting WayMask to 0x%x\n", v13);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: Setting WayMask to 0x%x\n\n", "setWayMask", 965, v13);
    }
  }
  if (*((_DWORD *)this + 493))
  {
    unsigned int v16 = 0;
    do
      AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, v16++, 0x1C1C00u, 0);
    while (v16 < *((_DWORD *)this + 493));
  }
  AppleH15MemCacheController::_mccWaitForWaysPwrOn(this, 0);
  if (*((_DWORD *)this + 493))
  {
    unsigned int v17 = 0;
    do
    {
      AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, v17++, 0x1C072Cu, 0);
      unsigned int v18 = *((_DWORD *)this + 493);
    }
    while (v17 < v18);
    if (v18)
    {
      for (unsigned int i = 0; i < v20; ++i)
      {
        AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, i, 0x1C1C08u, v13);
        unsigned int v20 = *((_DWORD *)this + 493);
      }
      if (v20)
      {
        for (unsigned int j = 0; j < v14; ++j)
        {
          AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, j, 0x1C072Cu, 1u);
          unsigned int v14 = *((_DWORD *)this + 493);
        }
LABEL_10:
        if (v14)
        {
          unsigned int v15 = 0;
          do
            AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, v15++, 0x1C1C00u, 1u);
          while (v15 < *((_DWORD *)this + 493));
        }
      }
    }
  }
  AppleH15MemCacheController::_mccWaitForWaysPwrOn(this, 16);
  return 0;
}

uint64_t AppleH15MemCacheController::_mccProtectedWriteReg32(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  if (!a2 || *(_DWORD *)(a1 + 1972) <= a3 || *(void *)(a2 + 16) <= (unint64_t)a4) {
    AppleH15MemCacheController::_mccProtectedWriteReg32();
  }
  uint32x4_t v8 = (const void *)(*(void *)(a2 + 24 * a3 + 8) + a4);
  if (gMccDebug >= 5u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amcc %u offset %#x @ %p <- %#x", a3, a4, (const void *)(*(void *)(a2 + 24 * a3 + 8) + a4), a5);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: amcc %u offset %#x @ %p <- %#x\n", "_mccProtectedWriteReg32", 2102, a3, a4, v8, a5);
    }
  }

  return _pmap_iofilter_protected_write(v8, a5, 4);
}

uint64_t AppleH15MemCacheController::mccEnableCacheMode(AppleH15MemCacheController *this, int a2)
{
  int v4 = AppleH15MemCacheController::mccEnableCacheMode(BOOL)::amcp_nolock;
  if (AppleH15MemCacheController::mccEnableCacheMode(BOOL)::amcp_nolock == -1)
  {
    if (!PE_parse_boot_argn("amcp_nolock", &AppleH15MemCacheController::mccEnableCacheMode(BOOL)::amcp_nolock, 4))
    {
      AppleH15MemCacheController::mccEnableCacheMode(BOOL)::amcp_nolock  = 0;
      goto LABEL_7;
    }
    int v4 = AppleH15MemCacheController::mccEnableCacheMode(BOOL)::amcp_nolock;
  }
  if (v4 == 1)
  {
    AppleH15MemCacheController::setWayMask(this);
    return 0;
  }
LABEL_7:
  if (*((_DWORD *)this + 36)) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (gMccDebug >= 3u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling Mem Cache start...");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Disabling Mem Cache start...\n", "mccEnableCacheMode", 1044);
      }
    }
    *((_DWORD *)this + 502)  = 0;
    if (*((_DWORD *)this + 493))
    {
      unsigned int v6 = 0;
      do
        AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, v6++, 0x1C1C00u, 0);
      while (v6 < *((_DWORD *)this + 493));
    }
    AppleH15MemCacheController::_mccWaitForWaysPwrOn(this, 0);
    if (gMccDebug > 2u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling Mem Cache finish...");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Disabling Mem Cache finish...\n");
      }
    }
  }
  else
  {
    if (gMccDebug >= 3u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Enabling Mem Cache start...");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Enabling Mem Cache start...\n", "mccEnableCacheMode", 1033);
      }
    }
    if (*((_DWORD *)this + 493))
    {
      unsigned int v7 = 0;
      do
        AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, v7++, 0x1C1C00u, 1u);
      while (v7 < *((_DWORD *)this + 493));
    }
    AppleH15MemCacheController::_mccWaitForWaysPwrOn(this, 16);
    *((_DWORD *)this + 500)  = 0;
    *((_DWORD *)this + 502)  = 1;
    if (gMccDebug > 2u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Enabling Mem Cache finish...");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Enabling Mem Cache finish...\n");
      }
    }
  }
  return 0;
}

uint64_t AppleH15MemCacheController::_mccSelectDynamicDRAMCFGMode(AppleH15MemCacheController *this, unsigned int a2)
{
  if (gMccDebug >= 5u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_mccSelectDynamicDRAMCFGMode() called with mode=%d\n", a2);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: _mccSelectDynamicDRAMCFGMode() called with mode=%d\n\n", "_mccSelectDynamicDRAMCFGMode", 1064, a2);
    }
  }
  if (a2 < 2)
  {
    if (*((_DWORD *)this + 330))
    {
      if (a2)
      {
        if (*((_DWORD *)this + 490))
        {
          unsigned int v5 = 0;
          do
          {
            AppleH15MemCacheController::_mccWriteReg32((uint64_t)this, (uint64_t)this + 920, v5 / *((_DWORD *)this + 492), ((v5 % *((_DWORD *)this + 492)) << 21) + 4199368, **((_DWORD **)this + 167));
            ++v5;
          }
          while (v5 < *((_DWORD *)this + 490));
        }
      }
      else if (*((_DWORD *)this + 490))
      {
        unint64_t v6 = 0;
        do
        {
          AppleH15MemCacheController::_mccWriteReg32((uint64_t)this, (uint64_t)this + 920, v6 / *((_DWORD *)this + 492), ((v6 % *((_DWORD *)this + 492)) << 21) + 4199368, *(_DWORD *)(*((void *)this + 166) + 4 * v6));
          ++v6;
        }
        while (v6 < *((unsigned int *)this + 490));
      }
    }
    return 0;
  }
  else
  {
    uint64_t v4 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_mccSelectDynamicDRAMCFGMode requested mode %u\n", a2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: _mccSelectDynamicDRAMCFGMode requested mode %u\n\n", "_mccSelectDynamicDRAMCFGMode", 1067, a2);
      }
    }
  }
  return v4;
}

void AppleH15MemCacheController::_mccWriteReg32(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  if (!a2 || *(_DWORD *)(a1 + 1972) <= a3 || *(void *)(a2 + 16) <= (unint64_t)a4) {
    AppleH15MemCacheController::_mccWriteReg32();
  }
  uint32x4_t v8 = (int *)(*(void *)(a2 + 24 * a3 + 8) + a4);
  if (gMccDebug >= 5u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amcc %u offset %#x @ %p <- %#x", a3, a4, (const void *)(*(void *)(a2 + 24 * a3 + 8) + a4), a5);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: amcc %u offset %#x @ %p <- %#x\n", "_mccWriteReg32", 2087, a3, a4, v8, a5);
    }
  }
  *uint32x4_t v8 = a5;
}

uint64_t AppleH15MemCacheController::_mccSelectDCSDynamicClockGateMode(AppleH15MemCacheController *this, unsigned int a2)
{
  if (a2 < 2)
  {
    if (gMccDebug >= 3u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting DCS clock gate mode to %d\n", a2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Setting DCS clock gate mode to %d\n\n", "_mccSelectDCSDynamicClockGateMode", 1108, a2);
      }
    }
    if (*((_DWORD *)this + 490))
    {
      unsigned int v5 = 0;
      if (a2) {
        int v6 = 4352;
      }
      else {
        int v6 = 0;
      }
      do
      {
        unsigned int v7 = *((_DWORD *)this + 492);
        unsigned int v8 = v5 / v7;
        unsigned int v9 = ((v5 % v7) << 21) + 4194328;
        Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v5 / v7, v9);
        AppleH15MemCacheController::_mccWriteReg32((uint64_t)this, (uint64_t)this + 920, v8, v9, Reg32 & 0xFFFFEEFF | v6);
        ++v5;
      }
      while (v5 < *((_DWORD *)this + 490));
    }
    return 0;
  }
  else
  {
    uint64_t v3 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_mccSelectDCSDynamicClockGateMode: requested mode %u\n", a2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: _mccSelectDCSDynamicClockGateMode: requested mode %u\n\n", "_mccSelectDCSDynamicClockGateMode", 1104, a2);
      }
    }
  }
  return v3;
}

void AppleH15MemCacheController::_mccMaskedRMWReg32(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5, int a6)
{
  int v10 = AppleH15MemCacheController::_mccReadReg32(a1, a2, a3, a4) & ~a5 | a6 & a5;

  AppleH15MemCacheController::_mccWriteReg32(a1, a2, a3, a4, v10);
}

uint64_t AppleH15MemCacheController::_mccSelectMCCDynamicClockGateMode(AppleH15MemCacheController *this, unsigned int a2)
{
  if (a2 < 2)
  {
    if (gMccDebug >= 3u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting MCC clock gate mode to %d\n", a2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Setting MCC clock gate mode to %d\n\n", "_mccSelectMCCDynamicClockGateMode", 1129, a2);
      }
    }
    if (*((_DWORD *)this + 493))
    {
      unsigned int v5 = 0;
      if (a2) {
        int v6 = 805306368;
      }
      else {
        int v6 = 0;
      }
      do
      {
        Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v5, 0x100004u);
        AppleH15MemCacheController::_mccWriteReg32((uint64_t)this, (uint64_t)this + 920, v5++, 0x100004u, Reg32 & 0xCFFFFFFF | v6);
      }
      while (v5 < *((_DWORD *)this + 493));
    }
    return 0;
  }
  else
  {
    uint64_t v3 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_mccSelectMCCDynamicClockGateMode: unsupported mode %u\n", a2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: _mccSelectMCCDynamicClockGateMode: unsupported mode %u\n\n", "_mccSelectMCCDynamicClockGateMode", 1125, a2);
      }
    }
  }
  return v3;
}

uint64_t AppleH15MemCacheController::_mccSelectMCCDynamicPowerGateMode(AppleH15MemCacheController *this, unsigned int a2)
{
  if (a2 < 2)
  {
    if (gMccDebug >= 3u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting MCC power gate mode to %d\n", a2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Setting MCC power gate mode to %d\n\n", "_mccSelectMCCDynamicPowerGateMode", 1148, a2);
      }
    }
    if (*((_DWORD *)this + 493))
    {
      unsigned int v5 = 0;
      int v6 = (a2 & 1) << 29;
      do
      {
        Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v5, 0x100004u);
        AppleH15MemCacheController::_mccWriteReg32((uint64_t)this, (uint64_t)this + 920, v5++, 0x100004u, v6 | Reg32 & 0xCFFFFFFF | 0x10000000);
      }
      while (v5 < *((_DWORD *)this + 493));
    }
    return 0;
  }
  else
  {
    uint64_t v3 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_mccSelectMCCDynamicPowerGateMode: unsupported mode %u\n", a2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: _mccSelectMCCDynamicPowerGateMode: unsupported mode %u\n\n", "_mccSelectMCCDynamicPowerGateMode", 1144, a2);
      }
    }
  }
  return v3;
}

uint64_t AppleH15MemCacheController::_mccSelectDCSDynamicPowerGateMode(AppleH15MemCacheController *this, unsigned int a2)
{
  if (a2 < 2)
  {
    if (gMccDebug >= 3u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting DCS power gate mode to %d\n", a2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Setting DCS power gate mode to %d\n\n", "_mccSelectDCSDynamicPowerGateMode", 1171, a2);
      }
    }
    if (*((_DWORD *)this + 490))
    {
      unsigned int v5 = 0;
      int v6 = (a2 & 1) << 12;
      do
      {
        unsigned int v7 = *((_DWORD *)this + 492);
        unsigned int v8 = v5 / v7;
        unsigned int v9 = ((v5 % v7) << 21) + 4194328;
        Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v5 / v7, v9);
        AppleH15MemCacheController::_mccWriteReg32((uint64_t)this, (uint64_t)this + 920, v8, v9, v6 | Reg32 & 0xFFFFEFFF | 0x100);
        ++v5;
      }
      while (v5 < *((_DWORD *)this + 490));
    }
    return 0;
  }
  else
  {
    uint64_t v3 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "requested mode %u", a2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: requested mode %u\n", "_mccSelectDCSDynamicPowerGateMode", 1167, a2);
      }
    }
  }
  return v3;
}

void AppleH15MemCacheController::_dcsWriteQueueFlush(AppleH15MemCacheController *this)
{
  OSSynchronizeIO();
  if (*((_DWORD *)this + 490))
  {
    unsigned int v2 = 0;
    do
    {
      unsigned int v3 = *((_DWORD *)this + 492);
      unsigned int v4 = v2 / v3;
      unsigned int v5 = ((v2 % v3) << 21) + 4196928;
      int v6 = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v2 / v3, v5) & 0xFFFF0000;
      AppleH15MemCacheController::_mccWriteReg32((uint64_t)this, (uint64_t)this + 920, v4, v5, v6);
      ++v2;
    }
    while (v2 < *((_DWORD *)this + 490));
  }
  IODelay(0x14Au);

  OSSynchronizeIO();
}

void AppleH15MemCacheController::_mccDramAccessDisable(AppleH15MemCacheController *this)
{
  if ((gMccDebug & 0xFC) != 0)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling DRAM access...\n");
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: Disabling DRAM access...\n\n", "_mccDramAccessDisable", 1252);
    }
  }
  OSSynchronizeIO();
  if (*((_DWORD *)this + 489))
  {
    int v2 = 0;
    do
      *(_DWORD *)(*((void *)this + v2++ + 262) + 12)  = 1;
    while (*((_DWORD *)this + 489) > v2);
  }

  OSSynchronizeIO();
}

void AppleH15MemCacheController::_mccPanic(AppleH15MemCacheController *this)
{
}

void AppleH15MemCacheController::setMuiSsbCtrl(AppleH15MemCacheController *this, int a2)
{
  if (a2)
  {
    if (a2 != 1) {
      AppleH15MemCacheController::setMuiSsbCtrl();
    }
    unsigned int v3 = *((unsigned __int16 *)this + 1057) << 16;
  }
  else
  {
    unsigned int v3 = *((_DWORD *)this + 528);
  }
  if (*((_DWORD *)this + 493))
  {
    unsigned int v4 = 0;
    do
    {
      AppleH15MemCacheController::_mccProtectedWriteReg32((uint64_t)this, (uint64_t)this + 920, v4++, 0x1C1000u, v3);
      unsigned int v5 = *((_DWORD *)this + 493);
    }
    while (v4 < v5);
    if (v5)
    {
      unsigned int v6 = 0;
      unsigned int v7 = *((_DWORD *)this + 491);
      do
      {
        if (v7)
        {
          unsigned int v8 = 0;
          unsigned int v9 = 4096;
          do
          {
            if (v3 != AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v6, v9))AppleH15MemCacheController::setMuiSsbCtrl(); {
            ++v8;
            }
            unsigned int v7 = *((_DWORD *)this + 491);
            v9 += 0x40000;
          }
          while (v8 < v7);
          unsigned int v5 = *((_DWORD *)this + 493);
        }
        ++v6;
      }
      while (v6 < v5);
    }
  }
  if ((gMccDebug & 0xFC) != 0)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Wrote DIE_0.amcc0.plane_x.AmccMui.AmccMui.MuiSsbCtrl reg_val  = 0x%x\n", "setMuiSsbCtrl", v3);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: %s: Wrote DIE_0.amcc0.plane_x.AmccMui.AmccMui.MuiSsbCtrl reg_val  = 0x%x\n\n", "setMuiSsbCtrl", 1309, "setMuiSsbCtrl", v3);
    }
  }
}

void AppleH15MemCacheController::dcsODTSReadWorkaround(AppleH15MemCacheController *this, int a2)
{
  if (a2 == 1)
  {
    AppleH15MemCacheController::setMuiSsbCtrl(this, 0);
  }
  else
  {
    if (a2) {
      AppleH15MemCacheController::dcsODTSReadWorkaround();
    }
    *((_DWORD *)this + 528)  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, 0, 0x1000u);
    AppleH15MemCacheController::setMuiSsbCtrl(this, 1);
    if (*((_DWORD *)this + 490))
    {
      unsigned int v3 = 0;
      do
      {
        Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v3 / *((_DWORD *)this + 492), ((v3 % *((_DWORD *)this + 492)) << 21) + 4195388);
        ++v3;
      }
      while (v3 < *((_DWORD *)this + 490));
      unint64_t v5 = (429496730 * (unint64_t)(1536 * (Reg32 & 0x3FFu))) >> 32;
    }
    else
    {
      LODWORD(v5)  = 0;
    }
    IODelay(v5);
    if ((gMccDebug & 0xFC) != 0)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: Waited for odts_read_interval_us  = %d us\n", "dcsODTSReadWorkaround", v5);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: %s: Waited for odts_read_interval_us  = %d us\n\n", "dcsODTSReadWorkaround", 1350, "dcsODTSReadWorkaround", v5);
      }
    }
  }
}

uint64_t AppleH15MemCacheController::getMaxOfDCSODTSReadings(AppleH15MemCacheController *this, BOOL *a2)
{
  memset(v13, 0, 30);
  if (*((unsigned char *)this + 2117)) {
    AppleH15MemCacheController::dcsODTSReadWorkaround(this, 0);
  }
  if (*((_DWORD *)this + 490))
  {
    uint32x4_t v11 = a2;
    unsigned int v4 = 0;
    LOBYTE(a2)  = 0;
    LOBYTE(v5)  = 0;
    while (1)
    {
      unsigned int v6 = *((_DWORD *)this + 492);
      unsigned int v7 = v4 / v6;
      unsigned int v8 = ((v4 % v6) << 21) + 4195356;
      Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v4 / v6, v8);
      if (!*((unsigned char *)this + 2117) && (Reg32 & 0x1F) == 0xD)
      {
        IODelay(2u);
        Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v7, v8);
        if ((Reg32 & 0x1F) == 0xD)
        {
          IODelay(0xFu);
          Reg32  = AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, v7, v8);
        }
      }
      unsigned int v9 = Reg32 & 0x1F;
      if (v9 > a2) {
        LOBYTE(a2)  = Reg32 & 0x1F;
      }
      if (*((_DWORD *)this + 530))
      {
        unsigned int v5 = (Reg32 >> 5) & 0x1F;
        if (v5 > a2) {
          LODWORD(a2)  = (Reg32 >> 5) & 0x1F;
        }
      }
      if (a2 == 13)
      {
        if (gMccDebug)
        {
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getMaxOfDCSODTSReadings is %d with ODTS register 0x%#x and individual readings: [dcs=%d, cs0=%d, cs1=%d%s]", 13, Reg32, v4, Reg32 & 0x1F, v5, (const char *)v13);
          if (*((unsigned char *)&gMccDebug + 1)) {
            kprintf("%s:%d: getMaxOfDCSODTSReadings is %d with ODTS register 0x%#x and individual readings: [dcs=%d, cs0=%d, cs1=%d%s]\n", "getMaxOfDCSODTSReadings", 1503, 13, Reg32, v4, v9, v5, (const char *)v13);
          }
        }
        if (!*((unsigned char *)this + 2117))
        {
          *uint32x4_t v11 = 0;
          LOBYTE(a2)  = 13;
          goto LABEL_26;
        }
      }
      else if ((gMccDebug & 0xFC) != 0)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getMaxOfDCSODTSReadings is %d with ODTS register 0x%#x and individual readings: [dcs=%d, cs0=%d, cs1=%d%s]", a2, Reg32, v4, Reg32 & 0x1F, v5, (const char *)v13);
        if (*((unsigned char *)&gMccDebug + 1)) {
          kprintf("%s:%d: getMaxOfDCSODTSReadings is %d with ODTS register 0x%#x and individual readings: [dcs=%d, cs0=%d, cs1=%d%s]\n", "getMaxOfDCSODTSReadings", 1505, a2, Reg32, v4, v9, v5, (const char *)v13);
        }
      }
      if (++v4 >= *((_DWORD *)this + 490)) {
        goto LABEL_26;
      }
    }
  }
  LOBYTE(a2)  = 0;
LABEL_26:
  if (*((unsigned char *)this + 2117))
  {
    AppleH15MemCacheController::setMuiSsbCtrl(this, 0);
    if (a2 == 13 && *((unsigned __int8 *)this + 2116) <= 0xBu)
    {
      if (gMccDebug)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Detected a jump in ODTS to 0xd\n");
        if (*((unsigned char *)&gMccDebug + 1)) {
          kprintf("%s:%d: Detected a jump in ODTS to 0xd\n\n", "getMaxOfDCSODTSReadings", 1521);
        }
      }
      LOBYTE(a2)  = *((unsigned char *)this + 2116);
      *((unsigned char *)this + 2116)  = 13;
    }
    else
    {
      *((unsigned char *)this + 2116)  = (_BYTE)a2;
    }
  }
  return a2;
}

void AppleH15MemCacheController::_mccWriteReg64(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  if (!a2 || *(_DWORD *)(a1 + 1972) <= a3 || *(void *)(a2 + 16) <= (unint64_t)a4) {
    AppleH15MemCacheController::_mccWriteReg64();
  }
  unsigned int v8 = (uint64_t *)(*(void *)(a2 + 24 * a3 + 8) + a4);
  if (gMccDebug >= 5u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amcc %u offset %#x @ %p <- %#llx", a3, a4, (const void *)(*(void *)(a2 + 24 * a3 + 8) + a4), a5);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: amcc %u offset %#x @ %p <- %#llx\n", "_mccWriteReg64", 2116, a3, a4, v8, a5);
    }
  }
  *unsigned int v8 = a5;
}

_DWORD *AppleH15MemCacheController::_setCntrCtrlParmeters(_DWORD *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4 = a2 + 160 * a3;
  *(void *)(v4 + 120)  = ++AppleH15MemCacheController::_setCntrCtrlParmeters(AppleH15MemCacheController::AMCCCounterConfig *,unsigned int)::channelId;
  uint64_t result = (_DWORD *)(v4 + 4);
  int v6 = *(_DWORD *)(v4 + 4);
  switch(v6)
  {
    case 0:
      __asm { BTI             j; jumptable 0000000000013170 case 0 }
      *(unsigned char *)uint64_t v4 = *(unsigned char *)v4 & 0xF9 | 2;
      uint64_t v34 = a2 + 160 * a3;
      unint64_t v35 = *(_DWORD *)(v34 + 56) & 0xFFFFFLL | ((unint64_t)(*(_DWORD *)(v34 + 60) & 0xFFFFF) << 20);
      *(void *)(v34 + 72)  = v35 | 0x10000000000000;
      long long v36 = (void *)(v34 + 72);
      unsigned int v37 = *((_DWORD *)v36 - 5);
      int v38 = a1[490];
      if (v37 <= 1) {
        unsigned int v37 = 1;
      }
      *((_DWORD *)v36 - 5)  = v38 * v37;
      *((_DWORD *)v36 - 2)  = 2;
      v36[1]  = 0xFF000000000;
      uint64_t v39 = *((unsigned int *)v36 - 16);
      if (v39 >= 3) {
        panic("\"Counter type %d is not supported on counter index %d\\n\" @%s:%d", *((_DWORD *)v36 - 16), a3, "AppleH15MemCacheController.cpp", 1689);
      }
      *long long v36 = (v35 | (v39 << 56)) + 0x110000000000000;
      uint64_t v40 = a2 + 160 * a3;
      unsigned int v41 = *(_DWORD *)(v40 + 24);
      *(void *)(v40 + 32)  = 1 << v41;
      *(_DWORD *)(v40 + 28)  = 0x8000;
      *(int32x2_t *)(v40 + 44)  = vadd_s32((int32x2_t)vshl_u32((uint32x2_t)vdup_n_s32(v41), (uint32x2_t)0x300000004), (int32x2_t)0x900000008010);
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      __asm { BTI             j; jumptable 0000000000013170 cases 1-6 }
      *(unsigned char *)uint64_t v4 = *(unsigned char *)v4 & 0xF9 | 2;
      uint64_t v11 = a2 + 160 * a3;
      unsigned int v14 = *(_DWORD *)(v11 + 8);
      uint64_t v12 = v11 + 8;
      uint64_t v13 = v14;
      int v15 = a1[493];
      unsigned int v16 = *(_DWORD *)(v12 + 44);
      int v17 = *(_DWORD *)(v12 + 48);
      if (v16 <= 1) {
        unsigned int v16 = 1;
      }
      *(_DWORD *)(v12 + 44)  = v15 * v16;
      *(_DWORD *)(v12 + 56)  = 2;
      unsigned int v18 = *(_DWORD *)(v12 + 16);
      *(void *)(v12 + 24)  = 1 << v18;
      *(void *)(v12 + 64)  = *(void *)&v17 & 0xFFFFFLL | ((unint64_t)(*(_DWORD *)(v12 + 52) & 0xFFFFF) << 20) | ((unint64_t)(*(_DWORD *)(v12 + 4) & 0x7FFFF) << 40) | 0x1000000000000000;
      *(void *)(v12 + 72)  = 0xFF000000000;
      unint64_t v19 = (uint64_t *)(v12 + 72);
      if (v13 >= 3) {
        panic("\"Unsupported counter config type %d on counter index %d\\n\" @%s:%d", *(_DWORD *)v12, a3, "AppleH15MemCacheController.cpp", 1636);
      }
      uint64_t v20 = (v13 << 48) + 0x10FF000000000;
      *unint64_t v19 = v20;
      *(int32x2_t *)(a2 + 160 * a3 + 44)  = vadd_s32((int32x2_t)vshl_u32((uint32x2_t)vdup_n_s32(v18), (uint32x2_t)0x300000004), (int32x2_t)0x900000008008);
      switch(v6)
      {
        case 1:
          goto LABEL_30;
        case 2:
          __asm { BTI             j; jumptable 0000000000013258 case 2 }
          uint64_t v21 = v20 | 0x30000000000000;
          goto LABEL_25;
        case 3:
          __asm { BTI             j; jumptable 0000000000013258 case 3 }
          uint64_t v21 = v20 | 0x40000000000000;
          goto LABEL_25;
        case 4:
          __asm { BTI             j; jumptable 0000000000013258 case 4 }
          uint64_t v21 = v20 | 0x50000000000000;
          goto LABEL_25;
        case 5:
        case 6:
          __asm { BTI             j; jumptable 0000000000013258 cases 5,6 }
          uint64_t v21 = v20 | 0x10000000000000;
LABEL_25:
          *unint64_t v19 = v21;
          break;
        default:
          panic("\"Unsupported amcx type %d on counter index %d\\n\" @%s:%d", *result, a3, "AppleH15MemCacheController.cpp", 1660);
      }
      return result;
    case 7:
      __asm { BTI             j; jumptable 0000000000013170 case 7 }
      *(unsigned char *)uint64_t v4 = *(unsigned char *)v4 & 0xF9 | 2;
      int v42 = 32 * a1[490];
      uint64_t v43 = a2 + 160 * a3;
      *(_DWORD *)(v43 + 52)  = v42;
      *(_DWORD *)(v43 + 64)  = 5;
      int v44 = *(_DWORD *)(v43 + 24);
      *(void *)(v43 + 32)  = 1 << v44;
      *(_DWORD *)(v43 + 44)  = 20 * v44 + 1420;
      *(_DWORD *)(v43 + 48)  = 8 * v44;
      break;
    case 8:
      __asm { BTI             j; jumptable 0000000000013170 case 8 }
      *(unsigned char *)uint64_t v4 = *(unsigned char *)v4 & 0xF9 | 4;
      uint64_t v30 = a2 + 160 * a3;
      *(_DWORD *)(v30 + 52)  = 1;
      *(_DWORD *)(v30 + 64)  = 5;
      int v31 = *(_DWORD *)(v30 + 24);
      *(void *)(v30 + 32)  = 1 << v31;
      int v32 = 20 * v31 + 1420;
      int v33 = 8 * v31;
      goto LABEL_18;
    case 9:
    case 10:
      __asm { BTI             j; jumptable 0000000000013170 cases 9,10 }
      *(unsigned char *)uint64_t v4 = *(unsigned char *)v4 & 0xF9 | 2;
      *(_DWORD *)(a2 + 160 * a3 + 52)  = 1;
      break;
    case 11:
      __asm { BTI             j; jumptable 0000000000013170 case 11 }
      *(unsigned char *)uint64_t v4 = *(unsigned char *)v4 & 0xF9 | 4;
      uint64_t v30 = a2 + 160 * a3;
      *(_DWORD *)(v30 + 52)  = 1;
      *(_DWORD *)(v30 + 64)  = 1;
      int v32 = 1416;
      int v33 = 8 * *(_DWORD *)(v30 + 24) + 80;
LABEL_18:
      *(_DWORD *)(v30 + 44)  = v32;
      *(_DWORD *)(v30 + 48)  = v33;
      break;
    case 12:
      __asm { BTI             j; jumptable 0000000000013170 case 12 }
      *(unsigned char *)uint64_t v4 = *(unsigned char *)v4 & 0xF9 | 2;
      int v45 = (a1[491] * a1[493]) << 6;
      long long v46 = (_DWORD *)(a2 + 160 * a3);
      v46[16]  = 0;
      v46[12]  = 8 * v46[6] + 45160;
      v46[13]  = v45;
      break;
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      __asm { BTI             j; jumptable 0000000000013170 cases 13-18 }
      *(unsigned char *)v4 &= 0xF9u;
      uint64_t v22 = a2 + 160 * a3;
      unsigned int v25 = *(_DWORD *)(v22 + 8);
      uint64_t v23 = v22 + 8;
      uint64_t v24 = v25;
      *(_DWORD *)(v23 + 44)  = 1;
      *(_DWORD *)(v23 + 56)  = 2;
      int v26 = *(_DWORD *)(v23 + 16);
      *(void *)(v23 + 24)  = 1 << v26;
      *(_DWORD *)(v23 + 20)  = 34816;
      if (v25 >= 3) {
        AppleH15MemCacheController::_setCntrCtrlParmeters((_DWORD *)v23);
      }
      uint64_t v27 = (v24 << 48) + 0x1000000000000;
      uint64_t v28 = a2 + 160 * a3;
      *(void *)(v28 + 80)  = v27;
      uint64_t v29 = (uint64_t *)(v28 + 80);
      switch(v6)
      {
        case 13:
          break;
        case 14:
          __asm { BTI             j; jumptable 00000000000132EC case 14 }
          v27 |= 0x30000000000000uLL;
          break;
        case 15:
          __asm { BTI             j; jumptable 00000000000132EC case 15 }
          v27 |= 0x40000000000000uLL;
          break;
        case 16:
          __asm { BTI             j; jumptable 00000000000132EC case 16 }
          v27 |= 0x50000000000000uLL;
          break;
        case 17:
        case 18:
          __asm { BTI             j; jumptable 00000000000132EC cases 17,18 }
          v27 |= 0x10000000000000uLL;
          break;
        default:
          AppleH15MemCacheController::_setCntrCtrlParmeters(result);
      }
      __asm { BTI             j; jumptable 00000000000132EC case 13 }
      uint64_t v52 = a2 + 160 * a3;
      *(void *)(v52 + 72) |= *(_DWORD *)(v52 + 56) & 0xFFFFFLL | ((unint64_t)(*(_DWORD *)(v52 + 60) & 0xFFFFF) << 20);
      *uint64_t v29 = v27 | 0xFF000000000;
      *(_DWORD *)(v52 + 44)  = 16 * v26 + 34904;
      break;
    case 19:
      __asm { BTI             j; jumptable 0000000000013170 case 19 }
      *(unsigned char *)v4 &= 0xF9u;
      uint64_t v47 = a2 + 160 * a3;
      unsigned int v49 = *(_DWORD *)(v47 + 8);
      uint64_t result = (_DWORD *)(v47 + 8);
      uint64_t v48 = v49;
      result[11]  = 1;
      result[14]  = 2;
      int v50 = result[4];
      *((void *)result + 3)  = 1 << v50;
      result[5]  = 34816;
      if (v49 >= 3) {
        AppleH15MemCacheController::_setCntrCtrlParmeters(result);
      }
      uint64_t v51 = a2 + 160 * a3;
      *(void *)(v51 + 72)  = (*(_DWORD *)(v51 + 56) & 0xFFFFFLL | ((unint64_t)(*(_DWORD *)(v51 + 60) & 0xFFFFF) << 20) | (v48 << 56))
                            + 0x100000000000000;
      *(void *)(v51 + 80)  = 0xFF000000000;
      *(_DWORD *)(v51 + 44)  = 16 * v50 + 34904;
      break;
    default:
      break;
  }
LABEL_30:
  __asm { BTI             j; jumptable 0000000000013170 default case }
  return result;
}

void AppleH15MemCacheController::_writePerfCtrl(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  uint64_t v5 = a1;
  switch(*(_DWORD *)(a2 + 160 * a3 + 4))
  {
    case 0:
      __asm { BTI             j; jumptable 000000000001377C case 0 }
      int v10 = (_DWORD *)(a2 + 160 * a3);
      unsigned int v13 = v10[4];
      unsigned int v11 = (v10[5] << 18) + 8 * a4 + v10[11] + 114688;
      uint64_t v12 = a1 + 920;
      goto LABEL_3;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      __asm { BTI             j; jumptable 000000000001377C cases 1-6 }
      int v10 = (_DWORD *)(a2 + 160 * a3);
      unsigned int v11 = v10[11] + 8 * a4 + 1376256;
      uint64_t v12 = a1 + 920;
      unsigned int v13 = v10[4];
LABEL_3:
      uint64_t v14 = *(void *)&v10[2 * a4 + 18];
      goto LABEL_16;
    case 7:
    case 8:
      __asm { BTI             j; jumptable 000000000001377C cases 7,8 }
      unsigned int v16 = (_DWORD *)(a2 + 160 * a3);
      unsigned int v17 = v16[4];
      unsigned int v18 = (v16[5] << 21) + 4 * a4 + v16[11] + 0x400000;
      uint64_t v19 = a1 + 920;
      int v20 = v16[2 * a4 + 18];
      goto LABEL_9;
    case 0xB:
      __asm { BTI             j; jumptable 000000000001377C case 11 }
      uint64_t v21 = (unsigned int *)(a2 + 160 * a3);
      unsigned int v22 = v21[11] + (v21[5] << 21) + 0x400000;
      int v20 = v21[10] | AppleH15MemCacheController::_mccReadReg32(a1, a1 + 920, v21[4], v22);
      unsigned int v17 = v21[4];
      a1  = v5;
      uint64_t v19 = v5 + 920;
      unsigned int v18 = v22;
LABEL_9:
      AppleH15MemCacheController::_mccWriteReg32(a1, v19, v17, v18, v20);
      return;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x11:
      __asm { BTI             j; jumptable 000000000001377C cases 13-15,17 }
      int v15 = (unsigned int *)(a2 + 160 * a3);
      AppleH15MemCacheController::_mccWriteReg64(a1, a1 + 920, v15[4], v15[11] + 8 * a4 + 1376256, *(void *)&v15[2 * a4 + 18]);
      if (v15[6] | a4) {
        goto LABEL_13;
      }
      unsigned int v13 = v15[4];
      a1  = v5;
      uint64_t v12 = v5 + 920;
      unsigned int v11 = 1411096;
      goto LABEL_15;
    case 0x13:
      __asm { BTI             j; jumptable 000000000001377C case 19 }
      uint64_t v23 = (unsigned int *)(a2 + 160 * a3);
      AppleH15MemCacheController::_mccWriteReg64(a1, a1 + 920, v23[4], (v23[5] << 18) + 8 * a4 + v23[11] + 114688, *(void *)&v23[2 * a4 + 18]);
      if (v23[6] | a4) {
        goto LABEL_13;
      }
      unsigned int v11 = (v23[5] << 18) | 0x24810;
      unsigned int v13 = v23[4];
      a1  = v5;
      uint64_t v12 = v5 + 920;
LABEL_15:
      uint64_t v14 = 0x103FFF00000000;
LABEL_16:
      AppleH15MemCacheController::_mccWriteReg64(a1, v12, v13, v11, v14);
      break;
    default:
LABEL_13:
      __asm { BTI             j; jumptable 000000000001377C default case, cases 9,10,12,16,18 }
      break;
  }
}

void AppleH15MemCacheController::_enablePerfCtrl(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  unsigned int v5 = a3;
  uint64_t v8 = a3;
  if ((gMccDebug & 0xFC) != 0)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "_enablePerfCtrl counter:%d enable:%d\n", a3, a4);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: _enablePerfCtrl counter:%d enable:%d\n\n", "_enablePerfCtrl", 2286, v5, a4);
    }
  }
  if (a4)
  {
    uint64_t v9 = a2 + 160 * v8;
    unint64_t v11 = *(void *)(v9 + 144);
    int v10 = (void *)(v9 + 144);
    if (v11 > AppleH15MemCacheController::_readPerfValue(a1, a2, v5)) {
      *(void *)(a2 + 160 * v8 + 136)  = *v10;
    }
  }
  switch(*(_DWORD *)(a2 + 160 * v8 + 4))
  {
    case 0:
    case 0x13:
      __asm { BTI             j; jumptable 0000000000013AE8 cases 0,19 }
      uint64_t v29 = a2 + 160 * v8;
      unsigned int v30 = *(_DWORD *)(v29 + 28) + (*(_DWORD *)(v29 + 20) << 18) + 114688;
      Reg64  = AppleH15MemCacheController::_mccReadReg64(a1, a1 + 920, *(_DWORD *)(v29 + 16), v30);
      uint64_t v32 = *(void *)(v29 + 32);
      uint64_t v33 = Reg64 & ~v32;
      if (!a4) {
        uint64_t v32 = 0;
      }
      uint64_t v20 = v33 | v32;
      unsigned int v21 = *(_DWORD *)(v29 + 16);
      uint64_t v22 = a1;
      uint64_t v23 = a1 + 920;
      unsigned int v24 = v30;
      goto LABEL_17;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      __asm { BTI             j; jumptable 0000000000013AE8 cases 1-6 }
      uint64_t v16 = a2 + 160 * v8;
      uint64_t v17 = AppleH15MemCacheController::_mccReadReg64(a1, a1 + 920, *(_DWORD *)(v16 + 16), 0x158000u);
      uint64_t v18 = *(void *)(v16 + 32);
      uint64_t v19 = v17 & ~v18;
      if (!a4) {
        uint64_t v18 = 0;
      }
      uint64_t v20 = v19 | v18;
      unsigned int v21 = *(_DWORD *)(v16 + 16);
      uint64_t v22 = a1;
      uint64_t v23 = a1 + 920;
      unsigned int v24 = 1409024;
      goto LABEL_17;
    case 7:
    case 8:
      __asm { BTI             j; jumptable 0000000000013AE8 cases 7,8 }
      uint64_t v34 = a2 + 160 * v8;
      unint64_t v35 = (unsigned int *)(v34 + 16);
      int v36 = *(_DWORD *)(v34 + 20) << 21;
      if (a4) {
        AppleH15MemCacheController::_mccWriteReg32(a1, a1 + 920, *v35, v36 + 4195712, 113);
      }
      int v37 = v36 + 4195712;
      unsigned int v38 = v36 + 4195716;
      Reg32  = AppleH15MemCacheController::_mccReadReg32(a1, a1 + 920, *v35, v37 + 4);
      int v40 = *(_DWORD *)(a2 + 160 * v8 + 32);
      int v41 = Reg32 & ~v40;
      if (!a4) {
        int v40 = 0;
      }
      AppleH15MemCacheController::_mccWriteReg32(a1, a1 + 920, *v35, v38, v41 | v40);
      goto LABEL_18;
    case 9:
    case 0xA:
      __asm { BTI             j; jumptable 0000000000013AE8 cases 9,10 }
      for (uint64_t i = 0; i != 6; ++i)
      {
        uint64_t v43 = *(void *)(a2 + 160 * v8 + 72 + 8 * i);
        if (v43 == -1) {
          break;
        }
        if (v43 >= v8) {
          panic("\"Unexpected perfcntrctl value at index %d for counter %d\\n\" @%s:%d", i, v5, "AppleH15MemCacheController.cpp", 2384);
        }
      }
      goto LABEL_18;
    case 0xB:
      __asm { BTI             j; jumptable 0000000000013AE8 case 11 }
      v55  = v5;
      uint64_t v44 = a2 + 160 * v8;
      unsigned int v45 = *(_DWORD *)(v44 + 16);
      int v46 = *(_DWORD *)(v44 + 20);
      uint64_t v47 = (unsigned int *)(v44 + 16);
      unsigned int v48 = v47[7] + (v46 << 21) + 0x400000;
      int v49 = AppleH15MemCacheController::_mccReadReg32(a1, a1 + 920, v45, v48);
      int v50 = (int *)(v47 + 6);
      int v51 = 10;
      break;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x11:
      __asm { BTI             j; jumptable 0000000000013AE8 cases 13-15,17 }
      uint64_t v25 = a2 + 160 * v8;
      uint64_t v26 = AppleH15MemCacheController::_mccReadReg64(a1, a1 + 920, *(_DWORD *)(v25 + 16), 0x158800u);
      uint64_t v27 = *(void *)(v25 + 32);
      uint64_t v28 = v26 & ~v27;
      if (!a4) {
        uint64_t v27 = 0;
      }
      uint64_t v20 = v28 | v27;
      unsigned int v21 = *(_DWORD *)(v25 + 16);
      uint64_t v22 = a1;
      uint64_t v23 = a1 + 920;
      unsigned int v24 = 1411072;
LABEL_17:
      AppleH15MemCacheController::_mccWriteReg64(v22, v23, v21, v24, v20);
      goto LABEL_18;
    default:
      goto LABEL_18;
  }
  while (1)
  {
    int v52 = *v50;
    if ((*v50 & v49) == 0) {
      break;
    }
    int v49 = AppleH15MemCacheController::_mccReadReg32(a1, a1 + 920, *v47, v48);
    IODelay(2u);
    if (!--v51)
    {
      int v52 = *v50;
      break;
    }
  }
  if ((v52 & v49) != 0) {
    panic("\"Failed to clear DCS perf counter '%s' clear bit\\n\" @%s:%d", *(const char **)(a2 + 160 * v8 + 128), "AppleH15MemCacheController.cpp", 2362);
  }
  int v53 = *(_DWORD *)(a2 + 160 * v8 + 32);
  v54  = v49 & ~v53;
  if (!a4) {
    int v53 = 0;
  }
  AppleH15MemCacheController::_mccWriteReg32(a1, a1 + 920, *v47, v48, v53 | v54);
  unsigned int v5 = v55;
LABEL_18:
  __asm { BTI             j; jumptable 0000000000013AE8 default case, cases 12,16,18 }
  if ((a4 & 1) == 0) {
    *(void *)(a2 + 160 * v8 + 144)  = AppleH15MemCacheController::_readPerfValue(a1, a2, v5);
  }
}

unint64_t AppleH15MemCacheController::_mccSamplePerfCounter(uint64_t a1, uint64_t a2, unsigned int a3, unint64_t *a4)
{
  unint64_t result = AppleH15MemCacheController::_readPerfValue(a1, a2, a3);
  uint64_t v10 = a2 + 160 * a3;
  uint64_t v11 = result * *(unsigned int *)(v10 + 52);
  *(void *)(v10 + 152)  = v11;
  if (*(_DWORD *)(v10 + 4) == 12)
  {
    uint64_t v12 = (IOSimpleReporter **)(a1 + 2056);
  }
  else if ((*(unsigned char *)(a2 + 160 * a3) & 2) != 0)
  {
    uint64_t v12 = (IOSimpleReporter **)(a1 + 2040);
  }
  else
  {
    if ((*(unsigned char *)(a2 + 160 * a3) & 4) == 0) {
      return result;
    }
    uint64_t v12 = (IOSimpleReporter **)(a1 + 2048);
  }
  unsigned int v13 = *v12;
  if (*v12)
  {
    uint64_t v14 = a2 + 160 * a3;
    unint64_t v16 = *(void *)(v14 + 120);
    int v15 = (unint64_t *)(v14 + 120);
    unint64_t result = IOSimpleReporter::setValue(v13, v16, v11);
    if (a4)
    {
      unint64_t result = IOSimpleReporter::getValue(v13, *v15);
      *a4  = result;
    }
  }
  return result;
}

unint64_t AppleH15MemCacheController::_readPerfValue(uint64_t a1, uint64_t a2, unsigned int a3)
{
  switch(*(_DWORD *)(a2 + 160 * a3 + 4))
  {
    case 0:
    case 0xC:
      __asm { BTI             j; jumptable 0000000000013F58 cases 0,12 }
      unsigned int v13 = (_DWORD *)(a2 + 160 * a3);
      unsigned int v12 = v13[4];
      unsigned int v10 = v13[12] + (v13[5] << 18) + 114688;
      goto LABEL_5;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      __asm { BTI             j; jumptable 0000000000013F58 cases 1-6 }
      uint64_t v9 = a2 + 160 * a3;
      unsigned int v10 = *(_DWORD *)(v9 + 48) + 1376256;
      uint64_t v11 = a1 + 920;
      unsigned int v12 = *(_DWORD *)(v9 + 16);
      goto LABEL_6;
    case 7:
    case 8:
      __asm { BTI             j; jumptable 0000000000013F58 cases 7,8 }
      uint64_t v14 = (_DWORD *)(a2 + 160 * a3);
      unsigned int v12 = v14[4];
      unsigned int v10 = v14[12] + (v14[5] << 21) + 4210688;
LABEL_5:
      uint64_t v11 = a1 + 920;
LABEL_6:
      Reg64  = AppleH15MemCacheController::_mccReadReg64(a1, v11, v12, v10);
      break;
    case 9:
    case 0xA:
      __asm { BTI             j; jumptable 0000000000013F58 cases 9,10 }
      uint64_t v17 = 0;
      Reg64  = 0;
      do
      {
        uint64_t v18 = *(void *)(a2 + 160 * a3 + 72 + v17);
        if (v18 == -1) {
          break;
        }
        v17 += 8;
        Reg64 += *(void *)(a2 + 160 * v18 + 152);
      }
      while (v17 != 48);
      break;
    case 0xB:
      __asm { BTI             j; jumptable 0000000000013F58 case 11 }
      Reg64  = AppleH15MemCacheController::_mccReadReg64(a1, a1 + 920, *(_DWORD *)(a2 + 160 * a3 + 16), *(_DWORD *)(a2 + 160 * a3 + 48) + (*(_DWORD *)(a2 + 160 * a3 + 20) << 21) + 4210688)/ 0x18uLL;
      break;
    default:
      Reg64  = 0;
      break;
  }
  return *(void *)(a2 + 160 * a3 + 136) + Reg64;
}

uint64_t AppleH15MemCacheController::configureReport(IOReporter **this, OSSet *a2, IOReportChannelList *a3, void *a4, void *a5)
{
  current_task();
  if (!IOTaskHasEntitlement()
    || (uint64_t result = IOReporter::configureAllReports(this[258], a2, a3, a4, a5, v10), !result))
  {
    return ((uint64_t (*)(IOReporter **, OSSet *, IOReportChannelList *, void *, void *))v12)(this, a2, a3, a4, a5);
  }
  return result;
}

uint64_t AppleH15MemCacheController::updateReport(IOReporter **this, OSSet *a2, IOReportChannelList *a3, void *a4, void *a5)
{
  current_task();
  if (!IOTaskHasEntitlement()
    || (AppleH15MemCacheController::_mccSampleAllPerfCounters((AppleH15MemCacheController *)this, 0),
        uint64_t result = IOReporter::updateAllReports(this[258], a2, a3, a4, a5, v10),
        !result))
  {
    return ((uint64_t (*)(IOReporter **, OSSet *, IOReportChannelList *, void *, void *))v12)(this, a2, a3, a4, a5);
  }
  return result;
}

uint64_t AppleH15MemCacheController::_mccReadReg64(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  if (!a2 || *(_DWORD *)(a1 + 1972) <= a3 || *(void *)(a2 + 16) <= (unint64_t)a4) {
    AppleH15MemCacheController::_mccReadReg64();
  }
  int v6 = (uint64_t *)(*(void *)(a2 + 24 * a3 + 8) + a4);
  uint64_t v7 = *v6;
  if (gMccDebug >= 5u)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amcc %u offset %#x @ %p -> %#llx", a3, a4, (const void *)(*(void *)(a2 + 24 * a3 + 8) + a4), v7);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: amcc %u offset %#x @ %p -> %#llx\n", "_mccReadReg64", 2074, a3, a4, v6, v7);
    }
  }
  return v7;
}

uint64_t AppleH15MemCacheController::getDSIDGroupQuota(AppleH15MemCacheController *this, unsigned int a2, unint64_t *a3)
{
  if (a2 <= 0x1F && a3)
  {
    unsigned int v5 = 4 * a2 + 40960;
    uint64_t v6 = 0;
    unint64_t v7 = ((AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, 0, v5) & 0x1F) << 17)
       * *((_DWORD *)this + 493)
       * *((_DWORD *)this + 491);
    *a3  = v7;
    if (gMccDebug >= 5u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "DSID group %d(offset:0x%x) quota is 0x%llx\n", a2, v5, v7);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: DSID group %d(offset:0x%x) quota is 0x%llx\n\n", "getDSIDGroupQuota", 2432, a2, v5, *a3);
      }
      return 0;
    }
  }
  else
  {
    uint64_t v6 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error in arguments to getAllDSIDQuota\n");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Error in arguments to getAllDSIDQuota\n\n", "getDSIDGroupQuota", 2419);
      }
    }
  }
  return v6;
}

uint64_t AppleH15MemCacheController::getAllDSIDQuota(AppleH15MemCacheController *this, unsigned int *a2, unint64_t *a3)
{
  if (a2 && (unsigned int v3 = a3) != 0 && *a2)
  {
    if (*a2 >= 0x21) {
      *a2  = 32;
    }
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = (*(uint64_t (**)(AppleH15MemCacheController *, unint64_t, unint64_t *))(*(void *)this + 1424))(this, v6, v3);
      if (v7) {
        break;
      }
      ++v6;
      ++v3;
      if (v6 >= *a2) {
        return 0;
      }
    }
    uint64_t v8 = v7;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get quota for group %d. rc:0x%x\n", v6, v7);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Failed to get quota for group %d. rc:0x%x\n\n");
      }
    }
  }
  else
  {
    uint64_t v8 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected arguments\n");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Unexpected arguments\n\n");
      }
    }
  }
  return v8;
}

uint64_t AppleH15MemCacheController::getDSIDQuotaUseCount(AppleH15MemCacheController *this, unsigned int a2, unint64_t *a3)
{
  if (a2 <= 0xBF && a3)
  {
    unsigned int v5 = 4 * a2 + 49152;
    uint64_t v6 = 0;
    unint64_t v7 = *((unsigned int *)this + 491)
       * (unint64_t)((unsigned __int16)AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, 0, v5) << 7)* *((unsigned int *)this + 493);
    *a3  = v7;
    if (gMccDebug >= 5u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Quota usage for DSID group %d(offset:0x%x) is 0x%llx\n", a2, v5, v7);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Quota usage for DSID group %d(offset:0x%x) is 0x%llx\n\n", "getDSIDQuotaUseCount", 2474, a2, v5, *a3);
      }
      return 0;
    }
  }
  else
  {
    uint64_t v6 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected arguments\n");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Unexpected arguments\n\n", "getDSIDQuotaUseCount", 2463);
      }
    }
  }
  return v6;
}

uint64_t AppleH15MemCacheController::getAllDSIDQuotaUseCount(AppleH15MemCacheController *this, unsigned int *a2, unint64_t *a3)
{
  if (a2 && a3 && *a2)
  {
    if (*a2 >= 0xC1) {
      *a2  = 192;
    }
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = (*(uint64_t (**)(AppleH15MemCacheController *, unint64_t, unint64_t *))(*(void *)this + 1432))(this, v7, &a3[v6]);
      if (gMccDebug >= 5u)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Quota usage for DSID group %d is 0x%llx\n", v7, a3[v7]);
        if (*((unsigned char *)&gMccDebug + 1)) {
          kprintf("%s:%d: Quota usage for DSID group %d is 0x%llx\n\n", "getAllDSIDQuotaUseCount", 2495, v7, a3[v7]);
        }
      }
      if (v8) {
        break;
      }
      ++v7;
      ++v6;
      if (v7 >= *a2) {
        return 0;
      }
    }
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to usage count for DSID group %d\n", v7);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Failed to usage count for DSID group %d\n\n");
      }
    }
  }
  else
  {
    uint64_t v8 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected arguments\n");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Unexpected arguments\n\n");
      }
    }
  }
  return v8;
}

uint64_t AppleH15MemCacheController::setPersistenceLevel(uint64_t a1, unsigned int a2, uintptr_t arg2, int a4)
{
  unsigned int v4 = arg2;
  if (a2 > arg2)
  {
    uint64_t v5 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "StaringDSIDGroup(%d) is greater than EndingDSIDGroup(%d)\n", a2, arg2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: StaringDSIDGroup(%d) is greater than EndingDSIDGroup(%d)\n\n");
      }
    }
    return v5;
  }
  if (arg2 >= 0x20)
  {
    uint64_t v5 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "EndingDSIDGroup value %d are invalid\n", arg2);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: EndingDSIDGroup value %d are invalid\n\n");
      }
    }
    return v5;
  }
  if (a4 == 4)
  {
    unsigned int v7 = 0;
LABEL_13:
    unsigned int v8 = a2;
    do
    {
      if (gMccDebug >= 5u)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting persistence level of DSID Group %d(Offset:0x%x) to %d\n", v8, 4 * v8 + 1875964, v7);
        if (*((unsigned char *)&gMccDebug + 1)) {
          kprintf("%s:%d: Setting persistence level of DSID Group %d(Offset:0x%x) to %d\n\n", "setPersistenceLevel", 2542, v8, 4 * v8 + 1875964, v7);
        }
      }
      if (*(_DWORD *)(a1 + 1972))
      {
        unsigned int v9 = 0;
        do
          AppleH15MemCacheController::_mccWriteReg32(a1, a1 + 920, v9++, 4 * v8 + 1875964, v7 << 30);
        while (v9 < *(_DWORD *)(a1 + 1972));
      }
    }
    while (v8++ != v4);
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug(0x61D0008u, a2, v4, v7, 0, 0);
    }
    return 0;
  }
  if (a4 == 5)
  {
    unsigned int v7 = 1;
    goto LABEL_13;
  }
  uint64_t v5 = 3758097090;
  if (gMccDebug)
  {
    _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid persistence value %d. Only 'Replaceable' and 'NonReplaceable' are supported\n", a4);
    if (*((unsigned char *)&gMccDebug + 1)) {
      kprintf("%s:%d: Invalid persistence value %d. Only 'Replaceable' and 'NonReplaceable' are supported\n\n");
    }
  }
  return v5;
}

uint64_t AppleH15MemCacheController::setDSIDGroupQuota(AppleH15MemCacheController *this, uintptr_t arg1, unint64_t a3)
{
  unsigned int v3 = arg1;
  if (arg1 < 0x20)
  {
    unint64_t v6 = *((unsigned int *)this + 488);
    if (v6 >= a3) {
      unint64_t v6 = a3;
    }
    unsigned int v7 = (char *)this + 8 * arg1;
    if (*((void *)v7 + 210) != v6)
    {
      *((void *)v7 + 210)  = v6;
      unint64_t v8 = (v6 + *((unsigned int *)this + 491) - 1) / *((unsigned int *)this + 491) + 0x1FFFF;
      uintptr_t v9 = v8 >> 17;
      if ((gMccDebug & 0xFC) != 0)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting quota for DSID group %d(offset:0x%x) to 0x%llx\n", arg1, 4 * arg1 + 1875968, v8 >> 17);
        if (*((unsigned char *)&gMccDebug + 1)) {
          kprintf("%s:%d: Setting quota for DSID group %d(offset:0x%x) to 0x%llx\n\n", "setDSIDGroupQuota", 2585, v3, 4 * v3 + 1875968, v8 >> 17);
        }
      }
      if (*((_DWORD *)this + 493))
      {
        unsigned int v10 = 0;
        uint64_t v11 = (v8 >> 17) & 0x1F;
        do
          AppleH15MemCacheController::_mccWriteReg32((uint64_t)this, (uint64_t)this + 920, v10++, 4 * v3 + 1875968, v11);
        while (v10 < *((_DWORD *)this + 493));
      }
      if ((kdebug_enable & 0xFFFFFFF7) != 0) {
        kernel_debug(0x61D0004u, v3, 4 * v3 + 1875968, v9, 0, 0);
      }
    }
    return 0;
  }
  else
  {
    uint64_t v4 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid DSID group %d\n", arg1);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Invalid DSID group %d\n\n", "setDSIDGroupQuota", 2560, v3);
      }
    }
  }
  return v4;
}

uint64_t AppleH15MemCacheController::deprioritizeDSID(AppleH15MemCacheController *this, uintptr_t arg1)
{
  unsigned int v2 = arg1;
  if ((arg1 - 192) > 0xFFFFFF40)
  {
    uint64_t v4 = (4 * arg1) + 1024;
    uint64_t v5 = *((void *)this + 164);
    int v6 = *(_DWORD *)(v5 + v4);
    if ((v6 & 0xD00) != 0)
    {
      if (gMccDebug)
      {
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Previous deprioritize request on dsid %d failed. status:0x%x\n", arg1, v6);
        if (*((unsigned char *)&gMccDebug + 1)) {
          kprintf("%s:%d: Previous deprioritize request on dsid %d failed. status:0x%x\n\n", "deprioritizeDSID", 2613, v2, v6);
        }
      }
    }
    *(_DWORD *)(v5 + v4)  = 3853;
    if ((kdebug_enable & 0xFFFFFFF7) != 0) {
      kernel_debug(0x61D000Cu, v2, 0, 0, 0, 0);
    }
    if (gMccDebug >= 3u)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deprioritize on dsid %u. Offset(0x%x) <-- Value(0x%x)", v2, 4 * v2 + 1024, 3853);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Deprioritize on dsid %u. Offset(0x%x) <-- Value(0x%x)\n", "deprioritizeDSID", 2627, v2, 4 * v2 + 1024, 3853);
      }
    }
    return 0;
  }
  else
  {
    uint64_t v3 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "De-prioritize request on dsid %u is invalid", arg1);
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: De-prioritize request on dsid %u is invalid\n", "deprioritizeDSID", 2603, v2);
      }
    }
  }
  return v3;
}

uint64_t AppleH15MemCacheController::updateQuota(AppleH15MemCacheController *this, MCDataStream *a2, unsigned int a3)
{
  if (a2)
  {
    MCDataStream::getAssignedSize(a2);
    uint64_t v6 = *(unsigned int *)((*(uint64_t (**)(void, MCDataStream *))(**((void **)this + 259) + 144))(*((void *)this + 259), a2)+ 12);
    (*(void (**)(AppleH15MemCacheController *, uint64_t, void))(*(void *)this + 1400))(this, v6, a3);
    return 0;
  }
  else
  {
    uint64_t v7 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected data stream argument\n");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Unexpected data stream argument\n\n", "updateQuota", 2636);
      }
    }
  }
  return v7;
}

uint64_t AppleH15MemCacheController::getDataStreamCacheUsage(AppleH15MemCacheController *this, MCDataStream *a2, unint64_t *a3)
{
  uint64_t v20 = 0;
  if (a2 && a3)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(**((void **)this + 259) + 144))(*((void *)this + 259));
    if (v6)
    {
      uint64_t v7 = (_DWORD *)v6;
      unsigned int v8 = *(_DWORD *)(v6 + 12);
      if (v8 == 0xFFFF)
      {
        *a3  = 0;
        for (uint64_t i = *(unsigned int *)(v6 + 16); ; uint64_t i = (i + 1))
        {
          unsigned int v10 = v7[5];
          if (i > v10) {
            break;
          }
          uint64_t v20 = 0;
          (*(void (**)(AppleH15MemCacheController *, uint64_t, uint64_t *))(*(void *)this + 1432))(this, i, &v20);
          *a3 += v20;
        }
        if (gMccDebug > 4u)
        {
          int v17 = v7[4];
          StreamName  = (const char *)MCDataStream::getStreamName(a2);
          _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cache usage by DSIDs in range %d-%d(stream: %s) is 0x%llx\n", v17, v10, StreamName, *a3);
          if (*((unsigned char *)&gMccDebug + 1))
          {
            MCDataStream::getStreamName(a2);
            kprintf("%s:%d: Cache usage by DSIDs in range %d-%d(stream: %s) is 0x%llx\n\n");
          }
        }
        return 0;
      }
      if (v8 >= 0x20) {
        AppleH15MemCacheController::getDataStreamCacheUsage();
      }
      unsigned int v14 = 4 * v8 + 41984;
      uint64_t v11 = 0;
      *a3  = *((unsigned int *)this + 491)
          * (unint64_t)((unsigned __int16)AppleH15MemCacheController::_mccReadReg32((uint64_t)this, (uint64_t)this + 920, 0, v14) << 7)* *((unsigned int *)this + 493);
      if (gMccDebug >= 5u)
      {
        int v15 = v7[3];
        unint64_t v16 = (const char *)MCDataStream::getStreamName(a2);
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Quota Group usage for DSID group %d(stream: %s) at offset:0x%x is 0x%llx\n", v15, v16, v14, *a3);
        if (*((unsigned char *)&gMccDebug + 1))
        {
          MCDataStream::getStreamName(a2);
          kprintf("%s:%d: Quota Group usage for DSID group %d(stream: %s) at offset:0x%x is 0x%llx\n\n");
        }
        return 0;
      }
    }
    else
    {
      uint64_t v11 = 3758097097;
      if (gMccDebug)
      {
        unsigned int v12 = (const char *)MCDataStream::getStreamName(a2);
        _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to config entry for stream %s\n", v12);
        if (*((unsigned char *)&gMccDebug + 1))
        {
          unsigned int v13 = (const char *)MCDataStream::getStreamName(a2);
          kprintf("%s:%d: Failed to config entry for stream %s\n\n", "getDataStreamCacheUsage", 2659, v13);
          return 3758097097;
        }
      }
    }
  }
  else
  {
    uint64_t v11 = 3758097090;
    if (gMccDebug)
    {
      _os_log_internal(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected argument\n");
      if (*((unsigned char *)&gMccDebug + 1)) {
        kprintf("%s:%d: Unexpected argument\n\n", "getDataStreamCacheUsage", 2653);
      }
    }
  }
  return v11;
}

OSMetaClass *AppleMemCacheModeFunction::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMemCacheModeFunction", &AppleARMFunction::gMetaClass, 0x30u);
  result->__vftable  = (OSMetaClass_vtbl *)off_240F8;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMemCacheModeFunction", &AppleARMFunction::gMetaClass, 0x30u);
  result->__vftable  = (OSMetaClass_vtbl *)off_240F8;
  return result;
}

void AppleMemCacheModeFunction::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleMemCacheModeFunction::AppleMemCacheModeFunction(AppleMemCacheModeFunction *this, const OSMetaClass *a2)
{
  AppleARMFunction::AppleARMFunction(this, a2);
  void *v2 = off_24058;
}

{
  void *v2;

  AppleARMFunction::AppleARMFunction(this, a2);
  void *v2 = off_24058;
}

void AppleMemCacheModeFunction::~AppleMemCacheModeFunction(AppleMemCacheModeFunction *this)
{
}

{
  AppleARMFunction::~AppleARMFunction(this);
}

{
  uint64_t vars8;

  AppleARMFunction::~AppleARMFunction(this);

  _OSObject_typed_operator_delete(&AppleMemCacheModeFunction_ktv, this, 48);
}

void AppleMemCacheModeFunction::operator delete(void *a1, uint64_t a2)
{
}

void *AppleMemCacheModeFunction::getMetaClass(AppleMemCacheModeFunction *this)
{
  return &AppleMemCacheModeFunction::gMetaClass;
}

AppleARMFunction *AppleMemCacheModeFunction::MetaClass::alloc(AppleMemCacheModeFunction::MetaClass *this)
{
  unsigned int v1 = (AppleARMFunction *)OSObject_typed_operator_new();
  AppleARMFunction::AppleARMFunction(v1, &AppleMemCacheModeFunction::gMetaClass);
  void *v2 = off_24058;
  OSMetaClass::instanceConstructed(&AppleMemCacheModeFunction::gMetaClass);
  return v1;
}

uint64_t AppleMemCacheModeFunction::callFunction(AppleMemCacheModeFunction *this, _DWORD *a2, unsigned int *a3, void *a4)
{
  int v4 = *a2 - 1;
  uint64_t v5 = *a3;
  uint64_t v6 = 3758097095;
  switch(v4)
  {
    case 0:
      goto LABEL_5;
    case 1:
      __asm { BTI             j; jumptable 0000000000015684 case 2 }
      return (*(uint64_t (**)(void, uint64_t))(**((void **)this + 5) + 1536))(*((void *)this + 5), v5);
    case 2:
      __asm { BTI             j; jumptable 0000000000015684 case 3 }
      uint64_t v6 = 0;
      goto LABEL_5;
    case 4:
      __asm { BTI             j; jumptable 0000000000015684 case 5 }
      return (*(uint64_t (**)(void, uint64_t))(**((void **)this + 5) + 1552))(*((void *)this + 5), v5);
    case 5:
      __asm { BTI             j; jumptable 0000000000015684 case 6 }
      return (*(uint64_t (**)(void, uint64_t))(**((void **)this + 5) + 1544))(*((void *)this + 5), v5);
    case 6:
      __asm { BTI             j; jumptable 0000000000015684 case 7 }
      return (*(uint64_t (**)(void, uint64_t))(**((void **)this + 5) + 1560))(*((void *)this + 5), v5);
    case 7:
      __asm { BTI             j; jumptable 0000000000015684 case 8 }
      return (*(uint64_t (**)(void, uint64_t))(**((void **)this + 5) + 1568))(*((void *)this + 5), v5);
    default:
      __asm { BTI             j; jumptable 0000000000015684 default case, case 4 }
      uint64_t v6 = 3758097090;
LABEL_5:
      __asm { BTI             j; jumptable 0000000000015684 case 1 }
      return v6;
  }
}

uint64_t AppleMemCacheModeFunction::initWithTargetDataAndSymbol(const OSMetaClassBase **this, IOService *a2, const OSData *a3, const OSSymbol *a4)
{
  if (v5) {
    this[5]  = OSMetaClassBase::safeMetaCast(this[2], &AppleH15MemCacheController::gMetaClass);
  }
  return v5;
}

OSMetaClass *AppleMemCachePanicFunction::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMemCachePanicFunction", &AppleARMFunction::gMetaClass, 0x30u);
  result->__vftable  = (OSMetaClass_vtbl *)off_24230;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMemCachePanicFunction", &AppleARMFunction::gMetaClass, 0x30u);
  result->__vftable  = (OSMetaClass_vtbl *)off_24230;
  return result;
}

void AppleMemCachePanicFunction::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleMemCachePanicFunction::AppleMemCachePanicFunction(AppleMemCachePanicFunction *this, const OSMetaClass *a2)
{
  AppleARMFunction::AppleARMFunction(this, a2);
  void *v2 = off_24190;
}

{
  void *v2;

  AppleARMFunction::AppleARMFunction(this, a2);
  void *v2 = off_24190;
}

void AppleMemCachePanicFunction::~AppleMemCachePanicFunction(AppleMemCachePanicFunction *this)
{
}

{
  AppleARMFunction::~AppleARMFunction(this);
}

{
  uint64_t vars8;

  AppleARMFunction::~AppleARMFunction(this);

  _OSObject_typed_operator_delete(&AppleMemCachePanicFunction_ktv, this, 48);
}

void AppleMemCachePanicFunction::operator delete(void *a1, uint64_t a2)
{
}

void *AppleMemCachePanicFunction::getMetaClass(AppleMemCachePanicFunction *this)
{
  return &AppleMemCachePanicFunction::gMetaClass;
}

AppleARMFunction *AppleMemCachePanicFunction::MetaClass::alloc(AppleMemCachePanicFunction::MetaClass *this)
{
  unsigned int v1 = (AppleARMFunction *)OSObject_typed_operator_new();
  AppleARMFunction::AppleARMFunction(v1, &AppleMemCachePanicFunction::gMetaClass);
  void *v2 = off_24190;
  OSMetaClass::instanceConstructed(&AppleMemCachePanicFunction::gMetaClass);
  return v1;
}

uint64_t AppleMemCachePanicFunction::callFunction(AppleH15MemCacheController **this, void *a2, void *a3, void *a4)
{
  return 0;
}

uint64_t AppleMemCachePanicFunction::initWithTargetDataAndSymbol(const OSMetaClassBase **this, IOService *a2, const OSData *a3, const OSSymbol *a4)
{
  if (v5) {
    this[5]  = OSMetaClassBase::safeMetaCast(this[2], &AppleH15MemCacheController::gMetaClass);
  }
  return v5;
}

OSMetaClass *AppleMemCacheFlushFunction::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMemCacheFlushFunction", &AppleARMFunction::gMetaClass, 0x30u);
  result->__vftable  = (OSMetaClass_vtbl *)off_24368;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "AppleMemCacheFlushFunction", &AppleARMFunction::gMetaClass, 0x30u);
  result->__vftable  = (OSMetaClass_vtbl *)off_24368;
  return result;
}

void AppleMemCacheFlushFunction::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void AppleMemCacheFlushFunction::AppleMemCacheFlushFunction(AppleMemCacheFlushFunction *this, const OSMetaClass *a2)
{
  AppleARMFunction::AppleARMFunction(this, a2);
  void *v2 = off_242C8;
}

{
  void *v2;

  AppleARMFunction::AppleARMFunction(this, a2);
  void *v2 = off_242C8;
}

void AppleMemCacheFlushFunction::~AppleMemCacheFlushFunction(AppleMemCacheFlushFunction *this)
{
}

{
  AppleARMFunction::~AppleARMFunction(this);
}

{
  uint64_t vars8;

  AppleARMFunction::~AppleARMFunction(this);

  _OSObject_typed_operator_delete(&AppleMemCacheFlushFunction_ktv, this, 48);
}

void AppleMemCacheFlushFunction::operator delete(void *a1, uint64_t a2)
{
}

void *AppleMemCacheFlushFunction::getMetaClass(AppleMemCacheFlushFunction *this)
{
  return &AppleMemCacheFlushFunction::gMetaClass;
}

AppleARMFunction *AppleMemCacheFlushFunction::MetaClass::alloc(AppleMemCacheFlushFunction::MetaClass *this)
{
  unsigned int v1 = (AppleARMFunction *)OSObject_typed_operator_new();
  AppleARMFunction::AppleARMFunction(v1, &AppleMemCacheFlushFunction::gMetaClass);
  void *v2 = off_242C8;
  OSMetaClass::instanceConstructed(&AppleMemCacheFlushFunction::gMetaClass);
  return v1;
}

uint64_t AppleMemCacheFlushFunction::callFunction(AppleH15MemCacheController **this, void *a2, void *a3, void *a4)
{
  return 0;
}

uint64_t AppleMemCacheFlushFunction::initWithTargetDataAndSymbol(const OSMetaClassBase **this, IOService *a2, const OSData *a3, const OSSymbol *a4)
{
  if (v5) {
    this[5]  = OSMetaClassBase::safeMetaCast(this[2], &AppleH15MemCacheController::gMetaClass);
  }
  return v5;
}

uint64_t AppleMemCacheController::getDataCollectionHeaderSize(AppleMemCacheController *this)
{
  return 0;
}

uint64_t AppleMemCacheController::getDataCollectionHeader(AppleMemCacheController *this, char *a2, unsigned int *a3)
{
  return 3758097095;
}

uint64_t AppleMemCacheController::copyDCCounterValues(AppleMemCacheController *this, unint64_t *a2, unint64_t *a3)
{
  return 3758097095;
}

uint64_t AppleMemCacheController::getDataCounterCount(AppleMemCacheController *this)
{
  return 0;
}

OSMetaClass *_GLOBAL__sub_I_AppleH15MemCacheController_cpp()
{
  OSMetaClass::OSMetaClass(&AppleH15MemCacheController::gMetaClass, "AppleH15MemCacheController", &AppleMemCacheController::gMetaClass, 0x850u)->__vftable  = (OSMetaClass_vtbl *)off_23FA0;
  OSMetaClass::OSMetaClass(&AppleMemCacheModeFunction::gMetaClass, "AppleMemCacheModeFunction", &AppleARMFunction::gMetaClass, 0x30u)->__vftable  = (OSMetaClass_vtbl *)off_240F8;
  OSMetaClass::OSMetaClass(&AppleMemCachePanicFunction::gMetaClass, "AppleMemCachePanicFunction", &AppleARMFunction::gMetaClass, 0x30u)->__vftable  = (OSMetaClass_vtbl *)off_24230;
  uint64_t result = OSMetaClass::OSMetaClass(&AppleMemCacheFlushFunction::gMetaClass, "AppleMemCacheFlushFunction", &AppleARMFunction::gMetaClass, 0x30u);
  result->__vftable  = (OSMetaClass_vtbl *)off_24368;
  return result;
}

void global destructor keyed to'_a_1()
{
  OSMetaClass::~OSMetaClass(&AppleMemCacheFlushFunction::gMetaClass);
  OSMetaClass::~OSMetaClass(&AppleMemCachePanicFunction::gMetaClass);
  OSMetaClass::~OSMetaClass(&AppleMemCacheModeFunction::gMetaClass);

  OSMetaClass::~OSMetaClass(&AppleH15MemCacheController::gMetaClass);
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
  return aComAppleApplet;
}

const char *OSKextGetCurrentVersionString(void)
{
  return (const char *)&unk_18050;
}

OSKextLoadTag OSKextGetCurrentLoadTag(void)
{
  return dword_1800C;
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

void AppleH15IO::start()
{
}

{
  panic("\"start: can't find 'function-power_gate', update Device Tree\" @%s:%d", "AppleH15IO.cpp", 100);
}

{
  panic("\"start: can't create AppleARM64ErrorHandler\" @%s:%d", "AppleH15IO.cpp", 105);
}

void AppleH15PlatformErrorHandler::start()
{
}

{
  panic("\"%s::%s: REQUIRE failed\" @%s:%d", "AppleH15PlatformErrorHandler", "start", "AppleH15PlatformErrorHandler.cpp", 239);
}

{
  panic("\"Invalid %s configuration\" @%s:%d", "metadata", "AppleH15PlatformErrorHandler.cpp", 298);
}

{
  panic("\"Invalid %s configuration\" @%s:%d", "NS aperture name", "AppleH15PlatformErrorHandler.cpp", 310);
}

{
  panic("\"Failed to map all apertures\" @%s:%d", "AppleH15PlatformErrorHandler.cpp", 344);
}

{
  panic("\"Failed to register all interrupts\" @%s:%d", "AppleH15PlatformErrorHandler.cpp", 419);
}

{
  panic("\"super start failed\" @%s:%d", "AppleH15PlatformErrorHandler.cpp", 162);
}

void AppleH15PlatformErrorHandler::_getPropertyCount()
{
}

void AppleH15PlatformErrorHandler::_getNsApertureNames()
{
}

void AppleH15PlatformErrorHandler::_mapApertures()
{
}

void AppleH15PlatformErrorHandler::_amccHandleInterrupt()
{
}

void AppleH15PlatformErrorHandler::_dcsHandleInterrupt()
{
}

void AppleH15PlatformErrorHandler::_ioaHandleInterrupt()
{
}

void AppleH15PlatformErrorHandler::_sramHandleInterrupt()
{
}

void AppleH15PlatformErrorHandler::_afxNiHandleInterrupt()
{
}

void AppleH15PlatformErrorHandler::_afxNsHandleInterrupt()
{
}

void AppleH15PlatformErrorHandler::_readRegister32()
{
}

void AppleH15PlatformErrorHandler::_writeRegister32()
{
}

void AppleH15PlatformErrorHandler::_afxNiDecodeInterrupts()
{
}

{
  panic("\"%s::%s: REQUIRE failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNiDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1241);
}

{
  panic("\"%s::%s: REQUIRE failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNiDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1244);
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNiDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1251);
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNiDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1249);
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNiDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1248);
}

{
  panic("\"%s::%s: REQUIRE failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNiDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1238);
}

void AppleH15PlatformErrorHandler::_afxNsDecodeInterrupts()
{
}

{
  panic("\"%s::%s: REQUIRE failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNsDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1473);
}

{
  panic("\"%s::%s: REQUIRE failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNsDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1476);
}

{
  panic("\"%s::%s: REQUIRE failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNsDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1489);
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNsDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1484);
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNsDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1482);
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_afxNsDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 1481);
}

void AppleH15PlatformErrorHandler::_amccPlaneDecodeTagPipeAFError()
{
}

void AppleH15PlatformErrorHandler::_amccDecodeInterrupts()
{
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_amccDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 2738);
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_amccDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 2737);
}

void AppleH15PlatformErrorHandler::_amccDecodeInterruptsForInputTable()
{
}

void AppleH15PlatformErrorHandler::_dcsDecodeInterrupts()
{
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_dcsDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 3230);
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_dcsDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 3222);
}

void AppleH15PlatformErrorHandler::_d2dAfxDecodeInterrupts()
{
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_d2dAfxDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 3772);
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_d2dAfxDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 3771);
}

void AppleH15PlatformErrorHandler::_ioaDecodeInterrupts()
{
}

{
  panic("\"%s::%s: VERIFY failed\" @%s:%d", "AppleH15PlatformErrorHandler", "_ioaDecodeInterrupts", "AppleH15PlatformErrorHandler.cpp", 4532);
}

void AppleH15MemCacheController::start()
{
  panic("\"MEMCachePolicyManager: %s:%u REQUIRE failed: %s\" @%s:%d", "virtual BOOL AppleH15MemCacheController::start(IOService *)", 493, "regCount != 0", "AppleH15MemCacheController.cpp", 493);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"plane-count-per-amcc is missing in mcc node in EDT\" @%s:%d", "start", 499, "AppleH15MemCacheController.cpp", 499);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"dcs-count-per-amcc is missing in mcc node in EDT\" @%s:%d", "start", 505, "AppleH15MemCacheController.cpp", 505);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"Not possible to have zero amccs\" @%s:%d", "start", 516, "AppleH15MemCacheController.cpp", 516);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"Failed to map all apertures\" @%s:%d", "start", 524, "AppleH15MemCacheController.cpp", 524);
}

{
  panic("\"DRAM access disable supported only through GP CE\" @%s:%d", "AppleH15MemCacheController.cpp", 533);
}

{
  panic("\"MEMCachePolicyManager: %s:%u REQUIRE failed: %s\" @%s:%d", "virtual BOOL AppleH15MemCacheController::start(IOService *)", 548, "_mcwMap != NULL", "AppleH15MemCacheController.cpp", 548);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"Cache Policy Manager is missing!\\n\" @%s:%d", "start", 598, "AppleH15MemCacheController.cpp", 598);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"start:no pram service\" @%s:%d", "start", 618, "AppleH15MemCacheController.cpp", 618);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"start:no pram range\" @%s:%d", "start", 624, "AppleH15MemCacheController.cpp", 624);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"panic-max-size is missing in mcc node in EDT\" @%s:%d", "start", 645, "AppleH15MemCacheController.cpp", 645);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"dram-base is missing in mcc node in EDT\" @%s:%d", "start", 652, "AppleH15MemCacheController.cpp", 652);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"dram-limit is missing in mcc node in EDT\" @%s:%d", "start", 659, "AppleH15MemCacheController.cpp", 659);
}

{
  panic("STR_CLASS \"::%s:%d: \" \"Failed to get PMGR SOC CLUSTER register map\" @%s:%d", "start", 540, "AppleH15MemCacheController.cpp", 540);
}

void AppleH15MemCacheController::start(_DWORD *a1)
{
}

void AppleH15MemCacheController::start(uint64_t a1)
{
  int v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 160))(a1);
  panic("STR_CLASS \"::%s:%d: \" \"start:pram length %d expected %d\" @%s:%d", "start", 631, v1, 16, "AppleH15MemCacheController.cpp", 631);
}

void AppleH15MemCacheController::_getPropertyCount()
{
}

void AppleH15MemCacheController::_mapApertures()
{
}

void AppleH15MemCacheController::_mccReadReg32()
{
}

void AppleH15MemCacheController::_mccInitPerfCounters()
{
}

void AppleH15MemCacheController::_mccInitPerfCounters(_DWORD *a1)
{
}

void AppleH15MemCacheController::_getRankCfgByteMode()
{
  panic("\"MEMCachePolicyManager: %s:%u REQUIRE failed: %s\" @%s:%d", "IOReturn AppleH15MemCacheController::_getRankCfgByteMode()", 2697, "(data != 0) && (data->getLength() == sizeof(uint32_t))", "AppleH15MemCacheController.cpp", 2697);
}

void AppleH15MemCacheController::callPlatformFunction()
{
}

void AppleH15MemCacheController::_mccProtectedWriteReg32()
{
}

void AppleH15MemCacheController::_mccWriteReg32()
{
}

void AppleH15MemCacheController::setMuiSsbCtrl()
{
}

{
  panic("\"Assert failed: %s\" @%s:%d", "reg_val == readback_val", "AppleH15MemCacheController.cpp", 1306);
}

void AppleH15MemCacheController::dcsODTSReadWorkaround()
{
}

void AppleH15MemCacheController::_mccWriteReg64()
{
}

void AppleH15MemCacheController::_setCntrCtrlParmeters(_DWORD *a1)
{
}

{
  panic("\"Counter type %d is not supported\\n\" @%s:%d", *a1, "AppleH15MemCacheController.cpp", 1766);
}

{
  panic("\"Counter type %d is not supported\\n\" @%s:%d", *a1, "AppleH15MemCacheController.cpp", 1825);
}

void AppleH15MemCacheController::_mccReadReg64()
{
}

void AppleH15MemCacheController::getDataStreamCacheUsage()
{
}

void IODelay(unsigned int microseconds)
{
}

void IOLog(const char *format, ...)
{
}

uint64_t IOMallocData()
{
  return _IOMallocData();
}

IOSimpleLock *IOSimpleLockAlloc(void)
{
  return _IOSimpleLockAlloc();
}

void IOSimpleLockLock(IOSimpleLock *lock)
{
}

void IOSimpleLockUnlock(IOSimpleLock *lock)
{
}

uint64_t IOTaskHasEntitlement()
{
  return _IOTaskHasEntitlement();
}

uint64_t OSObject_typed_operator_new()
{
  return _OSObject_typed_operator_new();
}

void OSSynchronizeIO(void)
{
}

uint32_t PE_i_can_has_debugger(uint32_t *a1)
{
  return _PE_i_can_has_debugger(a1);
}

BOOLean_t PE_parse_boot_argn(const char *arg_string, void *arg_ptr, int max_arg)
{
  return _PE_parse_boot_argn(arg_string, arg_ptr, max_arg);
}

void AppleARMIO::AppleARMIO(AppleARMIO *this, const OSMetaClass *a2)
{
}

void AppleARMIO::~AppleARMIO(AppleARMIO *this)
{
}

uint64_t IOReporter::addChannel(IOReporter *this, unint64_t a2, const char *a3)
{
  return IOReporter::addChannel(this, a2, a3);
}

uint64_t IOReporter::updateAllReports(IOReporter *this, OSSet *a2, IOReportChannelList *a3, unsigned int a4, void *a5, void *a6)
{
  return IOReporter::updateAllReports(this, a2, a3, a4, a5, a6);
}

uint64_t IOReporter::configureAllReports(IOReporter *this, OSSet *a2, IOReportChannelList *a3, unsigned int a4, void *a5, void *a6)
{
  return IOReporter::configureAllReports(this, a2, a3, a4, a5, a6);
}

IOReturn IOWorkLoop::runActionBlock(IOWorkLoop *this, IOWorkLoop::ActionBlock action)
{
  return IOWorkLoop::runActionBlock(this, action);
}

IOPhysicalAddress IOMemoryMap::getPhysicalAddress(IOMemoryMap *this)
{
  return IOMemoryMap::getPhysicalAddress(this);
}

OSMetaClass *__cdecl OSMetaClass::OSMetaClass(OSMetaClass *this, const char *className, const OSMetaClass *superclass, unsigned int classSize)
{
  return OSMetaClass::OSMetaClass(this, className, superclass, classSize);
}

void OSMetaClass::~OSMetaClass(OSMetaClass *this)
{
}

uint64_t MCDataStream::getStreamName(MCDataStream *this)
{
  return MCDataStream::getStreamName(this);
}

uint64_t MCDataStream::getAssignedSize(MCDataStream *this)
{
  return MCDataStream::getAssignedSize(this);
}

IOCommandGate *__cdecl IOCommandGate::commandGate(OSObject *owner, IOCommandGate::Action action)
{
  return IOCommandGate::commandGate(owner, action);
}

uint64_t IOReportLegend::addReporterLegend(IOReportLegend *this, IOService *a2, IOReporter *a3, const char *a4, const char *a5)
{
  return IOReportLegend::addReporterLegend(this, a2, a3, a4, a5);
}

IORegistryEntry *__cdecl IORegistryEntry::fromPath(const char *path, const IORegistryPlane *plane, char *residualPath, int *residualLength, IORegistryEntry *fromEntry)
{
  return IORegistryEntry::fromPath(path, plane, residualPath, residualLength, fromEntry);
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

uint64_t AppleARMFunction::withProvider(AppleARMFunction *this, IORegistryEntry *a2, const char *a3)
{
  return AppleARMFunction::withProvider(this, a2, a3);
}

uint64_t AppleARMFunction::registerFunctionParent(AppleARMFunction *this, IOService *a2, IOService *a3)
{
  return AppleARMFunction::registerFunctionParent(this, a2, a3);
}

void AppleARMFunction::AppleARMFunction(AppleARMFunction *this, const OSMetaClass *a2)
{
}

void AppleARMFunction::~AppleARMFunction(AppleARMFunction *this)
{
}

uint64_t IOSimpleReporter::with(IOSimpleReporter *this, IOService *a2, unsigned __int16 a3, unint64_t a4)
{
  return IOSimpleReporter::with(this, a2, a3, a4);
}

uint64_t IOSimpleReporter::getValue(IOSimpleReporter *this, unint64_t a2)
{
  return IOSimpleReporter::getValue(this, a2);
}

uint64_t IOSimpleReporter::setValue(IOSimpleReporter *this, unint64_t a2, uint64_t a3)
{
  return IOSimpleReporter::setValue(this, a2, a3);
}

void AppleARM64ErrorHandler::AppleARM64ErrorHandler(AppleARM64ErrorHandler *this)
{
}

uint64_t AppleARM64ErrorHandler::operator new(AppleARM64ErrorHandler *this)
{
  return AppleARM64ErrorHandler::operator new(this);
}

uint64_t AppleMemCacheController::getMCPolicyMgrFactory(AppleMemCacheController *this)
{
  return AppleMemCacheController::getMCPolicyMgrFactory(this);
}

void AppleMemCacheController::AppleMemCacheController(AppleMemCacheController *this, const OSMetaClass *a2)
{
}

void AppleMemCacheController::~AppleMemCacheController(AppleMemCacheController *this)
{
}

OSSet *__cdecl OSSet::withCapacity(unsigned int capacity)
{
  return OSSet::withCapacity(capacity);
}

OSDictionary *__cdecl IOService::nameMatching(const char *name, OSDictionary *table)
{
  return IOService::nameMatching(name, table);
}

IOPMrootDomain *IOService::getPMRootDomain(void)
{
  return IOService::getPMRootDomain();
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

void _os_log_internal(void *dso, os_log_t log, os_log_type_t type, const char *message, ...)
{
}

void bzero(void *a1, size_t a2)
{
}

task_t current_task(void)
{
  return _current_task();
}

void kernel_debug(uint32_t debugid, uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4, uintptr_t arg5)
{
}

void kprintf(const char *fmt, ...)
{
}

uint64_t mcc_log_memory_error()
{
  return _mcc_log_memory_error();
}

uint64_t ml_mcache_flush_callback_register()
{
  return _ml_mcache_flush_callback_register();
}

BOOLean_t ml_set_interrupts_enabled(BOOLean_t enable)
{
  return _ml_set_interrupts_enabled(enable);
}

void panic(const char *string, ...)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}