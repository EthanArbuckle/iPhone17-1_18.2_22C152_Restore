void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x26u);
}

void sub_2156E3B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id a52)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a52);
  objc_destroyWeak((id *)(v52 - 256));
  _Block_object_dispose((const void *)(v52 - 248), 8);
  _Block_object_dispose((const void *)(v52 - 192), 8);
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

void sub_2156E44F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_t0w16_s16(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  id result = *(id *)(a2 + 16);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t __move_assignment_8_8_t0w16_s16(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v2 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  *(void *)(a1 + 16) = v2;
  return MEMORY[0x270F9A758]();
}

void sub_2156E4794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2156E4D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id appProtectionEffectiveContainerFor(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 applicationExtensionRecord];
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F01858]);
    v4 = [v1 bundleIdentifier];
    uint64_t v2 = (void *)[v3 initWithBundleIdentifier:v4 error:0];
  }
  v5 = [v2 appProtectionEffectiveContainer];
  v6 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v2 containingBundleRecord];
  }
  uint64_t v9 = v8;

  return v9;
}

id getAPBaseExtensionShieldViewClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getAPBaseExtensionShieldViewClass_softClass;
  uint64_t v7 = getAPBaseExtensionShieldViewClass_softClass;
  if (!getAPBaseExtensionShieldViewClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAPBaseExtensionShieldViewClass_block_invoke;
    v3[3] = &unk_2642586D8;
    v3[4] = &v4;
    __getAPBaseExtensionShieldViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2156E5CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id iconImageFor(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F4B540];
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v4 = [v2 bundleIdentifier];

  v5 = (void *)[v3 initWithBundleIdentifier:v4];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 64.0, 64.0, 2.0);
  [v6 setDrawBorder:1];
  uint64_t v7 = [v5 prepareImageForDescriptor:v6];
  id v8 = (void *)MEMORY[0x263F827E8];
  uint64_t v9 = [v7 CGImage];
  [v7 scale];
  uint64_t v10 = objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v9, 0);

  return v10;
}

Class __getAPBaseExtensionShieldViewClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AppProtectionUILibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AppProtectionUILibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2642586F8;
    uint64_t v6 = 0;
    AppProtectionUILibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!AppProtectionUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("APBaseExtensionShieldView");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getAPBaseExtensionShieldViewClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAPBaseExtensionShieldViewClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AppProtectionUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppProtectionUILibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x30u);
}

void sub_2156E8958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void _EXExtensionPingLaunchdAfterEvent()
{
  v0 = _EXDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    _EXExtensionPingLaunchdAfterEvent_cold_1();
  }

  [MEMORY[0x263F04DB0] checkInWithLaunchd];
  if (sPingLaunchdObserver)
  {
    CFRelease((CFTypeRef)sPingLaunchdObserver);
    sPingLaunchdObserver = 0;
  }
}

void sub_2156E9374(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void sub_2156EA280(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2156EAE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_2156EC51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x1Cu);
}

uint64_t initializeBufferWithCopyOfBuffer for _AnyViewConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2156EC9E8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2156ECA08(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2156ECA68(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2156ECA88(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_2156ECAD8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2156ECB20(uint64_t a1, uint64_t a2)
{
  return sub_2156ECC18(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2156ECB38()
{
  sub_21570E098();
  sub_21570E0C8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2156ECB8C()
{
  sub_21570E098();
  sub_21570E358();
  sub_21570E0C8();
  uint64_t v0 = sub_21570E368();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2156ECC00(uint64_t a1, uint64_t a2)
{
  return sub_2156ECC18(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2156ECC18(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_21570E098();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2156ECC5C(uint64_t a1, id *a2)
{
  uint64_t result = sub_21570E078();
  *a2 = 0;
  return result;
}

uint64_t sub_2156ECCD4(uint64_t a1, id *a2)
{
  char v3 = sub_21570E088();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2156ECD54@<X0>(uint64_t *a1@<X8>)
{
  sub_21570E098();
  uint64_t v2 = sub_21570E068();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2156ECD98()
{
  uint64_t v0 = sub_21570E098();
  uint64_t v2 = v1;
  if (v0 == sub_21570E098() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_21570E328();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2156ECE24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_21570E068();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2156ECE6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21570E098();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2156ECE98(uint64_t a1)
{
  uint64_t v2 = sub_2156ECF98((unint64_t *)&qword_267881940);
  uint64_t v3 = sub_2156ECF98((unint64_t *)&unk_2678811E0);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2156ECF30()
{
  return sub_2156ECF98(&qword_2678811C0);
}

uint64_t sub_2156ECF64()
{
  return sub_2156ECF98(&qword_2678811C8);
}

uint64_t sub_2156ECF98(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2156ECFDC()
{
  return sub_2156ECF98((unint64_t *)&unk_2678811D0);
}

uint64_t sub_2156ED018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = a2;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  *a3 = sub_2156EF6E4;
  a3[1] = v6;
  a3[2] = sub_2156EF6E8;
  a3[3] = v7;
  a3[4] = sub_2156EF904;
  a3[5] = v8;
  a3[6] = sub_2156EF900;
  a3[7] = v9;
  return swift_bridgeObjectRetain_n();
}

uint64_t static _AppExtension<>.main()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v26 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)v23 - v7;
  uint64_t v9 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v6);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v12 = sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  v13 = sub_21570E238();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    v23[2] = a3;
    v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v25 = v9;
    v17 = (void *)v16;
    uint64_t v24 = AssociatedTypeWitness;
    *(_DWORD *)v15 = 138412290;
    v23[1] = v15 + 4;
    sub_2156ED480(0, &qword_26AB24B08);
    id v18 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
    id v28 = v18;
    uint64_t AssociatedTypeWitness = v24;
    sub_21570E258();
    void *v17 = v18;
    _os_log_impl(&dword_2156DD000, v13, v12, "Launching UI _AppExtension %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_267881310);
    swift_arrayDestroy();
    v19 = v17;
    uint64_t v9 = v25;
    MEMORY[0x2166C3490](v19, -1, -1);
    MEMORY[0x2166C3490](v15, -1, -1);
  }

  sub_21570DB28();
  sub_2156ED480(0, &qword_26AB24B08);
  id v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  type metadata accessor for _UIAppExtensionWrapper();
  sub_21570DB18();
  id v21 = sub_2156EEB00(v8);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, AssociatedTypeWitness);
  objc_msgSend(v20, sel_setExtension_, v21);

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, a1);
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  os_log_type_t v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void v23[3];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  uint64_t v27 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v26 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)v23 - v7;
  uint64_t v9 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v6);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v12 = sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  v13 = sub_21570E238();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    v23[2] = a3;
    v15 = (uint8_t *)v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v25 = v9;
    v17 = (void *)v16;
    uint64_t v24 = AssociatedTypeWitness;
    *(_DWORD *)v15 = 138412290;
    v23[1] = v15 + 4;
    sub_2156ED480(0, &qword_26AB24B08);
    id v18 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
    id v28 = v18;
    uint64_t AssociatedTypeWitness = v24;
    sub_21570E258();
    void *v17 = v18;
    _os_log_impl(&dword_2156DD000, v13, v12, "Launching UI _AppExtension for scene configuration %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_267881310);
    swift_arrayDestroy();
    v19 = v17;
    uint64_t v9 = v25;
    MEMORY[0x2166C3490](v19, -1, -1);
    MEMORY[0x2166C3490](v15, -1, -1);
  }

  sub_21570DB28();
  sub_2156ED480(0, &qword_26AB24B08);
  id v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  type metadata accessor for _UIAppExtensionSceneConfigWrapper();
  sub_21570DB18();
  id v21 = sub_215702B2C(v8);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, AssociatedTypeWitness);
  objc_msgSend(v20, sel_setExtension_, v21);

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, a1);
}

uint64_t sub_2156ED480(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for _UIAppExtensionWrapper()
{
  return __swift_instantiateGenericMetadata();
}

id sub_2156ED4D4(_OWORD *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_2156ED6D4(a1);
}

uint64_t sub_2156ED510(uint64_t a1)
{
  uint64_t v2 = *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v8 - v5, &v1[*(void *)(v3 + 96)], v2);
  __swift_instantiateConcreteTypeFromMangledName(qword_26AB249E0);
  if (swift_dynamicCast())
  {
    sub_2156EED90(v8, (uint64_t)v10);
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    char v6 = sub_21570DC98();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    sub_2156EED30((uint64_t)v8);
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_2156ED684(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  LOBYTE(a1) = sub_2156ED510((uint64_t)v4);

  return a1 & 1;
}

id sub_2156ED6D4(_OWORD *a1)
{
  *(_OWORD *)&v1[qword_267881398] = *a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for _UIAppExtensionWrapper._SceneFactory();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_2156ED758(void *a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  id v4 = objc_msgSend(a1, sel_role);
  uint64_t v5 = sub_21570E098();
  unint64_t v7 = v6;

  long long v47 = *(_OWORD *)((char *)v1 + qword_267881398);
  uint64_t v45 = v5;
  v46[0] = v5;
  v46[1] = v7;
  sub_2156F9F58(v46, &v48);
  uint64_t v8 = v48;
  if ((void)v48)
  {
    uint64_t v42 = v3;
    id v43 = a1;
    uint64_t v10 = *((void *)&v48 + 1);
    uint64_t v9 = v49;
    unint64_t v12 = v50;
    v11 = v51;
    uint64_t v13 = v52;
    v44 = v53;
    uint64_t v14 = v54;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    os_log_type_t v15 = sub_21570E1F8();
    sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
    uint64_t v16 = sub_21570E238();
    if (os_log_type_enabled(v16, v15))
    {
      sub_2156EF770(v8);
      sub_2156EF770(v8);
      swift_bridgeObjectRetain();
      log = v16;
      uint64_t v17 = swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      *(void *)&long long v47 = v41;
      *(_DWORD *)uint64_t v17 = 136315394;
      *(void *)&long long v48 = v8;
      *((void *)&v48 + 1) = v10;
      v49 = v9;
      unint64_t v50 = v12;
      v51 = v11;
      uint64_t v52 = v13;
      v53 = v44;
      uint64_t v54 = v14;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v18 = sub_21570E0A8();
      *(void *)&long long v48 = sub_215708FE4(v18, v19, (uint64_t *)&v47);
      sub_21570E258();
      swift_bridgeObjectRelease();
      sub_2156EF70C(v8);
      sub_2156EF70C(v8);
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v48 = sub_215708FE4(v45, v7, (uint64_t *)&v47);
      sub_21570E258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2156DD000, log, v15, "Using %s for requested role %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2166C3490](v41, -1, -1);
      MEMORY[0x2166C3490](v17, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v26 = *(void *)(v42 + 80);
    uint64_t v27 = *(uint64_t (**)())(v42 + 88);
    unint64_t v28 = sub_2156EF658();
    *(void *)&long long v48 = v26;
    *((void *)&v48 + 1) = &type metadata for _AnyViewConfiguration;
    v49 = v27;
    unint64_t v50 = v28;
    type metadata accessor for _UIAppExtensionWrapper._Scene();
    *(void *)&long long v48 = v8;
    *((void *)&v48 + 1) = v10;
    v49 = v9;
    unint64_t v50 = v12;
    v51 = v11;
    uint64_t v52 = v13;
    v53 = v44;
    uint64_t v54 = v14;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    id v29 = objc_msgSend(v43, sel_parameters);
    id v30 = sub_2156EF570((char *)&v48, v29);

    sub_2156EF70C(v8);
    sub_2156EF70C(v8);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    os_log_type_t v20 = sub_21570E208();
    sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
    id v21 = sub_21570E238();
    os_log_type_t v22 = v20;
    if (os_log_type_enabled(v21, v20))
    {
      swift_bridgeObjectRetain_n();
      v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(void *)&long long v48 = v24;
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v25 = v45;
      *(void *)&long long v47 = sub_215708FE4(v45, v7, (uint64_t *)&v48);
      sub_21570E258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2156DD000, v21, v22, "No configuration found for requested role %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2166C3490](v24, -1, -1);
      MEMORY[0x2166C3490](v23, -1, -1);
    }
    else
    {

      uint64_t v25 = v45;
    }
    uint64_t v31 = *(void *)(v3 + 80);
    v32 = *(uint64_t (**)())(v3 + 88);
    unint64_t v33 = sub_2156EF658();
    *(void *)&long long v48 = v31;
    *((void *)&v48 + 1) = &type metadata for _AnyViewConfiguration;
    v49 = v32;
    unint64_t v50 = v33;
    type metadata accessor for _UIAppExtensionWrapper._Scene();
    if (qword_267881078 != -1) {
      swift_once();
    }
    uint64_t v34 = swift_allocObject();
    *(void *)(v34 + 16) = v25;
    *(void *)(v34 + 24) = v7;
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v25;
    *(void *)(v35 + 24) = v7;
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v25;
    *(void *)(v36 + 24) = v7;
    uint64_t v37 = swift_allocObject();
    *(void *)(v37 + 16) = v25;
    *(void *)(v37 + 24) = v7;
    *(void *)&long long v48 = sub_2156EF6E4;
    *((void *)&v48 + 1) = v34;
    v49 = sub_2156EF6E8;
    unint64_t v50 = v35;
    v51 = sub_2156EF6FC;
    uint64_t v52 = v36;
    v53 = sub_2156EF704;
    uint64_t v54 = v37;
    swift_bridgeObjectRetain_n();
    id v38 = objc_msgSend(a1, sel_parameters);
    id v30 = sub_2156EF570((char *)&v48, v38);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
  }
  return v30;
}

id sub_2156EDE64(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  id v6 = sub_2156ED758(v4);

  return v6;
}

uint64_t sub_2156EDEC4(void *a1, uint64_t a2)
{
  return sub_2156EE348(a1, a2, (uint64_t (*)(void, void))sub_2156EF5CC);
}

id sub_2156EDEDC()
{
  return sub_2156EE3A8((uint64_t (*)(void, void, void))type metadata accessor for _UIAppExtensionWrapper._SceneFactory);
}

uint64_t sub_2156EDEF4()
{
  return swift_release();
}

id sub_2156EDF08()
{
  uint64_t v0 = (void *)sub_2156EF5FC();

  return v0;
}

void sub_2156EDF3C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_2156EDF98((uint64_t)a3);
}

uint64_t sub_2156EDF98(uint64_t a1)
{
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x70)) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2156EDFC8(uint64_t a1)
{
  uint64_t v2 = *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x58);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v8 - v5, &v1[*(void *)(v3 + 120)], v2);
  __swift_instantiateConcreteTypeFromMangledName(qword_26AB249E0);
  if (swift_dynamicCast())
  {
    sub_2156EED90(v8, (uint64_t)v10);
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    char v6 = sub_21570DC98();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    sub_2156EED30((uint64_t)v8);
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_2156EE13C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  LOBYTE(a1) = sub_2156EDFC8((uint64_t)v4);

  return a1 & 1;
}

void sub_2156EE18C()
{
}

id sub_2156EE1F8()
{
  long long v2 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x50);
  long long v3 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for _UIAppExtensionWrapper._Scene();
  return objc_msgSendSuper2(&v4, sel_dealloc, v2, v3);
}

uint64_t sub_2156EE270(void *a1)
{
  long long v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *MEMORY[0x263F8EED0] & *a1;

  objc_super v4 = (char *)a1 + *(void *)((*v2 & *a1) + 0x78);
  id v5 = *(uint64_t (**)(char *))(*(void *)(*(void *)(v3 + 88) - 8) + 8);

  return v5(v4);
}

uint64_t sub_2156EE330(void *a1, uint64_t a2)
{
  return sub_2156EE348(a1, a2, (uint64_t (*)(void, void))sub_2156EF884);
}

uint64_t sub_2156EE348(void *a1, uint64_t a2, uint64_t (*a3)(void, void))
{
  return a3(*(void *)((*MEMORY[0x263F8EED0] & *a1) + 0x50), *(void *)((*MEMORY[0x263F8EED0] & *a1) + 0x58));
}

id sub_2156EE390()
{
  return sub_2156EE3A8((uint64_t (*)(void, void, void))type metadata accessor for _UIAppExtensionWrapper);
}

id sub_2156EE3A8(uint64_t (*a1)(void, void, void))
{
  long long v2 = (objc_class *)a1(0, *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x50), *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x58));
  v4.receiver = v1;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_2156EE424(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x60)]);
}

uint64_t sub_2156EE48C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = a2;
  uint64_t v8 = a3;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_26AB249E0);
  if (swift_dynamicCast())
  {
    sub_2156EED90(v5, (uint64_t)v9);
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    char v3 = sub_21570DC98();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  else
  {
    uint64_t v6 = 0;
    memset(v5, 0, sizeof(v5));
    sub_2156EED30((uint64_t)v5);
    char v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_2156EE550(uint64_t result, unsigned char **a2)
{
  long long v2 = *a2;
  *long long v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2156EE560(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_2156EE59C(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  objc_super v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_2156EE5AC(uint64_t (*a1)(void))
{
  return a1();
}

void sub_2156EE5D4(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_21570E258();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

void sub_2156EE68C()
{
  sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  id v0 = (id)sub_21570E238();
  sub_21570DCC8();
}

id sub_2156EE71C(char *a1)
{
  uint64_t v29 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v3 = *(void *)(v29 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v26 - v8;
  uint64_t v10 = v1;
  os_log_type_t v11 = sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  unint64_t v12 = sub_21570E238();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  id v30 = a1;
  uint64_t v31 = v13;
  v13(v9, a1, v3);
  os_log_type_t v14 = v11;
  if (os_log_type_enabled(v12, v11))
  {
    os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(void *)&long long v34 = v27;
    unint64_t v28 = v10;
    *(_DWORD *)os_log_type_t v15 = 136315138;
    uint64_t v26 = v15 + 4;
    v31(v7, v9, v3);
    uint64_t v16 = sub_21570E0A8();
    *(void *)&long long v33 = sub_215708FE4(v16, v17, (uint64_t *)&v34);
    uint64_t v10 = v28;
    sub_21570E258();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    _os_log_impl(&dword_2156DD000, v12, v14, "Creating _UIAppExtensionWrapper with content %s", v15, 0xCu);
    uint64_t v18 = v27;
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v18, -1, -1);
    MEMORY[0x2166C3490](v15, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  v31((char *)v10 + *(void *)((*MEMORY[0x263F8EED0] & *v10) + 0x60), v30, v3);

  sub_2156ED480(0, &qword_26AB24B08);
  id v19 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  uint64_t v20 = *(void *)(v29 + 88);
  id v21 = (objc_class *)type metadata accessor for _UIAppExtensionWrapper._SceneFactory();
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v20 + 8))(&v34, v3, v20);
  long long v33 = v34;
  id v22 = objc_allocWithZone(v21);
  id v23 = sub_2156ED6D4(&v33);
  objc_msgSend(v19, sel_setSceneFactory_, v23);

  uint64_t v24 = (objc_class *)type metadata accessor for _UIAppExtensionWrapper();
  v32.receiver = v10;
  v32.super_class = v24;
  return objc_msgSendSuper2(&v32, sel_init);
}

id sub_2156EEB00(char *a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for _UIAppExtensionWrapper());
  return sub_2156EE71C(a1);
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

uint64_t sub_2156EEB84()
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

uint64_t sub_2156EEC18()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for _UIAppExtensionWrapper._SceneFactory()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2156EEC78()
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

uint64_t type metadata accessor for _UIAppExtensionWrapper._Scene()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2156EED30(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_267881BE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2156EED90(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id sub_2156EEE3C(char *a1, void *a2)
{
  v58 = a2;
  v65 = (void *)(*MEMORY[0x263F8EED0] & *v2);
  uint64_t v4 = v65;
  uint64_t v5 = v65[11];
  uint64_t v69 = v65[13];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267881568);
  uint64_t v60 = sub_21570DD88();
  uint64_t v7 = MEMORY[0x270FA5388](v60);
  v62 = (char *)v56 - v8;
  uint64_t v64 = AssociatedTypeWitness;
  uint64_t v63 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v61 = (char *)v56 - v10;
  uint64_t v11 = *(void *)(v5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  os_log_type_t v14 = (char *)v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v56 - v15;
  uint64_t v59 = v4[14];
  *(void *)((char *)v2 + v59) = 0;
  v67 = v2;
  unint64_t v17 = v2;
  os_log_type_t v18 = sub_21570E1F8();
  v56[2] = sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  id v19 = sub_21570E238();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v66 = a1;
  id v21 = v20;
  v20(v16, a1, v5);
  os_log_type_t v22 = v18;
  v57 = v19;
  BOOL v23 = os_log_type_enabled(v19, v18);
  v68 = v17;
  if (v23)
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    v71[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    v56[1] = v24 + 4;
    v21(v14, v16, v5);
    uint64_t v26 = sub_21570E0A8();
    uint64_t v70 = sub_215708FE4(v26, v27, v71);
    sub_21570E258();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v5);
    unint64_t v28 = v57;
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v25, -1, -1);
    uint64_t v29 = v24;
    unint64_t v17 = v68;
    MEMORY[0x2166C3490](v29, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v5);
  }
  id v30 = v67;
  uint64_t v31 = v5;
  objc_super v32 = v58;
  v21((char *)v17 + *(void *)((*MEMORY[0x263F8EED0] & *v17) + 0x78), v66, v31);
  id v33 = objc_msgSend(v32, sel_initializationParametersPromise);
  if (v33)
  {
    id v34 = v33;
    os_log_type_t v35 = sub_21570E1F8();
    uint64_t v36 = sub_21570E238();
    os_log_type_t v37 = v35;
    if (os_log_type_enabled(v36, v35))
    {
      id v38 = v34;
      uint64_t v39 = swift_slowAlloc();
      v58 = (void *)v31;
      v40 = (uint8_t *)v39;
      uint64_t v41 = swift_slowAlloc();
      uint64_t v70 = (uint64_t)v38;
      v71[0] = v41;
      *(_DWORD *)v40 = 136315138;
      id v42 = v38;
      uint64_t v43 = sub_21570E0A8();
      uint64_t v70 = sub_215708FE4(v43, v44, v71);
      id v30 = v67;
      sub_21570E258();

      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      MEMORY[0x2166C3490](v41, -1, -1);
      uint64_t v31 = (uint64_t)v58;
      MEMORY[0x2166C3490](v40, -1, -1);
    }

    v71[0] = (uint64_t)v34;
    (*(void (**)(uint64_t *, uint64_t))(v69 + 40))(v71, v31);
  }
  uint64_t v45 = v69;
  v46 = v61;
  (*(void (**)(uint64_t, uint64_t))(v69 + 32))(v31, v69);
  uint64_t v47 = v64;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  unint64_t v49 = sub_2156EF81C();
  uint64_t v73 = AssociatedConformanceWitness;
  unint64_t v74 = v49;
  swift_getWitnessTable();
  sub_21570DE58();
  v71[0] = sub_21570DFD8();
  sub_21570DF08();
  sub_21570DFA8();
  swift_release();
  uint64_t v50 = sub_21570DE38();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v46, v47);
  v51 = *(void **)((char *)v30 + v59);
  *(void *)((char *)v30 + v59) = v50;
  id v52 = v68;

  uint64_t v53 = v65[12];
  v71[0] = v65[10];
  v71[1] = v31;
  v71[2] = v53;
  v71[3] = v45;
  uint64_t v54 = (objc_class *)type metadata accessor for _UIAppExtensionWrapper._Scene();
  v72.receiver = v52;
  v72.super_class = v54;
  return objc_msgSendSuper2(&v72, sel_init);
}

id sub_2156EF570(char *a1, void *a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for _UIAppExtensionWrapper._Scene());
  return sub_2156EEE3C(a1, a2);
}

void sub_2156EF5CC()
{
}

uint64_t sub_2156EF5FC()
{
  return *(void *)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x70));
}

void sub_2156EF628()
{
}

unint64_t sub_2156EF658()
{
  unint64_t result = qword_267881560;
  if (!qword_267881560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881560);
  }
  return result;
}

uint64_t sub_2156EF6AC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2156EF6E8()
{
  return sub_21570E008();
}

uint64_t sub_2156EF6FC(uint64_t a1)
{
  return sub_2156EE48C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_2156EF704()
{
}

uint64_t sub_2156EF70C(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2156EF770(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_2156EF81C()
{
  unint64_t result = qword_267881570;
  if (!qword_267881570)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267881568);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881570);
  }
  return result;
}

uint64_t sub_2156EF878@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void sub_2156EF884()
{
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2156EF908()
{
  return 0;
}

Swift::Bool __swiftcall _ViewScene.shouldAccept(connection:)(NSXPCConnection connection)
{
  return 0;
}

void sub_2156EF918()
{
  sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  id v0 = (id)sub_21570E238();
  sub_21570DCC8();
}

void _ViewScene.consume(initializationParameters:)()
{
  sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  id v0 = (id)sub_21570E238();
  sub_21570DCC8();
}

uint64_t _ContentViewScene.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  if (qword_267881070 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_267881870;
  uint64_t v10 = *(void *)algn_267881878;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a1;
  v12[5] = a2;
  *a5 = v11;
  a5[1] = v10;
  a5[2] = (uint64_t)sub_2156F1AEC;
  a5[3] = (uint64_t)v12;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2156EFB10@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v20 = a4;
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v19(v9, (uint64_t)a1, a2);
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  v18[0] = v11 + v8;
  v18[1] = v10 | 7;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  uint64_t v13 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v13(v12 + v11, v9, a2);
  v19(v9, (uint64_t)a1, a2);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  v13(v14 + v11, v9, a2);
  v13((uint64_t)v9, a1, a2);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v13)(v15 + v11, v9, a2);
  unint64_t v17 = v20;
  *uint64_t v20 = sub_2156F1920;
  v17[1] = (uint64_t (*)())v12;
  v17[2] = sub_2156F1964;
  v17[3] = (uint64_t (*)())v14;
  v17[4] = (uint64_t (*)())sub_2156F1A60;
  v17[5] = (uint64_t (*)())v15;
  return result;
}

void *_ContentViewScene.init<A>(role:_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  uint64_t result = (void *)swift_allocObject();
  result[2] = a4;
  result[3] = a5;
  result[4] = a2;
  result[5] = a3;
  *a6 = v11;
  a6[1] = v12;
  a6[2] = sub_2156F1AEC;
  a6[3] = result;
  return result;
}

void *_ContentViewScene.init<A>(id:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a5;
  result[3] = a6;
  result[4] = a3;
  result[5] = a4;
  *a7 = a1;
  a7[1] = a2;
  a7[2] = sub_2156F0A64;
  a7[3] = result;
  return result;
}

double sub_2156EFE24@<D0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  uint64_t v7 = (void (*)(void))MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  sub_2156EFB10(v9, a2, a3, (uint64_t (**)())v12);
  long long v10 = v12[1];
  *a4 = v12[0];
  a4[1] = v10;
  double result = *(double *)&v13;
  a4[2] = v13;
  return result;
}

uint64_t _ConfigurationScene.init(main:scenes:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_2156EED90(a1, a3);
  *(void *)(a3 + 40) = a2;
  return result;
}

uint64_t _ConfigurationScene.init(scenes:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_21570DC88();
  uint64_t v5 = MEMORY[0x263F04D98];
  a2[3] = v4;
  a2[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(a2);
  uint64_t result = sub_21570DC78();
  a2[5] = a1;
  return result;
}

Swift::Bool __swiftcall _ConfigurationScene.shouldAccept(connection:)(NSXPCConnection connection)
{
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  return sub_21570DCA8() & 1;
}

uint64_t sub_2156EFFA4()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  return sub_21570DCA8() & 1;
}

void _ConfigurationScene.content.getter(uint64_t (**a1)()@<X8>)
{
  *a1 = sub_2156F0AE8;
  a1[1] = 0;
}

void sub_2156F000C(uint64_t (**a1)()@<X8>)
{
  *a1 = sub_2156F0AE8;
  a1[1] = 0;
}

void static _SceneBuilder.buildBlock(_:)(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2156ED480(0, &qword_26AB24B08);
  id v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  uint64_t v5 = (objc_class *)type metadata accessor for _ViewSceneFactory();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR____TtC12ExtensionKitP33_B73671B6E3271B2B0FF13F0EEBE6E03017_ViewSceneFactory_scenes] = a1;
  v10.receiver = v6;
  v10.super_class = v5;
  swift_bridgeObjectRetain();
  id v7 = objc_msgSendSuper2(&v10, sel_init);
  objc_msgSend(v4, sel_setSceneFactory_, v7, v10.receiver, v10.super_class);

  uint64_t v8 = sub_21570DC88();
  uint64_t v9 = MEMORY[0x263F04D98];
  a2[3] = v8;
  a2[4] = v9;
  __swift_allocate_boxed_opaque_existential_1(a2);
  swift_bridgeObjectRetain();
  sub_21570DC78();

  a2[5] = a1;
}

uint64_t static _SceneBuilder.buildBlock(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_2156ED480(0, &qword_26AB24B08);
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  id v7 = (objc_class *)type metadata accessor for _ViewSceneFactory();
  uint64_t v8 = (char *)objc_allocWithZone(v7);
  *(void *)&v8[OBJC_IVAR____TtC12ExtensionKitP33_B73671B6E3271B2B0FF13F0EEBE6E03017_ViewSceneFactory_scenes] = a2;
  v11.receiver = v8;
  v11.super_class = v7;
  swift_bridgeObjectRetain();
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  objc_msgSend(v6, sel_setSceneFactory_, v9, v11.receiver, v11.super_class);

  sub_2156F0BC0(a1, a3);
  *(void *)(a3 + 40) = a2;
  return swift_bridgeObjectRetain();
}

id sub_2156F0204(void *a1)
{
  void (*v12)(void *__return_ptr, uint64_t);
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v23;
  void v24[6];
  void v25[6];

  uint64_t v2 = a1;
  id v3 = objc_msgSend(a1, sel_role);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC12ExtensionKitP33_B73671B6E3271B2B0FF13F0EEBE6E03017_ViewSceneFactory_scenes);
  uint64_t v5 = *(void *)(v4 + 16);
  id v6 = sub_2156F18D4;
  id v7 = sub_2156EF908;
  uint64_t v8 = sub_2156EF6E8;
  if (v5)
  {
    BOOL v23 = v2;
    swift_bridgeObjectRetain_n();
    uint64_t v9 = v4 + 56;
    while (1)
    {
      uint64_t v11 = *(void *)(v9 - 24);
      uint64_t v10 = *(void *)(v9 - 16);
      uint64_t v12 = *(void (**)(void *__return_ptr, uint64_t))(v9 - 8);
      if (v11 == sub_21570E098() && v10 == v13) {
        break;
      }
      uint64_t v15 = sub_21570E328();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRelease();
      if (v15) {
        goto LABEL_12;
      }
      swift_release();
      swift_bridgeObjectRelease();
      v9 += 32;
      if (!--v5)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v16 = 0;
        unint64_t v17 = 0;
        uint64_t v11 = 0;
        uint64_t v10 = 0;
        id v6 = sub_2156F18D4;
        id v7 = sub_2156EF908;
        uint64_t v8 = sub_2156EF6E8;
        goto LABEL_13;
      }
    }
    swift_retain();
LABEL_12:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRetain();
    os_log_type_t v18 = swift_retain();
    v12(v24, v18);
    swift_release();
    swift_bridgeObjectRelease();
    id v6 = (void (*)())v24[4];
    uint64_t v5 = v24[5];
    id v7 = (uint64_t (*)())v24[2];
    unint64_t v17 = v24[3];
    uint64_t v8 = (uint64_t (*)())v24[0];
    uint64_t v16 = v24[1];
LABEL_13:
    uint64_t v2 = v23;
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0;
  }
  v25[0] = v8;
  v25[1] = v16;
  v25[2] = v7;
  v25[3] = v17;
  v25[4] = v6;
  v25[5] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  id v19 = objc_msgSend(v2, sel_parameters);
  uint64_t v20 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267881670));
  id v21 = sub_2156F1578((uint64_t)v25, v19);

  swift_release();
  swift_release();
  swift_release();

  sub_2156F18D8(v11, v10);
  swift_release();
  swift_release();
  swift_release();
  return v21;
}

