Swift::Void __swiftcall StartHomeWidgetIntentsService()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t vars8;

  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  v0 = sub_252897B80();
  __swift_project_value_buffer(v0, (uint64_t)qword_269C2E278);
  v1 = sub_252897B60();
  v2 = sub_252897FD0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_252856000, v1, v2, "Starting AppIntentsExtension", v3, 2u);
    MEMORY[0x2533BFA60](v3, -1, -1);
  }

  v4 = self;
  v5 = (void *)sub_252897CA0();
  objc_msgSend(v4, sel_setDefaultEffectiveBundleIdentifier_, v5);

  sub_252897790();
  sub_252897780();
  if (qword_269C2D3C0 != -1) {
    swift_once();
  }
  if (qword_269C2D3C8 != -1) {
    swift_once();
  }
  v6 = byte_269C2E258;
  v7 = qword_269C2E260;
  v8 = (void (*)(void))unk_269C2E268;
  sub_25285B9D0(v6, v7, v8);
}

uint64_t sub_252858C7C()
{
  type metadata accessor for Dispatcher();
  uint64_t result = swift_initStaticObject();
  qword_269C2E250 = result;
  return result;
}

uint64_t sub_252858CA8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  *(unsigned char *)(v4 + 144) = a4;
  *(void *)(v4 + 72) = a2;
  *(void *)(v4 + 80) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D580);
  *(void *)(v4 + 88) = swift_task_alloc();
  *(void *)(v4 + 96) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D5C8);
  *(void *)(v4 + 104) = swift_task_alloc();
  uint64_t v5 = sub_2528976E0();
  *(void *)(v4 + 112) = v5;
  *(void *)(v4 + 120) = *(void *)(v5 - 8);
  *(void *)(v4 + 128) = swift_task_alloc();
  sub_252897E80();
  *(void *)(v4 + 136) = sub_252897E70();
  uint64_t v7 = sub_252897E60();
  return MEMORY[0x270FA2498](sub_252858E10, v7, v6);
}

uint64_t sub_252858E10()
{
  unint64_t v1 = *(void *)(v0 + 80);
  sub_2528975E0();
  if (v1 >> 62)
  {
    sub_2528974D0();
    uint64_t result = sub_252898350();
    uint64_t v2 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v35 = *(uint64_t (**)(void))(v0 + 8);
    return v35();
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = sub_2528974D0();
  if (!v2) {
    goto LABEL_26;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    unint64_t v39 = v1 & 0xC000000000000001;
    uint64_t v37 = *(void *)(v0 + 80) + 32;
    v38 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 120) + 8);
    uint64_t v36 = v2;
    while (1)
    {
      if (v39) {
        id v5 = (id)MEMORY[0x2533BF180](v4, *(void *)(v0 + 80));
      }
      else {
        id v5 = *(id *)(v37 + 8 * v4);
      }
      uint64_t v6 = v5;
      if (*(unsigned char *)(v0 + 144))
      {
LABEL_17:
        uint64_t v22 = *(void *)(v0 + 88);
        uint64_t v21 = *(void *)(v0 + 96);
        v23 = (void *)swift_allocObject();
        v23[2] = 0;
        v24 = v23 + 2;
        v23[3] = 0;
        v23[4] = v6;
        uint64_t v25 = sub_252897EB0();
        uint64_t v26 = *(void *)(v25 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v21, 1, 1, v25);
        sub_25285C90C(v21, v22);
        LODWORD(v22) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v22, 1, v25);
        id v27 = v6;
        uint64_t v28 = *(void *)(v0 + 88);
        if (v22 == 1)
        {
          sub_25285C7C8(*(void *)(v0 + 88), &qword_269C2D580);
          if (*v24) {
            goto LABEL_19;
          }
LABEL_21:
          uint64_t v29 = 0;
          uint64_t v31 = 0;
        }
        else
        {
          sub_252897EA0();
          (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v28, v25);
          if (!*v24) {
            goto LABEL_21;
          }
LABEL_19:
          swift_getObjectType();
          swift_unknownObjectRetain();
          uint64_t v29 = sub_252897E60();
          uint64_t v31 = v30;
          swift_unknownObjectRelease();
        }
        uint64_t v32 = **(void **)(v0 + 72);
        uint64_t v33 = swift_allocObject();
        *(void *)(v33 + 16) = &unk_269C2D5D8;
        *(void *)(v33 + 24) = v23;
        uint64_t v34 = v31 | v29;
        if (v31 | v29)
        {
          uint64_t v34 = v0 + 16;
          *(void *)(v0 + 16) = 0;
          *(void *)(v0 + 24) = 0;
          *(void *)(v0 + 32) = v29;
          *(void *)(v0 + 40) = v31;
        }
        *(void *)(v0 + 48) = 1;
        *(void *)(v0 + 56) = v34;
        *(void *)(v0 + 64) = v32;
        swift_task_create();

        sub_2528975E0();
        goto LABEL_6;
      }
      sub_252897790();
      uint64_t v7 = (void *)sub_252897770();
      id v8 = objc_msgSend(v6, sel_uniqueIdentifier);
      sub_2528976A0();

      uint64_t v9 = sub_252897760();
      if (*(void *)(v9 + 16))
      {
        unint64_t v10 = sub_2528694B8(*(void *)(v0 + 128));
        uint64_t v11 = *(void *)(v0 + 104);
        if (v12)
        {
          unint64_t v13 = v10;
          uint64_t v14 = *(void *)(v9 + 56);
          uint64_t v15 = sub_252897800();
          uint64_t v16 = *(void *)(v15 - 8);
          (*(void (**)(uint64_t, unint64_t, uint64_t))(v16 + 16))(v11, v14 + *(void *)(v16 + 72) * v13, v15);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v11, 0, 1, v15);
          uint64_t v2 = v36;
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v11 = *(void *)(v0 + 104);
      }
      uint64_t v15 = sub_252897800();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
LABEL_16:
      uint64_t v17 = *(void *)(v0 + 128);
      uint64_t v18 = *(void *)(v0 + 104);
      uint64_t v19 = *(void *)(v0 + 112);
      swift_bridgeObjectRelease();
      (*v38)(v17, v19);
      sub_252897800();
      int v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48))(v18, 1, v15);
      sub_25285C7C8(v18, &qword_269C2D5C8);
      if (v20 == 1) {
        goto LABEL_17;
      }

LABEL_6:
      if (v2 == ++v4) {
        goto LABEL_26;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_252859358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D5C8);
  v3[4] = swift_task_alloc();
  type metadata accessor for HomeID();
  v3[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252859418, 0, 0);
}

uint64_t sub_252859418()
{
  int v20 = v0;
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v2 = (id *)(v0 + 3);
  unint64_t v1 = (void *)v0[3];
  uint64_t v3 = sub_252897B80();
  __swift_project_value_buffer(v3, (uint64_t)qword_269C2E278);
  id v4 = v1;
  uint64_t v5 = sub_252897B60();
  os_log_type_t v6 = sub_252897FD0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[5];
    id v8 = (void *)v0[3];
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v19 = v18;
    *(_DWORD *)uint64_t v9 = 136315138;
    id v10 = objc_msgSend(v8, sel_uniqueIdentifier);
    sub_2528976A0();

    uint64_t v11 = _s17HomeWidgetIntents0A2IDV11descriptionSSvg_0();
    unint64_t v13 = v12;
    sub_25285CAFC(v7);
    v0[2] = sub_252868708(v11, v13, &v19);
    sub_2528980D0();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_252856000, v5, v6, "Asking DataModel to rebuild snapshot of home: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v18, -1, -1);
    MEMORY[0x2533BFA60](v9, -1, -1);
  }
  else
  {
    id v14 = *v2;
  }
  v0[6] = sub_252897790();
  sub_252897E80();
  v0[7] = sub_252897E70();
  uint64_t v16 = sub_252897E60();
  return MEMORY[0x270FA2498](sub_252859680, v16, v15);
}

uint64_t sub_252859680()
{
  sub_2528975E0();
  *(void *)(v0 + 64) = sub_252897770();
  return MEMORY[0x270FA2498](sub_2528596F0, 0, 0);
}

uint64_t sub_2528596F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D5F0);
  sub_25285CA58();
  uint64_t v1 = sub_252897F20();
  v0[9] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[10] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_2528597BC;
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  return MEMORY[0x270F3A2E8](v3, v4, 0, v1);
}

uint64_t sub_2528597BC()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 64);
  uint64_t v2 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  sub_25285C7C8(v2, &qword_269C2D5C8);
  return MEMORY[0x270FA2498](sub_252859918, 0, 0);
}

uint64_t sub_252859918()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_252859980()
{
  return swift_deallocClassInstance();
}

uint64_t sub_252859990()
{
  sub_25285CBA0();
  uint64_t result = sub_252898050();
  byte_269C2E258 = 1;
  qword_269C2E260 = result;
  unk_269C2E268 = sub_2528599E4;
  qword_269C2E270 = 0;
  return result;
}

id sub_2528599E4()
{
  if (qword_269C2D3C0 != -1) {
    swift_once();
  }
  id v0 = objc_msgSend(self, sel_sharedDispatcher);
  id v1 = objc_msgSend(v0, sel_homeManager);

  return v1;
}

uint64_t sub_252859A74()
{
  uint64_t v0 = sub_252897720();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F47E20], v0);
  sub_25285CB58(&qword_269C2D600, MEMORY[0x263F47E30]);
  char v4 = sub_252897710();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v4) {
    uint64_t result = sub_252897730();
  }
  else {
    uint64_t result = 0;
  }
  byte_269C2D3D8 = result & 1;
  return result;
}

uint64_t static IntentsService.isMatterFeatureEnabled.getter()
{
  if (qword_269C2D3D0 != -1) {
    swift_once();
  }
  return byte_269C2D3D8;
}

uint64_t sub_252859C00()
{
  v1[3] = v0;
  sub_252897E80();
  v1[4] = sub_252897E70();
  uint64_t v3 = sub_252897E60();
  v1[5] = v3;
  v1[6] = v2;
  return MEMORY[0x270FA2498](sub_252859C98, v3, v2);
}

uint64_t sub_252859C98()
{
  uint64_t v1 = *(void **)(v0[3] + 24);
  if (v1)
  {
    id v2 = v1;
    sub_2528975E0();
    uint64_t v3 = (uint64_t (*)(id))v0[1];
    return v3(v2);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v0[7] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_252859D80;
    return sub_25285A618();
  }
}

uint64_t sub_252859D80(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 64) = a1;
  *(void *)(v4 + 72) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 48);
  uint64_t v6 = *(void *)(v3 + 40);
  if (v1) {
    uint64_t v7 = sub_25285A384;
  }
  else {
    uint64_t v7 = sub_252859EC4;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_252859EC4()
{
  uint64_t v1 = v0[8];
  sub_2528975E0();
  if (v1)
  {
    id v2 = (void *)v0[8];
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_252897B80();
    __swift_project_value_buffer(v3, (uint64_t)qword_269C2E278);
    uint64_t v4 = sub_252897B60();
    os_log_type_t v5 = sub_252897FD0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_252856000, v4, v5, "HomeKitDispatcher.homeManager was successfully created", v6, 2u);
      MEMORY[0x2533BFA60](v6, -1, -1);
    }
    uint64_t v7 = v0[8];
    uint64_t v8 = v0[3];

    uint64_t v9 = *(void **)(v8 + 24);
    *(void *)(v8 + 24) = v7;
    id v10 = v2;

    uint64_t v11 = (uint64_t (*)(id))v0[1];
    return v11(v10);
  }
  else
  {
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_252897B80();
    __swift_project_value_buffer(v13, (uint64_t)qword_269C2E278);
    id v14 = sub_252897B60();
    os_log_type_t v15 = sub_252897FB0();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_252856000, v14, v15, "HomeKitDispatcher.homeManager framework gave nil HMHomeManager", v16, 2u);
      MEMORY[0x2533BFA60](v16, -1, -1);
    }

    uint64_t v17 = sub_252898010();
    sub_25285CB58(&qword_269C2D570, MEMORY[0x263F47880]);
    uint64_t v18 = (void *)swift_allocError();
    uint64_t v19 = *(void (**)(uint64_t, void, uint64_t))(*(void *)(v17 - 8) + 104);
    v19(v20, *MEMORY[0x263F47870], v17);
    swift_willThrow();
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v13, (uint64_t)qword_269C2E278);
    id v21 = v18;
    id v22 = v18;
    v23 = sub_252897B60();
    os_log_type_t v24 = sub_252897FB0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 138412290;
      id v26 = v18;
      id v27 = v19;
      uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
      v0[2] = v28;
      sub_2528980D0();
      *uint64_t v31 = v28;
      uint64_t v19 = v27;

      _os_log_impl(&dword_252856000, v23, v24, "HomeKitDispatcher.homeManager failed: %@", v25, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D578);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v31, -1, -1);
      MEMORY[0x2533BFA60](v25, -1, -1);
    }
    else
    {
    }
    swift_allocError();
    *uint64_t v29 = v18;
    v19((uint64_t)v29, *MEMORY[0x263F47878], v17);
    swift_willThrow();
    uint64_t v30 = (uint64_t (*)(void))v0[1];
    return v30();
  }
}

uint64_t sub_25285A384()
{
  sub_2528975E0();
  uint64_t v1 = (void *)v0[9];
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897B80();
  __swift_project_value_buffer(v2, (uint64_t)qword_269C2E278);
  id v3 = v1;
  id v4 = v1;
  os_log_type_t v5 = sub_252897B60();
  os_log_type_t v6 = sub_252897FB0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v10;
    sub_2528980D0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_252856000, v5, v6, "HomeKitDispatcher.homeManager failed: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D578);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v8, -1, -1);
    MEMORY[0x2533BFA60](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = sub_252898010();
  sub_25285CB58(&qword_269C2D570, MEMORY[0x263F47880]);
  swift_allocError();
  *unint64_t v12 = v1;
  (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v12, *MEMORY[0x263F47878], v11);
  swift_willThrow();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_25285A618()
{
  v1[4] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D580);
  v1[5] = swift_task_alloc();
  v1[6] = sub_252897E80();
  v1[7] = sub_252897E70();
  uint64_t v3 = sub_252897E60();
  v1[8] = v3;
  v1[9] = v2;
  return MEMORY[0x270FA2498](sub_25285A6E4, v3, v2);
}

uint64_t sub_25285A6E4()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = *(void *)(v1 + 16);
  v0[10] = v2;
  if (v2)
  {
    uint64_t v3 = v0 + 3;
    sub_2528974E0();
    id v4 = (void *)swift_task_alloc();
    v0[11] = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D598);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D5A0);
    *id v4 = v0;
    uint64_t v7 = sub_25285A8F0;
  }
  else
  {
    uint64_t v3 = v0 + 2;
    uint64_t v8 = v0[5];
    sub_252897E90();
    uint64_t v9 = sub_252897EB0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
    uint64_t v10 = sub_252897E70();
    uint64_t v11 = swift_allocObject();
    uint64_t v12 = MEMORY[0x263F8F500];
    *(void *)(v11 + 16) = v10;
    *(void *)(v11 + 24) = v12;
    uint64_t v2 = sub_25285B5C8(v8, (uint64_t)&unk_269C2D590, v11);
    v0[13] = v2;
    *(void *)(v1 + 16) = v2;
    sub_2528974E0();
    sub_2528975E0();
    id v4 = (void *)swift_task_alloc();
    v0[14] = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D598);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D5A0);
    *id v4 = v0;
    uint64_t v7 = sub_25285AAAC;
  }
  v4[1] = v7;
  uint64_t v13 = MEMORY[0x263F8E4E0];
  return MEMORY[0x270FA1FA8](v3, v2, v5, v6, v13);
}

uint64_t sub_25285A8F0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(void *)(v2 + 64);
  if (v0) {
    uint64_t v5 = sub_25285AC84;
  }
  else {
    uint64_t v5 = sub_25285AA2C;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25285AA2C()
{
  sub_2528975E0();
  sub_2528975E0();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25285AAAC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(void *)(v2 + 64);
  if (v0) {
    uint64_t v5 = sub_25285ACFC;
  }
  else {
    uint64_t v5 = sub_25285ABE8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_25285ABE8()
{
  uint64_t v1 = v0[4];
  sub_2528975E0();
  uint64_t v2 = v0[2];
  *(void *)(v1 + 16) = 0;
  sub_2528975E0();
  sub_2528975E0();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_25285AC84()
{
  sub_2528975E0();
  sub_2528975E0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25285ACFC()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_2528975E0();
  *(void *)(v1 + 16) = 0;
  sub_2528975E0();
  sub_2528975E0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_25285AD90(uint64_t a1)
{
  v1[2] = a1;
  sub_252897E80();
  v1[3] = sub_252897E70();
  uint64_t v3 = sub_252897E60();
  v1[4] = v3;
  v1[5] = v2;
  return MEMORY[0x270FA2498](sub_25285AE28, v3, v2);
}

uint64_t sub_25285AE28()
{
  if (qword_269C2D3C0 != -1) {
    swift_once();
  }
  uint64_t v1 = self;
  *(void *)(v0 + 48) = v1;
  id v2 = objc_msgSend(v1, sel_sharedDispatcher);
  id v3 = objc_msgSend(v2, sel_homeManager);
  *(void *)(v0 + 56) = v3;

  if (v3)
  {
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_252897B80();
    *(void *)(v0 + 64) = __swift_project_value_buffer(v4, (uint64_t)qword_269C2E278);
    uint64_t v5 = sub_252897B60();
    os_log_type_t v6 = sub_252897FD0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_252856000, v5, v6, "Requesting all homes from HomeKit", v7, 2u);
      MEMORY[0x2533BFA60](v7, -1, -1);
    }

    uint64_t v11 = (uint64_t (__cdecl *)())((char *)&dword_269C2D5A8 + dword_269C2D5A8);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_25285B04C;
    return v11();
  }
  else
  {
    sub_2528975E0();
    **(void **)(v0 + 16) = 0;
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
}

uint64_t sub_25285B04C(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 80) = a1;
  *(void *)(v4 + 88) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 40);
  uint64_t v6 = *(void *)(v3 + 32);
  if (v1) {
    uint64_t v7 = sub_25285B32C;
  }
  else {
    uint64_t v7 = sub_25285B190;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_25285B190()
{
  if (*(void *)(*(void *)(v0 + 80) + 16)
    && (objc_msgSend(*(id *)(v0 + 48), sel_synchronizesHomeDataModel) & 1) != 0)
  {
    uint64_t v8 = (uint64_t (*)(uint64_t, char))((char *)&dword_269C2D5B0 + dword_269C2D5B0);
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_25285B39C;
    uint64_t v2 = *(void *)(v0 + 80);
    return v8(v2, 0);
  }
  else
  {
    sub_2528975E0();
    sub_2528975E0();
    uint64_t v4 = sub_252897B60();
    os_log_type_t v5 = sub_252897FD0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_252856000, v4, v5, "Finished synchronizing all homes from HomeKit.", v6, 2u);
      MEMORY[0x2533BFA60](v6, -1, -1);
    }

    **(void **)(v0 + 16) = *(void *)(v0 + 56);
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_25285B32C()
{
  sub_2528975E0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25285B39C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  sub_2528975E0();
  uint64_t v2 = *(void *)(v1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  return MEMORY[0x270FA2498](sub_25285B4E0, v3, v2);
}

uint64_t sub_25285B4E0()
{
  sub_2528975E0();
  uint64_t v1 = sub_252897B60();
  os_log_type_t v2 = sub_252897FD0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_252856000, v1, v2, "Finished synchronizing all homes from HomeKit.", v3, 2u);
    MEMORY[0x2533BFA60](v3, -1, -1);
  }

  **(void **)(v0 + 16) = *(void *)(v0 + 56);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_25285B5C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_252897EB0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_252897EA0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25285C7C8(a1, &qword_269C2D580);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_252897E60();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D598);
  return swift_task_create();
}

uint64_t IntentsService.deinit()
{
  sub_2528975E0();

  return v0;
}

uint64_t IntentsService.__deallocating_deinit()
{
  sub_2528975E0();

  return swift_deallocClassInstance();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_25285B7F0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_25285B800(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25285B80C(int *a1)
{
  uint64_t v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *os_log_type_t v2 = v1;
  v2[1] = sub_25285B8D8;
  return v4();
}

uint64_t sub_25285B8D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_25285B9D0(char a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = self;
  uint64_t v7 = v6;
  if (a1)
  {
    objc_msgSend(v6, sel_setOverrideSynchronizesHomeDataModel_, 1);
    objc_msgSend(v7, sel_setSynchronizesHomeDataModel_, 1);
    uint64_t v8 = self;
    objc_msgSend(v8, sel_setConfiguration_, a2);
    id v9 = objc_msgSend(v8, sel_sharedDispatcher);
    objc_msgSend(v9, sel_warmup);

    sub_252897790();
    id v10 = (id)sub_252897770();
    a3();
    sub_252897740();
  }
  else
  {
    objc_msgSend(v6, sel_setConfiguration_, a2);
    id v10 = objc_msgSend(v7, sel_sharedDispatcher);
    objc_msgSend(v10, sel_warmup);
  }
}

uint64_t type metadata accessor for Dispatcher()
{
  return self;
}

uint64_t type metadata accessor for IntentsService()
{
  return self;
}

uint64_t method lookup function for IntentsService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IntentsService);
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

uint64_t sub_25285BBB8()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25285BBF0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25285BC9C;
  return sub_25285AD90(a1);
}

uint64_t sub_25285BC9C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25285BD90()
{
  sub_252897E80();
  v0[2] = sub_252897E70();
  uint64_t v2 = sub_252897E60();
  v0[3] = v2;
  v0[4] = v1;
  return MEMORY[0x270FA2498](sub_25285BE24, v2, v1);
}

uint64_t sub_25285BE24()
{
  *(void *)(v0 + 40) = objc_msgSend(self, sel_sharedDispatcher);
  sub_252897BF0();
  unint64_t v2 = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  void *v3 = v0;
  v3[1] = sub_25285BEE8;
  v4.n128_u64[0] = v2;
  return MEMORY[0x270F3A0B8](v4);
}

uint64_t sub_25285BEE8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = *(void *)(v3 + 24);
    uint64_t v5 = *(void *)(v3 + 32);
    uint64_t v6 = sub_25285C098;
  }
  else
  {

    uint64_t v4 = *(void *)(v3 + 24);
    uint64_t v5 = *(void *)(v3 + 32);
    uint64_t v6 = sub_25285C004;
  }
  return MEMORY[0x270FA2498](v6, v4, v5);
}

uint64_t sub_25285C004()
{
  uint64_t v1 = *(void *)(v0 + 56);
  sub_2528975E0();
  if (v1 < 0 || (v1 & 0x4000000000000000) != 0)
  {
    uint64_t v2 = (uint64_t)sub_252869DBC(*(void *)(v0 + 56));
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = v1 & 0xFFFFFFFFFFFFFF8;
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_25285C098()
{
  sub_2528975E0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25285C108(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 104) = a2;
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = sub_252897E80();
  *(void *)(v2 + 48) = sub_252897E70();
  uint64_t v4 = sub_252897E60();
  *(void *)(v2 + 56) = v4;
  *(void *)(v2 + 64) = v3;
  return MEMORY[0x270FA2498](sub_25285C1A8, v4, v3);
}

uint64_t sub_25285C1A8()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    sub_2528982E0();
    uint64_t v3 = (void **)(v1 + 32);
    do
    {
      uint64_t v4 = *v3++;
      id v5 = v4;
      sub_2528982B0();
      sub_2528982F0();
      sub_252898300();
      sub_2528982C0();
      --v2;
    }
    while (v2);
    uint64_t v6 = v18;
    *(void *)(v0 + 72) = v18;
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_252897B80();
    __swift_project_value_buffer(v7, (uint64_t)qword_269C2E278);
    swift_bridgeObjectRetain_n();
    uint64_t v8 = sub_252897B60();
    os_log_type_t v9 = sub_252897FD0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      uint64_t v18 = v11;
      *(_DWORD *)uint64_t v10 = 136315394;
      *(void *)(v0 + 16) = sub_252868708(0xD000000000000027, 0x800000025289B7E0, &v18);
      sub_2528980D0();
      *(_WORD *)(v10 + 12) = 2048;
      if (v6 < 0 || (v6 & 0x4000000000000000) != 0)
      {
        sub_2528974D0();
        uint64_t v12 = sub_252898350();
        sub_2528975E0();
      }
      else
      {
        uint64_t v12 = *(void *)(v6 + 16);
      }
      sub_2528975E0();
      *(void *)(v0 + 24) = v12;
      sub_2528980D0();
      sub_2528975E0();
      _os_log_impl(&dword_252856000, v8, v9, "%s: will sync %ld homes", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v11, -1, -1);
      MEMORY[0x2533BFA60](v10, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    char v15 = *(unsigned char *)(v0 + 104);
    *(void *)(v0 + 80) = sub_252897E70();
    uint64_t v16 = swift_task_alloc();
    *(void *)(v0 + 88) = v16;
    *(void *)(v16 + 16) = v6;
    *(unsigned char *)(v16 + 24) = v15;
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_25285C52C;
    return MEMORY[0x270FA2320]();
  }
  else
  {
    sub_2528975E0();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
}

uint64_t sub_25285C52C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  sub_2528975E0();
  sub_2528975E0();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 64);
  uint64_t v3 = *(void *)(v1 + 56);
  return MEMORY[0x270FA2498](sub_25285C6B0, v3, v2);
}

uint64_t sub_25285C6B0()
{
  sub_2528975E0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25285C710(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  char v7 = *(unsigned char *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_25285BC9C;
  return sub_252858CA8(a1, a2, v6, v7);
}

uint64_t sub_25285C7C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25285C824()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_25285C864()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_25285CC38;
  return sub_252859358(v2, v3, v4);
}

uint64_t sub_25285C90C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25285C974()
{
  sub_2528975E0();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25285C9AC()
{
  uint64_t v2 = *(int **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25285CC38;
  uint64_t v4 = (uint64_t (*)(int *))((char *)&dword_269C2D5E0 + dword_269C2D5E0);
  return v4(v2);
}

unint64_t sub_25285CA58()
{
  unint64_t result = qword_269C2D5F8;
  if (!qword_269C2D5F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C2D5F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2D5F8);
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

uint64_t sub_25285CAFC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HomeID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25285CB58(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25285CBA0()
{
  unint64_t result = qword_269C2D608;
  if (!qword_269C2D608)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C2D608);
  }
  return result;
}

void type metadata accessor for ComparisonResult()
{
  if (!qword_269C2D610)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269C2D610);
    }
  }
}

uint64_t sub_25285CC3C()
{
  return sub_2528976B0();
}

unint64_t sub_25285CCC8()
{
  return bswap64(sub_2528976C0());
}

unint64_t sub_25285CCE4()
{
  sub_2528976C0();
  return bswap64(v0);
}

uint64_t static HomeXLModuleConfigurationIntent.attributionBundleIdentifier.getter()
{
  swift_beginAccess();
  uint64_t v0 = *(void *)aComAppleHome;
  sub_2528974D0();
  return v0;
}

uint64_t static HomeXLModuleConfigurationIntent.attributionBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  *(void *)aComAppleHome = a1;
  *(void *)&aComAppleHome[8] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static HomeXLModuleConfigurationIntent.attributionBundleIdentifier.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_25285CE0C()
{
  uint64_t v0 = sub_252897610();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252897700();
  MEMORY[0x270FA5388]();
  sub_252897C90();
  MEMORY[0x270FA5388]();
  uint64_t v4 = sub_252897630();
  __swift_allocate_value_buffer(v4, qword_269C2D870);
  __swift_project_value_buffer(v4, (uint64_t)qword_269C2D870);
  sub_252897C40();
  sub_2528976F0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06D18], v0);
  return sub_252897640();
}

uint64_t static HomeXLModuleConfigurationIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25285D358(&qword_269C2D3E0, MEMORY[0x263F06D40], (uint64_t)qword_269C2D870, a1);
}

uint64_t sub_25285D030()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = sub_252897610();
  uint64_t v2 = *(void *)(v9[0] - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252897700();
  MEMORY[0x270FA5388]();
  sub_252897C90();
  MEMORY[0x270FA5388]();
  uint64_t v5 = sub_252897630();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = sub_2528973E0();
  __swift_allocate_value_buffer(v7, qword_269C2D888);
  __swift_project_value_buffer(v7, (uint64_t)qword_269C2D888);
  sub_252897C40();
  sub_2528976F0();
  (*(void (**)(char *, void, void))(v2 + 104))(v4, *MEMORY[0x263F06D18], v9[0]);
  sub_252897640();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v1, 1, 1, v5);
  return sub_2528973F0();
}

uint64_t static HomeXLModuleConfigurationIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25285D358(&qword_269C2D3E8, MEMORY[0x263EFBA28], (uint64_t)qword_269C2D888, a1);
}

uint64_t sub_25285D358@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = __swift_project_value_buffer(v7, a3);
  os_log_type_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);
  return v9(a4, v8, v7);
}

uint64_t HomeXLModuleConfigurationIntent.init()@<X0>(char **a1@<X8>)
{
  v53 = a1;
  uint64_t v1 = sub_252897420();
  MEMORY[0x270FA5388](v1 - 8);
  v52 = (char *)v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  MEMORY[0x270FA5388](v3 - 8);
  v51 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252897500();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v73 = v5;
  uint64_t v74 = v6;
  MEMORY[0x270FA5388](v5);
  v72 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A8);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v63 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v48 = (char *)v47 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8B0);
  MEMORY[0x270FA5388](v12 - 8);
  v50 = (char *)v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v14 - 8);
  v61 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_252897610();
  uint64_t v16 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v18 = (char *)v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_252897700();
  MEMORY[0x270FA5388](v19 - 8);
  v54 = (char *)v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_252897C90();
  MEMORY[0x270FA5388](v21 - 8);
  v23 = (char *)v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_252897630();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8B8);
  v64 = v23;
  sub_252897C40();
  sub_2528976F0();
  unsigned int v70 = *MEMORY[0x263F06D18];
  v67 = *(void (**)(char *))(v16 + 104);
  uint64_t v71 = v16 + 104;
  v56 = v18;
  v67(v18);
  unint64_t v60 = 0x8000000252898CF0;
  sub_252897640();
  id v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  uint64_t v59 = v25 + 56;
  v65 = v26;
  id v27 = v61;
  uint64_t v62 = v24;
  v26(v61, 1, 1, v24);
  LOBYTE(v76) = 1;
  uint64_t v28 = sub_252897E50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v50, 1, 1, v28);
  uint64_t v55 = sub_252897340();
  uint64_t v29 = *(void *)(v55 - 8);
  v57 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
  uint64_t v58 = v29 + 56;
  uint64_t v30 = v48;
  v57(v48, 1, 1, v55);
  unsigned int v69 = *MEMORY[0x263EFBDC8];
  uint64_t v31 = v73;
  uint64_t v32 = *(void (**)(void))(v74 + 104);
  v74 += 104;
  v68 = (void (*)(char *, void, uint64_t))v32;
  v32(v72);
  v50 = (char *)sub_2528973B0();
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8C0);
  sub_252897C40();
  sub_2528976F0();
  ((void (*)(char *, void, uint64_t))v67)(v56, v70, v66);
  sub_252897640();
  v65(v27, 1, 1, v24);
  LOBYTE(v76) = 0;
  uint64_t v33 = v30;
  uint64_t v34 = v30;
  uint64_t v35 = v55;
  uint64_t v36 = v57;
  v57(v33, 1, 1, v55);
  v36(v63, 1, 1, v35);
  v68(v72, v69, v31);
  sub_25285DEA8();
  uint64_t v49 = sub_252897390();
  v47[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8D0);
  sub_252897C40();
  sub_2528976F0();
  uint64_t v37 = v56;
  ((void (*)(char *, void, uint64_t))v67)(v56, v70, v66);
  sub_252897640();
  v38 = v61;
  v65(v61, 1, 1, v62);
  uint64_t v39 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v51, 1, 1, v39);
  uint64_t v40 = v55;
  v41 = v57;
  v57(v34, 1, 1, v55);
  v41(v63, 1, 1, v40);
  v42 = v72;
  v68(v72, v69, v73);
  sub_25285DEFC();
  uint64_t v43 = sub_2528973A0();
  v63 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8E0);
  sub_252897C40();
  sub_2528976F0();
  ((void (*)(char *, void, uint64_t))v67)(v37, v70, v66);
  sub_252897640();
  v65(v38, 1, 1, v62);
  uint64_t v76 = 0;
  sub_252897410();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D950);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v75 = sub_252897560();
  v68(v42, v69, v73);
  sub_25285F950();
  sub_252860C78(&qword_269C2D8E8, &qword_269C2D8F0);
  uint64_t result = sub_2528973C0();
  v45 = v53;
  uint64_t v46 = v49;
  *v53 = v50;
  v45[1] = (char *)v46;
  v45[2] = (char *)v43;
  v45[3] = (char *)result;
  return result;
}

unint64_t sub_25285DEA8()
{
  unint64_t result = qword_269C2D8C8;
  if (!qword_269C2D8C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2D8C8);
  }
  return result;
}

unint64_t sub_25285DEFC()
{
  unint64_t result = qword_269C2D8D8;
  if (!qword_269C2D8D8)
  {
    type metadata accessor for SelectedHomeEntity();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2D8D8);
  }
  return result;
}

uint64_t HomeXLModuleConfigurationIntent.init(home:)@<X0>(uint64_t a1@<X0>, char **a2@<X8>)
{
  uint64_t v60 = a1;
  v61 = a2;
  sub_252897420();
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v58 = (char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v59 = (uint64_t)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v70 = (uint64_t)&v54 - v5;
  uint64_t v80 = sub_252897500();
  uint64_t v82 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  v79 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  unsigned int v69 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v68 = (char *)&v54 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8B0);
  MEMORY[0x270FA5388](v11 - 8);
  v57 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_252897610();
  uint64_t v16 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_252897700();
  MEMORY[0x270FA5388](v19 - 8);
  v72 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_252897C90();
  MEMORY[0x270FA5388](v21 - 8);
  v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_252897630();
  uint64_t v65 = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  id v27 = (char *)&v54 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8B8);
  uint64_t v71 = v23;
  sub_252897C40();
  sub_2528976F0();
  unsigned int v75 = *MEMORY[0x263F06D18];
  uint64_t v28 = *(void (**)(void))(v16 + 104);
  uint64_t v67 = v16 + 104;
  uint64_t v73 = (void (*)(char *, void, uint64_t))v28;
  uint64_t v62 = v18;
  v28(v18);
  unint64_t v77 = 0x8000000252898CF0;
  sub_252897640();
  uint64_t v66 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
  uint64_t v76 = v25 + 56;
  uint64_t v29 = v15;
  v66(v15, 1, 1, v24);
  LOBYTE(v84) = 1;
  uint64_t v30 = sub_252897E50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v57, 1, 1, v30);
  uint64_t v31 = sub_252897340();
  uint64_t v32 = *(void *)(v31 - 8);
  v63 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56);
  uint64_t v64 = v32 + 56;
  uint64_t v33 = v68;
  v63(v68, 1, 1, v31);
  unsigned int v74 = *MEMORY[0x263EFBDC8];
  v81 = *(void (**)(char *))(v82 + 104);
  v82 += 104;
  uint64_t v34 = v80;
  v81(v79);
  v54 = v27;
  uint64_t v35 = v29;
  uint64_t v36 = v33;
  v57 = (char *)sub_2528973B0();
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8C0);
  sub_2528974E0();
  sub_252897C40();
  sub_2528976F0();
  v73(v62, v75, v78);
  sub_252897640();
  uint64_t v38 = v65;
  uint64_t v37 = v66;
  v66(v35, 1, 1, v65);
  LOBYTE(v84) = 0;
  uint64_t v55 = v31;
  uint64_t v39 = v63;
  v63(v36, 1, 1, v31);
  v39(v69, 1, 1, v31);
  ((void (*)(char *, void, uint64_t))v81)(v79, v74, v34);
  sub_25285DEA8();
  uint64_t v40 = sub_252897390();
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8D0);
  sub_2528974E0();
  sub_252897C40();
  sub_2528976F0();
  v41 = v62;
  v73(v62, v75, v78);
  sub_252897640();
  v37(v35, 1, 1, v38);
  uint64_t v42 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v70, 1, 1, v42);
  uint64_t v43 = v55;
  v44 = v63;
  v63(v68, 1, 1, v55);
  v44(v69, 1, 1, v43);
  v45 = v79;
  ((void (*)(char *, void, uint64_t))v81)(v79, v74, v80);
  sub_25285DEFC();
  uint64_t v46 = v45;
  uint64_t v47 = sub_2528973A0();
  unsigned int v69 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8E0);
  sub_2528974E0();
  sub_252897C40();
  sub_2528976F0();
  v73(v41, v75, v78);
  sub_252897640();
  v66(v35, 1, 1, v65);
  uint64_t v84 = 0;
  sub_252897410();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D950);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v83 = sub_252897560();
  ((void (*)(char *, void, uint64_t))v81)(v46, v74, v80);
  sub_25285F950();
  sub_252860C78(&qword_269C2D8E8, &qword_269C2D8F0);
  uint64_t v48 = sub_2528973C0();
  LOBYTE(v84) = 1;
  swift_retain_n();
  uint64_t v49 = v57;
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_252897370();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  LOBYTE(v84) = 0;
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_252897370();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  uint64_t v50 = v60;
  uint64_t v51 = v70;
  sub_25285F9A4(v60, v70);
  sub_25285F9A4(v51, v59);
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_252897370();
  sub_25285FA0C(v51);
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  uint64_t v84 = 0;
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_252897370();
  sub_25285FA0C(v50);
  swift_release_n();
  swift_release_n();
  swift_release_n();
  uint64_t result = swift_release_n();
  v53 = v61;
  char *v61 = v49;
  v53[1] = (char *)v40;
  v53[2] = (char *)v47;
  v53[3] = (char *)v48;
  return result;
}

uint64_t HomeXLModuleConfigurationIntent.useRecommendations.setter()
{
  return sub_252897370();
}

uint64_t HomeXLModuleConfigurationIntent.show.setter()
{
  return sub_252897370();
}

uint64_t HomeXLModuleConfigurationIntent.home.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  MEMORY[0x270FA5388](v2 - 8);
  sub_25285F9A4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_252897370();
  return sub_25285FA0C(a1);
}

uint64_t HomeXLModuleConfigurationIntent.items.setter()
{
  return sub_252897370();
}

uint64_t HomeXLModuleConfigurationIntent.useRecommendations.getter()
{
  sub_252897360();
  return v1;
}

uint64_t sub_25285ED38@<X0>(unsigned char *a1@<X8>)
{
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_252897360();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  uint64_t result = sub_2528975E0();
  *a1 = v3;
  return result;
}

uint64_t sub_25285EDC8()
{
  return sub_2528975E0();
}

uint64_t (*HomeXLModuleConfigurationIntent.useRecommendations.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_252897350();
  return sub_25285EEA8;
}

uint64_t HomeXLModuleConfigurationIntent.$useRecommendations.getter()
{
  return sub_252897380();
}

uint64_t HomeXLModuleConfigurationIntent.show.getter()
{
  sub_252897360();
  return v1;
}

uint64_t sub_25285EF04@<X0>(unsigned char *a1@<X8>)
{
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_252897360();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  uint64_t result = sub_2528975E0();
  *a1 = v3;
  return result;
}

uint64_t sub_25285EF94()
{
  return sub_2528975E0();
}

uint64_t (*HomeXLModuleConfigurationIntent.show.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_252897350();
  return sub_25285EEA8;
}

uint64_t HomeXLModuleConfigurationIntent.$show.getter()
{
  return sub_252897380();
}

uint64_t HomeXLModuleConfigurationIntent.home.getter()
{
  return sub_252897360();
}

uint64_t (*HomeXLModuleConfigurationIntent.home.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_252897350();
  return sub_25285EEA8;
}

uint64_t HomeXLModuleConfigurationIntent.$home.getter()
{
  return sub_252897380();
}

uint64_t HomeXLModuleConfigurationIntent.items.getter()
{
  sub_252897360();
  return v1;
}

uint64_t sub_25285F170@<X0>(void *a1@<X8>)
{
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_252897360();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  uint64_t result = sub_2528975E0();
  *a1 = v3;
  return result;
}

uint64_t sub_25285F200()
{
  return sub_2528975E0();
}

uint64_t (*HomeXLModuleConfigurationIntent.items.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_252897350();
  return sub_25285EEA8;
}

void sub_25285F2E4(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t HomeXLModuleConfigurationIntent.$items.getter()
{
  return sub_252897380();
}

uint64_t static HomeXLModuleConfigurationIntent.parameterSummary.getter()
{
  uint64_t v0 = sub_2528975C0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBEA8], v0);
  char v13 = 0;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8F8);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D900);
  unint64_t v7 = sub_25285FE10();
  uint64_t v8 = sub_252860C78(&qword_269C2D908, &qword_269C2D8F8);
  uint64_t v9 = sub_252860C78(&qword_269C2D910, &qword_269C2D900);
  uint64_t v10 = sub_252860C78(&qword_269C2D918, &qword_269C2D8B8);
  return MEMORY[0x2533BE510](KeyPath, v3, &v13, sub_25285F5E0, 0, sub_25285FDF8, 0, v5, v6, MEMORY[0x263F8D4F8], v7, v8, v9, MEMORY[0x263F8D510], v10);
}

uint64_t sub_25285F55C@<X0>(uint64_t *a1@<X8>)
{
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  uint64_t v2 = sub_252897380();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  uint64_t result = sub_2528975E0();
  *a1 = v2;
  return result;
}

uint64_t sub_25285F5E0@<X0>(uint64_t a1@<X8>)
{
  v15[1] = a1;
  uint64_t v1 = sub_2528975B0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8F8);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v15 - v10;
  swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263EFBE70], v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D900);
  sub_25285FE10();
  sub_252860C78(&qword_269C2D910, &qword_269C2D900);
  sub_252860C78(&qword_269C2D948, &qword_269C2D8D0);
  sub_2528975E0();
  uint64_t v12 = sub_252860C78(&qword_269C2D908, &qword_269C2D8F8);
  MEMORY[0x2533BE440](v9, &type metadata for HomeXLModuleConfigurationIntent, v5, v12);
  char v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v9, v5);
  MEMORY[0x2533BE430](v11, &type metadata for HomeXLModuleConfigurationIntent, v5, v12);
  return ((uint64_t (*)(char *, uint64_t))v13)(v11, v5);
}

uint64_t sub_25285F8C4@<X0>(uint64_t *a1@<X8>)
{
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  uint64_t v2 = sub_252897380();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  uint64_t result = sub_2528975E0();
  *a1 = v2;
  return result;
}

unint64_t sub_25285F950()
{
  unint64_t result = qword_269C2D990;
  if (!qword_269C2D990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2D990);
  }
  return result;
}

uint64_t sub_25285F9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25285FA0C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25285FA6C()
{
  return sub_25285FB2C();
}

uint64_t sub_25285FA84()
{
  return sub_25285FE70();
}

uint64_t sub_25285FA90@<X0>(uint64_t *a1@<X8>)
{
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  uint64_t v2 = sub_252897380();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  uint64_t result = sub_2528975E0();
  *a1 = v2;
  return result;
}

uint64_t sub_25285FB14()
{
  return sub_25285FB2C();
}

uint64_t sub_25285FB2C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D900);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - v5;
  sub_25285FE10();
  sub_2528974F0();
  uint64_t v7 = sub_252860C78(&qword_269C2D910, &qword_269C2D900);
  MEMORY[0x2533BE440](v4, &type metadata for HomeXLModuleConfigurationIntent, v0, v7);
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  MEMORY[0x2533BE430](v6, &type metadata for HomeXLModuleConfigurationIntent, v0, v7);
  return ((uint64_t (*)(char *, uint64_t))v8)(v6, v0);
}

uint64_t sub_25285FCB4()
{
  swift_getKeyPath();
  sub_25285FE10();
  uint64_t v0 = sub_2528974E0();
  sub_2528975E0();
  swift_getKeyPath();
  sub_2528974E0();
  uint64_t v1 = sub_2528974E0();
  sub_2528975E0();
  swift_getKeyPath();
  sub_2528974E0();
  uint64_t v2 = sub_2528974E0();
  sub_2528975E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAC0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_252898CF0;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  sub_252897DF0();
  sub_2528974E0();
  uint64_t v4 = sub_2528974D0();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25285FDF8()
{
  return sub_25285FB2C();
}

unint64_t sub_25285FE10()
{
  unint64_t result = qword_26B22D7F0;
  if (!qword_26B22D7F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D7F0);
  }
  return result;
}

uint64_t sub_25285FE64()
{
  return sub_25285FE70();
}

uint64_t sub_25285FE70()
{
  swift_getKeyPath();
  sub_25285FE10();
  uint64_t v0 = sub_2528974E0();
  sub_2528975E0();
  swift_getKeyPath();
  sub_2528974E0();
  uint64_t v1 = sub_2528974E0();
  sub_2528975E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAC0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_252898D00;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  sub_252897DF0();
  sub_2528974E0();
  uint64_t v3 = sub_2528974D0();
  sub_2528975E0();
  sub_2528975E0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_25285FF70@<X0>(uint64_t *a1@<X8>)
{
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  uint64_t v2 = sub_252897380();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  uint64_t result = sub_2528975E0();
  *a1 = v2;
  return result;
}

uint64_t sub_25285FFF8()
{
  swift_beginAccess();
  uint64_t v0 = *(void *)aComAppleHome;
  sub_2528974D0();
  return v0;
}

uint64_t sub_252860050@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D3E0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897630();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2D870);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_252860104(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_2528975C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263EFBEA8], v3);
  char v15 = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8F8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D900);
  uint64_t v10 = sub_252860C78(&qword_269C2D908, &qword_269C2D8F8);
  uint64_t v11 = sub_252860C78(&qword_269C2D910, &qword_269C2D900);
  uint64_t v12 = sub_252860C78(&qword_269C2D918, &qword_269C2D8B8);
  return MEMORY[0x2533BE510](KeyPath, v6, &v15, sub_25285F5E0, 0, sub_25285FDF8, 0, v8, v9, MEMORY[0x263F8D4F8], a2, v10, v11, MEMORY[0x263F8D510], v12);
}

uint64_t sub_25286030C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_252860C20();
  *uint64_t v4 = v2;
  v4[1] = sub_2528603B8;
  return MEMORY[0x270EE1CC8](a2, v5);
}

uint64_t sub_2528603B8()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_2528604C4(uint64_t a1)
{
  unint64_t v2 = sub_25285FE10();
  return MEMORY[0x270EE0D28](a1, v2);
}

void static HomeXLModuleConfigurationIntent.defaultIntent.getter(char **a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v27 = (uint64_t)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v27 - v5;
  HomeXLModuleConfigurationIntent.init()(v29);
  uint64_t v8 = v29[0];
  uint64_t v7 = v29[1];
  uint64_t v9 = v29[2];
  uint64_t v10 = v29[3];
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_sharedDispatcher);
  id v13 = objc_msgSend(v12, sel_homeManager);

  if (v13)
  {
    uint64_t v28 = v8;
    id v14 = objc_msgSend(v13, sel_homes);
    sub_2528607F8();
    unint64_t v15 = sub_252897DD0();

    if (v15 >> 62)
    {
      sub_2528974D0();
      uint64_t v16 = sub_252898350();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v16 < 2)
    {

      uint64_t v8 = v28;
    }
    else
    {
      id v17 = objc_msgSend(v11, sel_sharedDispatcher);
      id v18 = objc_msgSend(v17, sel_home);

      uint64_t v8 = v28;
      if (v18)
      {
        sub_2528974E0();
        sub_2528974E0();
        sub_2528974E0();
        sub_2528974E0();
        id v19 = v18;
        id v20 = objc_msgSend(v19, sel_uniqueIdentifier);
        sub_2528976A0();

        id v21 = objc_msgSend(v19, sel_name);
        uint64_t v22 = sub_252897CB0();
        uint64_t v24 = v23;

        uint64_t v25 = type metadata accessor for SelectedHomeEntity();
        uint64_t v26 = (uint64_t *)&v6[*(int *)(v25 + 20)];
        *uint64_t v26 = v22;
        v26[1] = v24;
        uint64_t v8 = v28;
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v6, 0, 1, v25);
        sub_25285F9A4((uint64_t)v6, v27);
        sub_252897370();
        sub_25285FA0C((uint64_t)v6);
        sub_2528975E0();
        sub_2528975E0();
        sub_2528975E0();
        sub_2528975E0();
      }
    }
  }
  *a1 = v8;
  a1[1] = v7;
  a1[2] = v9;
  a1[3] = v10;
}

unint64_t sub_2528607F8()
{
  unint64_t result = qword_269C2DAE0;
  if (!qword_269C2DAE0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C2DAE0);
  }
  return result;
}

unint64_t sub_252860840()
{
  unint64_t result = qword_26B22D7F8;
  if (!qword_26B22D7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D7F8);
  }
  return result;
}

unint64_t sub_252860898()
{
  unint64_t result = qword_26B22D7E8;
  if (!qword_26B22D7E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D7E8);
  }
  return result;
}

unint64_t sub_2528608F0()
{
  unint64_t result = qword_269C2D920;
  if (!qword_269C2D920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2D920);
  }
  return result;
}

uint64_t sub_252860944()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for HomeXLModuleConfigurationIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  sub_2528974E0();
  return v3;
}

uint64_t destroy for HomeXLModuleConfigurationIntent()
{
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  return sub_2528975E0();
}

void *initializeWithCopy for HomeXLModuleConfigurationIntent(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  return a1;
}

void *assignWithCopy for HomeXLModuleConfigurationIntent(void *a1, void *a2)
{
  *a1 = *a2;
  sub_2528974E0();
  sub_2528975E0();
  a1[1] = a2[1];
  sub_2528974E0();
  sub_2528975E0();
  a1[2] = a2[2];
  sub_2528974E0();
  sub_2528975E0();
  a1[3] = a2[3];
  sub_2528974E0();
  sub_2528975E0();
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

_OWORD *assignWithTake for HomeXLModuleConfigurationIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  sub_2528975E0();
  sub_2528975E0();
  a1[1] = a2[1];
  sub_2528975E0();
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeXLModuleConfigurationIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HomeXLModuleConfigurationIntent(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeXLModuleConfigurationIntent()
{
  return &type metadata for HomeXLModuleConfigurationIntent;
}

uint64_t sub_252860BE4()
{
  return sub_252860C78(&qword_269C2D930, &qword_269C2D938);
}

unint64_t sub_252860C20()
{
  unint64_t result = qword_269C2D940;
  if (!qword_269C2D940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2D940);
  }
  return result;
}

uint64_t sub_252860C78(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_252860D24()
{
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_252897360();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  return sub_2528975E0();
}

uint64_t sub_252860DB0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_252871318(a1, (uint64_t)&v9 - v6, &qword_269C2D8A0);
  sub_252871318((uint64_t)v7, (uint64_t)v5, &qword_269C2D8A0);
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_2528974E0();
  sub_252897370();
  sub_25285C7C8((uint64_t)v7, &qword_269C2D8A0);
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  return sub_2528975E0();
}

uint64_t HomeXLTileEntityQuery.init()@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D950);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t result = sub_252897560();
  *a1 = result;
  return result;
}

uint64_t HomeXLTileEntityQuery.moduleConfiguration.getter()
{
  return sub_252897550();
}

uint64_t HomeXLTileEntityQuery.entities(for:)(uint64_t a1)
{
  v1[5] = a1;
  v1[6] = *(void *)(type metadata accessor for HomeXLTileEntity() - 8);
  v1[7] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for ElementID();
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2D960 + dword_269C2D960);
  uint64_t v4 = (void *)swift_task_alloc();
  v1[11] = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_2528610D0;
  return v6(1, a1);
}

uint64_t sub_2528610D0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
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
    return MEMORY[0x270FA2498](sub_252861218, 0, 0);
  }
}

uint64_t sub_252861218()
{
  uint64_t v35 = v0;
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_252897B80();
  __swift_project_value_buffer(v1, (uint64_t)qword_269C2E278);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_252897B60();
  os_log_type_t v3 = sub_252897FD0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[12];
  if (v4)
  {
    os_log_type_t v32 = v3;
    uint64_t v6 = v0[8];
    uint64_t v7 = swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v33 = v31;
    *(_DWORD *)uint64_t v7 = 136315650;
    uint64_t v8 = sub_2528974D0();
    uint64_t v9 = MEMORY[0x2533BED00](v8, v6);
    unint64_t v11 = v10;
    swift_bridgeObjectRelease();
    v0[2] = sub_252868708(v9, v11, &v33);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2048;
    int64_t v12 = *(void *)(v5 + 16);
    swift_bridgeObjectRelease();
    v0[3] = v12;
    sub_2528980D0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 22) = 2080;
    uint64_t v13 = MEMORY[0x263F8EE78];
    if (v12)
    {
      uint64_t v30 = v2;
      uint64_t v14 = v0[12];
      uint64_t v15 = v0[9];
      uint64_t v16 = v0[6];
      uint64_t v34 = MEMORY[0x263F8EE78];
      sub_252868CF8(0, v12, 0);
      uint64_t v17 = v14 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
      uint64_t v18 = *(void *)(v16 + 72);
      uint64_t v13 = v34;
      do
      {
        uint64_t v19 = v0[10];
        uint64_t v20 = v0[7];
        sub_252870250(v17, v20, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
        sub_252870250(v20, v19, (uint64_t (*)(void))type metadata accessor for ElementID);
        sub_2528712B8(v20, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_252868CF8(0, *(void *)(v13 + 16) + 1, 1);
          uint64_t v13 = v34;
        }
        unint64_t v22 = *(void *)(v13 + 16);
        unint64_t v21 = *(void *)(v13 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_252868CF8(v21 > 1, v22 + 1, 1);
          uint64_t v13 = v34;
        }
        uint64_t v23 = v0[10];
        *(void *)(v13 + 16) = v22 + 1;
        sub_25287137C(v23, v13+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v22, (uint64_t (*)(void))type metadata accessor for ElementID);
        v17 += v18;
        --v12;
      }
      while (v12);
      uint64_t v2 = v30;
    }
    uint64_t v24 = MEMORY[0x2533BED00](v13, v0[8]);
    unint64_t v26 = v25;
    swift_bridgeObjectRelease();
    v0[4] = sub_252868708(v24, v26, &v33);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_252856000, v2, v32, "entities for IDs: %s, found %ld elements = %s", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v31, -1, -1);
    MEMORY[0x2533BFA60](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v27 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v28 = v0[12];
  return v27(v28);
}

uint64_t HomeXLTileEntityQuery.entities(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a2;
  v4[5] = a3;
  v4[3] = a1;
  type metadata accessor for SelectedHomeEntity();
  v4[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D970);
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = *v3;
  v4[7] = v5;
  v4[8] = v6;
  return MEMORY[0x270FA2498](sub_252861738, 0, 0);
}

uint64_t sub_252861738()
{
  unint64_t v22 = v0;
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_252897B80();
  __swift_project_value_buffer(v1, (uint64_t)qword_269C2E278);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_252897B60();
  os_log_type_t v3 = sub_252897FD0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  unint64_t v5 = v0[5];
  if (v4)
  {
    uint64_t v6 = v0[4];
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v21 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    sub_2528974D0();
    v0[2] = sub_252868708(v6, v5, &v21);
    sub_2528980D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_252856000, v2, v3, "entities matching string: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v8, -1, -1);
    MEMORY[0x2533BFA60](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  sub_2528974E0();
  uint64_t v9 = sub_252897550();
  uint64_t v10 = v0[7];
  if (v9)
  {
    uint64_t v11 = v0[6];
    swift_getKeyPath();
    sub_25286EF70();
    sub_2528973D0();
    sub_2528975E0();
    sub_2528975E0();
    sub_252870250(v11, v10, (uint64_t (*)(void))type metadata accessor for HomeID);
    sub_2528712B8(v11, (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
    uint64_t v12 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  }
  uint64_t v14 = v0[5];
  sub_2528975E0();
  uint64_t v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269C2D978 + dword_269C2D978);
  uint64_t v15 = (void *)swift_task_alloc();
  v0[9] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_252861A84;
  uint64_t v16 = v0[7];
  uint64_t v17 = v0[3];
  uint64_t v18 = v0[4];
  return v20(v17, v18, v14, v16);
}

uint64_t sub_252861A84()
{
  uint64_t v2 = *(void *)(*v1 + 56);
  uint64_t v3 = *v1;
  *(void *)(v3 + 80) = v0;
  swift_task_dealloc();
  sub_25285C7C8(v2, &qword_269C2D970);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_252861BFC, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    BOOL v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_252861BFC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_252861C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[29] = a3;
  v4[30] = a4;
  v4[27] = a1;
  v4[28] = a2;
  type metadata accessor for ElementID();
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = type metadata accessor for TileElementInfo();
  v4[34] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for HomeXLTileEntity();
  v4[35] = v5;
  v4[36] = *(void *)(v5 - 8);
  v4[37] = swift_task_alloc();
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  v4[41] = swift_task_alloc();
  sub_252897C80();
  v4[42] = swift_task_alloc();
  uint64_t v6 = sub_252897630();
  v4[43] = v6;
  v4[44] = *(void *)(v6 - 8);
  v4[45] = swift_task_alloc();
  v4[46] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DB00);
  v4[47] = v7;
  v4[48] = *(void *)(v7 - 8);
  v4[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D970);
  v4[50] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for HomeID();
  v4[51] = v8;
  v4[52] = *(void *)(v8 - 8);
  v4[53] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252861F74, 0, 0);
}

uint64_t sub_252861F74()
{
  uint64_t v1 = v0[51];
  uint64_t v2 = v0[52];
  uint64_t v3 = v0[50];
  sub_252871318(v0[30], v3, &qword_269C2D970);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_25285C7C8(v0[50], &qword_269C2D970);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = v0[52];
    uint64_t v6 = v0[53];
    sub_25287137C(v0[50], v6, (uint64_t (*)(void))type metadata accessor for HomeID);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA18);
    unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_252898F40;
    sub_252870250(v6, v8 + v7, (uint64_t (*)(void))type metadata accessor for HomeID);
    uint64_t v4 = sub_2528702E0(v8);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_2528712B8(v6, (uint64_t (*)(void))type metadata accessor for HomeID);
  }
  v0[54] = v4;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2D960 + dword_269C2D960);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[55] = (uint64_t)v9;
  *uint64_t v9 = v0;
  v9[1] = sub_252862158;
  return v11(v4, 0);
}

uint64_t sub_252862158(unint64_t a1)
{
  uint64_t v3 = *v2;
  v3[56] = a1;
  v3[57] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_2528635D0;
  }
  else
  {
    sub_252870240(v3[54]);
    uint64_t v4 = sub_252862274;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_252862274()
{
  v143 = v0;
  uint64_t v1 = v0[56];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)MEMORY[0x263F8EE80];
LABEL_59:
    uint64_t v72 = v6[2];
    if (v72 == 1)
    {
      uint64_t v78 = (uint64_t)(v0 + 2);
      uint64_t v79 = (uint64_t)(v0 + 7);
      if (qword_269C2D3F0 != -1) {
        swift_once();
      }
      uint64_t v80 = sub_252897B80();
      __swift_project_value_buffer(v80, (uint64_t)qword_269C2E278);
      v81 = sub_252897B60();
      os_log_type_t v82 = sub_252897FD0();
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v83 = v0 + 2;
        uint64_t v84 = (uint8_t *)swift_slowAlloc();
        v85 = v6;
        v86 = (void *)swift_slowAlloc();
        v142[0] = v86;
        *(_DWORD *)uint64_t v84 = 136315138;
        uint64_t v78 = (uint64_t)v83;
        v139[26] = sub_252868708(0xD000000000000023, 0x800000025289B8D0, (uint64_t *)v142);
        sub_2528980D0();
        _os_log_impl(&dword_252856000, v81, v82, "%s Only 1 group of accessories built. Returning as flat list.", v84, 0xCu);
        swift_arrayDestroy();
        v87 = v86;
        uint64_t v6 = v85;
        uint64_t v0 = v139;
        MEMORY[0x2533BFA60](v87, -1, -1);
        MEMORY[0x2533BFA60](v84, -1, -1);
      }

      sub_25286597C((uint64_t)v6, v79);
      v88 = (ValueMetadata *)sub_2528713E4(v79, v78, (uint64_t *)&unk_269C2DB08);
      v89 = (void *)v0[6];
      if (!v89)
      {
        __break(1u);
        return MEMORY[0x270F9FB18](v88);
      }
      uint64_t v90 = v0[57];
      uint64_t v91 = v0[4];
      unint64_t v92 = v0[5];
      sub_2528702CC(v0[2], v0[3]);
      sub_2528702CC(v91, v92);
      v142[0] = v89;
      sub_2528974D0();
      sub_252869AF8(v142);
      if (v90) {
        return sub_2528975E0();
      }
      uint64_t v94 = v0[43];
      uint64_t v93 = v0[44];
      uint64_t v95 = v0[41];
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v93 + 56))(v95, 1, 1, v94);
      sub_252871448(&qword_26B22D720, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
      sub_252871448((unint64_t *)&unk_26B22D710, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
      sub_252897430();
    }
    else
    {
      unint64_t v3 = (unint64_t)(v0 + 25);
      if (!v72)
      {
        if (qword_269C2D3F0 != -1) {
LABEL_101:
        }
          swift_once();
        uint64_t v73 = sub_252897B80();
        __swift_project_value_buffer(v73, (uint64_t)qword_269C2E278);
        unsigned int v74 = sub_252897B60();
        os_log_type_t v75 = sub_252897FD0();
        if (os_log_type_enabled(v74, v75))
        {
          uint64_t v76 = (uint8_t *)swift_slowAlloc();
          unint64_t v77 = (void *)swift_slowAlloc();
          v142[0] = v77;
          *(_DWORD *)uint64_t v76 = 136315138;
          *(void *)unint64_t v3 = sub_252868708(0xD000000000000023, 0x800000025289B8D0, (uint64_t *)v142);
          uint64_t v0 = v139;
          sub_2528980D0();
          _os_log_impl(&dword_252856000, v74, v75, "%s No accessories found, returning empty collection", v76, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2533BFA60](v77, -1, -1);
          MEMORY[0x2533BFA60](v76, -1, -1);
        }

        sub_252871448((unint64_t *)&unk_26B22D710, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
        sub_252897450();
        goto LABEL_93;
      }
      uint64_t v96 = v0[57];
      v0[22] = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain_n();
      v97 = sub_252869FD8((uint64_t)v6, &qword_269C2DB40);
      swift_bridgeObjectRelease();
      v142[0] = v97;
      sub_252869D38((uint64_t *)v142, (uint64_t (*)(uint64_t))sub_25286D2E8, &qword_269C2DB48);
      if (v96) {
        return sub_2528975E0();
      }
      v99 = v0 + 22;
      swift_bridgeObjectRelease();
      v100 = v142[0];
      uint64_t v101 = v142[0][2];
      if (v101)
      {
        v135 = (void (**)(uint64_t, void, void))(v0[44] + 32);
        uint64_t v138 = v0[48];
        sub_2528974E0();
        v102 = (void **)(v100 + 6);
        unint64_t v103 = MEMORY[0x263F8EE78];
        do
        {
          uint64_t v105 = (uint64_t)*(v102 - 2);
          unint64_t v104 = (unint64_t)*(v102 - 1);
          v106 = *v102;
          uint64_t v141 = v105;
          sub_2528974D0();
          if (v104 > 1)
          {
            sub_2528702B8(v105, v104);
            sub_252897C70();
            sub_252897C60();
            sub_252897C50();
            sub_252897C60();
            sub_252897620();
          }
          else
          {
            sub_252897600();
          }
          uint64_t v107 = v139[46];
          uint64_t v108 = v139[35];
          (*v135)(v107, v139[45], v139[43]);
          v109 = sub_2528705A8(v106);
          uint64_t v110 = sub_252871448((unint64_t *)&unk_26B22D710, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
          MEMORY[0x2533BE320](v107, v109, v108, v110);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v103 = sub_25286849C(0, *(void *)(v103 + 16) + 1, 1, v103, &qword_269C2DB28, &qword_269C2DB00);
          }
          unint64_t v112 = *(void *)(v103 + 16);
          unint64_t v111 = *(void *)(v103 + 24);
          if (v112 >= v111 >> 1) {
            unint64_t v103 = sub_25286849C(v111 > 1, v112 + 1, 1, v103, &qword_269C2DB28, &qword_269C2DB00);
          }
          uint64_t v113 = v139[49];
          uint64_t v114 = v139[47];
          *(void *)(v103 + 16) = v112 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v138 + 32))(v103+ ((*(unsigned __int8 *)(v138 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v138 + 80))+ *(void *)(v138 + 72) * v112, v113, v114);
          sub_2528702CC(v141, v104);
          swift_bridgeObjectRelease();
          v102 += 3;
          --v101;
        }
        while (v101);
        sub_2528975E0();
        v0[22] = v103;
        v99 = v0 + 22;
        uint64_t v0 = v139;
      }
      sub_2528975E0();
      if (qword_269C2D3F0 != -1) {
        swift_once();
      }
      uint64_t v115 = sub_252897B80();
      __swift_project_value_buffer(v115, (uint64_t)qword_269C2E278);
      v116 = sub_252897B60();
      os_log_type_t v117 = sub_252897FD0();
      if (os_log_type_enabled(v116, v117))
      {
        uint64_t v118 = swift_slowAlloc();
        v142[0] = (void *)swift_slowAlloc();
        v119 = v142[0];
        *(_DWORD *)uint64_t v118 = 136315394;
        v139[24] = sub_252868708(0xD000000000000023, 0x800000025289B8D0, (uint64_t *)v142);
        sub_2528980D0();
        *(_WORD *)(v118 + 12) = 2048;
        swift_beginAccess();
        v139[23] = *(void *)(*v99 + 16);
        uint64_t v0 = v139;
        sub_2528980D0();
        _os_log_impl(&dword_252856000, v116, v117, "%s Multiple sections generated: %ld", (uint8_t *)v118, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533BFA60](v119, -1, -1);
        MEMORY[0x2533BFA60](v118, -1, -1);
      }

      (*(void (**)(void, uint64_t, uint64_t, void))(v0[44] + 56))(v0[41], 1, 1, v0[43]);
      swift_beginAccess();
      sub_252871448((unint64_t *)&unk_26B22D710, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
      sub_252897440();
    }
LABEL_93:
    swift_bridgeObjectRelease();
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
    swift_task_dealloc();
    swift_task_dealloc();
    v120 = (uint64_t (*)(void))v0[1];
    return v120();
  }
  unint64_t v3 = 0;
  uint64_t v133 = v0[35];
  uint64_t v134 = v0[36];
  uint64_t v4 = (int *)v0[33];
  uint64_t v5 = v0[29];
  unint64_t v131 = (*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80);
  uint64_t v132 = v1 + v131;
  uint64_t v6 = (void *)MEMORY[0x263F8EE80];
  v127 = v4;
  uint64_t v128 = *(void *)(v1 + 16);
  uint64_t v129 = v0[56];
  uint64_t v130 = v5;
  while (1)
  {
    if (v3 >= *(void *)(v1 + 16))
    {
      __break(1u);
LABEL_97:
      __break(1u);
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
LABEL_100:
      __break(1u);
      goto LABEL_101;
    }
    uint64_t v10 = v0[40];
    uint64_t v11 = v0[34];
    uint64_t v140 = *(void *)(v134 + 72);
    sub_252870250(v132 + v140 * v3, v10, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
    sub_252870250(v10 + *(int *)(v133 + 24), v11, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    if (!v5) {
      break;
    }
    uint64_t v12 = v0[28];
    uint64_t v13 = (uint64_t *)(v0[34] + v4[5]);
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    v0[20] = v15;
    v0[21] = v14;
    v0[18] = v12;
    v0[19] = v5;
    sub_2528710F0();
    if (sub_252898110()) {
      break;
    }
LABEL_5:
    ++v3;
    uint64_t v9 = v0[34];
    sub_2528712B8(v0[40], (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
    sub_2528712B8(v9, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    if (v3 == v2)
    {
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
  }
  uint64_t v16 = v0[34];
  if (*(unsigned char *)(v16 + v4[8]))
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    if (!v6[2]) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v16 + v4[7]);
    unint64_t v20 = v19[1];
    if (v20) {
      uint64_t v17 = *v19;
    }
    else {
      uint64_t v17 = 0;
    }
    if (v20 <= 1) {
      unint64_t v18 = 1;
    }
    else {
      unint64_t v18 = v19[1];
    }
    sub_2528974D0();
    if (!v6[2])
    {
LABEL_31:
      unint64_t v137 = v3;
      sub_252870250(v0[40], v0[37], (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
      unint64_t v37 = v18;
      sub_2528702B8(v17, v18);
      unint64_t v3 = sub_25286821C(0, 1, 1, MEMORY[0x263F8EE78], &qword_269C2DB20, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
      unint64_t v39 = *(void *)(v3 + 16);
      unint64_t v38 = *(void *)(v3 + 24);
      if (v39 >= v38 >> 1) {
        unint64_t v3 = sub_25286821C(v38 > 1, v39 + 1, 1, v3, &qword_269C2DB20, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
      }
      uint64_t v40 = v0[37];
      *(void *)(v3 + 16) = v39 + 1;
      sub_25287137C(v40, v3 + v131 + v39 * v140, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v142[0] = v6;
      uint64_t v42 = v17;
      unint64_t v8 = v37;
      unint64_t v44 = sub_252869550(v17, v37);
      uint64_t v45 = v6[2];
      BOOL v46 = (v43 & 1) == 0;
      uint64_t v47 = v45 + v46;
      if (__OFADD__(v45, v46)) {
        goto LABEL_97;
      }
      char v48 = v43;
      if (v6[3] < v47)
      {
        sub_25286C5B0(v47, isUniquelyReferenced_nonNull_native, &qword_269C2DB18);
        uint64_t v6 = v142[0];
        unint64_t v49 = sub_252869550(v42, v37);
        if ((v48 & 1) != (v50 & 1)) {
          goto LABEL_74;
        }
        unint64_t v44 = v49;
        if ((v48 & 1) == 0) {
          goto LABEL_40;
        }
LABEL_3:
        unint64_t v7 = (uint64_t *)(v6[7] + 24 * v44);
        sub_2528702CC(*v7, v7[1]);
        swift_bridgeObjectRelease();
        *unint64_t v7 = v42;
        v7[1] = v37;
        v7[2] = v3;
        unint64_t v8 = v37;
LABEL_4:
        swift_bridgeObjectRelease();
        sub_2528702CC(v42, v8);
        unint64_t v3 = v137;
        uint64_t v4 = v127;
        uint64_t v2 = v128;
        uint64_t v1 = v129;
        uint64_t v5 = v130;
        goto LABEL_5;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v43) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_25286C920(&qword_269C2DB18);
        uint64_t v6 = v142[0];
        if (v48) {
          goto LABEL_3;
        }
      }
LABEL_40:
      v6[(v44 >> 6) + 8] |= 1 << v44;
      uint64_t v51 = (uint64_t *)(v6[6] + 16 * v44);
      uint64_t *v51 = v42;
      v51[1] = v37;
      v52 = (uint64_t *)(v6[7] + 24 * v44);
      uint64_t *v52 = v42;
      v52[1] = v37;
      v52[2] = v3;
      uint64_t v53 = v6[2];
      BOOL v54 = __OFADD__(v53, 1);
      uint64_t v55 = v53 + 1;
      if (v54) {
        goto LABEL_98;
      }
      v6[2] = v55;
      sub_2528702B8(v42, v37);
      goto LABEL_4;
    }
  }
  sub_2528702B8(v17, v18);
  unint64_t v21 = sub_252869550(v17, v18);
  if ((v22 & 1) == 0)
  {
    sub_2528702CC(v17, v18);
    goto LABEL_31;
  }
  uint64_t v23 = (uint64_t *)(v6[7] + 24 * v21);
  unint64_t v24 = v23[2];
  uint64_t v123 = *v23;
  unint64_t v124 = v23[1];
  sub_2528702B8(*v23, v124);
  sub_2528974D0();
  sub_2528702CC(v17, v18);
  uint64_t v25 = *(void *)(v24 + 16);
  unint64_t v125 = v18;
  if (v25)
  {
    uint64_t v121 = v17;
    unint64_t v136 = v3;
    v122 = v6;
    uint64_t v26 = v24 + v131;
    unint64_t v126 = v24;
    sub_2528974D0();
    while (1)
    {
      uint64_t v28 = v0[39];
      uint64_t v27 = v0[40];
      uint64_t v29 = v0[31];
      uint64_t v30 = v0[32];
      sub_252870250(v26, v28, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
      sub_252870250(v28, v30, (uint64_t (*)(void))type metadata accessor for ElementID);
      sub_252870250(v27, v29, (uint64_t (*)(void))type metadata accessor for ElementID);
      char v31 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
      uint64_t v32 = sub_2528976E0();
      uint64_t v33 = *(void (**)(uint64_t, uint64_t))(*(void *)(v32 - 8) + 8);
      v33(v29, v32);
      v33(v30, v32);
      sub_2528712B8(v28, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
      if (v31) {
        break;
      }
      uint64_t v0 = v139;
      v26 += v140;
      if (!--v25)
      {
        unint64_t v24 = v126;
        swift_bridgeObjectRelease();
        uint64_t v17 = v121;
        uint64_t v6 = v122;
        unint64_t v3 = v136;
        goto LABEL_25;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v3 = v136;
    uint64_t v0 = v139;
    uint64_t v17 = v121;
    uint64_t v6 = v122;
    uint64_t v5 = v130;
  }
  else
  {
LABEL_25:
    sub_252870250(v0[40], v0[38], (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v24 = sub_25286821C(0, *(void *)(v24 + 16) + 1, 1, v24, &qword_269C2DB20, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
    }
    uint64_t v5 = v130;
    unint64_t v35 = *(void *)(v24 + 16);
    unint64_t v34 = *(void *)(v24 + 24);
    if (v35 >= v34 >> 1) {
      unint64_t v24 = sub_25286821C(v34 > 1, v35 + 1, 1, v24, &qword_269C2DB20, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
    }
    uint64_t v36 = v0[38];
    *(void *)(v24 + 16) = v35 + 1;
    unint64_t v126 = v24;
    sub_25287137C(v36, v24 + v131 + v35 * v140, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
  }
  char v56 = swift_isUniquelyReferenced_nonNull_native();
  v142[0] = v6;
  uint64_t v57 = v17;
  unint64_t v58 = v125;
  unint64_t v60 = sub_252869550(v17, v125);
  uint64_t v61 = v6[2];
  BOOL v62 = (v59 & 1) == 0;
  uint64_t v63 = v61 + v62;
  if (__OFADD__(v61, v62)) {
    goto LABEL_99;
  }
  char v64 = v59;
  if (v6[3] >= v63)
  {
    if (v56)
    {
      if ((v59 & 1) == 0) {
        goto LABEL_54;
      }
    }
    else
    {
      sub_25286C920(&qword_269C2DB18);
      uint64_t v6 = v142[0];
      if ((v64 & 1) == 0) {
        goto LABEL_54;
      }
    }
    goto LABEL_50;
  }
  sub_25286C5B0(v63, v56, &qword_269C2DB18);
  uint64_t v6 = v142[0];
  unint64_t v65 = sub_252869550(v57, v125);
  if ((v64 & 1) == (v66 & 1))
  {
    unint64_t v60 = v65;
    if ((v64 & 1) == 0)
    {
LABEL_54:
      v6[(v60 >> 6) + 8] |= 1 << v60;
      v68 = (uint64_t *)(v6[6] + 16 * v60);
      uint64_t *v68 = v57;
      v68[1] = v125;
      unsigned int v69 = (uint64_t *)(v6[7] + 24 * v60);
      *unsigned int v69 = v123;
      v69[1] = v124;
      v69[2] = v126;
      uint64_t v70 = v6[2];
      BOOL v54 = __OFADD__(v70, 1);
      uint64_t v71 = v70 + 1;
      if (v54) {
        goto LABEL_100;
      }
      v6[2] = v71;
      sub_2528702B8(v57, v125);
      goto LABEL_56;
    }
LABEL_50:
    uint64_t v67 = (uint64_t *)(v6[7] + 24 * v60);
    sub_2528702CC(*v67, v67[1]);
    swift_bridgeObjectRelease();
    *uint64_t v67 = v123;
    v67[1] = v124;
    v67[2] = v126;
    unint64_t v58 = v125;
LABEL_56:
    swift_bridgeObjectRelease();
    sub_2528702CC(v57, v58);
    uint64_t v2 = v128;
    uint64_t v1 = v129;
    uint64_t v4 = v127;
    goto LABEL_5;
  }
LABEL_74:
  v88 = &type metadata for CollectionType;
  return MEMORY[0x270F9FB18](v88);
}

uint64_t sub_2528635D0()
{
  sub_252870240(*(void *)(v0 + 432));
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2528636F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[29] = a3;
  v4[30] = a4;
  v4[27] = a1;
  v4[28] = a2;
  type metadata accessor for ElementID();
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = type metadata accessor for TileElementInfo();
  v4[34] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for HomeSingleTileEntity();
  v4[35] = v5;
  v4[36] = *(void *)(v5 - 8);
  v4[37] = swift_task_alloc();
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  v4[41] = swift_task_alloc();
  sub_252897C80();
  v4[42] = swift_task_alloc();
  uint64_t v6 = sub_252897630();
  v4[43] = v6;
  v4[44] = *(void *)(v6 - 8);
  v4[45] = swift_task_alloc();
  v4[46] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E8);
  v4[47] = v7;
  v4[48] = *(void *)(v7 - 8);
  v4[49] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D970);
  v4[50] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for HomeID();
  v4[51] = v8;
  v4[52] = *(void *)(v8 - 8);
  v4[53] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252863A00, 0, 0);
}

uint64_t sub_252863A00()
{
  uint64_t v1 = v0[51];
  uint64_t v2 = v0[52];
  uint64_t v3 = v0[50];
  sub_252871318(v0[30], v3, &qword_269C2D970);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_25285C7C8(v0[50], &qword_269C2D970);
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = v0[52];
    uint64_t v6 = v0[53];
    sub_25287137C(v0[50], v6, (uint64_t (*)(void))type metadata accessor for HomeID);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA18);
    unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_252898F40;
    sub_252870250(v6, v8 + v7, (uint64_t (*)(void))type metadata accessor for HomeID);
    uint64_t v4 = sub_2528702E0(v8);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_2528712B8(v6, (uint64_t (*)(void))type metadata accessor for HomeID);
  }
  v0[54] = v4;
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2D9F0 + dword_269C2D9F0);
  uint64_t v9 = (void *)swift_task_alloc();
  v0[55] = (uint64_t)v9;
  *uint64_t v9 = v0;
  v9[1] = sub_252863BE4;
  return v11(v4, 0);
}

uint64_t sub_252863BE4(unint64_t a1)
{
  uint64_t v3 = *v2;
  v3[56] = a1;
  v3[57] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_25287153C;
  }
  else
  {
    sub_252870240(v3[54]);
    uint64_t v4 = sub_252863D00;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_252863D00()
{
  v143 = v0;
  uint64_t v1 = v0[56];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    uint64_t v6 = (void *)MEMORY[0x263F8EE80];
LABEL_59:
    uint64_t v72 = v6[2];
    if (v72 == 1)
    {
      uint64_t v78 = (uint64_t)(v0 + 2);
      uint64_t v79 = (uint64_t)(v0 + 7);
      if (qword_269C2D3F0 != -1) {
        swift_once();
      }
      uint64_t v80 = sub_252897B80();
      __swift_project_value_buffer(v80, (uint64_t)qword_269C2E278);
      v81 = sub_252897B60();
      os_log_type_t v82 = sub_252897FD0();
      if (os_log_type_enabled(v81, v82))
      {
        uint64_t v83 = v0 + 2;
        uint64_t v84 = (uint8_t *)swift_slowAlloc();
        v85 = v6;
        v86 = (void *)swift_slowAlloc();
        v142[0] = v86;
        *(_DWORD *)uint64_t v84 = 136315138;
        uint64_t v78 = (uint64_t)v83;
        v139[26] = sub_252868708(0xD000000000000023, 0x800000025289B8D0, (uint64_t *)v142);
        sub_2528980D0();
        _os_log_impl(&dword_252856000, v81, v82, "%s Only 1 group of accessories built. Returning as flat list.", v84, 0xCu);
        swift_arrayDestroy();
        v87 = v86;
        uint64_t v6 = v85;
        uint64_t v0 = v139;
        MEMORY[0x2533BFA60](v87, -1, -1);
        MEMORY[0x2533BFA60](v84, -1, -1);
      }

      sub_25286597C((uint64_t)v6, v79);
      v88 = (ValueMetadata *)sub_2528713E4(v79, v78, (uint64_t *)&unk_269C2DA00);
      v89 = (void *)v0[6];
      if (!v89)
      {
        __break(1u);
        return MEMORY[0x270F9FB18](v88);
      }
      uint64_t v90 = v0[57];
      uint64_t v91 = v0[4];
      unint64_t v92 = v0[5];
      sub_2528702CC(v0[2], v0[3]);
      sub_2528702CC(v91, v92);
      v142[0] = v89;
      sub_2528974D0();
      sub_252869C18(v142);
      if (v90) {
        return sub_2528975E0();
      }
      uint64_t v94 = v0[43];
      uint64_t v93 = v0[44];
      uint64_t v95 = v0[41];
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v93 + 56))(v95, 1, 1, v94);
      sub_252871448(&qword_26B22D778, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
      sub_252871448((unint64_t *)&unk_26B22D768, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
      sub_252897430();
    }
    else
    {
      unint64_t v3 = (unint64_t)(v0 + 25);
      if (!v72)
      {
        if (qword_269C2D3F0 != -1) {
LABEL_101:
        }
          swift_once();
        uint64_t v73 = sub_252897B80();
        __swift_project_value_buffer(v73, (uint64_t)qword_269C2E278);
        unsigned int v74 = sub_252897B60();
        os_log_type_t v75 = sub_252897FD0();
        if (os_log_type_enabled(v74, v75))
        {
          uint64_t v76 = (uint8_t *)swift_slowAlloc();
          unint64_t v77 = (void *)swift_slowAlloc();
          v142[0] = v77;
          *(_DWORD *)uint64_t v76 = 136315138;
          *(void *)unint64_t v3 = sub_252868708(0xD000000000000023, 0x800000025289B8D0, (uint64_t *)v142);
          uint64_t v0 = v139;
          sub_2528980D0();
          _os_log_impl(&dword_252856000, v74, v75, "%s No accessories found, returning empty collection", v76, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2533BFA60](v77, -1, -1);
          MEMORY[0x2533BFA60](v76, -1, -1);
        }

        sub_252871448((unint64_t *)&unk_26B22D768, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
        sub_252897450();
        goto LABEL_93;
      }
      uint64_t v96 = v0[57];
      v0[22] = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain_n();
      v97 = sub_252869FD8((uint64_t)v6, &qword_269C2DA68);
      swift_bridgeObjectRelease();
      v142[0] = v97;
      sub_252869D38((uint64_t *)v142, (uint64_t (*)(uint64_t))sub_25286D378, &qword_269C2DA70);
      if (v96) {
        return sub_2528975E0();
      }
      v99 = v0 + 22;
      swift_bridgeObjectRelease();
      v100 = v142[0];
      uint64_t v101 = v142[0][2];
      if (v101)
      {
        v135 = (void (**)(uint64_t, void, void))(v0[44] + 32);
        uint64_t v138 = v0[48];
        sub_2528974E0();
        v102 = (void **)(v100 + 6);
        unint64_t v103 = MEMORY[0x263F8EE78];
        do
        {
          uint64_t v105 = (uint64_t)*(v102 - 2);
          unint64_t v104 = (unint64_t)*(v102 - 1);
          v106 = *v102;
          uint64_t v141 = v105;
          sub_2528974D0();
          if (v104 > 1)
          {
            sub_2528702B8(v105, v104);
            sub_252897C70();
            sub_252897C60();
            sub_252897C50();
            sub_252897C60();
            sub_252897620();
          }
          else
          {
            sub_252897600();
          }
          uint64_t v107 = v139[46];
          uint64_t v108 = v139[35];
          (*v135)(v107, v139[45], v139[43]);
          v109 = sub_252870B4C(v106);
          uint64_t v110 = sub_252871448((unint64_t *)&unk_26B22D768, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
          MEMORY[0x2533BE320](v107, v109, v108, v110);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v103 = sub_25286849C(0, *(void *)(v103 + 16) + 1, 1, v103, &qword_269C2DA48, &qword_269C2D9E8);
          }
          unint64_t v112 = *(void *)(v103 + 16);
          unint64_t v111 = *(void *)(v103 + 24);
          if (v112 >= v111 >> 1) {
            unint64_t v103 = sub_25286849C(v111 > 1, v112 + 1, 1, v103, &qword_269C2DA48, &qword_269C2D9E8);
          }
          uint64_t v113 = v139[49];
          uint64_t v114 = v139[47];
          *(void *)(v103 + 16) = v112 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v138 + 32))(v103+ ((*(unsigned __int8 *)(v138 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v138 + 80))+ *(void *)(v138 + 72) * v112, v113, v114);
          sub_2528702CC(v141, v104);
          swift_bridgeObjectRelease();
          v102 += 3;
          --v101;
        }
        while (v101);
        sub_2528975E0();
        v0[22] = v103;
        v99 = v0 + 22;
        uint64_t v0 = v139;
      }
      sub_2528975E0();
      if (qword_269C2D3F0 != -1) {
        swift_once();
      }
      uint64_t v115 = sub_252897B80();
      __swift_project_value_buffer(v115, (uint64_t)qword_269C2E278);
      v116 = sub_252897B60();
      os_log_type_t v117 = sub_252897FD0();
      if (os_log_type_enabled(v116, v117))
      {
        uint64_t v118 = swift_slowAlloc();
        v142[0] = (void *)swift_slowAlloc();
        v119 = v142[0];
        *(_DWORD *)uint64_t v118 = 136315394;
        v139[24] = sub_252868708(0xD000000000000023, 0x800000025289B8D0, (uint64_t *)v142);
        sub_2528980D0();
        *(_WORD *)(v118 + 12) = 2048;
        swift_beginAccess();
        v139[23] = *(void *)(*v99 + 16);
        uint64_t v0 = v139;
        sub_2528980D0();
        _os_log_impl(&dword_252856000, v116, v117, "%s Multiple sections generated: %ld", (uint8_t *)v118, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533BFA60](v119, -1, -1);
        MEMORY[0x2533BFA60](v118, -1, -1);
      }

      (*(void (**)(void, uint64_t, uint64_t, void))(v0[44] + 56))(v0[41], 1, 1, v0[43]);
      swift_beginAccess();
      sub_252871448((unint64_t *)&unk_26B22D768, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
      sub_252897440();
    }
LABEL_93:
    swift_bridgeObjectRelease();
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
    swift_task_dealloc();
    swift_task_dealloc();
    v120 = (uint64_t (*)(void))v0[1];
    return v120();
  }
  unint64_t v3 = 0;
  uint64_t v133 = v0[35];
  uint64_t v134 = v0[36];
  uint64_t v4 = (int *)v0[33];
  uint64_t v5 = v0[29];
  unint64_t v131 = (*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80);
  uint64_t v132 = v1 + v131;
  uint64_t v6 = (void *)MEMORY[0x263F8EE80];
  v127 = v4;
  uint64_t v128 = *(void *)(v1 + 16);
  uint64_t v129 = v0[56];
  uint64_t v130 = v5;
  while (1)
  {
    if (v3 >= *(void *)(v1 + 16))
    {
      __break(1u);
LABEL_97:
      __break(1u);
LABEL_98:
      __break(1u);
LABEL_99:
      __break(1u);
LABEL_100:
      __break(1u);
      goto LABEL_101;
    }
    uint64_t v10 = v0[40];
    uint64_t v11 = v0[34];
    uint64_t v140 = *(void *)(v134 + 72);
    sub_252870250(v132 + v140 * v3, v10, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
    sub_252870250(v10 + *(int *)(v133 + 24), v11, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    if (!v5) {
      break;
    }
    uint64_t v12 = v0[28];
    uint64_t v13 = (uint64_t *)(v0[34] + v4[5]);
    uint64_t v15 = *v13;
    uint64_t v14 = v13[1];
    v0[20] = v15;
    v0[21] = v14;
    v0[18] = v12;
    v0[19] = v5;
    sub_2528710F0();
    if (sub_252898110()) {
      break;
    }
LABEL_5:
    ++v3;
    uint64_t v9 = v0[34];
    sub_2528712B8(v0[40], (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
    sub_2528712B8(v9, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    if (v3 == v2)
    {
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
  }
  uint64_t v16 = v0[34];
  if (*(unsigned char *)(v16 + v4[8]))
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    if (!v6[2]) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v16 + v4[7]);
    unint64_t v20 = v19[1];
    if (v20) {
      uint64_t v17 = *v19;
    }
    else {
      uint64_t v17 = 0;
    }
    if (v20 <= 1) {
      unint64_t v18 = 1;
    }
    else {
      unint64_t v18 = v19[1];
    }
    sub_2528974D0();
    if (!v6[2])
    {
LABEL_31:
      unint64_t v137 = v3;
      sub_252870250(v0[40], v0[37], (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
      unint64_t v37 = v18;
      sub_2528702B8(v17, v18);
      unint64_t v3 = sub_25286821C(0, 1, 1, MEMORY[0x263F8EE78], &qword_269C2DA40, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
      unint64_t v39 = *(void *)(v3 + 16);
      unint64_t v38 = *(void *)(v3 + 24);
      if (v39 >= v38 >> 1) {
        unint64_t v3 = sub_25286821C(v38 > 1, v39 + 1, 1, v3, &qword_269C2DA40, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
      }
      uint64_t v40 = v0[37];
      *(void *)(v3 + 16) = v39 + 1;
      sub_25287137C(v40, v3 + v131 + v39 * v140, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v142[0] = v6;
      uint64_t v42 = v17;
      unint64_t v8 = v37;
      unint64_t v44 = sub_252869550(v17, v37);
      uint64_t v45 = v6[2];
      BOOL v46 = (v43 & 1) == 0;
      uint64_t v47 = v45 + v46;
      if (__OFADD__(v45, v46)) {
        goto LABEL_97;
      }
      char v48 = v43;
      if (v6[3] < v47)
      {
        sub_25286C5B0(v47, isUniquelyReferenced_nonNull_native, &qword_269C2DA30);
        uint64_t v6 = v142[0];
        unint64_t v49 = sub_252869550(v42, v37);
        if ((v48 & 1) != (v50 & 1)) {
          goto LABEL_74;
        }
        unint64_t v44 = v49;
        if ((v48 & 1) == 0) {
          goto LABEL_40;
        }
LABEL_3:
        unint64_t v7 = (uint64_t *)(v6[7] + 24 * v44);
        sub_2528702CC(*v7, v7[1]);
        swift_bridgeObjectRelease();
        *unint64_t v7 = v42;
        v7[1] = v37;
        v7[2] = v3;
        unint64_t v8 = v37;
LABEL_4:
        swift_bridgeObjectRelease();
        sub_2528702CC(v42, v8);
        unint64_t v3 = v137;
        uint64_t v4 = v127;
        uint64_t v2 = v128;
        uint64_t v1 = v129;
        uint64_t v5 = v130;
        goto LABEL_5;
      }
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v43) {
          goto LABEL_3;
        }
      }
      else
      {
        sub_25286C920(&qword_269C2DA30);
        uint64_t v6 = v142[0];
        if (v48) {
          goto LABEL_3;
        }
      }
LABEL_40:
      v6[(v44 >> 6) + 8] |= 1 << v44;
      uint64_t v51 = (uint64_t *)(v6[6] + 16 * v44);
      uint64_t *v51 = v42;
      v51[1] = v37;
      v52 = (uint64_t *)(v6[7] + 24 * v44);
      uint64_t *v52 = v42;
      v52[1] = v37;
      v52[2] = v3;
      uint64_t v53 = v6[2];
      BOOL v54 = __OFADD__(v53, 1);
      uint64_t v55 = v53 + 1;
      if (v54) {
        goto LABEL_98;
      }
      v6[2] = v55;
      sub_2528702B8(v42, v37);
      goto LABEL_4;
    }
  }
  sub_2528702B8(v17, v18);
  unint64_t v21 = sub_252869550(v17, v18);
  if ((v22 & 1) == 0)
  {
    sub_2528702CC(v17, v18);
    goto LABEL_31;
  }
  uint64_t v23 = (uint64_t *)(v6[7] + 24 * v21);
  unint64_t v24 = v23[2];
  uint64_t v123 = *v23;
  unint64_t v124 = v23[1];
  sub_2528702B8(*v23, v124);
  sub_2528974D0();
  sub_2528702CC(v17, v18);
  uint64_t v25 = *(void *)(v24 + 16);
  unint64_t v125 = v18;
  if (v25)
  {
    uint64_t v121 = v17;
    unint64_t v136 = v3;
    v122 = v6;
    uint64_t v26 = v24 + v131;
    unint64_t v126 = v24;
    sub_2528974D0();
    while (1)
    {
      uint64_t v28 = v0[39];
      uint64_t v27 = v0[40];
      uint64_t v29 = v0[31];
      uint64_t v30 = v0[32];
      sub_252870250(v26, v28, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
      sub_252870250(v28, v30, (uint64_t (*)(void))type metadata accessor for ElementID);
      sub_252870250(v27, v29, (uint64_t (*)(void))type metadata accessor for ElementID);
      char v31 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
      uint64_t v32 = sub_2528976E0();
      uint64_t v33 = *(void (**)(uint64_t, uint64_t))(*(void *)(v32 - 8) + 8);
      v33(v29, v32);
      v33(v30, v32);
      sub_2528712B8(v28, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
      if (v31) {
        break;
      }
      uint64_t v0 = v139;
      v26 += v140;
      if (!--v25)
      {
        unint64_t v24 = v126;
        swift_bridgeObjectRelease();
        uint64_t v17 = v121;
        uint64_t v6 = v122;
        unint64_t v3 = v136;
        goto LABEL_25;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v3 = v136;
    uint64_t v0 = v139;
    uint64_t v17 = v121;
    uint64_t v6 = v122;
    uint64_t v5 = v130;
  }
  else
  {
LABEL_25:
    sub_252870250(v0[40], v0[38], (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v24 = sub_25286821C(0, *(void *)(v24 + 16) + 1, 1, v24, &qword_269C2DA40, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
    }
    uint64_t v5 = v130;
    unint64_t v35 = *(void *)(v24 + 16);
    unint64_t v34 = *(void *)(v24 + 24);
    if (v35 >= v34 >> 1) {
      unint64_t v24 = sub_25286821C(v34 > 1, v35 + 1, 1, v24, &qword_269C2DA40, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
    }
    uint64_t v36 = v0[38];
    *(void *)(v24 + 16) = v35 + 1;
    unint64_t v126 = v24;
    sub_25287137C(v36, v24 + v131 + v35 * v140, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
  }
  char v56 = swift_isUniquelyReferenced_nonNull_native();
  v142[0] = v6;
  uint64_t v57 = v17;
  unint64_t v58 = v125;
  unint64_t v60 = sub_252869550(v17, v125);
  uint64_t v61 = v6[2];
  BOOL v62 = (v59 & 1) == 0;
  uint64_t v63 = v61 + v62;
  if (__OFADD__(v61, v62)) {
    goto LABEL_99;
  }
  char v64 = v59;
  if (v6[3] >= v63)
  {
    if (v56)
    {
      if ((v59 & 1) == 0) {
        goto LABEL_54;
      }
    }
    else
    {
      sub_25286C920(&qword_269C2DA30);
      uint64_t v6 = v142[0];
      if ((v64 & 1) == 0) {
        goto LABEL_54;
      }
    }
    goto LABEL_50;
  }
  sub_25286C5B0(v63, v56, &qword_269C2DA30);
  uint64_t v6 = v142[0];
  unint64_t v65 = sub_252869550(v57, v125);
  if ((v64 & 1) == (v66 & 1))
  {
    unint64_t v60 = v65;
    if ((v64 & 1) == 0)
    {
LABEL_54:
      v6[(v60 >> 6) + 8] |= 1 << v60;
      v68 = (uint64_t *)(v6[6] + 16 * v60);
      uint64_t *v68 = v57;
      v68[1] = v125;
      unsigned int v69 = (uint64_t *)(v6[7] + 24 * v60);
      *unsigned int v69 = v123;
      v69[1] = v124;
      v69[2] = v126;
      uint64_t v70 = v6[2];
      BOOL v54 = __OFADD__(v70, 1);
      uint64_t v71 = v70 + 1;
      if (v54) {
        goto LABEL_100;
      }
      v6[2] = v71;
      sub_2528702B8(v57, v125);
      goto LABEL_56;
    }
LABEL_50:
    uint64_t v67 = (uint64_t *)(v6[7] + 24 * v60);
    sub_2528702CC(*v67, v67[1]);
    swift_bridgeObjectRelease();
    *uint64_t v67 = v123;
    v67[1] = v124;
    v67[2] = v126;
    unint64_t v58 = v125;
LABEL_56:
    swift_bridgeObjectRelease();
    sub_2528702CC(v57, v58);
    uint64_t v2 = v128;
    uint64_t v1 = v129;
    uint64_t v4 = v127;
    goto LABEL_5;
  }
LABEL_74:
  v88 = &type metadata for CollectionType;
  return MEMORY[0x270F9FB18](v88);
}

uint64_t HomeXLTileEntityQuery.suggestedEntities()(uint64_t a1)
{
  v2[2] = a1;
  type metadata accessor for SelectedHomeEntity();
  v2[3] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D970);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = *v1;
  v2[4] = v3;
  v2[5] = v4;
  return MEMORY[0x270FA2498](sub_252865120, 0, 0);
}

uint64_t sub_252865120()
{
  sub_2528974E0();
  uint64_t v1 = sub_252897550();
  uint64_t v2 = v0[4];
  if (v1)
  {
    uint64_t v3 = v0[3];
    swift_getKeyPath();
    sub_25286EF70();
    sub_2528973D0();
    sub_2528975E0();
    sub_2528975E0();
    sub_252870250(v3, v2, (uint64_t (*)(void))type metadata accessor for HomeID);
    sub_2528712B8(v3, (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
    uint64_t v4 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    uint64_t v5 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  sub_2528975E0();
  uint64_t v10 = (char *)&dword_269C2D978 + dword_269C2D978;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[6] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2528652E8;
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[2];
  return ((uint64_t (*)(uint64_t, void, void, uint64_t))v10)(v8, 0, 0, v7);
}

uint64_t sub_2528652E8()
{
  uint64_t v2 = *(void *)(*v1 + 32);
  uint64_t v3 = *v1;
  *(void *)(v3 + 56) = v0;
  swift_task_dealloc();
  sub_25285C7C8(v2, &qword_269C2D970);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_252865460, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_252865460()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2528654CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25285BC9C;
  return HomeXLTileEntityQuery.entities(matching:)(a1, a2, a3);
}

uint64_t sub_25286557C@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D950);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t result = sub_252897560();
  *a1 = result;
  return result;
}

uint64_t sub_2528655E0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_252865674;
  return HomeXLTileEntityQuery.entities(for:)(a1);
}

uint64_t sub_252865674(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_252865774(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25285CC38;
  return HomeXLTileEntityQuery.suggestedEntities()(a1);
}

uint64_t sub_25286580C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_25285F950();
  *uint64_t v5 = v2;
  v5[1] = sub_25285CC38;
  return MEMORY[0x270EE0E40](a1, a2, v6);
}

uint64_t sub_2528658C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25285BC9C;
  return MEMORY[0x270EE1A10](a1, a2, a3);
}

uint64_t sub_25286597C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_25286D5D0(a1);
  if (v6) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32))
  {
    uint64_t result = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    long long v9 = 0uLL;
  }
  else
  {
    uint64_t result = (uint64_t)sub_25286D658((uint64_t *)&v10, result, v5, 0, a1);
    long long v9 = v10;
    uint64_t v8 = v11;
  }
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v7;
  *(_OWORD *)(a2 + 16) = v9;
  *(void *)(a2 + 32) = v8;
  return result;
}

uint64_t sub_252865A20(uint64_t a1, uint64_t a2)
{
  v2[8] = a1;
  v2[9] = a2;
  uint64_t v3 = sub_2528976E0();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[13] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_252865B24;
  return sub_252859C00();
}

uint64_t sub_252865B24(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(*v2 + 112) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_252865C74, 0, 0);
  }
}

uint64_t sub_252865C74()
{
  uint64_t v73 = v0;
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = sub_252897B80();
  __swift_project_value_buffer(v2, (uint64_t)qword_269C2E278);
  sub_2528974D0();
  sub_2528712A8(v1);
  sub_2528974D0();
  sub_2528712A8(v1);
  uint64_t v3 = sub_252897B60();
  os_log_type_t v4 = sub_252897F90();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = *(void *)(v0 + 72);
  if (v5)
  {
    os_log_type_t v66 = v4;
    uint64_t v7 = swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    uint64_t v70 = v64;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v8 = type metadata accessor for ElementID();
    uint64_t v9 = sub_2528974D0();
    uint64_t v10 = MEMORY[0x2533BED00](v9, v8);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 48) = sub_252868708(v10, v12, &v70);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    if (v6)
    {
      if (v6 == 1)
      {
        unint64_t v13 = 0xE300000000000000;
        uint64_t v14 = 7105633;
      }
      else
      {
        unint64_t v15 = *(void *)(v0 + 72);
        uint64_t v71 = 0x3A796C6E6FLL;
        unint64_t v72 = 0xE500000000000000;
        sub_2528712A8(v15);
        type metadata accessor for HomeID();
        sub_252871448(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
        sub_252897EE0();
        sub_252897CF0();
        swift_bridgeObjectRelease();
        sub_252870240(v15);
        uint64_t v14 = v71;
        unint64_t v13 = v72;
      }
    }
    else
    {
      uint64_t v14 = 0x746E6572727563;
      unint64_t v13 = 0xE700000000000000;
    }
    unint64_t v16 = *(void *)(v0 + 72);
    *(void *)(v0 + 56) = sub_252868708(v14, v13, &v70);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    sub_252870240(v16);
    sub_252870240(v16);
    _os_log_impl(&dword_252856000, v3, v66, "entities for ids: [%s] in scope: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v64, -1, -1);
    MEMORY[0x2533BFA60](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_252870240(v6);
    sub_252870240(v6);
  }
  unint64_t v17 = sub_252893024(*(void *)(v0 + 72));
  unint64_t v18 = v17;
  *(void *)(v0 + 120) = v17;
  unint64_t v19 = v17 >> 62;
  if (v17 >> 62)
  {
    sub_2528974D0();
    int64_t v20 = sub_252898350();
    swift_bridgeObjectRelease();
    if (v20 >= 1) {
      goto LABEL_13;
    }
LABEL_41:
    swift_bridgeObjectRelease();
    char v56 = sub_252897B60();
    os_log_type_t v57 = sub_252897FB0();
    if (os_log_type_enabled(v56, v57))
    {
      unint64_t v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v58 = 0;
      _os_log_impl(&dword_252856000, v56, v57, "HMHomeManager.orderedHomes is empty", v58, 2u);
      MEMORY[0x2533BFA60](v58, -1, -1);
    }

    uint64_t v50 = MEMORY[0x263F8EE78];
    goto LABEL_44;
  }
  int64_t v20 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v20 < 1) {
    goto LABEL_41;
  }
LABEL_13:
  unint64_t v21 = (void *)(v0 + 16);
  unint64_t v22 = *(void *)(v0 + 72);
  sub_2528712A8(v22);
  sub_2528974D0();
  sub_2528712A8(v22);
  sub_2528974D0();
  uint64_t v23 = sub_252897B60();
  os_log_type_t v24 = sub_252897FD0();
  if (os_log_type_enabled(v23, v24))
  {
    os_log_type_t v62 = v24;
    log = v23;
    unint64_t v65 = v19;
    unint64_t v60 = (void *)(v0 + 16);
    uint64_t v25 = *(void *)(v0 + 88);
    uint64_t v26 = (_DWORD *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    uint64_t v70 = v61;
    uint64_t v67 = v26;
    *uint64_t v26 = 136315394;
    uint64_t v71 = MEMORY[0x263F8EE78];
    sub_252868D34(0, v20, 0);
    uint64_t v27 = 0;
    uint64_t v28 = v71;
    unint64_t v68 = v18;
    unint64_t v29 = v18 & 0xC000000000000001;
    do
    {
      if (v29) {
        id v30 = (id)MEMORY[0x2533BF180](v27, v68);
      }
      else {
        id v30 = *(id *)(v68 + 8 * v27 + 32);
      }
      char v31 = v30;
      id v32 = objc_msgSend(v30, sel_uniqueIdentifier, v60);
      sub_2528976A0();

      uint64_t v71 = v28;
      unint64_t v34 = *(void *)(v28 + 16);
      unint64_t v33 = *(void *)(v28 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_252868D34(v33 > 1, v34 + 1, 1);
        uint64_t v28 = v71;
      }
      uint64_t v35 = *(void *)(v0 + 96);
      uint64_t v36 = *(void *)(v0 + 80);
      ++v27;
      *(void *)(v28 + 16) = v34 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 32))(v28+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v34, v35, v36);
    }
    while (v20 != v27);
    uint64_t v38 = *(void *)(v0 + 72);
    uint64_t v39 = MEMORY[0x2533BED00](v28, *(void *)(v0 + 80));
    unint64_t v41 = v40;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 32) = sub_252868708(v39, v41, &v70);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    unint64_t v18 = v68;
    swift_bridgeObjectRelease_n();
    *((_WORD *)v67 + 6) = 2080;
    if (v38 == 1)
    {
      uint64_t v43 = 7105633;
      unint64_t v42 = 0xE300000000000000;
    }
    else if (v38)
    {
      unint64_t v44 = *(void *)(v0 + 72);
      uint64_t v71 = 0x3A796C6E6FLL;
      unint64_t v72 = 0xE500000000000000;
      sub_2528712A8(v44);
      type metadata accessor for HomeID();
      sub_252871448(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
      sub_252897EE0();
      sub_252897CF0();
      swift_bridgeObjectRelease();
      sub_252870240(v44);
      uint64_t v43 = v71;
      unint64_t v42 = v72;
    }
    else
    {
      unint64_t v42 = 0xE700000000000000;
      uint64_t v43 = 0x746E6572727563;
    }
    unint64_t v21 = v60;
    unint64_t v45 = *(void *)(v0 + 72);
    *(void *)(v0 + 40) = sub_252868708(v43, v42, &v70);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    sub_252870240(v45);
    sub_252870240(v45);
    _os_log_impl(&dword_252856000, log, v62, "[HMHomeManager.orderedHomes] homes=%s using scope=%s", (uint8_t *)v67, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v61, -1, -1);
    MEMORY[0x2533BFA60](v67, -1, -1);

    unint64_t v19 = v65;
  }
  else
  {
    unint64_t v37 = *(void *)(v0 + 72);
    swift_bridgeObjectRelease_n();
    sub_252870240(v37);
    sub_252870240(v37);
  }
  *unint64_t v21 = MEMORY[0x263F8EE78];
  if (v19)
  {
    sub_2528974D0();
    uint64_t v46 = sub_252898350();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v46 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v0 + 128) = v46;
  uint64_t v47 = *(void *)(v0 + 120);
  if (v46)
  {
    if ((v47 & 0xC000000000000001) != 0) {
      id v48 = (id)MEMORY[0x2533BF180](0);
    }
    else {
      id v48 = *(id *)(v47 + 32);
    }
    uint64_t v51 = (uint64_t)v48;
    *(void *)(v0 + 136) = v48;
    *(void *)(v0 + 144) = 1;
    unsigned int v69 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2DE58 + dword_269C2DE58);
    id v52 = v48;
    uint64_t v53 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v53;
    *uint64_t v53 = v0;
    v53[1] = sub_2528665C0;
    uint64_t v54 = *(void *)(v0 + 64);
    return v69(v54, v51);
  }
  unint64_t v49 = *(void **)(v0 + 112);
  swift_bridgeObjectRelease();

  uint64_t v50 = *(void *)(v0 + 16);
LABEL_44:
  swift_task_dealloc();
  char v59 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v59(v50);
}

uint64_t sub_2528665C0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 160) = v1;
  swift_task_dealloc();

  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL v5 = sub_252866708;
  }
  else
  {
    *(void *)(v4 + 168) = a1;
    BOOL v5 = sub_25286677C;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_252866708()
{
  uint64_t v1 = *(void **)(v0 + 136);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

id sub_25286677C()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);
  id v4 = *(id *)(v0 + 136);
  uint64_t v5 = sub_25286D714(v1, v4, v0 + 24, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (void (*)(BOOL, unint64_t, uint64_t))sub_252868D70, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);

  swift_bridgeObjectRelease();
  sub_252868010(v5, &qword_269C2DB20, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);

  if (v2 == v3)
  {
    unint64_t v6 = *(void **)(v0 + 112);
    swift_bridgeObjectRelease();

    uint64_t v7 = *(void *)(v0 + 16);
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return (id)v8(v7);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 144);
    uint64_t v11 = *(void *)(v0 + 120);
    if ((v11 & 0xC000000000000001) != 0) {
      id result = (id)MEMORY[0x2533BF180](*(void *)(v0 + 144));
    }
    else {
      id result = *(id *)(v11 + 8 * v10 + 32);
    }
    uint64_t v12 = (uint64_t)result;
    *(void *)(v0 + 136) = result;
    *(void *)(v0 + 144) = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
    }
    else
    {
      unint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2DE58 + dword_269C2DE58);
      id v13 = result;
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_2528665C0;
      uint64_t v15 = *(void *)(v0 + 64);
      return (id)v16(v15, v12);
    }
  }
  return result;
}

uint64_t sub_2528669B0(uint64_t a1, uint64_t a2)
{
  v2[8] = a1;
  v2[9] = a2;
  uint64_t v3 = sub_2528976E0();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  id v4 = (void *)swift_task_alloc();
  v2[13] = v4;
  *id v4 = v2;
  v4[1] = sub_252866AB4;
  return sub_252859C00();
}

uint64_t sub_252866AB4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(*v2 + 112) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    id v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_252866C04, 0, 0);
  }
}

uint64_t sub_252866C04()
{
  uint64_t v73 = v0;
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = sub_252897B80();
  __swift_project_value_buffer(v2, (uint64_t)qword_269C2E278);
  sub_2528974D0();
  sub_2528712A8(v1);
  sub_2528974D0();
  sub_2528712A8(v1);
  uint64_t v3 = sub_252897B60();
  os_log_type_t v4 = sub_252897F90();
  BOOL v5 = os_log_type_enabled(v3, v4);
  unint64_t v6 = *(void *)(v0 + 72);
  if (v5)
  {
    os_log_type_t v66 = v4;
    uint64_t v7 = swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    uint64_t v70 = v64;
    *(_DWORD *)uint64_t v7 = 136315394;
    uint64_t v8 = type metadata accessor for ElementID();
    uint64_t v9 = sub_2528974D0();
    uint64_t v10 = MEMORY[0x2533BED00](v9, v8);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 48) = sub_252868708(v10, v12, &v70);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2080;
    if (v6)
    {
      if (v6 == 1)
      {
        unint64_t v13 = 0xE300000000000000;
        uint64_t v14 = 7105633;
      }
      else
      {
        unint64_t v15 = *(void *)(v0 + 72);
        uint64_t v71 = 0x3A796C6E6FLL;
        unint64_t v72 = 0xE500000000000000;
        sub_2528712A8(v15);
        type metadata accessor for HomeID();
        sub_252871448(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
        sub_252897EE0();
        sub_252897CF0();
        swift_bridgeObjectRelease();
        sub_252870240(v15);
        uint64_t v14 = v71;
        unint64_t v13 = v72;
      }
    }
    else
    {
      uint64_t v14 = 0x746E6572727563;
      unint64_t v13 = 0xE700000000000000;
    }
    unint64_t v16 = *(void *)(v0 + 72);
    *(void *)(v0 + 56) = sub_252868708(v14, v13, &v70);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    sub_252870240(v16);
    sub_252870240(v16);
    _os_log_impl(&dword_252856000, v3, v66, "entities for ids: [%s] in scope: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v64, -1, -1);
    MEMORY[0x2533BFA60](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_252870240(v6);
    sub_252870240(v6);
  }
  unint64_t v17 = sub_252893024(*(void *)(v0 + 72));
  unint64_t v18 = v17;
  *(void *)(v0 + 120) = v17;
  unint64_t v19 = v17 >> 62;
  if (v17 >> 62)
  {
    sub_2528974D0();
    int64_t v20 = sub_252898350();
    swift_bridgeObjectRelease();
    if (v20 >= 1) {
      goto LABEL_13;
    }
LABEL_41:
    swift_bridgeObjectRelease();
    char v56 = sub_252897B60();
    os_log_type_t v57 = sub_252897FB0();
    if (os_log_type_enabled(v56, v57))
    {
      unint64_t v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v58 = 0;
      _os_log_impl(&dword_252856000, v56, v57, "HMHomeManager.orderedHomes is empty", v58, 2u);
      MEMORY[0x2533BFA60](v58, -1, -1);
    }

    uint64_t v50 = MEMORY[0x263F8EE78];
    goto LABEL_44;
  }
  int64_t v20 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v20 < 1) {
    goto LABEL_41;
  }
LABEL_13:
  unint64_t v21 = (void *)(v0 + 16);
  unint64_t v22 = *(void *)(v0 + 72);
  sub_2528712A8(v22);
  sub_2528974D0();
  sub_2528712A8(v22);
  sub_2528974D0();
  uint64_t v23 = sub_252897B60();
  os_log_type_t v24 = sub_252897FD0();
  if (os_log_type_enabled(v23, v24))
  {
    os_log_type_t v62 = v24;
    log = v23;
    unint64_t v65 = v19;
    unint64_t v60 = (void *)(v0 + 16);
    uint64_t v25 = *(void *)(v0 + 88);
    uint64_t v26 = (_DWORD *)swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    uint64_t v70 = v61;
    uint64_t v67 = v26;
    *uint64_t v26 = 136315394;
    uint64_t v71 = MEMORY[0x263F8EE78];
    sub_252868D34(0, v20, 0);
    uint64_t v27 = 0;
    uint64_t v28 = v71;
    unint64_t v68 = v18;
    unint64_t v29 = v18 & 0xC000000000000001;
    do
    {
      if (v29) {
        id v30 = (id)MEMORY[0x2533BF180](v27, v68);
      }
      else {
        id v30 = *(id *)(v68 + 8 * v27 + 32);
      }
      char v31 = v30;
      id v32 = objc_msgSend(v30, sel_uniqueIdentifier, v60);
      sub_2528976A0();

      uint64_t v71 = v28;
      unint64_t v34 = *(void *)(v28 + 16);
      unint64_t v33 = *(void *)(v28 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_252868D34(v33 > 1, v34 + 1, 1);
        uint64_t v28 = v71;
      }
      uint64_t v35 = *(void *)(v0 + 96);
      uint64_t v36 = *(void *)(v0 + 80);
      ++v27;
      *(void *)(v28 + 16) = v34 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 32))(v28+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v34, v35, v36);
    }
    while (v20 != v27);
    uint64_t v38 = *(void *)(v0 + 72);
    uint64_t v39 = MEMORY[0x2533BED00](v28, *(void *)(v0 + 80));
    unint64_t v41 = v40;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 32) = sub_252868708(v39, v41, &v70);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    unint64_t v18 = v68;
    swift_bridgeObjectRelease_n();
    *((_WORD *)v67 + 6) = 2080;
    if (v38 == 1)
    {
      uint64_t v43 = 7105633;
      unint64_t v42 = 0xE300000000000000;
    }
    else if (v38)
    {
      unint64_t v44 = *(void *)(v0 + 72);
      uint64_t v71 = 0x3A796C6E6FLL;
      unint64_t v72 = 0xE500000000000000;
      sub_2528712A8(v44);
      type metadata accessor for HomeID();
      sub_252871448(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
      sub_252897EE0();
      sub_252897CF0();
      swift_bridgeObjectRelease();
      sub_252870240(v44);
      uint64_t v43 = v71;
      unint64_t v42 = v72;
    }
    else
    {
      unint64_t v42 = 0xE700000000000000;
      uint64_t v43 = 0x746E6572727563;
    }
    unint64_t v21 = v60;
    unint64_t v45 = *(void *)(v0 + 72);
    *(void *)(v0 + 40) = sub_252868708(v43, v42, &v70);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    sub_252870240(v45);
    sub_252870240(v45);
    _os_log_impl(&dword_252856000, log, v62, "[HMHomeManager.orderedHomes] homes=%s using scope=%s", (uint8_t *)v67, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v61, -1, -1);
    MEMORY[0x2533BFA60](v67, -1, -1);

    unint64_t v19 = v65;
  }
  else
  {
    unint64_t v37 = *(void *)(v0 + 72);
    swift_bridgeObjectRelease_n();
    sub_252870240(v37);
    sub_252870240(v37);
  }
  *unint64_t v21 = MEMORY[0x263F8EE78];
  if (v19)
  {
    sub_2528974D0();
    uint64_t v46 = sub_252898350();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v46 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v0 + 128) = v46;
  uint64_t v47 = *(void *)(v0 + 120);
  if (v46)
  {
    if ((v47 & 0xC000000000000001) != 0) {
      id v48 = (id)MEMORY[0x2533BF180](0);
    }
    else {
      id v48 = *(id *)(v47 + 32);
    }
    uint64_t v51 = (uint64_t)v48;
    *(void *)(v0 + 136) = v48;
    *(void *)(v0 + 144) = 1;
    unsigned int v69 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2DE58 + dword_269C2DE58);
    id v52 = v48;
    uint64_t v53 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v53;
    *uint64_t v53 = v0;
    v53[1] = sub_252867550;
    uint64_t v54 = *(void *)(v0 + 64);
    return v69(v54, v51);
  }
  unint64_t v49 = *(void **)(v0 + 112);
  swift_bridgeObjectRelease();

  uint64_t v50 = *(void *)(v0 + 16);
LABEL_44:
  swift_task_dealloc();
  char v59 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v59(v50);
}

uint64_t sub_252867550(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 160) = v1;
  swift_task_dealloc();

  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    BOOL v5 = (id (*)())sub_252871544;
  }
  else
  {
    *(void *)(v4 + 168) = a1;
    BOOL v5 = sub_252867698;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

id sub_252867698()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 128);
  id v4 = *(id *)(v0 + 136);
  uint64_t v5 = sub_25286D714(v1, v4, v0 + 24, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (void (*)(BOOL, unint64_t, uint64_t))sub_252868E18, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);

  swift_bridgeObjectRelease();
  sub_252868010(v5, &qword_269C2DA40, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);

  if (v2 == v3)
  {
    unint64_t v6 = *(void **)(v0 + 112);
    swift_bridgeObjectRelease();

    uint64_t v7 = *(void *)(v0 + 16);
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return (id)v8(v7);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 144);
    uint64_t v11 = *(void *)(v0 + 120);
    if ((v11 & 0xC000000000000001) != 0) {
      id result = (id)MEMORY[0x2533BF180](*(void *)(v0 + 144));
    }
    else {
      id result = *(id *)(v11 + 8 * v10 + 32);
    }
    uint64_t v12 = (uint64_t)result;
    *(void *)(v0 + 136) = result;
    *(void *)(v0 + 144) = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
    }
    else
    {
      unint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2DE58 + dword_269C2DE58);
      id v13 = result;
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v14;
      *uint64_t v14 = v0;
      v14[1] = sub_252867550;
      uint64_t v15 = *(void *)(v0 + 64);
      return (id)v16(v15, v12);
    }
  }
  return result;
}

uint64_t sub_2528678CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v22 = v4 + v2;
  }
  else {
    int64_t v22 = v4;
  }
  unint64_t v3 = sub_25286821C(isUniquelyReferenced_nonNull_native, v22, 1, v3, &qword_269C2DAD8, (uint64_t (*)(void))type metadata accessor for ElementID, (uint64_t (*)(void))type metadata accessor for ElementID);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = (*(void *)(v3 + 24) >> 1) - v8;
  uint64_t v10 = *(void *)(type metadata accessor for ElementID() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = v3 + v12 + v11 * v8;
  unint64_t v14 = a1 + v12;
  uint64_t v15 = v11 * v2;
  unint64_t v16 = v13 + v15;
  unint64_t v17 = v14 + v15;
  if (v14 < v16 && v13 < v17) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFADD__(v19, v2);
  uint64_t v21 = v19 + v2;
  if (!v20)
  {
    *(void *)(v3 + 16) = v21;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_252867AA0(uint64_t a1)
{
  int64_t v4 = *(void *)(a1 + 16);
  if ((unint64_t)*v1 >> 62)
  {
    sub_2528974D0();
    uint64_t v21 = sub_252898350();
    swift_bridgeObjectRelease();
    uint64_t v6 = v21 + v4;
    if (!__OFADD__(v21, v4)) {
      goto LABEL_3;
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v4;
  if (__OFADD__(v5, v4)) {
    goto LABEL_27;
  }
LABEL_3:
  unint64_t v7 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v7;
  uint64_t v9 = 0;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v7 & 0x8000000000000000) != 0
    || (v7 & 0x4000000000000000) != 0)
  {
LABEL_8:
    if (v7 >> 62)
    {
      sub_2528974D0();
      uint64_t v11 = sub_252898350();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v11 <= v6) {
      uint64_t v11 = v6;
    }
    sub_2528974D0();
    uint64_t v12 = MEMORY[0x2533BF190](v9, v11, 1, v7);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v12;
    uint64_t v10 = v12 & 0xFFFFFFFFFFFFFF8;
    goto LABEL_13;
  }
  uint64_t v10 = v7 & 0xFFFFFFFFFFFFFF8;
  if (v6 > *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
  {
    uint64_t v9 = 1;
    goto LABEL_8;
  }
LABEL_13:
  uint64_t v13 = *(void *)(v10 + 16);
  int64_t v14 = (*(void *)(v10 + 24) >> 1) - v13;
  if (!v4) {
    goto LABEL_23;
  }
  if (v14 < v4)
  {
    __break(1u);
LABEL_45:
    uint64_t v28 = v2 + 1;
    goto LABEL_46;
  }
  unint64_t v15 = v10 + 8 * v13 + 32;
  if (a1 + 32 < v15 + 8 * v4 && v15 < a1 + 32 + 8 * v4) {
    goto LABEL_49;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAB8);
  swift_arrayInitWithCopy();
  if (v4 <= 0) {
    goto LABEL_23;
  }
  uint64_t v17 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  BOOL v18 = __OFADD__(v17, v4);
  uint64_t v19 = v17 + v4;
  if (!v18)
  {
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
LABEL_23:
    if (v4 != v14)
    {
LABEL_24:
      sub_2528975E0();
      return sub_252897DF0();
    }
LABEL_28:
    uint64_t v22 = *(void *)(a1 + 16);
    if (v4 == v22) {
      goto LABEL_24;
    }
    uint64_t v2 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v23 = sub_25286D264((uint64_t)v34, v4, a1);
    uint64_t v25 = *v24;
    swift_unknownObjectRetain();
    ((void (*)(unsigned char *, void))v23)(v34, 0);
    BOOL v18 = __OFADD__(v4, 1);
    unint64_t v27 = v4 + 1;
    if (v18)
    {
      __break(1u);
      goto LABEL_32;
    }
    while (1)
    {
LABEL_33:
      uint64_t v26 = *v1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v28 = v2 + 1;
      if (v2 + 1 > *(void *)(v26 + 0x18) >> 1)
      {
        sub_252897E00();
        uint64_t v26 = *v1 & 0xFFFFFFFFFFFFFF8;
      }
      uint64_t v29 = *(void *)(v26 + 24) >> 1;
      if (v2 < v29) {
        break;
      }
LABEL_32:
      *(void *)(v26 + 16) = v2;
    }
    *(void *)(v26 + 8 * v2 + 32) = v25;
    if (v27 != v22)
    {
      uint64_t v30 = v26 + 40;
      while (1)
      {
        char v31 = sub_25286D264((uint64_t)v34, v27, a1);
        uint64_t v25 = *v32;
        swift_unknownObjectRetain();
        ((void (*)(unsigned char *, void))v31)(v34, 0);
        unint64_t v33 = v27 + 1;
        if (__OFADD__(v27, 1)) {
          goto LABEL_48;
        }
        if (v29 - 1 == v2)
        {
          ++v27;
          uint64_t v2 = v29;
          *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v29;
          goto LABEL_33;
        }
        *(void *)(v30 + 8 * v2) = v25;
        ++v27;
        ++v2;
        if (v33 == v22) {
          goto LABEL_45;
        }
      }
    }
LABEL_46:
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v28;
    goto LABEL_24;
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_252867E18(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_2528974D0();
    uint64_t v3 = sub_252898350();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    sub_2528974D0();
    uint64_t v5 = sub_252898350();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    sub_2528974D0();
    unint64_t v4 = MEMORY[0x2533BF190](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_25286CD1C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1, &qword_269C2DAA0, &qword_269C2DAB0, &qword_269C2DAA8, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_25286D024);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    sub_2528974D0();
    uint64_t v9 = sub_252898350();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_252897DF0();
}

uint64_t sub_252868010(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  unint64_t v6 = *(void *)(a1 + 16);
  unint64_t v7 = *v5;
  int64_t v8 = *(void *)(*v5 + 16);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v9 <= *(void *)(v7 + 24) >> 1)
  {
    unint64_t v16 = *(void *)(a1 + 16);
    if (v16) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v6) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v8 <= v9) {
    int64_t v31 = v8 + v6;
  }
  else {
    int64_t v31 = v8;
  }
  unint64_t v7 = sub_25286821C(isUniquelyReferenced_nonNull_native, v31, 1, v7, a2, a3, a4);
  unint64_t v16 = *(void *)(a1 + 16);
  if (!v16) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v17 = *(void *)(v7 + 16);
  uint64_t v18 = (*(void *)(v7 + 24) >> 1) - v17;
  uint64_t v19 = *(void *)(a5(0) - 8);
  uint64_t v20 = *(void *)(v19 + 72);
  if (v18 < (uint64_t)v16)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v21 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v22 = v7 + v21 + v20 * v17;
  unint64_t v23 = a1 + v21;
  uint64_t v24 = v20 * v16;
  unint64_t v25 = v22 + v24;
  unint64_t v26 = v23 + v24;
  if (v23 < v25 && v22 < v26) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v16 < v6)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v28 = *(void *)(v7 + 16);
  BOOL v29 = __OFADD__(v28, v16);
  uint64_t v30 = v28 + v16;
  if (!v29)
  {
    *(void *)(v7 + 16) = v30;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v5 = v7;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_2528681E8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_25286821C(a1, a2, a3, a4, &qword_269C2DA90, (uint64_t (*)(void))type metadata accessor for TileElementInfo, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
}

uint64_t sub_25286821C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
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
    uint64_t result = sub_252898340();
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
    sub_25286F334(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_25286849C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v10 = a2;
      }
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (BOOL v18 = v14 == -1) : (BOOL v18 = 0), v18))
  {
LABEL_29:
    uint64_t result = sub_252898340();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v16 + v20;
  if (a1)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(void *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_252871148(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_252868708(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2528687DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2528714E0((uint64_t)v12, *a3);
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
      sub_2528714E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    sub_2528974D0();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2528687DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2528980E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_252868998(a5, a6);
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
  uint64_t v8 = sub_2528982A0();
  if (!v8)
  {
    sub_252898340();
    __break(1u);
LABEL_17:
    uint64_t result = sub_252898390();
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

uint64_t sub_252868998(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_252868A30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_252868BA8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_252868BA8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_252868A30(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_252890124(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_252898250();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_252898340();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_252897D00();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_252898390();
    __break(1u);
LABEL_14:
    uint64_t result = sub_252898340();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_252868BA8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DB50);
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
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_252868CF8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_252868E84(a1, a2, a3, (void *)*v3, &qword_269C2DAD8, (uint64_t (*)(void))type metadata accessor for ElementID);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_252868D34(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_252868E84(a1, a2, a3, (void *)*v3, &qword_269C2DA88, MEMORY[0x263F07508]);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_252868D70(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_252868E84(a1, a2, a3, (void *)*v3, &qword_269C2DB20, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_252868DAC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2528690CC(a1, a2, a3, (void *)*v3, &qword_269C2DB38, &qword_269C2DB30);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_252868DDC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_252868E84(a1, a2, a3, (void *)*v3, &qword_269C2DAF8, (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_252868E18(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_252868E84(a1, a2, a3, (void *)*v3, &qword_269C2DA40, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_252868E54(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2528690CC(a1, a2, a3, (void *)*v3, &qword_269C2DA60, &qword_269C2DA58);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_252868E84(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    sub_2528975E0();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_2528690CC(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (char *)v16 + v20;
  unint64_t v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    sub_2528975E0();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_25286930C(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 24);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v15 = (unint64_t)(v13 + 4);
  unint64_t v16 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v15 >= v16 + 24 * v11) {
      memmove(v13 + 4, a4 + 4, 24 * v11);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 24 * v11 || v15 >= v16 + 24 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    sub_2528975E0();
    return (uint64_t)v13;
  }
LABEL_30:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

unint64_t sub_2528694B8(uint64_t a1)
{
  sub_2528976E0();
  sub_252871448((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  uint64_t v2 = sub_252897C10();
  return sub_2528696B8(a1, v2);
}

unint64_t sub_252869550(uint64_t a1, unint64_t a2)
{
  sub_252898530();
  sub_252898540();
  if (a2 > 1) {
    sub_252897CE0();
  }
  uint64_t v4 = sub_252898560();
  return sub_252869878(a1, a2, v4);
}

unint64_t sub_2528695F4(unsigned __int8 a1)
{
  sub_252898530();
  sub_252897CE0();
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_252898560();
  return sub_25286995C(a1, v2);
}

unint64_t sub_2528696B8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_2528976E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  int64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_252871448(&qword_269C2DA98, MEMORY[0x263F07508]);
      char v15 = sub_252897C30();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_252869878(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = ~v5;
    uint64_t v10 = *(void *)(v3 + 48);
    do
    {
      uint64_t v11 = (void *)(v10 + 16 * v6);
      uint64_t v12 = v11[1];
      if (v12)
      {
        if (v12 == 1)
        {
          if (a2 == 1) {
            return v6;
          }
        }
        else if (a2 >= 2)
        {
          BOOL v13 = *v11 == a1 && v12 == a2;
          if (v13 || (sub_2528984C0() & 1) != 0) {
            return v6;
          }
        }
      }
      else if (!a2)
      {
        return v6;
      }
      unint64_t v6 = (v6 + 1) & v9;
    }
    while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
  }
  return v6;
}

unint64_t sub_25286995C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    while (1)
    {
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        if (*(unsigned char *)(*(void *)(v2 + 48) + v4) == 1)
        {
          unint64_t v7 = 0xE600000000000000;
          uint64_t v8 = 0x73656E656373;
          int v9 = a1;
          if (!a1) {
            goto LABEL_17;
          }
        }
        else
        {
          uint64_t v8 = 0x726F737365636361;
          unint64_t v7 = 0xEB00000000736569;
          int v9 = a1;
          if (!a1)
          {
LABEL_17:
            unint64_t v11 = 0xE300000000000000;
            if (v8 != 7105633) {
              goto LABEL_19;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
        unint64_t v7 = 0xE300000000000000;
        uint64_t v8 = 7105633;
        int v9 = a1;
        if (!a1) {
          goto LABEL_17;
        }
      }
      if (v9 == 1) {
        uint64_t v10 = 0x73656E656373;
      }
      else {
        uint64_t v10 = 0x726F737365636361;
      }
      if (v9 == 1) {
        unint64_t v11 = 0xE600000000000000;
      }
      else {
        unint64_t v11 = 0xEB00000000736569;
      }
      if (v8 != v10) {
        goto LABEL_19;
      }
LABEL_18:
      if (v7 == v11)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
LABEL_19:
      char v12 = sub_2528984C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v6;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
  }
  return v4;
}

uint64_t sub_252869AF8(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for HomeXLTileEntity() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_25286D2A4(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_25286A0CC(v6, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
  *a1 = v3;
  return result;
}

uint64_t sub_252869C18(void **a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for HomeSingleTileEntity() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_25286D334(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_25286A0CC(v6, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
  *a1 = v3;
  return result;
}

uint64_t sub_252869D38(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t *a3)
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = sub_25286AC74(v9, a3);
  *a1 = v6;
  return result;
}

void *sub_252869DBC(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAC0);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    sub_2528974D0();
    sub_25286CAF8((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    sub_2528974D0();
    uint64_t v2 = sub_252898350();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

void *sub_252869EB4(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAC0);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    sub_2528974D0();
    sub_25286CD1C((unint64_t)(v3 + 4), v2, v1, &qword_269C2DAB8, &qword_269C2DAD0, &qword_269C2DAC8, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_25286CFBC);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    sub_2528974D0();
    uint64_t v2 = sub_252898350();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

uint64_t *sub_252869FD8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (uint64_t *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  int64_t v4 = (uint64_t *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = v2;
  v4[3] = 2 * ((uint64_t)(v5 - 32) / 24);
  unint64_t v6 = sub_25286D3B0(&v8, v4 + 4, v2, a1);
  sub_2528974D0();
  sub_2528712A0();
  if (v6 != (void *)v2)
  {
    __break(1u);
    return (uint64_t *)MEMORY[0x263F8EE78];
  }
  return v4;
}

uint64_t sub_25286A0CC(uint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  v173 = a7;
  v174 = a6;
  v184 = a5;
  v179 = a3;
  v180 = a4;
  uint64_t v8 = v7;
  uint64_t v182 = a2(0);
  uint64_t v175 = *(void *)(v182 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v182);
  uint64_t v168 = (uint64_t)&v160 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v183 = (uint64_t)&v160 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v160 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  v163 = (char *)&v160 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v171 = (uint64_t)&v160 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v170 = (uint64_t)&v160 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v166 = (uint64_t)&v160 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v165 = (uint64_t)&v160 - v25;
  v185 = a1;
  uint64_t v26 = a1[1];
  uint64_t result = sub_252898480();
  if (result >= v26)
  {
    if (v26 < 0) {
      goto LABEL_157;
    }
    if (v26) {
      return sub_25286B4B4(0, v26, 1, v185, v174, v179, v180, v184);
    }
    return result;
  }
  if (v26 >= 0) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = v26 + 1;
  }
  if (v26 < -1) {
    goto LABEL_165;
  }
  v176 = v16;
  uint64_t v162 = result;
  if (v26 < 2)
  {
    id v32 = (char *)MEMORY[0x263F8EE78];
    unint64_t v172 = MEMORY[0x263F8EE78]
         + ((*(unsigned __int8 *)(v175 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v175 + 80));
    uint64_t v161 = MEMORY[0x263F8EE78];
    if (v26 != 1)
    {
      unint64_t v34 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_123:
      v153 = v32;
      if (v34 >= 2)
      {
        uint64_t v154 = *v185;
        do
        {
          unint64_t v155 = v34 - 2;
          if (v34 < 2) {
            goto LABEL_152;
          }
          if (!v154) {
            goto LABEL_164;
          }
          uint64_t v156 = *(void *)&v153[16 * v155 + 32];
          uint64_t v157 = *(void *)&v153[16 * v34 + 24];
          sub_25286B8B0(v154 + *(void *)(v175 + 72) * v156, v154 + *(void *)(v175 + 72) * *(void *)&v153[16 * v34 + 16], v154 + *(void *)(v175 + 72) * v157, v172, v174, v179, v180, v173);
          if (v8) {
            break;
          }
          if (v157 < v156) {
            goto LABEL_153;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v153 = sub_25286C59C((uint64_t)v153);
          }
          if (v155 >= *((void *)v153 + 2)) {
            goto LABEL_154;
          }
          v158 = &v153[16 * v155 + 32];
          *(void *)v158 = v156;
          *((void *)v158 + 1) = v157;
          unint64_t v159 = *((void *)v153 + 2);
          if (v34 > v159) {
            goto LABEL_155;
          }
          memmove(&v153[16 * v34 + 16], &v153[16 * v34 + 32], 16 * (v159 - v34));
          *((void *)v153 + 2) = v159 - 1;
          unint64_t v34 = v159 - 1;
        }
        while (v159 > 2);
      }
LABEL_134:
      swift_bridgeObjectRelease();
      *(void *)(v161 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v29 = v28 >> 1;
    uint64_t v30 = sub_252897E20();
    *(void *)(v30 + 16) = v29;
    uint64_t v31 = *(unsigned __int8 *)(v175 + 80);
    uint64_t v161 = v30;
    unint64_t v172 = v30 + ((v31 + 32) & ~v31);
  }
  uint64_t v33 = 0;
  id v32 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v35 = v33;
    uint64_t v36 = v33 + 1;
    uint64_t v169 = v33;
    if (v33 + 1 >= v26)
    {
      uint64_t v52 = v33 + 1;
      goto LABEL_74;
    }
    uint64_t v164 = v8;
    uint64_t v37 = *v185;
    uint64_t v38 = *(void *)(v175 + 72);
    uint64_t v39 = v165;
    unint64_t v40 = v179;
    sub_252870250(*v185 + v38 * v36, v165, v179);
    uint64_t v177 = v37;
    uint64_t v178 = v38;
    uint64_t v41 = v37 + v38 * v35;
    uint64_t v42 = v166;
    sub_252870250(v41, v166, v40);
    uint64_t v43 = *(int *)(v182 + 24);
    uint64_t v44 = v39 + v43;
    uint64_t v45 = type metadata accessor for TileElementInfo();
    uint64_t v46 = *(int *)(v45 + 20);
    uint64_t v47 = *(void *)(v44 + v46);
    uint64_t v48 = *(void *)(v44 + v46 + 8);
    unint64_t v49 = (void *)(v42 + v43 + v46);
    if (v47 == *v49 && v48 == v49[1]) {
      int v51 = 0;
    }
    else {
      int v51 = sub_2528984C0();
    }
    uint64_t v53 = v180;
    sub_2528712B8(v166, v180);
    sub_2528712B8(v165, v53);
    uint64_t v181 = v35 + 2;
    if (v35 + 2 < v26)
    {
      v160 = v32;
      uint64_t v54 = v177;
      uint64_t v55 = v178 * v36;
      uint64_t v56 = v178 * (v35 + 2);
      while (1)
      {
        uint64_t v57 = v170;
        unint64_t v58 = v179;
        sub_252870250(v54 + v56, v170, v179);
        uint64_t v59 = v171;
        sub_252870250(v54 + v55, v171, v58);
        uint64_t v60 = *(int *)(v182 + 24);
        uint64_t v61 = *(int *)(v45 + 20);
        os_log_type_t v62 = (void *)(v57 + v60 + v61);
        uint64_t v63 = (void *)(v59 + v60 + v61);
        BOOL v64 = *v62 == *v63 && v62[1] == v63[1];
        int v65 = v64 ? 0 : sub_2528984C0();
        os_log_type_t v66 = v180;
        sub_2528712B8(v171, v180);
        sub_2528712B8(v170, v66);
        if ((v51 ^ v65)) {
          break;
        }
        v54 += v178;
        if (v26 == ++v181)
        {
          uint64_t v181 = v26;
          break;
        }
      }
      id v32 = v160;
      uint64_t v35 = v169;
    }
    uint64_t v8 = v164;
    if ((v51 & 1) == 0) {
      break;
    }
    uint64_t v52 = v181;
    if (v181 < v35) {
      goto LABEL_158;
    }
    if (v35 >= v181) {
      goto LABEL_49;
    }
    uint64_t v167 = v26;
    uint64_t v67 = v32;
    uint64_t v68 = 0;
    uint64_t v69 = v178 * (v181 - 1);
    uint64_t v70 = v181 * v178;
    uint64_t v71 = v35;
    uint64_t v72 = v35 * v178;
    do
    {
      if (v71 != v52 + v68 - 1)
      {
        uint64_t v73 = v177;
        if (!v177) {
          goto LABEL_163;
        }
        unint64_t v74 = v177 + v72;
        sub_25287137C(v177 + v72, v168, v184);
        if (v72 < v69 || v74 >= v73 + v70)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v72 != v69)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_25287137C(v168, v73 + v69, v184);
        uint64_t v52 = v181;
      }
      ++v71;
      --v68;
      v69 -= v178;
      v70 -= v178;
      v72 += v178;
    }
    while (v71 < v52 + v68);
    id v32 = v67;
    uint64_t v8 = v164;
    uint64_t v35 = v169;
    uint64_t v26 = v167;
    if (v52 < v167) {
      goto LABEL_50;
    }
LABEL_74:
    if (v52 < v35) {
      goto LABEL_151;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v181 = v52;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      id v32 = sub_25286C1D0(0, *((void *)v32 + 2) + 1, 1, v32);
    }
    unint64_t v102 = *((void *)v32 + 2);
    unint64_t v101 = *((void *)v32 + 3);
    unint64_t v34 = v102 + 1;
    if (v102 >= v101 >> 1) {
      id v32 = sub_25286C1D0((char *)(v101 > 1), v102 + 1, 1, v32);
    }
    uint64_t v103 = v8;
    *((void *)v32 + 2) = v34;
    unint64_t v104 = v32 + 32;
    uint64_t v105 = &v32[16 * v102 + 32];
    uint64_t v106 = v181;
    *(void *)uint64_t v105 = v35;
    *((void *)v105 + 1) = v106;
    if (v102)
    {
      while (1)
      {
        unint64_t v107 = v34 - 1;
        if (v34 >= 4)
        {
          unint64_t v112 = &v104[16 * v34];
          uint64_t v113 = *((void *)v112 - 8);
          uint64_t v114 = *((void *)v112 - 7);
          BOOL v118 = __OFSUB__(v114, v113);
          uint64_t v115 = v114 - v113;
          if (v118) {
            goto LABEL_140;
          }
          uint64_t v117 = *((void *)v112 - 6);
          uint64_t v116 = *((void *)v112 - 5);
          BOOL v118 = __OFSUB__(v116, v117);
          uint64_t v110 = v116 - v117;
          char v111 = v118;
          if (v118) {
            goto LABEL_141;
          }
          unint64_t v119 = v34 - 2;
          v120 = &v104[16 * v34 - 32];
          uint64_t v122 = *(void *)v120;
          uint64_t v121 = *((void *)v120 + 1);
          BOOL v118 = __OFSUB__(v121, v122);
          uint64_t v123 = v121 - v122;
          if (v118) {
            goto LABEL_143;
          }
          BOOL v118 = __OFADD__(v110, v123);
          uint64_t v124 = v110 + v123;
          if (v118) {
            goto LABEL_146;
          }
          if (v124 >= v115)
          {
            v142 = &v104[16 * v107];
            uint64_t v144 = *(void *)v142;
            uint64_t v143 = *((void *)v142 + 1);
            BOOL v118 = __OFSUB__(v143, v144);
            uint64_t v145 = v143 - v144;
            if (v118) {
              goto LABEL_150;
            }
            BOOL v135 = v110 < v145;
            goto LABEL_111;
          }
        }
        else
        {
          if (v34 != 3)
          {
            uint64_t v136 = *((void *)v32 + 4);
            uint64_t v137 = *((void *)v32 + 5);
            BOOL v118 = __OFSUB__(v137, v136);
            uint64_t v129 = v137 - v136;
            char v130 = v118;
            goto LABEL_105;
          }
          uint64_t v109 = *((void *)v32 + 4);
          uint64_t v108 = *((void *)v32 + 5);
          BOOL v118 = __OFSUB__(v108, v109);
          uint64_t v110 = v108 - v109;
          char v111 = v118;
        }
        if (v111) {
          goto LABEL_142;
        }
        unint64_t v119 = v34 - 2;
        unint64_t v125 = &v104[16 * v34 - 32];
        uint64_t v127 = *(void *)v125;
        uint64_t v126 = *((void *)v125 + 1);
        BOOL v128 = __OFSUB__(v126, v127);
        uint64_t v129 = v126 - v127;
        char v130 = v128;
        if (v128) {
          goto LABEL_145;
        }
        unint64_t v131 = &v104[16 * v107];
        uint64_t v133 = *(void *)v131;
        uint64_t v132 = *((void *)v131 + 1);
        BOOL v118 = __OFSUB__(v132, v133);
        uint64_t v134 = v132 - v133;
        if (v118) {
          goto LABEL_148;
        }
        if (__OFADD__(v129, v134)) {
          goto LABEL_149;
        }
        if (v129 + v134 >= v110)
        {
          BOOL v135 = v110 < v134;
LABEL_111:
          if (v135) {
            unint64_t v107 = v119;
          }
          goto LABEL_113;
        }
LABEL_105:
        if (v130) {
          goto LABEL_144;
        }
        uint64_t v138 = &v104[16 * v107];
        uint64_t v140 = *(void *)v138;
        uint64_t v139 = *((void *)v138 + 1);
        BOOL v118 = __OFSUB__(v139, v140);
        uint64_t v141 = v139 - v140;
        if (v118) {
          goto LABEL_147;
        }
        if (v141 < v129) {
          goto LABEL_14;
        }
LABEL_113:
        unint64_t v146 = v107 - 1;
        if (v107 - 1 >= v34)
        {
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
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
          goto LABEL_160;
        }
        if (!*v185) {
          goto LABEL_162;
        }
        v147 = v32;
        v148 = &v104[16 * v146];
        uint64_t v149 = *(void *)v148;
        v150 = &v104[16 * v107];
        uint64_t v151 = *((void *)v150 + 1);
        sub_25286B8B0(*v185 + *(void *)(v175 + 72) * *(void *)v148, *v185 + *(void *)(v175 + 72) * *(void *)v150, *v185 + *(void *)(v175 + 72) * v151, v172, v174, v179, v180, v173);
        if (v103) {
          goto LABEL_134;
        }
        if (v151 < v149) {
          goto LABEL_137;
        }
        if (v107 > *((void *)v147 + 2)) {
          goto LABEL_138;
        }
        *(void *)v148 = v149;
        *(void *)&v104[16 * v146 + 8] = v151;
        unint64_t v152 = *((void *)v147 + 2);
        if (v107 >= v152) {
          goto LABEL_139;
        }
        id v32 = v147;
        unint64_t v34 = v152 - 1;
        memmove(&v104[16 * v107], v150 + 16, 16 * (v152 - 1 - v107));
        *((void *)v147 + 2) = v152 - 1;
        if (v152 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v34 = 1;
LABEL_14:
    uint64_t v26 = v185[1];
    uint64_t v33 = v181;
    uint64_t v8 = v103;
    if (v181 >= v26) {
      goto LABEL_123;
    }
  }
  uint64_t v52 = v181;
LABEL_49:
  if (v52 >= v26) {
    goto LABEL_74;
  }
LABEL_50:
  if (__OFSUB__(v52, v35)) {
    goto LABEL_156;
  }
  if (v52 - v35 >= v162) {
    goto LABEL_74;
  }
  if (__OFADD__(v35, v162)) {
    goto LABEL_159;
  }
  if (v35 + v162 >= v26) {
    uint64_t v75 = v26;
  }
  else {
    uint64_t v75 = v35 + v162;
  }
  if (v75 >= v35)
  {
    if (v52 != v75)
    {
      v160 = v32;
      uint64_t v164 = v8;
      uint64_t v76 = *(void *)(v175 + 72);
      uint64_t v77 = v76 * (v52 - 1);
      uint64_t v177 = v76;
      uint64_t v78 = v52 * v76;
      uint64_t v79 = (uint64_t)v163;
      uint64_t v167 = v75;
      do
      {
        uint64_t v82 = 0;
        uint64_t v83 = v35;
        uint64_t v181 = v52;
        uint64_t v178 = v78;
        while (1)
        {
          uint64_t v84 = *v185;
          v85 = v179;
          sub_252870250(v78 + v82 + *v185, v79, v179);
          uint64_t v86 = v77;
          uint64_t v87 = v77 + v82 + v84;
          uint64_t v88 = v79;
          uint64_t v89 = (uint64_t)v176;
          sub_252870250(v87, (uint64_t)v176, v85);
          uint64_t v90 = *(int *)(v182 + 24);
          uint64_t v91 = *(int *)(type metadata accessor for TileElementInfo() + 20);
          uint64_t v92 = *(void *)(v88 + v90 + v91);
          uint64_t v93 = *(void *)(v88 + v90 + v91 + 8);
          uint64_t v94 = (void *)(v89 + v90 + v91);
          if (v92 == *v94 && v93 == v94[1]) {
            break;
          }
          char v96 = sub_2528984C0();
          v97 = v180;
          sub_2528712B8(v89, v180);
          sub_2528712B8(v88, v97);
          uint64_t v79 = v88;
          if ((v96 & 1) == 0) {
            goto LABEL_60;
          }
          uint64_t v98 = *v185;
          if (!*v185) {
            goto LABEL_161;
          }
          uint64_t v77 = v86;
          uint64_t v78 = v178;
          uint64_t v99 = v98 + v77 + v82;
          sub_25287137C(v98 + v178 + v82, v183, v184);
          swift_arrayInitWithTakeFrontToBack();
          sub_25287137C(v183, v99, v184);
          v82 -= v177;
          ++v83;
          uint64_t v81 = v181;
          if (v181 == v83) {
            goto LABEL_61;
          }
        }
        uint64_t v80 = v180;
        sub_2528712B8(v89, v180);
        sub_2528712B8(v88, v80);
        uint64_t v79 = v88;
LABEL_60:
        uint64_t v81 = v181;
        uint64_t v77 = v86;
        uint64_t v78 = v178;
LABEL_61:
        uint64_t v52 = v81 + 1;
        v77 += v177;
        v78 += v177;
        uint64_t v35 = v169;
      }
      while (v52 != v167);
      uint64_t v52 = v167;
      uint64_t v8 = v164;
      id v32 = v160;
    }
    goto LABEL_74;
  }
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  uint64_t result = sub_252898340();
  __break(1u);
  return result;
}

uint64_t sub_25286AC74(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = v2;
  uint64_t v6 = a1[1];
  uint64_t result = sub_252898480();
  if (result >= v6)
  {
    if (v6 < 0) {
      goto LABEL_178;
    }
    if (v6) {
      return sub_25286B76C(0, v6, 1, a1);
    }
    return result;
  }
  if (v6 >= 0) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v6 + 1;
  }
  if (v6 < -1) {
    goto LABEL_186;
  }
  uint64_t v113 = result;
  uint64_t v110 = a1;
  if (v6 < 2)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v6 != 1)
    {
      unint64_t v15 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v14 = (char *)MEMORY[0x263F8EE78];
LABEL_144:
      unint64_t v101 = v14;
      uint64_t v112 = v11;
      uint64_t v118 = v4;
      if (v15 >= 2)
      {
        uint64_t v102 = *v110;
        do
        {
          unint64_t v103 = v15 - 2;
          if (v15 < 2) {
            goto LABEL_173;
          }
          if (!v102) {
            goto LABEL_185;
          }
          unint64_t v104 = v101;
          uint64_t v105 = *(void *)&v101[16 * v103 + 32];
          uint64_t v106 = *(void *)&v101[16 * v15 + 24];
          sub_25286BE40((char *)(v102 + 24 * v105), (char *)(v102 + 24 * *(void *)&v101[16 * v15 + 16]), (char *)(v102 + 24 * v106), __dst);
          if (v118) {
            break;
          }
          if (v106 < v105) {
            goto LABEL_174;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v104 = sub_25286C59C((uint64_t)v104);
          }
          if (v103 >= *((void *)v104 + 2)) {
            goto LABEL_175;
          }
          unint64_t v107 = &v104[16 * v103 + 32];
          *(void *)unint64_t v107 = v105;
          *((void *)v107 + 1) = v106;
          unint64_t v108 = *((void *)v104 + 2);
          if (v15 > v108) {
            goto LABEL_176;
          }
          memmove(&v104[16 * v15 + 16], &v104[16 * v15 + 32], 16 * (v108 - v15));
          unint64_t v101 = v104;
          *((void *)v104 + 2) = v108 - 1;
          unint64_t v15 = v108 - 1;
        }
        while (v108 > 2);
      }
LABEL_141:
      swift_bridgeObjectRelease();
      *(void *)(v112 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v112 = MEMORY[0x263F8EE78];
    uint64_t v117 = v2;
  }
  else
  {
    uint64_t v117 = v2;
    uint64_t v9 = v8 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(a2);
    uint64_t v10 = sub_252897E20();
    *(void *)(v10 + 16) = v9;
    uint64_t v112 = v10;
    __dst = (char *)(v10 + 32);
  }
  uint64_t v12 = 0;
  uint64_t v13 = *a1;
  uint64_t v111 = *a1 + 56;
  uint64_t v109 = *a1 - 24;
  uint64_t v14 = (char *)MEMORY[0x263F8EE78];
  uint64_t v114 = v6;
  uint64_t v115 = *a1;
  while (2)
  {
    uint64_t v16 = v12++;
    uint64_t v17 = v16;
    if (v12 >= v6) {
      goto LABEL_60;
    }
    unint64_t v18 = *(void *)(v13 + 24 * v12 + 8);
    unint64_t v19 = *(void *)(v13 + 24 * v16 + 8);
    if (!v18) {
      goto LABEL_22;
    }
    if (v18 == 1)
    {
      unint64_t v18 = 2;
LABEL_22:
      if (v19 == 1) {
        unint64_t v20 = 2;
      }
      else {
        unint64_t v20 = 1;
      }
      if (v19) {
        BOOL v21 = v20 > v18;
      }
      else {
        BOOL v21 = 0;
      }
      int v22 = v21;
      goto LABEL_31;
    }
    if (v19 < 2)
    {
      unint64_t v18 = 1;
      goto LABEL_22;
    }
    sub_2528710F0();
    int v22 = sub_252898120() == -1;
LABEL_31:
    uint64_t v12 = v17 + 2;
    if (v17 + 2 >= v6)
    {
LABEL_51:
      if (v22) {
        goto LABEL_52;
      }
      goto LABEL_60;
    }
    uint64_t v23 = (unint64_t *)(v111 + 24 * v17);
    do
    {
      unint64_t v24 = *v23;
      unint64_t v25 = *(v23 - 3);
      if (*v23)
      {
        if (v24 == 1)
        {
          unint64_t v24 = 2;
        }
        else
        {
          if (v25 >= 2)
          {
            sub_2528710F0();
            if (v22 != (sub_252898120() == -1)) {
              goto LABEL_51;
            }
            goto LABEL_48;
          }
          unint64_t v24 = 1;
        }
      }
      if (v25 == 1) {
        unint64_t v26 = 2;
      }
      else {
        unint64_t v26 = 1;
      }
      if (v25) {
        BOOL v27 = v26 > v24;
      }
      else {
        BOOL v27 = 0;
      }
      int v28 = v27;
      if (v22 != v28) {
        goto LABEL_51;
      }
LABEL_48:
      v23 += 3;
      ++v12;
    }
    while (v6 != v12);
    uint64_t v12 = v6;
    if (!v22) {
      goto LABEL_60;
    }
LABEL_52:
    if (v12 < v17) {
      goto LABEL_179;
    }
    uint64_t v29 = v17;
    if (v17 < v12)
    {
      uint64_t v30 = 24 * v12;
      uint64_t v31 = 24 * v17;
      uint64_t v32 = v12;
      do
      {
        if (v29 != --v32)
        {
          if (!v13) {
            goto LABEL_184;
          }
          uint64_t v33 = v13 + v31;
          uint64_t v34 = v13 + v30;
          uint64_t v35 = *(void *)(v13 + v31 + 16);
          long long v36 = *(_OWORD *)(v13 + v31);
          uint64_t v37 = *(void *)(v13 + v30 - 8);
          *(_OWORD *)uint64_t v33 = *(_OWORD *)(v13 + v30 - 24);
          *(void *)(v33 + 16) = v37;
          *(_OWORD *)(v34 - 24) = v36;
          *(void *)(v34 - 8) = v35;
        }
        ++v29;
        v30 -= 24;
        v31 += 24;
      }
      while (v29 < v32);
    }
LABEL_60:
    if (v12 >= v6) {
      goto LABEL_89;
    }
    if (__OFSUB__(v12, v17)) {
      goto LABEL_177;
    }
    if (v12 - v17 >= v113)
    {
LABEL_89:
      uint64_t v39 = v17;
LABEL_90:
      if (v12 < v39) {
        goto LABEL_172;
      }
      goto LABEL_91;
    }
    if (__OFADD__(v17, v113)) {
      goto LABEL_180;
    }
    if (v17 + v113 >= v6) {
      uint64_t v38 = v6;
    }
    else {
      uint64_t v38 = v17 + v113;
    }
    if (v38 >= v17)
    {
      uint64_t v39 = v17;
      if (v12 == v38) {
        goto LABEL_90;
      }
      uint64_t v40 = v109 + 24 * v12;
      while (2)
      {
        uint64_t v41 = *(void *)(v13 + 24 * v12 + 8);
        uint64_t v42 = v39;
        uint64_t v43 = v40;
        while (2)
        {
          unint64_t v44 = *(void *)(v43 + 8);
          if (!v41)
          {
            int v45 = 1;
            goto LABEL_77;
          }
          if (v41 == 1) {
            break;
          }
          if (v44 >= 2)
          {
            sub_2528710F0();
            if (sub_252898120() != -1) {
              break;
            }
          }
          else
          {
            int v45 = 0;
LABEL_77:
            if (v44 == 1) {
              int v45 = 1;
            }
            if (v44) {
              BOOL v46 = v45 == 0;
            }
            else {
              BOOL v46 = 1;
            }
            if (v46) {
              break;
            }
          }
          if (!v13) {
            goto LABEL_182;
          }
          uint64_t v41 = *(void *)(v43 + 32);
          uint64_t v47 = *(void *)(v43 + 40);
          uint64_t v49 = *(void *)(v43 + 16);
          uint64_t v48 = *(void *)(v43 + 24);
          *(_OWORD *)(v43 + 24) = *(_OWORD *)v43;
          *(void *)(v43 + 40) = v49;
          *(void *)uint64_t v43 = v48;
          *(void *)(v43 + 8) = v41;
          *(void *)(v43 + 16) = v47;
          v43 -= 24;
          if (v12 != ++v42) {
            continue;
          }
          break;
        }
        ++v12;
        v40 += 24;
        if (v12 != v38) {
          continue;
        }
        break;
      }
      uint64_t v12 = v38;
      if (v38 < v39) {
        goto LABEL_172;
      }
LABEL_91:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v14 = sub_25286C1D0(0, *((void *)v14 + 2) + 1, 1, v14);
      }
      unint64_t v51 = *((void *)v14 + 2);
      unint64_t v50 = *((void *)v14 + 3);
      unint64_t v15 = v51 + 1;
      if (v51 >= v50 >> 1) {
        uint64_t v14 = sub_25286C1D0((char *)(v50 > 1), v51 + 1, 1, v14);
      }
      *((void *)v14 + 2) = v15;
      uint64_t v52 = v14 + 32;
      uint64_t v53 = &v14[16 * v51 + 32];
      *(void *)uint64_t v53 = v39;
      *((void *)v53 + 1) = v12;
      if (v51)
      {
        uint64_t v13 = v115;
        while (1)
        {
          unint64_t v54 = v15 - 1;
          if (v15 >= 4)
          {
            uint64_t v59 = &v52[16 * v15];
            uint64_t v60 = *((void *)v59 - 8);
            uint64_t v61 = *((void *)v59 - 7);
            BOOL v65 = __OFSUB__(v61, v60);
            uint64_t v62 = v61 - v60;
            if (v65) {
              goto LABEL_161;
            }
            uint64_t v64 = *((void *)v59 - 6);
            uint64_t v63 = *((void *)v59 - 5);
            BOOL v65 = __OFSUB__(v63, v64);
            uint64_t v57 = v63 - v64;
            char v58 = v65;
            if (v65) {
              goto LABEL_162;
            }
            unint64_t v66 = v15 - 2;
            uint64_t v67 = &v52[16 * v15 - 32];
            uint64_t v69 = *(void *)v67;
            uint64_t v68 = *((void *)v67 + 1);
            BOOL v65 = __OFSUB__(v68, v69);
            uint64_t v70 = v68 - v69;
            if (v65) {
              goto LABEL_164;
            }
            BOOL v65 = __OFADD__(v57, v70);
            uint64_t v71 = v57 + v70;
            if (v65) {
              goto LABEL_167;
            }
            if (v71 >= v62)
            {
              uint64_t v89 = &v52[16 * v54];
              uint64_t v91 = *(void *)v89;
              uint64_t v90 = *((void *)v89 + 1);
              BOOL v65 = __OFSUB__(v90, v91);
              uint64_t v92 = v90 - v91;
              if (v65) {
                goto LABEL_171;
              }
              BOOL v82 = v57 < v92;
              goto LABEL_128;
            }
          }
          else
          {
            if (v15 != 3)
            {
              uint64_t v83 = *((void *)v14 + 4);
              uint64_t v84 = *((void *)v14 + 5);
              BOOL v65 = __OFSUB__(v84, v83);
              uint64_t v76 = v84 - v83;
              char v77 = v65;
              goto LABEL_122;
            }
            uint64_t v56 = *((void *)v14 + 4);
            uint64_t v55 = *((void *)v14 + 5);
            BOOL v65 = __OFSUB__(v55, v56);
            uint64_t v57 = v55 - v56;
            char v58 = v65;
          }
          if (v58) {
            goto LABEL_163;
          }
          unint64_t v66 = v15 - 2;
          uint64_t v72 = &v52[16 * v15 - 32];
          uint64_t v74 = *(void *)v72;
          uint64_t v73 = *((void *)v72 + 1);
          BOOL v75 = __OFSUB__(v73, v74);
          uint64_t v76 = v73 - v74;
          char v77 = v75;
          if (v75) {
            goto LABEL_166;
          }
          uint64_t v78 = &v52[16 * v54];
          uint64_t v80 = *(void *)v78;
          uint64_t v79 = *((void *)v78 + 1);
          BOOL v65 = __OFSUB__(v79, v80);
          uint64_t v81 = v79 - v80;
          if (v65) {
            goto LABEL_169;
          }
          if (__OFADD__(v76, v81)) {
            goto LABEL_170;
          }
          if (v76 + v81 >= v57)
          {
            BOOL v82 = v57 < v81;
LABEL_128:
            if (v82) {
              unint64_t v54 = v66;
            }
            goto LABEL_130;
          }
LABEL_122:
          if (v77) {
            goto LABEL_165;
          }
          v85 = &v52[16 * v54];
          uint64_t v87 = *(void *)v85;
          uint64_t v86 = *((void *)v85 + 1);
          BOOL v65 = __OFSUB__(v86, v87);
          uint64_t v88 = v86 - v87;
          if (v65) {
            goto LABEL_168;
          }
          if (v88 < v76) {
            goto LABEL_15;
          }
LABEL_130:
          unint64_t v93 = v54 - 1;
          if (v54 - 1 >= v15)
          {
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
            __break(1u);
LABEL_163:
            __break(1u);
LABEL_164:
            __break(1u);
LABEL_165:
            __break(1u);
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
LABEL_168:
            __break(1u);
LABEL_169:
            __break(1u);
LABEL_170:
            __break(1u);
LABEL_171:
            __break(1u);
LABEL_172:
            __break(1u);
LABEL_173:
            __break(1u);
LABEL_174:
            __break(1u);
LABEL_175:
            __break(1u);
LABEL_176:
            __break(1u);
LABEL_177:
            __break(1u);
LABEL_178:
            __break(1u);
LABEL_179:
            __break(1u);
LABEL_180:
            __break(1u);
            goto LABEL_181;
          }
          if (!v13) {
            goto LABEL_183;
          }
          uint64_t v94 = v14;
          uint64_t v95 = v13;
          char v96 = &v52[16 * v93];
          uint64_t v97 = *(void *)v96;
          uint64_t v98 = &v52[16 * v54];
          uint64_t v99 = *((void *)v98 + 1);
          sub_25286BE40((char *)(v95 + 24 * *(void *)v96), (char *)(v95 + 24 * *(void *)v98), (char *)(v95 + 24 * v99), __dst);
          if (v117) {
            goto LABEL_141;
          }
          if (v99 < v97) {
            goto LABEL_158;
          }
          if (v54 > *((void *)v94 + 2)) {
            goto LABEL_159;
          }
          *(void *)char v96 = v97;
          *(void *)&v52[16 * v93 + 8] = v99;
          unint64_t v100 = *((void *)v94 + 2);
          if (v54 >= v100) {
            goto LABEL_160;
          }
          uint64_t v14 = v94;
          unint64_t v15 = v100 - 1;
          memmove(&v52[16 * v54], v98 + 16, 16 * (v100 - 1 - v54));
          *((void *)v94 + 2) = v100 - 1;
          BOOL v21 = v100 > 2;
          uint64_t v13 = v115;
          if (!v21) {
            goto LABEL_15;
          }
        }
      }
      unint64_t v15 = 1;
      uint64_t v13 = v115;
LABEL_15:
      uint64_t v6 = v114;
      if (v12 >= v114)
      {
        uint64_t v4 = v117;
        uint64_t v11 = v112;
        goto LABEL_144;
      }
      continue;
    }
    break;
  }
LABEL_181:
  __break(1u);
LABEL_182:
  __break(1u);
LABEL_183:
  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  uint64_t result = sub_252898340();
  __break(1u);
  return result;
}

uint64_t sub_25286B4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void), uint64_t (*a8)(void))
{
  int v45 = a8;
  BOOL v46 = a4;
  uint64_t v39 = a6;
  uint64_t v40 = a7;
  uint64_t v38 = a1;
  uint64_t v43 = a5(0);
  uint64_t v10 = MEMORY[0x270FA5388](v43);
  uint64_t v44 = (uint64_t)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v36 - v13;
  uint64_t result = MEMORY[0x270FA5388](v12);
  unint64_t v18 = (char *)&v36 - v17;
  uint64_t v42 = a3;
  uint64_t v37 = a2;
  if (a3 != a2)
  {
    uint64_t v19 = *(void *)(v16 + 72);
    uint64_t v47 = v19 * (v42 - 1);
    uint64_t v41 = v19;
    uint64_t v20 = v19 * v42;
LABEL_6:
    uint64_t v22 = 0;
    uint64_t v23 = v38;
    while (1)
    {
      uint64_t v24 = *v46;
      unint64_t v25 = v39;
      sub_252870250(v20 + v22 + *v46, (uint64_t)v18, v39);
      sub_252870250(v47 + v22 + v24, (uint64_t)v14, v25);
      uint64_t v26 = *(int *)(v43 + 24);
      uint64_t v27 = *(int *)(type metadata accessor for TileElementInfo() + 20);
      uint64_t v28 = *(void *)&v18[v26 + v27];
      uint64_t v29 = *(void *)&v18[v26 + 8 + v27];
      uint64_t v30 = &v14[v26 + v27];
      if (v28 == *(void *)v30 && v29 == *((void *)v30 + 1))
      {
        BOOL v21 = v40;
        sub_2528712B8((uint64_t)v14, v40);
        uint64_t result = sub_2528712B8((uint64_t)v18, v21);
LABEL_5:
        v47 += v41;
        v20 += v41;
        if (++v42 == v37) {
          return result;
        }
        goto LABEL_6;
      }
      char v32 = sub_2528984C0();
      uint64_t v33 = v40;
      sub_2528712B8((uint64_t)v14, v40);
      uint64_t result = sub_2528712B8((uint64_t)v18, v33);
      if ((v32 & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v34 = *v46;
      if (!*v46) {
        break;
      }
      uint64_t v35 = v34 + v47 + v22;
      sub_25287137C(v34 + v20 + v22, v44, v45);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = sub_25287137C(v44, v35, v45);
      v22 -= v41;
      if (v42 == ++v23) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_25286B76C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 24 * a3 - 24;
LABEL_5:
    uint64_t v9 = *(void *)(v7 + 24 * v4 + 8);
    uint64_t v10 = v6;
    uint64_t v11 = v8;
    while (1)
    {
      unint64_t v12 = *(void *)(v11 + 8);
      if (v9)
      {
        if (v9 == 1) {
          goto LABEL_4;
        }
        if (v12 >= 2)
        {
          sub_2528710F0();
          uint64_t result = sub_252898120();
          if (result != -1) {
            goto LABEL_4;
          }
          goto LABEL_20;
        }
        int v13 = 0;
      }
      else
      {
        int v13 = 1;
      }
      if (v12 == 1) {
        int v13 = 1;
      }
      if (v12) {
        BOOL v14 = v13 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
LABEL_4:
        ++v4;
        v8 += 24;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
LABEL_20:
      if (!v7)
      {
        __break(1u);
        return result;
      }
      uint64_t v9 = *(void *)(v11 + 32);
      uint64_t v15 = *(void *)(v11 + 40);
      uint64_t v17 = *(void *)(v11 + 16);
      uint64_t v16 = *(void *)(v11 + 24);
      *(_OWORD *)(v11 + 24) = *(_OWORD *)v11;
      *(void *)(v11 + 40) = v17;
      *(void *)uint64_t v11 = v16;
      *(void *)(v11 + 8) = v9;
      *(void *)(v11 + 16) = v15;
      v11 -= 24;
      if (v4 == ++v10) {
        goto LABEL_4;
      }
    }
  }
  return result;
}

uint64_t sub_25286B8B0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void), uint64_t (*a8)(void))
{
  uint64_t v64 = a8;
  uint64_t v68 = a6;
  uint64_t v69 = a7;
  uint64_t v70 = a5(0);
  uint64_t v12 = MEMORY[0x270FA5388](v70);
  uint64_t v67 = (uint64_t)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v66 = (uint64_t)&v63 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v63 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v63 - v19;
  uint64_t v22 = *(void *)(v21 + 72);
  if (!v22)
  {
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  unint64_t v23 = a1;
  if (a2 - a1 == 0x8000000000000000 && v22 == -1) {
    goto LABEL_72;
  }
  int64_t v24 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v22 == -1) {
    goto LABEL_73;
  }
  uint64_t v25 = (uint64_t)(a2 - a1) / v22;
  unint64_t v73 = a1;
  unint64_t v72 = a4;
  uint64_t v26 = v24 / v22;
  if (v25 >= v24 / v22)
  {
    if ((v26 & 0x8000000000000000) == 0)
    {
      unint64_t v65 = a1;
      uint64_t v28 = v26 * v22;
      if (a4 < a2 || a2 + v28 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v44 = a4 + v28;
      unint64_t v71 = a4 + v28;
      unint64_t v73 = a2;
      if (v28 >= 1 && v65 < a2)
      {
        uint64_t v46 = -v22;
        uint64_t v47 = v67;
        do
        {
          uint64_t v48 = v66;
          uint64_t v49 = v68;
          sub_252870250(v44 + v46, v66, v68);
          unint64_t v50 = a2 + v46;
          sub_252870250(a2 + v46, v47, v49);
          uint64_t v51 = *(int *)(v70 + 24);
          uint64_t v52 = v48 + v51;
          uint64_t v53 = *(int *)(type metadata accessor for TileElementInfo() + 20);
          uint64_t v54 = *(void *)(v52 + v53);
          uint64_t v55 = *(void *)(v52 + v53 + 8);
          uint64_t v56 = (void *)(v47 + v51 + v53);
          if (v54 == *v56 && v55 == v56[1]) {
            char v58 = 0;
          }
          else {
            char v58 = sub_2528984C0();
          }
          unint64_t v59 = a3 + v46;
          uint64_t v60 = v69;
          sub_2528712B8(v67, v69);
          sub_2528712B8(v66, v60);
          if (v58)
          {
            if (a3 < a2 || v59 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v73 += v46;
          }
          else
          {
            unint64_t v61 = v71;
            v71 += v46;
            if (a3 < v61 || v59 >= v61)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v61)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            unint64_t v50 = a2;
          }
          unint64_t v44 = v71;
          if (v71 <= a4) {
            break;
          }
          a2 = v50;
          a3 += v46;
        }
        while (v50 > v65);
      }
LABEL_70:
      sub_25286C388(&v73, &v72, (uint64_t *)&v71, v64);
      return 1;
    }
  }
  else if ((v25 & 0x8000000000000000) == 0)
  {
    uint64_t v27 = v25 * v22;
    if (a4 < v23 || v23 + v27 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != v23)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v29 = a4 + v27;
    unint64_t v71 = a4 + v27;
    if (v27 >= 1 && a2 < a3)
    {
      while (1)
      {
        uint64_t v31 = v68;
        sub_252870250(a2, (uint64_t)v20, v68);
        sub_252870250(a4, (uint64_t)v18, v31);
        uint64_t v32 = *(int *)(v70 + 24);
        uint64_t v33 = *(int *)(type metadata accessor for TileElementInfo() + 20);
        uint64_t v34 = *(void *)&v20[v32 + v33];
        uint64_t v35 = *(void *)&v20[v32 + 8 + v33];
        uint64_t v36 = &v18[v32 + v33];
        if (v34 == *(void *)v36 && v35 == *((void *)v36 + 1)) {
          break;
        }
        char v38 = sub_2528984C0();
        uint64_t v39 = v69;
        sub_2528712B8((uint64_t)v18, v69);
        sub_2528712B8((uint64_t)v20, v39);
        if ((v38 & 1) == 0) {
          goto LABEL_32;
        }
        unint64_t v40 = v73;
        unint64_t v41 = a2 + v22;
        if (v73 < a2 || v73 >= v41)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v73 == a2)
        {
          unint64_t v40 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_38:
        unint64_t v73 = v40 + v22;
        a4 = v72;
        if (v72 < v29)
        {
          a2 = v41;
          if (v41 < a3) {
            continue;
          }
        }
        goto LABEL_70;
      }
      uint64_t v42 = v69;
      sub_2528712B8((uint64_t)v18, v69);
      sub_2528712B8((uint64_t)v20, v42);
LABEL_32:
      unint64_t v40 = v73;
      unint64_t v43 = v72 + v22;
      if (v73 < v72 || v73 >= v43)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (v73 != v72)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      unint64_t v72 = v43;
      unint64_t v41 = a2;
      goto LABEL_38;
    }
    goto LABEL_70;
  }
LABEL_74:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_25286BE40(char *__src, char *a2, char *a3, char *__dst)
{
  uint64_t v4 = __dst;
  size_t v5 = a3;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 24;
  uint64_t v10 = a3 - a2;
  uint64_t v11 = (a3 - a2) / 24;
  uint64_t v34 = __src;
  uint64_t v33 = __dst;
  if (v9 >= v11)
  {
    if (v10 < -23) {
      goto LABEL_63;
    }
    if (__dst != a2 || &a2[24 * v11] <= __dst) {
      memmove(__dst, a2, 24 * v11);
    }
    uint64_t v20 = &v4[24 * v11];
    uint64_t v32 = v20;
    uint64_t v34 = v6;
    if (v7 >= v6 || v10 < 24)
    {
LABEL_62:
      sub_25286C4CC((void **)&v34, (const void **)&v33, &v32);
      return 1;
    }
    uint64_t v21 = v6;
    while (1)
    {
      uint64_t v22 = *((void *)v20 - 2);
      unint64_t v23 = *((void *)v21 - 2);
      v21 -= 24;
      if (v22)
      {
        if (v22 == 1)
        {
          unint64_t v24 = (unint64_t)(v5 - 24);
LABEL_56:
          uint64_t v32 = v20 - 24;
          if (v5 < v20 || v24 >= (unint64_t)v20 || v5 != v20)
          {
            long long v30 = *(_OWORD *)(v20 - 24);
            *(void *)(v24 + 16) = *((void *)v20 - 1);
            *(_OWORD *)unint64_t v24 = v30;
          }
          uint64_t v21 = v6;
          v20 -= 24;
          if (v6 <= v7) {
            goto LABEL_62;
          }
          goto LABEL_61;
        }
        if (v23 >= 2)
        {
          sub_2528710F0();
          uint64_t v29 = sub_252898120();
          unint64_t v24 = (unint64_t)(v5 - 24);
          if (v29 != -1) {
            goto LABEL_56;
          }
          goto LABEL_50;
        }
        int v25 = 0;
      }
      else
      {
        int v25 = 1;
      }
      if (v23 == 1) {
        int v26 = 1;
      }
      else {
        int v26 = v25;
      }
      unint64_t v24 = (unint64_t)(v5 - 24);
      if (v23) {
        BOOL v27 = v26 == 0;
      }
      else {
        BOOL v27 = 1;
      }
      if (v27) {
        goto LABEL_56;
      }
LABEL_50:
      if (v5 != v6 || v24 >= (unint64_t)v6)
      {
        long long v28 = *(_OWORD *)v21;
        *(void *)(v24 + 16) = *((void *)v21 + 2);
        *(_OWORD *)unint64_t v24 = v28;
      }
      uint64_t v34 = v21;
      if (v21 <= v7) {
        goto LABEL_62;
      }
LABEL_61:
      uint64_t v6 = v21;
      size_t v5 = (char *)v24;
      if (v20 <= v4) {
        goto LABEL_62;
      }
    }
  }
  if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst) {
      memmove(__dst, __src, 24 * v9);
    }
    uint64_t v12 = &v4[24 * v9];
    uint64_t v32 = v12;
    if (v6 < v5 && v8 >= 24)
    {
      while (1)
      {
        uint64_t v13 = *((void *)v6 + 1);
        unint64_t v14 = *((void *)v4 + 1);
        if (v13)
        {
          if (v13 == 1) {
            goto LABEL_24;
          }
          if (v14 >= 2)
          {
            sub_2528710F0();
            if (sub_252898120() != -1) {
              goto LABEL_24;
            }
            goto LABEL_19;
          }
          int v15 = 0;
        }
        else
        {
          int v15 = 1;
        }
        if (v14 == 1) {
          int v15 = 1;
        }
        if (v14) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16)
        {
LABEL_24:
          if (v7 != v4)
          {
            long long v19 = *(_OWORD *)v4;
            *((void *)v7 + 2) = *((void *)v4 + 2);
            *(_OWORD *)uint64_t v7 = v19;
          }
          v4 += 24;
          uint64_t v33 = v4;
          uint64_t v17 = v6;
          goto LABEL_27;
        }
LABEL_19:
        uint64_t v17 = v6 + 24;
        if (v7 < v6 || v7 >= v17 || v7 != v6)
        {
          long long v18 = *(_OWORD *)v6;
          *((void *)v7 + 2) = *((void *)v6 + 2);
          *(_OWORD *)uint64_t v7 = v18;
        }
LABEL_27:
        v7 += 24;
        if (v4 < v12)
        {
          uint64_t v6 = v17;
          if (v17 < v5) {
            continue;
          }
        }
        uint64_t v34 = v7;
        goto LABEL_62;
      }
    }
    goto LABEL_62;
  }
LABEL_63:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

char *sub_25286C1D0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA38);
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
  unint64_t v14 = a4 + 32;
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

char *sub_25286C2CC(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_252898390();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

uint64_t sub_25286C388(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  unint64_t v4 = *a1;
  unint64_t v5 = *a2;
  uint64_t v6 = *a3;
  uint64_t result = a4(0);
  uint64_t v8 = *(void *)(*(void *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000 && v8 == -1) {
    goto LABEL_18;
  }
  if (v9 / v8 < 0)
  {
LABEL_19:
    uint64_t result = sub_252898390();
    __break(1u);
    return result;
  }
  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v4 != v5)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_25286C4CC(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -24)
  {
    uint64_t result = (char *)sub_252898390();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
    {
      return (char *)memmove(result, v3, 24 * v6);
    }
  }
  return result;
}

char *sub_25286C59C(uint64_t a1)
{
  return sub_25286C1D0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25286C5B0(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v40 = a2;
  uint64_t v7 = sub_252898370();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_42;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v39 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  uint64_t v37 = v3;
  int64_t v38 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = sub_2528974E0();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v18 = v17 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v19 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }
    if (v19 >= v38) {
      break;
    }
    uint64_t v20 = (void *)(v6 + 64);
    unint64_t v21 = *(void *)(v39 + 8 * v19);
    ++v14;
    if (!v21)
    {
      int64_t v14 = v19 + 1;
      if (v19 + 1 >= v38) {
        goto LABEL_35;
      }
      unint64_t v21 = *(void *)(v39 + 8 * v14);
      if (!v21)
      {
        int64_t v22 = v19 + 2;
        if (v22 >= v38)
        {
LABEL_35:
          sub_2528975E0();
          uint64_t v4 = v37;
          if ((v40 & 1) == 0) {
            goto LABEL_42;
          }
          goto LABEL_38;
        }
        unint64_t v21 = *(void *)(v39 + 8 * v22);
        if (!v21)
        {
          while (1)
          {
            int64_t v14 = v22 + 1;
            if (__OFADD__(v22, 1)) {
              goto LABEL_44;
            }
            if (v14 >= v38) {
              goto LABEL_35;
            }
            unint64_t v21 = *(void *)(v39 + 8 * v14);
            ++v22;
            if (v21) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v22;
      }
    }
LABEL_21:
    unint64_t v11 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_22:
    long long v23 = *(_OWORD *)(*(void *)(v6 + 48) + 16 * v18);
    unint64_t v24 = (uint64_t *)(*(void *)(v6 + 56) + 24 * v18);
    uint64_t v25 = *v24;
    unint64_t v26 = v24[1];
    uint64_t v27 = v24[2];
    long long v41 = v23;
    unint64_t v28 = *((void *)&v23 + 1);
    if ((v40 & 1) == 0)
    {
      sub_2528702B8(v23, *((unint64_t *)&v23 + 1));
      sub_2528702B8(v25, v26);
      sub_2528974D0();
    }
    sub_252898530();
    sub_252898540();
    if (v28 > 1) {
      sub_252897CE0();
    }
    uint64_t result = sub_252898560();
    uint64_t v29 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1 << v30) & ~*(void *)(v12 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v30) & ~*(void *)(v12 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v32 = 0;
      unint64_t v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        BOOL v34 = v31 == v33;
        if (v31 == v33) {
          unint64_t v31 = 0;
        }
        v32 |= v34;
        uint64_t v35 = *(void *)(v12 + 8 * v31);
      }
      while (v35 == -1);
      unint64_t v15 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_OWORD *)(*(void *)(v8 + 48) + 16 * v15) = v41;
    BOOL v16 = (uint64_t *)(*(void *)(v8 + 56) + 24 * v15);
    *BOOL v16 = v25;
    v16[1] = v26;
    v16[2] = v27;
    ++*(void *)(v8 + 16);
  }
  sub_2528975E0();
  uint64_t v4 = v37;
  uint64_t v20 = (void *)(v6 + 64);
  if ((v40 & 1) == 0) {
    goto LABEL_42;
  }
LABEL_38:
  uint64_t v36 = 1 << *(unsigned char *)(v6 + 32);
  if (v36 >= 64) {
    bzero(v20, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v20 = -1 << v36;
  }
  *(void *)(v6 + 16) = 0;
LABEL_42:
  uint64_t result = sub_2528975E0();
  *uint64_t v4 = v8;
  return result;
}

void *sub_25286C920(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_252898360();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)sub_2528975E0();
    *uint64_t v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v14) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v7 + 8 * v25);
    ++v10;
    if (!v26)
    {
      int64_t v10 = v25 + 1;
      if (v25 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v7 + 8 * v10);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v26 - 1) & v26;
    unint64_t v16 = __clz(__rbit64(v26)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = 24 * v16;
    int64_t v19 = (uint64_t *)(*(void *)(v3 + 56) + v18);
    uint64_t v20 = *v19;
    unint64_t v21 = v19[1];
    uint64_t v22 = v19[2];
    long long v23 = *(_OWORD *)(*(void *)(v3 + 48) + v17);
    *(_OWORD *)(*(void *)(v5 + 48) + v17) = v23;
    unint64_t v24 = (uint64_t *)(*(void *)(v5 + 56) + v18);
    uint64_t *v24 = v20;
    v24[1] = v21;
    v24[2] = v22;
    sub_2528702B8(v23, *((unint64_t *)&v23 + 1));
    sub_2528702B8(v20, v21);
    uint64_t result = (void *)sub_2528974D0();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v14) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v7 + 8 * v27);
  if (v26)
  {
    int64_t v10 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v7 + 8 * v10);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25286CAF8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    sub_2528974D0();
    uint64_t v7 = sub_252898350();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    sub_2528974D0();
    uint64_t v10 = sub_252898350();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_252860C78(&qword_269C2DAF0, &qword_269C2DAE8);
        sub_2528974D0();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAE8);
          uint64_t v12 = sub_25286CF50(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2528607F8();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_25286CD1C(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, uint64_t *a6, uint64_t (*a7)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14 = a3 >> 62;
  if (a3 >> 62)
  {
    sub_2528974D0();
    uint64_t v15 = sub_252898350();
    swift_bridgeObjectRelease();
    if (!v15) {
      return a3;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    sub_2528974D0();
    uint64_t v18 = sub_252898350();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        uint64_t v19 = sub_252860C78(a5, a6);
        sub_2528974D0();
        for (uint64_t i = 0; i != v15; ++i)
        {
          uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(a6);
          uint64_t v22 = (void (*)(unsigned char *, void))a7(v26, i, a3, v21, v19);
          uint64_t v24 = *v23;
          swift_unknownObjectRetain();
          v22(v26, 0);
          *(void *)(a1 + 8 * i) = v24;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v17 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(a4);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t (*sub_25286CF50(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25286D0D4(v6, a2, a3);
  return sub_25286CFB8;
}

uint64_t (*sub_25286CFBC(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25286D15C(v6, a2, a3);
  return sub_25286CFB8;
}

uint64_t (*sub_25286D024(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_25286D1DC(v6, a2, a3);
  return sub_25286CFB8;
}

void sub_25286D08C(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_25286D0D4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x2533BF180](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_25286D154;
  }
  __break(1u);
  return result;
}

void sub_25286D154(id *a1)
{
}

uint64_t (*sub_25286D15C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x2533BF180](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
LABEL_5:
    uint64_t *v3 = v4;
    return sub_252871554;
  }
  __break(1u);
  return result;
}

uint64_t (*sub_25286D1DC(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x2533BF180](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
LABEL_5:
    uint64_t *v3 = v4;
    return sub_25286D25C;
  }
  __break(1u);
  return result;
}

uint64_t sub_25286D25C()
{
  return swift_unknownObjectRelease();
}

uint64_t (*sub_25286D264(uint64_t a1, unint64_t a2, uint64_t a3))()
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(a3 + 16) > a2)
  {
    return nullsub_1;
  }
  __break(1u);
  return result;
}

uint64_t sub_25286D2A4(void *a1)
{
  return sub_252868E84(0, a1[2], 0, a1, &qword_269C2DB20, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25286D2E8(void *a1)
{
  return sub_25286930C(0, a1[2], 0, a1, &qword_269C2DB40, &qword_269C2DB48);
}

void sub_25286D320()
{
}

uint64_t sub_25286D334(void *a1)
{
  return sub_252868E84(0, a1[2], 0, a1, &qword_269C2DA40, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_25286D378(void *a1)
{
  return sub_25286930C(0, a1[2], 0, a1, &qword_269C2DA68, &qword_269C2DA70);
}

void *sub_25286D3B0(void *result, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v7 = ~(-1 << -(char)v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v11 = 0;
    uint64_t v9 = 0;
LABEL_39:
    *uint64_t result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (void *)v9;
  }
  uint64_t v9 = a3;
  if (!a3)
  {
    int64_t v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v10 = a2;
  uint64_t v23 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v24 = result;
  int64_t v11 = 0;
  uint64_t v12 = 0;
  int64_t v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  unint64_t v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    uint64_t v19 = (uint64_t *)(*(void *)(a4 + 56) + 24 * v15);
    uint64_t v20 = *v19;
    unint64_t v21 = v19[1];
    uint64_t v22 = v19[2];
    *uint64_t v10 = *v19;
    v10[1] = v21;
    v10[2] = v22;
    if (v12 == v9)
    {
      sub_2528702B8(v20, v21);
      sub_2528974D0();
      goto LABEL_38;
    }
    v10 += 3;
    sub_2528702B8(v20, v21);
    uint64_t result = (void *)sub_2528974D0();
    if (v8) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      break;
    }
    if (v16 >= v13) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        unint64_t v8 = 0;
        int64_t v11 = v16;
      }
      else
      {
        unint64_t v17 = *(void *)(v5 + 8 * v11);
        if (v17) {
          goto LABEL_14;
        }
        int64_t v18 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          int64_t v16 = v18;
          goto LABEL_18;
        }
        int64_t v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          unint64_t v17 = *(void *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            int64_t v16 = v11;
            goto LABEL_18;
          }
          int64_t v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            unint64_t v8 = 0;
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              int64_t v16 = v18 + 1;
              if (__OFADD__(v18, 1)) {
                goto LABEL_42;
              }
              if (v16 >= v13)
              {
                unint64_t v8 = 0;
                int64_t v11 = v13 - 1;
                goto LABEL_37;
              }
              unint64_t v17 = *(void *)(v5 + 8 * v16);
              ++v18;
              if (v17) {
                goto LABEL_18;
              }
            }
          }
          goto LABEL_17;
        }
        unint64_t v8 = 0;
        int64_t v11 = v16 + 2;
      }
LABEL_37:
      uint64_t v9 = v12;
LABEL_38:
      uint64_t v6 = v23;
      uint64_t result = v24;
      goto LABEL_39;
    }
LABEL_18:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_25286D5D0(uint64_t a1)
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

uint64_t *sub_25286D658(uint64_t *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    char v5 = (uint64_t *)(*(void *)(a5 + 48) + 16 * a2);
    uint64_t v6 = *v5;
    unint64_t v7 = v5[1];
    unint64_t v8 = (uint64_t *)(*(void *)(a5 + 56) + 24 * a2);
    uint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    uint64_t v11 = v8[2];
    *uint64_t result = *v8;
    result[1] = v10;
    result[2] = v11;
    sub_2528702B8(v6, v7);
    sub_2528702B8(v9, v10);
    sub_2528974D0();
    return (uint64_t *)v6;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_25286D714(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(void), void (*a5)(BOOL, unint64_t, uint64_t), uint64_t (*a6)(void))
{
  id v27 = a2;
  unint64_t v28 = a6;
  uint64_t v9 = type metadata accessor for HomeID();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a4(0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v24 - v14;
  unint64_t v16 = *(void *)(a1 + 16);
  uint64_t v17 = MEMORY[0x263F8EE78];
  if (v16)
  {
    uint64_t v29 = MEMORY[0x263F8EE78];
    a5(0, v16, 0);
    uint64_t v18 = *(void *)(type metadata accessor for TileElementInfo() - 8);
    uint64_t v19 = a1 + ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80));
    uint64_t v25 = *(void *)(v18 + 72);
    unint64_t v26 = a5;
    do
    {
      id v20 = objc_msgSend(v27, sel_uniqueIdentifier);
      sub_2528976A0();

      sub_252870250(v19, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for ElementID);
      sub_252870250((uint64_t)v11, (uint64_t)&v15[*(int *)(v12 + 20)], (uint64_t (*)(void))type metadata accessor for HomeID);
      sub_252870250(v19, (uint64_t)&v15[*(int *)(v12 + 24)], (uint64_t (*)(void))type metadata accessor for TileElementInfo);
      sub_2528712B8((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for HomeID);
      uint64_t v17 = v29;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        a5(0, *(void *)(v17 + 16) + 1, 1);
        uint64_t v17 = v29;
      }
      unint64_t v22 = *(void *)(v17 + 16);
      unint64_t v21 = *(void *)(v17 + 24);
      if (v22 >= v21 >> 1)
      {
        v26(v21 > 1, v22 + 1, 1);
        uint64_t v17 = v29;
      }
      *(void *)(v17 + 16) = v22 + 1;
      sub_25287137C((uint64_t)v15, v17+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(void *)(v13 + 72) * v22, v28);
      a5 = v26;
      v19 += v25;
      --v16;
    }
    while (v16);
  }
  return v17;
}

uint64_t sub_25286DA08(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ElementID();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v28 = (uint64_t)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v24 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v24 - v12;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v32 = MEMORY[0x263F8EE78];
  uint64_t v31 = *(void *)(a1 + 16);
  if (v31)
  {
    uint64_t v24 = v2;
    uint64_t v15 = 0;
    unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v17 = *(void *)(v11 + 72);
    uint64_t v30 = a1 + v16;
    unint64_t v25 = v16;
    uint64_t v29 = a2 + v16;
    uint64_t v26 = a2;
    uint64_t v27 = MEMORY[0x263F8EE78];
    do
    {
      sub_252870250(v30 + v17 * v15, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ElementID);
      uint64_t v18 = *(void *)(a2 + 16);
      if (v18)
      {
        sub_2528974D0();
        uint64_t v19 = v29;
        while (1)
        {
          sub_252870250(v19, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ElementID);
          if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0
            && qword_252899130[v10[*(int *)(v5 + 20)]] == qword_252899130[v13[*(int *)(v5 + 20)]])
          {
            break;
          }
          sub_2528712B8((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ElementID);
          v19 += v17;
          if (!--v18)
          {
            swift_bridgeObjectRelease();
            goto LABEL_4;
          }
        }
        sub_2528712B8((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for ElementID);
        swift_bridgeObjectRelease();
        sub_25287137C((uint64_t)v13, v28, (uint64_t (*)(void))type metadata accessor for ElementID);
        uint64_t v20 = v27;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_252868CF8(0, *(void *)(v20 + 16) + 1, 1);
        }
        uint64_t v21 = v32;
        unint64_t v23 = *(void *)(v32 + 16);
        unint64_t v22 = *(void *)(v32 + 24);
        if (v23 >= v22 >> 1)
        {
          sub_252868CF8(v22 > 1, v23 + 1, 1);
          uint64_t v21 = v32;
        }
        *(void *)(v21 + 16) = v23 + 1;
        uint64_t v27 = v21;
        sub_25287137C(v28, v21 + v25 + v23 * v17, (uint64_t (*)(void))type metadata accessor for ElementID);
        a2 = v26;
      }
      else
      {
LABEL_4:
        sub_2528712B8((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ElementID);
      }
      ++v15;
    }
    while (v15 != v31);
    return v32;
  }
  return result;
}

uint64_t sub_25286DD38(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for ElementID();
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  sub_2528974D0();
  for (; v9; uint64_t v9 = sub_252898350())
  {
    uint64_t v10 = 0;
    unint64_t v36 = a1 & 0xC000000000000001;
    unint64_t v27 = a1 + 32;
    uint64_t v28 = v9;
    uint64_t v29 = a2;
    unint64_t v30 = a1;
    while (1)
    {
      id v11 = v36 ? (id)MEMORY[0x2533BF180](v10, a1) : *(id *)(v27 + 8 * v10);
      uint64_t v12 = v11;
      if (__OFADD__(v10++, 1)) {
        break;
      }
      if (a2 && *(void *)(a2 + 16))
      {
        uint64_t v14 = sub_25287736C();
        sub_2528974D0();
        uint64_t v15 = sub_25286DA08(v14, a2);
        unint64_t v16 = v12;
        uint64_t v17 = v15;

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v18 = sub_25287736C();
        int64_t v19 = *(void *)(v18 + 16);
        if (v19)
        {
          id v32 = v12;
          uint64_t v33 = v10;
          uint64_t v34 = v3;
          uint64_t v37 = MEMORY[0x263F8EE78];
          uint64_t v35 = v18;
          sub_252868CF8(0, v19, 0);
          uint64_t v17 = v37;
          unint64_t v20 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
          uint64_t v21 = v35 + v20;
          uint64_t v22 = *(void *)(v31 + 72);
          do
          {
            sub_252870250(v21, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ElementID);
            uint64_t v37 = v17;
            unint64_t v24 = *(void *)(v17 + 16);
            unint64_t v23 = *(void *)(v17 + 24);
            if (v24 >= v23 >> 1)
            {
              sub_252868CF8(v23 > 1, v24 + 1, 1);
              uint64_t v17 = v37;
            }
            *(void *)(v17 + 16) = v24 + 1;
            sub_25287137C((uint64_t)v8, v17 + v20 + v24 * v22, (uint64_t (*)(void))type metadata accessor for ElementID);
            v21 += v22;
            --v19;
          }
          while (v19);

          swift_bridgeObjectRelease();
          uint64_t v10 = v33;
          uint64_t v3 = v34;
          a2 = v29;
          a1 = v30;
          uint64_t v9 = v28;
        }
        else
        {

          swift_bridgeObjectRelease();
          uint64_t v17 = MEMORY[0x263F8EE78];
        }
      }
      sub_2528678CC(v17);
      if (v10 == v9)
      {
        swift_bridgeObjectRelease();
        return v38;
      }
    }
    __break(1u);
LABEL_21:
    sub_2528974D0();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x263F8EE78];
}

uint64_t sub_25286E044(uint64_t a1, uint64_t a2)
{
  v2[8] = a1;
  v2[9] = a2;
  uint64_t v3 = sub_2528976E0();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = sub_252897E80();
  v2[14] = sub_252897E70();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[15] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25286E160;
  return sub_252859C00();
}

uint64_t sub_25286E160(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[16] = a1;
  v3[17] = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_252897E60();
  if (v1)
  {
    uint64_t v6 = sub_25286ECCC;
  }
  else
  {
    v3[18] = v4;
    v3[19] = v5;
    uint64_t v6 = sub_25286E2CC;
  }
  return MEMORY[0x270FA2498](v6, v4, v5);
}

uint64_t sub_25286E2CC()
{
  uint64_t v71 = v0;
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  unint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = (unint64_t *)(v0 + 64);
  uint64_t v3 = sub_252897B80();
  __swift_project_value_buffer(v3, (uint64_t)qword_269C2E278);
  sub_2528712A8(v2);
  sub_2528974D0();
  sub_2528712A8(v2);
  sub_2528974D0();
  uint64_t v4 = sub_252897B60();
  os_log_type_t v5 = sub_252897FD0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = *(void *)(v0 + 64);
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    uint64_t v68 = v65;
    *(_DWORD *)uint64_t v8 = 136315650;
    *(void *)(v0 + 40) = sub_252868708(0xD000000000000016, 0x800000025289BA90, &v68);
    sub_2528980D0();
    *(_WORD *)(v8 + 12) = 2080;
    if (v7)
    {
      if (v7 == 1)
      {
        unint64_t v9 = 0xE300000000000000;
        uint64_t v10 = 7105633;
      }
      else
      {
        unint64_t v11 = *(void *)(v0 + 64);
        uint64_t v69 = 0x3A796C6E6FLL;
        unint64_t v70 = 0xE500000000000000;
        type metadata accessor for HomeID();
        sub_252871448(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
        sub_2528974D0();
        sub_252897EE0();
        sub_252897CF0();
        swift_bridgeObjectRelease();
        sub_252870240(v11);
        uint64_t v10 = v69;
        unint64_t v9 = v70;
      }
    }
    else
    {
      uint64_t v10 = 0x746E6572727563;
      unint64_t v9 = 0xE700000000000000;
    }
    unint64_t v12 = *(void *)(v0 + 64);
    uint64_t v13 = *(void *)(v0 + 72);
    *(void *)(v0 + 48) = sub_252868708(v10, v9, &v68);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    sub_252870240(v12);
    sub_252870240(v12);
    *(_WORD *)(v8 + 22) = 2080;
    if (v13)
    {
      uint64_t v14 = type metadata accessor for ElementID();
      uint64_t v15 = sub_2528974D0();
      uint64_t v16 = MEMORY[0x2533BED00](v15, v14);
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = 7104878;
      unint64_t v18 = 0xE300000000000000;
    }
    *(void *)(v0 + 56) = sub_252868708(v16, v18, &v68);
    uint64_t v1 = (unint64_t *)(v0 + 64);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_252856000, v4, v5, "%s scope=%s ids=%s", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v65, -1, -1);
    MEMORY[0x2533BFA60](v8, -1, -1);
  }
  else
  {
    sub_252870240(v7);
    sub_252870240(v7);
    swift_bridgeObjectRelease_n();
  }
  unint64_t v19 = sub_252893024(*(void *)(v0 + 64));
  unint64_t v20 = v19;
  if (v19 >> 62)
  {
    sub_2528974D0();
    int64_t v21 = sub_252898350();
    swift_bridgeObjectRelease();
    if (v21 >= 1) {
      goto LABEL_16;
    }
  }
  else
  {
    int64_t v21 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v21 >= 1)
    {
LABEL_16:
      unint64_t v22 = *v1;
      sub_2528712A8(*v1);
      sub_2528974D0();
      sub_2528712A8(v22);
      sub_2528974D0();
      unint64_t v23 = sub_252897B60();
      os_log_type_t v24 = sub_252897FD0();
      if (os_log_type_enabled(v23, v24))
      {
        os_log_type_t v61 = v24;
        log = v23;
        uint64_t v64 = v1;
        uint64_t v25 = *(void *)(v0 + 88);
        uint64_t v26 = (_DWORD *)swift_slowAlloc();
        uint64_t v60 = swift_slowAlloc();
        uint64_t v68 = v60;
        uint64_t v62 = v26;
        *uint64_t v26 = 136315394;
        uint64_t v69 = MEMORY[0x263F8EE78];
        sub_252868D34(0, v21, 0);
        uint64_t v27 = 0;
        uint64_t v28 = v69;
        unint64_t v29 = v20 & 0xC000000000000001;
        unint64_t v66 = v20;
        do
        {
          if (v29) {
            id v30 = (id)MEMORY[0x2533BF180](v27, v20);
          }
          else {
            id v30 = *(id *)(v20 + 8 * v27 + 32);
          }
          uint64_t v31 = v30;
          id v32 = objc_msgSend(v30, sel_uniqueIdentifier, v60);
          sub_2528976A0();

          uint64_t v69 = v28;
          unint64_t v34 = *(void *)(v28 + 16);
          unint64_t v33 = *(void *)(v28 + 24);
          if (v34 >= v33 >> 1)
          {
            sub_252868D34(v33 > 1, v34 + 1, 1);
            uint64_t v28 = v69;
          }
          uint64_t v35 = *(void *)(v0 + 96);
          uint64_t v36 = *(void *)(v0 + 80);
          ++v27;
          *(void *)(v28 + 16) = v34 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 32))(v28+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v34, v35, v36);
          unint64_t v20 = v66;
        }
        while (v21 != v27);
        uint64_t v38 = *(void *)(v0 + 64);
        uint64_t v39 = MEMORY[0x2533BED00](v28, *(void *)(v0 + 80));
        unint64_t v41 = v40;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 24) = sub_252868708(v39, v41, &v68);
        sub_2528980D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *((_WORD *)v62 + 6) = 2080;
        if (v38 == 1)
        {
          uint64_t v44 = 7105633;
          unint64_t v43 = 0xE300000000000000;
          uint64_t v42 = v64;
        }
        else
        {
          uint64_t v42 = v64;
          if (v38)
          {
            unint64_t v45 = *v64;
            uint64_t v69 = 0x3A796C6E6FLL;
            unint64_t v70 = 0xE500000000000000;
            type metadata accessor for HomeID();
            sub_252871448(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
            sub_2528974D0();
            sub_252897EE0();
            sub_252897CF0();
            swift_bridgeObjectRelease();
            sub_252870240(v45);
            uint64_t v44 = v69;
            unint64_t v43 = v70;
          }
          else
          {
            unint64_t v43 = 0xE700000000000000;
            uint64_t v44 = 0x746E6572727563;
          }
        }
        unint64_t v46 = *v42;
        *(void *)(v0 + 32) = sub_252868708(v44, v43, &v68);
        sub_2528980D0();
        swift_bridgeObjectRelease();
        sub_252870240(v46);
        sub_252870240(v46);
        _os_log_impl(&dword_252856000, log, v61, "[HMHomeManager.orderedHomes] homes=%s using scope=%s", (uint8_t *)v62, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533BFA60](v60, -1, -1);
        MEMORY[0x2533BFA60](v62, -1, -1);

        unint64_t v20 = v66;
      }
      else
      {
        unint64_t v37 = *v1;
        swift_bridgeObjectRelease_n();
        sub_252870240(v37);
        sub_252870240(v37);
      }
      uint64_t v47 = *(void *)(v0 + 72);
      sub_2528974D0();
      uint64_t v48 = sub_25286DD38(v20, v47);
      *(void *)(v0 + 160) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2528974D0();
      uint64_t v49 = sub_252897B60();
      os_log_type_t v50 = sub_252897FD0();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v51 = 134217984;
        *(void *)(v0 + 16) = *(void *)(v48 + 16);
        sub_2528980D0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_252856000, v49, v50, "[findElements] Found %ld elements to show", v51, 0xCu);
        MEMORY[0x2533BFA60](v51, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      uint64_t v67 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2DB58 + dword_269C2DB58);
      uint64_t v52 = (void *)swift_task_alloc();
      *(void *)(v0 + 168) = v52;
      void *v52 = v0;
      v52[1] = sub_25286ED38;
      uint64_t v53 = *(void *)(v0 + 64);
      return v67(v48, v53);
    }
  }
  sub_2528975E0();
  swift_bridgeObjectRelease();
  uint64_t v55 = sub_252897B60();
  os_log_type_t v56 = sub_252897FB0();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    _os_log_impl(&dword_252856000, v55, v56, "HMHomeManager.orderedHomes is empty", v57, 2u);
    MEMORY[0x2533BFA60](v57, -1, -1);
  }

  swift_task_dealloc();
  char v58 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v59 = MEMORY[0x263F8EE78];
  return v58(v59);
}

uint64_t sub_25286ECCC()
{
  sub_2528975E0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25286ED38(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 176) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[18];
    uint64_t v6 = v4[19];
    unint64_t v7 = sub_25286EEE8;
  }
  else
  {
    v4[23] = a1;
    uint64_t v5 = v4[18];
    uint64_t v6 = v4[19];
    unint64_t v7 = sub_25286EE60;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_25286EE60()
{
  uint64_t v1 = (void *)v0[16];
  sub_2528975E0();
  swift_bridgeObjectRelease();

  uint64_t v2 = v0[23];
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_25286EEE8()
{
  uint64_t v1 = *(void **)(v0 + 128);
  sub_2528975E0();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_25286EF70()
{
  unint64_t result = qword_269C2D980;
  if (!qword_269C2D980)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C2D8A0);
    sub_252871448(&qword_26B22D6C0, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2D980);
  }
  return result;
}

unint64_t sub_25286F01C()
{
  unint64_t result = qword_26B22D7C0;
  if (!qword_26B22D7C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D7C0);
  }
  return result;
}

unint64_t sub_25286F074()
{
  unint64_t result = qword_26B22D7C8;
  if (!qword_26B22D7C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D7C8);
  }
  return result;
}

uint64_t sub_25286F0C8()
{
  return sub_252871448(qword_269C2D9A0, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

unint64_t sub_25286F114()
{
  unint64_t result = qword_26B22D7B8;
  if (!qword_26B22D7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D7B8);
  }
  return result;
}

uint64_t sub_25286F168()
{
  return sub_252871448((unint64_t *)&unk_26B22D710, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25286F1B0()
{
  return sub_252860C78(&qword_269C2D9B8, qword_269C2D9C0);
}

void *initializeBufferWithCopyOfBuffer for HomeXLTileEntityQuery(void *a1, void *a2)
{
  *a1 = *a2;
  sub_2528974E0();
  return a1;
}

uint64_t destroy for HomeXLTileEntityQuery()
{
  return sub_2528975E0();
}

void *assignWithCopy for HomeXLTileEntityQuery(void *a1, void *a2)
{
  *a1 = *a2;
  sub_2528974E0();
  sub_2528975E0();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for HomeXLTileEntityQuery(void *a1, void *a2)
{
  *a1 = *a2;
  sub_2528975E0();
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeXLTileEntityQuery(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HomeXLTileEntityQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 8) = 1;
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
    *(unsigned char *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeXLTileEntityQuery()
{
  return &type metadata for HomeXLTileEntityQuery;
}

uint64_t sub_25286F334(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_25286F490(uint64_t a1, uint64_t a2)
{
  v2[8] = a1;
  v2[9] = a2;
  uint64_t v3 = sub_2528976E0();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = sub_252897E80();
  v2[14] = sub_252897E70();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  uint64_t v4 = (void *)swift_task_alloc();
  v2[15] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25286F5AC;
  return sub_252859C00();
}

uint64_t sub_25286F5AC(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[16] = a1;
  v3[17] = v1;
  swift_task_dealloc();
  uint64_t v4 = sub_252897E60();
  if (v1)
  {
    uint64_t v6 = sub_252871548;
  }
  else
  {
    v3[18] = v4;
    v3[19] = v5;
    uint64_t v6 = sub_25286F718;
  }
  return MEMORY[0x270FA2498](v6, v4, v5);
}

uint64_t sub_25286F718()
{
  uint64_t v71 = v0;
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  unint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = (unint64_t *)(v0 + 64);
  uint64_t v3 = sub_252897B80();
  __swift_project_value_buffer(v3, (uint64_t)qword_269C2E278);
  sub_2528712A8(v2);
  sub_2528974D0();
  sub_2528712A8(v2);
  sub_2528974D0();
  uint64_t v4 = sub_252897B60();
  os_log_type_t v5 = sub_252897FD0();
  BOOL v6 = os_log_type_enabled(v4, v5);
  unint64_t v7 = *(void *)(v0 + 64);
  if (v6)
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    uint64_t v68 = v65;
    *(_DWORD *)uint64_t v8 = 136315650;
    *(void *)(v0 + 40) = sub_252868708(0xD000000000000016, 0x800000025289BA90, &v68);
    sub_2528980D0();
    *(_WORD *)(v8 + 12) = 2080;
    if (v7)
    {
      if (v7 == 1)
      {
        unint64_t v9 = 0xE300000000000000;
        uint64_t v10 = 7105633;
      }
      else
      {
        unint64_t v11 = *(void *)(v0 + 64);
        uint64_t v69 = 0x3A796C6E6FLL;
        unint64_t v70 = 0xE500000000000000;
        type metadata accessor for HomeID();
        sub_252871448(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
        sub_2528974D0();
        sub_252897EE0();
        sub_252897CF0();
        swift_bridgeObjectRelease();
        sub_252870240(v11);
        uint64_t v10 = v69;
        unint64_t v9 = v70;
      }
    }
    else
    {
      uint64_t v10 = 0x746E6572727563;
      unint64_t v9 = 0xE700000000000000;
    }
    unint64_t v12 = *(void *)(v0 + 64);
    uint64_t v13 = *(void *)(v0 + 72);
    *(void *)(v0 + 48) = sub_252868708(v10, v9, &v68);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    sub_252870240(v12);
    sub_252870240(v12);
    *(_WORD *)(v8 + 22) = 2080;
    if (v13)
    {
      uint64_t v14 = type metadata accessor for ElementID();
      uint64_t v15 = sub_2528974D0();
      uint64_t v16 = MEMORY[0x2533BED00](v15, v14);
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = 7104878;
      unint64_t v18 = 0xE300000000000000;
    }
    *(void *)(v0 + 56) = sub_252868708(v16, v18, &v68);
    uint64_t v1 = (unint64_t *)(v0 + 64);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_252856000, v4, v5, "%s scope=%s ids=%s", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v65, -1, -1);
    MEMORY[0x2533BFA60](v8, -1, -1);
  }
  else
  {
    sub_252870240(v7);
    sub_252870240(v7);
    swift_bridgeObjectRelease_n();
  }
  unint64_t v19 = sub_252893024(*(void *)(v0 + 64));
  unint64_t v20 = v19;
  if (v19 >> 62)
  {
    sub_2528974D0();
    int64_t v21 = sub_252898350();
    swift_bridgeObjectRelease();
    if (v21 >= 1) {
      goto LABEL_16;
    }
  }
  else
  {
    int64_t v21 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v21 >= 1)
    {
LABEL_16:
      unint64_t v22 = *v1;
      sub_2528712A8(*v1);
      sub_2528974D0();
      sub_2528712A8(v22);
      sub_2528974D0();
      unint64_t v23 = sub_252897B60();
      os_log_type_t v24 = sub_252897FD0();
      if (os_log_type_enabled(v23, v24))
      {
        os_log_type_t v61 = v24;
        log = v23;
        uint64_t v64 = v1;
        uint64_t v25 = *(void *)(v0 + 88);
        uint64_t v26 = (_DWORD *)swift_slowAlloc();
        uint64_t v60 = swift_slowAlloc();
        uint64_t v68 = v60;
        uint64_t v62 = v26;
        *uint64_t v26 = 136315394;
        uint64_t v69 = MEMORY[0x263F8EE78];
        sub_252868D34(0, v21, 0);
        uint64_t v27 = 0;
        uint64_t v28 = v69;
        unint64_t v29 = v20 & 0xC000000000000001;
        unint64_t v66 = v20;
        do
        {
          if (v29) {
            id v30 = (id)MEMORY[0x2533BF180](v27, v20);
          }
          else {
            id v30 = *(id *)(v20 + 8 * v27 + 32);
          }
          uint64_t v31 = v30;
          id v32 = objc_msgSend(v30, sel_uniqueIdentifier, v60);
          sub_2528976A0();

          uint64_t v69 = v28;
          unint64_t v34 = *(void *)(v28 + 16);
          unint64_t v33 = *(void *)(v28 + 24);
          if (v34 >= v33 >> 1)
          {
            sub_252868D34(v33 > 1, v34 + 1, 1);
            uint64_t v28 = v69;
          }
          uint64_t v35 = *(void *)(v0 + 96);
          uint64_t v36 = *(void *)(v0 + 80);
          ++v27;
          *(void *)(v28 + 16) = v34 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 32))(v28+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v34, v35, v36);
          unint64_t v20 = v66;
        }
        while (v21 != v27);
        uint64_t v38 = *(void *)(v0 + 64);
        uint64_t v39 = MEMORY[0x2533BED00](v28, *(void *)(v0 + 80));
        unint64_t v41 = v40;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 24) = sub_252868708(v39, v41, &v68);
        sub_2528980D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        *((_WORD *)v62 + 6) = 2080;
        if (v38 == 1)
        {
          uint64_t v44 = 7105633;
          unint64_t v43 = 0xE300000000000000;
          uint64_t v42 = v64;
        }
        else
        {
          uint64_t v42 = v64;
          if (v38)
          {
            unint64_t v45 = *v64;
            uint64_t v69 = 0x3A796C6E6FLL;
            unint64_t v70 = 0xE500000000000000;
            type metadata accessor for HomeID();
            sub_252871448(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
            sub_2528974D0();
            sub_252897EE0();
            sub_252897CF0();
            swift_bridgeObjectRelease();
            sub_252870240(v45);
            uint64_t v44 = v69;
            unint64_t v43 = v70;
          }
          else
          {
            unint64_t v43 = 0xE700000000000000;
            uint64_t v44 = 0x746E6572727563;
          }
        }
        unint64_t v46 = *v42;
        *(void *)(v0 + 32) = sub_252868708(v44, v43, &v68);
        sub_2528980D0();
        swift_bridgeObjectRelease();
        sub_252870240(v46);
        sub_252870240(v46);
        _os_log_impl(&dword_252856000, log, v61, "[HMHomeManager.orderedHomes] homes=%s using scope=%s", (uint8_t *)v62, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2533BFA60](v60, -1, -1);
        MEMORY[0x2533BFA60](v62, -1, -1);

        unint64_t v20 = v66;
      }
      else
      {
        unint64_t v37 = *v1;
        swift_bridgeObjectRelease_n();
        sub_252870240(v37);
        sub_252870240(v37);
      }
      uint64_t v47 = *(void *)(v0 + 72);
      sub_2528974D0();
      uint64_t v48 = sub_25286DD38(v20, v47);
      *(void *)(v0 + 160) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2528974D0();
      uint64_t v49 = sub_252897B60();
      os_log_type_t v50 = sub_252897FD0();
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v51 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v51 = 134217984;
        *(void *)(v0 + 16) = *(void *)(v48 + 16);
        sub_2528980D0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_252856000, v49, v50, "[findElements] Found %ld elements to show", v51, 0xCu);
        MEMORY[0x2533BFA60](v51, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      uint64_t v67 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2DA78 + dword_269C2DA78);
      uint64_t v52 = (void *)swift_task_alloc();
      *(void *)(v0 + 168) = v52;
      void *v52 = v0;
      v52[1] = sub_252870118;
      uint64_t v53 = *(void *)(v0 + 64);
      return v67(v48, v53);
    }
  }
  sub_2528975E0();
  swift_bridgeObjectRelease();
  uint64_t v55 = sub_252897B60();
  os_log_type_t v56 = sub_252897FB0();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    _os_log_impl(&dword_252856000, v55, v56, "HMHomeManager.orderedHomes is empty", v57, 2u);
    MEMORY[0x2533BFA60](v57, -1, -1);
  }

  swift_task_dealloc();
  char v58 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v59 = MEMORY[0x263F8EE78];
  return v58(v59);
}

uint64_t sub_252870118(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 176) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[18];
    uint64_t v6 = v4[19];
    unint64_t v7 = sub_252871550;
  }
  else
  {
    v4[23] = a1;
    uint64_t v5 = v4[18];
    uint64_t v6 = v4[19];
    unint64_t v7 = sub_25287154C;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

unint64_t sub_252870240(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_252870250(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2528702B8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return sub_2528974D0();
  }
  return result;
}

uint64_t sub_2528702CC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2528702E0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HomeID();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v27 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269C2DA20);
    uint64_t v10 = sub_252898240();
    uint64_t v11 = 0;
    uint64_t v12 = v10 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v28 = v9;
    uint64_t v29 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v3 + 72);
    while (1)
    {
      sub_252870250(v29 + v14 * v11, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for HomeID);
      sub_252898530();
      sub_2528976E0();
      sub_252871448((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
      sub_252897C20();
      uint64_t v16 = sub_252898560();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v10 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v12 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          sub_252870250(*(void *)(v10 + 48) + v18 * v14, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HomeID);
          char v22 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
          sub_2528712B8((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HomeID);
          if (v22) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v12 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        sub_2528712B8((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for HomeID);
        uint64_t v15 = v28;
      }
      else
      {
LABEL_8:
        uint64_t v15 = v28;
        *(void *)(v12 + 8 * v19) = v21 | v20;
        uint64_t result = sub_25287137C((uint64_t)v8, *(void *)(v10 + 48) + v18 * v14, (uint64_t (*)(void))type metadata accessor for HomeID);
        uint64_t v24 = *(void *)(v10 + 16);
        BOOL v25 = __OFADD__(v24, 1);
        uint64_t v26 = v24 + 1;
        if (v25)
        {
          __break(1u);
          return result;
        }
        *(void *)(v10 + 16) = v26;
      }
      if (++v11 == v15) {
        return v10;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void *sub_2528705A8(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA50);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v39 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v38 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_252897630();
  uint64_t v6 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v36 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_252897C80();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v31 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for HomeXLTileEntity();
  uint64_t v10 = *(void *)(v35 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v35);
  unint64_t v34 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v32 = (char *)v28 - v13;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DB30);
  uint64_t v40 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v41 = a1;
  swift_bridgeObjectRetain_n();
  sub_252869AF8(&v41);
  swift_bridgeObjectRelease();
  uint64_t v16 = v41;
  int64_t v17 = v41[2];
  if (v17)
  {
    unint64_t v41 = (void *)MEMORY[0x263F8EE78];
    sub_252868DAC(0, v17, 0);
    unint64_t v18 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v28[0] = v16;
    uint64_t v19 = (uint64_t)v16 + v18;
    uint64_t v20 = *(void *)(v10 + 72);
    uint64_t v29 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    uint64_t v30 = v20;
    v28[1] = v40 + 32;
    uint64_t v21 = (uint64_t)v32;
    uint64_t v22 = (uint64_t)v34;
    do
    {
      sub_252870250(v19, v21, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
      sub_252870250(v21, v22, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
      sub_252897C70();
      sub_252897C60();
      type metadata accessor for TileElementInfo();
      sub_2528974D0();
      sub_252897C50();
      swift_bridgeObjectRelease();
      sub_252897C60();
      sub_252897620();
      (*v29)(v38, 1, 1, v37);
      uint64_t v23 = sub_252897470();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v39, 1, 1, v23);
      sub_252871448((unint64_t *)&unk_26B22D710, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
      sub_252897320();
      sub_2528712B8(v21, (uint64_t (*)(void))type metadata accessor for HomeXLTileEntity);
      uint64_t v24 = v41;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_252868DAC(0, v24[2] + 1, 1);
        uint64_t v24 = v41;
      }
      unint64_t v26 = v24[2];
      unint64_t v25 = v24[3];
      if (v26 >= v25 >> 1)
      {
        sub_252868DAC(v25 > 1, v26 + 1, 1);
        uint64_t v24 = v41;
      }
      v24[2] = v26 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v40 + 32))((unint64_t)v24+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v26, v15, v33);
      v19 += v30;
      --v17;
    }
    while (v17);
    sub_2528975E0();
  }
  else
  {
    sub_2528975E0();
    return (void *)MEMORY[0x263F8EE78];
  }
  return v24;
}

void *sub_252870B4C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA50);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v39 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v38 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_252897630();
  uint64_t v6 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v36 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_252897C80();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v31 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for HomeSingleTileEntity();
  uint64_t v10 = *(void *)(v35 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v35);
  unint64_t v34 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  id v32 = (char *)v28 - v13;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA58);
  uint64_t v40 = *(void *)(v33 - 8);
  MEMORY[0x270FA5388](v33);
  uint64_t v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v41 = a1;
  swift_bridgeObjectRetain_n();
  sub_252869C18(&v41);
  swift_bridgeObjectRelease();
  uint64_t v16 = v41;
  int64_t v17 = v41[2];
  if (v17)
  {
    unint64_t v41 = (void *)MEMORY[0x263F8EE78];
    sub_252868E54(0, v17, 0);
    unint64_t v18 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v28[0] = v16;
    uint64_t v19 = (uint64_t)v16 + v18;
    uint64_t v20 = *(void *)(v10 + 72);
    uint64_t v29 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    uint64_t v30 = v20;
    v28[1] = v40 + 32;
    uint64_t v21 = (uint64_t)v32;
    uint64_t v22 = (uint64_t)v34;
    do
    {
      sub_252870250(v19, v21, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
      sub_252870250(v21, v22, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
      sub_252897C70();
      sub_252897C60();
      type metadata accessor for TileElementInfo();
      sub_2528974D0();
      sub_252897C50();
      swift_bridgeObjectRelease();
      sub_252897C60();
      sub_252897620();
      (*v29)(v38, 1, 1, v37);
      uint64_t v23 = sub_252897470();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v39, 1, 1, v23);
      sub_252871448((unint64_t *)&unk_26B22D768, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
      sub_252897320();
      sub_2528712B8(v21, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
      uint64_t v24 = v41;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_252868E54(0, v24[2] + 1, 1);
        uint64_t v24 = v41;
      }
      unint64_t v26 = v24[2];
      unint64_t v25 = v24[3];
      if (v26 >= v25 >> 1)
      {
        sub_252868E54(v25 > 1, v26 + 1, 1);
        uint64_t v24 = v41;
      }
      v24[2] = v26 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v40 + 32))((unint64_t)v24+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * v26, v15, v33);
      v19 += v30;
      --v17;
    }
    while (v17);
    sub_2528975E0();
  }
  else
  {
    sub_2528975E0();
    return (void *)MEMORY[0x263F8EE78];
  }
  return v24;
}

unint64_t sub_2528710F0()
{
  unint64_t result = qword_269C2DA10;
  if (!qword_269C2DA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DA10);
  }
  return result;
}

uint64_t sub_252871148(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a5) - 8);
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
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

uint64_t sub_2528712A0()
{
  return sub_2528975E0();
}

unint64_t sub_2528712A8(unint64_t result)
{
  if (result >= 2) {
    return sub_2528974D0();
  }
  return result;
}

uint64_t sub_2528712B8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_252871318(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25287137C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2528713E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_252871448(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return sub_2528975E0();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2528714E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t SelectedHomeEntityQuery.suggestedEntities()(uint64_t a1)
{
  v1[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  v1[3] = swift_task_alloc();
  uint64_t v2 = sub_252897AD0();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25287164C, 0, 0);
}

uint64_t sub_25287164C()
{
  if (qword_269C2D3F8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_252897B00();
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)qword_269C2E290);
  sub_252897AC0();
  uint64_t v6 = (uint64_t (*)(const char *, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269C2DBF8
                                                                                + dword_269C2DBF8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  void *v3 = v0;
  v3[1] = sub_252871760;
  uint64_t v4 = *(void *)(v0 + 48);
  return v6("SelectedHomeEntityQuery.AllHomes", 32, 2, v4, v2);
}

uint64_t sub_252871760(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[8] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[6];
  uint64_t v6 = v4[5];
  uint64_t v7 = v4[4];
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v8 = sub_25287471C;
  }
  else
  {
    v4[9] = a1;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v8 = sub_252874718;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t SelectedHomeEntityQuery.entities(for:)(uint64_t a1)
{
  v1[4] = a1;
  uint64_t v2 = type metadata accessor for HomeID();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D970);
  v1[8] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for SelectedHomeEntity();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  uint64_t v4 = sub_252897AD0();
  v1[13] = v4;
  v1[14] = *(void *)(v4 - 8);
  v1[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252871AA0, 0, 0);
}

uint64_t sub_252871AA0()
{
  if (qword_269C2D3F8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_252897B00();
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)qword_269C2E290);
  sub_252897AC0();
  uint64_t v6 = (uint64_t (*)(const char *, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269C2DBF8
                                                                                + dword_269C2DBF8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v3;
  void *v3 = v0;
  v3[1] = sub_252871BB4;
  uint64_t v4 = *(void *)(v0 + 120);
  return v6("SelectedHomeEntityQuery.AllHomes", 32, 2, v4, v2);
}

uint64_t sub_252871BB4(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 120);
  uint64_t v5 = *(void *)(*v2 + 112);
  uint64_t v6 = *(void *)(*v2 + 104);
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v1) {
    uint64_t v7 = sub_252871D28;
  }
  else {
    uint64_t v7 = sub_252871DBC;
  }
  return MEMORY[0x270FA2498](v7, 0, 0);
}

uint64_t sub_252871D28()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_252871DBC()
{
  unint64_t v45 = v0;
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[17];
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v44 = MEMORY[0x263F8EE78];
  uint64_t v4 = *(void *)(v2 + 16);
  sub_2528974D0();
  uint64_t v40 = v4;
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v0[10];
    uint64_t v7 = v0[6];
    uint64_t v42 = *(void *)(v6 + 72);
    unint64_t v35 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v39 = v2 + v35;
    uint64_t v8 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);
    uint64_t v37 = v7;
    uint64_t v9 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v36 = MEMORY[0x263F8EE78];
    uint64_t v38 = v1;
    do
    {
      sub_252874308(v39 + v5 * v42, v0[12], (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
      uint64_t v12 = *(void *)(v1 + 16);
      if (v12)
      {
        uint64_t v13 = v0[4] + ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80));
        sub_2528974D0();
        uint64_t v14 = *(void *)(v37 + 72);
        while (1)
        {
          uint64_t v15 = v0[8];
          uint64_t v16 = v0[5];
          sub_252874308(v13, v15, (uint64_t (*)(void))type metadata accessor for HomeID);
          uint64_t v10 = *v8;
          (*v8)(v15, 0, 1, v16);
          if ((*v9)(v15, 1, v16) == 1) {
            break;
          }
          uint64_t v17 = v0[7];
          sub_2528743D0(v0[8], v17, (uint64_t (*)(void))type metadata accessor for HomeID);
          char v18 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
          sub_252874370(v17, (uint64_t (*)(void))type metadata accessor for HomeID);
          if (v18)
          {
            uint64_t v20 = v0[11];
            uint64_t v19 = v0[12];
            swift_bridgeObjectRelease();
            sub_2528743D0(v19, v20, (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
            uint64_t v21 = v36;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_252868DDC(0, *(void *)(v36 + 16) + 1, 1);
              uint64_t v21 = v44;
            }
            uint64_t v1 = v38;
            unint64_t v23 = *(void *)(v21 + 16);
            unint64_t v22 = *(void *)(v21 + 24);
            if (v23 >= v22 >> 1)
            {
              sub_252868DDC(v22 > 1, v23 + 1, 1);
              uint64_t v21 = v44;
            }
            uint64_t v24 = v0[11];
            *(void *)(v21 + 16) = v23 + 1;
            uint64_t v36 = v21;
            sub_2528743D0(v24, v21 + v35 + v23 * v42, (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
            goto LABEL_6;
          }
          v13 += v14;
          if (!--v12) {
            goto LABEL_4;
          }
        }
      }
      else
      {
        uint64_t v10 = *v8;
        sub_2528974D0();
LABEL_4:
        v10(v0[8], 1, 1, v0[5]);
      }
      uint64_t v11 = v0[12];
      swift_bridgeObjectRelease();
      sub_252874370(v11, (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
      uint64_t v1 = v38;
LABEL_6:
      ++v5;
    }
    while (v5 != v40);
  }
  else
  {
    uint64_t v36 = v3;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_252897B80();
  __swift_project_value_buffer(v25, (uint64_t)qword_269C2E278);
  swift_bridgeObjectRetain_n();
  unint64_t v26 = sub_252897B60();
  os_log_type_t v27 = sub_252897FD0();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v41 = v0[9];
    uint64_t v28 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    uint64_t v44 = v43;
    *(_DWORD *)uint64_t v28 = 136315394;
    v0[2] = sub_252868708(0x7365697469746E65, 0xEE00293A726F6628, &v44);
    sub_2528980D0();
    *(_WORD *)(v28 + 12) = 2080;
    uint64_t v29 = sub_2528974D0();
    uint64_t v30 = MEMORY[0x2533BED00](v29, v41);
    unint64_t v32 = v31;
    sub_2528975E0();
    v0[3] = sub_252868708(v30, v32, &v44);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_252856000, v26, v27, "%s matched homes %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v43, -1, -1);
    MEMORY[0x2533BFA60](v28, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v33 = (uint64_t (*)(uint64_t))v0[1];
  return v33(v36);
}

uint64_t SelectedHomeEntityQuery.results()()
{
  uint64_t v1 = sub_252897AD0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2528723E4, 0, 0);
}

uint64_t sub_2528723E4()
{
  if (qword_269C2D3F8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_252897B00();
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)qword_269C2E290);
  sub_252897AC0();
  uint64_t v6 = (uint64_t (*)(const char *, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269C2DBF8
                                                                                + dword_269C2DBF8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v3;
  void *v3 = v0;
  v3[1] = sub_2528724F8;
  uint64_t v4 = *(void *)(v0 + 32);
  return v6("SelectedHomeEntityQuery.AllHomes", 32, 2, v4, v2);
}

uint64_t sub_2528724F8(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void **)v2;
  *(void *)(*(void *)v2 + 48) = v1;
  swift_task_dealloc();
  (*(void (**)(void, void))(v4[3] + 8))(v4[4], v4[2]);
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_2528726A8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(uint64_t))v5[1];
    return v6(a1);
  }
}

uint64_t sub_2528726A8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t SelectedHomeEntityQuery.defaultResult()(uint64_t a1)
{
  *(void *)(v1 + 40) = a1;
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 48) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_2528727B4;
  return sub_252859C00();
}

uint64_t sub_2528727B4(void *a1)
{
  uint64_t v4 = (void *)*v2;
  v4[7] = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_252872A70, 0, 0);
  }
  else
  {

    uint64_t v5 = (void *)swift_task_alloc();
    v4[8] = v5;
    *uint64_t v5 = v4;
    v5[1] = sub_25287293C;
    uint64_t v6 = v4[5];
    return static SelectedHomeEntity.selectedHome.getter(v6);
  }
}

uint64_t sub_25287293C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_252872E3C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_252872A70()
{
  uint64_t v21 = v0;
  uint64_t v1 = (void *)v0[7];
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897B80();
  __swift_project_value_buffer(v2, (uint64_t)qword_269C2E278);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_252897B60();
  os_log_type_t v6 = sub_252897FB0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v19;
    *(_DWORD *)uint64_t v7 = 136315394;
    v0[3] = sub_252868708(0x52746C7561666564, 0xEF2928746C757365, &v20);
    sub_2528980D0();
    *(_WORD *)(v7 + 12) = 2112;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v10;
    sub_2528980D0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_252856000, v5, v6, "%s Error loading HMHomeManager: %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D578);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v19, -1, -1);
    MEMORY[0x2533BFA60](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = sub_252897B60();
  os_log_type_t v12 = sub_252897FD0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v0[2] = sub_252868708(0x52746C7561666564, 0xEF2928746C757365, &v20);
    sub_2528980D0();
    _os_log_impl(&dword_252856000, v11, v12, "%s Returning nil", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v14, -1, -1);
    MEMORY[0x2533BFA60](v13, -1, -1);
  }

  uint64_t v15 = v0[5];
  uint64_t v16 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_252872E3C()
{
  uint64_t v21 = v0;
  uint64_t v1 = (void *)v0[9];
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897B80();
  __swift_project_value_buffer(v2, (uint64_t)qword_269C2E278);
  id v3 = v1;
  id v4 = v1;
  uint64_t v5 = sub_252897B60();
  os_log_type_t v6 = sub_252897FB0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v19;
    *(_DWORD *)uint64_t v7 = 136315394;
    v0[3] = sub_252868708(0x52746C7561666564, 0xEF2928746C757365, &v20);
    sub_2528980D0();
    *(_WORD *)(v7 + 12) = 2112;
    id v9 = v1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v10;
    sub_2528980D0();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_252856000, v5, v6, "%s Error loading HMHomeManager: %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D578);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v19, -1, -1);
    MEMORY[0x2533BFA60](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = sub_252897B60();
  os_log_type_t v12 = sub_252897FD0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v0[2] = sub_252868708(0x52746C7561666564, 0xEF2928746C757365, &v20);
    sub_2528980D0();
    _os_log_impl(&dword_252856000, v11, v12, "%s Returning nil", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v14, -1, -1);
    MEMORY[0x2533BFA60](v13, -1, -1);
  }

  uint64_t v15 = v0[5];
  uint64_t v16 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_252873208(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = type metadata accessor for SelectedHomeEntity();
  v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  type metadata accessor for IntentsService();
  swift_initStaticObject();
  id v3 = (void *)swift_task_alloc();
  v1[9] = v3;
  void *v3 = v1;
  v3[1] = sub_25287330C;
  return sub_252859C00();
}

uint64_t sub_25287330C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    os_log_type_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    return MEMORY[0x270FA2498](sub_252873460, 0, 0);
  }
}

uint64_t sub_252873460()
{
  uint64_t v45 = v0;
  uint64_t v1 = *(void **)(v0 + 80);
  id v2 = objc_msgSend(v1, sel_homes);
  unint64_t v41 = sub_2528607F8();
  uint64_t v3 = sub_252897DD0();

  sub_252897F80();
  uint64_t v4 = (void *)swift_task_alloc();
  *uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAE8);
  v4[1] = sub_252860C78(&qword_269C2DAF0, &qword_269C2DAE8);
  uint64_t v5 = sub_2528746C0(&qword_269C2DBD0, (void (*)(uint64_t))sub_2528607F8);
  uint64_t v6 = MEMORY[0x263F49228];
  v4[2] = v5;
  v4[3] = v6;
  uint64_t v7 = sub_2528746C0(&qword_269C2DBD8, (void (*)(uint64_t))sub_2528607F8);
  v4[4] = v7;
  v4[5] = sub_2528746C0(&qword_269C2DBE0, (void (*)(uint64_t))sub_2528607F8);
  uint64_t KeyPath = swift_getKeyPath();
  swift_task_dealloc();
  uint64_t v9 = swift_task_alloc();
  *(void *)(v9 + 16) = sub_252874708;
  *(void *)(v9 + 24) = KeyPath;
  *(void *)(v0 + 16) = v3;
  sub_252860C78(&qword_269C2DBE8, &qword_269C2DAE8);
  sub_2528974E0();
  uint64_t v38 = MEMORY[0x263F8D330];
  uint64_t v39 = v7;
  unint64_t v10 = sub_252897D80();
  swift_release_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_252897B80();
  __swift_project_value_buffer(v11, (uint64_t)qword_269C2E278);
  swift_bridgeObjectRetain_n();
  os_log_type_t v12 = sub_252897B60();
  os_log_type_t v13 = sub_252897FD0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v44 = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v0 + 24) = sub_252868708(0x69746E45656D6F68, 0xEE00292873656974, &v44);
    sub_2528980D0();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v16 = sub_2528974D0();
    uint64_t v17 = MEMORY[0x2533BED00](v16, v41);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 32) = sub_252868708(v17, v19, &v44);
    sub_2528980D0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_252856000, v12, v13, "%s found homes %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v15, -1, -1);
    MEMORY[0x2533BFA60](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  if (v10 >> 62)
  {
    sub_2528974D0();
    uint64_t v20 = sub_252898350();
    swift_bridgeObjectRelease();
    if (v20) {
      goto LABEL_8;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v24 = MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  uint64_t v20 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v20) {
    goto LABEL_18;
  }
LABEL_8:
  uint64_t v44 = MEMORY[0x263F8EE78];
  uint64_t result = sub_252868DDC(0, v20 & ~(v20 >> 63), 0);
  if (v20 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v22 = 0;
  uint64_t v23 = *(void *)(v0 + 56);
  uint64_t v42 = *(void *)(v0 + 48);
  unint64_t v43 = v10;
  unint64_t v40 = v10 & 0xC000000000000001;
  uint64_t v24 = v44;
  do
  {
    if (v40) {
      id v25 = (id)MEMORY[0x2533BF180](v22, v43);
    }
    else {
      id v25 = *(id *)(v43 + 8 * v22 + 32);
    }
    unint64_t v26 = v25;
    uint64_t v27 = *(void *)(v0 + 64);
    id v28 = objc_msgSend(v25, sel_uniqueIdentifier, v38, v39);
    sub_2528976A0();

    id v29 = objc_msgSend(v26, sel_name);
    uint64_t v30 = sub_252897CB0();
    uint64_t v32 = v31;

    uint64_t v33 = (uint64_t *)(v27 + *(int *)(v42 + 20));
    *uint64_t v33 = v30;
    v33[1] = v32;
    uint64_t v44 = v24;
    unint64_t v35 = *(void *)(v24 + 16);
    unint64_t v34 = *(void *)(v24 + 24);
    if (v35 >= v34 >> 1)
    {
      sub_252868DDC(v34 > 1, v35 + 1, 1);
      uint64_t v24 = v44;
    }
    uint64_t v36 = *(void *)(v0 + 64);
    ++v22;
    *(void *)(v24 + 16) = v35 + 1;
    sub_2528743D0(v36, v24+ ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80))+ *(void *)(v23 + 72) * v35, (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
  }
  while (v20 != v22);
  swift_bridgeObjectRelease();
LABEL_19:
  **(void **)(v0 + 40) = v24;
  swift_task_dealloc();
  uint64_t v37 = *(uint64_t (**)(void))(v0 + 8);
  return v37();
}

uint64_t sub_252873A9C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_252865674;
  return SelectedHomeEntityQuery.entities(for:)(a1);
}

uint64_t sub_252873B30(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25285CC38;
  return SelectedHomeEntityQuery.suggestedEntities()(a1);
}

uint64_t sub_252873BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_252874610();
  *uint64_t v5 = v2;
  v5[1] = sub_25285CC38;
  return MEMORY[0x270EE0E40](a1, a2, v6);
}

uint64_t sub_252873C7C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25285BC9C;
  return SelectedHomeEntityQuery.defaultResult()(a1);
}

uint64_t SelectedHomeEntityQuery.allEntities()(uint64_t a1)
{
  v1[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  v1[3] = swift_task_alloc();
  uint64_t v2 = sub_252897AD0();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252873E04, 0, 0);
}

uint64_t sub_252873E04()
{
  if (qword_269C2D3F8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_252897B00();
  uint64_t v2 = __swift_project_value_buffer(v1, (uint64_t)qword_269C2E290);
  sub_252897AC0();
  unint64_t v6 = (uint64_t (*)(const char *, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269C2DBF8
                                                                                + dword_269C2DBF8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  void *v3 = v0;
  v3[1] = sub_252873F18;
  uint64_t v4 = *(void *)(v0 + 48);
  return v6("SelectedHomeEntityQuery.AllHomes", 32, 2, v4, v2);
}

uint64_t sub_252873F18(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[8] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[6];
  uint64_t v6 = v4[5];
  uint64_t v7 = v4[4];
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v8 = sub_2528741FC;
  }
  else
  {
    v4[9] = a1;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v8 = sub_2528740A0;
  }
  return MEMORY[0x270FA2498](v8, 0, 0);
}

uint64_t sub_2528740A0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = sub_252897630();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  type metadata accessor for SelectedHomeEntity();
  sub_2528746C0(&qword_26B22D6C8, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
  sub_2528746C0(&qword_26B22D6C0, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
  sub_252897430();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2528741FC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25287426C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25285BC9C;
  return SelectedHomeEntityQuery.allEntities()(a1);
}

uint64_t sub_252874308(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_252874370(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2528743D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_25287443C()
{
  unint64_t result = qword_26B22D6A8;
  if (!qword_26B22D6A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D6A8);
  }
  return result;
}

unint64_t sub_252874494()
{
  unint64_t result = qword_26B22D6B0;
  if (!qword_26B22D6B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D6B0);
  }
  return result;
}

uint64_t sub_2528744E8()
{
  return sub_2528746C0((unint64_t *)&qword_269C2D8D8, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

unint64_t sub_252874534()
{
  unint64_t result = qword_26B22D6A0;
  if (!qword_26B22D6A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D6A0);
  }
  return result;
}

uint64_t sub_252874588()
{
  return sub_2528746C0(&qword_26B22D6C0, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_2528745D0()
{
  return sub_252860C78(&qword_269C2DB98, qword_269C2DBA0);
}

unint64_t sub_252874610()
{
  unint64_t result = qword_269C2DBB8;
  if (!qword_269C2DBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DBB8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SelectedHomeEntityQuery()
{
  return &type metadata for SelectedHomeEntityQuery;
}

uint64_t sub_252874678()
{
  return 48;
}

__n128 sub_252874684(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_2528746A0()
{
  return 48;
}

__n128 sub_2528746AC(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_2528746C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252874708()
{
  return sub_252894784();
}

uint64_t sub_252874710@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2528947BC(a1, *(uint64_t (**)(uint64_t *))(v2 + 16), a2);
}

uint64_t sub_252874720(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 48) = a4;
  *(void *)(v5 + 56) = a5;
  *(unsigned char *)(v5 + 160) = a3;
  *(void *)(v5 + 40) = a1;
  uint64_t v6 = sub_252897B10();
  *(void *)(v5 + 64) = v6;
  *(void *)(v5 + 72) = *(void *)(v6 - 8);
  *(void *)(v5 + 80) = swift_task_alloc();
  uint64_t v7 = sub_252897AD0();
  *(void *)(v5 + 88) = v7;
  *(void *)(v5 + 96) = *(void *)(v7 - 8);
  *(void *)(v5 + 104) = swift_task_alloc();
  *(void *)(v5 + 112) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252874854, 0, 0);
}

uint64_t sub_252874854()
{
  uint64_t v1 = sub_252897AF0();
  os_signpost_type_t v2 = sub_252897FF0();
  uint64_t result = sub_2528980B0();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v4 = *(const char **)(v0 + 40);
  if (*(unsigned char *)(v0 + 160))
  {
    if ((unint64_t)v4 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v4 >> 11 == 27)
      {
LABEL_16:
        __break(1u);
        return result;
      }
      if (v4 >> 16 <= 0x10)
      {
        uint64_t v4 = (const char *)(v0 + 16);
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_16;
  }
  if (v4)
  {
LABEL_10:
    uint64_t v8 = *(void *)(v0 + 112);
    uint64_t v9 = *(void *)(v0 + 88);
    uint64_t v10 = *(void *)(v0 + 96);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    unint64_t v7 = (v10 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v6(v8, *(void *)(v0 + 48), v9);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    os_signpost_id_t v12 = sub_252897AB0();
    _os_signpost_emit_with_name_impl(&dword_252856000, v1, v2, v12, v4, "", v11, 2u);
    MEMORY[0x2533BFA60](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    goto LABEL_11;
  }
  __break(1u);
LABEL_5:
  uint64_t v5 = *(void *)(v0 + 96);

  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  unint64_t v7 = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
LABEL_11:
  uint64_t v13 = *(void *)(v0 + 112);
  uint64_t v14 = *(void *)(v0 + 88);
  uint64_t v15 = *(void *)(v0 + 48);
  *(void *)(v0 + 120) = v6;
  *(void *)(v0 + 128) = v7;
  v6(v13, v15, v14);
  sub_252897B40();
  swift_allocObject();
  *(void *)(v0 + 136) = sub_252897B30();
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_252874A68;
  return sub_252873208(v0 + 32);
}

uint64_t sub_252874A68()
{
  *(void *)(*(void *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0) {
    os_signpost_type_t v2 = sub_252874DF4;
  }
  else {
    os_signpost_type_t v2 = sub_252874B7C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_252874B7C()
{
  uint64_t v1 = sub_252897AF0();
  sub_252897B20();
  os_signpost_type_t v2 = sub_252897FE0();
  uint64_t result = sub_2528980B0();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v4 = *(const char **)(v0 + 40);
  os_signpost_type_t v21 = v2;
  if (*(unsigned char *)(v0 + 160))
  {
    if ((unint64_t)v4 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v4 >> 11 == 27)
      {
LABEL_19:
        __break(1u);
        return result;
      }
      if (v4 >> 16 <= 0x10)
      {
        uint64_t v4 = (const char *)(v0 + 24);
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
  if (v4)
  {
LABEL_10:
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 80);
    uint64_t v10 = *(void *)(v0 + 64);
    sub_2528974E0();
    sub_252897B50();
    sub_2528975E0();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v9, v10) == *MEMORY[0x263F90238])
    {
      uint64_t v11 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
      uint64_t v11 = "";
    }
    uint64_t v12 = *(void *)(v0 + 112);
    uint64_t v13 = *(void *)(v0 + 96);
    uint64_t v14 = *(void *)(v0 + 104);
    uint64_t v15 = *(void *)(v0 + 88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 120))(v12, v14, v15);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    os_signpost_id_t v17 = sub_252897AB0();
    _os_signpost_emit_with_name_impl(&dword_252856000, v1, v21, v17, v4, v11, v16, 2u);
    MEMORY[0x2533BFA60](v16, -1, -1);

    unint64_t v18 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v18(v14, v15);
    sub_2528975E0();
    v18(v12, v15);
    goto LABEL_14;
  }
  __break(1u);
LABEL_5:
  uint64_t v6 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 104);
  uint64_t v7 = *(void *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  sub_2528975E0();
LABEL_14:
  uint64_t v19 = *(void *)(v0 + 32);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v20(v19);
}

uint64_t sub_252874DF4()
{
  sub_2528975E0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t OSSignposter.withInterval<A>(_:id:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v8 + 64) = a7;
  *(void *)(v8 + 72) = v7;
  *(void *)(v8 + 48) = a5;
  *(void *)(v8 + 56) = a6;
  *(unsigned char *)(v8 + 176) = a4;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  uint64_t v9 = sub_252897B10();
  *(void *)(v8 + 80) = v9;
  *(void *)(v8 + 88) = *(void *)(v9 - 8);
  *(void *)(v8 + 96) = swift_task_alloc();
  uint64_t v10 = sub_252897AD0();
  *(void *)(v8 + 104) = v10;
  *(void *)(v8 + 112) = *(void *)(v10 - 8);
  *(void *)(v8 + 120) = swift_task_alloc();
  *(void *)(v8 + 128) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252874FB8, 0, 0);
}

uint64_t sub_252874FB8()
{
  uint64_t v1 = sub_252897AF0();
  os_signpost_type_t v2 = sub_252897FF0();
  uint64_t result = sub_2528980B0();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v4 = *(const char **)(v0 + 40);
  if (*(unsigned char *)(v0 + 176))
  {
    if ((unint64_t)v4 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v4 >> 11 == 27)
      {
LABEL_16:
        __break(1u);
        return result;
      }
      if (v4 >> 16 <= 0x10)
      {
        uint64_t v4 = (const char *)(v0 + 24);
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_16;
  }
  if (v4)
  {
LABEL_10:
    uint64_t v8 = *(void *)(v0 + 128);
    uint64_t v9 = *(void *)(v0 + 104);
    uint64_t v10 = *(void *)(v0 + 112);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
    unint64_t v7 = (v10 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v6(v8, *(void *)(v0 + 48), v9);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    os_signpost_id_t v12 = sub_252897AB0();
    _os_signpost_emit_with_name_impl(&dword_252856000, v1, v2, v12, v4, "", v11, 2u);
    MEMORY[0x2533BFA60](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    goto LABEL_11;
  }
  __break(1u);
LABEL_5:
  uint64_t v5 = *(void *)(v0 + 112);

  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  unint64_t v7 = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
LABEL_11:
  uint64_t v13 = *(void *)(v0 + 128);
  uint64_t v14 = *(void *)(v0 + 104);
  uint64_t v15 = *(void *)(v0 + 48);
  uint64_t v16 = *(int **)(v0 + 56);
  *(void *)(v0 + 136) = v6;
  *(void *)(v0 + 144) = v7;
  v6(v13, v15, v14);
  sub_252897B40();
  swift_allocObject();
  *(void *)(v0 + 152) = sub_252897B30();
  uint64_t v19 = (uint64_t (*)(uint64_t))((char *)v16 + *v16);
  os_signpost_id_t v17 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v17;
  *os_signpost_id_t v17 = v0;
  v17[1] = sub_252875208;
  uint64_t v18 = *(void *)(v0 + 32);
  return v19(v18);
}

uint64_t sub_252875208()
{
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0) {
    os_signpost_type_t v2 = sub_25287558C;
  }
  else {
    os_signpost_type_t v2 = sub_25287531C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25287531C()
{
  uint64_t v1 = sub_252897AF0();
  sub_252897B20();
  os_signpost_type_t v2 = sub_252897FE0();
  uint64_t result = sub_2528980B0();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v4 = *(const char **)(v0 + 40);
  os_signpost_type_t v20 = v2;
  if (*(unsigned char *)(v0 + 176))
  {
    if ((unint64_t)v4 >> 32)
    {
      __break(1u);
    }
    else
    {
      if (v4 >> 11 == 27)
      {
LABEL_19:
        __break(1u);
        return result;
      }
      if (v4 >> 16 <= 0x10)
      {
        uint64_t v4 = (const char *)(v0 + 16);
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
  if (v4)
  {
LABEL_10:
    uint64_t v8 = *(void *)(v0 + 88);
    uint64_t v9 = *(void *)(v0 + 96);
    uint64_t v10 = *(void *)(v0 + 80);
    sub_2528974E0();
    sub_252897B50();
    sub_2528975E0();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v9, v10) == *MEMORY[0x263F90238])
    {
      uint64_t v11 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
      uint64_t v11 = "";
    }
    uint64_t v12 = *(void *)(v0 + 128);
    uint64_t v13 = *(void *)(v0 + 112);
    uint64_t v14 = *(void *)(v0 + 120);
    uint64_t v15 = *(void *)(v0 + 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136))(v12, v14, v15);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    os_signpost_id_t v17 = sub_252897AB0();
    _os_signpost_emit_with_name_impl(&dword_252856000, v1, v20, v17, v4, v11, v16, 2u);
    MEMORY[0x2533BFA60](v16, -1, -1);

    uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v18(v14, v15);
    sub_2528975E0();
    v18(v12, v15);
    goto LABEL_14;
  }
  __break(1u);
LABEL_5:
  uint64_t v6 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 120);
  uint64_t v7 = *(void *)(v0 + 104);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  sub_2528975E0();
LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_25287558C()
{
  sub_2528975E0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_252875618()
{
  uint64_t v0 = sub_252897B80();
  __swift_allocate_value_buffer(v0, qword_269C2E278);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C2E278);
  return sub_252897B70();
}

uint64_t sub_25287569C()
{
  uint64_t v0 = sub_252897B80();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_252897B00();
  __swift_allocate_value_buffer(v4, qword_269C2E290);
  __swift_project_value_buffer(v4, (uint64_t)qword_269C2E290);
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v0, (uint64_t)qword_269C2E278);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_252897AE0();
}

uint64_t sub_2528757D8(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_2528981C0();
    uint64_t result = MEMORY[0x263F8EE78];
    if (!v3) {
      return result;
    }
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_2528982E0();
    uint64_t v18 = sub_252898170();
    uint64_t v19 = v5;
    char v20 = 1;
    if ((v3 & 0x8000000000000000) == 0) {
      goto LABEL_9;
    }
    __break(1u);
  }
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_2528982E0();
    uint64_t v18 = sub_2528785DC(a1);
    uint64_t v19 = v6;
    char v20 = v7 & 1;
    while (1)
    {
LABEL_9:
      while (1)
      {
        int64_t v13 = v18;
        uint64_t v14 = v19;
        char v15 = v20;
        sub_252878364(v18, v19, v20, a1);
        sub_2528982B0();
        sub_2528982F0();
        sub_252898300();
        uint64_t result = sub_2528982C0();
        if (v2) {
          break;
        }
        int64_t v8 = sub_252878280(v13, v14, v15, a1);
        uint64_t v10 = v9;
        char v12 = v11;
        sub_252879734(v13, v14, v15);
        uint64_t v18 = v8;
        uint64_t v19 = v10;
        char v20 = v12 & 1;
        if (!--v3) {
          goto LABEL_14;
        }
      }
      if ((v15 & 1) == 0) {
        break;
      }
      if (sub_252898190()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DC60);
      uint64_t v16 = (void (*)(unsigned char *, void))sub_252897F00();
      sub_252898200();
      v16(v17, 0);
      if (!--v3)
      {
LABEL_14:
        sub_252879734(v18, v19, v20);
        return v21;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2528759EC()
{
  uint64_t v1 = sub_252897BC0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  int64_t v8 = (char *)v18 - v7;
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  char v11 = (char *)v18 - v10;
  MEMORY[0x270FA5388](v9);
  int64_t v13 = (char *)v18 - v12;
  uint64_t v20 = v0;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DC08);
  if (swift_dynamicCast())
  {
    sub_252879614(v18, (uint64_t)v21);
    __swift_project_boxed_opaque_existential_1Tm(v21, v21[3]);
    sub_252897C00();
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DC18);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_252899330;
    sub_252897BA0();
    sub_252897B90();
    sub_252897BB0();
    *(void *)&v18[0] = v14;
    sub_2528796DC(&qword_269C2DC20, MEMORY[0x263F47838]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DC28);
    sub_25287962C();
    sub_252898150();
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v13, v1);
    sub_252898130();
    LOBYTE(v14) = sub_252898140();
    char v15 = *(void (**)(char *, uint64_t))(v2 + 8);
    v15(v8, v1);
    v15(v11, v1);
    v15(v13, v1);
    char v16 = v14 ^ 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
  }
  else
  {
    uint64_t v19 = 0;
    memset(v18, 0, sizeof(v18));
    sub_2528795B4((uint64_t)v18);
    char v16 = 0;
  }
  return v16 & 1;
}

void *sub_252875CF8()
{
  uint64_t v1 = sub_252897650();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252897870();
  MEMORY[0x270FA5388](v5 - 8);
  if (qword_269C2D3D0 != -1) {
    swift_once();
  }
  if (byte_269C2D3D8 == 1)
  {
    sub_252879810(0, (unint64_t *)&qword_269C2DC00);
    if (sub_252898030())
    {
      sub_252897F70();
      if ((v6 & 1) == 0)
      {
        id v7 = v0;
        sub_252897860();
        id v8 = objc_allocWithZone((Class)sub_252897BE0());
        uint64_t v9 = (void *)sub_252897BD0();
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAC0);
        uint64_t v10 = swift_allocObject();
        *(_OWORD *)(v10 + 16) = xmmword_252899340;
        *(void *)(v10 + 32) = v9;
        *(void *)&long long v24 = v10;
        sub_252897DF0();
        unint64_t v11 = v24;
        if ((v24 & 0x8000000000000000) != 0 || (v24 & 0x4000000000000000) != 0)
        {
          id v12 = v9;
          int64_t v13 = sub_252869EB4(v11);

LABEL_25:
          swift_bridgeObjectRelease();
          return v13;
        }
        return (void *)(v11 & 0xFFFFFFFFFFFFFF8);
      }
    }
  }
  uint64_t v20 = v2;
  uint64_t result = objc_msgSend(v0, sel_hf_accessoryLikeObjects);
  if (result)
  {
    unint64_t v26 = MEMORY[0x263F8EE78];
    char v15 = result;
    sub_252898060();
    id v19 = v15;

    sub_2528796DC(&qword_269C2DC48, MEMORY[0x263F06DC0]);
    sub_2528980C0();
    while (v25)
    {
      sub_252879724(&v24, v23);
      sub_2528714E0((uint64_t)v23, (uint64_t)v21);
      sub_252879810(0, (unint64_t *)&unk_269C2DC50);
      if (!swift_dynamicCast()
        || (v22, sub_2528714E0((uint64_t)v23, (uint64_t)v21), (swift_dynamicCast() & 1) == 0))
      {
        id v22 = 0;
      }
      uint64_t v16 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
      if (v22)
      {
        MEMORY[0x2533BECE0](v16);
        if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_252897E00();
        }
        sub_252897E30();
        sub_252897DF0();
      }
      sub_2528980C0();
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v1);
    unint64_t v17 = v26;

    uint64_t v18 = sub_2528793B8(v17);
    swift_bridgeObjectRelease();
    unint64_t v11 = sub_2528757D8(v18);
    swift_bridgeObjectRelease();
    if ((v11 & 0x8000000000000000) != 0 || (v11 & 0x4000000000000000) != 0)
    {
      int64_t v13 = sub_252869EB4(v11);
      goto LABEL_25;
    }
    return (void *)(v11 & 0xFFFFFFFFFFFFFF8);
  }
  __break(1u);
  return result;
}

uint64_t sub_252876120(uint64_t a1)
{
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v1 = a1 + 56;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 56);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = sub_2528974D0();
  int64_t v7 = 0;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_4:
  for (v4 &= v4 - 1; ; uint64_t v4 = (v9 - 1) & v9)
  {
    uint64_t v11 = swift_unknownObjectRetain();
    MEMORY[0x2533BECE0](v11);
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_252897E00();
    }
    sub_252897E30();
    uint64_t result = sub_252897DF0();
    if (v4) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v8 >= v5) {
      goto LABEL_25;
    }
    uint64_t v9 = *(void *)(v1 + 8 * v8);
    ++v7;
    if (!v9)
    {
      int64_t v7 = v8 + 1;
      if (v8 + 1 >= v5) {
        goto LABEL_25;
      }
      uint64_t v9 = *(void *)(v1 + 8 * v7);
      if (!v9)
      {
        int64_t v7 = v8 + 2;
        if (v8 + 2 >= v5) {
          goto LABEL_25;
        }
        uint64_t v9 = *(void *)(v1 + 8 * v7);
        if (!v9)
        {
          int64_t v7 = v8 + 3;
          if (v8 + 3 >= v5) {
            goto LABEL_25;
          }
          uint64_t v9 = *(void *)(v1 + 8 * v7);
          if (!v9) {
            break;
          }
        }
      }
    }
LABEL_20:
    ;
  }
  int64_t v10 = v8 + 4;
  if (v10 >= v5)
  {
LABEL_25:
    sub_2528975E0();
    return v12;
  }
  uint64_t v9 = *(void *)(v1 + 8 * v10);
  if (v9)
  {
    int64_t v7 = v10;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v7 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v7 >= v5) {
      goto LABEL_25;
    }
    uint64_t v9 = *(void *)(v1 + 8 * v7);
    ++v10;
    if (v9) {
      goto LABEL_20;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2528762E8()
{
  uint64_t v1 = sub_2528976E0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v5 = *v0;
  sub_252898530();
  id v6 = objc_msgSend(v5, sel_uniqueIdentifier);
  sub_2528976A0();

  sub_2528796DC((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  sub_252897C20();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_252898560();
}

uint64_t sub_25287642C()
{
  uint64_t v1 = sub_2528976E0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(*v0, sel_uniqueIdentifier);
  sub_2528976A0();

  sub_2528796DC((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  sub_252897C20();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_252876560()
{
  uint64_t v1 = sub_2528976E0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = *v0;
  sub_252898530();
  id v6 = objc_msgSend(v5, sel_uniqueIdentifier);
  sub_2528976A0();

  sub_2528796DC((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  sub_252897C20();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_252898560();
}

uint64_t sub_2528766B0(id *a1, void **a2)
{
  uint64_t v4 = sub_2528976E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  int64_t v10 = (char *)&v16 - v9;
  uint64_t v11 = *a2;
  id v12 = objc_msgSend(*a1, sel_uniqueIdentifier);
  sub_2528976A0();

  id v13 = objc_msgSend(v11, sel_uniqueIdentifier);
  sub_2528976A0();

  LOBYTE(v13) = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, v4);
  v14(v10, v4);
  return v13 & 1;
}

uint64_t sub_252876818()
{
  id v1 = objc_msgSend(v0, sel_accessories);
  sub_252879810(0, (unint64_t *)&qword_269C2DC00);
  unint64_t v2 = sub_252897DD0();

  uint64_t v3 = MEMORY[0x263F8EE78];
  unint64_t v22 = MEMORY[0x263F8EE78];
  if (v2 >> 62)
  {
    sub_2528974D0();
    uint64_t result = sub_252898350();
    uint64_t v4 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    unint64_t v10 = MEMORY[0x263F8EE78];
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = sub_2528974D0();
  if (!v4) {
    goto LABEL_11;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_51;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v7 = (id)MEMORY[0x2533BF180](v6, v2);
    }
    else {
      id v7 = *(id *)(v2 + 8 * v6 + 32);
    }
    uint64_t v8 = v7;
    ++v6;
    uint64_t v9 = sub_252875CF8();

    sub_252867AA0((uint64_t)v9);
  }
  while (v4 != v6);
  swift_bridgeObjectRelease_n();
  unint64_t v10 = v22;
LABEL_12:
  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = sub_2528974D0();
    if (v11) {
      goto LABEL_14;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    unint64_t v14 = MEMORY[0x263F8EE78];
    goto LABEL_22;
  }
  sub_2528974D0();
  uint64_t result = sub_252898350();
  uint64_t v11 = result;
  if (!result) {
    goto LABEL_21;
  }
LABEL_14:
  if (v11 < 1)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  for (uint64_t i = 0; i != v11; ++i)
  {
    uint64_t v13 = swift_unknownObjectRetain();
    MEMORY[0x2533BECE0](v13);
    if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_252897E00();
    }
    sub_252897E30();
    sub_252897DF0();
  }
  swift_bridgeObjectRelease();
  unint64_t v14 = v3;
LABEL_22:
  uint64_t result = swift_bridgeObjectRelease();
  if (v14 >> 62)
  {
    sub_2528974D0();
    uint64_t v15 = sub_252898350();
    uint64_t result = swift_bridgeObjectRelease();
    if (v15)
    {
LABEL_24:
      if (v15 >= 1)
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if ((v14 & 0xC000000000000001) != 0) {
            MEMORY[0x2533BF180](j, v14);
          }
          else {
            swift_unknownObjectRetain();
          }
          swift_getObjectType();
          if (sub_252898040() & 1) != 0 && (sub_2528759EC())
          {
            sub_2528982B0();
            sub_2528982F0();
            sub_252898300();
            sub_2528982C0();
          }
          else
          {
            swift_unknownObjectRelease();
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v17 = v3;
        if (v3 < 0) {
          goto LABEL_47;
        }
        goto LABEL_38;
      }
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v15) {
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v17 = MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
    goto LABEL_47;
  }
LABEL_38:
  if ((v17 & 0x4000000000000000) == 0)
  {
    uint64_t v18 = *(void *)(v17 + 16);
    if (!v18)
    {
LABEL_48:
      sub_2528975E0();
      uint64_t v20 = MEMORY[0x263F8EE78];
LABEL_49:
      uint64_t v21 = sub_25287952C(v20);
      swift_bridgeObjectRelease();
      return v21;
    }
    goto LABEL_40;
  }
LABEL_47:
  sub_2528974D0();
  uint64_t v18 = sub_252898350();
  sub_2528975E0();
  if (!v18) {
    goto LABEL_48;
  }
LABEL_40:
  uint64_t result = sub_2528982E0();
  if ((v18 & 0x8000000000000000) == 0)
  {
    uint64_t v19 = 0;
    do
    {
      if ((v17 & 0xC000000000000001) != 0) {
        MEMORY[0x2533BF180](v19, v17);
      }
      else {
        swift_unknownObjectRetain();
      }
      ++v19;
      swift_getObjectType();
      sub_252898020();
      swift_unknownObjectRelease();
      sub_2528982B0();
      sub_2528982F0();
      sub_252898300();
      sub_2528982C0();
    }
    while (v18 != v19);
    uint64_t v20 = v3;
    sub_2528975E0();
    goto LABEL_49;
  }
LABEL_53:
  __break(1u);
  return result;
}

uint64_t sub_252876C80(void *a1, void *a2, uint64_t a3)
{
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  uint64_t v5 = sub_2528984B0();
  __swift_project_boxed_opaque_existential_1Tm(a2, a2[3]);
  uint64_t v6 = sub_2528984B0();
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v5, v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_252876D10(uint64_t a1, uint64_t a2, uint64_t (*a3)(void *, void *))
{
  v9[3] = swift_getObjectType();
  v9[0] = a1;
  v8[3] = swift_getObjectType();
  v8[0] = a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v6 = a3(v9, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

uint64_t sub_252876DA0()
{
  id v1 = objc_msgSend(v0, sel_hf_reorderableActionSetsList);
  id v2 = objc_msgSend(v1, sel_sortedHomeKitObjectComparator);

  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_2528797C8;
  *(void *)(v4 + 24) = v3;
  id v5 = objc_msgSend(v0, sel_actionSets);
  sub_252879810(0, &qword_269C2DC78);
  unint64_t v6 = sub_252897DD0();

  if (v6 >> 62) {
    goto LABEL_42;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  sub_2528974E0();
  while (1)
  {
    uint64_t v35 = MEMORY[0x263F8EE78];
    if (!v7) {
      break;
    }
    uint64_t v33 = 0;
    unint64_t v8 = 0;
    uint64_t v32 = (void *)(MEMORY[0x263F8EE78] + 32);
    while (1)
    {
      if ((v6 & 0xC000000000000001) != 0)
      {
        id v9 = (id)MEMORY[0x2533BF180](v8, v6);
      }
      else
      {
        if ((v8 & 0x8000000000000000) != 0) {
          goto LABEL_40;
        }
        if (v8 >= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_41;
        }
        id v9 = *(id *)(v6 + 8 * v8 + 32);
      }
      unint64_t v10 = v9;
      unint64_t v11 = v8 + 1;
      if (__OFADD__(v8, 1)) {
        break;
      }
      id v12 = objc_msgSend(v9, sel_actions);
      sub_252879810(0, &qword_269C2DC80);
      sub_252879740(&qword_269C2DC88, &qword_269C2DC80);
      uint64_t v13 = sub_252897ED0();

      if ((v13 & 0xC000000000000001) != 0) {
        uint64_t v14 = sub_2528981C0();
      }
      else {
        uint64_t v14 = *(void *)(v13 + 16);
      }
      swift_bridgeObjectRelease();
      if (v14 && !objc_msgSend(v10, sel_hf_isAnonymous))
      {
        uint64_t v15 = v33;
        if (!v33)
        {
          unint64_t v16 = *(void *)(v35 + 24);
          if ((uint64_t)((v16 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_45;
          }
          int64_t v17 = v16 & 0xFFFFFFFFFFFFFFFELL;
          if (v17 <= 1) {
            uint64_t v18 = 1;
          }
          else {
            uint64_t v18 = v17;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAC0);
          uint64_t v19 = (void *)swift_allocObject();
          int64_t v20 = _swift_stdlib_malloc_size(v19);
          uint64_t v21 = v20 - 32;
          if (v20 < 32) {
            uint64_t v21 = v20 - 25;
          }
          uint64_t v22 = v21 >> 3;
          v19[2] = v18;
          v19[3] = (2 * (v21 >> 3)) | 1;
          unint64_t v23 = (unint64_t)(v19 + 4);
          uint64_t v24 = *(void *)(v35 + 24) >> 1;
          if (*(void *)(v35 + 16))
          {
            uint64_t v25 = (const void *)(v35 + 32);
            if (v19 != (void *)v35 || v23 >= (unint64_t)v25 + 8 * v24)
            {
              uint64_t v34 = v21 >> 3;
              memmove(v19 + 4, v25, 8 * v24);
              unint64_t v23 = (unint64_t)(v19 + 4);
              uint64_t v22 = v34;
            }
            *(void *)(v35 + 16) = 0;
          }
          uint64_t v32 = (void *)(v23 + 8 * v24);
          uint64_t v15 = (v22 & 0x7FFFFFFFFFFFFFFFLL) - v24;
          sub_2528975E0();
          uint64_t v35 = (uint64_t)v19;
        }
        BOOL v26 = __OFSUB__(v15, 1);
        uint64_t v27 = v15 - 1;
        if (v26) {
          goto LABEL_44;
        }
        uint64_t v33 = v27;
        *v32++ = v10;
        unint64_t v8 = v11;
        if (v11 == v7) {
          goto LABEL_35;
        }
      }
      else
      {

        ++v8;
        if (v11 == v7) {
          goto LABEL_35;
        }
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    swift_bridgeObjectRetain_n();
    sub_2528974E0();
    uint64_t v7 = sub_252898350();
  }
  uint64_t v33 = 0;
LABEL_35:
  swift_bridgeObjectRelease();
  unint64_t v28 = *(void *)(v35 + 24);
  if (v28 < 2) {
    goto LABEL_38;
  }
  unint64_t v29 = v28 >> 1;
  BOOL v26 = __OFSUB__(v29, v33);
  uint64_t v30 = v29 - v33;
  if (!v26)
  {
    *(void *)(v35 + 16) = v30;
LABEL_38:
    swift_bridgeObjectRelease();
    uint64_t v36 = v35;
    sub_2528974E0();
    sub_2528792FC(&v36, (uint64_t (*)(id, id))sub_252879808);
    swift_bridgeObjectRelease();
    swift_release_n();
    return v36;
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  swift_release_n();
  uint64_t result = sub_2528975E0();
  __break(1u);
  return result;
}

uint64_t sub_2528771E4()
{
  unint64_t v0 = sub_252876DA0();
  unint64_t v1 = v0;
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (!(v0 >> 62))
  {
    uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = sub_2528974D0();
    if (v2) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v6 = MEMORY[0x263F8EE78];
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v7 = sub_252876818();
    unint64_t v8 = sub_252876120(v7);
    swift_bridgeObjectRelease();
    sub_252867E18(v8);
    return v6;
  }
  sub_2528974D0();
  uint64_t result = sub_252898350();
  uint64_t v2 = result;
  if (!result) {
    goto LABEL_13;
  }
LABEL_3:
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        MEMORY[0x2533BF180](i, v1);
      }
      else {
        id v5 = *(id *)(v1 + 8 * i + 32);
      }
      MEMORY[0x2533BECE0]();
      if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_252897E00();
      }
      sub_252897E30();
      sub_252897DF0();
    }
    swift_bridgeObjectRelease();
    uint64_t v6 = v9;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_25287736C()
{
  uint64_t v0 = type metadata accessor for ElementID();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v4 = sub_2528771E4();
  unint64_t v5 = v4;
  if (!(v4 >> 62))
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v6) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t v6 = sub_252898350();
  if (!v6) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_252868CF8(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v13;
    do
    {
      if ((v5 & 0xC000000000000001) != 0) {
        MEMORY[0x2533BF180](v8, v5);
      }
      else {
        swift_unknownObjectRetain();
      }
      swift_getObjectType();
      sub_25288DC08((uint64_t)v3);
      swift_unknownObjectRelease();
      uint64_t v13 = v9;
      unint64_t v11 = *(void *)(v9 + 16);
      unint64_t v10 = *(void *)(v9 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_252868CF8(v10 > 1, v11 + 1, 1);
        uint64_t v9 = v13;
      }
      ++v8;
      *(void *)(v9 + 16) = v11 + 1;
      sub_25287821C((uint64_t)v3, v9+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(void *)(v1 + 72) * v11);
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_252877550(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    sub_2528974D0();
    id v8 = a2;
    uint64_t v9 = sub_2528981D0();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_252879810(0, (unint64_t *)&unk_269C2DC50);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_2528981C0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_252877B10(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_252884EE4();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_252877D08((uint64_t)v8, v22);
    uint64_t *v3 = v22;
  }
  else
  {
    sub_2528974D0();
    uint64_t v11 = sub_252898090();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_252879810(0, (unint64_t *)&unk_269C2DC50);
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_2528980A0();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_2528980A0();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_252877D8C((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_2528777F0(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2528976E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v28 - v11;
  uint64_t v13 = *v3;
  sub_252898530();
  sub_2528974D0();
  id v32 = a2;
  id v14 = objc_msgSend(a2, sel_uniqueIdentifier);
  sub_2528976A0();

  sub_2528796DC((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  sub_252897C20();
  char v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v12, v6);
  uint64_t v16 = sub_252898560();
  uint64_t v17 = -1 << *(unsigned char *)(v13 + 32);
  unint64_t v18 = v16 & ~v17;
  uint64_t v31 = v13;
  uint64_t v19 = v13 + 56;
  uint64_t v20 = *(void *)(v19 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18;
  uint64_t v28 = v3;
  unint64_t v29 = a1;
  if (v20)
  {
    uint64_t v30 = ~v17;
    while (1)
    {
      id v21 = objc_msgSend((id)swift_unknownObjectRetain(), sel_uniqueIdentifier);
      sub_2528976A0();

      id v22 = objc_msgSend(v32, sel_uniqueIdentifier);
      sub_2528976A0();

      LOBYTE(v22) = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
      v15(v10, v6);
      v15(v12, v6);
      swift_unknownObjectRelease();
      if (v22) {
        break;
      }
      unint64_t v18 = (v18 + 1) & v30;
      if (((*(void *)(v19 + ((v18 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v18) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    *unint64_t v29 = *(void *)(*(void *)(*v28 + 48) + 8 * v18);
    swift_unknownObjectRetain();
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    id v23 = v28;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v33 = *v23;
    uint64_t *v23 = 0x8000000000000000;
    id v25 = v32;
    uint64_t v26 = (void *)swift_unknownObjectRetain();
    sub_252877F14(v26, v18, isUniquelyReferenced_nonNull_native);
    uint64_t *v23 = v33;
    swift_bridgeObjectRelease();
    *unint64_t v29 = v25;
    return 1;
  }
}

uint64_t sub_252877B10(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DC70);
    uint64_t v2 = sub_252898230();
    uint64_t v14 = v2;
    sub_252898180();
    if (sub_2528981F0())
    {
      sub_252879810(0, (unint64_t *)&unk_269C2DC50);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_252884EE4();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_252898090();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_2528981F0());
    }
    sub_2528975E0();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

unint64_t sub_252877D08(uint64_t a1, uint64_t a2)
{
  sub_252898090();
  unint64_t result = sub_252898160();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_252877D8C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_252884EE4();
  }
  else
  {
    if (v7 > v6)
    {
      sub_252885984();
      goto LABEL_14;
    }
    sub_252885F4C();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_252898090();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_252879810(0, (unint64_t *)&unk_269C2DC50);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_2528980A0();

    if (v12)
    {
LABEL_13:
      sub_2528984D0();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_2528980A0();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

uint64_t sub_252877F14(void *a1, unint64_t a2, char a3)
{
  id v31 = a1;
  uint64_t v6 = sub_2528976E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v27 - v12;
  unint64_t v14 = *(void *)(*v3 + 16);
  unint64_t v15 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  if (v15 > v14 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_252885184();
  }
  else
  {
    if (v15 > v14)
    {
      uint64_t result = (uint64_t)sub_252885B30();
      goto LABEL_12;
    }
    sub_2528861C8();
  }
  uint64_t v16 = *v3;
  sub_252898530();
  id v17 = objc_msgSend(v31, sel_uniqueIdentifier);
  sub_2528976A0();

  sub_2528796DC((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  sub_252897C20();
  BOOL v18 = *(void (**)(char *, uint64_t))(v7 + 8);
  v18(v13, v6);
  uint64_t result = sub_252898560();
  uint64_t v19 = -1 << *(unsigned char *)(v16 + 32);
  a2 = result & ~v19;
  uint64_t v29 = v16 + 56;
  uint64_t v30 = v16;
  if ((*(void *)(v16 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v20 = ~v19;
    do
    {
      id v21 = objc_msgSend((id)swift_unknownObjectRetain(), sel_uniqueIdentifier);
      sub_2528976A0();

      id v22 = objc_msgSend(v31, sel_uniqueIdentifier);
      sub_2528976A0();

      LOBYTE(v22) = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
      v18(v10, v6);
      v18(v13, v6);
      uint64_t result = swift_unknownObjectRelease();
      if (v22) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v20;
    }
    while (((*(void *)(v29 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v23 + 48) + 8 * a2) = v31;
  uint64_t v24 = *(void *)(v23 + 16);
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (!v25)
  {
    *(void *)(v23 + 16) = v26;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_2528984D0();
  __break(1u);
  return result;
}

uint64_t sub_25287821C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ElementID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

int64_t sub_252878280(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_252878364(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x2533BF100](a1, a2, v7);
      sub_252879810(0, (unint64_t *)&unk_269C2DC50);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_2528981A0() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_2528981B0();
  sub_252879810(0, (unint64_t *)&unk_269C2DC50);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_252898090();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_2528980A0();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_2528980A0();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  unint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);
  id v16 = v15;
}

uint64_t sub_2528785DC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
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
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_252878664(id *a1, id *__src, unint64_t a3, char *__dst, uint64_t (*a5)(id, id))
{
  unsigned int v6 = __src;
  uint64_t v7 = (char *)__src - (char *)a1;
  uint64_t v8 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0) {
    uint64_t v8 = (char *)__src - (char *)a1;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 3;
  uint64_t v39 = a1;
  uint64_t v38 = (void **)__dst;
  if (v9 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != (char *)__src || &__src[v13] <= (id *)__dst) {
        memmove(__dst, __src, 8 * v13);
      }
      uint64_t v33 = __dst;
      uint64_t v24 = &__dst[8 * v13];
      uint64_t v37 = v24;
      uint64_t v39 = v6;
      if (a1 < v6 && v11 >= 8)
      {
        BOOL v25 = (void *)(a3 - 8);
        uint64_t v26 = v6;
        do
        {
          uint64_t v36 = v6;
          uint64_t v27 = (char *)(v25 + 1);
          uint64_t v28 = *--v26;
          id v29 = *((id *)v24 - 1);
          id v30 = v28;
          uint64_t v31 = a5(v29, v30);

          if (v31 == -1)
          {
            if (v27 != (char *)v36 || v25 >= v36) {
              *BOOL v25 = *v26;
            }
            uint64_t v39 = v26;
          }
          else
          {
            uint64_t v37 = v24 - 8;
            uint64_t v26 = v36;
            if (v27 < v24 || v25 >= (void *)v24 || v27 != v24) {
              *BOOL v25 = *((void *)v24 - 1);
            }
            v24 -= 8;
          }
          if (v26 <= a1) {
            break;
          }
          --v25;
          unsigned int v6 = v26;
        }
        while (v24 > v33);
      }
      goto LABEL_43;
    }
  }
  else if (v7 >= -7)
  {
    if (__dst != (char *)a1 || &a1[v9] <= (id *)__dst) {
      memmove(__dst, a1, 8 * v9);
    }
    char v14 = (void **)&__dst[8 * v9];
    uint64_t v37 = (char *)v14;
    if ((unint64_t)v6 < a3 && v7 >= 8)
    {
      unint64_t v15 = (void **)__dst;
      unint64_t v16 = a3;
      id v17 = a1;
      do
      {
        BOOL v18 = *v15;
        uint64_t v19 = v6;
        id v20 = *v6;
        id v21 = v18;
        uint64_t v22 = a5(v20, v21);

        if (v22 == -1)
        {
          uint64_t v23 = v19 + 1;
          if (v17 < v19 || v17 >= v23 || v17 != v19) {
            *id v17 = *v19;
          }
        }
        else
        {
          if (v17 != v15) {
            *id v17 = *v15;
          }
          uint64_t v38 = ++v15;
          uint64_t v23 = v19;
        }
        ++v17;
        if (v15 >= v14) {
          break;
        }
        unsigned int v6 = v23;
      }
      while ((unint64_t)v23 < v16);
      uint64_t v39 = v17;
    }
LABEL_43:
    sub_25286C2CC((void **)&v39, (const void **)&v38, &v37);
    return 1;
  }
  sub_2528975E0();
  uint64_t result = sub_252898390();
  __break(1u);
  return result;
}

void sub_252878970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(id, id))
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v9 = *(void **)(v7 + 8 * v6);
    uint64_t v10 = a1;
    uint64_t v18 = v8;
    while (1)
    {
      uint64_t v11 = *(void **)v8;
      id v12 = v9;
      id v13 = v11;
      uint64_t v14 = a5(v12, v13);

      if (v14 != -1)
      {
LABEL_4:
        ++v6;
        uint64_t v8 = v18 + 8;
        if (v6 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      unint64_t v15 = *(void **)v8;
      uint64_t v9 = *(void **)(v8 + 8);
      *(void *)uint64_t v8 = v9;
      *(void *)(v8 + 8) = v15;
      v8 -= 8;
      if (v6 == ++v10) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_252878A5C(uint64_t *a1, uint64_t (*a2)(id, id))
{
  uint64_t v5 = a1[1];
  swift_retain_n();
  uint64_t v6 = sub_252898480();
  if (v6 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_135;
    }
    if (v5)
    {
      sub_2528974E0();
      sub_252878970(0, v5, 1, a1, a2);
    }
    return swift_release_n();
  }
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  if (v5 < -1) {
    goto LABEL_143;
  }
  uint64_t v8 = v6;
  uint64_t v117 = a2;
  uint64_t v121 = v2;
  uint64_t v110 = a1;
  if (v5 < 2)
  {
    id v12 = (char *)MEMORY[0x263F8EE78];
    uint64_t v124 = MEMORY[0x263F8EE78];
    uint64_t v116 = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v5 != 1)
    {
      unint64_t v16 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_100:
      if (v16 >= 2)
      {
        uint64_t v99 = *v110;
        uint64_t v123 = *v110;
        do
        {
          unint64_t v100 = v16 - 2;
          if (v16 < 2) {
            goto LABEL_130;
          }
          if (!v99) {
            goto LABEL_142;
          }
          uint64_t v101 = (uint64_t)v12;
          uint64_t v102 = *(void *)&v12[16 * v100 + 32];
          uint64_t v103 = *(void *)&v12[16 * v16 + 24];
          unint64_t v104 = (id *)(v99 + 8 * v102);
          uint64_t v105 = (id *)(v99 + 8 * *(void *)&v12[16 * v16 + 16]);
          unint64_t v106 = v99 + 8 * v103;
          sub_2528974E0();
          sub_252878664(v104, v105, v106, v116, v117);
          if (v121) {
            goto LABEL_97;
          }
          sub_2528975E0();
          if (v103 < v102) {
            goto LABEL_131;
          }
          id v12 = (char *)v101;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v12 = sub_25286C59C(v101);
          }
          if (v100 >= *((void *)v12 + 2)) {
            goto LABEL_132;
          }
          unint64_t v107 = &v12[16 * v100 + 32];
          *(void *)unint64_t v107 = v102;
          *((void *)v107 + 1) = v103;
          unint64_t v108 = *((void *)v12 + 2);
          if (v16 > v108) {
            goto LABEL_133;
          }
          memmove(&v12[16 * v16 + 16], &v12[16 * v16 + 32], 16 * (v108 - v16));
          *((void *)v12 + 2) = v108 - 1;
          unint64_t v16 = v108 - 1;
          uint64_t v99 = v123;
        }
        while (v108 > 2);
      }
      swift_bridgeObjectRelease();
      *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_252897DF0();
LABEL_112:
      swift_release_n();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v9 = v7 >> 1;
    sub_252879810(0, &qword_269C2DC78);
    uint64_t v10 = sub_252897E20();
    *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    uint64_t v116 = (char *)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v124 = v10;
  }
  uint64_t v13 = 0;
  uint64_t v14 = *a1;
  uint64_t v112 = *a1 + 16;
  uint64_t v113 = v8;
  uint64_t v111 = *a1 - 8;
  id v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v15 = v5;
  uint64_t v114 = v5;
  uint64_t v122 = *a1;
  while (1)
  {
    uint64_t v17 = v13;
    if (v13 + 1 >= v15)
    {
      uint64_t v118 = v13 + 1;
      uint64_t v23 = v117;
    }
    else
    {
      uint64_t v18 = v12;
      uint64_t v19 = *(void **)(v14 + 8 * (v13 + 1));
      id v20 = *(void **)(v14 + 8 * v13);
      id v21 = v19;
      id v22 = v20;
      uint64_t v23 = v117;
      uint64_t v24 = v117(v21, v22);

      uint64_t v25 = v17 + 2;
      if (v17 + 2 >= v15)
      {
        uint64_t v118 = v17 + 2;
      }
      else
      {
        *(void *)unint64_t v119 = v17;
        uint64_t v26 = (id *)(v112 + 8 * v17);
        while (1)
        {
          uint64_t v118 = v25;
          uint64_t v27 = *(v26 - 1);
          id v28 = *v26;
          id v29 = v27;
          uint64_t v30 = v117(v28, v29);

          if ((v24 == -1) == (v30 != -1)) {
            break;
          }
          uint64_t v25 = v118 + 1;
          ++v26;
          if (v114 == v118 + 1)
          {
            uint64_t v118 = v114;
            break;
          }
        }
        uint64_t v17 = *(void *)v119;
      }
      id v12 = v18;
      uint64_t v14 = v122;
      if (v24 == -1)
      {
        uint64_t v31 = v118;
        if (v118 < v17) {
          goto LABEL_138;
        }
        if (v17 < v118)
        {
          id v32 = (uint64_t *)(v111 + 8 * v118);
          uint64_t v33 = v17;
          uint64_t v34 = (uint64_t *)(v122 + 8 * v17);
          do
          {
            if (v33 != --v31)
            {
              if (!v122) {
                goto LABEL_141;
              }
              uint64_t v35 = *v34;
              *uint64_t v34 = *v32;
              *id v32 = v35;
            }
            ++v33;
            --v32;
            ++v34;
          }
          while (v33 < v31);
        }
      }
    }
    if (v118 < v114)
    {
      if (__OFSUB__(v118, v17)) {
        goto LABEL_134;
      }
      if (v118 - v17 < v113) {
        break;
      }
    }
LABEL_50:
    if (v118 < v17) {
      goto LABEL_129;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v12 = sub_25286C1D0(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v48 = *((void *)v12 + 2);
    unint64_t v47 = *((void *)v12 + 3);
    unint64_t v16 = v48 + 1;
    if (v48 >= v47 >> 1) {
      id v12 = sub_25286C1D0((char *)(v47 > 1), v48 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v16;
    uint64_t v49 = v12 + 32;
    os_log_type_t v50 = &v12[16 * v48 + 32];
    *(void *)os_log_type_t v50 = v17;
    *((void *)v50 + 1) = v118;
    if (v48)
    {
      while (1)
      {
        unint64_t v51 = v16 - 1;
        if (v16 >= 4)
        {
          os_log_type_t v56 = &v49[16 * v16];
          uint64_t v57 = *((void *)v56 - 8);
          uint64_t v58 = *((void *)v56 - 7);
          BOOL v62 = __OFSUB__(v58, v57);
          uint64_t v59 = v58 - v57;
          if (v62) {
            goto LABEL_118;
          }
          uint64_t v61 = *((void *)v56 - 6);
          uint64_t v60 = *((void *)v56 - 5);
          BOOL v62 = __OFSUB__(v60, v61);
          uint64_t v54 = v60 - v61;
          char v55 = v62;
          if (v62) {
            goto LABEL_119;
          }
          unint64_t v63 = v16 - 2;
          uint64_t v64 = &v49[16 * v16 - 32];
          uint64_t v66 = *(void *)v64;
          uint64_t v65 = *((void *)v64 + 1);
          BOOL v62 = __OFSUB__(v65, v66);
          uint64_t v67 = v65 - v66;
          if (v62) {
            goto LABEL_121;
          }
          BOOL v62 = __OFADD__(v54, v67);
          uint64_t v68 = v54 + v67;
          if (v62) {
            goto LABEL_124;
          }
          if (v68 >= v59)
          {
            uint64_t v86 = &v49[16 * v51];
            uint64_t v88 = *(void *)v86;
            uint64_t v87 = *((void *)v86 + 1);
            BOOL v62 = __OFSUB__(v87, v88);
            uint64_t v89 = v87 - v88;
            if (v62) {
              goto LABEL_128;
            }
            BOOL v79 = v54 < v89;
            goto LABEL_87;
          }
        }
        else
        {
          if (v16 != 3)
          {
            uint64_t v80 = *((void *)v12 + 4);
            uint64_t v81 = *((void *)v12 + 5);
            BOOL v62 = __OFSUB__(v81, v80);
            uint64_t v73 = v81 - v80;
            char v74 = v62;
            goto LABEL_81;
          }
          uint64_t v53 = *((void *)v12 + 4);
          uint64_t v52 = *((void *)v12 + 5);
          BOOL v62 = __OFSUB__(v52, v53);
          uint64_t v54 = v52 - v53;
          char v55 = v62;
        }
        if (v55) {
          goto LABEL_120;
        }
        unint64_t v63 = v16 - 2;
        uint64_t v69 = &v49[16 * v16 - 32];
        uint64_t v71 = *(void *)v69;
        uint64_t v70 = *((void *)v69 + 1);
        BOOL v72 = __OFSUB__(v70, v71);
        uint64_t v73 = v70 - v71;
        char v74 = v72;
        if (v72) {
          goto LABEL_123;
        }
        BOOL v75 = &v49[16 * v51];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v62 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v62) {
          goto LABEL_126;
        }
        if (__OFADD__(v73, v78)) {
          goto LABEL_127;
        }
        if (v73 + v78 >= v54)
        {
          BOOL v79 = v54 < v78;
LABEL_87:
          if (v79) {
            unint64_t v51 = v63;
          }
          goto LABEL_89;
        }
LABEL_81:
        if (v74) {
          goto LABEL_122;
        }
        BOOL v82 = &v49[16 * v51];
        uint64_t v84 = *(void *)v82;
        uint64_t v83 = *((void *)v82 + 1);
        BOOL v62 = __OFSUB__(v83, v84);
        uint64_t v85 = v83 - v84;
        if (v62) {
          goto LABEL_125;
        }
        if (v85 < v73) {
          goto LABEL_15;
        }
LABEL_89:
        unint64_t v90 = v51 - 1;
        if (v51 - 1 >= v16)
        {
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
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
          goto LABEL_137;
        }
        if (!v14) {
          goto LABEL_140;
        }
        uint64_t v91 = &v49[16 * v90];
        uint64_t v92 = *(void *)v91;
        unint64_t v93 = v51;
        uint64_t v94 = &v49[16 * v51];
        uint64_t v95 = *((void *)v94 + 1);
        char v96 = (id *)(v14 + 8 * *(void *)v91);
        uint64_t v97 = (id *)(v14 + 8 * *(void *)v94);
        sub_2528974E0();
        sub_252878664(v96, v97, v14 + 8 * v95, v116, v117);
        if (v121)
        {
LABEL_97:
          swift_bridgeObjectRelease();
          sub_2528975E0();
          *(void *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_252897DF0();
          goto LABEL_112;
        }
        sub_2528975E0();
        if (v95 < v92) {
          goto LABEL_115;
        }
        if (v93 > *((void *)v12 + 2)) {
          goto LABEL_116;
        }
        *(void *)uint64_t v91 = v92;
        *(void *)&v12[16 * v90 + 40] = v95;
        unint64_t v98 = *((void *)v12 + 2);
        if (v93 >= v98) {
          goto LABEL_117;
        }
        unint64_t v16 = v98 - 1;
        memmove(v94, v94 + 16, 16 * (v98 - 1 - v93));
        uint64_t v49 = v12 + 32;
        *((void *)v12 + 2) = v98 - 1;
        uint64_t v14 = v122;
        if (v98 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v16 = 1;
LABEL_15:
    uint64_t v15 = v114;
    uint64_t v13 = v118;
    if (v118 >= v114) {
      goto LABEL_100;
    }
  }
  if (__OFADD__(v17, v113)) {
    goto LABEL_136;
  }
  uint64_t v36 = v114;
  if (v17 + v113 < v114) {
    uint64_t v36 = v17 + v113;
  }
  if (v36 >= v17)
  {
    uint64_t v37 = v118;
    if (v118 != v36)
    {
      *(void *)v120 = v17;
      uint64_t v109 = v12;
      uint64_t v38 = v111 + 8 * v118;
      uint64_t v115 = v36;
      do
      {
        uint64_t v39 = *(void **)(v14 + 8 * v37);
        uint64_t v40 = *(void *)v120;
        uint64_t v41 = v38;
        while (1)
        {
          uint64_t v42 = *(void **)v41;
          id v43 = v39;
          id v44 = v42;
          uint64_t v45 = v23(v43, v44);

          if (v45 != -1) {
            break;
          }
          uint64_t v14 = v122;
          if (!v122) {
            goto LABEL_139;
          }
          uint64_t v46 = *(void **)v41;
          uint64_t v39 = *(void **)(v41 + 8);
          *(void *)uint64_t v41 = v39;
          *(void *)(v41 + 8) = v46;
          v41 -= 8;
          if (v37 == ++v40) {
            goto LABEL_43;
          }
        }
        uint64_t v14 = v122;
LABEL_43:
        ++v37;
        v38 += 8;
      }
      while (v37 != v115);
      uint64_t v118 = v115;
      id v12 = v109;
      uint64_t v17 = *(void *)v120;
    }
    goto LABEL_50;
  }
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  swift_release_n();
  __break(1u);
LABEL_140:
  swift_release_n();
  __break(1u);
LABEL_141:
  swift_release_n();
  __break(1u);
LABEL_142:
  swift_release_n();
  __break(1u);
LABEL_143:
  swift_release_n();
  uint64_t result = sub_252898340();
  __break(1u);
  return result;
}

uint64_t sub_2528792FC(uint64_t *a1, uint64_t (*a2)(id, id))
{
  uint64_t v4 = *a1;
  swift_retain_n();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_25286D320();
  }
  uint64_t v6 = *(void *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  sub_2528974E0();
  sub_252878A5C(v8, a2);
  sub_2528975E0();
  sub_2528982C0();
  return swift_release_n();
}

uint64_t sub_2528793B8(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    sub_2528974D0();
    sub_252898350();
    swift_bridgeObjectRelease();
  }
  sub_252879810(0, (unint64_t *)&unk_269C2DC50);
  sub_252879740(&qword_269C2DC68, (unint64_t *)&unk_269C2DC50);
  uint64_t result = sub_252897EF0();
  uint64_t v10 = result;
  if (v2)
  {
    sub_2528974D0();
    uint64_t v4 = sub_252898350();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x2533BF180](i, a1);
        sub_252877550(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_252877550(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25287952C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_252879688();
  uint64_t result = sub_252897EF0();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      swift_unknownObjectRetain();
      sub_2528777F0(&v6, v5);
      swift_unknownObjectRelease();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_2528795B4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DC10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_252879614(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_25287962C()
{
  unint64_t result = qword_269C2DC30;
  if (!qword_269C2DC30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C2DC28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DC30);
  }
  return result;
}

unint64_t sub_252879688()
{
  unint64_t result = qword_269C2DC38;
  if (!qword_269C2DC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DC38);
  }
  return result;
}

uint64_t sub_2528796DC(unint64_t *a1, void (*a2)(uint64_t))
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

_OWORD *sub_252879724(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_252879734(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_252879740(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_252879810(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_252879790()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2528797C8(void *a1, void *a2)
{
  return sub_252876C80(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_2528797D0()
{
  sub_2528975E0();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_252879808(uint64_t a1, uint64_t a2)
{
  return sub_252876D10(a1, a2, *(uint64_t (**)(void *, void *))(v2 + 16));
}

uint64_t sub_252879810(uint64_t a1, unint64_t *a2)
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

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

ValueMetadata *type metadata accessor for ValidTileAccessory()
{
  return &type metadata for ValidTileAccessory;
}

unint64_t sub_2528798A4()
{
  unint64_t result = qword_269C2DC90;
  if (!qword_269C2DC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DC90);
  }
  return result;
}

uint64_t sub_2528798F8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D950);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t result = sub_252897560();
  qword_269C2DCA0 = result;
  return result;
}

uint64_t static HomeXLTileEntity.defaultQuery.getter@<X0>(void *a1@<X8>)
{
  if (qword_269C2D400 != -1) {
    swift_once();
  }
  *a1 = qword_269C2DCA0;
  return sub_2528974E0();
}

uint64_t sub_2528799C0()
{
  uint64_t v0 = sub_252897590();
  __swift_allocate_value_buffer(v0, qword_269C2DCA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C2DCA8);
  return sub_252897580();
}

uint64_t static HomeXLTileEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D408 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897590();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2DCA8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t HomeXLTileEntity.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252879BE4(v1, a1, (uint64_t (*)(void))type metadata accessor for ElementID);
}

uint64_t HomeXLTileEntity.homeID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for HomeXLTileEntity();
  return sub_252879BE4(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(void))type metadata accessor for HomeID);
}

uint64_t type metadata accessor for HomeXLTileEntity()
{
  uint64_t result = qword_26B22D750;
  if (!qword_26B22D750) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t HomeXLTileEntity.item.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for HomeXLTileEntity();
  return sub_252879BE4(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
}

uint64_t sub_252879BE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t HomeXLTileEntity.item.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for HomeXLTileEntity() + 24);
  return sub_252879C90(a1, v3);
}

uint64_t sub_252879C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TileElementInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*HomeXLTileEntity.item.modify())()
{
  return nullsub_1;
}

uint64_t HomeXLTileEntity.displayRepresentation.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA50);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_252897630();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = sub_252897C80();
  MEMORY[0x270FA5388](v6 - 8);
  sub_252897C70();
  sub_252897C60();
  type metadata accessor for HomeXLTileEntity();
  type metadata accessor for TileElementInfo();
  sub_252897C50();
  sub_252897C60();
  sub_252897620();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  sub_2528974D0();
  sub_252897460();
  return sub_252897480();
}

uint64_t HomeXLTileEntity.hash(into:)()
{
  return TileElementInfo.hash(into:)();
}

uint64_t static HomeXLTileEntity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for ElementID();
  if (qword_252899718[*(char *)(a1 + *(int *)(v4 + 20))] != qword_252899718[*(char *)(a2 + *(int *)(v4 + 20))]) {
    return 0;
  }
  uint64_t v5 = type metadata accessor for HomeXLTileEntity();
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(v5 + 24);
  return _s17HomeWidgetIntents15TileElementInfoV2eeoiySbAC_ACtFZ_0(a1 + v6, a2 + v6);
}

uint64_t HomeXLTileEntity.hashValue.getter()
{
  return sub_252898560();
}

uint64_t sub_25287A218@<X0>(void *a1@<X8>)
{
  if (qword_269C2D400 != -1) {
    swift_once();
  }
  *a1 = qword_269C2DCA0;
  return sub_2528974E0();
}

uint64_t sub_25287A284()
{
  return sub_252898560();
}

uint64_t sub_25287A374()
{
  return TileElementInfo.hash(into:)();
}

uint64_t sub_25287A44C()
{
  return sub_252898560();
}

uint64_t sub_25287A538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = type metadata accessor for ElementID();
  if (qword_252899718[*(char *)(a1 + *(int *)(v6 + 20))] != qword_252899718[*(char *)(a2 + *(int *)(v6 + 20))]
    || (_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0)
  {
    return 0;
  }
  uint64_t v7 = *(int *)(a3 + 24);
  return _s17HomeWidgetIntents15TileElementInfoV2eeoiySbAC_ACtFZ_0(a1 + v7, a2 + v7);
}

uint64_t sub_25287A5E0@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D408 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897590();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2DCA8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_25287A688(uint64_t a1)
{
  uint64_t v2 = sub_25287AD78(qword_269C2D9A0, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
  return MEMORY[0x270EE0C68](a1, v2);
}

uint64_t sub_25287A708(uint64_t a1)
{
  uint64_t v2 = sub_25287AD78(&qword_26B22D738, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
  return MEMORY[0x270EE1D98](a1, v2);
}

uint64_t static HomeXLTileEntity.create(id:homeID:item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_252879BE4(a1, a4, (uint64_t (*)(void))type metadata accessor for ElementID);
  uint64_t v7 = type metadata accessor for HomeXLTileEntity();
  sub_252879BE4(a2, a4 + *(int *)(v7 + 20), (uint64_t (*)(void))type metadata accessor for HomeID);
  return sub_252879BE4(a3, a4 + *(int *)(v7 + 24), (uint64_t (*)(void))type metadata accessor for TileElementInfo);
}

uint64_t sub_25287A824@<X0>(uint64_t a1@<X8>)
{
  return sub_252879BE4(v1, a1, (uint64_t (*)(void))type metadata accessor for ElementID);
}

uint64_t sub_25287A858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_252879BE4(v2 + *(int *)(a1 + 20), a2, (uint64_t (*)(void))type metadata accessor for HomeID);
}

uint64_t sub_25287A890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_252879BE4(v2 + *(int *)(a1 + 24), a2, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
}

uint64_t sub_25287A8C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_252879BE4(a3, a5 + *(int *)(a4 + 24), (uint64_t (*)(void))type metadata accessor for TileElementInfo);
}

uint64_t static HomeXLTileEntity.attributionBundleIdentifier.getter()
{
  return 0x6C7070612E6D6F63;
}

uint64_t sub_25287A984()
{
  return 0x6C7070612E6D6F63;
}

uint64_t sub_25287A9A8()
{
  return sub_25287AD78(&qword_26B22D708, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25287A9F0()
{
  return sub_25287AD78(&qword_26B22D720, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25287AA38()
{
  return sub_25287AD78(&qword_26B22D748, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25287AA80()
{
  return sub_25287AD78(&qword_269C2DCC0, (void (*)(uint64_t))type metadata accessor for ElementID);
}

uint64_t sub_25287AAC8()
{
  return sub_25287AD78(&qword_269C2DCC8, (void (*)(uint64_t))type metadata accessor for ElementID);
}

uint64_t sub_25287AB10()
{
  return sub_25287AD78(&qword_269C2DCD0, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25287AB58()
{
  return sub_25287AD78(&qword_26B22D728, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25287ABA0()
{
  return sub_25287AD78(&qword_26B22D730, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25287ABE8()
{
  return sub_25287AD78((unint64_t *)&unk_26B22D710, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25287AC30()
{
  return sub_25287AD78(&qword_26B22D738, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

unint64_t sub_25287AC7C()
{
  unint64_t result = qword_269C2DCD8;
  if (!qword_269C2DCD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C2DCE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DCD8);
  }
  return result;
}

uint64_t sub_25287ACD8()
{
  return sub_25287AD78(&qword_26B22D740, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

uint64_t sub_25287AD20(uint64_t a1)
{
  uint64_t result = sub_25287AD78(qword_269C2D9A0, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_25287AD78(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25287ADC0()
{
  return sub_25287AD78(qword_269C2D9A0, (void (*)(uint64_t))type metadata accessor for HomeXLTileEntity);
}

void *initializeBufferWithCopyOfBuffer for HomeXLTileEntity(void *a1, char *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *(void *)a2;
    *a1 = *(void *)a2;
    a1 = (void *)(v27 + ((v5 + 16) & ~(unint64_t)v5));
    sub_2528974E0();
  }
  else
  {
    uint64_t v7 = sub_2528976E0();
    uint64_t v8 = *(void (**)(void *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = type metadata accessor for ElementID();
    *((unsigned char *)a1 + *(int *)(v9 + 20)) = a2[*(int *)(v9 + 20)];
    v8((void *)((char *)a1 + *(int *)(a3 + 20)), &a2[*(int *)(a3 + 20)], v7);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    id v12 = &a2[v10];
    v8((void *)((char *)a1 + v10), v12, v7);
    v11[*(int *)(v9 + 20)] = v12[*(int *)(v9 + 20)];
    uint64_t v13 = (int *)type metadata accessor for TileElementInfo();
    uint64_t v14 = v13[5];
    uint64_t v15 = &v11[v14];
    unint64_t v16 = &v12[v14];
    uint64_t v18 = *(void *)v16;
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = v18;
    *((void *)v15 + 1) = v17;
    uint64_t v19 = v13[6];
    id v20 = &v11[v19];
    id v21 = &v12[v19];
    uint64_t v22 = *((void *)v21 + 1);
    *(void *)id v20 = *(void *)v21;
    *((void *)v20 + 1) = v22;
    uint64_t v23 = v13[7];
    uint64_t v24 = &v11[v23];
    uint64_t v25 = &v12[v23];
    uint64_t v26 = *((void *)v25 + 1);
    *(void *)uint64_t v24 = *(void *)v25;
    *((void *)v24 + 1) = v26;
    v11[v13[8]] = v12[v13[8]];
    sub_2528974D0();
    sub_2528974D0();
    sub_2528974D0();
  }
  return a1;
}

uint64_t destroy for HomeXLTileEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2528976E0();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  v5(a1 + *(int *)(a2 + 24), v4);
  type metadata accessor for TileElementInfo();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for ElementID();
  *(unsigned char *)(a1 + *(int *)(v8 + 20)) = *(unsigned char *)(a2 + *(int *)(v8 + 20));
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  v7(a1 + v9, v11, v6);
  *(unsigned char *)(v10 + *(int *)(v8 + 20)) = *(unsigned char *)(v11 + *(int *)(v8 + 20));
  id v12 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v13 = v12[5];
  uint64_t v14 = (void *)(v10 + v13);
  uint64_t v15 = (uint64_t *)(v11 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  uint64_t v18 = v12[6];
  uint64_t v19 = (void *)(v10 + v18);
  id v20 = (void *)(v11 + v18);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = v12[7];
  uint64_t v23 = (void *)(v10 + v22);
  uint64_t v24 = (void *)(v11 + v22);
  uint64_t v25 = v24[1];
  void *v23 = *v24;
  v23[1] = v25;
  *(unsigned char *)(v10 + v12[8]) = *(unsigned char *)(v11 + v12[8]);
  sub_2528974D0();
  sub_2528974D0();
  sub_2528974D0();
  return a1;
}

uint64_t assignWithCopy for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for ElementID();
  *(unsigned char *)(a1 + *(int *)(v8 + 20)) = *(unsigned char *)(a2 + *(int *)(v8 + 20));
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  v7(a1 + v9, v11, v6);
  *(unsigned char *)(v10 + *(int *)(v8 + 20)) = *(unsigned char *)(v11 + *(int *)(v8 + 20));
  id v12 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v13 = v12[5];
  uint64_t v14 = (void *)(v10 + v13);
  uint64_t v15 = (void *)(v11 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  sub_2528974D0();
  swift_bridgeObjectRelease();
  uint64_t v16 = v12[6];
  uint64_t v17 = (void *)(v10 + v16);
  uint64_t v18 = (void *)(v11 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  sub_2528974D0();
  swift_bridgeObjectRelease();
  uint64_t v19 = v12[7];
  id v20 = (void *)(v10 + v19);
  uint64_t v21 = (void *)(v11 + v19);
  *id v20 = *v21;
  v20[1] = v21[1];
  sub_2528974D0();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v10 + v12[8]) = *(unsigned char *)(v11 + v12[8]);
  return a1;
}

uint64_t initializeWithTake for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for ElementID();
  *(unsigned char *)(a1 + *(int *)(v8 + 20)) = *(unsigned char *)(a2 + *(int *)(v8 + 20));
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  v7(a1 + v9, v11, v6);
  *(unsigned char *)(v10 + *(int *)(v8 + 20)) = *(unsigned char *)(v11 + *(int *)(v8 + 20));
  id v12 = (int *)type metadata accessor for TileElementInfo();
  *(_OWORD *)(v10 + v12[5]) = *(_OWORD *)(v11 + v12[5]);
  *(_OWORD *)(v10 + v12[6]) = *(_OWORD *)(v11 + v12[6]);
  *(_OWORD *)(v10 + v12[7]) = *(_OWORD *)(v11 + v12[7]);
  *(unsigned char *)(v10 + v12[8]) = *(unsigned char *)(v11 + v12[8]);
  return a1;
}

uint64_t assignWithTake for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for ElementID();
  *(unsigned char *)(a1 + *(int *)(v8 + 20)) = *(unsigned char *)(a2 + *(int *)(v8 + 20));
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  v7(a1 + v9, v11, v6);
  *(unsigned char *)(v10 + *(int *)(v8 + 20)) = *(unsigned char *)(v11 + *(int *)(v8 + 20));
  id v12 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v13 = v12[5];
  uint64_t v14 = (void *)(v10 + v13);
  uint64_t v15 = (uint64_t *)(v11 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = v12[6];
  uint64_t v19 = (void *)(v10 + v18);
  id v20 = (uint64_t *)(v11 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = v12[7];
  uint64_t v24 = (void *)(v10 + v23);
  uint64_t v25 = (uint64_t *)(v11 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  void *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  *(unsigned char *)(v10 + v12[8]) = *(unsigned char *)(v11 + v12[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25287B5F0);
}

uint64_t sub_25287B5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ElementID();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for HomeID();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for TileElementInfo();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for HomeXLTileEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25287B750);
}

uint64_t sub_25287B750(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ElementID();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = type metadata accessor for HomeID();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for TileElementInfo();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

uint64_t sub_25287B8A8()
{
  uint64_t result = type metadata accessor for ElementID();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2528976E0();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for TileElementInfo();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t static HomeSingleTileConfigurationIntent.attributionBundleIdentifier.getter()
{
  swift_beginAccess();
  uint64_t v0 = *(void *)aComAppleHome_0;
  sub_2528974D0();
  return v0;
}

uint64_t static HomeSingleTileConfigurationIntent.attributionBundleIdentifier.setter(uint64_t a1, uint64_t a2)
{
  *(void *)aComAppleHome_0 = a1;
  *(void *)&aComAppleHome_0[8] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static HomeSingleTileConfigurationIntent.attributionBundleIdentifier.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_25287BAC0()
{
  uint64_t v0 = sub_252897610();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_252897700();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_252897C90();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_252897630();
  __swift_allocate_value_buffer(v6, qword_269C2DCF8);
  __swift_project_value_buffer(v6, (uint64_t)qword_269C2DCF8);
  sub_252897C40();
  sub_2528976F0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F06D18], v0);
  return sub_252897640();
}

uint64_t static HomeSingleTileConfigurationIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25285D358(&qword_269C2D410, MEMORY[0x263F06D40], (uint64_t)qword_269C2DCF8, a1);
}

uint64_t sub_25287BCE8()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_252897610();
  uint64_t v3 = *(void *)(v12[0] - 8);
  MEMORY[0x270FA5388](v12[0]);
  uint64_t v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_252897700();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_252897C90();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_252897630();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = sub_2528973E0();
  __swift_allocate_value_buffer(v10, qword_269C2DD10);
  __swift_project_value_buffer(v10, (uint64_t)qword_269C2DD10);
  sub_252897C40();
  sub_2528976F0();
  (*(void (**)(char *, void, void))(v3 + 104))(v5, *MEMORY[0x263F06D18], v12[0]);
  sub_252897640();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_2528973F0();
}

uint64_t static HomeSingleTileConfigurationIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25285D358(&qword_269C2D418, MEMORY[0x263EFBA28], (uint64_t)qword_269C2DD10, a1);
}

uint64_t HomeSingleTileConfigurationIntent.init(home:item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v70 = a3;
  uint64_t v67 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD28);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v68 = (uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v66 = (char *)&v49 - v6;
  uint64_t v7 = sub_252897500();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v75 = v7;
  uint64_t v76 = v8;
  MEMORY[0x270FA5388](v7);
  char v74 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v73 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  BOOL v72 = (char *)&v49 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v65 = (uint64_t)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v71 = (uint64_t)&v49 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v18 - 8);
  id v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v50 = v20;
  uint64_t v63 = sub_252897610();
  uint64_t v21 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v23 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_252897700();
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = (char *)&v49 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_252897C90();
  MEMORY[0x270FA5388](v27 - 8);
  id v29 = (char *)&v49 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_252897630();
  uint64_t v58 = v30;
  uint64_t v31 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8D0);
  unint64_t v51 = v29;
  sub_252897C40();
  uint64_t v54 = v26;
  sub_2528976F0();
  unsigned int v61 = *MEMORY[0x263F06D18];
  id v32 = *(void (**)(void))(v21 + 104);
  uint64_t v62 = v21 + 104;
  uint64_t v64 = (void (*)(char *, void, uint64_t))v32;
  char v55 = v23;
  v32(v23);
  unint64_t v60 = 0x8000000252899740;
  sub_252897640();
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56);
  uint64_t v57 = v31 + 56;
  uint64_t v59 = v33;
  v33(v20, 1, 1, v30);
  uint64_t v34 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v71, 1, 1, v34);
  uint64_t v35 = sub_252897340();
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56);
  v36(v72, 1, 1, v35);
  v36(v73, 1, 1, v35);
  unsigned int v52 = *MEMORY[0x263EFBDC8];
  uint64_t v37 = *(void (**)(void))(v76 + 104);
  v76 += 104;
  uint64_t v53 = (void (*)(char *, void, uint64_t))v37;
  v37(v74);
  sub_25287CA58((unint64_t *)&qword_269C2D8D8, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
  uint64_t v38 = v50;
  uint64_t v39 = sub_2528973A0();
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD30);
  sub_2528974E0();
  sub_252897C40();
  sub_2528976F0();
  v64(v55, v61, v63);
  sub_252897640();
  v59(v38, 1, 1, v58);
  uint64_t v40 = type metadata accessor for HomeSingleTileEntity();
  uint64_t v41 = v66;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v66, 1, 1, v40);
  v36(v72, 1, 1, v35);
  v36(v73, 1, 1, v35);
  v53(v74, v52, v75);
  sub_25287CA58(&qword_269C2DD38, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
  uint64_t v42 = (uint64_t)v41;
  uint64_t v43 = sub_2528973A0();
  uint64_t v44 = v67;
  uint64_t v45 = v71;
  sub_252871318(v67, v71, &qword_269C2D8A0);
  sub_252871318(v45, v65, &qword_269C2D8A0);
  swift_retain_n();
  sub_2528974E0();
  sub_252897370();
  sub_25285C7C8(v45, &qword_269C2D8A0);
  sub_2528975E0();
  sub_2528975E0();
  uint64_t v46 = v69;
  sub_252871318(v69, v42, &qword_269C2DD28);
  sub_252871318(v42, v68, &qword_269C2DD28);
  sub_2528974E0();
  sub_2528974E0();
  sub_252897370();
  sub_25285C7C8(v42, &qword_269C2DD28);
  sub_25285C7C8(v46, &qword_269C2DD28);
  sub_25285C7C8(v44, &qword_269C2D8A0);
  swift_release_n();
  uint64_t result = swift_release_n();
  unint64_t v48 = v70;
  *uint64_t v70 = v39;
  v48[1] = v43;
  return result;
}

uint64_t HomeSingleTileConfigurationIntent.home.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  MEMORY[0x270FA5388](v2 - 8);
  sub_252871318(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269C2D8A0);
  sub_252897370();
  return sub_25285C7C8(a1, &qword_269C2D8A0);
}

uint64_t HomeSingleTileConfigurationIntent.item.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD28);
  MEMORY[0x270FA5388](v2 - 8);
  sub_252871318(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269C2DD28);
  sub_252897370();
  return sub_25285C7C8(a1, &qword_269C2DD28);
}

uint64_t sub_25287CA58(unint64_t *a1, void (*a2)(uint64_t))
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

double HomeSingleTileConfigurationIntent.init()@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD28);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = type metadata accessor for HomeSingleTileEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  HomeSingleTileConfigurationIntent.init(home:item:)((uint64_t)v7, (uint64_t)v4, (uint64_t *)&v11);
  double result = *(double *)&v11;
  *a1 = v11;
  return result;
}

uint64_t HomeSingleTileConfigurationIntent.home.getter()
{
  return sub_252897360();
}

uint64_t (*HomeSingleTileConfigurationIntent.home.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_252897350();
  return sub_25285EEA8;
}

uint64_t HomeSingleTileConfigurationIntent.$home.getter()
{
  return sub_252897380();
}

uint64_t HomeSingleTileConfigurationIntent.item.getter()
{
  return sub_252897360();
}

uint64_t sub_25287CCC0()
{
  sub_2528974E0();
  sub_2528974E0();
  sub_252897360();
  sub_2528975E0();
  return sub_2528975E0();
}

uint64_t sub_25287CD20(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD28);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v9 - v6;
  sub_252871318(a1, (uint64_t)&v9 - v6, &qword_269C2DD28);
  sub_252871318((uint64_t)v7, (uint64_t)v5, &qword_269C2DD28);
  sub_2528974E0();
  sub_2528974E0();
  sub_252897370();
  sub_25285C7C8((uint64_t)v7, &qword_269C2DD28);
  sub_2528975E0();
  return sub_2528975E0();
}

uint64_t (*HomeSingleTileConfigurationIntent.item.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_252897350();
  return sub_25285EEA8;
}

uint64_t HomeSingleTileConfigurationIntent.$item.getter()
{
  return sub_252897380();
}

uint64_t static HomeSingleTileConfigurationIntent.parameterSummary.getter()
{
  uint64_t v0 = sub_2528975B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBE70], v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD40);
  sub_25287D374();
  sub_252860C78((unint64_t *)&unk_269C2DD48, &qword_269C2DD40);
  sub_252860C78(&qword_269C2D948, &qword_269C2D8D0);
  return sub_2528975E0();
}

uint64_t sub_25287D040@<X0>(uint64_t *a1@<X8>)
{
  sub_2528974E0();
  sub_2528974E0();
  uint64_t v2 = sub_252897380();
  sub_2528975E0();
  uint64_t result = sub_2528975E0();
  *a1 = v2;
  return result;
}

uint64_t sub_25287D09C()
{
  return sub_25287D1EC();
}

uint64_t sub_25287D0B4()
{
  swift_getKeyPath();
  sub_25287D374();
  uint64_t v0 = sub_2528974E0();
  sub_2528975E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAC0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_252899340;
  *(void *)(v1 + 32) = v0;
  sub_252897DF0();
  sub_2528974E0();
  uint64_t v2 = sub_2528974D0();
  sub_2528975E0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_25287D17C@<X0>(uint64_t *a1@<X8>)
{
  sub_2528974E0();
  sub_2528974E0();
  uint64_t v2 = sub_252897380();
  sub_2528975E0();
  uint64_t result = sub_2528975E0();
  *a1 = v2;
  return result;
}

uint64_t sub_25287D1D4()
{
  return sub_25287D1EC();
}

uint64_t sub_25287D1EC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD40);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v10 - v5;
  sub_25287D374();
  sub_2528974F0();
  uint64_t v7 = sub_252860C78((unint64_t *)&unk_269C2DD48, &qword_269C2DD40);
  MEMORY[0x2533BE440](v4, &type metadata for HomeSingleTileConfigurationIntent, v0, v7);
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  MEMORY[0x2533BE430](v6, &type metadata for HomeSingleTileConfigurationIntent, v0, v7);
  return ((uint64_t (*)(char *, uint64_t))v8)(v6, v0);
}

unint64_t sub_25287D374()
{
  unint64_t result = qword_26B22D808;
  if (!qword_26B22D808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D808);
  }
  return result;
}

uint64_t sub_25287D3C8()
{
  swift_getKeyPath();
  sub_25287D374();
  uint64_t v0 = sub_2528974E0();
  sub_2528975E0();
  swift_getKeyPath();
  sub_2528974E0();
  uint64_t v1 = sub_2528974E0();
  sub_2528975E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAC0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_252898D00;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  sub_252897DF0();
  sub_2528974E0();
  uint64_t v3 = sub_2528974D0();
  sub_2528975E0();
  sub_2528975E0();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_25287D4C8()
{
  swift_beginAccess();
  uint64_t v0 = *(void *)aComAppleHome_0;
  sub_2528974D0();
  return v0;
}

uint64_t sub_25287D51C@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D410 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897630();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2DCF8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_25287D5C4()
{
  uint64_t v0 = sub_2528975B0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263EFBE70], v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD40);
  sub_252860C78((unint64_t *)&unk_269C2DD48, &qword_269C2DD40);
  sub_252860C78(&qword_269C2D948, &qword_269C2D8D0);
  return sub_2528975E0();
}

uint64_t sub_25287D764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_25287E284();
  *uint64_t v4 = v2;
  v4[1] = sub_2528603B8;
  return MEMORY[0x270EE1CC8](a2, v5);
}

double sub_25287D810@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD28);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = type metadata accessor for HomeSingleTileEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v4, 1, 1, v9);
  HomeSingleTileConfigurationIntent.init(home:item:)((uint64_t)v7, (uint64_t)v4, (uint64_t *)&v11);
  double result = *(double *)&v11;
  *a1 = v11;
  return result;
}

uint64_t sub_25287D968(uint64_t a1)
{
  unint64_t v2 = sub_25287D374();
  return MEMORY[0x270EE0D28](a1, v2);
}

double HomeSingleTileConfigurationIntent.init(item:)@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD28);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for HomeSingleTileEntity();
  sub_25287DB68(a1 + *(int *)(v10 + 20), (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for HomeID);
  uint64_t v11 = type metadata accessor for SelectedHomeEntity();
  uint64_t v12 = &v9[*(int *)(v11 + 20)];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0xE000000000000000;
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  sub_25287DB68(a1, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HomeSingleTileEntity);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 0, 1, v10);
  HomeSingleTileConfigurationIntent.init(home:item:)((uint64_t)v9, (uint64_t)v6, (uint64_t *)&v14);
  sub_25287DBD0(a1);
  double result = *(double *)&v14;
  *a2 = v14;
  return result;
}

uint64_t sub_25287DB68(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25287DBD0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HomeSingleTileEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void static HomeSingleTileConfigurationIntent.defaultIntent.getter(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD28);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = type metadata accessor for SelectedHomeEntity();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56);
  uint64_t v34 = v12 + 56;
  uint64_t v35 = v13;
  v13(v10, 1, 1, v11);
  uint64_t v14 = type metadata accessor for HomeSingleTileEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 1, 1, v14);
  HomeSingleTileConfigurationIntent.init(home:item:)((uint64_t)v10, (uint64_t)v4, v36);
  uint64_t v15 = v36[0];
  uint64_t v16 = v36[1];
  uint64_t v17 = self;
  id v18 = objc_msgSend(v17, sel_sharedDispatcher);
  id v19 = objc_msgSend(v18, sel_homeManager);

  if (v19)
  {
    uint64_t v33 = v8;
    id v20 = objc_msgSend(v19, sel_homes);
    sub_2528607F8();
    unint64_t v21 = sub_252897DD0();

    if (v21 >> 62)
    {
      sub_2528974D0();
      uint64_t v22 = sub_252898350();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v22 >= 2)
    {
      id v23 = objc_msgSend(v17, sel_sharedDispatcher);
      id v24 = objc_msgSend(v23, sel_home);

      if (v24)
      {
        sub_2528974E0();
        sub_2528974E0();
        id v25 = v24;
        id v26 = objc_msgSend(v25, sel_uniqueIdentifier);
        sub_2528976A0();

        id v27 = objc_msgSend(v25, sel_name);
        uint64_t v28 = sub_252897CB0();
        uint64_t v30 = v29;

        uint64_t v31 = (uint64_t *)&v10[*(int *)(v11 + 20)];
        *uint64_t v31 = v28;
        v31[1] = v30;
        v35(v10, 0, 1, v11);
        sub_252871318((uint64_t)v10, (uint64_t)v33, &qword_269C2D8A0);
        sub_252897370();
        sub_25285C7C8((uint64_t)v10, &qword_269C2D8A0);
        sub_2528975E0();
        sub_2528975E0();
      }
    }
  }
  *a1 = v15;
  a1[1] = v16;
}

unint64_t sub_25287DFB8()
{
  unint64_t result = qword_26B22D810;
  if (!qword_26B22D810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D810);
  }
  return result;
}

unint64_t sub_25287E010()
{
  unint64_t result = qword_26B22D800;
  if (!qword_26B22D800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D800);
  }
  return result;
}

uint64_t sub_25287E064()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for HomeSingleTileConfigurationIntent()
{
  sub_2528975E0();
  return sub_2528975E0();
}

void *_s17HomeWidgetIntents33HomeSingleTileConfigurationIntentVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_2528974E0();
  sub_2528974E0();
  return a1;
}

void *assignWithCopy for HomeSingleTileConfigurationIntent(void *a1, void *a2)
{
  *a1 = *a2;
  sub_2528974E0();
  sub_2528975E0();
  a1[1] = a2[1];
  sub_2528974E0();
  sub_2528975E0();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for HomeSingleTileConfigurationIntent(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  sub_2528975E0();
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeSingleTileConfigurationIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HomeSingleTileConfigurationIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HomeSingleTileConfigurationIntent()
{
  return &type metadata for HomeSingleTileConfigurationIntent;
}

uint64_t sub_25287E248()
{
  return sub_252860C78(&qword_269C2DD58, &qword_269C2DD60);
}

unint64_t sub_25287E284()
{
  unint64_t result = qword_269C2DD68;
  if (!qword_269C2DD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DD68);
  }
  return result;
}

uint64_t HomeID.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2528976E0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t HomeID.init(id:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2528976E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t HomeID.hash(into:)()
{
  sub_2528976E0();
  sub_25287F460((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  return sub_252897C20();
}

uint64_t sub_25287E438()
{
  return 1;
}

uint64_t sub_25287E440()
{
  return sub_252898560();
}

uint64_t sub_25287E484()
{
  return sub_252898540();
}

uint64_t sub_25287E4AC()
{
  return sub_252898560();
}

uint64_t sub_25287E4EC()
{
  return 25705;
}

uint64_t sub_25287E4F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2528984C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_25287E578()
{
  return 0;
}

void sub_25287E584(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_25287E590(uint64_t a1)
{
  unint64_t v2 = sub_25287E77C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25287E5CC(uint64_t a1)
{
  unint64_t v2 = sub_25287E77C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HomeID.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD70);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_25287E77C();
  sub_252898580();
  sub_2528976E0();
  sub_25287F460(&qword_269C2DD80, MEMORY[0x263F07508]);
  sub_252898460();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_25287E77C()
{
  unint64_t result = qword_269C2DD78;
  if (!qword_269C2DD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DD78);
  }
  return result;
}

uint64_t HomeID.hashValue.getter()
{
  return sub_252898560();
}

uint64_t HomeID.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v4 = sub_2528976E0();
  uint64_t v14 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v17 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD88);
  uint64_t v16 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for HomeID();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_25287E77C();
  sub_252898570();
  if (!v2)
  {
    sub_25287F460(&qword_269C2DD90, MEMORY[0x263F07508]);
    sub_252898400();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v17, v4);
    sub_25287ED1C((uint64_t)v11, v15);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_25287EAD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2528976E0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t sub_25287EB40()
{
  return sub_252898560();
}

uint64_t sub_25287EBC8()
{
  sub_2528976E0();
  sub_25287F460((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  return sub_252897C20();
}

uint64_t sub_25287EC4C()
{
  return sub_252898560();
}

uint64_t type metadata accessor for HomeID()
{
  uint64_t result = qword_269C2DDA8;
  if (!qword_269C2DDA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25287ED1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25287ED80@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeID.init(from:)(a1, a2);
}

uint64_t sub_25287ED98(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD70);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_25287E77C();
  sub_252898580();
  sub_2528976E0();
  sub_25287F460(&qword_269C2DD80, MEMORY[0x263F07508]);
  sub_252898460();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t static HomeID.entityIdentifier(for:)@<X0>(char *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD98);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2528976E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252897660();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_25287F0FC((uint64_t)v4);
    uint64_t v9 = type metadata accessor for HomeID();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  else
  {
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v11(v8, v4, v5);
    v11(a1, v8, v5);
    uint64_t v12 = type metadata accessor for HomeID();
    return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 0, 1, v12);
  }
}

uint64_t sub_25287F0FC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25287F160@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD98);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2528976E0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252897660();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_25287F0FC((uint64_t)v6);
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v12(v10, v6, v7);
    v12(a2, v10, v7);
    uint64_t v11 = 0;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56))(a2, v11, 1, a1);
}

uint64_t HomeID.debugDescription.getter()
{
  return 0x3A4449656D6F48;
}

uint64_t sub_25287F374()
{
  return 0x3A4449656D6F48;
}

uint64_t sub_25287F3D0()
{
  return sub_25287F460((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
}

uint64_t sub_25287F418()
{
  return sub_25287F460(&qword_269C2DDA0, (void (*)(uint64_t))type metadata accessor for HomeID);
}

uint64_t sub_25287F460(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t initializeBufferWithCopyOfBuffer for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2528976E0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for ElementID(uint64_t a1)
{
  uint64_t v2 = sub_2528976E0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for HomeID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25287F71C);
}

uint64_t sub_25287F71C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2528976E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for HomeID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25287F79C);
}

uint64_t sub_25287F79C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2528976E0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_25287F80C()
{
  uint64_t result = sub_2528976E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HomeID.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for HomeID.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25287F98CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25287F9B4()
{
  return 0;
}

ValueMetadata *type metadata accessor for HomeID.CodingKeys()
{
  return &type metadata for HomeID.CodingKeys;
}

unint64_t sub_25287F9D0()
{
  unint64_t result = qword_269C2DDB8;
  if (!qword_269C2DDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DDB8);
  }
  return result;
}

unint64_t sub_25287FA28()
{
  unint64_t result = qword_269C2DDC0;
  if (!qword_269C2DDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DDC0);
  }
  return result;
}

unint64_t sub_25287FA80()
{
  unint64_t result = qword_269C2DDC8;
  if (!qword_269C2DDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DDC8);
  }
  return result;
}

uint64_t sub_25287FADC()
{
  uint64_t v0 = sub_252897590();
  __swift_allocate_value_buffer(v0, qword_269C2DDD0);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C2DDD0);
  return sub_252897580();
}

uint64_t static RecommendedMode.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D420 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897590();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2DDD0);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t RecommendedMode.id.getter(char a1)
{
  if (!a1) {
    return 7105633;
  }
  if (a1 == 1) {
    return 0x73656E656373;
  }
  return 0x726F737365636361;
}

uint64_t RecommendedMode.rawValue.getter(char a1)
{
  if (!a1) {
    return 7105633;
  }
  if (a1 == 1) {
    return 0x73656E656373;
  }
  return 0x726F737365636361;
}

unint64_t sub_25287FC9C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE00);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE08);
  uint64_t v6 = sub_252898380();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  sub_2528974E0();
  while (1)
  {
    sub_252881010(v12, (uint64_t)v5);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_2528695F4(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_252897490();
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
    {
      sub_2528975E0();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void *static RecommendedMode.allCases.getter()
{
  return &unk_2702CCBD0;
}

uint64_t sub_25287FE9C(unsigned char *a1, unsigned char *a2)
{
  int v2 = *a1;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = 0x73656E656373;
  if (v2 != 1)
  {
    uint64_t v4 = 0x726F737365636361;
    unint64_t v3 = 0xEB00000000736569;
  }
  if (*a1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 7105633;
  }
  if (v2) {
    unint64_t v6 = v3;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  unint64_t v7 = 0xE600000000000000;
  uint64_t v8 = 0x73656E656373;
  if (*a2 != 1)
  {
    uint64_t v8 = 0x726F737365636361;
    unint64_t v7 = 0xEB00000000736569;
  }
  if (*a2) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 7105633;
  }
  if (*a2) {
    unint64_t v10 = v7;
  }
  else {
    unint64_t v10 = 0xE300000000000000;
  }
  if (v5 == v9 && v6 == v10) {
    char v11 = 1;
  }
  else {
    char v11 = sub_2528984C0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_25287FFA4()
{
  return sub_252898560();
}

uint64_t sub_252880044()
{
  sub_252897CE0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2528800D0()
{
  return sub_252898560();
}

uint64_t sub_25288016C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s17HomeWidgetIntents15RecommendedModeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_25288019C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE300000000000000;
  unint64_t v4 = 0xE600000000000000;
  uint64_t v5 = 0x73656E656373;
  if (v2 != 1)
  {
    uint64_t v5 = 0x726F737365636361;
    unint64_t v4 = 0xEB00000000736569;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 7105633;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2528801F8@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D420 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897590();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2DDD0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_2528802A0(uint64_t a1)
{
  unint64_t v2 = sub_25285DEA8();
  return MEMORY[0x270EE0C40](a1, v2);
}

uint64_t sub_2528802F0(uint64_t a1)
{
  unint64_t v2 = sub_252880C54();
  return MEMORY[0x270EE1C28](a1, v2);
}

void sub_25288033C(void *a1@<X8>)
{
  *a1 = &unk_2702CCBF8;
}

unint64_t _s17HomeWidgetIntents15RecommendedModeO26caseDisplayRepresentationsSDyAC03AppC00G14RepresentationVGvgZ_0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA50);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v43 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v33 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_252897610();
  uint64_t v37 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_252897700();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_252897C90();
  MEMORY[0x270FA5388](v9 - 8);
  char v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_252897630();
  uint64_t v44 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DDF8);
  uint64_t v12 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE00) - 8);
  uint64_t v13 = *(void *)(*(void *)v12 + 72);
  unint64_t v14 = (*(unsigned __int8 *)(*(void *)v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v12 + 80);
  uint64_t v32 = 2 * v13;
  uint64_t v15 = swift_allocObject();
  uint64_t v34 = v15;
  *(_OWORD *)(v15 + 16) = xmmword_252899330;
  unint64_t v31 = v15 + v14;
  unint64_t v29 = v15 + v14 + v12[14];
  *(unsigned char *)(v15 + v14) = 0;
  id v27 = v11;
  sub_252897C40();
  sub_2528976F0();
  uint64_t v16 = *MEMORY[0x263F06D18];
  unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  uint64_t v30 = v5 + 104;
  uint64_t v42 = v17;
  unsigned int v28 = v16;
  v17(v7, v16, v4);
  unint64_t v40 = 0x8000000252899E90;
  sub_252897640();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56);
  v44 += 56;
  uint64_t v39 = v18;
  uint64_t v19 = v33;
  v18(v33, 1, 1, v41);
  uint64_t v36 = sub_252897470();
  uint64_t v20 = *(void *)(v36 - 8);
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  uint64_t v38 = v20 + 56;
  v35(v43, 1, 1, v36);
  sub_252897480();
  unint64_t v21 = v31;
  unint64_t v29 = v31 + v13 + v12[14];
  *(unsigned char *)(v31 + v13) = 1;
  sub_252897C40();
  sub_2528976F0();
  v42(v7, v16, v37);
  sub_252897640();
  uint64_t v22 = v19;
  id v23 = v19;
  uint64_t v24 = v41;
  v39(v23, 1, 1, v41);
  id v25 = v43;
  v35(v43, 1, 1, v36);
  sub_252897480();
  *(unsigned char *)(v21 + v32) = 2;
  sub_252897C40();
  sub_2528976F0();
  v42(v7, v28, v37);
  sub_252897640();
  v39(v22, 1, 1, v24);
  v35(v25, 1, 1, v36);
  sub_252897480();
  return sub_25287FC9C(v34);
}

uint64_t _s17HomeWidgetIntents15RecommendedModeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_2528983A0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_2528809D4()
{
  unint64_t result = qword_26B22D858;
  if (!qword_26B22D858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D858);
  }
  return result;
}

unint64_t sub_252880A2C()
{
  unint64_t result = qword_26B22D818;
  if (!qword_26B22D818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D818);
  }
  return result;
}

unint64_t sub_252880A84()
{
  unint64_t result = qword_26B22D840;
  if (!qword_26B22D840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D840);
  }
  return result;
}

unint64_t sub_252880ADC()
{
  unint64_t result = qword_26B22D860;
  if (!qword_26B22D860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D860);
  }
  return result;
}

uint64_t sub_252880B30()
{
  return MEMORY[0x263F8D380];
}

uint64_t sub_252880B3C()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_252880B4C()
{
  unint64_t result = qword_26B22D830;
  if (!qword_26B22D830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D830);
  }
  return result;
}

unint64_t sub_252880BA4()
{
  unint64_t result = qword_26B22D838;
  if (!qword_26B22D838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D838);
  }
  return result;
}

unint64_t sub_252880BFC()
{
  unint64_t result = qword_26B22D820;
  if (!qword_26B22D820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D820);
  }
  return result;
}

unint64_t sub_252880C54()
{
  unint64_t result = qword_26B22D828;
  if (!qword_26B22D828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D828);
  }
  return result;
}

uint64_t sub_252880CA8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_252880CFC()
{
  unint64_t result = qword_26B22D848;
  if (!qword_26B22D848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D848);
  }
  return result;
}

unint64_t sub_252880D54()
{
  unint64_t result = qword_26B22D868;
  if (!qword_26B22D868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D868);
  }
  return result;
}

unint64_t sub_252880DAC()
{
  unint64_t result = qword_26B22D850;
  if (!qword_26B22D850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D850);
  }
  return result;
}

unint64_t sub_252880E04()
{
  unint64_t result = qword_269C2DDE8;
  if (!qword_269C2DDE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C2DDF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DDE8);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecommendedMode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RecommendedMode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x252880FC8);
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

uint64_t sub_252880FF0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_252880FF8(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RecommendedMode()
{
  return &type metadata for RecommendedMode;
}

uint64_t sub_252881010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_252881078(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE68);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TileElementInfo();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v30 = (uint64_t)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v28 = (uint64_t)&v24 - v14;
  uint64_t v15 = *(void *)(a3 + 16);
  if (!v15) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v16 = *(void *)(type metadata accessor for ElementID() - 8);
  uint64_t v17 = a3 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  uint64_t v25 = v11;
  uint64_t v18 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  uint64_t v29 = *(void *)(v16 + 72);
  uint64_t v24 = a3;
  sub_2528974D0();
  unint64_t v19 = MEMORY[0x263F8EE78];
  uint64_t v26 = v10;
  uint64_t v27 = a2;
  do
  {
    a1(v17);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v19;
    }
    if ((*v18)(v9, 1, v10) == 1)
    {
      sub_25285C7C8((uint64_t)v9, &qword_269C2DE68);
    }
    else
    {
      uint64_t v20 = v28;
      sub_252888E68((uint64_t)v9, v28, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
      sub_252888E68(v20, v30, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v19 = sub_2528681E8(0, *(void *)(v19 + 16) + 1, 1, v19);
      }
      unint64_t v22 = *(void *)(v19 + 16);
      unint64_t v21 = *(void *)(v19 + 24);
      if (v22 >= v21 >> 1) {
        unint64_t v19 = sub_2528681E8(v21 > 1, v22 + 1, 1, v19);
      }
      *(void *)(v19 + 16) = v22 + 1;
      sub_252888E68(v30, v19+ ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80))+ *(void *)(v25 + 72) * v22, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
      uint64_t v10 = v26;
    }
    v17 += v29;
    --v15;
  }
  while (v15);
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t TileElementInfo.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252886B2C(v1, a1, (uint64_t (*)(void))type metadata accessor for ElementID);
}

uint64_t TileElementInfo.displayName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TileElementInfo() + 20));
  sub_2528974D0();
  return v1;
}

uint64_t TileElementInfo.iconSymbol.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TileElementInfo() + 24));
  sub_2528974D0();
  return v1;
}

uint64_t TileElementInfo.roomName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for TileElementInfo() + 28));
  sub_2528974D0();
  return v1;
}

uint64_t TileElementInfo.isScene.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for TileElementInfo() + 32));
}

uint64_t sub_2528814C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_252897A90();
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_252897AA0();
  uint64_t v36 = *(void *)(v6 - 8);
  uint64_t v37 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE78);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_252897A60();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v17 = *((void *)v16 - 1);
  MEMORY[0x270FA5388](v16);
  unint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = a1;
  sub_252871318(a1, (uint64_t)v11, &qword_269C2DE78);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_25285C7C8(v40, &qword_269C2DE78);
    sub_25285C7C8((uint64_t)v11, &qword_269C2DE78);
    uint64_t v20 = 1;
    uint64_t v21 = v41;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    sub_252897A20();
    v19[*(int *)(type metadata accessor for ElementID() + 20)] = 5;
    uint64_t v22 = sub_252897A30();
    id v23 = (uint64_t *)&v19[v16[5]];
    uint64_t *v23 = v22;
    v23[1] = v24;
    sub_252897A50();
    sub_252897A70();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
    uint64_t v25 = sub_252897A80();
    uint64_t v27 = v26;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
    uint64_t v28 = (uint64_t *)&v19[v16[6]];
    *uint64_t v28 = v25;
    v28[1] = v27;
    uint64_t v29 = sub_252897A40();
    uint64_t v31 = v30;
    sub_25285C7C8(v40, &qword_269C2DE78);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v32 = (uint64_t *)&v19[v16[7]];
    *uint64_t v32 = v29;
    v32[1] = v31;
    v19[v16[8]] = 0;
    uint64_t v33 = (uint64_t)v19;
    uint64_t v34 = v41;
    sub_252888E68(v33, v41, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    uint64_t v20 = 0;
    uint64_t v21 = v34;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v17 + 56))(v21, v20, 1, v16);
}

uint64_t sub_2528818DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_252897A90();
  uint64_t v37 = *(void *)(v3 - 8);
  uint64_t v38 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v34 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_252897AA0();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE98);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_252897910();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v16 = *((void *)v15 - 1);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = a1;
  sub_252871318(a1, (uint64_t)v10, &qword_269C2DE98);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_25285C7C8(v39, &qword_269C2DE98);
    sub_25285C7C8((uint64_t)v10, &qword_269C2DE98);
    uint64_t v19 = 1;
    uint64_t v20 = v40;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    sub_2528978E0();
    v18[*(int *)(type metadata accessor for ElementID() + 20)] = 1;
    uint64_t v21 = sub_2528978F0();
    uint64_t v22 = (uint64_t *)&v18[v15[5]];
    *uint64_t v22 = v21;
    v22[1] = v23;
    sub_252897900();
    uint64_t v24 = v34;
    sub_252897A70();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v36);
    uint64_t v25 = sub_252897A80();
    uint64_t v27 = v26;
    sub_25285C7C8(v39, &qword_269C2DE98);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v38);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v28 = (uint64_t *)&v18[v15[6]];
    *uint64_t v28 = v25;
    v28[1] = v27;
    uint64_t v29 = &v18[v15[7]];
    *(void *)uint64_t v29 = 0;
    *((void *)v29 + 1) = 0;
    v18[v15[8]] = 1;
    uint64_t v30 = (uint64_t)v18;
    uint64_t v31 = v40;
    sub_252888E68(v30, v40, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    uint64_t v19 = 0;
    uint64_t v20 = v31;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v16 + 56))(v20, v19, 1, v15);
}

uint64_t sub_252881CF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_252897A90();
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_252897AA0();
  uint64_t v36 = *(void *)(v6 - 8);
  uint64_t v37 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE80);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_252897850();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v17 = *((void *)v16 - 1);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = a1;
  sub_252871318(a1, (uint64_t)v11, &qword_269C2DE80);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_25285C7C8(v40, &qword_269C2DE80);
    sub_25285C7C8((uint64_t)v11, &qword_269C2DE80);
    uint64_t v20 = 1;
    uint64_t v21 = v41;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    sub_252897810();
    v19[*(int *)(type metadata accessor for ElementID() + 20)] = 4;
    uint64_t v22 = sub_252897820();
    uint64_t v23 = (uint64_t *)&v19[v16[5]];
    uint64_t *v23 = v22;
    v23[1] = v24;
    sub_252897840();
    sub_252897A70();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
    uint64_t v25 = sub_252897A80();
    uint64_t v27 = v26;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
    uint64_t v28 = (uint64_t *)&v19[v16[6]];
    *uint64_t v28 = v25;
    v28[1] = v27;
    uint64_t v29 = sub_252897830();
    uint64_t v31 = v30;
    sub_25285C7C8(v40, &qword_269C2DE80);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v32 = (uint64_t *)&v19[v16[7]];
    *uint64_t v32 = v29;
    v32[1] = v31;
    v19[v16[8]] = 0;
    uint64_t v33 = (uint64_t)v19;
    uint64_t v34 = v41;
    sub_252888E68(v33, v41, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    uint64_t v20 = 0;
    uint64_t v21 = v34;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v17 + 56))(v21, v20, 1, v16);
}

uint64_t sub_252882108@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_252897A90();
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_252897AA0();
  uint64_t v36 = *(void *)(v6 - 8);
  uint64_t v37 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DEA0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2528978D0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v17 = *((void *)v16 - 1);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = a1;
  sub_252871318(a1, (uint64_t)v11, &qword_269C2DEA0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_25285C7C8(v40, &qword_269C2DEA0);
    sub_25285C7C8((uint64_t)v11, &qword_269C2DEA0);
    uint64_t v20 = 1;
    uint64_t v21 = v41;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    sub_252897890();
    v19[*(int *)(type metadata accessor for ElementID() + 20)] = 0;
    uint64_t v22 = sub_2528978A0();
    uint64_t v23 = (uint64_t *)&v19[v16[5]];
    uint64_t *v23 = v22;
    v23[1] = v24;
    sub_2528978C0();
    sub_252897A70();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
    uint64_t v25 = sub_252897A80();
    uint64_t v27 = v26;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
    uint64_t v28 = (uint64_t *)&v19[v16[6]];
    *uint64_t v28 = v25;
    v28[1] = v27;
    uint64_t v29 = sub_2528978B0();
    uint64_t v31 = v30;
    sub_25285C7C8(v40, &qword_269C2DEA0);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v32 = (uint64_t *)&v19[v16[7]];
    *uint64_t v32 = v29;
    v32[1] = v31;
    v19[v16[8]] = 0;
    uint64_t v33 = (uint64_t)v19;
    uint64_t v34 = v41;
    sub_252888E68(v33, v41, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    uint64_t v20 = 0;
    uint64_t v21 = v34;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v17 + 56))(v21, v20, 1, v16);
}

uint64_t sub_25288251C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_252897A90();
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_252897AA0();
  uint64_t v36 = *(void *)(v6 - 8);
  uint64_t v37 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE70);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2528979C0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v17 = *((void *)v16 - 1);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = a1;
  sub_252871318(a1, (uint64_t)v11, &qword_269C2DE70);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_25285C7C8(v40, &qword_269C2DE70);
    sub_25285C7C8((uint64_t)v11, &qword_269C2DE70);
    uint64_t v20 = 1;
    uint64_t v21 = v41;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    sub_252897990();
    sub_25285CC3C();
    v19[*(int *)(type metadata accessor for ElementID() + 20)] = 6;
    uint64_t v22 = sub_252897970();
    uint64_t v23 = (uint64_t *)&v19[v16[5]];
    uint64_t *v23 = v22;
    v23[1] = v24;
    sub_2528979B0();
    sub_252897A70();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
    uint64_t v25 = sub_252897A80();
    uint64_t v27 = v26;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v5, v39);
    uint64_t v28 = (uint64_t *)&v19[v16[6]];
    *uint64_t v28 = v25;
    v28[1] = v27;
    uint64_t v29 = sub_2528979A0();
    uint64_t v31 = v30;
    sub_25285C7C8(v40, &qword_269C2DE70);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    uint64_t v32 = (uint64_t *)&v19[v16[7]];
    *uint64_t v32 = v29;
    v32[1] = v31;
    v19[v16[8]] = 0;
    uint64_t v33 = (uint64_t)v19;
    uint64_t v34 = v41;
    sub_252888E68(v33, v41, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    uint64_t v20 = 0;
    uint64_t v21 = v34;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v17 + 56))(v21, v20, 1, v16);
}

uint64_t sub_252882940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE88);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_252897960();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v12 = *((void *)v11 - 1);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252871318(a1, (uint64_t)v6, &qword_269C2DE88);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_25285C7C8(a1, &qword_269C2DE88);
    sub_25285C7C8((uint64_t)v6, &qword_269C2DE88);
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_252897930();
    v14[*(int *)(type metadata accessor for ElementID() + 20)] = 3;
    uint64_t v16 = sub_252897940();
    uint64_t v17 = (uint64_t *)&v14[v11[5]];
    *uint64_t v17 = v16;
    v17[1] = v18;
    uint64_t v19 = sub_252897950();
    uint64_t v20 = (uint64_t *)&v14[v11[7]];
    *uint64_t v20 = v19;
    v20[1] = v21;
    uint64_t v22 = sub_252897920();
    uint64_t v24 = v23;
    sub_25285C7C8(a1, &qword_269C2DE88);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v25 = (uint64_t *)&v14[v11[6]];
    *uint64_t v25 = v22;
    v25[1] = v24;
    v14[v11[8]] = 0;
    sub_252888E68((uint64_t)v14, a2, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    uint64_t v15 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v12 + 56))(a2, v15, 1, v11);
}

uint64_t sub_252882C08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE90);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_252897A10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v12 = *((void *)v11 - 1);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_252871318(a1, (uint64_t)v6, &qword_269C2DE90);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_25285C7C8(a1, &qword_269C2DE90);
    sub_25285C7C8((uint64_t)v6, &qword_269C2DE90);
    uint64_t v15 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_2528979E0();
    v14[*(int *)(type metadata accessor for ElementID() + 20)] = 2;
    uint64_t v16 = sub_2528979F0();
    uint64_t v17 = (uint64_t *)&v14[v11[5]];
    *uint64_t v17 = v16;
    v17[1] = v18;
    uint64_t v19 = sub_2528979D0();
    uint64_t v20 = (uint64_t *)&v14[v11[6]];
    *uint64_t v20 = v19;
    v20[1] = v21;
    uint64_t v22 = sub_252897A00();
    uint64_t v24 = v23;
    sub_25285C7C8(a1, &qword_269C2DE90);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v25 = (uint64_t *)&v14[v11[7]];
    *uint64_t v25 = v22;
    v25[1] = v24;
    v14[v11[8]] = 0;
    sub_252888E68((uint64_t)v14, a2, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
    uint64_t v15 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v12 + 56))(a2, v15, 1, v11);
}

uint64_t sub_252882ED0@<X0>(uint64_t a1@<X0>, void *a2@<X2>, uint64_t a3@<X8>)
{
  id v81 = a2;
  uint64_t v82 = a3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE70);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE78);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE80);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE88);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE90);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE98);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DEA0);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v81 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(*(unsigned char *)(a1 + *(int *)(type metadata accessor for ElementID() + 20)))
  {
    case 1:
      uint64_t v32 = sub_2528977B0();
      if (*(void *)(v32 + 16) && (unint64_t v33 = sub_2528694B8(a1), (v34 & 1) != 0))
      {
        unint64_t v35 = v33;
        uint64_t v36 = *(void *)(v32 + 56);
        uint64_t v37 = sub_252897910();
        uint64_t v38 = *(void *)(v37 - 8);
        (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v21, v36 + *(void *)(v38 + 72) * v35, v37);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(v21, 0, 1, v37);
      }
      else
      {
        uint64_t v72 = sub_252897910();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v21, 1, 1, v72);
      }
      swift_bridgeObjectRelease();
      uint64_t result = sub_2528818DC((uint64_t)v21, v82);
      break;
    case 2:
      uint64_t v39 = sub_2528977E0();
      if (*(void *)(v39 + 16) && (unint64_t v40 = sub_2528694B8(a1), (v41 & 1) != 0))
      {
        unint64_t v42 = v40;
        uint64_t v43 = *(void *)(v39 + 56);
        uint64_t v44 = sub_252897A10();
        uint64_t v45 = *(void *)(v44 - 8);
        (*(void (**)(char *, unint64_t, uint64_t))(v45 + 16))(v18, v43 + *(void *)(v45 + 72) * v42, v44);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v45 + 56))(v18, 0, 1, v44);
      }
      else
      {
        uint64_t v73 = sub_252897A10();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v18, 1, 1, v73);
      }
      swift_bridgeObjectRelease();
      uint64_t result = sub_252882C08((uint64_t)v18, v82);
      break;
    case 3:
      uint64_t v46 = sub_2528977D0();
      if (*(void *)(v46 + 16) && (unint64_t v47 = sub_2528694B8(a1), (v48 & 1) != 0))
      {
        unint64_t v49 = v47;
        uint64_t v50 = *(void *)(v46 + 56);
        uint64_t v51 = sub_252897960();
        uint64_t v52 = *(void *)(v51 - 8);
        (*(void (**)(char *, unint64_t, uint64_t))(v52 + 16))(v15, v50 + *(void *)(v52 + 72) * v49, v51);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56))(v15, 0, 1, v51);
      }
      else
      {
        uint64_t v74 = sub_252897960();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v15, 1, 1, v74);
      }
      uint64_t v75 = v82;
      swift_bridgeObjectRelease();
      uint64_t result = sub_252882940((uint64_t)v15, v75);
      break;
    case 4:
      uint64_t v53 = sub_2528977A0();
      if (*(void *)(v53 + 16) && (unint64_t v54 = sub_2528694B8(a1), (v55 & 1) != 0))
      {
        unint64_t v56 = v54;
        uint64_t v57 = *(void *)(v53 + 56);
        uint64_t v58 = sub_252897850();
        uint64_t v59 = *(void *)(v58 - 8);
        (*(void (**)(char *, unint64_t, uint64_t))(v59 + 16))(v12, v57 + *(void *)(v59 + 72) * v56, v58);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v12, 0, 1, v58);
      }
      else
      {
        uint64_t v76 = sub_252897850();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v12, 1, 1, v76);
      }
      uint64_t v77 = v82;
      swift_bridgeObjectRelease();
      uint64_t result = sub_252881CF0((uint64_t)v12, v77);
      break;
    case 5:
      uint64_t v60 = sub_2528977F0();
      if (*(void *)(v60 + 16) && (unint64_t v61 = sub_2528694B8(a1), (v62 & 1) != 0))
      {
        unint64_t v63 = v61;
        uint64_t v64 = *(void *)(v60 + 56);
        uint64_t v65 = sub_252897A60();
        uint64_t v66 = *(void *)(v65 - 8);
        (*(void (**)(char *, unint64_t, uint64_t))(v66 + 16))(v9, v64 + *(void *)(v66 + 72) * v63, v65);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v9, 0, 1, v65);
      }
      else
      {
        uint64_t v78 = sub_252897A60();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v78 - 8) + 56))(v9, 1, 1, v78);
      }
      uint64_t v79 = v82;
      swift_bridgeObjectRelease();
      uint64_t result = sub_2528814C4((uint64_t)v9, v79);
      break;
    case 6:
      if (sub_25285CCC8() == 0xDEFFDEED00000000) {
        unint64_t v67 = sub_25285CCE4();
      }
      else {
        unint64_t v67 = 0;
      }
      uint64_t v80 = v82;
      sub_2528838F0(v81, v67, v6);
      uint64_t result = sub_25288251C((uint64_t)v6, v80);
      break;
    case 7:
      uint64_t v68 = type metadata accessor for TileElementInfo();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v82, 1, 1, v68);
      break;
    default:
      uint64_t v25 = sub_2528977C0();
      if (*(void *)(v25 + 16) && (unint64_t v26 = sub_2528694B8(a1), (v27 & 1) != 0))
      {
        unint64_t v28 = v26;
        uint64_t v29 = *(void *)(v25 + 56);
        uint64_t v30 = sub_2528978D0();
        uint64_t v31 = *(void *)(v30 - 8);
        (*(void (**)(char *, unint64_t, uint64_t))(v31 + 16))(v24, v29 + *(void *)(v31 + 72) * v28, v30);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v24, 0, 1, v30);
      }
      else
      {
        uint64_t v70 = sub_2528978D0();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v24, 1, 1, v70);
      }
      uint64_t v71 = v82;
      swift_bridgeObjectRelease();
      uint64_t result = sub_252882108((uint64_t)v24, v71);
      break;
  }
  return result;
}

uint64_t sub_2528838F0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v41[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE70);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = sub_252898070();
  unint64_t v10 = v9;
  v41[0] = MEMORY[0x263F8EE78];
  if (v9 >> 62)
  {
    uint64_t v11 = sub_252898350();
    if (v11) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
    if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_18;
  }
  uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v11) {
    goto LABEL_17;
  }
LABEL_3:
  if (v11 < 1)
  {
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v39 = a1;
  uint64_t v12 = a3;
  for (uint64_t i = 0; i != v11; ++i)
  {
    if ((v10 & 0xC000000000000001) != 0) {
      id v14 = (id)MEMORY[0x2533BF180](i, v10);
    }
    else {
      id v14 = *(id *)(v10 + 8 * i + 32);
    }
    uint64_t v15 = v14;
    uint64_t v16 = sub_252897F70();
    if (v17)
    {
      if (a2) {
        goto LABEL_6;
      }
    }
    else if (v16 != a2)
    {
LABEL_6:

      continue;
    }
    sub_2528982B0();
    sub_2528982F0();
    sub_252898300();
    sub_2528982C0();
  }
  swift_bridgeObjectRelease();
  uint64_t v11 = v41[0];
  a3 = v12;
  a1 = v39;
  if ((v41[0] & 0x8000000000000000) == 0)
  {
LABEL_18:
    if ((v11 & 0x4000000000000000) != 0) {
      goto LABEL_28;
    }
    if (*(void *)(v11 + 16)) {
      goto LABEL_20;
    }
LABEL_29:
    sub_2528975E0();
    unint64_t v10 = 0;
LABEL_30:
    if (qword_269C2D3F0 != -1) {
      goto LABEL_41;
    }
    goto LABEL_31;
  }
LABEL_28:
  sub_2528974D0();
  uint64_t v23 = sub_252898350();
  sub_2528975E0();
  if (!v23) {
    goto LABEL_29;
  }
LABEL_20:
  if ((v11 & 0xC000000000000001) == 0)
  {
    if (*(void *)(v11 + 16))
    {
      id v18 = *(id *)(v11 + 32);
      goto LABEL_23;
    }
    __break(1u);
LABEL_41:
    swift_once();
LABEL_31:
    uint64_t v24 = sub_252897B80();
    __swift_project_value_buffer(v24, (uint64_t)qword_269C2E278);
    id v25 = (id)v10;
    id v26 = a1;
    id v27 = v25;
    id v28 = v26;
    uint64_t v29 = sub_252897B60();
    os_log_type_t v30 = sub_252897FB0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v39 = a3;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      v41[0] = v38;
      *(_DWORD *)uint64_t v31 = 136315906;
      uint64_t v40 = sub_252868708(0x6D6F682874696E69, 0xEE00293A64693A65, v41);
      sub_2528980D0();
      *(_WORD *)(v31 + 12) = 2112;
      uint64_t v40 = (uint64_t)v28;
      id v32 = v28;
      unint64_t v33 = (void *)v37;
      sub_2528980D0();
      *unint64_t v33 = v28;

      *(_WORD *)(v31 + 22) = 2048;
      uint64_t v40 = a2;
      sub_2528980D0();
      *(_WORD *)(v31 + 32) = 2112;
      if (v10)
      {
        uint64_t v40 = (uint64_t)v27;
        id v34 = v27;
      }
      else
      {
        uint64_t v40 = 0;
      }
      sub_2528980D0();
      v33[1] = v10;

      _os_log_impl(&dword_252856000, v29, v30, "%s home=%@ StaticMatterDevice failed to get matter device for id=%llu, accessory=%@", (uint8_t *)v31, 0x2Au);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D578);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v33, -1, -1);
      uint64_t v35 = v38;
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v35, -1, -1);
      MEMORY[0x2533BFA60](v31, -1, -1);

      a3 = v39;
    }
    else
    {
    }
LABEL_37:
    uint64_t v36 = sub_2528979C0();
    return (*(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(a3, 1, 1, v36);
  }
LABEL_39:
  id v18 = (id)MEMORY[0x2533BF180](0, v11);
LABEL_23:
  uint64_t v19 = v18;
  sub_2528975E0();
  unint64_t v10 = v19;
  if (!sub_252897F60())
  {

    goto LABEL_30;
  }
  sub_252897980();

  uint64_t v20 = sub_2528979C0();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v8, 1, v20))
  {
    sub_25285C7C8((uint64_t)v8, &qword_269C2DE70);
    goto LABEL_37;
  }
  (*(void (**)(void *, char *, uint64_t))(v21 + 32))(a3, v8, v20);
  return (*(uint64_t (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(a3, 0, 1, v20);
}

uint64_t sub_252883ECC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_2528976E0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252883F8C, 0, 0);
}

uint64_t sub_252883F8C()
{
  v0[7] = sub_252897790();
  v0[8] = sub_252897E80();
  v0[9] = sub_252897E70();
  uint64_t v2 = sub_252897E60();
  return MEMORY[0x270FA2498](sub_252884030, v2, v1);
}

uint64_t sub_252884030()
{
  sub_2528975E0();
  *(void *)(v0 + 80) = sub_252897770();
  return MEMORY[0x270FA2498](sub_2528840A4, 0, 0);
}

uint64_t sub_2528840A4()
{
  id v1 = objc_msgSend(*(id *)(v0 + 24), sel_uniqueIdentifier);
  sub_2528976A0();

  *(void *)(v0 + 88) = sub_252897E70();
  uint64_t v3 = sub_252897E60();
  return MEMORY[0x270FA2498](sub_252884164, v3, v2);
}

uint64_t sub_252884164()
{
  id v1 = *(void **)(v0 + 80);
  sub_2528975E0();
  *(void *)(v0 + 96) = sub_252897760();

  return MEMORY[0x270FA2498](sub_2528841D8, 0, 0);
}

uint64_t sub_2528841D8()
{
  if (*(void *)(v0[12] + 16) && (unint64_t v1 = sub_2528694B8(v0[6]), (v2 & 1) != 0))
  {
    unint64_t v3 = v1;
    uint64_t v4 = v0[2];
    uint64_t v5 = *(void *)(v0[12] + 56);
    uint64_t v6 = sub_252897800();
    uint64_t v7 = *(void *)(v6 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v7 + 16))(v4, v5 + *(void *)(v7 + 72) * v3, v6);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = sub_252897800();
    uint64_t v7 = *(void *)(v6 - 8);
    uint64_t v8 = 1;
  }
  uint64_t v10 = v0[5];
  uint64_t v9 = v0[6];
  uint64_t v11 = v0[4];
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v7 + 56))(v0[2], v8, 1, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t TileElementInfo.hash(into:)()
{
  sub_2528976E0();
  sub_252886C84((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  sub_252897C20();
  type metadata accessor for ElementID();
  sub_252898540();
  uint64_t v1 = type metadata accessor for TileElementInfo();
  sub_2528974D0();
  sub_252897CE0();
  swift_bridgeObjectRelease();
  sub_2528974D0();
  sub_252897CE0();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + *(int *)(v1 + 28) + 8))
  {
    sub_252898550();
    sub_2528974D0();
    sub_252897CE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_252898550();
  }
  return sub_252898550();
}

BOOL sub_2528844D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2528844EC()
{
  return sub_252898560();
}

uint64_t sub_252884534()
{
  return sub_252898540();
}

uint64_t sub_252884560()
{
  return sub_252898560();
}

uint64_t sub_2528845A4()
{
  uint64_t result = 25705;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x4E79616C70736964;
      break;
    case 2:
      uint64_t result = 0x626D79536E6F6369;
      break;
    case 3:
      uint64_t result = 0x656D614E6D6F6F72;
      break;
    case 4:
      uint64_t result = 0x656E6563537369;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_252884650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252888C20(a1, a2);
  *a3 = result;
  return result;
}

void sub_252884678(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_252884684(uint64_t a1)
{
  unint64_t v2 = sub_252886AD8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2528846C0(uint64_t a1)
{
  unint64_t v2 = sub_252886AD8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TileElementInfo.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE10);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_252886AD8();
  sub_252898580();
  v8[15] = 0;
  type metadata accessor for ElementID();
  sub_252886C84(&qword_269C2DE20, (void (*)(uint64_t))type metadata accessor for ElementID);
  sub_252898460();
  if (!v1)
  {
    type metadata accessor for TileElementInfo();
    v8[14] = 1;
    sub_252898440();
    v8[13] = 2;
    sub_252898440();
    v8[12] = 3;
    sub_252898430();
    v8[11] = 4;
    sub_252898450();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t TileElementInfo.hashValue.getter()
{
  return sub_252898560();
}

uint64_t TileElementInfo.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v3 = type metadata accessor for ElementID();
  MEMORY[0x270FA5388](v3);
  uint64_t v29 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DE28);
  uint64_t v28 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for TileElementInfo();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_252886AD8();
  uint64_t v10 = (uint64_t)v31;
  sub_252898570();
  if (v10) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v11 = v28;
  uint64_t v31 = a1;
  uint64_t v12 = (uint64_t)v9;
  char v36 = 0;
  sub_252886C84(&qword_269C2DE30, (void (*)(uint64_t))type metadata accessor for ElementID);
  uint64_t v14 = (uint64_t)v29;
  uint64_t v13 = v30;
  sub_252898400();
  sub_252888E68(v14, v12, (uint64_t (*)(void))type metadata accessor for ElementID);
  char v35 = 1;
  uint64_t v15 = sub_2528983E0();
  uint64_t v16 = v11;
  char v17 = (uint64_t *)(v12 + v7[5]);
  *char v17 = v15;
  v17[1] = v18;
  char v34 = 2;
  uint64_t v19 = sub_2528983E0();
  uint64_t v20 = (uint64_t *)(v12 + v7[6]);
  *uint64_t v20 = v19;
  v20[1] = v21;
  char v33 = 3;
  uint64_t v22 = sub_2528983D0();
  uint64_t v23 = (uint64_t *)(v12 + v7[7]);
  uint64_t *v23 = v22;
  v23[1] = v24;
  char v32 = 4;
  LOBYTE(v11) = sub_2528983F0();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v13);
  *(unsigned char *)(v12 + v7[8]) = v11 & 1;
  sub_252886B2C(v12, v27, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  return sub_252886B94(v12, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
}

uint64_t sub_252884DFC@<X0>(uint64_t a1@<X8>)
{
  return sub_252886B2C(v1, a1, (uint64_t (*)(void))type metadata accessor for ElementID);
}

uint64_t sub_252884E30()
{
  return sub_252898560();
}

uint64_t sub_252884E74()
{
  return sub_252898560();
}

uint64_t sub_252884EB4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TileElementInfo.init(from:)(a1, a2);
}

uint64_t sub_252884ECC(void *a1)
{
  return TileElementInfo.encode(to:)(a1);
}

uint64_t sub_252884EE4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DC70);
  uint64_t v3 = sub_252898220();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = sub_2528974E0();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                sub_2528975E0();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_252898090();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = sub_2528975E0();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_252885184()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2528976E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_269C2DEB0);
  uint64_t v7 = sub_252898220();
  uint64_t v8 = v7;
  if (*(void *)(v6 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
    uint64_t v10 = *(void *)(v6 + 56);
    char v36 = (void *)(v6 + 56);
    if (v9 < 64) {
      uint64_t v11 = ~(-1 << v9);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & v10;
    char v34 = v0;
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    unint64_t v13 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v14 = v7 + 56;
    uint64_t result = sub_2528974E0();
    int64_t v16 = 0;
    while (1)
    {
      if (v12)
      {
        unint64_t v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v19 = v18 | (v16 << 6);
      }
      else
      {
        int64_t v20 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v20 >= v35) {
          goto LABEL_33;
        }
        unint64_t v21 = v36[v20];
        ++v16;
        if (!v21)
        {
          int64_t v16 = v20 + 1;
          if (v20 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v21 = v36[v16];
          if (!v21)
          {
            int64_t v16 = v20 + 2;
            if (v20 + 2 >= v35) {
              goto LABEL_33;
            }
            unint64_t v21 = v36[v16];
            if (!v21)
            {
              int64_t v22 = v20 + 3;
              if (v22 >= v35)
              {
LABEL_33:
                sub_2528975E0();
                uint64_t v1 = v34;
                uint64_t v33 = 1 << *(unsigned char *)(v6 + 32);
                if (v33 > 63) {
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v36 = -1 << v33;
                }
                *(void *)(v6 + 16) = 0;
                break;
              }
              unint64_t v21 = v36[v22];
              if (!v21)
              {
                while (1)
                {
                  int64_t v16 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v16 >= v35) {
                    goto LABEL_33;
                  }
                  unint64_t v21 = v36[v16];
                  ++v22;
                  if (v21) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v16 = v22;
            }
          }
        }
LABEL_23:
        unint64_t v12 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
      }
      uint64_t v23 = v6;
      unint64_t v24 = *(void **)(*(void *)(v6 + 48) + 8 * v19);
      sub_252898530();
      id v25 = objc_msgSend(v24, sel_uniqueIdentifier);
      sub_2528976A0();

      sub_252886C84((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
      sub_252897C20();
      (*v13)(v5, v2);
      uint64_t result = sub_252898560();
      uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v14 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v14 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v29 = 0;
        unint64_t v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v14 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(void *)(*(void *)(v8 + 48) + 8 * v17) = v24;
      ++*(void *)(v8 + 16);
      uint64_t v6 = v23;
    }
  }
  uint64_t result = sub_2528975E0();
  *uint64_t v1 = v8;
  return result;
}

uint64_t sub_252885578()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ElementID();
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DEA8);
  uint64_t v6 = sub_252898220();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    unint64_t v30 = v0;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v32 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v31 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t result = sub_2528974E0();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v31) {
          goto LABEL_33;
        }
        unint64_t v19 = v32[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v19 = v32[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v31) {
              goto LABEL_33;
            }
            unint64_t v19 = v32[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v31)
              {
LABEL_33:
                sub_2528975E0();
                uint64_t v1 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
                if (v29 > 63) {
                  bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v32 = -1 << v29;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v19 = v32[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v31) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v32[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(v33 + 72);
      sub_252888E68(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ElementID);
      sub_252898530();
      sub_2528976E0();
      sub_252886C84((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
      sub_252897C20();
      sub_252898540();
      uint64_t result = sub_252898560();
      uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t result = sub_252888E68((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, (uint64_t (*)(void))type metadata accessor for ElementID);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = sub_2528975E0();
  *uint64_t v1 = v7;
  return result;
}

id sub_252885984()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DC70);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_252898210();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)sub_2528975E0();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_252885B30()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_269C2DEB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_252898210();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)sub_2528975E0();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    id result = (void *)swift_unknownObjectRetain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_252885CDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ElementID();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DEA8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_252898210();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)sub_2528975E0();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  unint64_t v24 = v1;
  id result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v20 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_25;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_25;
        }
        unint64_t v21 = *(void *)(v10 + 8 * v12);
        if (!v21) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_252886B2C(*(void *)(v6 + 48) + v19, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for ElementID);
    id result = (void *)sub_252888E68((uint64_t)v5, *(void *)(v8 + 48) + v19, (uint64_t (*)(void))type metadata accessor for ElementID);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v16)
  {
LABEL_25:
    id result = (void *)sub_2528975E0();
    uint64_t v1 = v24;
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_252885F4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DC70);
  uint64_t v3 = sub_252898220();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = sub_2528975E0();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v27 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = sub_2528974E0();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_252898090();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2528861C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2528976E0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_269C2DEB0);
  uint64_t v7 = sub_252898220();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = sub_2528975E0();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v32 = v0;
  uint64_t v33 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v34 = (unint64_t)(v9 + 63) >> 6;
  unint64_t v13 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v14 = v7 + 56;
  uint64_t result = sub_2528974E0();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v34) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v33 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v33 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v34) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v33 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = *(void *)(*(void *)(v6 + 48) + 8 * v19);
    sub_252898530();
    id v24 = objc_msgSend((id)swift_unknownObjectRetain(), sel_uniqueIdentifier);
    sub_2528976A0();

    sub_252886C84((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
    sub_252897C20();
    (*v13)(v5, v2);
    uint64_t result = sub_252898560();
    uint64_t v25 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v14 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v17 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(void *)(*(void *)(v8 + 48) + 8 * v17) = v23;
    ++*(void *)(v8 + 16);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v34)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v32;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v33 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v34) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v33 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_252886580()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ElementID();
  uint64_t v32 = *(void *)(v2 - 8);
  uint64_t v33 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DEA8);
  uint64_t v6 = sub_252898220();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = sub_2528975E0();
LABEL_35:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  unint64_t v29 = v0;
  uint64_t v30 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = sub_2528974E0();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v31) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v30 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v30 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v30 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    uint64_t v21 = *(void *)(v32 + 72);
    sub_252886B2C(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for ElementID);
    sub_252898530();
    sub_2528976E0();
    sub_252886C84((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
    sub_252897C20();
    sub_252898540();
    uint64_t result = sub_252898560();
    uint64_t v22 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_252888E68((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, (uint64_t (*)(void))type metadata accessor for ElementID);
    ++*(void *)(v7 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v30 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v31) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v30 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t _s17HomeWidgetIntents15TileElementInfoV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v4 = type metadata accessor for ElementID();
  if (qword_25289A178[*(char *)(a1 + *(int *)(v4 + 20))] != qword_25289A178[*(char *)(a2 + *(int *)(v4 + 20))]) {
    goto LABEL_22;
  }
  uint64_t v5 = (int *)type metadata accessor for TileElementInfo();
  uint64_t v6 = v5[5];
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  if (v7 != *v9 || v8 != v9[1])
  {
    char v11 = sub_2528984C0();
    char v12 = 0;
    if ((v11 & 1) == 0) {
      return v12 & 1;
    }
  }
  uint64_t v13 = v5[6];
  uint64_t v14 = *(void *)(a1 + v13);
  uint64_t v15 = *(void *)(a1 + v13 + 8);
  unint64_t v16 = (void *)(a2 + v13);
  if (v14 != *v16 || v15 != v16[1])
  {
    char v18 = sub_2528984C0();
    char v12 = 0;
    if ((v18 & 1) == 0) {
      return v12 & 1;
    }
  }
  uint64_t v19 = v5[7];
  int64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = *(void *)(a1 + v19 + 8);
  uint64_t v22 = (void *)(a2 + v19);
  uint64_t v23 = v22[1];
  if (!v21)
  {
    if (!v23)
    {
LABEL_24:
      char v12 = *(unsigned char *)(a1 + v5[8]) ^ *(unsigned char *)(a2 + v5[8]) ^ 1;
      return v12 & 1;
    }
    goto LABEL_22;
  }
  if (!v23)
  {
LABEL_22:
    char v12 = 0;
    return v12 & 1;
  }
  if (*v20 == *v22 && v21 == v23) {
    goto LABEL_24;
  }
  char v25 = sub_2528984C0();
  char v12 = 0;
  if (v25) {
    goto LABEL_24;
  }
  return v12 & 1;
}

uint64_t type metadata accessor for TileElementInfo()
{
  uint64_t result = qword_26B22D870;
  if (!qword_26B22D870) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_252886AD8()
{
  unint64_t result = qword_269C2DE18;
  if (!qword_269C2DE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DE18);
  }
  return result;
}

uint64_t sub_252886B2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_252886B94(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_252886BF4()
{
  return sub_252886C84(&qword_269C2DCC8, (void (*)(uint64_t))type metadata accessor for ElementID);
}

uint64_t sub_252886C3C()
{
  return sub_252886C84(&qword_269C2DE38, (void (*)(uint64_t))type metadata accessor for TileElementInfo);
}

uint64_t sub_252886C84(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for TileElementInfo(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v22 = *a2;
    *a1 = *a2;
    a1 = (void *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    sub_2528974E0();
  }
  else
  {
    uint64_t v7 = sub_2528976E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for ElementID();
    *((unsigned char *)a1 + *(int *)(v8 + 20)) = *((unsigned char *)a2 + *(int *)(v8 + 20));
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    char v11 = (void *)((char *)a1 + v9);
    char v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *char v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (void *)((char *)a1 + v10);
    uint64_t v15 = (void *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[7];
    uint64_t v18 = a3[8];
    uint64_t v19 = (void *)((char *)a1 + v17);
    int64_t v20 = (void *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    *((unsigned char *)a1 + v18) = *((unsigned char *)a2 + v18);
    sub_2528974D0();
    sub_2528974D0();
    sub_2528974D0();
  }
  return a1;
}

uint64_t destroy for TileElementInfo(uint64_t a1)
{
  uint64_t v2 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TileElementInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for ElementID();
  *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = (void *)(a1 + v8);
  char v11 = (void *)(a2 + v8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  uint64_t v13 = (void *)(a1 + v9);
  uint64_t v14 = (void *)(a2 + v9);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v16);
  uint64_t v19 = (void *)(a2 + v16);
  uint64_t v20 = v19[1];
  *uint64_t v18 = *v19;
  v18[1] = v20;
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  sub_2528974D0();
  sub_2528974D0();
  sub_2528974D0();
  return a1;
}

uint64_t assignWithCopy for TileElementInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for ElementID();
  *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  sub_2528974D0();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  sub_2528974D0();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  sub_2528974D0();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t initializeWithTake for TileElementInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for ElementID();
  *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for TileElementInfo(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = type metadata accessor for ElementID();
  *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for TileElementInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25288721C);
}

uint64_t sub_25288721C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ElementID();
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

uint64_t storeEnumTagSinglePayload for TileElementInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2528872F4);
}

uint64_t sub_2528872F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ElementID();
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

uint64_t sub_2528873B4()
{
  uint64_t result = type metadata accessor for ElementID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TileElementInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TileElementInfo.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x2528875BCLL);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TileElementInfo.CodingKeys()
{
  return &type metadata for TileElementInfo.CodingKeys;
}

unint64_t sub_2528875F8()
{
  unint64_t result = qword_269C2DE40;
  if (!qword_269C2DE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DE40);
  }
  return result;
}

unint64_t sub_252887650()
{
  unint64_t result = qword_269C2DE48;
  if (!qword_269C2DE48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DE48);
  }
  return result;
}

unint64_t sub_2528876A8()
{
  unint64_t result = qword_269C2DE50;
  if (!qword_269C2DE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DE50);
  }
  return result;
}

uint64_t sub_2528876FC(uint64_t a1, uint64_t *a2)
{
  unint64_t v56 = a2;
  uint64_t v57 = type metadata accessor for ElementID();
  uint64_t v4 = MEMORY[0x270FA5388](v57);
  unsigned int v6 = (char *)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)v47 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v54 = (uint64_t)v47 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v58 = (uint64_t)v47 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v47 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)v47 - v18;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v60 = MEMORY[0x263F8EE78];
  uint64_t v51 = *(void *)(a1 + 16);
  if (!v51) {
    return result;
  }
  v47[1] = v2;
  uint64_t v21 = 0;
  uint64_t v22 = *(void *)(v17 + 72);
  unint64_t v48 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  unint64_t v49 = (char *)v47 - v18;
  uint64_t v50 = a1 + v48;
  while (1)
  {
    uint64_t v55 = v21;
    sub_252886B2C(v50 + v22 * v21, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for ElementID);
    sub_252886B2C((uint64_t)v19, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for ElementID);
    uint64_t v25 = *v56;
    sub_252898530();
    uint64_t v26 = sub_2528976E0();
    uint64_t v27 = sub_252886C84((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
    sub_2528974D0();
    uint64_t v52 = v27;
    uint64_t v53 = v26;
    sub_252897C20();
    uint64_t v28 = *(int *)(v57 + 20);
    sub_252898540();
    uint64_t v29 = sub_252898560();
    uint64_t v30 = -1 << *(unsigned char *)(v25 + 32);
    unint64_t v31 = v29 & ~v30;
    if ((*(void *)(v25 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31))
    {
      uint64_t v32 = ~v30;
      while (1)
      {
        sub_252886B2C(*(void *)(v25 + 48) + v31 * v22, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ElementID);
        if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0
          && qword_25289A178[v6[*(int *)(v57 + 20)]] == qword_25289A178[v16[v28]])
        {
          break;
        }
        sub_252886B94((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ElementID);
        unint64_t v31 = (v31 + 1) & v32;
        if (((*(void *)(v25 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31) & 1) == 0) {
          goto LABEL_13;
        }
      }
      sub_252886B94((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ElementID);
      swift_bridgeObjectRelease();
      sub_252886B94((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for ElementID);
      uint64_t v19 = v49;
      sub_252886B94((uint64_t)v49, (uint64_t (*)(void))type metadata accessor for ElementID);
      goto LABEL_6;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v33 = v56;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_252886B2C((uint64_t)v16, v58, (uint64_t (*)(void))type metadata accessor for ElementID);
    uint64_t v59 = *v33;
    uint64_t v35 = v59;
    *uint64_t v33 = 0x8000000000000000;
    if (*(void *)(v35 + 24) > *(void *)(v35 + 16))
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_252885CDC();
      }
      goto LABEL_25;
    }
    if (isUniquelyReferenced_nonNull_native) {
      sub_252885578();
    }
    else {
      sub_252886580();
    }
    uint64_t v36 = v59;
    sub_252898530();
    sub_252897C20();
    uint64_t v37 = *(int *)(v57 + 20);
    sub_252898540();
    uint64_t v38 = sub_252898560();
    uint64_t v39 = -1 << *(unsigned char *)(v36 + 32);
    unint64_t v31 = v38 & ~v39;
    if ((*(void *)(v36 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31)) {
      break;
    }
LABEL_25:
    uint64_t v41 = v58;
    uint64_t v42 = v59;
    *(void *)(v59 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v31;
    sub_252888E68(v41, *(void *)(v42 + 48) + v31 * v22, (uint64_t (*)(void))type metadata accessor for ElementID);
    uint64_t v43 = *(void *)(v42 + 16);
    BOOL v44 = __OFADD__(v43, 1);
    uint64_t v45 = v43 + 1;
    if (v44)
    {
      __break(1u);
      goto LABEL_31;
    }
    *(void *)(v42 + 16) = v45;
    uint64_t *v56 = v42;
    swift_bridgeObjectRelease();
    sub_252886B94((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for ElementID);
    uint64_t v19 = v49;
    sub_252888E68((uint64_t)v49, v54, (uint64_t (*)(void))type metadata accessor for ElementID);
    uint64_t v46 = v60;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_252868CF8(0, *(void *)(v46 + 16) + 1, 1);
      uint64_t v46 = v60;
    }
    unint64_t v24 = *(void *)(v46 + 16);
    unint64_t v23 = *(void *)(v46 + 24);
    if (v24 >= v23 >> 1)
    {
      sub_252868CF8(v23 > 1, v24 + 1, 1);
      uint64_t v46 = v60;
    }
    *(void *)(v46 + 16) = v24 + 1;
    sub_252888E68(v54, v46 + v48 + v24 * v22, (uint64_t (*)(void))type metadata accessor for ElementID);
LABEL_6:
    uint64_t v21 = v55 + 1;
    if (v55 + 1 == v51) {
      return v60;
    }
  }
  uint64_t v40 = ~v39;
  while (1)
  {
    sub_252886B2C(*(void *)(v36 + 48) + v31 * v22, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ElementID);
    if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0
      && qword_25289A178[v9[*(int *)(v57 + 20)]] == qword_25289A178[*(char *)(v58 + v37)])
    {
      break;
    }
    sub_252886B94((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ElementID);
    unint64_t v31 = (v31 + 1) & v40;
    if (((*(void *)(v36 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31) & 1) == 0) {
      goto LABEL_25;
    }
  }
LABEL_31:
  sub_252886B94((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for ElementID);
  uint64_t result = sub_2528984D0();
  __break(1u);
  return result;
}

uint64_t sub_252887D94(uint64_t a1, uint64_t a2)
{
  v2[8] = a1;
  v2[9] = a2;
  uint64_t v3 = sub_252897800();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D5C8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_252887EC0, 0, 0);
}

uint64_t sub_252887EC0()
{
  uint64_t v11 = v0;
  v10[1] = *MEMORY[0x263EF8340];
  if (*(void *)(v0[8] + 16))
  {
    type metadata accessor for IntentsService();
    swift_initStaticObject();
    unint64_t v1 = (void *)swift_task_alloc();
    v0[15] = v1;
    *unint64_t v1 = v0;
    v1[1] = sub_252888180;
    return sub_252859C00();
  }
  else
  {
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_252897B80();
    __swift_project_value_buffer(v3, (uint64_t)qword_269C2E278);
    uint64_t v4 = sub_252897B60();
    os_log_type_t v5 = sub_252897FB0();
    if (os_log_type_enabled(v4, v5))
    {
      unsigned int v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v7 = swift_slowAlloc();
      v10[0] = v7;
      *(_DWORD *)unsigned int v6 = 136315138;
      v0[7] = sub_252868708(0xD000000000000012, 0x800000025289BE30, v10);
      sub_2528980D0();
      _os_log_impl(&dword_252856000, v4, v5, "%s no elements to build", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v7, -1, -1);
      MEMORY[0x2533BFA60](v6, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v9 = MEMORY[0x263F8EE78];
    return v8(v9);
  }
}

uint64_t sub_252888180(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[16] = a1;
  v3[17] = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v3[1];
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_252888320, 0, 0);
  }
}

uint64_t sub_252888320()
{
  uint64_t v23 = v0;
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 72);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 128);
    uint64_t v3 = *(void *)(v0 + 72);
LABEL_9:
    *(void *)(v0 + 144) = v1;
    *(void *)(v0 + 152) = v3;
    id v8 = v1;
    id v9 = v2;
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_2528886E0;
    uint64_t v11 = *(void *)(v0 + 112);
    return sub_252883ECC(v11, v3);
  }
  id v4 = *(id *)(v0 + 128);
  unint64_t v5 = sub_252893024(0);
  unint64_t v6 = v5;
  if (v5 >> 62)
  {
    if (sub_252898350()) {
      goto LABEL_5;
    }
  }
  else if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_5:
    if ((v6 & 0xC000000000000001) != 0)
    {
      id v7 = (id)MEMORY[0x2533BF180](0, v6);
      goto LABEL_8;
    }
    if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v7 = *(id *)(v6 + 32);
LABEL_8:
      uint64_t v2 = v7;
      uint64_t v1 = *(void **)(v0 + 72);
      swift_bridgeObjectRelease();
      uint64_t v3 = (uint64_t)v2;
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  if (qword_269C2D3F0 != -1) {
LABEL_21:
  }
    swift_once();
  uint64_t v13 = sub_252897B80();
  __swift_project_value_buffer(v13, (uint64_t)qword_269C2E278);
  uint64_t v14 = sub_252897B60();
  os_log_type_t v15 = sub_252897FB0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    v22[0] = v18;
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v0 + 40) = sub_252868708(0xD000000000000012, 0x800000025289BE30, v22);
    sub_2528980D0();
    *(_WORD *)(v16 + 12) = 2112;
    *(void *)(v0 + 48) = 0;
    sub_2528980D0();
    *uint64_t v17 = 0;
    _os_log_impl(&dword_252856000, v14, v15, "%s home=%@ not found, returning 0 elements", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D578);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v18, -1, -1);
    MEMORY[0x2533BFA60](v16, -1, -1);
  }

  uint64_t v19 = *(void **)(v0 + 128);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v21 = MEMORY[0x263F8EE78];
  return v20(v21);
}

uint64_t sub_2528886E0()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_252888808, 0, 0);
}

uint64_t sub_252888808()
{
  uint64_t v32 = v0;
  v31[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[11];
  sub_252871318(v0[14], v1, &qword_269C2D5C8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_25285C7C8(v0[13], &qword_269C2D5C8);
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    id v4 = (void *)v0[18];
    uint64_t v5 = sub_252897B80();
    __swift_project_value_buffer(v5, (uint64_t)qword_269C2E278);
    id v6 = v4;
    id v7 = sub_252897B60();
    os_log_type_t v8 = sub_252897FB0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = v0[9];
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v31[0] = v12;
      *(_DWORD *)uint64_t v10 = 136315394;
      v0[2] = sub_252868708(0xD000000000000012, 0x800000025289BE30, v31);
      sub_2528980D0();
      *(_WORD *)(v10 + 12) = 2112;
      if (v9)
      {
        uint64_t v13 = (void *)v0[18];
        v0[4] = v13;
        id v14 = v13;
      }
      else
      {
        v0[3] = 0;
      }
      sub_2528980D0();
      uint64_t v26 = (void *)v0[18];
      *uint64_t v11 = v0[9];

      _os_log_impl(&dword_252856000, v7, v8, "%s home=%@ not found in DataModel StateSnapshot", (uint8_t *)v10, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D578);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v11, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v12, -1, -1);
      MEMORY[0x2533BFA60](v10, -1, -1);
    }
    else
    {
      uint64_t v25 = (void *)v0[18];
    }
    uint64_t v27 = (void *)v0[19];
    uint64_t v28 = (void *)v0[16];
    uint64_t v17 = v0[14];

    unint64_t v24 = MEMORY[0x263F8EE78];
  }
  else
  {
    os_log_type_t v15 = (void *)v0[19];
    uint64_t v16 = (void *)v0[16];
    uint64_t v17 = v0[14];
    uint64_t v19 = v0[11];
    uint64_t v18 = v0[12];
    uint64_t v20 = v0[10];
    (*(void (**)(uint64_t, void, uint64_t))(v19 + 32))(v18, v0[13], v20);
    v31[0] = MEMORY[0x263F8EE88];
    uint64_t v21 = sub_2528974D0();
    uint64_t v22 = sub_2528876FC(v21, v31);
    swift_bridgeObjectRelease();
    uint64_t v23 = swift_task_alloc();
    *(void *)(v23 + 16) = v18;
    *(void *)(v23 + 24) = v15;
    unint64_t v24 = sub_252881078((void (*)(uint64_t))sub_252888E4C, v23, v22);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  sub_25285C7C8(v17, &qword_269C2D5C8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v29 = (uint64_t (*)(unint64_t))v0[1];
  return v29(v24);
}

uint64_t sub_252888C20(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_2528984C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61 || (sub_2528984C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x626D79536E6F6369 && a2 == 0xEA00000000006C6FLL || (sub_2528984C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D614E6D6F6F72 && a2 == 0xE800000000000000 || (sub_2528984C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656E6563537369 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_2528984C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_252888E4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_252882ED0(a1, *(void **)(v2 + 24), a2);
}

uint64_t sub_252888E68(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t dispatch thunk of TileEntity.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TileEntity.homeID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TileEntity.item.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static TileEntity.create(id:homeID:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t sub_252888F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata accessor for HomeItemInfoCollection()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_252888F40(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  id v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_252897F30();
  if (!v18) {
    return sub_252897E10();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_252898320();
  uint64_t v32 = sub_252898330();
  sub_2528982D0();
  uint64_t v36 = v8;
  uint64_t result = sub_252897F10();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    int64_t v34 = (void (**)(char *))(v33 + 2);
    uint64_t v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))sub_252897F50();
      uint64_t v22 = v12;
      uint64_t v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      sub_252898310();
      sub_252897F40();
      --v19;
      uint64_t v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    sub_2528975E0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

uint64_t sub_252889340()
{
  unint64_t v1 = *(void *)(v0 + 8);
  sub_252898530();
  sub_252898540();
  if (v1 > 1) {
    sub_252897CE0();
  }
  return sub_252898560();
}

uint64_t sub_2528893C0()
{
  if (*(void *)(v0 + 8) <= 1uLL) {
    return sub_252898540();
  }
  sub_252898540();
  return sub_252897CE0();
}

uint64_t sub_252889448()
{
  unint64_t v1 = *(void *)(v0 + 8);
  sub_252898530();
  sub_252898540();
  if (v1 > 1) {
    sub_252897CE0();
  }
  return sub_252898560();
}

BOOL sub_2528894C4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a2 + 8);
  if (v2)
  {
    if (v2 == 1)
    {
      unint64_t v2 = 2;
    }
    else
    {
      if (v3 >= 2)
      {
        sub_2528710F0();
        return sub_252898120() == -1;
      }
      unint64_t v2 = 1;
    }
  }
  unint64_t v4 = 1;
  if (v3 == 1) {
    unint64_t v4 = 2;
  }
  return v3 && v4 > v2;
}

BOOL sub_252889568(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3)
  {
    if (v3 == 1)
    {
      unint64_t v3 = 2;
    }
    else
    {
      if (v2 >= 2)
      {
        sub_2528710F0();
        BOOL v6 = sub_252898120() == -1;
        return !v6;
      }
      unint64_t v3 = 1;
    }
  }
  unint64_t v4 = 1;
  if (v2 == 1) {
    unint64_t v4 = 2;
  }
  if (v2) {
    BOOL v5 = v4 > v3;
  }
  else {
    BOOL v5 = 0;
  }
  BOOL v6 = v5;
  return !v6;
}

BOOL sub_252889610(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a2 + 8);
  if (v2)
  {
    if (v2 == 1)
    {
      unint64_t v2 = 2;
    }
    else
    {
      if (v3 >= 2)
      {
        sub_2528710F0();
        BOOL v6 = sub_252898120() == -1;
        return !v6;
      }
      unint64_t v2 = 1;
    }
  }
  unint64_t v4 = 1;
  if (v3 == 1) {
    unint64_t v4 = 2;
  }
  if (v3) {
    BOOL v5 = v4 > v2;
  }
  else {
    BOOL v5 = 0;
  }
  BOOL v6 = v5;
  return !v6;
}

BOOL sub_2528896B8(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3)
  {
    if (v3 == 1)
    {
      unint64_t v3 = 2;
    }
    else
    {
      if (v2 >= 2)
      {
        sub_2528710F0();
        return sub_252898120() == -1;
      }
      unint64_t v3 = 1;
    }
  }
  unint64_t v4 = 1;
  if (v2 == 1) {
    unint64_t v4 = 2;
  }
  return v2 && v4 > v3;
}

uint64_t sub_25288975C(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = a2[1];
  if (!v3) {
    return !v4;
  }
  if (v3 == 1) {
    return v4 == 1;
  }
  if (v4 < 2) {
    return 0;
  }
  if (*a1 != *a2 || v3 != v4) {
    return sub_2528984C0();
  }
  return 1;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2528897EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_2528897F8(uint64_t a1)
{
  if (*(void *)(a1 + 8) >= 2uLL) {
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void *sub_25288983C(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (v4 >= 2)
  {
    *a1 = *a2;
    a1[1] = v4;
    sub_2528974D0();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  a1[2] = a2[2];
  sub_2528974D0();
  return a1;
}

void *sub_252889894(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] >= 2uLL)
  {
    if (v4 >= 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      sub_2528974D0();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_252889944((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 < 2)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  sub_2528974D0();
LABEL_8:
  a1[2] = a2[2];
  sub_2528974D0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_252889944(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *sub_2528899AC(void *a1, void *a2)
{
  if (a1[1] >= 2uLL)
  {
    unint64_t v4 = a2[1];
    if (v4 >= 2)
    {
      *a1 = *a2;
      a1[1] = v4;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_252889944((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_252889A1C(uint64_t a1, int a2)
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

uint64_t sub_252889A64(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for HomeItemInfoCollection.HomeCollection()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t destroy for CollectionType(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s17HomeWidgetIntents14CollectionTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    sub_2528974D0();
  }
  return a1;
}

void *assignWithCopy for CollectionType(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      sub_2528974D0();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  sub_2528974D0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CollectionType(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CollectionType(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CollectionType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_252889CDC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_252889CF4(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for CollectionType()
{
  return &type metadata for CollectionType;
}

unint64_t sub_252889D28()
{
  unint64_t result = qword_269C2DFB8;
  if (!qword_269C2DFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DFB8);
  }
  return result;
}

uint64_t sub_252889D7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (!a2)
  {
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    if (a5 == 1)
    {
LABEL_12:
      MEMORY[0x270FA5388](a1);
      sub_252897E40();
      sub_2528974D0();
      sub_2528974D0();
      swift_getWitnessTable();
      char v5 = sub_252897D90();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v5 & 1;
    }
    goto LABEL_8;
  }
  if (a5 < 2)
  {
LABEL_8:
    char v5 = 0;
    return v5 & 1;
  }
  if (a1 == a4 && a2 == a5) {
    goto LABEL_12;
  }
  a1 = sub_2528984C0();
  char v5 = 0;
  if (a1) {
    goto LABEL_12;
  }
  return v5 & 1;
}

uint64_t sub_252889EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for ElementID();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v17 - v10;
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
  v12(a3, a4);
  v12(a3, a4);
  char v13 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
  uint64_t v14 = sub_2528976E0();
  uint64_t v15 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v9, v14);
  v15(v11, v14);
  return v13 & 1;
}

uint64_t sub_25288A038(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 && a3 != 1)
  {
    sub_252898540();
    sub_2528974D0();
    sub_252897CE0();
    uint64_t v13 = sub_2528702CC(a2, a3);
  }
  else
  {
    uint64_t v13 = sub_252898540();
  }
  v21[7] = a4;
  MEMORY[0x270FA5388](v13);
  v21[2] = a5;
  v21[3] = a6;
  void v21[4] = a7;
  uint64_t v15 = sub_252897E40();
  uint64_t v16 = type metadata accessor for ElementID();
  sub_2528974D0();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v19 = sub_252888F40((void (*)(char *, char *))sub_25288A384, (uint64_t)v21, v15, v16, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v18);
  swift_bridgeObjectRelease();
  sub_25288A3C8(a1, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25288A1B8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_252898530();
  sub_25288A038((uint64_t)v13, a1, a2, a3, a4, a5, a6);
  return sub_252898560();
}

uint64_t sub_25288A238@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_2528702B8(v2, v3);
}

uint64_t sub_25288A244(uint64_t *a1)
{
  return sub_25288A1B8(*(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), a1[2], a1[3], a1[4]);
}

uint64_t sub_25288A25C(uint64_t a1, uint64_t *a2)
{
  return sub_25288A038(a1, *(void *)v2, *(void *)(v2 + 8), *(void *)(v2 + 16), a2[2], a2[3], a2[4]);
}

uint64_t sub_25288A274(uint64_t a1, uint64_t *a2)
{
  sub_252898530();
  sub_25288A038((uint64_t)v5, *(void *)v2, *(void *)(v2 + 8), *(void *)(v2 + 16), a2[2], a2[3], a2[4]);
  return sub_252898560();
}

uint64_t sub_25288A2C4(uint64_t *a1, uint64_t a2)
{
  return sub_252889D7C(*a1, a1[1], a1[2], *(void *)a2, *(void *)(a2 + 8)) & 1;
}

uint64_t sub_25288A310()
{
  return swift_getWitnessTable();
}

unint64_t sub_25288A330()
{
  unint64_t result = qword_269C2DFC0;
  if (!qword_269C2DFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DFC0);
  }
  return result;
}

uint64_t sub_25288A384()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 16))(*(void *)(v0 + 16));
}

uint64_t sub_25288A3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for ElementID();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t result = sub_252898540();
  if (v7)
  {
    uint64_t v9 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v10 = *(void *)(v4 + 72);
    do
    {
      sub_25288A510(v9, (uint64_t)v6);
      sub_2528976E0();
      sub_25288A574();
      sub_252897C20();
      sub_252898540();
      uint64_t result = sub_25288A5CC((uint64_t)v6);
      v9 += v10;
      --v7;
    }
    while (v7);
  }
  return result;
}

uint64_t sub_25288A510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ElementID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_25288A574()
{
  unint64_t result = qword_269C2DC40;
  if (!qword_269C2DC40)
  {
    sub_2528976E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DC40);
  }
  return result;
}

uint64_t sub_25288A5CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ElementID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25288A628(uint64_t a1, uint64_t a2)
{
  return sub_252889EDC(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24)) & 1;
}

uint64_t static SelectedHomeEntity.selectedHome.getter(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return MEMORY[0x270FA2498](sub_25288A66C, 0, 0);
}

uint64_t sub_25288A66C()
{
  uint64_t v24 = v0;
  id v1 = objc_msgSend(self, sel_sharedDispatcher);
  id v2 = objc_msgSend(v1, sel_home);

  if (v2)
  {
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_252897B80();
    __swift_project_value_buffer(v3, (uint64_t)qword_269C2E278);
    id v4 = v2;
    uint64_t v5 = sub_252897B60();
    os_log_type_t v6 = sub_252897FD0();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v21 = (void *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = v22;
      *(_DWORD *)uint64_t v7 = 136315394;
      v0[2] = sub_252868708(0x64657463656C6573, 0xEC000000656D6F48, &v23);
      sub_2528980D0();
      *(_WORD *)(v7 + 12) = 2112;
      v0[2] = v4;
      id v8 = v4;
      sub_2528980D0();
      *uint64_t v21 = v2;

      _os_log_impl(&dword_252856000, v5, v6, "%s HFHomeKitDispatcher.home=%@", (uint8_t *)v7, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D578);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v21, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v22, -1, -1);
      MEMORY[0x2533BFA60](v7, -1, -1);
    }
    else
    {
    }
    uint64_t v11 = v0[3];
    id v12 = objc_msgSend(v4, sel_uniqueIdentifier);
    sub_2528976A0();

    id v13 = objc_msgSend(v4, sel_name);
    uint64_t v14 = sub_252897CB0();
    uint64_t v16 = v15;

    uint64_t v17 = type metadata accessor for SelectedHomeEntity();
    uint64_t v18 = (uint64_t *)(v11 + *(int *)(v17 + 20));
    *uint64_t v18 = v14;
    v18[1] = v16;
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 0, 1, v17);
  }
  else
  {
    uint64_t v9 = v0[3];
    uint64_t v10 = type metadata accessor for SelectedHomeEntity();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  }
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t type metadata accessor for SelectedHomeEntity()
{
  uint64_t result = qword_26B22D6F8;
  if (!qword_26B22D6F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SelectedHomeEntity.init(id:name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_25287ED1C(a1, a4);
  uint64_t result = type metadata accessor for SelectedHomeEntity();
  id v8 = (void *)(a4 + *(int *)(result + 20));
  *id v8 = a2;
  v8[1] = a3;
  return result;
}

uint64_t sub_25288AA88()
{
  uint64_t v0 = sub_252897590();
  __swift_allocate_value_buffer(v0, qword_269C2DFC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C2DFC8);
  return sub_252897580();
}

uint64_t static SelectedHomeEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D428 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897590();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2DFC8);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t SelectedHomeEntity.displayRepresentation.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA50);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_252897630();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = sub_252897C80();
  MEMORY[0x270FA5388](v8 - 8);
  sub_252897C70();
  sub_252897C60();
  type metadata accessor for SelectedHomeEntity();
  sub_252897C50();
  sub_252897C60();
  sub_252897620();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v9 = sub_252897470();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 1, 1, v9);
  return sub_252897480();
}

uint64_t SelectedHomeEntity.init()@<X0>(uint64_t a1@<X8>)
{
  sub_2528976D0();
  uint64_t result = type metadata accessor for SelectedHomeEntity();
  uint64_t v3 = (void *)(a1 + *(int *)(result + 20));
  void *v3 = 0;
  v3[1] = 0xE000000000000000;
  return result;
}

uint64_t SelectedHomeEntity.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25288BE8C(v1, a1, (uint64_t (*)(void))type metadata accessor for HomeID);
}

uint64_t SelectedHomeEntity.id.setter(uint64_t a1)
{
  return sub_25288BDD4(a1, v1);
}

uint64_t (*SelectedHomeEntity.id.modify())()
{
  return nullsub_1;
}

uint64_t SelectedHomeEntity.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SelectedHomeEntity() + 20));
  sub_2528974D0();
  return v1;
}

uint64_t SelectedHomeEntity.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for SelectedHomeEntity() + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SelectedHomeEntity.name.modify())()
{
  return nullsub_1;
}

uint64_t SelectedHomeEntity.hash(into:)()
{
  sub_2528976E0();
  sub_25288C314((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  sub_252897C20();
  type metadata accessor for SelectedHomeEntity();
  sub_2528974D0();
  sub_252897CE0();
  return swift_bridgeObjectRelease();
}

uint64_t static SelectedHomeEntity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = *(int *)(type metadata accessor for SelectedHomeEntity() + 20);
  uint64_t v5 = *(void *)(a1 + v4);
  uint64_t v6 = *(void *)(a1 + v4 + 8);
  uint64_t v7 = (void *)(a2 + v4);
  if (v5 == *v7 && v6 == v7[1]) {
    return 1;
  }
  return sub_2528984C0();
}

BOOL sub_25288B08C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_25288B0A4()
{
  if (*v0) {
    return 1701667182;
  }
  else {
    return 25705;
  }
}

uint64_t sub_25288B0CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_25288CBC0(a1, a2);
  *a3 = result;
  return result;
}

void sub_25288B0F4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_25288B100(uint64_t a1)
{
  unint64_t v2 = sub_25288BE38();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25288B13C(uint64_t a1)
{
  unint64_t v2 = sub_25288BE38();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SelectedHomeEntity.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DFE8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_25288BE38();
  sub_252898580();
  v8[15] = 0;
  type metadata accessor for HomeID();
  sub_25288C314(&qword_269C2DFF8, (void (*)(uint64_t))type metadata accessor for HomeID);
  sub_252898460();
  if (!v1)
  {
    type metadata accessor for SelectedHomeEntity();
    v8[14] = 1;
    sub_252898440();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SelectedHomeEntity.hashValue.getter()
{
  return sub_252898560();
}

uint64_t SelectedHomeEntity.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = type metadata accessor for HomeID();
  MEMORY[0x270FA5388](v4);
  uint64_t v25 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E000);
  uint64_t v24 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SelectedHomeEntity();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_25288BE38();
  sub_252898570();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v22 = v8;
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v24;
  char v28 = 0;
  sub_25288C314(&qword_269C2E008, (void (*)(uint64_t))type metadata accessor for HomeID);
  uint64_t v14 = (uint64_t)v25;
  uint64_t v13 = v26;
  sub_252898400();
  sub_25287ED1C(v14, v11);
  char v27 = 1;
  uint64_t v15 = sub_2528983E0();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v13);
  uint64_t v18 = v23;
  uint64_t v19 = (uint64_t *)(v11 + *(int *)(v22 + 20));
  *uint64_t v19 = v15;
  v19[1] = v17;
  sub_25288BE8C(v11, v18, (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_25288BEF4(v11, (uint64_t (*)(void))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288B6EC@<X0>(uint64_t a1@<X8>)
{
  return sub_25288BE8C(v1, a1, (uint64_t (*)(void))type metadata accessor for HomeID);
}

uint64_t sub_25288B720()
{
  return sub_252898560();
}

uint64_t sub_25288B7C8()
{
  sub_2528976E0();
  sub_25288C314((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
  sub_252897C20();
  return sub_252897CE0();
}

uint64_t sub_25288B864()
{
  return sub_252898560();
}

uint64_t sub_25288B908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1]) {
    return 1;
  }
  return sub_2528984C0();
}

uint64_t sub_25288B990@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SelectedHomeEntity.init(from:)(a1, a2);
}

uint64_t sub_25288B9A8(void *a1)
{
  return SelectedHomeEntity.encode(to:)(a1);
}

uint64_t sub_25288B9C0@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D428 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897590();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2DFC8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_25288BA68(uint64_t a1)
{
  uint64_t v2 = sub_25288C314((unint64_t *)&qword_269C2D8D8, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
  return MEMORY[0x270EE0C68](a1, v2);
}

uint64_t sub_25288BAE4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA50);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_252897630();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = sub_252897C80();
  MEMORY[0x270FA5388](v8 - 8);
  sub_252897C70();
  sub_252897C60();
  sub_252897C50();
  sub_252897C60();
  sub_252897620();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v9 = sub_252897470();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 1, 1, v9);
  return sub_252897480();
}

uint64_t sub_25288BD34(uint64_t a1)
{
  uint64_t v2 = sub_25288C314(&qword_26B22D6E0, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
  return MEMORY[0x270EE1D98](a1, v2);
}

uint64_t static SelectedHomeEntity.attributionBundleIdentifier.getter()
{
  return 0x6C7070612E6D6F63;
}

uint64_t sub_25288BDD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_25288BE38()
{
  unint64_t result = qword_269C2DFF0;
  if (!qword_269C2DFF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2DFF0);
  }
  return result;
}

uint64_t sub_25288BE8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25288BEF4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25288BF54()
{
  return sub_25288C314(&qword_26B22D6B8, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288BF9C()
{
  return sub_25288C314(&qword_26B22D6C8, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288BFE4()
{
  return sub_25288C314(&qword_26B22D6F0, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288C02C()
{
  return sub_25288C314(&qword_269C2E010, (void (*)(uint64_t))type metadata accessor for HomeID);
}

uint64_t sub_25288C074()
{
  return sub_25288C314(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
}

uint64_t sub_25288C0BC()
{
  return sub_25288C314(&qword_269C2E018, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288C104()
{
  return sub_25288C314(&qword_26B22D6D0, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288C14C()
{
  return sub_25288C314(&qword_26B22D6D8, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288C194()
{
  return sub_25288C314(&qword_26B22D6C0, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288C1DC()
{
  return sub_25288C314(&qword_26B22D6E0, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

unint64_t sub_25288C228()
{
  unint64_t result = qword_269C2E020;
  if (!qword_269C2E020)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C2E028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E020);
  }
  return result;
}

uint64_t sub_25288C284()
{
  return sub_25288C314(&qword_26B22D6E8, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288C2CC()
{
  return sub_25288C314((unint64_t *)&qword_269C2D8D8, (void (*)(uint64_t))type metadata accessor for SelectedHomeEntity);
}

uint64_t sub_25288C314(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for SelectedHomeEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    sub_2528974E0();
  }
  else
  {
    uint64_t v7 = sub_2528976E0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    sub_2528974D0();
  }
  return a1;
}

uint64_t destroy for SelectedHomeEntity(uint64_t a1)
{
  uint64_t v2 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  sub_2528974D0();
  return a1;
}

uint64_t assignWithCopy for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  sub_2528974D0();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
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

uint64_t getEnumTagSinglePayload for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25288C6EC);
}

uint64_t sub_25288C6EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for HomeID();
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

uint64_t storeEnumTagSinglePayload for SelectedHomeEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25288C7C4);
}

uint64_t sub_25288C7C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for HomeID();
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

uint64_t sub_25288C884()
{
  uint64_t result = sub_2528976E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SelectedHomeEntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SelectedHomeEntity.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x25288CA74);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_25288CA9C(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SelectedHomeEntity.CodingKeys()
{
  return &type metadata for SelectedHomeEntity.CodingKeys;
}

unint64_t sub_25288CABC()
{
  unint64_t result = qword_269C2E030;
  if (!qword_269C2E030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E030);
  }
  return result;
}

unint64_t sub_25288CB14()
{
  unint64_t result = qword_269C2E038;
  if (!qword_269C2E038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E038);
  }
  return result;
}

unint64_t sub_25288CB6C()
{
  unint64_t result = qword_269C2E040;
  if (!qword_269C2E040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E040);
  }
  return result;
}

uint64_t sub_25288CBC0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_2528984C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2528984C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_25288CC8C()
{
  sub_2528974E0();
  sub_2528974E0();
  sub_252897360();
  sub_2528975E0();
  return sub_2528975E0();
}

uint64_t sub_25288CCEC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D8A0);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v9 - v6;
  sub_25285F9A4(a1, (uint64_t)&v9 - v6);
  sub_25285F9A4((uint64_t)v7, (uint64_t)v5);
  sub_2528974E0();
  sub_2528974E0();
  sub_252897370();
  sub_25285C7C8((uint64_t)v7, &qword_269C2D8A0);
  sub_2528975E0();
  return sub_2528975E0();
}

uint64_t HomeSingleTileEntityQuery.moduleConfiguration.getter()
{
  return sub_252897550();
}

uint64_t HomeSingleTileEntityQuery.init()@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E048);
  swift_getKeyPath();
  uint64_t result = sub_252897570();
  *a1 = result;
  return result;
}

uint64_t HomeSingleTileEntityQuery.entities(for:)(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2D9F0 + dword_269C2D9F0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25288DC04;
  return v5(1, a1);
}

uint64_t HomeSingleTileEntityQuery.entities(matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[3] = a2;
  v4[4] = a3;
  v4[2] = a1;
  type metadata accessor for SelectedHomeEntity();
  v4[5] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D970);
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = *v3;
  v4[6] = v5;
  v4[7] = v6;
  return MEMORY[0x270FA2498](sub_25288CFC0, 0, 0);
}

uint64_t sub_25288CFC0()
{
  sub_2528974E0();
  uint64_t v1 = sub_252897550();
  uint64_t v2 = v0[6];
  if (v1)
  {
    uint64_t v3 = v0[5];
    swift_getKeyPath();
    sub_25286EF70();
    sub_2528973D0();
    sub_2528975E0();
    sub_2528975E0();
    sub_25288D89C(v3, v2);
    sub_25288D900(v3);
    uint64_t v4 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    uint64_t v5 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  uint64_t v6 = v0[4];
  sub_2528975E0();
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_269C2D9D8 + dword_269C2D9D8);
  BOOL v7 = (void *)swift_task_alloc();
  v0[8] = v7;
  *BOOL v7 = v0;
  v7[1] = sub_25288D160;
  uint64_t v8 = v0[6];
  uint64_t v9 = v0[2];
  uint64_t v10 = v0[3];
  return v12(v9, v10, v6, v8);
}

uint64_t sub_25288D160()
{
  uint64_t v2 = *(void *)(*v1 + 48);
  uint64_t v3 = *v1;
  *(void *)(v3 + 72) = v0;
  swift_task_dealloc();
  sub_25285C7C8(v2, &qword_269C2D970);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25288D2D8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
}

uint64_t sub_25288D2D8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t HomeSingleTileEntityQuery.suggestedEntities()(uint64_t a1)
{
  v2[2] = a1;
  type metadata accessor for SelectedHomeEntity();
  v2[3] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D970);
  uint64_t v3 = swift_task_alloc();
  uint64_t v4 = *v1;
  v2[4] = v3;
  v2[5] = v4;
  return MEMORY[0x270FA2498](sub_25288D408, 0, 0);
}

uint64_t sub_25288D408()
{
  sub_2528974E0();
  uint64_t v1 = sub_252897550();
  uint64_t v2 = v0[4];
  if (v1)
  {
    uint64_t v3 = v0[3];
    swift_getKeyPath();
    sub_25286EF70();
    sub_2528973D0();
    sub_2528975E0();
    sub_2528975E0();
    sub_25288D89C(v3, v2);
    sub_25288D900(v3);
    uint64_t v4 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    uint64_t v5 = type metadata accessor for HomeID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  sub_2528975E0();
  uint64_t v10 = (char *)&dword_269C2D9D8 + dword_269C2D9D8;
  uint64_t v6 = (void *)swift_task_alloc();
  v0[6] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2528652E8;
  uint64_t v7 = v0[4];
  uint64_t v8 = v0[2];
  return ((uint64_t (*)(uint64_t, void, void, uint64_t))v10)(v8, 0, 0, v7);
}

uint64_t sub_25288D5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_25285BC9C;
  return HomeSingleTileEntityQuery.entities(matching:)(a1, a2, a3);
}

uint64_t sub_25288D658@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E048);
  swift_getKeyPath();
  uint64_t result = sub_252897570();
  *a1 = result;
  return result;
}

uint64_t sub_25288D69C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_269C2D9F0 + dword_269C2D9F0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_252865674;
  return v5(1, a1);
}

uint64_t sub_25288D748(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25285CC38;
  return HomeSingleTileEntityQuery.suggestedEntities()(a1);
}

uint64_t sub_25288D7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_25288D960();
  *uint64_t v5 = v2;
  v5[1] = sub_25285CC38;
  return MEMORY[0x270EE0E40](a1, a2, v6);
}

uint64_t sub_25288D89C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25288D900(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SelectedHomeEntity();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_25288D960()
{
  unint64_t result = qword_269C2E068[0];
  if (!qword_269C2E068[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_269C2E068);
  }
  return result;
}

unint64_t sub_25288D9B8()
{
  unint64_t result = qword_26B22D7D8;
  if (!qword_26B22D7D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D7D8);
  }
  return result;
}

unint64_t sub_25288DA10()
{
  unint64_t result = qword_26B22D7E0;
  if (!qword_26B22D7E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D7E0);
  }
  return result;
}

uint64_t sub_25288DA64()
{
  return sub_25288DB4C(&qword_269C2DD38, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

unint64_t sub_25288DAB0()
{
  unint64_t result = qword_26B22D7D0;
  if (!qword_26B22D7D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B22D7D0);
  }
  return result;
}

uint64_t sub_25288DB04()
{
  return sub_25288DB4C((unint64_t *)&unk_26B22D768, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_25288DB4C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_25288DB98()
{
  unint64_t result = qword_269C2E088;
  if (!qword_269C2E088)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_269C2E090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E088);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeSingleTileEntityQuery()
{
  return &type metadata for HomeSingleTileEntityQuery;
}

uint64_t sub_25288DC08@<X0>(uint64_t a1@<X8>)
{
  self;
  if (swift_dynamicCastObjCClass())
  {
    swift_unknownObjectRetain();
    sub_25288FB24(v1, a1);
    return swift_unknownObjectRelease();
  }
  else
  {
    self;
    if (swift_dynamicCastObjCClass())
    {
      id v4 = objc_msgSend(v1, sel_uniqueIdentifier);
      sub_2528976A0();

      uint64_t result = type metadata accessor for ElementID();
      uint64_t v5 = *(int *)(result + 20);
      char v6 = 1;
    }
    else
    {
      self;
      if (swift_dynamicCastObjCClass())
      {
        id v7 = objc_msgSend(v1, sel_uniqueIdentifier);
        sub_2528976A0();

        uint64_t result = type metadata accessor for ElementID();
        uint64_t v5 = *(int *)(result + 20);
        char v6 = 3;
      }
      else
      {
        self;
        if (swift_dynamicCastObjCClass())
        {
          id v8 = objc_msgSend(v1, sel_uniqueIdentifier);
          sub_2528976A0();

          uint64_t result = type metadata accessor for ElementID();
          uint64_t v5 = *(int *)(result + 20);
          char v6 = 4;
        }
        else
        {
          self;
          if (swift_dynamicCastObjCClass())
          {
            id v9 = objc_msgSend(v1, sel_uniqueIdentifier);
            sub_2528976A0();

            uint64_t result = type metadata accessor for ElementID();
            uint64_t v5 = *(int *)(result + 20);
            char v6 = 5;
          }
          else
          {
            self;
            uint64_t v10 = swift_dynamicCastObjCClass();
            id v11 = objc_msgSend(v1, sel_uniqueIdentifier);
            sub_2528976A0();

            uint64_t result = type metadata accessor for ElementID();
            uint64_t v5 = *(int *)(result + 20);
            if (v10) {
              char v6 = 2;
            }
            else {
              char v6 = 7;
            }
          }
        }
      }
    }
    *(unsigned char *)(a1 + v5) = v6;
  }
  return result;
}

BOOL static ElementID.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for ElementID();
  return qword_25289ADD8[*(char *)(a1 + *(int *)(v4 + 20))] == qword_25289ADD8[*(char *)(a2 + *(int *)(v4 + 20))];
}

{
  return *(unsigned char *)(a1 + *(int *)(type metadata accessor for ElementID() + 20)) == 6
      && sub_25285CCC8() == 0xDEFFDEED00000000
      && sub_25285CCE4() == a2;
}

uint64_t type metadata accessor for ElementID()
{
  uint64_t result = qword_26B22D880;
  if (!qword_26B22D880) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t ElementID.nodeID.getter()
{
  if (*(unsigned char *)(v0 + *(int *)(type metadata accessor for ElementID() + 20)) == 6
    && sub_25285CCC8() == 0xDEFFDEED00000000)
  {
    return sub_25285CCE4();
  }
  else
  {
    return 0;
  }
}

uint64_t ElementID.Kind.rawValue.getter(char a1)
{
  return qword_25289ADD8[a1];
}

uint64_t sub_25288DF74@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s17HomeWidgetIntents9ElementIDV4KindO8rawValueAESgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_25288DFA0(void *a1@<X8>)
{
  *a1 = qword_25289ADD8[*v1];
}

uint64_t sub_25288DFB8()
{
  return sub_252898560();
}

uint64_t sub_25288E008()
{
  return sub_252898540();
}

uint64_t sub_25288E040()
{
  return sub_252898560();
}

uint64_t sub_25288E08C()
{
  return sub_252897DB0();
}

uint64_t sub_25288E0EC()
{
  return sub_252897DA0();
}

BOOL sub_25288E13C(char *a1, char *a2)
{
  return qword_25289ADD8[*a1] == qword_25289ADD8[*a2];
}

uint64_t ElementID.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2528976E0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t ElementID.kind.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ElementID() + 20));
}

uint64_t ElementID.init(id:kind:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a3, a1, v6);
  uint64_t result = type metadata accessor for ElementID();
  *(unsigned char *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t ElementID.hash(into:)()
{
  return sub_252898540();
}

uint64_t sub_25288E304()
{
  if (*v0) {
    return 1684957547;
  }
  else {
    return 25705;
  }
}

uint64_t sub_25288E32C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252891560(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_25288E354(uint64_t a1)
{
  unint64_t v2 = sub_252890AEC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_25288E390(uint64_t a1)
{
  unint64_t v2 = sub_252890AEC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t ElementID.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E0A8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_252890AEC();
  sub_252898580();
  v10[15] = 0;
  sub_2528976E0();
  sub_2528916C0(&qword_269C2DD80, MEMORY[0x263F07508]);
  sub_252898460();
  if (!v2)
  {
    v10[14] = *(unsigned char *)(v3 + *(int *)(type metadata accessor for ElementID() + 20));
    v10[13] = 1;
    sub_252890B40();
    sub_252898460();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t ElementID.hashValue.getter()
{
  return sub_252898560();
}

uint64_t ElementID.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v27 = sub_2528976E0();
  uint64_t v24 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E0C0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v25 = v6;
  uint64_t v26 = v7;
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ElementID();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_252890AEC();
  sub_252898570();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  uint64_t v22 = v10;
  uint64_t v13 = v12;
  uint64_t v14 = v24;
  char v30 = 0;
  sub_2528916C0(&qword_269C2DD90, MEMORY[0x263F07508]);
  uint64_t v15 = v27;
  uint64_t v16 = v25;
  sub_252898400();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  uint64_t v21 = (uint64_t)v13;
  v17(v13, v5, v15);
  char v28 = 1;
  sub_252890B94();
  sub_252898400();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v16);
  uint64_t v18 = v21;
  *(unsigned char *)(v21 + *(int *)(v22 + 20)) = v29;
  sub_25288A510(v18, v23);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_25288A5CC(v18);
}

uint64_t sub_25288E9A0()
{
  return sub_252898560();
}

uint64_t sub_25288EA50()
{
  return sub_252898540();
}

uint64_t sub_25288EAE8()
{
  return sub_252898560();
}

uint64_t sub_25288EB94@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ElementID.init(from:)(a1, a2);
}

uint64_t sub_25288EBAC(void *a1)
{
  return ElementID.encode(to:)(a1);
}

BOOL sub_25288EBC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) != 0
      && qword_25289ADD8[*(char *)(a1 + *(int *)(a3 + 20))] == qword_25289ADD8[*(char *)(a2 + *(int *)(a3 + 20))];
}

uint64_t ElementID.entityIdentifierString.getter()
{
  type metadata accessor for ElementID();
  uint64_t v1 = sub_252898490();
  sub_252897CF0();
  _s17HomeWidgetIntents0A2IDV11descriptionSSvg_0();
  sub_252897CF0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static ElementID.entityIdentifier(for:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DD98);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2528976E0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = a1;
  uint64_t v60 = a2;
  uint64_t v57 = 58;
  unint64_t v58 = 0xE100000000000000;
  sub_2528710F0();
  uint64_t v13 = (void *)sub_2528980F0();
  uint64_t v14 = v13;
  if (v13[2] != 2) {
    goto LABEL_37;
  }
  uint64_t v16 = v13[4];
  uint64_t v15 = v13[5];
  uint64_t v17 = HIBYTE(v15) & 0xF;
  uint64_t v18 = v16 & 0xFFFFFFFFFFFFLL;
  if (!((v15 & 0x2000000000000000) != 0 ? HIBYTE(v15) & 0xF : v16 & 0xFFFFFFFFFFFFLL)) {
    goto LABEL_37;
  }
  if ((v15 & 0x1000000000000000) != 0)
  {
    unint64_t v56 = (char *)v13[5];
    sub_2528974D0();
    uint64_t v15 = (uint64_t)sub_252890208(v16, v15, 10);
    LOBYTE(v16) = v52;
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
  if ((v15 & 0x2000000000000000) != 0)
  {
    uint64_t v59 = v13[4];
    uint64_t v60 = v15 & 0xFFFFFFFFFFFFFFLL;
    if (v16 == 43)
    {
      if (!v17)
      {
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
      if (v17 == 1 || (BYTE1(v16) - 48) > 9u) {
        goto LABEL_32;
      }
      uint64_t v15 = (BYTE1(v16) - 48);
      if (v17 == 2) {
        goto LABEL_34;
      }
      if ((BYTE2(v16) - 48) <= 9u)
      {
        uint64_t v15 = 10 * (BYTE1(v16) - 48) + (BYTE2(v16) - 48);
        uint64_t v22 = v17 - 3;
        if (v17 != 3)
        {
          uint64_t v23 = (unsigned __int8 *)&v59 + 3;
          while (1)
          {
            unsigned int v24 = *v23 - 48;
            if (v24 > 9) {
              goto LABEL_32;
            }
            uint64_t v25 = 10 * v15;
            if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63) {
              goto LABEL_32;
            }
            uint64_t v15 = v25 + v24;
            if (__OFADD__(v25, v24)) {
              goto LABEL_32;
            }
            LOBYTE(v16) = 0;
            ++v23;
            if (!--v22) {
              goto LABEL_35;
            }
          }
        }
        goto LABEL_34;
      }
    }
    else if (v16 == 45)
    {
      if (!v17)
      {
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
      if (v17 != 1 && (BYTE1(v16) - 48) <= 9u)
      {
        if (v17 == 2)
        {
          LOBYTE(v16) = 0;
          uint64_t v15 = -(uint64_t)(BYTE1(v16) - 48);
          goto LABEL_35;
        }
        if ((BYTE2(v16) - 48) <= 9u)
        {
          uint64_t v15 = -10 * (BYTE1(v16) - 48) - (BYTE2(v16) - 48);
          uint64_t v48 = v17 - 3;
          if (v17 != 3)
          {
            unint64_t v49 = (unsigned __int8 *)&v59 + 3;
            while (1)
            {
              unsigned int v50 = *v49 - 48;
              if (v50 > 9) {
                goto LABEL_32;
              }
              uint64_t v51 = 10 * v15;
              if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63) {
                goto LABEL_32;
              }
              uint64_t v15 = v51 - v50;
              if (__OFSUB__(v51, v50)) {
                goto LABEL_32;
              }
              LOBYTE(v16) = 0;
              ++v49;
              if (!--v48) {
                goto LABEL_35;
              }
            }
          }
LABEL_34:
          LOBYTE(v16) = 0;
          goto LABEL_35;
        }
      }
    }
    else if (v17 && (v16 - 48) <= 9u)
    {
      uint64_t v15 = (v16 - 48);
      if (v17 == 1) {
        goto LABEL_34;
      }
      if ((BYTE1(v16) - 48) <= 9u)
      {
        uint64_t v15 = 10 * (v16 - 48) + (BYTE1(v16) - 48);
        uint64_t v44 = v17 - 2;
        if (v17 != 2)
        {
          uint64_t v45 = (unsigned __int8 *)&v59 + 2;
          while (1)
          {
            unsigned int v46 = *v45 - 48;
            if (v46 > 9) {
              goto LABEL_32;
            }
            uint64_t v47 = 10 * v15;
            if ((unsigned __int128)(v15 * (__int128)10) >> 64 != (10 * v15) >> 63) {
              goto LABEL_32;
            }
            uint64_t v15 = v47 + v46;
            if (__OFADD__(v47, v46)) {
              goto LABEL_32;
            }
            LOBYTE(v16) = 0;
            ++v45;
            if (!--v44) {
              goto LABEL_35;
            }
          }
        }
        goto LABEL_34;
      }
    }
LABEL_32:
    uint64_t v15 = 0;
    LOBYTE(v16) = 1;
    goto LABEL_35;
  }
  if ((v16 & 0x1000000000000000) != 0) {
    uint64_t v20 = (unsigned __int8 *)((v15 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else {
    uint64_t v20 = (unsigned __int8 *)sub_2528982A0();
  }
  uint64_t v15 = (uint64_t)sub_2528902F0(v20, v18, 10);
  LOBYTE(v16) = v21 & 1;
LABEL_35:
  if ((v16 & 1) == 0)
  {
    char v26 = _s17HomeWidgetIntents9ElementIDV4KindO8rawValueAESgSi_tcfC_0(v15);
    if (v26 != 8)
    {
      unint64_t v56 = a3;
      if (v14[2] >= 2uLL)
      {
        LOBYTE(v15) = v26;
        uint64_t v34 = v10;
        uint64_t v36 = v14[6];
        uint64_t v35 = v14[7];
        sub_2528974D0();
        swift_bridgeObjectRelease();
        uint64_t v59 = v36;
        uint64_t v60 = v35;
        sub_252897D60();
        sub_252897660();
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v8, 1, v9) == 1)
        {
          sub_25287F0FC((uint64_t)v8);
          a3 = v56;
          goto LABEL_38;
        }
        uint64_t v55 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
        v55(v12, v8, v9);
        if (qword_269C2D3F0 == -1)
        {
LABEL_48:
          uint64_t v37 = sub_252897B80();
          __swift_project_value_buffer(v37, (uint64_t)qword_269C2E278);
          swift_bridgeObjectRetain_n();
          uint64_t v38 = sub_252897B60();
          os_log_type_t v39 = sub_252897FA0();
          if (os_log_type_enabled(v38, v39))
          {
            uint64_t v40 = (uint8_t *)swift_slowAlloc();
            uint64_t v54 = swift_slowAlloc();
            uint64_t v59 = v54;
            *(_DWORD *)uint64_t v40 = 136315138;
            v53[1] = v40 + 4;
            sub_2528974D0();
            uint64_t v57 = sub_252868708(a1, a2, &v59);
            sub_2528980D0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_252856000, v38, v39, "[entityIdentifier] Converting String: '%s' to ElementID", v40, 0xCu);
            uint64_t v41 = v54;
            swift_arrayDestroy();
            MEMORY[0x2533BFA60](v41, -1, -1);
            MEMORY[0x2533BFA60](v40, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          uint64_t v42 = v56;
          v55(v56, v12, v9);
          uint64_t v43 = type metadata accessor for ElementID();
          v42[*(int *)(v43 + 20)] = v15;
          return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 0, 1, v43);
        }
LABEL_73:
        swift_once();
        goto LABEL_48;
      }
      __break(1u);
      goto LABEL_71;
    }
  }
LABEL_37:
  swift_bridgeObjectRelease();
LABEL_38:
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_252897B80();
  __swift_project_value_buffer(v27, (uint64_t)qword_269C2E278);
  swift_bridgeObjectRetain_n();
  char v28 = sub_252897B60();
  os_log_type_t v29 = sub_252897FA0();
  if (os_log_type_enabled(v28, v29))
  {
    char v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    uint64_t v59 = v31;
    *(_DWORD *)char v30 = 136315138;
    sub_2528974D0();
    uint64_t v57 = sub_252868708(a1, a2, &v59);
    sub_2528980D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_252856000, v28, v29, "[entityIdentifier] Failed to convert string: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533BFA60](v31, -1, -1);
    MEMORY[0x2533BFA60](v30, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v32 = type metadata accessor for ElementID();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(a3, 1, 1, v32);
}

uint64_t sub_25288F500()
{
  uint64_t v1 = sub_252898490();
  sub_252897CF0();
  _s17HomeWidgetIntents0A2IDV11descriptionSSvg_0();
  sub_252897CF0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t _s17HomeWidgetIntents9ElementIDV4KindO16debugDescriptionSSvg_0(char a1)
{
  uint64_t result = 0x726F737365636341;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x656E656353;
      break;
    case 2:
      uint64_t result = 0x6F7250616964654DLL;
      break;
    case 3:
      uint64_t result = 0x737953616964654DLL;
      break;
    case 4:
      uint64_t result = 0x65636976726553;
      break;
    case 5:
      uint64_t result = 0x4765636976726553;
      break;
    case 6:
      uint64_t result = 0x614D65766974614ELL;
      break;
    case 7:
      uint64_t result = 0x6E776F6E6B6E55;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25288F6C0()
{
  uint64_t result = 0x726F737365636341;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656E656353;
      break;
    case 2:
      uint64_t result = 0x6F7250616964654DLL;
      break;
    case 3:
      uint64_t result = 0x737953616964654DLL;
      break;
    case 4:
      uint64_t result = 0x65636976726553;
      break;
    case 5:
      uint64_t result = 0x4765636976726553;
      break;
    case 6:
      uint64_t result = 0x614D65766974614ELL;
      break;
    case 7:
      uint64_t result = 0x6E776F6E6B6E55;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t ElementID.debugDescription.getter()
{
  return 0x49746E656D656C45;
}

uint64_t ElementID.init(nodeID:)@<X0>(uint64_t a1@<X8>)
{
  sub_25285CC3C();
  uint64_t result = type metadata accessor for ElementID();
  *(unsigned char *)(a1 + *(int *)(result + 20)) = 6;
  return result;
}

uint64_t ElementID.matterObjectIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + *(int *)(type metadata accessor for ElementID() + 20)) == 6
    && sub_25285CCC8() == 0xDEFFDEED00000000)
  {
    sub_25285CCE4();
    sub_252897680();
    uint64_t v3 = sub_2528976E0();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
    uint64_t v5 = v3;
    uint64_t v6 = a1;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = sub_2528976E0();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v5 = v8;
    uint64_t v6 = a1;
    uint64_t v7 = 1;
  }
  return v4(v6, v7, 1, v5);
}

void sub_25288FB24(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2528976E0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ElementID();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v38 - v12;
  sub_252891680();
  if ((sub_252898030() & 1) != 0 && (uint64_t v14 = sub_252897F70(), (v15 & 1) == 0) && (v16 = v14) != 0)
  {
    uint64_t v40 = v4;
    sub_25285CC3C();
    v13[*(int *)(v8 + 20)] = 6;
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_252897B80();
    __swift_project_value_buffer(v17, (uint64_t)qword_269C2E278);
    sub_25288A510((uint64_t)v13, (uint64_t)v11);
    uint64_t v18 = sub_252897B60();
    os_log_type_t v19 = sub_252897FD0();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v42 = v21;
      *(_DWORD *)uint64_t v20 = 136315650;
      uint64_t v41 = sub_252868708(0x4449797469746E65, 0xE800000000000000, &v42);
      uint64_t v39 = a2;
      sub_2528980D0();
      *(_WORD *)(v20 + 12) = 2048;
      uint64_t v41 = v16;
      sub_2528980D0();
      *(_WORD *)(v20 + 22) = 2080;
      sub_2528916C0(&qword_269C2E100, MEMORY[0x263F07508]);
      uint64_t v22 = sub_252898490();
      uint64_t v41 = sub_252868708(v22, v23, &v42);
      a2 = v39;
      sub_2528980D0();
      swift_bridgeObjectRelease();
      sub_25288A5CC((uint64_t)v11);
      _os_log_impl(&dword_252856000, v18, v19, "%s ElementID generated for Matter Accessory: %llu -> %s", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v21, -1, -1);
      MEMORY[0x2533BFA60](v20, -1, -1);
    }
    else
    {
      sub_25288A5CC((uint64_t)v11);
    }

    sub_25287821C((uint64_t)v13, a2);
  }
  else
  {
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_252897B80();
    __swift_project_value_buffer(v24, (uint64_t)qword_269C2E278);
    swift_unknownObjectRetain_n();
    uint64_t v25 = sub_252897B60();
    os_log_type_t v26 = sub_252897FD0();
    uint64_t v27 = &off_265383000;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      uint64_t v40 = v8;
      uint64_t v42 = v39;
      *(_DWORD *)uint64_t v28 = 136315394;
      uint64_t v41 = sub_252868708(0x4449797469746E65, 0xE800000000000000, &v42);
      sub_2528980D0();
      *(_WORD *)(v28 + 12) = 2080;
      v38[1] = v28 + 14;
      id v29 = objc_msgSend(a1, sel_uniqueIdentifier);
      sub_2528976A0();
      swift_unknownObjectRelease();

      sub_2528916C0(&qword_269C2E100, MEMORY[0x263F07508]);
      uint64_t v30 = sub_252898490();
      uint64_t v31 = v4;
      uint64_t v32 = a2;
      unint64_t v34 = v33;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v31);
      uint64_t v35 = v30;
      uint64_t v27 = &off_265383000;
      uint64_t v41 = sub_252868708(v35, v34, &v42);
      sub_2528980D0();
      swift_unknownObjectRelease();
      a2 = v32;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_252856000, v25, v26, "%s ElementID generated for HAP Accessory: %s", (uint8_t *)v28, 0x16u);
      uint64_t v36 = v39;
      swift_arrayDestroy();
      uint64_t v8 = v40;
      MEMORY[0x2533BFA60](v36, -1, -1);
      MEMORY[0x2533BFA60](v28, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    id v37 = [a1 (SEL)v27[133]];
    sub_2528976A0();

    *(unsigned char *)(a2 + *(int *)(v8 + 20)) = 0;
  }
}

void *sub_252890124(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DB50);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25289018C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_252897D50();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x2533BEC40](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unsigned __int8 *sub_252890208(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  sub_2528974D0();
  uint64_t v5 = sub_252897D60();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_25289056C();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    unint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v7 = (unsigned __int8 *)sub_2528982A0();
  }
LABEL_7:
  uint64_t v11 = sub_2528902F0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_2528902F0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_25289056C()
{
  unint64_t v0 = sub_252897D70();
  uint64_t v4 = sub_2528905EC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2528905EC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_252890744(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_252890124(v9, 0);
      unint64_t v12 = sub_252890844((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      sub_2528974D0();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_2528982A0();
LABEL_4:
        JUMPOUT(0x2533BEBF0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2533BEBF0](v11 + 4, v11[2]);
    sub_2528975E0();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2533BEBF0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_252890744(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_25289018C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_25289018C(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_252890844(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    uint64_t v9[2] = a6;
    v9[3] = a7;
    void v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_25289018C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_252897D40();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_2528982A0();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_25289018C(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_252897D10();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _s17HomeWidgetIntents9ElementIDV4KindO8rawValueAESgSi_tcfC_0(uint64_t a1)
{
  uint64_t result = 1;
  switch(a1)
  {
    case 0:
      uint64_t result = 0;
      break;
    case 1:
      return result;
    case 2:
      uint64_t result = 2;
      break;
    case 3:
      uint64_t result = 3;
      break;
    case 4:
      uint64_t result = 4;
      break;
    case 5:
      uint64_t result = 5;
      break;
    case 6:
      uint64_t result = 6;
      break;
    default:
      if (a1 == 10000) {
        uint64_t result = 7;
      }
      else {
        uint64_t result = 8;
      }
      break;
  }
  return result;
}

unint64_t sub_252890AEC()
{
  unint64_t result = qword_269C2E0B0;
  if (!qword_269C2E0B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E0B0);
  }
  return result;
}

unint64_t sub_252890B40()
{
  unint64_t result = qword_269C2E0B8;
  if (!qword_269C2E0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E0B8);
  }
  return result;
}

unint64_t sub_252890B94()
{
  unint64_t result = qword_269C2E0C8;
  if (!qword_269C2E0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E0C8);
  }
  return result;
}

unint64_t sub_252890BEC()
{
  unint64_t result = qword_269C2E0D0;
  if (!qword_269C2E0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E0D0);
  }
  return result;
}

uint64_t sub_252890C40()
{
  return sub_2528916C0((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
}

uint64_t sub_252890C88()
{
  return sub_2528916C0(&qword_269C2E0D8, (void (*)(uint64_t))type metadata accessor for ElementID);
}

void *initializeBufferWithCopyOfBuffer for ElementID(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    sub_2528974E0();
  }
  else
  {
    uint64_t v7 = sub_2528976E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t initializeWithCopy for ElementID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for ElementID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for ElementID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ElementID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for ElementID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252890FA0);
}

uint64_t sub_252890FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2528976E0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 8) {
      return v10 - 7;
    }
    else {
      return 0;
    }
  }
}

uint64_t storeEnumTagSinglePayload for ElementID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_252891070);
}

uint64_t sub_252891070(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2528976E0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 7;
  }
  return result;
}

uint64_t sub_25289112C()
{
  uint64_t result = sub_2528976E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ElementID.Kind(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ElementID.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x25289131CLL);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ElementID.Kind()
{
  return &type metadata for ElementID.Kind;
}

unsigned char *storeEnumTagSinglePayload for ElementID.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x252891420);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ElementID.CodingKeys()
{
  return &type metadata for ElementID.CodingKeys;
}

unint64_t sub_25289145C()
{
  unint64_t result = qword_269C2E0E0;
  if (!qword_269C2E0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E0E0);
  }
  return result;
}

unint64_t sub_2528914B4()
{
  unint64_t result = qword_269C2E0E8;
  if (!qword_269C2E0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E0E8);
  }
  return result;
}

unint64_t sub_25289150C()
{
  unint64_t result = qword_269C2E0F0;
  if (!qword_269C2E0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E0F0);
  }
  return result;
}

uint64_t sub_252891560(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_2528984C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1684957547 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2528984C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

unint64_t sub_25289162C()
{
  unint64_t result = qword_269C2E0F8;
  if (!qword_269C2E0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E0F8);
  }
  return result;
}

unint64_t sub_252891680()
{
  unint64_t result = qword_269C2DC00;
  if (!qword_269C2DC00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C2DC00);
  }
  return result;
}

uint64_t sub_2528916C0(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_252891708()
{
  type metadata accessor for AppIntentSupport();
  uint64_t inited = swift_initStaticObject();
  sub_252892738();
  qword_269C2E2A8 = inited;
}

uint64_t sub_252891744(uint64_t a1, uint64_t a2)
{
  v2[16] = a1;
  v2[17] = a2;
  sub_252897E80();
  v2[18] = sub_252897E70();
  uint64_t v4 = sub_252897E60();
  v2[19] = v4;
  v2[20] = v3;
  return MEMORY[0x270FA2498](sub_2528917DC, v4, v3);
}

uint64_t sub_2528917DC()
{
  uint64_t v39 = v0;
  self;
  unint64_t v1 = (void *)swift_dynamicCastObjCClass();
  if (v1)
  {
    id v2 = *(id *)(v0 + 136);
  }
  else
  {
    id v18 = (id)INTypedIntentWithIntent();
    if (!v18)
    {
      sub_2528975E0();
      unint64_t v1 = 0;
      goto LABEL_13;
    }
    char v19 = v18;
    self;
    unint64_t v1 = (void *)swift_dynamicCastObjCClass();
    if (!v1)
    {

      sub_2528975E0();
LABEL_13:
      if (qword_269C2D3F0 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_252897B80();
      __swift_project_value_buffer(v20, (uint64_t)qword_269C2E278);
      id v21 = v1;
      uint64_t v22 = sub_252897B60();
      os_log_type_t v23 = sub_252897FB0();
      if (os_log_type_enabled(v22, v23))
      {
        unsigned __int8 v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        uint64_t v38 = v25;
        *(_DWORD *)unsigned __int8 v24 = 136315138;
        *(void *)(v0 + 112) = v1;
        id v26 = v21;
        __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E128);
        uint64_t v27 = sub_252897CC0();
        *(void *)(v0 + 120) = sub_252868708(v27, v28, &v38);
        sub_2528980D0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_252856000, v22, v23, "Failed to lazily load link for: %s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2533BFA60](v25, -1, -1);
        MEMORY[0x2533BFA60](v24, -1, -1);
      }
      else
      {
      }
      sub_252892E88();
      swift_allocError();
      swift_willThrow();

      id v29 = *(uint64_t (**)(void))(v0 + 8);
      return v29();
    }
  }
  *(void *)(v0 + 168) = v1;
  id v3 = objc_msgSend(v1, sel_linkAction);
  *(void *)(v0 + 176) = v3;
  if (!v3)
  {
    sub_2528975E0();
    goto LABEL_13;
  }
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_identifier);
  uint64_t v6 = sub_252897CB0();
  uint64_t v8 = v7;

  if (v6 == 0xD00000000000001FLL && v8 == 0x800000025289BE80 || (sub_2528984C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = *(uint64_t **)(v0 + 128);
    *(void *)(v0 + 104) = sub_252892EDC();
    *(void *)(v0 + 80) = v4;
    uint64_t v10 = v0 + 80;
    uint64_t v11 = &type metadata for HomeXLModuleConfigurationIntent;
    v9[3] = (uint64_t)&type metadata for HomeXLModuleConfigurationIntent;
    unint64_t v12 = sub_25285FE10();
    void v9[4] = v12;
    uint64_t v13 = swift_allocObject();
    uint64_t v14 = v13 + 16;
    *uint64_t v9 = v13;
    id v15 = v4;
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_252891D90;
    uint64_t v17 = v14;
LABEL_26:
    return MEMORY[0x270EE0D38](v17, v10, v11, v12);
  }
  if (v6 == 0xD000000000000021 && v8 == 0x800000025289BEA0)
  {
    swift_bridgeObjectRelease();
LABEL_25:
    uint64_t v32 = *(void *)(v0 + 128);
    *(void *)(v0 + 72) = sub_252892EDC();
    *(void *)(v0 + 48) = v4;
    uint64_t v10 = v0 + 48;
    uint64_t v11 = &type metadata for HomeSingleTileConfigurationIntent;
    *(void *)(v32 + 24) = &type metadata for HomeSingleTileConfigurationIntent;
    unint64_t v12 = sub_25287D374();
    *(void *)(v32 + 32) = v12;
    id v33 = v4;
    unint64_t v34 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v34;
    *unint64_t v34 = v0;
    v34[1] = sub_252891F14;
    uint64_t v17 = *(void *)(v0 + 128);
    goto LABEL_26;
  }
  char v31 = sub_2528984C0();
  swift_bridgeObjectRelease();
  if (v31) {
    goto LABEL_25;
  }
  *(void *)(v0 + 40) = sub_252892EDC();
  *(void *)(v0 + 16) = v4;
  id v35 = v4;
  uint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v36;
  *uint64_t v36 = v0;
  v36[1] = sub_252892028;
  uint64_t v37 = *(void *)(v0 + 128);
  return MEMORY[0x270EE09D8](v37, v0 + 16);
}

uint64_t sub_252891D90()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  uint64_t v4 = *(void *)(v2 + 160);
  if (v0) {
    id v5 = sub_252892144;
  }
  else {
    id v5 = sub_252891EA4;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_252891EA4()
{
  unint64_t v1 = (void *)v0[21];
  uint64_t v2 = (void *)v0[22];
  sub_2528975E0();

  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_252891F14()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  uint64_t v4 = *(void *)(v2 + 160);
  if (v0) {
    uint64_t v5 = sub_2528921CC;
  }
  else {
    uint64_t v5 = sub_252893020;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_252892028()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 224) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_252892254;
  }
  else
  {
    sub_252892F1C(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 152);
    uint64_t v4 = *(void *)(v2 + 160);
    uint64_t v5 = sub_252893020;
  }
  return MEMORY[0x270FA2498](v5, v3, v4);
}

uint64_t sub_252892144()
{
  unint64_t v1 = *(void **)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 128);

  sub_2528975E0();
  __swift_deallocate_boxed_opaque_existential_1(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_2528921CC()
{
  unint64_t v1 = *(void **)(v0 + 176);
  uint64_t v2 = *(void *)(v0 + 128);

  sub_2528975E0();
  __swift_deallocate_boxed_opaque_existential_1(v2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_252892254()
{
  unint64_t v1 = *(void **)(v0 + 176);

  sub_2528975E0();
  sub_252892F1C(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t static INIntent.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t INIntent.Error.hash(into:)()
{
  return sub_252898540();
}

uint64_t INIntent.Error.hashValue.getter()
{
  return sub_252898560();
}

id static INIntentUtils.typeErasedAppIntent<A>(_:)()
{
  if (qword_269C2D430 != -1) {
    swift_once();
  }
  return sub_252892A10();
}

uint64_t static INIntentUtils.fromTypeErasedAppIntent(_:)(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_252897E80();
  v2[4] = sub_252897E70();
  uint64_t v4 = sub_252897E60();
  v2[5] = v4;
  v2[6] = v3;
  return MEMORY[0x270FA2498](sub_252892470, v4, v3);
}

uint64_t sub_252892470()
{
  if (qword_269C2D430 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)swift_task_alloc();
  v0[7] = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_252892534;
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  return sub_252891744(v2, v3);
}

uint64_t sub_252892534()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void *)(v2 + 40);
  if (v0) {
    uint64_t v5 = sub_2528926D4;
  }
  else {
    uint64_t v5 = sub_252892670;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_252892670()
{
  sub_2528975E0();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2528926D4()
{
  sub_2528975E0();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_252892738()
{
  if (qword_269C2D3F0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_252897B80();
  __swift_project_value_buffer(v0, (uint64_t)qword_269C2E278);
  unint64_t v1 = sub_252897B60();
  os_log_type_t v2 = sub_252897FD0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_252856000, v1, v2, "AppIntentSupport.registerAppIntents() called", v3, 2u);
    MEMORY[0x2533BFA60](v3, -1, -1);
  }

  sub_252897310();
  sub_2528972F0();
  type metadata accessor for IntentsService();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_252897300();
  sub_2528975E0();
}

id sub_252892A10()
{
  sub_252897220();
  sub_2528972E0();
  sub_252897280();
  id v0 = objc_allocWithZone(MEMORY[0x263F0F9A0]);
  unint64_t v1 = (void *)sub_252897CA0();
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1Tm(v16, v16[3]);
  uint64_t v2 = sub_2528984B0();
  __swift_project_boxed_opaque_existential_1Tm(v15, v15[3]);
  id v3 = objc_msgSend(v0, sel_initWithAppBundleIdentifier_linkAction_linkActionMetadata_, v1, v2, sub_2528984B0());
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  id v4 = v3;
  id v5 = (void *)sub_252897CA0();
  objc_msgSend(v4, sel__setExtensionBundleId_, v5);

  id v6 = (id)INIntentWithTypedIntent();
  if (!v6)
  {
    if (qword_269C2D3F0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_252897B80();
    __swift_project_value_buffer(v7, (uint64_t)qword_269C2E278);
    uint64_t v8 = sub_252897B60();
    os_log_type_t v9 = sub_252897FB0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      v16[0] = v11;
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_getMetatypeMetadata();
      uint64_t v12 = sub_2528985B0();
      v15[0] = sub_252868708(v12, v13, v16);
      sub_2528980D0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_252856000, v8, v9, "Failed to build INIntent using INIntentWithTypedIntent with %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2533BFA60](v11, -1, -1);
      MEMORY[0x2533BFA60](v10, -1, -1);
    }

    sub_252892E88();
    swift_allocError();
    swift_willThrow();
  }

  return v6;
}

unint64_t sub_252892D2C()
{
  unint64_t result = qword_269C2E118;
  if (!qword_269C2E118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E118);
  }
  return result;
}

uint64_t type metadata accessor for AppIntentSupport()
{
  return self;
}

unsigned char *_s5ErrorOwst(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x252892E40);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for INIntent.Error()
{
  return &type metadata for INIntent.Error;
}

ValueMetadata *type metadata accessor for INIntentUtils()
{
  return &type metadata for INIntentUtils;
}

unint64_t sub_252892E88()
{
  unint64_t result = qword_269C2E120;
  if (!qword_269C2E120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E120);
  }
  return result;
}

unint64_t sub_252892EDC()
{
  unint64_t result = qword_269C2E130;
  if (!qword_269C2E130)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269C2E130);
  }
  return result;
}

uint64_t sub_252892F1C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E138);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x2533BFA60);
  }
  return result;
}

uint64_t sub_252892FD0()
{
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  sub_2528975E0();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_252893024(unint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      id v3 = objc_msgSend(v1, sel_homes);
      sub_2528607F8();
      sub_252897DD0();
    }
    else
    {
      id v10 = objc_msgSend(v1, sel_homes);
      sub_2528607F8();
      unint64_t v11 = sub_252897DD0();

      sub_2528712A8(a1);
      sub_252894870(v11, a1);
      sub_252870240(a1);
      swift_bridgeObjectRelease();
    }
    uint64_t v4 = sub_252897F80();
    MEMORY[0x270FA5388](v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DAE8);
    sub_252894828(&qword_269C2DAF0);
    sub_252895748(&qword_269C2DBD0, (void (*)(uint64_t))sub_2528607F8);
    sub_252895748(&qword_269C2DBD8, (void (*)(uint64_t))sub_2528607F8);
    sub_252895748(&qword_269C2DBE0, (void (*)(uint64_t))sub_2528607F8);
    uint64_t KeyPath = swift_getKeyPath();
    MEMORY[0x270FA5388](KeyPath);
    sub_252894828(&qword_269C2DBE8);
    sub_2528974E0();
    uint64_t v8 = sub_252897D80();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release_n();
  }
  else
  {
    id v6 = objc_msgSend(self, sel_sharedDispatcher);
    id v7 = objc_msgSend(v6, sel_home);

    uint64_t v8 = MEMORY[0x263F8EE78];
    uint64_t v13 = MEMORY[0x263F8EE78];
    if (v7)
    {
      id v9 = v7;
      MEMORY[0x2533BECE0]();
      if (*(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_252897E00();
      }
      sub_252897E30();
      sub_252897DF0();
      uint64_t v8 = v13;
    }
    else
    {
    }
  }
  return v8;
}

uint64_t sub_252893578(void *a1, uint64_t a2)
{
  uint64_t v26 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E1A0);
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  MEMORY[0x270FA5388](v3);
  os_log_type_t v23 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E1A8);
  uint64_t v21 = *(void *)(v5 - 8);
  uint64_t v22 = v5;
  MEMORY[0x270FA5388](v5);
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E1B0);
  uint64_t v20 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E1B8);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_252895564();
  uint64_t v15 = v26;
  sub_252898580();
  if (!v15)
  {
    char v28 = 0;
    sub_252895660();
    sub_252898420();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  if (v15 == 1)
  {
    char v29 = 1;
    sub_25289560C();
    sub_252898420();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  char v30 = 2;
  sub_2528955B8();
  uint64_t v17 = v23;
  sub_252898420();
  uint64_t v27 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E180);
  sub_2528956B4(&qword_269C2E1C0, &qword_269C2DFF8);
  uint64_t v18 = v25;
  sub_252898460();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_252893980()
{
  return 0;
}

uint64_t sub_25289398C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2528939BC(uint64_t a1)
{
  unint64_t v2 = sub_25289560C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2528939F8(uint64_t a1)
{
  unint64_t v2 = sub_25289560C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252893A34()
{
  uint64_t v1 = 7105633;
  if (*v0 != 1) {
    uint64_t v1 = 2037149295;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x746E6572727563;
  }
}

uint64_t sub_252893A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_252894E7C(a1, a2);
  *a3 = result;
  return result;
}

void sub_252893AA8(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_252893AB4(uint64_t a1)
{
  unint64_t v2 = sub_252895564();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252893AF0(uint64_t a1)
{
  unint64_t v2 = sub_252895564();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252893B2C(uint64_t a1)
{
  unint64_t v2 = sub_252895660();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252893B68(uint64_t a1)
{
  unint64_t v2 = sub_252895660();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252893BA4()
{
  return 12383;
}

uint64_t sub_252893BB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_2528984C0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_252893C30(uint64_t a1)
{
  unint64_t v2 = sub_2528955B8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_252893C6C(uint64_t a1)
{
  unint64_t v2 = sub_2528955B8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_252893CA8(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = *a2;
  if (!v2) {
    return !v3;
  }
  if (v2 == 1) {
    return v3 == 1;
  }
  if (v3 < 2) {
    return 0;
  }
  return sub_252893F6C(v2, v3);
}

uint64_t sub_252893CE8()
{
  unint64_t v1 = *v0;
  sub_252898530();
  sub_252898540();
  if (v1 > 1) {
    sub_252894430(v3, v1);
  }
  return sub_252898560();
}

uint64_t sub_252893D5C(long long *a1)
{
  uint64_t v3 = *v1;
  if (!*v1 || v3 == 1) {
    return sub_252898540();
  }
  sub_252898540();
  return sub_252894430(a1, v3);
}

uint64_t sub_252893DDC()
{
  unint64_t v1 = *v0;
  sub_252898530();
  sub_252898540();
  if (v1 > 1) {
    sub_252894430(v3, v1);
  }
  return sub_252898560();
}

uint64_t sub_252893E4C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_252894FB4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_252893E78(void *a1)
{
  return sub_252893578(a1, *v1);
}

uint64_t sub_252893E94()
{
  if (!*v0) {
    return 0x746E6572727563;
  }
  if (*v0 == 1) {
    return 7105633;
  }
  type metadata accessor for HomeID();
  sub_252895748(&qword_269C2DA80, (void (*)(uint64_t))type metadata accessor for HomeID);
  sub_252897EE0();
  sub_252897CF0();
  swift_bridgeObjectRelease();
  return 0x3A796C6E6FLL;
}

uint64_t sub_252893F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeID() - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v10 = (char *)&v34 - v9;
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v14 = (char *)&v34 - v13;
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v15 = 0;
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v34 = a1;
  uint64_t v35 = a1 + 56;
  uint64_t v17 = 1 << *(unsigned char *)(a1 + 32);
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  int64_t v36 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v20 = a2 + 56;
  if (!v19) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v37 = (v19 - 1) & v19;
  int64_t v38 = v15;
  for (unint64_t i = __clz(__rbit64(v19)) | (v15 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v24 << 6))
  {
    uint64_t v26 = v12;
    uint64_t v27 = *(void *)(v12 + 72);
    sub_25288D89C(*(void *)(a1 + 48) + v27 * i, (uint64_t)v14);
    char v28 = v14;
    sub_25287ED1C((uint64_t)v14, (uint64_t)v10);
    sub_252898530();
    sub_2528976E0();
    sub_252895748((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
    sub_252897C20();
    uint64_t v29 = sub_252898560();
    uint64_t v30 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v31 = v29 & ~v30;
    if (((*(void *)(v20 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
    {
LABEL_29:
      sub_25285CAFC((uint64_t)v10);
      return 0;
    }
    uint64_t v32 = ~v30;
    while (1)
    {
      sub_25288D89C(*(void *)(a2 + 48) + v31 * v27, (uint64_t)v7);
      char v33 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
      sub_25285CAFC((uint64_t)v7);
      if (v33) {
        break;
      }
      unint64_t v31 = (v31 + 1) & v32;
      if (((*(void *)(v20 + ((v31 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v31) & 1) == 0) {
        goto LABEL_29;
      }
    }
    uint64_t result = sub_25285CAFC((uint64_t)v10);
    a1 = v34;
    uint64_t v12 = v26;
    uint64_t v14 = v28;
    unint64_t v19 = v37;
    int64_t v15 = v38;
    if (v37) {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v22 >= v36) {
      return 1;
    }
    unint64_t v23 = *(void *)(v35 + 8 * v22);
    int64_t v24 = v15 + 1;
    if (!v23)
    {
      int64_t v24 = v15 + 2;
      if (v15 + 2 >= v36) {
        return 1;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v24);
      if (!v23)
      {
        int64_t v24 = v15 + 3;
        if (v15 + 3 >= v36) {
          return 1;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          int64_t v24 = v15 + 4;
          if (v15 + 4 >= v36) {
            return 1;
          }
          unint64_t v23 = *(void *)(v35 + 8 * v24);
          if (!v23) {
            break;
          }
        }
      }
    }
LABEL_24:
    uint64_t v37 = (v23 - 1) & v23;
    int64_t v38 = v24;
  }
  uint64_t v25 = v15 + 5;
  if (v15 + 5 >= v36) {
    return 1;
  }
  unint64_t v23 = *(void *)(v35 + 8 * v25);
  if (v23)
  {
    int64_t v24 = v15 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v24 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v24 >= v36) {
      return 1;
    }
    unint64_t v23 = *(void *)(v35 + 8 * v24);
    ++v25;
    if (v23) {
      goto LABEL_24;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_2528942F0@<X0>(uint64_t *a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t result = sub_252897880();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_252894354()
{
  return 48;
}

__n128 sub_252894360(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_252894378@<X0>(uint64_t *a1@<X8>)
{
  sub_2528710F0();
  uint64_t result = sub_252898100();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2528943C4@<X0>(uint64_t *a1@<X8>)
{
  sub_2528710F0();
  uint64_t result = sub_252898100();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_252894410()
{
  return 48;
}

__n128 sub_25289441C(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_252894430(long long *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D970);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *((void *)a1 + 8);
  long long v12 = a1[1];
  long long v34 = *a1;
  long long v35 = v12;
  long long v13 = a1[2];
  long long v14 = a1[3];
  v28[1] = a1;
  long long v36 = v13;
  long long v37 = v14;
  uint64_t v38 = v11;
  uint64_t v30 = sub_252898560();
  uint64_t v15 = a2 + 56;
  uint64_t v16 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(a2 + 56);
  int64_t v29 = (unint64_t)(v16 + 63) >> 6;
  uint64_t v31 = v5 + 48;
  uint64_t v32 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  uint64_t v33 = a2;
  uint64_t result = sub_2528974D0();
  uint64_t v20 = 0;
  int64_t v21 = 0;
  if (!v18) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v22 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  for (unint64_t i = v22 | (v21 << 6); ; unint64_t i = __clz(__rbit64(v25)) + (v21 << 6))
  {
    sub_25288D89C(*(void *)(v33 + 48) + *(void *)(v5 + 72) * i, (uint64_t)v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1) {
      goto LABEL_19;
    }
    sub_25287ED1C((uint64_t)v10, (uint64_t)v7);
    sub_252898530();
    sub_2528976E0();
    sub_252895748((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]);
    sub_252897C20();
    uint64_t v27 = sub_252898560();
    uint64_t result = sub_25285CAFC((uint64_t)v7);
    v20 ^= v27;
    if (v18) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v21++, 1)) {
      goto LABEL_21;
    }
    if (v21 >= v29) {
      goto LABEL_18;
    }
    unint64_t v25 = *(void *)(v15 + 8 * v21);
    if (!v25) {
      break;
    }
LABEL_14:
    unint64_t v18 = (v25 - 1) & v25;
  }
  int64_t v26 = v21 + 1;
  if (v21 + 1 >= v29)
  {
LABEL_18:
    (*v32)(v10, 1, 1, v4);
LABEL_19:
    sub_2528975E0();
    return sub_252898540();
  }
  unint64_t v25 = *(void *)(v15 + 8 * v26);
  if (v25)
  {
    ++v21;
    goto LABEL_14;
  }
  while (1)
  {
    int64_t v21 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v21 >= v29) {
      goto LABEL_18;
    }
    unint64_t v25 = *(void *)(v15 + 8 * v21);
    ++v26;
    if (v25) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_252894784()
{
  swift_getAtKeyPath();
  return v1;
}

uint64_t sub_2528947BC@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(uint64_t *)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t result = a2(&v6);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_252894804()
{
  return sub_252898080();
}

uint64_t sub_252894828(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C2DAE8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_252894870(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for HomeID();
  uint64_t v25 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v22 - v10;
  uint64_t v31 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_21:
    uint64_t v12 = sub_252898350();
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v12)
    {
LABEL_3:
      unint64_t v23 = a1;
      uint64_t v24 = v3;
      unint64_t v13 = 0;
      uint64_t v28 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v29 = a1 & 0xC000000000000001;
      unint64_t v26 = a1 + 32;
      uint64_t v27 = v12;
      uint64_t v14 = a2 + 56;
      while (1)
      {
        if (v29)
        {
          id v15 = (id)MEMORY[0x2533BF180](v13, v23);
          BOOL v16 = __OFADD__(v13++, 1);
          if (v16)
          {
LABEL_18:
            __break(1u);
            return v31;
          }
        }
        else
        {
          if (v13 >= *(void *)(v28 + 16))
          {
            __break(1u);
            goto LABEL_21;
          }
          id v15 = *(id *)(v26 + 8 * v13);
          BOOL v16 = __OFADD__(v13++, 1);
          if (v16) {
            goto LABEL_18;
          }
        }
        id v30 = v15;
        a1 = (unint64_t)objc_msgSend(v15, sel_uniqueIdentifier);
        sub_2528976A0();

        if (*(void *)(a2 + 16)
          && (sub_252898530(),
              uint64_t v3 = sub_2528976E0(),
              sub_252895748((unint64_t *)&qword_269C2DC40, MEMORY[0x263F07508]),
              sub_252897C20(),
              uint64_t v17 = sub_252898560(),
              uint64_t v18 = -1 << *(unsigned char *)(a2 + 32),
              a1 = v17 & ~v18,
              ((*(void *)(v14 + ((a1 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a1) & 1) != 0))
        {
          uint64_t v19 = ~v18;
          uint64_t v20 = *(void *)(v25 + 72);
          while (1)
          {
            sub_25288D89C(*(void *)(a2 + 48) + v20 * a1, (uint64_t)v9);
            uint64_t v3 = _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0();
            sub_25285CAFC((uint64_t)v9);
            if (v3) {
              break;
            }
            a1 = (a1 + 1) & v19;
            if (((*(void *)(v14 + ((a1 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a1) & 1) == 0) {
              goto LABEL_4;
            }
          }
          sub_25285CAFC((uint64_t)v11);
          a1 = (unint64_t)&v31;
          sub_2528982B0();
          uint64_t v3 = *(void *)(v31 + 16);
          sub_2528982F0();
          sub_252898300();
          sub_2528982C0();
        }
        else
        {
LABEL_4:
          sub_25285CAFC((uint64_t)v11);
        }
        if (v13 == v27) {
          return v31;
        }
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_252894B70()
{
  swift_getAtKeyPath();
  return v1;
}

uint64_t sub_252894BA8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  uint64_t v7 = *a1;
  uint64_t result = v4(&v7);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeScope(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = sub_2528974D0();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for HomeScope(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for HomeScope(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      sub_2528974D0();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    sub_2528974D0();
    swift_bridgeObjectRelease();
  }
  return a1;
}

unint64_t *assignWithTake for HomeScope(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeScope(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for HomeScope(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_252894DDC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_252894DF4(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for HomeScope()
{
  return &type metadata for HomeScope;
}

unint64_t sub_252894E28()
{
  unint64_t result = qword_269C2E140;
  if (!qword_269C2E140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E140);
  }
  return result;
}

uint64_t sub_252894E7C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746E6572727563 && a2 == 0xE700000000000000;
  if (v2 || (sub_2528984C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7105633 && a2 == 0xE300000000000000 || (sub_2528984C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 2037149295 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2528984C0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_252894FB4(void *a1)
{
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E148);
  uint64_t v28 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  unint64_t v29 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E150);
  uint64_t v27 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  unsigned int v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E158);
  uint64_t v24 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E160);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  id v30 = a1;
  uint64_t v13 = (uint64_t)__swift_project_boxed_opaque_existential_1Tm(a1, v12);
  sub_252895564();
  uint64_t v14 = v31;
  sub_252898570();
  if (!v14)
  {
    uint64_t v31 = v5;
    id v15 = v29;
    uint64_t v16 = sub_252898410();
    if (*(void *)(v16 + 16) == 1)
    {
      if (*(unsigned char *)(v16 + 32))
      {
        if (*(unsigned char *)(v16 + 32) == 1)
        {
          char v34 = 1;
          sub_25289560C();
          sub_2528983B0();
          (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v25);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
          uint64_t v13 = 1;
        }
        else
        {
          char v35 = 2;
          sub_2528955B8();
          sub_2528983B0();
          __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E180);
          sub_2528956B4(&qword_269C2E188, &qword_269C2E008);
          int64_t v21 = v15;
          uint64_t v22 = v26;
          sub_252898400();
          (*(void (**)(char *, uint64_t))(v28 + 8))(v21, v22);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
          uint64_t v13 = v32;
        }
      }
      else
      {
        char v33 = 0;
        sub_252895660();
        sub_2528983B0();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v31);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v17 = sub_252898290();
      swift_allocError();
      uint64_t v19 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E170);
      *uint64_t v19 = &type metadata for HomeScope;
      uint64_t v13 = (uint64_t)v11;
      sub_2528983C0();
      sub_252898280();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCB0], v17);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  return v13;
}

unint64_t sub_252895564()
{
  unint64_t result = qword_269C2E168;
  if (!qword_269C2E168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E168);
  }
  return result;
}

unint64_t sub_2528955B8()
{
  unint64_t result = qword_269C2E178;
  if (!qword_269C2E178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E178);
  }
  return result;
}

unint64_t sub_25289560C()
{
  unint64_t result = qword_269C2E190;
  if (!qword_269C2E190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E190);
  }
  return result;
}

unint64_t sub_252895660()
{
  unint64_t result = qword_269C2E198;
  if (!qword_269C2E198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E198);
  }
  return result;
}

uint64_t sub_2528956B4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C2E180);
    sub_252895748(a2, (void (*)(uint64_t))type metadata accessor for HomeID);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_252895748(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for HomeScope.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x25289585CLL);
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

ValueMetadata *type metadata accessor for HomeScope.CodingKeys()
{
  return &type metadata for HomeScope.CodingKeys;
}

ValueMetadata *type metadata accessor for HomeScope.CurrentCodingKeys()
{
  return &type metadata for HomeScope.CurrentCodingKeys;
}

ValueMetadata *type metadata accessor for HomeScope.AllCodingKeys()
{
  return &type metadata for HomeScope.AllCodingKeys;
}

unsigned char *storeEnumTagSinglePayload for HomeScope.OnlyCodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x252895950);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeScope.OnlyCodingKeys()
{
  return &type metadata for HomeScope.OnlyCodingKeys;
}

unint64_t sub_25289598C()
{
  unint64_t result = qword_269C2E1C8;
  if (!qword_269C2E1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E1C8);
  }
  return result;
}

unint64_t sub_2528959E4()
{
  unint64_t result = qword_269C2E1D0;
  if (!qword_269C2E1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E1D0);
  }
  return result;
}

unint64_t sub_252895A3C()
{
  unint64_t result = qword_269C2E1D8;
  if (!qword_269C2E1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E1D8);
  }
  return result;
}

unint64_t sub_252895A94()
{
  unint64_t result = qword_269C2E1E0;
  if (!qword_269C2E1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E1E0);
  }
  return result;
}

unint64_t sub_252895AEC()
{
  unint64_t result = qword_269C2E1E8;
  if (!qword_269C2E1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E1E8);
  }
  return result;
}

unint64_t sub_252895B44()
{
  unint64_t result = qword_269C2E1F0;
  if (!qword_269C2E1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E1F0);
  }
  return result;
}

unint64_t sub_252895B9C()
{
  unint64_t result = qword_269C2E1F8;
  if (!qword_269C2E1F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E1F8);
  }
  return result;
}

unint64_t sub_252895BF4()
{
  unint64_t result = qword_269C2E200;
  if (!qword_269C2E200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E200);
  }
  return result;
}

unint64_t sub_252895C4C()
{
  unint64_t result = qword_269C2E208;
  if (!qword_269C2E208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E208);
  }
  return result;
}

unint64_t sub_252895CA4()
{
  unint64_t result = qword_269C2E210;
  if (!qword_269C2E210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E210);
  }
  return result;
}

uint64_t sub_252895D00()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269C2E048);
  swift_getKeyPath();
  uint64_t result = sub_252897570();
  qword_269C2E218 = result;
  return result;
}

uint64_t static HomeSingleTileEntity.defaultQuery.getter@<X0>(void *a1@<X8>)
{
  if (qword_269C2D438 != -1) {
    swift_once();
  }
  *a1 = qword_269C2E218;
  return sub_2528974E0();
}

uint64_t sub_252895DB0()
{
  uint64_t v0 = sub_252897590();
  __swift_allocate_value_buffer(v0, qword_269C2E220);
  __swift_project_value_buffer(v0, (uint64_t)qword_269C2E220);
  return sub_252897580();
}

uint64_t static HomeSingleTileEntity.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D440 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897590();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2E220);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t HomeSingleTileEntity.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_252879BE4(v1, a1, (uint64_t (*)(void))type metadata accessor for ElementID);
}

uint64_t HomeSingleTileEntity.homeID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for HomeSingleTileEntity();
  return sub_252879BE4(v1 + *(int *)(v3 + 20), a1, (uint64_t (*)(void))type metadata accessor for HomeID);
}

uint64_t type metadata accessor for HomeSingleTileEntity()
{
  uint64_t result = qword_26B22D7A8;
  if (!qword_26B22D7A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t HomeSingleTileEntity.item.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for HomeSingleTileEntity();
  return sub_252879BE4(v1 + *(int *)(v3 + 24), a1, (uint64_t (*)(void))type metadata accessor for TileElementInfo);
}

uint64_t HomeSingleTileEntity.displayRepresentation.getter()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2DA50);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C2D9E0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_252897630();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = sub_252897C80();
  MEMORY[0x270FA5388](v6 - 8);
  sub_252897C70();
  sub_252897C60();
  type metadata accessor for HomeSingleTileEntity();
  type metadata accessor for TileElementInfo();
  sub_252897C50();
  sub_252897C60();
  sub_252897620();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  sub_2528974D0();
  sub_252897460();
  return sub_252897480();
}

uint64_t HomeSingleTileEntity.hash(into:)()
{
  return TileElementInfo.hash(into:)();
}

uint64_t static HomeSingleTileEntity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for ElementID();
  if (qword_25289B6F0[*(char *)(a1 + *(int *)(v4 + 20))] != qword_25289B6F0[*(char *)(a2 + *(int *)(v4 + 20))]) {
    return 0;
  }
  uint64_t v5 = type metadata accessor for HomeSingleTileEntity();
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(v5 + 24);
  return _s17HomeWidgetIntents15TileElementInfoV2eeoiySbAC_ACtFZ_0(a1 + v6, a2 + v6);
}

uint64_t HomeSingleTileEntity.hashValue.getter()
{
  return sub_252898560();
}

uint64_t sub_2528964B0@<X0>(void *a1@<X8>)
{
  if (qword_269C2D438 != -1) {
    swift_once();
  }
  *a1 = qword_269C2E218;
  return sub_2528974E0();
}

uint64_t sub_25289651C()
{
  return sub_252898560();
}

uint64_t sub_25289660C()
{
  return TileElementInfo.hash(into:)();
}

uint64_t sub_2528966E4()
{
  return sub_252898560();
}

uint64_t sub_2528967D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = type metadata accessor for ElementID();
  if (qword_25289B6F0[*(char *)(a1 + *(int *)(v6 + 20))] != qword_25289B6F0[*(char *)(a2 + *(int *)(v6 + 20))]
    || (_s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0() & 1) == 0)
  {
    return 0;
  }
  uint64_t v7 = *(int *)(a3 + 24);
  return _s17HomeWidgetIntents15TileElementInfoV2eeoiySbAC_ACtFZ_0(a1 + v7, a2 + v7);
}

uint64_t sub_252896878@<X0>(uint64_t a1@<X8>)
{
  if (qword_269C2D440 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_252897590();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_269C2E220);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_252896920(uint64_t a1)
{
  uint64_t v2 = sub_252896EB0(&qword_269C2DD38, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
  return MEMORY[0x270EE0C68](a1, v2);
}

uint64_t sub_2528969A0(uint64_t a1)
{
  uint64_t v2 = sub_252896EB0(&qword_26B22D790, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
  return MEMORY[0x270EE1D98](a1, v2);
}

uint64_t static HomeSingleTileEntity.create(id:homeID:item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_252879BE4(a1, a4, (uint64_t (*)(void))type metadata accessor for ElementID);
  uint64_t v7 = type metadata accessor for HomeSingleTileEntity();
  sub_252879BE4(a2, a4 + *(int *)(v7 + 20), (uint64_t (*)(void))type metadata accessor for HomeID);
  return sub_252879BE4(a3, a4 + *(int *)(v7 + 24), (uint64_t (*)(void))type metadata accessor for TileElementInfo);
}

uint64_t static HomeSingleTileEntity.attributionBundleIdentifier.getter()
{
  return 0x6C7070612E6D6F63;
}

uint64_t sub_252896AE0()
{
  return sub_252896EB0(&qword_26B22D760, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_252896B28()
{
  return sub_252896EB0(&qword_26B22D778, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_252896B70()
{
  return sub_252896EB0(&qword_26B22D7A0, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_252896BB8()
{
  return sub_252896EB0(&qword_269C2DCC0, (void (*)(uint64_t))type metadata accessor for ElementID);
}

uint64_t sub_252896C00()
{
  return sub_252896EB0(&qword_269C2DCC8, (void (*)(uint64_t))type metadata accessor for ElementID);
}

uint64_t sub_252896C48()
{
  return sub_252896EB0(&qword_269C2E238, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_252896C90()
{
  return sub_252896EB0(&qword_26B22D780, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_252896CD8()
{
  return sub_252896EB0(&qword_26B22D788, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_252896D20()
{
  return sub_252896EB0((unint64_t *)&unk_26B22D768, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_252896D68()
{
  return sub_252896EB0(&qword_26B22D790, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

unint64_t sub_252896DB4()
{
  unint64_t result = qword_269C2E240;
  if (!qword_269C2E240)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269C2E248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269C2E240);
  }
  return result;
}

uint64_t sub_252896E10()
{
  return sub_252896EB0(&qword_26B22D798, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t sub_252896E58(uint64_t a1)
{
  uint64_t result = sub_252896EB0(&qword_269C2DD38, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_252896EB0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_252896EF8()
{
  return sub_252896EB0(&qword_269C2DD38, (void (*)(uint64_t))type metadata accessor for HomeSingleTileEntity);
}

uint64_t getEnumTagSinglePayload for HomeSingleTileEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_252896F54);
}

uint64_t sub_252896F54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ElementID();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = type metadata accessor for HomeID();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = type metadata accessor for TileElementInfo();
  id v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for HomeSingleTileEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2528970B4);
}

uint64_t sub_2528970B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for ElementID();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = type metadata accessor for HomeID();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = type metadata accessor for TileElementInfo();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

uint64_t sub_252897220()
{
  return MEMORY[0x270EE0AA0]();
}

uint64_t sub_252897230()
{
  return MEMORY[0x270EE0AA8]();
}

uint64_t sub_252897240()
{
  return MEMORY[0x270EE0AB0]();
}

uint64_t sub_252897270()
{
  return MEMORY[0x270EE0C80]();
}

uint64_t sub_252897280()
{
  return MEMORY[0x270EE0C90]();
}

uint64_t sub_252897290()
{
  return MEMORY[0x270EE0CB0]();
}

uint64_t sub_2528972A0()
{
  return MEMORY[0x270EE0CC0]();
}

uint64_t sub_2528972B0()
{
  return MEMORY[0x270EE0D18]();
}

uint64_t sub_2528972E0()
{
  return MEMORY[0x270EE0D48]();
}

uint64_t sub_2528972F0()
{
  return MEMORY[0x270EE0D70]();
}

uint64_t sub_252897300()
{
  return MEMORY[0x270EE0D78]();
}

uint64_t sub_252897310()
{
  return MEMORY[0x270EE0D88]();
}

uint64_t sub_252897320()
{
  return MEMORY[0x270EE0E08]();
}

uint64_t sub_252897340()
{
  return MEMORY[0x270EE0E88]();
}

uint64_t sub_252897350()
{
  return MEMORY[0x270EE11C0]();
}

uint64_t sub_252897360()
{
  return MEMORY[0x270EE11D8]();
}

uint64_t sub_252897370()
{
  return MEMORY[0x270EE11E0]();
}

uint64_t sub_252897380()
{
  return MEMORY[0x270EE11F8]();
}

uint64_t sub_252897390()
{
  return MEMORY[0x270EE1250]();
}

uint64_t sub_2528973A0()
{
  return MEMORY[0x270EE1270]();
}

uint64_t sub_2528973B0()
{
  return MEMORY[0x270EE1308]();
}

uint64_t sub_2528973C0()
{
  return MEMORY[0x270EE1328]();
}

uint64_t sub_2528973D0()
{
  return MEMORY[0x270EE13C8]();
}

uint64_t sub_2528973E0()
{
  return MEMORY[0x270EE1588]();
}

uint64_t sub_2528973F0()
{
  return MEMORY[0x270EE15A0]();
}

uint64_t sub_252897400()
{
  return MEMORY[0x270EE15C0]();
}

uint64_t sub_252897410()
{
  return MEMORY[0x270EE1728]();
}

uint64_t sub_252897420()
{
  return MEMORY[0x270EE1730]();
}

uint64_t sub_252897430()
{
  return MEMORY[0x270EE1748]();
}

uint64_t sub_252897440()
{
  return MEMORY[0x270EE1750]();
}

uint64_t sub_252897450()
{
  return MEMORY[0x270EE1758]();
}

uint64_t sub_252897460()
{
  return MEMORY[0x270F07E88]();
}

uint64_t sub_252897470()
{
  return MEMORY[0x270EE1918]();
}

uint64_t sub_252897480()
{
  return MEMORY[0x270EE1938]();
}

uint64_t sub_252897490()
{
  return MEMORY[0x270EE1958]();
}

uint64_t sub_2528974A0()
{
  return MEMORY[0x270EE1980]();
}

uint64_t sub_2528974C0()
{
  return MEMORY[0x270EE1A20]();
}

uint64_t sub_2528974D0()
{
  return MEMORY[0x270EE1A40]();
}

uint64_t sub_2528974E0()
{
  return MEMORY[0x270EE1A48]();
}

uint64_t sub_2528974F0()
{
  return MEMORY[0x270EE1A60]();
}

uint64_t sub_252897500()
{
  return MEMORY[0x270EE1B80]();
}

uint64_t sub_252897510()
{
  return MEMORY[0x270EE1B88]();
}

uint64_t sub_252897520()
{
  return MEMORY[0x270EE1B90]();
}

uint64_t sub_252897540()
{
  return MEMORY[0x270EE1C48]();
}

uint64_t sub_252897550()
{
  return MEMORY[0x270EE1C78]();
}

uint64_t sub_252897560()
{
  return MEMORY[0x270EE1C88]();
}

uint64_t sub_252897570()
{
  return MEMORY[0x270EE1C90]();
}

uint64_t sub_252897580()
{
  return MEMORY[0x270EE1CA0]();
}

uint64_t sub_252897590()
{
  return MEMORY[0x270EE1CC0]();
}

uint64_t sub_2528975B0()
{
  return MEMORY[0x270EE1CF0]();
}

uint64_t sub_2528975C0()
{
  return MEMORY[0x270EE1D40]();
}

uint64_t sub_2528975E0()
{
  return MEMORY[0x270EE1E08]();
}

uint64_t sub_2528975F0()
{
  return MEMORY[0x270EE1E10]();
}

uint64_t sub_252897600()
{
  return MEMORY[0x270EEF868]();
}

uint64_t sub_252897610()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_252897620()
{
  return MEMORY[0x270EEF888]();
}

uint64_t sub_252897630()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_252897640()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_252897650()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_252897660()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t _s17HomeWidgetIntents0A2IDV11descriptionSSvg_0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_252897680()
{
  return MEMORY[0x270F3A190]();
}

uint64_t _s17HomeWidgetIntents0A2IDV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2528976A0()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2528976B0()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_2528976C0()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_2528976D0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2528976E0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2528976F0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_252897700()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_252897710()
{
  return MEMORY[0x270F3A1A0]();
}

uint64_t sub_252897720()
{
  return MEMORY[0x270F3A2B0]();
}

uint64_t sub_252897730()
{
  return MEMORY[0x270F3A2B8]();
}

uint64_t sub_252897740()
{
  return MEMORY[0x270F3A2D8]();
}

uint64_t sub_252897760()
{
  return MEMORY[0x270F3A318]();
}

uint64_t sub_252897770()
{
  return MEMORY[0x270F3A368]();
}

uint64_t sub_252897780()
{
  return MEMORY[0x270F3A370]();
}

uint64_t sub_252897790()
{
  return MEMORY[0x270F3A380]();
}

uint64_t sub_2528977A0()
{
  return MEMORY[0x270F3A8B8]();
}

uint64_t sub_2528977B0()
{
  return MEMORY[0x270F3A8C8]();
}

uint64_t sub_2528977C0()
{
  return MEMORY[0x270F3A8D0]();
}

uint64_t sub_2528977D0()
{
  return MEMORY[0x270F3A8E0]();
}

uint64_t sub_2528977E0()
{
  return MEMORY[0x270F3A8E8]();
}

uint64_t sub_2528977F0()
{
  return MEMORY[0x270F3A8F0]();
}

uint64_t sub_252897800()
{
  return MEMORY[0x270F3A908]();
}

uint64_t sub_252897810()
{
  return MEMORY[0x270F3AC50]();
}

uint64_t sub_252897820()
{
  return MEMORY[0x270F3ACA0]();
}

uint64_t sub_252897830()
{
  return MEMORY[0x270F3ACC8]();
}

uint64_t sub_252897840()
{
  return MEMORY[0x270F3ACD0]();
}

uint64_t sub_252897850()
{
  return MEMORY[0x270F3ACF0]();
}

uint64_t sub_252897860()
{
  return MEMORY[0x270F3ADD0]();
}

uint64_t sub_252897870()
{
  return MEMORY[0x270F3ADE8]();
}

uint64_t sub_252897880()
{
  return MEMORY[0x270F3AE00]();
}

uint64_t sub_252897890()
{
  return MEMORY[0x270F3B090]();
}

uint64_t sub_2528978A0()
{
  return MEMORY[0x270F3B0A0]();
}

uint64_t sub_2528978B0()
{
  return MEMORY[0x270F3B0B0]();
}

uint64_t sub_2528978C0()
{
  return MEMORY[0x270F3B0B8]();
}

uint64_t sub_2528978D0()
{
  return MEMORY[0x270F3B0C0]();
}

uint64_t sub_2528978E0()
{
  return MEMORY[0x270F3B0E0]();
}

uint64_t sub_2528978F0()
{
  return MEMORY[0x270F3B0E8]();
}

uint64_t sub_252897900()
{
  return MEMORY[0x270F3B100]();
}

uint64_t sub_252897910()
{
  return MEMORY[0x270F3B108]();
}

uint64_t sub_252897920()
{
  return MEMORY[0x270F3B368]();
}

uint64_t sub_252897930()
{
  return MEMORY[0x270F3B3A0]();
}

uint64_t sub_252897940()
{
  return MEMORY[0x270F3B3B0]();
}

uint64_t sub_252897950()
{
  return MEMORY[0x270F3B3C0]();
}

uint64_t sub_252897960()
{
  return MEMORY[0x270F3B3D0]();
}

uint64_t sub_252897970()
{
  return MEMORY[0x270F3B558]();
}

uint64_t sub_252897980()
{
  return MEMORY[0x270F3B560]();
}

uint64_t sub_252897990()
{
  return MEMORY[0x270F3B570]();
}

uint64_t sub_2528979A0()
{
  return MEMORY[0x270F3B580]();
}

uint64_t sub_2528979B0()
{
  return MEMORY[0x270F3B588]();
}

uint64_t sub_2528979C0()
{
  return MEMORY[0x270F3B5A8]();
}

uint64_t sub_2528979D0()
{
  return MEMORY[0x270F3B5B8]();
}

uint64_t sub_2528979E0()
{
  return MEMORY[0x270F3B600]();
}

uint64_t sub_2528979F0()
{
  return MEMORY[0x270F3B610]();
}

uint64_t sub_252897A00()
{
  return MEMORY[0x270F3B628]();
}

uint64_t sub_252897A10()
{
  return MEMORY[0x270F3B630]();
}

uint64_t sub_252897A20()
{
  return MEMORY[0x270F3B6A0]();
}

uint64_t sub_252897A30()
{
  return MEMORY[0x270F3B6B0]();
}

uint64_t sub_252897A40()
{
  return MEMORY[0x270F3B6C0]();
}

uint64_t sub_252897A50()
{
  return MEMORY[0x270F3B6C8]();
}

uint64_t sub_252897A60()
{
  return MEMORY[0x270F3B6D0]();
}

uint64_t sub_252897A70()
{
  return MEMORY[0x270F3BF78]();
}

uint64_t sub_252897A80()
{
  return MEMORY[0x270F3BF98]();
}

uint64_t sub_252897A90()
{
  return MEMORY[0x270F3BFA8]();
}

uint64_t sub_252897AA0()
{
  return MEMORY[0x270F3BFB8]();
}

uint64_t sub_252897AB0()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t sub_252897AC0()
{
  return MEMORY[0x270FA2CF8]();
}

uint64_t sub_252897AD0()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_252897AE0()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_252897AF0()
{
  return MEMORY[0x270FA2D58]();
}

uint64_t sub_252897B00()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_252897B10()
{
  return MEMORY[0x270FA2D90]();
}

uint64_t sub_252897B20()
{
  return MEMORY[0x270FA2DB0]();
}

uint64_t sub_252897B30()
{
  return MEMORY[0x270FA2DD0]();
}

uint64_t sub_252897B40()
{
  return MEMORY[0x270FA2DE0]();
}

uint64_t sub_252897B50()
{
  return MEMORY[0x270FA2DF0]();
}

uint64_t sub_252897B60()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_252897B70()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_252897B80()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_252897B90()
{
  return MEMORY[0x270F3A018]();
}

uint64_t sub_252897BA0()
{
  return MEMORY[0x270F3A020]();
}

uint64_t sub_252897BB0()
{
  return MEMORY[0x270F3A028]();
}

uint64_t sub_252897BC0()
{
  return MEMORY[0x270F3A030]();
}

uint64_t sub_252897BD0()
{
  return MEMORY[0x270F3A038]();
}

uint64_t sub_252897BE0()
{
  return MEMORY[0x270F3A040]();
}

uint64_t sub_252897BF0()
{
  return MEMORY[0x270F3A0A8]();
}

uint64_t sub_252897C00()
{
  return MEMORY[0x270F3A0B0]();
}

uint64_t sub_252897C10()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_252897C20()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_252897C30()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_252897C40()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_252897C50()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_252897C60()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_252897C70()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_252897C80()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_252897C90()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_252897CA0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_252897CB0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_252897CC0()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_252897CD0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_252897CE0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_252897CF0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_252897D00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_252897D10()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_252897D20()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_252897D40()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_252897D50()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_252897D60()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_252897D70()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_252897D80()
{
  return MEMORY[0x270F3C0A0]();
}

uint64_t sub_252897D90()
{
  return MEMORY[0x270F9D950]();
}

uint64_t sub_252897DA0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_252897DB0()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_252897DC0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_252897DD0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_252897DE0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_252897DF0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_252897E00()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_252897E10()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_252897E20()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_252897E30()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_252897E40()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_252897E50()
{
  return MEMORY[0x270EE1F10]();
}

uint64_t sub_252897E60()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_252897E70()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_252897E80()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_252897E90()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_252897EA0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_252897EB0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_252897ED0()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_252897EE0()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_252897EF0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_252897F00()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_252897F10()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_252897F20()
{
  return MEMORY[0x270F3C0C0]();
}

uint64_t sub_252897F30()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_252897F40()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_252897F50()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_252897F60()
{
  return MEMORY[0x270F3C0D0]();
}

uint64_t sub_252897F70()
{
  return MEMORY[0x270EF3AB0]();
}

uint64_t sub_252897F80()
{
  return MEMORY[0x270F3C120]();
}

uint64_t sub_252897F90()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_252897FA0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_252897FB0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_252897FC0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_252897FD0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_252897FE0()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_252897FF0()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_252898010()
{
  return MEMORY[0x270F3A0C0]();
}

uint64_t sub_252898020()
{
  return MEMORY[0x270F3A0C8]();
}

uint64_t sub_252898030()
{
  return MEMORY[0x270F3A0D8]();
}

uint64_t sub_252898040()
{
  return MEMORY[0x270F3A0E0]();
}

uint64_t sub_252898050()
{
  return MEMORY[0x270F3A0F0]();
}

uint64_t sub_252898060()
{
  return MEMORY[0x270EF2060]();
}

uint64_t sub_252898070()
{
  return MEMORY[0x270F3C148]();
}

uint64_t sub_252898080()
{
  return MEMORY[0x270F3C150]();
}

uint64_t sub_252898090()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2528980A0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2528980B0()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t sub_2528980C0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_2528980D0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2528980E0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2528980F0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_252898100()
{
  return MEMORY[0x270EF2458]();
}

uint64_t sub_252898110()
{
  return MEMORY[0x270EF24F8]();
}

uint64_t sub_252898120()
{
  return MEMORY[0x270EF2508]();
}

uint64_t sub_252898130()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_252898140()
{
  return MEMORY[0x270F9E778]();
}

uint64_t sub_252898150()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_252898160()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_252898170()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_252898180()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_252898190()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_2528981A0()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_2528981B0()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_2528981C0()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_2528981D0()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_2528981E0()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_2528981F0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_252898200()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_252898210()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_252898220()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_252898230()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_252898240()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_252898250()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_252898260()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_252898270()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_252898280()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_252898290()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2528982A0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2528982B0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2528982C0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2528982D0()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2528982E0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2528982F0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_252898300()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_252898310()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_252898320()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_252898330()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_252898340()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_252898350()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_252898360()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_252898370()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_252898380()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_252898390()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2528983A0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2528983B0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2528983C0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2528983D0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2528983E0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2528983F0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_252898400()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_252898410()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_252898420()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_252898430()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_252898440()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_252898450()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_252898460()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_252898470()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_252898480()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_252898490()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2528984B0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2528984C0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2528984D0()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2528984F0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_252898500()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_252898510()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_252898520()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_252898530()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_252898540()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_252898550()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_252898560()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_252898570()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_252898580()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_2528985B0()
{
  return MEMORY[0x270FA0128]();
}

uint64_t INIntentWithTypedIntent()
{
  return MEMORY[0x270EF5248]();
}

uint64_t INTypedIntentWithIntent()
{
  return MEMORY[0x270EF52C0]();
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}