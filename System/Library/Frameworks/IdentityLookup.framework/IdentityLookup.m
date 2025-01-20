uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void sub_21DAC9C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DAC9F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ILDefaultLog()
{
  if (ILDefaultLog_onceToken != -1) {
    dispatch_once(&ILDefaultLog_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)ILDefaultLog_log;

  return v0;
}

uint64_t __ILDefaultLog_block_invoke()
{
  ILDefaultLog_log = (uint64_t)os_log_create("com.apple.calls.identitylookup", "Default");

  return MEMORY[0x270F9A758]();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21DACB7D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_21DACEB48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
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

void sub_21DACFF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DAD0084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

IdentityLookup::IdentityType_optional __swiftcall IdentityType.init(rawValue:)(Swift::Int32 rawValue)
{
  if (rawValue >= 3) {
    char v2 = 3;
  }
  else {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (IdentityLookup::IdentityType_optional)rawValue;
}

uint64_t IdentityType.rawValue.getter()
{
  return *v0;
}

BOOL sub_21DAD24C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21DAD24D4()
{
  return sub_21DAE78C0();
}

uint64_t sub_21DAD251C()
{
  return sub_21DAE78B0();
}

uint64_t sub_21DAD2548()
{
  return sub_21DAE78C0();
}

IdentityLookup::IdentityType_optional sub_21DAD258C(Swift::Int32 *a1)
{
  return IdentityType.init(rawValue:)(*a1);
}

void sub_21DAD2594(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ExtensionUpdate.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ExtensionUpdate.isAppStoreVendable.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable);
}

id ExtensionUpdate.__allocating_init(identifier:isAppStoreVendable:)(uint64_t a1, uint64_t a2, char a3)
{
  v7 = objc_allocWithZone(v3);
  v8 = &v7[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier];
  void *v8 = a1;
  v8[1] = a2;
  v7[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable] = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id ExtensionUpdate.init(identifier:isAppStoreVendable:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = &v3[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier];
  *uint64_t v4 = a1;
  v4[1] = a2;
  v3[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ExtensionUpdate();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for ExtensionUpdate()
{
  return self;
}

id ExtensionUpdate.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void ExtensionUpdate.init()()
{
}

id ExtensionUpdate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtensionUpdate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21DAD280C()
{
  uint64_t result = sub_21DAE7580();
  qword_267D1C5F8 = result;
  return result;
}

id static NSNotificationName.LiveLookupStoreExtensionsChangedNotification.getter()
{
  if (qword_267D1C5F0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_267D1C5F8;

  return v0;
}

unint64_t static LiveLookupStore.imageDirectoryPath.getter()
{
  return 0xD000000000000028;
}

uint64_t sub_21DAD28BC()
{
  type metadata accessor for LiveLookupStore();
  uint64_t v0 = swift_allocObject();
  uint64_t result = LiveLookupStore.init(storeLocation:)();
  qword_26AB0EBD8 = v0;
  return result;
}

uint64_t LiveLookupStore.__allocating_init(storeLocation:)()
{
  uint64_t v0 = swift_allocObject();
  LiveLookupStore.init(storeLocation:)();
  return v0;
}

uint64_t static LiveLookupStore.shared.getter()
{
  if (qword_26AB0EBE0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t LiveLookupStore.init(storeLocation:)()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB88);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_21DAE7400();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v8 = &v17[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  objc_super v10 = &v17[-v9];
  *(_DWORD *)(v0 + 16) = 5;
  *(void *)(v0 + 24) = 0;
  sub_21DAD2C60(v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    __break(1u);

    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    (*(void (**)(unsigned char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    id v11 = sub_21DADC08C();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 16))(v8, v10, v4);
    id v12 = v11;
    id v13 = sub_21DADDE6C((uint64_t)v8);
    type metadata accessor for StoreWrapper();
    swift_allocObject();
    v14 = StoreWrapper.init(containerName:model:storeDescription:)(0x6B6F6F4C6576694CLL, 0xEF65726F74537075, v13, v12);
    v15 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);

    *(void *)(v1 + 24) = v14;
    swift_release();
    return v1;
  }
  return result;
}

uint64_t sub_21DAD2C60@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_21DAE7400();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB88);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LiveLookupStore();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v9 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  objc_super v10 = (void *)sub_21DAE7580();
  id v11 = (void *)sub_21DAE7580();
  id v12 = objc_msgSend(v9, sel_URLForResource_withExtension_, v10, v11);

  if (v12)
  {
    sub_21DAE73C0();

    id v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v13(v7, v5, v2);
    v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    v14(v7, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2) != 1)
    {
      v13(a1, v7, v2);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v14)(a1, 0, 1, v2);
    }
  }
  else
  {
    v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
    v14(v7, 1, 1, v2);
  }
  sub_21DADC4F0((uint64_t)v7, &qword_26AB0EB88);
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_21DAE7560();
  __swift_project_value_buffer(v16, (uint64_t)qword_26AB0ECE0);
  v17 = sub_21DAE7540();
  os_log_type_t v18 = sub_21DAE7690();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_21DAC7000, v17, v18, "Failed to find LiveLookupStore model file", v19, 2u);
    MEMORY[0x223C11130](v19, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v14)(a1, 1, 1, v2);
}

void sub_21DAD2FC4(uint64_t a1)
{
  if (*(void *)(v1 + 24))
  {
    MEMORY[0x270FA5388](a1);
    swift_retain();
    uint64_t v2 = (void *)sub_21DADD0CC(0);
    uint64_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_viewContext);

    MEMORY[0x270FA5388](v6);
    sub_21DAE76C0();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

void sub_21DAD3130()
{
  uint64_t v1 = v0;
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21DAE7560();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AB0ECE0);
  uint64_t v3 = sub_21DAE7540();
  os_log_type_t v4 = sub_21DAE7690();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21DAC7000, v3, v4, "saving", v5, 2u);
    MEMORY[0x223C11130](v5, -1, -1);
  }

  if (*(void *)(v1 + 24))
  {
    swift_retain();
    uint64_t v6 = (void *)sub_21DADD0CC(0);
    v8 = v7;
    id v9 = objc_msgSend(v7, sel_viewContext);

    MEMORY[0x270FA5388](v10);
    sub_21DAE76C0();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21DAD3330(void *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_21DADCB30;
  *(void *)(v3 + 24) = v2;
  v7[4] = sub_21DADCB64;
  v7[5] = v3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_21DAD9610;
  v7[3] = &block_descriptor;
  os_log_type_t v4 = _Block_copy(v7);
  id v5 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_performBlockAndWait_, v4);
  _Block_release(v4);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v5) {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DAD3490(uint64_t result)
{
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (*(void *)(v1 + 24))
  {
    uint64_t v7 = MEMORY[0x270FA5388](result);
    MEMORY[0x270FA5388](v7);
    swift_retain();
    uint64_t v2 = (void *)sub_21DADD0CC(0);
    os_log_type_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_viewContext);

    MEMORY[0x270FA5388](v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C610);
    sub_21DAE76C0();
    swift_release();

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DAD3640(uint64_t result)
{
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (*(void *)(v1 + 24))
  {
    uint64_t v7 = MEMORY[0x270FA5388](result);
    MEMORY[0x270FA5388](v7);
    swift_retain();
    uint64_t v2 = (void *)sub_21DADD0CC(0);
    os_log_type_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_viewContext);

    MEMORY[0x270FA5388](v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C610);
    sub_21DAE76C0();
    swift_release();

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DAD37F0(uint64_t result)
{
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (*(void *)(v1 + 24))
  {
    uint64_t v7 = MEMORY[0x270FA5388](result);
    MEMORY[0x270FA5388](v7);
    swift_retain();
    uint64_t v2 = (void *)sub_21DADD0CC(0);
    os_log_type_t v4 = v3;
    id v5 = objc_msgSend(v3, sel_viewContext);

    MEMORY[0x270FA5388](v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C610);
    sub_21DAE76C0();
    swift_release();

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DAD39A0()
{
  uint64_t result = sub_21DAE7620();
  uint64_t v8 = result;
  if (*(void *)(v0 + 24))
  {
    uint64_t v2 = MEMORY[0x270FA5388](result);
    MEMORY[0x270FA5388](v2);
    swift_retain();
    uint64_t v3 = (void *)sub_21DADD0CC(0);
    id v5 = v4;
    id v6 = objc_msgSend(v4, sel_viewContext);

    MEMORY[0x270FA5388](v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C610);
    sub_21DAE76C0();
    swift_release();

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DAD3B5C(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void))
{
  a4(0);
  *a2 = sub_21DAE76D0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21DAD3DAC(uint64_t a1, uint64_t *a2)
{
  *a2 = sub_21DAE76D0();

  return swift_bridgeObjectRelease();
}

uint64_t LiveLookupStore.deinit()
{
  swift_release();
  return v0;
}

uint64_t LiveLookupStore.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_21DAD4040@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LiveLookupStore();
  uint64_t v2 = swift_allocObject();
  uint64_t result = LiveLookupStore.init(storeLocation:)();
  *a1 = v2;
  return result;
}

void sub_21DAD4098(uint64_t a1)
{
}

void sub_21DAD40BC()
{
}

uint64_t sub_21DAD40E0()
{
  return sub_21DAD39A0();
}

uint64_t sub_21DAD4104()
{
  return LiveLookupStore.activeExtensions()();
}

uint64_t LiveLookupStore.activeExtensions()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v1 = (void *)sub_21DAE7580();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  sub_21DADCB8C(0, &qword_26AB0EC70);
  uint64_t v3 = (void *)sub_21DAE7670();
  objc_msgSend(v2, sel_setPredicate_, v3);

  id v4 = v2;
  uint64_t v5 = LiveLookupStore.fetchExtensions(_:)(v2);

  return v5;
}

uint64_t sub_21DAD4228()
{
  return LiveLookupStore.installedExtensions()();
}

uint64_t LiveLookupStore.installedExtensions()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v1 = (void *)sub_21DAE7580();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  sub_21DADCB8C(0, &qword_26AB0EC70);
  uint64_t v3 = (void *)sub_21DAE7670();
  objc_msgSend(v2, sel_setPredicate_, v3);

  id v4 = v2;
  uint64_t v5 = LiveLookupStore.fetchExtensions(_:)(v2);

  return v5;
}

BOOL sub_21DAD4344(uint64_t a1, uint64_t a2)
{
  return LiveLookupStore.isAppStoreVendable(forExtensionWith:)(*(Swift::String *)&a1);
}

Swift::Bool __swiftcall LiveLookupStore.isAppStoreVendable(forExtensionWith:)(Swift::String forExtensionWith)
{
  object = forExtensionWith._object;
  uint64_t countAndFlagsBits = forExtensionWith._countAndFlagsBits;
  id v3 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v4 = (void *)sub_21DAE7580();
  id v5 = objc_msgSend(v3, sel_initWithEntityName_, v4);

  sub_21DADCB8C(0, &qword_26AB0EC70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB58);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_21DAE8FB0;
  *(void *)(v6 + 56) = MEMORY[0x263F8D310];
  *(void *)(v6 + 64) = sub_21DADC318();
  *(void *)(v6 + 32) = countAndFlagsBits;
  *(void *)(v6 + 40) = object;
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_21DAE7670();
  objc_msgSend(v5, sel_setPredicate_, v7);

  unint64_t v8 = sub_21DAD3490((uint64_t)v5);
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_21DAE7560();
  __swift_project_value_buffer(v9, (uint64_t)qword_26AB0ECE0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_21DAE7540();
  os_log_type_t v11 = sub_21DAE7690();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v24 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    swift_bridgeObjectRetain();
    sub_21DADB6AC(countAndFlagsBits, (unint64_t)object, &v24);
    sub_21DAE7700();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v14 = type metadata accessor for LiveLookupDBExtension();
    uint64_t v15 = swift_bridgeObjectRetain();
    uint64_t v16 = MEMORY[0x223C10650](v15, v14);
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    sub_21DADB6AC(v16, v18, &v24);
    sub_21DAE7700();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DAC7000, v10, v11, "identifier %s extensions %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v13, -1, -1);
    MEMORY[0x223C11130](v12, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    Swift::Bool result = swift_bridgeObjectRelease_n();
  }
  if (!(v8 >> 62))
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_8;
    }
LABEL_13:

    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_21DAE77F0();
  Swift::Bool result = swift_bridgeObjectRelease();
  if (!v23) {
    goto LABEL_13;
  }
LABEL_8:
  if ((v8 & 0xC000000000000001) != 0)
  {
    id v20 = (id)MEMORY[0x223C107B0](0, v8);
    goto LABEL_11;
  }
  if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v20 = *(id *)(v8 + 32);
LABEL_11:
    v21 = v20;
    swift_bridgeObjectRelease();
    unsigned __int8 v22 = objc_msgSend(v21, sel_isAppStoreVendable);

    return v22;
  }
  __break(1u);
  return result;
}

uint64_t sub_21DAD475C(void *a1)
{
  return LiveLookupStore.fetchExtensions(_:)(a1);
}

uint64_t LiveLookupStore.fetchExtensions(_:)(void *a1)
{
  v33[1] = *MEMORY[0x263EF8340];
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_21DAE7560();
  __swift_project_value_buffer(v2, (uint64_t)qword_26AB0ECE0);
  id v3 = a1;
  id v4 = sub_21DAE7540();
  os_log_type_t v5 = sub_21DAE7690();
  if (!os_log_type_enabled(v4, v5))
  {

    id v9 = v3;
    if (a1) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v6 = (uint8_t *)swift_slowAlloc();
  uint64_t v7 = (void *)swift_slowAlloc();
  *(_DWORD *)uint64_t v6 = 138412290;
  if (a1)
  {
    v33[0] = (uint64_t)v3;
    id v8 = v3;
  }
  else
  {
    v33[0] = 0;
  }
  sub_21DAE7700();
  void *v7 = a1;

  _os_log_impl(&dword_21DAC7000, v4, v5, "fetching extensions: fetchRequest=%@", v6, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
  swift_arrayDestroy();
  MEMORY[0x223C11130](v7, -1, -1);
  MEMORY[0x223C11130](v6, -1, -1);

  id v9 = v3;
  if (!a1)
  {
LABEL_10:
    id v10 = objc_allocWithZone(MEMORY[0x263EFF260]);
    os_log_type_t v11 = (void *)sub_21DAE7580();
    id v9 = objc_msgSend(v10, sel_initWithEntityName_, v11);
  }
LABEL_11:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBF0);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_21DAE8FC0;
  id v13 = objc_allocWithZone(MEMORY[0x263F08B30]);
  id v14 = v3;
  uint64_t v15 = (void *)sub_21DAE7580();
  id v16 = objc_msgSend(v13, sel_initWithKey_ascending_, v15, 1);

  *(void *)(v12 + 32) = v16;
  v33[0] = v12;
  sub_21DAE7600();
  sub_21DADCB8C(0, &qword_26AB0EB98);
  unint64_t v17 = (void *)sub_21DAE75D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setSortDescriptors_, v17);

  uint64_t v18 = sub_21DAD3490((uint64_t)v9);
  id v19 = v9;
  swift_bridgeObjectRetain_n();
  id v20 = v19;
  v21 = sub_21DAE7540();
  os_log_type_t v22 = sub_21DAE7690();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = (void *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    v33[0] = v32;
    *(_DWORD *)uint64_t v23 = 138412546;
    id v25 = v20;
    sub_21DAE7700();
    *uint64_t v24 = v20;

    *(_WORD *)(v23 + 12) = 2080;
    uint64_t v26 = type metadata accessor for LiveLookupDBExtension();
    uint64_t v27 = swift_bridgeObjectRetain();
    uint64_t v28 = MEMORY[0x223C10650](v27, v26);
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    sub_21DADB6AC(v28, v30, v33);
    sub_21DAE7700();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DAC7000, v21, v22, "fetchExtensions: request: %@ extensions: %s", (uint8_t *)v23, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v24, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v32, -1, -1);
    MEMORY[0x223C11130](v23, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v18;
}

void sub_21DAD4C90(uint64_t a1, uint64_t a2)
{
}

Swift::Void __swiftcall LiveLookupStore.resetExtension(with:)(Swift::String with)
{
  uint64_t v2 = v1;
  object = with._object;
  uint64_t countAndFlagsBits = with._countAndFlagsBits;
  sub_21DADCB8C(0, &qword_26AB0EC70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB58);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21DAE8FB0;
  *(void *)(v5 + 56) = MEMORY[0x263F8D310];
  *(void *)(v5 + 64) = sub_21DADC318();
  *(void *)(v5 + 32) = countAndFlagsBits;
  *(void *)(v5 + 40) = object;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_21DAE7670();
  id v7 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v8 = (void *)sub_21DAE7580();
  id v9 = objc_msgSend(v7, sel_initWithEntityName_, v8);

  uint64_t v27 = (void *)v6;
  objc_msgSend(v9, sel_setPredicate_, v6);
  id v26 = v9;
  uint64_t v31 = v2;
  unint64_t v10 = sub_21DAD3640((uint64_t)v9);
  unint64_t v11 = v10;
  if (!(v10 >> 62))
  {
    uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12) {
      goto LABEL_3;
    }
LABEL_14:

    swift_bridgeObjectRelease();
    uint64_t v24 = v27;
    sub_21DAD9638((uint64_t)v27);

    return;
  }
LABEL_13:
  uint64_t v12 = sub_21DAE77F0();
  if (!v12) {
    goto LABEL_14;
  }
LABEL_3:
  unint64_t v30 = v11 & 0xC000000000000001;
  uint64_t v13 = 4;
  uint64_t v28 = MEMORY[0x263F8EE60] + 8;
  while (1)
  {
    uint64_t v14 = v13 - 4;
    if (v30)
    {
      id v15 = (id)MEMORY[0x223C107B0](v13 - 4, v11);
      uint64_t v16 = v13 - 3;
      if (__OFADD__(v14, 1)) {
        goto LABEL_12;
      }
    }
    else
    {
      id v15 = *(id *)(v11 + 8 * v13);
      uint64_t v16 = v13 - 3;
      if (__OFADD__(v14, 1))
      {
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    uint64_t v33 = v16;
    if (!*(void *)(v31 + 24)) {
      break;
    }
    uint64_t v32 = &v25;
    uint64_t v17 = MEMORY[0x270FA5388](v15);
    *(&v25 - 2) = v17;
    uint64_t v18 = (void *)v17;
    swift_retain();
    id v19 = (void *)sub_21DADD0CC(0);
    v21 = v20;
    id v29 = v18;
    id v22 = objc_msgSend(v20, sel_viewContext);

    MEMORY[0x270FA5388](v23);
    *(&v25 - 4) = (uint64_t)sub_21DADCC24;
    *(&v25 - 3) = (uint64_t)(&v25 - 4);
    *(&v25 - 2) = (uint64_t)v22;
    sub_21DAE76C0();

    swift_release();
    ++v13;
    if (v33 == v12) {
      goto LABEL_14;
    }
  }
  __break(1u);
}

void *sub_21DAD5010(Swift::OpaquePointer a1)
{
  return LiveLookupStore.updateExtensions(with:)(a1)._0._rawValue;
}

Swift::tuple_OpaquePointer_OpaquePointer __swiftcall LiveLookupStore.updateExtensions(with:)(Swift::OpaquePointer with)
{
  uint64_t v2 = v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = LiveLookupStore.fetchExtensions(_:)(0);
  uint64_t v5 = (unint64_t *)(v4 + 16);
  v69 = (void *)MEMORY[0x263F8EE78];
  v70 = (void *)MEMORY[0x263F8EE78];
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_21DAE7560();
  __swift_project_value_buffer(v6, (uint64_t)qword_26AB0ECE0);
  swift_bridgeObjectRetain_n();
  id v7 = sub_21DAE7540();
  os_log_type_t v8 = sub_21DAE7690();
  if (!os_log_type_enabled(v7, v8))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_38;
  }
  os_log_type_t v61 = v8;
  id v9 = (_DWORD *)swift_slowAlloc();
  uint64_t v60 = swift_slowAlloc();
  v67[0] = v60;
  v64 = v9;
  *id v9 = 136315394;
  v62 = v7;
  if ((unint64_t)with._rawValue >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_21DAE77F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)(((unint64_t)with._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v11 = MEMORY[0x263F8EE78];
  rawValue = with._rawValue;
  uint64_t v63 = v2;
  if (v10)
  {
    uint64_t v66 = MEMORY[0x263F8EE78];
    uint64_t v12 = (void *)sub_21DADBD04(0, v10 & ~(v10 >> 63), 0);
    if (v10 < 0)
    {
      __break(1u);
      goto LABEL_47;
    }
    uint64_t v11 = v66;
    if (((unint64_t)with._rawValue & 0xC000000000000001) != 0)
    {
      uint64_t v14 = 0;
      do
      {
        uint64_t v15 = MEMORY[0x223C107B0](v14, rawValue);
        uint64_t v17 = *(void *)(v15 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier);
        uint64_t v16 = *(void *)(v15 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier + 8);
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        unint64_t v19 = *(void *)(v66 + 16);
        unint64_t v18 = *(void *)(v66 + 24);
        if (v19 >= v18 >> 1) {
          sub_21DADBD04(v18 > 1, v19 + 1, 1);
        }
        ++v14;
        *(void *)(v66 + 16) = v19 + 1;
        uint64_t v20 = v66 + 16 * v19;
        *(void *)(v20 + 32) = v17;
        *(void *)(v20 + 40) = v16;
      }
      while (v10 != v14);
    }
    else
    {
      v21 = (char *)with._rawValue + 32;
      do
      {
        id v22 = (uint64_t *)(*v21 + OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier);
        uint64_t v24 = *v22;
        uint64_t v23 = v22[1];
        unint64_t v25 = *(void *)(v66 + 16);
        unint64_t v26 = *(void *)(v66 + 24);
        swift_bridgeObjectRetain();
        if (v25 >= v26 >> 1) {
          sub_21DADBD04(v26 > 1, v25 + 1, 1);
        }
        *(void *)(v66 + 16) = v25 + 1;
        uint64_t v27 = v66 + 16 * v25;
        *(void *)(v27 + 32) = v24;
        *(void *)(v27 + 40) = v23;
        ++v21;
        --v10;
      }
      while (v10);
    }
  }
  uint64_t v28 = MEMORY[0x223C10650](v11, MEMORY[0x263F8D310]);
  unint64_t v30 = v29;
  swift_bridgeObjectRelease();
  sub_21DADB6AC(v28, v30, v67);
  sub_21DAE7700();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *((_WORD *)v64 + 6) = 2080;
  swift_beginAccess();
  unint64_t v31 = *v5;
  if (*v5 >> 62)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v12 = (void *)sub_21DAE77F0();
    uint64_t v32 = (uint64_t)v12;
    uint64_t v59 = v4;
    if (v12)
    {
LABEL_21:
      if (v32 >= 1)
      {
        uint64_t v33 = 0;
        v34 = (void *)MEMORY[0x263F8EE78];
        do
        {
          if ((v31 & 0xC000000000000001) != 0) {
            id v35 = (id)MEMORY[0x223C107B0](v33, v31);
          }
          else {
            id v35 = *(id *)(v31 + 8 * v33 + 32);
          }
          v36 = v35;
          id v37 = objc_msgSend(v35, sel_identifier, v59);
          if (v37)
          {
            v38 = v37;
            uint64_t v39 = sub_21DAE7590();
            uint64_t v41 = v40;

            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              v34 = sub_21DADB59C(0, v34[2] + 1, 1, v34);
            }
            unint64_t v43 = v34[2];
            unint64_t v42 = v34[3];
            if (v43 >= v42 >> 1) {
              v34 = sub_21DADB59C((void *)(v42 > 1), v43 + 1, 1, v34);
            }
            v34[2] = v43 + 1;
            v44 = &v34[2 * v43];
            v44[4] = v39;
            v44[5] = v41;
          }
          else
          {
          }
          ++v33;
        }
        while (v32 != v33);
        goto LABEL_37;
      }
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v32 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v12 = (void *)swift_bridgeObjectRetain_n();
    uint64_t v59 = v4;
    if (v32) {
      goto LABEL_21;
    }
  }
  v34 = (void *)MEMORY[0x263F8EE78];
LABEL_37:
  swift_bridgeObjectRelease_n();
  uint64_t v45 = MEMORY[0x223C10650](v34, MEMORY[0x263F8D310]);
  unint64_t v47 = v46;
  swift_bridgeObjectRelease();
  uint64_t v68 = sub_21DADB6AC(v45, v47, v67);
  sub_21DAE7700();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_21DAC7000, v62, v61, "updatingExtensions: on device: %s in db: %s", (uint8_t *)v64, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x223C11130](v60, -1, -1);
  MEMORY[0x223C11130](v64, -1, -1);

  uint64_t v2 = v63;
LABEL_38:
  uint64_t v12 = (void *)swift_beginAccess();
  unint64_t v48 = *v5;
  if (!(*v5 >> 62))
  {
    uint64_t v49 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v50 = v49 + 1;
    if (!__OFADD__(v49, 1)) {
      goto LABEL_40;
    }
LABEL_45:
    __break(1u);
    swift_once();
    objc_msgSend((id)v48, sel_postNotificationName_object_, qword_267D1C5F8, 0, v59);
    swift_release();

    goto LABEL_42;
  }
  swift_bridgeObjectRetain();
  uint64_t v57 = sub_21DAE77F0();
  uint64_t v12 = (void *)swift_bridgeObjectRelease();
  uint64_t v50 = v57 + 1;
  if (__OFADD__(v57, 1)) {
    goto LABEL_45;
  }
LABEL_40:
  uint64_t v68 = v50;
  if (!*(void *)(v2 + 24))
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v51 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v51);
  swift_retain();
  v52 = (void *)sub_21DADD0CC(0);
  v54 = v53;
  id v55 = objc_msgSend(v53, sel_viewContext);

  MEMORY[0x270FA5388](v56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C610);
  sub_21DAE76C0();
  swift_release();

  swift_release();
LABEL_42:
  uint64_t v13 = v69;
  uint64_t v12 = v70;
LABEL_49:
  result._1._rawValue = v13;
  result._0._rawValue = v12;
  return result;
}

uint64_t sub_21DAD5818(uint64_t a1, unint64_t a2)
{
  return LiveLookupStore.fetchBlockingInfo(for:)(a1, a2);
}

uint64_t LiveLookupStore.fetchBlockingInfo(for:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21DAE7480();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_21DAE7560();
  __swift_project_value_buffer(v10, (uint64_t)qword_26AB0ECE0);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = sub_21DAE7540();
  os_log_type_t v12 = sub_21DAE7690();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v24 = v3;
    uint64_t v25 = a1;
    uint64_t v15 = v14;
    uint64_t v27 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_21DADB6AC(v25, a2, &v27);
    sub_21DAE7700();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21DAC7000, v11, v12, "fetchBlockingInfo for %s", v13, 0xCu);
    swift_arrayDestroy();
    a1 = v25;
    MEMORY[0x223C11130](v15, -1, -1);
    MEMORY[0x223C11130](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v16 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v17 = (void *)sub_21DAE7580();
  id v18 = objc_msgSend(v16, sel_initWithEntityName_, v17);

  sub_21DADCB8C(0, &qword_26AB0EC70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB58);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_21DAE8FD0;
  sub_21DAE7470();
  uint64_t v20 = sub_21DAE7450();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(void *)(v19 + 56) = sub_21DADCB8C(0, &qword_26AB0EB48);
  *(void *)(v19 + 64) = sub_21DADC3B4();
  *(void *)(v19 + 32) = v20;
  *(void *)(v19 + 96) = MEMORY[0x263F8D310];
  *(void *)(v19 + 104) = sub_21DADC318();
  *(void *)(v19 + 72) = a1;
  *(void *)(v19 + 80) = a2;
  swift_bridgeObjectRetain();
  v21 = (void *)sub_21DAE7670();
  objc_msgSend(v18, sel_setPredicate_, v21);

  uint64_t v22 = sub_21DAD3640((uint64_t)v18);
  return v22;
}

void sub_21DAD5BE0(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
}

void LiveLookupStore.fetchBlockingInfo(for:with:expiration:)(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
}

void sub_21DAD5C70(uint64_t a1, unint64_t a2, void *a3, int a4)
{
}

void LiveLookupStore.updateBlockingInfo(for:with:shouldBlock:)(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t v67 = a1;
  v70[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v66 = sub_21DAE7480();
  uint64_t v7 = *(void *)(v66 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v66);
  v62 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v63 = (char *)&v55 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C620);
  MEMORY[0x270FA5388](v11 - 8);
  v65 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21DAE7560();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v13, (uint64_t)qword_26AB0ECE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  swift_bridgeObjectRetain_n();
  id v18 = a3;
  uint64_t v19 = sub_21DAE7540();
  int v20 = sub_21DAE7690();
  if (os_log_type_enabled(v19, (os_log_type_t)v20))
  {
    int v57 = v20;
    int v61 = a4;
    uint64_t v64 = v17;
    uint64_t v59 = v7;
    v21 = v18;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v56 = (void *)swift_slowAlloc();
    v70[0] = v56;
    *(_DWORD *)uint64_t v22 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v69 = sub_21DADB6AC(v67, a2, (uint64_t *)v70);
    sub_21DAE7700();
    unint64_t v58 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2080;
    id v60 = v21;
    id v23 = objc_msgSend(v21, sel_identifier);
    if (!v23)
    {

      __break(1u);
      goto LABEL_20;
    }
    uint64_t v24 = v23;
    uint64_t v25 = sub_21DAE7590();
    unint64_t v27 = v26;

    uint64_t v69 = sub_21DADB6AC(v25, v27, (uint64_t *)v70);
    sub_21DAE7700();
    id v28 = v60;

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DAC7000, v19, (os_log_type_t)v57, "updateBlockingInfo for %s with %s", (uint8_t *)v22, 0x16u);
    unint64_t v29 = v56;
    swift_arrayDestroy();
    MEMORY[0x223C11130](v29, -1, -1);
    MEMORY[0x223C11130](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    a2 = v58;
    uint64_t v7 = v59;
    uint64_t v17 = v64;
    a4 = v61;
    id v18 = v28;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  uint64_t v30 = (uint64_t)v65;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v65, 1, 1, v66);
  LiveLookupStore.fetchBlockingInfo(for:with:expiration:)(v67, a2, v18, v30);
  uint64_t v32 = v31;
  sub_21DADC4F0(v30, &qword_267D1C620);
  if (v32)
  {
    id v33 = v18;
    id v34 = v32;
    id v35 = v32;
    goto LABEL_9;
  }
  int v61 = a4;
  uint64_t v64 = v17;
  if (!*(void *)(v68 + 24))
  {
LABEL_20:
    __break(1u);
    return;
  }
  swift_retain();
  unint64_t v43 = (void *)sub_21DADD0CC(0);
  uint64_t v45 = v44;
  id v46 = objc_msgSend(v44, sel_viewContext);

  MEMORY[0x270FA5388](v47);
  *(&v55 - 4) = (uint64_t)sub_21DADADA8;
  *(&v55 - 3) = 0;
  *(&v55 - 2) = (uint64_t)v46;
  type metadata accessor for BlockingInfo();
  sub_21DAE76C0();
  id v33 = v18;
  swift_release();

  id v35 = v70[0];
  id v34 = v70[0];
  uint64_t v32 = 0;
  LOBYTE(a4) = v61;
LABEL_9:
  id v36 = v32;
  id v37 = (void *)sub_21DAE7580();
  objc_msgSend(v34, sel_setHandle_, v37);

  objc_msgSend(v34, sel_setShouldBlock_, a4 & 1);
  v38 = v62;
  sub_21DAE7470();
  uint64_t v39 = v63;
  sub_21DAE7440();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v41 = v66;
  v40(v38, v66);
  unint64_t v42 = (void *)sub_21DAE7450();
  v40(v39, v41);
  objc_msgSend(v34, sel_setExpiration_, v42);

  objc_msgSend(v34, sel_setDbExtension_, v33);
  unint64_t v48 = v35;
  uint64_t v49 = sub_21DAE7540();
  os_log_type_t v50 = sub_21DAE7690();
  if (os_log_type_enabled(v49, v50))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    v53 = (void *)swift_slowAlloc();
    *(_DWORD *)v52 = 138412290;
    if (v35)
    {
      v70[0] = v48;
      v54 = v48;
    }
    else
    {
      v70[0] = 0;
    }
    sub_21DAE7700();
    void *v53 = v35;

    _os_log_impl(&dword_21DAC7000, v49, v50, "saving blockingInfo %@", v52, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v53, -1, -1);
    MEMORY[0x223C11130](v52, -1, -1);
  }
  else
  {

    uint64_t v49 = v48;
  }

  sub_21DAD3130();
}

uint64_t sub_21DAD6484(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  return LiveLookupStore.fetchIdentityInfo(for:from:canBeEmpty:)(a1, a2, a3, a4);
}

uint64_t LiveLookupStore.fetchIdentityInfo(for:from:canBeEmpty:)(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t v5 = v4;
  LODWORD(v6) = a4;
  v70[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = sub_21DAE7480();
  uint64_t v67 = *(void (***)(char *, id))(v10 - 8);
  id v68 = (id)v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v66 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_21DAE7560();
  uint64_t v13 = (void *)__swift_project_value_buffer(v12, (uint64_t)qword_26AB0ECE0);
  swift_bridgeObjectRetain_n();
  id v14 = a3;
  uint64_t v15 = sub_21DAE7540();
  os_log_type_t v16 = sub_21DAE7690();
  if (os_log_type_enabled(v15, v16))
  {
    id v62 = v13;
    int v63 = v6;
    uint64_t v65 = v5;
    unint64_t v6 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v70[0] = v18;
    *(_DWORD *)unint64_t v6 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v64 = a1;
    uint64_t v69 = sub_21DADB6AC(a1, a2, v70);
    sub_21DAE7700();
    unint64_t v19 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v6 + 12) = 2112;
    id v20 = objc_msgSend(v14, sel_identityInfo);
    id v21 = v20;
    if (v20) {
      uint64_t v69 = (uint64_t)v20;
    }
    else {
      uint64_t v69 = 0;
    }
    sub_21DAE7700();
    void *v17 = v21;

    _os_log_impl(&dword_21DAC7000, v15, v16, "fetchIdentityInfo for %s from %@", (uint8_t *)v6, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v18, -1, -1);
    MEMORY[0x223C11130](v6, -1, -1);

    a1 = v64;
    uint64_t v5 = v65;
    a2 = v19;
    LODWORD(v6) = v63;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!objc_msgSend(v14, sel_isEnabled) || !objc_msgSend(v14, sel_isInstalled))
  {
    id v50 = v14;
    uint64_t v51 = sub_21DAE7540();
    os_log_type_t v52 = sub_21DAE7690();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = (void *)swift_slowAlloc();
      *(_DWORD *)v53 = 138412290;
      id v55 = objc_msgSend(v50, sel_identityInfo);
      id v56 = v55;
      if (v55) {
        v70[0] = (uint64_t)v55;
      }
      else {
        v70[0] = 0;
      }
      sub_21DAE7700();
      void *v54 = v56;

      _os_log_impl(&dword_21DAC7000, v51, v52, "%@ not enabled and installed", v53, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
      swift_arrayDestroy();
      MEMORY[0x223C11130](v54, -1, -1);
      MEMORY[0x223C11130](v53, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  id v22 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v23 = (void *)sub_21DAE7580();
  id v62 = objc_msgSend(v22, sel_initWithEntityName_, v23);

  sub_21DADCB8C(0, &qword_26AB0EC70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB58);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_21DAE8FE0;
  *(void *)(v24 + 56) = MEMORY[0x263F8D310];
  *(void *)(v24 + 64) = sub_21DADC318();
  *(void *)(v24 + 32) = a1;
  *(void *)(v24 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v25 = v66;
  sub_21DAE7470();
  uint64_t v26 = sub_21DAE7450();
  v67[1](v25, v68);
  *(void *)(v24 + 96) = sub_21DADCB8C(0, &qword_26AB0EB48);
  *(void *)(v24 + 104) = sub_21DADC3B4();
  *(void *)(v24 + 72) = v26;
  *(void *)(v24 + 136) = type metadata accessor for LiveLookupDBExtension();
  *(void *)(v24 + 144) = sub_21DADC41C();
  *(void *)(v24 + 112) = v14;
  unint64_t v27 = (void (**)(char *, id))v14;
  id v28 = (id)sub_21DAE7670();
  uint64_t v67 = v27;
  if ((v6 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBF0);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_21DAE8FF0;
    *(void *)(v29 + 32) = v28;
    id v30 = v28;
    *(void *)(v29 + 40) = sub_21DAE7670();
    v70[0] = v29;
    sub_21DAE7600();
    unint64_t v31 = (void *)sub_21DAE75D0();
    swift_bridgeObjectRelease();
    id v28 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v31);
  }
  id v32 = v62;
  id v68 = v28;
  objc_msgSend(v62, sel_setPredicate_, v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBF0);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_21DAE8FC0;
  id v34 = objc_allocWithZone(MEMORY[0x263F08B30]);
  id v35 = (void *)sub_21DAE7580();
  id v36 = objc_msgSend(v34, sel_initWithKey_ascending_, v35, 1);

  *(void *)(v33 + 32) = v36;
  v70[0] = v33;
  sub_21DAE7600();
  sub_21DADCB8C(0, &qword_26AB0EB98);
  id v37 = (void *)sub_21DAE75D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v32, sel_setSortDescriptors_, v37);

  unint64_t v38 = sub_21DAD37F0((uint64_t)v32);
  swift_bridgeObjectRetain_n();
  uint64_t v39 = sub_21DAE7540();
  os_log_type_t v40 = sub_21DAE7690();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v64 = a1;
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = swift_slowAlloc();
    uint64_t v65 = v5;
    uint64_t v43 = v42;
    v70[0] = v42;
    *(_DWORD *)uint64_t v41 = 136315138;
    unint64_t v44 = a2;
    uint64_t v45 = type metadata accessor for IdentityInfo();
    uint64_t v46 = swift_bridgeObjectRetain();
    uint64_t v47 = MEMORY[0x223C10650](v46, v45);
    int v63 = v6;
    unint64_t v6 = v48;
    swift_bridgeObjectRelease();
    uint64_t v49 = v47;
    a2 = v44;
    uint64_t v69 = sub_21DADB6AC(v49, v6, v70);
    a1 = v64;
    sub_21DAE7700();
    swift_bridgeObjectRelease_n();
    LOBYTE(v6) = v63;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DAC7000, v39, v40, "identityInfo %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v43, -1, -1);
    MEMORY[0x223C11130](v41, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v59 = v68;
  if (v38 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_21DAE77F0();
    swift_bridgeObjectRelease();
    if (v61) {
      goto LABEL_26;
    }
    goto LABEL_31;
  }
  if (!*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_31:
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      uint64_t v57 = LiveLookupStore.fetchIdentityInfo(for:from:canBeEmpty:)(a1, a2, v67, 1);

      return v57;
    }

    return 0;
  }
LABEL_26:
  if ((v38 & 0xC000000000000001) != 0)
  {
    id v60 = (id)MEMORY[0x223C107B0](0, v38);
  }
  else
  {
    if (!*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v60 = *(id *)(v38 + 32);
  }
  uint64_t v57 = (uint64_t)v60;
  swift_bridgeObjectRelease();

  return v57;
}

void sub_21DAD6E78(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
}

void LiveLookupStore.fetchIdentityInfo(for:with:expiration:)(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
}

void sub_21DAD6F08(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, const char *a5, void *a6, uint64_t (*a7)(id), uint64_t (*a8)(void), const char *a9)
{
  v83 = a7;
  id v85 = (id)a1;
  id v86 = a6;
  v78 = a5;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C620);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_21DAE7480();
  uint64_t v16 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  v79 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_21DAE7560();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  id v21 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v22 = __swift_project_value_buffer(v18, (uint64_t)qword_26AB0ECE0);
  id v23 = *(void (**)(char *))(v19 + 16);
  uint64_t v82 = v22;
  v23(v21);
  swift_bridgeObjectRetain_n();
  id v24 = a3;
  uint64_t v25 = sub_21DAE7540();
  int v77 = sub_21DAE7690();
  BOOL v26 = os_log_type_enabled(v25, (os_log_type_t)v77);
  v80 = a8;
  id v84 = v24;
  if (v26)
  {
    uint64_t v71 = v19;
    uint64_t v72 = v18;
    uint64_t v74 = a4;
    v75 = v15;
    uint64_t v76 = v16;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v88[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v87 = sub_21DADB6AC((uint64_t)v85, a2, v88);
    sub_21DAE7700();
    unint64_t v73 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2080;
    id v29 = objc_msgSend(v24, sel_identifier);
    if (!v29) {
      goto LABEL_23;
    }
    id v30 = v29;
    uint64_t v31 = sub_21DAE7590();
    unint64_t v33 = v32;

    uint64_t v87 = sub_21DADB6AC(v31, v33, v88);
    sub_21DAE7700();
    id v34 = v84;

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DAC7000, v25, (os_log_type_t)v77, v78, (uint8_t *)v27, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v28, -1, -1);
    MEMORY[0x223C11130](v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v71 + 8))(v21, v72);
    uint64_t v15 = v75;
    uint64_t v16 = v76;
    a2 = v73;
    a4 = v74;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  id v35 = objc_allocWithZone(MEMORY[0x263EFF260]);
  id v36 = (void *)sub_21DAE7580();
  id v86 = objc_msgSend(v35, sel_initWithEntityName_, v36);

  sub_21DADCB8C(0, &qword_26AB0EC70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB58);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_21DAE8FD0;
  *(void *)(v37 + 56) = type metadata accessor for LiveLookupDBExtension();
  *(void *)(v37 + 64) = sub_21DADC41C();
  id v38 = v84;
  *(void *)(v37 + 32) = v84;
  *(void *)(v37 + 96) = MEMORY[0x263F8D310];
  *(void *)(v37 + 104) = sub_21DADC318();
  *(void *)(v37 + 72) = v85;
  *(void *)(v37 + 80) = a2;
  swift_bridgeObjectRetain();
  id v39 = v38;
  id v40 = (id)sub_21DAE7670();
  sub_21DADC48C(a4, (uint64_t)v15, &qword_267D1C620);
  uint64_t v41 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  uint64_t v42 = v16;
  uint64_t v43 = v81;
  if (v41(v15, 1, v81) == 1)
  {
    sub_21DADC4F0((uint64_t)v15, &qword_267D1C620);
  }
  else
  {
    unint64_t v44 = v15;
    uint64_t v45 = v79;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v79, v44, v43);
    uint64_t v46 = swift_allocObject();
    *(_OWORD *)(v46 + 16) = xmmword_21DAE8FB0;
    id v47 = v40;
    uint64_t v48 = sub_21DAE7450();
    *(void *)(v46 + 56) = sub_21DADCB8C(0, &qword_26AB0EB48);
    *(void *)(v46 + 64) = sub_21DADC3B4();
    *(void *)(v46 + 32) = v48;
    uint64_t v49 = (void *)sub_21DAE7670();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBF0);
    uint64_t v50 = swift_allocObject();
    *(_OWORD *)(v50 + 16) = xmmword_21DAE8FF0;
    *(void *)(v50 + 32) = v47;
    *(void *)(v50 + 40) = v49;
    v88[0] = v50;
    sub_21DAE7600();
    id v51 = v49;
    os_log_type_t v52 = (void *)sub_21DAE75D0();
    swift_bridgeObjectRelease();
    id v40 = objc_msgSend(self, sel_andPredicateWithSubpredicates_, v52);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v45, v43);
  }
  id v53 = v86;
  objc_msgSend(v86, sel_setPredicate_, v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBF0);
  uint64_t v54 = swift_allocObject();
  *(_OWORD *)(v54 + 16) = xmmword_21DAE8FC0;
  id v55 = objc_allocWithZone(MEMORY[0x263F08B30]);
  id v56 = (void *)sub_21DAE7580();
  id v57 = objc_msgSend(v55, sel_initWithKey_ascending_, v56, 1);

  *(void *)(v54 + 32) = v57;
  v88[0] = v54;
  sub_21DAE7600();
  sub_21DADCB8C(0, &qword_26AB0EB98);
  unint64_t v58 = (void *)sub_21DAE75D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v53, sel_setSortDescriptors_, v58);

  unint64_t v59 = v83(v53);
  swift_bridgeObjectRetain_n();
  id v60 = sub_21DAE7540();
  os_log_type_t v61 = sub_21DAE7690();
  if (os_log_type_enabled(v60, v61))
  {
    id v85 = v40;
    id v62 = (uint8_t *)swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    v88[0] = v63;
    *(_DWORD *)id v62 = 136315138;
    uint64_t v64 = v80(0);
    uint64_t v65 = swift_bridgeObjectRetain();
    uint64_t v66 = MEMORY[0x223C10650](v65, v64);
    unint64_t v68 = v67;
    swift_bridgeObjectRelease();
    uint64_t v87 = sub_21DADB6AC(v66, v68, v88);
    sub_21DAE7700();
    swift_bridgeObjectRelease_n();
    id v40 = v85;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DAC7000, v60, v61, a9, v62, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v63, -1, -1);
    MEMORY[0x223C11130](v62, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (v59 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_21DAE77F0();
    swift_bridgeObjectRelease();
    if (!v70) {
      goto LABEL_18;
    }
  }
  else if (!*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_18:
    swift_bridgeObjectRelease();

    return;
  }
  if ((v59 & 0xC000000000000001) != 0)
  {
    MEMORY[0x223C107B0](0, v59);
    goto LABEL_18;
  }
  if (*(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v69 = *(id *)(v59 + 32);
    goto LABEL_18;
  }
  __break(1u);
LABEL_23:

  __break(1u);
}

void sub_21DAD7894(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, unsigned int a8)
{
}

void LiveLookupStore.updateIdentityInfo(for:with:name:iconURL:type:ttlMinutes:)(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 *a7, unsigned int a8)
{
  unsigned int v100 = a8;
  uint64_t v99 = a6;
  uint64_t v96 = a5;
  uint64_t v91 = a4;
  uint64_t v108 = a1;
  v110[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v11 = sub_21DAE7480();
  uint64_t v106 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  v95 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v101 = (char *)&v86 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB88);
  MEMORY[0x270FA5388](v15 - 8);
  v104 = (char *)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_21DAE7400();
  uint64_t v97 = *(void *)(v17 - 8);
  uint64_t v98 = v17;
  MEMORY[0x270FA5388](v17);
  v90 = (char *)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C620);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v86 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  v105 = (char *)&v86 - v23;
  uint64_t v24 = sub_21DAE7560();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v86 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = *a7;
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  v89 = v22;
  uint64_t v29 = __swift_project_value_buffer(v24, (uint64_t)qword_26AB0ECE0);
  id v30 = *(void (**)(char *))(v25 + 16);
  uint64_t v103 = v29;
  v30(v27);
  swift_bridgeObjectRetain_n();
  id v31 = a3;
  unint64_t v32 = sub_21DAE7540();
  int v33 = sub_21DAE7690();
  if (os_log_type_enabled(v32, (os_log_type_t)v33))
  {
    int v88 = v33;
    unsigned int v92 = v28;
    uint64_t v93 = v11;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v87 = (void *)swift_slowAlloc();
    v110[0] = v87;
    *(_DWORD *)uint64_t v34 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v109 = sub_21DADB6AC(v108, a2, (uint64_t *)v110);
    sub_21DAE7700();
    id v94 = (id)a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 12) = 2080;
    id v102 = v31;
    id v35 = objc_msgSend(v31, sel_identifier);
    if (!v35)
    {

      __break(1u);
      goto LABEL_40;
    }
    id v36 = v35;
    uint64_t v37 = sub_21DAE7590();
    unint64_t v39 = v38;

    uint64_t v109 = sub_21DADB6AC(v37, v39, (uint64_t *)v110);
    sub_21DAE7700();
    id v31 = v102;

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DAC7000, v32, (os_log_type_t)v88, "updateIdentityInfo for %s with %s", (uint8_t *)v34, 0x16u);
    id v40 = v87;
    swift_arrayDestroy();
    MEMORY[0x223C11130](v40, -1, -1);
    MEMORY[0x223C11130](v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    uint64_t v11 = v93;
    a2 = (unint64_t)v94;
    uint64_t v41 = v106;
    uint64_t v28 = v92;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    uint64_t v41 = v106;
  }
  uint64_t v42 = (uint64_t)v105;
  id v102 = *(id *)(v41 + 56);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v102)(v105, 1, 1, v11);
  LiveLookupStore.fetchIdentityInfo(for:with:expiration:)(v108, a2, v31, v42);
  unint64_t v44 = v43;
  sub_21DADC4F0(v42, &qword_267D1C620);
  uint64_t v45 = (uint64_t)v104;
  if (!v44)
  {
    unsigned int v92 = v28;
    uint64_t v93 = v11;
    if (*(void *)(v107 + 24))
    {
      swift_retain();
      v75 = (void *)sub_21DADD0CC(0);
      int v77 = v76;
      id v78 = objc_msgSend(v76, sel_viewContext);

      MEMORY[0x270FA5388](v79);
      *(&v86 - 4) = (uint64_t)sub_21DADADD4;
      *(&v86 - 3) = 0;
      *(&v86 - 2) = (uint64_t)v78;
      type metadata accessor for IdentityInfo();
      sub_21DAE76C0();
      swift_release();

      id v94 = v110[0];
      id v46 = v110[0];
      unint64_t v44 = 0;
      uint64_t v11 = v93;
      uint64_t v45 = (uint64_t)v104;
      uint64_t v28 = v92;
      goto LABEL_9;
    }
LABEL_40:
    __break(1u);
    return;
  }
  id v46 = v44;
  id v94 = v44;
LABEL_9:
  id v47 = v44;
  uint64_t v48 = (void *)sub_21DAE7580();
  objc_msgSend(v46, sel_setHandle_, v48);

  objc_msgSend(v46, sel_setType_, v28);
  if (v96)
  {
    uint64_t v49 = (void *)sub_21DAE7580();
    objc_msgSend(v46, sel_setName_, v49);
  }
  uint64_t v50 = (void *)sub_21DAE7580();
  objc_msgSend(v46, sel_setHandle_, v50);

  sub_21DADC48C(v99, v45, &qword_26AB0EB88);
  uint64_t v52 = v97;
  uint64_t v51 = v98;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v97 + 48))(v45, 1, v98) == 1)
  {
    sub_21DADC4F0(v45, &qword_26AB0EB88);
  }
  else
  {
    id v53 = v31;
    uint64_t v54 = v90;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v90, v45, v51);
    uint64_t v55 = v52;
    sub_21DAE7380();
    id v56 = (void *)sub_21DAE7580();
    swift_bridgeObjectRelease();
    objc_msgSend(v46, sel_setIconURL_, v56);

    id v57 = v54;
    id v31 = v53;
    (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v51);
  }
  unint64_t v58 = v95;
  if (v100) {
    unsigned int v59 = v100;
  }
  else {
    unsigned int v59 = 5;
  }
  sub_21DAE7470();
  if (((60 * v59) & 0xFFFFFFFF00000000) != 0) {
    __break(1u);
  }
  id v60 = v101;
  sub_21DAE7440();
  os_log_type_t v61 = *(void (**)(char *, uint64_t))(v106 + 8);
  v61(v58, v11);
  id v62 = (void *)sub_21DAE7450();
  v61(v60, v11);
  objc_msgSend(v46, sel_setExpiration_, v62);

  objc_msgSend(v46, sel_setDbExtension_, v31);
  uint64_t v63 = (uint64_t)v105;
  sub_21DAE7470();
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v102)(v63, 0, 1, v11);
  LiveLookupStore.fetchBlockingInfo(for:with:expiration:)(v108, a2, v31, v63);
  uint64_t v65 = v64;
  sub_21DADC4F0(v63, &qword_267D1C620);
  if (v65)
  {
    id v66 = v65;
    unsigned __int8 v67 = objc_msgSend(v66, sel_shouldBlock);
    unint64_t v68 = v94;
    if (v67)
    {
    }
    else
    {
      id v69 = objc_msgSend(v46, sel_expiration);
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = v101;
        sub_21DAE7460();

        uint64_t v72 = v106;
        unint64_t v73 = v89;
        (*(void (**)(char *, char *, uint64_t))(v106 + 32))(v89, v71, v11);
        ((void (*)(char *, void, uint64_t, uint64_t))v102)(v73, 0, 1, v11);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v72 + 48))(v73, 1, v11) == 1)
        {
          uint64_t v74 = 0;
        }
        else
        {
          uint64_t v74 = (void *)sub_21DAE7450();
          v61(v73, v11);
        }
        unint64_t v68 = v94;
      }
      else
      {
        ((void (*)(char *, uint64_t, uint64_t, uint64_t))v102)(v89, 1, 1, v11);
        uint64_t v74 = 0;
      }
      objc_msgSend(v66, sel_setExpiration_, v74);
    }
  }
  else
  {

    unint64_t v68 = v94;
  }
  v80 = v68;
  uint64_t v81 = sub_21DAE7540();
  os_log_type_t v82 = sub_21DAE7690();
  if (os_log_type_enabled(v81, v82))
  {
    v83 = (uint8_t *)swift_slowAlloc();
    id v84 = (void *)swift_slowAlloc();
    *(_DWORD *)v83 = 138412290;
    if (v68)
    {
      v110[0] = v80;
      id v85 = v80;
    }
    else
    {
      v110[0] = 0;
    }
    sub_21DAE7700();
    *id v84 = v68;

    _os_log_impl(&dword_21DAC7000, v81, v82, "saving identityInfo %@", v83, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v84, -1, -1);
    MEMORY[0x223C11130](v83, -1, -1);
  }
  else
  {

    uint64_t v81 = v80;
  }

  sub_21DAD3130();
}

