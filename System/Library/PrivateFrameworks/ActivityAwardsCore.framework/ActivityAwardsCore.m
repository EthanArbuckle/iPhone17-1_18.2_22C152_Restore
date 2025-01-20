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

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t objectdestroy_35Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t BaseQuery.transportDispatchService.getter()
{
  return swift_retain();
}

id BaseQuery.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id BaseQuery.init()()
{
  sub_223140068();
  swift_allocObject();
  id v1 = v0;
  *(void *)&v1[OBJC_IVAR____TtC18ActivityAwardsCore9BaseQuery_transportDispatchService] = sub_223140058();

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for BaseQuery();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for BaseQuery()
{
  return self;
}

id BaseQuery.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BaseQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_223132A20()
{
  return swift_retain();
}

uint64_t BaseQuery.transportRequest(_:data:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return MEMORY[0x270FA2498](sub_223132A58, 0, 0);
}

uint64_t sub_223132A58()
{
  uint64_t v1 = sub_223140048();
  objc_super v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_223132C94(uint64_t a1, void *a2, void *aBlock, void *a4)
{
  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  if (a2)
  {
    id v7 = a2;
    id v8 = a4;
    uint64_t v9 = sub_22313FFC8();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a4;
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  v4[5] = v9;
  v4[6] = v11;
  return MEMORY[0x270FA2498](sub_223132D4C, 0, 0);
}

uint64_t sub_223132D4C()
{
  uint64_t v2 = v0[5];
  unint64_t v1 = v0[6];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = sub_223140048();
  unint64_t v6 = v5;

  sub_223133654(v2, v1);
  if (v6 >> 60 == 15)
  {
    uint64_t v7 = 0;
    id v8 = 0;
  }
  else
  {
    uint64_t v7 = sub_22313FFB8();
    sub_223133654(v4, v6);
    id v8 = (void *)v7;
  }
  uint64_t v9 = (void (**)(void, void, void))v0[4];
  v9[2](v9, v7, 0);

  _Block_release(v9);
  unint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

void sub_223132F28(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_223132F30@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_223132F3C(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_223133BF8;
  return v6();
}

uint64_t sub_223133008(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *unint64_t v5 = v4;
  v5[1] = sub_223133BF8;
  return v7();
}

uint64_t sub_2231330D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2231401C8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2231401B8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_223133A50(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_223140178();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_223133278(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_223133354;
  return v6(a1);
}

uint64_t sub_223133354()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _s18ActivityAwardsCore9BaseQueryC14transportEvent_4dataySo16AACTransportItemV_10Foundation4DataVSgtF_0(uint64_t a1)
{
  swift_getObjectType();
  uint64_t v2 = sub_2231400E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400C8();
  uint64_t v6 = sub_2231400D8();
  os_log_type_t v7 = sub_2231401D8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = a1;
    uint64_t v9 = v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v11 = sub_223140378();
    uint64_t v16 = sub_223138590(v11, v12, &v17);
    sub_2231401F8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2048;
    uint64_t v16 = v15;
    sub_2231401F8();
    _os_log_impl(&dword_223130000, v6, v7, "Unexpectedly received a transport event for query %s with item: %lu", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223CAF4C0](v10, -1, -1);
    MEMORY[0x223CAF4C0](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_223133654(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_223133668(a1, a2);
  }
  return a1;
}

uint64_t sub_223133668(uint64_t a1, unint64_t a2)
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

uint64_t sub_2231336C0()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_223133708()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  unint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_2231337C8;
  os_log_type_t v7 = (uint64_t (*)(uint64_t, void *, void *, void *))((char *)&dword_267F9CD30 + dword_267F9CD30);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_2231337C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2231338C0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *unint64_t v5 = v1;
  v5[1] = sub_223133BF8;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_267F9CD40 + dword_267F9CD40);
  return v6(v2, v3, v4);
}

uint64_t sub_223133984(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  os_log_type_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *os_log_type_t v7 = v2;
  v7[1] = sub_223133BF8;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_267F9CD50 + dword_267F9CD50);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_223133A50(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD599E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_223133AB0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_223133AE8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2231337C8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267F9CD60 + dword_267F9CD60);
  return v6(a1, v4);
}

void type metadata accessor for AACTransportItem()
{
  if (!qword_267F9CDD0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267F9CDD0);
    }
  }
}

uint64_t sub_223133BFC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_223133C10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_223133C24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_223133C38()
{
  return sub_223133C6C("Main XPC connection invalidated");
}

uint64_t sub_223133C44()
{
  return sub_223133C6C("Main XPC connection interrupted");
}

uint64_t sub_223133C54(uint64_t a1, unint64_t a2)
{
  return sub_223133FDC(a1, a2, "XPC client-side connection invalidated for %{public}s");
}

uint64_t sub_223133C60(uint64_t a1, unint64_t a2)
{
  return sub_223133FDC(a1, a2, "XPC client-side connection interrupted for %{public}s");
}

uint64_t sub_223133C6C(const char *a1)
{
  uint64_t v2 = sub_2231400E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400A8();
  uint64_t v6 = sub_2231400D8();
  os_log_type_t v7 = sub_2231401E8();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_223130000, v6, v7, a1, v8, 2u);
    MEMORY[0x223CAF4C0](v8, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_223133DA8(void *a1)
{
  uint64_t v2 = sub_2231400E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400A8();
  id v6 = a1;
  id v7 = a1;
  uint64_t v8 = sub_2231400D8();
  os_log_type_t v9 = sub_2231401D8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v2;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    swift_getErrorValue();
    uint64_t v13 = sub_2231402F8();
    uint64_t v18 = sub_223138590(v13, v14, &v19);
    sub_2231401F8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_223130000, v8, v9, "Error setting up proxy; unable to obtain query endpoint: %{public}s",
      v11,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x223CAF4C0](v12, -1, -1);
    MEMORY[0x223CAF4C0](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_223133FDC(uint64_t a1, unint64_t a2, const char *a3)
{
  uint64_t v6 = sub_2231400E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  os_log_type_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400A8();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_2231400D8();
  os_log_type_t v11 = sub_2231401E8();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v17 = a3;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v18 = v6;
    uint64_t v13 = a1;
    unint64_t v14 = (uint8_t *)v12;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v20 = v15;
    *(_DWORD *)unint64_t v14 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_223138590(v13, a2, &v20);
    sub_2231401F8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_223130000, v10, v11, v17, v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223CAF4C0](v15, -1, -1);
    MEMORY[0x223CAF4C0](v14, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v18);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

BOOL static QueryError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t QueryError.hash(into:)()
{
  return sub_223140358();
}

uint64_t QueryError.hashValue.getter()
{
  return sub_223140368();
}

BOOL sub_22313427C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_223134290()
{
  return sub_223140368();
}

uint64_t sub_2231342D8()
{
  return sub_223140358();
}

uint64_t sub_223134304()
{
  return sub_223140368();
}

unint64_t sub_22313434C()
{
  unint64_t result = qword_267F9CE40;
  if (!qword_267F9CE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F9CE40);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for QueryError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for QueryError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x22313451CLL);
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

uint64_t sub_223134544(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_223134550(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for QueryError()
{
  return &type metadata for QueryError;
}

uint64_t sub_223134568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v7 = sub_2231400E8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_223140108();
  id v11 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v12 = (void *)sub_2231400F8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithMachServiceName_options_, v12, 0);

  id v14 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26D62DA08);
  objc_msgSend(v13, sel_setRemoteObjectInterface_, v14);

  v39 = sub_223133C38;
  v40 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  v37 = sub_223134EF8;
  v38 = &block_descriptor_57;
  uint64_t v15 = _Block_copy(&aBlock);
  objc_msgSend(v13, sel_setInvalidationHandler_, v15);
  _Block_release(v15);
  v39 = sub_223133C44;
  v40 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  v37 = sub_223134EF8;
  v38 = &block_descriptor_60;
  uint64_t v16 = _Block_copy(&aBlock);
  objc_msgSend(v13, sel_setInterruptionHandler_, v16);
  _Block_release(v16);
  objc_msgSend(v13, sel_resume);
  v39 = sub_223133C50;
  v40 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  v37 = sub_223134F3C;
  v38 = &block_descriptor_63;
  uint64_t v17 = _Block_copy(&aBlock);
  id v18 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_223140218();
  swift_unknownObjectRelease();
  sub_22313A3D0((uint64_t)v34, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD599F8);
  if (swift_dynamicCast())
  {
    uint64_t v19 = v33;
    uint64_t v20 = (void *)sub_2231400F8();
    v21 = (void *)swift_allocObject();
    v21[2] = v4;
    v21[3] = a1;
    uint64_t v22 = v31;
    uint64_t v23 = v32;
    v21[4] = a2;
    v21[5] = v22;
    v21[6] = v23;
    v39 = sub_22313A500;
    v40 = v21;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v36 = 1107296256;
    v37 = sub_223135D14;
    v38 = &block_descriptor_69;
    v24 = _Block_copy(&aBlock);
    id v25 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v19, sel_createEndpointNamed_completion_, v20, v24);
    _Block_release(v24);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_2231400A8();
    v26 = sub_2231400D8();
    os_log_type_t v27 = sub_2231401E8();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_223130000, v26, v27, "Proxy does not conform to endpoint interface", v28, 2u);
      MEMORY[0x223CAF4C0](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
}

uint64_t sub_223134A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v7 = sub_2231400E8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_223140108();
  id v11 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v12 = (void *)sub_2231400F8();
  swift_bridgeObjectRelease();
  id v13 = objc_msgSend(v11, sel_initWithMachServiceName_options_, v12, 0);

  id v14 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26D62DA08);
  objc_msgSend(v13, sel_setRemoteObjectInterface_, v14);

  v39 = sub_223133C38;
  v40 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  v37 = sub_223134EF8;
  v38 = &block_descriptor_27;
  uint64_t v15 = _Block_copy(&aBlock);
  objc_msgSend(v13, sel_setInvalidationHandler_, v15);
  _Block_release(v15);
  v39 = sub_223133C44;
  v40 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  v37 = sub_223134EF8;
  v38 = &block_descriptor_30;
  uint64_t v16 = _Block_copy(&aBlock);
  objc_msgSend(v13, sel_setInterruptionHandler_, v16);
  _Block_release(v16);
  objc_msgSend(v13, sel_resume);
  v39 = sub_223133C50;
  v40 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v36 = 1107296256;
  v37 = sub_223134F3C;
  v38 = &block_descriptor_33;
  uint64_t v17 = _Block_copy(&aBlock);
  id v18 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v17);
  _Block_release(v17);
  sub_223140218();
  swift_unknownObjectRelease();
  sub_22313A3D0((uint64_t)v34, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD599F8);
  if (swift_dynamicCast())
  {
    uint64_t v19 = v33;
    uint64_t v20 = (void *)sub_2231400F8();
    v21 = (void *)swift_allocObject();
    v21[2] = v4;
    v21[3] = a1;
    uint64_t v22 = v31;
    uint64_t v23 = v32;
    v21[4] = a2;
    v21[5] = v22;
    v21[6] = v23;
    v39 = sub_22313A430;
    v40 = v21;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v36 = 1107296256;
    v37 = sub_223135D14;
    v38 = &block_descriptor_39;
    v24 = _Block_copy(&aBlock);
    id v25 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v19, sel_createEndpointNamed_completion_, v20, v24);
    _Block_release(v24);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_2231400A8();
    v26 = sub_2231400D8();
    os_log_type_t v27 = sub_2231401E8();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_223130000, v26, v27, "Proxy does not conform to endpoint interface", v28, 2u);
      MEMORY[0x223CAF4C0](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
}