id sub_2156F054C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _ViewSceneFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2156F0594()
{
  id v0 = (void *)sub_2156F1878();

  return v0;
}

void sub_2156F05C8(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  sub_2156F0624((uint64_t)a3);
}

uint64_t sub_2156F0624(uint64_t a1)
{
  *(void *)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x60)) = a1;
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2156F0654(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x58) + 32))(a1, *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x50)) & 1;
}

uint64_t sub_2156F06E0(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  LOBYTE(a1) = sub_2156F0654((uint64_t)v4);

  return a1 & 1;
}

void sub_2156F0730()
{
}

id sub_2156F0774()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _ViewSceneAdaptor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2156F07E8(void *a1)
{
  objc_super v2 = (void *)MEMORY[0x263F8EED0];
  uint64_t v3 = *MEMORY[0x263F8EED0] & *a1;

  id v4 = (char *)a1 + *(void *)((*v2 & *a1) + 0x68);
  id v5 = *(uint64_t (**)(char *))(*(void *)(*(void *)(v3 + 80) - 8) + 8);

  return v5(v4);
}

uint64_t sub_2156F08A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  swift_getAssociatedConformanceWitness();
  return sub_21570E008();
}

uint64_t sub_2156F0994@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*v1)();
  *a1 = result;
  return result;
}

uint64_t sub_2156F09C4()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_2156F09F0(uint64_t *a1)
{
  objc_super v2 = *(uint64_t (**)(uint64_t *))(v1 + 32);
  uint64_t v4 = *a1;
  return v2(&v4);
}

uint64_t sub_2156F0A2C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

double sub_2156F0A64@<D0>(_OWORD *a1@<X8>)
{
  return sub_2156EFE24(v1[4], v1[2], v1[3], a1);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_2156F0AE8()
{
  if (qword_267881078 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_267881898;
  uint64_t v1 = unk_2678818A0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881678);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_2157108E0;
  swift_bridgeObjectRetain_n();
  sub_2156ED018(v0, v1, (void *)(v2 + 32));
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t type metadata accessor for _ViewSceneFactory()
{
  return self;
}

uint64_t sub_2156F0BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2156F0C24(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of _EmptyViewScene.body>>, 1);
}

uint64_t dispatch thunk of _ViewScene.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _ViewScene.shouldAccept(connection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of _ViewScene.consume(initializationParameters:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

ValueMetadata *type metadata accessor for _EmptyViewScene()
{
  return &type metadata for _EmptyViewScene;
}

uint64_t destroy for _ContentViewScene()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for _ContentViewScene(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for _ContentViewScene(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for _ContentViewScene(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ContentViewScene(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _ContentViewScene(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _ContentViewScene()
{
  return &type metadata for _ContentViewScene;
}

uint64_t destroy for _ConfigurationScene(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for _ConfigurationScene(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for _ConfigurationScene(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for _ConfigurationScene(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ConfigurationScene(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _ConfigurationScene(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _ConfigurationScene()
{
  return &type metadata for _ConfigurationScene;
}

uint64_t sub_2156F1274()
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

uint64_t type metadata accessor for _ViewSceneAdaptor()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2156F132C()
{
  return MEMORY[0x263F1B9F8];
}

uint64_t destroy for _AnyViewScene()
{
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for _AnyViewScene(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for _AnyViewScene(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for _AnyViewScene(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AnyViewScene(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AnyViewScene(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _AnyViewScene()
{
  return &type metadata for _AnyViewScene;
}

uint64_t sub_2156F155C(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_215715CD8, 1);
}

id sub_2156F1578(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(uint64_t (**)(void))a1;
  uint64_t v6 = *(void (**)(void))(a1 + 32);
  uint64_t v7 = (void *)MEMORY[0x263F8EED0];
  uint64_t v8 = *(void *)((*MEMORY[0x263F8EED0] & *v3) + 0x60);
  *(void *)((char *)v3 + v8) = 0;
  int v9 = (_OWORD *)((char *)v3 + *(void *)((*v7 & *v3) + 0x68));
  long long v10 = *(_OWORD *)(a1 + 16);
  *int v9 = *(_OWORD *)a1;
  v9[1] = v10;
  v9[2] = *(_OWORD *)(a1 + 32);
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v11 = v3;
  id v12 = objc_msgSend(a2, sel_initializationParametersPromise);
  if (v12)
  {
    id v13 = v12;
    os_log_type_t v14 = sub_21570E1F8();
    sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
    uint64_t v15 = sub_21570E238();
    if (os_log_type_enabled(v15, v14))
    {
      uint64_t v26 = v6;
      id v16 = v13;
      unint64_t v27 = v5;
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v29 = v18;
      *(_DWORD *)unint64_t v17 = 136315138;
      id v19 = v16;
      uint64_t v20 = sub_21570E0A8();
      sub_215708FE4(v20, v21, &v29);
      sub_21570E258();

      uint64_t v6 = v26;
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      MEMORY[0x2166C3490](v18, -1, -1);
      os_log_type_t v22 = v17;
      uint64_t v5 = v27;
      MEMORY[0x2166C3490](v22, -1, -1);
    }

    uint64_t v29 = (uint64_t)v13;
    v6(&v29);
  }
  uint64_t v29 = v5();
  sub_21570E008();
  sub_21570DE68();
  swift_release();
  self;
  uint64_t v23 = swift_dynamicCastObjCClassUnconditional();
  uint64_t v24 = *(void **)((char *)v3 + v8);
  *(void *)((char *)v3 + v8) = v23;

  v28.receiver = v11;
  v28.super_class = (Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267881670);
  return objc_msgSendSuper2(&v28, sel_init);
}

uint64_t sub_2156F1878()
{
  return *(void *)((char *)v0 + *(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x60));
}

void sub_2156F18A4()
{
}

uint64_t sub_2156F18D8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_2156F1920()
{
  return sub_2156F08A8(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80)), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2156F1964()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 32))() & 1;
}

uint64_t objectdestroy_17Tm()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2156F1A60(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v4 = *a1;
  return (*(uint64_t (**)(uint64_t *))(v2 + 40))(&v4);
}

uint64_t sub_2156F1AE0()
{
  return MEMORY[0x263F1B710];
}

double AppExtensionManager.configuration.getter@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_2157071AC;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  return result;
}

void AppExtensionManagerScene.body.getter(uint64_t (**a1)()@<X8>)
{
  *a1 = sub_2157075AC;
  a1[1] = 0;
  a1[2] = (uint64_t (*)())0x746C7561666564;
  a1[3] = (uint64_t (*)())0xE700000000000000;
  a1[4] = sub_215707348;
  a1[5] = 0;
  a1[6] = sub_2156EF908;
  a1[7] = 0;
}

void sub_2156F1B80(uint64_t (**a1)()@<X8>)
{
  *a1 = sub_2157075AC;
  a1[1] = 0;
  a1[2] = (uint64_t (*)())0x746C7561666564;
  a1[3] = (uint64_t (*)())0xE700000000000000;
  a1[4] = sub_215707348;
  a1[5] = 0;
  a1[6] = sub_2156EF908;
  a1[7] = 0;
}

uint64_t sub_2156F1BD8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881738);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881730);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881728);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v0
      + OBJC_IVAR____TtCV12ExtensionKit19ExtensionPickerViewP33_ABD14ED04C699754E7718E30E84C391A5Model__containerApps;
  v17[0] = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678816B8);
  sub_21570DD18();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  uint64_t v13 = v0 + OBJC_IVAR____TtCV12ExtensionKit19ExtensionPickerViewP33_ABD14ED04C699754E7718E30E84C391A5Model__hostAppName;
  v17[0] = 0x44454C5449544E55;
  v17[1] = 0xE800000000000000;
  sub_21570DD18();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  uint64_t v14 = sub_21570E1C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v3, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v0;
  swift_retain();
  sub_2156F2E28((uint64_t)v3, (uint64_t)&unk_267881748, (uint64_t)v15);
  swift_release();
  return v0;
}

uint64_t sub_2156F1E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[17] = a4;
  uint64_t v5 = sub_21570DB78();
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  uint64_t v6 = sub_21570DB68();
  v4[22] = v6;
  v4[23] = *(void *)(v6 - 8);
  v4[24] = swift_task_alloc();
  uint64_t v7 = sub_21570DB48();
  v4[25] = v7;
  v4[26] = *(void *)(v7 - 8);
  v4[27] = swift_task_alloc();
  uint64_t v8 = sub_21570DA28();
  v4[28] = v8;
  v4[29] = *(void *)(v8 - 8);
  v4[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2156F20A0, 0, 0);
}

uint64_t sub_2156F20A0()
{
  sub_2156ED480(0, &qword_26AB24B08);
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  *(void *)(v0 + 248) = v1;
  objc_msgSend(v1, sel_hostAuditToken);
  uint64_t v2 = self;
  *(void *)(v0 + 120) = 0;
  *(_OWORD *)(v0 + 304) = v34;
  *(_OWORD *)(v0 + 320) = v35;
  id v3 = objc_msgSend(v2, sel_bundleRecordForAuditToken_error_, v0 + 304, v0 + 120);
  *(void *)(v0 + 256) = v3;
  uint64_t v4 = *(void **)(v0 + 120);
  if (!v3)
  {
    id v24 = v4;
    uint64_t v25 = (void *)sub_21570DA08();

    swift_willThrow();
LABEL_14:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  uint64_t v5 = v3;
  self;
  uint64_t v6 = (void *)swift_dynamicCastObjCClass();
  id v7 = v4;
  if (!v6)
  {

    goto LABEL_14;
  }
  uint64_t v8 = (_OWORD *)(v0 + 48);
  id v9 = objc_msgSend(v6, sel_localizedName);
  uint64_t v10 = sub_21570E098();
  uint64_t v12 = v11;

  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 80) = v10;
  *(void *)(v0 + 88) = v12;
  swift_retain();
  sub_21570DD38();
  *(void *)(v0 + 264) = objc_msgSend(self, sel_enumeratorWithParentApplicationRecord_, v6);
  sub_21570E1E8();
  sub_21570DA18();
  if (*(void *)(v0 + 72))
  {
    uint64_t v13 = *(void *)(v0 + 152);
    unint64_t v14 = MEMORY[0x263F8EE78];
    while (1)
    {
      sub_2156F85A0(v8, (_OWORD *)(v0 + 16));
      sub_2156ED480(0, &qword_267881770);
      if (!swift_dynamicCast()) {
        return sub_21570E2C8();
      }
      uint64_t v15 = *(void *)(v0 + 160);
      uint64_t v16 = *(void *)(v0 + 168);
      uint64_t v17 = *(void *)(v0 + 144);
      id v18 = *(id *)(v0 + 128);
      sub_21570DB38();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v15, v16, v17);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v14 = sub_2156F58D4(0, *(void *)(v14 + 16) + 1, 1, v14, &qword_267881778, MEMORY[0x263F04D58], MEMORY[0x263F04D58]);
      }
      unint64_t v20 = *(void *)(v14 + 16);
      unint64_t v19 = *(void *)(v14 + 24);
      if (v20 >= v19 >> 1) {
        unint64_t v14 = sub_2156F58D4(v19 > 1, v20 + 1, 1, v14, &qword_267881778, MEMORY[0x263F04D58], MEMORY[0x263F04D58]);
      }
      uint64_t v21 = *(void *)(v0 + 160);
      uint64_t v22 = *(void *)(v0 + 168);
      uint64_t v23 = *(void *)(v0 + 144);
      *(void *)(v14 + 16) = v20 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v13 + 32))(v14+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(void *)(v13 + 72) * v20, v21, v23);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v22, v23);
      uint64_t v8 = (_OWORD *)(v0 + 48);
      sub_21570DA18();
      if (!*(void *)(v0 + 72)) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    unint64_t v14 = MEMORY[0x263F8EE78];
LABEL_18:
    uint64_t v29 = *(void *)(v0 + 184);
    uint64_t v28 = *(void *)(v0 + 192);
    uint64_t v30 = *(void *)(v0 + 176);
    (*(void (**)(void, void))(*(void *)(v0 + 232) + 8))(*(void *)(v0 + 240), *(void *)(v0 + 224));
    *(void *)(v0 + 96) = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267881750);
    sub_2156F8F30(&qword_267881758, &qword_267881750);
    sub_21570E1D8();
    swift_bridgeObjectRelease();
    sub_21570DB58();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    uint64_t v31 = sub_2156F8558(&qword_267881760, MEMORY[0x263F04D38]);
    objc_super v32 = (void *)swift_task_alloc();
    *(void *)(v0 + 272) = v32;
    *objc_super v32 = v0;
    v32[1] = sub_2156F271C;
    uint64_t v33 = *(void *)(v0 + 200);
    return MEMORY[0x270FA1E80](v0 + 104, v33, v31);
  }
}

uint64_t sub_2156F271C()
{
  *(void *)(*(void *)v1 + 280) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2156F2C68;
  }
  else {
    uint64_t v2 = sub_2156F285C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2156F285C()
{
  *(void *)(v0 + 288) = *(void *)(v0 + 104);
  return MEMORY[0x270FA2498](sub_2156F28F0, 0, 0);
}

uint64_t sub_2156F28F0()
{
  uint64_t v1 = v0[36];
  if (v1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[37] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_2156F2A7C;
    return sub_2156F2FA8(v1);
  }
  else
  {
    uint64_t v4 = (void *)v0[32];
    uint64_t v5 = (void *)v0[33];
    uint64_t v6 = (void *)v0[31];
    (*(void (**)(void, void))(v0[26] + 8))(v0[27], v0[25]);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_2156F2A7C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_2156F8558(&qword_267881760, MEMORY[0x263F04D38]);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 272) = v4;
  void *v4 = v2;
  v4[1] = sub_2156F271C;
  uint64_t v5 = *(void *)(v1 + 200);
  return MEMORY[0x270FA1E80](v1 + 104, v5, v3);
}

uint64_t sub_2156F2C68()
{
  *(void *)(v0 + 112) = *(void *)(v0 + 280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881768);
  swift_willThrowTypedImpl();
  return MEMORY[0x270FA2498](sub_2156F2D20, 0, 0);
}

uint64_t sub_2156F2D20()
{
  uint64_t v1 = *(void **)(v0 + 256);
  uint64_t v2 = *(void **)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v5 = *(void *)(v0 + 200);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2156F2E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_21570E1C8();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21570E1B8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2156F84F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21570E168();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2156F2FA8(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = sub_21570DC68();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881700);
  v2[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2156F30A8, 0, 0);
}

uint64_t sub_2156F30A8()
{
  uint64_t v64 = v0;
  uint64_t v1 = v0[3];
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = v0[6];
  if (v2)
  {
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    uint64_t v4 = v3 + 16;
    uint64_t v5 = v6;
    unint64_t v53 = (*(unsigned __int8 *)(v4 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 64);
    uint64_t v7 = v1 + v53;
    v56 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    uint64_t v60 = *(void *)(v4 + 56);
    v61 = (void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16);
    uint64_t v54 = (void (**)(void, void))(v4 - 8);
    swift_bridgeObjectRetain();
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    v57 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 40);
    id v52 = v6;
    while (1)
    {
      uint64_t v11 = v0[9];
      uint64_t v12 = v0[5];
      v5(v11, v7, v12);
      v55 = *v57;
      (*v57)(v11, 0, 1, v12);
      if ((*v56)(v11, 1, v12) == 1) {
        goto LABEL_29;
      }
      uint64_t v13 = *v61;
      (*v61)(v0[8], v0[9], v0[5]);
      unint64_t v14 = (void *)sub_21570DBE8();
      if (v14) {
        break;
      }
LABEL_5:
      (*v54)(v0[8], v0[5]);
      v7 += v60;
      if (!--v2)
      {
        v55(v0[9], 1, 1, v0[5]);
        goto LABEL_29;
      }
    }
    uint64_t v58 = v7;
    v62 = v14;
    id v15 = objc_msgSend(v14, sel_persistentIdentifier);
    uint64_t v16 = sub_21570DA68();
    unint64_t v18 = v17;

    uint64_t v59 = v2;
    if (v8[2] && (unint64_t v19 = sub_2156F5B54(v16, v18), (v20 & 1) != 0))
    {
      uint64_t v21 = v8[7] + 16 * v19;
      unint64_t v22 = *(void *)(v21 + 8);
      id v23 = *(id *)v21;
      swift_bridgeObjectRetain();
      sub_2156F5D20(v16, v18);
      id v24 = v62;
    }
    else
    {
      sub_2156F5D20(v16, v18);
      id v24 = v62;
      id v23 = v62;
      unint64_t v22 = MEMORY[0x263F8EE78];
    }
    v5(v0[7], v0[8], v0[5]);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v22 = sub_2156F58D4(0, *(void *)(v22 + 16) + 1, 1, v22, &qword_267881710, MEMORY[0x263F04D80], MEMORY[0x263F04D80]);
    }
    unint64_t v26 = *(void *)(v22 + 16);
    unint64_t v25 = *(void *)(v22 + 24);
    if (v26 >= v25 >> 1) {
      unint64_t v22 = sub_2156F58D4(v25 > 1, v26 + 1, 1, v22, &qword_267881710, MEMORY[0x263F04D80], MEMORY[0x263F04D80]);
    }
    uint64_t v27 = v0[7];
    uint64_t v28 = v0[5];
    *(void *)(v22 + 16) = v26 + 1;
    v13(v22 + v53 + v26 * v60, v27, v28);
    id v29 = objc_msgSend(v24, sel_persistentIdentifier);
    uint64_t v30 = sub_21570DA68();
    unint64_t v32 = v31;

    id v33 = v23;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v63 = v8;
    unint64_t v36 = sub_2156F5B54(v30, v32);
    uint64_t v37 = v8[2];
    BOOL v38 = (v35 & 1) == 0;
    uint64_t v39 = v37 + v38;
    if (__OFADD__(v37, v38))
    {
      __break(1u);
LABEL_36:
      __break(1u);
      return MEMORY[0x270F9FB18](v39);
    }
    char v40 = v35;
    if (v8[3] < v39)
    {
      sub_2156F6F24(v39, isUniquelyReferenced_nonNull_native);
      uint64_t v8 = v63;
      uint64_t v39 = sub_2156F5B54(v30, v32);
      if ((v40 & 1) != (v41 & 1))
      {
        uint64_t v39 = MEMORY[0x263F06F78];
        return MEMORY[0x270F9FB18](v39);
      }
      unint64_t v36 = v39;
      if ((v40 & 1) == 0) {
        goto LABEL_23;
      }
LABEL_3:
      uint64_t v9 = v8[7] + 16 * v36;
      uint64_t v10 = *(void **)v9;
      swift_bridgeObjectRelease();

      *(void *)uint64_t v9 = v33;
      *(void *)(v9 + 8) = v22;
LABEL_4:
      swift_bridgeObjectRelease();
      sub_2156F5D20(v30, v32);

      swift_bridgeObjectRelease();
      uint64_t v5 = v52;
      uint64_t v7 = v58;
      uint64_t v2 = v59;
      goto LABEL_5;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      if (v35) {
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t v39 = (uint64_t)sub_2156F7BE4();
      uint64_t v8 = v63;
      if (v40) {
        goto LABEL_3;
      }
    }
LABEL_23:
    v8[(v36 >> 6) + 8] |= 1 << v36;
    id v42 = (uint64_t *)(v8[6] + 16 * v36);
    *id v42 = v30;
    v42[1] = v32;
    uint64_t v43 = (void *)(v8[7] + 16 * v36);
    *uint64_t v43 = v33;
    v43[1] = v22;
    uint64_t v44 = v8[2];
    BOOL v45 = __OFADD__(v44, 1);
    uint64_t v46 = v44 + 1;
    if (v45) {
      goto LABEL_36;
    }
    long long v8[2] = v46;
    sub_2156F7DB4(v30, v32);
    goto LABEL_4;
  }
  uint64_t v47 = *(void (**)(void, uint64_t, uint64_t, void))(v3 + 56);
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)MEMORY[0x263F8EE80];
  v47(v0[9], 1, 1, v0[5]);
LABEL_29:
  v0[10] = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  uint64_t v48 = sub_2156F5C38((uint64_t)v8);
  swift_bridgeObjectRelease();
  uint64_t v63 = (void *)v48;
  sub_2156F5BCC((uint64_t *)&v63);
  swift_bridgeObjectRelease();
  v0[11] = v63;
  sub_21570E1A8();
  v0[12] = sub_21570E198();
  uint64_t v50 = sub_21570E168();
  return MEMORY[0x270FA2498](sub_2156F3698, v50, v49);
}

uint64_t sub_2156F3698()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(void *)(v0 + 16) = v1;
  swift_retain();
  sub_21570DD38();
  return MEMORY[0x270FA2498](sub_2156F3758, 0, 0);
}

uint64_t sub_2156F3758()
{
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2156F37DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21570DD28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2156F3850()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21570DD28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2156F38C4()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV12ExtensionKit19ExtensionPickerViewP33_ABD14ED04C699754E7718E30E84C391A5Model__containerApps;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881728);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtCV12ExtensionKit19ExtensionPickerViewP33_ABD14ED04C699754E7718E30E84C391A5Model__hostAppName;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881730);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_2156F39B0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ExtensionPickerView.Model(0);
  uint64_t result = sub_21570DD08();
  *a1 = result;
  return result;
}

uint64_t sub_2156F39F0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v34 = a1;
  char v35 = a2;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881788);
  uint64_t v2 = *(void *)(v36 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v36);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = sub_21570DDF8();
  MEMORY[0x270FA5388](v8 - 8);
  sub_21570DDE8();
  sub_21570DDD8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21570DD28();
  swift_release();
  swift_release();
  sub_21570DDC8();
  swift_bridgeObjectRelease();
  sub_21570DDD8();
  sub_21570DE18();
  uint64_t v9 = sub_21570DF68();
  uint64_t v32 = v10;
  uint64_t v33 = v9;
  char v12 = v11;
  uint64_t v37 = v13;
  unsigned __int8 v14 = sub_21570DF18();
  unsigned __int8 v15 = sub_21570DF28();
  unsigned __int8 v16 = sub_21570DF48();
  int v17 = sub_21570DF38();
  sub_21570DF38();
  if (sub_21570DF38() != v14) {
    int v17 = sub_21570DF38();
  }
  sub_21570DF38();
  if (sub_21570DF38() != v15) {
    int v17 = sub_21570DF38();
  }
  sub_21570DF38();
  uint64_t v18 = sub_21570DF38();
  if (v18 == v16)
  {
    int v31 = v17;
  }
  else
  {
    uint64_t v18 = sub_21570DF38();
    int v31 = v18;
  }
  char v19 = v12 & 1;
  MEMORY[0x270FA5388](v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881790);
  sub_2156F8B0C(&qword_267881798, &qword_267881790, (void (*)(void))sub_2156F88B4);
  uint64_t v30 = v7;
  sub_21570DF58();
  char v20 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v21 = v36;
  v20(v5, v7, v36);
  unint64_t v22 = v35;
  uint64_t v24 = v32;
  uint64_t v23 = v33;
  *char v35 = v33;
  v22[1] = v24;
  *((unsigned char *)v22 + 16) = v19;
  v22[3] = v37;
  *((unsigned char *)v22 + 32) = v31;
  *(_OWORD *)(v22 + 5) = 0u;
  *(_OWORD *)(v22 + 7) = 0u;
  *((unsigned char *)v22 + 72) = 1;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678817A8);
  v20((char *)v22 + *(int *)(v25 + 48), v5, v21);
  unint64_t v26 = (char *)v22 + *(int *)(v25 + 64);
  *(void *)unint64_t v26 = 0;
  v26[8] = 1;
  sub_2156F8908(v23, v24, v19);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v2 + 8);
  swift_bridgeObjectRetain();
  v27(v30, v21);
  v27(v5, v21);
  sub_2156F8918(v23, v24, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2156F3E24()
{
  return sub_21570E018();
}

void sub_2156F3F74(void *a1)
{
  id v1 = objc_msgSend(a1, sel_URL);
  sub_21570DA48();
}

void sub_2156F3FD0(id *a1)
{
  id v1 = objc_msgSend(*a1, sel_URL);
  sub_21570DA48();
}

uint64_t sub_2156F4030@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  *a2 = *(void *)a1;
  a2[1] = v3;
  id v4 = v2;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2156F4074@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  *(void *)a1 = sub_21570DE28();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881780);
  return sub_2156F39F0(v3, (uint64_t *)(a1 + *(int *)(v4 + 44)));
}

uint64_t sub_2156F40D0()
{
  return sub_21570E018();
}

uint64_t sub_2156F41E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_21570DC68();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v19[-v9];
  char v11 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16);
  v11(&v19[-v9], a1, v4);
  v11(v8, (uint64_t)v10, v4);
  type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(0);
  uint64_t v12 = swift_allocObject();
  v11((unsigned char *)(v12+ OBJC_IVAR____TtCV12ExtensionKitP33_ABD14ED04C699754E7718E30E84C391A16AppExtensionView30ObservableAppExtensionIdentity_inner), (uint64_t)v8, v4);
  char v13 = sub_21570DC58();
  swift_beginAccess();
  v19[7] = v13 & 1;
  sub_21570DD18();
  swift_endAccess();
  unsigned __int8 v14 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  sub_2156F8558(&qword_2678817D8, (void (*)(uint64_t))type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity);
  uint64_t v15 = sub_21570DD58();
  uint64_t v17 = v16;
  uint64_t result = ((uint64_t (*)(unsigned char *, uint64_t))v14)(v10, v4);
  *(void *)a2 = v15;
  *(void *)(a2 + 8) = v17;
  *(unsigned char *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_2156F4404@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2156F8BD8(a1);
  id v5 = objc_msgSend(a1, sel_localizedName);
  sub_21570E098();

  sub_2156F892C();
  uint64_t v6 = sub_21570DF78();
  uint64_t v8 = v7;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  char v10 = v9 & 1;
  *(void *)(a2 + 16) = v7;
  *(unsigned char *)(a2 + 24) = v9 & 1;
  *(void *)(a2 + 32) = v11;
  swift_retain();
  sub_2156F8908(v6, v8, v10);
  swift_bridgeObjectRetain();
  sub_2156F8918(v6, v8, v10);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2156F44F0()
{
  id v1 = *v0;
  uint64_t v2 = sub_21570DDB8();
  sub_2156F4404(v1, (uint64_t)&v8);
  uint64_t v3 = v8;
  char v4 = v10;
  uint64_t v5 = v11;
  long long v6 = v9;
  uint64_t v8 = v2;
  *(void *)&long long v9 = 0;
  BYTE8(v9) = 1;
  uint64_t v10 = v3;
  long long v11 = v6;
  char v12 = v4;
  uint64_t v13 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881818);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881820);
  sub_2156F8F30(&qword_267881828, &qword_267881818);
  sub_2156F8B0C(&qword_267881830, &qword_267881820, (void (*)(void))sub_2156F8B84);
  return sub_21570E028();
}

