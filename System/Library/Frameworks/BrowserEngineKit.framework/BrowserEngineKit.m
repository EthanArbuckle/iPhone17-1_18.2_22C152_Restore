uint64_t destroy for WebContentExtensionConfiguration()
{
  return swift_release();
}

uint64_t type metadata accessor for LaunchAssertionInvalidator()
{
  return self;
}

uint64_t sub_24323A540()
{
  uint64_t result = sub_243259760();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24323A648(uint64_t a1)
{
  v4 = *(int **)(v1 + 16);
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24323A500;
  v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268D8F780 + dword_268D8F780);
  return v6(a1, v4);
}

uint64_t sub_24323A700(uint64_t a1)
{
  v4 = *(int **)(v1 + 16);
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24324CB44;
  v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268D8F780 + dword_268D8F780);
  return v6(a1, v4);
}

uint64_t sub_24323A818()
{
  sub_243259C90();
  swift_bridgeObjectRelease();

  return sandbox_enable_local_state_flag();
}

uint64_t sub_24323A870()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24323A968(uint64_t a1, int *a2)
{
  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24323A870;
  return v6(a1);
}

uint64_t sub_24323AACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a8;
  v8[5] = v17;
  type metadata accessor for RenderingProcess(0);
  v8[6] = swift_task_alloc();
  uint64_t v13 = swift_task_alloc();
  v8[7] = v13;
  swift_bridgeObjectRetain();
  swift_retain();
  v14 = (void *)swift_task_alloc();
  v8[8] = v14;
  void *v14 = v8;
  v14[1] = sub_2432407A8;
  return RenderingProcess.init(bundleIdentifier:onInterruption:)(v13, a4, a5, a6, a7);
}

uint64_t sub_24323ABF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a8;
  v8[5] = v17;
  type metadata accessor for WebContentProcess(0);
  v8[6] = swift_task_alloc();
  uint64_t v13 = swift_task_alloc();
  v8[7] = v13;
  swift_bridgeObjectRetain();
  swift_retain();
  v14 = (void *)swift_task_alloc();
  v8[8] = v14;
  void *v14 = v8;
  v14[1] = sub_2432402CC;
  return WebContentProcess.init(bundleIdentifier:onInterruption:)(v13, a4, a5, a6, a7);
}

uint64_t sub_24323ADF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[4] = a8;
  v8[5] = v17;
  type metadata accessor for NetworkingProcess(0);
  v8[6] = swift_task_alloc();
  uint64_t v13 = swift_task_alloc();
  v8[7] = v13;
  swift_bridgeObjectRetain();
  swift_retain();
  v14 = (void *)swift_task_alloc();
  v8[8] = v14;
  void *v14 = v8;
  v14[1] = sub_24324051C;
  return NetworkingProcess.init(bundleIdentifier:onInterruption:)(v13, a4, a5, a6, a7);
}

uint64_t sub_24323AF14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_24323AFA8()
{
  uint64_t v1 = *(void **)(v0 + 24);

  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_24323AFEC()
{
  uint64_t result = sub_243259910();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for WebContentExtensionConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

id sub_24323B0B4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)sub_2432598E0();

  return v2;
}

uint64_t sub_24323B154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243259B90();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_243259B80();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24323B2F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_243259B50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24323B2F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24323B358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24323B4A0()
{
  if (v0[4])
  {
    id v1 = objc_allocWithZone(MEMORY[0x263F01858]);
    swift_bridgeObjectRetain();
    id v8 = sub_24323BC9C();
    char v9 = sub_24323CFC0();
    swift_bridgeObjectRelease();
    if (v9)
    {
LABEL_8:
      id v10 = v8;
      v0[28] = v10;
      uint64_t v12 = v0[26];
      uint64_t v11 = v0[27];
      uint64_t v13 = v0[25];
      uint64_t v14 = v0[23];
      uint64_t v25 = v0[24];
      uint64_t v26 = v0[22];
      uint64_t v15 = v0[21];
      uint64_t v16 = v0[19];
      uint64_t v17 = v0[17];
      uint64_t v28 = v0[16];
      uint64_t v29 = v0[18];
      uint64_t v27 = v0[20];
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F04DC0]), sel_initWithApplicationExtensionRecord_, v10);
      sub_243259950();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v11, v25);
      sub_243259930();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v26, v14, v27);
      swift_retain();
      sub_243259870();
      sub_2432598C0();
      sub_243259890();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v29, v16, v28);
      v18 = (void *)swift_task_alloc();
      v0[29] = v18;
      void *v18 = v0;
      v18[1] = sub_243240F18;
      uint64_t v19 = v0[18];
      uint64_t v20 = v0[14];
      return MEMORY[0x270EEB760](v20, v19);
    }
    goto LABEL_11;
  }
  sub_24323F8F4(0, &qword_268D8F6C8);
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForCurrentProcess);
  if (v2)
  {
    id v8 = v2;
    self;
    uint64_t v3 = (void *)swift_dynamicCastObjCClass();
    if (!v3)
    {
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v4 = v0[3];
    id v5 = objc_msgSend(v3, sel_applicationExtensionRecords);

    sub_24323F8F4(0, &qword_268D8F6D0);
    sub_243250BA8();
    uint64_t v6 = sub_243259BA0();

    sub_243252DE8(v6, v4, 0);
    id v8 = v7;
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_8;
    }
  }
LABEL_12:
  id v21 = objc_allocWithZone(MEMORY[0x263F087E8]);
  v22 = (void *)sub_243259A80();
  objc_msgSend(v21, sel_initWithDomain_code_userInfo_, v22, 1, 0);

  swift_willThrow();
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
  v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t objectdestroy_18Tm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

id sub_24323BC9C()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  id v1 = (void *)sub_243259A80();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_2432596A0();

    swift_willThrow();
  }
  return v2;
}

uint64_t WebContentProcess.init(bundleIdentifier:onInterruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = sub_243259A00();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v7 = sub_243259910();
  v5[10] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[11] = v8;
  v5[12] = *(void *)(v8 + 64);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  sub_2432598D0();
  v5[15] = swift_task_alloc();
  uint64_t v9 = sub_2432598A0();
  v5[16] = v9;
  v5[17] = *(void *)(v9 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  uint64_t v10 = sub_243259920();
  v5[20] = v10;
  v5[21] = *(void *)(v10 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  uint64_t v11 = sub_243259940();
  v5[24] = v11;
  v5[25] = *(void *)(v11 - 8);
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24323B4A0, 0, 0);
}

uint64_t RenderingProcess.init(bundleIdentifier:onInterruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = sub_243259A00();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v7 = sub_243259910();
  v5[10] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[11] = v8;
  v5[12] = *(void *)(v8 + 64);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  sub_2432598D0();
  v5[15] = swift_task_alloc();
  uint64_t v9 = sub_2432598A0();
  v5[16] = v9;
  v5[17] = *(void *)(v9 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  uint64_t v10 = sub_243259920();
  v5[20] = v10;
  v5[21] = *(void *)(v10 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  uint64_t v11 = sub_243259940();
  v5[24] = v11;
  v5[25] = *(void *)(v11 - 8);
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24323D138, 0, 0);
}

uint64_t NetworkingProcess.init(bundleIdentifier:onInterruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = sub_243259A00();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v7 = sub_243259910();
  v5[10] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[11] = v8;
  v5[12] = *(void *)(v8 + 64);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  sub_2432598D0();
  v5[15] = swift_task_alloc();
  uint64_t v9 = sub_2432598A0();
  v5[16] = v9;
  v5[17] = *(void *)(v9 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  uint64_t v10 = sub_243259920();
  v5[20] = v10;
  v5[21] = *(void *)(v10 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  uint64_t v11 = sub_243259940();
  v5[24] = v11;
  v5[25] = *(void *)(v11 - 8);
  v5[26] = swift_task_alloc();
  v5[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24323D800, 0, 0);
}

uint64_t sub_24323C740()
{
  uint64_t v17 = (void *)v0[29];
  uint64_t v14 = (void *)v0[28];
  uint64_t v25 = v0[27];
  uint64_t v23 = v0[25];
  uint64_t v24 = v0[24];
  uint64_t v22 = v0[23];
  uint64_t v21 = v0[20];
  uint64_t v18 = v0[19];
  uint64_t v19 = v0[21];
  uint64_t v15 = v0[17];
  uint64_t v16 = v0[16];
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v6 = v0[8];
  id v5 = (void *)v0[9];
  uint64_t v13 = v0[7];
  uint64_t v20 = v0[2];
  uint64_t v7 = *(void (**)(void))(v3 + 16);
  v7();
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v2, v1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v2, v4);
  void *v5 = 1;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x263F8F018], v13);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  uint64_t v10 = sub_24323E450((uint64_t)sub_243252DE4, v9, (uint64_t)v5);
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v16);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v22, v21);
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v24);
  *(void *)(v20 + *(int *)(type metadata accessor for RenderingProcess(0) + 20)) = v10;
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
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24323CA20()
{
  uint64_t v14 = (void *)v0[28];
  uint64_t v24 = v0[27];
  uint64_t v22 = v0[25];
  uint64_t v23 = v0[24];
  uint64_t v21 = v0[23];
  uint64_t v20 = v0[20];
  uint64_t v17 = v0[19];
  uint64_t v18 = v0[21];
  uint64_t v15 = v0[17];
  uint64_t v16 = v0[16];
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v6 = v0[8];
  id v5 = (void *)v0[9];
  uint64_t v13 = v0[7];
  uint64_t v19 = v0[2];
  uint64_t v7 = *(void (**)(void))(v3 + 16);
  v7();
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v2, v1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v2, v4);
  void *v5 = 1;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x263F8F018], v13);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  uint64_t v10 = sub_24323E450((uint64_t)sub_243252DE4, v9, (uint64_t)v5);
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v20);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  *(void *)(v19 + *(int *)(type metadata accessor for NetworkingProcess(0) + 20)) = v10;
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
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24323CCF0()
{
  uint64_t v14 = (void *)v0[28];
  uint64_t v24 = v0[27];
  uint64_t v22 = v0[25];
  uint64_t v23 = v0[24];
  uint64_t v21 = v0[23];
  uint64_t v20 = v0[20];
  uint64_t v17 = v0[19];
  uint64_t v18 = v0[21];
  uint64_t v15 = v0[17];
  uint64_t v16 = v0[16];
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[10];
  uint64_t v3 = v0[11];
  uint64_t v6 = v0[8];
  id v5 = (void *)v0[9];
  uint64_t v13 = v0[7];
  uint64_t v19 = v0[2];
  uint64_t v7 = *(void (**)(void))(v3 + 16);
  v7();
  ((void (*)(uint64_t, uint64_t, uint64_t))v7)(v2, v1, v4);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v2, v4);
  void *v5 = 1;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v5, *MEMORY[0x263F8F018], v13);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  uint64_t v10 = sub_24323E450((uint64_t)sub_243252DE4, v9, (uint64_t)v5);
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v20);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v23);
  *(void *)(v19 + *(int *)(type metadata accessor for WebContentProcess(0) + 20)) = v10;
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
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24323CFC0()
{
  id v1 = objc_msgSend(v0, sel_extensionPointRecord);
  id v2 = objc_msgSend(v1, sel_identifier);

  uint64_t v3 = sub_243259A90();
  uint64_t v5 = v4;

  if (v3 == 0xD000000000000024 && v5 == 0x800000024325D040) {
    goto LABEL_3;
  }
  char v6 = sub_243259D20();
  swift_bridgeObjectRelease();
  if (v6) {
    return 1;
  }
  id v8 = objc_msgSend(v0, sel_extensionPointRecord);
  id v9 = objc_msgSend(v8, sel_identifier);

  uint64_t v10 = sub_243259A90();
  uint64_t v12 = v11;

  if (v10 == 0xD000000000000027 && v12 == 0x800000024325D070)
  {
LABEL_3:
    swift_bridgeObjectRelease();
    return 1;
  }
  char v13 = sub_243259D20();
  swift_bridgeObjectRelease();
  return v13 & 1;
}

uint64_t sub_24323D138()
{
  if (v0[4])
  {
    id v1 = objc_allocWithZone(MEMORY[0x263F01858]);
    swift_bridgeObjectRetain();
    id v8 = sub_24323BC9C();
    id v9 = objc_msgSend(v8, sel_extensionPointRecord);
    id v10 = objc_msgSend(v9, sel_identifier);

    uint64_t v11 = sub_243259A90();
    uint64_t v13 = v12;

    if (v11 == 0xD000000000000026 && v13 == 0x800000024325CE40)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    char v14 = sub_243259D20();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_15;
    }
LABEL_11:

    goto LABEL_12;
  }
  sub_24323F8F4(0, &qword_268D8F6C8);
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForCurrentProcess);
  if (!v2) {
    goto LABEL_12;
  }
  id v8 = v2;
  self;
  uint64_t v3 = (void *)swift_dynamicCastObjCClass();
  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v4 = v0[3];
  id v5 = objc_msgSend(v3, sel_applicationExtensionRecords);

  sub_24323F8F4(0, &qword_268D8F6D0);
  sub_243250BA8();
  uint64_t v6 = sub_243259BA0();

  sub_243253314(v6, v4, 0);
  id v8 = v7;
  swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_15:
    id v21 = v8;
    v0[28] = v21;
    v0[29] = v8;
    uint64_t v23 = v0[26];
    uint64_t v22 = v0[27];
    uint64_t v24 = v0[25];
    uint64_t v25 = v0[23];
    uint64_t v36 = v0[24];
    uint64_t v37 = v0[22];
    uint64_t v26 = v0[21];
    uint64_t v27 = v0[19];
    uint64_t v28 = v0[17];
    uint64_t v39 = v0[16];
    uint64_t v40 = v0[18];
    uint64_t v38 = v0[20];
    objc_msgSend(objc_allocWithZone(MEMORY[0x263F04DC0]), sel_initWithApplicationExtensionRecord_, v21);
    sub_243259950();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v22, v36);
    sub_243259930();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v37, v25, v38);
    swift_retain();
    sub_243259880();
    sub_2432598C0();
    sub_243259890();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v40, v27, v39);
    uint64_t v29 = (void *)swift_task_alloc();
    v0[30] = v29;
    *uint64_t v29 = v0;
    v29[1] = sub_243241218;
    uint64_t v30 = v0[18];
    uint64_t v31 = v0[14];
    return MEMORY[0x270EEB760](v31, v30);
  }
LABEL_12:
  sub_24323F8F4(0, &qword_268D8F6C8);
  id v15 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForCurrentProcess);
  if (v15)
  {
    uint64_t v16 = v15;
    self;
    uint64_t v17 = (void *)swift_dynamicCastObjCClass();
    if (v17)
    {
      id v18 = objc_msgSend(v17, sel_applicationExtensionRecords);

      sub_24323F8F4(0, &qword_268D8F6D0);
      sub_243250BA8();
      uint64_t v19 = sub_243259BA0();

      sub_243250C10(v19);
      id v8 = v20;
      swift_bridgeObjectRelease();
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
    }
  }
  id v32 = objc_allocWithZone(MEMORY[0x263F087E8]);
  v33 = (void *)sub_243259A80();
  objc_msgSend(v32, sel_initWithDomain_code_userInfo_, v33, 1, 0);

  swift_willThrow();
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
  v34 = (uint64_t (*)(void))v0[1];
  return v34();
}

id sub_24323D6A8(void *a1)
{
  uint64_t v2 = sub_243259830();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = a1;
  MEMORY[0x245676620]();
  sub_243259840();
  uint64_t v7 = sub_243259800();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v8 = (void *)sub_243259A80();
  id v9 = objc_msgSend(self, sel_interactionWithPID_environmentIdentifier_, v7, v8);

  return v9;
}

uint64_t sub_24323D800()
{
  if (v0[4])
  {
    id v1 = objc_allocWithZone(MEMORY[0x263F01858]);
    swift_bridgeObjectRetain();
    id v8 = sub_24323BC9C();
    id v9 = objc_msgSend(v8, sel_extensionPointRecord);
    id v10 = objc_msgSend(v9, sel_identifier);

    uint64_t v11 = sub_243259A90();
    uint64_t v13 = v12;

    if (v11 == 0xD000000000000027 && v13 == 0x800000024325CDF0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
    char v14 = sub_243259D20();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  sub_24323F8F4(0, &qword_268D8F6C8);
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForCurrentProcess);
  if (v2)
  {
    id v8 = v2;
    self;
    uint64_t v3 = (void *)swift_dynamicCastObjCClass();
    if (!v3)
    {
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v4 = v0[3];
    id v5 = objc_msgSend(v3, sel_applicationExtensionRecords);

    sub_24323F8F4(0, &qword_268D8F6D0);
    sub_243250BA8();
    uint64_t v6 = sub_243259BA0();

    sub_2432529BC(v6, v4, 0);
    id v8 = v7;
    swift_bridgeObjectRelease();
    if (v8)
    {
LABEL_11:
      id v15 = v8;
      v0[28] = v15;
      uint64_t v17 = v0[26];
      uint64_t v16 = v0[27];
      uint64_t v18 = v0[25];
      uint64_t v19 = v0[23];
      uint64_t v30 = v0[24];
      uint64_t v31 = v0[22];
      uint64_t v20 = v0[21];
      uint64_t v21 = v0[19];
      uint64_t v22 = v0[17];
      uint64_t v33 = v0[16];
      uint64_t v34 = v0[18];
      uint64_t v32 = v0[20];
      objc_msgSend(objc_allocWithZone(MEMORY[0x263F04DC0]), sel_initWithApplicationExtensionRecord_, v15);
      sub_243259950();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v16, v30);
      sub_243259930();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v31, v19, v32);
      swift_retain();
      sub_243259880();
      sub_2432598C0();
      sub_243259890();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v34, v21, v33);
      uint64_t v23 = (void *)swift_task_alloc();
      v0[29] = v23;
      *uint64_t v23 = v0;
      v23[1] = sub_2432410EC;
      uint64_t v24 = v0[18];
      uint64_t v25 = v0[14];
      return MEMORY[0x270EEB760](v25, v24);
    }
  }
LABEL_15:
  id v26 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v27 = (void *)sub_243259A80();
  objc_msgSend(v26, sel_initWithDomain_code_userInfo_, v27, 1, 0);

  swift_willThrow();
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
  uint64_t v28 = (uint64_t (*)(void))v0[1];
  return v28();
}

uint64_t sub_24323DCA8()
{
  uint64_t receiver = (uint64_t)v0[3].receiver;
  uint64_t super_class = (uint64_t)v0[3].super_class;
  uint64_t v3 = (void (*)(id, void))v0[2].receiver;
  sub_24323F2F4(super_class, receiver, type metadata accessor for NetworkingProcess);
  uint64_t v4 = (objc_class *)type metadata accessor for __BENetworkingProcess(0);
  id v5 = objc_allocWithZone(v4);
  sub_24323F2F4(receiver, (uint64_t)v5 + OBJC_IVAR___BENetworkingProcess_inner, type metadata accessor for NetworkingProcess);
  v0[1].uint64_t receiver = v5;
  v0[1].uint64_t super_class = v4;
  id v6 = objc_msgSendSuper2(v0 + 1, sel_init);
  sub_24323E008(receiver, type metadata accessor for NetworkingProcess);
  v3(v6, 0);

  sub_24323E008(super_class, type metadata accessor for NetworkingProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0->super_class;
  return v7();
}

uint64_t sub_24323DDC8()
{
  uint64_t receiver = (uint64_t)v0[3].receiver;
  uint64_t super_class = (uint64_t)v0[3].super_class;
  uint64_t v3 = (void (*)(id, void))v0[2].receiver;
  sub_24323F2F4(super_class, receiver, type metadata accessor for RenderingProcess);
  uint64_t v4 = (objc_class *)type metadata accessor for __BERenderingProcess(0);
  id v5 = objc_allocWithZone(v4);
  sub_24323F2F4(receiver, (uint64_t)v5 + OBJC_IVAR___BERenderingProcess_inner, type metadata accessor for RenderingProcess);
  v0[1].uint64_t receiver = v5;
  v0[1].uint64_t super_class = v4;
  id v6 = objc_msgSendSuper2(v0 + 1, sel_init);
  sub_24323E008(receiver, type metadata accessor for RenderingProcess);
  v3(v6, 0);

  sub_24323E008(super_class, type metadata accessor for RenderingProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0->super_class;
  return v7();
}

uint64_t sub_24323DEE8()
{
  uint64_t receiver = (uint64_t)v0[3].receiver;
  uint64_t super_class = (uint64_t)v0[3].super_class;
  uint64_t v3 = (void (*)(id, void))v0[2].receiver;
  sub_24323F2F4(super_class, receiver, type metadata accessor for WebContentProcess);
  uint64_t v4 = (objc_class *)type metadata accessor for __BEWebContentProcess(0);
  id v5 = objc_allocWithZone(v4);
  sub_24323F2F4(receiver, (uint64_t)v5 + OBJC_IVAR___BEWebContentProcess_inner, type metadata accessor for WebContentProcess);
  v0[1].uint64_t receiver = v5;
  v0[1].uint64_t super_class = v4;
  id v6 = objc_msgSendSuper2(v0 + 1, sel_init);
  sub_24323E008(receiver, type metadata accessor for WebContentProcess);
  v3(v6, 0);

  sub_24323E008(super_class, type metadata accessor for WebContentProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0->super_class;
  return v7();
}

uint64_t sub_24323E008(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_release();
}

uint64_t sub_24323E114()
{
  id v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  if (v2)
  {
    id v3 = v1;
    id v4 = v2;
    objc_msgSend(v3, sel_removeObserver_, v4);
    objc_msgSend(v3, sel_invalidate);
    id v5 = v4;
    sub_24323E1AC((uint64_t)v3);
  }
  else
  {
    id v5 = v1;
    objc_msgSend(v5, sel_invalidate);
  }

  return 1;
}

void sub_24323E1AC(uint64_t a1)
{
  id v3 = (os_unfair_lock_s *)(*(void *)(v1
                                      + OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver_invalidationLock)
                          + 16);
  os_unfair_lock_lock(v3);
  id v4 = (void *)(v1
                + OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver__didInvalidate);
  id v5 = *(void (**)(uint64_t))(v1
                                      + OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver__didInvalidate);
  if (v5)
  {
    void *v4 = 0;
    v4[1] = 0;
    swift_retain();
    sub_24324F8D8((uint64_t)v5);
    v5(a1);
    sub_24324F8D8((uint64_t)v5);
  }
  os_unfair_lock_unlock(v3);
}

uint64_t sub_24323E40C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24323E438()
{
  return sub_2432547B0(*(void *)(v0 + 16));
}

uint64_t sub_24323E440()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void *sub_24323E450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t v23 = a3;
  uint64_t v8 = sub_243259A10();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = sub_243259A30();
  uint64_t v22 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v21 - v14;
  v4[2] = 0;
  v4[3] = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C23B0);
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 16) = 0;
  v4[3] = a2;
  v4[4] = v16;
  v4[2] = a1;
  swift_retain();
  sub_24324F8D8(0);
  sub_24323F8F4(0, (unint64_t *)&unk_26B0C23A0);
  uint64_t v17 = (void *)sub_243259C10();
  sub_243259A20();
  MEMORY[0x245676820](v13, a3);
  uint64_t v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  aBlock[4] = sub_2432541FC;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_243250778;
  aBlock[3] = &block_descriptor_0;
  _Block_copy(aBlock);
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_24323E7CC();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2370);
  sub_24323E770();
  sub_243259C60();
  sub_243259A50();
  swift_allocObject();
  sub_243259A40();
  swift_release();
  sub_243259C00();

  swift_release();
  uint64_t v19 = sub_243259A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(v23, v19);
  v18(v15, v22);
  return v4;
}