void *sub_21DAD84D8()
{
  return LiveLookupStore.removeStaleRecords()();
}

void *LiveLookupStore.removeStaleRecords()()
{
  uint64_t v1 = v0;
  v126[1] = *MEMORY[0x263EF8340];
  uint64_t v107 = sub_21DAE7370();
  uint64_t v109 = *(void *)(v107 - 8);
  MEMORY[0x270FA5388](v107);
  uint64_t v106 = (char *)v95 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB88);
  MEMORY[0x270FA5388](v3 - 8);
  v105 = (char *)v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_21DAE7400();
  unint64_t v108 = *(void *)(v115 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v115);
  v104 = (char *)v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v114 = (char *)v95 - v7;
  uint64_t v118 = sub_21DAE7560();
  v111 = *(void (***)(char *, uint64_t))(v118 - 8);
  MEMORY[0x270FA5388](v118);
  v117 = (char *)v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21DAE7480();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DADCB8C(0, &qword_26AB0EC70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB58);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_21DAE8FB0;
  sub_21DAE7470();
  uint64_t v14 = sub_21DAE7450();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(void *)(v13 + 56) = sub_21DADCB8C(0, &qword_26AB0EB48);
  *(void *)(v13 + 64) = sub_21DADC3B4();
  *(void *)(v13 + 32) = v14;
  uint64_t v15 = (void *)sub_21DAE7670();
  id v16 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v17 = (void *)sub_21DAE7580();
  id v18 = objc_msgSend(v16, sel_initWithEntityName_, v17);

  id v96 = v15;
  objc_msgSend(v18, sel_setPredicate_, v15);
  id v113 = v18;
  uint64_t v122 = v1;
  unint64_t v19 = sub_21DAD3640((uint64_t)v18);
  uint64_t v20 = v19;
  if (v19 >> 62) {
    goto LABEL_56;
  }
  for (uint64_t i = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10); ; uint64_t i = sub_21DAE77F0())
  {
    if (i)
    {
      v120 = (void (**)(char *, uint64_t))v20;
      unint64_t v121 = v20 & 0xC000000000000001;
      uint64_t v22 = 4;
      uint64_t v116 = MEMORY[0x263F8EE60] + 8;
      do
      {
        uint64_t v23 = v22 - 4;
        if (v121)
        {
          id v24 = (id)MEMORY[0x223C107B0](v22 - 4, v20);
          uint64_t v25 = v22 - 3;
          if (__OFADD__(v23, 1)) {
            goto LABEL_54;
          }
        }
        else
        {
          id v24 = *(id *)(v20 + 8 * v22);
          uint64_t v25 = v22 - 3;
          if (__OFADD__(v23, 1))
          {
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
        }
        if (!*(void *)(v122 + 24))
        {
          __break(1u);
LABEL_59:
          __break(1u);
        }
        v123 = v95;
        uint64_t v26 = MEMORY[0x270FA5388](v24);
        v95[-2] = v26;
        uint64_t v27 = (void *)v26;
        swift_retain();
        uint64_t v28 = (void *)sub_21DADD0CC(0);
        id v30 = v29;
        id v119 = v27;
        id v31 = objc_msgSend(v29, sel_viewContext);

        MEMORY[0x270FA5388](v32);
        v95[-4] = sub_21DADCC24;
        v95[-3] = &v95[-4];
        v95[-2] = v31;
        sub_21DAE76C0();

        swift_release();
        ++v22;
        uint64_t v20 = (uint64_t)v120;
      }
      while (v25 != i);
    }
    id v119 = 0;

    swift_bridgeObjectRelease();
    sub_21DAD9638((uint64_t)v96);
    unint64_t v33 = LiveLookupStore.fetchExtensions(_:)(0);
    unint64_t v35 = v33;
    if (v33 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_21DAE77F0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v36 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v37 = v118;
    if (!v36) {
      break;
    }
    unint64_t v38 = v35 & 0xC000000000000001;
    unint64_t v39 = v111++;
    v112 = (void (**)(char *, uint64_t, uint64_t))(v39 + 2);
    uint64_t v103 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v108 + 56);
    unsigned int v102 = *MEMORY[0x263F06E50];
    v101 = (void (**)(char *, uint64_t, uint64_t))(v109 + 104);
    unsigned int v100 = (void (**)(char *, uint64_t))(v109 + 8);
    v120 = (void (**)(char *, uint64_t))(v108 + 8);
    id v40 = (void *)MEMORY[0x263F8EE78];
    uint64_t v20 = 4;
    uint64_t v41 = &selRef_connection;
    *(void *)&long long v34 = 136315138;
    long long v98 = v34;
    uint64_t v97 = MEMORY[0x263F8EE58] + 8;
    v95[1] = MEMORY[0x263F8EE60] + 8;
    unint64_t v99 = 0x800000021DAEA980;
    unint64_t v108 = v35 & 0xC000000000000001;
    uint64_t v109 = v36;
    unint64_t v110 = v35;
    while (1)
    {
      id v42 = v38 ? (id)MEMORY[0x223C107B0](v20 - 4, v35) : *(id *)(v35 + 8 * v20);
      uint64_t v43 = v42;
      unint64_t v44 = v20 - 3;
      if (__OFADD__(v20 - 4, 1)) {
        break;
      }
      if (objc_msgSend(v42, sel_shouldRemove) && (objc_msgSend(v43, v41[165]) & 1) == 0)
      {
        v123 = v40;
        if (qword_26AB0EB90 != -1) {
          swift_once();
        }
        uint64_t v45 = __swift_project_value_buffer(v37, (uint64_t)qword_26AB0ECE0);
        id v46 = v117;
        (*v112)(v117, v45, v37);
        id v47 = v43;
        uint64_t v48 = sub_21DAE7540();
        os_log_type_t v49 = sub_21DAE7690();
        BOOL v50 = os_log_type_enabled(v48, v49);
        unint64_t v121 = v20 - 3;
        if (v50)
        {
          uint64_t v51 = swift_slowAlloc();
          uint64_t v52 = swift_slowAlloc();
          v126[0] = v52;
          *(_DWORD *)uint64_t v51 = v98;
          id v53 = objc_msgSend(v47, sel_identifier);
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = (void *)sub_21DAE7590();
            uint64_t v57 = v56;

            id v124 = v55;
            uint64_t v125 = v57;
            uint64_t v58 = sub_21DAE75A0();
            unint64_t v60 = v59;
          }
          else
          {
            unint64_t v60 = 0xE300000000000000;
            uint64_t v58 = 7104878;
          }
          os_log_type_t v61 = v117;
          *(void *)(v51 + 4) = sub_21DADB6AC(v58, v60, v126);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21DAC7000, v48, v49, "removing %s", (uint8_t *)v51, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x223C11130](v52, -1, -1);
          MEMORY[0x223C11130](v51, -1, -1);

          (*v111)(v61, v118);
        }
        else
        {

          (*v111)(v46, v37);
        }
        id v62 = objc_msgSend(v47, sel_identifier);
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v116 = (uint64_t)v47;
          id v113 = (id)sub_21DAE7590();
          uint64_t v65 = v64;

          uint64_t v66 = v115;
          (*v103)(v105, 1, 1, v115);
          unsigned __int8 v67 = *v101;
          unint64_t v68 = v106;
          uint64_t v69 = v102;
          uint64_t v70 = v107;
          (*v101)(v106, v102, v107);
          uint64_t v71 = v104;
          sub_21DAE73E0();
          id v124 = v113;
          uint64_t v125 = v65;
          v67(v68, v69, v70);
          uint64_t v72 = v120;
          sub_21DADC580();
          sub_21DAE73F0();
          (*v100)(v68, v70);
          unint64_t v73 = *v72;
          (*v72)(v71, v66);
          swift_bridgeObjectRelease();
          id v74 = objc_msgSend(self, sel_defaultManager);
          v75 = (void *)sub_21DAE73A0();
          id v124 = 0;
          LODWORD(v67) = objc_msgSend(v74, sel_removeItemAtURL_error_, v75, &v124);

          if (v67)
          {
            id v76 = v124;
            id v77 = v119;
          }
          else
          {
            id v78 = v124;
            uint64_t v79 = (void *)sub_21DAE7360();

            swift_willThrow();
            id v77 = 0;
          }
          id v40 = v123;
          v73(v114, v115);
          id v47 = (id)v116;
        }
        else
        {
          id v77 = v119;
          id v40 = v123;
        }
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)objc_msgSend(v47, sel_identifier);
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v81 = (void *)isUniquelyReferenced_nonNull_native;
          uint64_t v82 = sub_21DAE7590();
          uint64_t v84 = v83;

          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_21DADB59C(0, v40[2] + 1, 1, v40);
            id v40 = (void *)isUniquelyReferenced_nonNull_native;
          }
          unint64_t v86 = v40[2];
          unint64_t v85 = v40[3];
          if (v86 >= v85 >> 1)
          {
            uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_21DADB59C((void *)(v85 > 1), v86 + 1, 1, v40);
            id v40 = (void *)isUniquelyReferenced_nonNull_native;
          }
          v40[2] = v86 + 1;
          uint64_t v87 = &v40[2 * v86];
          v87[4] = v82;
          v87[5] = v84;
        }
        if (!*(void *)(v122 + 24)) {
          goto LABEL_59;
        }
        MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
        v95[-2] = v47;
        swift_retain();
        uint64_t v88 = sub_21DADD0CC(0);
        if (v77)
        {

          swift_release();
          id v119 = 0;
        }
        else
        {
          v90 = (void *)v88;
          uint64_t v91 = v89;
          id v92 = objc_msgSend(v89, sel_viewContext);

          MEMORY[0x270FA5388](v93);
          v95[-4] = sub_21DADCC24;
          v95[-3] = &v95[-4];
          v95[-2] = v92;
          sub_21DAE76C0();
          id v119 = 0;

          swift_release();
        }
        uint64_t v37 = v118;
        unint64_t v38 = v108;
        uint64_t v36 = v109;
        uint64_t v41 = &selRef_connection;
        unint64_t v35 = v110;
        unint64_t v44 = v121;
      }
      else
      {
        if (([v43 v41[165]] & 1) == 0)
        {
          objc_msgSend(v43, sel_setShouldRemove_, 1);
          objc_msgSend(v43, sel_setIsEnabled_, 0);
        }
      }
      ++v20;
      if (v44 == v36) {
        goto LABEL_53;
      }
    }
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  id v40 = (void *)MEMORY[0x263F8EE78];
LABEL_53:
  swift_bridgeObjectRelease();
  sub_21DAD3130();

  return v40;
}