uint64_t sub_223134EF8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_223134F3C(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_223134FA4(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, void (*a6)(id), uint64_t a7)
{
  uint64_t v46 = a7;
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v13 = sub_2231400E8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v42 - v18;
  if (a1)
  {
    v44 = a6;
    uint64_t v47 = v14;
    id v20 = objc_allocWithZone(MEMORY[0x263F08D68]);
    id v21 = a1;
    id v22 = objc_msgSend(v20, sel_initWithListenerEndpoint_, v21);
    id v23 = (id)AACTransportInterface();
    objc_msgSend(v22, sel_setExportedInterface_, v23);

    id v24 = (id)AACTransportInterface();
    objc_msgSend(v22, sel_setRemoteObjectInterface_, v24);

    objc_msgSend(v22, sel_setExportedObject_, a3);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = a4;
    *(void *)(v25 + 24) = a5;
    v53 = sub_22313B240;
    uint64_t v54 = v25;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v50 = 1107296256;
    v51 = sub_223134EF8;
    v52 = &block_descriptor_76;
    v26 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v22, sel_setInvalidationHandler_, v26);
    _Block_release(v26);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = a4;
    *(void *)(v27 + 24) = a5;
    v53 = sub_22313B244;
    uint64_t v54 = v27;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v50 = 1107296256;
    v51 = sub_223134EF8;
    v52 = &block_descriptor_83;
    v28 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v22, sel_setInterruptionHandler_, v28);
    _Block_release(v28);
    objc_msgSend(v22, sel_resume);
    sub_2231400A8();
    swift_bridgeObjectRetain_n();
    v29 = sub_2231400D8();
    os_log_type_t v30 = sub_2231401E8();
    if (os_log_type_enabled(v29, v30))
    {
      id v43 = v21;
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t aBlock = v32;
      uint64_t v45 = v13;
      *(_DWORD *)uint64_t v31 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_223138590(a4, a5, &aBlock);
      id v21 = v43;
      sub_2231401F8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_223130000, v29, v30, "XPC endpoint connection setup complete for %{public}s.", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v32, -1, -1);
      MEMORY[0x223CAF4C0](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v47 + 8))(v19, v45);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v19, v13);
    }
    v44(v22);
  }
  else
  {
    uint64_t v45 = v13;
    sub_2231400A8();
    swift_bridgeObjectRetain();
    id v33 = a2;
    swift_bridgeObjectRetain();
    id v34 = a2;
    v35 = sub_2231400D8();
    os_log_type_t v36 = sub_2231401D8();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v47 = v14;
      uint64_t v37 = swift_slowAlloc();
      v38 = (void *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      uint64_t aBlock = v46;
      *(_DWORD *)uint64_t v37 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_223138590(a4, a5, &aBlock);
      sub_2231401F8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v37 + 12) = 2114;
      if (a2)
      {
        id v39 = a2;
        uint64_t v40 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v48 = v40;
        sub_2231401F8();
      }
      else
      {
        uint64_t v48 = 0;
        sub_2231401F8();
        uint64_t v40 = 0;
      }
      uint64_t v14 = v47;
      void *v38 = v40;

      _os_log_impl(&dword_223130000, v35, v36, "Unable to establish XPC endpoint connection for %{public}s. Error: %{public}@", (uint8_t *)v37, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CE70);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v38, -1, -1);
      uint64_t v41 = v46;
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v41, -1, -1);
      MEMORY[0x223CAF4C0](v37, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v45);
  }
}

void sub_22313565C(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, void (*a6)(id), uint64_t a7)
{
  uint64_t v46 = a7;
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v13 = sub_2231400E8();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v42 - v18;
  if (a1)
  {
    v44 = a6;
    uint64_t v47 = v14;
    id v20 = objc_allocWithZone(MEMORY[0x263F08D68]);
    id v21 = a1;
    id v22 = objc_msgSend(v20, sel_initWithListenerEndpoint_, v21);
    id v23 = (id)AACTransportInterface();
    objc_msgSend(v22, sel_setExportedInterface_, v23);

    id v24 = (id)AACTransportInterface();
    objc_msgSend(v22, sel_setRemoteObjectInterface_, v24);

    objc_msgSend(v22, sel_setExportedObject_, a3);
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = a4;
    *(void *)(v25 + 24) = a5;
    v53 = sub_22313A480;
    uint64_t v54 = v25;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v50 = 1107296256;
    v51 = sub_223134EF8;
    v52 = &block_descriptor_45;
    v26 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v22, sel_setInvalidationHandler_, v26);
    _Block_release(v26);
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = a4;
    *(void *)(v27 + 24) = a5;
    v53 = sub_22313A488;
    uint64_t v54 = v27;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v50 = 1107296256;
    v51 = sub_223134EF8;
    v52 = &block_descriptor_51;
    v28 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v22, sel_setInterruptionHandler_, v28);
    _Block_release(v28);
    objc_msgSend(v22, sel_resume);
    sub_2231400A8();
    swift_bridgeObjectRetain_n();
    v29 = sub_2231400D8();
    os_log_type_t v30 = sub_2231401E8();
    if (os_log_type_enabled(v29, v30))
    {
      id v43 = v21;
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t aBlock = v32;
      uint64_t v45 = v13;
      *(_DWORD *)uint64_t v31 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_223138590(a4, a5, &aBlock);
      id v21 = v43;
      sub_2231401F8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_223130000, v29, v30, "XPC endpoint connection setup complete for %{public}s.", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v32, -1, -1);
      MEMORY[0x223CAF4C0](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v47 + 8))(v19, v45);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v19, v13);
    }
    v44(v22);
  }
  else
  {
    uint64_t v45 = v13;
    sub_2231400A8();
    swift_bridgeObjectRetain();
    id v33 = a2;
    swift_bridgeObjectRetain();
    id v34 = a2;
    v35 = sub_2231400D8();
    os_log_type_t v36 = sub_2231401D8();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v47 = v14;
      uint64_t v37 = swift_slowAlloc();
      v38 = (void *)swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      uint64_t aBlock = v46;
      *(_DWORD *)uint64_t v37 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_223138590(a4, a5, &aBlock);
      sub_2231401F8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v37 + 12) = 2114;
      if (a2)
      {
        id v39 = a2;
        uint64_t v40 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v48 = v40;
        sub_2231401F8();
      }
      else
      {
        uint64_t v48 = 0;
        sub_2231401F8();
        uint64_t v40 = 0;
      }
      uint64_t v14 = v47;
      void *v38 = v40;

      _os_log_impl(&dword_223130000, v35, v36, "Unable to establish XPC endpoint connection for %{public}s. Error: %{public}@", (uint8_t *)v37, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CE70);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v38, -1, -1);
      uint64_t v41 = v46;
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v41, -1, -1);
      MEMORY[0x223CAF4C0](v37, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v45);
  }
}

void sub_223135D14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id ActivityAwardsDateQuery.__allocating_init(dateComponents:initialAwardsHandler:updateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v11 = objc_allocWithZone(v5);
  id v12 = sub_223139C20(a1, a2, a3, a4, a5);
  swift_release();
  swift_release();
  return v12;
}

id ActivityAwardsDateQuery.init(dateComponents:initialAwardsHandler:updateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5 = sub_223139C20(a1, a2, a3, a4, a5);
  swift_release();
  swift_release();
  return v5;
}

uint64_t sub_223135E64()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents;
  uint64_t v2 = sub_22313FF98();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();

  return swift_release();
}

id ActivityAwardsDateQuery.__deallocating_deinit()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CE48);
  sub_22313FFE8();
  swift_release();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAwardsDateQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_223136114(uint64_t a1)
{
  objc_super v2 = v1;
  uint64_t v4 = sub_22313FF98();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)sub_22313FF88();
  id v9 = (id)ACHYearMonthDayStringFromDateComponents();

  if (v9)
  {

    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t v10 = &v2[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents];
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v10, v7, v4);
    uint64_t result = swift_endAccess();
    uint64_t v12 = OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_isActive;
    if (v2[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_isActive] == 1)
    {
      MEMORY[0x270FA5388](result);
      *(&v19 - 2) = (uint64_t)v2;
      sub_22313FFE8();
      uint64_t v13 = sub_223140108();
      uint64_t v15 = v14;
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v2;
      uint64_t v17 = v2;
      sub_223134568(v13, v15, (uint64_t)sub_223139EA4, v16);
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
      v2[v12] = 1;
    }
  }
  else
  {
    sub_223139DFC();
    swift_allocError();
    *uint64_t v18 = 0;
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_223136384(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    objc_super v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CEC0);
  objc_super v2 = (void *)sub_2231402A8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    id v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_223138CA0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    id v11 = (uint64_t *)(v2[6] + 16 * result);
    *id v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
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

uint64_t sub_2231364A0()
{
  v1[23] = v0;
  uint64_t v2 = sub_22313FF98();
  v1[24] = v2;
  v1[25] = *(void *)(v2 - 8);
  v1[26] = swift_task_alloc();
  uint64_t v3 = sub_2231400E8();
  v1[27] = v3;
  v1[28] = *(void *)(v3 - 8);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2231365CC, 0, 0);
}