unint64_t sub_24323E770()
{
  unint64_t result = qword_26B0C2378;
  if (!qword_26B0C2378)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B0C2370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C2378);
  }
  return result;
}

unint64_t sub_24323E7CC()
{
  unint64_t result = qword_26B0C2368;
  if (!qword_26B0C2368)
  {
    sub_243259A10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B0C2368);
  }
  return result;
}

uint64_t sub_24323EBD8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(void), uint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v13 = v7 + *a4;
  v18[3] = a5(0);
  v18[4] = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  sub_24323F35C(v13, (uint64_t)boxed_opaque_existential_1, a7);
  sub_24323EF28(v18, a2, a3, v19);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  if (!v8)
  {
    uint64_t v16 = v19[0];
    uint64_t v17 = v19[1];
    type metadata accessor for _BEProcessCapabilityGrant();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v16;
    *(void *)(result + 24) = v17;
  }
  return result;
}

uint64_t type metadata accessor for _BEProcessCapabilityGrant()
{
  return self;
}

uint64_t sub_24323ECD4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  a3(0);

  return swift_release();
}

uint64_t _s15_ProcessAdaptorVMa_2(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C2358);
}

uint64_t _s15_ProcessAdaptorVMa_3(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C2338);
}

uint64_t _s15_ProcessAdaptorVMa_4(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C2318);
}

uint64_t sub_24323EDB4(uint64_t a1, uint64_t a2)
{
  return sub_24323ECD4(a1, a2, (void (*)(void))type metadata accessor for WebContentProcess);
}

uint64_t sub_24323EDCC(uint64_t a1, uint64_t a2)
{
  return sub_24323ECD4(a1, a2, (void (*)(void))type metadata accessor for NetworkingProcess);
}

uint64_t sub_24323EDE4(uint64_t a1, uint64_t a2)
{
  return sub_24323ECD4(a1, a2, (void (*)(void))type metadata accessor for RenderingProcess);
}

id sub_24323EDFC()
{
  type metadata accessor for ProcessCapability(0);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_storeEnumTagMultiPayload();
  uint64_t v2 = (objc_class *)type metadata accessor for BEProcessCapability(0);
  id v3 = objc_allocWithZone(v2);
  sub_24323F35C((uint64_t)v1, (uint64_t)v3 + OBJC_IVAR___BEProcessCapability_inner, type metadata accessor for ProcessCapability);
  v6.uint64_t receiver = v3;
  v6.uint64_t super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  sub_24323F508((uint64_t)v1, type metadata accessor for ProcessCapability);

  return v4;
}

uint64_t type metadata accessor for BEProcessCapability(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C2308);
}

uint64_t sub_24323EF28@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  type metadata accessor for ProcessCapability.MediaPlaybackCapability(0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MediaEnvironment(0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ProcessCapability(0);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (unint64_t *)((char *)&v26 - v15);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v26 - v17;
  sub_24323F35C(v4, (uint64_t)&v26 - v17, type metadata accessor for ProcessCapability);
  if (swift_getEnumCaseMultiPayload())
  {
    uint64_t v27 = a1;
    sub_24323F35C(v4, (uint64_t)v16, type metadata accessor for ProcessCapability);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      unint64_t v19 = *v16;
      unint64_t v20 = v16[1];
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_24323F508((uint64_t)v16, type metadata accessor for ProcessCapability);
      unint64_t v20 = 0x800000024325D2E0;
      unint64_t v19 = 0xD00000000000001ALL;
    }
    unint64_t v23 = 0xEA0000000000646ELL;
    sub_24323F35C(v4, (uint64_t)v13, type metadata accessor for ProcessCapability);
    uint64_t v24 = 0x756F72676B636142;
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v24 = *((void *)v13 + 2);
        unint64_t v23 = *((void *)v13 + 3);
        swift_bridgeObjectRelease();
        break;
      case 2u:
        break;
      case 3u:
        uint64_t v24 = 0x756F726765726F46;
        break;
      case 4u:
        unint64_t v23 = 0xE900000000000064;
        uint64_t v24 = 0x65646E6570737553;
        break;
      default:
        sub_24323F508((uint64_t)v13, type metadata accessor for MediaEnvironment);
        unint64_t v23 = 0xED00006B63616279;
        uint64_t v24 = 0x616C50616964654DLL;
        break;
    }
    unint64_t v30 = v19;
    unint64_t v31 = v20;
    uint64_t v32 = v24;
    unint64_t v33 = v23;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    sub_24323F70C(v27, v28, v29, a4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v21 = type metadata accessor for ProcessCapability;
    uint64_t v22 = (uint64_t)v18;
  }
  else
  {
    sub_243257D10((uint64_t)v18, (uint64_t)v10);
    sub_24323F35C((uint64_t)v10, (uint64_t)v8, type metadata accessor for MediaEnvironment);
    sub_2432568C8(a1, a4);
    sub_24323F508((uint64_t)v8, type metadata accessor for ProcessCapability.MediaPlaybackCapability);
    uint64_t v21 = type metadata accessor for MediaEnvironment;
    uint64_t v22 = (uint64_t)v10;
  }
  return sub_24323F508(v22, v21);
}

uint64_t sub_24323F2F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24323F35C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for ProcessCapability(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C22E8);
}

void *initializeWithCopy for ProcessCapability(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v13 = a2[1];
    *a1 = *a2;
    a1[1] = v13;
    uint64_t v14 = a2[2];
    uint64_t v15 = a2[3];
    a1[2] = v14;
    a1[3] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_243259760();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24323F508(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t destroy for ProcessCapability(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = a1 + *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
    uint64_t v4 = sub_243259760();
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
    return v5(v3, v4);
  }
  return result;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for WebContentProcess(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C22F8);
}

uint64_t type metadata accessor for NetworkingProcess(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C22C8);
}

uint64_t type metadata accessor for RenderingProcess(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C22B8);
}

void sub_24323F70C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = *(void *)(v4 + 32);
  uint64_t v8 = *(void *)(v4 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C23C0);
  unint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_24325BF40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = (void *)sub_243259A80();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_243259A80();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(self, sel_attributeWithDomain_name_, v10, v11);

  *(void *)(v9 + 32) = v12;
  sub_243259B40();
  if (v9 >> 62)
  {
    sub_24323F8F4(0, &qword_26B0C2388);
    swift_bridgeObjectRetain();
    sub_243259CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_243259D30();
    sub_24323F8F4(0, &qword_26B0C2388);
  }
  swift_bridgeObjectRelease();
  id v13 = sub_24323FAE4(a1, v7, v8);
  swift_bridgeObjectRelease();
  if (!v5)
  {
    sub_24323FAB0(a2);
    sub_24323F930(v13, a2, a3, a4);
  }
}

uint64_t sub_24323F8F4(uint64_t a1, unint64_t *a2)
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

void sub_24323F930(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  if (a2)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a2;
    *(void *)(v8 + 24) = a3;
    unint64_t v9 = (objc_class *)type metadata accessor for ProcessCapability.AssertionObserver();
    uint64_t v10 = (char *)objc_allocWithZone(v9);
    uint64_t v11 = (uint64_t *)&v10[OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver__didInvalidate];
    *uint64_t v11 = 0;
    v11[1] = 0;
    uint64_t v12 = OBJC_IVAR____TtCO16BrowserEngineKit17ProcessCapabilityP33_0A18377BB6CEC07907AEB25ED9D7270217AssertionObserver_invalidationLock;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C23B0);
    uint64_t v13 = swift_allocObject();
    *(_DWORD *)(v13 + 16) = 0;
    *(void *)&v10[v12] = v13;
    uint64_t v14 = *v11;
    *uint64_t v11 = (uint64_t)sub_24323E40C;
    v11[1] = v8;
    sub_24323FAB0(a2);
    id v15 = a1;
    sub_24323FAB0(a2);
    swift_retain();
    sub_24324F8D8(v14);
    v19.uint64_t receiver = v10;
    v19.uint64_t super_class = v9;
    id v16 = objc_msgSendSuper2(&v19, sel_init);
    swift_release();
    id v17 = v16;
    objc_msgSend(v15, sel_addObserver_, v17);
    sub_24324F8D8(a2);

    sub_24324F8D8(a2);
  }
  else
  {
    id v18 = a1;
    id v16 = 0;
  }
  *a4 = a1;
  a4[1] = v16;
}

uint64_t sub_24323FAB0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t type metadata accessor for ProcessCapability.AssertionObserver()
{
  return self;
}

id sub_24323FAE4(void *a1, uint64_t a2, uint64_t a3)
{
  v22[2] = *(id *)MEMORY[0x263EF8340];
  sub_243259C90();
  swift_bridgeObjectRelease();
  v22[0] = (id)0xD00000000000002ELL;
  v22[1] = (id)0x800000024325D330;
  uint64_t v6 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v7(v6, v5);
  sub_243259D10();
  sub_243259B00();
  swift_bridgeObjectRelease();
  if (a3)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = ((uint64_t (*)(uint64_t, uint64_t))v7)(v6, v5);
    unint64_t v9 = (void *)sub_243259A80();
    swift_bridgeObjectRelease();
    id v10 = objc_msgSend(self, sel_targetWithPid_environmentIdentifier_, v8, v9);

    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    __break(1u);
  }
  uint64_t v21 = ((uint64_t (*)(uint64_t, uint64_t))v7)(v6, v5);
  id v10 = objc_msgSend(self, sel_targetWithPid_, v21);
  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  id v11 = objc_allocWithZone(MEMORY[0x263F64408]);
  id v12 = v10;
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_243259A80();
  swift_bridgeObjectRelease();
  sub_24323F8F4(0, &qword_26B0C2388);
  uint64_t v14 = (void *)sub_243259B30();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(v11, sel_initWithExplanation_target_attributes_, v13, v12, v14);

  v22[0] = 0;
  if (objc_msgSend(v15, sel_acquireWithError_, v22))
  {
    id v16 = v22[0];
  }
  else
  {
    id v17 = v22[0];
    id v18 = (void *)sub_2432596A0();

    swift_willThrow();
    objc_msgSend(v15, sel_invalidate);
    objc_super v19 = (void *)sub_243259690();
    sub_243257FE8(v19);

    swift_willThrow();
  }
  return v15;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessV17processIdentifiers5Int32Vvg_0()
{
  *(void *)v7.val = MEMORY[0x245676620]();
  v7.val[2] = v0;
  v7.val[3] = v1;
  v7.val[4] = v2;
  v7.val[5] = v3;
  v7.val[6] = v4;
  v7.val[7] = v5;
  return audit_token_to_pid(&v7);
}

uint64_t type metadata accessor for ProcessCapability.MediaPlaybackCapability(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C22D8);
}

uint64_t type metadata accessor for MediaEnvironment(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C22A8);
}

uint64_t sub_24323FE80()
{
  return (*v0)();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
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

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_243259910();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_2432401A4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

ValueMetadata *type metadata accessor for WebContentExtensionConfiguration()
{
  return &type metadata for WebContentExtensionConfiguration;
}

ValueMetadata *type metadata accessor for NetworkingExtensionConfiguration()
{
  return &type metadata for NetworkingExtensionConfiguration;
}

ValueMetadata *type metadata accessor for RenderingExtensionConfiguration()
{
  return &type metadata for RenderingExtensionConfiguration;
}

uint64_t RestrictedSandboxAppliable<>.applyRestrictedSandbox(revision:)()
{
  sub_24323A818();

  return sandbox_enable_local_state_flag();
}

ValueMetadata *type metadata accessor for RestrictedSandboxRevision()
{
  return &type metadata for RestrictedSandboxRevision;
}

uint64_t sub_24324025C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323AF14(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t type metadata accessor for __BEWebContentProcess(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C27E8);
}

uint64_t sub_243240294()
{
  return type metadata accessor for __BEWebContentProcess(0);
}

uint64_t sub_2432402CC()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243254240;
  }
  else {
    uint64_t v2 = sub_24323DEE8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432403E0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  id v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *id v11 = v2;
  v11[1] = sub_24323A500;
  return sub_24323ABF0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2432404D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323AF14(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t type metadata accessor for __BENetworkingProcess(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C2348);
}

uint64_t sub_243240508()
{
  return type metadata accessor for __BENetworkingProcess(0);
}

uint64_t sub_24324051C()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243254240;
  }
  else {
    uint64_t v2 = sub_24323DCA8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243240630(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  id v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *id v11 = v2;
  v11[1] = sub_24323A500;
  return sub_24323ADF0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_243240720()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_243240738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323AF14(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t type metadata accessor for __BERenderingProcess(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C2328);
}

uint64_t sub_243240770()
{
  return type metadata accessor for __BERenderingProcess(0);
}

uint64_t sub_2432407A8()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243252028;
  }
  else {
    uint64_t v2 = sub_24323DDC8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432408BC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  id v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *id v11 = v2;
  v11[1] = sub_24324CB44;
  return sub_24323AACC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2432409A8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 24))();
}

uint64_t WebContentExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  *a3 = sub_2432409A8;
  a3[1] = (uint64_t (*)())v10;
  return result;
}

uint64_t sub_243240B3C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 24))();
}

uint64_t NetworkingExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  *a3 = sub_243240B3C;
  a3[1] = (uint64_t (*)())v10;
  return result;
}

uint64_t sub_243240CD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243240E84(a1, a2, a3, type metadata accessor for ProcessCapability);
}

uint64_t sub_243240CE8()
{
  return type metadata accessor for BEProcessCapability(0);
}

uint64_t sub_243240CF0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 24))();
}

uint64_t RenderingExtension.configuration.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (**a3)()@<X8>)
{
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  *a3 = sub_243240CF0;
  a3[1] = (uint64_t (*)())v10;
  return result;
}

uint64_t sub_243240E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_243240F18()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243254238;
  }
  else {
    uint64_t v2 = sub_24323CCF0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24324102C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323B358(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_243241044()
{
  uint64_t result = type metadata accessor for MediaEnvironment(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_2432410D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323B358(a1, a2, a3, type metadata accessor for MediaEnvironment);
}

uint64_t sub_2432410EC()
{
  *(void *)(*(void *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2432509B4;
  }
  else {
    uint64_t v2 = sub_24323CA20;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243241200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323B358(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_243241218()
{
  *(void *)(*(void *)v1 + 248) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2432510BC;
  }
  else {
    uint64_t v2 = sub_24323C740;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24324132C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323B358(a1, a2, a3, type metadata accessor for RenderingProcess);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return objc_opt_class();
}

Swift::Bool __swiftcall WebContentExtensionConfiguration.accept(connection:)(NSXPCConnection connection)
{
  return 0;
}

uint64_t _s16BrowserEngineKit25RestrictedSandboxRevisionO1loiySbAC_ACtFZ_0()
{
  return 0;
}

uint64_t sub_243244C18()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t WebContentExtensionConfiguration.handleConnection(_:)()
{
  return (*v0)();
}

uint64_t dispatch thunk of WebContentExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

void *assignWithCopy for WebContentExtensionConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for WebContentExtensionConfiguration(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WebContentExtensionConfiguration(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WebContentExtensionConfiguration(uint64_t result, int a2, int a3)
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_243244DD0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_243244E10(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_243244E30(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

BOOL sub_243244E70(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

uint64_t sub_243244EA0()
{
  uint64_t v0 = sub_2432599C0();
  __swift_allocate_value_buffer(v0, qword_268D90230);
  __swift_project_value_buffer(v0, (uint64_t)qword_268D90230);
  return sub_2432599B0();
}

uint64_t BEDownloadMonitor.Location.url.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24324B25C(&OBJC_IVAR___BEDownloadMonitorLocation_url, MEMORY[0x263F06EA8], a1);
}

uint64_t BEDownloadMonitor.Location.bookmarkData.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData);
  sub_243245024(v1, *(void *)(v0 + OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData + 8));
  return v1;
}

uint64_t sub_243245024(uint64_t a1, unint64_t a2)
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

id BEDownloadMonitor.Location.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void BEDownloadMonitor.Location.init()()
{
}

id BEDownloadMonitor.Location.__deallocating_deinit()
{
  return sub_24324B86C(type metadata accessor for BEDownloadMonitor.Location);
}

uint64_t type metadata accessor for BEDownloadMonitor.Location(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_268D8F4E0);
}

id BEDownloadMonitor.__allocating_init(sourceURL:destinationURL:observedProgress:liveActivityAccessToken:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = sub_24324DC34(a1, a2, a3, a4, a5);
  sub_24324DF00(a4, a5);

  return v12;
}

id BEDownloadMonitor.init(sourceURL:destinationURL:observedProgress:liveActivityAccessToken:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  id v8 = sub_24324DC34(a1, a2, a3, a4, a5);
  sub_24324DF00(a4, a5);

  return v8;
}

uint64_t sub_2432453B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F400);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  id v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v32 - v12;
  uint64_t v14 = sub_243259990();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  objc_super v19 = (char *)&v32 - v18;
  uint64_t result = MEMORY[0x270FA5388](v17);
  unint64_t v23 = (char *)&v32 - v22;
  if (*(unsigned char *)(v4 + OBJC_IVAR___BEDownloadMonitor_didBegin))
  {
    __break(1u);
  }
  else
  {
    unint64_t v33 = v11;
    uint64_t v34 = v21;
    *(unsigned char *)(v4 + OBJC_IVAR___BEDownloadMonitor_useDownloadsFolder) = 1;
    uint64_t v24 = (void *)(v4 + OBJC_IVAR___BEDownloadMonitor_finalFileCreatedHandler);
    uint64_t v25 = a2;
    uint64_t v26 = *(void *)(v4 + OBJC_IVAR___BEDownloadMonitor_finalFileCreatedHandler);
    *uint64_t v24 = v25;
    v24[1] = a3;
    swift_retain();
    sub_24324F8D8(v26);
    sub_24325011C(a1, (uint64_t)v13, &qword_268D8F400);
    uint64_t v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
    if (v27((uint64_t)v13, 1, v14) == 1)
    {
      sub_24324F70C((uint64_t)v13, &qword_268D8F400);
      sub_2432596D0();
      sub_243259980();
      uint64_t v28 = (uint64_t)v33;
      sub_243259960();
      if (v27(v28, 1, v14) == 1)
      {
        uint64_t v29 = v34;
        sub_243259980();
        sub_24324F70C(v28, &qword_268D8F400);
      }
      else
      {
        uint64_t v29 = v34;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v34, v28, v14);
      }
      uint64_t v31 = v4 + OBJC_IVAR___BEDownloadMonitor_placeholderType;
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 40))(v31, v29, v14);
      return swift_endAccess();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v23, v13, v14);
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v19, v23, v14);
      uint64_t v30 = v4 + OBJC_IVAR___BEDownloadMonitor_placeholderType;
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 40))(v30, v19, v14);
      swift_endAccess();
      return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v23, v14);
    }
  }
  return result;
}

uint64_t sub_2432458DC()
{
  v1[21] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F7C0);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  uint64_t v2 = sub_243259760();
  v1[24] = v2;
  v1[25] = *(void *)(v2 - 8);
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2432459F8, 0, 0);
}

uint64_t sub_2432459F8()
{
  uint64_t v1 = v0[21];
  if (*(unsigned char *)(v1 + OBJC_IVAR___BEDownloadMonitor_didBegin))
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2(0);
  }
  else
  {
    *(unsigned char *)(v1 + OBJC_IVAR___BEDownloadMonitor_didBegin) = 1;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[29] = v4;
    void *v4 = v0;
    v4[1] = sub_243245B34;
    v4[9] = v0[21];
    return MEMORY[0x270FA2498](sub_24324DF78, 0, 0);
  }
}

uint64_t sub_243245B34()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_243245CB0, 0, 0);
  }
}

