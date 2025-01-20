BOOL CADeprecated::CAMutex::Lock(CADeprecated::CAMutex *this)
{
  _opaque_pthread_t *v2;
  int v3;
  int v4;
  int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD *exception;

  v2 = pthread_self();
  v3 = pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)this + 2, memory_order_acquire));
  if (!v3)
  {
    v4 = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
    if (v4)
    {
      v6 = v4;
      v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v7) {
        sub_190A8(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = v6;
    }
    atomic_store((unint64_t)v2, (unint64_t *)this + 2);
  }
  return v3 == 0;
}

void CADeprecated::CAMutex::Unlock(CADeprecated::CAMutex *this)
{
  v2 = pthread_self();
  if (pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)this + 2, memory_order_acquire)))
  {
    atomic_store(0, (unint64_t *)this + 2);
    int v3 = pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 24));
    if (v3)
    {
      int v4 = v3;
      BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v5) {
        sub_190E4(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = v4;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own", v14, 2u);
  }
}

void BorealisOwl_IOKitObject::BorealisOwl_IOKitObject(BorealisOwl_IOKitObject *this)
{
  *(void *)&this->var1 = 0;
  this->var3.var0 = 0;
  this->var0 = (void **)off_247F0;
  *(_WORD *)&this->var3.var1 = 257;
  *(_WORD *)&this->var4 = 257;
}

{
  *(void *)&this->var1 = 0;
  this->var3.var0 = 0;
  this->var0 = (void **)off_247F0;
  *(_WORD *)&this->var3.var1 = 257;
  *(_WORD *)&this->var4 = 257;
}

void BorealisOwl_IOKitObject::BorealisOwl_IOKitObject(BorealisOwl_IOKitObject *this, unsigned int a2)
{
  this->var0 = (void **)off_247F0;
  this->var1 = a2;
  this->var2 = 0;
  this->var3.var0 = 0;
  *(_WORD *)&this->var3.var1 = 257;
  *(_WORD *)&this->var4 = 257;
}

{
  this->var0 = (void **)off_247F0;
  this->var1 = a2;
  this->var2 = 0;
  this->var3.var0 = 0;
  *(_WORD *)&this->var3.var1 = 257;
  *(_WORD *)&this->var4 = 257;
}

void BorealisOwl_IOKitObject::BorealisOwl_IOKitObject(BorealisOwl_IOKitObject *this, const __CFDictionary *a2)
{
  this->var0 = (void **)off_247F0;
  *(void *)&this->var1 = 0;
  this->var3.var0 = a2;
  *(_WORD *)&this->var3.var1 = 1;
  *(_WORD *)&this->var4 = 1;
}

{
  this->var0 = (void **)off_247F0;
  *(void *)&this->var1 = 0;
  this->var3.var0 = a2;
  *(_WORD *)&this->var3.var1 = 1;
  *(_WORD *)&this->var4 = 1;
}

void BorealisOwl_IOKitObject::BorealisOwl_IOKitObject(BorealisOwl_IOKitObject *this, const BorealisOwl_IOKitObject *a2)
{
  int v4 = (void **)off_247F0;
  this->var0 = (void **)off_247F0;
  this->BOOL var1 = a2->var1;
  this->var2 = 0;
  var0 = a2->var3.var0;
  this->var3.var0 = var0;
  BOOL var1 = a2->var3.var1;
  this->var3.BOOL var1 = var1;
  this->var3.var2 = a2->var3.var2;
  if (var1 && var0)
  {
    CFRetain(var0);
    int v4 = this->var0;
  }
  *(_WORD *)&this->var4 = *(_WORD *)&a2->var4;
  ((void (*)(BorealisOwl_IOKitObject *))v4[4])(this);
}

void sub_2724(_Unwind_Exception *a1)
{
  sub_4A8C(v1);
  _Unwind_Resume(a1);
}

uint64_t BorealisOwl_IOKitObject::operator=(uint64_t a1, int a2)
{
  io_connect_t v4 = *(_DWORD *)(a1 + 12);
  if (v4)
  {
    IOServiceClose(v4);
    *(_DWORD *)(a1 + 12) = 0;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  *(_DWORD *)(a1 + 8) = a2;
  *(unsigned char *)(a1 + 33) = 1;
  return a1;
}

uint64_t BorealisOwl_IOKitObject::CloseConnection(BorealisOwl_IOKitObject *this)
{
  uint64_t result = this->var2;
  if (result)
  {
    uint64_t result = IOServiceClose(result);
    this->var2 = 0;
  }
  return result;
}

uint64_t BorealisOwl_IOKitObject::operator=(uint64_t a1, uint64_t a2)
{
  io_connect_t v4 = *(_DWORD *)(a1 + 12);
  if (v4)
  {
    IOServiceClose(v4);
    *(_DWORD *)(a1 + 12) = 0;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  sub_2888(a1 + 16, a2 + 16);
  BOOL v5 = *(const void **)(a1 + 16);
  if (v5) {
    CFRelease(v5);
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 32))(a1);
  return a1;
}

uint64_t sub_2888(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
    io_connect_t v4 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v4);
    }
  }
  BOOL v5 = *(const void **)a2;
  *(void *)a1 = *(void *)a2;
  int v6 = *(unsigned __int8 *)(a2 + 8);
  *(unsigned char *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    CFRetain(v5);
  }
  return a1;
}

void BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(BorealisOwl_IOKitObject *this)
{
  var0 = (void **)off_247F0;
  this->var0 = (void **)off_247F0;
  io_connect_t var2 = this->var2;
  if (var2)
  {
    IOServiceClose(var2);
    this->io_connect_t var2 = 0;
    var0 = this->var0;
  }
  ((void (*)(BorealisOwl_IOKitObject *))var0[5])(this);
  sub_4A8C((uint64_t)&this->var3);
}

{
  uint64_t vars8;

  BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(this);

  operator delete();
}

void sub_2970(void *a1)
{
}

uint64_t BorealisOwl_IOKitObject::GetObject(BorealisOwl_IOKitObject *this)
{
  return this->var1;
}

uint64_t BorealisOwl_IOKitObject::CopyObject(BorealisOwl_IOKitObject *this)
{
  return this->var1;
}

BOOL BorealisOwl_IOKitObject::IsValid(BorealisOwl_IOKitObject *this)
{
  return this->var1 != 0;
}

BOOL BorealisOwl_IOKitObject::IsEqualTo(BorealisOwl_IOKitObject *this, io_object_t a2)
{
  return IOObjectIsEqualTo(this->var1, a2) != 0;
}

BOOL BorealisOwl_IOKitObject::ConformsTo(BorealisOwl_IOKitObject *this, const char *a2)
{
  return IOObjectConformsTo(this->var1, a2) != 0;
}

BOOL BorealisOwl_IOKitObject::IsServiceAlive(BorealisOwl_IOKitObject *this)
{
  return this->var5;
}

BorealisOwl_IOKitObject *BorealisOwl_IOKitObject::ServiceWasTerminated(BorealisOwl_IOKitObject *this)
{
  this->var5 = 0;
  return this;
}

BorealisOwl_IOKitObject *BorealisOwl_IOKitObject::TestForLiveness(BorealisOwl_IOKitObject *this)
{
  kern_return_t v1;
  CFMutableDictionaryRef properties;

  if (this)
  {
    properties = 0;
    uint64_t v1 = IORegistryEntryCreateCFProperties((io_registry_entry_t)this, &properties, 0, 0);
    if (properties) {
      CFRelease(properties);
    }
    return (BorealisOwl_IOKitObject *)(v1 == 0);
  }
  return this;
}

__CFDictionary *BorealisOwl_IOKitObject::CopyProperties(BorealisOwl_IOKitObject *this)
{
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);
  uint64_t result = this->var3.var0;
  if (result)
  {
    CFRetain(result);
    return this->var3.var0;
  }
  return result;
}

BOOL BorealisOwl_IOKitObject::HasProperty(BorealisOwl_IOKitObject *this, const __CFString *a2)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::HasKey(p_var3, a2);
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_BOOL(BorealisOwl_IOKitObject *this, const __CFString *a2, BOOL *a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::GetBool(p_var3, a2, a3);
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_SInt32(BorealisOwl_IOKitObject *this, const __CFString *a2, int *a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::GetSInt32(p_var3, a2, a3);
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_UInt32(BorealisOwl_IOKitObject *this, const __CFString *a2, unsigned int *a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::GetUInt32(p_var3, a2, a3);
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_UInt64(BorealisOwl_IOKitObject *this, const __CFString *a2, unint64_t *a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::GetUInt64(p_var3, a2, a3);
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_Fixed32(BorealisOwl_IOKitObject *this, const __CFString *a2, float *a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::GetFixed32(p_var3, a2, a3);
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_Fixed64(BorealisOwl_IOKitObject *this, const __CFString *a2, double *a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::GetFixed64(p_var3, a2, a3);
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_CFString(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString **a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);
  CFDictionaryRef String = CACFDictionary::GetString(p_var3, a2, a3);
  if (*a3) {
    CFRetain(*a3);
  }
  return String;
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_CFArray(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFArray **a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);
  CFDictionaryRef Array = CACFDictionary::GetArray(p_var3, a2, a3);
  if (*a3) {
    CFRetain(*a3);
  }
  return Array;
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_CFDictionary(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFDictionary **a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);
  CFDictionaryRef Dictionary = CACFDictionary::GetDictionary(p_var3, a2, a3);
  if (*a3) {
    CFRetain(*a3);
  }
  return Dictionary;
}

__CFDictionary *BorealisOwl_IOKitObject::CopyProperty_CFType(BorealisOwl_IOKitObject *this, const __CFString *a2, const void **a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);
  CFType = CACFDictionary::GetCFType(p_var3, a2, a3);
  if (*a3) {
    CFRetain(*a3);
  }
  return CFType;
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_CACFString(BorealisOwl_IOKitObject *this, __CFString *a2, CACFString *a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::GetCACFString(&p_var3->var0, a2, (uint64_t)a3);
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_CACFArray(BorealisOwl_IOKitObject *this, const __CFString *a2, CACFArray *a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::GetCACFArray(p_var3, a2, a3);
}

const __CFDictionary *BorealisOwl_IOKitObject::CopyProperty_CACFDictionary(BorealisOwl_IOKitObject *this, const __CFString *a2, CACFDictionary *a3)
{
  p_var3 = &this->var3;
  (*((void (**)(BorealisOwl_IOKitObject *))this->var0 + 3))(this);

  return CACFDictionary::GetCACFDictionary(p_var3, a2, a3);
}

__CFDictionary *BorealisOwl_IOKitObject::CopyProperty_CACFType(CACFDictionary *a1, const __CFString *a2, uint64_t a3)
{
  BOOL v5 = a1 + 1;
  (*((void (**)(CACFDictionary *))a1->var0 + 3))(a1);
  CFTypeRef cf = 0;
  uint64_t result = CACFDictionary::GetCFType(v5, a2, &cf);
  if (result) {
    return (__CFDictionary *)sub_31D4(a3, cf);
  }
  return result;
}

uint64_t sub_31D4(uint64_t a1, CFTypeRef cf)
{
  if (*(unsigned char *)(a1 + 8))
  {
    io_connect_t v4 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v4);
    }
  }
  *(void *)a1 = cf;
  *(unsigned char *)(a1 + 8) = 1;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

uint64_t BorealisOwl_IOKitObject::SetProperty(BorealisOwl_IOKitObject *this, const __CFString *a2, const void *a3)
{
  uint64_t result = IORegistryEntrySetCFProperty(this->var1, a2, a3);
  if (result)
  {
    int v5 = result;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_18BE8();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = v5;
  }
  return result;
}

uint64_t BorealisOwl_IOKitObject::SetProperty_BOOL(BorealisOwl_IOKitObject *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  char v7 = 1;
  BorealisOwl_IOKitObject::SetProperty(this, a2, v6);
  return sub_4AC8((uint64_t)&v6);
}

void sub_331C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BorealisOwl_IOKitObject::SetProperty_SInt32(BorealisOwl_IOKitObject *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  char v7 = 1;
  BorealisOwl_IOKitObject::SetProperty(this, a2, v6);
  return sub_4AC8((uint64_t)&v6);
}

void sub_3394(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BorealisOwl_IOKitObject::SetProperty_UInt32(BorealisOwl_IOKitObject *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  char v7 = 1;
  BorealisOwl_IOKitObject::SetProperty(this, a2, v6);
  return sub_4AC8((uint64_t)&v6);
}

void sub_340C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t BorealisOwl_IOKitObject::PropertiesChanged(BorealisOwl_IOKitObject *this)
{
  return sub_342C((uint64_t)&this->var3, 0);
}

uint64_t sub_342C(uint64_t a1, const void *a2)
{
  if (!*(unsigned char *)(a1 + 8))
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 1;
    return a1;
  }
  io_connect_t v4 = *(const void **)a1;
  if (!*(void *)a1)
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 1;
    if (!a2) {
      return a1;
    }
LABEL_8:
    CFRetain(a2);
    return a1;
  }
  CFRelease(v4);
  int v5 = *(unsigned __int8 *)(a1 + 8);
  *(void *)a1 = a2;
  *(unsigned char *)(a1 + 9) = 1;
  if (a2 && v5) {
    goto LABEL_8;
  }
  return a1;
}

void BorealisOwl_IOKitObject::CacheProperties(BorealisOwl_IOKitObject *this)
{
  io_registry_entry_t var1 = this->var1;
  if (var1)
  {
    p_var3 = &this->var3;
    if (!this->var3.var0 || this->var4)
    {
      CFMutableDictionaryRef properties = 0;
      if (IORegistryEntryCreateCFProperties(var1, &properties, 0, 0))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_18C58();
        }
        __break(1u);
      }
      else
      {
        sub_342C((uint64_t)p_var3, properties);
        if (properties) {
          CFRelease(properties);
        }
      }
    }
  }
}

BOOL BorealisOwl_IOKitObject::HasProperty(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  CFTypeRef v4 = CFProperty;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v4 != 0;
}

uint64_t BorealisOwl_IOKitObject::CopyProperty_BOOL(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, BOOL *a4)
{
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (CFProperty)
  {
    CFBooleanRef v6 = CFProperty;
    CFTypeID v7 = CFGetTypeID(CFProperty);
    if (v7 == CFBooleanGetTypeID())
    {
      LOBYTE(a3->isa) = CFBooleanGetValue(v6) != 0;
    }
    else
    {
      CFTypeID v9 = CFGetTypeID(v6);
      if (v9 != CFNumberGetTypeID())
      {
        uint64_t v8 = 0;
        goto LABEL_9;
      }
      CFBooleanRef v11 = v6;
      char v12 = 0;
      int valuePtr = 0;
      CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
      LOBYTE(a3->isa) = valuePtr != 0;
      sub_4AC8((uint64_t)&v11);
    }
    uint64_t v8 = 1;
LABEL_9:
    CFRelease(v6);
    return v8;
  }
  return 0;
}

void sub_3660(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL BorealisOwl_IOKitObject::CopyProperty_SInt32(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, int *a4)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (!CFProperty) {
    return 0;
  }
  CFNumberRef v6 = CFProperty;
  CFTypeID v7 = CFGetTypeID(CFProperty);
  BOOL v8 = v7 == CFNumberGetTypeID();
  BOOL v9 = v8;
  if (v8)
  {
    CFNumberRef v11 = v6;
    char v12 = 0;
    int valuePtr = 0;
    CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
    LODWORD(a3->isa) = valuePtr;
    sub_4AC8((uint64_t)&v11);
  }
  CFRelease(v6);
  return v9;
}

void sub_3710(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL BorealisOwl_IOKitObject::CopyProperty_UInt32(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, unsigned int *a4)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (!CFProperty) {
    return 0;
  }
  CFNumberRef v6 = CFProperty;
  CFTypeID v7 = CFGetTypeID(CFProperty);
  BOOL v8 = v7 == CFNumberGetTypeID();
  BOOL v9 = v8;
  if (v8)
  {
    CFNumberRef v11 = v6;
    char v12 = 0;
    int valuePtr = 0;
    CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
    LODWORD(a3->isa) = valuePtr;
    sub_4AC8((uint64_t)&v11);
  }
  CFRelease(v6);
  return v9;
}

void sub_37C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL BorealisOwl_IOKitObject::CopyProperty_UInt64(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, unint64_t *a4)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (!CFProperty) {
    return 0;
  }
  CFNumberRef v6 = CFProperty;
  CFTypeID v7 = CFGetTypeID(CFProperty);
  BOOL v8 = v7 == CFNumberGetTypeID();
  BOOL v9 = v8;
  if (v8)
  {
    CFNumberRef v11 = v6;
    char v12 = 0;
    int valuePtr = 0;
    CFNumberGetValue(v6, kCFNumberSInt64Type, &valuePtr);
    a3->isa = valuePtr;
    sub_4AC8((uint64_t)&v11);
  }
  CFRelease(v6);
  return v9;
}

void sub_3870(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

CFTypeRef BorealisOwl_IOKitObject::CopyProperty_CFString(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, const __CFString **a4)
{
  CFTypeRef result = IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (result)
  {
    CFNumberRef v6 = (void *)result;
    CFTypeID v7 = CFGetTypeID(result);
    if (v7 == CFStringGetTypeID())
    {
      a3->isa = v6;
      return &dword_0 + 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

CFTypeRef BorealisOwl_IOKitObject::CopyProperty_CFArray(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, const __CFArray **a4)
{
  CFTypeRef result = IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (result)
  {
    CFNumberRef v6 = (void *)result;
    CFTypeID v7 = CFGetTypeID(result);
    if (v7 == CFArrayGetTypeID())
    {
      a3->isa = v6;
      return &dword_0 + 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

CFTypeRef BorealisOwl_IOKitObject::CopyProperty_CFDictionary(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, const __CFDictionary **a4)
{
  CFTypeRef result = IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (result)
  {
    CFNumberRef v6 = (void *)result;
    CFTypeID v7 = CFGetTypeID(result);
    if (v7 == CFDictionaryGetTypeID())
    {
      a3->isa = v6;
      return &dword_0 + 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

void BorealisOwl_IOKitObject::CopyProperty_CACFString(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, CACFString *a4)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (CFProperty)
  {
    CFNumberRef v6 = CFProperty;
    CFTypeID v7 = CFGetTypeID(CFProperty);
    if (v7 == CFStringGetTypeID())
    {
      sub_3A64((uint64_t)a3, v6);
      CFRelease(v6);
      return;
    }
    CFRelease(v6);
  }
  if (a3->isa)
  {
    if (LOBYTE(a3->info)) {
      CFRelease(a3->isa);
    }
    a3->isa = 0;
  }
  LOBYTE(a3->info) = 1;
}

uint64_t sub_3A64(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v4 = *(CFTypeRef *)a1;
  if (v4 != cf)
  {
    if (v4) {
      BOOL v5 = *(unsigned char *)(a1 + 8) == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      CFRelease(v4);
    }
    *(void *)a1 = cf;
  }
  *(unsigned char *)(a1 + 8) = 1;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

uint64_t BorealisOwl_IOKitObject::CopyMatchingObjectWithPropertyValue(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, const void *a4)
{
  kern_return_t v8;
  io_object_t v9;
  io_object_t v10;
  kern_return_t v12;
  _DWORD *exception;
  CFTypeRef cf1;
  char v15;
  BorealisOwl_IOKitObject v16;
  void (**v17)(BorealisOwl_IOKitIterator *__hidden);
  io_iterator_t iterator;
  char v19;
  io_iterator_t existing;
  BorealisOwl_IOKitObject v21;
  mach_port_t mainPort;

  uint64_t var1 = 0;
  if (this && a2 && a3)
  {
    mainPort = 0;
    BOOL v8 = IOMainPort(bootstrap_port, &mainPort);
    if (v8)
    {
      char v12 = v8;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_18CC8();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = v12;
    }
    CFRetain(this);
    *(void *)&v21.uint64_t var1 = 0;
    v21.var3.var0 = 0;
    v21.var0 = (void **)off_247F0;
    *(_WORD *)&v21.var3.uint64_t var1 = 257;
    *(_WORD *)&v21.var4 = 257;
    existing = 0;
    if (!IOServiceGetMatchingServices(mainPort, (CFDictionaryRef)this, &existing) && existing)
    {
      v17 = off_24868;
      iterator = existing;
      v19 = 1;
      BOOL v9 = IOIteratorNext(existing);
      v16.var0 = (void **)off_247F0;
      v16.uint64_t var1 = v9;
      v16.io_connect_t var2 = 0;
      v16.var3.var0 = 0;
      *(_WORD *)&v16.var3.uint64_t var1 = 257;
      *(_WORD *)&v16.var4 = 257;
      while (!v21.var1 && v16.var1)
      {
        cf1 = 0;
        v15 = 1;
        BorealisOwl_IOKitObject::CopyProperty_CACFType((CACFDictionary *)&v16, a2, (uint64_t)&cf1);
        if (cf1 && CFEqual(cf1, a3))
        {
          (*((void (**)(BorealisOwl_IOKitObject *))v16.var0 + 4))(&v16);
          BorealisOwl_IOKitObject::operator=((uint64_t)&v21, v16.var1);
        }
        uint64_t v10 = IOIteratorNext(iterator);
        BorealisOwl_IOKitObject::operator=((uint64_t)&v16, v10);
        sub_4B04((uint64_t)&cf1);
      }
      BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(&v16);
      BorealisOwl_IOKitIterator::~BorealisOwl_IOKitIterator((BorealisOwl_IOKitIterator *)&v17);
    }
    (*((void (**)(BorealisOwl_IOKitObject *))v21.var0 + 4))(&v21);
    uint64_t var1 = v21.var1;
    BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(&v21);
  }
  return var1;
}

void sub_3D34(_Unwind_Exception *a1, uint64_t a2, BorealisOwl_IOKitObject *a3, char a4, uint64_t a5, uint64_t a6, BorealisOwl_IOKitObject *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
}

void BorealisOwl_IOKitIterator::BorealisOwl_IOKitIterator(BorealisOwl_IOKitIterator *this, int a2, char a3)
{
  *(void *)this = off_24868;
  *((_DWORD *)this + 2) = a2;
  *((unsigned char *)this + 12) = a3;
}

{
  *(void *)this = off_24868;
  *((_DWORD *)this + 2) = a2;
  *((unsigned char *)this + 12) = a3;
}

uint64_t BorealisOwl_IOKitIterator::Next(BorealisOwl_IOKitIterator *this)
{
  return IOIteratorNext(*((_DWORD *)this + 2));
}

uint64_t BorealisOwl_IOKitObject::CopyChildWithIntegerPropertyValues(BorealisOwl_IOKitObject *this, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFString *a5)
{
  uint64_t var1 = 0;
  if (this && a2 && a4)
  {
    int v8 = (int)a5;
    int v9 = (int)a3;
    *(void *)&v20.uint64_t var1 = 0;
    v20.var3.var0 = 0;
    v20.var0 = (void **)off_247F0;
    *(_WORD *)&v20.var3.uint64_t var1 = 257;
    *(_WORD *)&v20.var4 = 257;
    v17 = off_24868;
    io_iterator_t iterator = 0;
    char v19 = 1;
    if (IORegistryEntryGetChildIterator((io_registry_entry_t)this, "IOService", &iterator))
    {
      io_iterator_t iterator = 0;
    }
    else if (iterator)
    {
      io_object_t v10 = IOIteratorNext(iterator);
      v16.var0 = (void **)off_247F0;
      v16.uint64_t var1 = v10;
      v16.io_connect_t var2 = 0;
      v16.var3.var0 = 0;
      *(_WORD *)&v16.var3.uint64_t var1 = 257;
      *(_WORD *)&v16.var4 = 257;
      while (!v20.var1 && v16.var1)
      {
        unsigned int v15 = 0;
        (*((void (**)(BorealisOwl_IOKitObject *))v16.var0 + 3))(&v16);
        unsigned int UInt32 = CACFDictionary::GetUInt32(&v16.var3, a2, &v15);
        unsigned int v14 = 0;
        (*((void (**)(BorealisOwl_IOKitObject *))v16.var0 + 3))(&v16);
        if ((UInt32 & CACFDictionary::GetUInt32(&v16.var3, a4, &v14)) == 1 && v15 == v9 && v14 == v8)
        {
          (*((void (**)(BorealisOwl_IOKitObject *))v16.var0 + 4))(&v16);
          BorealisOwl_IOKitObject::operator=((uint64_t)&v20, v16.var1);
        }
        io_object_t v12 = IOIteratorNext(iterator);
        BorealisOwl_IOKitObject::operator=((uint64_t)&v16, v12);
      }
      BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(&v16);
    }
    (*((void (**)(BorealisOwl_IOKitObject *))v20.var0 + 4))(&v20);
    uint64_t var1 = v20.var1;
    BorealisOwl_IOKitIterator::~BorealisOwl_IOKitIterator((BorealisOwl_IOKitIterator *)&v17);
    BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(&v20);
  }
  return var1;
}

void sub_4010(_Unwind_Exception *a1, uint64_t a2, BorealisOwl_IOKitObject *a3, char a4, uint64_t a5, BorealisOwl_IOKitObject *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18)
{
}

void BorealisOwl_IOKitIterator::BorealisOwl_IOKitIterator(BorealisOwl_IOKitIterator *this, io_registry_entry_t entry, const char *plane)
{
  *(void *)this = off_24868;
  *((_DWORD *)this + 2) = 0;
  int v3 = (_DWORD *)((char *)this + 8);
  *((unsigned char *)this + 12) = 1;
  if (IORegistryEntryGetChildIterator(entry, plane, (io_iterator_t *)this + 2)) {
    *int v3 = 0;
  }
}

{
  _DWORD *v3;

  *(void *)this = off_24868;
  *((_DWORD *)this + 2) = 0;
  int v3 = (_DWORD *)((char *)this + 8);
  *((unsigned char *)this + 12) = 1;
  if (IORegistryEntryGetParentIterator(entry, plane, (io_iterator_t *)this + 2)) {
    *int v3 = 0;
  }
}

{
  _DWORD *v3;

  *(void *)this = off_24868;
  *((_DWORD *)this + 2) = 0;
  int v3 = (_DWORD *)((char *)this + 8);
  *((unsigned char *)this + 12) = 1;
  if (IORegistryEntryGetChildIterator(entry, plane, (io_iterator_t *)this + 2)) {
    *int v3 = 0;
  }
}

{
  _DWORD *v3;

  *(void *)this = off_24868;
  *((_DWORD *)this + 2) = 0;
  int v3 = (_DWORD *)((char *)this + 8);
  *((unsigned char *)this + 12) = 1;
  if (IORegistryEntryGetParentIterator(entry, plane, (io_iterator_t *)this + 2)) {
    *int v3 = 0;
  }
}

BOOL BorealisOwl_IOKitIterator::IsValid(BorealisOwl_IOKitIterator *this)
{
  return *((_DWORD *)this + 2) != 0;
}

uint64_t BorealisOwl_IOKitObject::CopyParentByClassName(BorealisOwl_IOKitObject *this, const char *a2, const char *plane, const char *a4)
{
  int v9 = off_24868;
  io_iterator_t v10 = 0;
  char v11 = 1;
  if (IORegistryEntryGetParentIterator((io_registry_entry_t)this, plane, &v10))
  {
    uint64_t var1 = 0;
    io_iterator_t v10 = 0;
  }
  else if (v10)
  {
    v8.var0 = (void **)off_247F0;
    v8.uint64_t var1 = IOIteratorNext(v10);
    v8.io_connect_t var2 = 0;
    v8.var3.var0 = 0;
    *(_WORD *)&v8.var3.uint64_t var1 = 257;
    *(_WORD *)&v8.var4 = 257;
    while (1)
    {
      if (!v8.var1)
      {
        uint64_t var1 = 0;
        goto LABEL_11;
      }
      if (IOObjectConformsTo(v8.var1, a2)) {
        break;
      }
      io_object_t v6 = IOIteratorNext(v10);
      BorealisOwl_IOKitObject::operator=((uint64_t)&v8, v6);
    }
    (*((void (**)(BorealisOwl_IOKitObject *))v8.var0 + 4))(&v8);
    uint64_t var1 = v8.var1;
LABEL_11:
    BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(&v8);
  }
  else
  {
    uint64_t var1 = 0;
  }
  BorealisOwl_IOKitIterator::~BorealisOwl_IOKitIterator((BorealisOwl_IOKitIterator *)&v9);
  return var1;
}

void sub_41F8(_Unwind_Exception *a1, BorealisOwl_IOKitObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject((BorealisOwl_IOKitObject *)&a10);
  BorealisOwl_IOKitIterator::~BorealisOwl_IOKitIterator((BorealisOwl_IOKitIterator *)(v10 - 32));
  _Unwind_Resume(a1);
}

BOOL BorealisOwl_IOKitObject::IsConnectionOpen(BorealisOwl_IOKitObject *this)
{
  return this->var2 != 0;
}

void BorealisOwl_IOKitObject::OpenConnection(BorealisOwl_IOKitObject *this, uint64_t type, uint64_t a3, unsigned int *p_var2, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t var1 = (BorealisOwlLog *)this->var1;
  if (var1)
  {
    p_io_connect_t var2 = &this->var2;
    if (!this->var2)
    {
      uint64_t var1 = (BorealisOwlLog *)IOServiceOpen((io_service_t)var1, mach_task_self_, type, p_var2);
      if (var1)
      {
        int v10 = (int)var1;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_18D38();
        }
        exception = __cxa_allocate_exception(0x10uLL);
        *(void *)exception = off_24B68;
        exception[2] = v10;
      }
    }
  }
  sub_436C(var1, type, a3, (uint64_t)p_var2, a5, a6, a7, a8, (char)"OpenConnection");
}

void sub_436C(BorealisOwlLog *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  BorealisOwlLog::GetInstance(a1);
  BorealisOwlLog::VLog((BorealisOwlLog *)&dword_4, "+-IOKitObject::%s(type 0x%x) <mConnection: %u>\n", &a9, v9);
}

uint64_t BorealisOwl_IOKitObject::SetConnectionNotificationPort(BorealisOwl_IOKitObject *this, uint32_t a2, mach_port_t a3, uintptr_t a4)
{
  uint64_t result = this->var2;
  if (result)
  {
    uint64_t result = IOConnectSetNotificationPort(result, a2, a3, a4);
    if (a3)
    {
      if (result)
      {
        int v7 = result;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_18DA8();
        }
        exception = __cxa_allocate_exception(0x10uLL);
        *(void *)exception = off_24B68;
        exception[2] = v7;
      }
    }
  }
  return result;
}

mach_vm_address_t BorealisOwl_IOKitObject::MapMemory(BorealisOwl_IOKitObject *this, uint32_t a2, IOOptionBits options, unsigned int *a4)
{
  kern_return_t v7;
  mach_vm_address_t result;
  kern_return_t v9;
  _DWORD *exception;
  mach_vm_size_t v11;
  mach_vm_address_t atAddress;

  *a4 = 0;
  io_connect_t var2 = this->var2;
  if (var2 && this->var5)
  {
    char v11 = 0;
    atAddress = 0;
    int v7 = IOConnectMapMemory64(var2, a2, mach_task_self_, &atAddress, &v11, options);
    if (v7)
    {
      int v9 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_18E60();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = v9;
    }
    else
    {
      uint64_t result = atAddress;
      if (atAddress)
      {
        *a4 = v11;
        return result;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_18E18();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = 1852797029;
    }
  }
  return 0;
}

void BorealisOwl_IOKitObject::ReleaseMemory(BorealisOwl_IOKitObject *this, mach_vm_address_t atAddress, uint32_t memoryType)
{
  if (atAddress)
  {
    io_connect_t var2 = this->var2;
    if (var2)
    {
      if (IOConnectUnmapMemory64(var2, memoryType, mach_task_self_, atAddress))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_18ED0();
        }
        __break(1u);
      }
    }
  }
}

uint64_t BorealisOwl_IOKitObject::SetConnectionProperty(BorealisOwl_IOKitObject *this, const __CFString *a2, const void *a3)
{
  return IOConnectSetCFProperty(this->var2, a2, a3);
}

uint64_t BorealisOwl_IOKitObject::CallMethod(BorealisOwl_IOKitObject *this, uint32_t a2, const unint64_t *a3, uint32_t a4, const void *a5, size_t a6, unint64_t *a7, unsigned int *a8, void *outputStruct, unint64_t *a10)
{
  mach_port_t var2 = this->var2;
  if (var2 && this->var5) {
    return IOConnectCallMethod(var2, a2, a3, a4, a5, a6, a7, a8, outputStruct, a10);
  }
  else {
    return 1937010544;
  }
}

uint64_t BorealisOwl_IOKitObject::CallTrap(BorealisOwl_IOKitObject *this, uint32_t a2)
{
  io_connect_t var2 = this->var2;
  if (var2 && this->var5) {
    return IOConnectTrap0(var2, a2);
  }
  else {
    return 1937010544;
  }
}

uint64_t BorealisOwl_IOKitObject::Retain(BorealisOwl_IOKitObject *this)
{
  uint64_t result = this->var1;
  if (result) {
    return IOObjectRetain(result);
  }
  return result;
}

uint64_t BorealisOwl_IOKitObject::Release(BorealisOwl_IOKitObject *this)
{
  io_object_t var1 = this->var1;
  if (var1)
  {
    IOObjectRelease(var1);
    this->io_object_t var1 = 0;
  }

  return sub_342C((uint64_t)&this->var3, 0);
}

void BorealisOwl_IOKitIterator::BorealisOwl_IOKitIterator(BorealisOwl_IOKitIterator *this)
{
  *(void *)this = off_24868;
  *((_DWORD *)this + 2) = 0;
  *((unsigned char *)this + 12) = 1;
}

{
  *(void *)this = off_24868;
  *((_DWORD *)this + 2) = 0;
  *((unsigned char *)this + 12) = 1;
}

void BorealisOwl_IOKitIterator::BorealisOwl_IOKitIterator(BorealisOwl_IOKitIterator *this, const BorealisOwl_IOKitIterator *a2)
{
  *(void *)this = off_24868;
  io_object_t v3 = *((_DWORD *)a2 + 2);
  *((_DWORD *)this + 2) = v3;
  *((unsigned char *)this + 12) = *((unsigned char *)a2 + 12);
  if (v3) {
    IOObjectRetain(v3);
  }
}

{
  io_object_t v3;

  *(void *)this = off_24868;
  io_object_t v3 = *((_DWORD *)a2 + 2);
  *((_DWORD *)this + 2) = v3;
  *((unsigned char *)this + 12) = *((unsigned char *)a2 + 12);
  if (v3) {
    IOObjectRetain(v3);
  }
}

uint64_t BorealisOwl_IOKitIterator::Retain(BorealisOwl_IOKitIterator *this)
{
  uint64_t result = *((unsigned int *)this + 2);
  if (result) {
    return IOObjectRetain(result);
  }
  return result;
}

void BorealisOwl_IOKitIterator::BorealisOwl_IOKitIterator(BorealisOwl_IOKitIterator *this, __CFDictionary *a2)
{
  *((_DWORD *)this + 2) = 0;
  v2 = (_DWORD *)((char *)this + 8);
  *(void *)this = off_24868;
  *((unsigned char *)this + 12) = 1;
  if (IOServiceGetMatchingServices(kIOMainPortDefault, a2, (io_iterator_t *)this + 2)) {
    _DWORD *v2 = 0;
  }
}

uint64_t BorealisOwl_IOKitIterator::operator=(uint64_t a1, io_object_t object)
{
  if (*(unsigned char *)(a1 + 12))
  {
    io_object_t v4 = *(_DWORD *)(a1 + 8);
    if (v4) {
      IOObjectRelease(v4);
    }
  }
  *(_DWORD *)(a1 + 8) = object;
  if (object) {
    IOObjectRetain(object);
  }
  return a1;
}

uint64_t BorealisOwl_IOKitIterator::Release(uint64_t this)
{
  if (*(unsigned char *)(this + 12))
  {
    uint64_t v1 = this;
    this = *(unsigned int *)(this + 8);
    if (this)
    {
      this = IOObjectRelease(this);
      *(_DWORD *)(v1 + 8) = 0;
    }
  }
  return this;
}

uint64_t BorealisOwl_IOKitIterator::operator=(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 12))
  {
    io_object_t v4 = *(_DWORD *)(a1 + 8);
    if (v4)
    {
      IOObjectRelease(v4);
      *(_DWORD *)(a1 + 8) = 0;
    }
  }
  io_object_t v5 = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 8) = v5;
  if (v5) {
    IOObjectRetain(v5);
  }
  return a1;
}

void BorealisOwl_IOKitIterator::~BorealisOwl_IOKitIterator(BorealisOwl_IOKitIterator *this)
{
  *(void *)this = off_24868;
  if (*((unsigned char *)this + 12))
  {
    io_object_t v2 = *((_DWORD *)this + 2);
    if (v2)
    {
      IOObjectRelease(v2);
      *((_DWORD *)this + 2) = 0;
    }
  }
}

{
  uint64_t vars8;

  BorealisOwl_IOKitIterator::~BorealisOwl_IOKitIterator(this);

  operator delete();
}

uint64_t BorealisOwl_IOKitIterator::GetIterator(BorealisOwl_IOKitIterator *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t BorealisOwl_IOKitIterator::SetWillRelease(uint64_t this, char a2)
{
  *(unsigned char *)(this + 12) = a2;
  return this;
}

uint64_t sub_4A8C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    io_object_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

uint64_t sub_4AC8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    io_object_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

uint64_t sub_4B04(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    io_object_t v2 = *(const void **)a1;
    if (*(void *)a1)
    {
      CFRelease(v2);
      *(void *)a1 = 0;
    }
  }
  return a1;
}

void sub_4B44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this)
{
  *(void *)this = sub_4B9C(0);
}

{
  *(void *)this = sub_4B9C(0);
}

_DWORD *sub_4B9C(unsigned int a1)
{
  int v1 = sub_5398(a1, 0x14u);
  unsigned int v2 = sub_540C(12, v1);
  io_object_t v3 = sub_5304(48, v2);
  v3[2] = 1;
  v3[3] = v2;
  *(void *)io_object_t v3 = &off_248A0;
  bzero(v3 + 4, v2);
  return v3;
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, AudioChannelLayout *a2, int a3)
{
  int v5 = 6553601;
  switch((int)a2)
  {
    case 1:
      goto LABEL_14;
    case 2:
      int v6 = 6619138;
      int v7 = 6946818;
      BOOL v8 = a3 == 0;
      goto LABEL_11;
    case 4:
      if (a3) {
        int v5 = 7012356;
      }
      else {
        int v5 = 7077892;
      }
      goto LABEL_14;
    case 5:
      BOOL v8 = a3 == 0;
      int v6 = 7143429;
      int v7 = 7733253;
      goto LABEL_11;
    case 6:
      BOOL v8 = a3 == 0;
      int v6 = 7208966;
      int v7 = 9109510;
LABEL_11:
      if (v8) {
        int v5 = v6;
      }
      else {
        int v5 = v7;
      }
      goto LABEL_14;
    case 7:
      int v5 = 9175047;
      goto LABEL_14;
    case 8:
      int v5 = 7274504;
LABEL_14:
      int v10 = sub_4B9C(0);
      v10[4] = v5;
      *(void *)this = v10;
      break;
    default:
      uint64_t v9 = sub_4B9C(a2);
      *(void *)this = v9;
      CAAudioChannelLayout::SetAllToUnknown((uint64_t)(v9 + 4), a2);
      break;
  }
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, atomic_uint a2)
{
  *(void *)this = 0;
  CAAudioChannelLayout::SetWithTag((atomic_uint **)this, a2);
}

{
  *(void *)this = 0;
  CAAudioChannelLayout::SetWithTag((atomic_uint **)this, a2);
}

atomic_uint *CAAudioChannelLayout::SetWithTag(atomic_uint **this, atomic_uint a2)
{
  io_object_t v4 = *this;
  if (v4 && atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
  }
  uint64_t result = sub_4B9C(0);
  result[4] = a2;
  *this = result;
  return result;
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, atomic_uint **a2)
{
  *(void *)this = 0;
  CAAudioChannelLayout::operator=((atomic_uint **)this, a2);
}

atomic_uint **CAAudioChannelLayout::operator=(atomic_uint **a1, atomic_uint **a2)
{
  io_object_t v3 = *a1;
  io_object_t v4 = *a2;
  if (v3 != *a2)
  {
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
      }
      io_object_t v4 = *a2;
    }
    *a1 = v4;
    if (v4) {
      atomic_fetch_add(v4 + 2, 1u);
    }
  }
  return a1;
}

atomic_uint **CAAudioChannelLayout::CAAudioChannelLayout(atomic_uint **a1, atomic_uint **a2)
{
  *a1 = 0;
  return CAAudioChannelLayout::operator=(a1, a2);
}

void CAAudioChannelLayout::CAAudioChannelLayout(CAAudioChannelLayout *this, unsigned int *a2)
{
  *(void *)this = 0;
  CAAudioChannelLayout::operator=((atomic_uint **)this, a2);
}

{
  *(void *)this = 0;
  CAAudioChannelLayout::operator=((atomic_uint **)this, a2);
}

atomic_uint **CAAudioChannelLayout::operator=(atomic_uint **a1, unsigned int *a2)
{
  io_object_t v4 = *a1;
  if (v4)
  {
    if (v4 + 4 == (atomic_uint *)a2) {
      return a1;
    }
    if (atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
    }
  }
  if (a2) {
    int v5 = sub_50D8(a2);
  }
  else {
    int v5 = sub_4B9C(0);
  }
  *a1 = v5;
  return a1;
}

void CAAudioChannelLayout::~CAAudioChannelLayout(atomic_uint **this)
{
  unsigned int v2 = *this;
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
    }
    *this = 0;
  }
}