uint64_t sub_2231365CC()
{
  sub_2231400A8();
  uint64_t v1 = sub_2231400D8();
  os_log_type_t v2 = sub_2231401E8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_223130000, v1, v2, "Running query immediately.", v3, 2u);
    MEMORY[0x223CAF4C0](v3, -1, -1);
  }
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[27];
  uint64_t v6 = v0[28];
  uint64_t v7 = v0[23];

  id v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v8(v4, v5);
  id v9 = (void *)swift_task_alloc();
  v9[2] = v7;
  v9[3] = sub_223136E0C;
  v9[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD599F0);
  sub_22313FFE8();
  v35 = v8;
  swift_task_dealloc();
  id v34 = (id)v0[22];
  v0[31] = v34;
  sub_2231400A8();
  uint64_t v12 = sub_2231400D8();
  os_log_type_t v13 = sub_2231401E8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_223130000, v12, v13, "Obtained proxy for query run. Sending transport request.", v14, 2u);
    MEMORY[0x223CAF4C0](v14, -1, -1);
  }
  uint64_t v15 = v0[29];
  uint64_t v17 = v0[26];
  uint64_t v16 = v0[27];
  uint64_t v19 = v0[24];
  uint64_t v18 = v0[25];
  uint64_t v20 = v0[23];

  v35(v15, v16);
  uint64_t v21 = v20 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v21, v19);
  id v22 = (void *)sub_22313FF88();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  id v23 = (id)ACHYearMonthDayStringFromDateComponents();

  if (v23)
  {
    uint64_t v24 = sub_223140108();
    uint64_t v26 = v25;

    v0[18] = v24;
    v0[19] = v26;
    uint64_t v27 = sub_223140038();
    v0[32] = 0;
    v0[33] = v27;
    v0[34] = v28;
    uint64_t v30 = v27;
    unint64_t v31 = v28;
    swift_bridgeObjectRelease();
    if (v31 >> 60 == 15)
    {
      uint64_t v32 = 0;
    }
    else
    {
      sub_223139EDC(v30, v31);
      uint64_t v32 = sub_22313FFB8();
      sub_223133654(v30, v31);
    }
    v0[35] = v32;
    v0[2] = v0;
    v0[7] = v0 + 20;
    v0[3] = sub_223136A84;
    uint64_t v33 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_223137040;
    v0[13] = &block_descriptor;
    v0[14] = v33;
    objc_msgSend(v34, sel_transportRequest_data_completion_, 6, v32, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    sub_223139DFC();
    swift_allocError();
    unsigned char *v29 = 0;
    swift_willThrow();
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    char v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
}

uint64_t sub_223136A84()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 288) = v1;
  if (v1) {
    os_log_type_t v2 = sub_223136D5C;
  }
  else {
    os_log_type_t v2 = sub_223136B94;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_223136B94()
{
  uint64_t v1 = *(void **)(v0 + 256);
  uint64_t v2 = *(void *)(v0 + 160);
  unint64_t v3 = *(void *)(v0 + 168);

  sub_223140098();
  sub_223139EC8(v2, v3);
  sub_223140088();
  uint64_t v5 = *(void *)(v0 + 264);
  unint64_t v4 = *(void *)(v0 + 272);
  if (v1)
  {

    sub_223139DFC();
    swift_allocError();
    *uint64_t v6 = 1;
    swift_willThrow();
    sub_223133654(v2, v3);
    sub_223133654(v5, v4);
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  else
  {
    uint64_t v10 = sub_223140078();
    swift_release();
    sub_223133654(v2, v3);
    sub_223133654(v5, v4);
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v9(v10);
  }
}

uint64_t sub_223136D5C()
{
  uint64_t v1 = (void *)v0[35];
  uint64_t v2 = v0[33];
  unint64_t v3 = v0[34];
  swift_willThrow();
  sub_223133654(v2, v3);
  swift_unknownObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_223136E0C(void *a1)
{
  uint64_t v2 = sub_2231400E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400A8();
  id v6 = a1;
  id v7 = a1;
  id v8 = sub_2231400D8();
  os_log_type_t v9 = sub_2231401D8();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v2;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    swift_getErrorValue();
    uint64_t v13 = sub_2231402F8();
    uint64_t v18 = sub_223138590(v13, v14, &v19);
    sub_2231401F8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_223130000, v8, v9, "Unable to get proxy: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223CAF4C0](v12, -1, -1);
    MEMORY[0x223CAF4C0](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_223137040(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CE88);
    uint64_t v5 = swift_allocError();
    *id v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    if (a2)
    {
      id v8 = a2;
      uint64_t v9 = sub_22313FFC8();
      unint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v11 = 0xF000000000000000;
    }
    v13[0] = v9;
    v13[1] = v11;
    sub_22313A494((uint64_t)v13, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_22313712C()
{
  uint64_t v1 = sub_223140108();
  uint64_t v3 = v2;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v0;
  uint64_t v5 = v0;
  sub_223134568(v1, v3, (uint64_t)sub_223139EA4, v4);
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  v5[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_isActive] = 1;
  return result;
}

uint64_t sub_2231371E0(char *a1, void *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD599E0);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2231400E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void **)&a1[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection];
  *(void *)&a1[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection] = a2;
  id v13 = a2;

  aBlock[4] = (uint64_t)sub_2231376B4;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_223134F3C;
  aBlock[3] = (uint64_t)&block_descriptor_86;
  unint64_t v14 = _Block_copy(aBlock);
  id v15 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v14);
  _Block_release(v14);
  sub_223140218();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD599F0);
  if (swift_dynamicCast())
  {
    uint64_t v16 = v32;
    sub_2231401A8();
    uint64_t v17 = sub_2231401C8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 0, 1, v17);
    uint64_t v18 = (void *)swift_allocObject();
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = v16;
    v18[5] = a1;
    swift_unknownObjectRetain();
    uint64_t v19 = a1;
    sub_22313C994((uint64_t)v7, (uint64_t)&unk_267F9CEA8, (uint64_t)v18);
    swift_release();
    aBlock[0] = (uint64_t)v19;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v19;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = sub_22313A654;
    *(void *)(v21 + 24) = v20;
    type metadata accessor for ActivityAwardsDateQuery();
    sub_223140098();
    sub_22313A69C(&qword_267F9CEB0, (void (*)(uint64_t))type metadata accessor for ActivityAwardsDateQuery);
    id v22 = v19;
    sub_223140028();
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_2231400A8();
    uint64_t v24 = sub_2231400D8();
    os_log_type_t v25 = sub_2231401E8();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v30[1] = v2;
      aBlock[0] = v27;
      *(_DWORD *)uint64_t v26 = 136446210;
      v30[0] = v8;
      uint64_t v28 = sub_223140108();
      uint64_t v32 = sub_223138590(v28, v29, aBlock);
      sub_2231401F8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_223130000, v24, v25, "XPC client-side connection failed to get expected proxy type for %{public}s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v27, -1, -1);
      MEMORY[0x223CAF4C0](v26, -1, -1);

      return (*(uint64_t (**)(char *, void))(v9 + 8))(v11, v30[0]);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
}

uint64_t sub_2231376B4()
{
  uint64_t v0 = sub_2231400E8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400A8();
  uint64_t v4 = sub_2231400D8();
  os_log_type_t v5 = sub_2231401E8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446210;
    uint64_t v12 = v7;
    uint64_t v8 = sub_223140108();
    uint64_t v11 = sub_223138590(v8, v9, &v12);
    sub_2231401F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_223130000, v4, v5, "XPC client-side connection failed to get proxy for %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223CAF4C0](v7, -1, -1);
    MEMORY[0x223CAF4C0](v6, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22313788C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[22] = a4;
  v5[23] = a5;
  uint64_t v6 = sub_22313FF98();
  v5[24] = v6;
  v5[25] = *(void *)(v6 - 8);
  v5[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22313794C, 0, 0);
}

uint64_t sub_22313794C()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  uint64_t v4 = v0[23] + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  os_log_type_t v5 = (void *)sub_22313FF88();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  id v6 = (id)ACHYearMonthDayStringFromDateComponents();

  if (v6)
  {
    uint64_t v7 = sub_223140108();
    uint64_t v9 = v8;

    v0[20] = v7;
    v0[21] = v9;
    uint64_t v10 = sub_223140038();
    unint64_t v12 = v11;
    v0[27] = 0;
    swift_bridgeObjectRelease();
    if (v12 >> 60 == 15)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = sub_22313FFB8();
      sub_223133654(v10, v12);
    }
    v0[28] = v13;
    uint64_t v17 = (void *)v0[22];
    v0[2] = v0;
    v0[7] = v0 + 18;
    v0[3] = sub_223137BEC;
    uint64_t v18 = swift_continuation_init();
    v0[10] = MEMORY[0x263EF8330];
    v0[11] = 0x40000000;
    v0[12] = sub_223137040;
    v0[13] = &block_descriptor_97;
    v0[14] = v18;
    objc_msgSend(v17, sel_transportRequest_data_completion_, 6, v13, v0 + 10);
    return MEMORY[0x270FA23F0](v0 + 2);
  }
  else
  {
    sub_223139DFC();
    swift_allocError();
    *unint64_t v14 = 0;
    swift_willThrow();
    swift_task_dealloc();
    id v15 = (uint64_t (*)(void))v0[1];
    return v15();
  }
}

uint64_t sub_223137BEC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 232) = v1;
  if (v1) {
    uint64_t v2 = sub_223137E64;
  }
  else {
    uint64_t v2 = sub_223137CFC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_223137CFC()
{
  uint64_t v1 = *(void **)(v0 + 216);
  uint64_t v2 = *(void *)(v0 + 144);
  unint64_t v3 = *(void *)(v0 + 152);

  sub_223140098();
  sub_223139EC8(v2, v3);
  sub_223140088();
  if (v1)
  {

    sub_223139DFC();
    swift_allocError();
    unsigned char *v4 = 1;
    swift_willThrow();
  }
  else
  {
    uint64_t v6 = *(void *)(v0 + 184);
    unint64_t v7 = sub_223140078();
    uint64_t v8 = sub_22313A7D8(v7);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t))(v6
                                    + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_initialAwardsHandler))(v8);
    swift_bridgeObjectRelease();
    swift_release();
  }
  sub_223133654(v2, v3);
  swift_task_dealloc();
  os_log_type_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_223137E64()
{
  uint64_t v1 = *(void **)(v0 + 224);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_223137EDC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = sub_223140078();
  uint64_t v4 = sub_22313A7D8(v3);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(a2
                                  + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_updateAwardsHandler))(v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_223137F50()
{
  return sub_22313FFE8();
}

id sub_223137FBC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection), sel_invalidate);
}