void sub_21DAD92E4()
{
  uint64_t v1 = v0;
  v20[1] = *(id *)MEMORY[0x263EF8340];
  if (objc_msgSend(v0, sel_hasChanges))
  {
    if (qword_26AB0EB90 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_21DAE7560();
    __swift_project_value_buffer(v2, (uint64_t)qword_26AB0ECE0);
    uint64_t v3 = sub_21DAE7540();
    os_log_type_t v4 = sub_21DAE7690();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_21DAC7000, v3, v4, "Saving", v5, 2u);
      MEMORY[0x223C11130](v5, -1, -1);
    }

    v20[0] = 0;
    if (objc_msgSend(v0, sel_save_, v20))
    {
      id v6 = v20[0];
      uint64_t v7 = sub_21DAE7540();
      os_log_type_t v8 = sub_21DAE7690();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_21DAC7000, v7, v8, "Save Successful", v9, 2u);
        MEMORY[0x223C11130](v9, -1, -1);
      }
    }
    else
    {
      id v10 = v20[0];
      uint64_t v11 = (void *)sub_21DAE7360();

      swift_willThrow();
      id v12 = v11;
      id v13 = v11;
      uint64_t v14 = sub_21DAE7540();
      os_log_type_t v15 = sub_21DAE7690();
      if (os_log_type_enabled(v14, v15))
      {
        id v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = (void *)swift_slowAlloc();
        *(_DWORD *)id v16 = 138412290;
        id v18 = v11;
        unint64_t v19 = (void *)_swift_stdlib_bridgeErrorToNSError();
        v20[0] = v19;
        sub_21DAE7700();
        void *v17 = v19;

        _os_log_impl(&dword_21DAC7000, v14, v15, "Could not save. %@", v16, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
        swift_arrayDestroy();
        MEMORY[0x223C11130](v17, -1, -1);
        MEMORY[0x223C11130](v16, -1, -1);
      }
      else
      {
      }
      objc_msgSend(v1, sel_reset);
    }
  }
}

