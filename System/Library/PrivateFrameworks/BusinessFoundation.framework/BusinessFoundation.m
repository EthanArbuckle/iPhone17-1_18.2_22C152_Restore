BOOL static LocalDatabase.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LocalDatabase.Error.hash(into:)()
{
  return sub_24938CFB0();
}

uint64_t LocalDatabase.Error.hashValue.getter()
{
  return sub_24938CFC0();
}

BOOL sub_249385B80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_249385B94()
{
  return sub_24938CFC0();
}

uint64_t sub_249385BDC()
{
  return sub_24938CFB0();
}

uint64_t sub_249385C08()
{
  return sub_24938CFC0();
}

uint64_t LocalDatabase.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  LocalDatabase.init(_:)(a1);
  return v2;
}

uint64_t LocalDatabase.init(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v11 = a1;
  uint64_t v12 = sub_24938CE10();
  uint64_t v3 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24938CE40();
  MEMORY[0x270FA5388]();
  sub_24938CC50();
  MEMORY[0x270FA5388]();
  uint64_t v10 = OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_queue;
  sub_249385FB4();
  sub_24938CC40();
  uint64_t v13 = MEMORY[0x263F8EE78];
  sub_24938969C(&qword_2696A65A0, MEMORY[0x263F8F198]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A65A8);
  sub_249386430(&qword_2696A65B0, &qword_2696A65A8);
  uint64_t v6 = v11;
  sub_24938CE80();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F138], v12);
  *(void *)(v1 + v10) = sub_24938CE50();
  *(void *)(v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_database) = 0;
  if (sub_24938CBB0())
  {
    uint64_t v7 = v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_url;
    uint64_t v8 = sub_24938CBD0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7, v6, v8);
    return v2;
  }
  else
  {
    uint64_t result = sub_24938CEB0();
    __break(1u);
  }
  return result;
}

unint64_t sub_249385FB4()
{
  unint64_t result = qword_2696A6598;
  if (!qword_2696A6598)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2696A6598);
  }
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

uint64_t LocalDatabase.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24938CC30();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24938CC50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t *)(v0 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_database);
  swift_beginAccess();
  uint64_t v11 = *v10;
  if (v11)
  {
    uint64_t v19 = v3;
    uint64_t v20 = v6;
    uint64_t v12 = *(void **)(v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_queue);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v11;
    aBlock[4] = sub_2493863CC;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2493863D4;
    aBlock[3] = &block_descriptor;
    v14 = _Block_copy(aBlock);
    id v15 = v12;
    sub_24938CC40();
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_24938969C((unint64_t *)&qword_2696A65C8, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A65D0);
    sub_249386430((unint64_t *)&qword_2696A65D8, &qword_2696A65D0);
    sub_24938CE80();
    MEMORY[0x24C59D130](0, v9, v5, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v20);
    swift_release();
  }
  uint64_t v16 = v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_url;
  uint64_t v17 = sub_24938CBD0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);

  return v1;
}

uint64_t sub_2493863BC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2493863CC()
{
  return sqlite3_close_v2(*(sqlite3 **)(v0 + 16));
}

uint64_t sub_2493863D4(uint64_t a1)
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

uint64_t sub_249386430(unint64_t *a1, uint64_t *a2)
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

uint64_t LocalDatabase.__deallocating_deinit()
{
  LocalDatabase.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2493864D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[3] = a2;
  return MEMORY[0x270FA2498](sub_249386500, 0, 0);
}

uint64_t sub_249386500()
{
  sub_2493889F0();
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 64) = v4;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 40);
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  *(void *)(v4 + 48) = v1;
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v5;
  uint64_t v6 = sub_24938CD40();
  void *v5 = v0;
  v5[1] = sub_249386684;
  uint64_t v7 = *(void *)(v0 + 56);
  v5[5] = v6;
  v5[6] = v7;
  v5[3] = sub_249388C28;
  v5[4] = v4;
  v5[2] = v0 + 16;
  return MEMORY[0x270FA2498](sub_249386B20, 0, 0);
}