uint64_t sub_2156F461C@<X0>(char a1@<W2>, uint64_t *a2@<X8>)
{
  char v41 = a2;
  uint64_t v3 = sub_21570DDA8();
  uint64_t v46 = *(void *)(v3 - 8);
  uint64_t v47 = (char *)v3;
  MEMORY[0x270FA5388](v3);
  BOOL v45 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678817C0);
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  MEMORY[0x270FA5388](v5);
  id v42 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678817C8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  long long v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v48 = (char *)v35 - v12;
  uint64_t v13 = 0;
  if (a1) {
    uint64_t v13 = sub_2156F4C70();
  }
  uint64_t v40 = v13;
  uint64_t v49 = sub_21570DBD8();
  uint64_t v50 = v14;
  sub_2156F892C();
  uint64_t v15 = sub_21570DF78();
  uint64_t v37 = v16;
  uint64_t v38 = v15;
  uint64_t v39 = v17;
  int v36 = v18 & 1;
  sub_21570DE08();
  v35[1] = v19;
  type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(0);
  sub_2156F8558(&qword_2678817D8, (void (*)(uint64_t))type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity);
  sub_21570DD68();
  swift_getKeyPath();
  sub_21570DD78();
  swift_release();
  swift_release();
  char v20 = v42;
  sub_21570DFF8();
  uint64_t v21 = v45;
  sub_21570DD98();
  sub_2156F8F30(&qword_2678817E0, &qword_2678817C0);
  sub_2156F8558(&qword_2678817E8, MEMORY[0x263F19700]);
  uint64_t v22 = v44;
  uint64_t v23 = v47;
  sub_21570DFB8();
  (*(void (**)(char *, char *))(v46 + 8))(v21, v23);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v20, v22);
  uint64_t v24 = v48;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v48, v11, v7);
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v25(v11, v24, v7);
  unint64_t v26 = v41;
  uint64_t v28 = v38;
  uint64_t v27 = v39;
  *char v41 = v40;
  v26[1] = v28;
  uint64_t v47 = v11;
  uint64_t v29 = v7;
  uint64_t v30 = v37;
  v26[2] = v37;
  LOBYTE(v24) = v36;
  *((unsigned char *)v26 + 24) = v36;
  v26[4] = v27;
  v26[5] = 0;
  *((unsigned char *)v26 + 48) = 1;
  int v31 = (char *)v26 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2678817F0) + 80);
  uint64_t v32 = v47;
  v25(v31, v47, v29);
  swift_retain();
  sub_2156F8908(v28, v30, (char)v24);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v8 + 8);
  swift_bridgeObjectRetain();
  v33(v48, v29);
  v33(v32, v29);
  sub_2156F8918(v28, v30, (char)v24);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2156F4AF8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21570DD28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2156F4B78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21570DD38();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21570DD28();
  swift_release();
  swift_release();
  if (v1 == 1) {
    return sub_21570DC38();
  }
  else {
    return sub_21570DC48();
  }
}

uint64_t sub_2156F4C70()
{
  uint64_t v0 = sub_21570DDF8();
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = (void *)sub_21570DC08();
  id v3 = objc_msgSend(v2, sel_symbol);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v3, sel_imageForSize_scale_, 32.0, 32.0, 2.0);
    if (v5)
    {
      uint64_t v6 = v5;
      if (objc_msgSend(v5, sel_CGImage)) {
        goto LABEL_8;
      }
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
  }
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_init);
  objc_msgSend(v4, sel_setSize_, 32.0, 32.0);
  id v7 = objc_msgSend(v2, sel_prepareImageForDescriptor_, v4);
  if (v7)
  {
    uint64_t v6 = v7;
    if (objc_msgSend(v7, sel_CGImage))
    {
LABEL_8:
      objc_msgSend(v6, sel_scale);
      sub_21570DDE8();
      sub_21570DDD8();
      sub_21570DBD8();
      sub_21570DDC8();
      swift_bridgeObjectRelease();
      sub_21570DDD8();
      sub_21570DE18();
      sub_21570DF68();
      uint64_t v8 = sub_21570DFE8();

      return v8;
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_11:
  uint64_t result = sub_21570E2C8();
  __break(1u);
  return result;
}

uint64_t sub_2156F4FE0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21570DD28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2156F5054()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV12ExtensionKitP33_ABD14ED04C699754E7718E30E84C391A16AppExtensionView30ObservableAppExtensionIdentity_inner;
  uint64_t v2 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0
     + OBJC_IVAR____TtCV12ExtensionKitP33_ABD14ED04C699754E7718E30E84C391A16AppExtensionView30ObservableAppExtensionIdentity__enabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678816F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_2156F513C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(0);
  uint64_t result = sub_21570DD08();
  *a1 = result;
  return result;
}

uint64_t sub_2156F517C()
{
  return sub_21570DFC8();
}

uint64_t sub_2156F5198@<X0>(uint64_t a1@<X8>)
{
  char v3 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = sub_21570DDB8();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678817B8);
  return sub_2156F461C(v3, (uint64_t *)(a1 + *(int *)(v4 + 44)));
}

void sub_2156F51FC()
{
  id v1 = objc_msgSend(*v0, sel_URL);
  sub_21570DA48();
}

unint64_t sub_2156F525C(uint64_t a1)
{
  unint64_t result = sub_2156F5284();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2156F5284()
{
  unint64_t result = qword_267881680;
  if (!qword_267881680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881680);
  }
  return result;
}

uint64_t sub_2156F52D8(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of AppExtensionManagerScene.body>>, 1);
}

ValueMetadata *type metadata accessor for AppExtensionManagerScene()
{
  return &type metadata for AppExtensionManagerScene;
}

uint64_t sub_2156F5304()
{
  return type metadata accessor for ExtensionPickerView.Model(0);
}

uint64_t type metadata accessor for ExtensionPickerView.Model(uint64_t a1)
{
  return sub_2156F53D8(a1, (uint64_t *)&unk_267881698);
}

void sub_2156F532C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2156F5354()
{
  if (!qword_2678816B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2678816B8);
    unint64_t v0 = sub_21570DD48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2678816B0);
    }
  }
}

uint64_t sub_2156F53B0()
{
  return type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(0);
}

uint64_t type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(uint64_t a1)
{
  return sub_2156F53D8(a1, (uint64_t *)&unk_2678816D8);
}