uint64_t sub_243245CB0()
{
  uint64_t v46 = v0;
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = OBJC_IVAR___BEDownloadMonitor_useDownloadsFolder;
  *(void *)(v0 + 248) = OBJC_IVAR___BEDownloadMonitor_useDownloadsFolder;
  if ((*(unsigned char *)(v1 + v2) & 1) == 0)
  {
    uint64_t v16 = *(void *)(v0 + 240);
LABEL_8:
    char v17 = sub_243259740();
    uint64_t v18 = *(void **)(v1 + OBJC_IVAR___BEDownloadMonitor_innerProgress);
    objc_super v19 = (void *)sub_243259700();
    objc_msgSend(v18, sel_setFileURL_, v19);

    objc_msgSend(v18, sel_publish);
    if (v17) {
      sub_243259720();
    }
    goto LABEL_11;
  }
  uint64_t v3 = sub_24324E550();
  *(void *)(v0 + 256) = v3;
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (qword_268D8F390 != -1) {
      swift_once();
    }
    uint64_t v5 = *(void **)(v0 + 168);
    uint64_t v6 = sub_2432599C0();
    *(void *)(v0 + 264) = __swift_project_value_buffer(v6, (uint64_t)qword_268D90230);
    id v7 = v5;
    uint64_t v8 = sub_2432599A0();
    os_log_type_t v9 = sub_243259BC0();
    BOOL v10 = os_log_type_enabled(v8, v9);
    id v11 = *(void **)(v0 + 168);
    if (v10)
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v45 = v13;
      uint64_t v14 = sub_2432596F0();
      *(void *)(v0 + 160) = sub_24324D5CC(v14, v15, &v45);
      sub_243259C20();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243238000, v8, v9, "proxy.createPlaceholder to %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245677390](v13, -1, -1);
      MEMORY[0x245677390](v12, -1, -1);
    }
    else
    {
    }
    sub_2432596F0();
    uint64_t v31 = sub_243259A80();
    *(void *)(v0 + 272) = v31;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 136;
    *(void *)(v0 + 24) = sub_2432462F8;
    uint64_t v32 = swift_continuation_init();
    *(void *)(v0 + 80) = MEMORY[0x263EF8330];
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_243246C04;
    *(void *)(v0 + 104) = &block_descriptor;
    *(void *)(v0 + 112) = v32;
    objc_msgSend(v4, sel_createPlaceholderWithFilename_completionHandler_, v31, v0 + 80);
    return MEMORY[0x270FA23F0](v0 + 16);
  }
  uint64_t v16 = *(void *)(v0 + 240);
  uint64_t v1 = *(void *)(v0 + 168);
  if ((*(unsigned char *)(v1 + *(void *)(v0 + 248)) & 1) == 0) {
    goto LABEL_8;
  }
LABEL_11:
  sub_243247700();
  if (v16)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
  uint64_t v22 = *(void **)(*(void *)(v0 + 168) + OBJC_IVAR___BEDownloadMonitor_placeholderURLWrapper);
  if (!v22)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 200) + 56))(*(void *)(v0 + 176), 1, 1, *(void *)(v0 + 192));
    goto LABEL_24;
  }
  uint64_t v23 = *(void *)(v0 + 224);
  uint64_t v24 = *(void *)(v0 + 192);
  uint64_t v25 = *(void *)(v0 + 200);
  uint64_t v26 = *(void *)(v0 + 176);
  id v27 = [v22 url];
  sub_243259730();

  uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32);
  v28(v26, v23, v24);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v26, 0, 1, v24);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v26, 1, v24) == 1)
  {
LABEL_24:
    sub_24324F70C(*(void *)(v0 + 176), &qword_268D8F7C0);
    goto LABEL_25;
  }
  uint64_t v29 = *(void *)(v0 + 168);
  v28(*(void *)(v0 + 208), *(void *)(v0 + 176), *(void *)(v0 + 192));
  unint64_t v30 = *(void *)(v29 + OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData + 8);
  if (v30 >> 60 != 15)
  {
    uint64_t v35 = *(void *)(v0 + 224);
    uint64_t v36 = *(void *)(v0 + 200);
    uint64_t v44 = *(void *)(v0 + 208);
    uint64_t v37 = *(void *)(v0 + 192);
    uint64_t v38 = *(void *)(v29 + OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData);
    uint64_t v39 = *(void (**)(uint64_t))(v36 + 16);
    v39(v35);
    uint64_t v40 = (objc_class *)type metadata accessor for BEDownloadMonitor.Location(0);
    uint64_t v41 = (char *)objc_allocWithZone(v40);
    ((void (*)(char *, uint64_t, uint64_t))v39)(&v41[OBJC_IVAR___BEDownloadMonitorLocation_url], v35, v37);
    v42 = (uint64_t *)&v41[OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData];
    uint64_t *v42 = v38;
    v42[1] = v30;
    sub_243245024(v38, v30);
    *(void *)(v0 + 120) = v41;
    *(void *)(v0 + 128) = v40;
    id v33 = objc_msgSendSuper2((objc_super *)(v0 + 120), sel_init);
    v43 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v43(v35, v37);
    v43(v44, v37);
    goto LABEL_26;
  }
  (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
LABEL_25:
  id v33 = 0;
LABEL_26:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = *(uint64_t (**)(id))(v0 + 8);
  return v34(v33);
}

uint64_t sub_2432462F8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 280) = v1;
  if (v1) {
    uint64_t v2 = sub_243246B50;
  }
  else {
    uint64_t v2 = sub_243246408;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243246408()
{
  uint64_t v74 = v0;
  uint64_t v1 = *(void **)(v0 + 136);

  uint64_t v2 = v1;
  uint64_t v3 = sub_2432599A0();
  os_log_type_t v4 = sub_243259BC0();
  v72 = v2;
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v73 = v6;
    *(void *)(v0 + 144) = v1;
    id v7 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F450);
    uint64_t v8 = sub_243259AD0();
    *(void *)(v0 + 152) = sub_24324D5CC(v8, v9, &v73);
    sub_243259C20();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243238000, v3, v4, "proxy.createPlaceholder returned %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x245677390](v6, -1, -1);
    MEMORY[0x245677390](v5, -1, -1);
  }
  else
  {
  }
  BOOL v10 = &off_265179000;
  id v11 = &off_265179000;
  if (v1)
  {
    uint64_t v12 = *(void **)(v0 + 240);
    uint64_t v13 = *(void *)(v0 + 224);
    uint64_t v14 = *(void *)(v0 + 192);
    uint64_t v15 = *(void *)(v0 + 200);
    uint64_t v16 = *(void *)(v0 + 184);
    uint64_t v17 = *(void *)(v0 + 168);
    uint64_t v18 = *(void **)(v17 + OBJC_IVAR___BEDownloadMonitor_placeholderURLWrapper);
    *(void *)(v17 + OBJC_IVAR___BEDownloadMonitor_placeholderURLWrapper) = v1;
    objc_super v19 = v72;

    id v20 = [(objc_super *)v19 url];
    sub_243259730();

    char v69 = sub_243259740();
    v70 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v70(v13, v14);
    id v21 = objc_msgSend(v19, (SEL)&off_265179418);
    sub_243259730();

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v16, 1, 1, v14);
    uint64_t v22 = sub_2432596C0();
    if (v12)
    {
      uint64_t v24 = v12;
      uint64_t v25 = v19;

      uint64_t v26 = 0;
      unint64_t v27 = 0xF000000000000000;
    }
    else
    {
      uint64_t v26 = v22;
      unint64_t v27 = v23;
      uint64_t v25 = v19;
    }
    uint64_t v30 = *(void *)(v0 + 216);
    uint64_t v29 = *(void *)(v0 + 224);
    uint64_t v31 = *(void *)(v0 + 192);
    uint64_t v32 = *(void *)(v0 + 168);
    sub_24324F70C(*(void *)(v0 + 184), &qword_268D8F7C0);
    v70(v30, v31);
    id v33 = (uint64_t *)(v32 + OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData);
    uint64_t v34 = *(void *)(v32 + OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData);
    unint64_t v35 = *(void *)(v32 + OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData + 8);
    uint64_t *v33 = v26;
    v33[1] = v27;
    sub_24324E78C(v34, v35);
    uint64_t v36 = *(void **)(v32 + OBJC_IVAR___BEDownloadMonitor_innerProgress);
    id v37 = objc_msgSend(v25, (SEL)&off_265179418);
    sub_243259730();

    uint64_t v38 = (void *)sub_243259700();
    v70(v29, v31);
    BOOL v10 = &off_265179000;
    objc_msgSend(v36, sel_setFileURL_, v38);

    id v11 = &off_265179000;
    objc_msgSend(v36, sel_publish);
    if (v69)
    {
      uint64_t v39 = *(void *)(v0 + 224);
      uint64_t v40 = *(void *)(v0 + 192);
      id v41 = objc_msgSend(v25, (SEL)&off_265179418);
      sub_243259730();

      sub_243259720();
      uint64_t v42 = v40;
      BOOL v10 = &off_265179000;
      v70(v39, v42);
    }
    swift_unknownObjectRelease();

    uint64_t v28 = 0;
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v28 = *(void *)(v0 + 240);
  }
  uint64_t v43 = *(void *)(v0 + 168);
  if ((*(unsigned char *)(v43 + *(void *)(v0 + 248)) & 1) == 0)
  {
    char v44 = sub_243259740();
    uint64_t v45 = *(void **)(v43 + OBJC_IVAR___BEDownloadMonitor_innerProgress);
    uint64_t v46 = (void *)sub_243259700();
    objc_msgSend(v45, (SEL)v10[449], v46);

    [v45 (SEL)v11[450]];
    if (v44) {
      sub_243259720();
    }
  }
  sub_243247700();
  if (v28)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
    return v47();
  }
  v49 = *(void **)(*(void *)(v0 + 168) + OBJC_IVAR___BEDownloadMonitor_placeholderURLWrapper);
  if (!v49)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 200) + 56))(*(void *)(v0 + 176), 1, 1, *(void *)(v0 + 192));
    goto LABEL_24;
  }
  uint64_t v50 = *(void *)(v0 + 224);
  uint64_t v51 = *(void *)(v0 + 192);
  uint64_t v52 = *(void *)(v0 + 200);
  uint64_t v53 = *(void *)(v0 + 176);
  id v54 = [v49 url];
  sub_243259730();

  v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 32);
  v55(v53, v50, v51);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v52 + 56))(v53, 0, 1, v51);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v53, 1, v51) == 1)
  {
LABEL_24:
    sub_24324F70C(*(void *)(v0 + 176), &qword_268D8F7C0);
    goto LABEL_25;
  }
  uint64_t v56 = *(void *)(v0 + 168);
  v55(*(void *)(v0 + 208), *(void *)(v0 + 176), *(void *)(v0 + 192));
  unint64_t v57 = *(void *)(v56 + OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData + 8);
  if (v57 >> 60 != 15)
  {
    uint64_t v60 = *(void *)(v0 + 224);
    uint64_t v61 = *(void *)(v0 + 200);
    uint64_t v71 = *(void *)(v0 + 208);
    uint64_t v62 = *(void *)(v0 + 192);
    uint64_t v63 = *(void *)(v56 + OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData);
    v64 = *(void (**)(uint64_t))(v61 + 16);
    v64(v60);
    v65 = (objc_class *)type metadata accessor for BEDownloadMonitor.Location(0);
    v66 = (char *)objc_allocWithZone(v65);
    ((void (*)(char *, uint64_t, uint64_t))v64)(&v66[OBJC_IVAR___BEDownloadMonitorLocation_url], v60, v62);
    v67 = (uint64_t *)&v66[OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData];
    uint64_t *v67 = v63;
    v67[1] = v57;
    sub_243245024(v63, v57);
    *(void *)(v0 + 120) = v66;
    *(void *)(v0 + 128) = v65;
    id v58 = objc_msgSendSuper2((objc_super *)(v0 + 120), sel_init);
    v68 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
    v68(v60, v62);
    v68(v71, v62);
    goto LABEL_26;
  }
  (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
LABEL_25:
  id v58 = 0;
LABEL_26:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v59 = *(uint64_t (**)(id))(v0 + 8);
  return v59(v58);
}

uint64_t sub_243246B50()
{
  uint64_t v1 = *(void **)(v0 + 272);
  swift_willThrow();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_243246C04(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F5C8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    id v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_24324FBD4((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_243246E30(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_243250688;
  return sub_2432458DC();
}

uint64_t sub_243246ED8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_243259760();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243246F98, 0, 0);
}

uint64_t sub_243246F98()
{
  uint64_t v1 = v0[3];
  if (*(unsigned char *)(v1 + OBJC_IVAR___BEDownloadMonitor_didBegin))
  {
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    *(unsigned char *)(v1 + OBJC_IVAR___BEDownloadMonitor_didBegin) = 1;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[7] = v4;
    void *v4 = v0;
    v4[1] = sub_24324709C;
    v4[9] = v0[3];
    return MEMORY[0x270FA2498](sub_24324DF78, 0, 0);
  }
}

uint64_t sub_24324709C()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_2432471E8, 0, 0);
  }
}

uint64_t sub_2432471E8()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  id v5 = objc_allocWithZone(MEMORY[0x263F08B18]);
  uint64_t v6 = (void *)sub_243259700();
  id v7 = objc_msgSend(v5, sel_initWithURL_, v6);

  uint64_t v8 = *(void **)(v3 + OBJC_IVAR___BEDownloadMonitor_placeholderURLWrapper);
  *(void *)(v3 + OBJC_IVAR___BEDownloadMonitor_placeholderURLWrapper) = v7;
  id v9 = v7;

  id v10 = [v9 url];
  sub_243259730();

  char v20 = sub_243259740();
  id v11 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v11(v1, v4);
  uint64_t v12 = *(void **)(v3 + OBJC_IVAR___BEDownloadMonitor_innerProgress);
  id v13 = [v9 url];
  sub_243259730();

  uint64_t v14 = (void *)sub_243259700();
  v11(v1, v4);
  objc_msgSend(v12, sel_setFileURL_, v14);

  objc_msgSend(v12, sel_publish);
  sub_243247700();
  if (v20)
  {
    uint64_t v15 = v0[6];
    uint64_t v16 = v0[4];
    id v17 = [v9 url];
    sub_243259730();

    sub_243259720();
    v11(v15, v16);
  }

  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_243247564(uint64_t a1, const void *a2, void *a3)
{
  v3[2] = a3;
  uint64_t v6 = sub_243259760();
  v3[3] = v6;
  v3[4] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v3[5] = v7;
  v3[6] = _Block_copy(a2);
  sub_243259730();
  a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[7] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_24325068C;
  return sub_243246ED8(v7);
}

void sub_243247700()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = OBJC_IVAR___BEDownloadMonitor_observedProgress;
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR___BEDownloadMonitor_observedProgress);
  swift_getKeyPath();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = ObjectType;
  id v7 = v4;
  uint64_t v8 = sub_2432596B0();
  swift_release();
  swift_release();

  id v9 = *(void **)(v1 + OBJC_IVAR___BEDownloadMonitor_clientProgressFractionObservation);
  *(void *)(v1 + OBJC_IVAR___BEDownloadMonitor_clientProgressFractionObservation) = v8;

  uint64_t v10 = *(void **)(v1 + v3);
  swift_getKeyPath();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = ObjectType;
  id v13 = v10;
  uint64_t v14 = sub_2432596B0();
  swift_release();
  swift_release();

  uint64_t v15 = *(void **)(v1 + OBJC_IVAR___BEDownloadMonitor_clientProgressFinishedObservation);
  *(void *)(v1 + OBJC_IVAR___BEDownloadMonitor_clientProgressFinishedObservation) = v14;

  uint64_t v16 = *(void **)(v1 + v3);
  swift_getKeyPath();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v17 = v16;
  uint64_t v18 = sub_2432596B0();
  swift_release();
  swift_release();

  objc_super v19 = *(void **)(v1 + OBJC_IVAR___BEDownloadMonitor_clientProgressCancelObservation);
  *(void *)(v1 + OBJC_IVAR___BEDownloadMonitor_clientProgressCancelObservation) = v18;

  char v20 = *(void **)(v1 + OBJC_IVAR___BEDownloadMonitor_innerProgress);
  swift_getKeyPath();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v21 = v20;
  uint64_t v22 = sub_2432596B0();
  swift_release();
  swift_release();

  unint64_t v23 = *(void **)(v1 + OBJC_IVAR___BEDownloadMonitor_innerProgressCancelObservation);
  *(void *)(v1 + OBJC_IVAR___BEDownloadMonitor_innerProgressCancelObservation) = v22;
}

void sub_243247A0C(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F7C0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_243259760();
  id v9 = *(char **)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v56 - v13;
  uint64_t v15 = *a1;
  swift_beginAccess();
  uint64_t v16 = MEMORY[0x245677450](a3 + 16);
  if (v16)
  {
    id v17 = (char *)v16;
    uint64_t v60 = v12;
    if (qword_268D8F390 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_2432599C0();
    __swift_project_value_buffer(v18, (uint64_t)qword_268D90230);
    objc_super v19 = v15;
    char v20 = sub_2432599A0();
    os_log_type_t v21 = sub_243259BD0();
    BOOL v22 = os_log_type_enabled(v20, v21);
    v59 = v14;
    if (v22)
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      id v58 = (void *)v8;
      uint64_t v56 = (void *)v24;
      *(_DWORD *)unint64_t v23 = 138412290;
      unint64_t v57 = v7;
      uint64_t v61 = v19;
      uint64_t v25 = v19;
      id v7 = v57;
      sub_243259C20();
      uint64_t v26 = v56;
      *uint64_t v56 = v19;

      _os_log_impl(&dword_243238000, v20, v21, "Progress: %@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C22A0);
      swift_arrayDestroy();
      uint64_t v8 = (uint64_t)v58;
      MEMORY[0x245677390](v26, -1, -1);
      MEMORY[0x245677390](v23, -1, -1);
    }
    else
    {

      char v20 = v19;
    }

    uint64_t v27 = OBJC_IVAR___BEDownloadMonitor_innerProgress;
    id v28 = *(id *)&v17[OBJC_IVAR___BEDownloadMonitor_innerProgress];
    objc_msgSend(v28, sel_setTotalUnitCount_, -[NSObject totalUnitCount](v19, sel_totalUnitCount));

    id v29 = *(id *)&v17[v27];
    objc_msgSend(v29, sel_setCompletedUnitCount_, -[NSObject completedUnitCount](v19, sel_completedUnitCount));

    float v30 = -1.0;
    if (([v19 isIndeterminate] & 1) == 0)
    {
      [v19 fractionCompleted];
      float v30 = v31;
    }
    uint64_t v32 = OBJC_IVAR___BEDownloadMonitor_lastSavedProgress;
    float v33 = *(float *)&v17[OBJC_IVAR___BEDownloadMonitor_lastSavedProgress];
    if (vabds_f32(v30, v33) < 0.01
      && v33 >= 0.0
      && ([v19 isFinished] & 1) == 0)
    {
LABEL_28:

      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F610);
    uint64_t v34 = swift_allocObject();
    uint64_t v35 = MEMORY[0x263F8D5C8];
    *(_OWORD *)(v34 + 16) = xmmword_24325B740;
    uint64_t v36 = MEMORY[0x263F8D648];
    *(void *)(v34 + 56) = v35;
    *(void *)(v34 + 64) = v36;
    *(float *)(v34 + 32) = v30;
    uint64_t v37 = sub_243259AA0();
    uint64_t v39 = v38;
    uint64_t v40 = *(void **)&v17[OBJC_IVAR___BEDownloadMonitor_placeholderURLWrapper];
    if (v40)
    {
      id v58 = (void *)v37;
      id v41 = [v40 url];
      uint64_t v42 = v32;
      uint64_t v43 = v60;
      sub_243259730();

      char v44 = (void (*)(char *, char *, uint64_t))*((void *)v9 + 4);
      uint64_t v45 = v43;
      uint64_t v32 = v42;
      v44(v7, v45, v8);
      (*((void (**)(char *, void, uint64_t, uint64_t))v9 + 7))(v7, 0, 1, v8);
      if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v9 + 6))(v7, 1, v8) != 1)
      {
        uint64_t v60 = v9;
        uint64_t v46 = v7;
        uint64_t v47 = v59;
        v44(v59, v46, v8);
        uint64_t v48 = sub_243259740();
        char v49 = v48;
        MEMORY[0x270FA5388](v48);
        *(&v56 - 4) = v58;
        *(&v56 - 3) = v39;
        *(&v56 - 2) = v47;
        sub_243259710();
        swift_bridgeObjectRelease();
        if (v49) {
          sub_243259720();
        }
        (*((void (**)(void *, uint64_t))v60 + 1))(v47, v8);
        uint64_t v32 = v42;
        goto LABEL_19;
      }
    }
    else
    {
      (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v9 + 7))(v7, 1, 1, v8);
    }
    swift_bridgeObjectRelease();
    sub_24324F70C((uint64_t)v7, &qword_268D8F7C0);
LABEL_19:
    uint64_t v50 = *(void **)&v17[OBJC_IVAR___BEDownloadMonitor_backgroundTask];
    if (v50)
    {
      uint64_t v51 = *(void **)&v17[v27];
      id v52 = v50;
      if (objc_msgSend(v51, sel_isFinished))
      {
        objc_msgSend(v52, sel_setTaskCompletedWithSuccess_, 1);
      }
      else
      {
        objc_msgSend(v52, sel_updateProgress_, v51);
        id v53 = objc_msgSend(v52, sel_title);
        if (!v53)
        {
          sub_243259A90();
          id v53 = (id)sub_243259A80();
          swift_bridgeObjectRelease();
        }
        id v54 = objc_msgSend(*(id *)&v17[v27], sel_localizedAdditionalDescription);
        if (!v54)
        {
          __break(1u);
          return;
        }
        v55 = v54;
        objc_msgSend(v52, sel_updateTitle_withReason_, v53, v54);
      }
    }
    *(float *)&v17[v32] = v30;
    goto LABEL_28;
  }
}