uint64_t sub_21DAD9610(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_21DAD9638(uint64_t a1)
{
  v44[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB88);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v38 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21DAE7400();
  id v6 = *(char **)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v37 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_allocWithZone(MEMORY[0x263EFF260]);
  uint64_t v9 = (void *)sub_21DAE7580();
  id v10 = objc_msgSend(v8, sel_initWithEntityName_, v9);

  objc_msgSend(v10, sel_setPredicate_, a1);
  uint64_t v41 = v1;
  unint64_t v11 = sub_21DAD37F0((uint64_t)v10);
  unint64_t v12 = v11;
  if (v11 >> 62) {
    goto LABEL_20;
  }
  for (uint64_t i = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_21DAE77F0())
  {
    unint64_t v40 = v12 & 0xC000000000000001;
    uint64_t v36 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    long long v34 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
    id v32 = v10;
    unint64_t v33 = (uint64_t (**)(char *, uint64_t))(v6 + 8);
    uint64_t v14 = 4;
    uint64_t v35 = MEMORY[0x263F8EE60] + 8;
    uint64_t v39 = i;
    while (1)
    {
      id v10 = (id)(v14 - 4);
      os_log_type_t v15 = v40 ? (char *)MEMORY[0x223C107B0](v14 - 4, v12) : (char *)*(id *)(v12 + 8 * v14);
      id v6 = v15;
      if (__OFADD__(v10, 1)) {
        break;
      }
      uint64_t v43 = v14 - 3;
      id v16 = objc_msgSend(v15, sel_iconURL);
      if (v16)
      {
        uint64_t v17 = v16;
        sub_21DAE7590();

        uint64_t v18 = (uint64_t)v38;
        sub_21DAE73D0();
        swift_bridgeObjectRelease();
        if ((*v36)(v18, 1, v5) == 1)
        {
          id v16 = (id)sub_21DADC4F0(v18, &qword_26AB0EB88);
        }
        else
        {
          (*v34)(v37, v18, v5);
          id v19 = objc_msgSend(self, sel_defaultManager);
          uint64_t v20 = (void *)sub_21DAE73A0();
          v44[0] = 0;
          unsigned int v21 = objc_msgSend(v19, sel_removeItemAtURL_error_, v20, v44);

          if (v21)
          {
            id v22 = v44[0];
          }
          else
          {
            id v23 = v44[0];
            id v24 = (void *)sub_21DAE7360();

            swift_willThrow();
          }
          id v16 = (id)(*v33)(v37, v5);
        }
      }
      if (!*(void *)(v41 + 24)) {
        __break(1u);
      }
      id v42 = &v31;
      MEMORY[0x270FA5388](v16);
      *(&v31 - 2) = (uint64_t)v6;
      swift_retain();
      uint64_t v25 = (void *)sub_21DADD0CC(0);
      uint64_t v27 = v26;
      id v28 = objc_msgSend(v26, sel_viewContext);

      MEMORY[0x270FA5388](v29);
      *(&v31 - 4) = (uint64_t)sub_21DADCC24;
      *(&v31 - 3) = (uint64_t)(&v31 - 4);
      *(&v31 - 2) = (uint64_t)v28;
      sub_21DAE76C0();

      swift_release();
      ++v14;
      if (v43 == v39)
      {

        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_20:
    ;
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_21DAD9B84(uint64_t a1, unint64_t a2, void (**a3)(unint64_t, uint64_t, char *), unsigned char *a4, uint64_t *a5, void *a6, unint64_t a7)
{
  uint64_t v125 = a6;
  v134 = a4;
  uint64_t v126 = a1;
  unint64_t v11 = (char *)sub_21DAE7560();
  uint64_t v116 = *((void *)v11 - 1);
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = (unint64_t)&v116 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = a5;
  if (a2 >> 62) {
    goto LABEL_120;
  }
  uint64_t v14 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_3:
  uint64_t v15 = (uint64_t)(a3 + 2);
  uint64_t v16 = MEMORY[0x263F8EE58];
  v123 = a7;
  v137 = v11;
  unint64_t v132 = (unint64_t)(a3 + 2);
  unint64_t v133 = v13;
  v131 = a3;
  if (v14)
  {
    unint64_t v130 = a2 & 0xC000000000000001;
    swift_beginAccess();
    a7 = 0;
    uint64_t v122 = a2 & 0xFFFFFFFFFFFFFF8;
    unint64_t v121 = (char *)(a2 + 32);
    v117 = &v139;
    *(void *)&long long v17 = 136315138;
    long long v124 = v17;
    uint64_t v120 = v16 + 8;
    unint64_t v13 = (unint64_t)(a3 + 2);
    *(void *)&long long v129 = a2;
    uint64_t v128 = v14;
    do
    {
      if (v130)
      {
        unsigned int v21 = (char *)MEMORY[0x223C107B0](a7, a2);
      }
      else
      {
        if (a7 >= *(void *)(v122 + 16)) {
          goto LABEL_115;
        }
        unsigned int v21 = (char *)*(id *)&v121[8 * a7];
      }
      v136 = v21;
      if (__OFADD__(a7++, 1)) {
        goto LABEL_111;
      }
      unint64_t v13 = *(void *)v13;
      unint64_t v135 = a7;
      if (v13 >> 62)
      {
        swift_bridgeObjectRetain();
        unint64_t v11 = (char *)sub_21DAE77F0();
        if (v11)
        {
LABEL_17:
          a2 = (unint64_t)&v136[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier];
          a7 = v13 & 0xC000000000000001;
          uint64_t v23 = 4;
          do
          {
            a3 = (void (**)(unint64_t, uint64_t, char *))(v23 - 4);
            if (a7) {
              id v24 = (id)MEMORY[0x223C107B0](v23 - 4, v13);
            }
            else {
              id v24 = *(id *)(v13 + 8 * v23);
            }
            uint64_t v25 = v24;
            id v26 = objc_msgSend(v24, sel_identifier, v116, v117);
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = sub_21DAE7590();
              uint64_t v30 = v29;

              if (v28 == *(void *)a2 && v30 == *(void *)(a2 + 8))
              {
                swift_bridgeObjectRelease();

LABEL_44:
                swift_bridgeObjectRelease();
                uint64_t v47 = (uint64_t)v137;
                if (qword_26AB0EB90 != -1) {
                  swift_once();
                }
                a7 = __swift_project_value_buffer(v47, (uint64_t)qword_26AB0ECE0);
                uint64_t v45 = v136;
                uint64_t v48 = sub_21DAE7540();
                os_log_type_t v49 = sub_21DAE7690();
                uint64_t v15 = v49;
                if (os_log_type_enabled(v48, v49))
                {
                  uint64_t v50 = swift_slowAlloc();
                  uint64_t v119 = a7;
                  uint64_t v51 = (uint8_t *)v50;
                  uint64_t v52 = swift_slowAlloc();
                  uint64_t v143 = v52;
                  v136 = v45;
                  *(_DWORD *)uint64_t v51 = v124;
                  uint64_t v118 = v51 + 4;
                  unint64_t v11 = *(char **)a2;
                  unint64_t v53 = *(void *)(a2 + 8);
                  swift_bridgeObjectRetain();
                  uint64_t v138 = sub_21DADB6AC((uint64_t)v11, v53, &v143);
                  uint64_t v45 = v136;
                  sub_21DAE7700();

                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_21DAC7000, v48, (os_log_type_t)v15, "extensionIdentifier in db: %s", v51, 0xCu);
                  swift_arrayDestroy();
                  MEMORY[0x223C11130](v52, -1, -1);
                  a7 = v119;
                  MEMORY[0x223C11130](v51, -1, -1);
                }
                else
                {
                }
                unint64_t v13 = v132;
                swift_beginAccess();
                unint64_t v54 = *(void *)v13;
                if ((*(void *)v13 & 0xC000000000000001) != 0)
                {
                  id v55 = (id)MEMORY[0x223C107B0](v23 - 4);
LABEL_52:
                  uint64_t v56 = v55;
                  swift_endAccess();
                  unsigned __int8 v57 = objc_msgSend(v56, sel_isInstalled);

                  if ((v57 & 1) == 0)
                  {
                    unint64_t v11 = v45;
                    a7 = sub_21DAE7540();
                    os_log_type_t v58 = sub_21DAE7690();
                    uint64_t v15 = v58;
                    if (os_log_type_enabled((os_log_t)a7, v58))
                    {
                      unint64_t v59 = (uint8_t *)swift_slowAlloc();
                      uint64_t v119 = swift_slowAlloc();
                      uint64_t v143 = v119;
                      *(_DWORD *)unint64_t v59 = v124;
                      uint64_t v118 = v59 + 4;
                      unint64_t v60 = v11;
                      v136 = v45;
                      uint64_t v61 = *(void *)a2;
                      unint64_t v62 = *(void *)(a2 + 8);
                      swift_bridgeObjectRetain();
                      uint64_t v63 = v61;
                      unint64_t v11 = v60;
                      uint64_t v138 = sub_21DADB6AC(v63, v62, &v143);
                      unint64_t v13 = v132;
                      sub_21DAE7700();

                      uint64_t v45 = v136;
                      swift_bridgeObjectRelease();
                      _os_log_impl(&dword_21DAC7000, (os_log_t)a7, (os_log_type_t)v15, "setting extensionIdentifier to available %s", v59, 0xCu);
                      uint64_t v64 = v119;
                      swift_arrayDestroy();
                      MEMORY[0x223C11130](v64, -1, -1);
                      MEMORY[0x223C11130](v59, -1, -1);
                    }
                    else
                    {
                    }
                    swift_beginAccess();
                    unint64_t v65 = *(void *)v13;
                    if ((*(void *)v13 & 0xC000000000000001) != 0)
                    {
                      id v66 = (id)MEMORY[0x223C107B0](v23 - 4);
                    }
                    else
                    {
                      if ((unint64_t)a3 >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                        goto LABEL_117;
                      }
                      id v66 = *(id *)(v65 + 8 * v23);
                    }
                    a7 = (unint64_t)v66;
                    swift_endAccess();
                    objc_msgSend((id)a7, sel_setIsInstalled_, 1);

                    swift_beginAccess();
                    unint64_t v67 = *(void *)v13;
                    if ((*(void *)v13 & 0xC000000000000001) != 0)
                    {
                      id v68 = (id)MEMORY[0x223C107B0](v23 - 4);
                    }
                    else
                    {
                      if ((unint64_t)a3 >= *(void *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                        goto LABEL_118;
                      }
                      id v68 = *(id *)(v67 + 8 * v23);
                    }
                    a7 = (unint64_t)v68;
                    swift_endAccess();
                    objc_msgSend((id)a7, sel_setShouldRemove_, 0);

                    swift_beginAccess();
                    unint64_t v69 = *(void *)v13;
                    if ((*(void *)v13 & 0xC000000000000001) != 0)
                    {
                      id v18 = (id)MEMORY[0x223C107B0](v23 - 4);
                    }
                    else
                    {
                      if ((unint64_t)a3 >= *(void *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                        goto LABEL_119;
                      }
                      id v18 = *(id *)(v69 + 8 * v23);
                    }
                    id v19 = v18;
                    swift_endAccess();
                    objc_msgSend(v19, sel_setIsAppStoreVendable_, v11[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable]);

                    unsigned char *v134 = 1;
                  }
                  swift_beginAccess();
                  unint64_t v11 = (char *)sub_21DADACC4(v23 - 4);
                  swift_endAccess();
                  a3 = v131;
                  a2 = v129;
                  uint64_t v20 = v128;
                  goto LABEL_9;
                }
                if ((unint64_t)a3 < *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  id v55 = *(id *)(v54 + 8 * v23);
                  goto LABEL_52;
                }
LABEL_116:
                __break(1u);
LABEL_117:
                __break(1u);
LABEL_118:
                __break(1u);
LABEL_119:
                __break(1u);
LABEL_120:
                swift_bridgeObjectRetain();
                uint64_t v14 = sub_21DAE77F0();
                goto LABEL_3;
              }
              char v32 = sub_21DAE7840();

              swift_bridgeObjectRelease();
              if (v32) {
                goto LABEL_44;
              }
              unint64_t v33 = (char *)(v23 - 3);
              if (__OFADD__(a3, 1))
              {
LABEL_110:
                __break(1u);
LABEL_111:
                __break(1u);
LABEL_112:
                __break(1u);
                goto LABEL_113;
              }
            }
            else
            {

              unint64_t v33 = (char *)(v23 - 3);
              if (__OFADD__(a3, 1)) {
                goto LABEL_110;
              }
            }
            ++v23;
          }
          while (v33 != v11);
        }
      }
      else
      {
        unint64_t v11 = *(char **)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v11) {
          goto LABEL_17;
        }
      }
      swift_bridgeObjectRelease();
      if (qword_26AB0EB90 != -1) {
        swift_once();
      }
      __swift_project_value_buffer((uint64_t)v137, (uint64_t)qword_26AB0ECE0);
      unint64_t v11 = v136;
      long long v34 = sub_21DAE7540();
      os_log_type_t v35 = sub_21DAE7690();
      BOOL v36 = os_log_type_enabled(v34, v35);
      a3 = v131;
      uint64_t v20 = v128;
      uint64_t v15 = 0x267D1C000uLL;
      if (v36)
      {
        uint64_t v37 = swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        uint64_t v143 = v38;
        *(_DWORD *)uint64_t v37 = v124;
        uint64_t v39 = *(void *)&v11[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier];
        unint64_t v40 = *(void *)&v11[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_identifier + 8];
        swift_bridgeObjectRetain();
        *(void *)(v37 + 4) = sub_21DADB6AC(v39, v40, &v143);

        uint64_t v15 = 0x267D1C000;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21DAC7000, v34, v35, "adding extensionIdentifier: %s", (uint8_t *)v37, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C11130](v38, -1, -1);
        MEMORY[0x223C11130](v37, -1, -1);
      }
      else
      {
      }
      uint64_t v41 = v127;
      type metadata accessor for LiveLookupDBExtension();
      id v42 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      a7 = (unint64_t)objc_msgSend(v42, sel_initWithContext_, v126);
      unint64_t v13 = *(void *)&v11[*(void *)(v15 + 1536) + 8];
      swift_bridgeObjectRetain();
      uint64_t v43 = (void *)sub_21DAE7580();
      swift_bridgeObjectRelease();
      objc_msgSend((id)a7, sel_setIdentifier_, v43);

      objc_msgSend((id)a7, sel_setIsAppStoreVendable_, v11[OBJC_IVAR____TtC14IdentityLookup15ExtensionUpdate_isAppStoreVendable]);
      uint64_t v44 = *v41;
      a2 = v129;
      if (*v41 < -32768) {
        goto LABEL_112;
      }
      if (v44 >= 0x8000)
      {
LABEL_113:
        __break(1u);
LABEL_114:
        __break(1u);
LABEL_115:
        __break(1u);
        goto LABEL_116;
      }
      objc_msgSend((id)a7, sel_setPriority_, (__int16)v44);
      objc_msgSend((id)a7, sel_setIsInstalled_, 1);
      objc_msgSend((id)a7, sel_setShouldRemove_, 0);
      if (__OFADD__(*v41, 1)) {
        goto LABEL_114;
      }
      ++*v41;
      unsigned char *v134 = 1;
      uint64_t v45 = (char *)(id)a7;
      id v46 = v125;
      MEMORY[0x223C10620]();
      if (*(void *)((*v46 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v46 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_21DAE7610();
      }
      sub_21DAE7630();
      sub_21DAE7600();
      unint64_t v13 = v132;
LABEL_9:

      a7 = v135;
      unint64_t v11 = v137;
    }
    while (v135 != v20);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v13 = (unint64_t)(a3 + 2);
  }
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v70 = __swift_project_value_buffer((uint64_t)v11, (uint64_t)qword_26AB0ECE0);
  swift_retain_n();
  uint64_t v71 = sub_21DAE7540();
  LODWORD(v72) = sub_21DAE7690();
  unint64_t v73 = v71;
  BOOL v74 = os_log_type_enabled(v71, (os_log_type_t)v72);
  unint64_t v130 = v70;
  if (!v74)
  {

    swift_release_n();
    goto LABEL_93;
  }
  uint64_t v75 = swift_slowAlloc();
  uint64_t v15 = swift_slowAlloc();
  uint64_t v143 = v15;
  *(_DWORD *)uint64_t v75 = 136315138;
  swift_beginAccess();
  uint64_t v70 = *(void *)v13;
  if (*(void *)v13 >> 62) {
    goto LABEL_124;
  }
  uint64_t v76 = *(void *)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10);
  for (uint64_t result = swift_bridgeObjectRetain_n(); ; v76 = result)
  {
    v136 = (char *)v75;
    LODWORD(v135) = v72;
    *(void *)&long long v129 = v15;
    if (v76) {
      break;
    }
    uint64_t v79 = (void *)MEMORY[0x263F8EE78];
LABEL_92:
    swift_bridgeObjectRelease_n();
    uint64_t v72 = (uint8_t *)v136;
    uint64_t v89 = MEMORY[0x223C10650](v79, MEMORY[0x263F8D310]);
    unint64_t v91 = v90;
    swift_bridgeObjectRelease();
    uint64_t v140 = sub_21DADB6AC(v89, v91, &v143);
    sub_21DAE7700();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DAC7000, v73, (os_log_type_t)v135, "dbExtensions: %s)", v72, 0xCu);
    uint64_t v92 = v129;
    swift_arrayDestroy();
    MEMORY[0x223C11130](v92, -1, -1);
    MEMORY[0x223C11130](v72, -1, -1);

    unint64_t v13 = v132;
    uint64_t v70 = v130;
LABEL_93:
    swift_beginAccess();
    uint64_t v75 = *(void *)v13;
    unint64_t v73 = v123;
    if (*(void *)v13 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v93 = sub_21DAE77F0();
      v95 = (void *)&swift_initStaticObject;
      if (!v93) {
        return swift_bridgeObjectRelease();
      }
    }
    else
    {
      uint64_t v93 = *(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      v95 = &swift_initStaticObject;
      if (!v93) {
        return swift_bridgeObjectRelease();
      }
    }
    if (v93 >= 1)
    {
      uint64_t v96 = 0;
      unint64_t v132 = v75 & 0xC000000000000001;
      v131 = (void (**)(unint64_t, uint64_t, char *))(v116 + 16);
      uint64_t v97 = (void (**)(unint64_t, char *))(v116 + 8);
      *(void *)&long long v94 = v95[500];
      long long v129 = v94;
      uint64_t v128 = MEMORY[0x263F8EE58] + 8;
      unint64_t v135 = v93;
      v136 = (char *)v75;
      do
      {
        if (v132) {
          id v98 = (id)MEMORY[0x223C107B0](v96, v75);
        }
        else {
          id v98 = *(id *)(v75 + 8 * v96 + 32);
        }
        unint64_t v99 = v98;
        objc_msgSend(v98, sel_setIsInstalled_, 0, v116);
        unint64_t v100 = v133;
        (*v131)(v133, v70, v11);
        id v101 = v99;
        unsigned int v102 = sub_21DAE7540();
        os_log_type_t v103 = sub_21DAE7690();
        if (os_log_type_enabled(v102, v103))
        {
          uint64_t v104 = swift_slowAlloc();
          uint64_t v105 = swift_slowAlloc();
          uint64_t v142 = v105;
          *(_DWORD *)uint64_t v104 = v129;
          id v106 = objc_msgSend(v101, sel_identifier);
          if (v106)
          {
            uint64_t v107 = v106;
            uint64_t v108 = sub_21DAE7590();
            uint64_t v110 = v109;

            uint64_t v140 = v108;
            uint64_t v141 = v110;
            unint64_t v73 = v123;
            uint64_t v111 = sub_21DAE75A0();
            unint64_t v113 = v112;
          }
          else
          {
            unint64_t v113 = 0xE300000000000000;
            uint64_t v111 = 7104878;
          }
          unint64_t v114 = v135;
          *(void *)(v104 + 4) = sub_21DADB6AC(v111, v113, &v142);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21DAC7000, v102, v103, "setting dbExtension to not installed: %s", (uint8_t *)v104, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x223C11130](v105, -1, -1);
          MEMORY[0x223C11130](v104, -1, -1);

          unint64_t v11 = v137;
          (*v97)(v133, v137);
          uint64_t v70 = v130;
        }
        else
        {

          (*v97)(v100, v11);
          unint64_t v114 = v135;
        }
        unsigned char *v134 = 1;
        id v115 = v101;
        MEMORY[0x223C10620]();
        if (*(void *)(((uint64_t)v73->isa & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((uint64_t)v73->isa & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
          sub_21DAE7610();
        ++v96;
        sub_21DAE7630();
        sub_21DAE7600();

        uint64_t v75 = (uint64_t)v136;
      }
      while (v114 != v96);
      return swift_bridgeObjectRelease();
    }
    __break(1u);
LABEL_124:
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_21DAE77F0();
  }
  if (v76 >= 1)
  {
    uint64_t v78 = 0;
    uint64_t v79 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v70 & 0xC000000000000001) != 0) {
        id v80 = (id)MEMORY[0x223C107B0](v78, v70);
      }
      else {
        id v80 = *(id *)(v70 + 8 * v78 + 32);
      }
      uint64_t v81 = v80;
      id v82 = objc_msgSend(v80, sel_identifier, v116);
      if (v82)
      {
        uint64_t v83 = v82;
        uint64_t v84 = sub_21DAE7590();
        uint64_t v15 = v85;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v79 = sub_21DADB59C(0, v79[2] + 1, 1, v79);
        }
        unint64_t v87 = v79[2];
        unint64_t v86 = v79[3];
        if (v87 >= v86 >> 1) {
          uint64_t v79 = sub_21DADB59C((void *)(v86 > 1), v87 + 1, 1, v79);
        }
        v79[2] = v87 + 1;
        uint64_t v88 = &v79[2 * v87];
        v88[4] = v84;
        v88[5] = v15;
      }
      else
      {
      }
      ++v78;
      unint64_t v11 = v137;
    }
    while (v76 != v78);
    goto LABEL_92;
  }
  __break(1u);
  return result;
}

uint64_t sub_21DADACC4(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_21DADC010(v3);
    unint64_t v3 = v5;
    *uint64_t v1 = v5;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v7 = *(void *)(v6 + 16);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    uint64_t v9 = v7 - 1 - a1;
    if (v9 >= 0)
    {
      uint64_t v10 = v6 + 8 * a1;
      uint64_t v11 = *(void *)(v10 + 32);
      memmove((void *)(v10 + 32), (const void *)(v10 + 40), 8 * v9);
      *(void *)(v6 + 16) = v8;
      sub_21DAE7600();
      return v11;
    }
  }
  uint64_t result = sub_21DAE7800();
  __break(1u);
  return result;
}

id sub_21DADADA8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_21DADAE00(a1, (void (*)(void))type metadata accessor for BlockingInfo, a2);
}

id sub_21DADADD4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_21DADAE00(a1, (void (*)(void))type metadata accessor for IdentityInfo, a2);
}