uint64_t sub_249386684()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_2493867BC;
  }
  else
  {
    swift_release();
    uint64_t v2 = sub_2493867A0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_2493867A0()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_2493867BC()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249386820@<X0>(sqlite3 *a1@<X0>, uint64_t *a2@<X8>)
{
  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x263EF8340];
  MEMORY[0x270FA5388]();
  sub_24938CE90();
  swift_bridgeObjectRelease();
  sub_24938CCA0();
  ppStmt[0] = 0;
  uint64_t v5 = sub_24938CC80();
  swift_bridgeObjectRelease();
  int v6 = sqlite3_prepare_v2(a1, (const char *)(v5 + 32), -1, ppStmt, 0);
  swift_release();
  if (v6 || (uint64_t v9 = ppStmt[0]) == 0)
  {
    sub_249389258();
    swift_allocError();
    *uint64_t v7 = 3;
    return swift_willThrow();
  }
  else
  {
    uint64_t v10 = sub_24938CD10();
    uint64_t v11 = sub_2493892AC(v9);
    type metadata accessor for LocalDatabase.SQLiteStatementRowDecoder();
    uint64_t v12 = (void *)swift_allocObject();
    uint64_t v13 = MEMORY[0x263F8EE78];
    v12[4] = MEMORY[0x263F8EE78];
    v12[5] = sub_249386F20(v13);
    v12[2] = v9;
    v12[3] = v11;
    if (sqlite3_step(v9) == 100)
    {
      sub_24938969C(&qword_2696A6698, (void (*)(uint64_t))type metadata accessor for LocalDatabase.SQLiteStatementRowDecoder);
      while (1)
      {
        swift_retain();
        sub_24938CDB0();
        if (v2) {
          break;
        }
        sub_24938CD40();
        sub_24938CD30();
        if (sqlite3_step(v9) != 100) {
          goto LABEL_8;
        }
      }
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
LABEL_8:
      swift_release();
      *a2 = v10;
    }
    return sqlite3_finalize(v9);
  }
}

uint64_t sub_249386AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_249386B20, 0, 0);
}

uint64_t sub_249386B20()
{
  uint64_t v2 = v0[5];
  uint64_t v1 = v0[6];
  uint64_t v4 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_queue);
  v0[7] = v5;
  int v6 = (void *)swift_allocObject();
  v0[8] = v6;
  v6[2] = v2;
  v6[3] = v1;
  v6[4] = v4;
  v6[5] = v3;
  v5;
  swift_retain();
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[9] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_249386C40;
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[2];
  return OS_dispatch_queue.bf_async<A>(execute:)(v9, (uint64_t)sub_24938967C, (uint64_t)v6, v8);
}