void sub_2432480AC(const char *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v40 = a4;
  uint64_t v42 = sub_243259760();
  uint64_t v41 = *(void *)(v42 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v42);
  id v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v38 - v10;
  uint64_t v12 = sub_243259AC0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43[0] = a2;
  v43[1] = a3;
  sub_243259AB0();
  sub_2432501A0();
  size_t v16 = sub_243259C40();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v39 = a2;
  uint64_t v17 = sub_243259AE0();
  LODWORD(a1) = setxattr(a1, "com.apple.progress.fractionCompleted", (const void *)(v17 + 32), v16, 0, 0);
  swift_release();
  if ((a1 & 0x80000000) != 0)
  {
    if (qword_268D8F390 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_2432599C0();
    __swift_project_value_buffer(v27, (uint64_t)qword_268D90230);
    uint64_t v28 = v41;
    uint64_t v29 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v11, v40, v42);
    swift_bridgeObjectRetain_n();
    float v30 = sub_2432599A0();
    os_log_type_t v31 = sub_243259BE0();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v43[0] = v40;
      *(_DWORD *)uint64_t v32 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_24324D5CC(v39, a3, v43);
      sub_243259C20();
      uint64_t v33 = swift_bridgeObjectRelease_n();
      *(_WORD *)(v32 + 12) = 1024;
      LODWORD(v44) = MEMORY[0x2456767A0](v33);
      sub_243259C20();
      *(_WORD *)(v32 + 18) = 2080;
      sub_243250028(&qword_268D8F5E8, MEMORY[0x263F06EA8]);
      uint64_t v34 = v42;
      uint64_t v35 = sub_243259D10();
      uint64_t v44 = sub_24324D5CC(v35, v36, v43);
      sub_243259C20();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v34);
      _os_log_impl(&dword_243238000, v30, v31, "Failed to set xattr %s: %{darwin.errno}d on %s", (uint8_t *)v32, 0x1Cu);
      uint64_t v37 = v40;
      swift_arrayDestroy();
      MEMORY[0x245677390](v37, -1, -1);
      MEMORY[0x245677390](v32, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
    }
  }
  else
  {
    if (qword_268D8F390 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_2432599C0();
    __swift_project_value_buffer(v18, (uint64_t)qword_268D90230);
    uint64_t v19 = v41;
    uint64_t v20 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v9, v40, v42);
    swift_bridgeObjectRetain_n();
    os_log_type_t v21 = sub_2432599A0();
    os_log_type_t v22 = sub_243259BD0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v43[0] = v40;
      *(_DWORD *)uint64_t v23 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_24324D5CC(v39, a3, v43);
      sub_243259C20();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v23 + 12) = 2080;
      sub_243250028(&qword_268D8F5E8, MEMORY[0x263F06EA8]);
      uint64_t v24 = sub_243259D10();
      uint64_t v44 = sub_24324D5CC(v24, v25, v43);
      sub_243259C20();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v20);
      _os_log_impl(&dword_243238000, v21, v22, "set xattr %s: on %s", (uint8_t *)v23, 0x16u);
      uint64_t v26 = v40;
      swift_arrayDestroy();
      MEMORY[0x245677390](v26, -1, -1);
      MEMORY[0x245677390](v23, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v20);
    }
  }
}

void sub_243248730(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v68 = a4;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F7C0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_243259760();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  size_t v16 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  char v69 = (char *)&v59 - v17;
  uint64_t v18 = *a1;
  if (!objc_msgSend(v18, sel_isFinished)) {
    return;
  }
  swift_beginAccess();
  uint64_t v19 = MEMORY[0x245677450](a3 + 16);
  if (!v19) {
    return;
  }
  uint64_t v20 = (void *)v19;
  v64 = v8;
  uint64_t v66 = v13;
  if (qword_268D8F390 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_2432599C0();
  uint64_t v22 = __swift_project_value_buffer(v21, (uint64_t)qword_268D90230);
  id v23 = v18;
  id v24 = v20;
  id v25 = v23;
  uint64_t v26 = (char *)v24;
  uint64_t v65 = v22;
  uint64_t v27 = sub_2432599A0();
  os_log_type_t v28 = sub_243259BC0();
  int v29 = v28;
  BOOL v30 = os_log_type_enabled(v27, v28);
  v67 = v26;
  if (v30)
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v62 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v33 = (void *)v32;
    uint64_t v63 = swift_slowAlloc();
    uint64_t v70 = (uint64_t)v25;
    uint64_t v71 = v63;
    *(_DWORD *)uint64_t v31 = 138412802;
    int v61 = v29;
    id v34 = v25;
    os_log_t v60 = v27;
    id v35 = v34;
    uint64_t v26 = v67;
    sub_243259C20();
    void *v33 = v25;
    unint64_t v36 = v33;
    size_t v16 = v62;

    *(_WORD *)(v31 + 12) = 1024;
    unsigned int v37 = objc_msgSend(v35, sel_isFinished);

    LODWORD(v70) = v37;
    sub_243259C20();

    *(_WORD *)(v31 + 18) = 2080;
    sub_243250028(&qword_268D8F5E8, MEMORY[0x263F06EA8]);
    uint64_t v38 = sub_243259D10();
    uint64_t v70 = sub_24324D5CC(v38, v39, &v71);
    sub_243259C20();
    swift_bridgeObjectRelease();

    os_log_t v40 = v60;
    _os_log_impl(&dword_243238000, v60, (os_log_type_t)v61, "Finished observer: %@ finished: %{BOOL}d with destinationURL %s", (uint8_t *)v31, 0x1Cu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C22A0);
    swift_arrayDestroy();
    MEMORY[0x245677390](v36, -1, -1);
    uint64_t v41 = v63;
    swift_arrayDestroy();
    MEMORY[0x245677390](v41, -1, -1);
    MEMORY[0x245677390](v31, -1, -1);
  }
  else
  {
  }
  uint64_t v42 = *(void **)&v26[OBJC_IVAR___BEDownloadMonitor_placeholderURLWrapper];
  uint64_t v43 = v66;
  if (v42)
  {
    id v44 = [v42 url];
    sub_243259730();

    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v43 + 32);
    v45(v11, v16, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v43 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v11, 1, v12) != 1)
    {
      uint64_t v46 = v69;
      v45(v69, v11, v12);
      uint64_t v47 = v67;
      if (v67[OBJC_IVAR___BEDownloadMonitor_useDownloadsFolder] == 1)
      {
        uint64_t v48 = v46;
        char v49 = sub_243259740();
        uint64_t v50 = sub_243259B90();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v64, 1, 1, v50);
        (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v16, v48, v12);
        unint64_t v51 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
        uint64_t v52 = swift_allocObject();
        *(void *)(v52 + 16) = 0;
        *(void *)(v52 + 24) = 0;
        v45((char *)(v52 + v51), v16, v12);
        unint64_t v53 = v52 + ((v51 + v14 + 7) & 0xFFFFFFFFFFFFFFF8);
        *(void *)unint64_t v53 = v47;
        *(unsigned char *)(v53 + 8) = v49 & 1;
        *(void *)(v52 + ((v51 + v14 + 23) & 0xFFFFFFFFFFFFFFF8)) = v68;
        id v54 = v47;
        sub_24324A42C((uint64_t)v64, (uint64_t)&unk_268D8F5E0, v52);
        swift_release();

        (*(void (**)(char *, uint64_t))(v66 + 8))(v69, v12);
        return;
      }
      (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v12);
      goto LABEL_14;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v11, 1, 1, v12);
  }
  sub_24324F70C((uint64_t)v11, &qword_268D8F7C0);
LABEL_14:
  v55 = v67;
  if (v67[OBJC_IVAR___BEDownloadMonitor_useDownloadsFolder] != 1)
  {
LABEL_17:

    return;
  }
  uint64_t v56 = sub_2432599A0();
  os_log_type_t v57 = sub_243259BE0();
  if (os_log_type_enabled(v56, v57))
  {
    id v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v58 = 0;
    _os_log_impl(&dword_243238000, v56, v57, "Finished, but placeholderURL is nil", v58, 2u);
    MEMORY[0x245677390](v58, -1, -1);

    goto LABEL_17;
  }
}

uint64_t sub_243248E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 336) = a6;
  *(void *)(v6 + 200) = a4;
  *(void *)(v6 + 208) = a5;
  uint64_t v7 = sub_243259650();
  *(void *)(v6 + 216) = v7;
  *(void *)(v6 + 224) = *(void *)(v7 - 8);
  *(void *)(v6 + 232) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  *(void *)(v6 + 240) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F7C0);
  *(void *)(v6 + 248) = swift_task_alloc();
  uint64_t v8 = sub_243259760();
  *(void *)(v6 + 256) = v8;
  *(void *)(v6 + 264) = *(void *)(v8 - 8);
  *(void *)(v6 + 272) = swift_task_alloc();
  *(void *)(v6 + 280) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243249040, 0, 0);
}

uint64_t sub_243249040()
{
  id v1 = objc_allocWithZone(MEMORY[0x263F08B18]);
  uint64_t v2 = (void *)sub_243259700();
  uint64_t v3 = objc_msgSend(v1, sel_initWithURL_, v2);
  v0[36] = v3;

  v0[37] = OBJC_IVAR___BEDownloadMonitor_destinationURL;
  id v4 = objc_allocWithZone(MEMORY[0x263F08B18]);
  uint64_t v5 = (void *)sub_243259700();
  id v6 = objc_msgSend(v4, sel_initWithURL_, v5);
  v0[38] = v6;

  uint64_t v7 = sub_24324E550();
  v0[39] = v7;
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    if (qword_268D8F390 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_2432599C0();
    v0[40] = __swift_project_value_buffer(v9, (uint64_t)qword_268D90230);
    uint64_t v10 = v3;
    id v11 = v6;
    uint64_t v12 = v10;
    id v13 = v11;
    uint64_t v14 = sub_2432599A0();
    os_log_type_t v15 = sub_243259BC0();
    if (os_log_type_enabled(v14, v15))
    {
      BOOL v30 = v8;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412546;
      v0[23] = v12;
      os_log_type_t type = v15;
      uint64_t v18 = v12;
      sub_243259C20();
      *uint64_t v17 = v12;

      *(_WORD *)(v16 + 12) = 2112;
      v0[24] = v13;
      id v19 = v13;
      sub_243259C20();
      v17[1] = v13;

      _os_log_impl(&dword_243238000, v14, type, "proxy.replacePlaceholder %@ to %@", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C22A0);
      swift_arrayDestroy();
      MEMORY[0x245677390](v17, -1, -1);
      uint64_t v20 = v16;
      uint64_t v8 = v30;
      MEMORY[0x245677390](v20, -1, -1);
    }
    else
    {
    }
    v0[2] = v0;
    v0[7] = v0 + 19;
    v0[3] = sub_243249534;
    uint64_t v26 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_243246C04;
    v0[13] = &block_descriptor_221;
    v0[14] = v26;
    objc_msgSend(v8, sel_replacePlaceholderWithPlaceholderFileWrapper_downloadedFileWrapper_completionHandler_, v12, v13, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    if (qword_268D8F390 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_2432599C0();
    __swift_project_value_buffer(v21, (uint64_t)qword_268D90230);
    uint64_t v22 = sub_2432599A0();
    os_log_type_t v23 = sub_243259BE0();
    if (os_log_type_enabled(v22, v23))
    {
      id v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v24 = 0;
      _os_log_impl(&dword_243238000, v22, v23, "Failed to get intermediary proxy", v24, 2u);
      MEMORY[0x245677390](v24, -1, -1);
      id v25 = v22;
    }
    else
    {
      id v25 = v3;
      uint64_t v3 = v22;
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v27 = (uint64_t (*)(void))v0[1];
    return v27();
  }
}

uint64_t sub_243249534()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 328) = v1;
  if (v1) {
    uint64_t v2 = sub_24324A0A8;
  }
  else {
    uint64_t v2 = sub_243249670;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243249670()
{
  uint64_t v88 = v0;
  v87[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0 + 144;
  uint64_t v2 = *(void **)(v0 + 152);
  id v3 = v2;
  uint64_t v4 = sub_2432599A0();
  os_log_type_t v5 = sub_243259BC0();
  if (!os_log_type_enabled(v4, v5))
  {

    if (v2) {
      goto LABEL_3;
    }
LABEL_6:
    id v19 = *(id *)(v0 + 208);
    uint64_t v20 = sub_2432599A0();
    os_log_type_t v21 = sub_243259BE0();
    BOOL v22 = os_log_type_enabled(v20, v21);
    os_log_type_t v23 = *(void **)(v0 + 304);
    if (v22)
    {
      v85 = *(void **)(v0 + 288);
      id v24 = *(void **)(v0 + 208);
      id v25 = (uint8_t *)swift_slowAlloc();
      v82 = v23;
      uint64_t v26 = swift_slowAlloc();
      v87[0] = v26;
      *(_DWORD *)id v25 = 136315138;
      sub_243250028(&qword_268D8F5E8, MEMORY[0x263F06EA8]);
      uint64_t v27 = sub_243259D10();
      *(void *)(v0 + 136) = sub_24324D5CC(v27, v28, v87);
      sub_243259C20();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243238000, v20, v21, "FAILED to finish download. Left %s in place.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x245677390](v26, -1, -1);
      MEMORY[0x245677390](v25, -1, -1);

      swift_unknownObjectRelease();
      goto LABEL_23;
    }
    unint64_t v36 = *(void **)(v0 + 288);
    unsigned int v37 = *(void **)(v0 + 208);

    goto LABEL_22;
  }
  id v6 = (uint8_t *)swift_slowAlloc();
  uint64_t v7 = swift_slowAlloc();
  *(_DWORD *)id v6 = 136315138;
  v87[0] = v7;
  *(void *)(v0 + 168) = v2;
  id v8 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F450);
  uint64_t v9 = sub_243259AD0();
  *(void *)(v0 + 176) = sub_24324D5CC(v9, v10, v87);
  sub_243259C20();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_243238000, v4, v5, "proxy.replacePlaceholder returned %s", v6, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x245677390](v7, -1, -1);
  id v11 = v6;
  uint64_t v1 = v0 + 144;
  MEMORY[0x245677390](v11, -1, -1);

  if (!v2) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v12 = self;
  id v13 = v3;
  id v14 = objc_msgSend(v12, sel_defaultManager);
  os_log_type_t v15 = (void *)sub_243259700();
  *(void *)(v0 + 144) = 0;
  unsigned __int8 v16 = objc_msgSend(v14, sel_removeItemAtURL_error_, v15, v1);

  uint64_t v17 = *(void **)(v0 + 144);
  if (v16)
  {
    id v18 = v17;
  }
  else
  {
    uint64_t v29 = *(void *)(v0 + 224);
    uint64_t v30 = *(void *)(v0 + 232);
    uint64_t v31 = *(void *)(v0 + 216);
    id v32 = v17;
    uint64_t v33 = (void *)sub_2432596A0();

    swift_willThrow();
    id v34 = v33;
    sub_243259640();
    sub_243250028(&qword_268D8F5F0, MEMORY[0x263F06038]);
    char v35 = sub_243259680();

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
    if (v35)
    {
    }
    else
    {
      id v38 = *(id *)(v0 + 208);
      unint64_t v39 = sub_2432599A0();
      os_log_type_t v40 = sub_243259BE0();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = *(void **)(v0 + 208);
        uint64_t v42 = (uint8_t *)swift_slowAlloc();
        id v86 = v13;
        uint64_t v43 = swift_slowAlloc();
        v87[0] = v43;
        *(_DWORD *)uint64_t v42 = 136315138;
        sub_243250028(&qword_268D8F5E8, MEMORY[0x263F06EA8]);
        uint64_t v44 = sub_243259D10();
        *(void *)(v0 + 160) = sub_24324D5CC(v44, v45, v87);
        sub_243259C20();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_243238000, v39, v40, "FAILED to delete local file %s", v42, 0xCu);
        swift_arrayDestroy();
        uint64_t v46 = v43;
        id v13 = v86;
        MEMORY[0x245677390](v46, -1, -1);
        MEMORY[0x245677390](v42, -1, -1);
      }
      else
      {
        uint64_t v47 = *(void **)(v0 + 208);
      }
    }
  }
  uint64_t v48 = *(char **)(v0 + 208);
  char v49 = *(void (**)(id))&v48[OBJC_IVAR___BEDownloadMonitor_finalFileCreatedHandler];
  if (v49)
  {
    uint64_t v50 = *(void *)(v0 + 280);
    uint64_t v51 = *(void *)(v0 + 256);
    uint64_t v52 = *(void *)(v0 + 264);
    uint64_t v53 = *(void *)(v0 + 248);
    v84 = v49;
    swift_retain();
    id v54 = [v13 url];
    sub_243259730();

    char v83 = sub_243259740();
    v55 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
    v55(v50, v51);
    id v56 = objc_msgSend(v13, (SEL)&off_265179418);
    sub_243259730();

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 56))(v53, 1, 1, v51);
    uint64_t v57 = sub_2432596C0();
    unint64_t v59 = v58;
    uint64_t v60 = *(void *)(v0 + 272);
    uint64_t v81 = *(void *)(v0 + 280);
    uint64_t v62 = *(void *)(v0 + 256);
    uint64_t v61 = *(void *)(v0 + 264);
    sub_24324F70C(*(void *)(v0 + 248), &qword_268D8F7C0);
    v55(v60, v62);
    sub_243245024(v57, v59);
    id v63 = objc_msgSend(v13, (SEL)&off_265179418);
    sub_243259730();

    v64 = (objc_class *)type metadata accessor for BEDownloadMonitor.Location(0);
    uint64_t v65 = (char *)objc_allocWithZone(v64);
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(&v65[OBJC_IVAR___BEDownloadMonitorLocation_url], v81, v62);
    uint64_t v66 = (uint64_t *)&v65[OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData];
    uint64_t *v66 = v57;
    v66[1] = v59;
    sub_243245024(v57, v59);
    *(void *)(v0 + 120) = v65;
    *(void *)(v0 + 128) = v64;
    id v67 = objc_msgSendSuper2((objc_super *)(v0 + 120), sel_init);
    v55(v81, v62);
    id v68 = v67;
    v84(v67);
    sub_24324DF00(v57, v59);

    sub_24324DF00(v57, v59);
    if (v83)
    {
      uint64_t v69 = *(void *)(v0 + 280);
      uint64_t v70 = *(void *)(v0 + 256);
      id v71 = [v13 url];
      sub_243259730();

      sub_243259720();
      v55(v69, v70);
    }
    sub_24324F8D8((uint64_t)v84);
    uint64_t v48 = *(char **)(v0 + 208);
  }
  uint64_t v72 = *(void *)(v0 + 240);
  int v73 = *(unsigned __int8 *)(v0 + 336);
  uint64_t v74 = sub_243259B90();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v72, 1, 1, v74);
  uint64_t v75 = (void *)swift_allocObject();
  v75[2] = 0;
  v75[3] = 0;
  v75[4] = v48;
  v76 = v48;
  sub_24324A238(v72, (uint64_t)&unk_268D8F600, (uint64_t)v75);
  swift_release();
  sub_24324F70C(v72, &qword_26B0C2380);
  v77 = *(void **)(v0 + 304);
  v78 = *(void **)(v0 + 288);
  if (v73 == 1)
  {
    sub_243259720();
    swift_unknownObjectRelease();

    goto LABEL_23;
  }

LABEL_22:
  swift_unknownObjectRelease();
LABEL_23:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v79 = *(uint64_t (**)(void))(v0 + 8);
  return v79();
}

uint64_t sub_24324A0A8()
{
  uint64_t v1 = (void *)v0[38];
  uint64_t v2 = (void *)v0[36];
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_24324A1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_24324A1C4, 0, 0);
}

uint64_t sub_24324A1C4()
{
  objc_msgSend(*(id *)(*(void *)(v0 + 16) + OBJC_IVAR___BEDownloadMonitor_innerProgress), sel_unpublish);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24324A238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24325011C(a1, (uint64_t)v8, &qword_26B0C2380);
  uint64_t v9 = sub_243259B90();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_24324F70C((uint64_t)v8, &qword_26B0C2380);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_243259B50();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_243259B80();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

uint64_t sub_24324A42C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_243259B90();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_243259B80();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24324F70C(a1, &qword_26B0C2380);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_243259B50();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_24324A5B4(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a3 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x245677450](v4);
  if (v5)
  {
    uint64_t v6 = (char *)v5;
    if (objc_msgSend(v3, sel_isCancelled))
    {
      if (qword_268D8F390 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_2432599C0();
      __swift_project_value_buffer(v7, (uint64_t)qword_268D90230);
      id v8 = sub_2432599A0();
      os_log_type_t v9 = sub_243259BC0();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_243238000, v8, v9, "Client progress cancelled", v10, 2u);
        MEMORY[0x245677390](v10, -1, -1);
      }

      uint64_t v11 = *(void **)&v6[OBJC_IVAR___BEDownloadMonitor_innerProgress];
      if ((objc_msgSend(v11, sel_isCancelled) & 1) == 0) {
        objc_msgSend(v11, sel_cancel);
      }
      objc_msgSend(v11, sel_unpublish);
    }
  }
}

