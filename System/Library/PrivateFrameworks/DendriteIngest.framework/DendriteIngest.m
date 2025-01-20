uint64_t IngestServiceConnection.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  IngestServiceConnection.init()();
  return v0;
}

uint64_t IngestServiceConnection.init()()
{
  swift_defaultActor_initialize();
  *(void *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = 0;
  id v1 = objc_allocWithZone(MEMORY[0x263F08D68]);
  v2 = (void *)sub_24CA9BCA0();
  id v3 = objc_msgSend(v1, sel_initWithServiceName_, v2);

  v4 = *(void **)(v0 + 112);
  *(void *)(v0 + 112) = v3;
  id v5 = v3;

  id v6 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FF19278);
  objc_msgSend(v5, sel_setRemoteObjectInterface_, v6);

  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  v10[4] = sub_24CA95398;
  v10[5] = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_24CA956E4;
  v10[3] = &block_descriptor;
  v8 = _Block_copy(v10);
  swift_release();
  objc_msgSend(v5, sel_setInvalidationHandler_, v8);
  _Block_release(v8);
  objc_msgSend(v5, sel_resume);

  return v0;
}

uint64_t sub_24CA95214()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CA9524C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A1F0);
  MEMORY[0x270FA5388]();
  id v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_24CA9BD60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_release();
  v4 = (void *)swift_allocObject();
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = v3;
  sub_24CA95538((uint64_t)v1, (uint64_t)&unk_26980A200, (uint64_t)v4);
  return swift_release();
}

uint64_t sub_24CA95398()
{
  return sub_24CA9524C();
}

uint64_t sub_24CA953A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a4;
  return MEMORY[0x270FA2498](sub_24CA953C0, 0, 0);
}

uint64_t sub_24CA953C0()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 56) = Strong;
  if (Strong)
  {
    return MEMORY[0x270FA2498](sub_24CA95488, Strong, 0);
  }
  else
  {
    **(unsigned char **)(v0 + 40) = 1;
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_24CA95488()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void **)(v1 + 112);
  *(void *)(v1 + 112) = 0;

  *(void *)(v1 + 120) = 0;
  swift_release();
  swift_unknownObjectRelease();
  return MEMORY[0x270FA2498](sub_24CA95510, 0, 0);
}

uint64_t sub_24CA95510()
{
  **(unsigned char **)(v0 + 40) = *(void *)(v0 + 56) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24CA95538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24CA9BD60();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24CA9BD50();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24CA97D14(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24CA9BD20();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(qword_26980A218);
  return swift_task_create();
}

uint64_t sub_24CA956E4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
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

uint64_t sub_24CA95740()
{
  *(void *)(v1 + 120) = v0;
  return MEMORY[0x270FA2498](sub_24CA95760, v0, 0);
}

uint64_t sub_24CA95760()
{
  if (qword_26980A178 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v1, (uint64_t)qword_26980A738);
  sub_24CA98AF0(0x2928747365676E69, 0xE800000000000000, 0xD000000000000064, 0x800000024CA9C7A0, 0x2928747365676E69, 0xE800000000000000);
  uint64_t v2 = sub_24CA95E20();
  v0[16] = v2;
  uint64_t v3 = (void *)v2;
  v0[2] = v0;
  v0[3] = sub_24CA95930;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24CA95B28;
  v0[13] = &block_descriptor_1;
  v0[14] = v4;
  objc_msgSend(v3, sel_ingestWithCompletionHandler_, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24CA95930()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 136) = v2;
  uint64_t v3 = *(void *)(v1 + 120);
  if (v2) {
    uint64_t v4 = sub_24CA95AB4;
  }
  else {
    uint64_t v4 = sub_24CA95A50;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24CA95A50()
{
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CA95AB4()
{
  swift_willThrow();
  swift_unknownObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CA95B28(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980A1D8);
    uint64_t v4 = swift_allocError();
    *id v5 = a2;
    id v6 = a2;
    return MEMORY[0x270FA2410](v2, v4);
  }
  else
  {
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_24CA95BC0()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_24CA95BE0, v0, 0);
}

uint64_t sub_24CA95BE0()
{
  if (qword_26980A178 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v1, (uint64_t)qword_26980A738);
  sub_24CA98AF0(0x7328747365676E69, 0xEF293A676E697274, 0xD000000000000064, 0x800000024CA9C7A0, 0x7328747365676E69, 0xEF293A676E697274);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  void *v2 = v0;
  v2[1] = sub_24CA95D2C;
  uint64_t v3 = *(void *)(v0 + 16);
  v2[15] = v3;
  return MEMORY[0x270FA2498](sub_24CA95760, v3, 0);
}

uint64_t sub_24CA95D2C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CA95E20()
{
  uint64_t v1 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + 120))
  {
    uint64_t v4 = *(void *)(v0 + 120);
  }
  else
  {
    uint64_t v5 = swift_allocObject();
    uint64_t v6 = v5;
    *(void *)(v5 + 16) = 0;
    uint64_t v4 = v5 + 16;
    uint64_t v7 = *(void **)(v0 + 112);
    if (!v7) {
      goto LABEL_9;
    }
    v20 = sub_24CA97BC8;
    uint64_t v21 = v5;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v17 = 1107296256;
    v18 = sub_24CA998DC;
    v19 = &block_descriptor_26;
    uint64_t v8 = _Block_copy(&aBlock);
    id v9 = v7;
    swift_retain();
    swift_release();
    id v10 = objc_msgSend(v9, sel_remoteObjectProxyWithErrorHandler_, v8);
    _Block_release(v8);

    sub_24CA9BDA0();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980A1E0);
    if ((swift_dynamicCast() & 1) == 0)
    {
LABEL_9:
      swift_beginAccess();
      v12 = *(void **)(v6 + 16);
      sub_24CA97BD0();
      swift_allocError();
      void *v13 = v12;
      id v14 = v12;
      swift_willThrow();
      swift_release();
      return v4;
    }
    uint64_t v4 = aBlock;
    *(void *)(v0 + 120) = aBlock;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    if (qword_26980A178 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v1, (uint64_t)qword_26980A738);
    sub_24CA971A0(v11, (uint64_t)v3);
    uint64_t aBlock = 0x203A79786F7270;
    unint64_t v17 = 0xE700000000000000;
    uint64_t v22 = v4;
    swift_unknownObjectRetain();
    sub_24CA9BCC0();
    sub_24CA9BCD0();
    swift_bridgeObjectRelease();
    sub_24CA98AF0(aBlock, v17, 0xD000000000000064, 0x800000024CA9C7A0, 0x292879786F7270, 0xE700000000000000);
    swift_bridgeObjectRelease();
    sub_24CA972B4((uint64_t)v3);
    swift_release();
  }
  swift_unknownObjectRetain();
  return v4;
}

