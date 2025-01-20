uint64_t HMXPCGetNextClientID()
{
  if (HMXPCGetNextClientID_sOnce != -1) {
    dispatch_once(&HMXPCGetNextClientID_sOnce, &__block_literal_global);
  }
  return atomic_fetch_add((atomic_uint *volatile)&HMXPCGetNextClientID_sNext, 1u) + 1;
}

uint64_t __HMXPCGetNextClientID_block_invoke()
{
  uint64_t result = RandomBytes();
  HMXPCGetNextClientID_sNext = (unsigned __int16)word_26B21C24A << 16;
  return result;
}

id HMEarLossDataToArray(void *a1)
{
  v21[8] = *MEMORY[0x263EF8340];
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    [a1 getBytes:&v19 length:32];
    LODWORD(v1) = v19;
    v2 = [NSNumber numberWithFloat:v1];
    v21[0] = v2;
    LODWORD(v3) = DWORD1(v19);
    v4 = [NSNumber numberWithFloat:v3];
    v21[1] = v4;
    LODWORD(v5) = DWORD2(v19);
    v6 = [NSNumber numberWithFloat:v5];
    v21[2] = v6;
    LODWORD(v7) = HIDWORD(v19);
    v8 = [NSNumber numberWithFloat:v7];
    v21[3] = v8;
    LODWORD(v9) = v20;
    v10 = [NSNumber numberWithFloat:v9];
    v21[4] = v10;
    LODWORD(v11) = DWORD1(v20);
    v12 = [NSNumber numberWithFloat:v11];
    v21[5] = v12;
    LODWORD(v13) = DWORD2(v20);
    v14 = [NSNumber numberWithFloat:v13];
    v21[6] = v14;
    LODWORD(v15) = HIDWORD(v20);
    v16 = [NSNumber numberWithFloat:v15];
    v21[7] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:8];
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

id HMEarLossArrayToData(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    memset(v18, 0, sizeof(v18));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      int v6 = 0;
      uint64_t v7 = *(void *)v15;
LABEL_4:
      uint64_t v8 = 0;
      uint64_t v9 = v6;
      v10 = (char *)v18 + 4 * v6;
      while (1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        if (v9 + v8 == 8) {
          break;
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v8), "doubleValue", (void)v14);
        *(float *)&double v11 = v11;
        *(_DWORD *)&v10[4 * v8++] = LODWORD(v11);
        if (v5 == v8)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
          int v6 = v9 + v8;
          if (v5) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v18 length:32];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

BOOL HMOcclusionResultIsOverallPassing(int a1)
{
  return (a1 - 3) < 4;
}

void sub_2511F3C60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2511F40FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2511F45C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2511F4964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2511F52BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2511F672C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2511F6838(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x270F23D78]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x270F23E70]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x270F23EB0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t CUMetricsLog()
{
  return MEMORY[0x270F23F60]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x270F23FC0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x270F24450]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x270F24458]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x270F24468]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x270F24470]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x270F24490]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x270F24630]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}