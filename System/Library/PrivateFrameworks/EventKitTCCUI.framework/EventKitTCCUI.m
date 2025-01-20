id logHandle()
{
  void *v0;
  uint64_t vars8;

  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global);
  }
  v0 = (void *)logHandle_handle;

  return v0;
}

uint64_t __logHandle_block_invoke()
{
  logHandle_handle = (uint64_t)os_log_create((const char *)EKTCCUILogSubsystem, "factory");

  return MEMORY[0x270F9A758]();
}

id EventPreviewWrapper.__allocating_init(event:)(uint64_t a1)
{
  v3 = (char *)objc_allocWithZone(v1);
  *(void *)&v3[OBJC_IVAR____TtC13EventKitTCCUI19EventPreviewWrapper_event] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id EventPreviewWrapper.init(event:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC13EventKitTCCUI19EventPreviewWrapper_event] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for EventPreviewWrapper();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for EventPreviewWrapper()
{
  return self;
}

void __swiftcall EventPreviewWrapper.getPreviewController(forPrompt:)(UIViewController_optional *__return_ptr retstr, Swift::Bool forPrompt)
{
  uint64_t v4 = sub_24D29FA88();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26985F218);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v12 = (char *)&v20 - v11;
  v13 = *(void **)(v2 + OBJC_IVAR____TtC13EventKitTCCUI19EventPreviewWrapper_event);
  if (v13)
  {
    v14 = (unsigned int *)MEMORY[0x263F30550];
    if (!forPrompt) {
      v14 = (unsigned int *)MEMORY[0x263F30558];
    }
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *v14, v4);
    id v15 = v13;
    sub_24D29FA78();
    sub_24D29F804((uint64_t)v12, (uint64_t)v10);
    id v16 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26985F220));
    id v17 = objc_msgSend((id)sub_24D29FA98(), sel_view);
    if (v17)
    {
      v18 = v17;
      id v19 = objc_msgSend(self, sel_clearColor);
      objc_msgSend(v18, sel_setBackgroundColor_, v19);

      sub_24D29F86C((uint64_t)v12);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_24D29F804(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985F218);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24D29F86C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26985F218);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id EventPreviewWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void EventPreviewWrapper.init()()
{
}

id EventPreviewWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EventPreviewWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24D29FA78()
{
  return MEMORY[0x270F14EB8]();
}

uint64_t sub_24D29FA88()
{
  return MEMORY[0x270F14EC0]();
}

uint64_t sub_24D29FA98()
{
  return MEMORY[0x270F016A0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}