void sub_24CA96140(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26980A178 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v4, (uint64_t)qword_26980A738);
  sub_24CA971A0(v7, (uint64_t)v6);
  uint64_t v10 = 0;
  unint64_t v11 = 0xE000000000000000;
  sub_24CA9BDB0();
  sub_24CA9BCD0();
  uint64_t v12 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A1D8);
  sub_24CA9BDF0();
  sub_24CA98B08(v10, v11, 0xD000000000000064, 0x800000024CA9C7A0, 0x292879786F7270, 0xE700000000000000);
  swift_bridgeObjectRelease();
  sub_24CA972B4((uint64_t)v6);
  uint64_t v8 = sub_24CA9BBE0();
  swift_beginAccess();
  id v9 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v8;
}

uint64_t sub_24CA96300(uint64_t a1, uint64_t a2)
{
  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  v3[19] = type metadata accessor for InternalLogger();
  v3[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CA96398, v2, 0);
}

uint64_t sub_24CA96398()
{
  unint64_t v11 = v0;
  if (qword_26980A178 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[20];
  unint64_t v2 = v0[17];
  uint64_t v3 = v0[16];
  uint64_t v4 = __swift_project_value_buffer(v0[19], (uint64_t)qword_26980A738);
  sub_24CA971A0(v4, v1);
  strcpy((char *)v10, "save(event: ");
  BYTE5(v10[1]) = 0;
  HIWORD(v10[1]) = -5120;
  sub_24CA97204(v3, v2);
  sub_24CA9BC30();
  sub_24CA9725C(v3, v2);
  sub_24CA9BCD0();
  swift_bridgeObjectRelease();
  sub_24CA9BCD0();
  sub_24CA98AF0(v10[0], v10[1], 0xD000000000000064, 0x800000024CA9C7A0, 0x6576652865766173, 0xEC000000293A746ELL);
  swift_bridgeObjectRelease();
  sub_24CA972B4(v1);
  uint64_t v5 = sub_24CA95E20();
  v0[21] = v5;
  uint64_t v6 = (void *)v5;
  uint64_t v7 = sub_24CA9BC40();
  v0[22] = v7;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24CA9662C;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24CA96854;
  v0[13] = &block_descriptor_5;
  v0[14] = v8;
  objc_msgSend(v6, sel_saveWithEvent_completionHandler_, v7, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24CA9662C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 184) = v2;
  uint64_t v3 = *(void *)(v1 + 144);
  if (v2) {
    uint64_t v4 = sub_24CA967D0;
  }
  else {
    uint64_t v4 = sub_24CA9674C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24CA9674C()
{
  uint64_t v1 = (void *)v0[22];
  uint64_t v2 = v0[15];
  swift_unknownObjectRelease();

  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_24CA967D0()
{
  uint64_t v1 = *(void **)(v0 + 176);
  swift_willThrow();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24CA96854(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980A1D8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    **(void **)(*(void *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_24CA96908(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  v3[20] = type metadata accessor for InternalLogger();
  v3[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CA969A0, v2, 0);
}

uint64_t sub_24CA969A0()
{
  if (qword_26980A178 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[18];
  uint64_t v3 = __swift_project_value_buffer(v0[20], (uint64_t)qword_26980A738);
  sub_24CA971A0(v3, v1);
  v0[15] = v2;
  sub_24CA9BE30();
  sub_24CA9BCD0();
  swift_bridgeObjectRelease();
  sub_24CA9BCD0();
  sub_24CA98AF0(0x6469286863746566, 0xEA0000000000203ALL, 0xD000000000000064, 0x800000024CA9C7A0, 0x6469286863746566, 0xEA0000000000293ALL);
  swift_bridgeObjectRelease();
  sub_24CA972B4(v1);
  uint64_t v4 = sub_24CA95E20();
  v0[22] = v4;
  uint64_t v5 = (void *)v4;
  uint64_t v6 = v0[18];
  v0[2] = v0;
  v0[7] = v0 + 16;
  v0[3] = sub_24CA96BFC;
  uint64_t v7 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24CA96EAC;
  v0[13] = &block_descriptor_7;
  v0[14] = v7;
  objc_msgSend(v5, sel_fetchWithId_completionHandler_, v6, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24CA96BFC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 184) = v2;
  uint64_t v3 = *(void *)(v1 + 152);
  if (v2) {
    uint64_t v4 = sub_24CA96E30;
  }
  else {
    uint64_t v4 = sub_24CA96D1C;
  }
  return MEMORY[0x270FA2498](v4, v3, 0);
}

uint64_t sub_24CA96D1C()
{
  uint64_t v1 = (void *)v0[16];
  uint64_t v2 = v0[17];
  if (v1)
  {
    id v3 = v1;
    sub_24CA9BC90();

    uint64_t v4 = sub_24CA9BC80();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    uint64_t v5 = sub_24CA9BC80();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_24CA96E30()
{
  swift_willThrow();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CA96EAC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980A1D8);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    unint64_t v11 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    id v9 = a2;
    sub_24CA97AE4((uint64_t)&v11, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t IngestServiceConnection.deinit()
{
  if (qword_26980A178 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v1, (uint64_t)qword_26980A738);
  sub_24CA98AF0(0x61636F6C6C616544, 0xEC000000676E6974, 0xD000000000000064, 0x800000024CA9C7A0, 0x74696E696564, 0xE600000000000000);
  uint64_t v2 = *(void **)(v0 + 112);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    uint64_t v3 = *(void **)(v0 + 112);
  }
  else
  {
    uint64_t v3 = 0;
  }

  swift_unknownObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t IngestServiceConnection.__deallocating_deinit()
{
  if (qword_26980A178 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for InternalLogger();
  __swift_project_value_buffer(v1, (uint64_t)qword_26980A738);
  sub_24CA98AF0(0x61636F6C6C616544, 0xEC000000676E6974, 0xD000000000000064, 0x800000024CA9C7A0, 0x74696E696564, 0xE600000000000000);
  uint64_t v2 = *(void **)(v0 + 112);
  if (v2)
  {
    objc_msgSend(v2, sel_invalidate);
    uint64_t v3 = *(void **)(v0 + 112);
  }
  else
  {
    uint64_t v3 = 0;
  }

  swift_unknownObjectRelease();
  swift_defaultActor_destroy();
  return MEMORY[0x270FA2418](v0);
}

uint64_t IngestServiceConnection.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24CA9715C()
{
  return v0;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24CA971A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24CA97204(uint64_t a1, unint64_t a2)
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

uint64_t sub_24CA9725C(uint64_t a1, unint64_t a2)
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

uint64_t sub_24CA972B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void **initializeBufferWithCopyOfBuffer for IngestServiceError(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for IngestServiceError(id *a1)
{
}

void **assignWithCopy for IngestServiceError(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for IngestServiceError(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for IngestServiceError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IngestServiceError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_24CA9746C()
{
  return 0;
}

ValueMetadata *type metadata accessor for IngestServiceError()
{
  return &type metadata for IngestServiceError;
}

uint64_t type metadata accessor for IngestServiceConnection()
{
  return self;
}

uint64_t method lookup function for IngestServiceConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for IngestServiceConnection);
}

uint64_t dispatch thunk of IngestServiceConnection.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of IngestServiceConnection.ingest()()
{
  int v4 = (uint64_t (*)(void))(*(void *)(*(void *)v0 + 168) + **(int **)(*(void *)v0 + 168));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  void *v2 = v1;
  v2[1] = sub_24CA9805C;
  return v4();
}

uint64_t dispatch thunk of IngestServiceConnection.ingest(string:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 176) + **(int **)(*(void *)v2 + 176));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24CA9805C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of IngestServiceConnection.save(event:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 192) + **(int **)(*(void *)v2 + 192));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24CA977E4;
  return v8(a1, a2);
}

uint64_t sub_24CA977E4(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of IngestServiceConnection.fetch(id:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 200) + **(int **)(*(void *)v2 + 200));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_24CA979F0;
  return v8(a1, a2);
}

uint64_t sub_24CA979F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24CA97AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A1D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t sub_24CA97B90()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_24CA97BC8(uint64_t a1)
{
  sub_24CA96140(a1, v1);
}

unint64_t sub_24CA97BD0()
{
  unint64_t result = qword_26980A1E8;
  if (!qword_26980A1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980A1E8);
  }
  return result;
}

uint64_t sub_24CA97C24()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24CA97C64(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CA979F0;
  v5[5] = a1;
  v5[6] = v4;
  return MEMORY[0x270FA2498](sub_24CA953C0, 0, 0);
}

uint64_t sub_24CA97D14(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A1F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24CA97D74(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24CA97E54;
  return v5(v2 + 32);
}

uint64_t sub_24CA97E54()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_24CA97F68()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24CA97FA0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24CA9805C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26980A208 + dword_26980A208);
  return v6(a1, v4);
}

id IngestionExtension.configuration.getter@<X0>(void *a1@<X8>)
{
  type metadata accessor for ConcreteConfiguration.ExportedObject();
  id result = sub_24CA98468(v1);
  *a1 = result;
  return result;
}

uint64_t sub_24CA980AC(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26FF192D8);
  objc_msgSend(a1, sel_setExportedInterface_, v4);

  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  return 1;
}

uint64_t sub_24CA98148(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x58) + 16))(a1, a2, *(void *)((*MEMORY[0x263F8EED0] & *v2) + 0x50));
}

uint64_t sub_24CA981CC(void *a1, int a2, void *aBlock)
{
  id v4 = _Block_copy(aBlock);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = a1;
  sub_24CA98148((uint64_t)sub_24CA98674, v5);

  return swift_release();
}

void sub_24CA98258()
{
}

id sub_24CA9829C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConcreteConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24CA98310(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)a1) + 0x60)]);
}