uint64_t sub_249386C40()
{
  uint64_t v2 = (void *)*v1;
  v2[10] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_249386D84, 0, 0);
  }
  else
  {
    uint64_t v3 = (void *)v2[7];
    swift_release();

    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_249386D84()
{
  uint64_t v1 = *(void **)(v0 + 56);
  swift_release();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_249386DEC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = (sqlite3 **)(a1 + OBJC_IVAR____TtC18BusinessFoundation13LocalDatabase_database);
  swift_beginAccess();
  if (*v3) {
    return a2();
  }
  sub_24938CBC0();
  uint64_t v5 = sub_24938CC80();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  int v6 = sqlite3_open_v2((const char *)(v5 + 32), v3, 1, 0);
  swift_endAccess();
  swift_release();
  if (!v6) {
    return a2();
  }
  sub_249389258();
  swift_allocError();
  *uint64_t v7 = 0;
  return swift_willThrow();
}

unint64_t sub_249386F20(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66A0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66A8);
  uint64_t v6 = sub_24938CEE0();
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
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2493896E4(v12, (uint64_t)v5);
    unint64_t result = sub_24938828C((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_24938CEA0();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = (unint64_t)sub_24938974C(v9, (_OWORD *)(v7[7] + 32 * v16));
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_249387114()
{
  type metadata accessor for LocalDatabase.SQLiteKeyedContainer();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + 24;
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v4 + 8);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v3;
  v5[3] = v1;
  v5[4] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  return sub_24938CEF0();
}

void *sub_2493871C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result = (void *)swift_allocObject();
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

uint64_t sub_249387210()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_249387258()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_249387264()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_249387270()
{
  return sub_249387114();
}

uint64_t sub_249387294()
{
  return sub_2493872AC();
}

uint64_t sub_2493872AC()
{
  sub_249389258();
  swift_allocError();
  *uint64_t v0 = 6;
  return swift_willThrow();
}

uint64_t sub_2493872FC()
{
  uint64_t v1 = v0;
  if (swift_dynamicCastMetatype())
  {
    uint64_t v2 = *(void *)(v0 + 32);
    uint64_t v3 = sub_24938CFD0();
    if (*(void *)(v2 + 16))
    {
      unint64_t v5 = sub_249388214(v3, v4);
      if (v6)
      {
        int v7 = *(_DWORD *)(*(void *)(v2 + 56) + 4 * v5);
        swift_bridgeObjectRelease();
        if (sqlite3_column_text(*(sqlite3_stmt **)(v1 + 24), v7))
        {
          sub_24938CCC0();
          return swift_dynamicCast();
        }
LABEL_14:
        char v19 = 5;
        goto LABEL_13;
      }
    }
    goto LABEL_12;
  }
  if (swift_dynamicCastMetatype())
  {
    uint64_t v8 = *(void *)(v0 + 32);
    uint64_t v9 = sub_24938CFD0();
    if (*(void *)(v8 + 16))
    {
      unint64_t v11 = sub_249388214(v9, v10);
      if (v12)
      {
        int v13 = *(_DWORD *)(*(void *)(v8 + 56) + 4 * v11);
        swift_bridgeObjectRelease();
        v14 = *(sqlite3_stmt **)(v1 + 24);
        char v15 = sqlite3_column_blob(v14, v13);
        if (v15)
        {
          unint64_t v16 = v15;
          int v17 = sqlite3_column_bytes(v14, v13);
          sub_249389588(v16, v17);
          return swift_dynamicCast();
        }
        goto LABEL_14;
      }
    }
LABEL_12:
    swift_bridgeObjectRelease();
    char v19 = 4;
LABEL_13:
    sub_249389258();
    swift_allocError();
    *BOOL v20 = v19;
    return swift_willThrow();
  }
  uint64_t result = sub_24938CEB0();
  __break(1u);
  return result;
}

void sub_249387504()
{
}

void sub_249387550()
{
}

void sub_24938759C()
{
}

void sub_2493875E8()
{
}

void sub_249387634()
{
}

uint64_t sub_249387680()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2493876C0()
{
  return swift_bridgeObjectRetain();
}

void sub_2493876CC()
{
}

void sub_2493876D8()
{
}

void sub_249387724()
{
}

uint64_t sub_249387770()
{
  sub_2493872FC();
  if (!v0) {
    char v1 = v3;
  }
  return v1 & 1;
}

uint64_t sub_2493877C0()
{
  uint64_t result = sub_2493872FC();
  if (!v0) {
    return v2;
  }
  return result;
}

double sub_249387814()
{
  sub_2493872FC();
  if (!v0) {
    return v2;
  }
  return result;
}

float sub_249387860()
{
  sub_2493872FC();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_2493878AC()
{
  return sub_249387B34();
}

uint64_t sub_2493878D4()
{
  return sub_2493879F0();
}

uint64_t sub_2493878FC()
{
  return sub_249387A5C();
}

uint64_t sub_249387924()
{
  return sub_249387AC8();
}

uint64_t sub_24938794C()
{
  return sub_249387B34();
}

uint64_t sub_249387974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249387BA4(a1, a2, a3, MEMORY[0x263F8E3A8]);
}

uint64_t sub_2493879A0()
{
  return sub_249387B34();
}

uint64_t sub_2493879C8()
{
  return sub_2493879F0();
}

uint64_t sub_2493879F0()
{
  uint64_t result = sub_2493872FC();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_249387A34()
{
  return sub_249387A5C();
}

uint64_t sub_249387A5C()
{
  uint64_t result = sub_2493872FC();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_249387AA0()
{
  return sub_249387AC8();
}

uint64_t sub_249387AC8()
{
  uint64_t result = sub_2493872FC();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_249387B0C()
{
  return sub_249387B34();
}

uint64_t sub_249387B34()
{
  uint64_t result = sub_2493872FC();
  if (!v0) {
    return v2;
  }
  return result;
}

uint64_t sub_249387B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249387BA4(a1, a2, a3, MEMORY[0x263F8E3B0]);
}

uint64_t sub_249387BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer();
  return a4(a1, v7, a3);
}

uint64_t sub_249387C00()
{
  return sub_2493872FC();
}

uint64_t sub_249387C24()
{
  return sub_24938CF30();
}

uint64_t sub_249387C78()
{
  return sub_24938CF20();
}

uint64_t sub_249387CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249388060(a1, a2, a3, MEMORY[0x263F8E338]);
}

uint64_t sub_249387CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249387FBC(a1, a2, a3, MEMORY[0x263F8E340]);
}

uint64_t sub_249387D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249388060(a1, a2, a3, MEMORY[0x263F8E348]);
}

uint64_t sub_249387D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249387E84(a1, a2, a3, MEMORY[0x263F8E358]);
}

uint64_t sub_249387D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249387F20(a1, a2, a3, MEMORY[0x263F8E360]);
}

uint64_t sub_249387DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249387FBC(a1, a2, a3, MEMORY[0x263F8E368]);
}

uint64_t sub_249387DD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249388060(a1, a2, a3, MEMORY[0x263F8E370]);
}

uint64_t sub_249387E00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2493880F4(a1, a2, a3, MEMORY[0x263F8E380]);
}

uint64_t sub_249387E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249388060(a1, a2, a3, MEMORY[0x263F8E350]);
}

uint64_t sub_249387E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249387E84(a1, a2, a3, MEMORY[0x263F8E378]);
}

uint64_t sub_249387E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer();
  return a4(a1, v7, a3) & 0x1FF;
}

uint64_t sub_249387EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249387F20(a1, a2, a3, MEMORY[0x263F8E388]);
}

uint64_t sub_249387F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer();
  return a4(a1, v7, a3) & 0x1FFFF;
}

uint64_t sub_249387F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249387FBC(a1, a2, a3, MEMORY[0x263F8E390]);
}