uint64_t CAAudioChannelLayout::Clear(CAAudioChannelLayout *this)
{
  return CAAudioChannelLayout::Set(this, 0, 0);
}

uint64_t CAAudioChannelLayout::Set(CAAudioChannelLayout *this, const AudioChannelLayout *a2, unint64_t a3)
{
  uint64_t v6 = *(void *)this;
  if (v6)
  {
    if ((const AudioChannelLayout *)(v6 + 16) == a2) {
      return 1;
    }
    if (atomic_fetch_add((atomic_uint *volatile)(v6 + 8), 0xFFFFFFFF) == 1) {
      (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
    }
  }
  if (!a2)
  {
    int v10 = sub_4B9C(0);
LABEL_11:
    BOOL v8 = v10;
    uint64_t result = 1;
    goto LABEL_12;
  }
  int v7 = sub_5398(a2->mNumberChannelDescriptions, 0x14u);
  if (sub_540C(12, v7) <= a3)
  {
    int v10 = sub_50D8(&a2->mChannelLayoutTag);
    goto LABEL_11;
  }
  BOOL v8 = sub_4B9C(0);
  uint64_t result = 0;
LABEL_12:
  *(void *)this = v8;
  return result;
}

_DWORD *sub_50D8(unsigned int *a1)
{
  int v2 = sub_5398(a1[2], 0x14u);
  unsigned int v3 = sub_540C(12, v2);
  io_object_t v4 = sub_5304(48, v3);
  v4[2] = 1;
  v4[3] = v3;
  *(void *)io_object_t v4 = &off_248A0;
  bzero(v4 + 4, v3);
  memcpy(v4 + 4, a1, v3);
  return v4;
}

BOOL CAAudioChannelLayout::operator==(void *a1, void *a2)
{
  int v2 = (_DWORD *)*a1;
  unsigned int v3 = (_DWORD *)*a2;
  if (*a1 == *a2) {
    return 1;
  }
  int v4 = v2[4];
  if (v4 == v3[4])
  {
    if (v4)
    {
      if (v4 == 0x10000) {
        return v2[5] == v3[5];
      }
      return 1;
    }
    uint64_t v6 = v2[6];
    if (v6 == v3[6])
    {
      if (v6)
      {
        int v7 = v3 + 7;
        BOOL v8 = v2 + 7;
        BOOL result = 1;
        while (*v8 == *v7)
        {
          if (*v8 == 100)
          {
            BOOL v9 = *(void *)v8 == *(void *)v7 && *((void *)v8 + 1) == *((void *)v7 + 1);
            if (!v9 || v8[4] != (unint64_t)v7[4]) {
              break;
            }
          }
          v7 += 5;
          v8 += 5;
          if (!--v6) {
            return result;
          }
        }
        return 0;
      }
      return 1;
    }
  }
  return 0;
}

BOOL CAAudioChannelLayout::operator!=(void *a1, void *a2)
{
  int v2 = (_DWORD *)*a1;
  unsigned int v3 = (_DWORD *)*a2;
  if (*a1 == *a2) {
    return 0;
  }
  int v4 = v2[4];
  if (v4 == v3[4])
  {
    if (v4)
    {
      if (v4 == 0x10000) {
        return v2[5] != v3[5];
      }
      return 0;
    }
    uint64_t v6 = v2[6];
    if (v6 == v3[6])
    {
      if (v6)
      {
        int v7 = v3 + 7;
        for (i = v2 + 7; *i == *v7; i += 5)
        {
          if (*i == 100)
          {
            BOOL v9 = *(void *)i == *(void *)v7 && *((void *)i + 1) == *((void *)v7 + 1);
            if (!v9 || i[4] != (unint64_t)v7[4]) {
              break;
            }
          }
          BOOL result = 0;
          v7 += 5;
          if (!--v6) {
            return result;
          }
        }
        return 1;
      }
      return 0;
    }
  }
  return 1;
}

size_t CAAudioChannelLayout::Print(CAAudioChannelLayout *this, __sFILE *__stream)
{
  return CAShowAudioChannelLayout(__stream, (_DWORD *)(*(void *)this + 16));
}

void *sub_5304(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  BOOL result = malloc_type_malloc(a2 + 16, 0x7C51E058uLL);
  if (v2)
  {
    if (!result)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      int v5 = std::bad_alloc::bad_alloc(exception);
    }
  }
  return result;
}

uint64_t sub_536C(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

unint64_t sub_5398(unsigned int a1, unsigned int a2)
{
  unint64_t result = a1 * (unint64_t)a2;
  if ((result & 0xFFFFFFFF00000000) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_547C(exception, "arithmetic multiplication overflow");
  }
  return result;
}

void sub_53F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_540C(int a1, int a2)
{
  BOOL v2 = __CFADD__(a1, a2);
  uint64_t result = (a1 + a2);
  if (v2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_547C(exception, "arithmetic addition overflow");
  }
  return result;
}

void sub_5468(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::runtime_error *sub_547C(std::runtime_error *a1, const char *a2)
{
  uint64_t result = std::runtime_error::runtime_error(a1, a2);
  return result;
}

BOOL CACFDictionary::HasKey(CACFDictionary *this, const __CFString *a2)
{
  return CFDictionaryContainsKey(this->var0, a2) != 0;
}

__CFDictionary *CACFDictionary::Size(CACFDictionary *this)
{
  uint64_t result = this->var0;
  if (result) {
    return (__CFDictionary *)CFDictionaryGetCount(result);
  }
  return result;
}

void CACFDictionary::GetKeys(CACFDictionary *this, const void **a2)
{
}

void CACFDictionary::GetKeysAndValues(CACFDictionary *this, const void **a2, const void **a3)
{
}

const __CFDictionary *CACFDictionary::GetBool(CACFDictionary *this, const __CFString *a2, BOOL *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFBooleanRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFBooleanGetTypeID())
      {
        BOOL v7 = CFBooleanGetValue(v5) == 0;
      }
      else
      {
        CFTypeID v8 = CFGetTypeID(v5);
        if (v8 != CFNumberGetTypeID()) {
          return 0;
        }
        int valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        BOOL v7 = valuePtr == 0;
      }
      BOOL v9 = !v7;
      *a3 = v9;
      return (const __CFDictionary *)(&dword_0 + 1);
    }
  }
  return result;
}

