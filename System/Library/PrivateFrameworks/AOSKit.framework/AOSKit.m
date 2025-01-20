void *AOSAccountCreate(uint64_t a1, const void *a2, const void *a3, const void *a4)
{
  void *Instance;
  CFTypeRef v8;
  CFTypeRef v9;

  if (!kAOSAccountTypeID) {
    kAOSAccountTypeID = _CFRuntimeRegisterClass();
  }
  Instance = (void *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a2) {
      Instance[2] = CFRetain(a2);
    }
    if (a3) {
      v8 = CFRetain(a3);
    }
    else {
      v8 = 0;
    }
    Instance[3] = v8;
    if (a4) {
      v9 = CFRetain(a4);
    }
    else {
      v9 = 0;
    }
    Instance[4] = v9;
    if (!Instance[2])
    {
      CFRelease(Instance);
      return 0;
    }
  }
  return Instance;
}

void *AOSAccountCopyAuthInfo(uint64_t a1, void *a2, uint64_t a3, CFErrorRef *a4)
{
  id v7 = objc_alloc_init(MEMORY[0x263F086B0]);
  if (!a1)
  {
    if (_AOSValidateURL(a2))
    {
      v8 = 0;
      goto LABEL_11;
    }
LABEL_13:
    NSLog(&cfstr_AoskitErrorInv.isa, a2);
    CFIndex v15 = 5001;
    if (!a4)
    {
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
LABEL_14:
    CFErrorRef v14 = CFErrorCreate(0, kAOSErrorDomain, v15, 0);
    v8 = 0;
    goto LABEL_15;
  }
  v8 = *(void **)(a1 + 16);
  if (!_AOSValidateURL(a2)) {
    goto LABEL_13;
  }
  if (!v8) {
    goto LABEL_11;
  }
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F25750], "sharedManager"), "accountWithUsername:", v8);
  if (!v9)
  {
    NSLog(&cfstr_AoskitErrorNoA.isa, v8);
    goto LABEL_18;
  }
  v10 = v9;
  uint64_t v11 = [v9 personID];
  uint64_t v12 = [v10 authToken];
  uint64_t v13 = v12;
  if (!v11 || !v12)
  {
    NSLog(&cfstr_AoskitErrorInv_0.isa, v8, v11, v12 != 0);
LABEL_18:
    CFIndex v15 = 5000;
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  v8 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:v11 forKey:kAOSPersonIDKey];
  [v8 setObject:v13 forKey:kAOSAuthTokenKey];
  if (v8) {
    CFRetain(v8);
  }
LABEL_11:
  if (a4)
  {
    CFErrorRef v14 = 0;
LABEL_15:
    *a4 = v14;
  }
LABEL_20:
  [v7 drain];
  return v8;
}

uint64_t AOSAccountGetUser(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t _AOSValidateURL(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  v3 = (void *)[a1 host];
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "scheme"), "lowercaseString"), "isEqualToString:", @"https");
  v5 = objc_msgSend((id)objc_msgSend(v3, "lowercaseString"), "componentsSeparatedByString:", @".");
  int v6 = [v5 count];
  int v7 = v6;
  BOOL v14 = 0;
  if (v6 >= 2)
  {
    uint64_t v8 = [v5 objectAtIndex:(v6 - 1)];
    uint64_t v9 = [v5 objectAtIndex:(v7 - 2)];
    v10 = (void *)[NSString stringWithFormat:@"%@.%@", v9, v8];
    uint64_t v11 = v10;
    if (v10)
    {
      if ([v10 length])
      {
        if (([v11 isEqualToString:@"icloud.com"] & 1) != 0
          || ([v11 isEqualToString:@"me.com"] & 1) != 0
          || ([v11 isEqualToString:@"mac.com"] & 1) != 0
          || ([v11 isEqualToString:@"apple.com"] & 1) != 0
          || (uint64_t v12 = (void *)[v3 lowercaseString],
              ([v12 isEqualToString:@"icloud.com.cn"] & 1) != 0)
          || [v12 hasSuffix:@".icloud.com.cn"]
          && (unint64_t v13 = [v12 length], v13 > objc_msgSend(@".icloud.com.cn", "length"))
          || [v11 isEqualToString:GetDomain()])
        {
          BOOL v14 = 1;
        }
      }
    }
  }
  [v2 drain];
  return v4 & v14;
}