uint64_t sub_2156F53D8(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2156F5410(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2156F5438(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), unint64_t *a5)
{
  a4(319);
  if (v6 <= 0x3F)
  {
    sub_2156F5520(319, a5);
    if (v7 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_2156F5520(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_21570DD48();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

_UNKNOWN **sub_2156F5568()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

void *initializeBufferWithCopyOfBuffer for ContainerApp(void *a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ContainerApp(id *a1)
{
  return swift_bridgeObjectRelease();
}

id *assignWithTake for ContainerApp(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ContainerApp()
{
  return &type metadata for ContainerApp;
}

uint64_t sub_2156F5644()
{
  return sub_2156F8558(&qword_2678816F0, MEMORY[0x263F06EA8]);
}

uint64_t sub_2156F568C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_2156F569C()
{
  return sub_2156F4B78();
}

uint64_t sub_2156F56C4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21570DD28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2156F5744()
{
  return sub_21570DD38();
}

uint64_t sub_2156F57C0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_21570DD28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2156F5844()
{
  return sub_21570DD38();
}

uint64_t sub_2156F58D4(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    char v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  char v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_21570E2B8();
    __break(1u);
    return result;
  }
  void v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_2156F81A8(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

unint64_t sub_2156F5B54(uint64_t a1, unint64_t a2)
{
  sub_21570E358();
  sub_21570DA78();
  uint64_t v4 = sub_21570E368();

  return sub_2156F7244(a1, a2, v4);
}

uint64_t sub_2156F5BCC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2156F8194(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_2156F5D78(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2156F5C38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881718);
  uint64_t v3 = swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * (v5 >> 4);
  uint64_t v6 = sub_2156F7F78((uint64_t)&v8, (_OWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_2156F8308();
  if (v6 != v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2156F5D20(uint64_t a1, unint64_t a2)
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

uint64_t sub_2156F5D78(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_21570E318();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_151;
    }
    if (v3) {
      return sub_2156F66DC(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_159;
  }
  uint64_t v126 = v3;
  uint64_t v121 = result;
  uint64_t v130 = v1;
  v118 = a1;
  if (v3 < 2)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    v129 = (void **)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
LABEL_116:
      uint64_t v124 = v7;
      if (v11 >= 2)
      {
        uint64_t v112 = *v118;
        do
        {
          unint64_t v113 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v112) {
            goto LABEL_158;
          }
          uint64_t v114 = *(void *)&v10[16 * v113 + 32];
          uint64_t v115 = *(void *)&v10[16 * v11 + 24];
          sub_2156F68B8((void **)(v112 + 16 * v114), (id *)(v112 + 16 * *(void *)&v10[16 * v11 + 16]), v112 + 16 * v115, v129);
          if (v130) {
            goto LABEL_128;
          }
          if (v115 < v114) {
            goto LABEL_147;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v10 = sub_2156F6F10((uint64_t)v10);
          }
          if (v113 >= *((void *)v10 + 2)) {
            goto LABEL_148;
          }
          v116 = &v10[16 * v113 + 32];
          *(void *)v116 = v114;
          *((void *)v116 + 1) = v115;
          unint64_t v117 = *((void *)v10 + 2);
          if (v11 > v117) {
            goto LABEL_149;
          }
          memmove(&v10[16 * v11 + 16], &v10[16 * v11 + 32], 16 * (v117 - v11));
          *((void *)v10 + 2) = v117 - 1;
          unint64_t v11 = v117 - 1;
        }
        while (v117 > 2);
      }
      swift_bridgeObjectRelease();
      *(void *)(v124 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_21570E138();
    *(void *)(v7 + 16) = v6;
    uint64_t v3 = v126;
    v129 = (void **)(v7 + 32);
  }
  uint64_t v124 = v7;
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v119 = *a1 - 16;
  uint64_t v120 = *a1 + 40;
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  uint64_t v131 = *a1;
  while (1)
  {
    uint64_t v12 = v8;
    uint64_t v13 = v8 + 1;
    uint64_t v127 = v8;
    if (v8 + 1 < v3)
    {
      v122 = v10;
      uint64_t v14 = *(void **)(v9 + 16 * v8);
      id v15 = *(id *)(v9 + 16 * v13);
      swift_bridgeObjectRetain();
      id v16 = v14;
      swift_bridgeObjectRetain();
      id v17 = objc_msgSend(v15, sel_localizedName);
      uint64_t v18 = sub_21570E098();
      uint64_t v20 = v19;

      id v21 = objc_msgSend(v16, sel_localizedName);
      uint64_t v22 = sub_21570E098();
      uint64_t v24 = v23;

      if (v18 == v22 && v20 == v24) {
        int v135 = 0;
      }
      else {
        int v135 = sub_21570E328();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      uint64_t v3 = v126;
      uint64_t v12 = v127;
      uint64_t v13 = v127 + 2;
      if (v127 + 2 >= v126)
      {
        uint64_t v10 = v122;
      }
      else
      {
        uint64_t v26 = v120 + 16 * v127;
        while (1)
        {
          uint64_t v132 = v13;
          uint64_t v27 = *(void **)(v26 - 24);
          id v28 = *(id *)(v26 - 8);
          swift_bridgeObjectRetain();
          id v29 = v27;
          swift_bridgeObjectRetain();
          id v30 = objc_msgSend(v28, sel_localizedName);
          uint64_t v31 = sub_21570E098();
          uint64_t v33 = v32;

          id v34 = objc_msgSend(v29, sel_localizedName);
          uint64_t v35 = sub_21570E098();
          uint64_t v37 = v36;

          BOOL v38 = v31 == v35 && v33 == v37;
          int v39 = v38 ? 0 : sub_21570E328();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          uint64_t v3 = v126;
          if ((v135 ^ v39)) {
            break;
          }
          uint64_t v13 = v132 + 1;
          v26 += 16;
          if (v126 == v132 + 1)
          {
            uint64_t v13 = v126;
            uint64_t v10 = v122;
            goto LABEL_35;
          }
        }
        uint64_t v10 = v122;
        uint64_t v13 = v132;
LABEL_35:
        uint64_t v12 = v127;
      }
      uint64_t v9 = v131;
      if (v135)
      {
        if (v13 < v12) {
          goto LABEL_152;
        }
        if (v12 < v13)
        {
          uint64_t v40 = (long long *)(v119 + 16 * v13);
          uint64_t v41 = v13;
          uint64_t v42 = v12;
          uint64_t v43 = (long long *)(v131 + 16 * v12);
          do
          {
            if (v42 != --v41)
            {
              if (!v131) {
                goto LABEL_157;
              }
              long long v44 = *v43;
              *uint64_t v43 = *v40;
              long long *v40 = v44;
            }
            ++v42;
            --v40;
            ++v43;
          }
          while (v42 < v41);
        }
      }
    }
    if (v13 < v3)
    {
      if (__OFSUB__(v13, v12)) {
        goto LABEL_150;
      }
      if (v13 - v12 < v121) {
        break;
      }
    }
LABEL_68:
    if (v13 < v12) {
      goto LABEL_145;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v10 = sub_2156F6D58(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v63 = *((void *)v10 + 2);
    unint64_t v62 = *((void *)v10 + 3);
    unint64_t v11 = v63 + 1;
    uint64_t v9 = v131;
    if (v63 >= v62 >> 1)
    {
      v111 = sub_2156F6D58((char *)(v62 > 1), v63 + 1, 1, v10);
      uint64_t v9 = v131;
      uint64_t v10 = v111;
    }
    *((void *)v10 + 2) = v11;
    uint64_t v64 = v10 + 32;
    uint64_t v65 = &v10[16 * v63 + 32];
    *(void *)uint64_t v65 = v127;
    *((void *)v65 + 1) = v13;
    uint64_t v134 = v13;
    if (v63)
    {
      while (1)
      {
        unint64_t v66 = v11 - 1;
        if (v11 >= 4)
        {
          v71 = &v64[16 * v11];
          uint64_t v72 = *((void *)v71 - 8);
          uint64_t v73 = *((void *)v71 - 7);
          BOOL v77 = __OFSUB__(v73, v72);
          uint64_t v74 = v73 - v72;
          if (v77) {
            goto LABEL_134;
          }
          uint64_t v76 = *((void *)v71 - 6);
          uint64_t v75 = *((void *)v71 - 5);
          BOOL v77 = __OFSUB__(v75, v76);
          uint64_t v69 = v75 - v76;
          char v70 = v77;
          if (v77) {
            goto LABEL_135;
          }
          unint64_t v78 = v11 - 2;
          v79 = &v64[16 * v11 - 32];
          uint64_t v81 = *(void *)v79;
          uint64_t v80 = *((void *)v79 + 1);
          BOOL v77 = __OFSUB__(v80, v81);
          uint64_t v82 = v80 - v81;
          if (v77) {
            goto LABEL_137;
          }
          BOOL v77 = __OFADD__(v69, v82);
          uint64_t v83 = v69 + v82;
          if (v77) {
            goto LABEL_140;
          }
          if (v83 >= v74)
          {
            v101 = &v64[16 * v66];
            uint64_t v103 = *(void *)v101;
            uint64_t v102 = *((void *)v101 + 1);
            BOOL v77 = __OFSUB__(v102, v103);
            uint64_t v104 = v102 - v103;
            if (v77) {
              goto LABEL_144;
            }
            BOOL v94 = v69 < v104;
            goto LABEL_105;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v95 = *((void *)v10 + 4);
            uint64_t v96 = *((void *)v10 + 5);
            BOOL v77 = __OFSUB__(v96, v95);
            uint64_t v88 = v96 - v95;
            char v89 = v77;
            goto LABEL_99;
          }
          uint64_t v68 = *((void *)v10 + 4);
          uint64_t v67 = *((void *)v10 + 5);
          BOOL v77 = __OFSUB__(v67, v68);
          uint64_t v69 = v67 - v68;
          char v70 = v77;
        }
        if (v70) {
          goto LABEL_136;
        }
        unint64_t v78 = v11 - 2;
        v84 = &v64[16 * v11 - 32];
        uint64_t v86 = *(void *)v84;
        uint64_t v85 = *((void *)v84 + 1);
        BOOL v87 = __OFSUB__(v85, v86);
        uint64_t v88 = v85 - v86;
        char v89 = v87;
        if (v87) {
          goto LABEL_139;
        }
        v90 = &v64[16 * v66];
        uint64_t v92 = *(void *)v90;
        uint64_t v91 = *((void *)v90 + 1);
        BOOL v77 = __OFSUB__(v91, v92);
        uint64_t v93 = v91 - v92;
        if (v77) {
          goto LABEL_142;
        }
        if (__OFADD__(v88, v93)) {
          goto LABEL_143;
        }
        if (v88 + v93 >= v69)
        {
          BOOL v94 = v69 < v93;
LABEL_105:
          if (v94) {
            unint64_t v66 = v78;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v89) {
          goto LABEL_138;
        }
        v97 = &v64[16 * v66];
        uint64_t v99 = *(void *)v97;
        uint64_t v98 = *((void *)v97 + 1);
        BOOL v77 = __OFSUB__(v98, v99);
        uint64_t v100 = v98 - v99;
        if (v77) {
          goto LABEL_141;
        }
        if (v100 < v88) {
          goto LABEL_14;
        }
LABEL_107:
        unint64_t v105 = v66 - 1;
        if (v66 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9) {
          goto LABEL_156;
        }
        v106 = &v64[16 * v105];
        uint64_t v107 = *(void *)v106;
        v108 = &v64[16 * v66];
        uint64_t v109 = *((void *)v108 + 1);
        sub_2156F68B8((void **)(v9 + 16 * *(void *)v106), (id *)(v9 + 16 * *(void *)v108), v9 + 16 * v109, v129);
        if (v130)
        {
LABEL_128:
          swift_bridgeObjectRelease();
          *(void *)(v124 + 16) = 0;
          return swift_bridgeObjectRelease();
        }
        if (v109 < v107) {
          goto LABEL_131;
        }
        if (v66 > *((void *)v10 + 2)) {
          goto LABEL_132;
        }
        *(void *)v106 = v107;
        *(void *)&v64[16 * v105 + 8] = v109;
        unint64_t v110 = *((void *)v10 + 2);
        if (v66 >= v110) {
          goto LABEL_133;
        }
        uint64_t v130 = 0;
        unint64_t v11 = v110 - 1;
        memmove(&v64[16 * v66], v108 + 16, 16 * (v110 - 1 - v66));
        *((void *)v10 + 2) = v110 - 1;
        uint64_t v9 = v131;
        if (v110 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_14:
    uint64_t v3 = v126;
    uint64_t v8 = v134;
    uint64_t v7 = v124;
    if (v134 >= v126) {
      goto LABEL_116;
    }
  }
  if (__OFADD__(v12, v121)) {
    goto LABEL_153;
  }
  if (v12 + v121 >= v3) {
    uint64_t v45 = v3;
  }
  else {
    uint64_t v45 = v12 + v121;
  }
  if (v45 >= v12)
  {
    if (v13 != v45)
    {
      v123 = v10;
      uint64_t v46 = v119 + 16 * v13;
      uint64_t v125 = v45;
      do
      {
        long long v48 = *(_OWORD *)(v9 + 16 * v13);
        uint64_t v128 = v46;
        uint64_t v133 = v13;
        while (1)
        {
          uint64_t v136 = v12;
          uint64_t v49 = *(void **)v46;
          id v50 = (id)v48;
          swift_bridgeObjectRetain();
          id v51 = v49;
          swift_bridgeObjectRetain();
          id v52 = objc_msgSend(v50, sel_localizedName);
          uint64_t v53 = sub_21570E098();
          uint64_t v55 = v54;

          id v56 = objc_msgSend(v51, sel_localizedName);
          uint64_t v57 = sub_21570E098();
          uint64_t v59 = v58;

          if (v53 == v57 && v55 == v59) {
            break;
          }
          char v61 = sub_21570E328();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v61 & 1) == 0) {
            goto LABEL_56;
          }
          uint64_t v9 = v131;
          uint64_t v47 = v133;
          if (!v131) {
            goto LABEL_155;
          }
          long long v48 = *(_OWORD *)(v46 + 16);
          *(_OWORD *)(v46 + 16) = *(_OWORD *)v46;
          *(_OWORD *)uint64_t v46 = v48;
          v46 -= 16;
          uint64_t v12 = v136 + 1;
          if (v133 == v136 + 1) {
            goto LABEL_57;
          }
        }
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
LABEL_56:
        uint64_t v9 = v131;
        uint64_t v47 = v133;
LABEL_57:
        uint64_t v13 = v47 + 1;
        uint64_t v12 = v127;
        uint64_t v46 = v128 + 16;
      }
      while (v13 != v125);
      uint64_t v13 = v125;
      uint64_t v10 = v123;
    }
    goto LABEL_68;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  uint64_t result = sub_21570E2B8();
  __break(1u);
  return result;
}

uint64_t sub_2156F66DC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v21 = result;
  if (a3 != a2)
  {
    uint64_t v23 = *a4;
    uint64_t v4 = *a4 + 16 * a3 - 16;
LABEL_6:
    long long v6 = *(_OWORD *)(v23 + 16 * a3);
    uint64_t v25 = v21;
    uint64_t v22 = v4;
    uint64_t v24 = a3;
    while (1)
    {
      uint64_t v7 = *(void **)v4;
      id v8 = (id)v6;
      swift_bridgeObjectRetain();
      id v9 = v7;
      swift_bridgeObjectRetain();
      id v10 = objc_msgSend(v8, sel_localizedName);
      uint64_t v11 = sub_21570E098();
      uint64_t v13 = v12;

      id v14 = objc_msgSend(v9, sel_localizedName);
      uint64_t v15 = sub_21570E098();
      uint64_t v17 = v16;

      if (v11 == v15 && v13 == v17)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease_n();
        uint64_t v5 = v24;
LABEL_5:
        a3 = v5 + 1;
        uint64_t v4 = v22 + 16;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_6;
      }
      char v19 = sub_21570E328();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = v24;
      if ((v19 & 1) == 0) {
        goto LABEL_5;
      }
      if (!v23) {
        break;
      }
      long long v6 = *(_OWORD *)(v4 + 16);
      *(_OWORD *)(v4 + 16) = *(_OWORD *)v4;
      *(_OWORD *)uint64_t v4 = v6;
      v4 -= 16;
      if (v24 == ++v25) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2156F68B8(void **__src, id *a2, unint64_t a3, void **__dst)
{
  uint64_t v4 = __dst;
  uint64_t v5 = a2;
  long long v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v8 = (char *)a2 - (char *)__src;
  }
  uint64_t v9 = v8 >> 4;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 4;
  uint64_t v59 = __src;
  uint64_t v58 = __dst;
  if (v9 >= v11 >> 4)
  {
    if (v10 < -15) {
      goto LABEL_56;
    }
    if (__dst != a2 || &a2[2 * v12] <= __dst) {
      memmove(__dst, a2, 16 * v12);
    }
    id v28 = &v4[2 * v12];
    uint64_t v57 = v28;
    uint64_t v59 = v5;
    if (v6 >= v5 || v10 < 16)
    {
LABEL_55:
      sub_2156F6E54((void **)&v59, (const void **)&v58, &v57);
      return 1;
    }
    id v29 = (id *)(a3 - 16);
    id v30 = v5;
    uint64_t v53 = v6;
    uint64_t v55 = v4;
    while (1)
    {
      id v56 = v5;
      unint64_t v51 = (unint64_t)v28;
      uint64_t v31 = v28 - 2;
      uint64_t v32 = *(v30 - 2);
      v30 -= 2;
      id v33 = *(v28 - 2);
      swift_bridgeObjectRetain();
      id v34 = v32;
      swift_bridgeObjectRetain();
      long long v48 = v33;
      id v35 = objc_msgSend(v33, sel_localizedName);
      uint64_t v36 = sub_21570E098();
      uint64_t v38 = v37;

      id v39 = objc_msgSend(v34, sel_localizedName);
      uint64_t v40 = sub_21570E098();
      uint64_t v42 = v41;

      BOOL v43 = v36 == v40 && v38 == v42;
      char v44 = v43 ? 0 : sub_21570E328();
      uint64_t v45 = v29 + 2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if (v44) {
        break;
      }
      uint64_t v57 = v31;
      if ((unint64_t)v45 < v51 || (unint64_t)v29 >= v51)
      {
        *(_OWORD *)id v29 = *(_OWORD *)v31;
        id v30 = v56;
        id v28 = v31;
        goto LABEL_53;
      }
      id v30 = v56;
      if (v45 != (id *)v51) {
        *(_OWORD *)id v29 = *(_OWORD *)v31;
      }
      id v28 = v31;
      uint64_t v46 = v55;
      if (v56 <= v53) {
        goto LABEL_55;
      }
LABEL_54:
      v29 -= 2;
      uint64_t v5 = v30;
      if (v28 <= v46) {
        goto LABEL_55;
      }
    }
    id v28 = (void **)v51;
    if (v45 != v56 || v29 >= v56) {
      *(_OWORD *)id v29 = *(_OWORD *)v30;
    }
    uint64_t v59 = v30;
LABEL_53:
    uint64_t v46 = v55;
    if (v30 <= v53) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  if (v7 >= -15)
  {
    if (__dst != __src || &__src[2 * v9] <= __dst) {
      memmove(__dst, __src, 16 * v9);
    }
    uint64_t v49 = &v4[2 * v9];
    uint64_t v57 = v49;
    if ((unint64_t)v5 < a3 && v7 >= 16)
    {
      while (1)
      {
        id v52 = v6;
        uint64_t v54 = v4;
        uint64_t v13 = *v4;
        id v14 = *v5;
        swift_bridgeObjectRetain();
        id v15 = v13;
        swift_bridgeObjectRetain();
        id v16 = objc_msgSend(v14, sel_localizedName);
        uint64_t v17 = sub_21570E098();
        uint64_t v19 = v18;

        id v20 = objc_msgSend(v15, sel_localizedName);
        uint64_t v21 = sub_21570E098();
        uint64_t v23 = v22;

        if (v17 == v21 && v19 == v23) {
          break;
        }
        char v25 = sub_21570E328();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v25 & 1) == 0) {
          goto LABEL_22;
        }
        uint64_t v4 = v54;
        uint64_t v26 = v5 + 2;
        uint64_t v27 = v52;
        if (v52 < v5 || v52 >= v26 || v52 != v5) {
          *(_OWORD *)id v52 = *(_OWORD *)v5;
        }
LABEL_25:
        long long v6 = v27 + 2;
        if (v4 < v49)
        {
          uint64_t v5 = v26;
          if ((unint64_t)v26 < a3) {
            continue;
          }
        }
        uint64_t v59 = v6;
        goto LABEL_55;
      }
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
LABEL_22:
      uint64_t v27 = v52;
      uint64_t v26 = v5;
      if (v52 != v54) {
        *(_OWORD *)id v52 = *(_OWORD *)v54;
      }
      uint64_t v4 = v54 + 2;
      uint64_t v58 = v54 + 2;
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_56:
  uint64_t result = sub_21570E2F8();
  __break(1u);
  return result;
}

char *sub_2156F6D58(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267881720);
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
  uint64_t v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2156F6E54(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_21570E2F8();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_2156F6F10(uint64_t a1)
{
  return sub_2156F6D58(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2156F6F24(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881708);
  uint64_t v6 = sub_21570E2E8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v23 = v22 | (v15 << 6);
      }
      else
      {
        int64_t v24 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v24 >= v12) {
          goto LABEL_33;
        }
        unint64_t v25 = v9[v24];
        ++v15;
        if (!v25)
        {
          int64_t v15 = v24 + 1;
          if (v24 + 1 >= v12) {
            goto LABEL_33;
          }
          unint64_t v25 = v9[v15];
          if (!v25)
          {
            int64_t v26 = v24 + 2;
            if (v26 >= v12)
            {
LABEL_33:
              swift_release();
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
              if (v34 >= 64) {
                bzero((void *)(v5 + 64), ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v9 = -1 << v34;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v25 = v9[v26];
            if (!v25)
            {
              while (1)
              {
                int64_t v15 = v26 + 1;
                if (__OFADD__(v26, 1)) {
                  goto LABEL_42;
                }
                if (v15 >= v12) {
                  goto LABEL_33;
                }
                unint64_t v25 = v9[v15];
                ++v26;
                if (v25) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v15 = v26;
          }
        }
LABEL_30:
        unint64_t v11 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }
      uint64_t v31 = 16 * v23;
      long long v32 = *(_OWORD *)(*(void *)(v5 + 48) + v31);
      long long v35 = *(_OWORD *)(*(void *)(v5 + 56) + v31);
      long long v36 = v32;
      if ((a2 & 1) == 0)
      {
        sub_2156F7DB4(v32, *((unint64_t *)&v32 + 1));
        id v33 = (id)v35;
        swift_bridgeObjectRetain();
      }
      sub_21570E358();
      sub_21570DA78();
      uint64_t result = sub_21570E368();
      uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
        long long v20 = v36;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v16) >> 6;
        long long v20 = v36;
        do
        {
          if (++v18 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v29 = v18 == v28;
          if (v18 == v28) {
            unint64_t v18 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v13 + 8 * v18);
        }
        while (v30 == -1);
        unint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
      }
      *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t v21 = 16 * v19;
      *(_OWORD *)(*(void *)(v7 + 48) + v21) = v20;
      *(_OWORD *)(*(void *)(v7 + 56) + v21) = v35;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2156F7244(uint64_t a1, unint64_t a2, uint64_t a3)
{
  __s1[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v7 = v3;
    unint64_t v8 = a2;
    uint64_t v10 = ~v5;
    unint64_t v80 = HIDWORD(a1);
    size_t v85 = HIDWORD(a1) - (int)a1;
    uint64_t v86 = ~v5;
    BOOL v11 = __OFSUB__(HIDWORD(a1), a1);
    BOOL v84 = v11;
    unint64_t v87 = a2 >> 62;
    uint64_t v82 = v3 + 64;
    uint64_t v83 = (int)a1;
    uint64_t v81 = a1 >> 32;
    uint64_t v78 = (a1 >> 32) - (int)a1;
    unint64_t v88 = a2 >> 62;
    size_t __n = BYTE6(a2);
    while (1)
    {
      int64_t v12 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v6);
      uint64_t v14 = *v12;
      unint64_t v13 = v12[1];
      uint64_t v15 = 0;
      switch(v13 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v14), v14))
          {
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
          }
          uint64_t v15 = HIDWORD(v14) - (int)v14;
LABEL_14:
          sub_2156F7DB4(v14, v13);
          break;
        case 2uLL:
          uint64_t v17 = *(void *)(v14 + 16);
          uint64_t v16 = *(void *)(v14 + 24);
          uint64_t v15 = v16 - v17;
          if (!__OFSUB__(v16, v17)) {
            goto LABEL_14;
          }
          goto LABEL_121;
        case 3uLL:
          break;
        default:
          uint64_t v15 = BYTE6(v13);
          break;
      }
      size_t v18 = __n;
      switch(v88)
      {
        case 1uLL:
          size_t v18 = v85;
          if (v84) {
            goto LABEL_122;
          }
          goto LABEL_19;
        case 2uLL:
          uint64_t v20 = *(void *)(a1 + 16);
          uint64_t v19 = *(void *)(a1 + 24);
          BOOL v21 = __OFSUB__(v19, v20);
          size_t v18 = v19 - v20;
          if (!v21) {
            goto LABEL_19;
          }
          goto LABEL_123;
        case 3uLL:
          if (v15) {
            goto LABEL_7;
          }
          goto LABEL_118;
        default:
LABEL_19:
          if (v15 == v18)
          {
            if (v15 < 1)
            {
LABEL_118:
              sub_2156F5D20(v14, v13);
              return v6;
            }
            switch(v13 >> 62)
            {
              case 1uLL:
                if ((int)v14 > v14 >> 32) {
                  goto LABEL_124;
                }
                uint64_t v26 = sub_21570D9D8();
                if (v26)
                {
                  uint64_t v27 = v26;
                  uint64_t v28 = sub_21570D9F8();
                  if (__OFSUB__((int)v14, v28)) {
                    goto LABEL_126;
                  }
                  BOOL v29 = (const void *)(v27 + (int)v14 - v28);
                }
                else
                {
                  BOOL v29 = 0;
                }
                sub_21570D9E8();
                uint64_t v10 = v86;
                if (!v87)
                {
                  LOWORD(__s1[0]) = a1;
                  BYTE2(__s1[0]) = BYTE2(a1);
                  BYTE3(__s1[0]) = BYTE3(a1);
                  BYTE4(__s1[0]) = v80;
                  BYTE5(__s1[0]) = BYTE5(a1);
                  BYTE6(__s1[0]) = BYTE6(a1);
                  HIBYTE(__s1[0]) = HIBYTE(a1);
                  LOWORD(__s1[1]) = v8;
                  BYTE2(__s1[1]) = BYTE2(v8);
                  BYTE3(__s1[1]) = BYTE3(v8);
                  BYTE4(__s1[1]) = BYTE4(v8);
                  BYTE5(__s1[1]) = BYTE5(v8);
                  if (!v29) {
                    goto LABEL_154;
                  }
                  int v50 = memcmp(v29, __s1, __n);
LABEL_102:
                  sub_2156F5D20(v14, v13);
                  uint64_t v4 = v82;
                  if (!v50) {
                    return v6;
                  }
                  break;
                }
                if (v87 == 1)
                {
                  if (v81 < v83) {
                    goto LABEL_135;
                  }
                  swift_retain();
                  uint64_t v46 = (char *)sub_21570D9D8();
                  if (v46)
                  {
                    uint64_t v47 = sub_21570D9F8();
                    if (__OFSUB__(v83, v47)) {
                      goto LABEL_142;
                    }
                    v46 += v83 - v47;
                  }
                  uint64_t v48 = sub_21570D9E8();
                  size_t v49 = v78;
                  if (v48 < v78) {
                    size_t v49 = v48;
                  }
                  if (!v29) {
                    goto LABEL_147;
                  }
                  if (!v46) {
                    goto LABEL_148;
                  }
                  int v50 = memcmp(v29, v46, v49);
                  sub_2156F5D20(a1, v8);
                  goto LABEL_102;
                }
                uint64_t v68 = *(void *)(a1 + 16);
                uint64_t v77 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                uint64_t v69 = sub_21570D9D8();
                if (v69)
                {
                  uint64_t v70 = v69;
                  uint64_t v71 = sub_21570D9F8();
                  if (__OFSUB__(v68, v71)) {
                    goto LABEL_141;
                  }
                  uint64_t v72 = (const void *)(v70 + v68 - v71);
                }
                else
                {
                  uint64_t v72 = 0;
                }
                if (__OFSUB__(v77, v68)) {
                  goto LABEL_136;
                }
                uint64_t v73 = sub_21570D9E8();
                if (v73 >= v77 - v68) {
                  size_t v74 = v77 - v68;
                }
                else {
                  size_t v74 = v73;
                }
                if (!v29) {
                  goto LABEL_155;
                }
                unint64_t v8 = a2;
                if (!v72) {
                  goto LABEL_156;
                }
                int v45 = memcmp(v29, v72, v74);
LABEL_115:
                swift_release();
                swift_release();
                sub_2156F5D20(v14, v13);
                uint64_t v4 = v82;
                uint64_t v10 = v86;
                if (!v45) {
                  return v6;
                }
                break;
              case 2uLL:
                uint64_t v30 = *(void *)(v14 + 16);
                swift_retain();
                swift_retain();
                uint64_t v31 = sub_21570D9D8();
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = sub_21570D9F8();
                  if (__OFSUB__(v30, v33)) {
                    goto LABEL_125;
                  }
                  uint64_t v34 = (const void *)(v32 + v30 - v33);
                }
                else
                {
                  uint64_t v34 = 0;
                }
                sub_21570D9E8();
                if (v87)
                {
                  if (v87 == 1)
                  {
                    if (v81 < v83) {
                      goto LABEL_129;
                    }
                    swift_retain();
                    uint64_t v41 = (char *)sub_21570D9D8();
                    if (v41)
                    {
                      uint64_t v42 = sub_21570D9F8();
                      if (__OFSUB__(v83, v42)) {
                        goto LABEL_140;
                      }
                      v41 += v83 - v42;
                    }
                    uint64_t v43 = sub_21570D9E8();
                    size_t v44 = v78;
                    if (v43 < v78) {
                      size_t v44 = v43;
                    }
                    if (!v34) {
                      goto LABEL_145;
                    }
                    if (!v41) {
                      goto LABEL_146;
                    }
                    int v45 = memcmp(v34, v41, v44);
                    sub_2156F5D20(a1, v8);
                  }
                  else
                  {
                    uint64_t v62 = *(void *)(a1 + 16);
                    uint64_t v76 = *(void *)(a1 + 24);
                    swift_retain();
                    swift_retain();
                    unint64_t v63 = (char *)sub_21570D9D8();
                    if (v63)
                    {
                      uint64_t v64 = sub_21570D9F8();
                      if (__OFSUB__(v62, v64)) {
                        goto LABEL_139;
                      }
                      v63 += v62 - v64;
                    }
                    BOOL v21 = __OFSUB__(v76, v62);
                    int64_t v65 = v76 - v62;
                    if (v21) {
                      goto LABEL_134;
                    }
                    uint64_t v66 = sub_21570D9E8();
                    if (v66 >= v65) {
                      size_t v67 = v65;
                    }
                    else {
                      size_t v67 = v66;
                    }
                    if (!v34) {
                      goto LABEL_152;
                    }
                    unint64_t v8 = a2;
                    if (!v63) {
                      goto LABEL_153;
                    }
                    int v45 = memcmp(v34, v63, v67);
                    swift_release();
                    swift_release();
                  }
                }
                else
                {
                  LOWORD(__s1[0]) = a1;
                  BYTE2(__s1[0]) = BYTE2(a1);
                  BYTE3(__s1[0]) = BYTE3(a1);
                  BYTE4(__s1[0]) = v80;
                  BYTE5(__s1[0]) = BYTE5(a1);
                  BYTE6(__s1[0]) = BYTE6(a1);
                  HIBYTE(__s1[0]) = HIBYTE(a1);
                  LOWORD(__s1[1]) = v8;
                  BYTE2(__s1[1]) = BYTE2(v8);
                  BYTE3(__s1[1]) = BYTE3(v8);
                  BYTE4(__s1[1]) = BYTE4(v8);
                  BYTE5(__s1[1]) = BYTE5(v8);
                  if (!v34) {
                    goto LABEL_151;
                  }
                  int v45 = memcmp(v34, __s1, __n);
                }
                goto LABEL_115;
              case 3uLL:
                memset(__s1, 0, 14);
                if (!v87) {
                  goto LABEL_46;
                }
                if (v87 == 1)
                {
                  if (v81 < v83) {
                    goto LABEL_128;
                  }
                  swift_retain();
                  uint64_t v35 = sub_21570D9D8();
                  if (!v35) {
                    goto LABEL_144;
                  }
                  uint64_t v23 = v35;
                  uint64_t v36 = sub_21570D9F8();
                  uint64_t v25 = v83 - v36;
                  if (__OFSUB__(v83, v36)) {
                    goto LABEL_133;
                  }
LABEL_41:
                  uint64_t v37 = sub_21570D9E8();
                  if (v37 >= v78) {
                    size_t v38 = v78;
                  }
                  else {
                    size_t v38 = v37;
                  }
                  int v39 = memcmp(__s1, (const void *)(v23 + v25), v38);
                  sub_2156F5D20(a1, v8);
                  sub_2156F5D20(v14, v13);
                  uint64_t v10 = v86;
                  if (!v39) {
                    return v6;
                  }
                }
                else
                {
                  uint64_t v57 = *(void *)(a1 + 16);
                  uint64_t v58 = *(void *)(a1 + 24);
                  swift_retain();
                  swift_retain();
                  uint64_t v53 = (char *)sub_21570D9D8();
                  if (v53)
                  {
                    uint64_t v59 = sub_21570D9F8();
                    if (__OFSUB__(v57, v59)) {
                      goto LABEL_138;
                    }
                    v53 += v57 - v59;
                  }
                  BOOL v21 = __OFSUB__(v58, v57);
                  int64_t v55 = v58 - v57;
                  if (v21) {
                    goto LABEL_131;
                  }
                  uint64_t v56 = sub_21570D9E8();
                  if (!v53) {
                    goto LABEL_150;
                  }
LABEL_83:
                  if (v56 >= v55) {
                    size_t v60 = v55;
                  }
                  else {
                    size_t v60 = v56;
                  }
                  int v61 = memcmp(__s1, v53, v60);
                  swift_release();
                  swift_release();
                  sub_2156F5D20(v14, v13);
                  unint64_t v8 = a2;
                  uint64_t v10 = v86;
                  if (!v61) {
                    return v6;
                  }
                }
                break;
              default:
                __s1[0] = v14;
                LOWORD(__s1[1]) = v13;
                BYTE2(__s1[1]) = BYTE2(v13);
                BYTE3(__s1[1]) = BYTE3(v13);
                BYTE4(__s1[1]) = BYTE4(v13);
                BYTE5(__s1[1]) = BYTE5(v13);
                if (!v87)
                {
LABEL_46:
                  __int16 __s2 = a1;
                  char v91 = BYTE2(a1);
                  char v92 = BYTE3(a1);
                  char v93 = v80;
                  char v94 = BYTE5(a1);
                  char v95 = BYTE6(a1);
                  char v96 = HIBYTE(a1);
                  __int16 v97 = v8;
                  char v98 = BYTE2(v8);
                  char v99 = BYTE3(v8);
                  char v100 = BYTE4(v8);
                  char v101 = BYTE5(v8);
                  int v40 = memcmp(__s1, &__s2, __n);
                  sub_2156F5D20(v14, v13);
                  if (!v40) {
                    return v6;
                  }
                  break;
                }
                if (v87 == 1)
                {
                  if (v81 < v83) {
                    goto LABEL_127;
                  }
                  swift_retain();
                  uint64_t v22 = sub_21570D9D8();
                  if (!v22)
                  {
                    sub_21570D9E8();
                    __break(1u);
LABEL_144:
                    sub_21570D9E8();
                    __break(1u);
LABEL_145:
                    __break(1u);
LABEL_146:
                    __break(1u);
LABEL_147:
                    __break(1u);
LABEL_148:
                    __break(1u);
LABEL_149:
                    __break(1u);
LABEL_150:
                    __break(1u);
LABEL_151:
                    __break(1u);
LABEL_152:
                    __break(1u);
LABEL_153:
                    __break(1u);
LABEL_154:
                    __break(1u);
LABEL_155:
                    __break(1u);
LABEL_156:
                    __break(1u);
                    JUMPOUT(0x2156F7BB4);
                  }
                  uint64_t v23 = v22;
                  uint64_t v24 = sub_21570D9F8();
                  uint64_t v25 = v83 - v24;
                  if (__OFSUB__(v83, v24)) {
                    goto LABEL_132;
                  }
                  goto LABEL_41;
                }
                uint64_t v51 = *(void *)(a1 + 16);
                uint64_t v52 = *(void *)(a1 + 24);
                swift_retain();
                swift_retain();
                uint64_t v53 = (char *)sub_21570D9D8();
                if (v53)
                {
                  uint64_t v54 = sub_21570D9F8();
                  if (__OFSUB__(v51, v54)) {
                    goto LABEL_137;
                  }
                  v53 += v51 - v54;
                }
                BOOL v21 = __OFSUB__(v52, v51);
                int64_t v55 = v52 - v51;
                if (v21) {
                  goto LABEL_130;
                }
                uint64_t v56 = sub_21570D9E8();
                if (!v53) {
                  goto LABEL_149;
                }
                goto LABEL_83;
            }
          }
          else
          {
LABEL_7:
            sub_2156F5D20(v14, v13);
          }
          unint64_t v6 = (v6 + 1) & v10;
          if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
            return v6;
          }
          break;
      }
    }
  }
  return v6;
}

void *sub_2156F7BE4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881708);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21570E2D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    long long v17 = *(_OWORD *)(*(void *)(v2 + 48) + v16);
    long long v22 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    *(_OWORD *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v22;
    sub_2156F7DB4(v17, *((unint64_t *)&v17 + 1));
    id v18 = (id)v22;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2156F7DB4(uint64_t a1, unint64_t a2)
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

uint64_t sub_2156F7E0C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267881718);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_21570E2F8();
  __break(1u);
  return result;
}

uint64_t sub_2156F7F78(uint64_t result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_39:
    void *v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  uint64_t v23 = -1 << *(unsigned char *)(a4 + 32);
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    long long v20 = *(_OWORD *)(*(void *)(a4 + 56) + 16 * v16);
    _OWORD *v11 = v20;
    if (v13 == v10)
    {
      id v22 = (id)v20;
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    id v21 = (id)v20;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        unint64_t v9 = 0;
        int64_t v12 = v17;
      }
      else
      {
        unint64_t v18 = *(void *)(v6 + 8 * v12);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          int64_t v17 = v19;
          goto LABEL_18;
        }
        int64_t v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          unint64_t v18 = *(void *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            int64_t v17 = v12;
            goto LABEL_18;
          }
          int64_t v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            unint64_t v9 = 0;
            goto LABEL_37;
          }
          unint64_t v18 = *(void *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v17 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_42;
              }
              if (v17 >= v14)
              {
                unint64_t v9 = 0;
                int64_t v12 = v14 - 1;
                goto LABEL_37;
              }
              unint64_t v18 = *(void *)(v6 + 8 * v17);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v9 = 0;
        int64_t v12 = v17 + 2;
      }
LABEL_37:
      uint64_t v10 = v13;
LABEL_38:
      uint64_t v7 = v23;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2156F8194(uint64_t a1)
{
  return sub_2156F7E0C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2156F81A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_21570E2F8();
  __break(1u);
  return result;
}

uint64_t sub_2156F8308()
{
  return swift_release();
}

uint64_t sub_2156F8310()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2156F8350(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2156F8404;
  return sub_2156F1E90(a1, v4, v5, v6);
}

uint64_t sub_2156F8404()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2156F84F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881738);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2156F8558(unint64_t *a1, void (*a2)(uint64_t))
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

_OWORD *sub_2156F85A0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *initializeBufferWithCopyOfBuffer for _ViewConfigurationGroup(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

void *assignWithCopy for ExtensionPickerView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for ExtensionPickerView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Role(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Role(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionPickerView()
{
  return &type metadata for ExtensionPickerView;
}

uint64_t destroy for _ViewConfigurationGroup()
{
  return swift_release();
}

uint64_t _s12ExtensionKit16AppExtensionViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AppExtensionView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppExtensionView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppExtensionView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppExtensionView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppExtensionView()
{
  return &type metadata for AppExtensionView;
}

uint64_t sub_2156F8874(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_215715F8C, 1);
}

uint64_t sub_2156F8890(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_215715F64, 1);
}

uint64_t sub_2156F88AC()
{
  return sub_2156F3E24();
}

unint64_t sub_2156F88B4()
{
  unint64_t result = qword_2678817A0;
  if (!qword_2678817A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2678817A0);
  }
  return result;
}

uint64_t sub_2156F8908(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2156F8918(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_2156F892C()
{
  unint64_t result = qword_2678817D0;
  if (!qword_2678817D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2678817D0);
  }
  return result;
}

uint64_t _s12ExtensionKit12ContainerAppVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ViewConfigurationGroup(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for _ViewConfigurationGroup(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContainerAppView()
{
  return &type metadata for ContainerAppView;
}

uint64_t sub_2156F8A70()
{
  return sub_2156F8F30(&qword_2678817F8, &qword_267881800);
}

uint64_t sub_2156F8AAC()
{
  return sub_2156F8F30(&qword_267881808, &qword_267881810);
}

uint64_t sub_2156F8AE8(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &unk_215715FB4, 1);
}

uint64_t sub_2156F8B04()
{
  return sub_2156F40D0();
}

uint64_t sub_2156F8B0C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2156F8B84()
{
  unint64_t result = qword_267881838;
  if (!qword_267881838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881838);
  }
  return result;
}

uint64_t sub_2156F8BD8(void *a1)
{
  uint64_t v2 = sub_21570DDF8();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_21570DA58();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(a1, sel_URL);
  sub_21570DA48();

  id v8 = objc_allocWithZone(MEMORY[0x263F4B540]);
  uint64_t v9 = (void *)sub_21570DA38();
  id v10 = objc_msgSend(v8, sel_initWithURL_, v9);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F4B558]), sel_init);
  objc_msgSend(v11, sel_setSize_, 32.0, 32.0);
  id v12 = objc_msgSend(v10, sel_prepareImageForDescriptor_, v11);
  if (v12)
  {
    unint64_t v13 = v12;
    if (objc_msgSend(v12, sel_CGImage))
    {
      objc_msgSend(v13, sel_scale);
      sub_21570DDE8();
      sub_21570DDD8();
      id v14 = objc_msgSend(a1, sel_localizedName);
      sub_21570E098();

      sub_21570DDC8();
      swift_bridgeObjectRelease();
      sub_21570DDD8();
      sub_21570DE18();
      sub_21570DF68();
      uint64_t v15 = sub_21570DFE8();

      return v15;
    }
    __break(1u);
  }
  uint64_t result = sub_21570E2C8();
  __break(1u);
  return result;
}

uint64_t sub_2156F8F0C()
{
  return sub_21570DBF8();
}

uint64_t sub_2156F8F30(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2156F8F78()
{
  unint64_t result = qword_267881858;
  if (!qword_267881858)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267881860);
    sub_2156F8F30(&qword_267881828, &qword_267881818);
    sub_2156F8B0C(&qword_267881830, &qword_267881820, (void (*)(void))sub_2156F8B84);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881858);
  }
  return result;
}

uint64_t static AppExtension<>.main()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](a1);
  id v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v7 = sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  id v8 = sub_21570E238();
  os_log_type_t v9 = v7;
  id v10 = &selRef_initWithHostViewController_;
  if (os_log_type_enabled(v8, v7))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = v4;
    unint64_t v13 = (void *)v12;
    v20[2] = a2;
    *(_DWORD *)id v11 = 138412290;
    v20[1] = v11 + 4;
    sub_2156ED480(0, &qword_26AB24B08);
    id v14 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
    v21[0] = v14;
    sub_21570E258();
    void *v13 = v14;
    id v10 = &selRef_initWithHostViewController_;
    _os_log_impl(&dword_2156DD000, v8, v9, "Launching UI AppExtension %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_267881310);
    swift_arrayDestroy();
    uint64_t v15 = v13;
    uint64_t v4 = v22;
    MEMORY[0x2166C3490](v15, -1, -1);
    MEMORY[0x2166C3490](v11, -1, -1);
  }

  sub_21570DAC8();
  sub_2156ED480(0, &qword_26AB24B08);
  id v16 = [(id)swift_getObjCClassFromMetadata() v10[163]];
  sub_21570DAB8();
  id v17 = objc_allocWithZone((Class)type metadata accessor for AppExtensionWrapper());
  id v18 = sub_2156F9334((uint64_t)v21);
  objc_msgSend(v16, sel_setExtension_, v18);

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
}

uint64_t type metadata accessor for AppExtensionWrapper()
{
  return self;
}

id sub_2156F9334(uint64_t a1)
{
  id v3 = v1;
  os_log_type_t v4 = sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  uint64_t v5 = sub_21570E238();
  sub_2156F9814(a1, (uint64_t)v23);
  os_log_type_t v6 = v4;
  if (os_log_type_enabled(v5, v4))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v20 = v8;
    *(_DWORD *)os_log_type_t v7 = 136315138;
    sub_2156F9814((uint64_t)v23, (uint64_t)v19);
    uint64_t v9 = sub_21570E0A8();
    v19[0] = sub_215708FE4(v9, v10, &v20);
    sub_21570E258();
    swift_bridgeObjectRelease();
    sub_2156F97C0((uint64_t)v23);
    _os_log_impl(&dword_2156DD000, v5, v6, "Creating AppExtensionWrapper with content %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v8, -1, -1);
    MEMORY[0x2166C3490](v7, -1, -1);
  }
  else
  {

    sub_2156F97C0((uint64_t)v23);
  }
  uint64_t v11 = (uint64_t)v3 + OBJC_IVAR____TtC12ExtensionKit19AppExtensionWrapper_configurationScene;
  sub_2156F9814(a1, (uint64_t)v3 + OBJC_IVAR____TtC12ExtensionKit19AppExtensionWrapper_configurationScene);
  sub_2156ED480(0, &qword_26AB24B08);
  id v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  sub_2156F9814(v11, (uint64_t)v23);
  unint64_t v13 = (objc_class *)type metadata accessor for _SceneFactory();
  id v14 = objc_allocWithZone(v13);
  sub_2156F9814((uint64_t)v23, (uint64_t)v14 + OBJC_IVAR____TtC12ExtensionKit13_SceneFactory_sceneConfiguration);
  v22.receiver = v14;
  v22.super_class = v13;
  id v15 = objc_msgSendSuper2(&v22, sel_init);
  sub_2156F97C0((uint64_t)v23);

  objc_msgSend(v12, sel_setSceneFactory_, v15);
  id v16 = (objc_class *)type metadata accessor for AppExtensionWrapper();
  v21.receiver = v3;
  v21.super_class = v16;
  id v17 = objc_msgSendSuper2(&v21, sel_init);
  sub_2156F97C0(a1);
  return v17;
}

id sub_2156F96B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppExtensionWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2156F96F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267881C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2156F9760(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267881C40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2156F97C0(uint64_t a1)
{
  return a1;
}

uint64_t sub_2156F9814(uint64_t a1, uint64_t a2)
{
  return a2;
}

ExtensionKit::Role __swiftcall Role.init(rawValue:)(ExtensionKit::Role rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

uint64_t sub_2156F9878()
{
  return sub_21570E368();
}

uint64_t sub_2156F98D4()
{
  swift_bridgeObjectRetain();
  sub_21570E0C8();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2156F992C()
{
  return sub_21570E368();
}

void *sub_2156F9984@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_2156F9990@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t Role.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

ExtensionKit::Role __swiftcall Role.init(stringLiteral:)(ExtensionKit::Role stringLiteral)
{
  *uint64_t v1 = stringLiteral;
  return stringLiteral;
}

uint64_t sub_2156F99D4(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_21570E328();
  }
}

uint64_t sub_2156F9A04()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2156F9A34()
{
  uint64_t result = sub_21570E098();
  qword_267881870 = result;
  *(void *)algn_267881878 = v1;
  return result;
}

uint64_t static Role.default.getter@<X0>(void *a1@<X8>)
{
  if (qword_267881070 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)algn_267881878;
  *a1 = qword_267881870;
  a1[1] = v2;

  return swift_bridgeObjectRetain();
}

unint64_t sub_2156F9AD8()
{
  unint64_t result = qword_267881880;
  if (!qword_267881880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881880);
  }
  return result;
}

unint64_t sub_2156F9B30()
{
  unint64_t result = qword_267881888;
  if (!qword_267881888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881888);
  }
  return result;
}

uint64_t sub_2156F9B84()
{
  return MEMORY[0x263F8D388];
}

unint64_t sub_2156F9B94()
{
  unint64_t result = qword_267881890;
  if (!qword_267881890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881890);
  }
  return result;
}

uint64_t sub_2156F9BE8()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_2156F9BF4()
{
  return MEMORY[0x263F8D390];
}

void *initializeBufferWithCopyOfBuffer for Role(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Role()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for Role(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for Role(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Role()
{
  return &type metadata for Role;
}

uint64_t _AnyViewConfiguration.init<A>(erasing:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v27 = a3;
  BOOL v29 = a4;
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v10(v9, (uint64_t)a1, a2);
  uint64_t v11 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = ((v11 + 32) & ~v11) + v8;
  uint64_t v13 = (v11 + 32) & ~v11;
  uint64_t v28 = v13;
  v24[1] = v12;
  uint64_t v25 = v10;
  uint64_t v14 = swift_allocObject();
  uint64_t v30 = v14;
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  id v15 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v15(v14 + v13, v9, a2);
  uint64_t v26 = a1;
  v10(v9, (uint64_t)a1, a2);
  uint64_t v16 = swift_allocObject();
  uint64_t v18 = v27;
  uint64_t v17 = v28;
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = v18;
  v15(v16 + v17, v9, a2);
  v25(v9, (uint64_t)a1, a2);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a2;
  *(void *)(v19 + 24) = v18;
  v15(v19 + v17, v9, a2);
  v15((uint64_t)v9, v26, a2);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  *(void *)(v20 + 24) = v18;
  uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v15)(v20 + v17, v9, a2);
  uint64_t v23 = v29;
  uint64_t v22 = v30;
  *BOOL v29 = sub_2156FAEC0;
  v23[1] = (uint64_t (*)())v22;
  v23[2] = sub_2156FB01C;
  void v23[3] = (uint64_t (*)())v16;
  v23[4] = (uint64_t (*)())sub_2156FB198;
  v23[5] = (uint64_t (*)())v19;
  v23[6] = (uint64_t (*)())sub_2156FB1DC;
  v23[7] = (uint64_t (*)())v20;
  return result;
}

ExtensionKit::_Role __swiftcall _Role.init(rawValue:)(ExtensionKit::_Role rawValue)
{
  *uint64_t v1 = rawValue;
  return rawValue;
}

double sub_2156F9F58@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  void (*v46)(_OWORD *__return_ptr, uint64_t);
  _OWORD v47[4];
  _OWORD v48[5];

  uint64_t v4 = *a1;
  buf = (uint8_t *)a1[1];
  uint64_t v5 = *(uint64_t (**)(void))v2;
  uint64_t v6 = *(void *)(v2 + 8);
  memset((char *)v48 + 8, 0, 64);
  uint64_t v7 = v5();
  os_log_type_t v8 = sub_21570E1F8();
  sub_2156FB25C();
  uint64_t v9 = sub_21570E238();
  os_log_type_t v10 = v8;
  size_t v38 = a2;
  if (os_log_type_enabled(v9, v8))
  {
    swift_retain_n();
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(void *)&v48[0] = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v5;
    *(void *)(v13 + 24) = v6;
    *((void *)&v47[0] + 1) = v13;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2678818A8);
    uint64_t v14 = sub_21570E0A8();
    *(void *)&v47[0] = sub_215708FE4(v14, v15, (uint64_t *)v48);
    sub_21570E258();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2156DD000, v9, v10, "Content %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v12, -1, -1);
    MEMORY[0x2166C3490](v11, -1, -1);
  }

  uint64_t v16 = *(void *)(v7 + 16);
  if (v16)
  {
    uint64_t v17 = v7 + 56;
    uint64_t v41 = v4;
    while (1)
    {
      uint64_t v46 = *(void (**)(_OWORD *__return_ptr, uint64_t))(v17 - 24);
      long long v43 = *(_OWORD *)(v17 + 16);
      *(_OWORD *)log = *(_OWORD *)v17;
      uint64_t v18 = *(void *)(v17 + 32);
      long long v40 = *(_OWORD *)(v17 - 16);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      os_log_type_t v19 = sub_21570E1F8();
      uint64_t v20 = sub_21570E238();
      os_log_type_t v21 = v19;
      if (os_log_type_enabled(v20, v19))
      {
        swift_retain_n();
        swift_retain_n();
        swift_retain_n();
        swift_retain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v22 = swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        *(void *)&v48[0] = v39;
        *(_DWORD *)uint64_t v22 = 136315394;
        swift_retain();
        swift_retain();
        swift_retain();
        uint64_t v23 = swift_retain();
        v46(v47, v23);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        *(void *)(v22 + 4) = sub_215708FE4(*(uint64_t *)&v47[0], *((unint64_t *)&v47[0] + 1), (uint64_t *)v48);
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v22 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v22 + 14) = sub_215708FE4(v41, (unint64_t)buf, (uint64_t *)v48);
        uint64_t v4 = v41;
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2156DD000, v20, v21, "Evaluating %s) for role %s", (uint8_t *)v22, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2166C3490](v39, -1, -1);
        MEMORY[0x2166C3490](v22, -1, -1);
      }

      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v24 = swift_retain();
      v46(v47, v24);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      if (v47[0] == __PAIR128__((unint64_t)buf, v4)) {
        break;
      }
      char v25 = sub_21570E328();
      swift_bridgeObjectRelease();
      if (v25) {
        goto LABEL_12;
      }
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v17 += 64;
      if (!--v16) {
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    sub_2156EF70C(*((uint64_t *)&v48[0] + 1));
    *((void *)&v48[0] + 1) = v46;
    v48[1] = v40;
    v48[2] = *(_OWORD *)log;
    v48[3] = v43;
    *(void *)&v48[4] = v18;
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
  }
  os_log_type_t v26 = sub_21570E1F8();
  uint64_t v27 = sub_21570E238();
  if (os_log_type_enabled(v27, v26))
  {
    long long v28 = *(_OWORD *)((char *)&v48[3] + 8);
    long long v29 = *(_OWORD *)((char *)&v48[2] + 8);
    long long v30 = *(_OWORD *)((char *)&v48[1] + 8);
    long long v31 = *(_OWORD *)((char *)v48 + 8);
    sub_2156EF770(*((uint64_t *)&v48[0] + 1));
    sub_2156EF770(v31);
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    *(void *)&v48[0] = v44;
    *(_DWORD *)uint64_t v32 = 136315138;
    v47[0] = v31;
    v47[1] = v30;
    v47[2] = v29;
    v47[3] = v28;
    sub_2156EF770(v31);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2678818C8);
    uint64_t v33 = sub_21570E0A8();
    *(void *)&v47[0] = sub_215708FE4(v33, v34, (uint64_t *)v48);
    sub_21570E258();
    swift_bridgeObjectRelease();
    sub_2156EF70C(v31);
    sub_2156EF70C(v31);
    _os_log_impl(&dword_2156DD000, v27, v26, "Made View configuration: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v44, -1, -1);
    MEMORY[0x2166C3490](v32, -1, -1);
  }

  swift_beginAccess();
  long long v35 = *(_OWORD *)((char *)&v48[1] + 8);
  *size_t v38 = *(_OWORD *)((char *)v48 + 8);
  v38[1] = v35;
  double result = *((double *)&v48[2] + 1);
  long long v37 = *(_OWORD *)((char *)&v48[3] + 8);
  v38[2] = *(_OWORD *)((char *)&v48[2] + 8);
  v38[3] = v37;
  return result;
}

void sub_2156FA6AC()
{
}

void _InitializationParametersConsumer.consume(initializationParameters:)()
{
}

ExtensionKit::_EmptyViewConfiguration __swiftcall _EmptyViewConfiguration.init()()
{
  uint64_t v1 = v0;
  if (qword_267881078 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_2678818A0;
  *uint64_t v1 = qword_267881898;
  v1[1] = v2;

  uint64_t v3 = swift_bridgeObjectRetain();
  result.role.rawValue._object = v4;
  result.role.rawValue._countAndFlagsBits = v3;
  return result;
}

uint64_t static _ViewConfigurationBuilder.buildBlock<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  os_log_type_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881678);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2157108E0;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  _AnyViewConfiguration.init<A>(erasing:)(v8, a2, a3, (uint64_t (**)())(v9 + 32));
  return v9;
}

uint64_t _ViewConfigurationGroup.init<A>(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  swift_getFunctionTypeMetadata0();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2678818A8);
  if (swift_dynamicCast())
  {
    swift_release();
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = v12;
    uint64_t v11 = sub_2156FB318;
  }
  else
  {
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = a3;
    *(void *)(result + 24) = a4;
    *(void *)(result + 32) = a1;
    *(void *)(result + 40) = a2;
    uint64_t v11 = sub_2156FB2D4;
  }
  *a5 = v11;
  a5[1] = (uint64_t (*)())result;
  return result;
}

uint64_t _Role.description.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

ExtensionKit::_Role __swiftcall _Role.init(stringLiteral:)(ExtensionKit::_Role stringLiteral)
{
  *uint64_t v1 = stringLiteral;
  return stringLiteral;
}

uint64_t sub_2156FA978()
{
  uint64_t result = sub_21570E098();
  qword_267881898 = result;
  unk_2678818A0 = v1;
  return result;
}

uint64_t static _Role.default.getter@<X0>(void *a1@<X8>)
{
  if (qword_267881078 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_2678818A0;
  *a1 = qword_267881898;
  a1[1] = v2;

  return swift_bridgeObjectRetain();
}

uint64_t sub_2156FAA18@<X0>(void *a1@<X8>)
{
  return _ViewConfiguration.role.getter(a1);
}

uint64_t _ViewConfiguration.role.getter@<X0>(void *a1@<X8>)
{
  if (qword_267881078 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_2678818A0;
  *a1 = qword_267881898;
  a1[1] = v2;

  return swift_bridgeObjectRetain();
}

void sub_2156FAAA0()
{
}

void _ViewConfiguration.consume(initializationParameters:)()
{
}

void sub_2156FAAC0()
{
  sub_21570E1F8();
  sub_2156FB25C();
  id v0 = (id)sub_21570E238();
  sub_21570DCC8();
}

uint64_t sub_2156FAB50@<X0>(void *a1@<X8>)
{
  if (qword_267881078 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_2678818A0;
  *a1 = qword_267881898;
  a1[1] = v2;

  return swift_bridgeObjectRetain();
}

void sub_2156FABC0()
{
  sub_21570E1F8();
  sub_2156FB25C();
  id v0 = (id)sub_21570E238();
  sub_21570DCC8();
}

uint64_t _EmptyViewConfiguration.role.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t _EmptyViewConfiguration.role.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*_EmptyViewConfiguration.role.modify())()
{
  return nullsub_3;
}

void Array<A>.view.getter()
{
}

void sub_2156FACF0()
{
}

uint64_t sub_2156FAD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a3 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v10 = (void (*)(void))MEMORY[0x270FA5388](v7);
  long long v12 = (char *)&v15 - v11;
  v10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881678);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2157108E0;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, a3);
  _AnyViewConfiguration.init<A>(erasing:)(v9, a3, a4, (uint64_t (**)())(v13 + 32));
  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, a3);
  return v13;
}

uint64_t _AnyViewConfiguration.role.getter()
{
  return (*v0)();
}

uint64_t sub_2156FAEC0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 24))();
}