__CFDictionary *CACFDictionary::GetCFType(CACFDictionary *this, const __CFString *a2, const void **a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    Value = CFDictionaryGetValue(result, a2);
    *a3 = Value;
    return (__CFDictionary *)(Value != 0);
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetSInt32(CACFDictionary *this, const __CFString *a2, int *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetUInt32(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetSInt64(CACFDictionary *this, const __CFString *a2, uint64_t *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetUInt64(CACFDictionary *this, const __CFString *a2, unint64_t *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt64Type, a3);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetFloat32FromString(CACFDictionary *this, const __CFString *a2, float *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFStringRef v5 = (const __CFString *)result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFStringGetTypeID())
      {
        float DoubleValue = CFStringGetDoubleValue(v5);
        *a3 = DoubleValue;
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetUInt32FromString(CACFDictionary *this, const __CFString *a2, SInt32 *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFStringRef v5 = (const __CFString *)result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = CFStringGetIntValue(v5);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetFloat32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat32Type, a3);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetFloat64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloat64Type, a3);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetFixed32(CACFDictionary *this, const __CFString *a2, float *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        int valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        float v7 = 1.0;
        if (valuePtr < 0) {
          float v7 = -1.0;
        }
        *a3 = v7
            * (float)((float)((float)(unsigned __int16)(valuePtr * (int)v7) * 0.000015259)
                    + (float)(((valuePtr * (int)v7) >> 16) & 0x7FFF));
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetFixed64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        uint64_t valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
        *a3 = (double)valuePtr * 2.32830644e-10 + (double)(valuePtr >> 32);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::Get4CC(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFNumberRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, buffer, 5, 0x600u);
        *a3 = bswap32(*(unsigned int *)buffer);
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      return 0;
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetString(CACFDictionary *this, const __CFString *a2, const __CFString **a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFStringRef v5 = (const __CFString *)result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFStringGetTypeID())
      {
        *a3 = v5;
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetArray(CACFDictionary *this, const __CFString *a2, const __CFArray **a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFArrayRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFArrayGetTypeID())
      {
        *a3 = v5;
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary **a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFDictionaryGetTypeID())
      {
        *a3 = v5;
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetData(CACFDictionary *this, const __CFString *a2, const __CFData **a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDataRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFDataGetTypeID())
      {
        *a3 = v5;
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetURL(CACFDictionary *this, const __CFString *a2, const __CFURL **a3)
{
  CFDictionaryRef result = this->var0;
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFURLRef v5 = result;
      CFTypeID v6 = CFGetTypeID(result);
      if (v6 == CFURLGetTypeID())
      {
        *a3 = v5;
        return (const __CFDictionary *)(&dword_0 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

BOOL CACFDictionary::GetCFTypeWithCStringKey(CACFDictionary *this, const char *a2, const void **a3)
{
  if (!this->var0) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, a2, 0x600u);
  CFStringRef v9 = v5;
  char v10 = 1;
  if (v5 && this->var0)
  {
    Value = CFDictionaryGetValue(this->var0, v5);
    *a3 = Value;
    BOOL v7 = Value != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  sub_6970((uint64_t)&v9);
  return v7;
}

void sub_5DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const __CFDictionary *CACFDictionary::GetCACFString(const __CFDictionary **a1, void *key, uint64_t a3)
{
  if (*(void *)a3)
  {
    if (*(unsigned char *)(a3 + 8)) {
      CFRelease(*(CFTypeRef *)a3);
    }
    *(void *)a3 = 0;
  }
  *(unsigned char *)(a3 + 8) = 1;
  CFDictionaryRef result = *a1;
  if (*a1)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, key);
    if (result)
    {
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFStringGetTypeID();
      if ((const __CFDictionary *)v8 == result)
      {
        return (const __CFDictionary *)sub_3A64(a3, v7);
      }
    }
  }
  return result;
}

const __CFDictionary *CACFDictionary::GetCACFArray(CACFDictionary *this, const __CFString *a2, CACFArray *a3)
{
  sub_5F18((uint64_t)a3, 0);
  CFDictionaryRef result = this->var0;
  if (this->var0)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFArrayGetTypeID();
      if ((const __CFDictionary *)v8 == result)
      {
        return (const __CFDictionary *)sub_5F18((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t sub_5F18(uint64_t a1, const void *a2)
{
  if (!*(unsigned char *)(a1 + 8))
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 0;
    return a1;
  }
  int v4 = *(const void **)a1;
  if (!*(void *)a1)
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 0;
    if (!a2) {
      return a1;
    }
LABEL_8:
    CFRetain(a2);
    return a1;
  }
  CFRelease(v4);
  int v5 = *(unsigned __int8 *)(a1 + 8);
  *(void *)a1 = a2;
  *(unsigned char *)(a1 + 9) = 0;
  if (a2 && v5) {
    goto LABEL_8;
  }
  return a1;
}

const __CFDictionary *CACFDictionary::GetCACFDictionary(CACFDictionary *this, const __CFString *a2, CACFDictionary *a3)
{
  sub_5F18((uint64_t)a3, 0);
  CFDictionaryRef result = this->var0;
  if (this->var0)
  {
    CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v7 = result;
      CFTypeID v8 = CFGetTypeID(result);
      CFDictionaryRef result = (const __CFDictionary *)CFDictionaryGetTypeID();
      if ((const __CFDictionary *)v8 == result)
      {
        return (const __CFDictionary *)sub_5F18((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFDictionary::AddBool(CACFDictionary *this, const __CFString *key, int a3)
{
  int v5 = &kCFBooleanTrue;
  if (!a3) {
    int v5 = &kCFBooleanFalse;
  }
  CFBooleanRef v6 = *v5;
  CFBooleanRef v11 = v6;
  char v12 = 1;
  if (v6) {
    CFRetain(v6);
  }
  if (!this->var2 || ((var0 = this->var0, v6) ? (BOOL v8 = var0 == 0) : (BOOL v8 = 1), v8))
  {
    uint64_t v9 = 0;
  }
  else
  {
    CFDictionarySetValue(var0, key, v6);
    uint64_t v9 = 1;
  }
  sub_69AC((uint64_t)&v11);
  return v9;
}

void sub_60C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CACFDictionary::AddCFType(CACFDictionary *this, const __CFString *a2, const void *a3)
{
  if (!this->var2) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    var0 = this->var0;
    if (var0)
    {
      CFDictionarySetValue(var0, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddSInt32(CACFDictionary *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (this->var2)
  {
    uint64_t v6 = 0;
    if (v5 && this->var0)
    {
      CFDictionarySetValue(this->var0, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return v6;
}

void sub_61A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddUInt32(CACFDictionary *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (this->var2)
  {
    uint64_t v6 = 0;
    if (v5 && this->var0)
    {
      CFDictionarySetValue(this->var0, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return v6;
}

void sub_624C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddSInt64(CACFDictionary *this, const __CFString *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (this->var2)
  {
    uint64_t v6 = 0;
    if (v5 && this->var0)
    {
      CFDictionarySetValue(this->var0, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return v6;
}

void sub_62F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddUInt64(CACFDictionary *this, const __CFString *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (this->var2)
  {
    uint64_t v6 = 0;
    if (v5 && this->var0)
    {
      CFDictionarySetValue(this->var0, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return v6;
}

void sub_6394(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat32(CACFDictionary *this, const __CFString *a2, float a3)
{
  float valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (this->var2)
  {
    uint64_t v6 = 0;
    if (v5 && this->var0)
    {
      CFDictionarySetValue(this->var0, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return v6;
}

void sub_6438(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddFloat64(CACFDictionary *this, const __CFString *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (this->var2)
  {
    uint64_t v6 = 0;
    if (v5 && this->var0)
    {
      CFDictionarySetValue(this->var0, a2, v5);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return v6;
}

void sub_64DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFDictionary::AddNumber(CACFDictionary *this, const __CFString *a2, const __CFNumber *a3)
{
  if (!this->var2) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    var0 = this->var0;
    if (var0)
    {
      CFDictionarySetValue(var0, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddString(CACFDictionary *this, const __CFString *a2, const __CFString *a3)
{
  if (!this->var2) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    var0 = this->var0;
    if (var0)
    {
      CFDictionarySetValue(var0, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddArray(CACFDictionary *this, const __CFString *a2, const __CFArray *a3)
{
  if (!this->var2) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    var0 = this->var0;
    if (var0)
    {
      CFDictionarySetValue(var0, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary *a3)
{
  if (!this->var2) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    var0 = this->var0;
    if (var0)
    {
      CFDictionarySetValue(var0, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddData(CACFDictionary *this, const __CFString *a2, const __CFData *a3)
{
  if (!this->var2) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    var0 = this->var0;
    if (var0)
    {
      CFDictionarySetValue(var0, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddURL(CACFDictionary *this, const __CFString *a2, const __CFURL *a3)
{
  if (!this->var2) {
    return 0;
  }
  uint64_t result = 0;
  if (a3)
  {
    var0 = this->var0;
    if (var0)
    {
      CFDictionarySetValue(var0, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CACFDictionary::AddCFTypeWithCStringKey(CACFDictionary *this, const char *a2, const void *a3)
{
  if (!a2) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, a2, 0x600u);
  CFStringRef v8 = v5;
  char v9 = 1;
  if (v5 && this->var2)
  {
    uint64_t v6 = 0;
    if (a3 && this->var0)
    {
      CFDictionarySetValue(this->var0, v5, a3);
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_6970((uint64_t)&v8);
  return v6;
}

void sub_6720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t CACFDictionary::AddCString(CACFDictionary *this, const __CFString *a2, const char *cStr)
{
  if (!cStr) {
    return 0;
  }
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x600u);
  CFStringRef v8 = v5;
  char v9 = 1;
  if (v5 && this->var2 && this->var0)
  {
    CFDictionarySetValue(this->var0, a2, v5);
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_6970((uint64_t)&v8);
  return v6;
}

void sub_67C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void CACFDictionary::PrintToLog(CACFDictionary *this, const __CFString *a2)
{
  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)this);
  if (Count)
  {
    unint64_t v5 = Count;
    sub_69E8(keys, Count);
    sub_6BB8(values, v5);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)this, (const void **)keys[0], (const void **)values[0]);
    for (uint64_t i = 0; i != v5; ++i)
    {
      CACFString::PrintToLog((const __CFString *)keys[0][i], a2);
      CFTypeID v7 = CFGetTypeID(values[0][i]);
      if (v7 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog((CACFBoolean *)values[0][i], (const __CFBoolean *)(a2 + 1));
      }
      else if (v7 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog((CACFNumber *)values[0][i], (const __CFNumber *)(a2 + 1));
      }
      else if (v7 == CFStringGetTypeID())
      {
        CACFString::PrintToLog((const __CFString *)values[0][i], (const __CFString *)(a2 + 1));
      }
      else if (v7 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog((CACFDictionary *)values[0][i], (const __CFDictionary *)(a2 + 1), v8);
      }
      else if (v7 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog((CACFArray *)values[0][i], (const __CFArray *)(a2 + 1));
      }
    }
    if (values[0])
    {
      values[1] = values[0];
      operator delete(values[0]);
    }
    if (keys[0])
    {
      keys[1] = keys[0];
      operator delete(keys[0]);
    }
  }
}

void sub_6934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_6970(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    BOOL v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

uint64_t sub_69AC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    BOOL v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

void *sub_69E8(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_6A60(a1, a2);
    int v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_6A44(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_6A60(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_6AA4();
  }
  uint64_t result = (char *)sub_6ABC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_6AA4()
{
}

void *sub_6ABC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_6B84();
  }
  return operator new(8 * a2);
}

void sub_6AF4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_6B50(exception, a1);
}

void sub_6B3C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_6B50(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_6B84()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_6BB8(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_6A60(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_6C14(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_724C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_7294(uint64_t a1, FILE *a2)
{
  id v3 = *(id *)(a1 + 32);
  CFBooleanRef v11 = v3;
  if (a2 && v3)
  {
    [v3 getDiagonsticData];
    if (v14 >= 0) {
      p_p = (const char *)&__p;
    }
    else {
      p_p = (const char *)__p;
    }
    fputs(p_p, a2);
    if (v14 < 0) {
      operator delete(__p);
    }
  }
  else
  {
    sub_7364((BorealisOwlLog *)"DumpSubsystem(%p, %p) bad argument\n", v4, v5, v6, v7, v8, v9, v10, (char)v3);
  }
}

#error "7338: call analysis failed (funcsize=6)"

void sub_7344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7364(BorealisOwlLog *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  BorealisOwlLog::GetInstance(a1);
  BorealisOwlLog::VLog(0, (char *)a1, &a9, v10);
}

#error "74F8: call analysis failed (funcsize=38)"

void sub_7508(_Unwind_Exception *a1)
{
}

void sub_7780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

void sub_7794(BorealisOwlLog *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  BorealisOwlLog::GetInstance(a1);
  BorealisOwlLog::VLog((BorealisOwlLog *)((char *)&dword_0 + 3), (char *)a1, &a9, v10);
}

void sub_7A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

#error "7B0C: call analysis failed (funcsize=38)"

void sub_7B1C(_Unwind_Exception *a1)
{
}

void sub_7D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

#error "7E30: call analysis failed (funcsize=38)"

void sub_7E40(_Unwind_Exception *a1)
{
}

void sub_82B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

#error "8398: call analysis failed (funcsize=38)"

void sub_83A8(_Unwind_Exception *a1)
{
}

void sub_89F0(_Unwind_Exception *a1)
{
  sub_AE2C((unsigned char *)(v1 - 104));
  _Unwind_Resume(a1);
}

unsigned char *sub_8A70(uint64_t a1)
{
  uint64_t v46 = *(void *)(*(void *)(a1 + 32) + 40);
  char v47 = (*(uint64_t (**)(uint64_t))(*(void *)v46 + 16))(v46);
  int ControlValue = AOPAudioDeviceHWManager::HW_VoiceTriggerGetControlValue(*(AOPAudioDeviceHWManager **)(*(void *)(a1 + 32) + 24), 0, v2, v3, v4, v5, v6, v7);
  if (ControlValue == 1)
  {
    AOPAudioDeviceHWManager::HW_VoiceTriggerSetControlValue(*(AOPAudioDeviceHWManager **)(*(void *)(a1 + 32) + 24), 0, 0);
    sub_8D34((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverVoiceTriggerConfiguration) stopping voice trigger to set model\n", v15, v16, v17, v18, v19, v20, v21, v45);
  }
  AOPAudioDeviceHWManager::HW_SetVoiceTriggerConfiguration(*(AOPAudioDeviceHWManager **)(*(void *)(a1 + 32) + 24), *(const __CFDictionary **)(a1 + 40), v8, v9, v10, v11, v12, v13);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  if (ControlValue == 1)
  {
    AOPAudioDeviceHWManager::HW_VoiceTriggerSetControlValue(*(AOPAudioDeviceHWManager **)(*(void *)(a1 + 32) + 24), 0, 1u);
    sub_8D34((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverVoiceTriggerConfiguration) restarting voice trigger\n", v29, v30, v31, v32, v33, v34, v35, v45);
  }
  AOPAudioDeviceHWManager::HW_UpdateRingBufferDescription(*(AOPAudioDeviceHWManager **)(*(void *)(a1 + 32) + 24), v22, v23, v24, v25, v26, v27, v28);
  [*(id *)(a1 + 32) updateStreamDescription];
  [*(id *)(a1 + 32) notifyDevicePropertiesChanged];
  [*(id *)(*(void *)(a1 + 32) + 8) notifyStreamPropertiesChanged];
  sub_7794((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverVoiceTriggerConfiguration) model updated\n", v36, v37, v38, v39, v40, v41, v42, v45);
  int v49 = 0;
  uint64_t v48 = *(void *)"ctvabolg";
  v43 = [*(id *)(a1 + 32) plugin];
  [v43 changedProperty:&v48 forObject:*(void *)(a1 + 32)];

  return sub_AE2C(&v46);
}

#error "8CF4: call analysis failed (funcsize=53)"

void sub_8D34(BorealisOwlLog *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  BorealisOwlLog::GetInstance(a1);
  BorealisOwlLog::VLog((BorealisOwlLog *)&dword_4, (char *)a1, &a9, v10);
}

unsigned char *sub_8D78(uint64_t a1)
{
  uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 40);
  char v30 = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 16))(v29);
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v9 + 76))
  {
    sub_7794((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverEnabledChannelMask) HW_StopIO \n", v2, v3, v4, v5, v6, v7, v8, v27);
    AOPAudioDeviceHWManager::HW_StopIO(*(AOPAudioDeviceHWManager **)(*(void *)(a1 + 32) + 24));
    uint64_t v9 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v9 + 72))
  {
    sub_7794((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverEnabledChannelMask) HW_disableListening \n", v2, v3, v4, v5, v6, v7, v8, v27);
    AOPAudioDeviceHWManager::HW_DisableListening(*(AOPAudioDeviceHWManager **)(*(void *)(a1 + 32) + 24));
    uint64_t v9 = *(void *)(a1 + 32);
  }
  AOPAudioDeviceHWManager::HW_AudioSetControlValue(*(AOPAudioDeviceHWManager **)(v9 + 24), 0, *(_DWORD *)(a1 + 40));
  sub_7794((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverEnabledChannelMask) new value: %d\n", v10, v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 40));
  uint64_t v24 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v24 + 76))
  {
    sub_7794((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverEnabledChannelMask) HW_StartIO \n", v17, v18, v19, v20, v21, v22, v23, v28);
    AOPAudioDeviceHWManager::HW_StartIO(*(AOPAudioDeviceHWManager **)(*(void *)(a1 + 32) + 24));
    uint64_t v24 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v24 + 72))
  {
    sub_7794((BorealisOwlLog *)"Device::setProperty(kAOPAudioDriverEnabledChannelMask) HW_enableListening\n", v17, v18, v19, v20, v21, v22, v23, v28);
    AOPAudioDeviceHWManager::HW_EnableListening(*(AOPAudioDeviceHWManager **)(*(void *)(a1 + 32) + 24));
    uint64_t v24 = *(void *)(a1 + 32);
  }
  AOPAudioDeviceHWManager::HW_UpdateRingBufferDescription(*(AOPAudioDeviceHWManager **)(v24 + 24), v17, v18, v19, v20, v21, v22, v23);
  [*(id *)(a1 + 32) updateStreamDescription];
  [*(id *)(a1 + 32) notifyDevicePropertiesChanged];
  [*(id *)(*(void *)(a1 + 32) + 8) notifyStreamPropertiesChanged];
  int v32 = 0;
  uint64_t v31 = *(void *)"meoabolg";
  uint64_t v25 = [*(id *)(a1 + 32) plugin];
  [v25 changedProperty:&v31 forObject:*(void *)(a1 + 32)];

  return sub_AE2C(&v29);
}

#error "9038: call analysis failed (funcsize=48)"

void sub_9128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

#error "9210: call analysis failed (funcsize=38)"

void sub_9220(_Unwind_Exception *a1)
{
}

void sub_94C4(_Unwind_Exception *a1)
{
  sub_AE2C((unsigned char *)(v1 - 96));
  _Unwind_Resume(a1);
}

uint64_t sub_94F0(uint64_t a1, double *a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v17 = **(void **)(a1 + 32);
  char v18 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 16))(v17);
  unint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  AOPAudioDeviceHWManager::HW_ReadIOTimeStampStatusBuffer(**(AOPAudioDeviceHWManager ***)(a1 + 40), &v16, &v15, &v14, &v13);
  unint64_t v9 = v13;
  unint64_t v8 = v14;
  *a2 = (double)v14;
  *a3 = v9;
  unint64_t v10 = v16;
  *a4 = v16;
  if (v8 - v10 >= (*(_DWORD *)(a1 + 56) / *(_DWORD *)(a1 + 80) - *(_DWORD *)(a1 + 60))) {
    unint64_t v11 = (*(_DWORD *)(a1 + 56) / *(_DWORD *)(a1 + 80) - *(_DWORD *)(a1 + 60));
  }
  else {
    unint64_t v11 = v8 - v10;
  }
  *(void *)(*(void *)(a1 + 72) + 8) = v11;
  kdebug_trace();
  sub_AE2C(&v17);
  return 0;
}

void sub_95D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

uint64_t sub_95F0(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
{
  *a3 = *(unsigned char *)(a1 + 32);
  *a4 = 1;
  return 1970171760;
}

uint64_t sub_960C(uint64_t a1, unsigned int a2, uint64_t a3, __int16 *a4)
{
  return 0;
}

unsigned char *ReadInputData(unsigned int a1, __int16 *a2, char a3, unsigned int a4, unsigned int a5, double a6, uint64_t a7, uint64_t *a8, uint64_t *a9, char a10)
{
  if ((a3 & 1) == 0) {
    kdebug_trace();
  }
  uint64_t v18 = *a8;
  unint64_t v19 = *(void *)(*a8 + 216);
  if (v19 < *(void *)(*a8 + 208))
  {
    *(double *)(v18 + 200) = a6;
    *(void *)(v18 + 216) = v19 + 1;
    uint64_t v18 = *a8;
  }
  unint64_t v20 = *(void *)(v18 + 240);
  if (v20 < *(void *)(v18 + 232))
  {
    *(double *)(v18 + 224) = a6;
    *(void *)(v18 + 240) = v20 + 1;
  }
  uint64_t v68 = *a9;
  char v69 = (*(uint64_t (**)(uint64_t))(*(void *)v68 + 16))(v68);
  if (!a1)
  {
    sub_7364((BorealisOwlLog *)"ReadInputData() IOBufferFrameSize == 0 \n", v21, v22, v23, v24, v25, v26, v27, v61);
    if (a3) {
      return sub_AE2C(&v68);
    }
LABEL_47:
    kdebug_trace();
    return sub_AE2C(&v68);
  }
  if (!a2)
  {
    sub_7364((BorealisOwlLog *)"ReadInputData() outBuffer == NULL \n", v21, v22, v23, v24, v25, v26, v27, v61);
    if (a3) {
      return sub_AE2C(&v68);
    }
    goto LABEL_47;
  }
  int64_t v28 = *(_DWORD *)(*a8 + 64) / a4;
  unsigned int v64 = a5;
  uint64_t v65 = *a8;
  if (v28 >= a1)
  {
    if (a1 > 0x1000 && (a3 & 1) == 0) {
      sub_7364((BorealisOwlLog *)"ReadInputData() requested frames (%d) is very large...continuing\n", v21, v22, v23, v24, v25, v26, v27, a1);
    }
  }
  else
  {
    sub_7364((BorealisOwlLog *)"ReadInputData() requested frames (%d) exceeds max (%d), truncating...\n", v21, v22, v23, v24, v25, v26, v27, a1);
    a1 = v28;
  }
  unsigned int v63 = a1 * a4;
  bzero(a2, a1 * a4);
  uint64_t v29 = (uint64_t)a6;
  uint64_t v30 = *a8;
  uint64_t v67 = *(void *)(*a8 + 152);
  uint64_t v66 = *(void *)(*a8 + 168);
  if (v66)
  {
    LODWORD(v31) = v66 - v67;
    if (v28 >= (int)v66 - (int)v67) {
      uint64_t v31 = v31;
    }
    else {
      uint64_t v31 = v28;
    }
    uint64_t v62 = v31;
    int v32 = sub_AE84(v30 + 312, a1 + v29, v66 + *(unsigned int *)(v65 + 72) + *(unsigned int *)(v65 + 68));
    uint64_t v40 = (int64x2_t *)(v30 + 296);
    if (v32)
    {
      *uint64_t v40 = vaddq_s64(*v40, vdupq_n_s64(1uLL));
    }
    else
    {
      ++v40->i64[0];
      sub_7364((BorealisOwlLog *)"ReadInputData() Out of Bounds, read @ (%lld) > (%lld) \n", v33, v34, v35, v36, v37, v38, v39, a1 + v29);
    }
    uint64_t v41 = *a8;
    int v42 = sub_AE84(*a8 + 360, (uint64_t)a6, v66 - v62);
    v50 = (int64x2_t *)(v41 + 344);
    if (v42)
    {
      int64x2_t *v50 = vaddq_s64(*v50, vdupq_n_s64(1uLL));
    }
    else
    {
      ++v50->i64[0];
      sub_7364((BorealisOwlLog *)"ReadInputData() Out of Bounds, read @ (%lld) < (%lld) \n", v43, v44, v45, v46, v47, v48, v49, (uint64_t)a6);
    }
  }
  uint64_t v51 = (v28 & ((v29 % v28) >> 63)) + v29 % v28;
  if (v51 + a1 <= v28) {
    int v52 = 0;
  }
  else {
    int v52 = a1 - (v28 - v51);
  }
  if (a10) {
    goto LABEL_38;
  }
  if (v51 + a1 <= v28) {
    unsigned int v53 = a1;
  }
  else {
    unsigned int v53 = v28 - v51;
  }
  size_t v54 = v53 * a4;
  memcpy(a2, (const void *)(*(void *)(v65 + 56) + v51 * a4), v54);
  if (v52) {
    memcpy((char *)a2 + v54, *(const void **)(v65 + 56), v52 * a4);
  }
  if (v63 < v64)
  {
LABEL_38:
    uint64_t v55 = 0;
  }
  else
  {
    unsigned __int16 v56 = 0;
    LODWORD(v57) = v63 / v64;
    if (v63 / v64 <= 1) {
      uint64_t v57 = 1;
    }
    else {
      uint64_t v57 = v57;
    }
    do
    {
      __int16 v58 = *a2++;
      v56 ^= v58;
      --v57;
    }
    while (v57);
    uint64_t v55 = v56;
  }
  uint64_t v59 = *a8;
  if (sub_AF64(*a8 + 264, v55)) {
    ++*(void *)(v59 + 256);
  }
  ++*(void *)(v59 + 248);
  if ((a3 & 1) == 0) {
    goto LABEL_47;
  }
  return sub_AE2C(&v68);
}

void sub_9A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

#error "9AEC: call analysis failed (funcsize=38)"

void sub_9AFC(_Unwind_Exception *a1)
{
}

void sub_9CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

void sub_9CC4(BorealisOwlLog *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  BorealisOwlLog::GetInstance(a1);
  BorealisOwlLog::VLog((BorealisOwlLog *)((char *)&dword_0 + 1), (char *)a1, &a9, v10);
}

void sub_A0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_4A8C((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_A1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_A2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

void sub_A9B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

uint64_t sub_AA0C(uint64_t a1)
{
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v2;
  uint64_t v4 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v4, (void *)(a1 + 8));
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_AB7C(_Unwind_Exception *a1)
{
}

void *operator<<(void *a1)
{
  sub_B390(a1, (uint64_t)"  mSizeOfAuxiliaryIOStatus:   ", 30);
  uint64_t v2 = (void *)std::ostream::operator<<();
  sub_B390(v2, (uint64_t)"\n", 1);
  sub_B390(a1, (uint64_t)"  mRealtimeAvailablePastData: ", 30);
  uint64_t v3 = (void *)std::ostream::operator<<();
  sub_B390(v3, (uint64_t)"\n", 1);
  return a1;
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  sub_B390(a1, (uint64_t)"  mInitialSampleTime: ", 22);
  uint64_t v2 = (void *)std::ostream::operator<<();
  sub_B390(v2, (uint64_t)"\n", 1);
  sub_B390(a1, (uint64_t)"  mFrameTimeDelta:    ", 22);
  uint64_t v3 = (void *)std::ostream::operator<<();
  sub_B390(v3, (uint64_t)"\n", 1);
  sub_B390(a1, (uint64_t)"  mSampleTime:        ", 22);
  uint64_t v4 = (void *)std::ostream::operator<<();
  sub_B390(v4, (uint64_t)"\n", 1);
  sub_B390(a1, (uint64_t)"  mHostTime:          ", 22);
  uint64_t v5 = (void *)std::ostream::operator<<();
  sub_B390(v5, (uint64_t)"\n", 1);
  return a1;
}

uint64_t sub_AC28(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

unsigned char *sub_AE2C(unsigned char *a1)
{
  if (a1[8]) {
    (*(void (**)(void))(**(void **)a1 + 24))();
  }
  return a1;
}

uint64_t sub_AE84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    sub_AEDC();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v3 + 48))(v3, &v6, &v5);
}

void sub_AEDC()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_24A30;
}

void sub_AF2C(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

uint64_t sub_AF64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    sub_AEDC();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t sub_AFB8@<X0>(unsigned int *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = (char *)operator new(0x1A0uLL);
  uint64_t result = sub_B014((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_B000(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_B014(uint64_t a1, unsigned int *a2)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = off_24A58;
  AOPAudioDeviceHWManager::AOPAudioDeviceHWManager((AOPAudioDeviceHWManager *)(a1 + 24), *a2);
  return a1;
}

void sub_B060(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_B074(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24A58;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_B094(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24A58;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_B0E8(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void sub_B110(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *sub_B184@<X0>(const char *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x70uLL);
  uint64_t result = sub_B1E0(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_B1CC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_B1E0(void *a1, const char *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24A90;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CAMutex *)(a1 + 3), a2);
  return a1;
}

void sub_B228(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_B23C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24A90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_B25C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24A90;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_B2B0(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *sub_B2D8@<X0>(const char *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x70uLL);
  uint64_t result = sub_B334(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_B320(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_B334(void *a1, const char *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24A90;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CAMutex *)(a1 + 3), a2);
  return a1;
}

void sub_B37C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void *sub_B390(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  if (v13)
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unint64_t v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_B534(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_B4CC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0xB4ACLL);
}

void sub_B520(_Unwind_Exception *a1)
{
}

uint64_t sub_B534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      sub_B6BC(__p, v12, __c);
      char v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_B6A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_B6BC(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_B768();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void sub_B768()
{
}

void sub_B780(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_B8F0(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_B9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_BBA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BBE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BC88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BD70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_BEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_BFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_C090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_C4A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  sub_AC28((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFString *CACFString::GetStringByteLength(const __CFString *this, const __CFString *a2)
{
  CFIndex usedBufLen = 0;
  if (this)
  {
    CFStringEncoding v2 = a2;
    CFStringRef v3 = this;
    v5.length = CFStringGetLength(this);
    v5.location = 0;
    CFStringGetBytes(v3, v5, v2, 0, 0, 0, 0x7FFFFFFFLL, &usedBufLen);
    return (const __CFString *)usedBufLen;
  }
  return this;
}

const __CFString *CACFString::GetCString(const __CFString *theString, __CFString *a2, char *a3, unsigned int *a4)
{
  if (*(_DWORD *)a3)
  {
    CFStringRef v6 = theString;
    if (theString)
    {
      CFStringEncoding v7 = a4;
      CFIndex usedBufLen = 0;
      v11.length = CFStringGetLength(theString);
      v11.location = 0;
      theCFDictionaryRef String = (const __CFString *)CFStringGetBytes(v6, v11, v7, 0, 0, (UInt8 *)a2, (*(_DWORD *)a3 - 1), &usedBufLen);
      int v8 = usedBufLen;
      *((unsigned char *)&a2->isa + usedBufLen) = 0;
      int v9 = v8 + 1;
    }
    else
    {
      LOBYTE(a2->isa) = 0;
      int v9 = 1;
    }
    *(_DWORD *)a3 = v9;
  }
  return theString;
}

void CACFString::GetUnicodeString(CFStringRef theString, __CFString *a2, unsigned __int16 *a3, unsigned int *a4)
{
  if (*(_DWORD *)a3)
  {
    if (theString)
    {
      CFIndex Length = CFStringGetLength(theString);
      if (*(_DWORD *)a3 >= Length) {
        CFIndex v8 = Length;
      }
      else {
        CFIndex v8 = *(unsigned int *)a3;
      }
      v9.location = 0;
      v9.length = v8;
      CFStringGetCharacters(theString, v9, (UniChar *)a2);
    }
    else
    {
      LODWORD(v8) = 0;
      LOWORD(a2->isa) = 0;
    }
    *(_DWORD *)a3 = v8;
  }
}

void CACFString::PrintToLog(const __CFString *this, const __CFString *a2)
{
  LODWORD(v2) = a2;
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
  *(_OWORD *)buffer = 0u;
  long long v9 = 0u;
  memset(__b, 0, sizeof(__b));
  if (CFStringGetCString(this, buffer, 512, 0x600u))
  {
    if (v2)
    {
      uint64_t v2 = v2;
      memset(__b, 9, v2);
    }
    else
    {
      uint64_t v2 = 0;
    }
    *((unsigned char *)__b + v2) = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315394;
      uint64_t v4 = __b;
      __int16 v5 = 2080;
      CFStringRef v6 = buffer;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " %s%s", (uint8_t *)&v3, 0x16u);
    }
  }
}

void CACFLocalMessagePort::CACFLocalMessagePort(CACFLocalMessagePort *this, const __CFString *a2, CFDataRef (__cdecl *a3)(CFMessagePortRef, SInt32, CFDataRef, void *), void (__cdecl *a4)(CFMessagePortRef, void *), void *a5)
{
  *(void *)this = off_24AC8;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  context.version = 0;
  context.info = a5;
  memset(&context.retain, 0, 24);
  CFStringEncoding v7 = CFMessagePortCreateLocal(0, a2, a3, &context, 0);
  *((void *)this + 1) = v7;
  if (a4)
  {
    if (v7) {
      CFMessagePortSetInvalidationCallBack(v7, a4);
    }
  }
}

void CACFLocalMessagePort::~CACFLocalMessagePort(CACFLocalMessagePort *this)
{
  *(void *)this = off_24AC8;
  uint64_t v2 = (const void *)*((void *)this + 2);
  if (v2) {
    CFRelease(v2);
  }
  int v3 = (__CFMessagePort *)*((void *)this + 1);
  if (v3)
  {
    CFMessagePortInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 1));
  }
}

{
  uint64_t vars8;

  CACFLocalMessagePort::~CACFLocalMessagePort(this);

  operator delete();
}

void CACFLocalMessagePort::GetRunLoopSource(CACFLocalMessagePort *this)
{
  if (*((void *)this + 3))
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_18FF4(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    __break(1u);
  }
  else if (!*((void *)this + 2))
  {
    *((void *)this + 2) = CFMessagePortCreateRunLoopSource(0, *((CFMessagePortRef *)this + 1), 0);
  }
}

void CACFLocalMessagePort::SetDispatchQueue(CACFLocalMessagePort *this, NSObject *a2)
{
  if (*((void *)this + 2))
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_18FF4(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    __break(1u);
  }
  else
  {
    *((void *)this + 3) = a2;
    uint64_t v2 = (__CFMessagePort *)*((void *)this + 1);
    CFMessagePortSetDispatchQueue(v2, a2);
  }
}

void CACFRemoteMessagePort::CACFRemoteMessagePort(CACFRemoteMessagePort *this, const __CFString *a2, void (__cdecl *a3)(CFMessagePortRef, void *))
{
  *(void *)this = off_24AE8;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  Remote = CFMessagePortCreateRemote(0, a2);
  *((void *)this + 1) = Remote;
  if (a3)
  {
    if (Remote) {
      CFMessagePortSetInvalidationCallBack(Remote, a3);
    }
  }
}

void CACFRemoteMessagePort::~CACFRemoteMessagePort(CACFRemoteMessagePort *this)
{
  *(void *)this = off_24AE8;
  uint64_t v2 = (const void *)*((void *)this + 2);
  if (v2) {
    CFRelease(v2);
  }
  BOOL v3 = (const void *)*((void *)this + 1);
  if (v3) {
    CFRelease(v3);
  }
}

{
  uint64_t vars8;

  CACFRemoteMessagePort::~CACFRemoteMessagePort(this);

  operator delete();
}

void CACFRemoteMessagePort::GetRunLoopSource(CACFRemoteMessagePort *this)
{
  if (*((void *)this + 3))
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_19030(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    __break(1u);
  }
  else if (!*((void *)this + 2))
  {
    *((void *)this + 2) = CFMessagePortCreateRunLoopSource(0, *((CFMessagePortRef *)this + 1), 0);
  }
}

void CACFRemoteMessagePort::SetDispatchQueue(CACFRemoteMessagePort *this, NSObject *a2)
{
  if (*((void *)this + 2))
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_19030(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    __break(1u);
  }
  else
  {
    *((void *)this + 3) = a2;
    uint64_t v2 = (__CFMessagePort *)*((void *)this + 1);
    CFMessagePortSetDispatchQueue(v2, a2);
  }
}

CADeprecated::CAMutex *CADeprecated::CAMutex::CAMutex(CADeprecated::CAMutex *this, const char *a2)
{
  *(void *)this = off_24B08;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = 0;
  int v3 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 24), 0);
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_1906C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = v5;
  }
  return this;
}

void CADeprecated::CAMutex::~CAMutex(CADeprecated::CAMutex *this)
{
  *(void *)this = off_24B08;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  uint64_t vars8;

  CADeprecated::CAMutex::~CAMutex(this);

  operator delete();
}

uint64_t CADeprecated::CAMutex::Try(CADeprecated::CAMutex *this, BOOL *a2)
{
  *a2 = 0;
  uint64_t v4 = pthread_self();
  if (pthread_equal(v4, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)this + 2, memory_order_acquire)))
  {
    BOOL v5 = 0;
  }
  else
  {
    int v6 = pthread_mutex_trylock((pthread_mutex_t *)((char *)this + 24));
    if (v6 == 16)
    {
      BOOL v5 = 0;
      uint64_t result = 0;
      goto LABEL_7;
    }
    if (v6)
    {
      v10[0] = HIBYTE(v6);
      v10[1] = BYTE2(v6);
      v10[2] = BYTE1(v6);
      int v8 = v6;
      v10[3] = v6;
      v10[4] = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_19120((uint64_t)v10, v8);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = v8;
    }
    atomic_store((unint64_t)v4, (unint64_t *)this + 2);
    BOOL v5 = 1;
  }
  uint64_t result = 1;
LABEL_7:
  *a2 = v5;
  return result;
}

BOOL CADeprecated::CAMutex::IsFree(atomic_ullong *this)
{
  return atomic_load_explicit(this + 2, memory_order_acquire) == 0;
}

BOOL CADeprecated::CAMutex::IsOwnedByCurrentThread(atomic_ullong *this)
{
  uint64_t v2 = pthread_self();
  return pthread_equal(v2, (pthread_t)atomic_load_explicit(this + 2, memory_order_acquire)) != 0;
}

void CADeprecated::CAMutex::Unlocker::Unlocker(CADeprecated::CAMutex::Unlocker *this, CADeprecated::CAMutex *a2)
{
  *(void *)this = a2;
  *((unsigned char *)this + 8) = 0;
  if ((*(uint64_t (**)(CADeprecated::CAMutex *))(*(void *)a2 + 48))(a2))
  {
    (*(void (**)(void))(**(void **)this + 24))();
    *((unsigned char *)this + 8) = 1;
  }
  else
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_191AC(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    __break(1u);
  }
}

void CADeprecated::CAMutex::Unlocker::~Unlocker(CADeprecated::CAMutex::Unlocker *this)
{
  if (*((unsigned char *)this + 8)) {
    (*(void (**)(void))(**(void **)this + 16))();
  }
}

float CACFNumber::GetFixed32(const __CFNumber **this)
{
  int valuePtr = 0;
  CFNumberRef v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
    int v2 = valuePtr;
    float v3 = 1.0;
    if (valuePtr < 0) {
      float v3 = -1.0;
    }
  }
  else
  {
    int v2 = 0;
    float v3 = 1.0;
  }
  return v3
       * (float)((float)((float)(unsigned __int16)(v2 * (int)v3) * 0.000015259)
               + (float)(((v2 * (int)v3) >> 16) & 0x7FFF));
}

double CACFNumber::GetFixed64(const __CFNumber **this)
{
  uint64_t valuePtr = 0;
  CFNumberRef v1 = *this;
  if (v1)
  {
    CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
    uint64_t v2 = valuePtr;
    double v3 = 1.0;
    if (valuePtr < 0) {
      double v3 = -1.0;
    }
  }
  else
  {
    uint64_t v2 = 0;
    double v3 = 1.0;
  }
  return v3
       * ((double)(v2 * (uint64_t)v3) * 2.32830644e-10
        + (double)(((unint64_t)(v2 * (uint64_t)v3) >> 32) & 0x7FFFFFFF));
}

void CACFNumber::PrintToLog(CACFNumber *this, const __CFNumber *a2)
{
  LODWORD(v2) = a2;
  CFNumberType Type = CFNumberGetType(this);
  if (v2)
  {
    uint64_t v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    uint64_t v2 = 0;
  }
  __b[v2] = 0;
  switch(Type)
  {
    case kCFNumberSInt8Type:
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v9 = __b;
        __int16 v10 = 1024;
        LODWORD(v11) = SLOBYTE(valuePtr);
        uint64_t v5 = " %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt16Type:
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v9 = __b;
        __int16 v10 = 1024;
        LODWORD(v11) = SLOWORD(valuePtr);
        uint64_t v5 = " %s%i";
        goto LABEL_15;
      }
      break;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberSInt64Type, &valuePtr);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      break;
    case kCFNumberFloat32Type:
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v9 = __b;
        __int16 v10 = 2048;
        double v11 = *(float *)&valuePtr;
        uint64_t v5 = " %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberFloat64Type:
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v9 = __b;
        __int16 v10 = 2048;
        double v11 = valuePtr;
        uint64_t v5 = " %s%f";
        goto LABEL_24;
      }
      break;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongType, &valuePtr);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      break;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberLongLongType, &valuePtr);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:
        *(_DWORD *)buf = 136315394;
        uint64_t v9 = __b;
        __int16 v10 = 2048;
        double v11 = valuePtr;
        uint64_t v5 = " %s%lli";
        goto LABEL_24;
      }
      break;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberGetValue(this, kCFNumberCFIndexType, &valuePtr);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:
        *(_DWORD *)buf = 136315394;
        uint64_t v9 = __b;
        __int16 v10 = 2048;
        double v11 = valuePtr;
        uint64_t v5 = " %s%li";
LABEL_24:
        uint32_t v6 = 22;
        goto LABEL_25;
      }
      break;
    default:
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(this, Type, &valuePtr);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v9 = __b;
        __int16 v10 = 1024;
        LODWORD(v11) = LODWORD(valuePtr);
        uint64_t v5 = " %s%i";
LABEL_15:
        uint32_t v6 = 18;
LABEL_25:
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, buf, v6);
      }
      break;
  }
}

void CACFBoolean::PrintToLog(CACFBoolean *this, const __CFBoolean *a2)
{
  LODWORD(v2) = a2;
  int Value = CFBooleanGetValue(this);
  if (v2)
  {
    uint64_t v2 = v2;
    memset(__b, 9, v2);
  }
  else
  {
    uint64_t v2 = 0;
  }
  __b[v2] = 0;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (Value)
  {
    if (!v4) {
      return;
    }
    int v6 = 136315138;
    uint64_t v7 = __b;
    uint64_t v5 = " %strue";
  }
  else
  {
    if (!v4) {
      return;
    }
    int v6 = 136315138;
    uint64_t v7 = __b;
    uint64_t v5 = " %sfalse";
  }
  _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v6, 0xCu);
}

void virtual thunk to'CAException::~CAException(CAException *this)
{
}

{
  uint64_t vars8;

  std::exception::~exception((std::exception *)((char *)this + *(void *)(*(void *)this - 24)));

  operator delete();
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);

  operator delete();
}

void CAXException::~CAXException(std::exception *this)
{
  std::exception::~exception(this);

  operator delete();
}

const char *sub_D690()
{
  return "CAException";
}

uint64_t sub_D69C(uint64_t a1)
{
  return a1 + 8;
}

CFPropertyListRef CACFPreferences::CopyValue(const __CFString *this, __CFString *a2, int a3)
{
  int v4 = (int)a2;
  CACFPreferences::Synchronize((CACFPreferences *)a2, a3, 0);
  int v6 = &kCFPreferencesCurrentUser;
  if (!v4) {
    int v6 = &kCFPreferencesAnyUser;
  }
  CFStringRef v7 = *v6;
  uint64_t v8 = &kCFPreferencesCurrentHost;
  if (!a3) {
    uint64_t v8 = &kCFPreferencesAnyHost;
  }
  CFStringRef v9 = *v8;

  return CFPreferencesCopyValue(this, kCFPreferencesAnyApplication, v7, v9);
}

uint64_t CACFPreferences::Synchronize(CACFPreferences *this, int a2, char a3)
{
  int v4 = (int)this;
  if ((a3 & 1) != 0 || (uint64_t result = CACFPreferences::ArePrefsOutOfDate(this, a2), result))
  {
    int v6 = &kCFPreferencesCurrentUser;
    if (!v4) {
      int v6 = &kCFPreferencesAnyUser;
    }
    CFStringRef v7 = *v6;
    uint64_t v8 = (CFStringRef *)&kCFPreferencesCurrentHost;
    if (!a2) {
      uint64_t v8 = (CFStringRef *)&kCFPreferencesAnyHost;
    }
    uint64_t result = CFPreferencesSynchronize(kCFPreferencesAnyApplication, v7, *v8);
    if ((v4 & 1) != 0 || a2)
    {
      if (((a2 ^ 1) & 1) != 0 || v4)
      {
        if (((v4 ^ 1) & 1) != 0 || a2)
        {
          if ((v4 ^ 1 | a2 ^ 1)) {
            return result;
          }
          CFStringRef v9 = &CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
        }
        else
        {
          CFStringRef v9 = &CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
        }
      }
      else
      {
        CFStringRef v9 = &CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
      }
    }
    else
    {
      CFStringRef v9 = &CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
    }
    *CFStringRef v9 = 0;
  }
  return result;
}

const void *CACFPreferences::CopyStringValue(const __CFString *this, __CFString *a2, int a3)
{
  CFPropertyListRef v3 = CACFPreferences::CopyValue(this, a2, a3);
  int v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v7 = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CACFPreferences::CopyStringValue: not a CFString", v7, 2u);
      }
      return 0;
    }
  }
  return v4;
}

const void *CACFPreferences::CopyNumberValue(const __CFString *this, __CFString *a2, int a3)
{
  CFPropertyListRef v3 = CACFPreferences::CopyValue(this, a2, a3);
  int v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFNumberGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v7 = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CACFPreferences::CopyNumberValue: not a CFNumber", v7, 2u);
      }
      return 0;
    }
  }
  return v4;
}

const void *CACFPreferences::CopyArrayValue(const __CFString *this, __CFString *a2, int a3)
{
  CFPropertyListRef v3 = CACFPreferences::CopyValue(this, a2, a3);
  int v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFArrayGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v7 = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CACFPreferences::CopyArrayValue: not a CFArray", v7, 2u);
      }
      return 0;
    }
  }
  return v4;
}

const void *CACFPreferences::CopyDictionaryValue(const __CFString *this, __CFString *a2, int a3)
{
  CFPropertyListRef v3 = CACFPreferences::CopyValue(this, a2, a3);
  int v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFDictionaryGetTypeID())
    {
      CFRelease(v4);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v7 = 0;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CACFPreferences::CopyDictionaryValue: not a CFDictionary", v7, 2u);
      }
      return 0;
    }
  }
  return v4;
}

CFDictionaryRef CACFPreferences::CopyMultipleValues(CACFPreferences *this, const __CFArray *a2, int a3)
{
  int v4 = (int)a2;
  CACFPreferences::Synchronize(a2, a3, 0);
  int v6 = &kCFPreferencesCurrentUser;
  if (!v4) {
    int v6 = &kCFPreferencesAnyUser;
  }
  CFStringRef v7 = *v6;
  uint64_t v8 = &kCFPreferencesCurrentHost;
  if (!a3) {
    uint64_t v8 = &kCFPreferencesAnyHost;
  }
  CFStringRef v9 = *v8;

  return CFPreferencesCopyMultiple(this, kCFPreferencesAnyApplication, v7, v9);
}

void CACFPreferences::SetValue(const __CFString *this, const __CFString *a2, CACFPreferences *a3, int a4, int a5)
{
  uint64_t v8 = &kCFPreferencesCurrentUser;
  if (!a3) {
    uint64_t v8 = &kCFPreferencesAnyUser;
  }
  CFStringRef v9 = *v8;
  __int16 v10 = (CFStringRef *)&kCFPreferencesCurrentHost;
  if (!a4) {
    __int16 v10 = (CFStringRef *)&kCFPreferencesAnyHost;
  }
  CFPreferencesSetValue(this, a2, kCFPreferencesAnyApplication, v9, *v10);
  if (a5)
  {
    CACFPreferences::Synchronize(a3, a4, 1);
  }
}

void CACFPreferences::DeleteValue(const __CFString *this, const __CFString *a2, int a3, int a4)
{
  int v6 = &kCFPreferencesCurrentUser;
  if (!a2) {
    int v6 = &kCFPreferencesAnyUser;
  }
  CFStringRef v7 = *v6;
  uint64_t v8 = (CFStringRef *)&kCFPreferencesCurrentHost;
  if (!a3) {
    uint64_t v8 = (CFStringRef *)&kCFPreferencesAnyHost;
  }
  CFPreferencesSetValue(this, 0, kCFPreferencesAnyApplication, v7, *v8);
  if (a4)
  {
    CACFPreferences::Synchronize((CACFPreferences *)(v7 != 0), a3, 1);
  }
}

BOOL CACFPreferences::ArePrefsOutOfDate(CACFPreferences *this, int a2)
{
  if (this & 1) != 0 || (a2)
  {
    if ((a2 ^ 1) & 1) != 0 || (this)
    {
      if ((this ^ 1) & 1) != 0 || (a2)
      {
        if ((this ^ 1 | a2 ^ 1)) {
          return 0;
        }
        int v2 = CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
      }
      else
      {
        int v2 = CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
      }
    }
    else
    {
      int v2 = CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
    }
  }
  else
  {
    int v2 = CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
  }
  return v2 != 0;
}

uint64_t CACFPreferences::MarkPrefsClean(uint64_t this, int a2)
{
  if ((this & 1) != 0 || a2)
  {
    if (((a2 ^ 1) & 1) != 0 || this)
    {
      if (((this ^ 1) & 1) != 0 || a2)
      {
        if ((this ^ 1 | a2 ^ 1)) {
          return this;
        }
        int v2 = &CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
      }
      else
      {
        int v2 = &CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
      }
    }
    else
    {
      int v2 = &CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
    }
  }
  else
  {
    int v2 = &CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
  }
  char *v2 = 0;
  return this;
}

uint64_t CACFPreferences::MarkPrefsOutOfDate(uint64_t this, int a2)
{
  if ((this & 1) != 0 || a2)
  {
    if (((a2 ^ 1) & 1) != 0 || this)
    {
      if (((this ^ 1) & 1) != 0 || a2)
      {
        if ((this ^ 1 | a2 ^ 1)) {
          return this;
        }
        int v2 = &CACFPreferences::sCurrentUserCurrentHostPrefsOutOfDate;
      }
      else
      {
        int v2 = &CACFPreferences::sCurrentUserAnyHostPrefsOutOfDate;
      }
    }
    else
    {
      int v2 = &CACFPreferences::sAnyUserCurrentHostPrefsOutOfDate;
    }
  }
  else
  {
    int v2 = &CACFPreferences::sAnyUserAnyHostPrefsOutOfDate;
  }
  char *v2 = 1;
  return this;
}

void CACFPreferences::SendNotification(const __CFString *this, const __CFString *a2)
{
}

void LogError(const char *a1, ...)
{
  va_start(va, a1);
  vsyslog(3, a1, va);
}

void LogWarning(const char *a1, ...)
{
  va_start(va, a1);
  vsyslog(4, a1, va);
}

const __CFArray *CACFArray::HasItem(CFArrayRef *this, const void *a2)
{
  CFArrayRef result = *this;
  if (result)
  {
    v5.length = CFArrayGetCount(result);
    v5.location = 0;
    return (const __CFArray *)(CFArrayContainsValue(*this, v5, a2) != 0);
  }
  return result;
}

const __CFArray *CACFArray::GetIndexOfItem(CFArrayRef *this, const void *a2, unsigned int *a3)
{
  *a3 = 0;
  CFArrayRef result = *this;
  if (result)
  {
    v8.length = CFArrayGetCount(result);
    v8.location = 0;
    FirstIndexOfint Value = CFArrayGetFirstIndexOfValue(*this, v8, a2);
    if (FirstIndexOfValue == -1)
    {
      return 0;
    }
    else
    {
      *a3 = FirstIndexOfValue;
      return (const __CFArray *)(&dword_0 + 1);
    }
  }
  return result;
}

const __CFArray *CACFArray::GetBool(CFArrayRef *this, unsigned int a2, BOOL *a3)
{
  CFTypeRef cf = 0;
  CFArrayRef result = CACFArray::GetCFType(this, a2, &cf);
  if (!result) {
    return result;
  }
  CFTypeRef v5 = cf;
  if (!cf) {
    return 0;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 != CFBooleanGetTypeID())
  {
    CFTypeID v8 = CFGetTypeID(v5);
    if (v8 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr);
      BOOL v7 = valuePtr == 0;
      goto LABEL_7;
    }
    return 0;
  }
  BOOL v7 = CFBooleanGetValue((CFBooleanRef)v5) == 0;
LABEL_7:
  BOOL v9 = !v7;
  *a3 = v9;
  return (const __CFArray *)(&dword_0 + 1);
}

const __CFArray *CACFArray::GetCFType(CFArrayRef *this, unsigned int a2, const void **a3)
{
  CFArrayRef result = *this;
  if (result)
  {
    if (CFArrayGetCount(result) <= a2)
    {
      return 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(*this, a2);
      *a3 = ValueAtIndex;
      return (const __CFArray *)(ValueAtIndex != 0);
    }
  }
  return result;
}

uint64_t CACFArray::GetSInt32(CFArrayRef *this, unsigned int a2, int *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUInt32(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetSInt64(CFArrayRef *this, unsigned int a2, uint64_t *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUInt64(CFArrayRef *this, unsigned int a2, unint64_t *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat32(CFArrayRef *this, unsigned int a2, float *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat32Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetFloat64(CFArrayRef *this, unsigned int a2, double *a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFNumberRef v6 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberFloat64Type, a3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFArray *CACFArray::Get4CC(CFArrayRef *this, unsigned int a2, unsigned int *a3)
{
  CFTypeRef cf = 0;
  CFArrayRef result = CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFNumberRef v5 = (const __CFNumber *)cf;
    if (cf)
    {
      CFTypeID v6 = CFGetTypeID(cf);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
        return (const __CFArray *)(&dword_0 + 1);
      }
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFStringGetLength((CFStringRef)v5) == 4)
      {
        CFStringGetCString((CFStringRef)v5, (char *)&v8, 5, 0x600u);
        *a3 = bswap32(v8);
        return (const __CFArray *)(&dword_0 + 1);
      }
    }
    return 0;
  }
  return result;
}

uint64_t CACFArray::GetString(CFArrayRef *this, unsigned int a2, const __CFString **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFStringRef v6 = (const __CFString *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFStringGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetArray(CFArrayRef *this, unsigned int a2, const __CFArray **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFArrayRef v6 = (const __CFArray *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFArrayGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetDictionary(CFArrayRef *this, unsigned int a2, const __CFDictionary **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFDictionaryRef v6 = (const __CFDictionary *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFDictionaryGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetData(CFArrayRef *this, unsigned int a2, const __CFData **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFDataRef v6 = (const __CFData *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFDataGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetUUID(CFArrayRef *this, unsigned int a2, const __CFUUID **a3)
{
  CFTypeRef cf = 0;
  CFCFNumberType Type = CACFArray::GetCFType(this, a2, &cf);
  uint64_t result = 0;
  if (CFType)
  {
    CFUUIDRef v6 = (const __CFUUID *)cf;
    if (cf)
    {
      CFTypeID v7 = CFGetTypeID(cf);
      if (v7 == CFUUIDGetTypeID())
      {
        *a3 = v6;
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFString(CFArrayRef *this, unsigned int a2, CFTypeRef *a3)
{
  if (*a3)
  {
    if (*((unsigned char *)a3 + 8)) {
      CFRelease(*a3);
    }
    *a3 = 0;
  }
  *((unsigned char *)a3 + 8) = 1;
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      uint64_t result = CFStringGetTypeID();
      if (v8 == result)
      {
        return sub_3A64((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFArray(CFArrayRef *this, unsigned int a2, CACFArray *a3)
{
  sub_5F18((uint64_t)a3, 0);
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      uint64_t result = CFArrayGetTypeID();
      if (v8 == result)
      {
        return sub_5F18((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::GetCACFDictionary(CFArrayRef *this, unsigned int a2, CACFDictionary *a3)
{
  sub_5F18((uint64_t)a3, 0);
  CFTypeRef cf = 0;
  uint64_t result = (uint64_t)CACFArray::GetCFType(this, a2, &cf);
  if (result)
  {
    CFTypeRef v7 = cf;
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      uint64_t result = CFDictionaryGetTypeID();
      if (v8 == result)
      {
        return sub_5F18((uint64_t)a3, v7);
      }
    }
  }
  return result;
}

uint64_t CACFArray::AppendBool(CACFArray *this, int a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  CFPropertyListRef v3 = &kCFBooleanTrue;
  if (!a2) {
    CFPropertyListRef v3 = &kCFBooleanFalse;
  }
  CFBooleanRef v4 = *v3;
  CFBooleanRef v7 = v4;
  char v8 = 1;
  if (v4 && (CFRetain(v4), *(void *)this) && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v4);
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  sub_69AC((uint64_t)&v7);
  return v5;
}

void sub_E8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

__CFArray *CACFArray::AppendCFType(__CFArray **this, const void *a2)
{
  uint64_t result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue(result, a2);
      return (__CFArray *)(&dword_0 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CACFArray::AppendSInt32(CACFArray *this, int a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_4AC8((uint64_t)&v6);
  return v4;
}

void sub_E998(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt32(CACFArray *this, int a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_4AC8((uint64_t)&v6);
  return v4;
}

void sub_EA40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendSInt64(CACFArray *this, uint64_t a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_4AC8((uint64_t)&v6);
  return v4;
}

void sub_EAE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendUInt64(CACFArray *this, uint64_t a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_4AC8((uint64_t)&v6);
  return v4;
}

void sub_EB90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat32(CACFArray *this, float a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  float valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_4AC8((uint64_t)&v6);
  return v4;
}

void sub_EC38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t CACFArray::AppendFloat64(CACFArray *this, double a2)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  double valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v6 = v3;
  char v7 = 1;
  if (v3 && *(void *)this && *((unsigned char *)this + 9))
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)this, v3);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  sub_4AC8((uint64_t)&v6);
  return v4;
}

void sub_ECE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

__CFArray *CACFArray::AppendString(__CFArray **this, const __CFString *a2)
{
  uint64_t result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue(result, a2);
      return (__CFArray *)(&dword_0 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFArray *CACFArray::AppendArray(__CFArray **this, const __CFArray *a2)
{
  uint64_t result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue(result, a2);
      return (__CFArray *)(&dword_0 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFArray *CACFArray::AppendDictionary(__CFArray **this, const __CFDictionary *a2)
{
  uint64_t result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue(result, a2);
      return (__CFArray *)(&dword_0 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFArray *CACFArray::AppendData(__CFArray **this, const __CFData *a2)
{
  uint64_t result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      CFArrayAppendValue(result, a2);
      return (__CFArray *)(&dword_0 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertBool(CACFArray *this, unsigned int a2, int a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t v4 = &kCFBooleanTrue;
  if (!a3) {
    uint64_t v4 = &kCFBooleanFalse;
  }
  CFBooleanRef v5 = *v4;
  CFBooleanRef v9 = v5;
  char v10 = 1;
  if (v5)
  {
    CFRetain(v5);
    CFArrayRef inserted = CACFArray::InsertCFType((const __CFArray **)this, a2, v5);
  }
  else
  {
    CFArrayRef inserted = 0;
  }
  sub_69AC((uint64_t)&v9);
  return inserted;
}

void sub_EE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const __CFArray *CACFArray::InsertCFType(const __CFArray **this, unsigned int a2, const void *a3)
{
  CFArrayRef result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9))
    {
      unsigned int Count = CFArrayGetCount(result);
      char v8 = *this;
      if (Count <= a2) {
        CFArrayAppendValue(v8, a3);
      }
      else {
        CFArrayInsertValueAtIndex(v8, a2, a3);
      }
      return (const __CFArray *)(&dword_0 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::InsertSInt32(CACFArray *this, unsigned int a2, int a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((const __CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return inserted;
}

void sub_EF98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt32(CACFArray *this, unsigned int a2, int a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((const __CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return inserted;
}

void sub_F03C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertSInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((const __CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return inserted;
}

void sub_F0E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertUInt64(CACFArray *this, unsigned int a2, uint64_t a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((const __CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return inserted;
}

void sub_F184(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat32(CACFArray *this, unsigned int a2, float a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  float valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((const __CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return inserted;
}

void sub_F228(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::InsertFloat64(CACFArray *this, unsigned int a2, double a3)
{
  if (!*(void *)this || !*((unsigned char *)this + 9)) {
    return 0;
  }
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v8 = v5;
  char v9 = 1;
  if (v5) {
    CFArrayRef inserted = CACFArray::InsertCFType((const __CFArray **)this, a2, v5);
  }
  else {
    CFArrayRef inserted = 0;
  }
  sub_4AC8((uint64_t)&v8);
  return inserted;
}

void sub_F2CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetBool(const __CFArray **this, unsigned int a2, int a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  char v9 = &kCFBooleanTrue;
  if (!a3) {
    char v9 = &kCFBooleanFalse;
  }
  CFBooleanRef v10 = *v9;
  CFBooleanRef v11 = v10;
  char v12 = 1;
  if (v10)
  {
    CFRetain(v10);
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v10);
  }
  else
  {
    CFArrayRef v7 = 0;
  }
  sub_69AC((uint64_t)&v11);
  return v7;
}

void sub_F3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

const __CFArray *CACFArray::SetCFType(CFMutableArrayRef *this, unsigned int a2, const void *a3)
{
  CFArrayRef result = *this;
  if (result)
  {
    if (*((unsigned char *)this + 9) && CFArrayGetCount(result) >= a2)
    {
      CFArraySetValueAtIndex(*this, a2, a3);
      return (const __CFArray *)(&dword_0 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *CACFArray::SetSInt32(const __CFArray **this, unsigned int a2, int a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  sub_4AC8((uint64_t)&v10);
  return v7;
}

void sub_F4CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt32(const __CFArray **this, unsigned int a2, int a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  int valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  sub_4AC8((uint64_t)&v10);
  return v7;
}

void sub_F588(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetSInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  sub_4AC8((uint64_t)&v10);
  return v7;
}

void sub_F644(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetUInt64(const __CFArray **this, unsigned int a2, uint64_t a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  uint64_t valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  sub_4AC8((uint64_t)&v10);
  return v7;
}

void sub_F700(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat32(const __CFArray **this, unsigned int a2, float a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  float valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  sub_4AC8((uint64_t)&v10);
  return v7;
}

void sub_F7BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFArray *CACFArray::SetFloat64(const __CFArray **this, unsigned int a2, double a3)
{
  CFArrayRef v4 = *this;
  if (!v4 || !*((unsigned char *)this + 9) || CFArrayGetCount(v4) < a2) {
    return 0;
  }
  double valuePtr = a3;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberFloat64Type, &valuePtr);
  CFNumberRef v10 = v9;
  char v11 = 1;
  if (v9) {
    CFArrayRef v7 = CACFArray::SetCFType(this, a2, v9);
  }
  else {
    CFArrayRef v7 = 0;
  }
  sub_4AC8((uint64_t)&v10);
  return v7;
}

void sub_F878(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_4AC8((uint64_t)va);
  _Unwind_Resume(a1);
}

void CACFArray::PrintToLog(CACFArray *this, const __CFArray *a2)
{
  CFIndex Count = CFArrayGetCount(this);
  if (a2)
  {
    uint64_t v5 = a2;
    memset(__b, 9, a2);
  }
  else
  {
    uint64_t v5 = 0;
  }
  __b[v5] = 0;
  if (Count >= 1)
  {
    CFIndex v6 = 0;
    unsigned int v11 = a2 + 1;
    do
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = __b;
        __int16 v14 = 1024;
        int v15 = v6;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " %sitem %d", buf, 0x12u);
      }
      ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(this, v6);
      CFTypeID v8 = CFGetTypeID(ValueAtIndex);
      if (v8 == CFBooleanGetTypeID())
      {
        CACFBoolean::PrintToLog((CACFBoolean *)ValueAtIndex, a2);
      }
      else if (v8 == CFNumberGetTypeID())
      {
        CACFNumber::PrintToLog((CACFNumber *)ValueAtIndex, a2);
      }
      else if (v8 == CFStringGetTypeID())
      {
        CACFString::PrintToLog(ValueAtIndex, (const __CFString *)a2);
      }
      else if (v8 == CFDictionaryGetTypeID())
      {
        CACFDictionary::PrintToLog((CACFDictionary *)ValueAtIndex, (const __CFDictionary *)v11, v9);
      }
      else if (v8 == CFArrayGetTypeID())
      {
        CACFArray::PrintToLog((CACFArray *)ValueAtIndex, (const __CFArray *)v11, v10);
      }
      ++v6;
    }
    while (Count != v6);
  }
}

char *CAAudioChannelLayout::Create(CAAudioChannelLayout *this)
{
  unsigned int v1 = this;
  int v2 = sub_5398(this, 0x14u);
  unsigned int v3 = sub_540C(12, v2);
  CFArrayRef v4 = (char *)malloc_type_malloc(v3, 0x2C8E6D5CuLL);
  uint64_t v5 = v4;
  if (v3 && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unsigned int v10 = std::bad_alloc::bad_alloc(exception);
  }
  bzero(v4, v3);
  if (v5)
  {
    *(void *)uint64_t v5 = 0;
    *((_DWORD *)v5 + 2) = v1;
    if (v1)
    {
      uint64_t v6 = v1;
      CFArrayRef v7 = v5 + 16;
      do
      {
        *((_DWORD *)v7 - 1) = -1;
        *CFArrayRef v7 = 0;
        v7[1] = 0;
        CFArrayRef v7 = (void *)((char *)v7 + 20);
        --v6;
      }
      while (v6);
    }
  }
  return v5;
}

uint64_t CAAudioChannelLayout::SetAllToUnknown(uint64_t this, AudioChannelLayout *a2)
{
  *(void *)this = 0;
  *(_DWORD *)(this + 8) = a2;
  if (a2)
  {
    uint64_t v2 = a2;
    unsigned int v3 = (void *)(this + 16);
    do
    {
      *((_DWORD *)v3 - 1) = -1;
      *unsigned int v3 = 0;
      v3[1] = 0;
      unsigned int v3 = (void *)((char *)v3 + 20);
      --v2;
    }
    while (v2);
  }
  return this;
}

uint64_t CAAudioChannelLayout::NumberChannels(CAAudioChannelLayout *this, const AudioChannelLayout *a2)
{
  if (*(_DWORD *)this == 0x10000)
  {
    uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)*((unsigned int *)this + 1));
    v3.i16[0] = vaddlv_u8(v3);
    return v3.u32[0];
  }
  else if (*(_DWORD *)this)
  {
    return (unsigned __int16)*(_DWORD *)this;
  }
  else
  {
    return *((unsigned int *)this + 2);
  }
}

size_t CAShowAudioChannelLayout(FILE *__stream, _DWORD *a2)
{
  if (a2)
  {
    fprintf(__stream, "\tTag=0x%X, ", *a2);
    if (*a2 == 0x10000)
    {
      return fprintf(__stream, "Using Bitmap:0x%X\n", a2[1]);
    }
    else
    {
      size_t result = fprintf(__stream, "Num Chan Descs=%d\n", a2[2]);
      if (a2[2])
      {
        unsigned int v5 = 0;
        uint64_t v6 = (float *)(a2 + 3);
        do
        {
          fprintf(__stream, "\t\tLabel=%d, Flags=0x%X, ", *(_DWORD *)v6, *((_DWORD *)v6 + 1));
          size_t result = fprintf(__stream, "[az=%f,el=%f,dist=%f]\n", v6[2], v6[3], v6[4]);
          ++v5;
          v6 += 5;
        }
        while (v5 < a2[2]);
      }
    }
  }
  else
  {
    return fwrite("\tNULL layout\n", 0xDuLL, 1uLL, __stream);
  }
  return result;
}

void CACFDistributedNotification::AddObserver(CACFDistributedNotification *this, void (__cdecl *a2)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef), const __CFString *a3, const __CFString *a4, CFNotificationSuspensionBehavior a5)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, this, a2, a3, 0, (CFNotificationSuspensionBehavior)0);
}

void CACFDistributedNotification::RemoveObserver(CACFDistributedNotification *this, const __CFString *a2, const __CFString *a3)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, this, a2, 0);
}

void CACFDistributedNotification::PostNotification(const __CFString *this, const __CFString *a2, const __CFDictionary *a3)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19230();
    }
    goto LABEL_8;
  }
  if (a3)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, this, 0, 0, 0);
  }
  else
  {
    while (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
LABEL_8:
      __break(1u);
    sub_191E8();
    __break(1u);
  }
}

char *CAStringForOSType(unsigned int a1, char *__dst, size_t a3, int16x8_t a4)
{
  a4.i32[0] = bswap32(a1);
  *(int8x8_t *)a4.i8 = vzip1_s8(*(int8x8_t *)a4.i8, *(int8x8_t *)a4.i8);
  v5.i64[0] = 0x1F0000001FLL;
  v5.i64[1] = 0x1F0000001FLL;
  v6.i64[0] = 0x5F0000005FLL;
  v6.i64[1] = 0x5F0000005FLL;
  *(int8x8_t *)a4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v6, (uint32x4_t)vsraq_n_s32(v5, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)a4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)a4.i8, (int8x8_t)0x2E002E002E002ELL);
  char v9 = 4;
  *(_DWORD *)__source = vmovn_s16(a4).u32[0];
  __source[4] = 0;
  strlcpy(__dst, __source, a3);
  if (v9 < 0) {
    operator delete(*(void **)__source);
  }
  return __dst;
}

void sub_FE90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

_DWORD *CAStreamBasicDescription::VirtualizeLinearPCMFormat(_DWORD *this, AudioStreamBasicDescription *a2)
{
  if (this[2] == 1819304813 && (this[3] & 0x40) == 0)
  {
    int v2 = 4 * this[7];
    this[3] = 9;
    this[4] = v2;
    this[5] = 1;
    this[6] = v2;
    this[8] = 32;
  }
  return this;
}

uint64_t CAStreamBasicDescription::VirtualizeLinearPCMFormat(uint64_t this, _DWORD *a2, AudioStreamBasicDescription *a3)
{
  if (a2[2] == 1819304813 && (a2[3] & 0x40) == 0)
  {
    if (this) {
      int v3 = 9;
    }
    else {
      int v3 = 11;
    }
    int v4 = 4 * a2[7];
    a2[3] = v3;
    a2[4] = v4;
    a2[5] = 1;
    a2[6] = v4;
    a2[8] = 32;
  }
  return this;
}

double CAStreamBasicDescription::ResetFormat(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2)
{
  *((_DWORD *)this + 8) = 0;
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t CAStreamBasicDescription::FillOutFormat(uint64_t this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  if (*(double *)this == 0.0) {
    *(Float64 *)this = a2->mSampleRate;
  }
  if (!*(_DWORD *)(this + 8)) {
    *(_DWORD *)(this + 8) = a2->mFormatID;
  }
  if (!*(_DWORD *)(this + 12)) {
    *(_DWORD *)(this + 12) = a2->mFormatFlags;
  }
  if (!*(_DWORD *)(this + 16)) {
    *(_DWORD *)(this + 16) = a2->mBytesPerPacket;
  }
  if (!*(_DWORD *)(this + 20)) {
    *(_DWORD *)(this + 20) = a2->mFramesPerPacket;
  }
  if (!*(_DWORD *)(this + 24)) {
    *(_DWORD *)(this + 24) = a2->mBytesPerFrame;
  }
  if (!*(_DWORD *)(this + 28)) {
    *(_DWORD *)(this + 28) = a2->mChannelsPerFrame;
  }
  if (!*(_DWORD *)(this + 32)) {
    *(_DWORD *)(this + 32) = a2->mBitsPerChannel;
  }
  return this;
}

uint64_t CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2, int a3)
{
  if (!a3) {
    return sub_1009C((uint64_t)this, (uint64_t)a2);
  }
  if (*(double *)this != 0.0 && a2->mSampleRate != 0.0 && *(double *)this != a2->mSampleRate) {
    return 0;
  }
  int v4 = *((_DWORD *)this + 2);
  if (v4)
  {
    AudioFormatID mFormatID = a2->mFormatID;
    if (mFormatID)
    {
      if (v4 != mFormatID) {
        return 0;
      }
    }
  }
  int v6 = *((_DWORD *)this + 4);
  if (v6)
  {
    UInt32 mBytesPerPacket = a2->mBytesPerPacket;
    if (mBytesPerPacket)
    {
      if (v6 != mBytesPerPacket) {
        return 0;
      }
    }
  }
  int v8 = *((_DWORD *)this + 5);
  if (v8)
  {
    UInt32 mFramesPerPacket = a2->mFramesPerPacket;
    if (mFramesPerPacket)
    {
      if (v8 != mFramesPerPacket) {
        return 0;
      }
    }
  }
  int v10 = *((_DWORD *)this + 6);
  if (v10)
  {
    UInt32 mBytesPerFrame = a2->mBytesPerFrame;
    if (mBytesPerFrame)
    {
      if (v10 != mBytesPerFrame) {
        return 0;
      }
    }
  }
  int v12 = *((_DWORD *)this + 7);
  if (v12)
  {
    UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
    if (mChannelsPerFrame)
    {
      if (v12 != mChannelsPerFrame) {
        return 0;
      }
    }
  }
  int v14 = *((_DWORD *)this + 8);
  if (v14)
  {
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
    if (mBitsPerChannel)
    {
      if (v14 != mBitsPerChannel) {
        return 0;
      }
    }
  }
  return sub_10800((uint64_t)this, (uint64_t)a2, 1, 1);
}

BOOL sub_1009C(uint64_t a1, uint64_t a2)
{
  return *(double *)a1 == *(double *)a2
      && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8)
      && *(_DWORD *)(a1 + 12) == *(_DWORD *)(a2 + 12)
      && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16)
      && *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20)
      && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24)
      && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28)
      && *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32);
}

uint64_t CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2)
{
  if (*(double *)this != 0.0 && a2->mSampleRate != 0.0 && *(double *)this != a2->mSampleRate) {
    return 0;
  }
  int v3 = *((_DWORD *)this + 2);
  if (v3)
  {
    AudioFormatID mFormatID = a2->mFormatID;
    if (mFormatID && v3 != mFormatID) {
      return 0;
    }
  }
  int v6 = *((_DWORD *)this + 4);
  if (v6)
  {
    UInt32 mBytesPerPacket = a2->mBytesPerPacket;
    if (mBytesPerPacket)
    {
      if (v6 != mBytesPerPacket) {
        return 0;
      }
    }
  }
  int v8 = *((_DWORD *)this + 5);
  if (v8)
  {
    UInt32 mFramesPerPacket = a2->mFramesPerPacket;
    if (mFramesPerPacket)
    {
      if (v8 != mFramesPerPacket) {
        return 0;
      }
    }
  }
  int v10 = *((_DWORD *)this + 6);
  if (v10)
  {
    UInt32 mBytesPerFrame = a2->mBytesPerFrame;
    if (mBytesPerFrame)
    {
      if (v10 != mBytesPerFrame) {
        return 0;
      }
    }
  }
  int v12 = *((_DWORD *)this + 7);
  if (v12)
  {
    UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
    if (mChannelsPerFrame)
    {
      if (v12 != mChannelsPerFrame) {
        return 0;
      }
    }
  }
  int v14 = *((_DWORD *)this + 8);
  if (v14 && (UInt32 mBitsPerChannel = a2->mBitsPerChannel) != 0 && v14 != mBitsPerChannel) {
    return 0;
  }
  else {
    return sub_10800((uint64_t)this, (uint64_t)a2, 1, 1);
  }
}

BOOL MinimalSafetyCheck(const AudioStreamBasicDescription *a1)
{
  BOOL result = 0;
  if (a1->mSampleRate >= 0.0 && a1->mSampleRate < 3000000.0)
  {
    UInt32 mBytesPerPacket = a1->mBytesPerPacket;
    if (mBytesPerPacket >= 0xF4240) {
      return 0;
    }
    UInt32 mFramesPerPacket = a1->mFramesPerPacket;
    if (mFramesPerPacket >= 0xF4240) {
      return 0;
    }
    UInt32 mBytesPerFrame = a1->mBytesPerFrame;
    if (mBytesPerFrame >= 0xF4240) {
      return 0;
    }
    BOOL result = 0;
    if (a1->mChannelsPerFrame - 1 > 0x3FF || a1->mBitsPerChannel > 0x400) {
      return result;
    }
    AudioFormatID mFormatID = a1->mFormatID;
    if (!mFormatID) {
      return 0;
    }
    BOOL v8 = mFramesPerPacket == 1 && mBytesPerPacket == mBytesPerFrame;
    return mFormatID != 1819304813 || v8;
  }
  return result;
}

uint64_t CAStreamBasicDescription::FromText(CAStreamBasicDescription *this, char *a2, AudioStreamBasicDescription *a3)
{
  if (*(unsigned char *)this == 45) {
    int32x4_t v5 = (CAStreamBasicDescription *)((char *)this + 1);
  }
  else {
    int32x4_t v5 = this;
  }
  int v6 = *(unsigned __int8 *)v5;
  if (v6 == 76)
  {
    uint64_t v7 = 2 * (*((unsigned char *)v5 + 1) == 69);
    int i = 12;
  }
  else
  {
    if (v6 != 66)
    {
      int i = 12;
      goto LABEL_12;
    }
    uint64_t v7 = 2 * (*((unsigned char *)v5 + 1) == 69);
    if (*((unsigned char *)v5 + 1) == 69) {
      int i = 14;
    }
    else {
      int i = 12;
    }
  }
  int32x4_t v5 = (CAStreamBasicDescription *)((char *)v5 + v7);
  int v6 = *(unsigned __int8 *)v5;
LABEL_12:
  switch(v6)
  {
    case 'U':
      i &= 0xAu;
      int v9 = *((unsigned __int8 *)v5 + 1);
      int32x4_t v5 = (CAStreamBasicDescription *)((char *)v5 + 1);
      int v6 = v9;
      break;
    case 'F':
      int i = i & 0xFFFFFFFA | 1;
      goto LABEL_17;
    case 'I':
LABEL_17:
      int v10 = (CAStreamBasicDescription *)((char *)v5 + 1);
      if (*((char *)v5 + 1) < 0)
      {
        int v12 = 0;
      }
      else
      {
        int v11 = *((unsigned __int8 *)v5 + 1);
        if ((_DefaultRuneLocale.__runetype[*((unsigned __int8 *)v5 + 1)] & 0x400) != 0)
        {
          int v12 = 0;
          int v10 = (CAStreamBasicDescription *)((char *)v5 + 2);
          while (1)
          {
            int v12 = v11 + 10 * v12 - 48;
            if (*(char *)v10 < 0) {
              break;
            }
            uint64_t v17 = *(unsigned __int8 *)v10;
            int v11 = *(unsigned __int8 *)v10;
            int v10 = (CAStreamBasicDescription *)((char *)v10 + 1);
            if ((_DefaultRuneLocale.__runetype[v17] & 0x400) == 0)
            {
              int32x4_t v5 = (CAStreamBasicDescription *)((char *)v10 - 2);
              int v10 = (CAStreamBasicDescription *)((char *)v10 - 1);
              goto LABEL_33;
            }
          }
        }
        else
        {
          int v12 = 0;
LABEL_33:
          if (v11 == 46)
          {
            int v20 = *((char *)v5 + 2);
            long long v18 = (CAStreamBasicDescription *)((char *)v5 + 2);
            unsigned __int8 v19 = v20;
            if (v20 < 0 || (uint64_t v21 = v19, (_DefaultRuneLocale.__runetype[v19] & 0x400) == 0))
            {
              long long v22 = __stderrp;
              long long v23 = "Expected fractional bits following '.'\n";
              size_t v24 = 39;
LABEL_37:
              fwrite(v23, v24, 1uLL, v22);
              goto LABEL_101;
            }
            int v28 = 0;
            int v10 = v18;
            do
            {
              if ((_DefaultRuneLocale.__runetype[v21] & 0x400) == 0) {
                break;
              }
              int v29 = *((char *)v10 + 1);
              int v10 = (CAStreamBasicDescription *)((char *)v10 + 1);
              int v28 = 10 * v28 + v21 - 48;
              uint64_t v21 = v29;
            }
            while ((v29 & 0x80000000) == 0);
            v12 += v28;
            i |= v28 << 7;
          }
        }
      }
      unsigned int v27 = 1819304813;
      unsigned int v25 = (v12 + 7) >> 3;
      if ((v12 & 7) != 0) {
        int i = i & 0xFFFFFFE7 | 0x10;
      }
      int v26 = 1;
      goto LABEL_50;
  }
  uint64_t v13 = 0;
  int __c = 538976288;
  int v14 = this;
  int v10 = this;
  while (1)
  {
    int v16 = *(unsigned __int8 *)v10;
    int v10 = (CAStreamBasicDescription *)((char *)v10 + 1);
    int v15 = v16;
    if (v16 == 92)
    {
      if (*(unsigned char *)v10 != 120) {
        return 0;
      }
      int v50 = 0;
      if (sscanf((const char *)v14 + 2, "%02X", &v50) != 1) {
        return 0;
      }
      *((unsigned char *)&__c + v13) = v50;
      int v10 = (CAStreamBasicDescription *)((char *)v14 + 4);
      goto LABEL_26;
    }
    *((unsigned char *)&__c + v13) = v15;
    if (!v15) {
      break;
    }
LABEL_26:
    ++v13;
    int v14 = v10;
    if (v13 == 4) {
      goto LABEL_40;
    }
  }
  if (v13 != 3) {
    return 0;
  }
  HIBYTE(__c) = 32;
  int v10 = v14;
LABEL_40:
  if (memchr("-@/#", SHIBYTE(__c), 5uLL))
  {
    HIBYTE(__c) = 32;
    int v10 = (CAStreamBasicDescription *)((char *)v10 - 1);
  }
  int i = 0;
  unsigned int v25 = 0;
  int v26 = 0;
  int v12 = 0;
  unsigned int v27 = bswap32(__c);
LABEL_50:
  int v30 = *(unsigned __int8 *)v10;
  if (v30 != 64)
  {
    double v32 = 0.0;
    goto LABEL_57;
  }
  int v31 = *((char *)v10 + 1);
  int v10 = (CAStreamBasicDescription *)((char *)v10 + 1);
  LOBYTE(v30) = v31;
  if (v31 < 0) {
    goto LABEL_100;
  }
  double v32 = 0.0;
  while ((_DefaultRuneLocale.__runetype[v30] & 0x400) != 0)
  {
    double v32 = (double)(v30 - 48) + v32 * 10.0;
    int v33 = *((char *)v10 + 1);
    int v10 = (CAStreamBasicDescription *)((char *)v10 + 1);
    LOBYTE(v30) = v33;
    if (v33 < 0) {
      goto LABEL_100;
    }
  }
LABEL_57:
  if (v30 == 47)
  {
    for (int i = 0; ; int i = (v35 + v34) | (16 * i))
    {
      int v10 = (CAStreamBasicDescription *)((char *)v10 + 1);
      int v34 = *(char *)v10;
      if ((v34 - 48) >= 0xA)
      {
        int v30 = *(unsigned __int8 *)v10;
        if ((v30 - 65) >= 6)
        {
          if ((v30 - 97) > 5) {
            break;
          }
          int v35 = -87;
        }
        else
        {
          int v35 = -55;
        }
      }
      else
      {
        int v35 = -48;
      }
    }
  }
  if (v30 != 35)
  {
    unsigned __int8 v36 = v30;
    int v38 = v26;
    goto LABEL_73;
  }
  int v37 = *((char *)v10 + 1);
  int v10 = (CAStreamBasicDescription *)((char *)v10 + 1);
  unsigned __int8 v36 = v37;
  if (v37 < 0) {
    goto LABEL_100;
  }
  int v38 = v26;
  while ((_DefaultRuneLocale.__runetype[v36] & 0x400) != 0)
  {
    int v38 = 10 * v38 + v36 - 48;
    int v39 = *((char *)v10 + 1);
    int v10 = (CAStreamBasicDescription *)((char *)v10 + 1);
    unsigned __int8 v36 = v39;
    if (v39 < 0) {
      goto LABEL_100;
    }
  }
LABEL_73:
  if (v36 != 58)
  {
LABEL_82:
    if (v36 != 44) {
      goto LABEL_99;
    }
    uint64_t v43 = (char *)v10 + 1;
    int v44 = *((unsigned __int8 *)v10 + 1);
    if ((*((char *)v10 + 1) & 0x80000000) == 0
      && (_DefaultRuneLocale.__runetype[*((unsigned __int8 *)v10 + 1)] & 0x400) != 0)
    {
      int v26 = 0;
      uint64_t v45 = (char *)v10 + 2;
      do
      {
        uint64_t v43 = v45;
        int v26 = v44 + 10 * v26 - 48;
        int v46 = *v45;
        int v44 = v46;
        if (v46 < 0) {
          break;
        }
        __uint32_t v47 = _DefaultRuneLocale.__runetype[v46];
        uint64_t v45 = v43 + 1;
      }
      while ((v47 & 0x400) != 0);
      int v10 = (CAStreamBasicDescription *)(v43 - 1);
    }
    else
    {
      int v26 = 0;
    }
    if (v44 == 73)
    {
      uint64_t v43 = (char *)v10 + 2;
    }
    else if (v44 == 68)
    {
      if (v27 != 1819304813)
      {
        long long v22 = __stderrp;
        long long v23 = "non-interleaved flag invalid for non-PCM formats\n";
        size_t v24 = 49;
        goto LABEL_37;
      }
      int v10 = (CAStreamBasicDescription *)((char *)v10 + 2);
      i |= 0x20u;
LABEL_99:
      if (*(unsigned char *)v10) {
        goto LABEL_100;
      }
      *(double *)a2 = v32;
      *((_DWORD *)a2 + 2) = v27;
      *((_DWORD *)a2 + 3) = i;
      *((_DWORD *)a2 + 4) = v25;
      *((_DWORD *)a2 + 5) = v38;
      *((_DWORD *)a2 + 6) = v25;
      *((_DWORD *)a2 + 7) = v26;
      uint64_t result = 1;
      *((_DWORD *)a2 + 8) = v12;
      *((_DWORD *)a2 + 9) = 0;
      return result;
    }
    if (v27 == 1819304813) {
      int v48 = v26;
    }
    else {
      int v48 = 1;
    }
    v25 *= v48;
    int v10 = (CAStreamBasicDescription *)v43;
    goto LABEL_99;
  }
  i &= 0xFFFFFFE7;
  int v40 = *((unsigned __int8 *)v10 + 1);
  if (v40 == 76) {
    goto LABEL_77;
  }
  if (v40 == 72)
  {
    i |= 0x10u;
LABEL_77:
    int v41 = *((char *)v10 + 2);
    int v10 = (CAStreamBasicDescription *)((char *)v10 + 2);
    unsigned __int8 v36 = v41;
    if ((v41 & 0x80000000) == 0)
    {
      unsigned int v25 = 0;
      while ((_DefaultRuneLocale.__runetype[v36] & 0x400) != 0)
      {
        int v42 = *((char *)v10 + 1);
        int v10 = (CAStreamBasicDescription *)((char *)v10 + 1);
        unsigned int v25 = 10 * v25 + v36 - 48;
        unsigned __int8 v36 = v42;
        if (v42 < 0) {
          goto LABEL_100;
        }
      }
      goto LABEL_82;
    }
LABEL_100:
    fprintf(__stderrp, "extra characters at end of format string: %s\n", (const char *)v10);
  }
LABEL_101:
  fprintf(__stderrp, "Invalid format string: %s\n", (const char *)this);
  fwrite("Syntax of format strings is: \n", 0x1EuLL, 1uLL, __stderrp);
  return 0;
}

uint64_t sub_10800(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a4)
  {
    int32x4_t v4 = *(int32x4_t *)(a2 + 8);
    v4.i64[1] = *(void *)(a1 + 8);
    if (vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v4)))) {
      return 1;
    }
  }
  int v6 = *(_DWORD *)(a1 + 12);
  if (*(_DWORD *)(a1 + 8) != 1819304813) {
    return v6 == *(_DWORD *)(a2 + 12);
  }
  int v7 = v6 & 0x7FFFFFFF;
  if ((v6 & 0x7FFFFFFF) == 0) {
    int v7 = *(_DWORD *)(a1 + 12);
  }
  if (a3) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = v7 & 0xFFFFFFBF;
  }
  unsigned int v9 = *(_DWORD *)(a1 + 24);
  if (v9)
  {
    int v10 = *(_DWORD *)(a1 + 28);
    if ((v6 & 0x20) != 0) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = *(_DWORD *)(a1 + 28);
    }
    if (v11)
    {
      unsigned int v9 = 8 * (v9 / v11);
      unsigned int v12 = *(_DWORD *)(a1 + 32);
      int v13 = v8 | 8;
      BOOL v14 = v9 == v12;
      goto LABEL_20;
    }
    unsigned int v9 = 0;
    unsigned int v12 = *(_DWORD *)(a1 + 32);
    int v13 = v8 | 8;
  }
  else
  {
    int v13 = v8 | 8;
    int v10 = *(_DWORD *)(a1 + 28);
    unsigned int v12 = *(_DWORD *)(a1 + 32);
  }
  BOOL v14 = v12 == 0;
LABEL_20:
  if (v14) {
    unsigned int v8 = v13;
  }
  BOOL v16 = (v12 & 7) == 0 && v9 == v12;
  unsigned int v17 = v8 & 0xFFFFFFEF;
  if (!v16) {
    unsigned int v17 = v8;
  }
  if (v17) {
    v17 &= ~4u;
  }
  BOOL v18 = (v17 & 8) == 0 || v12 > 8;
  int v19 = v17 & 2;
  if (v18) {
    int v19 = v17;
  }
  if (v10 == 1) {
    unsigned int v20 = v19 & 0xFFFFFFDF;
  }
  else {
    unsigned int v20 = v19;
  }
  if (!v20) {
    unsigned int v20 = 0x80000000;
  }
  unsigned int v21 = *(_DWORD *)(a2 + 12);
  if (*(_DWORD *)(a2 + 8) != 1819304813) {
    return v20 == v21;
  }
  int v22 = v21 & 0x7FFFFFFF;
  if ((v21 & 0x7FFFFFFF) == 0) {
    int v22 = *(_DWORD *)(a2 + 12);
  }
  if (a3) {
    unsigned int v23 = v22;
  }
  else {
    unsigned int v23 = v22 & 0xFFFFFFBF;
  }
  unsigned int v24 = *(_DWORD *)(a2 + 24);
  if (!v24)
  {
    int v28 = v23 | 8;
    int v25 = *(_DWORD *)(a2 + 28);
    unsigned int v27 = *(_DWORD *)(a2 + 32);
LABEL_53:
    BOOL v29 = v27 == 0;
    goto LABEL_54;
  }
  int v25 = *(_DWORD *)(a2 + 28);
  if ((v21 & 0x20) != 0) {
    unsigned int v26 = 1;
  }
  else {
    unsigned int v26 = *(_DWORD *)(a2 + 28);
  }
  if (!v26)
  {
    unsigned int v24 = 0;
    unsigned int v27 = *(_DWORD *)(a2 + 32);
    int v28 = v23 | 8;
    goto LABEL_53;
  }
  unsigned int v24 = 8 * (v24 / v26);
  unsigned int v27 = *(_DWORD *)(a2 + 32);
  int v28 = v23 | 8;
  BOOL v29 = v24 == v27;
LABEL_54:
  if (v29) {
    unsigned int v23 = v28;
  }
  BOOL v30 = (v27 & 7) == 0 && v24 == v27;
  unsigned int v31 = v23 & 0xFFFFFFEF;
  if (!v30) {
    unsigned int v31 = v23;
  }
  if (v31) {
    v31 &= ~4u;
  }
  BOOL v32 = (v31 & 8) == 0 || v27 > 8;
  int v33 = v31 & 2;
  if (v32) {
    int v33 = v31;
  }
  if (v25 == 1) {
    unsigned int v34 = v33 & 0xFFFFFFDF;
  }
  else {
    unsigned int v34 = v33;
  }
  if (v34) {
    unsigned int v21 = v34;
  }
  else {
    unsigned int v21 = 0x80000000;
  }
  return v20 == v21;
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const char *a2)
{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const char *a2, NSObject *a3)
{
  *(void *)this = off_24BC8;
  *(_OWORD *)((char *)this + 8) = 0u;
  int v6 = (dispatch_queue_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40), "CADispatchQueue::PortDeathListMutex");
  *((void *)this + 16) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152), "CADispatchQueue::PortReceiverListMutex");
  dispatch_queue_t v7 = dispatch_queue_create(a2, a3);
  *int v6 = v7;
  if (!v7)
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_19278(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 2003329396;
  }
  return this;
}

void sub_10AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  CADeprecated::CAMutex::~CAMutex(v12);
  sub_11D88((void ***)&a10);
  CADeprecated::CAMutex::~CAMutex(v11);
  a10 = v10 + 16;
  sub_11D88((void ***)&a10);
  _Unwind_Resume(a1);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const __CFString *a2)
{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const __CFString *a2, NSObject *a3)
{
  *(void *)this = off_24BC8;
  *(_OWORD *)((char *)this + 8) = 0u;
  int v6 = (dispatch_queue_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40), "CADispatchQueue::PortDeathListMutex");
  *((void *)this + 16) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152), "CADispatchQueue::PortReceiverListMutex");
  CFStringRef v19 = a2;
  char v20 = 0;
  *(_DWORD *)BOOL v18 = 256;
  CACFString::GetCString(a2, label, v18, (unsigned int *)0x8000100);
  dispatch_queue_t v7 = dispatch_queue_create((const char *)label, a3);
  *int v6 = v7;
  if (!v7)
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_19278(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 2003329396;
  }
  sub_6970((uint64_t)&v19);
  return this;
}

void sub_10CCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
}

void CADeprecated::CADispatchQueue::~CADispatchQueue(CADeprecated::CADispatchQueue *this)
{
  *(void *)this = off_24BC8;
  int v2 = (void **)((char *)this + 16);
  sub_11DDC((uint64_t *)this + 2);
  if (*((void *)this + 17) == *((void *)this + 16))
  {
    sub_11DDC((uint64_t *)this + 16);
    dispatch_release(*((dispatch_object_t *)this + 1));
    CADeprecated::CAMutex::~CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152));
    uint64_t v11 = (void **)((char *)this + 128);
    sub_11D88(&v11);
    CADeprecated::CAMutex::~CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40));
    uint64_t v11 = v2;
    sub_11D88(&v11);
  }
  else
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_192B4(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    __break(1u);
  }
}

{
  uint64_t vars8;

  CADeprecated::CADispatchQueue::~CADispatchQueue(this);

  operator delete();
}

void CADeprecated::CADispatchQueue::Dispatch(uint64_t a1, int a2, dispatch_block_t block)
{
  BOOL v3 = *(NSObject **)(a1 + 8);
  if (a2) {
    dispatch_sync(v3, block);
  }
  else {
    dispatch_async(v3, block);
  }
}

void CADeprecated::CADispatchQueue::DispatchBarrier(uint64_t a1, int a2, dispatch_block_t block)
{
  BOOL v3 = *(NSObject **)(a1 + 8);
  if (a2) {
    dispatch_barrier_sync(v3, block);
  }
  else {
    dispatch_barrier_async(v3, block);
  }
}

void CADeprecated::CADispatchQueue::Dispatch(uint64_t a1, uint64_t a2, dispatch_block_t block)
{
  if (a2)
  {
    int64_t v5 = __udivti3();
    dispatch_time_t v6 = dispatch_time(0, v5);
    uint64_t v7 = *(NSObject **)(a1 + 8);
    dispatch_after(v6, v7, block);
  }
  else
  {
    uint64_t v8 = *(NSObject **)(a1 + 8);
    dispatch_async(v8, block);
  }
}

void CADeprecated::CADispatchQueue::Dispatch(CADeprecated::CADispatchQueue *this, int a2, void *context, dispatch_function_t work)
{
  uint64_t v4 = *((void *)this + 1);
  if (a2) {
    dispatch_sync_f(v4, context, work);
  }
  else {
    dispatch_async_f(v4, context, work);
  }
}

void CADeprecated::CADispatchQueue::DispatchBarrier(CADeprecated::CADispatchQueue *this, int a2, void *context, dispatch_function_t work)
{
  uint64_t v4 = *((void *)this + 1);
  if (a2) {
    dispatch_barrier_sync_f(v4, context, work);
  }
  else {
    dispatch_barrier_async_f(v4, context, work);
  }
}

void CADeprecated::CADispatchQueue::Dispatch(CADeprecated::CADispatchQueue *this, uint64_t a2, void *context, dispatch_function_t work)
{
  if (a2)
  {
    int64_t v7 = __udivti3();
    dispatch_time_t v8 = dispatch_time(0, v7);
    uint64_t v9 = *((void *)this + 1);
    dispatch_after_f(v8, v9, context, work);
  }
  else
  {
    uint64_t v10 = *((void *)this + 1);
    dispatch_async_f(v10, context, work);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Global(intptr_t a1, int a2, void *a3)
{
  global_queue = dispatch_get_global_queue(a1, 0);
  if (a2)
  {
    dispatch_sync(global_queue, a3);
  }
  else
  {
    dispatch_async(global_queue, a3);
  }
}

void CADeprecated::CADispatchQueue::DispatchAfter_Global(intptr_t a1, uint64_t a2, void *a3)
{
  global_queue = dispatch_get_global_queue(a1, 0);
  dispatch_time_t v6 = global_queue;
  if (a2)
  {
    int64_t v7 = __udivti3();
    dispatch_time_t v8 = dispatch_time(0, v7);
    dispatch_after(v8, v6, a3);
  }
  else
  {
    dispatch_async(global_queue, a3);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Global(CADeprecated::CADispatchQueue *this, int a2, void *a3, void (__cdecl *a4)(void *), void (*a5)(void *))
{
  global_queue = dispatch_get_global_queue((intptr_t)this, 0);
  if (a2)
  {
    dispatch_sync_f(global_queue, a3, a4);
  }
  else
  {
    dispatch_async_f(global_queue, a3, a4);
  }
}

void CADeprecated::CADispatchQueue::DispatchAfter_Global(CADeprecated::CADispatchQueue *this, uint64_t a2, void *a3, void (__cdecl *a4)(void *), void (*a5)(void *))
{
  global_queue = dispatch_get_global_queue((intptr_t)this, 0);
  uint64_t v9 = global_queue;
  if (a2)
  {
    int64_t v10 = __udivti3();
    dispatch_time_t v11 = dispatch_time(0, v10);
    dispatch_after_f(v11, v9, a3, a4);
  }
  else
  {
    dispatch_async_f(global_queue, a3, a4);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Main(int a1, void *a2)
{
  if (a1) {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, a2);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, a2);
  }
}

void CADeprecated::CADispatchQueue::DispatchAfter_Main(uint64_t a1, dispatch_block_t block)
{
  if (a1)
  {
    int64_t v3 = __udivti3();
    dispatch_time_t v4 = dispatch_time(0, v3);
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Main(CADeprecated::CADispatchQueue *this, void *a2, void (__cdecl *a3)(void *), void (*a4)(void *))
{
  if (this) {
    dispatch_sync_f((dispatch_queue_t)&_dispatch_main_q, a2, a3);
  }
  else {
    dispatch_async_f((dispatch_queue_t)&_dispatch_main_q, a2, a3);
  }
}

void CADeprecated::CADispatchQueue::DispatchAfter_Main(CADeprecated::CADispatchQueue *this, void *context, dispatch_function_t work, void (*a4)(void *))
{
  if (this)
  {
    int64_t v6 = __udivti3();
    dispatch_time_t v7 = dispatch_time(0, v6);
    dispatch_after_f(v7, (dispatch_queue_t)&_dispatch_main_q, context, work);
  }
  else
  {
    dispatch_async_f((dispatch_queue_t)&_dispatch_main_q, context, work);
  }
}

unsigned char *CADeprecated::CADispatchQueue::InstallMachPortDeathNotification(uint64_t a1, unsigned int a2, void *a3)
{
  if (!a2)
  {
    BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v23) {
      sub_192F0(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v41 = a1 + 40;
  char v42 = (*(uint64_t (**)(void))(v6 + 16))();
  uint64_t v7 = *(void *)(a1 + 16);
  dispatch_time_t v8 = (void *)(a1 + 16);
  while (v7 != *(void *)(a1 + 24))
  {
    int v9 = *(_DWORD *)(v7 + 8);
    v7 += 16;
    if (v9 == a2) {
      return sub_AE2C(&v41);
    }
  }
  int64_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_send, a2, 1uLL, *(dispatch_queue_t *)(a1 + 8));
  if (!v10)
  {
    BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v32) {
      sub_1932C(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    int v40 = __cxa_allocate_exception(0x10uLL);
    *(void *)int v40 = off_24B68;
    v40[2] = 2003329396;
  }
  dispatch_time_t v11 = v10;
  dispatch_source_set_event_handler(v10, a3);
  unint64_t v12 = *(void *)(a1 + 32);
  unint64_t v13 = *(void *)(a1 + 24);
  if (v13 >= v12)
  {
    uint64_t v15 = (uint64_t)(v13 - *v8) >> 4;
    if ((unint64_t)(v15 + 1) >> 60) {
      sub_6AA4();
    }
    uint64_t v16 = v12 - *v8;
    uint64_t v17 = v16 >> 3;
    if (v16 >> 3 <= (unint64_t)(v15 + 1)) {
      uint64_t v17 = v15 + 1;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v17;
    }
    v43[4] = a1 + 32;
    CFStringRef v19 = (char *)sub_11EAC(a1 + 32, v18);
    char v20 = &v19[16 * v15];
    v43[0] = v19;
    v43[1] = v20;
    v43[3] = &v19[16 * v21];
    *(void *)char v20 = v11;
    *((_DWORD *)v20 + 2) = a2;
    dispatch_retain(v11);
    v43[2] = v20 + 16;
    sub_11E34((uint64_t *)(a1 + 16), v43);
    unint64_t v14 = *(void *)(a1 + 24);
    sub_12010((uint64_t)v43);
  }
  else
  {
    *(void *)unint64_t v13 = v11;
    *(_DWORD *)(v13 + 8) = a2;
    dispatch_retain(v11);
    unint64_t v14 = v13 + 16;
  }
  *(void *)(a1 + 24) = v14;
  dispatch_release(v11);
  dispatch_resume(v11);
  return sub_AE2C(&v41);
}

void sub_115A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  sub_12010((uint64_t)va1);
  dispatch_release(v2);
  sub_AE2C((uint64_t *)va);
  _Unwind_Resume(a1);
}

unsigned char *CADeprecated::CADispatchQueue::RemoveMachPortDeathNotification(CADeprecated::CADispatchQueue *this, int a2)
{
  int64_t v5 = (char *)this + 40;
  uint64_t v4 = *((void *)this + 5);
  unint64_t v18 = (char *)this + 40;
  uint64_t v6 = 0;
  char v19 = (*(uint64_t (**)(char *))(v4 + 16))((char *)this + 40);
  uint64_t v8 = *((void *)v5 - 3);
  uint64_t v7 = *((void *)v5 - 2);
  while (v8 + v6 != v7)
  {
    int v9 = *(_DWORD *)(v8 + v6 + 8);
    v6 += 16;
    if (v9 == a2)
    {
      int64_t v10 = *(NSObject **)(v8 + v6 - 16);
      if (v10)
      {
        dispatch_source_cancel(v10);
        uint64_t v7 = *((void *)this + 3);
      }
      sub_120A0((uint64_t)&v20, v8 + 16 * (v9 != a2) + v6, v7, v8 + 16 * (v9 != a2) + v6 - 16);
      uint64_t v12 = v11;
      uint64_t v13 = *((void *)this + 3);
      if (v13 != v11)
      {
        uint64_t v14 = *((void *)this + 3);
        do
        {
          uint64_t v16 = *(NSObject **)(v14 - 16);
          v14 -= 16;
          uint64_t v15 = v16;
          if (v16)
          {
            dispatch_release(v15);
            *(void *)(v13 - 16) = 0;
          }
          uint64_t v13 = v14;
        }
        while (v14 != v12);
      }
      *((void *)this + 3) = v12;
      return sub_AE2C(&v18);
    }
  }
  return sub_AE2C(&v18);
}

void sub_116EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

unsigned char *CADeprecated::CADispatchQueue::InstallMachPortReceiver(uint64_t a1, unsigned int a2, void *a3)
{
  if (!a2)
  {
    BOOL v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v23) {
      sub_19368(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  uint64_t v6 = *(void *)(a1 + 152);
  uint64_t v41 = a1 + 152;
  char v42 = (*(uint64_t (**)(void))(v6 + 16))();
  uint64_t v7 = *(void *)(a1 + 128);
  uint64_t v8 = (void *)(a1 + 128);
  while (v7 != *(void *)(a1 + 136))
  {
    int v9 = *(_DWORD *)(v7 + 8);
    v7 += 16;
    if (v9 == a2) {
      return sub_AE2C(&v41);
    }
  }
  int64_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, a2, 0, *(dispatch_queue_t *)(a1 + 8));
  if (!v10)
  {
    BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v32) {
      sub_193A4(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    int v40 = __cxa_allocate_exception(0x10uLL);
    *(void *)int v40 = off_24B68;
    v40[2] = 2003329396;
  }
  uint64_t v11 = v10;
  dispatch_source_set_event_handler(v10, a3);
  unint64_t v12 = *(void *)(a1 + 144);
  unint64_t v13 = *(void *)(a1 + 136);
  if (v13 >= v12)
  {
    uint64_t v15 = (uint64_t)(v13 - *v8) >> 4;
    if ((unint64_t)(v15 + 1) >> 60) {
      sub_6AA4();
    }
    uint64_t v16 = v12 - *v8;
    uint64_t v17 = v16 >> 3;
    if (v16 >> 3 <= (unint64_t)(v15 + 1)) {
      uint64_t v17 = v15 + 1;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v17;
    }
    v43[4] = a1 + 144;
    char v19 = (char *)sub_11EAC(a1 + 144, v18);
    char v20 = &v19[16 * v15];
    v43[0] = v19;
    v43[1] = v20;
    v43[3] = &v19[16 * v21];
    *(void *)char v20 = v11;
    *((_DWORD *)v20 + 2) = a2;
    dispatch_retain(v11);
    v43[2] = v20 + 16;
    sub_11E34((uint64_t *)(a1 + 128), v43);
    unint64_t v14 = *(void *)(a1 + 136);
    sub_12010((uint64_t)v43);
  }
  else
  {
    *(void *)unint64_t v13 = v11;
    *(_DWORD *)(v13 + 8) = a2;
    dispatch_retain(v11);
    unint64_t v14 = v13 + 16;
  }
  *(void *)(a1 + 136) = v14;
  dispatch_release(v11);
  dispatch_resume(v11);
  return sub_AE2C(&v41);
}

void sub_1195C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  sub_12010((uint64_t)va1);
  dispatch_release(v2);
  sub_AE2C((uint64_t *)va);
  _Unwind_Resume(a1);
}

unsigned char *CADeprecated::CADispatchQueue::RemoveMachPortReceiver(uint64_t a1, int a2, void *a3)
{
  uint64_t v7 = a1 + 152;
  uint64_t v6 = *(void *)(a1 + 152);
  uint64_t v20 = a1 + 152;
  uint64_t v8 = 0;
  char v21 = (*(uint64_t (**)(uint64_t))(v6 + 16))(a1 + 152);
  uint64_t v10 = *(void *)(v7 - 24);
  uint64_t v9 = *(void *)(v7 - 16);
  while (v10 + v8 != v9)
  {
    int v11 = *(_DWORD *)(v10 + v8 + 8);
    v8 += 16;
    if (v11 == a2)
    {
      unint64_t v12 = *(NSObject **)(v10 + v8 - 16);
      if (v12)
      {
        if (a3)
        {
          dispatch_source_set_cancel_handler(v12, a3);
          unint64_t v12 = *(NSObject **)(v10 + v8 - 16);
        }
        dispatch_source_cancel(v12);
        uint64_t v9 = *(void *)(a1 + 136);
      }
      sub_120A0((uint64_t)&v22, v10 + 16 * (v11 != a2) + v8, v9, v10 + 16 * (v11 != a2) + v8 - 16);
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)(a1 + 136);
      if (v15 != v13)
      {
        uint64_t v16 = *(void *)(a1 + 136);
        do
        {
          unint64_t v18 = *(NSObject **)(v16 - 16);
          v16 -= 16;
          uint64_t v17 = v18;
          if (v18)
          {
            dispatch_release(v17);
            *(void *)(v15 - 16) = 0;
          }
          uint64_t v15 = v16;
        }
        while (v16 != v14);
      }
      *(void *)(a1 + 136) = v14;
      return sub_AE2C(&v20);
    }
  }
  return sub_AE2C(&v20);
}

void sub_11AC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

unsigned char *CADeprecated::CADispatchQueue::RemoveMachPortReceiver(CADeprecated::CADispatchQueue *this, int a2, char a3, char a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_11B48;
  v5[3] = &unk_24BD8;
  char v7 = a3;
  int v6 = a2;
  char v8 = a4;
  return CADeprecated::CADispatchQueue::RemoveMachPortReceiver((uint64_t)this, a2, v5);
}

void sub_11B48(uint64_t a1)
{
  kern_return_t v2;
  kern_return_t v3;
  int v4;
  int v5;

  if (*(unsigned char *)(a1 + 36))
  {
    int v2 = mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 32));
    if (v2)
    {
      uint64_t v4 = v2;
      int64_t v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v3) {
        sub_19460(v4);
      }
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)(a1 + 37))
  {
    int64_t v3 = mach_port_mod_refs(mach_task_self_, *(_DWORD *)(a1 + 32), 1u, -1);
    if (v3)
    {
      while (1)
      {
        int64_t v5 = v3;
        int64_t v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v3) {
          break;
        }
LABEL_8:
        __break(1u);
      }
      sub_193E0(v5);
      __break(1u);
    }
  }
}

uint64_t CADeprecated::CADispatchQueue::GetGlobalSerialQueue(CADeprecated::CADispatchQueue *this)
{
  if (CADeprecated::CADispatchQueue::sGlobalSerialQueueInitialized != -1) {
    dispatch_once_f(&CADeprecated::CADispatchQueue::sGlobalSerialQueueInitialized, 0, (dispatch_function_t)CADeprecated::CADispatchQueue::InitializeGlobalSerialQueue);
  }
  uint64_t result = CADeprecated::CADispatchQueue::sGlobalSerialQueue;
  if (!CADeprecated::CADispatchQueue::sGlobalSerialQueue)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_194E0(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return result;
}

void CADeprecated::CADispatchQueue::InitializeGlobalSerialQueue(CADeprecated::CADispatchQueue *this, void *a2)
{
}

void sub_11CF8()
{
}

void CADeprecated::CADispatchQueue::EventSource::Retain(NSObject **this)
{
  unsigned int v1 = *this;
  if (v1) {
    dispatch_retain(v1);
  }
}

void CADeprecated::CADispatchQueue::EventSource::Release(NSObject **this)
{
  BOOL v2 = *this;
  if (v2)
  {
    dispatch_release(v2);
    *this = 0;
  }
}

void sub_11D88(void ***a1)
{
  BOOL v2 = *a1;
  if (*v2)
  {
    sub_11DDC((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_11DDC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (v3 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(NSObject **)(v4 - 16);
      v4 -= 16;
      uint64_t v5 = v6;
      if (v6)
      {
        dispatch_release(v5);
        *(void *)(v3 - 16) = 0;
      }
      uint64_t v3 = v4;
    }
    while (v4 != v2);
  }
  a1[1] = v2;
}

uint64_t sub_11E34(uint64_t *a1, void *a2)
{
  uint64_t result = sub_11EE4((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_11EAC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_6B84();
  }
  return operator new(16 * a2);
}

uint64_t sub_11EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v17 = a6;
  *((void *)&v17 + 1) = a7;
  long long v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  if (a3 == a5)
  {
    uint64_t v12 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      int v11 = *(NSObject **)(v9 - 16);
      v9 -= 16;
      uint64_t v10 = v11;
      *(void *)(v7 - 16) = v11;
      *(_DWORD *)(v7 - 8) = *(_DWORD *)(v9 + 8);
      if (v11)
      {
        dispatch_retain(v10);
        uint64_t v7 = *((void *)&v17 + 1);
      }
      v7 -= 16;
      *((void *)&v17 + 1) = v7;
    }
    while (v9 != a5);
    uint64_t v12 = v17;
  }
  char v15 = 1;
  sub_11F90((uint64_t)v14);
  return v12;
}

uint64_t sub_11F90(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_11FC8(a1);
  }
  return a1;
}

void sub_11FC8(uint64_t a1)
{
  unsigned int v1 = *(dispatch_object_t **)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(dispatch_object_t **)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*v1)
    {
      dispatch_release(*v1);
      *unsigned int v1 = 0;
    }
    v1 += 2;
  }
}

uint64_t sub_12010(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_12048(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v6 = *(v2 - 2);
    v2 -= 2;
    uint64_t v5 = v6;
    *(void *)(a1 + 16) = v2;
    if (v6)
    {
      dispatch_release(v5);
      void *v2 = 0;
      uint64_t v2 = *(void **)(a1 + 16);
    }
  }
}

uint64_t sub_120A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(void *)a4)
      {
        dispatch_release(*(dispatch_object_t *)a4);
        *(void *)a4 = 0;
      }
      uint64_t v7 = *(NSObject **)v5;
      *(void *)a4 = *(void *)v5;
      *(_DWORD *)(a4 + 8) = *(_DWORD *)(v5 + 8);
      if (v7) {
        dispatch_retain(v7);
      }
      a4 += 16;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void CAVolumeCurve::CAVolumeCurve(CAVolumeCurve *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 1) = (char *)this + 16;
  *((unsigned char *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  *((void *)this + 5) = 0x3F80000040000000;
}

{
  *(_DWORD *)this = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 1) = (char *)this + 16;
  *((unsigned char *)this + 32) = 1;
  *((_DWORD *)this + 9) = 5;
  *((void *)this + 5) = 0x3F80000040000000;
}

uint64_t CAVolumeCurve::GetMinimumRaw(CAVolumeCurve *this)
{
  if (*((void *)this + 3)) {
    return *(unsigned int *)(*((void *)this + 1) + 28);
  }
  else {
    return 0;
  }
}

uint64_t CAVolumeCurve::GetMaximumRaw(CAVolumeCurve *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (!v1) {
    return 0;
  }
  uint64_t v3 = (void *)*((void *)this + 1);
  sub_1286C(&v3, (int)v1 - 1);
  return *((unsigned int *)v3 + 8);
}

double CAVolumeCurve::GetMinimumDB(CAVolumeCurve *this)
{
  if (!*((void *)this + 3)) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(*((void *)this + 1) + 36);
  return result;
}

double CAVolumeCurve::GetMaximumDB(CAVolumeCurve *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (!v1) {
    return 0.0;
  }
  uint64_t v3 = (void *)*((void *)this + 1);
  sub_1286C(&v3, (int)v1 - 1);
  LODWORD(result) = *((_DWORD *)v3 + 10);
  return result;
}

uint64_t CAVolumeCurve::SetTransferFunction(uint64_t this, signed int a2)
{
  *(_DWORD *)(this + 36) = a2;
  if (a2 > 0xF)
  {
    float v4 = 1.0;
    float v3 = 2.0;
    char v2 = 1;
  }
  else
  {
    char v2 = byte_1D710[a2];
    float v3 = flt_1D720[a2];
    float v4 = flt_1D760[a2];
  }
  *(unsigned char *)(this + 32) = v2;
  *(float *)(this + 40) = v3;
  *(float *)(this + 44) = v4;
  return this;
}

void CAVolumeCurve::AddRange(CAVolumeCurve *this, signed int a2, signed int a3, float a4, float a5)
{
  uint64_t v7 = (uint64_t **)*((void *)this + 1);
  uint64_t v5 = (uint64_t **)((char *)this + 8);
  uint64_t v6 = v7;
  if (v7 == v5 + 1) {
    goto LABEL_25;
  }
  do
  {
    int v8 = *((_DWORD *)v6 + 7);
    BOOL v9 = *((_DWORD *)v6 + 8) > a2 && v8 < a3;
    char v10 = v9;
    if (v9 || v8 <= a2)
    {
      uint64_t v12 = v6;
    }
    else
    {
      int v11 = v6[1];
      if (v11)
      {
        do
        {
          uint64_t v12 = (uint64_t **)v11;
          int v11 = (uint64_t *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v12 = (uint64_t **)v6[2];
          BOOL v13 = *v12 == (uint64_t *)v6;
          uint64_t v6 = v12;
        }
        while (!v13);
      }
    }
    if (v12 == v5 + 1) {
      char v14 = 1;
    }
    else {
      char v14 = v10;
    }
    if (v14) {
      break;
    }
    uint64_t v6 = v12;
  }
  while (v8 > a2);
  if ((v10 & 1) == 0)
  {
LABEL_25:
    unint64_t v15 = __PAIR64__(a3, a2);
    float v16 = a4;
    float v17 = a5;
    sub_128F8(v5, (int *)&v15, (uint64_t *)&v15);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CAVolumeCurve::AddRange: new point overlaps", (uint8_t *)&v15, 2u);
  }
}

void CAVolumeCurve::ResetRange(CAVolumeCurve *this)
{
  uint64_t v1 = (void *)((char *)this + 16);
  sub_12BA8((uint64_t)this + 8, *((void **)this + 2));
  *(v1 - 1) = v1;
  *uint64_t v1 = 0;
  v1[1] = 0;
}

BOOL CAVolumeCurve::CheckForContinuity(CAVolumeCurve *this)
{
  uint64_t v1 = (char *)*((void *)this + 1);
  char v2 = (char *)this + 16;
  if (v1 == (char *)this + 16) {
    return 1;
  }
  int v3 = *((_DWORD *)v1 + 7);
  float v4 = *((float *)v1 + 9);
  do
  {
    uint64_t v5 = (char *)*((void *)v1 + 1);
    uint64_t v6 = v1;
    if (v5)
    {
      do
      {
        uint64_t v7 = v5;
        uint64_t v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        uint64_t v7 = (char *)*((void *)v6 + 2);
        BOOL v10 = *(void *)v7 == (void)v6;
        uint64_t v6 = v7;
      }
      while (!v10);
    }
    int v8 = *((_DWORD *)v1 + 7);
    float v9 = *((float *)v1 + 9);
    BOOL v10 = v4 == v9 && v3 == v8;
    BOOL result = v10;
    if (v7 == v2) {
      break;
    }
    int v3 = v3 - v8 + *((_DWORD *)v1 + 8);
    float v4 = v4 + (float)(*((float *)v1 + 10) - v9);
    uint64_t v1 = v7;
  }
  while (result);
  return result;
}

uint64_t CAVolumeCurve::ConvertDBToRaw(CAVolumeCurve *this, float a2)
{
  if (*((void *)this + 3)) {
    float v4 = *(float *)(*((void *)this + 1) + 36);
  }
  else {
    float v4 = 0.0;
  }
  double MaximumDB = CAVolumeCurve::GetMaximumDB(this);
  if (v4 <= a2) {
    float v6 = a2;
  }
  else {
    float v6 = v4;
  }
  if (v6 <= *(float *)&MaximumDB) {
    *(float *)&double MaximumDB = v6;
  }
  uint64_t v7 = (void *)*((void *)this + 1);
  uint64_t result = *((unsigned int *)v7 + 7);
  if (v7 != (void *)((char *)this + 16))
  {
    do
    {
      int v9 = *((_DWORD *)v7 + 8) - *((_DWORD *)v7 + 7);
      float v10 = *((float *)v7 + 10);
      if (*(float *)&MaximumDB > v10)
      {
        uint64_t result = (v9 + result);
      }
      else
      {
        unsigned int v11 = llroundf((float)(*(float *)&MaximumDB - *((float *)v7 + 9))/ (float)((float)(v10 - *((float *)v7 + 9)) / (float)v9));
        BOOL v12 = __OFADD__(result, v11);
        unsigned int v13 = result + v11;
        unsigned int v14 = ((int)(result | v11) >> 31) ^ 0x7FFFFFFF;
        if (v12) {
          uint64_t result = v14;
        }
        else {
          uint64_t result = v13;
        }
      }
      unint64_t v15 = (void *)v7[1];
      if (v15)
      {
        do
        {
          float v16 = v15;
          unint64_t v15 = (void *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          float v16 = (void *)v7[2];
          BOOL v17 = *v16 == (void)v7;
          uint64_t v7 = v16;
        }
        while (!v17);
      }
      BOOL v17 = *(float *)&MaximumDB <= v10 || v16 == (void *)((char *)this + 16);
      uint64_t v7 = v16;
    }
    while (!v17);
  }
  return result;
}

uint64_t CAVolumeCurve::ConvertRawToDB(CAVolumeCurve *this, int a2)
{
  if (*((void *)this + 3)) {
    int v4 = *(_DWORD *)(*((void *)this + 1) + 28);
  }
  else {
    int v4 = 0;
  }
  uint64_t result = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2) {
    int v6 = a2;
  }
  else {
    int v6 = v4;
  }
  if (v6 >= (int)result) {
    int v6 = result;
  }
  int v7 = v6 - v4;
  int v8 = (float *)*((void *)this + 1);
  float v9 = v8[9];
  float v10 = (float *)((char *)this + 16);
  BOOL v11 = v7 < 1 || v8 == v10;
  if (!v11)
  {
    do
    {
      int v12 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      if (v7 >= v12) {
        int v13 = *((_DWORD *)v8 + 8) - *((_DWORD *)v8 + 7);
      }
      else {
        int v13 = v7;
      }
      unsigned int v14 = (float *)*((void *)v8 + 1);
      unint64_t v15 = v8;
      if (v14)
      {
        do
        {
          float v16 = v14;
          unsigned int v14 = *(float **)v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          float v16 = (float *)*((void *)v15 + 2);
          BOOL v11 = *(void *)v16 == (void)v15;
          unint64_t v15 = v16;
        }
        while (!v11);
      }
      float v9 = v9 + (float)((float)v13 * (float)((float)(v8[10] - v8[9]) / (float)v12));
      v7 -= v13;
      if (v7 < 1) {
        break;
      }
      int v8 = v16;
    }
    while (v16 != v10);
  }
  return result;
}

float CAVolumeCurve::ConvertRawToScalar(CAVolumeCurve *this, int a2)
{
  if (*((void *)this + 3)) {
    int v4 = *(_DWORD *)(*((void *)this + 1) + 28);
  }
  else {
    int v4 = 0;
  }
  int MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2) {
    int v6 = a2;
  }
  else {
    int v6 = v4;
  }
  if (v6 >= MaximumRaw) {
    int v6 = MaximumRaw;
  }
  float v7 = (float)(v6 - v4) / (float)(MaximumRaw - v4);
  if (!CAVolumeCurve::GetIsApplyingTransferFunction(this)) {
    return v7;
  }
  float v8 = *((float *)this + 10) / *((float *)this + 11);

  return powf(v7, v8);
}

BOOL CAVolumeCurve::GetIsApplyingTransferFunction(CAVolumeCurve *this)
{
  if (*((void *)this + 3)) {
    float v2 = *(float *)(*((void *)this + 1) + 36);
  }
  else {
    float v2 = 0.0;
  }
  double MaximumDB = CAVolumeCurve::GetMaximumDB(this);
  return (float)(*(float *)&MaximumDB - v2) > 30.0 && *((unsigned char *)this + 32) != 0;
}

float CAVolumeCurve::ConvertDBToScalar(CAVolumeCurve *this, float a2)
{
  int v3 = CAVolumeCurve::ConvertDBToRaw(this, a2);

  return CAVolumeCurve::ConvertRawToScalar(this, v3);
}

uint64_t CAVolumeCurve::ConvertScalarToRaw(CAVolumeCurve *this, float a2)
{
  float v3 = fmaxf(a2, 0.0);
  if (*((void *)this + 3)) {
    int v4 = *(_DWORD *)(*((void *)this + 1) + 28);
  }
  else {
    int v4 = 0;
  }
  float v5 = fminf(v3, 1.0);
  int MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (CAVolumeCurve::GetIsApplyingTransferFunction(this)) {
    float v5 = powf(v5, *((float *)this + 11) / *((float *)this + 10));
  }
  unsigned int v7 = llroundf(v5 * (float)(MaximumRaw - v4));
  BOOL v8 = __OFADD__(v4, v7);
  unsigned int v9 = v4 + v7;
  unsigned int v10 = ((int)(v4 | v7) >> 31) ^ 0x7FFFFFFF;
  if (v8) {
    return v10;
  }
  else {
    return v9;
  }
}

uint64_t CAVolumeCurve::ConvertScalarToDB(CAVolumeCurve *this, float a2)
{
  int v3 = CAVolumeCurve::ConvertScalarToRaw(this, a2);

  return CAVolumeCurve::ConvertRawToDB(this, v3);
}

void **sub_1286C(void **result, uint64_t a2)
{
  if (a2 < 0)
  {
    unsigned int v7 = *result;
    do
    {
      BOOL v8 = (void *)*v7;
      if (*v7)
      {
        do
        {
          int v4 = v8;
          BOOL v8 = (void *)v8[1];
        }
        while (v8);
      }
      else
      {
        do
        {
          int v4 = (void *)v7[2];
          BOOL v5 = *v4 == (void)v7;
          unsigned int v7 = v4;
        }
        while (v5);
      }
      unsigned int v7 = v4;
    }
    while (!__CFADD__(a2++, 1));
  }
  else
  {
    if (!a2) {
      return result;
    }
    float v2 = *result;
    do
    {
      int v3 = (void *)v2[1];
      if (v3)
      {
        do
        {
          int v4 = v3;
          int v3 = (void *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          int v4 = (void *)v2[2];
          BOOL v5 = *v4 == (void)v2;
          float v2 = v4;
        }
        while (!v5);
      }
      float v2 = v4;
    }
    while (a2-- > 1);
  }
  *uint64_t result = v4;
  return result;
}

uint64_t *sub_128F8(uint64_t **a1, int *a2, uint64_t *a3)
{
  int v6 = a1 + 1;
  BOOL v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        BOOL v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9) {
          break;
        }
        BOOL v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      BOOL v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    BOOL v8 = a1 + 1;
LABEL_10:
    unsigned int v10 = (uint64_t *)operator new(0x30uLL);
    uint64_t v11 = a3[1];
    *(uint64_t *)((char *)v10 + 28) = *a3;
    *(uint64_t *)((char *)v10 + 36) = v11;
    sub_129B8(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *sub_129B8(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  BOOL v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_12A10(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_12A10(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      float v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), BOOL v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }
          else
          {
            int v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *int v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            float v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), BOOL v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        float v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *BOOL v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_12BA8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_12BA8(a1, *a2);
    sub_12BA8(a1, a2[1]);
    operator delete(a2);
  }
}

void *BorealisOwlLog::GetInstance(BorealisOwlLog *this)
{
  return &unk_28A10;
}

uint64_t BorealisOwlLog::SetLevel(uint64_t this)
{
  if (this <= 5) {
    BorealisOwlLog::mLogLevel = this;
  }
  return this;
}

void BorealisOwlLog::VLog(BorealisOwlLog *this, char *__format, va_list a3, char *a4)
{
  if (this <= 5)
  {
    int v4 = (int)this;
    if (BorealisOwlLog::mLogLevel >= this)
    {
      vsnprintf(__str, 0x100uLL, __format, a3);
      syslog(5, "(%s) %s", (&BorealisOwlLog::kDelimStrings)[v4], __str);
    }
  }
}

void sub_12D68()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = (void *)_sharedPlugin;
  _sharedPlugin = (uint64_t)v0;
}

#error "12FC4: call analysis failed (funcsize=14)"

void sub_12FD0(_Unwind_Exception *a1)
{
}

void sub_12FE4(BorealisOwlLog *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  BorealisOwlLog::GetInstance(a1);
  BorealisOwlLog::VLog((BorealisOwlLog *)((char *)&dword_0 + 2), (char *)a1, &a9, v10);
}

void sub_13394(void *a1)
{
  __cxa_begin_catch(a1);
  if (*v2)
  {
    IOObjectRelease(*v2);
    io_object_t *v2 = 0;
  }
  io_object_t v4 = *(_DWORD *)(v1 + 52);
  if (v4)
  {
    IOObjectRelease(v4);
    *(_DWORD *)(v1 + 52) = 0;
  }
  BOOL v5 = *(IONotificationPort **)(v1 + v3);
  if (v5)
  {
    IONotificationPortDestroy(v5);
    *(void *)(v1 + v3) = 0;
  }
  __cxa_rethrow();
}

void sub_133F0(_Unwind_Exception *a1)
{
}

unsigned char *sub_13404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  sub_8D34((BorealisOwlLog *)"+-IOAudioServiceMatchingHandler()\n", a2, a3, a4, a5, a6, a7, a8, v21);
  uint64_t v24 = &qword_28A18;
  char v25 = (*(uint64_t (**)(void))(qword_28A18 + 16))();
  BorealisOwl_IOKitIterator::BorealisOwl_IOKitIterator((BorealisOwl_IOKitIterator *)v23, v8, 0);
  unsigned int v9 = BorealisOwl_IOKitIterator::Next((BorealisOwl_IOKitIterator *)v23);
  BorealisOwl_IOKitObject::BorealisOwl_IOKitObject(&v22, v9);
  while (BorealisOwl_IOKitObject::IsValid(&v22))
  {
    if (BorealisOwl_IOKitObject::ConformsTo(&v22, "AppleAOPAudioController"))
    {
      uint64_t v10 = +[AppleAOPAudioPlugin sharedPlugin];
      uint64_t v11 = [[AppleAOPAudioDevice alloc] initWithDeviceUID:*(void *)(v10 + 80) withDeviceName:*(void *)(v10 + 88) withModelName:*(void *)(v10 + 96) withPlugin:v10 withIOObject:BorealisOwl_IOKitObject::CopyObject(&v22)];
      if (v11)
      {
        [(id)v10 addIODevice:v11];
        [(AppleAOPAudioDevice *)v11 activate];
        sub_8D34((BorealisOwlLog *)"  Added device %d\n", v12, v13, v14, v15, v16, v17, v18, *(_DWORD *)(v10 + 8));
      }
    }
    int v19 = BorealisOwl_IOKitIterator::Next((BorealisOwl_IOKitIterator *)v23);
    BorealisOwl_IOKitObject::operator=((uint64_t)&v22, v19);
  }
  BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(&v22);
  BorealisOwl_IOKitIterator::~BorealisOwl_IOKitIterator((BorealisOwl_IOKitIterator *)v23);
  return sub_AE2C(&v24);
}

void sub_135C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, BorealisOwl_IOKitObject *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

unsigned char *sub_1368C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a2;
  sub_8D34((BorealisOwlLog *)"+-IOVoiceTriggerServiceMatchingHandler()\n", a2, a3, a4, a5, a6, a7, a8, v13);
  uint64_t v16 = &qword_28A18;
  char v17 = (*(uint64_t (**)(void))(qword_28A18 + 16))();
  BorealisOwl_IOKitIterator::BorealisOwl_IOKitIterator((BorealisOwl_IOKitIterator *)v15, v8, 0);
  unsigned int v9 = BorealisOwl_IOKitIterator::Next((BorealisOwl_IOKitIterator *)v15);
  BorealisOwl_IOKitObject::BorealisOwl_IOKitObject(&v14, v9);
  while (BorealisOwl_IOKitObject::IsValid(&v14))
  {
    if (BorealisOwl_IOKitObject::ConformsTo(&v14, "AppleAOPVoiceTriggerController"))
    {
      uint64_t v10 = +[AppleAOPAudioPlugin sharedPlugin];
      [v10 addVoiceTriggerService:&v14];
    }
    int v11 = BorealisOwl_IOKitIterator::Next((BorealisOwl_IOKitIterator *)v15);
    BorealisOwl_IOKitObject::operator=((uint64_t)&v14, v11);
  }
  BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(&v14);
  BorealisOwl_IOKitIterator::~BorealisOwl_IOKitIterator((BorealisOwl_IOKitIterator *)v15);
  return sub_AE2C(&v16);
}

void sub_13794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, BorealisOwl_IOKitObject *a4)
{
  sub_AE2C((unsigned char *)(v4 - 48));
  _Unwind_Resume(a1);
}

void sub_13A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);

  sub_AE2C(va);
  _Unwind_Resume(a1);
}

unsigned char *sub_13AC8(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v32 = &qword_28A18;
  char v33 = (*(uint64_t (**)(void))(qword_28A18 + 16))();
  sub_8D34((BorealisOwlLog *)"+ IOVoiceTriggerServiceInterestHandler(inMessageType: 0x%x)\n", v5, v6, v7, v8, v9, v10, v11, a3);
  if ((a2 - 1) <= 0xFFFFFFFD)
  {
    int v19 = +[AppleAOPAudioPlugin sharedPlugin];
    uint64_t v20 = [v19 getDeviceFromIOObject:a2];
    char v21 = (void *)v20;
    if (a3 == -469794559 && v20)
    {
      clock_t v22 = clock();
      sub_7794((BorealisOwlLog *)"voice trigger event #%d.\n", v23, v24, v25, v26, v27, v28, v29, ++dword_28A78);
      int v35 = 0;
      uint64_t v34 = *(void *)"otvabolg";
      [v21 setLastVoiceTrigEventTime:v22];
      [v19 changedProperty:&v34 forObject:v21];
    }
  }
  sub_8D34((BorealisOwlLog *)"- IOVoiceTriggerServiceInterestHandler()\n", v12, v13, v14, v15, v16, v17, v18, v31);
  return sub_AE2C(&v32);
}

#error "13C90: call analysis failed (funcsize=23)"

void sub_13FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (__p) {
    operator delete(__p);
  }
  sub_AE2C(&a19);

  _Unwind_Resume(a1);
}

unsigned char *sub_13FF4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v29 = &qword_28A18;
  char v30 = (*(uint64_t (**)(void))(qword_28A18 + 16))();
  sub_8D34((BorealisOwlLog *)"+ %s(message type: 0x%x)\n", v5, v6, v7, v8, v9, v10, v11, (char)"IOAudioServiceInterestHandler");
  if ((a2 - 1) <= 0xFFFFFFFD)
  {
    int v19 = +[AppleAOPAudioPlugin sharedPlugin];
    uint64_t v27 = [v19 getDeviceFromIOObject:a2];
    if (v27)
    {
      if (a3 == -536870896)
      {
        sub_8D34((BorealisOwlLog *)" %s() device is dead, removing it.\n", v20, v21, v22, v23, v24, v25, v26, (char)"IOAudioServiceInterestHandler");
        [v19 removeIODevice:v27];
        [v27 deactivate];
      }
      else if (a3 == -536870608)
      {
        sub_8D34((BorealisOwlLog *)" %s() device property change.\n", v20, v21, v22, v23, v24, v25, v26, (char)"IOAudioServiceInterestHandler");
      }
    }
  }
  sub_8D34((BorealisOwlLog *)"- %s()\n", v12, v13, v14, v15, v16, v17, v18, (char)"IOAudioServiceInterestHandler");
  return sub_AE2C(&v29);
}

#error "14170: call analysis failed (funcsize=18)"

void sub_14184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_AE2C(va);
  _Unwind_Resume(a1);
}

void sub_142C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *sub_1441C(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      sub_6AA4();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = sub_14528(v7, v11);
    uint64_t v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      uint64_t v18 = v9;
      int v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    uint64_t v18 = v9;
    int v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *uint64_t v12 = &v9[v17];
  return result;
}

char *sub_14528(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_6AA4();
  }
  uint64_t result = (char *)sub_1456C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_1456C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_6B84();
  }
  return operator new(4 * a2);
}

void sub_145A4()
{
  CADeprecated::CAMutex::CAMutex((CADeprecated::CAMutex *)qword_28A18, "IOServiceMutex");
  __cxa_atexit((void (*)(void *))CADeprecated::CAMutex::~CAMutex, qword_28A18, &dword_0);
}

void AOPAudioDeviceHWManager::AOPAudioDeviceHWManager(AOPAudioDeviceHWManager *this, unsigned int a2)
{
  *(void *)this = off_24C28;
  BorealisOwl_IOKitObject::BorealisOwl_IOKitObject((BorealisOwl_IOKitObject *)((char *)this + 8), a2);
  *((void *)this + 6) = 0;
  *((unsigned char *)this + 88) = 0;
  *((void *)this + 12) = 0;
  *((_DWORD *)this + 23) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 18) = 0;
  *(_OWORD *)((char *)this + 136) = xmmword_1D7F0;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 184) = xmmword_1D800;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 200) = xmmword_1D810;
  *(_OWORD *)((char *)this + 232) = xmmword_1D800;
  *(_OWORD *)((char *)this + 216) = 0u;
  v14[0] = off_24C48;
  void v14[3] = v14;
  *(_OWORD *)((char *)this + 248) = 0u;
  sub_17F3C((uint64_t)this + 264, (uint64_t)v14);
  sub_1806C(v14);
  v13[0] = off_24C90;
  v13[3] = v13;
  *((void *)this + 37) = 0;
  *((void *)this + 38) = 0;
  sub_17FD4((uint64_t)this + 312, (uint64_t)v13);
  sub_180F0(v13);
  v12[0] = off_24CD8;
  v12[3] = v12;
  *((void *)this + 43) = 0;
  *((void *)this + 44) = 0;
  sub_17FD4((uint64_t)this + 360, (uint64_t)v12);
  sub_180F0(v12);
  AOPAudioDeviceHWManager::_HW_Open(this, v3, v4, v5, v6, v7, v8, v9);
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  AOPAudioDeviceHWManager::_HW_VoiceTriggerGetControlValue(this, &v10, &v11);
  *((unsigned char *)this + 88) = v11 != 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  if (AOPAudioDeviceHWManager::_HW_AudioGetControlValue(this, &v10, &v11)) {
    *((_DWORD *)this + 23) = v11;
  }
  unint64_t v10 = 1;
  unint64_t v11 = 0;
  if (AOPAudioDeviceHWManager::_HW_AudioGetControlValue(this, &v10, &v11)) {
    *((_DWORD *)this + 24) = v11;
  }
  unint64_t v10 = 2;
  unint64_t v11 = 0;
  if (AOPAudioDeviceHWManager::_HW_AudioGetControlValue(this, &v10, &v11)) {
    *((_DWORD *)this + 25) = v11;
  }
}

void sub_14854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_180F0(va);
  sub_180F0(v6);
  sub_1806C(v5);
  uint64_t v9 = *v7;
  *uint64_t v7 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject(v4);
  _Unwind_Resume(a1);
}

BorealisOwl_IOKitObject *AOPAudioDeviceHWManager::_HW_Open(AOPAudioDeviceHWManager *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_8D34((BorealisOwlLog *)"+-DeviceHWManager::_HW_Open()\n", a2, a3, a4, a5, a6, a7, a8, outputStruct);
  BorealisOwl_IOKitObject::OpenConnection((BorealisOwl_IOKitObject *)((char *)this + 8), 0, v9, v10, v11, v12, v13, v14);
  if (BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 0, 0, 0, 0, 0, 0, 0, 0, 0))
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v15, v16, v17, v18, v19, v20, v21, (char)"_HW_Open");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_197DC();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  AOPAudioDeviceHWManager::HW_AcquireRingBuffer(this);
  AOPAudioDeviceHWManager::HW_UpdateRingBufferDescription(this, v22, v23, v24, v25, v26, v27, v28);
  unint64_t v34 = 0;
  unint64_t v33 = 1;
  if (AOPAudioDeviceHWManager::_HW_AudioGetControlValue(this, &v33, &v34))
  {
    int v29 = v34;
    *((_DWORD *)this + 23) = v34;
    *((_DWORD *)this + 24) = v29;
  }
  unint64_t v34 = 0;
  unint64_t v33 = 0;
  uint64_t result = AOPAudioDeviceHWManager::_HW_VoiceTriggerGetControlValue(this, &v33, &v34);
  *((unsigned char *)this + 88) = v34 != 0;
  return result;
}

uint64_t AOPAudioDeviceHWManager::HW_VoiceTriggerGetControlValue(AOPAudioDeviceHWManager *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10 = (int)a2;
  unint64_t v11 = 0;
  if (a2)
  {
    sub_15844((BorealisOwlLog *)this, a2, a3, a4, a5, a6, a7, a8, v10);
    return 0;
  }
  else
  {
    AOPAudioDeviceHWManager::_HW_VoiceTriggerGetControlValue(this, &v10, &v11);
    uint64_t result = v11;
    *((unsigned char *)this + 88) = v11 != 0;
  }
  return result;
}

BOOL AOPAudioDeviceHWManager::HW_AudioGetControlValue(AOPAudioDeviceHWManager *this, int a2, int *a3)
{
  unint64_t v7 = a2;
  unint64_t v8 = 0;
  switch(a2)
  {
    case 2:
      BOOL result = AOPAudioDeviceHWManager::_HW_AudioGetControlValue(this, &v7, &v8);
      if (!result) {
        return result;
      }
      int v6 = v8;
      *((_DWORD *)this + 25) = v8;
      if (!a3) {
        return 1;
      }
      goto LABEL_12;
    case 1:
      BOOL result = AOPAudioDeviceHWManager::_HW_AudioGetControlValue(this, &v7, &v8);
      if (!result) {
        return result;
      }
      int v6 = v8;
      *((_DWORD *)this + 24) = v8;
      if (!a3) {
        return 1;
      }
LABEL_12:
      *a3 = v6;
      return 1;
    case 0:
      BOOL result = AOPAudioDeviceHWManager::_HW_AudioGetControlValue(this, &v7, &v8);
      if (!result) {
        return result;
      }
      int v6 = v8;
      *((_DWORD *)this + 23) = v8;
      if (!a3) {
        return 1;
      }
      goto LABEL_12;
  }
  return 0;
}

void AOPAudioDeviceHWManager::~AOPAudioDeviceHWManager(AOPAudioDeviceHWManager *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)this = off_24C28;
  AOPAudioDeviceHWManager::_HW_Close(this, a2, a3, a4, a5, a6, a7, a8);
  sub_180F0((void *)this + 45);
  sub_180F0((void *)this + 39);
  sub_1806C((void *)this + 33);
  uint64_t v9 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  BorealisOwl_IOKitObject::~BorealisOwl_IOKitObject((BorealisOwl_IOKitObject *)((char *)this + 8));
}

{
  uint64_t vars8;

  AOPAudioDeviceHWManager::~AOPAudioDeviceHWManager(this, a2, a3, a4, a5, a6, a7, a8);

  operator delete();
}

AOPAudioDeviceHWManager *AOPAudioDeviceHWManager::_HW_Close(AOPAudioDeviceHWManager *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_8D34((BorealisOwlLog *)"+-DeviceHWManager::_HW_Close() {%p, %p}\n", a2, a3, a4, a5, a6, a7, a8, *((void *)this + 10));
  AOPAudioDeviceHWManager::HW_ReleaseRingBuffer(this);
  BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 1u, 0, 0, 0, 0, 0, 0, 0, 0);
  BorealisOwl_IOKitObject::CloseConnection((BorealisOwl_IOKitObject *)((char *)this + 8));

  return AOPAudioDeviceHWManager::_CloseVTService(this, v9, v10, v11, v12, v13, v14, v15);
}

void AOPAudioDeviceHWManager::HW_AddVoiceTriggerSupport(AOPAudioDeviceHWManager *this, BorealisOwl_IOKitObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*((void *)this + 6)) {
    AOPAudioDeviceHWManager::_CloseVTService(this, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  }
  operator new();
}

void sub_14E64()
{
}

AOPAudioDeviceHWManager *AOPAudioDeviceHWManager::_CloseVTService(AOPAudioDeviceHWManager *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = this;
  if (*((void *)this + 6)
    && (sub_8D34((BorealisOwlLog *)"+-DeviceHWManager::_CloseVTService()\n", a2, a3, a4, a5, a6, a7, a8, outputStruct),
        (this = (AOPAudioDeviceHWManager *)*((void *)v8 + 6)) != 0))
  {
    BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)this, 1u, 0, 0, 0, 0, 0, 0, 0, 0);
    BorealisOwl_IOKitObject::CloseConnection(*((BorealisOwl_IOKitObject **)v8 + 6));
    this = (AOPAudioDeviceHWManager *)*((void *)v8 + 6);
    *((void *)v8 + 6) = 0;
    if (this)
    {
      uint64_t v9 = *(uint64_t (**)(void))(*(void *)this + 8);
      return (AOPAudioDeviceHWManager *)v9();
    }
  }
  else
  {
    *((void *)v8 + 6) = 0;
  }
  return this;
}

uint64_t AOPAudioDeviceHWManager::HW_CopyDeviceUID(AOPAudioDeviceHWManager *this, unsigned int a2, uint64_t a3, const __CFString **a4)
{
  uint64_t v5 = 0;
  BorealisOwl_IOKitObject::CopyProperty_CFString((BorealisOwl_IOKitObject *)this, @"device UID", (const __CFString *)&v5, a4);
  return v5;
}

mach_vm_address_t AOPAudioDeviceHWManager::HW_AcquireRingBuffer(AOPAudioDeviceHWManager *this)
{
  unsigned int v22 = 0;
  float v2 = (BorealisOwl_IOKitObject *)((char *)this + 8);
  mach_vm_address_t v3 = BorealisOwl_IOKitObject::MapMemory((BorealisOwl_IOKitObject *)((char *)this + 8), 0, 1u, &v22);
  *((void *)this + 10) = v3;
  if (!v3)
  {
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v5) {
      sub_198BC(v5, v6, v7, v8, v9, v10, v11, v12);
    }
LABEL_8:
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 560947818;
  }
  mach_vm_address_t result = BorealisOwl_IOKitObject::MapMemory(v2, 1u, 1u, (unsigned int *)this + 16);
  *((void *)this + 7) = result;
  if (!result)
  {
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_198F8(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_8;
  }
  return result;
}

void AOPAudioDeviceHWManager::HW_UpdateRingBufferDescription(AOPAudioDeviceHWManager *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_8D34((BorealisOwlLog *)"+-DeviceHWManager::_HW_UpdateRingBufferDescription() {%p, %p}\n", a2, a3, a4, a5, a6, a7, a8, *((void *)this + 10));
  if (!*((void *)this + 10) || !*((void *)this + 7))
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v16) {
      sub_19934(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  *((_DWORD *)this + 18) = AOPAudioDeviceHWManager::HW_GetZeroTimeStampWrapFrames(this);
  *((_DWORD *)this + 17) = AOPAudioDeviceHWManager::HW_GetSafetyOffsetFrames(this);
  sub_7794((BorealisOwlLog *)"RingBufferDescription {size %dB, zeroTSWrap: %d frames, safety offset %d frames}\n", v9, v10, v11, v12, v13, v14, v15, *((_DWORD *)this + 16));
}

void AOPAudioDeviceHWManager::HW_ReleaseRingBuffer(AOPAudioDeviceHWManager *this)
{
  mach_vm_address_t v2 = *((void *)this + 10);
  if (v2)
  {
    BorealisOwl_IOKitObject::ReleaseMemory((BorealisOwl_IOKitObject *)((char *)this + 8), v2, 0);
    *((void *)this + 10) = 0;
  }
  mach_vm_address_t v3 = *((void *)this + 7);
  if (v3)
  {
    BorealisOwl_IOKitObject::ReleaseMemory((BorealisOwl_IOKitObject *)((char *)this + 8), v3, 1u);
    *((void *)this + 7) = 0;
  }
}

uint64_t AOPAudioDeviceHWManager::HW_StartIO(AOPAudioDeviceHWManager *this)
{
  uint64_t result = BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 2u, 0, 0, 0, 0, 0, 0, 0, 0);
  if (result)
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v2, v3, v4, v5, v6, v7, v8, (char)"HW_StartIO");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19970();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return result;
}

uint64_t AOPAudioDeviceHWManager::HW_StopIO(AOPAudioDeviceHWManager *this)
{
  uint64_t result = BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 3u, 0, 0, 0, 0, 0, 0, 0, 0);
  if (result)
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v2, v3, v4, v5, v6, v7, v8, (char)"HW_StopIO");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_199E0();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return result;
}

uint64_t AOPAudioDeviceHWManager::HW_EnableListening(AOPAudioDeviceHWManager *this)
{
  *(_OWORD *)uint64_t v11 = xmmword_1D820;
  uint64_t result = BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 5u, v11, 2u, 0, 0, 0, 0, 0, 0);
  if (result)
  {
    sub_7364((BorealisOwlLog *)"AOPAudioDeviceHWManager::HW_EnableListening: user client method failed", v2, v3, v4, v5, v6, v7, v8, outputStruct);
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return result;
}

BOOL AOPAudioDeviceHWManager::HW_AudioSetControlValue(AOPAudioDeviceHWManager *this, unsigned int a2, unsigned int a3)
{
  BOOL v3 = 0;
  switch(a2)
  {
    case 0u:
      unint64_t v7 = 0;
      uint64_t v8 = a3;
      if (BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 5u, &v7, 2u, 0, 0, 0, 0, 0, 0))goto LABEL_8; {
      *((_DWORD *)this + 23) = a3;
      }
      goto LABEL_10;
    case 1u:
      BOOL v3 = 1;
      unint64_t v7 = 1;
      uint64_t v8 = a3;
      if (BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 5u, &v7, 2u, 0, 0, 0, 0, 0, 0))
      {
        BOOL v3 = 0;
        *((_DWORD *)this + 24) = a3;
      }
      break;
    case 2u:
      unint64_t v7 = 2;
      uint64_t v8 = a3;
      if (BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 5u, &v7, 2u, 0, 0, 0, 0, 0, 0))
      {
LABEL_8:
        BOOL v3 = 0;
      }
      else
      {
        *((_DWORD *)this + 25) = a3;
LABEL_10:
        BOOL v3 = 1;
      }
      break;
    case 3u:
    case 5u:
      unint64_t v7 = a2;
      uint64_t v8 = a3;
      BOOL v3 = BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 5u, &v7, 2u, 0, 0, 0, 0, 0, 0) == 0;
      break;
    default:
      return v3;
  }
  return v3;
}

uint64_t AOPAudioDeviceHWManager::HW_DisableListening(AOPAudioDeviceHWManager *this)
{
  *(_OWORD *)uint64_t v11 = xmmword_1D830;
  uint64_t result = BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 5u, v11, 2u, 0, 0, 0, 0, 0, 0);
  if (result)
  {
    sub_7364((BorealisOwlLog *)"AOPAudioDeviceHWManager::HW_DisableListening: user client method failed", v2, v3, v4, v5, v6, v7, v8, outputStruct);
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return result;
}

BOOL AOPAudioDeviceHWManager::_HW_AudioGetControlValue(AOPAudioDeviceHWManager *this, unint64_t *a2, unint64_t *a3)
{
  *a3 = 0;
  unsigned int v13 = 1;
  int v11 = BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 4u, a2, 1u, 0, 0, a3, &v13, 0, 0);
  if (v11) {
    sub_7364((BorealisOwlLog *)"DeviceHWManager::_HW_AudioGetControlValue(inControlID: %llu) failing\n", v4, v5, v6, v7, v8, v9, v10, *a2);
  }
  return v11 == 0;
}

BorealisOwl_IOKitObject *AOPAudioDeviceHWManager::_HW_VoiceTriggerGetControlValue(AOPAudioDeviceHWManager *this, unint64_t *a2, unint64_t *a3)
{
  *a3 = 0;
  unsigned int v20 = 1;
  uint64_t result = (BorealisOwl_IOKitObject *)*((void *)this + 6);
  if (result)
  {
    uint64_t result = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::CallMethod(result, 2u, a2, 1u, 0, 0, a3, &v20, 0, 0);
    if (result)
    {
      sub_7364((BorealisOwlLog *)"DeviceHWManager::_HW_VoiceTriggerGetControlValue(inControlID: %llu) failing\n", v5, v6, v7, v8, v9, v10, v11, *a2);
      sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v12, v13, v14, v15, v16, v17, v18, (char)"_HW_VoiceTriggerGetControlValue");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_19A50();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = 1852797029;
    }
  }
  return result;
}

void sub_15844(BorealisOwlLog *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  BorealisOwlLog::GetInstance(a1);
  BorealisOwlLog::VLog((BorealisOwlLog *)((char *)&dword_0 + 1), " DeviceHWManager::HW_VoiceTriggerGetControlValue(), unrecognized control ID. \n", &a9, v9);
}

BOOL AOPAudioDeviceHWManager::_HW_AudioSetControlValue(AOPAudioDeviceHWManager *this, unsigned int a2, unsigned int a3)
{
  v4[0] = a2;
  v4[1] = a3;
  return BorealisOwl_IOKitObject::CallMethod((BorealisOwl_IOKitObject *)((char *)this + 8), 5u, v4, 2u, 0, 0, 0, 0, 0, 0) == 0;
}

BorealisOwl_IOKitObject *AOPAudioDeviceHWManager::_HW_VoiceTriggerSetControlValue(AOPAudioDeviceHWManager *this, unsigned int a2, unsigned int a3)
{
  uint64_t result = (BorealisOwl_IOKitObject *)*((void *)this + 6);
  if (result)
  {
    char v4 = a2;
    v20[0] = a2;
    v20[1] = a3;
    uint64_t result = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::CallMethod(result, 3u, v20, 2u, 0, 0, 0, 0, 0, 0);
    if (result)
    {
      sub_7364((BorealisOwlLog *)"_HW_VoiceTriggerSetControlValue(0x%x, 0x%x) failed, status: 0x%x\n", v5, v6, v7, v8, v9, v10, v11, v4);
      sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v12, v13, v14, v15, v16, v17, v18, (char)"_HW_VoiceTriggerSetControlValue");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_19AC0();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = 1852797029;
    }
  }
  return result;
}

AOPAudioDeviceHWManager *AOPAudioDeviceHWManager::HW_VoiceTriggerSetControlValue(AOPAudioDeviceHWManager *this, int a2, unsigned int a3)
{
  if (!a2)
  {
    char v4 = this;
    this = (AOPAudioDeviceHWManager *)AOPAudioDeviceHWManager::_HW_VoiceTriggerSetControlValue(this, a2, a3);
    *((unsigned char *)v4 + 88) = a3 != 0;
  }
  return this;
}

uint64_t AOPAudioDeviceHWManager::HW_GetVoiceTriggerData(uint64_t a1, void *outputStruct)
{
  uint64_t v2 = *(BorealisOwl_IOKitObject **)(a1 + 48);
  if (!v2)
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_19B30(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    int v20 = 1937010544;
LABEL_10:
    exception[2] = v20;
  }
  unint64_t v21 = 160;
  uint64_t result = BorealisOwl_IOKitObject::CallMethod(v2, 4u, 0, 0, 0, 0, 0, 0, outputStruct, &v21);
  if (result)
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v4, v5, v6, v7, v8, v9, v10, (char)"HW_GetVoiceTriggerData");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19B6C();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    int v20 = 1852797029;
    goto LABEL_10;
  }
  return result;
}

BOOL AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported(AOPAudioDeviceHWManager *this)
{
  uint64_t v1 = (BorealisOwl_IOKitObject *)*((void *)this + 6);
  if (v1)
  {
    Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject(v1);
    unsigned __int8 v14 = 0;
    if ((BorealisOwl_IOKitObject::CopyProperty_BOOL(Object, @"voice trigger supported", (const __CFString *)&v14, v3) & 1) == 0)
    {
      sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v4, v5, v6, v7, v8, v9, v10, (char)"HW_IsVoiceTriggerSupported");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_19BDC();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = 1852797029;
    }
    int v11 = v14;
  }
  else
  {
    int v11 = 0;
  }
  return v11 != 0;
}

BOOL AOPAudioDeviceHWManager::HW_IsVoiceTriggerEnabled(AOPAudioDeviceHWManager *this)
{
  uint64_t v1 = (BorealisOwl_IOKitObject *)*((void *)this + 6);
  if (v1)
  {
    Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject(v1);
    unsigned __int8 v14 = 0;
    if ((BorealisOwl_IOKitObject::CopyProperty_BOOL(Object, @"voice trigger enabled", (const __CFString *)&v14, v3) & 1) == 0)
    {
      sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v4, v5, v6, v7, v8, v9, v10, (char)"HW_IsVoiceTriggerEnabled");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_19C4C();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = 1852797029;
    }
    int v11 = v14;
  }
  else
  {
    int v11 = 0;
  }
  return v11 != 0;
}

BOOL AOPAudioDeviceHWManager::HW_GetIsIORunning(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  char v12 = 0;
  if ((BorealisOwl_IOKitObject::CopyProperty_BOOL(Object, @"listening enabled", (const __CFString *)&v12, v2) & 1) == 0)
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v3, v4, v5, v6, v7, v8, v9, (char)"HW_GetIsIORunning");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19CBC();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return v12 != 0;
}

uint64_t AOPAudioDeviceHWManager::HW_GetBytesPerSample(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  uint64_t v12 = 0;
  if (!BorealisOwl_IOKitObject::CopyProperty_UInt64(Object, @"bytes per sample", (const __CFString *)&v12, v2))
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v3, v4, v5, v6, v7, v8, v9, (char)"HW_GetBytesPerSample");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19D2C();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return v12;
}

uint64_t AOPAudioDeviceHWManager::HW_GetChannelsPerFrame(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  uint64_t v12 = 0;
  if (!BorealisOwl_IOKitObject::CopyProperty_UInt64(Object, @"channels per frame", (const __CFString *)&v12, v2))
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v3, v4, v5, v6, v7, v8, v9, (char)"HW_GetChannelsPerFrame");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19D9C();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return v12;
}

uint64_t AOPAudioDeviceHWManager::HW_GetFramesPerPacket(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  uint64_t v12 = 0;
  if (!BorealisOwl_IOKitObject::CopyProperty_UInt64(Object, @"frames per packet", (const __CFString *)&v12, v2))
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v3, v4, v5, v6, v7, v8, v9, (char)"HW_GetFramesPerPacket");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19E0C();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return v12;
}

uint64_t AOPAudioDeviceHWManager::HW_GetInputSamplesPerSec(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  uint64_t v12 = 0;
  if (!BorealisOwl_IOKitObject::CopyProperty_UInt64(Object, @"input samples per sec", (const __CFString *)&v12, v2))
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v3, v4, v5, v6, v7, v8, v9, (char)"HW_GetInputSamplesPerSec");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19E7C();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return v12;
}

uint64_t AOPAudioDeviceHWManager::HW_GetZeroTimeStampWrapFrames(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  uint64_t v12 = 0;
  if (!BorealisOwl_IOKitObject::CopyProperty_UInt64(Object, @"zero timestamp wrap frames", (const __CFString *)&v12, v2))
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v3, v4, v5, v6, v7, v8, v9, (char)"HW_GetZeroTimeStampWrapFrames");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19EEC();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return v12;
}