void sub_223138064(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = sub_223140108();
  sub_22313B2A0(v8, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void **)(a1 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection);
  if (v10)
  {
    aBlock[4] = a2;
    aBlock[5] = a3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_223134F3C;
    aBlock[3] = &block_descriptor_54;
    unint64_t v11 = _Block_copy(aBlock);
    id v12 = v10;
    swift_retain();
    swift_release();
    id v13 = objc_msgSend(v12, sel_synchronousRemoteObjectProxyWithErrorHandler_, v11);
    _Block_release(v11);
    sub_223140218();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD599F0);
    if (swift_dynamicCast())
    {

      *a4 = v18;
    }
    else
    {
      uint64_t v16 = sub_22313FFD8();
      sub_22313A69C((unint64_t *)&unk_267F9CE90, MEMORY[0x263F238F0]);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v17, *MEMORY[0x263F238E0], v16);
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v14 = sub_22313FFD8();
    sub_22313A69C((unint64_t *)&unk_267F9CE90, MEMORY[0x263F238F0]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v15, *MEMORY[0x263F238E8], v14);
    swift_willThrow();
  }
}

id ActivityAwardsDateQuery.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivityAwardsDateQuery.init()()
{
}

uint64_t sub_2231383A0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2231383B0(uint64_t (*a1)(void))
{
  uint64_t result = a1();
  if (result) {
    return _swift_stdlib_bridgeErrorToNSError();
  }
  return result;
}

