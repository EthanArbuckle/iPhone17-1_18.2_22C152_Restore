void sub_18FB2149C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FB21684(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18FB23378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18FB23C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_18FB24628(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18FB249E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
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

void sub_18FB25D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
}

void sub_18FB264DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,id a61)
{
}

void sub_18FB276E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id getSLCollaborationSigningControllerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSLCollaborationSigningControllerClass_softClass;
  uint64_t v7 = getSLCollaborationSigningControllerClass_softClass;
  if (!getSLCollaborationSigningControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getSLCollaborationSigningControllerClass_block_invoke;
    v3[3] = &unk_1E5665A60;
    v3[4] = &v4;
    __getSLCollaborationSigningControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_18FB2816C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSLCollaborationSigningControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SocialLayerLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SocialLayerLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5665CB8;
    uint64_t v6 = 0;
    SocialLayerLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!SocialLayerLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SLCollaborationSigningController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getSLCollaborationSigningControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSLCollaborationSigningControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SocialLayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SocialLayerLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_18FB2AA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FB2B05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18FB2BA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void type metadata accessor for Identifier()
{
  if (!qword_1E9265B30)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1E9265B30);
    }
  }
}

uint64_t sub_18FB2D378(uint64_t a1, uint64_t a2)
{
  return sub_18FB2D71C(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_18FB2D390(uint64_t a1, id *a2)
{
  uint64_t result = sub_18FB55A60();
  *a2 = 0;
  return result;
}

uint64_t sub_18FB2D408(uint64_t a1, id *a2)
{
  char v3 = sub_18FB55A70();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_18FB2D488@<X0>(uint64_t *a1@<X8>)
{
  sub_18FB55A80();
  uint64_t v2 = sub_18FB55A50();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_18FB2D4D0()
{
  uint64_t v0 = sub_18FB55A80();
  uint64_t v2 = v1;
  if (v0 == sub_18FB55A80() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_18FB55DA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_18FB2D55C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18FB55A80();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18FB2D588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_18FB55A50();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_18FB2D5D0(uint64_t a1)
{
  uint64_t v2 = sub_18FB2D828(&qword_1E9265B50);
  uint64_t v3 = sub_18FB2D828(&qword_1E9265B58);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_18FB2D668()
{
  return sub_18FB2D828(&qword_1E9265B38);
}

uint64_t sub_18FB2D69C()
{
  return sub_18FB2D828(&qword_1E9265B40);
}

uint64_t sub_18FB2D6D0()
{
  return sub_18FB2D828(&qword_1E9265B48);
}

uint64_t sub_18FB2D704(uint64_t a1, uint64_t a2)
{
  return sub_18FB2D71C(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_18FB2D71C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_18FB55A80();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_18FB2D760()
{
  sub_18FB55A80();
  sub_18FB55AA0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_18FB2D7B4()
{
  sub_18FB55A80();
  sub_18FB55DE0();
  sub_18FB55AA0();
  uint64_t v0 = sub_18FB55DF0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_18FB2D828(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Identifier();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18FB2D870()
{
  uint64_t v0 = sub_18FB55BD0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_18FB55BC0();
  MEMORY[0x1F4188790](v5, v6);
  uint64_t v7 = sub_18FB55A40();
  MEMORY[0x1F4188790](v7 - 8, v8);
  sub_18FB2EF00(0, (unint64_t *)&unk_1E92662D0);
  sub_18FB55A30();
  v10[1] = MEMORY[0x1E4FBC860];
  sub_18FB2EF3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265CF0);
  sub_18FB2EF94(&qword_1E9265CF8, &qword_1E9265CF0);
  sub_18FB55CA0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E4FBCC58], v0);
  uint64_t result = sub_18FB55C00();
  qword_1E9265C80 = result;
  return result;
}

uint64_t static SWCollaborationMetadata.transferRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265C88);
  MEMORY[0x1F4188790](v32, v2);
  v31 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265EA0);
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_18FB553F0();
  uint64_t v27 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265C90);
  uint64_t v28 = *(void *)(v30 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v30, v11);
  v29 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12, v14);
  v26 = (char *)v25 - v15;
  sub_18FB55A80();
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v16(v7, 1, 1, v8);
  sub_18FB553C0();
  *(void *)(swift_allocObject() + 16) = v1;
  sub_18FB2EF00(0, &qword_1E9265CA8);
  v25[1] = sub_18FB2E300();
  sub_18FB553A0();
  sub_18FB55A80();
  v16(v7, 1, 1, v27);
  sub_18FB553C0();
  *(void *)(swift_allocObject() + 16) = v1;
  uint64_t v17 = v29;
  sub_18FB553A0();
  v18 = &v31[*(int *)(v32 + 48)];
  uint64_t v19 = v28;
  v20 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  v21 = v26;
  uint64_t v22 = v30;
  v20(v31, v26, v30);
  v20(v18, v17, v22);
  sub_18FB553B0();
  v23 = *(void (**)(char *, uint64_t))(v19 + 8);
  v23(v17, v22);
  return ((uint64_t (*)(char *, uint64_t))v23)(v21, v22);
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

uint64_t sub_18FB2DED4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_18FB2DFAC;
  v3[17] = v2;
  return MEMORY[0x1F4188298](sub_18FB2EA64, 0, 0);
}

uint64_t sub_18FB2DFAC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_18FB2E0D8, 0, 0);
}

uint64_t sub_18FB2E0D8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = self;
  *(void *)(v0 + 16) = 0;
  id v3 = objc_msgSend(v2, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v1, 1, v0 + 16);
  id v4 = *(id *)(v0 + 16);
  uint64_t v5 = *(void **)(v0 + 32);
  if (v3)
  {
    uint64_t v6 = sub_18FB55280();
    uint64_t v8 = v7;

    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v9(v6, v8);
  }
  else
  {
    sub_18FB55200();

    swift_willThrow();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_18FB2E254()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_18FB2E264(uint64_t *a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_18FB2EFD8;
  return sub_18FB2DED4(a1);
}

unint64_t sub_18FB2E300()
{
  unint64_t result = qword_1E9265CB0;
  if (!qword_1E9265CB0)
  {
    sub_18FB2EF00(255, &qword_1E9265CA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1E9265CB0);
  }
  return result;
}

uint64_t sub_18FB2E368(uint64_t *a1)
{
  uint64_t v2 = *a1;
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v3;
  *id v3 = v1;
  v3[1] = sub_18FB2E440;
  v3[17] = v2;
  return MEMORY[0x1F4188298](sub_18FB2EA64, 0, 0);
}

uint64_t sub_18FB2E440(uint64_t a1)
{
  *(void *)(*(void *)v1 + 32) = a1;
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_18FB2E56C, 0, 0);
}

uint64_t sub_18FB2E56C()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F3BE08]), sel_initWithAPIMetadata_, *(void *)(v0 + 32));
  uint64_t v2 = self;
  *(void *)(v0 + 16) = 0;
  id v3 = objc_msgSend(v2, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v1, 1, v0 + 16);
  id v4 = *(id *)(v0 + 16);
  uint64_t v5 = *(void **)(v0 + 32);
  if (v3)
  {
    uint64_t v6 = sub_18FB55280();
    uint64_t v8 = v7;

    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
    return v9(v6, v8);
  }
  else
  {
    sub_18FB55200();

    swift_willThrow();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_18FB2E714()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_18FB2E724(uint64_t *a1)
{
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *id v3 = v1;
  v3[1] = sub_18FB2E7C0;
  return sub_18FB2E368(a1);
}

uint64_t sub_18FB2E7C0(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
  return v5(a1, a2);
}

uint64_t sub_18FB2E8CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18FB2E8E8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265CE0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    id v8 = a2;
    uint64_t v9 = sub_18FB55280();
    uint64_t v11 = v10;

    uint64_t v12 = *(uint64_t **)(*(void *)(v3 + 64) + 40);
    *uint64_t v12 = v9;
    v12[1] = v11;
    return MEMORY[0x1F4188200](v3);
  }
}

uint64_t sub_18FB2E9C0()
{
  return sub_18FB2EF94(&qword_1E9265CC8, &qword_1E9265CD0);
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

uint64_t sub_18FB2EA44(uint64_t a1)
{
  *(void *)(v1 + 136) = a1;
  return MEMORY[0x1F4188298](sub_18FB2EA64, 0, 0);
}

uint64_t sub_18FB2EA64()
{
  id v1 = objc_msgSend(*(id *)(v0 + 136), sel_sourceProcessData);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_18FB55280();
    unint64_t v5 = v4;

    sub_18FB2EEA8(v3, v5);
    uint64_t v11 = *(uint64_t (**)(id))(v0 + 8);
    id v6 = *(id *)(v0 + 136);
    return v11(v6);
  }
  else
  {
    if (qword_1E9265A50 != -1) {
      swift_once();
    }
    uint64_t v8 = *(void *)(v0 + 136);
    id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA5618]), sel_initWithTargetSerialQueue_synchronous_, qword_1E9265C80, 1);
    *(void *)(v0 + 144) = v9;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 120;
    *(void *)(v0 + 24) = sub_18FB2EC54;
    uint64_t v10 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x1E4F143A8];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_18FB2E8E8;
    *(void *)(v0 + 104) = &block_descriptor;
    *(void *)(v0 + 112) = v10;
    objc_msgSend(v9, sel_signSourceProcessWithMetadata_timeout_completion_, v8, v0 + 80, 5.0);
    return MEMORY[0x1F41881E8](v0 + 16);
  }
}

uint64_t sub_18FB2EC54()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = sub_18FB2EE1C;
  }
  else {
    uint64_t v2 = sub_18FB2ED64;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_18FB2ED64()
{
  uint64_t v1 = *(void **)(v0 + 136);
  uint64_t v2 = *(void **)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 120);
  unint64_t v4 = *(void *)(v0 + 128);
  unint64_t v5 = (void *)sub_18FB55270();
  sub_18FB2EEA8(v3, v4);
  objc_msgSend(v1, sel_setSourceProcessData_, v5);

  uint64_t v8 = *(uint64_t (**)(id))(v0 + 8);
  id v6 = *(id *)(v0 + 136);
  return v8(v6);
}

uint64_t sub_18FB2EE1C()
{
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = (void *)v0[19];
  uint64_t v3 = (void *)v0[17];
  swift_willThrow();

  id v4 = v3;
  unint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v6 = v0[17];
  return v5(v6);
}

uint64_t sub_18FB2EEA8(uint64_t a1, unint64_t a2)
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

uint64_t sub_18FB2EF00(uint64_t a1, unint64_t *a2)
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

unint64_t sub_18FB2EF3C()
{
  unint64_t result = qword_1E9265CE8;
  if (!qword_1E9265CE8)
  {
    sub_18FB55BC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9265CE8);
  }
  return result;
}

uint64_t sub_18FB2EF94(unint64_t *a1, uint64_t *a2)
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

void _SWCollaborationBarButtonItem.setDetailViewListContent<A>(_:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_collaborationButtonView);
  id v6 = objc_msgSend(v5, sel_buttonView);

  sub_18FB3E604(a1, a2);
}

void _SWCollaborationBarButtonItem.setDetailViewListContent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_msgSend(v3, sel_collaborationButtonView);
  id v8 = objc_msgSend(v7, sel_buttonView);

  sub_18FB3E630(a1, a2, a3);
}

id _SWCollaborationBarButtonItem.highlight.getter()
{
  id v1 = objc_msgSend(v0, sel_collaborationButtonView);
  uint64_t v2 = (char *)objc_msgSend(v1, sel_buttonView);

  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_collaborationHighlight);
  return v3;
}

void _SWCollaborationBarButtonItem.highlight.setter(void *a1)
{
  id v2 = objc_msgSend(v1, sel_collaborationButtonView);
  id v3 = (char *)objc_msgSend(v2, sel_buttonView);

  objc_msgSend(*(id *)&v3[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_setCollaborationHighlight_, a1);
}

uint64_t _SWCollaborationBarButtonItem.customContentTitle.getter()
{
  id v1 = objc_msgSend(v0, sel_collaborationButtonView);
  id v2 = (char *)objc_msgSend(v1, sel_buttonView);

  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();

  swift_release();
  swift_release();
  return v5;
}

void sub_18FB2F454(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_bridgeObjectRetain();
  id v3 = objc_msgSend(v2, sel_collaborationButtonView);
  id v4 = (char *)objc_msgSend(v3, sel_buttonView);

  id v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB554A0();
}

void _SWCollaborationBarButtonItem.customContentTitle.setter()
{
  id v1 = objc_msgSend(v0, sel_collaborationButtonView);
  id v2 = (char *)objc_msgSend(v1, sel_buttonView);

  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB554A0();
}

void (*_SWCollaborationBarButtonItem.customContentTitle.modify(void *a1))(uint64_t **a1, char a2)
{
  id v2 = v1;
  id v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = v2;
  id v5 = objc_msgSend(v2, sel_collaborationButtonView);
  id v6 = (char *)objc_msgSend(v5, sel_buttonView);

  id v7 = objc_msgSend(*(id *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();

  *(_OWORD *)id v4 = *((_OWORD *)v4 + 1);
  return sub_18FB2F720;
}

void sub_18FB2F720(uint64_t **a1, char a2)
{
  id v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  id v5 = (void *)(*a1)[4];
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v6 = objc_msgSend(v5, sel_collaborationButtonView);
    id v7 = (char *)objc_msgSend(v6, sel_buttonView);

    id v8 = objc_msgSend(*(id *)&v7[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    v2[2] = v4;
    v2[3] = v3;
    sub_18FB554A0();

    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = objc_msgSend((id)(*a1)[4], sel_collaborationButtonView);
    uint64_t v10 = (char *)objc_msgSend(v9, sel_buttonView);

    id v11 = objc_msgSend(*(id *)&v10[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    v2[2] = v4;
    v2[3] = v3;
    sub_18FB554A0();
  }

  free(v2);
}

uint64_t _SWCollaborationBarButtonItem.customCollaborators.getter()
{
  id v1 = objc_msgSend(v0, sel_collaborationButtonView);
  id v2 = (char *)objc_msgSend(v1, sel_buttonView);

  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();

  swift_release();
  swift_release();
  return v5;
}

void sub_18FB2F990(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_bridgeObjectRetain();
  id v3 = objc_msgSend(v2, sel_collaborationButtonView);
  uint64_t v4 = (char *)objc_msgSend(v3, sel_buttonView);

  id v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB554A0();
}

void _SWCollaborationBarButtonItem.customCollaborators.setter()
{
  id v1 = objc_msgSend(v0, sel_collaborationButtonView);
  id v2 = (char *)objc_msgSend(v1, sel_buttonView);

  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB554A0();
}

void (*_SWCollaborationBarButtonItem.customCollaborators.modify(void *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  id v3 = objc_msgSend(v1, sel_collaborationButtonView);
  uint64_t v4 = (char *)objc_msgSend(v3, sel_buttonView);

  id v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();

  *a1 = a1[1];
  return sub_18FB2FC2C;
}

void sub_18FB2FC2C(uint64_t *a1, char a2)
{
  id v2 = a1 + 1;
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)a1[2];
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v6 = objc_msgSend(v4, sel_collaborationButtonView);
    id v7 = (char *)objc_msgSend(v6, sel_buttonView);

    id v8 = objc_msgSend(*(id *)&v7[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    a1[1] = v3;
    sub_18FB554A0();

    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = objc_msgSend((id)a1[2], sel_collaborationButtonView);
    id v11 = (char *)objc_msgSend(v9, sel_buttonView);

    id v10 = objc_msgSend(*(id *)&v11[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    void *v2 = v3;
    sub_18FB554A0();
  }
}

void __swiftcall _SWCollaborationBarButtonItem.init(highlight:)(_SWCollaborationBarButtonItem *__return_ptr retstr, SWHighlight_optional highlight)
{
  Class isa = highlight.value.super.isa;
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHighlight_, highlight.value.super.isa);
}

id _SWCollaborationBarButtonItem.init(highlight:)(void *a1)
{
  id v2 = v1;
  id v4 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationDetailViewController), sel_initWithHighlight_, a1);
  id v5 = objc_allocWithZone((Class)type metadata accessor for _SWCollaborationButtonViewImpl());
  id v6 = sub_18FB3F658(v4);
  id v7 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v6);
  id v8 = objc_msgSend(v2, sel_initWithCollaborationButtonView_, v7);

  return v8;
}

id _SWCollaborationBarButtonItem.init<A>(highlight:detailViewListContent:)(void *a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for _SWCollaborationButtonViewImpl();
  id v6 = sub_18FB43598(a1, a2, a3);
  id v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v8 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v6);
  id v9 = objc_msgSend(v7, sel_initWithCollaborationButtonView_, v8);

  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a2, a3);
  return v9;
}

id _SWCollaborationBarButtonItem.init<A>(highlight:detailViewListContent:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _SWCollaborationButtonViewImpl();
  id v8 = sub_18FB43628(a1, a2, a3, a4);
  id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v10 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v8);
  id v11 = objc_msgSend(v9, sel_initWithCollaborationButtonView_, v10);

  return v11;
}

id _SWCollaborationBarButtonItem.updateHighlight<A>(_:newListContent:)(uint64_t a1)
{
  return objc_msgSend(v1, sel_setHighlight_, a1);
}

{
  void *v1;

  return objc_msgSend(v1, sel_setHighlight_, a1);
}

double sub_18FB30264@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_18FB302E4(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_18FB554A0();
}

uint64_t sub_18FB30364@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18FB303E4(uint64_t a1, void **a2)
{
  id v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_18FB554A0();
}

char *keypath_get_selector_highlight()
{
  return sel_highlight;
}

id sub_18FB30478@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_highlight);
  *a2 = result;
  return result;
}

id sub_18FB304B4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setHighlight_, *a1);
}

uint64_t sub_18FB304C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _SWCollaborationBarButtonItem.customContentTitle.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18FB304F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _SWCollaborationBarButtonItem.customCollaborators.getter();
  *a1 = result;
  return result;
}

uint64_t sub_18FB30528(char a1)
{
  uint64_t v2 = sub_18FB553F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  id v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    uint64_t v19 = MEMORY[0x1E4FBC860];
    id v9 = objc_msgSend(self, sel_readableTypeIdentifiersForItemProvider);
    uint64_t v10 = sub_18FB55B00();

    sub_18FB30794(v10);
    id v11 = objc_msgSend(self, sel_readableTypeIdentifiersForItemProvider);
    uint64_t v8 = sub_18FB55B00();

    goto LABEL_5;
  }
  if (a1 == 1)
  {
    uint64_t v19 = MEMORY[0x1E4FBC860];
    id v7 = objc_msgSend(self, sel_readableTypeIdentifiersForItemProvider);
    uint64_t v8 = sub_18FB55B00();

LABEL_5:
    sub_18FB30794(v8);
    uint64_t v12 = sub_18FB38874(v19);
    swift_bridgeObjectRelease();
    return v12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265EC8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18FB586C0;
  sub_18FB553E0();
  uint64_t v14 = sub_18FB553D0();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  *(void *)(inited + 32) = v14;
  *(void *)(inited + 40) = v16;
  if (*(void *)(inited + 16))
  {
    uint64_t v12 = sub_18FB385DC(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
  }
  else
  {
    swift_setDeallocating();
    swift_arrayDestroy();
    return MEMORY[0x1E4FBC870];
  }
  return v12;
}

uint64_t sub_18FB30794(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_18FB37100(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_18FB55D60();
  __break(1u);
  return result;
}

uint64_t sub_18FB308E8(char a1)
{
  return *(void *)&aCloudkitcustom[8 * a1];
}

uint64_t sub_18FB30908(char *a1, char *a2)
{
  return sub_18FB48C3C(*a1, *a2);
}

uint64_t sub_18FB30914()
{
  return sub_18FB48CC4();
}

uint64_t sub_18FB3091C()
{
  return sub_18FB48DF0();
}

uint64_t sub_18FB30924()
{
  return sub_18FB48E44();
}

uint64_t sub_18FB3092C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_18FB3890C();
  *a1 = result;
  return result;
}

uint64_t sub_18FB3095C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18FB308E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_18FB30988(void *a1@<X8>)
{
  *a1 = &unk_1EDF18D98;
}

unint64_t sub_18FB30998(void *a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    if (a2 >> 62 == 1)
    {
      id v4 = a1;
      sub_18FB55CE0();
      sub_18FB55AC0();
      sub_18FB55D20();
      sub_18FB55AC0();
      sub_18FB55AC0();
      sub_18FB55AC0();
      id v5 = objc_msgSend(v4, sel_description);
      sub_18FB55A80();

      sub_18FB55AC0();
      swift_bridgeObjectRelease();
      sub_18FB55AC0();

      swift_bridgeObjectRelease();
    }
    else
    {
      sub_18FB55AC0();
    }
  }
  else
  {
    id v6 = a1;
    sub_18FB55CE0();
    sub_18FB55AC0();
    id v7 = objc_msgSend(v6, sel_description);
    sub_18FB55A80();

    sub_18FB55AC0();
    swift_bridgeObjectRelease();
    sub_18FB55AC0();
    swift_bridgeObjectRelease();
    sub_18FB3A760(a1, a2);
  }
  return 0xD00000000000001DLL;
}

unint64_t sub_18FB30C04()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_18FB55260();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  id v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CollaborationInfo(0);
  MEMORY[0x1F4188790](v7, v8);
  uint64_t v10 = (void **)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_18FB3A034(v1, (uint64_t)v10);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
    {
      (*(void (**)(char *, void **, uint64_t))(v3 + 32))(v6, v10, v2);
      unint64_t v19 = 0;
      unint64_t v20 = 0xE000000000000000;
      sub_18FB55CE0();
      swift_bridgeObjectRelease();
      unint64_t v19 = 0xD000000000000018;
      unint64_t v20 = 0x800000018FB5AC70;
      sub_18FB55220();
      sub_18FB55AC0();
      swift_bridgeObjectRelease();
      sub_18FB55AC0();
      unint64_t v17 = v19;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return v17;
    }
    BOOL v12 = *v10;
    unint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
    sub_18FB55CE0();
    swift_bridgeObjectRelease();
    unint64_t v19 = 0xD000000000000018;
    unint64_t v20 = 0x800000018FB5AC30;
    id v13 = objc_msgSend(v12, sel_description);
    sub_18FB55A80();

    sub_18FB55AC0();
    swift_bridgeObjectRelease();
    sub_18FB55AC0();
  }
  else
  {
    int64_t v14 = *v10;
    BOOL v12 = v10[1];
    unint64_t v19 = 0;
    unint64_t v20 = 0xE000000000000000;
    sub_18FB55CE0();
    sub_18FB55AC0();
    sub_18FB55AC0();
    swift_bridgeObjectRelease();
    sub_18FB55AC0();
    id v15 = objc_msgSend(v14, sel_description);
    sub_18FB55A80();

    sub_18FB55AC0();
    swift_bridgeObjectRelease();
    sub_18FB55AC0();
    id v16 = objc_msgSend(v12, sel_description);
    sub_18FB55A80();

    sub_18FB55AC0();
    swift_bridgeObjectRelease();
    sub_18FB55AC0();
  }
  return v19;
}

id CollaborationDetailViewModel.itemProvider.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void CollaborationDetailViewModel.itemProvider.setter(void *a1)
{
  sub_18FB39240(a1);
}

void (*CollaborationDetailViewModel.itemProvider.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_18FB3115C;
}

void sub_18FB3115C(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void **)(v3[3] + v3[4]);
    uint64_t v5 = (char *)swift_allocObject();
    swift_unknownObjectWeakInit();
    id v6 = v4;
    swift_retain();
    sub_18FB38958(v6, (char *)sub_18FB39340, v5);
    swift_release_n();
  }

  free(v3);
}

id sub_18FB31214()
{
  uint64_t v1 = OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)SWHighlightCenter), sel_init);
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t CollaborationDetailViewModel.cloudSharingControllerDelegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
  swift_beginAccess();
  return MEMORY[0x192FBDAA0](v1);
}

uint64_t CollaborationDetailViewModel.cloudSharingControllerDelegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*CollaborationDetailViewModel.cloudSharingControllerDelegate.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
  v3[4] = v1;
  void v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x192FBDAA0](v5);
  return sub_18FB31464;
}

void sub_18FB31464(void **a1, char a2)
{
  id v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

uint64_t sub_18FB314E4()
{
  return sub_18FB317E4();
}

uint64_t sub_18FB31588()
{
  return sub_18FB31938();
}

uint64_t sub_18FB316C8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_18FB317D0()
{
  return sub_18FB317E4();
}

uint64_t sub_18FB317E4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();

  return swift_release();
}

uint64_t sub_18FB31924()
{
  return sub_18FB31938();
}

uint64_t sub_18FB31938()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CollaborationDetailViewModel.manageButtonTitle.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CollaborationDetailViewModel.manageButtonTitle.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_18FB554A0();
}

uint64_t sub_18FB31C58@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_18FB31CD8(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_18FB554A0();
}

uint64_t (*CollaborationDetailViewModel.manageButtonTitle.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_18FB55480();
  return sub_18FB31DE4;
}

uint64_t CollaborationDetailViewModel.$manageButtonTitle.getter()
{
  return sub_18FB322F4((uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle, &qword_1E9265D18);
}

uint64_t CollaborationDetailViewModel.$manageButtonTitle.setter(uint64_t a1)
{
  return sub_18FB32564(a1, &qword_1E9265D20, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle, &qword_1E9265D18);
}

uint64_t (*CollaborationDetailViewModel.$manageButtonTitle.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D20);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D18);
  sub_18FB55460();
  swift_endAccess();
  return sub_18FB31F28;
}

uint64_t CollaborationDetailViewModel.showManageButton.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();
  return v1;
}

uint64_t CollaborationDetailViewModel.showManageButton.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return sub_18FB554A0();
}

uint64_t sub_18FB320FC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18FB3217C(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_18FB554A0();
}

uint64_t (*CollaborationDetailViewModel.showManageButton.modify(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_18FB55480();
  return sub_18FB31DE4;
}

void sub_18FB32278(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t CollaborationDetailViewModel.$showManageButton.getter()
{
  return sub_18FB322F4((uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton, &qword_1E9265D30);
}

uint64_t sub_18FB322F4(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_18FB3235C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_18FB323CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v9, v11);
  int64_t v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12, v15);
  unint64_t v17 = (char *)&v20 - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v18((char *)&v20 - v16, a1, v9);
  v18(v14, (uint64_t)v17, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_18FB55470();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v17, v9);
}

uint64_t CollaborationDetailViewModel.$showManageButton.setter(uint64_t a1)
{
  return sub_18FB32564(a1, &qword_1E9265D38, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton, &qword_1E9265D30);
}

uint64_t sub_18FB32564(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_18FB55470();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*CollaborationDetailViewModel.$showManageButton.modify(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D38);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D30);
  sub_18FB55460();
  swift_endAccess();
  return sub_18FB31F28;
}

void sub_18FB327A4(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_18FB55470();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_18FB55470();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

id CollaborationDetailViewModel.__allocating_init(itemProvider:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return CollaborationDetailViewModel.init(itemProvider:)(a1);
}

id CollaborationDetailViewModel.init(itemProvider:)(void *a1)
{
  v87 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D30);
  uint64_t v85 = *(void *)(v2 - 8);
  uint64_t v86 = v2;
  MEMORY[0x1F4188790](v2, v3);
  v84 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D18);
  uint64_t v82 = *(void *)(v5 - 8);
  uint64_t v83 = v5;
  MEMORY[0x1F4188790](v5, v6);
  v81 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D40);
  uint64_t v79 = *(void *)(v8 - 8);
  uint64_t v80 = v8;
  MEMORY[0x1F4188790](v8, v9);
  v78 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D48);
  uint64_t v76 = *(void *)(v11 - 8);
  uint64_t v77 = v11;
  MEMORY[0x1F4188790](v11, v12);
  v75 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_18FB552F0();
  uint64_t v73 = *(void *)(v14 - 8);
  uint64_t v74 = v14;
  uint64_t v16 = MEMORY[0x1F4188790](v14, v15);
  v72 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16, v18);
  v71 = (char *)&v66 - v19;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D50);
  uint64_t v69 = *(void *)(v70 - 8);
  MEMORY[0x1F4188790](v70, v20);
  v68 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D58);
  uint64_t v66 = *(void *)(v67 - 8);
  MEMORY[0x1F4188790](v67, v22);
  v24 = (char *)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D60);
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25, v27);
  v29 = (char *)&v66 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  uint64_t v32 = MEMORY[0x1F4188790](v30, v31);
  v34 = (char *)&v66 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v32, v35);
  v37 = (char *)&v66 - v36;
  *(void *)&v1[OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter] = 0;
  swift_unknownObjectWeakInit();
  v38 = &v1[OBJC_IVAR___SWCollaborationDetailViewModel__collaborationInfo];
  uint64_t v39 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v37, 1, 1, v39);
  sub_18FB3A1E4((uint64_t)v37, (uint64_t)v34, &qword_1E9265D68);
  v40 = v1;
  sub_18FB55450();
  sub_18FB3A3FC((uint64_t)v37, &qword_1E9265D68);
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v38, v29, v25);
  v41 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__highlight];
  uint64_t v90 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D88);
  sub_18FB55450();
  (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v41, v24, v67);
  v42 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__customContentTitle];
  uint64_t v90 = 0;
  uint64_t v91 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D98);
  v43 = v68;
  sub_18FB55450();
  (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v42, v43, v70);
  v44 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__headerFallback];
  v45 = v71;
  sub_18FB552B0();
  uint64_t v46 = v73;
  uint64_t v47 = v74;
  (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v72, v45, v74);
  v48 = v75;
  sub_18FB55450();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
  (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v44, v48, v77);
  v49 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__customCollaborators];
  uint64_t v90 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265DB0);
  v50 = v78;
  sub_18FB55450();
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v49, v50, v80);
  v51 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle];
  sub_18FB2EF00(0, (unint64_t *)&unk_1E9265DB8);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v53 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v54 = sub_18FB551E0();
  uint64_t v56 = v55;

  uint64_t v90 = v54;
  uint64_t v91 = v56;
  v57 = v81;
  sub_18FB55450();
  (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v51, v57, v83);
  v58 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton];
  LOBYTE(v90) = 1;
  v59 = v84;
  sub_18FB55450();
  (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v58, v59, v86);
  v60 = v87;
  *(void *)&v40[OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider] = v87;
  id v61 = v60;

  v89.receiver = v40;
  v89.super_class = ObjectType;
  id v62 = objc_msgSendSuper2(&v89, sel_init);
  id v63 = sub_18FB31214();
  objc_msgSend(v63, sel_setDelegate_, v62);

  v64 = (char *)swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_18FB38958(v61, (char *)sub_18FB39340, v64);

  swift_release_n();
  return v62;
}

void sub_18FB332F0(void *a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  uint64_t v14 = MEMORY[0x1F4188790](v12 - 8, v13);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14, v17);
  uint64_t v19 = (char *)&v38 - v18;
  swift_beginAccess();
  uint64_t v20 = MEMORY[0x192FBDAA0](a6 + 16);
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    uint64_t v40 = a5;
    sub_18FB3A1E4((uint64_t)a1, (uint64_t)v19, &qword_1E9265D68);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18FB3A1E4((uint64_t)v19, (uint64_t)v16, &qword_1E9265D68);
    id v22 = v21;
    sub_18FB554A0();
    sub_18FB3A3FC((uint64_t)v19, &qword_1E9265D68);
    sub_18FB33798(a1);
    uint64_t v23 = type metadata accessor for CollaborationInfo(0);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(a1, 1, v23) != 1)
    {
LABEL_14:

      return;
    }
    if (a3 >> 2 == 0xFFFFFFFF)
    {
      sub_18FB55B70();
      id v24 = (id)SWFrameworkLogHandle();
      if (v24)
      {
        uint64_t v25 = v24;
        sub_18FB55400();

        goto LABEL_14;
      }
      __break(1u);
      goto LABEL_17;
    }
    sub_18FB3A6DC(a2, a3);
    os_log_type_t v30 = sub_18FB55B70();
    uint64_t v31 = (id)SWFrameworkLogHandle();
    if (!v31)
    {
LABEL_17:
      __break(1u);
      return;
    }
    uint64_t v32 = v31;
    BOOL v33 = os_log_type_enabled(v31, v30);
    sub_18FB3A738(a2, a3);
    if (v33)
    {
      sub_18FB3A738(a2, a3);
      uint64_t v38 = a4;
      v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v42 = v39;
      *(_DWORD *)v34 = 136315138;
      unint64_t v35 = sub_18FB30998(a2, a3);
      uint64_t v41 = sub_18FB4ACA4(v35, v36, &v42);
      sub_18FB55C70();
      swift_bridgeObjectRelease();
      sub_18FB3A74C(a2, a3);
      sub_18FB3A74C(a2, a3);
      _os_log_impl(&dword_18FB18000, v32, v30, "Error loading collaboration info: %s", v34, 0xCu);
      uint64_t v37 = v39;
      swift_arrayDestroy();
      MEMORY[0x192FBD9D0](v37, -1, -1);
      MEMORY[0x192FBD9D0](v34, -1, -1);
      sub_18FB3A74C(a2, a3);

      goto LABEL_14;
    }

    sub_18FB3A74C(a2, a3);
    sub_18FB3A74C(a2, a3);
  }
  else
  {
    if (qword_1E9265A60 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_18FB55430();
    __swift_project_value_buffer(v26, (uint64_t)qword_1E92675D8);
    uint64_t v27 = sub_18FB55410();
    os_log_type_t v28 = sub_18FB55B60();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_18FB18000, v27, v28, "Bailing from item provider collaboration info load completion because self was nil.", v29, 2u);
      MEMORY[0x192FBD9D0](v29, -1, -1);
    }
  }
}

uint64_t sub_18FB33798(void *a1)
{
  uint64_t v184 = sub_18FB55260();
  uint64_t v2 = *(void *)(v184 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v184, v3);
  uint64_t v6 = (char *)&v172 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = v5;
  MEMORY[0x1F4188790](v4, v7);
  uint64_t v9 = (char *)&v172 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E90);
  uint64_t v12 = MEMORY[0x1F4188790](v10 - 8, v11);
  uint64_t v182 = (uint64_t)&v172 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v12, v14);
  uint64_t v176 = (uint64_t)&v172 - v16;
  uint64_t v18 = MEMORY[0x1F4188790](v15, v17);
  v177 = (char *)&v172 - v19;
  uint64_t v21 = MEMORY[0x1F4188790](v18, v20);
  v188 = (char *)&v172 - v22;
  MEMORY[0x1F4188790](v21, v23);
  uint64_t v192 = (uint64_t)&v172 - v24;
  uint64_t v25 = type metadata accessor for CollaborationInfo(0);
  v189 = *(unsigned int (***)(char *, uint64_t, void *))(v25 - 8);
  v190 = (void *)v25;
  uint64_t v27 = MEMORY[0x1F4188790](v25, v26);
  uint64_t v178 = (uint64_t)&v172 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x1F4188790](v27, v29);
  v175 = (char *)&v172 - v31;
  uint64_t v33 = MEMORY[0x1F4188790](v30, v32);
  uint64_t v174 = (uint64_t)&v172 - v34;
  uint64_t v36 = MEMORY[0x1F4188790](v33, v35);
  v187 = (void **)((char *)&v172 - v37);
  MEMORY[0x1F4188790](v36, v38);
  uint64_t v40 = (char *)&v172 - v39;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  uint64_t v43 = MEMORY[0x1F4188790](v41, v42);
  v45 = (char *)&v172 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = MEMORY[0x1F4188790](v43, v46);
  v49 = (char *)&v172 - v48;
  MEMORY[0x1F4188790](v47, v50);
  v52 = (char *)&v172 - v51;
  if (qword_1E9265A60 != -1) {
    swift_once();
  }
  uint64_t v173 = sub_18FB55430();
  uint64_t v53 = __swift_project_value_buffer(v173, (uint64_t)qword_1E92675D8);
  id v191 = a1;
  sub_18FB3A1E4((uint64_t)a1, (uint64_t)v52, &qword_1E9265D68);
  uint64_t v185 = v53;
  uint64_t v54 = sub_18FB55410();
  os_log_type_t v55 = sub_18FB55B90();
  BOOL v56 = os_log_type_enabled(v54, v55);
  v180 = v6;
  v181 = v9;
  if (v56)
  {
    uint64_t v172 = v2;
    v57 = (uint8_t *)swift_slowAlloc();
    v58 = swift_slowAlloc();
    aBlock = v58;
    v183 = v40;
    *(_DWORD *)v57 = 136315138;
    sub_18FB3A1E4((uint64_t)v52, (uint64_t)v49, &qword_1E9265D68);
    uint64_t v59 = sub_18FB55A90();
    uint64_t v199 = sub_18FB4ACA4(v59, v60, (uint64_t *)&aBlock);
    uint64_t v2 = v172;
    uint64_t v40 = v183;
    sub_18FB55C70();
    swift_bridgeObjectRelease();
    sub_18FB3A3FC((uint64_t)v52, &qword_1E9265D68);
    _os_log_impl(&dword_18FB18000, v54, v55, "Updating collaboration properties for collaborationInfo: %s", v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x192FBD9D0](v58, -1, -1);
    id v61 = v57;
    uint64_t v62 = v192;
    MEMORY[0x192FBD9D0](v61, -1, -1);
  }
  else
  {
    sub_18FB3A3FC((uint64_t)v52, &qword_1E9265D68);

    uint64_t v62 = v192;
  }
  uint64_t v63 = (uint64_t)v188;
  sub_18FB3A1E4((uint64_t)v191, (uint64_t)v45, &qword_1E9265D68);
  if (v189[6](v45, 1, v190) != 1)
  {
    sub_18FB3A118((uint64_t)v45, (uint64_t)v40);
    uint64_t v70 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56);
    uint64_t v71 = v184;
    v70(v62, 1, 1, v184);
    sub_18FB3A034((uint64_t)v40, (uint64_t)v187);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (!EnumCaseMultiPayload)
    {
      uint64_t v84 = v2;
      uint64_t v85 = *v187;

      id v86 = [v85 URL];
      if (v86)
      {
        v87 = v86;
        sub_18FB55240();

        uint64_t v88 = 0;
      }
      else
      {
        uint64_t v88 = 1;
      }

      sub_18FB3A3FC(v62, &qword_1E9265E90);
      v70(v63, v88, 1, v71);
      sub_18FB3A17C(v63, v62);
      uint64_t v2 = v84;
      goto LABEL_30;
    }
    if (EnumCaseMultiPayload != 1)
    {
      sub_18FB3A3FC(v62, &qword_1E9265E90);
      (*(void (**)(uint64_t, void **, uint64_t))(v2 + 32))(v62, v187, v71);
      v70(v62, 0, 1, v71);
      goto LABEL_30;
    }
    uint64_t v73 = v2;
    uint64_t v74 = *v187;
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(aBlock) = 0;
    id v75 = v186;
    sub_18FB554A0();
    id v191 = v74;
    id v76 = objc_msgSend(v74, sel_fileURL);
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = (uint64_t)v177;
      sub_18FB55240();

      uint64_t v79 = 0;
    }
    else
    {
      uint64_t v79 = 1;
      uint64_t v78 = (uint64_t)v177;
    }
    sub_18FB3A3FC(v62, &qword_1E9265E90);
    v70(v78, v79, 1, v71);
    sub_18FB3A17C(v78, v62);
    objc_super v89 = (SEL *)&unk_1E5666000;
    uint64_t v90 = objc_msgSend(v191, sel_collaborationMetadata);
    uint64_t v91 = v90;
    if (v90)
    {
      id v92 = [v90 title];

      if (v92)
      {
        uint64_t v91 = sub_18FB55A80();
        uint64_t v94 = v93;

LABEL_26:
        swift_getKeyPath();
        swift_getKeyPath();
        aBlock = v91;
        uint64_t v194 = v94;
        id v95 = v75;
        sub_18FB554A0();
        uint64_t v96 = v176;
        sub_18FB3A1E4(v192, v176, &qword_1E9265E90);
        uint64_t v2 = v73;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48))(v96, 1, v71) == 1)
        {
          sub_18FB3A3FC(v96, &qword_1E9265E90);
          uint64_t v97 = v174;
          sub_18FB3A034((uint64_t)v40, v174);
          v98 = sub_18FB55410();
          os_log_type_t v99 = sub_18FB55B60();
          if (os_log_type_enabled(v98, v99))
          {
            id v100 = v95;
            uint64_t v101 = v97;
            v102 = (uint8_t *)swift_slowAlloc();
            v103 = swift_slowAlloc();
            aBlock = v103;
            *(_DWORD *)v102 = 136315138;
            unint64_t v104 = sub_18FB30C04();
            uint64_t v199 = sub_18FB4ACA4(v104, v105, (uint64_t *)&aBlock);
            sub_18FB55C70();
            swift_bridgeObjectRelease();
            uint64_t v106 = v101;
            id v95 = v100;
            objc_super v89 = (SEL *)&unk_1E5666000;
            sub_18FB39D50(v106);
            _os_log_impl(&dword_18FB18000, v98, v99, "Unable to derive share URL from collaboration info %s", v102, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x192FBD9D0](v103, -1, -1);
            MEMORY[0x192FBD9D0](v102, -1, -1);
          }
          else
          {
            sub_18FB39D50(v97);
          }

          uint64_t v132 = (uint64_t)v175;
          id v133 = [v191 v89[171]];
          if (!v133)
          {
            sub_18FB3A034((uint64_t)v40, v132);
            v156 = sub_18FB55410();
            os_log_type_t v157 = sub_18FB55B60();
            BOOL v158 = os_log_type_enabled(v156, v157);
            uint64_t v159 = v192;
            if (!v158)
            {

              sub_18FB39D50(v132);
              uint64_t v171 = v159;
LABEL_56:
              sub_18FB3A3FC(v171, &qword_1E9265E90);
              uint64_t v117 = (uint64_t)v40;
              return sub_18FB39D50(v117);
            }
            v160 = (uint8_t *)swift_slowAlloc();
            v161 = swift_slowAlloc();
            aBlock = v161;
            *(_DWORD *)v160 = 136315138;
            unint64_t v162 = sub_18FB30C04();
            uint64_t v199 = sub_18FB4ACA4(v162, v163, (uint64_t *)&aBlock);
            sub_18FB55C70();
            swift_bridgeObjectRelease();
            sub_18FB39D50(v132);
            _os_log_impl(&dword_18FB18000, v156, v157, "Unable to derive collaboration identifier from collaboration info %s", v160, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x192FBD9D0](v161, -1, -1);
            MEMORY[0x192FBD9D0](v160, -1, -1);

            sub_18FB3A3FC(v159, &qword_1E9265E90);
            uint64_t v117 = (uint64_t)v40;
            return sub_18FB39D50(v117);
          }
          v134 = v133;
          id v135 = objc_msgSend(v133, sel_collaborationIdentifier);

          uint64_t v136 = sub_18FB55A80();
          v138 = v137;

          id v139 = sub_18FB31214();
          v190 = (void *)v136;
          v140._countAndFlagsBits = v136;
          v140._object = v138;
          SWHighlightCenter.collaborationHighlight(forIdentifier:)(v141, v140);
          v144 = (unsigned int (**)(char *, uint64_t, void *))v95;
          uint64_t v62 = v192;
          if (v143)
          {
            v189 = v144;
            v183 = v40;

            if (qword_1E9265A68 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v173, (uint64_t)qword_1E92675F0);
            swift_bridgeObjectRetain();
            id v145 = v143;
            swift_bridgeObjectRetain();
            id v146 = v143;
            v147 = sub_18FB55410();
            os_log_type_t v148 = sub_18FB55B70();
            if (os_log_type_enabled(v147, v148))
            {
              uint64_t v149 = swift_slowAlloc();
              v150 = swift_slowAlloc();
              aBlock = v150;
              *(_DWORD *)uint64_t v149 = 136315394;
              swift_bridgeObjectRetain();
              uint64_t v199 = sub_18FB4ACA4((uint64_t)v190, (unint64_t)v138, (uint64_t *)&aBlock);
              sub_18FB55C70();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v149 + 12) = 2080;
              v188 = (char *)(v149 + 14);
              v151 = (void *)sub_18FB551F0();
              id v152 = objc_msgSend(v151, sel_description);

              uint64_t v153 = sub_18FB55A80();
              unint64_t v155 = v154;

              uint64_t v199 = sub_18FB4ACA4(v153, v155, (uint64_t *)&aBlock);
              uint64_t v62 = v192;
              sub_18FB55C70();
              swift_bridgeObjectRelease();

              _os_log_impl(&dword_18FB18000, v147, v148, "Error fetching collaboration highlights for identifier %s. Error: %s", (uint8_t *)v149, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x192FBD9D0](v150, -1, -1);
              MEMORY[0x192FBD9D0](v149, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            uint64_t v40 = v183;
          }
          else
          {
            v164 = v142;

            swift_getKeyPath();
            swift_getKeyPath();
            aBlock = v164;
            v165 = v144;
            sub_18FB554A0();
          }
          swift_getKeyPath();
          swift_getKeyPath();
          sub_18FB55490();
          swift_release();
          swift_release();
          v166 = aBlock;

          if (v166)
          {
            swift_bridgeObjectRelease();
LABEL_54:

            goto LABEL_55;
          }
          swift_bridgeObjectRetain();
          v167 = sub_18FB55410();
          os_log_type_t v168 = sub_18FB55B60();
          if (!os_log_type_enabled(v167, v168))
          {
            swift_bridgeObjectRelease_n();

            goto LABEL_54;
          }
          v169 = (uint8_t *)swift_slowAlloc();
          v113 = v40;
          v170 = swift_slowAlloc();
          aBlock = v170;
          *(_DWORD *)v169 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v199 = sub_18FB4ACA4((uint64_t)v190, (unint64_t)v138, (uint64_t *)&aBlock);
          sub_18FB55C70();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_18FB18000, v167, v168, "Found no collaboration highlights in highlight center for idenfitier %s", v169, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x192FBD9D0](v170, -1, -1);
          MEMORY[0x192FBD9D0](v169, -1, -1);

          uint64_t v116 = v62;
LABEL_33:
          sub_18FB3A3FC(v116, &qword_1E9265E90);
          uint64_t v117 = (uint64_t)v113;
          return sub_18FB39D50(v117);
        }

        sub_18FB3A3FC(v96, &qword_1E9265E90);
        uint64_t v62 = v192;
LABEL_30:
        uint64_t v107 = v182;
        sub_18FB3A1E4(v62, v182, &qword_1E9265E90);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v107, 1, v71) != 1)
        {
          v118 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 32);
          v119 = v181;
          v118(v181, v107, v71);
          id v120 = v186;
          uint64_t v121 = v2;
          id v191 = sub_18FB31214();
          v190 = (void *)sub_18FB55230();
          v122 = v180;
          (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v180, v119, v71);
          uint64_t v123 = *(unsigned __int8 *)(v2 + 80);
          v183 = v40;
          uint64_t v124 = (v123 + 16) & ~v123;
          uint64_t v125 = v71;
          unint64_t v126 = (v179 + v124 + 7) & 0xFFFFFFFFFFFFFFF8;
          uint64_t v127 = swift_allocObject();
          v118((char *)(v127 + v124), (uint64_t)v122, v125);
          *(void *)(v127 + v126) = v120;
          v197 = sub_18FB3A2EC;
          uint64_t v198 = v127;
          aBlock = MEMORY[0x1E4F143A8];
          uint64_t v194 = 1107296256;
          v195 = sub_18FB351B0;
          v196 = &block_descriptor_0;
          v128 = _Block_copy(&aBlock);
          id v129 = v120;
          swift_release();
          v131 = v190;
          id v130 = v191;
          objc_msgSend(v191, sel_getCollaborationHighlightForURL_completionHandler_, v190, v128);
          _Block_release(v128);

          (*(void (**)(char *, uint64_t))(v121 + 8))(v119, v125);
          sub_18FB3A3FC(v192, &qword_1E9265E90);
          uint64_t v117 = (uint64_t)v183;
          return sub_18FB39D50(v117);
        }
        sub_18FB3A3FC(v107, &qword_1E9265E90);
        uint64_t v108 = v178;
        sub_18FB3A034((uint64_t)v40, v178);
        v109 = sub_18FB55410();
        os_log_type_t v110 = sub_18FB55B60();
        if (!os_log_type_enabled(v109, v110))
        {

          sub_18FB39D50(v108);
LABEL_55:
          uint64_t v171 = v62;
          goto LABEL_56;
        }
        v111 = (uint8_t *)swift_slowAlloc();
        v112 = swift_slowAlloc();
        aBlock = v112;
        v113 = v40;
        *(_DWORD *)v111 = 136315138;
        unint64_t v114 = sub_18FB30C04();
        uint64_t v199 = sub_18FB4ACA4(v114, v115, (uint64_t *)&aBlock);
        sub_18FB55C70();
        swift_bridgeObjectRelease();
        sub_18FB39D50(v108);
        _os_log_impl(&dword_18FB18000, v109, v110, "Unable to derive share URL from collaboration info %s", v111, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x192FBD9D0](v112, -1, -1);
        MEMORY[0x192FBD9D0](v111, -1, -1);

        uint64_t v116 = v62;
        goto LABEL_33;
      }
      uint64_t v91 = 0;
    }
    uint64_t v94 = 0;
    goto LABEL_26;
  }
  sub_18FB3A3FC((uint64_t)v45, &qword_1E9265D68);
  v64 = v186;
  v65 = sub_18FB55410();
  os_log_type_t v66 = sub_18FB55B90();
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v67 = (uint8_t *)swift_slowAlloc();
    v68 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v67 = 138412290;
    aBlock = v64;
    uint64_t v69 = v64;
    sub_18FB55C70();
    void *v68 = v64;

    _os_log_impl(&dword_18FB18000, v65, v66, "Updating %@ for nil collaboration info.", v67, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E98);
    swift_arrayDestroy();
    MEMORY[0x192FBD9D0](v68, -1, -1);
    MEMORY[0x192FBD9D0](v67, -1, -1);
  }
  else
  {

    v65 = v64;
  }

  swift_getKeyPath();
  swift_getKeyPath();
  aBlock = 0;
  uint64_t v80 = v64;
  sub_18FB554A0();
  swift_getKeyPath();
  swift_getKeyPath();
  aBlock = 0;
  uint64_t v194 = 0;
  v81 = v80;
  sub_18FB554A0();
  swift_getKeyPath();
  swift_getKeyPath();
  aBlock = 0;
  uint64_t v82 = v81;
  return sub_18FB554A0();
}

void sub_18FB34C88(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_18FB55260();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v8, v10);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v14);
  uint64_t v16 = (char *)&v41 - v15;
  if (a2)
  {
    id v17 = a2;
    if (qword_1E9265A68 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_18FB55430();
    __swift_project_value_buffer(v18, (uint64_t)qword_1E92675F0);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v16, a3, v8);
    id v19 = a2;
    id v20 = a2;
    uint64_t v21 = sub_18FB55410();
    os_log_type_t v22 = sub_18FB55B70();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      uint64_t v44 = v42;
      *(_DWORD *)uint64_t v23 = 136315394;
      uint64_t v24 = sub_18FB55220();
      uint64_t v43 = sub_18FB4ACA4(v24, v25, &v44);
      sub_18FB55C70();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
      *(_WORD *)(v23 + 12) = 2080;
      uint64_t v26 = (void *)sub_18FB551F0();
      id v27 = objc_msgSend(v26, sel_description);

      uint64_t v28 = sub_18FB55A80();
      unint64_t v30 = v29;

      uint64_t v43 = sub_18FB4ACA4(v28, v30, &v44);
      sub_18FB55C70();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18FB18000, v21, v22, "Error fetching collaboration highlights for url %s. Error: %s", (uint8_t *)v23, 0x16u);
      uint64_t v31 = v42;
      swift_arrayDestroy();
      MEMORY[0x192FBD9D0](v31, -1, -1);
      MEMORY[0x192FBD9D0](v23, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
    }
  }
  else if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v44 = (uint64_t)a1;
    id v32 = a1;
    id v33 = a4;
    sub_18FB554A0();
  }
  else
  {
    if (qword_1E9265A60 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_18FB55430();
    __swift_project_value_buffer(v34, (uint64_t)qword_1E92675D8);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, a3, v8);
    uint64_t v35 = sub_18FB55410();
    os_log_type_t v36 = sub_18FB55B70();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v44 = v38;
      *(_DWORD *)uint64_t v37 = 136315138;
      uint64_t v39 = sub_18FB55220();
      uint64_t v43 = sub_18FB4ACA4(v39, v40, &v44);
      sub_18FB55C70();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
      _os_log_impl(&dword_18FB18000, v35, v36, "Found no collaboration highlights in highlight center for url %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x192FBD9D0](v38, -1, -1);
      MEMORY[0x192FBD9D0](v37, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    }
  }
}

void sub_18FB351B0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_18FB3523C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v28 = a6;
  uint64_t v29 = a3;
  uint64_t v13 = sub_18FB55A00();
  uint64_t v32 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13, v14);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_18FB55A40();
  uint64_t v17 = *(void *)(v31 - 8);
  MEMORY[0x1F4188790](v31, v18);
  id v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18FB2EF00(0, (unint64_t *)&unk_1E92662D0);
  uint64_t v30 = sub_18FB55BE0();
  sub_18FB3A5C0(a1, (uint64_t)v34);
  uint64_t v21 = swift_allocObject();
  *(unsigned char *)(v21 + 16) = a2;
  sub_18FB3A66C(v34, (_OWORD *)(v21 + 24));
  *(void *)(v21 + 56) = v28;
  *(void *)(v21 + 64) = a7;
  uint64_t v22 = v29;
  *(void *)(v21 + 72) = a8;
  *(void *)(v21 + 80) = v22;
  *(void *)(v21 + 88) = a4;
  aBlock[4] = sub_18FB3A67C;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18FB3E65C;
  aBlock[3] = &block_descriptor_81;
  uint64_t v23 = _Block_copy(aBlock);
  swift_retain();
  id v24 = a8;
  swift_bridgeObjectRetain();
  swift_release();
  sub_18FB55A20();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_18FB3A694((unint64_t *)&qword_1E9265EE0, MEMORY[0x1E4FBCB00]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92662E0);
  sub_18FB2EF94(&qword_1E9265EF0, &qword_1E92662E0);
  sub_18FB55CA0();
  unint64_t v25 = (void *)v30;
  MEMORY[0x192FBCE40](0, v20, v16, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, v31);
}

uint64_t sub_18FB35574(char a1, uint64_t a2, void (*a3)(char *, uint64_t, unint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v60 = a6;
  uint64_t v61 = a7;
  uint64_t v59 = a5;
  uint64_t v62 = a3;
  uint64_t v63 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E90);
  MEMORY[0x1F4188790](v8 - 8, v9);
  v64 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_18FB55260();
  uint64_t v58 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v12);
  uint64_t v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  uint64_t v17 = MEMORY[0x1F4188790](v15 - 8, v16);
  uint64_t v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17, v20);
  uint64_t v22 = (char *)&v54 - v21;
  if (qword_1E9265A60 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_18FB55430();
  __swift_project_value_buffer(v23, (uint64_t)qword_1E92675D8);
  id v24 = sub_18FB55410();
  os_log_type_t v25 = sub_18FB55B90();
  BOOL v26 = os_log_type_enabled(v24, v25);
  BOOL v56 = v14;
  if (v26)
  {
    uint64_t v55 = v11;
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v57 = v19;
    uint64_t v29 = v28;
    v66[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    LOBYTE(v65) = a1;
    uint64_t v30 = sub_18FB55A90();
    id v65 = (id)sub_18FB4ACA4(v30, v31, v66);
    sub_18FB55C70();
    uint64_t v11 = v55;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_18FB18000, v24, v25, "Loaded itemProvider with collaborationEngine: %s", v27, 0xCu);
    swift_arrayDestroy();
    uint64_t v32 = v29;
    uint64_t v19 = v57;
    MEMORY[0x192FBD9D0](v32, -1, -1);
    MEMORY[0x192FBD9D0](v27, -1, -1);
  }

  uint64_t v33 = type metadata accessor for CollaborationInfo(0);
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56);
  v34(v22, 1, 1, v33);
  uint64_t v35 = (void (*)(void, void, void))v64;
  if (!a1)
  {
    uint64_t v37 = v63;
    sub_18FB3A5C0(v63, (uint64_t)v66);
    sub_18FB2EF00(0, &qword_1E9265EF8);
    if (swift_dynamicCast())
    {
      uint64_t v38 = v19;
      id v39 = v65;
      id v40 = objc_msgSend(v65, sel_share);

      id v41 = 0;
    }
    else
    {
      sub_18FB3A5C0(v37, (uint64_t)v66);
      sub_18FB2EF00(0, &qword_1E9265EA8);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v34(v19, 1, 1, v33);
        uint64_t v48 = v19;
        uint64_t v49 = v59;
        uint64_t v50 = 0x4000000000000000;
        goto LABEL_26;
      }
      uint64_t v38 = v19;
      v64 = v22;
      id v51 = v65;
      id v40 = objc_msgSend(v65, sel_share);
      id v52 = objc_msgSend(v51, sel_containerSetupInfo);
      id v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F19EC8]), sel_initWithContainerSetupInfo_, v52);

      if (v40)
      {
        uint64_t v22 = v64;
        if (v41)
        {
          sub_18FB3A3FC((uint64_t)v64, &qword_1E9265D68);
          *(void *)uint64_t v22 = v40;
          *((void *)v22 + 1) = v41;
          v22[16] = 1;
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v22 = v64;
      }
    }
    v34(v38, 1, 1, v33);
    v62(v38, 0, 0x8000000000000000, 0, 0);

    uint64_t v42 = (uint64_t)v38;
LABEL_27:
    sub_18FB3A3FC(v42, &qword_1E9265D68);
    return sub_18FB3A3FC((uint64_t)v22, &qword_1E9265D68);
  }
  if (a1 != 1)
  {
    sub_18FB3A5C0(v63, (uint64_t)v66);
    int v43 = swift_dynamicCast();
    uint64_t v44 = v58;
    v45 = *(void (**)(void (*)(void, void, void), uint64_t, uint64_t, uint64_t))(v58 + 56);
    if (v43)
    {
      v45(v35, 0, 1, v11);
      if ((*(unsigned int (**)(void, uint64_t, uint64_t))(v44 + 48))(v35, 1, v11) != 1)
      {
        v57 = v19;
        uint64_t v46 = (uint64_t)v22;
        uint64_t v47 = v56;
        v64 = *(char **)(v44 + 32);
        ((void (*)(char *, void, uint64_t))v64)(v56, v35, v11);
        if (sub_18FB55210())
        {
          sub_18FB3A3FC(v46, &qword_1E9265D68);
          ((void (*)(uint64_t, char *, uint64_t))v64)(v46, v47, v11);
          uint64_t v22 = (char *)v46;
          goto LABEL_21;
        }
        (*(void (**)(char *, uint64_t))(v44 + 8))(v47, v11);
        uint64_t v22 = (char *)v46;
        uint64_t v19 = v57;
        goto LABEL_24;
      }
    }
    else
    {
      v45(v35, 1, 1, v11);
    }
    sub_18FB3A3FC((uint64_t)v35, &qword_1E9265E90);
LABEL_24:
    v34(v19, 1, 1, v33);
    uint64_t v50 = 0x4000000000000002;
    uint64_t v48 = v19;
    uint64_t v49 = v59;
    goto LABEL_26;
  }
  sub_18FB3A5C0(v63, (uint64_t)v66);
  sub_18FB2EF00(0, &qword_1E9265EB0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v34(v19, 1, 1, v33);
    uint64_t v48 = v19;
    uint64_t v49 = v59;
    uint64_t v50 = 0x4000000000000001;
LABEL_26:
    v62(v48, v49, v50, v60, v61);
    uint64_t v42 = (uint64_t)v19;
    goto LABEL_27;
  }
  id v36 = v65;
  sub_18FB3A3FC((uint64_t)v22, &qword_1E9265D68);
  *(void *)uint64_t v22 = v36;
LABEL_21:
  swift_storeEnumTagMultiPayload();
  v34(v22, 0, 1, v33);
  v62(v22, 0, 0x3FFFFFFFCuLL, 0, 0);
  return sub_18FB3A3FC((uint64_t)v22, &qword_1E9265D68);
}

void sub_18FB35D1C(uint64_t a1, id a2, void (*a3)(uint64_t *, void, void, unint64_t, void))
{
  if (a2)
  {
    id v4 = a2;
    if (qword_1E9265A68 != -1) {
      swift_once();
    }
    uint64_t v5 = sub_18FB55430();
    __swift_project_value_buffer(v5, (uint64_t)qword_1E92675F0);
    id v6 = a2;
    id v7 = a2;
    oslog = sub_18FB55410();
    os_log_type_t v8 = sub_18FB55B70();
    if (os_log_type_enabled(oslog, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      v19[0] = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      swift_getErrorValue();
      uint64_t v11 = sub_18FB55DD0();
      sub_18FB4ACA4(v11, v12, v19);
      sub_18FB55C70();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18FB18000, oslog, v8, "Failed to load object from item provider with error: %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x192FBD9D0](v10, -1, -1);
      MEMORY[0x192FBD9D0](v9, -1, -1);

      return;
    }
  }
  else
  {
    if (a1)
    {
      v19[3] = swift_getObjectType();
      v19[0] = a1;
      swift_unknownObjectRetain();
      a3(v19, 0, 0, 0xE000000000000000, 0);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
      return;
    }
    if (qword_1E9265A68 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_18FB55430();
    __swift_project_value_buffer(v15, (uint64_t)qword_1E92675F0);
    oslog = sub_18FB55410();
    os_log_type_t v16 = sub_18FB55B70();
    if (os_log_type_enabled(oslog, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_18FB18000, oslog, v16, "Object loaded from item provider is nil", v17, 2u);
      MEMORY[0x192FBD9D0](v17, -1, -1);
    }
  }
}

uint64_t sub_18FB36030(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_18FB360B0(uint64_t a1, uint64_t a2, void (*a3)(void *, uint64_t, void, unint64_t, uint64_t))
{
  v7[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265EC0);
  v7[0] = a1;
  swift_unknownObjectRetain();
  a3(v7, 1, 0, 0xE000000000000000, a2);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
}

void sub_18FB3612C(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t *, uint64_t, uint64_t, NSObject *, void), uint64_t a5, uint64_t a6, uint64_t a7, NSObject *a8)
{
  uint64_t v42 = a8;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E90);
  MEMORY[0x1F4188790](v14 - 8, v15);
  uint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_18FB55260();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18, v20);
  uint64_t v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    id v23 = a3;
    if (qword_1E9265A68 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_18FB55430();
    __swift_project_value_buffer(v24, (uint64_t)qword_1E92675F0);
    id v25 = a3;
    id v26 = a3;
    uint64_t v42 = sub_18FB55410();
    os_log_type_t v27 = sub_18FB55B70();
    if (os_log_type_enabled(v42, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v44[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      swift_getErrorValue();
      uint64_t v30 = sub_18FB55DD0();
      uint64_t v43 = sub_18FB4ACA4(v30, v31, v44);
      sub_18FB55C70();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18FB18000, v42, v27, "Failed to load object from item provider with error: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x192FBD9D0](v29, -1, -1);
      MEMORY[0x192FBD9D0](v28, -1, -1);
    }
    else
    {

      uint64_t v38 = v42;
    }
  }
  else
  {
    uint64_t v32 = a6;
    uint64_t v40 = a5;
    id v41 = a4;
    uint64_t v33 = v42;
    sub_18FB3A1E4(a1, (uint64_t)v17, &qword_1E9265E90);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
    {
      sub_18FB3A3FC((uint64_t)v17, &qword_1E9265E90);
      if (qword_1E9265A68 != -1) {
        swift_once();
      }
      uint64_t v34 = sub_18FB55430();
      __swift_project_value_buffer(v34, (uint64_t)qword_1E92675F0);
      uint64_t v35 = sub_18FB55410();
      os_log_type_t v36 = sub_18FB55B70();
      if (os_log_type_enabled(v35, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl(&dword_18FB18000, v35, v36, "Object loaded from item provider is nil", v37, 2u);
        MEMORY[0x192FBD9D0](v37, -1, -1);
      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v22, v17, v18);
      v44[3] = v18;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v44);
      (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 16))(boxed_opaque_existential_0, v22, v18);
      v41(v44, v32, a7, v33, 0);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
    }
  }
}

void sub_18FB365BC(uint64_t a1, void *a2, void (*a3)(uint64_t *, uint64_t, uint64_t, NSObject *, void), uint64_t a4, uint64_t a5, uint64_t a6, NSObject *a7)
{
  id v41 = a7;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E90);
  MEMORY[0x1F4188790](v13 - 8, v14);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_18FB55260();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17, v19);
  uint64_t v21 = (char *)&v39 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v22 = a2;
    if (qword_1E9265A68 != -1) {
      swift_once();
    }
    uint64_t v23 = sub_18FB55430();
    __swift_project_value_buffer(v23, (uint64_t)qword_1E92675F0);
    id v24 = a2;
    id v25 = a2;
    id v41 = sub_18FB55410();
    os_log_type_t v26 = sub_18FB55B70();
    if (os_log_type_enabled(v41, v26))
    {
      os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      v43[0] = v28;
      *(_DWORD *)os_log_type_t v27 = 136315138;
      swift_getErrorValue();
      uint64_t v29 = sub_18FB55DD0();
      uint64_t v42 = sub_18FB4ACA4(v29, v30, v43);
      sub_18FB55C70();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_18FB18000, v41, v26, "Failed to load object from item provider with error: %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x192FBD9D0](v28, -1, -1);
      MEMORY[0x192FBD9D0](v27, -1, -1);
    }
    else
    {

      uint64_t v37 = v41;
    }
  }
  else
  {
    uint64_t v31 = a5;
    uint64_t v39 = a4;
    uint64_t v40 = a3;
    uint64_t v32 = v41;
    sub_18FB3A1E4(a1, (uint64_t)v16, &qword_1E9265E90);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
    {
      sub_18FB3A3FC((uint64_t)v16, &qword_1E9265E90);
      if (qword_1E9265A68 != -1) {
        swift_once();
      }
      uint64_t v33 = sub_18FB55430();
      __swift_project_value_buffer(v33, (uint64_t)qword_1E92675F0);
      uint64_t v34 = sub_18FB55410();
      os_log_type_t v35 = sub_18FB55B70();
      if (os_log_type_enabled(v34, v35))
      {
        os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v36 = 0;
        _os_log_impl(&dword_18FB18000, v34, v35, "Object loaded from item provider is nil", v36, 2u);
        MEMORY[0x192FBD9D0](v36, -1, -1);
      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v21, v16, v17);
      v43[3] = v17;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v43);
      (*(void (**)(uint64_t *, char *, uint64_t))(v18 + 16))(boxed_opaque_existential_0, v21, v17);
      v40(v43, v31, a6, v32, 0);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v43);
    }
  }
}

id CollaborationDetailViewModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void CollaborationDetailViewModel.init()()
{
}

id CollaborationDetailViewModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18FB36D6C@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_18FB55440();
  *a1 = result;
  return result;
}

Swift::Void __swiftcall CollaborationDetailViewModel.highlightCenterHighlightsDidChange(_:)(SWHighlightCenter *a1)
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  MEMORY[0x1F4188790](v1 - 8, v2);
  id v4 = (char *)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();
  sub_18FB33798(v4);
  sub_18FB3A3FC((uint64_t)v4, &qword_1E9265D68);
}

uint64_t sub_18FB36F78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();

  return swift_release();
}

uint64_t sub_18FB36FF4(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  uint64_t v6 = MEMORY[0x1F4188790](v4 - 8, v5);
  os_log_type_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6, v9);
  uint64_t v11 = (char *)&v15 - v10;
  sub_18FB3A1E4(a1, (uint64_t)&v15 - v10, &qword_1E9265D68);
  unint64_t v12 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB3A1E4((uint64_t)v11, (uint64_t)v8, &qword_1E9265D68);
  id v13 = v12;
  sub_18FB554A0();
  return sub_18FB3A3FC((uint64_t)v11, &qword_1E9265D68);
}

void *sub_18FB37100(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265EC8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      id v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
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
    sub_18FB38780(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_18FB37210(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_18FB55DE0();
  swift_bridgeObjectRetain();
  sub_18FB55AA0();
  uint64_t v8 = sub_18FB55DF0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_18FB55DA0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_18FB55DA0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_18FB376A0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_18FB373C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9265ED0);
  uint64_t v3 = sub_18FB55CC0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_18FB55DE0();
      sub_18FB55AA0();
      uint64_t result = sub_18FB55DF0();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_18FB376A0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_18FB373C0();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_18FB3783C();
      goto LABEL_22;
    }
    sub_18FB379F0();
  }
  uint64_t v11 = *v4;
  sub_18FB55DE0();
  sub_18FB55AA0();
  uint64_t result = sub_18FB55DF0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_18FB55DA0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_18FB55DC0();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_18FB55DA0();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_18FB3783C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9265ED0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_18FB55CB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_18FB379F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9265ED0);
  uint64_t v3 = sub_18FB55CC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_18FB55DE0();
    swift_bridgeObjectRetain();
    sub_18FB55AA0();
    uint64_t result = sub_18FB55DF0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_18FB37CA0(void *a1)
{
  uint64_t v2 = v1;
  id v90 = a1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D30);
  uint64_t v88 = *(void *)(v3 - 8);
  uint64_t v89 = v3;
  MEMORY[0x1F4188790](v3, v4);
  v87 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D18);
  uint64_t v85 = *(void *)(v6 - 8);
  uint64_t v86 = v6;
  MEMORY[0x1F4188790](v6, v7);
  uint64_t v84 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D40);
  uint64_t v82 = *(void *)(v9 - 8);
  uint64_t v83 = v9;
  MEMORY[0x1F4188790](v9, v10);
  v81 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D48);
  uint64_t v79 = *(void *)(v12 - 8);
  uint64_t v80 = v12;
  MEMORY[0x1F4188790](v12, v13);
  uint64_t v78 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = sub_18FB552F0();
  uint64_t v76 = *(void *)(v77 - 8);
  uint64_t v16 = MEMORY[0x1F4188790](v77, v15);
  uint64_t v74 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16, v18);
  uint64_t v73 = (char *)&v67 - v19;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D50);
  uint64_t v71 = *(void *)(v72 - 8);
  MEMORY[0x1F4188790](v72, v20);
  uint64_t v70 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D58);
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x1F4188790](v69, v22);
  unint64_t v24 = (char *)&v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D60);
  uint64_t v26 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25, v27);
  int64_t v29 = (char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  uint64_t v32 = MEMORY[0x1F4188790](v30, v31);
  uint64_t v34 = (char *)&v67 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v32, v35);
  uint64_t v37 = (char *)&v67 - v36;
  *(void *)&v2[OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v38 = &v2[OBJC_IVAR___SWCollaborationDetailViewModel__collaborationInfo];
  uint64_t v39 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v37, 1, 1, v39);
  sub_18FB3A1E4((uint64_t)v37, (uint64_t)v34, &qword_1E9265D68);
  uint64_t v40 = v2;
  sub_18FB55450();
  sub_18FB3A3FC((uint64_t)v37, &qword_1E9265D68);
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v38, v29, v25);
  id v41 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__highlight];
  uint64_t v94 = 0;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D88);
  sub_18FB55450();
  uint64_t v42 = v68;
  uint64_t v43 = v69;
  (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v41, v24, v69);
  uint64_t v44 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__customContentTitle];
  uint64_t v94 = 0;
  uint64_t v95 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D98);
  v45 = v70;
  sub_18FB55450();
  (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v44, v45, v72);
  uint64_t v46 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__headerFallback];
  uint64_t v47 = v73;
  sub_18FB552B0();
  uint64_t v48 = v76;
  uint64_t v49 = v77;
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v74, v47, v77);
  uint64_t v50 = v78;
  sub_18FB55450();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v46, v50, v80);
  id v51 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__customCollaborators];
  uint64_t v94 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265DB0);
  id v52 = v81;
  sub_18FB55450();
  (*(void (**)(char *, char *, uint64_t))(v82 + 32))(v51, v52, v83);
  uint64_t v53 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle];
  sub_18FB2EF00(0, (unint64_t *)&unk_1E9265DB8);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v55 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v56 = sub_18FB551E0();
  uint64_t v58 = v57;

  uint64_t v94 = v56;
  uint64_t v95 = v58;
  uint64_t v59 = v84;
  sub_18FB55450();
  (*(void (**)(char *, char *, uint64_t))(v85 + 32))(v53, v59, v86);
  uint64_t v60 = &v40[OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton];
  LOBYTE(v94) = 1;
  uint64_t v61 = v87;
  sub_18FB55450();
  (*(void (**)(char *, char *, uint64_t))(v88 + 32))(v60, v61, v89);
  id v62 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28D78]), sel_init);
  *(void *)&v40[OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider] = v62;
  swift_beginAccess();
  uint64_t v63 = *(void (**)(char *, uint64_t))(v42 + 8);
  id v64 = v90;
  id v65 = v90;
  v63(v41, v43);
  id v93 = v64;
  sub_18FB55450();
  swift_endAccess();

  v92.receiver = v40;
  v92.super_class = ObjectType;
  return objc_msgSendSuper2(&v92, sel_init);
}

uint64_t sub_18FB385DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9265ED0);
    uint64_t v3 = sub_18FB55CD0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_18FB55DE0();
      swift_bridgeObjectRetain();
      sub_18FB55AA0();
      uint64_t result = sub_18FB55DF0();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_18FB55DA0(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_18FB55DA0();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

uint64_t sub_18FB38780(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_18FB55D60();
  __break(1u);
  return result;
}

uint64_t sub_18FB38874(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_18FB55B50();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_18FB37210(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_18FB3890C()
{
  unint64_t v0 = sub_18FB55D80();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

void sub_18FB38958(void *a1, char *a2, char *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265EA0);
  MEMORY[0x1F4188790](v6 - 8, v7);
  id v64 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_18FB553F0();
  uint64_t v9 = *(void (***)(char *, unint64_t, uint64_t))(v66 - 8);
  MEMORY[0x1F4188790](v66, v10);
  uint64_t v63 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9265A60 == -1) {
    goto LABEL_2;
  }
LABEL_47:
  swift_once();
LABEL_2:
  uint64_t v12 = sub_18FB55430();
  __swift_project_value_buffer(v12, (uint64_t)qword_1E92675D8);
  id v13 = a1;
  uint64_t v14 = sub_18FB55410();
  os_log_type_t v15 = sub_18FB55B90();
  BOOL v16 = os_log_type_enabled(v14, v15);
  id v65 = v9;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v69 = a3;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 138412290;
    uint64_t v9 = (void (**)(char *, unint64_t, uint64_t))(v18 + 4);
    id aBlock = v13;
    id v20 = v13;
    sub_18FB55C70();
    *uint64_t v19 = v13;

    _os_log_impl(&dword_18FB18000, v14, v15, "Received request to load collaborationInfo from itemProvider: %@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&qword_1E9265E98);
    swift_arrayDestroy();
    MEMORY[0x192FBD9D0](v19, -1, -1);
    uint64_t v21 = v18;
    a3 = v69;
    MEMORY[0x192FBD9D0](v21, -1, -1);
  }
  else
  {
  }
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = a2;
  v22[3] = a3;
  uint64_t v68 = v22;
  v22[4] = v13;
  a2 = (char *)v13;
  swift_retain();
  BOOL v23 = 0;
  while (2)
  {
    int v24 = *((unsigned __int8 *)&unk_1EDF18E78 + (void)v23 + 32);
    uint64_t v69 = v23 + 1;
    int v67 = v24;
    uint64_t v25 = sub_18FB30528(v24);
    uint64_t v26 = v25;
    uint64_t v27 = 0;
    uint64_t v28 = v25 + 56;
    uint64_t v29 = 1 << *(unsigned char *)(v25 + 32);
    if (v29 < 64) {
      uint64_t v30 = ~(-1 << v29);
    }
    else {
      uint64_t v30 = -1;
    }
    unint64_t v31 = v30 & *(void *)(v25 + 56);
    a1 = (void *)((unint64_t)(v29 + 63) >> 6);
    if (v31)
    {
LABEL_10:
      unint64_t v32 = __clz(__rbit64(v31));
      v31 &= v31 - 1;
      unint64_t v33 = v32 | (v27 << 6);
      goto LABEL_25;
    }
    while (1)
    {
      uint64_t v34 = v27 + 1;
      if (__OFADD__(v27, 1))
      {
        __break(1u);
LABEL_46:
        __break(1u);
        goto LABEL_47;
      }
      if (v34 >= (uint64_t)a1) {
        goto LABEL_28;
      }
      unint64_t v35 = *(void *)(v28 + 8 * v34);
      ++v27;
      if (!v35)
      {
        uint64_t v27 = v34 + 1;
        if (v34 + 1 >= (uint64_t)a1) {
          goto LABEL_28;
        }
        unint64_t v35 = *(void *)(v28 + 8 * v27);
        if (!v35)
        {
          uint64_t v27 = v34 + 2;
          if (v34 + 2 >= (uint64_t)a1) {
            goto LABEL_28;
          }
          unint64_t v35 = *(void *)(v28 + 8 * v27);
          if (!v35) {
            break;
          }
        }
      }
LABEL_24:
      unint64_t v31 = (v35 - 1) & v35;
      unint64_t v33 = __clz(__rbit64(v35)) + (v27 << 6);
LABEL_25:
      uint64_t v37 = (uint64_t *)(*(void *)(v26 + 48) + 16 * v33);
      uint64_t v39 = *v37;
      uint64_t v38 = v37[1];
      swift_bridgeObjectRetain();
      uint64_t v9 = (void (**)(char *, unint64_t, uint64_t))sub_18FB55A50();
      a3 = a2;
      unsigned __int8 v40 = objc_msgSend(a2, sel_hasItemConformingToTypeIdentifier_, v9);

      if (v40)
      {
        swift_bridgeObjectRelease();
        swift_release();
        a2 = a3;
        goto LABEL_31;
      }
      swift_bridgeObjectRelease();
      a2 = a3;
      if (v31) {
        goto LABEL_10;
      }
    }
    uint64_t v36 = v34 + 3;
    if (v36 < (uint64_t)a1)
    {
      unint64_t v35 = *(void *)(v28 + 8 * v36);
      if (!v35)
      {
        while (1)
        {
          uint64_t v27 = v36 + 1;
          if (__OFADD__(v36, 1)) {
            goto LABEL_46;
          }
          if (v27 >= (uint64_t)a1) {
            goto LABEL_28;
          }
          unint64_t v35 = *(void *)(v28 + 8 * v27);
          ++v36;
          if (v35) {
            goto LABEL_24;
          }
        }
      }
      uint64_t v27 = v36;
      goto LABEL_24;
    }
LABEL_28:
    swift_release();
    BOOL v23 = v69;
    if (v69 != (char *)3) {
      continue;
    }
    break;
  }
  int v67 = 0;
  uint64_t v39 = 0;
  uint64_t v38 = 0;
LABEL_31:
  sub_18FB2EF00(0, &qword_1E9265EA8);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  if (objc_msgSend(a2, sel_canLoadObjectOfClass_, ObjCClassFromMetadata))
  {
    swift_bridgeObjectRelease();
    uint64_t v42 = swift_allocObject();
    uint64_t v43 = v68;
    *(void *)(v42 + 16) = sub_18FB3A3F0;
    *(void *)(v42 + 24) = v43;
    uint64_t v74 = sub_18FB3A500;
    uint64_t v75 = v42;
    id aBlock = (id)MEMORY[0x1E4F143A8];
    uint64_t v71 = 1107296256;
    uint64_t v72 = sub_18FB36030;
    uint64_t v73 = &block_descriptor_75;
    uint64_t v44 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    id v45 = objc_msgSend(a2, sel_loadObjectOfClass_completionHandler_, ObjCClassFromMetadata, v44);
    goto LABEL_35;
  }
  sub_18FB2EF00(0, &qword_1E9265EB0);
  uint64_t v46 = swift_getObjCClassFromMetadata();
  if (!objc_msgSend(a2, sel_canLoadObjectOfClass_, v46))
  {
    if (v38)
    {
      id v50 = objc_msgSend(a2, sel_registeredContentTypesForOpenInPlace);
      uint64_t v51 = v66;
      uint64_t v52 = sub_18FB55B00();

      if (*(void *)(v52 + 16))
      {
        uint64_t v53 = (uint64_t)v64;
        uint64_t v54 = v65;
        v65[2](v64, v52 + ((*((unsigned __int8 *)v65 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v65 + 80)), v51);
        uint64_t v55 = 0;
      }
      else
      {
        uint64_t v55 = 1;
        uint64_t v53 = (uint64_t)v64;
        uint64_t v54 = v65;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v54[7])(v53, v55, 1, v51);
      swift_bridgeObjectRelease();
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v54[6])(v53, 1, v51) != 1)
      {
        uint64_t v58 = v63;
        v54[4](v63, v53, v51);
        uint64_t v59 = swift_allocObject();
        uint64_t v60 = v68;
        *(void *)(v59 + 16) = sub_18FB3A3F0;
        *(void *)(v59 + 24) = v60;
        *(unsigned char *)(v59 + 32) = v67;
        *(void *)(v59 + 40) = v39;
        *(void *)(v59 + 48) = v38;
        swift_retain();
        uint64_t v61 = (void *)sub_18FB55BB0();
        swift_release();

        swift_release();
        ((void (*)(char *, uint64_t))v54[1])(v58, v51);
        return;
      }
      sub_18FB3A3FC(v53, &qword_1E9265EA0);
      sub_18FB55260();
      uint64_t v56 = swift_allocObject();
      uint64_t v57 = v68;
      *(void *)(v56 + 16) = sub_18FB3A3F0;
      *(void *)(v56 + 24) = v57;
      *(unsigned char *)(v56 + 32) = v67;
      *(void *)(v56 + 40) = v39;
      *(void *)(v56 + 48) = v38;
      sub_18FB3A694((unint64_t *)&qword_1E9265EB8, MEMORY[0x1E4F276F0]);
      swift_retain();

      swift_release();
    }
    swift_release();
    return;
  }
  swift_bridgeObjectRelease();
  uint64_t v47 = swift_allocObject();
  uint64_t v48 = v68;
  *(void *)(v47 + 16) = sub_18FB3A3F0;
  *(void *)(v47 + 24) = v48;
  uint64_t v74 = sub_18FB3A4F8;
  uint64_t v75 = v47;
  id aBlock = (id)MEMORY[0x1E4F143A8];
  uint64_t v71 = 1107296256;
  uint64_t v72 = sub_18FB36030;
  uint64_t v73 = &block_descriptor_69;
  uint64_t v44 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v45 = objc_msgSend(a2, sel_loadObjectOfClass_completionHandler_, v46, v44);
LABEL_35:
  id v49 = v45;
  swift_release();
  _Block_release(v44);
}

uint64_t sub_18FB39240(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = a1;
  id v5 = a1;

  uint64_t v6 = *v3;
  uint64_t v7 = (char *)swift_allocObject();
  swift_unknownObjectWeakInit();
  id v8 = v6;
  swift_retain();
  sub_18FB38958(v8, (char *)sub_18FB39340, v7);

  return swift_release_n();
}

uint64_t sub_18FB39308()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_18FB39340(void *a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_18FB332F0(a1, a2, a3, a4, a5, v5);
}

uint64_t type metadata accessor for CollaborationInfo(uint64_t a1)
{
  return sub_18FB395C4(a1, qword_1E9265E70);
}

uint64_t sub_18FB39380()
{
  return MEMORY[0x1E4F1ABE8];
}

id sub_18FB3938C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

void sub_18FB393F0(id *a1)
{
  id v1 = *a1;
  sub_18FB39240(v1);
}

uint64_t sub_18FB3943C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
  swift_beginAccess();
  uint64_t result = MEMORY[0x192FBDAA0](v3);
  *a2 = result;
  return result;
}

uint64_t sub_18FB39494()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18FB394EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18FB3235C(a1, a2, a3, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle, &qword_1E9265D18);
}

uint64_t sub_18FB39514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18FB323CC(a1, a2, a3, a4, &qword_1E9265D20, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle, &qword_1E9265D18);
}

uint64_t sub_18FB39544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18FB3235C(a1, a2, a3, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton, &qword_1E9265D30);
}

uint64_t sub_18FB3956C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18FB323CC(a1, a2, a3, a4, &qword_1E9265D38, (uint64_t)&OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton, &qword_1E9265D30);
}

uint64_t sub_18FB3959C()
{
  return type metadata accessor for CollaborationDetailViewModel(0);
}

uint64_t type metadata accessor for CollaborationDetailViewModel(uint64_t a1)
{
  return sub_18FB395C4(a1, (uint64_t *)&unk_1E9265DC8);
}

uint64_t sub_18FB395C4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_18FB395FC()
{
  sub_18FB398F8(319, &qword_1E9265DD8, &qword_1E9265D68);
  if (v0 <= 0x3F)
  {
    sub_18FB398F8(319, &qword_1E9265DE0, &qword_1E9265D88);
    if (v1 <= 0x3F)
    {
      sub_18FB398F8(319, &qword_1E9265DE8, &qword_1E9265D98);
      if (v2 <= 0x3F)
      {
        sub_18FB398A0();
        if (v3 <= 0x3F)
        {
          sub_18FB398F8(319, &qword_1E9265DF8, &qword_1E9265DB0);
          if (v4 <= 0x3F)
          {
            sub_18FB39948(319, &qword_1E9265E00);
            if (v5 <= 0x3F)
            {
              sub_18FB39948(319, &qword_1E9265E08);
              if (v6 <= 0x3F) {
                swift_updateClassMetadata2();
              }
            }
          }
        }
      }
    }
  }
}

uint64_t method lookup function for CollaborationDetailViewModel(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CollaborationDetailViewModel);
}

uint64_t dispatch thunk of CollaborationDetailViewModel.__allocating_init(itemProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

void sub_18FB398A0()
{
  if (!qword_1E9265DF0)
  {
    sub_18FB552F0();
    unint64_t v0 = sub_18FB554B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9265DF0);
    }
  }
}

void sub_18FB398F8(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_18FB554B0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_18FB39948(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_18FB554B0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

char *sub_18FB39990(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)a1 = *a2;
    a1 = &v9[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v10 = sub_18FB55260();
      (*(void (**)(char *, char **, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
    }
    else
    {
      uint64_t v7 = *a2;
      if (EnumCaseMultiPayload == 1)
      {
        *(void *)a1 = *a2;
        id v8 = v7;
      }
      else
      {
        uint64_t v11 = a2[1];
        *(void *)a1 = *a2;
        *((void *)a1 + 1) = v11;
        a1[16] = *((unsigned char *)a2 + 16);
        uint64_t v12 = v7;
        id v13 = v11;
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void sub_18FB39AC0(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v4 = sub_18FB55260();
    int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    v5(a1, v4);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      id v3 = *(id *)a1;
    }
    else
    {
      if (EnumCaseMultiPayload) {
        return;
      }

      id v3 = *(id *)(a1 + 8);
    }
  }
}

uint64_t sub_18FB39B78(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v7 = sub_18FB55260();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  }
  else
  {
    int v5 = *(void **)a2;
    if (EnumCaseMultiPayload == 1)
    {
      *(void *)a1 = *(void *)a2;
      id v6 = v5;
    }
    else
    {
      id v8 = *(void **)(a2 + 8);
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v8;
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      id v9 = v5;
      id v10 = v8;
    }
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_18FB39C58(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_18FB39D50(a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v7 = sub_18FB55260();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      int v5 = *(void **)a2;
      *(void *)a1 = *(void *)a2;
      if (EnumCaseMultiPayload == 1)
      {
        id v6 = v5;
      }
      else
      {
        id v8 = *(void **)(a2 + 8);
        *(void *)(a1 + 8) = v8;
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        id v9 = v5;
        id v10 = v8;
      }
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_18FB39D50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_18FB39DAC(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v6 = sub_18FB55260();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_18FB39E64(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_18FB39D50((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v6 = sub_18FB55260();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_18FB39F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_18FB39F54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_18FB39F84()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_18FB39F94()
{
  uint64_t result = sub_18FB55260();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_18FB3A034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18FB3A0B0(uint64_t a1)
{
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_18FB3A118(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CollaborationInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18FB3A17C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18FB3A1E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_18FB3A248()
{
  uint64_t v1 = sub_18FB55260();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v6 + 8, v5);
}

void sub_18FB3A2EC(void *a1, void *a2)
{
  uint64_t v5 = *(void *)(sub_18FB55260() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void **)(v2 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_18FB34C88(a1, a2, v2 + v6, v7);
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

uint64_t sub_18FB3A3B0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_18FB3A3F0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_18FB3523C(a1, a2, a3, a4, a5, *(void *)(v5 + 16), *(void *)(v5 + 24), *(void **)(v5 + 32));
}

uint64_t sub_18FB3A3FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_18FB3A45C(uint64_t a1, void *a2)
{
  sub_18FB365BC(a1, a2, *(void (**)(uint64_t *, uint64_t, uint64_t, NSObject *, void))(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void *)(v2 + 40), *(NSObject **)(v2 + 48));
}

uint64_t objectdestroy_59Tm()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

void sub_18FB3A4B0(uint64_t a1, uint64_t a2, void *a3)
{
  sub_18FB3612C(a1, a2, a3, *(void (**)(uint64_t *, uint64_t, uint64_t, NSObject *, void))(v3 + 16), *(void *)(v3 + 24), *(unsigned __int8 *)(v3 + 32), *(void *)(v3 + 40), *(NSObject **)(v3 + 48));
}

uint64_t sub_18FB3A4C0()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18FB3A4F8(uint64_t a1, uint64_t a2)
{
  return sub_18FB360B0(a1, a2, *(void (**)(void *, uint64_t, void, unint64_t, uint64_t))(v2 + 16));
}

void sub_18FB3A500(uint64_t a1, void *a2)
{
  sub_18FB35D1C(a1, a2, *(void (**)(uint64_t *, void, void, unint64_t, void))(v2 + 16));
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

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_18FB3A5C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_18FB3A61C()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  swift_release();

  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 96, 7);
}

_OWORD *sub_18FB3A66C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_18FB3A67C()
{
  return sub_18FB35574(*(unsigned char *)(v0 + 16), v0 + 24, *(void (**)(char *, uint64_t, unint64_t, uint64_t, uint64_t))(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88));
}

uint64_t sub_18FB3A694(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_18FB3A6DC(id result, unint64_t a2)
{
  if (a2 >> 62 == 1)
  {
    id v3 = result;
    return (id)swift_bridgeObjectRetain();
  }
  else if (!(a2 >> 62))
  {
    return result;
  }
  return result;
}

id sub_18FB3A738(id result, unint64_t a2)
{
  if (a2 >> 2 != 0xFFFFFFFF) {
    return sub_18FB3A6DC(result, a2);
  }
  return result;
}

void sub_18FB3A74C(void *a1, unint64_t a2)
{
  if (a2 >> 2 != 0xFFFFFFFF) {
    sub_18FB3A760(a1, a2);
  }
}

void sub_18FB3A760(void *a1, unint64_t a2)
{
  if (a2 >> 62 == 1)
  {

    swift_bridgeObjectRelease();
  }
  else if (!(a2 >> 62))
  {
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CollaborationEngine(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CollaborationEngine(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x18FB3A928);
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

uint64_t sub_18FB3A950(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_18FB3A958(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CollaborationEngine()
{
  return &type metadata for CollaborationEngine;
}

uint64_t sub_18FB3A970()
{
  return sub_18FB2EF94(&qword_1E9265F00, &qword_1E9265F08);
}

unint64_t sub_18FB3A9B0()
{
  unint64_t result = qword_1E9265F10;
  if (!qword_1E9265F10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9265F10);
  }
  return result;
}

void **sub_18FB3AA20(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unsigned int v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    BOOL v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    BOOL v7 = a1;
    uint64_t v8 = *(int *)(a3 + 20);
    id v9 = (void **)((char *)a1 + v8);
    id v10 = (void **)((char *)a2 + v8);
    uint64_t v11 = type metadata accessor for CollaborationInfo(0);
    uint64_t v12 = *(void *)(v11 - 8);
    id v13 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v12 + 48);
    uint64_t v14 = v4;
    if (v13(v10, 1, v11))
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
      memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    }
    else
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v19 = sub_18FB55260();
        (*(void (**)(void **, void **, uint64_t))(*(void *)(v19 - 8) + 16))(v9, v10, v19);
      }
      else
      {
        uint64_t v17 = *v10;
        if (EnumCaseMultiPayload == 1)
        {
          char *v9 = *v10;
          id v18 = v17;
        }
        else
        {
          id v20 = v10[1];
          char *v9 = *v10;
          v9[1] = v20;
          *((unsigned char *)v9 + 16) = *((unsigned char *)v10 + 16);
          id v21 = v17;
          id v22 = v20;
        }
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(void **, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v23 = *(int *)(a3 + 24);
    int v24 = *(void **)((char *)a2 + v23);
    *(void **)((char *)v7 + v23) = v24;
    id v25 = v24;
  }
  return v7;
}

void sub_18FB3AC38(id *a1, uint64_t a2)
{
  unsigned int v4 = (id *)((char *)a1 + *(int *)(a2 + 20));
  uint64_t v5 = type metadata accessor for CollaborationInfo(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5))
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 2:
        uint64_t v8 = sub_18FB55260();
        (*(void (**)(id *, uint64_t))(*(void *)(v8 - 8) + 8))(v4, v8);
        break;
      case 1:

        break;
      case 0:

        break;
    }
  }
  unsigned int v6 = *(id *)((char *)a1 + *(int *)(a2 + 24));
}

void **sub_18FB3AD4C(void **a1, void **a2, uint64_t a3)
{
  unsigned int v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void **)((char *)a1 + v7);
  id v9 = (void **)((char *)a2 + v7);
  uint64_t v10 = type metadata accessor for CollaborationInfo(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v11 + 48);
  id v13 = v6;
  if (v12(v9, 1, v10))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v18 = sub_18FB55260();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v18 - 8) + 16))(v8, v9, v18);
    }
    else
    {
      BOOL v16 = *v9;
      if (EnumCaseMultiPayload == 1)
      {
        *uint64_t v8 = *v9;
        id v17 = v16;
      }
      else
      {
        uint64_t v19 = v9[1];
        *uint64_t v8 = *v9;
        v8[1] = v19;
        *((unsigned char *)v8 + 16) = *((unsigned char *)v9 + 16);
        id v20 = v16;
        id v21 = v19;
      }
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void **, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v22 = *(int *)(a3 + 24);
  uint64_t v23 = *(void **)((char *)a2 + v22);
  *(void **)((char *)a1 + v22) = v23;
  id v24 = v23;
  return a1;
}

void **sub_18FB3AF04(void **a1, void **a2, uint64_t a3)
{
  unsigned int v6 = *a2;
  uint64_t v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (uint64_t)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for CollaborationInfo(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14((uint64_t)v11, 1, v12);
  if (v15)
  {
    if (!v16)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v24 = sub_18FB55260();
        (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v10, v11, v24);
      }
      else
      {
        uint64_t v18 = *(void **)v11;
        *(void *)uint64_t v10 = *(void *)v11;
        if (EnumCaseMultiPayload == 1)
        {
          id v19 = v18;
        }
        else
        {
          id v25 = (void *)*((void *)v11 + 1);
          *(void *)(v10 + 8) = v25;
          *(unsigned char *)(v10 + 16) = v11[16];
          id v26 = v18;
          id v27 = v25;
        }
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      goto LABEL_17;
    }
LABEL_8:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
    memcpy((void *)v10, v11, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_17;
  }
  if (v16)
  {
    sub_18FB39D50(v10);
    goto LABEL_8;
  }
  if (a1 != a2)
  {
    sub_18FB39D50(v10);
    int v21 = swift_getEnumCaseMultiPayload();
    if (v21 == 2)
    {
      uint64_t v33 = sub_18FB55260();
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v10, v11, v33);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      uint64_t v22 = *(void **)v11;
      *(void *)uint64_t v10 = *(void *)v11;
      if (v21 == 1)
      {
        id v23 = v22;
      }
      else
      {
        uint64_t v34 = (void *)*((void *)v11 + 1);
        *(void *)(v10 + 8) = v34;
        *(unsigned char *)(v10 + 16) = v11[16];
        id v35 = v22;
        id v36 = v34;
      }
      swift_storeEnumTagMultiPayload();
    }
  }
LABEL_17:
  uint64_t v28 = *(int *)(a3 + 24);
  uint64_t v29 = *(void **)((char *)a2 + v28);
  uint64_t v30 = *(void **)((char *)a1 + v28);
  *(void **)((char *)a1 + v28) = v29;
  id v31 = v29;

  return a1;
}

void *sub_18FB3B1D0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for CollaborationInfo(0);
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v12 = sub_18FB55260();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v7, v8, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(v10 + 64));
    }
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void **sub_18FB3B354(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for CollaborationInfo(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      if (a1 == a2) {
        goto LABEL_14;
      }
      sub_18FB39D50((uint64_t)v8);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v17 = sub_18FB55260();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32))(v8, v9, v17);
        swift_storeEnumTagMultiPayload();
        goto LABEL_14;
      }
      size_t v16 = *(void *)(v11 + 64);
      goto LABEL_8;
    }
    sub_18FB39D50((uint64_t)v8);
LABEL_7:
    size_t v16 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68) - 8) + 64);
LABEL_8:
    memcpy(v8, v9, v16);
    goto LABEL_14;
  }
  if (v14) {
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v15 = sub_18FB55260();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v8, v9, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(v11 + 64));
  }
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_14:
  uint64_t v18 = *(int *)(a3 + 24);
  id v19 = *(void **)((char *)a1 + v18);
  *(void **)((char *)a1 + v18) = *(void **)((char *)a2 + v18);

  return a1;
}

uint64_t sub_18FB3B598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_18FB3B5AC);
}

uint64_t sub_18FB3B5AC(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_18FB3B660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_18FB3B674);
}

void *sub_18FB3B674(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *unint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for ComposeViewController()
{
  uint64_t result = qword_1E9265F20;
  if (!qword_1E9265F20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_18FB3B76C()
{
  sub_18FB3B808();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_18FB3B808()
{
  if (!qword_1E9265F30)
  {
    type metadata accessor for CollaborationInfo(255);
    unint64_t v0 = sub_18FB55C60();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E9265F30);
    }
  }
}

uint64_t sub_18FB3B860()
{
  return sub_18FB3BD00(&qword_1E9265F38);
}

id sub_18FB3B894()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  MEMORY[0x1F4188790](v1 - 8, v2);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CollaborationInfo(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v5, v7);
  uint64_t v10 = (void **)((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v8, v11);
  int v13 = (char *)&v28 - v12;
  uint64_t v14 = type metadata accessor for ComposeViewController();
  sub_18FB3BD44((uint64_t)v0 + *(int *)(v14 + 20), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_18FB3BDAC((uint64_t)v4);
LABEL_9:
    int v21 = self;
    id v22 = 0;
    id v19 = 0;
    size_t v16 = 0;
    uint64_t v23 = *(uint64_t *)((char *)v0 + *(int *)(v14 + 24));
    uint64_t v24 = *v0;
    goto LABEL_10;
  }
  sub_18FB3A118((uint64_t)v4, (uint64_t)v13);
  sub_18FB3A118((uint64_t)v13, (uint64_t)v10);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_18FB39D50((uint64_t)v10);
    goto LABEL_9;
  }
  if (EnumCaseMultiPayload != 1)
  {
    uint64_t v20 = sub_18FB55260();
    (*(void (**)(void **, uint64_t))(*(void *)(v20 - 8) + 8))(v10, v20);
    goto LABEL_9;
  }
  size_t v16 = *v10;
  id v17 = objc_msgSend(v16, sel_collaborationMetadata);
  if (v17)
  {
    uint64_t v18 = v17;
    id v19 = objc_msgSend(v17, sel_defaultShareOptions);
  }
  else
  {
    id v19 = 0;
  }
  uint64_t v27 = *(int *)(v14 + 24);
  uint64_t v24 = *v0;
  uint64_t v23 = *(uint64_t *)((char *)v0 + v27);
  int v21 = self;
  id v22 = objc_msgSend(v16, sel_collaborationMetadata);
LABEL_10:
  id v25 = objc_msgSend(v21, sel_newComposeViewControllerInstanceWithDelegate_itemProvider_collaborationOptions_collaborationMetadata_, v23, v24, v19, v22);

  return v25;
}

uint64_t sub_18FB3BB58()
{
  return sub_18FB556E0();
}

uint64_t sub_18FB3BB94()
{
  return MEMORY[0x1E4F3F158];
}

uint64_t sub_18FB3BBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18FB3BD00(&qword_1E9265F40);

  return MEMORY[0x1F40FAB70](a1, a2, a3, v6);
}

uint64_t sub_18FB3BC20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18FB3BD00(&qword_1E9265F40);

  return MEMORY[0x1F40FAB28](a1, a2, a3, v6);
}

uint64_t sub_18FB3BCA0()
{
  return sub_18FB55890();
}

void sub_18FB3BCBC()
{
}

uint64_t sub_18FB3BD00(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ComposeViewController();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18FB3BD44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18FB3BDAC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for CollaborationDetailViewHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CollaborationDetailViewHeader(uint64_t a1)
{
  return swift_release();
}

uint64_t initializeWithCopy for CollaborationDetailViewHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  id v4 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CollaborationDetailViewHeader(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  id v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for CollaborationDetailViewHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CollaborationDetailViewHeader(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CollaborationDetailViewHeader(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for CollaborationDetailViewHeader()
{
  return &type metadata for CollaborationDetailViewHeader;
}

uint64_t sub_18FB3C024()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18FB3C040(uint64_t a1, uint64_t a2)
{
  long long v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_18FB3C094@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v92 = a1;
  uint64_t v93 = a4;
  int v91 = a3;
  uint64_t v90 = a5;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F50);
  MEMORY[0x1F4188790](v84, v6);
  uint64_t v85 = (uint64_t)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F58);
  uint64_t v88 = *(void *)(v8 - 8);
  uint64_t v89 = v8;
  uint64_t v10 = MEMORY[0x1F4188790](v8, v9);
  v87 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10, v12);
  uint64_t v86 = (char *)&v76 - v13;
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F60);
  MEMORY[0x1F4188790](v82, v14);
  uint64_t v83 = (uint64_t)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_18FB55390();
  uint64_t v78 = *(void *)(v16 - 8);
  uint64_t v79 = v16;
  MEMORY[0x1F4188790](v16, v17);
  id v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F68);
  MEMORY[0x1F4188790](v20 - 8, v21);
  uint64_t v23 = (char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F70);
  uint64_t v25 = MEMORY[0x1F4188790](v81, v24);
  uint64_t v27 = (char *)&v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v25, v28);
  uint64_t v80 = (uint64_t)&v76 - v29;
  uint64_t v30 = sub_18FB552F0();
  uint64_t v77 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30, v31);
  uint64_t v33 = (char *)&v76 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F78);
  uint64_t v36 = MEMORY[0x1F4188790](v34 - 8, v35);
  uint64_t v94 = (uint64_t)&v76 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v36, v38);
  uint64_t v95 = (uint64_t)&v76 - v39;
  swift_getKeyPath();
  swift_getKeyPath();
  unsigned __int8 v40 = a2;
  sub_18FB55490();
  swift_release();
  swift_release();
  id v41 = (void *)v100;
  if ((void)v100)
  {
    id v42 = objc_msgSend((id)v100, sel_slHighlight);
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v76 = a2;
    sub_18FB55490();
    swift_release();
    swift_release();
    sub_18FB55380();
    sub_18FB559D0();
    __n128 v43 = sub_18FB3CBC8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v23, 0.0, 1, 0.0, 1);
    (*(void (**)(char *, uint64_t, __n128))(v78 + 8))(v19, v79, v43);
    sub_18FB3A1E4((uint64_t)v23, (uint64_t)v27, &qword_1E9265F68);
    v27[*(int *)(v81 + 36)] = 0;
    sub_18FB3A3FC((uint64_t)v23, &qword_1E9265F68);
    uint64_t v44 = v80;
    sub_18FB3DEE0((uint64_t)v27, v80, &qword_1E9265F70);
    sub_18FB3A1E4(v44, v83, &qword_1E9265F70);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265FA0);
    sub_18FB3DC10();
    sub_18FB2EF94(&qword_1E9265FC8, &qword_1E9265FA0);
    uint64_t v45 = v94;
    sub_18FB556A0();

    sub_18FB3A3FC(v44, &qword_1E9265F70);
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F80);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v45, 0, 1, v46);
    sub_18FB3DEE0(v45, v95, &qword_1E9265F78);
    unsigned __int8 v40 = v76;
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18FB55490();
    swift_release();
    swift_release();
    char v47 = sub_18FB55290();
    uint64_t v48 = *(void (**)(char *, uint64_t))(v77 + 8);
    v48(v33, v30);
    if (v47)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_18FB55490();
      swift_release();
      swift_release();
      uint64_t v49 = sub_18FB55550();
      sub_18FB3D1E4((uint64_t)v33, (uint64_t)v96);
      *(_OWORD *)((char *)&v98[4] + 7) = v96[4];
      *(_OWORD *)((char *)&v98[3] + 7) = v96[3];
      *(_OWORD *)((char *)&v98[7] + 7) = v96[7];
      *(_OWORD *)((char *)&v98[8] + 7) = v96[8];
      *(_OWORD *)((char *)&v98[9] + 7) = v96[9];
      *(_OWORD *)((char *)&v98[5] + 7) = v96[5];
      *(_OWORD *)((char *)&v98[6] + 7) = v96[6];
      *(_OWORD *)((char *)v98 + 7) = v96[0];
      char v99 = 1;
      *(void *)((char *)&v98[10] + 7) = v97;
      *(_OWORD *)((char *)&v98[1] + 7) = v96[1];
      *(_OWORD *)((char *)&v98[2] + 7) = v96[2];
      long long v108 = v98[8];
      v109[0] = v98[9];
      *(_OWORD *)((char *)v109 + 15) = *(_OWORD *)((char *)&v98[9] + 15);
      long long v104 = v98[4];
      long long v105 = v98[5];
      long long v106 = v98[6];
      long long v107 = v98[7];
      long long v100 = v98[0];
      long long v101 = v98[1];
      long long v102 = v98[2];
      long long v103 = v98[3];
      v48(v33, v30);
      long long v50 = v106;
      uint64_t v51 = v83;
      *(_OWORD *)(v83 + 129) = v107;
      long long v52 = v109[0];
      *(_OWORD *)(v51 + 145) = v108;
      *(_OWORD *)(v51 + 161) = v52;
      *(_OWORD *)(v51 + 176) = *(_OWORD *)((char *)v109 + 15);
      long long v53 = v102;
      *(_OWORD *)(v51 + 65) = v103;
      long long v54 = v105;
      *(_OWORD *)(v51 + 81) = v104;
      *(_OWORD *)(v51 + 97) = v54;
      *(_OWORD *)(v51 + 113) = v50;
      long long v55 = v101;
      *(_OWORD *)(v51 + 17) = v100;
      *(_OWORD *)(v51 + 33) = v55;
      *(void *)uint64_t v51 = v49;
      *(void *)(v51 + 8) = 0;
      *(unsigned char *)(v51 + 16) = 1;
      *(_OWORD *)(v51 + 49) = v53;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265FA0);
      sub_18FB3DC10();
      sub_18FB2EF94(&qword_1E9265FC8, &qword_1E9265FA0);
      uint64_t v56 = v95;
      sub_18FB556A0();
      uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F80);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v56, 0, 1, v57);
    }
    else
    {
      uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F80);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v95, 1, 1, v58);
    }
  }
  char v59 = v91 & 1;
  uint64_t v60 = v85;
  uint64_t v62 = v92;
  uint64_t v61 = v93;
  sub_18FB3CDB0(v92, v40, v91 & 1, v93, v85);
  LOBYTE(v98[0]) = v59;
  *((void *)&v98[0] + 1) = v61;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F88);
  sub_18FB55980();
  int v91 = v101;
  uint64_t v63 = swift_allocObject();
  *(void *)(v63 + 16) = v62;
  *(void *)(v63 + 24) = v40;
  *(unsigned char *)(v63 + 32) = v59;
  *(void *)(v63 + 40) = v61;
  type metadata accessor for ComposeViewController();
  sub_18FB2EF94(&qword_1E9265F90, &qword_1E9265F50);
  sub_18FB3DF44(&qword_1E9265F38, (void (*)(uint64_t))type metadata accessor for ComposeViewController);
  id v64 = v40;
  swift_retain();
  id v65 = v87;
  sub_18FB558E0();
  swift_release();
  swift_release();
  swift_release();
  sub_18FB3A3FC(v60, &qword_1E9265F50);
  uint64_t v67 = v88;
  uint64_t v66 = v89;
  uint64_t v68 = v86;
  (*(void (**)(char *, char *, uint64_t))(v88 + 32))(v86, v65, v89);
  uint64_t v70 = v94;
  uint64_t v69 = v95;
  sub_18FB3A1E4(v95, v94, &qword_1E9265F78);
  uint64_t v71 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  v71(v65, v68, v66);
  uint64_t v72 = v90;
  sub_18FB3A1E4(v70, v90, &qword_1E9265F78);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F98);
  v71((char *)(v72 + *(int *)(v73 + 48)), v65, v66);
  uint64_t v74 = *(void (**)(char *, uint64_t))(v67 + 8);
  v74(v68, v66);
  sub_18FB3A3FC(v69, &qword_1E9265F78);
  v74(v65, v66);
  return sub_18FB3A3FC(v70, &qword_1E9265F78);
}

__n128 sub_18FB3CBC8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_18FB55B80();
    uint64_t v23 = (void *)sub_18FB55770();
    sub_18FB55400();
  }
  sub_18FB55500();
  uint64_t v24 = sub_18FB55390();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F68) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  void v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_18FB3CDB0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F50);
  MEMORY[0x1F4188790](v10 - 8, v11);
  uint64_t v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(self, sel_currentDevice);
  id v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

  if (v15 == (id)6) {
    uint64_t v16 = 0x402A000000000000;
  }
  else {
    uint64_t v16 = 0x4024000000000000;
  }
  *(void *)uint64_t v13 = sub_18FB55550();
  *((void *)v13 + 1) = v16;
  v13[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265FD8);
  v20[1] = &unk_1EDF18EA0;
  swift_getKeyPath();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  *(unsigned char *)(v17 + 32) = a3;
  *(void *)(v17 + 40) = a4;
  swift_retain();
  id v18 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92662C0);
  sub_18FB2EF94(&qword_1E9265FE0, &qword_1E92662C0);
  sub_18FB3DE38();
  sub_18FB3DE8C();
  sub_18FB559B0();
  return sub_18FB3DEE0((uint64_t)v13, a5, &qword_1E9265F50);
}

uint64_t sub_18FB3CFA4@<X0>(uint64_t a1@<X0>, char *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  MEMORY[0x1F4188790](v10 - 8, v11);
  uint64_t v13 = (char *)&aBlock[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = (void **)&a2[OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider];
  swift_beginAccess();
  id v15 = *v14;
  swift_getKeyPath();
  swift_getKeyPath();
  id v16 = v15;
  sub_18FB55490();
  swift_release();
  swift_release();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  *(unsigned char *)(v17 + 32) = a3;
  *(void *)(v17 + 40) = a4;
  *a5 = v16;
  uint64_t v18 = type metadata accessor for ComposeViewController();
  sub_18FB3A1E4((uint64_t)v13, (uint64_t)a5 + *(int *)(v18 + 20), &qword_1E9265D68);
  id v19 = self;
  aBlock[4] = sub_18FB3DDB8;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18FB3C040;
  aBlock[3] = &block_descriptor_1;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  id v21 = v16;
  uint64_t v22 = a2;
  swift_release();
  id v23 = objc_msgSend(v19, sel_newComposeViewControllerDelegateInstance_, v20);
  _Block_release(v20);

  swift_release();
  uint64_t result = sub_18FB3A3FC((uint64_t)v13, &qword_1E9265D68);
  *(void *)((char *)a5 + *(int *)(v18 + 24)) = v23;
  return result;
}

uint64_t sub_18FB3D1E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v3 = sub_18FB55940();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18FB552E0();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E4F3EBF8], v3);
  uint64_t v29 = sub_18FB55950();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  uint64_t v8 = self;
  id v9 = objc_msgSend(v8, sel_currentDevice);
  objc_msgSend(v9, sel_userInterfaceIdiom);

  id v10 = objc_msgSend(v8, sel_currentDevice);
  objc_msgSend(v10, sel_userInterfaceIdiom);

  sub_18FB559D0();
  sub_18FB554D0();
  uint64_t v28 = v43;
  char v11 = v44;
  uint64_t v27 = v45;
  char v12 = v46;
  uint64_t v26 = v47;
  uint64_t v25 = v48;
  uint64_t v24 = sub_18FB55580();
  sub_18FB3D53C(v30, v31);
  uint64_t v13 = v31[0];
  uint64_t v14 = v31[1];
  char v15 = v32;
  uint64_t v17 = v33;
  uint64_t v16 = v34;
  uint64_t v18 = v35;
  char v19 = v36;
  uint64_t v20 = v37;
  LOBYTE(v31[0]) = 1;
  char v42 = v11;
  char v41 = v12;
  char v40 = 1;
  char v39 = v32;
  char v38 = v36;
  *(void *)a2 = v29;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 257;
  *(void *)(a2 + 24) = v28;
  *(unsigned char *)(a2 + 32) = v11;
  *(void *)(a2 + 40) = v27;
  *(unsigned char *)(a2 + 48) = v12;
  uint64_t v21 = v25;
  *(void *)(a2 + 56) = v26;
  *(void *)(a2 + 64) = v21;
  *(_WORD *)(a2 + 72) = 256;
  *(void *)(a2 + 80) = v24;
  *(void *)(a2 + 88) = 0;
  *(unsigned char *)(a2 + 96) = 1;
  *(void *)(a2 + 104) = v13;
  *(void *)(a2 + 112) = v14;
  *(unsigned char *)(a2 + 120) = v15;
  *(void *)(a2 + 128) = v17;
  *(void *)(a2 + 136) = v16;
  *(void *)(a2 + 144) = v18;
  *(unsigned char *)(a2 + 152) = v19;
  *(void *)(a2 + 160) = v20;
  swift_retain();
  sub_18FB3DD8C(v13, v14, v15);
  swift_bridgeObjectRetain();
  sub_18FB3DD8C(v16, v18, v19);
  swift_bridgeObjectRetain();
  sub_18FB3DD9C(v13, v14, v15);
  swift_bridgeObjectRelease();
  sub_18FB3DD9C(v16, v18, v19);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18FB3D53C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v49 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265FD0);
  MEMORY[0x1F4188790](v2 - 8, v3);
  uint64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_18FB557F0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  id v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18FB552C0();
  unsigned int v43 = *MEMORY[0x1E4F3E138];
  char v42 = *(void (**)(char *))(v7 + 104);
  uint64_t v37 = v6;
  v42(v10);
  uint64_t v40 = sub_18FB557D0();
  uint64_t v11 = *(void *)(v40 - 8);
  char v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  uint64_t v41 = v11 + 56;
  v39(v5, 1, 1, v40);
  sub_18FB557E0();
  sub_18FB3A3FC((uint64_t)v5, &qword_1E9265FD0);
  char v38 = *(void (**)(char *, uint64_t))(v7 + 8);
  v38(v10, v6);
  uint64_t v12 = sub_18FB55840();
  uint64_t v14 = v13;
  LOBYTE(v6) = v15;
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v16 = sub_18FB55830();
  uint64_t v47 = v17;
  uint64_t v48 = v16;
  uint64_t v46 = v18;
  int v45 = v19 & 1;
  sub_18FB3DD9C(v12, v14, v6 & 1);
  swift_bridgeObjectRelease();
  sub_18FB552D0();
  uint64_t v20 = v37;
  ((void (*)(char *, void, uint64_t))v42)(v10, v43, v37);
  v39(v5, 1, 1, v40);
  sub_18FB557E0();
  sub_18FB3A3FC((uint64_t)v5, &qword_1E9265FD0);
  v38(v10, v20);
  uint64_t v21 = sub_18FB55840();
  uint64_t v23 = v22;
  LOBYTE(v7) = v24;
  swift_bridgeObjectRelease();
  swift_release();
  sub_18FB55920();
  uint64_t v25 = sub_18FB55820();
  uint64_t v27 = v26;
  LOBYTE(v20) = v28;
  uint64_t v30 = v29;
  swift_release();
  sub_18FB3DD9C(v21, v23, v7 & 1);
  swift_bridgeObjectRelease();
  char v31 = v45;
  char v50 = v45;
  uint64_t v33 = v48;
  char v32 = v49;
  uint64_t v35 = v46;
  uint64_t v34 = v47;
  uint64_t *v49 = v48;
  v32[1] = v35;
  *((unsigned char *)v32 + 16) = v31;
  v32[3] = v34;
  v32[4] = v25;
  v32[5] = v27;
  *((unsigned char *)v32 + 48) = v20 & 1;
  v32[7] = v30;
  sub_18FB3DD8C(v33, v35, v31);
  swift_bridgeObjectRetain();
  sub_18FB3DD8C(v25, v27, v20 & 1);
  swift_bridgeObjectRetain();
  sub_18FB3DD9C(v25, v27, v20 & 1);
  swift_bridgeObjectRelease();
  sub_18FB3DD9C(v33, v35, v50);
  return swift_bridgeObjectRelease();
}

uint64_t sub_18FB3D93C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v8 = *a1;
  if (*a1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = a2;
    *(void *)(v10 + 24) = a3;
    *(unsigned char *)(v10 + 32) = a4 & 1;
    *(void *)(v10 + 40) = a5;
    swift_retain();
    id v14 = a3;
    uint64_t v9 = sub_18FB3DFD0;
  }
  type metadata accessor for CollaborationDetailViewModel(0);
  sub_18FB3DF44((unint64_t *)&qword_1E9265FF8, (void (*)(uint64_t))type metadata accessor for CollaborationDetailViewModel);
  id v15 = a3;
  uint64_t result = sub_18FB554E0();
  *(void *)a6 = result;
  *(void *)(a6 + 8) = v17;
  *(unsigned char *)(a6 + 16) = v8;
  *(void *)(a6 + 24) = v9;
  *(void *)(a6 + 32) = v10;
  return result;
}

void sub_18FB3DA40()
{
  if (objc_msgSend(self, sel_canSendText))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18FB55490();
    swift_release();
    swift_release();

    if (!v0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F88);
      sub_18FB55970();
    }
  }
}

uint64_t sub_18FB3DB24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void **)(v1 + 8);
  int v5 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = sub_18FB55580();
  id v8 = objc_msgSend(self, sel_currentDevice);
  id v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  BOOL v10 = v9 == (id)1 || v9 == (id)6;
  uint64_t v11 = 0x4028000000000000;
  if (v10) {
    uint64_t v11 = 0x4030000000000000;
  }
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v11;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F48);
  return sub_18FB3C094(v3, v4, v5, v6, a1 + *(int *)(v12 + 44));
}

uint64_t sub_18FB3DC00@<X0>(void *a1@<X8>)
{
  return sub_18FB3CFA4(*(void *)(v1 + 16), *(char **)(v1 + 24), *(unsigned char *)(v1 + 32), *(void *)(v1 + 40), a1);
}

unint64_t sub_18FB3DC10()
{
  unint64_t result = qword_1E9265FA8;
  if (!qword_1E9265FA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9265F70);
    sub_18FB3DC8C();
    sub_18FB3DD38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9265FA8);
  }
  return result;
}

unint64_t sub_18FB3DC8C()
{
  unint64_t result = qword_1E9265FB0;
  if (!qword_1E9265FB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9265F68);
    sub_18FB3DF44(&qword_1E9265FB8, MEMORY[0x1E4FA55F0]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9265FB0);
  }
  return result;
}

unint64_t sub_18FB3DD38()
{
  unint64_t result = qword_1E9265FC0;
  if (!qword_1E9265FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9265FC0);
  }
  return result;
}

uint64_t sub_18FB3DD8C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_18FB3DD9C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_18FB3DDB8()
{
  return sub_18FB55970();
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

uint64_t sub_18FB3DE28@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_18FB3D93C(a1, *(void *)(v2 + 16), *(void **)(v2 + 24), *(unsigned char *)(v2 + 32), *(void *)(v2 + 40), a2);
}

unint64_t sub_18FB3DE38()
{
  unint64_t result = qword_1E9265FE8;
  if (!qword_1E9265FE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9265FE8);
  }
  return result;
}

unint64_t sub_18FB3DE8C()
{
  unint64_t result = qword_1E9265FF0;
  if (!qword_1E9265FF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9265FF0);
  }
  return result;
}

uint64_t sub_18FB3DEE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_18FB3DF44(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroyTm()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

void sub_18FB3DFD0()
{
}

uint64_t sub_18FB3DFE0()
{
  return sub_18FB2EF94(&qword_1E9266000, &qword_1E9266008);
}

ValueMetadata *type metadata accessor for UIDocumentSharingControllerRepresentable()
{
  return &type metadata for UIDocumentSharingControllerRepresentable;
}

id sub_18FB3E02C()
{
  return *v0;
}

uint64_t sub_18FB3E034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18FB3E17C();

  return MEMORY[0x1F40FAB70](a1, a2, a3, v6);
}

uint64_t sub_18FB3E098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18FB3E17C();

  return MEMORY[0x1F40FAB28](a1, a2, a3, v6);
}

void sub_18FB3E0FC()
{
}

unint64_t sub_18FB3E128()
{
  unint64_t result = qword_1E9266010;
  if (!qword_1E9266010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266010);
  }
  return result;
}

unint64_t sub_18FB3E17C()
{
  unint64_t result = qword_1E9266018;
  if (!qword_1E9266018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266018);
  }
  return result;
}

id sub_18FB3E1D0(uint64_t a1)
{
  v26[1] = *(id *)MEMORY[0x1E4F143B8];
  if (sub_18FB55210())
  {
    v26[0] = 0;
    id v2 = objc_allocWithZone(MEMORY[0x1E4FB16F8]);
    uint64_t v3 = (void *)sub_18FB55230();
    id v4 = objc_msgSend(v2, sel_initWithFileURL_error_, v3, v26);

    if (!v26[0])
    {
      uint64_t v25 = sub_18FB55260();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(a1, v25);
      return v4;
    }
    id v5 = v26[0];
    sub_18FB55B70();
    id result = (id)SWFrameworkLogHandle();
    if (result)
    {
      uint64_t v7 = result;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9266300);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_18FB58E00;
      uint64_t v9 = sub_18FB55220();
      uint64_t v11 = v10;
      uint64_t v12 = MEMORY[0x1E4FBB1A0];
      *(void *)(v8 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v13 = sub_18FB3E4D8();
      *(void *)(v8 + 64) = v13;
      *(void *)(v8 + 32) = v9;
      *(void *)(v8 + 40) = v11;
      id v14 = objc_msgSend(v5, sel_description);
      uint64_t v15 = sub_18FB55A80();
      uint64_t v17 = v16;

      *(void *)(v8 + 96) = v12;
      *(void *)(v8 + 104) = v13;
      *(void *)(v8 + 72) = v15;
      *(void *)(v8 + 80) = v17;
      sub_18FB55400();

      swift_bridgeObjectRelease();
      uint64_t v18 = sub_18FB55260();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(a1, v18);

      return 0;
    }
  }
  else
  {
    sub_18FB55B70();
    id result = (id)SWFrameworkLogHandle();
    if (result)
    {
      char v19 = result;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9266300);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_18FB586C0;
      uint64_t v21 = sub_18FB55220();
      uint64_t v23 = v22;
      *(void *)(v20 + 56) = MEMORY[0x1E4FBB1A0];
      *(void *)(v20 + 64) = sub_18FB3E4D8();
      *(void *)(v20 + 32) = v21;
      *(void *)(v20 + 40) = v23;
      sub_18FB55400();

      swift_bridgeObjectRelease();
      uint64_t v24 = sub_18FB55260();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(a1, v24);
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_18FB3E4D8()
{
  unint64_t result = qword_1E9266020;
  if (!qword_1E9266020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266020);
  }
  return result;
}

ValueMetadata *type metadata accessor for SWUIBehavior()
{
  return &type metadata for SWUIBehavior;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SWHighlightCenter.collaborationHighlight(forIdentifier:)(SWCollaborationHighlight *__return_ptr retstr, Swift::String forIdentifier)
{
  v7[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)sub_18FB55A50();
  v7[0] = 0;
  id v4 = objc_msgSend(v2, sel_collaborationHighlightForIdentifier_error_, v3, v7);

  if (v4)
  {
    id v5 = v7[0];
  }
  else
  {
    id v6 = v7[0];
    sub_18FB55200();

    swift_willThrow();
  }
}

uint64_t sub_18FB3E604(uint64_t a1, uint64_t a2)
{
  return _SWCollaborationDetailViewController.setListContent<A>(_:)(a1, a2);
}

uint64_t sub_18FB3E630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _SWCollaborationDetailViewController.setListContent<A>(_:)(a1, a2, a3);
}

uint64_t sub_18FB3E65C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id _SWCollaborationButtonViewImpl.cloudSharingControllerDelegate.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_cloudSharingControllerDelegate);

  return v1;
}

uint64_t _SWCollaborationButtonViewImpl.cloudSharingControllerDelegate.setter(uint64_t a1)
{
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setCloudSharingControllerDelegate_, a1);

  return swift_unknownObjectRelease();
}

uint64_t (*_SWCollaborationButtonViewImpl.cloudSharingControllerDelegate.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  a1[1] = v3;
  *a1 = objc_msgSend(v3, sel_cloudSharingControllerDelegate);
  return sub_18FB3E7F0;
}

uint64_t sub_18FB3E7F0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 8), sel_setCloudSharingControllerDelegate_, *(void *)a1);

  return swift_unknownObjectRelease();
}

uint64_t _SWCollaborationButtonViewImpl.activeParticipantCount.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount;
  swift_beginAccess();
  return *(void *)v1;
}

id _SWCollaborationButtonViewImpl.activeParticipantCount.setter(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return sub_18FB3E990(a1);
}

id sub_18FB3E990(uint64_t a1)
{
  if (a1
    && (uint64_t v2 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_numberFormatter],
        id v3 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, a1),
        id v4 = objc_msgSend(v2, sel_stringFromNumber_, v3),
        v3,
        v4))
  {
    uint64_t v5 = sub_18FB55A80();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  sub_18FB42D10(v5, v7);
  swift_bridgeObjectRelease();

  return objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
}

void (*_SWCollaborationButtonViewImpl.activeParticipantCount.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_18FB3EACC;
}

void sub_18FB3EACC(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0) {
    sub_18FB3E990(*(void *)(v3[3] + v3[4]));
  }

  free(v3);
}

uint64_t _SWCollaborationButtonViewImpl.headerTitle.getter()
{
  return sub_18FB3EC80(&OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle);
}

uint64_t _SWCollaborationButtonViewImpl.headerTitle.setter(uint64_t a1, uint64_t a2)
{
  return sub_18FB3ED84(a1, a2, &OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle, MEMORY[0x1E4FA55D8]);
}

void (*_SWCollaborationButtonViewImpl.headerTitle.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle;
  v3[4] = v1;
  void v3[5] = v4;
  swift_beginAccess();
  return sub_18FB3EBD8;
}

void sub_18FB3EBD8(void **a1, char a2)
{
}

id sub_18FB3EBFC()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_18FB55A50();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t _SWCollaborationButtonViewImpl.headerSubtitle.getter()
{
  return sub_18FB3EC80(&OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle);
}

uint64_t sub_18FB3EC80(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

void sub_18FB3ECEC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_18FB55A80();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);
}

uint64_t _SWCollaborationButtonViewImpl.headerSubtitle.setter(uint64_t a1, uint64_t a2)
{
  return sub_18FB3ED84(a1, a2, &OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle, MEMORY[0x1E4FA55E0]);
}

uint64_t sub_18FB3ED84(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  *uint64_t v8 = a1;
  v8[1] = a2;
  swift_bridgeObjectRelease();
  id v9 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v4
                                                             + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_viewModel));
  uint64_t v10 = *v8;
  uint64_t v11 = v8[1];
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  uint64_t v12 = (void (*)(unsigned char *, void))sub_18FB55480();
  a4(v10, v11);
  v12(v14, 0);

  swift_release();
  return swift_release();
}

void (*_SWCollaborationButtonViewImpl.headerSubtitle.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle;
  v3[4] = v1;
  void v3[5] = v4;
  swift_beginAccess();
  return sub_18FB3EF0C;
}

void sub_18FB3EF0C(void **a1, char a2)
{
}

void sub_18FB3EF24(void **a1, char a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = v5[4];
    uint64_t v7 = (uint64_t *)(v6 + v5[5]);
    id v8 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v6
                                                               + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_viewModel));
    uint64_t v9 = *v7;
    uint64_t v10 = v7[1];
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    uint64_t v11 = (void (*)(void *, void))sub_18FB55480();
    a3(v9, v10);
    v11(v5, 0);
    swift_release();
    swift_release();
  }

  free(v5);
}

void *_SWCollaborationButtonViewImpl.headerImage.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void _SWCollaborationButtonViewImpl.headerImage.setter(void *a1)
{
  sub_18FB436C0(a1);
}

void (*_SWCollaborationButtonViewImpl.headerImage.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage;
  v3[4] = v1;
  void v3[5] = v4;
  swift_beginAccess();
  return sub_18FB3F1D0;
}

void sub_18FB3F1D0(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = v3[4];
    uint64_t v4 = v3[5];
    id v6 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v5
                                                               + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_viewModel));
    uint64_t v7 = *(void **)(v5 + v4);
    swift_getKeyPath();
    swift_getKeyPath();
    id v8 = v7;
    uint64_t v9 = (void (*)(void *, void))sub_18FB55480();
    sub_18FB552A0();
    v9(v3, 0);
    swift_release();
    swift_release();
  }

  free(v3);
}

uint64_t sub_18FB3F2C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t _SWCollaborationButtonViewImpl.outerButton.getter()
{
  return sub_18FB3F4D4(&OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton);
}

void _SWCollaborationButtonViewImpl.outerButton.setter(void *a1)
{
}

void (*_SWCollaborationButtonViewImpl.outerButton.modify(void *a1))(id **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton;
  v3[4] = v1;
  void v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x192FBDAA0](v5);
  return sub_18FB3F3E8;
}

void sub_18FB3F3E8(id **a1, char a2)
{
  id v3 = *a1;
  id v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if (a2)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();
  }

  free(v3);
}

id sub_18FB3F470(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1 + *a3;
  swift_beginAccess();
  id v4 = (void *)MEMORY[0x192FBDAA0](v3);

  return v4;
}

uint64_t _SWCollaborationButtonViewImpl.delegate.getter()
{
  return sub_18FB3F4D4(&OBJC_IVAR____SWCollaborationButtonViewImpl_delegate);
}

uint64_t sub_18FB3F4D4(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x192FBDAA0](v2);
}

uint64_t sub_18FB3F528()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t _SWCollaborationButtonViewImpl.delegate.setter()
{
  return swift_unknownObjectRelease();
}

void (*_SWCollaborationButtonViewImpl.delegate.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_delegate;
  v3[4] = v1;
  void v3[5] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x192FBDAA0](v5);
  return sub_18FB31464;
}

char *sub_18FB3F658(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter;
  id v5 = objc_allocWithZone((Class)SWHighlightCenter);
  id v6 = v1;
  *(void *)&v1[v4] = objc_msgSend(v5, sel_init);
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount] = 0;
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage] = 0;
  v6[OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared] = 1;
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_highlightSubscriptionCancellable] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel] = 0;
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel] = 0;
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden] = 0;
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint] = 0;
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  uint64_t v7 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerView;
  *(void *)&v6[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  uint64_t v8 = OBJC_IVAR____SWCollaborationButtonViewImpl_label;
  *(void *)&v6[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  uint64_t v9 = OBJC_IVAR____SWCollaborationButtonViewImpl_isRTL;
  id v10 = objc_msgSend(self, sel_sharedApplication);
  id v11 = objc_msgSend(v10, sel_userInterfaceLayoutDirection);

  v6[v9] = v11 == (id)1;
  uint64_t v12 = OBJC_IVAR____SWCollaborationButtonViewImpl_numberFormatter;
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
  objc_msgSend(v13, sel_setNumberStyle_, 0);
  *(void *)&v6[v12] = v13;
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController] = a1;
  id v14 = self;
  id v15 = a1;
  id v16 = objc_msgSend(v14, sel_buttonWithType_, 1);
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_button] = v16;
  uint64_t v17 = &v6[OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle];
  *(void *)uint64_t v17 = 0;
  *((void *)v17 + 1) = 0xE000000000000000;
  uint64_t v18 = &v6[OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle];
  *(void *)uint64_t v18 = 0;
  *((void *)v18 + 1) = 0xE000000000000000;
  id v19 = objc_allocWithZone((Class)sub_18FB55370());
  uint64_t v20 = (void *)sub_18FB55340();
  sub_18FB55330();
  *(void *)&v6[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView] = v20;
  id v21 = v20;

  v51.receiver = v6;
  v51.super_class = ObjectType;
  uint64_t v22 = (char *)objc_msgSendSuper2(&v51, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v23 = *(void **)&v22[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView];
  uint64_t v24 = v22;
  id v25 = v23;
  id v26 = objc_msgSend(v24, sel_tintColor);
  objc_msgSend(v25, sel_setTintColor_, v26);

  uint64_t v27 = *(void **)&v24[OBJC_IVAR____SWCollaborationButtonViewImpl_button];
  objc_msgSend(v27, sel_addTarget_action_forControlEvents_, v24, sel_buttonTapped_, 64);
  id v28 = v27;
  id v29 = objc_msgSend(v24, sel_tintColor);
  objc_msgSend(v28, sel_setTintColor_, v29);

  uint64_t v30 = OBJC_IVAR____SWCollaborationButtonViewImpl_label;
  id v31 = *(id *)&v24[OBJC_IVAR____SWCollaborationButtonViewImpl_label];
  id v32 = objc_msgSend(v24, sel_tintColor);
  objc_msgSend(v31, sel_setTextColor_, v32);

  id v33 = *(id *)&v24[v30];
  id v34 = objc_msgSend(v24, sel_traitCollection);
  unint64_t result = (char *)objc_msgSend(v33, sel_font);
  if (result)
  {
    char v36 = result;
    objc_msgSend(result, sel_pointSize);
    double v38 = v37;

    id v39 = objc_msgSend(self, sel_currentDevice);
    id v40 = objc_msgSend(v39, sel_userInterfaceIdiom);

    uint64_t v41 = self;
    if (v40 == (id)6) {
      id v42 = objc_msgSend(v41, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, *MEMORY[0x1E4FB2950], v34);
    }
    else {
      id v42 = objc_msgSend(v41, sel_systemFontOfSize_weight_, v38, *MEMORY[0x1E4FB09D0]);
    }
    id v43 = v42;

    objc_msgSend(v33, sel_setFont_, v43);
    uint64_t v44 = self;
    uint64_t v45 = swift_allocObject();
    *(void *)(v45 + 16) = v24;
    uint64_t v46 = swift_allocObject();
    *(void *)(v46 + 16) = sub_18FB44530;
    *(void *)(v46 + 24) = v45;
    v50[4] = sub_18FB445A4;
    v50[5] = v46;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 1107296256;
    v50[2] = sub_18FB3F2C0;
    v50[3] = &block_descriptor_99;
    uint64_t v47 = _Block_copy(v50);
    uint64_t v48 = v24;
    swift_retain();
    swift_release();
    objc_msgSend(v44, sel_performWithoutAnimation_, v47);

    _Block_release(v47);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    unint64_t result = (char *)swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      return v48;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_18FB3FC68()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9266170);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  id v6 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_msgSend(*(id *)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_viewModel);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D58);
  sub_18FB55460();
  swift_endAccess();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_18FB2EF94(&qword_1E9266180, (uint64_t *)&unk_1E9266170);
  uint64_t v8 = sub_18FB554C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  *(void *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_highlightSubscriptionCancellable] = v8;
  swift_release();
  uint64_t v9 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerView];
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v9);
  id v10 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView];
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v9, sel_addSubview_, v10);
  id v11 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_label];
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v9, sel_addSubview_, v11);
  uint64_t v12 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_button];
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v108 = v12;
  objc_msgSend(v1, sel_addSubview_, v12);
  id v13 = objc_msgSend(v10, sel_centerXAnchor);
  id v14 = objc_msgSend(v9, sel_centerXAnchor);
  id v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

  uint64_t v16 = OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel;
  uint64_t v17 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel];
  *(void *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel] = v15;

  id v18 = objc_msgSend(v11, sel_centerXAnchor);
  id v19 = objc_msgSend(v9, sel_centerXAnchor);
  id v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

  uint64_t v21 = OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden;
  uint64_t v22 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden];
  *(void *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden] = v20;

  id v109 = v11;
  id v23 = objc_msgSend(v11, sel_leadingAnchor);
  id v111 = v10;
  id v24 = objc_msgSend(v10, sel_trailingAnchor);
  id v25 = self;
  id v26 = objc_msgSend(v25, sel_currentDevice);
  objc_msgSend(v26, sel_userInterfaceIdiom);

  id v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v24, 2.0);
  uint64_t v28 = OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel;
  id v29 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel];
  *(void *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel] = v27;

  uint64_t v30 = *(void **)&v1[v28];
  if (v30) {
    objc_msgSend(v30, sel_setActive_, 0);
  }
  id v31 = *(void **)&v1[v16];
  if (v31) {
    objc_msgSend(v31, sel_setActive_, 1);
  }
  id v32 = *(void **)&v1[v21];
  if (v32) {
    objc_msgSend(v32, sel_setActive_, 1);
  }
  id v33 = objc_msgSend(v25, sel_currentDevice);
  id v34 = objc_msgSend(v33, sel_userInterfaceIdiom);

  if (v34 == (id)6) {
    double v35 = 0.0;
  }
  else {
    double v35 = 4.0;
  }
  id v36 = objc_msgSend(v9, sel_leadingAnchor);
  id v37 = objc_msgSend(v1, sel_leadingAnchor);
  id v38 = objc_msgSend(v36, sel_constraintEqualToAnchor_constant_, v37, v35);

  uint64_t v39 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint;
  id v40 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint];
  *(void *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint] = v38;

  id v41 = objc_msgSend(v9, sel_trailingAnchor);
  id v42 = objc_msgSend(v1, sel_trailingAnchor);
  id v43 = objc_msgSend(v41, sel_constraintEqualToAnchor_constant_, v42, -v35);

  uint64_t v44 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint;
  uint64_t v45 = *(void **)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint];
  *(void *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint] = v43;

  uint64_t v46 = *(void **)&v1[v39];
  if (v46)
  {
    uint64_t v47 = *(void **)&v1[v44];
    if (v47)
    {
      uint64_t v48 = self;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266188);
      uint64_t v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_18FB58F20;
      *(void *)(v49 + 32) = v46;
      *(void *)(v49 + 40) = v47;
      uint64_t v112 = v49;
      sub_18FB55B10();
      sub_18FB2EF00(0, (unint64_t *)&qword_1E9266190);
      id v50 = v46;
      id v51 = v47;
      id v52 = v50;
      id v53 = v51;
      long long v54 = (void *)sub_18FB55AF0();
      swift_bridgeObjectRelease();
      objc_msgSend(v48, sel_activateConstraints_, v54);
    }
  }
  id v55 = v111;
  id v56 = objc_msgSend(v111, sel_leadingAnchor);
  id v57 = objc_msgSend(v9, sel_leadingAnchor);
  id v58 = objc_msgSend(v56, sel_constraintGreaterThanOrEqualToAnchor_, v57);

  id v106 = v58;
  id v59 = objc_msgSend(v55, sel_topAnchor);
  id v60 = objc_msgSend(v9, (SEL)&selRef_closeButton + 3);
  id v61 = objc_msgSend(v59, (SEL)&selRef_addTarget_action_forControlEvents_, v60);

  id v107 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266188);
  uint64_t v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_18FB58F30;
  id v110 = v61;
  id v63 = objc_msgSend(v9, (SEL)&selRef_closeButton + 3);
  id v64 = objc_msgSend(v1, (SEL)&selRef_closeButton + 3);
  id v65 = objc_msgSend(v63, sel_constraintEqualToAnchor_, v64);

  *(void *)(v62 + 32) = v65;
  id v66 = objc_msgSend(v9, sel_bottomAnchor);
  id v67 = objc_msgSend(v1, sel_bottomAnchor);
  id v68 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v67);

  *(void *)(v62 + 40) = v68;
  id v69 = v108;
  id v70 = objc_msgSend(v108, sel_leadingAnchor);
  id v71 = objc_msgSend(v1, sel_leadingAnchor);
  id v72 = objc_msgSend(v70, sel_constraintEqualToAnchor_, v71);

  *(void *)(v62 + 48) = v72;
  id v73 = objc_msgSend(v69, sel_trailingAnchor);
  id v74 = objc_msgSend(v1, (SEL)&selRef_archivedObjectClass + 4);
  id v75 = objc_msgSend(v73, sel_constraintEqualToAnchor_, v74);

  *(void *)(v62 + 56) = v75;
  id v76 = objc_msgSend(v69, sel_topAnchor);
  id v77 = objc_msgSend(v1, sel_topAnchor);
  id v78 = objc_msgSend(v76, sel_constraintEqualToAnchor_, v77);

  *(void *)(v62 + 64) = v78;
  id v79 = objc_msgSend(v69, sel_bottomAnchor);
  id v80 = objc_msgSend(v1, sel_bottomAnchor);
  id v81 = objc_msgSend(v79, sel_constraintEqualToAnchor_, v80);

  id v82 = v110;
  id v83 = v111;
  *(void *)(v62 + 72) = v81;
  *(void *)(v62 + 80) = v82;
  id v84 = objc_msgSend(v83, sel_bottomAnchor);
  id v85 = objc_msgSend(v9, sel_bottomAnchor);
  id v86 = objc_msgSend(v84, sel_constraintLessThanOrEqualToAnchor_, v85);

  *(void *)(v62 + 88) = v86;
  id v87 = objc_msgSend(v83, sel_centerYAnchor);
  id v88 = objc_msgSend(v9, sel_centerYAnchor);
  id v89 = objc_msgSend(v87, sel_constraintEqualToAnchor_, v88);

  uint64_t v90 = v106;
  *(void *)(v62 + 96) = v89;
  *(void *)(v62 + 104) = v90;
  id v91 = v109;
  id v92 = objc_msgSend(v109, sel_topAnchor);
  id v93 = objc_msgSend(v9, sel_topAnchor);
  id v94 = objc_msgSend(v92, sel_constraintGreaterThanOrEqualToAnchor_, v93);

  *(void *)(v62 + 112) = v94;
  id v95 = objc_msgSend(v91, sel_bottomAnchor);
  id v96 = objc_msgSend(v9, sel_bottomAnchor);
  id v97 = objc_msgSend(v95, sel_constraintLessThanOrEqualToAnchor_, v96);

  *(void *)(v62 + 120) = v97;
  id v98 = objc_msgSend(v91, sel_centerYAnchor);
  id v99 = objc_msgSend(v9, sel_centerYAnchor);
  id v100 = objc_msgSend(v98, sel_constraintEqualToAnchor_, v99);

  *(void *)(v62 + 128) = v100;
  id v101 = objc_msgSend(v91, sel_trailingAnchor);
  id v102 = objc_msgSend(v9, sel_trailingAnchor);
  id v103 = objc_msgSend(v101, sel_constraintEqualToAnchor_, v102);

  *(void *)(v62 + 136) = v103;
  uint64_t v112 = v62;
  sub_18FB55B10();
  sub_18FB2EF00(0, (unint64_t *)&qword_1E9266190);
  long long v104 = (void *)sub_18FB55AF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v107, sel_activateConstraints_, v104);

  objc_msgSend(v111, sel_setRemoteRenderingEnabled_, 1);
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.layoutSubviews()()
{
}

uint64_t sub_18FB408EC(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v3 = OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter;
  uint64_t v21 = OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter;
  id v4 = objc_allocWithZone((Class)SWHighlightCenter);
  uint64_t v5 = v1;
  *(void *)&v2[v3] = objc_msgSend(v4, sel_init);
  *(void *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount] = 0;
  uint64_t v18 = OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage;
  *(void *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage] = 0;
  v5[OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared] = 1;
  *(void *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_highlightSubscriptionCancellable] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel;
  *(void *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel] = 0;
  uint64_t v7 = OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel;
  *(void *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel] = 0;
  uint64_t v17 = OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden;
  *(void *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden] = 0;
  uint64_t v20 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint;
  *(void *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint] = 0;
  uint64_t v22 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint;
  *(void *)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v19 = (uint64_t)&v5[OBJC_IVAR____SWCollaborationButtonViewImpl_delegate];
  swift_unknownObjectWeakInit();
  uint64_t v8 = OBJC_IVAR____SWCollaborationButtonViewImpl_containerView;
  *(void *)&v5[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), (SEL)&selRef_initWithShare_container_);
  uint64_t v9 = OBJC_IVAR____SWCollaborationButtonViewImpl_label;
  *(void *)&v5[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), (SEL)&selRef_initWithShare_container_);
  uint64_t v10 = OBJC_IVAR____SWCollaborationButtonViewImpl_isRTL;
  id v11 = objc_msgSend(self, sel_sharedApplication);
  id v12 = objc_msgSend(v11, sel_userInterfaceLayoutDirection);

  v5[v10] = v12 == (id)1;
  uint64_t v13 = OBJC_IVAR____SWCollaborationButtonViewImpl_numberFormatter;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F28EE0]), sel_init);
  objc_msgSend(v14, sel_setNumberStyle_, 0);

  *(void *)&v5[v13] = v14;
  swift_release();
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
  sub_18FB3A0B0(v19);

  id v15 = *(void **)&v5[v13];
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.tintColorDidChange()()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_button];
  id v2 = objc_msgSend(v0, sel_tintColor);
  objc_msgSend(v1, sel_setTintColor_, v2);

  uint64_t v3 = *(void **)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_label];
  id v4 = objc_msgSend(v0, sel_tintColor);
  objc_msgSend(v3, sel_setTextColor_, v4);

  uint64_t v5 = *(void **)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView];
  id v6 = objc_msgSend(v0, sel_tintColor);
  objc_msgSend(v5, sel_setTintColor_, v6);
}

uint64_t sub_18FB40D20()
{
  uint64_t v1 = sub_18FB55A00();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1, v3);
  uint64_t v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_18FB55A40();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v0;
  id v12 = *(void **)&v0[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController];
  uint64_t v13 = v0;
  if (objc_msgSend(v12, sel_isBeingDismissed))
  {
    id v14 = objc_msgSend(v12, sel_transitionCoordinator);
    if (v14)
    {
      id v15 = v14;
      if (qword_1E9265A68 != -1) {
        swift_once();
      }
      uint64_t v16 = sub_18FB55430();
      __swift_project_value_buffer(v16, (uint64_t)qword_1E92675F0);
      uint64_t v17 = v13;
      uint64_t v18 = sub_18FB55410();
      os_log_type_t v19 = sub_18FB55B60();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        id v43 = swift_slowAlloc();
        id aBlock = v12;
        *(_DWORD *)uint64_t v20 = 138412290;
        id v21 = v12;
        sub_18FB55C70();
        uint64_t v22 = v43;
        v43->Class isa = (Class)v12;

        _os_log_impl(&dword_18FB18000, v18, v19, "detailViewController (%@) was being dismissed when the button was tapped. Using its transition coordinator to present once the dismissal completes.", v20, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E98);
        swift_arrayDestroy();
        MEMORY[0x192FBD9D0](v22, -1, -1);
        MEMORY[0x192FBD9D0](v20, -1, -1);
      }
      else
      {
      }
      uint64_t v33 = swift_allocObject();
      *(void *)(v33 + 16) = sub_18FB443E0;
      *(void *)(v33 + 24) = v11;
      uint64_t v48 = sub_18FB43E98;
      uint64_t v49 = v33;
      id aBlock = (void *)MEMORY[0x1E4F143A8];
      uint64_t v45 = 1107296256;
      uint64_t v46 = sub_18FB41548;
      uint64_t v47 = &block_descriptor_71;
      id v34 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v15, sel_animateAlongsideTransition_completion_, 0, v34);
      swift_release();
      _Block_release(v34);
      return swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v41 = v7;
      uint64_t v42 = v2;
      if (qword_1E9265A68 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_18FB55430();
      __swift_project_value_buffer(v24, (uint64_t)qword_1E92675F0);
      id v25 = v13;
      id v26 = sub_18FB55410();
      os_log_type_t v27 = sub_18FB55B60();
      id v43 = v26;
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v39 = (void *)swift_slowAlloc();
        id v40 = v28;
        *(_DWORD *)uint64_t v28 = 138412290;
        id v38 = v28 + 4;
        id aBlock = v12;
        id v29 = v12;
        sub_18FB55C70();
        uint64_t v30 = v39;
        *uint64_t v39 = v12;

        id v31 = v43;
        id v32 = v40;
        _os_log_impl(&dword_18FB18000, v43, v27, "Detail view controller (%@) was being dismissed when the button was tapped. There is no transition coordinator, so we'll dispatch async to wait for dismissal to complete.", v40, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E98);
        swift_arrayDestroy();
        MEMORY[0x192FBD9D0](v30, -1, -1);
        MEMORY[0x192FBD9D0](v32, -1, -1);
      }
      else
      {
      }
      sub_18FB2EF00(0, (unint64_t *)&unk_1E92662D0);
      double v35 = (void *)sub_18FB55BE0();
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 16) = sub_18FB443E0;
      *(void *)(v36 + 24) = v11;
      uint64_t v48 = sub_18FB43E98;
      uint64_t v49 = v36;
      id aBlock = (void *)MEMORY[0x1E4F143A8];
      uint64_t v45 = 1107296256;
      uint64_t v46 = sub_18FB3E65C;
      uint64_t v47 = &block_descriptor_65;
      id v37 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      sub_18FB55A20();
      id aBlock = (void *)MEMORY[0x1E4FBC860];
      sub_18FB44420();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E92662E0);
      sub_18FB2EF94(&qword_1E9265EF0, &qword_1E92662E0);
      sub_18FB55CA0();
      MEMORY[0x192FBCE40](0, v10, v5, v37);
      _Block_release(v37);
      swift_release();

      (*(void (**)(char *, uint64_t))(v42 + 8))(v5, v1);
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v10, v6);
    }
  }
  else
  {
    sub_18FB4143C(v13);
    return swift_release();
  }
}

void sub_18FB4143C(char *a1)
{
  id v2 = objc_msgSend(a1, sel_window);
  if (v2)
  {
    id v8 = v2;
    uint64_t v3 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController];
    objc_msgSend(v3, sel_setModalPresentationStyle_, 7);
    id v4 = objc_msgSend(v3, sel_popoverPresentationController);
    if (v4)
    {
      uint64_t v5 = v4;
      objc_msgSend(v4, sel_setDelegate_, a1);
    }
    id v6 = objc_msgSend(v3, sel_popoverPresentationController);
    if (v6)
    {
      uint64_t v7 = v6;
      objc_msgSend(v6, sel_setSourceView_, *(void *)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView]);
    }
    sub_18FB437DC(v3, (uint64_t)v8);
  }
}

uint64_t sub_18FB41548(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t _SWCollaborationButtonViewImpl.updatePlaceholderSymbol(scale:weight:pointSize:)()
{
  return sub_18FB55320();
}

void _SWCollaborationButtonViewImpl.dismissPopover(animated:completion:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  if (a2)
  {
    void v7[4] = a2;
    v7[5] = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 1107296256;
    id v7[2] = sub_18FB3E65C;
    v7[3] = &block_descriptor_2;
    id v6 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  else
  {
    id v6 = 0;
  }
  objc_msgSend(v5, sel_dismissViewControllerAnimated_completion_, a1 & 1, v6);
  _Block_release(v6);
}

id _SWCollaborationButtonViewImpl.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, sel_initWithFrame_, a1, a2, a3, a4);
}

void _SWCollaborationButtonViewImpl.init(frame:)()
{
}

id _SWCollaborationButtonViewImpl.__deallocating_deinit()
{
  return sub_18FB419B4((SEL *)&selRef_dealloc);
}

id sub_18FB419B4(SEL *a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v4, *a1);
}

UIModalPresentationStyle __swiftcall _SWCollaborationButtonViewImpl.adaptivePresentationStyle(for:traitCollection:)(UIPresentationController a1, UITraitCollection traitCollection)
{
  return -1;
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.prepareForPopoverPresentation(_:)(UIPopoverPresentationController a1)
{
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.presentationControllerDidDismiss(_:)(UIPresentationController a1)
{
}

void SWCollaborationView.setDetailViewListContent<A>(_:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(v2, sel_buttonView);
  _SWCollaborationDetailViewController.setListContent<A>(_:)(a1, a2);
}

void SWCollaborationView.setDetailViewListContent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_msgSend(v3, sel_buttonView);
  _SWCollaborationDetailViewController.setListContent<A>(_:)(a1, a2, a3);
}

_SWCollaborationButtonViewImpl *__cdecl sub_18FB41DA0(SWCollaborationView *self, SEL a2)
{
  uint64_t v2 = [(SWCollaborationView *)self typeErasedButtonView];
  type metadata accessor for _SWCollaborationButtonViewImpl();
  uint64_t v3 = (void *)swift_dynamicCastClassUnconditional();

  return (_SWCollaborationButtonViewImpl *)v3;
}

uint64_t SWCollaborationView.buttonView.getter()
{
  id v1 = objc_msgSend(v0, sel_typeErasedButtonView);
  type metadata accessor for _SWCollaborationButtonViewImpl();

  return swift_dynamicCastClassUnconditional();
}

id _SWCollaborationButtonViewImpl.itemProvider.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_itemProvider);

  return v1;
}

void _SWCollaborationButtonViewImpl.itemProvider.setter(void *a1)
{
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setItemProvider_, a1);
}

void (*_SWCollaborationButtonViewImpl.itemProvider.modify(void *a1))(id *a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  a1[1] = v3;
  *a1 = objc_msgSend(v3, sel_itemProvider);
  return sub_18FB41FB0;
}

void sub_18FB41FB0(id *a1)
{
  id v1 = *a1;
  objc_msgSend(a1[1], sel_setItemProvider_);
}

uint64_t _SWCollaborationButtonViewImpl.isContentShared.getter()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared) & 1) == 0)
  {
    uint64_t result = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);
    if (!result) {
      return result;
    }
  }
  return 1;
}

void _SWCollaborationButtonViewImpl.isContentShared.setter(char a1)
{
  id v3 = objc_msgSend(*(id *)&v1[OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController], sel_collaborationHighlight);

  if (!v3)
  {
    v1[OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared] = a1 & 1;
    objc_super v4 = self;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v1;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = sub_18FB43E84;
    *(void *)(v6 + 24) = v5;
    v10[4] = sub_18FB43E98;
    v10[5] = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 1107296256;
    void v10[2] = sub_18FB3F2C0;
    v10[3] = &block_descriptor_9;
    id v7 = _Block_copy(v10);
    id v8 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v4, sel_performWithoutAnimation_, v7);
    _Block_release(v7);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
  }
}

void sub_18FB422B0(void *a1@<X0>, char *a2@<X8>)
{
  if ((*(unsigned char *)(*a1 + OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared) & 1) == 0)
  {
    id v3 = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);
    if (!v3)
    {
      char v4 = 0;
      goto LABEL_6;
    }
  }
  char v4 = 1;
LABEL_6:
  *a2 = v4;
}

void (*_SWCollaborationButtonViewImpl.isContentShared.modify(void *a1))(uint64_t a1, char a2)
{
  id v3 = (char *)malloc(0x48uLL);
  *a1 = v3;
  char v4 = v3 + 64;
  uint64_t v5 = OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared;
  *((void *)v3 + 6) = v1;
  *((void *)v3 + 7) = v5;
  if ((*(unsigned char *)(v1 + v5) & 1) == 0)
  {
    id v6 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);
    if (!v6)
    {
      char v7 = 0;
      goto LABEL_6;
    }
  }
  char v7 = 1;
LABEL_6:
  *char v4 = v7;
  return sub_18FB423BC;
}

void sub_18FB423BC(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  char isEscapingClosureAtFileLocation = *(unsigned char *)(*(void *)a1 + 64);
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(*(void *)a1 + 48) + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);

  if (a2)
  {
    if (v5) {
      goto LABEL_7;
    }
    id v6 = (unsigned char *)v3[6];
    v6[v3[7]] = isEscapingClosureAtFileLocation;
    char v7 = self;
    uint64_t v5 = (void *)swift_allocObject();
    v5[2] = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = sub_18FB43E84;
    *(void *)(v8 + 24) = v5;
    v3[4] = sub_18FB445A4;
    void v3[5] = v8;
    *id v3 = MEMORY[0x1E4F143A8];
    v3[1] = 1107296256;
    v3[2] = sub_18FB3F2C0;
    v3[3] = &block_descriptor_20;
    id v9 = _Block_copy(v3);
    uint64_t v10 = v6;
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_performWithoutAnimation_, v9);
    _Block_release(v9);
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0) {
      goto LABEL_7;
    }
    __break(1u);
  }
  if (!v5)
  {
    uint64_t v11 = (unsigned char *)v3[6];
    v11[v3[7]] = isEscapingClosureAtFileLocation;
    uint64_t v12 = self;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v11;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = sub_18FB43E84;
    *(void *)(v14 + 24) = v13;
    v3[4] = sub_18FB445A4;
    void v3[5] = v14;
    *id v3 = MEMORY[0x1E4F143A8];
    v3[1] = 1107296256;
    v3[2] = sub_18FB3F2C0;
    v3[3] = &block_descriptor_31;
    id v15 = _Block_copy(v3);
    uint64_t v16 = v11;
    swift_retain();
    swift_release();
    objc_msgSend((id)v12, sel_performWithoutAnimation_, v15);
    _Block_release(v15);
    LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if (v12)
    {
      __break(1u);
      return;
    }
  }
LABEL_7:

  free(v3);
}

void sub_18FB426A8(void **a1, uint64_t a2)
{
  uint64_t v4 = sub_18FB55430();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = *a1;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x192FBDAA0](a2 + 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v44 = OBJC_IVAR____SWCollaborationButtonViewImpl_attributionView;
    uint64_t v12 = sub_18FB55350();
    uint64_t v13 = (void *)v12;
    if (v9)
    {
      id v14 = objc_msgSend(v9, sel_slHighlight);
      id v15 = v14;
      if (v13)
      {
        if (v14)
        {
          sub_18FB2EF00(0, &qword_1E9266198);
          id v16 = v13;
          char v17 = sub_18FB55C40();

          if (v17)
          {
LABEL_24:
            if (qword_1E9265A68 != -1) {
              swift_once();
            }
            __swift_project_value_buffer(v4, (uint64_t)qword_1E92675F0);
            id v29 = sub_18FB55410();
            os_log_type_t v30 = sub_18FB55B60();
            if (!os_log_type_enabled(v29, v30))
            {
              uint64_t v39 = v29;
              id v29 = v11;
              goto LABEL_35;
            }
            id v31 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v31 = 0;
            _os_log_impl(&dword_18FB18000, v29, v30, "Skipping refresh of attribution view because highlights are the same", v31, 2u);
            MEMORY[0x192FBD9D0](v31, -1, -1);
LABEL_33:
            uint64_t v39 = v11;
LABEL_35:

            uint64_t v11 = v29;
            goto LABEL_36;
          }
        }
      }
      else
      {
        if (!v14) {
          goto LABEL_24;
        }
      }
      id v18 = objc_msgSend(v9, sel_slHighlight);
      if (v18)
      {

        int v19 = 0;
        goto LABEL_14;
      }
    }
    else if (!v12)
    {
      goto LABEL_24;
    }
    int v19 = 1;
LABEL_14:
    if (qword_1E9265A68 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v4, (uint64_t)qword_1E92675F0);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v20, v4);
    id v21 = sub_18FB55410();
    os_log_type_t v22 = sub_18FB55B60();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v42 = v9;
      id v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      id v43 = v13;
      uint64_t v25 = v24;
      uint64_t v41 = v5;
      *(_DWORD *)id v23 = 136315138;
      uint64_t v46 = v24;
      if (v19) {
        uint64_t v26 = 7104878;
      }
      else {
        uint64_t v26 = 0x696E2D6E6F6E2061;
      }
      if (v19) {
        unint64_t v27 = 0xE300000000000000;
      }
      else {
        unint64_t v27 = 0xEF65756C6176206CLL;
      }
      uint64_t v45 = sub_18FB4ACA4(v26, v27, &v46);
      id v9 = v42;
      sub_18FB55C70();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_18FB18000, v21, v22, "Updating attribution view highlight to %s", v23, 0xCu);
      swift_arrayDestroy();
      uint64_t v28 = v25;
      uint64_t v13 = v43;
      MEMORY[0x192FBD9D0](v28, -1, -1);
      MEMORY[0x192FBD9D0](v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v41 + 8))(v8, v4);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    id v32 = *(Class *)((char *)&v11->isa + v44);
    if (v9)
    {
      id v33 = v32;
      id v34 = objc_msgSend(v9, sel_slHighlight);
      sub_18FB55360();

      self;
      uint64_t v35 = swift_dynamicCastObjCClass();
      if (!v35)
      {
LABEL_36:

        return;
      }
      uint64_t v36 = v35;
      id v37 = *(Class *)((char *)&v11->isa + OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter);
      id v38 = v9;
      id v29 = v37;
      [v29 clearNoticesForHighlight:v36];
    }
    else
    {
      id v29 = v32;
      sub_18FB55360();
    }
    goto LABEL_33;
  }
}

id _SWCollaborationButtonViewImpl.__allocating_init(itemProvider:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithItemProvider_, a1);

  return v3;
}

char *_SWCollaborationButtonViewImpl.init(itemProvider:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v3 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationDetailViewController), sel_initWithItemProvider_impl_, a1);
  id v4 = objc_allocWithZone(ObjectType);
  uint64_t v5 = sub_18FB3F658(v3);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

void sub_18FB42D10(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    uint64_t v6 = *(void **)&v2[OBJC_IVAR____SWCollaborationButtonViewImpl_label];
    uint64_t v7 = (void *)sub_18FB55A50();
    objc_msgSend(v6, sel_setText_, v7);

    uint64_t v8 = self;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v2;
    os_log_type_t v22 = sub_18FB44478;
    id v23 = (void *)v9;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 1107296256;
    uint64_t v20 = sub_18FB3E65C;
    id v21 = &block_descriptor_77;
    uint64_t v10 = _Block_copy(&v18);
    uint64_t v11 = v2;
    swift_release();
    objc_msgSend(v8, sel__animateUsingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion_, 0, v10, 0, 2.0, 0.0, 2.0, 300.0, 50.0, 0.0);
  }
  else
  {
    uint64_t v12 = self;
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v2;
    os_log_type_t v22 = sub_18FB44480;
    id v23 = (void *)v13;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 1107296256;
    uint64_t v20 = sub_18FB3E65C;
    id v21 = &block_descriptor_83;
    uint64_t v10 = _Block_copy(&v18);
    id v14 = v2;
    swift_release();
    id v15 = (void *)swift_allocObject();
    v15[2] = v14;
    v15[3] = a1;
    v15[4] = a2;
    os_log_type_t v22 = sub_18FB444C8;
    id v23 = v15;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 1107296256;
    uint64_t v20 = sub_18FB48F14;
    id v21 = &block_descriptor_89;
    id v16 = _Block_copy(&v18);
    char v17 = v14;
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v12, sel__animateUsingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion_, 0, v10, v16, 2.0, 0.0, 2.0, 300.0, 50.0, 0.0);
    _Block_release(v16);
  }
  _Block_release(v10);
}

id sub_18FB42FFC(char *a1)
{
  objc_msgSend(*(id *)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_label], sel_setAlpha_, 1.0);
  uint64_t v2 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel];
  if (v2) {
    objc_msgSend(v2, sel_setActive_, 0);
  }
  id v3 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel];
  if (v3) {
    objc_msgSend(v3, sel_setActive_, 1);
  }
  id v4 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden];
  if (v4) {
    objc_msgSend(v4, sel_setActive_, 0);
  }
  objc_msgSend(a1, sel_layoutIfNeeded);
  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_currentDevice);
  id v7 = objc_msgSend(v6, sel_userInterfaceIdiom);

  id v8 = objc_msgSend(v5, sel_currentDevice);
  id v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  double v10 = 4.0;
  if (v9 == (id)6) {
    double v11 = 12.0;
  }
  else {
    double v11 = 4.0;
  }
  uint64_t v12 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint];
  if (v12)
  {
    if (v7 == (id)6) {
      double v10 = 0.0;
    }
    objc_msgSend(v12, sel_setConstant_, v10);
  }
  id result = *(id *)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint];
  if (result)
  {
    return objc_msgSend(result, sel_setConstant_, -v11);
  }
  return result;
}

id sub_18FB43194(char *a1)
{
  uint64_t v2 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel];
  if (v2) {
    objc_msgSend(v2, sel_setActive_, 1);
  }
  id v3 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel];
  if (v3) {
    objc_msgSend(v3, sel_setActive_, 0);
  }
  id v4 = *(void **)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden];
  if (v4) {
    objc_msgSend(v4, sel_setActive_, 1);
  }
  objc_msgSend(*(id *)&a1[OBJC_IVAR____SWCollaborationButtonViewImpl_label], sel_setAlpha_, 0.0);

  return objc_msgSend(a1, sel_layoutIfNeeded);
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.setManageButtonTitle(manageButtonTitle:)(Swift::String manageButtonTitle)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  id v3 = (id)sub_18FB55A50();
  objc_msgSend(v2, sel_setManageButtonTitle_, v3);
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.setShowManageButton(showManageButton:)(Swift::Bool showManageButton)
{
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setShowManageButton_, showManageButton);
}

Swift::Void __swiftcall _SWCollaborationButtonViewImpl.setDetailViewListContent(_:)(UIView *a1)
{
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setListContentView_, a1);
}

uint64_t sub_18FB433A8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();

  return swift_release();
}

uint64_t sub_18FB43428(uint64_t a1, void **a2)
{
  uint64_t v4 = sub_18FB552F0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v4, v6);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7, v10);
  uint64_t v12 = (char *)&v17 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v13((char *)&v17 - v11, a1, v4);
  id v14 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v13(v9, (uint64_t)v12, v4);
  id v15 = v14;
  sub_18FB554A0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v12, v4);
}

char *sub_18FB43598(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  sub_18FB2EF00(0, &qword_1E9266168);
  id v8 = sub_18FB53D24(a1, a2, a3);
  id v9 = objc_allocWithZone(v4);
  return sub_18FB3F658(v8);
}

char *sub_18FB43628(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_18FB2EF00(0, &qword_1E9266168);
  id v10 = sub_18FB53EF0(a1, a2, a3, a4);
  id v11 = objc_allocWithZone(v5);
  return sub_18FB3F658(v10);
}

uint64_t sub_18FB436C0(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;

  id v6 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_viewModel));
  uint64_t v7 = *v3;
  swift_getKeyPath();
  swift_getKeyPath();
  id v8 = v7;
  id v9 = (void (*)(unsigned char *, void))sub_18FB55480();
  sub_18FB552A0();
  v9(v11, 0);

  swift_release();
  return swift_release();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void sub_18FB437DC(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = v3 + OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton;
  swift_beginAccess();
  uint64_t v7 = MEMORY[0x192FBDAA0](v6);
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = v3 + OBJC_IVAR____SWCollaborationButtonViewImpl_delegate;
    swift_beginAccess();
    id v10 = (void *)MEMORY[0x192FBDAA0](v9);
    if (v10)
    {
      id v11 = v10;
      if (objc_msgSend(v10, sel_respondsToSelector_, sel_collaborationViewShouldPresentPopover_))
      {
        unsigned int v12 = objc_msgSend(v11, sel_collaborationViewShouldPresentPopover_, v8);
        swift_unknownObjectRelease();
        if (!v12) {
          goto LABEL_24;
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    id v13 = objc_msgSend(a1, sel_presentingViewController);

    if (v13)
    {
      if (qword_1E9265A68 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_18FB55430();
      __swift_project_value_buffer(v14, (uint64_t)qword_1E92675F0);
      id v15 = a1;
      id v16 = sub_18FB55410();
      os_log_type_t v17 = sub_18FB55B70();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = swift_slowAlloc();
        uint64_t v19 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v18 = 138412546;
        id v20 = v15;
        sub_18FB55C70();
        *uint64_t v19 = v15;

        *(_WORD *)(v18 + 12) = 2112;
        id v21 = objc_msgSend(v20, sel_presentingViewController);
        sub_18FB55C70();
        v19[1] = v21;

        _os_log_impl(&dword_18FB18000, v16, v17, "View controller to present (%@) already has a presentingViewController (%@). Bailing on presentation.", (uint8_t *)v18, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E98);
        swift_arrayDestroy();
        MEMORY[0x192FBD9D0](v19, -1, -1);
        MEMORY[0x192FBD9D0](v18, -1, -1);
      }
      else
      {
      }
      goto LABEL_24;
    }
    id v22 = objc_msgSend(self, sel__viewControllerForFullScreenPresentationFromView_, a2);
    if (v22)
    {
      sub_18FB2EF00(0, &qword_1E9266160);
      id v23 = v22;
      if ((sub_18FB55C40() & 1) == 0)
      {
        objc_msgSend(v23, sel_presentViewController_animated_completion_, a1, 1, 0);

        swift_unknownObjectWeakAssign();
        id v8 = v23;
LABEL_24:

        return;
      }

      id v24 = v23;
      id v25 = a1;
      char v26 = sub_18FB55C40();

      if (v26)
      {
        if (qword_1E9265A68 != -1) {
          swift_once();
        }
        uint64_t v27 = sub_18FB55430();
        __swift_project_value_buffer(v27, (uint64_t)qword_1E92675F0);
        uint64_t v28 = v25;
        id v29 = sub_18FB55410();
        os_log_type_t v30 = sub_18FB55B70();
        if (os_log_type_enabled(v29, v30))
        {
          id v31 = (uint8_t *)swift_slowAlloc();
          id v34 = (void *)swift_slowAlloc();
          buf = v31;
          *(_DWORD *)id v31 = 138412290;
          id v32 = v28;
          sub_18FB55C70();
          void *v34 = v28;

          _os_log_impl(&dword_18FB18000, v29, v30, "_viewControllerForFullScreenPresentation returned the same view controller we are trying to present (%@). Using a fallback presentation view controller instead.", buf, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E98);
          swift_arrayDestroy();
          MEMORY[0x192FBD9D0](v34, -1, -1);
          MEMORY[0x192FBD9D0](buf, -1, -1);
        }
        else
        {

          id v29 = v28;
        }
      }
    }
    id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB20F8]), sel_init);
    objc_msgSend(v33, sel__presentViewController_sendingView_animated_, a1, 0, 1);

    swift_unknownObjectWeakAssign();
    id v8 = v33;
    goto LABEL_24;
  }
}

void sub_18FB43D60(SEL *a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x192FBDAA0](v3);
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = v1 + OBJC_IVAR____SWCollaborationButtonViewImpl_delegate;
    swift_beginAccess();
    uint64_t v7 = (void *)MEMORY[0x192FBDAA0](v6);
    if (v7)
    {
      id v8 = v7;
      if (objc_msgSend(v7, sel_respondsToSelector_, *a1)) {
        objc_msgSend(v8, *a1, v5);
      }

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t type metadata accessor for _SWCollaborationButtonViewImpl()
{
  return self;
}

uint64_t sub_18FB43E4C()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_18FB43E88()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18FB43E98()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_18FB43EC0()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_18FB43ED0()
{
  uint64_t v1 = (uint64_t *)(*(void *)(v0 + 16) + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  return sub_18FB3E990(*v1);
}

uint64_t sub_18FB43F20()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

id sub_18FB43F30@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_32Tm(a1, (SEL *)&selRef_cloudSharingControllerDelegate, a2);
}

id sub_18FB43F3C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_33Tm(a1, a2, a3, a4, (SEL *)&selRef_setCloudSharingControllerDelegate_);
}

uint64_t sub_18FB43F48@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

id sub_18FB43F9C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (uint64_t *)(*a2 + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  *uint64_t v3 = v2;
  return sub_18FB3E990(v2);
}

uint64_t sub_18FB43FFC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_36Tm(a1, &OBJC_IVAR____SWCollaborationButtonViewImpl_headerTitle, a2);
}

uint64_t sub_18FB44008(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_37Tm(a1, a2, a3, a4, _SWCollaborationButtonViewImpl.headerTitle.setter);
}

uint64_t sub_18FB44020@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_36Tm(a1, &OBJC_IVAR____SWCollaborationButtonViewImpl_headerSubtitle, a2);
}

uint64_t keypath_get_36Tm@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_18FB44080(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_37Tm(a1, a2, a3, a4, _SWCollaborationButtonViewImpl.headerSubtitle.setter);
}

uint64_t keypath_set_37Tm(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

id sub_18FB440E0@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;

  return v4;
}

void sub_18FB44144(id *a1)
{
  id v1 = *a1;
  id v2 = *a1;
  sub_18FB436C0(v1);
}

uint64_t sub_18FB44194@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_get_42Tm(a1, &OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton, a2);
}

uint64_t sub_18FB441A0()
{
  return keypath_set_43Tm();
}

uint64_t sub_18FB441AC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_get_42Tm(a1, &OBJC_IVAR____SWCollaborationButtonViewImpl_delegate, a2);
}

uint64_t keypath_get_42Tm@<X0>(void *a1@<X0>, void *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1 + *a2;
  swift_beginAccess();
  uint64_t result = MEMORY[0x192FBDAA0](v4);
  *a3 = result;
  return result;
}

uint64_t sub_18FB4420C()
{
  return keypath_set_43Tm();
}

uint64_t keypath_set_43Tm()
{
  return swift_unknownObjectWeakAssign();
}

id sub_18FB4426C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_32Tm(a1, (SEL *)&selRef_itemProvider, a2);
}

id keypath_get_32Tm@<X0>(void *a1@<X0>, SEL *a2@<X3>, void *a3@<X8>)
{
  id result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                                 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), *a2));
  *a3 = result;
  return result;
}

id sub_18FB442BC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_33Tm(a1, a2, a3, a4, (SEL *)&selRef_setItemProvider_);
}

id keypath_set_33Tm(void *a1, void *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), *a5, *a1);
}

void sub_18FB442E8(char *a1)
{
}

uint64_t method lookup function for _SWCollaborationButtonViewImpl(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for _SWCollaborationButtonViewImpl);
}

uint64_t sub_18FB44328(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_18FB44338()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_18FB44370()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_18FB44380(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9266150);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_18FB443E0()
{
  sub_18FB4143C(*(char **)(v0 + 16));
}

uint64_t sub_18FB443E8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

unint64_t sub_18FB44420()
{
  unint64_t result = qword_1E9265EE0;
  if (!qword_1E9265EE0)
  {
    sub_18FB55A00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9265EE0);
  }
  return result;
}

id sub_18FB44478()
{
  return sub_18FB42FFC(*(char **)(v0 + 16));
}

id sub_18FB44480()
{
  return sub_18FB43194(*(char **)(v0 + 16));
}

uint64_t sub_18FB44488()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

void sub_18FB444C8()
{
  id v1 = *(void **)(*(void *)(v0 + 16) + OBJC_IVAR____SWCollaborationButtonViewImpl_label);
  id v2 = (id)sub_18FB55A50();
  objc_msgSend(v1, sel_setText_, v2);
}

void sub_18FB44530()
{
}

uint64_t sub_18FB44554()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_18FB44564()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_18FB4459C(void **a1)
{
  sub_18FB426A8(a1, v1);
}

void sub_18FB44614(unsigned char *a1)
{
  id v2 = v1;
  long long v42 = *v1;
  uint64_t v4 = (void *)*((void *)&v42 + 1);
  unsigned __int8 v5 = sub_18FB47E98(*((void **)&v42 + 1), *((unsigned char *)v1 + 16));
  uint64_t v6 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock;
  a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] = 0;
  uint64_t v7 = (objc_class *)type metadata accessor for CommunicationControl();
  v41.receiver = a1;
  v41.super_class = v7;
  char v8 = objc_msgSendSuper2(&v41, sel_isEnabled);
  v40.receiver = a1;
  v40.super_class = v7;
  objc_msgSendSuper2(&v40, sel_setEnabled_, v5 & 1);
  sub_18FB4647C(v8);
  a1[v6] = 1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v9 = v4;
  sub_18FB55490();
  swift_release();
  swift_release();
  sub_18FB485B4((uint64_t)&v42);
  if (v39)
  {
    id v10 = objc_msgSend(v39, sel_slHighlight);

    id v11 = objc_msgSend(v10, sel_attributions);
    sub_18FB2EF00(0, &qword_1E9266260);
    unint64_t v12 = sub_18FB55B00();
  }
  else
  {
    unint64_t v12 = MEMORY[0x1E4FBC860];
  }
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_18FB55D50();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  objc_msgSend(a1, sel_setContextMenuInteractionEnabled_, v13 > 1);
  objc_msgSend(a1, sel_setShowsMenuAsPrimaryAction_, v13 > 1);
  if (v13 >= 2)
  {
    sub_18FB2EF00(0, &qword_1E9266260);
    sub_18FB48680();
    sub_18FB55B40();
    sub_18FB55D90();
    id v14 = (id)sub_18FB55A50();
    swift_bridgeObjectRelease();
    uint64_t v15 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu;
    id v16 = *(void **)&a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu];
    if (v16)
    {
      id v17 = objc_msgSend(v16, sel_identifier);
      uint64_t v18 = sub_18FB55A80();
      uint64_t v20 = v19;
      if (v18 == sub_18FB55A80() && v20 == v21)
      {
        id v22 = v14;

LABEL_27:
        swift_bridgeObjectRelease_n();
        goto LABEL_28;
      }
      char v27 = sub_18FB55DA0();
      id v28 = v14;

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v27)
      {
LABEL_28:
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
    }
    uint64_t v29 = sub_18FB44B74(v12, a1, v14);
    swift_bridgeObjectRelease();

    id v14 = *(id *)&a1[v15];
    *(void *)&a1[v15] = v29;
LABEL_31:

    return;
  }
  if (!(v12 >> 62))
  {
    uint64_t v23 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v23) {
      goto LABEL_13;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    id v14 = (id)sub_18FB55A50();
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  if (!sub_18FB55D50()) {
    goto LABEL_19;
  }
LABEL_13:
  if ((v12 & 0xC000000000000001) != 0)
  {
    id v24 = (id)MEMORY[0x192FBCF50](0, v12);
    goto LABEL_16;
  }
  if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v24 = *(id *)(v12 + 32);
LABEL_16:
    id v25 = v24;
    swift_bridgeObjectRelease();
    id v26 = objc_msgSend(v25, sel_uniqueIdentifier);
    if (v26)
    {
      id v14 = v26;
    }
    else
    {
      sub_18FB55A80();
      id v14 = (id)sub_18FB55A50();
      swift_bridgeObjectRelease();
    }

LABEL_24:
    if (*(void *)&a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier])
    {
      uint64_t v30 = sub_18FB55A80();
      uint64_t v32 = v31;
      if (v30 == sub_18FB55A80() && v32 == v33) {
        goto LABEL_27;
      }
      char v34 = sub_18FB55DA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v34) {
        goto LABEL_28;
      }
    }
    sub_18FB2EF00(0, &qword_1E9266268);
    uint64_t v35 = *((void *)v2 + 3);
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v12;
    *(void *)(v36 + 24) = a1;
    long long v37 = v2[1];
    *(_OWORD *)(v36 + 32) = *v2;
    *(_OWORD *)(v36 + 48) = v37;
    *(void *)(v36 + 64) = *((void *)v2 + 4);
    sub_18FB48644((uint64_t)&v42);
    a1;
    sub_18FB48670(v35);
    id v38 = (void *)sub_18FB55C50();
    id v14 = v14;
    sub_18FB45558((uint64_t)v38, v14);

    goto LABEL_31;
  }
  __break(1u);
}

uint64_t sub_18FB44B74(unint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_18FB55D50();
    swift_bridgeObjectRelease();
    if (v25 > 0)
    {
      unint64_t v36 = MEMORY[0x1E4FBC860];
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_18FB55D50();
      if (!v29)
      {
        swift_bridgeObjectRelease();
        if (!(MEMORY[0x1E4FBC860] >> 62))
        {
LABEL_13:
          swift_bridgeObjectRetain();
          sub_18FB55DB0();
          sub_18FB2EF00(0, &qword_1E9266248);
LABEL_14:
          swift_bridgeObjectRelease();
          sub_18FB2EF00(0, &qword_1E9266278);
          id v24 = a3;
          return sub_18FB55C20();
        }
LABEL_18:
        sub_18FB2EF00(0, &qword_1E9266248);
        swift_bridgeObjectRetain();
        sub_18FB55D40();
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      goto LABEL_4;
    }
    return 0;
  }
  uint64_t v29 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v29) {
    return 0;
  }
  unint64_t v36 = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRetain();
LABEL_4:
  long long v37 = *v4;
  uint64_t v8 = *((void *)v4 + 3);
  uint64_t result = self;
  id v28 = (id)result;
  if (v29 >= 1)
  {
    uint64_t v10 = 0;
    unint64_t v26 = v7 & 0xC000000000000001;
    unint64_t v27 = v7;
    do
    {
      if (v26) {
        id v11 = (id)MEMORY[0x192FBCF50](v10, v7);
      }
      else {
        id v11 = *(id *)(v7 + 8 * v10 + 32);
      }
      unint64_t v12 = v11;
      uint64_t v13 = swift_allocObject();
      long long v14 = v4[1];
      *(_OWORD *)(v13 + 24) = *v4;
      *(void *)(v13 + 16) = v12;
      *(_OWORD *)(v13 + 40) = v14;
      *(void *)(v13 + 56) = *((void *)v4 + 4);
      char v34 = sub_18FB48738;
      uint64_t v35 = v13;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v31 = 1107296256;
      uint64_t v32 = sub_18FB45AE0;
      uint64_t v33 = &block_descriptor_11;
      uint64_t v15 = _Block_copy(&aBlock);
      id v16 = v12;
      sub_18FB48644((uint64_t)&v37);
      sub_18FB48670(v8);
      id v17 = objc_msgSend(v28, sel_elementWithViewProvider_, v15);
      _Block_release(v15);
      swift_release();
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v16;
      *(void *)(v18 + 24) = a2;
      long long v19 = v4[1];
      *(_OWORD *)(v18 + 32) = *v4;
      *(_OWORD *)(v18 + 48) = v19;
      *(void *)(v18 + 64) = *((void *)v4 + 4);
      char v34 = sub_18FB4879C;
      uint64_t v35 = v18;
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v31 = 1107296256;
      uint64_t v32 = sub_18FB45EDC;
      uint64_t v33 = &block_descriptor_17;
      uint64_t v20 = _Block_copy(&aBlock);
      id v21 = v16;
      sub_18FB48644((uint64_t)&v37);
      sub_18FB48670(v8);
      id v22 = a2;
      swift_release();
      objc_msgSend(v17, sel_setPrimaryActionHandler_, v20);
      _Block_release(v20);
      id v23 = v17;
      MEMORY[0x192FBCD30]();
      if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_18FB55B20();
      }
      ++v10;
      sub_18FB55B30();
      sub_18FB55B10();

      unint64_t v7 = v27;
    }
    while (v29 != v10);
    swift_bridgeObjectRelease();
    if (!(v36 >> 62)) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_18FB44FD4(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = sub_18FB55430();
  unint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9);
  id v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    id v12 = (id)sub_18FB55D50();
    if (v12)
    {
LABEL_3:
      uint64_t v52 = a4;
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v13 = (id)MEMORY[0x192FBCF50](0, a2);
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_29:
          swift_once();
LABEL_16:
          char v34 = *(void **)(qword_1E92675D0
                         + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
          *(void *)(qword_1E92675D0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = v12;
          id v35 = v12;

          id v36 = [(id)a2 (SEL)(v7 + 3224)];
          uint64_t v37 = sub_18FB55A80();
          unint64_t v39 = v38;

          id v40 = [(id)a2 (SEL)(v8 + 2632)];
          if (v40)
          {
            objc_super v41 = v40;
            uint64_t v42 = sub_18FB55A80();
            uint64_t v44 = v43;
          }
          else
          {
            uint64_t v42 = 0;
            uint64_t v44 = 0xE000000000000000;
          }
          sub_18FB49394(v37, v39, v42, v44, *(unsigned __int8 *)(v52 + 16));
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v45 = *(void **)(qword_1E92675D0
                         + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
          *(void *)(qword_1E92675D0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = 0;

          return;
        }
        id v13 = *(id *)(a2 + 32);
      }
      long long v14 = v13;
      swift_bridgeObjectRelease();
      if (qword_1E9265A60 != -1) {
        swift_once();
      }
      uint64_t v15 = __swift_project_value_buffer(v7, (uint64_t)qword_1E92675D8);
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v15, v7);
      a2 = v14;
      id v16 = sub_18FB55410();
      int v17 = sub_18FB55B60();
      uint64_t v18 = &unk_1E5666000;
      unint64_t v19 = 8448000000;
      if (os_log_type_enabled(v16, (os_log_type_t)v17))
      {
        int v50 = v17;
        id v51 = a3;
        uint64_t v20 = swift_slowAlloc();
        uint64_t v49 = swift_slowAlloc();
        uint64_t v55 = v49;
        *(_DWORD *)uint64_t v20 = 136315394;
        id v21 = objc_msgSend((id)a2, sel_uniqueIdentifier);
        uint64_t v22 = sub_18FB55A80();
        unint64_t v24 = v23;

        uint64_t v53 = sub_18FB4ACA4(v22, v24, &v55);
        sub_18FB55C70();

        unint64_t v19 = (unint64_t)&unk_1E5666000;
        swift_bridgeObjectRelease();
        *(_WORD *)(v20 + 12) = 2080;
        id v25 = objc_msgSend((id)a2, sel_attachmentGUID);
        if (v25)
        {
          unint64_t v26 = v25;
          uint64_t v27 = sub_18FB55A80();
          uint64_t v29 = v28;

          uint64_t v53 = v27;
          uint64_t v54 = v29;
          unint64_t v19 = 0x1F78A4000uLL;
          uint64_t v30 = sub_18FB55A90();
          unint64_t v32 = v31;
        }
        else
        {
          unint64_t v32 = 0xE300000000000000;
          uint64_t v30 = 7104878;
        }
        uint64_t v53 = sub_18FB4ACA4(v30, v32, &v55);
        sub_18FB55C70();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_18FB18000, v16, (os_log_type_t)v50, "Calling  performCommunicationAction with values messageGUID: %s, attachmentGUID: %s", (uint8_t *)v20, 0x16u);
        uint64_t v33 = v49;
        swift_arrayDestroy();
        MEMORY[0x192FBD9D0](v33, -1, -1);
        MEMORY[0x192FBD9D0](v20, -1, -1);

        (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
        a3 = v51;
        uint64_t v18 = (void *)0x1F6972000;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      }
      if ((objc_msgSend(a3, sel_respondsToSelector_, sel__viewControllerForAncestor) & 1) == 0)
      {

        return;
      }
      uint64_t v7 = (uint64_t)v18;
      unint64_t v8 = v19;
      id v12 = objc_msgSend(a3, sel__viewControllerForAncestor);
      if (qword_1E9265A58 == -1) {
        goto LABEL_16;
      }
      goto LABEL_29;
    }
  }
  else
  {
    id v12 = *(id *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v46 = *(void (**)(uint64_t))(a4 + 24);
  if (v46)
  {
    uint64_t v47 = swift_retain();
    v46(v47);
    sub_18FB44328((uint64_t)v46);
  }
}

id sub_18FB45558(uint64_t a1, void *a2)
{
  uint64_t v4 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier;
  if (*(void *)&v2[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier])
  {
    uint64_t v5 = sub_18FB55A80();
    uint64_t v7 = v6;
    if (v5 == sub_18FB55A80() && v7 == v8) {
      return (id)swift_bridgeObjectRelease_n();
    }
    char v10 = sub_18FB55DA0();
    swift_bridgeObjectRelease();
    id result = (id)swift_bridgeObjectRelease();
    if (v10) {
      return result;
    }
    uint64_t v12 = *(void *)&v2[v4];
    if (v12) {
      objc_msgSend(v2, sel_removeActionForIdentifier_forControlEvents_, v12, 64);
    }
  }
  objc_msgSend(v2, sel_addAction_forControlEvents_, a1, 64);
  id v13 = *(void **)&v2[v4];
  *(void *)&v2[v4] = a2;

  return a2;
}

id sub_18FB45678(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_init);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  id v4 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);

  id v5 = objc_allocWithZone((Class)sub_18FB55310());
  id v6 = a2;
  uint64_t v7 = (void *)sub_18FB55300();
  objc_msgSend(v7, sel_setRemoteRenderingEnabled_, 1);
  id v8 = v7;
  sub_18FB55330();

  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v8, sel_setUserInteractionEnabled_, 0);
  objc_msgSend(v3, sel_addSubview_, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266188);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_18FB58FE0;
  id v10 = objc_msgSend(v8, sel_topAnchor);
  id v11 = objc_msgSend(v3, sel_topAnchor);
  uint64_t v12 = self;
  id v13 = objc_msgSend(v12, sel_currentDevice);
  id v14 = objc_msgSend(v13, sel_userInterfaceIdiom);

  if (v14 == (id)6) {
    double v15 = 12.0;
  }
  else {
    double v15 = 8.0;
  }
  if (v14 == (id)5) {
    double v15 = 5.0;
  }
  id v16 = objc_msgSend(v10, sel_constraintEqualToAnchor_constant_, v11, v15);

  *(void *)(v9 + 32) = v16;
  id v17 = objc_msgSend(v8, sel_bottomAnchor);
  id v18 = objc_msgSend(v3, sel_bottomAnchor);
  id v19 = objc_msgSend(v12, sel_currentDevice);
  id v20 = objc_msgSend(v19, sel_userInterfaceIdiom);

  if (v20 == (id)6) {
    double v21 = 12.0;
  }
  else {
    double v21 = 8.0;
  }
  if (v20 == (id)5) {
    double v21 = 5.0;
  }
  id v22 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, -v21);

  *(void *)(v9 + 40) = v22;
  id v23 = objc_msgSend(v8, sel_leadingAnchor);
  id v24 = objc_msgSend(v3, sel_leadingAnchor);
  id v25 = objc_msgSend(v12, sel_currentDevice);
  id v26 = objc_msgSend(v25, sel_userInterfaceIdiom);

  double v27 = 16.0;
  if (v26 == (id)6) {
    double v27 = 20.0;
  }
  id v28 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v24, v27);

  *(void *)(v9 + 48) = v28;
  id v29 = objc_msgSend(v8, sel_trailingAnchor);
  id v30 = objc_msgSend(v3, sel_trailingAnchor);
  id v31 = objc_msgSend(v12, sel_currentDevice);
  id v32 = objc_msgSend(v31, sel_userInterfaceIdiom);

  if (v32 == (id)6) {
    double v33 = 12.0;
  }
  else {
    double v33 = 8.0;
  }
  if (v32 == (id)5) {
    double v34 = 5.0;
  }
  else {
    double v34 = v33;
  }
  id v35 = self;
  id v36 = objc_msgSend(v29, sel_constraintEqualToAnchor_constant_, v30, -v34);

  *(void *)(v9 + 56) = v36;
  sub_18FB55B10();
  sub_18FB2EF00(0, (unint64_t *)&qword_1E9266190);
  uint64_t v37 = (void *)sub_18FB55AF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v35, sel_activateConstraints_, v37);

  return v3;
}

id sub_18FB45AE0(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  id v5 = (void *)v3();
  swift_release();

  return v5;
}

void sub_18FB45B48(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if (qword_1E9265A68 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_18FB55430();
  __swift_project_value_buffer(v6, (uint64_t)qword_1E92675F0);
  uint64_t v7 = sub_18FB55410();
  os_log_type_t v8 = sub_18FB55B60();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_18FB18000, v7, v8, "Something was tapped in the disambiguation menu", v9, 2u);
    MEMORY[0x192FBD9D0](v9, -1, -1);
  }

  id v10 = a2;
  id v11 = sub_18FB55410();
  os_log_type_t v12 = sub_18FB55B60();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v34 = v14;
    *(_DWORD *)id v13 = 136315138;
    id v15 = objc_msgSend(v10, sel_uniqueIdentifier);
    uint64_t v16 = sub_18FB55A80();
    id v17 = a3;
    unint64_t v19 = v18;

    sub_18FB4ACA4(v16, v19, &v34);
    sub_18FB55C70();

    a3 = v17;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_18FB18000, v11, v12, "Conversation attribution view was tapped in disambiguation menu. attribution.identifer: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x192FBD9D0](v14, -1, -1);
    MEMORY[0x192FBD9D0](v13, -1, -1);
  }
  else
  {
  }
  if (objc_msgSend(a3, sel_respondsToSelector_, sel__viewControllerForAncestor))
  {
    id v20 = objc_msgSend(a3, sel__viewControllerForAncestor);
    if (qword_1E9265A58 != -1) {
      swift_once();
    }
    double v21 = *(void **)(qword_1E92675D0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
    *(void *)(qword_1E92675D0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = v20;
    id v22 = v20;

    id v23 = objc_msgSend(v10, sel_uniqueIdentifier);
    uint64_t v24 = sub_18FB55A80();
    unint64_t v26 = v25;

    id v27 = objc_msgSend(v10, sel_attachmentGUID);
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = sub_18FB55A80();
      uint64_t v31 = v30;
    }
    else
    {
      uint64_t v31 = 0xE600000000000000;
      uint64_t v29 = 0x29656E6F6E28;
    }
    sub_18FB49394(v24, v26, v29, v31, *(unsigned __int8 *)(a4 + 16));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v32 = *(void **)(qword_1E92675D0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
    *(void *)(qword_1E92675D0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController) = 0;
  }
}

void sub_18FB45EDC(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

char *sub_18FB45F44(uint64_t a1)
{
  return sub_18FB48034(a1, *(void **)(v1 + 8), *(unsigned char *)(v1 + 16));
}

void sub_18FB45F50(unsigned char *a1)
{
}

uint64_t sub_18FB45F9C()
{
  return sub_18FB555F0();
}

uint64_t sub_18FB45FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18FB48558();

  return MEMORY[0x1F40F9EF0](a1, a2, a3, v6);
}

uint64_t sub_18FB46044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18FB48558();

  return MEMORY[0x1F40F9E78](a1, a2, a3, v6);
}

void sub_18FB460A8()
{
}

id sub_18FB46114()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v0 = self;
  uint64_t v1 = 0;
  uint64_t v2 = *MEMORY[0x1E4FB2998];
  for (double i = 0.0; ; double i = v10)
  {
    id v4 = (void *)sub_18FB55A50();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v0, sel_systemImageNamed_, v4);

    if (!v5) {
      goto LABEL_6;
    }
    id v6 = objc_msgSend(self, sel_preferredFontForTextStyle_, v2);
    id v7 = objc_msgSend(self, sel_configurationWithFont_scale_, v6, 2);

    id v8 = objc_msgSend(v5, sel_imageWithSymbolConfiguration_, v7);
    if (v8)
    {
      objc_msgSend(v8, sel_size);
      double v10 = v9;

      if (i > v10) {
        double v10 = i;
      }
    }
    else
    {
LABEL_6:
      double v10 = i;
      if (i <= 0.0) {
        double v10 = 0.0;
      }
    }
    if (v1 == 2) {
      break;
    }
    ++v1;
  }
  id v11 = self;
  id v12 = objc_msgSend(v11, sel_currentDevice);
  objc_msgSend(v12, sel_userInterfaceIdiom);

  id v13 = objc_msgSend(v11, sel_currentDevice, ObjectType);
  objc_msgSend(v13, sel_userInterfaceIdiom);

  objc_msgSend(*(id *)&v17[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label], sel_intrinsicContentSize);
  v18.receiver = v17;
  v18.super_class = v16;
  return objc_msgSendSuper2(&v18, sel_intrinsicContentSize);
}

void sub_18FB4647C(char a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock;
  if (v1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] == 1)
  {
    id v6 = (objc_class *)ObjectType;
    if (qword_1E9265A60 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_18FB55430();
    __swift_project_value_buffer(v7, (uint64_t)qword_1E92675D8);
    id v8 = v1;
    double v9 = sub_18FB55410();
    os_log_type_t v10 = sub_18FB55B70();
    if (os_log_type_enabled(v9, v10))
    {
      char v19 = a1;
      id v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v20 = v18;
      *(_DWORD *)id v11 = 136315138;
      id v12 = objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label], sel_text);
      if (v12)
      {
        id v13 = v12;
        unint64_t v14 = sub_18FB55A80();
        unint64_t v16 = v15;
      }
      else
      {
        unint64_t v16 = 0x800000018FB5B620;
        unint64_t v14 = 0xD000000000000013;
      }
      sub_18FB4ACA4(v14, v16, &v20);
      sub_18FB55C70();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_18FB18000, v9, v10, "%s - Tried to set CommunicationControl.isEnabled, but enablementLock was true. Setting isEnabled back to oldValue. If this was an intentional setting, use CommunicationControl.setIsEnabled(_:) instead of setting this property directly.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x192FBD9D0](v18, -1, -1);
      MEMORY[0x192FBD9D0](v11, -1, -1);

      a1 = v19;
    }
    else
    {
    }
    v2[v5] = 0;
    v22.receiver = v8;
    v22.super_class = v6;
    id v17 = objc_msgSendSuper2(&v22, sel_isEnabled);
    v21.receiver = v8;
    v21.super_class = v6;
    objc_msgSendSuper2(&v21, sel_setEnabled_, a1 & 1);
    sub_18FB4647C(v17);
    v2[v5] = 1;
  }
  else
  {
    sub_18FB46714();
  }
}

void sub_18FB46714()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock;
  *((unsigned char *)v0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock) = 0;
  id v4 = objc_msgSend(self, sel_currentDevice);
  id v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

  if (v5 == (id)6)
  {
    id v6 = objc_msgSend(self, sel_whiteColor);
  }
  else
  {
    sub_18FB2EF00(0, &qword_1E9266250);
    sub_18FB55900();
    id v6 = (id)sub_18FB55C30();
  }
  uint64_t v7 = v6;
  v11.receiver = v1;
  v11.super_class = ObjectType;
  if (objc_msgSendSuper2(&v11, sel_isEnabled)) {
    id v8 = v7;
  }
  else {
    id v8 = objc_msgSend(self, sel_lightGrayColor);
  }
  double v9 = v8;
  v10.receiver = v1;
  v10.super_class = ObjectType;
  objc_msgSendSuper2(&v10, sel_setTintColor_, v8);
  sub_18FB46928();

  *((unsigned char *)v1 + v3) = 1;
}

void sub_18FB46928()
{
  if (*((unsigned char *)v0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock) == 1)
  {
    if (qword_1E9265A60 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_18FB55430();
    __swift_project_value_buffer(v1, (uint64_t)qword_1E92675D8);
    objc_super v11 = v0;
    uint64_t v2 = sub_18FB55410();
    os_log_type_t v3 = sub_18FB55B70();
    if (os_log_type_enabled(v2, v3))
    {
      id v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      uint64_t v12 = v5;
      *(_DWORD *)id v4 = 136315138;
      id v6 = objc_msgSend(*(id *)&v11[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label], sel_text);
      if (v6)
      {
        uint64_t v7 = v6;
        unint64_t v8 = sub_18FB55A80();
        unint64_t v10 = v9;
      }
      else
      {
        unint64_t v10 = 0x800000018FB5B620;
        unint64_t v8 = 0xD000000000000013;
      }
      sub_18FB4ACA4(v8, v10, &v12);
      sub_18FB55C70();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_18FB18000, v2, v3, "%s - Set CommunicationControl.tintColor, but tintLock was true. This is unexpected, as CommunicationControl manages tint color internally", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x192FBD9D0](v5, -1, -1);
      MEMORY[0x192FBD9D0](v4, -1, -1);
    }
    else
    {
    }
  }
}

char *sub_18FB46B5C(char a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier] = 0;
  uint64_t v4 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView;
  id v5 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v6 = v1;
  *(void *)&v1[v4] = objc_msgSend(v5, sel_init);
  uint64_t v7 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView;
  *(void *)&v6[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  uint64_t v8 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label;
  *(void *)&v6[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);
  *(void *)&v6[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu] = 0;
  v6[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] = 1;
  v6[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock] = 1;
  v6[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_communicationChannel] = a1;

  v107.receiver = v6;
  v107.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v107, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_18FB46714();
  unint64_t v10 = self;
  objc_super v11 = (char *)v9;
  id v12 = objc_msgSend(v10, sel_tertiarySystemBackgroundColor);
  objc_msgSend(v11, sel_setBackgroundColor_, v12);

  id v13 = objc_msgSend(v11, sel_layer);
  id v102 = self;
  id v14 = objc_msgSend(v102, sel_currentDevice);
  id v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

  double v16 = 16.0;
  if (v15 != (id)6) {
    double v16 = 12.0;
  }
  objc_msgSend(v13, sel_setCornerRadius_, v16);

  uint64_t v17 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView;
  uint64_t v18 = *(void **)&v11[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView];
  objc_msgSend(v18, sel_setUserInteractionEnabled_, 0);
  id v19 = v18;
  id v20 = objc_msgSend(v10, sel_clearColor);
  objc_msgSend(v19, sel_setBackgroundColor_, v20);

  objc_super v21 = *(void **)&v11[v17];
  v106.receiver = v11;
  v106.super_class = ObjectType;
  id v22 = v21;
  id v23 = objc_msgSendSuper2(&v106, sel_tintColor);
  objc_msgSend(v22, sel_setTintColor_, v23);

  uint64_t v24 = *(void **)&v11[v17];
  objc_msgSend(v24, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v11, sel_addSubview_, v24);
  uint64_t v25 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView;
  unint64_t v26 = *(void **)&v11[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView];
  v105.receiver = v11;
  v105.super_class = ObjectType;
  id v27 = v26;
  id v28 = objc_msgSendSuper2(&v105, sel_tintColor);
  objc_msgSend(v27, sel_setTintColor_, v28);

  id v29 = *(id *)&v11[v25];
  uint64_t v30 = (void *)sub_18FB55A50();
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(self, sel_systemImageNamed_, v30);

  if (v31)
  {
    id v32 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB2998]);
    id v33 = objc_msgSend(self, sel_configurationWithFont_scale_, v32, 2);

    id v34 = objc_msgSend(v31, sel_imageWithSymbolConfiguration_, v33);
  }
  else
  {
    id v34 = 0;
  }
  objc_msgSend(v29, sel_setImage_, v34);

  id v35 = *(void **)&v11[v25];
  objc_msgSend(v35, sel_setContentMode_, 4);
  objc_msgSend(v35, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v11[v17], sel_addSubview_, v35);
  uint64_t v36 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label;
  id v37 = *(id *)&v11[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label];
  sub_18FB48F68();
  unint64_t v38 = (void *)sub_18FB55A50();
  swift_bridgeObjectRelease();
  objc_msgSend(v37, sel_setText_, v38);

  unint64_t v39 = *(void **)&v11[v36];
  v104.receiver = v11;
  v104.super_class = ObjectType;
  id v40 = v39;
  id v41 = objc_msgSendSuper2(&v104, sel_tintColor);
  objc_msgSend(v40, sel_setTintColor_, v41);

  uint64_t v42 = *(void **)&v11[v36];
  v103.receiver = v11;
  v103.super_class = ObjectType;
  id v43 = v42;
  id v44 = objc_msgSendSuper2(&v103, sel_tintColor);
  objc_msgSend(v43, sel_setTextColor_, v44);

  uint64_t v45 = *(void **)&v11[v36];
  objc_msgSend(v45, sel_setTextAlignment_, 1);
  uint64_t v46 = self;
  uint64_t v47 = *MEMORY[0x1E4FB28E0];
  id v48 = v45;
  id v49 = objc_msgSend(v46, sel_preferredFontForTextStyle_, v47);
  objc_msgSend(v48, sel_setFont_, v49);

  int v50 = *(void **)&v11[v36];
  objc_msgSend(v50, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v50, (SEL)&selRef_promptToRemoveParticipant_fromHighlight_usingPreferredStyle_ + 7, 0);
  id v51 = *(void **)&v11[v17];
  objc_msgSend(v51, sel_addSubview_, v50);
  objc_msgSend(v50, sel_setNumberOfLines_, 1);
  objc_msgSend(v50, sel_setLineBreakMode_, 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266188);
  uint64_t v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_18FB58FF0;
  id v53 = objc_msgSend(*(id *)&v11[v25], sel_centerXAnchor);
  id v54 = objc_msgSend(v51, sel_centerXAnchor);
  id v55 = objc_msgSend(v53, sel_constraintEqualToAnchor_, v54);

  *(void *)(v52 + 32) = v55;
  id v56 = objc_msgSend(*(id *)&v11[v25], sel_leadingAnchor);
  id v57 = objc_msgSend(*(id *)&v11[v17], (SEL)&off_1E5666238 + 2);
  id v58 = objc_msgSend(v56, sel_constraintGreaterThanOrEqualToAnchor_, v57);

  *(void *)(v52 + 40) = v58;
  id v59 = objc_msgSend(*(id *)&v11[v25], sel_trailingAnchor);
  id v60 = objc_msgSend(*(id *)&v11[v17], (SEL)&selRef_archivedObjectClass + 4);
  id v61 = objc_msgSend(v59, sel_constraintGreaterThanOrEqualToAnchor_, v60);

  *(void *)(v52 + 48) = v61;
  id v62 = objc_msgSend(*(id *)&v11[v25], sel_topAnchor);
  id v63 = objc_msgSend(*(id *)&v11[v17], (SEL)&selRef_closeButton + 3);
  id v64 = objc_msgSend(v62, (SEL)&selRef__addContentExtractionRequest_ + 6, v63);

  *(void *)(v52 + 56) = v64;
  id v65 = objc_msgSend(*(id *)&v11[v36], (SEL)&selRef_closeButton + 3);
  id v66 = objc_msgSend(*(id *)&v11[v25], sel_bottomAnchor);
  id v67 = objc_msgSend(v102, sel_currentDevice);
  id v68 = objc_msgSend(v67, sel_userInterfaceIdiom);

  double v69 = 3.0;
  if (v68 == (id)6) {
    double v69 = 4.0;
  }
  if (v68 == (id)5) {
    double v69 = 1.0;
  }
  id v70 = objc_msgSend(v65, sel_constraintEqualToAnchor_constant_, v66, v69);

  *(void *)(v52 + 64) = v70;
  id v71 = objc_msgSend(*(id *)&v11[v36], sel_bottomAnchor);
  id v72 = objc_msgSend(*(id *)&v11[v17], sel_bottomAnchor);
  id v73 = objc_msgSend(v71, sel_constraintEqualToAnchor_, v72);

  *(void *)(v52 + 72) = v73;
  id v74 = objc_msgSend(*(id *)&v11[v36], sel_leadingAnchor);
  id v75 = objc_msgSend(*(id *)&v11[v17], sel_leadingAnchor);
  id v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v75);

  *(void *)(v52 + 80) = v76;
  id v77 = objc_msgSend(*(id *)&v11[v36], sel_trailingAnchor);
  id v78 = objc_msgSend(*(id *)&v11[v17], sel_trailingAnchor);
  id v79 = objc_msgSend(v77, sel_constraintEqualToAnchor_, v78);

  *(void *)(v52 + 88) = v79;
  id v80 = objc_msgSend(*(id *)&v11[v17], sel_topAnchor);
  id v81 = objc_msgSend(v11, sel_topAnchor);
  id v82 = objc_msgSend(v102, sel_currentDevice);
  id v83 = objc_msgSend(v82, sel_userInterfaceIdiom);

  if (v83 == (id)6) {
    double v84 = 12.0;
  }
  else {
    double v84 = 9.0;
  }
  if (v83 == (id)5) {
    double v84 = 5.0;
  }
  id v85 = objc_msgSend(v80, sel_constraintEqualToAnchor_constant_, v81, v84);

  *(void *)(v52 + 96) = v85;
  id v86 = objc_msgSend(*(id *)&v11[v17], sel_bottomAnchor);
  id v87 = objc_msgSend(v11, sel_bottomAnchor);
  id v88 = objc_msgSend(v102, sel_currentDevice);
  id v89 = objc_msgSend(v88, sel_userInterfaceIdiom);

  if (v89 == (id)6) {
    double v90 = 12.0;
  }
  else {
    double v90 = 9.0;
  }
  if (v89 == (id)5) {
    double v91 = 5.0;
  }
  else {
    double v91 = v90;
  }
  id v92 = self;
  id v93 = objc_msgSend(v86, sel_constraintEqualToAnchor_constant_, v87, -v91);

  *(void *)(v52 + 104) = v93;
  id v94 = objc_msgSend(*(id *)&v11[v17], sel_leadingAnchor);
  id v95 = objc_msgSend(v11, sel_leadingAnchor);
  id v96 = objc_msgSend(v94, sel_constraintEqualToAnchor_, v95);

  *(void *)(v52 + 112) = v96;
  id v97 = objc_msgSend(*(id *)&v11[v17], sel_trailingAnchor);
  id v98 = objc_msgSend(v11, sel_trailingAnchor);
  id v99 = objc_msgSend(v97, sel_constraintEqualToAnchor_, v98);

  *(void *)(v52 + 120) = v99;
  sub_18FB55B10();
  sub_18FB2EF00(0, (unint64_t *)&qword_1E9266190);
  id v100 = (void *)sub_18FB55AF0();
  swift_bridgeObjectRelease();
  objc_msgSend(v92, sel_activateConstraints_, v100);

  return v11;
}

uint64_t sub_18FB47790(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier;
  *(void *)&v1[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier] = 0;
  uint64_t v5 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  uint64_t v7 = v1;
  *(void *)&v2[v5] = objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView;
  *(void *)&v7[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_init);
  uint64_t v9 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label;
  id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1930]), sel_init);

  *(void *)&v7[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu;
  *(void *)&v7[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu] = 0;
  v7[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] = 1;
  v7[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_tintLock] = 1;

  id v12 = *(void **)&v7[v11];
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_18FB47900()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v13.receiver = v0;
  v13.super_class = ObjectType;
  objc_msgSendSuper2(&v13, sel_tintColorDidChange);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView];
  v12.receiver = v0;
  v12.super_class = ObjectType;
  id v3 = objc_msgSendSuper2(&v12, sel_tintColor);
  objc_msgSend(v2, sel_setTintColor_, v3);

  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView];
  v11.receiver = v0;
  v11.super_class = ObjectType;
  id v5 = objc_msgSendSuper2(&v11, sel_tintColor);
  objc_msgSend(v4, sel_setTintColor_, v5);

  id v6 = *(void **)&v0[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label];
  v10.receiver = v0;
  v10.super_class = ObjectType;
  id v7 = objc_msgSendSuper2(&v10, sel_tintColor);
  objc_msgSend(v6, sel_setTintColor_, v7);

  v9.receiver = v0;
  v9.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v9, sel_tintColor);
  objc_msgSend(v6, sel_setTextColor_, v8);
}

id sub_18FB47A8C(id a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_traitCollectionDidChange_, a1);
  if (a1) {
    a1 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  }
  id v3 = objc_msgSend(v1, sel_traitCollection);
  id v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (!a1)
  {

    return objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
  }
  uint64_t v5 = sub_18FB55A80();
  uint64_t v7 = v6;
  if (v5 == sub_18FB55A80() && v7 == v8)
  {

    return (id)swift_bridgeObjectRelease_n();
  }
  char v10 = sub_18FB55DA0();

  swift_bridgeObjectRelease();
  id result = (id)swift_bridgeObjectRelease();
  if ((v10 & 1) == 0) {
    return objc_msgSend(v1, sel_invalidateIntrinsicContentSize);
  }
  return result;
}

void *sub_18FB47C38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess();
  uint64_t v3 = MEMORY[0x192FBDAA0](v2);
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu);
  id v6 = v5;

  return v5;
}

id sub_18FB47D30()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CommunicationControl()
{
  return self;
}

id sub_18FB47E08(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  sub_18FB2EF00(0, &qword_1E9266248);
  uint64_t v2 = sub_18FB55B00();
  swift_retain();
  uint64_t v3 = (void *)v1(v2);
  swift_release();
  swift_bridgeObjectRelease();

  return v3;
}

id sub_18FB47E98(void *a1, char a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = a1;
  sub_18FB55490();

  swift_release();
  swift_release();

  if (!a2) {
    goto LABEL_5;
  }
  if (a2 != 1)
  {
    id result = objc_msgSend(self, sel_sharedInstance);
    if (!result) {
      goto LABEL_16;
    }
    objc_super v9 = result;
    unsigned __int8 v10 = objc_msgSend(result, sel_faceTimeAvailable);

    if ((v10 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_5:
    if (v11)
    {
      char v8 = 1;
    }
    else
    {
      if (a2) {
        char v8 = sub_18FB55DA0();
      }
      else {
        char v8 = 1;
      }
      swift_bridgeObjectRelease();
    }
    return (id)(v8 & 1);
  }
  id result = objc_msgSend(self, sel_sharedInstance);
  if (result)
  {
    id v6 = result;
    unsigned int v7 = objc_msgSend(result, sel_callingAvailable);

    if (v7) {
      goto LABEL_5;
    }
LABEL_9:
    char v8 = 0;
    return (id)(v8 & 1);
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

char *sub_18FB48034(uint64_t a1, void *a2, char a3)
{
  uint64_t v5 = (objc_class *)type metadata accessor for CommunicationControl();
  id v6 = objc_allocWithZone(v5);
  unsigned int v7 = sub_18FB46B5C(a3);
  LODWORD(v8) = 1132068864;
  objc_msgSend(v7, sel_setContentCompressionResistancePriority_forAxis_, 0, v8);
  unsigned __int8 v9 = sub_18FB47E98(a2, a3);
  uint64_t v10 = OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock;
  v7[OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_enablementLock] = 0;
  v13.receiver = v7;
  v13.super_class = v5;
  LOBYTE(a2) = objc_msgSendSuper2(&v13, sel_isEnabled);
  v12.receiver = v7;
  v12.super_class = v5;
  objc_msgSendSuper2(&v12, sel_setEnabled_, v9 & 1);
  sub_18FB4647C((char)a2);
  v7[v10] = 1;
  return v7;
}

id sub_18FB48104()
{
  v7.receiver = v0;
  v7.super_class = (Class)swift_getObjectType();
  if (!objc_msgSendSuper2(&v7, sel_isEnabled)) {
    return 0;
  }
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v2 = self;
  v6[4] = sub_18FB48284;
  v6[5] = v1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1107296256;
  v6[2] = sub_18FB47E08;
  v6[3] = &block_descriptor_3;
  uint64_t v3 = _Block_copy(v6);
  swift_retain_n();
  swift_release();
  id v4 = objc_msgSend(v2, sel_configurationWithIdentifier_previewProvider_actionProvider_, 0, 0, v3);
  swift_release();
  _Block_release(v3);
  swift_release();
  return v4;
}

uint64_t sub_18FB4824C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void *sub_18FB48284(uint64_t a1)
{
  return sub_18FB47C38(a1, v1);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void destroy for CommunicationButton(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    swift_release();
  }
}

uint64_t initializeWithCopy for CommunicationButton(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v6 = (_OWORD *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  id v7 = v4;
  if (v5)
  {
    uint64_t v8 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v5;
    *(void *)(a1 + 32) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 24) = *v6;
  }
  return a1;
}

uint64_t assignWithCopy for CommunicationButton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  id v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  uint64_t v7 = *(void *)(a1 + 24);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  if (!v7)
  {
    if (v8)
    {
      uint64_t v10 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v8;
      *(void *)(a1 + 32) = v10;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v8)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v9 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CommunicationButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;

  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  if (!v7)
  {
    if (v6)
    {
      uint64_t v9 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = v9;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    return a1;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CommunicationButton(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CommunicationButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommunicationButton()
{
  return &type metadata for CommunicationButton;
}

unint64_t sub_18FB48558()
{
  unint64_t result = qword_1E9266258;
  if (!qword_1E9266258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266258);
  }
  return result;
}

uint64_t sub_18FB485B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_18FB485E0()
{
  swift_bridgeObjectRelease();

  if (*(void *)(v0 + 56)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 72, 7);
}

void sub_18FB48638(uint64_t a1)
{
  sub_18FB44FD4(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), v1 + 32);
}

uint64_t sub_18FB48644(uint64_t a1)
{
  id v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_18FB48670(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_18FB48680()
{
  unint64_t result = qword_1E9266270;
  if (!qword_1E9266270)
  {
    sub_18FB2EF00(255, &qword_1E9266260);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266270);
  }
  return result;
}

uint64_t sub_18FB486E8()
{
  if (*(void *)(v0 + 48)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 64, 7);
}

id sub_18FB48738(uint64_t a1)
{
  return sub_18FB45678(a1, *(void **)(v1 + 16));
}

uint64_t sub_18FB48744()
{
  if (*(void *)(v0 + 56)) {
    swift_release();
  }

  return MEMORY[0x1F4186498](v0, 72, 7);
}

void sub_18FB4879C(uint64_t a1)
{
  sub_18FB45B48(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), v1 + 32);
}

void destroy for UICloudSharingControllerRepresentable(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();

  id v2 = *(void **)(a1 + 16);
}

uint64_t initializeWithCopy for UICloudSharingControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakCopyInit();
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = *(void **)(a2 + 16);
  *(void *)(v4 + 8) = v5;
  *(void *)(v4 + 16) = v6;
  id v7 = v5;
  id v8 = v6;
  return a1;
}

uint64_t assignWithCopy for UICloudSharingControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakCopyAssign();
  uint64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;
  id v7 = v5;

  id v8 = *(void **)(a2 + 16);
  uint64_t v9 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v8;
  id v10 = v8;

  return a1;
}

__n128 initializeWithTake for UICloudSharingControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = swift_unknownObjectWeakTakeInit();
  __n128 result = *(__n128 *)(a2 + 8);
  *(__n128 *)(v3 + 8) = result;
  return result;
}

uint64_t assignWithTake for UICloudSharingControllerRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_unknownObjectWeakTakeAssign();
  uint64_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = *(void *)(a2 + 8);

  uint64_t v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for UICloudSharingControllerRepresentable(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UICloudSharingControllerRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UICloudSharingControllerRepresentable()
{
  return &type metadata for UICloudSharingControllerRepresentable;
}

id sub_18FB489A0()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1550]), sel_initWithShare_container_, *(void *)(v0 + 8), *(void *)(v0 + 16));
  objc_msgSend(v1, sel_setDelegate_, MEMORY[0x192FBDAA0](v0));
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_18FB48A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18FB48B60();

  return MEMORY[0x1F40FAB70](a1, a2, a3, v6);
}

uint64_t sub_18FB48A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18FB48B60();

  return MEMORY[0x1F40FAB28](a1, a2, a3, v6);
}

void sub_18FB48AE0()
{
}

unint64_t sub_18FB48B0C()
{
  unint64_t result = qword_1E9266280;
  if (!qword_1E9266280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266280);
  }
  return result;
}

unint64_t sub_18FB48B60()
{
  unint64_t result = qword_1E9266288;
  if (!qword_1E9266288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266288);
  }
  return result;
}

uint64_t sub_18FB48BB4(char a1, char a2)
{
  if (*(void *)&aMessage_1[8 * a1] == *(void *)&aMessage_1[8 * a2] && qword_18FB59428[a1] == qword_18FB59428[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = sub_18FB55DA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_18FB48C3C(char a1, char a2)
{
  if (*(void *)&aCloudkitcustom_0[8 * a1] == *(void *)&aCloudkitcustom_0[8 * a2]
    && *(void *)&aFileprov_0[8 * a1 + 8] == *(void *)&aFileprov_0[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_18FB55DA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_18FB48CC4()
{
  return sub_18FB55DF0();
}

uint64_t sub_18FB48D30()
{
  return sub_18FB55DF0();
}

uint64_t sub_18FB48D9C()
{
  sub_18FB55AA0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_18FB48DF0()
{
  sub_18FB55AA0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_18FB48E44()
{
  return sub_18FB55DF0();
}

uint64_t sub_18FB48EAC()
{
  return sub_18FB55DF0();
}

uint64_t sub_18FB48F14(uint64_t a1, uint64_t a2)
{
  char v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_18FB48F68()
{
  sub_18FB2EF00(0, (unint64_t *)&unk_1E9265DB8);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_18FB551E0();

  return v2;
}

uint64_t sub_18FB49104(char a1)
{
  return *(void *)&aMessage_1[8 * a1];
}

uint64_t sub_18FB49124(char *a1, char *a2)
{
  return sub_18FB48BB4(*a1, *a2);
}

uint64_t sub_18FB49130()
{
  return sub_18FB48D30();
}

uint64_t sub_18FB49138()
{
  return sub_18FB48D9C();
}

uint64_t sub_18FB49140()
{
  return sub_18FB48EAC();
}

uint64_t sub_18FB49148@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_18FB4B2FC();
  *a1 = result;
  return result;
}

uint64_t sub_18FB49178@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18FB49104(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_18FB491A4(void *a1@<X8>)
{
  *a1 = &unk_1EDF18E28;
}

id sub_18FB491B4()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CommunicationManager()), sel_init);
  qword_1E92675D0 = (uint64_t)result;
  return result;
}

id sub_18FB491E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_18FB55A10();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  unint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy;
  id v8 = *(void **)(v0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy);
  if (v8)
  {
    id v9 = *(id *)(v0 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager____lazy_storage___facetimeServiceProxy);
  }
  else
  {
    sub_18FB2EF00(0, &qword_1E9266310);
    sub_18FB2EF00(0, (unint64_t *)&unk_1E92662D0);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E4FBCB10], v2);
    id v10 = (void *)sub_18FB55C10();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v12 = objc_msgSend(self, sel_proxyForServiceClass_targetSerialQueue_delegate_, ObjCClassFromMetadata, v10, v1);

    objc_super v13 = *(void **)(v1 + v7);
    *(void *)(v1 + v7) = v12;
    id v9 = v12;

    id v8 = 0;
  }
  id v14 = v8;
  return v9;
}

void sub_18FB49394(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v61 = a3;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265E90);
  MEMORY[0x1F4188790](v11 - 8, v12);
  id v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_18FB55430();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15, v17);
  id v19 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_18FB55AB0() >= 1)
  {
    if (qword_1E9265A60 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v15, (uint64_t)qword_1E92675D8);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v19, v20, v15);
    swift_bridgeObjectRetain_n();
    objc_super v21 = sub_18FB55410();
    os_log_type_t v22 = sub_18FB55B60();
    id v62 = v21;
    int v59 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v60 = a5;
      uint64_t v24 = v23;
      uint64_t v56 = swift_slowAlloc();
      uint64_t v64 = v56;
      uint64_t v25 = 8 * (char)v60;
      uint64_t v26 = *(void *)&aMessage_1[v25];
      *(_DWORD *)uint64_t v24 = 136315394;
      uint64_t v57 = v16;
      uint64_t v58 = a4;
      uint64_t v63 = sub_18FB4ACA4(v26, *(void *)((char *)&unk_18FB59428 + v25), &v64);
      sub_18FB55C70();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v63 = sub_18FB4ACA4(a1, a2, &v64);
      sub_18FB55C70();
      swift_bridgeObjectRelease_n();
      id v27 = v62;
      _os_log_impl(&dword_18FB18000, v62, (os_log_type_t)v59, "Received request to perform %s communication action for attribution with identifier %s", (uint8_t *)v24, 0x16u);
      uint64_t v28 = v56;
      swift_arrayDestroy();
      MEMORY[0x192FBD9D0](v28, -1, -1);
      uint64_t v29 = v24;
      LOBYTE(v24) = v60;
      MEMORY[0x192FBD9D0](v29, -1, -1);

      (*(void (**)(char *, uint64_t))(v57 + 8))(v19, v15);
      int v30 = v24;
      if ((_BYTE)v24)
      {
LABEL_6:
        if (v30 == 1)
        {
          id v31 = (uint64_t *)(v6 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_attributionIdentifier);
          uint64_t *v31 = a1;
          v31[1] = a2;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(unsigned char *)(v6 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_videoEnabled) = 0;
        }
        else
        {
          uint64_t v46 = (uint64_t *)(v6 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_attributionIdentifier);
          *uint64_t v46 = a1;
          v46[1] = a2;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(unsigned char *)(v6 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_videoEnabled) = 1;
        }
        id v47 = sub_18FB491E4();
        unsigned __int8 v48 = objc_msgSend(v47, sel_connectionActive);

        if (v48) {
          sub_18FB49F44();
        }
        else {
          sub_18FB49B20();
        }
        return;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
      int v30 = a5;
      if ((_BYTE)a5) {
        goto LABEL_6;
      }
    }
    uint64_t v64 = 0;
    unint64_t v65 = 0xE000000000000000;
    sub_18FB55CE0();
    swift_bridgeObjectRelease();
    uint64_t v64 = 0xD000000000000018;
    unint64_t v65 = 0x800000018FB5BA70;
    sub_18FB55AC0();
    sub_18FB55AC0();
    uint64_t v39 = v64;
    unint64_t v38 = v65;
    sub_18FB55250();
    uint64_t v40 = sub_18FB55260();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 48))(v14, 1, v40) != 1)
    {
      swift_bridgeObjectRelease();
      sub_18FB3A3FC((uint64_t)v14, &qword_1E9265E90);
      id v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA5680]), sel_init);
      int v50 = *(void **)(v6 + OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_presentingViewController);
      if (v50)
      {
        id v51 = v50;
        uint64_t v52 = (void *)sub_18FB55A50();
        id v53 = (void *)sub_18FB55A50();
        objc_msgSend(v49, sel_presentTranscriptForMessageGUID_attachmentGUID_presentingViewController_, v52, v53, v51);

        return;
      }
      sub_18FB55B70();
      id v54 = (id)SWFrameworkLogHandle();
      if (v54)
      {
        id v55 = v54;
        sub_18FB55400();

        return;
      }
      goto LABEL_26;
    }
    sub_18FB3A3FC((uint64_t)v14, &qword_1E9265E90);
    sub_18FB55B70();
    id v41 = (id)SWFrameworkLogHandle();
    if (v41)
    {
      uint64_t v42 = v41;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9266300);
      uint64_t v43 = swift_allocObject();
      *(_OWORD *)(v43 + 16) = xmmword_18FB592B0;
      uint64_t v44 = MEMORY[0x1E4FBB1A0];
      *(void *)(v43 + 56) = MEMORY[0x1E4FBB1A0];
      unint64_t v45 = sub_18FB3E4D8();
      *(void *)(v43 + 32) = 0x6567617373656DLL;
      *(void *)(v43 + 40) = 0xE700000000000000;
      *(void *)(v43 + 96) = v44;
      *(void *)(v43 + 104) = v45;
      *(void *)(v43 + 64) = v45;
      *(void *)(v43 + 72) = a1;
      *(void *)(v43 + 80) = a2;
      *(void *)(v43 + 136) = v44;
      *(void *)(v43 + 144) = v45;
      *(void *)(v43 + 112) = v39;
      *(void *)(v43 + 120) = v38;
      swift_bridgeObjectRetain();
      sub_18FB55400();

      swift_bridgeObjectRelease();
      return;
    }
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return;
  }
  sub_18FB55B70();
  id v32 = (id)SWFrameworkLogHandle();
  if (!v32)
  {
    __break(1u);
    goto LABEL_25;
  }
  id v33 = v32;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9266300);
  uint64_t v34 = swift_allocObject();
  uint64_t v35 = 8 * (char)a5;
  uint64_t v36 = *(void *)&aMessage_1[v35];
  *(_OWORD *)(v34 + 16) = xmmword_18FB586C0;
  uint64_t v37 = *(void *)((char *)&unk_18FB59428 + v35);
  *(void *)(v34 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v34 + 64) = sub_18FB3E4D8();
  *(void *)(v34 + 32) = v36;
  *(void *)(v34 + 40) = v37;
  sub_18FB55400();

  swift_bridgeObjectRelease();
}

uint64_t sub_18FB49B20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_18FB55A00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2, v4);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_18FB55A40();
  uint64_t v25 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v8);
  id v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9265A60 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_18FB55430();
  __swift_project_value_buffer(v11, (uint64_t)qword_1E92675D8);
  uint64_t v12 = sub_18FB55410();
  os_log_type_t v13 = sub_18FB55B60();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = v3;
    uint64_t v16 = v15;
    aBlock[0] = v15;
    uint64_t v23 = v10;
    *(_DWORD *)id v14 = 136315138;
    uint64_t v26 = sub_18FB4ACA4(0xD000000000000013, 0x800000018FB5B9F0, aBlock);
    id v10 = v23;
    sub_18FB55C70();
    _os_log_impl(&dword_18FB18000, v12, v13, "%s: Not currently connected to FaceTime service. We'll wait for the connection to finish posting pending notices.", v14, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v16;
    uint64_t v3 = v24;
    MEMORY[0x192FBD9D0](v17, -1, -1);
    MEMORY[0x192FBD9D0](v14, -1, -1);
  }

  sub_18FB2EF00(0, (unint64_t *)&unk_1E92662D0);
  uint64_t v18 = (void *)sub_18FB55BE0();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v1;
  aBlock[4] = (uint64_t)sub_18FB4B448;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_18FB3E65C;
  aBlock[3] = (uint64_t)&block_descriptor_32;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = v1;
  swift_release();
  sub_18FB55A20();
  aBlock[0] = MEMORY[0x1E4FBC860];
  sub_18FB44420();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92662E0);
  sub_18FB2EF94(&qword_1E9265EF0, &qword_1E92662E0);
  sub_18FB55CA0();
  MEMORY[0x192FBCE40](0, v10, v6, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v10, v7);
}

uint64_t sub_18FB49F44()
{
  uint64_t v0 = sub_18FB55A00();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_18FB55A40();
  uint64_t v5 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22, v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_18FB55A10();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v11);
  os_log_type_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18FB2EF00(0, (unint64_t *)&unk_1E92662D0);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v13, *MEMORY[0x1E4FBCB10], v9);
  id v14 = (void *)sub_18FB55C10();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = v21;
  *(void *)(v15 + 16) = v21;
  aBlock[4] = sub_18FB4B380;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18FB3E65C;
  aBlock[3] = &block_descriptor_4;
  uint64_t v17 = _Block_copy(aBlock);
  id v18 = v16;
  sub_18FB55A20();
  uint64_t v23 = MEMORY[0x1E4FBC860];
  sub_18FB44420();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92662E0);
  sub_18FB2EF94(&qword_1E9265EF0, &qword_1E92662E0);
  sub_18FB55CA0();
  MEMORY[0x192FBCE40](0, v8, v4, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v22);
  return swift_release();
}

void sub_18FB4A2B0(char *a1)
{
  unint64_t v1 = *(void *)&a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_attributionIdentifier + 8];
  if (v1)
  {
    uint64_t v3 = *(void *)&a1[OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_attributionIdentifier];
    swift_bridgeObjectRetain();
    id v4 = sub_18FB491E4();
    id v5 = objc_msgSend(v4, sel_remoteService);

    if (v5)
    {
      sub_18FB55C90();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v30, 0, sizeof(v30));
    }
    sub_18FB4B3A0((uint64_t)v30, (uint64_t)aBlock);
    if (v26)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E92662E8);
      if (swift_dynamicCast())
      {
        id v9 = v29;
        uint64_t v10 = &selRef_setCustomCollaborators_;
        if (objc_msgSend(v29, sel_respondsToSelector_, sel_initiateTUConversationForAttributionIdentifier_videoEnabled_completion_))
        {
          if (qword_1E9265A60 != -1) {
            swift_once();
          }
          uint64_t v11 = sub_18FB55430();
          __swift_project_value_buffer(v11, (uint64_t)qword_1E92675D8);
          swift_bridgeObjectRetain_n();
          uint64_t v12 = a1;
          os_log_type_t v13 = sub_18FB55410();
          os_log_type_t v14 = sub_18FB55B60();
          if (os_log_type_enabled(v13, v14))
          {
            uint64_t v15 = swift_slowAlloc();
            os_log_t osloga = (os_log_t)swift_slowAlloc();
            aBlock[0] = (uint64_t)osloga;
            *(_DWORD *)uint64_t v15 = 136315394;
            swift_bridgeObjectRetain();
            *(void *)&v30[0] = sub_18FB4ACA4(v3, v1, aBlock);
            sub_18FB55C70();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v15 + 12) = 1024;
            int v16 = v12[OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_videoEnabled];

            LODWORD(v30[0]) = v16;
            uint64_t v10 = &selRef_setCustomCollaborators_;
            sub_18FB55C70();

            _os_log_impl(&dword_18FB18000, v13, v14, "Sending highlight to SLD to initiate FaceTime call for attribution identifier %s with video enabled: %{BOOL}d}", (uint8_t *)v15, 0x12u);
            swift_arrayDestroy();
            MEMORY[0x192FBD9D0](osloga, -1, -1);
            MEMORY[0x192FBD9D0](v15, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          swift_bridgeObjectRetain();
          uint64_t v19 = (void *)sub_18FB55A50();
          swift_bridgeObjectRelease();
          uint64_t v20 = v12[OBJC_IVAR____TtC13SharedWithYou20CommunicationManager_videoEnabled];
          uint64_t v21 = swift_allocObject();
          *(void *)(v21 + 16) = v3;
          *(void *)(v21 + 24) = v1;
          id v27 = sub_18FB4B440;
          uint64_t v28 = v21;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_18FB48F14;
          uint64_t v26 = &block_descriptor_26;
          uint64_t v22 = _Block_copy(aBlock);
          swift_release();
          objc_msgSend(v9, v10[196], v19, v20, v22);
          _Block_release(v22);
          swift_unknownObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
        return;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_18FB3A3FC((uint64_t)aBlock, (uint64_t *)&unk_1E9266150);
    }
    sub_18FB55B70();
    id v17 = (id)SLFrameworkLogHandle();
    if (v17)
    {
      id v18 = v17;
      sub_18FB55400();
    }
    else
    {
      __break(1u);
    }
    return;
  }
  if (qword_1E9265A60 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_18FB55430();
  __swift_project_value_buffer(v6, (uint64_t)qword_1E92675D8);
  oslog = sub_18FB55410();
  os_log_type_t v7 = sub_18FB55B60();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_18FB18000, oslog, v7, "No attribution identifier found, could not start facetime", v8, 2u);
    MEMORY[0x192FBD9D0](v8, -1, -1);
  }
}

void sub_18FB4A7D4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (qword_1E9265A60 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_18FB55430();
  __swift_project_value_buffer(v5, (uint64_t)qword_1E92675D8);
  swift_bridgeObjectRetain_n();
  uint64_t v6 = sub_18FB55410();
  os_log_type_t v7 = sub_18FB55B60();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = v9;
    *(_DWORD *)uint64_t v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_18FB4ACA4(a2, a3, &v10);
    sub_18FB55C70();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_18FB18000, v6, v7, "FaceTime started for attribution with identifier: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x192FBD9D0](v9, -1, -1);
    MEMORY[0x192FBD9D0](v8, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

id sub_18FB4AA54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CommunicationManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CommunicationManager()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for CommunicationChannel(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 2;
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
        JUMPOUT(0x18FB4ABD8);
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
          *id result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CommunicationChannel()
{
  return &type metadata for CommunicationChannel;
}

uint64_t sub_18FB4AC10()
{
  return sub_18FB2EF94(&qword_1E92662B8, &qword_1E92662C0);
}

unint64_t sub_18FB4AC50()
{
  unint64_t result = qword_1E92662C8;
  if (!qword_1E92662C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92662C8);
  }
  return result;
}

uint64_t sub_18FB4ACA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_18FB4AD78(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_18FB3A5C0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_18FB3A5C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_18FB4AD78(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_18FB55C80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_18FB4AF34(a5, a6);
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
  uint64_t v8 = sub_18FB55D10();
  if (!v8)
  {
    sub_18FB55D30();
    __break(1u);
LABEL_17:
    uint64_t result = sub_18FB55D60();
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

uint64_t sub_18FB4AF34(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_18FB4AFCC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_18FB4B1AC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_18FB4B1AC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18FB4AFCC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_18FB4B144(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_18FB55CF0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_18FB55D30();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_18FB55AD0();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_18FB55D60();
    __break(1u);
LABEL_14:
    uint64_t result = sub_18FB55D30();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_18FB4B144(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E92662F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18FB4B1AC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E92662F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_18FB55D60();
  __break(1u);
  return result;
}

uint64_t sub_18FB4B2FC()
{
  unint64_t v0 = sub_18FB55D80();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

uint64_t sub_18FB4B348()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_18FB4B380()
{
  sub_18FB4A2B0(*(char **)(v0 + 16));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_18FB4B3A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9266150);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_18FB4B408()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

void sub_18FB4B440(uint64_t a1)
{
  sub_18FB4A7D4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_18FB4B448()
{
  id v0 = sub_18FB491E4();
  objc_msgSend(v0, sel_connect);
}

uint64_t sub_18FB4B4AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18FB55690();
  MEMORY[0x1F4188790](v4, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v8 - v6, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_18FB556A0();
}

uint64_t sub_18FB4B5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_18FB55690();
  MEMORY[0x1F4188790](v5, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v9 - v7, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_18FB556A0();
}

uint64_t sub_18FB4B69C(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x1F4188790](TupleTypeMetadata, a2);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      size_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *size_t v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        int v16 = &v8[8 * v9];
        id v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)int v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x1F4188790](TupleTypeMetadata, a2);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_18FB559F0();
}

uint64_t sub_18FB4B860()
{
  return sub_18FB55970();
}

uint64_t sub_18FB4B8BC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265F88);
  sub_18FB55980();
  return v1;
}

uint64_t sub_18FB4B918@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for _CollaborationDetailView();
  uint64_t v7 = (char *)a3 + *(int *)(v6 + 40);
  sub_18FB55960();
  *uint64_t v7 = v10;
  *((void *)v7 + 1) = v11;
  swift_getObjectType();
  sub_18FB4EF50();
  *a3 = sub_18FB554E0();
  a3[1] = v8;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))((char *)a3 + *(int *)(v6 + 36), a1, a2);
}

void _CollaborationDetailView.init(itemProvider:listContent:)(void *a1@<X0>, void (*a2)(void)@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  MEMORY[0x1F4188790](a1, a2);
  unint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  id v10 = a1;
  CollaborationDetailViewModel.init(itemProvider:)(v10);
  a2();
  sub_18FB4B918((uint64_t)v9, a3, a4);
}

void _CollaborationDetailView.init(itemProvider:contentTitle:collaborators:listContent:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t)@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t v24 = a5;
  uint64_t v25 = a8;
  v23[1] = a6;
  MEMORY[0x1F4188790](a1, a2);
  int v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  id v18 = a1;
  id v19 = CollaborationDetailViewModel.init(itemProvider:)(v18);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  id v20 = v19;
  sub_18FB554A0();
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v26 = a4;
  id v21 = v20;
  uint64_t v22 = sub_18FB554A0();
  v24(v22);
  sub_18FB4B918((uint64_t)v16, a7, a9);
}

uint64_t _CollaborationDetailView.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  int v23 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266318);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266320);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266328);
  sub_18FB556B0();
  swift_getTupleTypeMetadata2();
  sub_18FB559E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266330);
  sub_18FB554F0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266338);
  sub_18FB554F0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1E9266340);
  swift_getTupleTypeMetadata3();
  sub_18FB559E0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v28 = MEMORY[0x1E4FBC258];
  uint64_t v29 = WitnessTable;
  sub_18FB55810();
  swift_getWitnessTable();
  swift_getOpaqueTypeMetadata2();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeMetadata2();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeMetadata2();
  uint64_t v4 = sub_18FB554F0();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v25 = MEMORY[0x1E4F3CE38];
  uint64_t v5 = swift_getWitnessTable();
  uint64_t v26 = v4;
  uint64_t v27 = v5;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v7 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](OpaqueTypeMetadata2, v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v9, v12);
  uint64_t v15 = (char *)&v22 - v14;
  MEMORY[0x1F4188790](v13, v16);
  id v18 = (char *)&v22 - v17;
  sub_18FB4C080(a1, v11);
  uint64_t v26 = v4;
  uint64_t v27 = v5;
  swift_getOpaqueTypeConformance2();
  sub_18FB4C9F8((uint64_t)v11, OpaqueTypeMetadata2, (uint64_t)v15);
  id v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v11, OpaqueTypeMetadata2);
  id v20 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v20(v18, v15, OpaqueTypeMetadata2);
  v19(v15, OpaqueTypeMetadata2);
  v20(v23, v18, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v19)(v18, OpaqueTypeMetadata2);
}

uint64_t sub_18FB4C080@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v56 = a1;
  id v71 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266318);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266320);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266328);
  uint64_t v54 = *(void *)(a1 + 16);
  sub_18FB556B0();
  swift_getTupleTypeMetadata2();
  sub_18FB559E0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266330);
  sub_18FB554F0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266338);
  sub_18FB554F0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1E9266340);
  swift_getTupleTypeMetadata3();
  uint64_t v52 = sub_18FB559E0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v77 = MEMORY[0x1E4FBC248];
  uint64_t v78 = v52;
  uint64_t v79 = MEMORY[0x1E4FBC258];
  uint64_t v80 = WitnessTable;
  uint64_t v3 = sub_18FB55810();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)&v50 - v6;
  uint64_t v8 = swift_getWitnessTable();
  uint64_t v77 = v3;
  uint64_t v78 = v8;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v55 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x1F4188790](OpaqueTypeMetadata2, v10);
  uint64_t v12 = (char *)&v50 - v11;
  uint64_t v77 = v3;
  uint64_t v78 = v8;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v77 = OpaqueTypeMetadata2;
  uint64_t v78 = OpaqueTypeConformance2;
  uint64_t v14 = swift_getOpaqueTypeMetadata2();
  uint64_t v64 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14, v15);
  id v62 = (char *)&v50 - v16;
  uint64_t v77 = OpaqueTypeMetadata2;
  uint64_t v78 = OpaqueTypeConformance2;
  uint64_t v53 = OpaqueTypeConformance2;
  uint64_t v17 = swift_getOpaqueTypeConformance2();
  uint64_t v77 = v14;
  uint64_t v78 = v17;
  uint64_t v18 = swift_getOpaqueTypeMetadata2();
  uint64_t v69 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18, v18);
  id v66 = (char *)&v50 - v19;
  uint64_t v70 = v20;
  uint64_t v21 = sub_18FB554F0();
  uint64_t v67 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21, v22);
  unint64_t v65 = (char *)&v50 - v23;
  uint64_t v58 = v14;
  uint64_t v77 = v14;
  uint64_t v78 = v17;
  uint64_t v59 = v17;
  uint64_t v75 = swift_getOpaqueTypeConformance2();
  uint64_t v76 = MEMORY[0x1E4F3CE38];
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v68 = v21;
  uint64_t v77 = v21;
  uint64_t v78 = v24;
  uint64_t v63 = v24;
  uint64_t v25 = swift_getOpaqueTypeMetadata2();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v28 = MEMORY[0x1F4188790](v25, v27);
  uint64_t v60 = (char *)&v50 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v28, v30);
  uint64_t v61 = (char *)&v50 - v31;
  uint64_t v32 = *(void *)(v56 + 24);
  uint64_t v72 = v54;
  uint64_t v73 = v32;
  uint64_t v74 = v57;
  sub_18FB55800();
  sub_18FB558C0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  LOBYTE(v3) = sub_18FB557A0();
  sub_18FB557C0();
  sub_18FB557C0();
  if (sub_18FB557C0() != v3) {
    sub_18FB557C0();
  }
  id v33 = self;
  id v34 = objc_msgSend(v33, sel_currentDevice);
  objc_msgSend(v34, sel_userInterfaceIdiom);

  uint64_t v35 = v62;
  sub_18FB55880();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v12, OpaqueTypeMetadata2);
  unsigned __int8 v36 = sub_18FB55780();
  unsigned __int8 v37 = sub_18FB557B0();
  sub_18FB557C0();
  sub_18FB557C0();
  if (sub_18FB557C0() != v36) {
    sub_18FB557C0();
  }
  sub_18FB557C0();
  if (sub_18FB557C0() != v37) {
    sub_18FB557C0();
  }
  id v38 = objc_msgSend(v33, sel_currentDevice);
  objc_msgSend(v38, sel_userInterfaceIdiom);

  uint64_t v39 = v66;
  uint64_t v40 = v58;
  sub_18FB55880();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v35, v40);
  id v41 = objc_msgSend(v33, sel_currentDevice);
  objc_msgSend(v41, sel_userInterfaceIdiom);

  sub_18FB559D0();
  uint64_t v42 = v70;
  uint64_t v43 = v65;
  sub_18FB558D0();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v39, v42);
  uint64_t v44 = v60;
  uint64_t v45 = v68;
  sub_18FB558A0();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v43, v45);
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  id v47 = v61;
  v46(v61, v44, v25);
  unsigned __int8 v48 = *(void (**)(char *, uint64_t))(v26 + 8);
  v48(v44, v25);
  v46(v71, v47, v25);
  return ((uint64_t (*)(char *, uint64_t))v48)(v47, v25);
}

uint64_t sub_18FB4C9F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1, a1);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(char *))(v5 + 16);
  v8(v7);
  ((void (*)(uint64_t, char *, uint64_t))v8)(a3, v7, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t sub_18FB4CAE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v109 = a2;
  uint64_t v116 = a1;
  uint64_t v108 = a3;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92663C8);
  MEMORY[0x1F4188790](v95, v3);
  id v97 = (char *)&v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92663D0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v104 = (uint64_t)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92663D8);
  uint64_t v105 = *(void *)(v112 - 8);
  MEMORY[0x1F4188790](v112, v8);
  id v96 = (char *)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(qword_1E9266340);
  uint64_t v11 = MEMORY[0x1F4188790](v106, v10);
  uint64_t v107 = (uint64_t)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v13);
  uint64_t v113 = (uint64_t)&v90 - v14;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266320);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266328);
  sub_18FB556B0();
  swift_getTupleTypeMetadata2();
  uint64_t v101 = sub_18FB559E0();
  uint64_t v103 = *(void *)(v101 - 8);
  MEMORY[0x1F4188790](v101, v15);
  uint64_t v100 = (uint64_t)&v90 - v16;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266330);
  id v102 = (void (*)(char *, char *, uint64_t))sub_18FB554F0();
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266338);
  uint64_t v121 = sub_18FB554F0();
  uint64_t v123 = *(void *)(v121 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v121, v17);
  id v120 = (char *)&v90 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18, v20);
  v119 = (char *)&v90 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92663E0);
  MEMORY[0x1F4188790](v22 - 8, v23);
  id v110 = (char *)&v90 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92663E8);
  uint64_t v26 = v25 - 8;
  MEMORY[0x1F4188790](v25, v27);
  uint64_t v29 = (char *)&v90 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_18FB55570();
  uint64_t v31 = *(void *)(v30 - 8);
  MEMORY[0x1F4188790](v30, v32);
  id v34 = (char *)&v90 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v115 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E92663F0);
  unint64_t v114 = (void (**)(char *, char *, char *))*((void *)v115 - 1);
  MEMORY[0x1F4188790](v115, v35);
  unsigned __int8 v37 = (char *)&v90 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266318);
  uint64_t v39 = MEMORY[0x1F4188790](v117, v38);
  id v41 = (char *)&v90 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v39, v42);
  uint64_t v118 = (uint64_t)&v90 - v43;
  uint64_t v109 = type metadata accessor for _CollaborationDetailView();
  id v99 = v37;
  sub_18FB4D7F8();
  sub_18FB55560();
  uint64_t v44 = *(int *)(v26 + 44);
  id v98 = v29;
  uint64_t v45 = &v29[v44];
  uint64_t v122 = v31;
  uint64_t v46 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v46(&v29[v44], v34, v30);
  id v47 = *(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56);
  v47(v45, 0, 1, v30);
  v114[2](v29, v37, v115);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v49 = (uint64_t)v110;
  uint64_t v94 = v31 + 16;
  id v93 = (void (*)(char *, uint64_t, char *))v46;
  v46(v110, v34, v30);
  uint64_t v92 = v31 + 56;
  double v91 = (void (*)(uint64_t, void, uint64_t, char *))v47;
  v47((char *)v49, 0, 1, v30);
  uint64_t v50 = (uint64_t *)&v41[*(int *)(v117 + 36)];
  sub_18FB3A1E4(v49, (uint64_t)v50 + *(int *)(v111 + 28), &qword_1E92663E0);
  uint64_t *v50 = KeyPath;
  uint64_t v51 = (uint64_t)v98;
  sub_18FB3A1E4((uint64_t)v98, (uint64_t)v41, &qword_1E92663E8);
  sub_18FB3A3FC(v49, &qword_1E92663E0);
  sub_18FB3A3FC(v51, &qword_1E92663E8);
  uint64_t v52 = v122 + 8;
  uint64_t v53 = *(void (**)(char *, uint64_t))(v122 + 8);
  v53(v34, v30);
  uint64_t v54 = v52;
  uint64_t v55 = v116;
  ((void (*)(char *, char *))v114[1])(v99, v115);
  unint64_t v115 = v41;
  sub_18FB3DEE0((uint64_t)v41, v118, &qword_1E9266318);
  uint64_t v56 = v100;
  sub_18FB4D868(v109, v100);
  sub_18FB55560();
  uint64_t v57 = v101;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v59 = v120;
  sub_18FB558B0();
  id v98 = v34;
  id v99 = (char *)v30;
  uint64_t v122 = v54;
  double v90 = (void (*)(uint64_t, char *))v53;
  v53(v34, v30);
  (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v56, v57);
  uint64_t v60 = sub_18FB2EF94(&qword_1E92663F8, &qword_1E9266330);
  v128[5] = WitnessTable;
  v128[6] = v60;
  uint64_t v61 = swift_getWitnessTable();
  uint64_t v62 = sub_18FB2EF94(&qword_1E9266400, &qword_1E9266338);
  v128[3] = v61;
  v128[4] = v62;
  uint64_t v63 = v121;
  uint64_t v103 = swift_getWitnessTable();
  uint64_t v64 = v123;
  id v102 = *(void (**)(char *, char *, uint64_t))(v123 + 16);
  v102(v119, v59, v63);
  unint64_t v65 = *(void (***)(char *, char *, char *))(v64 + 8);
  uint64_t v123 = v64 + 8;
  unint64_t v114 = v65;
  ((void (*)(char *, uint64_t))v65)(v59, v63);
  id v66 = *(void **)(v55 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v67 = v66;
  sub_18FB55490();

  swift_release();
  swift_release();
  uint64_t v68 = 1;
  if (LOBYTE(v128[0]) == 1)
  {
    uint64_t v69 = v104;
    sub_18FB4DDFC(v109, v104);
    uint64_t v70 = (uint64_t)v98;
    sub_18FB55560();
    uint64_t v71 = (uint64_t)v97;
    uint64_t v72 = &v97[*(int *)(v95 + 36)];
    uint64_t v73 = v99;
    uint64_t v74 = v93;
    v93(v72, v70, v99);
    uint64_t v75 = v72;
    uint64_t v76 = v91;
    v91((uint64_t)v75, 0, 1, v73);
    sub_18FB3A1E4(v69, v71, &qword_1E92663D0);
    uint64_t v77 = swift_getKeyPath();
    uint64_t v78 = (uint64_t)v110;
    v74(v110, v70, v73);
    v76(v78, 0, 1, v73);
    uint64_t v79 = (uint64_t)v96;
    uint64_t v80 = (uint64_t *)&v96[*(int *)(v112 + 36)];
    sub_18FB3A1E4(v78, (uint64_t)v80 + *(int *)(v111 + 28), &qword_1E92663E0);
    *uint64_t v80 = v77;
    sub_18FB3A1E4(v71, v79, &qword_1E92663C8);
    sub_18FB3A3FC(v78, &qword_1E92663E0);
    sub_18FB3A3FC(v71, &qword_1E92663C8);
    v90(v70, v73);
    sub_18FB3A3FC(v104, &qword_1E92663D0);
    sub_18FB3DEE0(v79, v113, &qword_1E92663D8);
    uint64_t v68 = 0;
  }
  uint64_t v81 = v113;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v105 + 56))(v113, v68, 1, v112);
  uint64_t v82 = v118;
  uint64_t v83 = (uint64_t)v115;
  sub_18FB3A1E4(v118, (uint64_t)v115, &qword_1E9266318);
  v128[0] = v83;
  id v85 = v119;
  double v84 = v120;
  uint64_t v86 = v121;
  v102(v120, v119, v121);
  v128[1] = v84;
  uint64_t v87 = v107;
  sub_18FB3A1E4(v81, v107, qword_1E9266340);
  v128[2] = v87;
  v127[0] = v117;
  v127[1] = v86;
  v127[2] = v106;
  unint64_t v124 = sub_18FB4FC60();
  uint64_t v125 = v103;
  uint64_t v126 = sub_18FB50118(&qword_1E9266468, qword_1E9266340, (void (*)(void))sub_18FB4FFB4);
  sub_18FB4B69C((uint64_t)v128, 3uLL, (uint64_t)v127);
  sub_18FB3A3FC(v81, qword_1E9266340);
  id v88 = v114;
  ((void (*)(char *, uint64_t))v114)(v85, v86);
  sub_18FB3A3FC(v82, &qword_1E9266318);
  sub_18FB3A3FC(v87, qword_1E9266340);
  ((void (*)(char *, uint64_t))v88)(v84, v86);
  return sub_18FB3A3FC(v83, &qword_1E9266318);
}

uint64_t sub_18FB4D7F8()
{
  return sub_18FB559C0();
}

uint64_t sub_18FB4D868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266328);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v45 = v4;
  uint64_t v49 = sub_18FB556B0();
  uint64_t v48 = *(void *)(v49 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v49, v6);
  id v47 = &v43[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x1F4188790](v7, v9);
  uint64_t v46 = &v43[-v11];
  uint64_t v12 = *(void *)(v5 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v10, v13);
  uint64_t v16 = &v43[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = MEMORY[0x1F4188790](v14, v17);
  uint64_t v20 = &v43[-v19];
  uint64_t v22 = MEMORY[0x1F4188790](v18, v21);
  uint64_t v24 = &v43[-v23];
  MEMORY[0x1F4188790](v22, v25);
  uint64_t v26 = v2 + *(int *)(a1 + 36);
  uint64_t v27 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16);
  v27(&v43[-v28], v26, v5);
  int v44 = swift_dynamicCast();
  v27(v24, v26, v5);
  if (swift_dynamicCast())
  {
    uint64_t v29 = v51;
    uint64_t v30 = sub_18FB559A0();
    uint64_t v31 = v29;
    objc_msgSend(v31, sel_frame);
    double v33 = v32;
    objc_msgSend(v31, sel_frame);
    objc_msgSend(v31, sel_systemLayoutSizeFittingSize_, v33, v34);
    sub_18FB559D0();
    sub_18FB554D0();
    uint64_t v51 = v31;
    uint64_t v52 = v30;
    long long v53 = 0u;
    long long v54 = 0u;
    char v55 = 0;
    uint64_t v56 = v67;
    char v57 = v68;
    uint64_t v58 = v69;
    char v59 = v70;
    long long v60 = v71;
    sub_18FB50AE8(&qword_1E9266518, &qword_1E9266328, (void (*)(void))sub_18FB50B64);
    uint64_t v35 = *(void *)(a1 + 24);
    swift_retain();
    uint64_t v36 = v46;
    sub_18FB4B4AC((uint64_t)&v51, v45);
    swift_release_n();
  }
  else
  {
    uint64_t v35 = *(void *)(a1 + 24);
    v27(v20, v26, v5);
    v27(v16, (uint64_t)v20, v5);
    sub_18FB50AE8(&qword_1E9266518, &qword_1E9266328, (void (*)(void))sub_18FB50B64);
    uint64_t v36 = v46;
    sub_18FB4B5A4((uint64_t)v16, v45, v5);
    unsigned __int8 v37 = *(void (**)(unsigned char *, uint64_t))(v12 + 8);
    v37(v16, v5);
    v37(v20, v5);
  }
  char v66 = v44;
  uint64_t v51 = &v66;
  uint64_t v38 = v48;
  uint64_t v39 = v47;
  uint64_t v40 = v49;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v48 + 16))(v47, v36, v49);
  uint64_t v52 = (uint64_t)v39;
  v65[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266320);
  v65[1] = v40;
  unint64_t v63 = sub_18FB50CF8();
  uint64_t v61 = sub_18FB50AE8(&qword_1E9266518, &qword_1E9266328, (void (*)(void))sub_18FB50B64);
  uint64_t v62 = v35;
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_18FB4B69C((uint64_t)&v51, 2uLL, (uint64_t)v65);
  id v41 = *(void (**)(unsigned char *, uint64_t))(v38 + 8);
  v41(v36, v40);
  return ((uint64_t (*)(unsigned char *, uint64_t))v41)(v39, v40);
}

uint64_t sub_18FB4DDFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CollaborationInfo(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v11);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void **)(v2 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v15 = v14;
  sub_18FB55490();

  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_18FB3A3FC((uint64_t)v8, &qword_1E9265D68);
  }
  else
  {
    sub_18FB3A118((uint64_t)v8, (uint64_t)v13);
    swift_getKeyPath();
    swift_getKeyPath();
    id v16 = v15;
    sub_18FB55490();

    swift_release();
    uint64_t v17 = swift_release();
    if (LOBYTE(v26[0]) == 1)
    {
      MEMORY[0x1F4188790](v17, v18);
      *(_OWORD *)&v26[-4] = *(_OWORD *)(a1 + 16);
      v26[-2] = v2;
      v26[-1] = v13;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E92664F8);
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266498);
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92664A0);
      uint64_t v21 = sub_18FB2EF94(&qword_1E92664A8, &qword_1E9266498);
      uint64_t v22 = sub_18FB50AE8(&qword_1E92664B0, &qword_1E92664A0, (void (*)(void))sub_18FB502C0);
      v26[0] = v19;
      v26[1] = v20;
      id v26[2] = v21;
      v26[3] = v22;
      swift_getOpaqueTypeConformance2();
      sub_18FB559C0();
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266490);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(a2, 0, 1, v23);
      return sub_18FB39D50((uint64_t)v13);
    }
    sub_18FB39D50((uint64_t)v13);
  }
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266490);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(a2, 1, 1, v25);
}

double sub_18FB4E1A0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *(id *)(a1 + 8);
  sub_18FB55960();
  type metadata accessor for CollaborationDetailViewModel(0);
  sub_18FB4EF50();
  uint64_t v4 = sub_18FB554E0();
  uint64_t v6 = v5;
  uint64_t v7 = sub_18FB559A0();
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  *(unsigned char *)(a2 + 16) = v9;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v7;
  double result = 0.0;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(unsigned char *)(a2 + 72) = 0;
  return result;
}

uint64_t sub_18FB4E25C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v46 = a5;
  uint64_t v8 = type metadata accessor for CollaborationInfo(0);
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v41 = *(void *)(v42 + 64);
  MEMORY[0x1F4188790](v8 - 8, v9);
  uint64_t v40 = (uint64_t)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for _CollaborationDetailView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x1F4188790](v11, v14);
  id v16 = (char *)&v31 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266498);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v44 = v17;
  uint64_t v45 = v18;
  MEMORY[0x1F4188790](v17, v19);
  uint64_t v39 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v36(v16, a1, v11);
  uint64_t v21 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v22 = (v21 + 32) & ~v21;
  uint64_t v38 = v22;
  uint64_t v34 = v22 + v13;
  uint64_t v35 = v21 | 7;
  uint64_t v23 = swift_allocObject();
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  *(void *)(v23 + 16) = a3;
  *(void *)(v23 + 24) = a4;
  unsigned __int8 v37 = *(void (**)(uint64_t, char *, uint64_t))(v12 + 32);
  v37(v23 + v22, v16, v11);
  uint64_t v47 = a3;
  uint64_t v48 = a4;
  uint64_t v49 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266500);
  sub_18FB2EF94(&qword_1E9266508, &qword_1E9266500);
  sub_18FB55990();
  sub_18FB4B8BC();
  v36(v16, a1, v11);
  uint64_t v24 = v40;
  sub_18FB3A034(v43, v40);
  unint64_t v25 = (v34 + *(unsigned __int8 *)(v42 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = v33;
  *(void *)(v26 + 16) = v32;
  *(void *)(v26 + 24) = v27;
  v37(v26 + v38, v16, v11);
  sub_18FB3A118(v24, v26 + v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92664A0);
  sub_18FB2EF94(&qword_1E92664A8, &qword_1E9266498);
  sub_18FB50AE8(&qword_1E92664B0, &qword_1E92664A0, (void (*)(void))sub_18FB502C0);
  uint64_t v28 = v44;
  uint64_t v29 = v39;
  sub_18FB558F0();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v29, v28);
}

__n128 sub_18FB4E6B8@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_18FB55550();
  sub_18FB4E754(a1, (uint64_t)&v12);
  char v5 = v13;
  uint64_t v6 = v14;
  uint64_t v7 = v15;
  char v8 = v16;
  uint64_t v9 = v18;
  __n128 result = v17;
  long long v11 = v12;
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(_OWORD *)(a2 + 24) = v11;
  *(unsigned char *)(a2 + 40) = v5;
  *(void *)(a2 + 48) = v6;
  *(void *)(a2 + 56) = v7;
  *(unsigned char *)(a2 + 64) = v8;
  *(__n128 *)(a2 + 72) = result;
  *(void *)(a2 + 88) = v9;
  return result;
}

uint64_t sub_18FB4E754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v3;
  sub_18FB55490();

  swift_release();
  swift_release();
  sub_18FB50A3C();
  uint64_t v5 = sub_18FB55850();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  sub_18FB55910();
  uint64_t v10 = sub_18FB55820();
  uint64_t v12 = v11;
  char v14 = v13;
  uint64_t v16 = v15;
  swift_release();
  sub_18FB3DD9C(v5, v7, v9);
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_18FB55930();
  id v18 = objc_msgSend(self, sel_currentDevice);
  id v19 = objc_msgSend(v18, sel_userInterfaceIdiom);

  if (v19 == (id)6) {
    uint64_t v20 = sub_18FB55910();
  }
  else {
    uint64_t v20 = sub_18FB55900();
  }
  uint64_t v21 = v20;
  char v22 = v14 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v12;
  *(unsigned char *)(a2 + 16) = v22;
  *(void *)(a2 + 24) = v16;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v17;
  *(void *)(a2 + 56) = KeyPath;
  *(void *)(a2 + 64) = v21;
  sub_18FB3DD8C(v10, v12, v22);
  swift_bridgeObjectRetain();
  sub_18FB3DD9C(v10, v12, v22);
  return swift_bridgeObjectRelease();
}

uint64_t sub_18FB4E934@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for _CollaborationDetailView();
  sub_18FB4E9BC(a1);
  LOBYTE(a1) = sub_18FB55790();
  sub_18FB3A1E4((uint64_t)v5, a2, &qword_1E92664C0);
  *(unsigned char *)(a2 + 27) = a1;
  return sub_18FB3A3FC((uint64_t)v5, &qword_1E92664C0);
}

uint64_t sub_18FB4E9BC(uint64_t a1)
{
  uint64_t v3 = sub_18FB55260();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v3, v5);
  char v8 = v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  MEMORY[0x1F4188790](v6, v9);
  uint64_t v11 = v27 - v10 + 16;
  uint64_t v12 = type metadata accessor for CollaborationInfo(0);
  MEMORY[0x1F4188790](v12, v13);
  uint64_t v15 = v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  sub_18FB3A034(a1, (uint64_t)v15);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {

      char v35 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E92664D0);
      sub_18FB5033C();
      return sub_18FB556A0();
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 32))(v11, v15, v3);
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v4 + 16))(v8, v11, v3);
      id v23 = sub_18FB3E1D0((uint64_t)v8);
      if (v23)
      {
        id v28 = v23;
        char v29 = 0;
      }
      else
      {
        id v28 = 0;
        char v29 = 1;
      }
      sub_18FB3E128();
      sub_18FB556A0();
      id v24 = v30;
      char v25 = (char)v31;
      char v34 = 1;
      sub_18FB50910(v30, (char)v31);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E92664E0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E92664F0);
      sub_18FB503B8();
      sub_18FB50434();
      sub_18FB556A0();
      sub_18FB3A1E4((uint64_t)&v28, (uint64_t)&v30, &qword_1E92664D0);
      char v35 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E92664D0);
      sub_18FB5033C();
      sub_18FB556A0();
      sub_18FB5091C(v24, v25);
      sub_18FB3A3FC((uint64_t)&v28, &qword_1E92664D0);
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v11, v3);
    }
  }
  else
  {
    id v19 = *(id *)v15;
    id v18 = (void *)*((void *)v15 + 1);
    if (v15[16] == 1)
    {
      uint64_t v20 = *(void *)(v1 + 8) + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
      swift_beginAccess();
      MEMORY[0x192FBDAA0](v20);
      swift_unknownObjectWeakInit();
      id v21 = v19;
      id v22 = v18;
      swift_unknownObjectRelease();
      id v31 = v21;
      id v32 = v22;
      sub_18FB50928((uint64_t)&v30, (uint64_t)&v28);
      sub_18FB50984((uint64_t)&v28, (uint64_t)&v30);
      char v33 = 0;
      sub_18FB48B0C();
      sub_18FB556A0();
      sub_18FB509E0((uint64_t)&v28);
    }
    else
    {
      char v33 = 1;
      sub_18FB48B0C();
      sub_18FB556A0();
    }
    sub_18FB3A1E4((uint64_t)v27, (uint64_t)&v30, &qword_1E92664E0);
    char v34 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E92664E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E92664F0);
    sub_18FB503B8();
    sub_18FB50434();
    sub_18FB556A0();
    sub_18FB3A1E4((uint64_t)&v28, (uint64_t)&v30, &qword_1E92664D0);
    char v35 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E92664D0);
    sub_18FB5033C();
    sub_18FB556A0();

    sub_18FB3A3FC((uint64_t)&v28, &qword_1E92664D0);
    return sub_18FB3A3FC((uint64_t)v27, &qword_1E92664E0);
  }
}

void _CollaborationDetailView<>.init(itemProvider:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  id v5 = a1;
  CollaborationDetailViewModel.init(itemProvider:)(v5);
  sub_18FB55960();
  sub_18FB4EF50();
  uint64_t v6 = sub_18FB554E0();
  uint64_t v8 = v7;

  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v8;
  *(unsigned char *)(a2 + 16) = v9;
  *(void *)(a2 + 24) = v10;
}

unint64_t sub_18FB4EF50()
{
  unint64_t result = qword_1E9265FF8;
  if (!qword_1E9265FF8)
  {
    type metadata accessor for CollaborationDetailViewModel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9265FF8);
  }
  return result;
}

uint64_t sub_18FB4EFA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18FB4EFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 32);
}

uint64_t sub_18FB4EFF4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_18FB4F098(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
  }
  else
  {
    uint64_t v11 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = (uint64_t)v11;
    uint64_t v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    id v15 = v11;
    v14(v12, v13, v4);
    unint64_t v16 = (v7 + v12) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v17 = (v7 + v13) & 0xFFFFFFFFFFFFFFF8;
    *(unsigned char *)unint64_t v16 = *(unsigned char *)v17;
    *(void *)(v16 + 8) = *(void *)(v17 + 8);
  }
  swift_retain();
  return v3;
}

uint64_t sub_18FB4F1D4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));

  return swift_release();
}

void *sub_18FB4F26C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  uint64_t v8 = v6 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  id v12 = v4;
  v7(v10, v11, v5);
  uint64_t v13 = *(void *)(v8 + 48) + 7;
  unint64_t v14 = (v13 + v10) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = (v13 + v11) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_retain();
  return a1;
}

void *sub_18FB4F328(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = (void *)a2[1];
  uint64_t v7 = (void *)a1[1];
  a1[1] = v6;
  id v8 = v6;

  uint64_t v9 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v10 = v9 + 24;
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = ((unint64_t)a1 + v11 + 16) & ~v11;
  uint64_t v13 = ((unint64_t)a2 + v11 + 16) & ~v11;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v12, v13);
  uint64_t v14 = *(void *)(v10 + 40) + 7;
  unint64_t v15 = (v14 + v12) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (v14 + v13) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v15 = *(unsigned char *)v16;
  *(void *)(v15 + 8) = *(void *)(v16 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_18FB4F3FC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + v7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + v8) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_18FB4F49C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v6;

  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 40;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = ((unint64_t)a1 + v10 + 16) & ~v10;
  uint64_t v12 = ((unint64_t)a2 + v10 + 16) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v9 + 24) + 7;
  unint64_t v14 = (v13 + v11) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v15 = (v13 + v12) & 0xFFFFFFFFFFFFFFF8;
  *(unsigned char *)unint64_t v14 = *(unsigned char *)v15;
  *(void *)(v14 + 8) = *(void *)(v15 + 8);
  swift_release();
  return a1;
}

uint64_t sub_18FB4F55C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + ((v6 + 16) & ~v6) + 7) & 0xFFFFFFFFFFFFFFF8)
       + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *(unsigned __int8 *)(a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)(a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x18FB4F6B4);
      case 4:
        int v14 = *(_DWORD *)(a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *(_DWORD *)a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if ((v5 & 0x80000000) != 0) {
    return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v6 + 16) & ~v6);
  }
  unint64_t v17 = *(void *)(a1 + 8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_18FB4F6C8(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((*(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v8 >= a3)
  {
    int v14 = 0;
    int v15 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v14)
      {
        case 1:
          a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v10] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_42;
        case 4:
          *(_DWORD *)&a1[v10] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if ((v7 & 0x80000000) != 0)
            {
              unint64_t v18 = (unint64_t)&a1[v9 + 16] & ~v9;
              id v19 = *(void (**)(unint64_t))(v6 + 56);
              v19(v18);
            }
            else if ((a2 & 0x80000000) != 0)
            {
              *(void *)a1 = a2 ^ 0x80000000;
              *((void *)a1 + 1) = 0;
            }
            else
            {
              *((void *)a1 + 1) = a2 - 1;
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v11 = a3 - v8;
    if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v12 = v11 + 1;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v12 >= 0x10000) {
      int v13 = 4;
    }
    else {
      int v13 = 2;
    }
    if (v12 < 0x100) {
      int v13 = 1;
    }
    if (v12 >= 2) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    int v15 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v16 = v15;
  }
  else {
    int v16 = 1;
  }
  if (((*(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64) + ((v9 + 16) & ~v9) + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v17 = ~v8 + a2;
    bzero(a1, v10);
    *(_DWORD *)a1 = v17;
  }
  switch(v14)
  {
    case 1:
      a1[v10] = v16;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v16;
      break;
    case 3:
LABEL_42:
      __break(1u);
      JUMPOUT(0x18FB4F8BCLL);
    case 4:
      *(_DWORD *)&a1[v10] = v16;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for _CollaborationDetailView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_18FB4F8FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18FB4FB90@<X0>(uint64_t a1@<X8>)
{
  return sub_18FB4CAE8(*(void *)(v1 + 32), *(void *)(v1 + 24), a1);
}

uint64_t sub_18FB4FB9C()
{
  return MEMORY[0x192FBC780]();
}

uint64_t sub_18FB4FBC0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92663E0);
  MEMORY[0x1F4188790](v2 - 8, v3);
  unsigned int v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18FB3A1E4(a1, (uint64_t)v5, &qword_1E92663E0);
  return MEMORY[0x192FBC790](v5);
}

unint64_t sub_18FB4FC60()
{
  unint64_t result = qword_1E9266408;
  if (!qword_1E9266408)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266318);
    sub_18FB4FD00();
    sub_18FB2EF94(&qword_1E9266400, &qword_1E9266338);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266408);
  }
  return result;
}

unint64_t sub_18FB4FD00()
{
  unint64_t result = qword_1E9266410;
  if (!qword_1E9266410)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92663E8);
    sub_18FB4FDA0();
    sub_18FB2EF94(&qword_1E92663F8, &qword_1E9266330);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266410);
  }
  return result;
}

unint64_t sub_18FB4FDA0()
{
  unint64_t result = qword_1E9266418;
  if (!qword_1E9266418)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92663F0);
    sub_18FB4FE20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266418);
  }
  return result;
}

unint64_t sub_18FB4FE20()
{
  unint64_t result = qword_1E9266420;
  if (!qword_1E9266420)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266428);
    sub_18FB4FEC0();
    sub_18FB2EF94(&qword_1E9266458, &qword_1E9266460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266420);
  }
  return result;
}

unint64_t sub_18FB4FEC0()
{
  unint64_t result = qword_1E9266430;
  if (!qword_1E9266430)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266438);
    sub_18FB4FF60();
    sub_18FB2EF94(&qword_1E9266448, &qword_1E9266450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266430);
  }
  return result;
}

unint64_t sub_18FB4FF60()
{
  unint64_t result = qword_1E9266440;
  if (!qword_1E9266440)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266440);
  }
  return result;
}

unint64_t sub_18FB4FFB4()
{
  unint64_t result = qword_1E9266470;
  if (!qword_1E9266470)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92663D8);
    sub_18FB50054();
    sub_18FB2EF94(&qword_1E9266400, &qword_1E9266338);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266470);
  }
  return result;
}

unint64_t sub_18FB50054()
{
  unint64_t result = qword_1E9266478;
  if (!qword_1E9266478)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92663C8);
    sub_18FB50118(&qword_1E9266480, &qword_1E92663D0, (void (*)(void))sub_18FB50190);
    sub_18FB2EF94(&qword_1E92663F8, &qword_1E9266330);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266478);
  }
  return result;
}

uint64_t sub_18FB50118(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_18FB50190()
{
  unint64_t result = qword_1E9266488;
  if (!qword_1E9266488)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266490);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266498);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92664A0);
    sub_18FB2EF94(&qword_1E92664A8, &qword_1E9266498);
    sub_18FB50AE8(&qword_1E92664B0, &qword_1E92664A0, (void (*)(void))sub_18FB502C0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266488);
  }
  return result;
}

unint64_t sub_18FB502C0()
{
  unint64_t result = qword_1E92664B8;
  if (!qword_1E92664B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92664C0);
    sub_18FB5033C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92664B8);
  }
  return result;
}

unint64_t sub_18FB5033C()
{
  unint64_t result = qword_1E92664C8;
  if (!qword_1E92664C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92664D0);
    sub_18FB503B8();
    sub_18FB50434();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92664C8);
  }
  return result;
}

unint64_t sub_18FB503B8()
{
  unint64_t result = qword_1E92664D8;
  if (!qword_1E92664D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92664E0);
    sub_18FB48B0C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92664D8);
  }
  return result;
}

unint64_t sub_18FB50434()
{
  unint64_t result = qword_1E92664E8;
  if (!qword_1E92664E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92664F0);
    sub_18FB3E128();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92664E8);
  }
  return result;
}

uint64_t sub_18FB504B8@<X0>(uint64_t a1@<X8>)
{
  return sub_18FB4E25C(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_18FB504C4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for _CollaborationDetailView() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(*(void *)v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = v0 + v4;

  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v7 + v2[11], v1);
  swift_release();

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_18FB505C4()
{
  return sub_18FB4B860();
}

double sub_18FB50630@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_18FB4E6B8(*(void *)(v1 + 32), a1).n128_u64[0];
  return result;
}

uint64_t sub_18FB5063C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for _CollaborationDetailView() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for CollaborationInfo(0) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = v0 + v4;

  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v10 + v2[11], v1);
  swift_release();
  uint64_t v11 = v0 + v8;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v14 = sub_18FB55260();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v0 + v8, v14);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      id v13 = *(id *)v11;
    }
    else
    {
      if (EnumCaseMultiPayload) {
        goto LABEL_8;
      }

      id v13 = *(id *)(v11 + 8);
    }
  }
LABEL_8:

  return MEMORY[0x1F4186498](v0, v8 + v9, v3 | v7 | 7);
}

uint64_t sub_18FB50820@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for _CollaborationDetailView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for CollaborationInfo(0) - 8);
  uint64_t v7 = v1 + ((v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_18FB4E934(v7, a1);
}

id sub_18FB50910(id result, char a2)
{
  if ((a2 & 1) == 0) {
    return result;
  }
  return result;
}

void sub_18FB5091C(id a1, char a2)
{
  if ((a2 & 1) == 0) {
}
  }

uint64_t sub_18FB50928(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_18FB50984(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_18FB509E0(uint64_t a1)
{
  return a1;
}

unint64_t sub_18FB50A3C()
{
  unint64_t result = qword_1E9266510;
  if (!qword_1E9266510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266510);
  }
  return result;
}

uint64_t sub_18FB50A90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_18FB55510();
  *a1 = result;
  return result;
}

uint64_t sub_18FB50ABC()
{
  return sub_18FB55520();
}

uint64_t sub_18FB50AE8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_18FB50B64()
{
  unint64_t result = qword_1E9266520;
  if (!qword_1E9266520)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266528);
    sub_18FB50C04();
    sub_18FB2EF94(&qword_1E9266458, &qword_1E9266460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266520);
  }
  return result;
}

unint64_t sub_18FB50C04()
{
  unint64_t result = qword_1E9266530;
  if (!qword_1E9266530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266538);
    sub_18FB50CA4();
    sub_18FB2EF94(&qword_1E9266448, &qword_1E9266450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266530);
  }
  return result;
}

unint64_t sub_18FB50CA4()
{
  unint64_t result = qword_1E9266540;
  if (!qword_1E9266540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266540);
  }
  return result;
}

unint64_t sub_18FB50CF8()
{
  unint64_t result = qword_1E9266548;
  if (!qword_1E9266548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9266320);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266548);
  }
  return result;
}

double sub_18FB50D64@<D0>(uint64_t a1@<X8>)
{
  return sub_18FB4E1A0(*(void *)(v1 + 32), a1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_18FB50DA0()
{
  uint64_t v0 = sub_18FB55430();
  __swift_allocate_value_buffer(v0, qword_1E92675D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E92675D8);
  return sub_18FB55420();
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

uint64_t sub_18FB50E7C()
{
  uint64_t v0 = sub_18FB55430();
  __swift_allocate_value_buffer(v0, qword_1E92675F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1E92675F0);
  return sub_18FB55420();
}

uint64_t sub_18FB50F00@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18FB50F80(void **a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return sub_18FB554A0();
}

void __swiftcall _SWCollaborationDetailViewController.init(itemProvider:)(_SWCollaborationDetailViewController *__return_ptr retstr, NSItemProvider itemProvider)
{
}

uint64_t _SWCollaborationDetailViewController.setListContent<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for _CollaborationDetailView();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  unsigned int v12 = (uint64_t *)((char *)&v15 - v11);
  id v13 = objc_msgSend(v2, sel_viewModel);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, a2);
  sub_18FB4B918((uint64_t)v7, a2, v12);
  sub_18FB523DC((uint64_t)v12);
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v9 + 8))(v12, v8);
}

uint64_t _SWCollaborationDetailViewController.setListContent<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  uint64_t v5 = (void (*)(void))MEMORY[0x1F4188790](a1, a2);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5();
  _SWCollaborationDetailViewController.setListContent<A>(_:)((uint64_t)v7, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, a3);
}

uint64_t _SWCollaborationDetailViewController.customContentTitle.getter()
{
  id v1 = objc_msgSend(v0, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();

  swift_release();
  swift_release();
  return v3;
}

uint64_t _SWCollaborationDetailViewController.customContentTitle.setter()
{
  id v1 = objc_msgSend(v0, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_18FB554A0();
}

uint64_t _SWCollaborationDetailViewController.customCollaborators.getter()
{
  return sub_18FB5312C();
}

uint64_t _SWCollaborationDetailViewController.customCollaborators.setter()
{
  return sub_18FB53264();
}

void __swiftcall _SWCollaborationDetailViewController.init(highlight:listContent:)(_SWCollaborationDetailViewController *__return_ptr retstr, SWHighlight_optional highlight, UIView *listContent)
{
  identifier = highlight.value._identifier;
  Class isa = highlight.value.super.isa;
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHighlight_listContent_, highlight.value.super.isa, highlight.value._identifier);
}

id sub_18FB51460(void *a1, void *a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  id v5 = sub_18FB37CA0(a1);
  id v6 = a2;
  id v7 = v5;
  sub_18FB55960();
  char v8 = v17;
  uint64_t v9 = v18;
  sub_18FB4EF50();
  uint64_t v10 = sub_18FB554E0();
  unsigned int v12 = v11;
  uint64_t v17 = v10;
  uint64_t v18 = (uint64_t)v11;
  id v19 = v6;
  char v20 = v8;
  uint64_t v21 = v9;
  swift_retain();
  id v13 = v12;
  id v14 = v6;
  id v15 = sub_18FB53FEC(v7, (uint64_t)&v17);
  swift_release_n();

  return v15;
}

id _SWCollaborationDetailViewController.init<A>(highlight:listContent:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = sub_18FB53D24(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a2, a3);

  return v6;
}

id _SWCollaborationDetailViewController.init<A>(highlight:listContent:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = sub_18FB53EF0(a1, a2, a3, a4);

  return v5;
}

void __swiftcall _SWCollaborationDetailViewController.init(highlight:)(_SWCollaborationDetailViewController *__return_ptr retstr, SWHighlight_optional highlight)
{
  Class isa = highlight.value.super.isa;
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithHighlight_, highlight.value.super.isa);
}

void sub_18FB5165C(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v5 = v4;
  uint64_t v10 = sub_18FB55760();
  MEMORY[0x1F4188790](v10 - 8, v11);
  id v12 = objc_msgSend(v5, sel_typeErasedHostingController);
  if (v12)
  {
    id v13 = v12;
    objc_msgSend(v12, sel_willMoveToParentViewController_, 0);
  }
  id v14 = objc_msgSend(v5, sel_typeErasedHostingController);
  objc_msgSend(v14, sel_removeFromParentViewController);

  id v15 = objc_msgSend(v5, sel_typeErasedHostingController);
  if (!v15)
  {
LABEL_6:
    uint64_t v69 = a2;
    LOBYTE(v70) = a3 & 1;
    objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9266560));
    swift_retain();
    id v18 = a2;
    id v19 = (id)sub_18FB555B0();
    id v20 = objc_msgSend(v19, sel_view, a1, v69, v70, a4);
    if (v20)
    {
      uint64_t v21 = v20;
      id v22 = objc_msgSend(self, sel_clearColor);
      objc_msgSend(v21, sel_setBackgroundColor_, v22);

      sub_18FB55750();
      sub_18FB55590();
      id v23 = self;
      id v24 = v19;
      id v25 = objc_msgSend(v23, sel_currentDevice);
      uint64_t v26 = (char *)objc_msgSend(v25, sel_userInterfaceIdiom);

      if ((unint64_t)(v26 - 1) > 5) {
        v27.n128_u64[0] = 0x4072480000000000;
      }
      else {
        v27.n128_u64[0] = qword_18FB599D8[(void)(v26 - 1)];
      }
      objc_msgSend(v24, sel_setPreferredContentSize_, CGSizeMake(v27), 0.0);

      objc_msgSend(v5, sel_addChildViewController_, v24);
      id v28 = objc_msgSend(v5, sel_view);
      if (v28)
      {
        char v29 = v28;
        id v30 = objc_msgSend(v24, sel_view);
        if (v30)
        {
          id v31 = v30;
          objc_msgSend(v29, sel_addSubview_, v30);

          objc_msgSend(v24, sel_didMoveToParentViewController_, v5);
          id v32 = objc_msgSend(v24, sel_view);
          if (v32)
          {
            char v33 = v32;
            objc_msgSend(v32, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

            __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266188);
            uint64_t v34 = swift_allocObject();
            *(_OWORD *)(v34 + 16) = xmmword_18FB58FE0;
            id v35 = objc_msgSend(v24, sel_view);
            if (v35)
            {
              uint64_t v36 = v35;
              id v37 = objc_msgSend(v35, sel_topAnchor);

              id v38 = objc_msgSend(v5, sel_view);
              if (v38)
              {
                uint64_t v39 = v38;
                id v40 = objc_msgSend(v38, sel_safeAreaLayoutGuide);

                id v41 = objc_msgSend(v40, sel_topAnchor);
                id v42 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v41);

                *(void *)(v34 + 32) = v42;
                id v43 = objc_msgSend(v24, sel_view);
                if (v43)
                {
                  uint64_t v44 = v43;
                  id v45 = objc_msgSend(v43, sel_bottomAnchor);

                  id v46 = objc_msgSend(v5, sel_view);
                  if (v46)
                  {
                    uint64_t v47 = v46;
                    id v48 = objc_msgSend(v46, sel_safeAreaLayoutGuide);

                    id v49 = objc_msgSend(v48, sel_bottomAnchor);
                    id v50 = objc_msgSend(v45, sel_constraintEqualToAnchor_, v49);

                    *(void *)(v34 + 40) = v50;
                    id v51 = objc_msgSend(v24, sel_view);
                    if (v51)
                    {
                      uint64_t v52 = v51;
                      id v53 = objc_msgSend(v51, sel_leadingAnchor);

                      id v54 = objc_msgSend(v5, sel_view);
                      if (v54)
                      {
                        char v55 = v54;
                        id v56 = objc_msgSend(v54, sel_safeAreaLayoutGuide);

                        id v57 = objc_msgSend(v56, sel_leadingAnchor);
                        id v58 = objc_msgSend(v53, sel_constraintEqualToAnchor_, v57);

                        *(void *)(v34 + 48) = v58;
                        id v59 = objc_msgSend(v24, sel_view);
                        if (v59)
                        {
                          long long v60 = v59;
                          id v61 = objc_msgSend(v59, sel_trailingAnchor);

                          id v62 = objc_msgSend(v5, sel_view);
                          if (v62)
                          {
                            unint64_t v63 = v62;
                            uint64_t v64 = self;
                            id v65 = objc_msgSend(v63, sel_safeAreaLayoutGuide);

                            id v66 = objc_msgSend(v65, sel_trailingAnchor);
                            id v67 = objc_msgSend(v61, sel_constraintEqualToAnchor_, v66);

                            *(void *)(v34 + 56) = v67;
                            sub_18FB55B10();
                            sub_18FB54400();
                            char v68 = (void *)sub_18FB55AF0();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v64, sel_activateConstraints_, v68, v34);

                            objc_msgSend(v5, sel_setTypeErasedHostingController_, v24);
                            return;
                          }
                          goto LABEL_33;
                        }
LABEL_32:
                        __break(1u);
LABEL_33:
                        __break(1u);
                        goto LABEL_34;
                      }
LABEL_31:
                      __break(1u);
                      goto LABEL_32;
                    }
LABEL_30:
                    __break(1u);
                    goto LABEL_31;
                  }
LABEL_29:
                  __break(1u);
                  goto LABEL_30;
                }
LABEL_28:
                __break(1u);
                goto LABEL_29;
              }
LABEL_27:
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
  int v16 = v15;
  id v17 = objc_msgSend(v15, sel_view);

  if (v17)
  {
    objc_msgSend(v17, sel_removeFromSuperview);

    goto LABEL_6;
  }
LABEL_34:
  __break(1u);
}

void sub_18FB51D24(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_18FB55760();
  MEMORY[0x1F4188790](v4 - 8, v5);
  id v6 = objc_msgSend(v2, sel_typeErasedHostingController);
  if (v6)
  {
    id v7 = v6;
    objc_msgSend(v6, sel_willMoveToParentViewController_, 0);
  }
  id v8 = objc_msgSend(v2, sel_typeErasedHostingController);
  objc_msgSend(v8, sel_removeFromParentViewController);

  id v9 = objc_msgSend(v2, sel_typeErasedHostingController);
  if (!v9)
  {
LABEL_6:
    long long v62 = *(_OWORD *)a1;
    long long v63 = *(_OWORD *)(a1 + 16);
    uint64_t v64 = *(void *)(a1 + 32);
    objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9266558));
    sub_18FB543C0(a1);
    id v12 = (id)sub_18FB555B0();
    id v13 = objc_msgSend(v12, sel_view, v62, v63, v64);
    if (v13)
    {
      id v14 = v13;
      id v15 = objc_msgSend(self, sel_clearColor);
      objc_msgSend(v14, sel_setBackgroundColor_, v15);

      sub_18FB55750();
      sub_18FB55590();
      int v16 = self;
      id v17 = v12;
      id v18 = objc_msgSend(v16, sel_currentDevice);
      id v19 = (char *)objc_msgSend(v18, sel_userInterfaceIdiom);

      if ((unint64_t)(v19 - 1) > 5) {
        v20.n128_u64[0] = 0x4072480000000000;
      }
      else {
        v20.n128_u64[0] = qword_18FB599D8[(void)(v19 - 1)];
      }
      objc_msgSend(v17, sel_setPreferredContentSize_, CGSizeMake(v20), 0.0);

      objc_msgSend(v2, sel_addChildViewController_, v17);
      id v21 = objc_msgSend(v2, sel_view);
      if (v21)
      {
        id v22 = v21;
        id v23 = objc_msgSend(v17, sel_view);
        if (v23)
        {
          id v24 = v23;
          objc_msgSend(v22, sel_addSubview_, v23);

          objc_msgSend(v17, sel_didMoveToParentViewController_, v2);
          id v25 = objc_msgSend(v17, sel_view);
          if (v25)
          {
            uint64_t v26 = v25;
            objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

            __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266188);
            uint64_t v27 = swift_allocObject();
            *(_OWORD *)(v27 + 16) = xmmword_18FB58FE0;
            id v28 = objc_msgSend(v17, sel_view);
            if (v28)
            {
              char v29 = v28;
              id v30 = objc_msgSend(v28, sel_topAnchor);

              id v31 = objc_msgSend(v2, sel_view);
              if (v31)
              {
                id v32 = v31;
                id v33 = objc_msgSend(v31, sel_safeAreaLayoutGuide);

                id v34 = objc_msgSend(v33, sel_topAnchor);
                id v35 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v34);

                *(void *)(v27 + 32) = v35;
                id v36 = objc_msgSend(v17, sel_view);
                if (v36)
                {
                  id v37 = v36;
                  id v38 = objc_msgSend(v36, sel_bottomAnchor);

                  id v39 = objc_msgSend(v2, sel_view);
                  if (v39)
                  {
                    id v40 = v39;
                    id v41 = objc_msgSend(v39, sel_safeAreaLayoutGuide);

                    id v42 = objc_msgSend(v41, sel_bottomAnchor);
                    id v43 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v42);

                    *(void *)(v27 + 40) = v43;
                    id v44 = objc_msgSend(v17, sel_view);
                    if (v44)
                    {
                      id v45 = v44;
                      id v46 = objc_msgSend(v44, sel_leadingAnchor);

                      id v47 = objc_msgSend(v2, sel_view);
                      if (v47)
                      {
                        id v48 = v47;
                        id v49 = objc_msgSend(v47, sel_safeAreaLayoutGuide);

                        id v50 = objc_msgSend(v49, sel_leadingAnchor);
                        id v51 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v50);

                        *(void *)(v27 + 48) = v51;
                        id v52 = objc_msgSend(v17, sel_view);
                        if (v52)
                        {
                          id v53 = v52;
                          id v54 = objc_msgSend(v52, sel_trailingAnchor);

                          id v55 = objc_msgSend(v2, sel_view);
                          if (v55)
                          {
                            id v56 = v55;
                            id v57 = self;
                            id v58 = objc_msgSend(v56, sel_safeAreaLayoutGuide);

                            id v59 = objc_msgSend(v58, sel_trailingAnchor);
                            id v60 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v59);

                            *(void *)(v27 + 56) = v60;
                            sub_18FB55B10();
                            sub_18FB54400();
                            id v61 = (void *)sub_18FB55AF0();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v57, sel_activateConstraints_, v61, v27);

                            objc_msgSend(v2, sel_setTypeErasedHostingController_, v17);
                            return;
                          }
                          goto LABEL_33;
                        }
LABEL_32:
                        __break(1u);
LABEL_33:
                        __break(1u);
                        goto LABEL_34;
                      }
LABEL_31:
                      __break(1u);
                      goto LABEL_32;
                    }
LABEL_30:
                    __break(1u);
                    goto LABEL_31;
                  }
LABEL_29:
                  __break(1u);
                  goto LABEL_30;
                }
LABEL_28:
                __break(1u);
                goto LABEL_29;
              }
LABEL_27:
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v10 = v9;
  id v11 = objc_msgSend(v9, sel_view);

  if (v11)
  {
    objc_msgSend(v11, sel_removeFromSuperview);

    goto LABEL_6;
  }
LABEL_34:
  __break(1u);
}

void sub_18FB523DC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_18FB55760();
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v6 = type metadata accessor for _CollaborationDetailView();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)v67 - v9;
  id v11 = objc_msgSend(v2, sel_typeErasedHostingController);
  if (v11)
  {
    id v12 = v11;
    objc_msgSend(v11, sel_willMoveToParentViewController_, 0);
  }
  id v13 = objc_msgSend(v2, sel_typeErasedHostingController);
  objc_msgSend(v13, sel_removeFromParentViewController);

  id v14 = objc_msgSend(v2, sel_typeErasedHostingController);
  if (!v14)
  {
LABEL_6:
    swift_getWitnessTable();
    sub_18FB555C0();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
    id v17 = (id)sub_18FB555A0();
    id v18 = objc_msgSend(v17, sel_view);
    if (v18)
    {
      id v19 = v18;
      id v20 = objc_msgSend(self, sel_clearColor);
      objc_msgSend(v19, sel_setBackgroundColor_, v20);

      sub_18FB55750();
      sub_18FB55590();
      id v21 = self;
      id v22 = v17;
      id v23 = objc_msgSend(v21, sel_currentDevice);
      id v24 = (char *)objc_msgSend(v23, sel_userInterfaceIdiom);

      if ((unint64_t)(v24 - 1) > 5) {
        v25.n128_u64[0] = 0x4072480000000000;
      }
      else {
        v25.n128_u64[0] = qword_18FB599D8[(void)(v24 - 1)];
      }
      objc_msgSend(v22, sel_setPreferredContentSize_, CGSizeMake(v25), 0.0);

      objc_msgSend(v2, sel_addChildViewController_, v22);
      id v26 = objc_msgSend(v2, sel_view);
      if (v26)
      {
        uint64_t v27 = v26;
        id v28 = objc_msgSend(v22, sel_view);
        if (v28)
        {
          char v29 = v28;
          objc_msgSend(v27, sel_addSubview_, v28);

          objc_msgSend(v22, sel_didMoveToParentViewController_, v2);
          id v30 = objc_msgSend(v22, sel_view);
          if (v30)
          {
            id v31 = v30;
            objc_msgSend(v30, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

            __swift_instantiateConcreteTypeFromMangledName(&qword_1E9266188);
            uint64_t v32 = swift_allocObject();
            *(_OWORD *)(v32 + 16) = xmmword_18FB58FE0;
            id v33 = objc_msgSend(v22, sel_view);
            if (v33)
            {
              id v34 = v33;
              id v35 = objc_msgSend(v33, sel_topAnchor);

              id v36 = objc_msgSend(v2, sel_view);
              if (v36)
              {
                id v37 = v36;
                id v38 = objc_msgSend(v36, sel_safeAreaLayoutGuide);

                id v39 = objc_msgSend(v38, sel_topAnchor);
                id v40 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v39);

                *(void *)(v32 + 32) = v40;
                id v41 = objc_msgSend(v22, sel_view);
                if (v41)
                {
                  id v42 = v41;
                  id v43 = objc_msgSend(v41, sel_bottomAnchor);

                  id v44 = objc_msgSend(v2, sel_view);
                  if (v44)
                  {
                    id v45 = v44;
                    id v46 = objc_msgSend(v44, sel_safeAreaLayoutGuide);

                    id v47 = objc_msgSend(v46, sel_bottomAnchor);
                    id v48 = objc_msgSend(v43, sel_constraintEqualToAnchor_, v47);

                    *(void *)(v32 + 40) = v48;
                    id v49 = objc_msgSend(v22, sel_view);
                    if (v49)
                    {
                      id v50 = v49;
                      id v51 = objc_msgSend(v49, sel_leadingAnchor);

                      id v52 = objc_msgSend(v2, sel_view);
                      if (v52)
                      {
                        id v53 = v52;
                        id v54 = objc_msgSend(v52, sel_safeAreaLayoutGuide);

                        id v55 = objc_msgSend(v54, sel_leadingAnchor);
                        id v56 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v55);

                        *(void *)(v32 + 48) = v56;
                        id v57 = objc_msgSend(v22, sel_view);
                        if (v57)
                        {
                          id v58 = v57;
                          id v59 = objc_msgSend(v57, sel_trailingAnchor);

                          id v60 = objc_msgSend(v2, sel_view);
                          if (v60)
                          {
                            id v61 = v60;
                            long long v62 = self;
                            id v63 = objc_msgSend(v61, sel_safeAreaLayoutGuide);

                            id v64 = objc_msgSend(v63, sel_trailingAnchor);
                            id v65 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v64);

                            *(void *)(v32 + 56) = v65;
                            v67[1] = v32;
                            sub_18FB55B10();
                            sub_18FB54400();
                            id v66 = (void *)sub_18FB55AF0();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v62, sel_activateConstraints_, v66);

                            objc_msgSend(v2, sel_setTypeErasedHostingController_, v22);
                            return;
                          }
                          goto LABEL_33;
                        }
LABEL_32:
                        __break(1u);
LABEL_33:
                        __break(1u);
                        goto LABEL_34;
                      }
LABEL_31:
                      __break(1u);
                      goto LABEL_32;
                    }
LABEL_30:
                    __break(1u);
                    goto LABEL_31;
                  }
LABEL_29:
                  __break(1u);
                  goto LABEL_30;
                }
LABEL_28:
                __break(1u);
                goto LABEL_29;
              }
LABEL_27:
              __break(1u);
              goto LABEL_28;
            }
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
  id v15 = v14;
  id v16 = objc_msgSend(v14, sel_view);

  if (v16)
  {
    objc_msgSend(v16, sel_removeFromSuperview);

    goto LABEL_6;
  }
LABEL_34:
  __break(1u);
}

id _SWCollaborationDetailViewController.init(itemProvider:)(void *a1)
{
  objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  id v3 = v1;
  id v4 = a1;
  id v5 = CollaborationDetailViewModel.init(itemProvider:)(v4);
  sub_18FB55960();
  sub_18FB4EF50();
  uint64_t v6 = sub_18FB554E0();
  uint64_t v8 = v7;
  swift_getObjectType();

  swift_retain();
  id v9 = v8;
  id v10 = sub_18FB54120(v5, v6, v9, v12, v13);

  swift_release_n();
  swift_deallocPartialClassInstance();
  return v10;
}

id _SWCollaborationDetailViewController.viewModel.getter()
{
  id result = objc_msgSend(v0, sel_typeErasedViewModel);
  if (result)
  {
    type metadata accessor for CollaborationDetailViewModel(0);
    return (id)swift_dynamicCastClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void _SWCollaborationDetailViewController.viewModel.setter(void *a1)
{
  objc_msgSend(v1, sel_setTypeErasedViewModel_, a1);
}

Swift::Void __swiftcall _SWCollaborationDetailViewController.setListContentView(_:)(UIView *a1)
{
  uint64_t v2 = a1;
  id v3 = objc_msgSend(v1, sel_viewModel);
  id v4 = v2;
  sub_18FB55960();
  char v5 = v10;
  uint64_t v6 = v11;
  type metadata accessor for CollaborationDetailViewModel(0);
  sub_18FB4EF50();
  uint64_t v7 = sub_18FB554E0();
  id v9 = v8;
  uint64_t v10 = v7;
  uint64_t v11 = (uint64_t)v8;
  char v12 = v4;
  char v13 = v5;
  uint64_t v14 = v6;
  sub_18FB51D24((uint64_t)&v10);

  swift_release();
}

uint64_t sub_18FB52F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18FB5436C();

  return MEMORY[0x1F40F9EF0](a1, a2, a3, v6);
}

uint64_t sub_18FB52FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_18FB5436C();

  return MEMORY[0x1F40F9E78](a1, a2, a3, v6);
}

void sub_18FB53044()
{
}

uint64_t _SWCollaborationDetailViewController.highlight.getter()
{
  return sub_18FB5312C();
}

uint64_t sub_18FB5312C()
{
  id v1 = objc_msgSend(v0, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();

  swift_release();
  swift_release();
  return v3;
}

uint64_t _SWCollaborationDetailViewController.highlight.setter()
{
  return sub_18FB53264();
}

uint64_t sub_18FB53264()
{
  id v1 = objc_msgSend(v0, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_18FB554A0();
}

double sub_18FB532E4@<D0>(id *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();

  swift_release();
  swift_release();
  double result = *(double *)&v5;
  *a2 = v5;
  return result;
}

uint64_t sub_18FB53380(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_bridgeObjectRetain();
  id v3 = objc_msgSend(v2, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_18FB554A0();
}

void (*_SWCollaborationDetailViewController.customContentTitle.modify(void *a1))(uint64_t **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  id v4 = objc_msgSend(v1, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();

  *(_OWORD *)id v3 = *((_OWORD *)v3 + 1);
  return sub_18FB534DC;
}

void sub_18FB534DC(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v4 = **a1;
  uint64_t v3 = (*a1)[1];
  long long v5 = (void *)(*a1)[4];
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v6 = objc_msgSend(v5, sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    v2[2] = v4;
    v2[3] = v3;
    sub_18FB554A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = objc_msgSend((id)(*a1)[4], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    v2[2] = v4;
    v2[3] = v3;
    sub_18FB554A0();
  }

  free(v2);
}

uint64_t sub_18FB535E4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();

  swift_release();
  uint64_t result = swift_release();
  *a2 = v5;
  return result;
}

uint64_t sub_18FB53680(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_bridgeObjectRetain();
  id v3 = objc_msgSend(v2, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_18FB554A0();
}

uint64_t (*_SWCollaborationDetailViewController.customCollaborators.modify(void *a1))(uint64_t *a1, char a2)
{
  a1[2] = v1;
  id v3 = objc_msgSend(v1, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();
  swift_release();
  swift_release();

  *a1 = a1[1];
  return sub_18FB537CC;
}

uint64_t sub_18FB537CC(uint64_t *a1, char a2)
{
  uint64_t v2 = a1 + 1;
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)a1[2];
  if (a2)
  {
    swift_bridgeObjectRetain();
    id v6 = objc_msgSend(v4, sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    a1[1] = v3;
    sub_18FB554A0();
    return swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = objc_msgSend((id)a1[2], sel_viewModel);
    swift_getKeyPath();
    swift_getKeyPath();
    void *v2 = v3;
    return sub_18FB554A0();
  }
}

id _SWCollaborationDetailViewController.init(highlight:listContent:)(void *a1, void *a2)
{
  swift_getObjectType();
  id v4 = sub_18FB51460(a1, a2);
  swift_deallocPartialClassInstance();
  return v4;
}

id _SWCollaborationDetailViewController.init(highlight:)(void *a1)
{
  objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  id v3 = v1;
  id v4 = sub_18FB37CA0(a1);
  sub_18FB55960();
  sub_18FB4EF50();
  uint64_t v5 = sub_18FB554E0();
  id v7 = v6;
  swift_getObjectType();

  swift_retain();
  id v8 = v7;
  id v9 = sub_18FB54120(v4, v5, v8, v11, v12);
  swift_release_n();

  swift_deallocPartialClassInstance();
  return v9;
}

id _SWCollaborationDetailViewController.updateHighlight<A>(_:newListContent:)(uint64_t a1)
{
  return objc_msgSend(v1, sel_setCollaborationHighlight_, a1);
}

{
  void *v1;

  return objc_msgSend(v1, sel_setCollaborationHighlight_, a1);
}

id sub_18FB53B30(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_18FB55760();
  MEMORY[0x1F4188790](v4 - 8, v5);
  uint64_t v6 = type metadata accessor for _CollaborationDetailView();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v15 - v9;
  id v11 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v11, sel_setTypeErasedViewModel_, a1);
  swift_getWitnessTable();
  sub_18FB555C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2, v6);
  uint64_t v12 = (void *)sub_18FB555A0();
  sub_18FB55750();
  sub_18FB55590();
  id v13 = v12;
  objc_msgSend(v11, sel_setTypeErasedHostingController_, v13);
  sub_18FB523DC(a2);

  return v11;
}

id sub_18FB53D24(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x1F4188790](a1, a2);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for _CollaborationDetailView();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9, v11);
  id v13 = (uint64_t *)((char *)&v19 - v12);
  id v14 = objc_allocWithZone((Class)type metadata accessor for CollaborationDetailViewModel(0));
  id v15 = sub_18FB37CA0(a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, a3);
  id v16 = v15;
  sub_18FB4B918((uint64_t)v8, a3, v13);
  id v17 = sub_18FB53B30(v16, (uint64_t)v13);
  (*(void (**)(uint64_t *, uint64_t))(v10 + 8))(v13, v9);
  return v17;
}

id sub_18FB53EF0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](a1, a2);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10(v7);
  id v11 = sub_18FB53D24(a1, (uint64_t)v9, a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, a4);
  return v11;
}

id sub_18FB53FEC(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_18FB55760();
  MEMORY[0x1F4188790](v4 - 8, v5);
  id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v6, sel_setTypeErasedViewModel_, a1);
  long long v11 = *(_OWORD *)a2;
  long long v12 = *(_OWORD *)(a2 + 16);
  uint64_t v13 = *(void *)(a2 + 32);
  id v7 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E9266558));
  sub_18FB543C0(a2);
  uint64_t v8 = (void *)sub_18FB555B0();
  sub_18FB55750();
  sub_18FB55590();
  id v9 = v8;
  objc_msgSend(v6, sel_setTypeErasedHostingController_, v9, v11, v12, v13);
  sub_18FB51D24(a2);

  return v6;
}

id sub_18FB54120(void *a1, uint64_t a2, void *a3, char a4, uint64_t a5)
{
  uint64_t v10 = sub_18FB55760();
  MEMORY[0x1F4188790](v10 - 8, v11);
  id v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v12, sel_setTypeErasedViewModel_, a1);
  id v17 = a3;
  LOBYTE(v18) = a4;
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9266560));
  swift_retain();
  id v13 = a3;
  id v14 = (void *)sub_18FB555B0();
  sub_18FB55750();
  sub_18FB55590();
  id v15 = v14;
  objc_msgSend(v12, sel_setTypeErasedHostingController_, v15, a2, v17, v18, a5);
  sub_18FB5165C(a2, v13, a4, a5);

  return v12;
}

char *keypath_get_selector_viewModel()
{
  return sel_viewModel;
}

id sub_18FB5429C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_viewModel);
  *a2 = result;
  return result;
}

id sub_18FB542D8(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setViewModel_, *a1);
}

char *keypath_get_selector_collaborationHighlight()
{
  return sel_collaborationHighlight;
}

id sub_18FB542F8@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_collaborationHighlight);
  *a2 = result;
  return result;
}

id sub_18FB54334(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setCollaborationHighlight_, *a1);
}

ValueMetadata *type metadata accessor for ListContentViewRepresentable()
{
  return &type metadata for ListContentViewRepresentable;
}

unint64_t sub_18FB5436C()
{
  unint64_t result = qword_1E9266550;
  if (!qword_1E9266550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9266550);
  }
  return result;
}

uint64_t sub_18FB543C0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  id v3 = *(void **)(a1 + 16);
  swift_retain();
  id v4 = v2;
  id v5 = v3;
  return a1;
}

unint64_t sub_18FB54400()
{
  unint64_t result = qword_1E9266190;
  if (!qword_1E9266190)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1E9266190);
  }
  return result;
}

uint64_t __getSLCollaborationSigningControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SWHighlight replyContextMenuWithPresentingViewController:](v0);
}

uint64_t sub_18FB551E0()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_18FB551F0()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_18FB55200()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_18FB55210()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_18FB55220()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_18FB55230()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_18FB55240()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_18FB55250()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_18FB55260()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_18FB55270()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_18FB55280()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_18FB55290()
{
  return MEMORY[0x1F415B0A8]();
}

uint64_t sub_18FB552A0()
{
  return MEMORY[0x1F415B0B0]();
}

uint64_t sub_18FB552B0()
{
  return MEMORY[0x1F415B0B8]();
}

uint64_t sub_18FB552C0()
{
  return MEMORY[0x1F415B0C0]();
}

uint64_t sub_18FB552D0()
{
  return MEMORY[0x1F415B0C8]();
}

uint64_t sub_18FB552E0()
{
  return MEMORY[0x1F415B0D0]();
}

uint64_t sub_18FB552F0()
{
  return MEMORY[0x1F415B0D8]();
}

uint64_t sub_18FB55300()
{
  return MEMORY[0x1F415B0E0]();
}

uint64_t sub_18FB55310()
{
  return MEMORY[0x1F415B0E8]();
}

uint64_t sub_18FB55320()
{
  return MEMORY[0x1F415B0F0]();
}

uint64_t sub_18FB55330()
{
  return MEMORY[0x1F415B0F8]();
}

uint64_t sub_18FB55340()
{
  return MEMORY[0x1F415B100]();
}

uint64_t sub_18FB55350()
{
  return MEMORY[0x1F415B108]();
}

uint64_t sub_18FB55360()
{
  return MEMORY[0x1F415B110]();
}

uint64_t sub_18FB55370()
{
  return MEMORY[0x1F415B118]();
}

uint64_t sub_18FB55380()
{
  return MEMORY[0x1F415B120]();
}

uint64_t sub_18FB55390()
{
  return MEMORY[0x1F415B128]();
}

uint64_t sub_18FB553A0()
{
  return MEMORY[0x1F40DFA38]();
}

uint64_t sub_18FB553B0()
{
  return MEMORY[0x1F40DFAB0]();
}

uint64_t sub_18FB553C0()
{
  return MEMORY[0x1F4187850]();
}

uint64_t sub_18FB553D0()
{
  return MEMORY[0x1F4187858]();
}

uint64_t sub_18FB553E0()
{
  return MEMORY[0x1F4187960]();
}

uint64_t sub_18FB553F0()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_18FB55400()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_18FB55410()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_18FB55420()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_18FB55430()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_18FB55440()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_18FB55450()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_18FB55460()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_18FB55470()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_18FB55480()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_18FB55490()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_18FB554A0()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_18FB554B0()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_18FB554C0()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_18FB554D0()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_18FB554E0()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_18FB554F0()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_18FB55500()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_18FB55510()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_18FB55520()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_18FB55530()
{
  return MEMORY[0x1F40F93A8]();
}

uint64_t sub_18FB55540()
{
  return MEMORY[0x1F40F93B0]();
}

uint64_t sub_18FB55550()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_18FB55560()
{
  return MEMORY[0x1F40F9A40]();
}

uint64_t sub_18FB55570()
{
  return MEMORY[0x1F40F9A50]();
}

uint64_t sub_18FB55580()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_18FB55590()
{
  return MEMORY[0x1F40F9DE0]();
}

uint64_t sub_18FB555A0()
{
  return MEMORY[0x1F40F9E08]();
}

uint64_t sub_18FB555B0()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_18FB555C0()
{
  return MEMORY[0x1F40F9E40]();
}

uint64_t sub_18FB555D0()
{
  return MEMORY[0x1F40F9E50]();
}

uint64_t sub_18FB555E0()
{
  return MEMORY[0x1F40F9E60]();
}

uint64_t sub_18FB555F0()
{
  return MEMORY[0x1F40F9E70]();
}

uint64_t sub_18FB55610()
{
  return MEMORY[0x1F40F9E90]();
}

uint64_t sub_18FB55620()
{
  return MEMORY[0x1F40F9E98]();
}

uint64_t sub_18FB55630()
{
  return MEMORY[0x1F40F9EB0]();
}

uint64_t sub_18FB55640()
{
  return MEMORY[0x1F40F9EC0]();
}

uint64_t sub_18FB55650()
{
  return MEMORY[0x1F40F9ED0]();
}

uint64_t sub_18FB55660()
{
  return MEMORY[0x1F40F9EE0]();
}

uint64_t sub_18FB55680()
{
  return MEMORY[0x1F40F9F00]();
}

uint64_t sub_18FB55690()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_18FB556A0()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_18FB556B0()
{
  return MEMORY[0x1F40F9FB8]();
}

uint64_t sub_18FB556C0()
{
  return MEMORY[0x1F40FAB00]();
}

uint64_t sub_18FB556D0()
{
  return MEMORY[0x1F40FAB08]();
}

uint64_t sub_18FB556E0()
{
  return MEMORY[0x1F40FAB18]();
}

uint64_t sub_18FB55700()
{
  return MEMORY[0x1F40FAB38]();
}

uint64_t sub_18FB55710()
{
  return MEMORY[0x1F40FAB48]();
}

uint64_t sub_18FB55720()
{
  return MEMORY[0x1F40FAB58]();
}

uint64_t sub_18FB55740()
{
  return MEMORY[0x1F40FAB80]();
}

uint64_t sub_18FB55750()
{
  return MEMORY[0x1F40FAC48]();
}

uint64_t sub_18FB55760()
{
  return MEMORY[0x1F40FAC50]();
}

uint64_t sub_18FB55770()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_18FB55780()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_18FB55790()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_18FB557A0()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_18FB557B0()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_18FB557C0()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_18FB557D0()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_18FB557E0()
{
  return MEMORY[0x1F40FB050]();
}

uint64_t sub_18FB557F0()
{
  return MEMORY[0x1F40FB148]();
}

uint64_t sub_18FB55800()
{
  return MEMORY[0x1F40FB1E0]();
}

uint64_t sub_18FB55810()
{
  return MEMORY[0x1F40FB1F0]();
}

uint64_t sub_18FB55820()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_18FB55830()
{
  return MEMORY[0x1F40FB440]();
}

uint64_t sub_18FB55840()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_18FB55850()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_18FB55860()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_18FB55870()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_18FB55880()
{
  return MEMORY[0x1F40FB760]();
}

uint64_t sub_18FB55890()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_18FB558A0()
{
  return MEMORY[0x1F40FB958]();
}

uint64_t sub_18FB558B0()
{
  return MEMORY[0x1F40FBC00]();
}

uint64_t sub_18FB558C0()
{
  return MEMORY[0x1F40FBE70]();
}

uint64_t sub_18FB558D0()
{
  return MEMORY[0x1F40FC010]();
}

uint64_t sub_18FB558E0()
{
  return MEMORY[0x1F40FC018]();
}

uint64_t sub_18FB558F0()
{
  return MEMORY[0x1F40FC1F8]();
}

uint64_t sub_18FB55900()
{
  return MEMORY[0x1F40FC2F0]();
}

uint64_t sub_18FB55910()
{
  return MEMORY[0x1F40FC450]();
}

uint64_t sub_18FB55920()
{
  return MEMORY[0x1F40FC498]();
}

uint64_t sub_18FB55930()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_18FB55940()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_18FB55950()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_18FB55960()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_18FB55970()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_18FB55980()
{
  return MEMORY[0x1F40FC718]();
}

uint64_t sub_18FB55990()
{
  return MEMORY[0x1F40FC760]();
}

uint64_t sub_18FB559A0()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_18FB559B0()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_18FB559C0()
{
  return MEMORY[0x1F40FCA38]();
}

uint64_t sub_18FB559D0()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_18FB559E0()
{
  return MEMORY[0x1F40FCE58]();
}

uint64_t sub_18FB559F0()
{
  return MEMORY[0x1F40FCE60]();
}

uint64_t sub_18FB55A00()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_18FB55A10()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_18FB55A20()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_18FB55A30()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_18FB55A40()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_18FB55A50()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_18FB55A60()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_18FB55A70()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_18FB55A80()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_18FB55A90()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_18FB55AA0()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_18FB55AB0()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_18FB55AC0()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_18FB55AD0()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_18FB55AE0()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_18FB55AF0()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_18FB55B00()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_18FB55B10()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_18FB55B20()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_18FB55B30()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_18FB55B40()
{
  return MEMORY[0x1F4183FC0]();
}

uint64_t sub_18FB55B50()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_18FB55B60()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_18FB55B70()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_18FB55B80()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_18FB55B90()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_18FB55BA0()
{
  return MEMORY[0x1F40E6650]();
}

uint64_t sub_18FB55BB0()
{
  return MEMORY[0x1F4187A28]();
}

uint64_t sub_18FB55BC0()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_18FB55BD0()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_18FB55BE0()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_18FB55BF0()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_18FB55C00()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_18FB55C10()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_18FB55C20()
{
  return MEMORY[0x1F4166780]();
}

uint64_t sub_18FB55C30()
{
  return MEMORY[0x1F40FCF28]();
}

uint64_t sub_18FB55C40()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_18FB55C50()
{
  return MEMORY[0x1F4166838]();
}

uint64_t sub_18FB55C60()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_18FB55C70()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_18FB55C80()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_18FB55C90()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_18FB55CA0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_18FB55CB0()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_18FB55CC0()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_18FB55CD0()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_18FB55CE0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_18FB55CF0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_18FB55D00()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_18FB55D10()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_18FB55D20()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_18FB55D30()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_18FB55D40()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_18FB55D50()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_18FB55D60()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_18FB55D80()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_18FB55D90()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_18FB55DA0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_18FB55DB0()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_18FB55DC0()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_18FB55DD0()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_18FB55DE0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_18FB55DF0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1F4112A70]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t SLFrameworkLogHandle()
{
  return MEMORY[0x1F415B130]();
}

uint64_t SLSendPortraitFeedbackTypeAppButtonForAttribution()
{
  return MEMORY[0x1F415B138]();
}

uint64_t SLSendPortraitFeedbackTypeDisplayedHighlight()
{
  return MEMORY[0x1F415B140]();
}

uint64_t SLSendPortraitFeedbackTypeUserInteractedWithHighlight()
{
  return MEMORY[0x1F415B148]();
}

uint64_t SLURLMinusFragmentForCKURLs()
{
  return MEMORY[0x1F415B150]();
}

uint64_t SL_CGFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1F415B158]();
}

uint64_t SWFrameworkBundle()
{
  return MEMORY[0x1F40F75D8]();
}

uint64_t SWFrameworkLogHandle()
{
  return MEMORY[0x1F40F75E0]();
}

uint64_t SWShareableContentLogHandle()
{
  return MEMORY[0x1F40F75F0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
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
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1F41864C8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1F4186848]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1F4186850]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1F4186870]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1F4186878]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}