uint64_t sub_24CA98378(void *a1)
{
  sub_24CA980AC(a1, *v1);
  return 1;
}

id sub_24CA98398(uint64_t a1)
{
  (*(void (**)(char *, uint64_t, void))(*(void *)(*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1)
                                                                          + 0x50)
                                                              - 8)
                                                  + 16))(&v1[*(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x60)], a1, *(void *)((*MEMORY[0x263F8EED0] & *(void *)v1) + 0x50));
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for ConcreteConfiguration.ExportedObject();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_24CA98468(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for ConcreteConfiguration.ExportedObject());
  return sub_24CA98398(a1);
}

uint64_t dispatch thunk of IngestionExtension.ingest(reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_24CA984BC()
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

uint64_t type metadata accessor for ConcreteConfiguration.ExportedObject()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CA98568()
{
  type metadata accessor for ConcreteConfiguration();
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for ConcreteConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_24CA985C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_24CA985D0(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_24CA9860C()
{
}

uint64_t sub_24CA9863C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CA98674()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_24CA986B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA9BC60();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_24CA98720(uint64_t a1)
{
  uint64_t v2 = sub_24CA9BC60();
  objc_super v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_24CA98784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA9BC60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CA987E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA9BC60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CA9884C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA9BC60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CA988B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA9BC60();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_24CA98914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24CA98928);
}

uint64_t sub_24CA98928(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA9BC60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_24CA98994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24CA989A8);
}

uint64_t sub_24CA989A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24CA9BC60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for InternalLogger()
{
  uint64_t result = qword_26980A330;
  if (!qword_26980A330) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24CA98A64()
{
  uint64_t result = sub_24CA9BC60();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24CA98AF0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_24CA98D7C(a1, a2, a3, a4, a5, a6, MEMORY[0x263F90278]);
}

uint64_t sub_24CA98B08(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_24CA98D7C(a1, a2, a3, a4, a5, a6, MEMORY[0x263F90280]);
}

uint64_t sub_24CA98B20(uint64_t a1)
{
  return sub_24CA98B78(a1, qword_26980A720, &qword_26980A180, (id *)&qword_26980A320);
}

uint64_t sub_24CA98B4C(uint64_t a1)
{
  return sub_24CA98B78(a1, qword_26980A738, &qword_26980A188, (id *)&qword_26980A328);
}

uint64_t sub_24CA98B78(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_24CA9BC60();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for InternalLogger();
  __swift_allocate_value_buffer(v11, a2);
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v13 = *a4;
  sub_24CA9BC70();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v12, v10, v7);
}

uint64_t sub_24CA98CA4()
{
  sub_24CA9989C();
  uint64_t result = sub_24CA9BD70();
  qword_26980A320 = result;
  return result;
}

uint64_t sub_24CA98D0C()
{
  sub_24CA9989C();
  uint64_t result = sub_24CA9BD70();
  qword_26980A328 = result;
  return result;
}

uint64_t sub_24CA98D64(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_24CA98D7C(a1, a2, a3, a4, a5, a6, MEMORY[0x263F90270]);
}

uint64_t sub_24CA98D7C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v35 = a5;
  uint64_t v36 = a1;
  uint64_t v32 = a3;
  uint64_t v11 = sub_24CA9BC20();
  uint64_t v33 = *(void *)(v11 - 8);
  uint64_t v34 = v11;
  MEMORY[0x270FA5388]();
  id v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_24CA9BC60();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v7, v14);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v18 = sub_24CA9BC50();
  os_log_type_t v19 = a7();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    unint64_t v29 = a2;
    uint64_t v22 = v21;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v38 = v31;
    *(_DWORD *)uint64_t v22 = 136315650;
    sub_24CA9BC00();
    int v30 = v20;
    uint64_t v23 = sub_24CA9BC10();
    uint64_t v32 = v14;
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v34);
    uint64_t v37 = sub_24CA99130(v23, v25, &v38);
    sub_24CA9BD80();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_24CA99130(v35, a6, &v38);
    sub_24CA9BD80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 22) = 2080;
    unint64_t v26 = v29;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_24CA99130(v36, v26, &v38);
    sub_24CA9BD80();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24CA93000, v18, (os_log_type_t)v30, "[%s: %s] %s", (uint8_t *)v22, 0x20u);
    uint64_t v27 = v31;
    swift_arrayDestroy();
    MEMORY[0x2533074B0](v27, -1, -1);
    MEMORY[0x2533074B0](v22, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v32);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_24CA99130(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24CA99204(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CA997D8((uint64_t)v12, *a3);
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
      sub_24CA997D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24CA99204(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24CA9BD90();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24CA993C0(a5, a6);
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
  uint64_t v8 = sub_24CA9BDE0();
  if (!v8)
  {
    sub_24CA9BE00();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24CA9BE20();
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

uint64_t sub_24CA993C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24CA99458(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24CA99638(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24CA99638(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24CA99458(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24CA995D0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24CA9BDC0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24CA9BE00();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24CA9BCE0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24CA9BE20();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24CA9BE00();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24CA995D0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A340);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24CA99638(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26980A340);
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
  uint64_t result = sub_24CA9BE20();
  __break(1u);
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

uint64_t sub_24CA997D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

unint64_t sub_24CA9989C()
{
  unint64_t result = qword_26980A348;
  if (!qword_26980A348)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26980A348);
  }
  return result;
}

void sub_24CA998DC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_24CA99944()
{
  uint64_t v2 = v0[1];
  *(void *)(v1 + 128) = *v0;
  *(void *)(v1 + 136) = v2;
  return MEMORY[0x270FA2498](sub_24CA99968, 0, 0);
}

uint64_t sub_24CA99968()
{
  id v1 = objc_allocWithZone(MEMORY[0x263F04DE8]);
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_24CA9BCA0();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(v1, sel_initWithExtensionPointIdentifier_, v2);
  v0[18] = v3;

  id v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A388);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_24CA9C660;
  *(void *)(v5 + 32) = v3;
  sub_24CA9BD10();
  sub_24CA9BB90(0, &qword_26980A390);
  id v6 = v3;
  uint64_t v7 = sub_24CA9BCF0();
  v0[19] = v7;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_24CA99B50;
  uint64_t v8 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_24CA99C9C;
  v0[13] = &block_descriptor_17;
  v0[14] = v8;
  objc_msgSend(v4, sel_executeQueries_completionHandler_, v7, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_24CA99B50()
{
  return MEMORY[0x270FA2498](sub_24CA99C30, 0, 0);
}

uint64_t sub_24CA99C30()
{
  uint64_t v1 = *(void **)(v0 + 152);

  uint64_t v2 = *(void *)(v0 + 120);
  id v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_24CA99C9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_24CA9BB90(0, &qword_26980A398);
  **(void **)(*(void *)(v1 + 64) + 40) = sub_24CA9BD00();
  return MEMORY[0x270FA2400](v1);
}

BOOL static IngestionExtensionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t IngestionExtensionError.hash(into:)()
{
  return sub_24CA9BEA0();
}

uint64_t IngestionExtensionError.hashValue.getter()
{
  return sub_24CA9BEB0();
}

BOOL sub_24CA99DA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24CA99DB8()
{
  return sub_24CA9BEB0();
}

uint64_t sub_24CA99E00()
{
  return sub_24CA9BEA0();
}

uint64_t sub_24CA99E2C()
{
  return sub_24CA9BEB0();
}

DendriteIngest::IngestionExtensionHost __swiftcall IngestionExtensionHost.init()()
{
  *uint64_t v0 = 0xD000000000000032;
  v0[1] = 0x800000024CA9CD40;
  return result;
}

uint64_t IngestionExtensionHost.ingest()()
{
  v1[7] = type metadata accessor for InternalLogger();
  uint64_t v2 = swift_task_alloc();
  uint64_t v3 = *v0;
  uint64_t v4 = v0[1];
  v1[8] = v2;
  v1[9] = v3;
  v1[10] = v4;
  v1[2] = v3;
  v1[3] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v1[11] = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_24CA99F78;
  uint64_t v6 = v1[3];
  v5[16] = v1[2];
  v5[17] = v6;
  return MEMORY[0x270FA2498](sub_24CA99968, 0, 0);
}

uint64_t sub_24CA99F78(uint64_t a1)
{
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24CA9A078, 0, 0);
}

uint64_t sub_24CA9A078()
{
  if (v0[12])
  {
    unint64_t v1 = v0[12];
    if (qword_26980A170 != -1)
    {
      swift_once();
      unint64_t v1 = v0[12];
    }
    uint64_t v2 = v0[8];
    uint64_t v3 = __swift_project_value_buffer(v0[7], (uint64_t)qword_26980A720);
    sub_24CA971A0(v3, v2);
    sub_24CA9BDB0();
    swift_bridgeObjectRelease();
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_24CA9BE10();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = *(void *)((v0[12] & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v5 = v0[8];
    v0[6] = v4;
    sub_24CA9BE30();
    sub_24CA9BCD0();
    swift_bridgeObjectRelease();
    sub_24CA9BCD0();
    sub_24CA98AF0(0x20646E756F46, 0xE600000000000000, 0xD00000000000006ELL, 0x800000024CA9CDB0, 0x2928747365676E69, 0xE800000000000000);
    swift_bridgeObjectRelease();
    sub_24CA972B4(v5);
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_24CA9BE10();
      swift_bridgeObjectRelease();
      v0[13] = v9;
      if (v9) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v6 = *(void *)((v0[12] & 0xFFFFFFFFFFFFFF8) + 0x10);
      v0[13] = v6;
      if (v6)
      {
LABEL_8:
        uint64_t v7 = v0[12];
        if ((v7 & 0xC000000000000001) != 0) {
          id v8 = (id)MEMORY[0x253306F90](0);
        }
        else {
          id v8 = *(id *)(v7 + 32);
        }
        uint64_t v12 = (uint64_t)v8;
        v0[14] = v8;
        v0[15] = 1;
        uint64_t v13 = v0[10];
        v0[4] = v0[9];
        v0[5] = v13;
        uint64_t v14 = (void *)swift_task_alloc();
        v0[16] = v14;
        *uint64_t v14 = v0;
        v14[1] = sub_24CA9A3E0;
        return sub_24CA9A698(v12);
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_26980A170 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v0[7], (uint64_t)qword_26980A720);
    sub_24CA98AF0(0xD000000000000029, 0x800000024CA9CD80, 0xD00000000000006ELL, 0x800000024CA9CDB0, 0x2928747365676E69, 0xE800000000000000);
  }
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_24CA9A3E0()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24CA9A628;
  }
  else
  {
    uint64_t v2 = sub_24CA9A4FC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

id sub_24CA9A4FC()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 104);

  if (v1 == v2)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v3();
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 120);
    uint64_t v6 = *(void *)(v0 + 96);
    if ((v6 & 0xC000000000000001) != 0) {
      id result = (id)MEMORY[0x253306F90](*(void *)(v0 + 120));
    }
    else {
      id result = *(id *)(v6 + 8 * v5 + 32);
    }
    uint64_t v7 = (uint64_t)result;
    *(void *)(v0 + 112) = result;
    *(void *)(v0 + 120) = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
    }
    else
    {
      uint64_t v8 = *(void *)(v0 + 80);
      *(void *)(v0 + 32) = *(void *)(v0 + 72);
      *(void *)(v0 + 40) = v8;
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 128) = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_24CA9A3E0;
      return (id)sub_24CA9A698(v7);
    }
  }
  return result;
}

uint64_t sub_24CA9A628()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CA9A698(uint64_t a1)
{
  v1[3] = a1;
  v1[4] = type metadata accessor for InternalLogger();
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24CA9A758, 0, 0);
}

uint64_t sub_24CA9A758()
{
  if (qword_26980A170 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = (void *)v0[3];
  uint64_t v3 = __swift_project_value_buffer(v0[4], (uint64_t)qword_26980A720);
  sub_24CA971A0(v3, v1);
  sub_24CA9BDB0();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, sel_description);
  sub_24CA9BCB0();

  sub_24CA9BCD0();
  swift_bridgeObjectRelease();
  sub_24CA98D64(0xD000000000000012, 0x800000024CA9CE40, 0xD00000000000006ELL, 0x800000024CA9CDB0, 0xD000000000000011, 0x800000024CA9CE60);
  swift_bridgeObjectRelease();
  sub_24CA972B4(v1);
  v0[2] = 0;
  id v5 = objc_msgSend(v2, sel_makeXPCConnectionWithError_, v0 + 2);
  v0[6] = v5;
  uint64_t v6 = (void *)v0[2];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v0[3];
    uint64_t v9 = self;
    id v10 = v6;
    id v11 = objc_msgSend(v9, sel_interfaceWithProtocol_, &unk_26FF192D8);
    objc_msgSend(v7, sel_setRemoteObjectInterface_, v11);

    objc_msgSend(v7, sel_resume);
    uint64_t v12 = swift_task_alloc();
    v0[7] = v12;
    *(void *)(v12 + 16) = v7;
    *(void *)(v12 + 24) = v8;
    uint64_t v13 = (void *)swift_task_alloc();
    v0[8] = v13;
    void *v13 = v0;
    v13[1] = sub_24CA9AAB0;
    uint64_t v14 = MEMORY[0x263F8D4F8];
    return MEMORY[0x270FA2360](v0 + 10, 0, 0, 0xD000000000000011, 0x800000024CA9CE60, sub_24CA9B6B0, v12, v14);
  }
  else
  {
    id v15 = v6;
    sub_24CA9BBF0();

    swift_willThrow();
    swift_task_dealloc();
    uint64_t v16 = (uint64_t (*)(void))v0[1];
    return v16();
  }
}

