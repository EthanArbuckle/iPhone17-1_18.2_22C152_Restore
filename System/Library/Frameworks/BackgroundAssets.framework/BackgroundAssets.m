void sub_226E176B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, void);
  v10 = va_arg(va1, void);
  v11 = va_arg(va1, void);
  v12 = va_arg(va1, void);
  v13 = va_arg(va1, void);
  v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_226E1781C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  result = _Block_copy(*(const void **)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__108(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__109(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  return *(void *)a1;
}

void sub_226E185F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226E18A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_226E18D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_226E19538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_226E19814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_226E19BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id BASystemLogObject()
{
  if (BASystemLogObject_onceToken != -1) {
    dispatch_once(&BASystemLogObject_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)BASystemLogObject_obj;

  return v0;
}

uint64_t __BASystemLogObject_block_invoke()
{
  BASystemLogObject_obj = (uint64_t)os_log_create("com.apple.backgroundassets", "system");

  return MEMORY[0x270F9A758]();
}

id BAClientLogObject()
{
  if (BAClientLogObject_onceToken != -1) {
    dispatch_once(&BAClientLogObject_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)BAClientLogObject_obj;

  return v0;
}

uint64_t __BAClientLogObject_block_invoke()
{
  BAClientLogObject_obj = (uint64_t)os_log_create("com.apple.backgroundassets", "client");

  return MEMORY[0x270F9A758]();
}

id BAClientConnectionLogObject()
{
  if (BAClientConnectionLogObject_onceToken != -1) {
    dispatch_once(&BAClientConnectionLogObject_onceToken, &__block_literal_global_7);
  }
  uint64_t v0 = (void *)BAClientConnectionLogObject_obj;

  return v0;
}

uint64_t __BAClientConnectionLogObject_block_invoke()
{
  BAClientConnectionLogObject_obj = (uint64_t)os_log_create("com.apple.backgroundassets", "client_connection");

  return MEMORY[0x270F9A758]();
}

__CFString *BADownloadNecessityToString(uint64_t a1)
{
  v1 = @"<Unknown>";
  if (a1 == 1) {
    v1 = @"Essential";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Optional";
  }
}

__CFString *BAContentRequestToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"<Unknown>";
  }
  else {
    return off_2647E8E28[a1 - 1];
  }
}

id NSErrorWithBAErrorCode(uint64_t a1)
{
  return NSErrorWithBAErrorDomainCodeUnderlying(@"BAErrorDomain", a1, 0);
}

id NSErrorWithBAErrorDomainCodeUnderlying(void *a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  if (a3)
  {
    uint64_t v10 = *MEMORY[0x263F08608];
    v11[0] = a3;
    v6 = NSDictionary;
    id v7 = a3;
    a3 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  v8 = NSErrorWithBAErrorDomainCodeUserInfo(v5, a2, a3);

  return v8;
}

void NSErrorWithBAErrorDomainCodeUserInfo(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a2);
  if ([v5 isEqualToString:@"BAErrorDomain"])
  {
    uint64_t v9 = @"BAError";
LABEL_5:
    uint64_t v10 = [v7 localizedStringForKey:v8 value:0 table:v9];
    if (v6)
    {
      v11 = (void *)[v6 mutableCopy];
    }
    else
    {
      v11 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v12 = v11;
    [v11 setObject:v10 forKey:*MEMORY[0x263F08338]];
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    v14 = (void *)[v12 copy];
    v15 = [v13 errorWithDomain:v5 code:a2 userInfo:v14];

    id v16 = v15;
    return;
  }
  if ([v5 isEqualToString:@"BAURLDownloadErrorDomain"])
  {
    uint64_t v9 = @"BAURLDownloadError";
    goto LABEL_5;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    NSErrorWithBAErrorDomainCodeUserInfo_cold_1();
  }
  qword_26815EF58 = (uint64_t)"BUG IN BackgroundAssets: NSErrorWithBAErrorDomainCodeUserInfo() called with unsupported NSErrorDomain.";
  qword_26815EF88 = 6;
  __break(1u);
}

__CFString *BAAppStoreProgressObserverStateString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"Unrecognized App";
  }
  else {
    return off_2647E8E80[a1 - 1];
  }
}

void sub_226E1EFA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226E1F26C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_226E1FCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226E202FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_226E2060C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_226E20920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_226E20DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_226E23EE8()
{
  return MEMORY[0x263F8EE88];
}

uint64_t BADownloaderExtension.downloads(for:manifestURL:extensionInfo:)()
{
  return MEMORY[0x263F8EE88];
}

uint64_t sub_226E23F00()
{
  return sub_226E25A38(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8), v0, 1, 0);
}