void *sub_2231383E0(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CEB8);
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
    sub_22313A6E4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2231384F0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_223138518(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_223138590(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2231401F8();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_223138590(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_223138664(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22313A3D0((uint64_t)v12, *a3);
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
      sub_22313A3D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_223138664(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_223140208();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_223138820(a5, a6);
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
  uint64_t v8 = sub_223140258();
  if (!v8)
  {
    sub_223140268();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2231402B8();
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

uint64_t sub_223138820(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2231388B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_223138A98(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_223138A98(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2231388B8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_223138A30(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_223140228();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_223140268();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_223140128();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2231402B8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_223140268();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_223138A30(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F9CE78);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_223138A98(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F9CE78);
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
  uint64_t result = sub_2231402B8();
  __break(1u);
  return result;
}

void sub_223138BE8(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_2231401F8();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_223138CA0(uint64_t a1, uint64_t a2)
{
  sub_223140348();
  sub_223140118();
  uint64_t v4 = sub_223140368();
  return sub_223139364(a1, a2, v4);
}

uint64_t sub_223138D18(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_223140278();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_223140278();
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
  *id v1 = v4;
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
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x223CAEEC0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *id v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_2231395FC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_223140278();
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
  return sub_223140148();
}

uint64_t sub_223138EE4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CEC0);
  char v38 = a2;
  uint64_t v6 = sub_223140298();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    id v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_223140348();
    sub_223140118();
    uint64_t result = sub_223140368();
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
  uint64_t v3 = v35;
  id v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_2231391F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_223138CA0(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_223139448();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_223138EE4(v15, a4 & 1);
  unint64_t v20 = sub_223138CA0(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_2231402E8();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  id v22 = (uint64_t *)(v18[6] + 16 * v12);
  *id v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;
  swift_bridgeObjectRetain();
}

unint64_t sub_223139364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2231402C8() & 1) == 0)
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
      while (!v14 && (sub_2231402C8() & 1) == 0);
    }
  }
  return v6;
}

id sub_223139448()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CEC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_223140288();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2231395FC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_223140278();
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
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_223140278();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22313B17C();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CED0);
          unint64_t v12 = sub_223139800(v16, i, a3);
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
    sub_22313B13C();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2231402B8();
  __break(1u);
  return result;
}

void (*sub_223139800(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2231398B0(v6, a2, a3);
  return sub_223139868;
}

void sub_223139868(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2231398B0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x223CAEEB0](a2, a3);
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
    return sub_223139930;
  }
  __break(1u);
  return result;
}

void sub_223139930(id *a1)
{
}

void *sub_223139938(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F9CEE0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  unint64_t v6 = sub_223139A24(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_22313B220();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_223139A24(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
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
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
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
    unint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    uint64_t result = v20;
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

id sub_223139C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection] = 0;
  v5[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_isActive] = 0;
  sub_223140008();
  swift_allocObject();
  uint64_t v11 = v5;
  *(void *)&v11[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_lock] = sub_22313FFF8();
  int64_t v12 = &v11[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_dateComponents];
  uint64_t v13 = sub_22313FF98();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);
  unint64_t v15 = &v11[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_initialAwardsHandler];
  *(void *)unint64_t v15 = a2;
  *((void *)v15 + 1) = a3;
  unint64_t v16 = &v11[OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_updateAwardsHandler];
  *(void *)unint64_t v16 = a4;
  *((void *)v16 + 1) = a5;
  swift_retain();
  swift_retain();

  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for ActivityAwardsDateQuery();
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v17;
}

id sub_223139D98@<X0>(BOOL *a1@<X8>)
{
  return sub_22313A370(a1);
}

uint64_t type metadata accessor for ActivityAwardsDateQuery()
{
  uint64_t result = qword_26AD59980;
  if (!qword_26AD59980) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_223139DFC()
{
  unint64_t result = qword_267F9CE50;
  if (!qword_267F9CE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F9CE50);
  }
  return result;
}

id sub_223139E50()
{
  return sub_223137FBC(*(void *)(v0 + 16));
}

uint64_t sub_223139E6C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_223139EA8(void *a1@<X8>)
{
  sub_223138064(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_223139EC8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_223139EDC(a1, a2);
  }
  return a1;
}

uint64_t sub_223139EDC(uint64_t a1, unint64_t a2)
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

uint64_t sub_223139F34()
{
  return sub_22313FFE8();
}

uint64_t sub_223139FA0()
{
  return type metadata accessor for ActivityAwardsDateQuery();
}

uint64_t sub_223139FA8()
{
  uint64_t result = sub_22313FF98();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ActivityAwardsDateQuery(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityAwardsDateQuery);
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.__allocating_init(dateComponents:initialAwardsHandler:updateHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.validateAndSetDateComponents(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.runQueryImmediately()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x100);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_22313A1E8;
  return v5();
}

uint64_t sub_22313A1E8(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.activate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of ActivityAwardsDateQuery.deactivate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

id sub_22313A370@<X0>(BOOL *a1@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection);
  if (v3) {
    id result = objc_msgSend(*(id *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection), sel_invalidate);
  }
  *a1 = v3 == 0;
  return result;
}

uint64_t sub_22313A3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22313A430(uint64_t a1, uint64_t a2)
{
  return sub_22313A518(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_22313565C);
}

uint64_t sub_22313A448()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22313A480()
{
  return sub_223133C54(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22313A488()
{
  return sub_223133C60(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_22313A494(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD599D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22313A500(uint64_t a1, uint64_t a2)
{
  return sub_22313A518(a1, a2, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void))sub_223134FA4);
}

uint64_t sub_22313A518(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, void, void, void, void, void))
{
  return a3(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t sub_22313A530()
{
  return sub_2231371E0(*(char **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_22313A54C()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22313A594(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_2231337C8;
  return sub_22313788C(a1, v4, v5, v7, v6);
}

uint64_t sub_22313A654(uint64_t a1)
{
  return sub_223137EDC(a1, *(void *)(v1 + 16));
}

uint64_t sub_22313A65C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22313A694(void *a1)
{
  return sub_22313CB14(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_22313A69C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22313A6E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_2231402B8();
  __break(1u);
  return result;
}

uint64_t sub_22313A7D8(unint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  uint64_t v62 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CEB8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_223140B90;
  *(void *)(inited + 32) = 0xD000000000000012;
  *(void *)(inited + 40) = 0x80000002231410F0;
  *(void *)(inited + 48) = 0xD000000000000012;
  *(void *)(inited + 56) = 0x8000000223141110;
  *(void *)(inited + 64) = 0xD000000000000012;
  *(void *)(inited + 72) = 0x8000000223141130;
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_223140B90;
  strcpy((char *)(v4 + 32), "NewMoveRecord");
  *(_WORD *)(v4 + 46) = -4864;
  *(void *)(v4 + 48) = 0xD000000000000011;
  *(void *)(v4 + 56) = 0x8000000223141150;
  *(void *)(v4 + 64) = 0xD000000000000011;
  *(void *)(v4 + 72) = 0x8000000223141170;
  unint64_t v5 = sub_223136384(v2);
  if (a1 >> 62)
  {
LABEL_98:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_223140278();
    if (v6) {
      goto LABEL_3;
    }
LABEL_99:
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v52 = swift_bridgeObjectRetain();
    v53 = sub_223139938(v52);
    swift_bridgeObjectRelease();
    sub_223138D18((unint64_t)v53);
    swift_bridgeObjectRelease();
    return v62;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_99;
  }
LABEL_3:
  unint64_t v57 = v5;
  unint64_t v7 = 0;
  unint64_t v61 = a1 & 0xC000000000000001;
  uint64_t v59 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  unint64_t v60 = a1;
  v58 = (char *)(a1 + 32);
  while (1)
  {
    if (v61)
    {
      id v9 = (id)MEMORY[0x223CAEEB0](v7, v60);
    }
    else
    {
      if (v7 >= *(void *)(v59 + 16)) {
        goto LABEL_96;
      }
      id v9 = *(id *)&v58[8 * v7];
    }
    a1 = (unint64_t)v9;
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
LABEL_96:
      __break(1u);
LABEL_97:
      __break(1u);
      goto LABEL_98;
    }
    id v11 = objc_msgSend(v9, sel_template);
    id v12 = objc_msgSend(v11, sel_uniqueName);

    if (v12)
    {
      uint64_t v13 = sub_223140108();
      uint64_t v15 = v14;

      LOBYTE(v12) = v13 == 0xD000000000000012;
      if (v13 == 0xD000000000000012 && v15 == 0x80000002231410F0)
      {
        char v16 = 1;
        uint64_t v15 = 0x80000002231410F0;
        uint64_t v13 = 0xD000000000000012;
        goto LABEL_30;
      }
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v15 = 0xE000000000000000;
    }
    if ((sub_2231402C8() & 1) != 0
      || (v15 == 0x8000000223141110 ? (char v17 = (char)v12) : (char v17 = 0),
          (v17 & 1) != 0
       || (sub_2231402C8() & 1) != 0
       || (v15 == 0x8000000223141130 ? (char v18 = (char)v12) : (char v18 = 0), (v18 & 1) != 0 || (sub_2231402C8() & 1) != 0)))
    {
      char v16 = 1;
      if (v13 == 0x5265766F4D77654ELL)
      {
        unint64_t v5 = 0x5265766F4D77654ELL;
        if (v15 == 0xED000064726F6365)
        {
LABEL_43:
          uint64_t v23 = v8[2];
          if (!v23) {
            goto LABEL_49;
          }
LABEL_44:
          if (v8[4] == v5 && v8[5] == v15 || (sub_2231402C8() & 1) != 0)
          {
LABEL_47:

            goto LABEL_89;
          }
          if (v23 != 1)
          {
            if (v8[6] == v5 && v8[7] == v15 || (sub_2231402C8() & 1) != 0) {
              goto LABEL_47;
            }
            if (v23 != 2)
            {
              BOOL v27 = v8 + 9;
              uint64_t v28 = 2;
              do
              {
                uint64_t v29 = v28 + 1;
                if (__OFADD__(v28, 1)) {
                  goto LABEL_97;
                }
                BOOL v30 = *(v27 - 1) == v5 && *v27 == v15;
                if (v30 || (sub_2231402C8() & 1) != 0) {
                  goto LABEL_47;
                }
                v27 += 2;
                ++v28;
              }
              while (v29 != v23);
            }
          }
LABEL_49:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v8 = sub_2231383E0(0, v23 + 1, 1, v8);
          }
          unint64_t v25 = v8[2];
          unint64_t v24 = v8[3];
          if (v25 >= v24 >> 1) {
            uint64_t v8 = sub_2231383E0((void *)(v24 > 1), v25 + 1, 1, v8);
          }
          v8[2] = v25 + 1;
          unint64_t v26 = &v8[2 * v25];
          v26[4] = v5;
          v26[5] = v15;
          goto LABEL_54;
        }
      }
    }
    else
    {
      char v16 = 0;
      if (v13 == 0x5265766F4D77654ELL)
      {
        uint64_t v22 = 0x5265766F4D77654ELL;
        if (v15 == 0xED000064726F6365) {
          goto LABEL_75;
        }
      }
    }
LABEL_30:
    if ((sub_2231402C8() & 1) == 0 && (v13 != 0xD000000000000011 || v15 != 0x8000000223141150))
    {
      unint64_t v5 = 0xD000000000000011;
      char v19 = sub_2231402C8();
      BOOL v20 = v13 == 0xD000000000000011 && v15 == 0x8000000223141170;
      BOOL v21 = v20;
      if ((v19 & 1) == 0 && !v21 && (sub_2231402C8() & 1) == 0)
      {
        if (v16)
        {
          unint64_t v5 = v13;
          uint64_t v23 = v8[2];
          if (!v23) {
            goto LABEL_49;
          }
          goto LABEL_44;
        }
        swift_bridgeObjectRelease();
LABEL_54:
        a1 = (unint64_t)(id)a1;
        MEMORY[0x223CAEDB0]();
        if (*(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_223140158();
        }
        sub_223140168();
        sub_223140148();
        goto LABEL_5;
      }
    }
    unint64_t v5 = v13;
    uint64_t v22 = v13;
    if (v16) {
      goto LABEL_43;
    }
LABEL_75:
    id v31 = objc_msgSend((id)a1, sel_relevantEarnedInstance);
    if (v31) {
      break;
    }
    swift_bridgeObjectRelease();
LABEL_5:

LABEL_6:
    if (v7 == v6) {
      goto LABEL_99;
    }
  }
  unint64_t v5 = (unint64_t)v31;
  id v32 = objc_msgSend(v31, sel_value);
  if (!v32)
  {

    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  id v33 = v32;
  id v34 = objc_msgSend((id)a1, sel_template);
  id v35 = objc_msgSend(v34, sel_canonicalUnit);

  if (v35)
  {
    objc_msgSend(v33, sel_doubleValueForUnit_, v35);
    double v37 = v36;

    if (!*(void *)(v57 + 16)) {
      goto LABEL_87;
    }
    swift_bridgeObjectRetain();
    unint64_t v38 = sub_223138CA0(v22, v15);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_87:
      id v49 = (id)a1;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_2231391F4((uint64_t)v49, v22, v15, isUniquelyReferenced_nonNull_native);
LABEL_88:

      swift_bridgeObjectRelease();
LABEL_89:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    id v40 = *(id *)(*(void *)(v57 + 56) + 8 * v38);
    swift_bridgeObjectRelease();
    id v41 = objc_msgSend(v40, sel_relevantEarnedInstance);
    if (v41)
    {
      uint64_t v42 = v41;
      id v43 = objc_msgSend(v41, sel_value);
      if (!v43)
      {

        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
      v44 = v43;
      uint64_t v55 = v40;
      v56 = v42;
      id v45 = objc_msgSend((id)a1, sel_template);
      id v46 = objc_msgSend(v45, sel_canonicalUnit);

      if (!v46) {
        goto LABEL_101;
      }
      objc_msgSend(v44, sel_doubleValueForUnit_, v46);
      double v48 = v47;

      if (v48 < v37)
      {
        id v49 = (id)a1;
        char v50 = swift_isUniquelyReferenced_nonNull_native();
        sub_2231391F4((uint64_t)v49, v22, v15, v50);

        goto LABEL_88;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    goto LABEL_5;
  }
  swift_release();
  swift_release();
  __break(1u);
LABEL_101:
  swift_release();
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_22313B13C()
{
  unint64_t result = qword_267F9CEC8;
  if (!qword_267F9CEC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F9CEC8);
  }
  return result;
}

unint64_t sub_22313B17C()
{
  unint64_t result = qword_267F9CED8;
  if (!qword_267F9CED8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F9CED0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F9CED8);
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

uint64_t sub_22313B220()
{
  return swift_release();
}

id sub_22313B228()
{
  return sub_223139E50();
}

uint64_t sub_22313B2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_2231400E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_223140108();
  id v9 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v10 = (void *)sub_2231400F8();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithMachServiceName_options_, v10, 0);

  id v12 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26D62DA08);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v12);

  id v32 = sub_223133C38;
  id v33 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v29 = 1107296256;
  BOOL v30 = sub_223134EF8;
  id v31 = &block_descriptor_79;
  uint64_t v13 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInvalidationHandler_, v13);
  _Block_release(v13);
  id v32 = sub_223133C44;
  id v33 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v29 = 1107296256;
  BOOL v30 = sub_223134EF8;
  id v31 = &block_descriptor_82;
  uint64_t v14 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInterruptionHandler_, v14);
  _Block_release(v14);
  objc_msgSend(v11, sel_resume);
  id v32 = sub_223133C50;
  id v33 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v29 = 1107296256;
  BOOL v30 = sub_223134F3C;
  id v31 = &block_descriptor_85;
  uint64_t v15 = _Block_copy(&aBlock);
  id v16 = objc_msgSend(v11, sel_synchronousRemoteObjectProxyWithErrorHandler_, v15);
  _Block_release(v15);
  sub_223140218();
  swift_unknownObjectRelease();
  sub_22313A3D0((uint64_t)v27, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD599F8);
  if (swift_dynamicCast())
  {
    char v17 = (void *)v26[1];
    char v18 = (void *)sub_2231400F8();
    char v19 = (void *)swift_allocObject();
    v19[2] = v2;
    v19[3] = a1;
    v19[4] = a2;
    id v32 = sub_22313FEB0;
    id v33 = v19;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v29 = 1107296256;
    BOOL v30 = sub_223135D14;
    id v31 = &block_descriptor_91;
    BOOL v20 = _Block_copy(&aBlock);
    id v21 = v2;
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v17, sel_createEndpointNamed_completion_, v18, v20);
    _Block_release(v20);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_2231400A8();
    uint64_t v22 = sub_2231400D8();
    os_log_type_t v23 = sub_2231401E8();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_223130000, v22, v23, "Proxy does not conform to endpoint interface", v24, 2u);
      MEMORY[0x223CAF4C0](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
}

uint64_t sub_22313B754(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_2231400E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_223140108();
  id v9 = objc_allocWithZone(MEMORY[0x263F08D68]);
  uint64_t v10 = (void *)sub_2231400F8();
  swift_bridgeObjectRelease();
  id v11 = objc_msgSend(v9, sel_initWithMachServiceName_options_, v10, 0);

  id v12 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_26D62DA08);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v12);

  id v32 = sub_223133C38;
  id v33 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v29 = 1107296256;
  BOOL v30 = sub_223134EF8;
  id v31 = &block_descriptor_52;
  uint64_t v13 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInvalidationHandler_, v13);
  _Block_release(v13);
  id v32 = sub_223133C44;
  id v33 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v29 = 1107296256;
  BOOL v30 = sub_223134EF8;
  id v31 = &block_descriptor_55;
  uint64_t v14 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInterruptionHandler_, v14);
  _Block_release(v14);
  objc_msgSend(v11, sel_resume);
  id v32 = sub_223133C50;
  id v33 = 0;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v29 = 1107296256;
  BOOL v30 = sub_223134F3C;
  id v31 = &block_descriptor_58;
  uint64_t v15 = _Block_copy(&aBlock);
  id v16 = objc_msgSend(v11, sel_synchronousRemoteObjectProxyWithErrorHandler_, v15);
  _Block_release(v15);
  sub_223140218();
  swift_unknownObjectRelease();
  sub_22313A3D0((uint64_t)v27, (uint64_t)&aBlock);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD599F8);
  if (swift_dynamicCast())
  {
    char v17 = (void *)v26[1];
    char v18 = (void *)sub_2231400F8();
    char v19 = (void *)swift_allocObject();
    v19[2] = v2;
    v19[3] = a1;
    v19[4] = a2;
    id v32 = sub_22313FE60;
    id v33 = v19;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v29 = 1107296256;
    BOOL v30 = sub_223135D14;
    id v31 = &block_descriptor_64;
    BOOL v20 = _Block_copy(&aBlock);
    id v21 = v2;
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v17, sel_createEndpointNamed_completion_, v18, v20);
    _Block_release(v20);

    swift_unknownObjectRelease();
  }
  else
  {
    sub_2231400A8();
    uint64_t v22 = sub_2231400D8();
    os_log_type_t v23 = sub_2231401E8();
    if (os_log_type_enabled(v22, v23))
    {
      unint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v24 = 0;
      _os_log_impl(&dword_223130000, v22, v23, "Proxy does not conform to endpoint interface", v24, 2u);
      MEMORY[0x223CAF4C0](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
}

uint64_t sub_22313BC08(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v10 = sub_2231400E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v41 - v15;
  if (a1)
  {
    uint64_t v44 = v11;
    id v17 = objc_allocWithZone(MEMORY[0x263F08D68]);
    id v42 = a1;
    id v18 = objc_msgSend(v17, sel_initWithListenerEndpoint_);
    id v19 = (id)AACTransportInterface();
    objc_msgSend(v18, sel_setExportedInterface_, v19);

    id v20 = (id)AACTransportInterface();
    objc_msgSend(v18, sel_setRemoteObjectInterface_, v20);

    objc_msgSend(v18, sel_setExportedObject_, a3);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a4;
    *(void *)(v21 + 24) = a5;
    char v50 = sub_22313B240;
    uint64_t v51 = v21;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v47 = 1107296256;
    double v48 = sub_223134EF8;
    id v49 = &block_descriptor_98;
    uint64_t v22 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_setInvalidationHandler_, v22);
    _Block_release(v22);
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = a4;
    *(void *)(v23 + 24) = a5;
    char v50 = sub_22313B244;
    uint64_t v51 = v23;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v47 = 1107296256;
    double v48 = sub_223134EF8;
    id v49 = &block_descriptor_105;
    unint64_t v24 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_setInterruptionHandler_, v24);
    _Block_release(v24);
    objc_msgSend(v18, sel_resume);
    unint64_t v25 = *(void **)(a3 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection);
    *(void *)(a3 + OBJC_IVAR____TtC18ActivityAwardsCore23ActivityAwardsDateQuery_connection) = v18;
    id v26 = v18;

    sub_2231400A8();
    swift_bridgeObjectRetain_n();
    BOOL v27 = sub_2231400D8();
    os_log_type_t v28 = sub_2231401E8();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t aBlock = v30;
      uint64_t v43 = v10;
      *(_DWORD *)uint64_t v29 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_223138590(a4, a5, &aBlock);
      sub_2231401F8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_223130000, v27, v28, "XPC endpoint setup complete for %{public}s.", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v30, -1, -1);
      MEMORY[0x223CAF4C0](v29, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v16, v43);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v16, v10);
    }
  }
  else
  {
    uint64_t v43 = v10;
    sub_2231400A8();
    swift_bridgeObjectRetain();
    id v32 = a2;
    swift_bridgeObjectRetain();
    id v33 = a2;
    id v34 = sub_2231400D8();
    os_log_type_t v35 = sub_2231401D8();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v44 = v11;
      uint64_t v36 = swift_slowAlloc();
      double v37 = (void *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t aBlock = v38;
      *(_DWORD *)uint64_t v36 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_223138590(a4, a5, &aBlock);
      sub_2231401F8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2114;
      if (a2)
      {
        id v39 = a2;
        uint64_t v40 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v45 = v40;
        sub_2231401F8();
      }
      else
      {
        uint64_t v45 = 0;
        sub_2231401F8();
        uint64_t v40 = 0;
      }
      void *v37 = v40;

      _os_log_impl(&dword_223130000, v34, v35, "Unable to establish XPC endpoint connection for %{public}s. Error: %{public}@", (uint8_t *)v36, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CE70);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v37, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v38, -1, -1);
      MEMORY[0x223CAF4C0](v36, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v14, v43);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v43);
    }
  }
}