id sub_21DADAE00@<X0>(uint64_t a1@<X0>, void (*a2)(void)@<X1>, void *a3@<X8>)
{
  a2(0);
  id result = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, a1);
  *a3 = result;
  return result;
}

id sub_21DADAE5C(uint64_t (*a1)(void *), uint64_t a2, void *a3)
{
  v15[1] = *(id *)MEMORY[0x263EF8340];
  id result = (id)a1(a3);
  if (!v3)
  {
    if (qword_26AB0EB90 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_21DAE7560();
    __swift_project_value_buffer(v6, (uint64_t)qword_26AB0ECE0);
    id v7 = a3;
    unint64_t v8 = sub_21DAE7540();
    os_log_type_t v9 = sub_21DAE7690();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 67109120;
      LODWORD(v15[0]) = objc_msgSend(v7, sel_hasChanges);
      sub_21DAE7700();

      _os_log_impl(&dword_21DAC7000, v8, v9, "viewContextPerforming context.hasChanges: %{BOOL}d", v10, 8u);
      MEMORY[0x223C11130](v10, -1, -1);
    }
    else
    {
    }
    id result = objc_msgSend(v7, sel_hasChanges, v15[0]);
    if (result)
    {
      uint64_t v11 = sub_21DAE7540();
      os_log_type_t v12 = sub_21DAE7690();
      if (os_log_type_enabled(v11, v12))
      {
        unint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v13 = 0;
        _os_log_impl(&dword_21DAC7000, v11, v12, "viewContextPerforming saving", v13, 2u);
        MEMORY[0x223C11130](v13, -1, -1);
      }

      v15[0] = 0;
      if (objc_msgSend(v7, sel_save_, v15))
      {
        return v15[0];
      }
      else
      {
        id v14 = v15[0];
        sub_21DAE7360();

        return (id)swift_willThrow();
      }
    }
  }
  return result;
}

void *sub_21DADB0BC(void *(*a1)(unsigned __int8 *__return_ptr, void *), uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id result = a1(&v17, a3);
  if (!v3)
  {
    if (qword_26AB0EB90 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_21DAE7560();
    __swift_project_value_buffer(v6, (uint64_t)qword_26AB0ECE0);
    id v7 = a3;
    unint64_t v8 = sub_21DAE7540();
    os_log_type_t v9 = sub_21DAE7690();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 67109120;
      LODWORD(v16) = objc_msgSend(v7, sel_hasChanges);
      sub_21DAE7700();

      _os_log_impl(&dword_21DAC7000, v8, v9, "viewContextPerforming context.hasChanges: %{BOOL}d", v10, 8u);
      MEMORY[0x223C11130](v10, -1, -1);
    }
    else
    {
    }
    if (objc_msgSend(v7, sel_hasChanges))
    {
      uint64_t v11 = sub_21DAE7540();
      os_log_type_t v12 = sub_21DAE7690();
      if (os_log_type_enabled(v11, v12))
      {
        unint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v13 = 0;
        _os_log_impl(&dword_21DAC7000, v11, v12, "viewContextPerforming saving", v13, 2u);
        MEMORY[0x223C11130](v13, -1, -1);
      }

      id v16 = 0;
      if (!objc_msgSend(v7, sel_save_, &v16))
      {
        id v15 = v16;
        sub_21DAE7360();

        return (void *)swift_willThrow();
      }
      id v14 = v16;
    }
    return (void *)v17;
  }
  return result;
}

void sub_21DADB328(void (*a1)(id *__return_ptr, void *), uint64_t a2, void *a3)
{
  v16[1] = *(id *)MEMORY[0x263EF8340];
  a1(v16, a3);
  if (!v3)
  {
    if (qword_26AB0EB90 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_21DAE7560();
    __swift_project_value_buffer(v5, (uint64_t)qword_26AB0ECE0);
    id v6 = a3;
    id v7 = sub_21DAE7540();
    os_log_type_t v8 = sub_21DAE7690();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v9 = 67109120;
      LODWORD(v15) = objc_msgSend(v6, sel_hasChanges);
      sub_21DAE7700();

      _os_log_impl(&dword_21DAC7000, v7, v8, "viewContextPerforming context.hasChanges: %{BOOL}d", v9, 8u);
      MEMORY[0x223C11130](v9, -1, -1);
    }
    else
    {
    }
    if (objc_msgSend(v6, sel_hasChanges))
    {
      uint64_t v10 = sub_21DAE7540();
      os_log_type_t v11 = sub_21DAE7690();
      if (os_log_type_enabled(v10, v11))
      {
        os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v12 = 0;
        _os_log_impl(&dword_21DAC7000, v10, v11, "viewContextPerforming saving", v12, 2u);
        MEMORY[0x223C11130](v12, -1, -1);
      }

      id v15 = 0;
      if (objc_msgSend(v6, sel_save_, &v15))
      {
        id v13 = v15;
      }
      else
      {
        id v14 = v15;
        sub_21DAE7360();

        swift_willThrow();
      }
    }
  }
}

void *sub_21DADB59C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C650);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21DADC910(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21DADB6AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21DADB780(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21DADCA34((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_21DADCA34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21DADB780(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_21DAE7710();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21DADB93C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_21DAE7770();
  if (!v8)
  {
    sub_21DAE77D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21DAE7800();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_21DADB93C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21DADB9D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21DADBBB4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21DADBBB4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21DADB9D4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_21DADBB4C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21DAE7730();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21DAE77D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21DAE75B0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21DAE7800();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21DAE77D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21DADBB4C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21DADBBB4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBA8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_21DAE7800();
  __break(1u);
  return result;
}

uint64_t sub_21DADBD04(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21DADBD44(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_21DADBD24(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21DADBEB0(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_21DADBD44(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C650);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  id v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_21DAE7800();
  __break(1u);
  return result;
}

uint64_t sub_21DADBEB0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C648);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v13 = v10 + 32;
  id v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_21DAE7800();
  __break(1u);
  return result;
}

void sub_21DADC010(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21DAE77F0();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x223C107C0);
}

id sub_21DADC08C()
{
  uint64_t v0 = sub_21DAE7400();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAE7390();
  id v4 = objc_allocWithZone(MEMORY[0x263EFF328]);
  size_t v5 = (void *)sub_21DAE73A0();
  id v6 = objc_msgSend(v4, sel_initWithURL_, v5);

  objc_msgSend(v6, sel_setShouldInferMappingModelAutomatically_, 1);
  objc_msgSend(v6, sel_setShouldMigrateStoreAutomatically_, 1);
  sub_21DAE7590();
  int64_t v7 = (void *)sub_21DAE7580();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setOption_forKey_, v7, *MEMORY[0x263EFF0E0]);

  sub_21DADCB8C(0, (unint64_t *)&qword_267D1C658);
  uint64_t v8 = (void *)sub_21DAE76F0();
  objc_msgSend(v6, sel_setOption_forKey_, v8, *MEMORY[0x263EFF0B0]);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

id sub_21DADC260(void *a1)
{
  return objc_msgSend(a1, sel_deleteObject_, *(void *)(v1 + 16));
}

id sub_21DADC294()
{
  return sub_21DADAE5C(*(uint64_t (**)(void *))(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_21DADC2B4(uint64_t a1)
{
  return sub_21DAD3DAC(a1, *(uint64_t **)(v1 + 24));
}

uint64_t sub_21DADC2C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = 0;
  return result;
}

void *sub_21DADC300@<X0>(unsigned char *a1@<X8>)
{
  return sub_21DADCAC0(a1);
}

unint64_t sub_21DADC318()
{
  unint64_t result = qword_267D1C618;
  if (!qword_267D1C618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C618);
  }
  return result;
}

uint64_t sub_21DADC36C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21DADC3A4(uint64_t a1)
{
  return sub_21DAD9B84(a1, *(void *)(v1 + 16), *(void (***)(unint64_t, uint64_t, char *))(v1 + 24), *(unsigned char **)(v1 + 32), *(uint64_t **)(v1 + 40), *(void **)(v1 + 48), *(void *)(v1 + 56));
}

unint64_t sub_21DADC3B4()
{
  unint64_t result = qword_26AB0EB50;
  if (!qword_26AB0EB50)
  {
    sub_21DADCB8C(255, &qword_26AB0EB48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AB0EB50);
  }
  return result;
}

unint64_t sub_21DADC41C()
{
  unint64_t result = qword_267D1C628;
  if (!qword_267D1C628)
  {
    type metadata accessor for LiveLookupDBExtension();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C628);
  }
  return result;
}

void sub_21DADC474(void *a1@<X8>)
{
}

uint64_t sub_21DADC48C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21DADC4F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_21DADC54C(void *a1@<X8>)
{
  sub_21DADB328(*(void (**)(id *__return_ptr, void *))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
  if (!v2) {
    *a1 = v4;
  }
}

unint64_t sub_21DADC580()
{
  unint64_t result = qword_267D1C630;
  if (!qword_267D1C630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C630);
  }
  return result;
}

unint64_t sub_21DADC5D8()
{
  unint64_t result = qword_267D1C638;
  if (!qword_267D1C638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C638);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IdentityType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for IdentityType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21DADC798);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_21DADC7C0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21DADC7CC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for IdentityType()
{
  return &type metadata for IdentityType;
}

uint64_t method lookup function for ExtensionUpdate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ExtensionUpdate);
}

uint64_t dispatch thunk of ExtensionUpdate.__allocating_init(identifier:isAppStoreVendable:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t type metadata accessor for LiveLookupStore()
{
  return self;
}

uint64_t method lookup function for LiveLookupStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LiveLookupStore);
}

uint64_t dispatch thunk of LiveLookupStore.__allocating_init(storeLocation:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of LiveLookupStore.delete(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of LiveLookupStore.save()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of LiveLookupStore.fetch<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_21DADC8E0(uint64_t a1)
{
  return sub_21DAD3B5C(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), (void (*)(void))type metadata accessor for IdentityInfo);
}

uint64_t sub_21DADC910(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21DAE7800();
  __break(1u);
  return result;
}

uint64_t sub_21DADCA04(uint64_t a1)
{
  return sub_21DAD3B5C(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), (void (*)(void))type metadata accessor for BlockingInfo);
}

uint64_t sub_21DADCA34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21DADCA90(uint64_t a1)
{
  return sub_21DAD3B5C(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), (void (*)(void))type metadata accessor for LiveLookupDBExtension);
}

void *sub_21DADCAC0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_21DADB0BC(*(void *(**)(unsigned __int8 *__return_ptr, void *))(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
  if (!v2) {
    *a1 = result & 1;
  }
  return result;
}

uint64_t sub_21DADCAF8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_21DADCB30()
{
}

uint64_t sub_21DADCB54()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21DADCB64()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_21DADCB8C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void type metadata accessor for ILMessageFilterSubAction(uint64_t a1)
{
}

void sub_21DADCBDC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_21DADCC24(void *a1)
{
  return sub_21DADC260(a1);
}

uint64_t sub_21DADCC3C@<X0>(unsigned char *a1@<X8>)
{
  return sub_21DADC2C0(a1);
}

id sub_21DADCC54()
{
  return sub_21DADC294();
}

uint64_t sub_21DADCC6C()
{
  uint64_t v0 = sub_21DAE7560();
  __swift_allocate_value_buffer(v0, qword_26AB0ECE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AB0ECE0);
  return sub_21DAE7550();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t StoreWrapper.__allocating_init(containerName:modelURL:storeDescription:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = sub_21DADDE6C(a3);
  if (v4)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v10;
    type metadata accessor for StoreWrapper();
    uint64_t v5 = swift_allocObject();
    StoreWrapper.init(containerName:model:storeDescription:)(a1, a2, v12, a4);
  }
  uint64_t v11 = sub_21DAE7400();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a3, v11);
  return v5;
}

BOOL sub_21DADCE58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21DADCE70()
{
  return sub_21DAE78C0();
}

uint64_t sub_21DADCEB8()
{
  return sub_21DAE78A0();
}

uint64_t sub_21DADCEE4()
{
  return sub_21DAE78C0();
}

uint64_t StoreWrapper.__allocating_init(containerName:model:storeDescription:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = swift_allocObject();
  StoreWrapper.init(containerName:model:storeDescription:)(a1, a2, a3, a4);
  return v8;
}

void *StoreWrapper.init(containerName:model:storeDescription:)(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v4[2] = 0;
  v4[3] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C668);
  uint64_t v9 = swift_allocObject();
  *(_DWORD *)(v9 + 36) = 0;
  id v10 = (os_unfair_lock_s *)(v9 + 36);
  *(void *)(v9 + 24) = 0;
  *(void *)(v9 + 16) = 0;
  uint64_t v11 = v9 + 16;
  *(unsigned char *)(v9 + 32) = 2;
  v4[4] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C670);
  uint64_t v12 = swift_allocObject();
  *(_DWORD *)(v12 + 16) = 0;
  v4[5] = v12;
  v4[6] = a1;
  v4[7] = a2;
  v4[8] = a3;
  v4[9] = a4;
  id v13 = a3;
  id v14 = a4;
  swift_retain();
  os_unfair_lock_lock(v10);
  sub_21DADE1E4(v11, v17);
  os_unfair_lock_unlock(v10);
  id v15 = (void *)v17[0];

  swift_release();
  return v4;
}

uint64_t sub_21DADD0CC(char a1)
{
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + 32);
  swift_retain();
  os_unfair_lock_lock(v4 + 9);
  sub_21DADE1E4((uint64_t)&v4[4], &v7);
  uint64_t v5 = v4 + 9;
  if (v2)
  {
    os_unfair_lock_unlock(v5);
    swift_release();
    if (a1)
    {
      swift_willThrow();
    }
    else
    {
      uint64_t v1 = sub_21DADD0CC(1);
    }
  }
  else
  {
    os_unfair_lock_unlock(v5);
    uint64_t v1 = v7;
    swift_release();
  }
  return v1;
}

