__CFString *sub_2405F2B10(CFStringRef originalString)
{
  __CFString *v1;
  uint64_t vars8;

  v1 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x263EFFB08], originalString, 0, @":/?#[]@!$&‚Äö√Ñ√¥()*+,;='",
                       0x8000100u);
  return v1;
}

void sub_2405F2CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2405F2D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v3 = *(NSObject **)(a1 + 40);
    dispatch_semaphore_signal(v3);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_2405F2DD0;
    v8[3] = &unk_2650C6728;
    long long v7 = *(_OWORD *)(a1 + 40);
    id v6 = (id)v7;
    long long v9 = v7;
    [v5 accountsWithAccountType:a2 handler:v8];
  }
}

intptr_t sub_2405F2DD0(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 count] != 0;
  v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

void sub_2405F3070(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v7 = 0;
  id v8 = 0;
  id v3 = (id)[MEMORY[0x263F08BA8] sendSynchronousRequest:v2 returningResponse:&v8 error:&v7];
  id v4 = v8;
  id v5 = v7;
  if (v5)
  {
    _SLLog();
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) username];
    _SLLog();
  }
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE53D0](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _SLLog()
{
  return MEMORY[0x270EFE0E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}