uint64_t sub_249387FBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer();
  unint64_t v8 = a4(a1, v7, a3);
  return v8 | ((HIDWORD(v8) & 1) << 32);
}

uint64_t sub_249388034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249388060(a1, a2, a3, MEMORY[0x263F8E398]);
}

uint64_t sub_249388060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer();
  uint64_t result = a4(a1, v8, a3);
  if (v4) {
    return v10;
  }
  return result;
}

uint64_t sub_2493880C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2493880F4(a1, a2, a3, MEMORY[0x263F8E3A0]);
}

uint64_t sub_2493880F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8 = type metadata accessor for LocalDatabase.SQLiteKeyedContainer();
  uint64_t result = a4(a1, v8, a3);
  if (v4) {
    return v10;
  }
  return result;
}

void sub_249388160()
{
}

void sub_249388184()
{
}

void sub_2493881A8()
{
}

void sub_2493881CC()
{
}

void sub_2493881F0()
{
}

unint64_t sub_249388214(uint64_t a1, uint64_t a2)
{
  sub_24938CFA0();
  sub_24938CC90();
  uint64_t v4 = sub_24938CFC0();
  return sub_2493885DC(a1, a2, v4);
}

unint64_t sub_24938828C(uint64_t a1)
{
  sub_24938CEA0();
  uint64_t v2 = sub_24938CC60();
  return sub_2493886C0(a1, v2);
}

uint64_t sub_2493882F0(uint64_t a1, char a2)
{
  char v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66B0);
  char v37 = a2;
  uint64_t v6 = sub_24938CED0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        char v3 = v35;
        if ((v37 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v36 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    int v29 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_24938CFA0();
    sub_24938CC90();
    uint64_t result = sub_24938CFC0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v32 = v17 == v31;
        if (v17 == v31) {
          unint64_t v17 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    char v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *char v19 = v28;
    v19[1] = v27;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v3 = v35;
  v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *char v3 = v7;
  return result;
}

unint64_t sub_2493885DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24938CF10() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24938CF10() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2493886C0(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = sub_24938CEA0();
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v20 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    int v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      uint64_t v16 = v11;
      v12(v7, *(void *)(v22 + 48) + v14 * v9, v4);
      char v17 = sub_24938CC70();
      (*v15)(v7, v4);
      if (v17) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      uint64_t v11 = v16;
    }
    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

void *sub_249388858()
{
  char v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66B0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24938CEC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    *char v1 = v4;
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    char v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(void *)(v2 + 56) + v20);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = v19;
    v21[1] = v18;
    *(_DWORD *)(*(void *)(v4 + 56) + v20) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2493889F0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66B8);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66C0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_24938CC20();
  if (!v0)
  {
    sub_24938CC10();
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66C8);
    int v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v2, 1, v8);
    sub_24938975C((uint64_t)v2);
    if (v9 == 1)
    {
      sub_249389258();
      swift_allocError();
      *uint64_t v10 = 2;
      swift_willThrow();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t sub_249388BE8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_249388C28@<X0>(sqlite3 *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_249386820(a1, a2);
}

unint64_t sub_249388C50()
{
  unint64_t result = qword_2696A65F0;
  if (!qword_2696A65F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A65F0);
  }
  return result;
}

uint64_t sub_249388CA4()
{
  return type metadata accessor for LocalDatabase();
}

uint64_t type metadata accessor for LocalDatabase()
{
  uint64_t result = qword_2696A65F8;
  if (!qword_2696A65F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_249388CF8()
{
  uint64_t result = sub_24938CBD0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for LocalDatabase(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LocalDatabase);
}

uint64_t dispatch thunk of LocalDatabase.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of LocalDatabase.select<A>(all:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v5 + 160)
                                                                            + **(int **)(*(void *)v5 + 160));
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  *unint64_t v12 = v6;
  v12[1] = sub_249388F04;
  return v14(a1, a2, a3, a4, a5);
}