uint64_t AOPAudioDeviceHWManager::HW_GetSafetyOffsetFrames(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  uint64_t v12 = 0;
  if (!BorealisOwl_IOKitObject::CopyProperty_UInt64(Object, @"driver safety offset in frames", (const __CFString *)&v12, v2))
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v3, v4, v5, v6, v7, v8, v9, (char)"HW_GetSafetyOffsetFrames");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19F5C();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return v12;
}

uint64_t AOPAudioDeviceHWManager::HW_GetClockDomain(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  uint64_t v11 = 0;
  if (BorealisOwl_IOKitObject::CopyProperty_UInt64(Object, @"input clock domain", (const __CFString *)&v11, v2)) {
    return v11;
  }
  sub_7364((BorealisOwlLog *)"AOPAudioDeviceHWManager::HW_GetClockDomain() failed to get registry key '%s' (error: 0x%x), assuming clock domain private(0)\n", v3, v4, v5, v6, v7, v8, v9, (char)"input clock domain");
  return 0;
}

uint64_t AOPAudioDeviceHWManager::HW_GetDeviceInputLatencyFrames(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  uint64_t v12 = 0;
  if (!BorealisOwl_IOKitObject::CopyProperty_UInt64(Object, @"device input latency in frames", (const __CFString *)&v12, v2))
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v3, v4, v5, v6, v7, v8, v9, (char)"HW_GetDeviceInputLatencyFrames");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_19FCC();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return v12;
}