void sub_24324A71C(id *a1, uint64_t a2, uint64_t a3)
{
  if (objc_msgSend(*a1, sel_isCancelled))
  {
    swift_beginAccess();
    uint64_t v4 = MEMORY[0x245677450](a3 + 16);
    if (v4)
    {
      uint64_t v5 = (char *)v4;
      if (qword_268D8F390 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_2432599C0();
      __swift_project_value_buffer(v6, (uint64_t)qword_268D90230);
      uint64_t v7 = sub_2432599A0();
      os_log_type_t v8 = sub_243259BC0();
      if (os_log_type_enabled(v7, v8))
      {
        os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v9 = 0;
        _os_log_impl(&dword_243238000, v7, v8, "Inner progress cancelled", v9, 2u);
        MEMORY[0x245677390](v9, -1, -1);
      }

      uint64_t v10 = OBJC_IVAR___BEDownloadMonitor_backgroundTask;
      uint64_t v11 = *(void **)&v5[OBJC_IVAR___BEDownloadMonitor_backgroundTask];
      if (v11)
      {
        objc_msgSend(v11, sel_setTaskCompletedWithSuccess_, 0);
        uint64_t v12 = *(void **)&v5[v10];
      }
      else
      {
        uint64_t v12 = 0;
      }
      *(void *)&v5[v10] = 0;

      uint64_t v13 = OBJC_IVAR___BEDownloadMonitor_observedProgress;
      if ((objc_msgSend(*(id *)&v5[OBJC_IVAR___BEDownloadMonitor_observedProgress], sel_isCancelled) & 1) == 0) {
        objc_msgSend(*(id *)&v5[v13], sel_cancel);
      }
      objc_msgSend(*(id *)&v5[OBJC_IVAR___BEDownloadMonitor_innerProgress], sel_unpublish);
    }
  }
}

uint64_t sub_24324A8BC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_243259B90();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  id v9 = a1;
  if (v8 == 1)
  {
    sub_24324F70C((uint64_t)v4, &qword_26B0C2380);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    sub_243259B80();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_243259B50();
      uint64_t v11 = v12;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = &unk_268D8F630;
  *(void *)(v13 + 24) = v7;
  if (v11 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v11;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24324AAFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x270FA2498](sub_24324AB8C, 0, 0);
}

uint64_t sub_24324AB8C()
{
  if (qword_268D8F390 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = sub_2432599C0();
  __swift_project_value_buffer(v2, (uint64_t)qword_268D90230);
  id v3 = v1;
  uint64_t v4 = sub_2432599A0();
  os_log_type_t v5 = sub_243259BF0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = *(char **)(v0 + 24);
  if (v6)
  {
    int v8 = (void *)(v0 + 16);
    id v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)id v9 = 138412290;
    uint64_t v11 = *(void **)&v7[OBJC_IVAR___BEDownloadMonitor_backgroundTask];
    if (v11)
    {
      *int v8 = v11;
      id v12 = v11;
    }
    else
    {
      *int v8 = 0;
    }
    sub_243259C20();
    uint64_t v13 = *(void **)(v0 + 24);
    *uint64_t v10 = v11;

    _os_log_impl(&dword_243238000, v4, v5, "Task expired: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C22A0);
    swift_arrayDestroy();
    MEMORY[0x245677390](v10, -1, -1);
    MEMORY[0x245677390](v9, -1, -1);
  }
  else
  {
  }
  objc_msgSend(*(id *)(*(void *)(v0 + 24) + OBJC_IVAR___BEDownloadMonitor_innerProgress), sel_cancel);
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

void sub_24324ADC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sandbox_extension_consume();
  *(void *)(a2 + OBJC_IVAR___BEDownloadMonitor_liveActivitySandboxExtensionHandle) = v3;
  if (v3 == -1)
  {
    if (qword_268D8F390 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2432599C0();
    __swift_project_value_buffer(v4, (uint64_t)qword_268D90230);
    os_log_type_t v5 = sub_2432599A0();
    os_log_type_t v6 = sub_243259BE0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_243238000, v5, v6, "Failed to consume sandbox extension for Live Activity", v7, 2u);
      MEMORY[0x245677390](v7, -1, -1);
    }
  }
}

id BEDownloadMonitor.__deallocating_deinit()
{
  sandbox_extension_release();
  v2.uint64_t receiver = v0;
  v2.uint64_t super_class = (Class)type metadata accessor for BEDownloadMonitor(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t BEDownloadMonitor.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24324B25C(&OBJC_IVAR___BEDownloadMonitor_id, MEMORY[0x263F07508], a1);
}

uint64_t BEDownloadMonitor.sourceURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24324B25C(&OBJC_IVAR___BEDownloadMonitor_sourceURL, MEMORY[0x263F06EA8], a1);
}

uint64_t BEDownloadMonitor.destinationURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24324B25C(&OBJC_IVAR___BEDownloadMonitor_destinationURL, MEMORY[0x263F06EA8], a1);
}

uint64_t sub_24324B25C@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  uint64_t v6 = a2(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);

  return v7(a3, v5, v6);
}

void BEDownloadMonitor.init()()
{
}

uint64_t sub_24324B330@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR___BEDownloadMonitor_id;
  uint64_t v4 = sub_2432597E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_24324B3A8()
{
  return 1;
}

uint64_t sub_24324B3B0()
{
  return sub_243259DB0();
}

uint64_t sub_24324B3F4()
{
  return sub_243259DA0();
}

uint64_t sub_24324B41C()
{
  return sub_243259DB0();
}

id sub_24324B46C(uint64_t a1, void *a2)
{
  void aBlock[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F640);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = self;
  id v9 = objc_msgSend(v8, sel_sharedScheduler);
  id v10 = objc_msgSend(a2, sel_identifier);
  if (!v10)
  {
    sub_243259A90();
    id v10 = (id)sub_243259A80();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  id v12 = (char *)swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[v11], v7, v4);
  aBlock[4] = sub_24325041C;
  aBlock[5] = v12;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_24324B7EC;
  aBlock[3] = &block_descriptor_251;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  LODWORD(v12) = objc_msgSend(v9, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v10, 0, v13);
  _Block_release(v13);

  if (!v12)
  {
    sub_243250490();
    id v18 = (void *)swift_allocError();
LABEL_10:
    swift_willThrow();
    aBlock[0] = v18;
    return (id)sub_243259B60();
  }
  id v14 = objc_msgSend(v8, sel_sharedScheduler);
  aBlock[0] = 0;
  unsigned int v15 = objc_msgSend(v14, sel_submitTaskRequest_error_, a2, aBlock);

  id v16 = aBlock[0];
  if (!v15)
  {
    v20[1] = aBlock[0];
    id v19 = aBlock[0];
    id v18 = (void *)sub_2432596A0();

    goto LABEL_10;
  }

  return v16;
}

uint64_t sub_24324B7A4(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F640);
  return sub_243259B70();
}

void sub_24324B7EC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id URLWithBookmark.__deallocating_deinit()
{
  return sub_24324B86C(type metadata accessor for URLWithBookmark);
}

id sub_24324B86C(uint64_t (*a1)(void))
{
  v3.uint64_t receiver = v1;
  v3.uint64_t super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id DownloadProgress.__allocating_init(sourceURL:destinationURL:progress:liveActivityAccessToken:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v24 = a1;
  uint64_t v9 = sub_243259760();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unsigned int v15 = (char *)&v23 - v14;
  id v16 = objc_allocWithZone(v5);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v17(v15, a1, v9);
  uint64_t v18 = v25;
  v17(v13, v25, v9);
  id v19 = v26;
  id v20 = sub_24324DC34((uint64_t)v15, (uint64_t)v13, v26, a4, a5);
  sub_24324DF00(a4, a5);

  os_log_type_t v21 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v21(v18, v9);
  v21(v24, v9);
  return v20;
}

id DownloadProgress.init(sourceURL:destinationURL:progress:liveActivityAccessToken:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v24 = a3;
  uint64_t v23 = a1;
  uint64_t v9 = sub_243259760();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unsigned int v15 = (char *)&v22 - v14;
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v22 - v14, a1, v9);
  uint64_t v17 = a2;
  v16(v13, a2, v9);
  uint64_t v18 = v24;
  id v19 = sub_24324DC34((uint64_t)v15, (uint64_t)v13, v24, a4, a5);
  sub_24324DF00(a4, a5);

  id v20 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v20(v17, v9);
  v20(v23, v9);
  return v19;
}

uint64_t sub_24324BDD8(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    if (a3)
    {
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 16) = a3;
      *(void *)(v7 + 24) = a4;
      swift_retain();
      sub_2432453B0(a2, (uint64_t)sub_24324EB18, v7);
      return swift_release();
    }
    __break(1u);
LABEL_11:
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a3;
    *(void *)(v9 + 24) = a4;
    sub_24323FAB0(a3);
    uint64_t result = sub_24324F8D8((uint64_t)sub_24324EAAC);
    __break(1u);
    return result;
  }
  if (a3) {
    goto LABEL_11;
  }
  sub_24323FAB0(0);

  return sub_24324F8D8(0);
}

void sub_24324BEF8(char *a1, void (*a2)(id), uint64_t a3)
{
  uint64_t v6 = sub_243259760();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v22 - v11;
  if (a2)
  {
    if (a1)
    {
      v22[1] = a3;
      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
      v13((char *)v22 - v11, &a1[OBJC_IVAR___BEDownloadMonitorLocation_url], v6);
      unint64_t v14 = *(void *)&a1[OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData + 8];
      v22[0] = *(void *)&a1[OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData];
      unsigned int v15 = (char *)objc_allocWithZone((Class)type metadata accessor for URLWithBookmark(0));
      v13(v10, v12, v6);
      v13(&v15[OBJC_IVAR___BEDownloadMonitorLocation_url], v10, v6);
      id v16 = &v15[OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData];
      uint64_t v17 = v22[0];
      *(void *)id v16 = v22[0];
      *((void *)v16 + 1) = v14;
      sub_24323FAB0((uint64_t)a2);
      uint64_t v18 = a1;
      sub_243245024(v17, v14);
      id v19 = (objc_class *)type metadata accessor for BEDownloadMonitor.Location(0);
      v23.uint64_t receiver = v15;
      v23.uint64_t super_class = v19;
      id v20 = objc_msgSendSuper2(&v23, sel_init);
      os_log_type_t v21 = *(void (**)(char *, uint64_t))(v7 + 8);
      v21(v10, v6);
      v21(v12, v6);
      a2(v20);

      sub_24324F8D8((uint64_t)a2);
    }
    else
    {
      swift_retain();
      a2(0);
      sub_24324F8D8((uint64_t)a2);
    }
  }
}

uint64_t sub_24324C310()
{
  uint64_t v1 = sub_243259760();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  v0[6] = swift_task_alloc();
  v0[7] = swift_task_alloc();
  objc_super v2 = (void *)swift_task_alloc();
  v0[8] = v2;
  *objc_super v2 = v0;
  v2[1] = sub_24324C408;
  return sub_2432458DC();
}

uint64_t sub_24324C408(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 72) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24324C54C, 0, 0);
  }
}

uint64_t sub_24324C54C()
{
  Class super_class = v0[4].super_class;
  if (super_class)
  {
    uint64_t receiver = (objc_class *)v0[3].receiver;
    Class v2 = v0[3].super_class;
    id v4 = v0[2].receiver;
    Class v5 = v0[2].super_class;
    uint64_t v6 = (void (*)(Class, char *, id))*((void *)v5 + 2);
    Class v18 = v2;
    v6(v2, (char *)super_class + OBJC_IVAR___BEDownloadMonitorLocation_url, v4);
    unint64_t v7 = *(void *)((char *)super_class + OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData + 8);
    uint64_t v17 = *(void *)((char *)super_class + OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData);
    uint64_t v8 = (char *)objc_allocWithZone((Class)type metadata accessor for URLWithBookmark(0));
    v6(receiver, (char *)v2, v4);
    uint64_t v9 = receiver;
    v6((Class)&v8[OBJC_IVAR___BEDownloadMonitorLocation_url], (char *)receiver, v4);
    uint64_t v10 = (uint64_t *)&v8[OBJC_IVAR___BEDownloadMonitorLocation_bookmarkData];
    *uint64_t v10 = v17;
    v10[1] = v7;
    uint64_t v11 = super_class;
    sub_243245024(v17, v7);
    uint64_t v12 = type metadata accessor for BEDownloadMonitor.Location(0);
    v0[1].uint64_t receiver = v8;
    v0[1].Class super_class = (Class)v12;
    id v13 = objc_msgSendSuper2(v0 + 1, sel_init);
    unint64_t v14 = (void (*)(id, id))*((void *)v5 + 1);
    v14(v9, v4);
    v14(v18, v4);
  }
  else
  {
    id v13 = 0;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  unsigned int v15 = (uint64_t (*)(id))v0->super_class;
  return v15(v13);
}

uint64_t sub_24324C868(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  id v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  void *v4 = v2;
  v4[1] = sub_24324C910;
  return sub_24324C310();
}

uint64_t sub_24324C910(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  uint64_t v8 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v9 = (void *)sub_243259690();

    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
    _Block_release(v8);
  }
  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0);
    _Block_release(v8);
  }
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t sub_24324CAB0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24324CB44;
  return sub_243246ED8(a1);
}

uint64_t sub_24324CB44()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24324CDB4(uint64_t a1, const void *a2, void *a3)
{
  v3[2] = a3;
  uint64_t v6 = sub_243259760();
  v3[3] = v6;
  v3[4] = *(void *)(v6 - 8);
  uint64_t v7 = swift_task_alloc();
  v3[5] = v7;
  v3[6] = _Block_copy(a2);
  sub_243259730();
  a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[7] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_24324CEE0;
  return sub_243246ED8(v7);
}

uint64_t sub_24324CEE0()
{
  Class v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void *)(*v1 + 40);
  uint64_t v6 = *(void *)(*v1 + 32);
  uint64_t v7 = *(void *)(*v1 + 24);
  uint64_t v8 = *(void **)(*v1 + 16);
  uint64_t v9 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);

  uint64_t v10 = *(void *)(v3 + 48);
  if (v2)
  {
    uint64_t v11 = (void *)sub_243259690();

    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    (*(void (**)(void, void))(v10 + 16))(*(void *)(v3 + 48), 0);
  }
  _Block_release(*(const void **)(v4 + 48));
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v9 + 8);
  return v12();
}

id sub_24324D0D8()
{
  return *(id *)(v0 + OBJC_IVAR___BEDownloadMonitor_observedProgress);
}

void DownloadProgress.__allocating_init(sourceURL:destinationURL:observedProgress:liveActivityAccessToken:)()
{
}

void DownloadProgress.init(sourceURL:destinationURL:observedProgress:liveActivityAccessToken:)()
{
}

id DownloadProgress.__deallocating_deinit()
{
  return sub_24324B86C(type metadata accessor for DownloadProgress);
}

uint64_t sub_24324D23C(uint64_t result, unsigned char **a2)
{
  Class v2 = *a2;
  *Class v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24324D24C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24324D288(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_24323A500;
  return v6();
}

uint64_t sub_24324D354(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_24323A500;
  return v7();
}

uint64_t sub_24324D420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243259B90();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_243259B80();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24324F70C(a1, &qword_26B0C2380);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_243259B50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24324D5CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24324D6A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24324FB74((uint64_t)v12, *a3);
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
      sub_24324FB74((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24324D6A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_243259C30();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24324D85C(a5, a6);
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
  uint64_t v8 = sub_243259CB0();
  if (!v8)
  {
    sub_243259CC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_243259CF0();
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

uint64_t sub_24324D85C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24324D8F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24324DAD4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24324DAD4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24324D8F4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24324DA6C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_243259CA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_243259CC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_243259B20();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_243259CF0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_243259CC0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24324DA6C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F5C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24324DAD4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F5C0);
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
  uint64_t result = sub_243259CF0();
  __break(1u);
  return result;
}

unsigned char **sub_24324DC24(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

id sub_24324DC34(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  int64_t v9 = v5;
  sub_2432597D0();
  v9[OBJC_IVAR___BEDownloadMonitor_useDownloadsFolder] = 0;
  uint64_t v10 = &v9[OBJC_IVAR___BEDownloadMonitor_finalFileCreatedHandler];
  *uint64_t v10 = 0;
  v10[1] = 0;
  sub_243259980();
  *(void *)&v9[OBJC_IVAR___BEDownloadMonitor_placeholderURLWrapper] = 0;
  *(_OWORD *)&v9[OBJC_IVAR___BEDownloadMonitor_placeholderURLBookmarkData] = xmmword_24325B750;
  uint64_t v11 = OBJC_IVAR___BEDownloadMonitor_innerProgress;
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB8]), sel_init);
  *(void *)&v9[v11] = v12;
  *(void *)&v9[OBJC_IVAR___BEDownloadMonitor_clientProgressFractionObservation] = 0;
  *(void *)&v9[OBJC_IVAR___BEDownloadMonitor_clientProgressFinishedObservation] = 0;
  *(void *)&v9[OBJC_IVAR___BEDownloadMonitor_clientProgressCancelObservation] = 0;
  *(void *)&v9[OBJC_IVAR___BEDownloadMonitor_innerProgressCancelObservation] = 0;
  v9[OBJC_IVAR___BEDownloadMonitor_didBegin] = 0;
  *(_DWORD *)&v9[OBJC_IVAR___BEDownloadMonitor_lastSavedProgress] = -1082130432;
  *(void *)&v9[OBJC_IVAR___BEDownloadMonitor_backgroundTask] = 0;
  *(void *)&v9[OBJC_IVAR___BEDownloadMonitor_liveActivitySandboxExtensionHandle] = 0;
  id v13 = &v9[OBJC_IVAR___BEDownloadMonitor_sourceURL];
  uint64_t v14 = sub_243259760();
  uint64_t v15 = *(void *)(v14 - 8);
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v16(v13, a1, v14);
  v16(&v9[OBJC_IVAR___BEDownloadMonitor_destinationURL], a2, v14);
  objc_msgSend(v12, sel_setCancellable_, 1);
  objc_msgSend(v12, sel_setKind_, *MEMORY[0x263F084A0]);
  objc_msgSend(v12, sel_setFileOperationKind_, *MEMORY[0x263F08478]);
  id v17 = v12;
  Class v18 = (void *)sub_243259700();
  objc_msgSend(v17, sel_setFileURL_, v18);

  *(void *)&v9[OBJC_IVAR___BEDownloadMonitor_observedProgress] = a3;
  uint64_t v19 = (uint64_t *)&v9[OBJC_IVAR___BEDownloadMonitor_liveActivityAccessToken];
  *uint64_t v19 = a4;
  v19[1] = a5;
  id v20 = a3;
  sub_243245024(a4, a5);

  v26.uint64_t receiver = v9;
  v26.Class super_class = (Class)type metadata accessor for BEDownloadMonitor(0);
  id v21 = objc_msgSendSuper2(&v26, sel_init);
  uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v22(a2, v14);
  v22(a1, v14);
  return v21;
}

uint64_t sub_24324DF00(uint64_t a1, unint64_t a2)
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

uint64_t sub_24324DF58(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
  return MEMORY[0x270FA2498](sub_24324DF78, 0, 0);
}

uint64_t sub_24324DF78()
{
  sub_2432597B0();
  if (qword_268D8F390 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_2432599C0();
  __swift_project_value_buffer(v1, (uint64_t)qword_268D90230);
  uint64_t v2 = sub_2432599A0();
  os_log_type_t v3 = sub_243259BC0();
  if (os_log_type_enabled(v2, v3))
  {
    unint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_243238000, v2, v3, "submitBackgroundTask", v4, 2u);
    MEMORY[0x245677390](v4, -1, -1);
  }
  uint64_t v5 = v0[9];

  uint64_t v6 = *(void *)(v5 + OBJC_IVAR___BEDownloadMonitor_liveActivityAccessToken);
  unint64_t v7 = *(void *)(v5 + OBJC_IVAR___BEDownloadMonitor_liveActivityAccessToken + 8);
  *(void *)(swift_task_alloc() + 16) = v5;
  sub_243245024(v6, v7);
  sub_243259780();
  sub_24324DF00(v6, v7);
  swift_task_dealloc();
  id v8 = objc_allocWithZone(MEMORY[0x263EFC550]);
  int64_t v9 = (void *)sub_243259A80();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithIdentifier_, v9);
  v0[10] = v10;

  id v11 = objc_msgSend(*(id *)(v5 + OBJC_IVAR___BEDownloadMonitor_innerProgress), sel_localizedDescription);
  if (v11)
  {
    uint64_t v19 = v11;
    objc_msgSend(v10, sel_setTitle_, v11);

    uint64_t v20 = swift_task_alloc();
    v0[11] = v20;
    *(void *)(v20 + 16) = v10;
    id v21 = (void *)swift_task_alloc();
    v0[12] = v21;
    unint64_t v18 = sub_243250218();
    *id v21 = v0;
    v21[1] = sub_24324E260;
    unint64_t v15 = 0x800000024325CDB0;
    id v16 = sub_243250210;
    id v11 = v0 + 8;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    unint64_t v14 = 0xD000000000000013;
    uint64_t v17 = v20;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2360](v11, v12, v13, v14, v15, v16, v17, v18);
}

uint64_t sub_24324E260()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24324E4E8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24324E37C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24324E37C()
{
  uint64_t v1 = (void *)v0[9];
  uint64_t v2 = (void *)v0[10];
  os_log_type_t v3 = (void *)v0[8];
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClassUnconditional();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v1;
  v0[6] = sub_243250290;
  v0[7] = v5;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_243250778;
  v0[5] = &block_descriptor_235;
  uint64_t v6 = _Block_copy(v0 + 2);
  id v7 = v3;
  id v8 = v1;
  swift_release();
  objc_msgSend(v4, sel_setExpirationHandler_, v6);
  _Block_release(v6);

  int64_t v9 = *(void **)&v8[OBJC_IVAR___BEDownloadMonitor_backgroundTask];
  *(void *)&v8[OBJC_IVAR___BEDownloadMonitor_backgroundTask] = v4;

  id v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24324E4E8()
{
  uint64_t v1 = *(void **)(v0 + 80);
  swift_task_dealloc();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24324E550()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v1 = (void *)sub_243259A80();
  id v2 = objc_msgSend(v0, sel_initWithServiceName_, v1);

  id v3 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26F8B0660);
  objc_msgSend(v2, sel_setRemoteObjectInterface_, v3);

  objc_msgSend(v2, sel_resume);
  id v4 = objc_msgSend(v2, sel_remoteObjectProxy);
  sub_243259C50();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F5D0);
  if (swift_dynamicCast())
  {

    return v10;
  }
  else
  {
    if (qword_268D8F390 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2432599C0();
    __swift_project_value_buffer(v6, (uint64_t)qword_268D90230);
    id v7 = sub_2432599A0();
    os_log_type_t v8 = sub_243259BE0();
    if (os_log_type_enabled(v7, v8))
    {
      int64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v9 = 0;
      _os_log_impl(&dword_243238000, v7, v8, "Failed to get intermediary proxy", v9, 2u);
      MEMORY[0x245677390](v9, -1, -1);
    }

    objc_msgSend(v2, sel_invalidate);
    return 0;
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24324E78C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24324DF00(a1, a2);
  }
  return a1;
}

uint64_t sub_24324E7A0(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_24324E864(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_24324E7A0(__src, &__src[a2]);
  }
  sub_243259670();
  swift_allocObject();
  sub_243259660();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_243259770();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t _s16BrowserEngineKit17BEDownloadMonitorC17createAccessToken10Foundation4DataVSgyFZ_0()
{
  id v0 = (const char *)sandbox_extension_issue_mach();
  if (v0)
  {
    uint64_t v1 = (char *)v0;
    size_t v2 = strlen(v0);
    if (!__OFADD__(v2, 1)) {
      return sub_24324E864(v1, v2 + 1);
    }
    __break(1u);
    goto LABEL_9;
  }
  if (qword_268D8F390 != -1) {
LABEL_9:
  }
    swift_once();
  uint64_t v4 = sub_2432599C0();
  __swift_project_value_buffer(v4, (uint64_t)qword_268D90230);
  char v5 = sub_2432599A0();
  os_log_type_t v6 = sub_243259BE0();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_243238000, v5, v6, "Unable to get live activity access token", v7, 2u);
    MEMORY[0x245677390](v7, -1, -1);
  }

  return 0;
}