uint64_t sub_249388F04(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocalDatabase.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LocalDatabase.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x24938916CLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_249389194(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2493891A0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocalDatabase.Error()
{
  return &type metadata for LocalDatabase.Error;
}

uint64_t type metadata accessor for LocalDatabase.SQLiteStatementRowDecoder()
{
  return self;
}

uint64_t sub_2493891E0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LocalDatabase.SQLiteKeyedContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_249389250(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

unint64_t sub_249389258()
{
  unint64_t result = qword_2696A6690;
  if (!qword_2696A6690)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A6690);
  }
  return result;
}

uint64_t sub_2493892AC(sqlite3_stmt *a1)
{
  int v2 = sqlite3_column_count(a1);
  if (v2 < 0) {
    goto LABEL_24;
  }
  int v3 = v2;
  if (!v2) {
    return MEMORY[0x263F8EE80];
  }
  int v4 = 0;
  uint64_t v5 = (void *)MEMORY[0x263F8EE80];
  while (v3 != v4)
  {
    if (!sqlite3_column_name(a1, v4)) {
      goto LABEL_25;
    }
    uint64_t v6 = sub_24938CCB0();
    uint64_t v8 = v7;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v11 = sub_249388214(v6, v8);
    uint64_t v12 = v5[2];
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13)) {
      goto LABEL_22;
    }
    char v15 = v10;
    if (v5[3] >= v14)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v10) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_249388858();
        if (v15) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_2493882F0(v14, isUniquelyReferenced_nonNull_native);
      unint64_t v16 = sub_249388214(v6, v8);
      if ((v15 & 1) != (v17 & 1)) {
        goto LABEL_26;
      }
      unint64_t v11 = v16;
      if (v15)
      {
LABEL_4:
        *(_DWORD *)(v5[7] + 4 * v11) = v4;
        goto LABEL_5;
      }
    }
    v5[(v11 >> 6) + 8] |= 1 << v11;
    uint64_t v18 = (uint64_t *)(v5[6] + 16 * v11);
    *uint64_t v18 = v6;
    v18[1] = v8;
    *(_DWORD *)(v5[7] + 4 * v11) = v4;
    uint64_t v19 = v5[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_23;
    }
    v5[2] = v21;
    swift_bridgeObjectRetain();
LABEL_5:
    ++v4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v3 == v4) {
      return (uint64_t)v5;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  uint64_t result = sub_24938CF50();
  __break(1u);
  return result;
}

void sub_249389478()
{
}

uint64_t sub_2493894C4(unsigned char *__src, unsigned char *a2)
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

uint64_t sub_249389588(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_2493894C4(__src, &__src[a2]);
  }
  sub_24938CB90();
  swift_allocObject();
  sub_24938CB80();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_24938CBE0();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_24938963C()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24938967C()
{
  return sub_249386DEC(*(void *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_24938969C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2493896E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24938974C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24938975C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t OS_dispatch_queue.bf_async<A>(execute:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_249389814, 0, 0);
}

uint64_t sub_249389814()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  long long v2 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  int v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v3;
  *int v3 = v0;
  v3[1] = sub_249389904;
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v5, 0, 0, 0xD000000000000012, 0x800000024938DB50, sub_249389E0C, v1, v4);
}

uint64_t sub_249389904()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_249389A40, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    int v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_249389A40()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_249389AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  uint64_t v31 = a2;
  uint64_t v7 = sub_24938CC30();
  uint64_t v30 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  int v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24938CC50();
  uint64_t v28 = *(void *)(v10 - 8);
  uint64_t v29 = v10;
  MEMORY[0x270FA5388]();
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  uint64_t v13 = sub_24938CD80();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388]();
  char v17 = (char *)&v25 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v25 - v16, a1, v13);
  unint64_t v18 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v19 = (v15 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v20 + v18, v17, v13);
  uint64_t v21 = (void *)(v20 + v19);
  uint64_t v22 = v27;
  *uint64_t v21 = v26;
  v21[1] = v22;
  aBlock[4] = sub_249389FE4;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2493863D4;
  aBlock[3] = &block_descriptor_0;
  unint64_t v23 = _Block_copy(aBlock);
  swift_retain();
  sub_24938CC40();
  uint64_t v32 = MEMORY[0x263F8EE78];
  sub_24938A0B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A65D0);
  sub_24938A110();
  sub_24938CE80();
  MEMORY[0x24C59D130](0, v12, v9, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v29);
  return swift_release();
}

uint64_t sub_249389E0C(uint64_t a1)
{
  return sub_249389AA4(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_249389E18()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  v1(v0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  sub_24938CD80();
  return sub_24938CD70();
}

uint64_t sub_249389F1C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  uint64_t v1 = sub_24938CD80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_249389FE4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  sub_24938CD80();
  return sub_249389E18();
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

unint64_t sub_24938A0B8()
{
  unint64_t result = qword_2696A65C8;
  if (!qword_2696A65C8)
  {
    sub_24938CC30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A65C8);
  }
  return result;
}

unint64_t sub_24938A110()
{
  unint64_t result = qword_2696A65D8;
  if (!qword_2696A65D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A65D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A65D8);
  }
  return result;
}

uint64_t CKDatabase.bf_performQuery(recordType:predicate:sortDescriptors:desiredKeys:resultsLimit:zone:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  *(void *)(v9 + 96) = a8;
  *(void *)(v9 + 104) = v8;
  *(unsigned char *)(v9 + 160) = a7;
  *(void *)(v9 + 80) = a5;
  *(void *)(v9 + 88) = a6;
  *(void *)(v9 + 64) = a3;
  *(void *)(v9 + 72) = a4;
  *(void *)(v9 + 48) = a1;
  *(void *)(v9 + 56) = a2;
  return MEMORY[0x270FA2498](sub_24938A19C, 0, 0);
}