uint64_t sub_24CA9AAB0()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24CA9AC98;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_24CA9AC00;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24CA9AC00()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24CA9AC98()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

unint64_t sub_24CA9AD3C()
{
  unint64_t result = qword_26980A368;
  if (!qword_26980A368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980A368);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for ExtensionPoint(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ExtensionPoint()
{
  return swift_bridgeObjectRelease();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ExtensionPoint(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ExtensionPoint()
{
  return &type metadata for ExtensionPoint;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IngestionExtensionError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for IngestionExtensionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24CA9AF90);
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

uint64_t sub_24CA9AFB8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24CA9AFC0(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IngestionExtensionError()
{
  return &type metadata for IngestionExtensionError;
}

void *_s14DendriteIngest14ExtensionPointVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14DendriteIngest14ExtensionPointVwet_0(uint64_t a1, int a2)
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

uint64_t sub_24CA9B068(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IngestionExtensionHost()
{
  return &type metadata for IngestionExtensionHost;
}

uint64_t sub_24CA9B0B4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388]();
  uint64_t v37 = (uint64_t)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A370);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388]();
  id v10 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v39 = a1;
  uint64_t v35 = v10;
  v10((char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v34 = v11 | 7;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a3;
  uint64_t v13 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  uint64_t v38 = v7;
  uint64_t v33 = v13;
  v13(v12 + ((v11 + 24) & ~v11), (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v45 = sub_24CA9B994;
  uint64_t v46 = v12;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v42 = 1107296256;
  v43 = sub_24CA998DC;
  v44 = &block_descriptor_0;
  uint64_t v14 = _Block_copy(&aBlock);
  id v15 = a3;
  swift_release();
  id v16 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v14);
  _Block_release(v14);
  sub_24CA9BDA0();
  swift_unknownObjectRelease();
  sub_24CA997D8((uint64_t)v47, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A378);
  if (swift_dynamicCast())
  {
    uint64_t v31 = ~v11;
    id v32 = v40;
    if (qword_26980A170 != -1) {
      swift_once();
    }
    uint64_t v17 = __swift_project_value_buffer(v36, (uint64_t)qword_26980A720);
    uint64_t v18 = v37;
    sub_24CA971A0(v17, v37);
    uint64_t aBlock = 0;
    unint64_t v42 = 0xE000000000000000;
    sub_24CA9BDB0();
    swift_bridgeObjectRelease();
    uint64_t aBlock = 0xD000000000000021;
    unint64_t v42 = 0x800000024CA9CEC0;
    id v19 = objc_msgSend(v15, sel_description);
    sub_24CA9BCB0();

    sub_24CA9BCD0();
    swift_bridgeObjectRelease();
    sub_24CA98AF0(aBlock, v42, 0xD00000000000006ELL, 0x800000024CA9CDB0, 0xD000000000000011, 0x800000024CA9CE60);
    swift_bridgeObjectRelease();
    sub_24CA972B4(v18);
    uint64_t v20 = v38;
    v35((char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v39, v38);
    uint64_t v21 = (v11 + 16) & v31;
    uint64_t v22 = swift_allocObject();
    v33(v22 + v21, (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
    v45 = sub_24CA9BB0C;
    uint64_t v46 = v22;
    uint64_t aBlock = MEMORY[0x263EF8330];
    unint64_t v42 = 1107296256;
    v43 = sub_24CA956E4;
    v44 = &block_descriptor_16;
    uint64_t v23 = _Block_copy(&aBlock);
    swift_release();
    objc_msgSend(v32, sel_ingestWithReply_, v23);
    _Block_release(v23);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_26980A170 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v36, (uint64_t)qword_26980A720);
    uint64_t v25 = v37;
    sub_24CA971A0(v24, v37);
    uint64_t aBlock = 0;
    unint64_t v42 = 0xE000000000000000;
    sub_24CA9BDB0();
    sub_24CA9BCD0();
    id v26 = objc_msgSend(v15, sel_description);
    sub_24CA9BCB0();

    sub_24CA9BCD0();
    swift_bridgeObjectRelease();
    sub_24CA98B08(aBlock, v42, 0xD00000000000006ELL, 0x800000024CA9CDB0, 0xD000000000000011, 0x800000024CA9CE60);
    swift_bridgeObjectRelease();
    sub_24CA972B4(v25);
    sub_24CA9BA24();
    uint64_t v27 = swift_allocError();
    unsigned char *v28 = 1;
    uint64_t aBlock = v27;
    sub_24CA9BD30();
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
}

uint64_t sub_24CA9B6B0(uint64_t a1)
{
  return sub_24CA9B0B4(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_24CA9B6B8(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26980A170 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v4, (uint64_t)qword_26980A720);
  sub_24CA971A0(v7, (uint64_t)v6);
  uint64_t v11 = 0;
  unint64_t v12 = 0xE000000000000000;
  sub_24CA9BDB0();
  sub_24CA9BCD0();
  id v8 = objc_msgSend(a2, sel_description);
  sub_24CA9BCB0();

  sub_24CA9BCD0();
  swift_bridgeObjectRelease();
  sub_24CA9BCD0();
  v10[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A1D8);
  sub_24CA9BDF0();
  sub_24CA98B08(v11, v12, 0xD00000000000006ELL, 0x800000024CA9CDB0, 0xD000000000000011, 0x800000024CA9CE60);
  swift_bridgeObjectRelease();
  sub_24CA972B4((uint64_t)v6);
  uint64_t v11 = a1;
  MEMORY[0x2533073B0](a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A370);
  return sub_24CA9BD30();
}

uint64_t sub_24CA9B8C4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A370);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24CA9B994(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26980A370);
  uint64_t v3 = *(void **)(v1 + 16);
  return sub_24CA9B6B8(a1, v3);
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

unint64_t sub_24CA9BA24()
{
  unint64_t result = qword_26980A380;
  if (!qword_26980A380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26980A380);
  }
  return result;
}

uint64_t sub_24CA9BA78()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26980A370);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24CA9BB0C()
{
  return sub_24CA9BD40();
}

uint64_t sub_24CA9BB90(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24CA9BBE0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_24CA9BBF0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24CA9BC00()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_24CA9BC10()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_24CA9BC20()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24CA9BC30()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_24CA9BC40()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24CA9BC50()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24CA9BC60()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24CA9BC70()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_24CA9BC80()
{
  return MEMORY[0x270F259B0]();
}

uint64_t sub_24CA9BC90()
{
  return MEMORY[0x270F259B8]();
}

uint64_t sub_24CA9BCA0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24CA9BCB0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24CA9BCC0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24CA9BCD0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24CA9BCE0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24CA9BCF0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24CA9BD00()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24CA9BD10()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24CA9BD20()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24CA9BD30()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24CA9BD40()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24CA9BD50()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24CA9BD60()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24CA9BD70()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24CA9BD80()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24CA9BD90()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24CA9BDA0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24CA9BDB0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24CA9BDC0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24CA9BDD0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24CA9BDE0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24CA9BDF0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24CA9BE00()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24CA9BE10()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24CA9BE20()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24CA9BE30()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24CA9BE50()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24CA9BE60()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24CA9BE70()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24CA9BE80()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24CA9BE90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24CA9BEA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24CA9BEB0()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
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