uint64_t sub_2156FAF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  swift_getAssociatedConformanceWitness();
  return sub_21570E008();
}

uint64_t sub_2156FB01C()
{
  return sub_2156FAF2C(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80)), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_2156FB05C(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(qword_26AB249E0);
  if (swift_dynamicCast())
  {
    sub_2156EED90(v5, (uint64_t)v7);
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    char v3 = sub_21570DC98();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  }
  else
  {
    uint64_t v6 = 0;
    memset(v5, 0, sizeof(v5));
    sub_2156EED30((uint64_t)v5);
    char v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_2156FB198(uint64_t a1)
{
  return sub_2156FB05C(a1);
}

uint64_t sub_2156FB1DC(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v4 = *a1;
  return (*(uint64_t (**)(uint64_t *))(v2 + 40))(&v4);
}

unint64_t sub_2156FB25C()
{
  unint64_t result = qword_26AB24B10;
  if (!qword_26AB24B10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AB24B10);
  }
  return result;
}

uint64_t sub_2156FB29C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2156FB2D4()
{
  return sub_2156FAD3C(v0[4], v0[5], v0[2], v0[3]);
}

uint64_t sub_2156FB2E0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2156FB318()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v2);
  return v2;
}

uint64_t _AnyViewConfiguration.view.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

Swift::Bool __swiftcall _AnyViewConfiguration.shouldAccept(connection:)(NSXPCConnection connection)
{
  return (*(uint64_t (**)(Class))(v1 + 32))(connection.super.isa) & 1;
}

uint64_t _AnyViewConfiguration.consume(initializationParameters:)(uint64_t *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 48);
  uint64_t v4 = *a1;
  return v2(&v4);
}

uint64_t sub_2156FB3E8()
{
  return (*v0)();
}

uint64_t sub_2156FB410@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_2156FB440(uint64_t *a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 48);
  uint64_t v4 = *a1;
  return v2(&v4);
}

uint64_t sub_2156FB47C()
{
  return (*(uint64_t (**)(void))(v0 + 32))() & 1;
}

id _InitializationParameters.resolve<A>()()
{
  v7[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = *v0;
  v7[0] = 0;
  id v2 = objc_msgSend(v1, sel_resolveObjectOfClass_error_, swift_getObjCClassFromMetadata(), v7);
  id v3 = v7[0];
  if (v2)
  {
    id v4 = (id)swift_dynamicCastUnknownClass();
    id v5 = v3;
    if (!v4) {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    id v4 = v7[0];
    sub_21570DA08();

    swift_willThrow();
  }
  return v4;
}

unint64_t sub_2156FB59C()
{
  unint64_t result = qword_2678818B0;
  if (!qword_2678818B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2678818B0);
  }
  return result;
}

unint64_t sub_2156FB5F4()
{
  unint64_t result = qword_2678818B8;
  if (!qword_2678818B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2678818B8);
  }
  return result;
}

unint64_t sub_2156FB64C()
{
  unint64_t result = qword_2678818C0;
  if (!qword_2678818C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2678818C0);
  }
  return result;
}

uint64_t sub_2156FB6A0()
{
  return MEMORY[0x263F1B9F8];
}

uint64_t sub_2156FB6AC()
{
  return MEMORY[0x263F1BB60];
}

uint64_t sub_2156FB6B8(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of _AnyViewConfiguration.view>>, 1);
}

ValueMetadata *type metadata accessor for _Role()
{
  return &type metadata for _Role;
}

uint64_t dispatch thunk of _ViewConfigurationProviding.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of _ViewConfiguration.role.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _ViewConfiguration.view.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of _ViewConfiguration.consume(initializationParameters:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

ValueMetadata *type metadata accessor for _EmptyViewConfiguration()
{
  return &type metadata for _EmptyViewConfiguration;
}

ValueMetadata *type metadata accessor for _ViewConfigurationBuilder()
{
  return &type metadata for _ViewConfigurationBuilder;
}

void *assignWithCopy for _ViewConfigurationGroup(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for _ViewConfigurationGroup(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for _ViewConfigurationGroup()
{
  return &type metadata for _ViewConfigurationGroup;
}

uint64_t destroy for _AnyViewConfiguration()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for _AnyViewConfiguration(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for _AnyViewConfiguration(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_OWORD *assignWithTake for _AnyViewConfiguration(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AnyViewConfiguration(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AnyViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _AnyViewConfiguration()
{
  return &type metadata for _AnyViewConfiguration;
}

ValueMetadata *type metadata accessor for _InitializationParameters()
{
  return &type metadata for _InitializationParameters;
}

uint64_t dispatch thunk of _InitializationParametersConsumer.consume(initializationParameters:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_2156FBA88()
{
  return MEMORY[0x263F1B710];
}

uint64_t sub_2156FBA94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

id sub_2156FBAD8(uint64_t a1, uint64_t a2)
{
  long long v3 = v2;
  uint64_t v6 = sub_21570DCF8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  os_log_type_t v10 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v34 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v34 - v14;
  uint64_t v16 = (objc_class *)type metadata accessor for _EXRunningUIKitSceneHostedExtension();
  v36.receiver = v3;
  v36.super_class = v16;
  id result = objc_msgSendSuper2(&v36, sel__startWithArguments_count_, a1, a2);
  if (!result)
  {
    sub_21570DCD8();
    uint64_t v18 = sub_21570DCE8();
    os_log_type_t v19 = sub_21570E218();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_2156DD000, v18, v19, "Configuring service listener", v20, 2u);
      MEMORY[0x2166C3490](v20, -1, -1);
    }

    uint64_t v21 = v7 + 8;
    uint64_t v22 = *(void (**)(char *, uint64_t))(v7 + 8);
    v34[1] = v21;
    v22(v15, v6);
    uint64_t v23 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = sub_2156FD0A4;
    *(void *)(v24 + 24) = v23;
    aBlock[4] = sub_2156FD0BC;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2156FC12C;
    aBlock[3] = &block_descriptor_12;
    char v25 = _Block_copy(aBlock);
    os_log_type_t v26 = self;
    swift_retain();
    id v27 = objc_msgSend(v26, sel_listenerWithConfigurator_, v25);
    _Block_release(v25);
    swift_release();
    LOBYTE(v25) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (v25) {
      __break(1u);
    }
    objc_msgSend(v27, sel_activate);
    sub_21570DCD8();
    long long v28 = sub_21570DCE8();
    os_log_type_t v29 = sub_21570E218();
    if (os_log_type_enabled(v28, v29))
    {
      long long v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v30 = 0;
      _os_log_impl(&dword_2156DD000, v28, v29, "Checking in with launchd", v30, 2u);
      MEMORY[0x2166C3490](v30, -1, -1);
    }

    v22(v13, v6);
    objc_msgSend(v3, sel_checkIn);
    sub_21570DCD8();
    long long v31 = sub_21570DCE8();
    os_log_type_t v32 = sub_21570E218();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_2156DD000, v31, v32, "Resuming service listener", v33, 2u);
      MEMORY[0x2166C3490](v33, -1, -1);
    }

    v22(v10, v6);
    id result = objc_msgSend(self, sel_activateXPCService);
    __break(1u);
  }
  return result;
}

void sub_2156FBF2C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_21570DCF8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x2166C3530](a2 + 16);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    os_log_type_t v10 = (void *)sub_21570E068();
    objc_msgSend(a1, sel_setDomain_, v10);

    uint64_t v11 = (void *)sub_21570E068();
    objc_msgSend(a1, sel_setService_, v11);

    objc_msgSend(a1, sel_setDelegate_, v9);
  }
  else
  {
    sub_21570DCD8();
    uint64_t v12 = sub_21570DCE8();
    os_log_type_t v13 = sub_21570E208();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_2156DD000, v12, v13, "Could not find _EXRunningUIKitSceneHostedExtension when configuring listener", v14, 2u);
      MEMORY[0x2166C3490](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

id sub_2156FC30C(void *a1)
{
  objc_msgSend(a1, sel_setActivateOnResume);

  return objc_msgSend(a1, sel_setFaultOnSuspend);
}

uint64_t sub_2156FC354(uint64_t a1, uint64_t a2)
{
  long long v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

id sub_2156FC480()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _EXRunningUIKitSceneHostedExtension();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for _EXRunningUIKitSceneHostedExtension()
{
  return self;
}

uint64_t sub_2156FC4D8(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_21570DCF8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21570DCD8();
  uint64_t v8 = sub_21570DCE8();
  os_log_type_t v9 = sub_21570E218();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v4;
    uint64_t v11 = a1;
    unint64_t v12 = a2;
    os_log_type_t v13 = (uint8_t *)v10;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v19 = v14;
    *(_DWORD *)os_log_type_t v13 = 136446210;
    uint64_t v18 = sub_215708FE4(v11, v12, &v19);
    sub_21570E258();
    _os_log_impl(&dword_2156DD000, v8, v9, "Received: %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v14, -1, -1);
    MEMORY[0x2166C3490](v13, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2156FC6C4(void *a1, void *a2)
{
  id v41 = a1;
  uint64_t v43 = sub_21570E038();
  uint64_t v3 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v5 = (uint64_t *)((char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_21570DCF8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v38 - v11;
  sub_21570DCD8();
  os_log_type_t v13 = sub_21570DCE8();
  os_log_type_t v14 = sub_21570E218();
  BOOL v15 = os_log_type_enabled(v13, v14);
  uint64_t v42 = v7;
  if (v15)
  {
    long long v40 = (void (*)(uint64_t, uint64_t))v6;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v39 = a2;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v45 = v18;
    *(_DWORD *)uint64_t v17 = 136446210;
    uint64_t v44 = sub_215708FE4(0xD000000000000032, 0x8000000215714EB0, &v45);
    uint64_t v6 = (uint64_t)v40;
    sub_21570E258();
    _os_log_impl(&dword_2156DD000, v13, v14, "%{public}s", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v19 = v18;
    uint64_t v7 = v42;
    MEMORY[0x2166C3490](v19, -1, -1);
    uint64_t v20 = v17;
    a2 = v39;
    MEMORY[0x2166C3490](v20, -1, -1);
  }

  uint64_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v12, v6);
  sub_2156FCFD4();
  uint64_t *v5 = sub_21570E228();
  uint64_t v22 = v43;
  (*(void (**)(uint64_t *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F0E0], v43);
  char v23 = sub_21570E048();
  uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 8))(v5, v22);
  if (v23)
  {
    sub_21570DCD8();
    id v25 = a2;
    os_log_type_t v26 = sub_21570DCE8();
    os_log_type_t v27 = sub_21570E218();
    if (os_log_type_enabled(v26, v27))
    {
      long long v40 = (void (*)(uint64_t, uint64_t))v21;
      uint64_t v43 = (uint64_t)v10;
      long long v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v45 = v29;
      *(_DWORD *)long long v28 = 136446210;
      id v30 = objc_msgSend(v25, sel_sourceApplication);
      if (v30)
      {
        long long v31 = v30;
        uint64_t v32 = v6;
        uint64_t v33 = sub_21570E098();
        unint64_t v35 = v34;
      }
      else
      {
        uint64_t v32 = v6;
        uint64_t v33 = 0;
        unint64_t v35 = 0xE000000000000000;
      }
      uint64_t v44 = sub_215708FE4(v33, v35, &v45);
      sub_21570E258();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2156DD000, v26, v27, "Received scene connection request from host: %{public}s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2166C3490](v29, -1, -1);
      MEMORY[0x2166C3490](v28, -1, -1);

      v40(v43, v32);
    }
    else
    {

      v21(v10, v6);
    }
    id v36 = objc_msgSend(v41, sel_role);
    id v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82B48]), sel_initWithName_sessionRole_, 0, v36);

    type metadata accessor for EXRemoteSceneDelegate();
    objc_msgSend(v37, sel_setDelegateClass_, swift_getObjCClassFromMetadata());
    return (uint64_t)v37;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2156FCBC8(void *a1, void *a2)
{
  uint64_t v5 = sub_21570DCF8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v31 = sub_2156FC30C;
  uint64_t v32 = 0;
  unint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v28 = 1107296256;
  uint64_t v29 = sub_2156FC12C;
  id v30 = &block_descriptor;
  uint64_t v9 = _Block_copy(&aBlock);
  swift_release();
  id v10 = objc_msgSend(a2, sel_extractNSXPCConnectionWithConfigurator_, v9);
  _Block_release(v9);
  if (swift_isEscapingClosureAtFileLocation())
  {
    __break(1u);
    goto LABEL_12;
  }
  id v24 = a1;
  id v25 = a2;
  id v26 = v10;
  id v11 = objc_msgSend(a2, sel_service);
  uint64_t v12 = sub_21570E098();
  uint64_t v14 = v13;

  if (v12 != 0x6C616E7265746E49 || v14 != 0xEF65636976726553)
  {
    char v15 = sub_21570E328();
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_6;
    }
LABEL_12:
    unint64_t aBlock = 0;
    unint64_t v28 = 0xE000000000000000;
    sub_21570E278();
    swift_bridgeObjectRelease();
    unint64_t aBlock = 0xD000000000000030;
    unint64_t v28 = 0x8000000215714E70;
    id v22 = objc_msgSend(v24, sel_description);
    sub_21570E098();

    sub_21570E0F8();
    swift_bridgeObjectRelease();
    sub_21570E2C8();
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease();
LABEL_6:
  sub_21570DCD8();
  uint64_t v16 = sub_21570DCE8();
  os_log_type_t v17 = sub_21570E1F8();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_2156DD000, v16, v17, "Received scene session connection request on internal mach service listener", v18, 2u);
    MEMORY[0x2166C3490](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v19 = objc_msgSend(v2, sel_extension);
  id v20 = objc_msgSend(objc_allocWithZone((Class)_EXUISceneSession), sel_initWithExtension_, v19);

  uint64_t v21 = v26;
  LOBYTE(v19) = objc_msgSend(v20, sel_shouldAcceptXPCConnection_, v26);

  if ((v19 & 1) == 0) {
    objc_msgSend(v25, sel_invalidate);
  }
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_2156FCFD4()
{
  unint64_t result = qword_267881938;
  if (!qword_267881938)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267881938);
  }
  return result;
}

unint64_t sub_2156FD014()
{
  unint64_t result = qword_267881940;
  if (!qword_267881940)
  {
    type metadata accessor for LaunchOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881940);
  }
  return result;
}

uint64_t sub_2156FD06C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2156FD0A4(void *a1)
{
  sub_2156FBF2C(a1, v1);
}

uint64_t sub_2156FD0AC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2156FD0BC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2156FD144(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      unint64_t result = sub_21570E0E8();
      if ((v1 & 1) == 0)
      {
        uint64_t v2 = result;
        unint64_t result = 15;
        uint64_t v1 = v2;
        return MEMORY[0x270F9D650](result, v1);
      }
    }
    __break(1u);
    return MEMORY[0x270F9D650](result, v1);
  }
  return result;
}

id sub_2156FD2AC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EXRemoteSceneDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EXRemoteSceneDelegate()
{
  return self;
}

id sub_2156FD314(uint64_t a1, void *a2)
{
  uint64_t v57 = a1;
  uint64_t v3 = sub_21570DCF8();
  uint64_t v59 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  int64_t v55 = (char *)v49 - v7;
  uint64_t v8 = sub_21570DAA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881A80);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  char v15 = (char *)v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  os_log_type_t v17 = (char *)v49 - v16;
  id v60 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
  id v18 = objc_msgSend(a2, sel_persistentIdentifier);
  uint64_t v19 = sub_21570E098();
  unint64_t v21 = v20;

  uint64_t v64 = v19;
  unint64_t v65 = v21;
  swift_bridgeObjectRetain();
  LOBYTE(v18) = sub_21570E118();
  swift_bridgeObjectRelease();
  if (v18)
  {
    uint64_t v22 = sub_21570E0D8();
    sub_2156FD144(v22);
    uint64_t v19 = v64;
    unint64_t v21 = v65;
  }
  swift_bridgeObjectRetain();
  sub_21570DA88();
  swift_bridgeObjectRelease();
  sub_2156FDAEC((uint64_t)v17, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v15, 1, v8) == 1)
  {
    uint64_t v56 = v3;
    sub_2156FDB54((uint64_t)v15);
    sub_21570DCD8();
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_21570DCE8();
    os_log_type_t v24 = sub_21570E208();
    if (os_log_type_enabled(v23, v24))
    {
      id v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v63 = v26;
      *(_DWORD *)id v25 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_215708FE4(v19, v21, &v63);
      sub_21570E258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2156DD000, v23, v24, "Session ID could not be found for scene id: %{public}s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2166C3490](v26, -1, -1);
      MEMORY[0x2166C3490](v25, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v59 + 8))(v6, v56);
    return (id)sub_2156FDB54((uint64_t)v17);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v15, v8);
  id v27 = objc_msgSend(self, sel_sharedInstance);
  unint64_t v28 = (void *)sub_21570DA98();
  id v29 = objc_msgSend(v27, sel_sessionForIdentifier_, v28);

  id v30 = v29;
  id result = objc_msgSend(v30, sel_scene);
  if (result)
  {
    int v61 = &unk_26C665DD8;
    id v32 = objc_msgSend((id)swift_dynamicCastObjCProtocolUnconditional(), sel_viewController);

    swift_unknownObjectRelease();
    if (v32)
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v56 = v3;
      uint64_t v33 = v55;
      sub_21570DCD8();
      id v34 = v30;
      swift_bridgeObjectRetain();
      id v35 = v34;
      id v36 = sub_21570DCE8();
      os_log_type_t v37 = sub_21570E208();
      int v54 = v37;
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = swift_slowAlloc();
        uint64_t v53 = (void *)swift_slowAlloc();
        uint64_t v52 = swift_slowAlloc();
        uint64_t v62 = (uint64_t)v35;
        uint64_t v63 = v52;
        *(_DWORD *)uint64_t v38 = 138543618;
        v49[0] = v38 + 12;
        v49[1] = v38 + 4;
        id v50 = v30;
        id v39 = v35;
        os_log_t v51 = v36;
        id v40 = v39;
        sub_21570E258();
        *uint64_t v53 = v35;

        *(_WORD *)(v38 + 12) = 2082;
        swift_bridgeObjectRetain();
        uint64_t v62 = sub_215708FE4(v19, v21, &v63);
        id v30 = v50;
        sub_21570E258();
        swift_bridgeObjectRelease_n();
        os_log_t v41 = v51;
        _os_log_impl(&dword_2156DD000, v51, (os_log_type_t)v54, "Could not fetch view controller for session: %{public}@ scene id: %{public}s", (uint8_t *)v38, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(qword_267881310);
        uint64_t v42 = v53;
        swift_arrayDestroy();
        MEMORY[0x2166C3490](v42, -1, -1);
        uint64_t v43 = v52;
        swift_arrayDestroy();
        MEMORY[0x2166C3490](v43, -1, -1);
        MEMORY[0x2166C3490](v38, -1, -1);

        (*(void (**)(char *, uint64_t))(v59 + 8))(v55, v56);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v59 + 8))(v33, v56);
      }
      id v32 = v60;
    }
    self;
    id v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E88]), sel_initWithWindowScene_, swift_dynamicCastObjCClassUnconditional());
    uint64_t v45 = OBJC_IVAR___EXRemoteSceneDelegate_window;
    uint64_t v46 = v58;
    uint64_t v47 = *(void **)(v58 + OBJC_IVAR___EXRemoteSceneDelegate_window);
    *(void *)(v58 + OBJC_IVAR___EXRemoteSceneDelegate_window) = v44;

    uint64_t v48 = *(void **)(v46 + v45);
    if (v48)
    {
      objc_msgSend(v48, sel_setRootViewController_, v32);
      uint64_t v48 = *(void **)(v46 + v45);
    }
    objc_msgSend(v48, sel_makeKeyAndVisible);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (id)sub_2156FDB54((uint64_t)v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_2156FDAEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881A80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2156FDB54(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881A80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t EXHostViewController.Configuration.appExtension.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21570DB08();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t EXHostViewController.Configuration.appExtension.setter(uint64_t a1)
{
  uint64_t v3 = sub_21570DB08();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*EXHostViewController.Configuration.appExtension.modify())()
{
  return nullsub_3;
}

uint64_t EXHostViewController.Configuration.sceneID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for EXHostViewController.Configuration() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for EXHostViewController.Configuration()
{
  uint64_t result = qword_267881A90;
  if (!qword_267881A90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t EXHostViewController.Configuration.sceneID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for EXHostViewController.Configuration() + 20));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*EXHostViewController.Configuration.sceneID.modify())()
{
  return nullsub_3;
}

uint64_t EXHostViewController.Configuration.init(appExtension:sceneID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_21570DB08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(a4, a1, v8);
  uint64_t result = type metadata accessor for EXHostViewController.Configuration();
  uint64_t v10 = (void *)(a4 + *(int *)(result + 20));
  *uint64_t v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t EXHostViewController.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_configuration);
  if (v3)
  {
    uint64_t v4 = v3;
    MEMORY[0x2166C21F0](objc_msgSend(v3, sel_extensionIdentity));
    id v5 = objc_msgSend(v4, sel_role);
    uint64_t v6 = sub_21570E098();
    uint64_t v8 = v7;

    uint64_t v9 = type metadata accessor for EXHostViewController.Configuration();
    uint64_t v10 = (uint64_t *)(a1 + *(int *)(v9 + 20));
    *uint64_t v10 = v6;
    v10[1] = v8;
    id v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
    uint64_t v12 = v9;
    uint64_t v13 = a1;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = type metadata accessor for EXHostViewController.Configuration();
    id v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v12 = v15;
    uint64_t v13 = a1;
    uint64_t v14 = 1;
  }

  return v11(v13, v14, 1, v12);
}

uint64_t sub_2156FDF68(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881A88);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2156FE254(a1, (uint64_t)v4);
  return EXHostViewController.configuration.setter((uint64_t)v4);
}