void sub_23818B6E8()
{
}

AOSTransaction *_AOSAccountResolveAuthFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t *a6)
{
  id v12 = objc_alloc_init(MEMORY[0x263F086B0]);
  unint64_t v13 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  BOOL v14 = v13;
  if (a2) {
    [v13 setObject:a2 forKey:kAOSAuthRequestURLKey];
  }
  if (a3) {
    [v14 setObject:a3 forKey:kAOSAuthRealmKey];
  }
  if (a4) {
    [v14 setObject:a4 forKey:kAOSAuthPreviousTokenKey];
  }
  uint64_t v15 = [NSNumber numberWithBool:a5 != 0];
  [v14 setObject:v15 forKey:kAOSAuthUIAllowedKey];
  v16 = AOSLaunchAuthThread(a1, (uint64_t)v14, a6);
  [v12 drain];
  return v16;
}

uint64_t AOSAccountGetPassword(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t AOSAccountGetAppleID(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t AOSAccountGetProperties(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

void _AOSAccountSetProperties(uint64_t a1, CFTypeRef cf)
{
  if (a1)
  {
    v3 = *(const void **)(a1 + 32);
    CFTypeRef v4 = cf ? CFRetain(cf) : 0;
    *(void *)(a1 + 32) = v4;
    if (v3)
    {
      CFRelease(v3);
    }
  }
}

uint64_t GetDomain()
{
  uint64_t result = _otherDomain;
  if (!_otherDomain)
  {
    _otherDomain = (uint64_t)objc_alloc_init(MEMORY[0x263F089D8]);
    [(id)_otherDomain appendFormat:@"%@", @"digit"];
    objc_msgSend((id)_otherDomain, "appendFormat:", @"%c", 97);
    objc_msgSend((id)_otherDomain, "appendFormat:", @"%c", 108);
    objc_msgSend((id)_otherDomain, "appendFormat:", @"%c", 104);
    objc_msgSend((id)_otherDomain, "appendFormat:", @"%c", 117);
    objc_msgSend((id)_otherDomain, "appendFormat:", @"%c", 98);
    objc_msgSend((id)_otherDomain, "appendFormat:", @"%c", 46);
    [(id)_otherDomain appendFormat:@"%@", @"com"];
    return _otherDomain;
  }
  return result;
}

void AOSAccountDestroy(void *a1)
{
  id v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    a1[2] = 0;
  }
  v3 = (const void *)a1[3];
  if (v3)
  {
    CFRelease(v3);
    a1[3] = 0;
  }
  CFTypeRef v4 = (const void *)a1[4];
  if (v4)
  {
    CFRelease(v4);
    a1[4] = 0;
  }
}

void sub_23818BE50()
{
}

AOSTransaction *AOSLaunchAuthThread(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  id v6 = objc_alloc_init(MEMORY[0x263F086B0]);
  int v7 = AOSTransactionCreate(*MEMORY[0x263EFFB08], a3);
  uint64_t v8 = +[AOSContext contextWithAccount:a1 andTransaction:v7];
  uint64_t v9 = v8;
  if (v8) {
    CFRetain(v8);
  }
  [(AOSContext *)v9 setInfo:a2];
  objc_msgSend(MEMORY[0x263F08B88], "detachNewThreadSelector:toTarget:withObject:", sel_runAuthThreadWithContext_, +[AOSThreadManager sharedManager](AOSThreadManager, "sharedManager"), v9);
  if (!AOSTransactionIsAsync((uint64_t)v7)) {
    AOSTransactionWaitUntilFinished((uint64_t)v7);
  }
  [v6 drain];
  return v7;
}

void sub_23818C330(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23818C3DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

AOSTransaction *AOSTransactionCreate(uint64_t a1, uint64_t *a2)
{
  v3 = objc_alloc_init(AOSTransaction);
  CFTypeRef v4 = v3;
  if (!a2) {
    return v4;
  }
  if (!v3) {
    return v4;
  }
  v5 = (void *)a2[1];
  if (!v5 && !a2[6]) {
    return v4;
  }
  uint64_t v6 = *a2;
  v3->callbackFunction = v5;
  if (v6 >= 1)
  {
    int v7 = (void *)a2[6];
    if (v7) {
      int v7 = (void *)CFRetain((CFTypeRef)[v7 copy]);
    }
    v4->callbackBlock = v7;
    global_queue = a2[7];
    if (global_queue)
    {
      v4->callbackQueue = (OS_dispatch_queue *)global_queue;
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v4->callbackQueue = (OS_dispatch_queue *)global_queue;
      if (!global_queue) {
        goto LABEL_12;
      }
    }
    dispatch_retain(global_queue);
  }
LABEL_12:
  uint64_t v9 = a2[2];
  if (v9)
  {
    v10 = (uint64_t (*)(void))a2[3];
    if (v10)
    {
      v4->contextRetain = v10;
      uint64_t v9 = v10();
    }
    v4->context = (void *)v9;
    uint64_t v11 = (void *)a2[4];
    if (v11) {
      v4->contextRelease = v11;
    }
  }
  return v4;
}

uint64_t AOSTransactionSuccessful(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t AOSTransactionSetSuccessful(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

uint64_t AOSTransactionGetResult(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

void AOSTransactionSetResult(uint64_t a1, CFTypeRef cf)
{
  if (a1)
  {
    if (cf)
    {
      CFTypeRef v2 = *(CFTypeRef *)(a1 + 16);
      if (v2 != cf)
      {
        *(void *)(a1 + 16) = CFRetain(cf);
        if (v2)
        {
          CFRelease(v2);
        }
      }
    }
  }
}

uint64_t AOSTransactionGetError(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void AOSTransactionSetError(uint64_t a1, CFTypeRef cf)
{
  if (a1)
  {
    if (cf)
    {
      CFTypeRef v2 = *(CFTypeRef *)(a1 + 24);
      if (v2 != cf)
      {
        *(void *)(a1 + 24) = CFRetain(cf);
        if (v2)
        {
          CFRelease(v2);
        }
      }
    }
  }
}

uint64_t AOSTransactionIsFinished(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 9);
}

uint64_t AOSTransactionSetIsFinished(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v2 = result;
    *(unsigned char *)(result + 9) = a2;
    if (a2)
    {
      [*(id *)(result + 64) lock];
      v3 = *(void **)(v2 + 64);
      return [v3 unlockWithCondition:1];
    }
  }
  return result;
}

void *AOSTransactionCancel(void *result)
{
  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    v1[4] = 0;
    uint64_t v2 = (const void *)v1[5];
    if (v2)
    {
      CFRelease(v2);
      v3 = (void *)v1[5];
    }
    else
    {
      v3 = 0;
    }

    v1[5] = 0;
    return objc_sync_exit(v1);
  }
  return result;
}

void sub_23818C804(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AOSTransactionGetCallbackFunction(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t AOSTransactionGetCallbackBlock(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t AOSTransactionGetCallbackQueue(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t AOSTransactionGetContext(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t AOSTransactionWaitUntilFinished(uint64_t a1)
{
  [*(id *)(a1 + 64) lockWhenCondition:1];
  uint64_t v2 = *(void **)(a1 + 64);
  return [v2 unlock];
}

BOOL AOSTransactionIsAsync(uint64_t a1)
{
  return *(void *)(a1 + 40) || *(void *)(a1 + 32) != 0;
}

void AOSTransactionUpdate(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    AOSTransactionSetResult(a1, *(CFTypeRef *)(a2 + 16));
    CFTypeRef v4 = *(const void **)(a2 + 24);
  }
  else
  {
    AOSTransactionSetResult(a1, 0);
    CFTypeRef v4 = 0;
  }
  AOSTransactionSetError(a1, v4);
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  int v5 = *(unsigned __int8 *)(a2 + 9);
  *(unsigned char *)(a1 + 9) = v5;
  if (v5)
  {
    [*(id *)(a1 + 64) lock];
    uint64_t v6 = *(void **)(a1 + 64);
    [v6 unlockWithCondition:1];
  }
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void NSLog(NSString *format, ...)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}