BOOL AOPAudioDeviceHWManager::HW_HasPropertyEnableListeningOnGesture(AOPAudioDeviceHWManager *this)
{
  uint64_t v1 = (BorealisOwl_IOKitObject *)((char *)this + 8);
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  if (BorealisOwl_IOKitObject::HasProperty(Object, @"listening on gesture supported", v3))
  {
    uint64_t v4 = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject(v1);
    var11[0] = 0;
    if ((BorealisOwl_IOKitObject::CopyProperty_BOOL(v4, @"listening on gesture supported", (const __CFString *)var11, v5) & 1) == 0)
    {
      sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v6, v7, v8, v9, v10, v11, v12, (char)"HW_HasPropertyEnableListeningOnGesture");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1A03C();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = off_24B68;
      exception[2] = 1852797029;
    }
    int v13 = var11[0];
  }
  else
  {
    int v13 = 0;
  }
  return v13 != 0;
}

BOOL AOPAudioDeviceHWManager::HW_IsListeningOnGestureEnabled(AOPAudioDeviceHWManager *this)
{
  Object = (BorealisOwl_IOKitObject *)BorealisOwl_IOKitObject::GetObject((BorealisOwl_IOKitObject *)((char *)this + 8));
  char v12 = 0;
  if ((BorealisOwl_IOKitObject::CopyProperty_BOOL(Object, @"listening on gesture enabled", (const __CFString *)&v12, v2) & 1) == 0)
  {
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v3, v4, v5, v6, v7, v8, v9, (char)"HW_IsListeningOnGestureEnabled");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1A0AC();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 1852797029;
  }
  return v12 != 0;
}