uint64_t EXHostViewController.configuration.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881A88);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for EXHostViewController.Configuration();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v20 - v12;
  sub_2156FE254(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2156FE2BC((uint64_t)v6);
    objc_msgSend(v2, sel_setConfiguration_, 0);
    return sub_2156FE2BC(a1);
  }
  else
  {
    sub_2156FE31C((uint64_t)v6, (uint64_t)v13);
    sub_2156FE380((uint64_t)v13, (uint64_t)v11);
    id v15 = objc_allocWithZone((Class)_EXHostViewControllerConfiguration);
    sub_21570DAF8();
    self;
    uint64_t v16 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v17 = objc_msgSend(v15, sel_initWithExtensionIdentity_, v16);

    id v18 = v17;
    uint64_t v19 = (void *)sub_21570E068();
    objc_msgSend(v18, sel_setRole_, v19);

    sub_2156FE3E4((uint64_t)v11);
    objc_msgSend(v2, sel_setConfiguration_, v18);

    sub_2156FE2BC(a1);
    return sub_2156FE3E4((uint64_t)v13);
  }
}

uint64_t sub_2156FE254(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881A88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2156FE2BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881A88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2156FE31C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2156FE380(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2156FE3E4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*EXHostViewController.configuration.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = v1;
  *a1 = v1;
  size_t v4 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267881A88) - 8) + 64);
  a1[1] = malloc(v4);
  uint64_t v5 = (char *)malloc(v4);
  a1[2] = v5;
  id v6 = objc_msgSend(v2, sel_configuration);
  if (v6)
  {
    uint64_t v7 = v6;
    MEMORY[0x2166C21F0](objc_msgSend(v6, sel_extensionIdentity));
    id v8 = objc_msgSend(v7, sel_role);
    uint64_t v9 = sub_21570E098();
    uint64_t v11 = v10;

    uint64_t v12 = type metadata accessor for EXHostViewController.Configuration();
    uint64_t v13 = (uint64_t *)&v5[*(int *)(v12 + 20)];
    uint64_t *v13 = v9;
    v13[1] = v11;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  }
  else
  {
    uint64_t v14 = type metadata accessor for EXHostViewController.Configuration();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 1, 1, v14);
  }
  return sub_2156FE5B8;
}

void sub_2156FE5B8(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 16);
  if (a2)
  {
    sub_2156FE254((uint64_t)v3, (uint64_t)v2);
    EXHostViewController.configuration.setter((uint64_t)v2);
    sub_2156FE2BC((uint64_t)v3);
  }
  else
  {
    EXHostViewController.configuration.setter((uint64_t)v3);
  }
  free(v3);

  free(v2);
}

uint64_t sub_2156FE628@<X0>(uint64_t a1@<X8>)
{
  return EXHostViewController.configuration.getter(a1);
}

uint64_t *_s13ConfigurationVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_21570DB08();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s13ConfigurationVwxx(uint64_t a1)
{
  uint64_t v2 = sub_21570DB08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t _s13ConfigurationVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21570DB08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s13ConfigurationVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21570DB08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21570DB08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s13ConfigurationVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21570DB08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2156FE9E0);
}

uint64_t sub_2156FE9E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21570DB08();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t _s13ConfigurationVwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2156FEAB8);
}

uint64_t sub_2156FEAB8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_21570DB08();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_2156FEB78()
{
  uint64_t result = sub_21570DB08();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2156FEC0C()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

id sub_2156FEC44()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtensionHostingViewControllerRepresentable.Coordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2156FEDB8(uint64_t a1)
{
  uint64_t v36 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881B50);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v37 = (uint64_t)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_21570DC68();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v31 - v9;
  uint64_t v11 = (int *)type metadata accessor for _EXHostViewController.Configuration();
  uint64_t v35 = *((void *)v11 - 1);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v33 = (uint64_t)&v31 - v15;
  uint64_t v34 = v1;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, v1, v4);
  if (qword_267881078 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_267881898;
  uint64_t v18 = unk_2678818A0;
  v16(v8, (uint64_t)v10, v4);
  id v32 = v10;
  uint64_t v19 = v11[8];
  v16(v14, (uint64_t)v8, v4);
  uint64_t v20 = (uint64_t *)&v14[v11[7]];
  *uint64_t v20 = v17;
  v20[1] = v18;
  *(void *)&v14[v19] = 0;
  swift_bridgeObjectRetain();
  LOBYTE(v18) = sub_21570DCB8();
  unint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v8, v4);
  v14[v11[5]] = v18 & 1;
  v14[v11[6]] = 0;
  uint64_t v22 = v33;
  sub_2157008BC((uint64_t)v14, v33);
  v21(v32, v4);
  uint64_t v23 = (uint64_t *)(v34 + *(int *)(type metadata accessor for ExtensionHostingViewControllerRepresentable(0) + 20));
  uint64_t v24 = v23[1];
  if (v24)
  {
    uint64_t v25 = *v23;
    uint64_t v26 = (void *)(v22 + v11[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v26 = v25;
    v26[1] = v24;
  }
  id v27 = objc_msgSend(objc_allocWithZone((Class)_EXHostViewController), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881B58);
  sub_21570DEF8();
  unint64_t v28 = v38;
  objc_msgSend(v27, sel_setDelegate_, v38);

  uint64_t v29 = v37;
  sub_215700920(v22, v37, (uint64_t (*)(void))type metadata accessor for _EXHostViewController.Configuration);
  (*(void (**)(uint64_t, void, uint64_t, int *))(v35 + 56))(v29, 0, 1, v11);
  _EXHostViewController._configuration.setter(v29);
  sub_215700988(v22, (uint64_t (*)(void))type metadata accessor for _EXHostViewController.Configuration);
  return v27;
}

id sub_2156FF180()
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(*(void *)(v0
                            + *(int *)(type metadata accessor for ExtensionHostingViewControllerRepresentable(0) + 28))
                + 16);
  if (v1)
  {
    v9[0] = 0;
    id v2 = v1;
    id v3 = objc_msgSend(v2, sel_makeXPCConnectionWithError_, v9);
    if (v3)
    {
      id v4 = v3;
      id v5 = v9[0];
    }
    else
    {
      id v4 = v9[0];
      sub_21570DA08();

      swift_willThrow();
    }
  }
  else
  {
    sub_21570E208();
    sub_2156FB25C();
    uint64_t v6 = (void *)sub_21570E238();
    sub_21570DCC8();

    sub_21570E098();
    id v4 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v7 = (void *)sub_21570E068();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, 6, 0);

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_2156FF330@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  MEMORY[0x270FA5388](a1 - 8);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215700920(v2, (uint64_t)v5, type metadata accessor for ExtensionHostingViewControllerRepresentable);
  uint64_t v6 = (objc_class *)type metadata accessor for ExtensionHostingViewControllerRepresentable.Coordinator(0);
  id v7 = objc_allocWithZone(v6);
  sub_215700920((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR____TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator_parent, type metadata accessor for ExtensionHostingViewControllerRepresentable);
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  uint64_t result = sub_215700988((uint64_t)v5, type metadata accessor for ExtensionHostingViewControllerRepresentable);
  *a2 = v8;
  return result;
}

uint64_t sub_2156FF41C()
{
  return sub_21570DE98();
}

uint64_t sub_2156FF458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_215700878(&qword_267881B48);

  return MEMORY[0x270F02718](a1, a2, a3, v6);
}

uint64_t sub_2156FF4D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_215700878(&qword_267881B48);

  return MEMORY[0x270F026D0](a1, a2, a3, v6);
}

void sub_2156FF558()
{
}

uint64_t _ExtensionHost.extension.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t _ExtensionHost.sceneName.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _ExtensionHost._initializationParameters.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t _ExtensionHost.init(extension:sceneName:initializationParameters:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  if (a3)
  {
    uint64_t v7 = a3;
  }
  else
  {
    a2 = sub_21570E098();
    uint64_t v7 = v9;
  }
  a5[1] = a2;
  a5[2] = v7;
  a5[3] = a4;
  self;
  uint64_t v10 = swift_dynamicCastObjCClassUnconditional();
  uint64_t v11 = (char *)a5 + *(int *)(type metadata accessor for _ExtensionHost(0) + 28);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x2166C2320](v10);
  uint64_t v12 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  uint64_t v13 = (uint64_t *)&v11[v12[5]];
  uint64_t *v13 = a2;
  v13[1] = v7;
  *(void *)&v11[v12[6]] = a4;
  uint64_t v14 = v12[7];
  type metadata accessor for ExtensionHostingViewControllerRepresentable.MutableState();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)&v11[v14] = result;
  return result;
}

uint64_t type metadata accessor for _ExtensionHost(uint64_t a1)
{
  return sub_2156F53D8(a1, (uint64_t *)&unk_267881B18);
}

uint64_t type metadata accessor for ExtensionHostingViewControllerRepresentable(uint64_t a1)
{
  return sub_2156F53D8(a1, (uint64_t *)&unk_267881B38);
}

uint64_t type metadata accessor for ExtensionHostingViewControllerRepresentable.MutableState()
{
  return self;
}

uint64_t _ExtensionHost.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for _ExtensionHost(0);
  return sub_215700920(v1 + *(int *)(v3 + 28), a1, type metadata accessor for ExtensionHostingViewControllerRepresentable);
}

NSXPCConnection __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _ExtensionHost.makeXPCConnection()()
{
  return (NSXPCConnection)sub_2156FF180();
}

Swift::Void __swiftcall _ExtensionHost.invalidate()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for _ExtensionHost(0) + 28);
  uint64_t v2 = *(void **)(*(void *)(v1
                            + *(int *)(type metadata accessor for ExtensionHostingViewControllerRepresentable(0) + 28))
                + 16);
  if (v2)
  {
    objc_msgSend(v2, sel_setConfiguration_, 0);
  }
}

uint64_t sub_2156FF834(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of _ExtensionHost.body>>, 1);
}

uint64_t sub_2156FF850@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_215700920(v2 + *(int *)(a1 + 28), a2, type metadata accessor for ExtensionHostingViewControllerRepresentable);
}

uint64_t sub_2156FF888()
{
  return type metadata accessor for ExtensionHostingViewControllerRepresentable.Coordinator(0);
}

uint64_t type metadata accessor for ExtensionHostingViewControllerRepresentable.Coordinator(uint64_t a1)
{
  return sub_2156F53D8(a1, qword_267881B00);
}

uint64_t sub_2156FF8B0()
{
  uint64_t result = type metadata accessor for ExtensionHostingViewControllerRepresentable(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for _ExtensionHost(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    id v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    id v5 = a1;
    uint64_t v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    a1[3] = a2[3];
    uint64_t v7 = *(int *)(a3 + 28);
    id v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_21570DC68();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v11(v8, v9, v10);
    uint64_t v12 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
    uint64_t v13 = v12[5];
    uint64_t v14 = &v8[v13];
    uint64_t v15 = &v9[v13];
    uint64_t v17 = *(void *)v15;
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)uint64_t v14 = v17;
    *((void *)v14 + 1) = v16;
    *(void *)&v8[v12[6]] = *(void *)&v9[v12[6]];
    *(void *)&v8[v12[7]] = *(void *)&v9[v12[7]];
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
  }
  swift_retain();
  return v5;
}

uint64_t destroy for _ExtensionHost(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return swift_release();
}

void *initializeWithCopy for _ExtensionHost(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_21570DC68();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v16 = *(void *)v14;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  *(void *)&v7[v11[6]] = *(void *)&v8[v11[6]];
  *(void *)&v7[v11[7]] = *(void *)&v8[v11[7]];
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for _ExtensionHost(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_21570DC68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  uint64_t v11 = v10[5];
  uint64_t v12 = &v7[v11];
  uint64_t v13 = &v8[v11];
  *(void *)uint64_t v12 = *(void *)v13;
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&v7[v10[6]] = *(void *)&v8[v10[6]];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)&v7[v10[7]] = *(void *)&v8[v10[7]];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for _ExtensionHost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  id v8 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  *(_OWORD *)(v5 + v8[5]) = *(_OWORD *)(v6 + v8[5]);
  *(void *)(v5 + v8[6]) = *(void *)(v6 + v8[6]);
  *(void *)(v5 + v8[7]) = *(void *)(v6 + v8[7]);
  return a1;
}

void *assignWithTake for _ExtensionHost(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  uint64_t v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_unknownObjectRelease();
  uint64_t v7 = *(int *)(a3 + 28);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_21570DC68();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = &v8[v12];
  uint64_t v14 = &v9[v12];
  uint64_t v16 = *(void *)v14;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  *(void *)&v8[v11[6]] = *(void *)&v9[v11[6]];
  swift_unknownObjectRelease();
  *(void *)&v8[v11[7]] = *(void *)&v9[v11[7]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ExtensionHost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2156FFF5C);
}

uint64_t sub_2156FFF5C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for _ExtensionHost(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_215700020);
}

void *sub_215700020(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2157000C8()
{
  uint64_t result = type metadata accessor for ExtensionHostingViewControllerRepresentable(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_215700174()
{
  return sub_215700878((unint64_t *)&unk_267881B28);
}

uint64_t *sub_2157001A8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_21570DC68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)v4 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)v4 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_2157002A0(uint64_t a1)
{
  uint64_t v2 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t sub_215700330(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_2157003DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2157004B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_215700540(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_unknownObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t sub_2157005F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_215700608);
}

uint64_t sub_215700608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21570DC68();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2157006C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2157006DC);
}

uint64_t sub_2157006DC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_21570DC68();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_215700798()
{
  uint64_t result = sub_21570DC68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_215700844()
{
  return sub_215700878((unint64_t *)&unk_267881B28);
}

uint64_t sub_215700878(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ExtensionHostingViewControllerRepresentable(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2157008BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_215700920(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_215700988(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t _AnySceneConfiguration.init<A>(erasing:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v18 = a3;
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](a1);
  unint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, a1, a2);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  uint64_t v13 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  v13(v12 + v11, v10, a2);
  v13((unint64_t)v10, a1, a2);
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = v18;
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = v15;
  uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v13)(v14 + v11, v10, a2);
  *a4 = sub_2157016E8;
  a4[1] = (uint64_t (*)())v12;
  a4[2] = sub_215701758;
  a4[3] = (uint64_t (*)())v14;
  return result;
}

uint64_t sub_215700B90@<X0>(void *a1@<X8>)
{
  return _SceneConfiguration.role.getter(a1);
}

uint64_t _SceneConfiguration.role.getter@<X0>(void *a1@<X8>)
{
  if (qword_267881078 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_2678818A0;
  *a1 = qword_267881898;
  a1[1] = v2;

  return swift_bridgeObjectRetain();
}

void _EmptySceneConfiguration.sceneDelegate.getter()
{
}

void sub_215700C64()
{
}

uint64_t static _SceneConfigurationBuilder.buildBlock<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881B60);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2157108E0;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  _AnySceneConfiguration.init<A>(erasing:)(v8, a2, a3, (uint64_t (**)())(v9 + 32));
  return v9;
}

void Array<A>.sceneDelegate.getter()
{
}

void sub_215700E0C()
{
}

uint64_t _SceneConfigurationGroup.init<A>(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  swift_getFunctionTypeMetadata0();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB24AF8);
  if (swift_dynamicCast())
  {
    swift_release();
    uint64_t result = swift_allocObject();
    *(_OWORD *)(result + 16) = v12;
    uint64_t v11 = sub_2156FB318;
  }
  else
  {
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = a3;
    *(void *)(result + 24) = a4;
    *(void *)(result + 32) = a1;
    *(void *)(result + 40) = a2;
    uint64_t v11 = sub_2157017FC;
  }
  *a5 = v11;
  a5[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_215700F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a3 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = (void (*)(void))MEMORY[0x270FA5388](v7);
  long long v12 = (char *)&v15 - v11;
  v10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881B60);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2157108E0;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, a3);
  _AnySceneConfiguration.init<A>(erasing:)(v9, a3, a4, (uint64_t (**)())(v13 + 32));
  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, a3);
  return v13;
}

double sub_2157010A4@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  void (*v41)(_OWORD *__return_ptr, uint64_t);
  _OWORD v42[2];
  _OWORD v43[3];

  unint64_t v4 = a1[1];
  uint64_t v40 = *a1;
  uint64_t v5 = *(uint64_t (**)(void))v2;
  uint64_t v6 = *(void *)(v2 + 8);
  memset((char *)v43 + 8, 0, 32);
  uint64_t v38 = v5();
  os_log_type_t v7 = sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  uint64_t v8 = sub_21570E238();
  os_log_type_t v9 = v7;
  uint64_t v37 = a2;
  if (os_log_type_enabled(v8, v7))
  {
    swift_retain_n();
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(void *)&v43[0] = v11;
    *(_DWORD *)unint64_t v10 = 136315138;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v5;
    *(void *)(v12 + 24) = v6;
    *((void *)&v42[0] + 1) = v12;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB24AF8);
    uint64_t v13 = sub_21570E0A8();
    *(void *)&v42[0] = sub_215708FE4(v13, v14, (uint64_t *)v43);
    sub_21570E258();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2156DD000, v8, v9, "Content %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v11, -1, -1);
    MEMORY[0x2166C3490](v10, -1, -1);
  }

  uint64_t v15 = v40;
  uint64_t v16 = *(void *)(v38 + 16);
  if (v16)
  {
    uint64_t v17 = (void *)(v38 + 56);
    while (1)
    {
      os_log_t v41 = (void (*)(_OWORD *__return_ptr, uint64_t))*(v17 - 3);
      uint64_t v18 = *v17;
      long long v39 = *((_OWORD *)v17 - 1);
      swift_retain();
      swift_retain();
      os_log_type_t v19 = sub_21570E1F8();
      uint64_t v20 = sub_21570E238();
      if (os_log_type_enabled(v20, v19))
      {
        swift_retain_n();
        swift_retain_n();
        swift_bridgeObjectRetain_n();
        uint64_t v21 = swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        *(void *)&v43[0] = v22;
        *(_DWORD *)uint64_t v21 = 136315394;
        swift_retain();
        uint64_t v23 = swift_retain();
        v41(v42, v23);
        swift_release();
        swift_release();
        *(void *)(v21 + 4) = sub_215708FE4(*(uint64_t *)&v42[0], *((unint64_t *)&v42[0] + 1), (uint64_t *)v43);
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v21 + 14) = sub_215708FE4(v40, v4, (uint64_t *)v43);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2156DD000, v20, v19, "Evaluating %s) for role %s", (uint8_t *)v21, 0x16u);
        swift_arrayDestroy();
        uint64_t v24 = v22;
        uint64_t v15 = v40;
        MEMORY[0x2166C3490](v24, -1, -1);
        MEMORY[0x2166C3490](v21, -1, -1);
      }

      swift_retain();
      uint64_t v25 = swift_retain();
      v41(v42, v25);
      swift_release();
      swift_release();
      if (v42[0] == __PAIR128__(v4, v15)) {
        break;
      }
      char v26 = sub_21570E328();
      swift_bridgeObjectRelease();
      if (v26) {
        goto LABEL_12;
      }
      swift_release();
      swift_release();
      v17 += 4;
      if (!--v16) {
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    sub_2157031F4(*((uint64_t *)&v43[0] + 1));
    *((void *)&v43[0] + 1) = v41;
    v43[1] = v39;
    *(void *)&v43[2] = v18;
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
  }
  os_log_type_t v27 = sub_21570E1F8();
  unint64_t v28 = sub_21570E238();
  if (os_log_type_enabled(v28, v27))
  {
    long long v29 = *(_OWORD *)((char *)&v43[1] + 8);
    long long v30 = *(_OWORD *)((char *)v43 + 8);
    sub_215703238(*((uint64_t *)&v43[0] + 1));
    sub_215703238(v30);
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)&v43[0] = v32;
    v42[0] = v30;
    v42[1] = v29;
    sub_215703238(v30);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267881BD0);
    uint64_t v33 = sub_21570E0A8();
    *(void *)&v42[0] = sub_215708FE4(v33, v34, (uint64_t *)v43);
    sub_21570E258();
    swift_bridgeObjectRelease();
    sub_2157031F4(v30);
    sub_2157031F4(v30);
    _os_log_impl(&dword_2156DD000, v28, v27, "Made View configuration: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v32, -1, -1);
    MEMORY[0x2166C3490](v31, -1, -1);
  }

  swift_beginAccess();
  double result = *((double *)v43 + 1);
  long long v36 = *(_OWORD *)((char *)&v43[1] + 8);
  *uint64_t v37 = *(_OWORD *)((char *)v43 + 8);
  v37[1] = v36;
  return result;
}

uint64_t _AnySceneConfiguration.role.getter()
{
  return (*v0)();
}

uint64_t sub_2157016E8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 8))();
}

uint64_t sub_215701758()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 16))();
}

uint64_t sub_2157017C4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2157017FC()
{
  return sub_215700F4C(v0[4], v0[5], v0[2], v0[3]);
}

uint64_t _AnySceneConfiguration.sceneDelegate.getter()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_215701830()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for _UIAppExtensionSceneConfigWrapper()
{
  return __swift_instantiateGenericMetadata();
}

id sub_215701BD8(_OWORD *a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_215701DD8(a1);
}

uint64_t sub_215701C14(uint64_t a1)
{
  uint64_t v2 = *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v8 - v5, &v1[*(void *)(v3 + 96)], v2);
  __swift_instantiateConcreteTypeFromMangledName(qword_26AB249E0);
  if (swift_dynamicCast())
  {
    sub_2156EED90(v8, (uint64_t)v10);
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    char v6 = sub_21570DC98();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    sub_2156EED30((uint64_t)v8);
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_215701D88(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  LOBYTE(a1) = sub_215701C14((uint64_t)v4);

  return a1 & 1;
}

id sub_215701DD8(_OWORD *a1)
{
  *(_OWORD *)&v1[qword_267881B68] = *a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for _UIAppExtensionSceneConfigWrapper._SceneFactory();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_215701E5C(void *a1)
{
  uint64_t v2 = *MEMORY[0x263F8EED0] & *v1;
  id v3 = objc_msgSend(a1, sel_role);
  uint64_t v4 = sub_21570E098();
  unint64_t v6 = v5;

  long long v26 = *(_OWORD *)((char *)v1 + qword_267881B68);
  v25[0] = v4;
  v25[1] = v6;
  sub_2157010A4(v25, &v27);
  uint64_t v7 = v27;
  if ((void)v27)
  {
    uint64_t v8 = *((void *)&v27 + 1);
    uint64_t v9 = v28;
    unint64_t v10 = v29;
    swift_retain();
    swift_retain();
    os_log_type_t v11 = sub_21570E1F8();
    sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
    uint64_t v12 = sub_21570E238();
    if (os_log_type_enabled(v12, v11))
    {
      sub_215703238(v7);
      sub_215703238(v7);
      swift_bridgeObjectRetain();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(void *)&long long v26 = v24;
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)&long long v27 = v7;
      *((void *)&v27 + 1) = v8;
      unint64_t v28 = v9;
      long long v29 = v10;
      swift_retain();
      swift_retain();
      uint64_t v14 = sub_21570E0A8();
      *(void *)&long long v27 = sub_215708FE4(v14, v15, (uint64_t *)&v26);
      sub_21570E258();
      swift_bridgeObjectRelease();
      sub_2157031F4(v7);
      sub_2157031F4(v7);
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(void *)&long long v27 = sub_215708FE4(v4, v6, (uint64_t *)&v26);
      sub_21570E258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2156DD000, v12, v11, "Using %s for requested role %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2166C3490](v24, -1, -1);
      MEMORY[0x2166C3490](v13, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v20 = *(void (**)())(v2 + 88);
    *(void *)&long long v27 = *(void *)(v2 + 80);
    *((void *)&v27 + 1) = &type metadata for _AnySceneConfiguration;
    unint64_t v28 = v20;
    long long v29 = &protocol witness table for _AnySceneConfiguration;
    type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene();
    *(void *)&long long v27 = v7;
    *((void *)&v27 + 1) = v8;
    unint64_t v28 = v9;
    long long v29 = v10;
    id v21 = sub_2157031A4((char *)&v27);
    sub_2157031F4(v7);
    sub_2157031F4(v7);
  }
  else
  {
    uint64_t v16 = sub_21570E208();
    sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
    uint64_t v17 = sub_21570E238();
    if (os_log_type_enabled(v17, (os_log_type_t)v16))
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(void *)&long long v27 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&long long v26 = sub_215708FE4(v4, v6, (uint64_t *)&v27);
      sub_21570E258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2156DD000, v17, (os_log_type_t)v16, "No configuration found for requested role %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2166C3490](v19, -1, -1);
      MEMORY[0x2166C3490](v18, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v22 = *(void (**)())(v2 + 88);
    *(void *)&long long v27 = *(void *)(v2 + 80);
    *((void *)&v27 + 1) = &type metadata for _AnySceneConfiguration;
    unint64_t v28 = v22;
    long long v29 = &protocol witness table for _AnySceneConfiguration;
    type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene();
    *(void *)&long long v27 = sub_2157031F0;
    *((void *)&v27 + 1) = 0;
    unint64_t v28 = sub_215700C64;
    long long v29 = 0;
    return sub_2157031A4((char *)&v27);
  }
  return v21;
}

id sub_215702330(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  id v6 = sub_215701E5C(v4);

  return v6;
}

uint64_t sub_215702390(void *a1, uint64_t a2)
{
  return sub_215702604(a1, a2, (uint64_t (*)(void, void))sub_2156EF5CC);
}

id sub_2157023A8()
{
  return sub_215702664((uint64_t (*)(void, void, void))type metadata accessor for _UIAppExtensionSceneConfigWrapper._SceneFactory);
}

uint64_t sub_2157023C0()
{
  return swift_release();
}

id sub_2157023D4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)sub_215702418();

  return v2;
}

uint64_t sub_215702418()
{
  return (*(uint64_t (**)(void))(*(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x68) + 16))(*(void *)((*MEMORY[0x263F8EED0] & *v0) + 0x58));
}

void sub_2157024A0()
{
}

id sub_21570250C()
{
  long long v2 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x50);
  long long v3 = *(_OWORD *)((*MEMORY[0x263F8EED0] & *v0) + 0x60);
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene();
  return objc_msgSendSuper2(&v4, sel_dealloc, v2, v3);
}

uint64_t sub_215702584(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x58)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x70)]);
}

uint64_t sub_2157025EC(void *a1, uint64_t a2)
{
  return sub_215702604(a1, a2, (uint64_t (*)(void, void))sub_2157032B4);
}

uint64_t sub_215702604(void *a1, uint64_t a2, uint64_t (*a3)(void, void))
{
  return a3(*(void *)((*MEMORY[0x263F8EED0] & *a1) + 0x50), *(void *)((*MEMORY[0x263F8EED0] & *a1) + 0x58));
}

id sub_21570264C()
{
  return sub_215702664((uint64_t (*)(void, void, void))type metadata accessor for _UIAppExtensionSceneConfigWrapper);
}

id sub_215702664(uint64_t (*a1)(void, void, void))
{
  long long v2 = (objc_class *)a1(0, *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x50), *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x58));
  v4.receiver = v1;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_2157026E0(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x60)]);
}

id sub_215702748(char *a1)
{
  uint64_t v29 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v3 = *(void *)(v29 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v26 - v8;
  unint64_t v10 = v1;
  os_log_type_t v11 = sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  uint64_t v12 = sub_21570E238();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  long long v30 = a1;
  uint64_t v31 = v13;
  v13(v9, a1, v3);
  os_log_type_t v14 = v11;
  if (os_log_type_enabled(v12, v11))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(void *)&long long v34 = v27;
    unint64_t v28 = v10;
    *(_DWORD *)unint64_t v15 = 136315138;
    long long v26 = v15 + 4;
    v31(v7, v9, v3);
    uint64_t v16 = sub_21570E0A8();
    *(void *)&long long v33 = sub_215708FE4(v16, v17, (uint64_t *)&v34);
    unint64_t v10 = v28;
    sub_21570E258();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    _os_log_impl(&dword_2156DD000, v12, v14, "Creating _UIAppExtensionSceneConfigWrapper with content %s", v15, 0xCu);
    uint64_t v18 = v27;
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v18, -1, -1);
    MEMORY[0x2166C3490](v15, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  v31((char *)v10 + *(void *)((*MEMORY[0x263F8EED0] & *v10) + 0x60), v30, v3);

  sub_2156ED480(0, &qword_26AB24B08);
  id v19 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  uint64_t v20 = *(void *)(v29 + 88);
  id v21 = (objc_class *)type metadata accessor for _UIAppExtensionSceneConfigWrapper._SceneFactory();
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v20 + 8))(&v34, v3, v20);
  long long v33 = v34;
  id v22 = objc_allocWithZone(v21);
  id v23 = sub_215701DD8(&v33);
  objc_msgSend(v19, sel_setSceneFactory_, v23);

  uint64_t v24 = (objc_class *)type metadata accessor for _UIAppExtensionSceneConfigWrapper();
  v32.receiver = v10;
  v32.super_class = v24;
  return objc_msgSendSuper2(&v32, sel_init);
}

id sub_215702B2C(char *a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for _UIAppExtensionSceneConfigWrapper());
  return sub_215702748(a1);
}

uint64_t dispatch thunk of _SceneConfigurationProviding.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of _SceneConfiguration.role.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of _SceneConfiguration.sceneDelegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for _EmptySceneConfiguration()
{
  return &type metadata for _EmptySceneConfiguration;
}

ValueMetadata *type metadata accessor for _SceneConfigurationBuilder()
{
  return &type metadata for _SceneConfigurationBuilder;
}

ValueMetadata *type metadata accessor for _SceneConfigurationGroup()
{
  return &type metadata for _SceneConfigurationGroup;
}