id sub_21DADD1B0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  unint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  int v8 = *(unsigned __int8 *)(a1 + 16);
  if (v8 == 1)
  {
    if (qword_26AB0EB90 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_21DAE7560();
    __swift_project_value_buffer(v11, (uint64_t)qword_26AB0ECE0);
    id v12 = v6;
    id v13 = v6;
    id v14 = sub_21DAE7540();
    os_log_type_t v15 = sub_21DAE7690();
    if (os_log_type_enabled(v14, v15))
    {
      id v16 = (uint8_t *)swift_slowAlloc();
      log = v14;
      unsigned __int8 v17 = (void *)swift_slowAlloc();
      *(_DWORD *)id v16 = 138412290;
      id v18 = v6;
      uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
      sub_21DAE7700();
      void *v17 = v29;
      sub_21DADE2AC(v6, v7, 1);
      sub_21DADE2AC(v6, v7, 1);
      _os_log_impl(&dword_21DAC7000, log, v15, "Attempting to recover from error %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
      swift_arrayDestroy();
      MEMORY[0x223C11130](v17, -1, -1);
      id v19 = v16;
      uint64_t v3 = v2;
      MEMORY[0x223C11130](v19, -1, -1);

      sub_21DADE2AC(v6, v7, 1);
      goto LABEL_14;
    }
    sub_21DADE2AC(v6, v7, 1);
    sub_21DADE2AC(v6, v7, 1);
  }
  else
  {
    if (!*(unsigned char *)(a1 + 16))
    {
      *a2 = v6;
      a2[1] = v7;
      id v9 = v6;
      return v7;
    }
    sub_21DADE2AC(*(void **)a1, v7, v8);
    if (qword_26AB0EB90 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_21DAE7560();
    __swift_project_value_buffer(v20, (uint64_t)qword_26AB0ECE0);
    id v14 = sub_21DAE7540();
    os_log_type_t v21 = sub_21DAE7690();
    if (os_log_type_enabled(v14, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_21DAC7000, v14, v21, "Attempting initial store load", v22, 2u);
      MEMORY[0x223C11130](v22, -1, -1);
    }
  }

LABEL_14:
  id v23 = sub_21DADD510();
  if (v3)
  {
    *(void *)a1 = v3;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 1;
    id v25 = v3;
    return (id)swift_willThrow();
  }
  else
  {
    id v26 = v24;
    *(void *)a1 = v23;
    *(void *)(a1 + 8) = v24;
    *(unsigned char *)(a1 + 16) = 0;
    *a2 = v23;
    a2[1] = v24;
    id v27 = v23;
    return v26;
  }
}

id sub_21DADD510()
{
  id v2 = *(id *)(v0 + 64);
  id v3 = sub_21DADD7B4(v2);
  if (!v1)
  {
    uint64_t v4 = v3;
    id v5 = v2;
    id v6 = v4;
    id v7 = v5;
    id v8 = v6;
    id v9 = objc_msgSend(v8, sel_viewContext);
    objc_msgSend(v9, sel_setAutomaticallyMergesChangesFromParent_, 1);

    id v10 = objc_msgSend(v8, sel_viewContext);
    objc_msgSend(v10, sel_setShouldRefreshAfterSave_, 1);

    if (qword_26AB0EB90 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_21DAE7560();
    __swift_project_value_buffer(v11, (uint64_t)qword_26AB0ECE0);
    id v12 = v7;
    id v13 = v8;
    id v2 = v12;
    id v14 = v13;
    os_log_type_t v15 = sub_21DAE7540();
    os_log_type_t v16 = sub_21DAE7690();
    if (os_log_type_enabled(v15, v16))
    {
      unsigned __int8 v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = v23;
      *(_DWORD *)unsigned __int8 v17 = 136315138;
      id v18 = v2;
      id v22 = v14;
      uint64_t v19 = sub_21DAE75A0();
      sub_21DADB6AC(v19, v20, &v24);
      sub_21DAE7700();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DAC7000, v15, v16, "Loaded container wrapper: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C11130](v23, -1, -1);
      MEMORY[0x223C11130](v17, -1, -1);
    }
    else
    {
    }
  }
  return v2;
}

id sub_21DADD7B4(void *a1)
{
  uint64_t v2 = v1;
  v41[1] = *(id *)MEMORY[0x263EF8340];
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_21DAE7560();
  __swift_project_value_buffer(v4, (uint64_t)qword_26AB0ECE0);
  swift_retain_n();
  id v5 = a1;
  id v6 = sub_21DAE7540();
  os_log_type_t v7 = sub_21DAE7690();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412546;
    id v10 = *(void **)(v2 + 72);
    id v11 = v10;
    sub_21DAE7700();
    *id v9 = v10;
    uint64_t v12 = v2;
    swift_release_n();
    *(_WORD *)(v8 + 12) = 2112;
    v41[0] = v5;
    id v13 = v5;
    sub_21DAE7700();
    v9[1] = v5;

    _os_log_impl(&dword_21DAC7000, v6, v7, "Loading container with storeDescription: %@ model: %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v9, -1, -1);
    MEMORY[0x223C11130](v8, -1, -1);
  }
  else
  {

    swift_release_n();
    uint64_t v12 = v2;
  }
  id v14 = objc_allocWithZone(MEMORY[0x263EFF2E8]);
  id v15 = v5;
  swift_bridgeObjectRetain();
  os_log_type_t v16 = (void *)sub_21DAE7580();
  swift_bridgeObjectRelease();
  id v17 = objc_msgSend(v14, sel_initWithName_managedObjectModel_, v16, v15);

  id v18 = *(void **)(v12 + 72);
  sub_21DADCB8C(0, (unint64_t *)&qword_267D1C658);
  uint64_t v19 = (void *)sub_21DAE76F0();
  objc_msgSend(v18, sel_setOption_forKey_, v19, *MEMORY[0x263EFF0B0]);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBF0);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_21DAE8FC0;
  *(void *)(v20 + 32) = v18;
  v41[0] = (id)v20;
  sub_21DAE7600();
  sub_21DADCB8C(0, &qword_26AB0EBA0);
  id v21 = v18;
  id v22 = (void *)sub_21DAE75D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setPersistentStoreDescriptions_, v22);

  swift_retain_n();
  uint64_t v23 = sub_21DAE7540();
  os_log_type_t v24 = sub_21DAE7690();
  if (os_log_type_enabled(v23, v24))
  {
    id v25 = (uint8_t *)swift_slowAlloc();
    id v26 = (void *)swift_slowAlloc();
    *(_DWORD *)id v25 = 138543362;
    v41[0] = v21;
    id v27 = v21;
    sub_21DAE7700();
    *id v26 = v21;
    swift_release_n();
    _os_log_impl(&dword_21DAC7000, v23, v24, "MessageContainer: Attempting to load persistent store with description: %{public}@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v26, -1, -1);
    MEMORY[0x223C11130](v25, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  v41[0] = 0;
  unsigned int v28 = objc_msgSend(v17, sel_load_, v41);
  id v29 = v41[0];
  if (v28)
  {
    id v30 = v17;
    id v31 = v29;
    char v32 = sub_21DAE7540();
    os_log_type_t v33 = sub_21DAE7690();
    if (os_log_type_enabled(v32, v33))
    {
      id v40 = v17;
      long long v34 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v35 = (void *)swift_slowAlloc();
      *(_DWORD *)long long v34 = 138412290;
      v41[0] = v30;
      id v36 = v30;
      sub_21DAE7700();
      *os_log_type_t v35 = v30;

      _os_log_impl(&dword_21DAC7000, v32, v33, "Loaded container: %@", v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
      swift_arrayDestroy();
      MEMORY[0x223C11130](v35, -1, -1);
      uint64_t v37 = v34;
      id v17 = v40;
      MEMORY[0x223C11130](v37, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    id v38 = v41[0];
    sub_21DAE7360();

    swift_willThrow();
  }
  return v17;
}

uint64_t StoreWrapper.deinit()
{
  sub_21DADE200(*(void *)(v0 + 16));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t StoreWrapper.__deallocating_deinit()
{
  sub_21DADE200(*(void *)(v0 + 16));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 80, 7);
}

id sub_21DADDE6C(uint64_t a1)
{
  uint64_t v2 = sub_21DAE7400();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_21DAE7560();
  __swift_project_value_buffer(v6, (uint64_t)qword_26AB0ECE0);
  os_log_type_t v7 = sub_21DAE7540();
  os_log_type_t v8 = sub_21DAE7690();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21DAC7000, v7, v8, "MessageContainer: Attempting to load managed object model", v9, 2u);
    MEMORY[0x223C11130](v9, -1, -1);
  }

  id v10 = objc_allocWithZone(MEMORY[0x263EFF298]);
  id v11 = (void *)sub_21DAE73A0();
  id v12 = objc_msgSend(v10, sel_initWithContentsOfURL_, v11);

  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    id v13 = sub_21DAE7540();
    os_log_type_t v14 = sub_21DAE7680();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = v22;
      *(_DWORD *)id v15 = 136446210;
      v21[1] = v15 + 4;
      sub_21DADE528();
      uint64_t v16 = sub_21DAE7830();
      uint64_t v23 = sub_21DADB6AC(v16, v17, &v24);
      sub_21DAE7700();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      _os_log_impl(&dword_21DAC7000, v13, v14, "MessageContainer: Error initializing mom from: %{public}s", v15, 0xCu);
      uint64_t v18 = v22;
      swift_arrayDestroy();
      MEMORY[0x223C11130](v18, -1, -1);
      MEMORY[0x223C11130](v15, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    sub_21DADE4D4();
    swift_allocError();
    unsigned char *v19 = 1;
    swift_willThrow();
  }
  return v12;
}

uint64_t type metadata accessor for StoreWrapper()
{
  return self;
}

id sub_21DADE1E4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_21DADD1B0(a1, a2);
}

uint64_t sub_21DADE200(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t method lookup function for StoreWrapper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StoreWrapper);
}

uint64_t dispatch thunk of StoreWrapper.__allocating_init(containerName:model:storeDescription:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

id sub_21DADE240(id result, void *a2, char a3)
{
  if (a3 == 1)
  {
  }
  else
  {
    if (a3) {
      return result;
    }
    id v4 = result;
    uint64_t result = a2;
  }
  return result;
}

void destroy for StoreWrapper.State(uint64_t a1)
{
}

void sub_21DADE2AC(void *a1, void *a2, char a3)
{
  if (a3 == 1)
  {
  }
  else
  {
    if (a3) {
      return;
    }

    a1 = a2;
  }
}

uint64_t _s14IdentityLookup12StoreWrapperC5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_21DADE240(*(id *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for StoreWrapper.State(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  id v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_21DADE240(*(id *)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  os_log_type_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_21DADE2AC(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StoreWrapper.State(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  id v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_21DADE2AC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for StoreWrapper.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StoreWrapper.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_21DADE494(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_21DADE4AC(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for StoreWrapper.State()
{
  return &type metadata for StoreWrapper.State;
}

unint64_t sub_21DADE4D4()
{
  unint64_t result = qword_267D1C678;
  if (!qword_267D1C678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C678);
  }
  return result;
}

unint64_t sub_21DADE528()
{
  unint64_t result = qword_267D1C680;
  if (!qword_267D1C680)
  {
    sub_21DAE7400();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C680);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StoreWrapperError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for StoreWrapperError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21DADE6DCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_21DADE704(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for StoreWrapperError()
{
  return &type metadata for StoreWrapperError;
}

unint64_t sub_21DADE724()
{
  unint64_t result = qword_267D1C688[0];
  if (!qword_267D1C688[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267D1C688);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ContainerWrapper(void *a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  unsigned int v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for ContainerWrapper(uint64_t a1)
{
  int v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for ContainerWrapper(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  BOOL v7 = *(void **)(a2 + 8);
  int v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ContainerWrapper(uint64_t a1, _OWORD *a2)
{
  unsigned int v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ContainerWrapper(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContainerWrapper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContainerWrapper()
{
  return &type metadata for ContainerWrapper;
}

uint64_t dispatch thunk of LiveCallerIDLookupProtocol.context.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

BOOL static CallLookupExtensionStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CallLookupExtensionStatus.hash(into:)()
{
  return sub_21DAE78A0();
}

uint64_t CallLookupExtensionStatus.hashValue.getter()
{
  return sub_21DAE78C0();
}

uint64_t static LiveCallerIDLookupManager.shared.getter()
{
  uint64_t v0 = type metadata accessor for LiveCallerIDLookupManager();

  return MEMORY[0x270FA0480](v0, &unk_26AB0E928);
}

uint64_t type metadata accessor for LiveCallerIDLookupManager()
{
  return self;
}

uint64_t sub_21DADEA18@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  *(unsigned char *)(v2 + 16) = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = objc_msgSend(self, sel_sharedInstance);
  id v5 = (void *)sub_21DAE7580();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v2;
  v10[4] = sub_21DADEE5C;
  v10[5] = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_21DADEE64;
  v10[3] = &block_descriptor_0;
  BOOL v7 = _Block_copy(v10);
  int v8 = v3;
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_getEnabledForExtensionWithIdentifier_completionHandler_, v5, v7);
  _Block_release(v7);

  sub_21DAE76A0();
  swift_beginAccess();
  *a1 = *(unsigned char *)(v2 + 16);
  return swift_release();
}

uint64_t sub_21DADEBB0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_21DADEBC0(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_21DAE7560();
  __swift_project_value_buffer(v7, (uint64_t)qword_26AB0ECE0);
  id v8 = a2;
  id v9 = a2;
  id v10 = sub_21DAE7540();
  os_log_type_t v11 = sub_21DAE7690();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    id v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 67109378;
    sub_21DAE7700();
    *(_WORD *)(v12 + 8) = 2112;
    if (a2)
    {
      id v14 = a2;
      uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
      sub_21DAE7700();
    }
    else
    {
      sub_21DAE7700();
      uint64_t v15 = 0;
    }
    *id v13 = v15;

    _os_log_impl(&dword_21DAC7000, v10, v11, "status = %{BOOL}d error = %@", (uint8_t *)v12, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EBE8);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v13, -1, -1);
    MEMORY[0x223C11130](v12, -1, -1);
  }
  else
  {
  }
  swift_beginAccess();
  *(unsigned char *)(a4 + 16) = a1 & 1;
  return sub_21DAE76B0();
}

uint64_t sub_21DADEE1C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21DADEE5C(char a1, void *a2)
{
  return sub_21DADEBC0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

void sub_21DADEE64(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_21DADEEDC()
{
  return MEMORY[0x270FA2498](sub_21DADEEF8, 0, 0);
}

uint64_t sub_21DADEEF8()
{
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_21DAE7560();
  __swift_project_value_buffer(v1, (uint64_t)qword_26AB0ECE0);
  uint64_t v2 = sub_21DAE7540();
  os_log_type_t v3 = sub_21DAE7690();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21DAC7000, v2, v3, "openSettings", v4, 2u);
    MEMORY[0x223C11130](v4, -1, -1);
  }

  id v5 = objc_msgSend(self, sel_sharedInstance);
  v0[15] = v5;
  v0[2] = v0;
  v0[3] = sub_21DADF0C4;
  uint64_t v6 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21DADF2A8;
  v0[13] = &block_descriptor_4;
  v0[14] = v6;
  objc_msgSend(v5, sel_openSettingsWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21DADF0C4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 128) = v1;
  if (v1) {
    uint64_t v2 = sub_21DADF238;
  }
  else {
    uint64_t v2 = sub_21DADF1D4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21DADF1D4()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21DADF238()
{
  uint64_t v1 = *(void **)(v0 + 120);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21DADF2A8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C6E8);
    uint64_t v4 = swift_allocError();
    *id v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return MEMORY[0x270FA2408](v7);
  }
}

uint64_t sub_21DADF340(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = a2;
  return MEMORY[0x270FA2498](sub_21DADF360, 0, 0);
}

uint64_t sub_21DADF360()
{
  id v1 = objc_msgSend(self, sel_sharedInstance);
  v0[17] = v1;
  uint64_t v2 = sub_21DAE7580();
  v0[18] = v2;
  v0[2] = v0;
  v0[3] = sub_21DADF4A0;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21DADF2A8;
  v0[13] = &block_descriptor_6;
  v0[14] = v3;
  objc_msgSend(v1, sel_resetExtensionWithIdentier_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21DADF4A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_21DAE0E34;
  }
  else {
    uint64_t v2 = sub_21DAE0E30;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21DADF5B0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = a2;
  return MEMORY[0x270FA2498](sub_21DADF5D0, 0, 0);
}

uint64_t sub_21DADF5D0()
{
  id v1 = objc_msgSend(self, sel_sharedInstance);
  v0[17] = v1;
  uint64_t v2 = sub_21DAE7580();
  v0[18] = v2;
  v0[2] = v0;
  v0[3] = sub_21DADF710;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21DADF2A8;
  v0[13] = &block_descriptor_8;
  v0[14] = v3;
  objc_msgSend(v1, sel_refreshPIRParametersForLiveLookupExtensionWithIdentifier_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21DADF710()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_21DADF888;
  }
  else {
    uint64_t v2 = sub_21DADF820;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21DADF820()
{
  uint64_t v1 = *(void **)(v0 + 144);

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21DADF888()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = (void *)v0[17];
  swift_willThrow();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_21DADF900(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = a2;
  return MEMORY[0x270FA2498](sub_21DADF920, 0, 0);
}

uint64_t sub_21DADF920()
{
  id v1 = objc_msgSend(self, sel_sharedInstance);
  v0[17] = v1;
  uint64_t v2 = sub_21DAE7580();
  v0[18] = v2;
  v0[2] = v0;
  v0[3] = sub_21DADF4A0;
  uint64_t v3 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21DADF2A8;
  v0[13] = &block_descriptor_10;
  v0[14] = v3;
  objc_msgSend(v1, sel_refreshExtensionContextForLiveLookupExtensionWithIdentifier_completionHandler_, v2, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21DADFA60()
{
  if (qword_26AB0EBE0 != -1) {
    swift_once();
  }
  return LiveLookupStore.installedExtensions()();
}

uint64_t sub_21DADFAB8(char a1, uint64_t a2)
{
  *(void *)(v2 + 168) = a2;
  *(unsigned char *)(v2 + 236) = a1;
  uint64_t v3 = sub_21DAE7560();
  *(void *)(v2 + 176) = v3;
  *(void *)(v2 + 184) = *(void *)(v3 - 8);
  *(void *)(v2 + 192) = swift_task_alloc();
  *(void *)(v2 + 200) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21DADFB8C, 0, 0);
}

uint64_t sub_21DADFB8C()
{
  uint64_t v66 = v0;
  if (qword_26AB0EB90 != -1) {
    swift_once();
  }
  id v1 = (void **)(v0 + 168);
  uint64_t v2 = *(void **)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v6 = __swift_project_value_buffer(v4, (uint64_t)qword_26AB0ECE0);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v7(v3, v6, v4);
  id v8 = v2;
  id v9 = sub_21DAE7540();
  os_log_type_t v10 = sub_21DAE7690();
  uint64_t v63 = v7;
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v60 = v10;
    uint64_t v61 = v6;
    os_log_type_t v11 = *v1;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    uint64_t v65 = v59;
    *(_DWORD *)uint64_t v12 = 136315394;
    id v13 = objc_msgSend(v11, sel_identifier);
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = sub_21DAE7590();
      uint64_t v17 = v16;

      *(void *)(v0 + 136) = v15;
      *(void *)(v0 + 144) = v17;
      uint64_t v18 = sub_21DAE75A0();
      unint64_t v20 = v19;
    }
    else
    {
      uint64_t v18 = 7104878;
      unint64_t v20 = 0xE300000000000000;
    }
    uint64_t v26 = *(void *)(v0 + 184);
    uint64_t v57 = *(void *)(v0 + 176);
    uint64_t v58 = *(void *)(v0 + 200);
    id v27 = *(void **)(v0 + 168);
    int v28 = *(unsigned __int8 *)(v0 + 236);
    *(void *)(v0 + 152) = sub_21DADB6AC(v18, v20, &v65);
    sub_21DAE7700();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 1024;
    *(_DWORD *)(v0 + 232) = v28;
    sub_21DAE7700();
    _os_log_impl(&dword_21DAC7000, v9, v60, "setting extension %s enabled=%{BOOL}d", (uint8_t *)v12, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x223C11130](v59, -1, -1);
    MEMORY[0x223C11130](v12, -1, -1);

    id v25 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v25(v58, v57);
    uint64_t v6 = v61;
  }
  else
  {
    uint64_t v21 = *(void *)(v0 + 200);
    uint64_t v22 = *(void *)(v0 + 176);
    uint64_t v23 = *(void *)(v0 + 184);
    uint64_t v24 = *(void **)(v0 + 168);

    id v25 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
    v25(v21, v22);
  }
  id v29 = objc_msgSend(*(id *)(v0 + 168), sel_identifier, v57, v58);
  *(void *)(v0 + 208) = v29;
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(unsigned __int8 *)(v0 + 236);
    id v32 = objc_msgSend(self, sel_sharedInstance);
    *(void *)(v0 + 216) = v32;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_21DAE016C;
    uint64_t v33 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_21DADF2A8;
    *(void *)(v0 + 104) = &block_descriptor_12;
    *(void *)(v0 + 112) = v33;
    objc_msgSend(v32, sel_setEnabled_forExtensionWithIdentifier_completionHandler_, v31, v30, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  else
  {
    long long v34 = *(void **)(v0 + 168);
    v63(*(void *)(v0 + 192), v6, *(void *)(v0 + 176));
    id v35 = v34;
    id v36 = sub_21DAE7540();
    os_log_type_t v37 = sub_21DAE7680();
    if (os_log_type_enabled(v36, v37))
    {
      id v38 = *v1;
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      uint64_t v65 = v64;
      *(_DWORD *)uint64_t v39 = 136315138;
      id v40 = objc_msgSend(v38, sel_identifier);
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = sub_21DAE7590();
        uint64_t v44 = v43;

        *(void *)(v0 + 120) = v42;
        *(void *)(v0 + 128) = v44;
        uint64_t v45 = sub_21DAE75A0();
        unint64_t v47 = v46;
      }
      else
      {
        uint64_t v45 = 7104878;
        unint64_t v47 = 0xE300000000000000;
      }
      uint64_t v53 = *(void *)(v0 + 176);
      uint64_t v62 = *(void *)(v0 + 192);
      unint64_t v54 = *(void **)(v0 + 168);
      *(void *)(v0 + 160) = sub_21DADB6AC(v45, v47, &v65);
      sub_21DAE7700();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21DAC7000, v36, v37, "extension %s has null identifier", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C11130](v64, -1, -1);
      MEMORY[0x223C11130](v39, -1, -1);

      uint64_t v51 = v62;
      uint64_t v52 = v53;
    }
    else
    {
      uint64_t v48 = *(void *)(v0 + 192);
      uint64_t v50 = *(void **)(v0 + 168);
      uint64_t v49 = *(void *)(v0 + 176);

      uint64_t v51 = v48;
      uint64_t v52 = v49;
    }
    v25(v51, v52);
    swift_task_dealloc();
    swift_task_dealloc();
    id v55 = *(uint64_t (**)(void))(v0 + 8);
    return v55();
  }
}

uint64_t sub_21DAE016C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 224) = v1;
  if (v1) {
    uint64_t v2 = sub_21DAE0318;
  }
  else {
    uint64_t v2 = sub_21DAE027C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21DAE027C()
{
  uint64_t v1 = *(void **)(v0 + 208);
  uint64_t v2 = *(void **)(v0 + 168);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 236);

  objc_msgSend(v2, sel_setIsEnabled_, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_21DAE0318()
{
  uint64_t v1 = (void *)v0[27];
  uint64_t v2 = (void *)v0[26];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void sub_21DAE03AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return;
  }
  uint64_t v2 = a1;
  if (qword_26AB0EBE0 != -1) {
LABEL_30:
  }
    swift_once();
  unint64_t v3 = LiveLookupStore.installedExtensions()();
  unint64_t v4 = v3;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_21DAE77F0();
  }
  else
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  uint64_t v6 = 0;
  uint64_t v20 = v1;
  uint64_t v21 = v2 + 32;
  __int16 v22 = 1;
  while (1)
  {
    if (v6 == v1)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    if (v5) {
      break;
    }
LABEL_7:
    if (++v6 == v1) {
      goto LABEL_26;
    }
  }
  uint64_t v23 = v6;
  uint64_t v7 = (uint64_t *)(v21 + 16 * v6);
  uint64_t v8 = *v7;
  uint64_t v1 = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v2 = 4;
  while (1)
  {
    if ((v4 & 0xC000000000000001) != 0) {
      id v9 = (id)MEMORY[0x223C107B0](v2 - 4, v4);
    }
    else {
      id v9 = *(id *)(v4 + 8 * v2);
    }
    os_log_type_t v10 = v9;
    uint64_t v11 = v2 - 3;
    if (__OFADD__(v2 - 4, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    id v12 = objc_msgSend(v9, sel_identifier);
    if (!v12) {
      goto LABEL_11;
    }
    id v13 = v12;
    uint64_t v14 = sub_21DAE7590();
    uint64_t v16 = v15;

    BOOL v17 = v14 == v8 && v16 == v1;
    if (v17) {
      break;
    }
    char v18 = sub_21DAE7840();
    swift_bridgeObjectRelease();
    if (v18) {
      goto LABEL_24;
    }
LABEL_11:

    ++v2;
    if (v11 == v5)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v1 = v20;
      uint64_t v6 = v23;
      goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
LABEL_24:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v19 = v22;
  objc_msgSend(v10, sel_setPriority_, v22);

  ++v22;
  BOOL v17 = v19 + 1 == (__int16)(v19 + 1);
  uint64_t v1 = v20;
  uint64_t v6 = v23;
  if (v17) {
    goto LABEL_7;
  }
  __break(1u);
LABEL_26:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21DAD3130();
}

uint64_t LiveCallerIDLookupManager.deinit()
{
  return v0;
}

uint64_t LiveCallerIDLookupManager.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

unint64_t sub_21DAE0638()
{
  unint64_t result = qword_267D1C6B8;
  if (!qword_267D1C6B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C6B8);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CallLookupExtensionStatus(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21DAE0758);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CallLookupExtensionStatus()
{
  return &type metadata for CallLookupExtensionStatus;
}

uint64_t method lookup function for LiveCallerIDLookupManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LiveCallerIDLookupManager);
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.status(forExtensionWithIdentifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 80))();
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.openSettings()()
{
  unsigned int v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 88) + **(int **)(*(void *)v0 + 88));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_21DAE08C0;
  return v4();
}

uint64_t sub_21DAE08C0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.reset(forExtensionWithIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 96) + **(int **)(*(void *)v2 + 96));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unsigned int v6 = v3;
  v6[1] = sub_21DAE0E2C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.refreshPIRParameters(forExtensionWithIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 104) + **(int **)(*(void *)v2 + 104));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unsigned int v6 = v3;
  v6[1] = sub_21DAE0E2C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.refreshExtensionContext(forExtensionWithIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 112) + **(int **)(*(void *)v2 + 112));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unsigned int v6 = v3;
  v6[1] = sub_21DAE0E2C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.installedExtensions()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.set(enabled:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 128) + **(int **)(*(void *)v2 + 128));
  unsigned int v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *unsigned int v6 = v3;
  v6[1] = sub_21DAE0E2C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of LiveCallerIDLookupManager.set(prioritizedExtensionIdentifiers:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

id BlockingInfo.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id BlockingInfo.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for BlockingInfo();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for BlockingInfo()
{
  return self;
}

id BlockingInfo.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BlockingInfo();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id IdentityInfo.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id IdentityInfo.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for IdentityInfo();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for IdentityInfo()
{
  return self;
}

id IdentityInfo.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityInfo();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id LiveLookupDBExtension.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id LiveLookupDBExtension.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for LiveLookupDBExtension();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for LiveLookupDBExtension()
{
  return self;
}

id LiveLookupDBExtension.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LiveLookupDBExtension();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t LiveCallerIDLookupExtensionContext.serviceURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21DAE7400();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t LiveCallerIDLookupExtensionContext.tokenIssuerURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for LiveCallerIDLookupExtensionContext() + 20);
  uint64_t v4 = sub_21DAE7400();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for LiveCallerIDLookupExtensionContext()
{
  uint64_t result = qword_267D1C738;
  if (!qword_267D1C738) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t LiveCallerIDLookupExtensionContext.userTierToken.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for LiveCallerIDLookupExtensionContext() + 24);
  uint64_t v2 = *(void *)v1;
  sub_21DAE13EC(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t sub_21DAE13EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t LiveCallerIDLookupExtensionContext.init(serviceURL:tokenIssuerURL:userTierToken:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_21DAE7400();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(a5, a1, v10);
  uint64_t v12 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(a5 + *(int *)(v12 + 20), a2, v10);
  uint64_t v14 = (void *)(a5 + *(int *)(v12 + 24));
  void *v14 = a3;
  v14[1] = a4;
  return result;
}

uint64_t LiveCallerIDLookupExtensionContext.hash(into:)()
{
  sub_21DAE7400();
  sub_21DAE2B58(&qword_267D1C6F0, MEMORY[0x263F06EA8]);
  sub_21DAE7570();
  uint64_t v1 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  sub_21DAE7570();
  uint64_t v2 = (uint64_t *)(v0 + *(int *)(v1 + 24));
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  sub_21DAE13EC(*v2, v4);
  sub_21DAE7430();

  return sub_21DAE15EC(v3, v4);
}

uint64_t sub_21DAE15EC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t static LiveCallerIDLookupExtensionContext.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((MEMORY[0x223C10410]() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  if ((MEMORY[0x223C10410](a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20)) & 1) == 0) {
    return 0;
  }
  uint64_t v5 = *(int *)(v4 + 24);
  uint64_t v6 = *(void *)(a1 + v5);
  unint64_t v7 = *(void *)(a1 + v5 + 8);
  uint64_t v8 = (uint64_t *)(a2 + v5);
  uint64_t v9 = *v8;
  unint64_t v10 = v8[1];

  return sub_21DAE27B4(v6, v7, v9, v10);
}

uint64_t sub_21DAE16D0(char a1)
{
  return *(void *)&aServiceutokeni[8 * a1];
}

uint64_t sub_21DAE16F0()
{
  return sub_21DAE16D0(*v0);
}

uint64_t sub_21DAE16F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21DAE3484(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21DAE1720()
{
  return 0;
}

void sub_21DAE172C(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_21DAE1738(uint64_t a1)
{
  unint64_t v2 = sub_21DAE2954();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21DAE1774(uint64_t a1)
{
  unint64_t v2 = sub_21DAE2954();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LiveCallerIDLookupExtensionContext.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C6F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21DAE2954();
  sub_21DAE78E0();
  LOBYTE(v11) = 0;
  sub_21DAE7400();
  sub_21DAE2B58(&qword_267D1C708, MEMORY[0x263F06EA8]);
  sub_21DAE7820();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for LiveCallerIDLookupExtensionContext();
    LOBYTE(v11) = 1;
    sub_21DAE7820();
    long long v11 = *(_OWORD *)(v3 + *(int *)(v9 + 24));
    char v12 = 2;
    sub_21DAE29A8();
    sub_21DAE7820();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t LiveCallerIDLookupExtensionContext.hashValue.getter()
{
  sub_21DAE7890();
  sub_21DAE7400();
  sub_21DAE2B58(&qword_267D1C6F0, MEMORY[0x263F06EA8]);
  sub_21DAE7570();
  uint64_t v1 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  sub_21DAE7570();
  uint64_t v2 = (uint64_t *)(v0 + *(int *)(v1 + 24));
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  sub_21DAE13EC(*v2, v4);
  sub_21DAE7430();
  sub_21DAE15EC(v3, v4);
  return sub_21DAE78C0();
}

uint64_t LiveCallerIDLookupExtensionContext.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v3 = sub_21DAE7400();
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v24 = (char *)&v20 - v7;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C718);
  uint64_t v23 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  MEMORY[0x270FA5388](v10);
  char v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21DAE2954();
  uint64_t v26 = v9;
  id v13 = v27;
  sub_21DAE78D0();
  if (v13) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v20 = v10;
  id v27 = v12;
  LOBYTE(v28) = 0;
  sub_21DAE2B58(&qword_267D1C720, MEMORY[0x263F06EA8]);
  uint64_t v14 = v24;
  sub_21DAE7810();
  uint64_t v24 = *(char **)(v22 + 32);
  ((void (*)(char *, char *, uint64_t))v24)(v27, v14, v3);
  LOBYTE(v28) = 1;
  uint64_t v15 = v6;
  sub_21DAE7810();
  uint64_t v16 = v20;
  uint64_t v17 = (uint64_t)v27;
  ((void (*)(char *, char *, uint64_t))v24)(&v27[*(int *)(v20 + 20)], v15, v3);
  char v29 = 2;
  sub_21DAE29FC();
  char v18 = v26;
  sub_21DAE7810();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v18, v25);
  *(_OWORD *)(v17 + *(int *)(v16 + 24)) = v28;
  sub_21DAE2A50(v17, v21);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_21DAE2AB4(v17);
}

uint64_t sub_21DAE1EE4(uint64_t a1)
{
  sub_21DAE7890();
  sub_21DAE7400();
  sub_21DAE2B58(&qword_267D1C6F0, MEMORY[0x263F06EA8]);
  sub_21DAE7570();
  sub_21DAE7570();
  uint64_t v3 = (uint64_t *)(v1 + *(int *)(a1 + 24));
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  sub_21DAE13EC(*v3, v5);
  sub_21DAE7430();
  sub_21DAE15EC(v4, v5);
  return sub_21DAE78C0();
}

uint64_t sub_21DAE1FD4(uint64_t a1, uint64_t a2)
{
  sub_21DAE7400();
  sub_21DAE2B58(&qword_267D1C6F0, MEMORY[0x263F06EA8]);
  sub_21DAE7570();
  sub_21DAE7570();
  uint64_t v4 = (uint64_t *)(v2 + *(int *)(a2 + 24));
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  sub_21DAE13EC(*v4, v6);
  sub_21DAE7430();

  return sub_21DAE15EC(v5, v6);
}

uint64_t sub_21DAE20B8(uint64_t a1, uint64_t a2)
{
  sub_21DAE7890();
  sub_21DAE7400();
  sub_21DAE2B58(&qword_267D1C6F0, MEMORY[0x263F06EA8]);
  sub_21DAE7570();
  sub_21DAE7570();
  uint64_t v4 = (uint64_t *)(v2 + *(int *)(a2 + 24));
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  sub_21DAE13EC(*v4, v6);
  sub_21DAE7430();
  sub_21DAE15EC(v5, v6);
  return sub_21DAE78C0();
}

uint64_t sub_21DAE21A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return LiveCallerIDLookupExtensionContext.init(from:)(a1, a2);
}

uint64_t sub_21DAE21BC(void *a1)
{
  return LiveCallerIDLookupExtensionContext.encode(to:)(a1);
}

uint64_t sub_21DAE21D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((MEMORY[0x223C10410]() & 1) == 0
    || (MEMORY[0x223C10410](a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20)) & 1) == 0)
  {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = *(void *)(a1 + v6);
  unint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (uint64_t *)(a2 + v6);
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];

  return sub_21DAE27B4(v7, v8, v10, v11);
}

uint64_t sub_21DAE2258@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_21DAE13EC(a2, a3);
      uint64_t v10 = (char *)sub_21DAE7330();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_21DAE7350();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_21DAE7340();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x21DAE24BCLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_21DAE15EC(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_21DAE7330();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_21DAE7350();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_21DAE7340();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_21DAE24CC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_21DAE13EC(a1, a2);
      char v5 = sub_21DAE26FC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_21DAE15EC(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_21DAE26FC(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_21DAE15EC(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_21DAE2258((uint64_t)__s1, a3, a4, &v14);
      sub_21DAE15EC(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_21DAE26FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_21DAE7330();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_21DAE7350();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_21DAE7340();
  sub_21DAE2258(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_21DAE27B4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x21DAE28F0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_21DAE13EC(a3, a4);
              char v15 = sub_21DAE24CC(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21DAE2954()
{
  unint64_t result = qword_267D1C700;
  if (!qword_267D1C700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C700);
  }
  return result;
}

unint64_t sub_21DAE29A8()
{
  unint64_t result = qword_267D1C710;
  if (!qword_267D1C710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C710);
  }
  return result;
}

unint64_t sub_21DAE29FC()
{
  unint64_t result = qword_267D1C728;
  if (!qword_267D1C728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C728);
  }
  return result;
}

uint64_t sub_21DAE2A50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DAE2AB4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21DAE2B10()
{
  return sub_21DAE2B58(&qword_267D1C730, (void (*)(uint64_t))type metadata accessor for LiveCallerIDLookupExtensionContext);
}

uint64_t sub_21DAE2B58(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for LiveCallerIDLookupExtensionContext(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_21DAE7400();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    BOOL v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = *v11;
    unint64_t v13 = v11[1];
    sub_21DAE13EC(*v11, v13);
    *uint64_t v10 = v12;
    v10[1] = v13;
  }
  return a1;
}

uint64_t destroy for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21DAE7400();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  uint64_t v7 = *v6;
  unint64_t v8 = v6[1];

  return sub_21DAE15EC(v7, v8);
}

uint64_t initializeWithCopy for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21DAE7400();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (uint64_t *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  sub_21DAE13EC(*v10, v12);
  *uint64_t v9 = v11;
  v9[1] = v12;
  return a1;
}

uint64_t assignWithCopy for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21DAE7400();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (uint64_t *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  sub_21DAE13EC(*v10, v12);
  uint64_t v13 = *v9;
  unint64_t v14 = v9[1];
  *uint64_t v9 = v11;
  v9[1] = v12;
  sub_21DAE15EC(v13, v14);
  return a1;
}

uint64_t initializeWithTake for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21DAE7400();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21DAE7400();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = *(void *)(a1 + v8);
  unint64_t v10 = *(void *)(a1 + v8 + 8);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  sub_21DAE15EC(v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21DAE302C);
}

uint64_t sub_21DAE302C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21DAE7400();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
    if (((4 * v10) & 0xC) != 0) {
      return 16 - ((4 * v10) & 0xC | (v10 >> 2));
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for LiveCallerIDLookupExtensionContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21DAE3114);
}

uint64_t sub_21DAE3114(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_21DAE7400();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    uint64_t v11 = (void *)(a1 + *(int *)(a4 + 24));
    *uint64_t v11 = 0;
    v11[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

uint64_t sub_21DAE31E0()
{
  uint64_t result = sub_21DAE7400();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for LiveCallerIDLookupExtensionContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21DAE3344);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveCallerIDLookupExtensionContext.CodingKeys()
{
  return &type metadata for LiveCallerIDLookupExtensionContext.CodingKeys;
}

unint64_t sub_21DAE3380()
{
  unint64_t result = qword_267D1C748;
  if (!qword_267D1C748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C748);
  }
  return result;
}

unint64_t sub_21DAE33D8()
{
  unint64_t result = qword_267D1C750;
  if (!qword_267D1C750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C750);
  }
  return result;
}

unint64_t sub_21DAE3430()
{
  unint64_t result = qword_267D1C758;
  if (!qword_267D1C758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D1C758);
  }
  return result;
}

uint64_t sub_21DAE3484(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x5565636976726573 && a2 == 0xEA00000000004C52;
  if (v3 || (sub_21DAE7840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7373496E656B6F74 && a2 == 0xEE004C5255726575 || (sub_21DAE7840() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7265695472657375 && a2 == 0xED00006E656B6F54)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_21DAE7840();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.getter()
{
  return sub_21DAE36C8((SEL *)&selRef_transactionalSubActions);
}

unint64_t sub_21DAE3610()
{
  unint64_t result = qword_267D1C658;
  if (!qword_267D1C658)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D1C658);
  }
  return result;
}

void ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter(uint64_t a1)
{
}

uint64_t (*ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.getter();
  return sub_21DAE36A4;
}

uint64_t sub_21DAE36A4(uint64_t *a1, char a2)
{
  return sub_21DAE39EC(a1, a2, (uint64_t (*)(uint64_t))ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter);
}

uint64_t ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.getter()
{
  return sub_21DAE36C8((SEL *)&selRef_promotionalSubActions);
}

uint64_t sub_21DAE36C8(SEL *a1)
{
  id v2 = [v1 *a1];
  sub_21DAE3610();
  unint64_t v3 = sub_21DAE75E0();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_21DAE77F0();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_21DADBD24(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v13;
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x223C107B0](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      uint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_integerValue);

      unint64_t v12 = *(void *)(v13 + 16);
      unint64_t v11 = *(void *)(v13 + 24);
      if (v12 >= v11 >> 1) {
        sub_21DADBD24(v11 > 1, v12 + 1, 1);
      }
      ++v6;
      *(void *)(v13 + 16) = v12 + 1;
      *(void *)(v13 + 8 * v12 + 32) = v10;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease();
    return v7;
  }
  __break(1u);
  return result;
}

void ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.setter(uint64_t a1)
{
}

void sub_21DAE3868(uint64_t a1, SEL *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    sub_21DAE77A0();
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v5 + 1;
      sub_21DAE7660();
      sub_21DAE7780();
      sub_21DAE77B0();
      sub_21DAE77C0();
      sub_21DAE7790();
      uint64_t v5 = v6;
    }
    while (v4 != v6);
  }
  swift_bridgeObjectRelease();
  sub_21DAE3610();
  id v7 = (id)sub_21DAE75D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, *a2, v7);
}

uint64_t (*ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  *a1 = ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.getter();
  return sub_21DAE39D4;
}

uint64_t sub_21DAE39D4(uint64_t *a1, char a2)
{
  return sub_21DAE39EC(a1, a2, (uint64_t (*)(uint64_t))ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.setter);
}

uint64_t sub_21DAE39EC(uint64_t *a1, char a2, uint64_t (*a3)(uint64_t))
{
  if ((a2 & 1) == 0) {
    return a3(*a1);
  }
  uint64_t v4 = swift_bridgeObjectRetain();
  a3(v4);

  return swift_bridgeObjectRelease();
}

uint64_t sub_21DAE3A5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21DAE3A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter);
}

uint64_t sub_21DAE3AA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21DAE3ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ILMessageFilterCapabilitiesQueryResponse.promotionalSubActions.setter);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = swift_bridgeObjectRetain();
  return a5(v6);
}

id sub_21DAE3BFC(void *a1)
{
  sub_21DAE3DA0();
  unint64_t v3 = v1;
  uint64_t v4 = sub_21DAE76E0();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = sub_21DAE7420();
    uint64_t v8 = v7;

    uint64_t v9 = (uint64_t *)&v3[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data];
    *uint64_t v9 = v6;
    v9[1] = v8;

    v12.receiver = v3;
    v12.super_class = (Class)type metadata accessor for XPCWrapper();
    id v10 = objc_msgSendSuper2(&v12, sel_init);
  }
  else
  {

    type metadata accessor for XPCWrapper();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v10;
}

id sub_21DAE3D34()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XPCWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for XPCWrapper()
{
  return self;
}

unint64_t sub_21DAE3DA0()
{
  unint64_t result = qword_267D1C778;
  if (!qword_267D1C778)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D1C778);
  }
  return result;
}

uint64_t LiveLookupStoreProtocol.fetchExtensions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(a2 + 64))(0, a1, a2);
}

uint64_t LiveLookupStoreProtocol.fetchBlockingInfo(for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C620);
  MEMORY[0x270FA5388](v10 - 8);
  objc_super v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAE7470();
  uint64_t v13 = sub_21DAE7480();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))(a5 + 96))(a1, a2, a3, v12, a4, a5);
  sub_21DAE3F1C((uint64_t)v12);
  return v14;
}