uint64_t sub_22313C2D0(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v10 = sub_2231400E8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v41 - v15;
  if (a1)
  {
    uint64_t v44 = v11;
    id v17 = objc_allocWithZone(MEMORY[0x263F08D68]);
    id v42 = a1;
    id v18 = objc_msgSend(v17, sel_initWithListenerEndpoint_);
    id v19 = (id)AACTransportInterface();
    objc_msgSend(v18, sel_setExportedInterface_, v19);

    id v20 = (id)AACTransportInterface();
    objc_msgSend(v18, sel_setRemoteObjectInterface_, v20);

    objc_msgSend(v18, sel_setExportedObject_, a3);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a4;
    *(void *)(v21 + 24) = a5;
    char v50 = sub_22313A480;
    uint64_t v51 = v21;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v47 = 1107296256;
    double v48 = sub_223134EF8;
    id v49 = &block_descriptor_70;
    uint64_t v22 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_setInvalidationHandler_, v22);
    _Block_release(v22);
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = a4;
    *(void *)(v23 + 24) = a5;
    char v50 = sub_22313A488;
    uint64_t v51 = v23;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v47 = 1107296256;
    double v48 = sub_223134EF8;
    id v49 = &block_descriptor_76_0;
    unint64_t v24 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_setInterruptionHandler_, v24);
    _Block_release(v24);
    objc_msgSend(v18, sel_resume);
    unint64_t v25 = *(void **)(a3 + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection);
    *(void *)(a3 + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection) = v18;
    id v26 = v18;

    sub_2231400A8();
    swift_bridgeObjectRetain_n();
    BOOL v27 = sub_2231400D8();
    os_log_type_t v28 = sub_2231401E8();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t aBlock = v30;
      uint64_t v43 = v10;
      *(_DWORD *)uint64_t v29 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_223138590(a4, a5, &aBlock);
      sub_2231401F8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_223130000, v27, v28, "XPC endpoint setup complete for %{public}s.", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v30, -1, -1);
      MEMORY[0x223CAF4C0](v29, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v16, v43);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v16, v10);
    }
  }
  else
  {
    uint64_t v43 = v10;
    sub_2231400A8();
    swift_bridgeObjectRetain();
    id v32 = a2;
    swift_bridgeObjectRetain();
    id v33 = a2;
    id v34 = sub_2231400D8();
    os_log_type_t v35 = sub_2231401D8();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v44 = v11;
      uint64_t v36 = swift_slowAlloc();
      double v37 = (void *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t aBlock = v38;
      *(_DWORD *)uint64_t v36 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_223138590(a4, a5, &aBlock);
      sub_2231401F8();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2114;
      if (a2)
      {
        id v39 = a2;
        uint64_t v40 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v45 = v40;
        sub_2231401F8();
      }
      else
      {
        uint64_t v45 = 0;
        sub_2231401F8();
        uint64_t v40 = 0;
      }
      void *v37 = v40;

      _os_log_impl(&dword_223130000, v34, v35, "Unable to establish XPC endpoint connection for %{public}s. Error: %{public}@", (uint8_t *)v36, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CE70);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v37, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v38, -1, -1);
      MEMORY[0x223CAF4C0](v36, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v14, v43);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v43);
    }
  }
}