uint64_t type metadata accessor for BEDownloadMonitor(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_268D8F4C0);
}

uint64_t type metadata accessor for URLWithBookmark(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_268D8F4F0);
}

uint64_t sub_24324EA74()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24324EAAC(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_24324EAD8()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24324EB18(char *a1)
{
  sub_24324BEF8(a1, *(void (**)(id))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t type metadata accessor for DownloadProgress(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_268D8F500);
}

uint64_t sub_24324EB40(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24324EB78()
{
  return sub_243250028(&qword_268D8F480, MEMORY[0x263F07508]);
}

uint64_t sub_24324EBC0()
{
  return type metadata accessor for BEDownloadMonitor(0);
}

uint64_t sub_24324EBC8()
{
  uint64_t result = sub_2432597E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_243259760();
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_243259990();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t method lookup function for BEDownloadMonitor(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BEDownloadMonitor);
}

uint64_t dispatch thunk of BEDownloadMonitor.__allocating_init(sourceURL:destinationURL:observedProgress:liveActivityAccessToken:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of BEDownloadMonitor.useDownloadsFolder(placeholderType:finalFileCreatedHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of BEDownloadMonitor.beginMonitoring()()
{
  unint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0xF8);
  char v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_243250690;
  return v5();
}

uint64_t dispatch thunk of BEDownloadMonitor.resumeMonitoring(placeholderURL:)(uint64_t a1)
{
  uint64_t v4 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x100);
  id v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24323A500;
  return v7(a1);
}

uint64_t sub_24324EFC0()
{
  return type metadata accessor for BEDownloadMonitor.Location(0);
}

uint64_t sub_24324EFC8()
{
  uint64_t result = sub_243259760();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for BEDownloadMonitor.Location(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BEDownloadMonitor.Location);
}

uint64_t sub_24324F078()
{
  return type metadata accessor for URLWithBookmark(0);
}

uint64_t sub_24324F080()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_24324F0B8()
{
  return type metadata accessor for DownloadProgress(0);
}

uint64_t sub_24324F0C0()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for DownloadProgress(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DownloadProgress);
}

uint64_t dispatch thunk of DownloadProgress.__allocating_init(sourceURL:destinationURL:progress:liveActivityAccessToken:)()
{
  return (*(uint64_t (**)(void))(v0 + 640))();
}

uint64_t dispatch thunk of DownloadProgress.setUsePlaceholder(_:type:fileCreatedHandler:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of DownloadProgress.beginLegacy()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x290);
  char v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_24324F26C;
  return v5();
}

uint64_t sub_24324F26C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  unint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of DownloadProgress.resumeLegacy(placeholderURL:)(uint64_t a1)
{
  uint64_t v4 = *(int **)((*MEMORY[0x263F8EED0] & *v1) + 0x298);
  id v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24324CB44;
  return v7(a1);
}

uint64_t dispatch thunk of DownloadProgress.progress.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A0))();
}

uint64_t sub_24324F4C4()
{
  uint64_t v2 = v0[2];
  unint64_t v3 = (const void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24323A500;
  uint64_t v6 = (uint64_t (*)(uint64_t, const void *, void *))((char *)&dword_268D8F520 + dword_268D8F520);
  return v6(v2, v3, v4);
}

uint64_t sub_24324F57C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24323A500;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_268D8F530 + dword_268D8F530);
  return v6(v2, v3, v4);
}

uint64_t sub_24324F640(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_24323A500;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_268D8F540 + dword_268D8F540);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_24324F70C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24324F768(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24323A500;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268D8F550 + dword_268D8F550);
  return v6(a1, v4);
}

uint64_t sub_24324F824()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_24324CB44;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_268D8F560 + dword_268D8F560);
  return v5(v2, v3);
}

uint64_t sub_24324F8D8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_24324F8E8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24324F920()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t objectdestroy_129Tm()
{
  _Block_release(*(const void **)(v0 + 24));

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24324F980()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (const void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_24323A500;
  uint64_t v6 = (uint64_t (*)(uint64_t, const void *, void *))((char *)&dword_268D8F580 + dword_268D8F580);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_149Tm()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24324FA80()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_24323A500;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_268D8F5A0 + dword_268D8F5A0);
  return v5(v2, v3);
}

uint64_t objectdestroy_133Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24324FB74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24324FBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

char *keypath_get_selector_fractionCompleted()
{
  return sel_fractionCompleted;
}

id sub_24324FCAC@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_fractionCompleted);
  *a2 = v4;
  return result;
}

uint64_t sub_24324FCE0()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24324FD18()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_24324FD50(void **a1, uint64_t a2)
{
  sub_243247A0C(a1, a2, *(void *)(v2 + 16));
}

char *keypath_get_selector_isFinished()
{
  return sel_isFinished;
}

id sub_24324FD64@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isFinished);
  *a2 = (_BYTE)result;
  return result;
}

void sub_24324FD98(void **a1, uint64_t a2)
{
  sub_243248730(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

char *keypath_get_selector_isCancelled()
{
  return sel_isCancelled;
}

id sub_24324FDAC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isCancelled);
  *a2 = (_BYTE)result;
  return result;
}

void sub_24324FDE0(void **a1, uint64_t a2)
{
  sub_24324A5B4(a1, a2, v2);
}

void sub_24324FDE8(id *a1, uint64_t a2)
{
  sub_24324A71C(a1, a2, v2);
}

uint64_t sub_24324FDF0()
{
  uint64_t v1 = sub_243259760();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  unint64_t v7 = (v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = ((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v8, v6);
}

uint64_t sub_24324FEE0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_243259760() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (v5 + *(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  char v11 = *(unsigned char *)(v1 + v6 + 8);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  *uint64_t v12 = v2;
  v12[1] = sub_24323A500;
  return sub_243248E84(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_243250028(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_243250074()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24323A500;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_24324A1C4, 0, 0);
}

uint64_t sub_24325011C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_243250180(const char *a1)
{
  sub_2432480AC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

unint64_t sub_2432501A0()
{
  unint64_t result = qword_268D8F618;
  if (!qword_268D8F618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8F618);
  }
  return result;
}

void sub_2432501F4(uint64_t a1)
{
  sub_24324ADC4(a1, *(void *)(v1 + 16));
}

id sub_243250210(uint64_t a1)
{
  return sub_24324B46C(a1, *(void **)(v1 + 16));
}

unint64_t sub_243250218()
{
  unint64_t result = qword_268D8F620;
  if (!qword_268D8F620)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_268D8F620);
  }
  return result;
}

uint64_t sub_243250258()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_243250290()
{
  return sub_24324A8BC(*(void **)(v0 + 16));
}

uint64_t objectdestroy_224Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2432502DC()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24323A500;
  v3[3] = v2;
  return MEMORY[0x270FA2498](sub_24324AB8C, 0, 0);
}

uint64_t sub_243250388()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F640);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24325041C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F640);

  return sub_24324B7A4(a1);
}

unint64_t sub_243250490()
{
  unint64_t result = qword_268D8F648;
  if (!qword_268D8F648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8F648);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TaskRegistrationError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for TaskRegistrationError(unsigned char *result, int a2, int a3)
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
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2432505D4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TaskRegistrationError()
{
  return &type metadata for TaskRegistrationError;
}

unint64_t sub_243250610()
{
  unint64_t result = qword_268D8F650;
  if (!qword_268D8F650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8F650);
  }
  return result;
}

Swift::Bool __swiftcall RenderingExtensionConfiguration.accept(connection:)(NSXPCConnection connection)
{
  return 0;
}

uint64_t sub_24325069C()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t RenderingExtensionConfiguration.handleConnection(_:)()
{
  return (*v0)();
}

uint64_t dispatch thunk of RenderingExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of _RenderingExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_243250778(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_2432507BC()
{
  return sub_243259900();
}

uint64_t sub_2432509B4()
{
  uint64_t v1 = (void *)v0[28];
  uint64_t v12 = v0[27];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[25];
  uint64_t v4 = v0[23];
  uint64_t v5 = v0[20];
  uint64_t v6 = v0[21];
  uint64_t v7 = v0[19];
  uint64_t v9 = v0[16];
  uint64_t v8 = v0[17];
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v12, v2);
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
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

unint64_t sub_243250B10(char a1)
{
  unint64_t result = 0xD000000000000027;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000026;
      break;
    case 2:
      unint64_t result = 0xD000000000000024;
      break;
    case 4:
      unint64_t result = 0xD000000000000020;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_243250BA8()
{
  unint64_t result = qword_268D8F6D8;
  if (!qword_268D8F6D8)
  {
    sub_24323F8F4(255, &qword_268D8F6D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8F6D8);
  }
  return result;
}

void sub_243250C10(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_243259C70();
    sub_24323F8F4(0, &qword_268D8F6D0);
    sub_243250BA8();
    sub_243259BB0();
    uint64_t v1 = v25;
    uint64_t v24 = v26;
    uint64_t v2 = v27;
    int64_t v3 = v28;
    unint64_t v4 = v29;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v24 = a1 + 56;
    uint64_t v6 = ~v5;
    uint64_t v7 = -v5;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v4 = v8 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v2 = v6;
    int64_t v3 = 0;
  }
  uint64_t v22 = v2;
  int64_t v23 = (unint64_t)(v2 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
LABEL_8:
  if (v4)
  {
    uint64_t v9 = (v4 - 1) & v4;
    unint64_t v10 = __clz(__rbit64(v4)) | (v3 << 6);
    goto LABEL_29;
  }
  int64_t v12 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v12 < v23)
    {
      int64_t v13 = v3;
      unint64_t v14 = *(void *)(v24 + 8 * v12);
      ++v3;
      if (v14) {
        goto LABEL_28;
      }
      int64_t v3 = v12 + 1;
      if (v12 + 1 >= v23) {
        goto LABEL_36;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v3);
      if (v14) {
        goto LABEL_28;
      }
      int64_t v3 = v12 + 2;
      if (v12 + 2 >= v23) {
        goto LABEL_36;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v3);
      if (v14) {
        goto LABEL_28;
      }
      int64_t v3 = v12 + 3;
      if (v12 + 3 >= v23) {
        goto LABEL_36;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v3);
      if (v14)
      {
LABEL_28:
        uint64_t v9 = (v14 - 1) & v14;
        unint64_t v10 = __clz(__rbit64(v14)) + (v3 << 6);
LABEL_29:
        id v11 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
        if (v11)
        {
          while (1)
          {
            id v16 = objc_msgSend(v11, sel_extensionPointRecord, v22);
            id v17 = objc_msgSend(v16, sel_identifier);

            uint64_t v18 = sub_243259A90();
            uint64_t v20 = v19;

            if (v18 == 0xD000000000000020 && v20 == 0x800000024325D010) {
              break;
            }
            char v21 = sub_243259D20();
            swift_bridgeObjectRelease();
            if (v21) {
              goto LABEL_36;
            }

            unint64_t v4 = v9;
            if ((v1 & 0x8000000000000000) == 0) {
              goto LABEL_8;
            }
LABEL_10:
            if (sub_243259C80())
            {
              sub_24323F8F4(0, &qword_268D8F6D0);
              swift_unknownObjectRetain();
              swift_dynamicCast();
              id v11 = v30;
              swift_unknownObjectRelease();
              uint64_t v9 = v4;
              if (v30) {
                continue;
              }
            }
            goto LABEL_36;
          }
          swift_bridgeObjectRelease();
        }
        goto LABEL_36;
      }
      int64_t v3 = v12 + 4;
      if (v12 + 4 < v23)
      {
        unint64_t v14 = *(void *)(v24 + 8 * v3);
        if (!v14)
        {
          uint64_t v15 = v13 + 6;
          while (v23 != v15)
          {
            unint64_t v14 = *(void *)(v24 + 8 * v15++);
            if (v14)
            {
              int64_t v3 = v15 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_36;
        }
        goto LABEL_28;
      }
    }
LABEL_36:
    sub_2432541F4();
    return;
  }
  __break(1u);
}

uint64_t NetworkingProcess.makeLibXPCConnection()()
{
  return sub_243251230();
}

Swift::Void __swiftcall NetworkingProcess.invalidate()()
{
}

uint64_t WebContentProcess.makeLibXPCConnection()()
{
  return sub_243251230();
}

id WebContentProcess.createVisibilityPropagationInteraction()()
{
  return sub_24325134C();
}

Swift::Void __swiftcall WebContentProcess.invalidate()()
{
}

uint64_t sub_243251038(uint64_t (*a1)(void))
{
  uint64_t v2 = *(void **)(v1 + *(int *)(a1(0) + 20));
  int64_t v3 = (os_unfair_lock_s *)(v2[4] + 16);
  os_unfair_lock_lock(v3);
  uint64_t v4 = v2[2];
  if (v4)
  {
    v2[2] = 0;
    v2[3] = 0;
    sub_24324F8D8(v4);
  }
  os_unfair_lock_unlock(v3);
  sub_243259850();

  return sub_2432507BC();
}

uint64_t sub_2432510BC()
{
  uint64_t v2 = (void *)v0[28];
  uint64_t v1 = (void *)v0[29];
  uint64_t v3 = v0[25];
  uint64_t v12 = v0[24];
  uint64_t v13 = v0[27];
  uint64_t v4 = v0[23];
  uint64_t v6 = v0[20];
  uint64_t v5 = v0[21];
  uint64_t v7 = v0[19];
  uint64_t v9 = v0[16];
  uint64_t v8 = v0[17];
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v13, v12);
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
  unint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t RenderingProcess.makeLibXPCConnection()()
{
  return sub_243251230();
}

uint64_t sub_243251230()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_243259910();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  uint64_t v6 = sub_2432598E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

id RenderingProcess.createVisibilityPropagationInteraction()()
{
  return sub_24325134C();
}

id sub_24325134C()
{
  uint64_t v0 = sub_243259830();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x245676620](v2);
  sub_243259840();
  uint64_t v5 = sub_243259800();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  uint64_t v6 = (void *)sub_243259A80();
  id v7 = objc_msgSend(self, sel_interactionWithPID_environmentIdentifier_, v5, v6);

  return v7;
}

Swift::Void __swiftcall RenderingProcess.invalidate()()
{
}

uint64_t _s16BrowserEngineKit17WebContentProcessV10auditToken0aB4Core05AuditH0Vvg_0()
{
  MEMORY[0x245676620]();

  return sub_243259840();
}

uint64_t static __BEWebContentProcess.webContentProcess(interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2432520E8(a1, a2, a3, a4, (uint64_t)&unk_26F88FDD8, (uint64_t)&unk_268D8F6F8);
}

uint64_t sub_2432514F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  type metadata accessor for WebContentProcess(0);
  v7[6] = swift_task_alloc();
  uint64_t v10 = swift_task_alloc();
  v7[7] = v10;
  swift_retain();
  id v11 = (void *)swift_task_alloc();
  v7[8] = v11;
  *id v11 = v7;
  v11[1] = sub_2432515F8;
  return WebContentProcess.init(bundleIdentifier:onInterruption:)(v10, 0, 0, a4, a5);
}

uint64_t sub_2432515F8()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243254240;
  }
  else {
    uint64_t v2 = sub_243254244;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24325189C()
{
  return sub_243251DE8(&OBJC_IVAR___BEWebContentProcess_inner, type metadata accessor for WebContentProcess);
}

uint64_t sub_243251904()
{
  return sub_2432598E0();
}

void __BEWebContentProcess.init()()
{
}

id __BEWebContentProcess.__deallocating_deinit()
{
  return sub_243251F90(type metadata accessor for __BEWebContentProcess);
}

uint64_t static __BEWebContentProcess.webContentProcess(bundleIdentifier:interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_243252710(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_26F88FE00, (uint64_t)&unk_268D8F708);
}

uint64_t static __BERenderingProcess.renderingProcess(interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2432520E8(a1, a2, a3, a4, (uint64_t)&unk_26F88FE28, (uint64_t)&unk_268D8F718);
}

uint64_t sub_243251A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  type metadata accessor for RenderingProcess(0);
  v7[6] = swift_task_alloc();
  uint64_t v10 = swift_task_alloc();
  v7[7] = v10;
  swift_retain();
  id v11 = (void *)swift_task_alloc();
  v7[8] = v11;
  *id v11 = v7;
  v11[1] = sub_243251B24;
  return RenderingProcess.init(bundleIdentifier:onInterruption:)(v10, 0, 0, a4, a5);
}

uint64_t sub_243251B24()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243254240;
  }
  else {
    uint64_t v2 = sub_243254248;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_243251DC8()
{
  return sub_243251DE8(&OBJC_IVAR___BERenderingProcess_inner, type metadata accessor for RenderingProcess);
}

uint64_t sub_243251DE8(void *a1, uint64_t (*a2)(void))
{
  uint64_t v3 = v2 + *a1;
  uint64_t v4 = *(void **)(v3 + *(int *)(a2(0) + 20));
  uint64_t v5 = (os_unfair_lock_s *)(v4[4] + 16);
  os_unfair_lock_lock(v5);
  uint64_t v6 = v4[2];
  if (v6)
  {
    v4[2] = 0;
    v4[3] = 0;
    sub_24324F8D8(v6);
  }
  os_unfair_lock_unlock(v5);
  sub_243259850();

  return sub_2432507BC();
}

uint64_t sub_243251EB8()
{
  return sub_2432598E0();
}

id __BERenderingProcess.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void __BERenderingProcess.init()()
{
}

id __BERenderingProcess.__deallocating_deinit()
{
  return sub_243251F90(type metadata accessor for __BERenderingProcess);
}

id sub_243251F90(uint64_t (*a1)(void))
{
  v3.uint64_t receiver = v1;
  v3.Class super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t static __BERenderingProcess.renderingProcess(bundleIdentifier:interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_243252710(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_26F88FE50, (uint64_t)&unk_268D8F728);
}

uint64_t sub_243252028()
{
  id v1 = (void *)v0[9];
  uint64_t v2 = (void (*)(void, void *))v0[4];
  objc_super v3 = (void *)sub_243259690();
  v2(0, v3);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t static __BENetworkingProcess.networkProcess(interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2432520E8(a1, a2, a3, a4, (uint64_t)&unk_26F88FE78, (uint64_t)&unk_268D8F738);
}

uint64_t sub_2432520E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_243259B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  void v15[4] = a1;
  v15[5] = a2;
  v15[6] = a3;
  v15[7] = a4;
  swift_retain();
  swift_retain();
  sub_24323B154((uint64_t)v13, a6, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_243252204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  type metadata accessor for NetworkingProcess(0);
  v7[6] = swift_task_alloc();
  uint64_t v10 = swift_task_alloc();
  v7[7] = v10;
  swift_retain();
  uint64_t v11 = (void *)swift_task_alloc();
  v7[8] = v11;
  *uint64_t v11 = v7;
  v11[1] = sub_243252308;
  return NetworkingProcess.init(bundleIdentifier:onInterruption:)(v10, 0, 0, a4, a5);
}

uint64_t sub_243252308()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_243254240;
  }
  else {
    uint64_t v2 = sub_24325424C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2432525AC()
{
  return sub_243251DE8(&OBJC_IVAR___BENetworkingProcess_inner, type metadata accessor for NetworkingProcess);
}

uint64_t sub_243252614()
{
  return sub_2432598E0();
}

void __BENetworkingProcess.init()()
{
}

id __BENetworkingProcess.__deallocating_deinit()
{
  return sub_243251F90(type metadata accessor for __BENetworkingProcess);
}

uint64_t static __BENetworkingProcess.networkProcess(bundleIdentifier:interruptionHandler:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_243252710(a1, a2, a3, a4, a5, a6, (uint64_t)&unk_26F88FEA0, (uint64_t)&unk_268D8F748);
}

uint64_t sub_243252710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2380);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_243259B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  void v19[2] = 0;
  v19[3] = 0;
  v19[4] = a1;
  v19[5] = a2;
  v19[6] = a3;
  v19[7] = a4;
  v19[8] = a5;
  v19[9] = a6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_24323B154((uint64_t)v17, a8, (uint64_t)v19);
  return swift_release();
}

void sub_243252848(void *a1)
{
  uint64_t v2 = sub_243259910();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (os_unfair_lock_s *)(a1[4] + 16);
  os_unfair_lock_lock(v6);
  id v7 = (void (*)(uint64_t))a1[2];
  if (v7)
  {
    uint64_t v8 = swift_retain();
    v7(v8);
    sub_2432598F0();
    sub_24324F8D8((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v9 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    sub_24324F8D8(v9);
  }
  os_unfair_lock_unlock(v6);
}

uint64_t sub_24325297C()
{
  sub_24324F8D8(*(void *)(v0 + 16));
  swift_release();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

void sub_2432529BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_243259C70();
    sub_24323F8F4(0, &qword_268D8F6D0);
    sub_243250BA8();
    sub_243259BB0();
    uint64_t v3 = v35;
    uint64_t v32 = v36;
    uint64_t v4 = v37;
    uint64_t v5 = v38;
    unint64_t v6 = v39;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v32 = a1 + 56;
    uint64_t v8 = ~v7;
    uint64_t v9 = -v7;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v6 = v10 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v4 = v8;
    uint64_t v5 = 0;
  }
  uint64_t v30 = v4;
  int64_t v31 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_243259C80()) {
      goto LABEL_42;
    }
    sub_24323F8F4(0, &qword_268D8F6D0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v15 = v40;
    swift_unknownObjectRelease();
    uint64_t v14 = v5;
    uint64_t v12 = v6;
    if (!v40) {
      goto LABEL_42;
    }
LABEL_33:
    id v19 = objc_msgSend(v15, sel_extensionPointRecord, v30);
    id v20 = objc_msgSend(v19, sel_identifier);

    uint64_t v21 = sub_243259A90();
    uint64_t v23 = v22;

    if (v21 == 0xD000000000000027 && v23 == 0x800000024325CDF0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v24 = sub_243259D20();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0) {
        goto LABEL_9;
      }
    }
    if (!a3) {
      goto LABEL_42;
    }
    id v25 = objc_msgSend(v15, sel_bundleIdentifier);
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = sub_243259A90();
      uint64_t v29 = v28;

      if (v27 == a2 && v29 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_42:
        sub_2432541F4();
        return;
      }
      char v11 = sub_243259D20();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_42;
      }
    }