uint64_t BADownloaderExtension.backgroundDownload(_:didReceive:)()
{
  return sub_226E25A38(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8), v0, 1, 0);
}

id BADownloaderExtension.configuration.getter@<X0>(void *a1@<X8>)
{
  id result = sub_226E24F78(v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_226E23FBC(uint64_t a1, id a2)
{
  return objc_msgSend(a2, sel_shouldAcceptXPCConnection_, a1);
}

id sub_226E23FE8(uint64_t a1)
{
  return sub_226E23FBC(a1, *v1);
}

uint64_t sub_226E23FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)((*MEMORY[0x263F8EED0] & *v3) + 0x58)
                                                                      + 16))(a1, a2, a3, *(void *)((*MEMORY[0x263F8EED0] & *v3) + 0x50));
}

id sub_226E2407C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = sub_226E27B30();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226E27B20();
  id v12 = a5;
  id v13 = a1;
  sub_226E23FF8(a3, (uint64_t)v11, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_226E259A0();
  sub_226E259E0();
  v14 = (void *)sub_226E27B70();
  swift_bridgeObjectRelease();

  return v14;
}

uint64_t sub_226E241CC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26815EEA8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_226E27B60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v4;
  v12[5] = a1;
  v12[6] = a2;
  v12[7] = a3;
  v12[8] = a4;
  id v13 = v4;
  id v14 = a1;
  id v15 = a2;
  swift_retain();
  sub_226E245D0((uint64_t)v10, (uint64_t)aHg, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_226E242FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[2] = a7;
  v8[3] = a8;
  uint64_t v11 = *(void *)((*MEMORY[0x263F8EED0] & *a4) + 0x58);
  uint64_t v12 = *(void *)((*MEMORY[0x263F8EED0] & *a4) + 0x50);
  id v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 + 24) + **(int **)(v11 + 24));
  id v13 = (void *)swift_task_alloc();
  v8[4] = v13;
  *id v13 = v8;
  v13[1] = sub_226E24460;
  return v15(a5, a6, v12, v11);
}

uint64_t sub_226E24460(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 40) = a1;
  *(void *)(v3 + 48) = a2;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_226E24560, 0, 0);
}

uint64_t sub_226E24560()
{
  uint64_t v1 = *(void **)(v0 + 48);
  (*(void (**)(void, void *))(v0 + 16))(*(void *)(v0 + 40), v1);

  v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_226E245D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_226E27B60();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_226E27B50();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_226E257D0(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_226E27B40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_226E24774(void *a1, int a2, void *a3, void *a4, void *aBlock)
{
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  id v12 = a1;
  sub_226E241CC(v10, v11, (uint64_t)sub_226E25988, v9);

  return swift_release();
}

uint64_t sub_226E24830(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x58) + 32))(a1, a2, *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x50));
}

void sub_226E248B4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v8 = a4;
  id v7 = a1;
  sub_226E24830((uint64_t)v6, (uint64_t)v8);
}

uint64_t sub_226E24928(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x58) + 40))(a1, a2, *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x50));
}

uint64_t sub_226E249AC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = sub_226E27B30();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_226E27B20();
  id v9 = a3;
  id v10 = a1;
  sub_226E24928((uint64_t)v9, (uint64_t)v8);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_226E24AA8()
{
  return (*(uint64_t (**)(void))(*(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x58) + 48))(*(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x50));
}

void sub_226E24B30(void *a1)
{
  id v1 = a1;
  sub_226E24AA8();
}

void sub_226E24B78()
{
}

id sub_226E24BBC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _BackgroundDownloadHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_226E24C30(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x60)]);
}

uint64_t sub_226E24C98(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_226E24D74;
  return v6(a1);
}