uint64_t sub_22313C994(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_2231401C8();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2231401B8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_223133A50(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_223140178();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_22313CB14(void *a1, uint64_t (*a2)(void))
{
  return a2(*a1);
}

id ActivityAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v17 = objc_allocWithZone(v8);
  id v18 = sub_22313F648(a1, a2, a3, a4, a5, a6, a7, a8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v18;
}

id ActivityAwardsQuery.init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8 = sub_22313F648(a1, a2, a3, a4, a5, a6, a7, a8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v8;
}

uint64_t sub_22313CC5C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

id ActivityAwardsQuery.__deallocating_deinit()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CE48);
  sub_22313FFE8();
  swift_release();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivityAwardsQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22313CEC4(uint64_t a1)
{
  return sub_22313CF14(a1, "[ActivityAwardsQuery] deliverInitialAwards: %ld achievements", &OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_initialAwardsHandler);
}

uint64_t sub_22313CED8(uint64_t a1)
{
  return sub_22313CF14(a1, "[ActivityAwardsQuery] deliverAddedAwards: %ld achievements", &OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_addedAwardsHandler);
}

uint64_t sub_22313CEEC(uint64_t a1)
{
  return sub_22313CF14(a1, "[ActivityAwardsQuery] deliverRemovedAwards: %ld achievements", &OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_removedAwardsHandler);
}

uint64_t sub_22313CF00(uint64_t a1)
{
  return sub_22313CF14(a1, "[ActivityAwardsQuery] deliverUpdatedAwards %ld achievements", &OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_updatedAwardsHandler);
}

uint64_t sub_22313CF14(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v6 = sub_2231400E8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400B8();
  swift_retain_n();
  uint64_t v10 = sub_2231400D8();
  os_log_type_t v11 = sub_2231401E8();
  if (os_log_type_enabled(v10, v11))
  {
    id v18 = a2;
    id v19 = a3;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134217984;
    unint64_t v13 = sub_223140078();
    if (v13 >> 62) {
      uint64_t v14 = sub_223140278();
    }
    else {
      uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v20 = v14;
    sub_2231401F8();
    swift_release();
    _os_log_impl(&dword_223130000, v10, v11, v18, v12, 0xCu);
    MEMORY[0x223CAF4C0](v12, -1, -1);

    a3 = v19;
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v15 = *(void (**)(void))(v3 + *a3);
  sub_223140078();
  v15();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22313D130()
{
  v1[3] = v0;
  uint64_t v2 = sub_2231400E8();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_22313D1F0, 0, 0);
}

uint64_t sub_22313D1F0()
{
  sub_2231400B8();
  uint64_t v1 = sub_2231400D8();
  os_log_type_t v2 = sub_2231401E8();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_223130000, v1, v2, "Running query immediately.", v3, 2u);
    MEMORY[0x223CAF4C0](v3, -1, -1);
  }
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v7 = v0[3];
  uint64_t v6 = v0[4];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v8 = swift_task_alloc();
  v0[7] = v8;
  *(void *)(v8 + 16) = v7;
  id v9 = (void *)swift_task_alloc();
  v0[8] = v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CED0);
  *id v9 = v0;
  v9[1] = sub_22313D390;
  return MEMORY[0x270FA2360](v0 + 2, 0, 0, 0xD000000000000015, 0x80000002231411D0, sub_22313F7A4, v8, v10);
}

uint64_t sub_22313D390()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v2 = sub_22313D518;
  }
  else
  {
    swift_task_dealloc();
    os_log_type_t v2 = sub_22313D4AC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22313D4AC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_task_dealloc();
  os_log_type_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_22313D518()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_22313D584(uint64_t a1, void (*a2)(char *, uint64_t, uint64_t))
{
  id v49 = a2;
  uint64_t v46 = sub_2231400E8();
  uint64_t v45 = *(void *)(v46 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v46);
  uint64_t v43 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v44 = (char *)&v36 - v6;
  MEMORY[0x270FA5388](v5);
  id v42 = (char *)&v36 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CF68);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v41 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v13 = (char *)&v36 - v12;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v48 = a1;
  v14((char *)&v36 - v12, a1, v8);
  unint64_t v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = *(void (**)(unint64_t, char *, uint64_t))(v9 + 32);
  uint64_t v47 = v8;
  v17(v16 + v15, v13, v8);
  char v50 = v49;
  uint64_t v51 = sub_22313FC5C;
  uint64_t v52 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD599F0);
  sub_22313FFE8();
  double v37 = v17;
  uint64_t v38 = v9 + 32;
  uint64_t v39 = v15 + v10;
  unint64_t v40 = v15;
  uint64_t v44 = (char *)(v9 + 16);
  id v49 = v14;
  id v18 = v42;
  swift_release();
  id v19 = (void *)aBlock[0];
  aBlock[0] = 1;
  swift_unknownObjectRetain();
  uint64_t v20 = sub_223140038();
  unint64_t v22 = v21;
  uint64_t v43 = (char *)v20;
  sub_223139EC8(v20, v21);
  sub_2231400B8();
  uint64_t v23 = sub_2231400D8();
  uint64_t v24 = sub_2231401E8();
  if (os_log_type_enabled(v23, (os_log_type_t)v24))
  {
    unint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v25 = 0;
    _os_log_impl(&dword_223130000, v23, (os_log_type_t)v24, "Obtained proxy for query run. Sending transport request.", v25, 2u);
    MEMORY[0x223CAF4C0](v25, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v46);
  id v26 = v41;
  BOOL v27 = v49;
  unint64_t v28 = v40;
  if (v22 >> 60 == 15)
  {
    uint64_t v29 = 0;
    uint64_t v30 = (uint64_t)v43;
  }
  else
  {
    uint64_t v30 = (uint64_t)v43;
    uint64_t v29 = sub_22313FFB8();
    sub_223133654(v30, v22);
  }
  uint64_t v46 = v29;
  uint64_t v31 = v47;
  v27(v26, v48, v47);
  uint64_t v32 = swift_allocObject();
  v37(v32 + v28, v26, v31);
  aBlock[4] = sub_22313FD88;
  aBlock[5] = v32;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22313E220;
  aBlock[3] = &block_descriptor_46;
  id v33 = _Block_copy(aBlock);
  swift_release();
  id v34 = (void *)v46;
  objc_msgSend(v19, sel_transportRequest_data_completion_, 2, v46, v33);
  sub_223133654(v30, v22);
  swift_unknownObjectRelease();
  _Block_release(v33);

  return swift_unknownObjectRelease();
}

uint64_t sub_22313DE3C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_2231400E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400A8();
  id v8 = a1;
  id v9 = a1;
  uint64_t v10 = sub_2231400D8();
  os_log_type_t v11 = sub_2231401D8();
  if (os_log_type_enabled(v10, v11))
  {
    v19[1] = a2;
    uint64_t v12 = swift_slowAlloc();
    v19[0] = v4;
    unint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v20 = v14;
    *(_DWORD *)unint64_t v13 = 136446210;
    swift_getErrorValue();
    uint64_t v15 = sub_2231402F8();
    v19[2] = sub_223138590(v15, v16, &v20);
    sub_2231401F8();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_223130000, v10, v11, "Unable to get proxy: %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223CAF4C0](v14, -1, -1);
    MEMORY[0x223CAF4C0](v13, -1, -1);

    (*(void (**)(char *, void))(v5 + 8))(v7, v19[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v20 = (uint64_t)a1;
  id v17 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CF68);
  return sub_223140188();
}

uint64_t sub_22313E0A4(uint64_t a1, unint64_t a2, id a3)
{
  if (a3)
  {
    id v3 = a3;
  }
  else
  {
    if (a2 >> 60 != 15)
    {
      sub_223140098();
      sub_223139EDC(a1, a2);
      sub_223139EDC(a1, a2);
      sub_223140088();
      sub_223140078();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CF68);
      sub_223140198();
      sub_223133654(a1, a2);
      return swift_release();
    }
    sub_223139DFC();
    swift_allocError();
    *uint64_t v5 = 2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CF68);
  return sub_223140188();
}

uint64_t sub_22313E220(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    id v6 = v4;
    uint64_t v4 = (void *)sub_22313FFC8();
    unint64_t v8 = v7;
  }
  else
  {
    swift_retain();
    unint64_t v8 = 0xF000000000000000;
  }
  id v9 = a3;
  v5(v4, v8, a3);

  sub_223133654((uint64_t)v4, v8);
  return swift_release();
}