void AOPAudioDeviceHWManager::HW_SetVoiceTriggerConfiguration(AOPAudioDeviceHWManager *this, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_8D34((BorealisOwlLog *)"+-DeviceHWManager::HW_SetVoiceTriggerConfiguration(theConfigDictionary: %p)\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)a2);
  if (!*((void *)this + 6)) {
    return;
  }
  if (!a2)
  {
    BOOL v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v40) {
      sub_1A11C(v40, v41, v42, v43, v44, v45, v46, v47);
    }
    goto LABEL_27;
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(a2))
  {
    BOOL v48 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v48) {
      sub_1A240(v48, v49, v50, v51, v52, v53, v54, v55);
    }
    goto LABEL_27;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a2, @"CorealisRTModelVersion");
  if (Value)
  {
    CFTypeID v12 = CFStringGetTypeID();
    if (v12 == CFGetTypeID(Value)) {
      CFStringRef Value = (const __CFString *)CFStringGetCStringPtr(Value, 0x600u);
    }
    else {
      CFStringRef Value = 0;
    }
  }
  int v13 = CFDictionaryGetValue(a2, @"CorealisRTModel");
  if (!v13)
  {
    BOOL v56 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v56) {
      sub_1A158(v56, v57, v58, v59, v60, v61, v62, v63);
    }
    goto LABEL_27;
  }
  unsigned __int8 v14 = v13;
  CFTypeID v15 = CFDataGetTypeID();
  if (v15 != CFGetTypeID(v14))
  {
    BOOL v64 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v64) {
      sub_1A204(v64, v65, v66, v67, v68, v69, v70, v71);
    }