uint64_t sub_21DAE3F1C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C620);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t LiveLookupStoreProtocol.fetchIdentityInfo(for:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(a5 + 112))(a1, a2, a3, 0, a4, a5);
}

uint64_t LiveLookupStoreProtocol.fetchIdentityInfo(for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C620);
  MEMORY[0x270FA5388](v10 - 8);
  objc_super v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAE7470();
  uint64_t v13 = sub_21DAE7480();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))(a5 + 120))(a1, a2, a3, v12, a4, a5);
  sub_21DAE3F1C((uint64_t)v12);
  return v14;
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.init(storeLocation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.delete(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.save()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.fetch<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.activeExtensions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.installedExtensions()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.isAppStoreVendable(forExtensionWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.fetchExtensions(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.resetExtension(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.updateExtensions(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.fetchBlockingInfo(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.fetchBlockingInfo(for:with:expiration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 96))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.updateBlockingInfo(for:with:shouldBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 104))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.fetchIdentityInfo(for:from:canBeEmpty:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 112))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.fetchIdentityInfo(for:with:expiration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 120))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.updateIdentityInfo(for:with:name:iconURL:type:ttlMinutes:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(void))(a10 + 128))();
}

uint64_t dispatch thunk of LiveLookupStoreProtocol.removeStaleRecords()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

unint64_t extensionPointName.getter()
{
  return 0xD000000000000015;
}

id LiveCallerIDLookupProtocol.configuration.getter@<X0>(void *a1@<X8>)
{
  type metadata accessor for _LiveLookupConfiguration();
  id result = sub_21DAE5B60(v1);
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for _LiveLookupConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

void sub_21DAE428C(void (*a1)(id))
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v4 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(*(void *)(v3 + 88) + 16))(*(void *)(v3 + 80));
  uint64_t v7 = (objc_class *)type metadata accessor for XPCWrapper();
  id v8 = objc_allocWithZone(v7);
  sub_21DAE7320();
  swift_allocObject();
  uint64_t v9 = (char *)v8;
  sub_21DAE7310();
  sub_21DAE5DAC(&qword_267D1C888, (void (*)(uint64_t))type metadata accessor for LiveCallerIDLookupExtensionContext);
  uint64_t v10 = sub_21DAE7300();
  uint64_t v12 = v11;
  swift_release();
  uint64_t v13 = (uint64_t *)&v9[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data];
  *uint64_t v13 = v10;
  v13[1] = v12;

  v16.receiver = v9;
  v16.super_class = v7;
  id v14 = objc_msgSendSuper2(&v16, sel_init);
  sub_21DAE2AB4((uint64_t)v6);
  a1(v14);
}