uint64_t sub_22313E2CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2231400E8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400B8();
  id v6 = sub_2231400D8();
  os_log_type_t v7 = sub_2231401E8();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v8 = 0;
    _os_log_impl(&dword_223130000, v6, v7, "[ActivityAwardsQuery] activate", v8, 2u);
    MEMORY[0x223CAF4C0](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = sub_223140108();
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v1;
  id v13 = v1;
  sub_223134A30(v9, v11, (uint64_t)sub_22313F7E4, v12);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22313E488(char *a1, void *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD599E0);
  MEMORY[0x270FA5388](v5 - 8);
  os_log_type_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2231400E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void **)&a1[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection];
  *(void *)&a1[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection] = a2;
  id v13 = a2;

  aBlock[4] = (uint64_t)sub_22313EA84;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_223134F3C;
  aBlock[3] = (uint64_t)&block_descriptor_0;
  uint64_t v14 = _Block_copy(aBlock);
  id v15 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v14);
  _Block_release(v14);
  sub_223140218();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD599F0);
  if (swift_dynamicCast())
  {
    uint64_t v16 = v39;
    sub_2231401A8();
    uint64_t v17 = sub_2231401C8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 0, 1, v17);
    id v18 = (void *)swift_allocObject();
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = v16;
    v18[5] = a1;
    swift_unknownObjectRetain();
    id v19 = a1;
    sub_22313C994((uint64_t)v7, (uint64_t)&unk_267F9CF58, (uint64_t)v18);
    swift_release();
    aBlock[0] = (uint64_t)v19;
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v19;
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = sub_22313FB88;
    *(void *)(v21 + 24) = v20;
    type metadata accessor for ActivityAwardsQuery();
    sub_223140098();
    sub_22313FE14(&qword_26AD599C8, v22, (void (*)(uint64_t))type metadata accessor for ActivityAwardsQuery);
    uint64_t v23 = v19;
    sub_223140028();
    swift_release();
    aBlock[0] = (uint64_t)v23;
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = v23;
    uint64_t v25 = swift_allocObject();
    *(void *)(v25 + 16) = sub_22313FC10;
    *(void *)(v25 + 24) = v24;
    id v26 = v23;
    sub_223140028();
    swift_release();
    aBlock[0] = (uint64_t)v26;
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v26;
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = sub_22313FC34;
    *(void *)(v28 + 24) = v27;
    uint64_t v29 = v26;
    sub_223140028();
    swift_unknownObjectRelease();
    return swift_release();
  }
  else
  {
    sub_2231400A8();
    uint64_t v31 = sub_2231400D8();
    os_log_type_t v32 = sub_2231401E8();
    if (os_log_type_enabled(v31, v32))
    {
      id v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      v37[1] = v2;
      aBlock[0] = v34;
      *(_DWORD *)id v33 = 136446210;
      v37[0] = v8;
      uint64_t v35 = sub_223140108();
      uint64_t v39 = sub_223138590(v35, v36, aBlock);
      sub_2231401F8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_223130000, v31, v32, "XPC client-side connection failed to get expected proxy type for %{public}s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223CAF4C0](v34, -1, -1);
      MEMORY[0x223CAF4C0](v33, -1, -1);

      return (*(uint64_t (**)(char *, void))(v9 + 8))(v11, v37[0]);
    }
    else
    {

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
}

uint64_t sub_22313EA84()
{
  uint64_t v0 = sub_2231400E8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2231400A8();
  uint64_t v4 = sub_2231400D8();
  os_log_type_t v5 = sub_2231401E8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136446210;
    uint64_t v12 = v7;
    uint64_t v8 = sub_223140108();
    uint64_t v11 = sub_223138590(v8, v9, &v12);
    sub_2231401F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_223130000, v4, v5, "XPC client-side connection failed to get proxy for %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223CAF4C0](v7, -1, -1);
    MEMORY[0x223CAF4C0](v6, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22313EC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 136) = a4;
  *(void *)(v5 + 144) = a5;
  return MEMORY[0x270FA2498](sub_22313EC7C, 0, 0);
}

uint64_t sub_22313EC7C()
{
  v0[10] = 1;
  uint64_t v1 = sub_223140038();
  v0[19] = 0;
  unint64_t v3 = v2;
  if (v2 >> 60 == 15)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = v1;
    uint64_t v4 = sub_22313FFB8();
    sub_223133654(v5, v3);
  }
  v0[20] = v4;
  uint64_t v6 = (void *)v0[17];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_22313EE40;
  uint64_t v7 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_223137040;
  v0[13] = &block_descriptor_36;
  v0[14] = v7;
  objc_msgSend(v6, sel_transportRequest_data_completion_, 2, v4, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_22313EE40()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    unint64_t v2 = sub_22313F060;
  }
  else {
    unint64_t v2 = sub_22313EF50;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_22313EF50()
{
  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 120);
  unint64_t v3 = *(void *)(v0 + 128);

  sub_223140098();
  sub_223139EC8(v2, v3);
  uint64_t v4 = sub_223140088();
  if (v1)
  {

    sub_223139DFC();
    swift_allocError();
    *uint64_t v5 = 1;
    swift_willThrow();
  }
  else
  {
    sub_22313CEC4(v4);
    swift_release();
  }
  sub_223133654(v2, v3);
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_22313F060()
{
  uint64_t v1 = *(void **)(v0 + 160);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_22313F0D0()
{
  return sub_22313FFE8();
}

id sub_22313F13C(uint64_t a1)
{
  type metadata accessor for ActivityAwardsQuery();
  sub_22313FE14(&qword_26AD599C8, v2, (void (*)(uint64_t))type metadata accessor for ActivityAwardsQuery);
  sub_223140018();
  sub_223140018();
  sub_223140018();
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection), sel_invalidate);
}

void sub_22313F214(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = sub_223140108();
  sub_22313B754(v8, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void **)(a1 + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection);
  if (v10)
  {
    aBlock[4] = a2;
    aBlock[5] = a3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_223134F3C;
    aBlock[3] = &block_descriptor_49;
    uint64_t v11 = _Block_copy(aBlock);
    id v12 = v10;
    swift_retain();
    swift_release();
    id v13 = objc_msgSend(v12, sel_synchronousRemoteObjectProxyWithErrorHandler_, v11);
    _Block_release(v11);
    sub_223140218();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD599F0);
    if (swift_dynamicCast())
    {

      *a4 = v18;
    }
    else
    {
      uint64_t v16 = sub_22313FFD8();
      sub_22313FE14((unint64_t *)&unk_267F9CE90, 255, MEMORY[0x263F238F0]);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v17, *MEMORY[0x263F238E0], v16);
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v14 = sub_22313FFD8();
    sub_22313FE14((unint64_t *)&unk_267F9CE90, 255, MEMORY[0x263F238F0]);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v15, *MEMORY[0x263F238E8], v14);
    swift_willThrow();
  }
}

id ActivityAwardsQuery.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ActivityAwardsQuery.init()()
{
}

uint64_t sub_22313F558(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_22313F594(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void *sub_22313F5A4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_2231402B8();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

id sub_22313F648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)&v8[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection] = 0;
  sub_223140008();
  swift_allocObject();
  uint64_t v17 = v8;
  *(void *)&v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_lock] = sub_22313FFF8();
  uint64_t v18 = &v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_initialAwardsHandler];
  *(void *)uint64_t v18 = a1;
  *((void *)v18 + 1) = a2;
  id v19 = &v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_addedAwardsHandler];
  *(void *)id v19 = a3;
  *((void *)v19 + 1) = a4;
  uint64_t v20 = &v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_removedAwardsHandler];
  *(void *)uint64_t v20 = a5;
  *((void *)v20 + 1) = a6;
  uint64_t v21 = &v17[OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_updatedAwardsHandler];
  *(void *)uint64_t v21 = a7;
  *((void *)v21 + 1) = a8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();

  v23.receiver = v17;
  v23.super_class = (Class)type metadata accessor for ActivityAwardsQuery();
  return objc_msgSendSuper2(&v23, sel_init);
}

id sub_22313F768@<X0>(BOOL *a1@<X8>)
{
  return sub_22313FA18(a1);
}

uint64_t type metadata accessor for ActivityAwardsQuery()
{
  return self;
}

uint64_t sub_22313F7A4(uint64_t a1)
{
  return sub_22313D584(a1, *(void (**)(char *, uint64_t, uint64_t))(v1 + 16));
}

uint64_t sub_22313F7AC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22313F7E4()
{
  return sub_22313FFE8();
}

id sub_22313F850()
{
  return sub_22313F13C(*(void *)(v0 + 16));
}

uint64_t method lookup function for ActivityAwardsQuery(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ActivityAwardsQuery);
}

uint64_t dispatch thunk of ActivityAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ActivityAwardsQuery.runQueryImmediately()()
{
  uint64_t v2 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0xC8);
  uint64_t v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  unint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *unint64_t v3 = v1;
  v3[1] = sub_22313A1E8;
  return v5();
}

uint64_t dispatch thunk of ActivityAwardsQuery.activate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of ActivityAwardsQuery.deactivate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

id sub_22313FA18@<X0>(BOOL *a1@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection);
  if (v3) {
    id result = objc_msgSend(*(id *)(*(void *)(v1 + 16) + OBJC_IVAR____TtC18ActivityAwardsCore19ActivityAwardsQuery_connection), sel_invalidate);
  }
  *a1 = v3 == 0;
  return result;
}

uint64_t sub_22313FA78()
{
  return sub_22313E488(*(char **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_22313FA94()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22313FADC()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_2231337C8;
  *(_OWORD *)(v2 + 136) = v3;
  return MEMORY[0x270FA2498](sub_22313EC7C, 0, 0);
}

uint64_t sub_22313FB88(uint64_t a1)
{
  return sub_22313CED8(a1);
}

uint64_t sub_22313FBAC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22313FBE4(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_22313FC10(uint64_t a1)
{
  return sub_22313CEEC(a1);
}

uint64_t sub_22313FC34(uint64_t a1)
{
  return sub_22313CF00(a1);
}

uint64_t sub_22313FC5C(void *a1)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F9CF68) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_22313DE3C(a1, v4);
}

void sub_22313FCD0(void *a1@<X8>)
{
  sub_22313F214(v1[2], v1[3], v1[4], a1);
}

uint64_t objectdestroy_39Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CF68);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_22313FD88(uint64_t a1, unint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F9CF68);
  return sub_22313E0A4(a1, a2, a3);
}

uint64_t sub_22313FE14(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_22313FE60(void *a1, void *a2)
{
  return sub_22313C2D0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t objectdestroy_60Tm()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22313FEB0(void *a1, void *a2)
{
  return sub_22313BC08(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_22313FEBC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22313FF88()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_22313FF98()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_22313FFA8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22313FFB8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22313FFC8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22313FFD8()
{
  return MEMORY[0x270F0AB20]();
}

uint64_t sub_22313FFE8()
{
  return MEMORY[0x270F0AB28]();
}

uint64_t sub_22313FFF8()
{
  return MEMORY[0x270F0AB30]();
}

uint64_t sub_223140008()
{
  return MEMORY[0x270F0AB38]();
}

uint64_t sub_223140018()
{
  return MEMORY[0x270F0AB40]();
}

uint64_t sub_223140028()
{
  return MEMORY[0x270F0AB48]();
}

uint64_t sub_223140038()
{
  return MEMORY[0x270F0AB50]();
}

uint64_t sub_223140048()
{
  return MEMORY[0x270F0AB58]();
}

uint64_t sub_223140058()
{
  return MEMORY[0x270F0AB60]();
}

uint64_t sub_223140068()
{
  return MEMORY[0x270F0AB68]();
}

uint64_t sub_223140078()
{
  return MEMORY[0x270F0AB70]();
}

uint64_t sub_223140088()
{
  return MEMORY[0x270F0AB78]();
}

uint64_t sub_223140098()
{
  return MEMORY[0x270F0AB80]();
}

uint64_t sub_2231400A8()
{
  return MEMORY[0x270F0AB88]();
}

uint64_t sub_2231400B8()
{
  return MEMORY[0x270F0AB90]();
}

uint64_t sub_2231400C8()
{
  return MEMORY[0x270F0AB98]();
}

uint64_t sub_2231400D8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2231400E8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2231400F8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_223140108()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_223140118()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_223140128()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_223140138()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_223140148()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_223140158()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_223140168()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_223140178()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_223140188()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_223140198()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2231401A8()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2231401B8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2231401C8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2231401D8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2231401E8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2231401F8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_223140208()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_223140218()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_223140228()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_223140238()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_223140248()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_223140258()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_223140268()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_223140278()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_223140288()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_223140298()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2231402A8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2231402B8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2231402C8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2231402E8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2231402F8()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_223140308()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_223140318()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_223140328()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_223140338()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_223140348()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_223140358()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_223140368()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_223140378()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AACTransportInterface()
{
  return MEMORY[0x270F0AAD8]();
}

uint64_t ACHYearMonthDayStringFromDateComponents()
{
  return MEMORY[0x270F0A850]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}