LABEL_27:
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    int v73 = 560947818;
    goto LABEL_31;
  }
  uint64_t v23 = "<unknown>";
  if (Value) {
    LOBYTE(v23) = (_BYTE)Value;
  }
  sub_7794((BorealisOwlLog *)"AOP Audio updating voice trigger configuration to '%s'\n", v16, v17, v18, v19, v20, v21, v22, (char)v23);
  BOOL IsConnectionOpen = BorealisOwl_IOKitObject::IsConnectionOpen(*((BorealisOwl_IOKitObject **)this + 6));
  char v31 = (BorealisOwl_IOKitObject *)*((void *)this + 6);
  if (IsConnectionOpen)
  {
    if (!BorealisOwl_IOKitObject::SetConnectionProperty(v31, @"kPropertyConfiguration", a2)) {
      return;
    }
    goto LABEL_28;
  }
  BorealisOwl_IOKitObject::OpenConnection(v31, 0, v24, v25, v26, v27, v28, v29);
  if (BorealisOwl_IOKitObject::SetConnectionProperty(*((BorealisOwl_IOKitObject **)this + 6), @"kPropertyConfiguration", a2))
  {
LABEL_28:
    sub_7364((BorealisOwlLog *)"exception thrown in BorealisOwlDevice::%s:%d : %s\n\n\n", v32, v33, v34, v35, v36, v37, v38, (char)"HW_SetVoiceTriggerConfiguration");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1A194();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    int v73 = 1852797029;
LABEL_31:
    exception[2] = v73;
  }
  uint64_t v39 = (BorealisOwl_IOKitObject *)*((void *)this + 6);

  BorealisOwl_IOKitObject::CloseConnection(v39);
}

void *AOPAudioDeviceHWManager::HW_GetVoiceTriggerConfiguration(AOPAudioDeviceHWManager *this)
{
  CFStringRef v14 = CFStringCreateWithCString(0, "VTConfigured", 0x600u);
  char v15 = 1;
  CFTypeID v12 = (__CFString *)CFStringCreateWithCString(0, "VTConfiguration", 0x600u);
  char v13 = 1;
  BOOL v11 = 0;
  CFTypeRef cf = 0;
  unsigned int v2 = BorealisOwl_IOKitObject::CopyProperty_BOOL(*((BorealisOwl_IOKitObject **)this + 6), v14, &v11);
  if (v11) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 0;
  }
  if (v3 != 1)
  {
LABEL_11:
    uint64_t v5 = (void *)CFStringCreateWithCString(0, "<na>", 0x600u);
    uint64_t v8 = v5;
    char v9 = 0;
    sub_6970((uint64_t)&v8);
    goto LABEL_12;
  }
  unsigned __int8 v4 = BorealisOwl_IOKitObject::CopyProperty_CFString(*((BorealisOwl_IOKitObject **)this + 6), v12, (const __CFString **)&cf);
  uint64_t v5 = (void *)cf;
  if (cf) {
    unsigned __int8 v6 = v4;
  }
  else {
    unsigned __int8 v6 = 0;
  }
  if ((v6 & 1) == 0)
  {
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_11;
  }
LABEL_12:
  sub_6970((uint64_t)&v12);
  sub_6970((uint64_t)&v14);
  return v5;
}

void sub_169BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_6970((uint64_t)va);
  sub_6970(v5 - 32);
  _Unwind_Resume(a1);
}

AOPAudioDeviceHWManager *AOPAudioDeviceHWManager::HW_ReadIOTimeStampStatusBuffer(AOPAudioDeviceHWManager *this, unint64_t *a2, unint64_t *a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v5 = (unint64_t *)*((void *)this + 10);
  do
  {
    *a2 = *v5;
    *a3 = v5[1];
    *a5 = v5[3];
    unint64_t v6 = v5[2];
    *a4 = v6;
    unint64_t v7 = v5[3];
  }
  while (*((_OWORD *)v5 + 1) != __PAIR128__(*a5, v6));
  uint64_t v8 = *a2;
  uint64_t v9 = *a3;
  unint64_t v10 = *((void *)this + 18);
  if (v10 < *((void *)this + 17))
  {
    *((void *)this + 13) = v8;
    *((void *)this + 14) = v9;
    *((void *)this + 15) = v6;
    *((void *)this + 16) = v7;
    *((void *)this + 18) = v10 + 1;
  }
  unint64_t v11 = *((void *)this + 24);
  if (v11 < *((void *)this + 23))
  {
    *((void *)this + 19) = v8;
    *((void *)this + 20) = v9;
    *((void *)this + 21) = v6;
    *((void *)this + 22) = v7;
    *((void *)this + 24) = v11 + 1;
  }
  return this;
}

double AOPAudioDeviceHWManager::HW_StatusReset(AOPAudioDeviceHWManager *this)
{
  double result = 0.0;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *((void *)this + 37) = 0;
  *((void *)this + 38) = 0;
  *((void *)this + 43) = 0;
  *((void *)this + 44) = 0;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((void *)this + 22) = 0;
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 27) = 0;
  *((void *)this + 28) = 0;
  *((void *)this + 30) = 0;
  *((void *)this + 31) = 0;
  *((void *)this + 32) = 0;
  return result;
}