uint64_t sub_24938A19C()
{
  uint64_t v2 = *(void **)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  sub_24938A814(0, &qword_2696A66E8);
  swift_bridgeObjectRetain();
  id v3 = v2;
  uint64_t v4 = (void *)sub_24938CE60();
  *(void *)(v0 + 112) = v4;
  if (v1)
  {
    sub_24938A814(0, &qword_2696A66F8);
    uint64_t v5 = (void *)sub_24938CCE0();
    objc_msgSend(v4, sel_setSortDescriptors_, v5);
  }
  uint64_t v6 = *(void *)(v0 + 80);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD7C0]), sel_initWithQuery_, v4);
  *(void *)(v0 + 120) = v7;
  if (v6)
  {
    swift_bridgeObjectRetain();
    sub_24938CDC0();
  }
  if ((*(unsigned char *)(v0 + 160) & 1) == 0) {
    objc_msgSend(v7, sel_setResultsLimit_, *(void *)(v0 + 88));
  }
  uint64_t v8 = *(void **)(v0 + 96);
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_msgSend(v9, sel_zoneID);
    objc_msgSend(v7, sel_setZoneID_, v10);
  }
  uint64_t v11 = *(void *)(v0 + 104);
  uint64_t v12 = swift_allocObject();
  *(void *)(v0 + 128) = v12;
  *(void *)(v12 + 16) = MEMORY[0x263F8EE78];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v13;
  v13[2] = v7;
  v13[3] = v12;
  v13[4] = v11;
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A66F0);
  void *v14 = v0;
  v14[1] = sub_24938A400;
  return MEMORY[0x270FA2360](v0 + 40, 0, 0, 0xD000000000000054, 0x800000024938DB70, sub_24938A808, v13, v15);
}

uint64_t sub_24938A400()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    id v3 = sub_24938A5CC;
  }
  else
  {

    swift_task_dealloc();
    id v3 = sub_24938A528;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24938A528()
{
  uint64_t v2 = *(void **)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);

  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_24938A5CC()
{
  uint64_t v1 = *(void **)(v0 + 120);

  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24938A650()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_24938A688(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2696A6700);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388]();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  sub_24938CDD0();
  swift_retain();
  sub_24938CDE0();
  return objc_msgSend(a4, sel_addOperation_, a2);
}

id sub_24938A808(uint64_t a1)
{
  return sub_24938A688(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_24938A814(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24938A850(void *a1, char a2)
{
  if (a2)
  {
    id v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName(qword_2696A6700);
    return sub_24938CD60();
  }
  else
  {
    id v2 = a1;
    __swift_instantiateConcreteTypeFromMangledName(qword_2696A6700);
    return sub_24938CD70();
  }
}

uint64_t sub_24938A8C0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(qword_2696A6700);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24938A954(void *a1, char a2)
{
  char v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(qword_2696A6700);
  return sub_24938A850(a1, v3);
}

uint64_t sub_24938A9D8(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  if ((a3 & 1) == 0)
  {
    uint64_t v5 = (void *)(a4 + 16);
    swift_beginAccess();
    id v6 = a2;
    MEMORY[0x24C59CFE0]();
    if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_24938CD00();
    }
    sub_24938CD20();
    sub_24938CCF0();
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_24938AA78(uint64_t a1, void *a2, char a3)
{
  return sub_24938A9D8(a1, a2, a3 & 1, v3);
}

uint64_t static DictionarySerialization.encode(_:)()
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  sub_24938CB70();
  swift_allocObject();
  sub_24938CB60();
  uint64_t v1 = sub_24938CB50();
  unint64_t v3 = v2;
  uint64_t result = swift_release();
  if (!v0)
  {
    uint64_t v5 = self;
    id v6 = (void *)sub_24938CBF0();
    sub_24938ABEC(v1, v3);
    v10[0] = 0;
    id v7 = objc_msgSend(v5, sel_JSONObjectWithData_options_error_, v6, 0, v10);

    id v8 = v10[0];
    if (v7)
    {
      sub_24938CE70();
      return swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = v8;
      sub_24938CBA0();

      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_24938ABEC(uint64_t a1, unint64_t a2)
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

uint64_t static DictionarySerialization.decode(_:from:)(uint64_t a1, void *a2)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  sub_24938CB40();
  swift_allocObject();
  sub_24938CB30();
  unint64_t v3 = self;
  __swift_project_boxed_opaque_existential_0(a2, a2[3]);
  v11[0] = 0;
  id v4 = objc_msgSend(v3, sel_dataWithJSONObject_options_error_, sub_24938CF00(), 0, v11);
  swift_unknownObjectRelease();
  id v5 = v11[0];
  if (v4)
  {
    uint64_t v6 = sub_24938CC00();
    unint64_t v8 = v7;

    sub_24938CB20();
    swift_release();
    return sub_24938ABEC(v6, v8);
  }
  else
  {
    unint64_t v10 = v5;
    swift_release();
    sub_24938CBA0();

    return swift_willThrow();
  }
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24938AE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata accessor for DictionarySerialization()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t AsyncMutex.__allocating_init(label:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  AsyncMutex.init(label:)(a1, a2);
  return v4;
}

uint64_t AsyncMutex.init(label:)(uint64_t a1, uint64_t a2)
{
  v8[1] = a1;
  v8[2] = a2;
  uint64_t v3 = sub_24938CE10();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24938CE00();
  MEMORY[0x270FA5388]();
  sub_24938CC50();
  MEMORY[0x270FA5388]();
  *(void *)(v2 + 24) = dispatch_group_create();
  sub_24938B074();
  sub_24938CC40();
  v8[3] = MEMORY[0x263F8EE78];
  sub_24938B0B4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A6798);
  sub_24938B10C();
  sub_24938CE80();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F130], v3);
  *(void *)(v2 + 16) = sub_24938CE30();
  return v2;
}

unint64_t sub_24938B074()
{
  unint64_t result = qword_2696A6788;
  if (!qword_2696A6788)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2696A6788);
  }
  return result;
}

unint64_t sub_24938B0B4()
{
  unint64_t result = qword_2696A6790;
  if (!qword_2696A6790)
  {
    sub_24938CE00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A6790);
  }
  return result;
}