uint64_t sub_226E24D74()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_226E24E6C(uint64_t a1)
{
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1)
                                                                          + 0x50)
                                                              - 8)
                                                  + 16))(&v1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x60)], a1, *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50));
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for _BackgroundDownloadHandler();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_226E24F3C(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for _BackgroundDownloadHandler());
  return sub_226E24E6C(a1);
}

id sub_226E24F78(uint64_t a1)
{
  type metadata accessor for _BackgroundDownloadHandler();
  id v6 = sub_226E24F3C(a1);
  id v2 = objc_allocWithZone((Class)BADownloaderExtensionConnection);
  id v3 = v6;
  id v4 = objc_msgSend(v2, sel_initWithPrincipalObject_, sub_226E27B80());

  swift_unknownObjectRelease();
  return v4;
}

uint64_t dispatch thunk of BADownloaderExtension.downloads(for:manifestURL:extensionInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of BADownloaderExtension.backgroundDownload(_:didReceive:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  id v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  void *v9 = v4;
  v9[1] = sub_226E25138;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_226E25138(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t dispatch thunk of BADownloaderExtension.backgroundDownload(_:failedWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of BADownloaderExtension.backgroundDownload(_:finishedWithFileURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of BADownloaderExtension.extensionWillTerminate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_226E2527C()
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

uint64_t type metadata accessor for _BackgroundDownloadHandler()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_226E25328()
{
  type metadata accessor for _BackgroundDownloaderExtensionConfiguration();

  return swift_getWitnessTable();
}

uint64_t type metadata accessor for _BackgroundDownloaderExtensionConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_226E25388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

void *sub_226E25390(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void sub_226E253C4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 8);
}

uint64_t sub_226E25400(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a2 + 8);
  uint64_t v8 = *(void **)(a1 + 8);
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

uint64_t sub_226E25464(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t sub_226E254A4(uint64_t *a1, int a2)
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

uint64_t sub_226E254EC(uint64_t result, int a2, int a3)
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

uint64_t sub_226E25528(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
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

uint64_t sub_226E255A8()
{
  swift_unknownObjectRelease();

  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_226E25600(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  id v6 = (void *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  id v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_226E256DC;
  return sub_226E242FC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_226E256DC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_226E257D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26815EEA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_226E25830()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_226E25868(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_226E256DC;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26815EEC0 + dword_26815EEC0);
  return v6(a1, v4);
}

void sub_226E25920()
{
}

uint64_t sub_226E25950()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_226E25988()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_226E259A0()
{
  unint64_t result = qword_26815EED0;
  if (!qword_26815EED0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26815EED0);
  }
  return result;
}

unint64_t sub_226E259E0()
{
  unint64_t result = qword_26815EED8;
  if (!qword_26815EED8)
  {
    sub_226E259A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26815EED8);
  }
  return result;
}

uint64_t sub_226E25A38(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for AuthChallengeDisposition()
{
  if (!qword_26815EEE0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26815EEE0);
    }
  }
}

id BAAppExtensionInfo.restrictedEssentialDownloadSizeRemaining.getter()
{
  return sub_226E25AF0((SEL *)&selRef_restrictedEssentialDownloadSizeRemaining);
}

id BAAppExtensionInfo.restrictedDownloadSizeRemaining.getter()
{
  return sub_226E25AF0((SEL *)&selRef_restrictedDownloadSizeRemaining);
}

id sub_226E25AF0(SEL *a1)
{
  id v2 = [v1 *a1];
  uint64_t v3 = v2;
  if (!v2) {
    return 0;
  }
  id v4 = objc_msgSend(v2, sel_integerValue);

  return v4;
}

void NSErrorWithBAErrorDomainCodeUserInfo_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "NSErrorWithBAErrorDomainCodeUserInfo() called with unsupported NSErrorDomain.";
  _os_log_fault_impl(&dword_226E14000, &_os_log_internal, OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

uint64_t sub_226E27B20()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_226E27B30()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_226E27B40()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_226E27B50()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_226E27B60()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_226E27B70()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_226E27B80()
{
  return MEMORY[0x270F9F7C0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t ba_is_current_process_extension()
{
  return MEMORY[0x270F915F8]();
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x270ED8F00](a1, a2, *(void *)&a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void free(void *a1)
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x270EDB2C8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}