LABEL_9:

    uint64_t v5 = v14;
    unint64_t v6 = v12;
  }
  if (v6)
  {
    uint64_t v12 = (v6 - 1) & v6;
    unint64_t v13 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v14 = v5;
LABEL_32:
    id v15 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
    if (!v15) {
      goto LABEL_42;
    }
    goto LABEL_33;
  }
  int64_t v16 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v16 >= v31) {
      goto LABEL_42;
    }
    unint64_t v17 = *(void *)(v32 + 8 * v16);
    uint64_t v14 = v5 + 1;
    if (!v17)
    {
      uint64_t v14 = v5 + 2;
      if (v5 + 2 >= v31) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v32 + 8 * v14);
      if (!v17)
      {
        uint64_t v14 = v5 + 3;
        if (v5 + 3 >= v31) {
          goto LABEL_42;
        }
        unint64_t v17 = *(void *)(v32 + 8 * v14);
        if (!v17)
        {
          uint64_t v14 = v5 + 4;
          if (v5 + 4 >= v31) {
            goto LABEL_42;
          }
          unint64_t v17 = *(void *)(v32 + 8 * v14);
          if (!v17)
          {
            uint64_t v14 = v5 + 5;
            if (v5 + 5 >= v31) {
              goto LABEL_42;
            }
            unint64_t v17 = *(void *)(v32 + 8 * v14);
            if (!v17)
            {
              uint64_t v18 = v5 + 6;
              while (v31 != v18)
              {
                unint64_t v17 = *(void *)(v32 + 8 * v18++);
                if (v17)
                {
                  uint64_t v14 = v18 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v12 = (v17 - 1) & v17;
    unint64_t v13 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

void sub_243252DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_243259C70();
    sub_24323F8F4(0, &qword_268D8F6D0);
    sub_243250BA8();
    sub_243259BB0();
    uint64_t v3 = v41;
    uint64_t v38 = v42;
    uint64_t v4 = v43;
    uint64_t v5 = v44;
    unint64_t v6 = v45;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v38 = a1 + 56;
    uint64_t v8 = ~v7;
    uint64_t v9 = -v7;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v6 = v10 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v4 = v8;
    uint64_t v5 = 0;
  }
  uint64_t v36 = v4;
  int64_t v37 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_243259C80()) {
      goto LABEL_45;
    }
    sub_24323F8F4(0, &qword_268D8F6D0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v15 = v46;
    swift_unknownObjectRelease();
    uint64_t v14 = v5;
    uint64_t v12 = v6;
    if (!v46) {
      goto LABEL_45;
    }
LABEL_33:
    id v19 = objc_msgSend(v15, sel_extensionPointRecord, v36);
    id v20 = objc_msgSend(v19, sel_identifier);

    uint64_t v21 = sub_243259A90();
    uint64_t v23 = v22;

    if (v21 == 0xD000000000000024 && v23 == 0x800000024325D040) {
      goto LABEL_35;
    }
    char v24 = sub_243259D20();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
    {
      id v25 = objc_msgSend(v15, sel_extensionPointRecord);
      id v26 = objc_msgSend(v25, sel_identifier);

      uint64_t v27 = sub_243259A90();
      uint64_t v29 = v28;

      if (v27 != 0xD000000000000027 || v29 != 0x800000024325D070)
      {
        char v30 = sub_243259D20();
        swift_bridgeObjectRelease();
        if ((v30 & 1) == 0) {
          goto LABEL_9;
        }
        goto LABEL_40;
      }
LABEL_35:
      swift_bridgeObjectRelease();
    }
LABEL_40:
    if (!a3) {
      goto LABEL_45;
    }
    id v31 = objc_msgSend(v15, sel_bundleIdentifier);
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = sub_243259A90();
      uint64_t v35 = v34;

      if (v33 == a2 && v35 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_45:
        sub_2432541F4();
        return;
      }
      char v11 = sub_243259D20();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_45;
      }
    }
LABEL_9:

    uint64_t v5 = v14;
    unint64_t v6 = v12;
  }
  if (v6)
  {
    uint64_t v12 = (v6 - 1) & v6;
    unint64_t v13 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v14 = v5;
LABEL_32:
    id v15 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
    if (!v15) {
      goto LABEL_45;
    }
    goto LABEL_33;
  }
  int64_t v16 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v16 >= v37) {
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v38 + 8 * v16);
    uint64_t v14 = v5 + 1;
    if (!v17)
    {
      uint64_t v14 = v5 + 2;
      if (v5 + 2 >= v37) {
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v38 + 8 * v14);
      if (!v17)
      {
        uint64_t v14 = v5 + 3;
        if (v5 + 3 >= v37) {
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v38 + 8 * v14);
        if (!v17)
        {
          uint64_t v14 = v5 + 4;
          if (v5 + 4 >= v37) {
            goto LABEL_45;
          }
          unint64_t v17 = *(void *)(v38 + 8 * v14);
          if (!v17)
          {
            uint64_t v14 = v5 + 5;
            if (v5 + 5 >= v37) {
              goto LABEL_45;
            }
            unint64_t v17 = *(void *)(v38 + 8 * v14);
            if (!v17)
            {
              uint64_t v18 = v5 + 6;
              while (v37 != v18)
              {
                unint64_t v17 = *(void *)(v38 + 8 * v18++);
                if (v17)
                {
                  uint64_t v14 = v18 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_45;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v12 = (v17 - 1) & v17;
    unint64_t v13 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_2432532A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_243259910();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return v5(a1, v6, v3);
}

void sub_243253314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_243259C70();
    sub_24323F8F4(0, &qword_268D8F6D0);
    sub_243250BA8();
    sub_243259BB0();
    uint64_t v3 = v35;
    uint64_t v32 = v36;
    uint64_t v4 = v37;
    uint64_t v5 = v38;
    unint64_t v6 = v39;
  }
  else
  {
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v32 = a1 + 56;
    uint64_t v8 = ~v7;
    uint64_t v9 = -v7;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v6 = v10 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v4 = v8;
    uint64_t v5 = 0;
  }
  uint64_t v30 = v4;
  int64_t v31 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_243259C80()) {
      goto LABEL_42;
    }
    sub_24323F8F4(0, &qword_268D8F6D0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v15 = v40;
    swift_unknownObjectRelease();
    uint64_t v14 = v5;
    uint64_t v12 = v6;
    if (!v40) {
      goto LABEL_42;
    }
LABEL_33:
    id v19 = objc_msgSend(v15, sel_extensionPointRecord, v30);
    id v20 = objc_msgSend(v19, sel_identifier);

    uint64_t v21 = sub_243259A90();
    uint64_t v23 = v22;

    if (v21 == 0xD000000000000026 && v23 == 0x800000024325CE40)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v24 = sub_243259D20();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0) {
        goto LABEL_9;
      }
    }
    if (!a3) {
      goto LABEL_42;
    }
    id v25 = objc_msgSend(v15, sel_bundleIdentifier);
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = sub_243259A90();
      uint64_t v29 = v28;

      if (v27 == a2 && v29 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_42:
        sub_2432541F4();
        return;
      }
      char v11 = sub_243259D20();
      swift_bridgeObjectRelease();
      if (v11) {
        goto LABEL_42;
      }
    }
LABEL_9:

    uint64_t v5 = v14;
    unint64_t v6 = v12;
  }
  if (v6)
  {
    uint64_t v12 = (v6 - 1) & v6;
    unint64_t v13 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v14 = v5;
LABEL_32:
    id v15 = *(id *)(*(void *)(v3 + 48) + 8 * v13);
    if (!v15) {
      goto LABEL_42;
    }
    goto LABEL_33;
  }
  int64_t v16 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v16 >= v31) {
      goto LABEL_42;
    }
    unint64_t v17 = *(void *)(v32 + 8 * v16);
    uint64_t v14 = v5 + 1;
    if (!v17)
    {
      uint64_t v14 = v5 + 2;
      if (v5 + 2 >= v31) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v32 + 8 * v14);
      if (!v17)
      {
        uint64_t v14 = v5 + 3;
        if (v5 + 3 >= v31) {
          goto LABEL_42;
        }
        unint64_t v17 = *(void *)(v32 + 8 * v14);
        if (!v17)
        {
          uint64_t v14 = v5 + 4;
          if (v5 + 4 >= v31) {
            goto LABEL_42;
          }
          unint64_t v17 = *(void *)(v32 + 8 * v14);
          if (!v17)
          {
            uint64_t v14 = v5 + 5;
            if (v5 + 5 >= v31) {
              goto LABEL_42;
            }
            unint64_t v17 = *(void *)(v32 + 8 * v14);
            if (!v17)
            {
              uint64_t v18 = v5 + 6;
              while (v31 != v18)
              {
                unint64_t v17 = *(void *)(v32 + 8 * v18++);
                if (v17)
                {
                  uint64_t v14 = v18 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v12 = (v17 - 1) & v17;
    unint64_t v13 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_24325373C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24323A500;
  return sub_2432514F4(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_243253818(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24323A500;
  return sub_243251A20(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_2432538F0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  char v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *char v11 = v2;
  v11[1] = sub_24323A500;
  return sub_24323AACC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2432539E0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24323A500;
  return sub_243252204(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t getEnumTagSinglePayload for NetworkingProcess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for NetworkingProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t getEnumTagSinglePayload for WebContentProcess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t storeEnumTagSinglePayload for WebContentProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t *_s16BrowserEngineKit17NetworkingProcessVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_243259910();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s16BrowserEngineKit17NetworkingProcessVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RenderingProcess(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243253D94);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243259910();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for RenderingProcess(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243253E6C);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_243259910();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t method lookup function for __BEWebContentProcess(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for __BEWebContentProcess);
}

uint64_t dispatch thunk of __BEWebContentProcess.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of __BEWebContentProcess.makeLibXPCConnection()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t method lookup function for __BERenderingProcess(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for __BERenderingProcess);
}

uint64_t dispatch thunk of __BERenderingProcess.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of __BERenderingProcess.makeLibXPCConnection()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t method lookup function for __BENetworkingProcess(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for __BENetworkingProcess);
}

uint64_t dispatch thunk of __BENetworkingProcess.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of __BENetworkingProcess.makeLibXPCConnection()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t sub_2432540E8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2432540FC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_243254110(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_243254130()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t objectdestroy_14Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2432541BC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2432541F4()
{
  return swift_release();
}

void sub_2432541FC()
{
  sub_243252848(v0);
}

uint64_t _RenderingExtension._lockdown(version:)()
{
  return sub_24323A818();
}

uint64_t static RestrictedSandboxRevision.== infix(_:_:)()
{
  return 1;
}

uint64_t RestrictedSandboxRevision.hash(into:)()
{
  return sub_243259DA0();
}

void *static RestrictedSandboxRevision.allCases.getter()
{
  return &unk_26F88F4C8;
}

uint64_t RestrictedSandboxRevision.hashValue.getter()
{
  return sub_243259DB0();
}

void sub_2432542EC(void *a1@<X8>)
{
  *a1 = &unk_26F88F580;
}

uint64_t sub_243254304()
{
  return sub_24323A818();
}

uint64_t RestrictedSandboxAppliable.applyRestrictedSandbox(revision:)()
{
  return sub_24323A818();
}

uint64_t _LockdownVersion.rawValue.getter()
{
  return 3157553;
}

uint64_t _LockdownVersion.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_243259D00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void *static _LockdownVersion.allCases.getter()
{
  return &unk_26F88F1C8;
}

uint64_t sub_2432543B8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_243259D00();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_24325440C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _LockdownVersion.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_243254434(void *a1@<X8>)
{
  *a1 = &unk_26F88F2F0;
}

uint64_t sub_243254450()
{
  return sub_243259DB0();
}

uint64_t sub_24325449C()
{
  return sub_243259AF0();
}

uint64_t sub_2432544AC()
{
  return sub_243259DB0();
}

uint64_t _s16BrowserEngineKit20_WebContentExtensionPAAE9_lockdown7versionyAA16_LockdownVersionO_tF_0()
{
  sub_243259C90();
  swift_bridgeObjectRelease();
  sandbox_enable_local_state_flag();

  return sandbox_enable_local_state_flag();
}

unint64_t sub_24325455C()
{
  unint64_t result = qword_268D8F788;
  if (!qword_268D8F788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8F788);
  }
  return result;
}

uint64_t sub_2432545B0()
{
  return sub_243254658(&qword_268D8F790, &qword_268D8F798);
}

unint64_t sub_2432545DC()
{
  unint64_t result = qword_268D8F7A0;
  if (!qword_268D8F7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D8F7A0);
  }
  return result;
}

uint64_t sub_243254630()
{
  return sub_243254658(&qword_268D8F7A8, (uint64_t *)&unk_268D8F7B0);
}

uint64_t sub_243254658(unint64_t *a1, uint64_t *a2)
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

uint64_t dispatch thunk of RestrictedSandboxAppliable.applyRestrictedSandbox(revision:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

unsigned char *_s16BrowserEngineKit25RestrictedSandboxRevisionOwst_0(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x243254760);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for _LockdownVersion()
{
  return &type metadata for _LockdownVersion;
}

uint64_t dispatch thunk of _WebContentExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_2432547B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

unint64_t sub_2432547BC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C2238);
  uint64_t v2 = sub_243259CE0();
  int v3 = (void *)v2;
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
    sub_243258180(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_243257E8C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    char v11 = (uint64_t *)(v3[6] + 16 * result);
    *char v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2432581E8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_2432548E8()
{
  uint64_t v0 = sub_2432599C0();
  __swift_allocate_value_buffer(v0, qword_26B0C2870);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B0C2870);
  return sub_2432599B0();
}

Swift::Void __swiftcall ProcessCapability.Grant.invalidate()()
{
  uint64_t v2 = *(void **)v0;
  uint64_t v1 = *(void **)(v0 + 8);
  if (v1)
  {
    id v3 = v1;
    objc_msgSend(v2, sel_removeObserver_, v3);
    objc_msgSend(v2, sel_invalidate);
    id v5 = v3;
    sub_24323E1AC((uint64_t)v2);
  }
  else
  {
    uint64_t v4 = *(void **)v0;
    objc_msgSend(v4, sel_invalidate);
  }
}

id ProcessCapability.Grant.isValid.getter()
{
  return objc_msgSend(*v0, sel_isValid);
}

uint64_t sub_243254A3C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C23B0);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_26B0C2270 = result;
  return result;
}

uint64_t MediaEnvironment.init(webPage:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = (char *)a2 + *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  uint64_t v5 = sub_243259760();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  id v7 = objc_msgSend(self, sel_mainBundle);
  id v8 = objc_msgSend(v7, sel_bundleIdentifier);

  if (v8)
  {
    sub_243259A90();
  }
  getpid();
  if (qword_26B0C2260 != -1) {
    swift_once();
  }
  uint64_t v9 = (os_unfair_lock_s *)(qword_26B0C2270 + 16);
  swift_retain();
  os_unfair_lock_lock(v9);
  uint64_t result = swift_release();
  if (__OFADD__(qword_26B0C2248, 1))
  {
    __break(1u);
  }
  else
  {
    ++qword_26B0C2248;
    uint64_t v13 = sub_243259D10();
    uint64_t v14 = v11;
    sub_243259B00();
    sub_243259D10();
    sub_243259B00();
    swift_bridgeObjectRelease();
    sub_243259B00();
    sub_243259B00();
    swift_bridgeObjectRelease();
    uint64_t v12 = (os_unfair_lock_s *)qword_26B0C2270;
    swift_retain();
    os_unfair_lock_unlock(v12 + 4);
    swift_release();
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    *a2 = v13;
    a2[1] = v14;
  }
  return result;
}

uint64_t MediaEnvironment.init(xpcRepresentation:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F7C0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_243259760();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x2456774E0](a1);
  if (v11 != sub_2432599D0() || !xpc_dictionary_get_string(a1, "identifier"))
  {
    sub_243259A90();
    id v12 = objc_allocWithZone(MEMORY[0x263F087E8]);
    uint64_t v13 = (void *)sub_243259A80();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_initWithDomain_code_userInfo_, v13, -50, 0);

    swift_willThrow();
    return swift_unknownObjectRelease();
  }
  *a2 = sub_243259B10();
  a2[1] = v15;
  if (!xpc_dictionary_get_string(a1, "url"))
  {
    sub_243259A90();
    id v18 = objc_allocWithZone(MEMORY[0x263F087E8]);
    id v19 = (void *)sub_243259A80();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_initWithDomain_code_userInfo_, v19, -50, 0);

    swift_willThrow();
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  sub_243259B10();
  sub_243259750();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_243256C0C((uint64_t)v6);
    sub_243259A90();
    id v16 = objc_allocWithZone(MEMORY[0x263F087E8]);
    long long v17 = (void *)sub_243259A80();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_initWithDomain_code_userInfo_, v17, -50, 0);

    swift_willThrow();
    swift_unknownObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    id v20 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v20(v10, v6, v7);
    uint64_t v21 = type metadata accessor for MediaEnvironment(0);
    return ((uint64_t (*)(char *, char *, uint64_t))v20)((char *)a2 + *(int *)(v21 + 20), v10, v7);
  }
}

xpc_object_t MediaEnvironment.createXPCRepresentation()()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  uint64_t v1 = sub_243259AE0();
  xpc_dictionary_set_string(empty, "identifier", (const char *)(v1 + 32));
  swift_release();
  type metadata accessor for MediaEnvironment(0);
  sub_2432596E0();
  uint64_t v2 = sub_243259AE0();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_string(empty, "url", (const char *)(v2 + 32));
  swift_release();
  return empty;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MediaEnvironment.activate()()
{
  id v0 = objc_msgSend(self, sel_sharedAVSystemController);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = (void *)sub_243259A80();
    signed int v3 = objc_msgSend(v1, sel_grantMediaEndowmentWithEnvironmentID_endowmentPayload_, v2, 0);

    if (v3 != sub_2432599F0())
    {
      sub_243259A90();
      id v4 = objc_allocWithZone(MEMORY[0x263F087E8]);
      uint64_t v5 = (void *)sub_243259A80();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, v3, 0);

      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MediaEnvironment.suspend()()
{
  id v0 = objc_msgSend(self, sel_sharedAVSystemController);
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = (void *)sub_243259A80();
    signed int v3 = objc_msgSend(v1, sel_revokeMediaEndowmentWithEnvironmentID_, v2);

    if (v3 != sub_2432599F0())
    {
      sub_243259A90();
      id v4 = objc_allocWithZone(MEMORY[0x263F087E8]);
      uint64_t v5 = (void *)sub_243259A80();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, v3, 0);

      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

AVCaptureSession __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MediaEnvironment.makeCaptureSession()()
{
  id v0 = objc_allocWithZone(MEMORY[0x263EFA638]);
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_243259A80();
  swift_bridgeObjectRelease();
  uint64_t v2 = (objc_class *)objc_msgSend(v0, sel_initWithMediaEnvironment_, v1);

  id v4 = v2;
  result._internal = v3;
  result.super.isa = v4;
  return result;
}

uint64_t ProcessCapability.request()@<X0>(void *a1@<X8>)
{
  return sub_243255ADC(a1);
}

void NetworkingProcess.grantCapability(_:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void NetworkingProcess.grantCapability(_:invalidationHandler:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
}

void WebContentProcess.grantCapability(_:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void WebContentProcess.grantCapability(_:invalidationHandler:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
}

void RenderingProcess.grantCapability(_:)(uint64_t a1@<X0>, void *a2@<X8>)
{
}

void sub_243255548(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void)@<X3>, os_unfair_lock_s *a5@<X4>, void *a6@<X8>)
{
  int64_t v31 = a6;
  uint64_t v32 = a5;
  uint64_t v11 = sub_243259910();
  uint64_t v30 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ProcessCapability(0);
  MEMORY[0x270FA5388](v14);
  id v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33[3] = a2(0);
  v33[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v33);
  sub_24323F35C(v6, (uint64_t)boxed_opaque_existential_1, a4);
  uint64_t v18 = v35;
  sub_24323EF28(v33, 0, 0, v34);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
  if (!v18)
  {
    id v19 = v32;
    uint64_t v28 = v11;
    uint64_t v29 = v13;
    uint64_t v20 = v34[1];
    uint64_t v35 = v34[0];
    sub_24323F35C(a1, (uint64_t)v16, type metadata accessor for ProcessCapability);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v21 = *(void **)(v6 + *(int *)(((uint64_t (*)(void))v19)(0) + 20));
      uint64_t v22 = (os_unfair_lock_s *)(v21[4] + 16);
      os_unfair_lock_lock(v22);
      uint64_t v23 = (void (*)(uint64_t))v21[2];
      if (v23)
      {
        uint64_t v24 = swift_retain();
        id v25 = v29;
        uint64_t v32 = v22;
        v23(v24);
        sub_2432598F0();
        uint64_t v22 = v32;
        sub_24324F8D8((uint64_t)v23);
        (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v28);
        uint64_t v26 = v21[2];
        v21[2] = 0;
        v21[3] = 0;
        sub_24324F8D8(v26);
      }
      os_unfair_lock_unlock(v22);
    }
    else
    {
      sub_24323F508((uint64_t)v16, type metadata accessor for ProcessCapability);
    }
    uint64_t v27 = v31;
    *int64_t v31 = v35;
    v27[1] = v20;
  }
}

void RenderingProcess.grantCapability(_:invalidationHandler:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
}

void sub_243255830(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t a5@<X4>, uint64_t (*a6)(void)@<X5>, uint64_t (*a7)(void)@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v35 = a7;
  uint64_t v36 = a2;
  uint64_t v12 = v8;
  uint64_t v37 = a3;
  uint64_t v34 = a8;
  uint64_t v14 = sub_243259910();
  uint64_t v33 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for ProcessCapability(0);
  MEMORY[0x270FA5388](v17);
  id v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38[3] = a4(0);
  v38[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
  sub_24323F35C(v12, (uint64_t)boxed_opaque_existential_1, a6);
  uint64_t v21 = a1;
  uint64_t v22 = v40;
  sub_24323EF28(v38, v36, v37, v39);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v38);
  if (!v22)
  {
    uint64_t v23 = v35;
    uint64_t v24 = v16;
    uint64_t v40 = v14;
    uint64_t v25 = v39[0];
    uint64_t v26 = v39[1];
    sub_24323F35C(v21, (uint64_t)v19, type metadata accessor for ProcessCapability);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v37 = v26;
      uint64_t v27 = *(void **)(v12 + *(int *)(v23(0) + 20));
      uint64_t v28 = (os_unfair_lock_s *)(v27[4] + 16);
      os_unfair_lock_lock(v28);
      uint64_t v29 = (void (*)(uint64_t))v27[2];
      if (v29)
      {
        uint64_t v30 = swift_retain();
        uint64_t v36 = v25;
        v29(v30);
        sub_2432598F0();
        sub_24324F8D8((uint64_t)v29);
        uint64_t v25 = v36;
        (*(void (**)(char *, uint64_t))(v33 + 8))(v24, v40);
        uint64_t v31 = v27[2];
        v27[2] = 0;
        v27[3] = 0;
        sub_24324F8D8(v31);
      }
      os_unfair_lock_unlock(v28);
      uint64_t v32 = v34;
      uint64_t v26 = v37;
    }
    else
    {
      sub_24323F508((uint64_t)v19, type metadata accessor for ProcessCapability);
      uint64_t v32 = v34;
    }
    *uint64_t v32 = v25;
    v32[1] = v26;
  }
}

uint64_t ProcessCapability._request()@<X0>(void *a1@<X8>)
{
  return sub_243255ADC(a1);
}

uint64_t sub_243255ADC@<X0>(void *a1@<X8>)
{
  v2[3] = &type metadata for Process;
  sub_24323EF28(v2, 0, 0, a1);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

uint64_t sub_243255F64(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  id v5 = a1;
  a4();

  return 1;
}

id BEMediaEnvironment.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void BEMediaEnvironment.init()()
{
}

id BEMediaEnvironment.__deallocating_deinit()
{
  return sub_243256444(type metadata accessor for BEMediaEnvironment);
}

void BEProcessCapability.init()()
{
}

id BEProcessCapability.__deallocating_deinit()
{
  return sub_243256444(type metadata accessor for BEProcessCapability);
}

id sub_243256444(uint64_t (*a1)(void))
{
  v3.uint64_t receiver = v1;
  v3.Class super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_243256484(uint64_t a1)
{
  return sub_243256774(a1, &OBJC_IVAR___BEWebContentProcess_inner, _s15_ProcessAdaptorVMa_2, (uint64_t)&off_26F88F4A8, type metadata accessor for WebContentProcess);
}

uint64_t sub_243256510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323EBD8(a1, a2, a3, &OBJC_IVAR___BEWebContentProcess_inner, _s15_ProcessAdaptorVMa_2, (uint64_t)&off_26F88F4A8, type metadata accessor for WebContentProcess);
}

uint64_t sub_243256560(uint64_t a1)
{
  return sub_243256774(a1, &OBJC_IVAR___BENetworkingProcess_inner, _s15_ProcessAdaptorVMa_3, (uint64_t)&off_26F88F488, type metadata accessor for NetworkingProcess);
}

id sub_2432565EC(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t (*a6)(void), uint64_t a7, uint64_t (*a8)(void))
{
  id v13 = a3;
  id v14 = a1;
  uint64_t v15 = (void *)sub_243256774((uint64_t)v13, a5, a6, a7, a8);

  return v15;
}

uint64_t sub_2432566D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323EBD8(a1, a2, a3, &OBJC_IVAR___BENetworkingProcess_inner, _s15_ProcessAdaptorVMa_3, (uint64_t)&off_26F88F488, type metadata accessor for NetworkingProcess);
}

uint64_t sub_243256724(uint64_t a1)
{
  return sub_243256774(a1, &OBJC_IVAR___BERenderingProcess_inner, _s15_ProcessAdaptorVMa_4, (uint64_t)&off_26F88F3D8, type metadata accessor for RenderingProcess);
}

uint64_t sub_243256774(uint64_t a1, void *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v9 = v5 + *a2;
  v14[3] = a3(0);
  v14[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  sub_24323F35C(v9, (uint64_t)boxed_opaque_existential_1, a5);
  sub_24323EF28(v14, 0, 0, v15);
  uint64_t result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  if (!v6)
  {
    uint64_t v12 = v15[0];
    uint64_t v13 = v15[1];
    type metadata accessor for _BEProcessCapabilityGrant();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v12;
    *(void *)(result + 24) = v13;
  }
  return result;
}

uint64_t sub_243256878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24323EBD8(a1, a2, a3, &OBJC_IVAR___BERenderingProcess_inner, _s15_ProcessAdaptorVMa_4, (uint64_t)&off_26F88F3D8, type metadata accessor for RenderingProcess);
}

void sub_2432568C8(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C23C0);
  unint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_24325BF40;
  *(void *)(v5 + 32) = objc_msgSend(self, sel_attributeWithCompletionPolicy_, 1);
  sub_243259B40();
  unint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_24325BF40;
  uint64_t v7 = *v3;
  uint64_t v8 = v3[1];
  if (v5 >> 62)
  {
    sub_24323F8F4(0, &qword_26B0C2388);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_243259CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_243259D30();
    sub_24323F8F4(0, &qword_26B0C2388);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_243259A80();
  char v10 = (void *)sub_243259A80();
  swift_bridgeObjectRelease();
  sub_24323F8F4(0, &qword_26B0C2388);
  uint64_t v11 = (void *)sub_243259B30();
  swift_bridgeObjectRelease();
  id v12 = objc_msgSend(self, sel_grantWithNamespace_sourceEnvironment_attributes_, v9, v10, v11);

  *(void *)(v6 + 32) = v12;
  sub_243259B40();
  swift_bridgeObjectRetain();
  if (v6 >> 62)
  {
    sub_243259CD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_243259D30();
  }
  swift_bridgeObjectRelease();
  id v13 = sub_24323FAE4(a1, v7, v8);
  swift_bridgeObjectRelease();
  if (!v15) {
    sub_24323F930(v13, (uint64_t)nullsub_1, 0, a2);
  }
}

uint64_t sub_243256C0C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F7C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s15_ProcessAdaptorVMa_1(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_268D8F868);
}

uint64_t _s15_ProcessAdaptorVMa_0(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_268D8F858);
}