uint64_t destroy for _AnyAppExtensionScene()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for _AnyAppExtensionScene(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for _AnyAppExtensionScene(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for _AnyAppExtensionScene(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AnyAppExtensionScene(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AnyAppExtensionScene(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)double result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)double result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _AnySceneConfiguration()
{
  return &type metadata for _AnySceneConfiguration;
}

uint64_t type metadata accessor for _UIAppExtensionSceneConfigWrapper._SceneFactory()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_215702DB4()
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

uint64_t type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene()
{
  return swift_getGenericMetadata();
}

id sub_215702E60(char *a1)
{
  uint64_t v3 = *MEMORY[0x263F8EED0] & *v1;
  uint64_t v4 = *(void *)(v3 + 0x58);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)v22 - v9;
  uint64_t v25 = v1;
  os_log_type_t v11 = sub_21570E1F8();
  sub_2156ED480(0, (unint64_t *)&qword_26AB24B10);
  uint64_t v12 = sub_21570E238();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  long long v26 = a1;
  uint64_t v27 = v13;
  v13(v10, a1, v4);
  os_log_type_t v14 = v11;
  if (os_log_type_enabled(v12, v11))
  {
    unint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    v29[0] = v23;
    uint64_t v24 = v3;
    *(_DWORD *)unint64_t v15 = 136315138;
    v22[1] = v15 + 4;
    v27(v8, v10, v4);
    uint64_t v16 = sub_21570E0A8();
    uint64_t v28 = sub_215708FE4(v16, v17, v29);
    uint64_t v3 = v24;
    sub_21570E258();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    uint64_t v18 = v23;
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v18, -1, -1);
    MEMORY[0x2166C3490](v15, -1, -1);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  id v19 = v25;
  v27(&v19[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v19) + 0x70)], v26, v4);

  v29[0] = *(void *)(v3 + 80);
  v29[1] = v4;
  long long v30 = *(_OWORD *)(v3 + 96);
  uint64_t v20 = (objc_class *)type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene();
  v31.receiver = v19;
  v31.super_class = v20;
  return objc_msgSendSuper2(&v31, sel_init);
}

id sub_2157031A4(char *a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene());
  return sub_215702E60(a1);
}

uint64_t sub_2157031F4(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_215703238(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_21570327C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_2157032B4()
{
}

uint64_t _EXHostViewController.Configuration.init(appExtension:role:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v21 = a3;
  uint64_t v5 = type metadata accessor for _EXHostViewController.Configuration();
  uint64_t v6 = (int *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21570DC68();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a2;
  uint64_t v13 = a2[1];
  unint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v15(v12, a1, v9);
  uint64_t v16 = v6[10];
  v15(v8, (uint64_t)v12, v9);
  unint64_t v17 = &v8[v6[9]];
  *(void *)unint64_t v17 = v14;
  *((void *)v17 + 1) = v13;
  *(void *)&v8[v16] = 0;
  LOBYTE(v13) = sub_21570DCB8();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v12, v9);
  v8[v6[7]] = v13 & 1;
  v8[v6[8]] = 0;
  sub_2157008BC((uint64_t)v8, v21);
  return ((uint64_t (*)(uint64_t, uint64_t))v18)(v20, v9);
}

uint64_t _EXHostViewController.Configuration.role.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (void *)(v1 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  void *v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t _EXHostViewController._configuration.setter(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881B50);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = (int *)type metadata accessor for _EXHostViewController.Configuration();
  uint64_t v8 = *((void *)v7 - 1);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_215703FDC(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, int *))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_215704044((uint64_t)v6);
    objc_msgSend(v2, sel_setConfiguration_, 0);
    return sub_215704044(a1);
  }
  else
  {
    sub_2157008BC((uint64_t)v6, (uint64_t)v10);
    sub_21570DAF8();
    uint64_t v12 = *(void *)&v10[v7[8]];
    unsigned int v18 = v10[v7[5]];
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    self;
    uint64_t v13 = (void *)swift_dynamicCastObjCClassUnconditional();
    id v14 = objc_msgSend(objc_allocWithZone((Class)_EXHostViewControllerConfiguration), sel_initWithExtensionIdentity_, v13);

    uint64_t v15 = v10[v7[6]];
    uint64_t v16 = (void *)sub_21570E068();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setRole_, v16);

    objc_msgSend(v14, sel_setInitializationParameters_, v12);
    objc_msgSend(v14, sel_setBeginHostingImmediately_, v18);
    objc_msgSend(v14, sel_setRetryOnHostingFailure_, v15);
    objc_msgSend(v2, sel_setConfiguration_, v14);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    sub_215704044(a1);
    return sub_2157040A4((uint64_t)v10);
  }
}

void _EXHostViewController.configuration.setter(void *a1)
{
  objc_msgSend(v1, sel_setConfiguration_, a1);
}

id _EXHostViewController.configuration.getter()
{
  id v1 = objc_msgSend(v0, sel_configuration);

  return v1;
}

void (*_EXHostViewController.configuration.modify(void *a1))(id *a1)
{
  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_configuration);
  return sub_215703864;
}

void sub_215703864(id *a1)
{
  id v1 = *a1;
  objc_msgSend(a1[1], sel_setConfiguration_);
}

uint64_t _EXHostViewController.appExtensionProcess.getter@<X0>(uint64_t a1@<X8>)
{
  if (objc_msgSend(v1, sel_extensionProcess))
  {
    sub_21570DBA8();
    uint64_t v3 = sub_21570DBC8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
    uint64_t v5 = v3;
    uint64_t v6 = a1;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = sub_21570DBC8();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v5 = v8;
    uint64_t v6 = a1;
    uint64_t v7 = 1;
  }

  return v4(v6, v7, 1, v5);
}

uint64_t _EXHostViewController.Configuration.appExtension.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_21570DC68();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t _EXHostViewController.Configuration.appExtension.setter(uint64_t a1)
{
  uint64_t v3 = sub_21570DC68();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*_EXHostViewController.Configuration.appExtension.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration.role.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = (void *)(v1 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  uint64_t v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;

  return swift_bridgeObjectRetain();
}

uint64_t sub_215703AA4(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(a2 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  void *v4 = v3;
  v4[1] = v2;
  return result;
}

uint64_t (*_EXHostViewController.Configuration.role.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (void *)(v1 + v3);
  uint64_t v5 = v4[1];
  *(void *)a1 = *v4;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRetain();
  return sub_215703B5C;
}

uint64_t sub_215703B5C(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = (void *)(a1[2] + *((int *)a1 + 6));
  uint64_t v4 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
  }
  return result;
}

uint64_t _EXHostViewController.Configuration.beginHostingImmediately.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 20));
}

uint64_t _EXHostViewController.Configuration.beginHostingImmediately.setter(char a1)
{
  uint64_t result = type metadata accessor for _EXHostViewController.Configuration();
  *(unsigned char *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*_EXHostViewController.Configuration.beginHostingImmediately.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration.retryOnHostingFailure.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 24));
}

uint64_t _EXHostViewController.Configuration.retryOnHostingFailure.setter(char a1)
{
  uint64_t result = type metadata accessor for _EXHostViewController.Configuration();
  *(unsigned char *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*_EXHostViewController.Configuration.retryOnHostingFailure.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration.sceneID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _EXHostViewController.Configuration.sceneID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*_EXHostViewController.Configuration.sceneID.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration._initializationParameters.getter()
{
  type metadata accessor for _EXHostViewController.Configuration();

  return swift_unknownObjectRetain();
}

uint64_t _EXHostViewController.Configuration._initializationParameters.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 32);
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*_EXHostViewController.Configuration._initializationParameters.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration.init(appExtension:sceneID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = (int *)type metadata accessor for _EXHostViewController.Configuration();
  uint64_t v9 = v8[8];
  uint64_t v10 = sub_21570DC68();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a4, a1, v10);
  uint64_t v12 = (void *)(a4 + v8[7]);
  *uint64_t v12 = a2;
  v12[1] = a3;
  *(void *)(a4 + v9) = 0;
  LOBYTE(a3) = sub_21570DCB8();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  *(unsigned char *)(a4 + v8[5]) = a3 & 1;
  *(unsigned char *)(a4 + v8[6]) = 0;
  return result;
}

uint64_t type metadata accessor for _EXHostViewController.Configuration()
{
  uint64_t result = qword_267881C18;
  if (!qword_267881C18) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_215703FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_215704044(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881B50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2157040A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for _EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _EXHostViewController._configuration.getter@<X0>(uint64_t a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_configuration);
  if (v3)
  {
    uint64_t v4 = v3;
    MEMORY[0x2166C2320](objc_msgSend(v3, sel_extensionIdentity));
    id v5 = objc_msgSend(v4, sel_role);
    uint64_t v6 = sub_21570E098();
    uint64_t v8 = v7;

    id v9 = objc_msgSend(v4, sel_initializationParameters);
    unsigned __int8 v10 = objc_msgSend(v4, sel_beginHostingImmediately);
    unsigned __int8 v11 = objc_msgSend(v4, sel_retryOnHostingFailure);

    uint64_t v12 = (int *)type metadata accessor for _EXHostViewController.Configuration();
    uint64_t v13 = v12[8];
    id v14 = (uint64_t *)(a1 + v12[7]);
    uint64_t *v14 = v6;
    v14[1] = v8;
    *(void *)(a1 + v13) = v9;
    *(unsigned char *)(a1 + v12[5]) = v10;
    *(unsigned char *)(a1 + v12[6]) = v11;
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*((void *)v12 - 1) + 56);
    uint64_t v16 = (uint64_t)v12;
    uint64_t v17 = a1;
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v19 = type metadata accessor for _EXHostViewController.Configuration();
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
    uint64_t v16 = v19;
    uint64_t v17 = a1;
    uint64_t v18 = 1;
  }

  return v15(v17, v18, 1, v16);
}

uint64_t sub_215704284(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267881B50);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215703FDC(a1, (uint64_t)v4);
  return _EXHostViewController._configuration.setter((uint64_t)v4);
}

void (*_EXHostViewController._configuration.modify(void *a1))(uint64_t a1, char a2)
{
  *a1 = v1;
  size_t v3 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267881B50) - 8) + 64);
  a1[1] = malloc(v3);
  uint64_t v4 = malloc(v3);
  a1[2] = v4;
  _EXHostViewController._configuration.getter((uint64_t)v4);
  return sub_2157043A0;
}

void sub_2157043A0(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  size_t v3 = *(void **)(a1 + 16);
  if (a2)
  {
    sub_215703FDC((uint64_t)v3, (uint64_t)v2);
    _EXHostViewController._configuration.setter((uint64_t)v2);
    sub_215704044((uint64_t)v3);
  }
  else
  {
    _EXHostViewController._configuration.setter((uint64_t)v3);
  }
  free(v3);

  free(v2);
}

uint64_t _EXHostViewController.Session.__allocating_init(processConfiguration:configuration:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v2;
  uint64_t v5 = sub_21570DB88();
  *(void *)(v3 + 128) = v5;
  *(void *)(v3 + 136) = *(void *)(v5 - 8);
  *(void *)(v3 + 144) = swift_task_alloc();
  uint64_t v6 = sub_21570DBC8();
  *(void *)(v3 + 152) = v6;
  *(void *)(v3 + 160) = *(void *)(v6 - 8);
  *(void *)(v3 + 168) = swift_task_alloc();
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v7;
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(v3 + 96) = *(unsigned char *)(a2 + 80);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 32) = v8;
  return MEMORY[0x270FA2498](sub_215704550, 0, 0);
}

uint64_t sub_215704550()
{
  (*(void (**)(void, void, void))(v0[17] + 16))(v0[18], v0[14], v0[16]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[22] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_215704608;
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[18];
  return MEMORY[0x270EEB850](v2, v3);
}

uint64_t sub_215704608()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_215704B78(v2 + 16);
    uint64_t v3 = sub_215704A40;
  }
  else
  {
    uint64_t v3 = sub_215704724;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_215704724()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = swift_task_alloc();
  v0[24] = v2;
  *(void *)(v2 + 16) = v0 + 2;
  *(void *)(v2 + 24) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[25] = v3;
  unint64_t v4 = sub_215704EF8();
  *uint64_t v3 = v0;
  v3[1] = sub_215704828;
  return MEMORY[0x270FA2360](v0 + 13, 0, 0, 0xD000000000000029, 0x80000002157151B0, sub_215704EF0, v2, v4);
}

uint64_t sub_215704828()
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 208) = v0;
  swift_task_dealloc();
  sub_215704B78(v2);
  swift_task_dealloc();
  if (v0) {
    uint64_t v3 = sub_215704AC8;
  }
  else {
    uint64_t v3 = sub_21570496C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21570496C()
{
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[19];
  (*(void (**)(void, void))(v0[17] + 8))(v0[14], v0[16]);
  uint64_t v4 = v0[13];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

uint64_t sub_215704A40()
{
  (*(void (**)(void, void))(v0[17] + 8))(v0[14], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_215704AC8()
{
  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[19];
  (*(void (**)(void, void))(v0[17] + 8))(v0[14], v0[16]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_215704B78(uint64_t a1)
{
  return a1;
}

void sub_215704BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267881C30);
  uint64_t v3 = *(void *)(v18 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v18);
  id v5 = objc_allocWithZone((Class)_EXHostViewControllerSessionConfiguration);
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_21570E068();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithSceneIdentifier_, v6);

  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v24 = *(uint64_t (**)())(a2 + 48);
  uint64_t v25 = v8;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  v17[1] = &v22;
  id v22 = sub_215704F38;
  uint64_t v23 = &block_descriptor_30;
  id v9 = _Block_copy(&aBlock);
  id v10 = v7;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_setInvalidationHandler_, v9);
  _Block_release(v9);
  objc_msgSend(v10, sel_setInitialFrame_, *(double *)(a2 + 16), *(double *)(a2 + 24), *(double *)(a2 + 32), *(double *)(a2 + 40));
  objc_msgSend(v10, sel_setRetryOnHostingFailure_, *(unsigned __int8 *)(a2 + 64));
  objc_msgSend(v10, sel_set_shouldHostRemoteTextEffectsWindow_, *(unsigned __int8 *)(a2 + 80));
  unsigned __int8 v11 = self;
  sub_21570DBB8();
  self;
  uint64_t v12 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v13 = v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v19, v18);
  unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v15 + v14, (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
  uint64_t v24 = sub_215706894;
  uint64_t v25 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v21 = 1107296256;
  id v22 = sub_215704F7C;
  uint64_t v23 = &block_descriptor_36;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_sessionWithProcess_configuration_completion_, v12, v10, v16);

  _Block_release(v16);
}

void sub_215704EF0(uint64_t a1)
{
  sub_215704BC4(a1, *(void *)(v1 + 16));
}

unint64_t sub_215704EF8()
{
  unint64_t result = qword_267881C00;
  if (!qword_267881C00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267881C00);
  }
  return result;
}

uint64_t sub_215704F38(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_215704F7C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t _EXHostViewController.Session.__allocating_init(process:configuration:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v2;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(v3 + 96) = *(unsigned char *)(a2 + 80);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 32) = v5;
  return MEMORY[0x270FA2498](sub_215705024, 0, 0);
}

uint64_t sub_215705024()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = swift_task_alloc();
  v0[16] = v2;
  *(void *)(v2 + 16) = v0 + 2;
  *(void *)(v2 + 24) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[17] = v3;
  unint64_t v4 = sub_215704EF8();
  *uint64_t v3 = v0;
  v3[1] = sub_215705128;
  return MEMORY[0x270FA2360](v0 + 13, 0, 0, 0xD00000000000001CLL, 0x80000002157151E0, sub_2157056E4, v2, v4);
}

uint64_t sub_215705128()
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  sub_215704B78(v2);
  swift_task_dealloc();
  if (v0) {
    uint64_t v3 = sub_215705328;
  }
  else {
    uint64_t v3 = sub_21570526C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_21570526C()
{
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = sub_21570DBC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v1, v4);
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v3);
}

uint64_t sub_215705328()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = sub_21570DBC8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_2157053C0(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267881C30);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3);
  id v6 = objc_allocWithZone((Class)_EXHostViewControllerSessionConfiguration);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)sub_21570E068();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithSceneIdentifier_, v7);

  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v23 = *(uint64_t (**)())(a2 + 48);
  uint64_t v24 = v9;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_215704F38;
  id v22 = &block_descriptor_0;
  id v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_setInvalidationHandler_, v10, &v21);
  _Block_release(v10);
  objc_msgSend(v8, sel_setInitialFrame_, *(double *)(a2 + 16), *(double *)(a2 + 24), *(double *)(a2 + 32), *(double *)(a2 + 40));
  objc_msgSend(v8, sel_setRetryOnHostingFailure_, *(unsigned __int8 *)(a2 + 64));
  objc_msgSend(v8, sel_set_shouldHostRemoteTextEffectsWindow_, *(unsigned __int8 *)(a2 + 80));
  unsigned __int8 v11 = self;
  sub_21570DBB8();
  self;
  uint64_t v12 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v13 = v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v18, v3);
  unint64_t v14 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v15 + v14, (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
  uint64_t v23 = sub_215706894;
  uint64_t v24 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  uint64_t v21 = sub_215704F7C;
  id v22 = &block_descriptor_27;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_sessionWithProcess_configuration_completion_, v12, v8, v16);
  _Block_release(v16);
}

void sub_2157056E4(uint64_t a1)
{
  sub_2157053C0(a1, *(void *)(v1 + 16));
}

uint64_t sub_2157056EC(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267881C30);
  return sub_21570E178();
}

NSXPCConnection __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _EXHostViewController.Session.makeXPCConnection()()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = *(void **)(v0 + 16);
  v6[0] = 0;
  id v2 = objc_msgSend(v1, sel__makeXPCConnectionWithError_, v6);
  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_21570DA08();

    swift_willThrow();
  }
  return (NSXPCConnection)v2;
}

Swift::Void __swiftcall _EXHostViewController.Session.invalidate()()
{
  objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
}

double _EXHostViewController.Session.Configuration.init(sceneID:onInvalidation:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  double result = 0.0;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(void *)(a5 + 48) = a3;
  *(void *)(a5 + 56) = a4;
  *(unsigned char *)(a5 + 64) = 0;
  *(void *)(a5 + 72) = 0;
  *(unsigned char *)(a5 + 80) = 1;
  return result;
}

uint64_t _EXHostViewController.Session.Configuration.sceneID.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _EXHostViewController.Session.Configuration.sceneID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *id v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration.sceneID.modify())()
{
  return nullsub_3;
}

double _EXHostViewController.Session.Configuration.initialFrame.getter()
{
  return *(double *)(v0 + 16);
}

void _EXHostViewController.Session.Configuration.initialFrame.setter(double a1, double a2, double a3, double a4)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
}

uint64_t (*_EXHostViewController.Session.Configuration.initialFrame.modify())()
{
  return nullsub_3;
}

uint64_t sub_2157058E0(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  swift_retain();
  uint64_t result = swift_release();
  *(void *)(a2 + 48) = sub_215706828;
  *(void *)(a2 + 56) = v5;
  return result;
}

uint64_t _EXHostViewController.Session.Configuration.onInvalidation.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t _EXHostViewController.Session.Configuration.onInvalidation.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration.onInvalidation.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Session.Configuration.retryOnHostingFailure.getter()
{
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t _EXHostViewController.Session.Configuration.retryOnHostingFailure.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 64) = result;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration.retryOnHostingFailure.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Session.Configuration._initializationParameters.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t _EXHostViewController.Session.Configuration._initializationParameters.setter(uint64_t a1)
{
  uint64_t result = swift_unknownObjectRelease();
  *(void *)(v1 + 72) = a1;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration._initializationParameters.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Session.Configuration._shouldHostRemoteTextEffectsWindow.getter()
{
  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t _EXHostViewController.Session.Configuration._shouldHostRemoteTextEffectsWindow.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 80) = result;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration._shouldHostRemoteTextEffectsWindow.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Session.deinit()
{
  return v0;
}

uint64_t _EXHostViewController.Session.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

void *_EXHostViewController.session.getter()
{
  uint64_t result = objc_msgSend(v0, sel_session);
  if (result)
  {
    uint64_t v2 = result;
    type metadata accessor for _EXHostViewController.Session();
    uint64_t result = (void *)swift_allocObject();
    result[2] = v2;
  }
  return result;
}

uint64_t type metadata accessor for _EXHostViewController.Session()
{
  return self;
}

void *sub_215705B58@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = objc_msgSend(*a1, sel_session);
  if (result)
  {
    uint64_t v4 = result;
    type metadata accessor for _EXHostViewController.Session();
    uint64_t result = (void *)swift_allocObject();
    result[2] = v4;
  }
  *a2 = result;
  return result;
}

id _EXHostViewController.session.setter(uint64_t a1)
{
  if (a1)
  {
    objc_msgSend(v1, sel_setSession_, *(void *)(a1 + 16));
    return (id)swift_release();
  }
  else
  {
    return objc_msgSend(v1, sel_setSession_, 0);
  }
}

id (*_EXHostViewController.session.modify(void *a1))(uint64_t *a1, char a2)
{
  a1[1] = v1;
  uint64_t v3 = objc_msgSend(v1, sel_session);
  if (v3)
  {
    uint64_t v4 = v3;
    type metadata accessor for _EXHostViewController.Session();
    uint64_t v3 = (void *)swift_allocObject();
    v3[2] = v4;
  }
  *a1 = v3;
  return sub_215705CA0;
}

id sub_215705CA0(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  if (a2)
  {
    if (v2) {
      uint64_t v3 = *(void *)(v2 + 16);
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = (void *)a1[1];
    goto LABEL_8;
  }
  uint64_t v4 = (void *)a1[1];
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
LABEL_8:
    objc_msgSend(v4, sel_setSession_, v3);
    return (id)swift_release();
  }

  return objc_msgSend(v4, sel_setSession_, 0);
}

id sub_215705D30@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_configuration);
  *a2 = result;
  return result;
}

id sub_215705D6C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setConfiguration_, *a1);
}

uint64_t sub_215705D80@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(a1 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;

  return swift_bridgeObjectRetain();
}

uint64_t sub_215705DD0@<X0>(uint64_t a1@<X8>)
{
  return _EXHostViewController._configuration.getter(a1);
}

uint64_t sub_215705DF8@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  *a2 = sub_215706850;
  a2[1] = (uint64_t (*)())v5;

  return swift_retain();
}

id sub_215705E6C(uint64_t a1, id *a2)
{
  if (*(void *)a1) {
    uint64_t v2 = *(void *)(*(void *)a1 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  return objc_msgSend(*a2, sel_setSession_, v2);
}

void *_s13ConfigurationVwCP_0(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_21570DC68();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    uint64_t v9 = a3[7];
    uint64_t v10 = a3[8];
    unsigned __int8 v11 = (void *)((char *)a1 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    void *v11 = *v12;
    v11[1] = v13;
    *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
  }
  return a1;
}

uint64_t _s13ConfigurationVwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t _s13ConfigurationVwcp_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a3[8];
  uint64_t v10 = (void *)(a1 + v8);
  unsigned __int8 v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t _s13ConfigurationVwca_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  uint64_t v7 = a3[7];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwtk_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  return a1;
}

uint64_t _s13ConfigurationVwta_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_21570DC68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2157062EC);
}

uint64_t sub_2157062EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21570DC68();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 28) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t _s13ConfigurationVwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2157063C4);
}

uint64_t sub_2157063C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_21570DC68();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_215706484()
{
  uint64_t result = sub_21570DC68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t method lookup function for _EXHostViewController.Session(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for _EXHostViewController.Session);
}

uint64_t _s7SessionC13ConfigurationVwxx()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t _s7SessionC13ConfigurationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t _s7SessionC13ConfigurationVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t _s7SessionC13ConfigurationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_unknownObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t _s7SessionC13ConfigurationVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 81)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s7SessionC13ConfigurationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 81) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 81) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _EXHostViewController.Session.Configuration()
{
  return &type metadata for _EXHostViewController.Session.Configuration;
}

uint64_t sub_2157067F0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_215706828()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_215706850()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t objectdestroy_23Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267881C30);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_215706930(void *a1)
{
  return sub_2157056EC(a1);
}

double AppExtensionSceneConfiguration.init<A>(_:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  void v10[4] = a1;
  v10[5] = a2;
  *(void *)a5 = sub_2157072B0;
  *(void *)(a5 + 8) = v10;
  double result = 0.0;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(void *)(a5 + 48) = 0;
  return result;
}

uint64_t (*PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)@<X0>(uint64_t (*a1)()@<X0>, uint64_t (*a2)()@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)()@<X4>, uint64_t (*a6)()@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t (**a9)()@<X8>))()
{
  double result = (uint64_t (*)())swift_allocObject();
  *((void *)result + 2) = a7;
  *((void *)result + 3) = a8;
  *((void *)result + 4) = a3;
  *((void *)result + 5) = a4;
  *a9 = sub_2157075AC;
  a9[1] = 0;
  a9[2] = a1;
  a9[3] = a2;
  a9[4] = sub_21570A248;
  a9[5] = result;
  a9[6] = a5;
  a9[7] = a6;
  return result;
}

uint64_t sub_215706AE0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  PrimitiveAppExtensionScene._makeScene(with:)(a1, a2, a3);

  return swift_bridgeObjectRelease();
}

uint64_t AppExtensionScene._makeScene(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v11 = (char *)&v14 - v10;
  (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(a1, a2, AssociatedTypeWitness, AssociatedConformanceWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
}

Swift::Bool __swiftcall AppExtensionSceneConfiguration.accept(connection:)(NSXPCConnection connection)
{
  sub_2156F96F8(v1 + 16, (uint64_t)v4);
  if (v5)
  {
    __swift_project_boxed_opaque_existential_1(v4, v5);
    char v2 = sub_21570DAD8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    sub_2156F9760((uint64_t)v4);
    char v2 = 0;
  }
  return v2 & 1;
}

uint64_t AppExtensionSceneConfiguration.init<A, B>(_:configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t (**a8)@<X0>(uint64_t (**a1)()@<X8>)@<X8>)
{
  uint64_t v26 = a6;
  uint64_t v15 = sub_21570E248();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v25 - v17;
  uint64_t v19 = (uint64_t (*)@<X0>(uint64_t (**)()@<X8>))swift_allocObject();
  *((void *)v19 + 2) = a4;
  *((void *)v19 + 3) = a5;
  uint64_t v20 = a8;
  *((void *)v19 + 4) = v26;
  *((void *)v19 + 5) = a7;
  *((void *)v19 + 6) = a1;
  *((void *)v19 + 7) = a2;
  *a8 = sub_2157075EC;
  a8[1] = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a3, v15);
  uint64_t v21 = *(void *)(a5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v18, 1, a5) == 1)
  {
    id v22 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v22(a3, v15);
    v22((uint64_t)v18, v15);
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
  }
  else
  {
    *((void *)&v28 + 1) = a5;
    uint64_t v29 = a7;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v27);
    (*(void (**)(uint64_t *, char *, uint64_t))(v21 + 32))(boxed_opaque_existential_1, v18, a5);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  }
  return sub_2157075FC((uint64_t)&v27, (uint64_t)(v20 + 2));
}

uint64_t sub_215706F64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t (**a4)()@<X8>)
{
  uint64_t v7 = (void (*)(void))MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  return _AnyAppExtensionScene.init<A>(erasing:)(v9, a2, a3, a4);
}

uint64_t _AnyAppExtensionScene.init<A>(erasing:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v18 = a3;
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, a1, a2);
  unint64_t v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  uint64_t v13 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  v13(v12 + v11, v10, a2);
  v13((unint64_t)v10, a1, a2);
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = v18;
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = v15;
  uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v13)(v14 + v11, v10, a2);
  *a4 = sub_215708200;
  a4[1] = (uint64_t (*)())v12;
  a4[2] = sub_215708244;
  a4[3] = (uint64_t (*)())v14;
  return result;
}

void sub_2157071AC(void *a1@<X8>)
{
  *a1 = sub_21570A1E4;
  a1[1] = 0;
  a1[2] = sub_215706ADC;
  a1[3] = 0;
}

uint64_t sub_2157071D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t (**a4)()@<X8>)
{
  uint64_t v7 = (void (*)(void))MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  return _AnyAppExtensionScene.init<A>(erasing:)(v9, a2, a3, a4);
}