uint64_t AOPAudioDeviceHWManager::_GetHWDescription(AOPAudioDeviceHWManager *this)
{
  sub_AA0C((uint64_t)v18);
  unsigned int v2 = (BorealisOwl_IOKitObject *)*((void *)this + 6);
  if (v2)
  {
    BOOL IsConnectionOpen = BorealisOwl_IOKitObject::IsConnectionOpen(v2);
    if (!IsConnectionOpen) {
      BorealisOwl_IOKitObject::OpenConnection(*((BorealisOwl_IOKitObject **)this + 6), 0, v3, v4, v5, v6, v7, v8);
    }
    sub_B390(v18, (uint64_t)"  VoiceTriggerEnable:  ", 23);
    unint64_t v20 = 0;
    unint64_t v21 = 0;
    AOPAudioDeviceHWManager::_HW_VoiceTriggerGetControlValue(this, &v20, &v21);
    *((unsigned char *)this + 88) = v21 != 0;
    unint64_t v10 = (void *)std::ostream::operator<<();
    sub_B390(v10, (uint64_t)"\n", 1);
    if (!IsConnectionOpen) {
      BorealisOwl_IOKitObject::CloseConnection(*((BorealisOwl_IOKitObject **)this + 6));
    }
  }
  unint64_t v22 = 0;
  unint64_t v23 = 0;
  if (AOPAudioDeviceHWManager::_HW_AudioGetControlValue(this, &v22, &v23))
  {
    *((_DWORD *)this + 23) = v23;
    sub_B390(v18, (uint64_t)"  kControlEnabledChannelMask:  ", 31);
    unint64_t v11 = (void *)std::ostream::operator<<();
    sub_B390(v11, (uint64_t)"\n", 1);
  }
  unint64_t v22 = 1;
  unint64_t v23 = 0;
  if (AOPAudioDeviceHWManager::_HW_AudioGetControlValue(this, &v22, &v23))
  {
    *((_DWORD *)this + 24) = v23;
    sub_B390(v18, (uint64_t)"  kControlActiveChannelMask:   ", 31);
    CFTypeID v12 = (void *)std::ostream::operator<<();
    sub_B390(v12, (uint64_t)"\n", 1);
  }
  sub_B390(v18, (uint64_t)"  listening enabled:                          ", 46);
  AOPAudioDeviceHWManager::HW_GetIsIORunning(this);
  char v13 = (void *)std::ostream::operator<<();
  sub_B390(v13, (uint64_t)"\n", 1);
  BOOL HasPropertyEnableListeningOnGesture = AOPAudioDeviceHWManager::HW_HasPropertyEnableListeningOnGesture(this);
  sub_B390(v18, (uint64_t)"  has listening on gesture:                   ", 46);
  char v15 = (void *)std::ostream::operator<<();
  sub_B390(v15, (uint64_t)"\n", 1);
  if (HasPropertyEnableListeningOnGesture)
  {
    sub_B390(v18, (uint64_t)"  listening on gesture enabled:               ", 46);
    AOPAudioDeviceHWManager::HW_IsListeningOnGestureEnabled(this);
    uint64_t v16 = (void *)std::ostream::operator<<();
    sub_B390(v16, (uint64_t)"\n", 1);
  }
  std::stringbuf::str();
  if (v19 < 0) {
    operator delete((void *)v18[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_16DB0(void *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __cxa_begin_catch(a1);
  unsigned int v2 = sub_B390((uint64_t *)va, (uint64_t)"  <exception thrown in HW_VoiceTriggerGetControlValue", 53);
  sub_B390(v2, (uint64_t)"\n", 1);
  __cxa_end_catch();
  JUMPOUT(0x16B50);
}

void sub_16DE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  __cxa_end_catch();
  sub_AC28((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t AOPAudioDeviceHWManager::RingBufferDescription::DumpToString(AOPAudioDeviceHWManager::RingBufferDescription *this)
{
  sub_AA0C((uint64_t)v6);
  sub_B390(v6, (uint64_t)"  mBuffer:                  ", 28);
  uint64_t v1 = (void *)std::ostream::operator<<();
  sub_B390(v1, (uint64_t)"\n", 1);
  sub_B390(v6, (uint64_t)"  mSizeBytes:               ", 28);
  unsigned int v2 = (void *)std::ostream::operator<<();
  sub_B390(v2, (uint64_t)"\n", 1);
  sub_B390(v6, (uint64_t)"  mSafetyOffsetFrames:      ", 28);
  uint64_t v3 = (void *)std::ostream::operator<<();
  sub_B390(v3, (uint64_t)"\n", 1);
  sub_B390(v6, (uint64_t)"  mZeroTimeStampWrapFrames: ", 28);
  unsigned __int8 v4 = (void *)std::ostream::operator<<();
  sub_B390(v4, (uint64_t)"\n", 1);
  std::stringbuf::str();
  if (v7 < 0) {
    operator delete((void *)v6[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_17020(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_AC28((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t AOPAudioDeviceHWManager::_DumpDebugSnapshots(AOPAudioDeviceHWManager *this)
{
  sub_AA0C((uint64_t)v28);
  uint64_t v1 = sub_B390(v28, (uint64_t)"DriverStatusInitial                     ", 40);
  unsigned int v2 = sub_B390(v1, (uint64_t)"\n", 1);
  sub_17568();
  if ((v27 & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  if ((v27 & 0x80u) == 0) {
    uint64_t v4 = v27;
  }
  else {
    uint64_t v4 = v26;
  }
  sub_B390(v2, (uint64_t)p_p, v4);
  if ((char)v27 < 0) {
    operator delete(__p);
  }
  uint64_t v5 = sub_B390(v28, (uint64_t)"DriverStatusCurrent                     ", 40);
  uint64_t v6 = sub_B390(v5, (uint64_t)"\n", 1);
  sub_17568();
  if ((v27 & 0x80u) == 0) {
    char v7 = &__p;
  }
  else {
    char v7 = __p;
  }
  if ((v27 & 0x80u) == 0) {
    uint64_t v8 = v27;
  }
  else {
    uint64_t v8 = v26;
  }
  sub_B390(v6, (uint64_t)v7, v8);
  if ((char)v27 < 0) {
    operator delete(__p);
  }
  uint64_t v9 = sub_B390(v28, (uint64_t)"SampleTimeInitial                       ", 40);
  sub_176F0();
  if ((v27 & 0x80u) == 0) {
    unint64_t v10 = &__p;
  }
  else {
    unint64_t v10 = __p;
  }
  if ((v27 & 0x80u) == 0) {
    uint64_t v11 = v27;
  }
  else {
    uint64_t v11 = v26;
  }
  sub_B390(v9, (uint64_t)v10, v11);
  if ((char)v27 < 0) {
    operator delete(__p);
  }
  CFTypeID v12 = sub_B390(v28, (uint64_t)"SampleTimeCurrent                       ", 40);
  sub_176F0();
  if ((v27 & 0x80u) == 0) {
    char v13 = &__p;
  }
  else {
    char v13 = __p;
  }
  if ((v27 & 0x80u) == 0) {
    uint64_t v14 = v27;
  }
  else {
    uint64_t v14 = v26;
  }
  sub_B390(v12, (uint64_t)v13, v14);
  if ((char)v27 < 0) {
    operator delete(__p);
  }
  char v15 = sub_B390(v28, (uint64_t)"ChecksumVerifier                        ", 40);
  sub_17888();
  if ((v27 & 0x80u) == 0) {
    uint64_t v16 = &__p;
  }
  else {
    uint64_t v16 = __p;
  }
  if ((v27 & 0x80u) == 0) {
    uint64_t v17 = v27;
  }
  else {
    uint64_t v17 = v26;
  }
  sub_B390(v15, (uint64_t)v16, v17);
  if ((char)v27 < 0) {
    operator delete(__p);
  }
  uint64_t v18 = sub_B390(v28, (uint64_t)"OOBOver                                 ", 40);
  sub_17888();
  if ((v27 & 0x80u) == 0) {
    char v19 = &__p;
  }
  else {
    char v19 = __p;
  }
  if ((v27 & 0x80u) == 0) {
    uint64_t v20 = v27;
  }
  else {
    uint64_t v20 = v26;
  }
  sub_B390(v18, (uint64_t)v19, v20);
  if ((char)v27 < 0) {
    operator delete(__p);
  }
  unint64_t v21 = sub_B390(v28, (uint64_t)"OOBUnder                                ", 40);
  sub_17888();
  if ((v27 & 0x80u) == 0) {
    unint64_t v22 = &__p;
  }
  else {
    unint64_t v22 = __p;
  }
  if ((v27 & 0x80u) == 0) {
    uint64_t v23 = v27;
  }
  else {
    uint64_t v23 = v26;
  }
  sub_B390(v21, (uint64_t)v22, v23);
  if ((char)v27 < 0) {
    operator delete(__p);
  }
  std::stringbuf::str();
  if (v29 < 0) {
    operator delete((void *)v28[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_17508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,char a35)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  sub_AC28((uint64_t)&a35);
  _Unwind_Resume(a1);
}

uint64_t sub_17568()
{
  sub_AA0C((uint64_t)v2);
  operator<<(v2);
  sub_B390(v2, (uint64_t)"  updates:            ", 22);
  id v0 = (void *)std::ostream::operator<<();
  sub_B390(v0, (uint64_t)"\n", 1);
  std::stringbuf::str();
  if (v3 < 0) {
    operator delete((void *)v2[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_176DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_AC28((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_176F0()
{
  sub_AA0C((uint64_t)v2);
  sub_B390(v2, (uint64_t)"[", 1);
  id v0 = (void *)std::ostream::operator<<();
  sub_B390(v0, (uint64_t)", updates: ", 11);
  std::ostream::operator<<();
  sub_B390(v2, (uint64_t)"]\n", 2);
  std::stringbuf::str();
  if (v3 < 0) {
    operator delete((void *)v2[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_17874(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_AC28((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_17888()
{
  sub_AA0C((uint64_t)v3);
  sub_B390(v3, (uint64_t)"[passes: ", 9);
  id v0 = (void *)std::ostream::operator<<();
  sub_B390(v0, (uint64_t)"/", 1);
  uint64_t v1 = (void *)std::ostream::operator<<();
  sub_B390(v1, (uint64_t)"]\n", 2);
  std::stringbuf::str();
  if (v4 < 0) {
    operator delete((void *)v3[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_179F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_AC28((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t AOPAudioDeviceHWManager::_DumpDriverStatus(AOPAudioDeviceHWManager *this)
{
  sub_AA0C((uint64_t)v8);
  if (*((void *)this + 10))
  {
    unsigned int v2 = sub_B390(v8, (uint64_t)"DriverStatus:                           ", 40);
    char v3 = sub_B390(v2, (uint64_t)"\n", 1);
    char v4 = operator<<(v3);
  }
  else
  {
    uint64_t v5 = sub_B390(v8, (uint64_t)"DriverStatus:                           ", 40);
    uint64_t v6 = sub_B390(v5, (uint64_t)"\n", 1);
    char v4 = sub_B390(v6, (uint64_t)"<null>", 6);
  }
  sub_B390(v4, (uint64_t)"\n", 1);
  std::stringbuf::str();
  if (v9 < 0) {
    operator delete((void *)v8[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_17BB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_AC28((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t AOPAudioDeviceHWManager::HW_DumpDriverState(AOPAudioDeviceHWManager *this)
{
  sub_AA0C((uint64_t)v22);
  unsigned int v2 = sub_B390(v22, (uint64_t)"InputRingBuffer:                      \n", 39);
  AOPAudioDeviceHWManager::RingBufferDescription::DumpToString((uint64_t *)&__p, (AOPAudioDeviceHWManager::RingBufferDescription *)((char *)this + 56));
  if ((v21 & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  if ((v21 & 0x80u) == 0) {
    uint64_t v4 = v21;
  }
  else {
    uint64_t v4 = v20;
  }
  uint64_t v5 = sub_B390(v2, (uint64_t)p_p, v4);
  sub_B390(v5, (uint64_t)"\n", 1);
  if ((char)v21 < 0) {
    operator delete(__p);
  }
  AOPAudioDeviceHWManager::_DumpDriverStatus((uint64_t *)&__p, this);
  if ((v21 & 0x80u) == 0) {
    uint64_t v6 = &__p;
  }
  else {
    uint64_t v6 = __p;
  }
  if ((v21 & 0x80u) == 0) {
    uint64_t v7 = v21;
  }
  else {
    uint64_t v7 = v20;
  }
  sub_B390(v22, (uint64_t)v6, v7);
  if ((char)v21 < 0) {
    operator delete(__p);
  }
  sub_B390(v22, (uint64_t)"mVoiceTriggerEnabled:                   ", 40);
  uint64_t v8 = (void *)std::ostream::operator<<();
  sub_B390(v8, (uint64_t)"\n", 1);
  sub_B390(v22, (uint64_t)"mEnabledChannelMask:                    ", 40);
  char v9 = (void *)std::ostream::operator<<();
  sub_B390(v9, (uint64_t)"\n", 1);
  sub_B390(v22, (uint64_t)"mActiveChannelMask:                     ", 40);
  unint64_t v10 = (void *)std::ostream::operator<<();
  sub_B390(v10, (uint64_t)"\n", 1);
  sub_B390(v22, (uint64_t)"mInputSampleRate:                       ", 40);
  uint64_t v11 = (void *)std::ostream::operator<<();
  sub_B390(v11, (uint64_t)"\n", 1);
  CFTypeID v12 = sub_B390(v22, (uint64_t)"_HW_ description:                     \n", 39);
  AOPAudioDeviceHWManager::_GetHWDescription((uint64_t *)&__p, this);
  if ((v21 & 0x80u) == 0) {
    char v13 = &__p;
  }
  else {
    char v13 = __p;
  }
  if ((v21 & 0x80u) == 0) {
    uint64_t v14 = v21;
  }
  else {
    uint64_t v14 = v20;
  }
  char v15 = sub_B390(v12, (uint64_t)v13, v14);
  sub_B390(v15, (uint64_t)"\n", 1);
  if ((char)v21 < 0) {
    operator delete(__p);
  }
  AOPAudioDeviceHWManager::_DumpDebugSnapshots((uint64_t *)&__p, this);
  if ((v21 & 0x80u) == 0) {
    uint64_t v16 = &__p;
  }
  else {
    uint64_t v16 = __p;
  }
  if ((v21 & 0x80u) == 0) {
    uint64_t v17 = v21;
  }
  else {
    uint64_t v17 = v20;
  }
  sub_B390(v22, (uint64_t)v16, v17);
  if ((char)v21 < 0) {
    operator delete(__p);
  }
  std::stringbuf::str();
  if (v23 < 0) {
    operator delete((void *)v22[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_17EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_AC28((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t sub_17F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t sub_17FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *sub_1806C(void *a1)
{
  unsigned int v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *sub_180F0(void *a1)
{
  unsigned int v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void sub_18178()
{
}

void *sub_1818C()
{
  double result = operator new(0x10uLL);
  *double result = off_24C48;
  return result;
}

void sub_181C4(uint64_t a1, void *a2)
{
  *a2 = off_24C48;
}

BOOL sub_181EC(uint64_t a1, void *a2)
{
  return *a2 != 0;
}

void sub_18200()
{
}

void *sub_18214()
{
  double result = operator new(0x10uLL);
  *double result = off_24C90;
  return result;
}

void sub_1824C(uint64_t a1, void *a2)
{
  *a2 = off_24C90;
}

BOOL sub_18274(uint64_t a1, void *a2, void *a3)
{
  return *a2 <= *a3;
}

void sub_1828C()
{
}

void *sub_182A0()
{
  double result = operator new(0x10uLL);
  *double result = off_24CD8;
  return result;
}

void sub_182D8(uint64_t a1, void *a2)
{
  *a2 = off_24CD8;
}

BOOL sub_18300(uint64_t a1, void *a2, void *a3)
{
  return *a2 >= *a3;
}

BOOL VoiceTriggerFileLoggingIsEnabled(void)
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  int Value = CFBooleanGetValue(v0);
  CFRelease(v0);
  if (!Value) {
    return 0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  AppIntegerint Value = CFPreferencesGetAppIntegerValue(@"Second Pass Audio Logging Enabled", @"com.apple.voicetrigger", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppIntegerValue <= 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

BOOL PowerWakeFileLoggingIsEnabled(void)
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  int Value = CFBooleanGetValue(v0);
  CFRelease(v0);
  if (!Value) {
    return 0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  AppIntegerint Value = CFPreferencesGetAppIntegerValue(@"Log AOP Audio On Wake", @"com.apple.voicetrigger", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppIntegerValue <= 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

BOOL ForceReadInputDataBufferNull(void)
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  int Value = CFBooleanGetValue(v0);
  CFRelease(v0);
  if (!Value) {
    return 0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  AppIntegerint Value = CFPreferencesGetAppIntegerValue(@"Force ReadInputData Buffer Null", @"com.apple.voicetrigger", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppIntegerValue <= 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

void *GetOrCreateAudioLogDirectory@<X0>(void *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_28A88, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_28A88))
  {
    qword_28A80 = (uint64_t)sub_18534();
    __cxa_guard_release(&qword_28A88);
  }
  unsigned int v2 = (char *)qword_28A80;

  return sub_1863C(a1, v2);
}

void sub_1851C(_Unwind_Exception *a1)
{
}

const char *sub_18534()
{
  CFBooleanRef v0 = +[NSFileManager defaultManager];
  unsigned __int8 v1 = [v0 fileExistsAtPath:@"/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio/" isDirectory:0];

  if (v1)
  {
    id v2 = 0;
  }
  else
  {
    syslog(3, "dir doesn't exist }\n");
    BOOL v3 = +[NSFileManager defaultManager];
    id v7 = 0;
    unsigned __int8 v4 = [v3 createDirectoryAtPath:@"/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio/" withIntermediateDirectories:1 attributes:0 error:&v7];
    id v2 = v7;

    if ((v4 & 1) == 0)
    {
      syslog(3, "could not create }\n");
      uint64_t v5 = "/tmp";
      goto LABEL_6;
    }
  }
  uint64_t v5 = "/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio/";
LABEL_6:

  return v5;
}

void sub_1861C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1863C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_B768();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void CACFMachPort::CACFMachPort(CACFMachPort *this, void (__cdecl *a2)(CFMachPortRef, void *, CFIndex, void *), void *a3)
{
  *(void *)this = &off_24D20;
  *((void *)this + 1) = 0;
  size_t v4 = (CFMachPortRef *)((char *)this + 8);
  *((void *)this + 2) = 0;
  *((unsigned char *)this + 24) = 1;
  context.version = 1;
  context.info = a3;
  memset(&context.retain, 0, 24);
  size_t v5 = CFMachPortCreate(0, a2, &context, 0);
  *size_t v4 = v5;
  if (!v5)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7) {
      sub_1A27C(v7, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_8:
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 2003329396;
  }
  CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0, v5, 0);
  *((void *)this + 2) = RunLoopSource;
  if (!RunLoopSource)
  {
    CFMachPortInvalidate(*v4);
    CFRelease(*v4);
    *size_t v4 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CACFMachPort::CACFMachPort(s): couldn't create the CFRunLoopSource", v16, 2u);
    }
    goto LABEL_8;
  }
}

void CACFMachPort::CACFMachPort(CACFMachPort *this, mach_port_t a2, CFMachPortCallBack callout, void (__cdecl *a4)(CFMachPortRef, void *), void *a5)
{
  *(void *)this = &off_24D20;
  *((void *)this + 1) = 0;
  BOOL v7 = (CFMachPortRef *)((char *)this + 8);
  *((void *)this + 2) = 0;
  *((unsigned char *)this + 24) = 0;
  context.version = 1;
  context.info = a5;
  memset(&context.retain, 0, 24);
  if (a2)
  {
    CFMachPortRef v8 = CFMachPortCreateWithPort(0, a2, callout, &context, 0);
    *BOOL v7 = v8;
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = 0;
      goto LABEL_6;
    }
    BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v13) {
      sub_1A2F4(v13, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_18:
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = off_24B68;
    exception[2] = 2003329396;
  }
  CFMachPortRef v11 = CFMachPortCreate(0, callout, &context, 0);
  *BOOL v7 = v11;
  if (!v11)
  {
    BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v21) {
      sub_1A2B8(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_18;
  }
  uint64_t v9 = v11;
  char v10 = 1;
LABEL_6:
  *((unsigned char *)this + 24) = v10;
  CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0, v9, 0);
  *((void *)this + 2) = RunLoopSource;
  if (!RunLoopSource)
  {
    if (*((unsigned char *)this + 24)) {
      CFMachPortInvalidate(*v7);
    }
    CFRelease(*v7);
    *BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v30 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CACFMachPort::CACFMachPort: couldn't create the CFRunLoopSource", v30, 2u);
    }
    goto LABEL_18;
  }
  if (a4) {
    CFMachPortSetInvalidationCallBack(*v7, a4);
  }
}

void CACFMachPort::~CACFMachPort(CACFMachPort *this)
{
  *(void *)this = &off_24D20;
  id v2 = (const void *)*((void *)this + 2);
  if (v2) {
    CFRelease(v2);
  }
  BOOL v3 = (__CFMachPort *)*((void *)this + 1);
  if (v3)
  {
    if (*((unsigned char *)this + 24))
    {
      CFMachPortInvalidate(v3);
      BOOL v3 = (__CFMachPort *)*((void *)this + 1);
    }
    CFRelease(v3);
  }
}

{
  uint64_t vars8;

  CACFMachPort::~CACFMachPort(this);

  operator delete();
}

uint64_t CACFMachPort::ReceiveMessage(CFMachPortRef *this, mach_msg_size_t a2, mach_msg_header_t *a3, mach_msg_timeout_t a4)
{
  mach_port_t Port = CFMachPortGetPort(this[1]);
  *(void *)&a3->msgh_bits = 0;
  a3->msgh_remote_port = 0;
  a3->msgh_local_port = Port;
  *(void *)&a3->msgh_voucher_port = 0;
  if (a4) {
    mach_msg_option_t v8 = 258;
  }
  else {
    mach_msg_option_t v8 = 2;
  }

  return mach_msg(a3, v8, 0, a2, Port, a4, 0);
}

id AppleAOPAudioPluginFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x44u, 0x3Au, 0xBAu, 0xB8u, 0xE7u, 0xB3u, 0x49u, 0x1Au, 0xB9u, 0x85u, 0xBEu, 0xB9u, 0x18u, 0x70u, 0x30u, 0xDBu);
  if (!CFEqual(a2, v3)) {
    return 0;
  }
  size_t v4 = +[AppleAOPAudioPlugin sharedPlugin];
  id v5 = [v4 driverRef];

  return v5;
}

void sub_18BE8()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " IOKitObject::SetProperty: got an error from the IORegistry, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_18C58()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " IOKitObject::CacheProperties: failed to get the properties from the IO Registry, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_18CC8()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " HALS_IOA1PlugIn::_Activate: IOMainPort failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_18D38()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " IOKitObject::OpenConnection: failed to open a connection, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_18DA8()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " IOKitObject::SetConnectionNotificationPort: Cannot set the connection's's notification port., Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_18E18()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " IOKitObject::MapMemory: mapped in a NULL pointer", v0, 2u);
}

void sub_18E60()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " IOKitObject::MapMemory: failed to map in the memory, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_18ED0()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " IOKitObject::ReleaseMemory: failed to release the memory, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_18F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_19030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1906C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_190A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_190E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_19120(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)", (uint8_t *)v2, 0x12u);
}

void sub_191AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_191E8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " CACFDistributedNotification::PostNotification: distributed notifications do not support per-session delivery", v0, 2u);
}

void sub_19230()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " CACFDistributedNotification::PostNotification: distributed notifications do not support a payload", v0, 2u);
}

void sub_19278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_192B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_192F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1932C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_19368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_193A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_193E0(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " CADispatchQueue::RemoveMachPortReceiver: deallocating the receive right failed, Error: 0x%X", (uint8_t *)v1, 8u);
}

void sub_19460(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " CADispatchQueue::RemoveMachPortReceiver: deallocating the send right failed, Error: 0x%X", (uint8_t *)v1, 8u);
}

void sub_194E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1951C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " AppleAOPAudioPlugin::startDeviceListNotifications: IONotificationPortCreate failed", v0, 2u);
}

void sub_19564()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " AppleAOPAudioPlugin::startDeviceListNotifications: IOServiceMatching for Audio Service failed ", v0, 2u);
}

void sub_195AC()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AppleAOPAudioPlugin::_StartDeviceListNotifications: IOServiceAddMatchingNotification no matching notification for Voice Trigger service., Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_1961C()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AppleAOPAudioPlugin::_StartDeviceListNotifications: IOServiceAddMatchingNotification failed for Audio service, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_1968C()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AppleAOPAudioPlugin::_StartDeviceListNotifications: kIOMainPortDefault failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_196FC()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AppleAOPAudioPlugin::addVoiceTriggerService: Cannot add an interest callback., Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_1976C()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AppleAOPAudioPlugin::_AddDevice: Cannot add an interest callback., Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_197DC()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " BorealisOwl_Device::_HW_Open: user client method failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_1984C()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_AddVoiceTriggerSupport: user client method failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_198BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_198F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_19934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_19970()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_StartIO: user client method failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_199E0()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_StopIO: user client method failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19A50()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::_HW_VoiceTriggerGetControlValue: user client method failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19AC0()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::_HW_VoiceTriggerSetControlValue: user client method failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_19B6C()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::_HW_GetVoiceTriggerData: user client method failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19BDC()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_IsVoiceTriggerSupported() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19C4C()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_IsVoiceTriggerEnabled() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19CBC()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_GetIsIORunning() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19D2C()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_GetBytesPerSample() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19D9C()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_GetChannelsPerFrame() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19E0C()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_GetFramesPerPacket() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19E7C()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_GetInputSamplesPerSec() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19EEC()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_GetZeroTimeStampWrapFrames() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19F5C()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_GetSafetyOffsetFrames() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_19FCC()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_GetDeviceInputLatencyFrames() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_1A03C()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_HasPropertyEnableListeningOnGesture() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_1A0AC()
{
  sub_18314();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_IsListeningOnGestureEnabled() failed to get registry key, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_1A11C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A194()
{
  sub_4B60();
  sub_4B44(&dword_0, &_os_log_default, v0, " AOPAudioDeviceHWManager::HW_SetVoiceTriggerConfiguration() failed to set connection property, Error: 0x%X", v1, v2, v3, v4, v5);
}

void sub_1A204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A27C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A2B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1A2F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t CACentralStateDumpRegisterSubsystem()
{
  return _CACentralStateDumpRegisterSubsystem();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetFirstIndexOfValue(theArray, range, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return _CFMachPortCreate(allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return _CFMachPortCreateRunLoopSource(allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return _CFMachPortCreateWithPort(allocator, portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return _CFMachPortGetPort(port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

CFMessagePortRef CFMessagePortCreateLocal(CFAllocatorRef allocator, CFStringRef name, CFMessagePortCallBack callout, CFMessagePortContext *context, Boolean *shouldFreeInfo)
{
  return _CFMessagePortCreateLocal(allocator, name, callout, context, shouldFreeInfo);
}

CFMessagePortRef CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name)
{
  return _CFMessagePortCreateRemote(allocator, name);
}

CFRunLoopSourceRef CFMessagePortCreateRunLoopSource(CFAllocatorRef allocator, CFMessagePortRef local, CFIndex order)
{
  return _CFMessagePortCreateRunLoopSource(allocator, local, order);
}

void CFMessagePortInvalidate(CFMessagePortRef ms)
{
}

void CFMessagePortSetDispatchQueue(CFMessagePortRef ms, dispatch_queue_t queue)
{
}

void CFMessagePortSetInvalidationCallBack(CFMessagePortRef ms, CFMessagePortInvalidationCallBack callout)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return _CFNumberGetType(number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

double CFStringGetDoubleValue(CFStringRef str)
{
  return _CFStringGetDoubleValue(str);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFTypeID CFURLGetTypeID(void)
{
  return _CFURLGetTypeID();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return _CFUUIDGetTypeID();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return _IOConnectMapMemory64(connect, memoryType, intoTask, atAddress, ofSize, options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return _IOConnectSetCFProperty(connect, propertyName, property);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return _IOConnectSetNotificationPort(connect, type, port, reference);
}

kern_return_t IOConnectTrap0(io_connect_t connect, uint32_t index)
{
  return _IOConnectTrap0(connect, index);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return _IOConnectUnmapMemory64(connect, memoryType, fromTask, atAddress);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return _IOObjectIsEqualTo(object, anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetParentIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return std::bad_alloc::bad_alloc(this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __udivti3()
{
  return ___udivti3();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

clock_t clock(void)
{
  return _clock();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_after_f(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return _pthread_equal(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return _pthread_mutex_trylock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void syslog(int a1, const char *a2, ...)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bitsPerChannel(void *a1, const char *a2, ...)
{
  return [a1 bitsPerChannel];
}

id objc_msgSend_bytesPerFrame(void *a1, const char *a2, ...)
{
  return [a1 bytesPerFrame];
}

id objc_msgSend_bytesPerPacket(void *a1, const char *a2, ...)
{
  return [a1 bytesPerPacket];
}

id objc_msgSend_channelsPerFrame(void *a1, const char *a2, ...)
{
  return [a1 channelsPerFrame];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_deviceUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUID];
}

id objc_msgSend_driverRef(void *a1, const char *a2, ...)
{
  return [a1 driverRef];
}

id objc_msgSend_dumpToString(void *a1, const char *a2, ...)
{
  return [a1 dumpToString];
}

id objc_msgSend_formatFlags(void *a1, const char *a2, ...)
{
  return [a1 formatFlags];
}

id objc_msgSend_formatID(void *a1, const char *a2, ...)
{
  return [a1 formatID];
}

id objc_msgSend_framesPerPacket(void *a1, const char *a2, ...)
{
  return [a1 framesPerPacket];
}

id objc_msgSend_getAudioDevice(void *a1, const char *a2, ...)
{
  return [a1 getAudioDevice];
}

id objc_msgSend_getBytesPerFrame(void *a1, const char *a2, ...)
{
  return [a1 getBytesPerFrame];
}

id objc_msgSend_getBytesPerPacket(void *a1, const char *a2, ...)
{
  return [a1 getBytesPerPacket];
}

id objc_msgSend_getBytesPerSample(void *a1, const char *a2, ...)
{
  return [a1 getBytesPerSample];
}

id objc_msgSend_getChannelsPerFrame(void *a1, const char *a2, ...)
{
  return [a1 getChannelsPerFrame];
}

id objc_msgSend_getDiagonsticData(void *a1, const char *a2, ...)
{
  return [a1 getDiagonsticData];
}

id objc_msgSend_getFramesPerPacket(void *a1, const char *a2, ...)
{
  return [a1 getFramesPerPacket];
}

id objc_msgSend_getIOKitObject(void *a1, const char *a2, ...)
{
  return [a1 getIOKitObject];
}

id objc_msgSend_getNumCustomProperties(void *a1, const char *a2, ...)
{
  return [a1 getNumCustomProperties];
}

id objc_msgSend_getSampleRateHz(void *a1, const char *a2, ...)
{
  return [a1 getSampleRateHz];
}

id objc_msgSend_getStartCount(void *a1, const char *a2, ...)
{
  return [a1 getStartCount];
}

id objc_msgSend_hasInput(void *a1, const char *a2, ...)
{
  return [a1 hasInput];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return [a1 manufacturerName];
}

id objc_msgSend_modelName(void *a1, const char *a2, ...)
{
  return [a1 modelName];
}

id objc_msgSend_modelUID(void *a1, const char *a2, ...)
{
  return [a1 modelUID];
}

id objc_msgSend_notifyDevicePropertiesChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyDevicePropertiesChanged];
}

id objc_msgSend_notifyStreamPropertiesChanged(void *a1, const char *a2, ...)
{
  return [a1 notifyStreamPropertiesChanged];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_physicalFormat(void *a1, const char *a2, ...)
{
  return [a1 physicalFormat];
}

id objc_msgSend_plugin(void *a1, const char *a2, ...)
{
  return [a1 plugin];
}

id objc_msgSend_readAvailablePastData(void *a1, const char *a2, ...)
{
  return [a1 readAvailablePastData];
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return [a1 sampleRate];
}

id objc_msgSend_samplingRate(void *a1, const char *a2, ...)
{
  return [a1 samplingRate];
}

id objc_msgSend_sharedPlugin(void *a1, const char *a2, ...)
{
  return [a1 sharedPlugin];
}

id objc_msgSend_startDeviceListNotifications(void *a1, const char *a2, ...)
{
  return [a1 startDeviceListNotifications];
}

id objc_msgSend_tryPerformStartIO(void *a1, const char *a2, ...)
{
  return [a1 tryPerformStartIO];
}

id objc_msgSend_tryPerformStopIO(void *a1, const char *a2, ...)
{
  return [a1 tryPerformStopIO];
}

id objc_msgSend_updateStreamDescription(void *a1, const char *a2, ...)
{
  return [a1 updateStreamDescription];
}

id objc_msgSend_voiceTriggerGetConfigureDataId(void *a1, const char *a2, ...)
{
  return [a1 voiceTriggerGetConfigureDataId];
}

id objc_msgSend_voiceTriggerGetData(void *a1, const char *a2, ...)
{
  return [a1 voiceTriggerGetData];
}