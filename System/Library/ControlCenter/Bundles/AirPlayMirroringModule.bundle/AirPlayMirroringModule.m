uint64_t sub_240620F14(uint64_t a1)
{
  uint64_t v2;
  uint64_t vars8;

  [*(id *)(a1 + 32) updateItems];
  v2 = *(void *)(a1 + 32);

  return MEMORY[0x270F9A6D0](v2, sel_updateFooter);
}

uint64_t sub_2406210F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateItems];
}

void sub_240621578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_2406215B4(uint64_t a1, void *a2)
{
  v2 = [a2 airPlayProperties];
  v3 = [v2 objectForKeyedSubscript:@"IsDiscoveredOverInfra"];

  if (v3) {
    uint64_t v4 = [v3 BOOLValue];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_240621618(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t sub_24062163C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 48))
  {
    if (!*(unsigned char *)(a1 + 49)) {
      [WeakRetained stopMirroringDismissOnComplete:0];
    }
  }
  else if (!*(unsigned char *)(a1 + 49))
  {
    [WeakRetained selectOutputDevice:*(void *)(a1 + 32)];
  }

  return 0;
}

uint64_t sub_2406216A0(uint64_t a1)
{
  return 0;
}

void sub_2406217E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_24062180C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stopMirroringDismissOnComplete:1];

  return 0;
}

void sub_240621C30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_240621C4C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2 && *(unsigned char *)(a1 + 40))
  {
    id v6 = WeakRetained;
    v5 = [WeakRetained contentModuleContext];
    [v5 dismissModule];

    id WeakRetained = v6;
  }
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}