uint64_t _s15_ProcessAdaptorVMa(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_268D8F848);
}

uint64_t type metadata accessor for BEMediaEnvironment(uint64_t a1)
{
  return sub_24324EB40(a1, (uint64_t *)&unk_26B0C2290);
}

uint64_t *initializeBufferWithCopyOfBuffer for ProcessCapability(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v15 = a2[1];
      *a1 = *a2;
      a1[1] = v15;
      uint64_t v16 = a2[2];
      uint64_t v17 = a2[3];
      a1[2] = v16;
      a1[3] = v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      uint64_t v9 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
      char v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_243259760();
      id v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
      swift_bridgeObjectRetain();
      v13(v10, v11, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *assignWithCopy for ProcessCapability(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24323F508((uint64_t)a1, type metadata accessor for ProcessCapability);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      uint64_t v7 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_243259760();
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
      swift_bridgeObjectRetain();
      v11(v8, v9, v10);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

_OWORD *initializeWithTake for ProcessCapability(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    uint64_t v6 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_243259760();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for ProcessCapability(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24323F508((uint64_t)a1, type metadata accessor for ProcessCapability);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      uint64_t v6 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_243259760();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessCapability(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ProcessCapability(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2432571CC()
{
  return swift_storeEnumTagMultiPayload();
}

void *initializeBufferWithCopyOfBuffer for ProcessCapability.Grant(void *a1, uint64_t a2)
{
  objc_super v3 = *(void **)a2;
  id v4 = *(void **)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  id v6 = v4;
  return a1;
}

void destroy for ProcessCapability.Grant(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
}

uint64_t assignWithCopy for ProcessCapability.Grant(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void **)(a1 + 8);
  uint64_t v8 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v8;
  id v9 = v8;

  return a1;
}

uint64_t assignWithTake for ProcessCapability.Grant(uint64_t a1, _OWORD *a2)
{
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

ValueMetadata *type metadata accessor for ProcessCapability.Grant()
{
  return &type metadata for ProcessCapability.Grant;
}

uint64_t *initializeBufferWithCopyOfBuffer for MediaEnvironment(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  objc_super v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *objc_super v3 = *a2;
    objc_super v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_243259760();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for MediaEnvironment(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_243259760();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for MediaEnvironment(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_243259760();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for MediaEnvironment(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_243259760();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for MediaEnvironment(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_243259760();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for MediaEnvironment(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_243259760();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2432576A4);
}

uint64_t sub_2432576A4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_243259760();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for MediaEnvironment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243257768);
}

uint64_t sub_243257768(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_243259760();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_243257810()
{
  return type metadata accessor for BEMediaEnvironment(0);
}

uint64_t sub_243257818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243240E84(a1, a2, a3, type metadata accessor for MediaEnvironment);
}

uint64_t method lookup function for BEMediaEnvironment(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BEMediaEnvironment);
}

uint64_t method lookup function for BEProcessCapability(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BEProcessCapability);
}

id sub_243257890()
{
  return sub_243256444((uint64_t (*)(void))type metadata accessor for ProcessCapability.AssertionObserver);
}

uint64_t *sub_2432578A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2432586CC(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_2432578C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2432587A4(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_2432578D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243258830(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_2432578F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2432588C8(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_243257908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243258950(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_243257920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243257934);
}

uint64_t sub_243257934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_31Tm(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_24325794C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243257960);
}

uint64_t sub_243257960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_32Tm(a1, a2, a3, a4, type metadata accessor for RenderingProcess);
}

uint64_t *sub_243257978(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2432586CC(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_243257990(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2432587A4(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_2432579A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243258830(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_2432579C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2432588C8(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_2432579D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243258950(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_2432579F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243257A04);
}

uint64_t sub_243257A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_31Tm(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t __swift_get_extra_inhabitant_index_31Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);

  return v7(a1, a2, v6);
}

uint64_t sub_243257A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243257AA0);
}

uint64_t sub_243257AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_32Tm(a1, a2, a3, a4, type metadata accessor for WebContentProcess);
}

uint64_t __swift_store_extra_inhabitant_index_32Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v7 = a5(0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);

  return v8(a1, a2, a2, v7);
}

uint64_t *sub_243257B2C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2432586CC(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_243257B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2432587A4(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_243257B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243258830(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_243257B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2432588C8(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_243257B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243258950(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_243257BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243257BB8);
}

uint64_t sub_243257BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_31Tm(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_243257BD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243257BE4);
}

uint64_t sub_243257BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_32Tm(a1, a2, a3, a4, type metadata accessor for NetworkingProcess);
}

ValueMetadata *type metadata accessor for Process()
{
  return &type metadata for Process;
}

uint64_t sub_243257C0C()
{
  uint64_t v0 = sub_243259830();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  objc_super v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243259820();
  uint64_t v4 = sub_243259800();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_243257CD8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_243257D10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MediaEnvironment(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_243257D74(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_243257DAC(uint64_t (*a1)(void))
{
  return a1();
}

void sub_243257DD4(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_243259C20();
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

unint64_t sub_243257E8C(uint64_t a1, uint64_t a2)
{
  sub_243259D90();
  sub_243259AF0();
  uint64_t v4 = sub_243259DB0();

  return sub_243257F04(a1, a2, v4);
}

unint64_t sub_243257F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_243259D20() & 1) == 0)
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
      while (!v14 && (sub_243259D20() & 1) == 0);
    }
  }
  return v6;
}

id sub_243257FE8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2218);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24325BF50;
  uint64_t v3 = sub_243259A90();
  uint64_t v4 = MEMORY[0x263F8D310];
  *(void *)(inited + 32) = v3;
  *(void *)(inited + 40) = v5;
  *(void *)(inited + 72) = v4;
  *(void *)(inited + 48) = 0xD00000000000001BLL;
  *(void *)(inited + 56) = 0x800000024325D390;
  *(void *)(inited + 80) = sub_243259A90();
  *(void *)(inited + 88) = v6;
  *(void *)(inited + 120) = sub_24323F8F4(0, (unint64_t *)&unk_26B0C2220);
  *(void *)(inited + 96) = a1;
  id v7 = a1;
  sub_2432547BC(inited);
  id v8 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v9 = (void *)sub_243259A80();
  uint64_t v10 = (void *)sub_243259A70();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_initWithDomain_code_userInfo_, v9, 2, v10);

  return v11;
}

uint64_t sub_243258148()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_243258180(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C2230);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2432581E8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *sub_2432581F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for MediaEnvironment(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = *(int *)(v4 + 20);
    id v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_243259760();
    id v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return a1;
}

uint64_t sub_2432582EC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = a1 + *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  uint64_t v3 = sub_243259760();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

void *sub_243258368(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_243259760();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *sub_24325840C(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_243259760();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *sub_2432584AC(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_243259760();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *sub_243258534(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(int *)(type metadata accessor for MediaEnvironment(0) + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_243259760();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t sub_2432585C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2432585D8);
}

uint64_t sub_2432585D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_31Tm(a1, a2, a3, type metadata accessor for MediaEnvironment);
}

uint64_t sub_2432585F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243258604);
}

uint64_t sub_243258604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_32Tm(a1, a2, a3, a4, type metadata accessor for MediaEnvironment);
}

uint64_t sub_24325861C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243258630);
}

uint64_t sub_243258630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_31Tm(a1, a2, a3, type metadata accessor for WebContentProcess);
}

uint64_t sub_243258648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24325865C);
}

uint64_t sub_24325865C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_32Tm(a1, a2, a3, a4, type metadata accessor for WebContentProcess);
}

uint64_t sub_243258674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243258688);
}

uint64_t sub_243258688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_31Tm(a1, a2, a3, type metadata accessor for NetworkingProcess);
}

uint64_t sub_2432586A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2432586B4);
}

uint64_t sub_2432586B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_32Tm(a1, a2, a3, a4, type metadata accessor for NetworkingProcess);
}

uint64_t *sub_2432586CC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  int v7 = *(_DWORD *)(*(void *)(v6 - 8) + 80);
  if ((v7 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v7 + 16) & ~(unint64_t)v7));
  }
  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = sub_243259910();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_2432587A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  uint64_t v8 = a4(0);
  *(void *)(a1 + *(int *)(v8 + 20)) = *(void *)(a2 + *(int *)(v8 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_243258830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24))(a1, a2, v7);
  uint64_t v8 = a4(0);
  *(void *)(a1 + *(int *)(v8 + 20)) = *(void *)(a2 + *(int *)(v8 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2432588C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
  uint64_t v8 = a4(0);
  *(void *)(a1 + *(int *)(v8 + 20)) = *(void *)(a2 + *(int *)(v8 + 20));
  return a1;
}

uint64_t sub_243258950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = sub_243259910();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 40))(a1, a2, v7);
  uint64_t v8 = a4(0);
  *(void *)(a1 + *(int *)(v8 + 20)) = *(void *)(a2 + *(int *)(v8 + 20));
  swift_release();
  return a1;
}

uint64_t sub_2432589E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2432589F4);
}

uint64_t sub_2432589F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_31Tm(a1, a2, a3, type metadata accessor for RenderingProcess);
}

uint64_t sub_243258A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243258A20);
}

uint64_t sub_243258A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_32Tm(a1, a2, a3, a4, type metadata accessor for RenderingProcess);
}

Swift::Bool __swiftcall BrowserEngineEntitlement.check(auditToken:)(audit_token_t_optional *auditToken)
{
  sub_243258BB4((uint64_t)auditToken, (uint64_t)&v9);
  uint64_t v2 = sub_243259830();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243258BB4((uint64_t)auditToken, (uint64_t)v10);
  if (v10[32] == 1)
  {
    sub_243259820();
    sub_243259810();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_243259840();
  char v6 = sub_2432597F0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6 & 1;
}

uint64_t sub_243258BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D8F878);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

Swift::Bool __swiftcall NetworkingExtensionConfiguration.accept(connection:)(NSXPCConnection connection)
{
  return 0;
}

uint64_t sub_243258C24()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t NetworkingExtensionConfiguration.handleConnection(_:)()
{
  return (*v0)();
}

uint64_t sub_243258CD4@<X0>(void *a1@<X8>)
{
  return _NetworkingExtension._request(capability:)(a1);
}

uint64_t _NetworkingExtension._request(capability:)@<X0>(void *a1@<X8>)
{
  v2[3] = &type metadata for Process;
  void v2[4] = &off_26F88F728;
  sub_24323EF28(v2, 0, 0, a1);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

uint64_t dispatch thunk of NetworkingExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of _NetworkingExtension._request(capability:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of _NetworkingExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_243259640()
{
  return MEMORY[0x270EED9A8]();
}

uint64_t sub_243259650()
{
  return MEMORY[0x270EEDA90]();
}

uint64_t sub_243259660()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_243259670()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_243259680()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_243259690()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2432596A0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2432596B0()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_2432596C0()
{
  return MEMORY[0x270EEFBF0]();
}

uint64_t sub_2432596D0()
{
  return MEMORY[0x270EEFC48]();
}

uint64_t sub_2432596E0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2432596F0()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_243259700()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_243259710()
{
  return MEMORY[0x270EEFE00]();
}

uint64_t sub_243259720()
{
  return MEMORY[0x270EEFE18]();
}

uint64_t sub_243259730()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_243259740()
{
  return MEMORY[0x270EEFE38]();
}

uint64_t sub_243259750()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_243259760()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_243259770()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_243259780()
{
  return MEMORY[0x270EF00F0]();
}

uint64_t sub_243259790()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2432597A0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2432597B0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2432597C0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_2432597D0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2432597E0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2432597F0()
{
  return MEMORY[0x270EE2800]();
}

uint64_t sub_243259800()
{
  return MEMORY[0x270EE2808]();
}

uint64_t sub_243259810()
{
  return MEMORY[0x270EE2810]();
}

uint64_t sub_243259820()
{
  return MEMORY[0x270EE2818]();
}

uint64_t sub_243259830()
{
  return MEMORY[0x270EE2820]();
}

uint64_t sub_243259840()
{
  return MEMORY[0x270EE2828]();
}

uint64_t sub_243259850()
{
  return MEMORY[0x270EEB728]();
}

uint64_t sub_243259860()
{
  return MEMORY[0x270EEB730]();
}

uint64_t sub_243259870()
{
  return MEMORY[0x270EEB738]();
}

uint64_t sub_243259880()
{
  return MEMORY[0x270EEB740]();
}

uint64_t sub_243259890()
{
  return MEMORY[0x270EEB748]();
}

uint64_t sub_2432598A0()
{
  return MEMORY[0x270EEB758]();
}

uint64_t sub_2432598C0()
{
  return MEMORY[0x270EEB768]();
}

uint64_t sub_2432598D0()
{
  return MEMORY[0x270EEB770]();
}

uint64_t sub_2432598E0()
{
  return MEMORY[0x270EEB778]();
}

uint64_t sub_2432598F0()
{
  return MEMORY[0x270EEB780]();
}

uint64_t sub_243259900()
{
  return MEMORY[0x270EEB790]();
}

uint64_t sub_243259910()
{
  return MEMORY[0x270EEB798]();
}

uint64_t sub_243259920()
{
  return MEMORY[0x270EEB7C0]();
}

uint64_t sub_243259930()
{
  return MEMORY[0x270EEB7C8]();
}

uint64_t sub_243259940()
{
  return MEMORY[0x270EEB8E8]();
}

uint64_t sub_243259950()
{
  return MEMORY[0x270EEB8F0]();
}

uint64_t sub_243259960()
{
  return MEMORY[0x270FA1750]();
}

uint64_t sub_243259970()
{
  return MEMORY[0x270FA17A0]();
}

uint64_t sub_243259980()
{
  return MEMORY[0x270FA1800]();
}

uint64_t sub_243259990()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2432599A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2432599B0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2432599C0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2432599D0()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_2432599E0()
{
  return MEMORY[0x270FA2C30]();
}

uint64_t sub_2432599F0()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t sub_243259A00()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_243259A10()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_243259A20()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_243259A30()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_243259A40()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_243259A50()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_243259A60()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_243259A70()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_243259A80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_243259A90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_243259AA0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_243259AB0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_243259AC0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_243259AD0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_243259AE0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_243259AF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_243259B00()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_243259B10()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_243259B20()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_243259B30()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_243259B40()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_243259B50()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_243259B60()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_243259B70()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_243259B80()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_243259B90()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_243259BA0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_243259BB0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_243259BC0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_243259BD0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_243259BE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_243259BF0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_243259C00()
{
  return MEMORY[0x270FA0C90]();
}

uint64_t sub_243259C10()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_243259C20()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_243259C30()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_243259C40()
{
  return MEMORY[0x270EF2418]();
}

uint64_t sub_243259C50()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_243259C60()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_243259C70()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_243259C80()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_243259C90()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_243259CA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_243259CB0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_243259CC0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_243259CD0()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_243259CE0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_243259CF0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_243259D00()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_243259D10()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_243259D20()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_243259D30()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_243259D50()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_243259D60()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_243259D70()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_243259D80()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_243259D90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_243259DA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_243259DB0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x270F10758]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
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

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

uint64_t sandbox_enable_local_state_flag()
{
  return MEMORY[0x270EDB2B0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_mach()
{
  return MEMORY[0x270EDB2D0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x270EDB460](path, name, value, size, *(void *)&position, *(void *)&options);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
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

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}