uint64_t sub_21DAE44B4(void *a1, int a2, void *aBlock)
{
  uint64_t v4 = _Block_copy(aBlock);
  *(void *)(swift_allocObject() + 16) = v4;
  id v5 = a1;
  sub_21DAE428C((void (*)(id))sub_21DAE5D98);

  return swift_release();
}

uint64_t sub_21DAE4540(void *a1)
{
  objc_msgSend(a1, sel_setExportedObject_, v1);
  id v3 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26CE70F70);
  objc_msgSend(a1, sel_setExportedInterface_, v3);

  objc_msgSend(a1, sel_resume);
  return 1;
}

void sub_21DAE45CC()
{
}

id sub_21DAE4610()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _LiveLookupConfiguration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21DAE4684(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x60)]);
}

uint64_t sub_21DAE46EC(void *a1)
{
  return 1;
}

uint64_t static Host.context()(uint64_t a1)
{
  v1[23] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB88);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  uint64_t v2 = sub_21DAE7520();
  v1[26] = v2;
  v1[27] = *(void *)(v2 - 8);
  v1[28] = swift_task_alloc();
  uint64_t v3 = sub_21DAE74F0();
  v1[29] = v3;
  v1[30] = *(void *)(v3 - 8);
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  uint64_t v4 = sub_21DAE74A0();
  v1[33] = v4;
  v1[34] = *(void *)(v4 - 8);
  v1[35] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C7E8);
  v1[36] = swift_task_alloc();
  uint64_t v5 = sub_21DAE7530();
  v1[37] = v5;
  v1[38] = *(void *)(v5 - 8);
  v1[39] = swift_task_alloc();
  v1[40] = swift_task_alloc();
  uint64_t v6 = sub_21DAE74B0();
  v1[41] = v6;
  v1[42] = *(void *)(v6 - 8);
  v1[43] = swift_task_alloc();
  v1[44] = swift_task_alloc();
  uint64_t v7 = sub_21DAE74D0();
  v1[45] = v7;
  v1[46] = *(void *)(v7 - 8);
  v1[47] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21DAE4A40, 0, 0);
}

uint64_t sub_21DAE4A40()
{
  uint64_t v2 = v0[43];
  uint64_t v1 = v0[44];
  uint64_t v3 = v0[41];
  uint64_t v4 = v0[42];
  sub_21DAE7490();
  sub_21DAE74C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_21DAE5DAC(&qword_267D1C7F0, MEMORY[0x263F04D48]);
  sub_21DAE7650();
  uint64_t v5 = sub_21DAE5DAC(&qword_267D1C7F8, MEMORY[0x263F04D38]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[48] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_21DAE4BD8;
  uint64_t v7 = v0[33];
  return MEMORY[0x270FA1E80](v0 + 21, v7, v5);
}

uint64_t sub_21DAE4BD8()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[34] + 8))(v2[35], v2[33]);
    uint64_t v3 = sub_21DAE4FA0;
  }
  else
  {
    uint64_t v3 = sub_21DAE4D04;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21DAE4D04()
{
  uint64_t v1 = v0[21];
  if (!v1)
  {
    uint64_t v3 = v0[37];
    uint64_t v4 = v0[38];
    uint64_t v5 = v0[36];
    (*(void (**)(void, void))(v0[34] + 8))(v0[35], v0[33]);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, 1, 1, v3);
LABEL_7:
    sub_21DAE5B9C(v0[36]);
    return sub_21DAE77E0();
  }
  (*(void (**)(void, void))(v0[34] + 8))(v0[35], v0[33]);
  if (*(void *)(v1 + 16))
  {
    (*(void (**)(void, unint64_t, void))(v0[38] + 16))(v0[36], v1 + ((*(unsigned __int8 *)(v0[38] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[38] + 80)), v0[37]);
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = 1;
  }
  uint64_t v6 = v0[37];
  uint64_t v7 = v0[38];
  uint64_t v8 = v0[36];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v8, v2, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1) {
    goto LABEL_7;
  }
  uint64_t v10 = v0[39];
  uint64_t v11 = v0[40];
  uint64_t v12 = v0[37];
  uint64_t v13 = v0[38];
  uint64_t v15 = v0[31];
  uint64_t v14 = v0[32];
  uint64_t v16 = v0[29];
  uint64_t v17 = v0[30];
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 32))(v11, v0[36], v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v10, v11, v12);
  sub_21DAE74E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v14, v16);
  uint64_t v18 = (void *)swift_task_alloc();
  v0[50] = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_21DAE4FBC;
  uint64_t v19 = v0[31];
  uint64_t v20 = v0[28];
  return MEMORY[0x270EEB850](v20, v19);
}

uint64_t sub_21DAE4FA0()
{
  return swift_unexpectedError();
}

uint64_t sub_21DAE4FBC()
{
  *(void *)(*(void *)v1 + 408) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_21DAE564C;
  }
  else {
    uint64_t v2 = sub_21DAE50D0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_21DAE50D0()
{
  uint64_t v1 = v0[51];
  uint64_t v2 = sub_21DAE7510();
  if (v1)
  {
    return swift_unexpectedError();
  }
  uint64_t v4 = (void *)v2;
  uint64_t v5 = v0[25];
  id v6 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26CE70F70);
  objc_msgSend(v4, sel_setRemoteObjectInterface_, v6);

  objc_msgSend(v4, sel_resume);
  v0[6] = nullsub_1;
  v0[7] = 0;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_21DAE5668;
  v0[5] = &block_descriptor_1;
  uint64_t v7 = _Block_copy(v0 + 2);
  id v8 = objc_msgSend(v4, sel_synchronousRemoteObjectProxyWithErrorHandler_, v7);
  _Block_release(v7);
  sub_21DAE7720();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(qword_267D1C800);
  swift_dynamicCast();
  uint64_t v9 = (void *)v0[22];
  sub_21DAE73D0();
  uint64_t v10 = sub_21DAE7400();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  uint64_t result = v12(v5, 1, v10);
  if (result == 1)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v39 = v9;
  id v40 = v4;
  uint64_t v13 = v0[24];
  sub_21DAE73D0();
  uint64_t result = v12(v13, 1, v10);
  if (result == 1)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v38 = v0[47];
  uint64_t v36 = v0[46];
  uint64_t v37 = v0[45];
  uint64_t v33 = v0[41];
  uint64_t v34 = v0[44];
  uint64_t v31 = v0[40];
  uint64_t v32 = v0[42];
  uint64_t v29 = v0[38];
  uint64_t v30 = v0[37];
  uint64_t v28 = v0[32];
  uint64_t v26 = v0[30];
  uint64_t v27 = v0[29];
  uint64_t v14 = v0[27];
  uint64_t v15 = v0[25];
  uint64_t v24 = v0[26];
  uint64_t v25 = v0[28];
  uint64_t v16 = v0[24];
  uint64_t v35 = v0[23];
  uint64_t v17 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  uint64_t v18 = swift_allocBox();
  uint64_t v20 = v19;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
  v21(v19, v15, v10);
  v21(v20 + *(int *)(v17 + 20), v16, v10);
  *(_OWORD *)(v20 + *(int *)(v17 + 24)) = xmmword_21DAE9700;
  v0[12] = sub_21DAE5BFC;
  v0[13] = v18;
  v0[8] = MEMORY[0x263EF8330];
  v0[9] = 1107296256;
  v0[10] = sub_21DAE5A24;
  v0[11] = &block_descriptor_4_0;
  size_t v22 = _Block_copy(v0 + 8);
  swift_retain();
  swift_release();
  objc_msgSend(v39, sel_contextWithReply_, v22);
  _Block_release(v22);

  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v25, v24);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v27);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v31, v30);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v38, v37);
  swift_beginAccess();
  sub_21DAE2A50(v20, v35);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_21DAE564C()
{
  return swift_unexpectedError();
}

void sub_21DAE5668(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_21DAE56D0(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB0EB88);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  MEMORY[0x270FA5388](v3);
  v14[3] = (char *)v14 - v4;
  uint64_t v5 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  MEMORY[0x270FA5388](v6);
  id v8 = (char *)v14 - v7;
  uint64_t result = swift_projectBox();
  if (a1)
  {
    uint64_t v10 = result;
    sub_21DAE72F0();
    swift_allocObject();
    uint64_t v11 = a1;
    sub_21DAE72E0();
    uint64_t v13 = *(void *)&v11[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data];
    unint64_t v12 = *(void *)&v11[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data + 8];
    sub_21DAE13EC(v13, v12);
    sub_21DAE5DAC((unint64_t *)&unk_267D1C890, (void (*)(uint64_t))type metadata accessor for LiveCallerIDLookupExtensionContext);
    sub_21DAE72D0();
    sub_21DAE15EC(v13, v12);

    swift_release();
    swift_beginAccess();
    return sub_21DAE5DF4((uint64_t)v8, v10);
  }
  return result;
}

void sub_21DAE5A24(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_21DAE5A90(uint64_t a1)
{
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1)
                                                                          + 0x50)
                                                              - 8)
                                                  + 16))(&v1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x60)], a1, *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50));
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for _LiveLookupConfiguration();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_21DAE5B60(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for _LiveLookupConfiguration());
  return sub_21DAE5A90(a1);
}

uint64_t sub_21DAE5B9C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C7E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21DAE5BFC(void *a1)
{
  return sub_21DAE56D0(a1);
}

uint64_t sub_21DAE5C08()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Host()
{
  return &type metadata for Host;
}

uint64_t sub_21DAE5CAC()
{
  type metadata accessor for _LiveLookupConfiguration();

  return swift_getWitnessTable();
}

uint64_t sub_21DAE5CF4(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_21DAE5D30()
{
}

uint64_t sub_21DAE5D60()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21DAE5D98()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_21DAE5DAC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21DAE5DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LiveCallerIDLookupExtensionContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

id static BlockingInfo.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  unint64_t v1 = (void *)sub_21DAE7580();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_21DAE5F00()
{
  return MEMORY[0x263F8D1F8];
}

uint64_t sub_21DAE5F0C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_expiration);
  if (v3)
  {
    uint64_t v4 = v3;
    sub_21DAE7460();

    uint64_t v5 = sub_21DAE7480();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
    uint64_t v7 = v5;
    uint64_t v8 = a2;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = sub_21DAE7480();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
    uint64_t v7 = v10;
    uint64_t v8 = a2;
    uint64_t v9 = 1;
  }

  return v6(v8, v9, 1, v7);
}

void sub_21DAE5FD4(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C620);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAE62F4(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  uint64_t v8 = sub_21DAE7480();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    uint64_t v10 = (void *)sub_21DAE7450();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setExpiration_, v10);
}

void sub_21DAE6100(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_handle);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_21DAE7590();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_21DAE6168(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_21DAE7580();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setHandle_);
}

uint64_t sub_21DAE61D8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for BlockingInfo();
  uint64_t result = sub_21DAE7740();
  *a1 = result;
  return result;
}

char *keypath_get_selector_expiration()
{
  return sel_expiration;
}

char *keypath_get_selector_handle()
{
  return sel_handle;
}

char *keypath_get_selector_shouldBlock()
{
  return sel_shouldBlock;
}

id sub_21DAE6250@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_shouldBlock);
  *a2 = (_BYTE)result;
  return result;
}

id sub_21DAE6284(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldBlock_, *a1);
}

char *keypath_get_selector_dbExtension()
{
  return sel_dbExtension;
}

id sub_21DAE62A4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_dbExtension);
  *a2 = result;
  return result;
}

id sub_21DAE62E0(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDbExtension_, *a1);
}

uint64_t sub_21DAE62F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id static IdentityInfo.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  unint64_t v1 = (void *)sub_21DAE7580();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_21DAE63CC(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D1C620);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAE62F4(a1, (uint64_t)v6);
  uint64_t v7 = *a2;
  uint64_t v8 = sub_21DAE7480();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    uint64_t v10 = (void *)sub_21DAE7450();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setExpiration_, v10);
}

void sub_21DAE64F8(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_21DAE7590();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_21DAE655C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v7 = sub_21DAE7580();
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (id)v7;
  [v6 *a5];
}

uint64_t sub_21DAE65CC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for IdentityInfo();
  uint64_t result = sub_21DAE7740();
  *a1 = result;
  return result;
}

void sub_21DAE6618(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21DAE6638(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_iconURL()
{
  return sel_iconURL;
}

void sub_21DAE6664(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21DAE6684(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_name()
{
  return sel_name;
}

void sub_21DAE66B0(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_21DAE66D0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_type()
{
  return sel_type;
}

id sub_21DAE66FC@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_type);
  *a2 = result;
  return result;
}

id sub_21DAE6730(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

id sub_21DAE6744@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_dbExtension);
  *a2 = result;
  return result;
}

id sub_21DAE6780(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDbExtension_, *a1);
}

id static LiveLookupDBExtension.fetchRequest()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFF260]);
  unint64_t v1 = (void *)sub_21DAE7580();
  id v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_21DAE6800(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_identifier);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_21DAE7590();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_21DAE6868(uint64_t a1, void **a2)
{
  id v2 = *a2;
  if (*(void *)(a1 + 8)) {
    uint64_t v3 = sub_21DAE7580();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  objc_msgSend(v2, sel_setIdentifier_);
}

uint64_t sub_21DAE68D8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for LiveLookupDBExtension();
  uint64_t result = sub_21DAE7740();
  *a1 = result;
  return result;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

char *keypath_get_selector_isAppStoreVendable()
{
  return sel_isAppStoreVendable;
}

id sub_21DAE693C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isAppStoreVendable);
  *a2 = (_BYTE)result;
  return result;
}

id sub_21DAE6970(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsAppStoreVendable_, *a1);
}

char *keypath_get_selector_isEnabled()
{
  return sel_isEnabled;
}

id sub_21DAE6990@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_21DAE69C4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsEnabled_, *a1);
}

char *keypath_get_selector_isInstalled()
{
  return sel_isInstalled;
}

id sub_21DAE69E4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isInstalled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_21DAE6A18(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsInstalled_, *a1);
}

char *keypath_get_selector_priority()
{
  return sel_priority;
}

id sub_21DAE6A38@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_priority);
  *a2 = (_WORD)result;
  return result;
}

id sub_21DAE6A6C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPriority_, *a1);
}

char *keypath_get_selector_shouldRemove()
{
  return sel_shouldRemove;
}

id sub_21DAE6A8C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_shouldRemove);
  *a2 = (_BYTE)result;
  return result;
}

id sub_21DAE6AC0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldRemove_, *a1);
}

char *keypath_get_selector_blockingInfo()
{
  return sel_blockingInfo;
}

id sub_21DAE6AE0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_blockingInfo);
  *a2 = result;
  return result;
}

id sub_21DAE6B1C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setBlockingInfo_, *a1);
}

char *keypath_get_selector_identityInfo()
{
  return sel_identityInfo;
}

id sub_21DAE6B3C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_identityInfo);
  *a2 = result;
  return result;
}

id sub_21DAE6B78(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIdentityInfo_, *a1);
}

uint64_t sub_21DAE72D0()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_21DAE72E0()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_21DAE72F0()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_21DAE7300()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_21DAE7310()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_21DAE7320()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_21DAE7330()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_21DAE7340()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_21DAE7350()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_21DAE7360()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21DAE7370()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_21DAE7380()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_21DAE7390()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_21DAE73A0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21DAE73B0()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_21DAE73C0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21DAE73D0()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_21DAE73E0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_21DAE73F0()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_21DAE7400()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21DAE7410()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21DAE7420()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21DAE7430()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_21DAE7440()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_21DAE7450()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_21DAE7460()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_21DAE7470()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_21DAE7480()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21DAE7490()
{
  return MEMORY[0x270EEB7E8]();
}

uint64_t sub_21DAE74A0()
{
  return MEMORY[0x270EEB7F8]();
}

uint64_t sub_21DAE74B0()
{
  return MEMORY[0x270EEB808]();
}

uint64_t sub_21DAE74C0()
{
  return MEMORY[0x270EEB810]();
}

uint64_t sub_21DAE74D0()
{
  return MEMORY[0x270EEB818]();
}

uint64_t sub_21DAE74E0()
{
  return MEMORY[0x270EEB830]();
}

uint64_t sub_21DAE74F0()
{
  return MEMORY[0x270EEB848]();
}

uint64_t sub_21DAE7510()
{
  return MEMORY[0x270EEB858]();
}

uint64_t sub_21DAE7520()
{
  return MEMORY[0x270EEB870]();
}

uint64_t sub_21DAE7530()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_21DAE7540()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21DAE7550()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21DAE7560()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21DAE7570()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_21DAE7580()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21DAE7590()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21DAE75A0()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_21DAE75B0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21DAE75C0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21DAE75D0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21DAE75E0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21DAE75F0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21DAE7600()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21DAE7610()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21DAE7620()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_21DAE7630()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21DAE7650()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_21DAE7660()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_21DAE7670()
{
  return MEMORY[0x270EF1DB8]();
}

uint64_t sub_21DAE7680()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21DAE7690()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21DAE76A0()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_21DAE76B0()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_21DAE76C0()
{
  return MEMORY[0x270EE4218]();
}

uint64_t sub_21DAE76D0()
{
  return MEMORY[0x270EE4238]();
}

uint64_t sub_21DAE76E0()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_21DAE76F0()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_21DAE7700()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21DAE7710()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21DAE7720()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21DAE7730()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21DAE7740()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_21DAE7750()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21DAE7760()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21DAE7770()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21DAE7780()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21DAE7790()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21DAE77A0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_21DAE77B0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21DAE77C0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21DAE77D0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21DAE77E0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21DAE77F0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21DAE7800()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21DAE7810()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_21DAE7820()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_21DAE7830()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21DAE7840()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21DAE7850()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_21DAE7860()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_21DAE7870()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_21DAE7880()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_21DAE7890()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21DAE78A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21DAE78B0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_21DAE78C0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21DAE78D0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_21DAE78E0()
{
  return MEMORY[0x270F9FD98]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}