uint64_t sub_215707278()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2157072B0@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_2157071D8(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_2157072BC()
{
  sub_2156F96F8(v0 + 16, (uint64_t)v3);
  if (v4)
  {
    __swift_project_boxed_opaque_existential_1(v3, v4);
    char v1 = sub_21570DAD8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    sub_2156F9760((uint64_t)v3);
    char v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_215707348()
{
  return sub_21570E008();
}

uint64_t PrimitiveAppExtensionScene.init<A>(id:sceneDelegate:content:onConnection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v18 = (void *)swift_allocObject();
  void v18[2] = a10;
  v18[3] = a11;
  v18[4] = a5;
  v18[5] = a6;
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  *a9 = a3;
  a9[1] = a4;
  a9[2] = a1;
  a9[3] = a2;
  a9[4] = sub_2157082B0;
  a9[5] = v18;
  a9[6] = a7;
  a9[7] = a8;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_2157074C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  uint64_t v5 = (void (*)(void))MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5();
  uint64_t v8 = sub_215709D10((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, a3);
  return v8;
}

uint64_t sub_2157075AC()
{
  return 0;
}

uint64_t sub_2157075B4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2157075EC@<X0>(uint64_t (**a1)()@<X8>)
{
  return sub_215706F64(v1[6], v1[2], v1[4], a1);
}

uint64_t sub_2157075FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267881C40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void PrimitiveAppExtensionScene.body.getter()
{
}

void sub_2157076B0()
{
}

double PrimitiveAppExtensionScene._makeScene(with:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v8 = v3[2];
  uint64_t v7 = v3[3];
  uint64_t v9 = v3[4];
  uint64_t v10 = v3[5];
  uint64_t v11 = v3[7];
  uint64_t v24 = v3[6];
  os_log_type_t v12 = sub_21570E1F8();
  sub_2156FB25C();
  uint64_t v13 = sub_21570E238();
  if (os_log_type_enabled(v13, v12))
  {
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    os_log_type_t type = v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    v25[0] = v20;
    *(_DWORD *)uint64_t v14 = 136315394;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v15 = sub_21570E0A8();
    sub_215708FE4(v15, v16, v25);
    sub_21570E258();
    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_215708FE4(a1, a2, v25);
    sub_21570E258();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2156DD000, v13, type, "Evaluating %s for requested id %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v20, -1, -1);
    MEMORY[0x2166C3490](v14, -1, -1);

    uint64_t v17 = v24;
    unint64_t v18 = a2;
    if (v8 != a1) {
      goto LABEL_6;
    }
  }
  else
  {

    uint64_t v17 = v24;
    unint64_t v18 = a2;
    if (v8 != a1) {
      goto LABEL_6;
    }
  }
  if (v7 == v18)
  {
LABEL_7:
    *a3 = v6;
    a3[1] = v5;
    a3[2] = v8;
    a3[3] = v7;
    a3[4] = v9;
    a3[5] = v10;
    a3[6] = v17;
    a3[7] = v11;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    return result;
  }
LABEL_6:
  if (sub_21570E328()) {
    goto LABEL_7;
  }
  double result = 0.0;
  *((_OWORD *)a3 + 2) = 0u;
  *((_OWORD *)a3 + 3) = 0u;
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  return result;
}

void Never._makeScene(with:)()
{
}

void Never.body.getter()
{
}

void sub_215707AB4()
{
}

void sub_215707B00()
{
}

void Array<A>.body.getter()
{
}

uint64_t Array<A>._makeScene(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  void (*v27)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (**v31)(char *, void *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void v37[9];

  objc_super v32 = a1;
  long long v33 = a2;
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](a1);
  long long v34 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  if (MEMORY[0x2166C2860](a3, a4))
  {
    uint64_t v24 = v11;
    uint64_t v25 = a6;
    uint64_t v12 = 0;
    uint64_t v35 = 0;
    long long v36 = 0;
    uint64_t v29 = a5;
    long long v30 = v10;
    long long v27 = *(void (**)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 32);
    long long v28 = a5 + 32;
    objc_super v31 = (void (**)(char *, void *, uint64_t))(v10 + 16);
    uint64_t v26 = (void (**)(char *, uint64_t))(v10 + 8);
    while (1)
    {
      char v13 = sub_21570E148();
      sub_21570E128();
      if (v13)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v30 + 16))(v34, a3+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(void *)(v30 + 72) * v12, a4);
        a6 = (void *)(v12 + 1);
        if (__OFADD__(v12, 1)) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t result = sub_21570E298();
        if (v24 != 8)
        {
          __break(1u);
          return result;
        }
        v37[0] = result;
        (*v31)(v34, v37, a4);
        swift_unknownObjectRelease();
        a6 = (void *)(v12 + 1);
        if (__OFADD__(v12, 1))
        {
LABEL_11:
          __break(1u);
          goto LABEL_12;
        }
      }
      uint64_t v14 = v34;
      v27(v37, v32, v33, a4, v29);
      sub_21570963C(0);
      (*v26)(v14, a4);
      uint64_t v15 = v37[0];
      uint64_t v16 = v37[3];
      uint64_t v35 = v37[2];
      long long v36 = v37[1];
      uint64_t v17 = v37[4];
      uint64_t v18 = v37[5];
      uint64_t v20 = v37[6];
      uint64_t v19 = v37[7];
      if (v37[0]) {
        break;
      }
      ++v12;
      if (a6 == (void *)MEMORY[0x2166C2860](a3, a4))
      {
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v15 = 0;
LABEL_14:
        a6 = v25;
        uint64_t v22 = v35;
        uint64_t v21 = v36;
        goto LABEL_15;
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_14;
  }
LABEL_12:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v15 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v20 = 0;
  uint64_t v19 = 0;
LABEL_15:
  *a6 = v15;
  a6[1] = v21;
  a6[2] = v22;
  a6[3] = v16;
  a6[4] = v17;
  a6[5] = v18;
  a6[6] = v20;
  a6[7] = v19;
  return result;
}

void sub_215707E78()
{
}

uint64_t sub_215707EC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  return Array<A>._makeScene(with:)(a1, a2, *v5, *(void *)(a3 + 16), *(void *)(a4 - 8), a5);
}

unint64_t PrimitiveAppExtensionScene.debugDescription.getter()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  sub_21570E278();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21570E0F8();
  swift_bridgeObjectRelease();
  sub_21570E0F8();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881C50);
  sub_21570E0A8();
  sub_21570E0F8();
  swift_bridgeObjectRelease();
  return 0xD00000000000001BLL;
}

uint64_t sub_215707FF0@<X0>(void (**a1)()@<X8>)
{
  uint64_t v2 = (void (*)())swift_allocObject();
  *((void *)v2 + 2) = sub_2157075AC;
  *((void *)v2 + 3) = 0;
  *((void *)v2 + 4) = 0x746C7561666564;
  *((void *)v2 + 5) = 0xE700000000000000;
  *((void *)v2 + 6) = sub_215707348;
  *((void *)v2 + 7) = 0;
  *((void *)v2 + 8) = sub_2156EF908;
  *((void *)v2 + 9) = 0;
  uint64_t v3 = (void (*)())swift_allocObject();
  *((void *)v3 + 2) = sub_2157075AC;
  *((void *)v3 + 3) = 0;
  *((void *)v3 + 4) = 0x746C7561666564;
  *((void *)v3 + 5) = 0xE700000000000000;
  *((void *)v3 + 6) = sub_215707348;
  *((void *)v3 + 7) = 0;
  *((void *)v3 + 8) = sub_2156EF908;
  *((void *)v3 + 9) = 0;
  *a1 = sub_2157076B0;
  a1[1] = v2;
  a1[2] = (void (*)())sub_21570A240;
  a1[3] = v3;

  return swift_bridgeObjectRetain();
}

uint64_t sub_215708100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v7 = (char *)&v10 - v6;
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return _AnyAppExtensionScene.init<A>(erasing:)(v7, AssociatedTypeWitness, AssociatedConformanceWitness);
}

uint64_t sub_215708200()
{
  return sub_215708100(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80)), *(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_215708244()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 32))();
}

uint64_t sub_2157082B0()
{
  return sub_2157074C8(v0[4], v0[5], v0[2]);
}

uint64_t _AnyAppExtensionScene.body.getter()
{
  return (*v0)();
}

uint64_t _AnyAppExtensionScene._makeScene(with:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_215708320()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_215708348(void *a1)
{
  void (*v9)(void *__return_ptr, void, void);
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  void (*v19)(void *__return_ptr, void, void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  void (*v26)(void *__return_ptr, void, void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  NSObject *v34;
  uint8_t *v35;
  uint64_t v36;
  char *v37;
  uint64_t (*v38)();
  uint64_t (**v39)();
  char *v40;
  uint64_t result;
  id v42;
  id v43;
  uint64_t v44;
  void (*v45)(void *__return_ptr, void, void);
  uint64_t v46;
  unint64_t v47;
  void *v48;
  NSObject *log;
  uint64_t v50;
  objc_class *v51;
  objc_super v52;
  uint64_t v53;
  long long v54;
  void (*v55)(void *__return_ptr, void, void);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  id v3 = objc_msgSend(a1, sel_role);
  uint64_t v4 = sub_21570E098();
  unint64_t v6 = v5;

  id v7 = objc_msgSend(a1, sel_parameters);
  (*(void (**)(long long *__return_ptr))(v1 + OBJC_IVAR____TtC12ExtensionKit13_SceneFactory_sceneConfiguration))(&v54);
  long long v8 = v54;
  uint64_t v9 = v55;
  uint64_t v10 = v56;
  LOBYTE(v3) = sub_21570E1F8();
  sub_2156FB25C();
  uint64_t v11 = sub_21570E238();
  uint64_t v12 = v3;
  id v50 = v4;
  uint64_t v48 = v7;
  if (os_log_type_enabled(v11, (os_log_type_t)v3))
  {
    swift_retain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    char v13 = swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v53 = v14;
    *(void *)&int v54 = v8;
    *(_DWORD *)char v13 = 136315394;
    *((void *)&v54 + 1) = *((void *)&v8 + 1);
    int64_t v55 = v9;
    uint64_t v56 = v10;
    swift_retain();
    swift_retain();
    uint64_t v15 = sub_21570E0A8();
    *(void *)&int v54 = sub_215708FE4(v15, v16, &v53);
    sub_21570E258();
    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&int v54 = sub_215708FE4(v4, v6, &v53);
    sub_21570E258();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2156DD000, v11, v12, "Root scene %s for requested role id %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v14, -1, -1);
    MEMORY[0x2166C3490](v13, -1, -1);
  }

  v9(&v54, v4, v6);
  uint64_t v17 = (uint64_t (*)(void))v54;
  if (!(void)v54)
  {
    long long v33 = sub_21570E208();
    long long v34 = sub_21570E238();
    if (os_log_type_enabled(v34, v33))
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      long long v36 = swift_slowAlloc();
      *(void *)&int v54 = v36;
      *(_DWORD *)uint64_t v35 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_215708FE4(v50, v6, (uint64_t *)&v54);
      sub_21570E258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2156DD000, v34, v33, "No configuration found for requested role id %s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2166C3490](v36, -1, -1);
      MEMORY[0x2166C3490](v35, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    uint64_t v42 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for _SceneFactory._Scene()), sel_init);
    swift_release();
    swift_release();
    return (uint64_t)v42;
  }
  uint64_t v47 = v6;
  uint64_t v18 = *((void *)&v54 + 1);
  uint64_t v19 = v55;
  uint64_t v20 = v56;
  uint64_t v21 = v57;
  uint64_t v23 = v58;
  uint64_t v22 = v59;
  uint64_t v24 = v60;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v25 = sub_21570E1F8();
  log = sub_21570E238();
  uint64_t v45 = v19;
  uint64_t v46 = v20;
  if (os_log_type_enabled(log, v25))
  {
    uint64_t v26 = v19;
    sub_215709F94((uint64_t)v17);
    swift_bridgeObjectRetain();
    sub_215709F94((uint64_t)v17);
    long long v27 = v24;
    long long v28 = swift_slowAlloc();
    id v44 = swift_slowAlloc();
    uint64_t v53 = v44;
    *(void *)&int v54 = v17;
    *(_DWORD *)long long v28 = 136315394;
    *((void *)&v54 + 1) = v18;
    int64_t v55 = v26;
    uint64_t v56 = v20;
    uint64_t v57 = v21;
    uint64_t v58 = v23;
    uint64_t v59 = v22;
    id v60 = v27;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v29 = sub_21570E0A8();
    *(void *)&int v54 = sub_215708FE4(v29, v30, &v53);
    sub_21570E258();
    swift_bridgeObjectRelease();
    sub_21570963C((uint64_t)v17);
    objc_super v31 = v23;
    objc_super v32 = v27;
    sub_21570963C((uint64_t)v17);
    *(_WORD *)(v28 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&int v54 = sub_215708FE4(v50, v47, &v53);
    sub_21570E258();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2156DD000, log, v25, "Using %s for requested role id %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2166C3490](v44, -1, -1);
    MEMORY[0x2166C3490](v28, -1, -1);
  }
  else
  {
    objc_super v31 = v23;
    objc_super v32 = v24;
    swift_bridgeObjectRelease();
  }

  if (!v17())
  {
    *(void *)&int v54 = v17;
    *((void *)&v54 + 1) = v18;
    int64_t v55 = v45;
    uint64_t v56 = v46;
    uint64_t v57 = v21;
    uint64_t v58 = v31;
    uint64_t v59 = v22;
    id v60 = v32;
    uint64_t v43 = objc_allocWithZone((Class)type metadata accessor for _SceneFactory._Scene());
    sub_215709F94((uint64_t)v17);
    uint64_t v42 = sub_215709DD8(&v54);
    swift_release();
    swift_release();

    sub_21570963C((uint64_t)v17);
    sub_21570963C((uint64_t)v17);
    return (uint64_t)v42;
  }
  swift_unknownObjectRelease();
  os_log_t v51 = (objc_class *)type metadata accessor for _SceneFactory._ExtensionUIScene();
  uint64_t v37 = (char *)objc_allocWithZone(v51);
  uint64_t v38 = (uint64_t (*)())swift_allocObject();
  *((void *)v38 + 2) = v17;
  *((void *)v38 + 3) = v18;
  *((void *)v38 + 4) = v45;
  *((void *)v38 + 5) = v46;
  *((void *)v38 + 6) = v21;
  *((void *)v38 + 7) = v31;
  *((void *)v38 + 8) = v22;
  *((void *)v38 + 9) = v32;
  long long v39 = (uint64_t (**)())&v37[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory17_ExtensionUIScene_connectionHandler];
  *long long v39 = sub_215709FFC;
  v39[1] = v38;
  sub_215709F94((uint64_t)v17);
  uint64_t v40 = v37;
  uint64_t result = v17();
  if (result)
  {
    *(void *)&v40[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory17_ExtensionUIScene__sceneDelegate] = result;

    v52.receiver = v40;
    v52.super_class = v51;
    uint64_t v42 = objc_msgSendSuper2(&v52, sel_init);
    swift_release();
    swift_release();
    sub_21570963C((uint64_t)v17);
    sub_21570963C((uint64_t)v17);

    return (uint64_t)v42;
  }
  __break(1u);
  return result;
}

id sub_215708D04()
{
  return sub_215708EFC(type metadata accessor for _SceneFactory._Scene);
}

uint64_t sub_215708DBC(char *a1, uint64_t a2, void *a3, void *a4)
{
  unint64_t v5 = *(uint64_t (**)(id))&a1[*a4];
  id v6 = a3;
  id v7 = a1;
  char v8 = v5(v6);

  return v8 & 1;
}

id sub_215708E4C()
{
  return sub_215708EFC(type metadata accessor for _SceneFactory._ExtensionUIScene);
}

id sub_215708EE4()
{
  return sub_215708EFC(type metadata accessor for _SceneFactory);
}

id sub_215708EFC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_215708F44(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_215708F6C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_215708FE4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_21570E258();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_215708FE4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2157090B8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21570A0DC((uint64_t)v12, *a3);
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
      sub_21570A0DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2157090B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21570E268();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_215709274(a5, a6);
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
  uint64_t v8 = sub_21570E2A8();
  if (!v8)
  {
    sub_21570E2B8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21570E2F8();
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

uint64_t sub_215709274(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21570930C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2157094EC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2157094EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21570930C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_215709484(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21570E288();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21570E2B8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21570E108();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21570E2F8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21570E2B8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_215709484(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267881CB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  void v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2157094EC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267881CB0);
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
  char v13 = a4 + 32;
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
  uint64_t result = sub_21570E2F8();
  __break(1u);
  return result;
}

uint64_t sub_21570963C(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2157096A0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

_UNKNOWN **sub_2157096D8()
{
  return &protocol witness table for Never;
}

uint64_t sub_2157096E4(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of _AnyAppExtensionScene.body>>, 1);
}

uint64_t destroy for AppExtensionSceneConfiguration(uint64_t a1)
{
  uint64_t result = swift_release();
  if (*(void *)(a1 + 40)) {
    return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }
  return result;
}

uint64_t initializeWithCopy for AppExtensionSceneConfiguration(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  size_t v5 = a2 + 2;
  uint64_t v6 = a2[5];
  swift_retain();
  if (v6)
  {
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v7;
    (**(void (***)(uint64_t, void *, uint64_t))(v6 - 8))(a1 + 16, v5, v6);
  }
  else
  {
    long long v8 = *((_OWORD *)v5 + 1);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
    *(_OWORD *)(a1 + 32) = v8;
    *(void *)(a1 + 48) = v5[4];
  }
  return a1;
}

uint64_t assignWithCopy for AppExtensionSceneConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v5)
    {
      *(void *)(a1 + 40) = v5;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 16, a2 + 16);
      return a1;
    }
LABEL_7:
    long long v6 = *(_OWORD *)(a2 + 16);
    long long v7 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 32) = v7;
    return a1;
  }
  if (!v5)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AppExtensionSceneConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  }
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppExtensionSceneConfiguration(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppExtensionSceneConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppExtensionSceneConfiguration()
{
  return &type metadata for AppExtensionSceneConfiguration;
}

uint64_t dispatch thunk of AppExtensionScene.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AppExtensionScene._makeScene(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t destroy for PrimitiveAppExtensionScene()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for PrimitiveAppExtensionScene(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PrimitiveAppExtensionScene(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PrimitiveAppExtensionScene(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  uint64_t v4 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PrimitiveAppExtensionScene()
{
  return &type metadata for PrimitiveAppExtensionScene;
}

ValueMetadata *type metadata accessor for AppExtensionSceneBuilder()
{
  return &type metadata for AppExtensionSceneBuilder;
}

ValueMetadata *type metadata accessor for _AnyAppExtensionScene()
{
  return &type metadata for _AnyAppExtensionScene;
}

uint64_t type metadata accessor for _SceneFactory()
{
  return self;
}

uint64_t type metadata accessor for _SceneFactory._Scene()
{
  return self;
}

uint64_t type metadata accessor for _SceneFactory._ExtensionUIScene()
{
  return self;
}

unint64_t sub_215709C68()
{
  unint64_t result = qword_267881CA0;
  if (!qword_267881CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881CA0);
  }
  return result;
}

double sub_215709CBC@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  return PrimitiveAppExtensionScene._makeScene(with:)(a1, a2, a3);
}

uint64_t sub_215709D10(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_21570E008();
}

id sub_215709DD8(_OWORD *a1)
{
  uint64_t v2 = v1;
  long long v4 = a1[1];
  v25[0] = *a1;
  v25[1] = v4;
  long long v5 = a1[3];
  long long v26 = a1[2];
  long long v27 = v5;
  uint64_t v6 = OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_viewController;
  *(void *)&v2[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_viewController] = 0;
  long long v7 = (uint64_t (*)())swift_allocObject();
  long long v8 = a1[1];
  *((_OWORD *)v7 + 1) = *a1;
  *((_OWORD *)v7 + 2) = v8;
  long long v9 = a1[3];
  *((_OWORD *)v7 + 3) = a1[2];
  *((_OWORD *)v7 + 4) = v9;
  uint64_t v10 = (uint64_t (**)())&v2[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_connectionHandler];
  *uint64_t v10 = sub_21570A24C;
  v10[1] = v7;
  size_t v11 = (uint64_t (*)(uint64_t))v26;
  uint64_t v12 = v2;
  uint64_t v13 = sub_21570A02C((uint64_t)v25);
  uint64_t v14 = v11(v13);
  sub_21570A084((uint64_t)v25);
  *(void *)&v12[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_innerView] = v14;
  swift_retain();
  uint64_t v22 = v14;
  uint64_t v23 = sub_21570DFD8();
  char v24 = sub_21570DF08();
  id v15 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267881CA8));
  swift_retain();
  swift_retain();
  uint64_t v16 = (void *)sub_21570DE48();
  id result = objc_msgSend(v16, sel_view);
  if (result)
  {
    uint64_t v18 = result;
    id v19 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v18, sel_setBackgroundColor_, v19);

    swift_release();
    swift_release();
    uint64_t v20 = *(void **)&v2[v6];
    *(void *)&v2[v6] = v16;

    v21.receiver = v12;
    v21.super_class = (Class)type metadata accessor for _SceneFactory._Scene();
    return objc_msgSendSuper2(&v21, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_215709F94(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_215709FFC()
{
  return (*(uint64_t (**)(void))(v0 + 64))() & 1;
}

uint64_t sub_21570A02C(uint64_t a1)
{
  return a1;
}

uint64_t sub_21570A084(uint64_t a1)
{
  return a1;
}

uint64_t sub_21570A0DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21570A138()
{
  unint64_t result = qword_267881CB8;
  if (!qword_267881CB8)
  {
    type metadata accessor for ExtensionPickerView.Model(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881CB8);
  }
  return result;
}

unint64_t sub_21570A190()
{
  unint64_t result = qword_267881CC0;
  if (!qword_267881CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267881CC0);
  }
  return result;
}

uint64_t objectdestroy_45Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

double sub_21570A240@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_215709CBC(a1, a2, a3);
}

uint64_t __getAPBaseExtensionShieldViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_EXUISceneSession initWithExtension:](v0);
}

void _EXExtensionPingLaunchdAfterEvent_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "Pinging launchd", v2, v3, v4, v5, v6);
}

uint64_t sub_21570D9D8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_21570D9E8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_21570D9F8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_21570DA08()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21570DA18()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_21570DA28()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_21570DA38()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21570DA48()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21570DA58()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21570DA68()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21570DA78()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_21570DA88()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_21570DA98()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_21570DAA8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_21570DAB8()
{
  return MEMORY[0x270EEB708]();
}

uint64_t sub_21570DAC8()
{
  return MEMORY[0x270EEB710]();
}

uint64_t sub_21570DAD8()
{
  return MEMORY[0x270EEB718]();
}

uint64_t sub_21570DAE8()
{
  return MEMORY[0x270EEB7B0]();
}

uint64_t sub_21570DAF8()
{
  return MEMORY[0x270EEB7B8]();
}

uint64_t sub_21570DB08()
{
  return MEMORY[0x270EEB7C0]();
}

uint64_t sub_21570DB18()
{
  return MEMORY[0x270EEB7D0]();
}

uint64_t sub_21570DB28()
{
  return MEMORY[0x270EEB7D8]();
}

uint64_t sub_21570DB38()
{
  return MEMORY[0x270EEB7E0]();
}

uint64_t sub_21570DB48()
{
  return MEMORY[0x270EEB7F8]();
}

uint64_t sub_21570DB58()
{
  return MEMORY[0x270EEB800]();
}

uint64_t sub_21570DB68()
{
  return MEMORY[0x270EEB808]();
}

uint64_t sub_21570DB78()
{
  return MEMORY[0x270EEB818]();
}

uint64_t sub_21570DB88()
{
  return MEMORY[0x270EEB848]();
}

uint64_t sub_21570DBA8()
{
  return MEMORY[0x270EEB860]();
}

uint64_t sub_21570DBB8()
{
  return MEMORY[0x270EEB868]();
}

uint64_t sub_21570DBC8()
{
  return MEMORY[0x270EEB870]();
}

uint64_t sub_21570DBD8()
{
  return MEMORY[0x270EEB888]();
}

uint64_t sub_21570DBE8()
{
  return MEMORY[0x270EEB898]();
}

uint64_t sub_21570DBF8()
{
  return MEMORY[0x270EEB8A8]();
}

uint64_t sub_21570DC08()
{
  return MEMORY[0x270EEB8B0]();
}

uint64_t sub_21570DC18()
{
  return MEMORY[0x270EEB8B8]();
}

uint64_t sub_21570DC28()
{
  return MEMORY[0x270EEB8C0]();
}

uint64_t sub_21570DC38()
{
  return MEMORY[0x270EEB8C8]();
}

uint64_t sub_21570DC48()
{
  return MEMORY[0x270EEB8D0]();
}

uint64_t sub_21570DC58()
{
  return MEMORY[0x270EEB8D8]();
}

uint64_t sub_21570DC68()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_21570DC78()
{
  return MEMORY[0x270EEB8F8]();
}

uint64_t sub_21570DC88()
{
  return MEMORY[0x270EEB900]();
}

uint64_t sub_21570DC98()
{
  return MEMORY[0x270EEB908]();
}

uint64_t sub_21570DCA8()
{
  return MEMORY[0x270EEB910]();
}

uint64_t sub_21570DCB8()
{
  return MEMORY[0x270EEB918]();
}

uint64_t sub_21570DCC8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_21570DCD8()
{
  return MEMORY[0x270EEB920]();
}

uint64_t sub_21570DCE8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21570DCF8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21570DD08()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_21570DD18()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_21570DD28()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_21570DD38()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_21570DD48()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_21570DD58()
{
  return MEMORY[0x270EFFB78]();
}

uint64_t sub_21570DD68()
{
  return MEMORY[0x270EFFB90]();
}

uint64_t sub_21570DD78()
{
  return MEMORY[0x270EFFB98]();
}

uint64_t sub_21570DD88()
{
  return MEMORY[0x270F001B0]();
}

uint64_t sub_21570DD98()
{
  return MEMORY[0x270F00FF0]();
}

uint64_t sub_21570DDA8()
{
  return MEMORY[0x270F01000]();
}

uint64_t sub_21570DDB8()
{
  return MEMORY[0x270F01068]();
}

uint64_t sub_21570DDC8()
{
  return MEMORY[0x270F01220]();
}

uint64_t sub_21570DDD8()
{
  return MEMORY[0x270F01230]();
}

uint64_t sub_21570DDE8()
{
  return MEMORY[0x270F01240]();
}

uint64_t sub_21570DDF8()
{
  return MEMORY[0x270F01260]();
}

uint64_t sub_21570DE08()
{
  return MEMORY[0x270F01268]();
}

uint64_t sub_21570DE18()
{
  return MEMORY[0x270F01278]();
}

uint64_t sub_21570DE28()
{
  return MEMORY[0x270F01508]();
}

uint64_t sub_21570DE38()
{
  return MEMORY[0x270F01698]();
}

uint64_t sub_21570DE48()
{
  return MEMORY[0x270F016A8]();
}

uint64_t sub_21570DE58()
{
  return MEMORY[0x270F016D8]();
}

uint64_t sub_21570DE68()
{
  return MEMORY[0x270F02250]();
}

uint64_t sub_21570DE78()
{
  return MEMORY[0x270F026A8]();
}

uint64_t sub_21570DE88()
{
  return MEMORY[0x270F026B8]();
}

uint64_t sub_21570DE98()
{
  return MEMORY[0x270F026C0]();
}

uint64_t sub_21570DEB8()
{
  return MEMORY[0x270F026E8]();
}

uint64_t sub_21570DEC8()
{
  return MEMORY[0x270F026F8]();
}

uint64_t sub_21570DED8()
{
  return MEMORY[0x270F02708]();
}

uint64_t sub_21570DEF8()
{
  return MEMORY[0x270F02980]();
}

uint64_t sub_21570DF08()
{
  return MEMORY[0x270F02A28]();
}

uint64_t sub_21570DF18()
{
  return MEMORY[0x270F02A40]();
}

uint64_t sub_21570DF28()
{
  return MEMORY[0x270F02A58]();
}

uint64_t sub_21570DF38()
{
  return MEMORY[0x270F02A70]();
}

uint64_t sub_21570DF48()
{
  return MEMORY[0x270F02A80]();
}

uint64_t sub_21570DF58()
{
  return MEMORY[0x270F02D70]();
}

uint64_t sub_21570DF68()
{
  return MEMORY[0x270F03230]();
}

uint64_t sub_21570DF78()
{
  return MEMORY[0x270F03258]();
}

uint64_t sub_21570DF88()
{
  return MEMORY[0x270F032C8]();
}

uint64_t sub_21570DF98()
{
  return MEMORY[0x270F032D8]();
}

uint64_t sub_21570DFA8()
{
  return MEMORY[0x270F03320]();
}

uint64_t sub_21570DFB8()
{
  return MEMORY[0x270F03550]();
}

uint64_t sub_21570DFC8()
{
  return MEMORY[0x270F036B8]();
}

uint64_t sub_21570DFD8()
{
  return MEMORY[0x270F04480]();
}

uint64_t sub_21570DFE8()
{
  return MEMORY[0x270F04730]();
}

uint64_t sub_21570DFF8()
{
  return MEMORY[0x270F04AC8]();
}

uint64_t sub_21570E008()
{
  return MEMORY[0x270F04B18]();
}

uint64_t sub_21570E018()
{
  return MEMORY[0x270F04C98]();
}

uint64_t sub_21570E028()
{
  return MEMORY[0x270F04D48]();
}

uint64_t sub_21570E038()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_21570E048()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_21570E058()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21570E068()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21570E078()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21570E088()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21570E098()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21570E0A8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21570E0C8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21570E0D8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_21570E0E8()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_21570E0F8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21570E108()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21570E118()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_21570E128()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_21570E138()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21570E148()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_21570E158()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_21570E168()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21570E178()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_21570E198()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_21570E1A8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_21570E1B8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21570E1C8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21570E1D8()
{
  return MEMORY[0x270EEB928]();
}

uint64_t sub_21570E1E8()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_21570E1F8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21570E208()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21570E218()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21570E228()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21570E238()
{
  return MEMORY[0x270EEB930]();
}

uint64_t sub_21570E248()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21570E258()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21570E268()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21570E278()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21570E288()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21570E298()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_21570E2A8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21570E2B8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21570E2C8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21570E2D8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21570E2E8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21570E2F8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21570E318()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_21570E328()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21570E358()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21570E368()
{
  return MEMORY[0x270F9FC90]();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x270EE4E88](allocator, activities, repeats, order, callout, context);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
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

uint64_t _EXDefaultLog()
{
  return MEMORY[0x270EEB940]();
}

uint64_t _EXSignpostLog()
{
  return MEMORY[0x270EEB948]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x270ED8468]();
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x270F9A420](cls, protocol);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x270FA02A0]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x270FA0388]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x270FA0678]();
}