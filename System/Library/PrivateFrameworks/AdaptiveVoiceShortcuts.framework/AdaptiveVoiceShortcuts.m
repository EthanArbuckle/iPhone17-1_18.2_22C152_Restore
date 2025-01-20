void sub_247710798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, void);
  v11 = va_arg(va1, void);
  v12 = va_arg(va1, void);
  v13 = va_arg(va1, void);
  v14 = va_arg(va1, void);
  v15 = va_arg(va1, void);
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

id convertToShortLPCMBufFromFloatLPCMBuf(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 length];
  vDSP_Length v3 = v2 >> 2;
  float v18 = 32767.0;
  float __C = 1.0;
  float __B = -1.0;
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:v2 & 0xFFFFFFFFFFFFFFFCLL];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:2 * (v2 >> 2)];
  id v6 = v1;
  v7 = (const float *)[v6 bytes];

  id v8 = v4;
  vDSP_vclip(v7, 1, &__B, &__C, (float *)[v8 bytes], 1, v3);
  id v9 = v8;
  v10 = (const float *)[v9 bytes];
  id v11 = v9;
  vDSP_vsmul(v10, 1, &v18, (float *)[v11 bytes], 1, v3);
  id v12 = v11;
  v13 = (const float *)[v12 bytes];
  id v14 = v5;
  vDSP_vfix16(v13, 1, (__int16 *)[v14 bytes], 1, v3);

  return v14;
}

void AXPIBridgePerformWarm()
{
  id v0 = [getAXPISystemActionHelperClass() sharedInstance];
  [v0 warm];
}

id getAXPISystemActionHelperClass()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getAXPISystemActionHelperClass_softClass;
  uint64_t v7 = getAXPISystemActionHelperClass_softClass;
  if (!getAXPISystemActionHelperClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXPISystemActionHelperClass_block_invoke;
    v3[3] = &unk_26521F6C8;
    v3[4] = &v4;
    __getAXPISystemActionHelperClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_247710D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AXPIBridgePerformActionForSystemAction(void *a1)
{
  id v1 = a1;
  id v2 = [getAXPISystemActionHelperClass() sharedInstance];
  [v2 performActionForSystemAction:v1];
}

Class __getAXPISystemActionHelperClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __AccessibilityPhysicalInteractionLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_26521F6E8;
    uint64_t v5 = 0;
    AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getAXPISystemActionHelperClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AXPISystemActionHelper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getAXPISystemActionHelperClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityPhysicalInteractionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary = result;
  return result;
}

void *initializeBufferWithCopyOfBuffer for AVSConfirmationView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AVSConfirmationView()
{
  return swift_release();
}

void *assignWithCopy for AVSConfirmationView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AVSConfirmationView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSConfirmationView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AVSConfirmationView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AVSConfirmationView()
{
  return &type metadata for AVSConfirmationView;
}

uint64_t sub_247711478()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247711494@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v54 = a3;
  uint64_t v5 = sub_2477500F8();
  uint64_t v51 = *(void *)(v5 - 8);
  uint64_t v52 = v5;
  MEMORY[0x270FA5388](v5);
  v50 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F158);
  MEMORY[0x270FA5388](v7 - 8);
  v53 = (char *)v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for AdaptiveVoiceShortcut();
  MEMORY[0x270FA5388](v44);
  v10 = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F168);
  uint64_t v48 = *(void *)(v14 - 8);
  uint64_t v49 = v14;
  MEMORY[0x270FA5388](v14);
  v47 = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26925F140 != -1) {
    swift_once();
  }
  v43[2] = a1;
  v16 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v17 = (id)qword_269262028;
  }
  else
  {
    id v17 = objc_msgSend(self, sel_mainBundle);
    v16 = 0;
  }
  id v18 = v16;
  uint64_t v19 = sub_24774FE68();
  uint64_t v45 = v20;
  uint64_t v46 = v19;

  sub_24773D560(0xD000000000000016);
  v21 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v22 = (id)qword_269262028;
  }
  else
  {
    id v22 = objc_msgSend(self, sel_mainBundle);
    v21 = 0;
  }
  id v23 = v21;
  v43[1] = sub_24774FE68();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F170);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_247751D00;
  uint64_t v25 = a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  uint64_t v26 = v44;
  v27 = (uint64_t *)(v25 + *(int *)(v44 + 20));
  uint64_t v28 = *v27;
  unint64_t v29 = v27[1];
  *(void *)(v24 + 56) = MEMORY[0x263F8D310];
  unint64_t v30 = sub_247712668();
  *(void *)(v24 + 64) = v30;
  if (v29) {
    uint64_t v31 = v28;
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t v32 = 0xE000000000000000;
  if (v29) {
    unint64_t v32 = v29;
  }
  *(void *)(v24 + 32) = v31;
  *(void *)(v24 + 40) = v32;
  sub_2477126BC(v25, (uint64_t)v10);
  sub_2477129D0((uint64_t)&v10[*(int *)(v26 + 28)], (uint64_t)v13, &qword_26925F160);
  swift_bridgeObjectRetain();
  sub_247712770((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  uint64_t v33 = type metadata accessor for AvailableShortcutAction();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48))(v13, 1, v33) == 1)
  {
    sub_247712A34((uint64_t)v13, &qword_26925F160);
    v34 = (void *)(v24 + 72);
    *(void *)(v24 + 96) = MEMORY[0x263F8D310];
    *(void *)(v24 + 104) = v30;
LABEL_18:
    void *v34 = 0;
    unint64_t v37 = 0xE000000000000000;
    goto LABEL_19;
  }
  v35 = &v13[*(int *)(v33 + 20)];
  uint64_t v36 = *(void *)v35;
  unint64_t v37 = *((void *)v35 + 1);
  swift_bridgeObjectRetain();
  sub_247712770((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
  v34 = (void *)(v24 + 72);
  *(void *)(v24 + 96) = MEMORY[0x263F8D310];
  *(void *)(v24 + 104) = v30;
  if (!v37) {
    goto LABEL_18;
  }
  void *v34 = v36;
LABEL_19:
  *(void *)(v24 + 80) = v37;
  sub_247750B18();
  uint64_t v38 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v38);
  uint64_t v55 = MEMORY[0x263F8EE78];
  sub_2477128C0(&qword_26925F180, MEMORY[0x263F22110]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F188);
  sub_247712AEC(&qword_26925F190, &qword_26925F188);
  v39 = v50;
  uint64_t v40 = v52;
  sub_247750D68();
  sub_247750988();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v39, v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F198);
  sub_247712AEC(&qword_26925F1A0, &qword_26925F198);
  v41 = v47;
  sub_2477500E8();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v48 + 32))(v54, v41, v49);
}

uint64_t sub_247711BC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_247750548();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1A8);
  sub_247711C78(a1, a2, (char *)(a3 + *(int *)(v6 + 44)));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F198);
  uint64_t v8 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);

  return v8(a3, 0, 1, v7);
}

uint64_t sub_247711C78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v46 = a3;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1B0) - 8;
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v43 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v44 = (uint64_t)v37 - v7;
  uint64_t v8 = sub_2477505B8();
  uint64_t v42 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1B8);
  uint64_t v41 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1C0);
  v37[0] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  id v18 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v40 = (char *)v37 - v19;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = a2;
  uint64_t v38 = a2;
  swift_retain();
  v37[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1C8);
  v37[1] = sub_247712820();
  sub_247750958();
  sub_2477505A8();
  sub_247712AEC(&qword_26925F1E8, &qword_26925F1B8);
  sub_2477128C0(&qword_26925F1F0, MEMORY[0x263F1A3B8]);
  sub_2477507B8();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v10, v8);
  uint64_t v21 = v41;
  id v22 = *(void (**)(char *, uint64_t))(v41 + 8);
  v22(v13, v11);
  id v23 = v40;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v40, v18, v14);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v39;
  *(void *)(v24 + 24) = v38;
  swift_retain();
  sub_247750958();
  char v25 = sub_2477506A8();
  uint64_t v26 = (uint64_t)v43;
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v43, v13, v11);
  uint64_t v27 = v26 + *(int *)(v45 + 44);
  *(unsigned char *)uint64_t v27 = v25;
  *(_OWORD *)(v27 + 8) = 0u;
  *(_OWORD *)(v27 + 24) = 0u;
  *(unsigned char *)(v27 + 40) = 1;
  v22(v13, v11);
  uint64_t v28 = v44;
  sub_247712968(v26, v44);
  unint64_t v29 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  unint64_t v30 = v23;
  uint64_t v31 = v23;
  uint64_t v32 = v37[0];
  v29(v18, v31, v37[0]);
  sub_2477129D0(v28, v26, &qword_26925F1B0);
  uint64_t v33 = v46;
  v29(v46, v18, v32);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1F8);
  sub_2477129D0(v26, (uint64_t)&v33[*(int *)(v34 + 48)], &qword_26925F1B0);
  sub_247712A34(v28, &qword_26925F1B0);
  v35 = *(void (**)(char *, uint64_t))(v15 + 8);
  v35(v30, v32);
  sub_247712A34(v26, &qword_26925F1B0);
  return ((uint64_t (*)(char *, uint64_t))v35)(v18, v32);
}

uint64_t sub_2477121D8@<X0>(uint64_t a1@<X8>)
{
  return sub_2477123B0((void (*)(uint64_t *__return_ptr))sub_2477121F0, a1);
}

uint64_t sub_2477121F0@<X0>(uint64_t a1@<X8>)
{
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  unint64_t v2 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v3 = objc_msgSend(self, sel_mainBundle);
  }
  id v4 = v2;
  uint64_t v5 = sub_247750758();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  uint64_t v10 = sub_247750748();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_247712AA0(v5, v7, v9);
  swift_bridgeObjectRelease();
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v12;
  *(unsigned char *)(a1 + 32) = v16;
  *(void *)(a1 + 40) = v14;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  sub_247712A90(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_247712AA0(v10, v12, v16);

  return swift_bridgeObjectRelease();
}

uint64_t sub_247712398@<X0>(uint64_t a1@<X8>)
{
  return sub_2477123B0((void (*)(uint64_t *__return_ptr))sub_247712488, a1);
}

uint64_t sub_2477123B0@<X0>(void (*a1)(uint64_t *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = sub_2477504A8();
  a1(&v18);
  uint64_t v4 = v18;
  char v5 = v19;
  uint64_t v6 = v20;
  uint64_t v7 = v21;
  char v8 = v22;
  uint64_t v9 = v23;
  uint64_t v10 = v24;
  char v11 = v25;
  LOBYTE(a1) = sub_2477506D8();
  uint64_t result = sub_247750258();
  *(void *)a2 = v17;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v4;
  *(unsigned char *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = v7;
  *(unsigned char *)(a2 + 56) = v8;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(unsigned char *)(a2 + 80) = v11;
  *(unsigned char *)(a2 + 88) = (_BYTE)a1;
  *(void *)(a2 + 96) = v13;
  *(void *)(a2 + 104) = v14;
  *(void *)(a2 + 112) = v15;
  *(void *)(a2 + 120) = v16;
  *(unsigned char *)(a2 + 128) = 0;
  return result;
}

uint64_t sub_247712488@<X0>(uint64_t a1@<X8>)
{
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  unint64_t v2 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v3 = objc_msgSend(self, sel_mainBundle);
  }
  id v4 = v2;
  uint64_t v5 = sub_247750758();
  uint64_t v7 = v6;
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  char v9 = v8 & 1;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v8 & 1;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  sub_247712A90(v5, v6, v8 & 1);
  swift_bridgeObjectRetain();
  sub_247712AA0(v5, v7, v9);

  return swift_bridgeObjectRelease();
}

uint64_t sub_247712600()
{
  return sub_2477507D8();
}

uint64_t sub_24771261C@<X0>(uint64_t a1@<X8>)
{
  return sub_247711494(*v1, v1[1], a1);
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

unint64_t sub_247712668()
{
  unint64_t result = qword_26925F178;
  if (!qword_26925F178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F178);
  }
  return result;
}

uint64_t sub_2477126BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AdaptiveVoiceShortcut();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247712720@<X0>(uint64_t a1@<X8>)
{
  return sub_247711BC8(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
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

uint64_t sub_247712770(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2477127D0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247712808()
{
  return sub_247712920((void (*)(uint64_t))sub_24772E4C8);
}

unint64_t sub_247712820()
{
  unint64_t result = qword_26925F1D0;
  if (!qword_26925F1D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F1C8);
    sub_247712AEC(&qword_26925F1D8, &qword_26925F1E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F1D0);
  }
  return result;
}

uint64_t sub_2477128C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247712908()
{
  return sub_247712920((void (*)(uint64_t))sub_24772E960);
}

uint64_t sub_247712920(void (*a1)(uint64_t))
{
  uint64_t v2 = swift_retain();
  a1(v2);

  return swift_release();
}

uint64_t sub_247712968(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2477129D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247712A34(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247712A90(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_247712AA0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_247712AB0()
{
  return sub_247712AEC(&qword_26925F200, &qword_26925F168);
}

uint64_t sub_247712AEC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_247712B38()
{
  uint64_t v21 = sub_24774FE28();
  uint64_t v1 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(self, sel_shortcutsNamesDictionary);
  uint64_t v5 = sub_247750AD8();

  uint64_t v6 = sub_247716228(v5);
  swift_bridgeObjectRelease();
  int64_t v7 = v6[2];
  if (v7)
  {
    uint64_t v20 = v0;
    uint64_t v24 = MEMORY[0x263F8EE78];
    sub_24771EA78(0, v7, 0);
    char v8 = (void (**)(char *, uint64_t))(v1 + 8);
    char v19 = v6;
    char v9 = v6 + 5;
    do
    {
      uint64_t v22 = sub_247750B38();
      uint64_t v23 = v10;
      swift_bridgeObjectRetain();
      sub_24774FE18();
      sub_247715DE0();
      uint64_t v11 = sub_247750D28();
      uint64_t v13 = v12;
      (*v8)(v3, v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24771EA78(0, *(void *)(v14 + 16) + 1, 1);
        uint64_t v14 = v24;
      }
      unint64_t v16 = *(void *)(v14 + 16);
      unint64_t v15 = *(void *)(v14 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_24771EA78(v15 > 1, v16 + 1, 1);
        uint64_t v14 = v24;
      }
      v9 += 2;
      *(void *)(v14 + 16) = v16 + 1;
      uint64_t v17 = v14 + 16 * v16;
      *(void *)(v17 + 32) = v11;
      *(void *)(v17 + 40) = v13;
      --v7;
    }
    while (v7);
    swift_release();
    uint64_t v0 = v20;
  }
  else
  {
    swift_release();
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  *(void *)(v0 + 16) = v14;
  return swift_bridgeObjectRelease();
}

uint64_t sub_247712D98()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for AVSCommandNameViewModel()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for AVSCommandNameView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_247712E28()
{
  return swift_retain();
}

uint64_t destroy for AVSCommandNameView()
{
  sub_247712E94();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_247712E94()
{
  return swift_release();
}

uint64_t initializeWithCopy for AVSCommandNameView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_247712E28();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  uint64_t v8 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = a2[7];
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 72) = a2[9];
  *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
  *(void *)(a1 + 96) = a2[12];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVSCommandNameView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_247712E28();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_247712E94();
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = a2[4];
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = a2[7];
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  *(void *)(a1 + 72) = a2[9];
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
  *(void *)(a1 + 96) = a2[12];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for AVSCommandNameView(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_247712E94();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSCommandNameView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AVSCommandNameView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AVSCommandNameView()
{
  return &type metadata for AVSCommandNameView;
}

uint64_t sub_2477131E8()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_2477131F4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AVSCommandNameViewModel();
  uint64_t result = sub_2477501C8();
  *a1 = result;
  return result;
}

uint64_t sub_247713230()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24771324C()
{
  type metadata accessor for AVSCommandNameViewModel();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  sub_247712B38();
  return v0;
}

uint64_t sub_247713290@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v19 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F208);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F210);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v2;
  sub_247750668();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F218);
  sub_247715A54();
  sub_247750298();
  uint64_t v20 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F238);
  sub_247712AEC(&qword_26925F240, &qword_26925F208);
  sub_247712AEC(&qword_26925F248, &qword_26925F238);
  sub_247750868();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v11 = swift_allocObject();
  long long v12 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v11 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v11 + 96) = v12;
  *(void *)(v11 + 112) = *(void *)(v2 + 96);
  long long v13 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v11 + 32) = v13;
  long long v14 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v11 + 64) = v14;
  uint64_t v15 = v19;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v19, v10, v7);
  unint64_t v16 = (uint64_t (**)())(v15 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925F250) + 36));
  void *v16 = sub_247715B00;
  v16[1] = (uint64_t (*)())v11;
  v16[2] = 0;
  v16[3] = 0;
  sub_247715B58(v2);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24771357C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F230);
  MEMORY[0x270FA5388](v4 - 8);
  long long v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)long long v6 = sub_247750548();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F260);
  sub_247713678(a1, (uint64_t)&v6[*(int *)(v7 + 44)]);
  LOBYTE(a1) = sub_247750688();
  sub_2477129D0((uint64_t)v6, a2, &qword_26925F230);
  uint64_t v8 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925F218) + 36);
  *(unsigned char *)uint64_t v8 = a1;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *(unsigned char *)(v8 + 40) = 1;
  return sub_247712A34((uint64_t)v6, &qword_26925F230);
}

uint64_t sub_247713678@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v189 = a2;
  uint64_t v191 = sub_2477503A8();
  MEMORY[0x270FA5388](v191);
  v197 = (_OWORD *)((char *)&v154 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v173 = sub_247750388();
  uint64_t v172 = *(void *)(v173 - 8);
  MEMORY[0x270FA5388](v173);
  v169 = (char *)&v154 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v165 = sub_2477502F8();
  uint64_t v164 = *(void *)(v165 - 8);
  MEMORY[0x270FA5388](v165);
  v163 = (char *)&v154 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F268);
  uint64_t v162 = *(void *)(v166 - 8);
  MEMORY[0x270FA5388](v166);
  v161 = (char *)&v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F270);
  uint64_t v168 = *(void *)(v170 - 8);
  MEMORY[0x270FA5388](v170);
  v167 = (char *)&v154 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F278);
  uint64_t v174 = *(void *)(v177 - 8);
  MEMORY[0x270FA5388](v177);
  v171 = (char *)&v154 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F280);
  uint64_t v179 = *(void *)(v180 - 8);
  MEMORY[0x270FA5388](v180);
  v176 = (char *)&v154 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F288);
  uint64_t v181 = *(void *)(v183 - 8);
  MEMORY[0x270FA5388](v183);
  v178 = (char *)&v154 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F290);
  MEMORY[0x270FA5388](v175);
  v185 = (uint64_t (*)())((char *)&v154 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F298);
  MEMORY[0x270FA5388](v182);
  uint64_t v188 = (uint64_t)&v154 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F2A0);
  MEMORY[0x270FA5388](v184);
  v190 = (char *)&v154 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F2A8);
  uint64_t v14 = MEMORY[0x270FA5388](v187);
  uint64_t v196 = (uint64_t)&v154 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v186 = (uint64_t)&v154 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v200 = (uint64_t)&v154 - v18;
  uint64_t v157 = sub_247750538();
  uint64_t v156 = *(void *)(v157 - 8);
  MEMORY[0x270FA5388](v157);
  uint64_t v20 = (char *)&v154 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F2B0);
  MEMORY[0x270FA5388](v21 - 8);
  v159 = (char *)&v154 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v193 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F2B8);
  MEMORY[0x270FA5388](v193);
  uint64_t v24 = (char *)&v154 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F2C0);
  uint64_t v194 = *(void *)(v198 - 8);
  MEMORY[0x270FA5388](v198);
  v192 = (char *)&v154 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F2C8);
  MEMORY[0x270FA5388](v155);
  uint64_t v27 = (char *)&v154 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F2D0);
  uint64_t v28 = MEMORY[0x270FA5388](v160);
  uint64_t v195 = (uint64_t)&v154 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v158 = (uint64_t)&v154 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v199 = (uint64_t)&v154 - v32;
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v33 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v34 = objc_msgSend(self, sel_mainBundle);
  }
  id v35 = v33;
  uint64_t v36 = sub_247750758();
  uint64_t v38 = v37;
  char v40 = v39;
  uint64_t v42 = v41;
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)&long long v203 = v36;
  *((void *)&v203 + 1) = v38;
  LOBYTE(v204) = v40 & 1;
  uint64_t v205 = v42;
  uint64_t v206 = KeyPath;
  char v207 = 1;
  sub_247750528();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F2D8);
  sub_247715BE8();
  uint64_t v44 = (uint64_t)v159;
  sub_247750818();
  (*(void (**)(char *, uint64_t))(v156 + 8))(v20, v157);
  sub_247712AA0(v203, *((uint64_t *)&v203 + 1), v204);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v45 = sub_2477506E8();
  uint64_t v46 = swift_getKeyPath();
  sub_2477129D0(v44, (uint64_t)v24, &qword_26925F2B0);
  v47 = (uint64_t *)&v24[*(int *)(v193 + 36)];
  uint64_t *v47 = v46;
  v47[1] = v45;
  sub_247712A34(v44, &qword_26925F2B0);
  sub_247715C90();
  uint64_t v48 = v192;
  sub_247750838();
  sub_247712A34((uint64_t)v24, &qword_26925F2B8);
  LOBYTE(v45) = sub_247750678();
  uint64_t v49 = v194;
  uint64_t v50 = v198;
  (*(void (**)(char *, char *, uint64_t))(v194 + 16))(v27, v48, v198);
  uint64_t v51 = &v27[*(int *)(v155 + 36)];
  *uint64_t v51 = v45;
  *(_OWORD *)(v51 + 8) = 0u;
  *(_OWORD *)(v51 + 24) = 0u;
  v51[40] = 1;
  (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v50);
  LOBYTE(v45) = sub_247750698();
  sub_247750258();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v60 = v158;
  sub_2477129D0((uint64_t)v27, v158, &qword_26925F2C8);
  uint64_t v61 = v60 + *(int *)(v160 + 36);
  *(unsigned char *)uint64_t v61 = v45;
  *(void *)(v61 + 8) = v53;
  *(void *)(v61 + 16) = v55;
  *(void *)(v61 + 24) = v57;
  *(void *)(v61 + 32) = v59;
  *(unsigned char *)(v61 + 40) = 0;
  sub_247712A34((uint64_t)v27, &qword_26925F2C8);
  sub_247715F70(v60, v199, &qword_26925F2D0);
  sub_2477504F8();
  v62 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v63 = objc_msgSend(self, sel_mainBundle);
  }
  id v64 = v62;
  uint64_t v198 = sub_247750758();
  uint64_t v193 = v65;
  LODWORD(v159) = v66;
  uint64_t v194 = v67;
  LODWORD(v160) = sub_247750688();
  v192 = (char *)swift_getKeyPath();
  v68 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v69 = (id)qword_269262028;
  }
  else
  {
    id v69 = objc_msgSend(self, sel_mainBundle);
    v68 = 0;
  }
  id v70 = v68;
  uint64_t v71 = sub_24774FE68();
  uint64_t v73 = v72;

  long long v208 = *(_OWORD *)(a1 + 40);
  uint64_t v209 = *(void *)(a1 + 56);
  long long v201 = *(_OWORD *)(a1 + 40);
  uint64_t v202 = *(void *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F320);
  sub_247750948();
  *(void *)&long long v203 = v71;
  *((void *)&v203 + 1) = v73;
  sub_247715DE0();
  uint64_t v74 = MEMORY[0x263F8D310];
  v75 = v161;
  sub_247750A08();
  v76 = v163;
  sub_2477502E8();
  uint64_t v77 = sub_247712AEC(&qword_26925F330, &qword_26925F268);
  v78 = v167;
  uint64_t v79 = v166;
  sub_2477507C8();
  (*(void (**)(char *, uint64_t))(v164 + 8))(v76, v165);
  (*(void (**)(char *, uint64_t))(v162 + 8))(v75, v79);
  uint64_t v80 = swift_allocObject();
  long long v81 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v80 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v80 + 96) = v81;
  *(void *)(v80 + 112) = *(void *)(a1 + 96);
  long long v82 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v80 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v80 + 32) = v82;
  long long v83 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v80 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v80 + 64) = v83;
  sub_247715B58(a1);
  v84 = v169;
  sub_247750378();
  *(void *)&long long v203 = v79;
  *((void *)&v203 + 1) = v77;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v86 = v171;
  uint64_t v87 = v170;
  sub_247750888();
  swift_release();
  (*(void (**)(char *, uint64_t))(v172 + 8))(v84, v173);
  (*(void (**)(char *, uint64_t))(v168 + 8))(v78, v87);
  long long v203 = v208;
  uint64_t v204 = v209;
  sub_247750928();
  long long v203 = v201;
  uint64_t v88 = swift_allocObject();
  long long v89 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v88 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v88 + 96) = v89;
  *(void *)(v88 + 112) = *(void *)(a1 + 96);
  long long v90 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v88 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v88 + 32) = v90;
  long long v91 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v88 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v88 + 64) = v91;
  sub_247715B58(a1);
  *(void *)&long long v201 = v87;
  *((void *)&v201 + 1) = OpaqueTypeConformance2;
  uint64_t v92 = swift_getOpaqueTypeConformance2();
  uint64_t v93 = MEMORY[0x263F8D338];
  v94 = v176;
  uint64_t v95 = v177;
  sub_247750878();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v174 + 8))(v86, v95);
  long long v201 = *(_OWORD *)(a1 + 64);
  LOBYTE(v202) = *(unsigned char *)(a1 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F258);
  sub_247750278();
  *(void *)&long long v203 = v95;
  *((void *)&v203 + 1) = v74;
  uint64_t v204 = v92;
  uint64_t v205 = v93;
  swift_getOpaqueTypeConformance2();
  v96 = v178;
  uint64_t v97 = v180;
  sub_247750858();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v179 + 8))(v94, v97);
  LOBYTE(v97) = sub_247750688();
  uint64_t v98 = v181;
  uint64_t v99 = (uint64_t)v185;
  uint64_t v100 = v183;
  (*(void (**)(uint64_t (*)(), char *, uint64_t))(v181 + 16))(v185, v96, v183);
  uint64_t v101 = v99 + *(int *)(v175 + 36);
  *(unsigned char *)uint64_t v101 = v97;
  *(_OWORD *)(v101 + 8) = 0u;
  *(_OWORD *)(v101 + 24) = 0u;
  *(unsigned char *)(v101 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v98 + 8))(v96, v100);
  v102 = self;
  uint64_t v103 = MEMORY[0x24C55B890](objc_msgSend(v102, sel_tertiarySystemFillColor));
  LOBYTE(v98) = sub_247750688();
  uint64_t v104 = v188;
  sub_2477129D0(v99, v188, &qword_26925F290);
  uint64_t v105 = v104 + *(int *)(v182 + 36);
  *(void *)uint64_t v105 = v103;
  *(unsigned char *)(v105 + 8) = v98;
  sub_247712A34(v99, &qword_26925F290);
  v106 = v197;
  v107 = (char *)v197 + *(int *)(v191 + 20);
  uint64_t v108 = *MEMORY[0x263F19860];
  uint64_t v109 = sub_247750518();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v109 - 8) + 104))(v107, v108, v109);
  __asm { FMOV            V0.2D, #12.0 }
  _OWORD *v106 = _Q0;
  uint64_t v115 = (uint64_t)v190;
  uint64_t v116 = (uint64_t)&v190[*(int *)(v184 + 36)];
  sub_247715EB0((uint64_t)v106, v116);
  *(_WORD *)(v116 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925F338) + 36)) = 256;
  sub_2477129D0(v104, v115, &qword_26925F298);
  sub_247715F14((uint64_t)v106);
  sub_247712A34(v104, &qword_26925F298);
  uint64_t v117 = swift_getKeyPath();
  uint64_t v118 = v186;
  sub_2477129D0(v115, v186, &qword_26925F2A0);
  uint64_t v119 = v118 + *(int *)(v187 + 36);
  *(void *)uint64_t v119 = v117;
  *(unsigned char *)(v119 + 8) = 1;
  sub_247712A34(v115, &qword_26925F2A0);
  sub_247715F70(v118, v200, &qword_26925F2A8);
  long long v203 = *(_OWORD *)(a1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F340);
  sub_247750928();
  uint64_t v191 = 0;
  uint64_t v120 = 0;
  uint64_t v121 = 0;
  v197 = 0;
  v122 = 0;
  uint64_t v123 = 0;
  uint64_t v124 = 0;
  v190 = 0;
  uint64_t v125 = 0;
  if (v201 == 1)
  {
    sub_2477504F8();
    v126 = (void *)qword_269262028;
    if (!qword_269262028) {
      id v127 = objc_msgSend(self, sel_mainBundle);
    }
    id v128 = v126;
    uint64_t v191 = sub_247750758();
    uint64_t v120 = v129;
    v197 = (_OWORD *)v130;
    uint64_t v121 = v131 & 1;
    uint64_t v123 = MEMORY[0x24C55B890](objc_msgSend(v102, sel_secondaryLabelColor));
    v190 = (char *)sub_247750728();
    uint64_t v124 = swift_getKeyPath();
    uint64_t v125 = swift_getKeyPath();
    v122 = sub_247715340;
  }
  uint64_t v182 = v124;
  uint64_t v186 = v123;
  uint64_t v187 = v125;
  int v132 = v159 & 1;
  uint64_t v133 = v195;
  v185 = v122;
  sub_2477129D0(v199, v195, &qword_26925F2D0);
  uint64_t v134 = v196;
  sub_2477129D0(v200, v196, &qword_26925F2A8);
  uint64_t v135 = v133;
  uint64_t v136 = v121;
  uint64_t v184 = v121;
  uint64_t v137 = v189;
  sub_2477129D0(v135, v189, &qword_26925F2D0);
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F348);
  uint64_t v139 = v120;
  uint64_t v183 = v120;
  uint64_t v140 = v138;
  uint64_t v141 = v137 + *(int *)(v138 + 48);
  uint64_t v142 = v193;
  *(void *)uint64_t v141 = v198;
  *(void *)(v141 + 8) = v142;
  *(unsigned char *)(v141 + 16) = v132;
  LODWORD(v188) = v132;
  *(void *)(v141 + 24) = v194;
  *(unsigned char *)(v141 + 32) = v160;
  *(_OWORD *)(v141 + 40) = 0u;
  *(_OWORD *)(v141 + 56) = 0u;
  *(unsigned char *)(v141 + 72) = 1;
  *(void *)(v141 + 80) = v192;
  *(unsigned char *)(v141 + 88) = 1;
  sub_2477129D0(v134, v137 + *(int *)(v138 + 64), &qword_26925F2A8);
  uint64_t v143 = v137 + *(int *)(v140 + 80);
  v144 = v190;
  uint64_t v145 = v191;
  *(void *)uint64_t v143 = v191;
  *(void *)(v143 + 8) = v139;
  uint64_t v146 = (uint64_t)v197;
  *(void *)(v143 + 16) = v136;
  *(void *)(v143 + 24) = v146;
  *(void *)(v143 + 32) = v122;
  *(void *)(v143 + 40) = 0;
  *(void *)(v143 + 48) = 0;
  *(void *)(v143 + 56) = 0;
  uint64_t v147 = v182;
  *(void *)(v143 + 64) = v186;
  *(void *)(v143 + 72) = v147;
  uint64_t v148 = v187;
  *(void *)(v143 + 80) = v144;
  *(void *)(v143 + 88) = v148;
  *(unsigned char *)(v143 + 96) = 0;
  uint64_t v149 = v137 + *(int *)(v140 + 96);
  *(void *)uint64_t v149 = 0;
  *(unsigned char *)(v149 + 8) = 1;
  sub_247712A90(v198, v142, v132);
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v150 = v183;
  LOBYTE(v132) = v184;
  uint64_t v151 = (uint64_t)v197;
  uint64_t v152 = (uint64_t)v185;
  sub_247715FD4(v145, v183, v184, (uint64_t)v197, (uint64_t)v185, 0, 0);
  sub_247712A34(v200, &qword_26925F2A8);
  sub_247712A34(v199, &qword_26925F2D0);
  sub_247716098(v145, v150, v132, v151, v152, 0, 0);
  sub_247712A34(v196, &qword_26925F2A8);
  sub_247712AA0(v198, v193, v188);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_247712A34(v195, &qword_26925F2D0);
}

uint64_t sub_247714E54(uint64_t a1)
{
  uint64_t v2 = sub_24774FE28();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v17 = *(_OWORD *)(a1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F340);
  uint64_t result = sub_247750928();
  if ((v19 & 1) == 0)
  {
    long long v17 = *(_OWORD *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 56);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F320);
    sub_247750928();
    long long v7 = v19;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v8 = HIBYTE(*((void *)&v7 + 1)) & 0xFLL;
    if ((*((void *)&v7 + 1) & 0x2000000000000000) == 0) {
      uint64_t v8 = v7 & 0xFFFFFFFFFFFFLL;
    }
    if (v8)
    {
      uint64_t v9 = (long long *)(a1 + 40);
      long long v19 = *(_OWORD *)(a1 + 24);
      uint64_t v10 = *((void *)&v19 + 1);
      long long v17 = *v9;
      uint64_t v18 = *((void *)v9 + 2);
      swift_retain();
      sub_247750928();
      long long v17 = v16;
      sub_24774FE18();
      sub_247715DE0();
      uint64_t v11 = sub_247750D28();
      uint64_t v13 = v12;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v14 = v10 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
      swift_beginAccess();
      uint64_t v15 = (uint64_t *)(v14 + *(int *)(type metadata accessor for AdaptiveVoiceShortcut() + 20));
      *uint64_t v15 = v11;
      v15[1] = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2477161FC((uint64_t)&v19);
      swift_retain();
      sub_24772E4C8();
      return sub_2477161FC((uint64_t)&v19);
    }
  }
  return result;
}

uint64_t sub_247715068(uint64_t a1)
{
  uint64_t v2 = sub_24774FE28();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v12 = *(_OWORD *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F320);
  sub_247750928();
  long long v12 = v14;
  sub_24774FE18();
  sub_247715DE0();
  sub_247750D28();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRelease();
  type metadata accessor for AVSCommandNameViewModel();
  sub_2477161B4(&qword_26925F370, v6, (void (*)(uint64_t))type metadata accessor for AVSCommandNameViewModel);
  long long v7 = *(void **)(sub_2477502B8() + 16);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v8 = sub_247750B38();
  uint64_t v10 = v9;
  swift_bridgeObjectRelease();
  LOBYTE(v8) = sub_247715278(v8, v10, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v12 = *(_OWORD *)(a1 + 88);
  LOBYTE(v14) = v8 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F340);
  return sub_247750938();
}

uint64_t sub_247715278(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_247750FD8();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_247750FD8() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247715340()
{
  uint64_t v0 = sub_247750A58();
  uint64_t v15 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_247750A88();
  uint64_t v13 = *(void *)(v3 - 8);
  uint64_t v14 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_247750AA8();
  uint64_t v6 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24771615C();
  uint64_t v9 = (void *)sub_247750CA8();
  sub_247750A98();
  aBlock[4] = sub_247715680;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2477319C4;
  aBlock[3] = &block_descriptor;
  uint64_t v10 = _Block_copy(aBlock);
  sub_247750A78();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2477161B4((unint64_t *)&qword_26925F358, 255, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F360);
  sub_247712AEC((unint64_t *)&qword_26925F368, &qword_26925F360);
  sub_247750D68();
  MEMORY[0x24C55BC90](v8, v5, v2, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v12);
}

void sub_247715680()
{
  UIAccessibilityNotifications v0 = *MEMORY[0x263F83188];
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v2 = (id)qword_269262028;
  }
  else
  {
    id v2 = objc_msgSend(self, sel_mainBundle);
    uint64_t v1 = 0;
  }
  id v3 = v1;
  sub_24774FE68();

  id argument = (id)sub_247750AF8();
  swift_bridgeObjectRelease();
  UIAccessibilityPostNotification(v0, argument);
}

uint64_t sub_2477157BC(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 96) = v3;
  *(void *)(v2 + 112) = *(void *)(a1 + 96);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  sub_247715B58(a1);

  return sub_247750958();
}

uint64_t sub_24771587C(uint64_t a1)
{
  uint64_t v1 = (void (**)(uint64_t))(*(void *)(a1 + 32)
                                     + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = swift_retain();
  v2(v3);
  return swift_release();
}

uint64_t sub_2477158EC@<X0>(uint64_t a1@<X8>)
{
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v3 = objc_msgSend(self, sel_mainBundle);
  }
  id v4 = v2;
  uint64_t result = sub_247750758();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_247715A00@<X0>(uint64_t a1@<X8>)
{
  return sub_247713290(a1);
}

uint64_t sub_247715A4C@<X0>(uint64_t a1@<X8>)
{
  return sub_24771357C(*(void *)(v1 + 16), a1);
}

unint64_t sub_247715A54()
{
  unint64_t result = qword_26925F220;
  if (!qword_26925F220)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F218);
    sub_247712AEC(&qword_26925F228, &qword_26925F230);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F220);
  }
  return result;
}

uint64_t sub_247715AF4()
{
  return sub_2477157BC(*(void *)(v0 + 16));
}

uint64_t sub_247715B00()
{
  return sub_247750268();
}

uint64_t sub_247715B58(uint64_t a1)
{
  return a1;
}

uint64_t sub_247715BD8()
{
  return sub_24771587C(v0 + 16);
}

unint64_t sub_247715BE8()
{
  unint64_t result = qword_26925F2E0;
  if (!qword_26925F2E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F2D8);
    sub_247712AEC(&qword_26925F2E8, &qword_26925F2F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F2E0);
  }
  return result;
}

unint64_t sub_247715C90()
{
  unint64_t result = qword_26925F2F8;
  if (!qword_26925F2F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F2B8);
    sub_247715D30();
    sub_247712AEC(&qword_26925F310, &qword_26925F318);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F2F8);
  }
  return result;
}

unint64_t sub_247715D30()
{
  unint64_t result = qword_26925F300;
  if (!qword_26925F300)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F2B0);
    sub_247715BE8();
    sub_2477161B4(&qword_26925F308, 255, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F300);
  }
  return result;
}

unint64_t sub_247715DE0()
{
  unint64_t result = qword_26925F328;
  if (!qword_26925F328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F328);
  }
  return result;
}

uint64_t sub_247715E38()
{
  return sub_247714E54(v0 + 16);
}

uint64_t objectdestroyTm()
{
  sub_247712E94();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_247715EA8()
{
  return sub_247715068(v0 + 16);
}

uint64_t sub_247715EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2477503A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247715F14(uint64_t a1)
{
  uint64_t v2 = sub_2477503A8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247715F70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_247715FD4(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4)
  {
    sub_247712A90(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    sub_247716088(a5);
    sub_247716088(a7);
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_247716088(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_247716098(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a4)
  {
    sub_247712AA0(result, a2, a3 & 1);
    swift_bridgeObjectRelease();
    sub_24771614C(a5);
    sub_24771614C(a7);
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_24771614C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_24771615C()
{
  unint64_t result = qword_26925F350;
  if (!qword_26925F350)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26925F350);
  }
  return result;
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

uint64_t sub_2477161B4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2477161FC(uint64_t a1)
{
  return a1;
}

void *sub_247716228(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F378);
  id v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_247716310((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_247716510();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_247716310(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
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
    uint64_t v20 = (void *)(*(void *)(a4 + 56) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
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
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
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
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_247716510()
{
  return swift_release();
}

unint64_t sub_247716520()
{
  unint64_t result = qword_26925F380;
  if (!qword_26925F380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F250);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F208);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F238);
    sub_247712AEC(&qword_26925F240, &qword_26925F208);
    sub_247712AEC(&qword_26925F248, &qword_26925F238);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F380);
  }
  return result;
}

uint64_t sub_247716644()
{
  return sub_247716680();
}

uint64_t sub_247716658()
{
  return sub_247716680();
}

uint64_t sub_24771666C()
{
  return sub_247716680();
}

uint64_t sub_247716680()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2477166EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F540);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__siriShortcuts;
  uint64_t v7 = MEMORY[0x263F8EE78];
  aBlock[0] = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3B8);
  sub_2477501D8();
  uint64_t v8 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  v8(v6, v5, v2);
  uint64_t v9 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__axShortcuts;
  aBlock[0] = v7;
  sub_2477501D8();
  v8(v9, v5, v2);
  uint64_t v10 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__systemShortcuts;
  aBlock[0] = v7;
  sub_2477501D8();
  v8(v10, v5, v2);
  id v11 = objc_msgSend(self, sel_standardClient);
  uint64_t v12 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_24771F380;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2477174F4;
  aBlock[3] = &block_descriptor_80;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v11, sel_getVoiceShortcutsWithCompletion_, v13);
  _Block_release(v13);

  if (qword_26925F148 != -1) {
    swift_once();
  }
  uint64_t v14 = *(void *)(qword_269262030 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  unint64_t v15 = (void (*)(void *, void))sub_247750208();
  sub_247717344(v14);
  v15(aBlock, 0);
  swift_release();
  swift_release();
  uint64_t v16 = *(void *)(qword_269262030 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  int64_t v17 = (void (*)(void *, void))sub_247750208();
  sub_247717344(v16);
  v17(aBlock, 0);
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_247716A68(unint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v65 = a3;
  uint64_t v5 = sub_247750158();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v73 = v5;
  uint64_t v74 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v72 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24774FF68();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (uint8_t *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for AvailableShortcutAction();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v64 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F550);
  uint64_t result = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v23 = v73;
    uint64_t v24 = __swift_project_value_buffer(v73, (uint64_t)qword_26925F898);
    swift_beginAccess();
    uint64_t v25 = v74;
    uint64_t v26 = v72;
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v72, v24, v23);
    id v27 = a2;
    id v28 = a2;
    uint64_t v29 = sub_247750138();
    os_log_type_t v30 = sub_247750C68();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v75 = (uint64_t)a2;
      uint64_t v76 = v32;
      *(_DWORD *)uint64_t v31 = 136315138;
      uint64_t v71 = v31 + 4;
      id v33 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F568);
      uint64_t v34 = sub_247750B28();
      uint64_t v75 = sub_247745AC4(v34, v35, &v76);
      sub_247750CF8();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24770E000, v29, v30, "Error retrieving known shortcuts names: %s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C55C7C0](v32, -1, -1);
      MEMORY[0x24C55C7C0](v31, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v26, v23);
  }
  else
  {
    uint64_t v72 = v18;
    uint64_t v73 = v12;
    uint64_t v74 = v13;
    if (a1)
    {
      uint64_t v71 = v11;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v36 = sub_247750E88();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v36 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v37 = MEMORY[0x263F8EE78];
      if (v36)
      {
        uint64_t v70 = v8;
        id v64 = v22;
        uint64_t v77 = MEMORY[0x263F8EE78];
        uint64_t result = sub_24771EA98(0, v36 & ~(v36 >> 63), 0);
        if (v36 < 0)
        {
          __break(1u);
          return result;
        }
        uint64_t v38 = 0;
        int v66 = (void (**)(char *, uint64_t))(v9 + 8);
        unint64_t v67 = a1 & 0xC000000000000001;
        char v39 = (void (**)(char *, uint8_t *, uint64_t))(v9 + 32);
        uint64_t v68 = v36;
        unint64_t v69 = a1;
        do
        {
          if (v67) {
            id v40 = (id)MEMORY[0x24C55BDE0](v38, a1);
          }
          else {
            id v40 = *(id *)(a1 + 8 * v38 + 32);
          }
          uint64_t v41 = v40;
          id v42 = objc_msgSend(v40, sel_shortcutName);
          uint64_t v43 = sub_247750B08();
          uint64_t v45 = v44;

          id v46 = objc_msgSend(v41, sel_identifier);
          uint64_t v47 = sub_247750B08();
          uint64_t v49 = v48;

          uint64_t v50 = v71;
          sub_24774FF58();
          sub_24774FF58();
          uint64_t v51 = v70;
          (*v66)(v16, v70);
          (*v39)(v16, v50, v51);
          uint64_t v53 = (uint64_t)v72;
          uint64_t v52 = v73;
          uint64_t v54 = (uint64_t *)&v16[*(int *)(v73 + 20)];
          *uint64_t v54 = v43;
          v54[1] = v45;
          uint64_t v55 = &v16[*(int *)(v52 + 24)];
          *(void *)uint64_t v55 = v47;
          *((void *)v55 + 1) = v49;
          v55[16] = 0;
          sub_24771E2AC((uint64_t)v16, v53, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);

          uint64_t v37 = v77;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_24771EA98(0, *(void *)(v37 + 16) + 1, 1);
            uint64_t v37 = v77;
          }
          uint64_t v56 = v74;
          unint64_t v58 = *(void *)(v37 + 16);
          unint64_t v57 = *(void *)(v37 + 24);
          a1 = v69;
          if (v58 >= v57 >> 1)
          {
            sub_24771EA98(v57 > 1, v58 + 1, 1);
            uint64_t v56 = v74;
            uint64_t v37 = v77;
          }
          ++v38;
          *(void *)(v37 + 16) = v58 + 1;
          sub_24771E2AC(v53, v37+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v58, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        }
        while (v68 != v38);
        uint64_t v22 = v64;
        uint64_t v59 = v65;
      }
      else
      {
        uint64_t v59 = v65;
      }
      uint64_t v60 = sub_247750C38();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v22, 1, 1, v60);
      sub_247750C08();
      swift_retain();
      uint64_t v61 = sub_247750BF8();
      v62 = (void *)swift_allocObject();
      uint64_t v63 = MEMORY[0x263F8F500];
      v62[2] = v61;
      v62[3] = v63;
      v62[4] = v59;
      v62[5] = v37;
      sub_247740D0C((uint64_t)v22, (uint64_t)&unk_26925F560, (uint64_t)v62);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_247717178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[10] = a4;
  v5[11] = a5;
  v5[9] = a1;
  sub_247750C08();
  v5[12] = sub_247750BF8();
  uint64_t v7 = sub_247750BE8();
  return MEMORY[0x270FA2498](sub_247717214, v7, v6);
}

uint64_t sub_247717214()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = *(void *)(v0 + 88);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    uint64_t v3 = (void (*)(uint64_t, void))sub_247750208();
    sub_247717344(v2);
    v3(v0 + 16, 0);
    swift_release();
    swift_release();
    swift_release();
  }
  **(unsigned char **)(v0 + 72) = Strong == 0;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_247717344(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_24772141C(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(type metadata accessor for AvailableShortcutAction() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_2477174F4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  int64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_24771F388(0, &qword_26925F548);
    uint64_t v4 = sub_247750B98();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_247717598()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__siriShortcuts;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F540);
  unint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__axShortcuts, v2);
  v3(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts33AVSCommandShortcutActionViewModel__systemShortcuts, v2);
  uint64_t v4 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v4, v5);
}

uint64_t sub_247717688()
{
  return type metadata accessor for AVSCommandShortcutActionViewModel(0);
}

uint64_t type metadata accessor for AVSCommandShortcutActionViewModel(uint64_t a1)
{
  return sub_2477183B0(a1, (uint64_t *)&unk_26925F3A0);
}

void sub_2477176B0()
{
  sub_2477184C0(319, &qword_26925F3B0, &qword_26925F3B8, MEMORY[0x263EFDE58]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void *sub_247717768(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = a2[1];
    void *v4 = *a2;
    v4[1] = v7;
    uint64_t v8 = a2[2];
    uint64_t v9 = a2[3];
    char v10 = *((unsigned char *)a2 + 32);
    swift_retain();
    sub_247712E28();
    v4[2] = v8;
    v4[3] = v9;
    *((unsigned char *)v4 + 32) = v10;
    uint64_t v11 = a2[6];
    v4[5] = a2[5];
    v4[6] = v11;
    v4[7] = a2[7];
    uint64_t v12 = *(int *)(a3 + 28);
    __dst = (char *)v4 + v12;
    unint64_t v13 = (char *)a2 + v12;
    uint64_t v14 = sub_24774FF68();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    swift_retain();
    if (v16(v13, 1, v14))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
      unint64_t v18 = __dst;
      memcpy(__dst, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      unint64_t v18 = __dst;
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(__dst, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(__dst, 0, 1, v14);
    }
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
    *(void *)&v18[*(int *)(v20 + 28)] = *(void *)&v13[*(int *)(v20 + 28)];
    uint64_t v21 = *(int *)(a3 + 32);
    uint64_t v22 = (char *)v4 + v21;
    int64_t v23 = (char *)a2 + v21;
    *uint64_t v22 = *v23;
    *((void *)v22 + 1) = *((void *)v23 + 1);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_247717978(uint64_t a1, uint64_t a2)
{
  swift_release();
  sub_247712E94();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_24774FF68();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  swift_release();

  return swift_release();
}

uint64_t sub_247717A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  char v9 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_247712E28();
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = v9;
  uint64_t v10 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v23 = a3;
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = (char *)(a1 + v11);
  unint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = sub_24774FF68();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  swift_retain();
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  *(void *)&v12[*(int *)(v18 + 28)] = *(void *)&v13[*(int *)(v18 + 28)];
  uint64_t v19 = *(int *)(v23 + 32);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(unsigned char *)uint64_t v20 = *(unsigned char *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_247717C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  sub_247712E28();
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  sub_247712E94();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = sub_24774FF68();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  *(void *)&v10[*(int *)(v18 + 28)] = *(void *)&v11[*(int *)(v18 + 28)];
  swift_retain();
  swift_release();
  uint64_t v19 = *(int *)(a3 + 32);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(unsigned char *)uint64_t v20 = *(unsigned char *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_247717E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v7 = *(int *)(a3 + 28);
  char v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = sub_24774FF68();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  *(void *)&v8[*(int *)(v13 + 28)] = *(void *)&v9[*(int *)(v13 + 28)];
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_247717FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_release();
  char v7 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = v7;
  sub_247712E94();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = sub_24774FF68();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  *(void *)&v10[*(int *)(v18 + 28)] = *(void *)&v11[*(int *)(v18 + 28)];
  swift_release();
  uint64_t v19 = *(int *)(a3 + 32);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  *(unsigned char *)uint64_t v20 = *(unsigned char *)v21;
  *(void *)(v20 + 8) = *(void *)(v21 + 8);
  swift_release();
  return a1;
}

uint64_t sub_247718208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24771821C);
}

uint64_t sub_24771821C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2477182D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2477182E4);
}

uint64_t sub_2477182E4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for AVSCommandShortcutActionView(uint64_t a1)
{
  return sub_2477183B0(a1, (uint64_t *)&unk_26925F3D0);
}

uint64_t sub_2477183B0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2477183E8()
{
  sub_2477184C0(319, &qword_26925F3E0, &qword_26925F3C0, MEMORY[0x263F1B5D0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2477184C0(uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_247718520@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AVSCommandShortcutActionViewModel(0);
  uint64_t result = sub_2477501C8();
  *a1 = result;
  return result;
}

uint64_t sub_247718560()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24771857C()
{
  type metadata accessor for AVSCommandShortcutActionViewModel(0);
  uint64_t v0 = swift_allocObject();
  sub_2477166EC();
  return v0;
}

uint64_t sub_2477185B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v61 = a1;
  uint64_t v2 = sub_247750498();
  uint64_t v59 = *(void *)(v2 - 8);
  uint64_t v60 = v2;
  MEMORY[0x270FA5388](v2);
  unint64_t v58 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = sub_247750588();
  uint64_t v44 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_247750598();
  uint64_t v47 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3E8);
  uint64_t v46 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3F0);
  uint64_t v49 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3F8);
  uint64_t v51 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  uint64_t v43 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F400);
  uint64_t v56 = *(void *)(v15 - 8);
  uint64_t v57 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v53 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F408);
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v50 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F410);
  sub_247712AEC(&qword_26925F418, &qword_26925F410);
  sub_247750738();
  uint64_t v42 = v1;
  uint64_t v18 = *(void *)(v1 + 56);
  long long v64 = *(_OWORD *)(v1 + 40);
  uint64_t v65 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F320);
  sub_247750948();
  sub_247750578();
  sub_247750568();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v5, v45);
  uint64_t v41 = sub_247712AEC(&qword_26925F420, &qword_26925F3E8);
  sub_2477507A8();
  swift_bridgeObjectRelease();
  uint64_t v19 = v43;
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v48);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v10, v8);
  uint64_t v62 = v42;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F238);
  uint64_t v66 = v8;
  uint64_t v67 = v41;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v22 = sub_247712AEC(&qword_26925F248, &qword_26925F238);
  sub_247750868();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v49 + 8);
  uint64_t v49 = v11;
  v23(v13, v11);
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v24 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v25 = objc_msgSend(self, sel_mainBundle);
  }
  id v26 = v24;
  uint64_t v27 = sub_247750758();
  uint64_t v29 = v28;
  uint64_t v66 = v49;
  uint64_t v67 = v20;
  char v31 = v30 & 1;
  uint64_t v68 = OpaqueTypeConformance2;
  uint64_t v69 = v22;
  uint64_t v32 = swift_getOpaqueTypeConformance2();
  id v33 = v53;
  uint64_t v34 = v55;
  sub_2477507E8();
  sub_247712AA0(v27, v29, v31);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v51 + 8))(v19, v34);
  uint64_t v36 = v58;
  uint64_t v35 = v59;
  uint64_t v37 = v60;
  (*(void (**)(char *, void, uint64_t))(v59 + 104))(v58, *MEMORY[0x263F19698], v60);
  uint64_t v66 = v34;
  uint64_t v67 = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v38 = v50;
  uint64_t v39 = v57;
  sub_247750828();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v37);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v33, v39);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v52 + 32))(v61, v38, v54);
}

uint64_t sub_247718EDC@<X0>(char *a1@<X8>)
{
  uint64_t v99 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F428);
  uint64_t v104 = *(void *)(v1 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  v94 = (char *)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v93 = (char *)&v89 - v5;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v95 = (char *)&v89 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v92 = (char *)&v89 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  long long v91 = (char *)&v89 - v11;
  MEMORY[0x270FA5388](v10);
  long long v90 = (char *)&v89 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F430);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v98 = (uint64_t)&v89 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v97 = (uint64_t)&v89 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v103 = (uint64_t)&v89 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v100 = (char *)&v89 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v89 - v23;
  MEMORY[0x270FA5388](v22);
  v106 = (char *)&v89 - v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F438);
  uint64_t v101 = *(void *)(v26 - 8);
  uint64_t v102 = v26;
  uint64_t v27 = MEMORY[0x270FA5388](v26);
  v96 = (char *)&v89 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  char v31 = (char *)&v89 - v30;
  MEMORY[0x270FA5388](v29);
  uint64_t v105 = (char *)&v89 - v32;
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  id v33 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v34 = objc_msgSend(self, sel_mainBundle);
  }
  id v35 = v33;
  uint64_t v111 = sub_247750758();
  uint64_t v112 = v36;
  char v113 = v37 & 1;
  uint64_t v114 = v38;
  MEMORY[0x270FA5388](v111);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F440);
  sub_24771DDB0();
  sub_2477509A8();
  (*(void (**)(char *, char *, uint64_t))(v101 + 32))(v105, v31, v102);
  uint64_t v39 = *(void *)(sub_24771A360((uint64_t)&unk_2477520C8, (uint64_t)&unk_2477520F0, (uint64_t (*)(char *))sub_24771EF44)+ 16);
  swift_bridgeObjectRelease();
  if (v39)
  {
    sub_2477504F8();
    id v40 = (void *)qword_269262028;
    if (!qword_269262028) {
      id v41 = objc_msgSend(self, sel_mainBundle);
    }
    id v42 = v40;
    uint64_t v107 = sub_247750758();
    uint64_t v108 = v43;
    char v109 = v44 & 1;
    uint64_t v110 = v45;
    MEMORY[0x270FA5388](v107);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F480);
    sub_24771DF20();
    uint64_t v46 = v91;
    sub_2477509A8();
    uint64_t v47 = v104;
    uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v104 + 32);
    uint64_t v49 = v90;
    v48(v90, v46, v1);
    uint64_t v50 = (uint64_t)v106;
    v48(v106, v49, v1);
    uint64_t v51 = *(char **)(v47 + 56);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v51)(v50, 0, 1, v1);
  }
  else
  {
    uint64_t v51 = *(char **)(v104 + 56);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v51)(v106, 1, 1, v1);
  }
  uint64_t v52 = *(void *)(sub_24771A360((uint64_t)&unk_247752080, (uint64_t)&unk_2477520A8, (uint64_t (*)(char *))sub_24771FEAC)+ 16);
  swift_bridgeObjectRelease();
  if (v52)
  {
    uint64_t v53 = v51;
    sub_2477504F8();
    uint64_t v54 = (void *)qword_269262028;
    if (!qword_269262028) {
      id v55 = objc_msgSend(self, sel_mainBundle);
    }
    id v56 = v54;
    uint64_t v107 = sub_247750758();
    uint64_t v108 = v57;
    char v109 = v58 & 1;
    uint64_t v110 = v59;
    MEMORY[0x270FA5388](v107);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F480);
    sub_24771DF20();
    uint64_t v60 = (uint64_t)v95;
    sub_2477509A8();
    uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v104 + 32);
    uint64_t v62 = v92;
    v61(v92, v60, v1);
    v61(v24, (uint64_t)v62, v1);
    uint64_t v63 = 0;
    uint64_t v51 = v53;
  }
  else
  {
    uint64_t v63 = 1;
  }
  uint64_t v95 = v24;
  uint64_t v64 = v1;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v51)(v24, v63, 1, v1);
  uint64_t v65 = *(void *)(sub_24771A360((uint64_t)&unk_247752038, (uint64_t)&unk_247752060, (uint64_t (*)(char *))sub_24771FEAC)+ 16);
  swift_bridgeObjectRelease();
  uint64_t v66 = v99;
  if (v65)
  {
    uint64_t v92 = v51;
    sub_2477504F8();
    uint64_t v67 = (void *)qword_269262028;
    if (!qword_269262028) {
      id v68 = objc_msgSend(self, sel_mainBundle);
    }
    id v69 = v67;
    uint64_t v107 = sub_247750758();
    uint64_t v108 = v70;
    char v109 = v71 & 1;
    uint64_t v110 = v72;
    MEMORY[0x270FA5388](v107);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F480);
    sub_24771DF20();
    uint64_t v73 = v94;
    sub_2477509A8();
    uint64_t v74 = *(void (**)(char *, char *, uint64_t))(v104 + 32);
    uint64_t v75 = v93;
    v74(v93, v73, v64);
    uint64_t v76 = (uint64_t)v100;
    v74(v100, v75, v64);
    uint64_t v66 = v99;
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v92)(v76, 0, 1, v64);
  }
  else
  {
    uint64_t v76 = (uint64_t)v100;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v51)(v100, 1, 1, v64);
  }
  uint64_t v78 = v101;
  uint64_t v77 = v102;
  uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v101 + 16);
  uint64_t v80 = v96;
  v79(v96, v105, v102);
  sub_2477129D0((uint64_t)v106, v103, &qword_26925F430);
  uint64_t v81 = (uint64_t)v95;
  uint64_t v82 = v97;
  sub_2477129D0((uint64_t)v95, v97, &qword_26925F430);
  uint64_t v83 = v76;
  uint64_t v84 = v98;
  sub_2477129D0(v83, v98, &qword_26925F430);
  v79(v66, v80, v77);
  v85 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26925F478);
  uint64_t v86 = v103;
  sub_2477129D0(v103, (uint64_t)&v66[v85[12]], &qword_26925F430);
  sub_2477129D0(v82, (uint64_t)&v66[v85[16]], &qword_26925F430);
  sub_2477129D0(v84, (uint64_t)&v66[v85[20]], &qword_26925F430);
  sub_247712A34((uint64_t)v100, &qword_26925F430);
  sub_247712A34(v81, &qword_26925F430);
  sub_247712A34((uint64_t)v106, &qword_26925F430);
  uint64_t v87 = *(void (**)(char *, uint64_t))(v78 + 8);
  v87(v105, v77);
  sub_247712A34(v84, &qword_26925F430);
  sub_247712A34(v82, &qword_26925F430);
  sub_247712A34(v86, &qword_26925F430);
  return ((uint64_t (*)(char *, uint64_t))v87)(v80, v77);
}

uint64_t sub_247719AEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v33 = a1;
  uint64_t v3 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F450);
  uint64_t v32 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v26 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F520);
  uint64_t v30 = *(void *)(v9 - 8);
  uint64_t v31 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v27 = type metadata accessor for AVSCommandShortcutActionView;
  uint64_t v28 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24771E228(v2, (uint64_t)v7, type metadata accessor for AVSCommandShortcutActionView);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  sub_24771E2AC((uint64_t)v7, v12 + v11, type metadata accessor for AVSCommandShortcutActionView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F528);
  sub_247712AEC(&qword_26925F530, &qword_26925F528);
  uint64_t v13 = v26;
  sub_247750958();
  uint64_t v14 = v2 + *(int *)(v4 + 40);
  char v15 = *(unsigned char *)v14;
  uint64_t v16 = *(void *)(v14 + 8);
  char v34 = v15;
  uint64_t v35 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F340);
  sub_247750948();
  sub_24771E228(v2, (uint64_t)v7, v27);
  uint64_t v17 = swift_allocObject();
  sub_24771E2AC((uint64_t)v7, v17 + v11, type metadata accessor for AVSCommandShortcutActionView);
  sub_247712AEC(&qword_26925F458, &qword_26925F450);
  sub_24771DEC4();
  uint64_t v19 = v28;
  uint64_t v18 = v29;
  sub_247750848();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v18);
  uint64_t v20 = sub_2477508F8();
  uint64_t v22 = v30;
  uint64_t v21 = v31;
  uint64_t v23 = v33;
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 16))(v33, v19, v31);
  *(void *)(v23 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925F440) + 36)) = v20;
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v19, v21);
}

uint64_t sub_247719F20(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v8[1] = sub_24771A360((uint64_t)&unk_2477520C8, (uint64_t)&unk_2477520F0, (uint64_t (*)(char *))sub_24771EF44);
  swift_getKeyPath();
  sub_24771E228(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_24771E2AC((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AVSCommandShortcutActionView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F498);
  sub_247712AEC(&qword_26925F4B0, &qword_26925F3B8);
  sub_24771E3C0(&qword_26925F4B8, MEMORY[0x263F07508]);
  sub_24771DF94();
  return sub_247750998();
}

uint64_t sub_24771A140(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v8[1] = sub_24771A360((uint64_t)&unk_247752080, (uint64_t)&unk_2477520A8, (uint64_t (*)(char *))sub_24771FEAC);
  swift_getKeyPath();
  sub_24771E228(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_24771E2AC((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AVSCommandShortcutActionView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F498);
  sub_247712AEC(&qword_26925F4B0, &qword_26925F3B8);
  sub_24771E3C0(&qword_26925F4B8, MEMORY[0x263F07508]);
  sub_24771DF94();
  return sub_247750998();
}

uint64_t sub_24771A360(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *))
{
  uint64_t v5 = *(void *)(v3 + 56);
  long long v11 = *(_OWORD *)(v3 + 40);
  uint64_t v12 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F320);
  sub_247750928();
  swift_bridgeObjectRelease();
  if ((v14 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(v14) & 0xF;
  }
  else {
    uint64_t v6 = v13 & 0xFFFFFFFFFFFFLL;
  }
  type metadata accessor for AVSCommandShortcutActionViewModel(0);
  sub_24771E3C0(&qword_26925F510, (void (*)(uint64_t))type metadata accessor for AVSCommandShortcutActionViewModel);
  sub_2477502B8();
  swift_getKeyPath();
  swift_getKeyPath();
  if (v6)
  {
    sub_247750218();
    swift_release();
    swift_release();
    uint64_t v7 = swift_release();
    MEMORY[0x270FA5388](v7);
    v10[2] = v3;
    return sub_24771BE00(a3, (uint64_t)v10, v8);
  }
  else
  {
    sub_247750218();
    swift_release();
    swift_release();
    swift_release();
    return v11;
  }
}

uint64_t sub_24771A504(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  v8[1] = sub_24771A360((uint64_t)&unk_247752038, (uint64_t)&unk_247752060, (uint64_t (*)(char *))sub_24771FEAC);
  swift_getKeyPath();
  sub_24771E228(a1, (uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_24771E2AC((uint64_t)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AVSCommandShortcutActionView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F498);
  sub_247712AEC(&qword_26925F4B0, &qword_26925F3B8);
  sub_24771E3C0(&qword_26925F4B8, MEMORY[0x263F07508]);
  sub_24771DF94();
  return sub_247750998();
}

uint64_t sub_24771A724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  uint64_t v26 = a3;
  uint64_t v24 = a2;
  uint64_t v29 = a6;
  uint64_t v8 = type metadata accessor for AvailableShortcutAction();
  uint64_t v25 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v25 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4A8);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24771E228(a2, (uint64_t)v13, type metadata accessor for AVSCommandShortcutActionView);
  sub_24771E228(a1, (uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v19 = (v12 + *(unsigned __int8 *)(v25 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  uint64_t v20 = swift_allocObject();
  sub_24771E2AC((uint64_t)v13, v20 + v18, type metadata accessor for AVSCommandShortcutActionView);
  sub_24771E2AC((uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
  uint64_t v30 = a1;
  uint64_t v31 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4C0);
  sub_247712AEC(&qword_26925F4C8, &qword_26925F4C0);
  sub_247750958();
  uint64_t v21 = sub_2477508F8();
  uint64_t v22 = v29;
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v29, v17, v14);
  *(void *)(v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925F498) + 36)) = v21;
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_24771AA44(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_24771E228(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_24771E2AC((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, type metadata accessor for AVSCommandShortcutActionView);
  return sub_247750958();
}

uint64_t sub_24771AB98(uint64_t a1)
{
  uint64_t v1 = (void (**)(uint64_t))(*(void *)(a1 + 8)
                                     + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = swift_retain();
  v2(v3);
  return swift_release();
}

uint64_t sub_24771AC08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v12 - v7;
  uint64_t v9 = sub_24774FF68();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a2, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  type metadata accessor for AVSCommandShortcutActionView(0);
  sub_2477129D0((uint64_t)v8, (uint64_t)v6, &qword_26925F3C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  sub_247750938();
  sub_247712A34((uint64_t)v8, &qword_26925F3C0);
  return sub_24771AD7C(a2);
}

uint64_t sub_24771AD7C(uint64_t a1)
{
  uint64_t v36 = sub_247750A58();
  uint64_t v39 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v35 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_247750A88();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v4);
  char v34 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v33 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = sub_247750AA8();
  uint64_t v32 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v31 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(v1 + 8);
  sub_24771E228(a1, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
  uint64_t v19 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 0, 1, v19);
  uint64_t v20 = v18 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  uint64_t v21 = v20 + *(int *)(type metadata accessor for AdaptiveVoiceShortcut() + 28);
  swift_retain();
  sub_24771E408((uint64_t)v17, v21);
  swift_endAccess();
  swift_release();
  sub_24771F388(0, (unint64_t *)&qword_26925F350);
  uint64_t v22 = (void *)sub_247750CA8();
  sub_247750A98();
  MEMORY[0x24C55BAB0](v12, 0.5);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23(v12, v8);
  sub_24771E228(v31[1], (uint64_t)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  unint64_t v24 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v25 = swift_allocObject();
  sub_24771E2AC((uint64_t)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24, type metadata accessor for AVSCommandShortcutActionView);
  aBlock[4] = sub_24771E474;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2477319C4;
  aBlock[3] = &block_descriptor_0;
  uint64_t v26 = _Block_copy(aBlock);
  swift_release();
  uint64_t v27 = v34;
  sub_247750A78();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_24771E3C0((unint64_t *)&qword_26925F358, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F360);
  sub_247712AEC((unint64_t *)&qword_26925F368, &qword_26925F360);
  uint64_t v28 = v35;
  uint64_t v29 = v36;
  sub_247750D68();
  MEMORY[0x24C55BC90](v14, v27, v28, v26);
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v27, v38);
  return ((uint64_t (*)(char *, uint64_t))v23)(v14, v32);
}

uint64_t sub_24771B310@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = sub_2477504A8();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4D0);
  return sub_24771B370(a1, a2, a3 + *(int *)(v6 + 44));
}

uint64_t sub_24771B370@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v5 = sub_24774FF68();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v48 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4D8);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v50 = (uint64_t)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v47 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v47 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4E0);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v56 = (uint64_t)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  id v55 = (char *)&v47 - v23;
  unint64_t v24 = (uint64_t *)(a1 + *(int *)(type metadata accessor for AvailableShortcutAction() + 20));
  uint64_t v25 = v24[1];
  uint64_t v57 = *v24;
  uint64_t v58 = v25;
  sub_247715DE0();
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_247750768();
  uint64_t v52 = v27;
  uint64_t v53 = v26;
  int v51 = v28;
  uint64_t v54 = v29;
  type metadata accessor for AVSCommandShortcutActionView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  sub_247750928();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v17, a1, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v17, 0, 1, v5);
  uint64_t v30 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_2477129D0((uint64_t)v19, (uint64_t)v11, &qword_26925F3C0);
  sub_2477129D0((uint64_t)v17, v30, &qword_26925F3C0);
  uint64_t v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v31((uint64_t)v11, 1, v5) != 1)
  {
    sub_2477129D0((uint64_t)v11, v50, &qword_26925F3C0);
    if (v31(v30, 1, v5) != 1)
    {
      uint64_t v33 = v48;
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v48, v30, v5);
      sub_24771E3C0(&qword_26925F508, MEMORY[0x263F07508]);
      uint64_t v34 = v50;
      char v35 = sub_247750AE8();
      uint64_t v36 = *(void (**)(char *, uint64_t))(v6 + 8);
      v36(v33, v5);
      sub_247712A34((uint64_t)v17, &qword_26925F3C0);
      sub_247712A34((uint64_t)v19, &qword_26925F3C0);
      v36((char *)v34, v5);
      sub_247712A34((uint64_t)v11, &qword_26925F3C0);
      uint64_t v32 = (uint64_t)v55;
      if (v35) {
        goto LABEL_8;
      }
LABEL_9:
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4E8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v32, 1, 1, v40);
      goto LABEL_10;
    }
    sub_247712A34((uint64_t)v17, &qword_26925F3C0);
    sub_247712A34((uint64_t)v19, &qword_26925F3C0);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v50, v5);
LABEL_6:
    sub_247712A34((uint64_t)v11, &qword_26925F4D8);
    uint64_t v32 = (uint64_t)v55;
    goto LABEL_9;
  }
  sub_247712A34((uint64_t)v17, &qword_26925F3C0);
  sub_247712A34((uint64_t)v19, &qword_26925F3C0);
  if (v31(v30, 1, v5) != 1) {
    goto LABEL_6;
  }
  sub_247712A34((uint64_t)v11, &qword_26925F3C0);
  uint64_t v32 = (uint64_t)v55;
LABEL_8:
  uint64_t v37 = sub_247750908();
  uint64_t v38 = sub_2477508A8();
  uint64_t v57 = v37;
  uint64_t v58 = v38;
  sub_247750708();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4F8);
  sub_24771E320();
  sub_247750798();
  swift_release();
  swift_release();
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4E8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v32, 0, 1, v39);
LABEL_10:
  char v41 = v51 & 1;
  uint64_t v42 = v56;
  sub_2477129D0(v32, v56, &qword_26925F4E0);
  uint64_t v44 = v52;
  uint64_t v43 = v53;
  *(void *)a3 = v53;
  *(void *)(a3 + 8) = v44;
  *(unsigned char *)(a3 + 16) = v41;
  *(void *)(a3 + 24) = v54;
  *(void *)(a3 + 32) = 0;
  *(unsigned char *)(a3 + 40) = 1;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4F0);
  sub_2477129D0(v42, a3 + *(int *)(v45 + 64), &qword_26925F4E0);
  sub_247712A90(v43, v44, v41);
  swift_bridgeObjectRetain();
  sub_247712A34(v32, &qword_26925F4E0);
  sub_247712A34(v42, &qword_26925F4E0);
  sub_247712AA0(v43, v44, v41);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24771B9D4()
{
  return swift_release();
}

__n128 sub_24771BA78@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2477504A8();
  sub_24771BADC((uint64_t)&v8);
  char v3 = v9;
  uint64_t v4 = v10;
  uint64_t v5 = v11;
  char v6 = v12;
  __n128 result = v8;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 40) = v3;
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = v6;
  return result;
}

uint64_t sub_24771BADC@<X0>(uint64_t a1@<X8>)
{
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v3 = objc_msgSend(self, sel_mainBundle);
  }
  id v4 = v2;
  uint64_t v5 = sub_247750758();
  uint64_t v7 = v6;
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  char v9 = v8 & 1;
  *(unsigned char *)(a1 + 16) = v8 & 1;
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  sub_247712A90(v5, v6, v8 & 1);
  swift_bridgeObjectRetain();
  sub_247712AA0(v5, v7, v9);

  return swift_bridgeObjectRelease();
}

double sub_24771BC40@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = a1 + *(int *)(MEMORY[0x270FA5388](v4 - 8) + 40);
  char v8 = *(unsigned char *)v7;
  unint64_t v9 = *(void *)(v7 + 8);
  LOBYTE(v22) = v8;
  unint64_t v23 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F340);
  sub_247750948();
  long long v10 = v20;
  char v11 = v21;
  sub_24771E228(a1, (uint64_t)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSCommandShortcutActionView);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  sub_24771E2AC((uint64_t)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12, type metadata accessor for AVSCommandShortcutActionView);
  uint64_t v22 = 0;
  unint64_t v23 = 0xE000000000000000;
  sub_247750918();
  *(_OWORD *)uint64_t v19 = v20;
  uint64_t v14 = v21;
  char v15 = sub_247750288();
  double result = v19[0];
  *(_OWORD *)a2 = *(_OWORD *)v19;
  *(void *)(a2 + 16) = v14;
  *(unsigned char *)(a2 + 24) = v15 & 1;
  *(void *)(a2 + 32) = v17;
  *(unsigned char *)(a2 + 40) = v18 & 1;
  *(_OWORD *)(a2 + 48) = v10;
  *(unsigned char *)(a2 + 64) = v11;
  *(void *)(a2 + 72) = sub_24771EFF8;
  *(void *)(a2 + 80) = v13;
  return result;
}

uint64_t sub_24771BE00(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for AvailableShortcutAction();
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)v20 - v11;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v22 = *(void *)(a3 + 16);
  if (v22)
  {
    unint64_t v14 = 0;
    uint64_t v15 = MEMORY[0x263F8EE78];
    v20[1] = a2;
    uint64_t v21 = a3;
    v20[0] = a1;
    while (v14 < *(void *)(a3 + 16))
    {
      unint64_t v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      uint64_t v13 = *(void *)(v24 + 72);
      sub_24771E228(a3 + v16 + v13 * v14, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      char v17 = a1(v12);
      if (v3)
      {
        sub_24771FDA0((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if (v17)
      {
        sub_24771E2AC((uint64_t)v12, v23, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_24771EA98(0, *(void *)(v15 + 16) + 1, 1);
        }
        uint64_t v15 = v25;
        unint64_t v19 = *(void *)(v25 + 16);
        unint64_t v18 = *(void *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_24771EA98(v18 > 1, v19 + 1, 1);
          uint64_t v15 = v25;
        }
        *(void *)(v15 + 16) = v19 + 1;
        uint64_t result = sub_24771E2AC(v23, v15 + v16 + v19 * v13, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        uint64_t result = sub_24771FDA0((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      }
      if (v22 == ++v14)
      {
        uint64_t v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_24771C098()
{
  type metadata accessor for AvailableShortcutAction();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F320);
  sub_247750928();
  sub_247715DE0();
  char v0 = sub_247750D48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_24771C160()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v8 - v4;
  swift_retain();
  sub_24772E4C8();
  swift_release();
  uint64_t v6 = sub_24774FF68();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for AVSCommandShortcutActionView(0);
  sub_2477129D0((uint64_t)v5, (uint64_t)v3, &qword_26925F3C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  sub_247750938();
  return sub_247712A34((uint64_t)v5, &qword_26925F3C0);
}

uint64_t sub_24771C2A0@<X0>(char *a1@<X8>)
{
  return sub_247718EDC(a1);
}

uint64_t sub_24771C2A8()
{
  return sub_24771AA44(*(void *)(v0 + 16));
}

uint64_t sub_24771C2B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_247750548();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5A0);
  return sub_24771C300(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_24771C300@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v166 = a1;
  uint64_t v172 = a2;
  uint64_t v170 = sub_2477503A8();
  MEMORY[0x270FA5388](v170);
  v171 = (char *)&v126 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_247750C38();
  uint64_t v168 = *(void *)(v3 - 8);
  uint64_t v169 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v165 = (char *)&v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_247750388();
  uint64_t v158 = *(void *)(v159 - 8);
  MEMORY[0x270FA5388](v159);
  uint64_t v157 = (char *)&v126 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = sub_2477502F8();
  uint64_t v141 = *(void *)(v144 - 8);
  MEMORY[0x270FA5388](v144);
  uint64_t v140 = (char *)&v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F268);
  uint64_t v136 = *(void *)(v138 - 8);
  MEMORY[0x270FA5388](v138);
  uint64_t v135 = (char *)&v126 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5A8);
  uint64_t v139 = *(void *)(v142 - 8);
  MEMORY[0x270FA5388](v142);
  uint64_t v137 = (char *)&v126 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5B0);
  uint64_t v146 = *(void *)(v147 - 8);
  MEMORY[0x270FA5388](v147);
  uint64_t v143 = (char *)&v126 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5B8);
  uint64_t v151 = *(void *)(v153 - 8);
  MEMORY[0x270FA5388](v153);
  uint64_t v149 = (char *)&v126 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5C0);
  MEMORY[0x270FA5388](v145);
  uint64_t v150 = (char *)&v126 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5C8);
  MEMORY[0x270FA5388](v148);
  uint64_t v156 = (uint64_t)&v126 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v154 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5D0);
  MEMORY[0x270FA5388](v154);
  uint64_t v162 = (uint64_t)&v126 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5D8);
  MEMORY[0x270FA5388](v155);
  v163 = (char *)&v126 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5E0);
  uint64_t v15 = MEMORY[0x270FA5388](v161);
  uint64_t v167 = (uint64_t)&v126 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v160 = (uint64_t)&v126 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v164 = (uint64_t)&v126 - v19;
  uint64_t v128 = sub_247750538();
  uint64_t v127 = *(void *)(v128 - 8);
  MEMORY[0x270FA5388](v128);
  uint64_t v21 = (char *)&v126 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5E8);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v129 = (char *)&v126 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5F0);
  MEMORY[0x270FA5388](v132);
  uint64_t v25 = (char *)&v126 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5F8);
  uint64_t v133 = *(void *)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  char v131 = (char *)&v126 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F600);
  MEMORY[0x270FA5388](v126);
  int v28 = (char *)&v126 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F608);
  uint64_t v29 = MEMORY[0x270FA5388](v130);
  uint64_t v152 = (uint64_t)&v126 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  uint64_t v33 = (char *)&v126 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v173 = (uint64_t)&v126 - v34;
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  char v35 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v36 = objc_msgSend(self, sel_mainBundle);
  }
  id v37 = v35;
  uint64_t v176 = sub_247750758();
  uint64_t v177 = v38;
  LOBYTE(v178) = v39 & 1;
  uint64_t v179 = v40;
  sub_247750528();
  uint64_t v41 = (uint64_t)v129;
  sub_247750818();
  (*(void (**)(char *, uint64_t))(v127 + 8))(v21, v128);
  sub_247712AA0(v176, v177, v178);
  swift_bridgeObjectRelease();
  uint64_t v42 = sub_2477506E8();
  uint64_t KeyPath = swift_getKeyPath();
  sub_2477129D0(v41, (uint64_t)v25, &qword_26925F5E8);
  uint64_t v44 = (uint64_t *)&v25[*(int *)(v132 + 36)];
  *uint64_t v44 = KeyPath;
  v44[1] = v42;
  sub_247712A34(v41, &qword_26925F5E8);
  sub_24771F9E8();
  uint64_t v45 = v131;
  sub_247750838();
  sub_247712A34((uint64_t)v25, &qword_26925F5F0);
  LOBYTE(v42) = sub_247750678();
  uint64_t v46 = v133;
  uint64_t v47 = v134;
  (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v28, v45, v134);
  uint64_t v48 = &v28[*(int *)(v126 + 36)];
  *uint64_t v48 = v42;
  *(_OWORD *)(v48 + 8) = 0u;
  *(_OWORD *)(v48 + 24) = 0u;
  v48[40] = 1;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v45, v47);
  LOBYTE(v42) = sub_247750698();
  sub_247750258();
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  sub_2477129D0((uint64_t)v28, (uint64_t)v33, &qword_26925F600);
  uint64_t v57 = &v33[*(int *)(v130 + 36)];
  *uint64_t v57 = v42;
  *((void *)v57 + 1) = v50;
  *((void *)v57 + 2) = v52;
  *((void *)v57 + 3) = v54;
  *((void *)v57 + 4) = v56;
  v57[40] = 0;
  sub_247712A34((uint64_t)v28, &qword_26925F600);
  sub_247715F70((uint64_t)v33, v173, &qword_26925F608);
  sub_2477504F8();
  uint64_t v58 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v59 = objc_msgSend(self, sel_mainBundle);
  }
  id v60 = v58;
  uint64_t v133 = sub_247750758();
  uint64_t v132 = v61;
  char v63 = v62;
  uint64_t v134 = v64;
  LODWORD(v131) = sub_247750688();
  id v65 = v60;
  if (!v58) {
    id v65 = objc_msgSend(self, sel_mainBundle);
  }
  LODWORD(v130) = v63 & 1;
  id v66 = v60;
  uint64_t v67 = sub_24774FE68();
  uint64_t v69 = v68;

  uint64_t v70 = v166;
  long long v174 = *(_OWORD *)v166;
  uint64_t v175 = *(void *)(v166 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F320);
  sub_247750948();
  uint64_t v176 = v67;
  uint64_t v177 = v69;
  sub_247715DE0();
  char v71 = v135;
  sub_247750A08();
  long long v174 = *(_OWORD *)(v70 + 24);
  LOBYTE(v175) = *(unsigned char *)(v70 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F258);
  sub_247750278();
  uint64_t v72 = sub_247712AEC(&qword_26925F330, &qword_26925F268);
  uint64_t v73 = v137;
  uint64_t v74 = v138;
  sub_247750858();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v136 + 8))(v71, v74);
  uint64_t v75 = v140;
  sub_2477502E8();
  uint64_t v176 = v74;
  uint64_t v177 = v72;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v77 = v143;
  uint64_t v78 = v142;
  sub_2477507C8();
  (*(void (**)(char *, uint64_t))(v141 + 8))(v75, v144);
  (*(void (**)(char *, uint64_t))(v139 + 8))(v73, v78);
  uint64_t v79 = swift_allocObject();
  long long v80 = *(_OWORD *)(v70 + 48);
  *(_OWORD *)(v79 + 48) = *(_OWORD *)(v70 + 32);
  *(_OWORD *)(v79 + 64) = v80;
  *(_OWORD *)(v79 + 80) = *(_OWORD *)(v70 + 64);
  *(void *)(v79 + 96) = *(void *)(v70 + 80);
  long long v81 = *(_OWORD *)(v70 + 16);
  *(_OWORD *)(v79 + 16) = *(_OWORD *)v70;
  *(_OWORD *)(v79 + 32) = v81;
  sub_24771FB40(v70);
  uint64_t v82 = v157;
  sub_247750378();
  uint64_t v176 = v78;
  uint64_t v177 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v83 = v149;
  uint64_t v84 = v147;
  sub_247750888();
  swift_release();
  (*(void (**)(char *, uint64_t))(v158 + 8))(v82, v159);
  (*(void (**)(char *, uint64_t))(v146 + 8))(v77, v84);
  uint64_t v85 = swift_allocObject();
  long long v86 = *(_OWORD *)(v70 + 48);
  *(_OWORD *)(v85 + 48) = *(_OWORD *)(v70 + 32);
  *(_OWORD *)(v85 + 64) = v86;
  *(_OWORD *)(v85 + 80) = *(_OWORD *)(v70 + 64);
  *(void *)(v85 + 96) = *(void *)(v70 + 80);
  long long v87 = *(_OWORD *)(v70 + 16);
  *(_OWORD *)(v85 + 16) = *(_OWORD *)v70;
  *(_OWORD *)(v85 + 32) = v87;
  sub_24771FB40(v70);
  uint64_t v88 = v165;
  sub_247750C18();
  uint64_t v89 = (uint64_t)v150;
  long long v90 = &v150[*(int *)(v145 + 36)];
  uint64_t v91 = sub_247750338();
  uint64_t v93 = v168;
  uint64_t v92 = v169;
  (*(void (**)(char *, char *, uint64_t))(v168 + 16))(&v90[*(int *)(v91 + 20)], v88, v169);
  *(void *)long long v90 = &unk_26925F628;
  *((void *)v90 + 1) = v85;
  uint64_t v94 = v151;
  uint64_t v95 = v153;
  (*(void (**)(uint64_t, char *, uint64_t))(v151 + 16))(v89, v83, v153);
  (*(void (**)(char *, uint64_t))(v93 + 8))(v88, v92);
  (*(void (**)(char *, uint64_t))(v94 + 8))(v83, v95);
  LOBYTE(v95) = sub_247750688();
  uint64_t v96 = v156;
  sub_2477129D0(v89, v156, &qword_26925F5C0);
  uint64_t v97 = v96 + *(int *)(v148 + 36);
  *(unsigned char *)uint64_t v97 = v95;
  *(_OWORD *)(v97 + 8) = 0u;
  *(_OWORD *)(v97 + 24) = 0u;
  *(unsigned char *)(v97 + 40) = 1;
  sub_247712A34(v89, &qword_26925F5C0);
  id v98 = objc_msgSend(self, sel_tertiarySystemFillColor);
  uint64_t v99 = MEMORY[0x24C55B890](v98);
  LOBYTE(v94) = sub_247750688();
  uint64_t v100 = v162;
  sub_2477129D0(v96, v162, &qword_26925F5C8);
  uint64_t v101 = v100 + *(int *)(v154 + 36);
  *(void *)uint64_t v101 = v99;
  *(unsigned char *)(v101 + 8) = v94;
  sub_247712A34(v96, &qword_26925F5C8);
  uint64_t v102 = v171;
  uint64_t v103 = &v171[*(int *)(v170 + 20)];
  uint64_t v104 = *MEMORY[0x263F19860];
  uint64_t v105 = sub_247750518();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v105 - 8) + 104))(v103, v104, v105);
  __asm { FMOV            V0.2D, #12.0 }
  _OWORD *v102 = _Q0;
  uint64_t v111 = (uint64_t)v163;
  uint64_t v112 = (uint64_t)&v163[*(int *)(v155 + 36)];
  sub_24771E228((uint64_t)v102, v112, MEMORY[0x263F19048]);
  *(_WORD *)(v112 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925F338) + 36)) = 256;
  sub_2477129D0(v100, v111, &qword_26925F5D0);
  sub_24771FDA0((uint64_t)v102, MEMORY[0x263F19048]);
  sub_247712A34(v100, &qword_26925F5D0);
  uint64_t v113 = swift_getKeyPath();
  uint64_t v114 = v160;
  sub_2477129D0(v111, v160, &qword_26925F5D8);
  uint64_t v115 = v114 + *(int *)(v161 + 36);
  *(void *)uint64_t v115 = v113;
  *(unsigned char *)(v115 + 8) = 1;
  sub_247712A34(v111, &qword_26925F5D8);
  uint64_t v116 = v164;
  sub_247715F70(v114, v164, &qword_26925F5E0);
  uint64_t v117 = v173;
  uint64_t v118 = v152;
  sub_2477129D0(v173, v152, &qword_26925F608);
  uint64_t v119 = v167;
  sub_2477129D0(v116, v167, &qword_26925F5E0);
  uint64_t v120 = v172;
  sub_2477129D0(v118, v172, &qword_26925F608);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F630);
  uint64_t v122 = v120 + *(int *)(v121 + 48);
  uint64_t v123 = v133;
  uint64_t v124 = v132;
  *(void *)uint64_t v122 = v133;
  *(void *)(v122 + 8) = v124;
  LOBYTE(v113) = v130;
  *(unsigned char *)(v122 + 16) = v130;
  *(void *)(v122 + 24) = v134;
  *(unsigned char *)(v122 + 32) = (_BYTE)v131;
  *(_OWORD *)(v122 + 40) = 0u;
  *(_OWORD *)(v122 + 56) = 0u;
  *(unsigned char *)(v122 + 72) = 1;
  sub_2477129D0(v119, v120 + *(int *)(v121 + 64), &qword_26925F5E0);
  sub_247712A90(v123, v124, v113);
  swift_bridgeObjectRetain();
  sub_247712A34(v116, &qword_26925F5E0);
  sub_247712A34(v117, &qword_26925F608);
  sub_247712A34(v119, &qword_26925F5E0);
  sub_247712AA0(v123, v124, v113);
  swift_bridgeObjectRelease();
  return sub_247712A34(v118, &qword_26925F608);
}

uint64_t sub_24771D7B4(long long *a1)
{
  uint64_t v2 = sub_24774FF68();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AvailableShortcutAction();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v22 - v10;
  long long v28 = *a1;
  uint64_t v29 = *((void *)a1 + 2);
  long long v24 = *a1;
  uint64_t v25 = *((void *)a1 + 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F320);
  sub_247750928();
  uint64_t v13 = v26;
  unint64_t v12 = v27;
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v15 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v15 = v13 & 0xFFFFFFFFFFFFLL;
  }
  if (v15)
  {
    long long v24 = a1[3];
    LOBYTE(v25) = *((unsigned char *)a1 + 64);
    LOBYTE(v26) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F638);
    sub_247750978();
    long long v24 = *a1;
    uint64_t v25 = *((void *)a1 + 2);
    sub_247750928();
    unint64_t v22 = v27;
    uint64_t v23 = v26;
    long long v24 = *a1;
    uint64_t v25 = *((void *)a1 + 2);
    sub_247750928();
    uint64_t v16 = v5;
    uint64_t v17 = v26;
    unint64_t v18 = v27;
    sub_24774FF58();
    sub_24774FF58();
    (*(void (**)(char *, char *, uint64_t))(v3 + 40))(v9, v16, v2);
    uint64_t v19 = &v9[*(int *)(v6 + 20)];
    unint64_t v20 = v22;
    *(void *)uint64_t v19 = v23;
    *((void *)v19 + 1) = v20;
    uint64_t v21 = &v9[*(int *)(v6 + 24)];
    *(void *)uint64_t v21 = v17;
    *((void *)v21 + 1) = v18;
    v21[16] = 2;
    sub_24771E2AC((uint64_t)v9, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
    (*((void (**)(char *))a1 + 9))(v11);
    long long v24 = v28;
    uint64_t v25 = v29;
    uint64_t v26 = 0;
    unint64_t v27 = 0xE000000000000000;
    sub_247750938();
    return sub_24771FDA0((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
  }
  return result;
}

uint64_t sub_24771DA80(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  sub_247750C08();
  *(void *)(v1 + 48) = sub_247750BF8();
  uint64_t v3 = sub_247750BE8();
  return MEMORY[0x270FA2498](sub_24771DB18, v3, v2);
}

uint64_t sub_24771DB18()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  long long v2 = *(_OWORD *)(v1 + 24);
  *(unsigned char *)(v0 + 32) = *(unsigned char *)(v1 + 40);
  *(_OWORD *)(v0 + 16) = v2;
  *(unsigned char *)(v0 + 33) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F258);
  sub_247750268();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24771DBB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F580);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v7 = *(_OWORD *)(v1 + 48);
  v14[2] = *(_OWORD *)(v1 + 32);
  v14[3] = v7;
  v14[4] = *(_OWORD *)(v1 + 64);
  uint64_t v15 = *(void *)(v1 + 80);
  long long v8 = *(_OWORD *)(v1 + 16);
  v14[0] = *(_OWORD *)v1;
  v14[1] = v8;
  uint64_t v13 = v14;
  sub_247750668();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F588);
  sub_247712AEC(&qword_26925F590, &qword_26925F588);
  sub_247750298();
  char v9 = sub_247750688();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 16))(a1, v6, v3);
  uint64_t v10 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925F598) + 36);
  *(unsigned char *)uint64_t v10 = v9;
  *(_OWORD *)(v10 + 8) = 0u;
  *(_OWORD *)(v10 + 24) = 0u;
  *(unsigned char *)(v10 + 40) = 1;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_24771DD74()
{
  return sub_24771E48C(sub_24771AB98);
}

uint64_t sub_24771DD8C@<X0>(uint64_t a1@<X8>)
{
  return sub_247719AEC(a1);
}

unint64_t sub_24771DDB0()
{
  unint64_t result = qword_26925F448;
  if (!qword_26925F448)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F440);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F450);
    sub_247712AEC(&qword_26925F458, &qword_26925F450);
    sub_24771DEC4();
    swift_getOpaqueTypeConformance2();
    sub_247712AEC(&qword_26925F468, &qword_26925F470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F448);
  }
  return result;
}

unint64_t sub_24771DEC4()
{
  unint64_t result = qword_26925F460;
  if (!qword_26925F460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F460);
  }
  return result;
}

uint64_t sub_24771DF18()
{
  return sub_24771A504(*(void *)(v0 + 16));
}

unint64_t sub_24771DF20()
{
  unint64_t result = qword_26925F488;
  if (!qword_26925F488)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F480);
    sub_24771DF94();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F488);
  }
  return result;
}

unint64_t sub_24771DF94()
{
  unint64_t result = qword_26925F490;
  if (!qword_26925F490)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F498);
    sub_247712AEC(&qword_26925F4A0, &qword_26925F4A8);
    sub_247712AEC(&qword_26925F468, &qword_26925F470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F490);
  }
  return result;
}

uint64_t sub_24771E058()
{
  return sub_24771A140(*(void *)(v0 + 16));
}

uint64_t sub_24771E060()
{
  return sub_247719F20(*(void *)(v0 + 16));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  sub_247712E94();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v6 = sub_24774FF68();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24771E1F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24771E550(a1, (uint64_t)&unk_26FBBABA8, (uint64_t)sub_24771E314, (uint64_t)sub_24771E318, a2);
}

uint64_t sub_24771E228(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24771E294(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24771E2AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24771E318@<X0>(uint64_t a1@<X8>)
{
  return sub_24771B310(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_24771E320()
{
  unint64_t result = qword_26925F500;
  if (!qword_26925F500)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F4F8);
    sub_247712AEC(&qword_26925F468, &qword_26925F470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F500);
  }
  return result;
}

uint64_t sub_24771E3C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24771E408(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24771E474()
{
  return sub_24771E48C((uint64_t (*)(uint64_t))sub_24771C160);
}

uint64_t sub_24771E48C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for AVSCommandShortcutActionView(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
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

uint64_t sub_24771E51C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24771E550(a1, (uint64_t)&unk_26FBBAC48, (uint64_t)sub_24771E314, (uint64_t)sub_24771FED4, a2);
}

uint64_t sub_24771E550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = *(void *)(type metadata accessor for AVSCommandShortcutActionView(0) - 8);
  return sub_24771A724(a1, v5 + ((*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), a2, a3, a4, a5);
}

uint64_t objectdestroy_29Tm()
{
  uint64_t v1 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v13 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v4 = type metadata accessor for AvailableShortcutAction();
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(v4 - 8) + 80);
  uint64_t v12 = *(void *)(*(void *)(v4 - 8) + 64);
  swift_release();
  sub_247712E94();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v7 = sub_24774FF68();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  uint64_t v9 = v2 | v5 | 7;
  uint64_t v10 = (v3 + v13 + v5) & ~v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C8);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v10, v7);
  swift_bridgeObjectRelease();
  sub_24771E294(*(void *)(v0 + v10 + *(int *)(v4 + 24)), *(void *)(v0 + v10 + *(int *)(v4 + 24) + 8), *(unsigned char *)(v0 + v10 + *(int *)(v4 + 24) + 16));

  return MEMORY[0x270FA0238](v0, v10 + v12, v9);
}

uint64_t sub_24771E82C()
{
  uint64_t v1 = *(void *)(type metadata accessor for AVSCommandShortcutActionView(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for AvailableShortcutAction() - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_24771AC08(v0 + v2, v5);
}

uint64_t sub_24771E8FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24771E550(a1, (uint64_t)&unk_26FBBAC98, (uint64_t)sub_24771E314, (uint64_t)sub_24771FED4, a2);
}

uint64_t sub_24771E934@<X0>(void *a1@<X8>)
{
  return sub_24771E984(a1);
}

uint64_t sub_24771E95C()
{
  return sub_24771EA00();
}

uint64_t sub_24771E984@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24771EA00()
{
  return sub_247750228();
}

uint64_t sub_24771EA78(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24771EAF8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24771EA98(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24771EC64(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24771EAB8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24771F05C(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_24771EAD8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24771F1E8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24771EAF8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F378);
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
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_24771EC64(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F518);
  uint64_t v10 = *(void *)(type metadata accessor for AvailableShortcutAction() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for AvailableShortcutAction() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_24771EEA4@<X0>(void *a1@<X8>)
{
  return sub_24771E984(a1);
}

uint64_t sub_24771EECC()
{
  return sub_24771EA00();
}

uint64_t sub_24771EEF4@<X0>(void *a1@<X8>)
{
  return sub_24771E984(a1);
}

uint64_t sub_24771EF1C()
{
  return sub_24771EA00();
}

uint64_t sub_24771EF44()
{
  return sub_24771C098() & 1;
}

uint64_t sub_24771EF68()
{
  return sub_24771E48C((uint64_t (*)(uint64_t))sub_24771B9D4);
}

double sub_24771EF84@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for AVSCommandShortcutActionView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24771BC40(v4, a1);
}

uint64_t sub_24771EFF8(uint64_t a1)
{
  return sub_24771AD7C(a1);
}

uint64_t sub_24771F05C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F570);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F578);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_24771F1E8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F538);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_24771F348()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24771F380(unint64_t a1, void *a2)
{
  return sub_247716A68(a1, a2, v2);
}

uint64_t sub_24771F388(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24771F3C4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24771F40C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24771FED8;
  return sub_247717178(a1, v4, v5, v7, v6);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t destroy for SiriRequestView()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for SiriRequestView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SiriRequestView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v4 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for SiriRequestView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriRequestView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriRequestView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriRequestView()
{
  return &type metadata for SiriRequestView;
}

uint64_t sub_24771F848()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24771F9BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24771F9D8@<X0>(uint64_t a1@<X8>)
{
  return sub_24771C2B0(*(void *)(v1 + 16), a1);
}

unint64_t sub_24771F9E8()
{
  unint64_t result = qword_26925F610;
  if (!qword_26925F610)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F5F0);
    sub_24771FA88();
    sub_247712AEC(&qword_26925F310, &qword_26925F318);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F610);
  }
  return result;
}

unint64_t sub_24771FA88()
{
  unint64_t result = qword_26925F618;
  if (!qword_26925F618)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F5E8);
    sub_24771E3C0(&qword_26925F308, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_26925F618);
  }
  return result;
}

uint64_t sub_24771FB38()
{
  return sub_24771D7B4((long long *)(v0 + 16));
}

uint64_t sub_24771FB40(uint64_t a1)
{
  return a1;
}

uint64_t objectdestroy_93Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 104, 7);
}

uint64_t sub_24771FC18()
{
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_24771FCAC;
  return sub_24771DA80(v0 + 16);
}

uint64_t sub_24771FCAC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24771FDA0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24771FE0C()
{
  unint64_t result = qword_26925F640;
  if (!qword_26925F640)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F598);
    sub_247712AEC(&qword_26925F648, &qword_26925F580);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F640);
  }
  return result;
}

uint64_t sub_24771FEAC()
{
  return sub_24771EF44() & 1;
}

uint64_t AdaptiveVoiceShortcutObjcClass.identifier.getter()
{
  return sub_24771FFCC(&OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_identifier);
}

uint64_t AdaptiveVoiceShortcutObjcClass.identifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_2477200A4(a1, a2, &OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_identifier);
}

uint64_t AdaptiveVoiceShortcutObjcClass.name.getter()
{
  return sub_24771FFCC(&OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_name);
}

uint64_t AdaptiveVoiceShortcutObjcClass.name.setter(uint64_t a1, uint64_t a2)
{
  return sub_2477200A4(a1, a2, &OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_name);
}

id sub_24771FF48()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_247750AF8();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t AdaptiveVoiceShortcutObjcClass.associatedShortcutName.getter()
{
  return sub_24771FFCC(&OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_associatedShortcutName);
}

uint64_t sub_24771FFCC(void *a1)
{
  unint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_24772002C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_247750B08();
  uint64_t v8 = v7;
  uint64_t v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *uint64_t v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t AdaptiveVoiceShortcutObjcClass.associatedShortcutName.setter(uint64_t a1, uint64_t a2)
{
  return sub_2477200A4(a1, a2, &OBJC_IVAR___AdaptiveVoiceShortcutObjcClass_associatedShortcutName);
}

uint64_t sub_2477200A4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_247720100(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  uint64_t v5 = sub_247750B08();
  uint64_t v7 = v6;

  *a3 = v5;
  a3[1] = v7;
}

void sub_2477201BC()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)sub_247750AF8();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_269262000 = (uint64_t)v2;
}

void sub_24772022C()
{
  id v0 = (void *)AXCPSharedResourcesDirectory();
  if (v0)
  {
    id v1 = v0;
    uint64_t v2 = sub_247750B08();
    uint64_t v4 = v3;

    qword_26925F650 = v2;
    *(void *)algn_26925F658 = v4;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_247720288()
{
  sub_247750DC8();
  if (qword_26925F118 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26925F650;
  uint64_t v0 = *(void *)algn_26925F658;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_247750B58();
  qword_26925F660 = v1;
  *(void *)algn_26925F668 = v0;
  return result;
}

uint64_t sub_24772034C()
{
  sub_247750DC8();
  if (qword_26925F118 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_26925F650;
  uint64_t v0 = *(void *)algn_26925F658;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = sub_247750B58();
  qword_26925F670 = v1;
  *(void *)algn_26925F678 = v0;
  return result;
}

uint64_t AVSStore.save(avsShortcut:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AdaptiveVoiceShortcut();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2477223F4();
  sub_247729410(a1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = sub_247721484(0, *(void *)(v6 + 16) + 1, 1, v6, &qword_26925F768, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  }
  unint64_t v8 = *(void *)(v6 + 16);
  unint64_t v7 = *(void *)(v6 + 24);
  if (v8 >= v7 >> 1) {
    uint64_t v6 = sub_247721484(v7 > 1, v8 + 1, 1, v6, &qword_26925F768, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  }
  *(void *)(v6 + 16) = v8 + 1;
  sub_247723D20((uint64_t)v5, v6+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(void *)(v3 + 72) * v8);
  sub_247723EE0(v6);
  return swift_bridgeObjectRelease();
}

uint64_t AVSStore.retrieveShortcut(withIdentifier:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for AdaptiveVoiceShortcut();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2477223F4();
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v18 = v2;
    uint64_t v19 = a1;
    uint64_t v8 = v6 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v16 = v6;
    uint64_t v17 = v3;
    uint64_t v9 = *(void *)(v3 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_247729410(v8, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      uint64_t v24 = sub_24774FF48();
      uint64_t v25 = v10;
      uint64_t v22 = 45;
      unint64_t v23 = 0xE100000000000000;
      uint64_t v20 = 0;
      unint64_t v21 = 0xE000000000000000;
      sub_247715DE0();
      sub_247750D38();
      swift_bridgeObjectRelease();
      sub_247750B38();
      swift_bridgeObjectRelease();
      int64_t v11 = (void *)sub_247750AF8();
      swift_bridgeObjectRelease();
      uint64_t v12 = (void *)sub_247750AF8();
      unsigned int v13 = objc_msgSend(v11, sel_isEqual_, v12);

      if (v13) {
        break;
      }
      sub_24772A268((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      v8 += v9;
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = 1;
        a1 = v19;
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
    a1 = v19;
    sub_247723D20((uint64_t)v5, v19);
    uint64_t v14 = 0;
LABEL_8:
    uint64_t v3 = v17;
    uint64_t v2 = v18;
  }
  else
  {
    uint64_t v14 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, v14, 1, v2);
  return swift_bridgeObjectRelease();
}

AVSStore __swiftcall AVSStore.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (AVSStore)objc_msgSend(v0, sel_init);
}

id AVSStore.init()()
{
  v1.super_class = (Class)AVSStore;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_247720A44(char a1)
{
  return qword_2477523A0[a1];
}

BOOL sub_247720A64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247720A78()
{
  return sub_247751018();
}

uint64_t sub_247720AC0()
{
  return sub_247751008();
}

uint64_t sub_247720AEC()
{
  return sub_247751018();
}

uint64_t sub_247720B30()
{
  return sub_247720A44(*v0);
}

uint64_t sub_247720B38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247729EDC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247720B60()
{
  return 0;
}

void sub_247720B6C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_247720B78(uint64_t a1)
{
  unint64_t v2 = sub_2477292BC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247720BB4(uint64_t a1)
{
  unint64_t v2 = sub_2477292BC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AVSDebugEvent.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F698);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2477292BC();
  sub_247751038();
  char v14 = 0;
  sub_24774FF68();
  sub_24772A1B8(&qword_26925F6A8, MEMORY[0x263F07508]);
  sub_247750FA8();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for AVSDebugEvent();
    char v13 = 1;
    sub_247750F88();
    uint64_t v12 = *(void *)(v3 + *(int *)(v9 + 24));
    v11[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F6B0);
    sub_2477293AC(&qword_26925F6B8);
    sub_247750F78();
    v11[14] = 3;
    sub_247750F98();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t AVSDebugEvent.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v4 = sub_24774FF68();
  uint64_t v31 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F6C0);
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for AVSDebugEvent();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24774FF58();
  uint64_t v28 = v10;
  uint64_t v29 = a1;
  uint64_t v30 = *(int *)(v10 + 24);
  *(void *)&v12[v30] = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2477292BC();
  sub_247751028();
  if (v2)
  {
    uint64_t v13 = v4;
    uint64_t v16 = v31;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v13);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = v26;
    char v36 = 0;
    sub_24772A1B8(&qword_26925F6C8, MEMORY[0x263F07508]);
    uint64_t v15 = v27;
    sub_247750F38();
    (*(void (**)(char *, char *, uint64_t))(v31 + 40))(v12, v6, v4);
    char v35 = 1;
    uint64_t v18 = sub_247750F18();
    uint64_t v19 = (uint64_t *)&v12[*(int *)(v28 + 20)];
    *uint64_t v19 = v18;
    v19[1] = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F6B0);
    char v33 = 2;
    sub_2477293AC(&qword_26925F6D0);
    sub_247750F08();
    uint64_t v21 = v34;
    uint64_t v22 = v30;
    swift_bridgeObjectRelease();
    *(void *)&v12[v22] = v21;
    char v32 = 3;
    sub_247750F28();
    int v24 = v23;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v15);
    *(_DWORD *)&v12[*(int *)(v28 + 28)] = v24;
    sub_247729410((uint64_t)v12, v25, (uint64_t (*)(void))type metadata accessor for AVSDebugEvent);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    return sub_24772A268((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AVSDebugEvent);
  }
}

uint64_t sub_2477212F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AVSDebugEvent.init(from:)(a1, a2);
}

uint64_t sub_247721308(void *a1)
{
  return AVSDebugEvent.encode(to:)(a1);
}

char *sub_247721320(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F718);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_24772230C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24772141C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_247721484(a1, a2, a3, a4, &qword_26925F518, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
}

uint64_t sub_247721450(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_247721484(a1, a2, a3, a4, &qword_26925F710, MEMORY[0x263F84D68], MEMORY[0x263F84D68]);
}

uint64_t sub_247721484(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_247750E78();
    __break(1u);
    return result;
  }
  v18[2] = v13;
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
    sub_247723D84(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_247721704(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_247721484(a1, a2, a3, a4, &qword_26925F768, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
}

uint64_t sub_247721738(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F798);
  char v42 = a2;
  uint64_t v6 = sub_247750EA8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  char v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    int v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    char v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    char v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_247750FF8();
    sub_247750B48();
    uint64_t result = sub_247751018();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    size_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *size_t v19 = v34;
    v19[1] = v33;
    BOOL v20 = (void *)(*(void *)(v7 + 56) + v18);
    *BOOL v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  int v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_247721A60(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_247750D78();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_247750FF8();
        swift_bridgeObjectRetain();
        sub_247750B48();
        uint64_t v9 = sub_247751018();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_247721C38()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F798);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_247750E98();
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
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    int64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v23 = v19;
    v23[1] = v18;
    int v24 = (void *)(*(void *)(v4 + 56) + v16);
    *int v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_247721DF4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F788);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v55 = (char *)&v46 - v6;
  uint64_t v7 = sub_247750078();
  MEMORY[0x270FA5388](v7);
  uint64_t v58 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v10 + 32) & ~v10;
  uint64_t v61 = (void *)MEMORY[0x263F8EE78];
  uint64_t v59 = MEMORY[0x263F8EE78] + v11;
  unint64_t v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  uint64_t v49 = v9 + 48;
  uint64_t v50 = v9 + 16;
  uint64_t v51 = v9;
  uint64_t v57 = (uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 32);
  uint64_t v48 = v10 | 7;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v60 = 0;
  unint64_t v14 = 0;
  uint64_t v54 = v11;
LABEL_4:
  unint64_t v16 = *(void *)(a1 + 16);
  if (v14 != v16)
  {
    if (v14 < v16)
    {
      while (1)
      {
        uint64_t v17 = *(void *)(a1 + 32 + 8 * v14);
        swift_bridgeObjectRetain();
        uint64_t result = swift_bridgeObjectRelease();
        if (v17) {
          break;
        }
LABEL_9:
        ++v14;
        unint64_t v18 = *(void *)(a1 + 16);
        if (v14 == v18) {
          goto LABEL_38;
        }
        if (v14 >= v18) {
          goto LABEL_43;
        }
      }
      if (!*(void *)(v17 + 16))
      {
        (*v12)(v5, 1, 1, v7);
        uint64_t result = sub_247712A34((uint64_t)v5, &qword_26925F788);
        goto LABEL_9;
      }
      unint64_t v19 = 0;
      ++v14;
      while (1)
      {
        uint64_t v20 = v51;
        uint64_t v21 = *(void *)(v51 + 72);
        unint64_t v53 = v19;
        (*(void (**)(char *, unint64_t, uint64_t))(v51 + 16))(v5, v17 + v11 + v21 * v19, v7);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v5, 0, 1, v7);
        uint64_t v22 = (uint64_t)v55;
        sub_247715F70((uint64_t)v5, (uint64_t)v55, &qword_26925F788);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v22, 1, v7) == 1) {
          goto LABEL_39;
        }
        int64_t v23 = *v57;
        uint64_t result = (*v57)(v58, v22, v7);
        uint64_t v24 = v60;
        uint64_t v52 = v23;
        if (v60)
        {
          uint64_t v56 = v61;
          goto LABEL_36;
        }
        unint64_t v25 = v61[3];
        if ((uint64_t)((v25 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_47;
        }
        int64_t v26 = v25 & 0xFFFFFFFFFFFFFFFELL;
        if (v26 <= 1) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = v26;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_26925F710);
        uint64_t v28 = v54;
        uint64_t v60 = v27;
        uint64_t v56 = (void *)swift_allocObject();
        uint64_t result = _swift_stdlib_malloc_size(v56);
        if (!v21) {
          goto LABEL_48;
        }
        uint64_t v29 = result - v28;
        if (result - v28 == 0x8000000000000000 && v21 == -1) {
          goto LABEL_49;
        }
        uint64_t v31 = v29 / v21;
        char v32 = v56;
        unint64_t v33 = (unint64_t)v61;
        v56[2] = v60;
        v32[3] = 2 * (v29 / v21);
        uint64_t v34 = (char *)v32 + v28;
        uint64_t v35 = *(void *)(v33 + 24) >> 1;
        uint64_t v36 = v35 * v21;
        if (*(void *)(v33 + 16)) {
          break;
        }
LABEL_35:
        uint64_t v59 = (uint64_t)&v34[v36];
        uint64_t v24 = (v31 & 0x7FFFFFFFFFFFFFFFLL) - v35;
        uint64_t result = swift_release();
LABEL_36:
        BOOL v37 = __OFSUB__(v24, 1);
        uint64_t v38 = v24 - 1;
        if (v37) {
          goto LABEL_45;
        }
        uint64_t v60 = v38;
        unint64_t v39 = v53 + 1;
        uint64_t v40 = v59;
        uint64_t result = v52((char *)v59, (uint64_t)v58, v7);
        uint64_t v59 = v40 + v21;
        uint64_t v61 = v56;
        uint64_t v11 = v54;
        unint64_t v15 = *(void *)(v17 + 16);
        if (v39 == v15)
        {
          (*v12)(v5, 1, 1, v7);
          uint64_t result = sub_247712A34((uint64_t)v5, &qword_26925F788);
          goto LABEL_4;
        }
        unint64_t v19 = v39;
        if (v39 >= v15) {
          goto LABEL_44;
        }
      }
      if ((unint64_t)v56 < v33 || (unint64_t)v34 >= v33 + v54 + v36)
      {
        uint64_t v59 = (uint64_t)v34;
        uint64_t v60 = v29 / v21;
        uint64_t v47 = v35 * v21;
        swift_arrayInitWithTakeFrontToBack();
      }
      else
      {
        if (v56 == v61)
        {
LABEL_34:
          v61[2] = 0;
          goto LABEL_35;
        }
        uint64_t v59 = (uint64_t)v34;
        uint64_t v60 = v29 / v21;
        uint64_t v47 = v35 * v21;
        swift_arrayInitWithTakeBackToFront();
      }
      uint64_t v36 = v47;
      uint64_t v34 = (char *)v59;
      uint64_t v31 = v60;
      goto LABEL_34;
    }
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_38:
  uint64_t v22 = (uint64_t)v55;
  (*v12)(v55, 1, 1, v7);
LABEL_39:
  swift_bridgeObjectRelease();
  uint64_t v42 = v60;
  uint64_t v41 = v61;
  swift_bridgeObjectRelease();
  uint64_t result = sub_247712A34(v22, &qword_26925F788);
  unint64_t v43 = v41[3];
  if (v43 < 2) {
    return (uint64_t)v41;
  }
  unint64_t v44 = v43 >> 1;
  BOOL v37 = __OFSUB__(v44, v42);
  unint64_t v45 = v44 - v42;
  if (!v37)
  {
    v41[2] = v45;
    return (uint64_t)v41;
  }
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

char *sub_24772230C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_2477223F4()
{
  uint64_t v0 = sub_247750158();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  MEMORY[0x270FA5388](v2);
  size_t v4 = (char *)v15 - v3;
  if (qword_26925F110 != -1) {
    swift_once();
  }
  if (qword_269262000)
  {
    id v5 = (id)qword_269262000;
    uint64_t v6 = (void *)sub_247750AF8();
    id v7 = objc_msgSend(v5, sel_objectForKey_, v6);

    if (v7)
    {
      sub_247750D58();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v16, 0, sizeof(v16));
    }
    sub_247715F70((uint64_t)v16, (uint64_t)v17, &qword_26925F770);
    if (v17[3])
    {
      if (swift_dynamicCast())
      {
        uint64_t v12 = v15[2];
        unint64_t v13 = v15[3];
        sub_24774FDD8();
        swift_allocObject();
        sub_24774FDC8();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26925F750);
        sub_24772A124(&qword_26925F778, &qword_26925F780);
        sub_24774FDB8();
        swift_release();
        sub_24772A068(v12, v13);

        return v17[0];
      }
    }
    else
    {

      sub_247712A34((uint64_t)v17, &qword_26925F770);
    }
  }
  else
  {
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v0, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v8, v0);
    uint64_t v9 = sub_247750138();
    os_log_type_t v10 = sub_247750C68();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_24770E000, v9, v10, "Failed to retrieve shortcuts. Unable to find user defaults for AVS", v11, 2u);
      MEMORY[0x24C55C7C0](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  }
  return MEMORY[0x263F8EE78];
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE24shortcutsNamesDictionarySDyS2SGvgZ_0()
{
  uint64_t v37 = type metadata accessor for AdaptiveVoiceShortcut();
  uint64_t v0 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = (void *)sub_24772A2C8(MEMORY[0x263F8EE78]);
  uint64_t v4 = sub_2477223F4();
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return (uint64_t)v3;
  }
  uint64_t v6 = *(unsigned __int8 *)(v0 + 80);
  uint64_t v34 = v4;
  uint64_t v35 = v2;
  uint64_t v7 = v4 + ((v6 + 32) & ~v6);
  uint64_t v36 = *(void *)(v0 + 72);
  while (1)
  {
    sub_247729410(v7, (uint64_t)v2, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
    uint64_t v9 = sub_24774FF48();
    uint64_t v11 = v10;
    uint64_t v12 = &v2[*(int *)(v37 + 20)];
    uint64_t v13 = *((void *)v12 + 1);
    if (!v13)
    {
      swift_bridgeObjectRetain();
      unint64_t v24 = sub_24773D028(v9, v11);
      char v26 = v25;
      swift_bridgeObjectRelease();
      if (v26)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v39 = v3;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_247721C38();
          uint64_t v3 = v39;
        }
        swift_bridgeObjectRelease();
        sub_247721A60(v24, (uint64_t)v3);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    uint64_t v38 = *(void *)v12;
    swift_bridgeObjectRetain();
    char v14 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v39 = v3;
    uint64_t v15 = v11;
    unint64_t v17 = sub_24773D028(v9, v11);
    uint64_t v18 = v3[2];
    BOOL v19 = (v16 & 1) == 0;
    uint64_t v20 = v18 + v19;
    if (__OFADD__(v18, v19)) {
      break;
    }
    char v21 = v16;
    if (v3[3] >= v20)
    {
      if (v14)
      {
        uint64_t v3 = v39;
        if ((v16 & 1) == 0) {
          goto LABEL_18;
        }
      }
      else
      {
        sub_247721C38();
        uint64_t v3 = v39;
        if ((v21 & 1) == 0) {
          goto LABEL_18;
        }
      }
    }
    else
    {
      sub_247721738(v20, v14);
      unint64_t v22 = sub_24773D028(v9, v15);
      if ((v21 & 1) != (v23 & 1)) {
        goto LABEL_26;
      }
      unint64_t v17 = v22;
      uint64_t v3 = v39;
      if ((v21 & 1) == 0)
      {
LABEL_18:
        v3[(v17 >> 6) + 8] |= 1 << v17;
        uint64_t v28 = (uint64_t *)(v3[6] + 16 * v17);
        *uint64_t v28 = v9;
        v28[1] = v15;
        uint64_t v29 = (void *)(v3[7] + 16 * v17);
        *uint64_t v29 = v38;
        v29[1] = v13;
        uint64_t v30 = v3[2];
        BOOL v31 = __OFADD__(v30, 1);
        uint64_t v32 = v30 + 1;
        if (v31) {
          goto LABEL_25;
        }
        v3[2] = v32;
        swift_bridgeObjectRetain();
        goto LABEL_4;
      }
    }
    uint64_t v8 = (void *)(v3[7] + 16 * v17);
    swift_bridgeObjectRelease();
    *uint64_t v8 = v38;
    v8[1] = v13;
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = v35;
LABEL_5:
    sub_24772A268((uint64_t)v2, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
    v7 += v36;
    if (!--v5) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  uint64_t result = sub_247750FE8();
  __break(1u);
  return result;
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE9shortcutsSaySo0bC17ShortcutObjcClassCGvgZ_0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for AdaptiveVoiceShortcut();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v7 = sub_2477223F4();
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = *(unsigned __int8 *)(v4 + 80);
    uint64_t v20 = v7;
    uint64_t v10 = v7 + ((v9 + 32) & ~v9);
    uint64_t v11 = *(void *)(v4 + 72);
    do
    {
      sub_247729410(v10, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      id v12 = objc_allocWithZone((Class)AdaptiveVoiceShortcutObjcClass);
      id v13 = objc_msgSend(v12, sel_init, v20);
      swift_bridgeObjectRetain();
      char v14 = (void *)sub_247750AF8();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setName_, v14);

      sub_24774FF48();
      uint64_t v15 = (void *)sub_247750AF8();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setIdentifier_, v15);

      sub_24772A200((uint64_t)&v6[*(int *)(v3 + 28)], (uint64_t)v2);
      uint64_t v16 = type metadata accessor for AvailableShortcutAction();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v2, 1, v16) == 1)
      {
        sub_247712A34((uint64_t)v2, &qword_26925F160);
      }
      else
      {
        swift_bridgeObjectRetain();
        sub_24772A268((uint64_t)v2, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      }
      unint64_t v17 = (void *)sub_247750AF8();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setAssociatedShortcutName_, v17);

      id v18 = v13;
      MEMORY[0x24C55BB70]();
      if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_247750BB8();
      }
      sub_247750BD8();
      sub_247750BA8();

      sub_24772A268((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      v10 += v11;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
    return v21;
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE29shortcutsFormattedIdentifiersSaySSGvgZ_0()
{
  uint64_t v0 = type metadata accessor for AdaptiveVoiceShortcut();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2477223F4();
  int64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_24771EA78(0, v5, 0);
    uint64_t v6 = *(unsigned __int8 *)(v1 + 80);
    v18[0] = v4;
    uint64_t v7 = v4 + ((v6 + 32) & ~v6);
    uint64_t v8 = *(void *)(v1 + 72);
    do
    {
      sub_247729410(v7, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      v18[5] = sub_24774FF48();
      v18[6] = v9;
      v18[3] = 45;
      v18[4] = 0xE100000000000000;
      v18[1] = 0;
      v18[2] = 0xE000000000000000;
      sub_247715DE0();
      sub_247750D38();
      swift_bridgeObjectRelease();
      uint64_t v10 = sub_247750B38();
      uint64_t v12 = v11;
      swift_bridgeObjectRelease();
      sub_24772A268((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      uint64_t v13 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24771EA78(0, *(void *)(v13 + 16) + 1, 1);
        uint64_t v13 = v19;
      }
      unint64_t v15 = *(void *)(v13 + 16);
      unint64_t v14 = *(void *)(v13 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_24771EA78(v14 > 1, v15 + 1, 1);
        uint64_t v13 = v19;
      }
      *(void *)(v13 + 16) = v15 + 1;
      uint64_t v16 = v13 + 16 * v15;
      *(void *)(v16 + 32) = v10;
      *(void *)(v16 + 40) = v12;
      v7 += v8;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  return v13;
}

unint64_t sub_2477232A4()
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_247750158();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_247750078();
  uint64_t v55 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v58 = (char *)v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v59 = (char *)v45 - v7;
  uint64_t v54 = sub_24774FEC8();
  unint64_t v60 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_msgSend(self, sel_defaultManager);
  sub_24774FDD8();
  swift_allocObject();
  uint64_t v56 = sub_24774FDC8();
  if (qword_26925F120 != -1) {
    swift_once();
  }
  id v62 = (id)qword_26925F660;
  uint64_t v63 = *(void *)algn_26925F668;
  swift_bridgeObjectRetain();
  sub_247750B58();
  uint64_t v11 = v63;
  id v53 = v62;
  uint64_t v12 = (void *)sub_247750AF8();
  id v62 = 0;
  id v13 = objc_msgSend(v10, sel_contentsOfDirectoryAtPath_error_, v12, &v62);

  id v14 = v62;
  uint64_t v47 = v3;
  id v48 = v10;
  if (!v13)
  {
    id v31 = v62;
    swift_bridgeObjectRelease();
    uint64_t v32 = sub_24774FE78();

    swift_willThrow();
    uint64_t v19 = (void *)v32;
    unint64_t v60 = MEMORY[0x263F8EE78];
LABEL_17:
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v0, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v33, v0);
    id v34 = v19;
    id v35 = v19;
    uint64_t v36 = sub_247750138();
    uint64_t v37 = v19;
    os_log_type_t v38 = sub_247750C68();
    if (os_log_type_enabled(v36, v38))
    {
      uint64_t v46 = v1;
      unint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v39 = 138412290;
      id v41 = v37;
      uint64_t v42 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v61 = v42;
      uint64_t v1 = v46;
      sub_247750CF8();
      *uint64_t v40 = v42;

      _os_log_impl(&dword_24770E000, v36, v38, "Failed to read directory: %@", v39, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
      swift_arrayDestroy();
      unint64_t v43 = v40;
      uint64_t v3 = v47;
      MEMORY[0x24C55C7C0](v43, -1, -1);
      MEMORY[0x24C55C7C0](v39, -1, -1);

      swift_release();
    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return v60;
  }
  uint64_t v15 = sub_247750B98();
  id v16 = v14;

  uint64_t v17 = *(void *)(v15 + 16);
  v45[1] = v15;
  if (v17)
  {
    uint64_t v46 = v1;
    v45[0] = v0;
    uint64_t v57 = 0;
    uint64_t v51 = (void (**)(char *, char *, uint64_t))(v55 + 16);
    uint64_t v52 = (void (**)(char *, uint64_t))(v60 + 8);
    uint64_t v49 = v55 + 8;
    uint64_t v50 = v55 + 32;
    uint64_t v18 = v15 + 40;
    unint64_t v60 = MEMORY[0x263F8EE78];
    while (1)
    {
      id v62 = v53;
      uint64_t v63 = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_247750B58();
      sub_247750B58();
      swift_bridgeObjectRelease();
      sub_24774FE98();
      swift_bridgeObjectRelease();
      uint64_t v19 = v57;
      uint64_t v20 = sub_24774FED8();
      if (v19) {
        break;
      }
      uint64_t v22 = v20;
      unint64_t v23 = v21;
      unint64_t v24 = v9;
      (*v52)(v9, v54);
      sub_24772A1B8(&qword_26925F790, MEMORY[0x263F84D68]);
      char v25 = v59;
      sub_24774FDB8();
      (*v51)(v58, v25, v4);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v57 = 0;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        unint64_t v60 = sub_247721484(0, *(void *)(v60 + 16) + 1, 1, v60, &qword_26925F710, MEMORY[0x263F84D68], MEMORY[0x263F84D68]);
      }
      unint64_t v28 = *(void *)(v60 + 16);
      unint64_t v27 = *(void *)(v60 + 24);
      if (v28 >= v27 >> 1) {
        unint64_t v60 = sub_247721484(v27 > 1, v28 + 1, 1, v60, &qword_26925F710, MEMORY[0x263F84D68], MEMORY[0x263F84D68]);
      }
      v18 += 16;
      unint64_t v29 = v60;
      *(void *)(v60 + 16) = v28 + 1;
      uint64_t v30 = v55;
      (*(void (**)(unint64_t, char *, uint64_t))(v55 + 32))(v29+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(void *)(v30 + 72) * v28, v58, v4);
      sub_24772A068(v22, v23);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v59, v4);
      --v17;
      uint64_t v9 = v24;
      if (!v17) {
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
    (*v52)(v9, v54);
    swift_bridgeObjectRelease();
    uint64_t v0 = v45[0];
    uint64_t v1 = v46;
    uint64_t v3 = v47;
    goto LABEL_17;
  }
  unint64_t v60 = MEMORY[0x263F8EE78];
LABEL_15:
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v60;
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE28retriveDataForAllEnrollmentsSay0C7Actions018VASingleEnrollmentF0VGvgZ_0()
{
  uint64_t v0 = type metadata accessor for AdaptiveVoiceShortcut();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2477223F4();
  int64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
    sub_24771EAB8(0, v5, 0);
    uint64_t v6 = v4 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    uint64_t v7 = *(void *)(v1 + 72);
    do
    {
      sub_247729410(v6, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      sub_24774FF48();
      unint64_t v8 = sub_2477232A4();
      swift_bridgeObjectRelease();
      sub_24772A268((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      uint64_t v9 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24771EAB8(0, *(void *)(v9 + 16) + 1, 1);
        uint64_t v9 = v15;
      }
      unint64_t v11 = *(void *)(v9 + 16);
      unint64_t v10 = *(void *)(v9 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_24771EAB8(v10 > 1, v11 + 1, 1);
        uint64_t v9 = v15;
      }
      *(void *)(v9 + 16) = v11 + 1;
      *(void *)(v9 + 8 * v11 + 32) = v8;
      v6 += v7;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  uint64_t v12 = sub_247721DF4(v9);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_247723D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AdaptiveVoiceShortcut();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247723D84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_247723EE0(uint64_t a1)
{
  uint64_t v2 = sub_247750158();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v18 - v5;
  sub_24774FE08();
  swift_allocObject();
  sub_24774FDF8();
  v18[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F750);
  sub_24772A124(&qword_26925F758, &qword_26925F760);
  uint64_t v7 = sub_24774FDE8();
  unint64_t v9 = v8;
  if (qword_26925F110 != -1) {
    swift_once();
  }
  if (qword_269262000)
  {
    id v10 = (id)qword_269262000;
    uint64_t v11 = (void *)sub_24774FEE8();
    unint64_t v12 = (void *)sub_247750AF8();
    objc_msgSend(v10, sel_setObject_forKey_, v11, v12);

    sub_24772A068(v7, v9);
    return swift_release();
  }
  else
  {
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v14, v2);
    uint64_t v15 = sub_247750138();
    os_log_type_t v16 = sub_247750C68();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_24770E000, v15, v16, "Failed to save shortcuts. Unable to find user defaults for AVS", v17, 2u);
      MEMORY[0x24C55C7C0](v17, -1, -1);
    }
    sub_24772A068(v7, v9);
    swift_release();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE09deleteAllD0yyF_0()
{
  v61[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v0 = sub_247750158();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v57 = v0;
  uint64_t v58 = v1;
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v55 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v54 = (char *)&v54 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v56 = (char *)&v54 - v6;
  uint64_t v7 = sub_24774FE88();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F730);
  MEMORY[0x270FA5388](v11 - 8);
  unint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24774FEC8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = objc_msgSend(self, sel_defaultManager);
  if (qword_26925F120 != -1) {
    swift_once();
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F06E50], v7);
  swift_bridgeObjectRetain();
  sub_24774FEB8();
  uint64_t v19 = (void *)sub_24774FEA8();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v61[0] = 0;
  unsigned int v20 = [v18 removeItemAtURL:v19 error:v61];

  id v21 = v61[0];
  unint64_t v22 = 0x26925F000uLL;
  uint64_t v24 = v57;
  uint64_t v23 = v58;
  if (!v20)
  {
    char v25 = v21;
    char v26 = (void *)sub_24774FE78();

    swift_willThrow();
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v27 = __swift_project_value_buffer(v24, (uint64_t)qword_26925F898);
    swift_beginAccess();
    unint64_t v28 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v55, v27, v24);
    id v29 = v26;
    id v30 = v26;
    id v31 = sub_247750138();
    os_log_type_t v32 = sub_247750C68();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      id v34 = (void *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      v60[0] = v35;
      *(_DWORD *)uint64_t v33 = 136315394;
      uint64_t v36 = qword_26925F660;
      unint64_t v37 = *(void *)algn_26925F668;
      swift_bridgeObjectRetain();
      uint64_t v59 = sub_247745AC4(v36, v37, v60);
      sub_247750CF8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2112;
      id v38 = v26;
      uint64_t v39 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v59 = v39;
      unint64_t v22 = 0x26925F000;
      sub_247750CF8();
      void *v34 = v39;
      uint64_t v23 = v58;

      _os_log_impl(&dword_24770E000, v31, v32, "Failed to delete all shortcuts. Unable to delete commands directory: %s error: %@", (uint8_t *)v33, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
      swift_arrayDestroy();
      MEMORY[0x24C55C7C0](v34, -1, -1);
      swift_arrayDestroy();
      uint64_t v40 = v35;
      uint64_t v24 = v57;
      MEMORY[0x24C55C7C0](v40, -1, -1);
      MEMORY[0x24C55C7C0](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v55, v24);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v23 + 8))(v28, v24);
    }
  }
  if (qword_26925F110 != -1) {
    swift_once();
  }
  id v41 = v56;
  if (qword_269262000)
  {
    uint64_t v42 = (id)qword_269262000;
    unint64_t v43 = (void *)sub_247750AF8();
    [v42 removeObjectForKey:v43];

    if (*(void *)(v22 + 312) != -1) {
      swift_once();
    }
    uint64_t v44 = __swift_project_value_buffer(v24, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v41, v44, v24);
    unint64_t v45 = sub_247750138();
    os_log_type_t v46 = sub_247750C88();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_24770E000, v45, v46, "Deleted all AVS shortcuts", v47, 2u);
      MEMORY[0x24C55C7C0](v47, -1, -1);
    }

    id v48 = v18;
    uint64_t v18 = v42;
  }
  else
  {
    if (*(void *)(v22 + 312) != -1) {
      swift_once();
    }
    uint64_t v49 = __swift_project_value_buffer(v24, (uint64_t)qword_26925F898);
    swift_beginAccess();
    id v41 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v54, v49, v24);
    id v48 = sub_247750138();
    os_log_type_t v50 = sub_247750C68();
    if (os_log_type_enabled(v48, v50))
    {
      uint64_t v51 = v41;
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl(&dword_24770E000, v48, v50, "Failed to delete all shortcuts. Unable to find user defaults for AVS", v52, 2u);
      MEMORY[0x24C55C7C0](v52, -1, -1);
      id v41 = v51;
    }
  }

  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v41, v24);
}

uint64_t sub_247724C6C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = a3;
  uint64_t v36 = a2;
  uint64_t v4 = type metadata accessor for AdaptiveVoiceShortcut() - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v34 = (uint64_t)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v35 = (uint64_t)&v32 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v32 - v10;
  unint64_t v12 = *a1;
  uint64_t v13 = *(void *)(*a1 + 16);
  if (!v13) {
    return 0;
  }
  os_log_type_t v32 = a1;
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = *(void *)(v9 + 72);
  swift_bridgeObjectRetain();
  unint64_t v16 = 0;
  unint64_t v33 = v14;
  while (1)
  {
    sub_24774FF48();
    uint64_t v17 = (void *)sub_247750AF8();
    swift_bridgeObjectRelease();
    uint64_t v18 = (void *)sub_247750AF8();
    unsigned int v19 = objc_msgSend(v17, sel_isEqual_, v18);

    if (v19) {
      break;
    }
    ++v16;
    v14 += v15;
    if (v13 == v16)
    {
      swift_bridgeObjectRelease();
      return *(void *)(v12 + 16);
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v16, 1))
  {
    unint64_t v21 = *(void *)(v12 + 16);
    if (v16 + 1 == v21) {
      return v16;
    }
    uint64_t v22 = v15 + v14;
    unint64_t v23 = v16 + 1;
    uint64_t v24 = v32;
    while (v23 < v21)
    {
      sub_247729410(v12 + v22, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      sub_24774FF48();
      char v25 = (void *)sub_247750AF8();
      swift_bridgeObjectRelease();
      char v26 = (void *)sub_247750AF8();
      unsigned __int8 v27 = objc_msgSend(v25, sel_isEqual_, v26);

      uint64_t result = sub_24772A268((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      if ((v27 & 1) == 0)
      {
        if (v23 != v16)
        {
          if ((v16 & 0x8000000000000000) != 0) {
            goto LABEL_29;
          }
          unint64_t v28 = *v24;
          unint64_t v29 = *(void *)(*v24 + 16);
          if (v16 >= v29) {
            goto LABEL_30;
          }
          uint64_t result = sub_247729410(v28 + v33 + v16 * v15, v35, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
          if (v23 >= v29) {
            goto LABEL_31;
          }
          sub_247729410(v28 + v22, v34, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v24 = v32;
          *os_log_type_t v32 = v28;
          if ((result & 1) == 0)
          {
            uint64_t result = sub_2477372A4(v28);
            unint64_t v28 = result;
            *uint64_t v24 = result;
          }
          if (v16 >= *(void *)(v28 + 16)) {
            goto LABEL_32;
          }
          uint64_t result = sub_24772A0C0(v34, v28 + v33 + v16 * v15);
          if (v23 >= *(void *)(*v24 + 16)) {
            goto LABEL_33;
          }
          uint64_t result = sub_24772A0C0(v35, *v24 + v22);
        }
        if (__OFADD__(v16++, 1)) {
          goto LABEL_28;
        }
      }
      unint64_t v31 = v23 + 1;
      if (__OFADD__(v23, 1)) {
        goto LABEL_27;
      }
      unint64_t v12 = *v24;
      unint64_t v21 = *(void *)(*v24 + 16);
      ++v23;
      v22 += v15;
      if (v31 == v21) {
        return v16;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE14deleteShortcut14withIdentifierySS_tF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v43 = sub_247750158();
  uint64_t v45 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v44 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24774FE88();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F730);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24774FEC8();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_2477223F4();
  swift_bridgeObjectRetain();
  id v16 = (id)sub_247724C6C((unint64_t *)&v48, a1, a2);
  unint64_t v46 = a2;
  swift_bridgeObjectRelease();
  int64_t v17 = *(void *)(v48 + 16);
  if (v17 < (uint64_t)v16)
  {
    __break(1u);
  }
  else
  {
    sub_247737354((uint64_t)v16, v17);
    id v16 = objc_msgSend(self, sel_defaultManager);
    if (qword_26925F120 == -1) {
      goto LABEL_3;
    }
  }
  swift_once();
LABEL_3:
  id v50 = (id)qword_26925F660;
  unint64_t v51 = *(void *)algn_26925F668;
  swift_bridgeObjectRetain();
  uint64_t v42 = a1;
  sub_247750B58();
  uint64_t v18 = (uint64_t)v50;
  unint64_t v19 = v51;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F06E50], v5);
  swift_bridgeObjectRetain();
  uint64_t v41 = v18;
  sub_24774FEB8();
  unsigned int v20 = (void *)sub_24774FEA8();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  id v50 = 0;
  LODWORD(v18) = objc_msgSend(v16, sel_removeItemAtURL_error_, v20, &v50);

  id v21 = v50;
  if (v18)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = v21;
    id v40 = v16;
    unint64_t v23 = (void *)sub_24774FE78();

    swift_willThrow();
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v24 = v43;
    uint64_t v25 = __swift_project_value_buffer(v43, (uint64_t)qword_26925F898);
    swift_beginAccess();
    unsigned __int8 v27 = v44;
    uint64_t v26 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, v25, v24);
    unint64_t v28 = v46;
    swift_bridgeObjectRetain();
    id v29 = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v30 = v23;
    unint64_t v31 = sub_247750138();
    os_log_type_t v32 = sub_247750C68();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = (void *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v49 = v39;
      *(_DWORD *)uint64_t v33 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_247745AC4(v42, v28, &v49);
      sub_247750CF8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_247745AC4(v41, v19, &v49);
      sub_247750CF8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 22) = 2112;
      id v35 = v23;
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v47 = v36;
      sub_247750CF8();
      void *v34 = v36;

      _os_log_impl(&dword_24770E000, v31, v32, "Failed to delete shortcut with identifier: %s. Unable to delete commands directory: %s error: %@", (uint8_t *)v33, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
      swift_arrayDestroy();
      MEMORY[0x24C55C7C0](v34, -1, -1);
      uint64_t v37 = v39;
      swift_arrayDestroy();
      MEMORY[0x24C55C7C0](v37, -1, -1);
      MEMORY[0x24C55C7C0](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v24);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v24);
    }
    id v16 = v40;
  }
  sub_247723EE0(v48);

  return swift_bridgeObjectRelease();
}

void *_sSo8AVSStoreC22AdaptiveVoiceShortcutsE33saveShortcutEnrollmentDataToFiles10shortcutId_SSSgSS_Say0C7Actions08VASinglegH0VGtF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v67 = sub_247750158();
  uint64_t v4 = *(void *)(v67 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v67);
  id v65 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v51 = (char *)v48 - v7;
  uint64_t v60 = sub_24774FF68();
  uint64_t v8 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v59 = (char *)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_247750078();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v66 = (char *)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v49 = self;
  id v63 = objc_msgSend(v49, sel_defaultManager);
  if (qword_26925F120 != -1) {
    swift_once();
  }
  uint64_t v72 = qword_26925F660;
  uint64_t v73 = *(void *)algn_26925F668;
  swift_bridgeObjectRetain();
  sub_247750B58();
  uint64_t v13 = v72;
  uint64_t v62 = v73;
  uint64_t v14 = *(void *)(a3 + 16);
  if (!v14)
  {

    return (void *)v13;
  }
  uint64_t v61 = (void *)v72;
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v15 = v11 + 16;
  uint64_t v57 = v16;
  uint64_t v17 = a3;
  uint64_t v18 = a3 + ((*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64));
  uint64_t v56 = *(void *)(v15 + 56);
  uint64_t v55 = (void (**)(char *, uint64_t))(v8 + 8);
  id v53 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v48[1] = &v71;
  uint64_t v52 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v58 = v15;
  uint64_t v54 = (void (**)(char *, uint64_t))(v15 - 8);
  v48[0] = v17;
  swift_bridgeObjectRetain();
  *(void *)&long long v19 = 138412290;
  long long v50 = v19;
  uint64_t v64 = v10;
  unsigned int v20 = v66;
  do
  {
    uint64_t v68 = v14;
    v57(v20, v18, v10);
    id v70 = v61;
    uint64_t v71 = v62;
    swift_bridgeObjectRetain();
    sub_247750B58();
    unsigned __int8 v27 = v59;
    sub_247750058();
    sub_24772A1B8(&qword_26925F740, MEMORY[0x263F07508]);
    uint64_t v28 = v60;
    sub_247750FC8();
    sub_247750B58();
    swift_bridgeObjectRelease();
    (*v55)(v27, v28);
    sub_247750B58();
    char v69 = 1;
    id v29 = (void *)sub_247750AF8();
    id v30 = v63;
    LOBYTE(v27) = objc_msgSend(v63, sel_fileExistsAtPath_isDirectory_, v29, &v69);

    if (v27) {
      goto LABEL_9;
    }
    unint64_t v31 = (void *)sub_247750AF8();
    id v70 = 0;
    unsigned int v32 = objc_msgSend(v30, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v31, 1, 0, &v70);

    if (v32)
    {
      id v33 = v70;
LABEL_9:
      unsigned int v20 = v66;
      uint64_t v34 = v68;
      goto LABEL_16;
    }
    id v35 = v70;
    uint64_t v36 = (void *)sub_24774FE78();

    swift_willThrow();
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v37 = v67;
    uint64_t v38 = __swift_project_value_buffer(v67, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*v53)(v51, v38, v37);
    id v39 = v36;
    id v40 = v36;
    uint64_t v41 = sub_247750138();
    os_log_type_t v42 = sub_247750C68();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = v50;
      v48[2] = v43 + 4;
      id v45 = v36;
      unint64_t v46 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v70 = v46;
      sub_247750CF8();
      *uint64_t v44 = v46;

      _os_log_impl(&dword_24770E000, v41, v42, "Failed to create directory for shortcut: %@", v43, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
      swift_arrayDestroy();
      MEMORY[0x24C55C7C0](v44, -1, -1);
      MEMORY[0x24C55C7C0](v43, -1, -1);
    }
    else
    {
    }
    unsigned int v20 = v66;
    uint64_t v34 = v68;
    (*v52)(v51, v67);
LABEL_16:
    sub_24774FE08();
    swift_allocObject();
    sub_24774FDF8();
    sub_24772A1B8(&qword_26925F748, MEMORY[0x263F84D68]);
    uint64_t v21 = sub_24774FDE8();
    unint64_t v23 = v22;
    id v24 = objc_msgSend(v49, sel_defaultManager);
    uint64_t v25 = (void *)sub_247750AF8();
    swift_bridgeObjectRelease();
    uint64_t v26 = (void *)sub_24774FEE8();
    objc_msgSend(v24, sel_createFileAtPath_contents_attributes_, v25, v26, 0);
    sub_24772A068(v21, v23);
    swift_release();

    uint64_t v10 = v64;
    (*v54)(v20, v64);
    v18 += v56;
    uint64_t v14 = v34 - 1;
  }
  while (v14);

  swift_bridgeObjectRelease();
  return v61;
}

uint64_t sub_247726104(char *a1, char *a2, char *a3, char *a4, void *a5)
{
  id v88 = a5;
  uint64_t v89 = sub_24774FF38();
  uint64_t v10 = *(void *)(v89 - 8);
  MEMORY[0x270FA5388](v89);
  long long v87 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F738);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v77 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v82 = (char *)&v74 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  long long v80 = (char *)&v74 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v84 = (char *)&v74 - v19;
  uint64_t v20 = a2 - a1;
  uint64_t v21 = a2 - a1 + 15;
  if (a2 - a1 >= 0) {
    uint64_t v21 = a2 - a1;
  }
  uint64_t v22 = v21 >> 4;
  uint64_t v78 = a3;
  uint64_t v23 = a3 - a2;
  uint64_t v24 = v23 / 16;
  uint64_t v92 = a1;
  uint64_t v91 = a4;
  uint64_t v74 = v5;
  if (v21 >> 4 >= v23 / 16)
  {
    if (v23 >= -15)
    {
      if (a4 != a2 || &a2[16 * v24] <= a4) {
        memmove(a4, a2, 16 * v24);
      }
      unint64_t v46 = &a4[16 * v24];
      long long v90 = v46;
      uint64_t v92 = a2;
      if (v23 >= 16 && a1 < a2)
      {
        long long v80 = (char *)(v10 + 32);
        long long v81 = (void **)(v10 + 56);
        uint64_t v79 = (char *)(v10 + 48);
        uint64_t v75 = (void (**)(char *, uint64_t))(v10 + 8);
        uint64_t v76 = a4;
        uint64_t v47 = v78 - 16;
        uint64_t v48 = a2;
        uint64_t v85 = a1;
        do
        {
          uint64_t v83 = v47;
          long long v86 = a2;
          uint64_t v78 = v46;
          v46 -= 16;
          id v49 = (char *)*((void *)v48 - 1);
          v48 -= 16;
          swift_bridgeObjectRetain();
          uint64_t v84 = v49;
          swift_bridgeObjectRetain();
          uint64_t v25 = (void *)sub_247750AF8();
          id v50 = objc_msgSend(v88, sel_dateFromString_, v25);

          if (!v50) {
            goto LABEL_54;
          }
          unint64_t v51 = v87;
          sub_24774FF18();

          uint64_t v52 = *(void (**)(char *, char *, uint64_t))v80;
          id v53 = v82;
          uint64_t v54 = v89;
          (*(void (**)(char *, char *, uint64_t))v80)(v82, v51, v89);
          uint64_t v25 = *v81;
          ((void (*)(char *, void, uint64_t, uint64_t))*v81)(v53, 0, 1, v54);
          uint64_t v55 = *(unsigned int (**)(char *, uint64_t, uint64_t))v79;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))v79)(v53, 1, v54) == 1) {
            goto LABEL_55;
          }
          uint64_t v56 = (void *)sub_247750AF8();
          id v57 = objc_msgSend(v88, sel_dateFromString_, v56);

          if (!v57) {
            goto LABEL_56;
          }
          uint64_t v58 = v87;
          sub_24774FF18();

          uint64_t v59 = v77;
          uint64_t v60 = v58;
          uint64_t v61 = v89;
          v52(v77, v60, v89);
          ((void (*)(char *, void, uint64_t, uint64_t))v25)(v59, 0, 1, v61);
          if (v55(v59, 1, v61) == 1) {
            goto LABEL_57;
          }
          uint64_t v62 = v82;
          id v63 = v83 + 16;
          char v64 = sub_24774FF08();
          id v65 = v59;
          char v66 = v64;
          uint64_t v67 = *v75;
          (*v75)(v65, v61);
          v67(v62, v61);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          char v69 = v85;
          uint64_t v68 = v86;
          if (v66)
          {
            unint64_t v70 = (unint64_t)v76;
            unint64_t v46 = v78;
            uint64_t v71 = v83;
            if (v63 != v86 || v83 >= v86) {
              *(_OWORD *)uint64_t v83 = *(_OWORD *)v48;
            }
            uint64_t v92 = v48;
            if ((unint64_t)v46 <= v70) {
              break;
            }
          }
          else
          {
            long long v90 = v46;
            unint64_t v72 = (unint64_t)v76;
            uint64_t v71 = v83;
            if (v63 < v78 || v83 >= v78 || v63 != v78) {
              *(_OWORD *)uint64_t v83 = *(_OWORD *)v46;
            }
            uint64_t v48 = v68;
            if ((unint64_t)v46 <= v72) {
              break;
            }
          }
          uint64_t v47 = v71 - 16;
          a2 = v48;
        }
        while (v48 > v69);
      }
LABEL_49:
      sub_247746CDC((void **)&v92, (const void **)&v91, &v90);
      return 1;
    }
  }
  else if (v20 >= -15)
  {
    if (a4 != a1 || &a1[16 * v22] <= a4) {
      memmove(a4, a1, 16 * v22);
    }
    uint64_t v79 = &a4[16 * v22];
    long long v90 = v79;
    if (v20 >= 16 && a2 < v78)
    {
      uint64_t v82 = (char *)(v10 + 32);
      uint64_t v83 = (char *)(v10 + 56);
      long long v81 = (void **)(v10 + 48);
      uint64_t v77 = (char *)(v10 + 8);
      while (1)
      {
        uint64_t v85 = a1;
        long long v86 = a2;
        uint64_t v25 = (void *)*((void *)a2 + 1);
        uint64_t v26 = a4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unsigned __int8 v27 = (void *)sub_247750AF8();
        id v28 = objc_msgSend(v88, sel_dateFromString_, v27);

        if (!v28) {
          break;
        }
        id v29 = v87;
        sub_24774FF18();

        id v30 = *(void (**)(char *, char *, uint64_t))v82;
        unint64_t v31 = v84;
        uint64_t v32 = v89;
        (*(void (**)(char *, char *, uint64_t))v82)(v84, v29, v89);
        uint64_t v24 = *(void *)v83;
        (*(void (**)(char *, void, uint64_t, uint64_t))v83)(v31, 0, 1, v32);
        id v33 = (unsigned int (*)(char *, uint64_t, uint64_t))*v81;
        if (((unsigned int (*)(char *, uint64_t, uint64_t))*v81)(v31, 1, v32) == 1) {
          goto LABEL_51;
        }
        uint64_t v34 = (void *)sub_247750AF8();
        id v35 = objc_msgSend(v88, sel_dateFromString_, v34);

        if (!v35) {
          goto LABEL_52;
        }
        a4 = v26;
        uint64_t v36 = v87;
        sub_24774FF18();

        uint64_t v37 = v80;
        uint64_t v38 = v89;
        v30(v80, v36, v89);
        ((void (*)(char *, void, uint64_t, uint64_t))v24)(v37, 0, 1, v38);
        if (v33(v37, 1, v38) == 1) {
          goto LABEL_53;
        }
        id v39 = v84;
        char v40 = sub_24774FF08();
        uint64_t v41 = v37;
        char v42 = v40;
        uint64_t v24 = (uint64_t)v77;
        uint64_t v43 = *(void (**)(char *, uint64_t))v77;
        (*(void (**)(char *, uint64_t))v77)(v41, v38);
        v43(v39, v38);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v42)
        {
          uint64_t v44 = v85;
          id v45 = v86 + 16;
          if (v85 < v86 || v85 >= v45 || v85 != v86) {
            *(_OWORD *)uint64_t v85 = *(_OWORD *)v86;
          }
        }
        else
        {
          uint64_t v44 = v85;
          id v45 = v86;
          if (v85 != a4) {
            *(_OWORD *)uint64_t v85 = *(_OWORD *)a4;
          }
          a4 += 16;
          uint64_t v91 = a4;
        }
        a1 = v44 + 16;
        uint64_t v92 = a1;
        if (a4 < v79)
        {
          a2 = v45;
          if (v45 < v78) {
            continue;
          }
        }
        goto LABEL_49;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))v83)(v84, 1, 1, v89);
LABEL_51:
      __break(1u);
LABEL_52:
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v24)(v80, 1, 1, v89);
LABEL_53:
      __break(1u);
LABEL_54:
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v81)(v82, 1, 1, v89);
LABEL_55:
      __break(1u);
LABEL_56:
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v25)(v77, 1, 1, v89);
LABEL_57:
      __break(1u);
      goto LABEL_58;
    }
    goto LABEL_49;
  }
LABEL_58:

  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_247726998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  id v52 = a5;
  uint64_t v40 = a1;
  uint64_t v53 = sub_24774FF38();
  uint64_t v9 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  unint64_t v51 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F738);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v12);
  id v50 = (char *)&v38 - v16;
  uint64_t v39 = a2;
  if (a3 != a2)
  {
    uint64_t v17 = *a4;
    uint64_t v48 = (void (**)(char *, char *, uint64_t))(v9 + 32);
    id v49 = (char **)(v9 + 56);
    uint64_t v47 = (uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
    char v42 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v43 = v14;
    uint64_t v44 = v17;
    uint64_t v18 = (void *)(v17 + 16 * a3);
LABEL_5:
    uint64_t v45 = a3;
    uint64_t v46 = v40;
    uint64_t v41 = v18;
    while (1)
    {
      uint64_t v19 = *(v18 - 1);
      swift_bridgeObjectRetain();
      uint64_t v54 = v19;
      swift_bridgeObjectRetain();
      uint64_t v20 = (void *)sub_247750AF8();
      id v21 = objc_msgSend(v52, sel_dateFromString_, v20);

      if (!v21) {
        break;
      }
      uint64_t v22 = v51;
      sub_24774FF18();

      uint64_t v23 = *v48;
      uint64_t v24 = v50;
      uint64_t v25 = v22;
      uint64_t v26 = v53;
      (*v48)(v50, v25, v53);
      uint64_t v5 = *v49;
      ((void (*)(char *, void, uint64_t, uint64_t))*v49)(v24, 0, 1, v26);
      unsigned __int8 v27 = *v47;
      if ((*v47)(v24, 1, v26) == 1) {
        goto LABEL_15;
      }
      id v28 = (void *)sub_247750AF8();
      id v29 = objc_msgSend(v52, sel_dateFromString_, v28);

      if (!v29) {
        goto LABEL_16;
      }
      id v30 = v51;
      sub_24774FF18();

      unint64_t v31 = v43;
      uint64_t v32 = v53;
      v23(v43, v30, v53);
      ((void (*)(char *, void, uint64_t, uint64_t))v5)(v31, 0, 1, v32);
      uint64_t result = v27(v31, 1, v32);
      if (result == 1) {
        goto LABEL_17;
      }
      uint64_t v5 = v50;
      char v33 = sub_24774FF08();
      uint64_t v34 = *v42;
      (*v42)(v31, v32);
      v34(v5, v32);
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v35 = v45;
      if (v33)
      {
        if (!v44) {
          goto LABEL_18;
        }
        uint64_t v37 = *v18;
        uint64_t v36 = v18[1];
        *(_OWORD *)uint64_t v18 = *((_OWORD *)v18 - 1);
        *(v18 - 1) = v36;
        *(v18 - 2) = v37;
        v18 -= 2;
        if (v35 != ++v46) {
          continue;
        }
      }
      a3 = v35 + 1;
      uint64_t v18 = v41 + 2;
      if (a3 == v39) {
        return result;
      }
      goto LABEL_5;
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))*v49)(v50, 1, 1, v53);
LABEL_15:
    __break(1u);
LABEL_16:
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v5)(v43, 1, 1, v53);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
  return result;
}

void sub_247726DB4(unint64_t a1, char *a2)
{
  uint64_t v5 = sub_24774FF38();
  unint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v168 = (char *)&v140 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F738);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v163 = (char *)&v140 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v146 = (char *)&v140 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v153 = (char *)&v140 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v140 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v144 = (uint64_t *)((char *)&v140 - v21);
  uint64_t v22 = *(void *)(a1 + 8);
  uint64_t v23 = a2;
  uint64_t v24 = sub_247750FB8();
  if (v24 >= v22)
  {
    if (v22 < 0) {
      goto LABEL_147;
    }
    if (v22)
    {
      unsigned __int8 v27 = v23;
      sub_247726998(0, v22, 1, (uint64_t *)a1, v27);
    }
    else
    {
    }
    goto LABEL_125;
  }
  if (v22 >= 0) {
    uint64_t v25 = v22;
  }
  else {
    uint64_t v25 = v22 + 1;
  }
  if (v22 < -1) {
    goto LABEL_167;
  }
  uint64_t v142 = v24;
  uint64_t v143 = v20;
  uint64_t v141 = (unint64_t **)a1;
  uint64_t v169 = v23;
  uint64_t v157 = v11;
  uint64_t v150 = v22;
  if (v22 < 2)
  {
    a2 = (char *)MEMORY[0x263F8EE78];
    uint64_t v154 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v22 == 1) {
      goto LABEL_12;
    }
    unint64_t v6 = *(void *)(MEMORY[0x263F8EE78] + 16);
    id v30 = (char *)MEMORY[0x263F8EE78];
LABEL_110:
    if (v6 >= 2)
    {
      char v131 = *v141;
      uint64_t v155 = a2;
      uint64_t v167 = v131;
      do
      {
        unint64_t v132 = v6 - 2;
        if (v6 < 2) {
          goto LABEL_142;
        }
        if (!v131) {
          goto LABEL_162;
        }
        a1 = v6 - 1;
        int64_t v2 = *(void *)&v30[16 * v132 + 32];
        int64_t v133 = *(void *)&v30[16 * v6 + 24];
        a2 = (char *)&v131[2 * v2];
        uint64_t v168 = (char *)&v131[2 * *(void *)&v30[16 * v6 + 16]];
        uint64_t v23 = (char *)&v131[2 * v133];
        uint64_t v134 = v169;
        uint64_t v135 = v156;
        sub_247726104(a2, v168, v23, v154, v134);
        uint64_t v156 = v135;
        if (v135) {
          goto LABEL_122;
        }

        if (v133 < v2) {
          goto LABEL_143;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v30 = sub_247746ED8((uint64_t)v30);
        }
        uint64_t v23 = v169;
        if (v132 >= *((void *)v30 + 2)) {
          goto LABEL_144;
        }
        uint64_t v136 = &v30[16 * v132 + 32];
        *(void *)uint64_t v136 = v2;
        *((void *)v136 + 1) = v133;
        unint64_t v137 = *((void *)v30 + 2);
        if (v6 > v137) {
          goto LABEL_145;
        }
        memmove(&v30[16 * a1 + 32], &v30[16 * v6 + 32], 16 * (v137 - v6));
        *((void *)v30 + 2) = v137 - 1;
        unint64_t v6 = v137 - 1;
        a2 = v155;
        char v131 = v167;
      }
      while (v137 > 2);
    }
    swift_bridgeObjectRelease();
    *((void *)a2 + 2) = 0;

LABEL_124:
    swift_bridgeObjectRelease();
LABEL_125:

    return;
  }
  uint64_t v26 = v25 >> 1;
  a2 = (char *)sub_247750BC8();
  *((void *)a2 + 2) = v26;
  uint64_t v154 = a2 + 32;
LABEL_12:
  id v28 = 0;
  id v29 = *v141;
  uint64_t v166 = (char **)(v6 + 32);
  uint64_t v167 = (unint64_t *)(v6 + 56);
  uint64_t v165 = (char **)(v6 + 48);
  uint64_t v158 = (char **)(v6 + 8);
  uint64_t v140 = v29 + 3;
  id v30 = (char *)MEMORY[0x263F8EE78];
  uint64_t v164 = (char *)v5;
  uint64_t v31 = v150;
  uint64_t v159 = v29;
  uint64_t v155 = a2;
  while (1)
  {
    uint64_t v32 = (uint64_t)v28;
    uint64_t v33 = (uint64_t)(v28 + 1);
    uint64_t v148 = v30;
    uint64_t v149 = v28;
    if ((uint64_t)(v28 + 1) < v31)
    {
      uint64_t v34 = (char *)v29[2 * (void)v28 + 1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v35 = (void *)sub_247750AF8();
      id v36 = objc_msgSend(v23, sel_dateFromString_, v35);

      if (!v36) {
        goto LABEL_163;
      }
      uint64_t v37 = v168;
      sub_24774FF18();

      uint64_t v38 = v144;
      uint64_t v39 = v37;
      a2 = v164;
      uint64_t v162 = *v166;
      ((void (*)(uint64_t *, char *, char *))v162)(v144, v39, v164);
      int64_t v2 = *v167;
      ((void (*)(uint64_t *, void, uint64_t, char *))*v167)(v38, 0, 1, a2);
      uint64_t v161 = *v165;
      if (((unsigned int (*)(uint64_t *, uint64_t, char *))v161)(v38, 1, a2) == 1) {
        goto LABEL_164;
      }
      uint64_t v40 = (void *)sub_247750AF8();
      id v41 = objc_msgSend(v23, sel_dateFromString_, v40);

      id v30 = v148;
      if (!v41) {
        goto LABEL_165;
      }
      uint64_t v160 = v34;
      char v42 = v168;
      sub_24774FF18();

      uint64_t v43 = v143;
      ((void (*)(char *, char *, char *))v162)(v143, v42, a2);
      ((void (*)(char *, void, uint64_t, char *))v2)(v43, 0, 1, a2);
      if (((unsigned int (*)(char *, uint64_t, char *))v161)(v43, 1, a2) == 1) {
        goto LABEL_166;
      }
      a1 = (unint64_t)v144;
      int v147 = sub_24774FF08();
      unint64_t v6 = (unint64_t)v158;
      uint64_t v44 = *v158;
      ((void (*)(char *, char *))*v158)(v43, a2);
      uint64_t v145 = v44;
      ((void (*)(unint64_t, char *))v44)(a1, a2);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v32 = (uint64_t)v149;
      uint64_t v33 = (uint64_t)(v149 + 2);
      if ((uint64_t)(v149 + 2) < v150)
      {
        uint64_t v45 = (char *)&v140[2 * (void)v149];
        while (1)
        {
          uint64_t v160 = (char *)v33;
          uint64_t v48 = (char *)*((void *)v45 + 2);
          uint64_t v47 = v45 + 16;
          uint64_t v46 = v48;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          a2 = (char *)sub_247750AF8();
          id v49 = objc_msgSend(v23, sel_dateFromString_, a2);

          if (!v49) {
            goto LABEL_157;
          }
          a2 = v168;
          sub_24774FF18();

          id v50 = v153;
          a1 = (unint64_t)v164;
          ((void (*)(char *, char *, char *))v162)(v153, a2, v164);
          ((void (*)(char *, void, uint64_t, unint64_t))v2)(v50, 0, 1, a1);
          if (((unsigned int (*)(char *, uint64_t, unint64_t))v161)(v50, 1, a1) == 1) {
            goto LABEL_158;
          }
          uint64_t v151 = v47;
          uint64_t v152 = v46;
          a2 = (char *)sub_247750AF8();
          id v51 = objc_msgSend(v23, sel_dateFromString_, a2);

          id v30 = v148;
          if (!v51) {
            goto LABEL_159;
          }
          a2 = v168;
          sub_24774FF18();

          id v52 = v146;
          ((void (*)(char *, char *, unint64_t))v162)(v146, a2, a1);
          int64_t v53 = v2;
          ((void (*)(char *, void, uint64_t, unint64_t))v2)(v52, 0, 1, a1);
          if (((unsigned int (*)(char *, uint64_t, unint64_t))v161)(v52, 1, a1) == 1) {
            goto LABEL_160;
          }
          uint64_t v54 = v153;
          int v55 = sub_24774FF08();
          uint64_t v56 = v52;
          int v57 = v55;
          int64_t v2 = (int64_t)v158;
          unint64_t v6 = (unint64_t)v145;
          ((void (*)(char *, unint64_t))v145)(v56, a1);
          ((void (*)(char *, unint64_t))v6)(v54, a1);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v147 ^ v57)) {
            break;
          }
          uint64_t v33 = (uint64_t)(v160 + 1);
          uint64_t v45 = v151;
          int64_t v2 = v53;
          if ((char *)v150 == v160 + 1)
          {
            uint64_t v33 = v150;
            goto LABEL_30;
          }
        }
        uint64_t v33 = (uint64_t)v160;
LABEL_30:
        uint64_t v32 = (uint64_t)v149;
      }
      id v29 = v159;
      a2 = v155;
      if (v147)
      {
        if (v33 < v32) {
          goto LABEL_148;
        }
        if (v32 < v33)
        {
          uint64_t v58 = 2 * v33;
          uint64_t v59 = 2 * v32;
          uint64_t v60 = v33;
          uint64_t v61 = v32;
          do
          {
            if (v61 != --v60)
            {
              if (!v29) {
                goto LABEL_161;
              }
              uint64_t v62 = &v29[v58];
              unint64_t v63 = v29[v59];
              unint64_t v64 = v29[v59 + 1];
              *(_OWORD *)&v29[v59] = *(_OWORD *)&v29[v58 - 2];
              *(v62 - 2) = v63;
              *(v62 - 1) = v64;
            }
            ++v61;
            v58 -= 2;
            v59 += 2;
          }
          while (v61 < v60);
        }
      }
    }
    if (v33 < v150)
    {
      if (__OFSUB__(v33, v32)) {
        goto LABEL_146;
      }
      if (v33 - v32 < v142) {
        break;
      }
    }
LABEL_60:
    if (v33 < v32) {
      goto LABEL_141;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v160 = (char *)v33;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      id v30 = sub_247746BE0(0, *((void *)v30 + 2) + 1, 1, v30);
    }
    unint64_t v81 = *((void *)v30 + 2);
    unint64_t v80 = *((void *)v30 + 3);
    unint64_t v6 = v81 + 1;
    id v29 = v159;
    uint64_t v82 = v149;
    if (v81 >= v80 >> 1)
    {
      uint64_t v130 = sub_247746BE0((char *)(v80 > 1), v81 + 1, 1, v30);
      uint64_t v82 = v149;
      id v29 = v159;
      id v30 = v130;
    }
    *((void *)v30 + 2) = v6;
    uint64_t v83 = v30 + 32;
    uint64_t v84 = &v30[16 * v81 + 32];
    *(void *)uint64_t v84 = v82;
    *((void *)v84 + 1) = v160;
    if (v81)
    {
      uint64_t v152 = v30 + 32;
      while (1)
      {
        unint64_t v85 = v6 - 1;
        if (v6 >= 4)
        {
          long long v90 = &v83[16 * v6];
          uint64_t v91 = *((void *)v90 - 8);
          uint64_t v92 = *((void *)v90 - 7);
          BOOL v96 = __OFSUB__(v92, v91);
          uint64_t v93 = v92 - v91;
          if (v96) {
            goto LABEL_130;
          }
          uint64_t v95 = *((void *)v90 - 6);
          uint64_t v94 = *((void *)v90 - 5);
          BOOL v96 = __OFSUB__(v94, v95);
          uint64_t v88 = v94 - v95;
          char v89 = v96;
          if (v96) {
            goto LABEL_131;
          }
          unint64_t v97 = v6 - 2;
          id v98 = &v83[16 * v6 - 32];
          uint64_t v100 = *(void *)v98;
          uint64_t v99 = *((void *)v98 + 1);
          BOOL v96 = __OFSUB__(v99, v100);
          uint64_t v101 = v99 - v100;
          if (v96) {
            goto LABEL_133;
          }
          BOOL v96 = __OFADD__(v88, v101);
          uint64_t v102 = v88 + v101;
          if (v96) {
            goto LABEL_136;
          }
          if (v102 >= v93)
          {
            uint64_t v120 = &v83[16 * v85];
            uint64_t v122 = *(void *)v120;
            uint64_t v121 = *((void *)v120 + 1);
            BOOL v96 = __OFSUB__(v121, v122);
            uint64_t v123 = v121 - v122;
            if (v96) {
              goto LABEL_140;
            }
            BOOL v113 = v88 < v123;
            goto LABEL_98;
          }
        }
        else
        {
          if (v6 != 3)
          {
            uint64_t v114 = *((void *)v30 + 4);
            uint64_t v115 = *((void *)v30 + 5);
            BOOL v96 = __OFSUB__(v115, v114);
            uint64_t v107 = v115 - v114;
            char v108 = v96;
            goto LABEL_92;
          }
          uint64_t v87 = *((void *)v30 + 4);
          uint64_t v86 = *((void *)v30 + 5);
          BOOL v96 = __OFSUB__(v86, v87);
          uint64_t v88 = v86 - v87;
          char v89 = v96;
        }
        if (v89) {
          goto LABEL_132;
        }
        unint64_t v97 = v6 - 2;
        uint64_t v103 = &v83[16 * v6 - 32];
        uint64_t v105 = *(void *)v103;
        uint64_t v104 = *((void *)v103 + 1);
        BOOL v106 = __OFSUB__(v104, v105);
        uint64_t v107 = v104 - v105;
        char v108 = v106;
        if (v106) {
          goto LABEL_135;
        }
        char v109 = &v83[16 * v85];
        uint64_t v111 = *(void *)v109;
        uint64_t v110 = *((void *)v109 + 1);
        BOOL v96 = __OFSUB__(v110, v111);
        uint64_t v112 = v110 - v111;
        if (v96) {
          goto LABEL_138;
        }
        if (__OFADD__(v107, v112)) {
          goto LABEL_139;
        }
        if (v107 + v112 >= v88)
        {
          BOOL v113 = v88 < v112;
LABEL_98:
          if (v113) {
            unint64_t v85 = v97;
          }
          goto LABEL_100;
        }
LABEL_92:
        if (v108) {
          goto LABEL_134;
        }
        uint64_t v116 = &v83[16 * v85];
        uint64_t v118 = *(void *)v116;
        uint64_t v117 = *((void *)v116 + 1);
        BOOL v96 = __OFSUB__(v117, v118);
        uint64_t v119 = v117 - v118;
        if (v96) {
          goto LABEL_137;
        }
        if (v119 < v107) {
          goto LABEL_14;
        }
LABEL_100:
        a1 = v85 - 1;
        if (v85 - 1 >= v6)
        {
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
          goto LABEL_150;
        }
        if (!v29) {
          goto LABEL_156;
        }
        uint64_t v23 = &v83[16 * a1];
        int64_t v2 = *(void *)v23;
        a2 = (char *)v85;
        uint64_t v124 = &v83[16 * v85];
        int64_t v125 = *((void *)v124 + 1);
        uint64_t v126 = (char *)&v29[2 * *(void *)v23];
        uint64_t v127 = (char *)&v29[2 * *(void *)v124];
        uint64_t v161 = (char *)&v29[2 * v125];
        uint64_t v162 = v126;
        unint64_t v6 = v169;
        uint64_t v128 = v156;
        sub_247726104(v162, v127, v161, v154, (void *)v6);
        uint64_t v156 = v128;
        if (v128)
        {
LABEL_122:
          swift_bridgeObjectRelease();
          uint64_t v23 = v169;

          *((void *)v155 + 2) = 0;
          goto LABEL_124;
        }

        if (v125 < v2) {
          goto LABEL_127;
        }
        if ((unint64_t)a2 > *((void *)v30 + 2)) {
          goto LABEL_128;
        }
        uint64_t v129 = a2;
        *(void *)uint64_t v23 = v2;
        uint64_t v83 = v152;
        *(void *)&v152[16 * a1 + 8] = v125;
        a2 = (char *)*((void *)v30 + 2);
        if (v129 >= a2) {
          goto LABEL_129;
        }
        unint64_t v6 = (unint64_t)(a2 - 1);
        memmove(v124, v124 + 16, 16 * (a2 - 1 - v129));
        *((void *)v30 + 2) = a2 - 1;
        BOOL v113 = (unint64_t)a2 > 2;
        uint64_t v23 = v169;
        a2 = v155;
        id v29 = v159;
        if (!v113) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v6 = 1;
LABEL_14:
    uint64_t v31 = v150;
    id v28 = v160;
    if ((uint64_t)v160 >= v150) {
      goto LABEL_110;
    }
  }
  id v65 = (char *)(v32 + v142);
  if (__OFADD__(v32, v142)) {
    goto LABEL_149;
  }
  if ((uint64_t)v65 >= v150) {
    id v65 = (char *)v150;
  }
  if ((uint64_t)v65 >= v32)
  {
    if ((char *)v33 != v65)
    {
      a1 = (unint64_t)&v29[2 * v33];
      uint64_t v151 = v65;
      do
      {
        uint64_t v67 = (char *)v29[2 * v33 + 1];
        uint64_t v68 = v149;
        uint64_t v152 = (char *)a1;
        uint64_t v160 = (char *)v33;
        while (1)
        {
          uint64_t v161 = v68;
          int64_t v2 = a1 - 16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v162 = v67;
          a2 = (char *)sub_247750AF8();
          id v69 = objc_msgSend(v23, sel_dateFromString_, a2);

          if (!v69) {
            goto LABEL_153;
          }
          unint64_t v70 = v168;
          sub_24774FF18();

          uint64_t v23 = *v166;
          uint64_t v71 = v163;
          unint64_t v72 = v70;
          a2 = v164;
          ((void (*)(char *, char *, char *))*v166)(v163, v72, v164);
          unint64_t v6 = *v167;
          ((void (*)(char *, void, uint64_t, char *))*v167)(v71, 0, 1, a2);
          uint64_t v73 = *v165;
          if (((unsigned int (*)(char *, uint64_t, char *))*v165)(v71, 1, a2) == 1) {
            goto LABEL_154;
          }
          a2 = (char *)sub_247750AF8();
          id v74 = objc_msgSend(v169, sel_dateFromString_, a2);

          if (!v74) {
            goto LABEL_151;
          }
          a2 = v168;
          sub_24774FF18();

          uint64_t v75 = v157;
          uint64_t v76 = v164;
          ((void (*)(char *, char *, char *))v23)(v157, a2, v164);
          ((void (*)(char *, void, uint64_t, char *))v6)(v75, 0, 1, v76);
          uint64_t v23 = v76;
          if (((unsigned int (*)(char *, uint64_t, char *))v73)(v75, 1, v76) == 1) {
            goto LABEL_152;
          }
          unint64_t v6 = (unint64_t)v163;
          char v77 = sub_24774FF08();
          a2 = *v158;
          ((void (*)(char *, char *))*v158)(v75, v23);
          ((void (*)(unint64_t, char *))a2)(v6, v23);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v23 = v169;
          if ((v77 & 1) == 0) {
            break;
          }
          id v29 = v159;
          char v66 = v160;
          if (!v159) {
            goto LABEL_155;
          }
          uint64_t v78 = *(void *)a1;
          uint64_t v67 = *(char **)(a1 + 8);
          *(_OWORD *)a1 = *(_OWORD *)v2;
          *(void *)(a1 - 8) = v67;
          *(void *)(a1 - 16) = v78;
          a1 -= 16;
          uint64_t v68 = v161 + 1;
          if (v66 == v161 + 1) {
            goto LABEL_49;
          }
        }
        id v29 = v159;
        char v66 = v160;
LABEL_49:
        uint64_t v33 = (uint64_t)(v66 + 1);
        a1 = (unint64_t)(v152 + 16);
      }
      while ((char *)v33 != v151);
      uint64_t v33 = (uint64_t)v151;
      a2 = v155;
      id v30 = v148;
      uint64_t v32 = (uint64_t)v149;
    }
    goto LABEL_60;
  }
LABEL_150:
  __break(1u);
LABEL_151:
  ((void (*)(char *, uint64_t, uint64_t, char *))v6)(v157, 1, 1, v164);
LABEL_152:
  __break(1u);
LABEL_153:
  ((void (*)(char *, uint64_t, uint64_t, char *))*v167)(v163, 1, 1, v164);
LABEL_154:
  __break(1u);
LABEL_155:

  __break(1u);
LABEL_156:
  uint64_t v138 = v169;

  __break(1u);
LABEL_157:
  ((void (*)(char *, uint64_t, uint64_t, char *))v2)(v153, 1, 1, v164);
LABEL_158:
  __break(1u);
LABEL_159:
  ((void (*)(char *, uint64_t, uint64_t, unint64_t))v2)(v146, 1, 1, a1);
LABEL_160:
  __break(1u);
LABEL_161:

  __break(1u);
LABEL_162:
  uint64_t v139 = v169;

  __break(1u);
LABEL_163:
  ((void (*)(uint64_t *, uint64_t, uint64_t, char *))*v167)(v144, 1, 1, v164);
LABEL_164:
  __break(1u);
LABEL_165:
  ((void (*)(char *, uint64_t, uint64_t, char *))v2)(v143, 1, 1, a2);
LABEL_166:
  __break(1u);
LABEL_167:

  sub_247750E78();
  __break(1u);
}

void sub_247727E30(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  id v4 = a2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_2477470E0(v3);
  }
  uint64_t v5 = *(void *)(v3 + 16);
  v7[0] = v3 + 32;
  v7[1] = v5;
  unint64_t v6 = (char *)v4;
  sub_247726DB4((unint64_t)v7, v6);

  *a1 = v3;
}

void sub_247727EC8(void *a1)
{
  id v77 = a1;
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v1 = sub_247750158();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v65 - v6;
  uint64_t v8 = sub_24774FE88();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v76 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F730);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v73 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24774FEC8();
  uint64_t v74 = *(void *)(v13 - 8);
  uint64_t v75 = v13;
  MEMORY[0x270FA5388](v13);
  unint64_t v72 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_msgSend(self, sel_defaultManager);
  if (qword_26925F128 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = (void *)sub_247750AF8();
  swift_bridgeObjectRelease();
  id v81 = 0;
  id v17 = objc_msgSend(v15, sel_contentsOfDirectoryAtPath_error_, v16, &v81);

  id v18 = v81;
  if (v17)
  {
    uint64_t v19 = sub_247750B98();
    id v20 = v18;

    unint64_t v21 = *(void *)(v19 + 16);
    if (v21 < 0x1F5)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v65 = v9;
      uint64_t v66 = v8;
      uint64_t v67 = v5;
      uint64_t v70 = v2;
      id v71 = v15;
      uint64_t v69 = v1;
      unint64_t v80 = (void *)MEMORY[0x263F8EE78];
      sub_24771EA78(0, v21, 0);
      uint64_t v22 = v80;
      sub_247715DE0();
      uint64_t v68 = v19;
      uint64_t v23 = (uint64_t *)(v19 + 40);
      do
      {
        uint64_t v24 = *v23;
        id v81 = (id)*(v23 - 1);
        uint64_t v82 = v24;
        uint64_t v78 = 46;
        unint64_t v79 = 0xE100000000000000;
        swift_bridgeObjectRetain();
        uint64_t v25 = (void *)sub_247750D18();
        if (v25[2])
        {
          uint64_t v27 = v25[4];
          unint64_t v26 = v25[5];
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v27 = 0;
          unint64_t v26 = 0xE000000000000000;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v80 = v22;
        unint64_t v29 = v22[2];
        unint64_t v28 = v22[3];
        if (v29 >= v28 >> 1)
        {
          sub_24771EA78(v28 > 1, v29 + 1, 1);
          uint64_t v22 = v80;
        }
        v23 += 2;
        v22[2] = v29 + 1;
        id v30 = &v22[2 * v29];
        v30[4] = v27;
        v30[5] = v26;
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
      id v81 = v22;
      id v44 = v77;
      swift_bridgeObjectRetain();
      sub_247727E30((uint64_t *)&v81, v44);
      swift_bridgeObjectRelease();

      uint64_t v45 = v81;
      id v81 = (id)qword_26925F670;
      uint64_t v82 = *(void *)algn_26925F678;
      uint64_t v46 = v69;
      id v47 = v71;
      if (v45[2])
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_release();
        sub_247750B58();
        swift_bridgeObjectRelease();
        sub_247750B58();
        uint64_t v48 = v74;
        uint64_t v49 = v75;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v74 + 56))(v73, 1, 1, v75);
        (*(void (**)(char *, void, uint64_t))(v65 + 104))(v76, *MEMORY[0x263F06E50], v66);
        id v50 = v72;
        sub_24774FEB8();
        id v51 = (void *)sub_24774FEA8();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v49);
        id v81 = 0;
        unsigned int v52 = objc_msgSend(v47, sel_removeItemAtURL_error_, v51, &v81);

        id v53 = v81;
        if (v52)
        {
        }
        else
        {
          uint64_t v54 = v53;
          int v55 = (void *)sub_24774FE78();

          swift_willThrow();
          if (qword_26925F138 != -1) {
            swift_once();
          }
          uint64_t v56 = __swift_project_value_buffer(v46, (uint64_t)qword_26925F898);
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v67, v56, v46);
          id v57 = v55;
          id v58 = v55;
          uint64_t v59 = sub_247750138();
          os_log_type_t v60 = sub_247750C68();
          if (os_log_type_enabled(v59, v60))
          {
            uint64_t v61 = (uint8_t *)swift_slowAlloc();
            uint64_t v62 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v61 = 138412290;
            id v63 = v55;
            uint64_t v64 = _swift_stdlib_bridgeErrorToNSError();
            uint64_t v78 = v64;
            sub_247750CF8();
            void *v62 = v64;

            _os_log_impl(&dword_24770E000, v59, v60, "Failed to delete old file error: %@", v61, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
            swift_arrayDestroy();
            MEMORY[0x24C55C7C0](v62, -1, -1);
            MEMORY[0x24C55C7C0](v61, -1, -1);
          }
          else
          {
          }
          (*(void (**)(char *, uint64_t))(v70 + 8))(v67, v46);
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_release();
        __break(1u);

        swift_release();
        __break(1u);
      }
    }
  }
  else
  {
    id v31 = v81;
    uint64_t v32 = (void *)sub_24774FE78();

    swift_willThrow();
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v1, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v33, v1);
    id v34 = v32;
    id v35 = v32;
    id v36 = sub_247750138();
    os_log_type_t v37 = sub_247750C68();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v70 = v2;
      uint64_t v40 = (void *)v39;
      id v71 = v15;
      *(_DWORD *)uint64_t v38 = 138412290;
      id v41 = v32;
      uint64_t v42 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v78 = v42;
      sub_247750CF8();
      *uint64_t v40 = v42;

      _os_log_impl(&dword_24770E000, v36, v37, "Failed to read directory: %@", v38, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
      swift_arrayDestroy();
      uint64_t v43 = v40;
      uint64_t v2 = v70;
      MEMORY[0x24C55C7C0](v43, -1, -1);
      MEMORY[0x24C55C7C0](v38, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  }
}

uint64_t _sSo8AVSStoreC22AdaptiveVoiceShortcutsE22storeEventForDebugging5eventyAC08AVSDebugF0V_tF_0(uint64_t a1)
{
  uint64_t v64 = a1;
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v67 = sub_247750158();
  uint64_t v1 = *(void *)(v67 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v67);
  uint64_t v66 = (char *)v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v58 = (char *)v55 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v55 - v6;
  uint64_t v8 = sub_24774FF38();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v57 = self;
  id v12 = objc_msgSend(v57, sel_defaultManager);
  if (qword_26925F128 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_26925F670;
  uint64_t v14 = *(void (**)(char *, uint64_t))algn_26925F678;
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v16 = (void *)sub_247750AF8();
  objc_msgSend(v15, sel_setDateFormat_, v16);

  uint64_t v70 = v13;
  unint64_t v71 = (unint64_t)v14;
  id v63 = v14;
  swift_bridgeObjectRetain();
  sub_24774FF28();
  id v17 = (void *)sub_24774FEF8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v65 = v15;
  id v18 = objc_msgSend(v15, sel_stringFromDate_, v17);

  sub_247750B08();
  sub_247750B58();
  swift_bridgeObjectRelease();
  sub_247750B58();
  unint64_t v19 = v71;
  uint64_t v62 = v70;
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v20 = v67;
  uint64_t v21 = __swift_project_value_buffer(v67, (uint64_t)qword_26925F898);
  swift_beginAccess();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
  uint64_t v60 = v1 + 16;
  uint64_t v61 = v21;
  uint64_t v59 = v22;
  v22(v7, v21, v20);
  swift_bridgeObjectRetain_n();
  uint64_t v23 = sub_247750138();
  os_log_type_t v24 = sub_247750C88();
  if (os_log_type_enabled(v23, v24))
  {
    v55[1] = v13;
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    unint64_t v26 = (void *)swift_slowAlloc();
    uint64_t v56 = v1;
    uint64_t v27 = v26;
    id v69 = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v68 = sub_247745AC4(v62, v19, (uint64_t *)&v69);
    uint64_t v28 = v67;
    sub_247750CF8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24770E000, v23, v24, "Will attempt to store event for debugging file: %s", v25, 0xCu);
    swift_arrayDestroy();
    unint64_t v29 = v27;
    uint64_t v1 = v56;
    MEMORY[0x24C55C7C0](v29, -1, -1);
    MEMORY[0x24C55C7C0](v25, -1, -1);

    id v30 = *(void (**)(char *, uint64_t))(v1 + 8);
    v30(v7, v28);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    id v30 = *(void (**)(char *, uint64_t))(v1 + 8);
    v30(v7, v67);
  }
  LOBYTE(v68) = 1;
  id v31 = (void *)sub_247750AF8();
  unsigned __int8 v32 = objc_msgSend(v12, sel_fileExistsAtPath_isDirectory_, v31, &v68);

  if ((v32 & 1) == 0)
  {
    uint64_t v33 = (void *)sub_247750AF8();
    id v69 = 0;
    unsigned int v34 = objc_msgSend(v12, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v33, 1, 0, &v69);

    if (v34)
    {
      id v35 = v69;
    }
    else
    {
      id v63 = v30;
      id v36 = v69;
      os_log_type_t v37 = (void *)sub_24774FE78();

      swift_willThrow();
      v59(v58, v61, v67);
      id v38 = v37;
      id v39 = v37;
      uint64_t v40 = sub_247750138();
      os_log_type_t v41 = sub_247750C68();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v56 = v1;
        uint64_t v42 = (uint8_t *)swift_slowAlloc();
        uint64_t v43 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v42 = 138412290;
        id v44 = v37;
        id v45 = v12;
        uint64_t v46 = (void *)_swift_stdlib_bridgeErrorToNSError();
        id v69 = v46;
        sub_247750CF8();
        void *v43 = v46;
        id v12 = v45;

        _os_log_impl(&dword_24770E000, v40, v41, "Failed to create directory for debugging events: %@", v42, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
        swift_arrayDestroy();
        MEMORY[0x24C55C7C0](v43, -1, -1);
        MEMORY[0x24C55C7C0](v42, -1, -1);
      }
      else
      {
      }
      v63(v58, v67);
    }
  }
  sub_24774FE08();
  swift_allocObject();
  sub_24774FDF8();
  type metadata accessor for AVSDebugEvent();
  sub_24772A1B8(&qword_26925F720, (void (*)(uint64_t))type metadata accessor for AVSDebugEvent);
  uint64_t v47 = sub_24774FDE8();
  unint64_t v49 = v48;
  id v50 = objc_msgSend(v57, sel_defaultManager);
  id v51 = (void *)sub_247750AF8();
  swift_bridgeObjectRelease();
  unsigned int v52 = (void *)sub_24774FEE8();
  objc_msgSend(v50, sel_createFileAtPath_contents_attributes_, v51, v52, 0);

  id v53 = v65;
  sub_247727EC8(v65);

  sub_24772A068(v47, v49);
  return swift_release();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2477292BC()
{
  unint64_t result = qword_26925F6A0;
  if (!qword_26925F6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F6A0);
  }
  return result;
}

uint64_t type metadata accessor for AVSDebugEvent()
{
  uint64_t result = qword_26925F6E8;
  if (!qword_26925F6E8) {
    return swift_getSingletonMetadata();
  }
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

uint64_t sub_2477293AC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F6B0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247729410(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_247729484(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_2477294A4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_name()
{
  return sel_name;
}

void sub_2477294BC(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_2477294DC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

char *keypath_get_selector_associatedShortcutName()
{
  return sel_associatedShortcutName;
}

void sub_2477294F4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_247729514(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

void keypath_setTm(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  id v7 = (id)sub_247750AF8();
  objc_msgSend(v6, *a5, v7);
}

uint64_t type metadata accessor for AdaptiveVoiceShortcutObjcClass(uint64_t a1)
{
  return sub_24771F388(a1, &qword_26925F6D8);
}

uint64_t type metadata accessor for AVSStore(uint64_t a1)
{
  return sub_24771F388(a1, &qword_26925F6E0);
}

uint64_t *initializeBufferWithCopyOfBuffer for AVSDebugEvent(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24774FF68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(_DWORD *)((char *)a1 + a3[7]) = *(_DWORD *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for AVSDebugEvent(uint64_t a1)
{
  uint64_t v2 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AVSDebugEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AVSDebugEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t initializeWithTake for AVSDebugEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for AVSDebugEvent(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24774FF68();
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
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + a3[7]) = *(_DWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSDebugEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2477299DC);
}

uint64_t sub_2477299DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24774FF68();
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

uint64_t storeEnumTagSinglePayload for AVSDebugEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247729AB4);
}

uint64_t sub_247729AB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24774FF68();
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

uint64_t sub_247729B74()
{
  uint64_t result = sub_24774FF68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AVSDebugEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AVSDebugEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x247729D8CLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_247729DB4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_247729DBC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AVSDebugEvent.CodingKeys()
{
  return &type metadata for AVSDebugEvent.CodingKeys;
}

unint64_t sub_247729DD8()
{
  unint64_t result = qword_26925F6F8;
  if (!qword_26925F6F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F6F8);
  }
  return result;
}

unint64_t sub_247729E30()
{
  unint64_t result = qword_26925F700;
  if (!qword_26925F700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F700);
  }
  return result;
}

unint64_t sub_247729E88()
{
  unint64_t result = qword_26925F708;
  if (!qword_26925F708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F708);
  }
  return result;
}

uint64_t sub_247729EDC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64726F7779656BLL && a2 == 0xE700000000000000 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7479426F69647561 && a2 == 0xEA00000000007365 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_247750FD8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24772A068(uint64_t a1, unint64_t a2)
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

uint64_t sub_24772A0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AdaptiveVoiceShortcut();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24772A124(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F750);
    sub_24772A1B8(a2, (void (*)(uint64_t))type metadata accessor for AdaptiveVoiceShortcut);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24772A1B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24772A200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24772A268(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24772A2C8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F798);
  int v2 = (void *)sub_247750EB8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24773D028(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_24772A3EC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F818);
  uint64_t v2 = sub_247750EB8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24772AE20(v6, (uint64_t)v15);
    unint64_t result = sub_24773D0A0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_24772AE88(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_24772A51C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AVSAutomationSupport()), sel_init);
  qword_26925F7A0 = (uint64_t)result;
  return result;
}

id AVSAutomationSupport.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id static AVSAutomationSupport.shared.getter()
{
  if (qword_26925F130 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26925F7A0;

  return v0;
}

id AVSAutomationSupport.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSAutomationSupport__client] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AVSAutomationSupport();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for AVSAutomationSupport()
{
  return self;
}

id sub_24772A68C()
{
  uint64_t v1 = OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSAutomationSupport__client;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSAutomationSupport__client);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSAutomationSupport__client);
LABEL_6:
    id v11 = v2;
    return v3;
  }
  id v4 = objc_allocWithZone(MEMORY[0x263F22198]);
  uint64_t v5 = (void *)sub_247750AF8();
  uint64_t v6 = (void *)sub_247750AF8();
  id v7 = objc_msgSend(v4, sel_initWithIdentifier_serviceBundleName_, v5, v6);

  char v8 = *(void **)(v0 + v1);
  *(void *)(v0 + v1) = v7;

  id result = *(id *)(v0 + v1);
  if (result)
  {
    id result = objc_msgSend(result, sel_setDelegate_, v0);
    long long v10 = *(void **)(v0 + v1);
    if (v10)
    {
      id v3 = v10;
      objc_super v2 = 0;
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

void sub_24772A78C(uint64_t a1, uint64_t a2)
{
  v28[16] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_247750158();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (AXIsInternalInstall())
  {
    id v8 = sub_24772A68C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F7B0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2477523E0;
    v28[0] = (id)5001813;
    v28[1] = (id)0xE300000000000000;
    uint64_t v10 = MEMORY[0x263F8D310];
    sub_247750DB8();
    *(void *)(inited + 96) = v10;
    *(void *)(inited + 72) = a1;
    *(void *)(inited + 80) = a2;
    swift_bridgeObjectRetain();
    sub_24772A3EC(inited);
    id v11 = (void *)sub_247750AC8();
    swift_bridgeObjectRelease();
    v28[0] = 0;
    id v12 = objc_msgSend(v8, sel_sendSynchronousMessage_withIdentifier_error_, v11, 10001, v28);

    if (v12)
    {
      id v13 = v28[0];
    }
    else
    {
      id v14 = v28[0];
      uint64_t v15 = (void *)sub_24774FE78();

      swift_willThrow();
      if (qword_26925F138 != -1) {
        swift_once();
      }
      uint64_t v16 = __swift_project_value_buffer(v4, (uint64_t)qword_26925F898);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v16, v4);
      id v17 = v15;
      id v18 = v15;
      unint64_t v19 = sub_247750138();
      os_log_type_t v20 = sub_247750C68();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        unint64_t v26 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v21 = 138412290;
        id v22 = v15;
        uint64_t v23 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v27 = v23;
        sub_247750CF8();
        os_log_type_t v24 = v26;
        *unint64_t v26 = v23;

        _os_log_impl(&dword_24770E000, v19, v20, "Error piping audio file into AVS: %@", v21, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
        swift_arrayDestroy();
        MEMORY[0x24C55C7C0](v24, -1, -1);
        MEMORY[0x24C55C7C0](v21, -1, -1);
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
}

id AVSAutomationSupport.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AVSAutomationSupport();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id AVSAutomationSupport.userInterfaceClient(_:accessQueueForProcessingMessageWithIdentifier:)()
{
  id v0 = objc_msgSend(self, sel_mainAccessQueue);

  return v0;
}

uint64_t _s22AdaptiveVoiceShortcuts20AVSAutomationSupportC35connectionWithServiceWasInterrupted22forUserInterfaceClientySo10AXUIClientCSg_tF_0()
{
  uint64_t v0 = sub_247750158();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26925F898);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_247750138();
  os_log_type_t v6 = sub_247750C68();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_24770E000, v5, v6, "Connection to the AVS Service was interrupted", v7, 2u);
    MEMORY[0x24C55C7C0](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t method lookup function for AVSAutomationSupport(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AVSAutomationSupport);
}

uint64_t dispatch thunk of AVSAutomationSupport.pipeFile(inputAudioFile:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t sub_24772AE20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26925F820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24772AE88(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id static AVSSettings.avsFeatureEnabled.getter()
{
  id v0 = objc_msgSend(self, sel_sharedInstance);
  id v1 = objc_msgSend(v0, sel_isAdaptiveVoiceShortcutsEnabled);

  return v1;
}

void static AVSSettings.avsFeatureEnabled.setter(char a1)
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  objc_msgSend(v2, sel_setAdaptiveVoiceShortcutsEnabled_, a1 & 1);
}

id static AVSSettings.shouldHideAudioDonationPrompt.getter()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_247750AF8();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void static AVSSettings.shouldHideAudioDonationPrompt.setter(char a1)
{
  id v2 = objc_msgSend(self, sel_standardUserDefaults);
  id v3 = (id)sub_247750AF8();
  objc_msgSend(v2, sel_setBool_forKey_, a1 & 1, v3);
}

AVSSettings __swiftcall AVSSettings.init()()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return (AVSSettings)objc_msgSend(v0, sel_init);
}

id AVSSettings.init()()
{
  v1.super_class = (Class)AVSSettings;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for AVSSettings()
{
  unint64_t result = qword_26925F890;
  if (!qword_26925F890)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26925F890);
  }
  return result;
}

uint64_t sub_24772B360()
{
  uint64_t v0 = sub_247750158();
  __swift_allocate_value_buffer(v0, qword_26925F898);
  __swift_project_value_buffer(v0, (uint64_t)qword_26925F898);
  return sub_247750148();
}

uint64_t AVSLogger.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_247750158();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26925F898);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t AVSLogger.setter(uint64_t a1)
{
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_247750158();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26925F898);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*AVSLogger.modify())()
{
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_247750158();
  __swift_project_value_buffer(v0, (uint64_t)qword_26925F898);
  swift_beginAccess();
  return j__swift_endAccess;
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

uint64_t sub_24772B684(uint64_t a1)
{
  uint64_t v49 = sub_24774FF68();
  uint64_t v3 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  unint64_t v48 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AvailableShortcutAction();
  uint64_t v46 = *(void *)(v5 - 8);
  uint64_t v47 = v5;
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (!v8) {
    return v9;
  }
  id v45 = v7;
  uint64_t v38 = v1;
  uint64_t v52 = MEMORY[0x263F8EE78];
  sub_24771EA98(0, v8, 0);
  uint64_t v9 = v52;
  uint64_t result = sub_2477372CC(a1);
  uint64_t v12 = result;
  uint64_t v13 = 0;
  uint64_t v14 = a1 + 64;
  uint64_t v43 = a1;
  id v44 = (void (**)(uint64_t, char *, uint64_t))(v3 + 40);
  uint64_t v39 = a1 + 80;
  int64_t v40 = v8;
  uint64_t v41 = v11;
  uint64_t v42 = a1 + 64;
  while ((v12 & 0x8000000000000000) == 0 && v12 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v17 = (unint64_t)v12 >> 6;
    if ((*(void *)(v14 + 8 * ((unint64_t)v12 >> 6)) & (1 << v12)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v11) {
      goto LABEL_24;
    }
    uint64_t v50 = v13;
    uint64_t v18 = *(void *)(a1 + 56);
    unint64_t v19 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v20 = v19[1];
    uint64_t v51 = *v19;
    uint64_t v21 = (uint64_t *)(v18 + 16 * v12);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v24 = v9;
    uint64_t v25 = v48;
    sub_24774FF58();
    uint64_t v26 = (uint64_t)v45;
    sub_24774FF58();
    uint64_t v27 = v25;
    uint64_t v9 = v24;
    (*v44)(v26, v27, v49);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v28 = v47;
    unint64_t v29 = (void *)(v26 + *(int *)(v47 + 20));
    *unint64_t v29 = v22;
    v29[1] = v23;
    uint64_t v30 = v26 + *(int *)(v28 + 24);
    *(void *)uint64_t v30 = v51;
    *(void *)(v30 + 8) = v20;
    *(unsigned char *)(v30 + 16) = 1;
    uint64_t v52 = v24;
    unint64_t v32 = *(void *)(v24 + 16);
    unint64_t v31 = *(void *)(v24 + 24);
    if (v32 >= v31 >> 1)
    {
      sub_24771EA98(v31 > 1, v32 + 1, 1);
      uint64_t v26 = (uint64_t)v45;
      uint64_t v9 = v52;
    }
    *(void *)(v9 + 16) = v32 + 1;
    uint64_t result = sub_247737CDC(v26, v9+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(void *)(v46 + 72) * v32, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
    a1 = v43;
    int64_t v15 = 1 << *(unsigned char *)(v43 + 32);
    if (v12 >= v15) {
      goto LABEL_25;
    }
    uint64_t v14 = v42;
    uint64_t v33 = *(void *)(v42 + 8 * v17);
    if ((v33 & (1 << v12)) == 0) {
      goto LABEL_26;
    }
    LODWORD(v11) = v41;
    if (*(_DWORD *)(v43 + 36) != v41) {
      goto LABEL_27;
    }
    unint64_t v34 = v33 & (-2 << (v12 & 0x3F));
    if (v34)
    {
      int64_t v15 = __clz(__rbit64(v34)) | v12 & 0xFFFFFFFFFFFFFFC0;
      int64_t v16 = v40;
    }
    else
    {
      unint64_t v35 = v17 + 1;
      unint64_t v36 = (unint64_t)(v15 + 63) >> 6;
      int64_t v16 = v40;
      if (v17 + 1 < v36)
      {
        unint64_t v37 = *(void *)(v42 + 8 * v35);
        if (v37)
        {
LABEL_20:
          int64_t v15 = __clz(__rbit64(v37)) + (v35 << 6);
        }
        else
        {
          while (v36 - 2 != v17)
          {
            unint64_t v37 = *(void *)(v39 + 8 * v17++);
            if (v37)
            {
              unint64_t v35 = v17 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    uint64_t v13 = v50 + 1;
    uint64_t v12 = v15;
    if (v50 + 1 == v16) {
      return v9;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

BOOL static AVSCoordinatorObject.Stage.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AVSCoordinatorObject.Stage.hash(into:)()
{
  return sub_247751008();
}

uint64_t AVSCoordinatorObject.Stage.hashValue.getter()
{
  return sub_247751018();
}

uint64_t sub_24772BAE8()
{
  return sub_24772BB38();
}

uint64_t sub_24772BAFC@<X0>(void *a1@<X8>)
{
  return sub_247732314(a1);
}

uint64_t sub_24772BB10()
{
  return sub_24771EA00();
}

uint64_t sub_24772BB24()
{
  return sub_24772BB38();
}

uint64_t sub_24772BB38()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24772BBAC()
{
  return sub_247750228();
}

uint64_t (*sub_24772BC1C(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_247750208();
  return sub_24772BCA8;
}

uint64_t sub_24772BCAC()
{
  return sub_24772C8D0((uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes, &qword_26925F8B8);
}

uint64_t sub_24772BCC0(uint64_t a1)
{
  return sub_24772C954(a1, &qword_26925F8C0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes, &qword_26925F8B8);
}

uint64_t (*sub_24772BCDC(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8C0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8B8);
  sub_2477501E8();
  swift_endAccess();
  return sub_24772BDEC;
}

uint64_t sub_24772BDF0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24772BE70()
{
  return sub_247750228();
}

uint64_t sub_24772BEE4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24772BF60()
{
  return sub_247750228();
}

uint64_t (*sub_24772BFD0(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_247750208();
  return sub_24772BCA8;
}

uint64_t sub_24772C05C()
{
  return sub_24772C8D0((uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded, &qword_26925F8D0);
}

uint64_t sub_24772C070(uint64_t a1)
{
  return sub_24772C954(a1, &qword_26925F8D8, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded, &qword_26925F8D0);
}

uint64_t (*sub_24772C08C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8D8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8D0);
  sub_2477501E8();
  swift_endAccess();
  return sub_24772BDEC;
}

uint64_t sub_24772C19C@<X0>(unsigned char *a1@<X8>)
{
  return sub_24772C3D4(a1);
}

uint64_t sub_24772C1B0()
{
  return sub_24772C464();
}

uint64_t sub_24772C1C4()
{
  return sub_24772C4E8();
}

uint64_t sub_24772C1E0()
{
  return sub_24772C570();
}

uint64_t (*sub_24772C1F4(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_247750208();
  return sub_24772BCA8;
}

uint64_t sub_24772C280()
{
  return sub_24772C8D0((uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording, &qword_26925F8E8);
}

uint64_t sub_24772C294(uint64_t a1)
{
  return sub_24772C954(a1, &qword_26925F8F0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording, &qword_26925F8E8);
}

uint64_t (*sub_24772C2B0(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8E8);
  sub_2477501E8();
  swift_endAccess();
  return sub_24772BDEC;
}

uint64_t sub_24772C3C0@<X0>(unsigned char *a1@<X8>)
{
  return sub_24772C3D4(a1);
}

uint64_t sub_24772C3D4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24772C450()
{
  return sub_24772C464();
}

uint64_t sub_24772C464()
{
  return sub_247750228();
}

uint64_t sub_24772C4D4()
{
  return sub_24772C4E8();
}

uint64_t sub_24772C4E8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24772C55C()
{
  return sub_24772C570();
}

uint64_t sub_24772C570()
{
  return sub_247750228();
}

uint64_t (*sub_24772C5DC(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_247750208();
  return sub_24772BCA8;
}

void sub_24772C668(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_24772C6D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return swift_endAccess();
}

uint64_t sub_24772C740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  int64_t v15 = (char *)&v18 - v14;
  int64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2477501F8();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_24772C8BC()
{
  return sub_24772C8D0((uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, &qword_26925F8E8);
}

uint64_t sub_24772C8D0(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_24772C938(uint64_t a1)
{
  return sub_24772C954(a1, &qword_26925F8F0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, &qword_26925F8E8);
}

uint64_t sub_24772C954(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2477501F8();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_24772CA84(void *a1))()
{
  char v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8E8);
  sub_2477501E8();
  swift_endAccess();
  return sub_24772BDEC;
}

void sub_24772CB94(uint64_t a1, char a2)
{
  char v3 = *(void **)a1;
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
    sub_2477501F8();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_2477501F8();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t sub_24772CD04@<X0>(void *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  char v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_247737DC8;
  a2[1] = (uint64_t (*)())v6;
  return swift_retain();
}

uint64_t sub_24772CD90(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = (uint64_t (**)())(*a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  *uint64_t v6 = sub_247737DA4;
  v6[1] = (uint64_t (*)())v5;
  swift_retain();
  return swift_release();
}

uint64_t sub_24772CE2C()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_retain();
  return v2;
}

uint64_t sub_24772CE84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_release();
}

uint64_t (*sub_24772CEE4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_24772CF40(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_24772CFAC()
{
  return swift_retain();
}

uint64_t sub_24772CFF8(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_release();
}

uint64_t (*sub_24772D04C())()
{
  return j__swift_endAccess;
}

uint64_t AVSCoordinatorObject.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  AVSCoordinatorObject.init()();
  return v0;
}

uint64_t AVSCoordinatorObject.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247750158();
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v47 = v2;
  MEMORY[0x270FA5388](v2);
  id v45 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_24774FF98();
  uint64_t v44 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v41 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8E8);
  uint64_t v5 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8D0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F900);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  int64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__navigationPath;
  v49[0] = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F910);
  sub_2477501D8();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v16, v15, v12);
  uint64_t v17 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  sub_24774FF58();
  uint64_t v18 = (int *)type metadata accessor for AdaptiveVoiceShortcut();
  unint64_t v19 = (void *)(v17 + v18[5]);
  *unint64_t v19 = 0;
  v19[1] = 0;
  uint64_t v20 = (void *)(v17 + v18[6]);
  *uint64_t v20 = 0;
  v20[1] = 0;
  uint64_t v21 = v17 + v18[7];
  uint64_t v22 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v21, 1, 1, v22);
  uint64_t v23 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded;
  v49[0] = 0;
  sub_2477501D8();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v23, v11, v8);
  uint64_t v24 = v41;
  uint64_t v25 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording;
  LOBYTE(v49[0]) = 0;
  sub_2477501D8();
  uint64_t v26 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v27 = v42;
  v26(v25, v7, v42);
  uint64_t v28 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled;
  LOBYTE(v49[0]) = objc_msgSend(self, sel_avsFeatureEnabled);
  uint64_t v29 = v43;
  sub_2477501D8();
  v26(v28, v7, v27);
  uint64_t v30 = v44;
  *(void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_numberOfSamples) = 50;
  *(void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_maxEnrollments) = 3;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollingWithAudioFileForAutomation) = 0;
  unint64_t v31 = (void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  *unint64_t v31 = nullsub_1;
  v31[1] = 0;
  *(void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_verifierModel) = 0;
  uint64_t v32 = MEMORY[0x263F8EE78];
  *(void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments) = MEMORY[0x263F8EE78];
  *(void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments) = v32;
  *(void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory) = 0;
  uint64_t v33 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
  type metadata accessor for AVSAudioProvider();
  *(_OWORD *)uint64_t v33 = 0u;
  *(_OWORD *)(v33 + 16) = 0u;
  *(void *)(v33 + 32) = 0;
  swift_allocObject();
  *(void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_audioProvider) = sub_247738F08();
  uint64_t v34 = sub_247750BC8();
  *(void *)(v34 + 16) = 50;
  *(_OWORD *)(v34 + 32) = 0u;
  *(_OWORD *)(v34 + 48) = 0u;
  *(_OWORD *)(v34 + 64) = 0u;
  *(_OWORD *)(v34 + 80) = 0u;
  *(_OWORD *)(v34 + 96) = 0u;
  *(_OWORD *)(v34 + 112) = 0u;
  *(_OWORD *)(v34 + 128) = 0u;
  *(_OWORD *)(v34 + 144) = 0u;
  *(_OWORD *)(v34 + 160) = 0u;
  *(_OWORD *)(v34 + 176) = 0u;
  *(_OWORD *)(v34 + 192) = 0u;
  *(_OWORD *)(v34 + 208) = 0u;
  *(void *)(v34 + 224) = 0;
  swift_beginAccess();
  v48[0] = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F950);
  sub_2477501D8();
  swift_endAccess();
  uint64_t v35 = type metadata accessor for AVSCoordinatorObject(0);
  uint64_t v50 = v35;
  uint64_t v51 = (_UNKNOWN **)sub_247735320(&qword_26925F958, (void (*)(uint64_t))type metadata accessor for AVSCoordinatorObject);
  v49[0] = v1;
  (*(void (**)(char *, void, uint64_t))(v30 + 104))(v24, *MEMORY[0x263F84D58], v29);
  swift_retain();
  uint64_t v36 = sub_2477500D8();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v24, v29);
  sub_247712A34((uint64_t)v49, &qword_26925F960);
  swift_release();
  unint64_t v37 = (uint64_t *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  *unint64_t v37 = v36;
  swift_release();
  uint64_t v38 = *(void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_audioProvider);
  uint64_t v50 = v35;
  uint64_t v51 = &off_26FBBAF80;
  v49[0] = v1;
  sub_2477338D8((uint64_t)v49, (uint64_t)v48);
  swift_beginAccess();
  swift_retain();
  swift_retain();
  sub_247733C00((uint64_t)v48, v38 + 40, &qword_26925F968);
  swift_endAccess();
  swift_release();
  return v1;
}

uint64_t sub_24772DA04()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24774FF68();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(self, sel_setAvsFeatureEnabled_, 0);
  uint64_t v6 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  *(void *)&v12[0] = sub_24774FF48();
  *((void *)&v12[0] + 1) = v7;
  v11[3] = 45;
  v11[4] = 0xE100000000000000;
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_247715DE0();
  sub_247750D38();
  swift_bridgeObjectRelease();
  sub_247750B38();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v8 = (void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  if (*v8)
  {
    swift_retain();
    sub_2477500C8();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
  }
  uint64_t v9 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
  swift_beginAccess();
  sub_247733C00((uint64_t)v12, v9, &qword_26925F970);
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v12[0]) = 1;
  swift_retain();
  sub_247750228();
  return sub_24773A0CC();
}

uint64_t sub_24772DCBC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24774FF68();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(self, sel_setAvsFeatureEnabled_, 0);
  uint64_t v6 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  *(void *)&v12[0] = sub_24774FF48();
  *((void *)&v12[0] + 1) = v7;
  v11[3] = 45;
  v11[4] = 0xE100000000000000;
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_247715DE0();
  sub_247750D38();
  swift_bridgeObjectRelease();
  sub_247750B38();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v8 = (void *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  if (*v8)
  {
    swift_retain();
    sub_2477500C8();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = 0;
    memset(v12, 0, sizeof(v12));
  }
  uint64_t v9 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
  swift_beginAccess();
  sub_247733C00((uint64_t)v12, v9, &qword_26925F970);
  uint64_t result = swift_endAccess();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollingWithAudioFileForAutomation) = 1;
  return result;
}

uint64_t sub_24772DF30(uint64_t a1)
{
  uint64_t v2 = sub_247750158();
  MEMORY[0x270FA5388](v2);
  uint64_t result = AXIsInternalInstall();
  if (result) {
    return sub_24773BE70(a1);
  }
  return result;
}

uint64_t sub_24772E1EC()
{
  return sub_24773A5A4();
}

uint64_t sub_24772E268(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24774FE28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = a1;
  _OWORD v16[2] = a2;
  sub_24774FE18();
  sub_247715DE0();
  uint64_t v10 = sub_247750D28();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v13 = v3 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  uint64_t v14 = (uint64_t *)(v13 + *(int *)(type metadata accessor for AdaptiveVoiceShortcut() + 20));
  *uint64_t v14 = v10;
  v14[1] = v12;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24772E3A4(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247735794(a1, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
  uint64_t v6 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  uint64_t v7 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  uint64_t v8 = type metadata accessor for AdaptiveVoiceShortcut();
  sub_247733C00((uint64_t)v5, v7 + *(int *)(v8 + 28), &qword_26925F160);
  return swift_endAccess();
}

uint64_t sub_24772E4C8()
{
  uint64_t v2 = v0;
  swift_getKeyPath();
  uint64_t v3 = (char *)&unk_247752588;
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  swift_release();
  uint64_t v4 = *(char ***)(v29[0] + 16);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  if (!v4)
  {
    uint64_t v2 = (char *)sub_247750208();
    uint64_t v9 = v8;
    uint64_t v10 = *v8;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v9 = v10;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v10 = sub_247721320(0, *((void *)v10 + 2) + 1, 1, v10);
      *uint64_t v9 = v10;
    }
    unint64_t v13 = *((void *)v10 + 2);
    unint64_t v12 = *((void *)v10 + 3);
    if (v13 >= v12 >> 1)
    {
      uint64_t v10 = sub_247721320((char *)(v12 > 1), v13 + 1, 1, v10);
      *uint64_t v9 = v10;
    }
    *((void *)v10 + 2) = v13 + 1;
    v10[v13 + 32] = 3;
    goto LABEL_13;
  }
  sub_247750218();
  swift_release();
  swift_release();
  uint64_t v5 = *(void *)(v29[0] + 16);
  if (!v5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  int v6 = *(unsigned __int8 *)(v5 + v29[0] + 31);
  swift_bridgeObjectRelease();
  if (!qword_26FBBA8E0) {
    goto LABEL_20;
  }
  uint64_t v7 = 0;
  while (*((unsigned __int8 *)&unk_26FBBA8D0 + v7 + 32) != v6)
  {
    if (qword_26FBBA8E0 == ++v7) {
      goto LABEL_20;
    }
  }
  BOOL v14 = __OFADD__(v7, 1);
  uint64_t v15 = v7 + 1;
  if (v14)
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v15 >= qword_26FBBA8E0)
  {
LABEL_20:
    uint64_t v16 = &v2[OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow];
    swift_beginAccess();
    uint64_t v17 = *(void (**)(uint64_t))v16;
    uint64_t v18 = swift_retain();
    v17(v18);
    return swift_release();
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    LODWORD(v1) = *((unsigned __int8 *)&unk_26FBBA8D0 + v15 + 32);
    if (v1 == 5 && objc_msgSend(self, sel_shouldHideAudioDonationPrompt)) {
      goto LABEL_20;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v2 = (char *)sub_247750208();
    uint64_t v4 = v20;
    uint64_t v3 = *v20;
    char v21 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t *v4 = v3;
    if (v21) {
      goto LABEL_23;
    }
    goto LABEL_28;
  }
LABEL_27:
  __break(1u);
LABEL_28:
  uint64_t v3 = sub_247721320(0, *((void *)v3 + 2) + 1, 1, v3);
  uint64_t *v4 = v3;
LABEL_23:
  unint64_t v22 = *((void *)v3 + 2);
  unint64_t v23 = *((void *)v3 + 3);
  unint64_t v24 = v22 + 1;
  if (v22 >= v23 >> 1)
  {
    char v25 = v1;
    unint64_t v1 = v22 + 1;
    uint64_t v26 = v3;
    unint64_t v27 = *((void *)v3 + 2);
    uint64_t v28 = sub_247721320((char *)(v23 > 1), v22 + 1, 1, v26);
    unint64_t v22 = v27;
    unint64_t v24 = v1;
    LOBYTE(v1) = v25;
    uint64_t v3 = v28;
    uint64_t *v4 = v28;
  }
  *((void *)v3 + 2) = v24;
  v3[v22 + 32] = v1;
LABEL_13:
  ((void (*)(uint64_t *, void))v2)(v29, 0);
  swift_release();
  return swift_release();
}

uint64_t sub_24772E808()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v9[0] + 16);
  swift_bridgeObjectRelease();
  if (!v1)
  {
    int v6 = (void (**)(void))(v0
                                      + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
    swift_beginAccess();
    uint64_t v7 = *v6;
    uint64_t v8 = swift_retain();
    v7(v8);
    return swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t result = sub_247750208();
  if (*(void *)(*(void *)v3 + 16))
  {
    uint64_t v4 = (void (*)(void, void))result;
    uint64_t v5 = v3;
    sub_247735290(&v10);
    if (v10 == 6) {
      sub_2477351B4(*(void *)(*(void *)v5 + 16) - 1, &v10);
    }
    v4(v9, 0);
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_24772E960()
{
  uint64_t v1 = (int *)(type metadata accessor for AdaptiveVoiceShortcut() - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_getKeyPath();
  swift_getKeyPath();
  BOOL v14 = &unk_26FBBA8F8;
  swift_retain();
  sub_247750228();
  sub_24774FF58();
  uint64_t v4 = &v3[v1[7]];
  void *v4 = 0;
  v4[1] = 0;
  uint64_t v5 = &v3[v1[8]];
  void *v5 = 0;
  v5[1] = 0;
  int v6 = &v3[v1[9]];
  uint64_t v7 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  sub_24772A0C0((uint64_t)v3, v8);
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  BOOL v14 = 0;
  swift_retain();
  sub_247750228();
  uint64_t v9 = (void *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x263F8EE78];
  *uint64_t v9 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments);
  swift_beginAccess();
  *uint64_t v11 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24772EB60()
{
  return _AXSSetAudioDonationSiriImprovementEnabled();
}

uint64_t sub_24772EB68()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750228();
  uint64_t v1 = (void *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x263F8EE78];
  *uint64_t v1 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments);
  swift_beginAccess();
  *uint64_t v3 = v2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24772EC34(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247750158();
  uint64_t v24 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_247750A58();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v23 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_247750A88();
  uint64_t v22 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
  swift_beginAccess();
  sub_2477129D0(v11, (uint64_t)aBlock, &qword_26925F970);
  if (v27)
  {
    uint64_t v20 = v1;
    sub_247737240((uint64_t)aBlock, (uint64_t)v25);
    sub_247712A34((uint64_t)aBlock, &qword_26925F970);
    __swift_project_boxed_opaque_existential_1(v25, v25[3]);
    char v21 = a1;
    sub_24774FFA8();
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    uint64_t v2 = v20;
    a1 = v21;
  }
  else
  {
    uint64_t result = sub_247712A34((uint64_t)aBlock, &qword_26925F970);
  }
  if ((*(unsigned char *)(v2
                 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollingWithAudioFileForAutomation) & 1) == 0)
  {
    sub_24771F388(0, (unint64_t *)&qword_26925F350);
    unint64_t v13 = a1;
    BOOL v14 = (void *)sub_247750CA8();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v2;
    *(void *)(v15 + 24) = v13;
    uint64_t v28 = sub_247737238;
    uint64_t v29 = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2477319C4;
    unint64_t v27 = &block_descriptor_88;
    uint64_t v16 = _Block_copy(aBlock);
    swift_retain();
    id v17 = v13;
    swift_release();
    sub_247750A78();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_247735320((unint64_t *)&qword_26925F358, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F360);
    sub_247712AEC((unint64_t *)&qword_26925F368, &qword_26925F360);
    uint64_t v18 = v23;
    sub_247750D68();
    MEMORY[0x24C55BCB0](0, v10, v18, v16);
    _Block_release(v16);

    (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v18, v5);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v22 + 8))(v10, v8);
  }
  return result;
}

uint64_t sub_24772F294(uint64_t a1, void *a2)
{
  return sub_247750228();
}

uint64_t sub_24772F310()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247750A58();
  uint64_t v61 = *(void *)(v2 - 8);
  uint64_t v62 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v59 = (char *)v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_247750A88();
  uint64_t v58 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  id v57 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_247750AA8();
  uint64_t v55 = *(void *)(v56 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v56);
  uint64_t v7 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v54 = (char *)v48 - v8;
  uint64_t v9 = type metadata accessor for AdaptiveVoiceShortcut();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v53 = (uint64_t)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v48 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v52 = (char *)v48 - v16;
  uint64_t v17 = sub_247750158();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v21 = __swift_project_value_buffer(v17, (uint64_t)qword_26925F898);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v21, v17);
  swift_retain_n();
  uint64_t v22 = sub_247750138();
  os_log_type_t v23 = sub_247750C88();
  if (os_log_type_enabled(v22, v23))
  {
    v48[1] = v9;
    uint64_t v24 = v1;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v50 = v15;
    uint64_t v26 = (uint8_t *)v25;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v51 = v7;
    uint64_t v28 = v27;
    aBlock[0] = v27;
    uint64_t v49 = v10;
    *(_DWORD *)uint64_t v26 = 136315138;
    v48[0] = v26 + 4;
    uint64_t v29 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
    swift_beginAccess();
    sub_247735794(v29, (uint64_t)v52, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
    uint64_t v30 = sub_247750B28();
    void aBlock[6] = sub_247745AC4(v30, v31, aBlock);
    uint64_t v10 = v49;
    sub_247750CF8();
    swift_release_n();
    uint64_t v1 = v24;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24770E000, v22, v23, "Enrolling command: %s", v26, 0xCu);
    swift_arrayDestroy();
    uint64_t v32 = v28;
    uint64_t v7 = v51;
    MEMORY[0x24C55C7C0](v32, -1, -1);
    uint64_t v33 = v26;
    uint64_t v15 = v50;
    MEMORY[0x24C55C7C0](v33, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  uint64_t v52 = (char *)objc_msgSend(objc_allocWithZone((Class)AVSStore), sel_init);
  uint64_t v34 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  sub_247735794(v34, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  uint64_t v35 = sub_2477223F4();
  uint64_t v36 = v53;
  sub_247735794((uint64_t)v15, v53, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v35 = sub_247721704(0, *(void *)(v35 + 16) + 1, 1, v35);
  }
  unint64_t v38 = *(void *)(v35 + 16);
  unint64_t v37 = *(void *)(v35 + 24);
  if (v38 >= v37 >> 1) {
    uint64_t v35 = sub_247721704(v37 > 1, v38 + 1, 1, v35);
  }
  *(void *)(v35 + 16) = v38 + 1;
  sub_247737CDC(v36, v35+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v38, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  sub_247723EE0(v35);
  swift_bridgeObjectRelease();
  sub_247737D44((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  sub_24771F388(0, (unint64_t *)&qword_26925F350);
  uint64_t v39 = (void *)sub_247750CA8();
  sub_247750A98();
  uint64_t v40 = v54;
  MEMORY[0x24C55BAB0](v7, 0.5);
  uint64_t v55 = *(void *)(v55 + 8);
  uint64_t v41 = v7;
  uint64_t v42 = v56;
  ((void (*)(char *, uint64_t))v55)(v41, v56);
  aBlock[4] = (uint64_t)sub_24772FBCC;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2477319C4;
  void aBlock[3] = (uint64_t)&block_descriptor_111;
  uint64_t v43 = _Block_copy(aBlock);
  uint64_t v44 = v57;
  sub_247750A78();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_247735320((unint64_t *)&qword_26925F358, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F360);
  sub_247712AEC((unint64_t *)&qword_26925F368, &qword_26925F360);
  id v45 = v59;
  uint64_t v46 = v62;
  sub_247750D68();
  MEMORY[0x24C55BC90](v40, v44, v45, v43);
  _Block_release(v43);

  (*(void (**)(char *, uint64_t))(v61 + 8))(v45, v46);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v44, v60);
  return ((uint64_t (*)(char *, uint64_t))v55)(v40, v42);
}

id sub_24772FBCC()
{
  id v0 = objc_msgSend(self, sel_shortcutsNamesDictionary);
  uint64_t v1 = sub_247750AD8();

  uint64_t v2 = *(void *)(v1 + 16);
  id result = (id)swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v4 = self;
    return objc_msgSend(v4, sel_setAvsFeatureEnabled_, 1);
  }
  return result;
}

uint64_t AVSCoordinatorObject.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__navigationPath;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F900);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_247737D44(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  uint64_t v3 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F8E8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, v8);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_247712A34(v0 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller, &qword_26925F970);
  return v0;
}

uint64_t AVSCoordinatorObject.__deallocating_deinit()
{
  AVSCoordinatorObject.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_24772FED8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AVSCoordinatorObject(0);
  uint64_t result = sub_2477501C8();
  *a1 = result;
  return result;
}

uint64_t sub_24772FF18(void *a1)
{
  return sub_24772EC34(a1);
}

uint64_t AVSCoordinatorObject.enrollmentDidComplete(VASingleEnrollmentData:)(uint8_t *a1)
{
  long long v174 = a1;
  uint64_t v143 = sub_247750A58();
  uint64_t v142 = *(void *)(v143 - 8);
  MEMORY[0x270FA5388](v143);
  uint64_t v140 = (char *)&v129 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_247750A88();
  uint64_t v139 = *(void *)(v141 - 8);
  MEMORY[0x270FA5388](v141);
  uint64_t v138 = (char *)&v129 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = sub_247750A68();
  uint64_t v136 = *(void *)(v137 - 8);
  MEMORY[0x270FA5388](v137);
  uint64_t v135 = (char *)&v129 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = sub_2477500B8();
  uint64_t v162 = *(void *)(v155 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v155);
  uint64_t v152 = (char *)&v129 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v154 = (char *)&v129 - v7;
  uint64_t v163 = sub_247750158();
  uint64_t v164 = *(void *)(v163 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v163);
  int v147 = (char *)&v129 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v148 = (char *)&v129 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v153 = (char *)&v129 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v146 = (char *)&v129 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v158 = (char *)&v129 - v16;
  uint64_t v17 = sub_24774FF68();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v134 = (char *)&v129 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  int64_t v133 = (char *)&v129 - v21;
  uint64_t v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4D8);
  MEMORY[0x270FA5388](v160);
  os_log_type_t v23 = (char *)&v129 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_247750078();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v144 = (char *)&v129 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v145 = (char *)&v129 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v151 = (char *)&v129 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)&v129 - v32;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
  uint64_t v35 = MEMORY[0x270FA5388](v34 - 8);
  uint64_t v157 = (uint64_t *)((char *)&v129 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37 = MEMORY[0x270FA5388](v35);
  uint64_t v39 = (char *)&v129 - v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v129 - v40;
  uint64_t v149 = v1;
  unint64_t v42 = v1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments;
  swift_beginAccess();
  unint64_t v150 = v42;
  uint64_t v43 = *(void *)v42;
  uint64_t v44 = *(void *)(*(void *)v42 + 16);
  uint64_t v159 = v25;
  uint64_t v161 = v24;
  if (v44)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v25 + 16))(v33, v43+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * (v44 - 1), v24);
    sub_247750058();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v33, v24);
    id v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v45(v41, 0, 1, v17);
  }
  else
  {
    id v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
    v45(v41, 1, 1, v17);
  }
  sub_247750058();
  v45(v39, 0, 1, v17);
  uint64_t v46 = (uint64_t)&v23[*(int *)(v160 + 48)];
  sub_2477129D0((uint64_t)v41, (uint64_t)v23, &qword_26925F3C0);
  sub_2477129D0((uint64_t)v39, v46, &qword_26925F3C0);
  uint64_t v156 = v18;
  uint64_t v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  if (v47((uint64_t)v23, 1, v17) == 1)
  {
    sub_247712A34((uint64_t)v39, &qword_26925F3C0);
    sub_247712A34((uint64_t)v41, &qword_26925F3C0);
    if (v47(v46, 1, v17) == 1) {
      return sub_247712A34((uint64_t)v23, &qword_26925F3C0);
    }
  }
  else
  {
    uint64_t v49 = (char *)v157;
    sub_2477129D0((uint64_t)v23, (uint64_t)v157, &qword_26925F3C0);
    if (v47(v46, 1, v17) != 1)
    {
      uint64_t v52 = v156;
      uint64_t v53 = v133;
      (*(void (**)(char *, uint64_t, uint64_t))(v156 + 32))(v133, v46, v17);
      sub_247735320(&qword_26925F508, MEMORY[0x263F07508]);
      char v54 = sub_247750AE8();
      uint64_t v55 = *(void (**)(char *, uint64_t))(v52 + 8);
      v55(v53, v17);
      sub_247712A34((uint64_t)v39, &qword_26925F3C0);
      sub_247712A34((uint64_t)v41, &qword_26925F3C0);
      v55(v49, v17);
      uint64_t result = sub_247712A34((uint64_t)v23, &qword_26925F3C0);
      uint64_t v50 = v174;
      uint64_t v51 = v158;
      if (v54) {
        return result;
      }
      goto LABEL_11;
    }
    sub_247712A34((uint64_t)v39, &qword_26925F3C0);
    sub_247712A34((uint64_t)v41, &qword_26925F3C0);
    (*(void (**)(char *, uint64_t))(v156 + 8))(v49, v17);
  }
  sub_247712A34((uint64_t)v23, &qword_26925F4D8);
  uint64_t v50 = v174;
  uint64_t v51 = v158;
LABEL_11:
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v56 = v163;
  uint64_t v57 = __swift_project_value_buffer(v163, (uint64_t)qword_26925F898);
  swift_beginAccess();
  uint64_t v58 = v164;
  uint64_t v59 = *(uint64_t **)(v164 + 16);
  uint64_t v160 = v57;
  uint64_t v158 = (char *)(v164 + 16);
  uint64_t v157 = v59;
  ((void (*)(char *, uint64_t, uint64_t))v59)(v51, v57, v56);
  uint64_t v60 = sub_247750138();
  os_log_type_t v61 = sub_247750C88();
  BOOL v62 = os_log_type_enabled(v60, v61);
  id v63 = v151;
  if (v62)
  {
    uint64_t v64 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v64 = 0;
    _os_log_impl(&dword_24770E000, v60, v61, "Enrollment did complete", v64, 2u);
    uint64_t v65 = v64;
    uint64_t v50 = v174;
    MEMORY[0x24C55C7C0](v65, -1, -1);
  }

  uint64_t v68 = *(char **)(v58 + 8);
  uint64_t v67 = v58 + 8;
  uint64_t v66 = v68;
  ((void (*)(char *, uint64_t))v68)(v51, v56);
  uint64_t v69 = v159;
  uint64_t v70 = v159 + 16;
  char v131 = *(void (**)(char *, uint8_t *, uint64_t))(v159 + 16);
  v131(v63, v50, v161);
  unint64_t v71 = (unint64_t *)v150;
  swift_beginAccess();
  unint64_t v72 = *v71;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *unint64_t v71 = v72;
  uint64_t v132 = v70;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v72 = sub_247721450(0, *(void *)(v72 + 16) + 1, 1, v72);
    *unint64_t v71 = v72;
  }
  unint64_t v75 = *(void *)(v72 + 16);
  unint64_t v74 = *(void *)(v72 + 24);
  uint64_t v164 = v67;
  uint64_t v129 = v17;
  int64_t v133 = v66;
  if (v75 >= v74 >> 1)
  {
    unint64_t v72 = sub_247721450(v74 > 1, v75 + 1, 1, v72);
    *unint64_t v71 = v72;
  }
  *(void *)(v72 + 16) = v75 + 1;
  uint64_t v76 = *(char **)(v69 + 32);
  unint64_t v150 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
  uint64_t v130 = *(void *)(v69 + 72);
  uint64_t v77 = v161;
  uint64_t v151 = v76;
  ((void (*)(unint64_t, char *, uint64_t))v76)(v72 + v150 + v130 * v75, v63, v161);
  swift_endAccess();
  uint64_t v78 = v154;
  unint64_t v79 = v174;
  sub_247750068();
  uint64_t v80 = v162;
  id v81 = v152;
  uint64_t v82 = v155;
  (*(void (**)(char *, void, uint64_t))(v162 + 104))(v152, *MEMORY[0x263F84D80], v155);
  char v83 = sub_247750098();
  uint64_t v84 = *(void (**)(char *, uint64_t))(v80 + 8);
  v84(v81, v82);
  uint64_t v162 = v80 + 8;
  v84(v78, v82);
  if (v83)
  {
    uint64_t v85 = v77;
    uint64_t v86 = v146;
    ((void (*)(char *, uint64_t, uint64_t))v157)(v146, v160, v163);
    uint64_t v87 = sub_247750138();
    os_log_type_t v88 = sub_247750C88();
    if (os_log_type_enabled(v87, v88))
    {
      char v89 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v89 = 0;
      _os_log_impl(&dword_24770E000, v87, v88, "Data for enrollment was successfully collected", v89, 2u);
      long long v90 = v89;
      unint64_t v79 = v174;
      MEMORY[0x24C55C7C0](v90, -1, -1);
    }

    uint64_t v91 = v133;
    ((void (*)(char *, uint64_t))v133)(v86, v163);
    uint64_t v92 = v145;
    v131(v145, v79, v85);
    uint64_t v93 = v149;
    uint64_t v94 = (unint64_t *)(v149
                             + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
    swift_beginAccess();
    unint64_t v95 = *v94;
    char v96 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t *v94 = v95;
    if ((v96 & 1) == 0)
    {
      unint64_t v95 = sub_247721450(0, *(void *)(v95 + 16) + 1, 1, v95);
      unint64_t *v94 = v95;
    }
    unint64_t v98 = *(void *)(v95 + 16);
    unint64_t v97 = *(void *)(v95 + 24);
    if (v98 >= v97 >> 1)
    {
      unint64_t v95 = sub_247721450(v97 > 1, v98 + 1, 1, v95);
      unint64_t *v94 = v95;
    }
    *(void *)(v95 + 16) = v98 + 1;
    ((void (*)(unint64_t, char *, uint64_t))v151)(v95 + v150 + v98 * v130, v92, v85);
    swift_endAccess();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_247750218();
    swift_release();
    uint64_t result = swift_release();
    uint64_t v99 = aBlock + 1;
    if (__OFADD__((void)aBlock, 1))
    {
      __break(1u);
      return result;
    }
    swift_getKeyPath();
    swift_getKeyPath();
    *(void *)&long long aBlock = v99;
    swift_retain();
    sub_247750228();
    uint64_t v100 = v163;
  }
  else
  {
    uint64_t v100 = v163;
    ((void (*)(char *, uint64_t, uint64_t))v157)(v153, v160, v163);
    uint64_t v101 = v144;
    v131(v144, v79, v77);
    uint64_t v102 = sub_247750138();
    os_log_type_t v103 = sub_247750C68();
    if (os_log_type_enabled(v102, v103))
    {
      uint64_t v104 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v104 = 134217984;
      long long v174 = v104 + 4;
      uint64_t v105 = v154;
      sub_247750068();
      uint64_t v106 = sub_2477500A8();
      uint64_t v107 = v105;
      uint64_t v100 = v163;
      v84(v107, v155);
      (*(void (**)(char *, uint64_t))(v159 + 8))(v101, v77);
      *(void *)&long long aBlock = v106;
      sub_247750CF8();
      _os_log_impl(&dword_24770E000, v102, v103, "Data for enrollment was unsuccessful with status: %ld", v104, 0xCu);
      MEMORY[0x24C55C7C0](v104, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v159 + 8))(v101, v77);
    }
    uint64_t v93 = v149;

    uint64_t v91 = v133;
    ((void (*)(char *, uint64_t))v133)(v153, v100);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  swift_release();
  if ((uint64_t)aBlock >= 3)
  {
    ((void (*)(char *, uint64_t, uint64_t))v157)(v148, v160, v100);
    uint64_t v117 = sub_247750138();
    os_log_type_t v118 = sub_247750C88();
    if (os_log_type_enabled(v117, v118))
    {
      uint64_t v119 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v119 = 0;
      _os_log_impl(&dword_24770E000, v117, v118, "Collected max number of enrollments. Setting audio enrollments to verifier model and saving data.", v119, 2u);
      MEMORY[0x24C55C7C0](v119, -1, -1);
    }

    ((void (*)(char *, uint64_t))v91)(v148, v100);
    if (*(unsigned char *)(v93
                  + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollingWithAudioFileForAutomation) == 1)
      *(unsigned char *)(v93 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollingWithAudioFileForAutomation) = 0;
    sub_24771F388(0, (unint64_t *)&qword_26925F350);
    uint64_t v120 = v136;
    uint64_t v121 = v135;
    uint64_t v122 = v137;
    (*(void (**)(char *, void, uint64_t))(v136 + 104))(v135, *MEMORY[0x263F8F080], v137);
    uint64_t v123 = (void *)sub_247750CC8();
    (*(void (**)(char *, uint64_t))(v120 + 8))(v121, v122);
    uint64_t v172 = sub_247735300;
    uint64_t v173 = v93;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v171 = sub_2477319C4;
    *((void *)&v171 + 1) = &block_descriptor_1;
    uint64_t v124 = _Block_copy(&aBlock);
    swift_retain();
    int64_t v125 = v138;
    sub_247750A78();
    uint64_t v169 = MEMORY[0x263F8EE78];
    sub_247735320((unint64_t *)&qword_26925F358, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F360);
    sub_247712AEC((unint64_t *)&qword_26925F368, &qword_26925F360);
    uint64_t v126 = v140;
    uint64_t v127 = v143;
    sub_247750D68();
    MEMORY[0x24C55BCB0](0, v125, v126, v124);
    _Block_release(v124);

    (*(void (**)(char *, uint64_t))(v142 + 8))(v126, v127);
    (*(void (**)(char *, uint64_t))(v139 + 8))(v125, v141);
    return swift_release();
  }
  else
  {
    ((void (*)(char *, uint64_t, uint64_t))v157)(v147, v160, v100);
    char v108 = sub_247750138();
    os_log_type_t v109 = sub_247750C88();
    if (os_log_type_enabled(v108, v109))
    {
      uint64_t v110 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v110 = 0;
      _os_log_impl(&dword_24770E000, v108, v109, "Starting collection of next enrollment", v110, 2u);
      MEMORY[0x24C55C7C0](v110, -1, -1);
    }

    ((void (*)(char *, uint64_t))v91)(v147, v100);
    uint64_t v111 = v93 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
    swift_beginAccess();
    uint64_t v112 = v156;
    BOOL v113 = v134;
    uint64_t v114 = v129;
    (*(void (**)(char *, uint64_t, uint64_t))(v156 + 16))(v134, v111, v129);
    *(void *)&long long aBlock = sub_24774FF48();
    *((void *)&aBlock + 1) = v115;
    uint64_t v167 = 45;
    unint64_t v168 = 0xE100000000000000;
    uint64_t v165 = 0;
    unint64_t v166 = 0xE000000000000000;
    sub_247715DE0();
    sub_247750D38();
    swift_bridgeObjectRelease();
    sub_247750B38();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v112 + 8))(v113, v114);
    uint64_t v116 = (void *)(v93 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
    swift_beginAccess();
    if (*v116)
    {
      swift_retain();
      sub_2477500C8();
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v172 = 0;
      long long aBlock = 0u;
      long long v171 = 0u;
    }
    uint64_t v128 = v93 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_currentEnroller;
    swift_beginAccess();
    sub_247733C00((uint64_t)&aBlock, v128, &qword_26925F970);
    return swift_endAccess();
  }
}

uint64_t sub_2477315CC(uint64_t a1)
{
  uint64_t v2 = sub_247750158();
  MEMORY[0x270FA5388](v2);
  uint64_t v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_avsShortcut;
  swift_beginAccess();
  id v6 = objc_allocWithZone((Class)AVSStore);
  swift_bridgeObjectRetain();
  id v7 = objc_msgSend(v6, sel_init);
  uint64_t v8 = sub_24774FF48();
  uint64_t v10 = _sSo8AVSStoreC22AdaptiveVoiceShortcutsE33saveShortcutEnrollmentDataToFiles10shortcutId_SSSgSS_Say0C7Actions08VASinglegH0VGtF_0(v8, v9, v4);
  uint64_t v12 = v11;
  uint64_t v13 = (void *)(v5 + *(int *)(type metadata accessor for AdaptiveVoiceShortcut() + 24));
  void *v13 = v10;
  v13[1] = v12;
  swift_endAccess();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_verifierModel))
  {
    swift_retain();
    swift_bridgeObjectRetain();
    sub_24774FFE8();
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750228();
  return sub_24773A5A4();
}

uint64_t sub_2477319C4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_247731A08(uint8_t *a1)
{
  return AVSCoordinatorObject.enrollmentDidComplete(VASingleEnrollmentData:)(a1);
}

uint64_t sub_247731A2C()
{
  type metadata accessor for AVSCoordinatorObject(0);
  uint64_t v0 = swift_allocObject();
  AVSCoordinatorObject.init()();
  return v0;
}

uint64_t sub_247731A68@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) + 24));
  uint64_t v5 = *v3;
  uint64_t v4 = v3[1];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *a2 = sub_247737B64;
  a2[1] = (uint64_t (*)())v6;

  return swift_retain();
}

uint64_t sub_247731AE8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  uint64_t v6 = (uint64_t (**)())(a2 + *(int *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) + 24));
  swift_retain();
  uint64_t result = swift_release();
  *uint64_t v6 = sub_247737B3C;
  v6[1] = (uint64_t (*)())v5;
  return result;
}

uint64_t AVSEnrollmentCoordinatorView.completionHandler.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) + 24));
  swift_retain();
  return v1;
}

uint64_t AVSEnrollmentCoordinatorView.completionHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) + 24));
  uint64_t result = swift_release();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AVSEnrollmentCoordinatorView.completionHandler.modify())()
{
  return nullsub_1;
}

uint64_t AVSEnrollmentCoordinatorView.init(completionHandler:axActionsDictionary:systemActionsDictionary:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = sub_247731A2C;
  *(void *)(a5 + 8) = 0;
  *(unsigned char *)(a5 + 16) = 0;
  uint64_t v10 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  uint64_t v11 = (uint64_t *)(a5 + *(int *)(v10 + 20));
  *uint64_t v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F978);
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = (void *)(a5 + *(int *)(v10 + 24));
  *uint64_t v12 = a1;
  v12[1] = a2;
  uint64_t v13 = qword_26925F148;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_269262030;
  uint64_t v17 = (void *)sub_24772B684(a3);
  swift_bridgeObjectRetain();
  sub_247733CB4(&v17);
  swift_bridgeObjectRelease();
  *(void *)(v14 + 16) = v17;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v15 = qword_269262030;
  uint64_t v17 = (void *)sub_24772B684(a4);
  swift_bridgeObjectRetain();
  sub_247733CB4(&v17);
  swift_bridgeObjectRelease();
  *(void *)(v15 + 24) = v17;
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t AVSEnrollmentCoordinatorView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v32 = a1;
  uint64_t v2 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v30 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v26 = (uint64_t)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F980);
  uint64_t v29 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F988) - 8;
  MEMORY[0x270FA5388](v28);
  uint64_t v27 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AVSCoordinatorObject(0);
  sub_247735320(&qword_26925F990, (void (*)(uint64_t))type metadata accessor for AVSCoordinatorObject);
  sub_2477502C8();
  swift_getKeyPath();
  sub_247750368();
  swift_release();
  swift_release();
  uint64_t v40 = v42;
  long long v41 = v43;
  uint64_t v33 = v1;
  v24[0] = v1;
  uint64_t v25 = (uint64_t (*)(void))__swift_instantiateConcreteTypeFromMangledName(&qword_26925F910);
  v24[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F998);
  sub_247712AEC(&qword_26925F9A0, &qword_26925F910);
  sub_247712AEC(&qword_26925F9A8, &qword_26925F910);
  sub_247712AEC(&qword_26925F9B0, &qword_26925F910);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F9B8);
  uint64_t v8 = sub_2477353F0(&qword_26925F9C0, &qword_26925F9B8, (void (*)(void))sub_2477353B4, (void (*)(void))sub_24773565C);
  unint64_t v9 = sub_247735740();
  uint64_t v34 = v7;
  uint64_t v35 = &type metadata for AVSCoordinatorObject.Stage;
  uint64_t v36 = v7;
  uint64_t v37 = v8;
  unint64_t v38 = v9;
  uint64_t v39 = v8;
  swift_getOpaqueTypeConformance2();
  sub_247750398();
  uint64_t v25 = type metadata accessor for AVSEnrollmentCoordinatorView;
  uint64_t v10 = v1;
  uint64_t v11 = v26;
  sub_247735794(v10, v26, type metadata accessor for AVSEnrollmentCoordinatorView);
  unint64_t v12 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  uint64_t v13 = swift_allocObject();
  sub_247737CDC(v11, v13 + v12, type metadata accessor for AVSEnrollmentCoordinatorView);
  uint64_t v14 = v29;
  uint64_t v15 = (uint64_t)v27;
  uint64_t v16 = v5;
  uint64_t v17 = v5;
  uint64_t v18 = v31;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v27, v17, v31);
  uint64_t v19 = (uint64_t (**)())(v15 + *(int *)(v28 + 44));
  *uint64_t v19 = sub_247735800;
  v19[1] = (uint64_t (*)())v13;
  v19[2] = 0;
  double v19[3] = 0;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v18);
  sub_247735794(v24[0], v11, v25);
  uint64_t v20 = swift_allocObject();
  sub_247737CDC(v11, v20 + v12, type metadata accessor for AVSEnrollmentCoordinatorView);
  uint64_t v21 = v32;
  sub_2477129D0(v15, v32, &qword_26925F988);
  uint64_t v22 = (void *)(v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925FA40) + 36));
  *uint64_t v22 = 0;
  v22[1] = 0;
  v22[2] = sub_24773595C;
  v22[3] = v20;
  return sub_247712A34(v15, &qword_26925F988);
}

uint64_t sub_247732314@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_247750218();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_247732390(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F9B8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v12 = 0;
  sub_2477325A8(&v12, (uint64_t)v7);
  sub_247735794(a1, (uint64_t)&v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for AVSEnrollmentCoordinatorView);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  sub_247737CDC((uint64_t)&v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v9 + v8, type metadata accessor for AVSEnrollmentCoordinatorView);
  sub_2477353F0(&qword_26925F9C0, &qword_26925F9B8, (void (*)(void))sub_2477353B4, (void (*)(void))sub_24773565C);
  sub_247735740();
  sub_247750808();
  swift_release();
  return sub_247712A34((uint64_t)v7, &qword_26925F9B8);
}

uint64_t sub_2477325A8@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F3C0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v68 - v8;
  uint64_t v73 = type metadata accessor for AVSCommandShortcutActionView(0);
  uint64_t v10 = MEMORY[0x270FA5388](v73);
  char v12 = (char *)v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v72 = (uint64_t)v68 - v13;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAC0);
  MEMORY[0x270FA5388](v76);
  uint64_t v78 = (_OWORD *)((char *)v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAC8);
  MEMORY[0x270FA5388](v74);
  uint64_t v16 = (char *)v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAD0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (uint64_t *)((char *)v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F9E0);
  MEMORY[0x270FA5388](v75);
  uint64_t v21 = (char *)v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F9D0);
  MEMORY[0x270FA5388](v77);
  os_log_type_t v23 = (char *)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(*a1)
  {
    case 1:
      unint64_t v71 = v23;
      type metadata accessor for AVSCoordinatorObject(0);
      sub_247735320(&qword_26925F990, (void (*)(uint64_t))type metadata accessor for AVSCoordinatorObject);
      sub_2477502B8();
      uint64_t v31 = sub_247750358();
      uint64_t v33 = v32;
      uint64_t v80 = 0;
      unint64_t v81 = 0xE000000000000000;
      sub_247750918();
      long long v34 = v88;
      uint64_t v35 = v89;
      char v36 = sub_247750288();
      uint64_t v38 = v37;
      char v40 = v39;
      LOBYTE(v80) = 0;
      sub_247750918();
      uint64_t v80 = (uint64_t)sub_24771324C;
      unint64_t v81 = 0;
      *(void *)&long long v82 = 0;
      *((void *)&v82 + 1) = v31;
      uint64_t v73 = v33;
      *(void *)&v83[0] = v33;
      *(_OWORD *)((char *)v83 + 8) = v34;
      *((void *)&v83[1] + 1) = v35;
      *(void *)&long long v84 = v36 & 1;
      *((void *)&v84 + 1) = v38;
      *(void *)&long long v85 = v40 & 1;
      *((void *)&v85 + 1) = v88;
      uint64_t v86 = *((void *)&v88 + 1);
      char v87 = 0;
      sub_247712E28();
      sub_2477355B4();
      sub_247735608();
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_247750558();
      uint64_t v41 = v94;
      char v42 = v95;
      long long v43 = v89;
      *(_OWORD *)uint64_t v16 = v88;
      *((_OWORD *)v16 + 1) = v43;
      long long v44 = v91;
      *((_OWORD *)v16 + 2) = v90;
      *((_OWORD *)v16 + 3) = v44;
      long long v45 = v93;
      *((_OWORD *)v16 + 4) = v92;
      *((_OWORD *)v16 + 5) = v45;
      *((void *)v16 + 12) = v41;
      v16[104] = v42;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA00);
      sub_247735478();
      sub_247735578();
      uint64_t v46 = (uint64_t)v71;
      sub_247750558();
      sub_2477129D0(v46, (uint64_t)v78, &qword_26925F9D0);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA20);
      sub_2477353B4();
      sub_24773565C();
      sub_247750558();
      sub_247712A34(v46, &qword_26925F9D0);
      sub_247712E94();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return swift_release();
    case 2:
      uint64_t v47 = (uint64_t)v23;
      type metadata accessor for AVSCoordinatorObject(0);
      sub_247735320(&qword_26925F990, (void (*)(uint64_t))type metadata accessor for AVSCoordinatorObject);
      sub_2477502B8();
      *uint64_t v19 = sub_247750358();
      v19[1] = v48;
      swift_storeEnumTagMultiPayload();
      sub_247735524();
      sub_247735320(&qword_26925F9F0, (void (*)(uint64_t))type metadata accessor for AVSCommandShortcutActionView);
      swift_retain();
      sub_247750558();
      sub_2477129D0((uint64_t)v21, (uint64_t)v16, &qword_26925F9E0);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA00);
      sub_247735478();
      sub_247735578();
      sub_247750558();
      sub_247712A34((uint64_t)v21, &qword_26925F9E0);
      sub_2477129D0(v47, (uint64_t)v78, &qword_26925F9D0);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA20);
      sub_2477353B4();
      sub_24773565C();
      sub_247750558();
      sub_247712A34(v47, &qword_26925F9D0);
      return swift_release();
    case 3:
      uint64_t v70 = *v2;
      uint64_t v69 = v2[1];
      v68[1] = *((unsigned __int8 *)v2 + 16);
      unint64_t v71 = v23;
      type metadata accessor for AVSCoordinatorObject(0);
      sub_247735320(&qword_26925F990, (void (*)(uint64_t))type metadata accessor for AVSCoordinatorObject);
      sub_2477502B8();
      *(void *)char v12 = sub_247750358();
      *((void *)v12 + 1) = v49;
      *((void *)v12 + 2) = sub_24771857C;
      *((void *)v12 + 3) = 0;
      v12[32] = 0;
      uint64_t v80 = 0;
      unint64_t v81 = 0xE000000000000000;
      sub_247750918();
      uint64_t v50 = v89;
      *(_OWORD *)(v12 + 40) = v88;
      *((void *)v12 + 7) = v50;
      uint64_t v51 = sub_24774FF68();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v9, 1, 1, v51);
      sub_2477129D0((uint64_t)v9, (uint64_t)v7, &qword_26925F3C0);
      sub_247750918();
      sub_247712A34((uint64_t)v9, &qword_26925F3C0);
      uint64_t v52 = &v12[*(int *)(v73 + 32)];
      LOBYTE(v80) = 0;
      sub_247750918();
      uint64_t v53 = *((void *)&v88 + 1);
      *uint64_t v52 = v88;
      *((void *)v52 + 1) = v53;
      uint64_t v54 = (uint64_t)v12;
      uint64_t v55 = v72;
      sub_247737CDC(v54, v72, type metadata accessor for AVSCommandShortcutActionView);
      sub_247735794(v55, (uint64_t)v19, type metadata accessor for AVSCommandShortcutActionView);
      swift_storeEnumTagMultiPayload();
      sub_247735524();
      sub_247735320(&qword_26925F9F0, (void (*)(uint64_t))type metadata accessor for AVSCommandShortcutActionView);
      sub_247750558();
      sub_2477129D0((uint64_t)v21, (uint64_t)v16, &qword_26925F9E0);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA00);
      sub_247735478();
      sub_247735578();
      uint64_t v56 = (uint64_t)v71;
      sub_247750558();
      sub_247712A34((uint64_t)v21, &qword_26925F9E0);
      sub_2477129D0(v56, (uint64_t)v78, &qword_26925F9D0);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA20);
      sub_2477353B4();
      sub_24773565C();
      sub_247750558();
      sub_247712A34(v56, &qword_26925F9D0);
      return sub_247737D44(v55, type metadata accessor for AVSCommandShortcutActionView);
    case 4:
      type metadata accessor for AVSCoordinatorObject(0);
      sub_247735320(&qword_26925F990, (void (*)(uint64_t))type metadata accessor for AVSCoordinatorObject);
      sub_2477502B8();
      uint64_t v80 = sub_247750358();
      unint64_t v81 = v58;
      long long v82 = 0uLL;
      LOBYTE(v83[0]) = 0;
      sub_247735698();
      sub_2477356EC();
      swift_retain();
      sub_247750558();
      char v59 = v90;
      long long v60 = v89;
      os_log_type_t v61 = v78;
      _OWORD *v78 = v88;
      v61[1] = v60;
      *((unsigned char *)v61 + 32) = v59;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA20);
      sub_2477353B4();
      sub_24773565C();
      sub_247750558();
      return swift_release();
    case 5:
      type metadata accessor for AVSCoordinatorObject(0);
      sub_247735320(&qword_26925F990, (void (*)(uint64_t))type metadata accessor for AVSCoordinatorObject);
      sub_2477502B8();
      uint64_t v62 = sub_247750358();
      unint64_t v64 = v63;
      LOBYTE(v80) = 0;
      sub_247750918();
      uint64_t v80 = v62;
      unint64_t v81 = v64;
      *(void *)&long long v82 = v88;
      *((void *)&v82 + 1) = *((void *)&v88 + 1);
      LOBYTE(v83[0]) = 1;
      sub_247735698();
      sub_2477356EC();
      swift_retain();
      swift_retain();
      sub_247750558();
      char v65 = v90;
      long long v66 = v89;
      uint64_t v67 = v78;
      _OWORD *v78 = v88;
      v67[1] = v66;
      *((unsigned char *)v67 + 32) = v65;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA20);
      sub_2477353B4();
      sub_24773565C();
      sub_247750558();
      swift_release();
      return swift_release();
    default:
      uint64_t v24 = (uint64_t)v23;
      type metadata accessor for AVSCoordinatorObject(0);
      sub_247735320(&qword_26925F990, (void (*)(uint64_t))type metadata accessor for AVSCoordinatorObject);
      sub_2477502B8();
      uint64_t v80 = sub_247750358();
      unint64_t v81 = v25;
      long long v82 = 0u;
      memset(v83, 0, sizeof(v83));
      long long v84 = 0u;
      long long v85 = 0u;
      uint64_t v86 = 0;
      char v87 = 1;
      sub_2477355B4();
      sub_247735608();
      swift_retain();
      sub_247750558();
      uint64_t v26 = v94;
      char v27 = v95;
      long long v28 = v89;
      *(_OWORD *)uint64_t v16 = v88;
      *((_OWORD *)v16 + 1) = v28;
      long long v29 = v91;
      *((_OWORD *)v16 + 2) = v90;
      *((_OWORD *)v16 + 3) = v29;
      long long v30 = v93;
      *((_OWORD *)v16 + 4) = v92;
      *((_OWORD *)v16 + 5) = v30;
      *((void *)v16 + 12) = v26;
      v16[104] = v27;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA00);
      sub_247735478();
      sub_247735578();
      sub_247750558();
      sub_2477129D0(v24, (uint64_t)v78, &qword_26925F9D0);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA20);
      sub_2477353B4();
      sub_24773565C();
      sub_247750558();
      sub_247712A34(v24, &qword_26925F9D0);
      return swift_release();
  }
}

uint64_t sub_2477335F8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  type metadata accessor for AVSCoordinatorObject(0);
  sub_247735320(&qword_26925F990, (void (*)(uint64_t))type metadata accessor for AVSCoordinatorObject);
  uint64_t v5 = sub_2477502B8();
  sub_247735794(a1, (uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AVSEnrollmentCoordinatorView);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_247737CDC((uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for AVSEnrollmentCoordinatorView);
  uint64_t v8 = (uint64_t (**)())(v5 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  *uint64_t v8 = sub_247737BC8;
  v8[1] = (uint64_t (*)())v7;
  swift_release();
  return swift_release();
}

uint64_t sub_2477337B8(uint64_t a1)
{
  uint64_t v2 = sub_247750328();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  sub_247733940((uint64_t)v5);
  sub_247750318();
  uint64_t v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t))(a1 + *(int *)(v6 + 24)))(v7);
}

uint64_t type metadata accessor for AVSCoordinatorObject(uint64_t a1)
{
  return sub_2477183B0(a1, (uint64_t *)&unk_26925FA50);
}

uint64_t sub_2477338D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247733940@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_247750488();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F978);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2477129D0(v2, (uint64_t)v10, &qword_26925F978);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_247750328();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_247750C78();
    uint64_t v14 = sub_247750658();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_247745AC4(0x417373696D736944, 0xED00006E6F697463, &v20);
      sub_247750CF8();
      _os_log_impl(&dword_24770E000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C55C7C0](v18, -1, -1);
      MEMORY[0x24C55C7C0](v16, -1, -1);
    }

    sub_247750478();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_247733C00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_247733C64@<X0>(void *a1@<X8>)
{
  return sub_247732314(a1);
}

uint64_t sub_247733C8C()
{
  return sub_24771EA00();
}

uint64_t sub_247733CB4(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for AvailableShortcutAction() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_2477470F4(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_247733D5C(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_247733D5C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v159 = type metadata accessor for AvailableShortcutAction();
  uint64_t v154 = *(void *)(v159 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v159);
  uint64_t v149 = (uint64_t)&v140 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v160 = (uint64_t)&v140 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v140 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  os_log_type_t v13 = (char *)&v140 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v152 = (uint64_t)&v140 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v151 = (uint64_t)&v140 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v146 = (uint64_t)&v140 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v145 = (uint64_t)&v140 - v20;
  uint64_t v161 = a1;
  uint64_t v21 = a1[1];
  uint64_t result = sub_247750FB8();
  if (result >= v21)
  {
    if (v21 < 0) {
      goto LABEL_154;
    }
    if (v21) {
      return sub_247734920(0, v21, 1, v161);
    }
    return result;
  }
  if (v21 >= 0) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = v21 + 1;
  }
  if (v21 < -1) {
    goto LABEL_162;
  }
  uint64_t v155 = v10;
  uint64_t v142 = result;
  if (v21 < 2)
  {
    char v27 = (char *)MEMORY[0x263F8EE78];
    unint64_t v153 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v154 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v154 + 80));
    uint64_t v141 = MEMORY[0x263F8EE78];
    if (v21 != 1)
    {
      unint64_t v29 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_120:
      int64_t v133 = v27;
      if (v29 >= 2)
      {
        uint64_t v134 = *v161;
        do
        {
          unint64_t v135 = v29 - 2;
          if (v29 < 2) {
            goto LABEL_149;
          }
          if (!v134) {
            goto LABEL_161;
          }
          uint64_t v136 = *(void *)&v133[16 * v135 + 32];
          uint64_t v137 = *(void *)&v133[16 * v29 + 24];
          sub_247734C14(v134 + *(void *)(v154 + 72) * v136, v134 + *(void *)(v154 + 72) * *(void *)&v133[16 * v29 + 16], v134 + *(void *)(v154 + 72) * v137, v153);
          if (v2) {
            break;
          }
          if (v137 < v136) {
            goto LABEL_150;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int64_t v133 = sub_247746ED8((uint64_t)v133);
          }
          if (v135 >= *((void *)v133 + 2)) {
            goto LABEL_151;
          }
          uint64_t v138 = &v133[16 * v135 + 32];
          *(void *)uint64_t v138 = v136;
          *((void *)v138 + 1) = v137;
          unint64_t v139 = *((void *)v133 + 2);
          if (v29 > v139) {
            goto LABEL_152;
          }
          memmove(&v133[16 * v29 + 16], &v133[16 * v29 + 32], 16 * (v139 - v29));
          *((void *)v133 + 2) = v139 - 1;
          unint64_t v29 = v139 - 1;
        }
        while (v139 > 2);
      }
LABEL_131:
      swift_bridgeObjectRelease();
      *(void *)(v141 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v24 = v23 >> 1;
    uint64_t v25 = sub_247750BC8();
    *(void *)(v25 + 16) = v24;
    uint64_t v26 = *(unsigned __int8 *)(v154 + 80);
    uint64_t v141 = v25;
    unint64_t v153 = v25 + ((v26 + 32) & ~v26);
  }
  uint64_t v28 = 0;
  char v27 = (char *)MEMORY[0x263F8EE78];
  uint64_t v144 = v13;
  while (1)
  {
    uint64_t v30 = v28;
    uint64_t v31 = v28 + 1;
    uint64_t v150 = v28;
    if (v28 + 1 >= v21)
    {
      uint64_t v42 = v28;
    }
    else
    {
      uint64_t v32 = *v161;
      uint64_t v33 = *(void *)(v154 + 72);
      uint64_t v156 = v28 + 1;
      uint64_t v34 = v145;
      sub_247735794(v32 + v33 * v31, v145, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      uint64_t v147 = v32;
      uint64_t v158 = v33;
      uint64_t v35 = v32 + v33 * v30;
      uint64_t v36 = v146;
      sub_247735794(v35, v146, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      uint64_t v37 = *(int *)(v159 + 20);
      uint64_t v38 = *(void *)(v34 + v37);
      uint64_t v39 = *(void *)(v34 + v37 + 8);
      char v40 = (void *)(v36 + v37);
      if (v38 == *v40 && v39 == v40[1]) {
        LODWORD(v157) = 0;
      }
      else {
        LODWORD(v157) = sub_247750FD8();
      }
      sub_247737D44(v146, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      sub_247737D44(v145, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      uint64_t v31 = v150 + 2;
      if (v150 + 2 < v21)
      {
        uint64_t v143 = v27;
        v156 *= v158;
        uint64_t v43 = v147;
        uint64_t v44 = v158 * v31;
        while (1)
        {
          uint64_t v45 = v21;
          uint64_t v46 = v31;
          uint64_t v47 = v151;
          sub_247735794(v43 + v44, v151, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          uint64_t v48 = v152;
          sub_247735794(v43 + v156, v152, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          uint64_t v49 = *(int *)(v159 + 20);
          uint64_t v50 = *(void *)(v47 + v49);
          uint64_t v51 = *(void *)(v47 + v49 + 8);
          uint64_t v52 = (void *)(v48 + v49);
          BOOL v53 = v50 == *v52 && v51 == v52[1];
          int v54 = v53 ? 0 : sub_247750FD8();
          sub_247737D44(v152, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          sub_247737D44(v151, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          uint64_t v21 = v45;
          if ((v157 ^ v54)) {
            break;
          }
          uint64_t v31 = v46 + 1;
          v43 += v158;
          if (v45 == v46 + 1)
          {
            uint64_t v31 = v45;
            char v27 = v143;
            goto LABEL_35;
          }
        }
        char v27 = v143;
        uint64_t v31 = v46;
      }
LABEL_35:
      uint64_t v42 = v150;
      if (v157)
      {
        if (v31 < v150) {
          goto LABEL_155;
        }
        if (v150 < v31)
        {
          uint64_t v157 = v21;
          uint64_t v143 = v27;
          uint64_t v55 = 0;
          uint64_t v56 = v158 * (v31 - 1);
          uint64_t v57 = v31 * v158;
          uint64_t v58 = v150;
          uint64_t v59 = v150 * v158;
          do
          {
            if (v58 != v31 + v55 - 1)
            {
              uint64_t v148 = v2;
              uint64_t v60 = v147;
              if (!v147) {
                goto LABEL_160;
              }
              unint64_t v61 = v147 + v59;
              sub_247737CDC(v147 + v59, v149, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
              if (v59 < v56 || v61 >= v60 + v57)
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v59 != v56)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              sub_247737CDC(v149, v60 + v56, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
              uint64_t v2 = v148;
            }
            ++v58;
            --v55;
            v56 -= v158;
            v57 -= v158;
            v59 += v158;
          }
          while (v58 < v31 + v55);
          char v27 = v143;
          os_log_type_t v13 = v144;
          uint64_t v42 = v150;
          uint64_t v21 = v157;
        }
      }
    }
    if (v31 < v21)
    {
      if (__OFSUB__(v31, v42)) {
        goto LABEL_153;
      }
      if (v31 - v42 < v142) {
        break;
      }
    }
LABEL_72:
    if (v31 < v42) {
      goto LABEL_148;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v158 = v31;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      char v27 = sub_247746BE0(0, *((void *)v27 + 2) + 1, 1, v27);
    }
    unint64_t v83 = *((void *)v27 + 2);
    unint64_t v82 = *((void *)v27 + 3);
    unint64_t v29 = v83 + 1;
    if (v83 >= v82 >> 1) {
      char v27 = sub_247746BE0((char *)(v82 > 1), v83 + 1, 1, v27);
    }
    *((void *)v27 + 2) = v29;
    long long v84 = v27 + 32;
    long long v85 = &v27[16 * v83 + 32];
    uint64_t v86 = v158;
    *(void *)long long v85 = v42;
    *((void *)v85 + 1) = v86;
    if (v83)
    {
      while (1)
      {
        unint64_t v87 = v29 - 1;
        if (v29 >= 4)
        {
          long long v92 = &v84[16 * v29];
          uint64_t v93 = *((void *)v92 - 8);
          uint64_t v94 = *((void *)v92 - 7);
          BOOL v98 = __OFSUB__(v94, v93);
          uint64_t v95 = v94 - v93;
          if (v98) {
            goto LABEL_137;
          }
          uint64_t v97 = *((void *)v92 - 6);
          uint64_t v96 = *((void *)v92 - 5);
          BOOL v98 = __OFSUB__(v96, v97);
          uint64_t v90 = v96 - v97;
          char v91 = v98;
          if (v98) {
            goto LABEL_138;
          }
          unint64_t v99 = v29 - 2;
          uint64_t v100 = &v84[16 * v29 - 32];
          uint64_t v102 = *(void *)v100;
          uint64_t v101 = *((void *)v100 + 1);
          BOOL v98 = __OFSUB__(v101, v102);
          uint64_t v103 = v101 - v102;
          if (v98) {
            goto LABEL_140;
          }
          BOOL v98 = __OFADD__(v90, v103);
          uint64_t v104 = v90 + v103;
          if (v98) {
            goto LABEL_143;
          }
          if (v104 >= v95)
          {
            uint64_t v122 = &v84[16 * v87];
            uint64_t v124 = *(void *)v122;
            uint64_t v123 = *((void *)v122 + 1);
            BOOL v98 = __OFSUB__(v123, v124);
            uint64_t v125 = v123 - v124;
            if (v98) {
              goto LABEL_147;
            }
            BOOL v115 = v90 < v125;
            goto LABEL_109;
          }
        }
        else
        {
          if (v29 != 3)
          {
            uint64_t v116 = *((void *)v27 + 4);
            uint64_t v117 = *((void *)v27 + 5);
            BOOL v98 = __OFSUB__(v117, v116);
            uint64_t v109 = v117 - v116;
            char v110 = v98;
            goto LABEL_103;
          }
          uint64_t v89 = *((void *)v27 + 4);
          uint64_t v88 = *((void *)v27 + 5);
          BOOL v98 = __OFSUB__(v88, v89);
          uint64_t v90 = v88 - v89;
          char v91 = v98;
        }
        if (v91) {
          goto LABEL_139;
        }
        unint64_t v99 = v29 - 2;
        uint64_t v105 = &v84[16 * v29 - 32];
        uint64_t v107 = *(void *)v105;
        uint64_t v106 = *((void *)v105 + 1);
        BOOL v108 = __OFSUB__(v106, v107);
        uint64_t v109 = v106 - v107;
        char v110 = v108;
        if (v108) {
          goto LABEL_142;
        }
        uint64_t v111 = &v84[16 * v87];
        uint64_t v113 = *(void *)v111;
        uint64_t v112 = *((void *)v111 + 1);
        BOOL v98 = __OFSUB__(v112, v113);
        uint64_t v114 = v112 - v113;
        if (v98) {
          goto LABEL_145;
        }
        if (__OFADD__(v109, v114)) {
          goto LABEL_146;
        }
        if (v109 + v114 >= v90)
        {
          BOOL v115 = v90 < v114;
LABEL_109:
          if (v115) {
            unint64_t v87 = v99;
          }
          goto LABEL_111;
        }
LABEL_103:
        if (v110) {
          goto LABEL_141;
        }
        os_log_type_t v118 = &v84[16 * v87];
        uint64_t v120 = *(void *)v118;
        uint64_t v119 = *((void *)v118 + 1);
        BOOL v98 = __OFSUB__(v119, v120);
        uint64_t v121 = v119 - v120;
        if (v98) {
          goto LABEL_144;
        }
        if (v121 < v109) {
          goto LABEL_14;
        }
LABEL_111:
        unint64_t v126 = v87 - 1;
        if (v87 - 1 >= v29)
        {
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
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
          goto LABEL_157;
        }
        if (!*v161) {
          goto LABEL_159;
        }
        uint64_t v127 = v27;
        uint64_t v128 = &v84[16 * v126];
        uint64_t v129 = *(void *)v128;
        uint64_t v130 = &v84[16 * v87];
        uint64_t v131 = *((void *)v130 + 1);
        sub_247734C14(*v161 + *(void *)(v154 + 72) * *(void *)v128, *v161 + *(void *)(v154 + 72) * *(void *)v130, *v161 + *(void *)(v154 + 72) * v131, v153);
        if (v2) {
          goto LABEL_131;
        }
        if (v131 < v129) {
          goto LABEL_134;
        }
        if (v87 > *((void *)v127 + 2)) {
          goto LABEL_135;
        }
        *(void *)uint64_t v128 = v129;
        *(void *)&v84[16 * v126 + 8] = v131;
        unint64_t v132 = *((void *)v127 + 2);
        if (v87 >= v132) {
          goto LABEL_136;
        }
        char v27 = v127;
        unint64_t v29 = v132 - 1;
        memmove(&v84[16 * v87], v130 + 16, 16 * (v132 - 1 - v87));
        *((void *)v127 + 2) = v132 - 1;
        if (v132 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v29 = 1;
LABEL_14:
    uint64_t v21 = v161[1];
    uint64_t v28 = v158;
    os_log_type_t v13 = v144;
    if (v158 >= v21) {
      goto LABEL_120;
    }
  }
  if (__OFADD__(v42, v142)) {
    goto LABEL_156;
  }
  if (v42 + v142 >= v21) {
    uint64_t v62 = v21;
  }
  else {
    uint64_t v62 = v42 + v142;
  }
  if (v62 >= v42)
  {
    if (v31 != v62)
    {
      uint64_t v143 = v27;
      uint64_t v147 = v62;
      uint64_t v148 = v2;
      uint64_t v63 = *(void *)(v154 + 72);
      uint64_t v64 = v63 * (v31 - 1);
      uint64_t v156 = v63;
      uint64_t v65 = v31 * v63;
      do
      {
        uint64_t v67 = 0;
        uint64_t v157 = v65;
        uint64_t v158 = v31;
        while (1)
        {
          uint64_t v68 = *v161;
          sub_247735794(v65 + v67 + *v161, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          uint64_t v69 = v64;
          uint64_t v70 = v64 + v67 + v68;
          uint64_t v71 = (uint64_t)v13;
          uint64_t v72 = (uint64_t)v155;
          sub_247735794(v70, (uint64_t)v155, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          uint64_t v73 = *(int *)(v159 + 20);
          uint64_t v74 = *(void *)(v71 + v73);
          uint64_t v75 = *(void *)(v71 + v73 + 8);
          uint64_t v76 = (void *)(v72 + v73);
          if (v74 == *v76 && v75 == v76[1]) {
            break;
          }
          char v78 = sub_247750FD8();
          sub_247737D44(v72, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          sub_247737D44(v71, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          os_log_type_t v13 = (char *)v71;
          if ((v78 & 1) == 0) {
            goto LABEL_60;
          }
          uint64_t v79 = *v161;
          if (!*v161) {
            goto LABEL_158;
          }
          uint64_t v64 = v69;
          uint64_t v65 = v157;
          uint64_t v80 = v79 + v64 + v67;
          sub_247737CDC(v79 + v157 + v67, v160, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          swift_arrayInitWithTakeFrontToBack();
          sub_247737CDC(v160, v80, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          v67 -= v156;
          ++v42;
          uint64_t v66 = v158;
          if (v158 == v42) {
            goto LABEL_61;
          }
        }
        sub_247737D44(v72, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        sub_247737D44(v71, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        os_log_type_t v13 = (char *)v71;
LABEL_60:
        uint64_t v64 = v69;
        uint64_t v65 = v157;
        uint64_t v66 = v158;
LABEL_61:
        uint64_t v31 = v66 + 1;
        v64 += v156;
        v65 += v156;
        uint64_t v42 = v150;
      }
      while (v31 != v147);
      uint64_t v31 = v147;
      uint64_t v2 = v148;
      char v27 = v143;
    }
    goto LABEL_72;
  }
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  uint64_t result = sub_247750E78();
  __break(1u);
  return result;
}

uint64_t sub_247734920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v35 = a4;
  uint64_t v30 = a1;
  uint64_t v33 = type metadata accessor for AvailableShortcutAction();
  uint64_t v6 = MEMORY[0x270FA5388](v33);
  uint64_t v34 = (uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v14 = (char *)&v28 - v13;
  uint64_t v32 = a3;
  uint64_t v29 = a2;
  if (a3 != a2)
  {
    uint64_t v15 = *(void *)(v12 + 72);
    uint64_t v36 = v15 * (v32 - 1);
    uint64_t v31 = v15;
    uint64_t v16 = v15 * v32;
LABEL_6:
    uint64_t v17 = 0;
    uint64_t v18 = v30;
    while (1)
    {
      uint64_t v19 = *v35;
      sub_247735794(v16 + v17 + *v35, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      sub_247735794(v36 + v17 + v19, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      uint64_t v20 = *(int *)(v33 + 20);
      uint64_t v21 = *(void *)&v14[v20];
      uint64_t v22 = *(void *)&v14[v20 + 8];
      uint64_t v23 = &v10[v20];
      if (v21 == *(void *)v23 && v22 == *((void *)v23 + 1))
      {
        sub_247737D44((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        uint64_t result = sub_247737D44((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
LABEL_5:
        v36 += v31;
        v16 += v31;
        if (++v32 == v29) {
          return result;
        }
        goto LABEL_6;
      }
      char v25 = sub_247750FD8();
      sub_247737D44((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      uint64_t result = sub_247737D44((uint64_t)v14, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      if ((v25 & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v26 = *v35;
      if (!*v35) {
        break;
      }
      uint64_t v27 = v26 + v36 + v17;
      sub_247737CDC(v26 + v16 + v17, v34, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_247737CDC(v34, v27, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      v17 -= v31;
      if (v32 == ++v18) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_247734C14(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v54 = type metadata accessor for AvailableShortcutAction();
  uint64_t v8 = MEMORY[0x270FA5388](v54);
  uint64_t v53 = (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v51 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v51 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v51 - v16;
  uint64_t v19 = *(void *)(v18 + 72);
  if (!v19)
  {
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  unint64_t v20 = a1;
  if (a2 - a1 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_72;
  }
  int64_t v21 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_73;
  }
  uint64_t v22 = (uint64_t)(a2 - a1) / v19;
  unint64_t v57 = a1;
  unint64_t v56 = a4;
  uint64_t v23 = v21 / v19;
  if (v22 >= v21 / v19)
  {
    if ((v23 & 0x8000000000000000) == 0)
    {
      unint64_t v52 = a1;
      uint64_t v25 = v23 * v19;
      if (a4 < a2 || a2 + v25 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v37 = a4 + v25;
      unint64_t v55 = a4 + v25;
      unint64_t v57 = a2;
      if (v25 >= 1 && v52 < a2)
      {
        uint64_t v39 = -v19;
        do
        {
          sub_247735794(v37 + v39, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          unint64_t v40 = a2 + v39;
          uint64_t v41 = v53;
          sub_247735794(a2 + v39, v53, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          uint64_t v42 = *(int *)(v54 + 20);
          uint64_t v43 = *(void *)&v12[v42];
          uint64_t v44 = *(void *)&v12[v42 + 8];
          uint64_t v45 = (void *)(v41 + v42);
          if (v43 == *v45 && v44 == v45[1]) {
            char v47 = 0;
          }
          else {
            char v47 = sub_247750FD8();
          }
          unint64_t v48 = a3 + v39;
          sub_247737D44(v53, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          sub_247737D44((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
          if (v47)
          {
            if (a3 < a2 || v48 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v57 += v39;
          }
          else
          {
            unint64_t v49 = v55;
            v55 += v39;
            if (a3 < v49 || v48 >= v49)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v49)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v40 = a2;
          }
          unint64_t v37 = v55;
          if (v55 <= a4) {
            break;
          }
          a2 = v40;
          a3 += v39;
        }
        while (v40 > v52);
      }
LABEL_70:
      sub_247746D98(&v57, &v56, (uint64_t *)&v55);
      return 1;
    }
  }
  else if ((v22 & 0x8000000000000000) == 0)
  {
    uint64_t v24 = v22 * v19;
    if (a4 < v20 || v20 + v24 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v20)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v26 = a4 + v24;
    unint64_t v55 = a4 + v24;
    if (v24 >= 1 && a2 < a3)
    {
      while (1)
      {
        sub_247735794(a2, (uint64_t)v17, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        sub_247735794(a4, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        uint64_t v28 = *(int *)(v54 + 20);
        uint64_t v29 = *(void *)&v17[v28];
        uint64_t v30 = *(void *)&v17[v28 + 8];
        uint64_t v31 = &v15[v28];
        if (v29 == *(void *)v31 && v30 == *((void *)v31 + 1)) {
          break;
        }
        char v33 = sub_247750FD8();
        sub_247737D44((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        sub_247737D44((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        if ((v33 & 1) == 0) {
          goto LABEL_32;
        }
        unint64_t v34 = v57;
        unint64_t v35 = a2 + v19;
        if (v57 < a2 || v57 >= v35)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v57 == a2)
        {
          unint64_t v34 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_38:
        unint64_t v57 = v34 + v19;
        a4 = v56;
        if (v56 < v26)
        {
          a2 = v35;
          if (v35 < a3) {
            continue;
          }
        }
        goto LABEL_70;
      }
      sub_247737D44((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
      sub_247737D44((uint64_t)v17, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
LABEL_32:
      unint64_t v34 = v57;
      unint64_t v36 = v56 + v19;
      if (v57 < v56 || v57 >= v36)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v57 != v56)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v56 = v36;
      unint64_t v35 = a2;
      goto LABEL_38;
    }
    goto LABEL_70;
  }
LABEL_74:
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_2477351B4@<X0>(unint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_2477372B8((uint64_t)v5);
  }
  unint64_t v6 = *((void *)v5 + 2);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    *a2 = v5[a1 + 32];
    if ((uint64_t)(v6 - 1 - a1) >= 0)
    {
      uint64_t result = (uint64_t)memmove(&v5[a1 + 32], &v5[a1 + 33], v6 - 1 - a1);
      *((void *)v5 + 2) = v7;
      *uint64_t v2 = v5;
      return result;
    }
  }
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_247735290@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    uint64_t v5 = *(void *)(v3 + 16);
    if (v5)
    {
LABEL_3:
      uint64_t v6 = v5 - 1;
      *a1 = *(unsigned char *)(v3 + v6 + 32);
      *(void *)(v3 + 16) = v6;
      *uint64_t v1 = v3;
      return result;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_2477372B8(v3);
    uint64_t v3 = result;
    uint64_t v5 = *(void *)(result + 16);
    if (v5) {
      goto LABEL_3;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247735300()
{
  return sub_2477315CC(v0);
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

uint64_t sub_247735320(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for AVSEnrollmentCoordinatorView(uint64_t a1)
{
  return sub_2477183B0(a1, (uint64_t *)&unk_26925FA88);
}

uint64_t sub_247735388()
{
  return sub_247750468();
}

uint64_t sub_2477353AC()
{
  return sub_247732390(*(void *)(v0 + 16));
}

uint64_t sub_2477353B4()
{
  return sub_2477353F0(&qword_26925F9C8, &qword_26925F9D0, (void (*)(void))sub_247735478, (void (*)(void))sub_247735578);
}

uint64_t sub_2477353F0(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247735478()
{
  unint64_t result = qword_26925F9D8;
  if (!qword_26925F9D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F9E0);
    sub_247735524();
    sub_247735320(&qword_26925F9F0, (void (*)(uint64_t))type metadata accessor for AVSCommandShortcutActionView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F9D8);
  }
  return result;
}

unint64_t sub_247735524()
{
  unint64_t result = qword_26925F9E8;
  if (!qword_26925F9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F9E8);
  }
  return result;
}

uint64_t sub_247735578()
{
  return sub_2477353F0(&qword_26925F9F8, &qword_26925FA00, (void (*)(void))sub_2477355B4, (void (*)(void))sub_247735608);
}

unint64_t sub_2477355B4()
{
  unint64_t result = qword_26925FA08;
  if (!qword_26925FA08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FA08);
  }
  return result;
}

unint64_t sub_247735608()
{
  unint64_t result = qword_26925FA10;
  if (!qword_26925FA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FA10);
  }
  return result;
}

uint64_t sub_24773565C()
{
  return sub_2477353F0(&qword_26925FA18, &qword_26925FA20, (void (*)(void))sub_247735698, (void (*)(void))sub_2477356EC);
}

unint64_t sub_247735698()
{
  unint64_t result = qword_26925FA28;
  if (!qword_26925FA28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FA28);
  }
  return result;
}

unint64_t sub_2477356EC()
{
  unint64_t result = qword_26925FA30;
  if (!qword_26925FA30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FA30);
  }
  return result;
}

unint64_t sub_247735740()
{
  unint64_t result = qword_26925FA38;
  if (!qword_26925FA38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FA38);
  }
  return result;
}

uint64_t sub_247735794(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247735800()
{
  return sub_247737BE0(sub_2477335F8);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_247712E94();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F978);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_247750328();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24773595C()
{
  uint64_t v1 = type metadata accessor for AVSEnrollmentCoordinatorView(0);
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 24)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

unint64_t sub_2477359CC()
{
  unint64_t result = qword_26925FA48;
  if (!qword_26925FA48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FA48);
  }
  return result;
}

uint64_t sub_247735A20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247735A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24772C6D0(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes, &qword_26925F8B8);
}

uint64_t sub_247735A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24772C740(a1, a2, a3, a4, &qword_26925F8C0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__recordingMagnitudes, &qword_26925F8B8);
}

uint64_t sub_247735A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24772C6D0(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded, &qword_26925F8D0);
}

uint64_t sub_247735ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24772C740(a1, a2, a3, a4, &qword_26925F8D8, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__enrollmentsRecorded, &qword_26925F8D0);
}

uint64_t sub_247735AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24772C6D0(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording, &qword_26925F8E8);
}

uint64_t sub_247735B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24772C740(a1, a2, a3, a4, &qword_26925F8F0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__isRecording, &qword_26925F8E8);
}

uint64_t sub_247735B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24772C6D0(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, &qword_26925F8E8);
}

uint64_t sub_247735B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24772C740(a1, a2, a3, a4, &qword_26925F8F0, (uint64_t)&OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject__cacheAVSfeatureEnabled, &qword_26925F8E8);
}

uint64_t sub_247735BA4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_enrollerFactory);
  swift_beginAccess();
  *a2 = *v3;
  return swift_retain();
}

uint64_t sub_247735C08()
{
  return type metadata accessor for AVSCoordinatorObject(0);
}

void sub_247735C10()
{
  sub_24773658C(319, &qword_26925FA60, &qword_26925F910);
  if (v0 <= 0x3F)
  {
    type metadata accessor for AdaptiveVoiceShortcut();
    if (v1 <= 0x3F)
    {
      sub_24773658C(319, &qword_26925FA68, &qword_26925F950);
      if (v2 <= 0x3F)
      {
        sub_2477365DC(319, &qword_26925FA70);
        if (v3 <= 0x3F)
        {
          sub_2477365DC(319, &qword_26925FA78);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

uint64_t method lookup function for AVSCoordinatorObject(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AVSCoordinatorObject);
}

uint64_t dispatch thunk of AVSCoordinatorObject.recordingMagnitudes.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.recordingMagnitudes.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.recordingMagnitudes.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$recordingMagnitudes.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$recordingMagnitudes.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 312))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$recordingMagnitudes.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollmentsRecorded.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollmentsRecorded.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 336))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollmentsRecorded.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$enrollmentsRecorded.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$enrollmentsRecorded.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$enrollmentsRecorded.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.isRecording.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.isRecording.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 384))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.isRecording.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$isRecording.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$isRecording.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$isRecording.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.cacheAVSfeatureEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.cacheAVSfeatureEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.cacheAVSfeatureEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$cacheAVSfeatureEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$cacheAVSfeatureEnabled.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.$cacheAVSfeatureEnabled.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.dismissEnrollmentFlow.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.dismissEnrollmentFlow.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 504))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.dismissEnrollmentFlow.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollerFactory.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 592))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollerFactory.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enrollerFactory.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 640))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.startStreamingEnrollment()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 648))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.setupAudioFileEnrollment()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 656))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.dumpEnrollment(from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 664))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.stopStreamingEnrollment()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 680))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.saveName(name:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.saveAssociatedShortcut(shortcut:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 696))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.finishEnrollment()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 704))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.navigateToNextView()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 712))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.navigateBack()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 720))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.navigateToRestartEnrollment()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 728))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.enableAudioDonation()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 736))();
}

uint64_t dispatch thunk of AVSCoordinatorObject.resetEnrollmentData()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 744))();
}

void sub_24773658C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_247750238();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_2477365DC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_247750238();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for AVSCoordinatorObject.Stage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AVSCoordinatorObject.Stage(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x247736780);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AVSCoordinatorObject.Stage()
{
  return &type metadata for AVSCoordinatorObject.Stage;
}

uint64_t initializeBufferWithCopyOfBuffer for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *(void *)a1 = *a2;
    a1 = v14 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    uint64_t v7 = *a2;
    uint64_t v8 = a2[1];
    char v9 = *((unsigned char *)a2 + 16);
    sub_247712E28();
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = v9;
    uint64_t v10 = *(int *)(a3 + 20);
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F978);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_247750328();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
  }
  swift_retain();
  return a1;
}

uint64_t destroy for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t a2)
{
  sub_247712E94();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F978);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_247750328();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

uint64_t initializeWithCopy for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_247712E28();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)((char *)a2 + v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F978);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_247750328();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  else
  {
    void *v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_247712E28();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_247712E94();
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_247712A34(a1 + v9, &qword_26925F978);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F978);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_247750328();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (void *)(a1 + v6);
  char v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F978);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_247750328();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_247712E94();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 20);
    char v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_247712A34(a1 + v7, &qword_26925F978);
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F978);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_247750328();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_247736E3C);
}

uint64_t sub_247736E3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA80);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for AVSEnrollmentCoordinatorView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247736F18);
}

uint64_t sub_247736F18(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FA80);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_247736FDC()
{
  sub_247737080();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_247737080()
{
  if (!qword_26925FA98)
  {
    sub_247750328();
    unint64_t v0 = sub_2477502A8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26925FA98);
    }
  }
}

unint64_t sub_2477370DC()
{
  unint64_t result = qword_26925FAA0;
  if (!qword_26925FAA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FA40);
    sub_247737158();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FAA0);
  }
  return result;
}

unint64_t sub_247737158()
{
  unint64_t result = qword_26925FAA8;
  if (!qword_26925FAA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F988);
    sub_247712AEC(&qword_26925FAB0, &qword_26925F980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FAA8);
  }
  return result;
}

uint64_t sub_2477371F8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247737238()
{
  return sub_24772F294(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_247737240(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2477372A4(unint64_t a1)
{
  return sub_247721704(0, *(void *)(a1 + 16), 0, a1);
}

char *sub_2477372B8(uint64_t a1)
{
  return sub_247721320(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2477372CC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_247737354(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *(void *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(void *)(v4 + 24) >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_247721704(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = *(void *)(type metadata accessor for AdaptiveVoiceShortcut() - 8);
  unint64_t v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  uint64_t v14 = *(void *)(v12 + 72);
  uint64_t v15 = v14 * a1;
  unint64_t v16 = v13 + v14 * a1;
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v18 = *(void *)(v4 + 16);
  uint64_t v19 = v18 - a2;
  if (__OFSUB__(v18, a2)) {
    goto LABEL_31;
  }
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      uint64_t result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      uint64_t result = swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v21 = *(void *)(v4 + 16);
    BOOL v22 = __OFADD__(v21, v8);
    uint64_t v23 = v21 - v7;
    if (!v22)
    {
      *(void *)(v4 + 16) = v23;
LABEL_25:
      *uint64_t v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_24773753C(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_247750E88();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_247750E88();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_247750E88();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  *uint64_t v3 = MEMORY[0x24C55BDF0](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  sub_24771F388(0, (unint64_t *)&qword_26925FAB8);
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_247750E88();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_247750EC8();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_247750E88();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:

  return sub_247750BA8();
}

uint64_t sub_247737858(void *a1)
{
  if (objc_msgSend(a1, sel_floatChannelData)
    || (v4 = a1, (id v3 = (id)convertToFloat32PCM(buffer:)(*(AVAudioPCMBuffer *)(&v2 - 1))) == 0))
  {
    id v3 = a1;
  }
  uint64_t v5 = v3;
  id v6 = objc_msgSend(v3, sel_magnitudesWithLevelMultiplier_count_, 53, 10.0);
  if (!v6) {
    goto LABEL_28;
  }
  uint64_t v7 = v6;
  sub_24771F388(0, (unint64_t *)&qword_26925FAB8);
  unint64_t v8 = sub_247750B98();

  if (!v8) {
    goto LABEL_28;
  }
  unint64_t v26 = v8;
  if (!(v8 >> 62))
  {
    if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) > 3uLL) {
      goto LABEL_8;
    }
LABEL_25:
    swift_bridgeObjectRelease();
LABEL_28:

    return MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_247750E88();
  swift_bridgeObjectRelease();
  if (v23 < 4) {
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_247750E88();
  swift_bridgeObjectRelease();
  if (v24 < 3)
  {
    __break(1u);
    goto LABEL_25;
  }
LABEL_8:
  sub_24773753C(0, 3);
  if (!(v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_247750E88();
  if (!v9)
  {
LABEL_27:
    swift_bridgeObjectRelease_n();
    goto LABEL_28;
  }
LABEL_10:
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t result = sub_24771EAD8(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    uint64_t v11 = v25;
    if ((v26 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        MEMORY[0x24C55BDE0](i, v26);
        sub_247750C48();
        int v14 = v13;
        swift_unknownObjectRelease();
        unint64_t v16 = *(void *)(v25 + 16);
        unint64_t v15 = *(void *)(v25 + 24);
        if (v16 >= v15 >> 1) {
          sub_24771EAD8(v15 > 1, v16 + 1, 1);
        }
        *(void *)(v25 + 16) = v16 + 1;
        *(_DWORD *)(v25 + 4 * v16 + 32) = v14;
      }
    }
    else
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v18 = *(id *)(v26 + 8 * j + 32);
        sub_247750C48();
        int v20 = v19;

        unint64_t v22 = *(void *)(v25 + 16);
        unint64_t v21 = *(void *)(v25 + 24);
        if (v22 >= v21 >> 1) {
          sub_24771EAD8(v21 > 1, v22 + 1, 1);
        }
        *(void *)(v25 + 16) = v22 + 1;
        *(_DWORD *)(v25 + 4 * v22 + 32) = v20;
      }
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_247737B3C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_247737B64()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_247737B8C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247737BC8()
{
  return sub_247737BE0(sub_2477337B8);
}

uint64_t sub_247737BE0(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for AVSEnrollmentCoordinatorView(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_247737C58@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for AVSEnrollmentCoordinatorView(0);
  char v5 = *a1;
  return sub_2477325A8(&v5, a2);
}

uint64_t sub_247737CDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_247737D44(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

ValueMetadata *type metadata accessor for AVSWelcomeView()
{
  return &type metadata for AVSWelcomeView;
}

uint64_t sub_247737DDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247737DF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void v19[3] = a1;
  uint64_t v24 = a2;
  uint64_t v2 = sub_2477500F8();
  uint64_t v20 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F158);
  MEMORY[0x270FA5388](v5 - 8);
  unint64_t v22 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAF0);
  uint64_t v21 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  unint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v10 = (id)qword_269262028;
  }
  else
  {
    id v10 = objc_msgSend(self, sel_mainBundle);
    uint64_t v9 = 0;
  }
  id v11 = v9;
  uint64_t v12 = sub_24774FE68();
  v19[1] = v13;
  v19[2] = v12;

  sub_24773D560(0xD000000000000013);
  int v14 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v15 = (id)qword_269262028;
  }
  else
  {
    id v15 = objc_msgSend(self, sel_mainBundle);
    int v14 = 0;
  }
  id v16 = v14;
  sub_24774FE68();

  uint64_t v17 = swift_bridgeObjectRelease();
  MEMORY[0x270FA5388](v17);
  uint64_t v25 = MEMORY[0x263F8EE78];
  sub_2477128C0(&qword_26925F180, MEMORY[0x263F22110]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F188);
  sub_247712AEC(&qword_26925F190, &qword_26925F188);
  sub_247750D68();
  sub_247750988();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAF8);
  sub_247738C70();
  sub_2477500E8();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v21 + 32))(v24, v8, v23);
}

uint64_t sub_2477382A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v39 = a3;
  uint64_t v4 = sub_2477505B8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v37 = v4;
  uint64_t v38 = v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1B8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1C0);
  uint64_t v12 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  int v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAF8);
  uint64_t v15 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v34;
  *(void *)(v18 + 24) = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1C8);
  sub_247712820();
  sub_247750958();
  sub_2477505A8();
  sub_247712AEC(&qword_26925F1E8, &qword_26925F1B8);
  sub_2477128C0(&qword_26925F1F0, MEMORY[0x263F1A3B8]);
  uint64_t v19 = v37;
  sub_2477507B8();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v19);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  char v20 = sub_2477506A8();
  sub_247750258();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v29 = v36;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v14, v36);
  uint64_t v30 = v35;
  uint64_t v31 = &v17[*(int *)(v35 + 36)];
  *uint64_t v31 = v20;
  *((void *)v31 + 1) = v22;
  *((void *)v31 + 2) = v24;
  *((void *)v31 + 3) = v26;
  *((void *)v31 + 4) = v28;
  v31[40] = 0;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v29);
  uint64_t v32 = v39;
  sub_247738DD4((uint64_t)v17, v39);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v32, 0, 1, v30);
}

uint64_t sub_2477386D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v16 = sub_2477504A8();
  sub_2477387A4((uint64_t)&v17);
  uint64_t v2 = v17;
  char v3 = v18;
  uint64_t v4 = v19;
  uint64_t v5 = v20;
  char v6 = v21;
  uint64_t v7 = v22;
  uint64_t v8 = v23;
  char v9 = v24;
  char v10 = sub_2477506D8();
  uint64_t result = sub_247750258();
  *(void *)a1 = v16;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v2;
  *(unsigned char *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v8;
  *(unsigned char *)(a1 + 80) = v9;
  *(unsigned char *)(a1 + 88) = v10;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v13;
  *(void *)(a1 + 112) = v14;
  *(void *)(a1 + 120) = v15;
  *(unsigned char *)(a1 + 128) = 0;
  return result;
}

uint64_t sub_2477387A4@<X0>(uint64_t a1@<X8>)
{
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v3 = objc_msgSend(self, sel_mainBundle);
  }
  id v4 = v2;
  uint64_t v5 = sub_247750758();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  uint64_t v10 = sub_247750748();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_247712AA0(v5, v7, v9);
  swift_bridgeObjectRelease();
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v12;
  *(unsigned char *)(a1 + 32) = v16;
  *(void *)(a1 + 40) = v14;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  sub_247712A90(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_247712AA0(v10, v12, v16);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24773894C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();

  return sub_247750958();
}

uint64_t sub_2477389F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void (**)(uint64_t))(a2
                                     + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  id v3 = *v2;
  uint64_t v4 = swift_retain();
  v3(v4);
  return swift_release();
}

uint64_t sub_247738A60()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAD8);
  MEMORY[0x270FA5388](v1);
  id v3 = &v8[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = *v0;
  uint64_t v4 = v0[1];
  *(void *)id v3 = sub_247750548();
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAE0);
  sub_247737DF8(v5, (uint64_t)&v3[*(int *)(v6 + 44)]);
  uint64_t v9 = v5;
  uint64_t v10 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F238);
  sub_247712AEC(&qword_26925FAE8, &qword_26925FAD8);
  sub_247712AEC(&qword_26925F248, &qword_26925F238);
  sub_247750868();
  return sub_247738BC8((uint64_t)v3);
}

uint64_t sub_247738BC0()
{
  return sub_24773894C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_247738BC8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247738C28()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247738C60()
{
  return sub_2477389F4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_247738C68@<X0>(uint64_t a1@<X8>)
{
  return sub_2477382A8(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_247738C70()
{
  unint64_t result = qword_26925FB00;
  if (!qword_26925FB00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FAF8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F1B8);
    sub_2477505B8();
    sub_247712AEC(&qword_26925F1E8, &qword_26925F1B8);
    sub_2477128C0(&qword_26925F1F0, MEMORY[0x263F1A3B8]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FB00);
  }
  return result;
}

uint64_t sub_247738D94()
{
  swift_retain();
  sub_24772E4C8();

  return swift_release();
}

uint64_t sub_247738DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FAF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247738E3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247738F08()
{
  uint64_t v2 = v0;
  v127[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = sub_247750158();
  uint64_t v123 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v122 = (char *)&v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v121 = (char *)&v116 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v119 = (char *)&v116 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (unint64_t)&v116 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v116 - v13;
  *(_OWORD *)(v2 + 67) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  id v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9360]), sel_init);
  *(void *)(v2 + 16) = v15;
  char v16 = self;
  unint64_t v17 = 0x26521F000uLL;
  uint64_t v18 = (uint64_t)objc_msgSend(v16, sel_sharedInstance);
  *(void *)(v2 + 24) = v18;
  *(void *)(v2 + 32) = objc_msgSend(v15, sel_inputNode);
  if (objc_msgSend(self, sel_supportsVirtualAudioDevice))
  {
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v3, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v14, v19, v3);
    uint64_t v20 = sub_247750138();
    os_log_type_t v21 = sub_247750C88();
    uint64_t v18 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_24770E000, v20, (os_log_type_t)v18, "AVS supports virtual audio device", v22, 2u);
      MEMORY[0x24C55C7C0](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v123 + 8))(v14, v3);
    sub_24773AF80();
  }
  else
  {
    uint64_t v23 = *MEMORY[0x263EF9050];
    uint64_t v24 = *MEMORY[0x263EF9108];
    v127[0] = 0;
    if (!objc_msgSend((id)v18, sel_setCategory_mode_options_error_, v23, v24, 41, v127))
    {
      unint64_t v1 = 0x26521F000uLL;
      id v26 = v127[0];
      uint64_t v18 = sub_24774FE78();

      swift_willThrow();
      if (qword_26925F138 == -1) {
        goto LABEL_10;
      }
      goto LABEL_60;
    }
    id v25 = v127[0];
  }
  while (1)
  {
    id v31 = objc_msgSend(*(id *)(v2 + 24), sel_availableInputs);
    if (!v31) {
      goto LABEL_64;
    }
    uint64_t v32 = v31;
    sub_24771F388(0, &qword_26925FB20);
    unint64_t v12 = sub_247750B98();

    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v68 = sub_247750E88();
      swift_bridgeObjectRelease();
      if (!v68)
      {
LABEL_57:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
    }
    else if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_57;
    }
    if ((v12 & 0xC000000000000001) != 0) {
      break;
    }
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      char v33 = *(id *)(v12 + 32);
      goto LABEL_19;
    }
    __break(1u);
LABEL_60:
    swift_once();
LABEL_10:
    uint64_t v27 = __swift_project_value_buffer(v3, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v123 + 16))(v12, v27, v3);
    uint64_t v28 = sub_247750138();
    os_log_type_t v29 = sub_247750C68();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_24770E000, v28, v29, "AVS unable to set audio session category to measurement mode", v30, 2u);
      MEMORY[0x24C55C7C0](v30, -1, -1);
    }

    (*(void (**)(unint64_t, uint64_t))(v123 + 8))(v12, v3);
    unint64_t v17 = v1;
  }
  char v33 = MEMORY[0x24C55BDE0](0, v12);
LABEL_19:
  uint64_t v34 = v33;
  swift_bridgeObjectRelease();
  id v35 = [v34 dataSources];
  if (!v35)
  {

    goto LABEL_64;
  }
  uint64_t v36 = v35;
  uint64_t v118 = v2;
  sub_24771F388(0, &qword_26925FB28);
  unint64_t v37 = sub_247750B98();

  v126[0] = (id)MEMORY[0x263F8EE78];
  if (v37 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_247750E88();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v117 = v34;
  if (!v2)
  {
    swift_bridgeObjectRelease();
    unint64_t v37 = MEMORY[0x263F8EE78];
    uint64_t v2 = v118;
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_43;
  }
  uint64_t v120 = v3;
  uint64_t v116 = v16;
  if (v2 < 1)
  {
    __break(1u);
    goto LABEL_86;
  }
  for (uint64_t i = 0; i != v2; ++i)
  {
    if ((v37 & 0xC000000000000001) != 0) {
      id v39 = (id)MEMORY[0x24C55BDE0](i, v37);
    }
    else {
      id v39 = *(id *)(v37 + 8 * i + 32);
    }
    unint64_t v40 = v39;
    id v41 = objc_msgSend(v39, sel_orientation, v116);
    if (!v41)
    {
LABEL_25:

      continue;
    }
    uint64_t v42 = v41;
    uint64_t v43 = sub_247750B08();
    uint64_t v45 = v44;
    if (v43 == sub_247750B08() && v45 == v46)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v48 = sub_247750FD8();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v48 & 1) == 0) {
        goto LABEL_25;
      }
    }
    sub_247750E38();
    sub_247750E58();
    sub_247750E68();
    sub_247750E48();
  }
  swift_bridgeObjectRelease();
  unint64_t v37 = (unint64_t)v126[0];
  char v16 = v116;
  unint64_t v17 = 0x26521F000uLL;
  uint64_t v3 = v120;
  uint64_t v34 = v117;
  uint64_t v2 = v118;
  if (((unint64_t)v126[0] & 0x8000000000000000) != 0)
  {
LABEL_62:
    swift_bridgeObjectRetain();
    uint64_t v69 = sub_247750E88();
    swift_release();
    if (!v69) {
      goto LABEL_63;
    }
LABEL_45:
    if ((v37 & 0xC000000000000001) == 0)
    {
      if (*(void *)(v37 + 16))
      {
        id v49 = *(id *)(v37 + 32);
LABEL_48:
        uint64_t v50 = v49;
        swift_release();
        uint64_t v51 = *(void **)(v2 + 24);
        v126[0] = 0;
        unsigned int v52 = objc_msgSend(v51, sel_setPreferredInput_error_, v34, v126);
        id v53 = v126[0];
        if (v52)
        {
          v126[0] = 0;
          id v54 = v53;
          unsigned int v55 = objc_msgSend(v51, sel_setInputDataSource_error_, v50, v126);
          id v53 = v126[0];
          if (v55)
          {
            id v56 = v126[0];

            goto LABEL_64;
          }
        }
        id v57 = v53;
        uint64_t v2 = sub_24774FE78();

        swift_willThrow();
        if (qword_26925F138 == -1)
        {
LABEL_52:
          uint64_t v58 = __swift_project_value_buffer(v3, (uint64_t)qword_26925F898);
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v119, v58, v3);
          id v59 = (id)v2;
          id v60 = (id)v2;
          unint64_t v61 = sub_247750138();
          os_log_type_t v62 = sub_247750C68();
          if (os_log_type_enabled(v61, v62))
          {
            uint64_t v63 = (uint8_t *)swift_slowAlloc();
            uint64_t v64 = (void *)swift_slowAlloc();
            *(_DWORD *)uint64_t v63 = 138412290;
            id v65 = (id)v2;
            uint64_t v66 = (void *)_swift_stdlib_bridgeErrorToNSError();
            v126[0] = v66;
            sub_247750CF8();
            *uint64_t v64 = v66;

            _os_log_impl(&dword_24770E000, v61, v62, "AVS unable to set prefered input data source %@", v63, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
            swift_arrayDestroy();
            uint64_t v67 = v64;
            unint64_t v17 = 0x26521F000;
            MEMORY[0x24C55C7C0](v67, -1, -1);
            MEMORY[0x24C55C7C0](v63, -1, -1);

            unint64_t v61 = v117;
          }
          else
          {
          }
          (*(void (**)(char *, uint64_t))(v123 + 8))(v119, v3);
          uint64_t v2 = v118;
          goto LABEL_64;
        }
      }
      else
      {
        __break(1u);
      }
      swift_once();
      goto LABEL_52;
    }
LABEL_86:
    id v49 = (id)MEMORY[0x24C55BDE0](0, v37);
    goto LABEL_48;
  }
LABEL_43:
  if ((v37 & 0x4000000000000000) != 0) {
    goto LABEL_62;
  }
  if (*(void *)(v37 + 16)) {
    goto LABEL_45;
  }
LABEL_63:

  swift_release();
LABEL_64:
  uint64_t v70 = *(void **)(v2 + 24);
  uint64_t v71 = (void *)sub_247750AF8();
  id v72 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, 1);
  v126[0] = 0;
  unsigned int v73 = objc_msgSend(v70, sel_setMXSessionProperty_value_error_, v71, v72, v126);

  if (v73)
  {
    id v74 = v126[0];
  }
  else
  {
    id v75 = v126[0];
    uint64_t v76 = (void *)sub_24774FE78();

    swift_willThrow();
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v77 = __swift_project_value_buffer(v3, (uint64_t)qword_26925F898);
    swift_beginAccess();
    char v78 = v121;
    (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v121, v77, v3);
    id v79 = v76;
    id v80 = v76;
    unint64_t v81 = sub_247750138();
    os_log_type_t v82 = sub_247750C68();
    if (os_log_type_enabled(v81, v82))
    {
      unint64_t v83 = v16;
      long long v84 = (uint8_t *)swift_slowAlloc();
      uint64_t v85 = swift_slowAlloc();
      uint64_t v120 = v3;
      uint64_t v86 = (void *)v85;
      *(_DWORD *)long long v84 = 138412290;
      id v87 = v76;
      uint64_t v88 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v125[0] = v88;
      sub_247750CF8();
      void *v86 = v88;
      char v16 = v83;

      _os_log_impl(&dword_24770E000, v81, v82, "AVS unable to set kMXSessionProperty_PrefersNoInterruptionsDuringRemoteDeviceControl on audio session %@ ", v84, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
      swift_arrayDestroy();
      uint64_t v89 = v86;
      unint64_t v17 = 0x26521F000;
      uint64_t v3 = v120;
      MEMORY[0x24C55C7C0](v89, -1, -1);
      uint64_t v90 = v84;
      char v78 = v121;
      MEMORY[0x24C55C7C0](v90, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v123 + 8))(v78, v3);
  }
  char v91 = *(void **)(v2 + 24);
  v125[0] = 0;
  if (objc_msgSend(v91, sel_setAllowHapticsAndSystemSoundsDuringRecording_error_, 1, v125, v116))
  {
    id v92 = v125[0];
    if (*(unsigned char *)(v2 + 81)) {
      goto LABEL_82;
    }
LABEL_81:
    id v109 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v110 = *MEMORY[0x263EF90A0];
    id v111 = [v16 *(SEL *)(v17 + 2640)];
    objc_msgSend(v109, sel_addObserver_selector_name_object_, v2, sel_handleAudioSessionInterruptionWithNotification_, v110, v111);

    *(unsigned char *)(v2 + 81) = 1;
    goto LABEL_82;
  }
  id v93 = v125[0];
  uint64_t v94 = (void *)sub_24774FE78();

  swift_willThrow();
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v95 = __swift_project_value_buffer(v3, (uint64_t)qword_26925F898);
  swift_beginAccess();
  uint64_t v96 = v122;
  (*(void (**)(char *, uint64_t, uint64_t))(v123 + 16))(v122, v95, v3);
  id v97 = v94;
  id v98 = v94;
  unint64_t v99 = sub_247750138();
  os_log_type_t v100 = sub_247750C68();
  if (os_log_type_enabled(v99, v100))
  {
    uint64_t v101 = v16;
    uint64_t v102 = (uint8_t *)swift_slowAlloc();
    uint64_t v103 = swift_slowAlloc();
    uint64_t v120 = v3;
    uint64_t v104 = (void *)v103;
    *(_DWORD *)uint64_t v102 = 138412290;
    id v105 = v94;
    uint64_t v106 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v124 = v106;
    sub_247750CF8();
    *uint64_t v104 = v106;
    char v16 = v101;

    _os_log_impl(&dword_24770E000, v99, v100, "AVS unable to set allow haptics and system sounds during recording %@ ", v102, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
    swift_arrayDestroy();
    uint64_t v107 = v104;
    unint64_t v17 = 0x26521F000;
    uint64_t v3 = v120;
    MEMORY[0x24C55C7C0](v107, -1, -1);
    BOOL v108 = v102;
    uint64_t v96 = v122;
    MEMORY[0x24C55C7C0](v108, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v123 + 8))(v96, v3);
  if ((*(unsigned char *)(v2 + 81) & 1) == 0) {
    goto LABEL_81;
  }
LABEL_82:
  if ((*(unsigned char *)(v2 + 82) & 1) == 0)
  {
    id v112 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v113 = *MEMORY[0x263EF90F8];
    id v114 = [v16 *(SEL *)(v17 + 2640)];
    objc_msgSend(v112, sel_addObserver_selector_name_object_, v2, sel_handleAudioSessionResetWithNotification_, v113, v114);

    *(unsigned char *)(v2 + 82) = 1;
  }
  return v2;
}

uint64_t sub_247739F34()
{
  if (*(unsigned char *)(v0 + 81) == 1)
  {
    id v1 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v2 = *MEMORY[0x263EF90A0];
    id v3 = objc_msgSend(self, sel_sharedInstance);
    objc_msgSend(v1, sel_removeObserver_name_object_, v0, v2, v3);

    *(unsigned char *)(v0 + 81) = 0;
  }
  if (*(unsigned char *)(v0 + 82) == 1)
  {
    id v4 = objc_msgSend(self, sel_defaultCenter);
    uint64_t v5 = *MEMORY[0x263EF90F8];
    id v6 = objc_msgSend(self, sel_sharedInstance);
    objc_msgSend(v4, sel_removeObserver_name_object_, v0, v5, v6);

    *(unsigned char *)(v0 + 82) = 0;
  }

  sub_247712A34(v0 + 40, &qword_26925F968);
  return v0;
}

uint64_t sub_24773A098()
{
  sub_247739F34();

  return MEMORY[0x270FA0228](v0, 83, 7);
}

uint64_t sub_24773A0CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_247750158();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v19 - v8;
  if (*(unsigned char *)(v1 + 80))
  {
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v10, v2);
    uint64_t v11 = sub_247750138();
    os_log_type_t v12 = sub_247750C88();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_24770E000, v11, v12, "AVS attempted to start listening but it is already actively listening", v13, 2u);
      MEMORY[0x24C55C7C0](v13, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  }
  else
  {
    sub_24773B30C();
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v14, v2);
    id v15 = sub_247750138();
    os_log_type_t v16 = sub_247750C88();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_24770E000, v15, v16, "AVS [AVS Audio Engine] started listening successfully", v17, 2u);
      MEMORY[0x24C55C7C0](v17, -1, -1);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    *(unsigned char *)(v1 + 80) = 1;
  }
  return result;
}

uint64_t sub_24773A5A4()
{
  uint64_t v1 = v0;
  v38[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_247750158();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v35 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v35 - v10;
  if (*(unsigned char *)(v1 + 80) == 1)
  {
    objc_msgSend(*(id *)(v1 + 32), sel_removeTapOnBus_, 0);
    objc_msgSend(*(id *)(v1 + 16), sel_stop);
    os_log_type_t v12 = *(void **)(v1 + 24);
    v38[0] = 0;
    if (objc_msgSend(v12, sel_setActive_withOptions_error_, 0, 0, v38))
    {
      uint64_t v13 = qword_26925F138;
      id v14 = v38[0];
      if (v13 != -1) {
        swift_once();
      }
      uint64_t v15 = __swift_project_value_buffer(v2, (uint64_t)qword_26925F898);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v15, v2);
      os_log_type_t v16 = sub_247750138();
      os_log_type_t v17 = sub_247750C88();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_24770E000, v16, v17, "AVS [AVS Audio Provider] stopped listening successfully", v18, 2u);
        MEMORY[0x24C55C7C0](v18, -1, -1);
      }

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v11, v2);
      *(unsigned char *)(v1 + 80) = 0;
    }
    else
    {
      id v24 = v38[0];
      id v25 = (void *)sub_24774FE78();

      swift_willThrow();
      if (qword_26925F138 != -1) {
        swift_once();
      }
      uint64_t v26 = __swift_project_value_buffer(v2, (uint64_t)qword_26925F898);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v26, v2);
      id v27 = v25;
      id v28 = v25;
      os_log_type_t v29 = sub_247750138();
      os_log_type_t v30 = sub_247750C68();
      if (os_log_type_enabled(v29, v30))
      {
        id v31 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = (void *)swift_slowAlloc();
        *(_DWORD *)id v31 = 138412290;
        id v32 = v25;
        uint64_t v33 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v37 = v33;
        sub_247750CF8();
        uint64_t v34 = v36;
        *uint64_t v36 = v33;

        _os_log_impl(&dword_24770E000, v29, v30, "AVS [AVS Audio Provider] was unable to stop listening %@", v31, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
        swift_arrayDestroy();
        MEMORY[0x24C55C7C0](v34, -1, -1);
        MEMORY[0x24C55C7C0](v31, -1, -1);
      }
      else
      {
      }
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  else
  {
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v2, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v20, v2);
    os_log_type_t v21 = sub_247750138();
    os_log_type_t v22 = sub_247750C88();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_24770E000, v21, v22, "AVS attempted to stop listening but it is not actively listening", v23, 2u);
      MEMORY[0x24C55C7C0](v23, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  return result;
}

id sub_24773AB0C()
{
  v30[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_247750158();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v27 - v6;
  if (objc_msgSend(*(id *)(v0 + 24), sel_isActive))
  {
    uint64_t v8 = *(void **)(v0 + 16);
    v30[0] = 0;
    unsigned int v9 = objc_msgSend(v8, sel_startAndReturnError_, v30);
    id v10 = v30[0];
    if (v9)
    {
      *(unsigned char *)(v0 + 80) = 1;
      return v10;
    }
    else
    {
      id v28 = v30[0];
      id v16 = v30[0];
      os_log_type_t v17 = (void *)sub_24774FE78();

      swift_willThrow();
      if (qword_26925F138 != -1) {
        swift_once();
      }
      uint64_t v18 = __swift_project_value_buffer(v1, (uint64_t)qword_26925F898);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v18, v1);
      id v19 = v17;
      id v20 = v17;
      os_log_type_t v21 = sub_247750138();
      os_log_type_t v22 = sub_247750C68();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        id v28 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 138412290;
        id v24 = v17;
        uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v29 = v25;
        sub_247750CF8();
        uint64_t v26 = v28;
        *id v28 = v25;

        _os_log_impl(&dword_24770E000, v21, v22, "AVS unable to resume listening %@", v23, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
        swift_arrayDestroy();
        MEMORY[0x24C55C7C0](v26, -1, -1);
        MEMORY[0x24C55C7C0](v23, -1, -1);
      }
      else
      {
      }
      return (id)(*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    }
  }
  else
  {
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v1, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v12, v1);
    uint64_t v13 = sub_247750138();
    os_log_type_t v14 = sub_247750C68();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_24770E000, v13, v14, "Session is not active, ignoring resume call", v15, 2u);
      MEMORY[0x24C55C7C0](v15, -1, -1);
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  }
}

void sub_24773AF80()
{
  v29[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_247750158();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9410]), sel_init);
  objc_msgSend(v5, sel_setRouteControlOptions_, 1);
  uint64_t v6 = *(void **)(v0 + 24);
  uint64_t v7 = *MEMORY[0x263EF9070];
  uint64_t v8 = *MEMORY[0x263EF9108];
  v29[0] = 0;
  unsigned int v9 = objc_msgSend(v6, sel_setCategory_mode_options_error_, v7, v8, 131073, v29);
  id v10 = v29[0];
  if (v9
    && (v29[0] = 0,
        id v11 = v10,
        unsigned int v12 = objc_msgSend(v6, sel_setPreferredRouteControlConfig_error_, v5, v29),
        id v10 = v29[0],
        v12))
  {
    id v13 = v29[0];
  }
  else
  {
    id v14 = v10;
    uint64_t v15 = (void *)sub_24774FE78();

    swift_willThrow();
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v1, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v16, v1);
    id v17 = v15;
    id v18 = v15;
    id v19 = sub_247750138();
    os_log_type_t v20 = sub_247750C68();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v27 = v2;
      uint64_t v21 = swift_slowAlloc();
      id v26 = v5;
      os_log_type_t v22 = (uint8_t *)v21;
      uint64_t v23 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v22 = 138412290;
      id v24 = v15;
      uint64_t v25 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v28 = v25;
      sub_247750CF8();
      *uint64_t v23 = v25;
      uint64_t v2 = v27;

      _os_log_impl(&dword_24770E000, v19, v20, "Error setting up echo cancelled independent route for AVS. %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
      swift_arrayDestroy();
      MEMORY[0x24C55C7C0](v23, -1, -1);
      MEMORY[0x24C55C7C0](v22, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

void sub_24773B30C()
{
  void aBlock[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_247750158();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&aBlock[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = *(void **)(v0 + 24);
  aBlock[0] = 0;
  if (objc_msgSend(v5, sel_setActive_withOptions_error_, 1, 0, aBlock))
  {
    uint64_t v6 = *(void **)(v0 + 16);
    id v7 = aBlock[0];
    id v8 = objc_msgSend(v6, sel_attachedNodes);
    sub_24771F388(0, &qword_26925FB10);
    sub_24773D39C();
    uint64_t v9 = sub_247750C58();

    if ((v9 & 0xC000000000000001) != 0) {
      uint64_t v10 = sub_247750D88();
    }
    else {
      uint64_t v10 = *(void *)(v9 + 16);
    }
    swift_bridgeObjectRelease();
    if (v10 >= 1) {
      objc_msgSend(*(id *)(v0 + 32), sel_removeTapOnBus_, 0);
    }
    unsigned int v12 = objc_msgSend(*(id *)(v0 + 32), sel_inputFormatForBus_, 0);
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9388]), sel_initWithCommonFormat_sampleRate_channels_interleaved_, 3, 1, 0, 16000.0);
    if (v13)
    {
      id v14 = v13;
      id v15 = objc_allocWithZone(MEMORY[0x263EF9340]);
      uint64_t v16 = v14;
      id v17 = objc_msgSend(v15, sel_initFromFormat_toFormat_, v12, v16);
      if (v17)
      {
        id v18 = v17;
        id v34 = *(id *)(v0 + 32);
        uint64_t v19 = swift_allocObject();
        swift_weakInit();
        os_log_type_t v20 = (void *)swift_allocObject();
        void v20[2] = v16;
        v20[3] = v18;
        v20[4] = v19;
        aBlock[4] = sub_24773D484;
        aBlock[5] = v20;
        aBlock[0] = (id)MEMORY[0x263EF8330];
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_24773BDEC;
        void aBlock[3] = &block_descriptor_31;
        uint64_t v21 = _Block_copy(aBlock);
        id v22 = v18;
        uint64_t v23 = v16;
        id v24 = v22;
        id v25 = v34;
        id v26 = v12;
        swift_release();
        objc_msgSend(v25, sel_installTapOnBus_bufferSize_format_block_, 0, 0x2000, v26, v21);
        _Block_release(v21);

        aBlock[0] = 0;
        if (objc_msgSend(v6, sel_startAndReturnError_, aBlock))
        {
          id v27 = aBlock[0];
        }
        else
        {
          id v33 = aBlock[0];
          sub_24774FE78();

          swift_willThrow();
        }
      }
      else
      {
        if (qword_26925F138 != -1) {
          swift_once();
        }
        uint64_t v28 = __swift_project_value_buffer(v1, (uint64_t)qword_26925F898);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v28, v1);
        uint64_t v29 = sub_247750138();
        os_log_type_t v30 = sub_247750C68();
        if (os_log_type_enabled(v29, v30))
        {
          id v31 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v31 = 0;
          _os_log_impl(&dword_24770E000, v29, v30, "AVS [AVS Audio Provider] unable to create converter", v31, 2u);
          MEMORY[0x24C55C7C0](v31, -1, -1);
          id v32 = v12;
          unsigned int v12 = v16;
        }
        else
        {
          id v32 = v29;
          uint64_t v29 = v16;
        }

        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      }
    }
    else
    {
    }
  }
  else
  {
    id v11 = aBlock[0];
    sub_24774FE78();

    swift_willThrow();
  }
}

void sub_24773B828(void *a1, void *a2, void *a3, void *a4)
{
  id v36 = a4;
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v7 = sub_247750158();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = 1;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = a1;
  swift_retain();
  id v13 = a1;
  objc_msgSend(a3, sel_sampleRate);
  if ((~*(void *)&v14 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v14 <= -1.0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v14 >= 4294967300.0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v35 = a2;
  unint64_t v15 = v14 * (unint64_t)objc_msgSend(v13, sel_frameLength);
  if ((v15 & 0xFFFFFFFF00000000) != 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v16 = objc_msgSend(v13, sel_format);
  objc_msgSend(v16, sel_sampleRate);
  double v18 = v17;

  if ((~*(void *)&v18 & 0x7FF0000000000000) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v18 <= -1.0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v18 >= 4294967300.0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (!v18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  unsigned int v19 = v18;
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93B0]), sel_initWithPCMFormat_frameCapacity_, a3, v15 / v19);
  if (!v20)
  {
    if (qword_26925F138 == -1)
    {
LABEL_14:
      uint64_t v30 = __swift_project_value_buffer(v7, (uint64_t)qword_26925F898);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
      id v31 = sub_247750138();
      os_log_type_t v32 = sub_247750C68();
      if (os_log_type_enabled(v31, v32))
      {
        id v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v33 = 0;
        _os_log_impl(&dword_24770E000, v31, v32, "AVS [AVS Audio Provider] unable to convert buffer to output format", v33, 2u);
        MEMORY[0x24C55C7C0](v33, -1, -1);
        swift_release();
      }
      else
      {

        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      swift_release();
      return;
    }
LABEL_29:
    swift_once();
    goto LABEL_14;
  }
  uint64_t v21 = v20;
  uint64_t v42 = sub_24773D4E0;
  uint64_t v43 = v12;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_24773DCEC;
  id v41 = &block_descriptor_40;
  id v22 = _Block_copy(aBlock);
  swift_retain();
  id v23 = v21;
  swift_release();
  aBlock[0] = 0;
  objc_msgSend(v36, sel_convertToBuffer_error_withInputFromBlock_, v23, aBlock, v22);
  _Block_release(v22);
  id v24 = aBlock[0];
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v26 = Strong;
    id v27 = objc_msgSend(v35, sel_hostTime);
    swift_beginAccess();
    sub_24773D4E8(v26 + 40, (uint64_t)aBlock);
    if (v41)
    {
      sub_247737240((uint64_t)aBlock, (uint64_t)v37);
      sub_247712A34((uint64_t)aBlock, &qword_26925F968);
      uint64_t v28 = v38;
      uint64_t v29 = v39;
      __swift_project_boxed_opaque_existential_1(v37, v38);
      (*(void (**)(id, id, uint64_t, uint64_t))(v29 + 8))(v23, v27, v28, v29);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    }
    else
    {
      sub_247712A34((uint64_t)aBlock, &qword_26925F968);
    }
    swift_release();
  }
  swift_release();

  swift_release();
}

void *sub_24773BD5C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = (unsigned char *)(a3 + 16);
  swift_beginAccess();
  if (*(unsigned char *)(a3 + 16) == 1)
  {
    *a2 = 0;
    swift_beginAccess();
    unsigned char *v7 = 0;
    id v8 = a4;
  }
  else
  {
    a4 = 0;
    *a2 = 1;
  }
  return a4;
}

void sub_24773BDEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(id, id))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, v6);
  swift_release();
}

uint64_t sub_24773BE70(uint64_t a1)
{
  v29[2] = a1;
  v33[5] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_24774FE88();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F730);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24774FEC8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  double v14 = (char *)v29 - v13;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F06E50], v1);
  swift_bridgeObjectRetain();
  sub_24774FEB8();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  id v15 = objc_allocWithZone(MEMORY[0x263EF9380]);
  uint64_t v16 = v29[3];
  id v17 = sub_24773CECC((uint64_t)v12, 3, 0);
  if (v16) {
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  double v18 = v17;
  uint64_t v19 = v29[1];
  id v20 = objc_msgSend(v17, sel_processingFormat);
  unint64_t v21 = (unint64_t)objc_msgSend(v18, sel_length);
  if ((v21 & 0x8000000000000000) == 0 && !HIDWORD(v21))
  {
    id v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93B0]), sel_initWithPCMFormat_frameCapacity_, v20, v21);

    if (v22)
    {
      v33[0] = 0;
      if (objc_msgSend(v18, sel_readIntoBuffer_error_, v22, v33))
      {
        id v23 = v33[0];
        uint64_t v24 = mach_absolute_time();
        swift_beginAccess();
        sub_24773D4E8(v19 + 40, (uint64_t)v33);
        if (v33[3])
        {
          sub_247737240((uint64_t)v33, (uint64_t)v30);
          sub_247712A34((uint64_t)v33, &qword_26925F968);
          uint64_t v25 = v31;
          uint64_t v26 = v32;
          __swift_project_boxed_opaque_existential_1(v30, v31);
          (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v26 + 8))(v22, v24, v25, v26);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
        }
        else
        {
          sub_247712A34((uint64_t)v33, &qword_26925F968);
        }
      }
      else
      {
        id v27 = v33[0];
        sub_24774FE78();

        swift_willThrow();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    __break(1u);
  }
  uint64_t result = sub_247750E78();
  __break(1u);
  return result;
}

uint64_t sub_24773C310()
{
  uint64_t v0 = sub_247750158();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v20 - v5;
  uint64_t result = sub_24774FE48();
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v21 = sub_247750B08();
    uint64_t v22 = v9;
    sub_247750DB8();
    if (*(void *)(v8 + 16) && (unint64_t v10 = sub_24773D0A0((uint64_t)v23), (v11 & 1) != 0))
    {
      sub_24773D138(*(void *)(v8 + 56) + 32 * v10, (uint64_t)&v24);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_24773D0E4((uint64_t)v23);
    if (*((void *)&v25 + 1))
    {
      uint64_t result = swift_dynamicCast();
      if (result)
      {
        if (v21)
        {
          if (v21 == 1)
          {
            if (qword_26925F138 != -1) {
              swift_once();
            }
            uint64_t v12 = __swift_project_value_buffer(v0, (uint64_t)qword_26925F898);
            swift_beginAccess();
            (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v12, v0);
            uint64_t v13 = sub_247750138();
            os_log_type_t v14 = sub_247750C88();
            if (os_log_type_enabled(v13, v14))
            {
              id v15 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v15 = 0;
              _os_log_impl(&dword_24770E000, v13, v14, "AVS - Stopped listening due to interruption", v15, 2u);
              MEMORY[0x24C55C7C0](v15, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
            return sub_24773A5A4();
          }
        }
        else
        {
          if (qword_26925F138 != -1) {
            swift_once();
          }
          uint64_t v16 = __swift_project_value_buffer(v0, (uint64_t)qword_26925F898);
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v16, v0);
          id v17 = sub_247750138();
          os_log_type_t v18 = sub_247750C88();
          if (os_log_type_enabled(v17, v18))
          {
            uint64_t v19 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v19 = 0;
            _os_log_impl(&dword_24770E000, v17, v18, "AVS - Interruption ended. Started listening again.", v19, 2u);
            MEMORY[0x24C55C7C0](v19, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
          return sub_24773A0CC();
        }
      }
    }
    else
    {
      return sub_247712A34((uint64_t)&v24, &qword_26925F770);
    }
  }
  return result;
}

void sub_24773C6E0(uint64_t a1)
{
  uint64_t v40 = sub_247750A58();
  uint64_t v37 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_247750A88();
  uint64_t v4 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v38 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_247750AA8();
  uint64_t v6 = *(void *)(v36 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v36);
  id v35 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v31 - v9;
  uint64_t v11 = sub_24774FE58();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  os_log_type_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v15 = sub_247750C68();
  uint64_t v16 = (id)AXLogAVS();
  if (v16)
  {
    id v17 = v16;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
    BOOL v18 = os_log_type_enabled(v17, v15);
    uint64_t v33 = v4;
    uint64_t v34 = v3;
    if (v18)
    {
      uint64_t v32 = v10;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      aBlock[0] = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v31 = v19 + 4;
      sub_24773CE84(&qword_26925FB08, MEMORY[0x263F06320]);
      uint64_t v21 = sub_247750FC8();
      uint64_t v42 = sub_247745AC4(v21, v22, aBlock);
      sub_247750CF8();
      unint64_t v10 = v32;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      _os_log_impl(&dword_24770E000, v17, v15, "AVS [AVS Audio Provider]  AudioSession reset: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C55C7C0](v20, -1, -1);
      MEMORY[0x24C55C7C0](v19, -1, -1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
    uint64_t v23 = v41;
    if (*(unsigned char *)(v41 + 80) == 1)
    {
      sub_24773A5A4();
      sub_24771F388(0, (unint64_t *)&qword_26925F350);
      long long v24 = (void *)sub_247750CA8();
      long long v25 = v35;
      sub_247750A98();
      MEMORY[0x24C55BAB0](v25, 0.5);
      uint64_t v41 = *(void *)(v6 + 8);
      uint64_t v26 = v36;
      ((void (*)(char *, uint64_t))v41)(v25, v36);
      aBlock[4] = (uint64_t)sub_24773CE0C;
      aBlock[5] = v23;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2477319C4;
      id aBlock[3] = (uint64_t)&block_descriptor_2;
      id v27 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      uint64_t v28 = v38;
      sub_247750A78();
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_24773CE84((unint64_t *)&qword_26925F358, MEMORY[0x263F8F030]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26925F360);
      sub_24773CE28();
      uint64_t v29 = v34;
      uint64_t v30 = v40;
      sub_247750D68();
      MEMORY[0x24C55BC90](v10, v28, v29, v27);
      _Block_release(v27);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v30);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v28, v39);
      ((void (*)(char *, uint64_t))v41)(v10, v26);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24773CCF0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v5 = sub_24774FE58();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24774FE38();
  swift_retain();
  a4(v8);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t type metadata accessor for AVSAudioProvider()
{
  return self;
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

unint64_t sub_24773CE28()
{
  unint64_t result = qword_26925F368;
  if (!qword_26925F368)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F360);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F368);
  }
  return result;
}

uint64_t sub_24773CE84(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_24773CECC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  v17[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v8 = (void *)sub_24774FEA8();
  v17[0] = 0;
  id v9 = objc_msgSend(v4, sel_initForReading_commonFormat_interleaved_error_, v8, a2, a3 & 1, v17);

  id v10 = v17[0];
  if (v9)
  {
    uint64_t v11 = sub_24774FEC8();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    id v13 = v10;
    v12(a1, v11);
  }
  else
  {
    id v14 = v17[0];
    sub_24774FE78();

    swift_willThrow();
    uint64_t v15 = sub_24774FEC8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
  }
  return v9;
}

unint64_t sub_24773D028(uint64_t a1, uint64_t a2)
{
  sub_247750FF8();
  sub_247750B48();
  uint64_t v4 = sub_247751018();

  return sub_24773D194(a1, a2, v4);
}

unint64_t sub_24773D0A0(uint64_t a1)
{
  uint64_t v2 = sub_247750D98();

  return sub_24773D278(a1, v2);
}

uint64_t sub_24773D0E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24773D138(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24773D194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_247750FD8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_247750FD8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24773D278(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24773D340(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C55BDA0](v9, a1);
      sub_24773D0E4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_24773D340(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_24773D39C()
{
  unint64_t result = qword_26925FB18;
  if (!qword_26925FB18)
  {
    sub_24771F388(255, &qword_26925FB10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FB18);
  }
  return result;
}

uint64_t sub_24773D404()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24773D43C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_24773D484(void *a1, void *a2)
{
  sub_24773B828(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_24773D490()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_24773D4A0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void *sub_24773D4E0(uint64_t a1, void *a2)
{
  return sub_24773BD5C(a1, a2, *(void *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_24773D4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24773D560(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_currentDevice);
  id v3 = objc_msgSend(v2, sel_userInterfaceIdiom);

  if (v3 == (id)6 || (unint64_t)v3 <= 1)
  {
    swift_bridgeObjectRetain();
    sub_247750B58();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t UUID.avsFormattedString.getter()
{
  sub_24774FF48();
  sub_247715DE0();
  sub_247750D38();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_247750B38();
  swift_bridgeObjectRelease();
  return v0;
}

AVAudioPCMBuffer_optional __swiftcall convertToFloat32PCM(buffer:)(AVAudioPCMBuffer buffer)
{
  Class isa = buffer.super.super.isa;
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_247750158();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9388]), sel_initWithCommonFormat_sampleRate_channels_interleaved_, 1, 1, 0, 16000.0);
  if (!v6)
  {
LABEL_23:
    BOOL v11 = 0;
    goto LABEL_24;
  }
  uint64_t v9 = v6;
  id v10 = [(objc_class *)isa format];
  BOOL v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9340]), sel_initFromFormat_toFormat_, v10, v9);

  if (!v11)
  {

    goto LABEL_24;
  }
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = 1;
  id v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = isa;
  swift_retain();
  BOOL v14 = isa;
  unint64_t v15 = v11;
  BOOL v11 = 0x26521F000;
  [v9 sampleRate];
  if ((~*(void *)&v16 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v16 <= -1.0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v16 >= 4294967300.0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v37 = v15;
  unint64_t v15 = v16 * (unint64_t)[(objc_class *)v14 frameLength];
  if ((v15 & 0xFFFFFFFF00000000) != 0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v17 = [(objc_class *)v14 format];
  objc_msgSend(v17, sel_sampleRate);
  double v19 = v18;

  if ((~*(void *)&v19 & 0x7FF0000000000000) == 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v19 <= -1.0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v19 >= 4294967300.0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (!v19)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  unsigned int v20 = v19;
  uint64_t v21 = (objc_class *)objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93B0]), sel_initWithPCMFormat_frameCapacity_, v9, v15 / v20);
  if (!v21)
  {
    __break(1u);
    goto LABEL_35;
  }
  BOOL v11 = v21;
  aBlock[4] = sub_24773D4E0;
  aBlock[5] = v13;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_24773DCEC;
  id aBlock[3] = &block_descriptor_3;
  unint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  unint64_t v15 = (unint64_t)v37;
  [v37 convertToBuffer:v11 error:aBlock withInputFromBlock:v22];
  _Block_release(v22);
  id v41 = aBlock[0];
  if (aBlock[0])
  {
    if (qword_26925F138 == -1)
    {
LABEL_14:
      uint64_t v23 = __swift_project_value_buffer(v2, (uint64_t)qword_26925F898);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v23, v2);
      long long v24 = sub_247750138();
      os_log_type_t v25 = sub_247750C68();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v35 = v12;
        uint64_t v36 = v3;
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v34 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 138412290;
        swift_beginAccess();
        id v27 = v41;
        if (v41)
        {
          id v38 = v41;
          v33[1] = &v39;
          v33[2] = v26 + 12;
          id v28 = v41;
        }
        else
        {
          id v38 = 0;
        }
        sub_247750CF8();
        uint64_t v31 = v34;
        void *v34 = v27;
        _os_log_impl(&dword_24770E000, v24, v25, "Error converting buffer %@", v26, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
        swift_arrayDestroy();
        MEMORY[0x24C55C7C0](v31, -1, -1);
        MEMORY[0x24C55C7C0](v26, -1, -1);
        uint64_t v29 = v9;
        uint64_t v30 = v9;
        uint64_t v3 = v36;
        uint64_t v9 = v37;
      }
      else
      {
        uint64_t v29 = v24;
        uint64_t v30 = v11;
        BOOL v11 = v15;
        long long v24 = v15;
      }

      swift_release();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      id v32 = v41;
      swift_release();

      goto LABEL_23;
    }
LABEL_33:
    swift_once();
    goto LABEL_14;
  }

  swift_release();
  swift_release();

LABEL_24:
  uint64_t v21 = (objc_class *)v11;
LABEL_35:
  result.value.super._impl = v7;
  result.value.super.super.Class isa = v21;
  result.is_nil = v8;
  return result;
}

uint64_t sub_24773DCDC()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

id sub_24773DCEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = (void *)v5(a2, a3);
  swift_release();

  return v6;
}

void sub_24773DD58()
{
  uint64_t v0 = (void *)sub_247750AF8();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  qword_269262028 = (uint64_t)v1;
}

uint64_t sub_24773DDC8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
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

uint64_t sub_24773DE20()
{
  type metadata accessor for AXShortcutsProvider();
  uint64_t result = swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(result + 16) = MEMORY[0x263F8EE78];
  *(void *)(result + 24) = v1;
  qword_269262030 = result;
  return result;
}

uint64_t sub_24773DE58()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for AXShortcutsProvider()
{
  return self;
}

uint64_t AvailableShortcutAction.init(id:name:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = *a4;
  uint64_t v10 = a4[1];
  char v11 = *((unsigned char *)a4 + 16);
  sub_24774FF58();
  uint64_t v12 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(a5, a1, v12);
  uint64_t result = type metadata accessor for AvailableShortcutAction();
  BOOL v14 = (void *)(a5 + *(int *)(result + 20));
  *BOOL v14 = a2;
  v14[1] = a3;
  uint64_t v15 = a5 + *(int *)(result + 24);
  *(void *)uint64_t v15 = v9;
  *(void *)(v15 + 8) = v10;
  *(unsigned char *)(v15 + 16) = v11;
  return result;
}

uint64_t type metadata accessor for AvailableShortcutAction()
{
  uint64_t result = qword_26925FBC0;
  if (!qword_26925FBC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24773DFBC(char a1)
{
  return *(void *)&aSirishoraxshor[8 * a1];
}

uint64_t sub_24773DFDC()
{
  return 1;
}

uint64_t sub_24773DFE8()
{
  return sub_247751008();
}

uint64_t sub_24773E018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247740B78(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_24773E044(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24773E050(uint64_t a1)
{
  unint64_t v2 = sub_24773F5F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24773E08C(uint64_t a1)
{
  unint64_t v2 = sub_24773F5F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24773E0D0()
{
  return sub_24773DFBC(*v0);
}

uint64_t sub_24773E0D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247740968(a1, a2);
  *a3 = result;
  return result;
}

void sub_24773E100(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24773E10C(uint64_t a1)
{
  unint64_t v2 = sub_24773F54C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24773E148(uint64_t a1)
{
  unint64_t v2 = sub_24773F54C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24773E188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247740AD8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24773E1B4(uint64_t a1)
{
  unint64_t v2 = sub_24773F5A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24773E1F0(uint64_t a1)
{
  unint64_t v2 = sub_24773F5A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24773E22C()
{
  return sub_247751018();
}

uint64_t sub_24773E270()
{
  return sub_247751018();
}

uint64_t sub_24773E2B0(uint64_t a1)
{
  unint64_t v2 = sub_24773F648();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24773E2EC(uint64_t a1)
{
  unint64_t v2 = sub_24773F648();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AvailableShortcutAction.AvailableShortcutActionType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB30);
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v26 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB38);
  uint64_t v24 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  MEMORY[0x270FA5388](v5);
  char v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB40);
  uint64_t v23 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB48);
  uint64_t v31 = *(void *)(v11 - 8);
  uint64_t v32 = v11;
  MEMORY[0x270FA5388](v11);
  id v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v1[1];
  uint64_t v29 = *v1;
  uint64_t v30 = v14;
  int v15 = *((unsigned __int8 *)v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24773F54C();
  sub_247751038();
  if (v15)
  {
    if (v15 == 1)
    {
      char v34 = 1;
      sub_24773F5F4();
      uint64_t v16 = v32;
      sub_247750F58();
      uint64_t v17 = v25;
      sub_247750F88();
      double v18 = *(void (**)(char *, uint64_t))(v24 + 8);
      double v19 = v7;
    }
    else
    {
      char v35 = 2;
      sub_24773F5A0();
      unsigned int v20 = v26;
      uint64_t v16 = v32;
      sub_247750F58();
      uint64_t v17 = v28;
      sub_247750F88();
      double v18 = *(void (**)(char *, uint64_t))(v27 + 8);
      double v19 = v20;
    }
    v18(v19, v17);
  }
  else
  {
    char v33 = 0;
    sub_24773F648();
    uint64_t v16 = v32;
    sub_247750F58();
    sub_247750F88();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v13, v16);
}

uint64_t AvailableShortcutAction.AvailableShortcutActionType.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  char v48 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB70);
  uint64_t v43 = *(void *)(v3 - 8);
  uint64_t v44 = v3;
  MEMORY[0x270FA5388](v3);
  id v49 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB78);
  uint64_t v6 = *(char **)(v5 - 8);
  uint64_t v46 = v5;
  char v47 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB80);
  uint64_t v45 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB88);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  int v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v50 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_24773F54C();
  uint64_t v17 = v51;
  sub_247751028();
  if (v17) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  }
  uint64_t v42 = 0;
  double v18 = v49;
  uint64_t v51 = v13;
  uint64_t v19 = sub_247750F48();
  if (*(void *)(v19 + 16) != 1)
  {
    uint64_t v22 = sub_247750E18();
    swift_allocError();
    uint64_t v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB90);
    *uint64_t v24 = &type metadata for AvailableShortcutAction.AvailableShortcutActionType;
    sub_247750EE8();
    sub_247750E08();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v22 - 8) + 104))(v24, *MEMORY[0x263F8DCB0], v22);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v12);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  }
  int v20 = *(unsigned __int8 *)(v19 + 32);
  if (!*(unsigned char *)(v19 + 32))
  {
    id v49 = (char *)v19;
    char v52 = 0;
    sub_24773F648();
    uint64_t v25 = v11;
    uint64_t v26 = v42;
    sub_247750ED8();
    if (v26) {
      goto LABEL_11;
    }
    uint64_t v33 = sub_247750F18();
    uint64_t v32 = v34;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v25, v9);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v12);
LABEL_15:
    uint64_t v35 = (uint64_t)v50;
    goto LABEL_17;
  }
  if (v20 == 1)
  {
    char v53 = 1;
    sub_24773F5F4();
    uint64_t v21 = v42;
    sub_247750ED8();
    if (v21) {
      goto LABEL_11;
    }
    uint64_t v29 = v46;
    uint64_t v30 = sub_247750F18();
    uint64_t v32 = v31;
    uint64_t v33 = v30;
    (*((void (**)(char *, uint64_t))v47 + 1))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v12);
    goto LABEL_15;
  }
  char v54 = 2;
  sub_24773F5A0();
  uint64_t v27 = v42;
  sub_247750ED8();
  if (v27)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v12);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  }
  char v47 = v15;
  uint64_t v36 = v44;
  uint64_t v37 = sub_247750F18();
  uint64_t v38 = v51;
  uint64_t v32 = v39;
  uint64_t v40 = *(void (**)(char *, uint64_t))(v43 + 8);
  uint64_t v46 = v37;
  v40(v18, v36);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v47, v12);
  uint64_t v35 = (uint64_t)v50;
  uint64_t v33 = v46;
LABEL_17:
  id v41 = v48;
  *char v48 = v33;
  v41[1] = v32;
  *((unsigned char *)v41 + 16) = v20;
  return __swift_destroy_boxed_opaque_existential_1(v35);
}

uint64_t sub_24773ED60@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return AvailableShortcutAction.AvailableShortcutActionType.init(from:)(a1, a2);
}

uint64_t sub_24773ED78(void *a1)
{
  return AvailableShortcutAction.AvailableShortcutActionType.encode(to:)(a1);
}

uint64_t sub_24773ED90(char a1)
{
  return qword_247753008[a1];
}

uint64_t sub_24773EDB0()
{
  return sub_24773ED90(*v0);
}

uint64_t sub_24773EDB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_247740BE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24773EDE0(uint64_t a1)
{
  unint64_t v2 = sub_24773F69C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24773EE1C(uint64_t a1)
{
  unint64_t v2 = sub_24773F69C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AvailableShortcutAction.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FB98);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24773F69C();
  sub_247751038();
  LOBYTE(v14) = 0;
  sub_24774FF68();
  sub_24773F744(&qword_26925F6A8);
  sub_247750FA8();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for AvailableShortcutAction();
    LOBYTE(v14) = 1;
    sub_247750F88();
    uint64_t v10 = (long long *)(v3 + *(int *)(v9 + 24));
    char v11 = *((unsigned char *)v10 + 16);
    long long v14 = *v10;
    char v15 = v11;
    v13[15] = 2;
    sub_24773F6F0();
    sub_247750FA8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t AvailableShortcutAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = sub_24774FF68();
  uint64_t v25 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FBB0);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for AvailableShortcutAction();
  MEMORY[0x270FA5388](v26);
  char v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24774FF58();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24773F69C();
  sub_247751028();
  if (v2)
  {
    uint64_t v13 = v25;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v11, v4);
  }
  else
  {
    uint64_t v12 = v23;
    LOBYTE(v27) = 0;
    sub_24773F744(&qword_26925F6C8);
    sub_247750F38();
    (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v11, v6, v4);
    LOBYTE(v27) = 1;
    uint64_t v14 = sub_247750F18();
    uint64_t v15 = v26;
    uint64_t v16 = (uint64_t *)&v11[*(int *)(v26 + 20)];
    uint64_t *v16 = v14;
    v16[1] = v17;
    char v29 = 2;
    sub_24773F788();
    sub_247750F38();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v24);
    char v18 = v28;
    uint64_t v19 = &v11[*(int *)(v15 + 24)];
    *(_OWORD *)uint64_t v19 = v27;
    v19[16] = v18;
    sub_24773F7DC((uint64_t)v11, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_24773F840((uint64_t)v11);
  }
}

uint64_t sub_24773F3FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AvailableShortcutAction.init(from:)(a1, a2);
}

uint64_t sub_24773F414(void *a1)
{
  return AvailableShortcutAction.encode(to:)(a1);
}

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV0deF4TypeO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v5 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  if (!*(unsigned char *)(a1 + 16))
  {
    if (!*(unsigned char *)(a2 + 16))
    {
      if (v2 != v5 || v3 != v6) {
        goto LABEL_23;
      }
      LOBYTE(v7) = 0;
      LOBYTE(v4) = 0;
      goto LABEL_17;
    }
LABEL_24:
    char v10 = 0;
    goto LABEL_25;
  }
  if (v4 != 1)
  {
    if (v7 == 2)
    {
      if (v2 == v5 && v3 == v6)
      {
        char v10 = 1;
        LOBYTE(v7) = 2;
        LOBYTE(v4) = 2;
        goto LABEL_25;
      }
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (v7 != 1) {
    goto LABEL_24;
  }
  if (v2 != v5 || v3 != v6)
  {
LABEL_23:
    char v10 = sub_247750FD8();
    LOBYTE(v7) = v4;
    goto LABEL_25;
  }
  LOBYTE(v7) = 1;
  LOBYTE(v4) = 1;
LABEL_17:
  char v10 = 1;
LABEL_25:
  sub_24773F9A4(v5, v6, v7);
  sub_24773F9A4(v2, v3, v4);
  sub_24771E294(v2, v3, v4);
  sub_24771E294(v5, v6, v7);
  return v10 & 1;
}

unint64_t sub_24773F54C()
{
  unint64_t result = qword_26925FB50;
  if (!qword_26925FB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FB50);
  }
  return result;
}

unint64_t sub_24773F5A0()
{
  unint64_t result = qword_26925FB58;
  if (!qword_26925FB58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FB58);
  }
  return result;
}

unint64_t sub_24773F5F4()
{
  unint64_t result = qword_26925FB60;
  if (!qword_26925FB60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FB60);
  }
  return result;
}

unint64_t sub_24773F648()
{
  unint64_t result = qword_26925FB68;
  if (!qword_26925FB68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FB68);
  }
  return result;
}

unint64_t sub_24773F69C()
{
  unint64_t result = qword_26925FBA0;
  if (!qword_26925FBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FBA0);
  }
  return result;
}

unint64_t sub_24773F6F0()
{
  unint64_t result = qword_26925FBA8;
  if (!qword_26925FBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FBA8);
  }
  return result;
}

uint64_t sub_24773F744(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24774FF68();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24773F788()
{
  unint64_t result = qword_26925FBB8;
  if (!qword_26925FBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FBB8);
  }
  return result;
}

uint64_t sub_24773F7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24773F840(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AvailableShortcutAction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for AvailableShortcutAction(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24774FF68();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    char v10 = (uint64_t *)((char *)a1 + v8);
    char v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    uint64_t v15 = *(uint64_t *)((char *)a2 + v9);
    uint64_t v16 = *((void *)v14 + 1);
    unsigned __int8 v17 = v14[16];
    swift_bridgeObjectRetain();
    sub_24773F9A4(v15, v16, v17);
    *(void *)uint64_t v13 = v15;
    *((void *)v13 + 1) = v16;
    unsigned char v13[16] = v17;
  }
  return a1;
}

uint64_t sub_24773F9A4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for AvailableShortcutAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = *(void *)v5;
  uint64_t v7 = *(void *)(v5 + 8);
  unsigned __int8 v8 = *(unsigned char *)(v5 + 16);

  return sub_24771E294(v6, v7, v8);
}

uint64_t initializeWithCopy for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  char v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = *(void *)(a2 + v8);
  uint64_t v15 = *(void *)(a2 + v8 + 8);
  unsigned __int8 v16 = *(unsigned char *)(v13 + 16);
  swift_bridgeObjectRetain();
  sub_24773F9A4(v14, v15, v16);
  *(void *)uint64_t v12 = v14;
  *(void *)(v12 + 8) = v15;
  *(unsigned char *)(v12 + 16) = v16;
  return a1;
}

uint64_t assignWithCopy for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *(void *)(v12 + 8);
  unsigned __int8 v15 = *(unsigned char *)(v12 + 16);
  sub_24773F9A4(*(void *)v12, v14, v15);
  uint64_t v16 = *(void *)v11;
  uint64_t v17 = *(void *)(v11 + 8);
  *(void *)uint64_t v11 = v13;
  *(void *)(v11 + 8) = v14;
  unsigned __int8 v18 = *(unsigned char *)(v11 + 16);
  *(unsigned char *)(v11 + 16) = v15;
  sub_24771E294(v16, v17, v18);
  return a1;
}

uint64_t initializeWithTake for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  return a1;
}

uint64_t assignWithTake for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24774FF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  char v15 = *(unsigned char *)(v14 + 16);
  uint64_t v16 = *(void *)v13;
  uint64_t v17 = *(void *)(v13 + 8);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  unsigned __int8 v18 = *(unsigned char *)(v13 + 16);
  *(unsigned char *)(v13 + 16) = v15;
  sub_24771E294(v16, v17, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24773FD38);
}

uint64_t sub_24773FD38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24774FF68();
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

uint64_t storeEnumTagSinglePayload for AvailableShortcutAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24773FE10);
}

uint64_t sub_24773FE10(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24774FF68();
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

uint64_t sub_24773FED0()
{
  uint64_t result = sub_24774FF68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for AvailableShortcutAction.AvailableShortcutActionType(uint64_t a1)
{
  return sub_24771E294(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV27AvailableShortcutActionTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24773F9A4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AvailableShortcutAction.AvailableShortcutActionType(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24773F9A4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24771E294(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AvailableShortcutAction.AvailableShortcutActionType(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24771E294(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AvailableShortcutAction.AvailableShortcutActionType(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AvailableShortcutAction.AvailableShortcutActionType(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_247740110(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_247740118(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.CodingKeys()
{
  return &type metadata for AvailableShortcutAction.CodingKeys;
}

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s22AdaptiveVoiceShortcuts23AvailableShortcutActionV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x2477402A4);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType.CodingKeys()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType.CodingKeys;
}

uint64_t sub_2477402E8()
{
  return 0;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType.SiriShortcutCodingKeys()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriShortcutCodingKeys;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType.AxShortcutCodingKeys()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType.AxShortcutCodingKeys;
}

uint64_t _s22AdaptiveVoiceShortcuts23AvailableShortcutActionV27AvailableShortcutActionTypeO22SiriShortcutCodingKeysOwet_0(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s22AdaptiveVoiceShortcuts23AvailableShortcutActionV27AvailableShortcutActionTypeO22SiriShortcutCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2477403FCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for AvailableShortcutAction.AvailableShortcutActionType.SiriRequestCodingKeys()
{
  return &type metadata for AvailableShortcutAction.AvailableShortcutActionType.SiriRequestCodingKeys;
}

unint64_t sub_247740438()
{
  unint64_t result = qword_26925FBD0;
  if (!qword_26925FBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FBD0);
  }
  return result;
}

unint64_t sub_247740490()
{
  unint64_t result = qword_26925FBD8;
  if (!qword_26925FBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FBD8);
  }
  return result;
}

unint64_t sub_2477404E8()
{
  unint64_t result = qword_26925FBE0;
  if (!qword_26925FBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FBE0);
  }
  return result;
}

unint64_t sub_247740540()
{
  unint64_t result = qword_26925FBE8;
  if (!qword_26925FBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FBE8);
  }
  return result;
}

unint64_t sub_247740598()
{
  unint64_t result = qword_26925FBF0;
  if (!qword_26925FBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FBF0);
  }
  return result;
}

unint64_t sub_2477405F0()
{
  unint64_t result = qword_26925FBF8;
  if (!qword_26925FBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FBF8);
  }
  return result;
}

unint64_t sub_247740648()
{
  unint64_t result = qword_26925FC00;
  if (!qword_26925FC00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FC00);
  }
  return result;
}

unint64_t sub_2477406A0()
{
  unint64_t result = qword_26925FC08;
  if (!qword_26925FC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FC08);
  }
  return result;
}

unint64_t sub_2477406F8()
{
  unint64_t result = qword_26925FC10;
  if (!qword_26925FC10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FC10);
  }
  return result;
}

unint64_t sub_247740750()
{
  unint64_t result = qword_26925FC18;
  if (!qword_26925FC18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FC18);
  }
  return result;
}

unint64_t sub_2477407A8()
{
  unint64_t result = qword_26925FC20;
  if (!qword_26925FC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FC20);
  }
  return result;
}

unint64_t sub_247740800()
{
  unint64_t result = qword_26925FC28;
  if (!qword_26925FC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FC28);
  }
  return result;
}

unint64_t sub_247740858()
{
  unint64_t result = qword_26925FC30;
  if (!qword_26925FC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FC30);
  }
  return result;
}

unint64_t sub_2477408B0()
{
  unint64_t result = qword_26925FC38;
  if (!qword_26925FC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FC38);
  }
  return result;
}

unint64_t sub_247740908()
{
  unint64_t result = qword_26925FC40;
  if (!qword_26925FC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FC40);
  }
  return result;
}

uint64_t sub_24774095C()
{
  return 25705;
}

uint64_t sub_247740968(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x726F685369726973 && a2 == 0xEC00000074756374;
  if (v3 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6374726F68537861 && a2 == 0xEA00000000007475 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7571655269726973 && a2 == 0xEB00000000747365)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_247750FD8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_247740AD8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247750FD8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247740B60()
{
  return 0x74736575716572;
}

uint64_t sub_247740B78(uint64_t a1, uint64_t a2)
{
  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_247750FD8();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247740BE8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_247750FD8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_247740D0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_247740EE0(a1, a2, a3, (uint64_t)&unk_26FBBBA38, &qword_26925FD10);
}

uint64_t sub_247740D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_247750C38();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_247750C28();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_247712A34(a1, &qword_26925F550);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247750BE8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_247740EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9 = sub_247750C38();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) != 1)
  {
    sub_247750C28();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_247712A34(a1, &qword_26925F550);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_247750BE8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  return swift_task_create();
}

id sub_247741090()
{
  id result = objc_msgSend(objc_allocWithZone((Class)AVSTriggerController), sel_init);
  qword_26925FC48 = (uint64_t)result;
  return result;
}

void __swiftcall AVSTriggerController.init()(AVSTriggerController *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  objc_msgSend(v1, sel_init);
}

uint64_t AVSTriggerController.displayAlertHandler.getter()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR___AVSTriggerController_displayAlertHandler);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_247716088(*v1);
  return v2;
}

uint64_t sub_247741234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  char v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    uint64_t v5 = sub_247750B08();
    uint64_t v7 = v6;
    if (v3)
    {
LABEL_3:
      uint64_t v8 = sub_247750B08();
      uint64_t v3 = v9;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  swift_retain();
  v4(v5, v7, v8, v3);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void sub_24774138C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    uint64_t v7 = (void *)sub_247750AF8();
    if (a4)
    {
LABEL_3:
      uint64_t v8 = sub_247750AF8();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  id v9 = (id)v8;
  (*(void (**)(uint64_t, void *))(a5 + 16))(a5, v7);
}

uint64_t AVSTriggerController.displayAlertHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR___AVSTriggerController_displayAlertHandler);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  return sub_24771614C(v6);
}

void *sub_247741484@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_displayAlertHandler);
  if (result)
  {
    char v4 = result;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    id result = (void *)swift_allocObject();
    result[2] = sub_247747B8C;
    result[3] = v5;
    uint64_t v6 = sub_2477476F8;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a2 = v6;
  a2[1] = result;
  return result;
}

void sub_24774152C(uint64_t a1, void **a2)
{
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = *a2;
    v7[4] = sub_2477476B8;
    v7[5] = v5;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    void v7[2] = sub_247741234;
    v7[3] = &block_descriptor_32;
    uint64_t v3 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v6 = *a2;
  }
  objc_msgSend(v6, sel_setDisplayAlertHandler_, v3);
  _Block_release(v3);
}

void *AVSTriggerController.spotter.getter()
{
  id v1 = (void **)(v0 + OBJC_IVAR___AVSTriggerController_spotter);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void AVSTriggerController.spotter.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___AVSTriggerController_spotter);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*AVSTriggerController.spotter.modify())()
{
  return j__swift_endAccess;
}

uint64_t static AVSTriggerController.sharedInstance()()
{
  if (qword_26925F150 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26925FC48;
  uint64_t v1 = swift_dynamicCastUnknownClass();
  if (v1) {
    id v2 = v0;
  }
  return v1;
}

char *AVSTriggerController.init()()
{
  uint64_t v1 = &v0[OBJC_IVAR___AVSTriggerController_displayAlertHandler];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR___AVSTriggerController_spotter] = 0;
  *(void *)&v0[OBJC_IVAR___AVSTriggerController_enrollmentReceiver] = 0;
  id v2 = &v0[OBJC_IVAR___AVSTriggerController_avsBundleDonorID];
  *(void *)id v2 = 0xD000000000000030;
  *((void *)v2 + 1) = 0x8000000247754640;
  type metadata accessor for AVSAudioProvider();
  swift_allocObject();
  id v3 = v0;
  *(void *)&v3[OBJC_IVAR___AVSTriggerController_audioProvider] = sub_247738F08();

  v10.receiver = v3;
  v10.super_class = (Class)AVSTriggerController;
  uint64_t v4 = (char *)objc_msgSendSuper2(&v10, sel_init);
  AXPIBridgePerformWarm();
  uint64_t v5 = *(void *)&v4[OBJC_IVAR___AVSTriggerController_audioProvider];
  v9[3] = type metadata accessor for AVSTriggerController(v6);
  void v9[4] = &off_26FBBB838;
  v9[0] = v4;
  sub_2477338D8((uint64_t)v9, (uint64_t)v8);
  swift_beginAccess();
  swift_retain();
  sub_24774192C((uint64_t)v8, v5 + 40);
  swift_endAccess();
  swift_release();
  return v4;
}

uint64_t type metadata accessor for AVSTriggerController(uint64_t a1)
{
  return sub_24771F388(a1, &qword_26925FC90);
}

uint64_t sub_24774192C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

Swift::Void __swiftcall AVSTriggerController.startListening()()
{
  uint64_t v0 = sub_247750A58();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_247750A88();
  uint64_t v4 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_247750A68();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  objc_super v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24771F388(0, (unint64_t *)&qword_26925F350);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F080], v7);
  uint64_t v11 = (void *)sub_247750CC8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v17;
  *(void *)(v12 + 16) = v17;
  aBlock[4] = sub_247741FCC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2477319C4;
  id aBlock[3] = &block_descriptor_4;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = v13;
  sub_247750A78();
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_247741FEC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F360);
  sub_24773CE28();
  sub_247750D68();
  MEMORY[0x24C55BCB0](0, v6, v3, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v18);
  swift_release();
}

uint64_t sub_247741D00(void *a1)
{
  uint64_t v2 = sub_247750A58();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_247750A88();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _sSo8AVSStoreC22AdaptiveVoiceShortcutsE28retriveDataForAllEnrollmentsSay0C7Actions018VASingleEnrollmentF0VGvgZ_0();
  sub_24771F388(0, (unint64_t *)&qword_26925F350);
  uint64_t v11 = (void *)sub_247750CA8();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = v10;
  aBlock[4] = sub_247747ACC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2477319C4;
  id aBlock[3] = &block_descriptor_61;
  uint64_t v13 = _Block_copy(aBlock);
  id v14 = a1;
  swift_release();
  sub_247750A78();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_247741FEC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F360);
  sub_24773CE28();
  sub_247750D68();
  MEMORY[0x24C55BCB0](0, v9, v5, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_247741F94()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247741FCC()
{
  return sub_247741D00(*(void **)(v0 + 16));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

unint64_t sub_247741FEC()
{
  unint64_t result = qword_26925F358;
  if (!qword_26925F358)
  {
    sub_247750A58();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925F358);
  }
  return result;
}

uint64_t sub_247742044(uint64_t a1, uint64_t a2)
{
  uint64_t v57 = a2;
  uint64_t v3 = sub_247750158();
  uint64_t v58 = *(void *)(v3 - 8);
  uint64_t v59 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v50 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v50 - v10;
  uint64_t v12 = sub_247750018();
  uint64_t v55 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24774FF98();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (void **)(a1 + OBJC_IVAR___AVSTriggerController_spotter);
  swift_beginAccess();
  if (*v19)
  {
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v20 = v59;
    uint64_t v21 = __swift_project_value_buffer(v59, (uint64_t)qword_26925F898);
    swift_beginAccess();
    uint64_t v22 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v9, v21, v20);
    uint64_t v23 = sub_247750138();
    os_log_type_t v24 = sub_247750C68();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_24770E000, v23, v24, "Spotter already exists, not proceeding", v25, 2u);
      MEMORY[0x24C55C7C0](v25, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v9, v20);
  }
  else
  {
    uint64_t v51 = v11;
    uint64_t v52 = v12;
    char v53 = v14;
    id v56 = v6;
    (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F84D58], v15);
    uint64_t v27 = sub_247750088();
    uint64_t v54 = a1;
    char v28 = (void *)v27;
    uint64_t v30 = v29;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    uint64_t v31 = *v19;
    *uint64_t v19 = v28;
    id v32 = v28;

    uint64_t v33 = OBJC_IVAR___AVSTriggerController_enrollmentReceiver;
    *(void *)(a1 + OBJC_IVAR___AVSTriggerController_enrollmentReceiver) = v30;
    swift_retain();
    swift_release();
    sub_24774FFE8();
    uint64_t v34 = v58;
    sub_24774FFC8();
    uint64_t v35 = v32;
    uint64_t v36 = v59;
    id v50 = v35;
    uint64_t v57 = v30;
    sub_24774FFF8();
    v60[0] = (void *)_sSo8AVSStoreC22AdaptiveVoiceShortcutsE29shortcutsFormattedIdentifiersSaySSGvgZ_0();
    swift_bridgeObjectRetain();
    sub_24774611C((uint64_t *)v60);
    swift_bridgeObjectRelease();
    uint64_t v37 = v60[0];
    v60[0] = (void *)sub_247750008();
    swift_bridgeObjectRetain();
    sub_24774611C((uint64_t *)v60);
    uint64_t v38 = v52;
    swift_bridgeObjectRelease();
    char v39 = sub_2477428E0(v37, v60[0]);
    swift_release();
    swift_release();
    if (v39)
    {
      uint64_t v40 = v53;
      id v41 = v50;
      sub_24774FFB8();
      swift_release();

      swift_release();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v38);
      return sub_24773A0CC();
    }
    else
    {
      if (qword_26925F138 != -1) {
        swift_once();
      }
      uint64_t v42 = __swift_project_value_buffer(v36, (uint64_t)qword_26925F898);
      swift_beginAccess();
      uint64_t v43 = v51;
      (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v51, v42, v36);
      uint64_t v44 = sub_247750138();
      os_log_type_t v45 = sub_247750C68();
      BOOL v46 = os_log_type_enabled(v44, v45);
      uint64_t v47 = v55;
      if (v46)
      {
        char v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v48 = 0;
        _os_log_impl(&dword_24770E000, v44, v45, "Unexpected state. AVSStore identifiers do not match runtime keywords. Enrollments could be stale.", v48, 2u);
        MEMORY[0x24C55C7C0](v48, -1, -1);
      }
      swift_release();

      (*(void (**)(char *, uint64_t))(v34 + 8))(v43, v36);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v53, v38);
      id v49 = *v19;
      *uint64_t v19 = 0;

      *(void *)(v54 + v33) = 0;
      return swift_release();
    }
  }
}

uint64_t sub_2477428E0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = sub_247750FD8(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (sub_247750FD8() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

Swift::Void __swiftcall AVSTriggerController.stopListening()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F550);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247750C18();
  uint64_t v3 = sub_247750C38();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 0, 1, v3);
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  BOOL v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v4;
  sub_247740D34((uint64_t)v2, (uint64_t)&unk_26925FC80, (uint64_t)v5);
  swift_release();
}

uint64_t sub_247742B0C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_247742B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[24] = a4;
  uint64_t v5 = sub_247750158();
  v4[25] = v5;
  v4[26] = *(void *)(v5 - 8);
  v4[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_247742C04, 0, 0);
}

uint64_t sub_247742C04()
{
  uint64_t v1 = v0[24] + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C55C870](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = (void **)(v2 + OBJC_IVAR___AVSTriggerController_spotter);
    swift_beginAccess();
    uint64_t v5 = *v4;
    v0[28] = *v4;
    if (v5)
    {
      v5;

      uint64_t v19 = (uint64_t (*)(void))((int)*MEMORY[0x263F84D60] + MEMORY[0x263F84D60]);
      uint64_t v6 = (void *)swift_task_alloc();
      v0[29] = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_247742E58;
      return v19();
    }
  }
  uint64_t v8 = v0[24] + 16;
  swift_beginAccess();
  uint64_t v9 = MEMORY[0x24C55C870](v8);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    swift_retain();

    sub_24773A5A4();
    swift_release();
  }
  uint64_t v11 = v0[24] + 16;
  swift_beginAccess();
  uint64_t v12 = MEMORY[0x24C55C870](v11);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    id v14 = (void **)(v12 + OBJC_IVAR___AVSTriggerController_spotter);
    swift_beginAccess();
    uint64_t v15 = *v14;
    *id v14 = 0;
  }
  uint64_t v16 = v0[24] + 16;
  swift_beginAccess();
  uint64_t v17 = (char *)MEMORY[0x24C55C870](v16);
  if (v17)
  {
    *(void *)&v17[OBJC_IVAR___AVSTriggerController_enrollmentReceiver] = 0;

    swift_release();
  }
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_247742E58()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_2477430D8;
  }
  else
  {

    uint64_t v3 = sub_247742F74;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_247742F74()
{
  uint64_t v1 = *(void *)(v0 + 192) + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C55C870](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    swift_retain();

    sub_24773A5A4();
    swift_release();
  }
  uint64_t v4 = *(void *)(v0 + 192) + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x24C55C870](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = (void **)(v5 + OBJC_IVAR___AVSTriggerController_spotter);
    swift_beginAccess();
    uint64_t v8 = *v7;
    void *v7 = 0;
  }
  uint64_t v9 = *(void *)(v0 + 192) + 16;
  swift_beginAccess();
  uint64_t v10 = (char *)MEMORY[0x24C55C870](v9);
  if (v10)
  {
    *(void *)&v10[OBJC_IVAR___AVSTriggerController_enrollmentReceiver] = 0;

    swift_release();
  }
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_2477430D8()
{
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_26925F898);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_247750138();
  os_log_type_t v9 = sub_247750C68();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void **)(v0 + 240);
  if (v10)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v11;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 184) = v15;
    sub_247750CF8();
    void *v13 = v15;

    _os_log_impl(&dword_24770E000, v8, v9, "Error stopping spotter %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F728);
    swift_arrayDestroy();
    MEMORY[0x24C55C7C0](v13, -1, -1);
    MEMORY[0x24C55C7C0](v12, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(*(void *)(v0 + 208) + 8))(*(void *)(v0 + 216), *(void *)(v0 + 200));
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_24774333C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24771FED8;
  return sub_247742B44(a1, v4, v5, v6);
}

Swift::Void __swiftcall AVSTriggerController.pauseListening()()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___AVSTriggerController_audioProvider);
  if (*(unsigned char *)(v1 + 80) == 1)
  {
    objc_msgSend(*(id *)(v1 + 16), sel_stop);
    *(unsigned char *)(v1 + 80) = 0;
  }
}

Swift::Void __swiftcall AVSTriggerController.resumeListening()()
{
}

Swift::Void __swiftcall AVSTriggerController.handleAudioBufferInput(_:time:)(AVAudioPCMBuffer_optional _, Swift::UInt64 time)
{
  Class isa = _.value.super.super.isa;
  uint64_t v3 = sub_247750158();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (isa)
  {
    uint64_t v12 = isa;
    sub_247743858();
    id v7 = v12;
  }
  else
  {
    if (qword_26925F138 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_26925F898);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
    uint64_t v9 = sub_247750138();
    os_log_type_t v10 = sub_247750C68();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_24770E000, v9, v10, "Failed to get audio buffer", v11, 2u);
      MEMORY[0x24C55C7C0](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

void sub_247743858()
{
  uint64_t v1 = sub_247750158();
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = (id *)(v0 + OBJC_IVAR___AVSTriggerController_spotter);
  swift_beginAccess();
  if (*v2)
  {
    id v3 = *v2;
    sub_24774FFD8();
  }
}

void sub_247743C38()
{
}

uint64_t AVSTriggerController.keywordSpotterDidDetectKeyword(event:)(void *a1)
{
  uint64_t v97 = sub_247750A58();
  uint64_t v96 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v94 = (char *)&v92 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_247750A88();
  uint64_t v93 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  id v92 = (char *)&v92 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = type metadata accessor for AVSDebugEvent();
  MEMORY[0x270FA5388](v98);
  unint64_t v99 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v116 = (char *)&v92 - v9;
  uint64_t v108 = type metadata accessor for AvailableShortcutAction();
  uint64_t v118 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  uint64_t v11 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FC88);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v115 = (uint64_t)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = type metadata accessor for AdaptiveVoiceShortcut();
  uint64_t v119 = *(void *)(v117 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v117);
  uint64_t v16 = (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v92 - v17;
  uint64_t v19 = sub_247750158();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v113 = (char *)&v92 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  os_log_type_t v24 = (char *)&v92 - v23;
  if (qword_26925F138 != -1) {
    swift_once();
  }
  os_log_type_t v100 = v8;
  uint64_t v25 = __swift_project_value_buffer(v19, (uint64_t)qword_26925F898);
  swift_beginAccess();
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v111 = v25;
  uint64_t v110 = v20 + 16;
  id v109 = v26;
  v26(v24, v25, v19);
  uint64_t v27 = sub_247750138();
  os_log_type_t v28 = sub_247750C88();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = v20;
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_24770E000, v27, v28, "Keyword spotter did detect keyword", v30, 2u);
    uint64_t v31 = v30;
    uint64_t v20 = v29;
    MEMORY[0x24C55C7C0](v31, -1, -1);
  }

  id v32 = *(uint64_t (**)(char *, uint64_t))(v20 + 8);
  uint64_t v114 = v20 + 8;
  id v112 = v32;
  v32(v24, v19);
  id v33 = objc_msgSend(objc_allocWithZone((Class)AVSStore), sel_init);
  sub_247750048();
  uint64_t v34 = sub_2477223F4();
  uint64_t v35 = *(void *)(v34 + 16);
  uint64_t v107 = v11;
  if (v35)
  {
    id v103 = v33;
    uint64_t v104 = v19;
    id v105 = a1;
    uint64_t v106 = v18;
    uint64_t v36 = v34 + ((*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80));
    uint64_t v37 = *(void *)(v119 + 72);
    uint64_t v102 = v34;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_2477126BC(v36, (uint64_t)v16);
      uint64_t aBlock = sub_24774FF48();
      uint64_t v121 = v38;
      uint64_t v128 = 45;
      unint64_t v129 = 0xE100000000000000;
      uint64_t v126 = 0;
      unint64_t v127 = 0xE000000000000000;
      sub_247715DE0();
      sub_247750D38();
      swift_bridgeObjectRelease();
      sub_247750B38();
      swift_bridgeObjectRelease();
      char v39 = (void *)sub_247750AF8();
      swift_bridgeObjectRelease();
      uint64_t v40 = (void *)sub_247750AF8();
      unsigned int v41 = objc_msgSend(v39, sel_isEqual_, v40);

      if (v41) {
        break;
      }
      sub_247747330((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      v36 += v37;
      if (!--v35)
      {
        swift_bridgeObjectRelease();
        uint64_t v42 = 1;
        uint64_t v18 = v106;
        a1 = v105;
        uint64_t v19 = v104;
        uint64_t v43 = v115;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v43 = v115;
    sub_247747108((uint64_t)v16, v115, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
    uint64_t v42 = 0;
    uint64_t v18 = v106;
    a1 = v105;
    uint64_t v19 = v104;
LABEL_12:
    id v33 = v103;
  }
  else
  {
    uint64_t v42 = 1;
    uint64_t v43 = v115;
  }
  uint64_t v44 = v119;
  uint64_t v45 = v117;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v119 + 56))(v43, v42, 1, v117);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v43, 1, v45);
  uint64_t v47 = (uint64_t)v116;
  if (v46 != 1)
  {
    uint64_t v48 = v19;
    sub_247747108(v43, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
    uint64_t v49 = (uint64_t)&v18[*(int *)(v45 + 28)];
    sub_24772A200(v49, v47);
    id v50 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v118 + 48);
    uint64_t v51 = v108;
    v118 += 48;
    if (v50(v47, 1, v108) == 1)
    {
      sub_247747330((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
      sub_247712A34(v47, &qword_26925F160);
      uint64_t v19 = v48;
      goto LABEL_17;
    }
    uint64_t v62 = (uint64_t)v107;
    sub_247747108(v47, (uint64_t)v107, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
    sub_247747170(v62);
    if (_AXSAudioDonationSiriImprovementEnabled())
    {
      uint64_t v63 = (uint64_t *)&v18[*(int *)(v45 + 20)];
      if (v63[1])
      {
        uint64_t v64 = *v63;
        uint64_t v65 = v63[1];
      }
      else
      {
        uint64_t v64 = 0;
        uint64_t v65 = 0xE000000000000000;
      }
      swift_bridgeObjectRetain();
      sub_2477449F0((uint64_t)a1, v64, v65);
      swift_bridgeObjectRelease();
    }
    if (AXIsInternalInstall())
    {
      uint64_t v66 = (uint64_t)v99;
      sub_24774FF58();
      uint64_t v67 = sub_247750048();
      uint64_t v69 = v68;
      uint64_t v70 = sub_247750028();
      sub_247750038();
      uint64_t v71 = v98;
      id v72 = (uint64_t *)(v66 + *(int *)(v98 + 20));
      *id v72 = v67;
      v72[1] = v69;
      *(void *)(v66 + *(int *)(v71 + 24)) = v70;
      uint64_t v45 = v117;
      *(_DWORD *)(v66 + *(int *)(v71 + 28)) = v73;
      id v74 = objc_msgSend(objc_allocWithZone((Class)AVSStore), sel_init);
      _sSo8AVSStoreC22AdaptiveVoiceShortcutsE22storeEventForDebugging5eventyAC08AVSDebugF0V_tF_0(v66);

      sub_247747330(v66, (uint64_t (*)(void))type metadata accessor for AVSDebugEvent);
    }
    id v75 = &v18[*(int *)(v45 + 20)];
    uint64_t v76 = *((void *)v75 + 1);
    if (v76)
    {
      uint64_t v77 = *(void *)v75;
      uint64_t v78 = v49;
      uint64_t v79 = (uint64_t)v100;
      sub_24772A200(v78, (uint64_t)v100);
      if (v50(v79, 1, v51) != 1)
      {
        unint64_t v81 = (uint64_t *)(v79 + *(int *)(v51 + 20));
        uint64_t v83 = *v81;
        uint64_t v82 = v81[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_247747330(v79, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
        sub_24771F388(0, (unint64_t *)&qword_26925F350);
        long long v84 = (void *)sub_247750CA8();
        uint64_t v85 = (void *)swift_allocObject();
        v85[2] = v77;
        v85[3] = v76;
        uint64_t v86 = v101;
        v85[4] = v101;
        v85[5] = v83;
        v85[6] = v82;
        uint64_t v124 = sub_247747320;
        uint64_t v125 = v85;
        uint64_t aBlock = MEMORY[0x263EF8330];
        uint64_t v121 = 1107296256;
        uint64_t v122 = sub_2477319C4;
        uint64_t v123 = &block_descriptor_13;
        id v87 = _Block_copy(&aBlock);
        id v88 = v86;
        swift_release();
        uint64_t v89 = v92;
        sub_247750A78();
        uint64_t aBlock = MEMORY[0x263F8EE78];
        sub_247741FEC();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26925F360);
        sub_24773CE28();
        uint64_t v90 = v94;
        uint64_t v91 = v97;
        sub_247750D68();
        MEMORY[0x24C55BCB0](0, v89, v90, v87);
        _Block_release(v87);

        (*(void (**)(char *, uint64_t))(v96 + 8))(v90, v91);
        (*(void (**)(char *, uint64_t))(v93 + 8))(v89, v95);
        uint64_t v80 = v62;
        goto LABEL_33;
      }
      sub_247712A34(v79, &qword_26925F160);
    }
    uint64_t v80 = v62;
LABEL_33:
    sub_247747330(v80, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
    return sub_247747330((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
  }
  sub_247712A34(v43, &qword_26925FC88);
LABEL_17:
  uint64_t v52 = v113;
  v109(v113, v111, v19);
  id v53 = a1;
  uint64_t v54 = sub_247750138();
  uint64_t v55 = v19;
  os_log_type_t v56 = sub_247750C88();
  if (os_log_type_enabled(v54, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    uint64_t aBlock = v58;
    *(_DWORD *)uint64_t v57 = 136315138;
    uint64_t v59 = sub_247750048();
    uint64_t v128 = sub_247745AC4(v59, v60, &aBlock);
    sub_247750CF8();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24770E000, v54, v56, "No shortcut found for keyword %s", v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C55C7C0](v58, -1, -1);
    MEMORY[0x24C55C7C0](v57, -1, -1);
  }
  else
  {
  }
  return v112(v52, v55);
}

uint64_t sub_2477449F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v68 = a2;
  uint64_t v69 = a3;
  uint64_t v3 = sub_247750158();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v60 = (char *)v58 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F550);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FCA0);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v65 = (char *)v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FCA8);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v64 = (char *)v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FCB0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v63 = (char *)v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_24774FF88();
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v19 = sub_24774FF38();
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v20 = sub_2477501A8();
  uint64_t v66 = *(void *)(v20 - 8);
  uint64_t v67 = v20;
  uint64_t v21 = *(void *)(v66 + 64);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v62 = (char *)v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  os_log_type_t v24 = (char *)v58 - v23;
  uint64_t v25 = sub_247750028();
  if (v25) {
    uint64_t v26 = v25;
  }
  else {
    uint64_t v26 = MEMORY[0x263F8EE78];
  }
  uint64_t v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9388]), sel_initWithCommonFormat_sampleRate_channels_interleaved_, 3, 1, 0, 16000.0);
  if (v27)
  {
    uint64_t v59 = v11;
    unint64_t v28 = *(void *)(v26 + 16);
    if (HIDWORD(v28))
    {
      uint64_t result = sub_247750E78();
      __break(1u);
      return result;
    }
    uint64_t v29 = v27;
    id v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF93B0]), sel_initWithPCMFormat_frameCapacity_, v27, v28);
    if (v30)
    {
      uint64_t v31 = v30;
      objc_msgSend(v30, sel_setFrameLength_, objc_msgSend(v30, sel_frameCapacity));
      id v32 = (void **)objc_msgSend(v31, sel_int16ChannelData);
      if (v32)
      {
        id v33 = (char *)*v32;
        unsigned int v34 = objc_msgSend(v31, sel_frameLength);
        uint64_t v35 = (char *)(v26 + 32);
        if (v33 != (char *)(v26 + 32) || v33 >= &v35[2 * v34]) {
          memmove(v33, v35, 2 * v34);
        }
        swift_bridgeObjectRelease();
        unint64_t v60 = *(char **)&v61[OBJC_IVAR___AVSTriggerController_avsBundleDonorID];
        swift_bridgeObjectRetain();
        sub_24774FF28();
        __swift_instantiateConcreteTypeFromMangledName(&qword_26925FCB8);
        uint64_t v36 = swift_allocObject();
        *(_OWORD *)(v36 + 16) = xmmword_247753040;
        *(void *)(v36 + 32) = v31;
        uint64_t v70 = v36;
        sub_247750BA8();
        v58[1] = v70;
        unint64_t v61 = v31;
        sub_24774FF78();
        uint64_t v37 = sub_247750188();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v63, 1, 1, v37);
        uint64_t v38 = sub_2477501B8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v64, 1, 1, v38);
        uint64_t v39 = sub_247750168();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v65, 1, 1, v39);
        swift_bridgeObjectRetain();
        sub_247750178();
        uint64_t v40 = sub_247750C38();
        uint64_t v41 = (uint64_t)v59;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v59, 1, 1, v40);
        uint64_t v43 = v66;
        uint64_t v42 = v67;
        uint64_t v44 = v62;
        (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v62, v24, v67);
        unint64_t v45 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
        uint64_t v46 = swift_allocObject();
        *(void *)(v46 + 16) = 0;
        *(void *)(v46 + 24) = 0;
        (*(void (**)(unint64_t, char *, uint64_t))(v43 + 32))(v46 + v45, v44, v42);
        sub_247740EE0(v41, (uint64_t)&unk_26925FCC8, v46, (uint64_t)&unk_26FBBB998, &qword_26925F3C0);

        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v24, v42);
      }
      else
      {
        swift_bridgeObjectRelease();
        if (qword_26925F138 != -1) {
          swift_once();
        }
        uint64_t v52 = __swift_project_value_buffer(v3, (uint64_t)qword_26925F898);
        swift_beginAccess();
        id v53 = v60;
        (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v60, v52, v3);
        uint64_t v54 = sub_247750138();
        os_log_type_t v55 = sub_247750C68();
        if (os_log_type_enabled(v54, v55))
        {
          os_log_type_t v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v56 = 0;
          _os_log_impl(&dword_24770E000, v54, v55, "Unable to get audio buffer pointer for VAKeywordSpottedEvent for donation", v56, 2u);
          MEMORY[0x24C55C7C0](v56, -1, -1);
          uint64_t v57 = v29;
        }
        else
        {
          uint64_t v57 = v54;
          uint64_t v54 = v29;
        }

        return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v53, v3);
      }
    }
  }
  swift_bridgeObjectRelease();
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v48 = __swift_project_value_buffer(v3, (uint64_t)qword_26925F898);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v48, v3);
  uint64_t v49 = sub_247750138();
  os_log_type_t v50 = sub_247750C68();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v51 = 0;
    _os_log_impl(&dword_24770E000, v49, v50, "Unable to get audio buffer for VAKeywordSpottedEvent for donation", v51, 2u);
    MEMORY[0x24C55C7C0](v51, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_247745348(uint64_t a1, uint64_t a2, void *a3)
{
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v7 = (id)qword_269262028;
  }
  else
  {
    id v7 = objc_msgSend(self, sel_mainBundle);
    uint64_t v6 = 0;
  }
  id v8 = v6;
  sub_24774FE68();

  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F170);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2477523E0;
  *(void *)(v9 + 56) = MEMORY[0x263F8D310];
  *(void *)(v9 + 64) = sub_247712668();
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_247750B18();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(a3, sel_displayAlertHandler, 0x8000000247754770);
  if (v10)
  {
    uint64_t v11 = (void (**)(void, void, void))v10;
    _Block_copy(v10);
    uint64_t v12 = (void *)sub_247750AF8();
    uint64_t v13 = (void *)sub_247750AF8();
    ((void (**)(void, void *, void *))v11)[2](v11, v12, v13);

    _Block_release(v11);
    _Block_release(v11);
  }

  return swift_bridgeObjectRelease();
}

uint64_t AVSTriggerController.keywordSpotterDidStopWithSummary(json:uuid:)()
{
  uint64_t v0 = sub_247750158();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26925F898);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_247750138();
  os_log_type_t v6 = sub_247750C88();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_24770E000, v5, v6, "Keywors spotter did stop.", v7, 2u);
    MEMORY[0x24C55C7C0](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_247745774(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24771FED8;
  return MEMORY[0x270EFE1D0](a1);
}

uint64_t sub_247745814(uint64_t a1, int *a2)
{
  os_log_type_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_247747BC4;
  return v6(a1);
}

uint64_t sub_2477458F0(uint64_t a1, int *a2)
{
  os_log_type_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_2477459CC;
  return v6(a1);
}

uint64_t sub_2477459CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_247745AC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_247745B98(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24773D138((uint64_t)v12, *a3);
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
      sub_24773D138((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_247745B98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_247750D08();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_247745D54(a5, a6);
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
  uint64_t v8 = sub_247750E28();
  if (!v8)
  {
    sub_247750E78();
    __break(1u);
LABEL_17:
    uint64_t result = sub_247750EC8();
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

uint64_t sub_247745D54(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_247745DEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_247745FCC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_247745FCC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247745DEC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_247745F64(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_247750DD8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_247750E78();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_247750B68();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_247750EC8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_247750E78();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_247745F64(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925FCE0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247745FCC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925FCE0);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

uint64_t sub_24774611C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2477470E0(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_247746188(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_247746188(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_247750FB8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_247746874(0, v3, 1, a1);
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
    goto LABEL_160;
  }
  uint64_t v105 = result;
  uint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      size_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          uint64_t v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_247746944((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v97 = sub_247746ED8((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          os_log_type_t v100 = &v97[16 * v96 + 32];
          *(void *)os_log_type_t v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_247750BC8();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  size_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_247750FD8();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_247750FD8()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      size_t v11 = sub_247746BE0(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      size_t v11 = sub_247746BE0((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    uint64_t v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            uint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        uint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        uint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        id v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        id v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_247746944((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        size_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        uint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      id v33 = (void *)(v10 + 16 * v9);
      do
      {
        unsigned int v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_247750FD8() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
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
  __break(1u);
LABEL_160:
  uint64_t result = sub_247750E78();
  __break(1u);
  return result;
}

uint64_t sub_247746874(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_247750FD8(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_247746944(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_247750FD8() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_247750FD8() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_247746CDC((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_247750EC8();
  __break(1u);
  return result;
}

char *sub_247746BE0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925FCF8);
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
  uint64_t v14 = a4 + 32;
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

char *sub_247746CDC(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_247750EC8();
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

uint64_t sub_247746D98(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for AvailableShortcutAction();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_18;
  }
  if (v8 / v7 < 0)
  {
LABEL_19:
    uint64_t result = sub_247750EC8();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_247746ED8(uint64_t a1)
{
  return sub_247746BE0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247746EEC(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *unint64_t v3 = v2;
  v3[1] = sub_247746FCC;
  return v5(v2 + 32);
}

uint64_t sub_247746FCC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  unint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_2477470E0(uint64_t a1)
{
  return sub_24771EAF8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2477470F4(void *a1)
{
  return sub_24771EC64(0, a1[2], 0, a1);
}

uint64_t sub_247747108(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_247747170(uint64_t a1)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for AvailableShortcutAction() + 24);
  uint64_t v3 = *(void *)v1;
  uint64_t v2 = *(void *)(v1 + 8);
  int v4 = *(unsigned __int8 *)(v1 + 16);
  if (v4)
  {
    if (v4 == 1)
    {
      swift_bridgeObjectRetain();
      id v9 = (id)sub_247750AF8();
      sub_24771E294(v3, v2, 1u);
      AXPIBridgePerformActionForSystemAction(v9);
    }
    else
    {
      id v7 = objc_allocWithZone(MEMORY[0x263F285E0]);
      swift_bridgeObjectRetain();
      id v8 = objc_msgSend(v7, sel_init);
      id v9 = (id)sub_247750AF8();
      sub_24771E294(v3, v2, 2u);
      objc_msgSend(v8, sel_startUIRequest_, v9);
    }
  }
  else
  {
    id v5 = objc_allocWithZone(MEMORY[0x263F85138]);
    swift_bridgeObjectRetain();
    uint64_t v6 = (void *)sub_247750AF8();
    sub_24771E294(v3, v2, 0);
    id v9 = objc_msgSend(v5, sel_initWithWorkflowIdentifier_, v6);

    objc_msgSend(v9, sel_start);
  }
}

uint64_t sub_2477472D8()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_247747320()
{
  return sub_247745348(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_247747330(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t _sSo20AVSTriggerControllerC22AdaptiveVoiceShortcutsE29keywordSpotterDidUpdateScores10verboseLogySS_tF_0()
{
  uint64_t v0 = sub_247750158();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26925F138 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26925F898);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  id v5 = sub_247750138();
  os_log_type_t v6 = sub_247750C88();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_24770E000, v5, v6, "Keyword spotter did update scores", v7, 2u);
    MEMORY[0x24C55C7C0](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

char *keypath_get_selector_displayAlertHandler()
{
  return sel_displayAlertHandler;
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24774758C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24771FCAC;
  return sub_247742B44(a1, v4, v5, v6);
}

uint64_t sub_247747640()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_247747678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_24774138C(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t sub_247747680()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2477476B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(uint64_t (**)(void *, void *))(v4 + 16);
  v8[0] = a1;
  v8[1] = a2;
  v7[0] = a3;
  v7[1] = a4;
  return v5(v8, v7);
}

uint64_t sub_2477476F8(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(v2 + 16))(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_247747730()
{
  uint64_t v1 = sub_2477501A8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2477477FC(uint64_t a1)
{
  sub_2477501A8();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24771FED8;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  void *v4 = v3;
  v4[1] = sub_24771FED8;
  return MEMORY[0x270EFE1D0](a1);
}

uint64_t sub_24774791C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24771FCAC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26925FCD0 + dword_26925FCD0);
  return v6(a1, v4);
}

uint64_t sub_2477479D4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24771FED8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26925FCE8 + dword_26925FCE8);
  return v6(a1, v4);
}

uint64_t sub_247747A8C()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_247747ACC()
{
  return sub_247742044(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_247747AD4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24771FED8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26925FD00 + dword_26925FD00);
  return v6(a1, v4);
}

unint64_t sub_247747BC8(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 1701667182;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      unint64_t result = 0x696669746E656469;
      break;
  }
  return result;
}

unint64_t sub_247747C5C()
{
  return sub_247747BC8(*v0);
}

uint64_t sub_247747C64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24774978C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247747C8C(uint64_t a1)
{
  unint64_t v2 = sub_247747F68();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_247747CC8(uint64_t a1)
{
  unint64_t v2 = sub_247747F68();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AdaptiveVoiceShortcut.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FD18);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247747F68();
  sub_247751038();
  v8[15] = 0;
  sub_24774FF68();
  sub_2477484C0(&qword_26925F6A8, MEMORY[0x263F07508]);
  sub_247750FA8();
  if (!v1)
  {
    type metadata accessor for AdaptiveVoiceShortcut();
    v8[14] = 1;
    sub_247750F68();
    v8[13] = 2;
    sub_247750F68();
    v8[12] = 3;
    type metadata accessor for AvailableShortcutAction();
    sub_2477484C0(&qword_26925FD28, (void (*)(uint64_t))type metadata accessor for AvailableShortcutAction);
    sub_247750F78();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_247747F68()
{
  unint64_t result = qword_26925FD20;
  if (!qword_26925FD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FD20);
  }
  return result;
}

uint64_t type metadata accessor for AdaptiveVoiceShortcut()
{
  uint64_t result = qword_26925FD40;
  if (!qword_26925FD40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t AdaptiveVoiceShortcut.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
  MEMORY[0x270FA5388](v3 - 8);
  BOOL v39 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_24774FF68();
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v43 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FD30);
  uint64_t v41 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  id v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for AdaptiveVoiceShortcut();
  uint64_t v9 = (int *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24774FF58();
  uint64_t v12 = &v11[v9[7]];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = &v11[v9[8]];
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = 0;
  uint64_t v14 = (uint64_t)&v11[v9[9]];
  uint64_t v15 = type metadata accessor for AvailableShortcutAction();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v38 = v14;
  v16(v14, 1, 1, v15);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247747F68();
  uint64_t v46 = v7;
  uint64_t v17 = v47;
  sub_247751028();
  uint64_t v18 = (uint64_t)a1;
  if (!v17)
  {
    uint64_t v47 = v12;
    uint64_t v36 = v15;
    uint64_t v37 = v13;
    uint64_t v19 = v41;
    uint64_t v20 = v42;
    uint64_t v21 = v18;
    char v51 = 0;
    sub_2477484C0(&qword_26925F6C8, MEMORY[0x263F07508]);
    uint64_t v22 = v43;
    sub_247750F38();
    (*(void (**)(char *, char *, uint64_t))(v20 + 40))(v11, v22, v44);
    char v50 = 1;
    uint64_t v24 = sub_247750EF8();
    uint64_t v26 = v25;
    uint64_t v27 = (uint64_t *)v47;
    swift_bridgeObjectRelease();
    uint64_t *v27 = v24;
    v27[1] = v26;
    char v49 = 2;
    uint64_t v28 = sub_247750EF8();
    uint64_t v30 = v29;
    uint64_t v31 = (uint64_t *)v37;
    swift_bridgeObjectRelease();
    *uint64_t v31 = v28;
    v31[1] = v30;
    char v48 = 3;
    sub_2477484C0(&qword_26925FD38, (void (*)(uint64_t))type metadata accessor for AvailableShortcutAction);
    uint64_t v32 = (uint64_t)v39;
    uint64_t v34 = v45;
    id v33 = v46;
    sub_247750F08();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v33, v34);
    uint64_t v18 = v21;
    uint64_t v35 = v40;
    sub_24771E408(v32, v38);
    sub_2477126BC((uint64_t)v11, v35);
  }
  __swift_destroy_boxed_opaque_existential_1(v18);
  return sub_247712770((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for AdaptiveVoiceShortcut);
}

uint64_t sub_2477484C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_247748508@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return AdaptiveVoiceShortcut.init(from:)(a1, a2);
}

uint64_t sub_247748520(void *a1)
{
  return AdaptiveVoiceShortcut.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for AdaptiveVoiceShortcut(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24774FF68();
    uint64_t v35 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v35(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    int64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    void *v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = type metadata accessor for AvailableShortcutAction();
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v21(v18, 1, v19))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
      memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      v35((uint64_t *)v17, (uint64_t *)v18, v7);
      uint64_t v24 = *(int *)(v19 + 20);
      uint64_t v25 = &v17[v24];
      uint64_t v26 = &v18[v24];
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v27;
      uint64_t v28 = *(int *)(v19 + 24);
      uint64_t v29 = &v17[v28];
      uint64_t v30 = &v18[v28];
      uint64_t v31 = *(void *)v30;
      uint64_t v32 = *((void *)v30 + 1);
      unsigned __int8 v33 = v30[16];
      swift_bridgeObjectRetain();
      sub_24773F9A4(v31, v32, v33);
      *(void *)uint64_t v29 = v31;
      *((void *)v29 + 1) = v32;
      v29[16] = v33;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
  }
  return a1;
}

uint64_t destroy for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24774FF68();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = type metadata accessor for AvailableShortcutAction();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  if (!result)
  {
    v5(v6, v4);
    swift_bridgeObjectRelease();
    uint64_t v9 = v6 + *(int *)(v7 + 24);
    uint64_t v10 = *(void *)v9;
    uint64_t v11 = *(void *)(v9 + 8);
    unsigned __int8 v12 = *(unsigned char *)(v9 + 16);
    return sub_24771E294(v10, v11, v12);
  }
  return result;
}

uint64_t initializeWithCopy for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24774FF68();
  unsigned __int8 v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v33(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  unsigned __int8 v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *unsigned __int8 v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)(a1 + v15);
  uint64_t v17 = (char *)(a2 + v15);
  uint64_t v18 = type metadata accessor for AvailableShortcutAction();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20(v17, 1, v18))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    v33((uint64_t)v16, (uint64_t)v17, v6);
    uint64_t v22 = *(int *)(v18 + 20);
    uint64_t v23 = &v16[v22];
    uint64_t v24 = &v17[v22];
    uint64_t v25 = *((void *)v24 + 1);
    *(void *)uint64_t v23 = *(void *)v24;
    *((void *)v23 + 1) = v25;
    uint64_t v26 = *(int *)(v18 + 24);
    uint64_t v27 = &v16[v26];
    uint64_t v28 = &v17[v26];
    uint64_t v29 = *(void *)v28;
    uint64_t v30 = *((void *)v28 + 1);
    unsigned __int8 v31 = v28[16];
    swift_bridgeObjectRetain();
    sub_24773F9A4(v29, v30, v31);
    *(void *)uint64_t v27 = v29;
    *((void *)v27 + 1) = v30;
    v27[16] = v31;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

uint64_t assignWithCopy for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24774FF68();
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 24);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[6];
  unsigned __int8 v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *unsigned __int8 v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v45 = a1;
  uint64_t v15 = (char *)(a1 + v14);
  uint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = type metadata accessor for AvailableShortcutAction();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(a1) = v19(v15, 1, v17);
  int v20 = v19(v16, 1, v17);
  if (!a1)
  {
    if (!v20)
    {
      v7((uint64_t)v15, (uint64_t)v16, v6);
      uint64_t v32 = *(int *)(v17 + 20);
      unsigned __int8 v33 = &v15[v32];
      uint64_t v34 = &v16[v32];
      *(void *)unsigned __int8 v33 = *(void *)v34;
      *((void *)v33 + 1) = *((void *)v34 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v35 = *(int *)(v17 + 24);
      uint64_t v36 = &v15[v35];
      uint64_t v37 = &v16[v35];
      uint64_t v38 = *(void *)v37;
      uint64_t v39 = *((void *)v37 + 1);
      unsigned __int8 v40 = v37[16];
      sub_24773F9A4(*(void *)v37, v39, v40);
      uint64_t v41 = *(void *)v36;
      uint64_t v42 = *((void *)v36 + 1);
      *(void *)uint64_t v36 = v38;
      *((void *)v36 + 1) = v39;
      unsigned __int8 v43 = v36[16];
      v36[16] = v40;
      sub_24771E294(v41, v42, v43);
      return v45;
    }
    sub_247712770((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
    memcpy(v15, v16, *(void *)(*(void *)(v30 - 8) + 64));
    return v45;
  }
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v15, v16, v6);
  uint64_t v21 = *(int *)(v17 + 20);
  uint64_t v22 = &v15[v21];
  uint64_t v23 = &v16[v21];
  *(void *)uint64_t v22 = *(void *)v23;
  *((void *)v22 + 1) = *((void *)v23 + 1);
  uint64_t v24 = *(int *)(v17 + 24);
  uint64_t v25 = &v15[v24];
  uint64_t v26 = &v16[v24];
  uint64_t v27 = *(void *)v26;
  uint64_t v28 = *((void *)v26 + 1);
  unsigned __int8 v29 = v26[16];
  swift_bridgeObjectRetain();
  sub_24773F9A4(v27, v28, v29);
  *(void *)uint64_t v25 = v27;
  *((void *)v25 + 1) = v28;
  v25[16] = v29;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return v45;
}

uint64_t initializeWithTake for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24774FF68();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[7];
  uint64_t v10 = (char *)(a1 + v9);
  uint64_t v11 = (char *)(a2 + v9);
  uint64_t v12 = type metadata accessor for AvailableShortcutAction();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v10, (uint64_t)v11, v6);
    *(_OWORD *)&v10[*(int *)(v12 + 20)] = *(_OWORD *)&v11[*(int *)(v12 + 20)];
    uint64_t v15 = *(int *)(v12 + 24);
    uint64_t v16 = &v10[v15];
    uint64_t v17 = &v11[v15];
    v16[16] = v17[16];
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

uint64_t assignWithTake for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24774FF68();
  uint64_t v42 = *(void *)(v6 - 8);
  unsigned __int8 v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 40);
  v43(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (char *)(a1 + v17);
  uint64_t v19 = (char *)(a2 + v17);
  uint64_t v20 = type metadata accessor for AvailableShortcutAction();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  int v23 = v22(v18, 1, v20);
  int v24 = v22(v19, 1, v20);
  if (!v23)
  {
    if (!v24)
    {
      v43((uint64_t)v18, (uint64_t)v19, v6);
      uint64_t v30 = *(int *)(v20 + 20);
      unsigned __int8 v31 = &v18[v30];
      uint64_t v32 = &v19[v30];
      uint64_t v34 = *(void *)v32;
      uint64_t v33 = *((void *)v32 + 1);
      *(void *)unsigned __int8 v31 = v34;
      *((void *)v31 + 1) = v33;
      swift_bridgeObjectRelease();
      uint64_t v35 = *(int *)(v20 + 24);
      uint64_t v36 = &v18[v35];
      uint64_t v37 = &v19[v35];
      char v38 = v37[16];
      uint64_t v39 = *(void *)v36;
      uint64_t v40 = *((void *)v36 + 1);
      *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
      unsigned __int8 v41 = v36[16];
      v36[16] = v38;
      sub_24771E294(v39, v40, v41);
      return a1;
    }
    sub_247712770((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for AvailableShortcutAction);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
    memcpy(v18, v19, *(void *)(*(void *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v18, v19, v6);
  *(_OWORD *)&v18[*(int *)(v20 + 20)] = *(_OWORD *)&v19[*(int *)(v20 + 20)];
  uint64_t v25 = *(int *)(v20 + 24);
  uint64_t v26 = &v18[v25];
  uint64_t v27 = &v19[v25];
  v26[16] = v27[16];
  *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2477491CC);
}

uint64_t sub_2477491CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24774FF68();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 2147483646)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 28);
    return v13(v15, a2, v14);
  }
}

uint64_t storeEnumTagSinglePayload for AdaptiveVoiceShortcut(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_247749320);
}

uint64_t sub_247749320(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24774FF68();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F160);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_247749454()
{
  sub_24774FF68();
  if (v0 <= 0x3F)
  {
    sub_247749528();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_247749528()
{
  if (!qword_26925FD50)
  {
    type metadata accessor for AvailableShortcutAction();
    unint64_t v0 = sub_247750CE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26925FD50);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for AdaptiveVoiceShortcut.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x24774964CLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdaptiveVoiceShortcut.CodingKeys()
{
  return &type metadata for AdaptiveVoiceShortcut.CodingKeys;
}

unint64_t sub_247749688()
{
  unint64_t result = qword_26925FD58;
  if (!qword_26925FD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FD58);
  }
  return result;
}

unint64_t sub_2477496E0()
{
  unint64_t result = qword_26925FD60;
  if (!qword_26925FD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FD60);
  }
  return result;
}

unint64_t sub_247749738()
{
  unint64_t result = qword_26925FD68;
  if (!qword_26925FD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FD68);
  }
  return result;
}

uint64_t sub_24774978C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000247754A50 || (sub_247750FD8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000247754A70)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_247750FD8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

ValueMetadata *type metadata accessor for AVSCommandRecordingView()
{
  return &type metadata for AVSCommandRecordingView;
}

uint64_t sub_247749934()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247749950@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v49 = a1;
  uint64_t v60 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FD78);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FD80);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FD88);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FD90);
  MEMORY[0x270FA5388](v57);
  uint64_t v50 = (uint64_t)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FD98);
  uint64_t v54 = *(void *)(v58 - 8);
  MEMORY[0x270FA5388](v58);
  char v51 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FDA0) - 8;
  MEMORY[0x270FA5388](v52);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FDA8) - 8;
  MEMORY[0x270FA5388](v55);
  uint64_t v53 = (uint64_t)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FDB0);
  MEMORY[0x270FA5388](v59);
  uint64_t v56 = (uint64_t)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v7 = sub_247750548();
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FDB8);
  sub_24774A120(a1, a2, &v7[*(int *)(v22 + 44)]);
  sub_2477509E8();
  sub_2477509D8();
  swift_release();
  uint64_t v23 = sub_2477509C8();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v24 = v63;
  sub_2477129D0((uint64_t)v7, (uint64_t)v11, &qword_26925FD78);
  uint64_t v25 = (uint64_t *)&v11[*(int *)(v9 + 44)];
  *uint64_t v25 = v23;
  v25[1] = v24;
  sub_247712A34((uint64_t)v7, &qword_26925FD78);
  LOBYTE(v24) = sub_247750698();
  sub_247750258();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  sub_2477129D0((uint64_t)v11, (uint64_t)v15, &qword_26925FD80);
  uint64_t v34 = &v15[*(int *)(v13 + 44)];
  char *v34 = v24;
  *((void *)v34 + 1) = v27;
  *((void *)v34 + 2) = v29;
  *((void *)v34 + 3) = v31;
  *((void *)v34 + 4) = v33;
  v34[40] = 0;
  sub_247712A34((uint64_t)v11, &qword_26925FD80);
  sub_2477509B8();
  uint64_t v35 = v50;
  sub_24774B40C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v50, 0.0, 1, INFINITY, 0);
  sub_247712A34((uint64_t)v15, &qword_26925FD88);
  uint64_t v36 = v49;
  uint64_t v61 = v49;
  uint64_t v62 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F238);
  sub_24774D960(&qword_26925FDC0, &qword_26925FD90, (void (*)(void))sub_24774B8C8);
  sub_247712AEC(&qword_26925F248, &qword_26925F238);
  uint64_t v37 = v51;
  sub_247750868();
  sub_247712A34(v35, &qword_26925FD90);
  LOBYTE(v15) = sub_247750688();
  uint64_t v38 = v54;
  uint64_t v39 = v58;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v19, v37, v58);
  uint64_t v40 = &v19[*(int *)(v52 + 44)];
  *uint64_t v40 = (char)v15;
  *(_OWORD *)(v40 + 8) = 0u;
  *(_OWORD *)(v40 + 24) = 0u;
  v40[40] = 1;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v37, v39);
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v36;
  *(void *)(v41 + 24) = a2;
  uint64_t v42 = v53;
  sub_2477129D0((uint64_t)v19, v53, &qword_26925FDA0);
  unsigned __int8 v43 = (uint64_t (**)())(v42 + *(int *)(v55 + 44));
  char *v43 = sub_24774B9F4;
  v43[1] = (uint64_t (*)())v41;
  v43[2] = 0;
  void v43[3] = 0;
  swift_retain();
  sub_247712A34((uint64_t)v19, &qword_26925FDA0);
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = v36;
  *(void *)(v44 + 24) = a2;
  uint64_t v45 = v56;
  sub_2477129D0(v42, v56, &qword_26925FDA8);
  uint64_t v46 = (void *)(v45 + *(int *)(v59 + 36));
  *uint64_t v46 = 0;
  v46[1] = 0;
  v46[2] = sub_24774BA34;
  v46[3] = v44;
  swift_retain();
  sub_247712A34(v42, &qword_26925FDA8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = v36;
  *(void *)(v47 + 24) = a2;
  sub_24774D960(&qword_26925FDF0, &qword_26925FDB0, (void (*)(void))sub_24774BA44);
  swift_retain();
  sub_247750878();
  swift_release();
  return sub_247712A34(v45, &qword_26925FDB0);
}

uint64_t sub_24774A120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  id v88 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE08);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v86 = (uint64_t *)((char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE10);
  uint64_t v7 = MEMORY[0x270FA5388](v85);
  uint64_t v87 = (uint64_t)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v103 = (uint64_t)&v80 - v9;
  uint64_t v10 = sub_247750538();
  uint64_t v98 = *(void *)(v10 - 8);
  uint64_t v99 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F5E8);
  MEMORY[0x270FA5388](v13 - 8);
  os_log_type_t v100 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE18);
  MEMORY[0x270FA5388](v97);
  uint64_t v16 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE20);
  MEMORY[0x270FA5388](v101);
  uint64_t v18 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE28);
  uint64_t v105 = *(void *)(v19 - 8);
  uint64_t v106 = v19;
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  uint64_t v102 = (char *)&v80 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  unint64_t v96 = (char *)&v80 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v104 = (char *)&v80 - v24;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v83 = a1;
  uint64_t v84 = a2;
  sub_24774CCA0();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v25 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v26 = objc_msgSend(self, sel_mainBundle);
  }
  id v27 = v25;
  uint64_t v119 = sub_247750758();
  uint64_t v120 = v28;
  char v121 = v29 & 1;
  *(void *)((char *)&v122 + 7) = v30;
  sub_247750528();
  uint64_t v31 = (uint64_t)v100;
  sub_247750818();
  (*(void (**)(char *, uint64_t))(v98 + 8))(v12, v99);
  sub_247712AA0(v119, v120, v121);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  sub_2477129D0(v31, (uint64_t)v16, &qword_26925F5E8);
  uint64_t v33 = &v16[*(int *)(v97 + 36)];
  *(void *)uint64_t v33 = KeyPath;
  v33[8] = 1;
  sub_247712A34(v31, &qword_26925F5E8);
  uint64_t v34 = sub_2477506E8();
  uint64_t v35 = swift_getKeyPath();
  sub_2477129D0((uint64_t)v16, (uint64_t)v18, &qword_26925FE18);
  uint64_t v36 = (uint64_t *)&v18[*(int *)(v101 + 36)];
  *uint64_t v36 = v35;
  v36[1] = v34;
  sub_247712A34((uint64_t)v16, &qword_26925FE18);
  sub_24774D048();
  uint64_t v37 = v96;
  sub_247750838();
  sub_247712A34((uint64_t)v18, &qword_26925FE20);
  (*(void (**)(char *, char *, uint64_t))(v105 + 32))(v104, v37, v106);
  sub_24773D560(0xD000000000000026);
  uint64_t v38 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v39 = (id)qword_269262028;
  }
  else
  {
    id v39 = objc_msgSend(self, sel_mainBundle);
    uint64_t v38 = 0;
  }
  id v40 = v38;
  sub_24774FE68();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F170);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_2477523E0;
  id v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08A30]), sel_init);
  sub_24774D188();
  unsigned __int8 v43 = (void *)sub_247750CD8();
  id v44 = objc_msgSend(v42, sel_stringFromNumber_, v43);

  if (v44)
  {
    uint64_t v45 = sub_247750B08();
    unint64_t v47 = v46;
  }
  else
  {

    uint64_t v45 = 0;
    unint64_t v47 = 0xE000000000000000;
  }
  *(void *)(v41 + 56) = MEMORY[0x263F8D310];
  *(void *)(v41 + 64) = sub_247712668();
  *(void *)(v41 + 32) = v45;
  *(void *)(v41 + 40) = v47;
  uint64_t v48 = sub_247750B18();
  uint64_t v50 = v49;
  swift_bridgeObjectRelease();
  uint64_t v119 = v48;
  uint64_t v120 = v50;
  sub_247715DE0();
  uint64_t v89 = sub_247750768();
  uint64_t v90 = v51;
  uint64_t v91 = v52;
  int v82 = v53 & 1;
  uint64_t v97 = swift_getKeyPath();
  int v81 = sub_247750688();
  uint64_t v101 = sub_2477504A8();
  uint64_t v55 = v83;
  uint64_t v54 = v84;
  sub_24774AF18((uint64_t)v107);
  *(_OWORD *)&v109[151] = v107[9];
  *(_OWORD *)&v109[167] = v107[10];
  *(_OWORD *)&v109[183] = v107[11];
  *(_OWORD *)&v109[87] = v107[5];
  *(_OWORD *)&v109[103] = v107[6];
  *(_OWORD *)&v109[119] = v107[7];
  *(_OWORD *)&v109[135] = v107[8];
  *(_OWORD *)&v109[23] = v107[1];
  *(_OWORD *)&v109[39] = v107[2];
  *(_OWORD *)&v109[55] = v107[3];
  *(_OWORD *)&v109[71] = v107[4];
  char v110 = 1;
  v109[199] = v108;
  *(_OWORD *)&v109[7] = v107[0];
  LODWORD(v100) = 1;
  sub_2477509B8();
  sub_247750308();
  uint64_t v95 = v149;
  unint64_t v96 = v151;
  uint64_t v98 = v154;
  uint64_t v99 = v153;
  unsigned __int8 v114 = v150;
  unsigned __int8 v112 = v152;
  int v56 = sub_247750688();
  int v92 = v114;
  int v93 = v112;
  int v94 = v56;
  unsigned __int8 v116 = 1;
  uint64_t v57 = sub_2477504A8();
  uint64_t v58 = (uint64_t)v86;
  uint64_t *v86 = v57;
  *(void *)(v58 + 8) = 0x4000000000000000;
  *(unsigned char *)(v58 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE40);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  uint64_t v59 = swift_allocObject();
  *(void *)(v59 + 16) = v55;
  *(void *)(v59 + 24) = v54;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F950);
  sub_247712AEC(&qword_26925FE48, &qword_26925F950);
  sub_24774D234();
  sub_247750998();
  sub_2477509B8();
  sub_247750308();
  uint64_t v60 = v87;
  sub_2477129D0(v58, v87, &qword_26925FE08);
  uint64_t v61 = (_OWORD *)(v60 + *(int *)(v85 + 36));
  long long v62 = v156;
  *uint64_t v61 = v155;
  v61[1] = v62;
  v61[2] = v157;
  sub_247712A34(v58, &qword_26925FE08);
  uint64_t v63 = v103;
  sub_247715F70(v60, v103, &qword_26925FE10);
  uint64_t v64 = *(void (**)(char *, char *, uint64_t))(v105 + 16);
  BOOL v65 = v102;
  uint64_t v66 = v106;
  v64(v102, v104, v106);
  LOBYTE(v54) = v116;
  LODWORD(v86) = v116;
  sub_2477129D0(v63, v60, &qword_26925FE10);
  char v67 = v88;
  v64(v88, v65, v66);
  uint64_t v68 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26925FE58);
  uint64_t v69 = &v67[v68[12]];
  uint64_t v70 = v90;
  *(void *)uint64_t v69 = v89;
  *((void *)v69 + 1) = v70;
  char v71 = v81;
  LOBYTE(v66) = v82;
  v69[16] = v82;
  uint64_t v72 = v97;
  *((void *)v69 + 3) = v91;
  *((void *)v69 + 4) = v72;
  v69[40] = 1;
  v69[48] = v71;
  *(_OWORD *)(v69 + 56) = 0u;
  *(_OWORD *)(v69 + 72) = 0u;
  v69[88] = 1;
  uint64_t v73 = v68[16];
  *(_OWORD *)((char *)&v118[2] + 1) = *(_OWORD *)v109;
  *(_OWORD *)((char *)&v118[20] + 1) = *(_OWORD *)&v109[144];
  *(_OWORD *)((char *)&v118[22] + 1) = *(_OWORD *)&v109[160];
  *(_OWORD *)((char *)&v118[24] + 1) = *(_OWORD *)&v109[176];
  *(_OWORD *)((char *)&v118[12] + 1) = *(_OWORD *)&v109[80];
  *(_OWORD *)((char *)&v118[14] + 1) = *(_OWORD *)&v109[96];
  *(_OWORD *)((char *)&v118[16] + 1) = *(_OWORD *)&v109[112];
  *(_OWORD *)((char *)&v118[18] + 1) = *(_OWORD *)&v109[128];
  *(_OWORD *)((char *)&v118[6] + 1) = *(_OWORD *)&v109[32];
  *(_OWORD *)((char *)&v118[8] + 1) = *(_OWORD *)&v109[48];
  *(_OWORD *)((char *)&v118[10] + 1) = *(_OWORD *)&v109[64];
  v118[0] = v101;
  v118[1] = 0;
  LOBYTE(v118[2]) = (_BYTE)v100;
  *(void *)((char *)&v118[26] + 1) = *(void *)&v109[192];
  *(_OWORD *)((char *)&v118[4] + 1) = *(_OWORD *)&v109[16];
  *(_DWORD *)((char *)&v118[27] + 1) = *(_DWORD *)v115;
  HIDWORD(v118[27]) = *(_DWORD *)&v115[3];
  v118[28] = v95;
  LOBYTE(v118[29]) = v92;
  *(_DWORD *)((char *)&v118[29] + 1) = *(_DWORD *)v113;
  HIDWORD(v118[29]) = *(_DWORD *)&v113[3];
  v118[30] = v96;
  LOBYTE(v118[31]) = v93;
  *(_DWORD *)((char *)&v118[31] + 1) = *(_DWORD *)v111;
  HIDWORD(v118[31]) = *(_DWORD *)&v111[3];
  v118[32] = v99;
  v118[33] = v98;
  LOBYTE(v118[34]) = v94;
  *(_DWORD *)((char *)&v118[34] + 1) = *(_DWORD *)v117;
  HIDWORD(v118[34]) = *(_DWORD *)&v117[3];
  memset(&v118[35], 0, 32);
  LOBYTE(v118[39]) = v54;
  memcpy(&v67[v73], v118, 0x139uLL);
  uint64_t v74 = &v67[v68[20]];
  *(void *)uint64_t v74 = 0;
  v74[8] = 1;
  sub_2477129D0(v60, (uint64_t)&v67[v68[24]], &qword_26925FE10);
  id v75 = &v67[v68[28]];
  *(void *)id v75 = 0;
  v75[8] = 1;
  uint64_t v76 = v89;
  sub_247712A90(v89, v70, v66);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24774D288((uint64_t)v118);
  sub_247712A34(v103, &qword_26925FE10);
  uint64_t v77 = *(void (**)(char *, uint64_t))(v105 + 8);
  uint64_t v78 = v106;
  v77(v104, v106);
  sub_247712A34(v60, &qword_26925FE10);
  long long v131 = *(_OWORD *)&v109[144];
  long long v132 = *(_OWORD *)&v109[160];
  long long v133 = *(_OWORD *)&v109[176];
  long long v127 = *(_OWORD *)&v109[80];
  long long v128 = *(_OWORD *)&v109[96];
  long long v129 = *(_OWORD *)&v109[112];
  long long v130 = *(_OWORD *)&v109[128];
  long long v123 = *(_OWORD *)&v109[16];
  long long v124 = *(_OWORD *)&v109[32];
  long long v125 = *(_OWORD *)&v109[48];
  long long v126 = *(_OWORD *)&v109[64];
  uint64_t v119 = v101;
  uint64_t v120 = 0;
  char v121 = (char)v100;
  uint64_t v134 = *(void *)&v109[192];
  long long v122 = *(_OWORD *)v109;
  *(_DWORD *)unint64_t v135 = *(_DWORD *)v115;
  *(_DWORD *)&v135[3] = *(_DWORD *)&v115[3];
  uint64_t v136 = v95;
  char v137 = v92;
  *(_DWORD *)uint64_t v138 = *(_DWORD *)v113;
  *(_DWORD *)&v138[3] = *(_DWORD *)&v113[3];
  unint64_t v139 = v96;
  char v140 = v93;
  *(_DWORD *)uint64_t v141 = *(_DWORD *)v111;
  *(_DWORD *)&v141[3] = *(_DWORD *)&v111[3];
  uint64_t v142 = v99;
  uint64_t v143 = v98;
  char v144 = v94;
  *(_DWORD *)uint64_t v145 = *(_DWORD *)v117;
  *(_DWORD *)&v145[3] = *(_DWORD *)&v117[3];
  long long v146 = 0u;
  long long v147 = 0u;
  char v148 = (char)v86;
  sub_24774D2D4((uint64_t)&v119);
  sub_247712AA0(v76, v90, v66);
  swift_release();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v77)(v102, v78);
}

double sub_24774AF18@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  BOOL v16 = v17 > 0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  char v2 = v17;
  uint64_t v21 = 0x4040000000000000;
  sub_247750918();
  uint64_t v3 = v17;
  uint64_t v4 = v18;
  char v5 = sub_2477506B8();
  sub_24774B104((uint64_t)&v17);
  uint64_t v6 = v17;
  uint64_t v7 = v18;
  char v8 = v19;
  char v9 = v20;
  sub_24774B288((uint64_t)&v17);
  uint64_t v10 = v17;
  uint64_t v11 = v18;
  char v12 = v19;
  char v13 = v20;
  char v14 = sub_2477506C8();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v16;
  *(unsigned char *)(a1 + 17) = v2;
  *(unsigned char *)(a1 + 24) = v5;
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(unsigned char *)(a1 + 64) = 1;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 1;
  *(void *)(a1 + 88) = v6;
  *(void *)(a1 + 96) = v7;
  *(unsigned char *)(a1 + 104) = v8;
  *(unsigned char *)(a1 + 105) = v9;
  *(void *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 120) = 1;
  *(void *)(a1 + 128) = v10;
  *(void *)(a1 + 136) = v11;
  *(unsigned char *)(a1 + 144) = v12;
  *(unsigned char *)(a1 + 145) = v13;
  *(unsigned char *)(a1 + 152) = v14;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(unsigned char *)(a1 + 192) = 1;
  return result;
}

double sub_24774B104@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)&v4 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_247750218();
    swift_release();
    swift_release();
    swift_release();
    char v2 = 1;
  }
  else
  {
    char v2 = 0;
  }
  sub_247750918();
  double result = v4;
  *(double *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(void *)&v4 > 1;
  *(unsigned char *)(a1 + 17) = v2;
  return result;
}

double sub_24774B288@<D0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)&v4 == 2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_247750218();
    swift_release();
    swift_release();
    swift_release();
    char v2 = 2;
  }
  else
  {
    char v2 = 0;
  }
  sub_247750918();
  double result = v4;
  *(double *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(void *)&v4 == 3;
  *(unsigned char *)(a1 + 17) = v2;
  return result;
}

__n128 sub_24774B40C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_247750C78();
    uint64_t v23 = (void *)sub_247750658();
    sub_247750128();
  }
  sub_2477503B8();
  sub_2477129D0(v13, a9, &qword_26925FD88);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925FD90) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  uint64_t v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_24774B5CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();

  return sub_247750958();
}

uint64_t sub_24774B674(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain_n();
  sub_247750228();
  uint64_t v3 = (void *)(a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allSuccessfulEnrollments);
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x263F8EE78];
  *uint64_t v3 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)(a2 + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_allCollectedEnrollments);
  swift_beginAccess();
  void *v5 = v4;
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750228();
  return sub_24773A5A4();
}

uint64_t sub_24774B7A8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (v1 == 3)
  {
    swift_retain();
    sub_24772E4C8();
    swift_release();
    swift_retain();
    sub_24772F310();
    return swift_release();
  }
  return result;
}

uint64_t sub_24774B85C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  *(void *)a1 = sub_2477504A8();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FD70);
  return sub_247749950(v4, v3, a1 + *(int *)(v5 + 44));
}

uint64_t sub_24774B8C0()
{
  return sub_24774B5CC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24774B8C8()
{
  return sub_24774D960(&qword_26925FDC8, &qword_26925FD88, (void (*)(void))sub_24774B8F8);
}

unint64_t sub_24774B8F8()
{
  unint64_t result = qword_26925FDD0;
  if (!qword_26925FDD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FD80);
    sub_247712AEC(&qword_26925FDD8, &qword_26925FD78);
    sub_247712AEC(&qword_26925FDE0, &qword_26925FDE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FDD0);
  }
  return result;
}

uint64_t sub_24774B9BC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24774B9F4()
{
  swift_retain();
  sub_24772DA04();

  return swift_release();
}

uint64_t sub_24774BA34()
{
  return sub_24774B674(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24774BA3C()
{
  return sub_24774B7A8();
}

uint64_t sub_24774BA44()
{
  return sub_24774D960(&qword_26925FDF8, &qword_26925FDA8, (void (*)(void))sub_24774BA74);
}

unint64_t sub_24774BA74()
{
  unint64_t result = qword_26925FE00;
  if (!qword_26925FE00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FDA0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FD90);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925F238);
    sub_24774D960(&qword_26925FDC0, &qword_26925FD90, (void (*)(void))sub_24774B8C8);
    sub_247712AEC(&qword_26925F248, &qword_26925F238);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FE00);
  }
  return result;
}

void *sub_24774BBA8@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  int v67 = a2;
  uint64_t v66 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE90);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE98);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v65 = (uint64_t)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FEA0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FEA8);
  MEMORY[0x270FA5388](v62);
  uint64_t v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FEB0);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  char v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v52 - v20;
  double v98 = a4;
  uint64_t v61 = a1;
  uint64_t v99 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925FEB8);
  sub_247750928();
  uint64_t v63 = v11;
  uint64_t v64 = v16;
  if ((v70 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    __int16 v22 = v67;
    if (v67)
    {
      uint64_t v24 = sub_2477508D8();
    }
    else if ((v67 & 0x100) != 0)
    {
      uint64_t v24 = sub_2477508A8();
    }
    else
    {
      id v23 = objc_msgSend(self, sel_secondarySystemFillColor);
      uint64_t v24 = MEMORY[0x24C55B890](v23);
    }
    uint64_t v57 = v24;
    sub_2477502D8();
    double v26 = v88;
    uint64_t v27 = v89;
    uint64_t v28 = v90;
    uint64_t v54 = v91;
    uint64_t v29 = v92;
    uint64_t v30 = sub_2477509B8();
    uint64_t v59 = v8;
    uint64_t v60 = v21;
    uint64_t v58 = v15;
    uint64_t v55 = v31;
    uint64_t v56 = v30;
    if (v22)
    {
      uint64_t v33 = sub_2477508D8();
    }
    else if ((v22 & 0x100) != 0)
    {
      uint64_t v33 = sub_2477508A8();
    }
    else
    {
      id v32 = objc_msgSend(self, sel_secondarySystemFillColor);
      uint64_t v33 = MEMORY[0x24C55B890](v32);
    }
    uint64_t v53 = v33;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v35 = sub_2477509B8();
    uint64_t v37 = v36;
    double v98 = a4;
    uint64_t v38 = v61;
    uint64_t v99 = v61;
    sub_247750928();
    double v98 = a4;
    uint64_t v99 = v38;
    sub_247750928();
    sub_2477509B8();
    sub_247750308();
    LOBYTE(v69[0]) = v94;
    v68[0] = v96;
    *(double *)&long long v70 = v26 * 0.5;
    *((double *)&v70 + 1) = v26;
    uint64_t v71 = v27;
    uint64_t v72 = v28;
    uint64_t v73 = v54;
    uint64_t v74 = v29;
    uint64_t v75 = v57;
    __int16 v76 = 256;
    uint64_t v77 = v56;
    uint64_t v78 = v55;
    uint64_t v79 = KeyPath;
    uint64_t v80 = v53;
    uint64_t v81 = v35;
    uint64_t v82 = v37;
    uint64_t v83 = v93;
    char v84 = v94;
    uint64_t v85 = v95;
    char v86 = v96;
    long long v87 = v97;
    nullsub_1(&v70);
    sub_247715F70((uint64_t)&v70, (uint64_t)&v98, &qword_26925FEC0);
    char v8 = v59;
    uint64_t v21 = v60;
    __int16 v25 = v67;
    uint64_t v15 = v58;
  }
  else
  {
    sub_24774D84C(&v70);
    sub_247715F70((uint64_t)&v70, (uint64_t)&v98, &qword_26925FEC0);
    __int16 v25 = v67;
  }
  uint64_t v39 = v65;
  sub_24774C25C(v25 & 0x101, v65);
  uint64_t v40 = sub_2477506F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v8, 1, 1, v40);
  uint64_t v41 = sub_247750718();
  sub_247712A34((uint64_t)v8, &qword_26925FE90);
  uint64_t v42 = swift_getKeyPath();
  sub_2477129D0(v39, (uint64_t)v13, &qword_26925FE98);
  unsigned __int8 v43 = (uint64_t *)&v13[*(int *)(v63 + 36)];
  uint64_t *v43 = v42;
  v43[1] = v41;
  sub_247712A34(v39, &qword_26925FE98);
  LOBYTE(v41) = sub_247750688();
  sub_2477129D0((uint64_t)v13, (uint64_t)v15, &qword_26925FEA0);
  id v44 = &v15[*(int *)(v62 + 36)];
  *id v44 = v41;
  *(_OWORD *)(v44 + 8) = 0u;
  *(_OWORD *)(v44 + 24) = 0u;
  v44[40] = 1;
  sub_247712A34((uint64_t)v13, &qword_26925FEA0);
  uint64_t v45 = sub_2477509B8();
  unint64_t v47 = v46;
  sub_2477129D0((uint64_t)v15, (uint64_t)v19, &qword_26925FEA8);
  uint64_t v48 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v19[*(int *)(v64 + 36)];
  *uint64_t v48 = sub_24774C7FC;
  v48[1] = 0;
  void v48[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v45;
  void v48[3] = v47;
  sub_247712A34((uint64_t)v15, &qword_26925FEA8);
  sub_247715F70((uint64_t)v19, (uint64_t)v21, &qword_26925FEB0);
  sub_247715F70((uint64_t)&v98, (uint64_t)v68, &qword_26925FEC0);
  sub_2477129D0((uint64_t)v21, (uint64_t)v19, &qword_26925FEB0);
  sub_247715F70((uint64_t)v68, (uint64_t)v69, &qword_26925FEC0);
  uint64_t v49 = v66;
  sub_247715F70((uint64_t)v69, v66, &qword_26925FEC0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FEC8);
  sub_2477129D0((uint64_t)v19, v49 + *(int *)(v50 + 48), &qword_26925FEB0);
  sub_24774D780(v69, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24774D720);
  sub_247712A34((uint64_t)v21, &qword_26925FEB0);
  sub_247712A34((uint64_t)v19, &qword_26925FEB0);
  sub_247715F70((uint64_t)v68, (uint64_t)&v70, &qword_26925FEC0);
  return sub_24774D780(&v70, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24774D7EC);
}

uint64_t sub_24774C25C@<X0>(__int16 a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4E8);
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v38 - v8;
  uint64_t v10 = sub_247750A48();
  uint64_t v43 = *(void *)(v10 - 8);
  uint64_t v44 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_247750A28();
  uint64_t v41 = *(void *)(v13 - 8);
  uint64_t v42 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2477503D8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = v18;
  if (a1)
  {
    uint64_t v39 = a2;
    uint64_t v40 = (char *)v4;
LABEL_6:
    uint64_t v29 = sub_247750908();
    uint64_t v30 = sub_2477508E8();
    uint64_t v47 = v29;
    uint64_t v48 = v30;
    sub_247750708();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4F8);
    sub_24771E320();
    sub_247750798();
    swift_release();
    swift_release();
    sub_247750A18();
    sub_247750A38();
    sub_24774DAAC(&qword_26925FED0, MEMORY[0x263F1BBC8]);
    uint64_t v31 = v42;
    sub_2477503C8();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v44);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v15, v31);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE98);
    a2 = v39;
    uint64_t v34 = (uint64_t *)(v39 + *(int *)(v33 + 36));
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FED8);
    uint64_t v24 = v45;
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))((char *)v34 + *(int *)(v35 + 28), v20, v45);
    uint64_t *v34 = KeyPath;
    uint64_t v4 = (uint64_t)v40;
    goto LABEL_7;
  }
  if ((a1 & 0x100) != 0)
  {
    uint64_t v39 = a2;
    uint64_t v40 = (char *)v4;
    goto LABEL_6;
  }
  uint64_t v21 = sub_247750908();
  uint64_t v39 = v21;
  uint64_t v22 = sub_2477508C8();
  uint64_t v40 = v9;
  uint64_t v47 = v21;
  uint64_t v48 = v22;
  sub_247750708();
  v38[1] = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F4F8);
  sub_24771E320();
  uint64_t v24 = v45;
  sub_247750798();
  swift_release();
  swift_release();
  sub_247750A18();
  sub_247750A38();
  sub_24774DAAC(&qword_26925FED0, MEMORY[0x263F1BBC8]);
  uint64_t v25 = v42;
  sub_2477503C8();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v44);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v15, v25);
  uint64_t v26 = swift_getKeyPath();
  uint64_t v27 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925FE98) + 36));
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FED8);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))((char *)v27 + *(int *)(v28 + 28), v20, v24);
  uint64_t *v27 = v26;
  uint64_t v7 = v40;
LABEL_7:
  uint64_t v36 = v46;
  (*(void (**)(uint64_t, char *, uint64_t))(v46 + 16))(a2, v7, v4);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v7, v4);
}

uint64_t sub_24774C7FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2477508C8();
  *a1 = result;
  return result;
}

void *sub_24774C824@<X0>(uint64_t *a1@<X8>)
{
  double v3 = *(double *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  unsigned int v5 = *(unsigned __int8 *)(v1 + 16);
  int v6 = *(unsigned __int8 *)(v1 + 17);
  *a1 = sub_2477509B8();
  a1[1] = v7;
  uint64_t v8 = (uint64_t)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925FE88) + 44);
  if (v6) {
    int v9 = 256;
  }
  else {
    int v9 = 0;
  }
  return sub_24774BBA8(v4, v9 | v5, v8, v3);
}

uint64_t sub_24774C89C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D1>)
{
  uint64_t v6 = sub_2477503A8();
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  int v9 = (_OWORD *)((char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE70);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FE78);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (char *)v9 + *(int *)(v7 + 28);
  uint64_t v19 = *MEMORY[0x263F19860];
  uint64_t v20 = sub_247750518();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  __asm { FMOV            V0.2D, #3.0 }
  *int v9 = _Q0;
  uint64_t KeyPath = swift_getKeyPath();
  sub_247715EB0((uint64_t)v9, (uint64_t)v13);
  uint64_t v27 = (uint64_t *)&v13[*(int *)(v11 + 44)];
  uint64_t *v27 = KeyPath;
  v27[1] = a1;
  swift_retain();
  sub_247715F14((uint64_t)v9);
  sub_2477509B8();
  sub_247750308();
  sub_2477129D0((uint64_t)v13, (uint64_t)v17, &qword_26925FE70);
  uint64_t v28 = &v17[*(int *)(v15 + 44)];
  long long v29 = v33[1];
  *(_OWORD *)uint64_t v28 = v33[0];
  *((_OWORD *)v28 + 1) = v29;
  *((_OWORD *)v28 + 2) = v33[2];
  sub_247712A34((uint64_t)v13, &qword_26925FE70);
  uint64_t v30 = sub_2477509F8();
  sub_2477129D0((uint64_t)v17, a2, &qword_26925FE78);
  uint64_t v31 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26925FE80) + 36);
  *(void *)uint64_t v31 = v30;
  *(double *)(v31 + 8) = a3;
  return sub_247712A34((uint64_t)v17, &qword_26925FE78);
}

uint64_t sub_24774CB20@<X0>(uint64_t a1@<X8>)
{
  return sub_24774C89C(*(void *)(v1 + 16), a1, *(double *)(v1 + 8));
}

uint64_t sub_24774CB2C(uint64_t a1)
{
  uint64_t v2 = sub_2477503D8();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_247750418();
}

uint64_t sub_24774CBF4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247750428();
  *a1 = result;
  return result;
}

uint64_t sub_24774CC20()
{
  return sub_247750438();
}

uint64_t sub_24774CC48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247750448();
  *a1 = result;
  return result;
}

uint64_t sub_24774CC74()
{
  return sub_247750458();
}

uint64_t sub_24774CCA0()
{
  uint64_t v0 = sub_2477504E8();
  uint64_t v1 = MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  MEMORY[0x270FA5388](v2);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_247750218();
  swift_release();
  swift_release();
  swift_release();
  sub_2477504D8();
  sub_2477504C8();
  swift_beginAccess();
  type metadata accessor for AdaptiveVoiceShortcut();
  swift_bridgeObjectRetain();
  sub_2477504B8();
  swift_bridgeObjectRelease();
  sub_2477504C8();
  return sub_247750508();
}

uint64_t sub_24774CF9C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_247750428();
  *a1 = result;
  return result;
}

uint64_t sub_24774CFC8()
{
  return sub_247750438();
}

uint64_t sub_24774CFF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_247750448();
  *a1 = result;
  return result;
}

uint64_t sub_24774D01C()
{
  return sub_247750458();
}

unint64_t sub_24774D048()
{
  unint64_t result = qword_26925FE30;
  if (!qword_26925FE30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FE20);
    sub_24774D0E8();
    sub_247712AEC(&qword_26925F310, &qword_26925F318);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FE30);
  }
  return result;
}

unint64_t sub_24774D0E8()
{
  unint64_t result = qword_26925FE38;
  if (!qword_26925FE38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FE18);
    sub_24771FA88();
    sub_247712AEC(&qword_26925F2E8, &qword_26925F2F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FE38);
  }
  return result;
}

unint64_t sub_24774D188()
{
  unint64_t result = qword_26925FAB8;
  if (!qword_26925FAB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26925FAB8);
  }
  return result;
}

uint64_t sub_24774D1D0@<X0>(float *a1@<X0>, uint64_t a2@<X8>)
{
  double v3 = fminf((float)(*a1 * 80.0) + 4.4444, 80.0);
  uint64_t result = sub_2477508B8();
  *(void *)a2 = 0x4008000000000000;
  *(double *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = result;
  return result;
}

unint64_t sub_24774D234()
{
  unint64_t result = qword_26925FE50;
  if (!qword_26925FE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FE50);
  }
  return result;
}

uint64_t sub_24774D288(uint64_t a1)
{
  return a1;
}

uint64_t sub_24774D2D4(uint64_t a1)
{
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for WaveformCell(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t destroy for WaveformCell()
{
  return swift_release();
}

void *assignWithCopy for WaveformCell(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for WaveformCell(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WaveformCell(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WaveformCell(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WaveformCell()
{
  return &type metadata for WaveformCell;
}

uint64_t sub_24774D498(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for RecordingCircleView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RecordingCircleView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for RecordingCircleView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for RecordingCircleView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RecordingCircleView()
{
  return &type metadata for RecordingCircleView;
}

uint64_t sub_24774D654()
{
  return sub_247712AEC(&qword_26925FE60, &qword_26925FE68);
}

uint64_t sub_24774D690()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24774D6AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24774D6C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2477503E8();
  *a1 = result;
  return result;
}

uint64_t sub_24774D6F4()
{
  return sub_2477503F8();
}

uint64_t sub_24774D720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

void *sub_24774D780(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19]);
  return a1;
}

uint64_t sub_24774D7EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

double sub_24774D84C(_OWORD *a1)
{
  double result = 0.0;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_24774D868()
{
  return sub_247750408();
}

unint64_t sub_24774D894()
{
  unint64_t result = qword_26925FEE0;
  if (!qword_26925FEE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FE80);
    sub_24774D960(&qword_26925FEE8, &qword_26925FE78, (void (*)(void))sub_24774D9DC);
    sub_247712AEC(&qword_26925FF10, &qword_26925FF18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FEE0);
  }
  return result;
}

uint64_t sub_24774D960(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_24774D9DC()
{
  unint64_t result = qword_26925FEF0;
  if (!qword_26925FEF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FE70);
    sub_24774DAAC(&qword_26925FEF8, MEMORY[0x263F19048]);
    sub_247712AEC(&qword_26925FF00, &qword_26925FF08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FEF0);
  }
  return result;
}

uint64_t sub_24774DAAC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24774DAF4()
{
  return sub_247712AEC(&qword_26925FF20, &qword_26925FF28);
}

uint64_t destroy for AVSAudioDonationView()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for AVSAudioDonationView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AVSAudioDonationView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for AVSAudioDonationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AVSAudioDonationView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AVSAudioDonationView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AVSAudioDonationView()
{
  return &type metadata for AVSAudioDonationView;
}

uint64_t sub_24774DD30()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24774DD4C@<X0>(uint64_t a1@<X0>, int a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v48 = a3;
  int v47 = a2;
  uint64_t v55 = a4;
  uint64_t v5 = sub_2477500F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F158);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v49 = (char *)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF30);
  uint64_t v53 = *(void *)(v11 - 8);
  uint64_t v54 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v52 = (char *)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF38);
  MEMORY[0x270FA5388](v50);
  uint64_t v51 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v14 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v15 = (id)qword_269262028;
  }
  else
  {
    id v15 = objc_msgSend(self, sel_mainBundle);
    uint64_t v14 = 0;
  }
  id v16 = v14;
  uint64_t v44 = 0x8000000247754BF0;
  uint64_t v17 = sub_24774FE68();
  v46[3] = v18;
  v46[4] = v17;

  uint64_t v19 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v20 = (id)qword_269262028;
  }
  else
  {
    id v20 = objc_msgSend(self, sel_mainBundle);
    uint64_t v19 = 0;
  }
  id v21 = v19;
  uint64_t v44 = 0x8000000247754BF0;
  uint64_t v22 = sub_24774FE68();
  v46[0] = v23;
  v46[1] = v22;

  v46[2] = v46;
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v26 = v48;
  MEMORY[0x270FA5388](v25);
  uint64_t v42 = a1;
  uint64_t OpaqueTypeConformance2 = v27;
  LOBYTE(v44) = v28;
  uint64_t v45 = v26;
  uint64_t v56 = MEMORY[0x263F8EE78];
  sub_24774F890(&qword_26925F180, MEMORY[0x263F22110]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F188);
  sub_247712AEC(&qword_26925F190, &qword_26925F188);
  sub_247750D68();
  sub_247750988();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF40);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF48);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FF50);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FF58);
  unint64_t v33 = sub_24774F768();
  uint64_t v34 = sub_247712AEC(&qword_26925FF70, &qword_26925FF58);
  uint64_t v56 = v31;
  uint64_t v57 = v32;
  unint64_t v58 = v33;
  uint64_t v59 = v34;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v44 = sub_247712AEC(&qword_26925FF78, &qword_26925FF48);
  v41[1] = v29;
  uint64_t v42 = v30;
  v41[0] = v41;
  uint64_t v35 = v52;
  sub_2477500E8();
  uint64_t v37 = v53;
  uint64_t v36 = v54;
  uint64_t v38 = (uint64_t)v51;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v51, v35, v54);
  uint64_t v39 = (void *)(v38 + *(int *)(v50 + 36));
  void *v39 = 0;
  v39[1] = 0;
  v39[2] = sub_24774F6FC;
  v39[3] = 0;
  (*(void (**)(char *, uint64_t))(v37 + 8))(v35, v36);
  return sub_24774F814(v38, v55);
}

uint64_t sub_24774E36C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v40 = a4;
  uint64_t v41 = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF90);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_247750108();
  uint64_t v11 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF50);
  MEMORY[0x270FA5388](v14);
  uint64_t v39 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF40);
  uint64_t v37 = *(void *)(v16 - 8);
  uint64_t v38 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v36 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v18 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v19 = (id)qword_269262028;
  }
  else
  {
    id v19 = objc_msgSend(self, sel_mainBundle);
    uint64_t v18 = 0;
  }
  id v20 = v18;
  sub_24774FE68();

  uint64_t v21 = sub_247750248();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v10, 1, 1, v21);
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = a1;
  *(void *)(v22 + 24) = a2;
  uint64_t v34 = a1;
  uint64_t v23 = a2;
  char v24 = a3 & 1;
  *(unsigned char *)(v22 + 32) = a3 & 1;
  uint64_t v25 = v40;
  *(void *)(v22 + 40) = v40;
  swift_retain();
  swift_retain();
  sub_247750118();
  char v26 = sub_247750688();
  uint64_t v27 = (uint64_t)v39;
  uint64_t v28 = v35;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v39, v13, v35);
  uint64_t v29 = v27 + *(int *)(v14 + 36);
  *(unsigned char *)uint64_t v29 = v26;
  *(_OWORD *)(v29 + 8) = 0u;
  *(_OWORD *)(v29 + 24) = 0u;
  *(unsigned char *)(v29 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v28);
  char v42 = v24;
  uint64_t v43 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925F340);
  sub_247750948();
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v34;
  *(void *)(v30 + 24) = v23;
  *(unsigned char *)(v30 + 32) = v24;
  *(void *)(v30 + 40) = v25;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF58);
  sub_24774F768();
  sub_247712AEC(&qword_26925FF70, &qword_26925FF58);
  uint64_t v31 = v36;
  sub_247750848();
  swift_release();
  swift_release();
  swift_release();
  sub_24774F90C(v27);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v41, v31, v38);
}

uint64_t sub_24774E86C()
{
  return sub_247750348();
}

uint64_t sub_24774E958@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v24 = a3;
  uint64_t v23 = a1;
  uint64_t v26 = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F238);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF98);
  uint64_t v11 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
  if (qword_26925F140 != -1) {
    swift_once();
  }
  uint64_t v14 = (void *)qword_269262028;
  if (qword_269262028)
  {
    id v15 = (id)qword_269262028;
  }
  else
  {
    id v15 = objc_msgSend(self, sel_mainBundle);
    uint64_t v14 = 0;
  }
  id v16 = v14;
  uint64_t v17 = sub_24774FE68();
  uint64_t v19 = v18;

  uint64_t v27 = v17;
  uint64_t v28 = v19;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v23;
  *(void *)(v20 + 24) = a2;
  *(unsigned char *)(v20 + 32) = v24 & 1;
  *(void *)(v20 + 40) = a4;
  sub_247715DE0();
  swift_retain();
  swift_retain();
  sub_247750968();
  sub_24774F97C();
  sub_247712AEC(&qword_26925F248, &qword_26925F238);
  sub_2477507F8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(v26, v13, v25);
}

uint64_t sub_24774EC8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = sub_247750548();
  *(void *)(a5 + 8) = 0;
  *(unsigned char *)(a5 + 16) = 1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF80);
  sub_24774ED54(a1, a2, a3, a4, (char *)(a5 + *(int *)(v10 + 44)));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF48);
  uint64_t v12 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);

  return v12(a5, 0, 1, v11);
}

uint64_t sub_24774ED54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  char v6 = a3;
  int v47 = a3;
  uint64_t v46 = a1;
  uint64_t v52 = a5;
  uint64_t v9 = sub_2477505B8();
  uint64_t v50 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1B8);
  uint64_t v49 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v51 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v41 - v15;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1C0);
  uint64_t v54 = *(void *)(v48 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v48);
  uint64_t v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v53 = (char *)&v41 - v20;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a1;
  *(void *)(v21 + 24) = a2;
  uint64_t v43 = a2;
  *(unsigned char *)(v21 + 32) = v6;
  *(void *)(v21 + 40) = a4;
  swift_retain();
  swift_retain();
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925F1C8);
  unint64_t v44 = sub_247712820();
  sub_247750958();
  sub_2477505A8();
  sub_247712AEC(&qword_26925F1E8, &qword_26925F1B8);
  sub_24774F890(&qword_26925F1F0, MEMORY[0x263F1A3B8]);
  uint64_t v22 = v16;
  sub_2477507B8();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v11, v9);
  uint64_t v23 = v49;
  uint64_t v50 = *(void *)(v49 + 8);
  int v24 = v16;
  uint64_t v25 = v12;
  ((void (*)(char *, uint64_t))v50)(v24, v12);
  uint64_t v27 = v53;
  uint64_t v26 = v54;
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v54 + 32);
  id v29 = v19;
  char v42 = v19;
  uint64_t v30 = v19;
  uint64_t v31 = v48;
  v28(v53, v30, v48);
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = v46;
  *(void *)(v32 + 24) = v43;
  *(unsigned char *)(v32 + 32) = v47;
  *(void *)(v32 + 40) = a4;
  swift_retain();
  swift_retain();
  uint64_t v41 = v22;
  sub_247750958();
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  v33(v29, v27, v31);
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
  uint64_t v35 = v51;
  v34(v51, v22, v25);
  uint64_t v36 = v52;
  v33(v52, v29, v31);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF88);
  v34(&v36[*(int *)(v37 + 48)], v35, v25);
  uint64_t v38 = (void (*)(char *, uint64_t))v50;
  ((void (*)(char *, uint64_t))v50)(v41, v25);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v54 + 8);
  v39(v53, v31);
  v38(v35, v25);
  return ((uint64_t (*)(char *, uint64_t))v39)(v42, v31);
}

uint64_t sub_24774F264(uint64_t a1, uint64_t a2)
{
  _AXSSetAudioDonationSiriImprovementEnabled();
  long long v3 = (void (**)(uint64_t))(a2
                                     + OBJC_IVAR____TtC22AdaptiveVoiceShortcuts20AVSCoordinatorObject_dismissEnrollmentFlow);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = swift_retain();
  v4(v5);
  return swift_release();
}

uint64_t sub_24774F2DC@<X0>(uint64_t a1@<X8>)
{
  return sub_24774F4B8((void (*)(uint64_t *__return_ptr))sub_24774F2F4, a1);
}

uint64_t sub_24774F2F4@<X0>(uint64_t a1@<X8>)
{
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  unint64_t v2 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v3 = objc_msgSend(self, sel_mainBundle);
  }
  id v4 = v2;
  uint64_t v5 = sub_247750758();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  uint64_t v10 = sub_247750748();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_247712AA0(v5, v7, v9);
  swift_bridgeObjectRelease();
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v12;
  *(unsigned char *)(a1 + 32) = v16;
  *(void *)(a1 + 40) = v14;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  sub_247712A90(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_247712AA0(v10, v12, v16);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24774F4A0@<X0>(uint64_t a1@<X8>)
{
  return sub_24774F4B8((void (*)(uint64_t *__return_ptr))sub_24774F590, a1);
}

uint64_t sub_24774F4B8@<X0>(void (*a1)(uint64_t *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = sub_2477504A8();
  a1(&v18);
  uint64_t v4 = v18;
  char v5 = v19;
  uint64_t v6 = v20;
  uint64_t v7 = v21;
  char v8 = v22;
  uint64_t v9 = v23;
  uint64_t v10 = v24;
  char v11 = v25;
  LOBYTE(a1) = sub_2477506D8();
  uint64_t result = sub_247750258();
  *(void *)a2 = v17;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v4;
  *(unsigned char *)(a2 + 32) = v5;
  *(void *)(a2 + 40) = v6;
  *(void *)(a2 + 48) = v7;
  *(unsigned char *)(a2 + 56) = v8;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(unsigned char *)(a2 + 80) = v11;
  *(unsigned char *)(a2 + 88) = (_BYTE)a1;
  *(void *)(a2 + 96) = v13;
  *(void *)(a2 + 104) = v14;
  *(void *)(a2 + 112) = v15;
  *(void *)(a2 + 120) = v16;
  *(unsigned char *)(a2 + 128) = 0;
  return result;
}

uint64_t sub_24774F590@<X0>(uint64_t a1@<X8>)
{
  sub_2477504F8();
  if (qword_26925F140 != -1) {
    swift_once();
  }
  unint64_t v2 = (void *)qword_269262028;
  if (!qword_269262028) {
    id v3 = objc_msgSend(self, sel_mainBundle);
  }
  id v4 = v2;
  uint64_t v5 = sub_247750758();
  uint64_t v7 = v6;
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  char v9 = v8 & 1;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v8 & 1;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  sub_247712A90(v5, v6, v8 & 1);
  swift_bridgeObjectRetain();
  sub_247712AA0(v5, v7, v9);

  return swift_bridgeObjectRelease();
}

id sub_24774F6FC()
{
  uint64_t v0 = self;

  return objc_msgSend(v0, sel_setShouldHideAudioDonationPrompt_, 1);
}

uint64_t sub_24774F738@<X0>(uint64_t a1@<X8>)
{
  return sub_24774DD4C(*(void *)v1, *(unsigned __int8 *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_24774F748@<X0>(uint64_t a1@<X8>)
{
  return sub_24774E36C(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_24774F758@<X0>(uint64_t a1@<X8>)
{
  return sub_24774EC8C(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40), a1);
}

unint64_t sub_24774F768()
{
  unint64_t result = qword_26925FF60;
  if (!qword_26925FF60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FF50);
    sub_24774F890(&qword_26925FF68, MEMORY[0x263F22130]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FF60);
  }
  return result;
}

uint64_t sub_24774F814(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24774F880()
{
  return sub_24774F264(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24774F890(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24774F8DC()
{
  return sub_2477389F4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_24774F8F0()
{
  return sub_24774FA1C();
}

uint64_t sub_24774F8FC()
{
  return sub_24774E86C();
}

uint64_t sub_24774F90C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26925FF50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24774F96C@<X0>(uint64_t a1@<X8>)
{
  return sub_24774E958(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40), a1);
}

unint64_t sub_24774F97C()
{
  unint64_t result = qword_26925FFA0;
  if (!qword_26925FFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FFA0);
  }
  return result;
}

uint64_t objectdestroyTm_2()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24774FA14()
{
  return sub_24774FA1C();
}

uint64_t sub_24774FA1C()
{
  return sub_247750938();
}

ValueMetadata *type metadata accessor for PrivacyPresenterBridge()
{
  return &type metadata for PrivacyPresenterBridge;
}

unint64_t sub_24774FA84()
{
  unint64_t result = qword_26925FFA8;
  if (!qword_26925FFA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26925FF38);
    sub_247712AEC(&qword_26925FFB0, &qword_26925FF30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FFA8);
  }
  return result;
}

id sub_24774FB28(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)sub_247750AF8();
  id v3 = objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v2);

  if (v3)
  {
    id result = objc_msgSend(v3, sel_splashController);
    if (result)
    {
      id v5 = result;

      return v5;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    return a2;
  }
  return result;
}

id sub_24774FBF0(uint64_t a1)
{
  return sub_24774FB28(a1, *v1);
}

uint64_t sub_24774FC04()
{
  return sub_2477505E8();
}

uint64_t sub_24774FC40()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_24774FC4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24774FD3C();

  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_24774FCB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_24774FD3C();

  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_24774FD14()
{
}

unint64_t sub_24774FD3C()
{
  unint64_t result = qword_26925FFB8;
  if (!qword_26925FFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26925FFB8);
  }
  return result;
}

void __getAXPISystemActionHelperClass_block_invoke_cold_1()
{
}

uint64_t sub_24774FDB8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24774FDC8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24774FDD8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24774FDE8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24774FDF8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24774FE08()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24774FE18()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_24774FE28()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_24774FE38()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_24774FE48()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_24774FE58()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_24774FE68()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_24774FE78()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24774FE88()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_24774FE98()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_24774FEA8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24774FEB8()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_24774FEC8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24774FED8()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_24774FEE8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24774FEF8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_24774FF08()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_24774FF18()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24774FF28()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_24774FF38()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24774FF48()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24774FF58()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24774FF68()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24774FF78()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_24774FF88()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24774FF98()
{
  return MEMORY[0x270F84468]();
}

uint64_t sub_24774FFA8()
{
  return MEMORY[0x270F84470]();
}

uint64_t sub_24774FFB8()
{
  return MEMORY[0x270F84478]();
}

uint64_t sub_24774FFC8()
{
  return MEMORY[0x270F84480]();
}

uint64_t sub_24774FFD8()
{
  return MEMORY[0x270F84488]();
}

uint64_t sub_24774FFE8()
{
  return MEMORY[0x270F84490]();
}

uint64_t sub_24774FFF8()
{
  return MEMORY[0x270F84498]();
}

uint64_t sub_247750008()
{
  return MEMORY[0x270F844A0]();
}

uint64_t sub_247750018()
{
  return MEMORY[0x270F844A8]();
}

uint64_t sub_247750028()
{
  return MEMORY[0x270F844B0]();
}

uint64_t sub_247750038()
{
  return MEMORY[0x270F844B8]();
}

uint64_t sub_247750048()
{
  return MEMORY[0x270F844C0]();
}

uint64_t sub_247750058()
{
  return MEMORY[0x270F844C8]();
}

uint64_t sub_247750068()
{
  return MEMORY[0x270F844D0]();
}

uint64_t sub_247750078()
{
  return MEMORY[0x270F844D8]();
}

uint64_t sub_247750088()
{
  return MEMORY[0x270F844E0]();
}

uint64_t sub_247750098()
{
  return MEMORY[0x270F844E8]();
}

uint64_t sub_2477500A8()
{
  return MEMORY[0x270F844F0]();
}

uint64_t sub_2477500B8()
{
  return MEMORY[0x270F844F8]();
}

uint64_t sub_2477500C8()
{
  return MEMORY[0x270F84500]();
}

uint64_t sub_2477500D8()
{
  return MEMORY[0x270F84508]();
}

uint64_t sub_2477500E8()
{
  return MEMORY[0x270F09C60]();
}

uint64_t sub_2477500F8()
{
  return MEMORY[0x270F09C90]();
}

uint64_t sub_247750108()
{
  return MEMORY[0x270F09C98]();
}

uint64_t sub_247750118()
{
  return MEMORY[0x270F09CA0]();
}

uint64_t sub_247750128()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_247750138()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_247750148()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_247750158()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_247750168()
{
  return MEMORY[0x270EFE190]();
}

uint64_t sub_247750178()
{
  return MEMORY[0x270EFE1A8]();
}

uint64_t sub_247750188()
{
  return MEMORY[0x270EFE1B0]();
}

uint64_t sub_2477501A8()
{
  return MEMORY[0x270EFE1E0]();
}

uint64_t sub_2477501B8()
{
  return MEMORY[0x270EFE2C8]();
}

uint64_t sub_2477501C8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2477501D8()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2477501E8()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2477501F8()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_247750208()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_247750218()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_247750228()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_247750238()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_247750248()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_247750258()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_247750268()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_247750278()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_247750288()
{
  return MEMORY[0x270EFED68]();
}

uint64_t sub_247750298()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_2477502A8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2477502B8()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_2477502C8()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_2477502D8()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_2477502E8()
{
  return MEMORY[0x270EFF138]();
}

uint64_t sub_2477502F8()
{
  return MEMORY[0x270EFF158]();
}

uint64_t sub_247750308()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_247750318()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_247750328()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_247750338()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_247750348()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_247750358()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_247750368()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_247750378()
{
  return MEMORY[0x270EFFC90]();
}

uint64_t sub_247750388()
{
  return MEMORY[0x270EFFCA0]();
}

uint64_t sub_247750398()
{
  return MEMORY[0x270F001C0]();
}

uint64_t sub_2477503A8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2477503B8()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_2477503C8()
{
  return MEMORY[0x270F00780]();
}

uint64_t sub_2477503D8()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_2477503E8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2477503F8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_247750408()
{
  return MEMORY[0x270F00AF0]();
}

uint64_t sub_247750418()
{
  return MEMORY[0x270F00AF8]();
}

uint64_t sub_247750428()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_247750438()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_247750448()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_247750458()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_247750468()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_247750478()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_247750488()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_247750498()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_2477504A8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2477504B8()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_2477504C8()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_2477504D8()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_2477504E8()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_2477504F8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_247750508()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_247750518()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_247750528()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_247750538()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_247750548()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_247750558()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_247750568()
{
  return MEMORY[0x270F01980]();
}

uint64_t sub_247750578()
{
  return MEMORY[0x270F01988]();
}

uint64_t sub_247750588()
{
  return MEMORY[0x270F01998]();
}

uint64_t sub_247750598()
{
  return MEMORY[0x270F019B0]();
}

uint64_t sub_2477505A8()
{
  return MEMORY[0x270F025C8]();
}

uint64_t sub_2477505B8()
{
  return MEMORY[0x270F025E0]();
}

uint64_t sub_2477505C8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2477505D8()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2477505E8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_247750608()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_247750618()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_247750628()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_247750648()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_247750658()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_247750668()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_247750678()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_247750688()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_247750698()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2477506A8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_2477506B8()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_2477506C8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2477506D8()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_2477506E8()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_2477506F8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_247750708()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_247750718()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_247750728()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_247750738()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_247750748()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_247750758()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_247750768()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_247750778()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_247750788()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_247750798()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_2477507A8()
{
  return MEMORY[0x270F033D8]();
}

uint64_t sub_2477507B8()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_2477507C8()
{
  return MEMORY[0x270F03540]();
}

uint64_t sub_2477507D8()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2477507E8()
{
  return MEMORY[0x270F037F8]();
}

uint64_t sub_2477507F8()
{
  return MEMORY[0x270F03A58]();
}

uint64_t sub_247750808()
{
  return MEMORY[0x270F03C80]();
}

uint64_t sub_247750818()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_247750828()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_247750838()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_247750848()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_247750858()
{
  return MEMORY[0x270F040A8]();
}

uint64_t sub_247750868()
{
  return MEMORY[0x270F04140]();
}

uint64_t sub_247750878()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_247750888()
{
  return MEMORY[0x270F041B0]();
}

uint64_t sub_247750898()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_2477508A8()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_2477508B8()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2477508C8()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_2477508D8()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_2477508E8()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2477508F8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_247750908()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_247750918()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_247750928()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_247750938()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_247750948()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_247750958()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_247750968()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_247750978()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_247750988()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_247750998()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2477509A8()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_2477509B8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2477509C8()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_2477509D8()
{
  return MEMORY[0x270F050F0]();
}

uint64_t sub_2477509E8()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_2477509F8()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_247750A08()
{
  return MEMORY[0x270F052D0]();
}

uint64_t sub_247750A18()
{
  return MEMORY[0x270F054A0]();
}

uint64_t sub_247750A28()
{
  return MEMORY[0x270F054A8]();
}

uint64_t sub_247750A38()
{
  return MEMORY[0x270F054B0]();
}

uint64_t sub_247750A48()
{
  return MEMORY[0x270F054B8]();
}

uint64_t sub_247750A58()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_247750A68()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_247750A78()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_247750A88()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_247750A98()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_247750AA8()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_247750AB8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_247750AC8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_247750AD8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_247750AE8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_247750AF8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_247750B08()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_247750B18()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_247750B28()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_247750B38()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_247750B48()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_247750B58()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_247750B68()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_247750B78()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_247750B88()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_247750B98()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_247750BA8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_247750BB8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_247750BC8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_247750BD8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_247750BE8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_247750BF8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_247750C08()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_247750C18()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_247750C28()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_247750C38()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_247750C48()
{
  return MEMORY[0x270EF1C40]();
}

uint64_t sub_247750C58()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_247750C68()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_247750C78()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_247750C88()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_247750C98()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_247750CA8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_247750CB8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_247750CC8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_247750CD8()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_247750CE8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_247750CF8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_247750D08()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_247750D18()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_247750D28()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_247750D38()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_247750D48()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_247750D58()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_247750D68()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_247750D78()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_247750D88()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_247750D98()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_247750DA8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_247750DB8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_247750DC8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_247750DD8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_247750DE8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_247750DF8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_247750E08()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_247750E18()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_247750E28()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_247750E38()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_247750E48()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_247750E58()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_247750E68()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_247750E78()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_247750E88()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_247750E98()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_247750EA8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_247750EB8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_247750EC8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_247750ED8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_247750EE8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_247750EF8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_247750F08()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_247750F18()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_247750F28()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_247750F38()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_247750F48()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_247750F58()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_247750F68()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_247750F78()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_247750F88()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_247750F98()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_247750FA8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_247750FB8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_247750FC8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_247750FD8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_247750FE8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_247750FF8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_247751008()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_247751018()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_247751028()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_247751038()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AXCPSharedResourcesDirectory()
{
  return MEMORY[0x270F90508]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x270F09278]();
}

uint64_t AXLogAVS()
{
  return MEMORY[0x270F09288]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXSAudioDonationSiriImprovementEnabled()
{
  return MEMORY[0x270F905E8]();
}

uint64_t _AXSSetAudioDonationSiriImprovementEnabled()
{
  return MEMORY[0x270F909E0]();
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

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x270EDE9D0](__Log2n, *(void *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
}

void vDSP_hann_window(float *__C, vDSP_Length __N, int __Flag)
{
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vdbcon(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N, unsigned int __F)
{
}

void vDSP_vfix16(const float *__A, vDSP_Stride __IA, __int16 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}