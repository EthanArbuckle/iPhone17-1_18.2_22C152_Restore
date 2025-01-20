id sub_226F9E4B8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [v2 nextComponent];
  v5 = [v4 runWithInput:v3];

  return v5;
}

void sub_226F9EC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_226F9ECA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v9 = v3;
    if ([v3 state] == 1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      v4 = *(void **)(a1 + 32);
      v5 = [v9 error];
      [v4 failWithError:v5];

LABEL_7:
      id v3 = v9;
      goto LABEL_8;
    }
    v6 = [v9 value];
    [*(id *)(a1 + 40) setObject:v6 atIndexedSubscript:*(int *)(a1 + 64)];

    uint64_t v7 = (int)++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    BOOL v8 = [*(id *)(a1 + 40) count] == v7;
    id v3 = v9;
    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      [*(id *)(a1 + 32) fullfillWithValue:*(void *)(a1 + 40)];
      goto LABEL_7;
    }
  }
LABEL_8:
}

void sub_226F9EE80(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 1)
  {
    v4 = *(void **)(a1 + 32);
    id v8 = [v3 error];

    [v4 failWithError:v8];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = [v3 value];

    uint64_t v7 = (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_226F9EFB0;
    v9[3] = &unk_2647F6E10;
    id v10 = *(id *)(a1 + 32);
    [v7 registerCompletionBlock:v9];
  }
}

void sub_226F9EFB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4 == 1)
  {
    id v6 = [v3 error];

    [v5 failWithError:v6];
  }
  else
  {
    id v6 = [v3 value];

    [v5 fullfillWithValue:v6];
  }
}

id IMCorePipelineHelloWorldClass.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id IMCorePipelineHelloWorldClass.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMCorePipelineHelloWorldClass();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for IMCorePipelineHelloWorldClass()
{
  return self;
}

id IMCorePipelineHelloWorldClass.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IMCorePipelineHelloWorldClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for IMCorePipelineHelloWorldClass(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IMCorePipelineHelloWorldClass);
}

uint64_t dispatch thunk of IMCorePipelineHelloWorldClass.printGreeting()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x50))();
}

ValueMetadata *type metadata accessor for IMCorePipelineHelloWorld()
{
  return &type metadata for IMCorePipelineHelloWorld;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}