void sub_240699CEC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t vars8;

  v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    [v2 _updateState:0];
    [*(id *)(*(void *)(a1 + 40) + 1048) setDelegate:0];
    v4 = *(void *)(a1 + 40);
    v5 = *(void **)(v4 + 1048);
    *(void *)(v4 + 1048) = 0;
  }
  else
  {
    [v2 _updateState:2];
  }
}

void sub_240699DE4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateState:0];
  [*(id *)(*(void *)(a1 + 32) + 1048) setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 1048);
  *(void *)(v2 + 1048) = 0;
}

uint64_t sub_240699F74(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[128])
  {
    [v2 _updateState:0];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t v3 = v2[130];
  if (v3)
  {
    [*(id *)(a1 + 40) setObject:v3 forKey:&unk_26F4CFA10];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t v4 = [v2 _getFGSceneIdentifiers];
  if (v4) {
    [*(id *)(a1 + 40) setObject:v4 forKey:&unk_26F4CFA28];
  }

  return MEMORY[0x270F9A758]();
}

void sub_24069A01C(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_24069A0B0;
  v4[3] = &unk_2650CE678;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void sub_24069A0B0(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 1032);
  *(void *)(v2 + 1032) = 0;
}

void sub_24069A468(uint64_t a1)
{
  id v5 = [MEMORY[0x263F5D3C0] getCurrentConfig];
  uint64_t v2 = [MEMORY[0x263F5D3C8] initWithConfig:v5];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 1048);
  *(void *)(v3 + 1048) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 1048) startPerformanceTrace];
}

void sub_24069A60C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1024) = *(int *)(a1 + 40);
  switch(*(_DWORD *)(a1 + 40))
  {
    case 0:
      [*(id *)(a1 + 32) setSelected:0];
      uint64_t v2 = [*(id *)(a1 + 32) buttonView];
      id v13 = v2;
      uint64_t v3 = 1;
      goto LABEL_4;
    case 1:
      [*(id *)(a1 + 32) setSelected:0];
      uint64_t v2 = [*(id *)(a1 + 32) buttonView];
      id v13 = v2;
      uint64_t v3 = 0;
LABEL_4:
      [v2 setEnabled:v3];
      goto LABEL_8;
    case 2:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v13 = [v4 localizedStringForKey:@"CONTROL_CENTER_STATUS_PERFORMANCE_TRACE_STARTED" value:&stru_26F4CF138 table:0];

      [*(id *)(a1 + 32) setSelected:1];
      id v5 = [*(id *)(a1 + 32) contentModuleContext];
      uint64_t v6 = [MEMORY[0x263F33CD8] statusUpdateWithMessage:v13 type:0];
      [v5 enqueueStatusUpdate:v6];

      v7 = [*(id *)(a1 + 32) buttonView];
      v8 = v7;
      uint64_t v9 = 1;
      goto LABEL_7;
    case 3:
      v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v13 = [v10 localizedStringForKey:@"CONTROL_CENTER_STATUS_PERFORMANCE_TRACE_PROCESSING" value:&stru_26F4CF138 table:0];

      [*(id *)(a1 + 32) setSelected:0];
      v11 = [*(id *)(a1 + 32) contentModuleContext];
      v12 = [MEMORY[0x263F33CD8] statusUpdateWithMessage:v13 type:0];
      [v11 enqueueStatusUpdate:v12];

      v7 = [*(id *)(a1 + 32) buttonView];
      v8 = v7;
      uint64_t v9 = 0;
LABEL_7:
      [v7 setEnabled:v9];

LABEL_8:

      break;
    default:
      return;
  }
}

void *sub_24069A904()
{
  result = dlopen("/AppleInternal/Library/Frameworks/TraceCart.framework/TraceCart", 2);
  if (result)
  {
    result = NSClassFromString(&cfstr_Tcartracesessi.isa);
    qword_268C8DE78 = (uint64_t)result;
  }
  return result;
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F10748]();
}

uint64_t CCSIsInternalInstall()
{
  return MEMORY[0x270F18818]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}