OSMetaClass *ASIOKitUserClient::MetaClass::MetaClass(OSMetaClass *this)
{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "ASIOKitUserClient", &IOUserClient::gMetaClass, 0xF0u);
  result->__vftable = (OSMetaClass_vtbl *)off_58788;
  return result;
}

{
  OSMetaClass *result;

  result = OSMetaClass::OSMetaClass(this, "ASIOKitUserClient", &IOUserClient::gMetaClass, 0xF0u);
  result->__vftable = (OSMetaClass_vtbl *)off_58788;
  return result;
}

void ASIOKitUserClient::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void ASIOKitUserClient::ASIOKitUserClient(ASIOKitUserClient *this, const OSMetaClass *a2)
{
  IOUserClient::IOUserClient((IOUserClient *)this, a2)->__vftable = (IOUserClient_vtbl *)off_58170;
}

{
  IOUserClient::IOUserClient((IOUserClient *)this, a2)->__vftable = (IOUserClient_vtbl *)off_58170;
}

void ASIOKitUserClient::~ASIOKitUserClient(IOUserClient *this)
{
}

{
  IOUserClient::~IOUserClient(this);
}

{
  uint64_t vars8;

  IOUserClient::~IOUserClient(this);

  _OSObject_typed_operator_delete(&ASIOKitUserClient_ktv, this, 240);
}

void ASIOKitUserClient::operator delete(void *a1, uint64_t a2)
{
}

void *ASIOKitUserClient::getMetaClass(ASIOKitUserClient *this)
{
  return &ASIOKitUserClient::gMetaClass;
}

IOUserClient *ASIOKitUserClient::MetaClass::alloc(ASIOKitUserClient::MetaClass *this)
{
  v1 = (IOUserClient *)OSObject_typed_operator_new();
  IOUserClient::IOUserClient(v1, &ASIOKitUserClient::gMetaClass)->__vftable = (IOUserClient_vtbl *)off_58170;
  OSMetaClass::instanceConstructed(&ASIOKitUserClient::gMetaClass);
  return v1;
}

uint64_t ASIOKitUserClient::operator new(ASIOKitUserClient *this)
{
  return OSObject_typed_operator_new();
}

void ASIOKitUserClient::ASIOKitUserClient(ASIOKitUserClient *this)
{
  IOUserClient::IOUserClient((IOUserClient *)this, &ASIOKitUserClient::gMetaClass)->__vftable = (IOUserClient_vtbl *)off_58170;
  OSMetaClass::instanceConstructed(&ASIOKitUserClient::gMetaClass);
}

{
  IOUserClient::IOUserClient((IOUserClient *)this, &ASIOKitUserClient::gMetaClass)->__vftable = (IOUserClient_vtbl *)off_58170;
  OSMetaClass::instanceConstructed(&ASIOKitUserClient::gMetaClass);
}

uint64_t ASIOKitUserClient::vvzNvdGIueJcRdKd(const OSMetaClassBase *this, OSObject *a2, _DWORD *a3, IOExternalMethodArguments *a4)
{
  long long v27 = 0u;
  long long v28 = 0u;
  unsigned int v26 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  v23 = 0;
  v5 = OSMetaClassBase::safeMetaCast(this, &ASIOKitUserClient::gMetaClass);
  if (!v5)
  {
    uint64_t v6 = 3758097084;
    goto LABEL_12;
  }
  if (!a3 || a3[20] != 5 || a3[10] != 11 || !*((void *)a3 + 6))
  {
    uint64_t v6 = 3758097090;
    goto LABEL_12;
  }
  uint64_t v6 = 3758097090;
  if (!*((void *)a3 + 11)) {
    goto LABEL_12;
  }
  *(void *)&long long v27 = *((void *)a3 + 6);
  DWORD2(v27) = a3[14];
  *(void *)&long long v28 = *((void *)a3 + 4);
  DWORD2(v28) = 11;
  uint64_t v7 = ((uint64_t (*)(OSMetaClassBase *, uint64_t *, uint64_t *, OSArray **, long long *))v5->__vftable[14].retain)(v5, &v25, &v24, &v23, &v27);
  uint64_t v6 = v7;
  if (v7 == -31013)
  {
    uint64_t v8 = v25;
    if (!v25)
    {
      uint64_t v6 = 4294940290;
      goto LABEL_14;
    }
  }
  else
  {
    if (v7) {
      goto LABEL_12;
    }
    uint64_t v8 = v25;
  }
  unsigned int v26 = 0;
  unsigned int v10 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 160))(v8);
  if (v10 > a3[24]) {
    goto LABEL_21;
  }
  unsigned int v11 = v10;
  v12 = (void *)*((void *)a3 + 11);
  v13 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 216))(v25);
  uint64_t v14 = v11;
  v15 = (ASIOKitUserClient *)memmove(v12, v13, v11);
  unsigned int v26 = v11;
  v16 = (void *)*((void *)a3 + 9);
  void *v16 = v11;
  if (v6 == -31013)
  {
    v16[1] = 0;
    uint64_t v17 = -31013;
  }
  else
  {
    int v18 = (*(uint64_t (**)(uint64_t))(*(void *)v24 + 160))(v24);
    unsigned int v19 = v11 + v18;
    if (v19 > a3[24])
    {
LABEL_21:
      uint64_t v6 = 3758097115;
      goto LABEL_12;
    }
    unsigned int v20 = v18;
    uint64_t v21 = *((void *)a3 + 11);
    v22 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v24 + 216))(v24);
    v15 = (ASIOKitUserClient *)memmove((void *)(v21 + v14), v22, v20);
    uint64_t v17 = 0;
    v16 = (void *)*((void *)a3 + 9);
    v16[1] = v20;
    unsigned int v26 = v19;
  }
  v16[4] = v17;
  uint64_t v6 = ASIOKitUserClient::serializeBAACertificate(v15, v23, v16 + 2, *((unsigned char **)a3 + 11), &v26, a3[24]);
LABEL_12:
  if (v25) {
    (*(void (**)(uint64_t))(*(void *)v25 + 40))(v25);
  }
LABEL_14:
  uint64_t v25 = 0;
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 40))(v24);
  }
  uint64_t v24 = 0;
  if (v23) {
    ((void (*)(OSArray *))v23->release_0)(v23);
  }
  return v6;
}

uint64_t ASIOKitUserClient::IbN2f3LUJbYHz0fZ(const OSMetaClassBase *this, OSObject *a2, _DWORD *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097090;
  if (!a3 || a3[24] != 44) {
    return v4;
  }
  v5 = OSMetaClassBase::safeMetaCast(this, &ASIOKitUserClient::gMetaClass);
  if (!v5) {
    return 3758097084;
  }
  serialize = (uint64_t (*)(void))v5->__vftable[14].serialize;

  return serialize();
}

uint64_t ASIOKitUserClient::NNW6204XjGxsj6oV(const OSMetaClassBase *this, OSObject *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = OSMetaClassBase::safeMetaCast(this, &ASIOKitUserClient::gMetaClass);
  if (!v4) {
    return 3758097084;
  }
  getMetaClass = (uint64_t (*)(void))v4->__vftable[14].getMetaClass;

  return getMetaClass();
}

uint64_t ASIOKitUserClient::SyUDm5uomtfMytmv(const OSMetaClassBase *this, OSObject *a2, _DWORD *a3, IOExternalMethodArguments *a4)
{
  long long v25 = 0u;
  long long v26 = 0u;
  unsigned int v24 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v21 = 0;
  v5 = OSMetaClassBase::safeMetaCast(this, &ASIOKitUserClient::gMetaClass);
  if (!v5)
  {
    uint64_t v6 = 3758097084;
    goto LABEL_15;
  }
  if (!a3 || a3[20] != 5 || a3[10] != 11 || !*((void *)a3 + 6))
  {
    uint64_t v6 = 3758097090;
LABEL_15:
    uint64_t v7 = v23;
    goto LABEL_16;
  }
  uint64_t v6 = 3758097090;
  if (!*((void *)a3 + 11)) {
    goto LABEL_15;
  }
  *(void *)&long long v25 = *((void *)a3 + 6);
  DWORD2(v25) = a3[14];
  *(void *)&long long v26 = *((void *)a3 + 4);
  DWORD2(v26) = 11;
  uint64_t v6 = ((uint64_t (*)(OSMetaClassBase *, uint64_t *, uint64_t *, OSArray **, long long *))v5->__vftable[14].release_0)(v5, &v23, &v22, &v21, &v25);
  if (v6) {
    goto LABEL_15;
  }
  uint64_t v7 = v23;
  uint64_t v6 = 4294940290;
  if (v23 && v22)
  {
    unsigned int v24 = 0;
    unsigned int v8 = (*(uint64_t (**)(void))(*(void *)v23 + 160))();
    uint64_t v6 = 3758097115;
    if (v8 <= a3[24])
    {
      unsigned int v9 = v8;
      unsigned int v10 = (void *)*((void *)a3 + 11);
      unsigned int v11 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v23 + 216))(v23);
      uint64_t v12 = v9;
      memmove(v10, v11, v9);
      unsigned int v24 = v9;
      **((void **)a3 + 9) = v9;
      int v13 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 160))(v22);
      unsigned int v14 = v9 + v13;
      if (v14 <= a3[24])
      {
        unsigned int v15 = v13;
        uint64_t v16 = *((void *)a3 + 11);
        uint64_t v17 = (const void *)(*(uint64_t (**)(uint64_t))(*(void *)v22 + 216))(v22);
        int v18 = (ASIOKitUserClient *)memmove((void *)(v16 + v12), v17, v15);
        unsigned int v19 = (void *)*((void *)a3 + 9);
        v19[1] = v15;
        unsigned int v24 = v14;
        v19[4] = 0;
        uint64_t v6 = ASIOKitUserClient::serializeBAACertificate(v18, v21, v19 + 2, *((unsigned char **)a3 + 11), &v24, a3[24]);
      }
    }
    goto LABEL_15;
  }
LABEL_16:
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 40))(v7);
  }
  uint64_t v23 = 0;
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 40))(v22);
  }
  uint64_t v22 = 0;
  if (v21) {
    ((void (*)(OSArray *))v21->release_0)(v21);
  }
  return v6;
}

uint64_t ASIOKitUserClient::vimqO0tP8rpjnboq(const OSMetaClassBase *this, OSObject *a2, _DWORD *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097090;
  if (!a3 || a3[24] != 2) {
    return v4;
  }
  v5 = OSMetaClassBase::safeMetaCast(this, &ASIOKitUserClient::gMetaClass);
  if (!v5) {
    return 3758097084;
  }
  isEqualTo = (uint64_t (*)(void))v5->__vftable[14].isEqualTo;

  return isEqualTo();
}

uint64_t ASIOKitUserClient::vPTazxKbiEZl6jPE(const OSMetaClassBase *this, OSObject *a2, void *a3, IOExternalMethodArguments *a4)
{
  uint64_t v4 = 3758097090;
  unsigned int v10 = 0;
  unsigned int v9 = 0;
  if (a3 && *((void *)a3 + 11) && *((_DWORD *)a3 + 20) == 3)
  {
    uint64_t v6 = OSMetaClassBase::safeMetaCast(this, &ASIOKitUserClient::gMetaClass);
    if (v6)
    {
      uint64_t v7 = (ASIOKitUserClient *)((uint64_t (*)(OSMetaClassBase *, OSArray **))v6->__vftable[14].taggedRetain)(v6, &v10);
      uint64_t v4 = (uint64_t)v7;
      if (!v7) {
        return ASIOKitUserClient::serializeBAACertificate(v7, v10, *((unint64_t **)a3 + 9), *((unsigned char **)a3 + 11), &v9, *((_DWORD *)a3 + 24));
      }
    }
    else
    {
      return 3758097084;
    }
  }
  return v4;
}

uint64_t ASIOKitUserClient::externalMethod(ASIOKitUserClient *this, uint64_t a2, IOExternalMethodArguments *a3, IOExternalMethodDispatch *a4, OSObject *a5, void *a6)
{
  if (a2 <= 5) {
  else
  }
    return 3758097095;
}

uint64_t ASIOKitUserClient::serializeBAACertificate(ASIOKitUserClient *this, OSArray *a2, unint64_t *a3, unsigned char *a4, unsigned int *a5, unsigned int a6)
{
  unsigned int v7 = 0;
  uint64_t result = 3758097097;
  if (!a3 || !a4 || !a5)
  {
LABEL_14:
    if (!a5) {
      return result;
    }
    goto LABEL_15;
  }
  unsigned int v7 = *a5;
  if (!a2)
  {
    uint64_t result = 0;
    *a3 = 0;
    a3[1] = 0;
    goto LABEL_15;
  }
  *a3 = ((unsigned int (*)(OSArray *))a2->getCount)(a2);
  a3[1] = 0;
  uint64_t result = ((uint64_t (*)(OSArray *))a2->getCount)(a2);
  if (!result)
  {
LABEL_15:
    *a5 = v7;
    return result;
  }
  uint64_t v13 = 0;
  unsigned int v14 = (const OSMetaClass *)OSData::metaClass;
  unint64_t v15 = a6;
  while (1)
  {
    uint64_t v16 = (const OSMetaClassBase *)((uint64_t (*)(OSArray *, uint64_t))a2->getObject)(a2, v13);
    uint64_t v17 = OSMetaClassBase::safeMetaCast(v16, v14);
    if (!v17)
    {
      uint64_t result = 3758097084;
      goto LABEL_14;
    }
    int v18 = v17;
    unsigned int v19 = ((uint64_t (*)(OSMetaClassBase *))v17->__vftable[1].getMetaClass)(v17);
    if ((unint64_t)(v19 + v7) + 4 > v15) {
      break;
    }
    unsigned int v20 = v19;
    a4[v7] = v19;
    a4[v7 + 1] = BYTE1(v19);
    a4[v7 + 2] = BYTE2(v19);
    a4[v7 + 3] = HIBYTE(v19);
    uint64_t v21 = (const void *)((uint64_t (*)(OSMetaClassBase *))v18->__vftable[2].~OSMetaClassBase_0)(v18);
    uint64_t v22 = v7 + 4;
    memmove(&a4[v22], v21, v20);
    unsigned int v7 = v20 + v22;
    a3[1] += v20 + 4;
    uint64_t v13 = (v13 + 1);
    if (v13 >= ((unsigned int (*)(OSArray *))a2->getCount)(a2))
    {
      uint64_t result = 0;
      if (a5) {
        goto LABEL_15;
      }
      return result;
    }
  }
  uint64_t result = 4294936277;
  if (a5) {
    goto LABEL_15;
  }
  return result;
}

uint64_t ASIOKitUserClient::AoOapHZis11ZWGBt(const IOService *a1, uint64_t a2)
{
  if (!a1[1].__timeBusy || IOService::isInactive(a1)) {
    return 3758097113;
  }
  uint64_t timeBusy = a1[1].__timeBusy;

  return ASIOKit::viqFL3262Ase9MTj(timeBusy, a2);
}

uint64_t ASIOKitUserClient::TaWOjBSsmF3GGaLj(const IOService *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1[1].__timeBusy || IOService::isInactive(a1)) {
    return 3758097113;
  }
  uint64_t timeBusy = a1[1].__timeBusy;

  return ASIOKit::kkUx5VJz08bbuV(timeBusy, a2, a3, a4, a5);
}

uint64_t ASIOKitUserClient::LBYbjzNs8jyCVGMA(const IOService *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1[1].__timeBusy || IOService::isInactive(a1)) {
    return 3758097113;
  }
  uint64_t timeBusy = a1[1].__timeBusy;

  return ASIOKit::zLzyTpirXonhRZpa(timeBusy, a2, a3, a4, a5);
}

uint64_t ASIOKitUserClient::DCFQ04HMpOkfuaSe(const IOService *this, OSData *a2)
{
  if (!this[1].__timeBusy || IOService::isInactive(this)) {
    return 3758097113;
  }
  uint64_t timeBusy = (ASIOKit *)this[1].__timeBusy;

  return ASIOKit::xGSTqgIsVVUQ7g1X(timeBusy, a2);
}

uint64_t ASIOKitUserClient::jX9XqRGElMRa94yW(const IOService *a1, uint64_t a2, uint64_t a3)
{
  if (!a1[1].__timeBusy || IOService::isInactive(a1)) {
    return 3758097113;
  }
  uint64_t timeBusy = a1[1].__timeBusy;

  return ASIOKit::gWpFuEx4xk9dHYIu(timeBusy, a2, a3);
}

uint64_t ASIOKitUserClient::XsdG5NObDHMsWkui(const IOService *this, OSArray **a2)
{
  if (!this[1].__timeBusy || IOService::isInactive(this)) {
    return 3758097113;
  }
  uint64_t timeBusy = (ASIOKit *)this[1].__timeBusy;

  return ASIOKit::j0GEgZ4eFeXtkbQ1(timeBusy, a2);
}

uint64_t ASIOKitUserClient::start(ASIOKitUserClient *this, IOService *a2)
{
  if (result)
  {
    v5 = OSMetaClassBase::safeMetaCast(a2, &ASIOKit::gMetaClass);
    *((void *)this + 27) = v5;
    return v5 != 0;
  }
  return result;
}

uint64_t ASIOKitUserClient::stop(ASIOKitUserClient *this, IOService *a2)
{
}

OSObject *ASIOKitUserClient::initWithTask(ASIOKitUserClient *this, task_t task, void *a3, uint64_t a4)
{
  uint64_t result = IOUserClient::copyClientEntitlement(task, "com.apple.private.asiokit.allow");
  if (result)
  {
    unsigned int v9 = result;
    unsigned int v10 = *kOSBooleanTrue;
    ((void (*)(OSObject *))result->release_0)(result);
    if (v9 == v10)
    {
      uint64_t result = 0;
      if (task)
      {
        if (v11)
        {
          *((void *)this + 27) = 0;
          *((void *)this + 28) = task;
          uint64_t result = (OSObject *)(&dword_0 + 1);
          *((unsigned char *)this + 232) = 0;
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

uint64_t ASIOKitUserClient::clientClose(ASIOKitUserClient *this)
{
  return 0;
}

OSMetaClass *_GLOBAL__sub_I_ASIOKitUserClient_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&ASIOKitUserClient::gMetaClass, "ASIOKitUserClient", &IOUserClient::gMetaClass, 0xF0u);
  result->__vftable = (OSMetaClass_vtbl *)off_58788;
  return result;
}

void global destructor keyed to'_a()
{
}

OSMetaClass *ASIOKit::MetaClass::MetaClass(OSMetaClass *this)
{
  uint64_t result = OSMetaClass::OSMetaClass(this, "ASIOKit", &IOService::gMetaClass, 0x90u);
  result->__vftable = (OSMetaClass_vtbl *)off_58E08;
  return result;
}

{
  OSMetaClass *result;

  uint64_t result = OSMetaClass::OSMetaClass(this, "ASIOKit", &IOService::gMetaClass, 0x90u);
  result->__vftable = (OSMetaClass_vtbl *)off_58E08;
  return result;
}

void ASIOKit::MetaClass::~MetaClass(OSMetaClass *this)
{
}

{
  OSMetaClass::~OSMetaClass(this);
}

void ASIOKit::ASIOKit(ASIOKit *this, const OSMetaClass *a2)
{
  IOService::IOService((IOService *)this, a2)->__vftable = (IOService_vtbl *)off_588B0;
}

{
  IOService::IOService((IOService *)this, a2)->__vftable = (IOService_vtbl *)off_588B0;
}

void ASIOKit::~ASIOKit(IOService *this)
{
}

{
  IOService::~IOService(this);
}

{
  uint64_t vars8;

  IOService::~IOService(this);

  _OSObject_typed_operator_delete(&ASIOKit_ktv, this, 144);
}

void ASIOKit::operator delete(void *a1, uint64_t a2)
{
}

void *ASIOKit::getMetaClass(ASIOKit *this)
{
  return &ASIOKit::gMetaClass;
}

IOService *ASIOKit::MetaClass::alloc(ASIOKit::MetaClass *this)
{
  v1 = (IOService *)OSObject_typed_operator_new();
  IOService::IOService(v1, &ASIOKit::gMetaClass)->__vftable = (IOService_vtbl *)off_588B0;
  OSMetaClass::instanceConstructed(&ASIOKit::gMetaClass);
  return v1;
}

uint64_t ASIOKit::operator new(ASIOKit *this)
{
  return OSObject_typed_operator_new();
}

void ASIOKit::ASIOKit(ASIOKit *this)
{
  IOService::IOService((IOService *)this, &ASIOKit::gMetaClass)->__vftable = (IOService_vtbl *)off_588B0;
  OSMetaClass::instanceConstructed(&ASIOKit::gMetaClass);
}

{
  IOService::IOService((IOService *)this, &ASIOKit::gMetaClass)->__vftable = (IOService_vtbl *)off_588B0;
  OSMetaClass::instanceConstructed(&ASIOKit::gMetaClass);
}

uint64_t ASIOKit::init(ASIOKit *this, OSDictionary *a2)
{
}

uint64_t ASIOKit::free(ASIOKit *this)
{
}

uint64_t ASIOKit::probe(ASIOKit *this, IOService *a2, int *a3)
{
}

IOCommandGate *ASIOKit::start(OSObject *this, IOService *a2)
{
  if (result)
  {
    uint64_t result = IOCommandGate::commandGate(this, 0);
    *(void *)&this[8].retainCount = result;
    if (result)
    {
      uint64_t v4 = ((uint64_t (*)(OSObject *))this->__vftable[7].serialize)(this);
      if ((*(unsigned int (**)(uint64_t, void))(*(void *)v4 + 160))(v4, *(void *)&this[8].retainCount))
      {
        if (*(void *)&this[8].retainCount)
        {
          uint64_t v5 = ((uint64_t (*)(OSObject *))this->__vftable[7].serialize)(this);
          (*(void (**)(uint64_t, void))(*(void *)v5 + 168))(v5, *(void *)&this[8].retainCount);
          uint64_t v6 = *(void *)&this[8].retainCount;
          if (v6) {
            (*(void (**)(uint64_t))(*(void *)v6 + 40))(v6);
          }
          uint64_t result = 0;
          *(void *)&this[8].retainCount = 0;
        }
        else
        {
          return 0;
        }
      }
      else
      {
        ((void (*)(OSObject *, void))this->__vftable[5].taggedRetain)(this, 0);
        return (IOCommandGate *)(&dword_0 + 1);
      }
    }
  }
  return result;
}

uint64_t ASIOKit::stop(ASIOKit *this, IOService *a2)
{
  if (*((void *)this + 17))
  {
    uint64_t v4 = (*(uint64_t (**)(ASIOKit *))(*(void *)this + 888))(this);
    (*(void (**)(uint64_t, void))(*(void *)v4 + 168))(v4, *((void *)this + 17));
    uint64_t v5 = *((void *)this + 17);
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 40))(v5);
    }
    *((void *)this + 17) = 0;
  }

  return ((uint64_t (*)(ASIOKit *, IOService *))stop)(this, a2);
}

uint64_t mapAppleSSEError(int a1)
{
  uint64_t result = 4294936292;
  if (a1 <= -536870182)
  {
    if (a1 == -536870184) {
      int v7 = -31013;
    }
    else {
      int v7 = -31004;
    }
    if (a1 == -536870186) {
      int v8 = -31205;
    }
    else {
      int v8 = v7;
    }
    if (a1 == -536870199) {
      unsigned int v9 = -31204;
    }
    else {
      unsigned int v9 = v8;
    }
    if (a1 == -536870206) {
      int v10 = -31201;
    }
    else {
      int v10 = -31004;
    }
    if (a1 == -536870211) {
      int v11 = -31202;
    }
    else {
      int v11 = v10;
    }
    if (a1 == -536870212) {
      unsigned int v12 = -31207;
    }
    else {
      unsigned int v12 = v11;
    }
    if (a1 <= -536870200) {
      return v12;
    }
    else {
      return v9;
    }
  }
  else
  {
    switch(a1)
    {
      case -20:
        __asm { BTI             j; jumptable 000000000000D81C case 0 }
        uint64_t result = 4294936072;
        goto LABEL_4;
      case -19:
        __asm { BTI             j; jumptable 000000000000D81C case 1 }
        uint64_t result = 4294936073;
        break;
      case -18:
        __asm { BTI             j; jumptable 000000000000D81C case 2 }
        uint64_t result = 4294936074;
        break;
      case -17:
        __asm { BTI             j; jumptable 000000000000D81C case 3 }
        uint64_t result = 4294936075;
        break;
      case -16:
        __asm { BTI             j; jumptable 000000000000D81C case 4 }
        uint64_t result = 4294936076;
        break;
      case -15:
        __asm { BTI             j; jumptable 000000000000D81C case 5 }
        uint64_t result = 4294936077;
        break;
      case -14:
LABEL_4:
        __asm { BTI             j; jumptable 000000000000D81C case 6 }
        break;
      case -13:
        __asm { BTI             j; jumptable 000000000000D81C case 7 }
        uint64_t result = 4294936078;
        break;
      case -12:
        __asm { BTI             j; jumptable 000000000000D81C case 8 }
        uint64_t result = 4294936079;
        break;
      case -11:
        __asm { BTI             j; jumptable 000000000000D81C case 9 }
        uint64_t result = 4294936080;
        break;
      case -10:
        __asm { BTI             j; jumptable 000000000000D81C case 10 }
        uint64_t result = 4294936081;
        break;
      case -9:
        __asm { BTI             j; jumptable 000000000000D81C case 11 }
        uint64_t result = 4294936082;
        break;
      case -8:
        __asm { BTI             j; jumptable 000000000000D81C case 12 }
        uint64_t result = 4294936083;
        break;
      case -7:
        __asm { BTI             j; jumptable 000000000000D81C case 13 }
        uint64_t result = 4294936084;
        break;
      case -6:
        __asm { BTI             j; jumptable 000000000000D81C case 14 }
        uint64_t result = 4294936092;
        break;
      case -5:
        __asm { BTI             j; jumptable 000000000000D81C case 15 }
        uint64_t result = 4294936094;
        break;
      case -4:
        __asm { BTI             j; jumptable 000000000000D81C case 16 }
        uint64_t result = 4294936085;
        break;
      case -3:
        __asm { BTI             j; jumptable 000000000000D81C case 17 }
        uint64_t result = 4294936086;
        break;
      case -2:
        __asm { BTI             j; jumptable 000000000000D81C case 18 }
        uint64_t result = 4294936087;
        break;
      case -1:
        __asm { BTI             j; jumptable 000000000000D81C case 19 }
        uint64_t result = 4294936088;
        break;
      default:
        if (a1 == -536870165) {
          unsigned int v13 = -31206;
        }
        else {
          unsigned int v13 = -31004;
        }
        if (a1 == -536870181) {
          uint64_t result = 4294936093;
        }
        else {
          uint64_t result = v13;
        }
        break;
    }
  }
  return result;
}

uint64_t ASIOKit::kkUx5VJz0Ll8bbuV(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void, uint64_t (*)(uint64_t, OSData **, uint64_t, void *, unsigned int *), uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 136) + 232))(*(void *)(a1 + 136), ASIOKit::gCTqHYqK053YVV7f, a2, a3, a4, a5);
}

uint64_t ASIOKit::gCTqHYqK053YVV7f(uint64_t a1, OSData **a2, uint64_t a3, void *a4, unsigned int *a5)
{
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v97 = 0;
  long long v95 = 0u;
  memset(v96, 0, sizeof(v96));
  uint64_t v94 = 0;
  long long v92 = 0u;
  memset(v93, 0, sizeof(v93));
  memset(v91, 0, 72);
  v74 = 0;
  uint64_t v90 = 0;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long numBytes = 0u;
  long long v83 = 0u;
  long long v81 = 0u;
  uint64_t v5 = 4294940294;
  long long v80 = 0u;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3) {
    goto LABEL_5;
  }
  if (!a4) {
    goto LABEL_5;
  }
  LODWORD(v71) = 0;
  vchs9e72gvima(108, a5, &v80, &v95, &v71);
  uint64_t v5 = v71;
  if (v71) {
    goto LABEL_5;
  }
  LODWORD(v12) = v81;
  uint64_t v5 = 4294940286;
  if (v81 > 3 || DWORD1(v81) > 3) {
    goto LABEL_5;
  }
  if (HIDWORD(v83) != 24)
  {
    uint64_t v5 = 4294936275;
    goto LABEL_5;
  }
  if (numBytes != 16 && numBytes != 8)
  {
    uint64_t v5 = 4294936274;
    goto LABEL_5;
  }
  uint64_t v5 = 4294936273;
  if (DWORD2(v84) != 8 || DWORD2(v85) != 8 || DWORD2(v86) != 8) {
    goto LABEL_5;
  }
  unsigned int v13 = 0;
  BOOL isCharging = 0;
  char v15 = v90;
  if (HIDWORD(v87) == 1)
  {
    unsigned int v16 = 0;
    uint64_t v17 = 0;
    if ((v90 & 2) == 0)
    {
      uint64_t v17 = IOService::serviceMatching("IOPMPowerSource", 0);
      unsigned int v13 = IOService::copyMatchingService(v17);
      int v18 = (IOPMPowerSource *)OSMetaClassBase::safeMetaCast(v13, IOPMPowerSource::metaClass);
      unsigned int v19 = v18;
      if (!v18)
      {
        unsigned int v24 = 0;
        goto LABEL_53;
      }
      BOOL isCharging = IOPMPowerSource::isCharging(v18);
      unsigned int v16 = IOPMPowerSource::capacityPercentRemaining(v19) / 0x14;
      LODWORD(v12) = v81;
    }
  }
  else
  {
    unsigned int v16 = 0;
    uint64_t v17 = 0;
  }
  if (v12)
  {
    uint64_t v12 = v12;
    unsigned int v20 = v93;
    uint64_t v21 = v96;
    uint64_t v22 = v91;
    while (1)
    {
      void *v22 = 0;
      *(v20 - 2) = *(v21 - 2);
      uint64_t v23 = *((void *)v21 - 2);
      *((void *)v20 - 2) = v23;
      *unsigned int v20 = *v21;
      if (!v23) {
        break;
      }
      *(v20 - 1) = *(v21 - 1);
      v22 += 3;
      v20 += 6;
      v21 += 6;
      if (!--v12) {
        goto LABEL_31;
      }
    }
    unsigned int v24 = 0;
    unsigned int v19 = 0;
    uint64_t v5 = 4294940295;
    goto LABEL_127;
  }
LABEL_31:
  if (HIDWORD(v87) != 1
    || (v90 & 2) != 0
    || (*(void *)&long long v75 = 0xD300000001,
        DWORD2(v75) = 0,
        LODWORD(v76) = 0,
        DWORD1(v76) = isCharging | (2 * v16),
        *((void *)&v76 + 1) = 0,
        LODWORD(v71) = 0,
        vchs9e72gvima(101, (unsigned int *)&v75, &v92, 0, &v71),
        !v71))
  {
    if (DWORD2(v87) == 65 && (void)v87)
    {
      int v25 = DWORD1(v81);
      if (DWORD1(v81))
      {
        unint64_t v26 = 0;
        long long v27 = &v92;
        long long v28 = v91;
        do
        {
          LODWORD(v71) = 0;
          vchs9e72gvima(104, (unsigned int *)&v80, v27, v28, &v71);
          if (v71) {
            goto LABEL_93;
          }
          ++v26;
          int v25 = DWORD1(v81);
          long long v27 = (long long *)((char *)v27 + 24);
          v28 += 3;
        }
        while (v26 < DWORD1(v81));
      }
      if (HIDWORD(v87) > 2)
      {
        bytes = 0;
        memset(v79, 0, sizeof(v79));
        int v78 = 0;
        uint64_t v77 = 0;
        unsigned int v40 = v81;
        uint64_t v71 = v81;
        v72 = v79;
        v73 = &v77;
        if (v25)
        {
          unint64_t v41 = 0;
          v42 = &v91[1];
          do
          {
            v72[v41] = *((void *)v42 - 1);
            int v43 = *v42;
            v42 += 6;
            *((_DWORD *)v73 + v41++) = v43;
            unsigned int v44 = DWORD1(v81);
          }
          while (v41 < DWORD1(v81));
          unsigned int v40 = v81;
        }
        else
        {
          unsigned int v44 = 0;
        }
        if (v44 < v40)
        {
          unint64_t v52 = v44;
          v53 = &v93[24 * v44 - 8];
          do
          {
            v72[v52] = *((void *)v53 - 1);
            int v54 = *v53;
            v53 += 6;
            *((_DWORD *)v73 + v52++) = v54;
          }
          while (v52 < v81);
        }
        int v69 = 0;
        vchs9e72gvima(105, (unsigned int *)&v71, &bytes, 0, &v69);
        if (v69)
        {
LABEL_93:
          uint64_t v5 = 0;
          unsigned int v24 = 0;
          unsigned int v19 = 0;
          goto LABEL_127;
        }
        v31 = OSData::withBytes(bytes, (32 * v81) | 1);
        if (bytes) {
          vchs9e72gvima(103, (unsigned int *)bytes, 0, 0, 0);
        }
        v67 = v17;
LABEL_47:
        int v66 = numBytes;
        unsigned int v24 = IOService::serviceMatching("AppleSSE", 0);
        unsigned int v19 = (IOPMPowerSource *)IOService::copyMatchingService(v24);
        v32 = OSMetaClassBase::safeMetaCast(v19, AppleSSEInterface::metaClass);
        if (!v32)
        {
          uint64_t v5 = 4294966587;
          uint64_t v17 = v67;
          goto LABEL_125;
        }
        v33 = v32;
        char v61 = v15;
        v68 = v31;
        v65 = OSData::withBytesNoCopy(*((void **)&v81 + 1), numBytes);
        v62 = OSData::withBytesNoCopy((char *)&numBytes + 4, HIDWORD(v83));
        v34 = OSData::withBytesNoCopy((void *)v84, DWORD2(v84));
        v35 = OSData::withBytesNoCopy((void *)v85, DWORD2(v85));
        v36 = OSData::withBytesNoCopy((void *)v86, DWORD2(v86));
        v63 = v34;
        v64 = v35;
        if (v66 == 8)
        {
          uint64_t v71 = 0;
          v37 = v62;
          int v38 = ((uint64_t (*)(OSMetaClassBase *, uint64_t, OSData *))v33->__vftable[13].retain)(v33, 2, v65);
          if (v71) {
            (*(void (**)(uint64_t))(*(void *)v71 + 40))(v71);
          }
          uint64_t v17 = v67;
          v39 = v65;
        }
        else
        {
          v37 = v62;
          int v38 = ((uint64_t (*)(OSMetaClassBase *, void, OSData *))v33->__vftable[12].Dispatch)(v33, v61 & 1 | 4u, v65);
          v39 = v65;
          uint64_t v17 = v67;
        }
        if (v39) {
          ((void (*)(OSData *))v39->release_0)(v39);
        }
        if (v37) {
          ((void (*)(OSData *))v37->release_0)(v37);
        }
        if (v63) {
          ((void (*)(OSData *))v63->release_0)(v63);
        }
        v31 = v68;
        if (v64) {
          ((void (*)(OSData *))v64->release_0)(v64);
        }
        if (v36) {
          ((void (*)(OSData *))v36->release_0)(v36);
        }
        if (v38) {
          BOOL v45 = 1;
        }
        else {
          BOOL v45 = v74 == 0;
        }
        int v46 = v45;
        if (v45)
        {
          if (v38 != -536870184)
          {
            uint64_t v5 = mapAppleSSEError(v38);
            goto LABEL_125;
          }
          uint64_t v5 = 4294936283;
        }
        else
        {
          uint64_t v5 = 0;
        }
        if (HIDWORD(v87) != 3)
        {
          *a2 = v74;
          goto LABEL_125;
        }
        uint64_t v47 = DWORD1(v81);
        if (DWORD1(v81))
        {
          int v48 = 0;
          v49 = (int *)&v91[1];
          do
          {
            int v50 = *v49;
            v49 += 6;
            v48 += v50 + 4;
            --v47;
          }
          while (v47);
          int v51 = v48 + 4;
        }
        else
        {
          int v51 = 4;
        }
        if (v46) {
          v55 = v68;
        }
        else {
          v55 = v74;
        }
        unsigned int v56 = ((uint64_t (*)(OSData *))v55->getLength)(v55);
        v57 = OSData::withCapacity(v51 + v56);
        *a2 = v57;
        if (!((unsigned int (*)(void))v57->appendByte)()
          || !((unsigned int (*)(OSData *, void, uint64_t))(*a2)->appendByte)(*a2, BYTE1(v56), 1)
          || !((unsigned int (*)(OSData *, void, uint64_t))(*a2)->appendByte)(*a2, BYTE2(v56), 1)
          || !((unsigned int (*)(OSData *, void, uint64_t))(*a2)->appendByte)(*a2, HIBYTE(v56), 1))
        {
          goto LABEL_123;
        }
        v58 = *a2;
        if (v46)
        {
          if ((((uint64_t (*)(OSData *, OSData *))v58->appendBytes_0)(v58, v68) & 1) == 0) {
            goto LABEL_123;
          }
        }
        else if (!((unsigned int (*)(OSData *, OSData *))v58->appendBytes_0)(v58, v74))
        {
          goto LABEL_123;
        }
        if (!DWORD1(v81))
        {
LABEL_117:
          if (*a4 && (*(unsigned int (**)(void))(*(void *)*a4 + 144))(*a4) >= 2) {
            (*(void (**)(void, uint64_t))(*(void *)*a4 + 264))(*a4, 1);
          }
          if (v74) {
            ((void (*)(OSData *))v74->release_0)(v74);
          }
          v74 = 0;
          goto LABEL_124;
        }
        unint64_t v59 = 0;
        v60 = (unsigned __int8 *)&v91[1];
        while (((unsigned int (*)(OSData *, void, uint64_t))(*a2)->appendByte)(*a2, *v60, 1)
             && ((unsigned int (*)(OSData *, void, uint64_t))(*a2)->appendByte)(*a2, v60[1], 1)
             && ((unsigned int (*)(OSData *, void, uint64_t))(*a2)->appendByte)(*a2, v60[2], 1)
             && ((unsigned int (*)(OSData *, void, uint64_t))(*a2)->appendByte)(*a2, v60[3], 1)
             && (((uint64_t (*)(OSData *, void, void))(*a2)->appendBytes)(*a2, *((void *)v60 - 1), *(unsigned int *)v60) & 1) != 0)
        {
          ++v59;
          v60 += 24;
          if (v59 >= DWORD1(v81)) {
            goto LABEL_117;
          }
        }
LABEL_123:
        uint64_t v5 = 4294936290;
LABEL_124:
        v31 = v68;
LABEL_125:
        if (v31) {
          ((void (*)(OSData *))v31->release_0)(v31);
        }
        goto LABEL_127;
      }
      v67 = v17;
      v29 = (void *)v91[0];
      unsigned int v30 = v91[1];
    }
    else
    {
      if (HIDWORD(v87) != 1)
      {
        unsigned int v24 = 0;
        unsigned int v19 = 0;
        uint64_t v5 = 4294940290;
        goto LABEL_127;
      }
      v67 = v17;
      v29 = (void *)v92;
      unsigned int v30 = DWORD2(v92);
    }
    v31 = OSData::withBytesNoCopy(v29, v30);
    goto LABEL_47;
  }
  unsigned int v24 = 0;
  unsigned int v19 = 0;
LABEL_53:
  uint64_t v5 = 3758097084;
LABEL_127:
  if (v17) {
    ((void (*)(OSDictionary *))v17->release_0)(v17);
  }
  if (v13) {
    ((void (*)(IOService *))v13->release_0)(v13);
  }
  if (v24) {
    ((void (*)(OSDictionary *))v24->release_0)(v24);
  }
  if (v19) {
    ((void (*)(IOPMPowerSource *))v19->release_0)(v19);
  }
LABEL_5:
  for (uint64_t i = 0; i != 9; i += 3)
  {
    unsigned int v9 = *(unsigned int **)&v93[i * 8 - 16];
    if (v9) {
      vchs9e72gvima(103, v9, 0, 0, 0);
    }
    int v10 = (unsigned int *)v91[i];
    if (v10) {
      vchs9e72gvima(103, v10, 0, 0, 0);
    }
  }
  return v5;
}

uint64_t ASIOKit::zLzyTpirXonhRZpa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void, uint64_t (*)(uint64_t, void *, uint64_t, void *, unsigned int *), uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 136) + 232))(*(void *)(a1 + 136), ASIOKit::XYyzPN8jt1XoYiqP, a2, a3, a4, a5);
}

uint64_t ASIOKit::XYyzPN8jt1XoYiqP(uint64_t a1, void *a2, uint64_t a3, void *a4, unsigned int *a5)
{
  memset(v43, 0, sizeof(v43));
  uint64_t v31 = 0;
  uint64_t v42 = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  *(_OWORD *)int v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)v36 = 0u;
  *(_OWORD *)v37 = 0u;
  *(_OWORD *)long long numBytes = 0u;
  *(_OWORD *)v35 = 0u;
  uint64_t v5 = 4294940294;
  long long v32 = 0u;
  *(_OWORD *)bytes = 0u;
  if (a2)
  {
    if (a3)
    {
      if (a4)
      {
        unsigned int v30 = 0;
        vchs9e72gvima(108, a5, &v32, v43, &v30);
        uint64_t v5 = v30;
        if (!v30)
        {
          if (v35[3] == 24)
          {
            if (numBytes[0] == 16)
            {
              uint64_t v5 = 4294936273;
              if (LODWORD(v36[1]) == 8 && LODWORD(v37[1]) == 8 && LODWORD(v38[1]) == 8)
              {
                if (v42) {
                  char v9 = 5;
                }
                else {
                  char v9 = 4;
                }
                if (LODWORD(bytes[0]) <= 1)
                {
                  if (LODWORD(v43[1])
                    && *(unsigned char *)v43[0]
                    && (((LODWORD(v43[1]) - 1) & 0x1F) != 0
                     || (LODWORD(v43[1]) - 1) / *(unsigned __int8 *)v43[0] != 32))
                  {
                    uint64_t v5 = 4294936276;
                  }
                  else
                  {
                    int v11 = OSData::withBytesNoCopy(v43[0], v43[1]);
                    uint64_t v12 = IOService::serviceMatching("AppleSSE", 0);
                    unsigned int v13 = IOService::copyMatchingService(v12);
                    unsigned int v14 = OSMetaClassBase::safeMetaCast(v13, AppleSSEInterface::metaClass);
                    if (v14)
                    {
                      char v15 = v14;
                      long long v28 = v12;
                      v29 = v13;
                      unsigned int v16 = OSData::withBytesNoCopy(bytes[1], numBytes[0]);
                      uint64_t v17 = OSData::withBytesNoCopy(&numBytes[1], v35[3]);
                      long long v27 = v11;
                      int v18 = OSData::withBytesNoCopy(v36[0], v36[1]);
                      unsigned int v19 = OSData::withBytesNoCopy(v37[0], v37[1]);
                      unsigned int v20 = OSData::withBytesNoCopy(v38[0], v38[1]);
                      unsigned __int8 v21 = v9;
                      uint64_t v22 = v20;
                      uint64_t v23 = v15->__vftable;
                      unsigned int v24 = v15;
                      int v25 = v27;
                      int v26 = ((uint64_t (*)(OSMetaClassBase *, void, OSData *, OSData *, OSData *, OSData *, OSData *, OSData *, uint64_t *, uint64_t, void *))v23[12].Dispatch)(v24, v21, v16, v17, v18, v19, v22, v27, &v31, a3, a4);
                      if (v16) {
                        ((void (*)(OSData *))v16->release_0)(v16);
                      }
                      if (v17) {
                        ((void (*)(OSData *))v17->release_0)(v17);
                      }
                      unsigned int v13 = v29;
                      if (v18) {
                        ((void (*)(OSData *))v18->release_0)(v18);
                      }
                      if (v19) {
                        ((void (*)(OSData *))v19->release_0)(v19);
                      }
                      if (v22) {
                        ((void (*)(OSData *))v22->release_0)(v22);
                      }
                      uint64_t v12 = v28;
                      if (v26 || !v31)
                      {
                        uint64_t v5 = mapAppleSSEError(v26);
                      }
                      else
                      {
                        *a2 = v31;
                        if (*a4 && (*(unsigned int (**)(void))(*(void *)*a4 + 144))(*a4) >= 2) {
                          (*(void (**)(void, uint64_t))(*(void *)*a4 + 264))(*a4, 1);
                        }
                        uint64_t v5 = 0;
                      }
                    }
                    else
                    {
                      uint64_t v5 = 4294966587;
                      int v25 = v11;
                    }
                    if (v25) {
                      ((void (*)(OSData *))v25->release_0)(v25);
                    }
                    if (v12) {
                      ((void (*)(OSDictionary *))v12->release_0)(v12);
                    }
                    if (v13) {
                      ((void (*)(IOService *))v13->release_0)(v13);
                    }
                  }
                }
                else
                {
                  uint64_t v5 = 4294940286;
                }
              }
            }
            else
            {
              uint64_t v5 = 4294936274;
            }
          }
          else
          {
            uint64_t v5 = 4294936275;
          }
        }
      }
    }
  }
  if (v43[0]) {
    vchs9e72gvima(103, v43[0], 0, 0, 0);
  }
  return v5;
}

uint64_t ASIOKit::viqFL3262Ase9MTj(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t (*)(uint64_t, uint64_t), uint64_t, void, void, void))(**(void **)(a1 + 136) + 232))(*(void *)(a1 + 136), ASIOKit::FJ6UnG2J0DlyL43A, a2, 0, 0, 0);
}

uint64_t ASIOKit::FJ6UnG2J0DlyL43A(uint64_t a1, uint64_t a2)
{
  tv.tv_sec = 0;
  *(void *)&tv.tv_usec = 0;
  v3 = IOService::serviceMatching("IOPMPowerSource", 0);
  uint64_t v4 = IOService::copyMatchingService(v3);
  uint64_t v5 = (IOPMPowerSource *)OSMetaClassBase::safeMetaCast(v4, IOPMPowerSource::metaClass);
  if (v5)
  {
    uint64_t v6 = v5;
    *(unsigned char *)(a2 + 8) = IOPMPowerSource::isCharging(v5);
    *(_DWORD *)(a2 + 4) = IOPMPowerSource::capacityPercentRemaining(v6);
    int v11 = 0;
    vchs9e72gvima(100, 0, 0, 0, &v11);
    *(_DWORD *)a2 = v11;
    microtime(&tv);
    read_random((void *)(a2 + 9), 0x20u);
    uint64_t v7 = 0;
    unint64_t v8 = tv.tv_usec + 1000000 * tv.tv_sec;
    *(_OWORD *)(a2 + 9) = xmmword_880;
    uint64x2_t v9 = (uint64x2_t)vdupq_n_s64(v8);
    *(_OWORD *)(a2 + 25) = xmmword_890;
    *(int8x8_t *)(a2 + 9) = vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_8B0), (int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_8A0)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_8D0), (int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_8C0))));
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 3758097084;
  if (v3) {
LABEL_3:
  }
    ((void (*)(OSDictionary *))v3->release_0)(v3);
LABEL_4:
  if (v4) {
    ((void (*)(IOService *))v4->release_0)(v4);
  }
  return v7;
}

uint64_t ASIOKit::kKcutC1yTbOdNEHi(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t (*)(uint64_t, uint64_t), uint64_t, void, void, void))(**(void **)(a1 + 136) + 232))(*(void *)(a1 + 136), ASIOKit::DqycVGt64ff4YTON, a2, 0, 0, 0);
}

uint64_t ASIOKit::DqycVGt64ff4YTON(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = xmmword_8E0;
  *(void *)(a2 + 16) = OSArray::withCapacity(6u);
  v3 = OSString::withCString("1.2.840.113635.100.10.1");
  int v4 = (*(uint64_t (**)(void, OSString *))(**(void **)(a2 + 16) + 232))(*(void *)(a2 + 16), v3);
  if (v3) {
    ((void (*)(OSString *))v3->release_0)(v3);
  }
  if (v4)
  {
    uint64_t v5 = OSString::withCString("1.2.840.113635.100.8.3");
    int v6 = (*(uint64_t (**)(void, OSString *))(**(void **)(a2 + 16) + 232))(*(void *)(a2 + 16), v5);
    if (v5) {
      ((void (*)(OSString *))v5->release_0)(v5);
    }
    if (v6)
    {
      uint64_t v7 = OSString::withCString("1.2.840.113635.100.8.4");
      int v8 = (*(uint64_t (**)(void, OSString *))(**(void **)(a2 + 16) + 232))(*(void *)(a2 + 16), v7);
      if (v7) {
        ((void (*)(OSString *))v7->release_0)(v7);
      }
      if (v8)
      {
        uint64x2_t v9 = OSString::withCString("1.2.840.113635.100.8.5");
        int v10 = (*(uint64_t (**)(void, OSString *))(**(void **)(a2 + 16) + 232))(*(void *)(a2 + 16), v9);
        if (v9) {
          ((void (*)(OSString *))v9->release_0)(v9);
        }
        if (v10)
        {
          int v11 = OSString::withCString("1.2.840.113635.100.8.6");
          int v12 = (*(uint64_t (**)(void, OSString *))(**(void **)(a2 + 16) + 232))(*(void *)(a2 + 16), v11);
          if (v11) {
            ((void (*)(OSString *))v11->release_0)(v11);
          }
          if (v12)
          {
            unsigned int v13 = OSString::withCString("1.2.840.113635.100.8.7");
            int v14 = (*(uint64_t (**)(void, OSString *))(**(void **)(a2 + 16) + 232))(*(void *)(a2 + 16), v13);
            if (v13) {
              ((void (*)(OSString *))v13->release_0)(v13);
            }
            if (v14) {
              *(void *)(a2 + 24) = OSString::withCString("{\"kMAOptionsBAAValidity\": 525600, \"kMAOptionsBAAOIDSToInclude\": [\"1.2.840.113635.100.10.1\", \"1.2.840.113635.100.8.3\", \"1.2.840.113635.100.8.4\", \"1.2.840.113635.100.8.5\", \"1.2.840.113635.100.8.6\", \"1.2.840.113635.100.8.7\"], \"kMAOptionsBAASCRTAttestation\": true}");
            }
          }
        }
      }
    }
  }
  return 0;
}

uint64_t ASIOKit::xGSTqgIsVVUQ7g1X(ASIOKit *this, OSData *a2)
{
  return (*(uint64_t (**)(void, uint64_t (*)(ASIOKit *, OSData *), OSData *, void, void, void))(**((void **)this + 17) + 232))(*((void *)this + 17), ASIOKit::mzk5nw1OBhhZhoIc, a2, 0, 0, 0);
}

uint64_t ASIOKit::mzk5nw1OBhhZhoIc(ASIOKit *this, OSData *a2)
{
  v2 = IOService::serviceMatching("AppleSSE", 0);
  v3 = IOService::copyMatchingService(v2);
  int v4 = OSMetaClassBase::safeMetaCast(v3, AppleSSEInterface::metaClass);
  if (v4)
  {
    uint64_t v5 = ((uint64_t (*)(OSMetaClassBase *, uint64_t))v4->__vftable[13].getRetainCount)(v4, 1);
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v5 = 3758097095;
  if (v2) {
LABEL_3:
  }
    ((void (*)(OSDictionary *))v2->release_0)(v2);
LABEL_4:
  if (v3) {
    ((void (*)(IOService *))v3->release_0)(v3);
  }
  return v5;
}

uint64_t ASIOKit::gWpFuEx4xk9dHYIu(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t (*)(uint64_t, uint64_t *, BOOL *), uint64_t, uint64_t, void, void))(**(void **)(a1 + 136) + 232))(*(void *)(a1 + 136), ASIOKit::iNf2g36QrGHJ5jTQ, a2, a3, 0, 0);
}

uint64_t ASIOKit::iNf2g36QrGHJ5jTQ(uint64_t a1, uint64_t *a2, BOOL *a3)
{
  uint64_t result = 4294940294;
  if (a2 && a3)
  {
    uint64_t v5 = *a2;
    if (*a2)
    {
      if (PE_i_can_has_debugger(0)) {
        BOOL is_development = 1;
      }
      else {
        BOOL is_development = kern_config_is_development();
      }
      *a3 = is_development;
    }
    if ((v5 & 2) != 0)
    {
      char v7 = developer_mode_state();
      uint64_t result = 0;
      a3[1] = v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ASIOKit::j0GEgZ4eFeXtkbQ1(ASIOKit *this, OSArray **a2)
{
  return (*(uint64_t (**)(void, uint64_t (*)(ASIOKit *, OSArray **), OSArray **, void, void, void))(**((void **)this + 17) + 232))(*((void *)this + 17), ASIOKit::rjHaa7EHR0CWHw8F, a2, 0, 0, 0);
}

uint64_t ASIOKit::rjHaa7EHR0CWHw8F(ASIOKit *this, OSArray **a2)
{
  v3 = IOService::serviceMatching("AppleSSE", 0);
  int v4 = IOService::copyMatchingService(v3);
  uint64_t v5 = OSMetaClassBase::safeMetaCast(v4, AppleSSEInterface::metaClass);
  if (v5)
  {
    uint64_t v6 = ((uint64_t (*)(OSMetaClassBase *, uint64_t, OSArray **))v5->__vftable[13].release)(v5, 1, a2);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v6 = 3758097095;
  if (v3) {
LABEL_3:
  }
    ((void (*)(OSDictionary *))v3->release_0)(v3);
LABEL_4:
  if (v4) {
    ((void (*)(IOService *))v4->release_0)(v4);
  }
  return v6;
}

OSMetaClass *_GLOBAL__sub_I_ASIOKit_cpp()
{
  uint64_t result = OSMetaClass::OSMetaClass(&ASIOKit::gMetaClass, "ASIOKit", &IOService::gMetaClass, 0x90u);
  result->__vftable = (OSMetaClass_vtbl *)off_58E08;
  return result;
}

void global destructor keyed to'_a_0()
{
}

uint64_t sub_F504(char a1, unsigned int a2)
{
  return byte_5FA0[(byte_3760[a2] ^ a1)] ^ a2;
}

uint64_t sub_F534(unsigned int a1)
{
  return byte_5FA0[byte_3760[a1] ^ 0x3A] ^ a1;
}

void sub_F564(uint64_t a1)
{
  if (*(void *)a1) {
    BOOL v2 = *(void *)(a1 + 8) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = v2;
  int v1 = *(_DWORD *)(a1 + 20) - 936204631 * ((((2 * a1) | 0x3D4C159A) - a1 - 514198221) ^ 0xABA5078F);
  __asm { BRAA            X8, X17 }
}

uint64_t sub_F63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  __asm { BTI             j }
  *(void *)(a8 + 16(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 0;
  *(void *)(a8 + 8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(void *)(v34 + 8 * v32);
  HIDWORD(v41) = a5 - 827530585;
  LODWORD(v41) = (4 * a5) ^ 0x6A8;
  HIDWORD(a24) = a5 - 222528111;
  HIDWORD(a3(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = a5 ^ 0x148;
  HIDWORD(a2(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -549133295;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 8408))(a1, a2, a3, 0x2DABEB540C1AC424, a5, 2028803494, a7, a8, v35 - 167, v35 - 187, v35 - 207, v35 - 160, v35 - 180, 0x64823E55C10AB96ALL, 0x5C80BC5F8900EEFLL, 0x5C80BC5F8900EECLL, 0x5C80BC5F8900EEELL, 0x64823E55C10AB968, 0xE61C79320141BFBBLL,
           a20,
           v35 + 0x2DABEB540C1AC384,
           v33 + 16,
           v35 + 0x2DABEB540C1AC370,
           a24,
           v41,
           (int)a5 ^ 0x156,
           v33,
           a28,
           a7 + 8,
           a30,
           a31,
           a32,
           v35 - 184);
}

uint64_t sub_F800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  __asm { BTI             j }
  *(void *)(a8 + 8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(void *)(v26 + 8 * a26);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * (int)((a26 ^ 0x2FE) + a26)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_F848()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_F860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * (((v29 == a4) * (v28 - 1056 + 68 * (v28 ^ 0x428) - 351)) | v28)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

uint64_t sub_F8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 80))();
}

uint64_t sub_F8B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,int a26)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v26
                              + 8
                              * (((v27 == (a26 & 0x31531FFC ^ (a6 + 184))) * (((a5 - 338) | 0x18) + 1098)) ^ (a5 - 239))))();
}

uint64_t sub_F8FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  __asm { BTI             j }
  *(void *)(a8 + 8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(void *)(v26 + 8 * v25);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * (int)(((v25 ^ 0x401) - 311) | v25)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_F938@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  *(void *)(a1 + 56) = a2;
  return (*(uint64_t (**)(void))(v3 + 8 * (v2 ^ 0x12 ^ ((v2 - 13) | 0x200))))();
}

uint64_t sub_F960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6 + 8 * ((a5 - 239) | ((v7 == (((a5 + 132) | 0x220) ^ (a6 + 184))) << 7))))();
}

uint64_t sub_F994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  __asm { BTI             j }
  *(void *)(a8 + 8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(void *)(v25 + 8 * ((int)a5 - 312));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8 * ((a5 - 864567737) & 0x3388447F ^ 0x6F9 | ((int)a5 - 312))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25);
}

uint64_t sub_F9E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25)
{
  __asm { BTI             j }
  int v31 = (v26 == (a25 ^ (a6 + 184))) * ((a5 - 324) | 8);
  if (v26 == (a25 ^ (a6 + 184))) {
    ++v31;
  }
  return (*(uint64_t (**)(void))(v25 + 8 * (v31 ^ (a5 - 239))))();
}

uint64_t sub_FA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  __asm { BTI             j }
  uint64_t v55 = *(void *)(a8 + 96);
  *(unint64_t *)((char *)&STACK[0x260] + v55) = 0;
  memset((char *)&STACK[0x260] + v55 + 64, 111, 16);
  memset((char *)&STACK[0x260] + v55 + 44, 111, 16);
  memset((char *)&STACK[0x260] + v55 + 24, 111, 16);
  *(void *)(a8 + 96) = v55 + (v49 ^ 0x78);
  *(_DWORD *)((char *)&STACK[0x260] + v55 + 8) = 0;
  *(void *)(a8 + 8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(void *)(v50 + 8 * v49);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 8 * ((int)v49 + 742)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           (char *)&STACK[0x260] + v55 + 60,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           (char *)&STACK[0x260] + v55,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a38);
}

uint64_t sub_FAD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26,int a27)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v27 + 8 * (((v28 == a6 + a27 - 2) * (a25 & 0xD43817F ^ 0x421)) ^ (a5 - 180))))();
}

uint64_t sub_FB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6 + 8 * ((876 * (v7 == ((a5 - 239) ^ 0x115 ^ (a6 - 208)))) ^ (a5 - 180))))();
}

uint64_t sub_FB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  __asm { BTI             j }
  *(void *)(a8 + 48) = a58 + 56;
  return (*(uint64_t (**)(void))(v59 + 8 * ((2 * (a58 != -40)) | (4 * (a58 != -40)) | v58)))();
}

uint64_t sub_FBA0@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  unint64_t v7 = ((2 * a1) & 0xCBEF395F2F73FF0ALL)
     + (a1 ^ 0xE5F79CAF97B9FF85)
     + (((v1 ^ 0x420) + 1623798118) & 0x9F36CE7F ^ 0x3EBAEF7B7AFFFF66);
  if (a1 < (((v1 ^ 0x420u) - 523) ^ 0x275)) {
    unint64_t v7 = 0x24B28C2B12B9FA85 - a1;
  }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((4 * ((v7 - 0x24B28C2B12B9FA85) >> 32 != 0)) | (32
                                                                                 * ((v7 - 0x24B28C2B12B9FA85) >> 32 != 0)) | v1 ^ 0x420)))();
}

uint64_t sub_FC7C()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((v1 < (unint64_t)((v0 - 1000874351) & 0x3BA81F1B) + 0xFFFFFFFFFDEDLL)
                                * ((v0 - 595) ^ 0x2E0)) ^ v0)))();
}

uint64_t sub_FCCC()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_FF30(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19)
{
  __asm { BTI             j }
  int v26 = ((((v20 - 628) | 0x212) - 335040929) ^ v19) & (2 * (v19 & a2)) ^ v19 & a2;
  int v27 = ((2 * (((v20 ^ 0x66) - 335038291) ^ v19)) ^ 0x2837F76) & (((v20 ^ 0x66) - 335038291) ^ v19) ^ (2 * (((v20 ^ 0x66) - 335038291) ^ v19)) & 0x141BFBA;
  int v28 = v27 ^ 0x1408089;
  int v29 = (v27 ^ 0x40BF30) & (4 * v26) ^ v26;
  int v30 = ((4 * v28) ^ 0x506FEEC) & v28 ^ (4 * v28) & 0x141BFB8;
  int v31 = (v30 ^ 0x100BEA0) & (16 * v29) ^ v29;
  int v32 = ((16 * (v30 ^ 0x410113)) ^ 0x141BFBB0) & (v30 ^ 0x410113) ^ (16 * (v30 ^ 0x410113)) & 0x141BFB0;
  int v33 = v31 ^ a19 ^ (v32 ^ 0x1BB00) & (v31 << 8);
  unsigned int v34 = v19 ^ (2
             * ((v33 << 16) & 0x1410000 ^ v33 ^ ((v33 << 16) ^ 0xBFBB0000) & (((v32 ^ 0x140040B) << 8) & 0x1410000 ^ 0x400000 ^ (((v32 ^ 0x140040B) << 8) ^ 0x41BF0000) & (v32 ^ 0x140040B))));
  BOOL v35 = (v34 & 0xFFFF0000 ^ 0x42131BC8975602A8)
      + (v34 & 0xEE220000 ^ 0x8404040568205543)
      - ((v34 & 0xFFFF0000 ^ 0x42131BC8975602A8) & 0x1308EE220220) == 0xC6170CC594B355CBLL;
  return (*(uint64_t (**)(void))(v21 + 8 * ((2 * v35) | (8 * v35) | v20)))();
}

uint64_t sub_10194(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_102EC(unsigned int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_10320()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_10564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  __asm { BTI             j }
  unint64_t v50 = v42 & (v39 ^ 0xD2297B80C916C172) ^ v41;
  unint64_t v51 = ((2 * (v39 ^ 0xD633FB88891ACBA6)) ^ 0x1AFD10B8C8B99DBALL) & (v39 ^ 0xD633FB88891ACBA6) ^ (2 * (v39 ^ 0xD633FB88891ACBA6)) & 0xD7E885C645CCEDCLL;
  uint64_t v52 = (v51 ^ 0x87C0010405C4C99) & (4 * v50) ^ v50;
  uint64_t v53 = ((4 * (v51 ^ 0x502884424444245)) ^ 0x35FA217191733B74) & (v51 ^ 0x502884424444245) ^ (4
                                                                                                  * (v51 ^ 0x502884424444245)) & 0xD7E885C645CCEDCLL;
  uint64_t v54 = (v53 ^ 0x57A005000500A59) & (16 * v52) ^ v52;
  unint64_t v55 = ((16 * (v53 ^ 0x804880C640CC489)) ^ 0xD7E885C645CCEDD0) & (v53 ^ 0x804880C640CC489) ^ (16 * (v53 ^ 0x804880C640CC489)) & 0xD7E885C645CCED0;
  uint64_t v56 = (v55 ^ 0x5688044444CCC0DLL) & (v54 << 8) ^ v54;
  uint64_t v57 = (((v55 ^ 0x81608182010020DLL) << 8) ^ 0x7E885C645CCEDD00) & (v55 ^ 0x81608182010020DLL) ^ ((v55 ^ 0x81608182010020DLL) << 8) & 0xD7E885C645CCE00;
  uint64_t v58 = v56 ^ 0xD7E885C645CCEDDLL ^ (v57 ^ 0xC080844444C02DDLL) & (v56 << 16);
  uint64_t v59 = (v58 << 32) ^ 0x645CCEDD00000000;
  *(unsigned char *)(v40 + 4(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 113;
  *(unsigned char *)(v40 + 41) = ((((v39 ^ (2
                                  * ((v58 << 32) & 0xD7E885C00000000 ^ v58 ^ v59 & (((v57 ^ 0x1768018201002DDLL) << 16) & 0xD7E885C00000000 ^ 0x522880000000000 ^ (((v57 ^ 0x1768018201002DDLL) << 16) ^ 0x85C645C00000000) & (v57 ^ 0x1768018201002DDLL)))) ^ 0x8000008000808080) >> (4 * (((2 * v44) ^ (4 * (v44 & ~(2 * (v44 & ~(2 * (v44 & (2 * (v44 & 0x17 ^ 0x4F)) & 0x22 ^ v44 & 0x17 ^ 0x4F)))) & 0x66 ^ v44 & 0x17 ^ 0x4F)) ^ 0x1E) & 0xFEu) - 8)) & 0x80) != 0)
                       + v44;
  *(void *)(a8 + 104) = *(void *)(v45 + 8 * v43);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 8 * (v43 + 48)))(v59, 0xD7E885C00000000, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_10800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((((v5 ^ (a5 + 59)) & 1) * ((5 * (a5 ^ 0x174)) ^ 0x95)) ^ (a5 - 253))))();
}

uint64_t sub_1083C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v7 + 8 * ((((((v6 + 372) | 0xA2) - 593) ^ 0x426) * (v8 == a6)) | v6)))();
}

uint64_t sub_10874@<X0>(uint64_t a1@<X7>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,int a42)
{
  __asm { BTI             j }
  **(_DWORD **)(a1 + 48) = a42;
  return (*(uint64_t (**)(void))(v42 + 8 * a2))();
}

uint64_t sub_1089C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  __asm { BTI             j }
  a8[23] = a43;
  uint64_t v68 = a8[12];
  a8[8] = (char *)&STACK[0x260] + v68 + a4;
  v72 = (char *)&STACK[0x260] + v68 + 0x2DABEB540C1AC434;
  a8[12] = (v62 - 536) + v68 - 126;
  HIDWORD(a51) = v63;
  if (a58) {
    _ZF = a43 == 0;
  }
  else {
    _ZF = 1;
  }
  int v70 = _ZF;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v64 + 8 * ((v70 * (((v62 - 694) | 0xB) ^ 0x1B3)) ^ v62)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           v72,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a58,
           a58,
           a59,
           a60,
           a61,
           a62);
}

uint64_t sub_10930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *uint64x2_t v9 = 0;
  v9[1] = 0;
  *(void *)(a8 + 128) = v9 + 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8 * (v8 ^ 0x1C2)))(a1, a2, a3, 0x2DABEB540C1AC424);
}

uint64_t sub_109A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6 + 8 * (((v7 == a6 + 79 * (a5 ^ 0x156) - 158) * ((a5 - 340) ^ 0xB)) ^ (a5 - 51))))();
}

uint64_t sub_109EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 8 * (((v3 + 1199) ^ 0x566) + v3)))(a1, a2, a3, 0x2DABEB540C1AC424);
}

uint64_t sub_10A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 8 * (int)(((v57 != (((a5 - 206) | 0x18) ^ (a6 - 110))) * (((a5 - 318) | 0x40) ^ 0x1B6)) ^ (a5 + 410))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56);
}

uint64_t sub_10A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,int a51,int a52,uint64_t a53,uint64_t a54,int a55,int a56)
{
  __asm { BTI             j }
  uint64_t v62 = (a56 + a52 - 274566493);
  **(_DWORD **)(a8 + 128) = v62;
  BOOL v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8 * (int)(v56 + 1227)))(((v62 + (v56 ^ 0x51)) & (((v56 + 1495118119) & 0xA6E24EFA) + 0x1FFFFFF80)) + 16, 8) == 0;
  return (*(uint64_t (**)(void))(v57 + 8 * (int)((46 * v63) ^ v56)))();
}

uint64_t sub_10B30(void *a1)
{
  __asm { BTI             j }
  *a1 = 0;
  a1[1] = v1;
  return (*(uint64_t (**)(void))(v2 + 8 * v3))();
}

uint64_t sub_10B60()
{
  __asm { BTI             j }
  *(void *)STACK[0x248] = v0;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((1831
                                * ((*v1 ^ ((v2 ^ 0x216u)
                                                       - 0x111202008119950BLL
                                                       + ((v2 - 1151344588) & 0x44A01FAF)))
                                 + 0x11120200BDC14C92
                                 + ((2 * *v1) & 0xFDCCDEDE) == 1017625601)) ^ v2)))();
}

uint64_t sub_10C10(unint64_t a1, unint64_t a2, int a3)
{
  __asm { BTI             j }
  BOOL v12 = v6 < a1;
  *(unsigned char *)(v3 + v4) = 0;
  unint64_t v13 = v4 + 1;
  if (v12 == v13 > a2) {
    BOOL v12 = v13 + a1 < v6;
  }
  return (*(uint64_t (**)(void))(v7 + 8 * ((v12 * ((v5 - 466) ^ a3)) ^ v5)))();
}

uint64_t sub_10C60()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 - 270)))();
}

uint64_t sub_10C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __n128 a5, __n128 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  __asm { BTI             j }
  v46.n128_u64[0] = 0x9191919191919191;
  v46.n128_u64[1] = 0x9191919191919191;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128))(v41 + 8 * ((((79 * (v40 ^ 0x156)) ^ 0x14F) * (v39 == 0)) ^ (v40 - 100))))(a1, a2, a3, a4, a36, 2028803494, a39, a5, a6, v46);
}

uint64_t sub_10CD4()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((((v0 ^ 0x366) + 566692281) & 0xDE38F5BE ^ 0x10C) * (v2 > *v1)) ^ v0 ^ 0x366)))();
}

uint64_t sub_10D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,int a51,unsigned int a52)
{
  __asm { BTI             j }
  *uint64_t v52 = 49;
  unint64_t v60 = a52 + 0x66594D2933682BFCLL + ((unint64_t)(a52 < v54) << 32);
  LODWORD(v6(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = ((v60 & ((5 * (v53 ^ 0x1EEu)) ^ 0x6BC3A47F2)) << (5 * (v53 ^ 0xD1u) - 102)) & (v60 ^ 0xBB3A0496) ^ v60 & ((5 * (v53 ^ 0x1EE)) ^ 0xBC3A47F2);
  unsigned int v61 = ((2 * ((a52 + 862465020) ^ 0xA36E819E)) ^ 0x3EA98E70) & ((a52 + 862465020) ^ 0xA36E819E) ^ (2
                                                                                                  * ((a52 + 862465020) ^ 0xA36E819E)) & 0x1F54C738;
  LODWORD(v6(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v61 ^ 0x10044630) & (4 * v60) ^ v60;
  int v62 = ((4 * (v61 ^ 0x1544108)) ^ 0x7D531CE0) & (v61 ^ 0x1544108) ^ (4 * (v61 ^ 0x1544108)) & 0x1F54C738;
  LODWORD(v6(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v62 ^ 0x1D500430) & (16 * v60) ^ v60;
  unsigned int v63 = ((16 * (v62 ^ 0x204C318)) ^ 0xF54C7380) & (v62 ^ 0x204C318) ^ (16 * (v62 ^ 0x204C318)) & 0x1F54C730;
  return (*(uint64_t (**)(void))(v55
                              + 8
                              * ((91
                                * (((a52 + 862465020) ^ (2
                                                       * ((((v63 ^ 0xA108438) << 8) & 0x1F540000 ^ 0x14440000 ^ (((v63 ^ 0xA108438) << 8) ^ 0x54C70000) & (v63 ^ 0xA108438)) & (((v63 ^ 0x15444300) & (v60 << 8) ^ v60) << 16) ^ (v63 ^ 0x15444300) & (v60 << 8) ^ v60)) ^ 0xBC3A46A6) != 0)) ^ v53)))();
}

uint64_t sub_10ED8()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (((2 * (v0 < (v1 ^ 0x333u) - 332)) | (8 * (v0 < (v1 ^ 0x333u) - 332))) ^ v1)))();
}

uint64_t sub_10F30@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((((v3 - 64) | 0x40) - 321)
                                * (0xD25414ABF3E53BDCLL - a1 - v1 + (v1 - 1) + v2 > 0x1F)) ^ (v3 + 187))))();
}

uint64_t sub_10F88()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (((v0 >= ((v1 + 312) ^ v1 ^ 0x3F8u)) * v2) ^ (v1 + 125))))();
}

uint64_t sub_10FC0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 + 697)))(292, 1931);
}

uint64_t sub_10FE4@<X0>(unsigned int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>, int8x16_t a4@<Q2>)
{
  __asm { BTI             j }
  uint64_t v14 = v4 + (v5 - v6 - 1);
  uint64_t v15 = a3 + v5 - v6;
  int8x16_t v16 = vaddq_s8(*(int8x16_t *)(v14 - 31), a4);
  *(int8x16_t *)(v15 - 15) = vaddq_s8(*(int8x16_t *)(v14 - 15), a4);
  *(int8x16_t *)(v15 - 31) = v16;
  return (*(uint64_t (**)(void))(v9 + 8 * (((v6 + ((v8 - 322) | a1) - 278 != v7) * a2) ^ (v8 + 562))))();
}

uint64_t sub_11040()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((((v2 + 166) ^ (v2 + 155)) * (v1 == v0)) ^ v2)))();
}

uint64_t sub_11070()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v0 & 0x18) == (v1 - 125) - 340) * (v1 + 518)) ^ v1)))();
}

uint64_t sub_110A8()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * v1))(v2 - (v0 & 0xFFFFFFF8) + 8, v0 - v2);
}

uint64_t sub_110D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  *(int8x8_t *)(v6 + a2) = vadd_s8(*(int8x8_t *)(v5 + a2 + ((v4 - 31) ^ (a4 + 395))), v8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8 * ((508 * (a1 == 0)) ^ v4)))(a1 + 8, a2 - 8);
}

uint64_t sub_11120()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((((((v1 - 605) | 0x144) ^ 0x1C1) + ((v1 - 621) | 0x154)) * (v2 == v0)) ^ v1)))();
}

uint64_t sub_11164()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 3)))();
}

uint64_t sub_1117C@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  *(unsigned char *)(a1 + v3) = *(unsigned char *)(v1 + (v3 - 1)) - 111;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v3 == 1) * v4) ^ v2)))();
}

uint64_t sub_111B0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 86)))();
}

uint64_t sub_111C8()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (((v0 == v3) * ((v1 ^ 0x1CA) + 1123)) ^ (v1 - 51))))();
}

uint64_t sub_11200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,int a61,int a62)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v65
                              + 8
                              * (int)((((((a62 + v64) <= *v63) ^ 0x6B)
                                      + 2 * ((a62 + v64) <= *v63) == 107)
                                     * (((v62 + 532) ^ 0xFFFFFD1A) + ((v62 + 1046) ^ 0x42A))) ^ (v62 + 1046))))();
}

uint64_t sub_11264(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  *(unsigned char *)(**(void **)(a8 + 184) + v73) = 48;
  unint64_t v79 = a71 + 0x65CBB047A6A7F7C3 + ((unint64_t)(a71 < v72) << 32);
  uint64_t v80 = v79 ^ 0x3AE90A9155DC171ALL;
  LODWORD(v79) = (v79 ^ (v71 + 1157132268)) & (2 * (v79 & 0x48FA7ADF)) ^ v79 & 0x48FA7ADF;
  LODWORD(v8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = ((v80 << ((v71 - 94) ^ 0x55u)) ^ 0x3A4CDB8A) & v80 ^ (v80 << ((v71 - 94) ^ 0x55u)) & 0x1D266DC4;
  LODWORD(v79) = (v80 ^ 0x4980) & (4 * v79) ^ v79;
  LODWORD(v8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = ((4 * (v80 ^ 0x5222445)) ^ 0x7499B714) & (v80 ^ 0x5222445) ^ (4 * (v80 ^ 0x5222445)) & 0x1D266DC4;
  LODWORD(v79) = (v80 ^ 0x14002500) & (16 * v79) ^ v79;
  LODWORD(v8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = ((16 * (v80 ^ 0x92648C1)) ^ 0xD266DC50) & (v80 ^ 0x92648C1) ^ (16 * (v80 ^ 0x92648C1)) & 0x1D266DC0;
  return (*(uint64_t (**)(void))(v74
                              + 8
                              * ((428
                                * (((a71 - 1498941501) ^ (2
                                                        * ((((v80 ^ 0xD002185) << 8) & 0x1D260000 ^ 0x4240000 ^ (((v80 ^ 0xD002185) << 8) ^ 0x266D0000) & (v80 ^ 0xD002185)) & (((v80 ^ 0x10264C00) & (v79 << 8) ^ v79) << 16) ^ (v80 ^ 0x10264C00) & (v79 << 8) ^ v79)) ^ 0x48FA7ADF) != 0)) ^ v71)))();
}

uint64_t sub_113FC()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, void))(v2 + 8 * ((v0 + 262) ^ (90 * (v1 < 8)))))(v1, ((v0 + 262) ^ 0x144u) - 424);
}

uint64_t sub_11488(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(v8
                                            + 8
                                            * ((511
                                              * (a3
                                               - ((a4 << 32)
                                                + v7)
                                               - v4
                                               + 1086716037
                                               + ((v6 + 333299971) & 0xEC223D54 ^ 0xD25414ABF3E53A88) > 0x1F)) ^ v6)))(v5);
}

uint64_t sub_11500()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (((v0 > 0x1F) | (16 * (v0 > 0x1F))) ^ (v1 - 179))))();
}

uint64_t sub_11534(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (a1 - 352)))();
}

uint64_t sub_11564(double a1, double a2, int8x16_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __asm { BTI             j }
  unint64_t v20 = ((9 * (v12 ^ v13)) ^ (unint64_t)(a9 + 611)) & a5;
  int8x16_t v21 = *(int8x16_t *)(v10 + v20 - 15);
  int8x16_t v22 = *(int8x16_t *)(v10 + v20 - 31);
  uint64_t v23 = v9 + v20 + v11;
  *(int8x16_t *)(v23 - 15) = vaddq_s8(v21, a3);
  *(int8x16_t *)(v23 - 31) = vaddq_s8(v22, a3);
  return (*(uint64_t (**)(void))(v15 + 8 * (((a6 != 0) * v14) ^ (v12 - 128))))();
}

uint64_t sub_115C8(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((v2 == v1) ^ (a1 - 64)) & 1) * (((a1 - 397) | 0x241) - 486)) ^ a1)))();
}

uint64_t sub_11610(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4
                                           + 8
                                           * (((((((a3 - 432) ^ 0x1CD) - 316) & v3) == 0)
                                             * (((a3 - 432) | 0x222) - 652)) ^ a3)))(v3 & 0x1F);
}

uint64_t sub_11650()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, uint64_t))(v3 + 8 * v2))(v1 & 7, v0 - 7);
}

uint64_t sub_1168C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BTI             j }
  unint64_t v17 = (v9 ^ (2 * v7) ^ (unint64_t)(v8 + 252)) & a5;
  *(int8x8_t *)(a4 + v17 + v6) = vadd_s8(*(int8x8_t *)(a2 + v17), v12);
  return (*(uint64_t (**)(void))(v11 + 8 * (((a6 == 0) * v10) ^ v7)))();
}

uint64_t sub_116D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 - 424 + 68 * (v4 ^ 0x2F9) - 321) * (a3 == v3)) ^ v4)))();
}

uint64_t sub_1171C(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (a2 + 80)))();
}

uint64_t sub_11734(int a1)
{
  __asm { BTI             j }
  unsigned int v11 = a1 - 1;
  *(unsigned char *)(v1 + v11 + v3) = *(unsigned char *)(v2 + v11) - 111;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v11 != 0) * v6) ^ (v4 + 51))))();
}

uint64_t sub_1176C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 8 * (v34 - 222)))(a1, a2, a3, a4, a34);
}

uint64_t sub_11788()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((v4 + (v2 ^ 0x2F4) + v1 - 549133914 == v0)
                                     * (((v2 + 668644426) & 0xD8254AFF) - 86)) ^ (v2 - 51))))();
}

uint64_t sub_117E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  __asm { BTI             j }
  BOOL v65 = (*(_DWORD *)(a57 + 36) + v57 - 274566494) <= *v59;
  return (*(uint64_t (**)(void))(v60
                              + 8
                              * ((((v65 ^ 0x77) + 2 * v65 == (v58 ^ 0xD7)) * ((v58 - 893) ^ 0x3A)) | v58)))();
}

uint64_t sub_11860(uint64_t a1, int a2, int a3)
{
  __asm { BTI             j }
  int v8 = a3 + 372724077;
  unsigned int v9 = ((a3 + 372724077) ^ (((a2 + 989) | 0x29) - 731739892)) & (2 * ((a3 + 372724077) & 0xD96B2135)) ^ (a3 + 372724077) & 0xD96B2135;
  unsigned int v10 = ((2 * ((a3 + 372724077) ^ 0x4672CD1D)) ^ 0x3E33D850) & ((a3 + 372724077) ^ 0x4672CD1D) ^ (2
                                                                                                * ((a3 + 372724077) ^ 0x4672CD1D)) & 0x9F19EC28;
  unsigned int v11 = v10 ^ 0x81082428;
  int v12 = (v10 ^ 0xE118800) & (4 * v9) ^ v9;
  unsigned int v13 = ((4 * v11) ^ 0x7C67B0A0) & v11 ^ (4 * v11) & 0x9F19EC28;
  int v14 = (v13 ^ 0x1C01A020) & (16 * v12) ^ v12;
  unsigned int v15 = ((16 * (v13 ^ 0x83184C08)) ^ 0xF19EC280) & (v13 ^ 0x83184C08) ^ (16 * (v13 ^ 0x83184C08)) & 0x9F19EC00;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((113
                                * ((v8 ^ (2
                                        * ((((v15 ^ 0xE012C28) << 8) & 0x9F19EC00 ^ 0x19080000 ^ (((v15 ^ 0xE012C28) << 8) ^ 0x19EC0000) & (v15 ^ 0xE012C28)) & (((v15 ^ 0x9118C000) & (v14 << 8) ^ v14) << 16) ^ (v15 ^ 0x9118C000) & (v14 << 8) ^ v14)) ^ 0xD96B2135) == 0)) ^ a2)))();
}

uint64_t sub_119D0(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((a2 + 509) | 0x101 | ((v2 > 7) << 6))))();
}

uint64_t sub_11A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, uint64_t))(v9
                                                    + 8
                                                    * ((124
                                                      * (0xE35FED8F69F77E7DLL - a5 + v5 - v6 - a3 + 20 >= ((5 * (v7 ^ 0x171)) ^ 0x3E5uLL))) ^ v7)))(v7 ^ 0xE4, v8);
}

uint64_t sub_11AD4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 < (a4 ^ 0x1BCu) - 601) * (170 * (a4 ^ 0x3C7) - 302)) ^ a4)))();
}

uint64_t sub_11B18(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, void))(v5 + 8 * a3))(v3 - 7, v4 & 7);
}

uint64_t sub_11B54(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __asm { BTI             j }
  uint64_t v20 = (v8 ^ v14 ^ (a3 + v11) & v13) + v9;
  *(int8x8_t *)(a6 + v20 + v7) = vadd_s8(*(int8x8_t *)(a1 + v20), v15);
  return (*(uint64_t (**)(void))(v12 + 8 * (((a7 == v8) * v10) ^ a3)))();
}

uint64_t sub_11B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6 + 8 * (((((a5 ^ 0xE4) - 258) ^ 0x2A9) * (a4 == v5)) ^ a5)))();
}

uint64_t sub_11BE8(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (a1 - 124)))();
}

uint64_t sub_11C14(int a1, int a2, uint64_t a3, double a4, double a5, int8x16_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v20 = (a8 ^ v13 ^ a1 ^ v12) + v11;
  int8x16_t v21 = *(int8x16_t *)(v8 + v20 - 15);
  int8x16_t v22 = *(int8x16_t *)(v8 + v20 - 31);
  uint64_t v23 = v9 + v10 + v20;
  *(int8x16_t *)(v23 - 15) = vaddq_s8(v21, a6);
  *(int8x16_t *)(v23 - 31) = vaddq_s8(v22, a6);
  return (*(uint64_t (**)(void))(v14 + 8 * (((a3 == a8) * v15) ^ a2)))();
}

uint64_t sub_11C6C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6 + 8 * (((((2 * a4) ^ 0x8A6) + 293 * (a4 ^ 0x479) - 718) * (v4 == v5)) ^ a4)))();
}

uint64_t sub_11CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, void))(v6 + 8 * ((249 * ((v5 & 0x18) != 0)) ^ a5)))(17 * (((a5 - 367) | 0x79) ^ 0x26Du), v5 & 0x1F);
}

uint64_t sub_11CFC(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (a1 + 481)))();
}

uint64_t sub_11D10(int a1, int a2)
{
  __asm { BTI             j }
  unsigned int v13 = (a1 ^ v5 ^ v7) + a2;
  *(unsigned char *)(v3 + v13 + v4) = *(unsigned char *)(v2 + v13) - 111;
  return (*(uint64_t (**)(void))(v8 + 8 * (((v13 != 0) * v6) ^ (a1 + 472))))();
}

uint64_t sub_11D50(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * a3))(71 * (a3 ^ 0x5Du));
}

uint64_t sub_11D80(int a1)
{
  __asm { BTI             j }
  BOOL v9 = *(_DWORD *)(v1 + 16) + v3 - 274566494 <= v2;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((((v9 ^ ((a1 ^ 0x71) + 95)) + 2 * v9) == 183) * ((a1 - 907) ^ 0x80)) ^ a1)))();
}

uint64_t sub_11DE8(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  __asm { BTI             j }
  uint64_t v10 = a4 + 0x6309D7D1B378DDC4 + ((a2 - 928937563) & 0x375E77C3);
  unint64_t v11 = (v10 + ((unint64_t)(a4 < v4) << 32)) ^ 0x3B78851AAD3D9B51;
  int v12 = (v10 ^ 0xBD2D9B59) & (2 * (v10 & 0x3C29901D)) ^ v10 & 0x3C29901D;
  LODWORD(v11) = ((v11 << (((a2 - 4) | 0x81) ^ 0xD4u)) ^ 0x22281698) & v11 ^ (v11 << (((a2 - 4) | 0x81) ^ 0xD4u)) & 0x91140B4C;
  int v13 = (v11 ^ 8) & (4 * v12) ^ v12;
  LODWORD(v11) = ((4 * (v11 ^ 0x91140944)) ^ 0x44502D30) & (v11 ^ 0x91140944) ^ (4 * (v11 ^ 0x91140944)) & 0x91140B4C;
  int v14 = (v11 ^ 0x100900) & (16 * v13) ^ v13;
  LODWORD(v11) = ((16 * (v11 ^ 0x9104024C)) ^ 0x1140B4C0) & (v11 ^ 0x9104024C) ^ (16 * (v11 ^ 0x9104024C)) & 0x91140B40;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((45
                                * (((a4 - 1283924540 + ((a2 - 928937563) & 0x375E77C3)) ^ (2
                                                                                                 * ((((v11 ^ 0x80140B0C) << 8) & 0x11140000 ^ (((v11 ^ 0x80140B0C) << 8) ^ 0x140B0000) & (v11 ^ 0x80140B0C) ^ 0x10000000) & (((v11 ^ 0x11000000) & (v14 << 8) ^ v14) << 16) ^ (v11 ^ 0x11000000) & (v14 << 8) ^ v14)) ^ 0x3C29901D) != 0)) ^ a2)))();
}

uint64_t sub_11F88(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8 * ((477 * (v3 < ((148 * (a3 ^ 0xD3)) ^ 0x370u))) ^ a3)))(a3 ^ 0x181u);
}

uint64_t sub_1202C(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v7
                                           + 8
                                           * (a2 ^ (235
                                                  * ((unint64_t)(v4 + 0x7D35FF751B7EBFFALL - a4 - v6 - v5) < 0x20)))))((2 * a2) ^ 0x7A4u);
}

uint64_t sub_1207C(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((59 * (v1 < (((a1 - 338) | 0xC) ^ 0x15Au) - 308)) ^ ((a1 - 338) | 0xC))))();
}

uint64_t sub_120BC(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * a2))(v2 - 7);
}

uint64_t sub_120F0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  __asm { BTI             j }
  *(int8x8_t *)(a4 + a5 + v6) = vadd_s8(*(int8x8_t *)(a1 + a5), v9);
  return (*(uint64_t (**)(void))(v7 + 8 * (((a6 == 0) * ((a2 ^ v8) + 1010)) ^ a2)))();
}

uint64_t sub_12134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5 + 8 * ((((55 * (((v4 - 260) | 0x150) ^ 0x15C)) ^ 0x233) * (a3 == v3)) ^ v4)))();
}

uint64_t sub_12184()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 - 281)))();
}

uint64_t sub_121A8(int a1, uint64_t a2, double a3, double a4, int8x16_t a5, uint64_t a6, uint64_t a7)
{
  __asm { BTI             j }
  uint64_t v18 = (a7 ^ ((v11 - 340) | 0x60) ^ 0xFFFFFF9F) + v10;
  int8x16_t v19 = *(int8x16_t *)(v7 + v18 - 15);
  int8x16_t v20 = *(int8x16_t *)(v7 + v18 - 31);
  uint64_t v21 = v8 + v9 + v18;
  *(int8x16_t *)(v21 - 15) = vaddq_s8(v19, a5);
  *(int8x16_t *)(v21 - 31) = vaddq_s8(v20, a5);
  return (*(uint64_t (**)(void))(v12 + 8 * (((a2 == a7) * v13) ^ a1)))();
}

uint64_t sub_12204(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5 + 8 * (((((a3 ^ 0x76) + 31) ^ 0x18B ^ (20 * (a3 ^ 0x76))) * (v4 != v3)) | a3)))();
}

uint64_t sub_12244(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((1098 * (((((a4 - 49) | 0x150) ^ (a4 + 241987006) & 0xF19392EF ^ 0x1AF) & v4) == 0)) | a4)))();
}

uint64_t sub_1229C(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (a1 + 219)))();
}

uint64_t sub_122B0(int a1)
{
  __asm { BTI             j }
  uint64_t v15 = (a1 + v7) & v8;
  uint64_t v16 = v5 - 1;
  *(unsigned char *)(v2 + ((v6 + v15 + 576) & v16) + v3) = *(unsigned char *)(v1 + ((v6 + v15 + 576) & v16)) - 111;
  return (*(uint64_t (**)(void))(v9 + 8 * (((((v6 + v15 + 576) & v16) == 0) * v10) ^ v4)))();
}

uint64_t sub_122F4(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * a2))();
}

uint64_t sub_12328()
{
  __asm { BTI             j }
  BOOL v9 = ((((v3 - 1203) | 0x90) + 180) ^ 0xEFA273F0) + v2 + *(_DWORD *)(v0 + 56) <= v1;
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v9 | (2 * v9)) == 0) | (8 * ((v9 | (2 * v9)) == 0))) ^ v3)))();
}

uint64_t sub_1238C(uint64_t a1, int a2, uint64_t a3)
{
  __asm { BTI             j }
  int v9 = a3 - 202587789;
  unint64_t v10 = a3 + 0x634008EDF3ECC173 + ((unint64_t)(a3 < v3) << 32);
  unint64_t v11 = v10 ^ 0x8C65D1385663E4E4;
  LODWORD(v1(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v10 ^ 0xF321A4AE) & (2 * ((((a2 + 183) | 0x1C2) - 71979676) & v10)) ^ (((a2 + 183) | 0x1C2) - 71979676) & v10;
  LODWORD(v11) = ((v11 << ((a2 - 68) ^ 0xFu)) ^ 0x5BACAB96) & v11 ^ (v11 << ((a2 - 68) ^ 0xFu)) & 0xADD655CA;
  LODWORD(v1(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v11 ^ 0x9841181) & (4 * v10) ^ v10;
  LODWORD(v11) = ((4 * (v11 ^ 0xA4525449)) ^ 0xB759572C) & (v11 ^ 0xA4525449) ^ (4 * (v11 ^ 0xA4525449)) & 0xADD655C8;
  LODWORD(v1(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v11 ^ 0xA5505500) & (16 * v10) ^ v10;
  LODWORD(v11) = ((16 * (v11 ^ 0x88600C3)) ^ 0xDD655CB0) & (v11 ^ 0x88600C3) ^ (16 * (v11 ^ 0x88600C3)) & 0xADD655C0;
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((217
                                * ((v9 ^ (2
                                        * ((((v11 ^ 0x2092014B) << 8) & 0xADD65500 ^ 0x4540000 ^ (((v11 ^ 0x2092014B) << 8) ^ 0xD6550000) & (v11 ^ 0x2092014B)) & (((v11 ^ 0x8D445400) & (v10 << 8) ^ v10) << 16) ^ (v11 ^ 0x8D445400) & (v10 << 8) ^ v10)) ^ 0xFBB5B12F) != 0)) ^ a2)))();
}

uint64_t sub_12534(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (a1 ^ (42 * (v1 < 8)))))();
}

uint64_t sub_125CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, void))(v8
                                                    + 8
                                                    * ((43
                                                      * (v6
                                                       - 0x4004380A046AA301
                                                       - a5
                                                       - v5
                                                       - a4
                                                       + (((v7 - 980) | 0x4A0u) ^ 0x4CAuLL) < 0x20)) ^ v7)))(a1, (v7 - 706));
}

uint64_t sub_12630(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8
                                   * ((((85 * (a3 ^ 0x4E6) - 1966881269) & 0x753C3AF0 ^ 0x3B9) * (v3 > 0x1F)) ^ a3)))();
}

uint64_t sub_12684()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (v1 + 97)))((v0 & 0xFFFFFFE0) - 32);
}

uint64_t sub_126AC(uint64_t a1, double a2, double a3, int8x16_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BTI             j }
  uint64_t v18 = (a6 ^ (v10 + 104) ^ v11) + v9;
  int8x16_t v19 = *(int8x16_t *)(v7 + v18 - 15);
  int8x16_t v20 = *(int8x16_t *)(v7 + v18 - 31);
  uint64_t v21 = v6 + v8 + v18;
  *(int8x16_t *)(v21 - 15) = vaddq_s8(v19, a4);
  *(int8x16_t *)(v21 - 31) = vaddq_s8(v20, a4);
  return (*(uint64_t (**)(void))(v12 + 8 * (((a1 != a6) * v13) ^ (v10 + 90))))();
}

uint64_t sub_12708(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8 * (((((v3 == v2) ^ (a2 - 9)) & 1) * ((a2 - 78) ^ 0x119)) ^ a2)))();
}

uint64_t sub_12740(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8 * ((87 * ((v3 & 0x18) != (((a3 ^ 0x2E3u) - 252) ^ 0x154))) ^ a3)))();
}

uint64_t sub_12780(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(v7 + 8 * a1))((((8 * a1) ^ 0x10C8 ^ (a6 + 425)) & v6) - 8);
}

uint64_t sub_127BC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BTI             j }
  uint64_t v17 = (v8 ^ v11 ^ ((a2 - 584) | v9)) + v7;
  *(int8x8_t *)(a6 + v17 + v6) = vadd_s8(*(int8x8_t *)(a4 + v17), v12);
  return (*(uint64_t (**)(void))(v10 + 8 * (((8 * (a1 != v8)) | (16 * (a1 != v8))) ^ a2)))();
}

uint64_t sub_12808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v7 + 8 * (((((a5 + 145) | v6) + 259) * (a3 == v5)) ^ a5)))();
}

uint64_t sub_1283C(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (a2 + 143)))();
}

uint64_t sub_12850(uint64_t a1, char a2)
{
  __asm { BTI             j }
  unsigned int v14 = v6 - 1;
  *(unsigned char *)(v2 + v14 + v4) = (a2 ^ v7) + *(unsigned char *)(v3 + v14) + 35;
  return (*(uint64_t (**)(void))(v9 + 8 * (((v14 == 0) * v8) ^ v5)))();
}

uint64_t sub_1288C(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_128B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 8 * v34))(a1, a2, a3, a4, a34);
}

uint64_t sub_128D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  BOOL v15 = v10 == ((20 * (v8 ^ 0x96)) ^ (a6 - 160)) || *(void *)(a8 + 184) == 0;
  return (*(uint64_t (**)(void))(v9 + 8 * ((v15 * ((v8 ^ 0x20D) - 563)) | v8)))();
}

uint64_t sub_12924@<X0>(void *a1@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((47 * ((((v1 - 659) ^ (*a1 == 0)) & 1) == 0)) ^ v1)))();
}

uint64_t sub_12964@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 ^ 0x79E)))(a1 - 16, ((v1 - 499) ^ 0xFFFFFF5FLL) & *(void *)(a1 - 8));
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * v1))(v7);
}

uint64_t sub_129B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(void *)(a8 + 96) -= 32;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10
                                                                       + 8
                                                                       * (int)(((((v8 + 1249859919) & 0xB580A675) + 161)
                                                                              * (v11 == v9)) | v8)))(a1, a2, a3, 0x2DABEB540C1AC424);
}

uint64_t sub_12A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,_DWORD *a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,_DWORD *a55)
{
  __asm { BTI             j }
  *(void *)(a8 + 456) = *a43;
  *a50 = *a55;
  return (*(uint64_t (**)(void))(v56 + 8 * v55))();
}

uint64_t sub_12A50@<X0>(int a1@<W5>, int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8 * (((v3 == ((8 * (a2 ^ 0x61)) ^ (a1 - 32))) * (((a2 ^ 0x61) + 1012) ^ 0x178)) | a2)))();
}

uint64_t sub_12A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  __asm { BTI             j }
  uint64_t v62 = a8[12];
  a8[12] = v62 - 80;
  HIDWORD(a42) = v56;
  *a8 = a35;
  a8[1] = a39;
  a8[24] = a38;
  a8[25] = v62 + a41 + ((v55 - 1919211809) & 0x7264DDAF) - 1295;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v57 + 8 * (v55 ^ 0x1E9)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a40,
           a45,
           a46,
           a47,
           *(void *)(v57 + 8 * v55),
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55);
}

uint64_t sub_12B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6 + 8 * ((476 * (v7 == ((a5 + 913) ^ (a6 - 1123)))) ^ (a5 + 903))))();
}

uint64_t sub_12B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,int a42,int a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  uint64_t v71 = (a43 - 274566493 + a65);
  LODWORD(STACK[0x230]) = v71;
  LODWORD(STACK[0x234]) = a43 - 274566493;
  BOOL v72 = (*(uint64_t (**)(unint64_t, uint64_t))(v65 + 8 * (v66 + 60)))((((v66 - 1120)+ (v71 ^ 0xDFBEF962A7FFFB7ALL)+ (((v66 - 289) ^ 0x14FFFF532) & (2 * v71))+ 0x2041069D58000407) & 0xFFFFFFFFFFFFFFF8)+ 16, 8) == 0;
  return (*(uint64_t (**)(void))(v65 + 8 * ((13 * v72) ^ v66)))();
}

uint64_t sub_12C24(void *a1)
{
  __asm { BTI             j }
  *a1 = 0;
  a1[1] = v1;
  return (*(uint64_t (**)(void))(v2 + 8 * v3))();
}

uint64_t sub_12C40(uint64_t a1, uint64_t a2, uint64_t a3, __n128 a4, __n128 a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  __asm { BTI             j }
  STACK[0x228] = v43;
  v48.n128_u64[0] = 0x9191919191919191;
  v48.n128_u64[1] = 0x9191919191919191;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128))(v41 + 8 * ((((v39 + 219) ^ (v39 + 234)) * (v40 <= v42)) ^ v39)))(a1, a2, a3, 2028776491, 274566494, 2028803494, a39, a4, a5, v48);
}

uint64_t sub_12CA0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,int a36)
{
  __asm { BTI             j }
  unsigned char *v37 = 48;
  unsigned int v42 = (((a1 ^ 0x16B) + 336) ^ (a36 - 634714872) ^ 0x84666C44) & (2 * ((a36 - 634714872) & 0x15776D9A)) ^ (a36 - 634714872) & 0x15776D9A;
  unsigned int v43 = ((319 * (a1 ^ 0x16B)) ^ (2 * ((a36 - 634714872) ^ 0x8E24BC14)) ^ 0x36A7A7E0) & ((a36 - 634714872) ^ 0x8E24BC14) ^ (2 * ((a36 - 634714872) ^ 0x8E24BC14)) & 0x9B53D18E;
  unsigned int v44 = v43 ^ 0x89505082;
  int v45 = (v43 ^ 0x12038008) & (4 * v42) ^ v42;
  unsigned int v46 = ((4 * v44) ^ 0x6D4F4638) & v44 ^ (4 * v44) & 0x9B53D18C;
  int v47 = (v46 ^ 0x9434000) & (16 * v45) ^ v45;
  unsigned int v48 = ((16 * (v46 ^ 0x92109186)) ^ 0xB53D18E0) & (v46 ^ 0x92109186) ^ (16 * (v46 ^ 0x92109186)) & 0x9B53D180;
  return (*(uint64_t (**)(void))(v36
                              + 8
                              * ((237
                                * (((a36 - 634714872) ^ (2
                                                       * ((((v48 ^ 0xA42C10E) << 8) & 0x9B53D100 ^ 0x13510000 ^ (((v48 ^ 0xA42C10E) << 8) ^ 0x53D10000) & (v48 ^ 0xA42C10E)) & (((v48 ^ 0x91111000) & (v47 << 8) ^ v47) << 16) ^ (v48 ^ 0x91111000) & (v47 << 8) ^ v47)) ^ 0x15776D9A) != 0)) ^ a1)))();
}

uint64_t sub_12E34(uint64_t a1, uint64_t a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4
                                                              + 8
                                                              * ((((v3 - 213) ^ 0x573 ^ ((v3 - 213) | 0x40) ^ 0x4CF)
                                                                * (v2 < 8)) ^ v3)))(a1, a2, 4294966279);
}

uint64_t sub_12E94@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  BOOL v9 = a1 - v2 + (unint64_t)(v2 - 1) + v1 < ((v3 - 855) ^ 0x19E ^ ((v3 - 855) | 0x44u) ^ 0x1FAuLL);
  return (*(uint64_t (**)(void))(v4 + 8 * ((v9 | (8 * v9)) ^ v3)))();
}

uint64_t sub_12EE8()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8 * (((((v0 < 0x20) ^ (v1 - 1)) & 1) * ((v1 + 198) ^ 0x16B)) ^ v1)))();
}

uint64_t sub_12F28()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 89)))();
}

uint64_t sub_12F4C(double a1, double a2, int8x16_t a3, uint64_t a4, unint64_t a5)
{
  __asm { BTI             j }
  uint64_t v19 = v5 + (v6 - v9 - 1);
  uint64_t v20 = v14 + v6 - v9;
  int8x16_t v21 = vaddq_s8(*(int8x16_t *)(v19 - 31), a3);
  *(int8x16_t *)(v20 - 15) = vaddq_s8(*(int8x16_t *)(v19 - 15), a3);
  *(int8x16_t *)(v20 - 31) = v21;
  return (*(uint64_t (**)(void))(v13 + 8 * ((((v8 ^ v11 ^ a5) + v9 == v7) * v12) ^ v10)))();
}

uint64_t sub_12FA0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (int)((((((v2 + 1672012373) & 0x9C571DDF) - 198) ^ 0xAF) * (v1 != v0)) ^ v2)))();
}

uint64_t sub_12FE4()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (v1 ^ (679 * ((v0 & 0x18) == 0)))))();
}

uint64_t sub_13030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(v6 + 8 * v5))(a3 + v3 - v4 + 782);
}

uint64_t sub_13080(uint64_t a1)
{
  __asm { BTI             j }
  int8x8_t *v1 = vadd_s8(*(int8x8_t *)(v3 + a1 + ((v2 + v5) & v6)), v9);
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * (((v4 == 0) * v7) | v2)))(a1 - 8);
}

uint64_t sub_130C0(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8 * (int)(((((a2 + 539784938) & 0xDFD3897F) + 164) * (v3 == v2)) ^ a2)))();
}

uint64_t sub_13100()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 471)))();
}

uint64_t sub_13118()
{
  __asm { BTI             j }
  *(unsigned char *)(v5 + v2) = *(unsigned char *)(v0 + (v2 - 1)) - 111;
  return (*(uint64_t (**)(void))(v4 + 8 * (((v2 == 1) * v3) ^ v1)))();
}

uint64_t sub_1314C()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 27)))();
}

uint64_t sub_13164()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (((v1 == v2) * ((v0 + 361) ^ 0xDB)) ^ (v0 - 123))))();
}

uint64_t sub_1319C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD **a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,unsigned int a21)
{
  __asm { BTI             j }
  BOOL v29 = ((17 * (v21 ^ 0x2A9)) ^ a21) + v22 + **a8 > v24;
  return (*(uint64_t (**)(void))(v23 + 8 * ((v29 | (2 * v29)) ^ v21)))();
}

uint64_t sub_131E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  __asm { BTI             j }
  uint64_t v11 = a1 < a5;
  uint64_t v12 = a1 + 0x68A944EAF6E7A4DELL;
  uint64_t v13 = v12 + (v11 << 32);
  unint64_t v14 = v13 ^ 0xCE545BB395FAC6F8;
  LODWORD(v13) = (((v5 ^ 0x6B6) - 189085211) ^ v13) & (2 * (v13 & 0xF8BACDC4)) ^ v13 & 0xF8BACDC4;
  LODWORD(v14) = ((v14 << ((v5 ^ 0x79u) + 61)) ^ 0xDA801678) & v14 ^ (v14 << ((v5 ^ 0x79u) + 61)) & 0x6D400B3C;
  LODWORD(v13) = (v14 ^ 0x40000230) & (4 * v13) ^ v13;
  LODWORD(v14) = ((4 * (v14 ^ 0x25400904)) ^ 0xB5002CF0) & (v14 ^ 0x25400904) ^ (4 * (v14 ^ 0x25400904)) & 0x6D400B3C;
  LODWORD(v13) = (v14 ^ 0x25000820) & (16 * v13) ^ v13;
  LODWORD(v14) = ((16 * (v14 ^ 0x4840030C)) ^ 0xD400B3C0) & (v14 ^ 0x4840030C) ^ (16 * (v14 ^ 0x4840030C)) & 0x6D400B00;
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((123
                                * ((v12 ^ (2
                                                       * ((((v14 ^ 0x2940083C) << 8) & 0x6D400B00 ^ (((v14 ^ 0x2940083C) << 8) ^ 0x400B0000) & (v14 ^ 0x2940083C) ^ 0x40000000) & (((v14 ^ 0x44000300) & (v13 << 8) ^ v13) << 16) ^ (v14 ^ 0x44000300) & (v13 << 8) ^ v13)) ^ 0xF8BACDC4) != 0)) ^ v5 ^ 0x384)))();
}

uint64_t sub_13380()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (v1 ^ (42 * (v0 > 7)))))();
}

uint64_t sub_133F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((a3 + v4 - a1 - (a2 << 32) - ((v3 - 333306662) & 0x13DDDBFB ^ 0xFFFFFFFFB94AC3FBLL) > 0x1F)
                                * ((v3 - 358) ^ 0x137)) ^ v3)))();
}

uint64_t sub_13460(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((a2 - 892) | 0x140) + ((a2 - 1224828817) & 0x490165BB) - 769) * (v2 < 0x20)) ^ a2)))();
}

uint64_t sub_134B0(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_134E4(int a1, uint64_t a2, unsigned int a3)
{
  __asm { BTI             j }
  *(int8x8_t *)(v5 + a3 + v3) = vadd_s8(*(int8x8_t *)(v6 + a3), v9);
  return (*(uint64_t (**)(void))(v8 + 8 * (((v4 == 0) * (a1 ^ v7)) ^ a1)))();
}

uint64_t sub_13524(int a1, uint64_t a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((((a1 ^ 0x301) - 385) ^ 0xFFFFFFCD) + (a1 ^ 0xEF)) * (a2 == v2)) ^ a1 ^ 0x301)))();
}

uint64_t sub_13564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5 + 8 * (a5 - 207)))();
}

uint64_t sub_13580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  BOOL v14 = v8 != a6 && v9 != 0;
  return (*(uint64_t (**)(void))(v7 + 8 * ((v14 * (((v6 - 1967760237) & 0x7549A27D) - 70)) ^ (v6 + 314))))();
}

uint64_t sub_135C4@<X0>(int a1@<W5>, int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((((a2 + 391) ^ a2 ^ 0x39D ^ 0xBB) * (v3 == a1)) ^ a2)))();
}

uint64_t sub_13600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  __asm { BTI             j }
  uint64_t v35 = a8[12];
  *(unint64_t *)((char *)&STACK[0x260] + v35 - 16) = 0;
  a8[12] = v35 + 10 * (v30 ^ 0x1CEu) - 324;
  int v36 = STACK[0x230];
  a8[17] = a29;
  a8[18] = (char *)&STACK[0x260] + v35 - 16;
  uint64_t v37 = (*(_DWORD *)(a7 + 8) + v36 - *(_DWORD *)(a7 + 12));
  *(_DWORD *)((char *)&STACK[0x260] + v35 - 8) = v37;
  uint64_t v38 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8 * (v30 + 821)))(((v37 + (((v30 + 408) | 0x73u) ^ 0x3F0)) & 0x1FFFFFFF8) + 16, 8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * ((1006 * (v38 == 0)) ^ v30)))(v38, v39, v40, v41, v42, v43, v44, v45, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_136B0(void *a1)
{
  __asm { BTI             j }
  *a1 = 0;
  a1[1] = v1;
  *uint64_t v4 = a1 + 2;
  return (*(uint64_t (**)(void))(v2 + 8 * ((((v3 ^ 0x2A3) + 1665) * (a1 != (void *)-16)) ^ v3)))();
}

uint64_t sub_13708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * (((*(_DWORD *)(a7 + 8) >= *(_DWORD *)(a7 + 12)) * (((v8 + 559) ^ 0x18A) - 448)) ^ (v8 + 559))))();
}

uint64_t sub_13744()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v0 - 1938974218) & 0x7392679F) - 924) * (v2 != v1)) ^ v0)))();
}

uint64_t sub_13784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v8 + 8 * (((*a7 == 0) * ((v7 - 832) ^ 0x41)) ^ (v7 - 307))))();
}

uint64_t sub_137C0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((((4 * v0) ^ 0x1BA) * (v1 <= *v2)) ^ v0)))();
}

uint64_t sub_13800()
{
  __asm { BTI             j }
  int v7 = v0 ^ 0x2FE;
  unsigned int v8 = ((2 * v1) & 0xFDFFFEFA) - 1385308161 + (v1 ^ 0xFEFFFCE2 ^ v0 ^ 0x3C0);
  int v9 = (v8 ^ 0x13C8B613) & (2 * (v8 & 0x53922084)) ^ v8 & 0x53922084;
  unsigned int v10 = ((2 * (((v7 - 577) | 0x112) ^ 0xB0E8F769 ^ v8)) ^ 0xC6F5AD3E) & (((v7 - 577) | 0x112) ^ 0xB0E8F769 ^ v8) ^ (2 * (((v7 - 577) | 0x112) ^ 0xB0E8F769 ^ v8)) & 0xE37AD69E;
  int v11 = v10 ^ 0x210A5281;
  unsigned int v12 = (v10 ^ 0xC2508410) & (4 * v9) ^ v9;
  unsigned int v13 = ((4 * v11) ^ 0x8DEB5A7C) & v11 ^ (4 * v11) & 0xE37AD69C;
  unsigned int v14 = (v13 ^ 0x816A5200) & (16 * v12) ^ v12;
  unsigned int v15 = ((16 * (v13 ^ 0x62108483)) ^ 0x37AD69F0) & (v13 ^ 0x62108483) ^ (16 * (v13 ^ 0x62108483)) & 0xE37AD690;
  BOOL v16 = (v8 ^ (2
             * ((((v15 ^ 0xC052960F) << 8) & 0xE37AD600 ^ 0x62520000 ^ (((v15 ^ 0xC052960F) << 8) ^ 0x7AD60000) & (v15 ^ 0xC052960F)) & (((v15 ^ 0x23284000) & (v14 << 8) ^ v14) << 16) ^ (v15 ^ 0x23284000) & (v14 << 8) ^ v14)) ^ 0x53922084) == 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((v16 | (8 * v16)) ^ v7)))();
}

uint64_t sub_139B0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (((v1 - 116) * (v0 < 8)) ^ v1)))();
}

uint64_t sub_13A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * (((0xB05A2631082000B3 - a1 + a3 + v3 + v5 < (unint64_t)(66 * (v4 ^ 0x158u))
                                                                            - 1222)
                                * ((85 * (v4 ^ 0x14F)) ^ 0x146)) ^ v4)))();
}

uint64_t sub_13A9C(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((22 * (v2 < ((25 * (a2 ^ 0x4E2)) ^ 0x44u))) ^ a2)))();
}

uint64_t sub_13ADC()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_13B10(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __asm { BTI             j }
  *(void *)(a2 + a3) = *(void *)(v6 + a3 + v3);
  return (*(uint64_t (**)(void))(v8 + 8 * (((v5 == 0) * (v4 ^ v7)) ^ v4)))();
}

uint64_t sub_13B4C(uint64_t a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8
                                   * (((((((v2 ^ 0x171) + 63) ^ (a1 == v1)) & 1) == 0) * (v2 ^ 0x54)) ^ v2 ^ 0x171)))();
}

uint64_t sub_13B98(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * ((a2 ^ 0x5B2) + 235)))(v2 - 1, (v2 & 0xFFFFFFE0) - 32);
}

uint64_t sub_13BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BTI             j }
  unint64_t v17 = ((v7 + v11) & v12 ^ (unint64_t)(a4 - 54)) & a1;
  uint64_t v18 = v5 + v17 + v6;
  long long v19 = *(_OWORD *)(v18 - 31);
  uint64_t v20 = v4 + v17;
  *(_OWORD *)(v20 - 15) = *(_OWORD *)(v18 - 15);
  *(_OWORD *)(v20 - 31) = v19;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8 * (((a2 == 0) * v9) ^ v8)))(a1 - 32, a2 - 32);
}

uint64_t sub_13C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                       + 8
                                                                       * (((4
                                                                          * (((v4 == v3) ^ ((v5 ^ 0xB1) - 48)) & 1)) & 0xEF | (16 * (((v4 == v3) ^ ((v5 ^ 0xB1) - 48)) & 1))) ^ v5)))(a1, a2, a3, 927);
}

uint64_t sub_13C70()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v1 - 49) ^ (175 * ((v0 & 0x18) == 0)))))();
}

uint64_t sub_13CB0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 285)))();
}

uint64_t sub_13CC4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  __asm { BTI             j }
  unsigned int v16 = v9 - 1;
  *(unsigned char *)(v4 + v16) = *(unsigned char *)(v5 + v16 + v6);
  return (*(uint64_t (**)(void))(v10 + 8 * (((v16 == ((v8 + 587) ^ a4)) * v11) ^ v7)))();
}

uint64_t sub_13D00()
{
  __asm { BTI             j }
  BOOL v8 = v1 != v0 - 927 && v2 != 0;
  return (*(uint64_t (**)(void))(v3 + 8 * ((v8 * ((21 * (v0 ^ 0x3B4)) ^ 0x3BB)) ^ v0)))();
}

uint64_t sub_13D48@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((((a1 + v2) <= *v3) ^ 0x7F) + 2 * ((a1 + v2) <= *v3) != 127)
                                * (((v1 - 631) | 0x44) - 322)) ^ v1)))();
}

uint64_t sub_13D98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  int v10 = v3 - 32;
  int v11 = (v4 ^ 0x7FF6FAB6) - 361762848 + ((v10 - 1183227) & (2 * v4));
  int v12 = (2 * (v11 & (((v10 - 871) | 0x12) - 1785129640))) & 0xB2008D4 ^ v11 & (((v10 - 871) | 0x12) - 1785129640) ^ (2 * (v11 & (((v10 - 871) | 0x12) - 1785129640))) & (v11 ^ 0x5A3D9CB7);
  unsigned int v13 = ((2 * (v11 ^ 0x5A3D9CB7)) ^ 0x9F4913BA) & (v11 ^ 0x5A3D9CB7) ^ (2 * (v11 ^ 0x5A3D9CB7)) & 0xCFA489DC;
  int v14 = v13 ^ 0x40A48845;
  unsigned int v15 = (v13 ^ 0x8F000199) & (4 * v12) ^ v12;
  unsigned int v16 = ((4 * v14) ^ 0x3E922774) & v14 ^ (4 * v14) & 0xCFA489DC;
  int v17 = (v16 ^ 0xE800150) & (16 * v15) ^ v15;
  unsigned int v18 = ((16 * (v16 ^ 0xC1248889)) ^ 0xFA489DD0) & (v16 ^ 0xC1248889) ^ (16 * (v16 ^ 0xC1248889)) & 0xCFA489D0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                       + 8
                                                                       * ((11
                                                                         * ((v11 ^ (2
                                                                                  * ((((v18 ^ 0x5A4000D) << 8) & 0x4FA40000 ^ 0x4800000 ^ (((v18 ^ 0x5A4000D) << 8) ^ 0xA4890000) & (v18 ^ 0x5A4000D)) & (((v18 ^ 0xCA008900) & (v17 << 8) ^ v17) << 16) ^ (v18 ^ 0xCA008900) & (v17 << 8) ^ v17)) ^ 0x9599156A) != 0)) ^ v10)))(a1, a2, a3, 4294966279);
}

uint64_t sub_13F3C()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v0 - 744) ^ (253 * (v1 < 8)))))();
}

uint64_t sub_13FCC()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((((68 * (v1 ^ 0x297)) ^ 0x13D)
                                * ((unint64_t)(v4 + 0x7F7F9FFE1EFFFD1BLL - v2 - v0 - v3 + 658) > 0x1F)) | v1)))();
}

uint64_t sub_1402C()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((v0 < ((v1 - 1442348851) & 0x55F87DF4 ^ 0x174u)) * ((v1 + 95) ^ 0x2EB)) ^ (v1 + 87))))();
}

uint64_t sub_14080()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * v1))(~v2 + v0, v2 - (v0 & 0xFFFFFFF8) + 8);
}

uint64_t sub_140B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  __asm { BTI             j }
  unint64_t v13 = ((v4 - 623) ^ (unint64_t)(a3 + 886)) & a1;
  *(void *)(v6 + v13 + a4) = *(void *)(v5 + v13);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8 * (((a2 == 0) * v7) ^ v4)))(a1 - 8, a2 + 8);
}

uint64_t sub_140F8()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v1 - 112) ^ 0x146) + 413) * (v2 == v0)) ^ v1)))();
}

uint64_t sub_14128(uint64_t a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 8 * (v1 + 598)))(a1, 3681010346, 613957549);
}

uint64_t sub_1415C@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  uint64_t v16 = ((((v6 + a1) & a2) - 941) ^ v8) + v4;
  long long v17 = *(_OWORD *)(v10 + v16 - 15);
  long long v18 = *(_OWORD *)(v10 + v16 - 31);
  uint64_t v19 = v3 + a3 + v16;
  *(_OWORD *)(v19 - 15) = v17;
  *(_OWORD *)(v19 - 31) = v18;
  return (*(uint64_t (**)(void))(v11 + 8 * (((v7 == v8) * v9) ^ v5)))();
}

uint64_t sub_141B0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (((v1 != v0) * ((v2 - 188) ^ 0x28D)) ^ v2)))();
}

uint64_t sub_141E4()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((350 * ((v0 & 0x18) == (v1 | 3u) - 415 - 340)) ^ (v1 | 3))))();
}

uint64_t sub_14230()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 - 257)))();
}

uint64_t sub_14244@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  uint64_t v14 = 3 * (v5 ^ v9);
  uint64_t v15 = v4 - 1;
  *(unsigned char *)(v2 + ((v14 ^ (a1 + 998)) & v15) + a2) = *(unsigned char *)(v7 + ((v14 ^ (a1 + 998)) & v15));
  return (*(uint64_t (**)(void))(v8 + 8 * (((((v14 ^ (a1 + 998)) & v15) == 0) * v6) ^ v3)))();
}

uint64_t sub_14284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  __asm { BTI             j }
  a8[22] = a41 + a31;
  a8[12] = (v41 ^ 0x32) + a32;
  LODWORD(STACK[0x204]) = v42;
  a8[15] = v43;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 8 * (int)(v41 + 439)))(a1, a2, a3, 0x2DABEB540C1AC424);
}

uint64_t sub_142F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46)
{
  __asm { BTI             j }
  *(void *)(a8 + 72) = v47;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 8 * (((a9 == a4) * (((v46 - 879) | 0x14) ^ 0xEE)) ^ v46)))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46);
}

uint64_t sub_14334()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((489 * (((v0 + 82) ^ (v1 > ((v0 - 1029) | 0x110u) - 315)) & 1)) ^ (v0 - 957))))();
}

uint64_t sub_14378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 8 * v41))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

uint64_t sub_143A8@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * ((((a1 | 8) ^ 0x209) + 22) | a1 | 8)))();
}

uint64_t sub_143D0@<X0>(unint64_t a1@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((76 * (a1 < (unint64_t)((339 * (v1 ^ 0x203) + 1960986628) & 0x8B1DB7FB) + 64519)) ^ v1)))();
}

uint64_t sub_14430()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_1445C()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_14490()
{
  __asm { BTI             j }
  return v0();
}

uint64_t sub_144C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  __asm { BTI             j }
  HIDWORD(a53) = (v55 - 111) | (v57 + 2);
  *(unsigned char *)(v56 - 0x2DABEB540C1AC424) = 113;
  *(unsigned char *)(v56 - 0x2DABEB540C1AC423) = v55;
  *(void *)(a8 + 104) = *(void *)(v58 + 8 * ((int)a5 - 277));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 8 * (HIDWORD(a30) + (int)a5 - 277)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55);
}

uint64_t sub_1454C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(void *)(a8 + 24) = v8;
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * (((2 * (((v9 ^ (v8 == a4)) & 1) == 0)) & 0xFB | (4
                                                                               * ((v9 ^ ~(v8 == a4)) & 1))) ^ v9)))();
}

uint64_t sub_1458C()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)((((((v0 - 120) < 0xF7u) ^ (((v1 + 123) & 0xE6)
                                                                                                 - 1)) & 1)
                                     * (((v1 + 365437051) & 0xEA37DFE6) - 332)) | (v1 + 365437051) & 0xEA37DFE6)))();
}

uint64_t sub_145DC()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((v1 + 644) | (4 * (((((v1 - 291) | 0x2C) ^ 0x91) & 0xFBu) > (v0 - 119))))))();
}

uint64_t sub_14620()
{
  __asm { BTI             j }
  int v7 = v0 - 454;
  BOOL v8 = ((((v7 - 29) | 0x10) ^ 0x9F) + v1) > 0xF8u;
  return (*(uint64_t (**)(void))(v2 + 8 * (((2 * v8) | (4 * v8)) ^ v7)))();
}

uint64_t sub_14664(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((100
                                * ((((17 * (a1 ^ 0x17)) ^ 0xA9) + v1) >= (a1 - 27))) ^ a1)))();
}

uint64_t sub_146B0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((4 * ((((v1 - 116) < 0xFBu) ^ (v0 + v0 + 90 + 1)) & 1)) & 0xEF | (16 * ((((v1 - 116) < 0xFBu) ^ (v0 + v0 + 90 + 1)) & 1)) | v0)))();
}

uint64_t sub_14708()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((198 * ((v1 - 115) > 0xFBu)) ^ v0 ^ 0x454)))();
}

uint64_t sub_14758()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((26
                                * ((v0 - 114) >= (v1 - 38 + v1 + 53 - 98))) ^ (v1 + 160))))();
}

uint64_t sub_1479C(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((212
                                * ((((a1 - 110) & 0xBA ^ 0x25) + v1) < (a1 - 95))) ^ a1)))();
}

uint64_t sub_147F4()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (int)(((((v0 + 1957892298) & 0x8B4CEFDF ^ 0xFFFFFCF9) + v0 + 839) * (v1 == 111)) ^ v0)))();
}

uint64_t sub_14850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 8 * ((239 * (((a5 + 1526582827) ^ (v41 - 110)) + 2 * ((v41 - 110) & 0x7Fu) < 0x5AFDCF7F)) ^ ((int)a5 - 225))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

uint64_t sub_148B4@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((22 * (((34 * ((a1 - 1702526756) & 0x657A7DBB ^ 0x1B0)) ^ 0xA5023128) + v1 < 0xFFFFFFFB)) ^ a1)))();
}

uint64_t sub_14914()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((121 * (((v1 + 89) ^ (v0 == v2 + 2 * (v1 ^ 0x1FC) - 139)) & 1)) ^ v1)))();
}

uint64_t sub_14954()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((62 * (v0 == ((((v1 - 745) | 5) + 766) ^ (v2 + 277)))) ^ v1)))();
}

uint64_t sub_14998@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(v2 - 0x2DABEB540C1AC424) = ((((v1 - 95) ^ 0xF5) - 1) ^ (((v1 - 95) ^ 5) + 15) ^ (((v1 - 95) ^ (a1 + 2) ^ 0x5F)
                                                                                              + 124))
                                        - 29;
  return (*(uint64_t (**)(void))(v3 + 8 * a1))();
}

uint64_t sub_149FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(void *)(a8 + 104) = *(void *)(v9 + 8 * v8);
  return (*(uint64_t (**)(void))(v9 + 8 * (v8 ^ 0x74)))();
}

uint64_t sub_14B0C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  __asm { BTI             j }
  *(unsigned char *)(a39 - 0x2DABEB540C1AC424) = (((a1 - 108) | 0x14) ^ 0x5B) + a47;
  return (*(uint64_t (**)(void))(v47 + 8 * a1))();
}

uint64_t sub_14B5C()
{
  __asm { BTI             j }
  int v8 = v2 - 240;
  int v9 = v2 - 247;
  BOOL v11 = (v0 - 973474400) < 0xD65782FE || v1 - 698907905 <= (v0 - 973474400);
  char v12 = ~v11;
  if (v11) {
    char v13 = 2;
  }
  else {
    char v13 = 0;
  }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((((v13 + v12) == ((68 * (v8 ^ 0x71)) ^ 0xAB))
                                * (v9 ^ 0x67)) ^ v8)))();
}

uint64_t sub_14BF0()
{
  __asm { BTI             j }
  BOOL v10 = (v0 + 139715973) >= 0x18B172E3 && v1 + 414282467 + v2 + ((v3 + 19) | 0x42u) - 193 > v0 + 139715973;
  return (*(uint64_t (**)(void))(v4 + 8 * ((19 * v10) ^ v3)))();
}

uint64_t sub_14C54@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  *(unsigned char *)(v1 + (v4 + v2) - 0x2DABEB540C1AC424) = ((HIBYTE(a1) << ((7 * (v3 ^ 0xC0)) ^ 0xF)) & 0xDE)
                                                                  + (HIBYTE(a1) ^ 0x6F);
  return (*(uint64_t (**)(void))(v5 + 8 * v3))();
}

uint64_t sub_14CAC()
{
  __asm { BTI             j }
  BOOL v11 = v0 - 103988492 < ((v3 - 1924709623) & 0x72B8B8FD ^ 0xA2AD047u)
     || v1 + 170577991 + ((v3 - 2050328730) & 0x7A3585DF ^ 0x155u) + v2 + 11 <= v0 - 103988492;
  return (*(uint64_t (**)(void))(v5 + 8 * ((v11 * v4) ^ v3)))();
}

uint64_t sub_14D3C@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  *(unsigned char *)(*(void *)(a1 + 24) + (v4 + v2) - 0x2DABEB540C1AC424) = ((((v3 - 17) | 0x30) ^ 0xEA) & (2 * BYTE6(a2)))
                                                                                    + (BYTE6(a2) ^ 0x6F);
  return (*(uint64_t (**)(void))(v5 + 8 * v3))();
}

uint64_t sub_14D94()
{
  __asm { BTI             j }
  BOOL v10 = (v0 + 1471015349) < 0x680B7713 || v1 + v2 + 1 + 1745581843 <= (v0 + 1471015349);
  return (*(uint64_t (**)(void))(v4 + 8 * ((v10 * (((v3 - 274) ^ 0x176) + 1074)) ^ v3)))();
}

uint64_t sub_14DF4@<X0>(unint64_t a1@<X8>)
{
  __asm { BTI             j }
  *(unsigned char *)(v1 + (v4 + v2) - 0x2DABEB540C1AC424) = (a1 >> ((28 * (v3 ^ 0x29)) ^ 0x1Cu)) + 111;
  return (*(uint64_t (**)(void))(v5 + 8 * v3))();
}

uint64_t sub_14E40()
{
  __asm { BTI             j }
  unsigned int v9 = ((v3 + 399) ^ 0xC02D301D) + v0;
  BOOL v11 = v9 < 0xD08AC03C || v1 - 796213188 + ((v3 - 1435068854) & 0x558969D5 ^ 0x155u) + v2 <= v9;
  return (*(uint64_t (**)(void))(v4 + 8 * ((746 * v11) ^ v3)))();
}

uint64_t sub_14EBC@<X0>(uint64_t a1@<X7>, unint64_t a2@<X8>)
{
  __asm { BTI             j }
  *(unsigned char *)(*(void *)(a1 + 24) + (v4 + v2) - 0x2DABEB540C1AC424) = ((a2 >> (v3 + 93)) ^ 0x7F)
                                                                                    + 2
                                                                                    * (a2 >> (v3 + 93))
                                                                                    - 16;
  return (*(uint64_t (**)(void))(v5 + 8 * v3))();
}

uint64_t sub_14F04()
{
  __asm { BTI             j }
  int v10 = v0 - 1751125101 < (((v3 + 24) | 0x88) ^ 0xA7FD8139)
     || v1 + v2 + 1 - 1476558607 <= (v0 - 1751125101);
  int v11 = ~v10;
  if (v10) {
    int v12 = 2;
  }
  else {
    int v12 = 0;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * ((105 * (v12 + v11 != -1)) ^ v3)))();
}

uint64_t sub_14F88@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(v1 + (v4 + v2) - 0x2DABEB540C1AC424) = (((HIBYTE(a1) ^ 0x22) - 12) ^ ((HIBYTE(a1) ^ 0x85)
                                                                                                 + 85) ^ (((((v3 + 75) & 0xEE) - 91) ^ HIBYTE(a1)) + 119))
                                                                  - 99;
  return (*(uint64_t (**)(void))(v5 + 8 * v3))();
}

uint64_t sub_14FFC()
{
  __asm { BTI             j }
  BOOL v10 = v0 + 844806934 < ((v3 - 478757292) & 0x1C8941FD ^ 0x42B84920u)
     || v1 + v2 + 1 + 1119373428 <= (v0 + 844806934);
  return (*(uint64_t (**)(void))(v4 + 8 * ((v10 * ((3 * (v3 ^ 0x181)) ^ 0x3F1)) | v3)))();
}

uint64_t sub_15080@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(*(void *)(a1 + 24) + (v4 + v2) - 0x2DABEB540C1AC424) = (((BYTE2(a2) ^ 0xFD) + 40) ^ ((BYTE2(a2) ^ 0xCF) + 22) ^ ((BYTE2(a2) ^ 0xE4 ^ (v3 + 117) & 0xD7) - 23))
                                                                                    - 108;
  return (*(uint64_t (**)(void))(v5 + 8 * v3))();
}

uint64_t sub_150F8()
{
  __asm { BTI             j }
  BOOL v10 = (v0 + 588058121) < 0x336A9B67 || v1 + v2 + 1 + 862624615 <= (v0 + 588058121);
  char v11 = ~v10;
  if (v10) {
    char v12 = 2;
  }
  else {
    char v12 = 0;
  }
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((54 * ((v12 + v11) != (((v3 ^ 0x7C) - 86) ^ 0xAB))) ^ v3)))();
}

uint64_t sub_15180@<X0>(__int16 a1@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(v1 + (v4 + v2) - 0x2DABEB540C1AC424) = (((HIBYTE(a1) ^ 0xA3) - 114) ^ ((HIBYTE(a1) ^ 0x73)
                                                                                                  + 94) ^ (((v3 + 71) ^ 0xE) + (HIBYTE(a1) ^ 0xD0)))
                                                                  + 64;
  return (*(uint64_t (**)(void))(v5 + 8 * v3))();
}

uint64_t sub_151E8()
{
  __asm { BTI             j }
  unsigned int v9 = ((68 * (v3 ^ 0x3F4)) ^ 0x7EBCCF6C) + v0;
  BOOL v11 = v9 < 0x8F1A5B96 || v1 + v2 - 1894098025 <= v9;
  int v12 = v11 ^ 0x77;
  if (v11) {
    int v13 = 2;
  }
  else {
    int v13 = 0;
  }
  return (*(uint64_t (**)(void))(v4 + 8 * ((2047 * (v12 + v13 == 119)) ^ v3)))();
}

uint64_t sub_1526C@<X0>(uint64_t a1@<X7>, char a2@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(*(void *)(a1 + 24) + (v3 + v2) - 0x2DABEB540C1AC424) = ((((v4 ^ 0xF3) - 19) ^ a2)
                                                                                     + ((2 * a2) & 0xDF)) ^ 0x80;
  return (*(uint64_t (**)(void))(v5 + 8 * (v4 ^ 0x2F3)))();
}

uint64_t sub_152C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 104))();
}

uint64_t sub_152D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 8 * (int)(((a5 - 309) * v48) ^ (a5 - 178))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

uint64_t sub_152FC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,_DWORD *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,int a47)
{
  __asm { BTI             j }
  *a26 = a47;
  return (*(uint64_t (**)(void))(v47 + 8 * a1))();
}

uint64_t sub_1531C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5 + 8 * (a5 - 200)))();
}

uint64_t sub_1533C@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  __asm { BTI             j }
  **(_DWORD **)(a1 + 72) = a2;
  return (*(uint64_t (**)(void))(v3 + 8 * v2))();
}

uint64_t sub_15354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t (*a48)(void))
{
  __asm { BTI             j }
  return a48();
}

uint64_t sub_15364()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (v1 - 206)))((v0 & 0xFFFFFFE0) - 32);
}

uint64_t sub_15390(uint64_t a1, double a2, double a3, int8x16_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BTI             j }
  uint64_t v20 = (a6 ^ v12 ^ ((v8 + 320) | v11)) + v7;
  int8x16_t v21 = *(int8x16_t *)(v10 + v20 - 15);
  int8x16_t v22 = *(int8x16_t *)(v10 + v20 - 31);
  uint64_t v23 = v15 + v6 + v20;
  *(int8x16_t *)(v23 - 15) = vaddq_s8(v21, a4);
  *(int8x16_t *)(v23 - 31) = vaddq_s8(v22, a4);
  return (*(uint64_t (**)(void))(v14 + 8 * (((a1 == a6) * v13) ^ v9)))();
}

uint64_t sub_153EC(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((((v3 == v2) ^ a2 ^ 0xA5) & 1) * (223 * (a2 ^ 0x398) - 797)) ^ a2)))();
}

uint64_t sub_15430(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8
                                   * (((((((a3 - 876) | 0x144) ^ 0x14C) & v3) == 0) * ((a3 - 449) ^ 0x14F)) ^ a3)))();
}

uint64_t sub_15474()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 495)))();
}

uint64_t sub_15488()
{
  __asm { BTI             j }
  unsigned int v12 = v2 - 1;
  *(unsigned char *)(v7 + v12 + v(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = ((v1 - 27) ^ v4) + *(unsigned char *)(v3 + v12);
  return (*(uint64_t (**)(void))(v5 + 8 * (((v12 != 0) * v6) ^ (v1 + 484))))();
}

uint64_t sub_154C8(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_154E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,_DWORD *a44)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v46
                              + 8
                              * ((29
                                * ((((_BYTE)v45 - 71) & 0xD6 ^ 0xA3) == (((*a44 + v44 - 274566494 <= v47) ^ (v45 + 51))
                                                                                        + 2
                                                                                        * (*a44 + v44 - 274566494 <= v47)))) ^ v45)))();
}

uint64_t sub_15568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  __asm { BTI             j }
  uint64_t v11 = a1 < a5;
  uint64_t v12 = a1 + 0x2909659CD461D96FLL;
  uint64_t v13 = v12 + (v11 << 32);
  uint64_t v14 = v13 ^ 0x6D520BC610D9074BLL;
  LODWORD(v13) = (v13 ^ 0x1258152B) & (2 * ((v5 + 457218159) & v13)) ^ (v5 + 457218159) & v13;
  LODWORD(v14) = ((v14 << (42 * ((v5 - 64) ^ 0x80u) + 89)) ^ 0x17333CF0) & v14 ^ (v14 << (42 * ((v5 - 64) ^ 0x80u) + 89)) & 0xB999E78;
  LODWORD(v13) = (v14 ^ 0x3880E50) & (4 * v13) ^ v13;
  LODWORD(v14) = ((4 * (v14 ^ 0x8888208)) ^ 0x2E6679E0) & (v14 ^ 0x8888208) ^ (4 * (v14 ^ 0x8888208)) & 0xB999E78;
  LODWORD(v13) = (v14 ^ 0xA001860) & (16 * v13) ^ v13;
  LODWORD(v14) = ((16 * (v14 ^ 0x1998618)) ^ 0xB999E780) & (v14 ^ 0x1998618) ^ (16 * (v14 ^ 0x1998618)) & 0xB999E70;
  LODWORD(v12) = (v12 ^ (2
                                     * ((((v14 ^ 0x2001878) << 8) & 0xB990000 ^ 0x9980000 ^ (((v14 ^ 0x2001878) << 8) ^ 0x999E0000) & (v14 ^ 0x2001878)) & (((v14 ^ 0x9998600) & (v13 << 8) ^ v13) << 16) ^ (v14 ^ 0x9998600) & (v13 << 8) ^ v13)) ^ 0x1B409933) != 0;
  return (*(uint64_t (**)(void))(v6 + 8 * (int)((2 * v12) | (32 * v12) | (v5 - 64))))();
}

uint64_t sub_15708()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (v1 ^ (25 * (v0 > 7)))))();
}

uint64_t sub_157AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (int)(((a3 - 0x600C101222400705 + a4 - a1 - a2 + 1176 >= ((v4 + 512714587) & 0xE1709574 ^ 0x174uLL))
                                     * (((v4 + 357010201) & 0xEAB8747F) - 1025)) ^ v4)))();
}

uint64_t sub_15830(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((113 * (v2 < ((a2 - 713) ^ 0x3B2 ^ (142 * (a2 ^ 0x418u))))) ^ a2)))();
}

uint64_t sub_15878(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_158A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BTI             j }
  *(int8x8_t *)(a4 + (~v7 + v6) + v5) = vadd_s8(*(int8x8_t *)(a5 + (~v7 + v6)), v11);
  return (*(uint64_t (**)(void))(v10 + 8 * ((126 * (v7 + (v8 ^ v9) - 492 != a2)) ^ v8)))();
}

uint64_t sub_158F0(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8 * (((((a3 + 104) ^ (a2 == v3)) & 1) == 0) ^ a3)))((a3 - 368));
}

uint64_t sub_15934()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (v1 - 307)))(v0 - 1);
}

uint64_t sub_15958(uint64_t a1, double a2, double a3, int8x16_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BTI             j }
  uint64_t v17 = v9 + a1;
  uint64_t v18 = v12 + a1 + v6;
  int8x16_t v19 = vaddq_s8(*(int8x16_t *)(v17 - 31), a4);
  *(int8x16_t *)(v18 - 15) = vaddq_s8(*(int8x16_t *)(v17 - 15), a4);
  *(int8x16_t *)(v18 - 31) = v19;
  return (*(uint64_t (**)(uint64_t))(v11 + 8 * (((a6 == 0) * ((v7 ^ v10) - 232)) ^ v8)))(a1 - 32);
}

uint64_t sub_159B0(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4
                                           + 8 * (((((a2 ^ 0x169) + 821) ^ (91 * (a2 ^ 0x169))) * (v3 == v2)) ^ a2)))((a2 ^ 0x169u) + 123);
}

uint64_t sub_159EC(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8 * ((101 * ((((v3 & 0x18) == 0) ^ (a3 + 34)) & 1)) ^ a3)))();
}

uint64_t sub_15A30()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 - 160)))();
}

uint64_t sub_15A44()
{
  __asm { BTI             j }
  unsigned int v12 = v3 - 1;
  *(unsigned char *)(v7 + v12 + v(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 48 + *(unsigned char *)(v4 + v12) + 13;
  return (*(uint64_t (**)(void))(v6 + 8 * (((v12 == 0) * v5) ^ v1)))();
}

uint64_t sub_15A80(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_15A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v11
                              + 8
                              * (((v8 - 274566493 + ((v9 - 485) | 0x82u) - 306 - 341 + **(_DWORD **)(a8 + 8) <= v12)
                                * v10) ^ v9)))();
}

uint64_t sub_15AF4(int a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  int v8 = a3 + ((a1 + 1812369465) & 0x93F96DC5) - 1079640864;
  unsigned int v9 = (v8 ^ 0xAFFF743D) & (2 * (v8 & 0x2FFC753D)) ^ v8 & 0x2FFC753D;
  unsigned int v10 = ((2 * (v8 ^ 0xF63F3465)) ^ 0xB38682B0) & (v8 ^ 0xF63F3465) ^ (2 * (v8 ^ 0xF63F3465)) & 0xD9C34158;
  int v11 = v10 ^ 0x48414148;
  unsigned int v12 = (v10 ^ 0x91820010) & (4 * v9) ^ v9;
  unsigned int v13 = ((4 * v11) ^ 0x670D0560) & v11 ^ (4 * v11) & 0xD9C34158;
  int v14 = (v13 ^ 0x41010140) & (16 * v12) ^ v12;
  unsigned int v15 = ((16 * (v13 ^ 0x98C24018)) ^ 0x9C341580) & (v13 ^ 0x98C24018) ^ (16 * (v13 ^ 0x98C24018)) & 0xD9C34150;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((v8 ^ (2
                                       * ((((v15 ^ 0x41C34058) << 8) & 0x59C30000 ^ 0x41410000 ^ (((v15 ^ 0x41C34058) << 8) ^ 0xC3410000) & (v15 ^ 0x41C34058)) & (((v15 ^ 0x98000100) & (v14 << 8) ^ v14) << 16) ^ (v15 ^ 0x98000100) & (v14 << 8) ^ v14)) ^ 0x2FFC753D) != 0) | a1)))();
}

uint64_t sub_15C6C(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((((a2 - 589) ^ 0x13D) * (v2 > 7)) ^ a2)))();
}

uint64_t sub_15CF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  int v10 = a2 - 0x1308001000680101 + a3 - a1 - v3 + 40 < (unint64_t)(((v4 ^ 0xCC) - 408) | 0x14Eu) - 302;
  return (*(uint64_t (**)(void))(v5 + 8 * ((2 * v10) | (v10 << 6) | v4 ^ 0xCC)))();
}

uint64_t sub_15D58(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8 * ((v3 >= (a3 ^ 0x395u) - 699) | a3)))();
}

uint64_t sub_15D84(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (34 * (a3 ^ 0x144) + 430)))();
}

uint64_t sub_15DB4(int a1, uint64_t a2, uint64_t a3, double a4, double a5, int8x16_t a6)
{
  __asm { BTI             j }
  uint64_t v17 = ((((v8 + 76) | 1) - 418) ^ a2) + v7;
  int8x16_t v18 = *(int8x16_t *)(v9 + v17 - 15);
  int8x16_t v19 = *(int8x16_t *)(v9 + v17 - 31);
  uint64_t v20 = v12 + v17 + v6;
  *(int8x16_t *)(v20 - 15) = vaddq_s8(v18, a6);
  *(int8x16_t *)(v20 - 31) = vaddq_s8(v19, a6);
  return (*(uint64_t (**)(void))(v11 + 8 * (((a3 == a2) * v10) ^ a1)))();
}

uint64_t sub_15E10()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (((((v2 - 285) | 0x202) ^ 0x296) * (v1 == v0)) ^ v2)))();
}

uint64_t sub_15E44()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((v0 & 0x18) == (((v1 - 272) | 0x24Au) ^ 0x2DBLL)) * (((v1 - 397) | 0x140) + 361)) ^ (v1 - 83))))();
}

uint64_t sub_15E94(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_15ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  *(int8x8_t *)(a3 + (v4 + v5) + v3) = vadd_s8(*(int8x8_t *)(v7 + (v4 + v5)), v11);
  return (*(uint64_t (**)(void))(v9 + 8 * (((((a2 + v5 == 7) ^ ((v6 ^ v10) + 1)) & 1) * v8) ^ v6)))();
}

uint64_t sub_15F18(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5 + 8 * (((a4 ^ 0x548 ^ (a4 - 1374814333) & 0x51F1FFF6) * (a2 == v4)) ^ a4)))();
}

uint64_t sub_15F68()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 39)))();
}

uint64_t sub_15F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BTI             j }
  uint64_t v18 = v7 ^ v10;
  uint64_t v19 = v8 - 1;
  *(unsigned char *)(v13 + ((a5 + v18 + 370) & v19) + v5) = *(unsigned char *)(v9 + ((a5 + v18 + 370) & v19)) - 111;
  return (*(uint64_t (**)(void))(v12 + 8 * (((((a5 + v18 + 370) & v19) == 0) * v11) ^ v6)))();
}

uint64_t sub_15FBC(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_15FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  BOOL v17 = **(_DWORD **)(a8 + 192) + v8 <= v12;
  return (*(uint64_t (**)(void))(v11
                              + 8
                              * ((((v17 ^ 0xEF) + 2 * v17 != ((v9 ^ 0xBF) + v9 + 48)) * v10) ^ v9)))();
}

uint64_t sub_16048()
{
  __asm { BTI             j }
  unint64_t v7 = (v0 ^ 0xFFF66F5B7F7E69BBLL) + 0x6759FCEEB9CFBFC5 + ((2 * v0) & 0xFEFCD376);
  int v8 = ((v0 ^ 0x7F7E69BB) - 1177567291 + ((2 * v0) & 0xFEFCD376)) ^ 0xB17372F7;
  int v9 = ((v7 & 0x5C6B1D680) << ((53 * (v1 ^ 0xB2)) ^ 0x72u)) & (v7 ^ 0xB431D6F7) ^ v7 & 0xC6B1D680;
  unsigned int v10 = ((2 * v8) ^ 0xEF8548EE) & v8 ^ (2 * v8) & 0x77C2A476;
  int v11 = v10 ^ 0x1042A411;
  int v12 = (v10 ^ 0x27800011) & (4 * v9) ^ v9;
  unsigned int v13 = ((4 * v11) ^ 0xDF0A91DC) & v11 ^ (4 * v11) & 0x77C2A474;
  int v14 = (v13 ^ 0x57028043) & (16 * v12) ^ v12;
  int v15 = ((16 * (v13 ^ 0x20C02423)) ^ 0x7C2A4770) & (v13 ^ 0x20C02423) ^ (16 * (v13 ^ 0x20C02423)) & 0x77C2A470;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((69
                                * ((v7 ^ (2
                                                      * ((((v15 ^ 0x3C0A007) << 8) & 0x77C2A400 ^ 0x42808077 ^ (((v15 ^ 0x3C0A007) << 8) ^ 0xC2A47700) & (v15 ^ 0x3C0A007)) & (((v15 ^ 0x74020407) & (v14 << 8) ^ v14) << 16) ^ (v15 ^ 0x74020407) & (v14 << 8) ^ v14)) ^ 0xC6B1D680) == 0)) ^ v1)))();
}

uint64_t sub_16218()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (v1 ^ (246 * (v0 < 8)))))();
}

uint64_t sub_1629C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * ((105
                                * (a3 + 0x63FBDFBFBFEEF6EFLL - a2 + v3 - a1 < ((((v4 - 1993403932) & 0x76D0EFAEu) - 434) ^ 0x174uLL))) ^ (v4 + 575))))();
}

uint64_t sub_1630C(uint64_t a1, unsigned int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((((a2 - 713005480) & 0x2A7F97F5 ^ 0x14B) * (v2 < 0x20)) ^ a2)))();
}

uint64_t sub_16354()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_16398(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BTI             j }
  *(void *)(a4 + v6 + v5) = *(void *)(a3 + v6);
  return (*(uint64_t (**)(void))(v9 + 8 * (((a5 != 0) * (((a1 - 756) | v7) ^ v8)) ^ a1)))();
}

uint64_t sub_163DC@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((a2 + 13) | 0x114) + ((a2 - 996402499) & 0x3B63E7FF) - 1077) * (a1 == v2)) ^ a2)))();
}

uint64_t sub_16430()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 368)))();
}

uint64_t sub_16460@<X0>(uint64_t a1@<X1>, int a2@<W3>, int a3@<W4>, uint64_t a4@<X8>)
{
  __asm { BTI             j }
  uint64_t v16 = (~a1 + v6);
  long long v17 = *(_OWORD *)(v4 + v16 - 15);
  long long v18 = *(_OWORD *)(v4 + v16 - 31);
  uint64_t v19 = v11 + v5 + v16;
  *(_OWORD *)(v19 - 15) = v17;
  *(_OWORD *)(v19 - 31) = v18;
  return (*(uint64_t (**)(void))(v10 + 8 * (((a1 + ((v7 + a3) & v9) - 350 == a4) * a2) ^ v8)))();
}

uint64_t sub_164B4@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (((((a2 == v2) ^ (a1 + 25)) & 1)
                                * ((a1 - 1806244228) & 0x6BA91AF5 ^ 0x20F)) ^ a1)))();
}

uint64_t sub_16500(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (((((a2 - 127) & v2) == 0) * (a2 - 139)) ^ a2)))((a2 + 189));
}

uint64_t sub_16534(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (a1 + 662)))();
}

uint64_t sub_16548@<X0>(int a1@<W0>, int a2@<W8>)
{
  __asm { BTI             j }
  unsigned int v13 = v4 + (a1 ^ v5) - 753;
  *(unsigned char *)(v8 + v13 + v3) = *(unsigned char *)(v2 + v13);
  return (*(uint64_t (**)(void))(v7 + 8 * (((v13 == 0) * v6) ^ a2)))();
}

uint64_t sub_16580()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))((v0 - 535));
}

uint64_t sub_1659C(int a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * a1))();
}

uint64_t sub_165B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  __asm { BTI             j }
  int v64 = a5 + 726;
  uint64_t v65 = (*(uint64_t (**)(uint64_t, uint64_t))(v59 + 8 * (a5 ^ 0x475)))((((LODWORD(STACK[0x204]) - 274566493 + **(_DWORD **)(a8 + 120)) + 7) & 0x1FFFFFFF8)+ (((a5 + 252) | 0xFu) ^ 0x24FLL), 8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v59 + 8 * ((26 * (v65 == 0)) ^ v64)))(v65, v66, v67, v68, 2028803494, v69, v70, &a59, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33);
}

uint64_t sub_1665C(void *a1)
{
  __asm { BTI             j }
  *a1 = 0;
  a1[1] = v1;
  return (*(uint64_t (**)(void))(v3 + 8 * (((v2 - 460 + v2 - 267 - 428) * (a1 == (void *)-16)) ^ v2)))();
}

uint64_t sub_16694()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (((((6 * (v0 ^ 0xF5) - 99) | 4) - 423) * (v1 != 0)) ^ v0)))();
}

uint64_t sub_166D4@<X0>(unsigned int a1@<W6>, int a2@<W8>)
{
  __asm { BTI             j }
  unsigned char *v2 = 49;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((11
                                * (((a2 - 42) ^ (LODWORD(STACK[0x204]) + ((a2 + 442) ^ 0xEFA2711C) > a1)) & 1)) ^ a2)))();
}

uint64_t sub_1673C()
{
  __asm { BTI             j }
  int v7 = ((((((2 * v0) ^ 0x6A8) - 468) | 0x41) + 70524799) ^ (v1 - 1705241920)) & (2 * ((v1 - 1705241920) & 0x55465FE2)) ^ (v1 - 1705241920) & 0x55465FE2;
  unsigned int v8 = ((2 * ((v1 - 1705241920) ^ 0x2C30A886)) ^ 0xF2EDEEC8) & ((v1 - 1705241920) ^ 0x2C30A886) ^ (2
                                                                                                 * ((v1 - 1705241920) ^ 0x2C30A886)) & 0x7976F764;
  int v9 = v8 ^ 0x9121124;
  int v10 = (v8 ^ 0x7020E624) & (4 * v7) ^ v7;
  unsigned int v11 = ((4 * v9) ^ 0xE5DBDD90) & v9 ^ (4 * v9) & 0x7976F760;
  int v12 = (v11 ^ 0x6152D504) & (16 * v10) ^ v10;
  unsigned int v13 = ((16 * (v11 ^ 0x18242264)) ^ 0x976F7640) & (v11 ^ 0x18242264) ^ (16 * (v11 ^ 0x18242264)) & 0x7976F740;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((103
                                * (((v1 - 1705241920) ^ (2
                                                       * ((((v13 ^ 0x68108124) << 8) & 0x7976F700 ^ 0x70769364 ^ (((v13 ^ 0x68108124) << 8) ^ 0x76F76400) & (v13 ^ 0x68108124)) & (((v13 ^ 0x11667624) & (v12 << 8) ^ v12) << 16) ^ (v13 ^ 0x11667624) & (v12 << 8) ^ v12)) ^ 0x55465FE2) != 0)) ^ v0)))();
}

uint64_t sub_168C8()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((((3 * (v1 ^ 0xAE)) ^ 0xFFFFFD45) + v1 + 273) * (v0 < 8)) ^ v1)))();
}

uint64_t sub_16920@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((((v2 - 375) | 4) ^ 0x84)
                                * (a2 + a1 - v3 + (unint64_t)(v3 - 1) + v4 - 16 < 0x20)) ^ v2)))();
}

uint64_t sub_1696C()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((39 * (v0 < ((v1 - 64) | 4u) - 244)) | v1)))();
}

uint64_t sub_169A0()
{
  __asm { BTI             j }
  v6.n128_u64[0] = 0x9191919191919191;
  v6.n128_u64[1] = 0x9191919191919191;
  return (*(uint64_t (**)(uint64_t, __n128))(v1 + 8 * (v0 + 160)))(67, v6);
}

uint64_t sub_169DC(int a1, int8x16_t a2)
{
  __asm { BTI             j }
  uint64_t v13 = v2 + v7;
  int8x16_t v14 = vaddq_s8(*(int8x16_t *)(v13 - 15), a2);
  v6[-1] = vaddq_s8(*(int8x16_t *)(v13 - 31), a2);
  *__n128 v6 = v14;
  return (*(uint64_t (**)(void))(v8 + 8 * ((((v4 ^ (v5 == 0)) & 1) * a1) ^ (v3 + 95))))();
}

uint64_t sub_16A2C()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((((((v2 + 660) | 0x26) - 584) ^ 0x152) * (v0 == v1)) ^ v2)))();
}

uint64_t sub_16A64()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((976 * ((v0 & 0x18) == ((v1 - 99) ^ 0x114))) ^ v1)))();
}

uint64_t sub_16AA0(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BTI             j }
  a1.n128_u16[0] = -28271;
  a1.n128_u8[2] = -111;
  a1.n128_u8[3] = -111;
  a1.n128_u8[4] = -111;
  a1.n128_u8[5] = -111;
  a1.n128_u8[6] = -111;
  a1.n128_u8[7] = -111;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(v8 + 8 * v7))(v6 - v5 + a5 + 9, v6 - v5 + 0xFFFFFFFFLL, (v7 - 127) + 4294967146, a1);
}

uint64_t sub_16AF4(int8x8_t *a1, uint64_t a2, uint64_t a3, int8x8_t a4)
{
  __asm { BTI             j }
  *a1 = vadd_s8(*(int8x8_t *)(v4 + (a2 & a3)), a4);
  return (*(uint64_t (**)(int8x8_t *, uint64_t))(v7 + 8 * ((14 * (v6 == 0)) ^ v5)))(a1 - 1, a2 - 8);
}

uint64_t sub_16B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                       + 8
                                                                       * (((((v3 ^ 0x1C1) + 619) ^ 0x3F8) * (v5 == v4)) ^ v3)))(a1, a2, a3, v6);
}

uint64_t sub_16B64()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 797)))();
}

uint64_t sub_16B84()
{
  __asm { BTI             j }
  *(unsigned char *)(v4 + v2) = *(unsigned char *)(v0 + (v2 - 1)) - 111;
  return (*(uint64_t (**)(void))(v5 + 8 * (((v2 != 1) * v1) ^ (v3 + 773))))();
}

uint64_t sub_16BC0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_16BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,_DWORD *a41)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v43
                              + 8
                              * ((986
                                * ((~(*a41 + v42 <= a7) + 2 * (*a41 + v42 <= a7)) != ((v41 - 67) ^ 0x6C))) ^ v41)))();
}

uint64_t sub_16C44()
{
  __asm { BTI             j }
  int v7 = v0 ^ 0x4F;
  unsigned int v8 = (v1 ^ 0xAEFFBE9D) + 2080045052 + ((2 * v1) & 0x5DFF7D3A);
  unsigned int v9 = (v8 ^ 0x91810476) & (2 * (v8 & 0xD5054967)) ^ v8 & 0xD5054967;
  unsigned int v10 = ((2 * ((v7 + 461603161 + ((v7 + 112) | 0xB1)) ^ v8)) ^ 0x9D0D9AAA) & ((v7 + 461603161 + ((v7 + 112) | 0xB1)) ^ v8) ^ (2 * ((v7 + 461603161 + ((v7 + 112) | 0xB1)) ^ v8)) & 0xCE86CD54;
  int v11 = v10 ^ 0x42824555;
  unsigned int v12 = (v10 ^ 0x8C040800) & (4 * v9) ^ v9;
  unsigned int v13 = ((4 * v11) ^ 0x3A1B3554) & v11 ^ (4 * v11) & 0xCE86CD54;
  int v14 = (v13 ^ 0xA020550) & (16 * v12) ^ v12;
  unsigned int v15 = ((16 * (v13 ^ 0xC484C801)) ^ 0xE86CD550) & (v13 ^ 0xC484C801) ^ (16 * (v13 ^ 0xC484C801)) & 0xCE86CD50;
  BOOL v16 = (v8 ^ (2
             * ((((v15 ^ 0x6820805) << 8) & 0xCE86CD00 ^ 0x6840000 ^ (((v15 ^ 0x6820805) << 8) ^ 0x86CD0000) & (v15 ^ 0x6820805)) & (((v15 ^ 0xC804C500) & (v14 << 8) ^ v14) << 16) ^ (v15 ^ 0xC804C500) & (v14 << 8) ^ v14)) ^ 0xD5054967) == 0;
  return (*(uint64_t (**)(void))(v2 + 8 * (((8 * v16) | (32 * v16)) ^ v7)))();
}

uint64_t sub_16DEC()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((1014 * (v0 < (((v1 - 473) | 0x410) ^ 0x43Cu))) ^ v1)))();
}

uint64_t sub_16E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((119
                                * (a3 - a1 + v3 - a2 - ((v4 - 579048505) & 0x2283916C ^ (unint64_t)(v5 + 376)) > 0x1F)) ^ v4)))();
}

uint64_t sub_16ED0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * (v1 + 2 * (((v0 < v1 - 328) ^ (v1 + 1)) & 1u))))();
}

uint64_t sub_16F04()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 182)))();
}

uint64_t sub_16F40()
{
  __asm { BTI             j }
  uint64_t v12 = v0 + (v5 & v3);
  long long v13 = *(_OWORD *)(v12 - 31);
  uint64_t v14 = v6 + (v5 & v3) + v1;
  *(_OWORD *)(v14 - 15) = *(_OWORD *)(v12 - 15);
  *(_OWORD *)(v14 - 31) = v13;
  return (*(uint64_t (**)(void))(v7 + 8 * (((2 * (v4 == 0)) | (32 * (v4 == 0))) ^ v2)))();
}

uint64_t sub_16F8C@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * (((29 * (v2 ^ 0x343) - 5) * (a1 == v1)) ^ v2)))();
}

uint64_t sub_16FC0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((165 * (((((v1 ^ 0x22C) - 20) ^ 0x14C) & v0) == 0)) ^ v1 ^ 0x22C)))();
}

uint64_t sub_17008()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * v0))(v1 - 7, 436);
}

uint64_t sub_17040(uint64_t a1, int a2)
{
  __asm { BTI             j }
  *(void *)(a1 + (v3 + v4) + v2) = *(void *)(v7 + (v3 + v4));
  return (*(uint64_t (**)(void))(v8 + 8 * (((v6 + v4 != 7) * ((v5 + 60) ^ a2)) ^ v5)))();
}

uint64_t sub_17080@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((((7 * (a1 ^ 0x1D0)) ^ 0x2D2) * (v2 == v1)) ^ a1)))();
}

uint64_t sub_170C0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + 155)))();
}

uint64_t sub_170DC@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  unsigned int v12 = v5 + v4 - 204;
  *(unsigned char *)(v6 + v12 + v2) = *(unsigned char *)(v1 + v12);
  return (*(uint64_t (**)(void))(v7 + 8 * (((v12 == 0) * v3) ^ a1)))();
}

uint64_t sub_17110(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v6 + 8 * ((((((v5 - 202090228) & 0xC0BA6BB) + 579) ^ 0x81) * (v7 == a5)) ^ v5)))();
}

uint64_t sub_17158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,_DWORD *a41)
{
  __asm { BTI             j }
  *a41 = a7;
  *(_DWORD *)(v41 + 12) = LODWORD(STACK[0x204]) - 274566493 + 28 * (v42 ^ 0x2FA) - 1232;
  return (*(uint64_t (**)(void))(v43 + 8 * ((459 * (*(void *)v41 != 0)) ^ v42)))();
}

uint64_t sub_171B8@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 ^ 0x7DB)))(a1 - 16, (v1 ^ 0xFFFFFD29) & *(void *)(a1 - 8));
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * v1))(v7);
}

uint64_t sub_171FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,unsigned int *a41)
{
  __asm { BTI             j }
  BOOL v47 = (*(uint64_t (**)(unint64_t, uint64_t))(v41 + 8 * (v42 ^ 0x1F1)))(((((((v42 - 1046) | 0x144u) + 0x1FB7FF200) & (2 * *a41)) + (*a41 ^ 0x6EFDFFFFFDBFF9FELL)) & 0xFFFFFFFFFFFFFFF8)- 0x6EFDFFFFFDBFF9E8, 8) == 0;
  return (*(uint64_t (**)(void))(v41
                              + 8
                              * ((((v42 + 83) ^ v47) & 1 | (2
                                                                           * (((v42 + 83) ^ v47) & 1))) ^ v42)))();
}

uint64_t sub_172A0(void *a1)
{
  __asm { BTI             j }
  *a1 = 0;
  a1[1] = v1;
  return (*(uint64_t (**)(void))(v2 + 8 * v3))();
}

uint64_t sub_172BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,_DWORD *a37)
{
  __asm { BTI             j }
  *uint64_t v38 = a4;
  unsigned int v45 = ((((v39 - 289) | 0x81) - 209729244) ^ *a37) + ((2 * *a37) & 0xE6FF936E) - 1110081537;
  int v46 = (v45 ^ 0xEAAA66B) & (2 * (v45 & 0x4EAAB64A)) ^ v45 & 0x4EAAB64A;
  unsigned int v47 = ((2 * (v45 ^ 0x9ABEE66B)) ^ 0xA828A042) & (v45 ^ 0x9ABEE66B) ^ (2 * (v45 ^ 0x9ABEE66B)) & 0xD4145020;
  int v48 = v47 ^ 0x54145021;
  int v49 = v47 & (4 * v46) ^ v46;
  unsigned int v50 = ((4 * v48) ^ 0x50514084) & v48 ^ (4 * v48) & 0xD4145020;
  int v51 = (v50 ^ 0x50104000) & (16 * v49) ^ v49;
  unsigned int v52 = ((16 * (v50 ^ 0x84041021)) ^ 0x41450210) & (v50 ^ 0x84041021) ^ (16 * (v50 ^ 0x84041021)) & 0xD4145000;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40
                                                                       + 8
                                                                       * ((81
                                                                         * ((v45 ^ (2
                                                                                  * ((((v52 ^ 0x94105021) << 8) & 0x54140000 ^ 0x14100000 ^ (((v52 ^ 0x94105021) << 8) ^ 0x14500000) & (v52 ^ 0x94105021)) & (((v52 ^ 0x40040000) & (v51 << 8) ^ v51) << 16) ^ (v52 ^ 0x40040000) & (v51 << 8) ^ v51)) ^ 0x4EAAB64A) != 0)) ^ v39)))(a1, a2, a3, v37);
}

uint64_t sub_1744C()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((54 * (v0 >= ((((v1 - 1381493914) & 0x5257EC7F) + 939) ^ (v1 + 921)))) ^ (v1 - 54))))();
}

uint64_t sub_1749C@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((104 * (a1 - a2 + 16 >= (((v2 ^ 0xD9u) - 1148) ^ 0x59uLL))) ^ v2)))();
}

uint64_t sub_174E0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((483 * (v0 < ((v1 - 929) ^ 0x111u) - 37)) ^ v1)))();
}

uint64_t sub_17518(uint64_t a1)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v1 + 127)))(a1, 4294966279);
}

uint64_t sub_17540@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  unint64_t v13 = ((v3 + 108) ^ (unint64_t)(a1 + 568)) & v4;
  long long v14 = *(_OWORD *)(v7 + v13 - 15);
  long long v15 = *(_OWORD *)(v7 + v13 - 31);
  uint64_t v16 = a2 + v13;
  *(_OWORD *)(v16 - 15) = v14;
  *(_OWORD *)(v16 - 31) = v15;
  return (*(uint64_t (**)(void))(v8 + 8 * (((v5 == 0) * v6) ^ v2)))();
}

uint64_t sub_17590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                       + 8
                                                                       * ((((21 * (v5 ^ 0x1C7)) ^ (v5 - 305))
                                                                         * (v4 == v3)) ^ v5)))(a1, a2, a3, v6);
}

uint64_t sub_175D0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2 + 8 * ((v1 + 758) ^ (446 * ((v0 & 0x18) != 0)))))();
}

uint64_t sub_17620()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v2 + 8 * v1))((v1 + 24) - (unint64_t)(v0 & 0xFFFFFFF8) - 85, 85 - (v1 + 24), v0 - 1, 1177);
}

uint64_t sub_17660(uint64_t a1, uint64_t a2, int a3, int a4)
{
  __asm { BTI             j }
  *(void *)(v7 + (a3 + v4)) = *(void *)(v6 + (a3 + v4));
  return (*(uint64_t (**)(void))(v8 + 8 * (((a1 == v4) * a4) ^ v5)))();
}

uint64_t sub_17690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                       + 8
                                                                       * (((((v5 ^ 0x24) + 26) ^ 0xBB) * (v4 == v3)) ^ v5)))(a1, a2, a3, v6);
}

uint64_t sub_176CC()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_176F8@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  unsigned int v13 = v3 - 1;
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(v7 + v13);
  return (*(uint64_t (**)(void))(v8 + 8 * (((v13 == (v1 & v2 ^ v5)) * v6) ^ v4)))();
}

uint64_t sub_17734()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * v0))();
}

uint64_t sub_1774C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  __asm { BTI             j }
  uint64_t v45 = (*(uint64_t (**)(uint64_t, void))(v39 + 8 * (v38 + 681)))(a4, v37);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v39
                                                     + 8
                                                     * (((v40 == ((68 * (v38 ^ 0x261)) ^ 0x78ED14F2))
                                                       * (((v38 - 260) | 5) + 12)) ^ v38)))(v45, a37);
}

uint64_t sub_177C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v9
                              + 8 * ((225 * (**(_DWORD **)(a8 + 136) == ((v8 + 562971162) & 0xDE71BD8F) - 271)) ^ v8)))();
}

uint64_t sub_1780C@<X0>(void *a1@<X1>, int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((*a1 == 0) ^ (3 * (a2 ^ 0x62))) & 1) * (((a2 ^ 0x162) - 8) ^ 0x36)) ^ a2)))();
}

uint64_t sub_17850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  __asm { BTI             j }
  uint64_t v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8 * (v38 + 966)))(v37 - 16, ((v38 - 226) ^ 0xFFFFFF9ALL) & *(void *)(v37 - 8));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8 * v38))(v44, a37);
}

uint64_t sub_17894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v14 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v9 + 8 * (v8 + 1145)))(*(void *)(a8 + 144), a2, 24);
  return (*(uint64_t (**)(uint64_t))(v9 + 8 * v8))(v14);
}

uint64_t sub_178CC()
{
  __asm { BTI             j }
  int v7 = v0 - 239;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v0 + 953)))(v2 - 16, ((v0 - 1618830683) & 0x607D67FE ^ 0xFFFFFC07) & *(void *)(v2 - 8));
  STACK[0x228] = 0;
  return (*(uint64_t (**)(uint64_t))(v1 + 8 * v7))(v8);
}

uint64_t sub_17924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  __asm { BTI             j }
  void *v60 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *))(v59 + 8 * (v61 - 245)))(a1, a2, a3, a4, a5, a6, a7, &a59);
}

uint64_t sub_17944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v8
                              + 8 * (((**(void **)(a8 + 144) == 0) * (((v9 + 404) | 0x110) ^ 0x3AB)) ^ (v9 + 875))))();
}

uint64_t sub_17988@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * (v2 + 953)))(a1 - 16, (((v2 - 1207947612) & 0x47FFD3FF) + 4294966279) & *(void *)(a1 - 8));
  return (*(uint64_t (**)(uint64_t))(v1 + 8 * (v2 - 239)))(v7);
}

uint64_t sub_179E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v9
                              + 8 * ((2027 * (((*(void *)(a8 + 456) == 0) ^ (v8 - 1)) & 1)) ^ v8)))();
}

uint64_t sub_17A1C@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * ((v1 + 552) ^ 0x64D)))(a1 - 16, (((8 * (v1 + 552)) ^ 0x1B18u) + 4294967015) & *(void *)(a1 - 8));
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (v1 + 552)))(v7);
}

uint64_t sub_17A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v9 + 8 * (((*(void *)(a8 + 152) == 0) * (v8 - 202)) ^ v8)))();
}

uint64_t sub_17A90@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  int v7 = v1 + 60;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void))(v2 + 8 * (v7 ^ 0x459)))(a1 - 16, *(unsigned int *)(a1 - 8));
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * v7))(v8);
}

void sub_17AC0()
{
  __asm { BTI             j }
  *(_DWORD *)(v5 + 16) = v0;
}

uint64_t sub_17B0C(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8) + 1970833367 * ((-2 - ((a1 | 0x96486C6D) + (~a1 | 0x69B79392))) ^ 0x2E13E2B9);
  uint64_t v3 = *(void *)(a1 + 16);
  unsigned int v6 = (1563560183
      * (((&v5 ^ 0x110224A5 | 0xA63DD252) + (&v5 ^ 0x202DC250 | 0x59C22DAD)) ^ 0xB06AEFC7)) ^ (v2 + 815755415);
  uint64_t v5 = v3;
  uint64_t result = (*(uint64_t (**)(uint64_t *))((char *)*(&off_5B860 + v2 + 2032038733) + 8 * v2 + 0x3C8F3C1FCLL))(&v5);
  *(void *)a1 = (8 * v7) ^ 0x1B9FB9204DC50C11;
  return result;
}

void sub_17C58(uint64_t a1)
{
  BOOL v3 = *(void *)(a1 + 24) == 0x212A7C625A6C6145 || *(void *)(a1 + 8) == 0;
  int v1 = *(_DWORD *)(a1 + 16) ^ (143647849 * ((a1 + 275267595 - 2 * (a1 & 0x1068400B)) ^ 0x71833D02));
  __asm { BRAA            X10, X17 }
}

uint64_t sub_17D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x260] = *(void *)(a8 + 8 * (a7 - 820));
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * (a7 + 315)))(13);
}

uint64_t sub_18074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  __asm { BTI             j }
  STACK[0x260] = *(void *)(a8 + 8 * v35);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 2712))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_180A4@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 8 * a2))(13, 70, 97);
}

uint64_t sub_180D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a8
                                                                      + 8
                                                                      * (((v9 != 0x30EE7232770660F1)
                                                                        * ((v8 - 809) ^ 0x373 ^ (v8 - 760276864) & 0x2D50E77C)) ^ v8)))(a1, a2, a3, (v10 + 1));
}

uint64_t sub_18138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x230] = v8;
  return (*(uint64_t (**)(void))(a8 + 8 * ((((v9 - 1013212187) & 0x3C64648F) + 356) ^ v9)))();
}

uint64_t sub_1816C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,int a33)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((a33 ^ 0x2EF) * (a4 == v33)) ^ (a7 - 771))))();
}

uint64_t sub_181A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  __asm { BTI             j }
  STACK[0x260] = *(void *)(a8 + 8 * a33);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (int)(a33 ^ 0x510 ^ ((a33 - 52) | 0x477))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_181E4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((579 * (a4 == ((a7 - 790) ^ (v8 - 34)))) ^ (a7 - 771))))();
}

uint64_t sub_1821C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  __asm { BTI             j }
  STACK[0x260] = *(void *)(a8 + 8 * v35);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (v35 + v35 + 1105 - 842)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_18250(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((1801 * (a4 == v8 + a7 - 428 - 400)) ^ a7)))();
}

uint64_t sub_18284@<X0>(uint64_t a1@<X7>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1 + 8 * (((*a17 == 0) * (((a2 ^ 0x5CD) - 814) ^ 0x123)) | a2)))();
}

uint64_t sub_182C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (int)(((*a19 == 0) * (((v19 + 814) ^ 0xFFFFFBA2) + v19 - 272)) ^ v19)))();
}

uint64_t sub_182FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (v55 + 98 * (v55 ^ 0x14) - 831)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55);
}

uint64_t sub_18348(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((a7 - 752) * (a4 == v8)) ^ (a7 - 654))))();
}

uint64_t sub_18378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((((v31 - 541) | 0x81) - 642) * (*a31 == 0)) ^ v31)))();
}

uint64_t sub_183B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (int)((((((v38 + 925769410) & 0xC8D1DCF0) + 704) ^ (v38 - 412)) * (*a38 != 0)) ^ (v38 - 284))))();
}

uint64_t sub_18404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (((7 * (v55 ^ 0x8A)) ^ 0x530) + v55)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55);
}

uint64_t sub_18444(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,int a29)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((a29 * (a4 == v29)) ^ (a7 - 654))))();
}

uint64_t sub_18478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((*v9 == 0) * ((v8 - 332) ^ v8 ^ v10 ^ 0x386)) ^ v8)))();
}

uint64_t sub_184B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((505 * (*a37 == ((v37 - 1090328536) & 0x40FD14FF) - 23)) ^ v37)))();
}

uint64_t sub_184FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (v55 + v55 + 1055 - 823)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55);
}

uint64_t sub_1852C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((((a7 - 807) | 0x160) ^ 0x3F7) * (a4 == v8)) ^ (a7 - 654))))();
}

uint64_t sub_18568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((((((v44 - 325) | 0x30C) + 390) ^ 0x424) * (*a44 == 0)) ^ v44)))();
}

uint64_t sub_185A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (v36 | (16
                                      * (((v36 - 1) ^ (*a36 == (((v36 - 1218) | 0xAu) ^ 0x1CB6BD3CF967232BLL))) & 1)))))();
}

uint64_t sub_18618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (((v55 + 1068) ^ 0x53A) + v55)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55);
}

uint64_t sub_1865C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, unint64_t a5@<X8>)
{
  __asm { BTI             j }
  LODWORD(STACK[0x214]) = v7;
  STACK[0x200] = a5;
  LODWORD(STACK[0x2BC]) = v6;
  unint64_t v13 = STACK[0x2B0];
  uint64_t v14 = (char *)&STACK[0x340] + STACK[0x2B0];
  STACK[0x220] = (unint64_t)(v14 + 0x30EE723277066101);
  STACK[0x2A0] = (unint64_t)(v14 + 0x30EE7232770660F1);
  STACK[0x2B0] = v13 + 48;
  STACK[0x280] = 0;
  STACK[0x278] = 0;
  LODWORD(STACK[0x28C]) = 0;
  LODWORD(STACK[0x22C]) = 258330652;
  LODWORD(STACK[0x268]) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a4
                                                                      + 8
                                                                      * (((a5 != 0) * (5 * (v5 ^ 0x43D) + (v5 ^ 0x40B))) ^ v5)))(a1, a2, a3, (v8 + 1));
}

uint64_t sub_18734(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((a7 - 654) ^ (786 * (a4 == v8)))))();
}

uint64_t sub_18760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (v8 - 654)))(a1, a2, a3, 590960548);
}

uint64_t sub_1877C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((a4 != v9) * (v8 - 820)) ^ (v8 - 779))))();
}

uint64_t sub_187A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((v8 - 526) ^ (v8 - 787))))();
}

uint64_t sub_187D4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((((a7 - 827) | 0x18) ^ 0x4E6) * (a4 == v8)) ^ (a7 - 771))))();
}

uint64_t sub_18810@<X0>(uint64_t a1@<X7>, unint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  __asm { BTI             j }
  *(void *)(v44 - 128) = STACK[0x240];
  int v49 = STACK[0x248];
  *(_DWORD *)(v44 - 12(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = STACK[0x248];
  STACK[0x218] = a42 + v43;
  STACK[0x2B0] = a2;
  LODWORD(STACK[0x2A8]) = 0;
  int v50 = *(_DWORD *)(v44 - 156) + *(_DWORD *)(v44 - 176);
  STACK[0x238] = a39;
  LODWORD(STACK[0x25C]) = v50 + *(_DWORD *)(v44 - 136) + v49;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 8 * ((3 * (v42 ^ 0x18A) - 1129) ^ v42)))(13, 70, 97);
}

uint64_t sub_188A8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((a4 == (a35 ^ (v35 - 981))) * ((a7 + 203) ^ 0x401)) ^ (a7 - 657))))();
}

uint64_t sub_188E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,unsigned int a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  __asm { BTI             j }
  int v53 = STACK[0x2A8];
  uint64_t v54 = (LODWORD(STACK[0x2A8]) + 1 + LODWORD(STACK[0x25C]));
  LODWORD(STACK[0x2D0]) = v54;
  LODWORD(STACK[0x2D4]) = v53 + 1;
  BOOL v55 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 8 * (a35 ^ 0x14A)))(((((9 * (a35 ^ 0x478) + 855) | 0x89) + 0x1FFFFFB6DLL) & (v54 + 7)) + 16, 8) == 0;
  return (*(uint64_t (**)(void))(a49 + 8 * ((224 * v55) ^ a35)))();
}

uint64_t sub_1897C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *a1 = 0;
  a1[1] = v8;
  return (*(uint64_t (**)(void))(a8 + 8 * v9))();
}

uint64_t sub_18998@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X7>, unint64_t a6@<X8>, __n128 a7@<Q0>, __n128 a8@<Q1>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  __asm { BTI             j }
  STACK[0x2C8] = a6;
  BOOL v56 = LODWORD(STACK[0x2D0]) > ((2 * v51) ^ 0x62E1B310u);
  if (v50 - 1658958406 < (v51 ^ 0x4ACu) - 1658959438 == v56) {
    BOOL v56 = v50 - 1658958406 <= (LODWORD(STACK[0x2D0]) - 1658958407);
  }
  v57.n128_u64[0] = 0xA1A1A1A1A1A1A1A1;
  v57.n128_u64[1] = 0xA1A1A1A1A1A1A1A1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128))(a5 + 8 * ((75 * v56) ^ v51)))(a1, a2, a3, 590933545, a4, 19, a50, a7, a8, v57);
}

uint64_t sub_18A30@<X0>(uint64_t a1@<X7>, unsigned char *a2@<X8>)
{
  __asm { BTI             j }
  *a2 = 48;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (((LODWORD(STACK[0x2A8])
                                 + (((v2 ^ 0x1E) + 655) ^ 0xC0F49699)
                                 - ((2 * LODWORD(STACK[0x2A8])) & 0x81E92A9C) != 0xC0F4954E)
                                * ((9 * (v2 ^ 0x10A)) ^ 0x3E6)) ^ v2 ^ 0x1E)))();
}

uint64_t sub_18AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8 * (((((v8 < 8) ^ (-49 * ((v9 + 40) ^ 0xFB) + 1)) & 1) * v10) ^ v9)))();
}

uint64_t sub_18B14@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((510
                                * (v4
                                 - a2
                                 - v2
                                 + ((v3 - 1138979587) & 0x43E3733F ^ 0xCF118DCD88F99C33)
                                 + v2
                                 + v3
                                 + 382
                                 - 1150 < 0x20)) ^ v3)))();
}

uint64_t sub_18B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((v8 >= ((v9 - 377) | 0x38u) - 796) * (v9 - 947)) ^ v9)))();
}

uint64_t sub_18BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a8 + 8 * (v8 - 235)))(a1, 967, 47);
}

uint64_t sub_18BE4@<X0>(unint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X7>, uint64_t a4@<X8>, int8x16_t a5@<Q2>)
{
  __asm { BTI             j }
  uint64_t v15 = v5 + (v6 - v9 - 1);
  uint64_t v16 = a4 + v6 - v9;
  int8x16_t v17 = veorq_s8(*(int8x16_t *)(v15 - 31), a5);
  *(int8x16_t *)(v16 - 15) = veorq_s8(*(int8x16_t *)(v15 - 15), a5);
  *(int8x16_t *)(v16 - 31) = v17;
  return (*(uint64_t (**)(void))(a3 + 8 * (((((v7 + 171) ^ a1) + v9 == v8) * a2) ^ v10)))();
}

uint64_t sub_18C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (int)(((((v10 - 171) ^ 0xFFFFFEA8) + v10 - 367) * (v9 == v8)) ^ v10)))();
}

uint64_t sub_18C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((241 * (((303 * ((v9 + 1772823814) & 0x9654DBBD ^ 0x338) - 1188) & v8) == 0)) ^ v9)))();
}

uint64_t sub_18CC0@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a1 + 8 * v2))(a2 - 7);
}

uint64_t sub_18CF8(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(int8x8_t *)(a1 + v8 - v1(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = veor_s8(*(int8x8_t *)(v12 + (v8 - v10 - 1)), v13);
  return (*(uint64_t (**)(void))(a8 + 8 * (((((3 * (v9 ^ a4)) ^ a5) + v10 != v11) * a3) ^ v9)))();
}

uint64_t sub_18D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((((v10 ^ 0x276) + 162) ^ v10 ^ 0x276) * (v9 != v8)) ^ v10)))();
}

uint64_t sub_18D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 592)))();
}

uint64_t sub_18D80@<X0>(int a1@<W5>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  *(unsigned char *)(a3 + v5) = *(unsigned char *)(v3 + (v5 - 1)) ^ v6;
  return (*(uint64_t (**)(void))(a2 + 8 * (((v5 == 1) * a1) | v4)))();
}

uint64_t sub_18DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 500)))();
}

uint64_t sub_18DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a8 + 8 * ((1478 * (v8 == v10)) ^ (v9 - 375))))(a1, a2, a3, (v11 - 3));
}

uint64_t sub_18E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (int)(((*a65 + v67 + v65 + ((v66 + 1938606211) & 0x8C7335F6) - 1468 > LODWORD(STACK[0x2D0]))
                                     * ((((v66 + 1938606211) & 0x8C7335F6) + 115) ^ (v66 + 1938606211) & 0x8C7335F6 ^ 0x3EC)) ^ (v66 + 1938606211) & 0x8C7335F6)))();
}

uint64_t sub_18E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  int v14 = v9 - ((2 * v9) & 0x81E92A9C) + ((55 * (v8 ^ 0x24E)) ^ 0xC0F49102) != 0xC0F4954E;
  return (*(uint64_t (**)(void))(a8 + 8 * (((v14 << 6) | (v14 << 7)) ^ v8)))();
}

uint64_t sub_18ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8 * ((45 * (v8 < (((v9 ^ 0x2C7) + 84) ^ ((v9 ^ 0x2C7) + 671) ^ 0x3C5u))) ^ v9 ^ 0x2C7)))();
}

uint64_t sub_18F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (v9 ^ (2 * ((unint64_t)(v10 - 0x12602456C106A293 - a3 - a1 - v8) < 0x20)))))();
}

uint64_t sub_18FB0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((25 * (v8 >= (a2 ^ 0x3E0u))) ^ a2)))((a2 + 380827131) & 0xE94D07F6);
}

uint64_t sub_18FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * (v9 - 560)))(v8 - 1);
}

uint64_t sub_19020(uint64_t a1, double a2, double a3, int8x16_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, int a9, uint64_t a10, uint64_t a11)
{
  __asm { BTI             j }
  unint64_t v22 = (((v13 ^ a8) * a9) ^ (unint64_t)(v16 + 34)) & a1;
  int8x16_t v23 = *(int8x16_t *)(v17 + v22 - 15);
  int8x16_t v24 = *(int8x16_t *)(v17 + v22 - 31);
  uint64_t v25 = v11 + v22 + v12;
  *(int8x16_t *)(v25 - 15) = veorq_s8(v23, a4);
  *(int8x16_t *)(v25 - 31) = veorq_s8(v24, a4);
  return (*(uint64_t (**)(uint64_t))(a11 + 8 * (((a6 == 0) * v15) ^ v14)))(a1 - 32);
}

uint64_t sub_19080(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((((a2 - 157) ^ (a2 - 192) ^ 0x1D) * (v9 == v8)) ^ a2)))();
}

uint64_t sub_190B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((7 * ((a3 - 505915200) & 0x1E27A7FE ^ 0x302) - 186) * ((v8 & 0x18) == 0)) ^ a3)))();
}

uint64_t sub_19108(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a1))();
}

uint64_t sub_19134(int a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(int8x8_t *)(v10 + (~v11 + v9) + v8) = veor_s8(*(int8x8_t *)(a6 + (~v11 + v9)), v14);
  return (*(uint64_t (**)(void))(a8 + 8 * ((((((a1 - 428) | v12) ^ a5) + v11 == a2) * v13) ^ a1)))();
}

uint64_t sub_1917C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((a3 ^ 0x36C ^ (18 * (a3 ^ 0x60))) * (a2 == v8)) ^ a3)))();
}

uint64_t sub_191C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 + 41)))();
}

uint64_t sub_191D4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  unsigned int v20 = v12 - 1;
  *(unsigned char *)(v8 + v20 + v9) = *(unsigned char *)(v15 + v20) ^ v14;
  return (*(uint64_t (**)(void))(a8 + 8 * (((v20 == ((v11 - 226) ^ a4)) * v13) ^ v10)))();
}

uint64_t sub_19214(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a1))();
}

uint64_t sub_1924C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((29
                                * ((((*a69 + v69 <= v70) ^ (v71 - 109)) + 2 * (*a69 + v69 <= v70)) == 223)) ^ v71)))();
}

uint64_t sub_192A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  int v13 = (a1 ^ 0x3CFD7CFF)
      - 134749280
      + ((a1 << (v8 - 66 + v8 - 97 + 12)) & 0x79FAF9FE);
  unsigned int v14 = (v13 ^ 0xEA40DF48) & (2 * (v13 & 0xCB0A9F61)) ^ v13 & 0xCB0A9F61;
  unsigned int v15 = ((2 * (v13 ^ 0x7E50C388)) ^ 0x6AB4B9D2) & (v13 ^ 0x7E50C388) ^ (2 * (v13 ^ 0x7E50C388)) & 0xB55A5CE8;
  unsigned int v16 = v15 ^ 0x954A4429;
  int v17 = (v15 ^ 0x20101880) & (4 * v14) ^ v14;
  unsigned int v18 = ((4 * v16) ^ 0xD56973A4) & v16 ^ (4 * v16) & 0xB55A5CE8;
  unsigned int v19 = (v18 ^ 0x954850A0) & (16 * v17) ^ v17;
  unsigned int v20 = ((16 * (v18 ^ 0x20120C49)) ^ 0x55A5CE90) & (v18 ^ 0x20120C49) ^ (16 * (v18 ^ 0x20120C49)) & 0xB55A5CC0;
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((77
                                * ((v13 ^ (2
                                         * ((((v20 ^ 0xA05A1069) << 8) & 0x355A0000 ^ 0x10580000 ^ (((v20 ^ 0xA05A1069) << 8) ^ 0x5A5C0000) & (v20 ^ 0xA05A1069)) & (((v20 ^ 0x15004C00) & (v19 << 8) ^ v19) << 16) ^ (v20 ^ 0x15004C00) & (v19 << 8) ^ v19)) ^ 0xCB0A9F61) != 0)) ^ (v8 - 844))))();
}

uint64_t sub_19444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v9 ^ (53 * (v8 > 7)))))();
}

uint64_t sub_194CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  int v15 = v9 - 949;
  BOOL v16 = v10 - 0x28E4089230DE447DLL - a1 - v8 - a3 + 848 >= (unint64_t)((v9 - 206) ^ 0x93u) - 911;
  return (*(uint64_t (**)(void))(a8 + 8 * ((v16 | (8 * v16)) ^ v15)))();
}

uint64_t sub_1952C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((v8 < ((a2 - 144) ^ v9)) * (a2 - 845)) ^ a2)))();
}

uint64_t sub_1955C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (a2 - 178)))(0, (v8 & 0xFFFFFFE0) - 32, a3, a4, 140);
}

uint64_t sub_19588(uint64_t a1, uint64_t a2, double a3, double a4, int8x16_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  __asm { BTI             j }
  uint64_t v20 = (a1 ^ v15 ^ v14 ^ a8) + v13;
  int8x16_t v21 = *(int8x16_t *)(a9 + v20 - 15);
  int8x16_t v22 = *(int8x16_t *)(a9 + v20 - 31);
  uint64_t v23 = v11 + v12 + v20;
  *(int8x16_t *)(v23 - 15) = veorq_s8(v21, a5);
  *(int8x16_t *)(v23 - 31) = veorq_s8(v22, a5);
  _ZF = a2 == a1;
  uint64_t v24 = a1 + 32;
  int v25 = !_ZF;
  return (*(uint64_t (**)(uint64_t))(a11 + 8 * ((v25 | (8 * v25)) ^ (v14 - 72))))(v24);
}

uint64_t sub_195E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((2 * (((((v9 ^ 0x3A0) * v11) ^ (v10 == v8)) & 1) == 0)) & 0xFB | (4
                                                                                                  * ((((v9 ^ 0xA0) * v11) ^ ~(v10 == v8)) & 1))) ^ v9)))();
}

uint64_t sub_19628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (int)((((v8 & 0x18) == (v9 ^ 0x3B0)) * ((v9 ^ 0x7D) + 977)) ^ v9 ^ 0x7D)))();
}

uint64_t sub_19670(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a1))();
}

uint64_t sub_196B4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v20 = (v12 + ((a1 + v11) & v13) + 743) & a3;
  *(int8x8_t *)(v9 + v20 + v8) = veor_s8(*(int8x8_t *)(v10 + v20), v15);
  return (*(uint64_t (**)(void))(a8 + 8 * (((a4 == 0) * v14) ^ a1)))();
}

uint64_t sub_19700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((v9 + 1130) * (a2 == v8)) ^ v9)))((v9 + 123));
}

uint64_t sub_19730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 + 246)))();
}

uint64_t sub_19744(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  unsigned int v18 = v11 - 1;
  *(unsigned char *)(v8 + v18 + v9) = *(unsigned char *)(a6 + v18) ^ v13;
  return (*(uint64_t (**)(void))(a8 + 8 * (((v18 == 0) * (((v12 - 812) | 0xC0) ^ a4)) ^ v10)))();
}

uint64_t sub_19784(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a1))();
}

uint64_t sub_197AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  BOOL v15 = *(_DWORD *)STACK[0x238] + v8 <= v9;
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((((v15 ^ 0x47) + 2 * v15 == ((v10 - 92) ^ 0xC8))
                                * ((v10 + 540) ^ 0x7F1)) ^ v10)))();
}

uint64_t sub_1980C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  unsigned int v14 = (v9 ^ 0xBEDF7FFF) - 436212076 + ((2 * v9) & 0x7DBEFFFE);
  int v15 = (v14 ^ 0x5B0AD968) & (2 * (((v8 + 15) ^ 0x5B2090F3) & v14)) ^ ((v8 + 15) ^ 0x5B2090F3) & v14;
  int v16 = ((2 * (v14 ^ 0x794BDB6A)) ^ 0x44D6940E) & (v14 ^ 0x794BDB6A) ^ (2 * (v14 ^ 0x794BDB6A)) & 0x226B4A06;
  int v17 = v16 ^ 0x22294A01;
  int v18 = (v16 ^ 0x22B0005) & (4 * v15) ^ v15;
  unsigned int v19 = ((4 * v17) ^ 0x89AD281C) & v17 ^ (4 * v17) & 0x226B4A04;
  int v20 = (v19 ^ 0x290803) & (16 * v18) ^ v18;
  int v21 = ((16 * (v19 ^ 0x22424203)) ^ 0x26B4A070) & (v19 ^ 0x22424203) ^ (16 * (v19 ^ 0x22424203)) & 0x226B4A00;
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((42
                                * ((v14 ^ (2
                                         * ((((v21 ^ 0x4B4A07) << 8) & 0x226B4A00 ^ 0x224A4807 ^ (((v21 ^ 0x4B4A07) << 8) ^ 0x6B4A0700) & (v21 ^ 0x4B4A07)) & (((v21 ^ 0x22200007) & (v20 << 8) ^ v20) << 16) ^ (v21 ^ 0x22200007) & (v20 << 8) ^ v20)) ^ 0x5B20916D) != 0)) ^ v8)))();
}

uint64_t sub_199A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((((((v9 ^ 0x53E) - 1172) | 0x330) ^ 0x33E) * (v8 < 8)) | v9 ^ 0x53E)))();
}

uint64_t sub_19A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (v14 ^ (244
                                      * ((unint64_t)(v15 + 0x5F1FF4AA3BBBD428 + a13 - a2 - v13 - a1) < 0x20)))))();
}

uint64_t sub_19A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((((((((v9 - 531) | 0x200) - 749) | 0x300) + 445) ^ ((((v9 - 531) | 0x200) + 406) | 0x40))
                                * (v8 > 0x1F)) ^ ((v9 - 531) | 0x200))))();
}

uint64_t sub_19AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 86)))(0);
}

uint64_t sub_19AF8(uint64_t a1, int a2, double a3, double a4, int8x16_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  __asm { BTI             j }
  uint64_t v20 = (~a1 + v13);
  int8x16_t v21 = *(int8x16_t *)(a9 + v20 - 15);
  int8x16_t v22 = *(int8x16_t *)(a9 + v20 - 31);
  uint64_t v23 = v11 + v20 + v12;
  *(int8x16_t *)(v23 - 15) = veorq_s8(v21, a5);
  *(int8x16_t *)(v23 - 31) = veorq_s8(v22, a5);
  return (*(uint64_t (**)(void))(a11 + 8 * (a2 ^ (16 * (((v15 + 311) ^ a7) + a1 == v14)))))();
}

uint64_t sub_19B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((((v9 == v8) ^ (v10 + 74)) & 1) * (7 * (v10 ^ 0x44A) - 391)) ^ v10)))();
}

uint64_t sub_19B98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v9 & 0x154A236B ^ (224 * ((v8 & 0x18) == 0)))))();
}

uint64_t sub_19BF4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 8 * a1))((v8 & 0xFFFFFFF8) - 8, 1984675549);
}

uint64_t sub_19C4C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v19 = ((((v11 + v13) & a2) - 602) ^ v10) + v9;
  *(int8x8_t *)(a4 + v19 + v8) = veor_s8(*(int8x8_t *)(v12 + v19), v14);
  return (*(uint64_t (**)(void))(a8 + 8 * (v11 + 4 * (a1 != v10))))();
}

uint64_t sub_19C90(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((((7 * (a3 ^ 0x260)) ^ (4 * (a3 ^ 0x296)) ^ 0x289) * (a10 == v10)) ^ a3)))();
}

uint64_t sub_19CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 591)))();
}

uint64_t sub_19CF4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v20 = (v12 - 1);
  *(unsigned char *)(v8 + v20 + v9) = *(unsigned char *)(a6 + v20) ^ v14;
  return (*(uint64_t (**)(void))(a8 + 8 * (((v20 == (((v11 - 559) | v15) ^ a4)) * v13) ^ v10)))();
}

uint64_t sub_19D38(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a1))();
}

uint64_t sub_19D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8 * (((*a72 + v72 <= v73) * (7 * (v74 ^ 0x1D2) + ((v74 - 413) | 0x406) - 1468)) ^ v74)))();
}

uint64_t sub_19DB4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((((a1 ^ 0x143) - 441) ^ 0x19D) * (v8 - ((2 * v8) & 0xEB2B369A) == 0)) | a1)))();
}

uint64_t sub_19E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * (v9 ^ (210 * (v8 > 7)))))(v8);
}

uint64_t sub_19E98(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8
                                            + 8
                                            * (((22 * (a2 ^ 0x227) - 681)
                                              * ((unint64_t)(0x5F7F77DFF3E932E3 - a5 - v8 + v9 - a4) < 0x20)) ^ a2)))(v10);
}

uint64_t sub_19EF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((v8 < ((a3 - 448) | 0x23Cu) - 796) * ((a3 - 1136329409) & 0x43BB02F5 ^ 0x2ED)) | a3)))();
}

uint64_t sub_19F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * (v8 - 229)))(a1);
}

uint64_t sub_19F6C(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v15 = v9 + a3;
  long long v16 = *(_OWORD *)(v15 - 31);
  uint64_t v17 = v8 + a3 + v10;
  *(_OWORD *)(v17 - 15) = *(_OWORD *)(v15 - 15);
  *(_OWORD *)(v17 - 31) = v16;
  return (*(uint64_t (**)(void))(a8 + 8 * (((a4 == 0) * a1) | a2)))();
}

uint64_t sub_19FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (int)(((((v10 - 808) ^ 0xFFFFFE07) + ((v10 - 808) | 0x203)) * (v9 == v8)) ^ (v10 - 163))))();
}

uint64_t sub_19FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                                           + 8
                                           * ((41 * ((v8 & 0x18) != (((v9 ^ 0x10A) - 137) | 0x260u) - 757)) ^ v9 ^ 0x10A)))(v8 & 0x1F);
}

uint64_t sub_1A034(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a8 + 8 * a2))(v10 & 7, ~v11, (v12 + a2 - 45 + 109) & v10, v9 - 7, v8 - 7);
}

uint64_t sub_1A06C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v18 = (v13 + ((v10 - 698) | v12) + 542) & (v9 + a2);
  *(void *)(a5 + v18 + v8) = *(void *)(a4 + v18);
  return (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 8 * (((a3 + a2 != 7) * v11) ^ v10)))(a1, a2 - 8);
}

uint64_t sub_1A0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8 * (int)((((5 * (v9 ^ 0x175) + 600208870) & 0xDC398B3E ^ 0x39B) * (a3 == v8)) ^ v9)))();
}

uint64_t sub_1A104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 626)))();
}

uint64_t sub_1A118(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  unsigned int v18 = a1 + v12 - 293 - 536;
  *(unsigned char *)(v8 + v18 + v1(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(unsigned char *)(v9 + v18);
  return (*(uint64_t (**)(void))(a8 + 8 * (((v18 == 0) * v13) ^ v11)))();
}

uint64_t sub_1A150(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a2))();
}

uint64_t sub_1A178@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, unsigned int a5@<W8>)
{
  __asm { BTI             j }
  if (v5 - 225914472 - v7 + v6 + 1031 == v8 - 225913855) {
    uint64_t v14 = v9;
  }
  else {
    uint64_t v14 = a5;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8 * v8))(a1, a2, a3, v14);
}

uint64_t sub_1A1B0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (int)(((((v8 + 1154726518) & 0xBB2C41BB) - 23) * (a4 == v9)) ^ v8)))();
}

uint64_t sub_1A1F0@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  __asm { BTI             j }
  STACK[0x2B0] -= 16;
  return (*(uint64_t (**)(void))(a1 + 8 * (int)(((a2 + 2322870) & 0xFFDC8FF9 ^ 0x127) + a2)))();
}

uint64_t sub_1A23C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45)
{
  __asm { BTI             j }
  STACK[0x298] = *(void *)(a4 + 8 * a5);
  STACK[0x270] = a45 + v46;
  STACK[0x2B0] = v46 + ((v45 - 1685680685) & 0x6479737F) - 812;
  LODWORD(STACK[0x26C]) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a4 + 8 * ((1011 * (v47 == 0)) ^ v45)))(a1, a2, a3, (v48 + 1));
}

uint64_t sub_1A2B0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  int v14 = v8 + 59;
  BOOL v16 = a4 != ((v8 - 566) ^ (v9 - 258)) && v10 != 0;
  return (*(uint64_t (**)(void))(a8 + 8 * ((250 * v16) ^ v14)))();
}

uint64_t sub_1A2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8 * ((((v8 ^ (*v9 == 0)) & 1) == 0) | (16 * (((v8 ^ (*v9 == 0)) & 1) == 0)) | v8)))();
}

uint64_t sub_1A318@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  __asm { BTI             j }
  uint64_t v50 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8 * (v43 ^ 0x40B)))(a2 - 16, ((v43 + 566) + v44) & *(void *)(a2 - 8));
  *int v45 = 0;
  return (*(uint64_t (**)(uint64_t))(a43 + 8 * v43))(v50);
}

uint64_t sub_1A36C()
{
  __asm { BTI             j }
  STACK[0x2B0] -= 16;
  return ((uint64_t (*)(void))STACK[0x298])();
}

uint64_t sub_1A38C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * (v8 + 394)))(13);
}

uint64_t sub_1A3B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((v10 == 0) * ((v8 ^ v11) + 235)) ^ v9)))();
}

uint64_t sub_1A3EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a8 + 8 * (v8 + v8 + 1206 - 1139)))(a1, 70, 97);
}

uint64_t sub_1A420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x208] = v8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a8
                                                                      + 8
                                                                      * (((v10 == 0x30EE7232770660F1)
                                                                        * ((v9 ^ 0x68) + ((v9 - 661) | 0x118) - 1945)) ^ v9)))(a1, a2, a3, (v11 + 1));
}

uint64_t sub_1A47C@<X0>(uint64_t a1@<X7>, unsigned int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1 + 8 * (v2 ^ (4 * (a2 <= (v2 ^ 0x4D4) + ((v2 + 179376425) & 0xF54EEB5F) - 224)))))();
}

uint64_t sub_1A4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * v49))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49);
}

uint64_t sub_1A4DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, char a5@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(v6 - 0x30EE7232770660F1) = (((v5 - 6) | 0x3C) ^ 0x9D) + a5 - ((2 * a5) & 0x42);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8 * v5))(a1, a2, a3, 590960548);
}

uint64_t sub_1A52C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((v8 - 1431236650) & 0x554EF0AF ^ 0x17F) + v8)))();
}

uint64_t sub_1A564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((53 * (v8 < (unint64_t)((v9 - 133) | 0x220u) + 64986)) ^ v9)))();
}

uint64_t sub_1A5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * v8))();
}

uint64_t sub_1A5D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 + 411)))();
}

uint64_t sub_1A604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((117 * (((v8 >> (((8 * v9) ^ 8) + v11 + 3 * (((v10 + 95) | 0x20) ^ 0x2Cu))) & 1) == 0)) ^ v10)))();
}

uint64_t sub_1A654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * v8))();
}

uint64_t sub_1A6F4@<X0>(uint64_t (*a1)(void)@<X8>)
{
  __asm { BTI             j }
  return a1();
}

uint64_t sub_1A700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * ((37 * (((((v57 ^ 0x62) - 98) ^ ((v57 ^ 0xCE) + 50) ^ (~(BYTE4(a35) & 0xEE) + (v57 ^ a1))) - 110) > 0xF0u)) ^ ((int)a7 - 547))))(a1, a2, a3, (v58 + 2), a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57);
}

uint64_t sub_1A784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  *(unsigned char *)(a47 - 0x30EE7232770660F1) = -93;
  *(unsigned char *)(a47 - 0x30EE7232770660F(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = a68;
  return (*(uint64_t (**)(void))(a8 + 8 * (v68 + v68 + 1166 - 1087)))();
}

uint64_t sub_1A7E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,int a40,char a41)
{
  __asm { BTI             j }
  BOOL v47 = ((((v41 ^ 0x87) + 121) ^ ((v41 ^ 0xC0) + 64) ^ ((v41 ^ 0xE6) + 26)) + a41 - 6) > 0x10u;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a8 + 8
                                                                           * (((4 * v47) | (8 * v47)) ^ (a7 + 313))))(a1, a2, a3, (v42 - 2));
}

uint64_t sub_1A844@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, unsigned int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,int a37,int a38)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4
                                                                       + 8
                                                                       * ((103
                                                                         * (a5 <= ((a38 ^ 0x94) - 56))) ^ a38)))(a1, a2, a3, 590933545);
}

uint64_t sub_1A880(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  if (v70 == 94) {
    return (*(uint64_t (**)(void))(a8 + 8 * ((a7 - 822) ^ a3)))();
  }
  if (v70 == 95) {
    return (*(uint64_t (**)(void))(a8 + 8 * (a7 - 482)))();
  }
  *(unsigned char *)(a70 - 0x30EE7232770660F1) = (2 * v71 - v70 + 93) ^ 0x21;
  return (*(uint64_t (**)(void))(a8 + 8 * (a7 - 531)))();
}

uint64_t sub_1A990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * ((85 * ((((v49 ^ 0xA6) - 33) ^ (v48 == 0x30EE7232770660F1)) & 1)) ^ v49)))((v49 ^ 0x7A6u) - 289, a2, a3, (v50 + 1), a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

uint64_t sub_1A9E8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((((((v8 ^ 0x92 ^ (a1 + 26)) + 89) ^ ((v8 ^ 0xCB) + 53) ^ (((a1 - 78) ^ v8) + 51))
                                                   - 104) > 0xF6u)
                                * v9) ^ a1)))();
}

uint64_t sub_1AA4C@<X0>(uint64_t a1@<X7>, unsigned int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((1629
                                * (((v2 < a2) | (2 * (v2 < a2))) == (((v3 - 123) ^ 0xDB) + v3 + 106))) ^ v3)))();
}

uint64_t sub_1AA9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((91
                                * (((((v8 ^ 0xBA) + 70) ^ ((v8 ^ 2) - 2) ^ ((((v9 ^ 0x2C) + 102) ^ v8)
                                                                                           - 25))
                                                   - 103) < (v9 ^ 0x67u))) ^ v9)))();
}

uint64_t sub_1AB04@<X0>(uint64_t a1@<X7>, unsigned int a2@<W8>)
{
  __asm { BTI             j }
  BOOL v9 = v3 + (v4 ^ 0x52Cu) - 229 - 185 + v2 <= a2;
  return (*(uint64_t (**)(void))(a1 + 8 * ((100 * ((v9 ^ 0xFFFFFFCF) + 2 * v9 != -49)) ^ v4)))();
}

uint64_t sub_1AB58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(unsigned char *)(v11 + (v10 + v8) - 0x30EE7232770660F1) = HIBYTE(v9)
                                                                    - ((((v12 - 23) | 0x51) ^ 0x9A) & (2 * HIBYTE(v9)))
                                                                    - 95;
  return (*(uint64_t (**)(void))(a8 + 8 * v12))();
}

uint64_t sub_1ABAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((631
                                * (((((v8 ^ 0x98) + 104) ^ ((v8 ^ 0x48) - 72) ^ ((v8 ^ 0x71)
                                                                                                + ((v9 - 36) ^ 0x88)
                                                                                                + 82))
                                                   - 102) < 0xF9u)) ^ v9)))();
}

uint64_t sub_1AC14@<X0>(uint64_t a1@<X7>, unsigned int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)(((((v4 - 1596130776) & 0x5F2303FB) + ((v4 + 876867082) & 0xCBBC0EFA) - 536)
                                     * (v3 + 1 + v2 > a2)) ^ v4)))();
}

uint64_t sub_1AC7C(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  __asm { BTI             j }
  *(unsigned char *)(a51 + (v53 + v51) - 0x30EE7232770660F1) = BYTE6(v52)
                                                                     - ((HIWORD(v52) << (a1 + 40)) & 0x42)
                                                                     - 95;
  return (*(uint64_t (**)(void))(a8 + 8 * a1))();
}

uint64_t sub_1ACD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((99
                                * (((((v8 ^ 0x1D) - 29) ^ ((v8 ^ 0xAC) + 84) ^ ((v8 ^ 0x10)
                                                                                               + ((v9 - 21) ^ 0x87)
                                                                                               + 65))
                                                   - 101) < 0xFAu)) ^ v9)))();
}

uint64_t sub_1AD34@<X0>(uint64_t a1@<X7>, unsigned int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((25
                                * (((v3 + 1 + v2 <= a2) | (2 * (v3 + 1 + v2 <= a2))) != ((v4 ^ 0x15) - 61))) ^ v4)))();
}

uint64_t sub_1AD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  __asm { BTI             j }
  *(unsigned char *)(a51 + (v53 + v51) - 0x30EE7232770660F1) = BYTE5(v52)
                                                                     - ((2 * BYTE5(v52)) & 0x42)
                                                                     + ((v54 - 126) & 0xEF ^ 0xE);
  return (*(uint64_t (**)(void))(a8 + 8 * v54))();
}

uint64_t sub_1ADE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((108
                                * (((((v8 ^ 0x21) - 33) ^ ((v8 ^ 0xBB) + 69) ^ (((v9 + 6) & 0xEE ^ (v9 + 48) & 0xFC ^ 0xBD)
                                                                                               + (v8 ^ 0x3B)))
                                                   - 100) > 0xFAu)) ^ v9)))();
}

uint64_t sub_1AE78@<X0>(uint64_t a1@<X7>, unsigned int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (((((v3 + 1 + v2 <= a2) | (2 * (v3 + 1 + v2 <= a2))) != 0)
                                * ((65 * (v4 ^ 0x2DF)) ^ 0x113)) ^ v4)))();
}

uint64_t sub_1AEE0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  __asm { BTI             j }
  *(unsigned char *)(a51 + (v53 + v51) - 0x30EE7232770660F1) = BYTE4(v52)
                                                                     - ((HIDWORD(v52) << (a1 ^ 0xC2)) & 0x42)
                                                                     - 95;
  return (*(uint64_t (**)(void))(a8 + 8 * a1))();
}

uint64_t sub_1AF3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((1549
                                * (((((v8 ^ 0x34) + (v9 ^ 0xEE) - 126) ^ ((v8 ^ 0x2D) - 45) ^ (((v9 + 83) & 0xDF ^ 0x9F) + (v8 ^ 0xB8)))
                                                   - 99) < 0xFCu)) ^ v9)))();
}

uint64_t sub_1AFBC@<X0>(uint64_t a1@<X7>, unsigned int a2@<W8>)
{
  __asm { BTI             j }
  BOOL v9 = ((93 * (v4 ^ 0x248)) ^ 0xBBu) + v3 + v2 <= a2;
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((200 * (((((v4 ^ 0x48) - 94) ^ 0xDB ^ v9) + 2 * v9) != 127)) ^ v4)))();
}

uint64_t sub_1B028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  __asm { BTI             j }
  *(unsigned char *)(a51 + (v53 + v51) - 0x30EE7232770660F1) = (v54 - 3) ^ HIBYTE(v52);
  return (*(uint64_t (**)(void))(a8 + 8 * v54))();
}

uint64_t sub_1B068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((1648
                                * (((((v8 ^ 0xB4) + 76) ^ ((v8 ^ 0xC7) + 57) ^ ((v8 ^ (v9 + 100) & 0xE6 ^ 0xF0)
                                                                                               + 46))
                                                   - 98) < 0xFDu)) ^ v9)))();
}

uint64_t sub_1B0D4@<X0>(uint64_t a1@<X7>, unsigned int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((158 * (((((v4 - 69) | 0x45) - 540) ^ (v4 - 644511192) & 0x266A73BAu) + v3 + v2 <= a2)) ^ (v4 - 350))))();
}

uint64_t sub_1B138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  __asm { BTI             j }
  *(unsigned char *)(a51 + (v53 + v51) - 0x30EE7232770660F1) = (v52 >> ((v54 + 75) ^ 0x32u)) ^ v55;
  return (*(uint64_t (**)(void))(a8 + 8 * v54))();
}

uint64_t sub_1B180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  BOOL v14 = ((((v8 ^ 0x7F) - 127) ^ ((v8 ^ 0x53) - 83) ^ ((v8 ^ 0xB1 ^ ((v9 - 30) | 0x38)) + 115))
                        + (((v9 + 1) | 0x18) ^ 0xA4)) < 0xFEu;
  return (*(uint64_t (**)(void))(a8 + 8 * (((2 * v14) | (4 * v14)) ^ v9)))();
}

uint64_t sub_1B1F4@<X0>(uint64_t a1@<X7>, unsigned int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1 + 8 * ((114 * ((((6 * (v4 ^ 0x424) + 70) | 0x22) ^ 0x123u) + v3 + v2 > a2)) ^ v4)))();
}

uint64_t sub_1B24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  __asm { BTI             j }
  *(unsigned char *)(a51 + (v53 + v51) - 0x30EE7232770660F1) = (v52 >> ((v54 + 26) ^ 0x34u)) ^ v55;
  return (*(uint64_t (**)(void))(a8 + 8 * v54))();
}

uint64_t sub_1B2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a8
                                                                       + 8
                                                                       * ((186
                                                                         * (v8 == (11 * (v9 ^ 0x79) - 86))) ^ v9)))(a1, a2, a3, 590960548);
}

uint64_t sub_1B2F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, unsigned int a5@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4
                                                                       + 8
                                                                       * (((((v7 ^ 0x24D) + 62) ^ 0x13F)
                                                                         * (v5 + v6 + 1 <= a5)) ^ v7)))(a1, a2, a3, 590933545);
}

uint64_t sub_1B338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  __asm { BTI             j }
  *(unsigned char *)(a51 + (v54 + v51) - 0x30EE7232770660F1) = v52 - ((v53 + 74) & (2 * v52)) - 95;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * v53))(a1, a2, a3, 590960548);
}

uint64_t sub_1B384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * v8))();
}

uint64_t sub_1B398()
{
  __asm { BTI             j }
  return v0();
}

uint64_t sub_1B3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * ((898 * (a4 == (HIDWORD(a24) ^ (v50 - 231)))) ^ ((int)a7 - 547))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50);
}

uint64_t sub_1B3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,_DWORD *a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,int a59,unsigned int a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  *a44 = a65;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a8 + 8 * a25))(a1, a2, a3, a60);
}

uint64_t sub_1B404()
{
  __asm { BTI             j }
  return ((uint64_t (*)(void))STACK[0x260])();
}

uint64_t sub_1B414(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((463 * (a4 == ((a7 - 792) ^ (v8 - 36)))) ^ (a7 - 683))))();
}

uint64_t sub_1B450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  __asm { BTI             j }
  STACK[0x260] = *(void *)(a8 + 8 * v35);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (v35 ^ 0x500 ^ ((v35 + 1059) | 0x30))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_1B490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58)
{
  __asm { BTI             j }
  *(_DWORD *)STACK[0x208] = a58;
  return (*(uint64_t (**)(void))(a8 + 8 * (v58 - 382)))();
}

uint64_t sub_1B4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  return a67();
}

uint64_t sub_1B4C0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,int a29,int a30)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((a30 * (a4 == v30)) ^ (a7 - 245))))();
}

uint64_t sub_1B4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,int a60,int a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  BOOL v73 = (*(uint64_t (**)(unint64_t, uint64_t))(a8 + 8 * (a21 + 753)))(((((2 * (a61 + a69 + 1)) & 0x1FAFB6F7ELL)+ ((a61 + a69 + 1) ^ 0xFFD729F3FD7DB7BELL)) & (((a21 - 501) | 0x80u) - 0x28D608000000C3))+ 0x28D60C02824858, 8) == 0;
  return (*(uint64_t (**)(void))(a50 + 8 * ((118 * v73) ^ a21)))();
}

uint64_t sub_1B59C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  __asm { BTI             j }
  STACK[0x280] = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t))(a8 + 8 * (v50 - 361)))(a1, a2, a3, (v51 + 2), a5, a6, a50);
}

uint64_t sub_1B5C4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,int a31)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((a31 - 1147) * (a4 == v31)) ^ (a7 + 201))))();
}

uint64_t sub_1B5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,int a57,int a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  __asm { BTI             j }
  int v67 = LODWORD(STACK[0x26C]) + 1;
  uint64_t v68 = (v67 + a58);
  *(_DWORD *)(a62 + 8) = v68;
  *(_DWORD *)(a62 + 12) = v67;
  unsigned int v69 = v62;
  BOOL v70 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 8 * (v62 + 72)))(((v68 + 7) & 0x1FFFFFFF8) + (((v62 ^ 0xB0) - 108) ^ 0x3EDLL), 8) != 0;
  return (*(uint64_t (**)(void))(a49 + 8 * ((54 * v70) ^ v69)))();
}

uint64_t sub_1B670(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *a1 = 0;
  a1[1] = v8;
  return (*(uint64_t (**)(void))(a8 + 8 * v9))();
}

uint64_t sub_1B688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X7>, uint64_t a7@<X8>, __n128 a8@<Q0>, __n128 a9@<Q1>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  __asm { BTI             j }
  void *v53 = a7;
  v58.n128_u64[0] = 0xA1A1A1A1A1A1A1A1;
  v58.n128_u64[1] = 0xA1A1A1A1A1A1A1A1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, __n128, __n128, __n128))(a6 + 8 * ((((207 * (v51 ^ 0x3F9) - 1773480805) & 0x69B52A7A ^ 0x5FA) * (a7 != 0)) ^ v51)))(a1, a2, a3, (v52 + 2), a4, a5, a51, a8, a9, v58);
}

uint64_t sub_1B6F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, unsigned char *a5@<X8>)
{
  __asm { BTI             j }
  *a5 = 49;
  BOOL v11 = (LODWORD(STACK[0x26C]) + 1) <= *(_DWORD *)(v6 + 8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4
                                                                       + 8
                                                                       * ((56
                                                                         * ((v11 | (2 * v11)) != ((v5 ^ 0xD2) - 49 * (v5 ^ 0x56) + 68))) ^ v5)))(a1, a2, a3, 590933545);
}

uint64_t sub_1B764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a3
                                                                                         + 8
                                                                                         * ((56
                                                                                           * (((5 * (v4 ^ 0x35)
                                                                                              - 1057713723) ^ (a4 - 1057712818 - ((2 * a4) & 0x81E92A9C))) == ((v4 + 76) | 0x402) - 1230)) ^ v4)))(a1, a2, 97, 82, -1231, 230);
}

uint64_t sub_1B7DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((v8 >= (v9 ^ 0x38Cu) + 3) * (50 * (v9 ^ 0x38C) - 192)) ^ v9)))();
}

uint64_t sub_1B838@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((507
                                * (0xCF118DCD88F99F0FLL
                                 - a2
                                 - v2
                                 + v4
                                 + v2
                                 + ((v3 - 652655880) & 0x26E6BFFF)
                                 - 1011 >= (((v3 - 242) | 0x80u) ^ 0xA8uLL))) ^ v3)))();
}

uint64_t sub_1B8B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8 * (((v8 >= (((v9 - 718) | 0x218) ^ 0x31Cu)) * (((v9 - 1004) | 0x228) + 1465)) ^ v9)))();
}

uint64_t sub_1B8F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 + 13)))();
}

uint64_t sub_1B92C(double a1, double a2, int8x16_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  __asm { BTI             j }
  uint64_t v23 = v11 + v16;
  int8x16_t v24 = veorq_s8(*(int8x16_t *)(v23 - 15), a3);
  v15[-1] = veorq_s8(*(int8x16_t *)(v23 - 31), a3);
  int8x16_t *v15 = v24;
  return (*(uint64_t (**)(void))(a11 + 8 * (((v14 == 0) * (((v12 - 796) | v17) ^ v18)) ^ v13)))();
}

uint64_t sub_1B97C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (int)((((((a1 + 839083294) & 0xCDFC9B7B) + 332) ^ (2 * a1) ^ 0x10C) * (v9 == v8)) ^ a1)))();
}

uint64_t sub_1B9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((236 * ((((v9 + 224978957) & 0xF29714FF ^ 0x90) & v8) == 0)) ^ v9)))();
}

uint64_t sub_1BA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * v10))(v8 - v9 + 0xFFFFFFFFLL);
}

uint64_t sub_1BA50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *uint64_t v11 = veor_s8(*(int8x8_t *)(v10 + a1), v12);
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * (((v8 == 0) * (v9 - 212)) ^ v9)))(a1 - 8);
}

uint64_t sub_1BA88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((((v9 - 1276278402) & 0x4C1274DB) + 1860) * (v10 == v8)) ^ (v9 + 347))))();
}

uint64_t sub_1BACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * v8))();
}

uint64_t sub_1BAEC@<X0>(int a1@<W2>, int a2@<W3>, int a3@<W4>, int a4@<W5>, uint64_t a5@<X7>, uint64_t a6@<X8>)
{
  __asm { BTI             j }
  int v14 = (v7 ^ a1) * a2;
  *(unsigned char *)(a6 + v8) = *(unsigned char *)(v6 + (v14 ^ a3) + v8) ^ v9;
  return (*(uint64_t (**)(void))(a5 + 8 * ((((v14 ^ a3) + v8 != 0) * a4) ^ v7)))();
}

uint64_t sub_1BB2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,int a55)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a8
                                                                       + 8
                                                                       * ((452
                                                                         * (a55 == (v55 ^ 0x7F2 ^ (v55 - 553023889) & 0x20F677FE))) ^ v55)))(a1, a2, a3, 590960548);
}

uint64_t sub_1BB88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * v8))();
}

uint64_t sub_1BBB4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8
                                   * (((2 * (a4 == v30 + a30 - 863)) | (8 * (a4 == v30 + a30 - 863))) ^ (a7 - 697))))();
}

uint64_t sub_1BBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  __asm { BTI             j }
  int v54 = 12 * (v49 ^ 0x31A);
  int v55 = v49;
  BOOL v56 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 8 * (v49 + 450)))((((LODWORD(STACK[0x2BC]) + LODWORD(STACK[0x2AC]) + 1) + 7) & ((v49 - 604)+ 0x1FFFFFEF5))+ 16, 8) != 0;
  return (*(uint64_t (**)(void))(a49 + 8 * ((v56 * (v54 - 768)) ^ v55)))();
}

uint64_t sub_1BC6C(void *a1, __n128 a2, __n128 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  __asm { BTI             j }
  *a1 = 0;
  a1[1] = v10;
  v16.n128_u64[0] = 0xA1A1A1A1A1A1A1A1;
  v16.n128_u64[1] = 0xA1A1A1A1A1A1A1A1;
  return (*(uint64_t (**)(__n128, __n128, __n128))(a10
                                                           + 8
                                                           * ((((v11 - 1441623494) & 0x55ED6FFB ^ 0x319)
                                                             * (a1 == (void *)-16)) | v11)))(a2, a3, v16);
}

uint64_t sub_1BCD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,int a49,unsigned int a50)
{
  __asm { BTI             j }
  *(unsigned char *)(a5 + a5(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 4;
  unsigned int v56 = LODWORD(STACK[0x2AC]) + a50 + 1;
  BOOL v57 = v56 - 1051567990 <= v51 - 1051567989;
  if ((v51 - 1051567989) < 0xC152588A != v56 > ((v50 - 632249686) & 0x25AF5B3F ^ 0x3EADA656)) {
    BOOL v57 = (v51 - 1051567989) < 0xC152588A;
  }
  unsigned int v58 = v57 ^ 0xFFFFFFFB;
  if (v57) {
    int v59 = 2;
  }
  else {
    int v59 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8 * ((113 * (v58 + v59 == -5)) ^ v50)))(a1, a2, a3, 590933545);
}

uint64_t sub_1BD88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  int v14 = v8 - 696;
  uint64_t v15 = (v9 ^ 0x72519E7ACEEFF77FLL) - 0x2101430C442E347 + ((2 * v9) & 0x19DDFEEFELL);
  int v16 = ((v15 & 0x5F552EBC8) << ((v14 ^ 0x6Bu) + 23)) & (v15 ^ 0xE410E3CE) ^ v15 & 0xF552EBC8;
  int v17 = ((2 * (v15 ^ 0x4490F312 ^ v14 ^ 0xCD)) ^ 0x6384312C) & (v15 ^ 0x4490F312 ^ v14 ^ 0xCD) ^ (2
                                                                                                * (v15 ^ 0x4490F312 ^ v14 ^ 0xCD)) & 0xB1C21896;
  unsigned int v18 = v17 ^ 0x90420892;
  int v19 = (v17 ^ 0x21801090) & (4 * v16) ^ v16;
  unsigned int v20 = ((4 * v18) ^ 0xC7086258) & v18 ^ (4 * v18) & 0xB1C21890;
  unsigned int v21 = (v20 ^ 0x81000000) & (16 * v19) ^ v19;
  unsigned int v22 = ((16 * (v20 ^ 0x30C21886)) ^ 0x1C218960) & (v20 ^ 0x30C21886) ^ (16 * (v20 ^ 0x30C21886)) & 0xB1C21880;
  LODWORD(v15) = (v15 ^ (2
                                     * ((((v22 ^ 0xA1C21096) << 8) & 0xB1C21800 ^ (((v22 ^ 0xA1C21096) << 8) ^ 0x42180000) & (v22 ^ 0xA1C21096)) & (((v22 ^ 0x10000800) & (v21 << 8) ^ v21) << 16) ^ (v22 ^ 0x10000800) & (v21 << 8) ^ v21)) ^ 0xF552EBC8) == 0;
  return (*(uint64_t (**)(void))(a8 + 8 * (int)((v15 | (16 * v15)) ^ v14)))();
}

uint64_t sub_1BF60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v9 ^ (945 * (v8 < 8)))))();
}

uint64_t sub_1C008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, uint64_t))(a8
                                                    + 8
                                                    * ((124
                                                      * ((((v10 - 1199482554) ^ (v8
                                                                               - a6
                                                                               + a3
                                                                               - a5
                                                                               + 0x3CF13BB6A8C31C47
                                                                               + (unint64_t)(346 * (v10 ^ 0x23A)) < 0x20)) & 1) == 0)) ^ v10)))((v10 - 1199482554) & 0x477EA7BD, v9);
}

uint64_t sub_1C088(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((v8 >= ((a4 + 865526923) & 0xCC691BFC) - 796) * (((a4 - 644) | 0x485) ^ 0x4DB)) ^ a4)))();
}

uint64_t sub_1C0DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 663)))();
}

uint64_t sub_1C100@<X0>(int a1@<W0>, uint64_t a2@<X2>, uint64_t a3@<X3>, int a4@<W5>, uint64_t a5@<X7>, uint64_t a6@<X8>, int8x16_t a7@<Q2>)
{
  __asm { BTI             j }
  uint64_t v15 = (v10 + (v9 - 222) + 222) & a2;
  int8x16_t v16 = *(int8x16_t *)(v7 + v15 - 15);
  int8x16_t v17 = *(int8x16_t *)(v7 + v15 - 31);
  uint64_t v18 = a6 + v15 + v8;
  *(int8x16_t *)(v18 - 15) = veorq_s8(v16, a7);
  *(int8x16_t *)(v18 - 31) = veorq_s8(v17, a7);
  return (*(uint64_t (**)(void))(a5 + 8 * (((a3 == 0) * a4) ^ a1)))();
}

uint64_t sub_1C15C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((55 * (((v9 == v8) ^ ((a2 - 18) ^ (a2 - 57))) & 1)) ^ a2)))();
}

uint64_t sub_1C19C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((106 * ((((((a4 - 918561896) & 0x36C026F7) - 401) ^ (a4 + 279)) & v8) == 0)) ^ a4)))();
}

uint64_t sub_1C1E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * a3))(v8 - 7, v9 & 7);
}

uint64_t sub_1C228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(int8x8_t *)(a5 + (~v12 + v10) + v9) = veor_s8(*(int8x8_t *)(a1 + (~v12 + v10)), v14);
  return (*(uint64_t (**)(void))(a8 + 8 * (((((v11 - 780) ^ v8) + v12 != a4) * v13) ^ v11)))();
}

uint64_t sub_1C26C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8 * (int)(((((92 * (a3 ^ 0x184) + 1857450528) & 0x91498AEC) - 34) * (a4 == v8)) ^ a3)))();
}

uint64_t sub_1C2C4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (a1 - 325)))();
}

uint64_t sub_1C2D8@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X7>, uint64_t a4@<X8>)
{
  __asm { BTI             j }
  unsigned int v14 = a2 - 1;
  *(unsigned char *)(a4 + v14 + v5) = *(unsigned char *)(v4 + v14) ^ v8;
  return (*(uint64_t (**)(void))(a3 + 8 * (((v14 == 0) * (((a1 + v9) & v7) + 1458)) ^ v6)))();
}

uint64_t sub_1C318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  __asm { BTI             j }
  BOOL v52 = (v47 - 775773158) < 0xD1C2A419;
  BOOL v53 = v44 + v46 - 775773159 <= (v47 - 775773158);
  if (v52 != (v44 + v46) > 0x2E3D5BE6) {
    BOOL v53 = (v47 - 775773158) < 0xD1C2A419;
  }
  char v54 = (v53 | 0x80) ^ (v45 - 93);
  if (v53) {
    char v55 = 2;
  }
  else {
    char v55 = 0;
  }
  return (*(uint64_t (**)(BOOL, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (((8 * ((v54 + v55) == 111)) | (16 * ((v54 + v55) == 111))) ^ v45)))(v52, a2, a3, 590933545, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44);
}

uint64_t sub_1C3B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  int v14 = v8 & 0x1DC2ABFF;
  int v15 = (v9 ^ 0xBE7D1BB3) - 174066176 + ((v9 << (v14 + 18)) & 0x7CFA3766);
  int v16 = (v15 ^ 0xBD8EF0D) & (2 * (v15 & 0x4BE2EE4D)) ^ v15 & 0x4BE2EE4D;
  unsigned int v17 = ((2 * (v15 ^ ((v14 ^ 0x3BB) - 1990410423))) ^ 0x857CA3A0) & (v15 ^ ((v14 ^ 0x3BB) - 1990410423)) ^ (2 * (v15 ^ ((v14 ^ 0x3BB) - 1990410423))) & 0xC2BE51D0;
  int v18 = v17 ^ 0x42825050;
  int v19 = (v17 ^ 0x1C0100) & (4 * v16) ^ v16;
  unsigned int v20 = ((4 * v18) ^ 0xAF94740) & v18 ^ (4 * v18) & 0xC2BE51D0;
  int v21 = (v20 ^ 0x2B84140) & (16 * v19) ^ v19;
  unsigned int v22 = ((16 * (v20 ^ 0xC0061090)) ^ 0x2BE51D00) & (v20 ^ 0xC0061090) ^ (16 * (v20 ^ 0xC0061090)) & 0xC2BE51C0;
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((25
                                * ((v15 ^ (2
                                         * ((((v22 ^ 0xC01A40D0) << 8) & 0x42BE0000 ^ 0x2100000 ^ (((v22 ^ 0xC01A40D0) << 8) ^ 0xBE510000) & (v22 ^ 0xC01A40D0)) & (((v22 ^ 0x2A41100) & (v21 << 8) ^ v21) << 16) ^ (v22 ^ 0x2A41100) & (v21 << 8) ^ v21)) ^ 0x4BE2EE4D) == 0)) ^ v14)))();
}

uint64_t sub_1C55C(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * (((v8 > 7) * (a2 ^ 0x48D)) ^ a2)))(v8);
}

uint64_t sub_1C5D8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8
                                            + 8
                                            * ((103
                                              * (v8
                                               - a4
                                               - v11
                                               + v9
                                               - (((a2 ^ 0x1Bu) + 14 - 0x7F7B76D7B3FD4057) ^ (unint64_t)((a2 ^ 0x1Bu) - 354)) < 0x20)) ^ a2 ^ 0x1Bu)))(v10);
}

uint64_t sub_1C638(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  BOOL v13 = v8 >= (((a3 - 1180) | 0x32C) ^ 0x31C);
  return (*(uint64_t (**)(void))(a8 + 8 * (((2 * v13) | (16 * v13)) ^ a3)))();
}

uint64_t sub_1C680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 808)))(0);
}

uint64_t sub_1C6A4@<X0>(uint64_t a1@<X0>, unsigned int a2@<W3>, int a3@<W4>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  __asm { BTI             j }
  uint64_t v15 = (~a1 + v8);
  long long v16 = *(_OWORD *)(v7 + v15 - 15);
  long long v17 = *(_OWORD *)(v7 + v15 - 31);
  uint64_t v18 = a5 + v15 + v5;
  *(_OWORD *)(v18 - 15) = v16;
  *(_OWORD *)(v18 - 31) = v17;
  return (*(uint64_t (**)(void))(a4 + 8 * (((a1 + ((v9 - 794) | a2) - 515 == v6) * a3) ^ v10)))();
}

uint64_t sub_1C6F8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (int)(((3 * (a2 ^ 0x29C) + (a2 ^ 0xFFFFFFF4)) * (v8 == v9)) | a2)))();
}

uint64_t sub_1C738(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((115 * (((((a3 + 219) | 0x24) ^ 0x324) & v8) == 0)) ^ a3)))(((a3 ^ 0x2D2) - 208) & v8);
}

uint64_t sub_1C780@<X0>(int a1@<W1>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(a2 + 8 * a1))(v4 & 7, ~v3, (v5 + a1 - 20 + 602) & v4, a3 - 7);
}

uint64_t sub_1C7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(void *)(a4 + (v9 + a2) + v8) = *(void *)(v11 + (v9 + a2));
  return (*(uint64_t (**)(uint64_t, uint64_t))(a8
                                                     + 8
                                                     * (((((a3 + a2 == 7) ^ (3 * (v10 ^ v12))) & 1) * a6) ^ v10)))(a1, a2 - 8);
}

uint64_t sub_1C7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8 * (int)((((v8 ^ 0x3B1) + ((v8 + 1197816137) & 0xB89AC67D) - 879) * (a3 == v9)) ^ v8)))();
}

uint64_t sub_1C844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 + 67)))();
}

uint64_t sub_1C858@<X0>(int a1@<W0>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  unsigned int v13 = ((v6 - 744) ^ v8) + a1;
  *(unsigned char *)(a3 + v13 + v3) = *(unsigned char *)(v5 + v13);
  return (*(uint64_t (**)(void))(a2 + 8 * (((v13 == 0) * v7) ^ v4)))();
}

uint64_t sub_1C890(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a8
                                                                      + 8
                                                                      * (((v8 - v11 == v9 - 83) * (v9 + 143)) ^ v9)))(a1, a2, a3, (v10 - 3));
}

uint64_t sub_1C8C8@<X0>(uint64_t a1@<X7>, unint64_t a2@<X8>)
{
  __asm { BTI             j }
  STACK[0x278] = a2;
  LODWORD(STACK[0x22C]) = v2;
  STACK[0x2B0] -= 16;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8 * ((v3 - 44) ^ 0x61)))(13, 70);
}

uint64_t sub_1C940(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((a7 + 117) * (a4 == v8)) ^ (a7 - 720))))();
}

uint64_t sub_1C970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x2B0] += (a7 - 826) ^ 0x12;
  LODWORD(STACK[0x2AC]) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a8
                                                                      + 8
                                                                      * (((STACK[0x200] == 0)
                                                                        * (((a7 - 826) | 0x25) ^ 0x21)) ^ (a7 + 341))))(a1, a2, a3, (v8 + 1));
}

uint64_t sub_1C9E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a8 + 8 * (v8 ^ 0x4D7 ^ (v8 - 225419562) & 0xD6FA5BB)))(13, 70, 97);
}

uint64_t sub_1CA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (a7 - 259)))();
}

uint64_t sub_1CA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (a7 - 744)))();
}

uint64_t sub_1CA78@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1 + 8 * (((a2 == 0) * (v2 - 799)) ^ (v2 - 47))))();
}

uint64_t sub_1CAA4@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  __asm { BTI             j }
  uint64_t v49 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8 * (v43 ^ 0x42E)))(a2 - 16, *(void *)(a2 - 8) & ((v43 + 537) + v44));
  return (*(uint64_t (**)(uint64_t))(a43 + 8 * v43))(v49);
}

uint64_t sub_1CAE8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a4))();
}

uint64_t sub_1CB08@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1 + 8 * ((51 * (v2 + v3 - 450 + (v3 ^ 0x766) - 1475 == a2)) ^ v3)))();
}

uint64_t sub_1CB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                                           + 8
                                           * ((((*(_DWORD *)(v8 + 24 * v10 + 8) + v9) > *(_DWORD *)(v12 + 8))
                                             * (((v11 - 818) | 0x30E) ^ (v11 - 49))) ^ v11)))((v11 - 288));
}

uint64_t sub_1CBA4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  unsigned int v14 = (a2 ^ 0xD97FABBB) + 799006040 + ((2 * a2) & 0xB2FF5776);
  unsigned int v15 = (v14 ^ 0xF6CA74E8) & (2 * ((v8 - 153062497) & v14)) ^ (v8 - 153062497) & v14;
  unsigned int v16 = ((2 * (v14 ^ v8 ^ 0x5BCAF2EC)) ^ 0x5A550E9E) & (v14 ^ v8 ^ 0x5BCAF2EC) ^ (2 * (v14 ^ v8 ^ 0x5BCAF2EC)) & 0xAD2A874E;
  unsigned int v17 = v16 ^ 0xA52A8141;
  int v18 = (v16 ^ 0x828060C) & (4 * v15) ^ v15;
  unsigned int v19 = ((4 * v17) ^ 0xB4AA1D3C) & v17 ^ (4 * v17) & 0xAD2A874C;
  unsigned int v20 = (v19 ^ 0xA42A0500) & (16 * v18) ^ v18;
  unsigned int v21 = ((16 * (v19 ^ 0x9008243)) ^ 0xD2A874F0) & (v19 ^ 0x9008243) ^ (16 * (v19 ^ 0x9008243)) & 0xAD2A8740;
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((((v14 ^ (2
                                         * ((((v21 ^ 0x2D02830F) << 8) & 0xAD2A8700 ^ 0x28020000 ^ (((v21 ^ 0x2D02830F) << 8) ^ 0x2A870000) & (v21 ^ 0x2D02830F)) & (((v21 ^ 0x80280400) & (v20 << 8) ^ v20) << 16) ^ (v21 ^ 0x80280400) & (v20 << 8) ^ v20)) ^ 0xF6E076ED) == 0)
                                * v9) ^ v8)))();
}

uint64_t sub_1CD34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((v8 - 505) ^ (207 * (v9 > 7)))))();
}

uint64_t sub_1CDC0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((0x1EFDFE6FDABF7234 - a4 - v8 + v9 - a6 + 447 >= (unint64_t)(3 * ((a1 + 285586648) & 0xEEFA4BF7 ^ 0x337))
                                                                                  - 415) | a1)))();
}

uint64_t sub_1CE2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((126 * (v8 >= ((a5 - 209) ^ 0x2F1u))) ^ a5)))(0);
}

uint64_t sub_1CE60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 1168 * (a5 ^ 0x3A5)))();
}

uint64_t sub_1CE94(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  unint64_t v18 = (a2 ^ v13 ^ (unint64_t)(v12 - 400)) & a4;
  long long v19 = *(_OWORD *)(v9 + v18 - 15);
  long long v20 = *(_OWORD *)(v9 + v18 - 31);
  unint64_t v21 = v8 + v10 + v18;
  *(_OWORD *)(v21 - 15) = v19;
  *(_OWORD *)(v21 - 31) = v20;
  return (*(uint64_t (**)(void))(a8 + 8 * (((a5 == 0) * v11) ^ a2)))();
}

uint64_t sub_1CEE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((22 * ((((a3 - 936) ^ (a1 == v8)) & 1) == 0)) ^ a3)))();
}

uint64_t sub_1CF30(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, void, void))(a8
                                                            + 8
                                                            * ((58
                                                              * ((((a3 + 1726898953) & 0x99119AFB ^ 0x2C9) & v8) == 0)) ^ (a3 - 760))))(a1, v8 & 0x1F, (a3 - 781));
}

uint64_t sub_1CF80(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * a4))(a1, v8 & 7);
}

uint64_t sub_1CFC0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v16 = (((a3 ^ v11) - 495) ^ a1) + v9;
  *(void *)(a8 + v16 + v8) = *(void *)(a7 + v16);
  _ZF = a4 == a1;
  uint64_t v17 = a1 + 8;
  int v18 = !_ZF;
  return (*(uint64_t (**)(uint64_t))(v10 + 8 * ((30 * v18) ^ a3)))(v17);
}

uint64_t sub_1D004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v7 + 8 * ((((a6 - 47) ^ 0x557 ^ (2 * a6) ^ 0x270) * (a5 == v6)) ^ a6)))();
}

uint64_t sub_1D054(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a3))();
}

uint64_t sub_1D064(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v18 = a3 ^ v11;
  uint64_t v19 = a2 - 1;
  *(unsigned char *)(v8 + ((v18 ^ (v13 + 400)) & v19) + v1(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(unsigned char *)(v9 + ((v18 ^ (v13 + 400)) & v19));
  return (*(uint64_t (**)(void))(a8 + 8 * (((((v18 ^ (v13 + 400)) & v19) == 0) * v12) ^ a3)))();
}

uint64_t sub_1D0A0(void *a1, __n128 a2, __n128 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  __asm { BTI             j }
  *a1 = 0;
  a1[1] = v11;
  STACK[0x280] = (unint64_t)(a1 + 2);
  v16.n128_u64[0] = 0xA1A1A1A1A1A1A1A1;
  v16.n128_u64[1] = 0xA1A1A1A1A1A1A1A1;
  return (*(uint64_t (**)(__n128, __n128, __n128))(a10
                                                           + 8
                                                           * ((((v10 ^ 0x387) + 3 * (v10 ^ 0x92) - 827)
                                                             * (a1 == (void *)-16)) ^ v10)))(a2, a3, v16);
}

uint64_t sub_1D0F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X7>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57)
{
  __asm { BTI             j }
  uint64_t v63 = LODWORD(STACK[0x268]);
  LODWORD(STACK[0x268]) = v63 + 1;
  *(unsigned char *)(a5 + v63) = 48;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a4
                                                                       + 8
                                                                       * (((((a57 + (int)v63 + 1 <= v58) | (2 * (a57 + (int)v63 + 1 <= v58))) == (((v57 - 115) ^ 8) & 0xCB))
                                                                         * ((15 * (v57 ^ 0x38)) ^ 0x307)) ^ v57)))(a1, a2, a3, 590933545);
}

uint64_t sub_1D16C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  unsigned int v14 = (v9 ^ 0xF6B3D33F) + 2147463106 + ((2 * v9) & 0xED67A67E);
  unsigned int v15 = (v14 ^ 0xC42F78FF) & (2 * ((((v8 + 272) ^ 0x7E6) - 1991476764) & v14)) ^ (((v8 + 272) ^ 0x7E6) - 1991476764) & v14;
  unsigned int v16 = ((2 * (v14 ^ 0xC6370907)) ^ 0x9EF6EBF0) & (v14 ^ 0xC6370907) ^ (2 * (v14 ^ 0xC6370907)) & 0x4F7B75F8;
  int v17 = v16 ^ 0x41091408;
  int v18 = (v16 ^ 0xE7A61F0) & (4 * v15) ^ v15;
  int v19 = ((4 * v17) ^ 0x3DEDD7E0) & v17 ^ (4 * v17) & 0x4F7B75F8;
  int v20 = (v19 ^ 0xD6955E8) & (16 * v18) ^ v18;
  unsigned int v21 = ((16 * (v19 ^ 0x42122018)) ^ 0xF7B75F80) & (v19 ^ 0x42122018) ^ (16 * (v19 ^ 0x42122018)) & 0x4F7B75C0;
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((29
                                * ((v14 ^ (2
                                         * ((((v21 ^ 0x8482078) << 8) & 0x4F7B7000 ^ 0x4B7105F8 ^ (((v21 ^ 0x8482078) << 8) ^ 0x7B75F800) & (v21 ^ 0x8482078)) & (((v21 ^ 0x47335578) & (v20 << 8) ^ v20) << 16) ^ (v21 ^ 0x47335578) & (v20 << 8) ^ v20)) ^ 0x894C7CFF) != 0)) ^ v8)))();
}

uint64_t sub_1D314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((45 * (v8 >= 138 * (v9 ^ 0x31Du) - 820)) ^ v9)))();
}

uint64_t sub_1D3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((((v9 ^ 0xEF) - 212) ^ 0x3CB ^ (((v9 ^ 0xEF) - 212) | 0x1C) ^ 0x3DF)
                                * ((unint64_t)(v10 - a4 + v8 - a3 + 0x46BF170748E99CFBLL) > 0x1F)) | v9 ^ 0xEF)))();
}

uint64_t sub_1D40C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((((((a2 + 593) ^ (v8 < 0x20)) & 1) == 0) * ((a2 + 237) ^ 0x1C8)) ^ a2)))();
}

uint64_t sub_1D44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  unsigned int v14 = *(uint64_t (**)(void, uint64_t))(a8 + 8 * (v9 - 445));
  return v14(v14, (v8 & 0xFFFFFFE0) - 32);
}

uint64_t sub_1D480@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, int a3@<W4>, uint64_t a4@<X7>, uint64_t a5@<X8>, int8x16_t a6@<Q2>)
{
  __asm { BTI             j }
  uint64_t v18 = (a2 ^ v13 ^ ((v11 ^ a3) * v12)) + v9;
  int8x16_t v19 = *(int8x16_t *)(v7 + v18 - 15);
  int8x16_t v20 = *(int8x16_t *)(v7 + v18 - 31);
  uint64_t v21 = a5 + v18 + v8;
  *(int8x16_t *)(v21 - 15) = veorq_s8(v19, a6);
  *(int8x16_t *)(v21 - 31) = veorq_s8(v20, a6);
  return (*(uint64_t (**)(void))(a4 + 8 * (((a1 == a2) * v6) ^ v10)))();
}

uint64_t sub_1D4DC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((81 * (((v9 == v8) ^ (a1 + 73)) & 1)) ^ a1)))();
}

uint64_t sub_1D510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((((((v9 ^ 0x416) - 211) | 0x1C0) ^ 0xA3) + 69 * (v9 ^ 0x4F1)) * ((v8 & 0x18) == 0)) ^ v9 ^ 0x416)))();
}

uint64_t sub_1D560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * v10))(v8 - 7, v9 & 0xFFFFFFF8);
}

uint64_t sub_1D58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(int8x8_t *)(a4 + (~v11 + v9) + v8) = veor_s8(*(int8x8_t *)(a1 + (~v11 + v9)), v14);
  return (*(uint64_t (**)(void))(a8 + 8 * (((v11 + ((v10 - 200) | v12) - 940 == a2) * v13) ^ v10)))();
}

uint64_t sub_1D5D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                                           + 8
                                           * (((((a2 == v8) ^ (a3 + 1)) & 1) * ((a3 + 329) ^ 0x4BD)) | a3)))(a3 ^ 0x88u);
}

uint64_t sub_1D618(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (a1 + 85)))();
}

uint64_t sub_1D62C@<X0>(int a1@<W0>, char a2@<W5>, uint64_t a3@<X7>, uint64_t a4@<X8>)
{
  __asm { BTI             j }
  uint64_t v14 = (a1 + 449);
  uint64_t v15 = v7 - 1;
  *(unsigned char *)(a4 + ((v9 + v14 - 449) & v15) + v5) = *(unsigned char *)(v4 + ((v9 + v14 - 449) & v15)) ^ a2;
  return (*(uint64_t (**)(void))(a3 + 8 * (((((v9 + v14 - 449) & v15) == 0) * v8) ^ v6)))();
}

uint64_t sub_1D66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  LODWORD(STACK[0x268]) = v8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a8
                                                                       + 8
                                                                       * ((477
                                                                         * (((LODWORD(STACK[0x28C]) + v8 <= v10) | (2 * (LODWORD(STACK[0x28C]) + v8 <= v10))) != (((v9 + 1680509697) ^ 0x3C) & 0x3D))) ^ v9)))(a1, a2, a3, 590933545);
}

uint64_t sub_1D6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  int v14 = (((4 * (v9 - 20)) ^ 0x13FC) - 53) | 0x104;
  unsigned int v15 = (v8 ^ 0x8EFFAB7A) + 2140927886 + ((2 * v8) & 0x1DFF56F4);
  unsigned int v16 = (v15 ^ 0xE4451EFD) & (2 * (v15 & 0xF1645CF8)) ^ v15 & 0xF1645CF8;
  unsigned int v17 = ((2 * (v15 ^ v14 ^ 0xA48D2F3A)) ^ 0xABD2E5CA) & (v15 ^ v14 ^ 0xA48D2F3A) ^ (2 * (v15 ^ v14 ^ 0xA48D2F3A)) & 0x55E972E4;
  int v18 = v17 ^ 0x54291225;
  int v19 = (v17 ^ 0x18060C0) & (4 * v16) ^ v16;
  int v20 = ((4 * v18) ^ 0x57A5CB94) & v18 ^ (4 * v18) & 0x55E972E4;
  int v21 = (v20 ^ 0x55A14280) & (16 * v19) ^ v19;
  int v22 = ((16 * (v20 ^ 0x483061)) ^ 0x5E972E50) & (v20 ^ 0x483061) ^ (16 * (v20 ^ 0x483061)) & 0x55E972C0;
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((31
                                * ((v15 ^ (2
                                         * ((((v22 ^ 0x16850A5) << 8) & 0x55E90000 ^ 0x41600000 ^ (((v22 ^ 0x16850A5) << 8) ^ 0xE9720000) & (v22 ^ 0x16850A5)) & (((v22 ^ 0x54812200) & (v21 << 8) ^ v21) << 16) ^ (v22 ^ 0x54812200) & (v21 << 8) ^ v21)) ^ 0xF1645CF8) != 0)) ^ (v9 - 20))))();
}

uint64_t sub_1D874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v9 | (8 * (v8 < 8)) | (16 * (v8 < 8)))))();
}

uint64_t sub_1D908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (int)((41
                                     * (v9
                                      - a5
                                      - 0x30EE7232770660F1
                                      - a3
                                      + a2
                                      - (v8 ^ 0x8A4076C404482650 ^ ((v8 + 959) | 0x83)) < 0x20)) ^ v8)))();
}

uint64_t sub_1D984(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((v8 < ((a4 - 1717720196) & 0x6662533C ^ 0x31Cu)) * (((a4 - 1138) | 0x400) - 996)) ^ a4)))();
}

uint64_t sub_1D9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * (v9 - 353)))(v8 - 1);
}

uint64_t sub_1DA0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, int a3@<W4>, int a4@<W5>, uint64_t a5@<X7>, uint64_t a6@<X8>, int8x16_t a7@<Q2>)
{
  __asm { BTI             j }
  uint64_t v16 = v7 + a1;
  uint64_t v17 = a6 + a1 + v8;
  int8x16_t v18 = veorq_s8(*(int8x16_t *)(v16 - 31), a7);
  *(int8x16_t *)(v17 - 15) = veorq_s8(*(int8x16_t *)(v16 - 15), a7);
  *(int8x16_t *)(v17 - 31) = v18;
  return (*(uint64_t (**)(uint64_t))(a5 + 8 * (((a2 == 0) * ((v10 + v11) & a3 ^ a4)) ^ v9)))(a1 - 32);
}

uint64_t sub_1DA68(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((a2 - 23 + a2 - 849 - 929) * (v9 == v8)) ^ a2)))();
}

uint64_t sub_1DAA0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((44 * (((((347 * (a3 ^ 0x391) - 505) | 0x124) ^ 0x324) & v8) != 0)) ^ a3)))();
}

uint64_t sub_1DAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * v9))(v8 - 7);
}

uint64_t sub_1DB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v19 = (((v10 ^ v12) - 105) ^ v11) + v9;
  *(int8x8_t *)(a4 + v19 + v8) = veor_s8(*(int8x8_t *)(a1 + v19), v14);
  return (*(uint64_t (**)(void))(a8 + 8 * (((a5 == v11) * v13) ^ v10)))();
}

uint64_t sub_1DB60(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((((a3 + 305) ^ (a3 + 724)) * (a2 == v8)) ^ a3)))();
}

uint64_t sub_1DB9C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (a1 - 753)))();
}

uint64_t sub_1DBB0@<X0>(int a1@<W0>, int a2@<W5>, uint64_t a3@<X7>, uint64_t a4@<X8>)
{
  __asm { BTI             j }
  uint64_t v15 = a1 ^ v9;
  uint64_t v16 = v7 - 1;
  *(unsigned char *)(a4 + ((v10 + v15 + 740) & v16) + v5) = *(unsigned char *)(v4 + ((v10 + v15 + 740) & v16)) ^ v8;
  return (*(uint64_t (**)(void))(a3 + 8 * (((((v10 + v15 + 740) & v16) == 0) * a2) ^ v6)))();
}

uint64_t sub_1DBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  LODWORD(STACK[0x268]) = v69;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a8
                                                                       + 8
                                                                       * (((((a69 + v69 <= v71) ^ (v70 - 89))
                                                                          + 2 * (a69 + v69 <= v71) == -1)
                                                                         * ((v70 - 598984443) & 0x23B3C7EE ^ 0x178)) ^ v70)))(a1, a2, a3, 590933545);
}

uint64_t sub_1DC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  unsigned int v14 = (v9 ^ 0x9D2EF4DE) - 151658648 + ((((v8 - 20) | 0x85) + ((v8 + 246) ^ 0x3A5DE5BD)) & (2 * v9));
  int v15 = (v14 ^ 0x439A03B3) & (2 * (v14 & 0x6BDB2BBA)) ^ v14 & 0x6BDB2BBA;
  unsigned int v16 = ((2 * (v14 ^ 0xC19E04C3)) ^ 0x548A5EF2) & (v14 ^ 0xC19E04C3) ^ (2 * (v14 ^ 0xC19E04C3)) & 0xAA452F78;
  unsigned int v17 = v16 ^ 0xAA452109;
  int v18 = (v16 ^ 0xE70) & (4 * v15) ^ v15;
  unsigned int v19 = ((4 * v17) ^ 0xA914BDE4) & v17 ^ (4 * v17) & 0xAA452F78;
  unsigned int v20 = (v19 ^ 0xA8042D60) & (16 * v18) ^ v18;
  unsigned int v21 = ((16 * (v19 ^ 0x2410219)) ^ 0xA452F790) & (v19 ^ 0x2410219) ^ (16 * (v19 ^ 0x2410219)) & 0xAA452F50;
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (v8 | (32
                                     * ((v14 ^ (2
                                                            * ((((v21 ^ 0xA050869) << 8) & 0x2A450000 ^ 0x50000 ^ (((v21 ^ 0xA050869) << 8) ^ 0x452F0000) & (v21 ^ 0xA050869)) & (((v21 ^ 0xA0402700) & (v20 << 8) ^ v20) << 16) ^ (v21 ^ 0xA0402700) & (v20 << 8) ^ v20)) ^ 0x6BDB2BBA) != 0)))))();
}

uint64_t sub_1DDF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8 + 8 * ((115 * (v8 > 7)) ^ v9)))(v8);
}

uint64_t sub_1DE8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t))(a8
                                            + 8
                                            * ((102
                                              * (v8
                                               - 0x30EE7232770660F1
                                               - a2
                                               + v10
                                               - a4
                                               + 15 * (((a3 - 1241216381) | 0x2D) ^ 0x22Au)
                                               - ((69 * (((a3 - 1241216381) | 0x2D) ^ 0x221u)) ^ 0x10401050C55E239DuLL)
                                               - 105 > 0x1F)) ^ ((a3 - 1241216381) | 0x2D))))(v9);
}

uint64_t sub_1DF2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((205 * (v8 < 409 * (a3 ^ 0x6B) + ((a3 + 723) ^ 0xFFFFFFD2))) ^ a3)))();
}

uint64_t sub_1DF74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 8 * (v9 + 219)))(v8 - 1, (v8 & 0xFFFFFFE0) - 32);
}

uint64_t sub_1DF98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W4>, uint64_t a4@<X7>, uint64_t a5@<X8>, int8x16_t a6@<Q2>)
{
  __asm { BTI             j }
  uint64_t v13 = v6 + a1;
  uint64_t v14 = a5 + a1 + v7;
  int8x16_t v15 = veorq_s8(*(int8x16_t *)(v13 - 31), a6);
  *(int8x16_t *)(v14 - 15) = veorq_s8(*(int8x16_t *)(v13 - 15), a6);
  *(int8x16_t *)(v14 - 31) = v15;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8 * (((a2 != 0) * (((v8 - 828) | a3) - 334)) ^ (v8 + 211))))(a1 - 32, a2 - 32);
}

uint64_t sub_1DFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((((((v10 + 218) | 2) ^ 0x20C) + ((v10 - 1452139369) & 0x568DE2A6)) * (v9 == v8)) ^ v10)))();
}

uint64_t sub_1E048(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((1021 * ((((a3 + 654) ^ 0x32A) & v8) == 0)) ^ a3)))((((a3 + 408) | 0x100) ^ 0x323) & v8);
}

uint64_t sub_1E08C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, uint64_t))(a8 + 8 * a2))(((115 * (a2 ^ 0x335)) ^ 0x322) & v8, ~v9 + v8);
}

uint64_t sub_1E0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(int8x8_t *)(a4 + a2 + v8) = veor_s8(*(int8x8_t *)(v10 + a2), v12);
  return (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 8 * (((a5 != 0) * ((v9 - 360) ^ v11)) ^ v9)))(a1, a2 - 8);
}

uint64_t sub_1E11C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (int)(((((v9 + 2066004479) & 0x84DB477F) + ((2 * v9) ^ 0x138) - 102) * (a3 == v8)) ^ v9)))();
}

uint64_t sub_1E164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 291)))();
}

uint64_t sub_1E178@<X0>(int a1@<W0>, uint64_t a2@<X7>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  unsigned int v13 = a1 - 1;
  *(unsigned char *)(a3 + v13 + v4) = *(unsigned char *)(v3 + v13) ^ v7;
  return (*(uint64_t (**)(void))(a2 + 8 * (((v13 == 0) * ((v6 - 250) ^ v8)) ^ v5)))();
}

uint64_t sub_1E1B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  LODWORD(STACK[0x268]) = v8;
  BOOL v15 = LODWORD(STACK[0x22C]) + v8 + ((((v9 - 707943045) & 0x2A325B7E) - 254) ^ 0xF09A2DDA) <= v10;
  BOOL v16 = (v15 ^ 0x7F) + 2 * v15 == 127;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (v16 | (4 * v16) | v9)))(a1, a2, a3, 590933545);
}

uint64_t sub_1E224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  int v14 = v9 - 1155773445;
  int v15 = (v14 ^ 0x317DCBC0) & (2 * (v14 & 0x357DE3E9)) ^ v14 & 0x357DE3E9;
  unsigned int v16 = (((v8 ^ 0x214) + 157) ^ 0x9C82DE11 ^ (2 * (v14 ^ 0x7B3C8C2A ^ (4 * (v8 ^ 0x214))))) & (v14 ^ 0x7B3C8C2A ^ (4 * (v8 ^ 0x214))) ^ (2 * (v14 ^ 0x7B3C8C2A ^ (4 * (v8 ^ 0x214)))) & 0x4E416F6A;
  int v17 = v16 ^ 0x42412129;
  int v18 = (v16 ^ 0xC000E40) & (4 * v15) ^ v15;
  int v19 = ((4 * v17) ^ 0x3905BDAC) & v17 ^ (4 * v17) & 0x4E416F68;
  int v20 = (v19 ^ 0x8012D20) & (16 * v18) ^ v18;
  unsigned int v21 = ((16 * (v19 ^ 0x46404243)) ^ 0xE416F6B0) & (v19 ^ 0x46404243) ^ (16 * (v19 ^ 0x46404243)) & 0x4E416F60;
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((109
                                * ((v14 ^ (2
                                         * ((((v21 ^ 0xA41094B) << 8) & 0x4E416F00 ^ 0x40410000 ^ (((v21 ^ 0xA41094B) << 8) ^ 0x416F0000) & (v21 ^ 0xA41094B)) & (((v21 ^ 0x44006600) & (v20 << 8) ^ v20) << 16) ^ (v21 ^ 0x44006600) & (v20 << 8) ^ v20)) ^ 0x357DE3E9) == 0)) ^ v8)))();
}

uint64_t sub_1E3AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v9 | (v8 < 8) | (16 * (v8 < 8)))))();
}

uint64_t sub_1E434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((((v10 + 660) ^ 0x77C)
                                * ((unint64_t)(v8 - 0x1014912848556025 - a3 + v9 - a2) > 0x1F)) ^ v10)))();
}

uint64_t sub_1E488(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((v8 < (a1 ^ 0x4ACu)) * ((a1 - 1052) ^ 0x68)) ^ a1)))();
}

uint64_t sub_1E4C0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 8 * ((a1 ^ 0x7B0) + 283)))(v8 - 1, (v8 & 0xFFFFFFE0) - 32);
}

uint64_t sub_1E4EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W3>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  __asm { BTI             j }
  uint64_t v14 = (v9 + (v7 + 247) - 247) & a1;
  long long v15 = *(_OWORD *)(v6 + v14 - 15);
  long long v16 = *(_OWORD *)(v6 + v14 - 31);
  uint64_t v17 = a5 + v14 + v5;
  *(_OWORD *)(v17 - 15) = v15;
  *(_OWORD *)(v17 - 31) = v16;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8 * (((a2 == 0) * a3) ^ v8)))(a1 - 32, a2 - 32);
}

uint64_t sub_1E540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((v8 != v9) * (v10 - 966)) ^ v10)))();
}

uint64_t sub_1E570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * ((27 * (((56 * ((v9 - 69) ^ 0x3EC) - 88) & v8) == ((v9 - 69) ^ 0xD2u) - 828)) ^ (v9 - 69))))();
}

uint64_t sub_1E5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * v8))();
}

uint64_t sub_1E5F4(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(void *)(a2 + a3 + v8) = *(void *)(v10 + a3);
  return (*(uint64_t (**)(void))(a8 + 8 * (((a4 == 0) * (5 * (v9 ^ a6) - 178)) | v9)))();
}

uint64_t sub_1E638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((((((v8 + 639) | 4) ^ 0x54) + v8 + 14) * (a1 == v9)) ^ v8)))();
}

uint64_t sub_1E670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 164)))();
}

uint64_t sub_1E684@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  unsigned int v13 = v5 - 1;
  *(unsigned char *)(a2 + v13 + v3) = *(unsigned char *)(v4 + v13);
  return (*(uint64_t (**)(void))(a1 + 8 * ((508 * (v13 == (v6 ^ v7 ^ v8))) ^ v2)))();
}

uint64_t sub_1E6C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  LODWORD(STACK[0x268]) = v8;
  if (v8 == v12) {
    uint64_t v17 = v10;
  }
  else {
    uint64_t v17 = (v11 - 3);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * v9))(a1, a2, a3, v17);
}

uint64_t sub_1E6F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * (v50 - 44)))(a1, a2, a3, 590933547, a5, a6, a50);
}

uint64_t sub_1E720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x2B0] -= 16;
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 - 720)))();
}

uint64_t sub_1E748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8
                              + 8
                              * (((STACK[0x278] != 0) * ((((v8 - 87968581) & 0x53E4BAF) - 689) ^ 0x14)) ^ (v8 - 475))))();
}

uint64_t sub_1E794@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  __asm { BTI             j }
  uint64_t v49 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 8 * (v43 + 1047)))(a2 - 16, ((v43 + 689) ^ (unint64_t)(v44 - 107)) & *(void *)(a2 - 8));
  return (*(uint64_t (**)(uint64_t))(a43 + 8 * v43))(v49);
}

uint64_t sub_1E7D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((8 * (((v8 - 675) | 0x251) ^ 0x3DB) - 1071) * (a4 == v9)) ^ v8)))();
}

uint64_t sub_1E81C@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,int a53,int a54,uint64_t a55)
{
  __asm { BTI             j }
  *(void *)a55 = a2;
  *(_DWORD *)(a55 + 8) = v56;
  *(_DWORD *)(a55 + 12) = a54 + (((v55 - 593) | 0x238) ^ 0x33D);
  return (*(uint64_t (**)(void))(a1 + 8 * v55))();
}

uint64_t sub_1E854@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1 + 8 * (int)(((((v2 + 1301184269) & 0xB2717FD7) - 606) * (a2 == 0)) ^ v2)))();
}

uint64_t sub_1E890@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  __asm { BTI             j }
  uint64_t v49 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 8 * (v43 + 440)))(a2 - 16, ((36 * (v43 ^ 0x342u)) ^ v44) & *(void *)(a2 - 8));
  return (*(uint64_t (**)(uint64_t))(a43 + 8 * v43))(v49);
}

uint64_t sub_1E8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t (*a63)(void))
{
  __asm { BTI             j }
  STACK[0x2B0] -= 48;
  return a63();
}

uint64_t sub_1E8F8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a1))();
}

uint64_t sub_1E914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((STACK[0x2C8] != 0) * (((v8 - 1031) | 0x39) + 169)) ^ (v8 - 403))))();
}

uint64_t sub_1E94C@<X0>(uint64_t a1@<X7>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  __asm { BTI             j }
  uint64_t v49 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8 * (v43 ^ 0x779)))(a2 - 16, (v44 + (v43 - 571) + 771) & *(void *)(a2 - 8));
  STACK[0x2C8] = 0;
  return (*(uint64_t (**)(uint64_t))(a43 + 8 * v43))(v49);
}

uint64_t sub_1E998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x2B0] = STACK[0x2B0] + (v8 ^ 0x305u) - 844;
  return (*(uint64_t (**)(void))(a8 + 8 * v8))();
}

uint64_t sub_1E9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * ((v39 ^ 0x77A) + v39 - 784 - 392)))((a7 - 783), (a7 - 667), 178, a4, 1, STACK[0x290], a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39);
}

uint64_t sub_1EA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v9 ^ v8 ^ (v9 + 1065))))();
}

uint64_t sub_1EA64@<X0>(uint64_t a1@<X7>, int a2@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a1 + 8 * (((v4 == 0) * ((9 * (a2 ^ v2) - 522) ^ ((a2 - 798) | v3))) ^ a2)))();
}

uint64_t sub_1EAA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((a5 & ~(v10 ^ (*v8 == 0))) * v9) ^ v10)))();
}

uint64_t sub_1EACC@<X0>(uint64_t a1@<X3>, uint64_t a2@<X5>, uint64_t a3@<X7>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,unsigned int a43,int a44,unsigned int a45,uint64_t a46,uint64_t a47)
{
  __asm { BTI             j }
  (*(void (**)(uint64_t, uint64_t))(a3 + 8 * (int)(v48 ^ 0x437)))(a4 - 16, (v48 ^ 0xFFFFFEC5) & *(void *)(a4 - 8));
  *int v47 = 0;
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a46 + 8 * (int)v48))(a45, a43, 178, a1, 1, a2, a47);
}

uint64_t sub_1EB60()
{
  __asm { BTI             j }
  return v0();
}

uint64_t sub_1EB6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * v8))();
}

uint64_t sub_1EB80(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * ((a7 - 809) ^ a3)))();
}

uint64_t sub_1EBA0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * a2))();
}

uint64_t sub_1EBBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * v8))();
}

uint64_t sub_1EBD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (((v10 < v9) * v11) ^ v8)))();
}

uint64_t sub_1EBF4()
{
  __asm { BTI             j }
  return v0();
}

void sub_1EC00(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  *int v8 = a4;
}

uint64_t sub_1EC4C(uint64_t result)
{
  *(void *)(result + 16) = **(void **)result
                           - ((2 * **(void **)result) & 0x17784A48AED483BALL)
                           - 0x7443DADBA895BE23;
  return result;
}

void sub_1EC8C(uint64_t a1)
{
  __asm { BRAA            X8, X17 }
}

uint64_t sub_1ED3C(uint64_t a1, uint64_t a2)
{
  __asm { BTI             j }
  if (v6) {
    _ZF = v4 == 0;
  }
  else {
    _ZF = 1;
  }
  char v12 = _ZF || v3 == 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2
                                                     + 8
                                                     * ((71
                                                       * ((v12 ^ ((v5 ^ 0xB1) + 1)) & 1)) ^ (v5 - 1597164720))))(a1, a2);
}

uint64_t sub_1ED9C()
{
  __asm { BTI             j }
  uint64_t v11 = (*(uint64_t (**)(void))(v0 + 8 * (v1 + 453)))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 8 * ((1880 * (v11 == 0)) ^ v1)))(v11, v6, v7, v8, v9);
}

uint64_t sub_1EE24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  __asm { BTI             j }
  *a13 = 0;
  a13[1] = a12;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13
                                                                                                  + 8 * (((a13 + 2 != 0) * (((v14 - 608) | 0x188) ^ 0x169)) ^ v14)))(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1EE84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  __asm { BTI             j }
  uint64_t v25 = *v19;
  int v26 = 1065328829 * ((v20 + 584925304 - 2 * ((v20 - 128) & 0x22DD40F8)) ^ 0xF7580DD4);
  *(_DWORD *)(v20 - 128) = v26 + (a12 ^ 0xDFFB1F7F) + 2059202554 + ((2 * a12) & (v18 - 1074381450));
  *(_DWORD *)(v20 - 112) = v26 + v18 + 425;
  *(void *)(v17 + 248) = a16;
  *(void *)(v17 + 264) = v25;
  uint64_t v27 = (*(uint64_t (**)(uint64_t))(v16 + 8 * (v18 ^ 0x499)))(v20 - 128);
  return (*(uint64_t (**)(uint64_t))(v16
                                            + 8
                                            * (((*(_DWORD *)(v20 - 124) == 1159773901) * ((v18 - 385) ^ 0x14)) ^ v18)))(v27);
}

uint64_t sub_1EF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  __asm { BTI             j }
  uint64_t v29 = *v23;
  uint64_t v30 = v23[2];
  v19[18] = *(void *)(v18 + 8 * v22);
  v19[19] = a16;
  v19[21] = v29;
  *(_DWORD *)(v24 - 136) = (a12 ^ 0x77DFFBBB) - 276949169 + (a18 & (((v22 - 2) | 0x138) ^ 0xEFBFF64B));
  v19[23] = v30;
  v19[24] = v21;
  v19[25] = v20;
  *(_DWORD *)(v24 - 124) = (v22 - 873432829) ^ (31937209
                                              * ((((v24 - 128) | 0xF4FA4D7D) - ((v24 - 128) & 0xF4FA4D7D)) ^ 0xDEB3A293));
  v19[31] = v24 - 224;
  uint64_t v31 = (*(uint64_t (**)(uint64_t))(v18 + 8 * (v22 ^ 0x517)))(v24 - 128);
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * (v22 + 385)))(v31);
}

uint64_t sub_1F068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  __asm { BTI             j }
  uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8 * (v16 ^ 0x430)))(a13, *a14 & ((v15 + v16 + 626) ^ 0xA0CD3212));
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * v16))(v21);
}

uint64_t sub_1F0BC()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v0 + v2 + 114)))();
}

uint64_t sub_1F0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  __asm { BTI             j }
  v24[5] = &STACK[0x212A7C625A6C6185];
  v24[6] = &STACK[0x3430DCC7EAA4CDB0];
  v24[7] = &a21;
  v24[8] = &STACK[0x2C10CAA7B9981FC3];
  a21 = 0;
  a23 = 0;
  v24[9] = &a23;
  v24[10] = &STACK[0x5616B127A45970E5];
  v24[11] = &a19;
  a19 = 0;
  if (v28) {
    _ZF = v26 == 0;
  }
  else {
    _ZF = 1;
  }
  int v34 = _ZF || v25 == 0;
  HIDWORD(a1(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 590933448;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8 * (((((v27 - 1597164124) | 0x44) - 954) * v34) ^ (v27 - 1597163745))))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_1F1AC@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  uint64_t v8 = *(void *)(v3 + 112);
  *(void *)(v2 + 96) = v3 + 112;
  return (*(uint64_t (**)(void))(v1 + 8 * (((v8 == 0) * (((a1 ^ 0x170) + 1597164360) ^ 0x5F32CA3E)) ^ a1)))();
}

uint64_t sub_1F1FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,uint64_t a26)
{
  __asm { BTI             j }
  uint64_t v34 = *(unsigned int *)(v29 + 120);
  if (((v28 - 679) & *(_DWORD *)(v29 + 124)) == 2) {
    int v35 = 2;
  }
  else {
    int v35 = *(_DWORD *)(v29 + 124);
  }
  a25 = v35;
  v27[13] = &a18;
  a18 = v34;
  uint64_t v36 = (*(uint64_t (**)(void))(v26 + 8 * (v28 + 636)))();
  v27[14] = v36;
  a26 = v34;
  *int v27 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * (int)(((v36 != 0) * (((v28 + 2126138694) & 0x8145B39E) - 475)) ^ v28)))(v36, v37, v38, v39, v40, v41, v42, v43, a9, a10, a11, ((v34 + 7) & 0x1FFFFFFF8) + 16, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_1F290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  __asm { BTI             j }
  uint64_t v25 = (void *)v19[14];
  *uint64_t v25 = 0;
  v25[1] = a12;
  *int v19 = v25 + 2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 8 * (v20 - 566)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

uint64_t sub_1F2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  __asm { BTI             j }
  uint64_t v33 = *v27;
  uint64_t v34 = *(void *)v27[12];
  v27[15] = *v27;
  v27[16] = v34;
  v27[2] = 2 * a26;
  v27[3] = a26;
  v27[4] = v33;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 8 * (((((v28 - 53607473) & 0x331F9F7 ^ 0x270BE0C0) + a26 - ((2 * a26) & 0x4E17C2D6) == 0x270BE191) * ((v28 ^ 0x3B0) - 39)) ^ v28)))(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_1F360@<X0>(unsigned int a1@<W8>, uint64_t a2, uint64_t a3, int a4, unsigned int a5)
{
  __asm { BTI             j }
  *(void *)(v6 + 8) = a5;
  return (*(uint64_t (**)(void))(v5 + 8 * a1))();
}

uint64_t sub_1F388()
{
  __asm { BTI             j }
  *(unsigned char *)(v2 + v3) = *(unsigned char *)(v1 + v3);
  return (*(uint64_t (**)(void))(v5 + 8 * (((v3 != (v0 + 621) - 921) * v4) ^ v0)))();
}

uint64_t sub_1F3C0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  __asm { BTI             j }
  uint64_t v16 = **(void **)(v11 + 104);
  *(void *)(v11 + 16) = v16 << (((a1 + 33) & 0x7Fu) - 57);
  *(void *)(v11 + 24) = v16;
  *(void *)(v11 + 32) = a10;
  return (*(uint64_t (**)(void))(v10 + 8 * a1))();
}

uint64_t sub_1F404()
{
  __asm { BTI             j }
  uint64_t v9 = v1[4];
  uint64_t v10 = *v2;
  uint64_t v11 = v1[3] - (v1[2] & 0x5F7CC70EB093A4BCLL) - 0x50419C78A7B62DA2;
  uint64_t v12 = (v3 + 725)
      + (*((unsigned int *)v2 + 2) ^ 0x5DBEBDBCF9FF73B3)
      + ((v3 + 1142951302) | 0x1B12C02Du)
      + ((2 * *((unsigned int *)v2 + 2)) & 0x1F3FEE766)
      - 0x410800805FCB218ELL;
  uint64_t v13 = v1[6];
  uint64_t v14 = v1[8];
  uint64_t v15 = v1[10];
  v1[18] = *(void *)(v0 + 8 * v3);
  v1[19] = v9;
  v1[20] = v11;
  v1[21] = v10;
  v1[22] = v12;
  v1[23] = v14;
  v1[24] = &STACK[0x3CFE4C88CDEDA86F];
  v1[25] = v15;
  v1[26] = &STACK[0x3F495A5A5171A948];
  v1[27] = v13;
  v1[28] = &STACK[0x288D4EF309F2C9C2];
  *(_DWORD *)(v4 - 124) = (v3 - 873432880) ^ (31937209
                                            * ((((v4 - 128) | 0xE660F8A0) - ((v4 - 128) & 0xE660F8A0)) ^ 0xCC29174E));
  v1[31] = v4 - 224;
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(v0 + 8 * (v3 ^ 0x52A)))(v4 - 128);
  return (*(uint64_t (**)(uint64_t))(v0 + 8 * (v3 ^ 0x335 ^ (180 * (*(_DWORD *)(v4 - 128) == 590960548)))))(v16);
}

uint64_t sub_1F5B8()
{
  __asm { BTI             j }
  int v10 = (v0 + v4 - 1344274572) | 0x5020012C;
  uint64_t v11 = v2[5];
  *(_DWORD *)(v5 - 112) = (v4 + 45) ^ (143647849
                                     * ((((2 * (v5 - 128)) | 0xF9633662) - (v5 - 128) + 55469263) ^ 0x9D5AE638));
  v2[31] = v3;
  v2[33] = v11;
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(v1 + 8 * (v4 + 491)))(v5 - 128);
  return (*(uint64_t (**)(uint64_t))(v1 + 8 * ((39 * (*(_DWORD *)(v5 - 128) == (v10 ^ 0x7C0B9A49))) ^ v4)))(v12);
}

uint64_t sub_1F67C(uint64_t a1, uint64_t a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * (v3 + v4 + 466)))(a1, a2);
}

uint64_t sub_1F69C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v16 = **(void **)(v9 + 56);
  *(void *)(v9 + 136) = v16;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8 * (int)(((v16 != 0) * ((v11 + 232091632) & 0x92F7C3F7 ^ 0x162)) ^ (v10 + v11 + 823))))(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1F714()
{
  __asm { BTI             j }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8 * (v3 + 824)))(*(void *)(v1 + 136) - 16, ((v3 - 145) ^ (unint64_t)(v2 + 130)) & *(void *)(*(void *)(v1 + 136) - 8));
  return (*(uint64_t (**)(uint64_t))(v0 + 8 * v3))(v8);
}

uint64_t sub_1F750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5
                                                                                + 8
                                                                                * (((**(void **)(v6 + 72) != 0)
                                                                                  * ((v7 - 258) ^ 0x65)) ^ v7)))(a1, a2, a3, a4, a5);
}

uint64_t sub_1F788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  __asm { BTI             j }
  uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8 * (v15 + 969)))(a13 - 16, (v14 + ((v15 - 322) | 0x40u) + 388) & *(void *)(a13 - 8));
  return (*(uint64_t (**)(uint64_t))(v13 + 8 * v15))(v20);
}

uint64_t sub_1F7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6
                                                                                         + 8
                                                                                         * (int)(((**(void **)(v7 + 88) != 0)
                                                                                                * (((v8 + 1013686181) & 0xC39461DE)
                                                                                                 - 435)) ^ v8)))(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1F810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  __asm { BTI             j }
  uint64_t v21 = (*(uint64_t (**)(uint64_t, unint64_t))(v14 + 8 * (v16 ^ 0x54F)))(a14 - 16, ((2 * v16) ^ 0x142u ^ v15) & *(void *)(a14 - 8));
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * v16))(v21);
}

uint64_t sub_1F850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v17
                                                                                                  + 8 * (((a17 != 0) * (v18 - 442)) ^ v18)))(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1F880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  __asm { BTI             j }
  uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8 * (v18 ^ 0x4CB)))(a15 - 16, (v17 + v16 + 23) & *(void *)(a15 - 8));
  return (*(uint64_t (**)(uint64_t))(v15 + 8 * v18))(v23);
}

uint64_t sub_1F8BC()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v0 + 8 * v1))();
}

void sub_1F8D0(int a1@<W8>)
{
  __asm { BTI             j }
  *(_DWORD *)(v1 + 36) = a1;
}

void sub_1F914(uint64_t a1)
{
  __asm { BRAA            X11, X17 }
}

uint64_t sub_1F9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __asm { BTI             j }
  *(void *)(v11 + 88) = v12;
  *(void *)(v11 + 96) = v14;
  *(void *)(v11 + 104) = v13;
  *(void *)(v11 + 112) = v10;
  *(void *)(v11 + 56) = a1;
  uint64_t v22 = v9[8];
  *(void *)(v11 + 144) = v9[9];
  *(void *)(v11 + 152) = v22;
  *(void *)(v11 + 128) = v9[10];
  *(_DWORD *)(v11 + 212) = -31001;
  uint64_t v23 = (*(uint64_t (**)(void))(v15 + 8 * (v16 + 873434143)))();
  *(void *)(v11 + 248) = v23;
  *(void *)(v17 - 104) = v23;
  *(_DWORD *)(v17 - 112) = v16
                         - 1970833367 * ((v17 + 101157345 - 2 * ((v17 - 120) & 0x6078A59)) ^ 0x41A3FB72)
                         - 1158605879;
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(v15 + 8 * (int)(v16 ^ 0xCBF07C27)))(v17 - 120);
  *(void *)(v11 + 256) = (char *)&a9
                         - ((3
                           * (((*(void *)(v17 - 120) ^ 0x184A91D143F7256DLL) - 0x184A91D143F7256DLL) ^ ((*(void *)(v17 - 120) ^ 0x3F94A25D2BDBD6AFLL) - 0x3F94A25D2BDBD6AFLL) ^ ((*(void *)(v17 - 120) ^ 0x61A0A38E9EBBF13BLL) + ((v16 - 152855822) & 0x3D2BEDE7 ^ 0x9E5F5C7161440F21)))
                           - 0x2C844FF71C3AF6F6) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v11 + 264) = (*(uint64_t (**)(uint64_t))(v15 + 8 * (int)(v16 ^ 0xCBF07C1E)))(v24);
  *(void *)(v11 + 272) = (*(uint64_t (**)(uint64_t))(v15 + 8 * (v16 + 873434129)))(v11 + 212);
  return (*(uint64_t (**)(void))(v15 + 8 * ((1013 * (*(_DWORD *)(v11 + 212) == 0)) ^ (v16 + 873433306))))();
}

uint64_t sub_1FBC8()
{
  __asm { BTI             j }
  uint64_t v9 = *(void *)(v0 + 136);
  int v10 = (*(uint64_t (**)(void, uint64_t, uint64_t, void))(v9 + 8 * (v2 + 778)))(*(void *)(v0 + 248), ((v2 ^ 0x349) - v4 - 684 - 0x50419C7973A6A6ACLL) ^ v3, v1, *(void *)(v0 + 256));
  *(_DWORD *)(v0 + 212) = v10;
  return (*(uint64_t (**)(void))(v9 + 8 * ((1387 * (v10 == 0)) ^ v2)))();
}

uint64_t sub_1FC34()
{
  __asm { BTI             j }
  uint64_t v7 = v0[17];
  uint64_t v8 = (*(uint64_t (**)(void))(v7 + 8 * (v2 ^ 0x78E)))();
  (*(void (**)(void *, void, void, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8 * (v2 ^ 0x7A3)))(v0 + 21, v0[33], v0[34], v8, 32, 16, 3);
  *(void *)(v0[13] - 0x3CFE4C88CDEDA7F7) = v1;
  v0[35] = ((((v2 ^ 0x6BF) - 444) ^ 0xFFFFFFFFFFFFFDAELL) & (v1 - 0x1CB6BD3CF967231ALL)) + 16;
  uint64_t v9 = (*(uint64_t (**)(void))(v7 + 8 * (v2 ^ 0x78C)))();
  v0[36] = v9;
  v0[27] = 0;
  return (*(uint64_t (**)(void))(v7 + 8 * (((v9 != 0) | (2 * (v9 != 0))) ^ v2)))();
}

uint64_t sub_1FD04()
{
  __asm { BTI             j }
  uint64_t v8 = v0[35];
  uint64_t v7 = (void *)v0[36];
  *uint64_t v7 = 0;
  v7[1] = v8;
  v0[27] = v7 + 2;
  return (*(uint64_t (**)(void))(v2 + 8 * v1))();
}

uint64_t sub_1FD24()
{
  __asm { BTI             j }
  uint64_t v7 = *(void *)(v0 + 216);
  uint64_t v8 = *(void *)(v0 + 88);
  *(void *)(v0 + 296) = v8 - 0x2C10CAA7B9981F53;
  *(void *)(v8 - 0x2C10CAA7B9981F53) = v7;
  uint64_t v9 = *(unsigned int *)(v0 + 196);
  *(void *)(*(void *)(v0 + 128) - 0x288D4EF309F2C95ALL) = v9;
  *(void *)(v0 + 304) = ((v9 + 7) & 0x1FFFFFFF8) + 16;
  uint64_t v10 = (*(uint64_t (**)(void))(v2 + 8 * (v1 ^ 0x133)))();
  *(void *)(v0 + 312) = v10;
  *(void *)(v0 + 224) = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * (int)(((v10 == 0) * ((((v1 - 1023) | 0x100) ^ 0xFFFFFCEA) + v1 - 465)) ^ v1)))();
}

uint64_t sub_1FDCC()
{
  __asm { BTI             j }
  uint64_t v8 = v0[38];
  uint64_t v7 = (void *)v0[39];
  *uint64_t v7 = 0;
  v7[1] = v8;
  v0[28] = v7 + 2;
  return (*(uint64_t (**)(void))(v2 + 8 * v1))();
}

uint64_t sub_1FDF0()
{
  __asm { BTI             j }
  uint64_t v7 = (void *)(v0[18] - 0x3430DCC7EAA4CD50);
  *uint64_t v7 = v0[28];
  v0[40] = v7;
  uint64_t v8 = (*(uint64_t (**)(void, void *))(v2 + 8 * (v1 ^ 0x747)))(v0[32], v0 + 21);
  *(void *)(v0[19] - 0x3F495A5A5171A8F(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v8;
  v0[41] = (((v1 - 349) | 0x100u) ^ 0xFFFFFFFFFFFFFE52)
         + ((v1 - 756030278) & 0x2D10195E)
         + ((v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = (*(uint64_t (**)(void))(v2 + 8 * (v1 + 736)))();
  v0[42] = v9;
  v0[29] = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * (((4 * (v9 != 0)) | (8 * (v9 != 0))) ^ v1)))();
}

uint64_t sub_1FEC4()
{
  __asm { BTI             j }
  uint64_t v8 = v0[41];
  uint64_t v7 = (void *)v0[42];
  *uint64_t v7 = 0;
  v7[1] = v8;
  v0[29] = v7 + 2;
  return (*(uint64_t (**)(void))(v2 + 8 * v1))();
}

uint64_t sub_1FEE8()
{
  __asm { BTI             j }
  *(void *)(v0[14] - 0x5616B127A4597095) = v0[29];
  int v7 = (*(uint64_t (**)(void, void *))(v2 + 8 * (v1 ^ 0x4D5)))(v0[32], v0 + 21);
  return (*(uint64_t (**)(void))(v2
                              + 8 * ((1308 * ((v7 ^ 0xBF5BAF72) + 1084510350 + ((2 * v7) & 0x7EB75EE4) == 0)) ^ v1)))();
}

uint64_t sub_1FFD0()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 136) + 8 * (v1 + v2 + 191)))();
}

uint64_t sub_1FFF4()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(*(void *)(v0 + 136) + 8 * (v1 + v2)))(*(void *)(v0 + 56));
}

uint64_t sub_20038(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BTI             j }
  if (v6) {
    _ZF = v8 == 0;
  }
  else {
    _ZF = 1;
  }
  char v18 = _ZF || v5 == 0 || v7 == 0 || v3 == 0;
  *(_DWORD *)(v4 + 444) = 1159746899;
  return (*(uint64_t (**)(void))(v9
                              + 8
                              * ((237 * ((v18 ^ (v10 - a3 + 58)) & 1)) ^ (v10 + 873433680))))();
}

uint64_t sub_200A0(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BTI             j }
  unsigned int v12 = ((*v6 << ((v3 - 47) ^ a3)) & 0x99577A7E) + (*v6 ^ 0xCCABBD3F);
  *(_DWORD *)(v4 + 448) = v12;
  *(_DWORD *)(v4 + 444) = v5 + 2;
  return (*(uint64_t (**)(void))(v7 + 8 * ((120 * (((v3 - 1005) | 0x300) + 861159281 + v12 > 0xFFFFFFFB)) ^ v3)))();
}

uint64_t sub_20128@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  int v8 = *(_DWORD *)(v2 + 448) - 252742300 + ((v1 - 140) | 0x24);
  *(_DWORD *)(v2 + 452) = v8;
  *(_DWORD *)(v2 + 388) = 1578122424;
  uint64_t v9 = *(uint64_t (**)(void))(v3 + 8 * ((30 * (v8 == ((v1 - 1476019128) & 0x57FA426F) - 1113902205)) ^ v1));
  uint64_t v10 = *(void *)(a1 + 8 * (v1 ^ 0x369)) - 12;
  uint64_t v11 = *(void *)(a1 + 8 * (v1 ^ 0x349)) - 4;
  *(void *)(v2 + 128) = *(void *)(a1 + 8 * (v1 - 842));
  *(void *)(v2 + 144) = v11;
  *(void *)(v2 + 152) = v10;
  return v9();
}

uint64_t sub_201D0(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BTI             j }
  *(_DWORD *)(v4 + 596) = *(_DWORD *)(v4 + 388);
  int v14 = *(void *)(v6 + 8);
  *(void *)(v4 + 264) = v6 + 8;
  *(_DWORD *)(v7 + 32) = v14;
  int v15 = *(void *)(v6 + 16);
  *(void *)(v4 + 272) = v6 + 16;
  *(_DWORD *)(v7 + 6(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v15;
  int v16 = *(void *)(v6 + 24);
  *(void *)(v4 + 288) = v6 + 24;
  *(_DWORD *)(v7 + 72) = v16;
  *(_DWORD *)(v7 + 88) = *(void *)(v6 + 32);
  int v17 = *(_DWORD *)(v6 + 40);
  *(void *)(v4 + 296) = v6 + 32;
  *(void *)(v4 + 312) = v6 + 40;
  *(_DWORD *)(v7 + 104) = (v17 - ((2 * v17) & 0xA4C2B9E0) + 1382112496) ^ 0x52615CF0;
  *(unsigned char *)(v7 + 108) = (v3 + 9 + *(unsigned char *)(v6 + 48) - ((2 * *(unsigned char *)(v6 + 48)) & 0xD4) + 93) ^ ((v3 ^ (a3 + 3)) + 96);
  *(void *)uint64_t v7 = 0;
  unsigned int v18 = v9 + *(_DWORD *)(v4 + 448) + 848;
  *(_DWORD *)(v7 + 16) = v18;
  unsigned int v19 = (*(_DWORD *)(v6 + 56) - ((2 * *(_DWORD *)(v6 + 56)) & 0xE76E5394) + 1941383626) ^ 0x73B729CA;
  *(_DWORD *)(v7 + 2(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v19;
  int v21 = *(_DWORD *)(v6 + 64);
  uint64_t v20 = v6 + 64;
  *(void *)(v4 + 32(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v20;
  *(_DWORD *)(v7 + 12(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v21 - ((2 * v21) & 0xD3CBD0B4) + 1776674906) ^ 0x69E5E85A;
  *(_DWORD *)(v7 + 124) = (*(_DWORD *)(v20 + 8) - ((2 * *(_DWORD *)(v20 + 8)) & 0xA416D188) - 771004220) ^ 0xD20B68C4;
  *(_DWORD *)(v7 + 16(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (*(_DWORD *)(v20 + 16) - ((2 * *(_DWORD *)(v20 + 16)) & 0x298DBBC4) + 348577250) ^ 0x14C6DDE2;
  *(_DWORD *)(v4 + 444) = v5 + 1;
  return (*(uint64_t (**)(void))(v8 + 8 * ((55 * (v19 <= v18)) ^ v3)))();
}

uint64_t sub_2035C@<X0>(int a1@<W2>, int a2@<W8>)
{
  __asm { BTI             j }
  uint64_t v9 = **(void **)(v2 + 264);
  *(void *)(v2 + 60(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v9;
  uint64_t v10 = (*(_DWORD *)(v2 + 596) - 1578122424);
  *(void *)(v2 + 608) = v10;
  _CF = __CFADD__(v10, v9);
  unint64_t v11 = v10 + v9;
  int v12 = _CF;
  *(void *)(v2 + 616) = v11;
  *(void *)(v2 + 624) = v11 & ((a1 + a2 - 270) + (unint64_t)((a2 << 6) ^ 0x41C0u) + 873432181);
  *(_DWORD *)(v2 + 444) = v3 - 2;
  return (*(uint64_t (**)(void))(v4 + 8 * ((106 * ((HIDWORD(v11) == 0) & ~v12)) ^ a2)))();
}

uint64_t sub_203E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  unsigned int v14 = (*(_DWORD *)(v7 + 616) ^ 0xB767FF5F)
      + ((2 * *(_DWORD *)(v7 + 616)) & 0x6ECFFEBE)
      + ((226 * (v6 ^ 0x283)) ^ 0xF9932951);
  unsigned int v15 = a6 + 2108464962 + ((v6 + 1244671360) | 0x81C0490A);
  int v16 = (v15 < 0xB0FB2B56) ^ (v14 < 0xB0FB2B56);
  BOOL v17 = v14 < v15;
  if (v16) {
    BOOL v17 = v15 < 0xB0FB2B56;
  }
  *(_DWORD *)(v7 + 444) = v8;
  return (*(uint64_t (**)(void))(v9 + 8 * ((1763 * v17) ^ v6)))();
}

uint64_t sub_20498(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  unsigned int v10 = (*(_DWORD *)(v4 + 600)
       - ((2 * *(_DWORD *)(v4 + 600)) & 0x80E13F08)
       + ((a3 + v3 - 332616154) & 0x47E2D6AF ^ 0xC0709F11)
       - 18) ^ 0xC0709F84;
  *(_DWORD *)(v4 + 636) = v10;
  return (*(uint64_t (**)(void))(v5 + 8 * ((104 * (v10 != 0)) ^ v3)))();
}

uint64_t sub_20514()
{
  __asm { BTI             j }
  uint64_t v7 = *(void *)(v1 + 608);
  *(void *)(v1 + 64(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v7 ^ 0x4FE7F959CFE75E35) - 0x4FE7F959CFE75E35 + ((2 * v7) & 0x19FCEBC6ALL);
  *(void *)(v1 + 648) = (v7 ^ 0x5735FBFBFFDF77D7) - 0x5735FBFBFFDF77D7 + ((2 * v7) & 0x1FFBEEFAELL);
  *(void *)(v1 + 392) = *(unsigned int *)(v1 + 636);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8 * v0))((v0 - 537855145) & 0xEBFF7D2B ^ 0xCBF0790BLL, 83);
}

uint64_t sub_205F0(uint64_t a1, char a2)
{
  __asm { BTI             j }
  unsigned int v16 = v4 - 1;
  uint64_t v17 = v16 + v3;
  *(unsigned char *)(v8 + v16 + v5) = *(unsigned char *)(v11 + (v17 & 0xF)) ^ *(unsigned char *)(v7 + v17) ^ *(unsigned char *)((v17 & 0xF)
                                                                                              + *(void *)(v6 + 152)
                                                                                              + 5) ^ ((v17 & 0xF) * a2) ^ *(unsigned char *)(v10 + (v17 & 0xF) + a1);
  return (*(uint64_t (**)(void))(v9 + 8 * ((31 * (v16 == 0)) ^ v2)))();
}

uint64_t sub_2065C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(void *)(v9 + 392) = v8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 8 * (v11 + 873433285)))(a8, a2, 3421534475);
}

uint64_t sub_20694(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  *(void *)(v6 + 24) = v7 + *(void *)(v5 + 608);
  uint64_t v14 = **(void **)(v5 + 272);
  *(void *)(v5 + 656) = v14;
  uint64_t v15 = *(void *)(v5 + 624);
  _CF = __CFADD__(v15, v14);
  unint64_t v16 = v15 + v14;
  int v17 = _CF;
  *(void *)(v5 + 664) = v16;
  *(void *)(v5 + 672) = v16;
  if (HIDWORD(v16)) {
    int v18 = 1;
  }
  else {
    int v18 = v17;
  }
  *(_DWORD *)(v5 + 444) = v4;
  return (*(uint64_t (**)(void))(v8 + 8 * ((108 * ((((v9 + 647442124) ^ v18) & 1) == 0)) ^ (a4 + v9 + 1079))))();
}

uint64_t sub_20710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  unsigned int v14 = (*(_DWORD *)(v7 + 664) ^ 0xF57D4E3F) - 242667262 + ((2 * *(_DWORD *)(v7 + 664)) & 0xEAFA9C7E);
  int v15 = (a6 + 2141744183 < (((v6 & 0xD785A3B) + 636) ^ 0x2CF602C5 ^ ((v6 & 0xD785A3B) - 269256340) & 0xDBFCFD8B)) ^ (v14 < 0xE7067F41);
  BOOL v16 = v14 < a6 + 2141744183;
  if (v15) {
    BOOL v16 = a6 + 2141744183 < (((v6 & 0xD785A3B) + 636) ^ 0x2CF602C5 ^ ((v6 & 0xD785A3B) - 269256340) & 0xDBFCFD8B);
  }
  *(_DWORD *)(v7 + 444) = v8;
  return (*(uint64_t (**)(uint64_t))(v9 + 8 * ((1663 * v16) ^ v6 & 0xD785A3Bu)))(a1);
}

uint64_t sub_207D4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  *(void *)(v5 + 336) = v6 + 36;
  unsigned int v12 = (*(_DWORD *)(v5 + 656) - ((2 * *(_DWORD *)(v5 + 656)) & 0x898D3CB2) + 1153867353) ^ 0x44C69E59;
  *(_DWORD *)(v5 + 684) = v12;
  return (*(uint64_t (**)(void))(v7
                              + 8
                              * (int)((((((v4 - 382) ^ (v12 == 0)) & 1) == 0)
                                     * (a4 + ((v4 - 805374244) & 0xFBF17D9F) + 89)) ^ v4)))();
}

uint64_t sub_20854()
{
  __asm { BTI             j }
  *(void *)(v1 + 688) = ((2 * *(_DWORD *)(v1 + 616)) & 0xEDDDEFFE)
                        + (*(void *)(v1 + 624) ^ 0x5F5567DC76EEF7FFLL)
                        - 0x5F5567DC76EEF7FFLL;
  *(void *)(v1 + 40(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(unsigned int *)(v1 + 684);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 8 * (v0 | 4)))((((v0 | 4) - 1024449300) | 0x900510Au) ^ 0xCBF07905, 83, 1847);
}

uint64_t sub_208F8@<X0>(uint64_t a1@<X0>, char a2@<W1>, int a3@<W2>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  __asm { BTI             j }
  unsigned int v16 = v6 - 1;
  uint64_t v17 = v16 + v7;
  *(unsigned char *)(v8 + v16) = *(unsigned char *)(a5 + (v17 & a1)) ^ *(unsigned char *)(v9 + v17) ^ *(unsigned char *)((v17 & a1) + a4 + 1) ^ *(unsigned char *)((v17 & a1) + v11 + 5) ^ ((v17 & a1) * a2);
  return (*(uint64_t (**)(void))(v10 + 8 * (((v16 == 0) * a3) ^ v5)))();
}

uint64_t sub_20958(uint64_t a1, uint64_t a2)
{
  __asm { BTI             j }
  *(void *)(v3 + 40(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8 * (v5 + 873433004)))(a1, a2, 3421534475);
}

uint64_t sub_20994(uint64_t a1, uint64_t a2, int a3, int a4)
{
  __asm { BTI             j }
  uint64_t v13 = **(void **)(v5 + 288);
  *(void *)(v5 + 696) = v13;
  uint64_t v14 = *(void *)(v5 + 672);
  _CF = __CFADD__(v14, v13);
  unint64_t v15 = v14 + v13;
  int v16 = _CF;
  *(void *)(v5 + 704) = v15;
  *(void *)(v5 + 712) = v15;
  if (v15 > ((v8 - a3 + 531) ^ 0xFFFFFDEDuLL)) {
    int v17 = 1;
  }
  else {
    int v17 = v16;
  }
  *(_DWORD *)(v5 + 444) = v4;
  return (*(uint64_t (**)(uint64_t))(v7 + 8 * ((159 * v17) | (a4 + v8 + 63))))(v6);
}

uint64_t sub_209FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  unsigned int v15 = ((((v6 - 872548372) & 0xFFF27F0B) - 1282441244) ^ *(_DWORD *)(v7 + 704))
      + ((2 * *(_DWORD *)(v7 + 704)) & 0xFEFFF1DC)
      - 2112248453;
  int v16 = ((a6 - 1707373729) < 0x1999E69) ^ (v15 < (v6 ^ 0x1999C7Bu));
  BOOL v17 = v15 < a6 - 1707373729;
  if (v16) {
    BOOL v17 = (a6 - 1707373729) < 0x1999E69;
  }
  *(_DWORD *)(v7 + 444) = v8;
  return (*(uint64_t (**)(uint64_t))(v10 + 8 * ((335 * v17) ^ v6)))(v9);
}

uint64_t sub_20AB0@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  int v10 = (v1 + *(void *)(v4 + 696) - ((*(void *)(v4 + 696) << (((v3 + 105) & 0xFAu) + 39)) & v2) + 115) ^ a1;
  *(_DWORD *)(v4 + 724) = v10;
  return (*(uint64_t (**)(void))(v5 + 8 * ((249 * ((((v3 - 591164) ^ (v10 == 0)) & 1) == 0)) ^ v3)))();
}

uint64_t sub_20B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  *(_DWORD *)(v7 + 64) = a6;
  uint64_t v13 = 2 * *(void *)(v7 + 664);
  uint64_t v14 = *(void *)(v7 + 672);
  *(void *)(v7 + 728) = (v14 ^ 0xF9F2DA79ECFE6F5CLL)
                        + (v13 & 0x1D9FCDEB8)
                        + ((v6 - 3) ^ 0x60D258613019073);
  *(void *)(v7 + 736) = (v13 & 0x1E3FAFFFCLL) + (v14 ^ 0x8F7F73AEF1FD7FFELL) + 0x70808C510E028002;
  *(void *)(v7 + 408) = *(unsigned int *)(v7 + 724);
  return (*(uint64_t (**)(void))(v8 + 8 * v6))();
}

uint64_t sub_20BFC(uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v21 = v10 + v11;
  *(unsigned char *)(v13 + v10 + a1) = *(unsigned char *)(v8 + (v21 & 0xF)) ^ *(unsigned char *)(v15 + v21) ^ *(unsigned char *)((v21 & 0xF) + a8 + 1) ^ *(unsigned char *)((v21 & 0xF) + v16 + 5) ^ ((v21 & 0xF) * ((v12 + v9 + 40) ^ a2));
  return (*(uint64_t (**)(void))(v14 + 8 * (((v10 != 0) * a3) ^ v9)))();
}

uint64_t sub_20C6C(uint64_t a1, uint64_t a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 8 * (v3 + 873433419)))(a1, a2, 3421534475);
}

uint64_t sub_20CA4(uint64_t a1, uint64_t a2, int a3, int a4)
{
  __asm { BTI             j }
  *(void *)(v7 + 64) = v8 + *(void *)(v5 + 672);
  uint64_t v15 = **(void **)(v5 + 296);
  *(void *)(v5 + 744) = v15;
  uint64_t v16 = *(void *)(v5 + 712);
  _CF = __CFADD__(v16, v15);
  unint64_t v17 = v16 + v15;
  int v18 = _CF;
  *(void *)(v5 + 752) = v17;
  *(void *)(v5 + 76(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v17;
  *(_DWORD *)(v5 + 444) = v4;
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8
                                            * ((((HIDWORD(v17) == 0) & ~v18) * ((v10 ^ (a3 + 202)) - 153)) ^ (a4 + v10 + 529))))(v6);
}

uint64_t sub_20D18(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  unsigned int v16 = (*(_DWORD *)(v8 + 752) ^ 0xB7FEB65F) - 1467563541 + ((*(_DWORD *)(v8 + 752) << (v6 ^ v7 ^ a3)) & 0x6FFD6CBE);
  int v17 = ((a6 - 114858688) < 0x6085784A) ^ (v16 < (((v6 + 561) | 0x2B) ^ 0x60857B71u));
  BOOL v18 = v16 < a6 - 114858688;
  if (v17) {
    BOOL v18 = (a6 - 114858688) < 0x6085784A;
  }
  *(_DWORD *)(v8 + 444) = v9;
  return (*(uint64_t (**)(uint64_t))(v11 + 8 * ((38 * v18) ^ v6)))(v10);
}

uint64_t sub_20DC0(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  int v12 = (a3 + (v5 ^ 0x33C) - 8) ^ 0xB80E68E ^ (v3
                                             + *(_DWORD *)(v6 + 744)
                                             - (v4 & (2 * *(_DWORD *)(v6 + 744)))
                                             + 73 * (v5 ^ 0x33C)
                                             - 396);
  *(_DWORD *)(v6 + 772) = v12;
  return (*(uint64_t (**)(void))(v7 + 8 * ((106 * (v12 != 0)) ^ v5)))();
}

uint64_t sub_20E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  *(_DWORD *)(v7 + 64) = a6;
  uint64_t v13 = 2 * *(void *)(v7 + 704);
  uint64_t v14 = *(void *)(v7 + 712);
  *(void *)(v7 + 776) = (v13 & 0xFDFDBEE8) + (v14 ^ 0x7B6AB1597EFEDF74) - 0x7B6AB1597EFEDF74;
  *(void *)(v7 + 784) = (v13 & 0x1F7BEDFFELL) + (v14 ^ 0x5F7F7FAFFBDF6FFFLL) - 0x5F7F7FAFFBDF6FFFLL;
  uint64_t v15 = *(unsigned int *)(v7 + 772);
  *(void *)(v7 + 416) = v15;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8 * v6))(v15 - 1, -3421534473, 83, 981);
}

uint64_t sub_20F04(uint64_t a1, uint64_t a2, char a3, int a4)
{
  __asm { BTI             j }
  uint64_t v18 = a1 + v6;
  *(unsigned char *)(v9 + a1 + v7) = *(unsigned char *)(v4 + (v18 & 0xF)) ^ *(unsigned char *)(v8 + v18) ^ *(unsigned char *)((v18 & 0xF) + v12 + 5) ^ *(unsigned char *)(v13 + (v18 & 0xF) + v11 + a2) ^ ((v18 & 0xF) * a3);
  return (*(uint64_t (**)(uint64_t))(v10 + 8 * (((a1 == 0) * a4) ^ v5)))(a1 - 1);
}

uint64_t sub_20F68()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v0 + 8 * (v1 + 873433300)))();
}

uint64_t sub_20F9C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  *(void *)(v7 + 8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v8 + *(void *)(v5 + 712);
  uint64_t v15 = **(void **)(v5 + 312);
  *(void *)(v5 + 792) = v15;
  uint64_t v16 = *(void *)(v5 + 760);
  _CF = __CFADD__(v16, v15);
  unint64_t v17 = v16 + v15;
  int v18 = _CF;
  *(void *)(v5 + 80(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v17;
  *(void *)(v5 + 808) = v17;
  if (v17 > (unint64_t)(v10 + 873433045) + 4294967072u) {
    int v19 = 1;
  }
  else {
    int v19 = v18;
  }
  *(_DWORD *)(v5 + 444) = v4;
  return (*(uint64_t (**)(uint64_t))(v9 + 8 * ((59 * v19) ^ (a4 + v10 + 266))))(v6);
}

uint64_t sub_2101C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  unsigned int v15 = (*(_DWORD *)(v7 + 800) ^ 0xFFC8E677)
      + 862312683
      + ((*(_DWORD *)(v7 + 800) << ((v6 ^ 0xF8) - 38)) & (v6 - a4 + 866210566));
  int v16 = ((a6 - 875516840) < 0x332EBF62) ^ (v15 < 0x332EBF62);
  BOOL v17 = v15 < a6 - 875516840;
  if (v16) {
    BOOL v17 = (a6 - 875516840) < 0x332EBF62;
  }
  *(_DWORD *)(v7 + 444) = v8;
  return (*(uint64_t (**)(uint64_t))(v10 + 8 * ((1050 * v17) ^ v6)))(v9);
}

uint64_t sub_210C0@<X0>(int a1@<W1>, int a2@<W5>, int a3@<W8>)
{
  __asm { BTI             j }
  *(_DWORD *)(v6 + 64) = a2;
  *(void *)(v6 + 104) = v7;
  unsigned int v13 = (v5 + 1140476374) & 0xBC05B57F ^ (a3 - 139) ^ (v3
                                                     + *(_DWORD *)(v6 + 792)
                                                     - (v4 & (2 * *(_DWORD *)(v6 + 792)))
                                                     + 115);
  *(_DWORD *)(v6 + 82(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v13;
  return (*(uint64_t (**)(void))(v8 + 8 * ((122 * (v13 == (((v5 + 13639395) | 0xCB205800) ^ (a1 - 1)))) ^ v5)))();
}

uint64_t sub_21144()
{
  __asm { BTI             j }
  uint64_t v6 = 2 * *(void *)(v1 + 752);
  uint64_t v7 = *(void *)(v1 + 760);
  *(void *)(v1 + 824) = (v6 & 0x19DC8DE68) + (v7 ^ 0x53FBD0D9CEE46F34) - 0x53FBD0D9CEE46F34;
  *(void *)(v1 + 832) = (v6 & 0x1E5FEFFACLL) + (v7 ^ 0x1FB77BEBF2FF7FD6) - 0x1FB77BEBF2FF7FD6;
  *(void *)(v1 + 424) = *(unsigned int *)(v1 + 820);
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(v1 + 136) + 8 * v0))(*(void *)(v1 + 128), 173);
}

uint64_t sub_21228(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  uint64_t v22 = (v8 & v12) + v10;
  *(unsigned char *)(v13 + (v8 & v12) + v11) = *(unsigned char *)(a1 + (v22 & 0xF)) ^ *(unsigned char *)(v15 + v22) ^ *(unsigned char *)((v22 & 0xF) + v17 + 1) ^ *(unsigned char *)((v22 & 0xF) + v16 + 5) ^ ((v22 & 0xF) * v14);
  return (*(uint64_t (**)(void))(a8 + 8 * ((((v8 & v12) == 0) * a2) ^ v9)))();
}

uint64_t sub_21288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(a8 + 8 * (v8 + 873433427)))();
}

uint64_t sub_212A8()
{
  __asm { BTI             j }
  *(void *)(*(void *)(v1 + 104) + 96) = v3 + *(void *)(v1 + 760);
  uint64_t v9 = **(void **)(v1 + 320);
  *(void *)(v1 + 28(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v9;
  uint64_t v10 = *(void *)(v1 + 808);
  _CF = __CFADD__(v10, v9);
  unint64_t v11 = v10 + v9;
  int v12 = _CF;
  *(_DWORD *)(v1 + 212) = ((2 * v11) & 0xF95EAFBC) + (v4 ^ 0x375F2ED4 ^ v11);
  *(_DWORD *)(v1 + 444) = v0;
  return (*(uint64_t (**)(uint64_t))(*(void *)(v1 + 136)
                                            + 8 * ((v4 + 873433462) | (32 * ((HIDWORD(v11) == 0) & ~v12)))))(v2);
}

uint64_t sub_21354(uint64_t a1, uint64_t a2, int a3, int a4)
{
  __asm { BTI             j }
  unsigned int v12 = *(_DWORD *)(v6 + 212) + 1944447055 + ((v4 + 1861626845) & 0x9109D77F);
  unsigned int v13 = v5 + 154612109;
  BOOL v14 = (v5 + 154612109) < 0x70954497;
  int v15 = v14 ^ (v12 < v4 - a4 - 1532704127);
  BOOL v16 = v12 < v13;
  if (v15) {
    BOOL v17 = v14;
  }
  else {
    BOOL v17 = v16;
  }
  *(_DWORD *)(v6 + 444) = a3;
  return (*(uint64_t (**)(void))(v7 + 8 * ((734 * v17) ^ v4)))();
}

uint64_t sub_213EC(uint64_t a1, int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((((((a2 + (v2 ^ 0x5CF) - 422) ^ (*(void *)(v3 + 280) == 0)) & 1) == 0) | (4 * ((((a2 + (v2 ^ 0x5CF) - 422) ^ (*(void *)(v3 + 280) == 0)) & 1) == 0))) ^ v2)))();
}

uint64_t sub_21450@<X0>(int a1@<W4>, int a2@<W8>)
{
  __asm { BTI             j }
  int v10 = (v2 + *(_DWORD *)(v5 + 280) - (v3 & (2 * *(_DWORD *)(v5 + 280))) + 115) ^ a2;
  *(_DWORD *)(v5 + 244) = v10;
  return (*(uint64_t (**)(void))(*(void *)(v5 + 136)
                              + 8
                              * (int)(((v10 != 0) * ((a1 + ((2 * v4 - 604210511) & 0xEFF3FB0E) + 405) ^ 0x1B7)) ^ (2 * v4))))();
}

uint64_t sub_214BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BTI             j }
  uint64_t v12 = 2 * *(void *)(v7 + 800);
  uint64_t v13 = *(void *)(v7 + 808);
  *(void *)(v7 + 304) = (v12 & 0xDDFBDF38) + (v13 ^ 0x6FEEDE7D6EFDEF9CLL) - 0x6FEEDE7D6EFDEF9CLL;
  *(void *)(v7 + 328) = (v12 & 0x1E5FACFBCLL) + (v13 ^ 0xDFBD5FB3F2FD67DELL) + 0x2042A04C0D029822;
  *(void *)(v7 + 432) = *(unsigned int *)(v7 + 244);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(v7 + 136)
                                                                                                 + 8 * v6))(a1, a2, a3, a4, a5, a6, *(void *)(v7 + 152));
}

uint64_t sub_2157C@<X0>(int a1@<W3>, uint64_t a2@<X6>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  uint64_t v16 = v4 + a3;
  *(unsigned char *)(v11 + v4 + v3) = *(unsigned char *)(v9[16] + (v16 & 0xF)) ^ *(unsigned char *)(v10 + v16) ^ *(unsigned char *)((v16 & 0xF)
                                                                                                  + v9[18]
                                                                                                  + 1) ^ (((v4 + a3) & 0xF) * v7) ^ *(unsigned char *)(a2 + (v16 & 0xF) + ((a1 + v5 - 407) ^ v6));
  return (*(uint64_t (**)(void))(v9[17] + 8 * (((v4 == 0) * v8) ^ v5)))();
}

uint64_t sub_215F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(*(void *)(v5 + 136) + 8 * (a5 + v6 + 841)))();
}

uint64_t sub_21610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(*(void *)(v5 + 136) + 8 * (a5 + v6 + 1129)))();
}

uint64_t sub_21634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  *(void *)(*(void *)(v7 + 104) + 112) = v6;
  unsigned int v14 = *(_DWORD *)(v7 + 212) - 1947376148;
  unsigned int v15 = *(_DWORD *)(v7 + 64) + 557755072;
  BOOL v16 = v14 < 0x889CBDCA;
  BOOL v17 = v14 > v15;
  if (v15 < 0x889CBDCA != v16) {
    BOOL v17 = v16;
  }
  if (!v17) {
    a6 = 1159773901;
  }
  *(_DWORD *)(v7 + 444) = a6;
  return (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 136) + 8 * (v9 + 873433045)))(v8);
}

uint64_t sub_216C4()
{
  __asm { BTI             j }
  *(_DWORD *)(v0 + 102(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 1077821212;
  return (*(uint64_t (**)(void))(v2 + 8 * (((((v3 + 873433872) | 0xA0) ^ 0x478) * (v1 != 0)) ^ (v3 + 873433920))))();
}

uint64_t sub_21714@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  unsigned int v10 = *v4;
  *(_DWORD *)(v3 + 1024) = *v4;
  *(_DWORD *)(v3 + 102(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = a1 - 100;
  return (*(uint64_t (**)(void))(v5
                              + 8 * (((v10 > v2 + ((v1 - 335545739) & 0xDFF079DA) + 254) * ((v1 - 384) ^ 0x35F)) ^ v1)))();
}

uint64_t sub_21770@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(v3 + 1031) = *(_DWORD *)(v3 + 1024);
  uint64_t v9 = *(void *)(v4 + 8);
  uint64_t v10 = *(void *)(v4 + 16);
  *(void *)(v3 + 1032) = v9;
  *(void *)(v3 + 104(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v10;
  if (v9) {
    _ZF = v10 == 0;
  }
  else {
    _ZF = 1;
  }
  int v12 = _ZF;
  *(_DWORD *)(v3 + 102(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = a1;
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (int)((v12
                                     * (((v1 - 1038076720) ^ 0xC2203A3E ^ (v2 - 404)) + ((v1 - 1038076720) | 0x9D04100))) ^ v1)))();
}

uint64_t sub_217D8()
{
  __asm { BTI             j }
  BOOL v8 = *(_DWORD *)(v2 + 1024) == v1 + ((v0 - 1033867826) | 0x9900908) - 1;
  *(unsigned char *)(v2 + 523) = v8;
  return (*(uint64_t (**)(void))(v3 + 8 * ((81 * (((v0 - 50) ^ 0xDF ^ v8) & 1)) ^ v0)))();
}

uint64_t sub_21834()
{
  __asm { BTI             j }
  *(_DWORD *)(v1 + 844) = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * v0))();
}

uint64_t sub_21870@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v3 + 8 * ((248 * (*(void *)(v1 + 8 * v2) != 0)) ^ a1)))();
}

uint64_t sub_2189C@<X0>(int a1@<W2>, int a2@<W8>)
{
  __asm { BTI             j }
  int v10 = (a2 - 548) | v4;
  BOOL v11 = ((a1 + v10 - 222) ^ (a1 + 620) ^ (v10 + 415)) + v3 == v2;
  return (*(uint64_t (**)(void))(v5 + 8 * ((v11 | (32 * v11)) ^ v10)))();
}

uint64_t sub_218E0()
{
  __asm { BTI             j }
  *(_DWORD *)(v3 + 844) = v1;
  *(_DWORD *)(v3 + 1052) = v0;
  return (*(uint64_t (**)(void))(v4 + 8 * (v2 + v5 + 524)))();
}

uint64_t sub_21900(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BTI             j }
  int v12 = v7 - a3 + 811;
  int v13 = v3 + v7 + 907;
  uint64_t v14 = (32 * *(unsigned int *)(v4 + 1024)) | 0x18;
  unsigned int v15 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8 * (v7 ^ (a3 + 800)));
  *(void *)(v4 + 56) = a1;
  uint64_t v16 = v15(v14, 8);
  *(void *)uint64_t v16 = 0;
  *(void *)(v16 + 8) = v14;
  *(void *)(v4 + 1056) = v16 + 16;
  void *v5 = v16 + 16;
  *(unsigned char *)(v16 + 16) = *(unsigned char *)(v4 + 1031);
  uint64_t v17 = *(void *)(v4 + 56);
  *(_DWORD *)(v4 + 102(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 1077848214;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6
                                                     + 8 * ((*(unsigned __int8 *)(v4 + 523) * (v12 ^ 0x328)) | v13)))(v17, 3421534475);
}

uint64_t sub_21998(uint64_t a1, uint64_t a2)
{
  __asm { BTI             j }
  *(void *)(v2 + 1064) = v2 + 2160;
  *(void *)(v2 + 1072) = (v2 + 2080) | 3;
  *(void *)(v2 + 108(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v2 + 2080) | 4;
  *(void *)(v2 + 1088) = (v2 + 2080) | 5;
  *(void *)(v2 + 1096) = (v2 + 2080) | 6;
  *(void *)(v2 + 1104) = v2 + 2348;
  *(void *)(v2 + 1112) = v2 + 2728;
  *(void *)(v2 + 112(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2540;
  *(void *)(v2 + 1128) = v2 + 2720;
  *(void *)(v2 + 1136) = v2 + 2528;
  *(void *)(v2 + 1144) = v2 + 2344;
  *(void *)(v2 + 1152) = v2 + 2708;
  *(void *)(v2 + 116(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2340;
  *(void *)(v2 + 1168) = v2 + 2512;
  *(void *)(v2 + 1176) = v2 + 2536;
  *(void *)(v2 + 1184) = v2 + 2500;
  *(void *)(v2 + 1192) = v2 + 2688;
  *(void *)(v2 + 120(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2724;
  *(void *)(v2 + 1208) = v2 + 2524;
  *(void *)(v2 + 1216) = v2 + 2712;
  *(void *)(v2 + 1224) = v2 + 2520;
  *(void *)(v2 + 1232) = v2 + 2504;
  *(void *)(v2 + 124(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2716;
  *(void *)(v2 + 1248) = v2 + 2316;
  *(void *)(v2 + 1256) = v2 + 2336;
  *(void *)(v2 + 1264) = v2 + 2704;
  *(void *)(v2 + 1272) = v2 + 2516;
  *(void *)(v2 + 128(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2312;
  *(void *)(v2 + 1288) = v2 + 2324;
  *(void *)(v2 + 1296) = v2 + 2308;
  *(void *)(v2 + 1304) = v2 + 2696;
  *(void *)(v2 + 1312) = v2 + 2332;
  *(void *)(v2 + 132(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2508;
  *(void *)(v2 + 1328) = v2 + 2480;
  *(void *)(v2 + 1336) = v2 + 2532;
  *(void *)(v2 + 1344) = v2 + 2692;
  *(void *)(v2 + 1352) = v2 + 2676;
  *(void *)(v2 + 136(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2328;
  *(void *)(v2 + 1368) = v2 + 2492;
  *(void *)(v2 + 1376) = v2 + 2672;
  *(void *)(v2 + 1384) = v2 + 2488;
  *(void *)(v2 + 1392) = v2 + 2684;
  *(void *)(v2 + 140(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2304;
  *(void *)(v2 + 1408) = v2 + 2496;
  *(void *)(v2 + 1416) = v2 + 2280;
  *(void *)(v2 + 1424) = v2 + 2680;
  *(void *)(v2 + 1432) = v2 + 2296;
  *(void *)(v2 + 144(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2484;
  *(void *)(v2 + 1448) = v2 + 2288;
  *(void *)(v2 + 1456) = v2 + 2292;
  *(void *)(v2 + 1464) = v2 + 2700;
  *(void *)(v2 + 1472) = v2 + 2320;
  *(void *)(v2 + 148(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2668;
  *(void *)(v2 + 1488) = v2 + 2472;
  *(void *)(v2 + 1496) = v2 + 2660;
  *(void *)(v2 + 1504) = v2 + 2276;
  *(void *)(v2 + 1512) = v2 + 2464;
  *(void *)(v2 + 152(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2268;
  *(void *)(v2 + 1528) = v2 + 2272;
  *(void *)(v2 + 1536) = v2 + 2468;
  *(void *)(v2 + 1544) = v2 + 2460;
  *(void *)(v2 + 1552) = v2 + 2652;
  *(void *)(v2 + 156(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2284;
  *(void *)(v2 + 1568) = v2 + 2300;
  *(void *)(v2 + 1576) = v2 + 2476;
  *(void *)(v2 + 1584) = v2 + 2656;
  *(void *)(v2 + 1592) = v2 + 2648;
  *(void *)(v2 + 160(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2664;
  *(void *)(v2 + 1608) = v2 + 2139;
  *(void *)(v2 + 1616) = v2 + 2145;
  *(void *)(v2 + 1624) = v2 + 2129;
  *(void *)(v2 + 1632) = v2 + 2137;
  *(void *)(v2 + 164(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2132;
  *(void *)(v2 + 1648) = v2 + 2143;
  *(void *)(v2 + 1656) = v2 + 2134;
  *(void *)(v2 + 1664) = v2 + 2130;
  *(void *)(v2 + 1672) = v2 + 2144;
  *(void *)(v2 + 168(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2142;
  *(void *)(v2 + 1688) = v2 + 2136;
  *(void *)(v2 + 1696) = v2 + 2127;
  *(void *)(v2 + 1704) = v2 + 2140;
  *(void *)(v2 + 1712) = v2 + 2117;
  *(void *)(v2 + 172(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2141;
  *(void *)(v2 + 1728) = v2 + 2135;
  *(void *)(v2 + 1736) = v2 + 2122;
  *(void *)(v2 + 1744) = v2 + 2131;
  *(void *)(v2 + 1752) = v2 + 2138;
  *(void *)(v2 + 176(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2133;
  *(void *)(v2 + 1768) = v2 + 2108;
  *(void *)(v2 + 1776) = v2 + 2128;
  *(void *)(v2 + 1784) = v2 + 2121;
  *(void *)(v2 + 1792) = v2 + 2112;
  *(void *)(v2 + 180(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2125;
  *(void *)(v2 + 1808) = v2 + 2118;
  *(void *)(v2 + 1816) = v2 + 2123;
  *(void *)(v2 + 1824) = v2 + 2120;
  *(void *)(v2 + 1832) = v2 + 2109;
  *(void *)(v2 + 184(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2124;
  *(void *)(v2 + 1848) = v2 + 2114;
  *(void *)(v2 + 1856) = v2 + 2116;
  *(void *)(v2 + 1864) = v2 + 2099;
  *(void *)(v2 + 1872) = v2 + 2096;
  *(void *)(v2 + 188(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2106;
  *(void *)(v2 + 1888) = v2 + 2126;
  *(void *)(v2 + 1896) = v2 + 2111;
  *(void *)(v2 + 1904) = v2 + 2103;
  *(void *)(v2 + 1912) = v2 + 2104;
  *(void *)(v2 + 192(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2098;
  *(void *)(v2 + 1928) = (v2 + 2080) | 9;
  *(void *)(v2 + 1936) = v2 + 2110;
  *(void *)(v2 + 1944) = v2 + 2100;
  *(void *)(v2 + 1952) = v2 + 2102;
  *(void *)(v2 + 196(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2 + 2107;
  *(void *)(v2 + 1968) = v2 + 2119;
  *(void *)(v2 + 1976) = v2 + 2097;
  *(void *)(v2 + 1984) = v2 + 2105;
  *(void *)(v2 + 1992) = (v2 + 2080) | 0xC;
  *(void *)(v2 + 216) = (v2 + 2080) | 8;
  *(void *)(v2 + 224) = v2 + 2101;
  *(void *)(v2 + 232) = (v2 + 2080) | 0xB;
  *(void *)(v2 + 248) = (v2 + 2080) | 0xE;
  *(void *)(v2 + 256) = v2 + 2113;
  *(void *)(v2 + 264) = (v2 + 2080) | 0xA;
  *(void *)(v2 + 272) = (v2 + 2080) | 0xF;
  *(void *)(v2 + 28(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 0;
  *(void *)(v2 + 288) = (v2 + 2080) | 0xD;
  *(void *)(v2 + 312) = (v2 + 2080) | 7;
  uint64_t v10 = *(unsigned int *)(v2 + 1024);
  *(void *)(v2 + 296) = v2 + 2115;
  *(void *)(v2 + 304) = v10;
  *(_DWORD *)(v2 + 64) = 50348034;
  *(_DWORD *)(v2 + 68) = v4 + 2881;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 8 * v3))(a1, a2, 1110, 147, 2345589862, 1580, 2333093086, 54);
}

uint64_t sub_21E0C()
{
  __asm { BTI             j }
  uint64_t v7 = *(void *)(v2 + 280);
  uint64_t v8 = *(void *)(*(void *)(v2 + 1032) + 8 * v7);
  *(void *)(v2 + 32(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v8;
  *(void *)(v2 + 328) = v7;
  int v9 = *(_DWORD *)(*(void *)(v2 + 1040) + 4 * v7);
  uint64_t v10 = *(void *)(v2 + 1056) + 32 * v7 + 1;
  *(void *)(v2 + 336) = v10;
  *(_DWORD *)(v2 + 2004) = v9 + (((v0 ^ 0x37E) - v1 - 742) ^ 0xC650F9A0);
  *(_DWORD *)(v2 + 1016) = 1077805314;
  if (v8) {
    _ZF = v10 == 0;
  }
  else {
    _ZF = 1;
  }
  int v12 = !_ZF;
  return (*(uint64_t (**)(void))(v3 + 8 * ((124 * v12) ^ v0)))();
}

uint64_t sub_21E8C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, int a4@<W8>)
{
  __asm { BTI             j }
  *(_DWORD *)(v5 + 100(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8 * (v4 + a4 + 284)))(6887, a1, a2, a3, 624588526, 95);
}

uint64_t sub_21EC0@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, int a7@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(v11 + (unsigned __int16)(65 * v9 - ((v9 * v10) >> 16) * v12)) = a4;
  *(_DWORD *)(v8
            + 4
            * (unsigned __int16)(a1
                               + v9 * (_WORD)a6
                               - ((unsigned __int16)(((a1 + v9 * a6) * v14) >> 16) >> 6) * v15)) = a5;
  BOOL v20 = ((v9 + 1) & 0xC0) == (a7 ^ (a2 + 1105) ^ a3);
  return (*(uint64_t (**)(void))(v13 + 8 * ((4 * v20) | (16 * v20) | (v7 + 264))))();
}

uint64_t sub_21F38()
{
  __asm { BTI             j }
  *(_DWORD *)(v2 + 100(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v1;
  int v8 = *(_DWORD *)(v2 + 2004);
  unsigned int v9 = ((v8 & 0xF25F7F56) << (v0 - 85)) & (v8 ^ 0xF15F7E46) ^ v8 & 0xF25F7F56;
  unsigned int v10 = ((2 * (v8 ^ 0x11F17C46)) ^ 0xC75C0620) & (v8 ^ 0x11F17C46) ^ (2 * (v8 ^ 0x11F17C46)) & 0xE3AE0310;
  int v11 = v10 ^ 0x20A20110;
  unsigned int v12 = (v10 ^ 0xE30C0200) & (4 * v9) ^ v9;
  unsigned int v13 = ((4 * v11) ^ 0x8EB80C40) & v11 ^ (4 * v11) & 0xE3AE0310;
  unsigned int v14 = v12 ^ 0xE3AE0310 ^ (v13 ^ 0x82A80010) & (16 * v12);
  unsigned int v15 = (16 * (v13 ^ 0x61060310)) & 0xE3AE0310 ^ 0xC10E0210 ^ ((16 * (v13 ^ 0x61060310)) ^ 0x3AE03100) & (v13 ^ 0x61060310);
  unsigned int v16 = (v14 << 8) & 0xE3AE0300 ^ v14 ^ ((v14 << 8) ^ 0xAE031000) & v15;
  *(_DWORD *)(v2 + 92(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (8 * v8) ^ (16
                                    * ((v16 << 16) & 0x3AE0000 ^ v16 ^ ((v16 << 16) ^ 0x3100000) & ((v15 << 8) & 0xE3AE0000 ^ 0x1AC0000 ^ ((v15 << 8) ^ 0xAE030000) & v15))) ^ 0x4E50533C;
  *(_DWORD *)(v2 + 912) = -1083712576;
  *(_DWORD *)(v2 + 916) = 2070166364;
  *(_DWORD *)(v2 + 924) = 322681376;
  *(_DWORD *)(v2 + 928) = 234660091;
  *(_DWORD *)(v2 + 932) = -886611509;
  *(_DWORD *)(v2 + 936) = 1155220222;
  *(_DWORD *)(v2 + 94(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 891261197;
  *(_DWORD *)(v2 + 944) = 1758553410;
  *(_DWORD *)(v2 + 948) = 1676490771;
  *(unsigned char *)(v2 + 955) = 0;
  return (*(uint64_t (**)(void))(v3 + 8 * v0))();
}

uint64_t sub_2214C@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  *(_DWORD *)(v3 + 2072) = a1;
  *(unsigned char *)(v3 + 2079) = *(unsigned char *)(v3 + 955);
  *(_DWORD *)(v3 + 356) = *(_DWORD *)(v3 + 948);
  *(_DWORD *)(v3 + 36(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v3 + 944);
  *(_DWORD *)(v3 + 364) = *(_DWORD *)(v3 + 940);
  *(_DWORD *)(v3 + 38(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v3 + 936);
  *(_DWORD *)(v3 + 384) = *(_DWORD *)(v3 + 932);
  *(_DWORD *)(v3 + 388) = *(_DWORD *)(v3 + 928);
  *(_DWORD *)(v3 + 444) = *(_DWORD *)(v3 + 924);
  *(_DWORD *)(v3 + 448) = *(_DWORD *)(v3 + 920);
  *(_DWORD *)(v3 + 452) = *(_DWORD *)(v3 + 916);
  *(_DWORD *)(v3 + 456) = *(_DWORD *)(v3 + 912);
  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((28 * (v2 + *(_DWORD *)(v3 + 2072) - 64 >= ((v1 + 1229361994) & 0xB6B96DFF) - 563)) ^ v1)))();
}

uint64_t sub_221F4()
{
  __asm { BTI             j }
  int v8 = v0 + 1021;
  int v9 = ((268 * ((v0 + 1021) ^ 0x4A4) - 1923938457) & 0x72ACF6FA ^ 0x65FC07BE) + *(_DWORD *)(v2 + 2072);
  *(_DWORD *)(v2 + 472) = v9;
  return (*(uint64_t (**)(void))(v3 + 8 * ((97 * (v9 != v1 + 1)) ^ v8)))();
}

uint64_t sub_22260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BTI             j }
  v5[252] = v5[89];
  v5[253] = 1644702911;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *))(v6 + 8 * v4))(a1, 1939638381, 1041204193, a4, 38, 294935472, 1013, v5 + 520);
}

uint64_t sub_222C0@<X0>(unsigned int a1@<W1>, unsigned int a2@<W2>, char a3@<W4>, int a4@<W5>, int a5@<W6>, uint64_t a6@<X7>, unsigned int a7@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(a6 + a7 - (((a7 * (unint64_t)a2) >> 32) >> 4) * v13) = *(unsigned char *)(v9
                                                                                                  + (v11 + v7))
                                                                                       - (a3 & (2
                                                                                              * *(unsigned char *)(v9 + (v11 + v7))))
                                                                                       - 109;
  BOOL v19 = v12 + a4 > a1 && v12 + a4 < v10;
  return (*(uint64_t (**)(void))(v14 + 8 * ((v19 * a5) ^ v8)))();
}

uint64_t sub_22318(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  *(_DWORD *)(v11 + 1012) = v10;
  *(_DWORD *)(v11 + 1008) = v8;
  *(_DWORD *)(v11 + 244) = v8;
  int v18 = *(_DWORD *)(v11 + 2072);
  *(unsigned char *)(a8
           + 65 * v18
           + ((v9 - 445) ^ 0x8A3F54E6)
           - ((((65 * v18 + ((v9 - 445) ^ 0x8A3F54E6)) * (unint64_t)a3) >> 32) >> 4) * v12) = 19;
  *(_DWORD *)(v11 + 856) = *(_DWORD *)(v11 + 448);
  *(_DWORD *)(v11 + 86(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v8;
  *(unsigned char *)(v11 + 867) = 2;
  *(_DWORD *)(v11 + 868) = v18;
  *(_DWORD *)(v11 + 1004) = v8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v13
                                                                                + 8
                                                                                * ((808
                                                                                  * (v18 - 228622505 < ((37 * ((v9 - 445) ^ 0x34)) ^ 0xD4u))) ^ (v9 - 445))))(a1, a2, 362, a4, 63551);
}

uint64_t sub_223D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BTI             j }
  *(void *)(v7 + 848) = *(unsigned int *)(v7 + 356);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8 * v6))(a1, a2, a3, a4, a5, a6, 2693942419);
}

uint64_t sub_22414@<X0>(char a1@<W6>, char a2@<W7>, uint64_t a3@<X8>)
{
  __asm { BTI             j }
  unsigned __int8 v18 = v4;
  int v19 = v4;
  char v20 = v4 + 1;
  char v21 = (((2 * v20) ^ v10) + v11) ^ (((2 * v20) ^ v13) + 47) ^ (((2 * v20) ^ (2 * (v5 ^ v8) + a1)) - 11);
  char v22 = v21 - 92;
  char v23 = v18 - 7;
  char v24 = (v18 - 7) ^ 0x6B;
  char v25 = ((v18 - 7) ^ 0xEB) & (2 * ((v18 - 7) & 0xC8)) ^ (v18 - 7) & 0xC8;
  char v26 = v18 - v21 + 44;
  char v27 = ((2 * v24) ^ 0x46) & v24 ^ (2 * v24) & (v7 + 2);
  char v28 = v27 ^ 0xA1;
  char v29 = v27 & (4 * v25) ^ v25;
  char v30 = (v26 ^ 0x2B) & (2 * (v26 & 0xC)) ^ v26 & 0xC;
  char v31 = ((4 * v28) & v7 ^ 0x80 ^ ((4 * v28) ^ 0x80) & v28) & (16 * v29) ^ v29;
  char v32 = (v22 ^ 0x96) & (2 * (v22 & 0x24)) ^ v22 & 0x24;
  char v33 = ((2 * (v22 ^ 0xD6)) ^ 0xE4) & (v22 ^ 0xD6) ^ (2 * (v22 ^ 0xD6)) & 0xF2;
  char v34 = v22 ^ (2
             * (((4 * (v33 ^ 0x12)) & 0xE0 ^ ((4 * (v33 ^ 0x12)) ^ 0xC0) & (v33 ^ 0x12) ^ 0x40) & (16
                                                                                                 * ((v33 ^ 0xA0) & (4 * v32) ^ v32)) ^ (v33 ^ 0xA0) & (4 * v32) ^ v32));
  char v35 = *(unsigned char *)(a3 + (v3 - 1676490771))
      + (v20 ^ 0xEE)
      + (v20 ^ 0x67)
      + ((2 * v20) & 0xDC)
      + ((2 * v20) & 0xCF)
      - (((v34 ^ 0xB4) + 9) ^ ((v34 ^ a2) - 117) ^ ((v34 ^ 0xA6) + 27))
      + 81;
  char v36 = v35 ^ 0x72;
  *(unsigned char *)(v6 + 2080 + (unsigned __int16)(65 * v19 - 66 * ((v19 * v9) >> 16))) = v35 ^ (2 * (v36 & (2 * (v36 & (2 * (v36 & (2 * (v36 & (2 * ((v35 ^ 0x62) & (2 * ((v35 ^ 0x62) & (2 * (v35 & 0xF3)) ^ v35 & 0xF3)) ^ v35 & 0xF3)) ^ v35 & 0xF3)) ^ v35 & 0xF3)) ^ v35 & 0xF3)) ^ v35 & 0xF3)) ^ 0x60;
  char v37 = ((2 * (v26 ^ 0x23)) ^ 0x5E) & (v26 ^ 0x23) ^ (2 * (v26 ^ 0x23)) & 0x2E;
  char v38 = v26 ^ (2
             * ((((4 * (v37 ^ 0x21)) ^ 0xA0) & (v37 ^ 0x21) ^ 0x20) & (16 * (v37 & (4 * v30) ^ v30)) ^ v37 & (4 * v30) ^ v30));
  char v39 = (v38 ^ 0xC) & (v23 ^ (2 * v31) ^ 0x86) ^ v38 & 0x4E;
  BOOL v40 = ((v39 - ((2 * v39) & 0xE8) - 12) & 0x80) == 0;
  return (*(uint64_t (**)(void))(v12 + 8 * (((4 * v40) | (32 * v40)) ^ v5)))();
}

uint64_t sub_227A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BTI             j }
  *(_DWORD *)(v7 + 852) = v5;
  *(_DWORD *)(v7 + 848) = v4;
  *(_DWORD *)(v7 + 2008) = v4;
  int v13 = ((v6 + 729) | 2) + *(_DWORD *)(v7 + 2072) - 843;
  *(_DWORD *)(v7 + 856) = *(_DWORD *)(v7 + 448);
  *(_DWORD *)(v7 + 86(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v4;
  *(unsigned char *)(v7 + 867) = *(unsigned char *)(v7 + 2079);
  *(_DWORD *)(v7 + 868) = v13;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8 * v6))(a1, a2, 362, a4, 63551);
}

uint64_t sub_227F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, unsigned int a4@<W8>)
{
  __asm { BTI             j }
  *((unsigned char *)v4 + 65 * v4[518] + ((a4 + 961640547) & 0xC6AE87B6 ^ 0x8A3F5442) + 208(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 19;
  v4[251] = v4[89];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 8 * a4))(a1, a2, 362, a3, 63551);
}

uint64_t sub_22858()
{
  __asm { BTI             j }
  v1[53] = v1[251];
  v1[239] = v1[518];
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * v0))(27);
}

uint64_t sub_228A4@<X0>(int a1@<W0>, char a2@<W3>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(a3 + v4 - (((v4 * (unint64_t)v6) >> 32) >> 4) * v9) = a2;
  return (*(uint64_t (**)(void))(v10 + 8 * (((v7 + v5 + 2 < (a4 ^ v8) + 16) * a1) ^ a4)))();
}

uint64_t sub_228EC()
{
  __asm { BTI             j }
  *(_DWORD *)(v3 + 956) = v1;
  int v9 = *(_DWORD *)(v3 + 2072);
  *(_DWORD *)(v3 + 856) = *(_DWORD *)(v3 + 448);
  *(_DWORD *)(v3 + 86(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v3 + 212);
  *(unsigned char *)(v3 + 867) = 2;
  *(_DWORD *)(v3 + 868) = v9;
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v9 + v2) < 0x38) * (((v0 + 730) | 1) ^ 0x371)) ^ v0)))();
}

uint64_t sub_22944()
{
  __asm { BTI             j }
  unsigned int v7 = *(_DWORD *)(v1 + 448);
  **(unsigned char **)(v1 + 1072) = v7 ^ 0x1F;
  **(unsigned char **)(v1 + 108(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = BYTE1(v7) ^ 0xB;
  **(unsigned char **)(v1 + 1088) = BYTE2(v7) ^ 0xF8;
  v7 >>= 24;
  **(unsigned char **)(v1 + 1096) = v7 ^ 0x65;
  *(_DWORD *)(v1 + 856) = ((v0 + 729) | 2) ^ 0xF66B9B71 ^ v7;
  *(_DWORD *)(v1 + 86(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v1 + 212);
  *(unsigned char *)(v1 + 867) = 1;
  *(_DWORD *)(v1 + 868) = *(_DWORD *)(v1 + 2072);
  return (*(uint64_t (**)(void))(v2 + 8 * v0))();
}

uint64_t sub_229D0@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  v1[503] = v1[217];
  v1[504] = v1[215];
  int v7 = v1[214];
  v1[220] = v1[114];
  v1[221] = v1[113];
  v1[222] = v7;
  v1[223] = v1[111];
  v1[224] = v1[97];
  v1[225] = v1[96];
  v1[226] = v1[95];
  v1[227] = v1[91];
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * a1))(3536694);
}

uint64_t sub_22A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BTI             j }
  *(unsigned char *)(v8 + 2035) = v6;
  *(_DWORD *)(v8 + 2036) = v7;
  *(_DWORD *)(v8 + 204(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v8 + 908);
  *(_DWORD *)(v8 + 2044) = *(_DWORD *)(v8 + 904);
  *(_DWORD *)(v8 + 2048) = *(_DWORD *)(v8 + 900);
  *(_DWORD *)(v8 + 2052) = *(_DWORD *)(v8 + 896);
  *(_DWORD *)(v8 + 2056) = *(_DWORD *)(v8 + 892);
  *(_DWORD *)(v8 + 206(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v8 + 888);
  *(_DWORD *)(v8 + 2064) = *(_DWORD *)(v8 + 884);
  *(_DWORD *)(v8 + 2068) = *(_DWORD *)(v8 + 880);
  *(_DWORD *)(v8 + 996) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8 * v5))(a1, 4155904, a3, 95, a5, 160, v8 + 2080, 132);
}

uint64_t sub_22AF8@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, __int16 a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X6>, __int16 a8@<W7>, uint64_t a9@<X8>)
{
  __asm { BTI             j }
  int v26 = (v9 ^ a6) * a3;
  *(_DWORD *)(v12 + 16(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v26;
  unsigned int v27 = ((_WORD)v26
       + 260 * (_WORD)v10
       - 956
       - ((unsigned __int16)(((((_WORD)v26 + 260 * (_WORD)v10 - 956) & 0xFFFEu) * a5) >> 16) >> 7) * a8) & 0xFFFE;
  int v28 = *(unsigned __int8 *)(a7
                           + (unsigned __int16)(260 * v10
                                              + 65
                                              - ((unsigned __int16)(((unsigned __int16)(260 * v10 + 65)
                                                                   * a5) >> 16) >> 6)
                                              * v15)) << 8;
  int v29 = (v14 ^ (*(unsigned __int8 *)(a7
                                   + ((unsigned __int16)(260 * v10
                                                       - ((unsigned __int16)((((260 * v10) & 0xFFFCu) * a5) >> 16) >> 6)
                                                       * v15) & 0xFFFE)) << 16)) & (v28 ^ v16) | v28 & v21;
  int v30 = v29 ^ v13;
  int v31 = (v29 & a2 ^ v11) + (v29 ^ v13);
  int v32 = v30 & (a2 + 32);
  if (v27 >= 0x42) {
    v27 -= 66;
  }
  int v33 = *(unsigned __int8 *)(a7
                           + (unsigned __int16)(260 * v10
                                              + 195
                                              - ((unsigned __int16)(((unsigned __int16)(260 * v10 + 195)
                                                                   * a5) >> 16) >> 6)
                                              * v15));
  unsigned int v34 = (((((v31 - v32) ^ a1) & (*(unsigned __int8 *)(a7 + v27) ^ 0xFFFF6C) ^ (*(unsigned char *)(a7 + v27) & v17)) << 8) ^ 0x8D0CD5C7) & (v33 ^ 0xFFFFFF6C) | v33 & 0x38;
  *(_DWORD *)(a9
            + 4
            * (unsigned __int16)(v10 * a4
                               + 7030
                               - ((unsigned __int16)(((unsigned __int16)(v10 * a4 + 7030) * v19) >> 16) >> 6)
                               * v20)) = (((v34 ^ 0x554F0020) + 654616948) ^ ((v34 ^ 0x6FDD430A) + 496429658) ^ ((v34 ^ 0xD2C46DFD) - 1601190737))
                                       - 1961037975;
  return (*(uint64_t (**)(void))(v18 + 8 * ((107 * (v10 == 15)) ^ v9)))();
}

uint64_t sub_22C98(uint64_t a1)
{
  __asm { BTI             j }
  *(_DWORD *)(v2 + 996) = v1;
  *(_DWORD *)(v2 + 876) = 16;
  *(void *)(v2 + 72) = *(void *)(v2 + 1064);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8 * *(int *)(v2 + 160)))(a1, 95);
}

uint64_t sub_22CC8(uint64_t a1, int a2)
{
  __asm { BTI             j }
  *(_DWORD *)(v5 + 144) = v3;
  *(_DWORD *)(v5 + 152) = v2;
  int v12 = *(_DWORD *)(v5 + 160) - 919;
  *(_DWORD *)(v5 + 128) = v12;
  __int16 v13 = ((v3 ^ 0xFFF1) + (v2 & (v12 ^ 0xFF45))) * a2;
  int v14 = v3 * a2;
  *(_DWORD *)(v5 + 112) = v14;
  uint64_t v15 = *(void *)(v5 + 72);
  int v16 = *(_DWORD *)(v15
                  + 4
                  * (unsigned __int16)(v13
                                     + v4
                                     - ((unsigned __int16)(((unsigned __int16)(v13 + v4) * v6) >> 16) >> 6)
                                     * v7));
  int v17 = *(_DWORD *)(v15
                  + 4
                  * (unsigned __int16)(v13
                                     + 6887
                                     - ((unsigned __int16)(((unsigned __int16)(v13 + 6887) * v6) >> 16) >> 6)
                                     * v7));
  int v18 = *(_DWORD *)(v15
                  + 4
                  * (unsigned __int16)(v14
                                     + 6840
                                     - ((unsigned __int16)(((unsigned __int16)(v14 + 6840) * v6) >> 16) >> 6)
                                     * v7));
  unsigned int v19 = (((*(_DWORD *)(v5 + 152) - 4) & 0x94) + ((*(_DWORD *)(v5 + 144) - 2) ^ 0x4A)) * a2;
  unsigned int v20 = 2 * (v16 & 0xDAC58912);
  unsigned int v21 = v16 & 0xDAC58912 ^ 0xAA2592D1 ^ v20 & (v16 ^ 0xD0E109C3);
  unsigned int v22 = (2 * (v16 ^ 0x70E01BC3)) & 0xAA2592D0 ^ 0xAA249251 ^ ((2 * (v16 ^ 0x70E01BC3)) ^ 0x544B25A2) & (v16 ^ 0x70E01BC3);
  unsigned int v23 = (4 * v21) & 0xAA2592D0 ^ v21 ^ ((4 * v21) ^ 0xA8964B44) & v22;
  *(_DWORD *)(v5 + 88) = v20;
  *(_DWORD *)(v5 + 96) = v16 & 0xDAC58912;
  unsigned int v24 = ((16 * v23) ^ 0x10) & ((4 * v22) & 0xAA2592D0 ^ ((4 * v22) ^ 0xA8964B40) & v22 ^ 0x10);
  unsigned int v25 = ((2 * (v16 ^ 0xF4492BAE)) ^ 0x5D194578) & (v16 ^ 0xF4492BAE) ^ (2 * (v16 ^ 0xF4492BAE)) & 0x2E8CA2BC;
  int v26 = (16 * v23) & 0x10 ^ v23;
  unsigned int v27 = (v25 ^ 0xC88821C) & (4 * (v20 & (v16 ^ 0xD0C1298A) ^ v16 & 0xDAC58912)) ^ v20 & (v16 ^ 0xD0C1298A) ^ v16 & 0xDAC58912;
  *(_DWORD *)(v5 + 124) = v26 ^ v24;
  unsigned int v28 = ((4 * (v25 ^ 0x2284A284)) ^ 0xBA328AF0) & (v25 ^ 0x2284A284) ^ (4 * (v25 ^ 0x2284A284)) & 0x2E8CA2BC;
  int v29 = v28 ^ 0x48C200C;
  *(_DWORD *)(v5 + 104) = v19 % 0x8F;
  *(_DWORD *)(v5 + 8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v17;
  unsigned int v30 = (v17 ^ 0x90E140D1) & (2 * (v17 & 0xDAC58912)) ^ v17 & 0xDAC58912;
  unsigned int v31 = ((2 * (v17 ^ 0x916852F1)) ^ 0x975BB7C6) & (v17 ^ 0x916852F1) ^ (2 * (v17 ^ 0x916852F1)) & 0x4BADDBE2;
  int v32 = v31 ^ 0x48A44821;
  int v33 = (v31 ^ 0x38800E0) & (4 * v30) ^ v30;
  int v34 = (v28 ^ 0x2A0082A0) & (16 * v27) ^ v27;
  int v35 = ((4 * v32) ^ 0x2EB76F8C) & v32 ^ (4 * v32) & 0x4BADDBE0;
  int v36 = v35 ^ 0x41089063;
  int v37 = (v35 ^ 0xAA54B80) & (16 * v33) ^ v33;
  unsigned int v38 = ((2 * (v16 ^ 0x5303D5B8)) ^ 0x138CB954) & (v16 ^ 0x5303D5B8) ^ (2 * (v16 ^ 0x5303D5B8)) & 0x89C65CAA;
  unsigned int v39 = v38 ^ 0x884244AA;
  unsigned int v40 = ((16 * v29) ^ 0xE8CA2BC0) & v29 ^ (16 * v29) & 0x2E8CA2B0;
  unsigned int v41 = (v38 ^ 0x1440820) & (4 * (v20 & (v16 ^ 0xD281C598) ^ v16 & 0xDAC58912)) ^ v20 & (v16 ^ 0xD281C598) ^ v16 & 0xDAC58912;
  unsigned int v42 = ((4 * v39) ^ 0x271972A8) & v39 ^ (4 * v39) & 0x89C65CA8;
  unsigned int v43 = ((16 * v36) ^ 0xBADDBE30) & v36 ^ (16 * v36) & 0x4BADDBE0;
  int v44 = (v42 ^ 0x10050A0) & (16 * v41) ^ v41;
  int v45 = v37 ^ 0x4BADDBE3;
  unsigned int v46 = ((16 * (v42 ^ 0x88C60C02)) ^ 0x9C65CAA0) & (v42 ^ 0x88C60C02) ^ (16 * (v42 ^ 0x88C60C02)) & 0x89C65CA0;
  unsigned int v47 = v44 ^ 0x89C65CAA;
  unsigned int v48 = 2 * (v18 & 0xDAC58912);
  int v49 = 2 * (v18 ^ 0x1869B568);
  unsigned int v50 = (v49 ^ 0x855878F4) & (v18 ^ 0x1869B568);
  unsigned int v51 = v49 & 0xC2AC3C7A;
  int v52 = v43 ^ 0x412041C3;
  int v53 = v50 ^ v51;
  int v54 = v53 ^ 0x42A4040A;
  unsigned int v55 = (v53 ^ 0x80882850) & (4 * (v48 & (v18 ^ 0x98E1A548) ^ v18 & 0xDAC58912)) ^ v48 & (v18 ^ 0x98E1A548) ^ v18 & 0xDAC58912;
  unsigned int v56 = ((4 * v54) ^ 0xAB0F1E8) & v54 ^ (4 * v54) & 0xC2AC3C78;
  unsigned int v57 = v55 ^ 0xC2AC3C7A ^ (v56 ^ 0x2A03070) & (16 * v55);
  unsigned int v58 = (v57 << 8) & 0x3C00 ^ v57 ^ ((v57 << 8) ^ 0x7A00) & ((16 * (v56 ^ 0xC00C0C12)) & 0xC2AC3C00 ^ ((16 * (v56 ^ 0xC00C0C12)) ^ 0xC700) & (v56 ^ 0xC00C0C12) ^ 0x3800);
  int v59 = (v43 ^ 0xA8D9A00) & (v37 << 8);
  unsigned int v60 = v48;
  unsigned int v61 = (v46 ^ 0x88444800) & (v44 << 8);
  unsigned int v62 = ((2 * (v18 ^ 0x4E9C1FC2)) ^ 0x28B32DA0) & (v18 ^ 0x4E9C1FC2) ^ (2 * (v18 ^ 0x4E9C1FC2)) & 0x945996D0;
  unsigned int v63 = v62 ^ 0x94489250;
  unsigned int v64 = (v62 ^ 0x509680) & (4 * (v60 & (v18 ^ 0xDA950DC2) ^ v18 & 0xDAC58912)) ^ v60 & (v18 ^ 0xDA950DC2) ^ v18 & 0xDAC58912;
  int v65 = v34 ^ 0x2E8CA2BC ^ (v40 ^ 0x28882200) & (v34 << 8);
  unsigned int v66 = ((4 * v63) ^ 0x51665B40) & v63 ^ (4 * v63) & 0x945996D0;
  int v67 = (v66 ^ 0x10401250) & (16 * v64) ^ v64;
  unsigned int v68 = ((16 * (v66 ^ 0x84198490)) ^ 0x45996D00) & (v66 ^ 0x84198490) ^ (16 * (v66 ^ 0x84198490)) & 0x945996D0;
  unsigned int v69 = v67 ^ 0x945996D0 ^ (v68 ^ 0x4190400) & (v67 << 8);
  int v70 = (v46 ^ 0x182140A) << 8;
  unsigned int v71 = ((2 * (v18 ^ 0x952CA7C2)) ^ 0x9FD25DA0) & (v18 ^ 0x952CA7C2) ^ (2 * (v18 ^ 0x952CA7C2)) & 0x4FE92ED0;
  int v72 = v47 ^ v61;
  unsigned int v73 = (v71 ^ 0xF010E80) & (4 * (v48 & (v18 ^ 0x90A5A5C2) ^ v18 & 0xDAC58912)) ^ v48 & (v18 ^ 0x90A5A5C2) ^ v18 & 0xDAC58912;
  int v74 = (v70 ^ 0x465C0000) & (v46 ^ 0x182140A);
  int v75 = ((4 * (v71 ^ 0x40292250)) ^ 0x3FA4BB40) & (v71 ^ 0x40292250) ^ (4 * (v71 ^ 0x40292250)) & 0x4FE92ED0;
  int v76 = v75 ^ 0x40490490;
  int v77 = v73 ^ 0x4FE92ED0 ^ (v75 ^ 0xFA02A50) & (16 * v73);
  unsigned int v78 = ((v69 << 16) ^ 0x16D00000) & (((v68 ^ 0x904092D0) << 8) & 0x14590000 ^ 0x4490000 ^ (((v68 ^ 0x904092D0) << 8) ^ 0x59960000) & (v68 ^ 0x904092D0));
  unsigned int v79 = (16 * v76) & 0x4FE92ED0 ^ 0x16902D0 ^ ((16 * v76) ^ 0xFE92ED00) & v76;
  unsigned int v80 = (v77 << 8) & 0x4FE92E00 ^ v77 ^ ((v77 << 8) ^ 0xE92ED000) & v79;
  int v81 = (((v79 << 8) ^ 0x20000) & v79 ^ (v79 << 8) & 0x10000) & (v80 << 16) ^ v80;
  unsigned int v82 = ((2 * (v18 ^ 0x971F7DC3)) ^ 0x9BB5E9A2) & (v18 ^ 0x971F7DC3) ^ (2 * (v18 ^ 0x971F7DC3)) & 0x4DDAF4D0;
  unsigned int v83 = (v82 ^ 0x9507080) & (4 * (v60 & (v18 ^ 0x92956DC3) ^ v18 & 0xDAC58912)) ^ v60 & (v18 ^ 0x92956DC3) ^ v18 & 0xDAC58912;
  int v84 = ((4 * (v82 ^ 0x444A1451)) ^ 0x376BD344) & (v82 ^ 0x444A1451) ^ (4 * (v82 ^ 0x444A1451)) & 0x4DDAF4D0;
  int v85 = v84 ^ 0x48902491;
  int v86 = (v84 ^ 0x54AD050) & (16 * v83) ^ v83;
  int v87 = ((v52 << 8) ^ 0x10000) & v52 ^ (v52 << 8) & 0x10000;
  int v88 = *(_DWORD *)(v15 + 4 * *(unsigned int *)(v5 + 104));
  unsigned int v89 = ((16 * v85) ^ 0xDDAF4D10) & v85 ^ (16 * v85) & 0x4DDAF4D0;
  int v90 = v70 & 0x9C60000 ^ 0x9820000 ^ v74;
  int v91 = v86 ^ 0x4DDAF4D1 ^ (v89 ^ 0x4D8A4400) & (v86 << 8);
  int v92 = (v91 << 16) & 0x4DD80000 ^ v91 ^ ((v91 << 16) ^ 0x74D00000) & (((v89 ^ 0x50B0C1) << 8) & 0x4DDA0000 ^ 0x5080000 ^ (((v89 ^ 0x50B0C1) << 8) ^ 0x5AF40000) & (v89 ^ 0x50B0C1));
  unsigned int v93 = (v88 ^ 0xD0E14900) & (2 * (v88 & 0xDAC58912)) ^ v88 & 0xDAC58912;
  unsigned int v94 = ((2 * (v88 ^ 0xC0625B24)) ^ 0x354FA46C) & (v88 ^ 0xC0625B24) ^ (2 * (v88 ^ 0xC0625B24)) & 0x1AA7D236;
  unsigned int v95 = v18 ^ (2 * ((v69 << 16) & 0x14590000 ^ v69 ^ v78));
  unsigned int v96 = v18 ^ (2 * v92);
  int v97 = (v94 ^ 0x10861200) & (4 * v93) ^ v93;
  int v98 = ((4 * (v94 ^ 0xAA05212)) ^ 0x6A9F48D8) & (v94 ^ 0xAA05212) ^ (4 * (v94 ^ 0xAA05212)) & 0x1AA7D234;
  int v99 = (v98 ^ 0xA874000) & (16 * v97) ^ v97;
  unsigned int v100 = ((16 * (v98 ^ 0x10209226)) ^ 0xAA7D2360) & (v98 ^ 0x10209226) ^ (16 * (v98 ^ 0x10209226)) & 0x1AA7D230;
  int v101 = v99 ^ 0x1AA7D236 ^ (v100 ^ 0xA250200) & (v99 << 8);
  int v102 = ((v45 ^ v59) << 16) ^ v45 ^ v59 ^ (((v45 ^ v59) << 16) ^ 0x10000) & v87;
  unsigned int v103 = v88 ^ (2
              * ((v101 << 16) & 0x1AA70000 ^ v101 ^ ((v101 << 16) ^ 0x52360000) & (((v100 ^ 0x1082D016) << 8) & 0x1AA70000 ^ 0x18250000 ^ (((v100 ^ 0x1082D016) << 8) ^ 0x27D20000) & (v100 ^ 0x1082D016))));
  unsigned int v104 = *(_DWORD *)(v5 + 88) & (v16 ^ 0xDAB1494B) ^ *(_DWORD *)(v5 + 96);
  unsigned int v105 = ((2 * (v16 ^ 0x6BB0594B)) ^ 0x62EBA0B2) & (v16 ^ 0x6BB0594B) ^ (2 * (v16 ^ 0x6BB0594B)) & 0xB175D058;
  unsigned int v106 = v105 ^ 0x91145049;
  int v107 = (v105 ^ 0x20201010) & (4 * v104) ^ v104;
  unsigned int v108 = ((v58 << 16) ^ (v18 << 15)) & 0xFFFF8000 | (v95 >> 17);
  unsigned int v109 = v103 >> 10;
  int v110 = (*(_DWORD *)(v5 + 124) << 26) ^ (v16 << 25);
  unsigned int v111 = ((4 * v106) ^ 0xC5D74164) & v106 ^ (4 * v106) & 0xB175D058;
  int v112 = v111 ^ 0x30209019;
  unsigned int v113 = ((v81 << 14) ^ (v18 << 13)) & 0xFFFFE000 | (v96 >> 19);
  unsigned int v114 = (v111 ^ 0x81554050) & (16 * v107) ^ v107;
  unsigned int v115 = v16 ^ (2
              * ((v65 << 16) & 0x2E8C0000 ^ v65 ^ ((v65 << 16) ^ 0x22BC0000) & (((v40 ^ 0x604803C) << 8) & 0x2E8C0000 ^ 0x220C0000 ^ (((v40 ^ 0x604803C) << 8) ^ 0xCA20000) & (v40 ^ 0x604803C))));
  unsigned int v116 = ((16 * v112) ^ 0x175D0590) & v112 ^ (16 * v112) & 0xB175D050;
  unsigned int v117 = v16 ^ (2 * ((v72 << 16) & 0x9C60000 ^ v72 ^ ((v72 << 16) ^ 0x5CAA0000) & v90));
  unsigned int v118 = v114 ^ 0xB175D059 ^ (v116 ^ 0x11550000) & (v114 << 8);
  int v119 = v113 ^ v108;
  unsigned int v120 = v16 ^ (2
              * ((v118 << 16) & 0x31750000 ^ v118 ^ ((v118 << 16) ^ 0x50590000) & (((v116 ^ 0xA020D049) << 8) & 0x31750000 ^ 0x250000 ^ (((v116 ^ 0xA020D049) << 8) ^ 0x75D00000) & (v116 ^ 0xA020D049))));
  unsigned int v121 = ((v109 & 0x20 ^ 0xADF3ECA9) + 1064522489) ^ (v109 & 0x20 | 0xE313415A) ^ ((v109 & 0x20 ^ 0x85BA316D) + 389713725);
  unsigned int v122 = v121 - 505707549;
  unsigned int v123 = v110 & 0xFE000000 | (v115 >> 7);
  unsigned int v124 = ((2 * (v122 ^ 0xC67BD328)) ^ 0x9BB0DDC6) & (v122 ^ 0xC67BD328) ^ (2 * (v122 ^ 0xC67BD328)) & 0x4DD86EE2;
  int v125 = 4 * (v124 ^ 0x44482221);
  unsigned int v126 = (v122 ^ 0xC33BB9AA) & (2 * (v122 & 0x41)) | v122 & 0x41;
  int v127 = (v125 ^ 0x3761BB8C) & (v124 ^ 0x44482221);
  int v128 = (v124 ^ *(_DWORD *)(v5 + 68)) & (4 * v126) | v126;
  int v129 = v127 ^ v125 & 0x4DD86EE0;
  int v130 = (v129 ^ 0x5402A80) & (16 * v128) ^ v128;
  unsigned int v131 = ((16 * (v129 ^ 0x48984463)) ^ 0xDD86EE30) & (v129 ^ 0x48984463) ^ (16 * (v129 ^ 0x48984463)) & 0x4DD86EE0;
  int v132 = v130 ^ 0x4DD86EE3 ^ (v131 ^ 0x4D806E00) & (v130 << 8);
  int v133 = (v121 - 505707549) ^ (2
                             * ((v132 << 16) & 0x4DD80000 ^ v132 ^ ((v132 << 16) ^ 0x6EE30000) & (((v131 ^ 0x5800C3) << 8) & 0x4DD80000 ^ 0x5900000 ^ (((v131 ^ 0x5800C3) << 8) ^ 0x586E0000) & (v131 ^ 0x5800C3))));
  unsigned int v134 = 115146887 - v121;
  if ((((v133 ^ 0x8993600D) & (v119 ^ 0x7EFEB8F8) ^ v133 & 0x449B8C89) & 0x24BD0D73 ^ 0x243D0D72)
     + (((v133 ^ 0x8993600D) & (v119 ^ 0x7EFEB8F8) ^ v133 & 0x449B8C89) & 0xDB42F28C ^ 0x40008081) == 1689161212)
    unsigned int v134 = v122;
  unsigned int v135 = v123 ^ (v120 >> 3) ^ (((v102 << 15) ^ (*(_DWORD *)(v5 + 80) << 14)) & 0xFFFFC000 | (v117 >> 18));
  unsigned int v136 = ((((v119 ^ 0xB3357AE8) + 1366806963) ^ ((v119 ^ 0xD0474F54) + 839246863) ^ ((v119 ^ 0x591701CD) - 1152013672))
        - 1283711329
        + v134) ^ v109 & 0xFFFFFFDF;
  int v137 = *(_DWORD *)(v5 + 112);
  int v138 = v136 ^ v135;
  int v139 = v136 & 0x7544393A ^ 0x4544391A ^ (v136 ^ 0x32F18B) & (v135 ^ 0x48650385);
  int v140 = 2 * (((2 * v139) | 0x4F07DF50) - v139) + 821567664;
  unsigned int v141 = (((v138 ^ 0xCDDF92B6) - 2104632013) ^ ((v138 ^ 0xE9549851) - 1509500970) ^ ((v138 ^ 0x1998C1D3) + 1456115288))
       - 2118858405
       + (((v140 ^ 0x9C7A6A0B) - 391017061) ^ ((v140 ^ 0xB30C72A4) - 943221450) ^ ((v140 ^ 0x6AF9D7DF) + 506605647));
  uint64_t v142 = *(void *)(v5 + 136);
  uint64_t v143 = 4 * ((unsigned __int16)(v137 + 7030) % 0x8Fu);
  *(_DWORD *)(v15 + v143) = v141;
  unsigned int v144 = *(_DWORD *)(v15 + 4 * ((unsigned __int16)(v137 + 6365) % 0x8Fu)) - 624588526 + v141;
  int v145 = *(_DWORD *)(v5 + 144);
  *(_DWORD *)(v15 + v143) = v144;
  *(_DWORD *)(v15 + v143) = *(_DWORD *)(v15 + 4 * ((unsigned __int16)(v137 + 5510) % 0x8Fu)) - 624588526 + v144;
  return (*(uint64_t (**)(void))(v142 + 8 * ((118 * (v145 == 63)) ^ *(_DWORD *)(v5 + 160))))();
}

uint64_t sub_23D44()
{
  __asm { BTI             j }
  *(_DWORD *)(v2 + 876) = v0;
  int v7 = *(_DWORD *)(v2 + 2040);
  **(_DWORD **)(v2 + 1104) = 1285383883;
  *(_DWORD *)(v2 + 202(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v2 + 2036) - 744649168;
  **(_DWORD **)(v2 + 1112) = -2137897311;
  int v8 = *(_DWORD *)(v2 + 2052) + 294074544;
  *(_DWORD *)(v2 + 2024) = *(_DWORD *)(v2 + 2056) - 2016825748;
  **(_DWORD **)(v2 + 112(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 135507853;
  int v9 = *(_DWORD **)(v2 + 1064);
  *(void *)(v2 + 16(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v9;
  *int v9 = -647587180;
  **(_DWORD **)(v2 + 1128) = -1453341187;
  **(_DWORD **)(v2 + 1136) = -1156714310;
  *(_DWORD *)(v2 + 2028) = *(_DWORD *)(v2 + 2068) - 67120443;
  **(_DWORD **)(v2 + 1144) = -254968595;
  **(_DWORD **)(v2 + 1152) = -1499592510;
  **(_DWORD **)(v2 + 116(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 1860441492;
  **(_DWORD **)(v2 + 1168) = -208857896;
  **(_DWORD **)(v2 + 1176) = -801952425;
  **(_DWORD **)(v2 + 1184) = -1425697693;
  LODWORD(v9) = *(_DWORD *)(v2 + 2044) + 1618260540;
  **(_DWORD **)(v2 + 1192) = -990409676;
  **(_DWORD **)(v2 + 120(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 689696160;
  **(_DWORD **)(v2 + 1208) = 398138618;
  **(_DWORD **)(v2 + 1216) = 1484282992;
  **(_DWORD **)(v2 + 1224) = 2071450813;
  **(_DWORD **)(v2 + 1232) = 1572632303;
  **(_DWORD **)(v2 + 124(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 161138800;
  **(_DWORD **)(v2 + 1248) = 1189057220;
  **(_DWORD **)(v2 + 1256) = -337057601;
  **(_DWORD **)(v2 + 1264) = -514789466;
  **(_DWORD **)(v2 + 1272) = -1159131960;
  **(_DWORD **)(v2 + 128(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 1820589123;
  **(_DWORD **)(v2 + 1288) = -993683605;
  **(_DWORD **)(v2 + 1296) = -1097632383;
  **(_DWORD **)(v2 + 1304) = 1446374083;
  **(_DWORD **)(v2 + 1312) = 850948515;
  **(_DWORD **)(v2 + 132(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 1057894761;
  **(_DWORD **)(v2 + 1328) = -1964334975;
  **(_DWORD **)(v2 + 1336) = 1106823633;
  **(_DWORD **)(v2 + 1344) = -1650012595;
  **(_DWORD **)(v2 + 1352) = 1495791212;
  **(_DWORD **)(v2 + 136(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -2036682110;
  **(_DWORD **)(v2 + 1368) = 222721463;
  **(_DWORD **)(v2 + 1376) = 1836413216;
  **(_DWORD **)(v2 + 1384) = 966546333;
  **(_DWORD **)(v2 + 1392) = -68755888;
  **(_DWORD **)(v2 + 140(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -367757297;
  **(_DWORD **)(v2 + 1408) = -469182216;
  **(_DWORD **)(v2 + 1416) = -441117370;
  **(_DWORD **)(v2 + 1424) = 693016449;
  **(_DWORD **)(v2 + 1432) = 1056362823;
  **(_DWORD **)(v2 + 144(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 1581825183;
  **(_DWORD **)(v2 + 1448) = -1488516244;
  **(_DWORD **)(v2 + 1456) = 1752126229;
  **(_DWORD **)(v2 + 1464) = 790281294;
  **(_DWORD **)(v2 + 1472) = 232125398;
  **(_DWORD **)(v2 + 148(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -1333711854;
  **(_DWORD **)(v2 + 1488) = -805800017;
  **(_DWORD **)(v2 + 1496) = -226937525;
  int v10 = *(_DWORD *)(v2 + 2064) - 1702141684;
  **(_DWORD **)(v2 + 1504) = 191622634;
  **(_DWORD **)(v2 + 1512) = 463790864;
  **(_DWORD **)(v2 + 152(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 1440091891;
  **(_DWORD **)(v2 + 1528) = 597912836;
  **(_DWORD **)(v2 + 1536) = -16065809;
  **(_DWORD **)(v2 + 1544) = 992794599;
  int v11 = *(_DWORD *)(v2 + 2048) + 364667471;
  **(_DWORD **)(v2 + 1552) = 664496886;
  **(_DWORD **)(v2 + 156(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -1104879032;
  **(_DWORD **)(v2 + 1568) = 413086762;
  **(_DWORD **)(v2 + 1576) = -1256990972;
  **(_DWORD **)(v2 + 1584) = 260165227;
  **(_DWORD **)(v2 + 1592) = 1565385710;
  **(_DWORD **)(v2 + 160(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -879941711;
  *(_DWORD *)(v2 + 96(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v2 + 2024);
  *(_DWORD *)(v2 + 964) = (v7 ^ 0x26C13C0C) + ((2 * v7) & 0x4D827818);
  *(void *)(v2 + 968) = *(unsigned int *)(v2 + 2020);
  *(_DWORD *)(v2 + 976) = v9;
  *(_DWORD *)(v2 + 98(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v10;
  *(_DWORD *)(v2 + 984) = *(_DWORD *)(v2 + 2028);
  *(_DWORD *)(v2 + 988) = v8;
  *(_DWORD *)(v2 + 992) = v11;
  return (*(uint64_t (**)(void))(v1 + 8 * *(int *)(v2 + 128)))(0);
}

uint64_t sub_2423C(int a1)
{
  __asm { BTI             j }
  _ZF = a1 == 63;
  uint64_t v6 = (a1 + 1);
  int v7 = _ZF;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 + 136) + 8 * ((97 * v7) ^ *(_DWORD *)(v1 + 128))))(v6, 95);
}

uint64_t sub_247CC(int a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, int a7)
{
  __asm { BTI             j }
  *(_DWORD *)(v10 + 992) = a6;
  *(_DWORD *)(v10 + 988) = a5;
  *(_DWORD *)(v10 + 476) = a7;
  *(_DWORD *)(v10 + 984) = v12;
  *(_DWORD *)(v10 + 484) = v11;
  *(_DWORD *)(v10 + 98(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v8;
  *(_DWORD *)(v10 + 976) = v7;
  *(_DWORD *)(v10 + 972) = a1;
  *(_DWORD *)(v10 + 968) = v11;
  *(_DWORD *)(v10 + 504) = v7;
  *(_DWORD *)(v10 + 964) = a7;
  *(_DWORD *)(v10 + 96(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = a3;
  *(_DWORD *)(v10 + 508) = a3;
  *(_DWORD *)(v10 + 516) = v12;
  *(_DWORD *)(v10 + 524) = a6;
  *(_DWORD *)(v10 + 536) = v8;
  *(_DWORD *)(v10 + 54(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = a5;
  int v17 = *(_DWORD *)(v10 + 2024);
  unsigned int v18 = ((2 * a6) & 0xE0551CCA) + (a6 ^ 0x702A8E65);
  *(_DWORD *)(v10 + 544) = v18;
  *(_DWORD *)(v10 + 548) = v12 + *(_DWORD *)(v10 + 2068);
  *(_DWORD *)(v10 + 564) = v7 + *(_DWORD *)(v10 + 2044);
  int v19 = v8 + *(_DWORD *)(v10 + 2064);
  unsigned int v20 = v18 + *(_DWORD *)(v10 + 2048);
  int v21 = *(_DWORD *)(v10 + 484) + *(_DWORD *)(v10 + 2036);
  *(_DWORD *)(v10 + 576) = *(_DWORD *)(v10 + 476) + *(_DWORD *)(v10 + 2040);
  int v22 = *(_DWORD *)(v10 + 2052);
  *(_DWORD *)(v10 + 58(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v19;
  *(_DWORD *)(v10 + 592) = v20;
  int v23 = (((2 * (a3 & v17)) & (a3 ^ v17)) << ((((v9 + 94) & 0x9F) + 69) ^ 0xDF)) + ((2 * (a3 & v17)) ^ a3 ^ v17);
  int v24 = ((2 * v22) & 0x230E7160) + (v22 ^ 0x118738B0) + *(_DWORD *)(v10 + 540);
  *(_DWORD *)(v10 + 596) = v21;
  BOOL v25 = *(unsigned __int8 *)(v10 + 2035) != 1;
  *(_DWORD *)(v10 + 636) = v23;
  *(_DWORD *)(v10 + 684) = v19 + 1411009023;
  *(_DWORD *)(v10 + 724) = ((2 * v24) & 0xDCF18EA0) + (v24 ^ 0xEE78C750);
  return (*(uint64_t (**)(void))(*(void *)(v10 + 136) + 8 * ((122 * v25) ^ v9)))();
}

uint64_t sub_24950@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W8>)
{
  __asm { BTI             j }
  BOOL v10 = *(unsigned __int8 *)(v4 + 2035) == (((a4 - 96) & 0xD7) - 84);
  *(_DWORD *)(v4 + 772) = ((a4 - 914807040) & 0x3686DBF7 ^ 0x78365242) + *(_DWORD *)(v4 + 636);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 8 * ((54 * v10) ^ a4)))(a1, a2, a3, 147);
}

uint64_t sub_249E8()
{
  __asm { BTI             j }
  unsigned int v7 = *(_DWORD *)(v1 + 2060);
  **(unsigned char **)(v1 + 1072) = v7 ^ 0x1F;
  **(unsigned char **)(v1 + 108(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v7 >> (7 * (v0 ^ 0x51) + 87)) ^ 0xB;
  **(unsigned char **)(v1 + 1088) = BYTE2(v7) ^ 0xF8;
  v7 >>= 24;
  *(_DWORD *)(v1 + 82(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v7;
  **(unsigned char **)(v1 + 1096) = v7 ^ 0x65;
  *(_DWORD *)(v1 + 872) = 0;
  return (*(uint64_t (**)(uint64_t))(v2 + 8 * v0))(3536694);
}

uint64_t sub_24A74@<X0>(char a1@<W3>, unsigned __int8 a2@<W8>)
{
  __asm { BTI             j }
  *(unsigned char *)(v4 + (unsigned __int16)(65 * a2 - ((a2 * v6) >> 16) * v5)) = a1;
  return (*(uint64_t (**)(void))(v7 + 8 * (((((a2 - 255) & 0xFCu) < 0x3C) * ((v2 - 166) ^ v3)) ^ v2)))();
}

uint64_t sub_24AC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, int a4@<W8>)
{
  __asm { BTI             j }
  v5[218] = a4;
  int v11 = (((v4 - 1824988956) & 0x6CC71CB3) - 160720937) ^ v5[205];
  v5[220] = v5[137];
  v5[221] = v5[171];
  v5[222] = v11;
  v5[223] = v5[193];
  v5[224] = v5[181];
  v5[225] = v5[148];
  v5[226] = v5[141];
  v5[227] = v5[144];
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8 * v4))(a1, a2, 362, a3, 63551);
}

uint64_t sub_24B4C()
{
  __asm { BTI             j }
  *(_DWORD *)(v1 + 912) = *(_DWORD *)(v1 + 548);
  *(_DWORD *)(v1 + 916) = *(_DWORD *)(v1 + 684);
  *(_DWORD *)(v1 + 92(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v1 + 2060);
  *(_DWORD *)(v1 + 924) = *(_DWORD *)(v1 + 772);
  *(_DWORD *)(v1 + 928) = *(_DWORD *)(v1 + 724);
  *(_DWORD *)(v1 + 932) = *(_DWORD *)(v1 + 592);
  *(_DWORD *)(v1 + 936) = *(_DWORD *)(v1 + 564);
  *(_DWORD *)(v1 + 94(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)(v1 + 576);
  *(_DWORD *)(v1 + 944) = *(_DWORD *)(v1 + 596);
  *(_DWORD *)(v1 + 948) = *(_DWORD *)(v1 + 2016);
  *(unsigned char *)(v1 + 955) = *(unsigned char *)(v1 + 2035);
  return (*(uint64_t (**)(void))(v2 + 8 * v0))();
}

uint64_t sub_24BE8()
{
  __asm { BTI             j }
  int v7 = *(_DWORD *)(v1 + 484) + *(_DWORD *)(v1 + 2020);
  int v8 = *(_DWORD *)(v1 + 2048) + *(_DWORD *)(v1 + 544) - 2048462668;
  int v9 = *(_DWORD *)(v1 + 2040) + *(_DWORD *)(v1 + 476) + (v0 ^ 0x26C13D95);
  int v10 = *(_DWORD *)(v1 + 516) + *(_DWORD *)(v1 + 2028);
  **(unsigned char **)(v1 + 1608) = -109;
  **(unsigned char **)(v1 + 1616) = -109;
  **(unsigned char **)(v1 + 1624) = -109;
  *(unsigned char *)(v1 + 208(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1632) = -109;
  **(unsigned char **)(v1 + 164(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1648) = -109;
  **(unsigned char **)(v1 + 1656) = -109;
  **(unsigned char **)(v1 + 1664) = -109;
  **(unsigned char **)(v1 + 1672) = -109;
  **(unsigned char **)(v1 + 168(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1688) = -109;
  **(unsigned char **)(v1 + 1696) = -109;
  **(unsigned char **)(v1 + 1704) = -109;
  **(unsigned char **)(v1 + 1712) = -109;
  **(unsigned char **)(v1 + 172(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1728) = -109;
  **(unsigned char **)(v1 + 1736) = -109;
  **(unsigned char **)(v1 + 1744) = -109;
  **(unsigned char **)(v1 + 1752) = -109;
  **(unsigned char **)(v1 + 176(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1768) = -109;
  **(unsigned char **)(v1 + 1776) = -109;
  **(unsigned char **)(v1 + 1784) = -109;
  **(unsigned char **)(v1 + 1792) = -109;
  **(unsigned char **)(v1 + 180(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1808) = -109;
  **(unsigned char **)(v1 + 1816) = -109;
  **(unsigned char **)(v1 + 1824) = -109;
  **(unsigned char **)(v1 + 1832) = -109;
  **(unsigned char **)(v1 + 184(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1848) = -109;
  **(unsigned char **)(v1 + 1856) = -109;
  **(unsigned char **)(v1 + 1864) = -109;
  **(unsigned char **)(v1 + 1872) = -109;
  **(unsigned char **)(v1 + 188(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1888) = -109;
  **(unsigned char **)(v1 + 1896) = -109;
  **(unsigned char **)(v1 + 1904) = -109;
  **(unsigned char **)(v1 + 1912) = -109;
  **(unsigned char **)(v1 + 192(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1928) = -109;
  **(unsigned char **)(v1 + 1936) = -109;
  **(unsigned char **)(v1 + 1944) = -109;
  **(unsigned char **)(v1 + 1952) = -109;
  **(unsigned char **)(v1 + 196(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  **(unsigned char **)(v1 + 1968) = -109;
  **(unsigned char **)(v1 + 1976) = -109;
  **(unsigned char **)(v1 + 1984) = -109;
  **(unsigned char **)(v1 + 1992) = -109;
  **(unsigned char **)(v1 + 216) = -109;
  **(unsigned char **)(v1 + 224) = -109;
  **(unsigned char **)(v1 + 1088) = -109;
  **(unsigned char **)(v1 + 108(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = -109;
  int v11 = *(_DWORD *)(v1 + 580) + 1119876362;
  **(unsigned char **)(v1 + 232) = -109;
  **(unsigned char **)(v1 + 248) = -109;
  int v12 = *(unsigned char **)(v1 + 264);
  **(unsigned char **)(v1 + 256) = -109;
  unsigned char *v12 = -109;
  **(unsigned char **)(v1 + 1072) = -109;
  **(unsigned char **)(v1 + 1096) = -109;
  **(unsigned char **)(v1 + 272) = -109;
  __int16 v13 = *(unsigned char **)(v1 + 296);
  **(unsigned char **)(v1 + 288) = -109;
  unsigned char *v13 = -109;
  **(unsigned char **)(v1 + 312) = -109;
  int v14 = *(unsigned char **)(v1 + 336);
  v14[11] = v7;
  v14[3] = v11;
  v14[5] = BYTE2(v10);
  *int v14 = HIBYTE(v11);
  v14[1] = BYTE2(v11);
  LODWORD(v13) = *(_DWORD *)(v1 + 564) + 1618260540;
  uint64_t v15 = *(unsigned char **)(v1 + 336);
  v15[7] = v10;
  v15[15] = (_BYTE)v13;
  v15[4] = HIBYTE(v10);
  v15[6] = BYTE1(v10);
  int v16 = *(unsigned char **)(v1 + 336);
  v16[19] = v8;
  v16[8] = HIBYTE(v7);
  v16[2] = BYTE1(v11);
  int v17 = *(_DWORD *)(v1 + 724) + 294074544;
  unsigned int v18 = *(unsigned char **)(v1 + 336);
  v18[10] = BYTE1(v7);
  LODWORD(v12) = *(_DWORD *)(v1 + 636);
  v18[14] = BYTE1(v13);
  v18[13] = BYTE2(v13);
  v18[9] = BYTE2(v7);
  int v19 = *(unsigned char **)(v1 + 336);
  v19[22] = BYTE1(v12);
  v19[16] = HIBYTE(v8);
  v19[23] = (_BYTE)v12;
  v19[12] = BYTE3(v13);
  LODWORD(v21) = __ROR4__(v17 ^ 0x6B0FD313, 16) ^ 0xD3136B0F;
  HIDWORD(v21) = v21;
  int v20 = v21 >> 16;
  int v22 = *(unsigned char **)(v1 + 336);
  v22[20] = BYTE3(v12);
  v22[21] = *(_WORD *)(v1 + 638);
  v22[18] = BYTE1(v8);
  v22[31] = v9;
  int v23 = *(unsigned char **)(v1 + 336);
  v23[17] = BYTE2(v8);
  v23[27] = BYTE2(v21);
  v23[25] = BYTE2(v20);
  int v24 = *(unsigned char **)(v1 + 336);
  v24[26] = BYTE3(v21);
  v24[28] = HIBYTE(v9);
  v24[30] = BYTE1(v9);
  v24[24] = HIBYTE(v20);
  v24[29] = BYTE2(v9);
  *(_DWORD *)(v1 + 1016) = 1077848214;
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(v2 + 8 * v0))(*(void *)(v1 + 56), 3421534475, 1110);
}

uint64_t sub_25018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  __asm { BTI             j }
  int v14 = *(_DWORD *)(v8 + 1016);
  *(_DWORD *)(v8 + 102(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v14;
  return (*(uint64_t (**)(void))(v9 + 8 * (((v14 == ((v6 - v7 - 742) ^ a5) + v6 + 67) * a6) ^ v6)))();
}

uint64_t sub_25054@<X0>(int a1@<W6>, int a2@<W8>)
{
  __asm { BTI             j }
  uint64_t v10 = ((a2 - 401) ^ 0xCBF07892 ^ ((a2 + a1) | v4)) + *(void *)(v3 + 328);
  BOOL v11 = v10 == *(void *)(v3 + 304);
  *(void *)(v3 + 28(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v10;
  *(_DWORD *)(v3 + 102(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v2;
  return (*(uint64_t (**)(void))(v5 + 8 * (a2 | (4 * v11))))();
}

uint64_t sub_250A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  __asm { BTI             j }
  *(void *)(v9 + 88) = v11;
  *(void *)(v9 + 96) = v14;
  *(void *)(v9 + 104) = v13;
  *(void *)(v9 + 56) = a1;
  *(_DWORD *)(v9 + 64) = a6;
  *(_DWORD *)(v9 + 456) = a6 - 1550039736;
  *(unsigned char *)(v9 + 463) = a6 - 1550039736 < ((v6 - 738) | 0x108u) + 184178504;
  uint64_t v20 = *(unsigned int *)(v9 + 452);
  *(void *)(v9 + 8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v20;
  *(void *)(v9 + 464) = v20;
  *(void *)(v9 + 344) = 0;
  *(_DWORD *)(v9 + 356) = v7;
  unint64_t v21 = *(uint64_t (**)(void))(v15 + 8 * v6);
  *(void *)(v9 + 112) = v8;
  *(_DWORD *)(v9 + 72) = -1578122918;
  *(_DWORD *)(v9 + 124) = v10 - 2;
  *(_DWORD *)(v9 + 12) = v7 - 4;
  *(void *)(v9 + 16(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v12;
  return v21();
}

uint64_t sub_25164(int a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8 * (a1 | (4 * (a4 + 4 + v5 != -4)))))();
}

uint64_t sub_25194(int a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  unsigned int v11 = a4 + ((11 * (a1 ^ 0x14E)) ^ 0xACEA1972) + 4;
  int v12 = v5 ^ (v11 < (a1 ^ 0x14Eu) + 184178702);
  BOOL v13 = v11 < v4;
  if (v12) {
    BOOL v13 = v5;
  }
  return (*(uint64_t (**)(void))(v6 + 8 * ((993 * v13) ^ a1)))();
}

uint64_t sub_25208@<X0>(_DWORD *a1@<X1>, int a2@<W5>, int a3@<W6>, int a4@<W7>, int a5@<W8>)
{
  __asm { BTI             j }
  uint64_t v19 = a3 + (v8 ^ *(_DWORD *)(v10 + 72));
  uint64_t v20 = *(void *)(v10 + 128);
  uint64_t v21 = *(void *)(v10 + 152);
  int v22 = *(unsigned __int8 *)(v11 + v19) ^ ((v19 & 0xC) * (_BYTE)v14) & 0xFC ^ *(unsigned __int8 *)(v20 + (v19 & 0xC)) ^ *(unsigned __int8 *)(v12 + (v19 & 0xC) + 1) ^ *(unsigned __int8 *)(v21 + ((v7 - 482) ^ 0x10FLL) + (v19 & 0xC));
  int v23 = 2 * (a3 & v13);
  int v24 = ((((v7 - 740) | 0x282) - 1915760483) ^ a3) & v23 ^ a3 & v13;
  unsigned int v25 = ((2 * (a3 ^ 0x8C45D5A7)) ^ 0x5B542DDE) & (a3 ^ 0x8C45D5A7) ^ (2 * (a3 ^ 0x8C45D5A7)) & (v5 + 14);
  int v26 = v25 ^ 0x24AA1221;
  int v27 = (v25 ^ 0x29000441) & (4 * v24) ^ v24;
  unsigned int v28 = ((4 * v26) ^ 0xB6A85BBC) & v26 ^ (4 * v26) & (v5 + 12);
  int v29 = (v28 ^ 0x24A812A3) & (16 * v27) ^ v27;
  unsigned int v30 = ((16 * (v28 ^ 0x9020443)) ^ 0xDAA16EF0) & (v28 ^ 0x9020443) ^ (16 * (v28 ^ 0x9020443)) & v5;
  int v31 = v29 ^ (v5 + 15) ^ (v30 ^ 0x8A0060F) & (v29 << 8);
  int v32 = a3 ^ (2
            * ((v31 << 16) & 0x2DAA0000 ^ v31 ^ ((v31 << 16) ^ 0x16EF0000) & (((v30 ^ 0x250A100F) << 8) & 0x2DAA0000 ^ 0x5A80000 ^ (((v30 ^ 0x250A100F) << 8) ^ 0x2A160000) & (v30 ^ 0x250A100F))));
  unsigned int v33 = ((v32 & 0x666825E4 ^ 0x60480541) + (v32 & 0x9997DA1A ^ 0x8806CA03) - 2) ^ 0x6458CDE5;
  uint64_t v34 = (v33 - ((2 * v33) & 0x89A95F88) - 992694332) ^ 0xBB2D43F4;
  int v35 = *(unsigned __int8 *)(v20 + (v34 & 0xF)) ^ *(unsigned __int8 *)(*(void *)(v10 + 160) + v34) ^ *(unsigned __int8 *)((v34 & 0xF) + v12 + 1) ^ *(unsigned __int8 *)((v34 & 0xF) + v21 + 5) ^ ((v34 & 0xF) * v14);
  LODWORD(v34) = ((2 * (a3 ^ 0xC3E4812D)) ^ 0xC41684C8) & (a3 ^ 0xC3E4812D) ^ (2 * (a3 ^ 0xC3E4812D)) & a5;
  int v36 = v34 ^ 0x22094225;
  LODWORD(v34) = (v34 ^ 0x20024044) & (4 * (v23 & (a3 ^ 0x81EF832D) ^ a3 & v13)) ^ v23 & (a3 ^ 0x81EF832D) ^ a3 & v13;
  unsigned int v37 = ((4 * v36) ^ 0x882D0994) & v36 ^ (4 * v36) & (a5 + 4);
  LODWORD(v34) = (v37 ^ 0x90000) & (16 * v34) ^ v34;
  int v38 = ((16 * (v37 ^ 0x62024261)) ^ 0x20B42650) & (v37 ^ 0x62024261) ^ (16 * (v37 ^ 0x62024261)) & a5;
  LODWORD(v34) = v34 ^ (a5 + 5) ^ (v38 ^ 0x20000200) & (v34 << 8);
  LODWORD(v34) = a3 ^ (4
                     * (((v34 << 16) & a4 ^ v34 ^ ((v34 << 16) ^ 0x42650000) & (((v38 ^ 0x420B4025) << 8) & a4 ^ 0x60090000 ^ (((v38 ^ 0x420B4025) << 8) ^ 0xB420000) & (v38 ^ 0x420B4025))) >> 1)) ^ 0xB27643F5;
  LODWORD(v34) = (((2 * v34) | 0x32EEE792) - v34 - 427258825) ^ 0x3D371941;
  uint64_t v39 = (((2 * v34) & 0xAF250EBE) - v34 - 1469220704) ^ 0xDFA0165FLL;
  int v40 = *(unsigned __int8 *)(*(void *)(v10 + 160) + v39);
  uint64_t v41 = v39 & 0xF;
  int v42 = v22 | (v35 << 8);
  int v43 = v40 ^ (v41 * v14) ^ *(unsigned __int8 *)(v20 + v41) ^ *(unsigned __int8 *)(v41 + v12 + 1);
  uint64_t v44 = *(void *)(v10 + 136);
  unsigned int v45 = v23 & (a3 ^ 0xB1EFFA03) ^ a3 & v13;
  unsigned int v46 = ((2 * (a3 ^ 0xB22CFE03)) ^ 0x27867A96) & (a3 ^ 0xB22CFE03) ^ (2 * (a3 ^ 0xB22CFE03)) & v6;
  int v47 = (v46 ^ 0x13821808) & (4 * v45) ^ v45;
  int v48 = ((4 * (v46 ^ 0x1041054B)) ^ 0x4F0CF52C) & (v46 ^ 0x1041054B) ^ (4 * (v46 ^ 0x1041054B)) & v6;
  int v49 = (v48 ^ 0x3003503) & (16 * v47) ^ v47;
  int v50 = ((16 * (v48 ^ 0x10C30843)) ^ 0x3C33D4B0) & (v48 ^ 0x10C30843) ^ (16 * (v48 ^ 0x10C30843)) & (v6 - 8);
  int v51 = v49 ^ (v6 + 3) ^ (v50 ^ 0x10031400) & (v49 << 8);
  unsigned int v52 = a3 ^ (4
            * (((v51 << 16) & a2 ^ v51 ^ ((v51 << 16) ^ 0x3D4B0000) & (((v50 ^ 0x3C0294B) << 8) & a2 ^ 0x10C20000 ^ (((v50 ^ 0x3C0294B) << 8) ^ 0x433D0000) & (v50 ^ 0x3C0294Bu))) >> 1)) ^ 0x5F1989E7;
  unsigned int v53 = (((2 * v52) | 0xCCFA4338) - v52 - 1719476636) ^ 0x6A74E74B;
  uint64_t v54 = (((2 * v53) | 0x5D28596) - v53 - 48841419) ^ 0xF516B424;
  *a1 = v42 | ((v43 ^ *(unsigned __int8 *)(v41 + v21 + 5)) << 16) | ((*(unsigned __int8 *)(*(void *)(v10 + 160) + v54) ^ ((v54 & 0xF) * v14) ^ *(unsigned __int8 *)(v20 + (v54 & 0xF)) ^ *(unsigned __int8 *)((v54 & 0xF) + v12 + 1) ^ *(unsigned __int8 *)((v54 & 0xF) + v21 + 5)) << 24);
  return (*(uint64_t (**)(void))(v44
                              + 8 * (v7 ^ (440 * ((unint64_t)(v9 + 3181065608) >= *(void *)(v10 + 80))))))();
}

uint64_t sub_25804(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  __asm { BTI             j }
  *(_DWORD *)(v8 + 356) = a4 + 4;
  *(_DWORD *)(v8 + 484) = a4;
  *(void *)(v8 + 344) = a7;
  *(void *)(v8 + 488) = a7 - 1;
  *(void *)(v8 + 496) = v7;
  *(_DWORD *)(v8 + 504) = a4 + 4;
  int v14 = *(_DWORD *)(v8 + 448) + 1082179655;
  *(_DWORD *)(v8 + 472) = v14;
  *(_DWORD *)(v8 + 388) = a4 + 4;
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(v9
                                                                     + 8
                                                                     * (((v14 != ((a5 - 138) | 4) + 221019010)
                                                                       * (a5 - 610)) ^ a5)))(*(void *)(v8 + 56), *(void *)(v8 + 112), 3421534475, 873432823);
}

uint64_t sub_258A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  __asm { BTI             j }
  *(_DWORD *)(v6 + 476) = a6 + 1210524530;
  BOOL v12 = a6 + 1210524530 < 22 * ((a5 - 582) ^ 0x57u) - 1350224678;
  *(_DWORD *)(v6 + 32) = v12;
  *(_DWORD *)(v6 + 36) = a6 + 1210524530;
  *(unsigned char *)(v6 + 483) = v12;
  *(void *)(v6 + 36(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(unsigned int *)(v6 + 504);
  int v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8 * (a5 - 582));
  *(_DWORD *)(v6 + 28) = *(_DWORD *)(v6 + 472);
  return v13(a1, a2, a3, 24);
}

uint64_t sub_25924(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  __asm { BTI             j }
  unsigned int v9 = *(_DWORD *)(v5 + 80);
  *(_DWORD *)(*(void *)(v5 + 112) + v9 * (unint64_t)a4 + 16) = 1;
  BOOL v11 = v9 + 1 > 0xF2D38279 || v9 + 221019527 >= *(_DWORD *)(v5 + 28);
  return (*(uint64_t (**)(void))(*(void *)(v5 + 136)
                              + 8 * (int)((((19 * (v4 ^ 0x52)) ^ (v4 + 422865851) & 0xE6CB977E ^ 0x2F9) * v11) ^ v4)))();
}

uint64_t sub_259F0@<X0>(uint64_t a1@<X1>, unsigned int a2@<W3>, int a3@<W8>)
{
  __asm { BTI             j }
  int v10 = *(_DWORD *)(a1 + v4 * (unint64_t)a2 + 8);
  uint64_t v11 = (v3 - 1578122424);
  *(void *)(v5 + 48) = v11;
  BOOL v12 = __CFADD__(v11, v10);
  return (*(uint64_t (**)(void))(*(void *)(v5 + 136) + 8 * (v12 | (8 * v12) | a3)))();
}

uint64_t sub_25A40()
{
  __asm { BTI             j }
  int v7 = v0 - 1350224678 + 152 * (v2 ^ 0x1A9) + 114 < *(_DWORD *)(v1 + 36);
  if (*(_DWORD *)(v1 + 32) != v0 > 241 * (v2 ^ 0x1A9u) + 1350223777) {
    int v7 = *(_DWORD *)(v1 + 32);
  }
  return (*(uint64_t (**)(void))(*(void *)(v1 + 136) + 8 * ((534 * v7) ^ v2)))();
}

uint64_t sub_25AC0()
{
  __asm { BTI             j }
  *(_DWORD *)(v4 + 68) = v3;
  *(void *)(v4 + 72) = v1;
  *(_DWORD *)(v4 + 8(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v0;
  *(void *)(v4 + 16) = v2;
  uint64_t v10 = *(void *)(v4 + 136);
  uint64_t v11 = *(uint64_t (**)(void))(v10 + 8 * (int)(v5 ^ 0x4C3));
  *(void *)(v4 + 4(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = (v5 ^ 0x1F2) + ((v2 + 7) & 0x1FFFFFFF8);
  BOOL v12 = v11() != 0;
  return (*(uint64_t (**)(void))(v10 + 8 * (int)((969 * v12) ^ v5)))();
}

uint64_t sub_25B2C(void *a1)
{
  __asm { BTI             j }
  uint64_t v7 = *(void *)(v1 + 40);
  *a1 = 0;
  a1[1] = v7;
  return (*(uint64_t (**)(void))(*(void *)(v1 + 136) + 8 * v2))();
}

uint64_t sub_25B50(uint64_t a1)
{
  __asm { BTI             j }
  **(void **)(v2 + 72) = v1;
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, void, void, void))(*(void *)(v2 + 136) + 8 * (((*v5 + 1153867353 - (((v4 ^ 0x1C1) - 1987233137 + ((v4 + 2135321688) & 0x80B993CD)) & (2 * *v5)) != 0x44C69E59) * v3) ^ v4)))(a1, *(void *)(v2 + 128), 3421534475, 24, 411, *(unsigned int *)(v2 + 64), *(void *)(v2 + 152), *(void *)(v2 + 144));
}

uint64_t sub_25BE4@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(*(void *)(v1 + 136) + 8 * a1))();
}

uint64_t sub_25C3C@<X0>(uint64_t a1@<X1>, int a2@<W4>, uint64_t a3@<X6>, uint64_t a4@<X7>, int a5@<W8>)
{
  __asm { BTI             j }
  unsigned int v16 = v11 + (a5 ^ a2) - 69;
  *(unsigned char *)(v5 + v16) = *(unsigned char *)(a1 + ((v16 + v10) & 0xF)) ^ *(unsigned char *)(v8 + v16 + v10) ^ *(unsigned char *)(((v16 + v10) & 0xF) + a4 + 1) ^ *(unsigned char *)(((v16 + v10) & 0xF) + a3 + 5) ^ (((v16 + v10) & 0xF) * v7);
  return (*(uint64_t (**)(void))(*(void *)(v6 + 136) + 8 * (((v16 == 0) * v9) ^ a5)))();
}

uint64_t sub_25CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  *(_DWORD *)(v5 + 444) = v6;
  return (*(uint64_t (**)(void))(v7 + 8 * a5))(*(void *)(v5 + 56));
}

uint64_t sub_25CCC(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v4 + 8 * (v5 + a4)))();
}

uint64_t sub_25CE4@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (a1 + 107)))();
}

uint64_t sub_25D10()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(v1 + 8 * (v2 + v0)))();
}

_DWORD *sub_25D28(_DWORD *result)
{
  __asm { BTI             j }
  *uint64_t result = v1;
  return result;
}

void sub_261DC(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 1065328829 * ((((2 * a1) | 0xE7A1C3EA) - a1 + 204414475) ^ 0x2655ACD9);
  __asm { BRAA            X9, X17 }
}

uint64_t sub_262C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x258]
                                                                                                  + 8 * ((506 * ((*v7 - a7 - 1522012025) < 0x20)) ^ (v8 - 55))))(a1, a2, a3, a4, a5, a6, 1159774049);
}

uint64_t sub_26308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  __asm { BTI             j }
  int v42 = (unsigned __int8 *)(*(void *)(v36 + 24) + (v34 + v38 - 32));
  unint64_t v43 = STACK[0x258];
  (*(void (**)(unint64_t *))(STACK[0x258] + 8 * (v37 ^ 0x634)))(&STACK[0x260]);
  uint64_t v45 = v42[4] - ((2 * v42[4]) & 0x30u) + 2065379864;
  uint64_t v46 = v42[5] - ((2 * v42[5]) & 0x30u) + 1782296;
  uint64_t v47 = v42[6] - ((2 * v42[6]) & 0x30u) + 12824;
  uint64_t v48 = v42[7] - ((2 * v42[7]) & 0x30u) + 24;
  unint64_t v49 = (*v42 - ((2 * *v42) & 0x30) - 0x204612D384E4CDE8) ^ ((v42[1]
                                                                              - ((2 * v42[1]) & 0x30)
                                                                              + 0xB9ED2C7B1B3218) << ((v37 - 67) & 0xDF ^ 0xC6u)) ^ (((v42[2] - ((2 * v42[2]) & 0x30)) << 16) - 0x12D384E4CDE80000) ^ (((v42[3] - ((2 * v42[3]) & 0x30)) << 24) + 0x2C7B1B3218000000) ^ (v45 << 32) ^ (v46 << 40) ^ (v47 << 48) ^ (v48 << 56) ^ 0xED328B664A312A18;
  unint64_t v50 = SLODWORD(STACK[0x268]) + 1000000 * STACK[0x260];
  _CF = v50 >= v49;
  unint64_t v51 = v50 - v49;
  _CF = v51 == 0 || !_CF || v51 >= 0x50775D801;
  int v53 = !_CF;
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v43 + 8 * ((248 * v53) ^ (v37 - 473))))(STACK[0x260], 1000000, v45, v46, v47, v48, (v35 + 1), v44, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

uint64_t sub_264C4()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(STACK[0x258]
                              + 8 * ((592 * (*(unsigned char *)(v1 + 8) == ((v0 - 333930773) & 0x77 ^ 0x3D))) ^ v0)))();
}

uint64_t sub_26514()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(STACK[0x258]
                              + 8 * (int)(((((v0 + 234621669) & 0xF203F77D) - 766) * (*(unsigned char *)(v1 + 9) == 60)) ^ v0)))();
}

uint64_t sub_26558()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(STACK[0x258]
                              + 8
                              * (((*(unsigned char *)(v1 + 10) == 0) * (v0 + 365 + ((v0 + 991) ^ 0x7DE) + 246)) ^ (v0 + 365))))();
}

uint64_t sub_26598()
{
  __asm { BTI             j }
  STACK[0x278] = 112;
  int v5 = *(uint64_t (**)(void))(STACK[0x258] + 8 * v0);
  LODWORD(STACK[0x24C]) = 79810555;
  LODWORD(STACK[0x248]) = 823302300;
  LODWORD(STACK[0x254]) = -1159696010;
  LODWORD(STACK[0x250]) = -1562158024;
  LODWORD(STACK[0x240]) = -1491643364;
  LODWORD(STACK[0x23C]) = 1941635017;
  return v5(0);
}

#error "26650: too big function (funcsize=0)"

uint64_t sub_37AF8@<X0>(unsigned int a1@<W1>, unsigned int a2@<W2>, unsigned int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  __asm { BTI             j }
  LODWORD(a49) = 0;
  unsigned int v66 = bswap32(a3);
  *(_WORD *)(v61 - 24(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v66;
  unsigned int v67 = bswap32(v56);
  *(unsigned char *)(v61 - 236) = v67;
  *(unsigned char *)(v61 - 238) = v66 >> ((a39 ^ 2) + 97);
  *(unsigned char *)(v61 - 233) = HIBYTE(v67);
  *(unsigned char *)(v61 - 235) = BYTE1(v67);
  uint64_t v68 = bswap32(v58);
  *(unsigned char *)(v61 - 237) = HIBYTE(v66);
  *(unsigned char *)(v61 - 23(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = BYTE2(v68);
  unsigned int v69 = bswap32(v57);
  *(unsigned char *)(v61 - 227) = BYTE1(v69);
  *(unsigned char *)(v61 - 234) = BYTE2(v67);
  unsigned int v70 = bswap32(v60);
  *(unsigned char *)(v61 - 231) = BYTE1(v68);
  *(unsigned char *)(v61 - 225) = HIBYTE(v69);
  *(_WORD *)(v61 - 224) = v70;
  *(unsigned char *)(v61 - 226) = BYTE2(v69);
  *(unsigned char *)(v61 - 228) = v69;
  *(unsigned char *)(v61 - 229) = BYTE3(v68);
  unsigned int v71 = bswap32(v59);
  *(unsigned char *)(v61 - 222) = BYTE2(v70);
  *(unsigned char *)(v61 - 218) = BYTE2(v71);
  *(unsigned char *)(v61 - 219) = BYTE1(v71);
  *(unsigned char *)(v61 - 221) = HIBYTE(v70);
  uint64_t v72 = bswap32(a2);
  *(unsigned char *)(v61 - 212) = v72;
  uint64_t v73 = bswap32(a1);
  *(unsigned char *)(v61 - 214) = BYTE2(v73);
  *(unsigned char *)(v61 - 215) = BYTE1(v73);
  *(unsigned char *)(v61 - 217) = HIBYTE(v71);
  *(unsigned char *)(v61 - 216) = v73;
  *(unsigned char *)(v61 - 22(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v71;
  *(unsigned char *)(v61 - 213) = BYTE3(v73);
  *(unsigned char *)(v61 - 211) = BYTE1(v72);
  LODWORD(STACK[0x254]) = -818353852;
  *(unsigned char *)(v61 - 21(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = BYTE2(v72);
  LODWORD(STACK[0x250]) = 1520663644;
  LODWORD(STACK[0x240]) = -716505640;
  *(unsigned char *)(v61 - 209) = BYTE3(v72);
  LODWORD(STACK[0x23C]) = -1922483591;
  LODWORD(STACK[0x24C]) = -1373855528;
  LODWORD(STACK[0x248]) = -242571488;
  *(unsigned char *)(v61 - 232) = v68;
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, uint64_t, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x258] + 8 * (int)a39))(WORD1(v68), v73, v72, v72 >> 8, v68, v68 >> 8, WORD1(v72), HIWORD(v69), a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56);
}

uint64_t sub_37C98@<X0>(int a1@<W1>, int a2@<W2>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,int a39)
{
  __asm { BTI             j }
  unsigned int v48 = a3 ^ 0x94450B12;
  LOBYTE(STACK[0x731]) = BYTE2(v48);
  LOBYTE(STACK[0x732]) = BYTE1(v48);
  LOBYTE(STACK[0x733]) = v48;
  LOBYTE(STACK[0x730]) = HIBYTE(v48);
  LOBYTE(STACK[0x735]) = (v39 ^ 0xE1202246) >> 16;
  LOBYTE(STACK[0x738]) = (v41 ^ 0x1F89CDA6u) >> 24;
  LOBYTE(STACK[0x73A]) = (unsigned __int16)(v41 ^ 0xCDA6) >> 8;
  LOBYTE(STACK[0x739]) = (v41 ^ 0x1F89CDA6u) >> 16;
  LOBYTE(STACK[0x734]) = (v39 ^ 0xE1202246) >> 24;
  LOBYTE(STACK[0x737]) = v39 ^ 0x46;
  LOBYTE(STACK[0x736]) = (unsigned __int16)(v39 ^ 0x2246) >> 8;
  LOBYTE(STACK[0x73B]) = v41 ^ 0xA6;
  LOBYTE(STACK[0x73E]) = (unsigned __int16)(v40 ^ 0xEB69) >> 8;
  LOBYTE(STACK[0x73C]) = (v40 ^ 0xA56AEB69) >> 24;
  LOBYTE(STACK[0x741]) = (v43 ^ 0x94450B12) >> 16;
  LOBYTE(STACK[0x73F]) = v40 ^ 0x69;
  LOBYTE(STACK[0x73D]) = (v40 ^ 0xA56AEB69) >> 16;
  LOBYTE(STACK[0x740]) = (v43 ^ 0x94450B12) >> 24;
  LOBYTE(STACK[0x743]) = v43 ^ 0x12;
  LOBYTE(STACK[0x742]) = (unsigned __int16)(v43 ^ 0xB12) >> 8;
  LOBYTE(STACK[0x749]) = (a1 ^ 0x1F89CDA6u) >> 16;
  LOBYTE(STACK[0x746]) = (unsigned __int16)(v42 ^ 0x2246) >> 8;
  LOBYTE(STACK[0x748]) = (a1 ^ 0x1F89CDA6u) >> 24;
  LOBYTE(STACK[0x745]) = (v42 ^ 0xE1202246) >> 16;
  LOBYTE(STACK[0x747]) = v42 ^ 0x46;
  LOBYTE(STACK[0x744]) = (v42 ^ 0xE1202246) >> 24;
  LOBYTE(STACK[0x74C]) = (a2 ^ 0xA56AEB69) >> 24;
  LOBYTE(STACK[0x74B]) = a1 ^ 0xA6;
  LOBYTE(STACK[0x74E]) = (unsigned __int16)(a2 ^ 0xEB69) >> 8;
  LOBYTE(STACK[0x74A]) = (unsigned __int16)(a1 ^ 0xCDA6) >> 8;
  LOBYTE(STACK[0x74F]) = a2 ^ 0x69;
  LOBYTE(STACK[0x74D]) = (a2 ^ 0xA56AEB69) >> 16;
  return (*(uint64_t (**)(void))(STACK[0x258]
                              + 8
                              * ((981 * ((((a39 ^ 0x1F8) + 657) ^ 0x4CE14BE1 ^ (2 * (a39 ^ 0x1F8))) == 1289832848)) ^ a39)))();
}

uint64_t sub_37E1C()
{
  __asm { BTI             j }
  unint64_t v7 = STACK[0x278] + v2 - 240;
  int v8 = (char *)&STACK[0x280] + STACK[0x270];
  STACK[0x270] += (v0 ^ 0x271u) + 255;
  unint64_t v9 = STACK[0x258];
  uint64_t v10 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(STACK[0x258] + 8 * (v0 ^ 0x59E)))(*(void *)(v1 + 8 * (v0 ^ 0x16F)) - 12, v7 - 112, 16);
  BOOL v11 = (unint64_t)&v8[-*(void *)(v1 + 8 * (v0 ^ 0x170)) + 4] > 0x1F;
  return (*(uint64_t (**)(uint64_t))(v9 + 8 * ((v11 | (2 * v11)) ^ v0)))(v10);
}

uint64_t sub_37EB0()
{
  __asm { BTI             j }
  *int v0 = xmmword_83D0;
  v0[1] = xmmword_83E0;
  v0[2] = xmmword_83F0;
  v0[3] = xmmword_8400;
  v0[4] = xmmword_8410;
  v0[5] = xmmword_8420;
  v0[6] = xmmword_8430;
  v0[7] = xmmword_8440;
  v0[8] = xmmword_8450;
  v0[9] = xmmword_8460;
  v0[10] = xmmword_8470;
  v0[11] = xmmword_8480;
  v0[12] = 0u;
  v0[13] = 0u;
  v0[14] = 0u;
  v0[15] = 0u;
  v0[16] = 0u;
  v0[17] = 0u;
  v0[18] = 0u;
  v0[19] = 0u;
  v0[20] = 0u;
  v0[21] = 0u;
  v0[22] = 0u;
  v0[23] = 0u;
  v0[24] = 0u;
  v0[25] = 0u;
  v0[26] = 0u;
  v0[27] = 0u;
  v0[28] = 0u;
  v0[29] = 0u;
  v0[30] = 0u;
  v0[31] = 0u;
  v0[32] = 0u;
  v0[33] = 0u;
  return (*(uint64_t (**)(void))(STACK[0x258] + 8 * v1))();
}

uint64_t sub_37F70()
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(STACK[0x258] + 8 * (v0 - 692)))();
}

uint64_t sub_37FA0@<X0>(uint64_t a1@<X8>)
{
  __asm { BTI             j }
  *(_DWORD *)(v5 + 4 * v1) = *(_DWORD *)(a1 + 4 * v1);
  return (*(uint64_t (**)(void))(STACK[0x258] + 8 * (((v1 + 1 == v3) * v4) ^ v2)))();
}

uint64_t sub_37FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  __asm { BTI             j }
  LODWORD(STACK[0x254]) = 103 * (v42 ^ 0x15A);
  int v48 = v41[8];
  int v47 = v41[9];
  int v50 = v41[4];
  int v49 = v41[5];
  unsigned int v226 = (v49 + v47 - ((v42 + 2096989810) & (2 * (v49 + v47))) + 1048495077) ^ 0x89AD36AD;
  int v51 = v41[24];
  int v219 = v41[25];
  int v52 = v41[16];
  LODWORD(STACK[0x218]) = v41[17];
  int v217 = v219 + v52 + 605762434;
  int v53 = v41[20];
  int v54 = v41[21];
  int v223 = v54 + v53 + 1086833377;
  int v55 = v41[6];
  int v232 = v41[7];
  int v57 = v41[42];
  int v56 = v41[43];
  int v58 = v56 - v55 - 813692270;
  int v60 = *v41;
  int v59 = v41[1];
  int v220 = (v59 ^ v54) + 562695748;
  int v62 = v41[14];
  int v61 = v41[15];
  int v63 = v61 - v48 + 331490220;
  int v64 = v41[13];
  int v229 = v41[12];
  int v213 = v64 - *v41 - 1105676820;
  int v65 = v41[33];
  int v215 = v41[32];
  int v211 = v56 + v65 + 1347883528;
  int v66 = v41[26];
  int v210 = v41[27];
  int v233 = (v51 ^ v66) - 1661254279;
  int v212 = (v50 ^ v64) + 2033928374;
  int v68 = v41[18];
  int v67 = v41[19];
  int v224 = v66 - v68 - 1555621071;
  STACK[0x278] = v40;
  unsigned int v225 = (((v61 ^ v59 ^ 0xDCE8005B) + 1134997571) ^ ((v61 ^ v59 ^ 0x2152FFF9) - 1105440799) ^ ((v61 ^ v59 ^ 0xFDBAFFA2)
                                                                                             + 1660178364))
       + 899432890;
  int v69 = v41[2];
  int v70 = v41[3];
  LODWORD(STACK[0x210]) = v232 + v70 + 796880650;
  int v228 = v68 + v57 - 400971952;
  int v72 = v41[36];
  int v71 = v41[37];
  int v221 = (v71 ^ v57) - 1615096732;
  int v73 = v41[38];
  int v214 = v41[39];
  int v227 = (((v73 ^ v53 ^ 0x179BC12) + 1504849434) ^ ((v73 ^ v53 ^ 0x18E3740C) + 1076422152) ^ ((v73 ^ v53 ^ 0x199AC81E)
                                                                                            + 1095850518))
       - 814402398;
  LODWORD(STACK[0x22C]) = (v55 ^ v47) - 1341075840;
  int v235 = v41[10];
  LODWORD(STACK[0x200]) = (v235 ^ v215) - 1013764224;
  int v75 = v41[34];
  int v74 = v41[35];
  int v230 = v72 - v75 - 112897176;
  int v77 = v41[40];
  int v76 = v41[41];
  LODWORD(STACK[0x240]) = ((v77 - v76) ^ 0x3FAFDF45) + 812457987 + ((2 * (v77 - v76)) & 0x7F5FBE8A);
  int v218 = v41[44];
  int v234 = v41[45];
  LODWORD(STACK[0x220]) = v218 - v50 - 763559938;
  LODWORD(STACK[0x238]) = ((v74 - v77) ^ 0xFDFFEFF7) + 974426776 + ((2 * (v74 - v77)) & 0xFBFFDFEE);
  int v237 = v48 + v62 - 1382746823;
  int v78 = v41[11];
  LODWORD(STACK[0x23C]) = (((v62 ^ v78 ^ 0x5CD1F622) + 468816760) ^ ((v62 ^ v78 ^ 0x59A16905) + 511773777) ^ ((v62 ^ v78 ^ 0x5709F27) + 1112603251))
                        + 1282446527;
  LODWORD(STACK[0x21C]) = v52
                        - ((((2 * v52) ^ 0x48F01BA0) + 1209883497) ^ (((2 * v52) ^ 0xD25A8CD6) - 759706593) ^ (((2 * v52) ^ 0x9AAA9776) - 1706567745))
                        + v71
                        - 843451921;
  int v80 = v41[30];
  int v79 = v41[31];
  LODWORD(STACK[0x24C]) = v79 - v72 - 1703589026;
  LODWORD(STACK[0x250]) = ((v234 - v79) ^ 0xFFDFF7D7) + 1630474442 + ((2 * (v234 - v79)) & 0xFFBFEFAE);
  LODWORD(STACK[0x248]) = v80 - v74 + 921980941;
  int v81 = v70 - v80 + 1988249787;
  int v82 = v41[22];
  LODWORD(STACK[0x230]) = (((v82 ^ v65 ^ 0xA659BCBD) - 1577488110) ^ ((v82 ^ v65 ^ 0x9EEE1DA7) - 1722888180) ^ ((v82 ^ v65 ^ 0x38B7A11A) + 1058499767))
                        + 1311617319;
  int v83 = v69 + v73 - ((2 * (v69 + v73)) & 0x21981FF0);
  int v84 = v67 - v69;
  int v222 = v49 - v67;
  int v85 = v41[29];
  int v86 = (char *)*(&off_5B860 + v42 - 294) - 8;
  int v87 = (char *)*(&off_5B860 + v42 - 318) - 4;
  uint64_t v88 = (uint64_t)*(&off_5B860 + (v42 ^ 0x16B));
  int v89 = ((v86[LOBYTE(STACK[0x736]) ^ 0x58] ^ 0xBD) << 8) | ((*(unsigned __int8 *)(v88 + (LOBYTE(STACK[0x734]) ^ 0x1FLL)) ^ 0x90) << 24);
  unsigned int v90 = ((v86[LOBYTE(STACK[0x73A]) ^ 0x7ALL] ^ 0x11) << 8) | ((*(unsigned __int8 *)(v88 + (LOBYTE(STACK[0x738]) ^ 0x5ELL)) ^ 0xFFFFFF9F) << 24);
  int v91 = (char *)*(&off_5B860 + (v42 ^ 0x14B)) - 8;
  int v92 = (v87[LOBYTE(STACK[0x73F]) ^ 0xBCLL] - 80) | ((v86[LOBYTE(STACK[0x73E]) ^ 0xEBLL] ^ 0x3B) << 8) | ((*(unsigned __int8 *)(v88 + (LOBYTE(STACK[0x73C]) ^ 0xD6)) ^ 0xBC) << 24) | ((v91[LOBYTE(STACK[0x73D]) ^ 0xEFLL] ^ 0x15) << 16);
  LODWORD(v86) = ((v87[LOBYTE(STACK[0x733]) ^ 0xF8] - 80) ^ 0x77 | ((*(unsigned __int8 *)(v88 + (LOBYTE(STACK[0x730]) ^ 0x20)) ^ 0x8D) << 24) | ((v86[LOBYTE(STACK[0x732]) ^ 0xF4] ^ 4) << 8) | ((v91[LOBYTE(STACK[0x731]) ^ 0x56] ^ 5) << 16)) ^ 0x9DFE4135;
  unsigned int v93 = (v89 & 0xFFFFFF00 | ((v91[LOBYTE(STACK[0x735]) ^ 0x31] ^ 0xC4) << 16) | (v87[LOBYTE(STACK[0x737]) ^ 0xD0] - 80) ^ 0x82) ^ 0x37335235;
  int v216 = v41[23];
  int v94 = v78 + v216;
  unsigned int v95 = v58 ^ (v78 + v216) ^ (v90 & 0xFFFFFF00 | (v87[LOBYTE(STACK[0x73B]) ^ 0x4DLL] - 80) ^ 0xD2 | ((v91[LOBYTE(STACK[0x739]) ^ 0xALL] ^ 0x90) << 16));
  unsigned int v96 = v81 ^ (v85 + v76 - ((2 * (v85 + v76)) & 0xF5ACFBD8) + 2060877292) ^ 0x5941661A ^ (v93
                                                                                        - 2
                                                                                        * (v93 & 0x7AD67DEE ^ ((v87[LOBYTE(STACK[0x737]) ^ 0xD0] - 80) ^ 0x82) & 2)
                                                                                        + 2060877292);
  LODWORD(STACK[0x208]) = v81;
  unsigned int v97 = v81 ^ v63 ^ v92;
  unsigned int v98 = (v78 + v216) ^ (v82 + v75 - ((2 * (v82 + v75)) & 0x4945EC6A) + 614659637) ^ 0x2A746DAB ^ (v86
                                                                                                - ((2 * v86) & 0x4945EC6A)
                                                                                                + 614659637);
  if ((v97 & 2) != 0) {
    char v99 = -2;
  }
  else {
    char v99 = 2;
  }
  unsigned int v100 = (char *)*(&off_5B860 + v42 - 331) - 4;
  int v101 = (char *)*(&off_5B860 + (v42 ^ 0x17A)) - 8;
  v236[0] = v42;
  int v102 = (char *)*(&off_5B860 + (v42 ^ 0x150)) - 12;
  uint64_t v103 = (uint64_t)*(&off_5B860 + (v42 ^ 0x15C));
  unsigned __int8 v104 = v99 + (v97 ^ 0xAC);
  int v105 = *(_DWORD *)&v100[4 * v98] ^ __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v97) ^ 0x42)], 15) ^ ((((v95 ^ 0x7D0352F7) >> 16) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (((v95 ^ 0x7D0352F7) >> 16) ^ 0xA5)] + 1) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v96)) - 26468912);
  unsigned int v106 = v81 ^ v84 ^ ((((v97 ^ 0xC0B15AAC) >> 16) ^ 0x1D563825)
                    + *(_DWORD *)&v102[4 * (((v97 ^ 0xC0B15AAC) >> 16) ^ 0xA5)]
                    + 1) ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v98)], 15) ^ (*(_DWORD *)(v103
                                                                                       + 4
                                                                                       * ((v95 ^ 0x7D0352F7) >> 24))
                                                                           - 26468912) ^ *(_DWORD *)&v100[4 * v96] ^ 0x99793C67;
  int v231 = v94;
  unsigned int v107 = v94 ^ 0x88A53039;
  unsigned int v108 = v211 ^ v94 ^ 0x88A53039 ^ *(_DWORD *)&v100[4 * (v104 ^ 0x5C)] ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v98))
                                                                        - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v95) ^ 0x4A)], 15) ^ ((BYTE2(v96) ^ 0x1D563825)+ *(_DWORD *)&v102[4 * (BYTE2(v96) ^ 0xA5)]+ 1);
  unsigned int v109 = v60 ^ v210 ^ ((v94 ^ 0x88A53039) - ((2 * (v94 ^ 0x88A53039)) & 0xBBF2E5DC) + 1576628974) ^ *(_DWORD *)&v100[4 * (v95 ^ 0xF7)] ^ (*(_DWORD *)(v103 + 4 * (HIBYTE(v97) ^ 0x1D)) - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v96)], 15) ^ ((BYTE2(v98) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v98) ^ 0xA5)] + 1);
  unsigned int v110 = v94 ^ (v83 + 281808888) ^ 0xA18BB606 ^ (v105 - ((2 * v105) & 0x21981FF0) + 281808888);
  unsigned int v111 = v108 ^ 0x19E03215;
  unsigned int v112 = BYTE1(v108) ^ 0x2A;
  int v113 = *(_DWORD *)&v102[4 * (BYTE2(v110) ^ 0xA5)] + (BYTE2(v110) ^ 0x1D563825);
  unsigned int v114 = v212 ^ __ROR4__(*(_DWORD *)&v101[4 * ((unsigned __int16)(v109 ^ 0xB21A) >> 8)], 15) ^ ((BYTE2(v106) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v106) ^ 0xA5)] + 1) ^ *(_DWORD *)&v100[4 * (v108 ^ 0x15)] ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v110)) - 26468912);
  int v115 = *(_DWORD *)&v100[4 * v106] ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v110)], 15) ^ ((((v108 ^ 0x19E03215) >> 16) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (((v108 ^ 0x19E03215) >> 16) ^ 0xA5)] + 1) ^ (*(_DWORD *)(v103 + 4 * ((v109 ^ 0xA4A2B21A) >> 24)) - 26468912);
  unsigned int v116 = (v115 ^ 0xC571725B) + v226 - 2 * ((v115 ^ 0xC571725B) & v226);
  unsigned int v117 = v213 ^ __ROR4__(*(_DWORD *)&v101[4 * v112], 15) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v106)) - 26468912) ^ *(_DWORD *)&v100[4 * ((v94 ^ (v83 - 8)) ^ 6 ^ (v105 - ((2 * v105) & 0xF0) - 8))] ^ ((((v109 ^ 0xA4A2B21A) >> 16) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (((v109 ^ 0xA4A2B21A) >> 16) ^ 0xA5)] + 1) ^ 0xD208A315;
  unsigned int v118 = v217 ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v111)) - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v106)], 15) ^ *(_DWORD *)&v100[4 * (v109 ^ 0x44)] ^ (v113 + 1) ^ 0xC1AF5882;
  LOBYTE(v113) = v114 ^ 0x40;
  int v119 = *(_DWORD *)&v102[4 * (((v114 ^ 0xDDD9BD40) >> 16) ^ 0xA5)]
       + (((v114 ^ 0xDDD9BD40) >> 16) ^ 0x1D563825);
  LODWORD(v12(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)&v100[4 * v118] ^ __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v116) ^ 8)], 15) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v114)) - 26468912) ^ 0xC571725B;
  HIDWORD(v12(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v120;
  int v121 = (v219 - v214) ^ __ROR4__((v120 >> 27) ^ __ROR4__((BYTE2(v117) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v117) ^ 0xA5)] + 1, 27) ^ 0x9010D80C, 5);
  int v122 = (*(_DWORD *)&v102[4 * (BYTE2(v118) ^ 0xA5)] + (BYTE2(v118) ^ 0x1D563825) + 1) ^ v220 ^ (*(_DWORD *)(v103 + 4 * (HIBYTE(v116) ^ 0x16))
                                                                                               - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v114) ^ 0xA5)], 15) ^ *(_DWORD *)&v100[4 * v117];
  unsigned int v123 = (LODWORD(STACK[0x254]) + v223) ^ *(_DWORD *)&v100[4 * v113] ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v117))
                                                                                       - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v118)], 15) ^ 0xA3D13138 ^ ((BYTE2(v116) ^ 0x1D5638B5) + *(_DWORD *)&v102[4 * (BYTE2(v116) ^ 0x35)] + 1);
  unsigned int v124 = v215 ^ (v85 - ((2 * v85) & 0xC5752F9C) + 1656395726) ^ (v119 + 1) ^ *(_DWORD *)&v100[4
                                                                                            * (((v115 ^ 0x5B) + v226 - 2 * ((v115 ^ 0x5B) & v226)) ^ 0x52)] ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v117)], 15) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v118)) - 26468912) ^ 0x5EFCD31F;
  unsigned int v125 = v122 ^ 0x6DC86CEA;
  unsigned int v126 = v122 ^ 0xB4;
  int v127 = v221 ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v124)], 15) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v123)) - 26468912) ^ ((((v122 ^ 0x6DC86CEAu) >> 16) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (((v122 ^ 0x6DC86CEAu) >> 16) ^ 0xA5)] + 1) ^ *(_DWORD *)&v100[4 * (v121 ^ 0x2E)];
  unsigned int v128 = v224 ^ __ROR4__(*(_DWORD *)&v101[4 * ((unsigned __int16)(v122 ^ 0x6CEA) >> 8)], 15) ^ (*(_DWORD *)&v102[4 * (BYTE2(v123) ^ 0xA5)] + (BYTE2(v123) ^ 0x1D563825) + 1) ^ *(_DWORD *)&v100[4 * v124] ^ 0x78C15A15 ^ (*(_DWORD *)(v103 + 4 * ((v121 ^ 0x3B28B42Eu) >> 24)) - 26468912);
  unsigned int v129 = v218 ^ v214 ^ (*(_DWORD *)&v102[4 * (BYTE2(v124) ^ 0xA5)] + (BYTE2(v124) ^ 0x1D563825) + 1) ^ __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v121) ^ 0xAC)], 15) ^ *(_DWORD *)&v100[4 * v123] ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v125)) - 26468912) ^ 0x5560ABD9;
  unsigned int v130 = v225 ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v124)) - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v123)], 15) ^ *(_DWORD *)&v100[4 * v126] ^ 0x2DBF2CAB ^ (*(_DWORD *)&v102[4 * (((v121 ^ 0x3B28B42Eu) >> 16) ^ 0xA5)] + (((v121 ^ 0x3B28B42Eu) >> 16) ^ 0x1D563825) + 1);
  int v131 = *(_DWORD *)&v102[4 * (((v127 ^ 0xA0402EC1) >> 16) ^ 0xA5)]
       + (((v127 ^ 0xA0402EC1) >> 16) ^ 0x1D563825);
  unsigned int v132 = (*(_DWORD *)(v103 + 4 * HIBYTE(v129)) - 26468912) ^ v222 ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v128)], 15) ^ ((BYTE2(v130) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v130) ^ 0xA5)] + 1) ^ *(_DWORD *)&v100[4 * (v127 ^ 0xC1)];
  unsigned int v133 = v227 ^ *(_DWORD *)&v100[4 * v129] ^ ((BYTE2(v128) ^ 0x1D563825)
                                                             + *(_DWORD *)&v102[4 * (BYTE2(v128) ^ 0xA5)]
                                                             + 1) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v130)) - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v127) ^ 0x36)], 15) ^ 0x94F89B6B;
  unsigned int v134 = *(_DWORD *)&v101[4 * BYTE1(v130)];
  int v135 = v228 ^ *(_DWORD *)&v100[4 * v128] ^ (*(_DWORD *)(v103 + 4 * ((v127 ^ 0xA0402EC1) >> 24))
                                                             - 26468912) ^ ((BYTE2(v129) ^ 0x1D563825)
                                                                          + *(_DWORD *)&v102[4 * (BYTE2(v129) ^ 0xA5)]
                                                                          + 1) ^ (v134 >> 15) ^ 0x299CF29;
  unsigned int v136 = v229 ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v128)) - 26468912) ^ (v131 + 1) ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v129)], 15) ^ *(_DWORD *)&v100[4 * v130] ^ 0xD4D13E9B;
  int v137 = (BYTE2(v132) ^ 0x1D5638C6) + *(_DWORD *)&v102[4 * (BYTE2(v132) ^ 0x46)];
  unsigned int v138 = v135 ^ (v134 << 17);
  int v139 = (*(_DWORD *)&v102[4 * (BYTE2(v133) ^ 0xA5)] + (BYTE2(v133) ^ 0x1D563825) + 1) ^ *(_DWORD *)&v100[4 * v138];
  unsigned int v140 = BYTE1(v132) ^ 0x6E;
  unsigned int v141 = HIBYTE(v132) ^ 0x5C;
  unsigned int v142 = v132 ^ 0x8F;
  int v143 = (BYTE2(v136) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v136) ^ 0xA5)];
  unsigned int v144 = (v139 - ((2 * v139) & 0x8AE2E4B6) - 982420901) ^ v230 ^ (*(_DWORD *)(v103 + 4 * v141) - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v136)], 15);
  int v145 = *(_DWORD *)&v100[4 * v133] ^ (v229 + v216) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v136)) - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * v140], 15) ^ ((BYTE2(v138) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v138) ^ 0xA5)] + 1);
  int v146 = v41[28];
  int v147 = v146 ^ LODWORD(STACK[0x218]);
  int v148 = *(_DWORD *)&v100[4 * v136] ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v138)) - 26468912);
  int v149 = *(_DWORD *)&v101[4 * BYTE1(v135)];
  int v150 = v210 ^ v146 ^ (v137 + 1) ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v133)], 15) ^ v148;
  unsigned int v151 = v233 ^ __ROR4__(v149, 15) ^ *(_DWORD *)&v100[4 * v142] ^ (v143 + 1) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v133))
                                                                              - 26468912);
  unsigned int v152 = v150 ^ 0x24F5D418;
  unsigned int v153 = v234 ^ v235 ^ (*(_DWORD *)(v103 + 4 * (HIBYTE(v144) ^ 0xB2)) - 26468912) ^ __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v145) ^ 0xCF)], 15) ^ ((((v151 ^ 0x3D6F31EE) >> 16) ^ 0x1D563825)+ *(_DWORD *)&v102[4 * (((v151 ^ 0x3D6F31EE) >> 16) ^ 0xA5)]+ 1) ^ *(_DWORD *)&v100[4 * (v150 ^ 0x18)];
  int v154 = LODWORD(STACK[0x210]) ^ __ROR4__(*(_DWORD *)&v101[4 * ((unsigned __int16)(v144 ^ 0xB78) >> 8)], 15) ^ *(_DWORD *)&v100[4 * (v151 ^ 0xEE)] ^ (*(_DWORD *)&v102[4 * (((v150 ^ 0x24F5D418u) >> 16) ^ 0xA5)]+ (((v150 ^ 0x24F5D418u) >> 16) ^ 0x1D563825)+ 1) ^ (*(_DWORD *)(v103 + 4 * ((v145 ^ 0xEB79D73F) >> 24)) - 26468912);
  LODWORD(v12(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v150) ^ 0xCC)], 15);
  unsigned int v155 = LODWORD(STACK[0x200]) ^ 0x90465B80 ^ (*(_DWORD *)&v102[4
                                                              * (((v145 ^ 0xEB79D73F) >> 16) ^ 0xA5)]
                                             + (((v145 ^ 0xEB79D73F) >> 16) ^ 0x1D563825)
                                             + 1) ^ *(_DWORD *)&v100[4 * (v144 ^ 0x78)] ^ v120 ^ (*(_DWORD *)(v103 + 4 * (HIBYTE(v151) ^ 0xE0)) - 26468912);
  unsigned int v156 = *(_DWORD *)&v101[4 * ((unsigned __int16)(v151 ^ 0x31EE) >> 8)];
  unsigned int v157 = v237 ^ *(_DWORD *)&v100[4 * (v145 ^ 0x61)] ^ (v156 << 17) ^ (v156 >> 15) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v152)) - 26468912) ^ 0x41729116 ^ ((((v144 ^ 0x6F080B78) >> 16) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (((v144 ^ 0x6F080B78) >> 16) ^ 0xA5)] + 1);
  unsigned int v158 = (((2 * (v153 ^ 0xCA)) & 0x3C) - (v153 ^ 0xCA) + 3041) ^ 0xB29;
  unsigned int v159 = BYTE1(v153) ^ 0x8D;
  int v160 = LODWORD(STACK[0x22C]) ^ __ROR4__(*(_DWORD *)&v101[4* ((unsigned __int16)(LOWORD(STACK[0x200]) ^ 0x5B80 ^ (*(_WORD *)&v102[4 * (((v145 ^ 0xEB79D73F) >> 16) ^ 0xA5)] + (((v145 ^ 0xEB79D73F) >> 16) ^ 0x3825) + 1) ^ *(_WORD *)&v100[4 * (v144 ^ 0x78)] ^ v120 ^ (*(_WORD *)(v103 + 4 * (HIBYTE(v151) ^ 0xE0)) + 7632)) >> 8)], 15) ^ (*(_DWORD *)(v103 + 4 * HIBYTE(v157)) - 26468912) ^ *(_DWORD *)&v100[4 * (v154 ^ 0x16)] ^ ((BYTE2(v153) ^ 0x1D5638D9) + *(_DWORD *)&v102[4 * (BYTE2(v153) ^ 0x59)] + 1);
  unsigned int v161 = LODWORD(STACK[0x220]) ^ __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v154) ^ 0xA)], 15) ^ *(_DWORD *)&v100[4 * v157] ^ (*(_DWORD *)(v103 + 4 * (HIBYTE(v153) ^ 0xC)) - 26468912) ^ ((BYTE2(v155) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v155) ^ 0xA5)] + 1) ^ 0x30E7D799;
  int v162 = *(_DWORD *)(v103 + 4 * HIBYTE(v155));
  unsigned int v163 = LODWORD(STACK[0x21C]) ^ *(_DWORD *)&v100[4 * v155] ^ ((BYTE2(v157) ^ 0x1D563825)
                                                                              + *(_DWORD *)&v102[4
                                                                                               * (BYTE2(v157) ^ 0xA5)]
                                                                              + 1) ^ __ROR4__(*(_DWORD *)&v101[4 * v159], 15) ^ (*(_DWORD *)(v103 + 4 * ((v154 ^ 0xC28F1248) >> 24))- 26468912) ^ 0xE9ED13F5;
  LODWORD(v12(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v157)], 15);
  unsigned int v164 = (LODWORD(STACK[0x218]) + v232) ^ (v162 - 26468912) ^ ((((v154 ^ 0xC28F1248) >> 16) ^ 0x1D563825)
                                                             + *(_DWORD *)&v102[4
                                                                              * (((v154 ^ 0xC28F1248) >> 16) ^ 0xA5)]
                                                             + 1) ^ *(_DWORD *)&v100[4 * v158] ^ v120 ^ 0x201CC411;
  int v165 = *(_DWORD *)&v100[4
                        * (((LOBYTE(STACK[0x218]) + v232) ^ (v162 - 48) ^ ((((v154 ^ 0xC28F1248) >> 16) ^ 0x25)
                                                                                          + v102[4
                                                                                               * (((v154 ^ 0xC28F1248) >> 16) ^ 0xA5)]
                                                                                          + 1) ^ v100[4 * v158] ^ v120) ^ 0x11)];
  int v166 = *(_DWORD *)&v100[4 * v163];
  int v167 = *(_DWORD *)&v100[4 * v161];
  int v168 = *(_DWORD *)&v102[4 * (((v160 ^ 0x7B2B5A69u) >> 16) ^ 0xA5)]
       + (((v160 ^ 0x7B2B5A69u) >> 16) ^ 0x1D563825);
  int v169 = (BYTE2(v164) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v164) ^ 0xA5)];
  int v170 = (BYTE2(v161) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v161) ^ 0xA5)];
  LODWORD(v102) = (BYTE2(v163) ^ 0x1D563825) + *(_DWORD *)&v102[4 * (BYTE2(v163) ^ 0xA5)];
  int v171 = *(_DWORD *)&v101[4 * BYTE1(v161)];
  int v172 = *(_DWORD *)&v101[4 * BYTE1(v163)];
  int v173 = *(_DWORD *)(v103 + 4 * HIBYTE(v161));
  int v174 = *(_DWORD *)(v103 + 4 * HIBYTE(v163));
  int v175 = *(_DWORD *)(v103 + 4 * HIBYTE(v164)) - 26468912;
  unsigned int v176 = LODWORD(STACK[0x230]) ^ v107 ^ *(_DWORD *)&v100[4 * (v160 ^ 0x69)] ^ (v169 + 1) ^ __ROR4__(v172, 15) ^ (v173 - 26468912);
  int v177 = LODWORD(STACK[0x238]) ^ v107 ^ v166 ^ (v170 + 1) ^ __ROR4__(*(_DWORD *)&v101[4 * BYTE1(v164)], 15) ^ (*(_DWORD *)(v103 + 4 * ((v160 ^ 0x7B2B5A69u) >> 24)) - 26468912);
  unsigned int v178 = v177 ^ 0xD60AE74B;
  LODWORD(v102) = v231 ^ LODWORD(STACK[0x240]) ^ v167 ^ (v102 + 1) ^ v175 ^ __ROR4__(*(_DWORD *)&v101[4 * (BYTE1(v160) ^ 0x42)], 15) ^ 0xA579EC19;
  int v179 = v231 ^ LODWORD(STACK[0x23C]) ^ (v168 + 1) ^ v165 ^ __ROR4__(v171, 15);
  v180 = (char *)*(&off_5B860 + v236[0] - 289) - 4;
  LODWORD(v10(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)&v180[4 * ((v176 ^ 0x8EA04AC3) >> 16)];
  v181 = (char *)*(&off_5B860 + v236[0] - 299) - 12;
  v182 = (char *)*(&off_5B860 + v236[0] - 330) - 8;
  unsigned int v183 = *(_DWORD *)&v182[4 * (v102 >> 24)];
  int v184 = *(_DWORD *)&v180[4 * (BYTE2(v177) ^ 0x61)] ^ 0x11911584 ^ *(_DWORD *)&v181[4
                                                                                  * ((unsigned __int16)(v176 ^ 0x4AC3) >> 8)];
  uint64_t v185 = (uint64_t)*(&off_5B860 + v236[0] - 335);
  int v186 = *(_DWORD *)(v185 + 4 * v178);
  int v187 = *(_DWORD *)(v185 + 4 * (v176 ^ 0xC3u));
  unsigned int v188 = v179 ^ (v174 - 26468912) ^ 0x64C8FC67;
  int v189 = *(_DWORD *)&v180[4 * BYTE2(v188)];
  LODWORD(v18(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = *(_DWORD *)&v180[4 * BYTE2(v102)];
  int v190 = *(_DWORD *)(v185 + 4 * v188);
  LODWORD(v185) = *(_DWORD *)(v185 + 4 * v102);
  int v191 = *(_DWORD *)&v181[4 * BYTE1(v102)];
  int v192 = *(_DWORD *)&v182[4 * (HIBYTE(v176) ^ 0x72)];
  LODWORD(v102) = ((v147 ^ 0x832EF1DF) - 1766224557) ^ ((v147 ^ 0x8DB66196) - 1742660324) ^ ((v147 ^ 0xE989049)
                                                                                           + 454028485);
  int v193 = *(_DWORD *)&v182[4 * HIBYTE(v178)];
  int v194 = *(_DWORD *)&v182[4 * HIBYTE(v188)];
  LODWORD(v182) = v102 + 1998366528;
  LODWORD(v102) = *(_DWORD *)&v181[4 * BYTE1(v178)];
  unsigned int v195 = LODWORD(STACK[0x248]) ^ v107 ^ v184 ^ __ROR4__(v185, 26) ^ __ROR4__(v194, 9);
  LODWORD(v102) = LODWORD(STACK[0x208]) ^ LODWORD(STACK[0x24C]) ^ (v183 >> 9) ^ (v183 << (v184 & 0x17) << (v184 & 0x17 ^ 0x17)) ^ __ROR4__(v187, 26) ^ v189 ^ v102;
  unsigned int v196 = v182 ^ LODWORD(STACK[0x208]) ^ __ROR4__(v186, 26) ^ v180 ^ __ROR4__(v192, 9) ^ *(_DWORD *)&v181[4 * BYTE1(v188)];
  unsigned int v197 = LODWORD(STACK[0x250]) ^ v107 ^ v191 ^ v100 ^ __ROR4__(v190, 26) ^ __ROR4__(v193, 9);
  v198 = (char *)*(&off_5B860 + (v236[0] ^ 0x149)) - 4;
  LOBYTE(STACK[0x729]) = v198[BYTE2(v196) ^ 0xELL] ^ 0x88;
  v199 = (char *)*(&off_5B860 + v236[0] - 321) - 12;
  unsigned int v200 = v199[(v102 >> 24) ^ 0x39];
  LOBYTE(STACK[0x727]) = ((v200 >> 6) | (4 * v200)) ^ 0x9F;
  uint64_t v201 = (uint64_t)*(&off_5B860 + (v236[0] ^ 0x16E));
  unsigned int v202 = *(unsigned __int8 *)(v201 + (BYTE1(v196) ^ 0x79));
  LOBYTE(STACK[0x72E]) = ((v202 >> 2) | ((_BYTE)v202 << 6)) ^ 0x28;
  v203 = (char *)*(&off_5B860 + (v236[0] ^ 0x159)) - 12;
  unsigned int v204 = *(unsigned __int8 *)(v201 + (BYTE1(v195) ^ 0x3CLL));
  LOBYTE(STACK[0x72F]) = v203[v102 ^ 0x54] ^ 0xAF;
  LOBYTE(STACK[0x721]) = ((v204 >> 2) | ((_BYTE)v204 << 6)) ^ 0x28;
  unsigned int v205 = *(unsigned __int8 *)(v201 + (BYTE1(v197) ^ 0xCCLL));
  LOBYTE(STACK[0x722]) = (((((v205 >> 4) | (16 * v205)) ^ 0xD0) >> 6) | (4
                                                                                        * (((v205 >> 4) | (16 * v205)) ^ 0xD0))) ^ 0x6B;
  unsigned int v206 = v199[HIBYTE(v197) ^ 0x77];
  LOBYTE(STACK[0x725]) = ((v206 >> 6) | (4 * v206)) ^ 0x9F;
  LOBYTE(STACK[0x72D]) = v198[BYTE2(v197) ^ 0x1ALL] ^ 0x88;
  LOBYTE(STACK[0x72A]) = v203[v197 ^ 0x58] ^ 0xAF;
  unsigned int v207 = v199[HIBYTE(v196) ^ 0x23];
  LOBYTE(STACK[0x724]) = ((v207 >> 6) | (4 * v207)) ^ 0x9F;
  unsigned int v208 = *(unsigned __int8 *)(v201 + (BYTE1(v102) ^ 0x64));
  LOBYTE(STACK[0x723]) = v203[v195 ^ 0x49] ^ 0xAF;
  LOBYTE(STACK[0x726]) = ((v208 >> 2) | ((_BYTE)v208 << 6)) ^ 0x28;
  LOBYTE(STACK[0x728]) = v198[BYTE2(v102) ^ 6] ^ 0x88;
  LODWORD(v102) = v199[HIBYTE(v195) ^ 5];
  LOBYTE(STACK[0x720]) = ((v102 >> 6) | (4 * (_BYTE)v102)) ^ 0x9F;
  LOBYTE(v195) = v198[BYTE2(v195) ^ 0x98];
  LOBYTE(STACK[0x72C]) = v203[v196 ^ 0xF7] ^ 0xAF;
  LOBYTE(STACK[0x72B]) = v195 ^ 0x88;
  STACK[0x270] -= 1072;
  return (*(uint64_t (**)(uint64_t, uint64_t))(STACK[0x258] + 8 * (v236[0] ^ 0x580)))(2772955271, a40);
}

uint64_t sub_399B8(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 a8)
{
  __asm { BTI             j }
  char v12 = (a8 ^ 0x86) & (2 * (a8 & a1)) ^ a8 & a1;
  int v13 = (a8 ^ (2
                              * ((((((LODWORD(STACK[0x254]) + 29) ^ 0xDA) - 39) ^ (2 * (a8 ^ 0x82))) & (a8 ^ 0x82) ^ (2 * (a8 ^ 0x82)) & 4) & (4 * v12) ^ v12))) & 0xF ^ 0x8392157;
  return (*(uint64_t (**)(void))(STACK[0x258]
                              + 8
                              * ((31 * ((v13 | 0x5B10D) - (v13 | 0xFFFA4EF2) == 138559851)) ^ LODWORD(STACK[0x254]))))();
}

uint64_t sub_39A88@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  __asm { BTI             j }
  STACK[0x278] = v2;
  return (*(uint64_t (**)(void))(STACK[0x258]
                              + 8 * ((31 * (a1 == *(void *)(v3 + 8 * (a2 & 0x697CE233)) - 4)) ^ a2)))();
}

uint64_t sub_39AD0@<X0>(int a1@<W8>)
{
  __asm { BTI             j }
  unint64_t v7 = (void *)(v2 - 240 + v1);
  *unint64_t v7 = 0x678193CF302A0EE1;
  v7[1] = 0x5283981A247FA6DCLL;
  return (*(uint64_t (**)(void))(STACK[0x258] + 8 * a1))();
}

uint64_t sub_39B10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(STACK[0x258]
                              + 8 * ((22 * (((a42 == 0) ^ ((v42 ^ 0x35) - 82)) & 1)) ^ v42)))();
}

uint64_t sub_39B54@<X0>(int a1@<W7>, int a2@<W8>)
{
  __asm { BTI             j }
  int v6 = (v2 ^ 0xE9A0B2D4) + a1;
  char v7 = v6 & 0x97 ^ 0xD7 ^ (v6 ^ 0x26 ^ (43 * (a2 ^ 0xCC))) & (2 * (v6 & 0x97));
  char v8 = a1 ^ (2
           * ((4 * v7) & 4 ^ v7 ^ ((4 * v7) ^ 0x5C) & (((2 * (v6 ^ 0x40)) ^ 0xAC) & (v6 ^ 0x40) ^ (((a2 + 34) | 0x10)
                                                                                                 - 61) & (2 * (v6 ^ 0x40)) ^ 0x50)));
  int v9 = ((v8 & 7 ^ 0x7A2B5D3E) - (v8 & 8)) ^ 0x6B3B076A;
  int v10 = ((2 * v9) & 0x2000B03E) - v9;
  BOOL v12 = v6 == 1146667369 || v10 != 250631637;
  return (*(uint64_t (**)(void))(STACK[0x258] + 8 * ((59 * v12) ^ a2)))();
}

#error "3BEFC: call analysis failed (funcsize=2094)"

#error "3DA10: call analysis failed (funcsize=1514)"

uint64_t sub_3DA14(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  __asm { BTI             j }
  LODWORD(STACK[0x254]) = a70 ^ 0x814FF294;
  LODWORD(STACK[0x250]) = a69 ^ 0x8B20BCAB;
  LODWORD(STACK[0x248]) = a2 ^ 0x91593EDB;
  LODWORD(STACK[0x24C]) = v71 ^ 0x96BBAA7;
  return (*(uint64_t (**)(void))(STACK[0x258] + 8 * (v70 - 800)))();
}

uint64_t sub_3DA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int a41,unsigned int a42)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(STACK[0x258] + 8 * (v42 - 613)))(2772955271, a40, a3, a4, a5, a6, a7, a42);
}

uint64_t sub_3DAC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(STACK[0x258]
                                                                                                 + 8
                                                                                                 * ((539 * ((v6 ^ 0x7FBF66BD) + ((2 * v6) & 0xFF7E805A) == 2143250109)) ^ (v8 - 611))))(a1, a2, a3, a4, a5, a6, (v7 + 9));
}

uint64_t sub_3DB0C(uint64_t a1, unsigned int a2)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(STACK[0x258] + 8 * ((v2 - 272) | (26 * (a2 < 0x20)))))();
}

uint64_t sub_3DB40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  __asm { BTI             j }
  STACK[0x278] = v53 + 112;
  HIDWORD(a37) = 1743857408;
  HIDWORD(a32) = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x258] + 8 * (v54 - 213)))(a1, a2, a3, a4, a5, a6, 52, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           (a1 + a8 - 64),
           v55 - 240 + v53,
           a32,
           a5,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53);
}

uint64_t sub_3DC7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(STACK[0x258] + 8 * a3))(a1, a2, (v3 - 1197841937));
}

uint64_t sub_3DDF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x258] + 8 * ((((a3 - 99807668) > 0xFFFFFFBF) * (((v49 - 752) | 0x22) ^ 0x1F)) ^ (v49 - 146))))(a1, a2, a3, a4, a5, a6, a7, STACK[0x258], a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49);
}

uint64_t sub_3DE3C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(void, void))(a8 + 8 * ((v8 - 283) ^ (32 * (a3 == 99807604)))))(0, 0);
}

uint64_t sub_3DF34(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(void, void))(a8
                                                   + 8
                                                   * ((v8 + 438) ^ ((2 * (a3 != 99807605)) | (8 * (a3 != 99807605))))))(0, 0);
}

uint64_t sub_3E054(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(void, void))(a8 + 8 * (v8 ^ (57 * (a3 == 99807606)))))(0, 0);
}

uint64_t sub_3E16C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(void, void))(a8 + 8 * (v8 ^ 0x309 ^ (60 * (a3 == 99807607)))))(0, 0);
}

uint64_t sub_3E28C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(void, void))(a8 + 8 * (v8 ^ ((2 * (a3 != 99807608)) | (4 * (a3 != 99807608))))))(0, 0);
}

uint64_t sub_3E3A0@<X0>(int a1@<W2>, uint64_t a2@<X7>, int a3@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a2 + 8 * (a3 | (a1 != 99807609))))(128, 0);
}

uint64_t sub_3E4B0@<X0>(int a1@<W2>, uint64_t a2@<X7>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(void, void))(a2 + 8 * (a3 ^ (19 * (a1 == 99807610)))))((*(unsigned char *)(a28 + v28) ^ (43 * (((a3 + 123) | 0x18) ^ 0x2D))) ^ 0x24u, 0);
}

uint64_t sub_3E5CC@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8 * (a4 ^ (83 * (a2 != 99807611)))))(a1, 0);
}

uint64_t sub_3E6E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8
                                                    * ((254
                                                      * (((a3 == ((43 * (v8 ^ 0x27D)) ^ 0x5F2F24D)) ^ (v8 - 1)) & 1)) ^ v8)))(a1, 0);
}

uint64_t sub_3E7FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8
                                                    * ((a3 != 3 * ((((v8 + 428) | 4) + 496331551) & 0xE26A93F3 ^ 0x356)
                                                            + 99807304) ^ ((v8 + 428) | 4))))(a1, 0);
}

uint64_t sub_3E91C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8 * (((a3 != ((v8 + 780) | 0xC) + 99806513) * (v8 - 194)) ^ v8)))(a1, 0);
}

uint64_t sub_3EA1C@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8 * ((204 * (a2 == a4 + 99806514)) ^ a4)))(a1, 0);
}

uint64_t sub_3EB28(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8 * (((((v8 - 425) | 0x2F8) ^ 0x293) * (a3 != 99807616)) ^ v8)))(a1, 0);
}

uint64_t sub_3EC24@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3
                                                    + 8
                                                    * ((((83 * (a4 ^ 0x2FF) - 984699654) & 0x3AB153F1 ^ 0x2CE)
                                                      * (a2 != 99807617)) ^ a4)))(a1, 0);
}

uint64_t sub_3ED30(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * (v8 ^ (205 * (a3 != 99807618)))))(a1, 0);
}

uint64_t sub_3EE28@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8 * (a4 ^ (46 * (a2 == 99807619)))))(a1, 0);
}

uint64_t sub_3EF10(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8
                                                    * ((112
                                                      * (((a3 == 99807620) ^ (v8 - 12) ^ 0x35) & 1)) ^ v8)))(a1, 0);
}

uint64_t sub_3EFF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * ((31 * (a3 == v8 + 99807617)) ^ v8)))(a1, 0);
}

uint64_t sub_3F0E0@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3
                                                    + 8
                                                    * ((73 * (((a2 == 99807622) ^ (a4 - 127)) & 1)) | a4)))(a1, 0);
}

uint64_t sub_3F1C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8
                                                    * ((((115 * (v8 ^ 0x179) - 100) ^ (v8 - 1378394560) & 0x5228A37F)
                                                      * (a3 == 99807623)) ^ v8)))(a1, 0);
}

uint64_t sub_3F2C4@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x22C]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3
                                                    + 8
                                                    * (((((428 * (a4 ^ 0x39B) - 739) | 0x110) ^ 0x30C) * (a2 == 99807624)) ^ a4)))(a1, 0);
}

uint64_t sub_3F3AC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  int v13 = *(uint64_t (**)(uint64_t, void))(a8 + 8 * (v8 | (11 * (a3 == 99807625))));
  LODWORD(STACK[0x22C]) = 128;
  return v13(a1, 0);
}

uint64_t sub_3F47C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = 0;
  LODWORD(STACK[0x22C]) = *(unsigned __int8 *)(a33 + v34) ^ 0x15;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8
                                                    * ((58
                                                      * (((a3 == 99807626) ^ (v33 + 26) ^ 0x2F) & 1)) ^ (v33 - 230))))(a1, 0);
}

uint64_t sub_3F560@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  int v8 = *(uint64_t (**)(uint64_t, void))(a3 + 8 * ((27 * (a2 != ((43 * (a4 ^ 0x2D6)) ^ 0x5F2F2BA))) ^ a4));
  LODWORD(STACK[0x238]) = 128;
  return v8(a1, 0);
}

uint64_t sub_3F63C@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  LODWORD(STACK[0x238]) = *(unsigned __int8 *)(a29 + v29) ^ 0x91;
  return (*(uint64_t (**)(uint64_t, void))(a3
                                                    + 8
                                                    * ((29
                                                      * (((a2 == ((a4 - 201) ^ 0x5F2F14D)) ^ (a4 - 121)) & 1)) ^ a4)))(a1, 0);
}

uint64_t sub_3F718(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * (v8 ^ (465 * (a3 == 99807629)))))(a1, 0);
}

uint64_t sub_3F7E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8
                                                    * (((a3 != ((v8 + 919) ^ 0x76F) + 99806807) * (v8 - 161)) ^ (v8 + 919))))(a1, 0);
}

uint64_t sub_3F8B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x220]) = 0;
  int v13 = *(uint64_t (**)(uint64_t, void))(a8 + 8 * ((70 * (a3 == (v8 ^ 0x5F2F2B8))) ^ v8));
  LODWORD(STACK[0x230]) = 128;
  return v13(a1, 0);
}

uint64_t sub_3F988@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x220]) = 0;
  LODWORD(STACK[0x230]) = *(unsigned __int8 *)(a29 + v29) ^ 0xD9;
  return (*(uint64_t (**)(uint64_t, void))(a3
                                                    + 8
                                                    * (((73 * (((a4 + 259) | 0x101) ^ 0x33A) - 800) * (a2 == 99807632)) ^ a4)))(a1, 0);
}

uint64_t sub_3FA54(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  int v13 = *(uint64_t (**)(uint64_t, void))(a8 + 8 * ((7 * (a3 == ((v8 + 14) ^ 0x5F2F2A0))) ^ v8));
  LODWORD(STACK[0x220]) = 128;
  return v13(a1, 0);
}

uint64_t sub_3FB14(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x220]) = *(unsigned __int8 *)(a33 + v34) ^ 0x99;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8
                                                    * ((28 * (a3 == ((v33 + 466) | 0x131) + ((v33 + 155) ^ 0x5F2EEA8))) ^ v33)))(a1, 0);
}

uint64_t sub_3FBE0@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3
                                                    + 8 * ((31 * ((((a4 + 415) ^ (a2 == 99807635)) & 1) == 0)) ^ a4)))(a1, 0);
}

uint64_t sub_3FCA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * (v8 ^ ((a3 != 99807636) | (2 * (a3 != 99807636))))))(a1, 0);
}

uint64_t sub_3FD5C@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8 * (a4 ^ (19 * (a2 == 99807637)))))(a1, 0);
}

uint64_t sub_3FE08(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8
                                                    * ((242
                                                      * (((a3 == 99807638) ^ ((v8 ^ 0x64) + 33)) & 1)) ^ v8)))(a1, 0);
}

uint64_t sub_3FEBC@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  STACK[0x218] = 0;
  LODWORD(STACK[0x200]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3 + 8 * (a4 | ((a2 != 99807639) << 7))))(a1, 0);
}

uint64_t sub_3FF68(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  LODWORD(STACK[0x218]) = 0;
  LODWORD(STACK[0x200]) = 0;
  int v14 = *(uint64_t (**)(uint64_t, void))(a8
                                                  + 8
                                                  * ((95 * (((a3 == 99807640) ^ (v9 - 28)) & 1)) ^ v8));
  LODWORD(STACK[0x21C]) = 128;
  return v14(a1, 0);
}

uint64_t sub_40010(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  LODWORD(STACK[0x218]) = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x21C]) = (*(unsigned char *)(a33 + v34) ^ (27 * (v33 ^ 0xC))) ^ 0x82;
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * (v33 ^ (125 * (a3 == 99807641)))))(a1, 0);
}

uint64_t sub_400C8@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  LODWORD(STACK[0x218]) = 0;
  LODWORD(STACK[0x200]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3
                                                    + 8
                                                    * ((4
                                                      * (((a4 - 88) ^ (a2 == ((a4 + 775598222) & 0xD1C54FFF)
                                                                                            + 99806825)) & 1)) & 0xEF | (16 * (((a4 - 88) ^ (a2 == ((a4 + 775598222) & 0xD1C54FFF) + 99806825)) & 1)) | a4)))(a1, 0);
}

uint64_t sub_40180(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  STACK[0x248] = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  LODWORD(STACK[0x218]) = 0;
  LODWORD(STACK[0x200]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a8
                                                    + 8
                                                    * ((((v8 - 1358773341) & 0x50FD38F7 ^ 0xC9) * (a3 != 99807643)) ^ v8)))(a1, 0);
}

uint64_t sub_40228@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, unsigned int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  LODWORD(STACK[0x248]) = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  LODWORD(STACK[0x218]) = 0;
  LODWORD(STACK[0x200]) = 0;
  int v8 = *(uint64_t (**)(uint64_t, void))(a3
                                                 + 8
                                                 * (((a4 - 21) ^ (a2 == ((19 * (a4 ^ 0xCD)) ^ 0x5F2F2AD))) & 1 | (16 * (((a4 - 21) ^ (a2 == ((19 * (a4 ^ 0xCD)) ^ 0x5F2F2AD))) & 1)) | a4));
  LODWORD(STACK[0x24C]) = 128;
  return v8(a1, 0);
}

uint64_t sub_402D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  LODWORD(STACK[0x248]) = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  LODWORD(STACK[0x218]) = 0;
  LODWORD(STACK[0x200]) = 0;
  LODWORD(STACK[0x24C]) = *(unsigned __int8 *)(a33 + v34) ^ 0xFFFFFFD2;
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * ((2013 * (a3 != 99807645)) ^ (v33 | 0x32A))))(a1, 0);
}

uint64_t sub_40374@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X7>, int a4@<W8>)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  LODWORD(STACK[0x248]) = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  LODWORD(STACK[0x218]) = 0;
  LODWORD(STACK[0x200]) = 0;
  return (*(uint64_t (**)(uint64_t, void))(a3
                                                    + 8 * ((67 * (a2 == ((a4 - 629) | 0x31) + 99807207)) | (a4 - 735))))(a1, 0);
}

uint64_t sub_40408(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  LODWORD(STACK[0x248]) = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  LODWORD(STACK[0x218]) = 0;
  LODWORD(STACK[0x200]) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(a8
                                                     + 8
                                                     * (((((a3 == 99807647) ^ v8) & 1) * (v8 ^ 0x1E0)) ^ v8)))(a1, 128);
}

uint64_t sub_40490(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  LODWORD(STACK[0x248]) = 0;
  LODWORD(STACK[0x23C]) = 0;
  LODWORD(STACK[0x208]) = 0;
  LODWORD(STACK[0x218]) = 0;
  int v39 = *(unsigned __int8 *)(a33 + v34);
  unint64_t v40 = *(uint64_t (**)(uint64_t, void))(a8 + 8
                                                       * ((((v33 ^ 0x286) - 802) * (a3 == 99807648)) ^ v33 ^ 0x525));
  LODWORD(STACK[0x200]) = 128;
  return v40(a1, v39 ^ 0xD9u);
}

#error "405B0: call analysis failed (funcsize=32)"

#error "4064C: call analysis failed (funcsize=35)"

#error "406E4: call analysis failed (funcsize=36)"

#error "40774: call analysis failed (funcsize=34)"

#error "407F4: call analysis failed (funcsize=31)"

uint64_t sub_407F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  LODWORD(STACK[0x23C]) = (((v33 - 333516614) & 0x13E10AF7) - 20) ^ *(unsigned __int8 *)(a33 + v34);
  int v39 = *(uint64_t (**)(void))(a8 + 8 * (v33 ^ ((2 * (a3 != 99807654)) | (8 * (a3 != 99807654)))));
  LODWORD(STACK[0x248]) = 128;
  return v39();
}

uint64_t sub_40878(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  __asm { BTI             j }
  STACK[0x250] = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  LODWORD(STACK[0x248]) = *(unsigned __int8 *)(a33 + v34) ^ 0xF5;
  return (*(uint64_t (**)(void))(a8 + 8 * ((237 * (a3 != 99807655)) ^ v33)))();
}

uint64_t sub_408E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BTI             j }
  LODWORD(STACK[0x254]) = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x210]) = 0;
  int v13 = *(uint64_t (**)(void))(a8 + 8 * ((((v8 + 111) ^ 0x9B) * (a3 == 99807656)) ^ (v8 + 456)));
  LODWORD(STACK[0x250]) = 128;
  return v13();
}

uint64_t sub_4096C@<X0>(int a1@<W2>, uint64_t a2@<X7>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  __asm { BTI             j }
  LODWORD(STACK[0x254]) = 0;
  LODWORD(STACK[0x240]) = 0;
  LODWORD(STACK[0x250]) = (*(unsigned char *)(a28 + v28) ^ (a3 + 80)) ^ 0x10;
  unsigned int v33 = *(uint64_t (**)(void))(a2 + 8 * (a3 ^ (7 * (a1 == 99807657))));
  LODWORD(STACK[0x210]) = 128;
  return v33();
}

uint64_t sub_409E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  __asm { BTI             j }
  LODWORD(STACK[0x254]) = 0;
  LODWORD(STACK[0x210]) = *(unsigned __int8 *)(a33 + v34) ^ 0x15;
  int v39 = *(uint64_t (**)(void))(a8 + 8 * ((26 * (a3 == v33 + 99806591)) ^ v33));
  LODWORD(STACK[0x240]) = 128;
  return v39();
}

uint64_t sub_40A54@<X0>(int a1@<W2>, uint64_t a2@<X7>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  __asm { BTI             j }
  LODWORD(STACK[0x240]) = *(unsigned __int8 *)(a28 + v28) ^ 0x72;
  int v33 = *(uint64_t (**)(void))(a2 + 8 * (((((a3 + 166) | 0x91) ^ 0x499) * (a1 == 99807659)) ^ a3));
  LODWORD(STACK[0x254]) = 128;
  return v33();
}

uint64_t sub_40ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,unsigned int a39)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(a8 + 8 * (v39 - 718)))(a1, a2, a3, a4, a5, a6, HIBYTE(a39) ^ 0xAA);
}

uint64_t sub_40B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  __asm { BTI             j }
  LODWORD(STACK[0x240]) = *(unsigned __int8 *)(a33 + (v34 + 1));
  LODWORD(STACK[0x23C]) = *(unsigned __int8 *)(a33 + (v34 + 2));
  LODWORD(STACK[0x200]) = *(unsigned __int8 *)(a33 + (v34 + 4));
  LODWORD(STACK[0x238]) = *(unsigned __int8 *)(a33 + (v34 + 5));
  LODWORD(STACK[0x254]) = *(unsigned __int8 *)(a33 + (v34 + 7));
  LODWORD(STACK[0x208]) = *(unsigned __int8 *)(a33 + (v34 + 8));
  LODWORD(STACK[0x210]) = *(unsigned __int8 *)(a33 + (v34 + 9));
  LODWORD(STACK[0x22C]) = *(unsigned __int8 *)(a33 + (v34 + 14));
  LODWORD(STACK[0x230]) = *(unsigned __int8 *)(a33 + (v34 + 18));
  LODWORD(STACK[0x248]) = *(unsigned __int8 *)(a33 + (v34 + 19));
  int v39 = *(unsigned __int8 *)(a33 + (v34 + 40));
  int v61 = v33;
  int v40 = v34;
  unsigned int v41 = ((v39 ^ 0xFFFFFFC8) - 18) ^ ((v39 ^ 0xFFFFFFC6) - 28) ^ ((v39 ^ 0x23) + 7);
  unsigned int v42 = v41 + 47;
  unsigned int v43 = ((v41 - 81) & 0xFFFFFF9B | 0x44) ^ (v41 + 47) & 0xFFFFFFB8;
  int v44 = (61 - v39) & 0x79 ^ 0x5F;
  int v45 = (61 - v39) ^ 0x42;
  int v62 = *(unsigned __int8 *)(a33 + (v34 + 21));
  int v63 = *(unsigned __int8 *)(a33 + (v34 + 23));
  int v46 = (61 - v39) ^ v39 ^ v42 ^ (2
                                * (v43 ^ v44 ^ v45 & (2
                                                    * (v45 & (2
                                                            * (v45 & (2
                                                                    * (v45 & (2
                                                                            * (v45 & (2
                                                                                    * (((2 * ((61 - v39) & 3)) ^ 0x3A) & ((61 - v39) ^ 2) ^ v44)) ^ v44)) ^ v44)) ^ v44)) ^ v44)) ^ (v42 ^ 0x1A) & (2 * ((v42 ^ 0x1A) & (2 * ((v42 ^ 0x1A) & (2 * ((v42 ^ 0x1A) & (2 * ((v42 ^ 0x1A) & (2 * (((2 * v43) ^ 0x30) & (v42 ^ 0x1A) ^ v43)) ^ v43)) ^ v43)) ^ v43)) ^ v43))));
  int v64 = *(unsigned __int8 *)(a33 + (v34 + 27));
  int v47 = *(unsigned __int8 *)(a33 + (v34 + 29));
  int v48 = *(unsigned __int8 *)(a33 + (v34 + 36));
  int v60 = *(unsigned __int8 *)(a33 + (v34 + 43));
  int v49 = *(unsigned __int8 *)(a33 + (v34 + 44));
  LODWORD(STACK[0x24C]) = (((v46 ^ 0xFFFFFF8B) - 38) ^ ((v46 ^ 0x53) + 2) ^ ((v46 ^ 0xFFFFFF82) - 47)) - 55;
  int v50 = *(unsigned __int8 *)(a33 + (v34 + 45));
  int v51 = *(unsigned __int8 *)(a33 + (v34 + 47));
  int v52 = *(unsigned __int8 *)(a33 + (v34 + 49));
  int v53 = *(unsigned __int8 *)(a33 + (v34 + 50));
  int v54 = *(unsigned __int8 *)(a33 + (v34 + 52));
  int v55 = *(unsigned __int8 *)(a33 + (v34 + 53));
  int v56 = *(unsigned __int8 *)(a33 + (v34 + 54));
  int v57 = *(unsigned __int8 *)(a33 + (v40 + 55));
  LODWORD(STACK[0x220]) = v47 ^ 0x99;
  LODWORD(STACK[0x250]) = v54 ^ 0x21;
  LODWORD(STACK[0x21C]) = v48 ^ 0x21;
  LODWORD(STACK[0x254]) = v57 ^ 0x91;
  LODWORD(STACK[0x248]) = v53 ^ 0xF5;
  LODWORD(STACK[0x218]) = v50 ^ 0x99;
  LODWORD(STACK[0x23C]) = v52 ^ 0x5E;
  LODWORD(STACK[0x230]) = v64 ^ 0xD9;
  LODWORD(STACK[0x210]) = v55 ^ 0x15;
  LODWORD(STACK[0x200]) = v49 ^ 0xCE;
  LODWORD(STACK[0x208]) = v51 ^ 0xC6;
  LODWORD(STACK[0x240]) = v56 ^ 0x72;
  uint64_t v58 = LODWORD(STACK[0x238]) ^ 0x15u;
  LODWORD(STACK[0x238]) = v63 ^ 0x91;
  LODWORD(STACK[0x22C]) = v62 ^ 0x15;
  return (*(uint64_t (**)(uint64_t, void))(a8 + 8 * v61))(v58, v60 ^ 0xD9u);
}

uint64_t sub_41244(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  __asm { BTI             j }
  HIDWORD(a47) = v55;
  LODWORD(a48) = v57;
  HIDWORD(a5(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = a4;
  HIDWORD(a53) = v54;
  LODWORD(a52) = v56;
  HIDWORD(a43) = a7;
  return (*(uint64_t (**)(uint64_t, void, void, void, uint64_t, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a8 + 8 * v59))(a1, a44, HIDWORD(a44), a42, a5, HIDWORD(a48), a46, a50, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           __PAIR64__(v58, a6),
           a50,
           a51,
           a52,
           a53,
           a54);
}

#error "412BC: too big function (funcsize=0)"

uint64_t sub_52F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,unsigned int a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58,int a59,int a60,int a61,int a62,unsigned int a63)
{
  __asm { BTI             j }
  unsigned int v73 = bswap32(a58 ^ 0xBD5EF5D7);
  *(_WORD *)a31 = v73;
  unsigned int v74 = bswap32(a61 ^ 0xD245B3D9);
  *(unsigned char *)(a31 + 8) = v74;
  unsigned int v75 = bswap32(a60 ^ 0x21157291);
  *(unsigned char *)(a31 + 4) = v75;
  *(unsigned char *)(a31 + 2) = BYTE2(v73);
  *(unsigned char *)(a31 + 7) = HIBYTE(v75);
  *(unsigned char *)(a31 + 3) = v73 >> ((v67 ^ 0x14) - 48);
  *(unsigned char *)(a31 + 9) = BYTE1(v74);
  *(unsigned char *)(a31 + 5) = BYTE1(v75);
  unsigned int v76 = bswap32(v68 ^ 0xBD5EF5D7);
  *(unsigned char *)(a31 + 16) = v76;
  *(unsigned char *)(a31 + 6) = BYTE2(v75);
  unsigned int v77 = bswap32(a62 ^ 0xCE99B8C6);
  *(unsigned char *)(a31 + 1(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = BYTE2(v74);
  *(unsigned char *)(a31 + 12) = v77;
  unsigned int v78 = HIBYTE(v76);
  unsigned int v79 = bswap32(a63 ^ 0x21157291);
  *(unsigned char *)(a31 + 11) = HIBYTE(v74);
  *(unsigned char *)(a31 + 14) = BYTE2(v77);
  *(unsigned char *)(a31 + 2(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = v79;
  *(unsigned char *)(a31 + 15) = HIBYTE(v77);
  *(unsigned char *)(a31 + 17) = BYTE1(v76);
  unsigned int v80 = bswap32(a64 ^ 0xD245B3D9);
  *(unsigned char *)(a31 + 13) = BYTE1(v77);
  *(unsigned char *)(a31 + 18) = v66 ^ a7;
  *(unsigned char *)(a31 + 24) = v80;
  unsigned int v81 = bswap32(a66 ^ 0xCE99B8C6);
  *(unsigned char *)(a31 + 21) = BYTE1(v79);
  *(unsigned char *)(a31 + 19) = v78;
  *(unsigned char *)(a31 + 25) = BYTE1(v80);
  *(unsigned char *)(a31 + 29) = BYTE1(v81);
  *(unsigned char *)(a31 + 22) = BYTE2(v79);
  *(unsigned char *)(a31 + 23) = HIBYTE(v79);
  *(unsigned char *)(a31 + 28) = v81;
  *(unsigned char *)(a31 + 27) = HIBYTE(v80);
  *(unsigned char *)(a31 + 31) = HIBYTE(v81);
  *(unsigned char *)(a31 + 3(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = BYTE2(v81);
  *(unsigned char *)(a31 + 26) = BYTE2(v80);
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(STACK[0x258] + 8 * v67))(v81 >> 8, a31, 3466180806, a63, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a31,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53);
}

uint64_t sub_53148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57,int a58,int a59,int a60,int a61,int a62,int a63)
{
  __asm { BTI             j }
  LOBYTE(STACK[0x700]) = (a56 ^ 0x8A20C157) >> 24;
  LOBYTE(STACK[0x709]) = (a59 ^ 0x2AD5247u) >> 16;
  LOBYTE(STACK[0x702]) = (unsigned __int16)(a56 ^ 0xC157) >> 8;
  LOBYTE(STACK[0x704]) = (a58 ^ 0xD71E6FC3) >> 24;
  LOBYTE(STACK[0x703]) = a56 ^ 0x57;
  LOBYTE(STACK[0x701]) = (a56 ^ 0x8A20C157) >> 16;
  LOBYTE(STACK[0x706]) = (unsigned __int16)(a58 ^ 0x6FC3) >> 8;
  LOBYTE(STACK[0x70A]) = (unsigned __int16)(a59 ^ 0x5247) >> 8;
  LOBYTE(STACK[0x70E]) = (unsigned __int16)(a60 ^ 0x82DA) >> 8;
  LOBYTE(STACK[0x70D]) = (a60 ^ 0x19A582DAu) >> 16;
  LOBYTE(STACK[0x707]) = a58 ^ 0xC3;
  LOBYTE(STACK[0x705]) = (a58 ^ 0xD71E6FC3) >> 16;
  LOBYTE(STACK[0x70F]) = a60 ^ 0xDA;
  LOBYTE(STACK[0x70C]) = (a60 ^ 0x19A582DAu) >> 24;
  LOBYTE(STACK[0x70B]) = a59 ^ 0x47;
  LOBYTE(STACK[0x708]) = (a59 ^ 0x2AD5247u) >> 24;
  LOBYTE(STACK[0x712]) = v64;
  LOBYTE(STACK[0x710]) = HIBYTE(a6);
  LOBYTE(STACK[0x71A]) = (unsigned __int16)(a62 ^ 0x5247) >> 8;
  LOBYTE(STACK[0x713]) = a6;
  LOBYTE(STACK[0x711]) = BYTE2(a6);
  LOBYTE(STACK[0x719]) = (a62 ^ 0x2AD5247u) >> 16;
  LOBYTE(STACK[0x71B]) = a62 ^ 0x47;
  LOBYTE(STACK[0x718]) = (a62 ^ 0x2AD5247u) >> 24;
  LOBYTE(STACK[0x716]) = (unsigned __int16)(a61 ^ 0x6FC3) >> 8;
  LOBYTE(STACK[0x714]) = (a61 ^ 0xD71E6FC3) >> 24;
  LOBYTE(STACK[0x717]) = a61 ^ 0xC3;
  LOBYTE(STACK[0x715]) = (a61 ^ 0xD71E6FC3) >> 16;
  LOBYTE(STACK[0x71E]) = (unsigned __int16)(a64 ^ 0x82DA) >> 8;
  LOBYTE(STACK[0x71F]) = a64 ^ 0xDA;
  LOBYTE(STACK[0x71D]) = (a64 ^ 0x19A582DAu) >> 16;
  LOBYTE(STACK[0x71C]) = (a64 ^ 0x19A582DAu) >> 24;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(STACK[0x258]
                                                                                                 + 8 * (a36 ^ 0x62)))(a1, a2, a3, a4, 1159774049, a5, (v65 + 3812));
}

uint64_t sub_532B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(STACK[0x258] + 8 * (v5 + 145)))(4291690430, 51, 784, 816, (a5 - 148));
}

uint64_t sub_53304@<X0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  __asm { BTI             j }
  uint64_t v40 = (a3 + a25) & 0xF;
  int v41 = (((a3 & 0xF) * v29) ^ *(unsigned __int8 *)(v25 + a3) ^ *(unsigned __int8 *)(*(void *)(v35 + 8 * (v33 ^ v26)) + (a3 & 0xF)) ^ *(unsigned __int8 *)(*(void *)(v35 + 8 * (v33 - 796)) + ((v33 + 145) ^ v27) + (a3 & 0xF) - 8) ^ *(unsigned __int8 *)((a3 & 0xF) + *(void *)(v35 + 8 * (v33 ^ v28)) + 3))
      - (*(unsigned __int8 *)(v34 + a3 + a25) ^ (v40 * v32) ^ *(unsigned __int8 *)(*(void *)(v35 + 8 * (v33 - 815))
                                                                                                  + v40) ^ *(unsigned __int8 *)(*(void *)(v35 + 8 * (v33 ^ v30)) + v40 - 3) ^ *(unsigned __int8 *)(*(void *)(v35 + 8 * (v33 ^ v31)) + v40 - 7));
  return (*(uint64_t (**)(void))(STACK[0x258]
                              + 8 * ((((a1 & (2 * v41)) + (v41 ^ 0xFFE6FFDF) == -1638433) * a2) ^ (v33 - 473))))();
}

uint64_t sub_533F4@<X0>(unsigned int a1@<W2>, unint64_t a2@<X3>, int a3@<W5>, uint64_t a4@<X8>)
{
  __asm { BTI             j }
  return (*(uint64_t (**)(void))(STACK[0x258]
                              + 8 * (int)(((((a3 - 929) ^ a1 ^ a2) + a4 == 32) * (((a3 - 929) | a1) - 813)) | a3)))();
}

void sub_53434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  __asm { BTI             j }
  *(_DWORD *)(v7 + 4) = a7;
}

uint64_t vchs9e72gvima(uint64_t result, unsigned int *a2, void *a3, void *a4, _DWORD *a5)
{
  unint64_t v5 = (unint64_t)&v17[12] + qword_540D0 - qword_540C8;
  qword_540C8 = 1088994703 * v5 + 0x433A31CA1FE16B89;
  qword_540D0 = 1088994703 * (v5 ^ 0xBCC5CE35E01E9477);
  uint64_t v7 = (void (**)(void))((char *)*(&off_5B860
                                              + ((-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77)) ^ byte_5FA0[byte_3760[(-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77))] ^ 0x3A])
                                              - 127)
                                    - 4);
  switch((int)result)
  {
    case 'd':
      __asm { BTI             j; jumptable 0000000000053574 case 100 }
      v17[0] = *(void *)((char *)*(&off_5B860
                                   + ((-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77)) ^ byte_5FA0[byte_3760[(-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77))] ^ 0x3A])
                                   - 127)
                         + 4);
      HIDWORD(v18) = (31937209 * (&v18 ^ 0x2A49EFEE)) ^ 0xCBF0790A;
      uint64_t v19 = v17;
      ((void (**)(unsigned int **))v7)[1296](&v18);
      *a5 = 205258752;
      __asm { BRAA            X8, X17 }
      return result;
    case 'e':
      __asm { BTI             j; jumptable 0000000000053574 case 101 }
      HIDWORD(v2(*(void (**)(ASIOKitUserClient *, void))(*(void *)this + 752))(this, 0) = 936204631
                   * ((1241135157 - (&v18 | 0x49FA3835) + (&v18 | 0xB605C7CA)) ^ 0x306CA88)
                   + 340;
      unsigned int v18 = a2;
      uint64_t v19 = a3;
      ((void (**)(unsigned int **))v7)[1317](&v18);
      *a5 = v20 - 2028803494;
      __asm { BRAA            X8, X17 }
      return result;
    case 'f':
      __asm { BTI             j; jumptable 0000000000053574 case 102 }
      BOOL v12 = v7[(53
              * ((*(uint64_t (**)(uint64_t, uint64_t))((char *)*(&off_5B860
                                                                       + ((-113
                                                                                          * ((qword_540D0
                                                                                            - (-113 * v5
                                                                                             - 119)) ^ 0x77)) ^ byte_5FA0[byte_3760[(-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77))] ^ 0x3A])
                                                                       - 127)
                                                             + 10500))(((*a2 + 7) & 0x1FFFFFFF8) + 16, 8) == 0)) ^ 0x308];
      __asm { BRAA            X9, X17 }
      return result;
    case 'g':
      __asm
      {
        BTI             j; jumptable 0000000000053574 case 103
        BRAA            X9, X17
      }
      return result;
    case 'h':
      __asm { BTI             j; jumptable 0000000000053574 case 104 }
      uint64_t v13 = *(void *)((char *)*(&off_5B860
                                + ((-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77)) ^ byte_5FA0[byte_3760[(-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77))] ^ 0x3A])
                                - 127)
                      + 332);
      unint64_t v14 = 170026309
          * ((((unint64_t)&v18 | 0xCA00EC6DC9F2B336) - ((unint64_t)&v18 & 0xCA00EC6DC9F2B336)) ^ 0x5E31568A7B7F0DC9);
      unsigned int v18 = a2;
      uint64_t v19 = a4;
      uint64_t v20 = a3;
      uint64_t v21 = v13 - v14;
      int v22 = v14 ^ 0x5F32CDED;
      ((void (**)(unsigned int **))v7)[1298](&v18);
      *a5 = v23 - 590960548;
      __asm { BRAA            X8, X17 }
      return result;
    case 'i':
      __asm { BTI             j; jumptable 0000000000053574 case 105 }
      v17[0] = *(void *)((char *)*(&off_5B860
                                   + ((-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77)) ^ byte_5FA0[byte_3760[(-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77))] ^ 0x3A])
                                   - 127)
                         + 444);
      v17[1] = a2;
      v17[3] = a3;
      HIDWORD(v18) = (31937209 * ((2 * (&v18 & 0x66C03F0) - &v18 + 2039741449) ^ 0x53DA13E7)) ^ 0xCBF0790A;
      uint64_t v19 = v17;
      ((void (**)(unsigned int **))v7)[1296](&v18);
      *a5 = v18 - 1077848214;
      __asm { BRAA            X8, X17 }
      return result;
    case 'l':
      __asm { BTI             j; jumptable 0000000000053574 case 108 }
      uint64_t v15 = *(void *)((char *)*(&off_5B860
                                + ((-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77)) ^ byte_5FA0[byte_3760[(-113 * ((qword_540D0 - (-113 * v5 - 119)) ^ 0x77))] ^ 0x3A])
                                - 127)
                      + 492);
      unint64_t v16 = 170026309
          * ((((unint64_t)&v18 | 0xBC0129691C799CE8) - ((unint64_t)&v18 & 0xBC0129691C799CE8)) ^ 0x2830938EAEF42217);
      int v22 = v16 ^ 0x5F32CDED;
      uint64_t v20 = a3;
      uint64_t v21 = v15 - v16;
      unsigned int v18 = a2;
      uint64_t v19 = a4;
      ((void (**)(unsigned int **))v7)[1298](&v18);
      *a5 = v23 - 1159773901;
      __asm { BRAA            X8, X17 }
      return result;
    default:
      __asm { BTI             j; jumptable 0000000000053574 default case, cases 106,107 }
      return result;
  }
}

char *sub_53A3C(char *result, char *a2, unint64_t a3)
{
  if (((a2 ^ result) & 7) == 0)
  {
    unint64_t v4 = -(int)result & 7;
    switch((int)v4)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        goto LABEL_9;
      case 4:
        goto LABEL_8;
      case 5:
        goto LABEL_7;
      case 6:
        goto LABEL_6;
      case 7:
        __asm { BTI             j; jumptable 0000000000053AB8 case 7 }
        char v9 = *result++;
        *a2++ = v9;
LABEL_6:
        __asm { BTI             j; jumptable 0000000000053AB8 case 6 }
        char v10 = *result++;
        *a2++ = v10;
LABEL_7:
        __asm { BTI             j; jumptable 0000000000053AB8 case 5 }
        char v11 = *result++;
        *a2++ = v11;
LABEL_8:
        __asm { BTI             j; jumptable 0000000000053AB8 case 4 }
        char v12 = *result++;
        *a2++ = v12;
LABEL_9:
        __asm { BTI             j; jumptable 0000000000053AB8 case 3 }
        char v13 = *result++;
        *a2++ = v13;
LABEL_10:
        __asm { BTI             j; jumptable 0000000000053AB8 case 2 }
        char v14 = *result++;
        *a2++ = v14;
LABEL_11:
        __asm { BTI             j; jumptable 0000000000053AB8 case 1 }
        char v15 = *result++;
        *a2++ = v15;
        break;
      default:
        break;
    }
    _CF = a3 >= v4;
    unint64_t v16 = a3 - v4;
    if (!_CF) {
      unint64_t v16 = 0;
    }
    if (v16 >= 8)
    {
      unint64_t v17 = ((v16 >> 3) + 7) >> 3;
      switch((v16 >> 3) & 7)
      {
        case 0uLL:
          goto LABEL_25;
        case 1uLL:
          goto LABEL_32;
        case 2uLL:
          goto LABEL_31;
        case 3uLL:
          goto LABEL_30;
        case 4uLL:
          goto LABEL_29;
        case 5uLL:
          goto LABEL_28;
        case 6uLL:
          goto LABEL_27;
        case 7uLL:
          while (1)
          {
            __asm { BTI             j; jumptable 0000000000053B54 case 7 }
            uint64_t v27 = *(void *)result;
            result += 8;
            *(void *)a2 = v27;
            a2 += 8;
LABEL_27:
            __asm { BTI             j; jumptable 0000000000053B54 case 6 }
            uint64_t v28 = *(void *)result;
            result += 8;
            *(void *)a2 = v28;
            a2 += 8;
LABEL_28:
            __asm { BTI             j; jumptable 0000000000053B54 case 5 }
            uint64_t v29 = *(void *)result;
            result += 8;
            *(void *)a2 = v29;
            a2 += 8;
LABEL_29:
            __asm { BTI             j; jumptable 0000000000053B54 case 4 }
            uint64_t v30 = *(void *)result;
            result += 8;
            *(void *)a2 = v30;
            a2 += 8;
LABEL_30:
            __asm { BTI             j; jumptable 0000000000053B54 case 3 }
            uint64_t v31 = *(void *)result;
            result += 8;
            *(void *)a2 = v31;
            a2 += 8;
LABEL_31:
            __asm { BTI             j; jumptable 0000000000053B54 case 2 }
            uint64_t v32 = *(void *)result;
            result += 8;
            *(void *)a2 = v32;
            a2 += 8;
LABEL_32:
            __asm { BTI             j; jumptable 0000000000053B54 case 1 }
            uint64_t v33 = *(void *)result;
            result += 8;
            *(void *)a2 = v33;
            a2 += 8;
            if (!--v17) {
              break;
            }
LABEL_25:
            __asm { BTI             j; jumptable 0000000000053B54 case 0 }
            uint64_t v26 = *(void *)result;
            result += 8;
            *(void *)a2 = v26;
            a2 += 8;
          }
          break;
        default:
LABEL_41:
          __break(1u);
          JUMPOUT(0x53CB8);
      }
    }
    switch(v16 & 7)
    {
      case 0uLL:
        goto LABEL_24;
      case 1uLL:
        goto LABEL_40;
      case 2uLL:
        goto LABEL_39;
      case 3uLL:
        goto LABEL_38;
      case 4uLL:
        goto LABEL_37;
      case 5uLL:
        goto LABEL_36;
      case 6uLL:
        goto LABEL_35;
      case 7uLL:
        __asm { BTI             j; jumptable 0000000000053C58 case 7 }
        char v34 = *result++;
        *a2++ = v34;
LABEL_35:
        __asm { BTI             j; jumptable 0000000000053C58 case 6 }
        char v35 = *result++;
        *a2++ = v35;
LABEL_36:
        __asm { BTI             j; jumptable 0000000000053C58 case 5 }
        char v36 = *result++;
        *a2++ = v36;
LABEL_37:
        __asm { BTI             j; jumptable 0000000000053C58 case 4 }
        char v37 = *result++;
        *a2++ = v37;
LABEL_38:
        __asm { BTI             j; jumptable 0000000000053C58 case 3 }
        char v38 = *result++;
        *a2++ = v38;
LABEL_39:
        __asm { BTI             j; jumptable 0000000000053C58 case 2 }
        char v39 = *result++;
        *a2++ = v39;
LABEL_40:
        __asm { BTI             j; jumptable 0000000000053C58 case 1 }
        *a2 = *result;
        return result;
      default:
        goto LABEL_41;
    }
  }
  if ((a3 + 7) >= 8)
  {
    unsigned int v3 = (a3 + 7) >> 3;
    switch(a3 & 7)
    {
      case 0uLL:
        goto LABEL_16;
      case 1uLL:
        goto LABEL_23;
      case 2uLL:
        goto LABEL_22;
      case 3uLL:
        goto LABEL_21;
      case 4uLL:
        goto LABEL_20;
      case 5uLL:
        goto LABEL_19;
      case 6uLL:
        goto LABEL_18;
      case 7uLL:
        while (1)
        {
          __asm { BTI             j; jumptable 0000000000053A84 case 7 }
          char v19 = *result++;
          *a2++ = v19;
LABEL_18:
          __asm { BTI             j; jumptable 0000000000053A84 case 6 }
          char v20 = *result++;
          *a2++ = v20;
LABEL_19:
          __asm { BTI             j; jumptable 0000000000053A84 case 5 }
          char v21 = *result++;
          *a2++ = v21;
LABEL_20:
          __asm { BTI             j; jumptable 0000000000053A84 case 4 }
          char v22 = *result++;
          *a2++ = v22;
LABEL_21:
          __asm { BTI             j; jumptable 0000000000053A84 case 3 }
          char v23 = *result++;
          *a2++ = v23;
LABEL_22:
          __asm { BTI             j; jumptable 0000000000053A84 case 2 }
          char v24 = *result++;
          *a2++ = v24;
LABEL_23:
          __asm { BTI             j; jumptable 0000000000053A84 case 1 }
          char v25 = *result++;
          *a2++ = v25;
          if (!--v3) {
            break;
          }
LABEL_16:
          __asm { BTI             j; jumptable 0000000000053A84 case 0 }
          char v18 = *result++;
          *a2++ = v18;
        }
        break;
      default:
        goto LABEL_41;
    }
  }
LABEL_24:
  __asm { BTI             j; jumptable 0000000000053C58 case 0 }
  return result;
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
  return aComAppleAsioki;
}

const char *OSKextGetCurrentVersionString(void)
{
  return (const char *)&unk_54050;
}

OSKextLoadTag OSKextGetCurrentLoadTag(void)
{
  return dword_5400C;
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

uint32_t PE_i_can_has_debugger(uint32_t *a1)
{
  return _PE_i_can_has_debugger(a1);
}

OSMetaClass *__cdecl OSMetaClass::OSMetaClass(OSMetaClass *this, const char *className, const OSMetaClass *superclass, unsigned int classSize)
{
  return OSMetaClass::OSMetaClass(this, className, superclass, classSize);
}

void OSMetaClass::~OSMetaClass(OSMetaClass *this)
{
}

OSObject *__cdecl IOUserClient::copyClientEntitlement(task_t task, const char *entitlement)
{
  return IOUserClient::copyClientEntitlement(task, entitlement);
}

IOUserClient *__cdecl IOUserClient::IOUserClient(IOUserClient *this, const OSMetaClass *a2)
{
  return IOUserClient::IOUserClient(this, a2);
}

void IOUserClient::~IOUserClient(IOUserClient *this)
{
}

IOCommandGate *__cdecl IOCommandGate::commandGate(OSObject *owner, IOCommandGate::Action action)
{
  return IOCommandGate::commandGate(owner, action);
}

BOOL IOPMPowerSource::isCharging(IOPMPowerSource *this)
{
  return IOPMPowerSource::isCharging(this);
}

unsigned int IOPMPowerSource::capacityPercentRemaining(IOPMPowerSource *this)
{
  return IOPMPowerSource::capacityPercentRemaining(this);
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(const OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  return OSMetaClassBase::safeMetaCast(anObject, toMeta);
}

OSData *__cdecl OSData::withCapacity(unsigned int capacity)
{
  return OSData::withCapacity(capacity);
}

OSData *__cdecl OSData::withBytesNoCopy(void *bytes, unsigned int numBytes)
{
  return OSData::withBytesNoCopy(bytes, numBytes);
}

OSData *__cdecl OSData::withBytes(const void *bytes, unsigned int numBytes)
{
  return OSData::withBytes(bytes, numBytes);
}

OSArray *__cdecl OSArray::withCapacity(unsigned int capacity)
{
  return OSArray::withCapacity(capacity);
}

OSString *__cdecl OSString::withCString(const char *cString)
{
  return OSString::withCString(cString);
}

OSDictionary *__cdecl IOService::serviceMatching(const char *className, OSDictionary *table)
{
  return IOService::serviceMatching(className, table);
}

IOService *__cdecl IOService::copyMatchingService(OSDictionary *matching)
{
  return IOService::copyMatchingService(matching);
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

BOOL IOService::isInactive(const IOService *this)
{
  return IOService::isInactive(this);
}

uint64_t developer_mode_state()
{
  return _developer_mode_state();
}

BOOL kern_config_is_development(void)
{
  return _kern_config_is_development();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void microtime(timeval *tv)
{
}

void read_random(void *buffer, u_int numBytes)
{
}