unint64_t sub_24938B10C()
{
  unint64_t result = qword_2696A67A0;
  if (!qword_2696A67A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A6798);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A67A0);
  }
  return result;
}

uint64_t sub_24938B168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_24938B190, 0, 0);
}

uint64_t sub_24938B190()
{
  uint64_t v1 = *(void *)(v0[6] + 16);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[7] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24938B238;
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  return OS_dispatch_group.bf_notify<A>(queue:execute:)(v5, v1, v6, v3, v4);
}

uint64_t sub_24938B238()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t AsyncMutex.deinit()
{
  return v0;
}

uint64_t AsyncMutex.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for AsyncMutex()
{
  return self;
}

uint64_t method lookup function for AsyncMutex(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AsyncMutex);
}

uint64_t dispatch thunk of AsyncMutex.__allocating_init(label:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of AsyncMutex.perform<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 104)
                                                                   + **(int **)(*(void *)v4 + 104));
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *unint64_t v10 = v5;
  v10[1] = sub_24938B50C;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_24938B50C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t OS_dispatch_group.bf_notify<A>(queue:execute:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return MEMORY[0x270FA2498](sub_24938B628, 0, 0);
}

uint64_t sub_24938B628()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  long long v3 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24938B720;
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 16);
  return MEMORY[0x270FA2360](v6, 0, 0, 0xD000000000000019, 0x800000024938DC10, sub_24938BC3C, v2, v5);
}

uint64_t sub_24938B720()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24938B85C, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24938B85C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24938B8C0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = a4;
  uint64_t v29 = a5;
  uint64_t v33 = a3;
  uint64_t v27 = a2;
  uint64_t v8 = sub_24938CC30();
  uint64_t v32 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24938CC50();
  uint64_t v30 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  uint64_t v14 = sub_24938CD80();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388]();
  unint64_t v18 = (char *)&v27 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v27 - v17, a1, v14);
  unint64_t v19 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v20 = (v16 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a6;
  uint64_t v22 = v27;
  *(void *)(v21 + 24) = v27;
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v21 + v19, v18, v14);
  unint64_t v23 = (void *)(v21 + v20);
  uint64_t v24 = v29;
  void *v23 = v28;
  v23[1] = v24;
  aBlock[4] = sub_24938BF84;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2493863D4;
  aBlock[3] = &block_descriptor_1;
  uint64_t v25 = _Block_copy(aBlock);
  v22;
  swift_retain();
  sub_24938CC40();
  uint64_t v34 = MEMORY[0x263F8EE78];
  sub_24938A0B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A65D0);
  sub_24938A110();
  sub_24938CE80();
  sub_24938CDF0();
  _Block_release(v25);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v31);
  return swift_release();
}

uint64_t sub_24938BC3C(uint64_t a1)
{
  return sub_24938B8C0(a1, *(void **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 16));
}

uint64_t sub_24938BC4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a3;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  uint64_t v9 = sub_24938CD80();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v22 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A67C0);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_group_enter(a1);
  uint64_t v16 = sub_24938CDA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a2, v9);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = 0;
  *((void *)v18 + 3) = 0;
  *((void *)v18 + 4) = a5;
  *((void *)v18 + 5) = a1;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v18[v17], v13, v9);
  unint64_t v19 = &v18[(v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8];
  *(void *)unint64_t v19 = v23;
  *((void *)v19 + 1) = a4;
  unint64_t v20 = a1;
  swift_retain();
  sub_24938C3C8((uint64_t)v15, (uint64_t)&unk_2696A67D0, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_24938BE78()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  uint64_t v1 = sub_24938CD80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6 + 16, v5);
}

