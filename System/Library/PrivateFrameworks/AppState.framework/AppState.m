ValueMetadata *type metadata accessor for App.Kind()
{
  return &type metadata for App.Kind;
}

void App.kind.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 8);
}

BOOL sub_2307C5BF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AdamID.int64Value.getter()
{
  return *(void *)v0;
}

uint64_t sub_2307C5C10(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2) {
    return (*(unsigned __int8 *)(a2 + 8) ^ *(unsigned __int8 *)(a1 + 8) ^ 1) & 1;
  }
  else {
    return 0;
  }
}

unsigned char *sub_2307C5C40(unsigned char *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *App.init(id:kind:)@<X0>(void *result@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v3 = *a2;
  *(void *)a3 = *result;
  *(unsigned char *)(a3 + 8) = v3;
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AdamID()
{
  return &type metadata for AdamID;
}

ValueMetadata *type metadata accessor for App()
{
  return &type metadata for App;
}

uint64_t sub_2307C5C94(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v4 + 200) = a2;
  *(void *)(v4 + 208) = v3;
  *(void *)(v4 + 192) = a1;
  *(double *)(v4 + 184) = a3;
  *(void *)(v4 + 216) = *v3;
  sub_230812178();
  *(void *)(v4 + 224) = swift_task_alloc();
  *(void *)(v4 + 232) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307C7FF4, 0, 0);
}

uint64_t sub_2307C5D64()
{
  uint64_t v1 = sub_230812018();
  if (v2 > 0.0)
  {
    double v3 = v2 * 1000000000.0;
    if ((~*(void *)&v3 & 0x7FF0000000000000) != 0)
    {
      if (v3 > -1.0)
      {
        if (v3 < 1.84467441e19)
        {
          unint64_t v4 = (unint64_t)v3;
          v5 = (void *)swift_task_alloc();
          *(void *)(v0 + 24) = v5;
          void *v5 = v0;
          v5[1] = sub_2307D8B84;
          uint64_t v1 = v4;
          return MEMORY[0x270FA1FF0](v1);
        }
LABEL_13:
        __break(1u);
        return MEMORY[0x270FA1FF0](v1);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_13;
  }
  sub_2308125A8();
  sub_23080F00C();
  swift_allocError();
  swift_willThrow();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_2307C5EC8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307C5F30()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for StorefrontAppStateController.DataSourceLoadObserver()
{
  return self;
}

uint64_t sub_2307C6068()
{
  uint64_t v0 = sub_230812398();
  __swift_allocate_value_buffer(v0, qword_26AF25970);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AF25970);
  return sub_230812388();
}

uint64_t sub_2307C60CC()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0)
  {
    double v2 = sub_230805240;
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    double v2 = sub_2307C5EC8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307C61F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[23] = a6;
  v7[24] = a7;
  v7[21] = a4;
  v7[22] = a5;
  v7[19] = a2;
  v7[20] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  v7[25] = swift_task_alloc();
  v7[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307C8EA0, 0, 0);
}

unint64_t sub_2307C629C(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = a2;
  sub_2307C630C(a2);
  sub_2307C630C(a2);
  sub_2307C631C(v4);
  if (*(void *)(a1 + 24) == 1) {
    sub_2308120F8();
  }
  return sub_2307C631C(a2);
}

unint64_t sub_2307C630C(unint64_t result)
{
  if (result >= 2) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_2307C631C(unint64_t result)
{
  if (result >= 2) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2307C632C()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  long long v3 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = v1;
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *unint64_t v4 = v0;
  v4[1] = sub_2307C5F30;
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v6 = MEMORY[0x263F8EE60] + 8;
  uint64_t v7 = MEMORY[0x263F8EE60] + 8;
  uint64_t v8 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2158](v5, v6, v7, 0, 0, &unk_2687031E0, v2, v8);
}

uint64_t initializeWithCopy for StorefrontAppStateController.Configuration(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v5;
  uint64_t v6 = v5;
  uint64_t v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 48, a2 + 48, v6);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  long long v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 96, a2 + 96);
  return a1;
}

uint64_t sub_2307C6558(uint64_t a1)
{
  long long v4 = *(int **)(v1 + 32);
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307CBA50;
  long long v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_2307CBA50;
  return v8(a1);
}

unint64_t sub_2307C667C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
    if (v3 == 1) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = *(void *)(a1 + 24);
    }
  }
  else
  {
    uint64_t v4 = sub_2307C6AD8();
    unint64_t v6 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = v4;
    swift_retain_n();
    sub_2307C631C(v6);
    if (*(void *)(a1 + 24) == 1) {
      sub_2308120F8();
    }
    swift_release();
  }
  *a2 = v4;
  return sub_2307C630C(v3);
}

uint64_t sub_2307C6714()
{
  uint64_t v2 = *(void *)(sub_230812048() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_2307CBA50;
  v4[2] = v3;
  return MEMORY[0x270FA2498](sub_2307C5D64, 0, 0);
}

uint64_t DefaultAppStateDataSource.init()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B68);
  swift_allocObject();
  *(void *)(v0 + 16) = sub_2308123F8();
  return v0;
}

uint64_t sub_2307C683C()
{
  uint64_t result = sub_230812048();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2307C68E4()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_2307CBA50;
  return DeviceAppStateDataSource.load()();
}

uint64_t StorefrontAppStateController.Configuration.withDataSources(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2307D97DC(v2, a2);
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a2 + 40) = a1;
  return result;
}

uint64_t sub_2307C69C4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 224) = a1;
  *(void *)(v3 + 232) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_2307F5FD0;
  }
  else {
    uint64_t v4 = sub_2307CBCBC;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_2307C6AD8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_230812588();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_2307CDF28((uint64_t)v4, &qword_26AF24BC0);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_230812578();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_230812538();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_268703210;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  return swift_task_create();
}

uint64_t sub_2307C6D18()
{
  char v1 = *(unsigned char *)(v0 + 146);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v3 = *(void **)(v0 + 184);
  uint64_t v4 = v3[12];
  uint64_t v5 = v3[13];
  __swift_project_boxed_opaque_existential_1(v3 + 9, v4);
  *(void *)(v0 + 136) = v2;
  *(unsigned char *)(v0 + 144) = v1;
  int v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 + 16) + **(int **)(v5 + 16));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2307C69C4;
  return v8(v0 + 136, v4, v5);
}

uint64_t StorefrontAppStateController.Configuration.init(updateRegistry:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_2307CDEC4(a1, (uint64_t)a2);
  a2[5] = MEMORY[0x263F8EE78];
  if (qword_26AF244A0 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_26AF25988;
  uint64_t v5 = type metadata accessor for DefaultAppStateRules();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  a2[9] = v5;
  a2[10] = &off_26E478A58;
  a2[6] = v6;
  a2[11] = 0x403E000000000000;
  uint64_t v7 = qword_26AF24B38;
  swift_bridgeObjectRetain();
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_2308123B8();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)qword_26AF25998);
  uint64_t v13 = v8;
  uint64_t v14 = MEMORY[0x263F50E40];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_0, v9, v8);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return sub_2307CDF84(&v12, (uint64_t)(a2 + 12));
}

uint64_t DeviceAppStateDataSource.load()()
{
  v1[4] = v0;
  uint64_t v2 = sub_230812198();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307C81C0, 0, 0);
}

void *WaitingAppStateDataSource.init()()
{
  v0[3] = &unk_26E4779D0;
  v0[2] = sub_2307CA1CC(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B68);
  swift_allocObject();
  v0[5] = sub_2308123F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CE0);
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 16) = 0;
  v0[4] = v1;
  return v0;
}

uint64_t sub_2307C70E8()
{
  if (*(unsigned char *)(v0 + 112))
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = *(void *)(v0 + 88);
    uint64_t v2 = *(void *)(v0 + 56);
    uint64_t v3 = *(void *)(v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CA0);
    sub_2308125E8();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_2307C71D0()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2307EE58C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2307CBC44;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t DeviceUpdateRegistry.__allocating_init()()
{
  if (qword_26AF24B50 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2308123B8();
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_26AF259E0);
  uint64_t v8 = v0;
  uint64_t v9 = MEMORY[0x263F50E40];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16))(boxed_opaque_existential_0, v1, v0);
  uint64_t v3 = swift_allocObject();
  unint64_t v4 = sub_2307D8208(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C20);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = v4;
  *(void *)(v3 + 16) = v5;
  sub_2307CDF84(&v7, v3 + 24);
  return v3;
}

uint64_t sub_2307C7400()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230814440;
  *(unsigned char *)(inited + 32) = 0;
  *(void *)(inited + 64) = &type metadata for StoreAppRuleset;
  *(void *)(inited + 72) = &off_26E478AB8;
  *(unsigned char *)(inited + 80) = 1;
  *(void *)(inited + 112) = &type metadata for BetaAppRuleset;
  *(void *)(inited + 120) = &off_26E478AA8;
  unint64_t v1 = sub_2307CCB1C(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24620);
  uint64_t result = swift_arrayDestroy();
  qword_26AF25988 = v1;
  return result;
}

uint64_t sub_2307C74BC(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 32) = a4;
  *(void *)(v5 + 40) = a5;
  *(double *)(v5 + 24) = a1;
  *(void *)(v5 + 16) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  *(void *)(v5 + 48) = swift_task_alloc();
  uint64_t v6 = sub_230812048();
  *(void *)(v5 + 56) = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  *(void *)(v5 + 64) = v7;
  *(void *)(v5 + 72) = *(void *)(v7 + 64);
  *(void *)(v5 + 80) = swift_task_alloc();
  *(void *)(v5 + 88) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307CC590, 0, 0);
}

uint64_t sub_2307C75CC(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  *(void *)(v5 + 176) = a3;
  *(void *)(v5 + 184) = v4;
  *(unsigned char *)(v5 + 145) = a4;
  *(void *)(v5 + 168) = a2;
  *(void *)(v5 + 192) = *v4;
  sub_230812178();
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = *a1;
  *(void *)(v5 + 200) = v7;
  *(void *)(v5 + 208) = v8;
  *(unsigned char *)(v5 + 146) = *((unsigned char *)a1 + 8);
  return MEMORY[0x270FA2498](sub_2307C6D18, 0, 0);
}

uint64_t sub_2307C769C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = (uint64_t)(v1 + 6);
  uint64_t v9 = (uint64_t)(v1 + 11);
  uint64_t v10 = (void *)v1[16];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_2307CBA50;
  return sub_2307C890C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2307C777C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2307C7EFC;
  return v6(a1);
}

uint64_t sub_2307C7858()
{
  char v1 = *(unsigned char *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  *(void *)(v4 + 16) = v2;
  *(unsigned char *)(v4 + 24) = v1;
  *(void *)(v4 + 32) = v3;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BA0);
  void *v5 = v0;
  v5[1] = sub_2307C71D0;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0x6575516863746566, 0xEE00293A5F287972, sub_2307CBC30, v4, v6);
}

uint64_t sub_2307C7978()
{
  uint64_t v2 = *(void *)(*v1 + 56);
  uint64_t v3 = *(void *)(*v1 + 48);
  uint64_t v4 = *(void *)(*v1 + 40);
  uint64_t v5 = *v1;
  *(void *)(v5 + 72) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_2307CB9CC(*(void **)(v5 + 16), *(unsigned char *)(v5 + 24));
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2307F5F6C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_2307C7B30(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307CBA50;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2687031F0 + dword_2687031F0);
  return v6(a1, v4);
}

uint64_t sub_2307C7BE8()
{
  v16 = v0;
  uint64_t v1 = v0[2];
  uint64_t v2 = *(void *)(*(void *)(v1 + 16) + 16);
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 192);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = v4;
  if (v2)
  {
    *(void *)(v4 + 16) = sub_2307D9770;
    *(void *)(v4 + 24) = v1;
    os_unfair_lock_lock(v3 + 4);
    sub_2307D9858(&v15);
    os_unfair_lock_unlock(v3 + 4);
    uint64_t v8 = v15;
    v0[3] = v15;
    swift_task_dealloc();
    if (v8)
    {
      swift_retain();
      uint64_t v9 = (void *)swift_task_alloc();
      v0[4] = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_2307D9674;
      uint64_t v10 = MEMORY[0x263F8EE60] + 8;
      uint64_t v11 = MEMORY[0x263F8E628];
      uint64_t v12 = MEMORY[0x263F8E658];
      return MEMORY[0x270FA1FB8](v0 + 5, v8, v10, v11, v12);
    }
  }
  else
  {
    *(void *)(v4 + 16) = v1;
    *(void *)(v4 + 24) = 1;
    uint64_t v6 = swift_task_alloc();
    *(void *)(v6 + 16) = sub_2307D983C;
    *(void *)(v6 + 24) = v5;
    os_unfair_lock_lock(v3 + 4);
    sub_2307CEDF4(v7);
    os_unfair_lock_unlock(v3 + 4);
    swift_task_dealloc();
    swift_task_dealloc();
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_2307C7E08()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2307C7EFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2307C7FF4()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v1 + 16);
  if (*(void *)(v2 + 16))
  {
    uint64_t v4 = *(void *)(v0 + 192);
    uint64_t v3 = *(void *)(v0 + 200);
    uint64_t v5 = *(void *)(v0 + 184);
    sub_2307CDEC4(v1 + 152, v0 + 16);
    uint64_t v6 = (void *)swift_allocObject();
    *(void *)(v0 + 240) = v6;
    v6[2] = v2;
    v6[3] = v4;
    v6[4] = v3;
    sub_2307CDF84((long long *)(v0 + 16), (uint64_t)(v6 + 5));
    v6[10] = v1;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 248) = v7;
    v7[2] = v5;
    v7[3] = &unk_268703198;
    v7[4] = v6;
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 256) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_2307C60CC;
    return MEMORY[0x270FA22B8]();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_2307C81C0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v1 + 56);
  char v3 = *(unsigned char *)(v1 + 64);
  *(void *)(v0 + 16) = v2;
  *(unsigned char *)(v0 + 24) = v3;
  sub_2307CAC54(v2, v3);
  sub_230812118();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2307C7978;
  uint64_t v5 = *(void *)(v0 + 56);
  return sub_2307C75CC((uint64_t *)(v0 + 16), v5, 0, 1);
}

uint64_t destroy for StorefrontAppStateController.Configuration(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 96);
}

uint64_t sub_2307C82F0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v4[31] = a4;
  v4[32] = *a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24090);
  v4[33] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B30);
  v4[34] = v5;
  v4[35] = *(void *)(v5 - 8);
  v4[36] = swift_task_alloc();
  v4[37] = swift_task_alloc();
  v4[38] = swift_task_alloc();
  v4[39] = swift_task_alloc();
  v4[40] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24900);
  v4[41] = swift_task_alloc();
  sub_230812178();
  v4[42] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307C91DC, 0, 0);
}

uint64_t sub_2307C8494()
{
  return DeviceAppStateDataSource.description.getter();
}

uint64_t DeviceAppStateDataSource.description.getter()
{
  return 0;
}

uint64_t sub_2307C8598()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 24) + **(int **)(v3 + 24));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2307C7E08;
  return v6(v2, v3);
}

uint64_t destroy for AppOffer()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2307C86D4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_23080A170, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2307C8818()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2307C890C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  v8[19] = a7;
  v8[20] = a8;
  v8[18] = a6;
  v8[21] = *a8;
  sub_230812178();
  v8[22] = swift_task_alloc();
  v8[23] = swift_task_alloc();
  uint64_t v13 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v11 = (void *)swift_task_alloc();
  v8[24] = v11;
  *uint64_t v11 = v8;
  v11[1] = sub_2307C86D4;
  return v13(a6);
}

uint64_t sub_2307C8A5C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = sub_230812098();
  uint64_t v18 = *(void *)(v5 - 8);
  uint64_t v19 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_230812178();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v27 = a1;
  uint64_t v9 = v1[22];
  v17[1] = v1[23];
  __swift_project_boxed_opaque_existential_1(v1 + 19, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  uint64_t v26 = v4;
  v25[0] = v1;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)v25, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v26 = MEMORY[0x263F8D6C8];
  v25[0] = v10;
  sub_230812128();
  sub_2307CDF28((uint64_t)v25, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122C8();
  swift_bridgeObjectRelease();
  sub_2307CB7A0(0, (unint64_t *)&unk_26AF24C00);
  sub_2308126B8();
  sub_230812088();
  sub_230812678();
  uint64_t v11 = (void *)sub_2308126B8();
  sub_230812078();

  uint64_t v12 = (os_unfair_lock_s *)v2[24];
  v23 = v2;
  v24 = &v27;
  v20 = sub_2307D95B4;
  v21 = &v22;
  uint64_t v13 = v12 + 4;
  os_unfair_lock_lock(v12 + 4);
  sub_2307CEDB4(v14);
  os_unfair_lock_unlock(v13);
  sub_230812668();
  uint64_t v15 = (void *)sub_2308126B8();
  sub_230812078();

  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v7, v19);
}

void StorefrontAppStateController.state(forApp:initialState:applying:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDF4(v2);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_2307C8EA0()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    v23 = (long long *)(v0 + 56);
    v24 = (long long *)(v0 + 16);
    uint64_t v3 = v1 + 32;
    uint64_t v25 = sub_230812588();
    uint64_t v4 = *(void *)(v25 - 8);
    char v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v21 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
    v20 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v26 = v2;
      uint64_t v6 = *(void *)(v0 + 208);
      uint64_t v7 = *(void *)(v0 + 184);
      uint64_t v27 = *(void *)(v0 + 192);
      uint64_t v28 = *(void *)(v0 + 200);
      uint64_t v8 = *(void *)(v0 + 168);
      uint64_t v9 = *(void *)(v0 + 176);
      v22(v6, 1, 1, v25);
      sub_2307CDEC4(v3, (uint64_t)v24);
      sub_2307CDEC4(v7, (uint64_t)v23);
      uint64_t v10 = (void *)swift_allocObject();
      v10[2] = 0;
      v10[3] = 0;
      v10[4] = v8;
      v10[5] = v9;
      sub_2307CDF84(v24, (uint64_t)(v10 + 6));
      sub_2307CDF84(v23, (uint64_t)(v10 + 11));
      v10[16] = v27;
      sub_2307D5154(v6, v28, &qword_26AF24BC0);
      LODWORD(v6) = (*v21)(v28, 1, v25);
      swift_retain();
      swift_retain();
      uint64_t v11 = *(void *)(v0 + 200);
      if (v6 == 1)
      {
        sub_2307CDF28(*(void *)(v0 + 200), &qword_26AF24BC0);
      }
      else
      {
        sub_230812578();
        (*v20)(v11, v25);
      }
      if (v10[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v12 = sub_230812538();
        uint64_t v14 = v13;
        swift_unknownObjectRelease();
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v14 = 0;
      }
      uint64_t v15 = **(void **)(v0 + 152);
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = &unk_2687031F8;
      *(void *)(v16 + 24) = v10;
      uint64_t v17 = v14 | v12;
      if (v14 | v12)
      {
        uint64_t v17 = v0 + 96;
        *(void *)(v0 + 96) = 0;
        *(void *)(v0 + 104) = 0;
        *(void *)(v0 + 112) = v12;
        *(void *)(v0 + 120) = v14;
      }
      uint64_t v5 = *(void *)(v0 + 208);
      *(void *)(v0 + 128) = 1;
      *(void *)(v0 + 136) = v17;
      *(void *)(v0 + 144) = v15;
      swift_task_create();
      swift_release();
      sub_2307CDF28(v5, &qword_26AF24BC0);
      v3 += 40;
      --v2;
    }
    while (v26 != 1);
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_2307C91DC()
{
  uint64_t v1 = *(void **)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 256);
  __swift_project_boxed_opaque_existential_1(v1 + 19, v1[22]);
  *(void *)(v0 + 344) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  uint64_t v3 = *(void *)(sub_230812198() - 8);
  *(void *)(v0 + 352) = *(void *)(v3 + 72);
  *(_DWORD *)(v0 + 392) = *(_DWORD *)(v3 + 80);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812168();
  sub_230812158();
  *(void *)(v0 + 208) = v1;
  *(void *)(v0 + 232) = v2;
  swift_retain();
  sub_230812128();
  sub_2307CDF28(v0 + 208, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812118();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  type metadata accessor for StorefrontAppStateController.DataSourceLoadObserver();
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 360) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C28);
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = MEMORY[0x263F8EE88];
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = v6;
  *(void *)(v4 + 16) = v5;
  uint64_t v7 = v1[2];
  *(void *)(v0 + 368) = v7;
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t v9 = (void *)(v0 + 56);
    uint64_t v10 = *(void *)(v0 + 280);
    uint64_t v11 = v7 + 32;
    swift_bridgeObjectRetain();
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
    do
    {
      sub_2307CDEC4(v11, (uint64_t)v9);
      uint64_t v14 = *(void *)(v0 + 80);
      uint64_t v13 = *(void *)(v0 + 88);
      __swift_project_boxed_opaque_existential_1(v9, v14);
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v14, v13);
      *(void *)(v0 + 240) = v4;
      sub_2307C95F4(&qword_26AF24168, (void (*)(uint64_t))type metadata accessor for StorefrontAppStateController.DataSourceLoadObserver);
      sub_2308123C8();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v12 = (void *)sub_2307C963C(0, v12[2] + 1, 1, v12);
      }
      unint64_t v16 = v12[2];
      unint64_t v15 = v12[3];
      if (v16 >= v15 >> 1) {
        uint64_t v12 = (void *)sub_2307C963C(v15 > 1, v16 + 1, 1, v12);
      }
      uint64_t v17 = *(void *)(v0 + 312);
      uint64_t v18 = *(void *)(v0 + 272);
      v12[2] = v16 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 32))((unint64_t)v12+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v16, v17, v18);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      v11 += 40;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
  }
  *(void *)(v0 + 376) = v12;
  double v19 = *(double *)(*(void *)(v0 + 248) + 144);
  v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 384) = v20;
  void *v20 = v0;
  v20[1] = sub_2307D921C;
  return sub_2307C5C94((uint64_t)&unk_268703220, 0, v19);
}

uint64_t sub_2307C95F4(unint64_t *a1, void (*a2)(uint64_t))
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

size_t sub_2307C963C(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C98);
  uint64_t v10 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B30) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B30) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_2307C9818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  char v5 = (void *)(a1 + v4);
  unint64_t v6 = (void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for State();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    void *v5 = *v6;
    uint64_t v10 = (int *)type metadata accessor for AppInstallation(0);
    uint64_t v11 = v10[5];
    unint64_t v12 = (void *)((char *)v5 + v11);
    uint64_t v13 = (void *)((char *)v6 + v11);
    uint64_t v14 = type metadata accessor for AppInstallation.Phase(0);
    swift_retain();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        uint64_t v15 = sub_230812048();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v12, v13, v15);
        uint64_t v16 = type metadata accessor for AppInstallation.Progress(0);
        *(void *)((char *)v12 + *(int *)(v16 + 20)) = *(void *)((char *)v13 + *(int *)(v16 + 20));
        uint64_t v17 = *(int *)(v16 + 24);
        uint64_t v18 = *(void **)((char *)v13 + v17);
        *(void *)((char *)v12 + v17) = v18;
        id v19 = v18;
        goto LABEL_11;
      case 3u:
        *unint64_t v12 = *v13;
        swift_retain();
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
        break;
    }
    uint64_t v20 = v10[6];
    v21 = (char *)v5 + v20;
    uint64_t v22 = (char *)v6 + v20;
    uint64_t v23 = sub_230812048();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = type metadata accessor for AppInstallation.Progress(0);
    *(void *)&v21[*(int *)(v24 + 20)] = *(void *)&v22[*(int *)(v24 + 20)];
    uint64_t v25 = *(int *)(v24 + 24);
    uint64_t v26 = *(void **)&v22[v25];
    *(void *)&v21[v25] = v26;
    *((unsigned char *)v5 + v10[7]) = *((unsigned char *)v6 + v10[7]);
    *(void *)((char *)v5 + v10[8]) = *(void *)((char *)v6 + v10[8]);
    *((unsigned char *)v5 + v10[9]) = *((unsigned char *)v6 + v10[9]);
    *(void *)((char *)v5 + v10[10]) = *(void *)((char *)v6 + v10[10]);
    id v27 = v26;
    goto LABEL_13;
  }
  if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
  {
    uint64_t v9 = v6[1];
    void *v5 = *v6;
    v5[1] = v9;
    swift_bridgeObjectRetain();
LABEL_13:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  return a1;
}

void AdamID.init(value:)(void *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v4 = (unint64_t)objc_msgSend(a1, sel_longLongValue);
  if ((v4 & 0x8000000000000000) != 0)
  {
    sub_230812758();
    swift_bridgeObjectRelease();
    sub_230812868();
    sub_230812478();
    swift_bridgeObjectRelease();
    sub_2307DAC7C();
    swift_allocError();
    void *v5 = 0xD00000000000001DLL;
    v5[1] = 0x8000000230815450;
    swift_willThrow();
  }
  else
  {

    *a2 = v4;
  }
}

uint64_t DeviceAppStateDataSource.__allocating_init(query:fetcher:updateRegistry:store:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v8 = sub_2308123B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v12 = *(void **)a1;
  char v13 = *(unsigned char *)(a1 + 8);
  char v14 = *a4;
  sub_2307CDEC4(a2, (uint64_t)v20);
  sub_2307D5154(a3, (uint64_t)v19, (uint64_t *)&unk_26AF24A60);
  if (qword_26AF24B40 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v8, (uint64_t)qword_26AF259B0);
  uint64_t v16 = swift_allocObject();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(v11, v15, v8);
  uint64_t v17 = sub_2307C9E54(v12, v13, v20, (uint64_t)v19, v14, (uint64_t)v11, v16);
  sub_2307CDF28(a3, (uint64_t *)&unk_26AF24A60);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v17;
}

uint64_t sub_2307C9E54(void *a1, char a2, void *a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = sub_2308123B8();
  v30[3] = v14;
  v30[4] = MEMORY[0x263F50E40];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(boxed_opaque_existential_0, a6, v14);
  *(void *)(a7 + 176) = 0;
  *(void *)(a7 + 184) = 0;
  *(void *)(a7 + 56) = a1;
  *(unsigned char *)(a7 + 64) = a2;
  sub_2307CDEC4((uint64_t)a3, a7 + 72);
  sub_2307D5154(a4, a7 + 112, (uint64_t *)&unk_26AF24A60);
  *(unsigned char *)(a7 + 152) = a5;
  uint64_t v16 = MEMORY[0x263F8EE78];
  *(void *)(a7 + 160) = sub_2307CA1CC(MEMORY[0x263F8EE78]);
  sub_2307CAC54(a1, a2);
  *(void *)(a7 + 168) = sub_2307CA0B8(v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B68);
  swift_allocObject();
  *(void *)(a7 + 200) = sub_2308123F8();
  sub_2307CDEC4((uint64_t)v30, a7 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CE0);
  uint64_t v17 = swift_allocObject();
  *(_DWORD *)(v17 + 16) = 0;
  *(void *)(a7 + 192) = v17;
  uint64_t v19 = a3[3];
  uint64_t v18 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v19);
  uint64_t v28 = a1;
  char v29 = a2;
  v27[3] = sub_230812238();
  v27[4] = MEMORY[0x263F50AD8];
  __swift_allocate_boxed_opaque_existential_0(v27);
  sub_230812228();
  uint64_t v20 = swift_allocObject();
  swift_weakInit();
  v21 = *(uint64_t (**)(void **, uint64_t *, uint64_t (*)(void *), uint64_t, uint64_t, uint64_t))(v18 + 8);
  swift_retain();
  uint64_t v22 = v21(&v28, v27, sub_2307F6FE8, v20, v19, v18);
  uint64_t v24 = v23;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  sub_2307CDF28(a4, (uint64_t *)&unk_26AF24A60);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  sub_2307CB9CC(a1, a2);
  *(void *)(a7 + 176) = v22;
  *(void *)(a7 + 184) = v24;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
  return a7;
}

unint64_t sub_2307CA0B8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF240D8);
  uint64_t v2 = (void *)sub_230812838();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2307D55B4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_2307CA1CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B08);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C58);
    uint64_t v7 = (void *)sub_230812838();
    uint64_t v8 = (uint64_t)v5 + *(int *)(v2 + 48);
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_2307D5154(v9, (uint64_t)v5, &qword_26AF24B08);
      uint64_t v11 = *v5;
      unint64_t result = sub_2307CF3B0(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v7[6] + 8 * result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = type metadata accessor for State();
      unint64_t result = sub_2307CE37C(v8, v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

id sub_2307CA37C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7 = *((unsigned char *)a1 + 8);
  uint64_t v12 = *a1;
  char v13 = v7;
  id v8 = sub_2307CA42C();
  sub_2307CDEC4(a2, (uint64_t)&v12);
  id v9 = objc_allocWithZone((Class)type metadata accessor for ASDDeviceAppFetcher.QueryObservation());
  swift_retain();
  id v10 = sub_2307CA63C(v8, (uint64_t)&v12, a3, a4);

  swift_release();
  return v10;
}

id sub_2307CA42C()
{
  uint64_t v1 = *(void **)v0;
  switch(*(unsigned char *)(v0 + 8))
  {
    case 1:
      id v8 = *(void **)v0;
      swift_bridgeObjectRetain();
      sub_230801EE8((uint64_t)v8);
      sub_2307CB9CC(v8, 1);
      uint64_t v2 = (void *)sub_230812508();
      swift_release();
      id v3 = objc_msgSend(self, sel_queryForBundleIDs_, v2);
      goto LABEL_5;
    case 2:
      sub_2307F593C((uint64_t)v1);
      sub_2307E9C98();
      uint64_t v2 = (void *)sub_230812508();
      swift_bridgeObjectRelease();
      id v3 = objc_msgSend(self, sel_queryForBetaAppsWithStoreItemIDs_, v2);
      goto LABEL_5;
    case 3:
      return v1;
    case 4:
      id v9 = *(void **)v0;
      uint64_t v6 = self;
      if (v9) {
        id v7 = objc_msgSend(v6, sel_queryForBetaApps);
      }
      else {
        id v7 = objc_msgSend(v6, sel_queryForStoreApps);
      }
      return v7;
    default:
      sub_2307F593C((uint64_t)v1);
      sub_2307E9C98();
      uint64_t v2 = (void *)sub_230812508();
      swift_bridgeObjectRelease();
      id v3 = objc_msgSend(self, sel_queryForStoreItemIDs_, v2);
LABEL_5:
      id v4 = v3;

      return v4;
  }
}

uint64_t type metadata accessor for ASDDeviceAppFetcher.QueryObservation()
{
  return self;
}

id sub_2307CA63C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_appQuery] = a1;
  sub_2307CDEC4(a2, (uint64_t)&v4[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_taskScheduler]);
  id v10 = &v4[OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_observer];
  *(void *)id v10 = a3;
  *((void *)v10 + 1) = a4;
  v18.receiver = v4;
  v18.super_class = ObjectType;
  id v11 = a1;
  swift_retain();
  id v12 = objc_msgSendSuper2(&v18, sel_init);
  uint64_t v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17[4] = sub_2307CADFC;
  v17[5] = v13;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  void v17[2] = sub_2307CAD58;
  v17[3] = &block_descriptor_16;
  unint64_t v14 = _Block_copy(v17);
  id v15 = v12;
  swift_release();
  objc_msgSend(v11, sel_executeQueryWithResultHandler_, v14);

  _Block_release(v14);
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v15;
}

uint64_t sub_2307CA7B0(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  v42 = a2;
  uint64_t v39 = a1;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BB8);
  uint64_t v37 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v38 = v6;
  v40 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_230812098();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v11 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v33 - v12;
  sub_2307CB7A0(0, (unint64_t *)&unk_26AF24C00);
  sub_2308126B8();
  sub_230812088();
  sub_230812678();
  unint64_t v14 = (void *)sub_2308126B8();
  char v15 = a3;
  sub_230812078();

  sub_2307CACF0(a4, (uint64_t)&aBlock);
  uint64_t v16 = v46;
  uint64_t v17 = v13;
  if (v46)
  {
    objc_super v18 = v47;
    __swift_project_boxed_opaque_existential_1(&aBlock, (uint64_t)v46);
    (*((void (**)(void *, uint64_t (*)(uint64_t, void *)))v18 + 3))(v16, v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  }
  else
  {
    sub_2307CAC90((uint64_t)&aBlock);
  }
  uint64_t v19 = v42;
  aBlock = v42;
  LOBYTE(v44) = v15;
  id v35 = sub_2307CA42C();
  v36 = v17;
  uint64_t v20 = v8;
  v21 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v34 = v7;
  v21(v11, v17, v7);
  uint64_t v22 = v37;
  uint64_t v23 = v40;
  uint64_t v24 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v40, v39, v41);
  unint64_t v25 = (*(unsigned __int8 *)(v20 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  unint64_t v26 = (v9 + *(unsigned __int8 *)(v22 + 80) + v25) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v19;
  *(unsigned char *)(v27 + 24) = v15;
  uint64_t v28 = v11;
  uint64_t v29 = v34;
  (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v27 + v25, v28, v34);
  (*(void (**)(unint64_t, char *, uint64_t))(v22 + 32))(v27 + v26, v23, v24);
  v47 = sub_2307CAEAC;
  uint64_t v48 = v27;
  aBlock = (void *)MEMORY[0x263EF8330];
  uint64_t v44 = 1107296256;
  v45 = sub_2307CAD58;
  v46 = &block_descriptor;
  v30 = _Block_copy(&aBlock);
  sub_2307CAC54(v19, v15);
  swift_release();
  id v31 = v35;
  objc_msgSend(v35, sel_executeQueryWithResultHandler_, v30);
  _Block_release(v30);

  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v36, v29);
}

uint64_t initializeBufferWithCopyOfBuffer for DeviceAppQuery(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2307CAC54(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id sub_2307CAC54(id result, char a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
      unint64_t result = (id)swift_bridgeObjectRetain();
      break;
    case 3:
      unint64_t result = result;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2307CAC90(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_26AF24A70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2307CACF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26AF24A70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2307CAD58(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2307CB7A0(0, (unint64_t *)&qword_26AF24BF0);
    uint64_t v4 = sub_230812518();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_2307CADFC(uint64_t a1, uint64_t a2)
{
  sub_2307CAE04(a1, a2, v2);
}

void sub_2307CAE04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x230FBFD80](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = objc_retain(*(id *)(v4
                           + OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_appQuery));

    swift_beginAccess();
    uint64_t v7 = (void *)MEMORY[0x230FBFD80](v3);
    objc_msgSend(v6, sel_setObserver_, v7);
  }
}

uint64_t sub_2307CAEAC(uint64_t a1, void *a2)
{
  sub_230812098();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BB8);
  return sub_2307CAF9C(a1, a2);
}

uint64_t sub_2307CAF9C(uint64_t a1, void *a2)
{
  sub_230812668();
  sub_2307CB7A0(0, (unint64_t *)&unk_26AF24C00);
  uint64_t v4 = (void *)sub_2308126B8();
  sub_230812078();

  if (a2)
  {
    id v5 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BB8);
    return sub_230812548();
  }
  else
  {
    if (a1) {
      swift_bridgeObjectRetain();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BB8);
    return sub_230812558();
  }
}

uint64_t sub_2307CB12C()
{
  uint64_t v44 = v0;
  uint64_t v37 = v0[31];
  uint64_t v1 = *(void *)(v0[46] + 16);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v36 = v1;
  if (v1)
  {
    unint64_t v3 = 0;
    v42 = (long long *)(v0 + 2);
    uint64_t v4 = v0[35];
    uint64_t v5 = result + 32;
    uint64_t v34 = v4;
    uint64_t v38 = (void (**)(void, uint64_t, uint64_t, void))(v4 + 56);
    uint64_t v39 = v0[47];
    uint64_t v33 = v0[40];
    v32 = (void (**)(uint64_t, uint64_t))(v4 + 8);
    id v6 = (void (**)(char *, uint64_t, uint64_t))(v4 + 32);
    while (v3 < *(void *)(v0[46] + 16))
    {
      uint64_t result = sub_2307CDEC4(v5, (uint64_t)v42);
      unint64_t v7 = *(void *)(v39 + 16);
      if (v3 == v7)
      {
        (*v38)(v0[33], 1, 1, v0[34]);
LABEL_10:
        uint64_t v21 = v0[33];
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
        sub_2307CDF28(v21, &qword_26AF24090);
        goto LABEL_11;
      }
      if (v3 >= v7) {
        goto LABEL_15;
      }
      uint64_t v8 = v0[33];
      uint64_t v9 = v0[34];
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v34 + 16))(v8, v0[47]+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(void *)(v34 + 72) * v3, v9);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v34 + 56))(v8, 0, 1, v9);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v8, 1, v9) == 1) {
        goto LABEL_10;
      }
      ++v3;
      uint64_t v10 = (long long *)v0[41];
      uint64_t v41 = v5;
      uint64_t v12 = (char *)v0[37];
      id v11 = (char *)v0[38];
      uint64_t v13 = v0[34];
      uint64_t v40 = v0[36];
      unint64_t v14 = *v6;
      (*v6)(v11, v0[33], v13);
      char v15 = (char *)v10 + *(int *)(v33 + 48);
      sub_2307CDF84(v42, (uint64_t)v10);
      v14(v15, (uint64_t)v11, v13);
      sub_2307CDF84(v10, (uint64_t)(v0 + 12));
      v14(v12, (uint64_t)v15, v13);
      uint64_t v16 = v0[15];
      uint64_t v17 = v0[16];
      __swift_project_boxed_opaque_existential_1(v0 + 12, v16);
      (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v16, v17);
      sub_2308123D8();
      objc_super v18 = *(void **)(v37 + 200);
      v0[20] = sub_2307CB7A0(0, (unint64_t *)&qword_26AF24BE8);
      v0[21] = MEMORY[0x263F50EC0];
      v0[17] = v18;
      id v19 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B68);
      sub_2307CB7DC(&qword_26AF24B60, &qword_26AF24B68);
      sub_2308121B8();
      swift_release();
      uint64_t v20 = *v32;
      (*v32)(v40, v13);
      v20((uint64_t)v12, v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));
      uint64_t v5 = v41 + 40;
      if (v36 == v3) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_15:
    __break(1u);
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v22 = v0[45];
    swift_bridgeObjectRelease();
    uint64_t v23 = *(void *)(v22 + 16);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v23 + 24));
    sub_2307D897C((void *)(v23 + 16), &v43);
    os_unfair_lock_unlock((os_unfair_lock_t)(v23 + 24));
    uint64_t v24 = v0[31];
    uint64_t v25 = v43;
    swift_release();
    sub_2307C8A5C(v25);
    swift_bridgeObjectRelease();
    unint64_t v26 = *(os_unfair_lock_s **)(v24 + 192);
    uint64_t v27 = swift_task_alloc();
    *(void *)(v27 + 16) = v24;
    *(void *)(v27 + 24) = 1;
    uint64_t v28 = swift_task_alloc();
    *(void *)(v28 + 16) = sub_2307D9824;
    *(void *)(v28 + 24) = v27;
    v26 += 4;
    os_unfair_lock_lock(v26);
    sub_2307CEDB4(v29);
    uint64_t v30 = v0[31];
    uint64_t v35 = v0[32];
    os_unfair_lock_unlock(v26);
    swift_task_dealloc();
    swift_task_dealloc();
    __swift_project_boxed_opaque_existential_1((void *)(v30 + 152), *(void *)(v30 + 176));
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
    sub_230812168();
    sub_230812158();
    v0[25] = v35;
    v0[22] = v30;
    swift_retain();
    sub_230812128();
    sub_2307CDF28((uint64_t)(v0 + 22), (uint64_t *)&unk_26AF24CA8);
    sub_230812158();
    sub_230812188();
    sub_230812118();
    sub_2308122B8();
    swift_release();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v31 = (uint64_t (*)(void))v0[1];
    return v31();
  }
  return result;
}

uint64_t sub_2307CB7A0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2307CB7DC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2307CB820()
{
  return swift_retain();
}

uint64_t sub_2307CB82C()
{
  return sub_230812998();
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

void sub_2307CB9CC(void *a1, char a2)
{
  switch(a2)
  {
    case 0:
    case 1:
    case 2:
      swift_bridgeObjectRelease();
      break;
    case 3:

      break;
    default:
      return;
  }
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

uint64_t StorefrontAppStateController.onStateChange.getter()
{
  return swift_retain();
}

void destroy for DeviceAppQuery(uint64_t a1)
{
}

uint64_t sub_2307CBA6C()
{
  return swift_storeEnumTagMultiPayload();
}

void static AppOffer.standard.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xE000000000000000;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0xE000000000000000;
}

ValueMetadata *type metadata accessor for AppOpenableDestination()
{
  return &type metadata for AppOpenableDestination;
}

ValueMetadata *type metadata accessor for AppInstallationType()
{
  return &type metadata for AppInstallationType;
}

ValueMetadata *type metadata accessor for AppPurchaseType()
{
  return &type metadata for AppPurchaseType;
}

ValueMetadata *type metadata accessor for AppOffer()
{
  return &type metadata for AppOffer;
}

void sub_2307CBAE4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_2307CBB40(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 3u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 4);
  }
}

uint64_t sub_2307CBB58(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2307C8598, 0, 0);
}

ValueMetadata *type metadata accessor for State.Key()
{
  return &type metadata for State.Key;
}

unsigned char *sub_2307CBB88(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t initializeWithCopy for ASDDeviceAppFetcher(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    uint64_t v4 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v3;
    *(void *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  return a1;
}

uint64_t sub_2307CBC04(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 24) = v1;
  *(void *)(v2 + 32) = v3;
  *(unsigned char *)(v2 + 64) = *((unsigned char *)a1 + 8);
  return MEMORY[0x270FA2498](sub_2307C7858, 0, 0);
}

uint64_t sub_2307CBC34(uint64_t a1)
{
  return sub_2307CA7B0(a1, *(void **)(v1 + 16), *(unsigned char *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_2307CBC44()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_2307CBC60()
{
  return sub_2307CBC98(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2307CBC98(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2307CBCA4(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(void *)uint64_t result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

uint64_t sub_2307CBCBC()
{
  uint64_t v14 = v0;
  uint64_t v1 = *(void *)(v0 + 224);
  uint64_t v2 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 176);
  id v6 = *(os_unfair_lock_s **)(v4 + 192);
  unint64_t v7 = (void *)swift_task_alloc();
  v7[2] = v1;
  v7[3] = v4;
  v7[4] = v5;
  v7[5] = v3;
  uint64_t v8 = swift_task_alloc();
  *(void *)(v8 + 16) = sub_2307CBE84;
  *(void *)(v8 + 24) = v7;
  os_unfair_lock_lock(v6 + 4);
  sub_2307CBE0C(&v13);
  os_unfair_lock_unlock(v6 + 4);
  if (v2)
  {
    return swift_task_dealloc();
  }
  else
  {
    char v10 = *(unsigned char *)(v0 + 145);
    uint64_t v11 = v13;
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    if (v10)
    {
      *(void *)(v0 + 160) = v11;
      sub_2308123E8();
    }
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
}

void *sub_2307CBE0C@<X0>(void *a1@<X8>)
{
  return sub_2307CBE40(*(void *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

void *sub_2307CBE28@<X0>(void *a1@<X8>)
{
  return sub_2307D9858(a1);
}

void *sub_2307CBE40@<X0>(void *(*a1)(uint64_t *__return_ptr)@<X1>, void *a2@<X8>)
{
  uint64_t result = a1(&v5);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

void sub_2307CBE84(void *a1@<X8>)
{
  sub_2307CBEA4(*(void (***)(uint64_t, uint64_t, uint64_t, unint64_t))(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

void sub_2307CBEA4(void (**a1)(uint64_t, uint64_t, uint64_t, unint64_t)@<X0>, void *a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v11 = (void *)MEMORY[0x230FBF6E0]();
  sub_2307D3F04(a1, a2, a3, a4, (unint64_t)&v12);
  if (v5) {
    __break(1u);
  }
  else {
    *a5 = v12;
  }
}

uint64_t sub_2307CBF3C()
{
  uint64_t result = type metadata accessor for AppInstallation.Phase(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for AppInstallation.Progress(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2307CC030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v25 = a2;
  uint64_t v27 = sub_230812618();
  MEMORY[0x270FA5388](v27);
  unint64_t v26 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2308120D8();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = sub_230812628();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2308123B8();
  v29[3] = v18;
  v29[4] = MEMORY[0x263F50E40];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v29);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(boxed_opaque_existential_0, a4, v18);
  *(void *)(a5 + 16) = a1;
  *(double *)(a5 + 144) = a6;
  sub_2307CDEC4(a2, a5 + 48);
  sub_2307CDEC4(a3, a5 + 88);
  sub_2307CDEC4((uint64_t)v29, a5 + 152);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B28);
  swift_allocObject();
  *(void *)(a5 + 208) = sub_230812108();
  uint64_t v20 = MEMORY[0x263F8EE78];
  *(void *)(a5 + 32) = sub_2307D8320(MEMORY[0x263F8EE78]);
  *(void *)(a5 + 128) = sub_2307D8420(v20);
  *(void *)(a5 + 40) = MEMORY[0x263F8EE88];
  *(void *)(a5 + 136) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08760]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B18);
  swift_allocObject();
  *(void *)(a5 + 216) = sub_230812108();
  *(void *)(a5 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CE0);
  uint64_t v21 = swift_allocObject();
  *(_DWORD *)(v21 + 16) = 0;
  *(void *)(a5 + 192) = v21;
  sub_2307CB7A0(0, (unint64_t *)&qword_26AF24BE8);
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F8F138], v14);
  sub_2308120C8();
  uint64_t v28 = v20;
  sub_2307C95F4(&qword_26AF24BE0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B88);
  sub_2307CB7DC((unint64_t *)&unk_26AF24B90, &qword_26AF24B88);
  sub_230812708();
  uint64_t v22 = sub_230812658();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(v25);
  *(void *)(a5 + 200) = v22;
  return a5;
}

uint64_t StorefrontAppStateController.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2 = sub_2308123B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(double *)(a1 + 88);
  sub_2307CDEC4(a1 + 48, (uint64_t)v14);
  sub_2307CDEC4(a1, (uint64_t)v13);
  uint64_t v8 = qword_26AF24B38;
  swift_bridgeObjectRetain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = __swift_project_value_buffer(v2, (uint64_t)qword_26AF25998);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  uint64_t v11 = sub_2307CC030(v6, (uint64_t)v14, (uint64_t)v13, (uint64_t)v5, v10, v7);
  sub_2307D97AC(a1);
  return v11;
}

uint64_t sub_2307CC590()
{
  unint64_t v1 = v0;
  uint64_t v2 = v0 + 14;
  uint64_t v3 = v0[11];
  uint64_t v18 = v0[10];
  uint64_t v4 = v0[8];
  id v19 = v2;
  uint64_t v5 = v1[6];
  uint64_t v16 = v3;
  uint64_t v17 = v1[7];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  sub_230812008();
  uint64_t v8 = sub_230812588();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v5, 1, 1, v8);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v6;
  v10[5] = v7;
  swift_retain();
  sub_2307CC7EC(v5, (uint64_t)&unk_2687031B8, (uint64_t)v10);
  sub_2307CDF28(v5, &qword_26AF24BC0);
  v9(v5, 1, 1, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v18, v16, v17);
  unint64_t v11 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v12 + v11, v18, v17);
  sub_2307CC7EC(v5, (uint64_t)&unk_2687031C8, v12);
  sub_2307CDF28(v5, &qword_26AF24BC0);
  uint64_t v13 = (void *)swift_task_alloc();
  v1[12] = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC8);
  *uint64_t v13 = v1;
  v13[1] = sub_2307D89AC;
  return MEMORY[0x270FA2048](v19, 0, 0, v14);
}

uint64_t sub_2307CC7EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307D5154(a1, (uint64_t)v9, &qword_26AF24BC0);
  uint64_t v10 = sub_230812588();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_2307CDF28((uint64_t)v9, &qword_26AF24BC0);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = sub_230812538();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_230812578();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = *v4;
  uint64_t v16 = (void *)(v14 | v12);
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    uint64_t v16 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  v18[1] = 1;
  v18[2] = v16;
  v18[3] = v15;
  swift_task_create();
  return swift_release();
}

uint64_t sub_2307CC9CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_230812398();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2308123B8();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (qword_26AF24B58 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_26AF25970);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  return sub_2308123A8();
}

unint64_t sub_2307CCB1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C48);
    uint64_t v3 = (void *)sub_230812838();
    for (uint64_t i = a1 + 32; ; i += 48)
    {
      sub_2307D5154(i, (uint64_t)v11, &qword_26AF24620);
      char v5 = v11[0];
      unint64_t result = sub_2307D0570(v11[0]);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v3[6] + result) = v5;
      unint64_t result = sub_2307CDF84(&v12, v3[7] + 40 * result);
      uint64_t v8 = v3[2];
      BOOL v9 = __OFADD__(v8, 1);
      uint64_t v10 = v8 + 1;
      if (v9) {
        goto LABEL_10;
      }
      v3[2] = v10;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_2307CCC2C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C50);
  uint64_t v2 = sub_230812838();
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
    sub_2307D5154(v6, (uint64_t)v13, &qword_26AF24828);
    unsigned __int8 v7 = v13[0];
    unint64_t result = sub_2307D0CA8(v13[0]);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v3[6] + result) = v7;
    unint64_t result = sub_2307CDF84(&v14, v3[7] + 40 * result);
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
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

uint64_t sub_2307CCD60()
{
  uint64_t v1 = *(os_unfair_lock_s **)(*(void *)v0 + 16);
  swift_retain();
  os_unfair_lock_lock(v1 + 6);
  sub_2307CCDD4();
  os_unfair_lock_unlock(v1 + 6);
  return swift_release();
}

uint64_t sub_2307CCDD4()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  return sub_2307CCE0C(v0);
}

uint64_t sub_2307CCE0C(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    unint64_t result = sub_2307D51B8(&v13, *(void *)(*(void *)(v1 + 48) + 8 * v9));
  }
  int64_t v12 = v10 + 4;
  if (v12 < v7)
  {
    unint64_t v11 = *(void *)(v3 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v2 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        ++v12;
        if (v11) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v12;
    goto LABEL_22;
  }
LABEL_23:
  return swift_release();
}

void StorefrontAppStateController.setPostsChanges(_:forApp:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDB4(v2);
  os_unfair_lock_unlock(v1);
}

void sub_2307CCFE4(uint64_t a1, uint64_t a2)
{
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24608);
  MEMORY[0x270FA5388](v122);
  v121 = (uint64_t *)((char *)&v115 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24878);
  MEMORY[0x270FA5388](v129);
  unint64_t v6 = (char *)&v115 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  v133 = (uint64_t *)((char *)&v115 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int64_t v12 = (char *)&v115 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v115 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v143 = (uint64_t)&v115 - v17;
  MEMORY[0x270FA5388](v16);
  id v19 = (char *)&v115 - v18;
  uint64_t v148 = type metadata accessor for State();
  uint64_t v20 = *(void *)(v148 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v148);
  uint64_t v126 = (uint64_t)&v115 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v127 = (uint64_t)&v115 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v123 = (uint64_t)&v115 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v146 = (uint64_t)&v115 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v144 = (uint64_t)&v115 - v29;
  uint64_t v30 = a1;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B70);
  sub_230812408();
  uint64_t v31 = (uint64_t)v15;
  swift_endAccess();
  uint64_t v32 = *(void *)(a2 + 56);
  uint64_t v116 = a2 + 56;
  uint64_t v33 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v34 = -1;
  if (v33 < 64) {
    uint64_t v34 = ~(-1 << v33);
  }
  unint64_t v35 = v34 & v32;
  uint64_t v36 = v30;
  v132 = (uint64_t *)(v30 + 128);
  int64_t v117 = (unint64_t)(v33 + 63) >> 6;
  uint64_t v37 = (unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  uint64_t v145 = v20;
  uint64_t v128 = v20 + 56;
  uint64_t v120 = a2;
  uint64_t v38 = swift_bridgeObjectRetain();
  unint64_t v39 = v35;
  uint64_t v40 = v36;
  int64_t v41 = 0;
  v42 = &qword_26AF24000;
  uint64_t v43 = (void *)&unk_26AF25000;
  uint64_t v139 = v36;
  v149 = v15;
  v131 = (unsigned int (**)(uint64_t *, uint64_t, uint64_t))v37;
  v135 = v6;
  v124 = v12;
  do
  {
LABEL_5:
    if (v39)
    {
      unint64_t v44 = __clz(__rbit64(v39));
      v39 &= v39 - 1;
      unint64_t v45 = v44 | (v41 << 6);
    }
    else
    {
      if (__OFADD__(v41++, 1))
      {
LABEL_78:
        __break(1u);
        goto LABEL_79;
      }
      if (v41 >= v117) {
        goto LABEL_76;
      }
      unint64_t v47 = *(void *)(v116 + 8 * v41);
      if (!v47)
      {
        int64_t v48 = v41 + 1;
        if (v41 + 1 >= v117) {
          goto LABEL_76;
        }
        unint64_t v47 = *(void *)(v116 + 8 * v48);
        if (!v47)
        {
          int64_t v48 = v41 + 2;
          if (v41 + 2 >= v117) {
            goto LABEL_76;
          }
          unint64_t v47 = *(void *)(v116 + 8 * v48);
          if (!v47)
          {
            int64_t v48 = v41 + 3;
            if (v41 + 3 >= v117) {
              goto LABEL_76;
            }
            unint64_t v47 = *(void *)(v116 + 8 * v48);
            if (!v47)
            {
              int64_t v48 = v41 + 4;
              if (v41 + 4 >= v117) {
                goto LABEL_76;
              }
              unint64_t v47 = *(void *)(v116 + 8 * v48);
              if (!v47)
              {
                while (1)
                {
                  int64_t v41 = v48 + 1;
                  if (__OFADD__(v48, 1)) {
                    break;
                  }
                  if (v41 >= v117) {
                    goto LABEL_76;
                  }
                  unint64_t v47 = *(void *)(v116 + 8 * v41);
                  ++v48;
                  if (v47) {
                    goto LABEL_19;
                  }
                }
LABEL_79:
                __break(1u);
LABEL_80:
                os_unfair_lock_unlock((os_unfair_lock_t)v38);
                __break(1u);
                return;
              }
            }
          }
        }
        int64_t v41 = v48;
      }
LABEL_19:
      unint64_t v39 = (v47 - 1) & v47;
      unint64_t v45 = __clz(__rbit64(v47)) + (v41 << 6);
    }
    uint64_t v49 = *(void *)(*(void *)(v120 + 48) + 8 * v45);
    if (v42[19] != -1)
    {
      v112 = v42;
      v113 = v43;
      int64_t v119 = v41;
      unint64_t v114 = v39;
      uint64_t v38 = swift_once();
      unint64_t v39 = v114;
      int64_t v41 = v119;
      uint64_t v43 = v113;
      v42 = v112;
      uint64_t v40 = v139;
    }
    uint64_t v50 = v43[301];
    uint64_t v137 = *(void *)(v50 + 16);
  }
  while (!v137);
  unint64_t v118 = v39;
  int64_t v119 = v41;
  uint64_t v51 = *(void *)(v40 + 16);
  uint64_t v147 = *(void *)(v51 + 16);
  uint64_t v136 = v50 + 32;
  uint64_t v150 = v51;
  uint64_t v130 = v51 + 32;
  uint64_t v138 = v50;
  swift_bridgeObjectRetain();
  uint64_t v38 = v138;
  unint64_t v52 = 0;
  uint64_t v134 = v49;
  while (1)
  {
    if (v52 >= *(void *)(v38 + 16))
    {
      __break(1u);
      goto LABEL_78;
    }
    unint64_t v142 = v52;
    int v151 = *(unsigned __int8 *)(v136 + v52);
    v54 = (void *)MEMORY[0x263F8EE78];
    v159 = (void *)MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    if (v147) {
      break;
    }
    v61 = v54;
LABEL_40:
    swift_bridgeObjectRelease();
    uint64_t v62 = v61[2];
    if (v62)
    {
      uint64_t v63 = (uint64_t)(v61 + 4);
      v141 = v61;
      swift_retain();
      do
      {
        sub_2307CDEC4(v63, (uint64_t)&v152);
        uint64_t v64 = v154;
        v65 = v155;
        __swift_project_boxed_opaque_existential_1(&v152, v154);
        *(void *)&long long v158 = v49;
        ((void (*)(long long *, uint64_t, uint64_t *))v65[6])(&v158, v64, v65);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
        if ((*v37)(v19, 1, v148) == 1)
        {
          sub_2307CDF28((uint64_t)v19, &qword_26AF24868);
        }
        else
        {
          uint64_t v66 = v144;
          sub_2307CE37C((uint64_t)v19, v144);
          sub_2307CE37C(v66, v146);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v54 = (void *)sub_2307CEA54(0, v54[2] + 1, 1, v54);
          }
          unint64_t v68 = v54[2];
          unint64_t v67 = v54[3];
          if (v68 >= v67 >> 1) {
            v54 = (void *)sub_2307CEA54(v67 > 1, v68 + 1, 1, v54);
          }
          v54[2] = v68 + 1;
          sub_2307CE37C(v146, (uint64_t)v54+ ((*(unsigned __int8 *)(v145 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v145 + 80))+ *(void *)(v145 + 72) * v68);
        }
        v63 += 40;
        --v62;
      }
      while (v62);
      swift_release_n();
      uint64_t v31 = (uint64_t)v149;
    }
    else
    {
      swift_release();
    }
    uint64_t v69 = (uint64_t)v135;
    uint64_t v70 = v143;
    if (v54[2] == 1)
    {
      uint64_t v71 = v145;
      sub_2307CE248((uint64_t)v54 + ((*(unsigned __int8 *)(v145 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v145 + 80)), v143);
      v72 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v71 + 56);
      uint64_t v73 = v148;
      v72(v70, 0, 1, v148);
      swift_storeEnumTagMultiPayload();
      v72(v31, 0, 1, v73);
      uint64_t v74 = v69 + *(int *)(v129 + 48);
      sub_2307D5154(v143, v69, &qword_26AF24868);
      v141 = (void *)v74;
      sub_2307D5154(v31, v74, &qword_26AF24868);
      uint64_t v75 = v31;
      v76 = *(unsigned int (**)(void *, uint64_t, uint64_t))(v145 + 48);
      uint64_t v77 = v73;
      if (v76((void *)v69, 1, v73) == 1)
      {
        sub_2307CDF28(v75, &qword_26AF24868);
        sub_2307CDF28(v143, &qword_26AF24868);
        if (v76(v141, 1, v73) == 1)
        {
          sub_2307CDF28(v69, &qword_26AF24868);
LABEL_66:
          swift_bridgeObjectRelease();
          *(void *)&long long v152 = v49;
          uint64_t v101 = v139;
          v102 = sub_2307CF19C((uint64_t *)&v152);
          char v103 = v151;
          LOBYTE(v152) = v151;
          uint64_t v104 = sub_2307CFA40((char *)&v152);
          v141 = v102;
          uint64_t v105 = v102[4];
          MEMORY[0x270FA5388](v104);
          *((unsigned char *)&v115 - 16) = v103;
          v140 = (uint64_t *)(v105 + 16);
          swift_retain();
          os_unfair_lock_lock((os_unfair_lock_t)(v105 + 24));
          uint64_t v106 = v125;
          sub_2307CF73C(v140, v127);
          uint64_t v125 = v106;
          uint64_t v38 = v105 + 24;
          if (v106) {
            goto LABEL_80;
          }
          os_unfair_lock_unlock((os_unfair_lock_t)v38);
          swift_release();
          v107 = *(void **)(v101 + 136);
          *(void *)&long long v152 = v49;
          BYTE8(v152) = v103;
          id v108 = v107;
          unsigned __int8 v109 = objc_msgSend(v108, sel_containsObject_, sub_2308128A8());

          swift_unknownObjectRelease();
          if (v109)
          {
            uint64_t v110 = (uint64_t)v121;
            uint64_t v111 = (uint64_t)v121 + *(int *)(v122 + 48);
            uint64_t *v121 = v49;
            *(unsigned char *)(v110 + 8) = v103;
            sub_2307CE248(v127, v111);
            sub_2308120F8();
            sub_2307CDF28(v110, &qword_26AF24608);
          }
          swift_release();
          uint64_t v97 = v127;
LABEL_70:
          sub_2307CDFFC(v97, (uint64_t (*)(void))type metadata accessor for State);
          unint64_t v53 = v142;
          goto LABEL_25;
        }
        goto LABEL_58;
      }
      uint64_t v78 = (uint64_t)v124;
      sub_2307D5154(v69, (uint64_t)v124, &qword_26AF24868);
      uint64_t v79 = (uint64_t)v141;
      unsigned int v80 = v76(v141, 1, v77);
      uint64_t v81 = v69;
      if (v80 == 1)
      {
        sub_2307CDF28((uint64_t)v149, &qword_26AF24868);
        sub_2307CDF28(v143, &qword_26AF24868);
        sub_2307CDFFC(v78, (uint64_t (*)(void))type metadata accessor for State);
LABEL_58:
        sub_2307CDF28(v69, &qword_26AF24878);
        goto LABEL_59;
      }
      uint64_t v98 = v79;
      uint64_t v99 = v123;
      sub_2307CE37C(v98, v123);
      char v100 = _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v78, v99);
      sub_2307CDFFC(v99, (uint64_t (*)(void))type metadata accessor for State);
      sub_2307CDF28((uint64_t)v149, &qword_26AF24868);
      sub_2307CDF28(v143, &qword_26AF24868);
      sub_2307CDFFC(v78, (uint64_t (*)(void))type metadata accessor for State);
      sub_2307CDF28(v81, &qword_26AF24868);
      if (v100) {
        goto LABEL_66;
      }
    }
LABEL_59:
    v82 = v132;
    swift_beginAccess();
    uint64_t v83 = *v82;
    if (*(void *)(*v82 + 16) && (unint64_t v84 = sub_2307F5570(v49, v151), (v85 & 1) != 0))
    {
      uint64_t v86 = *(void *)(v83 + 56) + 56 * v84;
      uint64_t v87 = *(void *)v86;
      uint64_t v88 = *(void *)(v86 + 8);
      uint64_t v89 = *(unsigned __int8 *)(v86 + 16);
      uint64_t v91 = *(void *)(v86 + 24);
      v90 = *(uint64_t **)(v86 + 32);
      v93 = *(void **)(v86 + 40);
      uint64_t v92 = *(void *)(v86 + 48);
      swift_bridgeObjectRetain();
      uint64_t v94 = v92;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v87 = 0;
      uint64_t v88 = 0;
      uint64_t v89 = 0;
      uint64_t v91 = 0;
      v90 = 0;
      v93 = 0;
      uint64_t v94 = 0;
    }
    v140 = v90;
    v141 = v93;
    swift_endAccess();
    *(void *)&long long v152 = v87;
    *((void *)&v152 + 1) = v88;
    uint64_t v153 = v89;
    uint64_t v154 = v91;
    v155 = v90;
    v156 = v93;
    uint64_t v157 = v94;
    v95 = v133;
    sub_2307D1160((uint64_t)v54, (uint64_t *)&v152, v133);
    swift_bridgeObjectRelease();
    sub_2307CFCE0(v87, v88, v89, v91, (uint64_t)v140);
    uint64_t v37 = (unsigned int (**)(char *, uint64_t, uint64_t))v131;
    if ((*v131)(v95, 1, v148) != 1)
    {
      uint64_t v96 = v126;
      sub_2307CE37C((uint64_t)v95, v126);
      uint64_t v49 = v134;
      *(void *)&long long v152 = v134;
      BYTE8(v152) = v151;
      sub_2307D392C((uint64_t)&v152, v96);
      uint64_t v97 = v96;
      goto LABEL_70;
    }
    sub_2307CDF28((uint64_t)v95, &qword_26AF24868);
    unint64_t v53 = v142;
    uint64_t v49 = v134;
LABEL_25:
    unint64_t v52 = v53 + 1;
    uint64_t v31 = (uint64_t)v149;
    uint64_t v38 = v138;
    if (v52 == v137)
    {
      uint64_t v38 = swift_bridgeObjectRelease();
      uint64_t v40 = v139;
      v42 = &qword_26AF24000;
      uint64_t v43 = &unk_26AF25000;
      int64_t v41 = v119;
      unint64_t v39 = v118;
      goto LABEL_5;
    }
  }
  unint64_t v55 = 0;
  uint64_t v56 = v130;
  while (v55 < *(void *)(v150 + 16))
  {
    sub_2307CDEC4(v56, (uint64_t)&v152);
    uint64_t v57 = v154;
    v58 = v155;
    __swift_project_boxed_opaque_existential_1(&v152, v154);
    *(void *)&long long v158 = v49;
    BYTE8(v158) = v151;
    if (((uint64_t (*)(long long *, uint64_t, uint64_t *))v58[7])(&v158, v57, v58))
    {
      sub_2307CDF84(&v152, (uint64_t)&v158);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_2307CE798(0, v54[2] + 1, 1);
      }
      v54 = v159;
      unint64_t v60 = v159[2];
      unint64_t v59 = v159[3];
      uint64_t v31 = (uint64_t)v149;
      if (v60 >= v59 >> 1)
      {
        sub_2307CE798((void *)(v59 > 1), v60 + 1, 1);
        uint64_t v31 = (uint64_t)v149;
        v54 = v159;
      }
      v54[2] = v60 + 1;
      sub_2307CDF84(&v158, (uint64_t)&v54[5 * v60 + 4]);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v152);
      uint64_t v31 = (uint64_t)v149;
    }
    ++v55;
    v56 += 40;
    if (v147 == v55)
    {
      v61 = v159;
      v54 = (void *)MEMORY[0x263F8EE78];
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_76:
  swift_release();
}

uint64_t sub_2307CDEC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2307CDF28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2307CDF84(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2307CDF9C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2307CDFFC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2307CE05C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void destroy for State(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    swift_release();
    uint64_t v3 = type metadata accessor for AppInstallation(0);
    uint64_t v4 = a1 + *(int *)(v3 + 20);
    type metadata accessor for AppInstallation.Phase(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        uint64_t v5 = sub_230812048();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

        break;
      case 3u:
        swift_release();
        break;
      default:
        break;
    }
    uint64_t v6 = a1 + *(int *)(v3 + 24);
    uint64_t v7 = sub_230812048();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
    uint64_t v8 = *(void **)(v6 + *(int *)(type metadata accessor for AppInstallation.Progress(0) + 24));
  }
  else if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2307CE248(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2307CE2AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2307CE314(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2307CE37C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for State()
{
  uint64_t result = qword_26AF24830;
  if (!qword_26AF24830) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *initializeWithCopy for State(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    *a1 = *a2;
    uint64_t v8 = (int *)type metadata accessor for AppInstallation(0);
    uint64_t v9 = v8[5];
    uint64_t v10 = (void *)((char *)a1 + v9);
    uint64_t v11 = (void *)((char *)a2 + v9);
    uint64_t v12 = type metadata accessor for AppInstallation.Phase(0);
    swift_retain();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        uint64_t v13 = sub_230812048();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v10, v11, v13);
        uint64_t v14 = type metadata accessor for AppInstallation.Progress(0);
        *(void *)((char *)v10 + *(int *)(v14 + 20)) = *(void *)((char *)v11 + *(int *)(v14 + 20));
        uint64_t v15 = *(int *)(v14 + 24);
        uint64_t v16 = *(void **)((char *)v11 + v15);
        *(void *)((char *)v10 + v15) = v16;
        id v17 = v16;
        goto LABEL_11;
      case 3u:
        *uint64_t v10 = *v11;
        swift_retain();
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
        break;
    }
    uint64_t v18 = v8[6];
    id v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = sub_230812048();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = type metadata accessor for AppInstallation.Progress(0);
    *(void *)&v19[*(int *)(v22 + 20)] = *(void *)&v20[*(int *)(v22 + 20)];
    uint64_t v23 = *(int *)(v22 + 24);
    uint64_t v24 = *(void **)&v20[v23];
    *(void *)&v19[v23] = v24;
    *((unsigned char *)a1 + v8[7]) = *((unsigned char *)a2 + v8[7]);
    *(void *)((char *)a1 + v8[8]) = *(void *)((char *)a2 + v8[8]);
    *((unsigned char *)a1 + v8[9]) = *((unsigned char *)a2 + v8[9]);
    *(void *)((char *)a1 + v8[10]) = *(void *)((char *)a2 + v8[10]);
    id v25 = v24;
    goto LABEL_13;
  }
  if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
LABEL_13:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *sub_2307CE798(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2307CE7B8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_2307CE7B8(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C78);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF248F8);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

BOOL sub_2307CE8F0(uint64_t a1)
{
  return DeviceAppStateDataSource.providesState(forApp:)(a1);
}

BOOL DeviceAppStateDataSource.providesState(forApp:)(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 8);
  int v3 = *(unsigned __int8 *)(v1 + 64);
  if (v3 == 2) {
    goto LABEL_5;
  }
  uint64_t v4 = *(void **)(v1 + 56);
  if (v3 == 3)
  {
    id v6 = objc_msgSend(v4, sel_predicate);
    id v7 = objc_msgSend(v6, sel_description);

    sub_230812448();
    sub_2307F26C4();
    int v5 = sub_2308126E8();
    sub_2307CB9CC(v4, 3);
    swift_bridgeObjectRelease();
    sub_2307CB9CC(v4, 3);
    return ((v2 ^ v5) & 1) == 0;
  }
  if (v3 == 4 && v4 == (void *)1) {
LABEL_5:
  }
    int v5 = 1;
  else {
    int v5 = 0;
  }
  return ((v2 ^ v5) & 1) == 0;
}

size_t sub_2307CEA54(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C70);
  uint64_t v10 = *(void *)(type metadata accessor for State() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for State() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_2307CEC28()
{
  return 1;
}

uint64_t sub_2307CEC30(uint64_t a1)
{
  return WaitingAppStateDataSource.providesState(forApp:)(a1) & 1;
}

uint64_t WaitingAppStateDataSource.providesState(forApp:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (unsigned __int8 *)(v2 + 32);
  uint64_t v5 = v3 - 1;
  do
  {
    int v6 = *(unsigned __int8 *)(a1 + 8) ^ *v4;
    BOOL v8 = v5-- != 0;
    if ((v6 & 1) == 0) {
      break;
    }
    ++v4;
  }
  while (v8);
  return (v6 ^ 1) & 1;
}

uint64_t sub_2307CECA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for State();
  swift_storeEnumTagMultiPayload();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 0, 1, v2);
}

void sub_2307CED20()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CED9C();
  os_unfair_lock_unlock(v1);
}

uint64_t sub_2307CED9C()
{
  return sub_2307CEDCC();
}

uint64_t sub_2307CEDB4(uint64_t a1)
{
  return sub_2307CEDF4(a1);
}

uint64_t sub_2307CEDCC()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2307CEDF4(uint64_t a1)
{
  return sub_2307CEE10(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_2307CEE10(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_2307CEE38@<X0>(uint64_t a1@<X8>)
{
  return sub_2307CEE50(a1);
}

uint64_t sub_2307CEE50@<X0>(uint64_t a1@<X8>)
{
  return sub_2307CEE6C(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_2307CEE6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_beginAccess();
  uint64_t v6 = *(void *)(a1 + 160);
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_2307CF3B0(a2), (v8 & 1) != 0))
  {
    unint64_t v9 = v7;
    uint64_t v10 = *(void *)(v6 + 56);
    uint64_t v11 = type metadata accessor for State();
    uint64_t v12 = *(void *)(v11 - 8);
    sub_2307CE248(v10 + *(void *)(v12 + 72) * v9, a3);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a3, 0, 1, v11);
  }
  else
  {
    uint64_t v13 = type metadata accessor for State();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a3, 1, 1, v13);
  }
  return swift_endAccess();
}

void sub_2307CEFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 24);
  type metadata accessor for State();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    swift_release();
    uint64_t v4 = type metadata accessor for AppInstallation(0);
    uint64_t v5 = v2 + *(int *)(v4 + 20);
    type metadata accessor for AppInstallation.Phase(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        uint64_t v6 = sub_230812048();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

        break;
      case 3u:
        swift_release();
        break;
      default:
        break;
    }
    uint64_t v7 = v2 + *(int *)(v4 + 24);
    uint64_t v8 = sub_230812048();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    unint64_t v9 = *(void **)(v7 + *(int *)(type metadata accessor for AppInstallation.Progress(0) + 24));
  }
  else if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for AppStateMachine.StateChange()
{
  uint64_t result = qword_26AF24908;
  if (!qword_26AF24908) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_2307CF19C(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2308123B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v8 = *a1;
  unint64_t v9 = (uint64_t *)(v1 + 32);
  swift_beginAccess();
  uint64_t v10 = *(void *)(v1 + 32);
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_2307CF3B0(v8), (v12 & 1) != 0))
  {
    uint64_t v13 = *(void **)(*(void *)(v10 + 56) + 8 * v11);
    swift_endAccess();
    swift_retain();
  }
  else
  {
    swift_endAccess();
    sub_2307CDEC4(v2 + 48, (uint64_t)v19);
    if (qword_26AF24B48 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v4, (uint64_t)qword_26AF259C8);
    type metadata accessor for AppStateMachine();
    uint64_t v15 = (void *)swift_allocObject();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
    uint64_t v13 = sub_2307CF770(v8, (uint64_t)v19, (uint64_t)v7, v15);
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v9;
    *unint64_t v9 = 0x8000000000000000;
    sub_2307CF5DC((uint64_t)v13, v8, isUniquelyReferenced_nonNull_native);
    *unint64_t v9 = v18;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  return v13;
}

unint64_t sub_2307CF3B0(uint64_t a1)
{
  sub_230812958();
  sub_230812988();
  uint64_t v2 = sub_230812998();
  return sub_2307CF41C(a1, v2);
}

unint64_t sub_2307CF41C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
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

uint64_t sub_2307CF4F0()
{
  return sub_2307CF508();
}

uint64_t sub_2307CF508()
{
  return sub_2307CF52C(*(unsigned char *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t sub_2307CF52C(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *(void **)(a2 + 136);
  LOBYTE(v11) = a4 & 1;
  if (a1)
  {
    id v5 = v4;
    uint64_t v6 = sub_2308128A8();
    uint64_t v7 = &selRef_addObject_;
  }
  else
  {
    id v8 = v4;
    uint64_t v6 = sub_2308128A8();
    uint64_t v7 = &selRef_removeObject_;
  }
  objc_msgSend(v4, *v7, v6, a3, v11);

  return swift_unknownObjectRelease();
}

uint64_t sub_2307CF5DC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_2307CF3B0(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_230811698();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_2308102AC(result, a3 & 1);
  uint64_t result = sub_2307CF3B0(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_2308128C8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AppStateMachine()
{
  return self;
}

uint64_t sub_2307CF73C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2307CF754(a1, a2);
}

uint64_t sub_2307CF754@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2307CFFE0(a1, *(unsigned char *)(v2 + 16), a2);
}

void *sub_2307CF770(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = sub_2308123B8();
  v14[3] = v8;
  void v14[4] = MEMORY[0x263F50E40];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(boxed_opaque_existential_0, a3, v8);
  a4[2] = a1;
  unint64_t v10 = sub_2307CF890(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C18);
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 24) = 0;
  *(void *)(v11 + 16) = v10;
  a4[4] = v11;
  sub_2307CDEC4(a2, (uint64_t)(a4 + 5));
  sub_2307CDEC4((uint64_t)v14, (uint64_t)(a4 + 10));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B20);
  swift_allocObject();
  uint64_t v12 = sub_230812108();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_1(a2);
  a4[3] = v12;
  return a4;
}

unint64_t sub_2307CF890(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24618);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C40);
    uint64_t v7 = (void *)sub_230812838();
    uint64_t v8 = (uint64_t)&v5[*(int *)(v2 + 48)];
    uint64_t v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v10 = *(void *)(v3 + 72);
    while (1)
    {
      sub_2307D5154(v9, (uint64_t)v5, &qword_26AF24618);
      char v11 = *v5;
      unint64_t result = sub_2307D0570(*v5);
      if (v13) {
        break;
      }
      unint64_t v14 = result;
      *(void *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(unsigned char *)(v7[6] + result) = v11;
      uint64_t v15 = v7[7];
      uint64_t v16 = type metadata accessor for State();
      unint64_t result = sub_2307CE37C(v8, v15 + *(void *)(*(void *)(v16 - 8) + 72) * v14);
      uint64_t v17 = v7[2];
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_10;
      }
      v7[2] = v19;
      v9 += v10;
      if (!--v6) {
        return (unint64_t)v7;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_2307CFA40(char *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for AppStateMachine.StateChange();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for State();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v10 = *a1;
  swift_storeEnumTagMultiPayload();
  char v11 = *(os_unfair_lock_s **)(v2 + 32);
  v14[16] = v10;
  uint64_t v15 = v9;
  swift_retain();
  os_unfair_lock_lock(v11 + 6);
  sub_2307CFBD8((uint64_t)&v11[4]);
  os_unfair_lock_unlock(v11 + 6);
  swift_release();
  uint64_t v12 = *(void *)(v2 + 16);
  swift_storeEnumTagMultiPayload();
  *(void *)uint64_t v6 = v12;
  v6[8] = v10;
  sub_2308120F8();
  sub_2307CDFFC((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for AppStateMachine.StateChange);
  return sub_2307CDFFC((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for State);
}

uint64_t sub_2307CFBD8(uint64_t a1)
{
  return sub_2307CFBF8(a1, *(unsigned char *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2307CFBF8(uint64_t a1, char a2, uint64_t a3)
{
  char v4 = a2 & 1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307CE248(a3, (uint64_t)v7);
  uint64_t v8 = type metadata accessor for State();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  return sub_2307D01FC((uint64_t)v7, v4);
}

uint64_t sub_2307CFCE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2307CFD24()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDB4(v2);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_2307CFDA0@<X0>(uint64_t a1@<X8>)
{
  return sub_2307CFDB8(a1);
}

uint64_t sub_2307CFDB8@<X0>(uint64_t a1@<X8>)
{
  return sub_2307CFDD4(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_2307CFDD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_beginAccess();
  uint64_t v6 = *(void *)(a1 + 16);
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_2307CF3B0(a2), (v8 & 1) != 0))
  {
    unint64_t v9 = v7;
    uint64_t v10 = *(void *)(v6 + 56);
    uint64_t v11 = type metadata accessor for State();
    uint64_t v12 = *(void *)(v11 - 8);
    sub_2307CE248(v10 + *(void *)(v12 + 72) * v9, a3);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a3, 0, 1, v11);
  }
  else
  {
    uint64_t v13 = type metadata accessor for State();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a3, 1, 1, v13);
  }
  return swift_endAccess();
}

double sub_2307CFF18@<D0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_2307D0570(*a1), (v6 & 1) != 0))
  {
    sub_2307CDEC4(*(void *)(v4 + 56) + 40 * v5, (uint64_t)v11);
    uint64_t v7 = v12;
    uint64_t v8 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    State.key.getter(&v10);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 8))(&v10, v7, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_2307CFFE0@<X0>(uint64_t *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  unint64_t v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v20 - v10;
  uint64_t v12 = *a1;
  if (*(void *)(v12 + 16) && (unint64_t v13 = sub_2307D0570(a2 & 1), (v14 & 1) != 0))
  {
    unint64_t v15 = v13;
    uint64_t v16 = *(void *)(v12 + 56);
    uint64_t v17 = type metadata accessor for State();
    uint64_t v18 = *(void *)(v17 - 8);
    sub_2307CE248(v16 + *(void *)(v18 + 72) * v15, (uint64_t)v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
  }
  else
  {
    uint64_t v17 = type metadata accessor for State();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
  }
  sub_2307D1F58((uint64_t)v11, (uint64_t)v9);
  type metadata accessor for State();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v9, 1, v17) != 1) {
    return sub_2307CE37C((uint64_t)v9, a3);
  }
  swift_storeEnumTagMultiPayload();
  return sub_2307CDF28((uint64_t)v9, &qword_26AF24868);
}

uint64_t sub_2307D01FC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  char v5 = a2 & 1;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for State();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_2307D71A0(a1);
    unint64_t v13 = sub_2307D0570(v5);
    if (v14)
    {
      unint64_t v15 = v13;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v17 = *v3;
      uint64_t v21 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_2308110DC();
        uint64_t v17 = v21;
      }
      sub_2307CE37C(*(void *)(v17 + 56) + *(void *)(v10 + 72) * v15, (uint64_t)v8);
      sub_230810AC4(v15, v17);
      *uint64_t v3 = v17;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    }
    return sub_2307D71A0((uint64_t)v8);
  }
  else
  {
    sub_2307CE37C(a1, (uint64_t)v12);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2307D0424((uint64_t)v12, v5, v18);
    *uint64_t v3 = v21;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2307D0424(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = (void **)v3;
  char v7 = a2 & 1;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_2307D0570(a2 & 1);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_2308110DC();
      goto LABEL_7;
    }
    sub_2307D0734(v13, a3 & 1);
    unint64_t v20 = sub_2307D0570(v7);
    if ((v14 & 1) == (v21 & 1))
    {
      unint64_t v10 = v20;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_2308128C8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = v17 + *(void *)(*(void *)(type metadata accessor for State() - 8) + 72) * v10;
    return sub_230811DA8(a1, v18);
  }
LABEL_13:
  return sub_2307D069C(v10, v7, a1, v16);
}

unint64_t sub_2307D0570(char a1)
{
  char v1 = a1 & 1;
  sub_230812958();
  sub_230812968();
  uint64_t v2 = sub_230812998();
  return sub_2307D05E0(v1, v2);
}

unint64_t sub_2307D05E0(char a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if ((((a1 & 1) == 0) ^ *(unsigned char *)(v7 + result))) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2307D069C(unint64_t a1, char a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2 & 1;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for State();
  uint64_t result = sub_2307CE37C(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_2307D0734(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for State();
  uint64_t v37 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C40);
  int v38 = a2;
  uint64_t result = sub_230812828();
  uint64_t v10 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v34 = v2;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v36 = (void *)(v8 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v35 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v16 = result + 64;
    while (1)
    {
      if (v15)
      {
        unint64_t v18 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v19 = v18 | (v11 << 6);
      }
      else
      {
        int64_t v20 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v36;
        if (v20 >= v35) {
          goto LABEL_34;
        }
        unint64_t v21 = v36[v20];
        ++v11;
        if (!v21)
        {
          int64_t v11 = v20 + 1;
          if (v20 + 1 >= v35) {
            goto LABEL_34;
          }
          unint64_t v21 = v36[v11];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v35)
            {
LABEL_34:
              if ((v38 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_41;
              }
              uint64_t v33 = 1 << *(unsigned char *)(v8 + 32);
              if (v33 >= 64) {
                bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v36 = -1 << v33;
              }
              uint64_t v3 = v34;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v11 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_43;
                }
                if (v11 >= v35) {
                  goto LABEL_34;
                }
                unint64_t v21 = v36[v11];
                ++v22;
                if (v21) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v11 = v22;
          }
        }
LABEL_21:
        unint64_t v15 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v11 << 6);
      }
      char v23 = *(unsigned char *)(*(void *)(v8 + 48) + v19);
      uint64_t v24 = *(void *)(v37 + 72);
      uint64_t v25 = *(void *)(v8 + 56) + v24 * v19;
      if (v38) {
        sub_2307CE37C(v25, (uint64_t)v7);
      }
      else {
        sub_2307CE248(v25, (uint64_t)v7);
      }
      sub_230812958();
      sub_230812968();
      uint64_t result = sub_230812998();
      uint64_t v26 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_42;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v16 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(unsigned char *)(*(void *)(v10 + 48) + v17) = v23;
      uint64_t result = sub_2307CE37C((uint64_t)v7, *(void *)(v10 + 56) + v24 * v17);
      ++*(void *)(v10 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v10;
  return result;
}

uint64_t State.key.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for State();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307CE2AC(v2, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for State);
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      char v8 = 2;
      goto LABEL_11;
    case 2:
      uint64_t result = sub_2307CDF9C((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for State);
      char v8 = 3;
      goto LABEL_11;
    case 3:
      uint64_t result = sub_2307CDF9C((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for State);
      char v8 = 4;
      goto LABEL_11;
    case 4:
      *a1 = 5;
      return sub_2307CDF9C((uint64_t)v6, type metadata accessor for AppInstallation);
    case 5:
      char v8 = 7;
      goto LABEL_11;
    case 6:
      *a1 = 0;
      return result;
    case 7:
      char v8 = 6;
      goto LABEL_11;
    case 8:
      char v8 = 8;
      goto LABEL_11;
    default:
      char v8 = 1;
LABEL_11:
      *a1 = v8;
      return result;
  }
}

double sub_2307D0C0C@<D0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v3 = *a1;
  if (qword_26AF240A0 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_26AF25990;
  if (*(void *)(qword_26AF25990 + 16) && (unint64_t v5 = sub_2307D0CA8(v3), (v6 & 1) != 0))
  {
    sub_2307CDEC4(*(void *)(v4 + 56) + 40 * v5, a2);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

unint64_t sub_2307D0CA8(unsigned __int8 a1)
{
  sub_230812958();
  sub_2307D0D14();
  uint64_t v2 = sub_230812998();
  return sub_2307D0E50(a1, v2);
}

uint64_t sub_2307D0D14()
{
  sub_230812468();
  return swift_bridgeObjectRelease();
}

unint64_t sub_2307D0E50(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xE700000000000000;
      uint64_t v8 = 0x656C6261797562;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          uint64_t v8 = 0x676E6974696177;
          break;
        case 2:
          uint64_t v8 = 0x6573616863727570;
          goto LABEL_10;
        case 3:
          unint64_t v7 = 0xE900000000000065;
          uint64_t v8 = 0x6C62617461647075;
          break;
        case 4:
          uint64_t v8 = 0x64616F6C6E776F64;
          unint64_t v7 = 0xEC000000656C6261;
          break;
        case 5:
          uint64_t v8 = 0x696C6C6174736E69;
          unint64_t v7 = 0xEA0000000000676ELL;
          break;
        case 6:
          uint64_t v8 = 0x656C6C6174736E69;
LABEL_10:
          unint64_t v7 = 0xE900000000000064;
          break;
        case 7:
          unint64_t v7 = 0xE800000000000000;
          uint64_t v8 = 0x656C62616E65706FLL;
          break;
        case 8:
          uint64_t v8 = 0x6E776F6E6B6E75;
          break;
        default:
          break;
      }
      unint64_t v9 = 0xE700000000000000;
      uint64_t v10 = 0x656C6261797562;
      switch(v6)
      {
        case 1:
          if (v8 == 0x676E6974696177) {
            goto LABEL_28;
          }
          goto LABEL_29;
        case 2:
          uint64_t v11 = 0x6573616863727570;
          goto LABEL_24;
        case 3:
          unint64_t v9 = 0xE900000000000065;
          if (v8 != 0x6C62617461647075) {
            goto LABEL_29;
          }
          goto LABEL_28;
        case 4:
          unint64_t v9 = 0xEC000000656C6261;
          if (v8 != 0x64616F6C6E776F64) {
            goto LABEL_29;
          }
          goto LABEL_28;
        case 5:
          unint64_t v9 = 0xEA0000000000676ELL;
          if (v8 != 0x696C6C6174736E69) {
            goto LABEL_29;
          }
          goto LABEL_28;
        case 6:
          uint64_t v11 = 0x656C6C6174736E69;
LABEL_24:
          unint64_t v9 = 0xE900000000000064;
          if (v8 != v11) {
            goto LABEL_29;
          }
          goto LABEL_28;
        case 7:
          unint64_t v9 = 0xE800000000000000;
          uint64_t v10 = 0x656C62616E65706FLL;
          goto LABEL_27;
        case 8:
          if (v8 != 0x6E776F6E6B6E75) {
            goto LABEL_29;
          }
          goto LABEL_28;
        default:
LABEL_27:
          if (v8 != v10) {
            goto LABEL_29;
          }
LABEL_28:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_29:
          char v12 = sub_230812878();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v12) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

uint64_t sub_2307D1160@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  unint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = *a2;
  uint64_t v13 = a2[1];
  uint64_t v15 = a2[2];
  uint64_t v14 = a2[3];
  uint64_t v16 = a2[4];
  uint64_t v34 = a2[5];
  uint64_t v17 = a2[6];
  sub_2307D2750(a1, (uint64_t)&v29 - v10);
  if (v16)
  {
    uint64_t v33 = v17;
    int64_t v35 = a3;
    sub_2307D5154((uint64_t)v11, (uint64_t)v9, &qword_26AF24868);
    uint64_t v18 = type metadata accessor for State();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v19 + 48))(v9, 1, v18) == 1)
    {
      sub_2307CDF28((uint64_t)v9, &qword_26AF24868);
    }
    else if (swift_getEnumCaseMultiPayload() == 1)
    {
      if ((*v9 & 1) == 0 && (v12 & 4) == 0)
      {
        uint64_t v31 = v13;
        uint64_t v32 = v12;
        uint64_t v38 = v12;
        unint64_t v39 = (BOOL (*)())v13;
        LOBYTE(v40) = v15 & 1;
        uint64_t v41 = v14;
        uint64_t v42 = v16;
        uint64_t v43 = v34;
        uint64_t v44 = v33;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v38 = sub_2307E31E4();
        unint64_t v39 = v22;
        uint64_t v36 = 38;
        unint64_t v37 = 0xE100000000000000;
        sub_2307F26C4();
        uint64_t v23 = sub_2308126D8();
        swift_bridgeObjectRelease();
        uint64_t v38 = v23;
        unint64_t v39 = sub_2307E3374;
        uint64_t v40 = 0;
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268702F38);
        sub_2307F2718();
        uint64_t v24 = sub_230812428();
        uint64_t v30 = v25;
        swift_bridgeObjectRelease();
        sub_2307CFCE0(v32, v31, v15, v14, v16);
        sub_2307CDF28((uint64_t)v11, &qword_26AF24868);
        uint64_t v26 = v35;
        uint64_t v27 = v30;
        *int64_t v35 = v24;
        v26[1] = v27;
        swift_storeEnumTagMultiPayload();
        return (*(uint64_t (**)(uint64_t *, void, uint64_t, uint64_t))(v19 + 56))(v26, 0, 1, v18);
      }
    }
    else
    {
      sub_2307CDFFC((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for State);
    }
    uint64_t v20 = (uint64_t)v11;
    uint64_t v21 = (uint64_t)v35;
  }
  else
  {
    uint64_t v20 = (uint64_t)v11;
    uint64_t v21 = (uint64_t)a3;
  }
  return sub_2307D1F58(v20, v21);
}

uint64_t sub_2307D1460@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, void *a4@<X3>, unsigned char *a5@<X8>)
{
  v61 = a5;
  *(void *)&long long v58 = *a4;
  int v8 = a2 & 1;
  uint64_t v9 = sub_230812178();
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v59 = (uint64_t)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  unint64_t v60 = (char *)v51 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v56 = (uint64_t)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v51 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)v51 - v19;
  uint64_t v21 = type metadata accessor for State();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v62 = (ValueMetadata *)MEMORY[0x270FA5388](v21);
  uint64_t v63 = (uint64_t)v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = a1;
  uint64_t v24 = *a1;
  if (*(void *)(v24 + 16))
  {
    int v25 = v8;
    unint64_t v26 = sub_2307D0570(v8);
    if (v27)
    {
      sub_2307CE248(*(void *)(v24 + 56) + *(void *)(v22 + 72) * v26, (uint64_t)v20);
      unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, ValueMetadata *))(v22 + 56);
      uint64_t v29 = v20;
      uint64_t v30 = 0;
    }
    else
    {
      unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, ValueMetadata *))(v22 + 56);
      uint64_t v29 = v20;
      uint64_t v30 = 1;
    }
    uint64_t v21 = (uint64_t)v62;
    v28(v29, v30, 1, v62);
  }
  else
  {
    int v25 = v8;
    unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, ValueMetadata *))(v22 + 56);
    v28(v20, 1, 1, (ValueMetadata *)v21);
  }
  sub_2307D1F58((uint64_t)v20, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v18, 1, v21) == 1)
  {
    uint64_t v31 = v63;
    swift_storeEnumTagMultiPayload();
    sub_2307CDF28((uint64_t)v18, &qword_26AF24868);
  }
  else
  {
    uint64_t v31 = v63;
    sub_2307CE37C((uint64_t)v18, v63);
  }
  if (_s8AppState0B0O2eeoiySbAC_ACtFZ_0(v31, a3))
  {
    uint64_t result = sub_2307CDFFC(v31, (uint64_t (*)(void))type metadata accessor for State);
    unsigned char *v61 = 1;
  }
  else
  {
    uint64_t v33 = a4[8];
    uint64_t v34 = a4[9];
    __swift_project_boxed_opaque_existential_1(a4 + 5, v33);
    char v69 = v25;
    (*(void (**)(long long *__return_ptr, char *, uint64_t, uint64_t, uint64_t))(v34 + 8))(&v64, &v69, a3, v33, v34);
    if (MetatypeMetadata)
    {
      LODWORD(v55) = v25;
      sub_2307CDF84(&v64, (uint64_t)v66);
      int64_t v35 = v67;
      uint64_t v36 = v68;
      __swift_project_boxed_opaque_existential_1(v66, (uint64_t)v67);
      uint64_t v37 = v63;
      if ((*(uint64_t (**)(uint64_t, uint64_t, ValueMetadata *, uint64_t))(v36 + 8))(v63, a3, v35, v36))
      {
        uint64_t v38 = v56;
        sub_2307D348C(v37, v56);
        v28((char *)v38, 0, 1, v62);
        sub_2307D01FC(v38, v55);
        sub_2307CDFFC(v37, (uint64_t (*)(void))type metadata accessor for State);
        unsigned char *v61 = 1;
      }
      else
      {
        uint64_t v57 = a4 + 10;
        uint64_t v52 = a4[13];
        unint64_t v53 = (void *)a4[14];
        v51[1] = __swift_project_boxed_opaque_existential_1(a4 + 10, v52);
        v51[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
        uint64_t v42 = *(unsigned __int8 *)(*(void *)(sub_230812198() - 8) + 80);
        uint64_t v54 = (v42 + 32) & ~v42;
        uint64_t v56 = v42 | 7;
        *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
        sub_230812168();
        sub_230812158();
        MetatypeMetadata = (ValueMetadata *)v58;
        *(void *)&long long v64 = a4;
        swift_retain();
        sub_230812128();
        sub_2307CDF28((uint64_t)&v64, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        sub_230812188();
        sub_230812168();
        sub_230812158();
        uint64_t v43 = a4[2];
        MetatypeMetadata = &type metadata for AdamID;
        *(void *)&long long v64 = v43;
        sub_230812128();
        sub_2307CDF28((uint64_t)&v64, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        MetatypeMetadata = &type metadata for App.Kind;
        LOBYTE(v64) = v55;
        sub_230812128();
        sub_2307CDF28((uint64_t)&v64, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        __swift_project_boxed_opaque_existential_1(v66, (uint64_t)v67);
        uint64_t DynamicType = swift_getDynamicType();
        MetatypeMetadata = (ValueMetadata *)swift_getMetatypeMetadata();
        *(void *)&long long v64 = DynamicType;
        sub_230812128();
        sub_2307CDF28((uint64_t)&v64, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        sub_230812188();
        sub_2308122D8();
        swift_bridgeObjectRelease();
        uint64_t v45 = a4[13];
        uint64_t v55 = a4[14];
        v46 = __swift_project_boxed_opaque_existential_1(v57, v45);
        uint64_t v59 = a3;
        unint64_t v53 = v46;
        uint64_t v47 = swift_allocObject();
        long long v58 = xmmword_230813840;
        *(_OWORD *)(v47 + 16) = xmmword_230813840;
        sub_230812168();
        sub_230812158();
        int64_t v48 = v62;
        MetatypeMetadata = v62;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v64);
        sub_2307CE248(v63, (uint64_t)boxed_opaque_existential_0);
        sub_230812128();
        sub_2307CDF28((uint64_t)&v64, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        sub_230812188();
        sub_2308122D8();
        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_1(v57, a4[13]);
        *(_OWORD *)(swift_allocObject() + 16) = v58;
        sub_230812168();
        sub_230812158();
        MetatypeMetadata = v48;
        uint64_t v50 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v64);
        sub_2307CE248(v59, (uint64_t)v50);
        sub_230812128();
        sub_2307CDF28((uint64_t)&v64, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        sub_230812188();
        sub_2308122D8();
        swift_bridgeObjectRelease();
        sub_2307CDFFC(v63, (uint64_t (*)(void))type metadata accessor for State);
        unsigned char *v61 = 0;
      }
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
    }
    else
    {
      sub_2307CDF28((uint64_t)&v64, &qword_268702D58);
      uint64_t v39 = a4[13];
      uint64_t v57 = (void *)a4[14];
      uint64_t v56 = (uint64_t)__swift_project_boxed_opaque_existential_1(a4 + 10, v39);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
      sub_230812198();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
      sub_230812168();
      sub_230812158();
      unint64_t v67 = (ValueMetadata *)v58;
      v66[0] = (uint64_t)a4;
      swift_retain();
      sub_230812128();
      sub_2307CDF28((uint64_t)v66, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      sub_230812188();
      sub_230812168();
      sub_230812158();
      uint64_t v40 = a4[2];
      unint64_t v67 = &type metadata for AdamID;
      v66[0] = v40;
      sub_230812128();
      sub_2307CDF28((uint64_t)v66, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      unint64_t v67 = &type metadata for App.Kind;
      LOBYTE(v66[0]) = v25;
      sub_230812128();
      sub_2307CDF28((uint64_t)v66, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      unint64_t v67 = v62;
      uint64_t v41 = __swift_allocate_boxed_opaque_existential_0(v66);
      sub_2307CE248(a3, (uint64_t)v41);
      sub_230812128();
      sub_2307CDF28((uint64_t)v66, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      sub_230812188();
      sub_2308122D8();
      swift_bridgeObjectRelease();
      uint64_t result = sub_2307CDFFC(v63, (uint64_t (*)(void))type metadata accessor for State);
      unsigned char *v61 = 0;
    }
  }
  return result;
}

uint64_t sub_2307D1F58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s8AppState0B0O2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = a2;
  uint64_t v3 = type metadata accessor for AppInstallation(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v45 = (uint64_t *)((char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for State();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v46 = (uint64_t)&v44 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t *)((char *)&v44 - v12);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (uint64_t *)((char *)&v44 - v15);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v44 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (unsigned __int8 *)&v44 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF248F0);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  int v25 = (char *)&v44 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = (uint64_t)&v25[*(int *)(v23 + 56)];
  sub_2307CE2AC(a1, (uint64_t)v25, (uint64_t (*)(void))type metadata accessor for State);
  sub_2307CE2AC(v47, v26, (uint64_t (*)(void))type metadata accessor for State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2307CE2AC((uint64_t)v25, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for State);
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_45;
      }
      char v28 = *v19 ^ *(unsigned char *)v26;
      sub_2307CDF9C((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for State);
      char v27 = v28 ^ 1;
      return v27 & 1;
    case 2u:
      sub_2307CE2AC((uint64_t)v25, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for State);
      uint64_t v30 = *v16;
      uint64_t v29 = v16[1];
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_14;
      }
      goto LABEL_7;
    case 3u:
      sub_2307CE2AC((uint64_t)v25, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for State);
      uint64_t v30 = *v13;
      uint64_t v29 = v13[1];
      if (swift_getEnumCaseMultiPayload() != 3)
      {
LABEL_14:
        swift_bridgeObjectRelease();
        goto LABEL_45;
      }
LABEL_7:
      if (v30 == *(void *)v26 && v29 == *(void *)(v26 + 8))
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v32 = sub_230812878();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v32 & 1) == 0) {
          goto LABEL_35;
        }
      }
LABEL_43:
      sub_2307CDF9C((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for State);
      char v27 = 1;
      return v27 & 1;
    case 4u:
      uint64_t v33 = v46;
      sub_2307CE2AC((uint64_t)v25, v46, (uint64_t (*)(void))type metadata accessor for State);
      if (swift_getEnumCaseMultiPayload() == 4)
      {
        uint64_t v34 = v45;
        sub_2307E6C84(v26, (uint64_t)v45, type metadata accessor for AppInstallation);
        char v27 = _s8AppState0A12InstallationV2eeoiySbAC_ACtFZ_0(v33, v34);
        sub_2307CDF9C((uint64_t)v34, type metadata accessor for AppInstallation);
        sub_2307CDF9C(v33, type metadata accessor for AppInstallation);
        goto LABEL_50;
      }
      sub_2307CDF9C(v33, type metadata accessor for AppInstallation);
LABEL_45:
      sub_2307CDF28((uint64_t)v25, &qword_26AF248F0);
      goto LABEL_46;
    case 5u:
      sub_2307CE2AC((uint64_t)v25, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for State);
      uint64_t v35 = *((void *)v8 + 1);
      if (swift_getEnumCaseMultiPayload() != 5) {
        goto LABEL_45;
      }
      uint64_t v36 = *(void *)(v26 + 8);
      if (*v8) {
        uint64_t v37 = 0x736567617373656DLL;
      }
      else {
        uint64_t v37 = 7368801;
      }
      if (*v8) {
        unint64_t v38 = 0xE800000000000000;
      }
      else {
        unint64_t v38 = 0xE300000000000000;
      }
      if (*(unsigned char *)v26) {
        uint64_t v39 = 0x736567617373656DLL;
      }
      else {
        uint64_t v39 = 7368801;
      }
      if (*(unsigned char *)v26) {
        unint64_t v40 = 0xE800000000000000;
      }
      else {
        unint64_t v40 = 0xE300000000000000;
      }
      if (v37 == v39 && v38 == v40)
      {
        swift_bridgeObjectRelease_n();
LABEL_49:
        char v27 = v35 == v36;
LABEL_50:
        sub_2307CDF9C((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for State);
        return v27 & 1;
      }
      char v42 = sub_230812878();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v42) {
        goto LABEL_49;
      }
LABEL_35:
      sub_2307CDF9C((uint64_t)v25, (uint64_t (*)(void))type metadata accessor for State);
LABEL_46:
      char v27 = 0;
      return v27 & 1;
    case 6u:
      if (swift_getEnumCaseMultiPayload() != 6) {
        goto LABEL_45;
      }
      goto LABEL_43;
    case 7u:
      if (swift_getEnumCaseMultiPayload() != 7) {
        goto LABEL_45;
      }
      goto LABEL_43;
    case 8u:
      if (swift_getEnumCaseMultiPayload() != 8) {
        goto LABEL_45;
      }
      goto LABEL_43;
    default:
      sub_2307CE2AC((uint64_t)v25, (uint64_t)v21, (uint64_t (*)(void))type metadata accessor for State);
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_45;
      }
      char v27 = sub_2307E4AFC(*v21, *(unsigned char *)v26);
      goto LABEL_50;
  }
}

uint64_t type metadata accessor for AppInstallation(uint64_t a1)
{
  return sub_2307D3890(a1, qword_26AF24778);
}

uint64_t sub_2307D25CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v11 - v8;
  sub_2307CE248(a2, (uint64_t)&v11 - v8);
  if (swift_getEnumCaseMultiPayload() == 5)
  {
    sub_2307CE248(a1, (uint64_t)v7);
    swift_getEnumCaseMultiPayload();
    return 1;
  }
  else
  {
    sub_2307CE05C((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for State);
    return 0;
  }
}

uint64_t sub_2307D2750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24870);
  MEMORY[0x270FA5388](v38);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for State();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v29 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v29 - v17;
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  uint64_t v36 = v7 + 56;
  v35((char *)&v29 - v17, 1, 1, v6);
  uint64_t v19 = *(void *)(a1 + 16);
  if (!v19) {
    goto LABEL_15;
  }
  uint64_t v31 = v7;
  char v32 = v13;
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v20 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  uint64_t v21 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  uint64_t v37 = *(void *)(v7 + 72);
  swift_bridgeObjectRetain();
  uint64_t v30 = v19;
  while (1)
  {
    sub_2307CE2AC(v20, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for State);
    uint64_t v26 = (uint64_t)&v5[*(int *)(v38 + 48)];
    sub_2307D2C64((uint64_t)v18, (uint64_t)v5);
    sub_2307CE2AC((uint64_t)v9, v26, (uint64_t (*)(void))type metadata accessor for State);
    if ((*v21)(v5, 1, v6) == 1)
    {
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (!EnumCaseMultiPayload)
      {
        sub_2307CDF28((uint64_t)v18, &qword_26AF24868);
        sub_2307E6C84((uint64_t)v9, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for State);
        v35(v18, 0, 1, v6);
        int v25 = &qword_26AF24868;
        goto LABEL_6;
      }
    }
    else
    {
      sub_2307D2C64((uint64_t)v5, (uint64_t)v16);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_2307CDF9C((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for State);
        uint64_t v24 = (uint64_t)v16;
        goto LABEL_5;
      }
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    }
    int v23 = EnumCaseMultiPayload;
    uint64_t v24 = (uint64_t)v9;
    if (v23 == 4) {
      break;
    }
LABEL_5:
    sub_2307CDF9C(v24, (uint64_t (*)(void))type metadata accessor for State);
    int v25 = &qword_26AF24870;
LABEL_6:
    sub_2307CDF28((uint64_t)v5, v25);
    v20 += v37;
    if (!--v19)
    {
      a1 = v33;
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
  }
  a1 = v33;
  swift_bridgeObjectRelease();
  sub_2307CDF28((uint64_t)v18, &qword_26AF24868);
  sub_2307CDF9C(v26, type metadata accessor for AppInstallation);
  sub_2307CDF28((uint64_t)v5, &qword_26AF24868);
  sub_2307E6C84((uint64_t)v9, (uint64_t)v18, (uint64_t (*)(void))type metadata accessor for State);
  v35(v18, 0, 1, v6);
LABEL_14:
  a2 = v34;
  uint64_t v7 = v31;
  uint64_t v13 = v32;
  uint64_t v19 = v30;
LABEL_15:
  sub_2307D2C64((uint64_t)v18, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    if (v19)
    {
      sub_2307CE2AC(a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), a2, (uint64_t (*)(void))type metadata accessor for State);
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = 1;
    }
    v35((char *)a2, v27, 1, v6);
    sub_2307CDF28((uint64_t)v18, &qword_26AF24868);
    return sub_2307CDF28((uint64_t)v13, &qword_26AF24868);
  }
  else
  {
    sub_2307CDF28((uint64_t)v18, &qword_26AF24868);
    sub_2307E6C84((uint64_t)v13, a2, (uint64_t (*)(void))type metadata accessor for State);
    return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v35)(a2, 0, 1, v6);
  }
}

uint64_t sub_2307D2C64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2307D2CCC@<X0>(void *a1@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for AppInstallation.Phase(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (uint64_t *)((char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v48 - v10;
  uint64_t v12 = type metadata accessor for AppInstallation.Progress(0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v48 - v16;
  id v18 = objc_msgSend(a1, sel_progress);
  if (v18)
  {
    int v49 = a2;
    id v19 = v18;
    sub_230812038();
    objc_msgSend(v19, sel_fractionCompleted);
    *(void *)&v17[*(int *)(v12 + 20)] = v20;
    *(void *)&v17[*(int *)(v12 + 24)] = v19;
    switch((unint64_t)objc_msgSend(a1, sel_progressPhase))
    {
      case 0uLL:
        id v28 = objc_msgSend(a1, sel_installError);
        if (!v28) {
          goto LABEL_12;
        }

        goto LABEL_11;
      case 1uLL:
LABEL_11:
        sub_2307E4784((uint64_t)v17, type metadata accessor for AppInstallation.Progress);

        goto LABEL_23;
      case 2uLL:
        id v48 = v19;
        id v29 = objc_msgSend(a1, sel_downloadProgress);
        if (v29)
        {
          uint64_t v30 = v29;
          id v22 = a1;
          id v23 = v30;
          sub_230812038();
          [v23 (SEL)0x264A73A58];
          *(void *)&v11[*(int *)(v12 + 20)] = v31;
          *(void *)&v11[*(int *)(v12 + 24)] = v23;
LABEL_18:
          swift_storeEnumTagMultiPayload();
          sub_2307DF874((uint64_t)v17, (uint64_t)v15, type metadata accessor for AppInstallation.Progress);
          type metadata accessor for AppInstallation.ASDAppStore();
          uint64_t v34 = swift_allocObject();
          *(void *)(v34 + 16) = v22;
          *(void *)a3 = v34;
          uint64_t v35 = (int *)type metadata accessor for AppInstallation(0);
          sub_2307DF874((uint64_t)v11, (uint64_t)&a3[v35[5]], type metadata accessor for AppInstallation.Phase);
          sub_2307DF874((uint64_t)v15, (uint64_t)&a3[v35[6]], type metadata accessor for AppInstallation.Progress);
          id v36 = v22;
          a3[v35[7]] = objc_msgSend(v36, sel_hasPostProcessing);
          *(void *)&a3[v35[8]] = objc_msgSend(v36, sel_essentialBackgroundAssetDownloadEstimate);
          a3[v35[9]] = v49 & 1;
          id v37 = objc_msgSend(v36, sel_storeExternalVersionID);

          sub_2307E4784((uint64_t)v15, type metadata accessor for AppInstallation.Progress);
          sub_2307E4784((uint64_t)v11, type metadata accessor for AppInstallation.Phase);

          *(void *)&a3[v35[10]] = v37;
          uint64_t v38 = (uint64_t)v17;
LABEL_21:
          sub_2307E4784(v38, type metadata accessor for AppInstallation.Progress);
          uint64_t v47 = type metadata accessor for State();
        }
        else
        {
          sub_2307E4784((uint64_t)v17, type metadata accessor for AppInstallation.Progress);

LABEL_23:
          *a3 = 0;
          uint64_t v47 = type metadata accessor for State();
        }
        swift_storeEnumTagMultiPayload();
        uint64_t result = (*(uint64_t (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(a3, 0, 1, v47);
        break;
      case 3uLL:
      case 4uLL:
        id v48 = v19;
        id v21 = objc_msgSend(a1, sel_installProgress);
        if (!v21) {
          id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB8]), sel_init);
        }
        id v22 = a1;
        id v23 = v21;
        sub_230812038();
        objc_msgSend(v23, sel_fractionCompleted);
        *(void *)&v11[*(int *)(v12 + 20)] = v24;
        *(void *)&v11[*(int *)(v12 + 24)] = v23;
        goto LABEL_18;
      case 5uLL:
        id v48 = v19;
        id v32 = objc_msgSend(a1, sel_postProcessProgress);
        if (!v32) {
          id v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08AB8]), sel_init);
        }
        id v22 = a1;
        id v23 = v32;
        sub_230812038();
        [v23 (SEL)0x264A73A58];
        *(void *)&v11[*(int *)(v12 + 20)] = v33;
        *(void *)&v11[*(int *)(v12 + 24)] = v23;
        goto LABEL_18;
      case 6uLL:
        sub_2307E4784((uint64_t)v17, type metadata accessor for AppInstallation.Progress);

        uint64_t v39 = type metadata accessor for State();
        return (*(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(a3, 1, 1, v39);
      case 7uLL:
        sub_2307E4638(a1, (uint64_t)v17, (uint64_t)v11);
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24630);
        unint64_t v40 = v19;
        uint64_t v41 = swift_allocBox();
        sub_2307DF874((uint64_t)v11, v42, type metadata accessor for AppInstallation.Phase);
        *uint64_t v9 = v41;
        swift_storeEnumTagMultiPayload();
        sub_2307DF874((uint64_t)v17, (uint64_t)v15, type metadata accessor for AppInstallation.Progress);
        type metadata accessor for AppInstallation.ASDAppStore();
        uint64_t v43 = swift_allocObject();
        *(void *)(v43 + 16) = a1;
        *(void *)a3 = v43;
        uint64_t v44 = (int *)type metadata accessor for AppInstallation(0);
        sub_2307DF874((uint64_t)v9, (uint64_t)&a3[v44[5]], type metadata accessor for AppInstallation.Phase);
        sub_2307DF874((uint64_t)v15, (uint64_t)&a3[v44[6]], type metadata accessor for AppInstallation.Progress);
        id v45 = a1;
        a3[v44[7]] = objc_msgSend(v45, sel_hasPostProcessing);
        *(void *)&a3[v44[8]] = objc_msgSend(v45, sel_essentialBackgroundAssetDownloadEstimate);
        a3[v44[9]] = v49 & 1;
        id v46 = objc_msgSend(v45, sel_storeExternalVersionID);
        sub_2307E4784((uint64_t)v15, type metadata accessor for AppInstallation.Progress);
        sub_2307E4784((uint64_t)v9, type metadata accessor for AppInstallation.Phase);

        *(void *)&a3[v44[10]] = v46;
        sub_2307E4784((uint64_t)v11, type metadata accessor for AppInstallation.Phase);
        uint64_t v38 = (uint64_t)v17;
        goto LABEL_21;
      default:
LABEL_12:
        sub_2307E4250(a1, v49 & 1, a3);

        return sub_2307E4784((uint64_t)v17, type metadata accessor for AppInstallation.Progress);
    }
  }
  else
  {
    uint64_t v25 = type metadata accessor for State();
    uint64_t v26 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56);
    return v26(a3, 1, 1, v25);
  }
  return result;
}

uint64_t sub_2307D348C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v3 = type metadata accessor for AppInstallation.Phase(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for State();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v34 - v13;
  uint64_t v15 = type metadata accessor for AppInstallation(0);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  id v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  id v21 = (char *)&v34 - v20;
  MEMORY[0x270FA5388](v19);
  id v23 = (char *)&v34 - v22;
  sub_2307CE2AC(a1, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for State);
  if (swift_getEnumCaseMultiPayload() == 4)
  {
    uint64_t v34 = v8;
    uint64_t v35 = v5;
    sub_2307E6C84((uint64_t)v14, (uint64_t)v23, type metadata accessor for AppInstallation);
    uint64_t v24 = v36;
    sub_2307CE2AC((uint64_t)v36, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for State);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v26 = v37;
    if (EnumCaseMultiPayload == 4)
    {
      id v36 = type metadata accessor for AppInstallation;
      sub_2307E6C84((uint64_t)v12, (uint64_t)v21, type metadata accessor for AppInstallation);
      sub_2307CE2AC((uint64_t)v21, (uint64_t)v18, type metadata accessor for AppInstallation);
      uint64_t v27 = *(int *)(v15 + 24);
      id v28 = &v23[v27];
      uint64_t v29 = (uint64_t)v34;
      sub_2307CE2AC((uint64_t)&v21[v27], (uint64_t)v34, type metadata accessor for AppInstallation.Progress);
      uint64_t v30 = sub_230812048();
      (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v30 - 8) + 24))(v29, v28, v30);
      uint64_t v31 = (uint64_t)&v18[*(int *)(v15 + 24)];
      sub_2307CDF9C(v31, type metadata accessor for AppInstallation.Progress);
      sub_2307E6C84(v29, v31, type metadata accessor for AppInstallation.Progress);
      id v32 = v35;
      sub_2307DE398((uint64_t)&v23[*(int *)(v15 + 20)], v35);
      sub_2307E6C20((uint64_t)v32, (uint64_t)&v18[*(int *)(v15 + 20)]);
      sub_2307E6C84((uint64_t)v18, v26, v36);
      sub_2307CDF9C((uint64_t)v21, type metadata accessor for AppInstallation);
      sub_2307CDF9C((uint64_t)v23, type metadata accessor for AppInstallation);
      return swift_storeEnumTagMultiPayload();
    }
    sub_2307CDF9C((uint64_t)v23, type metadata accessor for AppInstallation);
  }
  else
  {
    uint64_t v12 = v14;
    uint64_t v24 = v36;
    uint64_t v26 = v37;
  }
  sub_2307CDF9C((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for State);
  return sub_2307CE2AC((uint64_t)v24, v26, (uint64_t (*)(void))type metadata accessor for State);
}

uint64_t sub_2307D3890(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for AppInstallation.Progress(uint64_t a1)
{
  return sub_2307D3890(a1, qword_26AF246E0);
}

uint64_t type metadata accessor for AppInstallation.Phase(uint64_t a1)
{
  return sub_2307D3890(a1, qword_26AF24638);
}

double sub_2307D3908@<D0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2307CFF18(a1, a2);
}

uint64_t sub_2307D392C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24608);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)a1;
  char v10 = *(unsigned char *)(a1 + 8);
  uint64_t v24 = *(void *)a1;
  uint64_t v11 = sub_2307CF19C(&v24);
  uint64_t v12 = v11[4];
  char v21 = v10;
  uint64_t v20 = a2;
  uint64_t v22 = a2;
  id v23 = v11;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v12 + 24));
  sub_2307D3AD0((void *)(v12 + 16), &v24);
  os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 24));
  uint64_t v13 = v24;
  swift_release();
  swift_release();
  if (v13 == 1)
  {
    uint64_t v14 = *(void **)(v3 + 136);
    uint64_t v24 = v9;
    char v25 = v10;
    id v15 = v14;
    unsigned int v16 = objc_msgSend(v15, sel_containsObject_, sub_2308128A8());

    swift_unknownObjectRelease();
    if (v16)
    {
      uint64_t v17 = (uint64_t)&v8[*(int *)(v6 + 48)];
      *(void *)uint64_t v8 = v9;
      v8[8] = v10;
      sub_2307CE248(v20, v17);
      sub_2308120F8();
      sub_2307CDF28((uint64_t)v8, &qword_26AF24608);
    }
  }
  return v13;
}

uint64_t sub_2307D3AD0@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2307D3AE8(a1, a2);
}

uint64_t sub_2307D3AE8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2307D1460(a1, *(unsigned char *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), a2);
}

void sub_2307D3B08(uint64_t a1@<X8>)
{
}

void sub_2307D3B20(uint64_t a1@<X8>)
{
  sub_2307D3B48(*(unsigned char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40), *(void *)(v1 + 48), a1);
}

void sub_2307D3B48(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v38 = a5;
  uint64_t v39 = a1;
  uint64_t v40 = a6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for State();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v37 = (uint64_t)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  id v18 = (char *)&v34 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v34 - v19;
  swift_beginAccess();
  uint64_t v21 = *(void *)(a2 + 32);
  if (!*(void *)(v21 + 16) || (unint64_t v22 = sub_2307CF3B0(a3), (v23 & 1) == 0))
  {
    swift_endAccess();
    uint64_t v29 = 1;
LABEL_6:
    uint64_t v31 = v39;
    uint64_t v30 = v40;
    uint64_t v32 = v38;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v29, 1, v12);
    sub_2307CE248(v32, (uint64_t)v18);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    {
      sub_2307CE37C((uint64_t)v18, (uint64_t)v20);
      sub_2307CDF28((uint64_t)v11, &qword_26AF24868);
      if ((*v31 & 2) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
      sub_2307CDFFC((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for State);
      sub_2307CE37C((uint64_t)v11, (uint64_t)v20);
      if ((*v31 & 2) == 0) {
        goto LABEL_13;
      }
    }
    uint64_t v33 = v37;
    sub_2307CE248((uint64_t)v20, v37);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      swift_bridgeObjectRelease();
      swift_storeEnumTagMultiPayload();
LABEL_14:
      sub_2307CDFFC((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for State);
      return;
    }
    sub_2307CDFFC(v33, (uint64_t (*)(void))type metadata accessor for State);
LABEL_13:
    sub_2307CE248((uint64_t)v20, v30);
    goto LABEL_14;
  }
  char v24 = a4 & 1;
  uint64_t v25 = *(void *)(*(void *)(v21 + 56) + 8 * v22);
  uint64_t v26 = swift_endAccess();
  id v36 = &v34;
  uint64_t v27 = *(void *)(v25 + 32);
  MEMORY[0x270FA5388](v26);
  *((unsigned char *)&v34 - 16) = v24;
  uint64_t v35 = (uint64_t *)(v27 + 16);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v27 + 24));
  uint64_t v28 = v41;
  sub_2307CF73C(v35, (uint64_t)v11);
  if (!v28)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 24));
    swift_release();
    swift_release();
    uint64_t v29 = 0;
    goto LABEL_6;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 24));
  __break(1u);
}

uint64_t initializeBufferWithCopyOfBuffer for AdamID.Context(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_2307D3F04@<X0>(void (**a1)(uint64_t, uint64_t, uint64_t, unint64_t)@<X0>, void *a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X8>)
{
  unint64_t v116 = a3;
  v133 = a2;
  unint64_t v8 = type metadata accessor for State();
  uint64_t v138 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v118 = (uint64_t)&v113 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24878);
  MEMORY[0x270FA5388](v128);
  uint64_t v11 = (uint64_t *)((char *)&v113 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_230812178();
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  int64_t v117 = (char *)&v113 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v124 = (char *)&v113 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v125 = (uint64_t)&v113 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v113 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  v132 = (char *)&v113 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  unint64_t v142 = (uint64_t *)((char *)&v113 - v25);
  MEMORY[0x270FA5388](v24);
  uint64_t v141 = (uint64_t)&v113 - v26;
  uint64_t v154 = MEMORY[0x263F8EE88];
  unint64_t v153 = MEMORY[0x263F8EE88];
  unint64_t v27 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
LABEL_89:
    swift_bridgeObjectRetain();
    uint64_t result = sub_230812808();
    uint64_t v28 = result;
  }
  else
  {
    uint64_t v28 = *(void *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v137 = a1;
  unint64_t v144 = v8;
  uint64_t v115 = (void *)a5;
  uint64_t v114 = a4;
  unint64_t v113 = v27;
  if (v28)
  {
    if (v28 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v30 = 0;
    v135 = v133 + 2;
    uint64_t v123 = v133 + 21;
    uint64_t v139 = v133 + 20;
    unint64_t v134 = (unint64_t)a1 & 0xC000000000000001;
    uint64_t v31 = (unsigned int (**)(uint64_t *, uint64_t, unint64_t))(v138 + 48);
    uint64_t v126 = (void (**)(char *, uint64_t, uint64_t, unint64_t))(v138 + 56);
    a4 = 0x264A73000;
    unint64_t v122 = 0x8000000230815450;
    long long v121 = xmmword_230813840;
    unint64_t v120 = 0x80000002308154A0;
    int64_t v119 = v21;
    uint64_t v21 = v132;
    uint64_t v136 = v28;
    int64_t v140 = v138 + 48;
    uint64_t v127 = v11;
    while (1)
    {
      uint64_t v47 = v134 ? (char *)MEMORY[0x230FBF430](v30, a1) : (char *)a1[v30 + 4];
      id v48 = v47;
      uint64_t v49 = (uint64_t)objc_msgSend(v47, *(SEL *)(a4 + 1248), v113);
      sub_2307CDEC4((uint64_t)v135, (uint64_t)v150);
      uint64_t v143 = v48;
      if ((v49 & 0x8000000000000000) == 0) {
        break;
      }
      v149[0] = 0;
      v149[1] = 0xE000000000000000;
      sub_230812758();
      swift_bridgeObjectRelease();
      v149[0] = 0xD00000000000001DLL;
      v149[1] = v122;
      uint64_t v147 = v49;
      uint64_t v32 = MEMORY[0x263F8E5C0];
      sub_230812868();
      sub_230812478();
      swift_bridgeObjectRelease();
      uint64_t v33 = v149[0];
      uint64_t v34 = v149[1];
      sub_2307DAC7C();
      uint64_t v35 = swift_allocError();
      void *v36 = v33;
      v36[1] = v34;
      swift_willThrow();
      sub_2307CDEC4((uint64_t)v150, (uint64_t)v149);
      uint64_t v131 = v149[4];
      uint64_t v130 = __swift_project_boxed_opaque_existential_1(v149, v149[3]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
      uint64_t v37 = *(void *)(sub_230812198() - 8);
      unint64_t v38 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = v121;
      unint64_t v129 = v39 + v38;
      sub_230812168();
      sub_230812158();
      uint64_t v148 = v32;
      uint64_t v147 = v49;
      sub_230812128();
      sub_2307CDF28((uint64_t)&v147, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      swift_getErrorValue();
      uint64_t v40 = v145;
      uint64_t v41 = v146;
      uint64_t v148 = v146;
      uint64_t v42 = __swift_allocate_boxed_opaque_existential_0(&v147);
      uint64_t v43 = v40;
      uint64_t v21 = v132;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v42, v43, v41);
      sub_230812128();
      sub_2307CDF28((uint64_t)&v147, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      sub_230812188();
      uint64_t v31 = (unsigned int (**)(uint64_t *, uint64_t, unint64_t))v140;
      uint64_t v44 = v136;
      a1 = v137;
      sub_2308122D8();
      a4 = 0x264A73000uLL;
      uint64_t v45 = v44;
      swift_bridgeObjectRelease();
      id v46 = (void *)v35;
      unint64_t v8 = v144;

      sub_2307D5428((uint64_t)v150);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v149);

      uint64_t v131 = 0;
LABEL_7:
      if (v45 == ++v30)
      {
        swift_bridgeObjectRelease();
        unint64_t v27 = v153;
        goto LABEL_42;
      }
    }
    sub_2307D5428((uint64_t)v150);
    if ([v48 *(SEL *)(a4 + 1248)])
    {
      id v50 = objc_msgSend(v48, sel_bundleID);
      uint64_t v51 = sub_230812448();
      uint64_t v53 = v52;

      uint64_t v54 = v123;
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v149[0] = *v54;
      void *v54 = 0x8000000000000000;
      sub_2307D5450(v49, v51, v53, isUniquelyReferenced_nonNull_native);
      void *v54 = v149[0];
      uint64_t v31 = (unsigned int (**)(uint64_t *, uint64_t, unint64_t))v140;
      unint64_t v8 = v144;
      swift_bridgeObjectRelease();
      id v48 = v143;
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
    uint64_t v56 = v133;
    sub_2307D5B18(v48, v142);
    unsigned int v57 = objc_msgSend(v48, sel_isBetaApp);
    unsigned int v58 = v57;
    int v59 = *((unsigned __int8 *)v56 + 64);
    if (v59 == 2)
    {
      if ((v57 & 1) == 0) {
        goto LABEL_26;
      }
    }
    else
    {
      unint64_t v60 = (void *)v56[7];
      if (v59 == 3)
      {
        id v62 = objc_msgSend(v60, sel_predicate);
        id v63 = objc_msgSend(v62, sel_description);

        uint64_t v64 = sub_230812448();
        uint64_t v66 = v65;

        v150[0] = v64;
        v150[1] = v66;
        strcpy((char *)v149, "isBetaApp == 1");
        HIBYTE(v149[1]) = -18;
        sub_2307F26C4();
        int v61 = sub_2308126E8();
        sub_2307CB9CC(v60, 3);
        uint64_t v31 = (unsigned int (**)(uint64_t *, uint64_t, unint64_t))v140;
        swift_bridgeObjectRelease();
        sub_2307CB9CC(v60, 3);
LABEL_21:
        unint64_t v8 = v144;
        if ((v58 ^ v61)) {
          goto LABEL_26;
        }
        goto LABEL_24;
      }
      if (v59 == 4)
      {
        int v61 = v60 == (void *)1;
        goto LABEL_21;
      }
      unint64_t v8 = v144;
      if (v57) {
        goto LABEL_26;
      }
    }
LABEL_24:
    if ((*v31)(v142, 1, v8) != 1) {
      sub_2307D51B8(v150, v49);
    }
LABEL_26:
    unint64_t v67 = v139;
    swift_beginAccess();
    uint64_t v68 = *v67;
    if (*(void *)(*v67 + 16))
    {
      unint64_t v69 = sub_2307CF3B0(v49);
      uint64_t v70 = (uint64_t)v127;
      if (v71)
      {
        sub_2307CE248(*(void *)(v68 + 56) + *(void *)(v138 + 72) * v69, (uint64_t)v21);
        uint64_t v72 = 0;
      }
      else
      {
        uint64_t v72 = 1;
      }
    }
    else
    {
      uint64_t v72 = 1;
      uint64_t v70 = (uint64_t)v127;
    }
    (*v126)(v21, v72, 1, v8);
    swift_endAccess();
    uint64_t v73 = v70 + *(int *)(v128 + 48);
    sub_2307D5154((uint64_t)v21, v70, &qword_26AF24868);
    sub_2307D5154((uint64_t)v142, v73, &qword_26AF24868);
    uint64_t v74 = *v31;
    if ((*v31)((uint64_t *)v70, 1, v8) == 1)
    {
      sub_2307CDF28((uint64_t)v21, &qword_26AF24868);
      if (v74((uint64_t *)v73, 1, v8) == 1)
      {
        sub_2307CDF28(v70, &qword_26AF24868);
LABEL_39:

        sub_2307CDF28((uint64_t)v142, &qword_26AF24868);
        a4 = 0x264A73000;
        a1 = v137;
        uint64_t v45 = v136;
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v75 = (uint64_t)v119;
      sub_2307D5154(v70, (uint64_t)v119, &qword_26AF24868);
      if (v74((uint64_t *)v73, 1, v8) != 1)
      {
        uint64_t v81 = v118;
        sub_2307CE37C(v73, v118);
        char v82 = _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v75, v81);
        sub_2307E286C(v81);
        uint64_t v83 = (uint64_t)v132;
        sub_2307CDF28((uint64_t)v132, &qword_26AF24868);
        uint64_t v84 = v75;
        uint64_t v21 = (char *)v83;
        sub_2307E286C(v84);
        sub_2307CDF28(v70, &qword_26AF24868);
        if (v82) {
          goto LABEL_39;
        }
        goto LABEL_37;
      }
      uint64_t v76 = (uint64_t)v132;
      sub_2307CDF28((uint64_t)v132, &qword_26AF24868);
      uint64_t v77 = v75;
      uint64_t v21 = (char *)v76;
      sub_2307E286C(v77);
    }
    sub_2307CDF28(v70, &qword_26AF24878);
LABEL_37:
    uint64_t v78 = v142;
    uint64_t v79 = v125;
    sub_2307D5154((uint64_t)v142, v125, &qword_26AF24868);
    swift_beginAccess();
    sub_2307D5710(v79, v49);
    swift_endAccess();
    sub_2307D51B8(v150, v49);

    uint64_t v80 = (uint64_t)v78;
    uint64_t v31 = (unsigned int (**)(uint64_t *, uint64_t, unint64_t))v140;
    uint64_t v45 = v136;
    sub_2307CDF28(v80, &qword_26AF24868);
    a4 = 0x264A73000;
    a1 = v137;
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  unint64_t v27 = MEMORY[0x263F8EE88];
LABEL_42:
  uint64_t v11 = v133 + 20;
  swift_beginAccess();
  uint64_t v147 = MEMORY[0x263F8EE88];
  uint64_t v85 = swift_bridgeObjectRetain();
  uint64_t v86 = (uint64_t *)sub_2307D7D9C(v85);
  a5 = v116;
  if (v116)
  {
    uint64_t v87 = swift_bridgeObjectRetain();
    uint64_t v86 = (uint64_t *)sub_2308020B8(v87, (uint64_t)v86);
    swift_bridgeObjectRelease();
  }
  int64_t v88 = 0;
  uint64_t v89 = v86[7];
  uint64_t v139 = v86 + 7;
  uint64_t v90 = 1 << *((unsigned char *)v86 + 32);
  if (v90 < 64) {
    uint64_t v91 = ~(-1 << v90);
  }
  else {
    uint64_t v91 = -1;
  }
  unint64_t v8 = v91 & v89;
  int64_t v140 = (unint64_t)(v90 + 63) >> 6;
  uint64_t v143 = (char *)(v27 + 56);
  a1 = (void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(v138 + 56);
  unint64_t v142 = v86;
LABEL_50:
  while (v8)
  {
    unint64_t v94 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v95 = v94 | (v88 << 6);
LABEL_65:
    uint64_t v21 = *(char **)(v86[6] + 8 * v95);
    if (!*(void *)(v27 + 16)) {
      goto LABEL_72;
    }
    sub_230812958();
    a4 = (unint64_t)v150;
    sub_230812988();
    uint64_t v99 = sub_230812998();
    uint64_t v100 = -1 << *(unsigned char *)(v27 + 32);
    unint64_t v101 = v99 & ~v100;
    if (((*(void *)&v143[(v101 >> 3) & 0xFFFFFFFFFFFFFF8] >> v101) & 1) == 0) {
      goto LABEL_72;
    }
    uint64_t v102 = *(void *)(v27 + 48);
    if (*(char **)(v102 + 8 * v101) != v21)
    {
      uint64_t v103 = ~v100;
      while (1)
      {
        unint64_t v101 = (v101 + 1) & v103;
        if (((*(void *)&v143[(v101 >> 3) & 0xFFFFFFFFFFFFFF8] >> v101) & 1) == 0) {
          break;
        }
        if (*(char **)(v102 + 8 * v101) == v21) {
          goto LABEL_50;
        }
      }
LABEL_72:
      unint64_t v104 = sub_2307CF3B0((uint64_t)v21);
      if (v105)
      {
        a5 = v104;
        char v106 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v107 = *v11;
        v150[0] = *v11;
        *uint64_t v11 = 0x8000000000000000;
        if ((v106 & 1) == 0)
        {
          sub_230810E88();
          uint64_t v107 = v150[0];
        }
        uint64_t v93 = v141;
        sub_2307CE37C(*(void *)(v107 + 56) + *(void *)(v138 + 72) * a5, v141);
        sub_2308108D0(a5, v107);
        *uint64_t v11 = v107;
        swift_bridgeObjectRelease();
        uint64_t v92 = 0;
      }
      else
      {
        uint64_t v92 = 1;
        uint64_t v93 = v141;
      }
      (*a1)(v93, v92, 1, v144);
      sub_2307CDF28(v93, &qword_26AF24868);
      sub_2307D51B8(v150, (uint64_t)v21);
      a4 = (unint64_t)&v154;
      sub_2307D51B8(v150, (uint64_t)v21);
      uint64_t v86 = v142;
    }
  }
  if (__OFADD__(v88++, 1))
  {
    __break(1u);
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  if (v88 >= v140) {
    goto LABEL_80;
  }
  unint64_t v97 = v139[v88];
  if (v97)
  {
LABEL_64:
    unint64_t v8 = (v97 - 1) & v97;
    unint64_t v95 = __clz(__rbit64(v97)) + (v88 << 6);
    goto LABEL_65;
  }
  int64_t v98 = v88 + 1;
  if (v88 + 1 >= v140) {
    goto LABEL_80;
  }
  unint64_t v97 = v139[v98];
  if (v97) {
    goto LABEL_63;
  }
  int64_t v98 = v88 + 2;
  if (v88 + 2 >= v140) {
    goto LABEL_80;
  }
  unint64_t v97 = v139[v98];
  if (v97) {
    goto LABEL_63;
  }
  int64_t v98 = v88 + 3;
  if (v88 + 3 >= v140) {
    goto LABEL_80;
  }
  unint64_t v97 = v139[v98];
  if (v97)
  {
LABEL_63:
    int64_t v88 = v98;
    goto LABEL_64;
  }
  int64_t v98 = v88 + 4;
  if (v88 + 4 < v140)
  {
    unint64_t v97 = v139[v98];
    if (!v97)
    {
      while (1)
      {
        int64_t v88 = v98 + 1;
        if (__OFADD__(v98, 1)) {
          goto LABEL_88;
        }
        if (v88 >= v140) {
          goto LABEL_80;
        }
        unint64_t v97 = v139[v88];
        ++v98;
        if (v97) {
          goto LABEL_64;
        }
      }
    }
    goto LABEL_63;
  }
LABEL_80:
  swift_release();
  uint64_t v108 = v147;
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_2307D5154((uint64_t)(v133 + 14), (uint64_t)v150, (uint64_t *)&unk_26AF24A60);
  uint64_t v109 = v151;
  if (v151)
  {
    uint64_t v110 = v152;
    __swift_project_boxed_opaque_existential_1(v150, v151);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v110 + 32))(v108, v109, v110);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v150);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2307CDF28((uint64_t)v150, (uint64_t *)&unk_26AF24A60);
  }
  uint64_t v111 = (uint64_t)v133;
  __swift_project_boxed_opaque_existential_1(v133 + 2, v133[5]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  uint64_t v151 = v114;
  v150[0] = v111;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)v150, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  if (v113)
  {
    swift_bridgeObjectRetain();
    uint64_t v112 = sub_230812808();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v112 = *(void *)(((unint64_t)v137 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v151 = MEMORY[0x263F8D6C8];
  v150[0] = v112;
  sub_230812128();
  sub_2307CDF28((uint64_t)v150, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v115 = v154;
  return result;
}

uint64_t sub_2307D5154(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2307D51B8(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_230812958();
  sub_230812988();
  uint64_t v6 = sub_230812998();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_2307D52D8(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_2307D52D8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_2307D7200();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_23080C644();
      goto LABEL_14;
    }
    sub_2307D7B20();
  }
  uint64_t v8 = *v3;
  sub_230812958();
  sub_230812988();
  uint64_t result = sub_230812998();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_2308128B8();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

uint64_t sub_2307D5428(uint64_t a1)
{
  return a1;
}

uint64_t sub_2307D5450(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2307D55B4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_23081132C();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2307D74AC(result, a4 & 1);
  uint64_t result = sub_2307D55B4(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = sub_2308128C8();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;
  return swift_bridgeObjectRetain();
}

unint64_t sub_2307D55B4(uint64_t a1, uint64_t a2)
{
  sub_230812958();
  sub_230812468();
  uint64_t v4 = sub_230812998();
  return sub_2307D562C(a1, a2, v4);
}

unint64_t sub_2307D562C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_230812878() & 1) == 0)
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
      while (!v14 && (sub_230812878() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2307D5710(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for State();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_2307D71A0(a1);
    unint64_t v13 = sub_2307CF3B0(a2);
    if (v14)
    {
      unint64_t v15 = v13;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v17 = *v3;
      uint64_t v21 = *v3;
      *uint64_t v3 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_230810E88();
        uint64_t v17 = v21;
      }
      sub_2307CE37C(*(void *)(v17 + 56) + *(void *)(v10 + 72) * v15, (uint64_t)v8);
      sub_2308108D0(v15, v17);
      *uint64_t v3 = v17;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    }
    return sub_2307D71A0((uint64_t)v8);
  }
  else
  {
    sub_2307CE37C(a1, (uint64_t)v12);
    char v18 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2307D5938((uint64_t)v12, a2, v18);
    *uint64_t v3 = v21;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2307D5938(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_2307CF3B0(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_230810E88();
      goto LABEL_7;
    }
    sub_2307D77B8(v13, a3 & 1);
    unint64_t v20 = sub_2307CF3B0(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      unint64_t v10 = v20;
      char v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_2308128C8();
    __break(1u);
    return result;
  }
LABEL_7:
  char v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = v17 + *(void *)(*(void *)(type metadata accessor for State() - 8) + 72) * v10;
    return sub_230811DA8(a1, v18);
  }
LABEL_13:
  return sub_2307D5A84(v10, a2, a1, v16);
}

uint64_t sub_2307D5A84(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = type metadata accessor for State();
  uint64_t result = sub_2307CE37C(a3, v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_2307D5B18@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = (uint64_t)v2;
  uint64_t v6 = v2 + 2;
  uint64_t v7 = (ValueMetadata *)*v2;
  uint64_t v8 = sub_230812178();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  MEMORY[0x270FA5388](v9 - 8);
  BOOL v11 = (char *)&v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (ValueMetadata *)type metadata accessor for State();
  Description = (uint64_t (**)(void *, uint64_t, uint64_t, ValueMetadata *))v12[-1].Description;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v85 = (uint64_t)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v88 = (uint64_t)&v68 - v16;
  id v17 = objc_msgSend(a1, sel_storeItemID);
  sub_2307CDEC4((uint64_t)v6, (uint64_t)v93);
  sub_2307D6B0C((uint64_t)v17, (uint64_t)v93, (uint64_t)&v90);
  if (v91) {
    return Description[7](a2, 1, 1, v12);
  }
  uint64_t v86 = v7;
  uint64_t v19 = v90;
  uint64_t v83 = a2;
  uint64_t v84 = (void *)(v3 + 112);
  sub_2307D5154(v3 + 112, (uint64_t)v93, (uint64_t *)&unk_26AF24A60);
  unint64_t v20 = v94;
  uint64_t v87 = v12;
  uint64_t v81 = v19;
  if (v94)
  {
    uint64_t v21 = v95;
    __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
    uint64_t v89 = v19;
    (*(void (**)(uint64_t *__return_ptr, uint64_t *, ValueMetadata *, uint64_t))(v21 + 8))(&v90, &v89, v20, v21);
    uint64_t v22 = v90;
    uint64_t v23 = v92;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
    if (v23)
    {
      id v24 = objc_msgSend(a1, sel_storeExternalVersionID);
      swift_bridgeObjectRelease();
      LOBYTE(v23) = (uint64_t)v24 < v22;
    }
    uint64_t v12 = v87;
  }
  else
  {
    sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24A60);
    LOBYTE(v23) = 0;
  }
  LOBYTE(v93[0]) = *(unsigned char *)(v3 + 152);
  id v25 = a1;
  sub_2307D6E20(v25, (unsigned __int8 *)v93, v23, (uint64_t)v11);
  char v82 = Description;
  if (((unsigned int (*)(char *, uint64_t, ValueMetadata *))Description[6])(v11, 1, v12) != 1)
  {
    uint64_t v30 = (uint64_t)v11;
    uint64_t v31 = v88;
    sub_2307CE37C(v30, v88);
    uint64_t v32 = *(void **)(v3 + 48);
    uint64_t v79 = *(void *)(v3 + 40);
    id v80 = v32;
    uint64_t v78 = __swift_project_boxed_opaque_existential_1(v6, v79);
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
    uint64_t v34 = *(void *)(sub_230812198() - 8);
    uint64_t v35 = *(unsigned __int8 *)(v34 + 80);
    uint64_t v36 = (v35 + 32) & ~v35;
    uint64_t v37 = v36 + *(void *)(v34 + 72);
    uint64_t v75 = v33;
    uint64_t v72 = v37;
    uint64_t v73 = v35 | 7;
    uint64_t v38 = swift_allocObject();
    long long v74 = xmmword_230813840;
    *(_OWORD *)(v38 + 16) = xmmword_230813840;
    uint64_t v76 = v36;
    uint64_t v77 = (void *)(v38 + v36);
    sub_230812168();
    sub_230812158();
    unint64_t v94 = v86;
    v93[0] = v3;
    swift_retain();
    sub_230812128();
    sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
    sub_230812158();
    unint64_t v94 = (ValueMetadata *)sub_2307D6ACC();
    v93[0] = (uint64_t)v25;
    id v39 = v25;
    sub_230812128();
    sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
    sub_230812158();
    unint64_t v94 = v12;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v93);
    sub_2307CE248(v31, (uint64_t)boxed_opaque_existential_0);
    sub_230812128();
    sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
    sub_230812158();
    sub_230812188();
    sub_2308122C8();
    swift_bridgeObjectRelease();
    sub_2307D5154((uint64_t)v84, (uint64_t)v93, (uint64_t *)&unk_26AF24A60);
    uint64_t v41 = v94;
    if (v94)
    {
      id v80 = v39;
      uint64_t v42 = v95;
      __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
      uint64_t v43 = v81;
      uint64_t v89 = v81;
      (*(void (**)(uint64_t *__return_ptr, uint64_t *, ValueMetadata *, uint64_t))(v42 + 8))(&v90, &v89, v41, v42);
      uint64_t v44 = v90;
      uint64_t v45 = v91;
      uint64_t v46 = v92;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
      if (v46)
      {
        uint64_t v47 = *(void *)(v3 + 48);
        uint64_t v78 = *(void **)(v3 + 40);
        uint64_t v79 = v47;
        uint64_t v77 = __swift_project_boxed_opaque_existential_1(v6, (uint64_t)v78);
        uint64_t v48 = swift_allocObject();
        *(_OWORD *)(v48 + 16) = v74;
        uint64_t v71 = v48 + v76;
        sub_230812168();
        sub_230812158();
        unint64_t v94 = v86;
        v93[0] = v3;
        swift_retain();
        sub_230812128();
        sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        uint64_t v70 = v44;
        v93[0] = v44;
        v93[1] = v45;
        uint64_t v69 = v45;
        v93[2] = v46;
        unint64_t v94 = &type metadata for AvailableUpdate;
        swift_bridgeObjectRetain();
        sub_230812128();
        sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        unint64_t v94 = &type metadata for AdamID;
        v93[0] = v43;
        sub_230812128();
        sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        sub_230812188();
        sub_2308122B8();
        swift_bridgeObjectRelease();
        uint64_t v49 = v85;
        sub_2307CE248(v88, v85);
        if (swift_getEnumCaseMultiPayload() == 5)
        {
          uint64_t v50 = v46;
          uint64_t v51 = *(void *)(v49 + 8);
          if (objc_msgSend(v80, sel_storeItemID) && v51)
          {
            uint64_t v52 = v70;
            if (v51 < v70)
            {
              uint64_t v53 = *(void *)(v3 + 40);
              uint64_t v85 = *(void *)(v3 + 48);
              uint64_t v84 = __swift_project_boxed_opaque_existential_1(v6, v53);
              uint64_t v54 = swift_allocObject();
              *(_OWORD *)(v54 + 16) = v74;
              uint64_t v81 = v54 + v76;
              sub_230812168();
              sub_230812158();
              unint64_t v94 = v86;
              v93[0] = v3;
              swift_retain();
              sub_230812128();
              sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
              sub_230812158();
              uint64_t v55 = (ValueMetadata *)MEMORY[0x263F8E5C0];
              unint64_t v94 = (ValueMetadata *)MEMORY[0x263F8E5C0];
              v93[0] = v52;
              sub_230812128();
              sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
              sub_230812158();
              unint64_t v94 = v55;
              v93[0] = v51;
              sub_230812128();
              sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
              sub_230812158();
              uint64_t v56 = v87;
              unint64_t v94 = v87;
              unsigned int v57 = __swift_allocate_boxed_opaque_existential_0(v93);
              uint64_t v58 = v69;
              *unsigned int v57 = v69;
              v57[1] = v50;
              swift_storeEnumTagMultiPayload();
              swift_bridgeObjectRetain();
              sub_230812128();
              sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
              sub_230812158();
              sub_230812188();
              sub_2308122B8();
              swift_bridgeObjectRelease();
              sub_2307E286C(v88);
              int v59 = v83;
              *uint64_t v83 = v58;
              v59[1] = v50;
              swift_storeEnumTagMultiPayload();
              return v82[7](v59, 0, 1, v56);
            }
            swift_bridgeObjectRelease();
            __swift_project_boxed_opaque_existential_1(v6, *(void *)(v3 + 40));
            *(_OWORD *)(swift_allocObject() + 16) = v74;
            sub_230812168();
            sub_230812158();
            unint64_t v94 = v86;
            v93[0] = v3;
            swift_retain();
            sub_230812128();
            sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
            sub_230812158();
            sub_230812188();
            sub_2308122B8();
            swift_bridgeObjectRelease();
            sub_2307D5154((uint64_t)v84, (uint64_t)v93, (uint64_t *)&unk_26AF24A60);
            id v63 = v94;
            if (v94)
            {
              uint64_t v64 = v95;
              __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
              uint64_t v90 = v81;
              goto LABEL_26;
            }
            goto LABEL_29;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_2307E286C(v49);
        }
        uint64_t v61 = v81;
        uint64_t v62 = *(void *)(v3 + 40);
        uint64_t v85 = *(void *)(v3 + 48);
        __swift_project_boxed_opaque_existential_1(v6, v62);
        *(_OWORD *)(swift_allocObject() + 16) = v74;
        sub_230812168();
        sub_230812158();
        unint64_t v94 = v86;
        v93[0] = v3;
        swift_retain();
        sub_230812128();
        sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        unint64_t v94 = &type metadata for AdamID;
        v93[0] = v61;
        sub_230812128();
        sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
        sub_230812158();
        sub_230812188();
        sub_2308122B8();
        swift_bridgeObjectRelease();
        sub_2307D5154((uint64_t)v84, (uint64_t)v93, (uint64_t *)&unk_26AF24A60);
        id v63 = v94;
        if (v94)
        {
          uint64_t v64 = v95;
          __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
          uint64_t v90 = v61;
LABEL_26:
          (*(void (**)(uint64_t *, ValueMetadata *, uint64_t))(v64 + 24))(&v90, v63, v64);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
LABEL_30:
          uint64_t v66 = v82;
          uint64_t v65 = v83;
          unint64_t v67 = v87;
          sub_2307CE37C(v88, (uint64_t)v83);
          return v66[7](v65, 0, 1, v67);
        }
LABEL_29:
        sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24A60);
        goto LABEL_30;
      }
    }
    else
    {
      sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24A60);
    }
    unint64_t v60 = v83;
    sub_2307CE37C(v88, (uint64_t)v83);
    return v82[7](v60, 0, 1, v87);
  }
  sub_2307CDF28((uint64_t)v11, &qword_26AF24868);
  uint64_t v26 = *(void *)(v3 + 40);
  uint64_t v88 = *(void *)(v3 + 48);
  __swift_project_boxed_opaque_existential_1(v6, v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  unint64_t v94 = v86;
  v93[0] = v3;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  unint64_t v94 = (ValueMetadata *)sub_2307D6ACC();
  v93[0] = (uint64_t)v25;
  id v27 = v25;
  sub_230812128();
  sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  sub_2307D5154((uint64_t)v84, (uint64_t)v93, (uint64_t *)&unk_26AF24A60);
  uint64_t v28 = v94;
  if (v94)
  {
    uint64_t v29 = v95;
    __swift_project_boxed_opaque_existential_1(v93, (uint64_t)v94);
    uint64_t v90 = v81;
    (*(void (**)(uint64_t *, ValueMetadata *, uint64_t))(v29 + 24))(&v90, v28, v29);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v93);
  }
  else
  {
    sub_2307CDF28((uint64_t)v93, (uint64_t *)&unk_26AF24A60);
  }
  return v82[7](v83, 1, 1, v87);
}

uint64_t sub_2307D69A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)v1 + 16);
  swift_retain();
  os_unfair_lock_lock(v3 + 6);
  sub_2307D6A24((unint64_t)&v3[4], a1);
  os_unfair_lock_unlock(v3 + 6);
  return swift_release();
}

unint64_t sub_2307D6A24@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2307D6A3C(a1, a2);
}

unint64_t sub_2307D6A3C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2307D6A58(a1, *(void *)(v2 + 16), a2);
}

unint64_t sub_2307D6A58@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = *(void *)result;
  if (*(void *)(*(void *)result + 16) && (uint64_t result = sub_2307CF3B0(a2), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(v4 + 56) + 24 * result;
    uint64_t v7 = *(void *)(v6 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v6;
    *(void *)(a3 + 16) = v7;
    return swift_bridgeObjectRetain();
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
  return result;
}

unint64_t sub_2307D6ACC()
{
  unint64_t result = qword_26AF24BF0;
  if (!qword_26AF24BF0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF24BF0);
  }
  return result;
}

uint64_t sub_2307D6B0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_230812178();
  MEMORY[0x270FA5388](v6 - 8);
  if (a1 < 0)
  {
    unint64_t v17 = 0;
    unint64_t v18 = 0xE000000000000000;
    sub_230812758();
    swift_bridgeObjectRelease();
    unint64_t v17 = 0xD00000000000001DLL;
    unint64_t v18 = 0x8000000230815450;
    v15[0] = a1;
    sub_230812868();
    sub_230812478();
    swift_bridgeObjectRelease();
    unint64_t v9 = v17;
    unint64_t v10 = v18;
    sub_2307DAC7C();
    BOOL v11 = (void *)swift_allocError();
    *uint64_t v12 = v9;
    v12[1] = v10;
    swift_willThrow();
    sub_2307CDEC4(a2, (uint64_t)&v17);
    __swift_project_boxed_opaque_existential_1(&v17, v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
    sub_230812198();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
    sub_230812168();
    sub_230812158();
    uint64_t v16 = MEMORY[0x263F8E5C0];
    v15[0] = a1;
    sub_230812128();
    sub_2307DB4D8((uint64_t)v15);
    sub_230812158();
    swift_getErrorValue();
    uint64_t v16 = v14;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v15);
    (*(void (**)(uint64_t *))(*(void *)(v14 - 8) + 16))(boxed_opaque_existential_0);
    sub_230812128();
    sub_2307DB4D8((uint64_t)v15);
    sub_230812158();
    sub_230812188();
    sub_2308122D8();
    swift_bridgeObjectRelease();

    sub_2307D5428(a2);
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v17);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t result = sub_2307D5428(a2);
    uint64_t v8 = a1;
  }
  *(void *)a3 = v8;
  *(unsigned char *)(a3 + 8) = a1 < 0;
  return result;
}

uint64_t sub_2307D6E20@<X0>(void *a1@<X0>, unsigned __int8 *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for State();
  uint64_t v26 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (uint64_t *)((char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v14 = *a2;
  if (!objc_msgSend(a1, sel_isFamilyShared)
    || (objc_msgSend(a1, sel_isOpenable) & 1) != 0
    || (objc_msgSend(a1, sel_isUpdateAvailable) & 1) != 0
    || (id v15 = objc_msgSend(a1, sel_progress), v15, v15))
  {
    if ((objc_msgSend(a1, sel_isInstalled) & 1) != 0
      || (id v16 = objc_msgSend(a1, sel_progress), v16, v16))
    {
      sub_2307D2CCC(a1, a3 & 1, v10);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v26 + 48))(v10, 1, v11) != 1)
      {

        sub_2307CE37C((uint64_t)v10, (uint64_t)v13);
LABEL_24:
        sub_2307CE37C((uint64_t)v13, a4);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v26 + 56))(a4, 0, 1, v11);
      }
      sub_2307D71A0((uint64_t)v10);
      if (objc_msgSend(a1, sel_isUpdateAvailable))
      {
        id v17 = objc_msgSend(a1, sel_updateBuyParams);
        if (v17)
        {
          unint64_t v18 = v17;
          uint64_t v19 = sub_230812448();
          uint64_t v21 = v20;

          *uint64_t v13 = v19;
          v13[1] = v21;
LABEL_23:
          swift_storeEnumTagMultiPayload();
          goto LABEL_24;
        }
      }
      if (objc_msgSend(a1, sel_hasMessagesExtension)
        && ((objc_msgSend(a1, sel_isLaunchProhibited) & 1) != 0 || v14 == 1))
      {
        id v24 = objc_msgSend(a1, sel_storeExternalVersionID);

        *(unsigned char *)uint64_t v13 = 1;
      }
      else
      {
        if (objc_msgSend(a1, sel_isLaunchProhibited))
        {

          goto LABEL_23;
        }
        id v24 = objc_msgSend(a1, sel_storeExternalVersionID);

        *(unsigned char *)uint64_t v13 = 0;
      }
      v13[1] = (uint64_t)v24;
      goto LABEL_23;
    }
  }

  uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
  return v22(a4, 1, 1, v11);
}

uint64_t sub_2307D71A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2307D7200()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C10);
  uint64_t result = sub_230812738();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_230812958();
      sub_230812988();
      uint64_t result = sub_230812998();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_2307D74AC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF240D8);
  char v37 = a2;
  uint64_t v6 = sub_230812828();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    char v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_230812958();
    sub_230812468();
    uint64_t result = sub_230812998();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  char v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2307D77B8(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for State();
  uint64_t v37 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C58);
  int v38 = a2;
  uint64_t result = sub_230812828();
  uint64_t v10 = result;
  if (*(void *)(v8 + 16))
  {
    uint64_t v34 = v2;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)(v8 + 64);
    uint64_t v36 = (void *)(v8 + 64);
    uint64_t v13 = 1 << *(unsigned char *)(v8 + 32);
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v12;
    int64_t v35 = (unint64_t)(v13 + 63) >> 6;
    uint64_t v16 = result + 64;
    while (1)
    {
      if (v15)
      {
        unint64_t v18 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v19 = v18 | (v11 << 6);
      }
      else
      {
        int64_t v20 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v36;
        if (v20 >= v35) {
          goto LABEL_34;
        }
        unint64_t v21 = v36[v20];
        ++v11;
        if (!v21)
        {
          int64_t v11 = v20 + 1;
          if (v20 + 1 >= v35) {
            goto LABEL_34;
          }
          unint64_t v21 = v36[v11];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v35)
            {
LABEL_34:
              if ((v38 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_41;
              }
              uint64_t v33 = 1 << *(unsigned char *)(v8 + 32);
              if (v33 >= 64) {
                bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v36 = -1 << v33;
              }
              uint64_t v3 = v34;
              *(void *)(v8 + 16) = 0;
              break;
            }
            unint64_t v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v11 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_43;
                }
                if (v11 >= v35) {
                  goto LABEL_34;
                }
                unint64_t v21 = v36[v11];
                ++v22;
                if (v21) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v11 = v22;
          }
        }
LABEL_21:
        unint64_t v15 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v11 << 6);
      }
      uint64_t v23 = *(void *)(*(void *)(v8 + 48) + 8 * v19);
      uint64_t v24 = *(void *)(v37 + 72);
      uint64_t v25 = *(void *)(v8 + 56) + v24 * v19;
      if (v38) {
        sub_2307CE37C(v25, (uint64_t)v7);
      }
      else {
        sub_2307CE248(v25, (uint64_t)v7);
      }
      sub_230812958();
      sub_230812988();
      uint64_t result = sub_230812998();
      uint64_t v26 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_42;
          }
          BOOL v31 = v28 == v30;
          if (v28 == v30) {
            unint64_t v28 = 0;
          }
          v29 |= v31;
          uint64_t v32 = *(void *)(v16 + 8 * v28);
        }
        while (v32 == -1);
        unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(void *)(v16 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(void *)(*(void *)(v10 + 48) + 8 * v17) = v23;
      uint64_t result = sub_2307CE37C((uint64_t)v7, *(void *)(v10 + 56) + v24 * v17);
      ++*(void *)(v10 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_41:
  *uint64_t v3 = v10;
  return result;
}

uint64_t sub_2307D7B20()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C10);
  uint64_t result = sub_230812738();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_230812958();
    sub_230812988();
    uint64_t result = sub_230812998();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2307D7D9C(uint64_t a1)
{
  sub_2307D7F14();
  uint64_t result = sub_2308125F8();
  int64_t v3 = 0;
  uint64_t v15 = result;
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    int64_t v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      int64_t v3 = v11 + 1;
      if (v11 + 1 >= v8) {
        goto LABEL_23;
      }
      unint64_t v12 = *(void *)(v4 + 8 * v3);
      if (!v12)
      {
        int64_t v3 = v11 + 2;
        if (v11 + 2 >= v8) {
          goto LABEL_23;
        }
        unint64_t v12 = *(void *)(v4 + 8 * v3);
        if (!v12)
        {
          int64_t v3 = v11 + 3;
          if (v11 + 3 >= v8) {
            goto LABEL_23;
          }
          unint64_t v12 = *(void *)(v4 + 8 * v3);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    uint64_t result = sub_2307D51B8(&v14, *(void *)(*(void *)(a1 + 48) + 8 * v10));
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
  unint64_t v12 = *(void *)(v4 + 8 * v13);
  if (v12)
  {
    int64_t v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v3 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v3 >= v8) {
      goto LABEL_23;
    }
    unint64_t v12 = *(void *)(v4 + 8 * v3);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_2307D7F14()
{
  unint64_t result = qword_26AF24AF8;
  if (!qword_26AF24AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF24AF8);
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

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
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

uint64_t sub_2307D8074(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307CBA50;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268703188 + dword_268703188);
  return v6(a1, v4);
}

uint64_t sub_2307D812C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2307D8070;
  return v6(a1);
}

unint64_t sub_2307D8208(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268703010);
  uint64_t v3 = (void *)sub_230812838();
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v6 = a1[7];
  unint64_t result = sub_2307CF3B0(v4);
  if (v9)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  unint64_t v10 = a1 + 11;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v4;
    int64_t v11 = (void *)(v3[7] + 24 * result);
    *int64_t v11 = v5;
    v11[1] = v7;
    v11[2] = v6;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      break;
    }
    v3[2] = v14;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v15 = v10 + 4;
    uint64_t v4 = *(v10 - 3);
    uint64_t v5 = *(v10 - 2);
    uint64_t v7 = *(v10 - 1);
    uint64_t v16 = *v10;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2307CF3B0(v4);
    unint64_t v10 = v15;
    uint64_t v6 = v16;
    if (v17) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_2307D8320(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23DB8);
  uint64_t v3 = (void *)sub_230812838();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_2307CF3B0(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    BOOL v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_retain();
    unint64_t result = sub_2307CF3B0(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_2307D8420(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_26AF240E8);
    uint64_t v3 = (void *)sub_230812838();
    for (uint64_t i = (void *)(a1 + 96); ; i += 9)
    {
      uint64_t v5 = *(i - 8);
      char v6 = *((unsigned char *)i - 56);
      long long v19 = *((_OWORD *)i - 3);
      char v7 = *((unsigned char *)i - 32);
      uint64_t v9 = *(i - 3);
      uint64_t v8 = *(i - 2);
      uint64_t v11 = *(i - 1);
      uint64_t v10 = *i;
      unint64_t result = sub_2307F5570(v5, v6);
      if (v13) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v14 = v3[6] + 16 * result;
      *(void *)uint64_t v14 = v5;
      *(unsigned char *)(v14 + 8) = v6;
      uint64_t v15 = v3[7] + 56 * result;
      *(_OWORD *)uint64_t v15 = v19;
      *(unsigned char *)(v15 + 16) = v7;
      *(void *)(v15 + 24) = v9;
      *(void *)(v15 + 32) = v8;
      *(void *)(v15 + 40) = v11;
      *(void *)(v15 + 48) = v10;
      uint64_t v16 = v3[2];
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17) {
        goto LABEL_10;
      }
      v3[2] = v18;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

uint64_t sub_2307D8558(uint64_t a1)
{
  return sub_2307CC9CC(a1, qword_26AF259E0);
}

uint64_t sub_2307D8584(uint64_t a1)
{
  return sub_2307CC9CC(a1, qword_26AF259C8);
}

uint64_t sub_2307D85AC(uint64_t a1)
{
  return sub_2307CC9CC(a1, qword_26AF259B0);
}

uint64_t sub_2307D85D0(uint64_t a1)
{
  return sub_2307CC9CC(a1, qword_26AF25998);
}

unint64_t sub_2307D85F8()
{
  unint64_t result = qword_26AF24B00;
  if (!qword_26AF24B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF24B00);
  }
  return result;
}

uint64_t type metadata accessor for DeviceUpdateRegistry()
{
  return self;
}

uint64_t sub_2307D8670(uint64_t a1)
{
  return DeviceUpdateRegistry.removeEntries(forAdamIDs:)(a1);
}

uint64_t DeviceUpdateRegistry.removeEntries(forAdamIDs:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_230812178();
  uint64_t result = MEMORY[0x270FA5388](v4 - 8);
  if (*(void *)(a1 + 16))
  {
    __swift_project_boxed_opaque_existential_1(v1 + 3, v1[6]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
    sub_230812198();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
    sub_230812168();
    sub_230812158();
    uint64_t v11 = v3;
    v10[0] = v1;
    swift_retain();
    sub_230812128();
    sub_2307DB4D8((uint64_t)v10);
    sub_230812158();
    uint64_t v6 = sub_2307F7110(a1);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23DA0);
    v10[0] = v6;
    sub_230812128();
    sub_2307DB4D8((uint64_t)v10);
    sub_230812158();
    sub_230812188();
    sub_2308122B8();
    uint64_t v7 = swift_bridgeObjectRelease();
    uint64_t v8 = v1[2];
    MEMORY[0x270FA5388](v7);
    *((void *)&v9 - 2) = a1;
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
    sub_2307F7BD4((uint64_t *)(v8 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
    return swift_release();
  }
  return result;
}

uint64_t sub_2307D8914(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_26AF24A70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2307D897C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for AvailableUpdate()
{
  return &type metadata for AvailableUpdate;
}

uint64_t sub_2307D89AC()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_230804578;
  }
  else {
    uint64_t v2 = sub_2307C70E8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307D8AC0(uint64_t a1, uint64_t a2)
{
  double v6 = v2[2];
  uint64_t v8 = *((void *)v2 + 3);
  uint64_t v7 = *((void *)v2 + 4);
  char v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *char v9 = v3;
  v9[1] = sub_2307CBA50;
  return sub_2307C74BC(v6, a1, a2, v8, v7);
}

uint64_t sub_2307D8B84()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_230804710, 0, 0);
  }
}

uint64_t sub_2307D8CB8()
{
  uint64_t result = type metadata accessor for State();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2307D8D5C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230814B70;
  *(unsigned char *)(inited + 32) = 0;
  *(void *)(inited + 64) = &_s7BuyableVN;
  *(void *)(inited + 72) = &off_26E4789F8;
  *(unsigned char *)(inited + 80) = 1;
  *(void *)(inited + 112) = &_s7WaitingVN;
  *(void *)(inited + 120) = &off_26E479538;
  *(unsigned char *)(inited + 128) = 5;
  *(void *)(inited + 160) = &_s10InstallingVN;
  *(void *)(inited + 168) = &off_26E478E40;
  *(unsigned char *)(inited + 176) = 6;
  *(void *)(inited + 208) = &_s9InstalledVN;
  *(void *)(inited + 216) = &off_26E478E10;
  *(unsigned char *)(inited + 224) = 2;
  *(void *)(inited + 256) = &_s9PurchasedVN;
  *(void *)(inited + 264) = &off_26E478EE0;
  *(unsigned char *)(inited + 272) = 3;
  *(void *)(inited + 304) = &_s9UpdatableVN;
  *(void *)(inited + 312) = &off_26E479508;
  *(unsigned char *)(inited + 320) = 4;
  *(void *)(inited + 352) = &_s12DownloadableVN;
  *(void *)(inited + 360) = &off_26E478C50;
  *(unsigned char *)(inited + 368) = 7;
  *(void *)(inited + 400) = &_s8OpenableVN;
  *(void *)(inited + 408) = &off_26E478EB0;
  *(unsigned char *)(inited + 416) = 8;
  *(void *)(inited + 448) = &_s7UnknownVN;
  *(void *)(inited + 456) = &off_26E4794D8;
  unint64_t result = sub_2307CCC2C(inited);
  qword_26AF25990 = result;
  return result;
}

uint64_t sub_2307D8EA8()
{
  uint64_t result = type metadata accessor for AppInstallation(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_2307D8F5C()
{
  unint64_t result = qword_26AF24820;
  if (!qword_26AF24820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF24820);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppStoreType()
{
  return &type metadata for AppStoreType;
}

uint64_t sub_2307D8FC0()
{
  uint64_t result = type metadata accessor for AppInstallation.Progress(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_2307D9058()
{
  unint64_t result = qword_26AF24628;
  if (!qword_26AF24628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF24628);
  }
  return result;
}

void sub_2307D90AC()
{
  qword_26AF25968 = (uint64_t)&unk_26E477790;
}

unint64_t sub_2307D90C4()
{
  unint64_t result = qword_26AF24610;
  if (!qword_26AF24610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF24610);
  }
  return result;
}

uint64_t destroy for ASDDeviceAppFetcher(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

ValueMetadata *type metadata accessor for ASDDeviceAppFetcher()
{
  return &type metadata for ASDDeviceAppFetcher;
}

uint64_t ASDDeviceAppFetcher.init(regulatoryLogger:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2307D8914(a1, a2);
}

uint64_t type metadata accessor for WaitingAppStateDataSource()
{
  return self;
}

uint64_t sub_2307D9164()
{
  return swift_retain();
}

uint64_t type metadata accessor for DefaultAppStateRules()
{
  return self;
}

uint64_t type metadata accessor for DefaultAppStateDataSource()
{
  return self;
}

uint64_t sub_2307D91B8()
{
  return swift_retain();
}

uint64_t type metadata accessor for DeviceAppStateDataSource()
{
  return self;
}

ValueMetadata *type metadata accessor for DeviceAppQuery()
{
  return &type metadata for DeviceAppQuery;
}

uint64_t type metadata accessor for StorefrontAppStateController()
{
  return self;
}

uint64_t sub_2307D921C()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2307CB12C, 0, 0);
}

uint64_t sub_2307D9318(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  double v6 = (void *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2307CBA50;
  return sub_2307C82F0(a1, v4, v5, v6);
}

uint64_t sub_2307D93CC()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_2307D9404(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  *uint64_t v11 = v3;
  v11[1] = sub_2307CBA50;
  return sub_2307C61F0(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_2307D94DC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 80);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_2307CBA50;
  *(void *)(v6 + 48) = v1 + 40;
  *(void *)(v6 + 56) = v5;
  *(void *)(v6 + 40) = v4;
  *(_OWORD *)(v6 + 24) = v7;
  *(void *)(v6 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2307C632C, 0, 0);
}

void sub_2307D95B4()
{
  sub_2307CCFE4(*(void *)(v0 + 16), **(void **)(v0 + 24));
}

uint64_t sub_2307D95D4(uint64_t a1)
{
  if (*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = MEMORY[0x263F8E628];
    uint64_t v3 = MEMORY[0x263F8E658];
    return MEMORY[0x270FA0678](a1, v2, v3);
  }
  else
  {
    swift_release_n();
    uint64_t v4 = *(uint64_t (**)(void))(v1 + 8);
    return v4();
  }
}

uint64_t sub_2307D9674()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2307D95D4, 0, 0);
}

unint64_t sub_2307D9770@<X0>(uint64_t *a1@<X8>)
{
  return sub_2307C667C(v1, a1);
}

uint64_t StorefrontAppStateController.loadDataSources()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2307C7BE8, 0, 0);
}

uint64_t sub_2307D97AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2307D97DC(uint64_t a1, uint64_t a2)
{
  return a2;
}

ValueMetadata *type metadata accessor for StorefrontAppStateController.Configuration()
{
  return &type metadata for StorefrontAppStateController.Configuration;
}

unint64_t sub_2307D9824()
{
  return sub_2307D983C();
}

unint64_t sub_2307D983C()
{
  return sub_2307C629C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void *sub_2307D9858@<X0>(void *a1@<X8>)
{
  unint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t dispatch thunk of AccountFamily.primaryAccount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AccountFamily.fetchFamilyMemberIDs()(uint64_t a1, uint64_t a2)
{
  long long v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 16) + **(int **)(a2 + 16));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307D9BAC;
  return v7(a1, a2);
}

uint64_t sub_2307D9BAC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

void type metadata accessor for ASDPurchaseHistoryContext(uint64_t a1)
{
}

uint64_t sub_2307D9CBC@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_2307D9CC4(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8(&qword_268702BF8, type metadata accessor for ASDError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_2307D9D30(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8(&qword_268702BF8, type metadata accessor for ASDError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_2307D9DA0(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8((unint64_t *)&qword_268702C28, type metadata accessor for ASDError);
  return MEMORY[0x270EEF788](a1, v2);
}

id sub_2307D9E0C()
{
  return *v0;
}

uint64_t sub_2307D9E14()
{
  return sub_230812448();
}

uint64_t sub_2307D9E24(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8(&qword_268702BB0, type metadata accessor for ASDServerError);
  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_2307D9E90(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8(&qword_268702BB0, type metadata accessor for ASDServerError);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_2307D9EFC(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_2307DA5B8(&qword_268702BB0, type metadata accessor for ASDServerError);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_2307D9F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2307DA5B8(&qword_268702BB0, type metadata accessor for ASDServerError);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_2307DA00C()
{
  return sub_230812448();
}

uint64_t sub_2307DA01C(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8((unint64_t *)&qword_268702C28, type metadata accessor for ASDError);
  return MEMORY[0x270EEF7E8](a1, v2);
}

uint64_t sub_2307DA088(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8((unint64_t *)&qword_268702C28, type metadata accessor for ASDError);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_2307DA0F4(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_2307DA5B8((unint64_t *)&qword_268702C28, type metadata accessor for ASDError);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_2307DA184()
{
  id v1 = *v0;
  uint64_t v2 = sub_2308126A8();

  return v2;
}

uint64_t sub_2307DA1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2307DA5B8((unint64_t *)&qword_268702C28, type metadata accessor for ASDError);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_2307DA238()
{
  return sub_230812998();
}

void *sub_2307DA298@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2307DA2A8(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for Code(uint64_t a1)
{
}

void type metadata accessor for ASDError(uint64_t a1)
{
}

uint64_t sub_2307DA2DC(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8(&qword_268702BB8, type metadata accessor for ASDServerError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_2307DA348(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8(&qword_268702BB8, type metadata accessor for ASDServerError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_2307DA3B4(uint64_t a1)
{
  uint64_t v2 = sub_2307DA5B8(&qword_268702BB0, type metadata accessor for ASDServerError);
  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t sub_2307DA420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2307DA5B8(&qword_268702BB0, type metadata accessor for ASDServerError);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t sub_2307DA4A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2307DA5B8((unint64_t *)&qword_268702C28, type metadata accessor for ASDError);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t sub_2307DA528()
{
  return sub_2307DA5B8(&qword_268702B98, type metadata accessor for ASDError);
}

uint64_t sub_2307DA570()
{
  return sub_2307DA5B8(&qword_268702BA0, type metadata accessor for ASDError);
}

uint64_t sub_2307DA5B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2307DA600()
{
  return sub_2307DA5B8(&qword_268702BA8, type metadata accessor for Code);
}

uint64_t sub_2307DA648()
{
  return sub_2307DA5B8(&qword_268702BB0, type metadata accessor for ASDServerError);
}

void type metadata accessor for ASDServerError(uint64_t a1)
{
}

uint64_t sub_2307DA6A4()
{
  return sub_2307DA5B8(&qword_268702BB8, type metadata accessor for ASDServerError);
}

uint64_t sub_2307DA6EC()
{
  return sub_2307DA5B8(&qword_268702BC0, type metadata accessor for ASDServerError);
}

uint64_t sub_2307DA734()
{
  return sub_2307DA5B8(&qword_268702BC8, type metadata accessor for ASDServerError);
}

uint64_t sub_2307DA77C()
{
  return sub_2307DA5B8((unint64_t *)&qword_268702BD0, type metadata accessor for Code);
}

uint64_t sub_2307DA7C4()
{
  return sub_2307DA5B8(&qword_268702BD8, type metadata accessor for Code);
}

unint64_t sub_2307DA810()
{
  unint64_t result = qword_268702BE0;
  if (!qword_268702BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702BE0);
  }
  return result;
}

uint64_t sub_2307DA864()
{
  return sub_2307DA5B8(&qword_268702BE8, type metadata accessor for ASDServerError);
}

uint64_t sub_2307DA8AC()
{
  return sub_2307DA5B8(&qword_268702BF0, type metadata accessor for ASDServerError);
}

uint64_t sub_2307DA8F4()
{
  return sub_2307DA5B8(&qword_268702BF8, type metadata accessor for ASDError);
}

uint64_t sub_2307DA93C()
{
  return sub_2307DA5B8(&qword_268702C00, type metadata accessor for ASDError);
}

uint64_t sub_2307DA984()
{
  return sub_2307DA5B8(&qword_268702C08, type metadata accessor for ASDError);
}

uint64_t sub_2307DA9CC()
{
  return sub_2307DA5B8(&qword_268702C10, _s3__C4CodeOMa_0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

uint64_t sub_2307DAA28()
{
  return sub_2307DA5B8(&qword_268702C18, _s3__C4CodeOMa_0);
}

uint64_t sub_2307DAA70()
{
  return sub_2307DA5B8(&qword_268702C20, _s3__C4CodeOMa_0);
}

uint64_t sub_2307DAAB8()
{
  return sub_2307DA5B8((unint64_t *)&qword_268702C28, type metadata accessor for ASDError);
}

BOOL sub_2307DAB00(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t AdamID.Error.errorDescription.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2307DAB58()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AdamID.init(value:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  if (result < 0)
  {
    sub_230812758();
    swift_bridgeObjectRelease();
    sub_230812868();
    sub_230812478();
    swift_bridgeObjectRelease();
    sub_2307DAC7C();
    swift_allocError();
    *uint64_t v2 = 0xD00000000000001DLL;
    v2[1] = 0x8000000230815450;
    return swift_willThrow();
  }
  else
  {
    *a2 = result;
  }
  return result;
}

unint64_t sub_2307DAC7C()
{
  unint64_t result = qword_268702C40;
  if (!qword_268702C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702C40);
  }
  return result;
}

uint64_t AdamID.init(value:)@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = HIBYTE(a2) & 0xF;
  uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v7) {
    goto LABEL_57;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    BOOL v24 = sub_2307DB290(result, a2, 10);
    if ((v25 & 1) == 0)
    {
      uint64_t v11 = (uint64_t)v24;
      goto LABEL_36;
    }
    goto LABEL_57;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      uint64_t v8 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v8 = (unsigned __int8 *)sub_230812788();
    }
    uint64_t v9 = sub_2307DB538(v8, v6, 10);
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = (uint64_t)v9;
LABEL_36:
      unint64_t result = swift_bridgeObjectRelease();
      if ((v11 & 0x8000000000000000) == 0)
      {
        *a3 = v11;
        return result;
      }
      unint64_t v29 = 0;
      uint64_t v30 = 0xE000000000000000;
      sub_230812758();
      swift_bridgeObjectRelease();
      unint64_t v29 = 0xD00000000000001DLL;
      uint64_t v30 = 0x8000000230815450;
      uint64_t v31 = v11;
      sub_230812868();
      sub_230812478();
      goto LABEL_58;
    }
LABEL_57:
    unint64_t v29 = 0;
    uint64_t v30 = 0xE000000000000000;
    sub_230812758();
    swift_bridgeObjectRelease();
    unint64_t v29 = 0xD000000000000020;
    uint64_t v30 = 0x8000000230815470;
    sub_230812478();
LABEL_58:
    swift_bridgeObjectRelease();
    unint64_t v27 = v29;
    uint64_t v26 = v30;
    sub_2307DAC7C();
    swift_allocError();
    *unint64_t v28 = v27;
    v28[1] = v26;
    return swift_willThrow();
  }
  unint64_t v29 = result;
  uint64_t v30 = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (!v5) {
      goto LABEL_62;
    }
    if (v5 == 1) {
      goto LABEL_60;
    }
    if ((BYTE1(result) - 48) <= 9u)
    {
      uint64_t v11 = (BYTE1(result) - 48);
      if (v5 == 2) {
        goto LABEL_34;
      }
      if ((BYTE2(result) - 48) <= 9u)
      {
        uint64_t v11 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
        uint64_t v12 = v5 - 3;
        if (v5 != 3)
        {
          uint64_t v13 = (unsigned __int8 *)&v29 + 3;
          while (1)
          {
            unsigned int v14 = *v13 - 48;
            if (v14 > 9) {
              goto LABEL_32;
            }
            uint64_t v15 = 10 * v11;
            if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
              goto LABEL_32;
            }
            uint64_t v11 = v15 + v14;
            if (__OFADD__(v15, v14)) {
              goto LABEL_32;
            }
            LOBYTE(v5) = 0;
            ++v13;
            if (!--v12) {
              goto LABEL_35;
            }
          }
        }
        goto LABEL_34;
      }
    }
LABEL_32:
    uint64_t v11 = 0;
    LOBYTE(v5) = 1;
    goto LABEL_35;
  }
  if (result != 45)
  {
    if (!v5 || (result - 48) > 9u) {
      goto LABEL_32;
    }
    uint64_t v11 = (result - 48);
    if (v5 == 1)
    {
LABEL_34:
      LOBYTE(v5) = 0;
      goto LABEL_35;
    }
    if ((BYTE1(result) - 48) <= 9u)
    {
      uint64_t v11 = 10 * (result - 48) + (BYTE1(result) - 48);
      uint64_t v16 = v5 - 2;
      if (v5 != 2)
      {
        BOOL v17 = (unsigned __int8 *)&v29 + 2;
        while (1)
        {
          unsigned int v18 = *v17 - 48;
          if (v18 > 9) {
            goto LABEL_32;
          }
          uint64_t v19 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
            goto LABEL_32;
          }
          uint64_t v11 = v19 + v18;
          if (__OFADD__(v19, v18)) {
            goto LABEL_32;
          }
          LOBYTE(v5) = 0;
          ++v17;
          if (!--v16) {
            goto LABEL_35;
          }
        }
      }
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (v5)
  {
    if (v5 != 1)
    {
      if ((BYTE1(result) - 48) > 9u) {
        goto LABEL_32;
      }
      if (v5 == 2)
      {
        LOBYTE(v5) = 0;
        uint64_t v11 = -(uint64_t)(BYTE1(result) - 48);
        goto LABEL_35;
      }
      if ((BYTE2(result) - 48) > 9u) {
        goto LABEL_32;
      }
      uint64_t v11 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
      uint64_t v20 = v5 - 3;
      if (v5 != 3)
      {
        unint64_t v21 = (unsigned __int8 *)&v29 + 3;
        while (1)
        {
          unsigned int v22 = *v21 - 48;
          if (v22 > 9) {
            goto LABEL_32;
          }
          uint64_t v23 = 10 * v11;
          if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63) {
            goto LABEL_32;
          }
          uint64_t v11 = v23 - v22;
          if (__OFSUB__(v23, v22)) {
            goto LABEL_32;
          }
          LOBYTE(v5) = 0;
          ++v21;
          if (!--v20) {
            goto LABEL_35;
          }
        }
      }
      goto LABEL_34;
    }
LABEL_60:
    uint64_t v11 = 0;
LABEL_35:
    if ((v5 & 1) == 0) {
      goto LABEL_36;
    }
    goto LABEL_57;
  }
  __break(1u);
LABEL_62:
  __break(1u);
  return result;
}

id AdamID.numberValue.getter()
{
  uint64_t v1 = *v0;
  id v2 = objc_allocWithZone(NSNumber);
  return objc_msgSend(v2, sel_initWithLongLong_, v1);
}

uint64_t AdamID.stringValue.getter()
{
  return sub_230812868();
}

uint64_t AdamID.hash(into:)()
{
  return sub_230812988();
}

BOOL static AdamID.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t AdamID.hashValue.getter()
{
  return sub_230812998();
}

uint64_t sub_2307DB1C0()
{
  return sub_230812998();
}

uint64_t sub_2307DB208()
{
  return sub_230812988();
}

uint64_t sub_2307DB234()
{
  return sub_230812998();
}

unsigned __int8 *sub_2307DB278(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_2307DB538(a1, a2, a3);
}

unsigned __int8 *sub_2307DB290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2308124E8();
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
    uint64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_2307DB7B4();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v7 = (unsigned __int8 *)sub_230812788();
  }
LABEL_7:
  uint64_t v11 = sub_2307DB538(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

void *initializeBufferWithCopyOfBuffer for AdamID.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AdamID.Error()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AdamID.Error(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for AdamID.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AdamID.Error(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AdamID.Error(uint64_t result, int a2, int a3)
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

uint64_t sub_2307DB4BC()
{
  return 0;
}

ValueMetadata *type metadata accessor for AdamID.Error()
{
  return &type metadata for AdamID.Error;
}

uint64_t sub_2307DB4D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF24CA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned __int8 *sub_2307DB538(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  unsigned int v18 = result + 1;
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

uint64_t sub_2307DB7B4()
{
  unint64_t v0 = sub_2308124F8();
  uint64_t v4 = sub_2307DB834(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2307DB834(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_2307DB98C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_2307DBA8C(v9, 0);
      unint64_t v12 = sub_2307DBAF4((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_230812788();
LABEL_4:
        JUMPOUT(0x230FBF120);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x230FBF120](v11 + 4, v11[2]);
    swift_release();
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
    return MEMORY[0x230FBF120]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_2307DB98C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_2307DBD08(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_2307DBD08(v6, v5, v4);
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

void *sub_2307DBA8C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268702C48);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_2307DBAF4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
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
    __n128 result = v12;
    if (v17 == v15) {
      __n128 result = sub_2307DBD08(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      __n128 result = sub_2308124B8();
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
        __n128 result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          __n128 result = sub_230812788();
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
    __n128 result = sub_2307DBD08(v12, a6, a7);
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
    unint64_t v12 = sub_230812488();
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

uint64_t sub_2307DBD08(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2308124C8();
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
    uint64_t v5 = MEMORY[0x230FBF160](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t initializeWithCopy for AdamID.Context(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AdamID.Context(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        __n128 result = (uint64_t *)swift_release();
        *long long v3 = v12;
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
          *__n128 result = *a2;
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
          *long long v3 = *a2;
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AdamID.Context(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdamID.Context(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdamID.Context(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdamID.Context()
{
  return &type metadata for AdamID.Context;
}

uint64_t AMSAccountFamily.__allocating_init(primaryAccount:bag:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_230812278();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_2307CDEC4(a1, (uint64_t)v11);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  swift_allocObject();
  uint64_t v8 = sub_2307DD480((uint64_t)v11, (uint64_t)v7, (uint64_t)sub_2307DC26C, 0);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v8;
}

id sub_2307DC26C(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F27C78]), sel_initWithAccount_bag_, v1, sub_230812248());

  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_2307DC2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2308120E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  int v8 = *MEMORY[0x263F507C0];
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (a1 == v8)
  {
    uint64_t v10 = *(void *)(a2 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_familyIDsCache);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v10 + 24));
    sub_2307DC47C((void *)(v10 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 24));
    return swift_release();
  }
  return result;
}

uint64_t (*sub_2307DC43C())(uint64_t a1)
{
  return sub_2307DD954;
}

uint64_t sub_2307DC47C(void *a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 0;
  return result;
}

uint64_t AMSAccountFamily.primaryAccount.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2307CDEC4(v1 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount, a1);
}

uint64_t AMSAccountFamily.fetchFamilyMemberIDs()()
{
  v1[3] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  v1[4] = swift_task_alloc();
  uint64_t v2 = sub_230812318();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307DC5B4, 0, 0);
}

uint64_t sub_2307DC5B4()
{
  char v20 = v0;
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[4];
  __swift_project_boxed_opaque_existential_1((void *)(v0[3] + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount), *(void *)(v0[3] + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount + 24));
  sub_2308121E8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_2307DD6F8(v0[4]);
    uint64_t v4 = MEMORY[0x263F8EE78];
LABEL_3:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
    return v5(v4);
  }
  uint64_t v7 = v0[3];
  (*(void (**)(void, void, void))(v0[6] + 32))(v0[7], v0[4], v0[5]);
  uint64_t v8 = OBJC_IVAR____TtC8AppState16AMSAccountFamily_familyIDsCache;
  v0[8] = OBJC_IVAR____TtC8AppState16AMSAccountFamily_familyIDsCache;
  uint64_t v9 = *(void *)(v7 + v8);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 24));
  sub_2307D897C((void *)(v9 + 16), &v19);
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
  uint64_t v4 = v19;
  swift_release();
  if (v4)
  {
    (*(void (**)(void, void))(v0[6] + 8))(v0[7], v0[5]);
    goto LABEL_3;
  }
  uint64_t v10 = v0[3];
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t))(v10 + 16);
  uint64_t v12 = (void *)sub_2308122F8();
  unint64_t v13 = (void *)v11(v12, v10 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_bag);

  id v14 = objc_msgSend(v13, sel_performFamilyInfoLookup);
  v0[9] = v14;

  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268702C68);
  id v16 = v14;
  v0[10] = sub_230812368();
  unint64_t v17 = sub_2307DD758();
  unint64_t v18 = (void *)swift_task_alloc();
  v0[11] = v18;
  *unint64_t v18 = v0;
  v18[1] = sub_2307DC860;
  return MEMORY[0x270F462D8](v0 + 2, v15, v17);
}

uint64_t sub_2307DC860()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 96) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0)
  {
    uint64_t v3 = sub_2307DCB84;
  }
  else
  {
    *(void *)(v2 + 104) = *(void *)(v2 + 16);
    uint64_t v3 = sub_2307DC99C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

void sub_2307DC99C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 24);
  id v5 = objc_msgSend(*(id *)(v0 + 104), sel_familyMembers);
  sub_2307CB7A0(0, &qword_268702C78);
  unint64_t v6 = sub_230812518();

  uint64_t v7 = swift_task_alloc();
  *(void *)(v7 + 16) = v2;
  unint64_t v8 = sub_2307DCE34(sub_2307DD7B4, v7, v6);
  swift_task_dealloc();
  uint64_t v9 = sub_2307DCFE0(v8);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v4 + v3);
  *(void *)(swift_task_alloc() + 16) = v9;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v10 + 24));
  sub_2307DD7D4((void *)(v10 + 16));
  if (v1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 24));
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 104);
    uint64_t v12 = *(void **)(v0 + 72);
    uint64_t v14 = *(void *)(v0 + 48);
    uint64_t v13 = *(void *)(v0 + 56);
    uint64_t v15 = *(void *)(v0 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 24));
    swift_release();

    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    swift_task_dealloc();
    swift_task_dealloc();
    id v16 = *(void (**)(char *))(v0 + 8);
    v16(v9);
  }
}

uint64_t sub_2307DCB84()
{
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_2307DCC20(void **a1, uint64_t a2)
{
  uint64_t v4 = sub_230812318();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = *a1;
  unsigned int v9 = objc_msgSend(v8, sel_isSharingPurchases);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  if (v9)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    char v10 = 1;
  }
  else
  {
    id v11 = objc_msgSend(v8, sel_iTunesDSID);
    swift_getKeyPath();
    sub_230812308();
    swift_release();
    uint64_t v12 = v16;
    if (v11)
    {
      if (v16)
      {
        sub_2307CB7A0(0, (unint64_t *)&qword_26AF24BF8);
        id v13 = v11;
        char v10 = sub_230812688();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

        id v11 = v12;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        char v10 = 0;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      if (!v12)
      {
        char v10 = 1;
        return v10 & 1;
      }
      char v10 = 0;
      id v11 = v12;
    }
  }
  return v10 & 1;
}

uint64_t sub_2307DCE34(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)MEMORY[0x230FBF430](v8, v4);
LABEL_9:
        char v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          sub_2308127A8();
          sub_2308127D8();
          unint64_t v4 = v15;
          sub_2308127E8();
          sub_2308127B8();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = sub_230812808();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

char *sub_2307DCFE0(unint64_t a1)
{
  if (a1 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_230812808();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      uint64_t v3 = (char *)MEMORY[0x263F8EE78];
      uint64_t v4 = 4;
      while (1)
      {
        uint64_t v5 = v4 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)MEMORY[0x230FBF430](v4 - 4, a1);
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_17;
          }
        }
        else
        {
          id v6 = *(id *)(a1 + 8 * v4);
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
        }
        id v8 = v6;
        id v9 = objc_msgSend(v8, sel_iTunesDSID);
        if (v9)
        {
          char v10 = v9;
          id v11 = objc_msgSend(v9, sel_longLongValue);

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v3 = sub_23080BC4C(0, *((void *)v3 + 2) + 1, 1, v3);
          }
          unint64_t v13 = *((void *)v3 + 2);
          unint64_t v12 = *((void *)v3 + 3);
          if (v13 >= v12 >> 1) {
            uint64_t v3 = sub_23080BC4C((char *)(v12 > 1), v13 + 1, 1, v3);
          }
          *((void *)v3 + 2) = v13 + 1;
          *(void *)&v3[8 * v13 + 32] = v11;
        }
        else
        {
        }
        ++v4;
        if (v7 == v2) {
          goto LABEL_20;
        }
      }
    }
  }
  uint64_t v3 = (char *)MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t AMSAccountFamily.deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_bag;
  uint64_t v2 = sub_230812278();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount);
  return v0;
}

uint64_t AMSAccountFamily.__deallocating_deinit()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_bag;
  uint64_t v2 = sub_230812278();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2307DD2D8@<X0>(uint64_t a1@<X8>)
{
  return sub_2307CDEC4(*v1 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount, a1);
}

uint64_t sub_2307DD2F0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2307DD380;
  return AMSAccountFamily.fetchFamilyMemberIDs()();
}

uint64_t sub_2307DD380(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_2307DD480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v18 = a2;
  uint64_t v19 = a1;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F88);
  uint64_t v10 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  unint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307CDEC4(a1, v5 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount);
  uint64_t v13 = v5 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_bag;
  uint64_t v14 = sub_230812278();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, a2, v14);
  *(void *)(v5 + 16) = a3;
  *(void *)(v5 + 24) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268702C98);
  uint64_t v16 = swift_allocObject();
  *(_DWORD *)(v16 + 24) = 0;
  *(void *)(v16 + 16) = 0;
  *(void *)(v5 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_familyIDsCache) = v16;
  __swift_project_boxed_opaque_existential_1((void *)(v5 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount), *(void *)(v5 + OBJC_IVAR____TtC8AppState16AMSAccountFamily_primaryAccount + 24));
  swift_retain();
  sub_2308121F8();
  swift_getObjectType();
  sub_2307FBF90();
  sub_2308121B8();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v14);
  __swift_destroy_boxed_opaque_existential_1(v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v20);
  return v5;
}

uint64_t sub_2307DD6F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2307DD758()
{
  unint64_t result = qword_268702C70;
  if (!qword_268702C70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268702C68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702C70);
  }
  return result;
}

uint64_t sub_2307DD7B4(void **a1)
{
  return sub_2307DCC20(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_2307DD7D4(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRelease();
  *a1 = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2307DD81C()
{
  return type metadata accessor for AMSAccountFamily();
}

uint64_t type metadata accessor for AMSAccountFamily()
{
  uint64_t result = qword_268702C88;
  if (!qword_268702C88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2307DD870()
{
  uint64_t result = sub_230812278();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AMSAccountFamily(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AMSAccountFamily);
}

char *keypath_get_selector_ams_DSID()
{
  return sel_ams_DSID;
}

uint64_t sub_2307DD954(uint64_t a1)
{
  return sub_2307DC2D8(a1, v1);
}

void *static App.Kind.allCases.getter()
{
  return &unk_26E4777B8;
}

BOOL static App.Kind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t App.Kind.hash(into:)()
{
  return sub_230812968();
}

uint64_t App.Kind.hashValue.getter()
{
  return sub_230812998();
}

uint64_t sub_2307DD9F4()
{
  return sub_230812998();
}

uint64_t sub_2307DDA3C()
{
  return sub_230812968();
}

uint64_t sub_2307DDA68()
{
  return sub_230812998();
}

void sub_2307DDAAC(void *a1@<X8>)
{
  *a1 = &unk_26E4777E0;
}

void App.id.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t App.isBeta.getter()
{
  return *(unsigned __int8 *)(v0 + 8);
}

char *App.withKind(_:)@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  char v3 = *result;
  *(void *)a2 = *v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t App.hash(into:)()
{
  return sub_230812968();
}

uint64_t static App.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2) {
    return (*(unsigned __int8 *)(a2 + 8) ^ *(unsigned __int8 *)(a1 + 8) ^ 1) & 1;
  }
  else {
    return 0;
  }
}

uint64_t App.hashValue.getter()
{
  return sub_230812998();
}

uint64_t sub_2307DDBB4()
{
  return sub_230812968();
}

uint64_t sub_2307DDBF4()
{
  return sub_230812998();
}

unint64_t sub_2307DDC54()
{
  unint64_t result = qword_268702CA0;
  if (!qword_268702CA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268702CA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702CA0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for App(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 2;
  int v5 = v3 - 2;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for App(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for App.Kind(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for App.Kind(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2307DDE94);
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

uint64_t sub_2307DDEBC(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t AppInstallation.Progress.startDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_230812048();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

double AppInstallation.Progress.fractionCompleted.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for AppInstallation.Progress(0) + 20));
}

id AppInstallation.Progress.progress.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for AppInstallation.Progress(0) + 24));
  return v1;
}

uint64_t AppInstallation.Progress.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_230812038();
  objc_msgSend(a1, sel_fractionCompleted);
  uint64_t v5 = v4;
  uint64_t result = type metadata accessor for AppInstallation.Progress(0);
  *(void *)(a2 + *(int *)(result + 20)) = v5;
  *(void *)(a2 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t AppInstallation.Progress.init(fractionCompleted:progress:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  sub_230812038();
  uint64_t result = type metadata accessor for AppInstallation.Progress(0);
  *(double *)(a2 + *(int *)(result + 20)) = a3;
  *(void *)(a2 + *(int *)(result + 24)) = a1;
  return result;
}

BOOL static AppInstallation.Progress.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppInstallation.Progress(0);
  return *(double *)(a1 + *(int *)(v4 + 20)) == *(double *)(a2 + *(int *)(v4 + 20));
}

void AppInstallation.Progress.hash(into:)()
{
  sub_230812048();
  sub_2307E0404(&qword_268702CB0, MEMORY[0x263F07490]);
  sub_230812418();
  uint64_t v1 = type metadata accessor for AppInstallation.Progress(0);
  sub_230812988();
  id v2 = *(id *)(v0 + *(int *)(v1 + 24));
  sub_230812698();
}

uint64_t AppInstallation.Progress.hashValue.getter()
{
  return sub_230812998();
}

uint64_t sub_2307DE214()
{
  return sub_230812698();
}

uint64_t sub_2307DE2C4()
{
  return sub_230812998();
}

BOOL sub_2307DE380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(double *)(a1 + *(int *)(a3 + 20)) == *(double *)(a2 + *(int *)(a3 + 20));
}

uint64_t sub_2307DE398@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  int v59 = a2;
  uint64_t v5 = type metadata accessor for AppInstallation.Progress(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v55 = (uint64_t)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v56 = (uint64_t)&v52 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v57 = (uint64_t)&v52 - v10;
  uint64_t v11 = type metadata accessor for AppInstallation.Phase(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v54 = (uint64_t)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v53 = (uint64_t)&v52 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v52 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (char *)&v52 - v20;
  uint64_t v22 = MEMORY[0x270FA5388](v19);
  unsigned __int8 v24 = (char *)&v52 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v52 - v25;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF240E0);
  uint64_t v28 = MEMORY[0x270FA5388](v27 - 8);
  uint64_t v30 = (char *)&v52 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = (uint64_t)&v30[*(int *)(v28 + 56)];
  uint64_t v58 = v3;
  sub_2307DF874(v3, (uint64_t)v30, type metadata accessor for AppInstallation.Phase);
  sub_2307DF874(a1, v31, type metadata accessor for AppInstallation.Phase);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2307DF874((uint64_t)v30, (uint64_t)v24, type metadata accessor for AppInstallation.Phase);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v32 = v57;
        sub_2307DF3EC((uint64_t)v24, v57);
        uint64_t v33 = v56;
        sub_2307DF3EC(v31, v56);
        uint64_t v34 = v55;
        sub_2307DF874(v32, v55, type metadata accessor for AppInstallation.Progress);
        uint64_t v35 = sub_230812048();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 24))(v34, v33, v35);
        sub_2307DF3EC(v34, (uint64_t)v59);
        sub_2307DF450(v33, type metadata accessor for AppInstallation.Progress);
        sub_2307DF450(v32, type metadata accessor for AppInstallation.Progress);
        goto LABEL_15;
      }
      sub_2307DF450((uint64_t)v24, type metadata accessor for AppInstallation.Progress);
      goto LABEL_13;
    case 2u:
      sub_2307DF874((uint64_t)v30, (uint64_t)v21, type metadata accessor for AppInstallation.Phase);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v36 = v57;
        sub_2307DF3EC((uint64_t)v21, v57);
        uint64_t v37 = v56;
        sub_2307DF3EC(v31, v56);
        uint64_t v38 = v55;
        sub_2307DF874(v36, v55, type metadata accessor for AppInstallation.Progress);
        uint64_t v39 = sub_230812048();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 24))(v38, v37, v39);
        sub_2307DF3EC(v38, (uint64_t)v59);
        sub_2307DF450(v37, type metadata accessor for AppInstallation.Progress);
        sub_2307DF450(v36, type metadata accessor for AppInstallation.Progress);
        goto LABEL_15;
      }
      sub_2307DF450((uint64_t)v21, type metadata accessor for AppInstallation.Progress);
      goto LABEL_13;
    case 3u:
      sub_2307DF874((uint64_t)v30, (uint64_t)v18, type metadata accessor for AppInstallation.Phase);
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24630);
        uint64_t v40 = swift_projectBox();
        uint64_t v41 = swift_projectBox();
        uint64_t v42 = v53;
        sub_2307DF874(v40, v53, type metadata accessor for AppInstallation.Phase);
        uint64_t v43 = v41;
        uint64_t v44 = v54;
        sub_2307DF874(v43, v54, type metadata accessor for AppInstallation.Phase);
        uint64_t v45 = swift_allocBox();
        sub_2307DE398(v44);
        sub_2307DF450(v44, type metadata accessor for AppInstallation.Phase);
        sub_2307DF450(v42, type metadata accessor for AppInstallation.Phase);
        *int v59 = v45;
        swift_storeEnumTagMultiPayload();
        swift_release();
        swift_release();
        uint64_t v46 = (uint64_t)v30;
        return sub_2307DF450(v46, type metadata accessor for AppInstallation.Phase);
      }
      swift_release();
      goto LABEL_13;
    case 4u:
      goto LABEL_13;
    default:
      sub_2307DF874((uint64_t)v30, (uint64_t)v26, type metadata accessor for AppInstallation.Phase);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_2307DF450((uint64_t)v26, type metadata accessor for AppInstallation.Progress);
LABEL_13:
        sub_2307DF874(v58, (uint64_t)v59, type metadata accessor for AppInstallation.Phase);
        return sub_2307DF4B0((uint64_t)v30);
      }
      else
      {
        uint64_t v48 = v57;
        sub_2307DF3EC((uint64_t)v26, v57);
        uint64_t v49 = v56;
        sub_2307DF3EC(v31, v56);
        uint64_t v50 = v55;
        sub_2307DF874(v48, v55, type metadata accessor for AppInstallation.Progress);
        uint64_t v51 = sub_230812048();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 24))(v50, v49, v51);
        sub_2307DF3EC(v50, (uint64_t)v59);
        sub_2307DF450(v49, type metadata accessor for AppInstallation.Progress);
        sub_2307DF450(v48, type metadata accessor for AppInstallation.Progress);
LABEL_15:
        swift_storeEnumTagMultiPayload();
        uint64_t v46 = (uint64_t)v30;
        return sub_2307DF450(v46, type metadata accessor for AppInstallation.Phase);
      }
  }
}

uint64_t AppInstallation.Phase.hash(into:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for AppInstallation.Progress(0);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v21 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = type metadata accessor for AppInstallation.Phase(0);
  uint64_t v13 = MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v21 - v16;
  sub_2307DF874(v1, (uint64_t)&v21 - v16, type metadata accessor for AppInstallation.Phase);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2307DF3EC((uint64_t)v17, (uint64_t)v9);
      sub_230812968();
      sub_230812048();
      sub_2307E0404(&qword_268702CB0, MEMORY[0x263F07490]);
      sub_230812418();
      sub_230812988();
      sub_230812698();
      uint64_t v18 = (uint64_t)v9;
      return sub_2307DF450(v18, type metadata accessor for AppInstallation.Progress);
    case 2u:
      sub_2307DF3EC((uint64_t)v17, (uint64_t)v6);
      sub_230812968();
      sub_230812048();
      sub_2307E0404(&qword_268702CB0, MEMORY[0x263F07490]);
      sub_230812418();
      sub_230812988();
      sub_230812698();
      uint64_t v18 = (uint64_t)v6;
      return sub_2307DF450(v18, type metadata accessor for AppInstallation.Progress);
    case 3u:
      uint64_t v19 = swift_projectBox();
      sub_2307DF874(v19, (uint64_t)v15, type metadata accessor for AppInstallation.Phase);
      sub_230812968();
      AppInstallation.Phase.hash(into:)(a1);
      sub_2307DF450((uint64_t)v15, type metadata accessor for AppInstallation.Phase);
      return swift_release();
    case 4u:
      sub_230812888();
      __break(1u);
      JUMPOUT(0x2307DEEB4);
    default:
      sub_2307DF3EC((uint64_t)v17, (uint64_t)v11);
      sub_230812968();
      sub_230812048();
      sub_2307E0404(&qword_268702CB0, MEMORY[0x263F07490]);
      sub_230812418();
      sub_230812988();
      sub_230812698();
      uint64_t v18 = (uint64_t)v11;
      return sub_2307DF450(v18, type metadata accessor for AppInstallation.Progress);
  }
}

uint64_t static AppInstallation.Phase.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AppInstallation.Phase(0);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v38 = (uint64_t)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v37 = (uint64_t)&v37 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v37 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v37 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v37 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF240E0);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  uint64_t v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = (uint64_t)&v22[*(int *)(v20 + 56)];
  sub_2307DF874(a1, (uint64_t)v22, type metadata accessor for AppInstallation.Phase);
  sub_2307DF874(a2, v23, type metadata accessor for AppInstallation.Phase);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2307DF874((uint64_t)v22, (uint64_t)v16, type metadata accessor for AppInstallation.Phase);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v34 = type metadata accessor for AppInstallation.Progress(0);
        char v26 = *(double *)&v16[*(int *)(v34 + 20)] == *(double *)(v23 + *(int *)(v34 + 20));
        sub_2307DF450(v23, type metadata accessor for AppInstallation.Progress);
        uint64_t v27 = (uint64_t)v16;
        goto LABEL_18;
      }
      uint64_t v24 = (uint64_t)v16;
      goto LABEL_15;
    case 2u:
      goto LABEL_6;
    case 3u:
      sub_2307DF874((uint64_t)v22, (uint64_t)v10, type metadata accessor for AppInstallation.Phase);
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        uint64_t v28 = swift_projectBox();
        uint64_t v29 = swift_projectBox();
        uint64_t v30 = v37;
        sub_2307DF874(v28, v37, type metadata accessor for AppInstallation.Phase);
        uint64_t v31 = v29;
        uint64_t v32 = v38;
        sub_2307DF874(v31, v38, type metadata accessor for AppInstallation.Phase);
        char v26 = static AppInstallation.Phase.== infix(_:_:)(v30, v32);
        sub_2307DF450(v32, type metadata accessor for AppInstallation.Phase);
        sub_2307DF450(v30, type metadata accessor for AppInstallation.Phase);
        swift_release();
        swift_release();
        uint64_t v33 = (uint64_t)v22;
        goto LABEL_19;
      }
      swift_release();
      goto LABEL_16;
    case 4u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_16;
      }
      sub_230812888();
      __break(1u);
LABEL_6:
      sub_2307DF874((uint64_t)v22, (uint64_t)v13, type metadata accessor for AppInstallation.Phase);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v25 = type metadata accessor for AppInstallation.Progress(0);
        char v26 = *(double *)&v13[*(int *)(v25 + 20)] == *(double *)(v23 + *(int *)(v25 + 20));
        sub_2307DF450(v23, type metadata accessor for AppInstallation.Progress);
        uint64_t v27 = (uint64_t)v13;
        goto LABEL_18;
      }
      uint64_t v24 = (uint64_t)v13;
      goto LABEL_15;
    default:
      sub_2307DF874((uint64_t)v22, (uint64_t)v18, type metadata accessor for AppInstallation.Phase);
      if (swift_getEnumCaseMultiPayload())
      {
        uint64_t v24 = (uint64_t)v18;
LABEL_15:
        sub_2307DF450(v24, type metadata accessor for AppInstallation.Progress);
LABEL_16:
        sub_2307DF4B0((uint64_t)v22);
        char v26 = 0;
      }
      else
      {
        uint64_t v35 = type metadata accessor for AppInstallation.Progress(0);
        char v26 = *(double *)&v18[*(int *)(v35 + 20)] == *(double *)(v23 + *(int *)(v35 + 20));
        sub_2307DF450(v23, type metadata accessor for AppInstallation.Progress);
        uint64_t v27 = (uint64_t)v18;
LABEL_18:
        sub_2307DF450(v27, type metadata accessor for AppInstallation.Progress);
        uint64_t v33 = (uint64_t)v22;
LABEL_19:
        sub_2307DF450(v33, type metadata accessor for AppInstallation.Phase);
      }
      return v26 & 1;
  }
}

uint64_t AppInstallation.Phase.hashValue.getter()
{
  return sub_2307E01AC((void (*)(unsigned char *))AppInstallation.Phase.hash(into:));
}

uint64_t sub_2307DF3D0(uint64_t a1, uint64_t a2)
{
  return sub_2307E020C(a1, a2, (void (*)(unsigned char *))AppInstallation.Phase.hash(into:));
}

uint64_t sub_2307DF3EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppInstallation.Progress(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2307DF450(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2307DF4B0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF240E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2307DF510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2307E0270(a1, a2, a3, (void (*)(unsigned char *))AppInstallation.Phase.hash(into:));
}

uint64_t sub_2307DF52C()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_2307DF564()
{
  uint64_t v1 = *v0;
  sub_230812958();
  id v2 = objc_msgSend(*(id *)(v1 + 16), sel_bundleID);
  sub_230812448();

  sub_230812468();
  swift_bridgeObjectRelease();
  return sub_230812998();
}

uint64_t sub_2307DF5EC()
{
  id v1 = objc_msgSend(*(id *)(*(void *)v0 + 16), sel_bundleID);
  sub_230812448();

  sub_230812468();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2307DF668()
{
  uint64_t v1 = *v0;
  sub_230812958();
  id v2 = objc_msgSend(*(id *)(v1 + 16), sel_bundleID);
  sub_230812448();

  sub_230812468();
  swift_bridgeObjectRelease();
  return sub_230812998();
}

BOOL sub_2307DF6EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  id v3 = objc_msgSend(*(id *)(*(void *)a1 + 16), sel_storeItemID);
  return v3 == objc_msgSend(*(id *)(v2 + 16), sel_storeItemID);
}

uint64_t AppInstallation.init(phase:progress:hasPostProcessingPhase:essentialBackgroundAssetDownloadEstimate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10 = (int *)type metadata accessor for AppInstallation(0);
  sub_2307DF874(a1, (uint64_t)a5 + v10[5], type metadata accessor for AppInstallation.Phase);
  sub_2307DF874(a2, (uint64_t)a5 + v10[6], type metadata accessor for AppInstallation.Progress);
  *((unsigned char *)a5 + v10[7]) = a3;
  *(uint64_t *)((char *)a5 + v10[8]) = a4;
  *((unsigned char *)a5 + v10[9]) = 0;
  *(uint64_t *)((char *)a5 + v10[10]) = 0;
  id v11 = objc_allocWithZone(MEMORY[0x263F253D8]);
  uint64_t v12 = (void *)sub_230812438();
  id v13 = objc_msgSend(v11, sel_initWithBundleID_, v12);

  sub_2307DF450(a2, type metadata accessor for AppInstallation.Progress);
  sub_2307DF450(a1, type metadata accessor for AppInstallation.Phase);
  type metadata accessor for AppInstallation.ASDAppStore();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v13;
  *a5 = result;
  return result;
}

uint64_t sub_2307DF874(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for AppInstallation.ASDAppStore()
{
  return self;
}

uint64_t AppInstallation.phase.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AppInstallation(0);
  return sub_2307DF874(v1 + *(int *)(v3 + 20), a1, type metadata accessor for AppInstallation.Phase);
}

uint64_t AppInstallation.progress.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AppInstallation(0);
  return sub_2307DF874(v1 + *(int *)(v3 + 24), a1, type metadata accessor for AppInstallation.Progress);
}

uint64_t AppInstallation.hasPostProcessingPhase.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AppInstallation(0) + 28));
}

uint64_t AppInstallation.essentialBackgroundAssetDownloadEstimate.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppInstallation(0) + 32));
}

uint64_t AppInstallation.isExternalUpdateAvailable.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AppInstallation(0) + 36));
}

uint64_t AppInstallation.externalVersionId.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for AppInstallation(0) + 40));
}

id AppInstallation.pausedProgress.getter()
{
  uint64_t v1 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AppInstallation.Phase(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - v8;
  uint64_t v10 = type metadata accessor for AppInstallation(0);
  sub_2307DF874(v0 + *(int *)(v10 + 20), (uint64_t)v9, type metadata accessor for AppInstallation.Phase);
  if (swift_getEnumCaseMultiPayload() != 3)
  {
    sub_2307DF450((uint64_t)v9, type metadata accessor for AppInstallation.Phase);
    return 0;
  }
  uint64_t v11 = swift_projectBox();
  sub_2307DF874(v11, (uint64_t)v7, type metadata accessor for AppInstallation.Phase);
  if (swift_getEnumCaseMultiPayload() > 2)
  {
    sub_2307DF450((uint64_t)v7, type metadata accessor for AppInstallation.Phase);
    swift_release();
    return 0;
  }
  sub_2307DF3EC((uint64_t)v7, (uint64_t)v3);
  id v12 = *(id *)&v3[*(int *)(v1 + 24)];
  sub_2307DF450((uint64_t)v3, type metadata accessor for AppInstallation.Progress);
  swift_release();
  return v12;
}

uint64_t AppInstallation.isPaused.getter()
{
  uint64_t v1 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AppInstallation.Phase(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - v8;
  uint64_t v10 = type metadata accessor for AppInstallation(0);
  sub_2307DF874(v0 + *(int *)(v10 + 20), (uint64_t)v9, type metadata accessor for AppInstallation.Phase);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    uint64_t v11 = swift_projectBox();
    sub_2307DF874(v11, (uint64_t)v7, type metadata accessor for AppInstallation.Phase);
    if (swift_getEnumCaseMultiPayload() < 3)
    {
      sub_2307DF3EC((uint64_t)v7, (uint64_t)v3);
      id v12 = *(id *)&v3[*(int *)(v1 + 24)];
      sub_2307DF450((uint64_t)v3, type metadata accessor for AppInstallation.Progress);

      swift_release();
      return 1;
    }
    sub_2307DF450((uint64_t)v7, type metadata accessor for AppInstallation.Phase);
    swift_release();
  }
  else
  {
    sub_2307DF450((uint64_t)v9, type metadata accessor for AppInstallation.Phase);
  }
  return 0;
}

uint64_t AppInstallation.init(_app:phase:overallProgress:isExternalUpdateAvailable:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t *a5@<X8>)
{
  uint64_t v10 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x270FA5388](v10 - 8);
  id v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AppInstallation.Phase(0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307DF874(a2, (uint64_t)v15, type metadata accessor for AppInstallation.Phase);
  sub_2307DF874(a3, (uint64_t)v12, type metadata accessor for AppInstallation.Progress);
  type metadata accessor for AppInstallation.ASDAppStore();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a1;
  *a5 = v16;
  uint64_t v17 = (int *)type metadata accessor for AppInstallation(0);
  sub_2307DF874((uint64_t)v15, (uint64_t)a5 + v17[5], type metadata accessor for AppInstallation.Phase);
  sub_2307DF874((uint64_t)v12, (uint64_t)a5 + v17[6], type metadata accessor for AppInstallation.Progress);
  id v18 = a1;
  *((unsigned char *)a5 + v17[7]) = objc_msgSend(v18, sel_hasPostProcessing);
  *(uint64_t *)((char *)a5 + v17[8]) = (uint64_t)objc_msgSend(v18, sel_essentialBackgroundAssetDownloadEstimate);
  *((unsigned char *)a5 + v17[9]) = a4;
  id v19 = objc_msgSend(v18, sel_storeExternalVersionID);

  sub_2307DF450((uint64_t)v12, type metadata accessor for AppInstallation.Progress);
  sub_2307DF450((uint64_t)v15, type metadata accessor for AppInstallation.Phase);
  *(uint64_t *)((char *)a5 + v17[10]) = (uint64_t)v19;
  sub_2307DF450(a3, type metadata accessor for AppInstallation.Progress);
  return sub_2307DF450(a2, type metadata accessor for AppInstallation.Phase);
}

id AppInstallation.app.getter()
{
  return *(id *)(*(void *)v0 + 16);
}

uint64_t AppInstallation.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void **)(*(void *)v1 + 16);
  swift_retain();
  id v4 = objc_msgSend(v3, sel_bundleID);
  sub_230812448();

  sub_230812468();
  swift_release();
  swift_bridgeObjectRelease();
  type metadata accessor for AppInstallation(0);
  AppInstallation.Phase.hash(into:)(a1);
  sub_230812048();
  sub_2307E0404(&qword_268702CB0, MEMORY[0x263F07490]);
  sub_230812418();
  type metadata accessor for AppInstallation.Progress(0);
  sub_230812988();
  sub_230812698();
  sub_230812978();
  sub_230812988();
  sub_230812978();
  return sub_230812988();
}

uint64_t AppInstallation.hashValue.getter()
{
  return sub_2307E01AC((void (*)(unsigned char *))AppInstallation.hash(into:));
}

uint64_t sub_2307E01AC(void (*a1)(unsigned char *))
{
  sub_230812958();
  a1(v3);
  return sub_230812998();
}

uint64_t sub_2307E01F4(uint64_t a1, uint64_t a2)
{
  return sub_2307E020C(a1, a2, (void (*)(unsigned char *))AppInstallation.hash(into:));
}

uint64_t sub_2307E020C(uint64_t a1, uint64_t a2, void (*a3)(unsigned char *))
{
  sub_230812958();
  a3(v5);
  return sub_230812998();
}

uint64_t sub_2307E0258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2307E0270(a1, a2, a3, (void (*)(unsigned char *))AppInstallation.hash(into:));
}

uint64_t sub_2307E0270(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *))
{
  sub_230812958();
  a4(v6);
  return sub_230812998();
}

BOOL _s8AppState0A12InstallationV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  id v5 = objc_msgSend(*(id *)(*(void *)a1 + 16), sel_storeItemID);
  if (v5 == objc_msgSend(*(id *)(v4 + 16), sel_storeItemID)
    && (uint64_t v6 = (int *)type metadata accessor for AppInstallation(0),
        (static AppInstallation.Phase.== infix(_:_:)(a1 + v6[5], (uint64_t)a2 + v6[5]) & 1) != 0)
    && (uint64_t v7 = v6[6],
        uint64_t v8 = a1 + v7,
        uint64_t v9 = (char *)a2 + v7,
        uint64_t v10 = type metadata accessor for AppInstallation.Progress(0),
        *(double *)(v8 + *(int *)(v10 + 20)) == *(double *)&v9[*(int *)(v10 + 20)])
    && *(unsigned __int8 *)(a1 + v6[7]) == *((unsigned __int8 *)a2 + v6[7])
    && *(void *)(a1 + v6[8]) == *(uint64_t *)((char *)a2 + v6[8])
    && *(unsigned __int8 *)(a1 + v6[9]) == *((unsigned __int8 *)a2 + v6[9]))
  {
    return *(void *)(a1 + v6[10]) == *(uint64_t *)((char *)a2 + v6[10]);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_2307E03BC()
{
  return sub_2307E0404(&qword_268702CB8, (void (*)(uint64_t))type metadata accessor for AppInstallation.Progress);
}

uint64_t sub_2307E0404(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2307E044C()
{
  return sub_2307E0404(&qword_268702CC0, (void (*)(uint64_t))type metadata accessor for AppInstallation.Phase);
}

uint64_t sub_2307E0494()
{
  return sub_2307E0404(&qword_268702CC8, (void (*)(uint64_t))type metadata accessor for AppInstallation);
}

void *initializeBufferWithCopyOfBuffer for AppInstallation(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = type metadata accessor for AppInstallation.Phase(0);
    swift_retain();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        uint64_t v12 = sub_230812048();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
        uint64_t v13 = type metadata accessor for AppInstallation.Progress(0);
        *(void *)((char *)v9 + *(int *)(v13 + 20)) = *(void *)((char *)v10 + *(int *)(v13 + 20));
        uint64_t v14 = *(int *)(v13 + 24);
        uint64_t v15 = *(void **)((char *)v10 + v14);
        *(void *)((char *)v9 + v14) = v15;
        id v16 = v15;
        goto LABEL_7;
      case 3u:
        *uint64_t v9 = *v10;
        swift_retain();
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
        break;
    }
    uint64_t v17 = a3[6];
    id v18 = (char *)v7 + v17;
    id v19 = (char *)a2 + v17;
    uint64_t v20 = sub_230812048();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    uint64_t v21 = type metadata accessor for AppInstallation.Progress(0);
    *(void *)&v18[*(int *)(v21 + 20)] = *(void *)&v19[*(int *)(v21 + 20)];
    uint64_t v22 = *(int *)(v21 + 24);
    uint64_t v23 = *(void **)&v19[v22];
    *(void *)&v18[v22] = v23;
    uint64_t v24 = a3[8];
    *((unsigned char *)v7 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *(void *)((char *)v7 + v24) = *(void *)((char *)a2 + v24);
    uint64_t v25 = a3[10];
    *((unsigned char *)v7 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    *(void *)((char *)v7 + v25) = *(void *)((char *)a2 + v25);
    id v26 = v23;
  }
  return v7;
}

void destroy for AppInstallation(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  type metadata accessor for AppInstallation.Phase(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      uint64_t v5 = sub_230812048();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

      break;
    case 3u:
      swift_release();
      break;
    default:
      break;
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_230812048();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = *(void **)(v6 + *(int *)(type metadata accessor for AppInstallation.Progress(0) + 24));
}

void *initializeWithCopy for AppInstallation(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  uint64_t v9 = type metadata accessor for AppInstallation.Phase(0);
  swift_retain();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      uint64_t v10 = sub_230812048();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v7, v8, v10);
      uint64_t v11 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)((char *)v7 + *(int *)(v11 + 20)) = *(void *)((char *)v8 + *(int *)(v11 + 20));
      uint64_t v12 = *(int *)(v11 + 24);
      uint64_t v13 = *(void **)((char *)v8 + v12);
      *(void *)((char *)v7 + v12) = v13;
      id v14 = v13;
      goto LABEL_5;
    case 3u:
      void *v7 = *v8;
      swift_retain();
LABEL_5:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
      break;
  }
  uint64_t v15 = a3[6];
  id v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_230812048();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  uint64_t v19 = type metadata accessor for AppInstallation.Progress(0);
  *(void *)&v16[*(int *)(v19 + 20)] = *(void *)&v17[*(int *)(v19 + 20)];
  uint64_t v20 = *(int *)(v19 + 24);
  uint64_t v21 = *(void **)&v17[v20];
  *(void *)&v16[v20] = v21;
  uint64_t v22 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);
  uint64_t v23 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + v23) = *(void *)((char *)a2 + v23);
  id v24 = v21;
  return a1;
}

void *assignWithCopy for AppInstallation(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_2307DF450((uint64_t)a1 + v6, type metadata accessor for AppInstallation.Phase);
    uint64_t v9 = type metadata accessor for AppInstallation.Phase(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        uint64_t v10 = sub_230812048();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v7, v8, v10);
        uint64_t v11 = type metadata accessor for AppInstallation.Progress(0);
        *(void *)((char *)v7 + *(int *)(v11 + 20)) = *(void *)((char *)v8 + *(int *)(v11 + 20));
        uint64_t v12 = *(int *)(v11 + 24);
        uint64_t v13 = *(void **)((char *)v8 + v12);
        *(void *)((char *)v7 + v12) = v13;
        id v14 = v13;
        goto LABEL_6;
      case 3u:
        void *v7 = *v8;
        swift_retain();
LABEL_6:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
        break;
    }
  }
  uint64_t v15 = a3[6];
  id v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = sub_230812048();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  uint64_t v19 = type metadata accessor for AppInstallation.Progress(0);
  *(void *)&v16[*(int *)(v19 + 20)] = *(void *)&v17[*(int *)(v19 + 20)];
  uint64_t v20 = *(int *)(v19 + 24);
  uint64_t v21 = *(void **)&v17[v20];
  uint64_t v22 = *(void **)&v16[v20];
  *(void *)&v16[v20] = v21;
  id v23 = v21;

  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  return a1;
}

void *initializeWithTake for AppInstallation(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for AppInstallation.Phase(0);
  if (swift_getEnumCaseMultiPayload() > 2)
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    uint64_t v10 = sub_230812048();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    uint64_t v11 = type metadata accessor for AppInstallation.Progress(0);
    *(void *)&v7[*(int *)(v11 + 20)] = *(void *)&v8[*(int *)(v11 + 20)];
    *(void *)&v7[*(int *)(v11 + 24)] = *(void *)&v8[*(int *)(v11 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  id v14 = (char *)a2 + v12;
  uint64_t v15 = sub_230812048();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = type metadata accessor for AppInstallation.Progress(0);
  *(void *)&v13[*(int *)(v16 + 20)] = *(void *)&v14[*(int *)(v16 + 20)];
  *(void *)&v13[*(int *)(v16 + 24)] = *(void *)&v14[*(int *)(v16 + 24)];
  uint64_t v17 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  uint64_t v18 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  return a1;
}

void *assignWithTake for AppInstallation(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_2307DF450((uint64_t)a1 + v6, type metadata accessor for AppInstallation.Phase);
    uint64_t v9 = type metadata accessor for AppInstallation.Phase(0);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v10 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      uint64_t v11 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&v7[*(int *)(v11 + 20)] = *(void *)&v8[*(int *)(v11 + 20)];
      *(void *)&v7[*(int *)(v11 + 24)] = *(void *)&v8[*(int *)(v11 + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = (char *)a1 + v12;
  id v14 = (char *)a2 + v12;
  uint64_t v15 = sub_230812048();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = type metadata accessor for AppInstallation.Progress(0);
  *(void *)&v13[*(int *)(v16 + 20)] = *(void *)&v14[*(int *)(v16 + 20)];
  uint64_t v17 = *(int *)(v16 + 24);
  uint64_t v18 = *(void **)&v13[v17];
  *(void *)&v13[v17] = *(void *)&v14[v17];

  uint64_t v19 = a3[8];
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  uint64_t v20 = a3[10];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2307E1468);
}

uint64_t sub_2307E1468(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for AppInstallation.Phase(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for AppInstallation.Progress(0);
      id v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for AppInstallation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2307E15A8);
}

void *sub_2307E15A8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for AppInstallation.Phase(0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for AppInstallation.Progress(0);
      id v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AppInstallation.Progress(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_230812048();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    id v10 = v9;
  }
  return a1;
}

void destroy for AppInstallation.Progress(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_230812048();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  int v5 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t initializeWithCopy for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_230812048();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  id v9 = v8;
  return a1;
}

uint64_t assignWithCopy for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_230812048();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = *(void **)(a2 + v7);
  id v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  return a1;
}

uint64_t initializeWithTake for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_230812048();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_230812048();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2307E1A60);
}

uint64_t sub_2307E1A60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_230812048();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for AppInstallation.Progress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2307E1B34);
}

uint64_t sub_2307E1B34(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_230812048();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AppInstallation.Phase(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        uint64_t v7 = sub_230812048();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        uint64_t v8 = type metadata accessor for AppInstallation.Progress(0);
        *(uint64_t *)((char *)a1 + *(int *)(v8 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 20));
        uint64_t v9 = *(int *)(v8 + 24);
        unint64_t v10 = *(void **)((char *)a2 + v9);
        *(uint64_t *)((char *)a1 + v9) = (uint64_t)v10;
        id v11 = v10;
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        *a1 = *a2;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

void destroy for AppInstallation.Phase(uint64_t a1)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      uint64_t v2 = sub_230812048();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
      int v3 = *(void **)(a1 + *(int *)(type metadata accessor for AppInstallation.Progress(0) + 24));

      break;
    case 3u:
      swift_release();
      break;
    default:
      return;
  }
}

void *initializeWithCopy for AppInstallation.Phase(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      uint64_t v6 = sub_230812048();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)((char *)a1 + *(int *)(v7 + 20)) = *(void *)((char *)a2 + *(int *)(v7 + 20));
      uint64_t v8 = *(int *)(v7 + 24);
      uint64_t v9 = *(void **)((char *)a2 + v8);
      *(void *)((char *)a1 + v8) = v9;
      id v10 = v9;
      goto LABEL_5;
    case 3u:
      *a1 = *a2;
      swift_retain();
LABEL_5:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *assignWithCopy for AppInstallation.Phase(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2307DF450((uint64_t)a1, type metadata accessor for AppInstallation.Phase);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        uint64_t v6 = sub_230812048();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        uint64_t v7 = type metadata accessor for AppInstallation.Progress(0);
        *(void *)((char *)a1 + *(int *)(v7 + 20)) = *(void *)((char *)a2 + *(int *)(v7 + 20));
        uint64_t v8 = *(int *)(v7 + 24);
        uint64_t v9 = *(void **)((char *)a2 + v8);
        *(void *)((char *)a1 + v8) = v9;
        id v10 = v9;
        goto LABEL_6;
      case 3u:
        *a1 = *a2;
        swift_retain();
LABEL_6:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

char *initializeWithTake for AppInstallation.Phase(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 2)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = sub_230812048();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = type metadata accessor for AppInstallation.Progress(0);
    *(void *)&a1[*(int *)(v7 + 20)] = *(void *)&a2[*(int *)(v7 + 20)];
    *(void *)&a1[*(int *)(v7 + 24)] = *(void *)&a2[*(int *)(v7 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for AppInstallation.Phase(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2307DF450((uint64_t)a1, type metadata accessor for AppInstallation.Phase);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&a1[*(int *)(v7 + 20)] = *(void *)&a2[*(int *)(v7 + 20)];
      *(void *)&a1[*(int *)(v7 + 24)] = *(void *)&a2[*(int *)(v7 + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallation.Phase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AppInstallation.Phase(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2307E2768()
{
  return sub_2307E0404(&qword_268702CD0, (void (*)(uint64_t))type metadata accessor for AppInstallation.ASDAppStore);
}

uint64_t AppInstallationType.init(_:)@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  type metadata accessor for State();
  uint64_t result = swift_getEnumCaseMultiPayload();
  char v5 = 1;
  switch((int)result)
  {
    case 0:
      char v5 = *a1;
      break;
    case 2:
      uint64_t result = sub_2307E286C((uint64_t)a1);
      char v5 = 2;
      break;
    case 3:
      uint64_t result = sub_2307E286C((uint64_t)a1);
      char v5 = 3;
      break;
    case 6:
      break;
    default:
      uint64_t result = sub_2307E286C((uint64_t)a1);
      char v5 = 0;
      break;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_2307E286C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for State();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

AppState::AppInstallationType_optional __swiftcall AppInstallationType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_230812848();
  result.value = swift_bridgeObjectRelease();
  char v5 = 4;
  if (v3 < 4) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t AppInstallationType.rawValue.getter()
{
  uint64_t result = 0x6E776F6E6B6E75;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6573616863727570;
      break;
    case 2:
      uint64_t result = 0x657461647075;
      break;
    case 3:
      uint64_t result = 0x6F6C6E776F646572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2307E29B4(unsigned __int8 *a1, char *a2)
{
  return sub_2307E4AFC(*a1, *a2);
}

unint64_t sub_2307E29C4()
{
  unint64_t result = qword_268702CD8;
  if (!qword_268702CD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702CD8);
  }
  return result;
}

uint64_t sub_2307E2A18()
{
  return sub_230812998();
}

uint64_t sub_2307E2AF4()
{
  sub_230812468();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2307E2BB8()
{
  return sub_230812998();
}

AppState::AppInstallationType_optional sub_2307E2C90(Swift::String *a1)
{
  return AppInstallationType.init(rawValue:)(*a1);
}

void sub_2307E2C9C(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x6E776F6E6B6E75;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x6573616863727570;
      goto LABEL_3;
    case 2:
      *a1 = 0x657461647075;
      a1[1] = 0xE600000000000000;
      break;
    case 3:
      *a1 = 0x6F6C6E776F646572;
      a1[1] = 0xEA00000000006461;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t getEnumTagSinglePayload for AppInstallationType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AppInstallationType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x2307E2E94);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

void __swiftcall AppOffer.init(flags:ageRating:baseBuyParams:metricsBuyParams:)(AppState::AppOffer *__return_ptr retstr, AppState::AppOffer::Flags flags, Swift::Int_optional ageRating, Swift::String baseBuyParams, Swift::String metricsBuyParams)
{
  retstr->flags.rawValue = *(void *)flags.rawValue;
  retstr->ageRating.value = ageRating.value;
  retstr->ageRating.is_nil = ageRating.is_nil;
  retstr->baseBuyParams = baseBuyParams;
  retstr->metricsBuyParams = metricsBuyParams;
}

uint64_t AppOffer.Flags.rawValue.getter()
{
  return *(void *)v0;
}

AppState::AppOffer::Flags __swiftcall AppOffer.Flags.init(rawValue:)(AppState::AppOffer::Flags rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static AppOffer.Flags.none.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static AppOffer.Flags.dsidLess.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static AppOffer.Flags.disabled.getter(void *a1@<X8>)
{
  *a1 = 4;
}

void static AppOffer.Flags.arcadeApp.getter(void *a1@<X8>)
{
  *a1 = 8;
}

void static AppOffer.Flags.preorder.getter(void *a1@<X8>)
{
  *a1 = 16;
}

void *sub_2307E2F20@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2307E2F2C()
{
  return sub_230812998();
}

uint64_t sub_2307E2F74()
{
  return sub_230812968();
}

uint64_t sub_2307E2FA0()
{
  return sub_230812998();
}

void sub_2307E2FE4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_2307E2FEC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_2307E3000@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_2307E3014@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_2307E3028(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_2307E3058@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2307E3084@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_2307E30A8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_2307E30BC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_2307E30D0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_2307E30E4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2307E30F8(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_2307E310C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_2307E3120(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_2307E3134()
{
  return *v0 == 0;
}

uint64_t sub_2307E3144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_2307E315C(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_2307E3174@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

void AppOffer.flags.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t AppOffer.ageRating.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_2307E31E4()
{
  uint64_t v2 = v0[3];
  unint64_t v1 = v0[4];
  uint64_t v4 = v0[5];
  unint64_t v3 = v0[6];
  uint64_t v5 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_23080BD48(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v8 = *((void *)v6 + 2);
    unint64_t v7 = *((void *)v6 + 3);
    if (v8 >= v7 >> 1) {
      uint64_t v6 = sub_23080BD48((char *)(v7 > 1), v8 + 1, 1, v6);
    }
    *((void *)v6 + 2) = v8 + 1;
    uint64_t v9 = &v6[16 * v8];
    *((void *)v9 + 4) = v2;
    *((void *)v9 + 5) = v1;
  }
  else
  {
    uint64_t v6 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v10 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v10 = v4 & 0xFFFFFFFFFFFFLL;
  }
  if (v10)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v6 = sub_23080BD48(0, *((void *)v6 + 2) + 1, 1, v6);
    }
    unint64_t v12 = *((void *)v6 + 2);
    unint64_t v11 = *((void *)v6 + 3);
    if (v12 >= v11 >> 1) {
      uint64_t v6 = sub_23080BD48((char *)(v11 > 1), v12 + 1, 1, v6);
    }
    *((void *)v6 + 2) = v12 + 1;
    uint64_t v13 = &v6[16 * v12];
    *((void *)v13 + 4) = v4;
    *((void *)v13 + 5) = v3;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268702CF8);
  sub_2307E3C68();
  uint64_t v14 = sub_230812428();
  swift_bridgeObjectRelease();
  return v14;
}

BOOL sub_2307E3374()
{
  return (sub_2308124D8() & 1) == 0;
}

uint64_t AppOffer.apply(to:of:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for State();
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*v2 & 2) != 0)
  {
    sub_2307CE248(a1, (uint64_t)v7);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      swift_bridgeObjectRelease();
      return swift_storeEnumTagMultiPayload();
    }
    sub_2307E286C((uint64_t)v7);
  }
  return sub_2307CE248(a1, a2);
}

uint64_t AppOffer.hash(into:)()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_230812968();
  sub_230812978();
  if (v1 != 1) {
    sub_230812968();
  }
  swift_bridgeObjectRetain();
  sub_230812468();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_230812468();
  return swift_bridgeObjectRelease();
}

uint64_t AppOffer.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_230812958();
  sub_230812968();
  sub_230812978();
  if (v1 != 1) {
    sub_230812968();
  }
  swift_bridgeObjectRetain();
  sub_230812468();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_230812468();
  swift_bridgeObjectRelease();
  return sub_230812998();
}

uint64_t sub_2307E3638()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_230812968();
  sub_230812978();
  if (v1 != 1) {
    sub_230812968();
  }
  swift_bridgeObjectRetain();
  sub_230812468();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_230812468();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2307E3700()
{
  int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_230812958();
  sub_230812968();
  sub_230812978();
  if (v1 != 1) {
    sub_230812968();
  }
  swift_bridgeObjectRetain();
  sub_230812468();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_230812468();
  swift_bridgeObjectRelease();
  return sub_230812998();
}

uint64_t _s8AppState0A5OfferV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 != *(void *)a2) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  if (*(unsigned char *)(a1 + 16))
  {
    if (!*(unsigned char *)(a2 + 16)) {
      return 0;
    }
  }
  else
  {
    if (*(void *)(a1 + 8) == *(void *)(a2 + 8)) {
      char v9 = *(unsigned char *)(a2 + 16);
    }
    else {
      char v9 = 1;
    }
    if (v9) {
      return 0;
    }
  }
  if (v3 == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)
    || (char v10 = sub_230812878(), result = 0, (v10 & 1) != 0))
  {
    if (v4 == v6 && v5 == v7)
    {
      return 1;
    }
    else
    {
      return sub_230812878();
    }
  }
  return result;
}

unint64_t sub_2307E38C4()
{
  unint64_t result = qword_268702CE0;
  if (!qword_268702CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702CE0);
  }
  return result;
}

unint64_t sub_2307E391C()
{
  unint64_t result = qword_268702CE8;
  if (!qword_268702CE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702CE8);
  }
  return result;
}

unint64_t sub_2307E3974()
{
  unint64_t result = qword_26AF24058;
  if (!qword_26AF24058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF24058);
  }
  return result;
}

unint64_t sub_2307E39CC()
{
  unint64_t result = qword_26AF24060;
  if (!qword_26AF24060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF24060);
  }
  return result;
}

unint64_t sub_2307E3A24()
{
  unint64_t result = qword_268702CF0;
  if (!qword_268702CF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702CF0);
  }
  return result;
}

uint64_t initializeWithCopy for AppOffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppOffer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for AppOffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppOffer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppOffer(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppOffer.Flags()
{
  return &type metadata for AppOffer.Flags;
}

unint64_t sub_2307E3C68()
{
  unint64_t result = qword_268702D00;
  if (!qword_268702D00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268702CF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702D00);
  }
  return result;
}

AppState::AppOpenableDestination_optional __swiftcall AppOpenableDestination.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  uint64_t v3 = sub_230812848();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *unint64_t v2 = v5;
  return result;
}

uint64_t AppOpenableDestination.rawValue.getter()
{
  if (*v0) {
    return 0x736567617373656DLL;
  }
  else {
    return 7368801;
  }
}

uint64_t sub_2307E3D60(char *a1, char *a2)
{
  return sub_2307E4C8C(*a1, *a2);
}

unint64_t sub_2307E3D70()
{
  unint64_t result = qword_268702D08;
  if (!qword_268702D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702D08);
  }
  return result;
}

uint64_t sub_2307E3DC4()
{
  return sub_230812998();
}

uint64_t sub_2307E3E40()
{
  sub_230812468();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2307E3EA8()
{
  return sub_230812998();
}

AppState::AppOpenableDestination_optional sub_2307E3F20(Swift::String *a1)
{
  return AppOpenableDestination.init(rawValue:)(*a1);
}

void sub_2307E3F2C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 7368801;
  if (*v1) {
    uint64_t v2 = 0x736567617373656DLL;
  }
  unint64_t v3 = 0xE300000000000000;
  if (*v1) {
    unint64_t v3 = 0xE800000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

unsigned char *storeEnumTagSinglePayload for AppOpenableDestination(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2307E4030);
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

BOOL static AppPurchaseType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AppPurchaseType.hash(into:)()
{
  return sub_230812968();
}

uint64_t AppPurchaseType.hashValue.getter()
{
  return sub_230812998();
}

unint64_t sub_2307E40E8()
{
  unint64_t result = qword_268702D10;
  if (!qword_268702D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702D10);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppPurchaseType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2307E4208);
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

uint64_t sub_2307E4250@<X0>(void *a1@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for AppInstallation.Progress(0);
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = &v29[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for AppInstallation.Phase(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  unint64_t v12 = &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v29[-v13];
  id v15 = objc_msgSend(a1, sel_progress);
  if (v15)
  {
    id v16 = v15;
    sub_230812038();
    objc_msgSend(v16, sel_fractionCompleted);
    *(void *)&v14[*(int *)(v6 + 20)] = v17;
    *(void *)&v14[*(int *)(v6 + 24)] = v16;
    swift_storeEnumTagMultiPayload();
    if (objc_msgSend(v16, sel_isIndeterminate))
    {
      sub_2307E4784((uint64_t)v14, type metadata accessor for AppInstallation.Phase);

      *a3 = 0;
    }
    else
    {
      int v30 = a2;
      sub_2307DF874((uint64_t)v14, (uint64_t)v12, type metadata accessor for AppInstallation.Phase);
      id v22 = v16;
      id v23 = a1;
      sub_230812038();
      objc_msgSend(v22, sel_fractionCompleted);
      *(void *)&v8[*(int *)(v6 + 20)] = v24;
      *(void *)&v8[*(int *)(v6 + 24)] = v22;
      type metadata accessor for AppInstallation.ASDAppStore();
      uint64_t v25 = swift_allocObject();
      *(void *)(v25 + 16) = v23;
      *(void *)a3 = v25;
      id v26 = (int *)type metadata accessor for AppInstallation(0);
      sub_2307DF874((uint64_t)v12, (uint64_t)&a3[v26[5]], type metadata accessor for AppInstallation.Phase);
      sub_2307DF874((uint64_t)v8, (uint64_t)&a3[v26[6]], type metadata accessor for AppInstallation.Progress);
      id v27 = v23;
      a3[v26[7]] = objc_msgSend(v27, sel_hasPostProcessing);
      *(void *)&a3[v26[8]] = objc_msgSend(v27, sel_essentialBackgroundAssetDownloadEstimate);
      a3[v26[9]] = v30 & 1;
      id v28 = objc_msgSend(v27, sel_storeExternalVersionID);

      sub_2307E4784((uint64_t)v8, type metadata accessor for AppInstallation.Progress);
      sub_2307E4784((uint64_t)v12, type metadata accessor for AppInstallation.Phase);

      *(void *)&a3[v26[10]] = v28;
      sub_2307E4784((uint64_t)v14, type metadata accessor for AppInstallation.Phase);
    }
    uint64_t v18 = type metadata accessor for State();
    swift_storeEnumTagMultiPayload();
    type metadata accessor for State();
    return (*(uint64_t (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a3, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = type metadata accessor for State();
    uint64_t v20 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
    return v20(a3, 1, 1, v19);
  }
}

uint64_t sub_2307E4638@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6 = objc_msgSend(a1, sel_postProcessProgress);
  if (v6)
  {
    uint64_t v7 = v6;
    objc_msgSend(v6, sel_fractionCompleted);
    if (v8 > 0.0)
    {
      sub_230812038();
      objc_msgSend(v7, sel_fractionCompleted);
      uint64_t v10 = v9;
      uint64_t v11 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)(a3 + *(int *)(v11 + 20)) = v10;
      *(void *)(a3 + *(int *)(v11 + 24)) = v7;
      goto LABEL_8;
    }
  }
  id v12 = objc_msgSend(a1, sel_downloadProgress);
  if (v12)
  {
    uint64_t v13 = v12;
    sub_230812038();
    objc_msgSend(v13, sel_fractionCompleted);
    uint64_t v15 = v14;
    uint64_t v16 = type metadata accessor for AppInstallation.Progress(0);
    *(void *)(a3 + *(int *)(v16 + 20)) = v15;
    *(void *)(a3 + *(int *)(v16 + 24)) = v13;
  }
  else
  {
    sub_2307DF874(a2, a3, type metadata accessor for AppInstallation.Progress);
  }
LABEL_8:
  type metadata accessor for AppInstallation.Phase(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2307E4784(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2307E47E4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for State();
  uint64_t v21 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_isHidden))
  {
    swift_bridgeObjectRelease();
LABEL_6:

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
    id v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    return v12(a4, 1, 1, v8);
  }
  BOOL v11 = sub_2307E4A30((uint64_t)objc_msgSend(a1, sel_purchaserDSID), a2);
  swift_bridgeObjectRelease();
  if (!v11) {
    goto LABEL_6;
  }
  if (objc_msgSend(a1, sel_isPreorder))
  {

    *uint64_t v10 = 1;
  }
  else
  {
    uint64_t v14 = a3[3];
    uint64_t v15 = a3[4];
    __swift_project_boxed_opaque_existential_1(a3, v14);
    if ((*(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 24))(a1, v14, v15))
    {
      id v16 = objc_msgSend(a1, sel_cleanedRedownloadParams);
      uint64_t v17 = sub_230812448();
      uint64_t v19 = v18;

      *(void *)uint64_t v10 = v17;
      *((void *)v10 + 1) = v19;
    }
    else
    {

      *uint64_t v10 = 0;
    }
  }
  swift_storeEnumTagMultiPayload();
  sub_2307CE37C((uint64_t)v10, a4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(a4, 0, 1, v8);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
}

BOOL sub_2307E4A30(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = sub_230812948();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v12 = *(void *)(v8 + 8 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_2307E4AFC(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x6E776F6E6B6E75;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E776F6E6B6E75;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x6573616863727570;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x657461647075;
      break;
    case 3:
      uint64_t v5 = 0x6F6C6E776F646572;
      unint64_t v3 = 0xEA00000000006461;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      if (v5 == 0x6573616863727570) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v2 = 0x657461647075;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xEA00000000006461;
      if (v5 == 0x6F6C6E776F646572) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_230812878();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_2307E4C8C(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x736567617373656DLL;
  }
  else {
    uint64_t v3 = 7368801;
  }
  if (v2) {
    unint64_t v4 = 0xE300000000000000;
  }
  else {
    unint64_t v4 = 0xE800000000000000;
  }
  if (a2) {
    uint64_t v5 = 0x736567617373656DLL;
  }
  else {
    uint64_t v5 = 7368801;
  }
  if (a2) {
    unint64_t v6 = 0xE800000000000000;
  }
  else {
    unint64_t v6 = 0xE300000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_230812878();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2307E4D2C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x656C6261797562;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x656C6261797562;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x676E6974696177;
      break;
    case 2:
      uint64_t v5 = 0x6573616863727570;
      goto LABEL_8;
    case 3:
      uint64_t v5 = 0x6C62617461647075;
      unint64_t v3 = 0xE900000000000065;
      break;
    case 4:
      uint64_t v5 = 0x64616F6C6E776F64;
      unint64_t v3 = 0xEC000000656C6261;
      break;
    case 5:
      uint64_t v5 = 0x696C6C6174736E69;
      unint64_t v3 = 0xEA0000000000676ELL;
      break;
    case 6:
      uint64_t v5 = 0x656C6C6174736E69;
LABEL_8:
      unint64_t v3 = 0xE900000000000064;
      break;
    case 7:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x656C62616E65706FLL;
      break;
    case 8:
      uint64_t v5 = 0x6E776F6E6B6E75;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      if (v5 == 0x676E6974696177) {
        goto LABEL_26;
      }
      goto LABEL_29;
    case 2:
      uint64_t v7 = 0x6573616863727570;
      goto LABEL_22;
    case 3:
      unint64_t v6 = 0xE900000000000065;
      if (v5 != 0x6C62617461647075) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 4:
      unint64_t v6 = 0xEC000000656C6261;
      if (v5 != 0x64616F6C6E776F64) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 5:
      unint64_t v6 = 0xEA0000000000676ELL;
      if (v5 != 0x696C6C6174736E69) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 6:
      uint64_t v7 = 0x656C6C6174736E69;
LABEL_22:
      unint64_t v6 = 0xE900000000000064;
      if (v5 != v7) {
        goto LABEL_29;
      }
      goto LABEL_26;
    case 7:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x656C62616E65706FLL;
      goto LABEL_25;
    case 8:
      if (v5 != 0x6E776F6E6B6E75) {
        goto LABEL_29;
      }
      goto LABEL_26;
    default:
LABEL_25:
      if (v5 != v2) {
        goto LABEL_29;
      }
LABEL_26:
      if (v3 == v6) {
        char v8 = 1;
      }
      else {
LABEL_29:
      }
        char v8 = sub_230812878();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8 & 1;
  }
}

uint64_t State.isLocalApplication.getter()
{
  uint64_t v1 = type metadata accessor for State();
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307CE2AC(v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = 1;
  if (EnumCaseMultiPayload == 2) {
    goto LABEL_7;
  }
  if (EnumCaseMultiPayload != 5 && EnumCaseMultiPayload != 7)
  {
    uint64_t v5 = 0;
LABEL_7:
    sub_2307CDF9C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  }
  return v5;
}

uint64_t State.isBuyable.getter()
{
  uint64_t v1 = type metadata accessor for State();
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307CE2AC(v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 6 || EnumCaseMultiPayload == 8) {
    return 1;
  }
  sub_2307CDF9C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  return 0;
}

BOOL State.isUpdatable.getter()
{
  uint64_t v1 = type metadata accessor for State();
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307CE2AC(v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  BOOL v4 = swift_getEnumCaseMultiPayload() == 2;
  sub_2307CDF9C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  return v4;
}

uint64_t State.isPendingUpdate.getter()
{
  uint64_t v1 = type metadata accessor for State();
  MEMORY[0x270FA5388](v1);
  unint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v4 = type metadata accessor for State;
  sub_2307CE2AC(v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v6 = 1;
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 2)
    {
      if (EnumCaseMultiPayload == 4)
      {
        uint64_t v7 = (uint64_t (*)())type metadata accessor for AppInstallation;
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t v7 = type metadata accessor for State;
      }
      BOOL v4 = v7;
    }
    sub_2307CDF9C((uint64_t)v3, (uint64_t (*)(void))v4);
  }
  return v6;
}

BOOL State.hasBeenPurchased.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for State();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v12 - v6;
  sub_2307CE2AC(v1, (uint64_t)&v12 - v6, (uint64_t (*)(void))type metadata accessor for State);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  BOOL v9 = EnumCaseMultiPayload == 8 || EnumCaseMultiPayload == 6;
  BOOL v10 = 0;
  if (!v9)
  {
    if (EnumCaseMultiPayload
      || (sub_2307CE2AC((uint64_t)v7, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for State),
          *v5 != 1))
    {
      BOOL v10 = 1;
    }
  }
  sub_2307CDF9C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for State);
  return v10;
}

BOOL State.hasKnownWaitingType.getter()
{
  uint64_t v1 = type metadata accessor for State();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307CE2AC(v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  if (!swift_getEnumCaseMultiPayload()) {
    return *v3 != 0;
  }
  sub_2307CDF9C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  return 0;
}

AppState::State::Key_optional __swiftcall State.Key.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_230812848();
  result.value = swift_bridgeObjectRelease();
  char v5 = 9;
  if (v3 < 9) {
    char v5 = v3;
  }
  *uint64_t v2 = v5;
  return result;
}

uint64_t State.Key.rawValue.getter()
{
  uint64_t result = 0x656C6261797562;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x676E6974696177;
      break;
    case 2:
      uint64_t result = 0x6573616863727570;
      break;
    case 3:
      uint64_t result = 0x6C62617461647075;
      break;
    case 4:
      uint64_t result = 0x64616F6C6E776F64;
      break;
    case 5:
      uint64_t result = 0x696C6C6174736E69;
      break;
    case 6:
      uint64_t result = 0x656C6C6174736E69;
      break;
    case 7:
      uint64_t result = 0x656C62616E65706FLL;
      break;
    case 8:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2307E5714(unsigned __int8 *a1, char *a2)
{
  return sub_2307E4D2C(*a1, *a2);
}

uint64_t sub_2307E5720()
{
  return sub_230812998();
}

uint64_t sub_2307E5768()
{
  return sub_2307D0D14();
}

uint64_t sub_2307E5770()
{
  return sub_230812998();
}

AppState::State::Key_optional sub_2307E57B4(Swift::String *a1)
{
  return State.Key.init(rawValue:)(*a1);
}

uint64_t sub_2307E57C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = State.Key.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t State.overrideBuyParams.getter()
{
  uint64_t v1 = type metadata accessor for State();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307CE2AC(v0, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  if ((swift_getEnumCaseMultiPayload() & 0xFFFFFFFE) == 2) {
    return *(void *)v3;
  }
  sub_2307CDF9C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for State);
  return 0;
}

uint64_t State.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for AppInstallation(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for State();
  MEMORY[0x270FA5388](v7);
  BOOL v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307CE2AC(v2, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for State);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_230812968();
      goto LABEL_6;
    case 4u:
      sub_2307E6C84((uint64_t)v9, (uint64_t)v6, type metadata accessor for AppInstallation);
      sub_230812968();
      AppInstallation.hash(into:)(a1);
      uint64_t result = sub_2307CDF9C((uint64_t)v6, type metadata accessor for AppInstallation);
      break;
    case 5u:
      sub_230812968();
      sub_230812468();
      swift_bridgeObjectRelease();
      uint64_t result = sub_230812988();
      break;
    case 6u:
    case 7u:
    case 8u:
LABEL_6:
      uint64_t result = sub_230812968();
      break;
    default:
      sub_230812968();
      sub_230812468();
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t State.hashValue.getter()
{
  sub_230812958();
  State.hash(into:)((uint64_t)v1);
  return sub_230812998();
}

uint64_t sub_2307E5C20()
{
  sub_230812958();
  State.hash(into:)((uint64_t)v1);
  return sub_230812998();
}

uint64_t sub_2307E5C64()
{
  sub_230812958();
  State.hash(into:)((uint64_t)v1);
  return sub_230812998();
}

unint64_t sub_2307E5CC8()
{
  unint64_t result = qword_268702D18;
  if (!qword_268702D18)
  {
    type metadata accessor for State();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702D18);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for State(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      *a1 = *a2;
      uint64_t v11 = (int *)type metadata accessor for AppInstallation(0);
      uint64_t v12 = v11[5];
      uint64_t v13 = (void *)((char *)a1 + v12);
      uint64_t v14 = (void *)((char *)a2 + v12);
      uint64_t v15 = type metadata accessor for AppInstallation.Phase(0);
      swift_retain();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
        case 2u:
          uint64_t v16 = sub_230812048();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v13, v14, v16);
          uint64_t v17 = type metadata accessor for AppInstallation.Progress(0);
          *(void *)((char *)v13 + *(int *)(v17 + 20)) = *(void *)((char *)v14 + *(int *)(v17 + 20));
          uint64_t v18 = *(int *)(v17 + 24);
          uint64_t v19 = *(void **)((char *)v14 + v18);
          *(void *)((char *)v13 + v18) = v19;
          id v20 = v19;
          goto LABEL_14;
        case 3u:
          *uint64_t v13 = *v14;
          swift_retain();
LABEL_14:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
          break;
      }
      uint64_t v21 = v11[6];
      id v22 = (char *)a1 + v21;
      id v23 = (char *)a2 + v21;
      uint64_t v24 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
      uint64_t v25 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&v22[*(int *)(v25 + 20)] = *(void *)&v23[*(int *)(v25 + 20)];
      uint64_t v26 = *(int *)(v25 + 24);
      id v27 = *(void **)&v23[v26];
      *(void *)&v22[v26] = v27;
      *((unsigned char *)a1 + v11[7]) = *((unsigned char *)a2 + v11[7]);
      *(void *)((char *)a1 + v11[8]) = *(void *)((char *)a2 + v11[8]);
      *((unsigned char *)a1 + v11[9]) = *((unsigned char *)a2 + v11[9]);
      *(void *)((char *)a1 + v11[10]) = *(void *)((char *)a2 + v11[10]);
      id v28 = v27;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

void *assignWithCopy for State(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2307CDF9C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for State);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      *a1 = *a2;
      uint64_t v7 = (int *)type metadata accessor for AppInstallation(0);
      uint64_t v8 = v7[5];
      uint64_t v9 = (void *)((char *)a1 + v8);
      BOOL v10 = (void *)((char *)a2 + v8);
      uint64_t v11 = type metadata accessor for AppInstallation.Phase(0);
      swift_retain();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
        case 2u:
          uint64_t v12 = sub_230812048();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
          uint64_t v13 = type metadata accessor for AppInstallation.Progress(0);
          *(void *)((char *)v9 + *(int *)(v13 + 20)) = *(void *)((char *)v10 + *(int *)(v13 + 20));
          uint64_t v14 = *(int *)(v13 + 24);
          uint64_t v15 = *(void **)((char *)v10 + v14);
          *(void *)((char *)v9 + v14) = v15;
          id v16 = v15;
          goto LABEL_12;
        case 3u:
          *uint64_t v9 = *v10;
          swift_retain();
LABEL_12:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
          break;
      }
      uint64_t v17 = v7[6];
      uint64_t v18 = (char *)a1 + v17;
      uint64_t v19 = (char *)a2 + v17;
      uint64_t v20 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
      uint64_t v21 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&v18[*(int *)(v21 + 20)] = *(void *)&v19[*(int *)(v21 + 20)];
      uint64_t v22 = *(int *)(v21 + 24);
      id v23 = *(void **)&v19[v22];
      *(void *)&v18[v22] = v23;
      *((unsigned char *)a1 + v7[7]) = *((unsigned char *)a2 + v7[7]);
      *(void *)((char *)a1 + v7[8]) = *(void *)((char *)a2 + v7[8]);
      *((unsigned char *)a1 + v7[9]) = *((unsigned char *)a2 + v7[9]);
      *(void *)((char *)a1 + v7[10]) = *(void *)((char *)a2 + v7[10]);
      id v24 = v23;
      goto LABEL_14;
    }
    if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
LABEL_14:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *initializeWithTake for State(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 4)
  {
    *a1 = *a2;
    uint64_t v6 = (int *)type metadata accessor for AppInstallation(0);
    uint64_t v7 = v6[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for AppInstallation.Phase(0);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      uint64_t v11 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      uint64_t v12 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&v8[*(int *)(v12 + 20)] = *(void *)&v9[*(int *)(v12 + 20)];
      *(void *)&v8[*(int *)(v12 + 24)] = *(void *)&v9[*(int *)(v12 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v13 = v6[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_230812048();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    uint64_t v17 = type metadata accessor for AppInstallation.Progress(0);
    *(void *)&v14[*(int *)(v17 + 20)] = *(void *)&v15[*(int *)(v17 + 20)];
    *(void *)&v14[*(int *)(v17 + 24)] = *(void *)&v15[*(int *)(v17 + 24)];
    *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
    *(void *)((char *)a1 + v6[8]) = *(void *)((char *)a2 + v6[8]);
    *((unsigned char *)a1 + v6[9]) = *((unsigned char *)a2 + v6[9]);
    *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for State(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2307CDF9C((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for State);
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      *a1 = *a2;
      uint64_t v6 = (int *)type metadata accessor for AppInstallation(0);
      uint64_t v7 = v6[5];
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = type metadata accessor for AppInstallation.Phase(0);
      if (swift_getEnumCaseMultiPayload() > 2)
      {
        memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
      }
      else
      {
        uint64_t v11 = sub_230812048();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
        uint64_t v12 = type metadata accessor for AppInstallation.Progress(0);
        *(void *)&v8[*(int *)(v12 + 20)] = *(void *)&v9[*(int *)(v12 + 20)];
        *(void *)&v8[*(int *)(v12 + 24)] = *(void *)&v9[*(int *)(v12 + 24)];
        swift_storeEnumTagMultiPayload();
      }
      uint64_t v13 = v6[6];
      uint64_t v14 = (char *)a1 + v13;
      uint64_t v15 = (char *)a2 + v13;
      uint64_t v16 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
      uint64_t v17 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&v14[*(int *)(v17 + 20)] = *(void *)&v15[*(int *)(v17 + 20)];
      *(void *)&v14[*(int *)(v17 + 24)] = *(void *)&v15[*(int *)(v17 + 24)];
      *((unsigned char *)a1 + v6[7]) = *((unsigned char *)a2 + v6[7]);
      *(void *)((char *)a1 + v6[8]) = *(void *)((char *)a2 + v6[8]);
      *((unsigned char *)a1 + v6[9]) = *((unsigned char *)a2 + v6[9]);
      *(void *)((char *)a1 + v6[10]) = *(void *)((char *)a2 + v6[10]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for State.Key(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for State.Key(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x2307E6BF8);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_2307E6C20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppInstallation.Phase(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2307E6C84(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t AppStateController.state(forApp:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for State();
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v12[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v9 = *((unsigned char *)a1 + 8);
  uint64_t v18 = *a1;
  char v19 = v9;
  swift_storeEnumTagMultiPayload();
  v12[0] = 0;
  v12[1] = 0;
  char v13 = 1;
  uint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  uint64_t v16 = 0;
  unint64_t v17 = 0xE000000000000000;
  (*(void (**)(uint64_t *, char *, void *, uint64_t, uint64_t))(a3 + 56))(&v18, v8, v12, a2, a3);
  return sub_2307E286C((uint64_t)v8);
}

uint64_t AppStateController.state(forApp:applying:)(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for State();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v20[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *a1;
  char v12 = *((unsigned char *)a1 + 8);
  uint64_t v13 = *a2;
  uint64_t v14 = a2[1];
  char v15 = *((unsigned char *)a2 + 16);
  long long v19 = *(_OWORD *)(a2 + 3);
  uint64_t v17 = a2[5];
  uint64_t v16 = a2[6];
  uint64_t v25 = v11;
  char v26 = v12;
  swift_storeEnumTagMultiPayload();
  v20[0] = v13;
  v20[1] = v14;
  char v21 = v15;
  long long v22 = v19;
  uint64_t v23 = v17;
  uint64_t v24 = v16;
  (*(void (**)(uint64_t *, char *, void *, uint64_t, uint64_t))(a4 + 56))(&v25, v10, v20, a3, a4);
  return sub_2307E286C((uint64_t)v10);
}

uint64_t AppStateController.prospectiveState(forApp:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v11 = *a1;
  char v12 = v3;
  v5[0] = 0;
  v5[1] = 0;
  char v6 = 1;
  uint64_t v7 = 0;
  unint64_t v8 = 0xE000000000000000;
  uint64_t v9 = 0;
  unint64_t v10 = 0xE000000000000000;
  return (*(uint64_t (**)(uint64_t *, void *, uint64_t))(a3 + 64))(&v11, v5, a2);
}

uint64_t AppStateController.clearWaiting(forApp:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v5 = *a1;
  char v6 = v3;
  return (*(uint64_t (**)(uint64_t *, void, uint64_t))(a3 + 120))(&v5, 0, a2) & 1;
}

uint64_t dispatch thunk of AppStateController.isLoaded.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppStateController.onLoad.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppStateController.loadDataSources()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307CBA50;
  return v7(a1, a2);
}

uint64_t dispatch thunk of AppStateController.reloadAllStates(synchronizing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 32) + **(int **)(a3 + 32));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2307CBA50;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of AppStateController.reloadState(forApps:synchronizing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 40) + **(int **)(a4 + 40));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2307C8818;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AppStateController.preloadState(forApps:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of AppStateController.state(forApp:initialState:applying:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of AppStateController.prospectiveState(forApp:applying:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of AppStateController.canTransitionState(forApp:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of AppStateController.transitionState(forApp:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of AppStateController.onStateChange.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of AppStateController.postsChanges(forApp:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of AppStateController.setPostsChanges(_:forApp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of AppStateController.setWaiting(forApp:installationType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 112))();
}

uint64_t dispatch thunk of AppStateController.clearWaiting(forApp:refreshState:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t dispatch thunk of AppStateController.refreshUpdateRegistry(forApp:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 128) + **(int **)(a4 + 128));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2307C8818;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AppStateController.isLocal(app:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of AppStateController.isRedownloadable(app:includingPreorders:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 144))();
}

uint64_t dispatch thunk of AppStateController.purchaseHistoryIncludes(app:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 152))();
}

uint64_t AppStateDataSource.isIncremental.getter()
{
  return 0;
}

uint64_t AppStateDataSource.providesState(forApp:)()
{
  return 1;
}

uint64_t AppStateDataSource.setWaiting(forAppWith:installationType:)()
{
  return 0;
}

uint64_t AppStateDataSource.clearWaiting(forAppWith:)()
{
  return 0;
}

uint64_t dispatch thunk of AppStateDataSource.isIncremental.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppStateDataSource.onSynchronizeAppStates.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppStateDataSource.load()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 24) + **(int **)(a2 + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307CBA50;
  return v7(a1, a2);
}

uint64_t dispatch thunk of AppStateDataSource.reloadState(forAppsWith:synchronizing:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 32) + **(int **)(a4 + 32));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2307C8818;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AppStateDataSource.reloadAllStates(synchronizing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 40) + **(int **)(a3 + 40));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2307CBA50;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of AppStateDataSource.state(forAppWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of AppStateDataSource.providesState(forApp:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of AppStateDataSource.setWaiting(forAppWith:installationType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t dispatch thunk of AppStateDataSource.clearWaiting(forAppWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t sub_2307E788C()
{
  uint64_t v1 = sub_2308129A8();
  sub_230812478();
  sub_230812868();
  sub_230812478();
  swift_bridgeObjectRelease();
  sub_230812478();
  return v1;
}

uint64_t sub_2307E7948@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, unsigned char *a5@<X8>)
{
  void (*v23)(long long *__return_ptr, char *, uint64_t, uint64_t, uint64_t);
  unsigned char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unsigned char *v43;
  long long v44;
  uint64_t v45;
  void v46[3];
  uint64_t v47;
  uint64_t v48;
  char v49;

  uint64_t v43 = a5;
  uint64_t v41 = a1;
  char v7 = a3 & 1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v42 = type metadata accessor for State();
  uint64_t v14 = *(void *)(v42 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v42);
  uint64_t v38 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v39 = (char *)&v37 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v37 - v19;
  uint64_t v21 = a2[8];
  uint64_t v22 = a2[9];
  __swift_project_boxed_opaque_existential_1(a2 + 5, v21);
  uint64_t v49 = v7;
  uint64_t v23 = *(void (**)(long long *__return_ptr, char *, uint64_t, uint64_t, uint64_t))(v22 + 8);
  uint64_t v40 = a4;
  v23(&v44, &v49, a4, v21, v22);
  if (v45)
  {
    uint64_t v24 = v43;
    sub_2307CDF84(&v44, (uint64_t)v46);
    uint64_t v25 = *v41;
    if (*(void *)(*v41 + 16))
    {
      char v26 = sub_2307D0570(v7);
      id v27 = v42;
      if (v28)
      {
        sub_2307CE248(*(void *)(v25 + 56) + *(void *)(v14 + 72) * v26, (uint64_t)v13);
        uint64_t v29 = 0;
      }
      else
      {
        uint64_t v29 = 1;
      }
    }
    else
    {
      uint64_t v29 = 1;
      id v27 = v42;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, v29, 1, v27);
    sub_2307D1F58((uint64_t)v13, (uint64_t)v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v27) == 1)
    {
      swift_storeEnumTagMultiPayload();
      sub_2307CDF28((uint64_t)v11, &qword_26AF24868);
    }
    else
    {
      sub_2307CE37C((uint64_t)v11, (uint64_t)v20);
    }
    uint64_t v32 = (uint64_t)v39;
    uint64_t v31 = v40;
    uint64_t v33 = v47;
    uint64_t v34 = v48;
    __swift_project_boxed_opaque_existential_1(v46, v47);
    LOBYTE(v33) = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 8))(v20, v31, v33, v34);
    sub_2307CE248((uint64_t)v20, v32);
    if (v33)
    {
      uint64_t v35 = 1;
    }
    else
    {
      uint64_t v36 = (uint64_t)v38;
      swift_storeEnumTagMultiPayload();
      uint64_t v35 = _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v32, v36);
      sub_2307CDFFC(v36, (uint64_t (*)(void))type metadata accessor for State);
    }
    sub_2307CDFFC(v32, (uint64_t (*)(void))type metadata accessor for State);
    sub_2307CDFFC((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for State);
    char *v24 = v35 & 1;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  }
  else
  {
    unint64_t result = sub_2307CDF28((uint64_t)&v44, &qword_268702D58);
    *uint64_t v43 = 0;
  }
  return result;
}

uint64_t sub_2307E7CE8()
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  return MEMORY[0x270FA0228](v0, 120, 7);
}

void *sub_2307E7D38(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(void *)a1 = *a2;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v5 = *(int *)(a3 + 24);
    char v6 = (void *)(a1 + v5);
    char v7 = (uint64_t *)((char *)a2 + v5);
    uint64_t v8 = type metadata accessor for State();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      *char v6 = *v7;
      uint64_t v13 = (int *)type metadata accessor for AppInstallation(0);
      uint64_t v14 = v13[5];
      uint64_t v15 = (void *)((char *)v6 + v14);
      uint64_t v16 = (void *)((char *)v7 + v14);
      uint64_t v17 = type metadata accessor for AppInstallation.Phase(0);
      swift_retain();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
        case 2u:
          uint64_t v18 = sub_230812048();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v18 - 8) + 16))(v15, v16, v18);
          uint64_t v19 = type metadata accessor for AppInstallation.Progress(0);
          *(void *)((char *)v15 + *(int *)(v19 + 20)) = *(void *)((char *)v16 + *(int *)(v19 + 20));
          uint64_t v20 = *(int *)(v19 + 24);
          uint64_t v21 = *(void **)((char *)v16 + v20);
          *(void *)((char *)v15 + v20) = v21;
          id v22 = v21;
          goto LABEL_14;
        case 3u:
          *uint64_t v15 = *v16;
          swift_retain();
LABEL_14:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
          break;
      }
      uint64_t v23 = v13[6];
      uint64_t v24 = (char *)v6 + v23;
      uint64_t v25 = (char *)v7 + v23;
      uint64_t v26 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
      uint64_t v27 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&v24[*(int *)(v27 + 20)] = *(void *)&v25[*(int *)(v27 + 20)];
      uint64_t v28 = *(int *)(v27 + 24);
      uint64_t v29 = *(void **)&v25[v28];
      *(void *)&v24[v28] = v29;
      *((unsigned char *)v6 + v13[7]) = *((unsigned char *)v7 + v13[7]);
      *(void *)((char *)v6 + v13[8]) = *(void *)((char *)v7 + v13[8]);
      *((unsigned char *)v6 + v13[9]) = *((unsigned char *)v7 + v13[9]);
      *(void *)((char *)v6 + v13[10]) = *(void *)((char *)v7 + v13[10]);
      id v30 = v29;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
    {
      uint64_t v10 = v7[1];
      *char v6 = *v7;
      v6[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
    }
  }
  return v3;
}

uint64_t sub_2307E8154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  if (a1 != a2)
  {
    uint64_t v4 = *(int *)(a3 + 24);
    uint64_t v5 = (void *)(a1 + v4);
    char v6 = (void *)(a2 + v4);
    sub_2307CDFFC(a1 + v4, (uint64_t (*)(void))type metadata accessor for State);
    uint64_t v7 = type metadata accessor for State();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 4)
    {
      void *v5 = *v6;
      uint64_t v9 = (int *)type metadata accessor for AppInstallation(0);
      uint64_t v10 = v9[5];
      uint64_t v11 = (void *)((char *)v5 + v10);
      uint64_t v12 = (void *)((char *)v6 + v10);
      uint64_t v13 = type metadata accessor for AppInstallation.Phase(0);
      swift_retain();
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
        case 1u:
        case 2u:
          uint64_t v14 = sub_230812048();
          (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v11, v12, v14);
          uint64_t v15 = type metadata accessor for AppInstallation.Progress(0);
          *(void *)((char *)v11 + *(int *)(v15 + 20)) = *(void *)((char *)v12 + *(int *)(v15 + 20));
          uint64_t v16 = *(int *)(v15 + 24);
          uint64_t v17 = *(void **)((char *)v12 + v16);
          *(void *)((char *)v11 + v16) = v17;
          id v18 = v17;
          goto LABEL_12;
        case 3u:
          *uint64_t v11 = *v12;
          swift_retain();
LABEL_12:
          swift_storeEnumTagMultiPayload();
          break;
        default:
          memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
          break;
      }
      uint64_t v19 = v9[6];
      uint64_t v20 = (char *)v5 + v19;
      uint64_t v21 = (char *)v6 + v19;
      uint64_t v22 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
      uint64_t v23 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&v20[*(int *)(v23 + 20)] = *(void *)&v21[*(int *)(v23 + 20)];
      uint64_t v24 = *(int *)(v23 + 24);
      uint64_t v25 = *(void **)&v21[v24];
      *(void *)&v20[v24] = v25;
      *((unsigned char *)v5 + v9[7]) = *((unsigned char *)v6 + v9[7]);
      *(void *)((char *)v5 + v9[8]) = *(void *)((char *)v6 + v9[8]);
      *((unsigned char *)v5 + v9[9]) = *((unsigned char *)v6 + v9[9]);
      *(void *)((char *)v5 + v9[10]) = *(void *)((char *)v6 + v9[10]);
      id v26 = v25;
      goto LABEL_14;
    }
    if (EnumCaseMultiPayload == 3 || EnumCaseMultiPayload == 2)
    {
      void *v5 = *v6;
      v5[1] = v6[1];
      swift_bridgeObjectRetain();
LABEL_14:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2307E852C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  char v6 = (void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for State();
  if (swift_getEnumCaseMultiPayload() == 4)
  {
    void *v5 = *v6;
    uint64_t v8 = (int *)type metadata accessor for AppInstallation(0);
    uint64_t v9 = v8[5];
    uint64_t v10 = (char *)v5 + v9;
    uint64_t v11 = (char *)v6 + v9;
    uint64_t v12 = type metadata accessor for AppInstallation.Phase(0);
    if (swift_getEnumCaseMultiPayload() > 2)
    {
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      uint64_t v13 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
      uint64_t v14 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&v10[*(int *)(v14 + 20)] = *(void *)&v11[*(int *)(v14 + 20)];
      *(void *)&v10[*(int *)(v14 + 24)] = *(void *)&v11[*(int *)(v14 + 24)];
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v15 = v8[6];
    uint64_t v16 = (char *)v5 + v15;
    uint64_t v17 = (char *)v6 + v15;
    uint64_t v18 = sub_230812048();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
    uint64_t v19 = type metadata accessor for AppInstallation.Progress(0);
    *(void *)&v16[*(int *)(v19 + 20)] = *(void *)&v17[*(int *)(v19 + 20)];
    *(void *)&v16[*(int *)(v19 + 24)] = *(void *)&v17[*(int *)(v19 + 24)];
    *((unsigned char *)v5 + v8[7]) = *((unsigned char *)v6 + v8[7]);
    *(void *)((char *)v5 + v8[8]) = *(void *)((char *)v6 + v8[8]);
    *((unsigned char *)v5 + v8[9]) = *((unsigned char *)v6 + v8[9]);
    *(void *)((char *)v5 + v8[10]) = *(void *)((char *)v6 + v8[10]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_2307E882C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  if (a1 != a2)
  {
    uint64_t v4 = *(int *)(a3 + 24);
    uint64_t v5 = (void *)(a1 + v4);
    char v6 = (void *)(a2 + v4);
    sub_2307CDFFC(a1 + v4, (uint64_t (*)(void))type metadata accessor for State);
    uint64_t v7 = type metadata accessor for State();
    if (swift_getEnumCaseMultiPayload() == 4)
    {
      void *v5 = *v6;
      uint64_t v8 = (int *)type metadata accessor for AppInstallation(0);
      uint64_t v9 = v8[5];
      uint64_t v10 = (char *)v5 + v9;
      uint64_t v11 = (char *)v6 + v9;
      uint64_t v12 = type metadata accessor for AppInstallation.Phase(0);
      if (swift_getEnumCaseMultiPayload() > 2)
      {
        memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        uint64_t v13 = sub_230812048();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v10, v11, v13);
        uint64_t v14 = type metadata accessor for AppInstallation.Progress(0);
        *(void *)&v10[*(int *)(v14 + 20)] = *(void *)&v11[*(int *)(v14 + 20)];
        *(void *)&v10[*(int *)(v14 + 24)] = *(void *)&v11[*(int *)(v14 + 24)];
        swift_storeEnumTagMultiPayload();
      }
      uint64_t v15 = v8[6];
      uint64_t v16 = (char *)v5 + v15;
      uint64_t v17 = (char *)v6 + v15;
      uint64_t v18 = sub_230812048();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
      uint64_t v19 = type metadata accessor for AppInstallation.Progress(0);
      *(void *)&v16[*(int *)(v19 + 20)] = *(void *)&v17[*(int *)(v19 + 20)];
      *(void *)&v16[*(int *)(v19 + 24)] = *(void *)&v17[*(int *)(v19 + 24)];
      *((unsigned char *)v5 + v8[7]) = *((unsigned char *)v6 + v8[7]);
      *(void *)((char *)v5 + v8[8]) = *(void *)((char *)v6 + v8[8]);
      *((unsigned char *)v5 + v8[9]) = *((unsigned char *)v6 + v8[9]);
      *(void *)((char *)v5 + v8[10]) = *(void *)((char *)v6 + v8[10]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v5, v6, *(void *)(*(void *)(v7 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2307E8B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2307E8B64);
}

uint64_t sub_2307E8B64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 8);
    if (v4 >= 2) {
      return v4 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for State();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_2307E8C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2307E8C20);
}

uint64_t sub_2307E8C20(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(unsigned char *)(result + 8) = a2 + 1;
  }
  else
  {
    uint64_t v7 = type metadata accessor for State();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2307E8CC4()
{
  return sub_2307E788C();
}

uint64_t dispatch thunk of AppStateRule.canMove(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of AppStateRules.rule(forKind:state:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

BOOL static AppStoreType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppStoreType.hash(into:)()
{
  return sub_230812968();
}

uint64_t AppStoreType.hashValue.getter()
{
  return sub_230812998();
}

BOOL sub_2307E8D98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_2307E8DB0()
{
  unint64_t result = qword_268702D60;
  if (!qword_268702D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702D60);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AppStoreType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x2307E8ED0);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

unint64_t ArcadeEntitlementRefreshCondition.description.getter()
{
  unsigned int v1 = *v0;
  switch(v1 >> 6)
  {
    case 1u:
    case 2u:
      unint64_t v3 = 0;
      sub_230812758();
      sub_230812478();
      goto LABEL_7;
    case 3u:
      if (v1 == 192) {
        unint64_t result = 0xD000000000000013;
      }
      else {
        unint64_t result = 0xD000000000000014;
      }
      break;
    default:
      sub_230812758();
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD00000000000002ALL;
LABEL_7:
      sub_230812478();
      swift_bridgeObjectRelease();
      sub_230812478();
      unint64_t result = v3;
      break;
  }
  return result;
}

uint64_t ArcadeEntitlementRefreshCondition.hash(into:)()
{
  switch(*v0 >> 6)
  {
    case 3:
      uint64_t result = sub_230812968();
      break;
    default:
      sub_230812968();
      uint64_t result = sub_230812978();
      break;
  }
  return result;
}

uint64_t ArcadeEntitlementRefreshCondition.hashValue.getter()
{
  unsigned int v1 = *v0;
  sub_230812958();
  switch(v1 >> 6)
  {
    case 3u:
      sub_230812968();
      break;
    default:
      sub_230812968();
      sub_230812978();
      break;
  }
  return sub_230812998();
}

uint64_t sub_2307E9214()
{
  unsigned int v1 = *v0;
  sub_230812958();
  switch(v1 >> 6)
  {
    case 3u:
      sub_230812968();
      break;
    default:
      sub_230812968();
      sub_230812978();
      break;
  }
  return sub_230812998();
}

uint64_t _s8AppState33ArcadeEntitlementRefreshConditionO2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned int v2 = *a1;
  unsigned int v3 = *a2;
  switch(v2 >> 6)
  {
    case 1u:
      if ((v3 & 0xC0) != 0x40) {
        return 0;
      }
      return (((v2 & 1) == 0) ^ v3) & 1;
    case 2u:
      if ((v3 & 0xC0) != 0x80) {
        return 0;
      }
      return (((v2 & 1) == 0) ^ v3) & 1;
    case 3u:
      if (v2 == 192)
      {
        if (v3 == 192) {
          return 1;
        }
      }
      else if (v3 == 193)
      {
        return 1;
      }
      return 0;
    default:
      if (v3 >= 0x40) {
        return 0;
      }
      return (((v2 & 1) == 0) ^ v3) & 1;
  }
}

unint64_t sub_2307E938C()
{
  unint64_t result = qword_268702D68;
  if (!qword_268702D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702D68);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ArcadeEntitlementRefreshCondition(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0x7D) {
    goto LABEL_17;
  }
  if (a2 + 131 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 131) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 131;
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
      return (*a1 | (v4 << 8)) - 131;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 131;
    }
  }
LABEL_17:
  unsigned int v6 = ((*a1 >> 6) & 0xFFFFFF83 | (4 * ((*a1 >> 1) & 0x1F))) ^ 0x7F;
  if (v6 >= 0x7C) {
    unsigned int v6 = -1;
  }
  return v6 + 1;
}

unsigned char *storeEnumTagSinglePayload for ArcadeEntitlementRefreshCondition(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 131 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 131) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0x7D) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0x7C)
  {
    unsigned int v6 = ((a2 - 125) >> 8) + 1;
    *unint64_t result = a2 - 125;
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
        JUMPOUT(0x2307E9558);
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
          *unint64_t result = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
        break;
    }
  }
  return result;
}

uint64_t sub_2307E9580(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  unsigned int v2 = v1 >> 6;
  unsigned int v3 = (v1 & 1) + 3;
  if (v2 == 3) {
    return v3;
  }
  else {
    return v2;
  }
}

unsigned char *sub_2307E959C(unsigned char *result)
{
  *result &= 0x3Fu;
  return result;
}

unsigned char *sub_2307E95AC(unsigned char *result, unsigned int a2)
{
  if (a2 < 3) {
    *unint64_t result = *result & 1 | ((_BYTE)a2 << 6);
  }
  else {
    *unint64_t result = a2 & 1 ^ 0xC1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ArcadeEntitlementRefreshCondition()
{
  return &type metadata for ArcadeEntitlementRefreshCondition;
}

BOOL static ArcadeIntroOfferState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ArcadeIntroOfferState.hash(into:)()
{
  return sub_230812968();
}

uint64_t ArcadeIntroOfferState.hashValue.getter()
{
  return sub_230812998();
}

unint64_t sub_2307E9674()
{
  unint64_t result = qword_268702D70;
  if (!qword_268702D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702D70);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ArcadeIntroOfferState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ArcadeIntroOfferState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2307E9824);
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

ValueMetadata *type metadata accessor for ArcadeIntroOfferState()
{
  return &type metadata for ArcadeIntroOfferState;
}

void static ArcadeState.default.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 3;
}

unint64_t ArcadeState.description.getter()
{
  unint64_t result = 0x6973616863727550;
  switch(*(unsigned char *)(v0 + 8))
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      sub_230812758();
      swift_bridgeObjectRelease();
      unint64_t v2 = 0xD00000000000001ELL;
      sub_230812478();
      swift_bridgeObjectRelease();
      goto LABEL_5;
    default:
      unint64_t v2 = 0;
      sub_230812758();
      sub_230812478();
      sub_2308127F8();
LABEL_5:
      unint64_t result = v2;
      break;
  }
  return result;
}

uint64_t static ArcadeState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(unsigned char **)a1;
  char v3 = *(unsigned char *)(a1 + 8);
  unsigned int v4 = *(void **)a2;
  int v5 = *(unsigned __int8 *)(a2 + 8);
  switch(v3)
  {
    case 1:
      if (v5 != 1)
      {
        swift_retain();
        goto LABEL_15;
      }
      char v7 = v2[24];
      uint64_t v8 = v4[2];
      char v9 = *((unsigned char *)v4 + 24);
      uint64_t v17 = *((void *)v2 + 2);
      char v18 = v7;
      uint64_t v15 = v8;
      char v16 = v9;
      sub_2307E9C58(v4, 1);
      sub_2307E9C58(v2, 1);
      LOBYTE(v6) = static ArcadeState.== infix(_:_:)(&v17, &v15);
      sub_2307E9C78(v2, 1);
      sub_2307E9C78(v4, 1);
      return v6 & 1;
    case 2:
      if (v5 != 2)
      {
        uint64_t v11 = v2;
        goto LABEL_15;
      }
      if (!v2)
      {
        if (!v4)
        {
          sub_2307E9C58(0, 2);
          sub_2307E9C58(0, 2);
          sub_2307E9C58(0, 2);
          sub_2307E9C78(0, 2);
          sub_2307E9C78(0, 2);
          LOBYTE(v6) = 1;
          return v6 & 1;
        }
LABEL_20:
        sub_2307E9C58(*(id *)a2, 2);
        sub_2307E9C58(v2, 2);
        sub_2307E9C78(v2, 2);
        uint64_t v12 = v4;
        char v13 = 2;
        goto LABEL_16;
      }
      if (!v4) {
        goto LABEL_20;
      }
      sub_2307E9C98();
      sub_2307E9C58(v4, 2);
      sub_2307E9C58(v4, 2);
      sub_2307E9C58(v2, 2);
      char v10 = sub_230812688();
      sub_2307E9C78(v4, 2);
      sub_2307E9C78(v2, 2);
      sub_2307E9C78(v4, 2);
      if ((v10 & 1) == 0) {
        goto LABEL_17;
      }
      LOBYTE(v6) = 1;
      return v6 & 1;
    case 3:
      if (v5 != 3) {
        goto LABEL_15;
      }
      sub_2307E9C78(*(void **)a1, 3);
      sub_2307E9C78(v4, 3);
      LOBYTE(v6) = ((v2 & 1) == 0) ^ v4;
      return v6 & 1;
    default:
      if (*(unsigned char *)(a2 + 8))
      {
LABEL_15:
        sub_2307E9C58(v4, v5);
        sub_2307E9C78(v2, v3);
        uint64_t v12 = v4;
        char v13 = v5;
LABEL_16:
        sub_2307E9C78(v12, v13);
LABEL_17:
        LOBYTE(v6) = 0;
      }
      else
      {
        sub_2307E9C78(*(void **)a1, 0);
        sub_2307E9C78(v4, 0);
        int v6 = v4 == v2;
      }
      return v6 & 1;
  }
}

id sub_2307E9C58(id result, char a2)
{
  if (a2 == 2) {
    return result;
  }
  if (a2 == 1) {
    return (id)swift_retain();
  }
  return result;
}

void sub_2307E9C78(void *a1, char a2)
{
  if (a2 == 2)
  {
  }
  else if (a2 == 1)
  {
    swift_release();
  }
}

unint64_t sub_2307E9C98()
{
  unint64_t result = qword_26AF24BF8;
  if (!qword_26AF24BF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF24BF8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ArcadeState(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2307E9C58(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

void destroy for ArcadeState(uint64_t a1)
{
}

uint64_t assignWithCopy for ArcadeState(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2307E9C58(*(id *)a2, v4);
  int v5 = *(void **)a1;
  *(void *)a1 = v3;
  char v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_2307E9C78(v5, v6);
  return a1;
}

uint64_t assignWithTake for ArcadeState(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_2307E9C78(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArcadeState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ArcadeState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2307E9E58(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2307E9E60(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ArcadeState()
{
  return &type metadata for ArcadeState;
}

uint64_t dispatch thunk of ArcadeSubscriptionManager.subscriptionState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ArcadeSubscriptionManager.onSubscriptionStateChange.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  char v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *char v9 = v4;
  v9[1] = sub_2307C8818;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_2307E9FB4()
{
  if (qword_26AF23FC0 != -1) {
    swift_once();
  }
  return sub_2307CDEC4((uint64_t)&qword_26AF25918, (uint64_t)&unk_26AF25940);
}

uint64_t ASDArcadeSubscriptionManager.__allocating_init(objectGraph:requestingBundleID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F90);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_230812278();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F80);
  sub_230812208();
  sub_2308122E8();
  sub_2308122E8();
  uint64_t v11 = (void *)sub_230812438();
  sub_230812268();

  sub_230812258();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v12 = v23[0];
  uint64_t v13 = v23[1];
  id v14 = objc_msgSend(self, sel_sharedInstance);
  sub_2307CDEC4((uint64_t)v24, (uint64_t)v23);
  uint64_t v15 = self;
  id v16 = v14;
  id v17 = objc_msgSend(v15, sel_defaultCenter);
  uint64_t v18 = swift_allocObject();
  uint64_t v19 = sub_2307ED348(v12, v13, (uint64_t)v16, (uint64_t)v23, v21, v22, v17, v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v19;
}

uint64_t ASDArcadeSubscriptionManager.deinit()
{
  objc_msgSend(*(id *)(v0 + 128), sel_removeObserver_, v0);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  swift_bridgeObjectRelease();

  swift_release();
  sub_2307E9C78(*(void **)(v0 + 144), *(unsigned char *)(v0 + 152));
  swift_release();
  return v0;
}

uint64_t ASDArcadeSubscriptionManager.__deallocating_deinit()
{
  ASDArcadeSubscriptionManager.deinit();
  return MEMORY[0x270FA0228](v0, 168, 7);
}

id ASDArcadeSubscriptionManager.subscriptionState.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 144);
  *(void *)a1 = v3;
  char v4 = *(unsigned char *)(v1 + 152);
  *(unsigned char *)(a1 + 8) = v4;
  return sub_2307E9C58(v3, v4);
}

void sub_2307EA3B8(uint64_t a1, uint64_t *a2)
{
  unint64_t v2 = *(void **)a1;
  uint64_t v3 = *a2;
  char v4 = *(unsigned char *)(a1 + 8);
  swift_beginAccess();
  uint64_t v5 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = v2;
  char v6 = *(unsigned char *)(v3 + 152);
  *(unsigned char *)(v3 + 152) = v4;
  sub_2307E9C58(v2, v4);
  sub_2307E9C58(v5, v6);
  sub_2307E9C78(v5, v6);
  uint64_t v7 = v5;
  char v8 = v6;
  sub_2307EA4EC((uint64_t)&v7);
  sub_2307E9C78(v5, v6);
}

void ASDArcadeSubscriptionManager.subscriptionState.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  swift_beginAccess();
  char v4 = *(void **)(v1 + 144);
  *(void *)(v1 + 144) = v2;
  LOBYTE(v2) = *(unsigned char *)(v1 + 152);
  *(unsigned char *)(v1 + 152) = v3;
  sub_2307E9C58(v4, v2);
  sub_2307E9C78(v4, v2);
  uint64_t v5 = v4;
  char v6 = v2;
  sub_2307EA4EC((uint64_t)&v5);
  sub_2307E9C78(v4, v2);
}

uint64_t sub_2307EA4EC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_230812178();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = *(void **)a1;
  LOBYTE(a1) = *(unsigned char *)(a1 + 8);
  swift_beginAccess();
  char v6 = *(unsigned char *)(v2 + 152);
  id v14 = *(void **)(v2 + 144);
  char v15 = v6;
  uint64_t v11 = v5;
  char v12 = a1;
  uint64_t result = static ArcadeState.== infix(_:_:)((uint64_t)&v14, (uint64_t)&v11);
  if ((result & 1) == 0)
  {
    char v8 = *(void **)(v2 + 144);
    char v9 = *(unsigned char *)(v2 + 152);
    id v14 = v8;
    char v15 = v9;
    sub_2307E9C58(v8, v9);
    sub_2308120F8();
    sub_2307E9C78(v8, v9);
    if (qword_26AF23CB8 != -1) {
      swift_once();
    }
    sub_2307CDEC4((uint64_t)&unk_26AF25940, (uint64_t)&v14);
    __swift_project_boxed_opaque_existential_1(&v14, v16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
    sub_230812198();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
    sub_230812168();
    sub_230812158();
    char v10 = *(void **)(v2 + 144);
    uint64_t v13 = &type metadata for ArcadeState;
    uint64_t v11 = v10;
    char v12 = *(unsigned char *)(v2 + 152);
    sub_2307E9C58(v10, v12);
    sub_230812128();
    sub_2307CDF28((uint64_t)&v11, (uint64_t *)&unk_26AF24CA8);
    sub_230812158();
    sub_230812188();
    sub_2308122B8();
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  }
  return result;
}

void (*ASDArcadeSubscriptionManager.subscriptionState.modify(void *a1))(uint64_t *a1, char a2)
{
  char v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v1 + 144);
  v3[3] = v4;
  char v5 = *(unsigned char *)(v1 + 152);
  *((unsigned char *)v3 + 32) = v5;
  sub_2307E9C58(v4, v5);
  return sub_2307EA7EC;
}

void sub_2307EA7EC(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(*a1 + 24);
  uint64_t v5 = *(void *)(v3 + 40);
  char v6 = *(unsigned char *)(v3 + 32);
  uint64_t v7 = *(void **)(v5 + 144);
  char v8 = *(unsigned char *)(v5 + 152);
  *(void *)(v5 + 144) = v4;
  *(unsigned char *)(v5 + 152) = v6;
  if (a2)
  {
    sub_2307E9C58(v4, v6);
    sub_2307E9C58(v7, v8);
    sub_2307E9C78(v7, v8);
    uint64_t v11 = v7;
    char v12 = v8;
    sub_2307EA4EC((uint64_t)&v11);
    sub_2307E9C78(v7, v8);
    char v9 = *(void **)(v3 + 24);
    char v10 = *(unsigned char *)(v3 + 32);
  }
  else
  {
    sub_2307E9C58(v7, v8);
    sub_2307E9C78(v7, v8);
    uint64_t v11 = v7;
    char v12 = v8;
    sub_2307EA4EC((uint64_t)&v11);
    char v9 = v7;
    char v10 = v8;
  }
  sub_2307E9C78(v9, v10);
  free((void *)v3);
}

uint64_t ASDArcadeSubscriptionManager.onSubscriptionStateChange.getter()
{
  return swift_retain();
}

uint64_t sub_2307EA8DC()
{
  uint64_t v1 = v0;
  uint64_t v15 = *v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_230812178();
  MEMORY[0x270FA5388](v5 - 8);
  if (qword_26AF23CB8 != -1) {
    swift_once();
  }
  sub_2307CDEC4((uint64_t)&unk_26AF25940, (uint64_t)v17);
  v14[1] = v17[4];
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  char v6 = (void *)sub_230811EB8();
  uint64_t v7 = sub_230812448();
  uint64_t v9 = v8;

  v16[3] = MEMORY[0x263F8D310];
  v16[0] = v7;
  v16[1] = v9;
  sub_230812128();
  sub_2307CDF28((uint64_t)v16, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122C8();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  uint64_t v10 = sub_230812588();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  void v11[3] = 0;
  uint64_t v12 = v15;
  v11[4] = v1;
  v11[5] = v12;
  swift_retain();
  sub_230804260((uint64_t)v4, (uint64_t)&unk_268702DA0, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_2307EAC00()
{
  sub_230812178();
  *(void *)(v0 + 136) = swift_task_alloc();
  *(unsigned char *)(v0 + 121) = 0;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2307EACDC;
  return ASDArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(v0 + 112, (unsigned char *)(v0 + 121));
}

uint64_t sub_2307EACDC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_2307EAE5C;
  }
  else
  {
    sub_2307E9C78(*(void **)(v2 + 112), *(unsigned char *)(v2 + 120));
    uint64_t v3 = sub_2307EADFC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2307EADFC()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307EAE5C()
{
  if (qword_26AF23CB8 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[19];
  sub_2307CDEC4((uint64_t)qword_26AF25940, (uint64_t)(v0 + 2));
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  uint64_t v2 = v1;
  swift_getErrorValue();
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  v0[10] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_0, v3, v4);
  sub_230812128();
  sub_2307CDF28((uint64_t)(v0 + 7), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  swift_task_dealloc();
  char v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t ASDArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(uint64_t a1, unsigned char *a2)
{
  *(void *)(v3 + 352) = a1;
  *(void *)(v3 + 360) = v2;
  *(void *)(v3 + 368) = *v2;
  sub_230812178();
  *(void *)(v3 + 376) = swift_task_alloc();
  *(void *)(v3 + 384) = swift_task_alloc();
  *(void *)(v3 + 392) = swift_task_alloc();
  *(unsigned char *)(v3 + 345) = *a2;
  return MEMORY[0x270FA2498](sub_2307EB190, 0, 0);
}

uint64_t sub_2307EB190()
{
  if (qword_26AF23CB8 != -1) {
    swift_once();
  }
  char v1 = *(unsigned char *)(v0 + 345);
  uint64_t v2 = *(void *)(v0 + 360);
  sub_2307CDEC4((uint64_t)qword_26AF25940, v0 + 16);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2308147A0;
  sub_230812168();
  sub_230812158();
  *(void *)(v0 + 304) = &type metadata for ArcadeEntitlementRefreshCondition;
  *(unsigned char *)(v0 + 280) = v1;
  sub_230812128();
  sub_2307CDF28(v0 + 280, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812168();
  sub_230812158();
  swift_beginAccess();
  uint64_t v3 = *(void **)(v2 + 144);
  char v4 = *(unsigned char *)(v2 + 152);
  *(void *)(v0 + 272) = &type metadata for ArcadeState;
  *(void *)(v0 + 248) = v3;
  *(unsigned char *)(v0 + 256) = v4;
  sub_2307E9C58(v3, v4);
  sub_230812128();
  sub_2307CDF28(v0 + 248, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812168();
  sub_230812158();
  uint64_t v5 = *(void *)(v2 + 24);
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(v0 + 360) + 16);
    *(void *)(v0 + 240) = MEMORY[0x263F8D310];
    *(void *)(v0 + 216) = v6;
    *(void *)(v0 + 224) = v5;
    uint64_t v7 = v0 + 216;
  }
  else
  {
    uint64_t v7 = v0 + 216;
    *(_OWORD *)(v0 + 216) = 0u;
    *(_OWORD *)(v0 + 232) = 0u;
  }
  unsigned int v8 = *(unsigned __int8 *)(v0 + 345);
  swift_bridgeObjectRetain();
  sub_230812148();
  sub_2307CDF28(v7, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v9 = MEMORY[0x263F50AD8];
  switch(v8 >> 6)
  {
    case 1u:
      uint64_t v20 = *(void **)(v0 + 360);
      uint64_t v57 = *(void *)(v0 + 368);
      char v21 = *(unsigned char *)(v0 + 345) & 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
      uint64_t v22 = sub_230812378();
      uint64_t v24 = v20[7];
      uint64_t v23 = v20[8];
      __swift_project_boxed_opaque_existential_1(v20 + 4, v24);
      uint64_t v25 = *(void (**)(uint64_t, void (*)(int, int, id), uint64_t, uint64_t, uint64_t))(v23 + 16);
      swift_retain();
      v25(1, sub_2307ED47C, v22, v24, v23);
      uint64_t v27 = v20[14];
      uint64_t v26 = v20[15];
      uint64_t v28 = swift_allocObject();
      *(void *)(v28 + 16) = v20;
      *(unsigned char *)(v28 + 24) = v21;
      uint64_t v9 = MEMORY[0x263F50AD8];
      *(void *)(v28 + 32) = v27;
      *(void *)(v28 + 40) = v26;
      *(void *)(v28 + 48) = v57;
      *(void *)(v0 + 120) = sub_230812238();
      *(void *)(v0 + 128) = v9;
      uint64_t v19 = v0 + 96;
      __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 96));
      swift_bridgeObjectRetain();
      swift_retain();
      sub_230812228();
      sub_2307ED4C8(&qword_26AF23FA0, &qword_26AF23FA8);
      goto LABEL_10;
    case 2u:
      uint64_t v29 = *(void **)(v0 + 360);
      uint64_t v58 = *(void *)(v0 + 368);
      char v30 = *(unsigned char *)(v0 + 345) & 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
      uint64_t v31 = sub_230812378();
      uint64_t v33 = v29[7];
      uint64_t v32 = v29[8];
      __swift_project_boxed_opaque_existential_1(v29 + 4, v33);
      uint64_t v34 = *(void (**)(uint64_t, void (*)(int, int, id), uint64_t, uint64_t, uint64_t))(v32 + 16);
      swift_retain();
      v34(1, sub_2307ED47C, v31, v33, v32);
      uint64_t v36 = v29[14];
      uint64_t v35 = v29[15];
      uint64_t v37 = swift_allocObject();
      *(void *)(v37 + 16) = v29;
      *(unsigned char *)(v37 + 24) = v30;
      uint64_t v9 = MEMORY[0x263F50AD8];
      *(void *)(v37 + 32) = v36;
      *(void *)(v37 + 40) = v35;
      *(void *)(v37 + 48) = v58;
      *(void *)(v0 + 160) = sub_230812238();
      *(void *)(v0 + 168) = v9;
      uint64_t v19 = v0 + 136;
      __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 136));
      swift_bridgeObjectRetain();
      swift_retain();
      sub_230812228();
      sub_2307ED4C8(&qword_26AF23FA0, &qword_26AF23FA8);
      goto LABEL_10;
    case 3u:
      int v39 = *(unsigned __int8 *)(v0 + 345);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
      uint64_t v38 = sub_230812378();
      if (v39 == 192)
      {
        uint64_t v40 = *(void **)(v0 + 360);
        uint64_t v41 = v40[7];
        uint64_t v42 = v40[8];
        __swift_project_boxed_opaque_existential_1(v40 + 4, v41);
        uint64_t v43 = *(void (**)(uint64_t, void (*)(int, int, id), uint64_t, uint64_t, uint64_t))(v42 + 16);
        swift_retain();
        v43(1, sub_2307ED47C, v38, v41, v42);
      }
      else
      {
        uint64_t v44 = *(void **)(v0 + 360);
        uint64_t v45 = v44[14];
        uint64_t v46 = v44[15];
        uint64_t v47 = sub_2307EBDCC(1, v45, v46, v38, (uint64_t)v44, *(void *)(v0 + 368));
        uint64_t v49 = v48;
        uint64_t v50 = v44[7];
        uint64_t v51 = v44[8];
        __swift_project_boxed_opaque_existential_1(v44 + 4, v50);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, char, char, void *), uint64_t, uint64_t, uint64_t))(v51 + 8))(1, 1, v45, v46, v47, v49, v50, v51);
      }
      swift_release();
      goto LABEL_15;
    default:
      uint64_t v10 = *(void **)(v0 + 360);
      uint64_t v56 = *(void *)(v0 + 368);
      char v11 = *(unsigned char *)(v0 + 345) & 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
      uint64_t v12 = sub_230812378();
      uint64_t v14 = v10[7];
      uint64_t v13 = v10[8];
      __swift_project_boxed_opaque_existential_1(v10 + 4, v14);
      uint64_t v15 = *(void (**)(uint64_t, void (*)(int, int, id), uint64_t, uint64_t, uint64_t))(v13 + 16);
      swift_retain();
      v15(1, sub_2307ED47C, v12, v14, v13);
      uint64_t v17 = v10[14];
      uint64_t v16 = v10[15];
      uint64_t v18 = swift_allocObject();
      *(void *)(v18 + 16) = v10;
      *(unsigned char *)(v18 + 24) = v11;
      uint64_t v9 = MEMORY[0x263F50AD8];
      *(void *)(v18 + 32) = v17;
      *(void *)(v18 + 40) = v16;
      *(void *)(v18 + 48) = v56;
      *(void *)(v0 + 80) = sub_230812238();
      *(void *)(v0 + 88) = v9;
      uint64_t v19 = v0 + 56;
      __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 56));
      swift_bridgeObjectRetain();
      swift_retain();
      sub_230812228();
      sub_2307ED4C8(&qword_26AF23FA0, &qword_26AF23FA8);
LABEL_10:
      uint64_t v38 = sub_230812348();
      swift_release_n();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v19);
LABEL_15:
      *(void *)(v0 + 400) = v38;
      *(void *)(v0 + 200) = sub_230812238();
      *(void *)(v0 + 208) = v9;
      __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 176));
      swift_retain();
      sub_230812228();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FB8);
      sub_2307ED4C8(&qword_26AF23FB0, &qword_26AF23FB8);
      uint64_t v52 = sub_230812348();
      *(void *)(v0 + 408) = v52;
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v0 + 176);
      uint64_t v53 = (void *)swift_task_alloc();
      *(void *)(v0 + 416) = v53;
      *uint64_t v53 = v0;
      v53[1] = sub_2307EBAA4;
      uint64_t v54 = *(void *)(v0 + 360);
      return sub_2307EC7E8(v0 + 336, v52, v54);
  }
}

uint64_t sub_2307EBAA4()
{
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_2307EBBA0, 0, 0);
}

uint64_t sub_2307EBBA0()
{
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 336);
  char v3 = *(unsigned char *)(v0 + 344);
  char v4 = *(os_unfair_lock_s **)(v1 + 136);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v2;
  *(unsigned char *)(v5 + 32) = v3;
  os_unfair_lock_lock(v4 + 4);
  sub_2307ED48C(v6);
  uint64_t v7 = *(void *)(v0 + 352);
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  swift_release();
  swift_task_dealloc();
  *(void *)uint64_t v7 = v2;
  *(unsigned char *)(v7 + 8) = v3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unsigned int v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

void (*sub_2307EBDCC(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6))(int a1, char a2, char a3, void *a4)
{
  uint64_t v12 = swift_allocObject();
  *(unsigned char *)(v12 + 16) = a1;
  *(void *)(v12 + 24) = a5;
  *(void *)(v12 + 32) = a2;
  *(void *)(v12 + 40) = a3;
  *(void *)(v12 + 48) = a4;
  *(void *)(v12 + 56) = a6;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_2307ED940;
}

void sub_2307EBE74(int a1, char a2, char a3, id a4, char a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a4)
  {
    swift_bridgeObjectRetain();
    sub_230812358();
    swift_bridgeObjectRelease();
    return;
  }
  if ((a5 & 1) == 0 || (a2 & 1) == 0 || (a3 & 1) == 0)
  {
    id v18 = a4;
    goto LABEL_11;
  }
  type metadata accessor for Code(0);
  id v13 = a4;
  sub_2307ED974();
  if ((sub_230811F68() & 1) == 0)
  {
LABEL_11:
    sub_230812338();

    return;
  }
  if (qword_26AF23CB8 != -1) {
    swift_once();
  }
  __swift_project_boxed_opaque_existential_1(qword_26AF25940, qword_26AF25958);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812118();
  sub_230812118();
  sub_2308122C8();
  swift_bridgeObjectRelease();
  uint64_t v14 = a6 + 4;
  uint64_t v16 = a6[7];
  uint64_t v15 = a6[8];
  __swift_project_boxed_opaque_existential_1(v14, v16);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, int, int, id), uint64_t, uint64_t, uint64_t))(v15 + 8);
  swift_retain();
  v17(1, 1, a7, a8, sub_2307ED9CC, a9, v16, v15);

  swift_release();
}

void sub_2307EC10C(int a1, int a2, int a3, id a4)
{
  if (a4)
  {
    id v5 = a4;
    sub_230812338();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_230812358();
    swift_bridgeObjectRelease();
  }
}

void sub_2307EC1A8(int a1, int a2, id a3)
{
  if (a3)
  {
    id v4 = a3;
    sub_230812338();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_230812358();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2307EC244(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (*(unsigned char *)(a1 + 9) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
    uint64_t v11 = sub_230812378();
    uint64_t v12 = sub_2307EBDCC(a3 & 1, a4, a5, v11, a2, a6);
    uint64_t v14 = v13;
    uint64_t v15 = (void *)(a2 + 32);
    uint64_t v17 = *(void *)(a2 + 56);
    uint64_t v16 = *(void *)(a2 + 64);
    __swift_project_boxed_opaque_existential_1(v15, v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, char, char, void *), uint64_t, uint64_t, uint64_t))(v16 + 8))(1, 1, a4, a5, v12, v14, v17, v16);
    swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
    swift_bridgeObjectRetain();
    return sub_230812328();
  }
  return v11;
}

uint64_t sub_2307EC370(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v11 = *(unsigned __int8 *)(a1 + 9);
  BOOL v12 = *(unsigned char *)(a1 + 8) != 1 || *(void *)a1 == 0;
  if (v12
    || (swift_retain(),
        unint64_t v13 = swift_bridgeObjectRetain(),
        uint64_t v14 = sub_2307ED9D4(v13, a2),
        swift_release(),
        swift_bridgeObjectRelease(),
        !v14))
  {
    if (!v11)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
      swift_bridgeObjectRetain();
      return sub_230812328();
    }
  }
  else
  {
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
  uint64_t v15 = sub_230812378();
  uint64_t v16 = sub_2307EBDCC(a3 & 1, a4, a5, v15, a2, a6);
  uint64_t v18 = v17;
  uint64_t v19 = (void *)(a2 + 32);
  uint64_t v21 = *(void *)(a2 + 56);
  uint64_t v20 = *(void *)(a2 + 64);
  __swift_project_boxed_opaque_existential_1(v19, v21);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, char, char, void *), uint64_t, uint64_t, uint64_t))(v20 + 8))(1, 1, a4, a5, v16, v18, v21, v20);
  swift_release();
  return v15;
}

uint64_t sub_2307EC4EC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v11 = *(unsigned __int8 *)(a1 + 9);
  if (*(unsigned char *)(a1 + 8) == 1)
  {
    if (!*(void *)a1) {
      goto LABEL_6;
    }
    swift_retain();
    unint64_t v12 = swift_bridgeObjectRetain();
    unint64_t v13 = sub_2307ED9D4(v12, a2);
    swift_release();
    swift_bridgeObjectRelease();
    if (!v13) {
      goto LABEL_6;
    }
  }
  if (!v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
    swift_bridgeObjectRetain();
    return sub_230812328();
  }
LABEL_6:
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FA8);
  uint64_t v14 = sub_230812378();
  uint64_t v15 = sub_2307EBDCC(a3 & 1, a4, a5, v14, a2, a6);
  uint64_t v17 = v16;
  uint64_t v18 = (void *)(a2 + 32);
  uint64_t v20 = *(void *)(a2 + 56);
  uint64_t v19 = *(void *)(a2 + 64);
  __swift_project_boxed_opaque_existential_1(v18, v20);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(int, char, char, void *), uint64_t, uint64_t, uint64_t))(v19 + 8))(1, 1, a4, a5, v15, v17, v20, v19);
  swift_release();
  return v14;
}

uint64_t sub_2307EC664(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  char v4 = *((unsigned char *)a1 + 8);
  char v5 = *((unsigned char *)a1 + 9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FB8);
  uint64_t v6 = sub_230812378();
  uint64_t v7 = a2 + 4;
  uint64_t v9 = a2[7];
  uint64_t v8 = a2[8];
  __swift_project_boxed_opaque_existential_1(v7, v9);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  *(void *)(v10 + 24) = v3;
  *(unsigned char *)(v10 + 32) = v4;
  *(unsigned char *)(v10 + 33) = v5;
  int v11 = *(void (**)(void (*)(int, int, id), uint64_t, uint64_t, uint64_t))(v8 + 24);
  swift_bridgeObjectRetain();
  swift_retain();
  v11(sub_2307EDFDC, v10, v9, v8);
  swift_release();
  return v6;
}

void sub_2307EC748(int a1, int a2, id a3)
{
  if (a3)
  {
    id v4 = a3;
    sub_230812338();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_230812358();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2307EC7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[31] = a1;
  v3[32] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  v3[33] = swift_task_alloc();
  sub_230812178();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FB8);
  uint64_t v5 = sub_2307ED4C8(&qword_26AF23FB0, &qword_26AF23FB8);
  uint64_t v6 = (void *)swift_task_alloc();
  v3[37] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_2307EC940;
  return MEMORY[0x270F462D8](v3 + 27, v4, v5);
}

uint64_t sub_2307EC940()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 304) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_2307ECF08;
  }
  else
  {
    *(_OWORD *)(v2 + 312) = *(_OWORD *)(v2 + 216);
    uint64_t v3 = sub_2307ECA60;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_2307ECA60()
{
  if (qword_26AF23CB8 != -1) {
    swift_once();
  }
  unint64_t v1 = *(void *)(v0 + 312);
  sub_2307CDEC4((uint64_t)qword_26AF25940, v0 + 56);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812168();
  sub_230812158();
  unint64_t v21 = v1;
  if (v1)
  {
    unint64_t v1 = *(void *)(v0 + 312);
    *(void *)(v0 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FD0);
    *(void *)(v0 + 160) = v1;
  }
  else
  {
    *(_OWORD *)(v0 + 160) = 0u;
    *(_OWORD *)(v0 + 176) = 0u;
  }
  uint64_t v2 = *(void *)(v0 + 320);
  swift_bridgeObjectRetain();
  sub_230812148();
  sub_2307CDF28(v0 + 160, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812168();
  sub_230812158();
  uint64_t v20 = v2;
  if (v2)
  {
    unint64_t v3 = *(void *)(v0 + 320);
    *(void *)(v0 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FD8);
    *(void *)(v0 + 128) = v3;
  }
  else
  {
    unint64_t v3 = 0;
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
  }
  swift_bridgeObjectRetain();
  sub_230812148();
  sub_2307CDF28(v0 + 128, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122C8();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  if (v21)
  {
    uint64_t v4 = *(void *)(v0 + 256);
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v5 = sub_2307ED9D4(v1, v4);
    swift_release();
    swift_bridgeObjectRelease();
    if (v5)
    {
      uint64_t v7 = *(void *)(v0 + 256);
      uint64_t v6 = *(void *)(v0 + 264);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      __swift_project_boxed_opaque_existential_1((void *)(v7 + 72), *(void *)(v7 + 96));
      sub_2308121E8();
      uint64_t v8 = sub_230812318();
      uint64_t v9 = *(void *)(v8 - 8);
      int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8);
      uint64_t v11 = *(void *)(v0 + 264);
      if (v10 == 1)
      {
        sub_2307CDF28(*(void *)(v0 + 264), &qword_26AF23F98);
        uint64_t v12 = 0;
      }
      else
      {
        swift_getKeyPath();
        sub_230812308();
        swift_release();
        uint64_t v12 = *(void *)(v0 + 240);
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v8);
      }
      char v13 = 2;
      goto LABEL_22;
    }
    swift_bridgeObjectRelease();
  }
  if (v20)
  {
    uint64_t v14 = *(void *)(v0 + 256);
    uint64_t v15 = *(void *)(v14 + 24);
    if (v15)
    {
      uint64_t v16 = *(void *)(v14 + 16);
      swift_bridgeObjectRetain();
      LOBYTE(v16) = sub_2307EDDF4(v3, v16, v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v16)
      {
        char v13 = 0;
        uint64_t v12 = 2;
        goto LABEL_22;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  char v13 = 0;
  uint64_t v12 = 1;
LABEL_22:
  uint64_t v17 = *(void *)(v0 + 248);
  *(void *)uint64_t v17 = v12;
  *(unsigned char *)(v17 + 8) = v13;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_2307ECF08()
{
  if (qword_26AF23CB8 != -1) {
    swift_once();
  }
  unint64_t v1 = (void *)v0[38];
  sub_2307CDEC4((uint64_t)qword_26AF25940, (uint64_t)(v0 + 2));
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  uint64_t v2 = v1;
  swift_getErrorValue();
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[25];
  v0[15] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_0, v3, v4);
  sub_230812128();
  sub_2307CDF28((uint64_t)(v0 + 12), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  uint64_t v6 = v0[31];
  *(void *)uint64_t v6 = 1;
  *(unsigned char *)(v6 + 8) = 3;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

void sub_2307ED18C(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  swift_beginAccess();
  uint64_t v7 = *(void **)(a2 + 144);
  *(void *)(a2 + 144) = a3;
  char v8 = *(unsigned char *)(a2 + 152);
  *(unsigned char *)(a2 + 152) = a4;
  sub_2307E9C58(a3, a4);
  sub_2307E9C58(v7, v8);
  sub_2307E9C78(v7, v8);
  uint64_t v9 = v7;
  char v10 = v8;
  sub_2307EA4EC((uint64_t)&v9);
  sub_2307E9C78(v7, v8);
}

id sub_2307ED23C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 144);
  *(void *)a1 = v4;
  char v5 = *(unsigned char *)(v3 + 152);
  *(unsigned char *)(a1 + 8) = v5;
  return sub_2307E9C58(v4, v5);
}

uint64_t sub_2307ED290()
{
  return swift_retain();
}

uint64_t sub_2307ED29C(uint64_t a1, unsigned char *a2)
{
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307C8818;
  return ASDArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(a1, a2);
}

uint64_t sub_2307ED348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
{
  v19[3] = sub_2307EDFFC();
  void v19[4] = &off_26E4787E8;
  v19[0] = a3;
  *(void *)(a8 + 16) = a1;
  *(void *)(a8 + 24) = a2;
  sub_2307CDEC4((uint64_t)v19, a8 + 32);
  sub_2307CDEC4(a4, a8 + 72);
  *(void *)(a8 + 112) = a5;
  *(void *)(a8 + 120) = a6;
  *(void *)(a8 + 128) = a7;
  *(void *)(a8 + 144) = 0;
  *(unsigned char *)(a8 + 152) = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F70);
  swift_allocObject();
  id v16 = a7;
  *(void *)(a8 + 160) = sub_230812108();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CE0);
  uint64_t v17 = swift_allocObject();
  *(_DWORD *)(v17 + 16) = 0;
  *(void *)(a8 + 136) = v17;
  objc_msgSend(v16, sel_addObserver_selector_name_object_, a8, sel_entitlementsDidChange_, *MEMORY[0x263F253C8], 0);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  return a8;
}

void sub_2307ED47C(int a1, int a2, id a3)
{
}

uint64_t sub_2307ED484(uint64_t *a1)
{
  return sub_2307EC664(a1, v1);
}

void sub_2307ED48C(uint64_t a1)
{
  sub_2307ED18C(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(unsigned char *)(v1 + 32));
}

uint64_t sub_2307ED4B0(uint64_t a1)
{
  return sub_2307ED590(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2307EC4EC);
}

uint64_t sub_2307ED4C8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2307ED51C(uint64_t a1)
{
  return sub_2307ED590(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2307EC370);
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_2307ED578(uint64_t a1)
{
  return sub_2307ED590(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_2307EC244);
}

uint64_t sub_2307ED590(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, *(void *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48));
}

id sub_2307ED5AC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 144);
  *(void *)a2 = v4;
  char v5 = *(unsigned char *)(v3 + 152);
  *(unsigned char *)(a2 + 8) = v5;
  return sub_2307E9C58(v4, v5);
}

uint64_t type metadata accessor for ASDArcadeSubscriptionManager()
{
  return self;
}

uint64_t method lookup function for ASDArcadeSubscriptionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ASDArcadeSubscriptionManager);
}

uint64_t destroy for ASDArcadeSubscriptionManager.EntitlementsResult()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s8AppState28ASDArcadeSubscriptionManagerC18EntitlementsResultVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ASDArcadeSubscriptionManager.EntitlementsResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for ASDArcadeSubscriptionManager.EntitlementsResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASDArcadeSubscriptionManager.EntitlementsResult(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 10)) {
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

uint64_t storeEnumTagSinglePayload for ASDArcadeSubscriptionManager.EntitlementsResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASDArcadeSubscriptionManager.EntitlementsResult()
{
  return &type metadata for ASDArcadeSubscriptionManager.EntitlementsResult;
}

uint64_t sub_2307ED7F8()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2307ED838()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2307C8818;
  return sub_2307EAC00();
}

uint64_t sub_2307ED8F8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_2307ED940(int a1, char a2, char a3, void *a4)
{
  sub_2307EBE74(a1, a2, a3, a4, *(unsigned char *)(v4 + 16), *(void **)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48));
}

unint64_t sub_2307ED974()
{
  unint64_t result = qword_268702BD0;
  if (!qword_268702BD0)
  {
    type metadata accessor for Code(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702BD0);
  }
  return result;
}

void sub_2307ED9CC(int a1, int a2, int a3, id a4)
{
}

char *sub_2307ED9D4(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23DC0);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void (**)(void, void))sub_230812048();
  char v10 = (char *)*(v9 - 1);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (uint64_t)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v42 = (char *)v35 - v14;
  if (a1 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t v43 = sub_230812808();
    if (v43) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v43 = v15;
    if (v15)
    {
LABEL_3:
      uint64_t v38 = v13;
      int v39 = v9;
      v35[1] = v3;
      unint64_t v45 = a1;
      unint64_t v46 = a1 & 0xC000000000000001;
      uint64_t v40 = (void (**)(void, uint64_t, uint64_t, void))(v10 + 56);
      uint64_t v41 = v8;
      uint64_t v36 = (unsigned int (**)(uint64_t, uint64_t, void))(v10 + 48);
      uint64_t v37 = (void (**)(char *, uint64_t, void (**)(void, void)))(v10 + 32);
      uint64_t v3 = *(void *)(a2 + 24);
      uint64_t v44 = *(void *)(a2 + 16);
      v35[2] = v10 + 8;
      uint64_t v13 = 4;
      a2 = v43;
      uint64_t v47 = v3;
      uint64_t v9 = (void (**)(void, void))(v10 + 8);
      do
      {
        if (v46) {
          id v16 = (char *)MEMORY[0x230FBF430](v13 - 4, a1);
        }
        else {
          id v16 = (char *)*(id *)(a1 + 8 * v13);
        }
        char v10 = v16;
        char v8 = (char *)(v13 - 3);
        if (__OFADD__(v13 - 4, 1))
        {
          __break(1u);
          goto LABEL_26;
        }
        if (v3)
        {
          id v17 = objc_msgSend(v16, sel_familyID);
          id v18 = objc_msgSend(v17, sel_stringValue);

          uint64_t v19 = sub_230812448();
          uint64_t v21 = v20;

          if (v19 == v44 && v47 == v21)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v23 = sub_230812878();
            swift_bridgeObjectRelease();
            if ((v23 & 1) == 0) {
              goto LABEL_4;
            }
          }
          id v24 = objc_msgSend(v10, sel_expiryDate);
          if (!v24)
          {
            uint64_t v28 = (uint64_t)v41;
            (*v40)(v41, 1, 1, v39);
LABEL_23:
            sub_2307CDF28(v28, &qword_26AF23DC0);
LABEL_24:
            swift_bridgeObjectRelease();
            return v10;
          }
          uint64_t v25 = v24;
          uint64_t v26 = v38;
          sub_230812028();

          uint64_t v27 = *v37;
          uint64_t v28 = (uint64_t)v41;
          uint64_t v29 = v39;
          (*v37)(v41, v26, v39);
          (*v40)(v28, 0, 1, v29);
          if ((*v36)(v28, 1, v29) == 1) {
            goto LABEL_23;
          }
          char v30 = v42;
          v27(v42, v28, v29);
          sub_230812038();
          char v31 = sub_230811FF8();
          uint64_t v32 = (void (*)(char *, void))*v9;
          (*v9)(v26, v29);
          uint64_t v33 = v30;
          a2 = v43;
          v32(v33, v29);
          if (v31) {
            goto LABEL_24;
          }
        }
LABEL_4:

        ++v13;
        a1 = v45;
        uint64_t v3 = v47;
      }
      while (v8 != (char *)a2);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2307EDDF4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_230812808();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v9 = 4;
      while (1)
      {
        uint64_t v10 = v9 - 4;
        if (v24)
        {
          id v11 = (id)MEMORY[0x230FBF430](v9 - 4, v7);
          uint64_t v4 = v9 - 3;
          if (__OFADD__(v10, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v11 = *(id *)(v7 + 8 * v9);
          uint64_t v4 = v9 - 3;
          if (__OFADD__(v10, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v11;
        uint64_t v14 = a3;
        id v15 = objc_msgSend(v11, sel_stringValue, v22);
        uint64_t v16 = sub_230812448();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();

          char v20 = 1;
          goto LABEL_22;
        }
        char v20 = sub_230812878();

        swift_bridgeObjectRelease();
        if ((v20 & 1) == 0)
        {
          ++v9;
          uint64_t v8 = v12;
          BOOL v19 = v4 == v12;
          unint64_t v7 = v23;
          if (!v19) {
            continue;
          }
        }
        goto LABEL_22;
      }
    }
  }
  char v20 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v20 & 1;
}

uint64_t sub_2307EDF9C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 34, 7);
}

void sub_2307EDFDC(int a1, int a2, id a3)
{
}

unint64_t sub_2307EDFFC()
{
  unint64_t result = qword_26AF24018;
  if (!qword_26AF24018)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF24018);
  }
  return result;
}

uint64_t sub_2307EE0A4()
{
  sub_230812758();
  swift_getObjectType();
  uint64_t v1 = sub_2308129A8();
  swift_bridgeObjectRelease();
  sub_230812478();
  id v2 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtCV8AppState19ASDDeviceAppFetcherP33_20A96B0C17EB75E205905EBE25F52A5B16QueryObservation_appQuery));
  id v3 = objc_msgSend(v2, sel_description);
  sub_230812448();

  sub_230812478();
  swift_bridgeObjectRelease();
  sub_230812478();
  return v1;
}

id sub_2307EE2F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id ASDDeviceAppFetcher.observeQuery(_:on:using:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7 = *((unsigned char *)a1 + 8);
  uint64_t v12 = *a1;
  char v13 = v7;
  id v8 = sub_2307CA42C();
  sub_2307CDEC4(a2, (uint64_t)&v12);
  id v9 = objc_allocWithZone((Class)type metadata accessor for ASDDeviceAppFetcher.QueryObservation());
  swift_retain();
  id v10 = sub_2307CA63C(v8, (uint64_t)&v12, a3, a4);

  swift_release();
  return v10;
}

uint64_t ASDDeviceAppFetcher.fetchQuery(_:)(uint64_t *a1)
{
  uint64_t v3 = *a1;
  *(void *)(v2 + 24) = v1;
  *(void *)(v2 + 32) = v3;
  *(unsigned char *)(v2 + 64) = *((unsigned char *)a1 + 8);
  return MEMORY[0x270FA2498](sub_2307EE46C, 0, 0);
}

uint64_t sub_2307EE46C()
{
  char v1 = *(unsigned char *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 40) = v4;
  *(void *)(v4 + 16) = v2;
  *(unsigned char *)(v4 + 24) = v1;
  *(void *)(v4 + 32) = v3;
  char v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BA0);
  void *v5 = v0;
  v5[1] = sub_2307C71D0;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0x6575516863746566, 0xEE00293A5F287972, sub_2307CBC34, v4, v6);
}

uint64_t sub_2307EE58C()
{
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t assignWithCopy for ASDDeviceAppFetcher(uint64_t a1, long long *a2)
{
  uint64_t v4 = *((void *)a2 + 3);
  if (!*(void *)(a1 + 24))
  {
    if (v4)
    {
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t assignWithTake for ASDDeviceAppFetcher(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASDDeviceAppFetcher(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASDDeviceAppFetcher(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

uint64_t sub_2307EE7B8()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2307EE7F8()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(void *)(v0 + 32));
}

uint64_t sub_2307EE828()
{
  uint64_t v1 = sub_230812098();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 25) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BB8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  sub_2307CB9CC(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_2307EE9A8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t ASDPurchaseHistory.update(in:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_2307EEA00, 0, 0);
}

uint64_t sub_2307EEA00()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = swift_task_alloc();
  v0[4] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2307EEAF8;
  uint64_t v5 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2360](v4, 0, 0, 0x6928657461647075, 0xEB00000000293A6ELL, sub_2307EEFB4, v3, v5);
}

uint64_t sub_2307EEAF8()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2307EEC2C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2307EEC14;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307EEC14()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2307EEC2C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307EEC90(uint64_t a1, void *a2, uint64_t a3)
{
  id v24 = a2;
  uint64_t v25 = a3;
  uint64_t v23 = a1;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268702F28);
  uint64_t v3 = *(void *)(v21 - 8);
  uint64_t v22 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v21);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_230812098();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - v11;
  sub_2307CB7A0(0, (unint64_t *)&unk_26AF24C00);
  sub_2308126B8();
  sub_230812088();
  sub_230812678();
  char v13 = (void *)sub_2308126B8();
  sub_230812078();

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v23, v21);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + *(unsigned __int8 *)(v3 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v10, v6);
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v17 + v16, v5, v14);
  aBlock[4] = sub_2307F248C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2307EEFBC;
  aBlock[3] = &block_descriptor_57;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v24, sel_updateWithContext_withCompletionHandler_, v25, v18);
  _Block_release(v18);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t sub_2307EEFB4(uint64_t a1)
{
  return sub_2307EEC90(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

void sub_2307EEFBC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t ASDPurchaseHistory.update(for:in:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_2307EF04C, 0, 0);
}

uint64_t sub_2307EF04C()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  id v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[6] = v5;
  void *v5 = v0;
  v5[1] = sub_2307EF150;
  uint64_t v6 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2360](v5, 0, 0, 0x6628657461647075, 0xEF293A6E693A726FLL, sub_2307EF594, v4, v6);
}

uint64_t sub_2307EF150()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2307EE58C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2307EEC14;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307EF26C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v22 = a1;
  id v23 = a2;
  v21[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_268702F28);
  uint64_t v4 = *(void *)(v21[0] - 8);
  v21[1] = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v21[0]);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_230812098();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  char v13 = (char *)v21 - v12;
  sub_2307CB7A0(0, (unint64_t *)&unk_26AF24C00);
  sub_2308126B8();
  sub_230812088();
  sub_230812678();
  uint64_t v14 = (void *)sub_2308126B8();
  sub_230812078();

  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t v15 = v21[0];
  (*(void (**)(char *, uint64_t, void))(v4 + 16))(v6, v22, v21[0]);
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + *(unsigned __int8 *)(v4 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v18 + v16, v11, v7);
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v18 + v17, v6, v15);
  aBlock[4] = sub_2307F231C;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2307EEFBC;
  aBlock[3] = &block_descriptor_51;
  BOOL v19 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v23, sel_updateForAccountID_withContext_withCompletionHandler_, v24, v25, v19);
  _Block_release(v19);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t sub_2307EF594(uint64_t a1)
{
  return sub_2307EF26C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_2307EF5A0(void *a1)
{
  sub_230812668();
  sub_2307CB7A0(0, (unint64_t *)&unk_26AF24C00);
  uint64_t v2 = (void *)sub_2308126B8();
  sub_230812078();

  if (a1)
  {
    id v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268702F28);
    return sub_230812548();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268702F28);
    return sub_230812558();
  }
}

uint64_t ASDPurchaseHistory.fetchAllApps(of:compatibleWith:)(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return MEMORY[0x270FA2498](sub_2307EF6B0, 0, 0);
}

uint64_t sub_2307EF6B0()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = sub_2307F291C(v0[3]);
  v0[6] = (uint64_t)v2;
  uint64_t v3 = swift_task_alloc();
  v0[7] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[8] = (uint64_t)v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FC8);
  *uint64_t v4 = v0;
  v4[1] = sub_2307EF7CC;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0x6575516863746566, 0xEE00293A5F287972, sub_2307F1EE8, v3, v5);
}

uint64_t sub_2307EF7CC()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2307EF950;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2307EF8E8;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307EF8E8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2307EF950()
{
  uint64_t v1 = *(void **)(v0 + 48);
  swift_task_dealloc();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t ASDPurchaseHistory.fetchApps(of:withIDs:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x270FA2498](sub_2307EF9DC, 0, 0);
}

{
  uint64_t v3;
  void *v4;

  v4[10] = a3;
  v4[11] = v3;
  v4[8] = a1;
  v4[9] = a2;
  return MEMORY[0x270FA2498](sub_2307EFD08, 0, 0);
}

uint64_t sub_2307EF9DC()
{
  uint64_t v1 = v0[6];
  uint64_t v2 = sub_2307F2A8C(v0[4], v0[3]);
  v0[7] = (uint64_t)v2;
  uint64_t v3 = swift_task_alloc();
  v0[8] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = (uint64_t)v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FC8);
  *uint64_t v4 = v0;
  v4[1] = sub_2307EFAF8;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0x6575516863746566, 0xEE00293A5F287972, sub_2307F259C, v3, v5);
}

uint64_t sub_2307EFAF8()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2307EFC7C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2307EFC14;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307EFC14()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2307EFC7C()
{
  uint64_t v1 = *(void **)(v0 + 56);
  swift_task_dealloc();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2307EFD08()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  sub_2307CDEC4(*(void *)(v0 + 80), v0 + 16);
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 96) = v4;
  *(void *)(v4 + 16) = v2;
  sub_2307CDF84((long long *)(v0 + 16), v4 + 24);
  swift_bridgeObjectRetain();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FC8);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v6;
  v6[2] = v3;
  v6[3] = v1;
  v6[4] = sub_2307F1F30;
  v6[5] = v4;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v7;
  void *v7 = v0;
  v7[1] = sub_2307EFE68;
  return MEMORY[0x270FA22B8](v0 + 56, v5, v5, 0, 0, &unk_268702ED0, v6, v5);
}

uint64_t sub_2307EFE68()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2307EFFEC;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2307EFF84;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307EFF84()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2307EFFEC()
{
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void *sub_2307F0058(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_2307F278C(a1, 0);
  sub_2307F1C48(a2);
  sub_2307CB7A0(0, (unint64_t *)&qword_26AF24BF8);
  uint64_t v4 = (void *)sub_230812508();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setStoreIDs_, v4);

  return v3;
}

uint64_t ASDPurchaseHistory.fetchAllApps(for:compatibleWith:)(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  return MEMORY[0x270FA2498](sub_2307F0118, 0, 0);
}

uint64_t sub_2307F0118()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 64);
  sub_2307CDEC4(*(void *)(v0 + 72), v0 + 16);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 88) = v3;
  sub_2307CDF84((long long *)(v0 + 16), v3 + 16);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FC8);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v5;
  void v5[2] = v2;
  v5[3] = v1;
  v5[4] = sub_2307F203C;
  v5[5] = v3;
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2307F026C;
  return MEMORY[0x270FA22B8](v0 + 56, v4, v4, 0, 0, &unk_268702EE0, v5, v4);
}

uint64_t sub_2307F026C()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2307F03F0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2307F0388;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307F0388()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_2307F03F0()
{
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307F045C(uint64_t a1, void *a2, uint64_t a3)
{
  id v24 = a2;
  uint64_t v25 = a3;
  uint64_t v23 = a1;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FE0);
  uint64_t v3 = *(void *)(v21 - 8);
  uint64_t v22 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v21);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_230812098();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - v11;
  sub_2307CB7A0(0, (unint64_t *)&unk_26AF24C00);
  sub_2308126B8();
  sub_230812088();
  sub_230812678();
  char v13 = (void *)sub_2308126B8();
  sub_230812078();

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  uint64_t v14 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v23, v21);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + *(unsigned __int8 *)(v3 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v10, v6);
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v17 + v16, v5, v14);
  aBlock[4] = sub_2307F2228;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2307F0888;
  aBlock[3] = &block_descriptor_0;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v24, sel_executeQuery_withResultHandler_, v25, v18);
  _Block_release(v18);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t sub_2307F0780(uint64_t a1, void *a2)
{
  sub_230812668();
  sub_2307CB7A0(0, (unint64_t *)&unk_26AF24C00);
  uint64_t v4 = (void *)sub_2308126B8();
  sub_230812078();

  if (a2)
  {
    id v5 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FE0);
    return sub_230812548();
  }
  else
  {
    if (a1) {
      swift_bridgeObjectRetain();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FE0);
    return sub_230812558();
  }
}

uint64_t sub_2307F0888(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2307CB7A0(0, &qword_26AF23DA8);
    uint64_t v4 = sub_230812518();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2307F092C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[15] = a5;
  v6[16] = a6;
  v6[13] = a3;
  v6[14] = a4;
  v6[11] = a1;
  v6[12] = a2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FF0);
  v6[17] = v7;
  v6[18] = *(void *)(v7 - 8);
  v6[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307F0A38, 0, 0);
}

uint64_t sub_2307F0A38()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v3 = (uint64_t *)(v1 + 32);
    uint64_t v4 = sub_230812588();
    uint64_t v5 = *(void *)(v4 - 8);
    uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    uint64_t v25 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    id v24 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v8 = *(void *)(v0 + 160);
      uint64_t v7 = *(void *)(v0 + 168);
      uint64_t v9 = *(void *)(v0 + 128);
      uint64_t v10 = *v3++;
      long long v27 = *(_OWORD *)(v0 + 112);
      v26(v7, 1, 1, v4);
      uint64_t v11 = swift_allocObject();
      *(void *)(v11 + 16) = 0;
      uint64_t v12 = (void *)(v11 + 16);
      *(void *)(v11 + 24) = 0;
      *(_OWORD *)(v11 + 32) = v27;
      *(void *)(v11 + 48) = v9;
      *(void *)(v11 + 56) = v10;
      sub_2307F2154(v7, v8);
      LODWORD(v8) = (*v25)(v8, 1, v4);
      id v13 = (id)v27;
      swift_retain();
      uint64_t v14 = *(void *)(v0 + 160);
      if (v8 == 1)
      {
        sub_2307F21BC(*(void *)(v0 + 160));
        if (!*v12) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_230812578();
        (*v24)(v14, v4);
        if (!*v12)
        {
LABEL_8:
          uint64_t v15 = 0;
          uint64_t v17 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v15 = sub_230812538();
      uint64_t v17 = v16;
      swift_unknownObjectRelease();
LABEL_9:
      uint64_t v18 = **(void **)(v0 + 96);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FC8);
      uint64_t v19 = v17 | v15;
      if (v17 | v15)
      {
        uint64_t v19 = v0 + 16;
        *(void *)(v0 + 16) = 0;
        *(void *)(v0 + 24) = 0;
        *(void *)(v0 + 32) = v15;
        *(void *)(v0 + 40) = v17;
      }
      uint64_t v6 = *(void *)(v0 + 168);
      *(void *)(v0 + 48) = 1;
      *(void *)(v0 + 56) = v19;
      *(void *)(v0 + 64) = v18;
      swift_task_create();
      swift_release();
      sub_2307F21BC(v6);
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  *(void *)(v0 + 72) = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CA0);
  sub_2308125C8();
  uint64_t v20 = sub_2307CB7DC(&qword_26AF23FE8, &qword_26AF23FF0);
  uint64_t v21 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v21;
  void *v21 = v0;
  v21[1] = sub_2307F0DA0;
  uint64_t v22 = *(void *)(v0 + 136);
  return MEMORY[0x270FA1E80](v0 + 80, v22, v20);
}

uint64_t sub_2307F0DA0()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[18];
    uint64_t v3 = v2[19];
    uint64_t v5 = v2[17];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_2307F1054;
  }
  else
  {
    uint64_t v6 = sub_2307F0EE4;
  }
  return MEMORY[0x270FA2498](v6, 0, 0);
}

uint64_t sub_2307F0EE4()
{
  unint64_t v1 = v0[10];
  if (v1)
  {
    sub_2307F1408(v1);
    uint64_t v2 = sub_2307CB7DC(&qword_26AF23FE8, &qword_26AF23FF0);
    uint64_t v3 = (void *)swift_task_alloc();
    v0[22] = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_2307F0DA0;
    uint64_t v4 = v0[17];
    return MEMORY[0x270FA1E80](v0 + 10, v4, v2);
  }
  else
  {
    uint64_t v5 = (void *)v0[11];
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
    swift_bridgeObjectRelease();
    void *v5 = v0[9];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
}

uint64_t sub_2307F1054()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307F10CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  v7[3] = a1;
  return MEMORY[0x270FA2498](sub_2307F10F4, 0, 0);
}

uint64_t sub_2307F10F4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (*(uint64_t (**)(void))(v0 + 40))(*(void *)(v0 + 56));
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FC8);
  *uint64_t v4 = v0;
  v4[1] = sub_2307F1214;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0x6575516863746566, 0xEE00293A5F287972, sub_2307F259C, v3, v5);
}

uint64_t sub_2307F1214()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2307F13A0;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2307F1330;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307F1330()
{
  uint64_t v1 = *(void **)(v0 + 24);

  *uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2307F13A0()
{
  uint64_t v1 = *(void **)(v0 + 64);
  swift_task_dealloc();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2307F1408(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_230812808();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_230812808();
    swift_bridgeObjectRelease();
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v5 = v4 + v3;
  if (__OFADD__(v4, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  uint64_t v4 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v4 = 1;
  }
  if (v6 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v5) {
      uint64_t v9 = v5;
    }
    swift_bridgeObjectRetain();
    *uint64_t v1 = MEMORY[0x230FBF440](v4, v9, 1, v6);
    swift_bridgeObjectRelease();
    uint64_t v8 = *v1 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_2307F1D18(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_230812808();
    swift_bridgeObjectRelease();
    unint64_t v6 = *v1;
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
  return sub_230812528();
}

uint64_t sub_2307F15DC(uint64_t a1)
{
  uint64_t v3 = *v1;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](sub_2307F1600, 0, 0);
}

uint64_t sub_2307F1600()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = swift_task_alloc();
  v0[4] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2307EEAF8;
  uint64_t v5 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2360](v4, 0, 0, 0x6928657461647075, 0xEB00000000293A6ELL, sub_2307F25A0, v3, v5);
}

uint64_t sub_2307F16F8(uint64_t a1, uint64_t a2)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return MEMORY[0x270FA2498](sub_2307F1720, 0, 0);
}

uint64_t sub_2307F1720()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[6] = v5;
  void *v5 = v0;
  v5[1] = sub_2307F1824;
  uint64_t v6 = MEMORY[0x263F8EE60] + 8;
  return MEMORY[0x270FA2360](v5, 0, 0, 0x6628657461647075, 0xEF293A6E693A726FLL, sub_2307F2580, v4, v6);
}

uint64_t sub_2307F1824()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2307EE58C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_2307F2598;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307F1940(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2307DD380;
  v7[4] = a2;
  v7[5] = v6;
  v7[3] = a1;
  return MEMORY[0x270FA2498](sub_2307EF6B0, 0, 0);
}

uint64_t sub_2307F1A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2307F2584;
  v9[5] = a3;
  v9[6] = v8;
  v9[3] = a1;
  v9[4] = a2;
  return MEMORY[0x270FA2498](sub_2307EF9DC, 0, 0);
}

uint64_t sub_2307F1AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2307F2584;
  v9[10] = a3;
  v9[11] = v8;
  v9[8] = a1;
  v9[9] = a2;
  return MEMORY[0x270FA2498](sub_2307EFD08, 0, 0);
}

uint64_t sub_2307F1B88(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2307F2584;
  v7[9] = a2;
  v7[10] = v6;
  v7[8] = a1;
  return MEMORY[0x270FA2498](sub_2307F0118, 0, 0);
}

uint64_t sub_2307F1C48(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
    sub_2308127C8();
    uint64_t v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithLongLong_, v5);
      sub_2308127A8();
      sub_2308127D8();
      sub_2308127E8();
      sub_2308127B8();
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_2307F1D18(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_230812808();
    uint64_t result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_230812808();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_2307CB7DC(&qword_26AF23DB0, &qword_26AF23FC8);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FC8);
            uint64_t v10 = sub_230802660(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_2307CB7A0(0, &qword_26AF23DA8);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2307F1EE8(uint64_t a1)
{
  return sub_2307F045C(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2307F1EF0()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return MEMORY[0x270FA0238](v0, 64, 7);
}

void *sub_2307F1F30(uint64_t a1)
{
  return sub_2307F0058(a1, *(void *)(v1 + 16));
}

uint64_t sub_2307F1F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_2307CBA50;
  return sub_2307F092C(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_2307F2004()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void *sub_2307F203C(uint64_t a1)
{
  return sub_2307F278C(a1, 0);
}

uint64_t sub_2307F2048()
{
  swift_unknownObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2307F2090(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  uint64_t v6 = swift_task_alloc();
  long long v7 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_2307C8818;
  *(void *)(v6 + 48) = v4;
  *(void *)(v6 + 56) = v5;
  *(_OWORD *)(v6 + 32) = v7;
  *(void *)(v6 + 24) = a1;
  return MEMORY[0x270FA2498](sub_2307F10F4, 0, 0);
}

uint64_t sub_2307F2154(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2307F21BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2307F221C()
{
  return objectdestroy_44Tm(&qword_26AF23FE0);
}

uint64_t sub_2307F2228(uint64_t a1, void *a2)
{
  sub_230812098();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23FE0);
  return sub_2307F0780(a1, a2);
}

uint64_t sub_2307F2310()
{
  return objectdestroy_44Tm(&qword_268702F28);
}

uint64_t sub_2307F231C(void *a1)
{
  return sub_2307F249C(a1);
}

uint64_t sub_2307F232C()
{
  return objectdestroy_44Tm(&qword_268702F28);
}

uint64_t objectdestroy_44Tm(uint64_t *a1)
{
  uint64_t v3 = sub_230812098();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 16) & ~v5;
  uint64_t v7 = *(void *)(v4 + 64);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = (v6 + v7 + v10) & ~v10;
  uint64_t v12 = v11 + *(void *)(v9 + 64);
  uint64_t v13 = v5 | v10 | 7;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1 + v6, v3);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1 + v11, v8);
  return MEMORY[0x270FA0238](v1, v12, v13);
}

uint64_t sub_2307F248C(void *a1)
{
  return sub_2307F249C(a1);
}

uint64_t sub_2307F249C(void *a1)
{
  return sub_2307EF5A0(a1);
}

id sub_2307F25A4(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, sel_redownloadParams);
  sub_230812448();

  sub_2307F26C4();
  sub_2308126D8();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268702F38);
  sub_2307F2718();
  sub_230812428();

  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)sub_230812438();
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_2307F26C4()
{
  unint64_t result = qword_268702F30;
  if (!qword_268702F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702F30);
  }
  return result;
}

unint64_t sub_2307F2718()
{
  unint64_t result = qword_268702F40;
  if (!qword_268702F40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268702F38);
    sub_2307E3C68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702F40);
  }
  return result;
}

void *sub_2307F278C(uint64_t a1, char a2)
{
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F25490]), sel_init);
  uint64_t v5 = v4;
  if (a2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = a1;
  }
  objc_msgSend(v4, sel_setAccountID_, v6);
  objc_msgSend(v5, sel_setIsHidden_, 2);
  objc_msgSend(v5, sel_setIsFirstParty_, 2);
  objc_msgSend(v5, sel_setIsPreorder_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24048);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_230814920;
  sub_230812448();
  id v8 = objc_allocWithZone(MEMORY[0x263F25498]);
  uint64_t v9 = (void *)sub_230812438();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(v8, sel_initWithName_ascending_, v9, 0);

  *(void *)(v7 + 32) = v10;
  sub_230812528();
  sub_2307CB7A0(0, &qword_26AF24020);
  uint64_t v11 = (void *)sub_230812508();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setSortOptions_, v11);

  return v5;
}

void *sub_2307F291C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307F2C64(a1, (uint64_t)v4);
  uint64_t v5 = sub_230812318();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_2307DD6F8((uint64_t)v4);
LABEL_5:
    id v8 = 0;
    char v9 = 1;
    return sub_2307F278C((uint64_t)v8, v9);
  }
  swift_getKeyPath();
  sub_230812308();
  swift_release();
  uint64_t v7 = (void *)v11[1];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  if (!v7) {
    goto LABEL_5;
  }
  id v8 = objc_msgSend(v7, sel_longLongValue);

  char v9 = 0;
  return sub_2307F278C((uint64_t)v8, v9);
}

void *sub_2307F2A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2307F2C64(a2, (uint64_t)v6);
  uint64_t v7 = sub_230812318();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2307DD6F8((uint64_t)v6);
LABEL_5:
    id v10 = 0;
    char v11 = 1;
    goto LABEL_6;
  }
  swift_getKeyPath();
  sub_230812308();
  swift_release();
  char v9 = (void *)v15[1];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  if (!v9) {
    goto LABEL_5;
  }
  id v10 = objc_msgSend(v9, sel_longLongValue);

  char v11 = 0;
LABEL_6:
  uint64_t v12 = sub_2307F278C((uint64_t)v10, v11);
  sub_2307F1C48(a1);
  sub_2307CB7A0(0, (unint64_t *)&qword_26AF24BF8);
  uint64_t v13 = (void *)sub_230812508();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setStoreIDs_, v13);

  return v12;
}

uint64_t sub_2307F2C64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2307F2CD4(void *a1, id a2)
{
  if (a2)
  {
    id v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268702F90);
    return sub_230812548();
  }
  if (!a1)
  {
    type metadata accessor for ASDError(0);
    sub_2307F4268(MEMORY[0x263F8EE78]);
    sub_2307F43A0();
    sub_230811FD8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268702F90);
    return sub_230812548();
  }
  id v4 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268702F90);
  return sub_230812558();
}

uint64_t sub_2307F2DB8(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268702F78);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_230812068();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  char v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v16 - v12;
  if (a2)
  {
    uint64_t v17 = (uint64_t)a2;
    id v14 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268702F70);
    return sub_230812548();
  }
  sub_2307D5154(a1, (uint64_t)v6, &qword_268702F78);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2307F4208((uint64_t)v6);
    type metadata accessor for ASDError(0);
    uint64_t v16 = 901;
    sub_2307F4268(MEMORY[0x263F8EE78]);
    sub_2307F43A0();
    sub_230811FD8();
    uint64_t v16 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268702F70);
    return sub_230812548();
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268702F70);
  sub_230812558();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

Swift::Bool __swiftcall ASDPurchaseManager.isDeletableSystemApp(_:)(Swift::String a1)
{
  id v1 = (void *)MEMORY[0x230FBF6E0]();
  objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  id v2 = sub_2307F4054();
  if (v2)
  {

    Swift::Bool v3 = 1;
  }
  else
  {
    Swift::Bool v3 = 0;
  }
  return v3;
}

uint64_t ASDPurchaseManager.start(_:)(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  v2[5] = swift_getObjectType();
  return MEMORY[0x270FA2498](sub_2307F312C, 0, 0);
}

uint64_t sub_2307F312C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  id v2 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  v2[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v2[2].i64[0] = v1;
  Swift::Bool v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  unint64_t v4 = sub_2307F412C();
  *Swift::Bool v3 = v0;
  v3[1] = sub_2307F3238;
  return MEMORY[0x270FA2360](v0 + 16, 0, 0, 0x3A5F287472617473, 0xE900000000000029, sub_2307F4120, v2, v4);
}

uint64_t sub_2307F3238()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v2 = sub_2307F341C;
  }
  else
  {
    swift_task_dealloc();
    id v2 = sub_2307F3354;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307F3354()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (objc_msgSend(v1, sel_error))
  {
    swift_willThrow();

    id v2 = *(uint64_t (**)(id))(v0 + 8);
    id v3 = 0;
  }
  else
  {
    id v4 = objc_msgSend(v1, sel_success);

    id v2 = *(uint64_t (**)(id))(v0 + 8);
    id v3 = v4;
  }
  return v2(v3);
}

uint64_t sub_2307F341C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

void sub_2307F3484(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268702F90);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_2307F4660;
  *(void *)(v11 + 24) = v10;
  aBlock[4] = sub_2307F471C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2307F365C;
  aBlock[3] = &block_descriptor_17;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_startPurchase_withResultHandler_, a3, v12);
  _Block_release(v12);
}

void sub_2307F365C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t ASDPurchaseManager.install(_:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v3[5] = swift_getObjectType();
  return MEMORY[0x270FA2498](sub_2307F375C, 0, 0);
}

uint64_t sub_2307F375C()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = (int8x16_t *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  v2[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v2[2].i64[0] = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  uint64_t v4 = sub_230812068();
  *uint64_t v3 = v0;
  v3[1] = sub_2307F3860;
  uint64_t v5 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v5, 0, 0, 0x286C6C6174736E69, 0xEB00000000293A5FLL, sub_2307F416C, v2, v4);
}

uint64_t sub_2307F3860()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2307F399C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2307F399C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_2307F3A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268702F70);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (NSString *)sub_230812438();
  NSClassFromString(v8);

  unint64_t v9 = self;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  unint64_t v10 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v11 + v10, (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  aBlock[4] = sub_2307F4184;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2307F3BE4;
  aBlock[3] = &block_descriptor_1;
  uint64_t v12 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v9, sel_installApp_withCompletionHandler_, a3, v12);
  _Block_release(v12);
}

uint64_t sub_2307F3BE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268702F78);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_230812058();
    uint64_t v10 = sub_230812068();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_230812068();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  id v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_2307F4208((uint64_t)v8);
}

uint64_t sub_2307F3D24()
{
  uint64_t v0 = (void *)MEMORY[0x230FBF6E0]();
  objc_allocWithZone(MEMORY[0x263F01878]);
  swift_bridgeObjectRetain();
  id v1 = sub_2307F4054();
  if (v1)
  {

    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

uint64_t sub_2307F3DB8(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307F3E80;
  v5[3] = a1;
  v5[4] = v4;
  v5[5] = swift_getObjectType();
  return MEMORY[0x270FA2498](sub_2307F312C, 0, 0);
}

uint64_t sub_2307F3E80(char a1)
{
  uint64_t v7 = *v2;
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (v1) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = a1 & 1;
  }
  return v4(v5);
}

uint64_t sub_2307F3F88(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[3] = a2;
  v7[4] = v6;
  v7[1] = sub_2307C8818;
  v7[2] = a1;
  v7[5] = swift_getObjectType();
  return MEMORY[0x270FA2498](sub_2307F375C, 0, 0);
}

id sub_2307F4054()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_230812438();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithBundleIdentifierOfSystemPlaceholder_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_230811FE8();

    swift_willThrow();
  }
  return v2;
}

void sub_2307F4120(uint64_t a1)
{
  sub_2307F3484(a1, *(void **)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t sub_2307F412C()
{
  unint64_t result = qword_268702F50;
  if (!qword_268702F50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268702F50);
  }
  return result;
}

void sub_2307F416C(uint64_t a1)
{
  sub_2307F3A00(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2307F4178()
{
  return objectdestroyTm_0(&qword_268702F70);
}

uint64_t sub_2307F4184(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268702F70);
  return sub_2307F2DB8(a1, a2);
}

uint64_t sub_2307F4208(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268702F78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2307F4268(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268702F80);
  uint64_t v2 = sub_230812838();
  id v3 = (void *)v2;
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
    sub_2307D5154(v6, (uint64_t)&v15, &qword_268702F88);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2307F43F8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2307F4470(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2307F43A0()
{
  unint64_t result = qword_268702C28;
  if (!qword_268702C28)
  {
    type metadata accessor for ASDError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702C28);
  }
  return result;
}

unint64_t sub_2307F43F8(uint64_t a1, uint64_t a2)
{
  sub_230812958();
  sub_230812468();
  uint64_t v4 = sub_230812998();
  return sub_2307F4480(a1, a2, v4);
}

_OWORD *sub_2307F4470(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2307F4480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_230812878() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_230812878() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_230812878()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_2307F45C8()
{
  return objectdestroyTm_0(&qword_268702F90);
}

uint64_t objectdestroyTm_0(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_2307F4660(void **a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268702F90);
  uint64_t v4 = *a1;
  return sub_2307F2CD4(v4, a2);
}

uint64_t sub_2307F46E4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2307F471C(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_2307F475C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *v6;
  if (a4) {
    uint64_t v12 = (void *)sub_230812438();
  }
  else {
    uint64_t v12 = 0;
  }
  v15[4] = a5;
  v15[5] = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 1107296256;
  void v15[2] = sub_2307F4850;
  uint64_t v15[3] = &block_descriptor_6;
  BOOL v13 = _Block_copy(v15);
  swift_retain();
  objc_msgSend(v11, sel_getSubscriptionEntitlementsForSegment_ignoreCaches_requestingBundleId_withCacheInfoResultHandler_, a1, a2 & 1, v12, v13);
  _Block_release(v13);

  return swift_release();
}

uint64_t sub_2307F4850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = a2;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2307CB7A0(0, &qword_26AF24010);
    uint64_t v8 = sub_230812518();
  }
  swift_retain();
  id v10 = a5;
  v9(v8, a3, a4, a5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2307F4910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *v3;
  v8[4] = a2;
  v8[5] = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_2307F49CC;
  v8[3] = &block_descriptor_3;
  uint64_t v6 = _Block_copy(v8);
  swift_retain();
  objc_msgSend(v5, sel_getCachedSubscriptionEntitlementsForSegment_withResultHandler_, a1, v6);
  _Block_release(v6);
  return swift_release();
}

uint64_t sub_2307F49CC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_2307F4AA8(a1, a2, a3, a4, &qword_26AF24010);
}

uint64_t sub_2307F49E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  id v6[2] = sub_2307F4A94;
  v6[3] = &block_descriptor_2;
  uint64_t v4 = _Block_copy(v6);
  swift_retain();
  objc_msgSend(v3, sel_getAppStoreConsumedIntroOfferFamilyIdsWithResultHandler_, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_2307F4A94(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return sub_2307F4AA8(a1, a2, a3, a4, (unint64_t *)&qword_26AF24BF8);
}

uint64_t sub_2307F4AA8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t v7 = a2;
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_2307CB7A0(0, a5);
    uint64_t v7 = sub_230812518();
  }
  swift_retain();
  id v9 = a4;
  v8(v7, a3, a4);
  swift_release();

  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for TimedOutError()
{
  return &type metadata for TimedOutError;
}

uint64_t sub_2307F4B70()
{
  uint64_t result = sub_2308126C8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id *sub_2307F4C14()
{
  unint64_t v1 = (char *)v0 + *((void *)*v0 + 12);
  uint64_t v2 = sub_2308126C8();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_2307F4CA4()
{
  sub_2307F4C14();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t type metadata accessor for AsyncExpensive()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t AvailableUpdate.hash(into:)()
{
  sub_230812988();
  swift_bridgeObjectRetain();
  sub_230812468();
  return swift_bridgeObjectRelease();
}

uint64_t static AvailableUpdate.== infix(_:_:)(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  if (a1[1] == a2[1] && a1[2] == a2[2]) {
    return 1;
  }
  else {
    return sub_230812878();
  }
}

uint64_t AvailableUpdate.hashValue.getter()
{
  return sub_230812998();
}

uint64_t sub_2307F4E64()
{
  return sub_230812998();
}

uint64_t sub_2307F4ED8()
{
  sub_230812988();
  swift_bridgeObjectRetain();
  sub_230812468();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2307F4F3C()
{
  return sub_230812998();
}

unint64_t sub_2307F4FB0()
{
  unint64_t result = qword_268702F98;
  if (!qword_268702F98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268702F98);
  }
  return result;
}

uint64_t sub_2307F5004(void *a1, void *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  if (a1[1] == a2[1] && a1[2] == a2[2]) {
    return 1;
  }
  else {
    return sub_230812878();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for AvailableUpdate(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AvailableUpdate()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AvailableUpdate(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AvailableUpdate(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AvailableUpdate(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AvailableUpdate(uint64_t result, int a2, int a3)
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

ValueMetadata *_s7BuyableVMa()
{
  return &_s7BuyableVN;
}

BOOL sub_2307F51C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (unsigned __int8 *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  id v10 = (char *)&v16 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v16 - v11;
  sub_2307CE248(a2, (uint64_t)&v16 - v11);
  LODWORD(a2) = swift_getEnumCaseMultiPayload();
  sub_2307E286C((uint64_t)v12);
  if (a2 != 6) {
    return 0;
  }
  sub_2307CE248(a1, (uint64_t)v10);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  BOOL v14 = 1;
  if (EnumCaseMultiPayload != 8)
  {
    if (EnumCaseMultiPayload || (sub_2307CE248((uint64_t)v10, (uint64_t)v7), *v7 >= 2u)) {
      BOOL v14 = 0;
    }
  }
  sub_2307E286C((uint64_t)v10);
  return v14;
}

uint64_t DefaultAppStateDataSource.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B68);
  swift_allocObject();
  *(void *)(v0 + 16) = sub_2308123F8();
  return v0;
}

uint64_t DefaultAppStateDataSource.onSynchronizeAppStates.getter()
{
  return swift_retain();
}

uint64_t DefaultAppStateDataSource.load()()
{
  return sub_2307CBC98(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DefaultAppStateDataSource.reloadState(forAppsWith:synchronizing:)()
{
  return sub_2307CBC98(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DefaultAppStateDataSource.reloadAllStates(synchronizing:)()
{
  return sub_2307CBC98(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t DefaultAppStateDataSource.state(forAppWith:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for State();
  swift_storeEnumTagMultiPayload();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  return v3(a1, 0, 1, v2);
}

uint64_t DefaultAppStateDataSource.deinit()
{
  swift_release();
  return v0;
}

uint64_t DefaultAppStateDataSource.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t method lookup function for DefaultAppStateDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DefaultAppStateDataSource);
}

uint64_t dispatch thunk of DefaultAppStateDataSource.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

void sub_2307F5520(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &_s8WildcardVN;
  *(void *)(a1 + 32) = &off_26E4795B8;
}

uint64_t sub_2307F5538()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

unint64_t sub_2307F5570(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  sub_230812958();
  sub_230812988();
  sub_230812968();
  uint64_t v4 = sub_230812998();
  return sub_2307F55FC(a1, v3, v4);
}

unint64_t sub_2307F55FC(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  for (unint64_t result = a3 & ~v5;
        ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
        unint64_t result = (result + 1) & ~v5)
  {
    if (((*(void *)(*(void *)(v3 + 48) + 16 * result) == a1) & (((a2 & 1) == 0) ^ *(unsigned __int8 *)(*(void *)(v3 + 48) + 16 * result + 8))) != 0) {
      break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BetaAppRuleset()
{
  return &type metadata for BetaAppRuleset;
}

ValueMetadata *type metadata accessor for StoreAppRuleset()
{
  return &type metadata for StoreAppRuleset;
}

uint64_t dispatch thunk of DeviceAppFetcher.observeQuery(_:on:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of DeviceAppFetcher.fetchQuery(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2307D9BAC;
  return v9(a1, a2, a3);
}

uint64_t assignWithCopy for DeviceAppQuery(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_2307CAC54(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v3;
  char v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_2307CB9CC(v5, v6);
  return a1;
}

uint64_t assignWithTake for DeviceAppQuery(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_2307CB9CC(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceAppQuery(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFC && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceAppQuery(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 252;
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFC) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2307F593C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_2308127C8();
    uint64_t result = sub_23080E06C(a1);
    uint64_t v4 = result;
    uint64_t v6 = v5;
    char v8 = v7 & 1;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(a1 + 32))
    {
      if (((*(void *)(a1 + 56 + (((unint64_t)v4 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
        goto LABEL_11;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_12;
      }
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithLongLong_, *(void *)(*(void *)(a1 + 48) + 8 * v4));
      sub_2308127A8();
      sub_2308127D8();
      sub_2308127E8();
      sub_2308127B8();
      uint64_t result = sub_23080E110(v4, v6, v8 & 1, a1);
      uint64_t v4 = result;
      uint64_t v6 = v9;
      char v8 = v10 & 1;
      if (!--v2)
      {
        sub_2307F5AA0(result, v9, v10 & 1);
        return v11;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  return result;
}

uint64_t sub_2307F5AA0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2307F5AAC(void *a1)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_2307F5B0C(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_2307F5B0C(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_230812178();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v11 = a1;
  uint64_t v12 = sub_2307F699C;
  uint64_t v13 = 0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C38);
  sub_2307F6FF0();
  uint64_t v10 = sub_230812428();
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v1 + 2, v1[5]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  uint64_t v14 = v3;
  uint64_t v11 = v1;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)&v11, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  uint64_t v14 = MEMORY[0x263F8D310];
  uint64_t v11 = (void *)v10;
  uint64_t v12 = v6;
  sub_230812128();
  sub_2307CDF28((uint64_t)&v11, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  char v7 = (os_unfair_lock_s *)(v1[24] + 16);
  os_unfair_lock_lock(v7);
  sub_2307F70F8(&v11);
  os_unfair_lock_unlock(v7);
  os_unfair_lock_lock(v7);
  sub_2307F70F8(&v11);
  os_unfair_lock_unlock(v7);
  char v8 = v11;
  swift_bridgeObjectRelease();
  uint64_t v11 = v8;
  sub_2308123E8();
  return swift_bridgeObjectRelease();
}

uint64_t DeviceAppStateDataSource.deinit()
{
  *(void *)(v0 + 176) = 0;
  *(void *)(v0 + 184) = 0;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_2307CB9CC(*(void **)(v0 + 56), *(unsigned char *)(v0 + 64));
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  sub_2307CDF28(v0 + 112, (uint64_t *)&unk_26AF24A60);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t DeviceAppStateDataSource.__deallocating_deinit()
{
  *(void *)(v0 + 176) = 0;
  *(void *)(v0 + 184) = 0;
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_2307CB9CC(*(void **)(v0 + 56), *(unsigned char *)(v0 + 64));
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  sub_2307CDF28(v0 + 112, (uint64_t *)&unk_26AF24A60);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 208, 7);
}

uint64_t DeviceAppStateDataSource.onSynchronizeAppStates.getter()
{
  return swift_retain();
}

uint64_t sub_2307F5F6C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307F5FD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 10;
  uint64_t v14 = v0 + 2;
  uint64_t v3 = v0[24];
  uint64_t v4 = v1[23];
  uint64_t v13 = v1[21];
  __swift_project_boxed_opaque_existential_1((void *)(v4 + 16), *(void *)(v4 + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  uint64_t v5 = sub_230812198();
  uint64_t v6 = *(void *)(v5 - 8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  v1[9] = v3;
  v1[6] = v4;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 6), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  v1[13] = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v6 + 16))(boxed_opaque_existential_0, v13, v5);
  sub_230812128();
  sub_2307CDF28((uint64_t)v2, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v8 = v1[14];
  uint64_t v9 = v1[15];
  v1[5] = v9;
  uint64_t v10 = __swift_allocate_boxed_opaque_existential_0(v14);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v10, v8, v9);
  sub_230812128();
  sub_2307CDF28((uint64_t)v14, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v1[1];
  return v11();
}

uint64_t DeviceAppStateDataSource.reloadState(forAppsWith:synchronizing:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 57) = a2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = v2;
  uint64_t v4 = sub_230812198();
  *(void *)(v3 + 80) = v4;
  *(void *)(v3 + 88) = *(void *)(v4 - 8);
  *(void *)(v3 + 96) = swift_task_alloc();
  uint64_t v5 = sub_230812178();
  *(void *)(v3 + 104) = v5;
  *(void *)(v3 + 112) = *(void *)(v5 - 8);
  *(void *)(v3 + 120) = swift_task_alloc();
  *(void *)(v3 + 128) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307F63C4, 0, 0);
}

uint64_t sub_2307F63C4()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 64);
  *(void *)(v0 + 48) = v5;
  *(unsigned char *)(v0 + 56) = 0;
  swift_bridgeObjectRetain();
  sub_230812168();
  sub_230812158();
  *(void *)(v0 + 40) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BD0);
  *(void *)(v0 + 16) = v5;
  swift_bridgeObjectRetain();
  sub_230812128();
  sub_2307CDF28(v0 + 16, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v1, v3);
  sub_230812188();
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2307F6538;
  uint64_t v7 = *(void *)(v0 + 96);
  char v8 = *(unsigned char *)(v0 + 57);
  return sub_2307C75CC((uint64_t *)(v0 + 48), v7, v5, v8);
}

uint64_t sub_2307F6538()
{
  uint64_t v2 = *(void *)(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = *v1;
  *(void *)(v5 + 144) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_2307CB9CC(*(void **)(v5 + 48), *(unsigned char *)(v5 + 56));
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2307F6708, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_2307F6708()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DeviceAppStateDataSource.reloadAllStates(synchronizing:)(char a1)
{
  *(void *)(v2 + 32) = v1;
  *(unsigned char *)(v2 + 25) = a1;
  uint64_t v3 = sub_230812198();
  *(void *)(v2 + 40) = v3;
  *(void *)(v2 + 48) = *(void *)(v3 - 8);
  *(void *)(v2 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307F6844, 0, 0);
}

uint64_t sub_2307F6844()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v1 + 56);
  char v3 = *(unsigned char *)(v1 + 64);
  *(void *)(v0 + 16) = v2;
  *(unsigned char *)(v0 + 24) = v3;
  sub_2307CAC54(v2, v3);
  sub_230812118();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2307C7978;
  uint64_t v5 = *(void *)(v0 + 56);
  char v6 = *(unsigned char *)(v0 + 25);
  return sub_2307C75CC((uint64_t *)(v0 + 16), v5, 0, v6);
}

void DeviceAppStateDataSource.state(forAppWith:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDCC();
  os_unfair_lock_unlock(v1);
}

uint64_t sub_2307F699C@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v13 = objc_msgSend(*a1, sel_storeItemID);
  uint64_t v4 = sub_230812868();
  unint64_t v6 = v5;
  id v7 = objc_msgSend(v3, sel_progress, v13);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v14 = v4;
    unint64_t v15 = v6;
    sub_230812478();
    id v9 = v8;
    id v10 = objc_msgSend(v9, sel_description);
    sub_230812448();

    sub_230812478();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_230812758();
    sub_230812478();
    swift_bridgeObjectRelease();
    sub_230812478();
    id v12 = objc_msgSend(v3, sel_bundleID);
    sub_230812448();

    sub_230812478();
    swift_bridgeObjectRelease();
    sub_230812478();
    objc_msgSend(v3, sel_isInstalled);
    sub_230812478();
    swift_bridgeObjectRelease();
    sub_230812478();
    objc_msgSend(v3, sel_isLaunchProhibited);
    sub_230812478();
    swift_bridgeObjectRelease();
    uint64_t result = sub_230812478();
  }
  *a2 = v14;
  a2[1] = v15;
  return result;
}

uint64_t sub_2307F6C10@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = a2 + 16;
  swift_beginAccess();
  uint64_t v8 = *(void *)(a2 + 168);
  sub_2307CDEC4(v7, (uint64_t)v29);
  sub_2307D7F14();
  swift_bridgeObjectRetain();
  uint64_t v25 = v8;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_2308125F8();
  uint64_t v30 = v9;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_230812808();
    swift_bridgeObjectRelease();
    uint64_t result = v8;
    if (v10) {
      goto LABEL_3;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_20:
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    *a3 = v9;
    return result;
  }
  uint64_t v10 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = v8;
  if (!v10) {
    goto LABEL_19;
  }
LABEL_3:
  if (v10 >= 1)
  {
    uint64_t v23 = a3;
    uint64_t v24 = v3;
    uint64_t v12 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v14 = (id)MEMORY[0x230FBF430](v12, a1);
      }
      else {
        id v14 = *(id *)(a1 + 8 * v12 + 32);
      }
      unint64_t v15 = v14;
      if (!objc_msgSend(v14, sel_storeItemID, v23, v24))
      {
        id v16 = objc_msgSend(v15, sel_bundleID);
        uint64_t v17 = sub_230812448();
        uint64_t v19 = v18;

        if (*(void *)(v25 + 16))
        {
          unint64_t v20 = sub_2307D55B4(v17, v19);
          if (v21)
          {
            uint64_t v13 = *(void *)(*(void *)(v25 + 56) + 8 * v20);

            swift_bridgeObjectRelease();
            goto LABEL_6;
          }
        }
        swift_bridgeObjectRelease();
      }
      id v22 = objc_msgSend(v15, sel_storeItemID);
      sub_2307CDEC4((uint64_t)v29, (uint64_t)v26);
      sub_2307D6B0C((uint64_t)v22, (uint64_t)v26, (uint64_t)&v27);

      if (v28) {
        goto LABEL_7;
      }
      uint64_t v13 = v27;
LABEL_6:
      sub_2307D51B8(v26, v13);
LABEL_7:
      if (v10 == ++v12)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v9 = v30;
        a3 = v23;
        goto LABEL_20;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2307F6E58(uint64_t a1, char a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307C8818;
  return DeviceAppStateDataSource.reloadState(forAppsWith:synchronizing:)(a1, a2);
}

uint64_t sub_2307F6F00(char a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2307CBA50;
  return DeviceAppStateDataSource.reloadAllStates(synchronizing:)(a1);
}

uint64_t method lookup function for DeviceAppStateDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceAppStateDataSource);
}

uint64_t sub_2307F6FB0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2307F6FE8(void *a1)
{
  return sub_2307F5AAC(a1);
}

unint64_t sub_2307F6FF0()
{
  unint64_t result = qword_26AF24C30;
  if (!qword_26AF24C30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AF24C38);
    sub_2307F7064();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF24C30);
  }
  return result;
}

unint64_t sub_2307F7064()
{
  unint64_t result = qword_26AF24BA8;
  if (!qword_26AF24BA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AF24BA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF24BA8);
  }
  return result;
}

uint64_t sub_2307F70C0@<X0>(uint64_t *a1@<X8>)
{
  return sub_2307F6C10(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

void sub_2307F70E0(void *a1@<X8>)
{
}

void *sub_2307F70F8@<X0>(void *a1@<X8>)
{
  return sub_2307CBE0C(a1);
}

uint64_t sub_2307F7110(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v15 = MEMORY[0x263F8EE78];
  sub_23080BE4C(0, v1, 0);
  uint64_t v2 = v15;
  uint64_t result = sub_23080E06C(a1);
  uint64_t v5 = result;
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      goto LABEL_13;
    }
    if (*(_DWORD *)(a1 + 36) != v7) {
      goto LABEL_14;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8 * v5);
    unint64_t v12 = *(void *)(v15 + 16);
    unint64_t v11 = *(void *)(v15 + 24);
    if (v12 >= v11 >> 1) {
      sub_23080BE4C((char *)(v11 > 1), v12 + 1, 1);
    }
    *(void *)(v15 + 16) = v12 + 1;
    *(void *)(v15 + 8 * v12 + 32) = v10;
    uint64_t result = sub_23080E110(v5, v7, v9 & 1, a1);
    uint64_t v5 = result;
    uint64_t v7 = v13;
    char v9 = v14 & 1;
    if (!--v1)
    {
      sub_2307F5AA0(result, v13, v14 & 1);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t DeviceUpdateRegistry.entry(forAdamID:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  swift_retain();
  os_unfair_lock_lock(v3 + 6);
  sub_2307D6A3C((unint64_t)&v3[4], a1);
  os_unfair_lock_unlock(v3 + 6);
  return swift_release();
}

uint64_t DeviceUpdateRegistry.addEntry(_:forAdamID:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = sub_230812178();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v9 = a1[2];
  uint64_t v10 = *a2;
  __swift_project_boxed_opaque_existential_1(v2 + 3, (uint64_t)v2[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  char v14 = v5;
  v13[0] = v2;
  swift_retain();
  sub_230812128();
  sub_2307DB4D8((uint64_t)v13);
  sub_230812158();
  v13[0] = v8;
  v13[1] = v7;
  v13[2] = v9;
  char v14 = &type metadata for AvailableUpdate;
  swift_bridgeObjectRetain();
  sub_230812128();
  sub_2307DB4D8((uint64_t)v13);
  sub_230812158();
  char v14 = (ValueMetadata *)MEMORY[0x263F8E5C0];
  v13[0] = v10;
  sub_230812128();
  sub_2307DB4D8((uint64_t)v13);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  unint64_t v11 = v2[2];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)&v11[1].Description);
  sub_2307F7B98(&v11[1].Kind);
  os_unfair_lock_unlock((os_unfair_lock_t)&v11[1].Description);
  return swift_release();
}

uint64_t sub_2307F759C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v12 = *a1;
  *a1 = 0x8000000000000000;
  sub_230811A20(a3, a4, a5, a2, isUniquelyReferenced_nonNull_native);
  *a1 = v12;
  return swift_bridgeObjectRelease();
}

uint64_t DeviceUpdateRegistry.removeEntry(forAdamID:)(uint64_t *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_230812178();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = *a1;
  __swift_project_boxed_opaque_existential_1(v1 + 3, v1[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  uint64_t v9 = v3;
  v8[0] = v1;
  swift_retain();
  sub_230812128();
  sub_2307DB4D8((uint64_t)v8);
  sub_230812158();
  uint64_t v9 = MEMORY[0x263F8E5C0];
  v8[0] = v5;
  sub_230812128();
  sub_2307DB4D8((uint64_t)v8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  uint64_t v6 = v1[2];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 24));
  sub_2307F7BB8((uint64_t *)(v6 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 24));
  return swift_release();
}

unint64_t sub_2307F787C(uint64_t *a1, uint64_t a2)
{
  unint64_t result = sub_2307CF3B0(a2);
  if (v4)
  {
    unint64_t v5 = result;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v7 = *a1;
    uint64_t v8 = *a1;
    *a1 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2308114DC();
      uint64_t v7 = v8;
    }
    sub_230810CB8(v5, v7);
    *a1 = v7;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_2307F7928(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = a2 + 56;
  uint64_t v5 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v10 << 6);
LABEL_20:
    unint64_t result = sub_2307CF3B0(*(void *)(*(void *)(a2 + 48) + 8 * v12));
    if (v16)
    {
      unint64_t v17 = result;
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v19 = *a1;
      uint64_t v20 = *a1;
      *a1 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_2308114DC();
        uint64_t v19 = v20;
      }
      sub_230810CB8(v17, v19);
      *a1 = v19;
      swift_bridgeObjectRelease();
      unint64_t result = swift_bridgeObjectRelease();
    }
  }
  int64_t v13 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v13 >= v8) {
    return swift_release();
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  ++v10;
  if (v14) {
    goto LABEL_19;
  }
  int64_t v10 = v13 + 1;
  if (v13 + 1 >= v8) {
    return swift_release();
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14) {
    goto LABEL_19;
  }
  int64_t v10 = v13 + 2;
  if (v13 + 2 >= v8) {
    return swift_release();
  }
  unint64_t v14 = *(void *)(v4 + 8 * v10);
  if (v14)
  {
LABEL_19:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_20;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v8) {
    return swift_release();
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v14 = *(void *)(v4 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t DeviceUpdateRegistry.deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return v0;
}

uint64_t DeviceUpdateRegistry.__deallocating_deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return MEMORY[0x270FA0228](v0, 64, 7);
}

uint64_t sub_2307F7B50(uint64_t *a1, uint64_t *a2)
{
  return DeviceUpdateRegistry.addEntry(_:forAdamID:)(a1, a2);
}

uint64_t sub_2307F7B74(uint64_t *a1)
{
  return DeviceUpdateRegistry.removeEntry(forAdamID:)(a1);
}

uint64_t sub_2307F7B98(uint64_t *a1)
{
  return sub_2307F759C(a1, v1[2], v1[3], v1[4], v1[5]);
}

unint64_t sub_2307F7BB8(uint64_t *a1)
{
  return sub_2307F787C(a1, *(void *)(v1 + 16));
}

unint64_t sub_2307F7BD4(uint64_t *a1)
{
  return sub_2307F7928(a1, *(void *)(v1 + 16));
}

uint64_t method lookup function for DeviceUpdateRegistry(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceUpdateRegistry);
}

uint64_t DisabledArcadeSubscriptionManager.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F70);
  swift_allocObject();
  *(void *)(v0 + 16) = sub_230812108();
  return v0;
}

uint64_t DisabledArcadeSubscriptionManager.init()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F70);
  swift_allocObject();
  *(void *)(v0 + 16) = sub_230812108();
  return v0;
}

void DisabledArcadeSubscriptionManager.subscriptionState.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 3;
}

uint64_t DisabledArcadeSubscriptionManager.onSubscriptionStateChange.getter()
{
  return swift_retain();
}

uint64_t DisabledArcadeSubscriptionManager.updateStateFromEntitlements(refreshingCache:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2307F7CE0, 0, 0);
}

uint64_t sub_2307F7CE0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DisabledArcadeSubscriptionManager.deinit()
{
  swift_release();
  return v0;
}

uint64_t DisabledArcadeSubscriptionManager.__deallocating_deinit()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

void sub_2307F7D60(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 3;
}

uint64_t sub_2307F7D70(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return MEMORY[0x270FA2498](sub_2307F7DE0, 0, 0);
}

uint64_t type metadata accessor for DisabledArcadeSubscriptionManager()
{
  return self;
}

uint64_t method lookup function for DisabledArcadeSubscriptionManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DisabledArcadeSubscriptionManager);
}

uint64_t dispatch thunk of DisabledArcadeSubscriptionManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

ValueMetadata *_s12DownloadableVMa()
{
  return &_s12DownloadableVN;
}

uint64_t sub_2307F7DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v14 - v8;
  sub_2307CE248(a2, (uint64_t)&v14 - v8);
  LODWORD(a2) = swift_getEnumCaseMultiPayload();
  sub_2307CE05C((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for State);
  if (a2 != 3) {
    return 0;
  }
  sub_2307CE248(a1, (uint64_t)v7);
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  unint64_t v11 = (uint64_t (*)(void))type metadata accessor for State;
  if (EnumCaseMultiPayload > 8) {
    goto LABEL_8;
  }
  uint64_t v12 = 1;
  if (((1 << EnumCaseMultiPayload) & 0x1A3) == 0)
  {
    if (EnumCaseMultiPayload == 2)
    {
LABEL_9:
      sub_2307CE05C((uint64_t)v7, v11);
      return v12;
    }
    if (EnumCaseMultiPayload == 4)
    {
      unint64_t v11 = type metadata accessor for AppInstallation;
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v12 = 0;
    unint64_t v11 = (uint64_t (*)(void))type metadata accessor for State;
    goto LABEL_9;
  }
  return v12;
}

uint64_t sub_2307F7F70()
{
  uint64_t v0 = sub_230811EF8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF24CF0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CE8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = 0x2F2F3A7370747468;
  uint64_t v51 = 0xE90000000000003FLL;
  sub_230812478();
  sub_230811F18();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_230811F28();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    sub_2307CDF28((uint64_t)v6, (uint64_t *)&unk_26AF24CF0);
    return 0;
  }
  uint64_t v12 = sub_230811F08();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  if (!v12) {
    return 0;
  }
  uint64_t v49 = v9;
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint64_t v48 = v1;
    char v16 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    uint64_t v15 = v1 + 16;
    uint64_t v14 = v16;
    unint64_t v17 = v12 + ((*(unsigned __int8 *)(v15 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 64));
    uint64_t v18 = *(void *)(v15 + 56);
    v47[1] = v12;
    swift_bridgeObjectRetain();
    while (1)
    {
      v14(v3, v17, v0);
      if (sub_230811ED8() == 0x7256747845707061 && v19 == 0xEB00000000644973) {
        break;
      }
      char v20 = sub_230812878();
      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_14;
      }
      (*(void (**)(char *, uint64_t))(v15 - 8))(v3, v0);
      v17 += v18;
      if (!--v13)
      {
        swift_bridgeObjectRelease();
        uint64_t v21 = 1;
        uint64_t v1 = v48;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v1 = v48;
    uint64_t v22 = (uint64_t)v49;
    (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v49, v3, v0);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = 1;
LABEL_12:
    uint64_t v22 = (uint64_t)v49;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56))(v22, v21, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v22, 1, v0) == 1)
  {
    sub_2307CDF28(v22, &qword_26AF24CE8);
    return 0;
  }
  uint64_t v23 = sub_230811EE8();
  unint64_t v25 = v24;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v22, v0);
  if (!v25) {
    return 0;
  }
  uint64_t v27 = HIBYTE(v25) & 0xF;
  uint64_t v28 = v23 & 0xFFFFFFFFFFFFLL;
  if ((v25 & 0x2000000000000000) != 0) {
    uint64_t v29 = HIBYTE(v25) & 0xF;
  }
  else {
    uint64_t v29 = v23 & 0xFFFFFFFFFFFFLL;
  }
  if (!v29)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v25 & 0x1000000000000000) == 0)
  {
    if ((v25 & 0x2000000000000000) == 0)
    {
      if ((v23 & 0x1000000000000000) != 0) {
        uint64_t v30 = (unsigned __int8 *)((v25 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        uint64_t v30 = (unsigned __int8 *)sub_230812788();
      }
      uint64_t v31 = (uint64_t)sub_2307DB278(v30, v28, 10);
      char v33 = v32 & 1;
      goto LABEL_61;
    }
    uint64_t v50 = v23;
    uint64_t v51 = v25 & 0xFFFFFFFFFFFFFFLL;
    if (v23 == 43)
    {
      if (!v27) {
        goto LABEL_75;
      }
      if (v27 == 1 || (BYTE1(v23) - 48) > 9u) {
        goto LABEL_48;
      }
      uint64_t v31 = (BYTE1(v23) - 48);
      if (v27 != 2)
      {
        if ((BYTE2(v23) - 48) > 9u) {
          goto LABEL_48;
        }
        uint64_t v31 = 10 * (BYTE1(v23) - 48) + (BYTE2(v23) - 48);
        uint64_t v34 = v27 - 3;
        if (v34)
        {
          uint64_t v35 = (unsigned __int8 *)&v50 + 3;
          while (1)
          {
            unsigned int v36 = *v35 - 48;
            if (v36 > 9) {
              goto LABEL_48;
            }
            uint64_t v37 = 10 * v31;
            if ((unsigned __int128)(v31 * (__int128)10) >> 64 != (10 * v31) >> 63) {
              goto LABEL_48;
            }
            uint64_t v31 = v37 + v36;
            if (__OFADD__(v37, v36)) {
              goto LABEL_48;
            }
            char v33 = 0;
            ++v35;
            if (!--v34) {
              goto LABEL_61;
            }
          }
        }
      }
    }
    else
    {
      if (v23 == 45)
      {
        if (v27)
        {
          if (v27 != 1 && (BYTE1(v23) - 48) <= 9u)
          {
            if (v27 == 2)
            {
              char v33 = 0;
              uint64_t v31 = -(uint64_t)(BYTE1(v23) - 48);
              goto LABEL_61;
            }
            if ((BYTE2(v23) - 48) <= 9u)
            {
              uint64_t v31 = -10 * (BYTE1(v23) - 48) - (BYTE2(v23) - 48);
              uint64_t v42 = v27 - 3;
              if (!v42) {
                goto LABEL_60;
              }
              uint64_t v43 = (unsigned __int8 *)&v50 + 3;
              while (1)
              {
                unsigned int v44 = *v43 - 48;
                if (v44 > 9) {
                  break;
                }
                uint64_t v45 = 10 * v31;
                if ((unsigned __int128)(v31 * (__int128)10) >> 64 != (10 * v31) >> 63) {
                  break;
                }
                uint64_t v31 = v45 - v44;
                if (__OFSUB__(v45, v44)) {
                  break;
                }
                char v33 = 0;
                ++v43;
                if (!--v42) {
                  goto LABEL_61;
                }
              }
            }
          }
LABEL_48:
          uint64_t v31 = 0;
          char v33 = 1;
          goto LABEL_61;
        }
        __break(1u);
LABEL_75:
        __break(1u);
        return result;
      }
      if (!v27 || (v23 - 48) > 9u) {
        goto LABEL_48;
      }
      uint64_t v31 = (v23 - 48);
      if (v27 != 1)
      {
        if ((BYTE1(v23) - 48) > 9u) {
          goto LABEL_48;
        }
        uint64_t v31 = 10 * (v23 - 48) + (BYTE1(v23) - 48);
        uint64_t v38 = v27 - 2;
        if (v38)
        {
          int v39 = (unsigned __int8 *)&v50 + 2;
          while (1)
          {
            unsigned int v40 = *v39 - 48;
            if (v40 > 9) {
              goto LABEL_48;
            }
            uint64_t v41 = 10 * v31;
            if ((unsigned __int128)(v31 * (__int128)10) >> 64 != (10 * v31) >> 63) {
              goto LABEL_48;
            }
            uint64_t v31 = v41 + v40;
            if (__OFADD__(v41, v40)) {
              goto LABEL_48;
            }
            char v33 = 0;
            ++v39;
            if (!--v38) {
              goto LABEL_61;
            }
          }
        }
      }
    }
LABEL_60:
    char v33 = 0;
    goto LABEL_61;
  }
  uint64_t v31 = (uint64_t)sub_2307DB290(v23, v25, 10);
  char v33 = v46;
LABEL_61:
  swift_bridgeObjectRelease();
  if (v33) {
    return 0;
  }
  else {
    return v31;
  }
}

id sub_2307F8630()
{
  if (qword_26AF24000 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_26AF23FF8;
  qword_26AF23F40 = qword_26AF23FF8;
  return v0;
}

AppState::GreenTeaLogger __swiftcall GreenTeaLogger.init()()
{
  uint64_t v1 = v0;
  if (qword_26AF24000 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_26AF23FF8;
  *uint64_t v1 = qword_26AF23FF8;
  uint64_t v3 = v2;
  result.backing._logger = v4;
  result.backing.super.isa = v3;
  return result;
}

id static GreenTeaLogger.shared.getter@<X0>(void *a1@<X8>)
{
  if (qword_26AF23C20 != -1) {
    swift_once();
  }
  uint64_t v2 = (void *)qword_26AF23F40;
  *a1 = qword_26AF23F40;
  return v2;
}

Swift::Void __swiftcall GreenTeaLogger.willAccessLocationForSearch()()
{
  objc_msgSend(*v0, sel_willAccessLocationForSearch);
}

Swift::Void __swiftcall GreenTeaLogger.willTransmitLocationForSearch()()
{
  objc_msgSend(*v0, sel_willTransmitLocationForSearch);
}

Swift::Void __swiftcall GreenTeaLogger.willRequestAppList()()
{
  objc_msgSend(*v0, sel_willRequestAppList);
}

id sub_2307F879C()
{
  return objc_msgSend(*v0, sel_willAccessLocationForSearch);
}

id sub_2307F87AC()
{
  return objc_msgSend(*v0, sel_willTransmitLocationForSearch);
}

id sub_2307F87BC()
{
  return objc_msgSend(*v0, sel_willRequestAppList);
}

id sub_2307F87CC()
{
  id result = objc_msgSend(objc_allocWithZone((Class)ASGreenTeaLogger), sel_init);
  qword_26AF23FF8 = (uint64_t)result;
  return result;
}

ValueMetadata *type metadata accessor for GreenTeaLogger()
{
  return &type metadata for GreenTeaLogger;
}

uint64_t sub_2307F8810(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v31 = sub_2308120B8();
  uint64_t v24 = *(void *)(v31 - 8);
  uint64_t v25 = v24;
  MEMORY[0x270FA5388](v31);
  uint64_t v26 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_230812628();
  uint64_t v4 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_2308120D8();
  uint64_t v27 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_230812618();
  MEMORY[0x270FA5388](v9);
  *(unsigned char *)(v2 + 24) = 2;
  v21[1] = sub_2307F9394();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24038);
  uint64_t v10 = swift_allocObject();
  long long v22 = xmmword_230813840;
  *(_OWORD *)(v10 + 16) = xmmword_230813840;
  sub_230812608();
  aBlock[0] = v10;
  sub_2307F93D4(&qword_26AF24BE0, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B88);
  sub_2307F941C((unint64_t *)&unk_26AF24B90, &qword_26AF24B88);
  sub_230812708();
  sub_2308120C8();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F130], v23);
  uint64_t v11 = v2;
  *(void *)(v2 + 16) = sub_230812658();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C88);
  uint64_t v12 = v25;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v22;
  sub_2308120A8();
  aBlock[0] = v13;
  sub_2307F93D4(&qword_26AF24B10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B78);
  sub_2307F941C(&qword_26AF24B80, &qword_26AF24B78);
  uint64_t v14 = v26;
  sub_230812708();
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  char v16 = (void *)swift_allocObject();
  uint64_t v17 = v28;
  uint64_t v18 = v29;
  v16[2] = v15;
  v16[3] = v17;
  void v16[4] = v18;
  aBlock[4] = sub_2307F94E4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2308047A8;
  aBlock[3] = &block_descriptor_3;
  uint64_t v19 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_2308120C8();
  MEMORY[0x230FBF310](0, v8, v14, v19);
  _Block_release(v19);
  swift_release();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v8, v30);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v31);
  swift_release();
  swift_release();
  return v11;
}

uint64_t sub_2307F8DA0(uint64_t a1, void (*a2)(uint64_t *__return_ptr))
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    a2(&v5);
    *(unsigned char *)(v4 + 24) = v5;
    return swift_release();
  }
  return result;
}

uint64_t HardwarePlatform.init(bag:device:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_230812288();
  v17[3] = v6;
  v17[4] = (uint64_t)&off_26E478AC8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v17);
  uint64_t v8 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16))(boxed_opaque_existential_0, a2, v6);
  sub_2307CDEC4((uint64_t)v17, (uint64_t)v14);
  char v16 = 0;
  uint64_t v9 = swift_allocObject();
  *(unsigned char *)(v9 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F38);
  swift_allocObject();
  uint64_t v10 = sub_2307F8810((uint64_t)sub_2307F8FB0, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  *((void *)&v15 + 1) = v10;
  long long v11 = v14[1];
  *(_OWORD *)a3 = v14[0];
  *(_OWORD *)(a3 + 16) = v11;
  *(unsigned char *)(a3 + 48) = v16;
  *(_OWORD *)(a3 + 32) = v15;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a2, v6);
  uint64_t v12 = sub_230812278();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
}

uint64_t sub_2307F8FA0()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

void sub_2307F8FB0(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t HardwarePlatform.isAppleSiliconSupportEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t HardwarePlatform.isRosettaAvailable.getter()
{
  sub_230812638();
  return v1;
}

uint64_t HardwarePlatform.isRunnable(_:)(void *a1)
{
  if (objc_msgSend(a1, sel_watchOnly)) {
    return 0;
  }
  if (objc_msgSend(a1, sel_supportsIPad)) {
    return 1;
  }
  return (uint64_t)objc_msgSend(a1, sel_supportsIPhone);
}

uint64_t sub_2307F9088()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_2307F9090()
{
  sub_230812638();
  return v1;
}

uint64_t sub_2307F90F0(void *a1)
{
  if (objc_msgSend(a1, sel_watchOnly)) {
    return 0;
  }
  if (objc_msgSend(a1, sel_supportsIPad)) {
    return 1;
  }
  return (uint64_t)objc_msgSend(a1, sel_supportsIPhone);
}

void sub_2307F9154(unsigned char *a1@<X8>)
{
}

uint64_t destroy for HardwarePlatform(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_release();
}

uint64_t initializeWithCopy for HardwarePlatform(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for HardwarePlatform(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for HardwarePlatform(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for HardwarePlatform(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HardwarePlatform(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HardwarePlatform()
{
  return &type metadata for HardwarePlatform;
}

void sub_2307F9378(unsigned char *a1@<X8>)
{
  int v2 = *(unsigned __int8 *)(v1 + 24);
  if (v2 == 2) {
    __break(1u);
  }
  else {
    *a1 = v2 & 1;
  }
}

unint64_t sub_2307F9394()
{
  unint64_t result = qword_26AF24BE8;
  if (!qword_26AF24BE8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF24BE8);
  }
  return result;
}

uint64_t sub_2307F93D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2307F941C(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2307F946C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2307F94A4()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2307F94E4()
{
  return sub_2307F8DA0(*(void *)(v0 + 16), *(void (**)(uint64_t *__return_ptr))(v0 + 24));
}

ValueMetadata *_s9InstalledVMa()
{
  return &_s9InstalledVN;
}

uint64_t sub_2307F9504(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v19 - v12;
  MEMORY[0x270FA5388](v11);
  long long v15 = (char *)&v19 - v14;
  sub_2307CE248(a2, (uint64_t)&v19 - v14);
  LODWORD(a2) = swift_getEnumCaseMultiPayload();
  sub_2307CE05C((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for State);
  if (a2 == 7)
  {
    sub_2307CE248(a1, (uint64_t)v13);
    unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload <= 8)
    {
      uint64_t v17 = 1;
      if (((1 << EnumCaseMultiPayload) & 0x12C) != 0)
      {
LABEL_10:
        sub_2307CE05C((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for State);
        return v17;
      }
      if (EnumCaseMultiPayload == 1)
      {
        sub_2307CE248((uint64_t)v13, (uint64_t)v7);
        if (*v7) {
          goto LABEL_10;
        }
      }
      else if (EnumCaseMultiPayload == 4)
      {
        sub_2307CE248((uint64_t)v13, (uint64_t)v10);
        sub_2307CE05C((uint64_t)v10, type metadata accessor for AppInstallation);
        goto LABEL_10;
      }
    }
    uint64_t v17 = 0;
    goto LABEL_10;
  }
  return 0;
}

ValueMetadata *_s10InstallingVMa()
{
  return &_s10InstallingVN;
}

uint64_t sub_2307F96F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AppInstallation(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v10 = type metadata accessor for State();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF248F0);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  char v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (uint64_t)&v16[*(int *)(v14 + 56)];
  sub_2307CE314(a1, (uint64_t)v16, (uint64_t (*)(void))type metadata accessor for State);
  sub_2307CE314(a2, v17, (uint64_t (*)(void))type metadata accessor for State);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 4)
  {
    if (EnumCaseMultiPayload == 8)
    {
      sub_2307FA514(v17, (uint64_t (*)(void))type metadata accessor for State);
      uint64_t v19 = (uint64_t)v16;
LABEL_9:
      sub_2307FA514(v19, (uint64_t (*)(void))type metadata accessor for State);
      char v20 = 1;
      return v20 & 1;
    }
LABEL_7:
    if (swift_getEnumCaseMultiPayload() != 4)
    {
      sub_2307CDF28((uint64_t)v16, &qword_26AF248F0);
      char v20 = 0;
      return v20 & 1;
    }
    sub_2307FA514(v17, type metadata accessor for AppInstallation);
    uint64_t v19 = (uint64_t)v16;
    goto LABEL_9;
  }
  sub_2307CE314((uint64_t)v16, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for State);
  if (swift_getEnumCaseMultiPayload() != 4)
  {
    sub_2307FA514((uint64_t)v12, type metadata accessor for AppInstallation);
    goto LABEL_7;
  }
  sub_2307FA574((uint64_t)v12, (uint64_t)v9, type metadata accessor for AppInstallation);
  sub_2307FA574(v17, (uint64_t)v7, type metadata accessor for AppInstallation);
  char v20 = sub_2307F9A0C((uint64_t)&v9[*(int *)(v4 + 20)], (uint64_t)&v7[*(int *)(v4 + 20)]);
  sub_2307FA514((uint64_t)v9, type metadata accessor for AppInstallation);
  sub_2307FA514((uint64_t)v7, type metadata accessor for AppInstallation);
  sub_2307FA514((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for State);
  return v20 & 1;
}

uint64_t sub_2307F9A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v86 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24630);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v83 = (uint64_t)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for AppInstallation.Phase(0);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v79 = (uint64_t)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v78 = (uint64_t)&v75 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v80 = (uint64_t)&v75 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v84 = (uint64_t)&v75 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v77 = (uint64_t)&v75 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v75 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v76 = (uint64_t)&v75 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v82 = (uint64_t)&v75 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v81 = (uint64_t)&v75 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v85 = (uint64_t)&v75 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v75 - v28;
  uint64_t v30 = MEMORY[0x270FA5388](v27);
  uint64_t v75 = (uint64_t)&v75 - v31;
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  uint64_t v34 = (char *)&v75 - v33;
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v37 = (char *)&v75 - v36;
  MEMORY[0x270FA5388](v35);
  int v39 = (char *)&v75 - v38;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF240E0);
  uint64_t v41 = MEMORY[0x270FA5388](v40 - 8);
  uint64_t v43 = (char *)&v75 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = (uint64_t)&v43[*(int *)(v41 + 56)];
  sub_2307CE314(v86, (uint64_t)v43, type metadata accessor for AppInstallation.Phase);
  sub_2307CE314(a2, v44, type metadata accessor for AppInstallation.Phase);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2307CE314((uint64_t)v43, (uint64_t)v29, type metadata accessor for AppInstallation.Phase);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload == 2)
      {
        sub_2307FA514(v44, type metadata accessor for AppInstallation.Progress);
        uint64_t v50 = (uint64_t)v29;
        goto LABEL_27;
      }
      if (EnumCaseMultiPayload == 1)
      {
        uint64_t v46 = (uint64_t)v29;
        goto LABEL_13;
      }
      uint64_t v62 = (uint64_t)v29;
      goto LABEL_30;
    case 2u:
      uint64_t v47 = v85;
      sub_2307CE314((uint64_t)v43, v85, type metadata accessor for AppInstallation.Phase);
      int v48 = swift_getEnumCaseMultiPayload();
      if (v48 != 3)
      {
        if (v48 == 2)
        {
          uint64_t v46 = v47;
          goto LABEL_13;
        }
        uint64_t v62 = v47;
LABEL_30:
        sub_2307FA514(v62, type metadata accessor for AppInstallation.Progress);
        goto LABEL_31;
      }
      uint64_t v57 = swift_projectBox();
      uint64_t v58 = v81;
      sub_2307CE314(v57, v81, type metadata accessor for AppInstallation.Phase);
      uint64_t v59 = v82;
      sub_2307CE314(v58, v82, type metadata accessor for AppInstallation.Phase);
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        sub_2307FA514(v58, type metadata accessor for AppInstallation.Phase);
        uint64_t v60 = swift_projectBox();
        uint64_t v61 = v83;
        sub_2307CE314(v60, v83, type metadata accessor for AppInstallation.Phase);
        sub_2307FA514(v61, type metadata accessor for AppInstallation.Phase);
        swift_release();
      }
      else
      {
        sub_2307FA514(v59, type metadata accessor for AppInstallation.Phase);
        uint64_t v74 = v76;
        sub_2307FA574(v58, v76, type metadata accessor for AppInstallation.Phase);
        if (swift_getEnumCaseMultiPayload() == 2)
        {
          sub_2307FA514(v74, type metadata accessor for AppInstallation.Progress);
          swift_release();
          uint64_t v50 = v47;
          goto LABEL_27;
        }
        sub_2307FA514(v74, type metadata accessor for AppInstallation.Phase);
      }
      swift_release();
      uint64_t v73 = v47;
      goto LABEL_45;
    case 3u:
      sub_2307CE314((uint64_t)v43, (uint64_t)v18, type metadata accessor for AppInstallation.Phase);
      uint64_t v51 = swift_projectBox();
      int v52 = swift_getEnumCaseMultiPayload();
      if (v52 == 3)
      {
        sub_2307CE314(v44, v84, type metadata accessor for AppInstallation.Phase);
        uint64_t v67 = swift_projectBox();
        uint64_t v68 = v51;
        uint64_t v69 = v78;
        sub_2307CE314(v68, v78, type metadata accessor for AppInstallation.Phase);
        uint64_t v70 = v67;
        uint64_t v71 = v79;
        sub_2307CE314(v70, v79, type metadata accessor for AppInstallation.Phase);
        char v64 = sub_2307F9A0C(v69, v71);
        sub_2307FA514(v71, type metadata accessor for AppInstallation.Phase);
        sub_2307FA514(v69, type metadata accessor for AppInstallation.Phase);
        swift_release();
        swift_release();
        sub_2307FA514(v44, type metadata accessor for AppInstallation.Phase);
        sub_2307FA514((uint64_t)v43, type metadata accessor for AppInstallation.Phase);
        return v64 & 1;
      }
      if (v52 == 2)
      {
        uint64_t v53 = v80;
        sub_2307CE314(v44, v80, type metadata accessor for AppInstallation.Phase);
        if (swift_getEnumCaseMultiPayload() != 2) {
          goto LABEL_18;
        }
LABEL_34:
        uint64_t v65 = v84;
        sub_2307CE314(v51, v84, type metadata accessor for AppInstallation.Phase);
        sub_2307FA514(v53, type metadata accessor for AppInstallation.Progress);
        sub_2307FA514(v65, type metadata accessor for AppInstallation.Progress);
        swift_release();
        goto LABEL_35;
      }
      if (v52) {
        goto LABEL_19;
      }
      uint64_t v53 = v77;
      sub_2307CE314(v44, v77, type metadata accessor for AppInstallation.Phase);
      if (!swift_getEnumCaseMultiPayload()) {
        goto LABEL_34;
      }
LABEL_18:
      sub_2307CDF28(v53, &qword_268703028);
LABEL_19:
      swift_release();
LABEL_31:
      sub_2307CDF28((uint64_t)v43, &qword_26AF240E0);
LABEL_32:
      char v64 = 0;
      return v64 & 1;
    case 4u:
      if (swift_getEnumCaseMultiPayload() != 4) {
        goto LABEL_31;
      }
      goto LABEL_28;
    default:
      sub_2307CE314((uint64_t)v43, (uint64_t)v39, type metadata accessor for AppInstallation.Phase);
      int v45 = swift_getEnumCaseMultiPayload();
      if (v45 == 3)
      {
        uint64_t v54 = swift_projectBox();
        sub_2307CE314(v54, (uint64_t)v37, type metadata accessor for AppInstallation.Phase);
        sub_2307CE314((uint64_t)v37, (uint64_t)v34, type metadata accessor for AppInstallation.Phase);
        if (swift_getEnumCaseMultiPayload() == 3)
        {
          sub_2307FA514((uint64_t)v37, type metadata accessor for AppInstallation.Phase);
          uint64_t v55 = swift_projectBox();
          uint64_t v56 = v83;
          sub_2307CE314(v55, v83, type metadata accessor for AppInstallation.Phase);
          sub_2307FA514(v56, type metadata accessor for AppInstallation.Phase);
          swift_release();
          swift_release();
          sub_2307FA514((uint64_t)v39, type metadata accessor for AppInstallation.Progress);
          sub_2307FA514((uint64_t)v43, type metadata accessor for AppInstallation.Phase);
          goto LABEL_32;
        }
        sub_2307FA514((uint64_t)v34, type metadata accessor for AppInstallation.Phase);
        uint64_t v72 = v75;
        sub_2307FA574((uint64_t)v37, v75, type metadata accessor for AppInstallation.Phase);
        if (swift_getEnumCaseMultiPayload())
        {
          sub_2307FA514(v72, type metadata accessor for AppInstallation.Phase);
          swift_release();
          uint64_t v73 = (uint64_t)v39;
LABEL_45:
          sub_2307FA514(v73, type metadata accessor for AppInstallation.Progress);
          sub_2307FA514((uint64_t)v43, type metadata accessor for AppInstallation.Phase);
          goto LABEL_32;
        }
        sub_2307FA514(v72, type metadata accessor for AppInstallation.Progress);
        swift_release();
        uint64_t v50 = (uint64_t)v39;
      }
      else
      {
        if (v45)
        {
          sub_2307FA514((uint64_t)v39, type metadata accessor for AppInstallation.Progress);
LABEL_35:
          sub_2307FA514(v44, type metadata accessor for AppInstallation.Phase);
          uint64_t v63 = (uint64_t)v43;
          goto LABEL_36;
        }
        uint64_t v46 = (uint64_t)v39;
LABEL_13:
        sub_2307FA514(v46, type metadata accessor for AppInstallation.Progress);
        uint64_t v50 = v44;
      }
LABEL_27:
      sub_2307FA514(v50, type metadata accessor for AppInstallation.Progress);
LABEL_28:
      uint64_t v63 = (uint64_t)v43;
LABEL_36:
      sub_2307FA514(v63, type metadata accessor for AppInstallation.Phase);
      char v64 = 1;
      return v64 & 1;
  }
}

uint64_t sub_2307FA514(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2307FA574(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *ManagedRestrictions.__allocating_init(accounts:)(uint64_t a1)
{
  sub_2307CDEC4(a1, (uint64_t)v6);
  uint64_t result = objc_msgSend(self, sel_sharedConnection);
  if (result)
  {
    uint64_t v3 = result;
    id v4 = objc_msgSend(self, sel_defaultCenter);
    swift_allocObject();
    uint64_t v5 = sub_2307FAE88(v6, v3, v4);

    __swift_destroy_boxed_opaque_existential_1(a1);
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t (*sub_2307FA6A0())()
{
  return sub_2307FB1FC;
}

uint64_t ManagedRestrictions.deinit()
{
  objc_msgSend(*(id *)(v0 + 64), sel_removeObserver_, v0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_release();
  return v0;
}

uint64_t ManagedRestrictions.__deallocating_deinit()
{
  objc_msgSend(*(id *)(v0 + 64), sel_removeObserver_, v0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_release();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t ManagedRestrictions.maxAppContentRating.getter()
{
  id v1 = objc_msgSend(*(id *)(v0 + 56), sel_effectiveValueForSetting_, *MEMORY[0x263F53970]);
  if (!v1) {
    return static Restrictions.defaultMaxAppContentRating.getter();
  }
  int v2 = v1;
  id v3 = objc_msgSend(v1, sel_integerValue);

  return (uint64_t)v3;
}

id ManagedRestrictions.isAppInstallationAllowed.getter()
{
  return objc_msgSend(*(id *)(v0 + 56), sel_isOnDeviceAppInstallationAllowed);
}

id ManagedRestrictions.isAppUninstallationAllowed.getter()
{
  return objc_msgSend(*(id *)(v0 + 56), sel_isAppRemovalAllowed);
}

uint64_t ManagedRestrictions.hasManagedAppleID.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  MEMORY[0x270FA5388](v1 - 8);
  id v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_230812318();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_2308121E8();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_2307DD6F8((uint64_t)v3);
    return 0;
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v5 + 32))(v7, v3, v4);
    swift_getKeyPath();
    sub_230812308();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    return v9[15];
  }
}

BOOL ManagedRestrictions.isAccountModificationRestricted.getter()
{
  return objc_msgSend(*(id *)(v0 + 56), sel_effectiveBoolValueForSetting_, *MEMORY[0x263F53710]) == 2;
}

uint64_t ManagedRestrictions.onRestrictionsChange.getter()
{
  return swift_retain();
}

uint64_t sub_2307FAA7C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = sub_230812178();
  MEMORY[0x270FA5388](v2 - 8);
  if (qword_26AF23D98 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2308123B8();
  __swift_project_value_buffer(v3, (uint64_t)qword_26AF25900);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  sub_230812138();
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  v5[3] = v1;
  v5[4] = &protocol witness table for ManagedRestrictions;
  v5[0] = v0;
  swift_retain();
  sub_2308120F8();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_2307FADA0()
{
  return ManagedRestrictions.maxAppContentRating.getter();
}

id sub_2307FADC4()
{
  return objc_msgSend(*(id *)(*(void *)v0 + 56), sel_isOnDeviceAppInstallationAllowed);
}

id sub_2307FADEC()
{
  return objc_msgSend(*(id *)(*(void *)v0 + 56), sel_isAppRemovalAllowed);
}

uint64_t sub_2307FAE18()
{
  return ManagedRestrictions.hasManagedAppleID.getter() & 1;
}

BOOL sub_2307FAE40()
{
  return objc_msgSend(*(id *)(*(void *)v0 + 56), sel_effectiveBoolValueForSetting_, *MEMORY[0x263F53710]) == 2;
}

uint64_t sub_2307FAE7C()
{
  return swift_retain();
}

void *sub_2307FAE88(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F88);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_2307CDEC4((uint64_t)a1, (uint64_t)(v4 + 2));
  v4[7] = a2;
  v4[8] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F78);
  swift_allocObject();
  id v12 = a2;
  id v13 = a3;
  v4[9] = sub_230812108();
  objc_msgSend(v13, sel_addObserver_selector_name_object_, v4, sel_effectiveSettingsChanged_, *MEMORY[0x263F536E0], v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2308121F8();
  swift_getObjectType();
  sub_2307FBF90();
  sub_2308121B8();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v4;
}

BOOL _s8AppState19ManagedRestrictionsC24isRunningInStoreDemoModeSbvg_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t v0 = (__CFString *)sub_230812438();
  uint64_t v1 = (__CFString *)sub_230812438();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v0, v1, &keyExistsAndHasValidFormat);

  if (AppBooleanValue) {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

char *keypath_get_selector_ams_isManagedAppleID()
{
  return sel_ams_isManagedAppleID;
}

id sub_2307FB178@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_ams_isManagedAppleID);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2307FB1AC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_ams_setManagedAppleID_, *a1);
}

uint64_t type metadata accessor for ManagedRestrictions()
{
  return self;
}

uint64_t method lookup function for ManagedRestrictions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ManagedRestrictions);
}

uint64_t sub_2307FB1FC()
{
  return sub_2307FAA7C();
}

ValueMetadata *_s8OpenableVMa()
{
  return &_s8OpenableVN;
}

uint64_t sub_2307FB264(uint64_t a1)
{
  return sub_2307CC9CC(a1, qword_26AF25900);
}

uint64_t sub_2307FB28C()
{
  uint64_t v0 = sub_230812218();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  BOOL v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_230812398();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2308123B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AF24B58 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v4, (uint64_t)qword_26AF25970);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
  sub_2308123A8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F50A10], v0);
  uint64_t v13 = sub_2308122A8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t result = sub_2308121D8();
  qword_26AF25930 = result;
  unk_26AF25938 = MEMORY[0x263F509E0];
  qword_26AF25918 = v13;
  return result;
}

uint64_t dispatch thunk of Platform.isAppleSiliconSupportEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Platform.isRosettaAvailable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Platform.isRunnable(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *_s9PurchasedVMa()
{
  return &_s9PurchasedVN;
}

uint64_t sub_2307FB5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF248F0);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for State();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v30 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v30 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v30 - v17;
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v21 = (unsigned __int8 *)&v30 - v20;
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v30 - v22;
  sub_2307CE248(a2, (uint64_t)&v30 - v22);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = v12;
    uint64_t v30 = v9;
    uint64_t v25 = (uint64_t)&v5[*(int *)(v3 + 48)];
    uint64_t v26 = v31;
    sub_2307CE248(v31, (uint64_t)v5);
    sub_2307CE248(a2, v25);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        sub_2307CE248((uint64_t)v5, (uint64_t)v21);
        if (*v21 < 2u) {
          goto LABEL_3;
        }
        goto LABEL_10;
      case 1u:
        sub_2307CE248((uint64_t)v5, (uint64_t)v18);
        if (*v18) {
          goto LABEL_10;
        }
        if (swift_getEnumCaseMultiPayload() != 1) {
          goto LABEL_10;
        }
        sub_2307CE248(v25, (uint64_t)v15);
        if (*v15 != 1) {
          goto LABEL_10;
        }
        goto LABEL_3;
      case 6u:
      case 8u:
        goto LABEL_3;
      default:
LABEL_10:
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_2307CE248(v25, (uint64_t)v24);
          if (*v24 == 1)
          {
            uint64_t v28 = (uint64_t)v30;
            void *v30 = 0;
            *(void *)(v28 + 8) = 0xE000000000000000;
            swift_storeEnumTagMultiPayload();
            char v29 = sub_2307F7DF8(v26, v28);
            sub_2307E286C(v28);
            if (v29)
            {
LABEL_3:
              sub_2307E286C(v25);
              sub_2307E286C((uint64_t)v5);
              return 1;
            }
          }
        }
        sub_2307FB8CC((uint64_t)v5);
        break;
    }
  }
  else
  {
    sub_2307E286C((uint64_t)v23);
  }
  return 0;
}

uint64_t sub_2307FB8CC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF248F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of PurchaseHistory.update(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2307C8818;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of PurchaseHistory.update(for:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2307CBA50;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of PurchaseHistory.fetchAllApps(of:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2307D9BAC;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of PurchaseHistory.fetchApps(of:withIDs:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 32) + **(int **)(a5 + 32));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_2307FBF8C;
  return v13(a1, a2, a3, a4, a5);
}

{
  uint64_t v5;
  void *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 + 40) + **(int **)(a5 + 40));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_2307FBF8C;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of PurchaseHistory.fetchAllApps(for:compatibleWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 48) + **(int **)(a4 + 48));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2307FBF8C;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_2307FBF90()
{
  return sub_2308121A8();
}

uint64_t *PurchaseHistoryAppStateDataSource.__allocating_init(accounts:platform:purchaseHistory:purchaseHistoryContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_2308123B8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_2307CDEC4(a1, (uint64_t)v21);
  sub_2307CDEC4(a2, (uint64_t)v20);
  sub_2307CDEC4(a3, (uint64_t)v19);
  id v12 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26AF24B40 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v8, (uint64_t)qword_26AF259B0);
  uint64_t v14 = (uint64_t *)swift_allocObject();
  sub_2307FC19C((uint64_t)v21, (uint64_t)v18);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(v11, v13, v8);
  uint64_t v15 = sub_230802BA0((uint64_t)v18, (uint64_t)v20, (uint64_t)v19, a4, v12, (uint64_t)v11, v14);

  sub_230802F00((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v15;
}

uint64_t sub_2307FC19C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t *PurchaseHistoryAppStateDataSource.__allocating_init(family:platform:purchaseHistory:purchaseHistoryContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_2307CDEC4(a1, (uint64_t)v20);
  sub_2307CDEC4(a2, (uint64_t)v19);
  sub_2307CDEC4(a3, (uint64_t)v18);
  id v10 = objc_msgSend(self, sel_defaultCenter);
  if (qword_26AF24B40 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_2308123B8();
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_26AF259B0);
  uint64_t v13 = v21;
  uint64_t v14 = v22;
  uint64_t v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  uint64_t v16 = sub_230803330(v15, (uint64_t)v19, (uint64_t)v18, a4, v10, v12, v5, v13, v11, v14, MEMORY[0x263F50E40]);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v16;
}

uint64_t sub_2307FC34C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2308120E8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v10, v7);
  int v11 = *MEMORY[0x263F507C0];
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (a1 == v11)
  {
    uint64_t v13 = sub_230812588();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
    uint64_t v14 = (void *)swift_allocObject();
    _OWORD v14[2] = 0;
    void v14[3] = 0;
    void v14[4] = a2;
    swift_retain();
    sub_2307FFC0C((uint64_t)v6, (uint64_t)&unk_2687030E0, (uint64_t)v14);
    return swift_release();
  }
  return result;
}

uint64_t (*sub_2307FC544())(uint64_t a1)
{
  return sub_230803784;
}

uint64_t PurchaseHistoryAppStateDataSource.deinit()
{
  objc_msgSend(*(id *)(v0 + 144), sel_removeObserver_, v0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  swift_release();
  swift_release();
  return v0;
}

uint64_t PurchaseHistoryAppStateDataSource.__deallocating_deinit()
{
  PurchaseHistoryAppStateDataSource.deinit();
  return MEMORY[0x270FA0228](v0, 232, 7);
}

uint64_t PurchaseHistoryAppStateDataSource.description.getter()
{
  return 0;
}

BOOL PurchaseHistoryAppStateDataSource.isIncremental.getter()
{
  return *(void *)(v0 + 136) != 1;
}

uint64_t PurchaseHistoryAppStateDataSource.onSynchronizeAppStates.getter()
{
  return swift_retain();
}

uint64_t PurchaseHistoryAppStateDataSource.load()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2307FC73C, 0, 0);
}

uint64_t sub_2307FC73C()
{
  if (*(void *)(v0[2] + 136) == 1)
  {
    uint64_t v1 = (void *)swift_task_alloc();
    v0[3] = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_2307FC814;
    return sub_2307FCC90();
  }
  else
  {
    sub_2307FCA4C();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
}

uint64_t sub_2307FC814()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2307FC958;
  return sub_2307FD424(1);
}

uint64_t sub_2307FC958()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2307FCA4C()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_230812588();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_2307CDF28((uint64_t)v4, &qword_26AF24BC0);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_230812578();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_230812538();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_2687030C8;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    _OWORD v14[2] = v9;
    void v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2307FCC90()
{
  v1[18] = v0;
  v1[19] = *v0;
  sub_230812178();
  v1[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307FCD48, 0, 0);
}

uint64_t sub_2307FCD48()
{
  uint64_t v13 = v0;
  uint64_t v1 = v0[18];
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 216);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = sub_230803638;
  *(void *)(v3 + 24) = v1;
  os_unfair_lock_lock(v2 + 4);
  sub_230803658(v12);
  os_unfair_lock_unlock(v2 + 4);
  LOBYTE(v1) = v12[0];
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = (void *)v0[18];
    uint64_t v5 = v4[15];
    uint64_t v6 = v4[16];
    __swift_project_boxed_opaque_existential_1(v4 + 12, v5);
    uint64_t v7 = v4[17];
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 + 8) + **(int **)(v6 + 8));
    int v8 = (void *)swift_task_alloc();
    v0[21] = v8;
    *int v8 = v0;
    v8[1] = sub_2307FCF24;
    return v11(v7, v5, v6);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

uint64_t sub_2307FCF24()
{
  *(void *)(*(void *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2307FD1E0;
  }
  else {
    uint64_t v2 = sub_2307FD038;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307FD038()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[18];
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 176), *(void *)(v2 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  v0[13] = v1;
  v0[10] = v2;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v0 + 10), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_2307FD1E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 6;
  uint64_t v3 = (void *)v0[22];
  uint64_t v4 = v0[19];
  uint64_t v5 = v1[18];
  __swift_project_boxed_opaque_existential_1((void *)(v5 + 176), *(void *)(v5 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  v1[5] = v4;
  v1[2] = v5;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 2), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v6 = v1[14];
  uint64_t v7 = v1[15];
  v1[9] = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_0, v6, v7);
  sub_230812128();
  sub_2307CDF28((uint64_t)v2, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v1[1];
  return v9();
}

uint64_t sub_2307FD424(char a1)
{
  *(void *)(v2 + 160) = v1;
  *(unsigned char *)(v2 + 256) = a1;
  *(void *)(v2 + 168) = *v1;
  sub_230812178();
  *(void *)(v2 + 176) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307FD4E0, 0, 0);
}

uint64_t sub_2307FD4E0()
{
  uint64_t v1 = *(void **)(v0 + 160);
  sub_2307CDEC4((uint64_t)(v1 + 12), v0 + 16);
  long long v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v0 + 184) = v2;
  *(void *)(v0 + 200) = __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
  uint64_t v3 = v1 + 2;
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  int v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v5 + 16) + **(int **)(v5 + 16));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2307FD60C;
  return v8(v4, v5);
}

uint64_t sub_2307FD60C(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  uint64_t v5 = (void *)*v2;
  v4[27] = a1;
  v4[28] = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](sub_2307FDA6C, 0, 0);
  }
  else
  {
    uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4[24] + 48)
                                                                     + **(int **)(v4[24] + 48));
    uint64_t v6 = v4[20] + 56;
    uint64_t v7 = (void *)swift_task_alloc();
    v4[29] = v7;
    void *v7 = v5;
    v7[1] = sub_2307FD7FC;
    uint64_t v8 = v4[24];
    uint64_t v9 = v4[23];
    return v11(a1, v6, v9, v8);
  }
}

uint64_t sub_2307FD7FC(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 240) = a1;
  *(void *)(v3 + 248) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_2307FDCC4;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_2307FD918;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_2307FD918()
{
  uint64_t v13 = v0;
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 168);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v5 = *(os_unfair_lock_s **)(v4 + 216);
  uint64_t v6 = (void *)swift_task_alloc();
  id v6[2] = v4;
  v6[3] = v1;
  v6[4] = 0;
  void v6[5] = v3;
  uint64_t v7 = swift_task_alloc();
  *(void *)(v7 + 16) = sub_2308038BC;
  *(void *)(v7 + 24) = v6;
  os_unfair_lock_lock(v5 + 4);
  sub_2307CBE28(&v12);
  os_unfair_lock_unlock(v5 + 4);
  if (v2)
  {
    return swift_task_dealloc();
  }
  else
  {
    char v9 = *(unsigned char *)(v0 + 256);
    uint64_t v10 = v12;
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    if (v9)
    {
      *(void *)(v0 + 152) = v10;
      sub_2308123E8();
    }
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
}

uint64_t sub_2307FDA6C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0 + 11;
  uint64_t v4 = v0[21];
  uint64_t v5 = v1[20];
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_project_boxed_opaque_existential_1((void *)(v5 + 176), *(void *)(v5 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  v1[10] = v4;
  v1[7] = v5;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 7), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v6 = v1[15];
  uint64_t v7 = v1[16];
  v1[14] = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_0, v6, v7);
  sub_230812128();
  sub_2307CDF28((uint64_t)v3, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  char v9 = (uint64_t (*)(void))v1[1];
  return v9();
}

uint64_t sub_2307FDCC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0 + 11;
  swift_bridgeObjectRelease();
  uint64_t v4 = v0[21];
  uint64_t v5 = v1[20];
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_project_boxed_opaque_existential_1((void *)(v5 + 176), *(void *)(v5 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  v1[10] = v4;
  v1[7] = v5;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 7), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v6 = v1[15];
  uint64_t v7 = v1[16];
  v1[14] = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_0, v6, v7);
  sub_230812128();
  sub_2307CDF28((uint64_t)v3, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  char v9 = (uint64_t (*)(void))v1[1];
  return v9();
}

uint64_t PurchaseHistoryAppStateDataSource.reloadState(forAppsWith:synchronizing:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 48) = a2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 32) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_2307FDFBC;
  return sub_2307FCC90();
}

uint64_t sub_2307FDFBC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 40) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2307FE118;
  char v4 = *(unsigned char *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 16);
  return sub_2307FE20C(v5, v4);
}

uint64_t sub_2307FE118()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2307FE20C(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 304) = a2;
  *(void *)(v3 + 192) = a1;
  *(void *)(v3 + 200) = v2;
  *(void *)(v3 + 208) = *v2;
  sub_230812178();
  *(void *)(v3 + 216) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307FE2C8, 0, 0);
}

uint64_t sub_2307FE2C8()
{
  uint64_t v1 = *(void **)(v0 + 200);
  sub_2307CDEC4((uint64_t)(v1 + 12), v0 + 16);
  long long v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v0 + 224) = v2;
  *(void *)(v0 + 240) = __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
  uint64_t v3 = v1 + 2;
  uint64_t v4 = v1[5];
  uint64_t v5 = v1[6];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v5 + 16) + **(int **)(v5 + 16));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_2307FE3F4;
  return v8(v4, v5);
}

uint64_t sub_2307FE3F4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 256) = a1;
  *(void *)(v3 + 264) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_2307FE8B0;
  }
  else {
    uint64_t v4 = sub_2307FE508;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_2307FE508()
{
  uint64_t v10 = v0[29];
  uint64_t v1 = v0[25];
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_230801FD0(v2);
  v0[34] = v3;
  swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 40)
                                                                            + **(int **)(v10 + 40));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[35] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2307FE630;
  uint64_t v5 = v0[32];
  uint64_t v6 = v0[29];
  uint64_t v7 = v0[28];
  return v9(v5, v3, v1 + 56, v7, v6);
}

uint64_t sub_2307FE630(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 288) = a1;
  *(void *)(v3 + 296) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_2307FEB54;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_2307FE758;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_2307FE758()
{
  uint64_t v14 = v0;
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v2 = *(void *)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v5 = *(void *)(v0 + 192);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v6 = *(os_unfair_lock_s **)(v4 + 216);
  uint64_t v7 = (void *)swift_task_alloc();
  v7[2] = v4;
  v7[3] = v1;
  v7[4] = v5;
  v7[5] = v3;
  uint64_t v8 = swift_task_alloc();
  *(void *)(v8 + 16) = sub_230803608;
  *(void *)(v8 + 24) = v7;
  os_unfair_lock_lock(v6 + 4);
  sub_2307CBE28(&v13);
  os_unfair_lock_unlock(v6 + 4);
  if (v2)
  {
    return swift_task_dealloc();
  }
  else
  {
    char v10 = *(unsigned char *)(v0 + 304);
    uint64_t v11 = v13;
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    if (v10)
    {
      *(void *)(v0 + 184) = v11;
      sub_2308123E8();
    }
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
}

uint64_t sub_2307FE8B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0 + 15;
  uint64_t v4 = v0[26];
  uint64_t v6 = v1[24];
  uint64_t v5 = v1[25];
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_project_boxed_opaque_existential_1((void *)(v5 + 176), *(void *)(v5 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  v1[10] = v4;
  v1[7] = v5;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 7), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  v1[14] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BD0);
  v1[11] = v6;
  swift_bridgeObjectRetain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 11), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v7 = v1[19];
  uint64_t v8 = v1[20];
  v1[18] = v8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_0, v7, v8);
  sub_230812128();
  sub_2307CDF28((uint64_t)v3, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  char v10 = (uint64_t (*)(void))v1[1];
  return v10();
}

uint64_t sub_2307FEB54()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)(v0 + 2);
  uint64_t v3 = v0 + 15;
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = v0[26];
  uint64_t v5 = v1[24];
  uint64_t v6 = v1[25];
  __swift_destroy_boxed_opaque_existential_1(v2);
  __swift_project_boxed_opaque_existential_1((void *)(v6 + 176), *(void *)(v6 + 200));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  v1[10] = v4;
  v1[7] = v6;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 7), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  v1[14] = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BD0);
  v1[11] = v5;
  swift_bridgeObjectRetain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 11), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v7 = v1[19];
  uint64_t v8 = v1[20];
  v1[18] = v8;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v3);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(boxed_opaque_existential_0, v7, v8);
  sub_230812128();
  sub_2307CDF28((uint64_t)v3, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();
  swift_bridgeObjectRelease();
  swift_willThrow();
  swift_task_dealloc();
  char v10 = (uint64_t (*)(void))v1[1];
  return v10();
}

uint64_t PurchaseHistoryAppStateDataSource.reloadAllStates(synchronizing:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 40) = a1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2307FEEA4;
  return sub_2307FCC90();
}

uint64_t sub_2307FEEA4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 32) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2307FC958;
  char v4 = *(unsigned char *)(v1 + 40);
  return sub_2307FD424(v4);
}

void PurchaseHistoryAppStateDataSource.state(forAppWith:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 216) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDF4(v2);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_2307FF064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  swift_beginAccess();
  uint64_t v6 = *(void *)(a1 + 152);
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_2307CF3B0(a2), (v8 & 1) != 0))
  {
    unint64_t v9 = v7;
    uint64_t v10 = *(void *)(v6 + 56);
    uint64_t v11 = type metadata accessor for State();
    uint64_t v12 = *(void *)(v11 - 8);
    sub_2307CE248(v10 + *(void *)(v12 + 72) * v9, a3);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a3, 0, 1, v11);
  }
  else
  {
    uint64_t v13 = type metadata accessor for State();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(a3, 1, 1, v13);
  }
  return swift_endAccess();
}

BOOL PurchaseHistoryAppStateDataSource.providesState(forApp:)(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 8) & 1) == 0;
}

uint64_t sub_2307FF1B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  MEMORY[0x270FA5388](v2 - 8);
  char v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_230812588();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  unint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_2307CDF28((uint64_t)v4, &qword_26AF24BC0);
  }
  else
  {
    sub_230812578();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_230812538();
      uint64_t v11 = v10;
      swift_unknownObjectRelease();
      if (v11 | v9)
      {
        v13[0] = 0;
        v13[1] = 0;
        v13[2] = v9;
        void v13[3] = v11;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2307FF3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2307FF400, 0, 0);
}

uint64_t sub_2307FF400()
{
  uint64_t v9 = v0;
  uint64_t v1 = v0[2];
  if (*(void *)(v1 + 136) == 1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[3] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_2307C7E08;
    return sub_2307FD424(1);
  }
  else
  {
    uint64_t v4 = *(os_unfair_lock_s **)(v1 + 216);
    uint64_t v5 = swift_task_alloc();
    *(void *)(v5 + 16) = sub_2308035EC;
    *(void *)(v5 + 24) = v1;
    os_unfair_lock_lock(v4 + 4);
    sub_2307CBE28(&v8);
    os_unfair_lock_unlock(v4 + 4);
    uint64_t v6 = v8;
    v0[4] = v8;
    swift_task_dealloc();
    unint64_t v7 = (void *)swift_task_alloc();
    v0[5] = v7;
    void *v7 = v0;
    v7[1] = sub_2307FF5A0;
    return sub_2307FE20C(v6, 1);
  }
}

uint64_t sub_2307FF5A0()
{
  *(void *)(*(void *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2307FF718;
  }
  else {
    uint64_t v2 = sub_2307FF6B4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307FF6B4()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307FF718()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307FF77C()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](sub_2307FF79C, 0, 0);
}

uint64_t sub_2307FF79C()
{
  uint64_t v9 = v0;
  uint64_t v1 = v0[2];
  if (*(void *)(v1 + 136) == 1)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[6] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_2307FFAB4;
    return sub_2307FD424(1);
  }
  else
  {
    uint64_t v4 = *(os_unfair_lock_s **)(v1 + 216);
    uint64_t v5 = swift_task_alloc();
    *(void *)(v5 + 16) = sub_2308035EC;
    *(void *)(v5 + 24) = v1;
    os_unfair_lock_lock(v4 + 4);
    sub_2307CBE28(&v8);
    os_unfair_lock_unlock(v4 + 4);
    uint64_t v6 = v8;
    v0[3] = v8;
    swift_task_dealloc();
    unint64_t v7 = (void *)swift_task_alloc();
    v0[4] = v7;
    void *v7 = v0;
    v7[1] = sub_2307FF93C;
    return sub_2307FE20C(v6, 1);
  }
}

uint64_t sub_2307FF93C()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2307FFBA8;
  }
  else {
    uint64_t v2 = sub_2307FFA50;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2307FFA50()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307FFAB4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2307FFBA8()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2307FFC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_230812588();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_230812578();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_2307CDF28(a1, &qword_26AF24BC0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_230812538();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2307FFE80(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v4[26] = a4;
  v4[27] = *a4;
  sub_230812178();
  v4[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  v4[29] = swift_task_alloc();
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2307FFF84, 0, 0);
}

uint64_t sub_2307FFF84()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v3 = *(void **)(v0 + 208);
  uint64_t v4 = v3[5];
  uint64_t v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  sub_2308121E8();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_2307D5154(v2, v1, &qword_26AF23F98);
  uint64_t v6 = sub_230812318();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(v1, 1, v6);
  uint64_t v10 = *(void *)(v0 + 240);
  if (v9 == 1)
  {
    sub_2307CDF28(*(void *)(v0 + 240), &qword_26AF23F98);
LABEL_7:
    uint64_t v17 = *(void *)(v0 + 208);
    if (*(unsigned char *)(v17 + 168)) {
      goto LABEL_8;
    }
    uint64_t v34 = v8;
    uint64_t v31 = (uint64_t *)(v17 + 160);
    uint64_t v32 = (unsigned char *)(v17 + 168);
    goto LABEL_12;
  }
  swift_getKeyPath();
  sub_230812308();
  swift_release();
  uint64_t v11 = *(void **)(v0 + 200);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = *(void *)(v0 + 208);
  id v13 = objc_msgSend(v11, sel_longLongValue);

  uint64_t v16 = *(void **)(v12 + 160);
  uint64_t v15 = v12 + 160;
  id v14 = v16;
  if ((*(unsigned char *)(v15 + 8) & 1) == 0 && v13 == v14)
  {
LABEL_8:
    sub_2307CDF28(*(void *)(v0 + 248), &qword_26AF23F98);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
    return v18();
  }
  uint64_t v34 = v8;
  uint64_t v31 = (uint64_t *)v15;
  uint64_t v32 = (unsigned char *)(v15 + 8);
  uint64_t v17 = *(void *)(v0 + 208);
LABEL_12:
  uint64_t v33 = *(void *)(v0 + 248);
  uint64_t v20 = *(void *)(v0 + 232);
  uint64_t v21 = *(void *)(v0 + 216);
  sub_2307CDEC4(v17 + 176, v0 + 56);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 56), *(void *)(v0 + 80));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  *(void *)(v0 + 120) = v21;
  *(void *)(v0 + 96) = v17;
  swift_retain();
  sub_230812128();
  sub_2307CDF28(v0 + 96, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_2307D5154(v33, v20, &qword_26AF23F98);
  int v22 = v34(v20, 1, v6);
  uint64_t v23 = *(void *)(v0 + 232);
  if (v22 == 1)
  {
    sub_2307CDF28(*(void *)(v0 + 232), &qword_26AF23F98);
    uint64_t v24 = v0 + 56;
    uint64_t v25 = v32;
LABEL_16:
    uint64_t v28 = v0 + 128;
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
    goto LABEL_17;
  }
  swift_getKeyPath();
  sub_230812308();
  swift_release();
  uint64_t v26 = *(void **)(v0 + 192);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v23, v6);
  uint64_t v24 = v0 + 56;
  uint64_t v25 = v32;
  if (!v26) {
    goto LABEL_16;
  }
  id v27 = objc_msgSend(v26, sel_longLongValue);

  *(void *)(v0 + 152) = MEMORY[0x263F8E5C0];
  *(void *)(v0 + 128) = v27;
  uint64_t v28 = v0 + 128;
LABEL_17:
  sub_230812148();
  sub_2307CDF28(v28, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  if (*v25 == 1)
  {
    *(_OWORD *)(v0 + 160) = 0u;
    *(_OWORD *)(v0 + 176) = 0u;
  }
  else
  {
    uint64_t v29 = *v31;
    *(void *)(v0 + 184) = MEMORY[0x263F8E5C0];
    *(void *)(v0 + 160) = v29;
  }
  sub_230812148();
  sub_2307CDF28(v0 + 160, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v24);
  uint64_t v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v30;
  void *v30 = v0;
  v30[1] = sub_23080054C;
  v30[2] = *(void *)(v0 + 208);
  return MEMORY[0x270FA2498](sub_2307FF79C, 0, 0);
}

uint64_t sub_23080054C()
{
  *(void *)(*(void *)v1 + 264) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_2308006FC;
  }
  else {
    uint64_t v2 = sub_230800660;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_230800660()
{
  sub_2307CDF28(*(void *)(v0 + 248), &qword_26AF23F98);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2308006FC()
{
  sub_2307CDF28(*(void *)(v0 + 248), &qword_26AF23F98);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_230800798()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2307CBA50;
  return sub_2307FCC90();
}

uint64_t sub_230800828@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t result = sub_2307D7D9C(v2);
  *a1 = result;
  return result;
}

void sub_230800888(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v11 = (void *)MEMORY[0x230FBF6E0]();
  sub_230800920(a1, a2, a3, a4, (uint64_t)&v12);
  if (v5) {
    __break(1u);
  }
  else {
    *a5 = v12;
  }
}

uint64_t sub_230800920@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v133 = a4;
  uint64_t v134 = a3;
  unint64_t v157 = a2;
  uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24878);
  MEMORY[0x270FA5388](v142);
  uint64_t v8 = (uint64_t *)((char *)&v129 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v9 = type metadata accessor for State();
  uint64_t v164 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v135 = (uint64_t)&v129 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v165 = (uint64_t)&v129 - v12;
  uint64_t v13 = sub_230812178();
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  unint64_t v144 = (char *)&v129 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v136 = (char *)&v129 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v139 = (uint64_t *)((char *)&v129 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v138 = (uint64_t)&v129 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v137 = (uint64_t)&v129 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v150 = (uint64_t)&v129 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v149 = (uint64_t)&v129 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v155 = (uint64_t)&v129 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v170 = (uint64_t)&v129 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v168 = (uint64_t)&v129 - v32;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  MEMORY[0x270FA5388](v33 - 8);
  uint64_t v35 = (char *)&v129 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v182 = MEMORY[0x263F8EE88];
  uint64_t v36 = a1[5];
  uint64_t v37 = a1[6];
  uint64_t v145 = a1;
  __swift_project_boxed_opaque_existential_1(a1 + 2, v36);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v37 + 8))(v179, v36, v37);
  __swift_project_boxed_opaque_existential_1(v179, v180);
  sub_2308121E8();
  uint64_t v38 = sub_230812318();
  uint64_t v39 = *(void *)(v38 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v35, 1, v38) == 1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    sub_2307CDF28((uint64_t)v35, &qword_26AF23F98);
LABEL_45:
    uint64_t v100 = v145;
    swift_beginAccess();
    uint64_t v101 = swift_bridgeObjectRetain();
    sub_2308047EC(v101);
    v100[19] = MEMORY[0x263F8EE80];
    uint64_t result = swift_bridgeObjectRelease();
    v100[20] = 0;
    *((unsigned char *)v100 + 168) = 1;
    *(void *)a5 = v182;
    return result;
  }
  swift_getKeyPath();
  sub_230812308();
  swift_release();
  uint64_t v40 = (void *)v175;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v35, v38);
  if (!v40)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
    goto LABEL_45;
  }
  id v41 = objc_msgSend(v40, sel_longLongValue);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v179);
  uint64_t v42 = v145;
  if ((v145[21] & 1) != 0 || v41 != (id)v145[20])
  {
    swift_beginAccess();
    uint64_t v43 = swift_bridgeObjectRetain();
    sub_2308047EC(v43);
    v145[19] = MEMORY[0x263F8EE80];
    swift_bridgeObjectRelease();
    uint64_t v42 = v145;
    v145[20] = v41;
    *((unsigned char *)v42 + 168) = 0;
  }
  id v152 = v41;
  v181 = (unsigned int (*)(uint64_t, uint64_t, unint64_t))MEMORY[0x263F8EE88];
  uint64_t v44 = v157;
  unint64_t v130 = v157 >> 62;
  if (v157 >> 62)
  {
LABEL_91:
    swift_bridgeObjectRetain();
    uint64_t result = sub_230812808();
    uint64_t v42 = v145;
    uint64_t v45 = result;
  }
  else
  {
    uint64_t v45 = *(void *)((v157 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v131 = (void *)a5;
  unint64_t v169 = v9;
  if (v45)
  {
    if (v45 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v47 = 0;
    uint64_t v151 = v42 + 7;
    long long v158 = v42 + 19;
    unint64_t v160 = v44 & 0xC000000000000001;
    v161 = v42 + 22;
    v167 = (unsigned int (**)(uint64_t, uint64_t, unint64_t))(v164 + 48);
    uint64_t v154 = (void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(v164 + 56);
    unint64_t v141 = 0x8000000230815450;
    long long v159 = xmmword_230813840;
    unint64_t v140 = 0x80000002308154A0;
    uint64_t v146 = v8;
    uint64_t v162 = v45;
    while (1)
    {
      int v48 = v160 ? (uint64_t *)MEMORY[0x230FBF430](v47, v44) : (uint64_t *)*(id *)(v44 + 8 * v47 + 32);
      uint64_t v8 = v48;
      uint64_t v49 = (uint64_t)objc_msgSend(v48, sel_storeItemID);
      sub_2307CDEC4((uint64_t)v161, (uint64_t)v179);
      if ((v49 & 0x8000000000000000) == 0) {
        break;
      }
      unint64_t v175 = 0;
      unint64_t v176 = 0xE000000000000000;
      sub_230812758();
      swift_bridgeObjectRelease();
      unint64_t v175 = 0xD00000000000001DLL;
      unint64_t v176 = v141;
      v173[0] = v49;
      uint64_t v57 = MEMORY[0x263F8E5C0];
      sub_230812868();
      sub_230812478();
      swift_bridgeObjectRelease();
      unint64_t v58 = v175;
      unint64_t v59 = v176;
      sub_2307DAC7C();
      uint64_t v60 = swift_allocError();
      unint64_t *v61 = v58;
      v61[1] = v59;
      swift_willThrow();
      sub_2307CDEC4((uint64_t)v179, (uint64_t)&v175);
      v163 = v177;
      id v166 = v178;
      unint64_t v156 = (unint64_t)__swift_project_boxed_opaque_existential_1(&v175, (uint64_t)v177);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
      uint64_t v62 = *(void *)(sub_230812198() - 8);
      unint64_t v63 = (*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
      uint64_t v64 = swift_allocObject();
      *(_OWORD *)(v64 + 16) = v159;
      unint64_t v153 = v64 + v63;
      sub_230812168();
      sub_230812158();
      uint64_t v174 = v57;
      v173[0] = v49;
      sub_230812128();
      sub_2307CDF28((uint64_t)v173, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      swift_getErrorValue();
      uint64_t v65 = v171;
      uint64_t v66 = v172;
      uint64_t v174 = v172;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v173);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v66 - 8) + 16))(boxed_opaque_existential_0, v65, v66);
      sub_230812128();
      sub_2307CDF28((uint64_t)v173, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      sub_230812188();
      sub_2308122D8();
      unint64_t v9 = v169;
      swift_bridgeObjectRelease();
      uint64_t v68 = (void *)v60;
      uint64_t v44 = v157;

      sub_2307D5428((uint64_t)v179);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v175);

      unint64_t v153 = 0;
LABEL_13:
      if (v162 == ++v47)
      {
        swift_bridgeObjectRelease();
        uint64_t v99 = v181;
        goto LABEL_47;
      }
    }
    sub_2307D5428((uint64_t)v179);
    sub_2307D51B8(v179, v49);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24040);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v159;
    *(void *)(inited + 32) = v152;
    uint64_t v51 = sub_23080E5E4(inited);
    swift_setDeallocating();
    sub_2307CDEC4((uint64_t)v151, (uint64_t)v179);
    int v52 = v8;
    uint64_t v53 = v170;
    id v166 = v52;
    sub_2307E47E4(v52, v51, v179, v170);
    uint64_t v54 = v53;
    uint64_t v55 = v155;
    sub_2307D5154(v54, v155, &qword_26AF24868);
    uint64_t v56 = *v167;
    if ((*v167)(v55, 1, v9) == 1)
    {
      sub_2307CDF28(v55, &qword_26AF24868);
      uint64_t v8 = v158;
      goto LABEL_35;
    }
    sub_2307CE37C(v55, v165);
    uint64_t v69 = v158;
    swift_beginAccess();
    uint64_t v70 = *v69;
    uint64_t v71 = *(void *)(v70 + 16);
    unint64_t v156 = (unint64_t)v154 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v72 = v149;
    uint64_t v147 = v47;
    uint64_t v148 = v49;
    v163 = v56;
    if (v71)
    {
      unint64_t v73 = sub_2307CF3B0(v49);
      uint64_t v74 = v150;
      if (v75)
      {
        uint64_t v76 = *(void *)(v70 + 56);
        uint64_t v77 = v164;
        sub_2307CE248(v76 + *(void *)(v164 + 72) * v73, v72);
        uint64_t v78 = *(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(v77 + 56);
        v78(v72, 0, 1, v9);
      }
      else
      {
        uint64_t v78 = *v154;
        (*v154)(v72, 1, 1, v9);
      }
    }
    else
    {
      uint64_t v78 = *v154;
      (*v154)(v149, 1, 1, v9);
      uint64_t v74 = v150;
    }
    uint64_t v79 = v72;
    swift_endAccess();
    sub_2307CE248(v165, v74);
    uint64_t v143 = v78;
    v78(v74, 0, 1, v9);
    uint64_t v80 = (uint64_t)v146;
    uint64_t v81 = (uint64_t)v146 + *(int *)(v142 + 48);
    sub_2307D5154(v79, (uint64_t)v146, &qword_26AF24868);
    sub_2307D5154(v74, v81, &qword_26AF24868);
    uint64_t v56 = v163;
    if (v163(v80, 1, v9) == 1)
    {
      sub_2307CDF28(v74, &qword_26AF24868);
      sub_2307CDF28(v79, &qword_26AF24868);
      unsigned int v82 = v56(v81, 1, v9);
      uint64_t v47 = v147;
      if (v82 == 1)
      {
        sub_2307CDF28((uint64_t)v146, &qword_26AF24868);
        uint64_t v8 = v158;
LABEL_34:
        sub_2307E286C(v165);
        uint64_t v44 = v157;
        uint64_t v49 = v148;
LABEL_35:
        if (v56(v170, 1, v9) == 1)
        {
          v163 = v56;
          swift_beginAccess();
          unint64_t v90 = sub_2307CF3B0(v49);
          if (v91)
          {
            unint64_t v92 = v90;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v94 = *v8;
            unint64_t v175 = *v8;
            *uint64_t v8 = 0x8000000000000000;
            uint64_t v95 = v8;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_230810E88();
              uint64_t v94 = v175;
            }
            uint64_t v8 = v139;
            sub_2307CE37C(*(void *)(v94 + 56) + *(void *)(v164 + 72) * v92, (uint64_t)v139);
            sub_2308108D0(v92, v94);
            uint64_t *v95 = v94;
            swift_bridgeObjectRelease();
            uint64_t v96 = (uint64_t)v8;
            uint64_t v97 = 0;
            unint64_t v9 = v169;
          }
          else
          {
            uint64_t v97 = 1;
            uint64_t v96 = (uint64_t)v139;
          }
          (*v154)(v96, v97, 1, v9);
          swift_endAccess();
          unsigned int v98 = v163(v96, 1, v9);
          sub_2307CDF28(v96, &qword_26AF24868);
          if (v98 != 1) {
            sub_2307D51B8(v179, v49);
          }
        }

        sub_2307CDF28(v170, &qword_26AF24868);
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v83 = v137;
      sub_2307D5154(v80, v137, &qword_26AF24868);
      unsigned int v84 = v56(v81, 1, v9);
      uint64_t v47 = v147;
      if (v84 != 1)
      {
        uint64_t v88 = v81;
        uint64_t v89 = v135;
        sub_2307CE37C(v88, v135);
        int v132 = _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v83, v89);
        sub_2307E286C(v89);
        sub_2307CDF28(v150, &qword_26AF24868);
        sub_2307CDF28(v149, &qword_26AF24868);
        sub_2307E286C(v83);
        sub_2307CDF28(v80, &qword_26AF24868);
        unint64_t v9 = v169;
        uint64_t v8 = v158;
        if (v132) {
          goto LABEL_34;
        }
        goto LABEL_32;
      }
      sub_2307CDF28(v150, &qword_26AF24868);
      sub_2307CDF28(v149, &qword_26AF24868);
      sub_2307E286C(v83);
      unint64_t v9 = v169;
    }
    sub_2307CDF28((uint64_t)v146, &qword_26AF24878);
    uint64_t v8 = v158;
LABEL_32:
    uint64_t v85 = v165;
    uint64_t v86 = v138;
    sub_2307CE248(v165, v138);
    v143(v86, 0, 1, v9);
    swift_beginAccess();
    uint64_t v87 = v148;
    sub_2307D5710(v86, v148);
    swift_endAccess();
    sub_2307D51B8(v179, v87);

    sub_2307E286C(v85);
    sub_2307CDF28(v170, &qword_26AF24868);
    uint64_t v44 = v157;
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
  uint64_t v99 = (unsigned int (*)(uint64_t, uint64_t, unint64_t))MEMORY[0x263F8EE88];
LABEL_47:
  uint64_t v102 = v145 + 19;
  swift_beginAccess();
  v173[0] = MEMORY[0x263F8EE88];
  uint64_t v103 = swift_bridgeObjectRetain();
  uint64_t v44 = sub_2307D7D9C(v103);
  if (v134)
  {
    uint64_t v104 = swift_bridgeObjectRetain();
    uint64_t v44 = sub_2308020B8(v104, v44);
    swift_bridgeObjectRelease();
  }
  a5 = 0;
  uint64_t v105 = *(void *)(v44 + 56);
  uint64_t v165 = v44 + 56;
  uint64_t v106 = 1 << *(unsigned char *)(v44 + 32);
  if (v106 < 64) {
    uint64_t v107 = ~(-1 << v106);
  }
  else {
    uint64_t v107 = -1;
  }
  unint64_t v9 = v107 & v105;
  uint64_t v170 = (uint64_t)v99 + 56;
  id v166 = (id)((unint64_t)(v106 + 63) >> 6);
  v167 = (unsigned int (**)(uint64_t, uint64_t, unint64_t))(v164 + 56);
  v163 = v99;
LABEL_55:
  while (v9)
  {
    unint64_t v110 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v111 = v110 | (a5 << 6);
LABEL_70:
    uint64_t v8 = *(uint64_t **)(*(void *)(v44 + 48) + 8 * v111);
    if (!*((void *)v99 + 2)) {
      goto LABEL_77;
    }
    sub_230812958();
    sub_230812988();
    uint64_t v115 = sub_230812998();
    uint64_t v116 = -1 << *((unsigned char *)v99 + 32);
    unint64_t v117 = v115 & ~v116;
    if (((*(void *)(v170 + ((v117 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v117) & 1) == 0) {
      goto LABEL_77;
    }
    uint64_t v118 = *((void *)v99 + 6);
    if (*(uint64_t **)(v118 + 8 * v117) != v8)
    {
      uint64_t v119 = ~v116;
      while (1)
      {
        unint64_t v117 = (v117 + 1) & v119;
        if (((*(void *)(v170 + ((v117 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v117) & 1) == 0) {
          break;
        }
        if (*(uint64_t **)(v118 + 8 * v117) == v8) {
          goto LABEL_55;
        }
      }
LABEL_77:
      unint64_t v120 = sub_2307CF3B0((uint64_t)v8);
      if (v121)
      {
        unint64_t v122 = v120;
        uint64_t v123 = v44;
        char v124 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v125 = *v102;
        v179[0] = *v102;
        uint64_t *v102 = 0x8000000000000000;
        if ((v124 & 1) == 0)
        {
          sub_230810E88();
          uint64_t v125 = v179[0];
        }
        uint64_t v126 = v168;
        sub_2307CE37C(*(void *)(v125 + 56) + *(void *)(v164 + 72) * v122, v168);
        sub_2308108D0(v122, v125);
        uint64_t *v102 = v125;
        swift_bridgeObjectRelease();
        uint64_t v109 = v126;
        uint64_t v108 = 0;
        uint64_t v44 = v123;
        uint64_t v99 = v163;
      }
      else
      {
        uint64_t v108 = 1;
        uint64_t v109 = v168;
      }
      ((void (*)(uint64_t, uint64_t, uint64_t, unint64_t))*v167)(v109, v108, 1, v169);
      sub_2307CDF28(v109, &qword_26AF24868);
      sub_2307D51B8(v179, (uint64_t)v8);
      sub_2307D51B8(v179, (uint64_t)v8);
    }
  }
  if (__OFADD__(a5++, 1))
  {
    __break(1u);
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  if (a5 >= (uint64_t)v166) {
    goto LABEL_85;
  }
  unint64_t v113 = *(void *)(v165 + 8 * a5);
  if (v113)
  {
LABEL_69:
    unint64_t v9 = (v113 - 1) & v113;
    unint64_t v111 = __clz(__rbit64(v113)) + (a5 << 6);
    goto LABEL_70;
  }
  uint64_t v114 = a5 + 1;
  if (a5 + 1 >= (uint64_t)v166) {
    goto LABEL_85;
  }
  unint64_t v113 = *(void *)(v165 + 8 * v114);
  if (v113) {
    goto LABEL_68;
  }
  uint64_t v114 = a5 + 2;
  if (a5 + 2 >= (uint64_t)v166) {
    goto LABEL_85;
  }
  unint64_t v113 = *(void *)(v165 + 8 * v114);
  if (v113) {
    goto LABEL_68;
  }
  uint64_t v114 = a5 + 3;
  if (a5 + 3 >= (uint64_t)v166) {
    goto LABEL_85;
  }
  unint64_t v113 = *(void *)(v165 + 8 * v114);
  if (v113)
  {
LABEL_68:
    a5 = v114;
    goto LABEL_69;
  }
  uint64_t v114 = a5 + 4;
  if (a5 + 4 < (uint64_t)v166)
  {
    unint64_t v113 = *(void *)(v165 + 8 * v114);
    if (!v113)
    {
      while (1)
      {
        a5 = v114 + 1;
        if (__OFADD__(v114, 1)) {
          goto LABEL_90;
        }
        if (a5 >= (uint64_t)v166) {
          goto LABEL_85;
        }
        unint64_t v113 = *(void *)(v165 + 8 * a5);
        ++v114;
        if (v113) {
          goto LABEL_69;
        }
      }
    }
    goto LABEL_68;
  }
LABEL_85:
  swift_release();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v127 = (uint64_t)v145;
  __swift_project_boxed_opaque_existential_1(v145 + 22, v145[25]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  uint64_t v180 = v133;
  v179[0] = v127;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)v179, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  if (v130)
  {
    swift_bridgeObjectRetain();
    uint64_t v128 = sub_230812808();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v128 = *(void *)((v157 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v180 = MEMORY[0x263F8D6C8];
  v179[0] = v128;
  sub_230812128();
  sub_2307CDF28((uint64_t)v179, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v131 = v182;
  return result;
}

BOOL sub_230801CC4()
{
  return *(void *)(*(void *)v0 + 136) != 1;
}

uint64_t sub_230801CD8()
{
  return swift_retain();
}

uint64_t sub_230801CE4()
{
  *(void *)(v1 + 16) = *v0;
  return MEMORY[0x270FA2498](sub_2307FC73C, 0, 0);
}

uint64_t sub_230801D08(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 48) = a2;
  uint64_t v4 = *v2;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 32) = v5;
  void *v5 = v3;
  v5[1] = sub_2307FDFBC;
  return sub_2307FCC90();
}

uint64_t sub_230801DA0(char a1)
{
  *(unsigned char *)(v2 + 40) = a1;
  *(void *)(v2 + 16) = *v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_2307FEEA4;
  return sub_2307FCC90();
}

void sub_230801E38()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 216) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDB4(v2);
  os_unfair_lock_unlock(v1);
}

BOOL sub_230801EB4(uint64_t a1)
{
  return (*(unsigned char *)(a1 + 8) & 1) == 0;
}

uint64_t sub_230801EC4()
{
  return PurchaseHistoryAppStateDataSource.description.getter();
}

void *sub_230801EE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24050);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_230802798((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_230803630();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_230801FD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C80);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  uint64_t v6 = sub_230802998(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_230803630();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2308020B8(uint64_t isStackAllocationSafe, uint64_t a2)
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
    uint64_t v7 = sub_230802240((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_230802240((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x230FBFCC0](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_230802240(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v43 = (unint64_t *)result;
  uint64_t v6 = 0;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v7 = 0;
    uint64_t v8 = a4 + 56;
    uint64_t v9 = 1 << *(unsigned char *)(a4 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(a4 + 56);
    int64_t v45 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = a3 + 56;
    while (1)
    {
LABEL_6:
      if (v11)
      {
        unint64_t v13 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v14 = v13 | (v7 << 6);
      }
      else
      {
        int64_t v15 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
          __break(1u);
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        if (v15 >= v45) {
          goto LABEL_60;
        }
        unint64_t v16 = *(void *)(v8 + 8 * v15);
        ++v7;
        if (!v16)
        {
          int64_t v7 = v15 + 1;
          if (v15 + 1 >= v45) {
            goto LABEL_60;
          }
          unint64_t v16 = *(void *)(v8 + 8 * v7);
          if (!v16)
          {
            int64_t v7 = v15 + 2;
            if (v15 + 2 >= v45) {
              goto LABEL_60;
            }
            unint64_t v16 = *(void *)(v8 + 8 * v7);
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v45)
              {
LABEL_60:
                swift_retain();
                return sub_23080CC30(v43, a2, v6, a3);
              }
              unint64_t v16 = *(void *)(v8 + 8 * v17);
              if (!v16)
              {
                while (1)
                {
                  int64_t v7 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    break;
                  }
                  if (v7 >= v45) {
                    goto LABEL_60;
                  }
                  unint64_t v16 = *(void *)(v8 + 8 * v7);
                  ++v17;
                  if (v16) {
                    goto LABEL_21;
                  }
                }
LABEL_63:
                __break(1u);
                goto LABEL_64;
              }
              int64_t v7 = v17;
            }
          }
        }
LABEL_21:
        unint64_t v11 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v7 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(a4 + 48) + 8 * v14);
      sub_230812958();
      sub_230812988();
      uint64_t result = sub_230812998();
      uint64_t v19 = -1 << *(unsigned char *)(a3 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      uint64_t v22 = 1 << v20;
      if (((1 << v20) & *(void *)(v12 + 8 * (v20 >> 6))) != 0)
      {
        uint64_t v23 = *(void *)(a3 + 48);
        if (*(void *)(v23 + 8 * v20) != v18)
        {
          for (unint64_t i = v20 + 1; ; unint64_t i = v25 + 1)
          {
            unint64_t v25 = i & ~v19;
            if (((*(void *)(v12 + ((v25 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v25) & 1) == 0) {
              goto LABEL_6;
            }
            if (*(void *)(v23 + 8 * v25) == v18) {
              break;
            }
          }
          unint64_t v21 = v25 >> 6;
          uint64_t v22 = 1 << v25;
        }
        v43[v21] |= v22;
        BOOL v26 = __OFADD__(v6++, 1);
        if (v26) {
          break;
        }
      }
    }
    __break(1u);
  }
  int64_t v27 = 0;
  uint64_t v44 = a3 + 56;
  uint64_t v28 = 1 << *(unsigned char *)(a3 + 32);
  if (v28 < 64) {
    uint64_t v29 = ~(-1 << v28);
  }
  else {
    uint64_t v29 = -1;
  }
  unint64_t v30 = v29 & *(void *)(a3 + 56);
  int64_t v46 = (unint64_t)(v28 + 63) >> 6;
  uint64_t v31 = a4 + 56;
  while (v30)
  {
    unint64_t v32 = __clz(__rbit64(v30));
    v30 &= v30 - 1;
    unint64_t v33 = v32 | (v27 << 6);
LABEL_52:
    uint64_t v37 = *(void *)(*(void *)(a3 + 48) + 8 * v33);
    sub_230812958();
    sub_230812988();
    uint64_t result = sub_230812998();
    uint64_t v38 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v39 = result & ~v38;
    if ((*(void *)(v31 + ((v39 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v39))
    {
      uint64_t v40 = *(void *)(a4 + 48);
      if (*(void *)(v40 + 8 * v39) == v37)
      {
LABEL_57:
        *(unint64_t *)((char *)v43 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
        BOOL v26 = __OFADD__(v6++, 1);
        if (v26)
        {
          __break(1u);
          goto LABEL_60;
        }
      }
      else
      {
        uint64_t v41 = ~v38;
        while (1)
        {
          unint64_t v39 = (v39 + 1) & v41;
          if (((*(void *)(v31 + ((v39 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v39) & 1) == 0) {
            break;
          }
          if (*(void *)(v40 + 8 * v39) == v37) {
            goto LABEL_57;
          }
        }
      }
    }
  }
  int64_t v34 = v27 + 1;
  if (__OFADD__(v27, 1)) {
    goto LABEL_62;
  }
  if (v34 >= v46) {
    goto LABEL_60;
  }
  unint64_t v35 = *(void *)(v44 + 8 * v34);
  ++v27;
  if (v35) {
    goto LABEL_51;
  }
  int64_t v27 = v34 + 1;
  if (v34 + 1 >= v46) {
    goto LABEL_60;
  }
  unint64_t v35 = *(void *)(v44 + 8 * v27);
  if (v35) {
    goto LABEL_51;
  }
  int64_t v27 = v34 + 2;
  if (v34 + 2 >= v46) {
    goto LABEL_60;
  }
  unint64_t v35 = *(void *)(v44 + 8 * v27);
  if (v35)
  {
LABEL_51:
    unint64_t v30 = (v35 - 1) & v35;
    unint64_t v33 = __clz(__rbit64(v35)) + (v27 << 6);
    goto LABEL_52;
  }
  int64_t v36 = v34 + 3;
  if (v36 >= v46) {
    goto LABEL_60;
  }
  unint64_t v35 = *(void *)(v44 + 8 * v36);
  if (v35)
  {
    int64_t v27 = v36;
    goto LABEL_51;
  }
  while (1)
  {
    int64_t v27 = v36 + 1;
    if (__OFADD__(v36, 1)) {
      break;
    }
    if (v27 >= v46) {
      goto LABEL_60;
    }
    unint64_t v35 = *(void *)(v44 + 8 * v27);
    ++v36;
    if (v35) {
      goto LABEL_51;
    }
  }
LABEL_64:
  __break(1u);
  return result;
}

void (*sub_230802660(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_230802710(v6, a2, a3);
  return sub_2308026C8;
}

void sub_2308026C8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_230802710(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x230FBF430](a2, a3);
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
    return sub_230802790;
  }
  __break(1u);
  return result;
}

void sub_230802790(id *a1)
{
}

uint64_t sub_230802798(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
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
  unint64_t v11 = a2;
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
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *unint64_t v11 = *v20;
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

void *sub_230802998(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_230802B2C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  sub_2307D7F14();
  uint64_t result = sub_2308125F8();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      sub_2307D51B8(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t *sub_230802BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v27 = *a7;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F88);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  int64_t v17 = &v28[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v31[3] = &type metadata for SingleAccountFamily;
  v31[4] = &protocol witness table for SingleAccountFamily;
  uint64_t v18 = swift_allocObject();
  v31[0] = v18;
  long long v19 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v18 + 32) = v19;
  *(void *)(v18 + 48) = *(void *)(a1 + 32);
  uint64_t v20 = sub_2308123B8();
  v30[3] = v20;
  v30[4] = MEMORY[0x263F50E40];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(boxed_opaque_existential_0, a6, v20);
  a7[20] = 0;
  *((unsigned char *)a7 + 168) = 1;
  sub_2307CDEC4((uint64_t)v31, (uint64_t)(a7 + 2));
  sub_2307CDEC4(a2, (uint64_t)(a7 + 7));
  sub_2307CDEC4(a3, (uint64_t)(a7 + 12));
  a7[17] = a4;
  a7[18] = (uint64_t)a5;
  sub_2307CDEC4((uint64_t)v30, (uint64_t)(a7 + 22));
  a7[19] = sub_2307CA1CC(MEMORY[0x263F8EE78]);
  *((unsigned char *)a7 + 169) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B68);
  swift_allocObject();
  id v22 = a5;
  a7[28] = sub_2308123F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CE0);
  uint64_t v23 = swift_allocObject();
  *(_DWORD *)(v23 + 16) = 0;
  a7[27] = v23;
  objc_msgSend(v22, sel_addObserver_selector_name_object_, a7, sel_purchaseHistoryUpdated_, *MEMORY[0x263F253B0], 0, v27);
  uint64_t v24 = a7[5];
  uint64_t v25 = a7[6];
  __swift_project_boxed_opaque_existential_1(a7 + 2, v24);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v25 + 8))(v29, v24, v25);
  __swift_project_boxed_opaque_existential_1(v29, v29[3]);
  sub_2308121F8();
  swift_getObjectType();
  sub_2308121A8();
  sub_2308121B8();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  return a7;
}

uint64_t sub_230802F00(uint64_t a1)
{
  return a1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *sub_230802FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v28 = a4;
  uint64_t v30 = *a7;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F88);
  uint64_t v31 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v29 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36[3] = a8;
  v36[4] = a10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v36);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(boxed_opaque_existential_0, a1, a8);
  void v35[3] = a9;
  v35[4] = a11;
  uint64_t v20 = __swift_allocate_boxed_opaque_existential_0(v35);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a9 - 8) + 32))(v20, a6, a9);
  a7[20] = 0;
  *((unsigned char *)a7 + 168) = 1;
  sub_2307CDEC4((uint64_t)v36, (uint64_t)(a7 + 2));
  uint64_t v21 = a2;
  sub_2307CDEC4(a2, (uint64_t)(a7 + 7));
  sub_2307CDEC4(a3, (uint64_t)(a7 + 12));
  a7[17] = v28;
  a7[18] = (uint64_t)a5;
  sub_2307CDEC4((uint64_t)v35, (uint64_t)(a7 + 22));
  a7[19] = sub_2307CA1CC(MEMORY[0x263F8EE78]);
  *((unsigned char *)a7 + 169) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B68);
  swift_allocObject();
  id v22 = a5;
  a7[28] = sub_2308123F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CE0);
  uint64_t v23 = swift_allocObject();
  *(_DWORD *)(v23 + 16) = 0;
  a7[27] = v23;
  objc_msgSend(v22, sel_addObserver_selector_name_object_, a7, sel_purchaseHistoryUpdated_, *MEMORY[0x263F253B0], 0);
  uint64_t v24 = a7[5];
  uint64_t v25 = a7[6];
  __swift_project_boxed_opaque_existential_1(a7 + 2, v24);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v25 + 8))(v34, v24, v25);
  __swift_project_boxed_opaque_existential_1(v34, v34[3]);
  sub_2308121F8();
  swift_getObjectType();
  sub_2308121A8();
  BOOL v26 = v29;
  sub_2308121B8();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  return a7;
}

uint64_t *sub_230803330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v28 = a4;
  uint64_t v29 = a5;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v25 = a10;
  uint64_t v14 = *(void *)(a9 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](a1);
  int64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = (uint64_t *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, a8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, a6, a9);
  return sub_230802FA4((uint64_t)v21, v26, v27, v28, v29, (uint64_t)v17, v22, a8, a9, v25, a11);
}

uint64_t sub_2308034E8@<X0>(uint64_t a1@<X8>)
{
  return sub_2307FF064(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t type metadata accessor for PurchaseHistoryAppStateDataSource()
{
  return self;
}

uint64_t method lookup function for PurchaseHistoryAppStateDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PurchaseHistoryAppStateDataSource);
}

uint64_t sub_230803544()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2307C8818;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2307FF400, 0, 0);
}

uint64_t sub_2308035EC@<X0>(uint64_t *a1@<X8>)
{
  return sub_230800828(a1);
}

void sub_230803608(void *a1@<X8>)
{
  sub_230800888(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_230803630()
{
  return swift_release();
}

void sub_230803638(unsigned char *a1@<X8>)
{
  if (*(unsigned char *)(v1 + 169))
  {
    *a1 = 0;
  }
  else
  {
    *(unsigned char *)(v1 + 169) = 1;
    *a1 = 1;
  }
}

void *sub_230803658@<X0>(unsigned char *a1@<X8>)
{
  return sub_23080DFC8(*(void *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

uint64_t sub_230803678()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2307C8818;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_2307CBA50;
  return sub_2307FCC90();
}

uint64_t sub_23080374C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_230803784(uint64_t a1)
{
  return sub_2307FC34C(a1, v1);
}

uint64_t objectdestroyTm_1()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2308037D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (void *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_2307CBA50;
  return sub_2307FFE80(a1, v4, v5, v6);
}

uint64_t sub_230803884()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

void sub_2308038BC(void *a1@<X8>)
{
}

uint64_t sub_2308038D4@<X0>(uint64_t a1@<X8>)
{
  return sub_2308034E8(a1);
}

uint64_t dispatch thunk of PurchaseManager.isDeletableSystemApp(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PurchaseManager.start(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_2307D9BAC;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of PurchaseManager.install(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 24) + **(int **)(a4 + 24));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_2307C8818;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of RegulatoryLogger.willAccessLocationForSearch()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RegulatoryLogger.willTransmitLocationForSearch()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RegulatoryLogger.willRequestAppList()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t static Restrictions.defaultMaxAppContentRating.getter()
{
  return 1000;
}

BOOL Restrictions.isActionableOffer(_:with:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for State();
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v33 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v33 - v16;
  uint64_t v19 = *a1;
  if ((*a1 & 4) == 0)
  {
    uint64_t v34 = v17;
    uint64_t v35 = a2;
    uint64_t v36 = a4;
    uint64_t v20 = a1[1];
    char v21 = *((unsigned char *)a1 + 16);
    sub_2307CE248(a2, (uint64_t)&v33 - v16);
    int v22 = swift_getEnumCaseMultiPayload() - 1;
    BOOL result = 0;
    switch(v22)
    {
      case 0:
        return result;
      case 2:
        swift_bridgeObjectRelease();
        goto LABEL_4;
      case 5:
      case 7:
LABEL_4:
        uint64_t v33 = v20;
        uint64_t v24 = v36;
        uint64_t v25 = a3;
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v36 + 16))(a3, v36) & 1) == 0) {
          return 0;
        }
        char v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 32))(a3, v24);
        if (v19 & 8) == 0 && (v26) {
          return 0;
        }
        char v27 = v21;
        char v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 40))(v25, v24);
        sub_2307CE248(v35, (uint64_t)v15);
        if ((v28 & 1) == 0)
        {
          sub_2307E286C((uint64_t)v15);
LABEL_15:
          if (v27) {
            return 1;
          }
          uint64_t v31 = (*(uint64_t (**)(uint64_t))(v36 + 8))(v25);
          return v31 >= v33;
        }
        swift_storeEnumTagMultiPayload();
        char v29 = _s8AppState0B0O2eeoiySbAC_ACtFZ_0((uint64_t)v15, (uint64_t)v12);
        sub_2307E286C((uint64_t)v12);
        uint64_t v30 = v34;
        sub_2307CE248((uint64_t)v15, v34);
        if (v29)
        {
          sub_2307E286C(v30);
          sub_2307E286C((uint64_t)v15);
          return 0;
        }
        swift_storeEnumTagMultiPayload();
        char v32 = _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v30, (uint64_t)v12);
        sub_2307E286C((uint64_t)v12);
        sub_2307E286C(v30);
        sub_2307E286C((uint64_t)v15);
        if ((v32 & 1) == 0) {
          goto LABEL_15;
        }
        break;
      default:
        sub_2307E286C((uint64_t)v18);
        return 1;
    }
  }
  return 0;
}

uint64_t dispatch thunk of Restrictions.maxAppContentRating.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Restrictions.isAppInstallationAllowed.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Restrictions.isAppUninstallationAllowed.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Restrictions.isRunningInStoreDemoMode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Restrictions.hasManagedAppleID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of Restrictions.isAccountModificationRestricted.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of Restrictions.onRestrictionsChange.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

id sub_230803ED0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_ams_DSID);
  *a2 = result;
  return result;
}

id sub_230803F0C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_ams_setDSID_, *a1);
}

uint64_t SingleAccountFamily.init(primaryAccount:)@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2307CDF84(a1, a2);
}

uint64_t SingleAccountFamily.primaryAccount.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2307CDEC4(v1, a1);
}

uint64_t SingleAccountFamily.fetchFamilyMemberIDs()()
{
  *(void *)(v1 + 24) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23F98);
  *(void *)(v1 + 32) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_230803FC8, 0, 0);
}

uint64_t sub_230803FC8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 24), *(void *)(*(void *)(v0 + 24) + 24));
  sub_2308121E8();
  uint64_t v2 = sub_230812318();
  uint64_t v3 = *(void *)(v2 - 8);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = *(void *)(v0 + 32);
  if (v4 == 1)
  {
    sub_2307DD6F8(*(void *)(v0 + 32));
  }
  else
  {
    swift_getKeyPath();
    sub_230812308();
    swift_release();
    uint64_t v6 = *(void **)(v0 + 16);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
    if (v6)
    {
      id v7 = objc_msgSend(v6, sel_longLongValue);

      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24040);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_230813840;
      *(void *)(v8 + 32) = v7;
      goto LABEL_6;
    }
  }
  uint64_t v8 = MEMORY[0x263F8EE78];
LABEL_6:
  swift_task_dealloc();
  uint64_t v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v9(v8);
}

id sub_230804168@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_ams_DSID);
  *a2 = result;
  return result;
}

id sub_2308041A4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_ams_setDSID_, *a1);
}

uint64_t sub_2308041B8@<X0>(uint64_t a1@<X8>)
{
  return sub_2307CDEC4(v1, a1);
}

uint64_t sub_2308041C4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2307DD380;
  return SingleAccountFamily.fetchFamilyMemberIDs()();
}

ValueMetadata *type metadata accessor for SingleAccountFamily()
{
  return &type metadata for SingleAccountFamily;
}

uint64_t sub_230804260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_230812588();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_230812578();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2307CDF28(a1, &qword_26AF24BC0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_230812538();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23080440C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v15 = MEMORY[0x263F8EE78];
  sub_23080BE6C(0, v1, 0);
  uint64_t v2 = v15;
  uint64_t result = sub_23080E070(a1);
  int64_t v5 = result;
  int v7 = v6;
  char v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
  {
    if (((*(void *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      goto LABEL_13;
    }
    if (*(_DWORD *)(a1 + 36) != v7) {
      goto LABEL_14;
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 16 * v5);
    unint64_t v12 = *(void *)(v15 + 16);
    unint64_t v11 = *(void *)(v15 + 24);
    if (v12 >= v11 >> 1) {
      sub_23080BE6C((char *)(v11 > 1), v12 + 1, 1);
    }
    *(void *)(v15 + 16) = v12 + 1;
    *(void *)(v15 + 8 * v12 + 32) = v10;
    uint64_t result = sub_23080E114(v5, v7, v9 & 1, a1);
    int64_t v5 = result;
    int v7 = v13;
    char v9 = v14 & 1;
    if (!--v1)
    {
      sub_2307F5AA0(result, v13, v14 & 1);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_230804578()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[11], v0[7]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_230804614(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  char v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  int v6 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v6;
  *int v6 = v4;
  v6[1] = sub_2307CBA50;
  return v8(a1);
}

uint64_t sub_2308046F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return MEMORY[0x270FA2498](sub_2307C5D64, 0, 0);
}

uint64_t sub_230804710()
{
  uint64_t v1 = *(void *)(v0 + 32);
  sub_2308125A8();
  if (!v1)
  {
    sub_23080F00C();
    swift_allocError();
    swift_willThrow();
  }
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2308047A8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2308047EC(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    uint64_t result = sub_2307D51B8(&v13, *(void *)(*(void *)(v1 + 48) + 8 * v9));
  }
  int64_t v12 = v10 + 4;
  if (v12 < v7)
  {
    unint64_t v11 = *(void *)(v3 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v2 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        ++v12;
        if (v11) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v12;
    goto LABEL_22;
  }
LABEL_23:
  return swift_release();
}

uint64_t sub_230804948(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v10 >= v7) {
      goto LABEL_23;
    }
    unint64_t v11 = *(void *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      int64_t v2 = v10 + 1;
      if (v10 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v11 = *(void *)(v3 + 8 * v2);
      if (!v11)
      {
        int64_t v2 = v10 + 2;
        if (v10 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        if (!v11)
        {
          int64_t v2 = v10 + 3;
          if (v10 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v11 = *(void *)(v3 + 8 * v2);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    uint64_t result = sub_23080C084((uint64_t)&v13, *(void *)(*(void *)(v1 + 48) + 16 * v9), *(unsigned char *)(*(void *)(v1 + 48) + 16 * v9 + 8));
  }
  int64_t v12 = v10 + 4;
  if (v12 < v7)
  {
    unint64_t v11 = *(void *)(v3 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        int64_t v2 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v11 = *(void *)(v3 + 8 * v2);
        ++v12;
        if (v11) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v12;
    goto LABEL_22;
  }
LABEL_23:
  return swift_release();
}

uint64_t *StorefrontAppStateController.Configuration.withStateTransitionRules(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  sub_2307D97DC(v2, a2);
  return __swift_assign_boxed_opaque_existential_1((uint64_t *)(a2 + 48), a1);
}

uint64_t StorefrontAppStateController.isLoaded.getter()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_23080E20C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t StorefrontAppStateController.onLoad.getter()
{
  return swift_retain();
}

uint64_t StorefrontAppStateController.reloadAllStates(synchronizing:)(char a1)
{
  *(void *)(v2 + 80) = v1;
  *(unsigned char *)(v2 + 140) = a1;
  *(void *)(v2 + 88) = *v1;
  sub_230812178();
  *(void *)(v2 + 96) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_230804C2C, 0, 0);
}

uint64_t sub_230804C2C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(double **)(v0 + 80);
  char v8 = *(unsigned char *)(v0 + 140);
  __swift_project_boxed_opaque_existential_1((void *)v2 + 19, *((void *)v2 + 22));
  *(void *)(v0 + 104) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  uint64_t v3 = *(void *)(sub_230812198() - 8);
  *(void *)(v0 + 112) = *(void *)(v3 + 72);
  *(_DWORD *)(v0 + 136) = *(_DWORD *)(v3 + 80);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812168();
  sub_230812158();
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 16) = v2;
  swift_retain();
  sub_230812128();
  sub_2307CDF28(v0 + 16, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812118();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  double v4 = v2[18];
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 120) = v5;
  *(unsigned char *)(v5 + 16) = v8;
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v6;
  *unint64_t v6 = v0;
  v6[1] = sub_230804E80;
  return sub_2307C5C94((uint64_t)&unk_268703120, v5, v4);
}

uint64_t sub_230804E80()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_230804F98, 0, 0);
}

uint64_t sub_230804F98()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = v0[10];
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 152), *(void *)(v2 + 176));
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812168();
  sub_230812158();
  v0[9] = v1;
  v0[6] = v2;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v0 + 6), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812118();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_230805114(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 32) = a2;
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](sub_230805138, 0, 0);
}

uint64_t sub_230805138()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  int64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 40) + **(int **)(v3 + 40));
  double v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v4;
  *double v4 = v0;
  v4[1] = sub_2307C7E08;
  uint64_t v5 = *(unsigned __int8 *)(v0 + 32);
  return v7(v5, v2, v3);
}

uint64_t sub_230805240()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 15;
  unint64_t v11 = (void *)v0[33];
  uint64_t v3 = v0[27];
  uint64_t v4 = v1[26];
  uint64_t v5 = v1[23];
  swift_task_dealloc();
  swift_release();
  __swift_project_boxed_opaque_existential_1((void *)(v4 + 152), *(void *)(v4 + 176));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812168();
  sub_230812158();
  v1[10] = v3;
  v1[7] = v4;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 7), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812168();
  sub_230812158();
  v1[14] = MEMORY[0x263F8D538];
  v1[11] = v5;
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 11), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v6 = v1[19];
  uint64_t v7 = v1[20];
  v1[18] = v7;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_0, v6, v7);
  sub_230812128();
  sub_2307CDF28((uint64_t)v2, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v1[1];
  return v9();
}

uint64_t StorefrontAppStateController.reloadState(forApps:synchronizing:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v3 + 228) = a2;
  *(void *)(v3 + 144) = a1;
  *(void *)(v3 + 152) = v2;
  *(void *)(v3 + 160) = *v2;
  sub_230812178();
  *(void *)(v3 + 168) = swift_task_alloc();
  *(void *)(v3 + 176) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_230805600, 0, 0);
}

uint64_t sub_230805600()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 160);
  char v11 = *(unsigned char *)(v1 + 228);
  uint64_t v3 = *(void *)(v1 + 144);
  uint64_t v4 = *(double **)(v1 + 152);
  __swift_project_boxed_opaque_existential_1((void *)v4 + 19, *((void *)v4 + 22));
  *(void *)(v1 + 184) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  uint64_t v5 = *(void *)(sub_230812198() - 8);
  *(void *)(v1 + 192) = *(void *)(v5 + 72);
  *(_DWORD *)(v1 + 224) = *(_DWORD *)(v5 + 80);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812168();
  sub_230812158();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 16) = v4;
  swift_retain();
  sub_230812128();
  sub_2307CDF28(v1 + 16, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812168();
  sub_230812158();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF240D0);
  *(void *)(v1 + 200) = v6;
  *(void *)(v1 + 72) = v6;
  *(void *)(v1 + 48) = v3;
  swift_bridgeObjectRetain();
  sub_230812128();
  sub_2307CDF28(v1 + 48, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  double v7 = v4[18];
  uint64_t v8 = swift_allocObject();
  *(void *)(v1 + 208) = v8;
  *(void *)(v8 + 16) = v3;
  *(unsigned char *)(v8 + 24) = v11;
  swift_bridgeObjectRetain();
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 216) = v9;
  *uint64_t v9 = v1;
  v9[1] = sub_2308058D0;
  return sub_2307C5C94((uint64_t)&unk_268703140, v8, v7);
}

uint64_t sub_2308058D0()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_2308059E8, 0, 0);
}

uint64_t sub_2308059E8()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[20];
  uint64_t v4 = v1[19];
  uint64_t v7 = v1[18];
  uint64_t v8 = v2;
  __swift_project_boxed_opaque_existential_1((void *)(v4 + 152), *(void *)(v4 + 176));
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812168();
  sub_230812158();
  v1[13] = v3;
  v1[10] = v4;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 10), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812168();
  sub_230812158();
  v1[17] = v8;
  v1[14] = v7;
  swift_bridgeObjectRetain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 14), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122B8();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v1[1];
  return v5();
}

uint64_t sub_230805BD0(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 64) = a3;
  *(void *)(v3 + 24) = a1;
  *(void *)(v3 + 32) = a2;
  return MEMORY[0x270FA2498](sub_230805BF4, 0, 0);
}

uint64_t sub_230805BF4()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_23080D13C((uint64_t)sub_23080EE0C, v3, v1);
  swift_task_dealloc();
  if (*(void *)(v4 + 16))
  {
    uint64_t v5 = *(void **)(v0 + 24);
    uint64_t v6 = v5[3];
    uint64_t v7 = v5[4];
    __swift_project_boxed_opaque_existential_1(v5, v6);
    uint64_t v8 = sub_23080440C(v4);
    swift_release();
    uint64_t v9 = sub_230802B2C(v8);
    *(void *)(v0 + 40) = v9;
    swift_bridgeObjectRelease();
    char v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 + 32) + **(int **)(v7 + 32));
    int64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 48) = v10;
    *int64_t v10 = v0;
    v10[1] = sub_230805DDC;
    uint64_t v11 = *(unsigned __int8 *)(v0 + 64);
    return v14(v9, v11, v6, v7);
  }
  else
  {
    swift_release();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
}

uint64_t sub_230805DDC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_230805F18, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_230805F18()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t StorefrontAppStateController.preloadState(forApps:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24BC0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = *(os_unfair_lock_s **)(v1 + 192);
  uint64_t v17 = a1;
  uint64_t v18 = v1;
  char v14 = sub_23080E3DC;
  uint64_t v15 = &v16;
  uint64_t v8 = v7 + 4;
  os_unfair_lock_lock(v7 + 4);
  sub_2307D9858(&v19);
  os_unfair_lock_unlock(v8);
  uint64_t v9 = *(void *)(v19 + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v9)
  {
    uint64_t v11 = sub_230812588();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
    uint64_t v12 = (void *)swift_allocObject();
    void v12[2] = 0;
    v12[3] = 0;
    v12[4] = v2;
    v12[5] = a1;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_230804260((uint64_t)v6, (uint64_t)&unk_268703150, (uint64_t)v12);
    return swift_release();
  }
  return result;
}

uint64_t sub_2308060E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  swift_beginAccess();
  uint64_t v6 = *(void *)(a2 + 40);
  if (*(void *)(v6 + 16) <= *(void *)(a1 + 16) >> 3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23080D490(v6);
    swift_bridgeObjectRelease();
    uint64_t v8 = a1;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = swift_bridgeObjectRetain();
    uint64_t v8 = sub_23080D61C(v7, a1);
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  uint64_t v9 = swift_bridgeObjectRetain();
  sub_230804948(v9);
  uint64_t result = swift_endAccess();
  *a3 = v8;
  return result;
}

uint64_t sub_2308061E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[28] = a4;
  v5[29] = a5;
  sub_230812178();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_230806280, 0, 0);
}

uint64_t sub_230806280()
{
  uint64_t v1 = *(void *)(v0[28] + 16);
  v0[32] = v1;
  uint64_t v2 = *(void *)(v1 + 16);
  v0[33] = v2;
  if (!v2)
  {
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  v0[34] = 0;
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  unint64_t v5 = 0;
  while (1)
  {
    sub_2307CDEC4(v4 + 40 * v5 + 32, (uint64_t)(v0 + 2));
    uint64_t v6 = v0[5];
    uint64_t v7 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v6);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7)) {
      break;
    }
LABEL_7:
    uint64_t v11 = v0[33];
    uint64_t v12 = v0[34] + 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    if (v12 == v11) {
      goto LABEL_10;
    }
    unint64_t v5 = v0[34] + 1;
    v0[34] = v5;
    uint64_t v4 = v0[32];
    if (v5 >= *(void *)(v4 + 16)) {
      goto LABEL_9;
    }
  }
  uint64_t v8 = v0[29];
  uint64_t v9 = swift_task_alloc();
  *(void *)(v9 + 16) = v0 + 2;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_23080D13C((uint64_t)sub_23080EE0C, v9, v8);
  v0[35] = v10;
  swift_task_dealloc();
  if (!*(void *)(v10 + 16))
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v15 = v0[5];
  uint64_t v16 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v15);
  uint64_t v17 = sub_23080440C(v10);
  sub_2307D7F14();
  uint64_t v18 = sub_2308125F8();
  uint64_t v19 = *(void *)(v17 + 16);
  if (v19)
  {
    uint64_t v32 = v15;
    uint64_t v20 = 0;
    uint64_t v21 = v17 + 32;
    do
    {
      uint64_t v23 = v18 + 56;
      while (1)
      {
        uint64_t v24 = *(void *)(v21 + 8 * v20++);
        sub_230812958();
        sub_230812988();
        uint64_t v25 = sub_230812998();
        uint64_t v26 = -1 << *(unsigned char *)(v18 + 32);
        unint64_t v27 = v25 & ~v26;
        if (((*(void *)(v23 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
          break;
        }
        uint64_t v28 = *(void *)(v18 + 48);
        if (*(void *)(v28 + 8 * v27) != v24)
        {
          uint64_t v29 = ~v26;
          do
          {
            unint64_t v27 = (v27 + 1) & v29;
            if (((*(void *)(v23 + ((v27 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v27) & 1) == 0) {
              goto LABEL_16;
            }
          }
          while (*(void *)(v28 + 8 * v27) != v24);
        }
        if (v20 == v19) {
          goto LABEL_25;
        }
      }
LABEL_16:
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_2307D52D8(v24, v27, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
    }
    while (v20 != v19);
LABEL_25:
    swift_bridgeObjectRelease();
    uint64_t v15 = v32;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v0[36] = v18;
  uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 + 32) + **(int **)(v16 + 32));
  uint64_t v30 = (void *)swift_task_alloc();
  v0[37] = v30;
  void *v30 = v0;
  v30[1] = sub_230806650;
  return v31(v18, 1, v15, v16);
}

uint64_t sub_230806650()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_230806B1C;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_230806774;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_230806774()
{
  uint64_t v2 = v0[38];
  while (1)
  {
    uint64_t v3 = v0[33];
    uint64_t v4 = v0[34] + 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    if (v4 == v3) {
      break;
    }
    unint64_t v5 = v0[34] + 1;
    v0[34] = v5;
    uint64_t v6 = v0[32];
    if (v5 >= *(void *)(v6 + 16))
    {
      __break(1u);
      goto LABEL_23;
    }
    sub_2307CDEC4(v6 + 40 * v5 + 32, (uint64_t)(v0 + 2));
    uint64_t v7 = v0[5];
    uint64_t v1 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v7, v1))
    {
      uint64_t v8 = v0[29];
      uint64_t v9 = swift_task_alloc();
      *(void *)(v9 + 16) = v0 + 2;
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_23080D13C((uint64_t)sub_23080EE0C, v9, v8);
      v0[35] = v10;
      swift_task_dealloc();
      if (*(void *)(v10 + 16))
      {
        uint64_t v4 = v0[5];
        uint64_t v1 = v0[6];
        __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
        uint64_t v13 = sub_23080440C(v10);
        sub_2307D7F14();
        uint64_t v2 = sub_2308125F8();
        uint64_t v14 = *(void *)(v13 + 16);
        if (v14)
        {
          uint64_t v27 = v4;
          uint64_t v15 = 0;
          uint64_t v16 = v13 + 32;
          do
          {
            uint64_t v18 = v2 + 56;
            while (1)
            {
              uint64_t v19 = *(void *)(v16 + 8 * v15++);
              sub_230812958();
              sub_230812988();
              uint64_t v20 = sub_230812998();
              uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
              unint64_t v22 = v20 & ~v21;
              if (((*(void *)(v18 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
                break;
              }
              uint64_t v23 = *(void *)(v2 + 48);
              if (*(void *)(v23 + 8 * v22) != v19)
              {
                uint64_t v24 = ~v21;
                do
                {
                  unint64_t v22 = (v22 + 1) & v24;
                  if (((*(void *)(v18 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
                    goto LABEL_12;
                  }
                }
                while (*(void *)(v23 + 8 * v22) != v19);
              }
              if (v15 == v14) {
                goto LABEL_21;
              }
            }
LABEL_12:
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            sub_2307D52D8(v19, v22, isUniquelyReferenced_nonNull_native);
            swift_bridgeObjectRelease();
          }
          while (v15 != v14);
LABEL_21:
          swift_bridgeObjectRelease();
          uint64_t v4 = v27;
          goto LABEL_24;
        }
LABEL_23:
        swift_bridgeObjectRelease();
LABEL_24:
        v0[36] = v2;
        uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v1 + 32) + **(int **)(v1 + 32));
        uint64_t v25 = (void *)swift_task_alloc();
        v0[37] = v25;
        *uint64_t v25 = v0;
        v25[1] = sub_230806650;
        return v26(v2, 1, v4, v1);
      }
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_230806B1C()
{
  uint64_t v34 = (void *)v0[38];
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[28];
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((void *)(v2 + 152), *(void *)(v2 + 176));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812168();
  sub_230812158();
  v0[14] = type metadata accessor for StorefrontAppStateController();
  v0[11] = v2;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v0 + 11), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812168();
  sub_230812158();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF240D0);
  v0[15] = v1;
  v0[18] = v3;
  sub_230812128();
  sub_2307CDF28((uint64_t)(v0 + 15), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  uint64_t v4 = v0[5];
  unint64_t v5 = __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v0[10] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_0, v5, v4);
  sub_230812128();
  sub_2307CDF28((uint64_t)(v0 + 7), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v7 = v0[23];
  uint64_t v8 = v0[24];
  v0[22] = v8;
  uint64_t v9 = __swift_allocate_boxed_opaque_existential_0(v0 + 19);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v9, v7, v8);
  sub_230812128();
  sub_2307CDF28((uint64_t)(v0 + 19), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();
  swift_bridgeObjectRelease();

  uint64_t v10 = 0;
  while (1)
  {
    uint64_t v11 = v0[33];
    uint64_t v12 = v0[34] + 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    if (v12 == v11) {
      break;
    }
    unint64_t v13 = v0[34] + 1;
    v0[34] = v13;
    uint64_t v14 = v0[32];
    if (v13 >= *(void *)(v14 + 16))
    {
      __break(1u);
      goto LABEL_23;
    }
    sub_2307CDEC4(v14 + 40 * v13 + 32, (uint64_t)(v0 + 2));
    uint64_t v15 = v0[5];
    uint64_t v8 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v15);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v15, v8))
    {
      uint64_t v16 = v0[29];
      uint64_t v17 = swift_task_alloc();
      *(void *)(v17 + 16) = v0 + 2;
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_23080D13C((uint64_t)sub_23080EE0C, v17, v16);
      v0[35] = v18;
      swift_task_dealloc();
      if (*(void *)(v18 + 16))
      {
        uint64_t v12 = v0[5];
        uint64_t v8 = v0[6];
        __swift_project_boxed_opaque_existential_1(v0 + 2, v12);
        uint64_t v21 = sub_23080440C(v18);
        sub_2307D7F14();
        uint64_t v10 = sub_2308125F8();
        uint64_t v22 = *(void *)(v21 + 16);
        if (v22)
        {
          uint64_t v36 = v12;
          uint64_t v23 = 0;
          uint64_t v24 = v21 + 32;
          do
          {
            uint64_t v26 = v10 + 56;
            while (1)
            {
              uint64_t v27 = *(void *)(v24 + 8 * v23++);
              sub_230812958();
              sub_230812988();
              uint64_t v28 = sub_230812998();
              uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
              unint64_t v30 = v28 & ~v29;
              if (((*(void *)(v26 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0) {
                break;
              }
              uint64_t v31 = *(void *)(v10 + 48);
              if (*(void *)(v31 + 8 * v30) != v27)
              {
                uint64_t v32 = ~v29;
                do
                {
                  unint64_t v30 = (v30 + 1) & v32;
                  if (((*(void *)(v26 + ((v30 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v30) & 1) == 0) {
                    goto LABEL_12;
                  }
                }
                while (*(void *)(v31 + 8 * v30) != v27);
              }
              if (v23 == v22) {
                goto LABEL_21;
              }
            }
LABEL_12:
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            sub_2307D52D8(v27, v30, isUniquelyReferenced_nonNull_native);
            swift_bridgeObjectRelease();
          }
          while (v23 != v22);
LABEL_21:
          swift_bridgeObjectRelease();
          uint64_t v12 = v36;
          goto LABEL_24;
        }
LABEL_23:
        swift_bridgeObjectRelease();
LABEL_24:
        v0[36] = v10;
        uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 + 32) + **(int **)(v8 + 32));
        uint64_t v33 = (void *)swift_task_alloc();
        v0[37] = v33;
        *uint64_t v33 = v0;
        v33[1] = sub_230806650;
        return v35(v10, 1, v12, v8);
      }
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t StorefrontAppStateController.prospectiveState(forApp:applying:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v77 = (uint64_t *)((char *)&v66 - v11);
  uint64_t v84 = type metadata accessor for State();
  uint64_t v81 = *(void *)(v84 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v84);
  uint64_t v69 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v67 = (uint64_t)&v66 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v82 = (uint64_t)&v66 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v80 = (uint64_t)&v66 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v68 = (uint64_t)&v66 - v20;
  uint64_t v21 = *a1;
  int v83 = *((unsigned __int8 *)a1 + 8);
  uint64_t v79 = *a2;
  uint64_t v72 = a2[1];
  uint64_t v73 = *((unsigned __int8 *)a2 + 16);
  uint64_t v71 = a2[3];
  unint64_t v76 = a2[4];
  uint64_t v22 = a2[5];
  unint64_t v23 = a2[6];
  uint64_t v70 = v22;
  uint64_t v74 = v3;
  uint64_t v24 = *(void *)(v3 + 16);
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v86 = MEMORY[0x263F8EE78];
  uint64_t v26 = *(void *)(v24 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v78 = a3;
  unint64_t v75 = v23;
  if (!v26)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v35 = *(void *)(v25 + 16);
    if (v35)
    {
      uint64_t v36 = v25 + 32;
      uint64_t v37 = (unsigned int (**)(char *, uint64_t, uint64_t))(v81 + 48);
      swift_retain();
      uint64_t v38 = (void *)MEMORY[0x263F8EE78];
      do
      {
        sub_2307CDEC4(v36, (uint64_t)&v87);
        uint64_t v39 = v89;
        unint64_t v40 = v90;
        __swift_project_boxed_opaque_existential_1(&v87, v89);
        *(void *)&v85[0] = v21;
        (*(void (**)(long long *, uint64_t, unint64_t))(v40 + 48))(v85, v39, v40);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v87);
        if ((*v37)(v10, 1, v84) == 1)
        {
          sub_2307CDF28((uint64_t)v10, &qword_26AF24868);
        }
        else
        {
          uint64_t v41 = v80;
          sub_2307CE37C((uint64_t)v10, v80);
          sub_2307CE37C(v41, v82);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v38 = (void *)sub_2307CEA54(0, v38[2] + 1, 1, v38);
          }
          unint64_t v43 = v38[2];
          unint64_t v42 = v38[3];
          if (v43 >= v42 >> 1) {
            uint64_t v38 = (void *)sub_2307CEA54(v42 > 1, v43 + 1, 1, v38);
          }
          v38[2] = v43 + 1;
          sub_2307CE37C(v82, (uint64_t)v38+ ((*(unsigned __int8 *)(v81 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80))+ *(void *)(v81 + 72) * v43);
        }
        v36 += 40;
        --v35;
      }
      while (v35);
      swift_release_n();
      uint64_t v44 = v74;
      uint64_t v45 = v84;
      char v46 = v83;
      uint64_t v47 = v73;
      uint64_t v48 = v72;
      uint64_t v49 = v71;
      uint64_t v50 = v70;
      a3 = v78;
    }
    else
    {
      swift_release();
      uint64_t v38 = (void *)MEMORY[0x263F8EE78];
      uint64_t v44 = v74;
      uint64_t v45 = v84;
      char v46 = v83;
      uint64_t v47 = v73;
      uint64_t v48 = v72;
      uint64_t v49 = v71;
      uint64_t v50 = v70;
    }
    *(void *)&long long v87 = v79;
    *((void *)&v87 + 1) = v48;
    uint64_t v88 = v47;
    uint64_t v89 = v49;
    unint64_t v90 = v76;
    uint64_t v91 = v50;
    unint64_t v92 = v75;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v51 = v77;
    sub_2307D1160((uint64_t)v38, (uint64_t *)&v87, v77);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v81 + 48))(v51, 1, v45) == 1)
    {
      sub_2307CDF28((uint64_t)v51, &qword_26AF24868);
    }
    else
    {
      uint64_t v52 = v68;
      uint64_t v53 = sub_2307CE37C((uint64_t)v51, v68);
      uint64_t v54 = MEMORY[0x270FA5388](v53);
      *(&v66 - 4) = v44;
      *(&v66 - 3) = v21;
      *((unsigned char *)&v66 - 16) = v46;
      *(&v66 - 1) = v52;
      MEMORY[0x270FA5388](v54);
      *(&v66 - 2) = (uint64_t)sub_23080E500;
      *(&v66 - 1) = v55;
      char v56 = v46;
      unint64_t v58 = v57 + 4;
      os_unfair_lock_lock(v57 + 4);
      sub_23080E20C(&v87);
      os_unfair_lock_unlock(v58);
      if (v87 == 1)
      {
        if ((v79 & 2) != 0)
        {
          uint64_t v59 = v67;
          sub_2307CE248(v52, v67);
          if (swift_getEnumCaseMultiPayload() == 3)
          {
            swift_bridgeObjectRelease();
            swift_storeEnumTagMultiPayload();
            return sub_2307CDFFC(v52, (uint64_t (*)(void))type metadata accessor for State);
          }
          sub_2307CDFFC(v59, (uint64_t (*)(void))type metadata accessor for State);
        }
        sub_2307CE248(v52, a3);
        return sub_2307CDFFC(v52, (uint64_t (*)(void))type metadata accessor for State);
      }
      sub_2307CDFFC(v52, (uint64_t (*)(void))type metadata accessor for State);
      char v46 = v56;
    }
    uint64_t v52 = (uint64_t)v69;
    uint64_t v60 = swift_storeEnumTagMultiPayload();
    long long v87 = 0uLL;
    LOBYTE(v88) = 1;
    uint64_t v89 = 0;
    unint64_t v90 = 0xE000000000000000;
    uint64_t v91 = 0;
    unint64_t v92 = 0xE000000000000000;
    uint64_t v61 = MEMORY[0x270FA5388](v60);
    *(&v66 - 6) = (uint64_t)&v87;
    *(&v66 - 5) = v44;
    *(&v66 - 4) = v21;
    *((unsigned char *)&v66 - 24) = v46;
    *(&v66 - 2) = v52;
    MEMORY[0x270FA5388](v61);
    *(&v66 - 2) = (uint64_t)sub_2307D3B08;
    *(&v66 - 1) = v62;
    uint64_t v64 = v63 + 4;
    os_unfair_lock_lock(v63 + 4);
    sub_2307CEDB4(v65);
    os_unfair_lock_unlock(v64);
    return sub_2307CDFFC(v52, (uint64_t (*)(void))type metadata accessor for State);
  }
  unint64_t v28 = 0;
  uint64_t v29 = v24 + 32;
  uint64_t v30 = MEMORY[0x263F8EE78];
  while (v28 < *(void *)(v24 + 16))
  {
    sub_2307CDEC4(v29, (uint64_t)&v87);
    uint64_t v32 = v89;
    unint64_t v31 = v90;
    __swift_project_boxed_opaque_existential_1(&v87, v89);
    *(void *)&v85[0] = v21;
    BYTE8(v85[0]) = v83;
    if ((*(uint64_t (**)(long long *, uint64_t, unint64_t))(v31 + 56))(v85, v32, v31))
    {
      sub_2307CDF84(&v87, (uint64_t)v85);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_2307CE798(0, *(void *)(v30 + 16) + 1, 1);
      }
      uint64_t v30 = v86;
      unint64_t v34 = *(void *)(v86 + 16);
      unint64_t v33 = *(void *)(v86 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_2307CE798((void *)(v33 > 1), v34 + 1, 1);
        uint64_t v30 = v86;
      }
      *(void *)(v30 + 16) = v34 + 1;
      uint64_t result = sub_2307CDF84(v85, v30 + 40 * v34 + 32);
    }
    else
    {
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v87);
    }
    ++v28;
    v29 += 40;
    if (v26 == v28)
    {
      uint64_t v25 = v86;
      a3 = v78;
      goto LABEL_13;
    }
  }
  __break(1u);
  return result;
}

uint64_t StorefrontAppStateController.canTransitionState(forApp:to:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_23080E20C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

void sub_230807A50(uint64_t a1@<X1>, unsigned char *a2@<X8>)
{
  uint64_t v6 = a1;
  uint64_t v4 = sub_2307CF19C(&v6)[4];
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 24));
  sub_23080EDE8((uint64_t *)(v4 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 24));
  if (v2)
  {
    __break(1u);
  }
  else
  {
    char v5 = v6;
    swift_release();
    swift_release();
    *a2 = v5;
  }
}

uint64_t StorefrontAppStateController.transitionState(forApp:to:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_23080E20C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t StorefrontAppStateController.postsChanges(forApp:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_23080E20C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t sub_230807C24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, unsigned __int8 *a4@<X8>)
{
  LOBYTE(v9) = a3 & 1;
  id v5 = *(id *)(a1 + 136);
  unsigned __int8 v6 = objc_msgSend(v5, sel_containsObject_, sub_2308128A8(), a2, v9);

  uint64_t result = swift_unknownObjectRelease();
  *a4 = v6;
  return result;
}

uint64_t StorefrontAppStateController.setWaiting(forApp:installationType:)(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v5 = type metadata accessor for State();
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v50 = &v45[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v45[-v9];
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (uint64_t)&v45[-v12];
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v45[-v14];
  uint64_t v16 = *a1;
  LODWORD(a1) = *((unsigned __int8 *)a1 + 8);
  int v17 = *a2;
  swift_storeEnumTagMultiPayload();
  v66[0] = 0;
  v66[1] = 0;
  uint64_t v18 = 1;
  char v67 = 1;
  uint64_t v68 = 0;
  unint64_t v69 = 0xE000000000000000;
  uint64_t v70 = 0;
  unint64_t v71 = 0xE000000000000000;
  uint64_t v19 = *(os_unfair_lock_s **)(v2 + 192);
  char v56 = v66;
  uint64_t v51 = v2;
  uint64_t v57 = v2;
  uint64_t v58 = v16;
  int v52 = (int)a1;
  char v59 = (char)a1;
  uint64_t v60 = v13;
  uint64_t v20 = v19 + 4;
  uint64_t v53 = sub_2307D3B08;
  uint64_t v54 = &v55;
  os_unfair_lock_lock(v19 + 4);
  sub_2307CEDB4(v21);
  uint64_t v49 = v20;
  uint64_t v22 = v20;
  char v23 = v17;
  os_unfair_lock_unlock(v22);
  sub_2307CDFFC(v13, (uint64_t (*)(void))type metadata accessor for State);
  *uint64_t v10 = v17;
  swift_storeEnumTagMultiPayload();
  LOBYTE(v13) = _s8AppState0B0O2eeoiySbAC_ACtFZ_0((uint64_t)v15, (uint64_t)v10);
  sub_2307CDFFC((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for State);
  sub_2307CDFFC((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for State);
  if (v13) {
    return v18;
  }
  uint64_t v48 = v5;
  uint64_t v24 = *(void *)(v51 + 16);
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v65 = MEMORY[0x263F8EE78];
  uint64_t v26 = *(void *)(v24 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v47 = 0;
  if (!v26)
  {
    uint64_t v36 = v51;
    uint64_t v35 = v50;
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v37 = *(void *)(v25 + 16);
    if (v37)
    {
      uint64_t v38 = v25 + 32;
      while (1)
      {
        sub_2307CDEC4(v38, (uint64_t)&v62);
        uint64_t v39 = v63;
        uint64_t v40 = v64;
        __swift_project_boxed_opaque_existential_1(&v62, v63);
        *(void *)&v61[0] = v16;
        LOBYTE(v65) = v23;
        if ((*(uint64_t (**)(long long *, uint64_t *, uint64_t, uint64_t))(v40 + 64))(v61, &v65, v39, v40)) {
          break;
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
        v38 += 40;
        if (!--v37) {
          goto LABEL_19;
        }
      }
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    }
    else
    {
LABEL_19:
      swift_release();
    }
    uint64_t v41 = v49;
    *uint64_t v35 = v23;
    uint64_t v42 = swift_storeEnumTagMultiPayload();
    uint64_t v43 = MEMORY[0x270FA5388](v42);
    *(void *)&v45[-32] = v36;
    *(void *)&v45[-24] = v16;
    v45[-16] = v52;
    *(void *)&v45[-8] = v35;
    MEMORY[0x270FA5388](v43);
    *(void *)&v45[-16] = sub_23080E518;
    *(void *)&v45[-8] = v44;
    os_unfair_lock_lock(v41);
    sub_23080E20C(&v62);
    os_unfair_lock_unlock(v41);
    uint64_t v18 = v62;
    sub_2307CDFFC((uint64_t)v35, (uint64_t (*)(void))type metadata accessor for State);
    return v18;
  }
  int v46 = v17;
  unint64_t v28 = 0;
  uint64_t v29 = v24 + 32;
  uint64_t v30 = MEMORY[0x263F8EE78];
  while (v28 < *(void *)(v24 + 16))
  {
    sub_2307CDEC4(v29, (uint64_t)&v62);
    uint64_t v32 = v63;
    uint64_t v31 = v64;
    __swift_project_boxed_opaque_existential_1(&v62, v63);
    *(void *)&v61[0] = v16;
    BYTE8(v61[0]) = v52;
    if ((*(uint64_t (**)(long long *, uint64_t, uint64_t))(v31 + 56))(v61, v32, v31))
    {
      sub_2307CDF84(&v62, (uint64_t)v61);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_2307CE798(0, *(void *)(v30 + 16) + 1, 1);
      }
      uint64_t v30 = v65;
      unint64_t v34 = *(void *)(v65 + 16);
      unint64_t v33 = *(void *)(v65 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_2307CE798((void *)(v33 > 1), v34 + 1, 1);
        uint64_t v30 = v65;
      }
      *(void *)(v30 + 16) = v34 + 1;
      uint64_t result = sub_2307CDF84(v61, v30 + 40 * v34 + 32);
    }
    else
    {
      uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
    }
    ++v28;
    v29 += 40;
    if (v26 == v28)
    {
      uint64_t v25 = v65;
      uint64_t v35 = v50;
      uint64_t v36 = v51;
      char v23 = v46;
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t StorefrontAppStateController.clearWaiting(forApp:refreshState:)(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)a1;
  char v5 = *(unsigned char *)(a1 + 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t v8 = *(void *)(v6 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  char v21 = a2;
  if (v8)
  {
    unint64_t v10 = 0;
    uint64_t v11 = v6 + 32;
    uint64_t v12 = MEMORY[0x263F8EE78];
    while (v10 < *(void *)(v6 + 16))
    {
      sub_2307CDEC4(v11, (uint64_t)&v23);
      uint64_t v13 = v24;
      uint64_t v14 = v25;
      __swift_project_boxed_opaque_existential_1(&v23, v24);
      *(void *)&v22[0] = v4;
      BYTE8(v22[0]) = v5;
      if ((*(uint64_t (**)(long long *, uint64_t, uint64_t))(v14 + 56))(v22, v13, v14))
      {
        sub_2307CDF84(&v23, (uint64_t)v22);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_2307CE798(0, *(void *)(v12 + 16) + 1, 1);
        }
        uint64_t v12 = v26;
        unint64_t v16 = *(void *)(v26 + 16);
        unint64_t v15 = *(void *)(v26 + 24);
        if (v16 >= v15 >> 1)
        {
          sub_2307CE798((void *)(v15 > 1), v16 + 1, 1);
          uint64_t v12 = v26;
        }
        *(void *)(v12 + 16) = v16 + 1;
        uint64_t result = sub_2307CDF84(v22, v12 + 40 * v16 + 32);
      }
      else
      {
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
      }
      ++v10;
      v11 += 40;
      if (v8 == v10)
      {
        uint64_t v7 = v26;
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void *)(v7 + 16);
    if (v17)
    {
      uint64_t v18 = v7 + 32;
      do
      {
        sub_2307CDEC4(v18, (uint64_t)&v23);
        uint64_t v19 = v24;
        uint64_t v20 = v25;
        __swift_project_boxed_opaque_existential_1(&v23, v24);
        *(void *)&v22[0] = v4;
        (*(void (**)(long long *, uint64_t, uint64_t))(v20 + 72))(v22, v19, v20);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
        v18 += 40;
        --v17;
      }
      while (v17);
    }
    swift_release();
    if (v21) {
      sub_2308083D4(v4);
    }
    return 1;
  }
  return result;
}

uint64_t sub_2308083D4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2308120B8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2308120D8();
  uint64_t v8 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = *(void *)(v2 + 200);
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_23080EDBC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2308047A8;
  aBlock[3] = &block_descriptor_4;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  sub_2308120C8();
  uint64_t v17 = MEMORY[0x263F8EE78];
  sub_2307C95F4(&qword_26AF24B10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B78);
  sub_2307CB7DC(&qword_26AF24B80, &qword_26AF24B78);
  sub_230812708();
  MEMORY[0x230FBF310](0, v10, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v16);
  swift_release();
  return swift_release();
}

uint64_t StorefrontAppStateController.refreshUpdateRegistry(forApp:with:)(uint64_t *a1, uint64_t a2)
{
  *(void *)(v3 + 280) = v2;
  *(void *)(v3 + 288) = *v2;
  *(void *)(v3 + 296) = type metadata accessor for State();
  *(void *)(v3 + 304) = swift_task_alloc();
  *(void *)(v3 + 312) = swift_task_alloc();
  *(void *)(v3 + 320) = swift_task_alloc();
  sub_230812178();
  *(void *)(v3 + 328) = swift_task_alloc();
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = *a1;
  *(void *)(v3 + 336) = v6;
  *(void *)(v3 + 344) = v7;
  *(unsigned char *)(v3 + 396) = *((unsigned char *)a1 + 8);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 32) = v8;
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(void *)(v3 + 64) = *(void *)(a2 + 48);
  return MEMORY[0x270FA2498](sub_230808810, 0, 0);
}

uint64_t sub_230808810()
{
  uint64_t v49 = v0;
  uint64_t v1 = (long long *)(v0 + 16);
  char v2 = *(unsigned char *)(v0 + 396);
  uint64_t v3 = *(void *)(v0 + 344);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v5 = *(os_unfair_lock_s **)(v4 + 192);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = v4;
  *(void *)(v6 + 24) = v3;
  *(unsigned char *)(v6 + 32) = v2;
  *(void *)(v6 + 40) = v0 + 16;
  uint64_t v7 = swift_task_alloc();
  *(void *)(v7 + 16) = sub_23080E550;
  *(void *)(v7 + 24) = v6;
  long long v8 = v5 + 4;
  os_unfair_lock_lock(v5 + 4);
  sub_2307CEDB4(v9);
  os_unfair_lock_unlock(v5 + 4);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_23080E574(v0 + 16);
  uint64_t v10 = sub_2307F7F70();
  LOBYTE(v3) = v11;
  sub_23080E5AC(v0 + 16);
  if ((v3 & 1) == 0)
  {
    uint64_t v12 = *(void *)(v0 + 344);
    uint64_t v13 = *(void **)(v0 + 280);
    uint64_t v14 = v13[14];
    uint64_t v15 = v13[15];
    uint64_t v39 = v13;
    uint64_t v40 = v13 + 11;
    __swift_project_boxed_opaque_existential_1(v13 + 11, v14);
    v48[0] = v12;
    (*(void (**)(long long *__return_ptr, void *, uint64_t, uint64_t))(v15 + 8))(&v44, v48, v14, v15);
    if (!(void)v45 || (uint64_t v16 = v44, swift_bridgeObjectRelease(), v16 < v10))
    {
      uint64_t v38 = v10;
      uint64_t v42 = *(void *)(v0 + 344);
      uint64_t v17 = *(void *)(v0 + 280);
      uint64_t v41 = *(void *)(v0 + 288);
      uint64_t v43 = *(void *)(v0 + 312);
      __swift_project_boxed_opaque_existential_1((void *)(v17 + 152), *(void *)(v17 + 176));
      *(void *)(v0 + 352) = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
      uint64_t v18 = *(void *)(sub_230812198() - 8);
      *(void *)(v0 + 360) = *(void *)(v18 + 72);
      *(_DWORD *)(v0 + 392) = *(_DWORD *)(v18 + 80);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
      sub_230812168();
      sub_230812158();
      *(void *)(v0 + 176) = v41;
      *(void *)(v0 + 152) = v17;
      swift_retain();
      sub_230812128();
      sub_2307CDF28(v0 + 152, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      sub_230812188();
      sub_230812168();
      sub_230812158();
      *(void *)(v0 + 144) = &type metadata for App;
      *(void *)(v0 + 120) = v42;
      *(unsigned char *)(v0 + 128) = v2;
      sub_230812128();
      sub_2307CDF28(v0 + 120, (uint64_t *)&unk_26AF24CA8);
      sub_230812158();
      sub_230812188();
      sub_2308122B8();
      swift_bridgeObjectRelease();
      swift_storeEnumTagMultiPayload();
      uint64_t v19 = swift_task_alloc();
      *(void *)(v19 + 16) = v1;
      *(void *)(v19 + 24) = v17;
      *(void *)(v19 + 32) = v42;
      *(unsigned char *)(v19 + 40) = v2;
      *(void *)(v19 + 48) = v43;
      uint64_t v20 = swift_task_alloc();
      *(void *)(v20 + 16) = sub_2307D3B08;
      *(void *)(v20 + 24) = v19;
      os_unfair_lock_lock(v8);
      sub_2307CEDB4(v21);
      os_unfair_lock_unlock(v8);
      swift_task_dealloc();
      uint64_t v22 = (uint64_t *)(v0 + 320);
      uint64_t v24 = *(void *)(v0 + 312);
      uint64_t v23 = *(void *)(v0 + 320);
      uint64_t v25 = *(void *)(v0 + 304);
      swift_task_dealloc();
      sub_2307CDFFC(v24, (uint64_t (*)(void))type metadata accessor for State);
      sub_2307CE248(v23, v25);
      if (swift_getEnumCaseMultiPayload() == 5)
      {
        uint64_t v26 = *(void *)(*(void *)(v0 + 304) + 8);
        if (v26 && v26 < v38)
        {
          uint64_t v27 = *(void *)(v0 + 344);
          uint64_t v28 = v39[14];
          uint64_t v29 = v39[15];
          __swift_project_boxed_opaque_existential_1(v40, v28);
          long long v30 = *(_OWORD *)(v0 + 32);
          long long v44 = *v1;
          long long v45 = v30;
          long long v46 = *(_OWORD *)(v0 + 48);
          uint64_t v47 = *(void *)(v0 + 64);
          uint64_t v31 = sub_2307E31E4();
          *(void *)&long long v44 = v38;
          *((void *)&v44 + 1) = v31;
          *(void *)&long long v45 = v32;
          v48[0] = v27;
          (*(void (**)(long long *, void *, uint64_t, uint64_t))(v29 + 16))(&v44, v48, v28, v29);
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_268703160);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_230813840;
          *(void *)(inited + 32) = v27;
          *(unsigned char *)(inited + 40) = v2;
          uint64_t v34 = sub_23080E700(inited);
          *(void *)(v0 + 368) = v34;
          swift_setDeallocating();
          uint64_t v35 = (void *)swift_task_alloc();
          *(void *)(v0 + 376) = v35;
          *uint64_t v35 = v0;
          v35[1] = sub_230808E20;
          return StorefrontAppStateController.reloadState(forApps:synchronizing:)(v34, 1);
        }
      }
      else
      {
        sub_2307CDFFC(*v22, (uint64_t (*)(void))type metadata accessor for State);
        uint64_t v22 = (uint64_t *)(v0 + 304);
      }
      sub_2307CDFFC(*v22, (uint64_t (*)(void))type metadata accessor for State);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v37 = *(uint64_t (**)(void))(v0 + 8);
  return v37();
}

uint64_t sub_230808E20()
{
  *(void *)(*(void *)v1 + 384) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v2 = sub_230808FE8;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v2 = sub_230808F3C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_230808F3C()
{
  sub_2307CDFFC(*(void *)(v0 + 320), (uint64_t (*)(void))type metadata accessor for State);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_230808FE8()
{
  long long v8 = *(void **)(v0 + 384);
  char v1 = *(unsigned char *)(v0 + 396);
  uint64_t v2 = *(void *)(v0 + 344);
  uint64_t v3 = *(void *)(v0 + 280);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((void *)(v3 + 152), *(void *)(v3 + 176));
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  *(void *)(v0 + 208) = &type metadata for App;
  *(void *)(v0 + 184) = v2;
  *(unsigned char *)(v0 + 192) = v1;
  sub_230812128();
  sub_2307CDF28(v0 + 184, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v4 = sub_2308128F8();
  *(void *)(v0 + 240) = MEMORY[0x263F8D310];
  *(void *)(v0 + 216) = v4;
  *(void *)(v0 + 224) = v5;
  sub_230812128();
  sub_2307CDF28(v0 + 216, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();
  swift_bridgeObjectRelease();

  sub_2307CDFFC(*(void *)(v0 + 320), (uint64_t (*)(void))type metadata accessor for State);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t StorefrontAppStateController.isLocal(app:)(uint64_t *a1)
{
  uint64_t v31 = type metadata accessor for State();
  uint64_t v3 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v30 = (uint64_t)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = *a1;
  char v8 = *((unsigned char *)a1 + 8);
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v37 = MEMORY[0x263F8EE78];
  uint64_t v11 = *(void *)(v9 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  if (v11)
  {
    uint64_t v29 = v3;
    unint64_t v13 = 0;
    uint64_t v14 = v9 + 32;
    uint64_t v15 = MEMORY[0x263F8EE78];
    do
    {
      if (v13 >= *(void *)(v9 + 16))
      {
        __break(1u);
        return result;
      }
      sub_2307CDEC4(v14, (uint64_t)&v34);
      uint64_t v16 = v35;
      uint64_t v17 = v36;
      __swift_project_boxed_opaque_existential_1(&v34, v35);
      *(void *)&v33[0] = v32;
      BYTE8(v33[0]) = v8;
      if ((*(uint64_t (**)(long long *, uint64_t, uint64_t))(v17 + 56))(v33, v16, v17))
      {
        sub_2307CDF84(&v34, (uint64_t)v33);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_2307CE798(0, *(void *)(v15 + 16) + 1, 1);
        }
        uint64_t v15 = v37;
        unint64_t v19 = *(void *)(v37 + 16);
        unint64_t v18 = *(void *)(v37 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_2307CE798((void *)(v18 > 1), v19 + 1, 1);
          uint64_t v15 = v37;
        }
        *(void *)(v15 + 16) = v19 + 1;
        uint64_t result = sub_2307CDF84(v33, v15 + 40 * v19 + 32);
      }
      else
      {
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
      }
      ++v13;
      v14 += 40;
    }
    while (v11 != v13);
    uint64_t v10 = v37;
    uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void *)(v10 + 16);
  if (!v20)
  {
LABEL_25:
    swift_release();
    return 0;
  }
  uint64_t v21 = v10 + 32;
  uint64_t v22 = (unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  swift_retain();
  uint64_t v23 = 1;
  while (1)
  {
    sub_2307CDEC4(v21, (uint64_t)&v34);
    uint64_t v24 = v35;
    uint64_t v25 = v36;
    __swift_project_boxed_opaque_existential_1(&v34, v35);
    *(void *)&v33[0] = v32;
    (*(void (**)(long long *, uint64_t, uint64_t))(v25 + 48))(v33, v24, v25);
    if ((*v22)(v7, 1, v31) == 1)
    {
      sub_2307CDF28((uint64_t)v7, &qword_26AF24868);
      goto LABEL_21;
    }
    sub_2307CE248((uint64_t)v7, v30);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 7 || EnumCaseMultiPayload == 5) {
      goto LABEL_28;
    }
    if (EnumCaseMultiPayload == 2) {
      break;
    }
    sub_2307CDFFC(v30, (uint64_t (*)(void))type metadata accessor for State);
    sub_2307CDFFC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for State);
LABEL_21:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    if (v20 == v23)
    {
      swift_release_n();
      return 0;
    }
    v21 += 40;
    if (__OFADD__(v23++, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
  }
  sub_2307CDFFC(v30, (uint64_t (*)(void))type metadata accessor for State);
LABEL_28:
  sub_2307CDFFC((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for State);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
  swift_release_n();
  return 1;
}

uint64_t StorefrontAppStateController.isRedownloadable(app:includingPreorders:)(uint64_t *a1, int a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  char v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v31 - v9;
  uint64_t v33 = *a1;
  char v11 = *((unsigned char *)a1 + 8);
  uint64_t v12 = *(void *)(v2 + 16);
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t v38 = MEMORY[0x263F8EE78];
  uint64_t v14 = *(void *)(v12 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  int v32 = a2;
  uint64_t v31 = v8;
  if (v14)
  {
    unint64_t v16 = 0;
    uint64_t v17 = v12 + 32;
    uint64_t v18 = MEMORY[0x263F8EE78];
    do
    {
      if (v16 >= *(void *)(v12 + 16))
      {
        __break(1u);
        return result;
      }
      sub_2307CDEC4(v17, (uint64_t)&v35);
      uint64_t v19 = v36;
      uint64_t v20 = v37;
      __swift_project_boxed_opaque_existential_1(&v35, v36);
      *(void *)&v34[0] = v33;
      BYTE8(v34[0]) = v11;
      if ((*(uint64_t (**)(long long *, uint64_t, uint64_t))(v20 + 56))(v34, v19, v20))
      {
        sub_2307CDF84(&v35, (uint64_t)v34);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_2307CE798(0, *(void *)(v18 + 16) + 1, 1);
        }
        uint64_t v18 = v38;
        unint64_t v22 = *(void *)(v38 + 16);
        unint64_t v21 = *(void *)(v38 + 24);
        if (v22 >= v21 >> 1)
        {
          sub_2307CE798((void *)(v21 > 1), v22 + 1, 1);
          uint64_t v18 = v38;
        }
        *(void *)(v18 + 16) = v22 + 1;
        uint64_t result = sub_2307CDF84(v34, v18 + 40 * v22 + 32);
      }
      else
      {
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
      }
      ++v16;
      v17 += 40;
    }
    while (v14 != v16);
    uint64_t v13 = v38;
  }
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void *)(v13 + 16);
  if (!v23)
  {
    swift_release();
    return 0;
  }
  uint64_t v24 = v13 + 32;
  swift_retain();
  char v25 = v32;
  uint64_t v26 = v31;
  while (1)
  {
    sub_2307CDEC4(v24, (uint64_t)&v35);
    uint64_t v27 = v36;
    uint64_t v28 = v37;
    __swift_project_boxed_opaque_existential_1(&v35, v36);
    *(void *)&v34[0] = v33;
    (*(void (**)(long long *, uint64_t, uint64_t))(v28 + 48))(v34, v27, v28);
    uint64_t v29 = type metadata accessor for State();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48))(v10, 1, v29) == 1) {
      goto LABEL_17;
    }
    sub_2307D5154((uint64_t)v10, (uint64_t)v26, &qword_26AF24868);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 1) {
      break;
    }
    if (*v26 == 1 && (v25 & 1) != 0) {
      goto LABEL_26;
    }
LABEL_17:
    sub_2307CDF28((uint64_t)v10, &qword_26AF24868);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
    v24 += 40;
    if (!--v23)
    {
      swift_release_n();
      return 0;
    }
  }
  if (EnumCaseMultiPayload != 3)
  {
    sub_2307CDFFC((uint64_t)v26, (uint64_t (*)(void))type metadata accessor for State);
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
LABEL_26:
  sub_2307CDF28((uint64_t)v10, &qword_26AF24868);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
  swift_release_n();
  return 1;
}

uint64_t StorefrontAppStateController.purchaseHistoryIncludes(app:)(uint64_t *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  char v8 = (char *)&v28 - v7;
  uint64_t v30 = *a1;
  char v9 = *((unsigned char *)a1 + 8);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = MEMORY[0x263F8EE78];
  uint64_t v35 = MEMORY[0x263F8EE78];
  uint64_t v12 = *(void *)(v10 + 16);
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v29 = v6;
  if (v12)
  {
    unint64_t v14 = 0;
    uint64_t v15 = v10 + 32;
    uint64_t v16 = MEMORY[0x263F8EE78];
    do
    {
      if (v14 >= *(void *)(v10 + 16))
      {
        __break(1u);
        return result;
      }
      sub_2307CDEC4(v15, (uint64_t)&v32);
      uint64_t v17 = v33;
      uint64_t v18 = v34;
      __swift_project_boxed_opaque_existential_1(&v32, v33);
      *(void *)&v31[0] = v30;
      BYTE8(v31[0]) = v9;
      if ((*(uint64_t (**)(long long *, uint64_t, uint64_t))(v18 + 56))(v31, v17, v18))
      {
        sub_2307CDF84(&v32, (uint64_t)v31);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_2307CE798(0, *(void *)(v16 + 16) + 1, 1);
        }
        uint64_t v16 = v35;
        unint64_t v20 = *(void *)(v35 + 16);
        unint64_t v19 = *(void *)(v35 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_2307CE798((void *)(v19 > 1), v20 + 1, 1);
          uint64_t v16 = v35;
        }
        *(void *)(v16 + 16) = v20 + 1;
        uint64_t result = sub_2307CDF84(v31, v16 + 40 * v20 + 32);
      }
      else
      {
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
      }
      ++v14;
      v15 += 40;
    }
    while (v12 != v14);
    uint64_t v11 = v35;
  }
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void *)(v11 + 16);
  if (!v21)
  {
    swift_release();
    return 0;
  }
  uint64_t v22 = v11 + 32;
  swift_retain();
  uint64_t v23 = v29;
  while (1)
  {
    sub_2307CDEC4(v22, (uint64_t)&v32);
    uint64_t v24 = v33;
    uint64_t v25 = v34;
    __swift_project_boxed_opaque_existential_1(&v32, v33);
    *(void *)&v31[0] = v30;
    (*(void (**)(long long *, uint64_t, uint64_t))(v25 + 48))(v31, v24, v25);
    uint64_t v26 = type metadata accessor for State();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 48))(v8, 1, v26) == 1) {
      goto LABEL_16;
    }
    sub_2307D5154((uint64_t)v8, (uint64_t)v23, &qword_26AF24868);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload != 1) {
      break;
    }
    if ((*v23 & 1) == 0) {
      goto LABEL_24;
    }
LABEL_16:
    sub_2307CDF28((uint64_t)v8, &qword_26AF24868);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
    v22 += 40;
    if (!--v21)
    {
      swift_release_n();
      return 0;
    }
  }
  if (EnumCaseMultiPayload != 3)
  {
    sub_2307CDFFC((uint64_t)v23, (uint64_t (*)(void))type metadata accessor for State);
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
LABEL_24:
  sub_2307CDF28((uint64_t)v8, &qword_26AF24868);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v32);
  swift_release_n();
  return 1;
}

uint64_t sub_230809D30(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v16 = sub_230812098();
  uint64_t v5 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_230812178();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v24 = a1;
  __swift_project_boxed_opaque_existential_1(v2 + 19, v2[22]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230813840;
  sub_230812168();
  sub_230812158();
  uint64_t v23 = v4;
  v22[0] = v1;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)v22, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  uint64_t v23 = MEMORY[0x263F8D6C8];
  v22[0] = 1;
  sub_230812128();
  sub_2307CDF28((uint64_t)v22, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122C8();
  swift_bridgeObjectRelease();
  sub_2307CB7A0(0, (unint64_t *)&unk_26AF24C00);
  sub_2308126B8();
  sub_230812088();
  sub_230812678();
  char v9 = (void *)sub_2308126B8();
  sub_230812078();

  uint64_t v10 = (os_unfair_lock_s *)v2[24];
  unint64_t v20 = v2;
  uint64_t v21 = &v24;
  uint64_t v17 = sub_23080EDC8;
  uint64_t v18 = &v19;
  uint64_t v11 = v10 + 4;
  os_unfair_lock_lock(v10 + 4);
  sub_2307CEDB4(v12);
  os_unfair_lock_unlock(v11);
  sub_230812668();
  uint64_t v13 = (void *)sub_2308126B8();
  sub_230812078();

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v16);
}

uint64_t (*sub_23080A0D0(uint64_t a1))(void *a1)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_23080F130;
  *(void *)(v2 + 24) = a1;
  swift_retain();
  return sub_23080F134;
}

uint64_t sub_23080A148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  void v6[5] = a4;
  id v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x270FA2498](sub_2307C632C, 0, 0);
}

uint64_t sub_23080A170()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 6;
  uint64_t v15 = v0 + 10;
  unint64_t v14 = (void *)v0[25];
  uint64_t v3 = v0[21];
  uint64_t v4 = v1[20];
  uint64_t v13 = (void *)v1[18];
  __swift_project_boxed_opaque_existential_1((void *)v1[19], *(void *)(v1[19] + 24));
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C90);
  sub_230812198();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_230814440;
  sub_230812168();
  sub_230812158();
  v1[5] = v3;
  v1[2] = v4;
  swift_retain();
  sub_230812128();
  sub_2307CDF28((uint64_t)(v1 + 2), (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_230812168();
  sub_230812158();
  uint64_t v5 = v13[3];
  uint64_t v6 = __swift_project_boxed_opaque_existential_1(v13, v5);
  v1[9] = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v2);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(boxed_opaque_existential_0, v6, v5);
  sub_230812128();
  sub_2307CDF28((uint64_t)v2, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  swift_getErrorValue();
  uint64_t v8 = v1[14];
  uint64_t v9 = v1[15];
  v1[13] = v9;
  uint64_t v10 = __swift_allocate_boxed_opaque_existential_0(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(v10, v8, v9);
  sub_230812128();
  sub_2307CDF28((uint64_t)v15, (uint64_t *)&unk_26AF24CA8);
  sub_230812158();
  sub_230812188();
  sub_2308122D8();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v1[1];
  return v11();
}

void sub_23080A488(unsigned int (**a1)(char *, uint64_t, uint64_t), uint64_t a2)
{
  uint64_t v121 = a2;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24608);
  MEMORY[0x270FA5388](v93);
  unint64_t v92 = (uint64_t *)((char *)&v87 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v91 = type metadata accessor for AppStateMachine.StateChange();
  MEMORY[0x270FA5388](v91);
  unint64_t v90 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24878);
  MEMORY[0x270FA5388](v97);
  uint64_t v6 = (uint64_t *)((char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  unint64_t v10 = (unint64_t)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (uint64_t *)((char *)&v87 - v12);
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v108 = (uint64_t)&v87 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  size_t v18 = (size_t)&v87 - v17;
  MEMORY[0x270FA5388](v16);
  unint64_t v20 = (char *)&v87 - v19;
  uint64_t v21 = type metadata accessor for State();
  uint64_t v116 = *(void *)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  uint64_t v102 = (uint64_t)&v87 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v95 = (uint64_t)&v87 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v89 = (char *)&v87 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v88 = (uint64_t)&v87 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v117 = (uint64_t)&v87 - v31;
  MEMORY[0x270FA5388](v30);
  uint64_t v115 = (uint64_t)&v87 - v32;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B70);
  sub_230812408();
  swift_endAccess();
  if (qword_26AF24098 != -1) {
LABEL_60:
  }
    swift_once();
  uint64_t v33 = qword_26AF25968;
  uint64_t v106 = *(void *)(qword_26AF25968 + 16);
  if (!v106) {
    return;
  }
  uint64_t v100 = (uint64_t *)(a1 + 16);
  unint64_t v111 = a1;
  uint64_t v34 = a1[2];
  uint64_t v118 = (void *)*((void *)v34 + 2);
  uint64_t v105 = qword_26AF25968 + 32;
  uint64_t v114 = v34;
  size_t v98 = (size_t)v34 + 32;
  a1 = (unsigned int (**)(char *, uint64_t, uint64_t))(v116 + 48);
  uint64_t v96 = v116 + 56;
  swift_bridgeObjectRetain();
  unint64_t v35 = 0;
  uint64_t v112 = v6;
  uint64_t v101 = (uint64_t *)v10;
  size_t v103 = v18;
  uint64_t v119 = v21;
  uint64_t v104 = v33;
  uint64_t v99 = (unsigned int (**)(uint64_t *, uint64_t, uint64_t))a1;
  uint64_t v94 = v13;
  while (1)
  {
    if (v35 >= *(void *)(v33 + 16)) {
      goto LABEL_59;
    }
    unint64_t v113 = v35;
    unsigned int v120 = *(unsigned __int8 *)(v105 + v35);
    uint64_t v21 = MEMORY[0x263F8EE78];
    uint64_t v129 = MEMORY[0x263F8EE78];
    uint64_t v36 = v114;
    swift_bridgeObjectRetain();
    if (v118)
    {
      uint64_t v13 = 0;
      size_t v18 = v98;
      while ((unint64_t)v13 < *((void *)v36 + 2))
      {
        sub_2307CDEC4(v18, (uint64_t)&v122);
        uint64_t v6 = v124;
        unint64_t v10 = v125;
        __swift_project_boxed_opaque_existential_1(&v122, (uint64_t)v124);
        *(void *)&long long v128 = v121;
        BYTE8(v128) = v120;
        if ((*(uint64_t (**)(long long *, uint64_t *, unint64_t))(v10 + 56))(&v128, v6, v10))
        {
          sub_2307CDF84(&v122, (uint64_t)&v128);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_2307CE798(0, *(void *)(v21 + 16) + 1, 1);
          }
          uint64_t v21 = v129;
          unint64_t v10 = *(void *)(v129 + 16);
          unint64_t v37 = *(void *)(v129 + 24);
          uint64_t v6 = (uint64_t *)(v10 + 1);
          if (v10 >= v37 >> 1)
          {
            sub_2307CE798((void *)(v37 > 1), v10 + 1, 1);
            uint64_t v21 = v129;
          }
          *(void *)(v21 + 16) = v6;
          sub_2307CDF84(&v128, v21 + 40 * v10 + 32);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v122);
        }
        uint64_t v13 = (void *)((char *)v13 + 1);
        v18 += 40;
        if (v118 == v13)
        {
          uint64_t v38 = v129;
          uint64_t v21 = MEMORY[0x263F8EE78];
          goto LABEL_20;
        }
      }
      __break(1u);
LABEL_59:
      __break(1u);
      goto LABEL_60;
    }
    uint64_t v38 = v21;
LABEL_20:
    swift_bridgeObjectRelease();
    uint64_t v39 = *(void *)(v38 + 16);
    if (v39)
    {
      size_t v18 = v21;
      uint64_t v40 = v38 + 32;
      swift_retain();
      do
      {
        sub_2307CDEC4(v40, (uint64_t)&v122);
        uint64_t v41 = (uint64_t)v124;
        unint64_t v42 = v125;
        __swift_project_boxed_opaque_existential_1(&v122, (uint64_t)v124);
        *(void *)&long long v128 = v121;
        (*(void (**)(long long *, uint64_t, unint64_t))(v42 + 48))(&v128, v41, v42);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v122);
        if ((*a1)(v20, 1, v119) == 1)
        {
          sub_2307CDF28((uint64_t)v20, &qword_26AF24868);
        }
        else
        {
          uint64_t v43 = v115;
          sub_2307CE37C((uint64_t)v20, v115);
          sub_2307CE37C(v43, v117);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            size_t v18 = sub_2307CEA54(0, *(void *)(v18 + 16) + 1, 1, (void *)v18);
          }
          unint64_t v45 = *(void *)(v18 + 16);
          unint64_t v44 = *(void *)(v18 + 24);
          if (v45 >= v44 >> 1) {
            size_t v18 = sub_2307CEA54(v44 > 1, v45 + 1, 1, (void *)v18);
          }
          *(void *)(v18 + 16) = v45 + 1;
          sub_2307CE37C(v117, v18+ ((*(unsigned __int8 *)(v116 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v116 + 80))+ *(void *)(v116 + 72) * v45);
        }
        v40 += 40;
        --v39;
      }
      while (v39);
      swift_release_n();
    }
    else
    {
      swift_release();
      size_t v18 = v21;
    }
    uint64_t v46 = (uint64_t)v112;
    uint64_t v47 = v108;
    uint64_t v48 = v103;
    uint64_t v49 = v119;
    if (*(void *)(v18 + 16) == 1)
    {
      uint64_t v50 = v116;
      sub_2307CE248(v18 + ((*(unsigned __int8 *)(v116 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v116 + 80)), v103);
      uint64_t v51 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56);
      v51(v48, 0, 1, v49);
      swift_storeEnumTagMultiPayload();
      v51(v47, 0, 1, v49);
      uint64_t v52 = v46 + *(int *)(v97 + 48);
      sub_2307D5154(v48, v46, &qword_26AF24868);
      sub_2307D5154(v47, v52, &qword_26AF24868);
      uint64_t v53 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v116 + 48);
      if (v53(v46, 1, v49) == 1)
      {
        sub_2307CDF28(v47, &qword_26AF24868);
        sub_2307CDF28(v48, &qword_26AF24868);
        if (v53(v52, 1, v49) == 1)
        {
          sub_2307CDF28((uint64_t)v112, &qword_26AF24868);
LABEL_50:
          swift_bridgeObjectRelease();
          *(void *)&long long v122 = v121;
          uint64_t v13 = sub_2307CF19C((uint64_t *)&v122);
          uint64_t v75 = (uint64_t)v89;
          uint64_t v76 = swift_storeEnumTagMultiPayload();
          uint64_t v77 = (os_unfair_lock_s *)v13[4];
          MEMORY[0x270FA5388](v76);
          size_t v18 = v120;
          *((unsigned char *)&v87 - 16) = v120;
          *(&v87 - 1) = v75;
          unint64_t v110 = v77 + 4;
          unint64_t v10 = (unint64_t)&v77[6];
          swift_retain();
          os_unfair_lock_lock(v77 + 6);
          uint64_t v78 = v107;
          sub_2307CFBD8((uint64_t)v110);
          unint64_t v110 = (os_unfair_lock_s *)v78;
          if (v78) {
            goto LABEL_62;
          }
          os_unfair_lock_unlock(v77 + 6);
          swift_release();
          uint64_t v79 = v13[2];
          uint64_t v80 = (uint64_t)v90;
          swift_storeEnumTagMultiPayload();
          *(void *)uint64_t v80 = v79;
          *(unsigned char *)(v80 + 8) = v18;
          sub_2308120F8();
          sub_2307CDFFC(v80, (uint64_t (*)(void))type metadata accessor for AppStateMachine.StateChange);
          uint64_t v81 = sub_2307CDFFC(v75, (uint64_t (*)(void))type metadata accessor for State);
          uint64_t v82 = v13[4];
          MEMORY[0x270FA5388](v81);
          *((unsigned char *)&v87 - 16) = v18;
          uint64_t v21 = v82 + 16;
          unint64_t v10 = v82 + 24;
          swift_retain();
          os_unfair_lock_lock((os_unfair_lock_t)(v82 + 24));
          uint64_t v83 = (uint64_t)v110;
          sub_2307CF754((uint64_t *)(v82 + 16), v95);
          uint64_t v107 = v83;
          if (v83) {
            goto LABEL_62;
          }
          os_unfair_lock_unlock((os_unfair_lock_t)(v82 + 24));
          swift_release();
          uint64_t v84 = v111[17];
          *(void *)&long long v122 = v121;
          BYTE8(v122) = v18;
          uint64_t v85 = v84;
          uint64_t v6 = (uint64_t *)sub_2308128A8();
          unint64_t v10 = (unint64_t)objc_msgSend(v85, sel_containsObject_, v6);

          swift_unknownObjectRelease();
          if (v10)
          {
            uint64_t v6 = v92;
            uint64_t v86 = (uint64_t)v92 + *(int *)(v93 + 48);
            *unint64_t v92 = v121;
            *((unsigned char *)v6 + 8) = v18;
            sub_2307CE248(v95, v86);
            sub_2308120F8();
            sub_2307CDF28((uint64_t)v6, &qword_26AF24608);
          }
          swift_release();
          sub_2307CDFFC(v95, (uint64_t (*)(void))type metadata accessor for State);
          goto LABEL_55;
        }
        goto LABEL_38;
      }
      uint64_t v54 = (uint64_t)v94;
      sub_2307D5154((uint64_t)v112, (uint64_t)v94, &qword_26AF24868);
      if (v53(v52, 1, v49) == 1)
      {
        sub_2307CDF28(v108, &qword_26AF24868);
        sub_2307CDF28(v48, &qword_26AF24868);
        sub_2307CDFFC(v54, (uint64_t (*)(void))type metadata accessor for State);
LABEL_38:
        sub_2307CDF28((uint64_t)v112, &qword_26AF24878);
        goto LABEL_39;
      }
      uint64_t v72 = v52;
      uint64_t v73 = v88;
      sub_2307CE37C(v72, v88);
      char v74 = _s8AppState0B0O2eeoiySbAC_ACtFZ_0(v54, v73);
      sub_2307CDFFC(v73, (uint64_t (*)(void))type metadata accessor for State);
      sub_2307CDF28(v108, &qword_26AF24868);
      sub_2307CDF28(v48, &qword_26AF24868);
      sub_2307CDFFC(v54, (uint64_t (*)(void))type metadata accessor for State);
      sub_2307CDF28((uint64_t)v112, &qword_26AF24868);
      if (v74) {
        goto LABEL_50;
      }
    }
LABEL_39:
    char v55 = v100;
    swift_beginAccess();
    uint64_t v56 = *v55;
    if (*(void *)(v56 + 16) && (unint64_t v57 = sub_2307F5570(v121, v120), (v58 & 1) != 0))
    {
      uint64_t v59 = *(void *)(v56 + 56) + 56 * v57;
      unint64_t v10 = *(void *)v59;
      uint64_t v13 = *(void **)(v59 + 8);
      uint64_t v21 = *(unsigned __int8 *)(v59 + 16);
      uint64_t v61 = *(void *)(v59 + 24);
      uint64_t v60 = *(void *)(v59 + 32);
      uint64_t v62 = *(void *)(v59 + 40);
      uint64_t v63 = *(void *)(v59 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v10 = 0;
      uint64_t v13 = 0;
      uint64_t v21 = 0;
      uint64_t v61 = 0;
      uint64_t v60 = 0;
      uint64_t v62 = 0;
      uint64_t v63 = 0;
    }
    uint64_t v109 = v62;
    unint64_t v110 = (os_unfair_lock_s *)v63;
    swift_endAccess();
    *(void *)&long long v122 = v10;
    *((void *)&v122 + 1) = v13;
    uint64_t v123 = v21;
    char v124 = (uint64_t *)v61;
    unint64_t v125 = v60;
    uint64_t v126 = v62;
    uint64_t v127 = v63;
    uint64_t v6 = v101;
    sub_2307D1160(v18, (uint64_t *)&v122, v101);
    swift_bridgeObjectRelease();
    sub_2307CFCE0(v10, (uint64_t)v13, v21, v61, v60);
    a1 = (unsigned int (**)(char *, uint64_t, uint64_t))v99;
    if ((*v99)(v6, 1, v119) != 1) {
      break;
    }
    sub_2307CDF28((uint64_t)v6, &qword_26AF24868);
LABEL_55:
    uint64_t v33 = v104;
LABEL_5:
    unint64_t v35 = v113 + 1;
    if (v113 + 1 == v106)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  uint64_t v64 = v102;
  sub_2307CE37C((uint64_t)v6, v102);
  *(void *)&long long v122 = v121;
  unint64_t v10 = (unint64_t)sub_2307CF19C((uint64_t *)&v122);
  uint64_t v21 = (uint64_t)&v87;
  uint64_t v6 = *(uint64_t **)(v10 + 32);
  uint64_t v65 = MEMORY[0x270FA5388](v10);
  *((unsigned char *)&v87 - 32) = v120;
  uint64_t v13 = v6 + 3;
  *(&v87 - 3) = v64;
  *(&v87 - 2) = v65;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)v6 + 6);
  uint64_t v66 = v107;
  sub_2307D3AE8(v6 + 2, &v122);
  uint64_t v107 = v66;
  char v67 = (os_unfair_lock_s *)(v6 + 3);
  if (!v66)
  {
    os_unfair_lock_unlock(v67);
    char v68 = v122;
    swift_release();
    swift_release();
    uint64_t v33 = v104;
    size_t v18 = v120;
    if (v68)
    {
      unint64_t v69 = v111[17];
      *(void *)&long long v122 = v121;
      BYTE8(v122) = v120;
      uint64_t v70 = v69;
      uint64_t v6 = (uint64_t *)sub_2308128A8();
      unint64_t v10 = (unint64_t)objc_msgSend(v70, sel_containsObject_, v6);

      swift_unknownObjectRelease();
      if (v10)
      {
        uint64_t v6 = v92;
        uint64_t v71 = (uint64_t)v92 + *(int *)(v93 + 48);
        *unint64_t v92 = v121;
        *((unsigned char *)v6 + 8) = v18;
        sub_2307CE248(v102, v71);
        sub_2308120F8();
        sub_2307CDF28((uint64_t)v6, &qword_26AF24608);
      }
    }
    sub_2307CDFFC(v102, (uint64_t (*)(void))type metadata accessor for State);
    goto LABEL_5;
  }
  os_unfair_lock_unlock(v67);
  __break(1u);
LABEL_62:
  os_unfair_lock_unlock((os_unfair_lock_t)v10);
  __break(1u);
}

uint64_t sub_23080B404(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  char v7 = a3 & 1;
  swift_beginAccess();
  sub_23080E574(a4);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *(void *)(a1 + 128);
  *(void *)(a1 + 128) = 0x8000000000000000;
  sub_230811B7C(a4, a2, v7, isUniquelyReferenced_nonNull_native);
  *(void *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t StorefrontAppStateController.deinit()
{
  swift_bridgeObjectRelease();
  sub_2307C631C(*(void *)(v0 + 24));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + 152);
  swift_release();

  swift_release();
  swift_release();
  return v0;
}

uint64_t StorefrontAppStateController.__deallocating_deinit()
{
  StorefrontAppStateController.deinit();
  return MEMORY[0x270FA0228](v0, 224, 7);
}

uint64_t sub_23080B568()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_23080E20C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t sub_23080B5D8()
{
  return swift_retain();
}

uint64_t sub_23080B5E4()
{
  uint64_t v2 = *v0;
  unsigned __int8 v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unsigned __int8 v3 = v1;
  v3[1] = sub_2307CBA50;
  v3[2] = v2;
  return MEMORY[0x270FA2498](sub_2307C7BE8, 0, 0);
}

uint64_t sub_23080B68C(char a1)
{
  unsigned __int8 v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unsigned __int8 v3 = v1;
  v3[1] = sub_2307CBA50;
  return StorefrontAppStateController.reloadAllStates(synchronizing:)(a1);
}

uint64_t sub_23080B724(uint64_t a1, char a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307C8818;
  return StorefrontAppStateController.reloadState(forApps:synchronizing:)(a1, a2);
}

uint64_t sub_23080B7CC(uint64_t a1)
{
  return StorefrontAppStateController.preloadState(forApps:)(a1);
}

void sub_23080B7F0()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDB4(v2);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_23080B898@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return StorefrontAppStateController.prospectiveState(forApp:applying:)(a1, a2, a3);
}

uint64_t sub_23080B8BC()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_23080E20C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t sub_23080B944()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_23080E20C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

uint64_t sub_23080B9CC()
{
  return swift_retain();
}

uint64_t sub_23080B9D8()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_23080E20C(&v3);
  os_unfair_lock_unlock(v1);
  return v3;
}

void sub_23080BA5C()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 192) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDB4(v2);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_23080BADC(uint64_t *a1, unsigned __int8 *a2)
{
  return StorefrontAppStateController.setWaiting(forApp:installationType:)(a1, a2) & 1;
}

uint64_t sub_23080BB04(uint64_t a1, char a2)
{
  return 1;
}

uint64_t sub_23080BB2C(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_2307CBA50;
  return StorefrontAppStateController.refreshUpdateRegistry(forApp:with:)(a1, a2);
}

uint64_t sub_23080BBD4(uint64_t *a1)
{
  return StorefrontAppStateController.isLocal(app:)(a1) & 1;
}

uint64_t sub_23080BBFC(uint64_t *a1, int a2)
{
  return StorefrontAppStateController.isRedownloadable(app:includingPreorders:)(a1, a2) & 1;
}

uint64_t sub_23080BC24(uint64_t *a1)
{
  return StorefrontAppStateController.purchaseHistoryIncludes(app:)(a1) & 1;
}

char *sub_23080BC4C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24040);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23080BD48(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24050);
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23080BE4C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_23080BE8C(a1, a2, a3, *v3);
  *unsigned __int8 v3 = result;
  return result;
}

char *sub_23080BE6C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_23080BF88(a1, a2, a3, *v3);
  *unsigned __int8 v3 = result;
  return result;
}

char *sub_23080BE8C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24040);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

char *sub_23080BF88(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C80);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_23080C084(uint64_t a1, uint64_t a2, char a3)
{
  int v6 = a3 & 1;
  uint64_t v7 = *v3;
  sub_230812958();
  sub_230812988();
  sub_230812968();
  uint64_t v8 = sub_230812998();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    while (1)
    {
      uint64_t v12 = *(void *)(v7 + 48) + 16 * v10;
      if (*(void *)v12 == a2 && (((v6 == 0) ^ *(unsigned __int8 *)(v12 + 8)) & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_7;
      }
    }
    uint64_t result = 0;
    uint64_t v14 = *(void *)(*v3 + 48) + 16 * v10;
    uint64_t v15 = *(void *)v14;
    LOBYTE(v14) = *(unsigned char *)(v14 + 8);
    *(void *)a1 = v15;
    *(unsigned char *)(a1 + 8) = v14;
  }
  else
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v3;
    *unsigned __int8 v3 = 0x8000000000000000;
    sub_23080C4CC(a2, v6, v10, isUniquelyReferenced_nonNull_native);
    *unsigned __int8 v3 = v17;
    swift_bridgeObjectRelease();
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 8) = v6;
    return 1;
  }
  return result;
}

uint64_t sub_23080C1EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24028);
  uint64_t result = sub_230812738();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v29 = (void *)(v2 + 56);
    uint64_t v6 = 1 << *(unsigned char *)(v2 + 32);
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v6 + 63) >> 6;
    uint64_t v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        unint64_t v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9) {
          goto LABEL_33;
        }
        unint64_t v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v16 = v29[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v16 = v29[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v29 = -1 << v28;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v29[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(v2 + 48) + 16 * v14;
      uint64_t v19 = *(void *)v18;
      char v20 = *(unsigned char *)(v18 + 8);
      sub_230812958();
      sub_230812988();
      sub_230812968();
      uint64_t result = sub_230812998();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      uint64_t v12 = *(void *)(v4 + 48) + 16 * v11;
      *(void *)uint64_t v12 = v19;
      *(unsigned char *)(v12 + 8) = v20;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_23080C4CC(uint64_t result, char a2, unint64_t a3, char a4)
{
  uint64_t v6 = result;
  int v7 = a2 & 1;
  unint64_t v8 = *(void *)(*v4 + 16);
  unint64_t v9 = *(void *)(*v4 + 24);
  if (v9 > v8 && (a4 & 1) != 0) {
    goto LABEL_14;
  }
  if (a4)
  {
    sub_23080C1EC();
  }
  else
  {
    if (v9 > v8)
    {
      uint64_t result = (uint64_t)sub_23080C7DC();
      goto LABEL_14;
    }
    sub_23080C984();
  }
  uint64_t v10 = *v4;
  sub_230812958();
  sub_230812988();
  sub_230812968();
  uint64_t result = sub_230812998();
  uint64_t v11 = -1 << *(unsigned char *)(v10 + 32);
  a3 = result & ~v11;
  if ((*(void *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v12 = ~v11;
    while (1)
    {
      uint64_t v13 = *(void *)(v10 + 48) + 16 * a3;
      if (*(void *)v13 == v6 && (((v7 == 0) ^ *(unsigned __int8 *)(v13 + 8)) & 1) != 0) {
        break;
      }
      a3 = (a3 + 1) & v12;
      if (((*(void *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
        goto LABEL_14;
      }
    }
    uint64_t result = sub_2308128B8();
    __break(1u);
  }
LABEL_14:
  uint64_t v14 = *v4;
  *(void *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v15 = *(void *)(v14 + 48) + 16 * a3;
  *(void *)uint64_t v15 = v6;
  *(unsigned char *)(v15 + 8) = v7;
  uint64_t v16 = *(void *)(v14 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    __break(1u);
  }
  else {
    *(void *)(v14 + 16) = v18;
  }
  return result;
}

void *sub_23080C644()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_230812728();
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

void *sub_23080C7DC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24028);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_230812728();
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
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v18 = *(void *)v17;
    LOBYTE(v17) = *(unsigned char *)(v17 + 8);
    uint64_t v19 = *(void *)(v4 + 48) + v16;
    *(void *)uint64_t v19 = v18;
    *(unsigned char *)(v19 + 8) = v17;
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

uint64_t sub_23080C984()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24028);
  uint64_t result = sub_230812738();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v28 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v28) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v28) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v28) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(v2 + 48) + 16 * v14;
    uint64_t v19 = *(void *)v18;
    char v20 = *(unsigned char *)(v18 + 8);
    sub_230812958();
    sub_230812988();
    sub_230812968();
    uint64_t result = sub_230812998();
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    uint64_t v12 = *(void *)(v4 + 48) + 16 * v11;
    *(void *)uint64_t v12 = v19;
    *(unsigned char *)(v12 + 8) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v28) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23080CC30(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x263F8EE88];
LABEL_36:
    swift_release();
    return v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C10);
  uint64_t result = sub_230812748();
  uint64_t v9 = result;
  int64_t v28 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v28[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v28[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    sub_230812958();
    sub_230812988();
    uint64_t result = sub_230812998();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
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
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v28[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v28[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_23080CE9C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24028);
  uint64_t result = sub_230812748();
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
    uint64_t v17 = *(void *)(v4 + 48) + 16 * v13;
    uint64_t v18 = *(void *)v17;
    char v19 = *(unsigned char *)(v17 + 8);
    sub_230812958();
    sub_230812988();
    sub_230812968();
    uint64_t result = sub_230812998();
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
    uint64_t v28 = *(void *)(v8 + 48) + 16 * v23;
    *(void *)uint64_t v28 = v18;
    *(unsigned char *)(v28 + 8) = v19;
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

uint64_t sub_23080D13C(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t (*)(uint64_t *))isStackAllocationSafe;
  v12[1] = *MEMORY[0x263EF8340];
  char v6 = *(unsigned char *)(a3 + 32);
  unint64_t v7 = (unint64_t)((1 << v6) + 63) >> 6;
  size_t v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    uint64_t v9 = sub_23080D2C0((uint64_t)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a3, v5);
    swift_release();
    if (v3) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    uint64_t v9 = sub_23080D2C0((uint64_t)v10, v7, a3, v5);
    swift_release();
    MEMORY[0x230FBFCC0](v10, -1, -1);
  }
  return v9;
}

uint64_t sub_23080D2C0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *))
{
  unint64_t v22 = (unint64_t *)result;
  uint64_t v7 = 0;
  int64_t v8 = 0;
  uint64_t v9 = a3 + 56;
  uint64_t v10 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(a3 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
LABEL_4:
  uint64_t v25 = v7;
  while (v12)
  {
    unint64_t v14 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    unint64_t v15 = v14 | (v8 << 6);
LABEL_18:
    uint64_t v19 = *(void *)(a3 + 48) + 16 * v15;
    uint64_t v20 = *(void *)v19;
    LOBYTE(v19) = *(unsigned char *)(v19 + 8);
    uint64_t v23 = v20;
    char v24 = v19;
    uint64_t result = a4(&v23);
    if (v4) {
      return result;
    }
    if (result)
    {
      *(unint64_t *)((char *)v22 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v7 = v25 + 1;
      if (!__OFADD__(v25, 1)) {
        goto LABEL_4;
      }
      __break(1u);
LABEL_28:
      swift_retain();
      return sub_23080CE9C(v22, a2, v25, a3);
    }
  }
  if (__OFADD__(v8++, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v8 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v8);
  if (v17)
  {
LABEL_17:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v8 << 6);
    goto LABEL_18;
  }
  int64_t v18 = v8 + 1;
  if (v8 + 1 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v8 + 2;
  if (v8 + 2 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v8 + 3;
  if (v8 + 3 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17)
  {
LABEL_16:
    int64_t v8 = v18;
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v8 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v8 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v9 + 8 * v8);
    ++v18;
    if (v17) {
      goto LABEL_17;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_23080D490(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_29:
      __break(1u);
      return result;
    }
    if (v11 >= v7) {
      goto LABEL_24;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_24;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_24;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    uint64_t result = sub_23080DA04(*(void *)(*(void *)(v2 + 48) + 16 * v10), *(unsigned char *)(*(void *)(v2 + 48) + 16 * v10 + 8), (uint64_t)&v14);
  }
  int64_t v13 = v11 + 4;
  if (v13 < v7)
  {
    unint64_t v12 = *(void *)(v3 + 8 * v13);
    if (!v12)
    {
      while (1)
      {
        int64_t v8 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_29;
        }
        if (v8 >= v7) {
          goto LABEL_24;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        ++v13;
        if (v12) {
          goto LABEL_23;
        }
      }
    }
    int64_t v8 = v13;
    goto LABEL_23;
  }
LABEL_24:
  return swift_release();
}

uint64_t sub_23080D61C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v35[5] = *MEMORY[0x263EF8340];
  if (*(void *)(a2 + 16))
  {
    int64_t v4 = 0;
    uint64_t v6 = a1 + 56;
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v33 = ~v7;
    if (-v7 < 64) {
      uint64_t v8 = ~(-1 << -(char)v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & v5;
    int64_t v34 = (unint64_t)(63 - v7) >> 6;
    uint64_t v10 = a2 + 56;
    do
    {
LABEL_6:
      if (v9)
      {
        unint64_t v11 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v12 = v11 | (v4 << 6);
      }
      else
      {
        int64_t v13 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_37;
        }
        if (v13 >= v34) {
          goto LABEL_34;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v13);
        int64_t v15 = v4 + 1;
        if (!v14)
        {
          int64_t v15 = v4 + 2;
          if (v4 + 2 >= v34) {
            goto LABEL_34;
          }
          unint64_t v14 = *(void *)(v6 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v4 + 3;
            if (v4 + 3 >= v34) {
              goto LABEL_34;
            }
            unint64_t v14 = *(void *)(v6 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v4 + 4;
              if (v4 + 4 >= v34) {
                goto LABEL_34;
              }
              unint64_t v14 = *(void *)(v6 + 8 * v15);
              if (!v14)
              {
                int64_t v16 = v4 + 5;
                if (v4 + 5 >= v34)
                {
LABEL_34:
                  swift_bridgeObjectRetain();
                  sub_230803630();
                  return v2;
                }
                unint64_t v14 = *(void *)(v6 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      break;
                    }
                    if (v15 >= v34) {
                      goto LABEL_34;
                    }
                    unint64_t v14 = *(void *)(v6 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_23;
                    }
                  }
LABEL_37:
                  __break(1u);
                }
                int64_t v15 = v4 + 5;
              }
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        int64_t v4 = v15;
      }
      uint64_t v17 = *(void *)(a1 + 48) + 16 * v12;
      uint64_t v18 = *(void *)v17;
      int v19 = *(unsigned __int8 *)(v17 + 8);
      sub_230812958();
      sub_230812988();
      sub_230812968();
      uint64_t v20 = sub_230812998();
      uint64_t v21 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v22 = v20 & ~v21;
    }
    while (((*(void *)(v10 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0);
    while (1)
    {
      uint64_t v23 = *(void *)(v2 + 48) + 16 * v22;
      if (*(void *)v23 == v18 && ((v19 ^ *(unsigned __int8 *)(v23 + 8)) & 1) == 0) {
        break;
      }
      unint64_t v22 = (v22 + 1) & ~v21;
      if (((*(void *)(v10 + ((v22 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v22) & 1) == 0) {
        goto LABEL_6;
      }
    }
    v35[0] = a1;
    v35[1] = v6;
    v35[2] = v33;
    void v35[3] = v4;
    v35[4] = v9;
    unint64_t v24 = (unint64_t)(63 - v21) >> 6;
    size_t v25 = 8 * v24;
    uint64_t isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v24 <= 0x80 || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
    {
      MEMORY[0x270FA5388](isStackAllocationSafe);
      uint64_t v28 = (char *)&v33 - v27;
      memcpy((char *)&v33 - v27, (const void *)(v2 + 56), v25);
      uint64_t v29 = sub_23080DB68((uint64_t)v28, v24, v2, v22, v35);
      swift_release();
      sub_230803630();
      return v29;
    }
    else
    {
      uint64_t v30 = (void *)swift_slowAlloc();
      memcpy(v30, (const void *)(v2 + 56), v25);
      uint64_t v31 = sub_23080DB68((uint64_t)v30, v24, v2, v22, v35);
      swift_release();
      sub_230803630();
      MEMORY[0x230FBFCC0](v30, -1, -1);
      return v31;
    }
  }
  else
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
}

uint64_t sub_23080DA04@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  int v6 = a2 & 1;
  uint64_t v7 = *v3;
  sub_230812958();
  sub_230812988();
  sub_230812968();
  uint64_t result = sub_230812998();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = result & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    while (1)
    {
      uint64_t v12 = *(void *)(v7 + 48) + 16 * v10;
      if (*(void *)v12 == a1 && (((v6 == 0) ^ *(unsigned __int8 *)(v12 + 8)) & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_9;
      }
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    uint64_t v17 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_23080C7DC();
      uint64_t v14 = v17;
    }
    uint64_t v15 = *(void *)(v14 + 48) + 16 * v10;
    uint64_t v16 = *(void *)v15;
    LOBYTE(v15) = *(unsigned char *)(v15 + 8);
    *(void *)a3 = v16;
    *(unsigned char *)(a3 + 8) = v15;
    sub_23080DDF8(v10);
    *uint64_t v3 = v17;
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_9:
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 8) = 2;
  }
  return result;
}

uint64_t sub_23080DB68(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = (unint64_t *)result;
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v9 = v8 - 1;
  uint64_t v10 = a3 + 56;
  while (2)
  {
    uint64_t v32 = v9;
    while (1)
    {
LABEL_3:
      int64_t v12 = a5[3];
      unint64_t v11 = a5[4];
      if (!v11)
      {
        int64_t v15 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
          __break(1u);
          goto LABEL_38;
        }
        int64_t v16 = (unint64_t)(a5[2] + 64) >> 6;
        if (v15 >= v16)
        {
          int64_t v15 = a5[3];
LABEL_34:
          a5[3] = v15;
          a5[4] = 0;
          swift_retain();
          return sub_23080CE9C(v7, a2, v32, a3);
        }
        uint64_t v17 = a5[1];
        unint64_t v18 = *(void *)(v17 + 8 * v15);
        if (v18) {
          goto LABEL_14;
        }
        int64_t v19 = v12 + 2;
        if (v12 + 2 >= v16) {
          goto LABEL_34;
        }
        unint64_t v18 = *(void *)(v17 + 8 * v19);
        if (!v18)
        {
          if (v12 + 3 >= v16) {
            goto LABEL_35;
          }
          unint64_t v18 = *(void *)(v17 + 8 * (v12 + 3));
          if (v18)
          {
            int64_t v15 = v12 + 3;
            goto LABEL_14;
          }
          int64_t v19 = v12 + 4;
          if (v12 + 4 >= v16)
          {
            int64_t v15 = v12 + 3;
            goto LABEL_34;
          }
          unint64_t v18 = *(void *)(v17 + 8 * v19);
          if (!v18)
          {
            int64_t v15 = v12 + 5;
            if (v12 + 5 >= v16)
            {
LABEL_35:
              int64_t v15 = v19;
              goto LABEL_34;
            }
            unint64_t v18 = *(void *)(v17 + 8 * v15);
            if (!v18)
            {
              int64_t v15 = v16 - 1;
              int64_t v30 = v12 + 6;
              while (v16 != v30)
              {
                unint64_t v18 = *(void *)(v17 + 8 * v30++);
                if (v18)
                {
                  int64_t v15 = v30 - 1;
                  goto LABEL_14;
                }
              }
              goto LABEL_34;
            }
            goto LABEL_14;
          }
        }
        int64_t v15 = v19;
LABEL_14:
        uint64_t v13 = (v18 - 1) & v18;
        unint64_t v14 = __clz(__rbit64(v18)) + (v15 << 6);
        int64_t v12 = v15;
        goto LABEL_15;
      }
      uint64_t v13 = (v11 - 1) & v11;
      unint64_t v14 = __clz(__rbit64(v11)) | (v12 << 6);
LABEL_15:
      uint64_t v20 = *(void *)(*a5 + 48) + 16 * v14;
      uint64_t v21 = *(void *)v20;
      int v22 = *(unsigned __int8 *)(v20 + 8);
      a5[3] = v12;
      a5[4] = v13;
      sub_230812958();
      sub_230812988();
      sub_230812968();
      uint64_t result = sub_230812998();
      uint64_t v23 = -1 << *(unsigned char *)(a3 + 32);
      unint64_t v24 = result & ~v23;
      if ((*(void *)(v10 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24))
      {
        uint64_t v25 = ~v23;
        while (1)
        {
          uint64_t v26 = *(void *)(a3 + 48) + 16 * v24;
          if (*(void *)v26 == v21 && ((v22 ^ *(unsigned __int8 *)(v26 + 8)) & 1) == 0) {
            break;
          }
          unint64_t v24 = (v24 + 1) & v25;
          if (((*(void *)(v10 + ((v24 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v24) & 1) == 0) {
            goto LABEL_3;
          }
        }
        uint64_t v27 = (v24 >> 3) & 0x1FFFFFFFFFFFFFF8;
        uint64_t v28 = 1 << v24;
        uint64_t v29 = *(unint64_t *)((char *)v7 + v27);
        *(unint64_t *)((char *)v7 + v27) = v29 & ~v28;
        if ((v29 & v28) != 0) {
          break;
        }
      }
    }
    uint64_t v9 = v32 - 1;
    if (__OFSUB__(v32, 1))
    {
LABEL_38:
      __break(1u);
      return result;
    }
    if (v32 != 1) {
      continue;
    }
    return MEMORY[0x263F8EE88];
  }
}

unint64_t sub_23080DDF8(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_230812718();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        uint64_t v10 = 16 * v6;
        sub_230812958();
        sub_230812988();
        sub_230812968();
        unint64_t v11 = sub_230812998() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          unint64_t v14 = (_OWORD *)(v12 + v10);
          if (16 * v2 != v10 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *uint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void *sub_23080DFC8@<X0>(void *(*a1)(uint64_t *__return_ptr)@<X1>, unsigned char *a2@<X8>)
{
  uint64_t result = a1(&v5);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t sub_23080E00C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_230809D30(v2);
    return swift_release();
  }
  return result;
}

uint64_t sub_23080E070(uint64_t a1)
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
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  unint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_23080E114(int64_t result, int a2, char a3, uint64_t a4)
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

void sub_23080E1F8(BOOL *a1@<X8>)
{
  *a1 = *(void *)(v1 + 24) == 1;
}

void *sub_23080E20C@<X0>(unsigned char *a1@<X8>)
{
  return sub_23080ED08(a1);
}

uint64_t sub_23080E224()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_23080E234(uint64_t a1)
{
  char v4 = *(unsigned char *)(v1 + 16);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 32) = v4;
  *(void *)(v5 + 8) = sub_2307CBA50;
  *(void *)(v5 + 16) = a1;
  return MEMORY[0x270FA2498](sub_230805138, 0, 0);
}

uint64_t sub_23080E2E4()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_23080E31C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  char v5 = *(unsigned char *)(v1 + 24);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_2307C8818;
  *(unsigned char *)(v6 + 64) = v5;
  *(void *)(v6 + 24) = a1;
  *(void *)(v6 + 32) = v4;
  return MEMORY[0x270FA2498](sub_230805BF4, 0, 0);
}

uint64_t sub_23080E3DC@<X0>(uint64_t *a1@<X8>)
{
  return sub_2308060E8(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_23080E3F8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23080E440(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2307C8818;
  return sub_2308061E0(a1, v4, v5, v7, v6);
}

void sub_23080E500(unsigned char *a1@<X8>)
{
}

uint64_t sub_23080E518@<X0>(unsigned char *a1@<X8>)
{
  return sub_23080EC84(a1);
}

uint64_t sub_23080E530@<X0>(unsigned __int8 *a1@<X8>)
{
  return sub_230807C24(*(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), a1);
}

uint64_t sub_23080E550()
{
  return sub_23080B404(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_23080E574(uint64_t a1)
{
  return a1;
}

uint64_t sub_23080E5AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_23080E5E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24030);
    uint64_t v3 = sub_230812748();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = ~(-1 << *(unsigned char *)(v3 + 32));
    while (1)
    {
      uint64_t v7 = *(void *)(a1 + 32 + 8 * v4);
      uint64_t result = sub_230812948();
      unint64_t v9 = result & v6;
      unint64_t v10 = (result & (unint64_t)v6) >> 6;
      uint64_t v11 = *(void *)(v5 + 8 * v10);
      uint64_t v12 = 1 << (result & v6);
      uint64_t v13 = *(void *)(v3 + 48);
      if ((v12 & v11) != 0)
      {
        while (*(void *)(v13 + 8 * v9) != v7)
        {
          unint64_t v9 = (v9 + 1) & v6;
          unint64_t v10 = v9 >> 6;
          uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
          uint64_t v12 = 1 << v9;
          if ((v11 & (1 << v9)) == 0) {
            goto LABEL_7;
          }
        }
      }
      else
      {
LABEL_7:
        *(void *)(v5 + 8 * v10) = v12 | v11;
        *(void *)(v13 + 8 * v9) = v7;
        uint64_t v14 = *(void *)(v3 + 16);
        BOOL v15 = __OFADD__(v14, 1);
        uint64_t v16 = v14 + 1;
        if (v15)
        {
          __break(1u);
          return result;
        }
        *(void *)(v3 + 16) = v16;
      }
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_23080E700(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24028);
    uint64_t v3 = sub_230812748();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      uint64_t v7 = (uint64_t *)(v6 + 16 * v4);
      uint64_t v8 = *v7;
      int v9 = *((unsigned __int8 *)v7 + 8);
      sub_230812958();
      sub_230812988();
      sub_230812968();
      uint64_t result = sub_230812998();
      uint64_t v11 = ~(-1 << *(unsigned char *)(v3 + 32));
      unint64_t v12 = result & v11;
      unint64_t v13 = (result & (unint64_t)v11) >> 6;
      uint64_t v14 = *(void *)(v5 + 8 * v13);
      uint64_t v15 = 1 << (result & v11);
      uint64_t v16 = *(void *)(v3 + 48);
      if ((v15 & v14) != 0)
      {
        while (1)
        {
          uint64_t v21 = v16 + 16 * v12;
          if (*(void *)v21 == v8 && ((v9 ^ *(unsigned __int8 *)(v21 + 8)) & 1) == 0) {
            break;
          }
          unint64_t v12 = (v12 + 1) & v11;
          unint64_t v13 = v12 >> 6;
          uint64_t v14 = *(void *)(v5 + 8 * (v12 >> 6));
          uint64_t v15 = 1 << v12;
          if ((v14 & (1 << v12)) == 0) {
            goto LABEL_5;
          }
        }
      }
      else
      {
LABEL_5:
        *(void *)(v5 + 8 * v13) = v15 | v14;
        uint64_t v17 = v16 + 16 * v12;
        *(void *)uint64_t v17 = v8;
        *(unsigned char *)(v17 + 8) = v9;
        uint64_t v18 = *(void *)(v3 + 16);
        BOOL v19 = __OFADD__(v18, 1);
        uint64_t v20 = v18 + 1;
        if (v19)
        {
          __break(1u);
          return result;
        }
        *(void *)(v3 + 16) = v20;
      }
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t method lookup function for StorefrontAppStateController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for StorefrontAppStateController);
}

uint64_t *assignWithCopy for StorefrontAppStateController.Configuration(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
  a1[11] = a2[11];
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for StorefrontAppStateController.Configuration(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  long long v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorefrontAppStateController.Configuration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StorefrontAppStateController.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for StorefrontAppStateController.DataSourceState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_retain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for StorefrontAppStateController.DataSourceState(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_release();
  }
  return result;
}

unint64_t *assignWithCopy for StorefrontAppStateController.DataSourceState(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_retain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_retain();
    swift_release();
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for StorefrontAppStateController.DataSourceState(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_release();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StorefrontAppStateController.DataSourceState(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StorefrontAppStateController.DataSourceState(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23080EC3C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_23080EC54(void *result, int a2)
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

ValueMetadata *type metadata accessor for StorefrontAppStateController.DataSourceState()
{
  return &type metadata for StorefrontAppStateController.DataSourceState;
}

uint64_t sub_23080EC84@<X0>(unsigned char *a1@<X8>)
{
  char v3 = *(unsigned char *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 24);
  char v7 = v3;
  uint64_t result = sub_2307D392C((uint64_t)&v6, v4);
  *a1 = result & 1;
  return result;
}

void sub_23080ECE4(unsigned char *a1@<X8>)
{
  sub_230807A50(*(void *)(v1 + 24), a1);
}

void *sub_23080ED08@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_23080ED4C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_23080ED84()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23080EDBC()
{
  return sub_23080E00C(*(void *)(v0 + 16), (uint64_t *)(v0 + 24));
}

void sub_23080EDC8()
{
  sub_23080A488(*(unsigned int (***)(char *, uint64_t, uint64_t))(v0 + 16), **(void **)(v0 + 24));
}

uint64_t sub_23080EDE8@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_2307E7948(a1, *(void **)(v2 + 16), *(unsigned char *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_23080EE0C(uint64_t *a1)
{
  return sub_23080EE28(a1) & 1;
}

uint64_t sub_23080EE28(uint64_t *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  uint64_t v3 = *a1;
  char v4 = *((unsigned char *)a1 + 8);
  uint64_t v5 = v2[3];
  uint64_t v6 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v5);
  uint64_t v8 = v3;
  char v9 = v4;
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v6 + 56))(&v8, v5, v6) & 1;
}

uint64_t sub_23080EEB0()
{
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_release();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_23080EF00()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_23080EF40()
{
  uint64_t v1 = sub_230812048();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

unint64_t sub_23080F00C()
{
  unint64_t result = qword_2687031D0;
  if (!qword_2687031D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2687031D0);
  }
  return result;
}

uint64_t sub_23080F060()
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  __swift_destroy_boxed_opaque_existential_1(v0 + 88);
  swift_release();
  return MEMORY[0x270FA0238](v0, 136, 7);
}

uint64_t sub_23080F0B8()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23080F0F8()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23080F134(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_23080F160@<X0>(unsigned __int8 *a1@<X8>)
{
  return sub_23080E530(a1);
}

void sub_23080F184(BOOL *a1@<X8>)
{
}

ValueMetadata *_s7UnknownVMa()
{
  return &_s7UnknownVN;
}

ValueMetadata *_s9UpdatableVMa()
{
  return &_s9UpdatableVN;
}

BOOL sub_23080F1C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  unint64_t v10 = (unsigned __int8 *)&v29 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)&v29 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v29 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v29 - v17;
  sub_2307CE248(a2, (uint64_t)&v29 - v17);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    sub_2307CE248(a1, (uint64_t)v16);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 3u:
      case 5u:
      case 7u:
      case 8u:
        swift_bridgeObjectRelease();
        BOOL v19 = 1;
        break;
      case 2u:
        sub_2307CE248((uint64_t)v16, (uint64_t)v7);
        uint64_t v21 = sub_2307F7F70();
        char v23 = v22;
        swift_bridgeObjectRelease();
        if (v23) {
          uint64_t v24 = 0;
        }
        else {
          uint64_t v24 = v21;
        }
        uint64_t v25 = sub_2307F7F70();
        char v27 = v26;
        swift_bridgeObjectRelease();
        if (v27) {
          uint64_t v28 = 0;
        }
        else {
          uint64_t v28 = v25;
        }
        BOOL v19 = v24 < v28;
        break;
      case 4u:
        swift_bridgeObjectRelease();
        sub_2307CE248((uint64_t)v16, (uint64_t)v13);
        sub_2307CE05C((uint64_t)v13, type metadata accessor for AppInstallation);
        BOOL v19 = 1;
        break;
      case 6u:
        swift_bridgeObjectRelease();
        goto LABEL_17;
      default:
        swift_bridgeObjectRelease();
        sub_2307CE248((uint64_t)v16, (uint64_t)v10);
        if ((*v10 | 2) == 2) {
          BOOL v19 = 1;
        }
        else {
LABEL_17:
        }
          BOOL v19 = 0;
        break;
    }
  }
  else
  {
    BOOL v19 = 0;
    uint64_t v16 = v18;
  }
  sub_2307CE05C((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for State);
  return v19;
}

uint64_t dispatch thunk of UpdateRegistry.entry(forAdamID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of UpdateRegistry.addEntry(_:forAdamID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of UpdateRegistry.removeEntry(forAdamID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of UpdateRegistry.removeEntries(forAdamIDs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

ValueMetadata *_s7WaitingVMa()
{
  return &_s7WaitingVN;
}

uint64_t sub_23080F4C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  char v7 = (unsigned __int8 *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  unint64_t v10 = (unsigned __int8 *)&v28 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v28 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (unsigned __int8 *)&v28 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF248F0);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  char v22 = (char *)&v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = (uint64_t)&v22[*(int *)(v20 + 56)];
  sub_2307CE248(a1, (uint64_t)v22);
  sub_2307CE248(a2, v23);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2307CE248((uint64_t)v22, (uint64_t)v16);
      if (*v16 == 1) {
        goto LABEL_2;
      }
      goto LABEL_18;
    case 2u:
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_18;
      }
      sub_2307CE248(v23, (uint64_t)v10);
      int v24 = *v10;
      goto LABEL_12;
    case 3u:
    case 8u:
LABEL_2:
      if (!swift_getEnumCaseMultiPayload()) {
        goto LABEL_9;
      }
      goto LABEL_18;
    case 4u:
      sub_2307CE248((uint64_t)v22, (uint64_t)v13);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      sub_2307CE05C((uint64_t)v13, type metadata accessor for AppInstallation);
      if (EnumCaseMultiPayload) {
        goto LABEL_18;
      }
LABEL_9:
      uint64_t v26 = (uint64_t)v22;
      goto LABEL_17;
    case 5u:
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_18;
      }
      sub_2307CE248(v23, (uint64_t)v7);
      int v24 = *v7;
LABEL_12:
      if ((v24 | 2) == 2)
      {
LABEL_16:
        sub_2307CE05C(v23, (uint64_t (*)(void))type metadata accessor for State);
        uint64_t v26 = (uint64_t)v22;
LABEL_17:
        sub_2307CE05C(v26, (uint64_t (*)(void))type metadata accessor for State);
        return 1;
      }
      else
      {
LABEL_18:
        sub_2307FB8CC((uint64_t)v22);
        return 0;
      }
    case 6u:
      if (!swift_getEnumCaseMultiPayload())
      {
        sub_2307CE248(v23, (uint64_t)v18);
        if (*v18 <= 1u) {
          goto LABEL_16;
        }
      }
      goto LABEL_18;
    default:
      goto LABEL_18;
  }
}

uint64_t WaitingAppStateDataSource.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  WaitingAppStateDataSource.init()();
  return v0;
}

void *WaitingAppStateDataSource.__allocating_init(supportedAppKinds:)(uint64_t a1)
{
  uint64_t v2 = (void *)swift_allocObject();
  v2[3] = a1;
  v2[2] = sub_2307CA1CC(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B68);
  swift_allocObject();
  v2[5] = sub_2308123F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CE0);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  v2[4] = v3;
  return v2;
}

void *WaitingAppStateDataSource.init(supportedAppKinds:)(uint64_t a1)
{
  v1[3] = a1;
  v1[2] = sub_2307CA1CC(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24B68);
  swift_allocObject();
  v1[5] = sub_2308123F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24CE0);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  v1[4] = v2;
  return v1;
}

uint64_t WaitingAppStateDataSource.onSynchronizeAppStates.getter()
{
  return swift_retain();
}

uint64_t WaitingAppStateDataSource.load()()
{
  return sub_2307CBC98(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t WaitingAppStateDataSource.reloadState(forAppsWith:synchronizing:)()
{
  return sub_2307CBC98(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t WaitingAppStateDataSource.reloadAllStates(synchronizing:)()
{
  return sub_2307CBC98(*(uint64_t (**)(void))(v0 + 8));
}

void WaitingAppStateDataSource.state(forAppWith:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDF4(v2);
  os_unfair_lock_unlock(v1);
}

uint64_t WaitingAppStateDataSource.setWaiting(forAppWith:installationType:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDF4(v2);
  os_unfair_lock_unlock(v1);
  return 1;
}

uint64_t sub_23080FACC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  MEMORY[0x270FA5388](v5 - 8);
  char v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned char *v7 = a3;
  uint64_t v8 = type metadata accessor for State();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  swift_beginAccess();
  sub_2307D5710((uint64_t)v7, a2);
  return swift_endAccess();
}

uint64_t WaitingAppStateDataSource.clearWaiting(forAppWith:)()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDB4(v2);
  os_unfair_lock_unlock(v1);
  return 1;
}

uint64_t sub_23080FC58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24868);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  unint64_t v8 = sub_2307CF3B0(a2);
  if (v9)
  {
    unint64_t v10 = v8;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v12 = *v7;
    uint64_t v18 = *v7;
    uint64_t *v7 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_230810E88();
      uint64_t v12 = v18;
    }
    uint64_t v13 = *(void *)(v12 + 56);
    uint64_t v14 = type metadata accessor for State();
    uint64_t v15 = *(void *)(v14 - 8);
    sub_2307CE37C(v13 + *(void *)(v15 + 72) * v10, (uint64_t)v6);
    sub_2308108D0(v10, v12);
    uint64_t *v7 = v12;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v6, 0, 1, v14);
  }
  else
  {
    uint64_t v16 = type metadata accessor for State();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  }
  swift_endAccess();
  return sub_2307D71A0((uint64_t)v6);
}

uint64_t WaitingAppStateDataSource.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t WaitingAppStateDataSource.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_23080FEB8()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDB4(v2);
  os_unfair_lock_unlock(v1);
  return 1;
}

uint64_t sub_23080FF38()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)v0 + 32) + 16);
  os_unfair_lock_lock(v1);
  sub_2307CEDB4(v2);
  os_unfair_lock_unlock(v1);
  return 1;
}

uint64_t sub_23080FFB0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268703010);
  char v33 = a2;
  uint64_t result = sub_230812828();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v32[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((v33 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v32 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      uint64_t v28 = *(void *)(v5 + 56) + 24 * v19;
      long long v34 = *(_OWORD *)v28;
      uint64_t v29 = *(void *)(v28 + 16);
      if ((v33 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_230812958();
      sub_230812988();
      uint64_t result = sub_230812998();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v27;
      uint64_t v17 = *(void *)(v7 + 56) + 24 * v16;
      *(_OWORD *)uint64_t v17 = v34;
      *(void *)(v17 + 16) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2308102AC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23DB8);
  uint64_t result = sub_230812828();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        unint64_t v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          unint64_t v21 = v32[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v32 = -1 << v30;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      uint64_t v28 = *(void *)(*(void *)(v5 + 48) + v27);
      uint64_t v29 = *(void *)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      sub_230812958();
      sub_230812988();
      uint64_t result = sub_230812998();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_230810588(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(qword_26AF240E8);
  char v39 = a2;
  uint64_t result = sub_230812828();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v37 = (void *)(v5 + 64);
    uint64_t v38 = v5;
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v37;
        if (v21 >= v36) {
          goto LABEL_33;
        }
        unint64_t v22 = v37[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v22 = v37[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_33:
              if ((v39 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
              if (v35 >= 64) {
                bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *unint64_t v37 = -1 << v35;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v22 = v37[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = *(void *)(v5 + 48) + 16 * v20;
      uint64_t v29 = *(void *)v28;
      char v30 = *(unsigned char *)(v28 + 8);
      uint64_t v31 = *(void *)(v5 + 56) + 56 * v20;
      long long v40 = *(_OWORD *)v31;
      char v32 = *(unsigned char *)(v31 + 16);
      uint64_t v33 = *(void *)(v31 + 32);
      uint64_t v34 = *(void *)(v31 + 48);
      uint64_t v41 = *(void *)(v31 + 40);
      uint64_t v42 = *(void *)(v31 + 24);
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_230812958();
      sub_230812988();
      sub_230812968();
      uint64_t result = sub_230812998();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v15 == v25;
          if (v15 == v25) {
            unint64_t v15 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        unint64_t v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t v17 = *(void *)(v7 + 48) + 16 * v16;
      *(void *)uint64_t v17 = v29;
      *(unsigned char *)(v17 + 8) = v30;
      uint64_t v18 = *(void *)(v7 + 56) + 56 * v16;
      *(_OWORD *)uint64_t v18 = v40;
      *(unsigned char *)(v18 + 16) = v32;
      *(void *)(v18 + 24) = v42;
      *(void *)(v18 + 32) = v33;
      *(void *)(v18 + 40) = v41;
      *(void *)(v18 + 48) = v34;
      ++*(void *)(v7 + 16);
      uint64_t v5 = v38;
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2308108D0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_230812718();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_230812958();
        sub_230812988();
        uint64_t result = sub_230812998();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v9 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v10 = *(void *)(a2 + 48);
        unint64_t v11 = (void *)(v10 + 8 * v3);
        uint64_t v12 = (void *)(v10 + 8 * v6);
        if (v3 != v6 || v11 >= v12 + 1) {
          *unint64_t v11 = *v12;
        }
        uint64_t v13 = *(void *)(a2 + 56);
        uint64_t v14 = *(void *)(*(void *)(type metadata accessor for State() - 8) + 72);
        int64_t v15 = v14 * v3;
        uint64_t result = v13 + v14 * v3;
        int64_t v16 = v14 * v6;
        unint64_t v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v15 == v16) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v9 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v9) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_230810AC4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_230812718();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        sub_230812958();
        sub_230812968();
        uint64_t result = sub_230812998();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v9 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v10 = *(void *)(a2 + 48);
        unint64_t v11 = (unsigned char *)(v10 + v3);
        uint64_t v12 = (unsigned char *)(v10 + v6);
        if (v3 != v6 || v11 >= v12 + 1) {
          *unint64_t v11 = *v12;
        }
        uint64_t v13 = *(void *)(a2 + 56);
        uint64_t v14 = *(void *)(*(void *)(type metadata accessor for State() - 8) + 72);
        int64_t v15 = v14 * v3;
        uint64_t result = v13 + v14 * v3;
        int64_t v16 = v14 * v6;
        unint64_t v17 = v13 + v14 * v6 + v14;
        if (v15 < v16 || result >= v17)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v15 == v16) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v9 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v9) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_230810CB8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_230812718();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_230812958();
        sub_230812988();
        uint64_t result = sub_230812998();
        unint64_t v10 = result & v7;
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
          uint64_t v12 = (void *)(v11 + 8 * v3);
          uint64_t v13 = (void *)(v11 + 8 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = v14 + 24 * v3;
          int64_t v16 = (long long *)(v14 + 24 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= (unint64_t)v16 + 24))
          {
            long long v9 = *v16;
            *(void *)(v15 + 16) = *((void *)v16 + 2);
            *(_OWORD *)unint64_t v15 = v9;
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

void *sub_230810E88()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for State();
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C58);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_230812818();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v24 = v1;
  uint64_t result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v21 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v21);
    ++v11;
    if (!v22)
    {
      int64_t v11 = v21 + 1;
      if (v21 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v22 = *(void *)(v9 + 8 * v11);
      if (!v22) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v22 - 1) & v22;
    unint64_t v17 = __clz(__rbit64(v22)) + (v11 << 6);
LABEL_9:
    uint64_t v18 = 8 * v17;
    uint64_t v19 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
    unint64_t v20 = *(void *)(v25 + 72) * v17;
    sub_2307CE248(*(void *)(v5 + 56) + v20, (uint64_t)v4);
    *(void *)(*(void *)(v7 + 48) + v18) = v19;
    uint64_t result = (void *)sub_2307CE37C((uint64_t)v4, *(void *)(v7 + 56) + v20);
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v15)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v22 = *(void *)(v9 + 8 * v23);
  if (v22)
  {
    int64_t v11 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v22 = *(void *)(v9 + 8 * v11);
    ++v23;
    if (v22) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_2308110DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for State();
  uint64_t v24 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF24C40);
  uint64_t v5 = *v0;
  uint64_t v6 = sub_230812818();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    *uint64_t v1 = v7;
    return result;
  }
  int64_t v23 = v1;
  uint64_t result = (void *)(v6 + 64);
  uint64_t v9 = v5 + 64;
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v9 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  }
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v15) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v9 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v9 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_9:
    char v18 = *(unsigned char *)(*(void *)(v5 + 48) + v17);
    unint64_t v19 = *(void *)(v24 + 72) * v17;
    sub_2307CE248(*(void *)(v5 + 56) + v19, (uint64_t)v4);
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v18;
    uint64_t result = (void *)sub_2307CE37C((uint64_t)v4, *(void *)(v7 + 56) + v19);
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v15)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v9 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v9 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_23081132C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF240D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_230812818();
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2308114DC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268703010);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_230812818();
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
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 24 * v15;
    uint64_t v19 = *(void *)(v2 + 56) + v18;
    uint64_t v20 = *(void *)(v19 + 16);
    long long v21 = *(_OWORD *)v19;
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v22 = *(void *)(v4 + 56) + v18;
    *(_OWORD *)uint64_t v22 = v21;
    *(void *)(v22 + 16) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_230811698()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF23DB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_230812818();
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23081183C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_26AF240E8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_230812818();
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
    int64_t v29 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v29 >= v13) {
      goto LABEL_26;
    }
    unint64_t v30 = *(void *)(v6 + 8 * v29);
    ++v9;
    if (!v30)
    {
      int64_t v9 = v29 + 1;
      if (v29 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v30 = *(void *)(v6 + 8 * v9);
      if (!v30) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v30 - 1) & v30;
    unint64_t v15 = __clz(__rbit64(v30)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 16 * v15;
    uint64_t v18 = *(void *)v17;
    LOBYTE(v17) = *(unsigned char *)(v17 + 8);
    uint64_t v19 = 56 * v15;
    uint64_t v20 = *(void *)(v2 + 56) + v19;
    char v21 = *(unsigned char *)(v20 + 16);
    uint64_t v23 = *(void *)(v20 + 24);
    uint64_t v22 = *(void *)(v20 + 32);
    uint64_t v24 = *(void *)(v20 + 40);
    uint64_t v25 = *(void *)(v20 + 48);
    uint64_t v26 = *(void *)(v4 + 48) + v16;
    long long v27 = *(_OWORD *)v20;
    *(void *)uint64_t v26 = v18;
    *(unsigned char *)(v26 + 8) = v17;
    uint64_t v28 = *(void *)(v4 + 56) + v19;
    *(_OWORD *)uint64_t v28 = v27;
    *(unsigned char *)(v28 + 16) = v21;
    *(void *)(v28 + 24) = v23;
    *(void *)(v28 + 32) = v22;
    *(void *)(v28 + 40) = v24;
    *(void *)(v28 + 48) = v25;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v31 = v29 + 2;
  if (v31 >= v13) {
    goto LABEL_26;
  }
  unint64_t v30 = *(void *)(v6 + 8 * v31);
  if (v30)
  {
    int64_t v9 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v30 = *(void *)(v6 + 8 * v9);
    ++v31;
    if (v30) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_230811A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_2307CF3B0(a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= result && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= result && (a5 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2308114DC();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      char v21 = (void *)(v20[7] + 24 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      void *v21 = a1;
      v21[1] = a2;
      void v21[2] = a3;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    *(void *)(v20[6] + 8 * v14) = a4;
    uint64_t v23 = (void *)(v20[7] + 24 * v14);
    void *v23 = a1;
    v23[1] = a2;
    v23[2] = a3;
    uint64_t v24 = v20[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      void v20[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  sub_23080FFB0(result, a5 & 1);
  uint64_t result = sub_2307CF3B0(a4);
  if ((v18 & 1) == (v22 & 1))
  {
    unint64_t v14 = result;
    uint64_t v20 = (void *)*v6;
    if (v18) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_2308128C8();
  __break(1u);
  return result;
}

unint64_t sub_230811B7C(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v5 = (void **)v4;
  char v9 = a3 & 1;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_2307F5570(a2, a3 & 1);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23081183C();
      goto LABEL_7;
    }
    sub_230810588(v15, a4 & 1);
    unint64_t v21 = sub_2307F5570(a2, v9);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    unint64_t result = sub_2308128C8();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7] + 56 * v12;
    return sub_230811E0C(a1, v19);
  }
LABEL_13:
  return sub_230811CC0(v12, a2, v9, a1, v18);
}

unint64_t sub_230811CC0(unint64_t result, uint64_t a2, char a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = a5[6] + 16 * result;
  *(void *)uint64_t v5 = a2;
  *(unsigned char *)(v5 + 8) = a3 & 1;
  uint64_t v6 = a5[7] + 56 * result;
  long long v7 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a4;
  *(_OWORD *)(v6 + 16) = v7;
  *(_OWORD *)(v6 + 32) = *(_OWORD *)(a4 + 32);
  *(void *)(v6 + 48) = *(void *)(a4 + 48);
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_230811D2C()
{
  return sub_23080FACC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_230811D4C()
{
  return sub_23080FC58(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t method lookup function for WaitingAppStateDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for WaitingAppStateDataSource);
}

uint64_t dispatch thunk of WaitingAppStateDataSource.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of WaitingAppStateDataSource.__allocating_init(supportedAppKinds:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_230811DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_230811E0C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_230811E68()
{
  return sub_230811D4C();
}

uint64_t sub_230811E80()
{
  return sub_230811D2C();
}

ValueMetadata *_s8WildcardVMa()
{
  return &_s8WildcardVN;
}

uint64_t sub_230811EA8()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_230811EB8()
{
  return MEMORY[0x270EEE390]();
}

uint64_t sub_230811EC8()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_230811ED8()
{
  return MEMORY[0x270EEE3F0]();
}

uint64_t sub_230811EE8()
{
  return MEMORY[0x270EEE408]();
}

uint64_t sub_230811EF8()
{
  return MEMORY[0x270EEE410]();
}

uint64_t sub_230811F08()
{
  return MEMORY[0x270EEE4B0]();
}

uint64_t sub_230811F18()
{
  return MEMORY[0x270EEE5C0]();
}

uint64_t sub_230811F28()
{
  return MEMORY[0x270EEE610]();
}

uint64_t sub_230811F38()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_230811F48()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_230811F58()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_230811F68()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_230811FD8()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_230811FE8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_230811FF8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_230812008()
{
  return MEMORY[0x270EF09D8]();
}

uint64_t sub_230812018()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_230812028()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_230812038()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_230812048()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_230812058()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_230812068()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_230812078()
{
  return MEMORY[0x270FA2C98]();
}

uint64_t sub_230812088()
{
  return MEMORY[0x270FA2CC0]();
}

uint64_t sub_230812098()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t sub_2308120A8()
{
  return MEMORY[0x270FA0998]();
}

uint64_t sub_2308120B8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2308120C8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2308120D8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2308120E8()
{
  return MEMORY[0x270F44ED8]();
}

uint64_t sub_2308120F8()
{
  return MEMORY[0x270F45030]();
}

uint64_t sub_230812108()
{
  return MEMORY[0x270F45038]();
}

uint64_t sub_230812118()
{
  return MEMORY[0x270F45180]();
}

uint64_t sub_230812128()
{
  return MEMORY[0x270F45198]();
}

uint64_t sub_230812138()
{
  return MEMORY[0x270F451A0]();
}

uint64_t sub_230812148()
{
  return MEMORY[0x270F451A8]();
}

uint64_t sub_230812158()
{
  return MEMORY[0x270F451B0]();
}

uint64_t sub_230812168()
{
  return MEMORY[0x270F451B8]();
}

uint64_t sub_230812178()
{
  return MEMORY[0x270F451C0]();
}

uint64_t sub_230812188()
{
  return MEMORY[0x270F451C8]();
}

uint64_t sub_230812198()
{
  return MEMORY[0x270F451E8]();
}

uint64_t sub_2308121A8()
{
  return MEMORY[0x270F45450]();
}

uint64_t sub_2308121B8()
{
  return MEMORY[0x270F45458]();
}

uint64_t sub_2308121C8()
{
  return MEMORY[0x270F45560]();
}

uint64_t sub_2308121D8()
{
  return MEMORY[0x270F456D8]();
}

uint64_t sub_2308121E8()
{
  return MEMORY[0x270F456E8]();
}

uint64_t sub_2308121F8()
{
  return MEMORY[0x270F456F0]();
}

uint64_t sub_230812208()
{
  return MEMORY[0x270F457B0]();
}

uint64_t sub_230812218()
{
  return MEMORY[0x270F457E0]();
}

uint64_t sub_230812228()
{
  return MEMORY[0x270F45A78]();
}

uint64_t sub_230812238()
{
  return MEMORY[0x270F45A80]();
}

uint64_t sub_230812248()
{
  return MEMORY[0x270F46220]();
}

uint64_t sub_230812258()
{
  return MEMORY[0x270F46250]();
}

uint64_t sub_230812268()
{
  return MEMORY[0x270F46270]();
}

uint64_t sub_230812278()
{
  return MEMORY[0x270F46298]();
}

uint64_t sub_230812288()
{
  return MEMORY[0x270F462D0]();
}

uint64_t sub_2308122A8()
{
  return MEMORY[0x270F462F0]();
}

uint64_t sub_2308122B8()
{
  return MEMORY[0x270F462F8]();
}

uint64_t sub_2308122C8()
{
  return MEMORY[0x270F46300]();
}

uint64_t sub_2308122D8()
{
  return MEMORY[0x270F46308]();
}

uint64_t sub_2308122E8()
{
  return MEMORY[0x270F46480]();
}

uint64_t sub_2308122F8()
{
  return MEMORY[0x270F46488]();
}

uint64_t sub_230812308()
{
  return MEMORY[0x270F46490]();
}

uint64_t sub_230812318()
{
  return MEMORY[0x270F464A0]();
}

uint64_t sub_230812328()
{
  return MEMORY[0x270F46558]();
}

uint64_t sub_230812338()
{
  return MEMORY[0x270F46568]();
}

uint64_t sub_230812348()
{
  return MEMORY[0x270F46570]();
}

uint64_t sub_230812358()
{
  return MEMORY[0x270F46578]();
}

uint64_t sub_230812368()
{
  return MEMORY[0x270F46580]();
}

uint64_t sub_230812378()
{
  return MEMORY[0x270F46588]();
}

uint64_t sub_230812388()
{
  return MEMORY[0x270F46618]();
}

uint64_t sub_230812398()
{
  return MEMORY[0x270F46620]();
}

uint64_t sub_2308123A8()
{
  return MEMORY[0x270F46630]();
}

uint64_t sub_2308123B8()
{
  return MEMORY[0x270F46638]();
}

uint64_t sub_2308123C8()
{
  return MEMORY[0x270F46710]();
}

uint64_t sub_2308123D8()
{
  return MEMORY[0x270F46718]();
}

uint64_t sub_2308123E8()
{
  return MEMORY[0x270F46720]();
}

uint64_t sub_2308123F8()
{
  return MEMORY[0x270F46728]();
}

uint64_t sub_230812408()
{
  return MEMORY[0x270F9D090]();
}

uint64_t sub_230812418()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_230812428()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_230812438()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_230812448()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_230812458()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_230812468()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_230812478()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_230812488()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_230812498()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2308124B8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2308124C8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2308124D8()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2308124E8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2308124F8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_230812508()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_230812518()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_230812528()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_230812538()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_230812548()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_230812558()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_230812578()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_230812588()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2308125A8()
{
  return MEMORY[0x270FA1FE8]();
}

uint64_t sub_2308125C8()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_2308125E8()
{
  return MEMORY[0x270FA2068]();
}

uint64_t sub_2308125F8()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_230812608()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_230812618()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_230812628()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_230812638()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_230812648()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_230812658()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_230812668()
{
  return MEMORY[0x270FA2E90]();
}

uint64_t sub_230812678()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t sub_230812688()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_230812698()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_2308126A8()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_2308126B8()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_2308126C8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2308126D8()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2308126E8()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_230812708()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_230812718()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_230812728()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_230812738()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_230812748()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_230812758()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_230812768()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_230812778()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_230812788()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2308127A8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2308127B8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2308127C8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2308127D8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2308127E8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2308127F8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_230812808()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_230812818()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_230812828()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_230812838()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_230812848()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_230812868()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_230812878()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_230812888()
{
  return MEMORY[0x270F9FA50]();
}

uint64_t sub_2308128A8()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2308128B8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2308128C8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2308128F8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_230812908()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_230812918()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_230812928()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_230812938()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_230812948()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_230812958()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_230812968()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_230812978()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_230812988()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_230812998()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2308129A8()
{
  return MEMORY[0x270FA0128]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x270F91820]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x270F91838]();
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x270F91848]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
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