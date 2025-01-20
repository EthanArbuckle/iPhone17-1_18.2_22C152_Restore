uint64_t sub_24E3209F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B6838);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B6838);
  if (qword_26B1B5B08 != -1) {
    swift_once();
  }
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B6850);
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t FirstUnlockService.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

void *FirstUnlockService.__allocating_init()()
{
  uint64_t v0 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  v0[14] = 0xD000000000000012;
  v0[15] = 0x800000024E360CA0;
  v0[16] = MEMORY[0x263F8EE78];
  return v0;
}

void *FirstUnlockService.init()()
{
  swift_defaultActor_initialize();
  v0[14] = 0xD000000000000012;
  v0[15] = 0x800000024E360CA0;
  v0[16] = MEMORY[0x263F8EE78];
  return v0;
}

uint64_t sub_24E320B98()
{
  return sub_24E320BCC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24E320BCC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24E320BD4()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24E320BF4, v0, 0);
}

uint64_t sub_24E320BF4()
{
  uint64_t v9 = v0;
  static SystemInfo.lockState.getter(&v8);
  if (v8 == 1)
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 24) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_24E320D88;
    return sub_24E320E7C();
  }
  else
  {
    if (qword_26B1B5AC0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24E35FD10();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1B6838);
    v4 = sub_24E35FCF0();
    os_log_type_t v5 = sub_24E360030();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_24E31F000, v4, v5, "Device is already unlocked -- not registering", v6, 2u);
      MEMORY[0x25333A4C0](v6, -1, -1);
    }

    v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_24E320D88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E320E7C()
{
  v1[2] = v0;
  uint64_t v2 = sub_24E35FBD0();
  v1[3] = v2;
  v1[4] = *(void *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698D8870);
  v1[7] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B64F0);
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2698D8880);
  v1[11] = v4;
  v1[12] = *(void *)(v4 - 8);
  v1[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E32103C, v0, 0);
}

uint64_t sub_24E32103C()
{
  if (qword_26B1B5AC0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E35FD10();
  v0[14] = __swift_project_value_buffer(v1, (uint64_t)qword_26B1B6838);
  uint64_t v2 = sub_24E35FCF0();
  os_log_type_t v3 = sub_24E360030();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24E31F000, v2, v3, "Registering listener for Darwin notification: kMobileKeyBagFirstUnlockNotificationID", v4, 2u);
    MEMORY[0x25333A4C0](v4, -1, -1);
  }

  sub_24E35FBF0();
  os_log_type_t v5 = (void *)swift_task_alloc();
  v0[15] = v5;
  *os_log_type_t v5 = v0;
  v5[1] = sub_24E3211B8;
  uint64_t v6 = v0[10];
  return MEMORY[0x270F28DA0](v6, 0xD000000000000025, 0x800000024E362240);
}

uint64_t sub_24E3211B8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E3212C8, v1, 0);
}

uint64_t sub_24E3212C8()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  sub_24E35FF30();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v5 = sub_24E322B88(&qword_26B1B5AD0, v4, (void (*)(uint64_t))type metadata accessor for FirstUnlockService);
  v0[16] = v5;
  uint64_t v6 = v0[2];
  v7 = (void *)swift_task_alloc();
  v0[17] = v7;
  void *v7 = v0;
  v7[1] = sub_24E3213E4;
  uint64_t v8 = v0[11];
  uint64_t v9 = v0[7];
  return MEMORY[0x270FA1F68](v9, v6, v5, v8);
}

uint64_t sub_24E3213E4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E3214F4, v1, 0);
}

uint64_t sub_24E3214F4()
{
  v27 = v0;
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v7 = v0[5];
    uint64_t v6 = v0[6];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v6, v1, v2);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v7, v6, v2);
    uint64_t v8 = sub_24E35FCF0();
    os_log_type_t v9 = sub_24E360000();
    BOOL v10 = os_log_type_enabled(v8, v9);
    uint64_t v11 = v0[5];
    uint64_t v12 = v0[3];
    v13 = (void (**)(uint64_t, uint64_t))(v0[4] + 8);
    if (v10)
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v26 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      sub_24E322B88(qword_26B1B5A28, 255, MEMORY[0x263F3C9E8]);
      uint64_t v16 = sub_24E3602F0();
      *(void *)(v14 + 4) = sub_24E32C6BC(v16, v17, &v26);
      swift_bridgeObjectRelease();
      v18 = *v13;
      (*v13)(v11, v12);
      _os_log_impl(&dword_24E31F000, v8, v9, "Process first unlock event: %s", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v15, -1, -1);
      MEMORY[0x25333A4C0](v14, -1, -1);
    }
    else
    {
      v18 = *v13;
      (*v13)(v0[5], v0[3]);
    }

    uint64_t v19 = v0[6];
    uint64_t v20 = v0[3];
    sub_24E321FE4();
    v18(v19, v20);
    uint64_t v21 = v0[16];
    uint64_t v22 = v0[2];
    v23 = (void *)swift_task_alloc();
    v0[17] = v23;
    void *v23 = v0;
    v23[1] = sub_24E3213E4;
    uint64_t v24 = v0[11];
    uint64_t v25 = v0[7];
    return MEMORY[0x270FA1F68](v25, v22, v21, v24);
  }
}

uint64_t sub_24E321834()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24E321854, v0, 0);
}

uint64_t sub_24E321854()
{
  uint64_t v6 = v0;
  static SystemInfo.lockState.getter(&v5);
  if (v5 == 1)
  {
    sub_24E322B88(&qword_26B1B5AD0, v1, (void (*)(uint64_t))type metadata accessor for FirstUnlockService);
    uint64_t v2 = (void *)swift_task_alloc();
    *(void *)(v0 + 24) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_24E3219B4;
    return MEMORY[0x270FA2318]();
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
}

uint64_t sub_24E3219B4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E321AC4, v1, 0);
}

uint64_t sub_24E321AC4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24E321AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5B58);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = (unint64_t *)(a2 + 128);
  swift_beginAccess();
  unint64_t v9 = *(void *)(a2 + 128);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 128) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v9 = sub_24E339D68(0, *(void *)(v9 + 16) + 1, 1, v9);
    *uint64_t v8 = v9;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    unint64_t v9 = sub_24E339D68(v11 > 1, v12 + 1, 1, v9);
    *uint64_t v8 = v9;
  }
  *(void *)(v9 + 16) = v12 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v12, v7, v4);
  return swift_endAccess();
}

uint64_t FirstUnlockService.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t FirstUnlockService.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t FirstUnlockService.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E321CF4()
{
  return v0;
}

uint64_t sub_24E321D00()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24E321D30()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E321DD4;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24E320BF4, v0, 0);
}

uint64_t sub_24E321DD4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E321ECC()
{
  return sub_24E321EF0();
}

uint64_t sub_24E321EF0()
{
  uint64_t UnlockService = type metadata accessor for FirstUnlockService();
  uint64_t v2 = sub_24E322B88(&qword_26B1B5AD8, v1, (void (*)(uint64_t))type metadata accessor for FirstUnlockService);
  sub_24E3602D0();
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  MEMORY[0x253339D10](UnlockService, v2);
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  return 60;
}

void sub_24E321FE4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5B58);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static SystemInfo.lockState.getter((char *)v27);
  if (LOBYTE(v27[0]) == 1)
  {
    if (qword_26B1B5AC0 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_24E35FD10();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B1B6838);
    os_log_t v26 = (os_log_t)sub_24E35FCF0();
    os_log_type_t v7 = sub_24E360030();
    if (os_log_type_enabled(v26, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_24E31F000, v26, v7, "still locked -- keep listening", v8, 2u);
      MEMORY[0x25333A4C0](v8, -1, -1);
    }
    os_log_t v9 = v26;
  }
  else
  {
    if (qword_26B1B5AC0 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24E35FD10();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B1B6838);
    unint64_t v11 = sub_24E35FCF0();
    os_log_type_t v12 = sub_24E360030();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_24E31F000, v11, v12, "*** First Unlock Event ***", v13, 2u);
      MEMORY[0x25333A4C0](v13, -1, -1);
    }

    swift_retain();
    uint64_t v14 = sub_24E35FCF0();
    os_log_type_t v15 = sub_24E360030();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 134217984;
      swift_beginAccess();
      v27[0] = *((void *)v1[16].isa + 2);
      sub_24E3600B0();
      swift_release();
      _os_log_impl(&dword_24E31F000, v14, v15, "Notifying %ld clients of first unlock", v16, 0xCu);
      MEMORY[0x25333A4C0](v16, -1, -1);
    }
    else
    {

      swift_release();
    }
    unint64_t v17 = v1 + 16;
    swift_beginAccess();
    Class isa = v1[16].isa;
    uint64_t v19 = *((void *)isa + 2);
    if (v19)
    {
      os_log_t v26 = v17;
      uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      uint64_t v21 = v3 + 16;
      uint64_t v20 = v22;
      uint64_t v23 = (uint64_t)isa + ((*(unsigned __int8 *)(v21 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 64));
      uint64_t v24 = *(void *)(v21 + 56);
      swift_bridgeObjectRetain();
      do
      {
        v20(v5, v23, v2);
        sub_24E35FEE0();
        (*(void (**)(char *, uint64_t))(v21 - 8))(v5, v2);
        v23 += v24;
        --v19;
      }
      while (v19);
      swift_bridgeObjectRelease();
      unint64_t v17 = v26;
    }
    v17->Class isa = (Class)MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24E3223DC()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B6850);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B6850);
  return sub_24E35FD00();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for FirstUnlockService()
{
  return self;
}

uint64_t sub_24E3224BC(uint64_t a1)
{
  return sub_24E321AD8(a1, v1);
}

uint64_t sub_24E3224C4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 8) = sub_24E322B88(&qword_26B1B5AD8, a2, (void (*)(uint64_t))type metadata accessor for FirstUnlockService);
  uint64_t result = sub_24E322B88(&qword_26B1B5AD0, v3, (void (*)(uint64_t))type metadata accessor for FirstUnlockService);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t method lookup function for FirstUnlockService(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FirstUnlockService);
}

uint64_t dispatch thunk of FirstUnlockService.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of FirstUnlockService.initialLaunchProcessing()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 136) + **(int **)(*(void *)v0 + 136));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E322CD0;
  return v4();
}

uint64_t dispatch thunk of FirstUnlockService.migrate(from:to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 144) + **(int **)(*(void *)v2 + 144));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_24E322CD0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of FirstUnlockService.firstLaunchSinceReboot()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 152) + **(int **)(*(void *)v0 + 152));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E322CD0;
  return v4();
}

uint64_t dispatch thunk of FirstUnlockService.run()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 160) + **(int **)(*(void *)v0 + 160));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E322CD0;
  return v4();
}

uint64_t dispatch thunk of FirstUnlockService.waitForFirstUnlock()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 168) + **(int **)(*(void *)v0 + 168));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E322A50;
  return v4();
}

uint64_t sub_24E322A50()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
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

uint64_t sub_24E322B88(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void type metadata accessor for CFDictionary(uint64_t a1)
{
}

void type metadata accessor for CFNotificationName(uint64_t a1)
{
}

void type metadata accessor for CFNotificationCenter(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_24E322C84(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void static SystemInfo.lockState.getter(char *a1@<X8>)
{
  int v2 = MKBGetDeviceLockState();
  char v3 = 5;
  switch(v2)
  {
    case 0:
      char v3 = 3;
      break;
    case 1:
      if (MKBDeviceUnlockedSinceBoot()) {
        char v3 = 2;
      }
      else {
        char v3 = 1;
      }
      break;
    case 2:
      char v3 = 4;
      break;
    case 3:
      break;
    default:
      if (qword_2698D87E0 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_24E35FD10();
      __swift_project_value_buffer(v4, (uint64_t)qword_2698DA660);
      uint64_t v5 = sub_24E35FCF0();
      os_log_type_t v6 = sub_24E360010();
      if (os_log_type_enabled(v5, v6))
      {
        os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v7 = 67109120;
        sub_24E3600B0();
        _os_log_impl(&dword_24E31F000, v5, v6, "MKBGetDeviceLockState() returned %d", v7, 8u);
        MEMORY[0x25333A4C0](v7, -1, -1);
      }

      char v3 = 0;
      break;
  }
  *a1 = v3;
}

unint64_t SystemInfo.DeviceLockState.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = 6;
  if (result < 6) {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

uint64_t SystemInfo.DeviceLockState.rawValue.getter()
{
  return *v0;
}

BOOL sub_24E322E7C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24E322E90()
{
  return sub_24E3603E0();
}

uint64_t sub_24E322ED8()
{
  return sub_24E3603D0();
}

uint64_t sub_24E322F04()
{
  return sub_24E3603E0();
}

unint64_t sub_24E322F48@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return SystemInfo.DeviceLockState.init(rawValue:)(*a1, a2);
}

void sub_24E322F50(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24E322F5C()
{
  return sub_24E35FE80();
}

uint64_t sub_24E322FBC()
{
  return sub_24E35FE60();
}

unint64_t sub_24E323010()
{
  unint64_t result = qword_2698D8910;
  if (!qword_2698D8910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8910);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s15DeviceLockStateOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s15DeviceLockStateOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24E3231CCLL);
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

uint64_t sub_24E3231F4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24E323200(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SystemInfo.DeviceLockState()
{
  return &type metadata for SystemInfo.DeviceLockState;
}

unint64_t sub_24E323218()
{
  unint64_t result = qword_26B1B5A18;
  if (!qword_26B1B5A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B5A18);
  }
  return result;
}

uint64_t sub_24E32326C()
{
  return 1;
}

uint64_t sub_24E323274()
{
  return sub_24E3603E0();
}

uint64_t sub_24E3232B8()
{
  return sub_24E3603D0();
}

uint64_t sub_24E3232E0()
{
  return sub_24E3603E0();
}

BOOL static DeviceVersion.Platform.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DeviceVersion.Platform.hash(into:)()
{
  return sub_24E3603D0();
}

uint64_t sub_24E323374(char a1)
{
  if (a1) {
    return 0x534F63616DLL;
  }
  else {
    return 5459817;
  }
}

uint64_t sub_24E3233A8()
{
  return sub_24E323374(*v0);
}

uint64_t sub_24E3233B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E32560C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E3233D8()
{
  return 0;
}

void sub_24E3233E4(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24E3233F0(uint64_t a1)
{
  unint64_t v2 = sub_24E323888();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E32342C(uint64_t a1)
{
  unint64_t v2 = sub_24E323888();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E323468()
{
  return 0;
}

uint64_t sub_24E323474@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_24E3234A4(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24E3234B0(uint64_t a1)
{
  unint64_t v2 = sub_24E323930();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E3234EC(uint64_t a1)
{
  unint64_t v2 = sub_24E323930();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24E323528(uint64_t a1)
{
  unint64_t v2 = sub_24E3238DC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E323564(uint64_t a1)
{
  unint64_t v2 = sub_24E3238DC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DeviceVersion.Platform.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8918);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8920);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8928);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E323888();
  sub_24E360400();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24E3238DC();
    uint64_t v14 = v18;
    sub_24E3602B0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24E323930();
    sub_24E3602B0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24E323888()
{
  unint64_t result = qword_2698D8930;
  if (!qword_2698D8930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8930);
  }
  return result;
}

unint64_t sub_24E3238DC()
{
  unint64_t result = qword_2698D8938;
  if (!qword_2698D8938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8938);
  }
  return result;
}

unint64_t sub_24E323930()
{
  unint64_t result = qword_2698D8940;
  if (!qword_2698D8940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8940);
  }
  return result;
}

uint64_t DeviceVersion.Platform.hashValue.getter()
{
  return sub_24E3603E0();
}

uint64_t DeviceVersion.Platform.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8948);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8950);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8958);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E323888();
  unint64_t v11 = v32;
  sub_24E3603F0();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  uint64_t v14 = v10;
  uint64_t v15 = sub_24E3602A0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24E360170();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8960);
    *char v22 = &type metadata for DeviceVersion.Platform;
    sub_24E360280();
    sub_24E360160();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_24E3238DC();
    v18 = v14;
    sub_24E360270();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24E323930();
    sub_24E360270();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

BOOL sub_24E323E24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
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

uint64_t sub_24E323E8C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return DeviceVersion.Platform.init(from:)(a1, a2);
}

uint64_t sub_24E323EA4(void *a1)
{
  return DeviceVersion.Platform.encode(to:)(a1);
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DeviceVersion.init(systemVersion:platform:)(FindMyDaemonSupport::DeviceVersion *__return_ptr retstr, Swift::String systemVersion, FindMyDaemonSupport::DeviceVersion::Platform platform)
{
  FindMyDaemonSupport::DeviceVersion::Platform v4 = *(unsigned char *)platform;
  SystemVersionNumber.init(string:)(&v12, systemVersion);
  object = v12.value.rawValue._object;
  if (v12.value.rawValue._object)
  {
    uint64_t v6 = v12.value.suffix.value._object;
    Swift::Bool is_nil = v12.value.childType.is_nil;
    uint64_t v9 = v12.value.baseLetter._object;
    Swift::Int value = v12.value.childType.value;
    long long v10 = *(_OWORD *)&v12.value.baseNumber;
    long long v11 = *(_OWORD *)&v12.value.buildNumber;
    retstr->systemVersionNumber.rawValue._countAndFlagsBits = v12.value.rawValue._countAndFlagsBits;
    retstr->systemVersionNumber.rawValue._object = object;
    *(_OWORD *)&retstr->systemVersionNumber.baseNumber = v10;
    retstr->systemVersionNumber.baseLetter._object = v9;
    retstr->systemVersionNumber.childType.Swift::Int value = value;
    retstr->systemVersionNumber.childType.Swift::Bool is_nil = is_nil;
    *(_OWORD *)&retstr->systemVersionNumber.buildNumber = v11;
    retstr->systemVersionNumber.suffix.value._object = v6;
    retstr->platform = v4;
  }
  else
  {
    sub_24E323F6C();
    swift_allocError();
    swift_willThrow();
  }
}

unint64_t sub_24E323F6C()
{
  unint64_t result = qword_2698D8968;
  if (!qword_2698D8968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8968);
  }
  return result;
}

uint64_t static DeviceVersion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  int v3 = *(unsigned __int8 *)(a2 + 80);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 ^ v3 ^ 1u;
  }
  char v5 = sub_24E360320();
  uint64_t result = 0;
  if (v5) {
    return v2 ^ v3 ^ 1u;
  }
  return result;
}

uint64_t sub_24E324024(char a1)
{
  if (a1) {
    return 0x6D726F6674616C70;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_24E324060()
{
  return sub_24E324024(*v0);
}

uint64_t sub_24E324068@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24E3256E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24E324090(uint64_t a1)
{
  unint64_t v2 = sub_24E3249DC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24E3240CC(uint64_t a1)
{
  unint64_t v2 = sub_24E3249DC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DeviceVersion.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8970);
  uint64_t v18 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  char v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *v1;
  long long v15 = v1[1];
  long long v16 = v6;
  uint64_t v8 = *((void *)v1 + 4);
  uint64_t v7 = *((void *)v1 + 5);
  char v9 = *((unsigned char *)v1 + 48);
  long long v14 = *(long long *)((char *)v1 + 56);
  uint64_t v13 = *((void *)v1 + 9);
  int v26 = *((unsigned __int8 *)v1 + 80);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E3249DC();
  sub_24E360400();
  long long v19 = v16;
  long long v20 = v15;
  uint64_t v21 = v8;
  uint64_t v22 = v7;
  char v23 = v9;
  long long v24 = v14;
  uint64_t v25 = v13;
  char v27 = 0;
  sub_24E324A30();
  uint64_t v10 = v17;
  sub_24E3602C0();
  if (!v10)
  {
    LOBYTE(v19) = v26;
    char v27 = 1;
    sub_24E324A84();
    sub_24E3602C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v5, v3);
}

uint64_t DeviceVersion.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8990);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24E3249DC();
  sub_24E3603F0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v37 = 0;
  sub_24E324AD8();
  sub_24E360290();
  uint64_t v9 = v27;
  uint64_t v23 = v28;
  uint64_t v24 = v26;
  uint64_t v10 = v30;
  uint64_t v21 = v31;
  uint64_t v22 = v29;
  int v36 = v32;
  uint64_t v11 = v35;
  uint64_t v19 = v34;
  uint64_t v20 = v33;
  char v37 = 1;
  sub_24E324B2C();
  uint64_t v25 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24E360290();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v12 = v26;
  uint64_t v13 = v25;
  *(void *)a2 = v24;
  *(void *)(a2 + 8) = v13;
  uint64_t v14 = v22;
  *(void *)(a2 + 16) = v23;
  *(void *)(a2 + 24) = v14;
  uint64_t v15 = v21;
  *(void *)(a2 + 32) = v10;
  *(void *)(a2 + 40) = v15;
  *(unsigned char *)(a2 + 48) = v36;
  uint64_t v16 = v19;
  *(void *)(a2 + 56) = v20;
  *(void *)(a2 + 64) = v16;
  *(void *)(a2 + 72) = v11;
  *(unsigned char *)(a2 + 80) = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E324578@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return DeviceVersion.init(from:)(a1, a2);
}

uint64_t sub_24E324590(void *a1)
{
  return DeviceVersion.encode(to:)(a1);
}

BOOL sub_24E3245AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  char v7 = *(unsigned char *)(a1 + 80);
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v11 = a2[4];
  uint64_t v10 = a2[5];
  char v12 = *((unsigned char *)a2 + 48);
  uint64_t v13 = a2[9];
  char v14 = *((unsigned char *)a2 + 80);
  v24[0] = *(void *)a1;
  v24[1] = v2;
  long long v25 = *(_OWORD *)(a1 + 16);
  uint64_t v26 = v3;
  uint64_t v27 = v4;
  char v28 = v5;
  long long v29 = *(_OWORD *)(a1 + 56);
  uint64_t v30 = v6;
  char v31 = v7;
  v16[0] = v8;
  v16[1] = v9;
  long long v17 = *((_OWORD *)a2 + 1);
  uint64_t v18 = v11;
  uint64_t v19 = v10;
  char v20 = v12;
  long long v21 = *(_OWORD *)(a2 + 7);
  uint64_t v22 = v13;
  char v23 = v14;
  return (_s19FindMyDaemonSupport13DeviceVersionV1loiySbAC_ACtFZ_0((uint64_t)v16, v24) & 1) == 0;
}

BOOL sub_24E32464C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  char v7 = *(unsigned char *)(a1 + 80);
  uint64_t v8 = *(void *)a2;
  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v11 = *(void *)(a2 + 32);
  uint64_t v10 = *(void *)(a2 + 40);
  char v12 = *(unsigned char *)(a2 + 48);
  uint64_t v13 = *(void *)(a2 + 72);
  char v14 = *(unsigned char *)(a2 + 80);
  v24[0] = *(void *)a1;
  v24[1] = v2;
  long long v25 = *(_OWORD *)(a1 + 16);
  uint64_t v26 = v3;
  uint64_t v27 = v4;
  char v28 = v5;
  long long v29 = *(_OWORD *)(a1 + 56);
  uint64_t v30 = v6;
  char v31 = v7;
  v16[0] = v8;
  v16[1] = v9;
  long long v17 = *(_OWORD *)(a2 + 16);
  uint64_t v18 = v11;
  uint64_t v19 = v10;
  char v20 = v12;
  long long v21 = *(_OWORD *)(a2 + 56);
  uint64_t v22 = v13;
  char v23 = v14;
  return (_s19FindMyDaemonSupport13DeviceVersionV1loiySbAC_ACtFZ_0((uint64_t)v24, v16) & 1) == 0;
}

uint64_t sub_24E3246EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  char v7 = *(unsigned char *)(a1 + 80);
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  uint64_t v11 = a2[4];
  uint64_t v10 = a2[5];
  char v12 = *((unsigned char *)a2 + 48);
  uint64_t v13 = a2[9];
  char v14 = *((unsigned char *)a2 + 80);
  v24[0] = *(void *)a1;
  v24[1] = v2;
  long long v25 = *(_OWORD *)(a1 + 16);
  uint64_t v26 = v3;
  uint64_t v27 = v4;
  char v28 = v5;
  long long v29 = *(_OWORD *)(a1 + 56);
  uint64_t v30 = v6;
  char v31 = v7;
  v16[0] = v8;
  v16[1] = v9;
  long long v17 = *((_OWORD *)a2 + 1);
  uint64_t v18 = v11;
  uint64_t v19 = v10;
  char v20 = v12;
  long long v21 = *(_OWORD *)(a2 + 7);
  uint64_t v22 = v13;
  char v23 = v14;
  return _s19FindMyDaemonSupport13DeviceVersionV1loiySbAC_ACtFZ_0((uint64_t)v16, v24) & 1;
}

uint64_t sub_24E324788(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  int v3 = *(unsigned __int8 *)(a2 + 80);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 ^ v3 ^ 1u;
  }
  char v5 = sub_24E360320();
  uint64_t result = 0;
  if (v5) {
    return v2 ^ v3 ^ 1u;
  }
  return result;
}

uint64_t DeviceVersion.debugDescription.getter()
{
  return 0;
}

uint64_t _s19FindMyDaemonSupport13DeviceVersionV1loiySbAC_ACtFZ_0(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void *)(result + 24);
  uint64_t v4 = *(void *)(result + 32);
  int v5 = *(unsigned __int8 *)(result + 80);
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  if (v5 == *((unsigned __int8 *)a2 + 80)) {
    goto LABEL_6;
  }
  if (*(unsigned char *)(result + 80))
  {
    BOOL v9 = __OFSUB__(v2, 2);
    v2 -= 2;
    if (!v9) {
      goto LABEL_8;
    }
    __break(1u);
LABEL_6:
    uint64_t v10 = a2[9];
    char v11 = *((unsigned char *)a2 + 48);
    uint64_t v12 = a2[5];
    uint64_t v14 = *a2;
    uint64_t v13 = a2[1];
    uint64_t v15 = *(void *)(result + 72);
    char v16 = *(unsigned char *)(result + 48);
    uint64_t v17 = *(void *)(result + 40);
    uint64_t v18 = *(void *)(result + 8);
    v24[0] = *(void *)result;
    v24[1] = v18;
    uint64_t v24[2] = v2;
    v24[3] = v3;
    v24[4] = v4;
    v24[5] = v17;
    char v25 = v16;
    long long v26 = *(_OWORD *)(result + 56);
    uint64_t v27 = v15;
    v20[0] = v14;
    v20[1] = v13;
    v20[2] = v6;
    v20[3] = v7;
    v20[4] = v8;
    v20[5] = v12;
    char v21 = v11;
    long long v22 = *(_OWORD *)(a2 + 7);
    uint64_t v23 = v10;
    char MyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0 = _s19FindMyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0(v24, v20);
    return MyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0 & 1;
  }
  BOOL v9 = __OFSUB__(v6, 2);
  v6 -= 2;
  if (v9)
  {
    __break(1u);
    return result;
  }
LABEL_8:
  if (v2 != v6)
  {
    char MyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0 = v2 < v6;
    return MyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0 & 1;
  }
  if (v3 == v7 && v4 == v8 || (sub_24E360320() & 1) != 0)
  {
    char MyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0 = v5 ^ 1;
    return MyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0 & 1;
  }

  return sub_24E360320();
}

unint64_t sub_24E3249DC()
{
  unint64_t result = qword_2698D8978;
  if (!qword_2698D8978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8978);
  }
  return result;
}

unint64_t sub_24E324A30()
{
  unint64_t result = qword_2698D8980;
  if (!qword_2698D8980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8980);
  }
  return result;
}

unint64_t sub_24E324A84()
{
  unint64_t result = qword_2698D8988;
  if (!qword_2698D8988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8988);
  }
  return result;
}

unint64_t sub_24E324AD8()
{
  unint64_t result = qword_2698D8998;
  if (!qword_2698D8998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8998);
  }
  return result;
}

unint64_t sub_24E324B2C()
{
  unint64_t result = qword_2698D89A0;
  if (!qword_2698D89A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89A0);
  }
  return result;
}

unint64_t sub_24E324B84()
{
  unint64_t result = qword_2698D89A8;
  if (!qword_2698D89A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89A8);
  }
  return result;
}

unint64_t sub_24E324BDC()
{
  unint64_t result = qword_2698D89B0;
  if (!qword_2698D89B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89B0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SystemVersionNumber(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SystemVersionNumber()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DeviceVersion(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DeviceVersion(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for DeviceVersion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceVersion(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DeviceVersion(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DeviceVersion()
{
  return &type metadata for DeviceVersion;
}

ValueMetadata *type metadata accessor for DeviceVersion.Platform()
{
  return &type metadata for DeviceVersion.Platform;
}

unsigned char *sub_24E324F44(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceVersion.CodingKeys()
{
  return &type metadata for DeviceVersion.CodingKeys;
}

uint64_t getEnumTagSinglePayload for DeviceVersion.Error(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for DeviceVersion.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E325050);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24E325078()
{
  return 0;
}

ValueMetadata *type metadata accessor for DeviceVersion.Error()
{
  return &type metadata for DeviceVersion.Error;
}

uint64_t _s19FindMyDaemonSupport13DeviceVersionV8PlatformOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s19FindMyDaemonSupport13DeviceVersionV8PlatformOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x24E3251ECLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceVersion.Platform.CodingKeys()
{
  return &type metadata for DeviceVersion.Platform.CodingKeys;
}

ValueMetadata *type metadata accessor for DeviceVersion.Platform.IOSCodingKeys()
{
  return &type metadata for DeviceVersion.Platform.IOSCodingKeys;
}

ValueMetadata *type metadata accessor for DeviceVersion.Platform.MacOSCodingKeys()
{
  return &type metadata for DeviceVersion.Platform.MacOSCodingKeys;
}

unint64_t sub_24E325248()
{
  unint64_t result = qword_2698D89B8;
  if (!qword_2698D89B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89B8);
  }
  return result;
}

unint64_t sub_24E3252A0()
{
  unint64_t result = qword_2698D89C0;
  if (!qword_2698D89C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89C0);
  }
  return result;
}

unint64_t sub_24E3252F8()
{
  unint64_t result = qword_2698D89C8;
  if (!qword_2698D89C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89C8);
  }
  return result;
}

unint64_t sub_24E325350()
{
  unint64_t result = qword_2698D89D0;
  if (!qword_2698D89D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89D0);
  }
  return result;
}

unint64_t sub_24E3253A8()
{
  unint64_t result = qword_2698D89D8;
  if (!qword_2698D89D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89D8);
  }
  return result;
}

unint64_t sub_24E325400()
{
  unint64_t result = qword_2698D89E0;
  if (!qword_2698D89E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89E0);
  }
  return result;
}

unint64_t sub_24E325458()
{
  unint64_t result = qword_2698D89E8;
  if (!qword_2698D89E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89E8);
  }
  return result;
}

unint64_t sub_24E3254B0()
{
  unint64_t result = qword_2698D89F0;
  if (!qword_2698D89F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89F0);
  }
  return result;
}

unint64_t sub_24E325508()
{
  unint64_t result = qword_2698D89F8;
  if (!qword_2698D89F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D89F8);
  }
  return result;
}

unint64_t sub_24E325560()
{
  unint64_t result = qword_2698D8A00;
  if (!qword_2698D8A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8A00);
  }
  return result;
}

unint64_t sub_24E3255B8()
{
  unint64_t result = qword_2698D8A08;
  if (!qword_2698D8A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8A08);
  }
  return result;
}

uint64_t sub_24E32560C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 5459817 && a2 == 0xE300000000000000;
  if (v3 || (sub_24E360320() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x534F63616DLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24E360320();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24E3256E0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000024E3622D0 || (sub_24E360320() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D726F6674616C70 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24E360320();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

void __swiftcall SystemVersionNumber.init(string:)(FindMyDaemonSupport::SystemVersionNumber_optional *__return_ptr retstr, Swift::String string)
{
  object = string._object;
  uint64_t countAndFlagsBits = string._countAndFlagsBits;
  uint64_t v5 = sub_24E360080();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_allocWithZone(MEMORY[0x263F08B08]);
  swift_bridgeObjectRetain();
  uint64_t v35 = countAndFlagsBits;
  uint64_t v10 = sub_24E35FDB0();
  int v36 = object;
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithString_, v10);

  uint64_t v12 = *MEMORY[0x263F07D68];
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v13(v8, v12, v5);
  Swift::Int v34 = sub_24E360090();
  LOBYTE(v10) = v14;
  uint64_t v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v8, v5);
  if ((v10 & 1) != 0 || (uint64_t v16 = sub_24E360070(), !v17))
  {

    goto LABEL_12;
  }
  uint64_t v18 = v17;
  uint64_t v33 = v16;
  v13(v8, v12, v5);
  uint64_t v19 = sub_24E360090();
  char v21 = v20;
  v15(v8, v5);
  if (v21)
  {

    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  unint64_t v22 = v19 % 0x3E8uLL;
  if (v19 < 1000) {
    unint64_t v22 = v19;
  }
  Swift::Int v32 = v22;
  if (v19 >= 1000) {
    Swift::Int v23 = v19 / 0x3E8uLL;
  }
  else {
    Swift::Int v23 = 0;
  }
  uint64_t v24 = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_24E360070();
  uint64_t v27 = v26;
  uint64_t v28 = v35;
  swift_bridgeObjectRetain();
  sub_24E360060();
  uint64_t v29 = sub_24E35FE30();

  if (v29)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    *(_OWORD *)&retstr->value.childType.Swift::Bool is_nil = 0u;
    retstr->value.suffix = 0u;
    *(_OWORD *)&retstr->value.baseNumber = 0u;
    *(_OWORD *)&retstr->value.baseLetter._object = 0u;
    retstr->value.rawValue = 0u;
    return;
  }
  retstr->value.rawValue._uint64_t countAndFlagsBits = v28;
  retstr->value.rawValue._object = v24;
  uint64_t v30 = v33;
  retstr->value.baseNumber = v34;
  retstr->value.baseLetter._uint64_t countAndFlagsBits = v30;
  retstr->value.baseLetter._object = v18;
  retstr->value.childType.Swift::Int value = v23;
  retstr->value.childType.Swift::Bool is_nil = v19 < 1000;
  retstr->value.buildNumber = v32;
  retstr->value.suffix.value._uint64_t countAndFlagsBits = v25;
  retstr->value.suffix.value._object = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

BOOL sub_24E325AF8(void *a1, void *a2)
{
  uint64_t v2 = a2[2];
  uint64_t v3 = a1[2];
  BOOL v4 = v2 < v3;
  if (v2 == v3)
  {
    BOOL v7 = a2[3] == a1[3] && a2[4] == a1[4];
    if (!v7 && (sub_24E360320() & 1) == 0)
    {
      char v15 = sub_24E360320();
      return (v15 & 1) == 0;
    }
    uint64_t v8 = a2[7];
    uint64_t v9 = a1[7];
    BOOL v4 = v8 < v9;
    if (v8 == v9)
    {
      if (a2[9])
      {
        uint64_t v10 = a2[8];
        unint64_t v11 = a2[9];
        unint64_t v12 = a1[9];
        if (v12) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v10 = 0;
        unint64_t v11 = 0xE000000000000000;
        unint64_t v12 = a1[9];
        if (v12)
        {
LABEL_10:
          uint64_t v13 = a1[8];
          unint64_t v14 = v12;
          if (v10 != v13) {
            goto LABEL_20;
          }
LABEL_18:
          if (v11 == v14)
          {
            char v15 = 0;
LABEL_21:
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return (v15 & 1) == 0;
          }
LABEL_20:
          char v15 = sub_24E360320();
          goto LABEL_21;
        }
      }
      unint64_t v14 = 0xE000000000000000;
      if (v10) {
        goto LABEL_20;
      }
      goto LABEL_18;
    }
  }
  char v15 = v4;
  return (v15 & 1) == 0;
}

BOOL sub_24E325C3C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = v2 < v3;
  if (v2 == v3)
  {
    BOOL v7 = a1[3] == a2[3] && a1[4] == a2[4];
    if (!v7 && (sub_24E360320() & 1) == 0)
    {
      char v15 = sub_24E360320();
      return (v15 & 1) == 0;
    }
    uint64_t v8 = a1[7];
    uint64_t v9 = a2[7];
    BOOL v4 = v8 < v9;
    if (v8 == v9)
    {
      if (a1[9])
      {
        uint64_t v10 = a1[8];
        unint64_t v11 = a1[9];
        unint64_t v12 = a2[9];
        if (v12) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v10 = 0;
        unint64_t v11 = 0xE000000000000000;
        unint64_t v12 = a2[9];
        if (v12)
        {
LABEL_10:
          uint64_t v13 = a2[8];
          unint64_t v14 = v12;
          if (v10 != v13) {
            goto LABEL_20;
          }
LABEL_18:
          if (v11 == v14)
          {
            char v15 = 0;
LABEL_21:
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return (v15 & 1) == 0;
          }
LABEL_20:
          char v15 = sub_24E360320();
          goto LABEL_21;
        }
      }
      unint64_t v14 = 0xE000000000000000;
      if (v10) {
        goto LABEL_20;
      }
      goto LABEL_18;
    }
  }
  char v15 = v4;
  return (v15 & 1) == 0;
}

uint64_t sub_24E325D80(void *a1, void *a2)
{
  uint64_t v2 = a2[2];
  uint64_t v3 = a1[2];
  BOOL v4 = v2 < v3;
  if (v2 != v3) {
    goto LABEL_12;
  }
  BOOL v7 = a2[3] == a1[3] && a2[4] == a1[4];
  if (v7 || (sub_24E360320() & 1) != 0)
  {
    uint64_t v8 = a2[7];
    uint64_t v9 = a1[7];
    BOOL v4 = v8 < v9;
    if (v8 == v9)
    {
      if (a2[9])
      {
        uint64_t v10 = a2[8];
        unint64_t v11 = a2[9];
        unint64_t v12 = a1[9];
        if (v12) {
          goto LABEL_10;
        }
      }
      else
      {
        uint64_t v10 = 0;
        unint64_t v11 = 0xE000000000000000;
        unint64_t v12 = a1[9];
        if (v12)
        {
LABEL_10:
          uint64_t v13 = a1[8];
          unint64_t v14 = v12;
          if (v10 != v13) {
            goto LABEL_22;
          }
LABEL_20:
          if (v11 == v14)
          {
            char v15 = 0;
LABEL_23:
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v15 & 1;
          }
LABEL_22:
          char v15 = sub_24E360320();
          goto LABEL_23;
        }
      }
      unint64_t v14 = 0xE000000000000000;
      if (v10) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
LABEL_12:
    char v15 = v4;
    return v15 & 1;
  }

  return sub_24E360320();
}

uint64_t SystemVersionNumber.rawValue.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall SystemVersionNumber.init(rawValue:)(FindMyDaemonSupport::SystemVersionNumber_optional *__return_ptr retstr, Swift::String rawValue)
{
  SystemVersionNumber.init(string:)(&v7, rawValue);
  long long v3 = *(_OWORD *)&v7.value.baseNumber;
  long long v4 = *(_OWORD *)&v7.value.baseLetter._object;
  long long v5 = *(_OWORD *)&v7.value.childType.is_nil;
  Swift::String_optional suffix = v7.value.suffix;
  retstr->value.rawValue = v7.value.rawValue;
  *(_OWORD *)&retstr->value.baseNumber = v3;
  *(_OWORD *)&retstr->value.baseLetter._object = v4;
  *(_OWORD *)&retstr->value.childType.Swift::Bool is_nil = v5;
  retstr->value.Swift::String_optional suffix = suffix;
}

void __swiftcall SystemVersionNumber.init(stringLiteral:)(FindMyDaemonSupport::SystemVersionNumber *__return_ptr retstr, Swift::String stringLiteral)
{
  SystemVersionNumber.init(string:)(&v10, stringLiteral);
  object = v10.value.rawValue._object;
  if (v10.value.rawValue._object)
  {
    long long v4 = v10.value.suffix.value._object;
    Swift::Bool is_nil = v10.value.childType.is_nil;
    FindMyDaemonSupport::SystemVersionNumber_optional v7 = v10.value.baseLetter._object;
    Swift::Int value = v10.value.childType.value;
    long long v8 = *(_OWORD *)&v10.value.baseNumber;
    long long v9 = *(_OWORD *)&v10.value.buildNumber;
    retstr->rawValue._uint64_t countAndFlagsBits = v10.value.rawValue._countAndFlagsBits;
    retstr->rawValue._object = object;
    *(_OWORD *)&retstr->baseNumber = v8;
    retstr->baseLetter._object = v7;
    retstr->childType.Swift::Int value = value;
    retstr->childType.Swift::Bool is_nil = is_nil;
    *(_OWORD *)&retstr->buildNumber = v9;
    retstr->suffix.value._object = v4;
  }
  else
  {
    __break(1u);
  }
}

double sub_24E325FC0@<D0>(Swift::String *a1@<X0>, uint64_t a2@<X8>)
{
  SystemVersionNumber.init(string:)(&v8, *a1);
  double result = *(double *)&v8.value.rawValue._countAndFlagsBits;
  long long v4 = *(_OWORD *)&v8.value.baseNumber;
  long long v5 = *(_OWORD *)&v8.value.baseLetter._object;
  long long v6 = *(_OWORD *)&v8.value.childType.is_nil;
  Swift::String_optional suffix = v8.value.suffix;
  *(Swift::String *)a2 = v8.value.rawValue;
  *(_OWORD *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 32) = v5;
  *(_OWORD *)(a2 + 48) = v6;
  *(Swift::String_optional *)(a2 + 64) = suffix;
  return result;
}

uint64_t sub_24E326010@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24E32601C()
{
  return sub_24E35FE70();
}

uint64_t sub_24E32607C()
{
  return sub_24E35FE50();
}

void sub_24E3260D0(Swift::String *a1@<X0>, uint64_t a2@<X8>)
{
  SystemVersionNumber.init(string:)(&v10, *a1);
  object = v10.value.rawValue._object;
  if (v10.value.rawValue._object)
  {
    long long v4 = v10.value.suffix.value._object;
    Swift::Bool is_nil = v10.value.childType.is_nil;
    FindMyDaemonSupport::SystemVersionNumber_optional v7 = v10.value.baseLetter._object;
    Swift::Int value = v10.value.childType.value;
    long long v8 = *(_OWORD *)&v10.value.baseNumber;
    long long v9 = *(_OWORD *)&v10.value.buildNumber;
    *(void *)a2 = v10.value.rawValue._countAndFlagsBits;
    *(void *)(a2 + 8) = object;
    *(_OWORD *)(a2 + 16) = v8;
    *(void *)(a2 + 32) = v7;
    *(void *)(a2 + 40) = value;
    *(unsigned char *)(a2 + 48) = is_nil;
    *(_OWORD *)(a2 + 56) = v9;
    *(void *)(a2 + 72) = v4;
  }
  else
  {
    __break(1u);
  }
}

BOOL sub_24E32614C(_OWORD *a1, long long *a2)
{
  long long v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  long long v3 = a1[4];
  long long v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  long long v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  long long v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return sub_24E325AF8(v8, v9);
}

BOOL sub_24E3261A8(_OWORD *a1, long long *a2)
{
  long long v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  long long v3 = a1[4];
  long long v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  long long v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  long long v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return sub_24E325C3C(v8, v9);
}

uint64_t sub_24E326204(_OWORD *a1, long long *a2)
{
  long long v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  long long v3 = a1[4];
  long long v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  long long v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  long long v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return sub_24E325D80(v8, v9) & 1;
}

uint64_t sub_24E326260(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_24E360320();
  }
}

uint64_t SystemVersionNumber.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  if ((*(unsigned char *)(v0 + 48) & 1) == 0)
  {
    sub_24E3602F0();
    if (!v1) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (v1) {
LABEL_3:
  }
    sub_24E35FD90();
LABEL_5:
  sub_24E3602F0();
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E35FD90();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E3602F0();
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t _s19FindMyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = v2 < v3;
  if (v2 != v3) {
    goto LABEL_23;
  }
  uint64_t v6 = a1[7];
  uint64_t v5 = a1[8];
  unint64_t v7 = a1[9];
  uint64_t v9 = a2[7];
  uint64_t v8 = a2[8];
  unint64_t v10 = a2[9];
  if (a1[3] == a2[3] && a1[4] == a2[4] || (sub_24E360320() & 1) != 0)
  {
    BOOL v4 = v6 < v9;
    if (v6 == v9)
    {
      if (v7) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 0;
      }
      if (v7) {
        unint64_t v12 = v7;
      }
      else {
        unint64_t v12 = 0xE000000000000000;
      }
      if (v10) {
        uint64_t v13 = v8;
      }
      else {
        uint64_t v13 = 0;
      }
      if (v10) {
        unint64_t v14 = v10;
      }
      else {
        unint64_t v14 = 0xE000000000000000;
      }
      if (v11 == v13 && v12 == v14) {
        char v16 = 0;
      }
      else {
        char v16 = sub_24E360320();
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v16 & 1;
    }
LABEL_23:
    char v16 = v4;
    return v16 & 1;
  }

  return sub_24E360320();
}

unint64_t sub_24E32657C()
{
  unint64_t result = qword_2698D8A10;
  if (!qword_2698D8A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8A10);
  }
  return result;
}

uint64_t sub_24E3265D0()
{
  return MEMORY[0x263F8D388];
}

unint64_t sub_24E3265E0()
{
  unint64_t result = qword_2698D8A18;
  if (!qword_2698D8A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8A18);
  }
  return result;
}

uint64_t sub_24E326634()
{
  return MEMORY[0x263F8D398];
}

uint64_t sub_24E326640()
{
  return MEMORY[0x263F8D390];
}

unint64_t sub_24E326650()
{
  unint64_t result = qword_26B1B5C00;
  if (!qword_26B1B5C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B5C00);
  }
  return result;
}

uint64_t initializeWithCopy for SystemVersionNumber(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SystemVersionNumber(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for SystemVersionNumber(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemVersionNumber(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemVersionNumber(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemVersionNumber()
{
  return &type metadata for SystemVersionNumber;
}

unint64_t sub_24E326904()
{
  unint64_t result = qword_26B1B5BC8;
  if (!qword_26B1B5BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B5BC8);
  }
  return result;
}

uint64_t dispatch thunk of APNSConnector.set(enabledTopics:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_24E322CD0;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of APNSConnector.setDidReceive(block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24E322CD0;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of APNSConnector.setDidReceivePublicToken(block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24E322CD0;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of APNSConnector.setDidReceiveTokenForTopic(block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 32) + **(int **)(a4 + 32));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24E322CD0;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of APNSConnector.setDidReceiveTokenForInfo(block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 40) + **(int **)(a4 + 40));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24E322CD0;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of APNSConnector.requestToken(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 48) + **(int **)(a3 + 48));
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_24E322CD0;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of APNSConnector.requestToken(for:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 56)
                                                                                     + **(int **)(a6 + 56));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = sub_24E322A50;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of APNSConnectorAppTokenInfo.topic.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of APNSConnectorAppTokenInfo.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of APNSConnectorAppTokenInfo.expirationDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_24E3270F0()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B5AE0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5AE0);
  if (qword_26B1B5B38 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5B18);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

unint64_t sub_24E3271B8(uint64_t a1)
{
  return sub_24E3271F0(a1, &qword_26B1B64D0, &qword_26B1B5BB8, &qword_26B1B64F0);
}

unint64_t sub_24E3271D4(uint64_t a1)
{
  return sub_24E3271F0(a1, (uint64_t *)&unk_26B1B64C0, (uint64_t *)&unk_26B1B5BA8, (uint64_t *)&unk_26B1B5B70);
}

unint64_t sub_24E3271F0(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v30 = a4;
  uint64_t v31 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (void *)((char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v10 = sub_24E360240();
  uint64_t v11 = (void *)v10;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  uint64_t v13 = (char *)v9 + *(int *)(v6 + 48);
  uint64_t v14 = v10 + 64;
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v29[1] = a1;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = *(void *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_24E32DA28(v16, (uint64_t)v9, v31);
    uint64_t v18 = *v9;
    uint64_t v19 = v9[1];
    unint64_t result = sub_24E32CD14(*v9, v19);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    Swift::Int v23 = (uint64_t *)(v11[6] + 16 * result);
    uint64_t *v23 = v18;
    v23[1] = v19;
    uint64_t v24 = v11[7];
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(v30);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v24 + *(void *)(*(void *)(v25 - 8) + 72) * v22, v13, v25);
    uint64_t v26 = v11[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_11;
    }
    v11[2] = v28;
    v16 += v17;
    if (!--v12)
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

unint64_t sub_24E3273E8(uint64_t a1)
{
  return sub_24E32747C(a1, (uint64_t *)&unk_26B1B5B98);
}

unint64_t sub_24E3273F4(uint64_t a1)
{
  return sub_24E3271F0(a1, (uint64_t *)&unk_26B1B6318, &qword_26B1B59E0, (uint64_t *)&unk_26B1B6370);
}

unint64_t sub_24E327410(uint64_t a1)
{
  return sub_24E3271F0(a1, (uint64_t *)&unk_26B1B62F8, &qword_26B1B59D0, (uint64_t *)&unk_26B1B5970);
}

unint64_t sub_24E32742C(uint64_t a1)
{
  return sub_24E32747C(a1, &qword_26B1B59C0);
}

unint64_t sub_24E327438(uint64_t a1)
{
  return sub_24E3271F0(a1, &qword_26B1B5950, &qword_26B1B59E8, &qword_26B1B59B0);
}

unint64_t sub_24E327454(uint64_t a1)
{
  return sub_24E3271F0(a1, (uint64_t *)&unk_26B1B5940, &qword_26B1B59D8, &qword_26B1B5990);
}

unint64_t sub_24E327470(uint64_t a1)
{
  return sub_24E32747C(a1, &qword_26B1B59C8);
}

unint64_t sub_24E32747C(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_24E360240();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_24E32CD14(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
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

unint64_t sub_24E327594(uint64_t a1)
{
  return sub_24E3271F0(a1, &qword_26B1B6328, &qword_26B1B63A0, (uint64_t *)&unk_26B1B6380);
}

unint64_t sub_24E3275B0(uint64_t a1)
{
  return sub_24E3271F0(a1, (uint64_t *)&unk_26B1B6308, (uint64_t *)&unk_26B1B6390, (uint64_t *)&unk_26B1B6340);
}

uint64_t (*sub_24E3275CC())()
{
  return j__swift_endAccess;
}

void *DarwinNotificationHandler.__allocating_init(eventStreamHandler:)(uint64_t a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  uint64_t v3 = MEMORY[0x263F8EE78];
  v2[15] = sub_24E3271F0(MEMORY[0x263F8EE78], &qword_26B1B64D0, &qword_26B1B5BB8, &qword_26B1B64F0);
  v2[16] = sub_24E3271F0(v3, (uint64_t *)&unk_26B1B64C0, (uint64_t *)&unk_26B1B5BA8, (uint64_t *)&unk_26B1B5B70);
  v2[17] = sub_24E3271F0(v3, &qword_26B1B64D0, &qword_26B1B5BB8, &qword_26B1B64F0);
  v2[18] = sub_24E3271F0(v3, (uint64_t *)&unk_26B1B64C0, (uint64_t *)&unk_26B1B5BA8, (uint64_t *)&unk_26B1B5B70);
  v2[19] = sub_24E32747C(v3, (uint64_t *)&unk_26B1B5B98);
  v2[14] = a1;
  return v2;
}

void *DarwinNotificationHandler.init(eventStreamHandler:)(uint64_t a1)
{
  swift_defaultActor_initialize();
  uint64_t v3 = MEMORY[0x263F8EE78];
  v1[15] = sub_24E3271F0(MEMORY[0x263F8EE78], &qword_26B1B64D0, &qword_26B1B5BB8, &qword_26B1B64F0);
  v1[16] = sub_24E3271F0(v3, (uint64_t *)&unk_26B1B64C0, (uint64_t *)&unk_26B1B5BA8, (uint64_t *)&unk_26B1B5B70);
  v1[17] = sub_24E3271F0(v3, &qword_26B1B64D0, &qword_26B1B5BB8, &qword_26B1B64F0);
  v1[18] = sub_24E3271F0(v3, (uint64_t *)&unk_26B1B64C0, (uint64_t *)&unk_26B1B5BA8, (uint64_t *)&unk_26B1B5B70);
  v1[19] = sub_24E32747C(v3, (uint64_t *)&unk_26B1B5B98);
  v1[14] = a1;
  return v1;
}

uint64_t sub_24E32782C()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int out_token = 0;
  uint64_t v0 = sub_24E35FDE0();
  notify_register_check((const char *)(v0 + 32), &out_token);
  swift_release();
  int v1 = out_token;
  if (out_token == -1)
  {
    if (qword_26B1B5B00 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24E35FD10();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1B5AE0);
    uint64_t v4 = sub_24E35FCF0();
    os_log_type_t v5 = sub_24E360010();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_24E31F000, v4, v5, "Failed notify_register_check.", v6, 2u);
      MEMORY[0x25333A4C0](v6, -1, -1);
    }

    return 0;
  }
  else
  {
    uint64_t state64 = 0;
    notify_get_state(out_token, &state64);
    notify_cancel(v1);
    return state64;
  }
}

uint64_t sub_24E327988@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v73 = a1;
  uint64_t v69 = a3;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B64E0);
  uint64_t v68 = *(void *)(v71 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v67 = (char *)v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5B88);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v66 = (char *)v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v63 - v10;
  MEMORY[0x270FA5388](v9);
  BOOL v13 = (char *)v63 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B64F0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  char v20 = (char *)v63 - v19;
  swift_beginAccess();
  uint64_t v21 = v3[15];
  uint64_t v22 = *(void *)(v21 + 16);
  v72 = v20;
  if (v22)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v23 = sub_24E32CD14(v73, a2);
    if (v24)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v13, *(void *)(v21 + 56) + *(void *)(v15 + 72) * v23, v14);
      uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
      uint64_t v26 = v13;
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
      uint64_t v26 = v13;
      uint64_t v27 = 1;
    }
    v70 = v25;
    v25(v26, v27, 1, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
      goto LABEL_21;
    }
  }
  else
  {
    v70 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v70(v13, 1, 1, v14);
  }
  sub_24E32D33C((uint64_t)v13, (uint64_t *)&unk_26B1B5B88);
  swift_beginAccess();
  uint64_t v28 = v4[17];
  if (*(void *)(v28 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v29 = sub_24E32CD14(v73, a2);
    if (v30)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v11, *(void *)(v28 + 56) + *(void *)(v15 + 72) * v29, v14);
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v31 = 1;
    }
    v70(v11, v31, 1, v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14) == 1) {
      goto LABEL_14;
    }
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v11, v14);
LABEL_21:
    v40 = v67;
    uint64_t v41 = v68;
    v47 = (unsigned int *)MEMORY[0x263F8F580];
    goto LABEL_22;
  }
  v70(v11, 1, 1, v14);
LABEL_14:
  sub_24E32D33C((uint64_t)v11, (uint64_t *)&unk_26B1B5B88);
  if (qword_26B1B5B00 != -1) {
    swift_once();
  }
  v63[1] = v4 + 17;
  v64 = v18;
  uint64_t v32 = sub_24E35FD10();
  __swift_project_value_buffer(v32, (uint64_t)qword_26B1B5AE0);
  swift_bridgeObjectRetain_n();
  uint64_t v33 = sub_24E35FCF0();
  os_log_type_t v34 = sub_24E360030();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v76[0] = v36;
    *(_DWORD *)uint64_t v35 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_24E32C6BC(v73, a2, v76);
    sub_24E3600B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E31F000, v33, v34, "Creating base AsyncStream for DarwinNotification name: %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v36, -1, -1);
    MEMORY[0x25333A4C0](v35, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  char v37 = (unsigned int *)MEMORY[0x263F8F580];
  uint64_t v38 = sub_24E35FBD0();
  MEMORY[0x270FA5388](v38);
  v63[-4] = v4;
  v65 = v4;
  uint64_t v39 = v73;
  v63[-3] = v73;
  v63[-2] = a2;
  v40 = v67;
  uint64_t v41 = v68;
  (*(void (**)(char *, void, uint64_t))(v68 + 104))(v67, *v37, v71);
  v42 = v64;
  sub_24E35FF50();
  v43 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v44 = v72;
  v43(v72, v42, v14);
  v45 = v66;
  v43(v66, v44, v14);
  v70(v45, 0, 1, v14);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v46 = (uint64_t)v45;
  v47 = (unsigned int *)MEMORY[0x263F8F580];
  sub_24E328584(v46, v39, a2, (uint64_t *)&unk_26B1B5B88, &qword_26B1B64F0, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_24E348354, (void (*)(uint64_t, uint64_t))sub_24E35A0D4);
  swift_endAccess();
  swift_retain();
  v48 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v4 = v65;
  v49 = (__CFString *)sub_24E35FDB0();
  CFNotificationCenterAddObserver(v48, v4, (CFNotificationCallback)sub_24E32B828, v49, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v64, v14);
LABEL_22:
  uint64_t v50 = sub_24E35FBD0();
  MEMORY[0x270FA5388](v50);
  uint64_t v51 = v73;
  v63[-4] = v4;
  v63[-3] = v51;
  v63[-2] = a2;
  (*(void (**)(char *, void, uint64_t))(v41 + 104))(v40, *v47, v71);
  sub_24E35FF50();
  swift_beginAccess();
  uint64_t v52 = v4[19];
  if (*(void *)(v52 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v53 = sub_24E32CD14(v73, a2);
    if (v54)
    {
      uint64_t v55 = *(void *)(*(void *)(v52 + 56) + 8 * v53);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v56 = *(void *)(v55 + 16);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v56 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v56 = 0;
  }
  if (qword_26B1B5B00 != -1) {
    swift_once();
  }
  uint64_t v57 = sub_24E35FD10();
  __swift_project_value_buffer(v57, (uint64_t)qword_26B1B5AE0);
  swift_bridgeObjectRetain_n();
  v58 = sub_24E35FCF0();
  os_log_type_t v59 = sub_24E360030();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v60 = swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    uint64_t v75 = v61;
    *(_DWORD *)uint64_t v60 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v74 = sub_24E32C6BC(v73, a2, &v75);
    sub_24E3600B0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v60 + 12) = 2048;
    uint64_t v74 = v56;
    sub_24E3600B0();
    _os_log_impl(&dword_24E31F000, v58, v59, "Creating sub AsyncStream for DarwinNotification name: [%s], count: %ld", (uint8_t *)v60, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v61, -1, -1);
    MEMORY[0x25333A4C0](v60, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v72, v14);
}

uint64_t sub_24E3283F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5B80);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5B70);
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24E328584((uint64_t)v8, a3, a4, &qword_26B1B5B80, (uint64_t *)&unk_26B1B5B70, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_24E34839C, (void (*)(uint64_t, uint64_t))sub_24E35A0E8);
  return swift_endAccess();
}

uint64_t sub_24E328584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, void (*a6)(char *, uint64_t, uint64_t, uint64_t), void (*a7)(uint64_t, uint64_t))
{
  unint64_t v23 = a6;
  uint64_t v11 = v7;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388]();
  char v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(a1, 1, v17) == 1)
  {
    sub_24E32D33C(a1, a4);
    a7(a2, a3);
    swift_bridgeObjectRelease();
    return sub_24E32D33C((uint64_t)v16, a4);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v20, a1, v17);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v24 = *v11;
    *uint64_t v11 = 0x8000000000000000;
    v23(v20, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v11 = v24;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24E328778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E328584(a1, a2, a3, (uint64_t *)&unk_26B1B59A0, (uint64_t *)&unk_26B1B6370, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_24E348424, (void (*)(uint64_t, uint64_t))sub_24E35A2C0);
}

uint64_t sub_24E3287B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E328584(a1, a2, a3, (uint64_t *)&unk_26B1B5980, (uint64_t *)&unk_26B1B5970, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_24E34846C, (void (*)(uint64_t, uint64_t))sub_24E35A2D4);
}

uint64_t sub_24E3287F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67B0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_24E32D33C(a1, (uint64_t *)&unk_26B1B67B0);
    sub_24E35A2E8(a2, (uint64_t)v8);
    uint64_t v13 = sub_24E35FCE0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
    return sub_24E32D33C((uint64_t)v8, (uint64_t *)&unk_26B1B67B0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_24E3484F4((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v18;
    swift_bridgeObjectRelease();
    uint64_t v16 = sub_24E35FCE0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_24E328A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E328584(a1, a2, a3, &qword_26B1B59B8, &qword_26B1B59B0, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_24E3486FC, (void (*)(uint64_t, uint64_t))sub_24E35A4C0);
}

uint64_t sub_24E328A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E328584(a1, a2, a3, &qword_26B1B5998, &qword_26B1B5990, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_24E348744, (void (*)(uint64_t, uint64_t))sub_24E35A4D4);
}

uint64_t sub_24E328A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24E328584(a1, a2, a3, (uint64_t *)&unk_26B1B6350, (uint64_t *)&unk_26B1B6340, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_24E348940, (void (*)(uint64_t, uint64_t))sub_24E35A5C0);
}

uint64_t sub_24E328AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5B70);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)&v28[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)(a2 + 152);
  swift_beginAccess();
  if (*(void *)(*(void *)(a2 + 152) + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_24E32CD14(a3, a4),
        char v14 = v13,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v14 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24E3275CC();
    uint64_t v17 = sub_24E33A958(v28, a3, a4);
    if (*v16)
    {
      uint64_t v18 = v16;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
      unint64_t v19 = *v18;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t *v18 = v19;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v19 = sub_24E339D7C(0, *(void *)(v19 + 16) + 1, 1, v19);
        unint64_t *v18 = v19;
      }
      unint64_t v22 = *(void *)(v19 + 16);
      unint64_t v21 = *(void *)(v19 + 24);
      if (v22 >= v21 >> 1)
      {
        unint64_t v19 = sub_24E339D7C(v21 > 1, v22 + 1, 1, v19);
        unint64_t *v18 = v19;
      }
      *(void *)(v19 + 16) = v22 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v22, v11, v8);
      ((void (*)(void *, void))v17)(v28, 0);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(unsigned char *, void))v15)(v29, 0);
    }
    else
    {
      ((void (*)(void *, void))v17)(v28, 0);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(unsigned char *, void))v15)(v29, 0);
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5BC0);
    unint64_t v24 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_24E3617D0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16))(v25 + v24, a1, v8);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    v28[0] = *v12;
    *uint64_t v12 = 0x8000000000000000;
    sub_24E3483E4(v25, a3, a4, v26);
    *uint64_t v12 = v28[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

uint64_t DarwinNotificationHandler.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t DarwinNotificationHandler.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t DarwinNotificationHandler.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E328EF0(uint64_t a1)
{
  v2[11] = a1;
  v2[12] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B64E0);
  v2[13] = v3;
  v2[14] = *(void *)(v3 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B64F0);
  v2[16] = v4;
  v2[17] = *(void *)(v4 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E329024, v1, 0);
}

uint64_t sub_24E329024()
{
  unint64_t v53 = v0;
  uint64_t v1 = v0[11];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
LABEL_20:
    uint64_t v40 = v0[12];
    uint64_t result = swift_beginAccess();
    if (*(void *)(*(void *)(v40 + 120) + 16) == v2)
    {
      uint64_t v41 = v0[12];
      uint64_t result = swift_beginAccess();
      if (*(void *)(*(void *)(v41 + 128) + 16) == v2)
      {
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v42 = (uint64_t (*)(void))v0[1];
        return v42();
      }
    }
    else
    {
LABEL_30:
      __break(1u);
    }
    __break(1u);
    return result;
  }
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[12];
  sub_24E35FBD0();
  uint64_t v51 = (uint64_t *)(v5 + 120);
  v48 = (void (**)(uint64_t, void, uint64_t))(v4 + 104);
  unsigned int v47 = *MEMORY[0x263F8F580];
  uint64_t v45 = v3;
  uint64_t v46 = (void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v44 = (void (**)(uint64_t, uint64_t))(v3 + 8);
  swift_bridgeObjectRetain();
  uint64_t v6 = (unint64_t *)(v1 + 40);
  uint64_t v43 = v2;
  while (1)
  {
    uint64_t v9 = *(v6 - 1);
    unint64_t v10 = *v6;
    uint64_t v11 = qword_26B1B5B00;
    swift_bridgeObjectRetain();
    if (v11 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_24E35FD10();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B1B5AE0);
    swift_bridgeObjectRetain_n();
    char v13 = sub_24E35FCF0();
    os_log_type_t v14 = sub_24E360030();
    uint64_t v50 = v2;
    v49 = v6;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v52 = (void *)v16;
      *(_DWORD *)uint64_t v15 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v15 + 4) = sub_24E32C6BC(v9, v10, (uint64_t *)&v52);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E31F000, v13, v14, "Creating base AsyncStream for registered Darwin notification name: %{public}s", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v16, -1, -1);
      MEMORY[0x25333A4C0](v15, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v18 = v0[18];
    uint64_t v17 = v0[19];
    uint64_t v20 = v0[15];
    uint64_t v19 = v0[16];
    uint64_t v22 = v0[12];
    uint64_t v21 = v0[13];
    unint64_t v23 = (void *)swift_task_alloc();
    v23[2] = v22;
    v23[3] = v9;
    v23[4] = v10;
    (*v48)(v20, v47, v21);
    sub_24E35FF50();
    swift_task_dealloc();
    swift_beginAccess();
    (*v46)(v18, v17, v19);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v52 = (void *)*v51;
    uint64_t v25 = v52;
    *uint64_t v51 = 0x8000000000000000;
    unint64_t v27 = sub_24E32CD14(v9, v10);
    uint64_t v28 = v25[2];
    BOOL v29 = (v26 & 1) == 0;
    uint64_t result = v28 + v29;
    if (__OFADD__(v28, v29))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    char v31 = v26;
    if (v25[3] < result) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_24E35BFB0();
      uint64_t v25 = v52;
    }
LABEL_16:
    uint64_t v34 = v0[18];
    uint64_t v35 = v0[16];
    if (v31)
    {
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v45 + 40))(v25[7] + *(void *)(v45 + 72) * v27, v34, v35);
    }
    else
    {
      v25[(v27 >> 6) + 8] |= 1 << v27;
      uint64_t v36 = (uint64_t *)(v25[6] + 16 * v27);
      *uint64_t v36 = v9;
      v36[1] = v10;
      uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v45 + 32))(v25[7] + *(void *)(v45 + 72) * v27, v34, v35);
      uint64_t v37 = v25[2];
      BOOL v38 = __OFADD__(v37, 1);
      uint64_t v39 = v37 + 1;
      if (v38) {
        goto LABEL_29;
      }
      v25[2] = v39;
      swift_bridgeObjectRetain();
    }
    uint64_t v7 = v0[19];
    uint64_t v8 = v0[16];
    *uint64_t v51 = (uint64_t)v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    (*v44)(v7, v8);
    uint64_t v6 = v49 + 2;
    uint64_t v2 = v50 - 1;
    if (v50 == 1)
    {
      swift_bridgeObjectRelease();
      uint64_t v2 = v43;
      goto LABEL_20;
    }
  }
  sub_24E35A5D4(result, isUniquelyReferenced_nonNull_native);
  uint64_t v25 = v52;
  unint64_t v32 = sub_24E32CD14(v9, v10);
  if ((v31 & 1) == (v33 & 1))
  {
    unint64_t v27 = v32;
    goto LABEL_16;
  }
  return sub_24E360350();
}

uint64_t sub_24E329570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5B80);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5B70);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24E328584((uint64_t)v9, a3, a4, &qword_26B1B5B80, (uint64_t *)&unk_26B1B5B70, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_24E34839C, (void (*)(uint64_t, uint64_t))sub_24E35A0E8);
  return swift_endAccess();
}

uint64_t sub_24E3296FC()
{
  v1[14] = v0;
  uint64_t v2 = sub_24E35FBD0();
  v1[15] = v2;
  v1[16] = *(void *)(v2 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6360);
  v1[19] = v3;
  v1[20] = *(void *)(v3 - 8);
  v1[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5DD0);
  v1[22] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6380);
  v1[23] = v4;
  v1[24] = *(void *)(v4 - 8);
  v1[25] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E3298BC, v0, 0);
}

uint64_t sub_24E3298BC()
{
  if (MEMORY[0x253339500]())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    uint64_t v3 = *(void *)(v0[14] + 112);
    v0[26] = v3;
    return MEMORY[0x270FA2498](sub_24E329998, v3, 0);
  }
}

uint64_t sub_24E329998()
{
  uint64_t v1 = v0[26];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 120);
  if (*(void *)(v2 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v3 = sub_24E32CD14(0xD00000000000001ALL, 0x800000024E362170);
    uint64_t v4 = v0[23];
    uint64_t v5 = v0[24];
    uint64_t v6 = v0[22];
    if (v7)
    {
      (*(void (**)(void, unint64_t, void))(v5 + 16))(v0[22], *(void *)(v2 + 56) + *(void *)(v5 + 72) * v3, v0[23]);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v6, 0, 1, v4);
    }
    else
    {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v5 + 56))(v0[22], 1, 1, v4);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[24] + 56))(v0[22], 1, 1, v0[23]);
  }
  uint64_t v8 = v0[14];
  return MEMORY[0x270FA2498](sub_24E329AD8, v8, 0);
}

uint64_t sub_24E329AD8()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[24];
  uint64_t v3 = v0[22];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24E32D33C(v3, &qword_26B1B5DD0);
    return sub_24E360210();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[25], v3, v1);
    sub_24E35FF30();
    uint64_t v6 = sub_24E32D2F4(&qword_26B1B5C60, v5, (void (*)(uint64_t))type metadata accessor for DarwinNotificationHandler);
    v0[27] = v6;
    uint64_t v7 = v0[14];
    uint64_t v8 = (void *)swift_task_alloc();
    v0[28] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_24E329CB4;
    uint64_t v9 = v0[19];
    return MEMORY[0x270FA1F68](v0 + 9, v7, v6, v9);
  }
}

uint64_t sub_24E329CB4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E329DC4, v1, 0);
}

uint64_t sub_24E329DC4()
{
  uint64_t v54 = v0;
  uint64_t v1 = *(void *)(v0 + 72);
  if (!v1)
  {
    uint64_t v9 = *(void *)(v0 + 192);
    uint64_t v8 = *(void *)(v0 + 200);
    uint64_t v10 = *(void *)(v0 + 184);
    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 152));
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    goto LABEL_23;
  }
  uint64_t v2 = (_OWORD *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 80);
  if (qword_26B1B5530 == -1)
  {
    if (*(void *)(v1 + 16))
    {
LABEL_4:
      uint64_t v4 = qword_26B1B6830;
      uint64_t v5 = qword_26B1B6828;
      swift_bridgeObjectRetain();
      unint64_t v6 = sub_24E32CD14(v5, v4);
      if (v7)
      {
        sub_24E32D398(*(void *)(v1 + 56) + 32 * v6, v0 + 16);
      }
      else
      {
        *uint64_t v2 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
      }
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    swift_once();
    if (*(void *)(v1 + 16)) {
      goto LABEL_4;
    }
  }
  *uint64_t v2 = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
LABEL_11:
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A10);
    if (swift_dynamicCast())
    {
      swift_retain();
      uint64_t v50 = v3;
      sub_24E35FBB0();
      if (qword_26B1B5B00 != -1) {
        swift_once();
      }
      uint64_t v12 = *(void *)(v0 + 136);
      uint64_t v11 = *(void *)(v0 + 144);
      uint64_t v14 = *(void *)(v0 + 120);
      uint64_t v13 = *(void *)(v0 + 128);
      uint64_t v15 = sub_24E35FD10();
      __swift_project_value_buffer(v15, (uint64_t)qword_26B1B5AE0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v11, v14);
      uint64_t v16 = sub_24E35FCF0();
      os_log_type_t v17 = sub_24E360030();
      BOOL v18 = os_log_type_enabled(v16, v17);
      uint64_t v19 = *(void *)(v0 + 136);
      uint64_t v20 = *(void *)(v0 + 120);
      uint64_t v21 = (void (**)(uint64_t, uint64_t))(*(void *)(v0 + 128) + 8);
      if (v18)
      {
        uint64_t v22 = swift_slowAlloc();
        uint64_t v51 = swift_slowAlloc();
        uint64_t v53 = v51;
        *(_DWORD *)uint64_t v22 = 136446210;
        sub_24E32D2F4(qword_26B1B5A28, 255, MEMORY[0x263F3C9E8]);
        uint64_t v23 = sub_24E3602F0();
        *(void *)(v22 + 4) = sub_24E32C6BC(v23, v24, &v53);
        swift_bridgeObjectRelease();
        uint64_t v25 = *v21;
        (*v21)(v19, v20);
        _os_log_impl(&dword_24E31F000, v16, v17, "XPCEventStream notification: %{public}s", (uint8_t *)v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333A4C0](v51, -1, -1);
        MEMORY[0x25333A4C0](v22, -1, -1);
      }
      else
      {
        uint64_t v25 = *v21;
        (*v21)(*(void *)(v0 + 136), *(void *)(v0 + 120));
      }

      uint64_t v41 = *(void *)(v0 + 144);
      uint64_t v42 = *(void *)(v0 + 120);
      sub_24E32A434(v41, v50);
      swift_release();
      v25(v41, v42);
      uint64_t v43 = *(void *)(v0 + 216);
      uint64_t v44 = *(void *)(v0 + 112);
      uint64_t v45 = (void *)swift_task_alloc();
      *(void *)(v0 + 224) = v45;
      void *v45 = v0;
      v45[1] = sub_24E329CB4;
      uint64_t v46 = *(void *)(v0 + 152);
      return MEMORY[0x270FA1F68](v0 + 72, v44, v43, v46);
    }
  }
  else
  {
    sub_24E32D33C(v0 + 16, &qword_2698D8AD0);
  }
  if (qword_26B1B5B00 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_24E35FD10();
  __swift_project_value_buffer(v26, (uint64_t)qword_26B1B5AE0);
  unint64_t v27 = sub_24E35FCF0();
  os_log_type_t v28 = sub_24E360010();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v31 = *(void *)(v0 + 192);
  uint64_t v30 = *(void *)(v0 + 200);
  uint64_t v32 = *(void *)(v0 + 184);
  uint64_t v33 = *(void *)(v0 + 160);
  uint64_t v34 = *(void *)(v0 + 168);
  uint64_t v52 = *(void *)(v0 + 152);
  if (v29)
  {
    uint64_t v49 = *(void *)(v0 + 184);
    uint64_t v48 = *(void *)(v0 + 200);
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315138;
    uint64_t v53 = v36;
    uint64_t v47 = v34;
    uint64_t v37 = qword_26B1B6828;
    unint64_t v38 = qword_26B1B6830;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 104) = sub_24E32C6BC(v37, v38, &v53);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E31F000, v27, v28, "Event missing \"%s\" key!", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v36, -1, -1);
    MEMORY[0x25333A4C0](v35, -1, -1);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v47, v52);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v48, v49);
  }
  else
  {

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v52);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  }
LABEL_23:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v39 = *(uint64_t (**)(void))(v0 + 8);
  return v39();
}

void sub_24E32A434(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = a2;
  uint64_t v34 = sub_24E35FBD0();
  uint64_t v4 = *(void *)(v34 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v34);
  char v7 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24E35FBC0();
  uint64_t v15 = v14;
  swift_beginAccess();
  uint64_t v16 = *(void *)(v2 + 152);
  if (*(void *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_24E32CD14(v13, v15);
    if (v18)
    {
      uint64_t v19 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v20 = sub_24E35FF00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 1, 1, v20);
      uint64_t v21 = v34;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, a1, v34);
      unint64_t v22 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      uint64_t v23 = (char *)swift_allocObject();
      *((void *)v23 + 2) = 0;
      *((void *)v23 + 3) = 0;
      *((void *)v23 + 4) = v33;
      *((void *)v23 + 5) = v19;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v23[v22], v9, v21);
      swift_retain();
      sub_24E33ABB0((uint64_t)v12, (uint64_t)&unk_2698D8A70, (uint64_t)v23);
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = v34;
  if (qword_26B1B5B00 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_24E35FD10();
  __swift_project_value_buffer(v25, (uint64_t)qword_26B1B5AE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v24);
  uint64_t v26 = sub_24E35FCF0();
  os_log_type_t v27 = sub_24E360020();
  if (os_log_type_enabled(v26, v27))
  {
    os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v36 = v29;
    *(_DWORD *)os_log_type_t v28 = 136446210;
    sub_24E32D2F4(qword_26B1B5A28, 255, MEMORY[0x263F3C9E8]);
    uint64_t v30 = sub_24E3602F0();
    uint64_t v35 = sub_24E32C6BC(v30, v31, &v36);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v24);
    _os_log_impl(&dword_24E31F000, v26, v27, "Received notification %{public}s with no subscribers!", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v29, -1, -1);
    MEMORY[0x25333A4C0](v28, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v24);
  }
}

uint64_t sub_24E32A898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[13] = a5;
  v6[14] = a6;
  v6[12] = a4;
  uint64_t v7 = sub_24E35FBD0();
  v6[15] = v7;
  v6[16] = *(void *)(v7 - 8);
  v6[17] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5B68);
  v6[18] = v8;
  v6[19] = *(void *)(v8 - 8);
  v6[20] = swift_task_alloc();
  if (qword_26B1B63C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v9 = qword_26B1B63B8;
  return MEMORY[0x270FA2498](sub_24E32AA08, v9, 0);
}

uint64_t sub_24E32AA08(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = qword_26B1B63E8;
  *(void *)(v3 + 168) = qword_26B1B63E8;
  if (v4)
  {
    swift_retain();
    a1 = sub_24E32AA88;
    a2 = v4;
    a3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_24E32AA88()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 168) + 128);
  *(void *)(v0 + 176) = v1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_24E32AB00, v1, 0);
}

uint64_t sub_24E32AB00()
{
  uint64_t v1 = v0[22];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  v0[23] = v2;
  uint64_t v3 = *(void *)(v2 + 16);
  v0[24] = v3;
  if (!v3)
  {
LABEL_10:
    swift_release();
    swift_release();
    return MEMORY[0x270FA2498](sub_24E32ADC4, 0, 0);
  }
  swift_bridgeObjectRetain();
  swift_beginAccess();
  for (uint64_t i = 0; ; uint64_t i = v0[25] + 1)
  {
    v0[25] = i;
    uint64_t v5 = v0[22];
    uint64_t v6 = v0[23] + 16 * i;
    v0[26] = *(void *)(v6 + 32);
    uint64_t v7 = *(void *)(v6 + 40);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
    swift_unknownObjectRetain();
    uint64_t v10 = v9(ObjectType, v7);
    uint64_t v12 = v11;
    v0[27] = v11;
    if (!*(void *)(*(void *)(v5 + 128) + 16)) {
      goto LABEL_6;
    }
    uint64_t v13 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E32CD14(v13, v12);
    if (v14) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v15 = v0[25];
    uint64_t v16 = v0[24];
    swift_unknownObjectRelease();
    if (v15 + 1 == v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  uint64_t v17 = v0[22];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E32D2F4((unint64_t *)&qword_26B1B67F0, 255, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
  char v18 = (void *)swift_task_alloc();
  v0[28] = v18;
  v18[2] = v17;
  v18[3] = v13;
  v18[4] = v12;
  uint64_t v19 = (void *)swift_task_alloc();
  v0[29] = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_24E32AFA0;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_24E32ADC4()
{
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  sub_24E35FB20();
  sub_24E35FB00();
  v0[11] = v2;
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A20);
  swift_task_localValuePush();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v0[19];
    uint64_t v5 = v0[16];
    uint64_t v6 = v0[13];
    uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5B70) - 8);
    uint64_t v8 = v6 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = *(void *)(v7 + 72);
    uint64_t v10 = *(void (**)(void, void, void))(v5 + 16);
    uint64_t v11 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v12 = v0[20];
      uint64_t v13 = v0[18];
      v10(v0[17], v0[14], v0[15]);
      sub_24E35FF20();
      (*v11)(v12, v13);
      v8 += v9;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_localValuePop();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  char v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24E32AFA0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 176);
    uint64_t v4 = sub_24E32B33C;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 176);
    swift_task_dealloc();
    uint64_t v4 = sub_24E32B0C8;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E32B0C8()
{
  while (1)
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = v0[25];
    uint64_t v2 = v0[24];
    swift_unknownObjectRelease();
    if (v1 + 1 == v2) {
      break;
    }
    uint64_t v3 = v0[25] + 1;
    v0[25] = v3;
    uint64_t v4 = v0[22];
    uint64_t v5 = v0[23] + 16 * v3;
    v0[26] = *(void *)(v5 + 32);
    uint64_t v6 = *(void *)(v5 + 40);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
    swift_unknownObjectRetain();
    uint64_t v9 = v8(ObjectType, v6);
    uint64_t v11 = v10;
    v0[27] = v10;
    if (*(void *)(*(void *)(v4 + 128) + 16))
    {
      uint64_t v12 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E32CD14(v12, v11);
      if (v13)
      {
        uint64_t v14 = v0[22];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24E32D2F4((unint64_t *)&qword_26B1B67F0, 255, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
        uint64_t v15 = (void *)swift_task_alloc();
        v0[28] = v15;
        v15[2] = v14;
        v15[3] = v12;
        v15[4] = v11;
        uint64_t v16 = (void *)swift_task_alloc();
        v0[29] = v16;
        *uint64_t v16 = v0;
        v16[1] = sub_24E32AFA0;
        return MEMORY[0x270FA2360]();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](sub_24E32ADC4, 0, 0);
}

uint64_t sub_24E32B33C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 168);
  return MEMORY[0x270FA2498](sub_24E32B3CC, v1, 0);
}

uint64_t sub_24E32B3CC()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24E32B434, 0, 0);
}

uint64_t sub_24E32B434()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E32B4AC()
{
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v0 = xpc_copy_event();
  if (!v0)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    return v6;
  }
  uint64_t v1 = (void *)v0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v8;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_24E32D2BC;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_24E32D2D4;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24E346638;
  aBlock[3] = &block_descriptor;
  uint64_t v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(v1, v4);
  swift_unknownObjectRelease();
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v1 & 1) == 0)
  {
    uint64_t v6 = v8;
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E32B63C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a4;
  v6[3] = a6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  v6[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E32B6D0, 0, 0);
}

uint64_t sub_24E32B6D0()
{
  if (v0[3])
  {
    uint64_t v1 = v0[4];
    uint64_t v2 = v0[2];
    uint64_t v3 = sub_24E35FDC0();
    uint64_t v5 = v4;
    uint64_t v6 = sub_24E35FF00();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 1, 1, v6);
    uint64_t v8 = sub_24E32D2F4(&qword_26B1B5C60, v7, (void (*)(uint64_t))type metadata accessor for DarwinNotificationHandler);
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = v2;
    v9[3] = v8;
    v9[4] = v3;
    _OWORD v9[5] = v5;
    v9[6] = v2;
    swift_retain_n();
    sub_24E346460(v1, (uint64_t)&unk_2698D8AA0, (uint64_t)v9);
    swift_release();
  }
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

void sub_24E32B828(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v11 = sub_24E35FF00();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    swift_retain();
    v12(v10, 1, 1, v11);
    char v13 = (void *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = a2;
    v13[5] = a1;
    v13[6] = a3;
    v13[7] = a5;
    id v14 = a1;
    id v15 = a3;
    id v16 = a5;
    id v17 = v14;
    id v18 = v15;
    id v19 = v16;
    sub_24E346460((uint64_t)v10, (uint64_t)&unk_2698D8A90, (uint64_t)v13);
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24E32B990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_24E32B9B4, a6, 0);
}

uint64_t sub_24E32B9B4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_24E35FB20();
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  sub_24E35FAE0();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24E32BA90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a4;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24E35FBD0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v13 = (char *)&v21 - v12;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E35FBB0();
  uint64_t v14 = sub_24E35FF00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v16 = sub_24E32D2F4(&qword_26B1B5C60, v15, (void (*)(uint64_t))type metadata accessor for DarwinNotificationHandler);
  unint64_t v17 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  id v18 = (char *)swift_allocObject();
  uint64_t v19 = v22;
  *((void *)v18 + 2) = v22;
  *((void *)v18 + 3) = v16;
  *((void *)v18 + 4) = v19;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v17], v11, v7);
  swift_retain_n();
  sub_24E346460((uint64_t)v6, (uint64_t)&unk_2698D8AB0, (uint64_t)v18);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t sub_24E32BD24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24E32BD48, a4, 0);
}

uint64_t sub_24E32BD48()
{
  sub_24E35FB20();
  *(_OWORD *)(swift_task_alloc() + 16) = *(_OWORD *)(v0 + 24);
  sub_24E35FAE0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_24E32BE20(uint64_t a1, uint64_t a2)
{
  uint64_t v33 = a2;
  uint64_t v34 = sub_24E35FBD0();
  uint64_t v4 = *(void *)(v34 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = MEMORY[0x270FA5388](v34);
  uint64_t v7 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24E35FBC0();
  uint64_t v15 = v14;
  swift_beginAccess();
  uint64_t v16 = *(void *)(v2 + 152);
  if (*(void *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_24E32CD14(v13, v15);
    if (v18)
    {
      uint64_t v19 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v20 = sub_24E35FF00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 1, 1, v20);
      uint64_t v21 = v34;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, a1, v34);
      unint64_t v22 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      uint64_t v23 = (char *)swift_allocObject();
      *((void *)v23 + 2) = 0;
      *((void *)v23 + 3) = 0;
      *((void *)v23 + 4) = v33;
      *((void *)v23 + 5) = v19;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v23[v22], v9, v21);
      swift_retain();
      sub_24E346460((uint64_t)v12, (uint64_t)&unk_2698D8AC0, (uint64_t)v23);
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = v34;
  if (qword_26B1B5B00 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_24E35FD10();
  __swift_project_value_buffer(v25, (uint64_t)qword_26B1B5AE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v24);
  uint64_t v26 = sub_24E35FCF0();
  os_log_type_t v27 = sub_24E360020();
  if (os_log_type_enabled(v26, v27))
  {
    os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v36 = v29;
    *(_DWORD *)os_log_type_t v28 = 136315138;
    sub_24E32D2F4(qword_26B1B5A28, 255, MEMORY[0x263F3C9E8]);
    uint64_t v30 = sub_24E3602F0();
    uint64_t v35 = sub_24E32C6BC(v30, v31, &v36);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v24);
    _os_log_impl(&dword_24E31F000, v26, v27, "Received unexpected unregistered notification: [%s]", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v29, -1, -1);
    MEMORY[0x25333A4C0](v28, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v24);
  }
}

uint64_t sub_24E32C284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  uint64_t v7 = sub_24E35FBD0();
  v6[6] = v7;
  v6[7] = *(void *)(v7 - 8);
  v6[8] = swift_task_alloc();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5B68);
  v6[9] = v8;
  v6[10] = *(void *)(v8 - 8);
  v6[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E32C3A8, 0, 0);
}

uint64_t sub_24E32C3A8()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  sub_24E35FB20();
  sub_24E35FB00();
  v0[2] = v2;
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A20);
  swift_task_localValuePush();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v0[10];
    uint64_t v5 = v0[7];
    uint64_t v6 = v0[4];
    uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5B70) - 8);
    uint64_t v8 = v6 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v9 = *(void *)(v7 + 72);
    uint64_t v10 = *(void (**)(void, void, void))(v5 + 16);
    uint64_t v11 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v12 = v0[11];
      uint64_t v13 = v0[9];
      v10(v0[8], v0[5], v0[6]);
      sub_24E35FF20();
      (*v11)(v12, v13);
      v8 += v9;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_localValuePop();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24E32C580()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B5B18);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5B18);
  return sub_24E35FD00();
}

uint64_t sub_24E32C604(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v4 = sub_24E35FE10();
  uint64_t v6 = v5;
  uint64_t v7 = *a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_24E339FFC(0, v7[2] + 1, 1, v7);
    *a3 = v7;
  }
  unint64_t v10 = v7[2];
  unint64_t v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    uint64_t v7 = sub_24E339FFC((void *)(v9 > 1), v10 + 1, 1, v7);
    *a3 = v7;
  }
  v7[2] = v10 + 1;
  uint64_t v11 = &v7[2 * v10];
  v11[4] = v4;
  v11[5] = v6;
  return 1;
}

uint64_t sub_24E32C6BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24E32C790(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24E32D398((uint64_t)v12, *a3);
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
      sub_24E32D398((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24E32C790(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24E3600C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24E32C94C(a5, a6);
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
  uint64_t v8 = sub_24E360180();
  if (!v8)
  {
    sub_24E360200();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24E360250();
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

uint64_t sub_24E32C94C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24E32C9E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24E32CBC4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24E32CBC4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24E32C9E4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24E32CB5C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24E360150();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24E360200();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24E35FE20();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24E360250();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24E360200();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24E32CB5C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6528);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24E32CBC4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6528);
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
  uint64_t result = sub_24E360250();
  __break(1u);
  return result;
}

unint64_t sub_24E32CD14(uint64_t a1, uint64_t a2)
{
  sub_24E3603C0();
  sub_24E35FDF0();
  uint64_t v4 = sub_24E3603E0();

  return sub_24E32CFF8(a1, a2, v4);
}

uint64_t sub_24E32CD8C(uint64_t a1)
{
  return sub_24E3283F8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24E32CD98(uint64_t a1)
{
  return sub_24E328AD4(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for DarwinNotificationHandler()
{
  return self;
}

uint64_t method lookup function for DarwinNotificationHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DarwinNotificationHandler);
}

uint64_t dispatch thunk of DarwinNotificationHandler.__allocating_init(eventStreamHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of DarwinNotificationHandler.currentValue(name:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of DarwinNotificationHandler.asyncStream(name:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t sub_24E32CE50(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24E35FBD0() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24E322A50;
  return sub_24E32A898(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_24E32CF50(uint64_t a1)
{
  return sub_24E35951C(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_24E32CF5C(uint64_t a1)
{
  sub_24E35FCE0();
  sub_24E32D2F4((unint64_t *)&unk_26B1B6780, 255, MEMORY[0x263F07508]);
  uint64_t v2 = sub_24E35FD80();

  return sub_24E32D0DC(a1, v2);
}

unint64_t sub_24E32CFF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24E360320() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24E360320() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24E32D0DC(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_24E35FCE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_24E32D2F4(&qword_26B1B6808, 255, MEMORY[0x263F07508]);
      char v15 = sub_24E35FDA0();
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

uint64_t sub_24E32D2A0(uint64_t a1)
{
  return sub_24E329570(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24E32D2AC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E32D2BC(uint64_t a1, uint64_t a2)
{
  return sub_24E32C604(a1, a2, *(void ***)(v2 + 16));
}

uint64_t sub_24E32D2C4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E32D2D4(uint64_t a1, uint64_t a2)
{
  return sub_24E34660C(a1, a2, *(uint64_t (**)(void))(v2 + 16));
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

uint64_t sub_24E32D2F4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_24E32D33C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24E32D398(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24E32D3F8()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24E32D450(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  unint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *unint64_t v9 = v2;
  v9[1] = sub_24E322A50;
  return sub_24E32B63C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_24E32D524()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24E32D56C(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = v1[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[4] = v5;
  v7[5] = v6;
  v7[2] = a1;
  v7[3] = v4;
  v7[1] = sub_24E322CD0;
  return MEMORY[0x270FA2498](sub_24E32B9B4, v6, 0);
}

uint64_t sub_24E32D62C(uint64_t a1)
{
  return sub_24E32BA90(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24E32D64C()
{
  uint64_t v1 = sub_24E35FBD0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24E32D720(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24E35FBD0() - 8);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[3] = v5;
  v7[4] = v6;
  v7[1] = sub_24E322CD0;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_24E32BD48, v5, 0);
}

void sub_24E32D814(uint64_t a1)
{
  sub_24E32BE20(*(void *)(v1 + 24), a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_24E35FBD0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24E32D928(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_24E35FBD0() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = v1[5];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_24E322CD0;
  return sub_24E32C284(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_24E32DA28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24E32DA8C()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B58C0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B58C0);
  if (qword_26B1B5938 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5918);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void *DistributedNotificationHandler.__allocating_init(eventStreamHandler:)(uint64_t a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  uint64_t v3 = MEMORY[0x263F8EE78];
  v2[15] = sub_24E3273F4(MEMORY[0x263F8EE78]);
  v2[16] = sub_24E327410(v3);
  v2[17] = sub_24E3273F4(v3);
  v2[18] = sub_24E327410(v3);
  v2[19] = sub_24E32742C(v3);
  v2[14] = a1;
  return v2;
}

void *DistributedNotificationHandler.init(eventStreamHandler:)(uint64_t a1)
{
  swift_defaultActor_initialize();
  uint64_t v3 = MEMORY[0x263F8EE78];
  v1[15] = sub_24E3273F4(MEMORY[0x263F8EE78]);
  v1[16] = sub_24E327410(v3);
  v1[17] = sub_24E3273F4(v3);
  v1[18] = sub_24E327410(v3);
  v1[19] = sub_24E32742C(v3);
  v1[14] = a1;
  return v1;
}

uint64_t sub_24E32DC5C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v84 = a1;
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6330);
  uint64_t v79 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  v78 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B59A0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v74 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v74 - v15;
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6370);
  uint64_t v17 = *(void *)(v85 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v85);
  v77 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v74 - v20;
  swift_beginAccess();
  uint64_t v22 = *(void *)(v3 + 120);
  uint64_t v23 = *(void *)(v22 + 16);
  v82 = v21;
  uint64_t v80 = a3;
  if (v23)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v24 = sub_24E32CD14(v84, a2);
    if (v25)
    {
      uint64_t v26 = v85;
      (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v16, *(void *)(v22 + 56) + *(void *)(v17 + 72) * v24, v85);
      os_log_type_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
      os_log_type_t v28 = v16;
      uint64_t v29 = 0;
      uint64_t v30 = v26;
    }
    else
    {
      os_log_type_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
      os_log_type_t v28 = v16;
      uint64_t v29 = 1;
      uint64_t v30 = v85;
    }
    v81 = v27;
    v27(v28, v29, 1, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, v85) != 1)
    {
      uint64_t v35 = (*(uint64_t (**)(char *, char *, uint64_t))(v17 + 32))(v21, v16, v85);
      goto LABEL_21;
    }
  }
  else
  {
    v81 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v81(v16, 1, 1, v85);
  }
  sub_24E32D33C((uint64_t)v16, (uint64_t *)&unk_26B1B59A0);
  swift_beginAccess();
  uint64_t v31 = *(void *)(v4 + 136);
  if (*(void *)(v31 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v32 = sub_24E32CD14(v84, a2);
    if (v33)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v14, *(void *)(v31 + 56) + *(void *)(v17 + 72) * v32, v85);
      uint64_t v34 = 0;
    }
    else
    {
      uint64_t v34 = 1;
    }
    uint64_t v36 = v85;
    v81(v14, v34, 1, v85);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v36) == 1) {
      goto LABEL_14;
    }
    uint64_t v35 = (*(uint64_t (**)(char *, char *, uint64_t))(v17 + 32))(v21, v14, v85);
LABEL_21:
    uint64_t v49 = v78;
    uint64_t v45 = v79;
    os_log_type_t v59 = (unsigned int *)MEMORY[0x263F8F580];
    goto LABEL_22;
  }
  v81(v14, 1, 1, v85);
LABEL_14:
  uint64_t v74 = v4 + 136;
  sub_24E32D33C((uint64_t)v14, (uint64_t *)&unk_26B1B59A0);
  if (qword_26B1B58E0 != -1) {
    swift_once();
  }
  uint64_t v75 = v11;
  uint64_t v37 = sub_24E35FD10();
  __swift_project_value_buffer(v37, (uint64_t)qword_26B1B58C0);
  swift_bridgeObjectRetain_n();
  unint64_t v38 = sub_24E35FCF0();
  os_log_type_t v39 = sub_24E360030();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    v88[0] = v41;
    *(_DWORD *)uint64_t v40 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v87 = sub_24E32C6BC(v84, a2, v88);
    sub_24E3600B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E31F000, v38, v39, "Creating base AsyncStream for DistributedNotification name: %s", v40, 0xCu);
    swift_arrayDestroy();
    uint64_t v42 = v41;
    uint64_t v43 = v82;
    MEMORY[0x25333A4C0](v42, -1, -1);
    MEMORY[0x25333A4C0](v40, -1, -1);

    uint64_t v45 = v79;
  }
  else
  {

    uint64_t v44 = swift_bridgeObjectRelease_n();
    uint64_t v45 = v79;
    uint64_t v43 = v21;
  }
  uint64_t v76 = v4;
  MEMORY[0x270FA5388](v44);
  uint64_t v46 = v83;
  uint64_t v47 = v84;
  *(&v74 - 4) = v4;
  *(&v74 - 3) = v47;
  *(&v74 - 2) = a2;
  uint64_t v49 = v78;
  (*(void (**)(char *, void, uint64_t))(v45 + 104))(v78, *v48, v46);
  uint64_t v50 = v77;
  sub_24E35FF50();
  uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  uint64_t v52 = v43;
  uint64_t v53 = v43;
  uint64_t v54 = a2;
  uint64_t v55 = v85;
  v51(v52, v50, v85);
  uint64_t v56 = (uint64_t)v75;
  v51(v75, v53, v55);
  v81((char *)v56, 0, 1, v55);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v57 = v56;
  uint64_t v4 = v76;
  sub_24E328778(v57, v84, v54);
  swift_endAccess();
  uint64_t v58 = v55;
  a2 = v54;
  os_log_type_t v59 = (unsigned int *)MEMORY[0x263F8F580];
  uint64_t v35 = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v50, v58);
LABEL_22:
  MEMORY[0x270FA5388](v35);
  uint64_t v60 = v84;
  *(&v74 - 4) = v4;
  *(&v74 - 3) = v60;
  *(&v74 - 2) = a2;
  (*(void (**)(char *, void))(v45 + 104))(v49, *v59);
  sub_24E35FF50();
  swift_beginAccess();
  uint64_t v61 = *(void *)(v4 + 152);
  if (*(void *)(v61 + 16))
  {
    uint64_t v62 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v63 = sub_24E32CD14(v84, a2);
    unint64_t v64 = 0x26B1B5000uLL;
    if (v65)
    {
      uint64_t v66 = *(void *)(*(void *)(v61 + 56) + 8 * v63);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v67 = *(void *)(v66 + 16);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v67 = 0;
    }
  }
  else
  {
    uint64_t v62 = v17;
    uint64_t v67 = 0;
    unint64_t v64 = 0x26B1B5000;
  }
  if (*(void *)(v64 + 2272) != -1) {
    swift_once();
  }
  uint64_t v68 = sub_24E35FD10();
  __swift_project_value_buffer(v68, (uint64_t)qword_26B1B58C0);
  swift_bridgeObjectRetain_n();
  uint64_t v69 = sub_24E35FCF0();
  os_log_type_t v70 = sub_24E360030();
  if (os_log_type_enabled(v69, v70))
  {
    uint64_t v71 = swift_slowAlloc();
    uint64_t v72 = swift_slowAlloc();
    uint64_t v87 = v72;
    *(_DWORD *)uint64_t v71 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_24E32C6BC(v84, a2, &v87);
    sub_24E3600B0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v71 + 12) = 2048;
    uint64_t v86 = v67;
    sub_24E3600B0();
    _os_log_impl(&dword_24E31F000, v69, v70, "Creating sub AsyncStream for DistributedNotification name: [%s], count: %ld", (uint8_t *)v71, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v72, -1, -1);
    MEMORY[0x25333A4C0](v71, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v82, v85);
}

uint64_t sub_24E32E688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5980);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5970);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24E3287B4((uint64_t)v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_24E32E7D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5970);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v28[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)(a2 + 152);
  swift_beginAccess();
  if (*(void *)(*(void *)(a2 + 152) + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_24E32CD14(a3, a4),
        char v14 = v13,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v14 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24E3275CC();
    uint64_t v17 = sub_24E33A9DC(v28, a3, a4);
    if (*v16)
    {
      uint64_t v18 = v16;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
      unint64_t v19 = *v18;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t *v18 = v19;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v19 = sub_24E33A10C(0, *(void *)(v19 + 16) + 1, 1, v19);
        unint64_t *v18 = v19;
      }
      unint64_t v22 = *(void *)(v19 + 16);
      unint64_t v21 = *(void *)(v19 + 24);
      if (v22 >= v21 >> 1)
      {
        unint64_t v19 = sub_24E33A10C(v21 > 1, v22 + 1, 1, v19);
        unint64_t *v18 = v19;
      }
      *(void *)(v19 + 16) = v22 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v22, v11, v8);
      ((void (*)(void *, void))v17)(v28, 0);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(unsigned char *, void))v15)(v29, 0);
    }
    else
    {
      ((void (*)(void *, void))v17)(v28, 0);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(unsigned char *, void))v15)(v29, 0);
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B59F8);
    unint64_t v24 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_24E3617D0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16))(v25 + v24, a1, v8);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    v28[0] = *v12;
    *uint64_t v12 = 0x8000000000000000;
    sub_24E3484B4(v25, a3, a4, v26);
    *uint64_t v12 = v28[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

uint64_t DistributedNotificationHandler.deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t DistributedNotificationHandler.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t DistributedNotificationHandler.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E32EBF0(uint64_t a1)
{
  v2[11] = a1;
  v2[12] = v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6330);
  v2[13] = v3;
  v2[14] = *(void *)(v3 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6370);
  v2[16] = v4;
  v2[17] = *(void *)(v4 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E32ED24, v1, 0);
}

uint64_t sub_24E32ED24()
{
  uint64_t v47 = v0;
  uint64_t v1 = *(void *)(v0[11] + 16);
  if (!v1)
  {
LABEL_20:
    uint64_t v36 = v0[12];
    uint64_t result = swift_beginAccess();
    if (*(void *)(*(void *)(v36 + 120) + 16) == v1)
    {
      uint64_t v37 = v0[12];
      uint64_t result = swift_beginAccess();
      if (*(void *)(*(void *)(v37 + 128) + 16) == v1)
      {
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        unint64_t v38 = (uint64_t (*)(void))v0[1];
        return v38();
      }
    }
    else
    {
LABEL_30:
      __break(1u);
    }
    __break(1u);
    return result;
  }
  uint64_t v43 = (uint64_t *)(v0[12] + 120);
  uint64_t v42 = (void (**)(uint64_t, void, uint64_t))(v0[14] + 104);
  unsigned int v41 = *MEMORY[0x263F8F580];
  uint64_t v40 = v0[17];
  uint64_t v2 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
  uint64_t v39 = v1;
  while (1)
  {
    uint64_t v5 = *(v2 - 1);
    unint64_t v6 = *v2;
    uint64_t v7 = qword_26B1B58E0;
    swift_bridgeObjectRetain();
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24E35FD10();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B1B58C0);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = sub_24E35FCF0();
    os_log_type_t v10 = sub_24E360030();
    uint64_t v44 = v2;
    uint64_t v45 = v1;
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v46 = (void *)v12;
      *(_DWORD *)uint64_t v11 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v11 + 4) = sub_24E32C6BC(v5, v6, (uint64_t *)&v46);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E31F000, v9, v10, "Creating base AsyncStream for registered Distributed notification name: %{public}s", (uint8_t *)v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v12, -1, -1);
      MEMORY[0x25333A4C0](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v14 = v0[18];
    uint64_t v13 = v0[19];
    uint64_t v16 = v0[15];
    uint64_t v15 = v0[16];
    uint64_t v17 = v0[12];
    uint64_t v18 = v0[13];
    unint64_t v19 = (void *)swift_task_alloc();
    v19[2] = v17;
    v19[3] = v5;
    v19[4] = v6;
    (*v42)(v16, v41, v18);
    sub_24E35FF50();
    swift_task_dealloc();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v14, v13, v15);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v46 = (void *)*v43;
    unint64_t v21 = v46;
    *uint64_t v43 = 0x8000000000000000;
    unint64_t v23 = sub_24E32CD14(v5, v6);
    uint64_t v24 = v21[2];
    BOOL v25 = (v22 & 1) == 0;
    uint64_t result = v24 + v25;
    if (__OFADD__(v24, v25))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    char v27 = v22;
    if (v21[3] < result) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_24E35BFE4();
      unint64_t v21 = v46;
    }
LABEL_16:
    uint64_t v30 = v0[18];
    uint64_t v31 = v0[16];
    if (v27)
    {
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v40 + 40))(v21[7] + *(void *)(v40 + 72) * v23, v30, v31);
    }
    else
    {
      v21[(v23 >> 6) + 8] |= 1 << v23;
      unint64_t v32 = (uint64_t *)(v21[6] + 16 * v23);
      uint64_t *v32 = v5;
      v32[1] = v6;
      uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v40 + 32))(v21[7] + *(void *)(v40 + 72) * v23, v30, v31);
      uint64_t v33 = v21[2];
      BOOL v34 = __OFADD__(v33, 1);
      uint64_t v35 = v33 + 1;
      if (v34) {
        goto LABEL_29;
      }
      v21[2] = v35;
      swift_bridgeObjectRetain();
    }
    uint64_t v3 = v0[19];
    uint64_t v4 = v0[16];
    *uint64_t v43 = (uint64_t)v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v3, v4);
    uint64_t v2 = v44 + 2;
    uint64_t v1 = v45 - 1;
    if (v45 == 1)
    {
      swift_bridgeObjectRelease();
      uint64_t v1 = v39;
      goto LABEL_20;
    }
  }
  sub_24E35A608(result, isUniquelyReferenced_nonNull_native);
  unint64_t v21 = v46;
  unint64_t v28 = sub_24E32CD14(v5, v6);
  if ((v27 & 1) == (v29 & 1))
  {
    unint64_t v23 = v28;
    goto LABEL_16;
  }
  return sub_24E360350();
}

uint64_t sub_24E32F250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5980);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5970);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24E3287B4((uint64_t)v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_24E32F39C()
{
  v1[20] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6360);
  v1[21] = v2;
  v1[22] = *(void *)(v2 - 8);
  v1[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5DD0);
  v1[24] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6380);
  v1[25] = v3;
  v1[26] = *(void *)(v3 - 8);
  v1[27] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E32F4F0, v0, 0);
}

uint64_t sub_24E32F4F0()
{
  if (MEMORY[0x253339500]())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    uint64_t v3 = *(void *)(v0[20] + 112);
    v0[28] = v3;
    return MEMORY[0x270FA2498](sub_24E32F5AC, v3, 0);
  }
}

uint64_t sub_24E32F5AC()
{
  uint64_t v1 = v0[28];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 120);
  if (*(void *)(v2 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v3 = sub_24E32CD14(0xD00000000000001CLL, 0x800000024E362190);
    uint64_t v4 = v0[25];
    uint64_t v5 = v0[26];
    uint64_t v6 = v0[24];
    if (v7)
    {
      (*(void (**)(void, unint64_t, void))(v5 + 16))(v0[24], *(void *)(v2 + 56) + *(void *)(v5 + 72) * v3, v0[25]);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v6, 0, 1, v4);
    }
    else
    {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v5 + 56))(v0[24], 1, 1, v4);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[26] + 56))(v0[24], 1, 1, v0[25]);
  }
  uint64_t v8 = v0[20];
  return MEMORY[0x270FA2498](sub_24E32F6EC, v8, 0);
}

uint64_t sub_24E32F6EC()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[24];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24E32D33C(v3, &qword_26B1B5DD0);
    sub_24E360140();
    swift_bridgeObjectRelease();
    return sub_24E360210();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[27], v3, v1);
    sub_24E35FF30();
    uint64_t v6 = sub_24E3316F0(&qword_26B1B5C68, v5, (void (*)(uint64_t))type metadata accessor for DistributedNotificationHandler);
    v0[29] = v6;
    uint64_t v7 = v0[20];
    uint64_t v8 = (void *)swift_task_alloc();
    v0[30] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_24E32F8E4;
    uint64_t v9 = v0[21];
    return MEMORY[0x270FA1F68](v0 + 15, v7, v6, v9);
  }
}

uint64_t sub_24E32F8E4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E32F9F4, v1, 0);
}

uint64_t sub_24E32F9F4()
{
  uint64_t v46 = v0;
  uint64_t v1 = *(void *)(v0 + 120);
  if (!v1)
  {
    uint64_t v9 = *(void *)(v0 + 208);
    uint64_t v8 = *(void *)(v0 + 216);
    uint64_t v10 = *(void *)(v0 + 200);
    (*(void (**)(void, void))(*(void *)(v0 + 176) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 168));
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    goto LABEL_23;
  }
  uint64_t v2 = (_OWORD *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 128);
  if (qword_26B1B5530 == -1)
  {
    if (*(void *)(v1 + 16))
    {
LABEL_4:
      uint64_t v4 = qword_26B1B6830;
      uint64_t v5 = qword_26B1B6828;
      swift_bridgeObjectRetain();
      unint64_t v6 = sub_24E32CD14(v5, v4);
      if (v7)
      {
        sub_24E32D398(*(void *)(v1 + 56) + 32 * v6, v0 + 16);
      }
      else
      {
        *uint64_t v2 = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
      }
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  else
  {
    swift_once();
    if (*(void *)(v1 + 16)) {
      goto LABEL_4;
    }
  }
  *uint64_t v2 = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
LABEL_11:
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A10);
    if (swift_dynamicCast())
    {
      uint64_t v11 = *(void *)(v0 + 136);
      uint64_t v12 = *(void *)(v0 + 144);
      uint64_t v13 = qword_26B1B58E0;
      swift_retain();
      if (v13 != -1) {
        swift_once();
      }
      uint64_t v14 = sub_24E35FD10();
      __swift_project_value_buffer(v14, (uint64_t)qword_26B1B58C0);
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      uint64_t v15 = sub_24E35FCF0();
      os_log_type_t v16 = sub_24E360030();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        uint64_t v45 = v18;
        *(_DWORD *)uint64_t v17 = 136446210;
        *(void *)(v0 + 48) = v11;
        *(void *)(v0 + 56) = v12;
        *(void *)(v0 + 64) = v3;
        uint64_t v19 = DistributedNotification.description.getter();
        *(void *)(v17 + 4) = sub_24E32C6BC(v19, v20, &v45);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_release_n();
        _os_log_impl(&dword_24E31F000, v15, v16, "XPCEventStream notification: %{public}s", (uint8_t *)v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25333A4C0](v18, -1, -1);
        MEMORY[0x25333A4C0](v17, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_release_n();
      }

      *(void *)(v0 + 96) = v11;
      *(void *)(v0 + 104) = v12;
      *(void *)(v0 + 112) = v3;
      sub_24E32FFE4((uint64_t *)(v0 + 96), v3);
      swift_release_n();
      swift_bridgeObjectRelease();
      uint64_t v37 = *(void *)(v0 + 232);
      uint64_t v38 = *(void *)(v0 + 160);
      uint64_t v39 = (void *)swift_task_alloc();
      *(void *)(v0 + 240) = v39;
      *uint64_t v39 = v0;
      v39[1] = sub_24E32F8E4;
      uint64_t v40 = *(void *)(v0 + 168);
      return MEMORY[0x270FA1F68](v0 + 120, v38, v37, v40);
    }
  }
  else
  {
    sub_24E32D33C(v0 + 16, &qword_2698D8AD0);
  }
  if (qword_26B1B58E0 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_24E35FD10();
  __swift_project_value_buffer(v21, (uint64_t)qword_26B1B58C0);
  char v22 = sub_24E35FCF0();
  os_log_type_t v23 = sub_24E360010();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v26 = *(void *)(v0 + 208);
  uint64_t v25 = *(void *)(v0 + 216);
  uint64_t v27 = *(void *)(v0 + 200);
  uint64_t v28 = *(void *)(v0 + 176);
  uint64_t v29 = *(void *)(v0 + 184);
  uint64_t v30 = *(void *)(v0 + 168);
  if (v24)
  {
    uint64_t v43 = *(void *)(v0 + 184);
    uint64_t v44 = *(void *)(v0 + 216);
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    uint64_t v42 = v27;
    uint64_t v32 = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v45 = v32;
    uint64_t v41 = v30;
    uint64_t v33 = qword_26B1B6828;
    unint64_t v34 = qword_26B1B6830;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 152) = sub_24E32C6BC(v33, v34, &v45);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E31F000, v22, v23, "Event missing \"%s\" key!", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v32, -1, -1);
    MEMORY[0x25333A4C0](v31, -1, -1);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v43, v41);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v44, v42);
  }
  else
  {

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
  }
LABEL_23:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t DistributedNotification.init(name:transaction:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void sub_24E32FFE4(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v10 = a1[2];
  swift_beginAccess();
  uint64_t v11 = *(void *)(v2 + 152);
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_24E32CD14(v9, v8);
    if (v13)
    {
      uint64_t v14 = *(void *)(*(void *)(v11 + 56) + 8 * v12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v15 = sub_24E35FF00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 1, 1, v15);
      os_log_type_t v16 = (void *)swift_allocObject();
      void v16[2] = 0;
      v16[3] = 0;
      v16[4] = a2;
      v16[5] = v14;
      v16[6] = v9;
      v16[7] = v8;
      v16[8] = v10;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_24E33ABB0((uint64_t)v7, (uint64_t)&unk_2698D8AE0, (uint64_t)v16);
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_26B1B58E0 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_24E35FD10();
  __swift_project_value_buffer(v17, (uint64_t)qword_26B1B58C0);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  uint64_t v18 = sub_24E35FCF0();
  os_log_type_t v19 = sub_24E360020();
  if (os_log_type_enabled(v18, v19))
  {
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)unint64_t v20 = 136446210;
    uint64_t v27 = v10;
    uint64_t v28 = v21;
    uint64_t v25 = v9;
    uint64_t v26 = v8;
    uint64_t v22 = DistributedNotification.description.getter();
    uint64_t v25 = sub_24E32C6BC(v22, v23, &v28);
    sub_24E3600B0();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E31F000, v18, v19, "Received notification %{public}s with no subscribers!", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v21, -1, -1);
    MEMORY[0x25333A4C0](v20, -1, -1);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_24E330328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[18] = a7;
  v8[19] = a8;
  v8[16] = a5;
  v8[17] = a6;
  v8[15] = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5958);
  v8[20] = v9;
  v8[21] = *(void *)(v9 - 8);
  v8[22] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5970);
  v8[23] = v10;
  v8[24] = *(void *)(v10 - 8);
  v8[25] = swift_task_alloc();
  if (qword_26B1B63C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = qword_26B1B63B8;
  return MEMORY[0x270FA2498](sub_24E3304A0, v11, 0);
}

uint64_t sub_24E3304A0(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = qword_26B1B63E8;
  *(void *)(v3 + 208) = qword_26B1B63E8;
  if (v4)
  {
    swift_retain();
    a1 = sub_24E330520;
    a2 = v4;
    a3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_24E330520()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 208) + 128);
  *(void *)(v0 + 216) = v1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_24E330598, v1, 0);
}

uint64_t sub_24E330598()
{
  uint64_t v1 = v0[27];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  v0[28] = v2;
  uint64_t v3 = *(void *)(v2 + 16);
  v0[29] = v3;
  if (!v3)
  {
LABEL_10:
    swift_release();
    swift_release();
    return MEMORY[0x270FA2498](sub_24E33085C, 0, 0);
  }
  swift_bridgeObjectRetain();
  swift_beginAccess();
  for (uint64_t i = 0; ; uint64_t i = v0[30] + 1)
  {
    v0[30] = i;
    uint64_t v5 = v0[27];
    uint64_t v6 = v0[28] + 16 * i;
    v0[31] = *(void *)(v6 + 32);
    uint64_t v7 = *(void *)(v6 + 40);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
    swift_unknownObjectRetain();
    uint64_t v10 = v9(ObjectType, v7);
    uint64_t v12 = v11;
    v0[32] = v11;
    if (!*(void *)(*(void *)(v5 + 128) + 16)) {
      goto LABEL_6;
    }
    uint64_t v13 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E32CD14(v13, v12);
    if (v14) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v15 = v0[30];
    uint64_t v16 = v0[29];
    swift_unknownObjectRelease();
    if (v15 + 1 == v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  uint64_t v17 = v0[27];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E3316F0((unint64_t *)&qword_26B1B67F0, 255, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
  uint64_t v18 = (void *)swift_task_alloc();
  v0[33] = v18;
  v18[2] = v17;
  v18[3] = v13;
  v18[4] = v12;
  os_log_type_t v19 = (void *)swift_task_alloc();
  v0[34] = v19;
  *os_log_type_t v19 = v0;
  v19[1] = sub_24E330A44;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_24E33085C()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  sub_24E35FB20();
  sub_24E35FB00();
  v0[14] = v2;
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A20);
  swift_task_localValuePush();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v0[24];
    uint64_t v18 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
    unint64_t v5 = v0[16] + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v16 = (void (**)(uint64_t, uint64_t))(v0[21] + 8);
    uint64_t v17 = *(void *)(v4 + 72);
    uint64_t v15 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v6 = v0[25];
      uint64_t v8 = v0[22];
      uint64_t v7 = v0[23];
      uint64_t v10 = v0[19];
      uint64_t v9 = v0[20];
      uint64_t v11 = v0[17];
      uint64_t v12 = v0[18];
      v18(v6, v5, v7);
      v0[11] = v11;
      v0[12] = v12;
      v0[13] = v10;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_24E35FF20();
      (*v16)(v8, v9);
      (*v15)(v6, v7);
      v5 += v17;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_localValuePop();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_24E330A44()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 280) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 216);
    uint64_t v4 = sub_24E330DE0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 216);
    swift_task_dealloc();
    uint64_t v4 = sub_24E330B6C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E330B6C()
{
  while (1)
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = v0[30];
    uint64_t v2 = v0[29];
    swift_unknownObjectRelease();
    if (v1 + 1 == v2) {
      break;
    }
    uint64_t v3 = v0[30] + 1;
    v0[30] = v3;
    uint64_t v4 = v0[27];
    uint64_t v5 = v0[28] + 16 * v3;
    v0[31] = *(void *)(v5 + 32);
    uint64_t v6 = *(void *)(v5 + 40);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
    swift_unknownObjectRetain();
    uint64_t v9 = v8(ObjectType, v6);
    uint64_t v11 = v10;
    v0[32] = v10;
    if (*(void *)(*(void *)(v4 + 128) + 16))
    {
      uint64_t v12 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E32CD14(v12, v11);
      if (v13)
      {
        uint64_t v14 = v0[27];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24E3316F0((unint64_t *)&qword_26B1B67F0, 255, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
        uint64_t v15 = (void *)swift_task_alloc();
        v0[33] = v15;
        v15[2] = v14;
        v15[3] = v12;
        v15[4] = v11;
        uint64_t v16 = (void *)swift_task_alloc();
        v0[34] = v16;
        *uint64_t v16 = v0;
        v16[1] = sub_24E330A44;
        return MEMORY[0x270FA2360]();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](sub_24E33085C, 0, 0);
}

uint64_t sub_24E330DE0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 208);
  return MEMORY[0x270FA2498](sub_24E330E70, v1, 0);
}

uint64_t sub_24E330E70()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24E330ED8, 0, 0);
}

uint64_t sub_24E330ED8()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E330F50()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B5918);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5918);
  return sub_24E35FD00();
}

uint64_t sub_24E330FD4()
{
  uint64_t v8 = MEMORY[0x263F8EE78];
  uint64_t v0 = xpc_copy_event();
  if (!v0)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    return v6;
  }
  uint64_t v1 = (void *)v0;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v8;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_24E32D2BC;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_24E32D2D4;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24E346638;
  aBlock[3] = &block_descriptor_0;
  uint64_t v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(v1, v4);
  swift_unknownObjectRelease();
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v1 & 1) == 0)
  {
    uint64_t v6 = v8;
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t DistributedNotification.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DistributedNotification.transaction.getter()
{
  return swift_retain();
}

uint64_t DistributedNotification.description.getter()
{
  return 91;
}

uint64_t sub_24E3312F8(uint64_t a1)
{
  return sub_24E32E688(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24E331304(uint64_t a1)
{
  return sub_24E32E7D4(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_24E331310()
{
  unint64_t result = qword_26B1B5538[0];
  if (!qword_26B1B5538[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26B1B5538);
  }
  return result;
}

uint64_t type metadata accessor for DistributedNotificationHandler()
{
  return self;
}

uint64_t method lookup function for DistributedNotificationHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DistributedNotificationHandler);
}

uint64_t dispatch thunk of DistributedNotificationHandler.__allocating_init(eventStreamHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of DistributedNotificationHandler.asyncStream(name:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t destroy for DistributedNotification()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s19FindMyDaemonSupport23DistributedNotificationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for DistributedNotification(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for DistributedNotification(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DistributedNotification(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DistributedNotification(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DistributedNotification()
{
  return &type metadata for DistributedNotification;
}

uint64_t sub_24E3315BC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24E331614(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_24E322A50;
  return sub_24E330328(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24E3316F0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_24E331738(uint64_t a1)
{
  return sub_24E32F250(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24E331744()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E331754()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
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

uint64_t sub_24E33177C(uint64_t a1)
{
  return sub_24E334EBC(a1, qword_26B1B6898);
}

uint64_t sub_24E331788()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 232);
}

uint64_t sub_24E3317BC(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 232) = a1;
  return result;
}

uint64_t (*sub_24E3317FC())()
{
  return j__swift_endAccess;
}

uint64_t APNSManager.__allocating_init(environmentName:delegatePort:)()
{
  swift_allocObject();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E339474;
  return APNSManager.init(environmentName:delegatePort:)();
}

uint64_t APNSManager.init(environmentName:delegatePort:)()
{
  uint64_t v2 = v0;
  *(void *)(v1 + 32) = v0;
  uint64_t v3 = sub_24E35FD40();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v1 + 40) = v5;
  swift_defaultActor_initialize();
  *(_OWORD *)(v0 + 200) = 0u;
  *(_OWORD *)(v0 + 184) = 0u;
  *(_OWORD *)(v0 + 168) = 0u;
  *(_OWORD *)(v0 + 152) = 0u;
  *(_OWORD *)(v0 + 136) = 0u;
  *(_OWORD *)(v0 + 120) = 0u;
  uint64_t v6 = MEMORY[0x263F8EE80];
  *(void *)(v0 + 216) = 0;
  *(void *)(v0 + 224) = v6;
  *(unsigned char *)(v0 + 232) = 0;
  sub_24E3375B4(0, qword_26B1B5E28);
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v5, *MEMORY[0x263F8F080], v3);
  uint64_t v7 = (void *)sub_24E360040();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
  id v8 = objc_allocWithZone(MEMORY[0x263F280F0]);
  uint64_t v9 = (void *)sub_24E35FDB0();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_24E35FDB0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_initWithEnvironmentName_namedDelegatePort_queue_, v9, v10, v7);

  if (v11)
  {
    *(void *)(v2 + 112) = v11;
    uint64_t v12 = sub_24E331B30;
    uint64_t v13 = v2;
    uint64_t v14 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](v12, v13, v14);
}

uint64_t sub_24E331B30()
{
  id receiver = v0[2].receiver;
  uint64_t v2 = (objc_class *)type metadata accessor for APNSManager.PushDelegateTrampoline();
  id v3 = objc_allocWithZone(v2);
  swift_weakInit();
  swift_weakAssign();
  v0[1].id receiver = v3;
  v0[1].super_class = v2;
  id v4 = objc_msgSendSuper2(v0 + 1, sel_init);
  uint64_t v5 = (void *)*((void *)receiver + 15);
  *((void *)receiver + 15) = v4;

  objc_msgSend(*((id *)receiver + 14), sel_setDelegate_, *((void *)receiver + 15));
  swift_task_dealloc();
  super_class = (uint64_t (*)(id))v0->super_class;
  id v7 = v0[2].receiver;
  return super_class(v7);
}

uint64_t type metadata accessor for APNSManager.PushDelegateTrampoline()
{
  return self;
}

uint64_t sub_24E331C28()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24E331C48, v0, 0);
}

id sub_24E331C48()
{
  id result = objc_msgSend(*(id *)(*(void *)(v0 + 16) + 112), sel_enabledTopics);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_24E35FEA0();

    id v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return (id)v4(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_24E331CE0()
{
  uint64_t v1 = v0;
  if (qword_26B1B5DF0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24E35FD10();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1B6898);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_24E35FCF0();
  os_log_type_t v4 = sub_24E360030();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = MEMORY[0x2533398E0](v7, MEMORY[0x263F8D310]);
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    sub_24E32C6BC(v8, v10, &v13);
    sub_24E3600B0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E31F000, v3, v4, "enabledTopics: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v6, -1, -1);
    MEMORY[0x25333A4C0](v5, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v11 = *(void **)(v1 + 112);
  uint64_t v12 = (void *)sub_24E35FE90();
  objc_msgSend(v11, sel__setEnabledTopics_, v12);
}

uint64_t sub_24E331EE4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5DE0);
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F580], v0);
  sub_24E35FF50();
  return swift_release();
}

uint64_t sub_24E332014(uint64_t a1)
{
  uint64_t v36 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  uint64_t v38 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v37 = v2;
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24E35FCE0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v29 - v12;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v15 = result;
    uint64_t v41 = v13;
    sub_24E35FCD0();
    uint64_t v40 = v6;
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v33(v11, v13, v7);
    uint64_t v16 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v34 = v8;
    uint64_t v30 = v7;
    uint64_t v39 = v1;
    uint64_t v32 = v16 | 7;
    uint64_t v17 = swift_allocObject();
    uint64_t v18 = v38;
    uint64_t v31 = v3;
    *(void *)(v17 + 16) = v15;
    uint64_t v19 = v8;
    unint64_t v20 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v35 = *(void (**)(uint64_t, char *, uint64_t))(v19 + 32);
    v35(v17 + ((v16 + 24) & ~v16), v11, v7);
    swift_retain();
    uint64_t v21 = v39;
    uint64_t v22 = v36;
    sub_24E35FF10();
    uint64_t v23 = sub_24E35FF00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v40, 1, 1, v23);
    uint64_t v24 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v31, v22, v21);
    uint64_t v25 = v30;
    v33(v20, v41, v30);
    unint64_t v26 = (*(unsigned __int8 *)(v18 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    unint64_t v27 = (v37 + v16 + v26) & ~v16;
    uint64_t v28 = (char *)swift_allocObject();
    *((void *)v28 + 2) = 0;
    *((void *)v28 + 3) = 0;
    *((void *)v28 + 4) = v15;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v28[v26], v24, v39);
    v35((uint64_t)&v28[v27], v20, v25);
    swift_retain();
    sub_24E346460((uint64_t)v40, (uint64_t)&unk_2698D8CB0, (uint64_t)v28);
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v41, v25);
  }
  return result;
}

uint64_t sub_24E332404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24E35FCE0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24E35FF00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v5);
  unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = (char *)swift_allocObject();
  *((void *)v13 + 2) = 0;
  *((void *)v13 + 3) = 0;
  *((void *)v13 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v13[v12], (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  swift_retain();
  sub_24E346460((uint64_t)v10, (uint64_t)&unk_2698D8CC0, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_24E3325D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return MEMORY[0x270FA2498](sub_24E3325F8, a4, 0);
}

uint64_t sub_24E3325F8()
{
  sub_24E332658(*(void *)(v0 + 24));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E332658(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67B0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24E35FCE0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v30 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - v10;
  if (qword_26B1B5DF0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_24E35FD10();
  __swift_project_value_buffer(v12, (uint64_t)qword_26B1B6898);
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v29(v11, a1, v6);
  uint64_t v13 = sub_24E35FCF0();
  os_log_type_t v14 = sub_24E35FFF0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    unint64_t v27 = v5;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = v1;
    uint64_t v18 = v17;
    v32[0] = v17;
    uint64_t v26 = a1;
    *(_DWORD *)uint64_t v16 = 136446210;
    uint64_t v25 = v16 + 4;
    sub_24E33877C();
    uint64_t v19 = sub_24E3602F0();
    uint64_t v31 = sub_24E32C6BC(v19, v20, v32);
    a1 = v26;
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
    _os_log_impl(&dword_24E31F000, v13, v14, "Removing connectionStateContinuation for %{public}s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v18, -1, -1);
    uint64_t v21 = v16;
    uint64_t v5 = v27;
    MEMORY[0x25333A4C0](v21, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }

  uint64_t v22 = (uint64_t)v30;
  v29(v30, a1, v6);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v5, 1, 1, v23);
  swift_beginAccess();
  sub_24E3287F0((uint64_t)v5, v22);
  return swift_endAccess();
}

uint64_t sub_24E3329CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_24E3329F0, a4, 0);
}

uint64_t sub_24E3329F0()
{
  sub_24E332A54(v0[3], v0[4]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_24E332A54(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67B0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_24E35FCE0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v34 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v28 - v12;
  if (qword_26B1B5DF0 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_24E35FD10();
  __swift_project_value_buffer(v14, (uint64_t)qword_26B1B6898);
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v33 = a2;
  v32(v13, a2, v8);
  uint64_t v15 = sub_24E35FCF0();
  os_log_type_t v16 = sub_24E35FFF0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v30 = v7;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v31 = v2;
    uint64_t v20 = v19;
    v36[0] = v19;
    uint64_t v29 = a1;
    *(_DWORD *)uint64_t v18 = 136446210;
    v28[1] = v18 + 4;
    sub_24E33877C();
    uint64_t v21 = sub_24E3602F0();
    uint64_t v35 = sub_24E32C6BC(v21, v22, v36);
    a1 = v29;
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    _os_log_impl(&dword_24E31F000, v15, v16, "Storing connectionStateContinuation for %{public}s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v20, -1, -1);
    uint64_t v23 = v18;
    uint64_t v7 = v30;
    MEMORY[0x25333A4C0](v23, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }

  uint64_t v24 = (uint64_t)v34;
  v32(v34, v33, v8);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  uint64_t v26 = *(void *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v7, a1, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v7, 0, 1, v25);
  swift_beginAccess();
  sub_24E3287F0((uint64_t)v7, v24);
  return swift_endAccess();
}

uint64_t sub_24E332E04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 128);
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  swift_retain();

  return sub_24E336CDC(v3);
}

uint64_t sub_24E332E50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 144);
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;
  swift_retain();

  return sub_24E336CDC(v3);
}

uint64_t sub_24E332E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 160);
  *(void *)(v2 + 160) = a1;
  *(void *)(v2 + 168) = a2;
  swift_retain();

  return sub_24E336CDC(v3);
}

uint64_t sub_24E332EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 176);
  *(void *)(v2 + 176) = a1;
  *(void *)(v2 + 184) = a2;
  swift_retain();

  return sub_24E336CDC(v3);
}

uint64_t sub_24E332F34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 192);
  *(void *)(v2 + 192) = a1;
  *(void *)(v2 + 200) = a2;
  swift_retain();

  return sub_24E336CDC(v3);
}

uint64_t sub_24E332F80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 208);
  *(void *)(v2 + 208) = a1;
  *(void *)(v2 + 216) = a2;
  swift_retain();

  return sub_24E336CDC(v3);
}

void sub_24E332FCC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
  id v8 = objc_allocWithZone(MEMORY[0x263F280E0]);
  uint64_t v9 = (void *)sub_24E35FDB0();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_24E35FDB0();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v8, sel_initWithTopic_identifier_, v9, v10);

  objc_msgSend(*(id *)(v2 + 112), sel_requestTokenForInfo_, v11);
}

void sub_24E333108()
{
  uint64_t v1 = *(void **)(v0 + 112);
  uint64_t v2 = (void *)sub_24E35FDB0();
  id v3 = (id)sub_24E35FDB0();
  objc_msgSend(v1, sel_requestTokenForTopic_identifier_, v2, v3);
}

uint64_t APNSManager.deinit()
{
  sub_24E336CDC(*(void *)(v0 + 128));
  sub_24E336CDC(*(void *)(v0 + 144));
  sub_24E336CDC(*(void *)(v0 + 160));
  sub_24E336CDC(*(void *)(v0 + 176));
  sub_24E336CDC(*(void *)(v0 + 192));
  sub_24E336CDC(*(void *)(v0 + 208));
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t APNSManager.__deallocating_deinit()
{
  APNSManager.deinit();

  return MEMORY[0x270FA2418](v0);
}

uint64_t APNSManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E333228(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24E333248, v1, 0);
}

uint64_t sub_24E333248()
{
  sub_24E331CE0();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E3332A8(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24E3332CC, v2, 0);
}

uint64_t sub_24E3332CC()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = *(void *)(v2 + 192);
  *(void *)(v2 + 192) = v0[2];
  *(void *)(v2 + 200) = v1;
  swift_retain();
  sub_24E336CDC(v3);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24E333344(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24E333368, v2, 0);
}

uint64_t sub_24E333368()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = *(void *)(v2 + 144);
  *(void *)(v2 + 144) = v0[2];
  *(void *)(v2 + 152) = v1;
  swift_retain();
  sub_24E336CDC(v3);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24E3333E0(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24E333404, v2, 0);
}

uint64_t sub_24E333404()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = *(void *)(v2 + 160);
  *(void *)(v2 + 160) = v0[2];
  *(void *)(v2 + 168) = v1;
  swift_retain();
  sub_24E336CDC(v3);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24E33347C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_24E3334A0, v2, 0);
}

uint64_t sub_24E3334A0()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = *(void *)(v2 + 176);
  *(void *)(v2 + 176) = v0[2];
  *(void *)(v2 + 184) = v1;
  swift_retain();
  sub_24E336CDC(v3);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24E333518(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_24E333538, v1, 0);
}

uint64_t sub_24E333538()
{
  sub_24E332FCC(*(void **)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E333598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24E3335C0, v4, 0);
}

uint64_t sub_24E3335C0()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 48) + 112);
  uint64_t v2 = (void *)sub_24E35FDB0();
  uint64_t v3 = (void *)sub_24E35FDB0();
  objc_msgSend(v1, sel_requestTokenForTopic_identifier_, v2, v3);

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24E333668()
{
  v1[8] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5E18);
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E33379C, v0, 0);
}

uint64_t sub_24E33379C()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  swift_beginAccess();
  *(unsigned char *)(v3 + 232) = 1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 224);
  uint64_t v25 = v4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(v4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(v4 + 64);
  id v8 = (void (**)(uint64_t, uint64_t))(v2 + 8);
  int64_t v26 = (unint64_t)(63 - v6) >> 6;
  uint64_t v27 = v4;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
LABEL_31:
      __break(1u);
      return result;
    }
    if (v18 >= v26) {
      goto LABEL_23;
    }
    unint64_t v19 = *(void *)(v25 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v19 = *(void *)(v25 + 8 * v10);
      if (!v19)
      {
        int64_t v10 = v18 + 2;
        if (v18 + 2 >= v26) {
          goto LABEL_23;
        }
        unint64_t v19 = *(void *)(v25 + 8 * v10);
        if (!v19)
        {
          int64_t v10 = v18 + 3;
          if (v18 + 3 >= v26) {
            goto LABEL_23;
          }
          unint64_t v19 = *(void *)(v25 + 8 * v10);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v19 - 1) & v19;
    unint64_t v12 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_5:
    uint64_t v14 = *(void *)(v0 + 112);
    uint64_t v13 = *(void *)(v0 + 120);
    uint64_t v16 = *(void *)(v0 + 88);
    uint64_t v15 = *(void *)(v0 + 96);
    uint64_t v17 = *(void *)(v0 + 72);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v1 + 16))(v13, *(void *)(v27 + 56) + *(void *)(v1 + 72) * v12, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v14, v13, v15);
    *(unsigned char *)(v0 + 152) = 1;
    sub_24E35FF20();
    (*v8)(v16, v17);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v14, v15);
  }
  int64_t v20 = v18 + 4;
  if (v20 < v26)
  {
    unint64_t v19 = *(void *)(v25 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        int64_t v10 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          goto LABEL_31;
        }
        if (v10 >= v26) {
          goto LABEL_23;
        }
        unint64_t v19 = *(void *)(v25 + 8 * v10);
        ++v20;
        if (v19) {
          goto LABEL_22;
        }
      }
    }
    int64_t v10 = v20;
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v21 = *(void *)(v0 + 64);
  swift_release();
  unint64_t v22 = *(int **)(v21 + 128);
  *(void *)(v0 + 128) = v22;
  if (v22)
  {
    *(void *)(v0 + 136) = *(void *)(*(void *)(v0 + 64) + 136);
    uint64_t v28 = (uint64_t (*)(void))((char *)v22 + *v22);
    swift_retain();
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v23;
    void *v23 = v0;
    v23[1] = sub_24E333B58;
    return v28();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
}

uint64_t sub_24E333B58()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 64);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E333C68, v1, 0);
}

uint64_t sub_24E333C68()
{
  sub_24E336CDC(*(void *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E333CE4(char a1)
{
  *(void *)(v2 + 64) = v1;
  *(unsigned char *)(v2 + 153) = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5E18);
  *(void *)(v2 + 72) = v3;
  *(void *)(v2 + 80) = *(void *)(v3 - 8);
  *(void *)(v2 + 88) = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  *(void *)(v2 + 96) = v4;
  *(void *)(v2 + 104) = *(void *)(v4 - 8);
  *(void *)(v2 + 112) = swift_task_alloc();
  *(void *)(v2 + 120) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E333E1C, v1, 0);
}

uint64_t sub_24E333E1C()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  char v4 = *(unsigned char *)(v0 + 153);
  swift_beginAccess();
  char v29 = v4;
  *(unsigned char *)(v3 + 232) = v4;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 224);
  uint64_t v27 = v5 + 64;
  uint64_t v6 = -1;
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  if (-v7 < 64) {
    uint64_t v6 = ~(-1 << -(char)v7);
  }
  unint64_t v8 = v6 & *(void *)(v5 + 64);
  uint64_t v9 = (void (**)(uint64_t, uint64_t))(v2 + 8);
  int64_t v28 = (unint64_t)(63 - v7) >> 6;
  uint64_t v30 = v5;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_5;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
LABEL_31:
      __break(1u);
      return result;
    }
    if (v19 >= v28) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v27 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v28) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v27 + 8 * v11);
      if (!v20)
      {
        int64_t v11 = v19 + 2;
        if (v19 + 2 >= v28) {
          goto LABEL_23;
        }
        unint64_t v20 = *(void *)(v27 + 8 * v11);
        if (!v20)
        {
          int64_t v11 = v19 + 3;
          if (v19 + 3 >= v28) {
            goto LABEL_23;
          }
          unint64_t v20 = *(void *)(v27 + 8 * v11);
          if (!v20) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v13 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_5:
    uint64_t v15 = *(void *)(v0 + 112);
    uint64_t v14 = *(void *)(v0 + 120);
    uint64_t v17 = *(void *)(v0 + 88);
    uint64_t v16 = *(void *)(v0 + 96);
    uint64_t v18 = *(void *)(v0 + 72);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v1 + 16))(v14, *(void *)(v30 + 56) + *(void *)(v1 + 72) * v13, v16);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v15, v14, v16);
    *(unsigned char *)(v0 + 152) = v29;
    sub_24E35FF20();
    (*v9)(v17, v18);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v15, v16);
  }
  int64_t v21 = v19 + 4;
  if (v21 < v28)
  {
    unint64_t v20 = *(void *)(v27 + 8 * v21);
    if (!v20)
    {
      while (1)
      {
        int64_t v11 = v21 + 1;
        if (__OFADD__(v21, 1)) {
          goto LABEL_31;
        }
        if (v11 >= v28) {
          goto LABEL_23;
        }
        unint64_t v20 = *(void *)(v27 + 8 * v11);
        ++v21;
        if (v20) {
          goto LABEL_22;
        }
      }
    }
    int64_t v11 = v21;
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v22 = *(void *)(v0 + 64);
  swift_release();
  uint64_t v23 = *(int **)(v22 + 208);
  *(void *)(v0 + 128) = v23;
  if (v23)
  {
    *(void *)(v0 + 136) = *(void *)(*(void *)(v0 + 64) + 216);
    uint64_t v31 = (uint64_t (*)(uint64_t))((char *)v23 + *v23);
    swift_retain();
    uint64_t v24 = (void *)swift_task_alloc();
    *(void *)(v0 + 144) = v24;
    *uint64_t v24 = v0;
    v24[1] = sub_24E333B58;
    uint64_t v25 = *(unsigned __int8 *)(v0 + 153);
    return v31(v25);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    int64_t v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
}

uint64_t sub_24E3341E4(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return MEMORY[0x270FA2498](sub_24E334204, v1, 0);
}

uint64_t sub_24E334204()
{
  uint64_t v18 = v0;
  uint64_t v1 = *(void **)(v0[6] + 16);
  v0[8] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    APNSManager.IncomingMessage.init(apsIncomingMessage:)(v2, &v15);
    uint64_t v6 = v0[7];
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    v0[9] = v16;
    v0[10] = v9;
    int64_t v10 = *(int **)(v6 + 192);
    v0[11] = v10;
    if (v10)
    {
      v0[12] = *(void *)(v6 + 200);
      v0[2] = v7;
      v0[3] = v8;
      v0[4] = v9;
      os_log_t log = (os_log_t)((char *)v10 + *v10);
      swift_retain();
      int64_t v11 = (void *)swift_task_alloc();
      v0[13] = v11;
      *int64_t v11 = v0;
      v11[1] = sub_24E3345D0;
      return ((uint64_t (*)(void *))log)(v0 + 2);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26B1B5DF0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_24E35FD10();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1B6898);
    uint64_t v2 = sub_24E35FCF0();
    os_log_type_t v4 = sub_24E360010();
    if (os_log_type_enabled(v2, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_24E31F000, v2, v4, "Expected UnsafeSendableBox<APSIncomingMessage> to have contents!", v5, 2u);
      MEMORY[0x25333A4C0](v5, -1, -1);
    }
  }

  unint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_24E3345D0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24E334720, v1, 0);
}

uint64_t sub_24E334720()
{
  uint64_t v1 = *(void *)(v0 + 88);

  sub_24E336CDC(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void APNSManager.IncomingMessage.init(apsIncomingMessage:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4 = objc_msgSend(a1, sel_topic);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_24E35FDC0();
    uint64_t v8 = v7;

    swift_bridgeObjectRetain();
    id v9 = objc_msgSend(a1, sel_userInfo);
    if (v9)
    {
      int64_t v10 = v9;
      uint64_t v11 = sub_24E35FD60();

      unint64_t v12 = sub_24E33496C(v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12)
      {

        *a2 = v6;
        a2[1] = v8;
        a2[2] = v12;
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_24E336CEC();
    swift_allocError();
    swift_willThrow();

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t static APNSManager.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t APNSManager.Error.hash(into:)()
{
  return sub_24E3603D0();
}

uint64_t APNSManager.Error.hashValue.getter()
{
  return sub_24E3603E0();
}

uint64_t APNSManager.IncomingMessage.topic.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t APNSManager.IncomingMessage.userInfo.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_24E33496C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B59F0);
    uint64_t v2 = (void *)sub_24E360240();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v25 = a1 + 64;
  uint64_t v3 = -1;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v3 = ~(-1 << -(char)v4);
  }
  unint64_t v5 = v3 & *(void *)(a1 + 64);
  int64_t v24 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v7 << 6);
      int64_t v12 = v7;
    }
    else
    {
      int64_t v13 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_40;
      }
      if (v13 >= v24)
      {
LABEL_36:
        sub_24E338370();
        return (unint64_t)v2;
      }
      unint64_t v14 = *(void *)(v25 + 8 * v13);
      int64_t v12 = v7 + 1;
      if (!v14)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v24) {
          goto LABEL_36;
        }
        unint64_t v14 = *(void *)(v25 + 8 * v12);
        if (!v14)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v24) {
            goto LABEL_36;
          }
          unint64_t v14 = *(void *)(v25 + 8 * v12);
          if (!v14)
          {
            int64_t v12 = v7 + 4;
            if (v7 + 4 >= v24) {
              goto LABEL_36;
            }
            unint64_t v14 = *(void *)(v25 + 8 * v12);
            if (!v14)
            {
              int64_t v15 = v7 + 5;
              if (v7 + 5 >= v24) {
                goto LABEL_36;
              }
              unint64_t v14 = *(void *)(v25 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  int64_t v12 = v15 + 1;
                  if (__OFADD__(v15, 1)) {
                    goto LABEL_41;
                  }
                  if (v12 >= v24) {
                    goto LABEL_36;
                  }
                  unint64_t v14 = *(void *)(v25 + 8 * v12);
                  ++v15;
                  if (v14) {
                    goto LABEL_26;
                  }
                }
              }
              int64_t v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      uint64_t v10 = (v14 - 1) & v14;
      unint64_t v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_24E338314(*(void *)(a1 + 48) + 40 * v11, (uint64_t)v37);
    sub_24E32D398(*(void *)(a1 + 56) + 32 * v11, (uint64_t)v38 + 8);
    v35[0] = v38[0];
    v35[1] = v38[1];
    uint64_t v36 = v39;
    v34[0] = v37[0];
    v34[1] = v37[1];
    sub_24E338314((uint64_t)v34, (uint64_t)v29);
    if (!swift_dynamicCast())
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      sub_24E32D33C((uint64_t)v34, &qword_26B1B5BF8);
      swift_bridgeObjectRelease();
LABEL_35:
      sub_24E338370();
      swift_release();
      return 0;
    }
    uint64_t v17 = v27;
    uint64_t v16 = v28;
    sub_24E32D398((uint64_t)v35 + 8, (uint64_t)&v27);
    sub_24E32D33C((uint64_t)v34, &qword_26B1B5BF8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A10);
    if ((swift_dynamicCast() & 1) == 0)
    {
      memset(v26, 0, sizeof(v26));
      swift_bridgeObjectRelease();
      sub_24E32D33C((uint64_t)v26, &qword_2698D8AD0);
      goto LABEL_35;
    }
    sub_24E338378(v26, v29);
    sub_24E338378(v29, v30);
    *(void *)&long long v31 = v17;
    *((void *)&v31 + 1) = v16;
    sub_24E338378(v30, v32);
    long long v18 = v31;
    sub_24E338378(v32, v33);
    sub_24E338378(v33, &v31);
    unint64_t result = sub_24E32CD14(v18, *((uint64_t *)&v18 + 1));
    unint64_t v19 = result;
    if (v20)
    {
      uint64_t v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v8 = v18;
      id v9 = (_OWORD *)(v2[7] + 32 * v19);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      unint64_t result = (unint64_t)sub_24E338378(&v31, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v18;
    unint64_t result = (unint64_t)sub_24E338378(&v31, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v21 = v2[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_39;
    }
    v2[2] = v23;
LABEL_8:
    int64_t v7 = v12;
    unint64_t v5 = v10;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t APNSManager.IncomingMessage.description.getter()
{
  return 0x203A6369706F743CLL;
}

uint64_t sub_24E334EB0(uint64_t a1)
{
  return sub_24E334EBC(a1, qword_2698D8AF0);
}

uint64_t sub_24E334EBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24E35FD10();
  __swift_allocate_value_buffer(v3, a2);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_26B1B67C0 != -1) {
    swift_once();
  }
  uint64_t v5 = __swift_project_value_buffer(v3, (uint64_t)qword_26B1B68C8);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v6(v4, v5, v3);
}

id sub_24E334F80()
{
  uint64_t v1 = v0;
  if (qword_2698D87D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24E35FD10();
  __swift_project_value_buffer(v2, (uint64_t)qword_2698D8AF0);
  uint64_t v3 = sub_24E35FCF0();
  os_log_type_t v4 = sub_24E360030();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_24E31F000, v3, v4, "APNSManager deinit", v5, 2u);
    MEMORY[0x25333A4C0](v5, -1, -1);
  }

  v7.id receiver = v1;
  v7.super_class = (Class)type metadata accessor for APNSManager.PushDelegateTrampoline();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_24E335194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_24E3351B8, a4, 0);
}

uint64_t sub_24E3351B8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = *(int **)(v1 + 144);
  v0[5] = v2;
  if (v2)
  {
    v0[6] = *(void *)(v1 + 152);
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)v2 + *v2);
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[7] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24E3352E0;
    uint64_t v5 = v0[3];
    uint64_t v4 = v0[4];
    return v8(v5, v4);
  }
  else
  {
    objc_super v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_24E3352E0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E3353F0, v1, 0);
}

uint64_t sub_24E3353F0()
{
  sub_24E336CDC(*(void *)(v0 + 40));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E335634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[7] = v10;
  v8[8] = v11;
  _OWORD v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return MEMORY[0x270FA2498](sub_24E335668, a4, 0);
}

uint64_t sub_24E335668()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = *(int **)(v1 + 160);
  v0[9] = v2;
  if (v2)
  {
    v0[10] = *(void *)(v1 + 168);
    int64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v2 + *v2);
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[11] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24E335798;
    uint64_t v4 = v0[7];
    uint64_t v5 = v0[8];
    uint64_t v6 = v0[5];
    uint64_t v7 = v0[6];
    uint64_t v9 = v0[3];
    uint64_t v8 = v0[4];
    return v12(v9, v8, v6, v7, v4, v5);
  }
  else
  {
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

uint64_t sub_24E335798()
{
  uint64_t v1 = *(void *)(*v0 + 72);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  sub_24E336CDC(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_24E3359F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
  v7[11] = swift_task_alloc();
  v7[12] = type metadata accessor for APNSAppTokenInfo();
  v7[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E335AB8, 0, 0);
}

uint64_t sub_24E335AB8()
{
  uint64_t v1 = *(uint64_t **)(v0 + 104);
  id v2 = *(id *)(v0 + 56);
  id v3 = objc_msgSend(v2, sel_topic);
  uint64_t v4 = sub_24E35FDC0();
  uint64_t v6 = v5;

  *uint64_t v1 = v4;
  v1[1] = v6;
  id v7 = objc_msgSend(v2, sel_identifier);
  uint64_t v8 = sub_24E35FDC0();
  uint64_t v10 = v9;

  v1[2] = v8;
  v1[3] = v10;
  id v11 = objc_msgSend(v2, sel_expirationDate);
  uint64_t v12 = *(void *)(v0 + 88);
  uint64_t v13 = *(void **)(v0 + 56);
  if (v11)
  {
    unint64_t v14 = v11;
    sub_24E35FC90();

    uint64_t v15 = sub_24E35FCA0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 0, 1, v15);
  }
  else
  {

    uint64_t v16 = sub_24E35FCA0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v12, 1, 1, v16);
  }
  uint64_t v18 = *(void *)(v0 + 96);
  uint64_t v17 = *(void *)(v0 + 104);
  uint64_t v19 = *(void *)(v0 + 64);
  sub_24E337F5C(*(void *)(v0 + 88), v17 + *(int *)(v18 + 24));
  *(void *)(v0 + 40) = v18;
  *(void *)(v0 + 48) = &off_270041300;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  sub_24E338028(v17, (uint64_t)boxed_opaque_existential_1);
  return MEMORY[0x270FA2498](sub_24E335C80, v19, 0);
}

uint64_t sub_24E335C80()
{
  uint64_t v1 = v0[8];
  id v2 = *(int **)(v1 + 176);
  v0[14] = v2;
  if (v2)
  {
    v0[15] = *(void *)(v1 + 184);
    id v7 = (int *)((char *)v2 + *v2);
    swift_retain();
    id v3 = (void *)swift_task_alloc();
    v0[16] = v3;
    *id v3 = v0;
    v3[1] = sub_24E335DC8;
    uint64_t v5 = v0[9];
    uint64_t v4 = v0[10];
    return ((uint64_t (*)(uint64_t, uint64_t, void *))v7)(v5, v4, v0 + 2);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    return MEMORY[0x270FA2498](sub_24E335F7C, 0, 0);
  }
}

uint64_t sub_24E335DC8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  uint64_t v2 = *(void *)(*(void *)v0 + 64);
  swift_task_dealloc();
  sub_24E336CDC(v1);
  return MEMORY[0x270FA2498](sub_24E335F14, v2, 0);
}

uint64_t sub_24E335F14()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA2498](sub_24E335F7C, 0, 0);
}

uint64_t sub_24E335F7C()
{
  sub_24E33808C(*(void *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E336318(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E322CD0;
  v5[6] = a2;
  v5[7] = a1;
  return MEMORY[0x270FA2498](sub_24E334204, a1, 0);
}

uint64_t sub_24E336690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_24E322CD0;
  return sub_24E333CE4(a5);
}

uint64_t sub_24E336868()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E322CD0;
  return sub_24E333668();
}

uint64_t sub_24E336BAC()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B68C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B68C8);
  return sub_24E35FD00();
}

uint64_t sub_24E336C2C()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24E336C5C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24E336C8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24E33940C(v2 + *(int *)(a1 + 24), a2);
}

uint64_t sub_24E336C9C()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E336CD4(uint64_t a1)
{
  return sub_24E332014(a1);
}

uint64_t sub_24E336CDC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_24E336CEC()
{
  unint64_t result = qword_2698D8B38;
  if (!qword_2698D8B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8B38);
  }
  return result;
}

unint64_t sub_24E336D44()
{
  unint64_t result = qword_2698D8B80;
  if (!qword_2698D8B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2698D8B80);
  }
  return result;
}

uint64_t sub_24E336D98@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 232);
  return result;
}

uint64_t sub_24E336DE0(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 232) = v2;
  return result;
}

uint64_t type metadata accessor for APNSManager()
{
  return self;
}

uint64_t method lookup function for APNSManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for APNSManager);
}

uint64_t dispatch thunk of APNSManager.connected.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

uint64_t dispatch thunk of APNSManager.connected.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of APNSManager.connected.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of APNSManager.__allocating_init(environmentName:delegatePort:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 384) + **(int **)(v4 + 384));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_24E339474;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of APNSManager.enabledTopics.getter()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 392) + **(int **)(*(void *)v0 + 392));
  char v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *char v2 = v1;
  v2[1] = sub_24E3370EC;
  return v4();
}

uint64_t sub_24E3370EC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of APNSManager.set(enabledTopics:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of APNSManager.connectionStateStream()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 408))();
}

uint64_t dispatch thunk of APNSManager.setDidReconnect(block:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416))();
}

uint64_t dispatch thunk of APNSManager.setDidReceivePublicToken(block:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of APNSManager.setDidReceiveTokenForTopic(block:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

uint64_t dispatch thunk of APNSManager.setDidReceiveTokenForInfo(block:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440))();
}

uint64_t dispatch thunk of APNSManager.setDidReceive(block:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of APNSManager.setDidChangeConnectionStatus(block:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 456))();
}

uint64_t dispatch thunk of APNSManager.requestToken(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t dispatch thunk of APNSManager.requestToken(for:identifier:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

unsigned char *storeEnumTagSinglePayload for APNSManager.Error(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E33743CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for APNSManager.Error()
{
  return &type metadata for APNSManager.Error;
}

uint64_t destroy for APNSManager.IncomingMessage()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s19FindMyDaemonSupport11APNSManagerC15IncomingMessageVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for APNSManager.IncomingMessage(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for APNSManager.IncomingMessage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for APNSManager.IncomingMessage()
{
  return &type metadata for APNSManager.IncomingMessage;
}

uint64_t sub_24E3375B4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24E3375F0()
{
  return objectdestroy_51Tm(40);
}

uint64_t sub_24E3375F8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E322CD0;
  char v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *char v2 = v1;
  v2[1] = sub_24E322CD0;
  return sub_24E333668();
}

uint64_t sub_24E3376CC()
{
  return objectdestroy_51Tm(41);
}

uint64_t objectdestroy_51Tm(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24E337720()
{
  char v2 = *(unsigned char *)(v0 + 40);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24E322CD0;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  void *v4 = v3;
  v4[1] = sub_24E322CD0;
  return sub_24E333CE4(v2);
}

uint64_t sub_24E337808(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v12 - 8);
  unint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v16 = result;
    if (a2 >> 60 != 15 && a4 && a6)
    {
      uint64_t v17 = sub_24E35FF00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
      uint64_t v18 = (void *)swift_allocObject();
      v18[2] = 0;
      v18[3] = 0;
      v18[4] = v16;
      v18[5] = a1;
      v18[6] = a2;
      v18[7] = a3;
      v18[8] = a4;
      v18[9] = a5;
      v18[10] = a6;
      sub_24E337EA4(a1, a2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E346460((uint64_t)v14, (uint64_t)&unk_2698D8C88, (uint64_t)v18);
      return swift_release();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24E3379B4(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v10 = result;
    if (a2 >> 60 == 15 || !a3)
    {
      return swift_release();
    }
    else
    {
      uint64_t v11 = sub_24E35FF00();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
      uint64_t v12 = (void *)swift_allocObject();
      v12[2] = 0;
      uint64_t v12[3] = 0;
      v12[4] = a3;
      v12[5] = v10;
      v12[6] = a1;
      v12[7] = a2;
      sub_24E337EA4(a1, a2);
      id v13 = a3;
      sub_24E346460((uint64_t)v8, (uint64_t)&unk_2698D8C70, (uint64_t)v12);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24E337B24(void *a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    if (a1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5BD0);
      uint64_t v4 = swift_allocObject();
      *(void *)(v4 + 16) = a1;
      sub_24E35FB20();
      uint64_t v5 = swift_allocObject();
      *(void *)(v5 + 16) = v3;
      *(void *)(v5 + 24) = v4;
      swift_retain();
      swift_retain();
      id v6 = a1;
      MEMORY[0x253339540]("APNSManager.didReceive", 22, 2, &unk_2698D8C50, v5);
      swift_release();
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_24E337C3C()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E337C7C()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_24E322CD0;
  return sub_24E336318(v2, v3);
}

uint64_t sub_24E337D14(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24E337D28(a1, a2);
  }
  return a1;
}

uint64_t sub_24E337D28(uint64_t a1, unint64_t a2)
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

uint64_t sub_24E337D80()
{
  swift_unknownObjectRelease();

  swift_release();
  sub_24E337D28(*(void *)(v0 + 48), *(void *)(v0 + 56));

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24E337DD0(uint64_t a1)
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
  v10[1] = sub_24E322CD0;
  return sub_24E3359F0(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_24E337EA4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_24E337EB8(a1, a2);
  }
  return a1;
}

uint64_t sub_24E337EB8(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for APNSAppTokenInfo()
{
  uint64_t result = qword_2698D8CD0;
  if (!qword_2698D8CD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24E337F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t sub_24E338028(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for APNSAppTokenInfo();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E33808C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for APNSAppTokenInfo();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24E3380E8()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_24E337D28(*(void *)(v0 + 40), *(void *)(v0 + 48));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_24E338140()
{
  uint64_t v2 = *(void *)(v0 + 32);
  long long v7 = *(_OWORD *)(v0 + 56);
  long long v8 = *(_OWORD *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 56) = v4;
  *(void *)(v5 + 64) = v3;
  *(_OWORD *)(v5 + 40) = v7;
  *(_OWORD *)(v5 + 24) = v8;
  *(void *)(v5 + 8) = sub_24E322CD0;
  *(void *)(v5 + 16) = v2;
  return MEMORY[0x270FA2498](sub_24E335668, v2, 0);
}

uint64_t sub_24E338214()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_24E337D28(*(void *)(v0 + 40), *(void *)(v0 + 48));

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24E33825C()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[3] = v3;
  v5[4] = v4;
  v5[1] = sub_24E322CD0;
  v5[2] = v2;
  return MEMORY[0x270FA2498](sub_24E3351B8, v2, 0);
}

uint64_t sub_24E338314(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24E338370()
{
  return swift_release();
}

_OWORD *sub_24E338378(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24E338388()
{
  uint64_t v1 = sub_24E35FCE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24E338454(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_24E35FCE0() - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_24E332404(a1, v4, v5);
}

uint64_t sub_24E3384C8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_24E35FCE0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v4 + v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_24E33862C()
{
  uint64_t v2 = *(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v2 + 64);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(sub_24E35FCE0() - 8) + 80);
  unint64_t v6 = v3 + v4 + v5;
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v8 = v0 + v3;
  uint64_t v9 = v0 + (v6 & ~v5);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[3] = v8;
  v10[4] = v9;
  v10[1] = sub_24E322CD0;
  v10[2] = v7;
  return MEMORY[0x270FA2498](sub_24E3329F0, v7, 0);
}

unint64_t sub_24E33877C()
{
  unint64_t result = qword_26B1B6790;
  if (!qword_26B1B6790)
  {
    sub_24E35FCE0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B6790);
  }
  return result;
}

uint64_t sub_24E3387D4()
{
  uint64_t v1 = sub_24E35FCE0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24E3388A8()
{
  uint64_t v2 = *(void *)(sub_24E35FCE0() - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[2] = v3;
  v5[3] = v4;
  v5[1] = sub_24E322A50;
  return MEMORY[0x270FA2498](sub_24E3325F8, v3, 0);
}

uint64_t *sub_24E338990(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_24E35FCA0();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t sub_24E338B1C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24E35FCA0();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

void *sub_24E338BF4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24E35FCA0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

void *sub_24E338D30(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24E35FCA0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *sub_24E338EE8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_24E35FCA0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

void *sub_24E338FFC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_24E35FCA0();
  uint64_t v12 = *(void *)(v11 - 8);
  int v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_24E339194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24E3391A8);
}

uint64_t sub_24E3391A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24E33925C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24E339270);
}

uint64_t sub_24E339270(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_24E33931C()
{
  sub_24E3393B4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24E3393B4()
{
  if (!qword_2698D8CE0)
  {
    sub_24E35FCA0();
    unint64_t v0 = sub_24E3600A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2698D8CE0);
    }
  }
}

uint64_t sub_24E33940C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8C78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24E339478()
{
  return sub_24E339AE8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t ActorServiceProtocol.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  sub_24E3602D0();
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  MEMORY[0x253339D10](a1, v3);
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  return 60;
}

uint64_t ActorServiceProtocol.migrate(from:to:)()
{
  return sub_24E320BCC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t ActorServiceProtocol.firstLaunchSinceReboot()()
{
  return sub_24E320BCC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t ActorServiceProtocol.run()()
{
  return sub_24E339AE8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t dispatch thunk of ActorServiceProtocol.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ActorServiceProtocol.initialLaunchProcessing()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 32) + **(int **)(a2 + 32));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E322CD0;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorServiceProtocol.migrate(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 40) + **(int **)(a4 + 40));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24E322CD0;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ActorServiceProtocol.firstLaunchSinceReboot()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 48) + **(int **)(a2 + 48));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E322A50;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorServiceProtocol.startup()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 56) + **(int **)(a2 + 56));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E322CD0;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorServiceProtocol.run()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 64) + **(int **)(a2 + 64));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E322A50;
  return v7(a1, a2);
}

uint64_t sub_24E339AE8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t withArrayOfCStrings<A>(_:_:)(uint64_t a1, void (*a2)(void *))
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    sub_24E33A390(0, v2, 0);
    uint64_t v5 = v23;
    uint64_t v6 = a1 + 40;
    do
    {
      uint64_t v7 = (const char *)(sub_24E35FDE0() + 32);
      swift_bridgeObjectRetain();
      uint64_t v8 = strdup(v7);
      swift_bridgeObjectRelease();
      swift_release();
      unint64_t v10 = *(void *)(v23 + 16);
      unint64_t v9 = *(void *)(v23 + 24);
      int64_t v11 = v10 + 1;
      if (v10 >= v9 >> 1) {
        sub_24E33A390(v9 > 1, v10 + 1, 1);
      }
      v6 += 16;
      *(void *)(v23 + 16) = v11;
      *(void *)(v23 + 8 * v10 + 32) = v8;
      --v2;
    }
    while (v2);
  }
  else
  {
    int64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (!v11) {
      goto LABEL_12;
    }
  }
  sub_24E33A368(0, v11, 0);
  uint64_t v12 = 0;
  unint64_t v13 = v3[2];
  do
  {
    uint64_t v14 = *(void *)(v5 + 8 * v12 + 32);
    unint64_t v15 = v3[3];
    if (v13 >= v15 >> 1) {
      sub_24E33A368(v15 > 1, v13 + 1, 1);
    }
    ++v12;
    v3[2] = v13 + 1;
    v3[v13++ + 4] = v14;
  }
  while (v11 != v12);
LABEL_12:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_24E33A120(0, v3[2] + 1, 1, v3);
  }
  unint64_t v17 = v3[2];
  unint64_t v16 = v3[3];
  if (v17 >= v16 >> 1) {
    uint64_t v3 = sub_24E33A120((void *)(v16 > 1), v17 + 1, 1, v3);
  }
  v3[2] = v17 + 1;
  v3[v17 + 4] = 0;
  a2(v3);
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(v5 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v18; ++i)
    {
      char v20 = *(void **)(v5 + 8 * i + 32);
      free(v20);
    }
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_24E339D68(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24E339D90(a1, a2, a3, a4, qword_2698D8D78, (uint64_t *)&unk_26B1B5B58);
}

uint64_t sub_24E339D7C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24E339D90(a1, a2, a3, a4, &qword_26B1B5BC0, (uint64_t *)&unk_26B1B5B70);
}

uint64_t sub_24E339D90(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
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
    unint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  unint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (BOOL v18 = v14 == -1) : (BOOL v18 = 0), v18))
  {
LABEL_29:
    uint64_t result = sub_24E360200();
    __break(1u);
    return result;
  }
  void v16[2] = v11;
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
    sub_24E33A800(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

void *sub_24E339FFC(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5DD8);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_24E33A514(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E33A10C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24E339D90(a1, a2, a3, a4, &qword_26B1B59F8, (uint64_t *)&unk_26B1B5970);
}

void *sub_24E33A120(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8D68);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24E33A608(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E33A230(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24E339D90(a1, a2, a3, a4, (uint64_t *)&unk_26B1B5A00, &qword_26B1B5990);
}

void *sub_24E33A244(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6510);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_24E33A6F4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24E33A354(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24E339D90(a1, a2, a3, a4, (uint64_t *)&unk_26B1B6518, &qword_26B1B64D8);
}

uint64_t sub_24E33A368(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24E33A3B8(a1, a2, a3, *v3, &qword_2698D8D68);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24E33A390(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24E33A3B8(a1, a2, a3, *v3, &qword_2698D8D70);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24E33A3B8(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    int64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    int64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v14 = v11 + 32;
  unint64_t v15 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[8 * v9] || v14 >= &v15[8 * v9])
  {
    memcpy(v14, v15, 8 * v9);
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  uint64_t result = sub_24E360250();
  __break(1u);
  return result;
}

uint64_t sub_24E33A514(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_24E360250();
  __break(1u);
  return result;
}

char *sub_24E33A608(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_24E360250();
  __break(1u);
  return result;
}

uint64_t sub_24E33A6F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63F0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24E360250();
  __break(1u);
  return result;
}

uint64_t sub_24E33A800(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
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
  uint64_t result = sub_24E360250();
  __break(1u);
  return result;
}

uint64_t (*sub_24E33A958(void *a1, uint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_24E33DC64(v6, a2, a3);
  return sub_24E33A9D8;
}

uint64_t (*sub_24E33A9DC(void *a1, uint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_24E33DD14(v6, a2, a3);
  return sub_24E33A9D8;
}

uint64_t (*sub_24E33AA5C(void *a1, uint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_24E33DDC0(v6, a2, a3);
  return sub_24E33A9D8;
}

uint64_t (*sub_24E33AADC(void *a1, uint64_t a2, uint64_t a3))()
{
  unint64_t v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_24E33DE6C(v6, a2, a3);
  return sub_24E33A9D8;
}

void sub_24E33AB5C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();

  free(v1);
}

uint64_t sub_24E33ABB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24E35FF00();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24E35FEF0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24E32D33C(a1, &qword_26B1B6810);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24E35FEC0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_24E33AD38()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B5898);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5898);
  if (qword_26B1B5908 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B58E8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_24E33AE00()
{
  qword_26B1B6818 = 0x6C7070612E6D6F63;
  unk_26B1B6820 = 0xEF6D72616C612E65;
}

uint64_t (*sub_24E33AE30())()
{
  return j__swift_endAccess;
}

void *XPCAlarmEventHandler.__allocating_init(eventStreamHandler:)(uint64_t a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  swift_defaultActor_initialize();
  uint64_t v3 = MEMORY[0x263F8EE78];
  v2[14] = MEMORY[0x263F8EE78];
  v2[16] = sub_24E327438(v3);
  v2[17] = sub_24E327454(v3);
  v2[18] = sub_24E327438(v3);
  v2[19] = sub_24E327454(v3);
  v2[20] = sub_24E327470(v3);
  v2[15] = a1;
  return v2;
}

void *XPCAlarmEventHandler.init(eventStreamHandler:)(uint64_t a1)
{
  swift_defaultActor_initialize();
  uint64_t v3 = MEMORY[0x263F8EE78];
  v1[14] = MEMORY[0x263F8EE78];
  v1[16] = sub_24E327438(v3);
  v1[17] = sub_24E327454(v3);
  v1[18] = sub_24E327438(v3);
  v1[19] = sub_24E327454(v3);
  v1[20] = sub_24E327470(v3);
  v1[15] = a1;
  return v1;
}

uint64_t sub_24E33AF94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5960);
  v4[19] = v5;
  v4[20] = *(void *)(v5 - 8);
  v4[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B59B8);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B59B0);
  v4[25] = v6;
  v4[26] = *(void *)(v6 - 8);
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E33B118, v3, 0);
}

uint64_t sub_24E33B118()
{
  uint64_t v80 = v0;
  uint64_t v1 = *(void *)(v0[18] + 128);
  unint64_t v2 = 0x26B1B5000uLL;
  if (*(void *)(v1 + 16))
  {
    uint64_t v4 = v0[16];
    uint64_t v3 = v0[17];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_24E32CD14(v4, v3);
    uint64_t v7 = v0[25];
    uint64_t v6 = v0[26];
    uint64_t v8 = v0[24];
    if (v9)
    {
      (*(void (**)(void, unint64_t, void))(v6 + 16))(v0[24], *(void *)(v1 + 56) + *(void *)(v6 + 72) * v5, v0[25]);
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v10(v8, 0, 1, v7);
    }
    else
    {
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v10(v0[24], 1, 1, v7);
    }
    uint64_t v12 = v0[25];
    uint64_t v11 = v0[26];
    uint64_t v13 = v0[24];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v13, 1, v12) != 1)
    {
      uint64_t v21 = v0[28];
      uint64_t v22 = v0[25];
      uint64_t v23 = v0[26];
      uint64_t v24 = v0[24];
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[26] + 56);
    v10(v0[24], 1, 1, v0[25]);
  }
  uint64_t v14 = v0[18];
  sub_24E32D33C(v0[24], &qword_26B1B59B8);
  swift_beginAccess();
  uint64_t v15 = *(void *)(v14 + 144);
  if (*(void *)(v15 + 16))
  {
    uint64_t v17 = v0[16];
    uint64_t v16 = v0[17];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_24E32CD14(v17, v16);
    if (v19)
    {
      (*(void (**)(void, unint64_t, void))(v0[26] + 16))(v0[23], *(void *)(v15 + 56) + *(void *)(v0[26] + 72) * v18, v0[25]);
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = 1;
    }
    uint64_t v26 = v0[25];
    uint64_t v25 = v0[26];
    uint64_t v27 = v0[23];
    v10(v27, v20, 1, v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v27, 1, v26) == 1) {
      goto LABEL_14;
    }
    uint64_t v21 = v0[28];
    uint64_t v22 = v0[25];
    uint64_t v23 = v0[26];
    uint64_t v24 = v0[23];
LABEL_21:
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v21, v24, v22);
    goto LABEL_22;
  }
  v10(v0[23], 1, 1, v0[25]);
LABEL_14:
  sub_24E32D33C(v0[23], &qword_26B1B59B8);
  if (qword_26B1B58B8 != -1) {
    swift_once();
  }
  v77 = v10;
  uint64_t v28 = sub_24E35FD10();
  __swift_project_value_buffer(v28, (uint64_t)qword_26B1B5898);
  swift_bridgeObjectRetain_n();
  char v29 = sub_24E35FCF0();
  os_log_type_t v30 = sub_24E360030();
  BOOL v31 = os_log_type_enabled(v29, v30);
  unint64_t v32 = v0[17];
  if (v31)
  {
    uint64_t v33 = v0[16];
    uint64_t v34 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    uint64_t v79 = v35;
    *(_DWORD *)uint64_t v34 = 141558275;
    v0[13] = 1752392040;
    sub_24E3600B0();
    *(_WORD *)(v34 + 12) = 2081;
    swift_bridgeObjectRetain();
    v0[14] = sub_24E32C6BC(v33, v32, &v79);
    sub_24E3600B0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24E31F000, v29, v30, "Creating base AsyncStream for XPCAlarm with stream name: %{private,mask.hash}s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v35, -1, -1);
    MEMORY[0x25333A4C0](v34, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v36 = v0[26];
  uint64_t v73 = v0[27];
  uint64_t v74 = v0[28];
  uint64_t v37 = v0[25];
  uint64_t v38 = v0[21];
  uint64_t v39 = v0[19];
  uint64_t v40 = v0[20];
  uint64_t v42 = v0[17];
  uint64_t v41 = v0[18];
  uint64_t v43 = v0[16];
  uint64_t v75 = v0[22];
  uint64_t v44 = (void *)swift_task_alloc();
  v44[2] = v41;
  v44[3] = v43;
  v44[4] = v42;
  (*(void (**)(uint64_t, void, uint64_t))(v40 + 104))(v38, *MEMORY[0x263F8F580], v39);
  sub_24E35FF50();
  swift_task_dealloc();
  uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
  v45(v74, v73, v37);
  v45(v75, v74, v37);
  v77(v75, 0, 1, v37);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24E328A20(v75, v43, v42);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v73, v37);
  unint64_t v2 = 0x26B1B5000;
LABEL_22:
  uint64_t v47 = v0[20];
  uint64_t v46 = v0[21];
  uint64_t v49 = v0[18];
  uint64_t v48 = v0[19];
  uint64_t v51 = v0[16];
  uint64_t v50 = v0[17];
  uint64_t v52 = (void *)swift_task_alloc();
  v52[2] = v49;
  v52[3] = v51;
  v52[4] = v50;
  (*(void (**)(uint64_t, void, uint64_t))(v47 + 104))(v46, *MEMORY[0x263F8F580], v48);
  sub_24E35FF50();
  swift_task_dealloc();
  swift_beginAccess();
  uint64_t v53 = *(void *)(v49 + 160);
  if (*(void *)(v53 + 16))
  {
    uint64_t v55 = v0[16];
    uint64_t v54 = v0[17];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v56 = sub_24E32CD14(v55, v54);
    if (v57)
    {
      uint64_t v58 = *(void *)(*(void *)(v53 + 56) + 8 * v56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v59 = *(void *)(v58 + 16);
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v59 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v59 = 0;
  }
  if (*(void *)(v2 + 2232) != -1) {
    swift_once();
  }
  uint64_t v60 = sub_24E35FD10();
  __swift_project_value_buffer(v60, (uint64_t)qword_26B1B5898);
  swift_bridgeObjectRetain_n();
  uint64_t v61 = sub_24E35FCF0();
  os_log_type_t v62 = sub_24E360030();
  BOOL v63 = os_log_type_enabled(v61, v62);
  uint64_t v64 = v0[28];
  uint64_t v66 = v0[25];
  uint64_t v65 = v0[26];
  unint64_t v67 = v0[17];
  if (v63)
  {
    uint64_t v78 = v0[28];
    uint64_t v68 = v0[16];
    uint64_t v76 = v59;
    uint64_t v69 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    uint64_t v79 = v70;
    *(_DWORD *)uint64_t v69 = 136315394;
    swift_bridgeObjectRetain();
    v0[11] = sub_24E32C6BC(v68, v67, &v79);
    sub_24E3600B0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v69 + 12) = 2048;
    v0[12] = v76;
    sub_24E3600B0();
    _os_log_impl(&dword_24E31F000, v61, v62, "Creating sub AsyncStream for XPCAlarm name: [%s], count: %ld", (uint8_t *)v69, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v70, -1, -1);
    MEMORY[0x25333A4C0](v69, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v78, v66);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v71 = (uint64_t (*)(void))v0[1];
  return v71();
}

uint64_t sub_24E33B9F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5998);
  MEMORY[0x270FA5388](v7 - 8);
  char v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5990);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24E328A5C((uint64_t)v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_24E33BB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5990);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v28[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)(a2 + 160);
  swift_beginAccess();
  if (*(void *)(*(void *)(a2 + 160) + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_24E32CD14(a3, a4),
        char v14 = v13,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v14 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24E33AE30();
    uint64_t v17 = sub_24E33AA5C(v28, a3, a4);
    if (*v16)
    {
      unint64_t v18 = v16;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
      unint64_t v19 = *v18;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t *v18 = v19;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v19 = sub_24E33A230(0, *(void *)(v19 + 16) + 1, 1, v19);
        unint64_t *v18 = v19;
      }
      unint64_t v22 = *(void *)(v19 + 16);
      unint64_t v21 = *(void *)(v19 + 24);
      if (v22 >= v21 >> 1)
      {
        unint64_t v19 = sub_24E33A230(v21 > 1, v22 + 1, 1, v19);
        unint64_t *v18 = v19;
      }
      *(void *)(v19 + 16) = v22 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v22, v11, v8);
      ((void (*)(void *, void))v17)(v28, 0);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(unsigned char *, void))v15)(v29, 0);
    }
    else
    {
      ((void (*)(void *, void))v17)(v28, 0);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(unsigned char *, void))v15)(v29, 0);
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5A00);
    unint64_t v24 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_24E3617D0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16))(v25 + v24, a1, v8);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    v28[0] = *v12;
    *uint64_t v12 = 0x8000000000000000;
    sub_24E34878C(v25, a3, a4, v26);
    *uint64_t v12 = v28[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

uint64_t sub_24E33BE9C(uint64_t a1)
{
  v2[28] = a1;
  v2[29] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  v2[30] = swift_task_alloc();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6360);
  v2[31] = v3;
  v2[32] = *(void *)(v3 - 8);
  v2[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5DD0);
  v2[34] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6380);
  v2[35] = v4;
  v2[36] = *(void *)(v4 - 8);
  v2[37] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E33C020, v1, 0);
}

uint64_t sub_24E33C020()
{
  if (MEMORY[0x253339500]())
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    uint64_t v3 = v0[29];
    *(void *)(v3 + 112) = v0[28];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v4 = *(void *)(v3 + 120);
    v0[38] = v4;
    if (qword_26B1B5890 != -1) {
      swift_once();
    }
    uint64_t v5 = unk_26B1B6820;
    v0[39] = qword_26B1B6818;
    v0[40] = v5;
    return MEMORY[0x270FA2498](sub_24E33C14C, v4, 0);
  }
}

uint64_t sub_24E33C14C()
{
  uint64_t v1 = v0[38];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 120);
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = v0[39];
    uint64_t v3 = v0[40];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_24E32CD14(v4, v3);
    uint64_t v6 = v0[35];
    uint64_t v7 = v0[36];
    uint64_t v8 = v0[34];
    if (v9)
    {
      (*(void (**)(void, unint64_t, void))(v7 + 16))(v0[34], *(void *)(v2 + 56) + *(void *)(v7 + 72) * v5, v0[35]);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v8, 0, 1, v6);
    }
    else
    {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v7 + 56))(v0[34], 1, 1, v6);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(v0[36] + 56))(v0[34], 1, 1, v0[35]);
  }
  uint64_t v10 = v0[29];
  return MEMORY[0x270FA2498](sub_24E33C29C, v10, 0);
}

uint64_t sub_24E33C29C()
{
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[36];
  uint64_t v3 = v0[34];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_24E32D33C(v3, &qword_26B1B5DD0);
    sub_24E360140();
    swift_bridgeObjectRelease();
    return sub_24E360210();
  }
  uint64_t v4 = v0[29];
  (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[37], v3, v1);
  if (!*(void *)(*(void *)(v4 + 112) + 16)) {
    return sub_24E360210();
  }
  uint64_t v5 = swift_bridgeObjectRetain();
  v0[41] = sub_24E33EFC0(v5);
  swift_bridgeObjectRelease();
  sub_24E35FF30();
  uint64_t v7 = sub_24E33F400((unint64_t *)&unk_26B1B5BD8, v6, (void (*)(uint64_t))type metadata accessor for XPCAlarmEventHandler);
  v0[42] = v7;
  uint64_t v8 = v0[29];
  char v9 = (void *)swift_task_alloc();
  v0[43] = v9;
  *char v9 = v0;
  v9[1] = sub_24E33C4DC;
  uint64_t v10 = v0[31];
  return MEMORY[0x270FA1F68](v0 + 24, v8, v7, v10);
}

uint64_t sub_24E33C4DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 232);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E33C5EC, v1, 0);
}

uint64_t sub_24E33C5EC()
{
  v93 = v0;
  uint64_t v1 = v0[24];
  if (!v1)
  {
    uint64_t v70 = v0[36];
    uint64_t v69 = v0[37];
    uint64_t v71 = v0[35];
    uint64_t v73 = v0[32];
    uint64_t v72 = v0[33];
    uint64_t v74 = v0[31];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v72, v74);
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v75 = (uint64_t (*)(void))v0[1];
    return v75();
  }
  v77 = v0 + 24;
  uint64_t v78 = v0 + 2;
  uint64_t v86 = v0 + 10;
  uint64_t v88 = (uint64_t)(v0 + 6);
  uint64_t v2 = v0 + 14;
  uint64_t v3 = v0 + 26;
  uint64_t v81 = v0[25];
  uint64_t v82 = v1 + 64;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(v1 + 64);
  int64_t v84 = (unint64_t)(63 - v5) >> 6;
  uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain();
  int64_t v11 = 0;
  uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  v91 = v0;
  uint64_t v85 = v1;
  while (1)
  {
    if (v6)
    {
      unint64_t v13 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_25;
    }
    int64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
      goto LABEL_79;
    }
    if (v15 >= v84) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v82 + 8 * v15);
    ++v11;
    if (!v16)
    {
      int64_t v11 = v15 + 1;
      if (v15 + 1 >= v84) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v82 + 8 * v11);
      if (!v16)
      {
        int64_t v11 = v15 + 2;
        if (v15 + 2 >= v84) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v82 + 8 * v11);
        if (!v16)
        {
          int64_t v11 = v15 + 3;
          if (v15 + 3 >= v84) {
            goto LABEL_33;
          }
          unint64_t v16 = *(void *)(v82 + 8 * v11);
          if (!v16)
          {
            int64_t v11 = v15 + 4;
            if (v15 + 4 >= v84) {
              goto LABEL_33;
            }
            unint64_t v16 = *(void *)(v82 + 8 * v11);
            if (!v16) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_25:
    sub_24E32D398(*(void *)(v1 + 56) + 32 * v14, (uint64_t)v86);
    sub_24E338378(v86, v2);
    sub_24E32D398((uint64_t)v2, v88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A10);
    if ((swift_dynamicCast() & 1) == 0)
    {
      *uint64_t v3 = 0;
      v3[1] = 0;
    }
    uint64_t isUniquelyReferenced_nonNull_native = __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    uint64_t v18 = v0[27];
    if (v18)
    {
      uint64_t v19 = v0[26];
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_24E339FFC(0, v12[2] + 1, 1, v12);
        uint64_t v12 = (void *)isUniquelyReferenced_nonNull_native;
      }
      unint64_t v21 = v12[2];
      unint64_t v20 = v12[3];
      if (v21 >= v20 >> 1)
      {
        uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)sub_24E339FFC((void *)(v20 > 1), v21 + 1, 1, v12);
        uint64_t v12 = (void *)isUniquelyReferenced_nonNull_native;
      }
      v12[2] = v21 + 1;
      unint64_t v22 = &v12[2 * v21];
      v22[4] = v19;
      v22[5] = v18;
      uint64_t v0 = v91;
      uint64_t v1 = v85;
    }
  }
  int64_t v17 = v15 + 5;
  if (v17 >= v84)
  {
LABEL_33:
    uint64_t v23 = v0[41];
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v24 = sub_24E33EFC0((uint64_t)v12);
    swift_bridgeObjectRelease();
    uint64_t v25 = sub_24E33E660(v23, v24);
    uint64_t v26 = v25 + 56;
    uint64_t v27 = -1 << *(unsigned char *)(v25 + 32);
    if (-v27 < 64) {
      uint64_t v28 = ~(-1 << -(char)v27);
    }
    else {
      uint64_t v28 = -1;
    }
    unint64_t v29 = v28 & *(void *)(v25 + 56);
    uint64_t isUniquelyReferenced_nonNull_native = swift_beginAccess();
    int64_t v30 = 0;
    int64_t v31 = (unint64_t)(63 - v27) >> 6;
    int64_t v79 = v31;
    uint64_t v83 = v25;
    uint64_t v80 = v25 + 56;
    while (1)
    {
      while (1)
      {
        if (v29)
        {
          unint64_t v32 = __clz(__rbit64(v29));
          v29 &= v29 - 1;
          unint64_t v33 = v32 | (v30 << 6);
          uint64_t v34 = v91;
        }
        else
        {
          int64_t v35 = v30 + 1;
          uint64_t v34 = v91;
          if (__OFADD__(v30, 1)) {
            goto LABEL_77;
          }
          if (v35 >= v31)
          {
LABEL_70:
            swift_release();
            swift_release();
            uint64_t v66 = v91[42];
            uint64_t v67 = v91[29];
            uint64_t v68 = (void *)swift_task_alloc();
            v91[43] = v68;
            *uint64_t v68 = v91;
            v68[1] = sub_24E33C4DC;
            uint64_t v10 = v91[31];
            uint64_t isUniquelyReferenced_nonNull_native = (uint64_t)v77;
            uint64_t v8 = v67;
            uint64_t v9 = v66;
            return MEMORY[0x270FA1F68](isUniquelyReferenced_nonNull_native, v8, v9, v10);
          }
          unint64_t v36 = *(void *)(v26 + 8 * v35);
          ++v30;
          if (!v36)
          {
            int64_t v30 = v35 + 1;
            if (v35 + 1 >= v31) {
              goto LABEL_70;
            }
            unint64_t v36 = *(void *)(v26 + 8 * v30);
            if (!v36)
            {
              int64_t v30 = v35 + 2;
              if (v35 + 2 >= v31) {
                goto LABEL_70;
              }
              unint64_t v36 = *(void *)(v26 + 8 * v30);
              if (!v36)
              {
                int64_t v37 = v35 + 3;
                if (v37 >= v31) {
                  goto LABEL_70;
                }
                unint64_t v36 = *(void *)(v26 + 8 * v37);
                if (!v36)
                {
                  while (1)
                  {
                    int64_t v30 = v37 + 1;
                    if (__OFADD__(v37, 1)) {
                      goto LABEL_78;
                    }
                    if (v30 >= v31) {
                      goto LABEL_70;
                    }
                    unint64_t v36 = *(void *)(v26 + 8 * v30);
                    ++v37;
                    if (v36) {
                      goto LABEL_53;
                    }
                  }
                }
                int64_t v30 = v37;
              }
            }
          }
LABEL_53:
          unint64_t v29 = (v36 - 1) & v36;
          unint64_t v33 = __clz(__rbit64(v36)) + (v30 << 6);
        }
        uint64_t v38 = (uint64_t *)(*(void *)(v25 + 48) + 16 * v33);
        uint64_t v39 = *v38;
        unint64_t v40 = v38[1];
        uint64_t v41 = *(void *)(v34[29] + 160);
        uint64_t v42 = *(void *)(v41 + 16);
        swift_bridgeObjectRetain();
        if (v42) {
          break;
        }
LABEL_59:
        if (qword_26B1B58B8 != -1) {
          swift_once();
        }
        uint64_t v52 = sub_24E35FD10();
        __swift_project_value_buffer(v52, (uint64_t)qword_26B1B5898);
        swift_bridgeObjectRetain_n();
        uint64_t v53 = sub_24E35FCF0();
        os_log_type_t v54 = sub_24E360020();
        if (os_log_type_enabled(v53, v54))
        {
          int64_t v90 = v30;
          uint64_t v55 = swift_slowAlloc();
          uint64_t v56 = v25;
          int64_t v57 = v31;
          uint64_t v58 = v26;
          unint64_t v59 = v29;
          uint64_t v60 = swift_slowAlloc();
          uint64_t v92 = v60;
          *(_DWORD *)uint64_t v55 = 136446210;
          swift_bridgeObjectRetain();
          *(void *)(v55 + 4) = sub_24E32C6BC(v39, v40, &v92);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24E31F000, v53, v54, "Received alarm event for stream%{public}s with no subscribers!", (uint8_t *)v55, 0xCu);
          swift_arrayDestroy();
          uint64_t v61 = v60;
          unint64_t v29 = v59;
          uint64_t v26 = v58;
          int64_t v31 = v57;
          uint64_t v25 = v56;
          MEMORY[0x25333A4C0](v61, -1, -1);
          uint64_t v62 = v55;
          int64_t v30 = v90;
          MEMORY[0x25333A4C0](v62, -1, -1);

          uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v43 = sub_24E32CD14(v39, v40);
      if ((v44 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_59;
      }
      unint64_t v87 = v29;
      int64_t v89 = v30;
      uint64_t v45 = v34;
      uint64_t v46 = v34[30];
      uint64_t v47 = *(void *)(*(void *)(v41 + 56) + 8 * v43);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v48 = sub_24E35FF00();
      uint64_t v49 = *(void *)(v48 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(v46, 1, 1, v48);
      uint64_t v50 = (void *)swift_allocObject();
      v50[2] = 0;
      v50[3] = 0;
      v50[4] = v81;
      v50[5] = v47;
      v50[6] = v39;
      v50[7] = v40;
      LODWORD(v46) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v46, 1, v48);
      swift_bridgeObjectRetain();
      swift_retain();
      uint64_t v51 = v45[30];
      if (v46 == 1)
      {
        sub_24E32D33C(v45[30], &qword_26B1B6810);
      }
      else
      {
        sub_24E35FEF0();
        (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v51, v48);
      }
      uint64_t v25 = v83;
      if (v50[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v63 = sub_24E35FEC0();
        uint64_t v65 = v64;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v63 = 0;
        uint64_t v65 = 0;
      }
      int64_t v31 = v79;
      uint64_t v26 = v80;
      if (v65 | v63)
      {
        void *v78 = 0;
        v78[1] = 0;
        v91[4] = v63;
        v91[5] = v65;
      }
      int64_t v30 = v89;
      swift_task_create();
      swift_bridgeObjectRelease();
      uint64_t isUniquelyReferenced_nonNull_native = swift_release();
      unint64_t v29 = v87;
    }
  }
  unint64_t v16 = *(void *)(v82 + 8 * v17);
  if (v16)
  {
    int64_t v11 = v17;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= v84) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v82 + 8 * v11);
    ++v17;
    if (v16) {
      goto LABEL_24;
    }
  }
LABEL_79:
  __break(1u);
  return MEMORY[0x270FA1F68](isUniquelyReferenced_nonNull_native, v8, v9, v10);
}

uint64_t sub_24E33CF2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[16] = a6;
  v7[17] = a7;
  v7[14] = a4;
  v7[15] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8DB0);
  v7[18] = v8;
  v7[19] = *(void *)(v8 - 8);
  v7[20] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5990);
  v7[21] = v9;
  v7[22] = *(void *)(v9 - 8);
  v7[23] = swift_task_alloc();
  if (qword_26B1B63C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v10 = qword_26B1B63B8;
  return MEMORY[0x270FA2498](sub_24E33D0A0, v10, 0);
}

uint64_t sub_24E33D0A0(uint64_t (*a1)(), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = qword_26B1B63E8;
  *(void *)(v3 + 192) = qword_26B1B63E8;
  if (v4)
  {
    swift_retain();
    a1 = sub_24E33D120;
    a2 = v4;
    a3 = 0;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA2498](a1, a2, a3);
}

uint64_t sub_24E33D120()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 192) + 128);
  *(void *)(v0 + 200) = v1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_24E33D198, v1, 0);
}

uint64_t sub_24E33D198()
{
  uint64_t v1 = v0[25];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  v0[26] = v2;
  uint64_t v3 = *(void *)(v2 + 16);
  v0[27] = v3;
  if (!v3)
  {
LABEL_10:
    swift_release();
    swift_release();
    return MEMORY[0x270FA2498](sub_24E33D45C, 0, 0);
  }
  swift_bridgeObjectRetain();
  swift_beginAccess();
  for (uint64_t i = 0; ; uint64_t i = v0[28] + 1)
  {
    v0[28] = i;
    uint64_t v5 = v0[25];
    uint64_t v6 = v0[26] + 16 * i;
    v0[29] = *(void *)(v6 + 32);
    uint64_t v7 = *(void *)(v6 + 40);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
    swift_unknownObjectRetain();
    uint64_t v10 = v9(ObjectType, v7);
    uint64_t v12 = v11;
    v0[30] = v11;
    if (!*(void *)(*(void *)(v5 + 128) + 16)) {
      goto LABEL_6;
    }
    uint64_t v13 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E32CD14(v13, v12);
    if (v14) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v15 = v0[28];
    uint64_t v16 = v0[27];
    swift_unknownObjectRelease();
    if (v15 + 1 == v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  uint64_t v17 = v0[25];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E33F400((unint64_t *)&qword_26B1B67F0, 255, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
  uint64_t v18 = (void *)swift_task_alloc();
  v0[31] = v18;
  v18[2] = v17;
  v18[3] = v13;
  v18[4] = v12;
  uint64_t v19 = (void *)swift_task_alloc();
  v0[32] = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_24E33D634;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_24E33D45C()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  sub_24E35FB20();
  sub_24E35FB00();
  v0[13] = v2;
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A20);
  swift_task_localValuePush();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v0[22];
    uint64_t v17 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
    unint64_t v5 = v0[15] + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v16 = *(void *)(v4 + 72);
    uint64_t v15 = (void (**)(uint64_t, uint64_t))(v0[19] + 8);
    uint64_t v6 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v7 = v0[23];
      uint64_t v9 = v0[20];
      uint64_t v8 = v0[21];
      uint64_t v11 = v0[17];
      uint64_t v10 = v0[18];
      uint64_t v12 = v0[16];
      v17(v7, v5, v8);
      v0[11] = v12;
      v0[12] = v11;
      swift_bridgeObjectRetain();
      sub_24E35FF20();
      (*v15)(v9, v10);
      (*v6)(v7, v8);
      v5 += v16;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_localValuePop();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_24E33D634()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 264) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 200);
    uint64_t v4 = sub_24E33D9D0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 200);
    swift_task_dealloc();
    uint64_t v4 = sub_24E33D75C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E33D75C()
{
  while (1)
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = v0[28];
    uint64_t v2 = v0[27];
    swift_unknownObjectRelease();
    if (v1 + 1 == v2) {
      break;
    }
    uint64_t v3 = v0[28] + 1;
    v0[28] = v3;
    uint64_t v4 = v0[25];
    uint64_t v5 = v0[26] + 16 * v3;
    v0[29] = *(void *)(v5 + 32);
    uint64_t v6 = *(void *)(v5 + 40);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
    swift_unknownObjectRetain();
    uint64_t v9 = v8(ObjectType, v6);
    uint64_t v11 = v10;
    v0[30] = v10;
    if (*(void *)(*(void *)(v4 + 128) + 16))
    {
      uint64_t v12 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E32CD14(v12, v11);
      if (v13)
      {
        uint64_t v14 = v0[25];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24E33F400((unint64_t *)&qword_26B1B67F0, 255, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
        uint64_t v15 = (void *)swift_task_alloc();
        v0[31] = v15;
        v15[2] = v14;
        v15[3] = v12;
        v15[4] = v11;
        uint64_t v16 = (void *)swift_task_alloc();
        v0[32] = v16;
        *uint64_t v16 = v0;
        v16[1] = sub_24E33D634;
        return MEMORY[0x270FA2360]();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](sub_24E33D45C, 0, 0);
}

uint64_t sub_24E33D9D0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 192);
  return MEMORY[0x270FA2498](sub_24E33DA60, v1, 0);
}

uint64_t sub_24E33DA60()
{
  swift_release();
  return MEMORY[0x270FA2498](sub_24E33DAC8, 0, 0);
}

uint64_t sub_24E33DAC8()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t XPCAlarmEventHandler.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t XPCAlarmEventHandler.__deallocating_deinit()
{
  XPCAlarmEventHandler.deinit();

  return MEMORY[0x270FA2418](v0);
}

uint64_t XPCAlarmEventHandler.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E33DBD0()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B58E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B58E8);
  return sub_24E35FD00();
}

uint64_t sub_24E33DC4C(uint64_t a1)
{
  return sub_24E33B9F0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_24E33DC58(uint64_t a1)
{
  return sub_24E33BB3C(a1, v1[2], v1[3], v1[4]);
}

uint64_t (*sub_24E33DC64(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_24E33E530(v6);
  v6[10] = sub_24E33DF8C(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_24E33DD10;
}

uint64_t (*sub_24E33DD14(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_24E33E530(v6);
  v6[10] = sub_24E33E100(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_24E33DD10;
}

uint64_t (*sub_24E33DDC0(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_24E33E530(v6);
  v6[10] = sub_24E33E2A0(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_24E33DD10;
}

uint64_t (*sub_24E33DE6C(void *a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_24E33E560(v6);
  v6[10] = sub_24E33E3E8(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_24E33DD10;
}

void sub_24E33DF18(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 72);
  (*(void (**)(void))(*(void *)a1 + 80))();
  swift_bridgeObjectRelease();
  v2(v1, 0);

  free(v1);
}

void (*sub_24E33DF8C(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_24E32CD14(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *uint64_t v10 = v19;
        return sub_24E33E0D4;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_24E35BFD8();
      goto LABEL_7;
    }
    sub_24E35A5FC(v16, a4 & 1);
    unint64_t v20 = sub_24E32CD14(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **, uint64_t))sub_24E360350();
  __break(1u);
  return result;
}

void sub_24E33E0D4(uint64_t **a1, uint64_t a2)
{
}

void (*sub_24E33E100(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_24E32CD14(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *uint64_t v10 = v19;
        return sub_24E33E0D4;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_24E35C00C();
      goto LABEL_7;
    }
    sub_24E35A630(v16, a4 & 1);
    unint64_t v20 = sub_24E32CD14(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **, uint64_t))sub_24E360350();
  __break(1u);
  return result;
}

void sub_24E33E248(uint64_t **a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, void), void (*a4)(uint64_t, void))
{
  uint64_t v4 = *a1;
  sub_24E33E59C(*a1, *((unsigned char *)*a1 + 40), (void *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2], a3, a4);
  swift_bridgeObjectRelease();

  free(v4);
}

void (*sub_24E33E2A0(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_24E32CD14(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *uint64_t v10 = v19;
        return sub_24E33E0D4;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_24E35C3EC();
      goto LABEL_7;
    }
    sub_24E35AB68(v16, a4 & 1);
    unint64_t v20 = sub_24E32CD14(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **, uint64_t))sub_24E360350();
  __break(1u);
  return result;
}

void (*sub_24E33E3E8(void *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t v5 = v4;
  uint64_t v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v4;
  v10[1] = a2;
  uint64_t v11 = *v4;
  unint64_t v13 = sub_24E32CD14(a2, a3);
  *((unsigned char *)v10 + 40) = v12 & 1;
  uint64_t v14 = *(void *)(v11 + 16);
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    char v17 = v12;
    uint64_t v18 = *(void *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if (v17)
      {
LABEL_8:
        uint64_t v19 = *(void *)(*(void *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *uint64_t v10 = v19;
        return sub_24E33E0D4;
      }
LABEL_11:
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_24E35C40C();
      goto LABEL_7;
    }
    sub_24E35AB88(v16, a4 & 1);
    unint64_t v20 = sub_24E32CD14(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      unint64_t v13 = v20;
      v10[4] = v20;
      if (v17) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (void (*)(uint64_t **, uint64_t))sub_24E360350();
  __break(1u);
  return result;
}

uint64_t (*sub_24E33E530(void *a1))()
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_24E33F448;
}

uint64_t (*sub_24E33E560(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000;
  return sub_24E33E590;
}

uint64_t sub_24E33E590(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_24E33E59C(uint64_t *a1, char a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, void), void (*a8)(uint64_t, void))
{
  uint64_t v10 = *a1;
  if (*a1)
  {
    if (a2)
    {
      *(void *)(*(void *)(*a3 + 56) + 8 * a4) = v10;
    }
    else
    {
      a7(a4, a5, a6, v10, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if (a2)
  {
    swift_arrayDestroy();
    a8(a4, *a3);
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_24E33E660(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_24E33E7E8((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_24E33E7E8((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x25333A4C0](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_24E33E7E8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  int64_t v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        char v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        sub_24E3603C0();
        swift_bridgeObjectRetain();
        sub_24E35FDF0();
        uint64_t v20 = sub_24E3603E0();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      uint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_24E360320() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          int64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_24E360320() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    char v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    sub_24E3603C0();
    swift_bridgeObjectRetain();
    sub_24E35FDF0();
    uint64_t v47 = sub_24E3603E0();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_24E360320() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_24E33ED28(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        os_log_type_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_24E360320() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_24E33ED28(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8DB8);
  uint64_t result = sub_24E360130();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    char v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    sub_24E3603C0();
    swift_bridgeObjectRetain();
    sub_24E35FDF0();
    uint64_t result = sub_24E3603E0();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24E33EFC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_24E35FF80();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24E35D288(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t type metadata accessor for XPCAlarmEventHandler()
{
  return self;
}

uint64_t sub_24E33F07C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24E33F0CC(uint64_t a1)
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
  v10[1] = sub_24E322A50;
  return sub_24E33CF2C(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t method lookup function for XPCAlarmEventHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCAlarmEventHandler);
}

uint64_t dispatch thunk of XPCAlarmEventHandler.__allocating_init(eventStreamHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of XPCAlarmEventHandler.asyncStream(name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 296)
                                                          + **(int **)(*(void *)v3 + 296));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_24E322A50;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of XPCAlarmEventHandler.processEvents(with:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 304) + **(int **)(*(void *)v1 + 304));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24E322CD0;
  return v6(a1);
}

uint64_t sub_24E33F400(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t daemon.getter()
{
  if (qword_26B1B63C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = qword_26B1B63B8;
  return MEMORY[0x270FA2498](sub_24E33F4F8, v0, 0);
}

uint64_t sub_24E33F4F8()
{
  uint64_t result = qword_26B1B63E8;
  if (qword_26B1B63E8)
  {
    uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v2 = swift_retain();
    return v3(v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24E33F56C()
{
  uint64_t result = qword_26B1B63E8;
  if (qword_26B1B63E8)
  {
    qword_26B1B63B8 = qword_26B1B63E8;
    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Daemon.shared.getter()
{
  if (qword_26B1B63C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t static Daemon.shared.setter(uint64_t a1)
{
  if (qword_26B1B63C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  qword_26B1B63B8 = a1;
  return swift_release();
}

uint64_t (*static Daemon.shared.modify())()
{
  if (qword_26B1B63C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t Daemon.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Daemon.actorServiceCollection.getter()
{
  return swift_retain();
}

uint64_t Daemon.eventStreamHandler.getter()
{
  return swift_retain();
}

uint64_t Daemon.darwinNotificationHandler.getter()
{
  return swift_retain();
}

uint64_t Daemon.distributedNotificationHandler.getter()
{
  return swift_retain();
}

uint64_t Daemon.xpcAlarmEventHandler.getter()
{
  return swift_retain();
}

uint64_t Daemon.__allocating_init(identifier:profile:services:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a6;
  swift_allocObject();
  unint64_t v15 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2698D8DD0
                                                                                              + dword_2698D8DD0);
  unint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v13;
  void *v13 = v6;
  v13[1] = sub_24E341640;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t Daemon.init(identifier:profile:services:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a6;
  unint64_t v15 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2698D8DD0
                                                                                              + dword_2698D8DD0);
  unint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v13;
  void *v13 = v6;
  v13[1] = sub_24E341640;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t Daemon.__allocating_init(identifier:profile:registerAlarmEvent:services:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 16) = a7;
  swift_allocObject();
  char v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2698D8DE8
                                                                                              + dword_2698D8DE8);
  unint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v15;
  *unint64_t v15 = v7;
  v15[1] = sub_24E33FA58;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_24E33FA58(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_release();
    uint64_t v5 = *(uint64_t (**)(void))(v4 + 8);
    return v5();
  }
  else
  {
    swift_retain();
    swift_release();
    uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v7(a1);
  }
}

uint64_t Daemon.init(identifier:profile:registerAlarmEvent:services:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 16) = a7;
  char v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2698D8DE8
                                                                                              + dword_2698D8DE8);
  unint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v15;
  *unint64_t v15 = v7;
  v15[1] = sub_24E341640;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_24E33FCC0()
{
  *(void *)(v1 + 48) = v0;
  return MEMORY[0x270FA2498](sub_24E33FCE0, v0, 0);
}

uint64_t sub_24E33FCE0()
{
  uint64_t v1 = v0[6];
  v0[5] = MEMORY[0x263F8EE78];
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(v1 + 168) + **(int **)(v1 + 168));
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E33FDB8;
  return v4();
}

uint64_t sub_24E33FDB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48);
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E33FED0, v2, 0);
}

uint64_t sub_24E33FED0()
{
  uint64_t v1 = v0[6];
  sub_24E33FFD8(v0[8]);
  uint64_t v2 = *(void *)(v1 + 128);
  uint64_t v3 = v0[5];
  v0[9] = v2;
  v0[10] = v3;
  return MEMORY[0x270FA2498](sub_24E33FF48, v2, 0);
}

uint64_t sub_24E33FF48()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[6];
  swift_beginAccess();
  *(void *)(v2 + 112) = v1;
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24E321AC4, v3, 0);
}

uint64_t sub_24E33FFD8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_24E33A244(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63F0);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_24E360250();
  __break(1u);
  return result;
}

uint64_t Daemon.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t Daemon.__deallocating_deinit()
{
  Daemon.deinit();

  return MEMORY[0x270FA2418](v0);
}

uint64_t Daemon.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E3401D8()
{
  if (qword_26B1B63C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_24E340250(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Daemon();

  return MEMORY[0x270FA2150](v3, a2);
}

uint64_t sub_24E340288()
{
  return swift_retain();
}

uint64_t sub_24E340290()
{
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_24E322CD0;
  v2[6] = v0;
  return MEMORY[0x270FA2498](sub_24E33FCE0, v0, 0);
}

uint64_t sub_24E340338()
{
  return swift_retain();
}

uint64_t sub_24E340340()
{
  return swift_retain();
}

uint64_t sub_24E340348()
{
  return swift_retain();
}

uint64_t sub_24E340350()
{
  return sub_24E340374();
}

uint64_t sub_24E340374()
{
  uint64_t v0 = type metadata accessor for Daemon();
  uint64_t v1 = sub_24E340FCC(&qword_26B1B63D8);
  sub_24E3602D0();
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  MEMORY[0x253339D10](v0, v1);
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  swift_bridgeObjectRetain();
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  return 60;
}

uint64_t sub_24E34048C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v8 = v6;
  *(void *)(v7 + 16) = v8;
  swift_bridgeObjectRelease();
  swift_defaultActor_initialize();
  type metadata accessor for ActorServiceCollection();
  uint64_t v13 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v13 + 112) = MEMORY[0x263F8EE78];
  *(unsigned char *)(v13 + 120) = 0;
  uint64_t v14 = MEMORY[0x263F8EE88];
  *(void *)(v13 + 128) = MEMORY[0x263F8EE80];
  *(void *)(v13 + 136) = v14;
  v8[15] = a2;
  v8[16] = v13;
  v8[14] = a1;
  v8[21] = a5;
  v8[22] = a6;
  sub_24E340FCC(&qword_26B1B63E0);
  swift_bridgeObjectRetain();
  swift_retain();
  static ActorDaemon.enterSandbox(identifier:)(a1, a2);
  swift_bridgeObjectRelease();
  type metadata accessor for XPCEventStreamHandler();
  swift_allocObject();
  char v17 = (uint64_t (*)(uint64_t))((char *)&dword_2698D8F50 + dword_2698D8F50);
  int64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v15;
  *int64_t v15 = v7;
  v15[1] = sub_24E34065C;
  return v17((uint64_t)&unk_270040860);
}

uint64_t sub_24E34065C(uint64_t a1)
{
  uint64_t v3 = *(void **)(*(void *)v1 + 16);
  swift_task_dealloc();
  v3[17] = a1;
  type metadata accessor for DarwinNotificationHandler();
  uint64_t v4 = (void *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  uint64_t v5 = MEMORY[0x263F8EE78];
  v4[15] = sub_24E3271B8(MEMORY[0x263F8EE78]);
  v4[16] = sub_24E3271D4(v5);
  v4[17] = sub_24E3271B8(v5);
  v4[18] = sub_24E3271D4(v5);
  v4[19] = sub_24E3273E8(v5);
  v4[14] = a1;
  v3[18] = v4;
  type metadata accessor for DistributedNotificationHandler();
  uint64_t v6 = (void *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  v6[15] = sub_24E3273F4(v5);
  v6[16] = sub_24E327410(v5);
  v6[17] = sub_24E3273F4(v5);
  v6[18] = sub_24E327410(v5);
  v6[19] = sub_24E32742C(v5);
  v6[14] = a1;
  v3[19] = v6;
  v3[20] = 0;
  return MEMORY[0x270FA2498](sub_24E34085C, v3, 0);
}

uint64_t sub_24E34085C()
{
  qword_26B1B63E8 = *(void *)(v0 + 16);
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  return v1(v2);
}

uint64_t sub_24E3408D0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9 = v7;
  v8[2] = v9;
  swift_bridgeObjectRelease();
  swift_defaultActor_initialize();
  type metadata accessor for ActorServiceCollection();
  uint64_t v15 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v15 + 112) = MEMORY[0x263F8EE78];
  *(unsigned char *)(v15 + 120) = 0;
  uint64_t v16 = MEMORY[0x263F8EE88];
  *(void *)(v15 + 128) = MEMORY[0x263F8EE80];
  *(void *)(v15 + 136) = v16;
  v9[15] = a2;
  v9[16] = v15;
  v9[14] = a1;
  v9[21] = a6;
  v9[22] = a7;
  sub_24E340FCC(&qword_26B1B63E0);
  swift_bridgeObjectRetain();
  swift_retain();
  static ActorDaemon.enterSandbox(identifier:)(a1, a2);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5DD8);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_24E361C50;
  *(void *)(v17 + 32) = 0xD00000000000001ALL;
  *(void *)(v17 + 40) = 0x800000024E362170;
  *(void *)(v17 + 48) = 0xD00000000000001CLL;
  *(void *)(v17 + 56) = 0x800000024E362190;
  if (a5)
  {
    if (qword_26B1B5890 == -1)
    {
      unint64_t v18 = 2;
      unint64_t v19 = 4;
    }
    else
    {
      swift_once();
      unint64_t v18 = *(void *)(v17 + 16);
      unint64_t v19 = *(void *)(v17 + 24);
    }
    uint64_t v21 = qword_26B1B6818;
    uint64_t v20 = unk_26B1B6820;
    swift_bridgeObjectRetain();
    if (v18 >= v19 >> 1) {
      uint64_t v17 = (uint64_t)sub_24E339FFC((void *)(v19 > 1), v18 + 1, 1, (void *)v17);
    }
    *(void *)(v17 + 16) = v18 + 1;
    unint64_t v22 = v17 + 16 * v18;
    *(void *)(v22 + 32) = v21;
    *(void *)(v22 + 40) = v20;
  }
  v8[3] = v17;
  type metadata accessor for XPCEventStreamHandler();
  swift_allocObject();
  unint64_t v25 = (uint64_t (*)(uint64_t))((char *)&dword_2698D8F50 + dword_2698D8F50);
  swift_bridgeObjectRetain();
  unint64_t v23 = (void *)swift_task_alloc();
  v8[4] = v23;
  void *v23 = v8;
  v23[1] = sub_24E340B9C;
  return v25(v17);
}

uint64_t sub_24E340B9C(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 16);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v4[17] = a1;
  type metadata accessor for DarwinNotificationHandler();
  uint64_t v5 = (void *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  uint64_t v6 = MEMORY[0x263F8EE78];
  v5[15] = sub_24E3271B8(MEMORY[0x263F8EE78]);
  v5[16] = sub_24E3271D4(v6);
  v5[17] = sub_24E3271B8(v6);
  v5[18] = sub_24E3271D4(v6);
  v5[19] = sub_24E3273E8(v6);
  v5[14] = a1;
  v4[18] = v5;
  type metadata accessor for DistributedNotificationHandler();
  uint64_t v7 = (void *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  v7[15] = sub_24E3273F4(v6);
  v7[16] = sub_24E327410(v6);
  v7[17] = sub_24E3273F4(v6);
  v7[18] = sub_24E327410(v6);
  v7[19] = sub_24E32742C(v6);
  v7[14] = a1;
  v4[19] = v7;
  if (qword_26B1B5890 != -1) {
    swift_once();
  }
  char v8 = sub_24E34686C(qword_26B1B6818, unk_26B1B6820, *(void **)(v3 + 24));
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v3 + 16);
  if (v8)
  {
    uint64_t v10 = v4[17];
    type metadata accessor for XPCAlarmEventHandler();
    uint64_t v11 = (void *)swift_allocObject();
    swift_retain();
    swift_defaultActor_initialize();
    v11[14] = v6;
    v11[16] = sub_24E327438(v6);
    v11[17] = sub_24E327454(v6);
    v11[18] = sub_24E327438(v6);
    v11[19] = sub_24E327454(v6);
    v11[20] = sub_24E327470(v6);
    v11[15] = v10;
    *(void *)(v9 + 160) = v11;
    uint64_t v12 = sub_24E34085C;
  }
  else
  {
    *(void *)(v9 + 160) = 0;
    uint64_t v12 = sub_24E341644;
  }
  return MEMORY[0x270FA2498](v12, v9, 0);
}

uint64_t sub_24E340EA4()
{
  return sub_24E340FCC(&qword_26B1B63C8);
}

uint64_t type metadata accessor for Daemon()
{
  return self;
}

uint64_t sub_24E340EFC(uint64_t a1)
{
  uint64_t result = sub_24E340FCC(&qword_26B1B63E0);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24E340F40(void *a1)
{
  a1[1] = sub_24E340FCC(&qword_26B1B63D8);
  a1[2] = sub_24E340FCC(&qword_26B1B63C8);
  uint64_t result = sub_24E340FCC(&qword_26B1B63D0);
  a1[3] = result;
  return result;
}

uint64_t sub_24E340FCC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Daemon();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for Daemon(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Daemon);
}

uint64_t dispatch thunk of Daemon.__allocating_init(identifier:profile:services:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 + 144)
                                                                                     + **(int **)(v6 + 144));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v14;
  *uint64_t v14 = v7;
  v14[1] = sub_24E341648;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of Daemon.__allocating_init(identifier:profile:registerAlarmEvent:services:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 + 152)
                                                                                              + **(int **)(v7 + 152));
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v16;
  *uint64_t v16 = v8;
  v16[1] = sub_24E34127C;
  return v18(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_24E34127C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of Daemon.populateServices()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 160) + **(int **)(*(void *)v0 + 160));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E322A50;
  return v4();
}

uint64_t sub_24E341470()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for Daemon.Error()
{
  return sub_24E341488();
}

uint64_t sub_24E341488()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s19FindMyDaemonSupport6DaemonC5ErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24E341470();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Daemon.Error(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24E341470();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_24E341488();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Daemon.Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24E341488();
  return a1;
}

uint64_t getEnumTagSinglePayload for Daemon.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Daemon.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24E34161C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24E341624(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Daemon.Error()
{
  return &type metadata for Daemon.Error;
}

uint64_t ActorDaemon.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t ActorDaemon.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  sub_24E3602D0();
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  MEMORY[0x253339D10](a1, v4);
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  sub_24E35FE00();
  swift_bridgeObjectRelease();
  sub_24E35FE00();
  return 60;
}

uint64_t dispatch thunk of ActorDaemon.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ActorDaemon.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ActorDaemon.eventStreamHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ActorDaemon.darwinNotificationHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ActorDaemon.distributedNotificationHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of ActorDaemon.startup()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 72) + **(int **)(a2 + 72));
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_24E322CD0;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorDaemon.initialLaunchProcessing()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 80) + **(int **)(a2 + 80));
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_24E322CD0;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorDaemon.migrate(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 88) + **(int **)(a4 + 88));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_24E322CD0;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ActorDaemon.firstLaunchSinceReboot()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 96) + **(int **)(a2 + 96));
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_24E322A50;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorDaemon.run()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 104) + **(int **)(a2 + 104));
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_24E322A50;
  return v7(a1, a2);
}

uint64_t sub_24E341C98()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B6880);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B6880);
  return sub_24E35FD00();
}

uint64_t sub_24E341D0C()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_2698DA660);
  __swift_project_value_buffer(v0, (uint64_t)qword_2698DA660);
  return sub_24E35FD00();
}

uint64_t sub_24E341D78()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B5B40);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5B40);
  if (qword_26B1B5B10 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B6868);
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_24E341E40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 112);
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return sub_24E336CDC(v3);
}

uint64_t sub_24E341E54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 128);
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return sub_24E336CDC(v3);
}

uint64_t sub_24E341E68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 144);
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;
  return sub_24E336CDC(v3);
}

uint64_t sub_24E341E7C()
{
  sub_24E345894();

  return swift_bridgeObjectRetain();
}

uint64_t sub_24E341EA4(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 160) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E341EEC(uint64_t a1, uint64_t a2)
{
  sub_24E3458C8(a1);
  uint64_t v5 = *(void *)(v2 + 112);
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;

  return sub_24E336CDC(v5);
}

uint64_t sub_24E341F34(uint64_t a1, uint64_t a2)
{
  sub_24E3458C8(a1);
  uint64_t v5 = *(void *)(v2 + 128);
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;

  return sub_24E336CDC(v5);
}

uint64_t sub_24E341F7C(uint64_t a1, uint64_t a2)
{
  sub_24E3458C8(a1);
  uint64_t v5 = *(void *)(v2 + 144);
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = a2;

  return sub_24E336CDC(v5);
}

uint64_t XPCClientConnectionPool.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  XPCClientConnectionPool.init()();
  return v0;
}

uint64_t XPCClientConnectionPool.init()()
{
  swift_defaultActor_initialize();
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(void *)(v0 + 160) = sub_24E35FD50();
  return v0;
}

uint64_t sub_24E342068(uint64_t a1, uint64_t a2)
{
  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  v3[14] = *v2;
  return MEMORY[0x270FA2498](sub_24E3420B4, v2, 0);
}

uint64_t sub_24E3420B4()
{
  uint64_t v1 = v0[13];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 160);
  if ((v2 & 0xC000000000000001) == 0)
  {
    uint64_t v13 = -1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = ~v13;
    uint64_t v4 = v2 + 56;
    uint64_t v14 = *(void *)(v2 + 56);
    uint64_t v15 = -v13;
    v0[16] = v2 + 56;
    v0[17] = v6;
    if (v15 < 64) {
      uint64_t v16 = ~(-1 << v15);
    }
    else {
      uint64_t v16 = -1;
    }
    unint64_t v7 = v16 & v14;
    v0[15] = v2;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  sub_24E3600E0();
  sub_24E35FFD0();
  uint64_t result = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  unint64_t v7 = v0[6];
  v0[16] = v4;
  v0[17] = v6;
  v0[15] = result;
  if ((result & 0x8000000000000000) == 0)
  {
    if (v7)
    {
LABEL_4:
      uint64_t v8 = (v7 - 1) & v7;
      unint64_t v9 = __clz(__rbit64(v7)) | (v5 << 6);
      uint64_t v10 = v5;
LABEL_5:
      uint64_t v11 = *(void *)(*(void *)(result + 48) + 8 * v9);
      swift_unknownObjectRetain();
      goto LABEL_6;
    }
LABEL_14:
    int64_t v17 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      return result;
    }
    int64_t v18 = (unint64_t)(v6 + 64) >> 6;
    if (v17 >= v18) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v4 + 8 * v17);
    uint64_t v10 = v5 + 1;
    if (!v19)
    {
      uint64_t v10 = v5 + 2;
      if (v5 + 2 >= v18) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v4 + 8 * v10);
      if (!v19)
      {
        uint64_t v10 = v5 + 3;
        if (v5 + 3 >= v18) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v4 + 8 * v10);
        if (!v19)
        {
          uint64_t v20 = v5 + 4;
          while (v18 != v20)
          {
            unint64_t v19 = *(void *)(v4 + 8 * v20++);
            if (v19)
            {
              uint64_t v10 = v20 - 1;
              goto LABEL_17;
            }
          }
          goto LABEL_28;
        }
      }
    }
LABEL_17:
    uint64_t v8 = (v19 - 1) & v19;
    unint64_t v9 = __clz(__rbit64(v19)) + (v10 << 6);
    goto LABEL_5;
  }
  if (!sub_24E3600F0()) {
    goto LABEL_28;
  }
  sub_24E360310();
  swift_unknownObjectRelease();
  uint64_t v11 = v0[10];
  uint64_t v10 = v5;
  uint64_t v8 = v7;
LABEL_6:
  v0[19] = v10;
  v0[20] = v8;
  v0[18] = v11;
  if (v11)
  {
    unint64_t v22 = (uint64_t (*)(uint64_t))(v0[11] + *(int *)v0[11]);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[21] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_24E34238C;
    return v22(v11);
  }
LABEL_28:
  sub_24E338370();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_24E34238C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 104);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E34249C, v1, 0);
}

uint64_t sub_24E34249C()
{
  uint64_t result = swift_unknownObjectRelease();
  uint64_t v2 = v0[19];
  unint64_t v3 = v0[20];
  uint64_t v4 = v0[15];
  if (v4 < 0)
  {
    if (!sub_24E3600F0()) {
      goto LABEL_23;
    }
    sub_24E360310();
    swift_unknownObjectRelease();
    uint64_t v8 = v0[10];
    uint64_t v7 = v2;
    uint64_t v5 = v3;
  }
  else
  {
    if (v3)
    {
      uint64_t v5 = (v3 - 1) & v3;
      unint64_t v6 = __clz(__rbit64(v3)) | (v2 << 6);
      uint64_t v7 = v0[19];
    }
    else
    {
      int64_t v10 = v2 + 1;
      if (__OFADD__(v2, 1))
      {
        __break(1u);
        return result;
      }
      int64_t v11 = (unint64_t)(v0[17] + 64) >> 6;
      if (v10 >= v11) {
        goto LABEL_23;
      }
      uint64_t v12 = v0[16];
      unint64_t v13 = *(void *)(v12 + 8 * v10);
      uint64_t v7 = v2 + 1;
      if (!v13)
      {
        uint64_t v7 = v2 + 2;
        if (v2 + 2 >= v11) {
          goto LABEL_23;
        }
        unint64_t v13 = *(void *)(v12 + 8 * v7);
        if (!v13)
        {
          uint64_t v7 = v2 + 3;
          if (v2 + 3 >= v11) {
            goto LABEL_23;
          }
          unint64_t v13 = *(void *)(v12 + 8 * v7);
          if (!v13)
          {
            uint64_t v14 = v2 + 4;
            while (v11 != v14)
            {
              unint64_t v13 = *(void *)(v12 + 8 * v14++);
              if (v13)
              {
                uint64_t v7 = v14 - 1;
                goto LABEL_14;
              }
            }
            goto LABEL_23;
          }
        }
      }
LABEL_14:
      uint64_t v5 = (v13 - 1) & v13;
      unint64_t v6 = __clz(__rbit64(v13)) + (v7 << 6);
    }
    uint64_t v8 = *(void *)(*(void *)(v4 + 48) + 8 * v6);
    swift_unknownObjectRetain();
  }
  v0[19] = v7;
  v0[20] = v5;
  v0[18] = v8;
  if (v8)
  {
    uint64_t v16 = (uint64_t (*)(uint64_t))(v0[11] + *(int *)v0[11]);
    unint64_t v9 = (void *)swift_task_alloc();
    v0[21] = v9;
    *unint64_t v9 = v0;
    v9[1] = sub_24E34238C;
    return v16(v8);
  }
LABEL_23:
  sub_24E338370();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24E3426E4()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char v0 = sub_24E35FFC0();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_24E34277C()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_24E35FF90();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24E342814(uint64_t a1)
{
  v2[15] = a1;
  v2[16] = v1;
  v2[17] = *v1;
  return MEMORY[0x270FA2498](sub_24E34285C, v1, 0);
}

uint64_t sub_24E34285C()
{
  uint64_t v1 = (void *)v0[15];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5AB0);
  uint64_t v2 = swift_allocObject();
  v0[18] = v2;
  *(void *)(v2 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5AB8);
  uint64_t v3 = swift_allocObject();
  v0[19] = v3;
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  uint64_t v4 = objc_msgSend(v1, sel_invalidationHandler);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v4 = (void *)swift_allocObject();
    v4[2] = sub_24E345A98;
    v4[3] = v6;
    uint64_t v7 = sub_24E345AE0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v0[16];
  uint64_t v9 = v0[17];
  int64_t v10 = (void *)v0[15];
  *(void *)(v3 + 16) = v7;
  *(void *)(v3 + 24) = v4;
  sub_24E336CDC(0);
  *(void *)(v2 + 16) = v10;
  swift_beginAccess();
  v0[12] = *(void *)(v8 + 160);
  int64_t v11 = (void *)swift_task_alloc();
  v0[20] = v11;
  uint64_t v12 = *(void *)(v9 + 80);
  v0[21] = v12;
  v11[2] = v12;
  uint64_t v13 = *(void *)(v9 + 88);
  v0[22] = v13;
  v11[3] = v13;
  v11[4] = v10;
  swift_bridgeObjectRetain();
  id v14 = v10;
  uint64_t v15 = (void *)swift_task_alloc();
  v0[23] = v15;
  uint64_t v16 = sub_24E35FFE0();
  uint64_t WitnessTable = swift_getWitnessTable();
  *uint64_t v15 = v0;
  v15[1] = sub_24E342AA0;
  return MEMORY[0x270F28E88](v0 + 11, &unk_2698D8E60, v11, v16, WitnessTable);
}

uint64_t sub_24E342AA0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 128);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24E342BF0, v1, 0);
}

uint64_t sub_24E342BF0()
{
  uint64_t v1 = v0[11];
  if (v1)
  {
    if (qword_26B1B55C8 != -1) {
      swift_once();
    }
    uint64_t v2 = (void *)v0[15];
    uint64_t v3 = sub_24E35FD10();
    __swift_project_value_buffer(v3, (uint64_t)qword_26B1B5B40);
    id v4 = v2;
    uint64_t v5 = sub_24E35FCF0();
    os_log_type_t v6 = sub_24E35FFF0();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = v0[15];
    if (v7)
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      int64_t v10 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      v0[14] = v8;
      int64_t v11 = v8;
      sub_24E3600B0();
      *int64_t v10 = v8;

      _os_log_impl(&dword_24E31F000, v5, v6, "Already have a session for %@", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5520);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v10, -1, -1);
      MEMORY[0x25333A4C0](v9, -1, -1);
      swift_release();
      swift_release();
    }
    else
    {

      swift_release();
      swift_release();

      uint64_t v5 = v8;
    }

    uint64_t v17 = (uint64_t (*)(uint64_t))v0[1];
    return v17(v1);
  }
  else
  {
    uint64_t v12 = (void *)v0[15];
    swift_getAssociatedTypeWitness();
    sub_24E35FC10();
    id v13 = v12;
    uint64_t v14 = sub_24E35FC00();
    v0[24] = v14;
    if (v14)
    {
      uint64_t v15 = v14;
      swift_retain();
      uint64_t v16 = (void *)swift_task_alloc();
      v0[25] = v16;
      *uint64_t v16 = v0;
      v16[1] = sub_24E3430D8;
      return MEMORY[0x270F28D30](v15);
    }
    else
    {
      if (qword_26B1B55C8 != -1) {
        swift_once();
      }
      int64_t v18 = (void *)v0[15];
      uint64_t v19 = sub_24E35FD10();
      __swift_project_value_buffer(v19, (uint64_t)qword_26B1B5B40);
      id v20 = v18;
      uint64_t v21 = sub_24E35FCF0();
      os_log_type_t v22 = sub_24E360010();
      BOOL v23 = os_log_type_enabled(v21, v22);
      char v24 = (void *)v0[15];
      if (v23)
      {
        unint64_t v25 = (uint8_t *)swift_slowAlloc();
        uint64_t v26 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v25 = 138412290;
        v0[13] = v24;
        id v27 = v24;
        sub_24E3600B0();
        *uint64_t v26 = v24;

        _os_log_impl(&dword_24E31F000, v21, v22, "Failed to make XPCSession from %@", v25, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5520);
        swift_arrayDestroy();
        MEMORY[0x25333A4C0](v26, -1, -1);
        MEMORY[0x25333A4C0](v25, -1, -1);
      }
      else
      {

        uint64_t v21 = v0[15];
      }

      type metadata accessor for XPCClientConnectionPool.Error();
      swift_getWitnessTable();
      swift_allocError();
      swift_willThrow();
      swift_release();
      swift_release();
      uint64_t v28 = (uint64_t (*)(void))v0[1];
      return v28();
    }
  }
}

uint64_t sub_24E3430D8(uint64_t a1)
{
  id v4 = (void *)*v2;
  v4[26] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[16];
  if (v1)
  {
    os_log_type_t v6 = sub_24E343580;
  }
  else
  {
    v4[27] = a1;
    os_log_type_t v6 = sub_24E343214;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24E343214()
{
  uint64_t v2 = v0[18];
  uint64_t v1 = v0[19];
  uint64_t v3 = (void *)v0[15];
  uint64_t v4 = swift_allocObject();
  long long v10 = *(_OWORD *)(v0 + 21);
  swift_weakInit();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = v10;
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v2;
  *(void *)(v5 + 48) = v1;
  v0[6] = sub_24E345A38;
  v0[7] = v5;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_24E343BE4;
  v0[5] = &block_descriptor_1;
  os_log_type_t v6 = _Block_copy(v0 + 2);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_setInvalidationHandler_, v6);
  _Block_release(v6);
  BOOL v7 = (void *)swift_task_alloc();
  v0[28] = v7;
  void *v7 = v0;
  v7[1] = sub_24E3433F4;
  uint64_t v8 = (void *)v0[16];
  v7[18] = v0[27];
  v7[19] = v8;
  v7[20] = *v8;
  return MEMORY[0x270FA2498](sub_24E343C70, v8, 0);
}

uint64_t sub_24E3433F4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 128);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E343504, v1, 0);
}

uint64_t sub_24E343504()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 216);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24E343580()
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E3435F8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a2;
  v4[3] = a3;
  uint64_t v5 = *a1;
  v4[4] = a4;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_24E343620, 0, 0);
}

uint64_t sub_24E343620()
{
  v0[6] = sub_24E3462E8();
  v0[7] = sub_24E35FB90();
  uint64_t v3 = (uint64_t (*)(void))((int)*MEMORY[0x263F3CA00] + MEMORY[0x263F3CA00]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E3436F0;
  return v3();
}

uint64_t sub_24E3436F0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 72) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24E34645C, 0, 0);
}

uint64_t sub_24E343810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v5 - 8);
  BOOL v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = sub_24E35FF00();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = a2;
    v11[5] = v9;
    v11[6] = a3;
    swift_retain();
    swift_retain();
    sub_24E346460((uint64_t)v7, (uint64_t)&unk_2698D8F38, (uint64_t)v11);
    return swift_release();
  }
  return result;
}

uint64_t sub_24E343958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return MEMORY[0x270FA2498](sub_24E34397C, 0, 0);
}

uint64_t sub_24E34397C()
{
  uint64_t v1 = *(void **)(v0[2] + 16);
  v0[5] = v1;
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[6] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_24E343A5C;
    return sub_24E344168((uint64_t)v2);
  }
  else
  {
    uint64_t v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_24E343A5C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E343B58, 0, 0);
}

uint64_t sub_24E343B58()
{
  uint64_t v1 = *(void (**)(uint64_t))(*(void *)(v0 + 32) + 16);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_24E336CDC((uint64_t)v1);
  }

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_24E343BE4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_24E343C28(uint64_t a1)
{
  v2[18] = a1;
  v2[19] = v1;
  v2[20] = *v1;
  return MEMORY[0x270FA2498](sub_24E343C70, v1, 0);
}

uint64_t sub_24E343C70()
{
  uint64_t v1 = v0[18];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_24E35FF90();
  swift_bridgeObjectRelease();
  v0[14] = v1;
  swift_beginAccess();
  sub_24E35FFE0();
  swift_unknownObjectRetain();
  sub_24E35FFA0();
  swift_endAccess();
  swift_unknownObjectRelease();
  if (qword_26B1B55C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24E35FD10();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1B5B40);
  swift_retain();
  uint64_t v3 = sub_24E35FCF0();
  os_log_type_t v4 = sub_24E35FFF0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134218240;
    v0[16] = v13;
    sub_24E3600B0();
    *(_WORD *)(v5 + 12) = 2048;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_24E35FF90();
    swift_bridgeObjectRelease();
    v0[17] = v6;
    sub_24E3600B0();
    swift_release();
    _os_log_impl(&dword_24E31F000, v3, v4, "Session count: %ld -> %ld", (uint8_t *)v5, 0x16u);
    MEMORY[0x25333A4C0](v5, -1, -1);
  }
  else
  {
    swift_release();
  }

  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24E35FF90();
  swift_bridgeObjectRelease();
  if (v7 == 1 && (uint64_t v8 = v0[19], v9 = *(int **)(v8 + 112), (v0[21] = v9) != 0))
  {
    v0[22] = *(void *)(v8 + 120);
    sub_24E3458C8((uint64_t)v9);
    uint64_t v14 = (uint64_t (*)(void))((char *)v9 + *v9);
    uint64_t v10 = (void *)swift_task_alloc();
    v0[23] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_24E344040;
    return v14();
  }
  else
  {
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_24E344040()
{
  uint64_t v1 = *(void *)(*v0 + 168);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  sub_24E336CDC(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_24E344168(uint64_t a1)
{
  *(void *)(v2 + 16) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  void *v4 = v2;
  v4[1] = sub_24E344240;
  v4[4] = a1;
  v4[5] = v1;
  v4[6] = *v1;
  return MEMORY[0x270FA2498](sub_24E3445B0, v1, 0);
}

uint64_t sub_24E344240(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  *(void *)(*v1 + 32) = a1;
  swift_task_dealloc();
  if (a1)
  {
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v3 + 40) = v5;
    *uint64_t v5 = v4;
    v5[1] = sub_24E3443F8;
    uint64_t v6 = *(void **)(v3 + 16);
    v5[18] = a1;
    v5[19] = v6;
    v5[20] = *v6;
    return MEMORY[0x270FA2498](sub_24E34490C, v6, 0);
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(v4 + 8);
    return v7();
  }
}

uint64_t sub_24E3443F8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E344508, v1, 0);
}

uint64_t sub_24E344508()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E344568(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  v2[6] = *v1;
  return MEMORY[0x270FA2498](sub_24E3445B0, v1, 0);
}

uint64_t sub_24E3445B0()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_beginAccess();
  *(void *)(v0 + 56) = *(void *)(v1 + 160);
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_24E344638, 0, 0);
}

uint64_t sub_24E344638()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = v0[4];
  v0[3] = v0[7];
  uint64_t v3 = (void *)swift_task_alloc();
  v0[8] = v3;
  v3[2] = *(void *)(v1 + 80);
  v3[3] = *(void *)(v1 + 88);
  v3[4] = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  uint64_t v5 = sub_24E35FFE0();
  uint64_t WitnessTable = swift_getWitnessTable();
  void *v4 = v0;
  v4[1] = sub_24E344770;
  return MEMORY[0x270F28E88](v0 + 2, &unk_2698D8F28, v3, v5, WitnessTable);
}

uint64_t sub_24E344770()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24E3448AC, 0, 0);
}

uint64_t sub_24E3448AC()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_24E3448C4(uint64_t a1)
{
  v2[18] = a1;
  v2[19] = v1;
  v2[20] = *v1;
  return MEMORY[0x270FA2498](sub_24E34490C, v1, 0);
}

uint64_t sub_24E34490C()
{
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  swift_beginAccess();
  v0[21] = *(void *)(v1 + 80);
  v0[22] = *(void *)(*(void *)(v1 + 88) + 8);
  swift_bridgeObjectRetain();
  v0[23] = sub_24E35FF90();
  swift_bridgeObjectRelease();
  v0[14] = v3;
  swift_beginAccess();
  sub_24E35FFE0();
  sub_24E35FFB0();
  swift_endAccess();
  swift_unknownObjectRelease();
  uint64_t v4 = *(int **)(v2 + 144);
  v0[24] = v4;
  if (v4)
  {
    v0[25] = *(void *)(v0[19] + 152);
    sub_24E3458C8((uint64_t)v4);
    os_log_type_t v22 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
    uint64_t v5 = (void *)swift_task_alloc();
    v0[26] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_24E344E2C;
    uint64_t v6 = v0[18];
    return v22(v6);
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char v8 = sub_24E35FFC0();
  swift_bridgeObjectRelease();
  if (qword_26B1B55C8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_24E35FD10();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B1B5B40);
  swift_retain();
  uint64_t v10 = sub_24E35FCF0();
  os_log_type_t v11 = sub_24E35FFF0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = v0[23];
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 134218240;
    v0[16] = v12;
    sub_24E3600B0();
    *(_WORD *)(v13 + 12) = 2048;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_24E35FF90();
    swift_bridgeObjectRelease();
    v0[17] = v14;
    sub_24E3600B0();
    swift_release();
    _os_log_impl(&dword_24E31F000, v10, v11, "Session count: %ld -> %ld", (uint8_t *)v13, 0x16u);
    MEMORY[0x25333A4C0](v13, -1, -1);

    if ((v8 & 1) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
    swift_release();

    if ((v8 & 1) == 0)
    {
LABEL_17:
      uint64_t v21 = (uint64_t (*)(void))v0[1];
      return v21();
    }
  }
  uint64_t v15 = sub_24E35FCF0();
  os_log_type_t v16 = sub_24E35FFF0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_24E31F000, v15, v16, "Final session removed", v17, 2u);
    MEMORY[0x25333A4C0](v17, -1, -1);
  }
  uint64_t v18 = v0[19];

  uint64_t v19 = *(int **)(v18 + 128);
  v0[27] = v19;
  if (!v19) {
    goto LABEL_17;
  }
  v0[28] = *(void *)(v0[19] + 136);
  sub_24E3458C8((uint64_t)v19);
  BOOL v23 = (uint64_t (*)(void))((char *)v19 + *v19);
  id v20 = (void *)swift_task_alloc();
  v0[29] = v20;
  *id v20 = v0;
  v20[1] = sub_24E3452FC;
  return v23();
}

uint64_t sub_24E344E2C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 192);
  uint64_t v2 = *(void *)(*(void *)v0 + 152);
  swift_task_dealloc();
  sub_24E336CDC(v1);
  return MEMORY[0x270FA2498](sub_24E344F78, v2, 0);
}

uint64_t sub_24E344F78()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  char v1 = sub_24E35FFC0();
  swift_bridgeObjectRelease();
  if (qword_26B1B55C8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24E35FD10();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1B5B40);
  swift_retain();
  uint64_t v3 = sub_24E35FCF0();
  os_log_type_t v4 = sub_24E35FFF0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = v0[23];
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 134218240;
    v0[16] = v5;
    sub_24E3600B0();
    *(_WORD *)(v6 + 12) = 2048;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_24E35FF90();
    swift_bridgeObjectRelease();
    v0[17] = v7;
    sub_24E3600B0();
    swift_release();
    _os_log_impl(&dword_24E31F000, v3, v4, "Session count: %ld -> %ld", (uint8_t *)v6, 0x16u);
    MEMORY[0x25333A4C0](v6, -1, -1);

    if ((v1 & 1) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
    swift_release();

    if ((v1 & 1) == 0)
    {
LABEL_13:
      uint64_t v15 = (uint64_t (*)(void))v0[1];
      return v15();
    }
  }
  char v8 = sub_24E35FCF0();
  os_log_type_t v9 = sub_24E35FFF0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_24E31F000, v8, v9, "Final session removed", v10, 2u);
    MEMORY[0x25333A4C0](v10, -1, -1);
  }
  uint64_t v11 = v0[19];

  uint64_t v12 = *(int **)(v11 + 128);
  v0[27] = v12;
  if (!v12) {
    goto LABEL_13;
  }
  v0[28] = *(void *)(v0[19] + 136);
  sub_24E3458C8((uint64_t)v12);
  os_log_type_t v16 = (uint64_t (*)(void))((char *)v12 + *v12);
  uint64_t v13 = (void *)swift_task_alloc();
  v0[29] = v13;
  void *v13 = v0;
  v13[1] = sub_24E3452FC;
  return v16();
}

uint64_t sub_24E3452FC()
{
  uint64_t v1 = *(void *)(*v0 + 216);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  sub_24E336CDC(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t *XPCClientConnectionPool.deinit()
{
  sub_24E336CDC(v0[14]);
  sub_24E336CDC(v0[16]);
  sub_24E336CDC(v0[18]);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t XPCClientConnectionPool.__deallocating_deinit()
{
  XPCClientConnectionPool.deinit();

  return MEMORY[0x270FA2418](v0);
}

uint64_t XPCClientConnectionPool.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E34549C()
{
  return XPCClientConnectionPool.unownedExecutor.getter();
}

uint64_t sub_24E3454B8()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = sub_24E3600A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_24E34557C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a2;
  v4[3] = a3;
  uint64_t v5 = *a1;
  v4[4] = a4;
  v4[5] = v5;
  return MEMORY[0x270FA2498](sub_24E3455A4, 0, 0);
}

uint64_t sub_24E3455A4()
{
  v0[6] = sub_24E3462E8();
  v0[7] = sub_24E35FB90();
  uint64_t v3 = (uint64_t (*)(void))((int)*MEMORY[0x263F3CA00] + MEMORY[0x263F3CA00]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E345674;
  return v3();
}

uint64_t sub_24E345674(uint64_t a1)
{
  *(void *)(*(void *)v1 + 72) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24E345794, 0, 0);
}

uint64_t sub_24E345794()
{
  uint64_t v1 = *(void **)(v0 + 72);
  char v2 = sub_24E360050();

  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3(v2 & 1);
}

uint64_t sub_24E345810()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B6868);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B6868);
  return sub_24E35FD00();
}

uint64_t sub_24E345894()
{
  swift_beginAccess();
  return *(void *)(v0 + 160);
}

uint64_t sub_24E3458C8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_24E3458D8(void *a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_24E341648;
  *(_OWORD *)(v5 + 24) = v6;
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 40) = *a1;
  return MEMORY[0x270FA2498](sub_24E343620, 0, 0);
}

uint64_t type metadata accessor for XPCClientConnectionPool.Error()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E3459B8()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E3459F0()
{
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24E345A38()
{
  return sub_24E343810(v0[4], v0[5], v0[6]);
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

uint64_t sub_24E345A60()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E345A98()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_24E345AA8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E345AE0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_24E345B08@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_24E345894();

  return swift_bridgeObjectRetain();
}

uint64_t sub_24E345B44()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_24E341EA4(v0);
}

uint64_t sub_24E345B70()
{
  return 16;
}

__n128 sub_24E345B7C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24E345B8C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for XPCClientConnectionPool()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t method lookup function for XPCClientConnectionPool(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCClientConnectionPool);
}

uint64_t dispatch thunk of XPCClientConnectionPool.sessions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.sessions.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.sessions.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.setStartProcessing(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.setStopProcessing(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.setRemoveHandler(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.forEach(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 264) + **(int **)(*(void *)v2 + 264));
  long long v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_24E322CD0;
  return v8(a1, a2);
}

uint64_t dispatch thunk of XPCClientConnectionPool.isEmpty.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.count.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.add(connection:)(uint64_t a1)
{
  long long v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 288) + **(int **)(*(void *)v1 + 288));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24E34127C;
  return v6(a1);
}

uint64_t dispatch thunk of XPCClientConnectionPool.remove(connection:)(uint64_t a1)
{
  long long v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 296) + **(int **)(*(void *)v1 + 296));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24E322CD0;
  return v6(a1);
}

uint64_t sub_24E34608C()
{
  uint64_t result = sub_24E3600A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for UnsafeSendableBox()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24E346138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

unsigned char *sub_24E346140(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24E3461DCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24E346204()
{
  return swift_getWitnessTable();
}

uint64_t sub_24E346220(void *a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_24E34127C;
  *(_OWORD *)(v5 + 24) = v6;
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 40) = *a1;
  return MEMORY[0x270FA2498](sub_24E3455A4, 0, 0);
}

unint64_t sub_24E3462E8()
{
  unint64_t result = qword_26B1B55E0;
  if (!qword_26B1B55E0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B1B55E0);
  }
  return result;
}

uint64_t sub_24E346328()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24E346378()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_24E322A50;
  *(void *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return MEMORY[0x270FA2498](sub_24E34397C, 0, 0);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24E346460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24E35FF00();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24E35FEF0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24E32D33C(a1, &qword_26B1B6810);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24E35FEC0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24E34660C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 1;
}

uint64_t sub_24E346638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

uint64_t XPCEventStreamHandler.__allocating_init(streams:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  swift_allocObject();
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2698D8F50 + dword_2698D8F50);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24E346754;
  return v5(a1);
}

uint64_t sub_24E346754(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_24E34686C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_24E360320();
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
    if (v12 || (sub_24E360320() & 1) != 0) {
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

uint64_t sub_24E346934()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B68B0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B68B0);
  if (qword_26B1B67C8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5E00);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_24E3469FC()
{
  BYTE5(qword_26B1B6830) = 0;
  HIWORD(qword_26B1B6830) = -5120;
}

uint64_t XPCEventStreamHandler.init(streams:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_2698D8F50 + dword_2698D8F50);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24E3495F8;
  return v5(a1);
}

uint64_t sub_24E346AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6350);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6340);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_24E328A98((uint64_t)v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_24E346C24(uint64_t result)
{
  uint64_t v31 = *v1;
  uint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return result;
  }
  uint64_t v3 = v1;
  long long v4 = v1 + 17;
  uint64_t v32 = result + 32;
  swift_bridgeObjectRetain();
  swift_beginAccess();
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = (uint64_t *)(v32 + 16 * v5);
    uint64_t v8 = *v6;
    unint64_t v7 = v6[1];
    uint64_t v9 = (void *)*v4;
    uint64_t v10 = *(void *)(*v4 + 16);
    if (!v10) {
      goto LABEL_16;
    }
    BOOL v11 = v9[4] == v8 && v9[5] == v7;
    if (!v11 && (sub_24E360320() & 1) == 0)
    {
      if (v10 == 1) {
        goto LABEL_16;
      }
      if (v9[6] != v8 || v9[7] != v7)
      {
        uint64_t result = sub_24E360320();
        if ((result & 1) == 0) {
          break;
        }
      }
    }
LABEL_11:
    uint64_t v12 = qword_26B1B5DF8;
    swift_bridgeObjectRetain();
    if (v12 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_24E35FD10();
    __swift_project_value_buffer(v13, (uint64_t)qword_26B1B68B0);
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_24E35FCF0();
    os_log_type_t v15 = sub_24E360020();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      aBlock[0] = v17;
      *(_DWORD *)uint64_t v16 = 136446210;
      swift_bridgeObjectRetain();
      *(void *)(v16 + 4) = sub_24E32C6BC(v8, v7, aBlock);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E31F000, v14, v15, "Already registered %{public}s!", (uint8_t *)v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v17, -1, -1);
      MEMORY[0x25333A4C0](v16, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_4:
    if (++v5 == v2) {
      return swift_bridgeObjectRelease();
    }
  }
  if (v10 == 2)
  {
LABEL_16:
    swift_beginAccess();
    uint64_t v18 = (void *)*v4;
    swift_bridgeObjectRetain_n();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    void *v4 = v18;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v18 = sub_24E339FFC(0, v18[2] + 1, 1, v18);
      void *v4 = v18;
    }
    unint64_t v21 = v18[2];
    unint64_t v20 = v18[3];
    if (v21 >= v20 >> 1)
    {
      uint64_t v18 = sub_24E339FFC((void *)(v20 > 1), v21 + 1, 1, v18);
      void *v4 = v18;
    }
    v18[2] = v21 + 1;
    os_log_type_t v22 = &v18[2 * v21];
    v22[4] = v8;
    v22[5] = v7;
    swift_endAccess();
    BOOL v23 = (void *)swift_allocObject();
    v23[2] = v3;
    v23[3] = v8;
    v23[4] = v7;
    v23[5] = v31;
    aBlock[4] = (uint64_t)sub_24E34956C;
    aBlock[5] = (uint64_t)v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24E34788C;
    aBlock[3] = (uint64_t)&block_descriptor_2;
    uint64_t v24 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    uint64_t v25 = sub_24E35FDE0();
    swift_bridgeObjectRelease();
    xpc_set_event_stream_handler((const char *)(v25 + 32), 0, v24);
    swift_release();
    _Block_release(v24);
    goto LABEL_4;
  }
  id v27 = v9 + 9;
  uint64_t v28 = 2;
  while (1)
  {
    uint64_t v29 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (*(v27 - 1) == v8 && *v27 == v7) {
      goto LABEL_11;
    }
    uint64_t result = sub_24E360320();
    if (result) {
      goto LABEL_11;
    }
    v27 += 2;
    ++v28;
    if (v29 == v10) {
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24E347080(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v24 = MEMORY[0x263F8EE80];
  uint64_t v7 = MEMORY[0x25333A600]();
  if (v7 != sub_24E35FD30())
  {
    if (qword_26B1B5DF8 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_24E35FD10();
    __swift_project_value_buffer(v8, (uint64_t)qword_26B1B68B0);
    swift_unknownObjectRetain_n();
    uint64_t v9 = sub_24E35FCF0();
    os_log_type_t v10 = sub_24E360010();
    if (os_log_type_enabled(v9, v10))
    {
      BOOL v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      v22[0] = v12;
      *(_DWORD *)BOOL v11 = 136446210;
      uint64_t v23 = (uint64_t)a1;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2698D9000);
      uint64_t v13 = sub_24E35FDD0();
      uint64_t v23 = sub_24E32C6BC(v13, v14, v22);
      sub_24E3600B0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24E31F000, v9, v10, "Expected XPC_TYPE_DICTIONARY -- got %{public}s!", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v12, -1, -1);
      MEMORY[0x25333A4C0](v11, -1, -1);
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    return swift_bridgeObjectRelease();
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = &v24;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_24E3495A0;
  *(void *)(v16 + 24) = v15;
  v22[4] = (uint64_t)sub_24E3495B8;
  v22[5] = v16;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 1107296256;
  v22[2] = (uint64_t)sub_24E346638;
  v22[3] = (uint64_t)&block_descriptor_35;
  uint64_t v17 = _Block_copy(v22);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a1, v17);
  _Block_release(v17);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    uint64_t v20 = swift_bridgeObjectRetain();
    unint64_t v21 = sub_24E34751C(v20);
    swift_bridgeObjectRelease();
    sub_24E3478EC(v21, a3, a4);
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_24E3473E0(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v5 = MEMORY[0x25333A600](a2);
  if (v5 == sub_24E35FD20() && xpc_string_get_string_ptr(a2))
  {
    uint64_t v10 = sub_24E35FE10();
    uint64_t v12 = v11;
    uint64_t v13 = sub_24E35FE10();
    uint64_t v15 = v14;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *a3;
    *a3 = 0x8000000000000000;
    sub_24E348B3C(v13, v15, v10, v12, isUniquelyReferenced_nonNull_native);
    *a3 = v19;
  }
  else
  {
    uint64_t v6 = sub_24E35FE10();
    uint64_t v8 = v7;
    swift_bridgeObjectRetain();
    char v9 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *a3;
    *a3 = 0x8000000000000000;
    sub_24E348B3C(v6, v8, v6, v8, v9);
    *a3 = v18;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

unint64_t sub_24E34751C(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B59F0);
    uint64_t v2 = (void *)sub_24E360240();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
  }
  uint64_t v31 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v35;
  uint64_t v7 = &v37;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = MEMORY[0x263F8D310];
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v19 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v19 >= v30) {
    goto LABEL_32;
  }
  unint64_t v20 = *(void *)(v31 + 8 * v19);
  int64_t v21 = i + 1;
  if (!v20)
  {
    int64_t v21 = i + 2;
    if (i + 2 >= v30) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v31 + 8 * v21);
    if (!v20)
    {
      int64_t v21 = i + 3;
      if (i + 3 >= v30) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v31 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = i + 4;
        if (i + 4 >= v30) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v31 + 8 * v21);
        if (!v20)
        {
          int64_t v22 = i + 5;
          if (i + 5 < v30)
          {
            unint64_t v20 = *(void *)(v31 + 8 * v22);
            if (v20)
            {
              int64_t v21 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v21 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_36;
              }
              if (v21 >= v30) {
                break;
              }
              unint64_t v20 = *(void *)(v31 + 8 * v21);
              ++v22;
              if (v20) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_24E338370();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v32 = (v20 - 1) & v20;
  unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
  for (i = v21; ; unint64_t v18 = __clz(__rbit64(v5)) | (i << 6))
  {
    uint64_t v23 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v18);
    uint64_t v33 = *v23;
    uint64_t v34 = v23[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A10);
    swift_dynamicCast();
    sub_24E338378(v6, v7);
    sub_24E338378(v7, v38);
    sub_24E338378(v38, &v36);
    unint64_t result = sub_24E32CD14(v33, v34);
    unint64_t v24 = result;
    if (v25)
    {
      uint64_t v11 = v7;
      uint64_t v12 = v6;
      uint64_t v13 = v1;
      int64_t v14 = i;
      uint64_t v15 = v10;
      uint64_t v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v16 = v33;
      v16[1] = v34;
      uint64_t v10 = v15;
      int64_t i = v14;
      uint64_t v1 = v13;
      uint64_t v6 = v12;
      uint64_t v7 = v11;
      uint64_t v17 = (_OWORD *)(v2[7] + 32 * v24);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
      unint64_t result = (unint64_t)sub_24E338378(&v36, v17);
      unint64_t v5 = v32;
      if (!v32) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v26 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v26 = v33;
    v26[1] = v34;
    unint64_t result = (unint64_t)sub_24E338378(&v36, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v27 = v2[2];
    BOOL v28 = __OFADD__(v27, 1);
    uint64_t v29 = v27 + 1;
    if (v28) {
      goto LABEL_34;
    }
    v2[2] = v29;
    unint64_t v5 = v32;
    if (!v32) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v32 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_24E34788C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_24E3478EC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B1B5DF8 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_24E35FD10();
  __swift_project_value_buffer(v11, (uint64_t)qword_26B1B68B0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_24E35FCF0();
  os_log_type_t v13 = sub_24E360000();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v30 = v27;
    *(_DWORD *)uint64_t v14 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_24E32C6BC(a2, a3, &v30);
    BOOL v28 = v10;
    uint64_t v29 = v15;
    sub_24E3600B0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2082;
    v26[1] = v14 + 14;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A10);
    uint64_t v16 = sub_24E35FD70();
    uint64_t v17 = a2;
    uint64_t v18 = v4;
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v29 = sub_24E32C6BC(v16, v20, &v30);
    uint64_t v10 = v28;
    sub_24E3600B0();
    swift_bridgeObjectRelease_n();
    uint64_t v4 = v18;
    a2 = v17;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E31F000, v12, v13, "processIncoming stream event for %s: %{public}s", (uint8_t *)v14, 0x16u);
    uint64_t v21 = v27;
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v21, -1, -1);
    MEMORY[0x25333A4C0](v14, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v22 = sub_24E35FF00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v10, 1, 1, v22);
  unint64_t v23 = sub_24E3492B4();
  unint64_t v24 = (void *)swift_allocObject();
  uint64_t v24[2] = v4;
  v24[3] = v23;
  v24[4] = v4;
  v24[5] = a2;
  void v24[6] = a3;
  v24[7] = a1;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24E346460((uint64_t)v10, (uint64_t)&unk_2698D8F80, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_24E347C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_24E347C78, a4, 0);
}

uint64_t sub_24E347C78()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  sub_24E35FB20();
  uint64_t v3 = swift_task_alloc();
  long long v4 = *(_OWORD *)(v0 + 40);
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  *(_OWORD *)(v3 + 32) = v4;
  sub_24E35FAE0();
  swift_task_dealloc();
  unint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24E347D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_24E35FB20();
  sub_24E35FB00();
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5A20);
  swift_task_localValuePush();
  sub_24E347E38(a2, a3, a4, a5, a1);
  if (v5)
  {
    uint64_t result = swift_task_localValuePop();
    __break(1u);
  }
  else
  {
    swift_task_localValuePop();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_24E347E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B55D8);
  uint64_t v25 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6350);
  MEMORY[0x270FA5388](v11 - 8);
  os_log_type_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6340);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v18 = *(void *)(a1 + 128);
  if (!*(void *)(v18 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    return sub_24E32D33C((uint64_t)v13, (uint64_t *)&unk_26B1B6350);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v19 = sub_24E32CD14(a2, a3);
  if (v20)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v13, *(void *)(v18 + 56) + *(void *)(v15 + 72) * v19, v14);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v21, 1, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    return sub_24E32D33C((uint64_t)v13, (uint64_t *)&unk_26B1B6350);
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  uint64_t v26 = v23;
  uint64_t v27 = v24;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24E35FF20();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t XPCEventStreamHandler.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t XPCEventStreamHandler.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t XPCEventStreamHandler.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E3481F4()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B5E00);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B5E00);
  return sub_24E35FD00();
}

uint64_t sub_24E348278(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  long long v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24E321DD4;
  return v6(a1);
}

uint64_t sub_24E348354(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E348988(a1, a2, a3, a4, (void (*)(uint64_t))sub_24E35BFB0, (void (*)(uint64_t))sub_24E35A5D4, &qword_26B1B64F0, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BD18);
}

uint64_t sub_24E34839C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E348988(a1, a2, a3, a4, (void (*)(uint64_t))sub_24E35BFC4, (void (*)(uint64_t))sub_24E35A5E8, (uint64_t *)&unk_26B1B5B70, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BD24);
}

uint64_t sub_24E3483E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E3487CC(a1, a2, a3, a4, (void (*)(void))sub_24E35BFD8, (void (*)(void))sub_24E35A5FC, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BD30);
}

uint64_t sub_24E348424(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E348988(a1, a2, a3, a4, (void (*)(uint64_t))sub_24E35BFE4, (void (*)(uint64_t))sub_24E35A608, (uint64_t *)&unk_26B1B6370, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BD34);
}

uint64_t sub_24E34846C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E348988(a1, a2, a3, a4, (void (*)(uint64_t))sub_24E35BFF8, (void (*)(uint64_t))sub_24E35A61C, (uint64_t *)&unk_26B1B5970, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BD40);
}

uint64_t sub_24E3484B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E3487CC(a1, a2, a3, a4, (void (*)(void))sub_24E35C00C, (void (*)(void))sub_24E35A630, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BD30);
}

uint64_t sub_24E3484F4(uint64_t a1, uint64_t a2, char a3)
{
  long long v4 = (void **)v3;
  uint64_t v8 = sub_24E35FCE0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_24E32CF5C(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_24E35C018();
      goto LABEL_7;
    }
    sub_24E35A63C(v17, a3 & 1);
    unint64_t v28 = sub_24E32CF5C(a2);
    if ((v18 & 1) == (v29 & 1))
    {
      unint64_t v14 = v28;
      char v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_24E35BD4C(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_24E360350();
    __break(1u);
    return result;
  }
LABEL_7:
  char v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
  uint64_t v25 = v22;
  uint64_t v26 = v21 + *(void *)(v23 + 72) * v14;

  return v24(v26, a1, v25);
}

uint64_t sub_24E3486FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E348988(a1, a2, a3, a4, (void (*)(uint64_t))sub_24E35C3C4, (void (*)(uint64_t))sub_24E35AB40, &qword_26B1B59B0, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BE44);
}

uint64_t sub_24E348744(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E348988(a1, a2, a3, a4, (void (*)(uint64_t))sub_24E35C3D8, (void (*)(uint64_t))sub_24E35AB54, &qword_26B1B5990, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BE50);
}

uint64_t sub_24E34878C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E3487CC(a1, a2, a3, a4, (void (*)(void))sub_24E35C3EC, (void (*)(void))sub_24E35AB68, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BD30);
}

uint64_t sub_24E3487CC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void), void (*a7)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = v7;
  uint64_t v15 = *v7;
  unint64_t v17 = sub_24E32CD14(a2, a3);
  uint64_t v18 = *(void *)(v15 + 16);
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v21 = v16;
  uint64_t v22 = *(void *)(v15 + 24);
  if (v22 >= v20 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v23 = *v10;
    if (v21)
    {
LABEL_8:
      uint64_t v24 = *(void *)(v23 + 56);
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v24 + 8 * v17) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a4 & 1) == 0)
  {
    a5();
    goto LABEL_7;
  }
  a6();
  unint64_t v26 = sub_24E32CD14(a2, a3);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_15:
    uint64_t result = sub_24E360350();
    __break(1u);
    return result;
  }
  unint64_t v17 = v26;
  uint64_t v23 = *v10;
  if (v21) {
    goto LABEL_8;
  }
LABEL_11:
  a7(v17, a2, a3, a1, v23);

  return swift_bridgeObjectRetain();
}

uint64_t sub_24E348940(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_24E348988(a1, a2, a3, a4, (void (*)(uint64_t))sub_24E35CA24, (void (*)(uint64_t))sub_24E35AEA8, (uint64_t *)&unk_26B1B6340, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24E35BEA4);
}

uint64_t sub_24E348988(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(uint64_t), void (*a6)(uint64_t), uint64_t *a7, void (*a8)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = v8;
  uint64_t v16 = *v8;
  unint64_t v18 = sub_24E32CD14(a2, a3);
  uint64_t v19 = *(void *)(v16 + 16);
  BOOL v20 = (v17 & 1) == 0;
  uint64_t v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v22 = v17;
  uint64_t v23 = *(void *)(v16 + 24);
  if (v23 < v21 || (a4 & 1) == 0)
  {
    if (v23 >= v21 && (a4 & 1) == 0)
    {
      a5(v21);
      goto LABEL_7;
    }
    a6(v21);
    unint64_t v32 = sub_24E32CD14(a2, a3);
    if ((v22 & 1) == (v33 & 1))
    {
      unint64_t v18 = v32;
      uint64_t v24 = *v11;
      if (v22) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_24E360350();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v24 = *v11;
  if (v22)
  {
LABEL_8:
    uint64_t v25 = *(void *)(v24 + 56);
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(a7);
    uint64_t v27 = *(void *)(v26 - 8);
    unint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 40);
    uint64_t v29 = v26;
    uint64_t v30 = v25 + *(void *)(v27 + 72) * v18;
    return v28(v30, a1, v29);
  }
LABEL_13:
  a8(v18, a2, a3, a1, v24);

  return swift_bridgeObjectRetain();
}

uint64_t sub_24E348B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_24E32CD14(a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a5 & 1) != 0)
  {
LABEL_7:
    BOOL v20 = *v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (uint64_t *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_24E35CCF4();
    goto LABEL_7;
  }
  sub_24E35B2A8(v17, a5 & 1);
  unint64_t v23 = sub_24E32CD14(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_15:
    uint64_t result = sub_24E360350();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  BOOL v20 = *v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  sub_24E35BF60(v14, a3, a4, a1, a2, v20);

  return swift_bridgeObjectRetain();
}

uint64_t sub_24E348C90(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5C70);
  v2[7] = v4;
  v2[8] = *(void *)(v4 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B6380);
  v2[10] = v5;
  v2[11] = *(void *)(v5 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  swift_defaultActor_initialize();
  uint64_t v6 = MEMORY[0x263F8EE78];
  v1[15] = sub_24E327594(MEMORY[0x263F8EE78]);
  v1[16] = sub_24E3275B0(v6);
  v1[17] = v6;
  v1[14] = a1;
  swift_bridgeObjectRetain();
  return MEMORY[0x270FA2498](sub_24E348E08, v1, 0);
}

uint64_t sub_24E348E08()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2)
  {
LABEL_14:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v34 = (uint64_t (*)(uint64_t))v0[1];
    uint64_t v35 = v0[6];
    return v34(v35);
  }
  uint64_t v3 = v0 + 2;
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B62F0);
  unsigned int v40 = *MEMORY[0x263F8F580];
  uint64_t v38 = (void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  unint64_t v39 = (void (**)(uint64_t, void, uint64_t))(v5 + 104);
  long long v36 = (void (**)(uint64_t, uint64_t))(v4 + 8);
  uint64_t v37 = v4;
  uint64_t v6 = (uint64_t *)(v1 + 40);
  while (1)
  {
    uint64_t v9 = v0[13];
    uint64_t v42 = v2;
    uint64_t v43 = v0[12];
    uint64_t v10 = v0[9];
    uint64_t v44 = v0[10];
    uint64_t v11 = v3;
    uint64_t v13 = v0[6];
    uint64_t v12 = v0[7];
    uint64_t v15 = *(v6 - 1);
    uint64_t v14 = *v6;
    int64_t v41 = v6;
    BOOL v16 = (void *)swift_task_alloc();
    void v16[2] = v13;
    v16[3] = v15;
    v16[4] = v14;
    uint64_t v17 = v12;
    uint64_t v3 = v11;
    (*v39)(v10, v40, v17);
    swift_bridgeObjectRetain();
    sub_24E35FF50();
    swift_task_dealloc();
    swift_beginAccess();
    (*v38)(v43, v9, v44);
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *(void **)(v13 + 120);
    *(void *)(v13 + 120) = 0x8000000000000000;
    unint64_t v21 = sub_24E32CD14(v15, v14);
    uint64_t v22 = v19[2];
    BOOL v23 = (v20 & 1) == 0;
    uint64_t result = v22 + v23;
    if (__OFADD__(v22, v23))
    {
      __break(1u);
LABEL_21:
      __break(1u);
      return result;
    }
    char v25 = v20;
    if (v19[3] < result) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_24E35C3F8();
    }
LABEL_11:
    uint64_t v28 = v0[12];
    uint64_t v29 = v0[10];
    if (v25)
    {
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v37 + 40))(v19[7] + *(void *)(v37 + 72) * v21, v28, v29);
    }
    else
    {
      v19[(v21 >> 6) + 8] |= 1 << v21;
      uint64_t v30 = (uint64_t *)(v19[6] + 16 * v21);
      *uint64_t v30 = v15;
      v30[1] = v14;
      uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v37 + 32))(v19[7] + *(void *)(v37 + 72) * v21, v28, v29);
      uint64_t v31 = v19[2];
      BOOL v32 = __OFADD__(v31, 1);
      uint64_t v33 = v31 + 1;
      if (v32) {
        goto LABEL_21;
      }
      v19[2] = v33;
      swift_bridgeObjectRetain();
    }
    uint64_t v7 = v0[13];
    uint64_t v8 = v0[10];
    *(void *)(v0[6] + 120) = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    (*v36)(v7, v8);
    uint64_t v6 = v41 + 2;
    uint64_t v2 = v42 - 1;
    if (v42 == 1) {
      goto LABEL_14;
    }
  }
  sub_24E35AB74(result, isUniquelyReferenced_nonNull_native);
  unint64_t v26 = sub_24E32CD14(v15, v14);
  if ((v25 & 1) == (v27 & 1))
  {
    unint64_t v21 = v26;
    goto LABEL_11;
  }
  return sub_24E360350();
}

uint64_t type metadata accessor for XPCEventStreamHandler()
{
  return self;
}

uint64_t method lookup function for XPCEventStreamHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCEventStreamHandler);
}

uint64_t dispatch thunk of XPCEventStreamHandler.__allocating_init(streams:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*(void *)(v1 + 216) + **(int **)(v1 + 216));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_24E3370EC;
  return v6(a1);
}

unint64_t sub_24E3492B4()
{
  unint64_t result = qword_26B1B5BE8;
  if (!qword_26B1B5BE8)
  {
    type metadata accessor for XPCEventStreamHandler();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B5BE8);
  }
  return result;
}

uint64_t sub_24E349308()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24E349358(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 48);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_24E322A50;
  *(_OWORD *)(v6 + 40) = v7;
  *(void *)(v6 + 24) = v4;
  *(void *)(v6 + 32) = v5;
  *(void *)(v6 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24E347C78, v4, 0);
}

uint64_t sub_24E34941C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E349454(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E322A50;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698D8F90 + dword_2698D8F90);
  return v6(a1, v4);
}

uint64_t sub_24E34950C(uint64_t a1)
{
  return sub_24E347D58(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_24E34952C()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24E34956C(void *a1)
{
  return sub_24E347080(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
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

uint64_t sub_24E349590()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24E3495A0(uint64_t a1, void *a2)
{
  return sub_24E3473E0(a1, a2, *(uint64_t **)(v2 + 16));
}

uint64_t sub_24E3495A8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E3495B8()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_24E3495E4(uint64_t a1)
{
  return sub_24E346AD8(a1, v1[2], v1[3], v1[4]);
}

uint64_t ActorServiceDaemon.startupIsDone()(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  uint64_t v5 = sub_24E35FEC0();
  v3[11] = v5;
  v3[12] = v4;
  return MEMORY[0x270FA2498](sub_24E349678, v5, v4);
}

uint64_t sub_24E349678()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0[9] + 16))(v0[8]);
  v0[13] = v1;
  return MEMORY[0x270FA2498](sub_24E3496F8, v1, 0);
}

uint64_t sub_24E3496F8()
{
  uint64_t v1 = v0[13];
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  v0[14] = v2;
  uint64_t v3 = *(void *)(v2 + 16);
  v0[15] = v3;
  if (!v3)
  {
LABEL_10:
    swift_release();
    uint64_t v17 = (uint64_t (*)(void))v0[1];
    return v17();
  }
  swift_bridgeObjectRetain();
  swift_beginAccess();
  for (uint64_t i = 0; ; uint64_t i = v0[16] + 1)
  {
    v0[16] = i;
    uint64_t v5 = v0[13];
    uint64_t v6 = v0[14] + 16 * i;
    v0[17] = *(void *)(v6 + 32);
    uint64_t v7 = *(void *)(v6 + 40);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
    swift_unknownObjectRetain();
    uint64_t v10 = v9(ObjectType, v7);
    uint64_t v12 = v11;
    v0[18] = v11;
    if (!*(void *)(*(void *)(v5 + 128) + 16)) {
      goto LABEL_6;
    }
    uint64_t v13 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E32CD14(v13, v12);
    if (v14) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v15 = v0[16];
    uint64_t v16 = v0[15];
    swift_unknownObjectRelease();
    if (v15 + 1 == v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  uint64_t v19 = v0[13];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E34EDE8();
  char v20 = (void *)swift_task_alloc();
  v0[19] = v20;
  v20[2] = v19;
  v20[3] = v13;
  v20[4] = v12;
  unint64_t v21 = (void *)swift_task_alloc();
  v0[20] = v21;
  *unint64_t v21 = v0;
  v21[1] = sub_24E349974;
  return MEMORY[0x270FA2360]();
}

uint64_t sub_24E349974()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 104);
    uint64_t v4 = sub_24E349CC8;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 104);
    swift_task_dealloc();
    uint64_t v4 = sub_24E349A9C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E349A9C()
{
  while (1)
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = v0[16];
    uint64_t v2 = v0[15];
    swift_unknownObjectRelease();
    if (v1 + 1 == v2) {
      break;
    }
    uint64_t v3 = v0[16] + 1;
    v0[16] = v3;
    uint64_t v4 = v0[13];
    uint64_t v5 = v0[14] + 16 * v3;
    v0[17] = *(void *)(v5 + 32);
    uint64_t v6 = *(void *)(v5 + 40);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
    swift_unknownObjectRetain();
    uint64_t v9 = v8(ObjectType, v6);
    uint64_t v11 = v10;
    v0[18] = v10;
    if (*(void *)(*(void *)(v4 + 128) + 16))
    {
      uint64_t v12 = v9;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24E32CD14(v12, v11);
      if (v13)
      {
        uint64_t v16 = v0[13];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24E34EDE8();
        uint64_t v17 = (void *)swift_task_alloc();
        v0[19] = v17;
        v17[2] = v16;
        v17[3] = v12;
        v17[4] = v11;
        char v18 = (void *)swift_task_alloc();
        v0[20] = v18;
        void *v18 = v0;
        v18[1] = sub_24E349974;
        return MEMORY[0x270FA2360]();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  swift_release();
  char v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24E349CC8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_unknownObjectRelease();
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  return MEMORY[0x270FA2498](sub_24E349D54, v1, v2);
}

uint64_t sub_24E349D54()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E349DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for Daemon();
  *uint64_t v8 = v4;
  v8[1] = sub_24E339474;
  return ActorServiceDaemon.getService<A>()(v9, a1, a4, a2);
}

uint64_t ActorServiceDaemon.getService<A>()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v7 = sub_24E35FEC0();
  return MEMORY[0x270FA2498](sub_24E349EF8, v7, v6);
}

{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v7 = sub_24E35FEC0();
  v5[7] = v7;
  v5[8] = v6;
  return MEMORY[0x270FA2498](sub_24E34A210, v7, v6);
}

uint64_t sub_24E349EF8()
{
  v0[7] = (*(uint64_t (**)(void))(v0[4] + 16))(v0[2]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E349FB8;
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[3];
  return sub_24E34FF40(v3, v2);
}

uint64_t sub_24E349FB8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_24E34A0D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  uint64_t v9 = type metadata accessor for Daemon();
  *uint64_t v8 = v4;
  v8[1] = sub_24E34F83C;
  return ActorServiceDaemon.getService<A>()(v9, a1, a4, a2);
}

uint64_t sub_24E34A210()
{
  v0[9] = (*(uint64_t (**)(void))(v0[4] + 16))(v0[2]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[10] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34A2D0;
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[3];
  return sub_24E3509BC(v3, v2);
}

uint64_t sub_24E34A2D0(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v6 = *(void *)(v4 + 56);
    uint64_t v7 = *(void *)(v4 + 64);
    return MEMORY[0x270FA2498](sub_24E34A424, v6, v7);
  }
  else
  {
    swift_release();
    uint64_t v8 = *(uint64_t (**)(uint64_t))(v5 + 8);
    return v8(a1);
  }
}

uint64_t sub_24E34A424()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E34A488()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_2698D9138 + dword_2698D9138);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E322CD0;
  return v3();
}

uint64_t sub_24E34A528()
{
  *(void *)(v1 + 56) = v0;
  return MEMORY[0x270FA2498](sub_24E34A548, v0, 0);
}

uint64_t sub_24E34A548()
{
  char v14 = v0;
  if (qword_26B1B64B8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E35FD10();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1B6880);
  swift_retain_n();
  uint64_t v2 = sub_24E35FCF0();
  os_log_type_t v3 = sub_24E360030();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v13 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    swift_retain();
    uint64_t v6 = sub_24E340374();
    unint64_t v8 = v7;
    swift_release();
    v0[6] = sub_24E32C6BC(v6, v8, &v13);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_24E31F000, v2, v3, "Starting daemon: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v5, -1, -1);
    MEMORY[0x25333A4C0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v9 = v0[7];
  v0[5] = MEMORY[0x263F8EE78];
  uint64_t v12 = (uint64_t (*)(void))(*(void *)(v9 + 168) + **(int **)(v9 + 168));
  uint64_t v10 = (void *)swift_task_alloc();
  v0[8] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_24E34A7D4;
  return v12();
}

uint64_t sub_24E34A7D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 56);
  *(void *)(*(void *)v1 + 72) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E34A8EC, v2, 0);
}

uint64_t sub_24E34A8EC()
{
  uint64_t v1 = v0[7];
  sub_24E33FFD8(v0[9]);
  uint64_t v2 = *(void *)(v1 + 128);
  uint64_t v3 = v0[5];
  v0[10] = v2;
  v0[11] = v3;
  return MEMORY[0x270FA2498](sub_24E34A964, v2, 0);
}

uint64_t sub_24E34A964()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[7];
  swift_beginAccess();
  *(void *)(v2 + 112) = v1;
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_24E34A9F4, v3, 0);
}

uint64_t sub_24E34A9F4()
{
  v0[12] = *(void *)(v0[7] + 144);
  swift_retain();
  uint64_t v1 = sub_24E32B4AC();
  v0[13] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[14] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E34AAA4;
  return sub_24E328EF0(v1);
}

uint64_t sub_24E34AAA4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](sub_24E34ABF4, v1, 0);
}

uint64_t sub_24E34ABF4()
{
  v0[15] = *(void *)(v0[7] + 152);
  swift_retain();
  uint64_t v1 = sub_24E330FD4();
  v0[16] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[17] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E34ACA4;
  return sub_24E32EBF0(v1);
}

uint64_t sub_24E34ACA4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA2498](sub_24E34ADF4, v1, 0);
}

uint64_t sub_24E34ADF4()
{
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34AE90;
  return sub_24E351318();
}

uint64_t sub_24E34AE90()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24E34AFBC, v1, 0);
}

uint64_t sub_24E34AFBC()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 56) + 136);
  *(void *)(v0 + 152) = v1;
  swift_retain();
  return MEMORY[0x270FA2498](sub_24E34B034, v1, 0);
}

uint64_t sub_24E34B034()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_24E346C24(v1);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t ActorServiceDaemon.startup()(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = *(void *)(a2 + 8);
  uint64_t v5 = sub_24E35FEC0();
  v3[8] = v5;
  v3[9] = v4;
  return MEMORY[0x270FA2498](sub_24E34B134, v5, v4);
}

uint64_t sub_24E34B134()
{
  uint64_t v15 = v0;
  if (qword_26B1B64B8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E35FD10();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1B6880);
  swift_unknownObjectRetain_n();
  uint64_t v2 = sub_24E35FCF0();
  os_log_type_t v3 = sub_24E360030();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[6];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v14 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    v0[2] = v4;
    uint64_t v7 = sub_24E3602F0();
    v0[3] = sub_24E32C6BC(v7, v8, &v14);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_24E31F000, v2, v3, "Starting daemon: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v6, -1, -1);
    MEMORY[0x25333A4C0](v5, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v0[5] + 24) + **(int **)(v0[5] + 24));
  uint64_t v9 = (void *)swift_task_alloc();
  v0[10] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24E34B3C8;
  uint64_t v10 = v0[5];
  uint64_t v11 = v0[4];
  return v13(v11, v10);
}

uint64_t sub_24E34B3C8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_24E34B4E8, v3, v2);
}

uint64_t sub_24E34B4E8()
{
  v0[11] = (*(uint64_t (**)(void))(v0[7] + 56))(v0[4]);
  uint64_t v1 = sub_24E32B4AC();
  v0[12] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[13] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E34B5A8;
  return sub_24E328EF0(v1);
}

uint64_t sub_24E34B5A8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_24E34B708, v3, v2);
}

uint64_t sub_24E34B708()
{
  v0[14] = (*(uint64_t (**)(void))(v0[7] + 64))(v0[4]);
  uint64_t v1 = sub_24E330FD4();
  v0[15] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[16] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E34B7C8;
  return sub_24E32EBF0(v1);
}

uint64_t sub_24E34B7C8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_24E34B928, v3, v2);
}

uint64_t sub_24E34B928()
{
  v0[17] = (*(uint64_t (**)(void))(v0[5] + 16))(v0[4]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[18] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34B9D8;
  return sub_24E351318();
}

uint64_t sub_24E34B9D8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return MEMORY[0x270FA2498](sub_24E34BB1C, v3, v2);
}

uint64_t sub_24E34BB1C()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0[7] + 48))(v0[4]);
  v0[19] = v1;
  return MEMORY[0x270FA2498](sub_24E34B034, v1, 0);
}

uint64_t sub_24E34BB9C()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24E34BBBC, v0, 0);
}

uint64_t sub_24E34BBBC()
{
  v0[3] = *(void *)(v0[2] + 128);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34F850;
  return sub_24E356D84();
}

uint64_t ActorServiceDaemon.initialLaunchProcessing()(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v5 = sub_24E35FEC0();
  return MEMORY[0x270FA2498](sub_24E34BCDC, v5, v4);
}

uint64_t sub_24E34BCDC()
{
  v0[5] = (*(uint64_t (**)(void))(v0[3] + 16))(v0[2]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34F854;
  return sub_24E356D84();
}

uint64_t sub_24E34BD8C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  *(void *)(v3 + 176) = v2;
  *(void *)(v3 + 184) = v4;
  *(void *)(v3 + 192) = v5;
  *(_OWORD *)(v3 + 200) = *((_OWORD *)a1 + 1);
  uint64_t v6 = a1[5];
  *(void *)(v3 + 216) = a1[4];
  *(void *)(v3 + 224) = v6;
  *(unsigned char *)(v3 + 344) = *((unsigned char *)a1 + 48);
  *(_OWORD *)(v3 + 232) = *(_OWORD *)(a1 + 7);
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  *(void *)(v3 + 248) = a1[9];
  *(void *)(v3 + 256) = v7;
  *(void *)(v3 + 264) = v8;
  *(_OWORD *)(v3 + 272) = *((_OWORD *)a2 + 1);
  uint64_t v9 = a2[5];
  *(void *)(v3 + 288) = a2[4];
  *(void *)(v3 + 296) = v9;
  *(unsigned char *)(v3 + 345) = *((unsigned char *)a2 + 48);
  *(_OWORD *)(v3 + 304) = *(_OWORD *)(a2 + 7);
  *(void *)(v3 + 320) = a2[9];
  return MEMORY[0x270FA2498](sub_24E34BE0C, v2, 0);
}

uint64_t sub_24E34BE0C()
{
  uint64_t v1 = *(void *)(v0 + 320);
  char v2 = *(unsigned char *)(v0 + 345);
  uint64_t v4 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v5 = *(void *)(v0 + 264);
  char v6 = *(unsigned char *)(v0 + 344);
  uint64_t v8 = *(void *)(v0 + 216);
  uint64_t v7 = *(void *)(v0 + 224);
  uint64_t v10 = *(void *)(v0 + 184);
  uint64_t v9 = *(void *)(v0 + 192);
  *(void *)(v0 + 328) = *(void *)(*(void *)(v0 + 176) + 128);
  *(void *)(v0 + 16) = v10;
  *(void *)(v0 + 24) = v9;
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 200);
  *(void *)(v0 + 48) = v8;
  *(void *)(v0 + 56) = v7;
  *(unsigned char *)(v0 + 64) = v6;
  *(_OWORD *)(v0 + 72) = *(_OWORD *)(v0 + 232);
  *(_OWORD *)(v0 + 88) = *(_OWORD *)(v0 + 248);
  *(void *)(v0 + 104) = v5;
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 272);
  *(void *)(v0 + 128) = v4;
  *(void *)(v0 + 136) = v3;
  *(unsigned char *)(v0 + 144) = v2;
  *(_OWORD *)(v0 + 152) = *(_OWORD *)(v0 + 304);
  *(void *)(v0 + 168) = v1;
  swift_retain();
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 336) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_24E34BF34;
  return sub_24E357540((long long *)(v0 + 16), (_OWORD *)(v0 + 96));
}

uint64_t sub_24E34BF34()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t ActorServiceDaemon.migrate(from:to:)(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v5 + 176) = a3;
  *(void *)(v5 + 184) = a4;
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *(void *)(v5 + 192) = v4;
  *(void *)(v5 + 200) = v6;
  *(void *)(v5 + 208) = v7;
  *(_OWORD *)(v5 + 216) = *((_OWORD *)a1 + 1);
  uint64_t v8 = a1[5];
  *(void *)(v5 + 232) = a1[4];
  *(void *)(v5 + 240) = v8;
  *(unsigned char *)(v5 + 360) = *((unsigned char *)a1 + 48);
  *(_OWORD *)(v5 + 248) = *(_OWORD *)(a1 + 7);
  uint64_t v9 = *a2;
  uint64_t v10 = a2[1];
  *(void *)(v5 + 264) = a1[9];
  *(void *)(v5 + 272) = v9;
  *(void *)(v5 + 280) = v10;
  *(_OWORD *)(v5 + 288) = *((_OWORD *)a2 + 1);
  uint64_t v11 = a2[5];
  *(void *)(v5 + 304) = a2[4];
  *(void *)(v5 + 312) = v11;
  *(unsigned char *)(v5 + 361) = *((unsigned char *)a2 + 48);
  *(_OWORD *)(v5 + 320) = *(_OWORD *)(a2 + 7);
  *(void *)(v5 + 336) = a2[9];
  uint64_t v13 = sub_24E35FEC0();
  return MEMORY[0x270FA2498](sub_24E34C124, v13, v12);
}

uint64_t sub_24E34C124()
{
  uint64_t v1 = *(void *)(v0 + 336);
  char v2 = *(unsigned char *)(v0 + 361);
  uint64_t v3 = *(void *)(v0 + 312);
  long long v14 = *(_OWORD *)(v0 + 296);
  long long v15 = *(_OWORD *)(v0 + 320);
  long long v12 = *(_OWORD *)(v0 + 264);
  long long v13 = *(_OWORD *)(v0 + 280);
  char v4 = *(unsigned char *)(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 240);
  long long v10 = *(_OWORD *)(v0 + 216);
  long long v11 = *(_OWORD *)(v0 + 248);
  long long v9 = *(_OWORD *)(v0 + 200);
  *(void *)(v0 + 344) = (*(uint64_t (**)(void))(*(void *)(v0 + 184) + 16))(*(void *)(v0 + 176));
  *(_OWORD *)(v0 + 16) = v9;
  *(_OWORD *)(v0 + 32) = v10;
  *(void *)(v0 + 48) = v6;
  *(void *)(v0 + 56) = v5;
  *(unsigned char *)(v0 + 64) = v4;
  *(_OWORD *)(v0 + 72) = v11;
  *(_OWORD *)(v0 + 88) = v12;
  *(_OWORD *)(v0 + 104) = v13;
  *(_OWORD *)(v0 + 120) = v14;
  *(void *)(v0 + 136) = v3;
  *(unsigned char *)(v0 + 144) = v2;
  *(_OWORD *)(v0 + 152) = v15;
  *(void *)(v0 + 168) = v1;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v7;
  void *v7 = v0;
  v7[1] = sub_24E34C2A0;
  return sub_24E357540((long long *)(v0 + 16), (_OWORD *)(v0 + 96));
}

uint64_t sub_24E34C2A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E34C3B0()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24E34C3D0, v0, 0);
}

uint64_t sub_24E34C3D0()
{
  v0[3] = *(void *)(v0[2] + 128);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34C474;
  return sub_24E35821C();
}

uint64_t sub_24E34C474()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t ActorServiceDaemon.firstLaunchSinceReboot()(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v5 = sub_24E35FEC0();
  return MEMORY[0x270FA2498](sub_24E34C600, v5, v4);
}

uint64_t sub_24E34C600()
{
  v0[5] = (*(uint64_t (**)(void))(v0[3] + 16))(v0[2]);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[6] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34C6B0;
  return sub_24E35821C();
}

uint64_t sub_24E34C6B0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E34C7C0()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_2698D90E0 + dword_2698D90E0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E322CD0;
  return v3();
}

uint64_t sub_24E34C860()
{
  *(void *)(v1 + 1336) = v0;
  return MEMORY[0x270FA2498](sub_24E34C880, v0, 0);
}

uint64_t sub_24E34C880()
{
  sub_24E35FB20();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 1384) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34C950;
  return MEMORY[0x270F28C50]();
}

uint64_t sub_24E34C950()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1432) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 1336);
  if (v0) {
    uint64_t v4 = sub_24E34CD64;
  }
  else {
    uint64_t v4 = sub_24E34CA7C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E34CA7C()
{
  uint64_t v1 = v0[167];
  uint64_t v2 = swift_allocObject();
  v0[185] = v2;
  *(void *)(v2 + 16) = &unk_2698D9100;
  *(void *)(v2 + 24) = v1;
  swift_retain();
  swift_retain();
  swift_asyncLet_begin();
  uint64_t v3 = swift_allocObject();
  v0[191] = v3;
  *(void *)(v3 + 16) = &unk_2698D9118;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  swift_asyncLet_begin();
  v0[197] = *(void *)(v1 + 128);
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[198] = v4;
  void *v4 = v0;
  v4[1] = sub_24E34CC0C;
  return sub_24E353D18();
}

uint64_t sub_24E34CC0C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1592) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 1336);
    return MEMORY[0x270FA2498](sub_24E34CE7C, v3, 0);
  }
  else
  {
    swift_release();
    return MEMORY[0x270FA23E0](v2 + 16, v4, sub_24E34CD7C, v2 + 1392);
  }
}

uint64_t sub_24E34CD64()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24E34CD7C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA23E0](v2 + 656, a2, sub_24E34CD98, v2 + 1440);
}

uint64_t sub_24E34CD98(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA23D8](v2 + 656, a2, sub_24E34CDB4, v2 + 1488);
}

uint64_t sub_24E34CDB4()
{
  return MEMORY[0x270FA2498](sub_24E34CDD0, *(void *)(v0 + 1336), 0);
}

uint64_t sub_24E34CDD0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA23D8](v2 + 16, a2, sub_24E34CDEC, v2 + 1536);
}

uint64_t sub_24E34CDEC()
{
  return MEMORY[0x270FA2498](sub_24E34CE08, *(void *)(v0 + 1336), 0);
}

uint64_t sub_24E34CE08()
{
  swift_release_n();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E34CE7C()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 656, v1, sub_24E34CEEC, v0 + 1296);
}

uint64_t sub_24E34CEEC()
{
  return MEMORY[0x270FA2498](sub_24E34CF08, *(void *)(v0 + 1336), 0);
}

uint64_t sub_24E34CF08(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA23D8](v2 + 16, a2, sub_24E34CF24, v2 + 1344);
}

uint64_t sub_24E34CF24()
{
  return MEMORY[0x270FA2498](sub_24E34CF40, *(void *)(v0 + 1336), 0);
}

uint64_t sub_24E34CF40()
{
  swift_release_n();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t ActorServiceDaemon.run()(uint64_t a1, uint64_t a2)
{
  v3[179] = v2;
  v3[173] = a2;
  v3[167] = a1;
  uint64_t v5 = sub_24E35FEC0();
  v3[185] = v5;
  v3[191] = v4;
  return MEMORY[0x270FA2498](sub_24E34D038, v5, v4);
}

uint64_t sub_24E34D038()
{
  uint64_t v1 = v0[179];
  uint64_t v2 = v0[173];
  uint64_t v3 = v0[167];
  sub_24E35FB20();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[197] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[198] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24E34D13C;
  return MEMORY[0x270F28C50]();
}

uint64_t sub_24E34D13C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1592) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 1528);
    uint64_t v4 = *(void *)(v2 + 1480);
    uint64_t v5 = sub_24E34D704;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(void *)(v2 + 1528);
    uint64_t v4 = *(void *)(v2 + 1480);
    uint64_t v5 = sub_24E34D260;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24E34D260()
{
  uint64_t v1 = v0[179];
  uint64_t v2 = v0[173];
  uint64_t v3 = v0[167];
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  uint64_t v5 = swift_allocObject();
  v0[200] = v5;
  *(void *)(v5 + 16) = &unk_2698D9060;
  *(void *)(v5 + 24) = v4;
  swift_unknownObjectRetain();
  swift_retain();
  swift_asyncLet_begin();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v3;
  v6[3] = v2;
  v6[4] = v1;
  uint64_t v7 = swift_allocObject();
  v0[201] = v7;
  *(void *)(v7 + 16) = &unk_2698D9080;
  *(void *)(v7 + 24) = v6;
  swift_unknownObjectRetain();
  swift_retain();
  swift_asyncLet_begin();
  v0[202] = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v3, v2);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[203] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24E34D458;
  return sub_24E353D18();
}

uint64_t sub_24E34D458()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1632) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 1528);
    uint64_t v4 = *(void *)(v2 + 1480);
    return MEMORY[0x270FA2498](sub_24E34D768, v4, v3);
  }
  else
  {
    swift_release();
    return MEMORY[0x270FA23E0](v2 + 16, v5, sub_24E34D5B0, v2 + 1392);
  }
}

uint64_t sub_24E34D5B0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA23E0](v2 + 656, a2, sub_24E34D5CC, v2 + 1440);
}

uint64_t sub_24E34D5CC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA23D8](v2 + 656, a2, sub_24E34D5E8, v2 + 1488);
}

uint64_t sub_24E34D5E8()
{
  return MEMORY[0x270FA2498](sub_24E34D604, *(void *)(v0 + 1480), *(void *)(v0 + 1528));
}

uint64_t sub_24E34D604()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 16, v1, sub_24E34D674, v0 + 1536);
}

uint64_t sub_24E34D674()
{
  return MEMORY[0x270FA2498](sub_24E34D690, *(void *)(v0 + 1480), *(void *)(v0 + 1528));
}

uint64_t sub_24E34D690()
{
  swift_release_n();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E34D704()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E34D768()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 656, v1, sub_24E34D7D8, v0 + 1296);
}

uint64_t sub_24E34D7D8()
{
  return MEMORY[0x270FA2498](sub_24E34D7F4, *(void *)(v0 + 1480), *(void *)(v0 + 1528));
}

uint64_t sub_24E34D7F4()
{
  swift_release();
  return MEMORY[0x270FA23D8](v0 + 16, v1, sub_24E34D864, v0 + 1344);
}

uint64_t sub_24E34D864()
{
  return MEMORY[0x270FA2498](sub_24E34D880, *(void *)(v0 + 1480), *(void *)(v0 + 1528));
}

uint64_t sub_24E34D880()
{
  swift_release_n();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E34D8F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *long long v9 = v4;
  v9[1] = sub_24E3370EC;
  return ActorServiceDaemon.getService<A>()(a3, a1, a4, a2);
}

uint64_t sub_24E34D9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *long long v9 = v4;
  v9[1] = sub_24E34DA6C;
  return ActorServiceDaemon.getService<A>()(a3, a1, a4, a2);
}

uint64_t sub_24E34DA6C(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_24E34DB6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_24E34DB90, 0, 0);
}

uint64_t sub_24E34DB90()
{
  uint64_t v1 = v0[4];
  sub_24E35FB20();
  v0[6] = sub_24E35FB00();
  v0[2] = v1;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24E34DCB4;
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[3];
  return MEMORY[0x270FA23C8](v4, v0 + 2, &unk_2698D9130, v3, 0, 0, 0xD00000000000002CLL, 0x800000024E362DF0);
}

uint64_t sub_24E34DCB4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24E34DE1C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24E34DE1C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24E34DE34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  return MEMORY[0x270FA2498](sub_24E34DE5C, 0, 0);
}

uint64_t sub_24E34DE5C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  sub_24E35FB20();
  long long v7 = *(_OWORD *)(v0 + 48);
  *(void *)(v0 + 64) = sub_24E35FB00();
  *(void *)(v0 + 16) = v1;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  *(_OWORD *)(v3 + 16) = v7;
  *(void *)(v3 + 32) = v2;
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v4;
  void *v4 = v0;
  v4[1] = sub_24E34DFAC;
  uint64_t v5 = *(void *)(v0 + 24);
  return MEMORY[0x270FA23C8](v5, v0 + 16, &unk_2698D9178, v3, 0, 0, 0xD00000000000002CLL, 0x800000024E362DF0);
}

uint64_t sub_24E34DFAC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24E34E13C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24E34E13C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24E34E154()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_2698D9138 + dword_2698D9138);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E322A50;
  return v3();
}

uint64_t sub_24E34E1F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 8);
  long long v9 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v6 + 72) + **(int **)(v6 + 72));
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v7;
  void *v7 = v4;
  v7[1] = sub_24E322CD0;
  return v9(a3, v6);
}

uint64_t sub_24E34E2F0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24E34E310, a1, 0);
}

uint64_t sub_24E34E310()
{
  v0[3] = *(void *)(v0[2] + 144);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34F850;
  return sub_24E3296FC();
}

uint64_t sub_24E34E3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  uint64_t v4 = *(void *)(a3 + 8);
  v3[4] = v4;
  v3[5] = *(void *)(v4 + 56);
  v3[6] = (v4 + 56) & 0xFFFFFFFFFFFFLL | 0x9EC8000000000000;
  uint64_t v6 = sub_24E35FEC0();
  return MEMORY[0x270FA2498](sub_24E34E44C, v6, v5);
}

uint64_t sub_24E34E44C()
{
  *(void *)(v0 + 56) = (*(uint64_t (**)(void, void))(v0 + 40))(*(void *)(v0 + 24), *(void *)(v0 + 32));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34F858;
  return sub_24E3296FC();
}

uint64_t sub_24E34E4F0(uint64_t a1, int *a2)
{
  uint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24E321DD4;
  return v5();
}

uint64_t sub_24E34E5BC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_24E34E5DC, a1, 0);
}

uint64_t sub_24E34E5DC()
{
  v0[3] = *(void *)(v0[2] + 152);
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34C474;
  return sub_24E32F39C();
}

uint64_t sub_24E34E680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  uint64_t v4 = *(void *)(a3 + 8);
  v3[4] = v4;
  v3[5] = *(void *)(v4 + 64);
  v3[6] = (v4 + 64) & 0xFFFFFFFFFFFFLL | 0x9DA8000000000000;
  uint64_t v6 = sub_24E35FEC0();
  return MEMORY[0x270FA2498](sub_24E34E718, v6, v5);
}

uint64_t sub_24E34E718()
{
  *(void *)(v0 + 56) = (*(uint64_t (**)(void, void))(v0 + 40))(*(void *)(v0 + 24), *(void *)(v0 + 32));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E34E7BC;
  return sub_24E32F39C();
}

uint64_t sub_24E34E7BC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t ActorServiceDaemon.runForever()(uint64_t a1, uint64_t a2)
{
  v3[2] = v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D9098);
  v3[3] = v5;
  v3[4] = *(void *)(v5 - 8);
  v3[5] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D90A0);
  v3[6] = v6;
  v3[7] = *(void *)(v6 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_2698D90A8);
  v3[10] = swift_task_alloc();
  v3[11] = *(void *)(*(void *)(a2 + 8) + 16);
  uint64_t v8 = sub_24E35FEC0();
  v3[12] = v8;
  v3[13] = v7;
  return MEMORY[0x270FA2498](sub_24E34EA50, v8, v7);
}

uint64_t sub_24E34EA50()
{
  (*(void (**)(void, void, void))(v0[7] + 104))(v0[8], *MEMORY[0x263F8F580], v0[6]);
  sub_24E35FF50();
  sub_24E35FF30();
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)swift_task_alloc();
  v0[14] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24E34EB84;
  uint64_t v4 = v0[3];
  return MEMORY[0x270FA1F68](v0 + 15, v2, v1, v4);
}

uint64_t sub_24E34EB84()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 104);
  uint64_t v3 = *(void *)(v1 + 96);
  return MEMORY[0x270FA2498](sub_24E34ECA4, v3, v2);
}

uint64_t sub_24E34ECA4()
{
  if (*(unsigned char *)(v0 + 120))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 32) + 8))(*(void *)(v0 + 40), *(void *)(v0 + 24));
    return sub_24E360210();
  }
  else
  {
    uint64_t v2 = *(void *)(v0 + 88);
    uint64_t v3 = *(void *)(v0 + 16);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v4;
    void *v4 = v0;
    v4[1] = sub_24E34EB84;
    uint64_t v5 = *(void *)(v0 + 24);
    return MEMORY[0x270FA1F68](v0 + 120, v3, v2, v5);
  }
}

unint64_t sub_24E34EDE8()
{
  unint64_t result = qword_26B1B67F0;
  if (!qword_26B1B67F0)
  {
    type metadata accessor for ActorServiceCollection();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B67F0);
  }
  return result;
}

uint64_t sub_24E34EE40(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 32);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v2 + 16);
  *(void *)(v3 + 16) = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + 8) = sub_24E322CD0;
  *(_OWORD *)(v7 + 48) = v8;
  *(void *)(v7 + 32) = a2;
  *(void *)(v7 + 40) = v6;
  *(void *)(v7 + 24) = a1;
  return MEMORY[0x270FA2498](sub_24E34DE5C, 0, 0);
}

uint64_t sub_24E34EF08()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24E34EF40()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24E322CD0;
  return sub_24E34E3B4(v4, v2, v3);
}

uint64_t sub_24E34EFE8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E34F020(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E322CD0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698D9068 + dword_2698D9068);
  return v6(a1, v4);
}

uint64_t sub_24E34F0D8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24E322CD0;
  return sub_24E34E680(v4, v2, v3);
}

uint64_t dispatch thunk of ActorServiceDaemon.actorServiceCollection.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ActorServiceDaemon.populateServices()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E322A50;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorServiceDaemon.getService<A>()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 32) + **(int **)(a4 + 32));
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *long long v9 = v4;
  v9[1] = sub_24E339474;
  return v11(a1, a2, a3, a4);
}

{
  uint64_t v4;
  void *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 40) + **(int **)(a4 + 40));
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *long long v9 = v4;
  v9[1] = sub_24E34127C;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_24E34F49C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_24E322A50;
  v6[4] = a2;
  v6[5] = v2;
  v6[3] = a1;
  return MEMORY[0x270FA2498](sub_24E34DB90, 0, 0);
}

uint64_t sub_24E34F558()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E322CD0;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24E34E310, v0, 0);
}

uint64_t sub_24E34F5FC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E322CD0;
  v2[2] = v0;
  return MEMORY[0x270FA2498](sub_24E34E5DC, v0, 0);
}

uint64_t sub_24E34F6A0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E322CD0;
  uint64_t v4 = (uint64_t (*)(void))((char *)&dword_2698D9138 + dword_2698D9138);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E322A50;
  return v4();
}

uint64_t sub_24E34F788(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24E322CD0;
  return sub_24E34E1F8(a1, v6, v4, v5);
}

uint64_t ActorServiceCollection.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE78];
  uint64_t v1 = MEMORY[0x263F8EE80];
  *(unsigned char *)(v0 + 120) = 0;
  uint64_t v2 = MEMORY[0x263F8EE88];
  *(void *)(v0 + 128) = v1;
  *(void *)(v0 + 136) = v2;
  return v0;
}

uint64_t static ActorDaemon.enterSandbox(identifier:)(uint64_t a1, unint64_t a2)
{
  v30[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_24E35FC70();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = NSTemporaryDirectory();
  sub_24E35FDC0();

  sub_24E35FC40();
  swift_bridgeObjectRelease();
  sub_24E35FC60();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  id v13 = objc_msgSend(self, sel_defaultManager);
  long long v14 = (void *)sub_24E35FC50();
  v30[0] = 0;
  unsigned int v15 = objc_msgSend(v13, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v30);

  if (v15)
  {
    id v16 = v30[0];
  }
  else
  {
    id v17 = v30[0];
    char v18 = (void *)sub_24E35FC30();

    swift_willThrow();
  }
  sub_24E35FDE0();
  int v19 = _set_user_dir_suffix();
  swift_release();
  if (v19)
  {
    if (qword_26B1B64B8 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24E35FD10();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B1B6880);
    swift_bridgeObjectRetain_n();
    unint64_t v21 = sub_24E35FCF0();
    os_log_type_t v22 = sub_24E360030();
    if (os_log_type_enabled(v21, v22))
    {
      BOOL v23 = (uint8_t *)swift_slowAlloc();
      char v24 = (void *)swift_slowAlloc();
      uint64_t v28 = (uint64_t (*)(char *, uint64_t))v12;
      char v25 = v24;
      v30[0] = v24;
      uint64_t v27 = v4;
      *(_DWORD *)BOOL v23 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_24E32C6BC(a1, a2, (uint64_t *)v30);
      sub_24E3600B0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E31F000, v21, v22, "Setting user directory suffix: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v25, -1, -1);
      MEMORY[0x25333A4C0](v23, -1, -1);

      return v28(v10, v27);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      return ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
    }
  }
  else
  {
    uint64_t result = sub_24E360210();
    __break(1u);
  }
  return result;
}

uint64_t sub_24E34FCD4()
{
  uint64_t v0 = sub_24E35FD10();
  __swift_allocate_value_buffer(v0, qword_26B1B6420);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B6420);
  if (qword_26B1B64B8 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B6880);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_24E34FD9C()
{
  uint64_t v0 = sub_24E35FB80();
  __swift_allocate_value_buffer(v0, qword_26B1B63F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1B63F8);
  return sub_24E35FB70();
}

uint64_t (*sub_24E34FDF8())()
{
  return j__swift_endAccess;
}

uint64_t sub_24E34FE4C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6800);
  swift_allocObject();
  uint64_t result = sub_24E360460();
  qword_26B1B67E8 = result;
  return result;
}

uint64_t ActorServiceCollection.init()()
{
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = MEMORY[0x263F8EE78];
  uint64_t v1 = MEMORY[0x263F8EE80];
  *(unsigned char *)(v0 + 120) = 0;
  uint64_t v2 = MEMORY[0x263F8EE88];
  *(void *)(v0 + 128) = v1;
  *(void *)(v0 + 136) = v2;
  return v0;
}

uint64_t sub_24E34FEE4(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 112) = a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24E34FF40(uint64_t a1, uint64_t a2)
{
  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  return MEMORY[0x270FA2498](sub_24E34FF64, v2, 0);
}

uint64_t sub_24E34FF64()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    goto LABEL_10;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v4 = 0;
  while (1)
  {
    long long v15 = *(_OWORD *)(v2 + 16 * v4 + 32);
    swift_unknownObjectRetain();
    if (sub_24E3512A0()) {
      break;
    }
    swift_unknownObjectRelease();
    if (v3 == ++v4)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease_n();
  *(_OWORD *)(v0 + 40) = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63F0);
  if (swift_dynamicCast())
  {
    uint64_t v6 = *(void *)(v0 + 80);
    uint64_t v5 = *(void *)(v0 + 88);
    *(void *)(v0 + 104) = *(void *)(v0 + 56);
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    *(void *)(v0 + 112) = v7;
    *(void *)(v0 + 120) = (v5 + 24) & 0xFFFFFFFFFFFFLL | 0x69BB000000000000;
    swift_unknownObjectRetain();
    uint64_t v8 = v7(v6, v5);
    uint64_t v10 = v9;
    *(void *)(v0 + 128) = v9;
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_24E350190;
    uint64_t v12 = *(void *)(v0 + 96);
    v11[6] = v10;
    v11[7] = v12;
    v11[5] = v8;
    return MEMORY[0x270FA2498](sub_24E350638, v12, 0);
  }
  else
  {
LABEL_10:
    id v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13(0);
  }
}

uint64_t sub_24E350190()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 96);
    uint64_t v4 = sub_24E350320;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 96);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_24E3502B8;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E3502B8()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_unknownObjectRelease();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_24E350320()
{
  unint64_t v21 = v0;
  swift_bridgeObjectRelease();
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[18];
  uint64_t v2 = sub_24E35FD10();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1B6420);
  swift_unknownObjectRetain();
  id v3 = v1;
  swift_unknownObjectRetain();
  id v4 = v1;
  uint64_t v5 = sub_24E35FCF0();
  os_log_type_t v6 = sub_24E360010();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[18];
  if (v7)
  {
    uint64_t v9 = v0[10];
    char v18 = (uint64_t (*)(uint64_t, uint64_t))v0[14];
    uint64_t v10 = v0[11];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v19;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v13 = v18(v9, v10);
    v0[8] = sub_24E32C6BC(v13, v14, &v20);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2114;
    uint64_t v15 = sub_24E35FC20();
    v0[9] = v15;
    sub_24E3600B0();
    *uint64_t v12 = v15;

    _os_log_impl(&dword_24E31F000, v5, v6, "Error during getService for %{public}s: %{public}@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5520);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v19, -1, -1);
    MEMORY[0x25333A4C0](v11, -1, -1);

    swift_unknownObjectRelease_n();
  }
  else
  {
    swift_unknownObjectRelease_n();

    swift_unknownObjectRelease_n();
  }
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16(0);
}

uint64_t sub_24E350614(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  return MEMORY[0x270FA2498](sub_24E350638, v2, 0);
}

uint64_t sub_24E350638()
{
  uint64_t v1 = v0[7];
  swift_beginAccess();
  if (*(void *)(*(void *)(v1 + 128) + 16))
  {
    uint64_t v3 = v0[5];
    uint64_t v2 = v0[6];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E32CD14(v3, v2);
    if (v4)
    {
      uint64_t v6 = v0[6];
      uint64_t v5 = v0[7];
      uint64_t v7 = v0[5];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24E35FA58((unint64_t *)&qword_26B1B67F0, v8, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
      uint64_t v9 = (void *)swift_task_alloc();
      v0[8] = v9;
      v9[2] = v5;
      v9[3] = v7;
      v9[4] = v6;
      uint64_t v10 = (void *)swift_task_alloc();
      v0[9] = v10;
      *uint64_t v10 = v0;
      v10[1] = sub_24E35081C;
      return MEMORY[0x270FA2360]();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24E35081C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 56);
    char v4 = sub_24E350958;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 56);
    swift_task_dealloc();
    char v4 = sub_24E350940;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E350940()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24E350958()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E3509BC(uint64_t a1, uint64_t a2)
{
  v3[19] = a2;
  v3[20] = v2;
  v3[18] = a1;
  return MEMORY[0x270FA2498](sub_24E3509E0, v2, 0);
}

uint64_t sub_24E3509E0()
{
  uint64_t v38 = v0;
  uint64_t v1 = *(void *)(v0 + 160);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    goto LABEL_13;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v4 = 0;
  while (1)
  {
    long long v35 = *(_OWORD *)(v2 + 16 * v4 + 32);
    *(_OWORD *)uint64_t v37 = v35;
    swift_unknownObjectRetain();
    if (sub_24E3512A0()) {
      break;
    }
    swift_unknownObjectRelease();
    if (v3 == ++v4)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease_n();
  *(_OWORD *)(v0 + 104) = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63F0);
  if (swift_dynamicCast())
  {
    *(void *)(v0 + 168) = *(void *)(v0 + 120);
    uint64_t v5 = qword_26B1B67E0;
    swift_unknownObjectRetain();
    if (v5 != -1) {
      swift_once();
    }
    sub_24E360470();
    if (*(void *)(v0 + 88))
    {
      uint64_t v6 = *(void *)(v0 + 96);
      uint64_t v7 = *(void *)(v0 + 160);
      uint64_t ObjectType = swift_getObjectType();
      long long v36 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
      uint64_t v9 = v36(ObjectType, v6);
      uint64_t v11 = v10;
      swift_beginAccess();
      if (*(void *)(*(void *)(v7 + 128) + 16))
      {
        swift_bridgeObjectRetain();
        sub_24E32CD14(v9, v11);
        if (v12)
        {
          uint64_t v13 = *(void *)(v0 + 152);
          uint64_t v14 = *(void *)(v0 + 144);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v15 = v36(ObjectType, v6);
          uint64_t v17 = v16;
          uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 24))(v14, v13);
          uint64_t v20 = v19;
          swift_beginAccess();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_24E35D438(v37, v15, v17, v18, v20);
          swift_endAccess();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v27 = *(void *)(v0 + 144);
    uint64_t v28 = *(void *)(v0 + 152);
    uint64_t v29 = *(uint64_t (**)(uint64_t))(v28 + 24);
    *(void *)(v0 + 176) = v29;
    *(void *)(v0 + 184) = (v28 + 24) & 0xFFFFFFFFFFFFLL | 0x69BB000000000000;
    uint64_t v30 = v29(v27);
    uint64_t v32 = v31;
    *(void *)(v0 + 192) = v31;
    uint64_t v33 = (void *)swift_task_alloc();
    *(void *)(v0 + 200) = v33;
    *uint64_t v33 = v0;
    v33[1] = sub_24E350E28;
    uint64_t v34 = *(void *)(v0 + 160);
    v33[6] = v32;
    v33[7] = v34;
    v33[5] = v30;
    return MEMORY[0x270FA2498](sub_24E350638, v34, 0);
  }
  else
  {
LABEL_13:
    uint64_t v21 = sub_24E360490();
    uint64_t v23 = v22;
    sub_24E35F134();
    swift_allocError();
    *(void *)uint64_t v24 = v21;
    *(void *)(v24 + 8) = v23;
    *(unsigned char *)(v24 + 16) = 0;
    swift_willThrow();
    char v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25();
  }
}

uint64_t sub_24E350E28()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    uint64_t v4 = sub_24E350FB8;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 160);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_24E350F50;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E350F50()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 168);
  return v1(v2);
}

uint64_t sub_24E350FB8()
{
  uint64_t v21 = v0;
  swift_bridgeObjectRelease();
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[26];
  uint64_t v2 = sub_24E35FD10();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1B6420);
  swift_unknownObjectRetain();
  id v3 = v1;
  swift_unknownObjectRetain();
  id v4 = v1;
  uint64_t v5 = sub_24E35FCF0();
  os_log_type_t v6 = sub_24E360010();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v8 = (void *)v0[26];
  if (v7)
  {
    uint64_t v9 = v0[18];
    uint64_t v17 = (uint64_t (*)(uint64_t, uint64_t))v0[22];
    uint64_t v10 = v0[19];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v18 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v19;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v12 = v17(v9, v10);
    v0[17] = sub_24E32C6BC(v12, v13, &v20);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2114;
    uint64_t v14 = sub_24E35FC20();
    v0[16] = v14;
    sub_24E3600B0();
    void *v18 = v14;

    _os_log_impl(&dword_24E31F000, v5, v6, "Error during getService for %{public}s: %{public}@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5520);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v19, -1, -1);
    MEMORY[0x25333A4C0](v11, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }
  swift_willThrow();
  swift_unknownObjectRelease_n();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t sub_24E3512A0()
{
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63F0);
  uint64_t v0 = swift_dynamicCast();
  if (v0) {
    swift_unknownObjectRelease();
  }
  return v0;
}

uint64_t sub_24E351318()
{
  *(void *)(v1 + 256) = v0;
  *(void *)(v1 + 264) = *v0;
  return MEMORY[0x270FA2498](sub_24E351360, v0, 0);
}

int64_t sub_24E351360()
{
  uint64_t v1 = *(void *)(v0 + 256);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  *(void *)(v0 + 272) = v2;
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v27 = v0;
    id v4 = (void *)(*(void *)(v0 + 256) + 128);
    swift_bridgeObjectRetain_n();
    uint64_t v5 = (uint64_t *)(v2 + 40);
    while (1)
    {
      uint64_t v7 = *v5;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
      swift_unknownObjectRetain();
      uint64_t v10 = v9(ObjectType, v7);
      uint64_t v12 = v11;
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v14 = (void *)*v4;
      uint64_t v28 = (void *)*v4;
      void *v4 = 0x8000000000000000;
      unint64_t v16 = sub_24E32CD14(v10, v12);
      uint64_t v17 = v14[2];
      BOOL v18 = (v15 & 1) == 0;
      int64_t result = v17 + v18;
      if (__OFADD__(v17, v18))
      {
        __break(1u);
LABEL_25:
        __break(1u);
        return result;
      }
      char v20 = v15;
      if (v14[3] >= result)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          if (v15) {
            goto LABEL_3;
          }
        }
        else
        {
          int64_t result = (int64_t)sub_24E35C418(&qword_26B1B6508);
          uint64_t v14 = v28;
          if (v20) {
            goto LABEL_3;
          }
        }
      }
      else
      {
        sub_24E35AB94(result, isUniquelyReferenced_nonNull_native, &qword_26B1B6508);
        uint64_t v14 = v28;
        int64_t result = sub_24E32CD14(v10, v12);
        if ((v20 & 1) != (v21 & 1))
        {
          return sub_24E360350();
        }
        unint64_t v16 = result;
        if (v20)
        {
LABEL_3:
          uint64_t v6 = v14[7];
          swift_bridgeObjectRelease();
          *(void *)(v6 + 8 * v16) = MEMORY[0x263F8EE78];
          goto LABEL_4;
        }
      }
      v14[(v16 >> 6) + 8] |= 1 << v16;
      uint64_t v22 = (uint64_t *)(v14[6] + 16 * v16);
      *uint64_t v22 = v10;
      v22[1] = v12;
      *(void *)(v14[7] + 8 * v16) = MEMORY[0x263F8EE78];
      uint64_t v23 = v14[2];
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_25;
      }
      v14[2] = v25;
      swift_bridgeObjectRetain();
LABEL_4:
      void *v4 = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      swift_unknownObjectRelease();
      v5 += 2;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        uint64_t v0 = v27;
        goto LABEL_18;
      }
    }
  }
  swift_bridgeObjectRetain();
LABEL_18:
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 160) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  unint64_t v26 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v26;
  *unint64_t v26 = v0;
  v26[1] = sub_24E351698;
  return sub_24E354BA4((_OWORD *)(v0 + 16), (long long *)(v0 + 96));
}

uint64_t sub_24E351698()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 256);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E3517A8, v1, 0);
}

uint64_t sub_24E3517A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2[33];
  uint64_t v3 = v2[34];
  uint64_t v5 = v2[32];
  sub_24E35FA58((unint64_t *)&qword_26B1B67F0, a2, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
  uint64_t v6 = (void *)swift_task_alloc();
  v2[36] = v6;
  v6[2] = v3;
  v6[3] = v5;
  v6[4] = v4;
  uint64_t v7 = (void *)swift_task_alloc();
  v2[37] = v7;
  void *v7 = v2;
  v7[1] = sub_24E3518DC;
  return MEMORY[0x270FA22B8]();
}

uint64_t sub_24E3518DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 256);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E351A2C, v1, 0);
}

uint64_t sub_24E351A2C()
{
  uint64_t v38 = v0;
  if (qword_26B1B5C80 == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    uint64_t v1 = (uint64_t *)(v0 + 256);
    uint64_t v2 = sub_24E35FD10();
    uint64_t v3 = v0;
    __swift_project_value_buffer(v2, (uint64_t)qword_26B1B6420);
    swift_retain();
    uint64_t v4 = sub_24E35FCF0();
    os_log_type_t v5 = sub_24E360030();
    BOOL v6 = os_log_type_enabled(v4, v5);
    uint64_t v7 = *(void *)(v3 + 256);
    uint64_t v33 = v3;
    if (v6)
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 134217984;
      *(void *)(v3 + 248) = *(void *)(*(void *)(v7 + 112) + 16);
      sub_24E3600B0();
      swift_release();
      _os_log_impl(&dword_24E31F000, v4, v5, "%ld services started.", v8, 0xCu);
      MEMORY[0x25333A4C0](v8, -1, -1);
    }
    else
    {
      swift_release();
    }

    uint64_t v0 = *v1;
    *(unsigned char *)(*v1 + 120) = 1;
    swift_beginAccess();
    uint64_t v9 = *(void *)(v0 + 136);
    if (!*(void *)(v9 + 16)) {
      break;
    }
    uint64_t v35 = v9 + 56;
    uint64_t v10 = -1;
    uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
    if (-v11 < 64) {
      uint64_t v10 = ~(-1 << -(char)v11);
    }
    unint64_t v12 = v10 & *(void *)(v9 + 56);
    int64_t v36 = (unint64_t)(63 - v11) >> 6;
    swift_bridgeObjectRetain();
    int64_t v13 = 0;
    uint64_t v34 = v9;
    while (v12)
    {
      while (1)
      {
        unint64_t v14 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v15 = v14 | (v13 << 6);
LABEL_26:
        uint64_t v19 = (uint64_t *)(*(void *)(v9 + 48) + 32 * v15);
        uint64_t v20 = *v19;
        unint64_t v21 = v19[1];
        uint64_t v23 = v19[2];
        unint64_t v22 = v19[3];
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        BOOL v24 = sub_24E35FCF0();
        os_log_type_t v25 = sub_24E360030();
        uint64_t v0 = v25;
        if (os_log_type_enabled(v24, v25)) {
          break;
        }
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        if (!v12) {
          goto LABEL_12;
        }
      }
      uint64_t v26 = swift_slowAlloc();
      int64_t v27 = v13;
      uint64_t v28 = swift_slowAlloc();
      uint64_t v37 = v28;
      *(_DWORD *)uint64_t v26 = 136446466;
      swift_bridgeObjectRetain();
      *(void *)(v26 + 4) = sub_24E32C6BC(v20, v21, &v37);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(void *)(v26 + 14) = sub_24E32C6BC(v23, v22, &v37);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24E31F000, v24, (os_log_type_t)v0, "Startup dependency: %{public}s -> %{public}s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      uint64_t v29 = v28;
      int64_t v13 = v27;
      MEMORY[0x25333A4C0](v29, -1, -1);
      uint64_t v30 = v26;
      uint64_t v9 = v34;
      MEMORY[0x25333A4C0](v30, -1, -1);
    }
LABEL_12:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
    }
    else
    {
      if (v16 >= v36) {
        goto LABEL_29;
      }
      unint64_t v17 = *(void *)(v35 + 8 * v16);
      ++v13;
      if (v17) {
        goto LABEL_25;
      }
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v36) {
        goto LABEL_29;
      }
      unint64_t v17 = *(void *)(v35 + 8 * v13);
      if (v17) {
        goto LABEL_25;
      }
      int64_t v13 = v16 + 2;
      if (v16 + 2 >= v36) {
        goto LABEL_29;
      }
      unint64_t v17 = *(void *)(v35 + 8 * v13);
      if (v17) {
        goto LABEL_25;
      }
      int64_t v18 = v16 + 3;
      if (v18 >= v36)
      {
LABEL_29:
        swift_release();
        break;
      }
      unint64_t v17 = *(void *)(v35 + 8 * v18);
      if (v17)
      {
        int64_t v13 = v18;
LABEL_25:
        unint64_t v12 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v13 << 6);
        goto LABEL_26;
      }
      while (1)
      {
        int64_t v13 = v18 + 1;
        if (__OFADD__(v18, 1)) {
          break;
        }
        if (v13 >= v36) {
          goto LABEL_29;
        }
        unint64_t v17 = *(void *)(v35 + 8 * v13);
        ++v18;
        if (v17) {
          goto LABEL_25;
        }
      }
    }
    __break(1u);
  }
  uint64_t v31 = *(uint64_t (**)(void))(v33 + 8);
  return v31();
}

uint64_t sub_24E351EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E351F58, a4, 0);
}

uint64_t sub_24E351F58()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (long long *)(v1 + 32);
    uint64_t v4 = sub_24E35FF00();
    uint64_t v5 = *(void *)(v4 - 8);
    unint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    uint64_t v20 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    uint64_t v19 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v8 = *(void *)(v0 + 104);
      uint64_t v7 = *(void *)(v0 + 112);
      long long v22 = *v3;
      long long v23 = *(_OWORD *)(v0 + 88);
      v21(v7, 1, 1, v4);
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = 0;
      uint64_t v10 = (void *)(v9 + 16);
      *(void *)(v9 + 24) = 0;
      *(_OWORD *)(v9 + 32) = v22;
      *(_OWORD *)(v9 + 48) = v23;
      sub_24E32DA28(v7, v8, &qword_26B1B6810);
      LODWORD(v8) = (*v20)(v8, 1, v4);
      swift_unknownObjectRetain_n();
      swift_retain();
      uint64_t v11 = *(void *)(v0 + 104);
      if (v8 == 1)
      {
        sub_24E32D33C(*(void *)(v0 + 104), &qword_26B1B6810);
        if (!*v10) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_24E35FEF0();
        (*v19)(v11, v4);
        if (!*v10)
        {
LABEL_8:
          uint64_t v12 = 0;
          uint64_t v14 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_24E35FEC0();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v15 = **(void **)(v0 + 72);
      uint64_t v16 = v14 | v12;
      if (v14 | v12)
      {
        uint64_t v16 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v12;
        *(void *)(v0 + 40) = v14;
      }
      uint64_t v6 = *(void *)(v0 + 112);
      *(void *)(v0 + 48) = 1;
      *(void *)(v0 + 56) = v16;
      *(void *)(v0 + 64) = v15;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_24E32D33C(v6, &qword_26B1B6810);
      ++v3;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_24E352240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a1;
  v6[5] = a4;
  return MEMORY[0x270FA2498](sub_24E352264, 0, 0);
}

uint64_t sub_24E352264()
{
  if (qword_26B1B67E0 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  v0[2] = v3;
  v0[3] = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  swift_unknownObjectRetain();
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_24E3523D0;
  uint64_t v6 = v0[4];
  return MEMORY[0x270FA23C8](v6, v0 + 2, &unk_2698D91F0, v4, 0, 0, 0xD000000000000030, 0x800000024E362E80);
}

uint64_t sub_24E3523D0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24E352534, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24E352534()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24E35254C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v7;
  void *v7 = v4;
  v7[1] = sub_24E322CD0;
  return sub_24E3525F8(a3, a4);
}

uint64_t sub_24E3525F8(uint64_t a1, uint64_t a2)
{
  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  v3[22] = *v2;
  uint64_t v4 = sub_24E360430();
  v3[23] = v4;
  v3[24] = *(void *)(v4 - 8);
  v3[25] = swift_task_alloc();
  uint64_t v5 = sub_24E3601B0();
  v3[26] = v5;
  v3[27] = *(void *)(v5 - 8);
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  uint64_t v6 = sub_24E3601D0();
  v3[38] = v6;
  v3[39] = *(void *)(v6 - 8);
  v3[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  v3[41] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E35283C, v2, 0);
}

uint64_t sub_24E35283C()
{
  long long v22 = v0;
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E35FD10();
  v0[42] = __swift_project_value_buffer(v1, (uint64_t)qword_26B1B6420);
  swift_unknownObjectRetain_n();
  uint64_t v2 = sub_24E35FCF0();
  os_log_type_t v3 = sub_24E360030();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[19];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v21 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_getObjectType();
    v0[17] = v4;
    uint64_t v7 = sub_24E3602F0();
    v0[18] = sub_24E32C6BC(v7, v8, &v21);
    sub_24E3600B0();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24E31F000, v2, v3, "Starting service: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v6, -1, -1);
    MEMORY[0x25333A4C0](v5, -1, -1);
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  uint64_t v9 = v0[41];
  uint64_t v10 = v0[21];
  uint64_t v11 = v0[22];
  uint64_t v12 = v0[19];
  uint64_t v13 = v0[20];
  uint64_t v14 = sub_24E35FF00();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  uint64_t v16 = sub_24E35FA58((unint64_t *)&qword_26B1B67F0, v15, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v10;
  *(void *)(v17 + 24) = v16;
  *(_OWORD *)(v17 + 32) = xmmword_24E362080;
  *(void *)(v17 + 48) = v12;
  *(void *)(v17 + 56) = v13;
  *(void *)(v17 + 64) = v10;
  *(void *)(v17 + 72) = v11;
  swift_retain_n();
  swift_unknownObjectRetain();
  v0[43] = sub_24E33ABB0(v9, (uint64_t)&unk_2698D9208, v17);
  sub_24E3601C0();
  sub_24E3601A0();
  uint64_t v18 = swift_allocObject();
  v0[44] = v18;
  *(void *)(v18 + 16) = v12;
  *(void *)(v18 + 24) = v13;
  swift_unknownObjectRetain();
  uint64_t v19 = (void *)swift_task_alloc();
  v0[45] = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_24E352BE4;
  return MEMORY[0x270F28C80]();
}

uint64_t sub_24E352BE4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 368) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 168);
    uint64_t v4 = sub_24E3536F0;
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 168);
    swift_release();
    uint64_t v4 = sub_24E352D0C;
    uint64_t v3 = v5;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24E352D0C()
{
  v99 = v0;
  uint64_t v1 = v0;
  uint64_t v2 = v0[21];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6530);
  sub_24E35FF60();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 112);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v1[20];
    uint64_t ObjectType = swift_getObjectType();
    int64_t v90 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    swift_bridgeObjectRetain();
    uint64_t v6 = (uint64_t *)(v3 + 40);
    while (1)
    {
      uint64_t v94 = v1[20];
      uint64_t v7 = v1;
      uint64_t v8 = *v6;
      uint64_t v9 = swift_getObjectType();
      uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 24);
      swift_unknownObjectRetain();
      uint64_t v11 = v10(v9, v8);
      uint64_t v13 = v12;
      if (v11 == v90(ObjectType, v94) && v13 == v14) {
        break;
      }
      char v16 = sub_24E360320();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      if (v16) {
        goto LABEL_14;
      }
      v6 += 2;
      --v4;
      uint64_t v1 = v7;
      if (!v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease_n();
    swift_unknownObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v44 = v7[36];
    *(void *)unint64_t v87 = v7[37];
    uint64_t v83 = v7[35];
    uint64_t v96 = v7[34];
    uint64_t v46 = v7[26];
    uint64_t v45 = v7[27];
    uint64_t v47 = v90(ObjectType, v7[20]);
    sub_24E35931C(v47, v48);
    swift_bridgeObjectRelease();
    sub_24E3601A0();
    unint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
    v49(v83, *(void *)v87, v46);
    v49(v96, v44, v46);
    swift_unknownObjectRetain_n();
    uint64_t v50 = sub_24E35FCF0();
    v97 = v50;
    os_log_type_t v88 = sub_24E360030();
    BOOL v51 = os_log_type_enabled(v50, v88);
    uint64_t v52 = v7[39];
    uint64_t v53 = v7[40];
    uint64_t v55 = v7[37];
    uint64_t v54 = v7[38];
    uint64_t v56 = v7[36];
    uint64_t v91 = v7[35];
    uint64_t v93 = v7[34];
    uint64_t v58 = v7[26];
    uint64_t v57 = v7[27];
    if (v51)
    {
      *(void *)typea = v7[38];
      uint64_t v84 = v7[39];
      uint64_t v59 = v7[25];
      uint64_t v71 = v7[24];
      uint64_t v72 = v7[23];
      uint64_t v60 = v7[19];
      uint64_t v80 = v7[40];
      uint64_t v61 = swift_slowAlloc();
      uint64_t v74 = swift_slowAlloc();
      uint64_t v98 = v74;
      *(_DWORD *)uint64_t v61 = 136446466;
      uint64_t v76 = v55;
      v7[14] = v60;
      uint64_t v62 = sub_24E3602F0();
      v7[15] = sub_24E32C6BC(v62, v63, &v98);
      sub_24E3600B0();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      *(_WORD *)(v61 + 12) = 2082;
      sub_24E360420();
      sub_24E35FA58(&qword_26B1B64F8, 255, MEMORY[0x263F8F6D8]);
      uint64_t v64 = sub_24E360410();
      unint64_t v66 = v65;
      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v59, v72);
      v7[16] = sub_24E32C6BC(v64, v66, &v98);
      sub_24E3600B0();
      swift_bridgeObjectRelease();
      uint64_t v67 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
      v67(v91, v58);
      v67(v93, v58);
      _os_log_impl(&dword_24E31F000, v97, v88, "Service startup complete: %{public}s duration: %{public}s", (uint8_t *)v61, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v74, -1, -1);
      MEMORY[0x25333A4C0](v61, -1, -1);
      swift_release();

      v67(v56, v58);
      v67(v76, v58);
      (*(void (**)(uint64_t, os_log_type_t *))(v84 + 8))(v80, *(os_log_type_t **)typea);
    }
    else
    {
      swift_release();

      uint64_t v68 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
      v68(v91, v58);
      v68(v93, v58);
      swift_unknownObjectRelease_n();
      v68(v56, v58);
      v68(v55, v58);
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v53, v54);
    }
    uint64_t v1 = v7;
  }
  else
  {
LABEL_10:
    uint64_t v17 = v1[37];
    uint64_t v19 = v1[32];
    uint64_t v18 = v1[33];
    uint64_t v20 = v1[31];
    uint64_t v22 = v1[26];
    uint64_t v21 = v1[27];
    sub_24E3601A0();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
    v23(v19, v17, v22);
    v23(v20, v18, v22);
    swift_unknownObjectRetain_n();
    uint64_t v24 = sub_24E35FCF0();
    os_log_type_t v25 = sub_24E360010();
    BOOL v26 = os_log_type_enabled(v24, v25);
    uint64_t v27 = v1[39];
    uint64_t v28 = v1[40];
    uint64_t v30 = v1[37];
    uint64_t v29 = v1[38];
    uint64_t v31 = v1[33];
    uint64_t v92 = v1[32];
    uint64_t v95 = v1[31];
    uint64_t v33 = v1[26];
    uint64_t v32 = v1[27];
    if (v26)
    {
      os_log_type_t type = v25;
      uint64_t v73 = v1[25];
      uint64_t v75 = v1[24];
      uint64_t v77 = v1[23];
      *(void *)uint64_t v86 = v1[37];
      uint64_t v34 = v1[19];
      uint64_t v85 = v1[38];
      uint64_t v35 = swift_slowAlloc();
      uint64_t v79 = swift_slowAlloc();
      uint64_t v98 = v79;
      *(_DWORD *)uint64_t v35 = 136446466;
      os_log_t log = v24;
      int64_t v36 = v1;
      swift_getObjectType();
      v1[11] = v34;
      uint64_t v37 = sub_24E3602F0();
      v1[12] = sub_24E32C6BC(v37, v38, &v98);
      sub_24E3600B0();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      *(_WORD *)(v35 + 12) = 2082;
      sub_24E360420();
      sub_24E35FA58(&qword_26B1B64F8, 255, MEMORY[0x263F8F6D8]);
      uint64_t v39 = sub_24E360410();
      unint64_t v41 = v40;
      (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v73, v77);
      v36[13] = sub_24E32C6BC(v39, v41, &v98);
      sub_24E3600B0();
      uint64_t v1 = v36;
      swift_bridgeObjectRelease();
      uint64_t v42 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      v42(v92, v33);
      v42(v95, v33);
      _os_log_impl(&dword_24E31F000, log, type, "Service startup FAILED: %{public}s duration: %{public}s", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v79, -1, -1);
      MEMORY[0x25333A4C0](v35, -1, -1);
      swift_release();

      v42(v31, v33);
      v42(*(void *)v86, v33);
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v85);
    }
    else
    {
      swift_release();

      uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      v43(v92, v33);
      v43(v95, v33);
      swift_unknownObjectRelease_n();
      v43(v31, v33);
      v43(v30, v33);
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v29);
    }
  }
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
  uint64_t v69 = (uint64_t (*)(void))v1[1];
  return v69();
}

uint64_t sub_24E3536F0()
{
  uint64_t v57 = v0;
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[19];
  swift_release();
  swift_beginAccess();
  swift_unknownObjectRetain();
  uint64_t v4 = sub_24E35EC58(v2 + 112, v3, v1);
  uint64_t result = swift_unknownObjectRelease();
  int64_t v6 = *(void *)(*(void *)(v2 + 112) + 16);
  if (v6 < v4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = (void *)v0[46];
    uint64_t v47 = v0[30];
    *(void *)os_log_type_t type = v0[29];
    uint64_t v51 = v0[37];
    uint64_t v8 = v0[27];
    uint64_t v53 = v0[28];
    uint64_t v9 = v0[26];
    uint64_t v10 = v0[20];
    sub_24E35EFC0(v4, v6);
    swift_endAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6530);
    sub_24E35FF60();
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v45 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 24);
    uint64_t v12 = v45(ObjectType, v10);
    sub_24E359000(v12, v13, v7);
    swift_bridgeObjectRelease();
    sub_24E3601A0();
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    v14(*(void *)type, v51, v9);
    v14(v53, v47, v9);
    swift_unknownObjectRetain();
    id v15 = v7;
    swift_unknownObjectRetain();
    id v16 = v7;
    uint64_t v17 = sub_24E35FCF0();
    os_log_type_t v18 = sub_24E360010();
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v20 = (void *)v0[46];
    uint64_t v21 = v0[28];
    uint64_t v22 = v0[29];
    uint64_t v24 = v0[26];
    uint64_t v23 = v0[27];
    if (v19)
    {
      uint64_t v43 = v0[25];
      uint64_t v46 = v0[24];
      uint64_t v48 = v0[23];
      os_log_t log = v17;
      uint64_t v25 = v0[20];
      uint64_t v44 = v0[28];
      uint64_t v26 = swift_slowAlloc();
      uint64_t v54 = (void *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      v56[0] = v52;
      *(_DWORD *)uint64_t v26 = 136446722;
      uint64_t v27 = v45(ObjectType, v25);
      v0[10] = sub_24E32C6BC(v27, v28, v56);
      sub_24E3600B0();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2114;
      uint64_t v29 = sub_24E35FC20();
      v0[8] = v29;
      sub_24E3600B0();
      *uint64_t v54 = v29;

      *(_WORD *)(v26 + 22) = 2082;
      sub_24E360420();
      sub_24E35FA58(&qword_26B1B64F8, 255, MEMORY[0x263F8F6D8]);
      uint64_t v30 = v22;
      uint64_t v31 = sub_24E360410();
      unint64_t v33 = v32;
      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v43, v48);
      v0[9] = sub_24E32C6BC(v31, v33, v56);
      sub_24E3600B0();
      swift_bridgeObjectRelease();
      uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
      v34(v30, v24);
      uint64_t v55 = v34;
      v34(v44, v24);
      _os_log_impl(&dword_24E31F000, log, v18, "Error starting service: %{public}s, error: %{public}@ duration: %{public}s", (uint8_t *)v26, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5520);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v54, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v52, -1, -1);
      MEMORY[0x25333A4C0](v26, -1, -1);
    }
    else
    {
      swift_unknownObjectRelease_n();

      uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
      v35(v22, v24);
      uint64_t v55 = v35;
      v35(v21, v24);
    }
    uint64_t v36 = v0[40];
    uint64_t v37 = v0[38];
    uint64_t v38 = v0[39];
    uint64_t v39 = v0[37];
    uint64_t v40 = v0[30];
    uint64_t v41 = v0[26];
    swift_willThrow();
    swift_release();
    v55(v40, v41);
    v55(v39, v41);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
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
    uint64_t v42 = (uint64_t (*)(void))v0[1];
    return v42();
  }
  return result;
}

uint64_t sub_24E353D18()
{
  *(void *)(v1 + 16) = v0;
  *(void *)(v1 + 24) = *v0;
  return MEMORY[0x270FA2498](sub_24E353D60, v0, 0);
}

uint64_t sub_24E353D60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2[2];
  uint64_t v4 = v2[3];
  sub_24E35FA58((unint64_t *)&qword_26B1B67F0, a2, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
  uint64_t v5 = swift_task_alloc();
  v2[4] = v5;
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  int64_t v6 = (void *)swift_task_alloc();
  v2[5] = v6;
  void *v6 = v2;
  v6[1] = sub_24E353E84;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_24E353E84()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E350940, v1, 0);
}

uint64_t sub_24E353FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a3;
  v4[14] = a4;
  v4[12] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E35405C, a3, 0);
}

uint64_t sub_24E35405C()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v26 = *(void *)(v2 + 16);
  if (v26)
  {
    uint64_t v3 = sub_24E35FF00();
    uint64_t v4 = *(void *)(v3 - 8);
    uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    uint64_t v23 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
    uint64_t v22 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v25 = v3;
    while (1)
    {
      uint64_t v8 = *(void *)(v0 + 120);
      uint64_t v7 = *(void *)(v0 + 128);
      uint64_t v9 = *(void *)(v0 + 112);
      uint64_t v10 = v2;
      long long v27 = *(_OWORD *)(v2 + 16 * v5 + 32);
      v24(v7, 1, 1, v3);
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = 0;
      uint64_t v12 = (void *)(v11 + 16);
      *(void *)(v11 + 24) = 0;
      *(_OWORD *)(v11 + 32) = v27;
      *(void *)(v11 + 48) = v9;
      sub_24E32DA28(v7, v8, &qword_26B1B6810);
      LODWORD(v8) = (*v23)(v8, 1, v3);
      swift_unknownObjectRetain_n();
      uint64_t v13 = *(void *)(v0 + 120);
      if (v8 == 1)
      {
        sub_24E32D33C(*(void *)(v0 + 120), &qword_26B1B6810);
        if (!*v12) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_24E35FEF0();
        (*v22)(v13, v3);
        if (!*v12)
        {
LABEL_8:
          uint64_t v14 = 0;
          uint64_t v16 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v14 = sub_24E35FEC0();
      uint64_t v16 = v15;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v17 = **(void **)(v0 + 96);
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = &unk_2698D9250;
      *(void *)(v18 + 24) = v11;
      uint64_t v19 = v16 | v14;
      if (v16 | v14)
      {
        uint64_t v19 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v14;
        *(void *)(v0 + 40) = v16;
      }
      uint64_t v2 = v10;
      ++v5;
      uint64_t v6 = *(void *)(v0 + 128);
      *(void *)(v0 + 72) = 1;
      *(void *)(v0 + 80) = v19;
      *(void *)(v0 + 88) = v17;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_24E32D33C(v6, &qword_26B1B6810);
      uint64_t v3 = v25;
      if (v26 == v5)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_24E354394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 64) = a4;
  *(void *)(v5 + 72) = a5;
  return MEMORY[0x270FA2498](sub_24E3543B4, 0, 0);
}

uint64_t sub_24E3543B4()
{
  uint64_t v16 = v0;
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E35FD10();
  v0[10] = __swift_project_value_buffer(v1, (uint64_t)qword_26B1B6420);
  swift_unknownObjectRetain_n();
  uint64_t v2 = sub_24E35FCF0();
  os_log_type_t v3 = sub_24E360030();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = v0[8];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v15 = v6;
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_getObjectType();
    v0[6] = v4;
    uint64_t v7 = sub_24E3602F0();
    v0[7] = sub_24E32C6BC(v7, v8, &v15);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_24E31F000, v2, v3, "Running service: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v6, -1, -1);
    MEMORY[0x25333A4C0](v5, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  uint64_t v14 = v0[9];
  uint64_t ObjectType = swift_getObjectType();
  v0[11] = ObjectType;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v14 + 64) + **(int **)(v14 + 64));
  uint64_t v10 = (void *)swift_task_alloc();
  v0[12] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_24E354660;
  uint64_t v11 = v0[9];
  return v13(ObjectType, v11);
}

uint64_t sub_24E354660()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24E354924;
  }
  else {
    uint64_t v2 = sub_24E354774;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24E354774()
{
  uint64_t v11 = v0;
  swift_unknownObjectRetain_n();
  uint64_t v1 = sub_24E35FCF0();
  os_log_type_t v2 = sub_24E360030();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[8];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136446210;
    uint64_t v10 = v5;
    v0[4] = v3;
    uint64_t v6 = sub_24E3602F0();
    v0[5] = sub_24E32C6BC(v6, v7, &v10);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_24E31F000, v1, v2, "Done running service: %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v5, -1, -1);
    MEMORY[0x25333A4C0](v4, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  unint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_24E354924()
{
  uint64_t v19 = v0;
  uint64_t v1 = (void *)v0[13];
  swift_unknownObjectRetain();
  id v2 = v1;
  swift_unknownObjectRetain();
  id v3 = v1;
  uint64_t v4 = sub_24E35FCF0();
  os_log_type_t v5 = sub_24E360010();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v16 = (void *)v0[13];
    uint64_t v6 = v0[11];
    uint64_t v7 = v0[9];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = v17;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
    v0[2] = sub_24E32C6BC(v10, v11, &v18);
    sub_24E3600B0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2114;
    uint64_t v12 = sub_24E35FC20();
    v0[3] = v12;
    sub_24E3600B0();
    *uint64_t v9 = v12;

    _os_log_impl(&dword_24E31F000, v4, v5, "Uncaught error running service: %{public}s, error: %{public}@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B5520);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25333A4C0](v17, -1, -1);
    MEMORY[0x25333A4C0](v8, -1, -1);
  }
  else
  {
    uint64_t v13 = (void *)v0[13];

    swift_unknownObjectRelease_n();
  }
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_24E354BA4(_OWORD *a1, long long *a2)
{
  *(void *)(v3 + 296) = v2;
  uint64_t v6 = sub_24E35FCE0();
  *(void *)(v3 + 304) = v6;
  *(void *)(v3 + 312) = *(void *)(v6 - 8);
  *(void *)(v3 + 320) = swift_task_alloc();
  *(void *)(v3 + 328) = swift_task_alloc();
  *(void *)(v3 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63B0);
  *(void *)(v3 + 344) = swift_task_alloc();
  *(void *)(v3 + 352) = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63A8);
  *(void *)(v3 + 360) = v7;
  *(void *)(v3 + 368) = *(void *)(v7 - 8);
  *(void *)(v3 + 376) = swift_task_alloc();
  long long v8 = a1[1];
  *(_OWORD *)(v3 + 384) = *a1;
  *(_OWORD *)(v3 + 400) = v8;
  long long v9 = a1[3];
  *(_OWORD *)(v3 + 416) = a1[2];
  *(_OWORD *)(v3 + 432) = v9;
  long long v10 = *a2;
  long long v11 = a2[1];
  *(_OWORD *)(v3 + 448) = a1[4];
  *(_OWORD *)(v3 + 464) = v10;
  long long v12 = a2[2];
  long long v13 = a2[3];
  *(_OWORD *)(v3 + 480) = v11;
  *(_OWORD *)(v3 + 496) = v12;
  long long v14 = a2[4];
  *(_OWORD *)(v3 + 512) = v13;
  *(_OWORD *)(v3 + 528) = v14;
  return MEMORY[0x270FA2498](sub_24E354D5C, v2, 0);
}

uint64_t sub_24E354D5C()
{
  uint64_t v87 = v0;
  uint64_t v1 = *(void *)(v0 + 472);
  uint64_t v2 = *(void *)(v0 + 392);
  if (v2)
  {
    if (!v1) {
      return sub_24E360210();
    }
    goto LABEL_5;
  }
  if (v1)
  {
LABEL_5:
    uint64_t v83 = (char *)(v0 + 824);
    object = *(void **)(v0 + 472);
    uint64_t v4 = *(void **)(v0 + 496);
    int v5 = *(_DWORD *)(v0 + 512) & 1;
    sub_24E35F188(*(void *)(v0 + 384), v2);
    uint64_t v6 = *(void **)(v0 + 536);
    uint64_t v7 = *(void *)(v0 + 528);
    Swift::Int v8 = *(void *)(v0 + 520);
    Swift::Int v9 = *(void *)(v0 + 504);
    Swift::Int v10 = *(void *)(v0 + 480);
    uint64_t v11 = *(void *)(v0 + 488);
    long long v12 = *(void **)(v0 + 456);
    uint64_t v13 = *(void *)(v0 + 464);
    Swift::Int v14 = *(void *)(v0 + 440);
    uint64_t v15 = *(void *)(v0 + 448);
    Swift::Int v17 = *(void *)(v0 + 424);
    uint64_t v16 = *(void *)(v0 + 432);
    uint64_t v19 = *(void *)(v0 + 408);
    uint64_t v18 = *(void **)(v0 + 416);
    uint64_t v21 = *(void **)(v0 + 392);
    Swift::Int v20 = *(void *)(v0 + 400);
    char v22 = 1;
    uint64_t v23 = *(void *)(v0 + 384);
    goto LABEL_6;
  }
  uint64_t v83 = (char *)(v0 + 824);
  v38._uint64_t countAndFlagsBits = sub_24E35FAB0();
  SystemVersionNumber.init(string:)(&v86, v38);
  if (!v86.value.rawValue._object) {
    goto LABEL_39;
  }
  object = v86.value.rawValue._object;
  uint64_t v26 = v86.value.baseLetter._object;
  Swift::Int baseNumber = v86.value.baseNumber;
  Swift::Int value = v86.value.childType.value;
  Swift::Int buildNumber = v86.value.buildNumber;
  Swift::String_optional suffix = v86.value.suffix;
  uint64_t countAndFlagsBits = v86.value.rawValue._countAndFlagsBits;
  uint64_t v78 = v86.value.baseLetter._countAndFlagsBits;
  Swift::Bool is_nil = v86.value.childType.is_nil;
  if (qword_26B1B6458 != -1) {
    swift_once();
  }
  uint64_t v40 = *(void *)(v0 + 368);
  uint64_t v39 = *(void *)(v0 + 376);
  uint64_t v41 = *(void *)(v0 + 360);
  uint64_t v42 = __swift_project_value_buffer(v41, (uint64_t)qword_26B1B6438);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v39, v42, v41);
  sub_24E35FB40();
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
  uint64_t v43 = *(void *)(v0 + 288);
  if (!v43)
  {
    char v24 = 0;
    uint64_t v25 = countAndFlagsBits;
    goto LABEL_13;
  }
  uint64_t v44 = *(void *)(v0 + 280);
  SystemVersionNumber.init(string:)(&v86, *(Swift::String *)(&v43 - 1));
  char v22 = 0;
  uint64_t v23 = v86.value.rawValue._countAndFlagsBits;
  uint64_t v21 = v86.value.rawValue._object;
  uint64_t v4 = v26;
  Swift::Int v20 = v86.value.baseNumber;
  uint64_t v19 = v86.value.baseLetter._countAndFlagsBits;
  LOBYTE(v5) = is_nil;
  uint64_t v18 = v86.value.baseLetter._object;
  Swift::Int v17 = v86.value.childType.value;
  uint64_t v16 = *(void *)&v86.value.childType.is_nil;
  Swift::Int v14 = v86.value.buildNumber;
  uint64_t v15 = v86.value.suffix.value._countAndFlagsBits;
  long long v12 = v86.value.suffix.value._object;
  uint64_t v6 = suffix.value._object;
  uint64_t v7 = suffix.value._countAndFlagsBits;
  Swift::Int v9 = value;
  Swift::Int v8 = buildNumber;
  uint64_t v11 = v78;
  Swift::Int v10 = baseNumber;
  uint64_t v13 = countAndFlagsBits;
LABEL_6:
  suffix.value._object = v6;
  *(void *)(v0 + 688) = v6;
  *(void *)(v0 + 680) = v7;
  *(void *)(v0 + 672) = v8;
  Swift::Bool v75 = v5;
  v83[1] = v5;
  Swift::Int baseNumber = v10;
  Swift::Int value = v9;
  *(void *)(v0 + 664) = v9;
  uint64_t v76 = v4;
  uint64_t v78 = v11;
  *(void *)(v0 + 656) = v4;
  *(void *)(v0 + 648) = v11;
  *(void *)(v0 + 640) = v10;
  *(void *)(v0 + 632) = object;
  *(void *)(v0 + 624) = v13;
  char v24 = v22;
  *uint64_t v83 = v22;
  *(void *)(v0 + 616) = v12;
  *(void *)(v0 + 608) = v15;
  *(void *)(v0 + 600) = v14;
  *(void *)(v0 + 592) = v16;
  *(void *)(v0 + 584) = v17;
  *(void *)(v0 + 576) = v18;
  *(void *)(v0 + 568) = v19;
  *(void *)(v0 + 560) = v20;
  *(void *)(v0 + 552) = v21;
  *(void *)(v0 + 544) = v23;
  uint64_t v25 = v13;
  Swift::Int buildNumber = v8;
  suffix.value._uint64_t countAndFlagsBits = v7;
  if (!v21)
  {
    sub_24E35F188(*(void *)(v0 + 464), *(void *)(v0 + 472));
    uint64_t v26 = v76;
    Swift::Bool is_nil = v75;
LABEL_13:
    *(Swift::String_optional *)(v0 + 752) = suffix;
    *(void *)(v0 + 744) = buildNumber;
    v83[3] = is_nil;
    *(void *)(v0 + 736) = value;
    *(void *)(v0 + 728) = v26;
    *(void *)(v0 + 720) = v78;
    *(void *)(v0 + 712) = baseNumber;
    *(void *)(v0 + 704) = object;
    *(void *)(v0 + 696) = v25;
    v83[2] = v24;
    uint64_t v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 768) = v28;
    *uint64_t v28 = v0;
    v28[1] = sub_24E3558C4;
    uint64_t v29 = *(void *)(v0 + 296);
    void v28[2] = v29;
    uint64_t v30 = sub_24E356DA4;
LABEL_45:
    return MEMORY[0x270FA2498](v30, v29, 0);
  }
  uint64_t v73 = v15;
  uint64_t v74 = v12;
  Swift::Int v84 = v14;
  if ((v23 != v13 || v21 != object) && (sub_24E360320() & 1) == 0)
  {
    *(void *)(v0 + 96) = v23;
    *(void *)(v0 + 104) = v21;
    *(void *)(v0 + 112) = v20;
    *(void *)(v0 + 120) = v19;
    *(void *)(v0 + 128) = v18;
    *(void *)(v0 + 136) = v17;
    *(unsigned char *)(v0 + 144) = v16 & 1;
    *(void *)(v0 + 152) = v84;
    *(void *)(v0 + 160) = v73;
    *(void *)(v0 + 168) = v74;
    *(void *)(v0 + 16) = v25;
    *(void *)(v0 + 24) = object;
    *(void *)(v0 + 32) = baseNumber;
    *(void *)(v0 + 40) = v78;
    *(void *)(v0 + 48) = v76;
    *(void *)(v0 + 56) = value;
    *(unsigned char *)(v0 + 64) = v75;
    uint64_t v64 = *(void *)(v0 + 472);
    *(void *)(v0 + 72) = buildNumber;
    *(void *)(v0 + 80) = suffix.value._countAndFlagsBits;
    uint64_t v65 = *(void *)(v0 + 464);
    *(void *)(v0 + 88) = suffix.value._object;
    sub_24E35F188(v65, v64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v66 = swift_task_alloc();
    *(void *)(v0 + 776) = v66;
    *(void *)uint64_t v66 = v0;
    *(void *)(v66 + 8) = sub_24E35600C;
    uint64_t v29 = *(void *)(v0 + 296);
    *(void *)(v66 + 216) = v0 + 16;
    *(void *)(v66 + 224) = v29;
    *(void *)(v66 + 208) = v0 + 96;
    *(_OWORD *)(v66 + 96) = *(_OWORD *)(v0 + 96);
    long long v67 = *(_OWORD *)(v0 + 160);
    long long v69 = *(_OWORD *)(v0 + 112);
    long long v68 = *(_OWORD *)(v0 + 128);
    *(_OWORD *)(v66 + 144) = *(_OWORD *)(v0 + 144);
    *(_OWORD *)(v66 + 160) = v67;
    *(_OWORD *)(v66 + 112) = v69;
    *(_OWORD *)(v66 + 128) = v68;
    long long v71 = *(_OWORD *)(v0 + 32);
    long long v70 = *(_OWORD *)(v0 + 48);
    long long v72 = *(_OWORD *)(v0 + 80);
    *(_OWORD *)(v66 + 64) = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v66 + 80) = v72;
    *(_OWORD *)(v66 + 32) = v71;
    *(_OWORD *)(v66 + 48) = v70;
    *(_OWORD *)(v66 + 16) = *(_OWORD *)(v0 + 16);
    uint64_t v30 = sub_24E357590;
    goto LABEL_45;
  }
  sub_24E35F188(*(void *)(v0 + 464), *(void *)(v0 + 472));
  sub_24E35F1D8(v23, (uint64_t)v21);
  if (v24)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v86.value.rawValue._uint64_t countAndFlagsBits = v25;
    v86.value.rawValue._object = object;
    v86.value.Swift::Int baseNumber = baseNumber;
    v86.value.baseLetter._uint64_t countAndFlagsBits = v78;
    v86.value.baseLetter._object = v76;
    v86.value.childType.Swift::Int value = value;
    v86.value.childType.Swift::Bool is_nil = v75;
    v86.value.Swift::Int buildNumber = buildNumber;
    v86.value.Swift::String_optional suffix = suffix;
    uint64_t v31 = SystemVersionNumber.description.getter();
    uint64_t v33 = v32;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B1B6458 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 360), (uint64_t)qword_26B1B6438);
    *(void *)(v0 + 248) = v31;
    *(void *)(v0 + 256) = v33;
    swift_beginAccess();
    sub_24E35FB50();
    swift_endAccess();
  }
  sub_24E35FAC0();
  if (qword_26B1B6480 != -1) {
    swift_once();
  }
  uint64_t v35 = *(void *)(v0 + 368);
  uint64_t v34 = *(void *)(v0 + 376);
  uint64_t v36 = *(void *)(v0 + 360);
  uint64_t v37 = __swift_project_value_buffer(v36, (uint64_t)qword_26B1B6460);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v34, v37, v36);
  sub_24E35FB40();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
  if (*(void *)(v0 + 272))
  {
    sub_24E35FCB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 312) + 56))(*(void *)(v0 + 352), 1, 1, *(void *)(v0 + 304));
  }
  uint64_t v45 = *(void *)(v0 + 344);
  uint64_t v46 = *(void *)(v0 + 352);
  uint64_t v47 = *(void *)(v0 + 304);
  uint64_t v48 = *(void *)(v0 + 312);
  (*(void (**)(void, void, uint64_t))(v48 + 16))(*(void *)(v0 + 328), *(void *)(v0 + 336), v47);
  sub_24E32DA28(v46, v45, &qword_26B1B63B0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v45, 1, v47) == 1)
  {
    sub_24E32D33C(*(void *)(v0 + 344), &qword_26B1B63B0);
    if (qword_26B1B5C80 != -1) {
      swift_once();
    }
    uint64_t v49 = sub_24E35FD10();
    __swift_project_value_buffer(v49, (uint64_t)qword_26B1B6420);
    uint64_t v50 = sub_24E35FCF0();
    os_log_type_t v51 = sub_24E360030();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl(&dword_24E31F000, v50, v51, "No lastLaunchBootSessionUUID on record", v52, 2u);
      MEMORY[0x25333A4C0](v52, -1, -1);
    }

    uint64_t v53 = (void *)swift_task_alloc();
    *(void *)(v0 + 800) = v53;
    *uint64_t v53 = v0;
    uint64_t v54 = sub_24E356B34;
    goto LABEL_44;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 312) + 32))(*(void *)(v0 + 320), *(void *)(v0 + 344), *(void *)(v0 + 304));
  sub_24E35FA58(&qword_26B1B6808, 255, MEMORY[0x263F07508]);
  if ((sub_24E35FDA0() & 1) == 0)
  {
    uint64_t v53 = (void *)swift_task_alloc();
    *(void *)(v0 + 784) = v53;
    *uint64_t v53 = v0;
    uint64_t v54 = sub_24E3568CC;
LABEL_44:
    v53[1] = v54;
    uint64_t v29 = *(void *)(v0 + 296);
    v53[7] = *(void *)(v0 + 328);
    v53[8] = v29;
    uint64_t v30 = sub_24E35E960;
    goto LABEL_45;
  }
  uint64_t v55 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 312) + 8);
  v55(*(void *)(v0 + 328), *(void *)(v0 + 304));
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v56 = sub_24E35FD10();
  __swift_project_value_buffer(v56, (uint64_t)qword_26B1B6420);
  uint64_t v57 = sub_24E35FCF0();
  os_log_type_t v58 = sub_24E360030();
  if (os_log_type_enabled(v57, v58))
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v59 = 0;
    _os_log_impl(&dword_24E31F000, v57, v58, "This is *NOT* the first run since reboot", v59, 2u);
    MEMORY[0x25333A4C0](v59, -1, -1);
  }

  uint64_t v60 = *(void *)(v0 + 352);
  uint64_t v61 = *(void *)(v0 + 336);
  uint64_t v62 = *(void *)(v0 + 304);
  v55(*(void *)(v0 + 320), v62);
  v55(v61, v62);
  sub_24E32D33C(v60, &qword_26B1B63B0);
LABEL_39:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v63 = *(uint64_t (**)(void))(v0 + 8);
  return v63();
}

uint64_t sub_24E3558C4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 296);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E3559D4, v1, 0);
}

uint64_t sub_24E3559D4()
{
  if (*(unsigned char *)(v0 + 826) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = SystemVersionNumber.description.getter();
    uint64_t v3 = v2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B1B6458 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 360), (uint64_t)qword_26B1B6438);
    *(void *)(v0 + 248) = v1;
    *(void *)(v0 + 256) = v3;
    swift_beginAccess();
    sub_24E35FB50();
    swift_endAccess();
  }
  sub_24E35FAC0();
  if (qword_26B1B6480 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v6 = *(void *)(v0 + 360);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_26B1B6460);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  sub_24E35FB40();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (*(void *)(v0 + 272))
  {
    sub_24E35FCB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 312) + 56))(*(void *)(v0 + 352), 1, 1, *(void *)(v0 + 304));
  }
  uint64_t v8 = *(void *)(v0 + 344);
  uint64_t v9 = *(void *)(v0 + 352);
  uint64_t v10 = *(void *)(v0 + 304);
  uint64_t v11 = *(void *)(v0 + 312);
  (*(void (**)(void, void, uint64_t))(v11 + 16))(*(void *)(v0 + 328), *(void *)(v0 + 336), v10);
  sub_24E32DA28(v9, v8, &qword_26B1B63B0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_24E32D33C(*(void *)(v0 + 344), &qword_26B1B63B0);
    if (qword_26B1B5C80 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_24E35FD10();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B1B6420);
    uint64_t v13 = sub_24E35FCF0();
    os_log_type_t v14 = sub_24E360030();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_24E31F000, v13, v14, "No lastLaunchBootSessionUUID on record", v15, 2u);
      MEMORY[0x25333A4C0](v15, -1, -1);
    }

    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 800) = v16;
    *uint64_t v16 = v0;
    Swift::Int v17 = sub_24E356B34;
    goto LABEL_26;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 312) + 32))(*(void *)(v0 + 320), *(void *)(v0 + 344), *(void *)(v0 + 304));
  sub_24E35FA58(&qword_26B1B6808, 255, MEMORY[0x263F07508]);
  if ((sub_24E35FDA0() & 1) == 0)
  {
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 784) = v16;
    *uint64_t v16 = v0;
    Swift::Int v17 = sub_24E3568CC;
LABEL_26:
    v16[1] = v17;
    uint64_t v28 = *(void *)(v0 + 296);
    v16[7] = *(void *)(v0 + 328);
    v16[8] = v28;
    return MEMORY[0x270FA2498](sub_24E35E960, v28, 0);
  }
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 312) + 8);
  v18(*(void *)(v0 + 328), *(void *)(v0 + 304));
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_24E35FD10();
  __swift_project_value_buffer(v19, (uint64_t)qword_26B1B6420);
  Swift::Int v20 = sub_24E35FCF0();
  os_log_type_t v21 = sub_24E360030();
  if (os_log_type_enabled(v20, v21))
  {
    char v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v22 = 0;
    _os_log_impl(&dword_24E31F000, v20, v21, "This is *NOT* the first run since reboot", v22, 2u);
    MEMORY[0x25333A4C0](v22, -1, -1);
  }

  uint64_t v23 = *(void *)(v0 + 352);
  uint64_t v24 = *(void *)(v0 + 336);
  uint64_t v25 = *(void *)(v0 + 304);
  v18(*(void *)(v0 + 320), v25);
  v18(v24, v25);
  sub_24E32D33C(v23, &qword_26B1B63B0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_24E35600C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 552);
  uint64_t v2 = *(void *)(*(void *)v0 + 544);
  uint64_t v3 = *(void *)(*(void *)v0 + 296);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24E35F1D8(v2, v1);
  return MEMORY[0x270FA2498](sub_24E356294, v3, 0);
}

uint64_t sub_24E356294()
{
  if (*(unsigned char *)(v0 + 824) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v1 = SystemVersionNumber.description.getter();
    uint64_t v3 = v2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B1B6458 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(*(void *)(v0 + 360), (uint64_t)qword_26B1B6438);
    *(void *)(v0 + 248) = v1;
    *(void *)(v0 + 256) = v3;
    swift_beginAccess();
    sub_24E35FB50();
    swift_endAccess();
  }
  sub_24E35FAC0();
  if (qword_26B1B6480 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)(v0 + 368);
  uint64_t v4 = *(void *)(v0 + 376);
  uint64_t v6 = *(void *)(v0 + 360);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_26B1B6460);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  sub_24E35FB40();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (*(void *)(v0 + 272))
  {
    sub_24E35FCB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 312) + 56))(*(void *)(v0 + 352), 1, 1, *(void *)(v0 + 304));
  }
  uint64_t v8 = *(void *)(v0 + 344);
  uint64_t v9 = *(void *)(v0 + 352);
  uint64_t v10 = *(void *)(v0 + 304);
  uint64_t v11 = *(void *)(v0 + 312);
  (*(void (**)(void, void, uint64_t))(v11 + 16))(*(void *)(v0 + 328), *(void *)(v0 + 336), v10);
  sub_24E32DA28(v9, v8, &qword_26B1B63B0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_24E32D33C(*(void *)(v0 + 344), &qword_26B1B63B0);
    if (qword_26B1B5C80 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_24E35FD10();
    __swift_project_value_buffer(v12, (uint64_t)qword_26B1B6420);
    uint64_t v13 = sub_24E35FCF0();
    os_log_type_t v14 = sub_24E360030();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_24E31F000, v13, v14, "No lastLaunchBootSessionUUID on record", v15, 2u);
      MEMORY[0x25333A4C0](v15, -1, -1);
    }

    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 800) = v16;
    *uint64_t v16 = v0;
    Swift::Int v17 = sub_24E356B34;
    goto LABEL_26;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 312) + 32))(*(void *)(v0 + 320), *(void *)(v0 + 344), *(void *)(v0 + 304));
  sub_24E35FA58(&qword_26B1B6808, 255, MEMORY[0x263F07508]);
  if ((sub_24E35FDA0() & 1) == 0)
  {
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 784) = v16;
    *uint64_t v16 = v0;
    Swift::Int v17 = sub_24E3568CC;
LABEL_26:
    v16[1] = v17;
    uint64_t v28 = *(void *)(v0 + 296);
    v16[7] = *(void *)(v0 + 328);
    v16[8] = v28;
    return MEMORY[0x270FA2498](sub_24E35E960, v28, 0);
  }
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 312) + 8);
  v18(*(void *)(v0 + 328), *(void *)(v0 + 304));
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_24E35FD10();
  __swift_project_value_buffer(v19, (uint64_t)qword_26B1B6420);
  Swift::Int v20 = sub_24E35FCF0();
  os_log_type_t v21 = sub_24E360030();
  if (os_log_type_enabled(v20, v21))
  {
    char v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v22 = 0;
    _os_log_impl(&dword_24E31F000, v20, v21, "This is *NOT* the first run since reboot", v22, 2u);
    MEMORY[0x25333A4C0](v22, -1, -1);
  }

  uint64_t v23 = *(void *)(v0 + 352);
  uint64_t v24 = *(void *)(v0 + 336);
  uint64_t v25 = *(void *)(v0 + 304);
  v18(*(void *)(v0 + 320), v25);
  v18(v24, v25);
  sub_24E32D33C(v23, &qword_26B1B63B0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_24E3568CC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 328);
  uint64_t v3 = *(void *)(*v0 + 312);
  uint64_t v4 = *(void *)(*v0 + 304);
  uint64_t v5 = *(void *)(*v0 + 296);
  swift_task_dealloc();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v1 + 792) = v6;
  v6(v2, v4);
  return MEMORY[0x270FA2498](sub_24E356A44, v5, 0);
}

uint64_t sub_24E356A44()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[99];
  uint64_t v2 = v0[38];
  uint64_t v3 = v0[44];
  uint64_t v4 = v0[42];
  v1(v0[40], v2);
  v1(v4, v2);
  sub_24E32D33C(v3, &qword_26B1B63B0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24E356B34()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 328);
  uint64_t v3 = *(void *)(*v0 + 312);
  uint64_t v4 = *(void *)(*v0 + 304);
  uint64_t v5 = *(void *)(*v0 + 296);
  swift_task_dealloc();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(void *)(v1 + 808) = v6;
  *(void *)(v1 + 816) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v2, v4);
  return MEMORY[0x270FA2498](sub_24E356CB8, v5, 0);
}

uint64_t sub_24E356CB8()
{
  uint64_t v1 = *(void *)(v0 + 352);
  (*(void (**)(void, void))(v0 + 808))(*(void *)(v0 + 336), *(void *)(v0 + 304));
  sub_24E32D33C(v1, &qword_26B1B63B0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24E356D84()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24E356DA4, v0, 0);
}

uint64_t sub_24E356DA4()
{
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E35FD10();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1B6420);
  uint64_t v2 = sub_24E35FCF0();
  os_log_type_t v3 = sub_24E360030();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24E31F000, v2, v3, "Initial launch processing...", v4, 2u);
    MEMORY[0x25333A4C0](v4, -1, -1);
  }

  sub_24E35FA58((unint64_t *)&qword_26B1B67F0, v5, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v6;
  void *v6 = v0;
  v6[1] = sub_24E356F68;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_24E356F68()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E35FAAC, v1, 0);
}

uint64_t sub_24E357078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[12] = a2;
  v3[13] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E357120, a3, 0);
}

uint64_t sub_24E357120()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v24 = *(void *)(v2 + 16);
  if (v24)
  {
    uint64_t v3 = sub_24E35FF00();
    uint64_t v4 = *(void *)(v3 - 8);
    char v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    os_log_type_t v21 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
    Swift::Int v20 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v23 = v2;
    while (1)
    {
      uint64_t v8 = *(void *)(v0 + 112);
      uint64_t v7 = *(void *)(v0 + 120);
      long long v25 = *(_OWORD *)(v2 + 16 * v5 + 32);
      v22(v7, 1, 1, v3);
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = 0;
      uint64_t v10 = (void *)(v9 + 16);
      *(void *)(v9 + 24) = 0;
      *(_OWORD *)(v9 + 32) = v25;
      sub_24E32DA28(v7, v8, &qword_26B1B6810);
      LODWORD(v8) = (*v21)(v8, 1, v3);
      swift_unknownObjectRetain_n();
      uint64_t v11 = *(void *)(v0 + 112);
      if (v8 == 1)
      {
        sub_24E32D33C(*(void *)(v0 + 112), &qword_26B1B6810);
        if (!*v10) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_24E35FEF0();
        (*v20)(v11, v3);
        if (!*v10)
        {
LABEL_8:
          uint64_t v12 = 0;
          uint64_t v14 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_24E35FEC0();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v15 = **(void **)(v0 + 96);
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = &unk_2698D92C8;
      *(void *)(v16 + 24) = v9;
      uint64_t v17 = v14 | v12;
      if (v14 | v12)
      {
        uint64_t v17 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v12;
        *(void *)(v0 + 40) = v14;
      }
      ++v5;
      uint64_t v6 = *(void *)(v0 + 120);
      *(void *)(v0 + 72) = 1;
      *(void *)(v0 + 80) = v17;
      *(void *)(v0 + 88) = v15;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_24E32D33C(v6, &qword_26B1B6810);
      uint64_t v2 = v23;
      if (v24 == v5)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_24E357440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a5 + 32) + **(int **)(a5 + 32));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v8;
  *uint64_t v8 = v5;
  v8[1] = sub_24E322CD0;
  return v10(ObjectType, a5);
}

uint64_t sub_24E357540(long long *a1, _OWORD *a2)
{
  *(void *)(v3 + 216) = a2;
  *(void *)(v3 + 224) = v2;
  *(void *)(v3 + 208) = a1;
  long long v4 = a1[2];
  long long v5 = a1[3];
  long long v6 = *a1;
  *(_OWORD *)(v3 + 112) = a1[1];
  *(_OWORD *)(v3 + 128) = v4;
  long long v7 = a1[4];
  *(_OWORD *)(v3 + 144) = v5;
  *(_OWORD *)(v3 + 160) = v7;
  *(_OWORD *)(v3 + 80) = a2[4];
  *(_OWORD *)(v3 + 96) = v6;
  long long v8 = a2[3];
  *(_OWORD *)(v3 + 48) = a2[2];
  *(_OWORD *)(v3 + 64) = v8;
  long long v9 = a2[1];
  *(_OWORD *)(v3 + 16) = *a2;
  *(_OWORD *)(v3 + 32) = v9;
  return MEMORY[0x270FA2498](sub_24E357590, v2, 0);
}

uint64_t sub_24E357590()
{
  uint64_t v35 = v0;
  uint64_t v1 = (_OWORD *)v0[26];
  uint64_t v2 = (long long *)v0[27];
  uint64_t v3 = (uint64_t)(v0 + 2);
  long long v4 = v0 + 12;
  long long v5 = v1[3];
  _OWORD v33[2] = v1[2];
  v33[3] = v5;
  long long v6 = v1[4];
  long long v7 = v1[1];
  v33[0] = *v1;
  v33[1] = v7;
  long long v8 = v2[3];
  _OWORD v34[2] = v2[2];
  v34[3] = v8;
  v34[4] = v2[4];
  long long v9 = *v2;
  v34[1] = v2[1];
  v33[4] = v6;
  v34[0] = v9;
  if (_s19FindMyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0(v33, v34))
  {
    if (qword_26B1B5C80 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_24E35FD10();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B1B6420);
    sub_24E35F5F4((uint64_t)(v0 + 12));
    sub_24E35F5F4((uint64_t)(v0 + 2));
    uint64_t v11 = sub_24E35FCF0();
    os_log_type_t v12 = sub_24E360030();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(void *)&v34[0] = v14;
      *(_DWORD *)uint64_t v13 = 136315394;
      Swift::String v38 = v0 + 2;
      uint64_t v16 = v0[12];
      unint64_t v15 = v0[13];
      swift_bridgeObjectRetain();
      v0[24] = sub_24E32C6BC(v16, v15, (uint64_t *)v34);
      sub_24E3600B0();
      swift_bridgeObjectRelease();
      sub_24E35F640((uint64_t)(v0 + 12));
      *(_WORD *)(v13 + 12) = 2080;
      uint64_t v17 = v0[2];
      unint64_t v18 = v0[3];
      swift_bridgeObjectRetain();
      v0[25] = sub_24E32C6BC(v17, v18, (uint64_t *)v34);
      sub_24E3600B0();
      uint64_t v3 = (uint64_t)v38;
      swift_bridgeObjectRelease();
      sub_24E35F640(v3);
      _os_log_impl(&dword_24E31F000, v11, v12, "Migrating from %s to %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      long long v4 = v0 + 12;
      MEMORY[0x25333A4C0](v14, -1, -1);
      uint64_t v19 = v13;
LABEL_10:
      MEMORY[0x25333A4C0](v19, -1, -1);
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_26B1B5C80 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_24E35FD10();
    __swift_project_value_buffer(v20, (uint64_t)qword_26B1B6420);
    sub_24E35F5F4((uint64_t)(v0 + 12));
    sub_24E35F5F4((uint64_t)(v0 + 2));
    uint64_t v11 = sub_24E35FCF0();
    os_log_type_t v21 = sub_24E360030();
    if (os_log_type_enabled(v11, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(void *)&v34[0] = v23;
      *(_DWORD *)uint64_t v22 = 136315394;
      Swift::String v38 = v0 + 2;
      uint64_t v25 = v0[12];
      unint64_t v24 = v0[13];
      swift_bridgeObjectRetain();
      v0[22] = sub_24E32C6BC(v25, v24, (uint64_t *)v34);
      sub_24E3600B0();
      swift_bridgeObjectRelease();
      sub_24E35F640((uint64_t)(v0 + 12));
      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v26 = v0[2];
      unint64_t v27 = v0[3];
      swift_bridgeObjectRetain();
      v0[23] = sub_24E32C6BC(v26, v27, (uint64_t *)v34);
      sub_24E3600B0();
      uint64_t v3 = (uint64_t)v38;
      swift_bridgeObjectRelease();
      sub_24E35F640(v3);
      _os_log_impl(&dword_24E31F000, v11, v21, "Back-migration from %s to %s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v23, -1, -1);
      uint64_t v19 = v22;
      goto LABEL_10;
    }
  }
  sub_24E35F640((uint64_t)(v0 + 12));
  sub_24E35F640((uint64_t)(v0 + 2));
LABEL_12:

  uint64_t v28 = v0[28];
  sub_24E35FA58((unint64_t *)&qword_26B1B67F0, v29, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
  uint64_t v30 = (void *)swift_task_alloc();
  v0[29] = v30;
  id v30[2] = v28;
  v30[3] = v4;
  v30[4] = v3;
  uint64_t v31 = (void *)swift_task_alloc();
  v0[30] = v31;
  void *v31 = v0;
  v31[1] = sub_24E357A98;
  uint64_t v37 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_24E357A98()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 224);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24E321AC4, v1, 0);
}

uint64_t sub_24E357BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[14] = a4;
  v5[15] = a5;
  v5[12] = a2;
  v5[13] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E357C70, a3, 0);
}

uint64_t sub_24E357C70()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v32 = *(void *)(v2 + 16);
  if (v32)
  {
    uint64_t v3 = sub_24E35FF00();
    uint64_t v4 = *(void *)(v3 - 8);
    uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    uint64_t v29 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
    uint64_t v28 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v31 = v2;
    while (1)
    {
      uint64_t v8 = *(void *)(v0 + 128);
      uint64_t v7 = *(void *)(v0 + 136);
      uint64_t v10 = *(_OWORD **)(v0 + 112);
      long long v9 = *(_OWORD **)(v0 + 120);
      long long v33 = *(_OWORD *)(v2 + 16 * v5 + 32);
      v30(v7, 1, 1, v3);
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = 0;
      os_log_type_t v12 = (void *)(v11 + 16);
      *(void *)(v11 + 24) = 0;
      *(_OWORD *)(v11 + 32) = v33;
      long long v13 = v10[1];
      long long v14 = v10[2];
      long long v15 = v10[4];
      *(_OWORD *)(v11 + 96) = v10[3];
      *(_OWORD *)(v11 + 112) = v15;
      *(_OWORD *)(v11 + 64) = v13;
      *(_OWORD *)(v11 + 80) = v14;
      *(_OWORD *)(v11 + 48) = *v10;
      long long v17 = v9[1];
      long long v16 = v9[2];
      long long v18 = v9[4];
      *(_OWORD *)(v11 + 176) = v9[3];
      *(_OWORD *)(v11 + 192) = v18;
      *(_OWORD *)(v11 + 144) = v17;
      *(_OWORD *)(v11 + 160) = v16;
      *(_OWORD *)(v11 + 128) = *v9;
      sub_24E32DA28(v7, v8, &qword_26B1B6810);
      LODWORD(v7) = (*v29)(v8, 1, v3);
      swift_unknownObjectRetain_n();
      sub_24E35F5F4((uint64_t)v10);
      sub_24E35F5F4((uint64_t)v9);
      uint64_t v19 = *(void *)(v0 + 128);
      if (v7 == 1)
      {
        sub_24E32D33C(*(void *)(v0 + 128), &qword_26B1B6810);
        if (!*v12) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_24E35FEF0();
        (*v28)(v19, v3);
        if (!*v12)
        {
LABEL_8:
          uint64_t v20 = 0;
          uint64_t v22 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v20 = sub_24E35FEC0();
      uint64_t v22 = v21;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v23 = **(void **)(v0 + 96);
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = &unk_2698D92A0;
      *(void *)(v24 + 24) = v11;
      uint64_t v25 = v22 | v20;
      if (v22 | v20)
      {
        uint64_t v25 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v20;
        *(void *)(v0 + 40) = v22;
      }
      ++v5;
      uint64_t v6 = *(void *)(v0 + 136);
      *(void *)(v0 + 72) = 1;
      *(void *)(v0 + 80) = v25;
      *(void *)(v0 + 88) = v23;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_24E32D33C(v6, &qword_26B1B6810);
      uint64_t v2 = v31;
      if (v32 == v5)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_24E357FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6, long long *a7)
{
  uint64_t ObjectType = swift_getObjectType();
  long long v12 = a6[3];
  *(_OWORD *)(v7 + 48) = a6[2];
  *(_OWORD *)(v7 + 64) = v12;
  long long v13 = a6[1];
  *(_OWORD *)(v7 + 16) = *a6;
  *(_OWORD *)(v7 + 32) = v13;
  long long v14 = a7[4];
  *(_OWORD *)(v7 + 144) = a7[3];
  *(_OWORD *)(v7 + 160) = v14;
  long long v15 = a7[2];
  long long v16 = *a7;
  *(_OWORD *)(v7 + 112) = a7[1];
  *(_OWORD *)(v7 + 128) = v15;
  *(_OWORD *)(v7 + 80) = a6[4];
  *(_OWORD *)(v7 + 96) = v16;
  uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 40) + **(int **)(a5 + 40));
  long long v17 = (void *)swift_task_alloc();
  *(void *)(v7 + 176) = v17;
  *long long v17 = v7;
  v17[1] = sub_24E358128;
  return v19(v7 + 16, v7 + 96, ObjectType, a5);
}

uint64_t sub_24E358128()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E35821C()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24E35823C, v0, 0);
}

uint64_t sub_24E35823C()
{
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E35FD10();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1B6420);
  uint64_t v2 = sub_24E35FCF0();
  os_log_type_t v3 = sub_24E360030();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24E31F000, v2, v3, "First launch since reboot...", v4, 2u);
    MEMORY[0x25333A4C0](v4, -1, -1);
  }

  sub_24E35FA58((unint64_t *)&qword_26B1B67F0, v5, (void (*)(uint64_t))type metadata accessor for ActorServiceCollection);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v6;
  void *v6 = v0;
  v6[1] = sub_24E3219B4;
  return MEMORY[0x270FA2158]();
}

uint64_t sub_24E358400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[12] = a2;
  v3[13] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B6810);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E3584A8, a3, 0);
}

uint64_t sub_24E3584A8()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 112);
  uint64_t v24 = *(void *)(v2 + 16);
  if (v24)
  {
    uint64_t v3 = sub_24E35FF00();
    uint64_t v4 = *(void *)(v3 - 8);
    uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    uint64_t v21 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
    uint64_t v20 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    uint64_t v23 = v2;
    while (1)
    {
      uint64_t v8 = *(void *)(v0 + 112);
      uint64_t v7 = *(void *)(v0 + 120);
      long long v25 = *(_OWORD *)(v2 + 16 * v5 + 32);
      v22(v7, 1, 1, v3);
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = 0;
      uint64_t v10 = (void *)(v9 + 16);
      *(void *)(v9 + 24) = 0;
      *(_OWORD *)(v9 + 32) = v25;
      sub_24E32DA28(v7, v8, &qword_26B1B6810);
      LODWORD(v8) = (*v21)(v8, 1, v3);
      swift_unknownObjectRetain_n();
      uint64_t v11 = *(void *)(v0 + 112);
      if (v8 == 1)
      {
        sub_24E32D33C(*(void *)(v0 + 112), &qword_26B1B6810);
        if (!*v10) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_24E35FEF0();
        (*v20)(v11, v3);
        if (!*v10)
        {
LABEL_8:
          uint64_t v12 = 0;
          uint64_t v14 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_24E35FEC0();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v15 = **(void **)(v0 + 96);
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = &unk_2698D9278;
      *(void *)(v16 + 24) = v9;
      uint64_t v17 = v14 | v12;
      if (v14 | v12)
      {
        uint64_t v17 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v12;
        *(void *)(v0 + 40) = v14;
      }
      ++v5;
      uint64_t v6 = *(void *)(v0 + 120);
      *(void *)(v0 + 72) = 1;
      *(void *)(v0 + 80) = v17;
      *(void *)(v0 + 88) = v15;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_24E32D33C(v6, &qword_26B1B6810);
      uint64_t v2 = v23;
      if (v24 == v5)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  long long v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_24E3587C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a5 + 48) + **(int **)(a5 + 48));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v8;
  *uint64_t v8 = v5;
  v8[1] = sub_24E322CD0;
  return v10(ObjectType, a5);
}

uint64_t ActorServiceCollection.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ActorServiceCollection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();

  return MEMORY[0x270FA2418](v0);
}

uint64_t ActorServiceCollection.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24E358954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  uint64_t v10 = sub_24E3601D0();
  v8[11] = v10;
  v8[12] = *(void *)(v10 - 8);
  v8[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24E358A24, a8, 0);
}

uint64_t sub_24E358A24()
{
  sub_24E3601C0();
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2698D9220 + dword_2698D9220);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[14] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24E358AE4;
  uint64_t v3 = v0[6];
  uint64_t v2 = v0[7];
  return v5(v3, v2, 0, 0, 1);
}

uint64_t sub_24E358AE4()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 104);
  uint64_t v4 = *(void *)(*v1 + 96);
  uint64_t v5 = *(void *)(*v1 + 88);
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 80);
  if (v0) {
    uint64_t v7 = sub_24E358F9C;
  }
  else {
    uint64_t v7 = sub_24E358C6C;
  }
  return MEMORY[0x270FA2498](v7, v6, 0);
}

uint64_t sub_24E358C6C()
{
  uint64_t v29 = v0;
  if ((sub_24E35FF70() & 1) == 0)
  {
    if (qword_26B1B5C80 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_24E35FD10();
    __swift_project_value_buffer(v1, (uint64_t)qword_26B1B6420);
    swift_unknownObjectRetain_n();
    uint64_t v2 = sub_24E35FCF0();
    os_log_type_t v3 = sub_24E360020();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = v0[9];
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = swift_slowAlloc();
      uint64_t v28 = v6;
      *(_DWORD *)uint64_t v5 = 136446210;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24))(ObjectType, v4);
      v0[5] = sub_24E32C6BC(v8, v9, &v28);
      sub_24E3600B0();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      _os_log_impl(&dword_24E31F000, v2, v3, "*** DEADLOCK *** in startup() for service: %{public}s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25333A4C0](v6, -1, -1);
      MEMORY[0x25333A4C0](v5, -1, -1);
    }
    else
    {
      swift_unknownObjectRelease_n();
    }

    uint64_t v10 = v0[9];
    uint64_t v11 = v0[8];
    uint64_t v12 = v0[10] + 112;
    swift_beginAccess();
    swift_unknownObjectRetain();
    uint64_t v13 = sub_24E35EC58(v12, v11, v10);
    uint64_t result = swift_unknownObjectRelease();
    int64_t v15 = *(void *)(*(void *)v12 + 16);
    if (v15 < v13)
    {
      __break(1u);
      return result;
    }
    uint64_t v16 = v0[9];
    sub_24E35EFC0(v13, v15);
    swift_endAccess();
    uint64_t v17 = swift_getObjectType();
    long long v18 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 24);
    uint64_t v19 = v18(v17, v16);
    uint64_t v21 = v20;
    uint64_t v22 = v18(v17, v16);
    uint64_t v24 = v23;
    sub_24E35F134();
    long long v25 = (void *)swift_allocError();
    *(void *)uint64_t v26 = v22;
    *(void *)(v26 + 8) = v24;
    *(unsigned char *)(v26 + 16) = 1;
    sub_24E359000(v19, v21, v25);

    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  unint64_t v27 = (uint64_t (*)(void))v0[1];
  return v27();
}

uint64_t sub_24E358F9C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E359000(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B64D8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = v3 + 128;
  uint64_t result = swift_beginAccess();
  uint64_t v13 = *(void *)(v3 + 128);
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_24E32CD14(a1, a2);
    if (v15)
    {
      uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v17 = *(void *)(v16 + 16);
      if (v17)
      {
        v25[1] = v11;
        uint64_t v26 = a1;
        uint64_t v27 = a2;
        uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
        uint64_t v19 = v8 + 16;
        long long v18 = v20;
        unint64_t v21 = (*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64);
        v25[0] = v16;
        uint64_t v22 = v16 + v21;
        uint64_t v23 = *(void *)(v19 + 56);
        do
        {
          v18(v10, v22, v7);
          uint64_t v28 = a3;
          id v24 = a3;
          sub_24E35FED0();
          (*(void (**)(char *, uint64_t))(v19 - 8))(v10, v7);
          v22 += v23;
          --v17;
        }
        while (v17);
        swift_bridgeObjectRelease();
        a1 = v26;
        a2 = v27;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24E35A4E8(a1, a2);
      swift_endAccess();
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24E35921C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a3 + 56) + **(int **)(a3 + 56));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_24E322A50;
  return v8(ObjectType, a3);
}

uint64_t sub_24E35931C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B64D8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v2 + 128;
  uint64_t result = swift_beginAccess();
  uint64_t v11 = *(void *)(v2 + 128);
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_24E32CD14(a1, a2);
    if (v13)
    {
      uint64_t v14 = *(void *)(*(void *)(v11 + 56) + 8 * v12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v15 = *(void *)(v14 + 16);
      if (v15)
      {
        v22[2] = v9;
        uint64_t v23 = a1;
        long long v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
        uint64_t v17 = v6 + 16;
        uint64_t v16 = v18;
        unint64_t v19 = (*(unsigned __int8 *)(v17 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 64);
        v22[1] = v14;
        uint64_t v20 = v14 + v19;
        uint64_t v21 = *(void *)(v17 + 56);
        do
        {
          v16(v8, v20, v5);
          sub_24E35FEE0();
          (*(void (**)(char *, uint64_t))(v17 - 8))(v8, v5);
          v20 += v21;
          --v15;
        }
        while (v15);
        swift_bridgeObjectRelease();
        a1 = v23;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24E35A4E8(a1, a2);
      swift_endAccess();
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24E35951C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B64D8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_24E34FDF8();
  char v13 = sub_24E33AADC(v20, a3, a4);
  if (*v12)
  {
    uint64_t v14 = v12;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
    unint64_t v15 = *v14;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v14 = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v15 = sub_24E33A354(0, *(void *)(v15 + 16) + 1, 1, v15);
      *uint64_t v14 = v15;
    }
    unint64_t v18 = *(void *)(v15 + 16);
    unint64_t v17 = *(void *)(v15 + 24);
    if (v18 >= v17 >> 1)
    {
      unint64_t v15 = sub_24E33A354(v17 > 1, v18 + 1, 1, v15);
      *uint64_t v14 = v15;
    }
    *(void *)(v15 + 16) = v18 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v18, v10, v7);
    ((void (*)(void *, void))v13)(v20, 0);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(unsigned char *, void))v11)(v21, 0);
  }
  else
  {
    ((void (*)(void *, void))v13)(v20, 0);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(unsigned char *, void))v11)(v21, 0);
  }
}

uint64_t sub_24E359758()
{
  uint64_t v0 = sub_24E35FB80();
  __swift_allocate_value_buffer(v0, qword_26B1B6488);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B6488);
  if (qword_26B1B6418 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_26B1B63F8);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

uint64_t sub_24E359820(uint64_t a1)
{
  return sub_24E359868(a1, qword_26B1B6460);
}

uint64_t sub_24E359844(uint64_t a1)
{
  return sub_24E359868(a1, qword_26B1B6438);
}

uint64_t sub_24E359868(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_24E35FB80();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63A8);
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (qword_26B1B64A8 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_26B1B6488);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  return sub_24E35FB60();
}

uint64_t sub_24E3599CC()
{
  return sub_24E3603E0();
}

uint64_t sub_24E359A54()
{
  swift_bridgeObjectRetain();
  sub_24E35FDF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E35FDF0();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24E359AD8()
{
  return sub_24E3603E0();
}

uint64_t sub_24E359B5C(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a2[2];
  uint64_t v5 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (char v7 = sub_24E360320(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      return sub_24E360320();
    }
  }
  return result;
}

uint64_t sub_24E359C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_24E3601B0();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_24E359D04, 0, 0);
}

uint64_t sub_24E359D04()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_24E3601D0();
  uint64_t v5 = sub_24E35FA58(&qword_26B1B6500, 255, MEMORY[0x263F8F710]);
  sub_24E360360();
  sub_24E35FA58(&qword_26B1B64F8, 255, MEMORY[0x263F8F6D8]);
  sub_24E3601E0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  char v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  void *v7 = v0;
  v7[1] = sub_24E359EAC;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_24E359EAC()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24E35A068, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_24E35A068()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24E35A0D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24E35A0FC(a1, a2, &qword_26B1B64F0, &qword_26B1B5BB8, a3);
}

uint64_t sub_24E35A0E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24E35A0FC(a1, a2, (uint64_t *)&unk_26B1B5B70, (uint64_t *)&unk_26B1B5BA8, a3);
}

uint64_t sub_24E35A0FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8 = v5;
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_24E32CD14(a1, a2);
  LOBYTE(a2) = v13;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v8;
    uint64_t v25 = *v8;
    *uint64_t v8 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24E35CA38(a3, a4);
      uint64_t v15 = v25;
    }
    swift_bridgeObjectRelease();
    uint64_t v16 = *(void *)(v15 + 56);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v24 = *(void *)(v17 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v24 + 32))(a5, v16 + *(void *)(v24 + 72) * v12, v17);
    sub_24E35BAFC(v12, v15, a3);
    *uint64_t v8 = v15;
    swift_bridgeObjectRelease();
    unint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56);
    uint64_t v19 = a5;
    uint64_t v20 = 0;
    uint64_t v21 = v17;
  }
  else
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(a3);
    unint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56);
    uint64_t v21 = v22;
    uint64_t v19 = a5;
    uint64_t v20 = 1;
  }

  return v18(v19, v20, 1, v21);
}

uint64_t sub_24E35A2C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24E35A0FC(a1, a2, (uint64_t *)&unk_26B1B6370, &qword_26B1B59E0, a3);
}

uint64_t sub_24E35A2D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24E35A0FC(a1, a2, (uint64_t *)&unk_26B1B5970, &qword_26B1B59D0, a3);
}

uint64_t sub_24E35A2E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24E32CF5C(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24E35C018();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_24E35FCE0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, v12 + *(void *)(v20 + 72) * v6, v13);
    sub_24E35B5D4(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_24E35A4C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24E35A0FC(a1, a2, &qword_26B1B59B0, &qword_26B1B59E8, a3);
}

uint64_t sub_24E35A4D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24E35A0FC(a1, a2, &qword_26B1B5990, &qword_26B1B59D8, a3);
}

uint64_t sub_24E35A4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_24E32CD14(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24E35C418(&qword_26B1B6508);
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_24E35B924(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24E35A5C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24E35A0FC(a1, a2, (uint64_t *)&unk_26B1B6340, (uint64_t *)&unk_26B1B6390, a3);
}

uint64_t sub_24E35A5D4(uint64_t a1, int a2)
{
  return sub_24E35AEBC(a1, a2, &qword_26B1B64F0, &qword_26B1B5BB8);
}

uint64_t sub_24E35A5E8(uint64_t a1, int a2)
{
  return sub_24E35AEBC(a1, a2, (uint64_t *)&unk_26B1B5B70, (uint64_t *)&unk_26B1B5BA8);
}

uint64_t sub_24E35A5FC(uint64_t a1, char a2)
{
  return sub_24E35AB94(a1, a2, (uint64_t *)&unk_26B1B5B98);
}

uint64_t sub_24E35A608(uint64_t a1, int a2)
{
  return sub_24E35AEBC(a1, a2, (uint64_t *)&unk_26B1B6370, &qword_26B1B59E0);
}

uint64_t sub_24E35A61C(uint64_t a1, int a2)
{
  return sub_24E35AEBC(a1, a2, (uint64_t *)&unk_26B1B5970, &qword_26B1B59D0);
}

uint64_t sub_24E35A630(uint64_t a1, char a2)
{
  return sub_24E35AB94(a1, a2, &qword_26B1B59C0);
}

uint64_t sub_24E35A63C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  uint64_t v5 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v52 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24E35FCE0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5DE8);
  int v50 = a2;
  uint64_t v12 = sub_24E360230();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = *(void *)(v11 + 64);
  uint64_t v44 = (void *)(v11 + 64);
  if (v14 < 64) {
    uint64_t v16 = ~(-1 << v14);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v15;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v45 = v5 + 16;
  uint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v48 = v5;
  uint64_t v49 = v8;
  uint64_t v18 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  os_log_type_t v51 = (uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32);
  uint64_t v19 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v21 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v17)
    {
      unint64_t v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v43) {
      break;
    }
    uint64_t v26 = v44;
    unint64_t v27 = v44[v25];
    ++v21;
    if (!v27)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v27 = v44[v21];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v44[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v21 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v21 >= v43) {
              goto LABEL_34;
            }
            unint64_t v27 = v44[v21];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v21 = v28;
      }
    }
LABEL_21:
    unint64_t v17 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v49 + 72);
    unint64_t v30 = *(void *)(v11 + 48) + v29 * v24;
    if (v50)
    {
      (*v18)(v10, v30, v7);
      uint64_t v31 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 32))(v52, v31 + v32 * v24, v53);
    }
    else
    {
      (*v46)(v10, v30, v7);
      uint64_t v33 = *(void *)(v11 + 56);
      uint64_t v32 = *(void *)(v48 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v48 + 16))(v52, v33 + v32 * v24, v53);
    }
    sub_24E35FA58((unint64_t *)&unk_26B1B6780, 255, MEMORY[0x263F07508]);
    uint64_t result = sub_24E35FD80();
    uint64_t v34 = -1 << *(unsigned char *)(v13 + 32);
    unint64_t v35 = result & ~v34;
    unint64_t v36 = v35 >> 6;
    if (((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v35) & ~*(void *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v39 = v36 == v38;
        if (v36 == v38) {
          unint64_t v36 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      unint64_t v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(void *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*v18)((char *)(*(void *)(v13 + 48) + v29 * v22), (unint64_t)v10, v7);
    uint64_t result = (*v51)(*(void *)(v13 + 56) + v32 * v22, v52, v53);
    ++*(void *)(v13 + 16);
  }
  swift_release();
  uint64_t v3 = v42;
  uint64_t v26 = v44;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v41 = 1 << *(unsigned char *)(v11 + 32);
  if (v41 >= 64) {
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v26 = -1 << v41;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_24E35AB40(uint64_t a1, int a2)
{
  return sub_24E35AEBC(a1, a2, &qword_26B1B59B0, &qword_26B1B59E8);
}

uint64_t sub_24E35AB54(uint64_t a1, int a2)
{
  return sub_24E35AEBC(a1, a2, &qword_26B1B5990, &qword_26B1B59D8);
}

uint64_t sub_24E35AB68(uint64_t a1, char a2)
{
  return sub_24E35AB94(a1, a2, &qword_26B1B59C8);
}

uint64_t sub_24E35AB74(uint64_t a1, int a2)
{
  return sub_24E35AEBC(a1, a2, (uint64_t *)&unk_26B1B6380, &qword_26B1B63A0);
}

uint64_t sub_24E35AB88(uint64_t a1, char a2)
{
  return sub_24E35AB94(a1, a2, &qword_26B1B6508);
}

uint64_t sub_24E35AB94(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v37 = a2;
  uint64_t v7 = sub_24E360230();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    unint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24E3603C0();
    sub_24E35FDF0();
    uint64_t result = sub_24E3603E0();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  unint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v4 = v8;
  return result;
}

uint64_t sub_24E35AEA8(uint64_t a1, int a2)
{
  return sub_24E35AEBC(a1, a2, (uint64_t *)&unk_26B1B6340, (uint64_t *)&unk_26B1B6390);
}

uint64_t sub_24E35AEBC(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v6 = v4;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v8 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388]();
  os_log_type_t v51 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  int v50 = a2;
  uint64_t v11 = sub_24E360230();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v14 = *(void *)(v10 + 64);
  uint64_t v47 = (void *)(v10 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v45 = v4;
  int64_t v46 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v48 = (void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v49 = v8;
  unint64_t v17 = (void (**)(char *, uint64_t, uint64_t))(v8 + 32);
  uint64_t v18 = v11 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  while (1)
  {
    if (v16)
    {
      unint64_t v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v46) {
      break;
    }
    char v26 = v47;
    unint64_t v27 = v47[v25];
    ++v20;
    if (!v27)
    {
      int64_t v20 = v25 + 1;
      if (v25 + 1 >= v46) {
        goto LABEL_34;
      }
      unint64_t v27 = v47[v20];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v46)
        {
LABEL_34:
          swift_release();
          uint64_t v6 = v45;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v47[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v20 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v46) {
              goto LABEL_34;
            }
            unint64_t v27 = v47[v20];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v28;
      }
    }
LABEL_21:
    unint64_t v16 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v10 + 56);
    uint64_t v30 = v10;
    uint64_t v31 = (uint64_t *)(*(void *)(v10 + 48) + 16 * v24);
    uint64_t v32 = *v31;
    uint64_t v33 = v31[1];
    uint64_t v34 = *(void *)(v49 + 72);
    uint64_t v35 = v29 + v34 * v24;
    if (v50)
    {
      (*v17)(v51, v35, v52);
    }
    else
    {
      (*v48)(v51, v35, v52);
      swift_bridgeObjectRetain();
    }
    sub_24E3603C0();
    sub_24E35FDF0();
    uint64_t result = sub_24E3603E0();
    uint64_t v36 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v37 = result & ~v36;
    unint64_t v38 = v37 >> 6;
    if (((-1 << v37) & ~*(void *)(v18 + 8 * (v37 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v37) & ~*(void *)(v18 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v39 = 0;
      unint64_t v40 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v41 = v38 == v40;
        if (v38 == v40) {
          unint64_t v38 = 0;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v18 + 8 * v38);
      }
      while (v42 == -1);
      unint64_t v21 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    int64_t v22 = (void *)(*(void *)(v12 + 48) + 16 * v21);
    *int64_t v22 = v32;
    v22[1] = v33;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 56) + v34 * v21, v51, v52);
    ++*(void *)(v12 + 16);
    uint64_t v10 = v30;
  }
  swift_release();
  uint64_t v6 = v45;
  char v26 = v47;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v43 = 1 << *(unsigned char *)(v10 + 32);
  if (v43 >= 64) {
    bzero(v26, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v26 = -1 << v43;
  }
  *(void *)(v10 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v6 = v12;
  return result;
}

uint64_t sub_24E35B2A8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B55E8);
  char v42 = a2;
  uint64_t v6 = sub_24E360230();
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
    unint64_t v24 = (void *)(v5 + 64);
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
    uint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24E3603C0();
    sub_24E35FDF0();
    uint64_t result = sub_24E3603E0();
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
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    int64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *int64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  unint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_24E35B5D4(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24E35FCE0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_24E3600D0();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v39 = (result + 1) & v12;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v40 = v13;
      uint64_t v37 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v38 = v14;
      uint64_t v36 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v15;
        int64_t v18 = v15 * v11;
        v38(v8, *(void *)(a2 + 48) + v15 * v11, v4);
        sub_24E35FA58((unint64_t *)&unk_26B1B6780, 255, MEMORY[0x263F07508]);
        uint64_t v19 = sub_24E35FD80();
        unint64_t result = (*v37)(v8, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v39)
        {
          if (v20 >= v39 && a1 >= (uint64_t)v20)
          {
LABEL_16:
            if (v17 * a1 < v18
              || *(void *)(a2 + 48) + v17 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v18 + v17))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v17 * a1 != v18)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v23 = *(void *)(a2 + 56);
            uint64_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0) - 8)
                            + 72);
            int64_t v25 = v24 * a1;
            unint64_t result = v23 + v24 * a1;
            int64_t v26 = v24 * v11;
            unint64_t v27 = v23 + v24 * v11 + v24;
            BOOL v28 = v25 < v26 || result >= v27;
            uint64_t v9 = v16;
            if (v28)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
              a1 = v11;
              uint64_t v12 = v36;
            }
            else
            {
              a1 = v11;
              uint64_t v12 = v36;
              if (v25 != v26)
              {
                unint64_t result = swift_arrayInitWithTakeBackToFront();
                a1 = v11;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v39 || a1 >= (uint64_t)v20)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
        uint64_t v15 = v17;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    BOOL v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v30 = *v29;
    uint64_t v31 = (-1 << a1) - 1;
  }
  else
  {
    BOOL v29 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v29;
    uint64_t v30 = (-1 << a1) - 1;
  }
  *BOOL v29 = v31 & v30;
  uint64_t v32 = *(void *)(a2 + 16);
  BOOL v33 = __OFSUB__(v32, 1);
  uint64_t v34 = v32 - 1;
  if (v33)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v34;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_24E35B924(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_24E3600D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_24E3603C0();
        swift_bridgeObjectRetain();
        sub_24E35FDF0();
        uint64_t v9 = sub_24E3603E0();
        unint64_t result = swift_bridgeObjectRelease();
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
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
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

unint64_t sub_24E35BAFC(unint64_t result, uint64_t a2, uint64_t *a3)
{
  int64_t v4 = result;
  uint64_t v5 = a2 + 64;
  uint64_t v6 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(void *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    uint64_t v9 = ~v6;
    unint64_t result = sub_24E3600D0();
    if ((*(void *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      unint64_t v10 = (result + 1) & v9;
      while (1)
      {
        sub_24E3603C0();
        swift_bridgeObjectRetain();
        sub_24E35FDF0();
        uint64_t v11 = sub_24E3603E0();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v9;
        if (v4 >= (uint64_t)v10) {
          break;
        }
        if (v12 < v10) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v13 = *(void *)(a2 + 48);
        uint64_t v14 = (_OWORD *)(v13 + 16 * v4);
        uint64_t v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1) {
          *uint64_t v14 = *v15;
        }
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8) + 72);
        int64_t v18 = v17 * v4;
        unint64_t result = v16 + v17 * v4;
        int64_t v19 = v17 * v7;
        unint64_t v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v4 = v7;
          if (v18 == v19) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v4 = v7;
LABEL_6:
        unint64_t v7 = (v7 + 1) & v9;
        if (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v12 < v10) {
        goto LABEL_6;
      }
LABEL_11:
      if (v4 < (uint64_t)v12) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    uint64_t v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v4) - 1;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *uint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24E35BD18(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_24E35BEB0(a1, a2, a3, a4, a5, &qword_26B1B64F0);
}

uint64_t sub_24E35BD24(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_24E35BEB0(a1, a2, a3, a4, a5, (uint64_t *)&unk_26B1B5B70);
}

uint64_t sub_24E35BD34(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_24E35BEB0(a1, a2, a3, a4, a5, (uint64_t *)&unk_26B1B6370);
}

uint64_t sub_24E35BD40(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_24E35BEB0(a1, a2, a3, a4, a5, (uint64_t *)&unk_26B1B5970);
}

uint64_t sub_24E35BD4C(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_24E35FCE0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a3, v11);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_24E35BE44(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_24E35BEB0(a1, a2, a3, a4, a5, &qword_26B1B59B0);
}

uint64_t sub_24E35BE50(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_24E35BEB0(a1, a2, a3, a4, a5, &qword_26B1B5990);
}

unint64_t sub_24E35BE5C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_24E35BEA4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return sub_24E35BEB0(a1, a2, a3, a4, a5, (uint64_t *)&unk_26B1B6340);
}

uint64_t sub_24E35BEB0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t *a6)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v9 = (void *)(a5[6] + 16 * a1);
  *uint64_t v9 = a2;
  v9[1] = a3;
  uint64_t v10 = a5[7];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1, a4, v11);
  uint64_t v13 = a5[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a5[2] = v15;
  }
  return result;
}

unint64_t sub_24E35BF60(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  void *v6 = a2;
  v6[1] = a3;
  BOOL v7 = (void *)(a6[7] + 16 * result);
  void *v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

void *sub_24E35BFB0()
{
  return sub_24E35CA38(&qword_26B1B64F0, &qword_26B1B5BB8);
}

void *sub_24E35BFC4()
{
  return sub_24E35CA38((uint64_t *)&unk_26B1B5B70, (uint64_t *)&unk_26B1B5BA8);
}

void *sub_24E35BFD8()
{
  return sub_24E35C418((uint64_t *)&unk_26B1B5B98);
}

void *sub_24E35BFE4()
{
  return sub_24E35CA38((uint64_t *)&unk_26B1B6370, &qword_26B1B59E0);
}

void *sub_24E35BFF8()
{
  return sub_24E35CA38((uint64_t *)&unk_26B1B5970, &qword_26B1B59D0);
}

void *sub_24E35C00C()
{
  return sub_24E35C418(&qword_26B1B59C0);
}

void *sub_24E35C018()
{
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1B67A0);
  uint64_t v45 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_24E35FCE0();
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  unint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B5DE8);
  uint64_t v32 = v0;
  uint64_t v3 = *v0;
  uint64_t v4 = sub_24E360220();
  uint64_t v5 = *(void *)(v3 + 16);
  uint64_t v46 = v4;
  if (!v5)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v31 = v46;
    uint64_t v30 = v32;
LABEL_25:
    *uint64_t v30 = v31;
    return result;
  }
  uint64_t v6 = v4;
  uint64_t result = (void *)(v4 + 64);
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    uint64_t v6 = v46;
  }
  int64_t v9 = 0;
  *(void *)(v6 + 16) = *(void *)(v3 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v11 = -1;
  uint64_t v43 = v3;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v3 + 64);
  uint64_t v33 = v3 + 64;
  int64_t v34 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v45;
  uint64_t v14 = v44;
  uint64_t v37 = v45 + 16;
  uint64_t v38 = v44 + 16;
  uint64_t v35 = v45 + 32;
  uint64_t v36 = v44 + 32;
  uint64_t v15 = v39;
  uint64_t v16 = v40;
  uint64_t v17 = v42;
  uint64_t v18 = v46;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      int64_t v47 = v9;
      unint64_t v20 = v19 | (v9 << 6);
      uint64_t v21 = v43;
      goto LABEL_9;
    }
    int64_t v26 = v9 + 1;
    uint64_t v21 = v43;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v26 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v26);
    int64_t v28 = v9 + 1;
    if (!v27)
    {
      int64_t v28 = v26 + 1;
      if (v26 + 1 >= v34) {
        goto LABEL_23;
      }
      unint64_t v27 = *(void *)(v33 + 8 * v28);
      if (!v27) {
        break;
      }
    }
LABEL_22:
    unint64_t v12 = (v27 - 1) & v27;
    int64_t v47 = v28;
    unint64_t v20 = __clz(__rbit64(v27)) + (v28 << 6);
LABEL_9:
    unint64_t v22 = *(void *)(v14 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v15, *(void *)(v21 + 48) + v22, v16);
    unint64_t v23 = *(void *)(v13 + 72) * v20;
    unint64_t v24 = *(void *)(v21 + 56) + v23;
    uint64_t v25 = v41;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v41, v24, v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(void *)(v18 + 48) + v22, v15, v16);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v13 + 32))(*(void *)(v18 + 56) + v23, v25, v17);
    int64_t v9 = v47;
  }
  int64_t v29 = v26 + 2;
  if (v29 >= v34)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v30 = v32;
    uint64_t v31 = v46;
    goto LABEL_25;
  }
  unint64_t v27 = *(void *)(v33 + 8 * v29);
  if (v27)
  {
    int64_t v28 = v29;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v28 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v28 >= v34) {
      goto LABEL_23;
    }
    unint64_t v27 = *(void *)(v33 + 8 * v28);
    ++v29;
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_24E35C3C4()
{
  return sub_24E35CA38(&qword_26B1B59B0, &qword_26B1B59E8);
}

void *sub_24E35C3D8()
{
  return sub_24E35CA38(&qword_26B1B5990, &qword_26B1B59D8);
}

void *sub_24E35C3EC()
{
  return sub_24E35C418(&qword_26B1B59C8);
}

void *sub_24E35C3F8()
{
  return sub_24E35CA38((uint64_t *)&unk_26B1B6380, &qword_26B1B63A0);
}

void *sub_24E35C40C()
{
  return sub_24E35C418(&qword_26B1B6508);
}

void *sub_24E35C418(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_24E360220();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
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
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    unint64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    *unint64_t v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ActorServiceCollection()
{
  return self;
}

uint64_t sub_24E35C5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *int64_t v9 = v3;
  v9[1] = sub_24E322CD0;
  return sub_24E351EAC(a1, a2, v6, v7, v8);
}

uint64_t method lookup function for ActorServiceCollection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActorServiceCollection);
}

uint64_t dispatch thunk of ActorServiceCollection.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of ActorServiceCollection.set(initialServices:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of ActorServiceCollection.startup()()
{
  uint64_t v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 248) + **(int **)(*(void *)v0 + 248));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_24E322CD0;
  return v4();
}

uint64_t destroy for StartupDependency()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for StartupDependency(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for StartupDependency(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

void *assignWithTake for StartupDependency(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StartupDependency(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StartupDependency(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StartupDependency()
{
  return &type metadata for StartupDependency;
}

unint64_t sub_24E35C9D0()
{
  unint64_t result = qword_26B1B67D0;
  if (!qword_26B1B67D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B67D0);
  }
  return result;
}

void *sub_24E35CA24()
{
  return sub_24E35CA38((uint64_t *)&unk_26B1B6340, (uint64_t *)&unk_26B1B6390);
}

void *sub_24E35CA38(uint64_t *a1, uint64_t *a2)
{
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v4 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  int64_t v34 = v2;
  uint64_t v7 = *v2;
  uint64_t v8 = sub_24E360220();
  uint64_t v9 = *(void *)(v7 + 16);
  uint64_t v40 = v8;
  if (!v9)
  {
    unint64_t result = (void *)swift_release();
    uint64_t v32 = v40;
    uint64_t v31 = v34;
LABEL_28:
    uint64_t *v31 = v32;
    return result;
  }
  uint64_t v10 = v8;
  unint64_t result = (void *)(v8 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v7 || (unint64_t)result >= v7 + 64 + 8 * v12)
  {
    unint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v12);
    uint64_t v10 = v40;
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = *(void *)(v7 + 16);
  uint64_t v15 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v7 + 64);
  uint64_t v35 = v7 + 64;
  int64_t v36 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v37 = v4 + 32;
  uint64_t v38 = v4 + 16;
  uint64_t v18 = v39;
  while (1)
  {
    if (v17)
    {
      unint64_t v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v36) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v28);
    ++v14;
    if (!v29)
    {
      int64_t v14 = v28 + 1;
      if (v28 + 1 >= v36) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v35 + 8 * v14);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v17 = (v29 - 1) & v29;
    unint64_t v20 = __clz(__rbit64(v29)) + (v14 << 6);
LABEL_12:
    uint64_t v21 = 16 * v20;
    unint64_t v22 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v20);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    unint64_t v25 = *(void *)(v4 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 56) + v25, v18);
    uint64_t v26 = v40;
    unint64_t v27 = (void *)(*(void *)(v40 + 48) + v21);
    void *v27 = v23;
    v27[1] = v24;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v26 + 56) + v25, v6, v18);
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v36)
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t v31 = v34;
    uint64_t v32 = v40;
    goto LABEL_28;
  }
  unint64_t v29 = *(void *)(v35 + 8 * v30);
  if (v29)
  {
    int64_t v14 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v14 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v14 >= v36) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v14);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24E35CCF4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B55E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E360220();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    uint64_t v24 = (void *)(*(void *)(v4 + 56) + v16);
    *uint64_t v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_24E35CEB0()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_24E35CEF8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_24E322CD0;
  *(void *)(v5 + 56) = v4;
  *(_OWORD *)(v5 + 40) = v6;
  *(void *)(v5 + 32) = a1;
  return MEMORY[0x270FA2498](sub_24E352264, 0, 0);
}

uint64_t sub_24E35CFBC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24E322CD0;
  return sub_24E35254C(a1, v4, v5, v6);
}

uint64_t sub_24E35D070()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_24E35D0B8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_24E322A50;
  return sub_24E358954(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_24E35D1A4()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E35D1DC(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_24E322CD0;
  return sub_24E35921C(a1, v5, v4);
}

uint64_t sub_24E35D288(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24E3603C0();
  swift_bridgeObjectRetain();
  sub_24E35FDF0();
  uint64_t v8 = sub_24E3603E0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24E360320() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (sub_24E360320() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24E35DC7C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24E35D438(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *v5;
  sub_24E3603C0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24E35FDF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E35FDF0();
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24E3603E0();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v14 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v15 = ~v12;
    uint64_t v16 = *(void *)(v10 + 48);
    while (1)
    {
      uint64_t v17 = (void *)(v16 + 32 * v13);
      uint64_t v18 = v17[2];
      uint64_t v19 = v17[3];
      BOOL v20 = *v17 == a2 && v17[1] == a3;
      if (v20 || (sub_24E360320() & 1) != 0)
      {
        BOOL v21 = v18 == a4 && v19 == a5;
        if (v21 || (sub_24E360320() & 1) != 0) {
          break;
        }
      }
      unint64_t v13 = (v13 + 1) & v15;
      if (((*(void *)(v14 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v22 = (uint64_t *)(*(void *)(*v28 + 48) + 32 * v13);
    uint64_t v23 = v22[1];
    uint64_t v24 = v22[2];
    uint64_t v25 = v22[3];
    *a1 = *v22;
    a1[1] = v23;
    a1[2] = v24;
    a1[3] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v30 = *v28;
    *int64_t v28 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24E35DE18(a2, a3, a4, a5, v13, isUniquelyReferenced_nonNull_native);
    *int64_t v28 = v30;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    uint64_t result = 1;
    a1[2] = a4;
    a1[3] = a5;
  }
  return result;
}

uint64_t sub_24E35D660()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8DB8);
  uint64_t v3 = sub_24E360120();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                  *uint64_t v30 = -1 << v29;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24E3603C0();
      sub_24E35FDF0();
      uint64_t result = sub_24E3603E0();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24E35D940()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B67F8);
  uint64_t v3 = sub_24E360120();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v33 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v32 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v16 = v33[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v32) {
              goto LABEL_33;
            }
            unint64_t v16 = v33[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v31 = 1 << *(unsigned char *)(v2 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v33 = -1 << v31;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v32) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v33[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = v2;
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v14);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      uint64_t v22 = v19[2];
      uint64_t v23 = v19[3];
      sub_24E3603C0();
      swift_bridgeObjectRetain();
      sub_24E35FDF0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24E35FDF0();
      swift_bridgeObjectRelease();
      uint64_t result = sub_24E3603E0();
      uint64_t v24 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      unint64_t v12 = (void *)(*(void *)(v4 + 48) + 32 * v11);
      *unint64_t v12 = v20;
      v12[1] = v21;
      v12[2] = v22;
      uint64_t v12[3] = v23;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v18;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24E35DC7C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24E35D660();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24E35E000();
      goto LABEL_22;
    }
    sub_24E35E378();
  }
  uint64_t v11 = *v4;
  sub_24E3603C0();
  sub_24E35FDF0();
  uint64_t result = sub_24E3603E0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24E360320(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24E360340();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24E360320();
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
  *uint64_t v21 = v8;
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

uint64_t sub_24E35DE18(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v11 = result;
  unint64_t v12 = *(void *)(*v6 + 16);
  unint64_t v13 = *(void *)(*v6 + 24);
  if (v13 > v12 && (a6 & 1) != 0) {
    goto LABEL_22;
  }
  if (a6)
  {
    sub_24E35D940();
  }
  else
  {
    if (v13 > v12)
    {
      uint64_t result = (uint64_t)sub_24E35E1B4();
      goto LABEL_22;
    }
    sub_24E35E628();
  }
  uint64_t v14 = *v6;
  sub_24E3603C0();
  swift_bridgeObjectRetain();
  sub_24E35FDF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24E35FDF0();
  swift_bridgeObjectRelease();
  uint64_t result = sub_24E3603E0();
  uint64_t v15 = -1 << *(unsigned char *)(v14 + 32);
  a5 = result & ~v15;
  uint64_t v16 = v14 + 56;
  if ((*(void *)(v14 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5))
  {
    uint64_t v17 = ~v15;
    uint64_t v18 = *(void *)(v14 + 48);
    while (1)
    {
      uint64_t v19 = (void *)(v18 + 32 * a5);
      uint64_t v20 = v19[2];
      uint64_t v21 = v19[3];
      BOOL v22 = *v19 == v11 && v19[1] == a2;
      if (v22 || (uint64_t result = sub_24E360320(), (result & 1) != 0))
      {
        if (v20 == a3 && v21 == a4) {
          break;
        }
        uint64_t result = sub_24E360320();
        if (result) {
          break;
        }
      }
      a5 = (a5 + 1) & v17;
      if (((*(void *)(v16 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5) & 1) == 0) {
        goto LABEL_22;
      }
    }
    uint64_t result = sub_24E360340();
    __break(1u);
  }
LABEL_22:
  uint64_t v24 = *v29;
  *(void *)(*v29 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  unint64_t v25 = (uint64_t *)(*(void *)(v24 + 48) + 32 * a5);
  *unint64_t v25 = v11;
  v25[1] = a2;
  void v25[2] = a3;
  v25[3] = a4;
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (v27) {
    __break(1u);
  }
  else {
    *(void *)(v24 + 16) = v28;
  }
  return result;
}

void *sub_24E35E000()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8DB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E360110();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
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

void *sub_24E35E1B4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B67F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24E360110();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    v21[2] = v19;
    v21[3] = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v13) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24E35E378()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2698D8DB8);
  uint64_t v3 = sub_24E360120();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24E3603C0();
    swift_bridgeObjectRetain();
    sub_24E35FDF0();
    uint64_t result = sub_24E3603E0();
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
    void *v13 = v20;
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

uint64_t sub_24E35E628()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B67F8);
  uint64_t v3 = sub_24E360120();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v30 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v30 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v30 + 8 * v10);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    int64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v14);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = v18[2];
    uint64_t v22 = v18[3];
    sub_24E3603C0();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_24E35FDF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24E35FDF0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_24E3603E0();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v8 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v11 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    unint64_t v12 = (void *)(*(void *)(v4 + 48) + 32 * v11);
    *unint64_t v12 = v19;
    v12[1] = v20;
    v12[2] = v21;
    uint64_t v12[3] = v22;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v30 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_24E35E930(void *a1)
{
  return sub_24E33A244(0, a1[2], 0, a1);
}

uint64_t sub_24E35E944(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return MEMORY[0x270FA2498](sub_24E35E960, a2, 0);
}

uint64_t sub_24E35E960()
{
  if (qword_26B1B5C80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24E35FD10();
  __swift_project_value_buffer(v1, (uint64_t)qword_26B1B6420);
  uint64_t v2 = sub_24E35FCF0();
  os_log_type_t v3 = sub_24E360030();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24E31F000, v2, v3, "This is the first run since reboot", v4, 2u);
    MEMORY[0x25333A4C0](v4, -1, -1);
  }

  uint64_t v5 = sub_24E35FCC0();
  uint64_t v7 = v6;
  if (qword_26B1B6480 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63A8);
  __swift_project_value_buffer(v8, (uint64_t)qword_26B1B6460);
  v0[5] = v5;
  v0[6] = v7;
  swift_beginAccess();
  sub_24E35FB50();
  swift_endAccess();
  uint64_t v9 = (void *)swift_task_alloc();
  v0[9] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_24E35EB64;
  uint64_t v10 = v0[8];
  v9[2] = v10;
  return MEMORY[0x270FA2498](sub_24E35823C, v10, 0);
}

uint64_t sub_24E35EB64()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24E35EC58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void *)(*(void *)a1 + 16);
  if (!v4) {
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  uint64_t v40 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 24);
  uint64_t v41 = ObjectType;
  while (1)
  {
    unint64_t v42 = v8;
    uint64_t v9 = v3[v7 + 5];
    uint64_t v10 = swift_getObjectType();
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 24);
    swift_unknownObjectRetain();
    uint64_t v12 = v11(v10, v9);
    uint64_t v14 = v13;
    if (v12 == v40(v41, a3) && v14 == v15) {
      break;
    }
    char v17 = sub_24E360320();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_13;
    }
    unint64_t v8 = v42 + 1;
    v7 += 2;
    if (v4 == v42 + 1)
    {
      swift_bridgeObjectRelease();
      return v3[2];
    }
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
LABEL_13:
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v19 = v42 + 1;
  if (!__OFADD__(v42, 1))
  {
    unint64_t v20 = v3[2];
    while (v19 != v20)
    {
      if (v19 >= v20)
      {
        __break(1u);
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
        goto LABEL_40;
      }
      uint64_t v39 = v3;
      uint64_t v21 = &v3[v7];
      uint64_t v22 = v3[v7 + 7];
      uint64_t v23 = swift_getObjectType();
      uint64_t v24 = a3;
      unint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(v22 + 24);
      swift_unknownObjectRetain();
      uint64_t v26 = v25(v23, v22);
      a3 = v24;
      uint64_t v28 = v27;
      if (v26 == v40(v41, v24) && v28 == v29)
      {
        swift_unknownObjectRelease();
        uint64_t result = swift_bridgeObjectRelease_n();
        uint64_t v3 = v39;
      }
      else
      {
        char v31 = sub_24E360320();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v3 = v39;
        if ((v31 & 1) == 0)
        {
          unint64_t v32 = v42;
          if (v19 != v42)
          {
            if ((v42 & 0x8000000000000000) != 0) {
              goto LABEL_36;
            }
            unint64_t v33 = v39[2];
            if (v42 >= v33) {
              goto LABEL_37;
            }
            if (v19 >= v33) {
              goto LABEL_38;
            }
            long long v38 = *((_OWORD *)v21 + 3);
            long long v36 = *(_OWORD *)&v39[2 * v42 + 4];
            swift_unknownObjectRetain();
            swift_unknownObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v3 = sub_24E35E930(v39);
            }
            *(_OWORD *)&v3[2 * v42 + 4] = v38;
            uint64_t result = swift_unknownObjectRelease();
            if (v19 >= v3[2]) {
              goto LABEL_39;
            }
            *(_OWORD *)&v3[v7 + 6] = v36;
            uint64_t result = swift_unknownObjectRelease();
            *(void *)a1 = v3;
            unint64_t v32 = v42;
          }
          BOOL v34 = __OFADD__(v32, 1);
          unint64_t v35 = v32 + 1;
          if (v34) {
            goto LABEL_35;
          }
          unint64_t v42 = v35;
        }
      }
      ++v19;
      unint64_t v20 = v3[2];
      v7 += 2;
    }
    return v42;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24E35EFC0(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t v4 = sub_24E33A244(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1B63F0);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    unint64_t v16 = (char *)&v4[2 * a2 + 4];
    if (a1 != a2 || &v4[2 * a1 + 4] >= (void *)&v16[16 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[2 * a1 + 4], v16, 16 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_24E360250();
  __break(1u);
  return result;
}

unint64_t sub_24E35F134()
{
  unint64_t result = qword_26B1B55F0;
  if (!qword_26B1B55F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1B55F0);
  }
  return result;
}

uint64_t sub_24E35F188(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24E35F1D8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24E35F228(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_24E322CD0;
  return sub_24E353FB0(a1, a2, v7, v6);
}

uint64_t sub_24E35F2DC()
{
  return objectdestroy_47Tm(56);
}

uint64_t sub_24E35F2E4()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_24E322CD0;
  *(_OWORD *)(v2 + 64) = v3;
  return MEMORY[0x270FA2498](sub_24E3543B4, 0, 0);
}

uint64_t sub_24E35F390()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24E35F3C8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24E322CD0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2698D9248 + dword_2698D9248);
  return v6(a1, v4);
}

uint64_t sub_24E35F480(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_24E322A50;
  return sub_24E358400(a1, a2, v2);
}

uint64_t sub_24E35F52C()
{
  return objectdestroy_47Tm(48);
}

uint64_t sub_24E35F534(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24E322CD0;
  return sub_24E3587C8(a1, v4, v5, v7, v6);
}

uint64_t sub_24E35F5F4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24E35F640(uint64_t a1)
{
  return a1;
}

uint64_t sub_24E35F68C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  int64_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *int64_t v9 = v3;
  v9[1] = sub_24E322CD0;
  return sub_24E357BC4(a1, a2, v6, v7, v8);
}

uint64_t sub_24E35F750()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 208, 7);
}

uint64_t sub_24E35F7C0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24E322CD0;
  return sub_24E357FD4(a1, v4, v5, v6, v7, (_OWORD *)(v1 + 48), (long long *)(v1 + 128));
}

uint64_t sub_24E35F898(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[1] = sub_24E322CD0;
  return sub_24E357078(a1, a2, v2);
}

uint64_t sub_24E35F944()
{
  return objectdestroy_47Tm(48);
}

uint64_t objectdestroy_47Tm(uint64_t a1)
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v1, a1, 7);
}

uint64_t sub_24E35F998(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_24E322CD0;
  return sub_24E357440(a1, v4, v5, v7, v6);
}

uint64_t sub_24E35FA58(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_24E35FAB0()
{
  return MEMORY[0x270F28C28]();
}

uint64_t sub_24E35FAC0()
{
  return MEMORY[0x270F28C30]();
}

uint64_t sub_24E35FAD0()
{
  return MEMORY[0x270F28C40]();
}

uint64_t sub_24E35FAE0()
{
  return MEMORY[0x270F28C48]();
}

uint64_t sub_24E35FB00()
{
  return MEMORY[0x270F28C60]();
}

uint64_t sub_24E35FB10()
{
  return MEMORY[0x270F28C68]();
}

uint64_t sub_24E35FB20()
{
  return MEMORY[0x270F28C70]();
}

uint64_t sub_24E35FB40()
{
  return MEMORY[0x270F28CD0]();
}

uint64_t sub_24E35FB50()
{
  return MEMORY[0x270F28CD8]();
}

uint64_t sub_24E35FB60()
{
  return MEMORY[0x270F28CE0]();
}

uint64_t sub_24E35FB70()
{
  return MEMORY[0x270F28CF8]();
}

uint64_t sub_24E35FB80()
{
  return MEMORY[0x270F28D00]();
}

uint64_t sub_24E35FB90()
{
  return MEMORY[0x270F28D28]();
}

uint64_t sub_24E35FBB0()
{
  return MEMORY[0x270F28D38]();
}

uint64_t sub_24E35FBC0()
{
  return MEMORY[0x270F28D40]();
}

uint64_t sub_24E35FBD0()
{
  return MEMORY[0x270F28D48]();
}

uint64_t sub_24E35FBF0()
{
  return MEMORY[0x270F28DA8]();
}

uint64_t sub_24E35FC00()
{
  return MEMORY[0x270F28DB0]();
}

uint64_t sub_24E35FC10()
{
  return MEMORY[0x270F28DC0]();
}

uint64_t sub_24E35FC20()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24E35FC30()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24E35FC40()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_24E35FC50()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_24E35FC60()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_24E35FC70()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24E35FC80()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24E35FC90()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_24E35FCA0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24E35FCB0()
{
  return MEMORY[0x270EF0C58]();
}

uint64_t sub_24E35FCC0()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_24E35FCD0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24E35FCE0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24E35FCF0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24E35FD00()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24E35FD10()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24E35FD20()
{
  return MEMORY[0x270FA1A00]();
}

uint64_t sub_24E35FD30()
{
  return MEMORY[0x270FA1A48]();
}

uint64_t sub_24E35FD40()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_24E35FD50()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_24E35FD60()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24E35FD70()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_24E35FD80()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24E35FD90()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t sub_24E35FDA0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24E35FDB0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24E35FDC0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24E35FDD0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24E35FDE0()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24E35FDF0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24E35FE00()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24E35FE10()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24E35FE20()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24E35FE30()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_24E35FE50()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24E35FE60()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24E35FE70()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24E35FE80()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24E35FE90()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24E35FEA0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24E35FEB0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24E35FEC0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24E35FED0()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24E35FEE0()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24E35FEF0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24E35FF00()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24E35FF10()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_24E35FF20()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_24E35FF30()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24E35FF50()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_24E35FF60()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_24E35FF70()
{
  return MEMORY[0x270FA1FD8]();
}

uint64_t sub_24E35FF80()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24E35FF90()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t sub_24E35FFA0()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_24E35FFB0()
{
  return MEMORY[0x270F9DF60]();
}

uint64_t sub_24E35FFC0()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t sub_24E35FFD0()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_24E35FFE0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_24E35FFF0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_24E360000()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24E360010()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24E360020()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24E360030()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24E360040()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_24E360050()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24E360060()
{
  return MEMORY[0x270EF2360]();
}

uint64_t sub_24E360070()
{
  return MEMORY[0x270EF2370]();
}

uint64_t sub_24E360080()
{
  return MEMORY[0x270EF2390]();
}

uint64_t sub_24E360090()
{
  return MEMORY[0x270EF2398]();
}

uint64_t sub_24E3600A0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24E3600B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24E3600C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24E3600D0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24E3600E0()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24E3600F0()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24E360110()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24E360120()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24E360130()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24E360140()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24E360150()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24E360160()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24E360170()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24E360180()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24E3601A0()
{
  return MEMORY[0x270FA2160]();
}

uint64_t sub_24E3601B0()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_24E3601C0()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_24E3601D0()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_24E3601E0()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_24E3601F0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24E360200()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24E360210()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24E360220()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24E360230()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24E360240()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24E360250()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24E360270()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24E360280()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24E360290()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24E3602A0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24E3602B0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24E3602C0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24E3602D0()
{
  return MEMORY[0x270F28EB0]();
}

uint64_t sub_24E3602E0()
{
  return MEMORY[0x270F28EB8]();
}

uint64_t sub_24E3602F0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24E360310()
{
  return MEMORY[0x270F9F7A8]();
}

uint64_t sub_24E360320()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24E360340()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24E360350()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24E360360()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_24E360380()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24E360390()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24E3603A0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24E3603B0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24E3603C0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24E3603D0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24E3603E0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24E3603F0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24E360400()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24E360410()
{
  return MEMORY[0x270F28ED8]();
}

uint64_t sub_24E360420()
{
  return MEMORY[0x270EF2948]();
}

uint64_t sub_24E360430()
{
  return MEMORY[0x270EF2980]();
}

uint64_t sub_24E360460()
{
  return MEMORY[0x270FA23A8]();
}

uint64_t sub_24E360470()
{
  return MEMORY[0x270FA23B8]();
}

uint64_t sub_24E360490()
{
  return MEMORY[0x270FA0128]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
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

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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

uint64_t swift_task_localValuePop()
{
  return MEMORY[0x270FA2480]();
}

uint64_t swift_task_localValuePush()
{
  return MEMORY[0x270FA2488]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
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

uint64_t xpc_copy_event()
{
  return MEMORY[0x270EDBF60]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}