uint64_t sub_24938BF84()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  uint64_t v2 = *(void *)(sub_24938CD80() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(NSObject **)(v0 + 24);
  uint64_t v5 = v0 + v3;
  unint64_t v6 = (uint64_t *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  return sub_24938BC4C(v4, v5, v7, v8, v1);
}

uint64_t sub_24938C044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6, uint64_t a7, uint64_t a8)
{
  void v8[4] = a5;
  v8[5] = a8;
  v8[3] = a4;
  uint64_t v10 = swift_task_alloc();
  v8[6] = v10;
  uint64_t v13 = (uint64_t (*)(uint64_t))((char *)a6 + *a6);
  uint64_t v11 = (void *)swift_task_alloc();
  v8[7] = v11;
  *uint64_t v11 = v8;
  v11[1] = sub_24938C154;
  return v13(v10);
}

uint64_t sub_24938C154()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24938C314;
  }
  else {
    uint64_t v2 = sub_24938C268;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24938C268()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  sub_24938CD80();
  sub_24938CD70();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 24));
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24938C314()
{
  *(void *)(v0 + 16) = *(void *)(v0 + 64);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  sub_24938CD80();
  sub_24938CD60();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 24));
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24938C3C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24938CDA0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24938CD90();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24938C7FC(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24938CD50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
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

uint64_t sub_24938C584()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  uint64_t v1 = sub_24938CD80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_24938C698(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = v1[4];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A66D8);
  uint64_t v6 = *(void *)(sub_24938CD80() - 8);
  unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = v1[5];
  uint64_t v11 = (uint64_t)v1 + v7;
  uint64_t v12 = (char *)v1 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = *(int **)v12;
  uint64_t v14 = *((void *)v12 + 1);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v15;
  *uint64_t v15 = v3;
  v15[1] = sub_24938B50C;
  return sub_24938C044(a1, v8, v9, v10, v11, v13, v14, v5);
}

uint64_t sub_24938C7FC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A67C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24938C85C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24938C938;
  return v6(a1);
}

uint64_t sub_24938C938()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24938CA30()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24938CA68(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24938B50C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2696A67D8 + dword_2696A67D8);
  return v6(a1, v4);
}

uint64_t sub_24938CB20()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_24938CB30()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_24938CB40()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_24938CB50()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_24938CB60()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_24938CB70()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_24938CB80()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24938CB90()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24938CBA0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_24938CBB0()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_24938CBC0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_24938CBD0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24938CBE0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24938CBF0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_24938CC00()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_24938CC10()
{
  return MEMORY[0x270FA2A78]();
}

uint64_t sub_24938CC20()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_24938CC30()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_24938CC40()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_24938CC50()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_24938CC60()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24938CC70()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24938CC80()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_24938CC90()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24938CCA0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24938CCB0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24938CCC0()
{
  return MEMORY[0x270F9D7C8]();
}

uint64_t sub_24938CCD0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24938CCE0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24938CCF0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24938CD00()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24938CD10()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24938CD20()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24938CD30()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24938CD40()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24938CD50()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24938CD60()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_24938CD70()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_24938CD80()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_24938CD90()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24938CDA0()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24938CDB0()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_24938CDC0()
{
  return MEMORY[0x270EE3630]();
}

uint64_t sub_24938CDD0()
{
  return MEMORY[0x270EE3638]();
}

uint64_t sub_24938CDE0()
{
  return MEMORY[0x270EE3640]();
}

uint64_t sub_24938CDF0()
{
  return MEMORY[0x270FA0C20]();
}

uint64_t sub_24938CE00()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_24938CE10()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_24938CE20()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_24938CE30()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_24938CE40()
{
  return MEMORY[0x270FA0F30]();
}

uint64_t sub_24938CE50()
{
  return MEMORY[0x270FA0F48]();
}

uint64_t sub_24938CE60()
{
  return MEMORY[0x270EE3728]();
}

uint64_t sub_24938CE70()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24938CE80()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24938CE90()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24938CEA0()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_24938CEB0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24938CEC0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24938CED0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24938CEE0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24938CEF0()
{
  return MEMORY[0x270F9F380]();
}

uint64_t sub_24938CF00()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24938CF10()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24938CF20()
{
  return MEMORY[0x270F9F960]();
}

uint64_t sub_24938CF30()
{
  return MEMORY[0x270F9F968]();
}

uint64_t sub_24938CF50()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24938CF60()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24938CF70()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24938CF80()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24938CF90()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24938CFA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24938CFB0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24938CFC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24938CFD0()
{
  return MEMORY[0x270FA0090]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x270F9B5A8](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}