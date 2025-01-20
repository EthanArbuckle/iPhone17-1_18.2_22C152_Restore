uint64_t StructuredContext.AppInFocusContext.bundleId.getter()
{
  swift_bridgeObjectRetain();
  return sub_253E39ECC();
}

uint64_t StructuredContext.AppInFocusContext.bundleId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*StructuredContext.AppInFocusContext.bundleId.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.AppInFocusContext.appName.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.AppInFocusContext.appName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*StructuredContext.AppInFocusContext.appName.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.AppInFocusContext.category.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.AppInFocusContext.category.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*StructuredContext.AppInFocusContext.category.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.AppInFocusContext.init(bundleId:appName:category:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t static StructuredContext.AppInFocusContext.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v9 = a2[4];
  uint64_t v8 = a2[5];
  if (*a1 != *a2 || a1[1] != a2[1])
  {
    char v11 = sub_253E82780();
    uint64_t result = 0;
    if ((v11 & 1) == 0) {
      return result;
    }
  }
  if (!v4)
  {
    if (v6) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v6) {
    return 0;
  }
  BOOL v13 = v2 == v7 && v4 == v6;
  if (v13 || (v14 = sub_253E82780(), uint64_t result = 0, (v14 & 1) != 0))
  {
LABEL_15:
    if (v5)
    {
      if (v8)
      {
        if (v3 == v9 && v5 == v8) {
          return 1;
        }
        sub_253E39ECC();
        if (sub_253E82780()) {
          return 1;
        }
      }
    }
    else if (!v8)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

BOOL sub_253E38BB0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_253E38BC0()
{
  return sub_253E82810();
}

uint64_t sub_253E38BE8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x656D614E707061 && a2 == 0xE700000000000000;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_253E82780();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_253E38D38()
{
  return 3;
}

uint64_t sub_253E38D40()
{
  return sub_253E82840();
}

uint64_t sub_253E38D88()
{
  return 0;
}

uint64_t sub_253E38D94(char a1)
{
  if (!a1) {
    return 0x6449656C646E7562;
  }
  if (a1 == 1) {
    return 0x656D614E707061;
  }
  return 0x79726F6765746163;
}

BOOL sub_253E38DEC(char *a1, char *a2)
{
  return sub_253E38BB0(*a1, *a2);
}

uint64_t sub_253E38DF8()
{
  return sub_253E38D40();
}

uint64_t sub_253E38E00()
{
  return sub_253E38BC0();
}

uint64_t sub_253E38E08()
{
  return sub_253E82840();
}

uint64_t sub_253E38E4C()
{
  return sub_253E38D94(*v0);
}

uint64_t sub_253E38E54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E38BE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E38E7C()
{
  return sub_253E38D88();
}

uint64_t sub_253E38E9C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E38D38();
  *a1 = result;
  return result;
}

uint64_t sub_253E38EC4(uint64_t a1)
{
  unint64_t v2 = sub_253E3914C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E38F00(uint64_t a1)
{
  unint64_t v2 = sub_253E3914C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StructuredContext.AppInFocusContext.encode(to:)(void *a1)
{
  sub_253E390C4(&qword_26B257988);
  sub_253E39E98();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = v1[2];
  v12[3] = v1[3];
  v12[4] = v8;
  uint64_t v9 = v1[4];
  v12[1] = v1[5];
  v12[2] = v9;
  sub_253E39108(a1, a1[3]);
  sub_253E3914C();
  sub_253E82860();
  char v15 = 0;
  uint64_t v10 = v12[5];
  sub_253E82710();
  if (!v10)
  {
    char v14 = 1;
    sub_253E826B0();
    char v13 = 2;
    sub_253E826B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v2);
}

uint64_t sub_253E390C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_253E39108(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_253E3914C()
{
  unint64_t result = qword_26B2578F8;
  if (!qword_26B2578F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2578F8);
  }
  return result;
}

uint64_t StructuredContext.AppInFocusContext.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_253E390C4(&qword_269D97430);
  sub_253E39E98();
  MEMORY[0x270FA5388]();
  sub_253E39108(a1, a1[3]);
  sub_253E3914C();
  sub_253E82850();
  if (v2)
  {
    sub_253E393E4((uint64_t)a1);
  }
  else
  {
    uint64_t v5 = sub_253E82640();
    uint64_t v8 = v7;
    uint64_t v19 = v5;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_253E825E0();
    uint64_t v11 = v10;
    uint64_t v18 = v9;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_253E825E0();
    uint64_t v14 = v13;
    uint64_t v17 = v12;
    uint64_t v15 = sub_253E39EB8();
    v16(v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v19;
    a2[1] = v8;
    a2[2] = v18;
    a2[3] = v11;
    a2[4] = v17;
    a2[5] = v14;
    sub_253E393E4((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E393E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_253E39434@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return StructuredContext.AppInFocusContext.init(from:)(a1, a2);
}

uint64_t sub_253E3944C(void *a1)
{
  return StructuredContext.AppInFocusContext.encode(to:)(a1);
}

uint64_t default argument 3 of UIControlTool.init(toolDef:appBundleId:command:commandId:)()
{
  return 0;
}

uint64_t _s17AppInFocusContextVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s17AppInFocusContextVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s17AppInFocusContextVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s17AppInFocusContextVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 _s17AppInFocusContextVwtk(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *_s17AppInFocusContextVwta(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17AppInFocusContextVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s17AppInFocusContextVwst(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StructuredContext.AppInFocusContext()
{
  return &type metadata for StructuredContext.AppInFocusContext;
}

unsigned char *_s17AppInFocusContextV10CodingKeysOwCP(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t _s17AppInFocusContextV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s17AppInFocusContextV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x253E39840);
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

uint64_t sub_253E39868(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_253E39870(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *_s17AppInFocusContextV10CodingKeysOMa()
{
  return &_s17AppInFocusContextV10CodingKeysON;
}

unint64_t sub_253E3988C()
{
  unint64_t result = qword_269D97438;
  if (!qword_269D97438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97438);
  }
  return result;
}

unint64_t sub_253E398DC()
{
  unint64_t result = qword_26B257908;
  if (!qword_26B257908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257908);
  }
  return result;
}

unint64_t sub_253E3992C()
{
  unint64_t result = qword_26B257900;
  if (!qword_26B257900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257900);
  }
  return result;
}

void type metadata accessor for URLResourceKey()
{
  if (!qword_269D97440)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_269D97440);
    }
  }
}

uint64_t sub_253E399C4()
{
  return sub_253E39CFC(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_253E399F8(uint64_t a1, id *a2)
{
  uint64_t result = sub_253E82310();
  *a2 = 0;
  return result;
}

uint64_t sub_253E39A74(uint64_t a1, id *a2)
{
  char v3 = sub_253E82320();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_253E39AF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_253E39B1C();
  *a1 = result;
  return result;
}

uint64_t sub_253E39B1C()
{
  sub_253E82330();
  uint64_t v0 = sub_253E82300();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_253E39B54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_253E82300();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_253E39B9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_253E39BC8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_253E39BCC(uint64_t a1)
{
  uint64_t v2 = sub_253E39E54(&qword_269D97460);
  uint64_t v3 = sub_253E39E54(&qword_269D97468);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_253E39C64()
{
  return sub_253E39E54(&qword_269D97448);
}

uint64_t sub_253E39C98()
{
  return sub_253E39E54(&qword_269D97450);
}

uint64_t sub_253E39CCC()
{
  return sub_253E39CFC(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_253E39CFC(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_253E82330();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_253E39D3C()
{
  return sub_253E39D44();
}

uint64_t sub_253E39D44()
{
  sub_253E82330();
  sub_253E82360();

  return swift_bridgeObjectRelease();
}

uint64_t sub_253E39D98()
{
  return sub_253E39DA0();
}

uint64_t sub_253E39DA0()
{
  sub_253E82330();
  sub_253E82800();
  sub_253E82360();
  uint64_t v0 = sub_253E82840();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_253E39E14()
{
  return sub_253E3CF84();
}

uint64_t sub_253E39E20()
{
  return sub_253E39E54(&qword_269D97458);
}

uint64_t sub_253E39E54(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_253E39EB8()
{
  return v0;
}

uint64_t sub_253E39ECC()
{
  return v0;
}

uint64_t StructuredContext.IntelligenceCommandContext.identifier.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.IntelligenceCommandContext.identifier.setter()
{
  sub_253E3B9B0();
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*StructuredContext.IntelligenceCommandContext.identifier.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.IntelligenceCommandContext.title.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.IntelligenceCommandContext.title.setter()
{
  sub_253E3B9B0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*StructuredContext.IntelligenceCommandContext.title.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.IntelligenceCommandContext.standaloneTitle.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.IntelligenceCommandContext.standaloneTitle.setter()
{
  sub_253E3B9B0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*StructuredContext.IntelligenceCommandContext.standaloneTitle.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.IntelligenceCommandContext.menuHierarchyComponents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StructuredContext.IntelligenceCommandContext.menuHierarchyComponents.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*StructuredContext.IntelligenceCommandContext.menuHierarchyComponents.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.IntelligenceCommandContext.embeddingDescription.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.IntelligenceCommandContext.embeddingDescription.setter()
{
  sub_253E3B9B0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = v0;
  return result;
}

uint64_t (*StructuredContext.IntelligenceCommandContext.embeddingDescription.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.IntelligenceCommandContext.isDisabled.getter()
{
  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t StructuredContext.IntelligenceCommandContext.isDisabled.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 72) = result;
  return result;
}

uint64_t (*StructuredContext.IntelligenceCommandContext.isDisabled.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.IntelligenceCommandContext.init(identifier:title:standaloneTitle:menuHierarchyComponents:embeddingDescription:isDisabled:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 64) = a10;
  *(unsigned char *)(a9 + 72) = a11;
  return result;
}

uint64_t static StructuredContext.IntelligenceCommandContext.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  int v22 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v11 = *(void **)(a2 + 48);
  uint64_t v23 = *(void *)(a2 + 56);
  uint64_t v24 = *(void *)(a1 + 56);
  uint64_t v25 = *(void *)(a2 + 64);
  uint64_t v26 = *(void *)(a1 + 64);
  BOOL v12 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  int v21 = *(unsigned __int8 *)(a2 + 72);
  if (!v12)
  {
    sub_253E82780();
    uint64_t result = sub_253E3B96C();
    if ((v14 & 1) == 0) {
      return result;
    }
  }
  if (!v3)
  {
    if (v7) {
      return 0;
    }
    goto LABEL_15;
  }
  if (!v7) {
    return 0;
  }
  BOOL v15 = v2 == v8 && v3 == v7;
  if (v15 || (sub_253E82780(), uint64_t result = sub_253E3B96C(), (v16 & 1) != 0))
  {
LABEL_15:
    if (v6)
    {
      if (!v9) {
        return 0;
      }
      if (v4 != v10 || v6 != v9)
      {
        sub_253E82780();
        uint64_t result = sub_253E3B96C();
        if ((v18 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v9)
    {
      return 0;
    }
    if (sub_253E3A5E8(v5, v11))
    {
      if (v26)
      {
        if (v25)
        {
          if (v24 != v23 || v26 != v25)
          {
            sub_253E82780();
            uint64_t result = sub_253E3B96C();
            if ((v20 & 1) == 0) {
              return result;
            }
          }
          return v22 ^ v21 ^ 1u;
        }
      }
      else if (!v25)
      {
        return v22 ^ v21 ^ 1u;
      }
    }
    return 0;
  }
  return result;
}

BOOL sub_253E3A310(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for RetrievedTool(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2) {
      return 1;
    }
    uint64_t v12 = 0;
    unint64_t v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v33 = a1 + v13;
    uint64_t v14 = a2 + v13;
    uint64_t v15 = *(void *)(v8 + 72);
    while (1)
    {
      sub_253E3B878(v33 + v15 * v12, (uint64_t)v10);
      sub_253E3B878(v14 + v15 * v12, (uint64_t)v7);
      static RetrievedTool.Definition.== infix(_:_:)();
      if ((v16 & 1) == 0) {
        break;
      }
      if (*(float *)&v10[v4[5]] != *(float *)&v7[v4[5]]) {
        break;
      }
      uint64_t v17 = v4[6];
      uint64_t v18 = *(void *)&v10[v17];
      uint64_t v19 = *(void *)&v7[v17];
      uint64_t v20 = *(void *)(v18 + 16);
      if (v20 != *(void *)(v19 + 16)) {
        break;
      }
      if (v20) {
        BOOL v21 = v18 == v19;
      }
      else {
        BOOL v21 = 1;
      }
      if (!v21)
      {
        int v22 = (float *)(v19 + 48);
        uint64_t v23 = (float *)(v18 + 48);
        do
        {
          float v24 = *v23;
          float v25 = *v22;
          BOOL v26 = *((void *)v23 - 2) == *((void *)v22 - 2) && *((void *)v23 - 1) == *((void *)v22 - 1);
          if (!v26 && (sub_253E82780() & 1) == 0 || v24 != v25) {
            goto LABEL_27;
          }
          v22 += 6;
          v23 += 6;
        }
        while (--v20);
      }
      ++v12;
      uint64_t v27 = v4[7];
      int v28 = v10[v27];
      int v29 = v7[v27];
      sub_253E3B8DC((uint64_t)v7);
      sub_253E3B8DC((uint64_t)v10);
      BOOL result = v28 == v29;
      if (v28 != v29 || v12 == v11) {
        return result;
      }
    }
LABEL_27:
    sub_253E3B8DC((uint64_t)v7);
    sub_253E3B8DC((uint64_t)v10);
  }
  return 0;
}

uint64_t sub_253E3A53C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = (float *)(a2 + 48);
    uint64_t v4 = (float *)(a1 + 48);
    do
    {
      float v5 = *v4;
      float v6 = *v3;
      if (*((void *)v4 - 2) == *((void *)v3 - 2) && *((void *)v4 - 1) == *((void *)v3 - 1))
      {
        if (v5 != v6) {
          return 0;
        }
      }
      else
      {
        sub_253E82780();
        uint64_t result = sub_253E3B96C();
        if ((v9 & 1) == 0 || v5 != v6) {
          return result;
        }
      }
      v3 += 6;
      v4 += 6;
      --v2;
    }
    while (v2);
  }
  return 1;
}

uint64_t sub_253E3A5E8(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    sub_253E82780();
    uint64_t result = sub_253E3B96C();
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v8 = a2 + 7;
  char v9 = a1 + 7;
  unint64_t v10 = 1;
  while (v10 < v2)
  {
    uint64_t result = *(v9 - 1);
    if (result != *(v8 - 1) || *v9 != *v8)
    {
      uint64_t result = sub_253E82780();
      if ((result & 1) == 0) {
        return 0;
      }
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10) {
      return 1;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_253E3A6B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v3 = v2 - 1;
      uint64_t v4 = (_OWORD *)(a1 + 64);
      float v5 = (_OWORD *)(a2 + 64);
      do
      {
        long long v6 = *(v4 - 1);
        v17[0] = *(v4 - 2);
        v17[1] = v6;
        long long v7 = v4[1];
        v17[2] = *v4;
        v17[3] = v7;
        long long v8 = v4[3];
        v17[4] = v4[2];
        v17[5] = v8;
        long long v9 = *(v5 - 1);
        v16[0] = *(v5 - 2);
        v16[1] = v9;
        long long v10 = v5[1];
        v16[2] = *v5;
        v16[3] = v10;
        long long v11 = v5[3];
        v16[4] = v5[2];
        v16[5] = v11;
        char v12 = static StructuredContext.SiriRequestContext.MeCard.Address.== infix(_:_:)(v17, v16);
        BOOL v14 = v3-- != 0;
        if ((v12 & 1) == 0) {
          break;
        }
        v4 += 6;
        v5 += 6;
      }
      while (v14);
    }
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_253E3A770(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6F6C61646E617473 && a2 == 0xEF656C746954656ELL;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000017 && a2 == 0x8000000253E831E0 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000014 && a2 == 0x8000000253E83200 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0x6C62617369447369 && a2 == 0xEA00000000006465)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else
      {
        char v9 = sub_253E82780();
        swift_bridgeObjectRelease();
        if (v9) {
          return 5;
        }
        else {
          return 6;
        }
      }
    }
  }
}

uint64_t sub_253E3A9FC()
{
  return 6;
}

unint64_t sub_253E3AA04(char a1)
{
  unint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x656C746974;
      break;
    case 2:
      unint64_t result = 0x6F6C61646E617473;
      break;
    case 3:
      unint64_t result = 0xD000000000000017;
      break;
    case 4:
      unint64_t result = 0xD000000000000014;
      break;
    case 5:
      unint64_t result = 0x6C62617369447369;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E3AAF0()
{
  return sub_253E3AA04(*v0);
}

uint64_t sub_253E3AAF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E3A770(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E3AB20@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E3A9FC();
  *a1 = result;
  return result;
}

uint64_t sub_253E3AB48(uint64_t a1)
{
  unint64_t v2 = sub_253E3AE08();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E3AB84(uint64_t a1)
{
  unint64_t v2 = sub_253E3AE08();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t StructuredContext.IntelligenceCommandContext.encode(to:)(void *a1)
{
  uint64_t v3 = sub_253E390C4(&qword_269D97470);
  sub_253E3B950();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388]();
  BOOL v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v20 = *(void *)(v1 + 24);
  uint64_t v21 = v8;
  uint64_t v9 = *(void *)(v1 + 32);
  uint64_t v18 = *(void *)(v1 + 40);
  uint64_t v19 = v9;
  uint64_t v10 = *(void *)(v1 + 48);
  uint64_t v15 = *(void *)(v1 + 56);
  uint64_t v16 = *(void *)(v1 + 64);
  uint64_t v17 = v10;
  v14[1] = *(unsigned __int8 *)(v1 + 72);
  sub_253E39108(a1, a1[3]);
  sub_253E3AE08();
  sub_253E82860();
  char v29 = 0;
  uint64_t v11 = v22;
  sub_253E82710();
  if (!v11)
  {
    uint64_t v12 = v17;
    char v28 = 1;
    sub_253E3B978();
    char v27 = 2;
    sub_253E3B978();
    uint64_t v23 = v12;
    char v26 = 3;
    sub_253E390C4(&qword_269D97480);
    sub_253E3B28C(&qword_269D97488);
    sub_253E82750();
    char v25 = 4;
    sub_253E3B978();
    char v24 = 5;
    sub_253E82720();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v3);
}

unint64_t sub_253E3AE08()
{
  unint64_t result = qword_269D97478;
  if (!qword_269D97478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97478);
  }
  return result;
}

uint64_t sub_253E3AE54(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t StructuredContext.IntelligenceCommandContext.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_253E390C4(&qword_269D97490);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E39108(a1, a1[3]);
  sub_253E3AE08();
  sub_253E82850();
  if (v2)
  {
    sub_253E393E4((uint64_t)a1);
  }
  else
  {
    uint64_t v5 = sub_253E82640();
    uint64_t v8 = v7;
    uint64_t v25 = v5;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_253E3B994();
    uint64_t v26 = v8;
    uint64_t v11 = v10;
    uint64_t v23 = v9;
    uint64_t v24 = a2;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_253E3B994();
    uint64_t v14 = v13;
    uint64_t v22 = v12;
    sub_253E390C4(&qword_269D97480);
    sub_253E3B28C(&qword_269D97498);
    swift_bridgeObjectRetain();
    sub_253E82680();
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_253E3B994();
    uint64_t v17 = v16;
    uint64_t v21 = v15;
    swift_bridgeObjectRetain();
    char v18 = sub_253E82650();
    uint64_t v19 = sub_253E3B938();
    v20(v19);
    *(void *)uint64_t v24 = v25;
    *(void *)(v24 + 8) = v26;
    *(void *)(v24 + 16) = v23;
    *(void *)(v24 + 24) = v11;
    *(void *)(v24 + 32) = v22;
    *(void *)(v24 + 40) = v14;
    *(void *)(v24 + 48) = v27;
    *(void *)(v24 + 56) = v21;
    *(void *)(v24 + 64) = v17;
    *(unsigned char *)(v24 + 72) = v18 & 1;
    sub_253E393E4((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E3B28C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_253E3AE54(&qword_269D97480);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_253E3B2F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return StructuredContext.IntelligenceCommandContext.init(from:)(a1, a2);
}

uint64_t sub_253E3B308(void *a1)
{
  return StructuredContext.IntelligenceCommandContext.encode(to:)(a1);
}

uint64_t _s26IntelligenceCommandContextVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t _s26IntelligenceCommandContextVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s26IntelligenceCommandContextVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

void *_s26IntelligenceCommandContextVwtk(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x49uLL);
}

uint64_t _s26IntelligenceCommandContextVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  return a1;
}

uint64_t _s26IntelligenceCommandContextVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 73))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s26IntelligenceCommandContextVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 72) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 73) = 1;
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
    *(unsigned char *)(result + 73) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StructuredContext.IntelligenceCommandContext()
{
  return &type metadata for StructuredContext.IntelligenceCommandContext;
}

uint64_t _s26IntelligenceCommandContextV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v5 = v6 - 6;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s26IntelligenceCommandContextV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x253E3B750);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *_s26IntelligenceCommandContextV10CodingKeysOMa()
{
  return &_s26IntelligenceCommandContextV10CodingKeysON;
}

unint64_t sub_253E3B78C()
{
  unint64_t result = qword_269D974A0;
  if (!qword_269D974A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D974A0);
  }
  return result;
}

unint64_t sub_253E3B7DC()
{
  unint64_t result = qword_269D974A8;
  if (!qword_269D974A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D974A8);
  }
  return result;
}

unint64_t sub_253E3B82C()
{
  unint64_t result = qword_269D974B0;
  if (!qword_269D974B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D974B0);
  }
  return result;
}

uint64_t sub_253E3B878(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RetrievedTool(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_253E3B8DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RetrievedTool(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_253E3B938()
{
  return v0;
}

uint64_t sub_253E3B96C()
{
  return 0;
}

uint64_t sub_253E3B978()
{
  return sub_253E826B0();
}

uint64_t sub_253E3B994()
{
  return sub_253E825E0();
}

uint64_t StructuredContext.SiriRequestContext.sessionID.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.sessionID.setter()
{
  uint64_t result = sub_253E46000();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.sessionID.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.requestID.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.requestID.setter()
{
  uint64_t result = sub_253E46194();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.requestID.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.inputOrigin.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.inputOrigin.setter()
{
  uint64_t result = sub_253E46178();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.inputOrigin.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.responseMode.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.responseMode.setter()
{
  uint64_t result = sub_253E4615C();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.responseMode.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isEyesFree.getter()
{
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t StructuredContext.SiriRequestContext.isEyesFree.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 64) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isEyesFree.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isMultiUser.getter()
{
  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t StructuredContext.SiriRequestContext.isMultiUser.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 65) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isMultiUser.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isVoiceTriggerEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 66);
}

uint64_t StructuredContext.SiriRequestContext.isVoiceTriggerEnabled.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 66) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isVoiceTriggerEnabled.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isTextToSpeechEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 67);
}

uint64_t StructuredContext.SiriRequestContext.isTextToSpeechEnabled.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 67) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isTextToSpeechEnabled.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.isTriggerlessFollowup.getter()
{
  return *(unsigned __int8 *)(v0 + 68);
}

uint64_t StructuredContext.SiriRequestContext.isTriggerlessFollowup.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 68) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.isTriggerlessFollowup.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.deviceRestrictions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StructuredContext.SiriRequestContext.deviceRestrictions.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 72) = a1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.deviceRestrictions.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.bargeInModes.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.bargeInModes.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.identifiedUser.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(v1 + 96);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(v1 + 104);
  return sub_253E3BD3C(v2, v3);
}

uint64_t sub_253E3BD3C(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t StructuredContext.SiriRequestContext.identifiedUser.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  __int16 v4 = *((_WORD *)a1 + 8);
  uint64_t result = sub_253E3BD90(*(void *)(v1 + 88), *(void *)(v1 + 96));
  *(void *)(v1 + 88) = v2;
  *(void *)(v1 + 96) = v3;
  *(_WORD *)(v1 + 104) = v4;
  return result;
}

uint64_t sub_253E3BD90(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.identifiedUser.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.encodedLocation.getter()
{
  uint64_t v0 = sub_253E39ECC();
  sub_253E3BDF0(v0, v1);
  return sub_253E39ECC();
}

uint64_t sub_253E3BDF0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_253E3BE04(a1, a2);
  }
  return a1;
}

uint64_t sub_253E3BE04(uint64_t a1, unint64_t a2)
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

uint64_t StructuredContext.SiriRequestContext.encodedLocation.setter()
{
  sub_253E3B9B0();
  uint64_t result = sub_253E3BE90(*(void *)(v1 + 112), *(void *)(v1 + 120));
  *(void *)(v1 + 112) = v2;
  *(void *)(v1 + 120) = v0;
  return result;
}

uint64_t sub_253E3BE90(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_253E3BEA4(a1, a2);
  }
  return a1;
}

uint64_t sub_253E3BEA4(uint64_t a1, unint64_t a2)
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

uint64_t (*StructuredContext.SiriRequestContext.encodedLocation.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.countryCode.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.countryCode.setter()
{
  sub_253E3B9B0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 128) = v2;
  *(void *)(v1 + 136) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.countryCode.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.siriLocale.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.siriLocale.setter()
{
  sub_253E3B9B0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 144) = v2;
  *(void *)(v1 + 152) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.siriLocale.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.contentRestrictions.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 168);
  uint64_t v4 = *(void *)(v1 + 176);
  uint64_t v5 = *(void *)(v1 + 184);
  char v6 = *(unsigned char *)(v1 + 196);
  int v7 = *(_DWORD *)(v1 + 192);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 36) = v6;
  *(_DWORD *)(a1 + 32) = v7;
  return sub_253E3C044(v2, v3, v4);
}

uint64_t sub_253E3C044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

__n128 StructuredContext.SiriRequestContext.contentRestrictions.setter(__n128 *a1)
{
  __n128 v8 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int32 v4 = a1[2].n128_u32[0];
  unsigned __int8 v5 = a1[2].n128_u8[4];
  uint64_t v6 = v1 + 192;
  sub_253E3C0CC(*(void *)(v6 - 32), *(void *)(v6 - 24), *(void *)(v6 - 16));
  __n128 result = v8;
  *(__n128 *)(v6 - 32) = v8;
  *(void *)(v6 - 16) = v2;
  *(void *)(v6 - 8) = v3;
  *(unsigned char *)(v6 + 4) = v5;
  *(_DWORD *)uint64_t v6 = v4;
  return result;
}

uint64_t sub_253E3C0CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.contentRestrictions.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.uiScale.getter()
{
  return *(void *)(v0 + 200);
}

uint64_t StructuredContext.SiriRequestContext.uiScale.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 200) = result;
  *(unsigned char *)(v2 + 208) = a2 & 1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.uiScale.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.temperatureUnit.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.temperatureUnit.setter()
{
  sub_253E3B9B0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 216) = v2;
  *(void *)(v1 + 224) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.temperatureUnit.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.allowUserGeneratedContent.getter()
{
  return *(unsigned __int8 *)(v0 + 232);
}

uint64_t StructuredContext.SiriRequestContext.allowUserGeneratedContent.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 232) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.allowUserGeneratedContent.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.censorSpeech.getter()
{
  return *(unsigned __int8 *)(v0 + 233);
}

uint64_t StructuredContext.SiriRequestContext.censorSpeech.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 233) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.censorSpeech.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.meCard.getter()
{
  uint64_t v1 = sub_253E46250();
  uint64_t v2 = v0[38];
  uint64_t v3 = v0[39];
  uint64_t v4 = v0[40];
  *uint64_t v6 = v1;
  v6[1] = v5;
  v6[2] = v7;
  v6[3] = v8;
  v6[4] = v9;
  v6[5] = v10;
  v6[6] = v11;
  v6[7] = v12;
  v6[8] = v2;
  v6[9] = v3;
  v6[10] = v4;
  return sub_253E3C268(v1, v5, v7, v8, v9, v10, v11, v12, v2, v3, v4);
}

uint64_t sub_253E3C268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a11)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

__n128 StructuredContext.SiriRequestContext.meCard.setter(long long *a1)
{
  long long v15 = a1[1];
  long long v16 = *a1;
  long long v13 = a1[3];
  long long v14 = a1[2];
  __n128 v12 = (__n128)a1[4];
  uint64_t v2 = *((void *)a1 + 10);
  uint64_t v3 = sub_253E46250();
  sub_253E3C380(v3, v4, v5, v6, v7, v8, v9, v10, *(void *)(v1 + 304), *(void *)(v1 + 312), *(void *)(v1 + 320));
  *(_OWORD *)(v1 + 240) = v16;
  *(_OWORD *)(v1 + 256) = v15;
  *(_OWORD *)(v1 + 272) = v14;
  *(_OWORD *)(v1 + 288) = v13;
  __n128 result = v12;
  *(__n128 *)(v1 + 304) = v12;
  *(void *)(v1 + 320) = v2;
  return result;
}

uint64_t sub_253E3C380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t result = a11;
  if (a11)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.meCard.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.deviceIdiom.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 328);
}

unsigned char *StructuredContext.SiriRequestContext.deviceIdiom.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 328) = *result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.deviceIdiom.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.didPSCFire.getter()
{
  return *(unsigned __int8 *)(v0 + 329);
}

uint64_t StructuredContext.SiriRequestContext.didPSCFire.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 329) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.didPSCFire.modify())()
{
  return nullsub_1;
}

unint64_t StructuredContext.SiriRequestContext.ContentRestriction.appRestriction.getter()
{
  return sub_253E45F14(*v0);
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.appRestriction.setter(uint64_t result)
{
  *(_DWORD *)uint64_t v1 = result;
  *(unsigned char *)(v1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.ContentRestriction.appRestriction.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.countryCode.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.countryCode.setter()
{
  sub_253E3B9B0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = v2;
  *(void *)(v1 + 16) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.ContentRestriction.countryCode.modify())()
{
  return nullsub_1;
}

unint64_t StructuredContext.SiriRequestContext.ContentRestriction.movieRestriction.getter()
{
  return sub_253E45F14(*(unsigned int *)(v0 + 24));
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.movieRestriction.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 24) = result;
  *(unsigned char *)(v1 + 28) = BYTE4(result) & 1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.ContentRestriction.movieRestriction.modify())()
{
  return nullsub_1;
}

unint64_t StructuredContext.SiriRequestContext.ContentRestriction.tvRestriction.getter()
{
  return sub_253E45F14(*(unsigned int *)(v0 + 32));
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.tvRestriction.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 32) = result;
  *(unsigned char *)(v1 + 36) = BYTE4(result) & 1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.ContentRestriction.tvRestriction.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.ContentRestriction.init(appRestriction:countryCode:movieRestriction:tvRestriction:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(unsigned char *)(a6 + 4) = BYTE4(result) & 1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = a3;
  *(_DWORD *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 28) = BYTE4(a4) & 1;
  *(_DWORD *)(a6 + 32) = a5;
  *(unsigned char *)(a6 + 36) = BYTE4(a5) & 1;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.ContentRestriction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a1 + 4);
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  int v7 = *(_DWORD *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 28);
  int v9 = *(_DWORD *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 36);
  uint64_t v11 = *(void *)(a2 + 16);
  int v12 = *(_DWORD *)(a2 + 24);
  int v13 = *(unsigned __int8 *)(a2 + 28);
  int v14 = *(_DWORD *)(a2 + 32);
  char v15 = *(unsigned char *)(a2 + 36);
  if (v4)
  {
    if (!*(unsigned char *)(a2 + 4)) {
      return 0;
    }
  }
  else
  {
    if (*(_DWORD *)a1 == *(_DWORD *)a2) {
      char v16 = *(unsigned char *)(a2 + 4);
    }
    else {
      char v16 = 1;
    }
    if (v16) {
      return 0;
    }
  }
  if (!v6)
  {
    if (!v11) {
      goto LABEL_17;
    }
    return 0;
  }
  if (!v11) {
    return 0;
  }
  BOOL v17 = v5 == *(void *)(a2 + 8) && v6 == v11;
  if (v17 || (sub_253E82780(), uint64_t result = sub_253E3B96C(), (v19 & 1) != 0))
  {
LABEL_17:
    if (v8)
    {
      if (!v13) {
        return 0;
      }
    }
    else
    {
      if (v7 == v12) {
        char v20 = v13;
      }
      else {
        char v20 = 1;
      }
      if (v20) {
        return 0;
      }
    }
    if (v10)
    {
      if ((v15 & 1) == 0) {
        return 0;
      }
    }
    else
    {
      if (v9 == v14) {
        char v21 = v15;
      }
      else {
        char v21 = 1;
      }
      if (v21) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_253E3C6FC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7274736552707061 && a2 == 0xEE006E6F69746369;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x8000000253E83220 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6972747365527674 && a2 == 0xED00006E6F697463)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v8 = sub_253E82780();
      swift_bridgeObjectRelease();
      if (v8) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

uint64_t sub_253E3C908()
{
  return 4;
}

unint64_t sub_253E3C910(char a1)
{
  unint64_t result = 0x7274736552707061;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x437972746E756F63;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
      unint64_t result = 0x6972747365527674;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E3C9CC()
{
  return sub_253E3C910(*v0);
}

uint64_t sub_253E3C9D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E3C6FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E3C9FC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E3C908();
  *a1 = result;
  return result;
}

uint64_t sub_253E3CA24(uint64_t a1)
{
  unint64_t v2 = sub_253E3CC30();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E3CA60(uint64_t a1)
{
  unint64_t v2 = sub_253E3CC30();

  return MEMORY[0x270FA00B8](a1, v2);
}

void StructuredContext.SiriRequestContext.ContentRestriction.encode(to:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  sub_253E390C4(&qword_269D974C8);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E45DFC();
  sub_253E39108(v2, v2[3]);
  sub_253E3CC30();
  sub_253E46210();
  sub_253E82700();
  if (!v0)
  {
    sub_253E460AC();
    sub_253E45EFC();
    sub_253E82700();
    sub_253E82700();
  }
  uint64_t v3 = sub_253E461C0();
  v4(v3);
  sub_253E460A0();
  sub_253E45D2C();
}

unint64_t sub_253E3CC30()
{
  unint64_t result = qword_269D974D0;
  if (!qword_269D974D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D974D0);
  }
  return result;
}

void StructuredContext.SiriRequestContext.ContentRestriction.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_253E45CF0();
  a23 = v25;
  a24 = v26;
  char v28 = v27;
  uint64_t v30 = v29;
  sub_253E390C4(&qword_269D974D8);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E46108();
  sub_253E39108(v28, v28[3]);
  sub_253E3CC30();
  sub_253E82850();
  if (!v24)
  {
    a14 = 0;
    uint64_t v31 = sub_253E46118((uint64_t)&a14);
    a13 = 1;
    uint64_t v32 = sub_253E825E0();
    uint64_t v34 = v33;
    uint64_t v38 = v32;
    a12 = 2;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_253E46118((uint64_t)&a12);
    a11 = 3;
    uint64_t v35 = sub_253E46118((uint64_t)&a11);
    sub_253E45CE4();
    v36();
    *(_DWORD *)uint64_t v30 = v31;
    *(unsigned char *)(v30 + 4) = BYTE4(v31) & 1;
    *(void *)(v30 + 8) = v38;
    *(void *)(v30 + 16) = v34;
    *(_DWORD *)(v30 + 24) = v37;
    *(unsigned char *)(v30 + 28) = BYTE4(v37) & 1;
    *(_DWORD *)(v30 + 32) = v35;
    *(unsigned char *)(v30 + 36) = BYTE4(v35) & 1;
  }
  sub_253E393E4((uint64_t)v28);
  swift_bridgeObjectRelease();
  sub_253E46150();
  sub_253E45D2C();
}

#error "253E3CE70: call analysis failed (funcsize=6)"

void sub_253E3CE7C()
{
}

uint64_t StructuredContext.SiriRequestContext.User.userID.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.User.userID.setter()
{
  uint64_t result = sub_253E46000();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.User.userID.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.User.isOnlyUserInHome.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t StructuredContext.SiriRequestContext.User.isOnlyUserInHome.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.User.isOnlyUserInHome.modify())()
{
  return nullsub_1;
}

void StructuredContext.SiriRequestContext.User.classification.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 17);
}

unsigned char *StructuredContext.SiriRequestContext.User.classification.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 17) = *result;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.User.classification.modify())()
{
  return nullsub_1;
}

unint64_t StructuredContext.SiriRequestContext.User.Classification.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = 5;
  if (result < 5) {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

uint64_t sub_253E3CF84()
{
  uint64_t v0 = sub_253E82330();
  uint64_t v2 = v1;
  if (v0 == sub_253E82330() && v2 == v3) {
    sub_253E46244();
  }
  else {
    LOBYTE(v0) = sub_253E46028();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

BOOL sub_253E3CFFC(int a1, int a2)
{
  return a1 == a2;
}

uint64_t sub_253E3D008()
{
  sub_253E461FC();
  BOOL v6 = "siriEntityMatcher";
  int v7 = "globalEntityMatcher";
  int v8 = v2;
  if (v2)
  {
    if (v2 == 1) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = v5 + 2;
    }
    if (v8 == 1) {
      unint64_t v0 = 0x8000000253E831A0;
    }
    else {
      unint64_t v0 = 0x8000000253E831C0;
    }
  }
  else
  {
    uint64_t v9 = sub_253E460D8();
  }
  if (v3)
  {
    unint64_t v10 = (unint64_t)(v6 - 32) | 0x8000000000000000;
    unint64_t v11 = (unint64_t)(v7 - 32) | 0x8000000000000000;
    if (v3 == 1) {
      uint64_t v4 = v5;
    }
    else {
      uint64_t v4 = v5 + 2;
    }
    if (v3 == 1) {
      unint64_t v12 = v10;
    }
    else {
      unint64_t v12 = v11;
    }
  }
  else
  {
    unint64_t v12 = 0xE700000000000000;
  }
  if (v9 == v4 && v0 == v12) {
    sub_253E46244();
  }
  else {
    char v1 = sub_253E46028();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_253E3D0D8(uint64_t a1, uint64_t a2)
{
  return sub_253E3D2E8(a1, a2, (uint64_t (*)(void))ContextType.rawValue.getter);
}

uint64_t sub_253E3D0F0(unsigned __int8 a1, char a2)
{
  unint64_t v3 = 5395027;
  unint64_t v4 = 0xE300000000000000;
  uint64_t v5 = a1;
  BOOL v6 = "intelligenceCommands";
  uint64_t v7 = 5395027;
  switch(v5)
  {
    case 1:
      uint64_t v7 = 0x666E496563616C70;
      unint64_t v4 = 0xEE0065636E657265;
      break;
    case 2:
      uint64_t v7 = 0x7865746E6F436975;
      unint64_t v4 = 0xE900000000000074;
      break;
    case 3:
      unint64_t v4 = 0x8000000253E830D0;
      uint64_t v7 = 0xD000000000000014;
      break;
    case 4:
      uint64_t v7 = 0x74756374726F6873;
      unint64_t v4 = 0xE900000000000073;
      break;
    case 5:
      uint64_t v7 = sub_253E460D8();
      break;
    default:
      break;
  }
  unint64_t v8 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v3 = 0x666E496563616C70;
      unint64_t v8 = 0xEE0065636E657265;
      break;
    case 2:
      unint64_t v3 = 0x7865746E6F436975;
      unint64_t v8 = 0xE900000000000074;
      break;
    case 3:
      unint64_t v8 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000014;
      break;
    case 4:
      unint64_t v3 = 0x74756374726F6873;
      unint64_t v8 = 0xE900000000000073;
      break;
    case 5:
      unint64_t v8 = 0xE700000000000000;
      sub_253E461FC();
      break;
    default:
      break;
  }
  if (v7 == v3 && v4 == v8) {
    sub_253E46244();
  }
  else {
    char v2 = sub_253E46028();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_253E3D2D0(uint64_t a1, uint64_t a2)
{
  return sub_253E3D2E8(a1, a2, (uint64_t (*)(void))EntityType.rawValue.getter);
}

uint64_t sub_253E3D2E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3();
  uint64_t v6 = v5;
  if (v4 == a3() && v6 == v7) {
    sub_253E46244();
  }
  else {
    LOBYTE(v4) = sub_253E46028();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_253E3D37C()
{
  return sub_253E5C6C4(*v0);
}

uint64_t sub_253E3D384(uint64_t a1)
{
  return sub_253E5D108(a1, *v1);
}

uint64_t sub_253E3D38C(uint64_t a1)
{
  return sub_253E5CB40(a1, *v1);
}

unint64_t sub_253E3D394@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return StructuredContext.SiriRequestContext.User.Classification.init(rawValue:)(*a1, a2);
}

uint64_t sub_253E3D39C()
{
  return sub_253E82400();
}

uint64_t sub_253E3D3FC()
{
  return sub_253E823D0();
}

uint64_t StructuredContext.SiriRequestContext.User.init(userID:isOnlyUserInHome:classification:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  char v5 = *a4;
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a3;
  *(unsigned char *)(a5 + 17) = v5;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.User.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 16);
  int v5 = *(unsigned __int8 *)(a1 + 17);
  uint64_t v6 = *(void *)(a2 + 8);
  int v7 = *(unsigned __int8 *)(a2 + 16);
  int v8 = *(unsigned __int8 *)(a2 + 17);
  if (!v3)
  {
    if (v6) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v6) {
    return 0;
  }
  BOOL v9 = *(void *)a1 == *(void *)a2 && v3 == v6;
  if (v9 || (sub_253E82780(), uint64_t result = sub_253E3B96C(), (v11 & 1) != 0))
  {
LABEL_10:
    if (v4 == 2)
    {
      if (v7 != 2) {
        return 0;
      }
    }
    else
    {
      uint64_t result = 0;
      if (v7 == 2 || ((((v4 & 1) == 0) ^ v7) & 1) == 0) {
        return result;
      }
    }
    if (v5 != 5) {
      return v8 != 5 && v5 == v8;
    }
    return v8 == 5;
  }
  return result;
}

uint64_t sub_253E3D52C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x444972657375 && a2 == 0xE600000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000253E83240 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6966697373616C63 && a2 == 0xEE006E6F69746163)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v7 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v7) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_253E3D694(char a1)
{
  if (!a1) {
    return 0x444972657375;
  }
  if (a1 == 1) {
    return 0xD000000000000010;
  }
  return 0x6966697373616C63;
}

uint64_t sub_253E3D6F8()
{
  return sub_253E3D694(*v0);
}

uint64_t sub_253E3D700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E3D52C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E3D728(uint64_t a1)
{
  unint64_t v2 = sub_253E3D914();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E3D764(uint64_t a1)
{
  unint64_t v2 = sub_253E3D914();

  return MEMORY[0x270FA00B8](a1, v2);
}

void StructuredContext.SiriRequestContext.User.encode(to:)()
{
  sub_253E45CF0();
  uint64_t v3 = v2;
  uint64_t v4 = sub_253E390C4(&qword_269D974E0);
  sub_253E3B950();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  sub_253E45DFC();
  sub_253E39108(v3, v3[3]);
  sub_253E3D914();
  sub_253E82860();
  sub_253E826B0();
  if (!v0)
  {
    sub_253E826C0();
    sub_253E3D960();
    sub_253E826F0();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_253E460A0();
  sub_253E45D2C();
}

unint64_t sub_253E3D914()
{
  unint64_t result = qword_269D974E8;
  if (!qword_269D974E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D974E8);
  }
  return result;
}

unint64_t sub_253E3D960()
{
  unint64_t result = qword_269D974F0;
  if (!qword_269D974F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D974F0);
  }
  return result;
}

void StructuredContext.SiriRequestContext.User.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11, char a12)
{
  sub_253E45CF0();
  int v14 = v13;
  uint64_t v16 = v15;
  sub_253E390C4(&qword_269D974F8);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E45F88();
  sub_253E39108(v14, v14[3]);
  sub_253E3D914();
  sub_253E461B0();
  sub_253E82850();
  if (!v12)
  {
    uint64_t v17 = sub_253E45E14();
    uint64_t v19 = v18;
    sub_253E460BC();
    char v21 = sub_253E825F0();
    sub_253E3DB64();
    sub_253E82620();
    sub_253E45CE4();
    v20();
    *(void *)uint64_t v16 = v17;
    *(void *)(v16 + 8) = v19;
    *(unsigned char *)(v16 + 16) = v21;
    *(unsigned char *)(v16 + 17) = a12;
  }
  sub_253E393E4((uint64_t)v14);
  swift_bridgeObjectRelease();
  sub_253E46150();
  sub_253E45D2C();
}

unint64_t sub_253E3DB64()
{
  unint64_t result = qword_269D97500;
  if (!qword_269D97500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97500);
  }
  return result;
}

void sub_253E3DBB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  StructuredContext.SiriRequestContext.User.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, vars8[4], vars8[5]);
}

void sub_253E3DBC8()
{
}

uint64_t StructuredContext.SiriRequestContext.MeCard.givenName.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.givenName.setter()
{
  uint64_t result = sub_253E46000();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.givenName.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.middleName.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.middleName.setter()
{
  uint64_t result = sub_253E46194();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.middleName.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.familyName.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.familyName.setter()
{
  uint64_t result = sub_253E46178();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.familyName.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.nickName.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.nickName.setter()
{
  uint64_t result = sub_253E4615C();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.nickName.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.fullName.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.fullName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.fullName.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.addresses.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.addresses.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.label.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.label.setter()
{
  uint64_t result = sub_253E46000();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.label.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.street.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.street.setter()
{
  uint64_t result = sub_253E46194();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.street.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.city.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.city.setter()
{
  uint64_t result = sub_253E46178();
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.city.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.state.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.state.setter()
{
  uint64_t result = sub_253E4615C();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.state.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.postalCode.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.postalCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.postalCode.modify())()
{
  return nullsub_1;
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.countryCode.getter()
{
  return sub_253E39ECC();
}

uint64_t StructuredContext.SiriRequestContext.MeCard.Address.countryCode.setter()
{
  sub_253E3B9B0();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = v2;
  *(void *)(v1 + 88) = v0;
  return result;
}

uint64_t (*StructuredContext.SiriRequestContext.MeCard.Address.countryCode.modify())()
{
  return nullsub_1;
}

__n128 StructuredContext.SiriRequestContext.MeCard.Address.init(label:street:city:state:postalCode:countryCode:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11, unint64_t a12)
{
  __n128 result = a10;
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u64[0] = a7;
  a9[3].n128_u64[1] = a8;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  a9[5].n128_u64[1] = a12;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.MeCard.Address.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v9 = a1[7];
  uint64_t v10 = a1[8];
  uint64_t v12 = a1[9];
  uint64_t v11 = a1[10];
  uint64_t v13 = a1[11];
  uint64_t v14 = a2[1];
  uint64_t v15 = a2[2];
  uint64_t v17 = a2[3];
  uint64_t v16 = a2[4];
  uint64_t v18 = a2[5];
  uint64_t v19 = a2[6];
  uint64_t v21 = a2[7];
  uint64_t v20 = a2[8];
  uint64_t v23 = a2[9];
  uint64_t v22 = a2[10];
  uint64_t v24 = a2[11];
  if (!v3)
  {
    if (v14) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v14) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v14) {
    goto LABEL_10;
  }
  uint64_t v58 = a2[9];
  uint64_t v60 = a2[4];
  uint64_t v54 = a1[8];
  uint64_t v56 = a1[9];
  uint64_t v52 = a2[11];
  uint64_t v53 = a2[10];
  uint64_t v50 = a2[2];
  uint64_t v51 = a1[11];
  uint64_t v26 = a1[10];
  uint64_t v27 = a2[8];
  uint64_t v28 = a1[6];
  uint64_t v29 = a1[7];
  uint64_t v30 = a2[7];
  uint64_t v31 = a2[6];
  uint64_t v62 = a2[5];
  uint64_t v64 = a1[4];
  uint64_t v32 = a1[5];
  uint64_t v33 = a1[2];
  char v34 = sub_253E82780();
  uint64_t v4 = v33;
  uint64_t v16 = v60;
  uint64_t v18 = v62;
  uint64_t v8 = v32;
  uint64_t v5 = v64;
  uint64_t v19 = v31;
  uint64_t v21 = v30;
  uint64_t v9 = v29;
  uint64_t v7 = v28;
  uint64_t v20 = v27;
  uint64_t v11 = v26;
  uint64_t v15 = v50;
  uint64_t v13 = v51;
  uint64_t v24 = v52;
  uint64_t v22 = v53;
  uint64_t v10 = v54;
  uint64_t v12 = v56;
  uint64_t v23 = v58;
  char v35 = v34;
  uint64_t result = 0;
  if (v35)
  {
LABEL_10:
    if (v6)
    {
      if (!v17) {
        return 0;
      }
      if (v4 != v15 || v6 != v17)
      {
        uint64_t v59 = v21;
        uint64_t v61 = v16;
        uint64_t v55 = v7;
        uint64_t v57 = v11;
        uint64_t v38 = v20;
        uint64_t v39 = v9;
        uint64_t v63 = v18;
        uint64_t v65 = v5;
        uint64_t v40 = v8;
        char v41 = sub_253E82780();
        uint64_t v16 = v61;
        uint64_t v18 = v63;
        uint64_t v8 = v40;
        uint64_t v5 = v65;
        uint64_t v11 = v57;
        uint64_t v21 = v59;
        uint64_t v9 = v39;
        uint64_t v7 = v55;
        uint64_t v20 = v38;
        char v42 = v41;
        uint64_t result = 0;
        if ((v42 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v17)
    {
      return 0;
    }
    if (v8)
    {
      if (!v18) {
        return 0;
      }
      if (v5 != v16 || v8 != v18)
      {
        sub_253E82780();
        uint64_t result = sub_253E3B96C();
        if ((v44 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v18)
    {
      return 0;
    }
    if (v9)
    {
      if (!v21) {
        return 0;
      }
      if (v7 != v19 || v9 != v21)
      {
        sub_253E82780();
        uint64_t result = sub_253E3B96C();
        if ((v46 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v21)
    {
      return 0;
    }
    if (v12)
    {
      if (!v23) {
        return 0;
      }
      if (v10 != v20 || v12 != v23)
      {
        sub_253E82780();
        uint64_t result = sub_253E3B96C();
        if ((v48 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v23)
    {
      return 0;
    }
    if (v13)
    {
      if (v24)
      {
        BOOL v49 = v11 == v22 && v13 == v24;
        if (v49 || (sub_253E82780() & 1) != 0) {
          return 1;
        }
      }
    }
    else if (!v24)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_253E3E45C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x746565727473 && a2 == 0xE600000000000000;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 2037672291 && a2 == 0xE400000000000000;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6F436C6174736F70 && a2 == 0xEA00000000006564;
          if (v9 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_253E82780();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_253E3E6C8(char a1)
{
  uint64_t result = 0x6C6562616CLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x746565727473;
      break;
    case 2:
      uint64_t result = 2037672291;
      break;
    case 3:
      uint64_t result = 0x6574617473;
      break;
    case 4:
      uint64_t result = 0x6F436C6174736F70;
      break;
    case 5:
      uint64_t result = 0x437972746E756F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E3E788()
{
  return sub_253E3E6C8(*v0);
}

uint64_t sub_253E3E790@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E3E45C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E3E7B8(uint64_t a1)
{
  unint64_t v2 = sub_253E3E9F8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E3E7F4(uint64_t a1)
{
  unint64_t v2 = sub_253E3E9F8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void StructuredContext.SiriRequestContext.MeCard.Address.encode(to:)()
{
  sub_253E45CF0();
  uint64_t v3 = v2;
  uint64_t v4 = sub_253E390C4(&qword_269D97508);
  sub_253E3B950();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  sub_253E45DFC();
  sub_253E39108(v3, v3[3]);
  sub_253E3E9F8();
  sub_253E46210();
  sub_253E826B0();
  if (!v0)
  {
    sub_253E460AC();
    sub_253E45EFC();
    sub_253E45EFC();
    sub_253E45EFC();
    sub_253E45EFC();
    sub_253E461D8();
    sub_253E45EFC();
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_253E460A0();
  sub_253E45D2C();
}

unint64_t sub_253E3E9F8()
{
  unint64_t result = qword_269D97510;
  if (!qword_269D97510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97510);
  }
  return result;
}

void StructuredContext.SiriRequestContext.MeCard.Address.init(from:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_253E390C4(&qword_269D97518);
  sub_253E3B950();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388]();
  sub_253E46108();
  uint64_t v10 = v9 - v8;
  sub_253E39108(v2, v2[3]);
  sub_253E3E9F8();
  sub_253E82850();
  if (!v0)
  {
    uint64_t v11 = sub_253E45EE0();
    uint64_t v13 = v12;
    sub_253E460BC();
    uint64_t v33 = sub_253E45EE0();
    uint64_t v34 = v14;
    uint64_t v35 = v13;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_253E45EE0();
    uint64_t v17 = v16;
    uint64_t v31 = v15;
    uint64_t v32 = v4;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_253E45EE0();
    uint64_t v20 = v19;
    uint64_t v29 = v18;
    uint64_t v30 = v11;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_253E45EE0();
    uint64_t v23 = v22;
    uint64_t v28 = v21;
    sub_253E461D8();
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_253E45EE0();
    uint64_t v26 = v25;
    uint64_t v27 = v24;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v32 = v30;
    v32[1] = v35;
    v32[2] = v33;
    v32[3] = v34;
    v32[4] = v31;
    v32[5] = v17;
    v32[6] = v29;
    v32[7] = v20;
    v32[8] = v28;
    v32[9] = v23;
    v32[10] = v27;
    v32[11] = v26;
  }
  sub_253E393E4((uint64_t)v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_253E46150();
  sub_253E45D2C();
}

void sub_253E3EDA4()
{
}

void sub_253E3EDBC()
{
}

__n128 StructuredContext.SiriRequestContext.MeCard.init(givenName:middleName:familyName:nickName:fullName:addresses:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, __n128 *a9@<X8>, __n128 a10, unint64_t a11)
{
  __n128 result = a10;
  a9->n128_u64[0] = a1;
  a9->n128_u64[1] = a2;
  a9[1].n128_u64[0] = a3;
  a9[1].n128_u64[1] = a4;
  a9[2].n128_u64[0] = a5;
  a9[2].n128_u64[1] = a6;
  a9[3].n128_u64[0] = a7;
  a9[3].n128_u64[1] = a8;
  a9[4] = a10;
  a9[5].n128_u64[0] = a11;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.MeCard.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v7 = a1[6];
  uint64_t v10 = a1[7];
  uint64_t v9 = a1[8];
  uint64_t v12 = a1[9];
  uint64_t v11 = a1[10];
  uint64_t v13 = a2[1];
  uint64_t v14 = a2[2];
  uint64_t v16 = a2[3];
  uint64_t v15 = a2[4];
  uint64_t v18 = a2[5];
  uint64_t v17 = a2[6];
  uint64_t v19 = a2[7];
  uint64_t v20 = a2[8];
  uint64_t v21 = a2[9];
  uint64_t v22 = a2[10];
  if (v3)
  {
    if (!v13) {
      return 0;
    }
    if (*a1 != *a2 || v3 != v13)
    {
      uint64_t v55 = a2[2];
      uint64_t v56 = a1[2];
      uint64_t v63 = a2[8];
      uint64_t v65 = a1[7];
      uint64_t v59 = a1[8];
      uint64_t v61 = a2[9];
      uint64_t v57 = a2[10];
      uint64_t v58 = a1[9];
      uint64_t v24 = a1[10];
      uint64_t v25 = a1[6];
      uint64_t v26 = a2[7];
      uint64_t v27 = a2[6];
      uint64_t v28 = a1[5];
      uint64_t v29 = a1[4];
      uint64_t v30 = a2[5];
      uint64_t v31 = a2[4];
      char v32 = sub_253E82780();
      uint64_t v14 = v55;
      uint64_t v4 = v56;
      uint64_t v15 = v31;
      uint64_t v18 = v30;
      uint64_t v5 = v29;
      uint64_t v8 = v28;
      uint64_t v17 = v27;
      uint64_t v19 = v26;
      uint64_t v7 = v25;
      uint64_t v11 = v24;
      uint64_t v22 = v57;
      uint64_t v12 = v58;
      uint64_t v9 = v59;
      uint64_t v21 = v61;
      uint64_t v20 = v63;
      uint64_t v10 = v65;
      if ((v32 & 1) == 0) {
        return 0;
      }
    }
  }
  else if (v13)
  {
    return 0;
  }
  if (v6)
  {
    if (!v16) {
      return 0;
    }
    if (v4 != v14 || v6 != v16)
    {
      uint64_t v64 = v11;
      uint64_t v66 = v8;
      uint64_t v34 = v7;
      uint64_t v60 = v19;
      uint64_t v62 = v18;
      uint64_t v35 = v17;
      uint64_t v36 = v5;
      uint64_t v37 = v15;
      char v38 = sub_253E82780();
      uint64_t v15 = v37;
      uint64_t v19 = v60;
      uint64_t v18 = v62;
      uint64_t v5 = v36;
      uint64_t v11 = v64;
      uint64_t v8 = v66;
      uint64_t v17 = v35;
      uint64_t v7 = v34;
      if ((v38 & 1) == 0) {
        return 0;
      }
    }
  }
  else if (v16)
  {
    return 0;
  }
  if (v8)
  {
    if (!v18) {
      return 0;
    }
    if (v5 != v15 || v8 != v18)
    {
      uint64_t v40 = v10;
      uint64_t v41 = v20;
      uint64_t v42 = v11;
      uint64_t v43 = v7;
      uint64_t v44 = v19;
      uint64_t v45 = v17;
      char v46 = sub_253E82780();
      uint64_t v17 = v45;
      uint64_t v19 = v44;
      uint64_t v7 = v43;
      uint64_t v11 = v42;
      uint64_t v20 = v41;
      uint64_t v10 = v40;
      if ((v46 & 1) == 0) {
        return 0;
      }
    }
  }
  else if (v18)
  {
    return 0;
  }
  if (v10)
  {
    if (!v19) {
      return 0;
    }
    if (v7 != v17 || v10 != v19)
    {
      uint64_t v48 = v20;
      uint64_t v49 = v11;
      char v50 = sub_253E82780();
      uint64_t v11 = v49;
      uint64_t v20 = v48;
      if ((v50 & 1) == 0) {
        return 0;
      }
    }
  }
  else if (v19)
  {
    return 0;
  }
  if (v12)
  {
    if (v21)
    {
      if (v9 == v20 && v12 == v21) {
        goto LABEL_44;
      }
      uint64_t v52 = v11;
      char v53 = sub_253E82780();
      uint64_t v11 = v52;
      if (v53) {
        goto LABEL_44;
      }
    }
    return 0;
  }
  if (v21) {
    return 0;
  }
LABEL_44:

  return sub_253E3A6B4(v11, v22);
}

uint64_t sub_253E3F08C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6D614E6E65766967 && a2 == 0xE900000000000065;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x614E656C6464696DLL && a2 == 0xEA0000000000656DLL;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x614E796C696D6166 && a2 == 0xEA0000000000656DLL;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x656D614E6B63696ELL && a2 == 0xE800000000000000;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x656D614E6C6C7566 && a2 == 0xE800000000000000;
          if (v9 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6573736572646461 && a2 == 0xE900000000000073)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_253E82780();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_253E3F31C(char a1)
{
  uint64_t result = 0x6D614E6E65766967;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x656C6464696DLL;
      return v3 & 0xFFFFFFFFFFFFLL | 0x614E000000000000;
    case 2:
      uint64_t v3 = 0x796C696D6166;
      return v3 & 0xFFFFFFFFFFFFLL | 0x614E000000000000;
    case 3:
      unsigned int v4 = 1801677166;
      goto LABEL_7;
    case 4:
      unsigned int v4 = 1819047270;
LABEL_7:
      uint64_t result = v4 | 0x656D614E00000000;
      break;
    case 5:
      uint64_t result = 0x6573736572646461;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E3F3E0()
{
  return sub_253E3F31C(*v0);
}

uint64_t sub_253E3F3E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E3F08C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E3F410(uint64_t a1)
{
  unint64_t v2 = sub_253E3F6A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E3F44C(uint64_t a1)
{
  unint64_t v2 = sub_253E3F6A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void StructuredContext.SiriRequestContext.MeCard.encode(to:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  sub_253E390C4(&qword_269D97520);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E45DFC();
  sub_253E39108(v2, v2[3]);
  sub_253E3F6A8();
  sub_253E82860();
  sub_253E826B0();
  if (!v0)
  {
    sub_253E460AC();
    sub_253E45EFC();
    sub_253E45EFC();
    sub_253E45EFC();
    sub_253E45EFC();
    sub_253E461D8();
    sub_253E390C4(&qword_269D97530);
    sub_253E3FB30(&qword_269D97538, (void (*)(void))sub_253E3F6F4);
    sub_253E82750();
  }
  uint64_t v3 = sub_253E461C0();
  v4(v3);
  sub_253E460A0();
  sub_253E45D2C();
}

unint64_t sub_253E3F6A8()
{
  unint64_t result = qword_269D97528;
  if (!qword_269D97528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97528);
  }
  return result;
}

unint64_t sub_253E3F6F4()
{
  unint64_t result = qword_269D97540;
  if (!qword_269D97540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97540);
  }
  return result;
}

void StructuredContext.SiriRequestContext.MeCard.init(from:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  unsigned int v4 = v3;
  sub_253E390C4(&qword_269D97548);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E45F88();
  sub_253E39108(v2, v2[3]);
  sub_253E3F6A8();
  sub_253E461B0();
  sub_253E82850();
  if (v0)
  {
    sub_253E462B8();
    sub_253E393E4((uint64_t)v2);
  }
  else
  {
    uint64_t v5 = sub_253E45E14();
    uint64_t v7 = v6;
    sub_253E460BC();
    uint64_t v26 = sub_253E45E14();
    uint64_t v27 = v7;
    uint64_t v9 = v8;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_253E45E14();
    uint64_t v24 = v4;
    uint64_t v25 = v9;
    uint64_t v11 = v10;
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_253E45E14();
    uint64_t v14 = v13;
    uint64_t v21 = v12;
    uint64_t v22 = v5;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_253E45E14();
    uint64_t v17 = v16;
    uint64_t v20 = v15;
    sub_253E390C4(&qword_269D97530);
    sub_253E461D8();
    sub_253E3FB30(&qword_269D97550, (void (*)(void))sub_253E3FBA0);
    swift_bridgeObjectRetain();
    sub_253E82680();
    uint64_t v18 = sub_253E45D44();
    v19(v18);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v24 = v22;
    v24[1] = v27;
    v24[2] = v26;
    v24[3] = v25;
    v24[4] = v23;
    v24[5] = v11;
    v24[6] = v21;
    v24[7] = v14;
    v24[8] = v20;
    v24[9] = v17;
    v24[10] = v28;
    sub_253E393E4((uint64_t)v2);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_253E46150();
  sub_253E45D2C();
}

uint64_t sub_253E3FB30(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_253E3AE54(&qword_269D97530);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_253E3FBA0()
{
  unint64_t result = qword_269D97558;
  if (!qword_269D97558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97558);
  }
  return result;
}

void sub_253E3FBEC()
{
}

void sub_253E3FC04()
{
}

unint64_t StructuredContext.SiriRequestContext.DeviceIdiom.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = 11;
  if (result < 0xB) {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

uint64_t StructuredContext.SiriRequestContext.DeviceIdiom.rawValue.getter()
{
  return *v0;
}

unint64_t sub_253E3FC3C@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return StructuredContext.SiriRequestContext.DeviceIdiom.init(rawValue:)(*a1, a2);
}

uint64_t sub_253E3FC44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = StructuredContext.SiriRequestContext.DeviceIdiom.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_253E3FC6C()
{
  return sub_253E82400();
}

uint64_t sub_253E3FCCC()
{
  return sub_253E823D0();
}

__n128 StructuredContext.SiriRequestContext.init(sessionID:requestID:inputOrigin:responseMode:isEyesFree:isMultiUser:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:deviceRestrictions:bargeInModes:identifiedUser:encodedLocation:countryCode:siriLocale:contentRestrictions:uiScale:temperatureUnit:allowUserGeneratedContent:censorSpeech:meCard:deviceIdiom:didPSCFire:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, long long a14, long long a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,__int16 a23,uint64_t a24,char *a25,char a26)
{
  __int16 v26 = *(_WORD *)(a13 + 16);
  int v27 = *(_DWORD *)(a18 + 32);
  char v28 = *(unsigned char *)(a18 + 36);
  uint64_t v29 = *(void *)(a24 + 80);
  char v30 = *a25;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(unsigned char *)(a9 + 64) = a10;
  *(_DWORD *)(a9 + 65) = *(_DWORD *)((char *)&a10 + 1);
  *(void *)(a9 + 72) = a11;
  *(void *)(a9 + 80) = a12;
  *(_OWORD *)(a9 + 88) = *(_OWORD *)a13;
  *(_WORD *)(a9 + 104) = v26;
  *(_OWORD *)(a9 + 112) = a14;
  *(_OWORD *)(a9 + 128) = a15;
  *(void *)(a9 + 144) = a16;
  *(void *)(a9 + 152) = a17;
  long long v31 = *(_OWORD *)(a18 + 16);
  *(_OWORD *)(a9 + 160) = *(_OWORD *)a18;
  *(_OWORD *)(a9 + 176) = v31;
  *(unsigned char *)(a9 + 196) = v28;
  *(_DWORD *)(a9 + 192) = v27;
  *(void *)(a9 + 200) = a19;
  *(unsigned char *)(a9 + 208) = a20 & 1;
  *(void *)(a9 + 216) = a21;
  *(void *)(a9 + 224) = a22;
  *(_WORD *)(a9 + 232) = a23;
  long long v32 = *(_OWORD *)(a24 + 16);
  *(_OWORD *)(a9 + 240) = *(_OWORD *)a24;
  *(_OWORD *)(a9 + 256) = v32;
  long long v33 = *(_OWORD *)(a24 + 48);
  *(_OWORD *)(a9 + 272) = *(_OWORD *)(a24 + 32);
  *(_OWORD *)(a9 + 288) = v33;
  __n128 result = *(__n128 *)(a24 + 64);
  *(__n128 *)(a9 + 304) = result;
  *(void *)(a9 + 320) = v29;
  *(unsigned char *)(a9 + 328) = v30;
  *(unsigned char *)(a9 + 329) = a26;
  return result;
}

uint64_t static StructuredContext.SiriRequestContext.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v208 = *(void *)(a1 + 16);
  uint64_t v212 = *(void *)(a1 + 24);
  uint64_t v203 = *(void *)(a1 + 32);
  uint64_t v210 = *(void *)(a1 + 40);
  uint64_t v200 = *(void *)(a1 + 48);
  uint64_t v204 = *(void *)(a1 + 56);
  int v198 = *(unsigned __int8 *)(a1 + 64);
  int v195 = *(unsigned __int8 *)(a1 + 65);
  int v194 = *(unsigned __int8 *)(a1 + 66);
  int v192 = *(unsigned __int8 *)(a1 + 67);
  int v189 = *(unsigned __int8 *)(a1 + 68);
  v188 = *(void **)(a1 + 72);
  v186 = *(void **)(a1 + 80);
  uint64_t v182 = *(void *)(a1 + 88);
  uint64_t v184 = *(void *)(a1 + 96);
  __int16 v181 = *(_WORD *)(a1 + 104);
  uint64_t v176 = *(void *)(a1 + 112);
  unint64_t v180 = *(void *)(a1 + 120);
  uint64_t v170 = *(void *)(a1 + 128);
  uint64_t v174 = *(void *)(a1 + 136);
  uint64_t v166 = *(void *)(a1 + 144);
  uint64_t v172 = *(void *)(a1 + 152);
  uint64_t v163 = *(void *)(a1 + 168);
  uint64_t v164 = *(void *)(a1 + 160);
  uint64_t v168 = *(void *)(a1 + 176);
  uint64_t v161 = *(unsigned __int8 *)(a1 + 196);
  uint64_t v162 = *(void *)(a1 + 184);
  uint64_t v160 = *(unsigned int *)(a1 + 192);
  double v4 = *(double *)(a1 + 200);
  double v5 = *(double *)(a2 + 200);
  char v154 = *(unsigned char *)(a1 + 208);
  uint64_t v148 = *(void *)(a1 + 216);
  uint64_t v152 = *(void *)(a1 + 224);
  int v150 = *(unsigned __int8 *)(a1 + 232);
  uint64_t v6 = *(void *)(a1 + 240);
  unint64_t v7 = *(void *)(a1 + 248);
  uint64_t v8 = *(void *)(a1 + 256);
  uint64_t v9 = *(void *)(a1 + 272);
  unint64_t v144 = *(void *)(a1 + 280);
  unint64_t v145 = *(void *)(a1 + 264);
  uint64_t v10 = *(void *)(a1 + 288);
  unint64_t v143 = *(void *)(a1 + 296);
  uint64_t v12 = *(void *)(a1 + 304);
  uint64_t v11 = *(void *)(a1 + 312);
  unint64_t v13 = *(void *)(a1 + 320);
  int v14 = *(unsigned __int8 *)(a1 + 328);
  int v15 = *(unsigned __int8 *)(a1 + 329);
  uint64_t v16 = *(void *)(a2 + 8);
  uint64_t v206 = *(void *)(a2 + 16);
  uint64_t v17 = *(void *)(a2 + 24);
  uint64_t v202 = *(void *)(a2 + 32);
  uint64_t v205 = *(void *)(a2 + 40);
  uint64_t v199 = *(void *)(a2 + 48);
  uint64_t v201 = *(void *)(a2 + 56);
  int v197 = *(unsigned __int8 *)(a2 + 64);
  int v196 = *(unsigned __int8 *)(a2 + 65);
  int v193 = *(unsigned __int8 *)(a2 + 66);
  int v191 = *(unsigned __int8 *)(a2 + 67);
  int v190 = *(unsigned __int8 *)(a2 + 68);
  v187 = *(void **)(a2 + 72);
  v185 = *(void **)(a2 + 80);
  uint64_t v178 = *(void *)(a2 + 88);
  uint64_t v183 = *(void *)(a2 + 96);
  __int16 v179 = *(_WORD *)(a2 + 104);
  uint64_t v175 = *(void *)(a2 + 112);
  unint64_t v177 = *(void *)(a2 + 120);
  uint64_t v169 = *(void *)(a2 + 128);
  uint64_t v173 = *(void *)(a2 + 136);
  uint64_t v165 = *(void *)(a2 + 144);
  uint64_t v171 = *(void *)(a2 + 152);
  uint64_t v155 = *(void *)(a2 + 160);
  uint64_t v156 = *(void *)(a2 + 168);
  uint64_t v167 = *(void *)(a2 + 176);
  uint64_t v157 = *(void *)(a2 + 184);
  uint64_t v159 = *(unsigned __int8 *)(a2 + 196);
  uint64_t v158 = *(unsigned int *)(a2 + 192);
  int v153 = *(unsigned __int8 *)(a2 + 208);
  uint64_t v147 = *(void *)(a2 + 216);
  uint64_t v151 = *(void *)(a2 + 224);
  int v149 = *(unsigned __int8 *)(a2 + 232);
  int v146 = *(unsigned __int8 *)(a2 + 233);
  uint64_t v19 = *(void *)(a2 + 272);
  uint64_t v18 = *(void *)(a2 + 280);
  uint64_t v21 = *(void *)(a2 + 288);
  uint64_t v20 = *(void *)(a2 + 296);
  int v22 = *(unsigned __int8 *)(a2 + 328);
  int v23 = *(unsigned __int8 *)(a2 + 329);
  if (!v3)
  {
    HIDWORD(v142) = *(unsigned __int8 *)(a1 + 233);
    uint64_t v128 = *(void *)(a2 + 240);
    uint64_t v130 = *(void *)(a2 + 248);
    uint64_t v138 = *(void *)(a2 + 264);
    uint64_t v140 = *(void *)(a2 + 320);
    uint64_t v132 = *(void *)(a2 + 312);
    uint64_t v134 = *(void *)(a2 + 304);
    uint64_t v136 = *(void *)(a2 + 256);
    if (v16) {
      return 0;
    }
    goto LABEL_10;
  }
  if (!v16) {
    return 0;
  }
  HIDWORD(v142) = *(unsigned __int8 *)(a1 + 233);
  uint64_t v128 = *(void *)(a2 + 240);
  uint64_t v130 = *(void *)(a2 + 248);
  uint64_t v138 = *(void *)(a2 + 264);
  uint64_t v140 = *(void *)(a2 + 320);
  uint64_t v132 = *(void *)(a2 + 312);
  uint64_t v134 = *(void *)(a2 + 304);
  uint64_t v136 = *(void *)(a2 + 256);
  if (*(void *)a1 == *(void *)a2 && v3 == v16) {
    goto LABEL_10;
  }
  uint64_t v110 = *(void *)(a1 + 272);
  unint64_t v111 = *(void *)(a1 + 248);
  int v122 = *(unsigned __int8 *)(a2 + 328);
  uint64_t v25 = *(void *)(a1 + 312);
  unint64_t v116 = *(void *)(a1 + 320);
  int v26 = *(unsigned __int8 *)(a1 + 329);
  int v27 = *(unsigned __int8 *)(a1 + 328);
  uint64_t v28 = *(void *)(a1 + 288);
  uint64_t v29 = *(void *)(a1 + 256);
  uint64_t v30 = *(void *)(a1 + 304);
  int v31 = *(unsigned __int8 *)(a2 + 329);
  uint64_t v105 = *(void *)(a1 + 240);
  uint64_t v106 = *(void *)(a2 + 288);
  uint64_t v32 = *(void *)(a2 + 296);
  uint64_t v33 = *(void *)(a2 + 280);
  char v34 = sub_253E82780();
  int v22 = v122;
  uint64_t v18 = v33;
  uint64_t v6 = v105;
  uint64_t v21 = v106;
  uint64_t v20 = v32;
  int v23 = v31;
  uint64_t v12 = v30;
  uint64_t v8 = v29;
  uint64_t v9 = v110;
  unint64_t v7 = v111;
  uint64_t v10 = v28;
  int v14 = v27;
  int v15 = v26;
  unint64_t v13 = v116;
  uint64_t v11 = v25;
  char v35 = v34;
  uint64_t result = 0;
  if (v35)
  {
LABEL_10:
    if (v212)
    {
      if (!v17) {
        return 0;
      }
      if (v208 != v206 || v212 != v17)
      {
        uint64_t v110 = v9;
        unint64_t v112 = v7;
        int v123 = v22;
        uint64_t v38 = v11;
        unint64_t v117 = v13;
        int v39 = v15;
        int v40 = v14;
        uint64_t v41 = v10;
        uint64_t v42 = v8;
        uint64_t v43 = v12;
        int v44 = v23;
        uint64_t v45 = v6;
        uint64_t v46 = v20;
        uint64_t v107 = v21;
        uint64_t v47 = v18;
        char v48 = sub_253E82780();
        int v22 = v123;
        uint64_t v18 = v47;
        uint64_t v21 = v107;
        uint64_t v9 = v110;
        uint64_t v20 = v46;
        uint64_t v6 = v45;
        int v23 = v44;
        uint64_t v12 = v43;
        uint64_t v8 = v42;
        uint64_t v10 = v41;
        int v14 = v40;
        int v15 = v39;
        unint64_t v7 = v112;
        unint64_t v13 = v117;
        uint64_t v11 = v38;
        char v49 = v48;
        uint64_t result = 0;
        if ((v49 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v17)
    {
      return 0;
    }
    if (v210)
    {
      uint64_t result = v205;
      if (!v205) {
        return result;
      }
      if (v203 != v202 || v210 != v205)
      {
        uint64_t v110 = v9;
        unint64_t v113 = v7;
        int v124 = v22;
        uint64_t v213 = v11;
        unint64_t v118 = v13;
        int v51 = v15;
        int v52 = v14;
        uint64_t v53 = v10;
        uint64_t v54 = v8;
        uint64_t v55 = v12;
        int v56 = v23;
        uint64_t v57 = v6;
        uint64_t v58 = v20;
        uint64_t v59 = v21;
        uint64_t v60 = v18;
        char v61 = sub_253E82780();
        int v22 = v124;
        uint64_t v18 = v60;
        uint64_t v21 = v59;
        uint64_t v20 = v58;
        uint64_t v6 = v57;
        int v23 = v56;
        uint64_t v12 = v55;
        uint64_t v8 = v54;
        uint64_t v9 = v110;
        unint64_t v7 = v113;
        uint64_t v10 = v53;
        int v14 = v52;
        int v15 = v51;
        unint64_t v13 = v118;
        uint64_t v11 = v213;
        char v62 = v61;
        uint64_t result = 0;
        if ((v62 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v205)
    {
      return 0;
    }
    if (v204)
    {
      uint64_t result = v201;
      if (!v201) {
        return result;
      }
      if (v200 != v199 || v204 != v201)
      {
        uint64_t v110 = v9;
        unint64_t v114 = v7;
        int v125 = v22;
        uint64_t v214 = v11;
        unint64_t v119 = v13;
        int v64 = v15;
        int v65 = v14;
        uint64_t v66 = v10;
        uint64_t v67 = v8;
        uint64_t v68 = v12;
        int v69 = v23;
        uint64_t v70 = v6;
        uint64_t v71 = v20;
        uint64_t v72 = v21;
        uint64_t v73 = v18;
        char v74 = sub_253E82780();
        int v22 = v125;
        uint64_t v18 = v73;
        uint64_t v21 = v72;
        uint64_t v20 = v71;
        uint64_t v6 = v70;
        int v23 = v69;
        uint64_t v12 = v68;
        uint64_t v8 = v67;
        uint64_t v9 = v110;
        unint64_t v7 = v114;
        uint64_t v10 = v66;
        int v14 = v65;
        int v15 = v64;
        unint64_t v13 = v119;
        uint64_t v11 = v214;
        char v75 = v74;
        uint64_t result = 0;
        if ((v75 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v201)
    {
      return 0;
    }
    if (v198 == 2)
    {
      if (v197 != 2) {
        return 0;
      }
    }
    else
    {
      uint64_t result = 0;
      if (v197 == 2 || ((((v198 & 1) == 0) ^ v197) & 1) == 0) {
        return result;
      }
    }
    if (v195 == 2)
    {
      if (v196 != 2) {
        return 0;
      }
    }
    else
    {
      uint64_t result = 0;
      if (v196 == 2 || ((((v195 & 1) == 0) ^ v196) & 1) == 0) {
        return result;
      }
    }
    if (v194 == 2)
    {
      if (v193 != 2) {
        return 0;
      }
    }
    else
    {
      uint64_t result = 0;
      if (v193 == 2 || ((((v194 & 1) == 0) ^ v193) & 1) == 0) {
        return result;
      }
    }
    if (v192 == 2)
    {
      if (v191 != 2) {
        return 0;
      }
    }
    else
    {
      uint64_t result = 0;
      if (v191 == 2 || ((((v192 & 1) == 0) ^ v191) & 1) == 0) {
        return result;
      }
    }
    if (v189 == 2)
    {
      if (v190 != 2) {
        return 0;
      }
    }
    else
    {
      uint64_t result = 0;
      if (v190 == 2 || ((((v189 & 1) == 0) ^ v190) & 1) == 0) {
        return result;
      }
    }
    uint64_t v126 = v19;
    HIDWORD(v121) = v22;
    uint64_t v215 = v18;
    uint64_t v108 = v21;
    uint64_t v76 = v20;
    uint64_t v77 = v6;
    int v209 = v23;
    uint64_t v78 = v12;
    uint64_t v79 = v8;
    uint64_t v80 = v9;
    uint64_t v81 = v10;
    int v82 = v14;
    int v211 = v15;
    uint64_t v83 = v11;
    if ((sub_253E3A5E8(v188, v187) & 1) == 0 || (sub_253E3A5E8(v186, v185) & 1) == 0) {
      return 0;
    }
    uint64_t result = v184;
    if (v184 == 1)
    {
      uint64_t v91 = v183;
      if (v183 == 1) {
        goto LABEL_71;
      }
    }
    else
    {
      uint64_t v228 = v182;
      uint64_t v229 = v184;
      LOWORD(v230) = v181;
      if (v183 != 1)
      {
        uint64_t v217 = v178;
        uint64_t v218 = v183;
        LOWORD(v219) = v179;
        uint64_t result = static StructuredContext.SiriRequestContext.User.== infix(_:_:)((uint64_t)&v228, (uint64_t)&v217);
        if ((result & 1) == 0) {
          return 0;
        }
LABEL_71:
        unint64_t v115 = v7;
        unint64_t v120 = v13;
        if (v180 >> 60 == 15)
        {
          if (v177 >> 60 == 15) {
            goto LABEL_77;
          }
        }
        else if (v177 >> 60 != 15)
        {
          sub_253E3BDF0(v176, v180);
          sub_253E3BDF0(v175, v177);
          char v207 = MEMORY[0x25A270BD0](v176, v180, v175, v177);
          sub_253E3BE90(v175, v177);
          uint64_t result = sub_253E3BE90(v176, v180);
          if ((v207 & 1) == 0) {
            return 0;
          }
LABEL_77:
          if (v174)
          {
            if (!v173) {
              return 0;
            }
            if (v170 != v169 || v174 != v173)
            {
              sub_253E82780();
              uint64_t result = sub_253E3B96C();
              if ((v94 & 1) == 0) {
                return result;
              }
            }
          }
          else if (v173)
          {
            return 0;
          }
          if (v172)
          {
            if (!v171) {
              return 0;
            }
            if (v166 != v165 || v172 != v171)
            {
              sub_253E82780();
              uint64_t result = sub_253E3B96C();
              if ((v96 & 1) == 0) {
                return result;
              }
            }
          }
          else if (v171)
          {
            return 0;
          }
          if (v168 == 1)
          {
            if (v167 == 1) {
              goto LABEL_102;
            }
          }
          else
          {
            uint64_t v228 = v164;
            uint64_t v229 = v163;
            uint64_t v230 = v168;
            uint64_t v231 = v162;
            int v232 = v160;
            char v233 = (v160 | (unint64_t)(v161 << 32)) >> 32;
            if (v167 != 1)
            {
              LODWORD(v217) = v155;
              BYTE4(v217) = BYTE4(v155) & 1;
              uint64_t v218 = v156;
              uint64_t v219 = v167;
              LODWORD(v220) = v157;
              BYTE4(v220) = BYTE4(v157) & 1;
              LODWORD(v221) = v158;
              BYTE4(v221) = ((v158 | (unint64_t)(v159 << 32)) >> 32) & 1;
              uint64_t result = static StructuredContext.SiriRequestContext.ContentRestriction.== infix(_:_:)((uint64_t)&v228, (uint64_t)&v217);
              if ((result & 1) == 0) {
                return 0;
              }
LABEL_102:
              if (v154)
              {
                if (!v153) {
                  return 0;
                }
              }
              else
              {
                char v97 = v153;
                if (v4 != v5) {
                  char v97 = 1;
                }
                if (v97) {
                  return 0;
                }
              }
              if (v152)
              {
                if (!v151) {
                  return 0;
                }
                if (v148 != v147 || v152 != v151)
                {
                  sub_253E82780();
                  uint64_t result = sub_253E3B96C();
                  if ((v99 & 1) == 0) {
                    return result;
                  }
                }
              }
              else if (v151)
              {
                return 0;
              }
              if (v150 == 2)
              {
                if (v149 != 2) {
                  return 0;
                }
              }
              else
              {
                uint64_t result = 0;
                if (v149 == 2 || ((((v150 & 1) == 0) ^ v149) & 1) == 0) {
                  return result;
                }
              }
              if (HIDWORD(v142) == 2)
              {
                unint64_t v100 = v13;
                if (v146 != 2) {
                  return 0;
                }
              }
              else
              {
                uint64_t result = 0;
                if (v146 == 2) {
                  return result;
                }
                unint64_t v100 = v13;
                if (((((v142 & 0x100000000) == 0) ^ v146) & 1) == 0) {
                  return result;
                }
              }
              if (v100)
              {
                sub_253E45D74(result, v84, v85, v86, v87, v88, v89, v90, v102, v103, v104, v105, v108, v110, v7, v13, v121, v19, v128,
                  v130,
                  v132,
                  v134,
                  v136,
                  v138,
                  v140,
                  v142,
                  v143,
                  v144,
                  v145);
                if (v140)
                {
                  uint64_t v217 = v128;
                  uint64_t v218 = v130;
                  uint64_t v219 = v136;
                  uint64_t v220 = v138;
                  uint64_t v221 = v126;
                  uint64_t v222 = v215;
                  uint64_t v223 = v108;
                  uint64_t v224 = v76;
                  uint64_t v225 = v134;
                  uint64_t v226 = v132;
                  uint64_t v227 = v140;
                  char v216 = static StructuredContext.SiriRequestContext.MeCard.== infix(_:_:)(&v228, &v217);
                  sub_253E3C268(v77, v115, v79, v145, v80, v144, v81, v143, v78, v83, v120);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v216 & 1) == 0) {
                    return 0;
                  }
                  goto LABEL_132;
                }
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                swift_bridgeObjectRetain();
                uint64_t result = swift_bridgeObjectRetain();
              }
              else if (!v140)
              {
LABEL_132:
                if (v82 == 11)
                {
                  if (HIDWORD(v121) != 11) {
                    return 0;
                  }
                }
                else if (HIDWORD(v121) == 11 || v82 != HIDWORD(v121))
                {
                  return 0;
                }
                if (v211 != 2) {
                  return v209 != 2 && ((((v211 & 1) == 0) ^ v209) & 1) != 0;
                }
                return v209 == 2;
              }
              sub_253E45D74(result, v84, v85, v86, v87, v88, v89, v90, v102, v103, v104, v105, v108, v110, v115, v120, v121, v126, v128,
                v130,
                v132,
                v134,
                v136,
                v138,
                v140,
                v142,
                v143,
                v144,
                v145);
              uint64_t v234 = v129;
              uint64_t v235 = v131;
              uint64_t v236 = v137;
              uint64_t v237 = v139;
              uint64_t v238 = v127;
              uint64_t v239 = v215;
              uint64_t v240 = v109;
              uint64_t v241 = v76;
              uint64_t v242 = v135;
              uint64_t v243 = v133;
              uint64_t v244 = v141;
              sub_253E3C268(v129, v131, v137, v139, v127, v215, v109, v76, v135, v133, v141);
              sub_253E40B7C((uint64_t)&v228);
              return 0;
            }
            swift_bridgeObjectRetain();
          }
          sub_253E3C044(v155, v156, v167);
          sub_253E3C0CC(v164, v163, v168);
          sub_253E3C0CC(v155, v156, v167);
          return 0;
        }
        sub_253E3BDF0(v176, v180);
        sub_253E3BDF0(v175, v177);
        sub_253E3BE90(v176, v180);
        sub_253E3BE90(v175, v177);
        return 0;
      }
      swift_bridgeObjectRetain();
      uint64_t v91 = 1;
    }
    uint64_t v92 = v91;
    sub_253E3BD3C(v178, v91);
    sub_253E3BD90(v182, v184);
    sub_253E3BD90(v178, v92);
    return 0;
  }
  return result;
}

uint64_t sub_253E40B7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  uint64_t v4 = *(void *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 112);
  uint64_t v6 = *(void *)(a1 + 120);
  uint64_t v7 = *(void *)(a1 + 128);
  uint64_t v8 = *(void *)(a1 + 136);
  uint64_t v9 = *(void *)(a1 + 144);
  long long v12 = *(_OWORD *)(a1 + 152);
  uint64_t v10 = *(void *)(a1 + 168);
  sub_253E3C380(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  sub_253E3C380(v2, v3, v4, v5, v6, v7, v8, v9, v12, *((uint64_t *)&v12 + 1), v10);
  return a1;
}

uint64_t sub_253E40C3C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x496E6F6973736573 && a2 == 0xE900000000000044;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4974736575716572 && a2 == 0xE900000000000044;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x69724F7475706E69 && a2 == 0xEB000000006E6967;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x65736E6F70736572 && a2 == 0xEC00000065646F4DLL;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x7246736579457369 && a2 == 0xEA00000000006565;
          if (v9 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x5569746C754D7369 && a2 == 0xEB00000000726573;
            if (v10 || (sub_253E82780() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0xD000000000000015 && a2 == 0x8000000253E83260 || (sub_253E82780() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0xD000000000000015 && a2 == 0x8000000253E83280 || (sub_253E82780() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else if (a1 == 0xD000000000000015 && a2 == 0x8000000253E832A0 || (sub_253E82780() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else if (a1 == 0xD000000000000012 && a2 == 0x8000000253E832C0 || (sub_253E82780() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 9;
            }
            else
            {
              BOOL v11 = a1 == 0x4D6E496567726162 && a2 == 0xEC0000007365646FLL;
              if (v11 || (sub_253E82780() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 10;
              }
              else
              {
                BOOL v12 = a1 == 0x696669746E656469 && a2 == 0xEE00726573556465;
                if (v12 || (sub_253E82780() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 11;
                }
                else
                {
                  BOOL v13 = a1 == 0x4C6465646F636E65 && a2 == 0xEF6E6F697461636FLL;
                  if (v13 || (sub_253E82780() & 1) != 0)
                  {
                    swift_bridgeObjectRelease();
                    return 12;
                  }
                  else
                  {
                    BOOL v14 = a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL;
                    if (v14 || (sub_253E82780() & 1) != 0)
                    {
                      swift_bridgeObjectRelease();
                      return 13;
                    }
                    else
                    {
                      BOOL v15 = a1 == 0x61636F4C69726973 && a2 == 0xEA0000000000656CLL;
                      if (v15 || (sub_253E82780() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 14;
                      }
                      else if (a1 == 0xD000000000000013 && a2 == 0x8000000253E832E0 || (sub_253E82780() & 1) != 0)
                      {
                        swift_bridgeObjectRelease();
                        return 15;
                      }
                      else
                      {
                        BOOL v16 = a1 == 0x656C6163536975 && a2 == 0xE700000000000000;
                        if (v16 || (sub_253E82780() & 1) != 0)
                        {
                          swift_bridgeObjectRelease();
                          return 16;
                        }
                        else
                        {
                          BOOL v17 = a1 == 0x74617265706D6574 && a2 == 0xEF74696E55657275;
                          if (v17 || (sub_253E82780() & 1) != 0)
                          {
                            swift_bridgeObjectRelease();
                            return 17;
                          }
                          else if (a1 == 0xD000000000000019 && a2 == 0x8000000253E83300 {
                                 || (sub_253E82780() & 1) != 0)
                          }
                          {
                            swift_bridgeObjectRelease();
                            return 18;
                          }
                          else
                          {
                            BOOL v18 = a1 == 0x7053726F736E6563 && a2 == 0xEC00000068636565;
                            if (v18 || (sub_253E82780() & 1) != 0)
                            {
                              swift_bridgeObjectRelease();
                              return 19;
                            }
                            else
                            {
                              BOOL v19 = a1 == 0x64726143656DLL && a2 == 0xE600000000000000;
                              if (v19 || (sub_253E82780() & 1) != 0)
                              {
                                swift_bridgeObjectRelease();
                                return 20;
                              }
                              else
                              {
                                BOOL v20 = a1 == 0x6449656369766564 && a2 == 0xEB000000006D6F69;
                                if (v20 || (sub_253E82780() & 1) != 0)
                                {
                                  swift_bridgeObjectRelease();
                                  return 21;
                                }
                                else if (a1 == 0x6946435350646964 && a2 == 0xEA00000000006572)
                                {
                                  swift_bridgeObjectRelease();
                                  return 22;
                                }
                                else
                                {
                                  char v22 = sub_253E82780();
                                  swift_bridgeObjectRelease();
                                  if (v22) {
                                    return 22;
                                  }
                                  else {
                                    return 23;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_253E41600()
{
  return 23;
}

unint64_t sub_253E41608(char a1)
{
  unint64_t result = 0x496E6F6973736573;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4974736575716572;
      break;
    case 2:
      unint64_t result = 0x69724F7475706E69;
      break;
    case 3:
      unint64_t result = 0x65736E6F70736572;
      break;
    case 4:
      unint64_t result = 0x7246736579457369;
      break;
    case 5:
      unint64_t result = 0x5569746C754D7369;
      break;
    case 6:
    case 7:
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    case 9:
      unint64_t result = 0xD000000000000012;
      break;
    case 10:
      unint64_t result = 0x4D6E496567726162;
      break;
    case 11:
      unint64_t result = 0x696669746E656469;
      break;
    case 12:
      unint64_t result = 0x4C6465646F636E65;
      break;
    case 13:
      unint64_t result = 0x437972746E756F63;
      break;
    case 14:
      unint64_t result = 0x61636F4C69726973;
      break;
    case 15:
      unint64_t result = 0xD000000000000013;
      break;
    case 16:
      unint64_t result = 0x656C6163536975;
      break;
    case 17:
      unint64_t result = 0x74617265706D6574;
      break;
    case 18:
      unint64_t result = 0xD000000000000019;
      break;
    case 19:
      unint64_t result = 0x7053726F736E6563;
      break;
    case 20:
      unint64_t result = 0x64726143656DLL;
      break;
    case 21:
      unint64_t result = 0x6449656369766564;
      break;
    case 22:
      unint64_t result = 0x6946435350646964;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E41910()
{
  return sub_253E38D40();
}

unint64_t sub_253E4192C()
{
  return sub_253E41608(*v0);
}

uint64_t sub_253E41934@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E40C3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E4195C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E41600();
  *a1 = result;
  return result;
}

uint64_t sub_253E41984(uint64_t a1)
{
  unint64_t v2 = sub_253E430A8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E419C0(uint64_t a1)
{
  unint64_t v2 = sub_253E430A8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void StructuredContext.SiriRequestContext.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_253E45CF0();
  a19 = v22;
  a20 = v23;
  uint64_t v52 = v21;
  uint64_t v25 = v24;
  uint64_t v26 = sub_253E390C4(&qword_269D97560);
  sub_253E3B950();
  uint64_t v28 = v27;
  MEMORY[0x270FA5388]();
  sub_253E46108();
  uint64_t v31 = v30 - v29;
  uint64_t v32 = *v20;
  v51[5] = v20[1];
  v51[6] = v32;
  uint64_t v33 = v20[2];
  v51[3] = v20[3];
  v51[4] = v33;
  uint64_t v34 = v20[4];
  v51[1] = v20[5];
  v51[2] = v34;
  v51[0] = v20[7];
  uint64_t v50 = v20[10];
  uint64_t v49 = v20[22];
  uint64_t v48 = v20[23];
  uint64_t v47 = *((unsigned __int8 *)v20 + 196);
  uint64_t v46 = *((unsigned int *)v20 + 48);
  uint64_t v45 = v20[32];
  uint64_t v44 = v20[33];
  uint64_t v43 = v20[34];
  uint64_t v42 = v20[35];
  uint64_t v41 = v20[36];
  uint64_t v40 = v20[37];
  uint64_t v39 = v20[38];
  uint64_t v38 = v20[39];
  uint64_t v37 = v20[40];
  char v35 = *((unsigned char *)v20 + 328);
  int v36 = *((unsigned __int8 *)v20 + 329);
  sub_253E39108(v25, v25[3]);
  sub_253E430A8();
  sub_253E82860();
  LOBYTE(v53) = 0;
  sub_253E826B0();
  if (v21)
  {
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v31, v26);
  }
  else
  {
    LODWORD(v52) = v36;
    sub_253E4601C(1);
    sub_253E46134();
    sub_253E4601C(2);
    sub_253E46134();
    sub_253E4601C(3);
    sub_253E46134();
    sub_253E45FA8(4);
    sub_253E45F6C();
    sub_253E45FA8(5);
    sub_253E45F6C();
    sub_253E45FA8(6);
    sub_253E45F6C();
    sub_253E45FA8(7);
    sub_253E45F6C();
    sub_253E45FA8(8);
    sub_253E45F6C();
    sub_253E390C4(&qword_269D97480);
    sub_253E3B28C(&qword_269D97488);
    sub_253E82750();
    uint64_t v53 = v50;
    sub_253E82750();
    sub_253E46264((uint64_t)&a14);
    sub_253E430F4();
    sub_253E45D08();
    sub_253E46264((uint64_t)&a12);
    sub_253E43140();
    sub_253E45D08();
    sub_253E4601C(13);
    sub_253E45FE0();
    sub_253E4601C(14);
    sub_253E45FE0();
    sub_253E46264((uint64_t)v57);
    uint64_t v54 = v49;
    uint64_t v55 = v48;
    LODWORD(v56) = v46;
    BYTE4(v56) = (v46 | (unint64_t)(v47 << 32)) >> 32;
    sub_253E4318C();
    sub_253E45D08();
    sub_253E4601C(16);
    sub_253E826D0();
    sub_253E4601C(17);
    sub_253E45FE0();
    sub_253E45FA8(18);
    sub_253E46084();
    sub_253E45FA8(19);
    sub_253E46084();
    sub_253E46264((uint64_t)v51);
    uint64_t v54 = v45;
    uint64_t v55 = v44;
    uint64_t v56 = v43;
    v57[0] = v42;
    v57[1] = v41;
    v57[2] = v40;
    v57[3] = v39;
    v57[4] = v38;
    v57[5] = v37;
    sub_253E431D8();
    sub_253E45D08();
    LOBYTE(v53) = v35;
    sub_253E43224();
    sub_253E45D08();
    sub_253E45FA8(22);
    sub_253E46084();
    (*(void (**)(void, uint64_t))(v28 + 8))(0, v26);
  }
  sub_253E460A0();
  sub_253E45D2C();
}

void StructuredContext.SiriRequestContext.init(from:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_253E390C4(&qword_269D97598);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E45F88();
  char v152 = 1;
  uint64_t v69 = (uint64_t)v2;
  sub_253E39108(v2, v2[3]);
  sub_253E430A8();
  sub_253E461B0();
  sub_253E82850();
  if (v0)
  {
    sub_253E45DB8();
    int v5 = 0;
    int v6 = 0;
    unint64_t v90 = 0xF000000000000000;
    uint64_t v81 = 1;
    uint64_t v93 = 1;
  }
  else
  {
    uint64_t v66 = v4;
    uint64_t v15 = sub_253E45CA4();
    unint64_t v17 = v16;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_253E45CA4();
    uint64_t v20 = v19;
    uint64_t v65 = v18;
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_253E45CA4();
    uint64_t v64 = v20;
    uint64_t v22 = v21;
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_253E45CA4();
    uint64_t v62 = v22;
    uint64_t v24 = v23;
    swift_bridgeObjectRetain();
    char v60 = sub_253E45CC4();
    char v59 = sub_253E45CC4();
    char v58 = sub_253E45CC4();
    char v56 = sub_253E45CC4();
    uint64_t v57 = v15;
    LOBYTE(v96) = 8;
    char v55 = sub_253E45CC4();
    sub_253E390C4(&qword_269D97480);
    sub_253E3B28C(&qword_269D97498);
    sub_253E460F0();
    sub_253E82680();
    LOBYTE(v95[0]) = 10;
    uint64_t v68 = v96;
    swift_bridgeObjectRetain();
    sub_253E460F0();
    sub_253E82680();
    LOBYTE(v95[0]) = 11;
    unint64_t v25 = sub_253E43270();
    uint64_t v67 = v96;
    swift_bridgeObjectRetain();
    sub_253E45FB4();
    if (v25)
    {
      uint64_t v26 = sub_253E45C20();
      v27(v26);
      swift_bridgeObjectRelease();
      sub_253E45E94();
      sub_253E45F28();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_253E45C70();
      sub_253E4604C();
    }
    else
    {
      uint64_t v93 = v97;
      uint64_t v94 = v96;
      __int16 v159 = v98;
      sub_253E3BD3C(v96, v97);
      sub_253E432BC();
      sub_253E45E6C();
      unint64_t v90 = v97;
      uint64_t v91 = v96;
      sub_253E3BDF0(v96, v97);
      uint64_t v54 = sub_253E45CA4();
      uint64_t v92 = v28;
      LOBYTE(v96) = 14;
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_253E45CA4();
      uint64_t v89 = v29;
      LOBYTE(v95[0]) = 15;
      unint64_t v30 = sub_253E43308();
      swift_bridgeObjectRetain();
      sub_253E45FB4();
      if (!v30)
      {
        uint64_t v84 = sub_253E46230();
        uint64_t v86 = v33;
        uint64_t v82 = v34;
        uint64_t v87 = v35;
        unint64_t v88 = v100 | ((unint64_t)BYTE4(v100) << 32);
        sub_253E3C044(v84, v33, v34);
        uint64_t v51 = sub_253E82600();
        char v52 = v36;
        char v152 = v36 & 1;
        uint64_t v50 = sub_253E45CA4();
        uint64_t v80 = v37;
        swift_bridgeObjectRetain();
        char v49 = sub_253E45CC4();
        LOBYTE(v96) = 19;
        char v48 = sub_253E45CC4();
        sub_253E43354();
        sub_253E45E6C();
        LOBYTE(v95[0]) = 21;
        uint64_t v79 = v106;
        uint64_t v78 = v105;
        uint64_t v77 = v104;
        uint64_t v38 = sub_253E46230();
        uint64_t v70 = v39;
        uint64_t v71 = v40;
        uint64_t v72 = v41;
        uint64_t v73 = v100;
        uint64_t v74 = v101;
        uint64_t v75 = v102;
        uint64_t v76 = v103;
        sub_253E3C268(v38, v39, v40, v41, v100, v101, v102, v103, v104, v105, v106);
        sub_253E433A0();
        sub_253E45E6C();
        char v148 = 22;
        char v47 = sub_253E825F0();
        uint64_t v42 = sub_253E45C20();
        v43(v42);
        v95[0] = v57;
        v95[1] = v17;
        v95[2] = v65;
        v95[3] = v64;
        v95[4] = v63;
        v95[5] = v62;
        v95[6] = v61;
        v95[7] = v24;
        LOBYTE(v95[8]) = v60;
        BYTE1(v95[8]) = v59;
        BYTE2(v95[8]) = v58;
        BYTE3(v95[8]) = v56;
        BYTE4(v95[8]) = v55;
        v95[9] = v68;
        v95[10] = v67;
        v95[11] = v94;
        v95[12] = v93;
        LOWORD(v95[13]) = v159;
        v95[14] = v91;
        v95[15] = v90;
        v95[16] = v54;
        v95[17] = v92;
        v95[18] = v53;
        v95[19] = v89;
        v95[20] = v84;
        v95[21] = v86;
        v95[22] = v82;
        v95[23] = v87;
        LOBYTE(v95[26]) = v52 & 1;
        BYTE4(v95[24]) = BYTE4(v88);
        LODWORD(v95[24]) = v88;
        v95[25] = v51;
        v95[27] = v50;
        v95[28] = v80;
        LOBYTE(v95[29]) = v49;
        BYTE1(v95[29]) = v48;
        v95[30] = v38;
        v95[31] = v70;
        v95[32] = v71;
        v95[33] = v72;
        v95[34] = v73;
        v95[35] = v74;
        v95[36] = v75;
        v95[37] = v76;
        v95[38] = v77;
        v95[39] = v78;
        v95[40] = v79;
        LOBYTE(v95[41]) = 19;
        BYTE1(v95[41]) = v47;
        sub_253E433EC((uint64_t)v95);
        sub_253E3C380(v38, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79);
        swift_bridgeObjectRelease();
        sub_253E45EAC();
        swift_bridgeObjectRelease();
        sub_253E3BE90(v91, v90);
        sub_253E3BD90(v94, v93);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        memcpy(v66, v95, 0x14AuLL);
        sub_253E393E4((uint64_t)v2);
        uint64_t v96 = v57;
        unint64_t v97 = v17;
        uint64_t v98 = v65;
        uint64_t v99 = v64;
        uint64_t v100 = v63;
        uint64_t v101 = v62;
        uint64_t v102 = v61;
        uint64_t v103 = v24;
        LOBYTE(v104) = v60;
        BYTE1(v104) = v59;
        BYTE2(v104) = v58;
        BYTE3(v104) = v56;
        BYTE4(v104) = v55;
        uint64_t v105 = v68;
        uint64_t v106 = v67;
        uint64_t v107 = v94;
        uint64_t v108 = v93;
        __int16 v109 = v159;
        uint64_t v112 = v91;
        unint64_t v113 = v90;
        *(_WORD *)((char *)&v104 + 5) = v157;
        HIBYTE(v104) = v158;
        int v110 = v155;
        __int16 v111 = v156;
        uint64_t v114 = v54;
        uint64_t v115 = v92;
        uint64_t v116 = v53;
        uint64_t v117 = v89;
        uint64_t v118 = v84;
        uint64_t v119 = v86;
        uint64_t v120 = v82;
        uint64_t v121 = v87;
        char v123 = BYTE4(v88);
        int v122 = v88;
        char v125 = v154;
        __int16 v124 = v153;
        uint64_t v126 = v51;
        char v127 = v152;
        *(_DWORD *)&v128[3] = *(_DWORD *)&v151[3];
        *(_DWORD *)uint64_t v128 = *(_DWORD *)v151;
        uint64_t v129 = v50;
        uint64_t v130 = v80;
        char v131 = v49;
        char v132 = v48;
        __int16 v134 = v150;
        int v133 = v149;
        uint64_t v135 = v38;
        uint64_t v136 = v70;
        uint64_t v137 = v71;
        uint64_t v138 = v72;
        uint64_t v139 = v73;
        uint64_t v140 = v74;
        uint64_t v141 = v75;
        uint64_t v142 = v76;
        uint64_t v143 = v77;
        uint64_t v144 = v78;
        uint64_t v145 = v79;
        char v146 = 19;
        char v147 = v47;
        sub_253E43570((uint64_t)&v96);
        goto LABEL_9;
      }
      uint64_t v31 = sub_253E45C20();
      v32(v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_253E45C38();
      sub_253E45E94();
      sub_253E45F28();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v83 = 0;
      uint64_t v85 = 0;
      uint64_t v81 = 1;
    }
    int v5 = 1;
    int v6 = 1;
  }
  sub_253E393E4(v69);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5) {
    swift_bridgeObjectRelease();
  }
  if (v6) {
    swift_bridgeObjectRelease();
  }
  sub_253E3BD90(v94, v93);
  sub_253E3BE90(v91, v90);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_253E3C0CC(v83, v85, v81);
  uint64_t v7 = swift_bridgeObjectRelease();
  sub_253E45E2C(v7, v8, v9, v10, v11, v12, v13, v14, v44, v45, v46);
LABEL_9:
  sub_253E46150();
  sub_253E45D2C();
}

void sub_253E42E80()
{
}

#error "253E42EA4: call analysis failed (funcsize=6)"

uint64_t static StructuredContext.SiriRequestContext.carPlayDeviceRestrictionIdentifier.getter()
{
  swift_beginAccess();
  uint64_t v0 = *(void *)aStark;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static StructuredContext.SiriRequestContext.carPlayDeviceRestrictionIdentifier.setter(uint64_t a1, uint64_t a2)
{
  *(void *)aStark = a1;
  qword_269D974C0 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static StructuredContext.SiriRequestContext.carPlayDeviceRestrictionIdentifier.modify())()
{
  return j__swift_endAccess;
}

uint64_t StructuredContext.SiriRequestContext.isCarPlayEnvironment.getter()
{
  uint64_t v1 = *(void **)(v0 + 72);
  swift_beginAccess();
  uint64_t v2 = v1[2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)aStark;
  uint64_t v4 = qword_269D974C0;
  if (v1[4] == *(void *)aStark && v1[5] == qword_269D974C0) {
    return 1;
  }
  uint64_t result = sub_253E82780();
  if (result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  uint64_t v7 = v1 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v9 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v10 = *(v7 - 1) == v3 && *v7 == v4;
    if (v10 || (sub_253E82780() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v7 += 2;
    if (v9 == v2) {
      return result;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_253E430A8()
{
  unint64_t result = qword_269D97568;
  if (!qword_269D97568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97568);
  }
  return result;
}

unint64_t sub_253E430F4()
{
  unint64_t result = qword_269D97570;
  if (!qword_269D97570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97570);
  }
  return result;
}

unint64_t sub_253E43140()
{
  unint64_t result = qword_269D97578;
  if (!qword_269D97578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97578);
  }
  return result;
}

unint64_t sub_253E4318C()
{
  unint64_t result = qword_269D97580;
  if (!qword_269D97580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97580);
  }
  return result;
}

unint64_t sub_253E431D8()
{
  unint64_t result = qword_269D97588;
  if (!qword_269D97588)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97588);
  }
  return result;
}

unint64_t sub_253E43224()
{
  unint64_t result = qword_269D97590;
  if (!qword_269D97590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97590);
  }
  return result;
}

unint64_t sub_253E43270()
{
  unint64_t result = qword_269D975A0;
  if (!qword_269D975A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975A0);
  }
  return result;
}

unint64_t sub_253E432BC()
{
  unint64_t result = qword_269D975A8;
  if (!qword_269D975A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975A8);
  }
  return result;
}

unint64_t sub_253E43308()
{
  unint64_t result = qword_269D975B0;
  if (!qword_269D975B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975B0);
  }
  return result;
}

unint64_t sub_253E43354()
{
  unint64_t result = qword_269D975B8;
  if (!qword_269D975B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975B8);
  }
  return result;
}

unint64_t sub_253E433A0()
{
  unint64_t result = qword_269D975C0;
  if (!qword_269D975C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975C0);
  }
  return result;
}

uint64_t sub_253E433EC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v2 = *(void *)(a1 + 96);
  unint64_t v4 = *(void *)(a1 + 120);
  uint64_t v6 = *(void *)(a1 + 112);
  uint64_t v10 = *(void *)(a1 + 168);
  uint64_t v11 = *(void *)(a1 + 160);
  uint64_t v9 = *(void *)(a1 + 176);
  uint64_t v18 = *(void *)(a1 + 248);
  uint64_t v19 = *(void *)(a1 + 240);
  uint64_t v16 = *(void *)(a1 + 264);
  uint64_t v17 = *(void *)(a1 + 256);
  uint64_t v15 = *(void *)(a1 + 272);
  uint64_t v13 = *(void *)(a1 + 288);
  uint64_t v14 = *(void *)(a1 + 280);
  uint64_t v12 = *(void *)(a1 + 296);
  long long v8 = *(_OWORD *)(a1 + 304);
  uint64_t v7 = *(void *)(a1 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_253E3BD3C(v3, v2);
  sub_253E3BDF0(v6, v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_253E3C044(v11, v10, v9);
  swift_bridgeObjectRetain();
  sub_253E3C268(v19, v18, v17, v16, v15, v14, v13, v12, v8, *((uint64_t *)&v8 + 1), v7);
  return a1;
}

uint64_t sub_253E43570(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 88);
  uint64_t v3 = *(void *)(a1 + 96);
  unint64_t v4 = *(void *)(a1 + 120);
  uint64_t v6 = *(void *)(a1 + 112);
  uint64_t v10 = *(void *)(a1 + 168);
  uint64_t v11 = *(void *)(a1 + 160);
  uint64_t v9 = *(void *)(a1 + 176);
  uint64_t v18 = *(void *)(a1 + 248);
  uint64_t v19 = *(void *)(a1 + 240);
  uint64_t v16 = *(void *)(a1 + 264);
  uint64_t v17 = *(void *)(a1 + 256);
  uint64_t v15 = *(void *)(a1 + 272);
  uint64_t v13 = *(void *)(a1 + 288);
  uint64_t v14 = *(void *)(a1 + 280);
  uint64_t v12 = *(void *)(a1 + 296);
  long long v8 = *(_OWORD *)(a1 + 304);
  uint64_t v7 = *(void *)(a1 + 320);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_253E3BD90(v2, v3);
  sub_253E3BE90(v6, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_253E3C0CC(v11, v10, v9);
  swift_bridgeObjectRelease();
  sub_253E3C380(v19, v18, v17, v16, v15, v14, v13, v12, v8, *((uint64_t *)&v8 + 1), v7);
  return a1;
}

unint64_t sub_253E436FC()
{
  unint64_t result = qword_269D975C8;
  if (!qword_269D975C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975C8);
  }
  return result;
}

unint64_t sub_253E4374C()
{
  unint64_t result = qword_269D975D0;
  if (!qword_269D975D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975D0);
  }
  return result;
}

uint64_t _s18SiriRequestContextVwxx(void *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[12] != 1) {
    swift_bridgeObjectRelease();
  }
  unint64_t v2 = a1[15];
  if (v2 >> 60 != 15) {
    sub_253E3BEA4(a1[14], v2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a1[22] != 1) {
    swift_bridgeObjectRelease();
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (a1[40])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s18SiriRequestContextVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  uint64_t v9 = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 == 1)
  {
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
  }
  else
  {
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = v9;
    *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
    swift_bridgeObjectRetain();
  }
  uint64_t v10 = (uint64_t *)(a2 + 112);
  unint64_t v11 = *(void *)(a2 + 120);
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v10;
  }
  else
  {
    uint64_t v12 = *v10;
    sub_253E3BE04(*v10, *(void *)(a2 + 120));
    *(void *)(a1 + 112) = v12;
    *(void *)(a1 + 120) = v11;
  }
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v14;
  uint64_t v15 = (_OWORD *)(a1 + 160);
  uint64_t v16 = (_OWORD *)(a2 + 160);
  uint64_t v17 = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17 == 1)
  {
    long long v18 = *(_OWORD *)(a2 + 176);
    *uint64_t v15 = *v16;
    *(_OWORD *)(a1 + 176) = v18;
    *(void *)(a1 + 189) = *(void *)(a2 + 189);
  }
  else
  {
    *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
    *(unsigned char *)(a1 + 164) = *(unsigned char *)(a2 + 164);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(void *)(a1 + 176) = v17;
    *(_DWORD *)(a1 + 184) = *(_DWORD *)(a2 + 184);
    *(unsigned char *)(a1 + 188) = *(unsigned char *)(a2 + 188);
    *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 192);
    *(unsigned char *)(a1 + 196) = *(unsigned char *)(a2 + 196);
    swift_bridgeObjectRetain();
  }
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  uint64_t v19 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v19;
  *(_WORD *)(a1 + 232) = *(_WORD *)(a2 + 232);
  uint64_t v20 = *(void *)(a2 + 320);
  swift_bridgeObjectRetain();
  if (v20)
  {
    uint64_t v21 = *(void *)(a2 + 248);
    *(void *)(a1 + 240) = *(void *)(a2 + 240);
    *(void *)(a1 + 248) = v21;
    uint64_t v22 = *(void *)(a2 + 264);
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(void *)(a1 + 264) = v22;
    uint64_t v23 = *(void *)(a2 + 280);
    *(void *)(a1 + 272) = *(void *)(a2 + 272);
    *(void *)(a1 + 280) = v23;
    uint64_t v24 = *(void *)(a2 + 296);
    *(void *)(a1 + 288) = *(void *)(a2 + 288);
    *(void *)(a1 + 296) = v24;
    uint64_t v25 = *(void *)(a2 + 312);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(void *)(a1 + 312) = v25;
    *(void *)(a1 + 320) = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    memcpy((void *)(a1 + 240), (const void *)(a2 + 240), 0x58uLL);
  }
  *(_WORD *)(a1 + 328) = *(_WORD *)(a2 + 328);
  return a1;
}

uint64_t _s18SiriRequestContextVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  *(unsigned char *)(a1 + 67) = *(unsigned char *)(a2 + 67);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (long long *)(a1 + 88);
  uint64_t v5 = (long long *)(a2 + 88);
  uint64_t v6 = *(void *)(a2 + 96);
  if (*(void *)(a1 + 96) == 1)
  {
    if (v6 == 1)
    {
      long long v7 = *v5;
      *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
      *uint64_t v4 = v7;
    }
    else
    {
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
      *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    sub_253E44000(a1 + 88);
    __int16 v8 = *(_WORD *)(a2 + 104);
    *uint64_t v4 = *v5;
    *(_WORD *)(a1 + 104) = v8;
  }
  else
  {
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
    *(unsigned char *)(a1 + 105) = *(unsigned char *)(a2 + 105);
  }
  uint64_t v9 = (uint64_t *)(a2 + 112);
  unint64_t v10 = *(void *)(a2 + 120);
  if (*(void *)(a1 + 120) >> 60 == 15)
  {
    if (v10 >> 60 != 15)
    {
      uint64_t v11 = *v9;
      sub_253E3BE04(*v9, *(void *)(a2 + 120));
      *(void *)(a1 + 112) = v11;
      *(void *)(a1 + 120) = v10;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v10 >> 60 == 15)
  {
    sub_253E4402C(a1 + 112);
LABEL_13:
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v9;
    goto LABEL_15;
  }
  uint64_t v12 = *v9;
  sub_253E3BE04(*v9, *(void *)(a2 + 120));
  uint64_t v13 = *(void *)(a1 + 112);
  unint64_t v14 = *(void *)(a1 + 120);
  *(void *)(a1 + 112) = v12;
  *(void *)(a1 + 120) = v10;
  sub_253E3BEA4(v13, v14);
LABEL_15:
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = (long long *)(a1 + 160);
  uint64_t v16 = (long long *)(a2 + 160);
  uint64_t v17 = *(void *)(a2 + 176);
  if (*(void *)(a1 + 176) == 1)
  {
    if (v17 == 1)
    {
      long long v18 = *v16;
      long long v19 = *(_OWORD *)(a2 + 176);
      *(void *)(a1 + 189) = *(void *)(a2 + 189);
      *uint64_t v15 = v18;
      *(_OWORD *)(a1 + 176) = v19;
    }
    else
    {
      int v22 = *(_DWORD *)v16;
      *(unsigned char *)(a1 + 164) = *(unsigned char *)(a2 + 164);
      *(_DWORD *)uint64_t v15 = v22;
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      int v23 = *(_DWORD *)(a2 + 184);
      *(unsigned char *)(a1 + 188) = *(unsigned char *)(a2 + 188);
      *(_DWORD *)(a1 + 184) = v23;
      int v24 = *(_DWORD *)(a2 + 192);
      *(unsigned char *)(a1 + 196) = *(unsigned char *)(a2 + 196);
      *(_DWORD *)(a1 + 192) = v24;
      swift_bridgeObjectRetain();
    }
  }
  else if (v17 == 1)
  {
    sub_253E44080(a1 + 160);
    uint64_t v20 = *(void *)(a2 + 189);
    long long v21 = *(_OWORD *)(a2 + 176);
    *uint64_t v15 = *v16;
    *(_OWORD *)(a1 + 176) = v21;
    *(void *)(a1 + 189) = v20;
  }
  else
  {
    int v25 = *(_DWORD *)v16;
    *(unsigned char *)(a1 + 164) = *(unsigned char *)(a2 + 164);
    *(_DWORD *)uint64_t v15 = v25;
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(void *)(a1 + 176) = *(void *)(a2 + 176);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    int v26 = *(_DWORD *)(a2 + 184);
    *(unsigned char *)(a1 + 188) = *(unsigned char *)(a2 + 188);
    *(_DWORD *)(a1 + 184) = v26;
    int v27 = *(_DWORD *)(a2 + 192);
    *(unsigned char *)(a1 + 196) = *(unsigned char *)(a2 + 196);
    *(_DWORD *)(a1 + 192) = v27;
  }
  uint64_t v28 = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  *(void *)(a1 + 200) = v28;
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(unsigned char *)(a1 + 233) = *(unsigned char *)(a2 + 233);
  uint64_t v29 = *(void *)(a2 + 320);
  if (!*(void *)(a1 + 320))
  {
    if (v29)
    {
      *(void *)(a1 + 240) = *(void *)(a2 + 240);
      *(void *)(a1 + 248) = *(void *)(a2 + 248);
      *(void *)(a1 + 256) = *(void *)(a2 + 256);
      *(void *)(a1 + 264) = *(void *)(a2 + 264);
      *(void *)(a1 + 272) = *(void *)(a2 + 272);
      *(void *)(a1 + 280) = *(void *)(a2 + 280);
      *(void *)(a1 + 288) = *(void *)(a2 + 288);
      *(void *)(a1 + 296) = *(void *)(a2 + 296);
      *(void *)(a1 + 304) = *(void *)(a2 + 304);
      *(void *)(a1 + 312) = *(void *)(a2 + 312);
      *(void *)(a1 + 320) = *(void *)(a2 + 320);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_29;
    }
LABEL_28:
    memcpy((void *)(a1 + 240), (const void *)(a2 + 240), 0x58uLL);
    goto LABEL_29;
  }
  if (!v29)
  {
    sub_253E440AC(a1 + 240);
    goto LABEL_28;
  }
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_29:
  *(unsigned char *)(a1 + 328) = *(unsigned char *)(a2 + 328);
  *(unsigned char *)(a1 + 329) = *(unsigned char *)(a2 + 329);
  return a1;
}

uint64_t sub_253E44000(uint64_t a1)
{
  return a1;
}

uint64_t sub_253E4402C(uint64_t a1)
{
  return a1;
}

uint64_t sub_253E44080(uint64_t a1)
{
  return a1;
}

uint64_t sub_253E440AC(uint64_t a1)
{
  return a1;
}

void *_s18SiriRequestContextVwtk(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x14AuLL);
}

uint64_t _s18SiriRequestContextVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 96) == 1) {
    goto LABEL_4;
  }
  uint64_t v8 = *(void *)(a2 + 96);
  if (v8 == 1)
  {
    sub_253E44000(a1 + 88);
LABEL_4:
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
    goto LABEL_6;
  }
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 104) = *(_WORD *)(a2 + 104);
LABEL_6:
  uint64_t v9 = (_OWORD *)(a2 + 112);
  unint64_t v10 = *(void *)(a1 + 120);
  if (v10 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 112) = *v9;
    goto LABEL_11;
  }
  unint64_t v11 = *(void *)(a2 + 120);
  if (v11 >> 60 == 15)
  {
    sub_253E4402C(a1 + 112);
    goto LABEL_9;
  }
  uint64_t v12 = *(void *)(a1 + 112);
  *(void *)(a1 + 112) = *(void *)v9;
  *(void *)(a1 + 120) = v11;
  sub_253E3BEA4(v12, v10);
LABEL_11:
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = (_OWORD *)(a1 + 160);
  uint64_t v16 = (_OWORD *)(a2 + 160);
  if (*(void *)(a1 + 176) == 1)
  {
LABEL_14:
    long long v18 = *(_OWORD *)(a2 + 176);
    *uint64_t v15 = *v16;
    *(_OWORD *)(a1 + 176) = v18;
    *(void *)(a1 + 189) = *(void *)(a2 + 189);
    goto LABEL_16;
  }
  uint64_t v17 = *(void *)(a2 + 176);
  if (v17 == 1)
  {
    sub_253E44080(a1 + 160);
    goto LABEL_14;
  }
  *(_DWORD *)uint64_t v15 = *(_DWORD *)v16;
  *(unsigned char *)(a1 + 164) = *(unsigned char *)(a2 + 164);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v17;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 184) = *(_DWORD *)(a2 + 184);
  *(unsigned char *)(a1 + 188) = *(unsigned char *)(a2 + 188);
  *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 192);
  *(unsigned char *)(a1 + 196) = *(unsigned char *)(a2 + 196);
LABEL_16:
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(unsigned char *)(a1 + 208) = *(unsigned char *)(a2 + 208);
  uint64_t v19 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v19;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 232) = *(_WORD *)(a2 + 232);
  if (!*(void *)(a1 + 320))
  {
LABEL_20:
    memcpy((void *)(a1 + 240), (const void *)(a2 + 240), 0x58uLL);
    goto LABEL_21;
  }
  if (!*(void *)(a2 + 320))
  {
    sub_253E440AC(a1 + 240);
    goto LABEL_20;
  }
  uint64_t v20 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = *(void *)(a2 + 264);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = v21;
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void *)(a2 + 280);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = v22;
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void *)(a2 + 296);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)(a2 + 312);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = v24;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 320) = *(void *)(a2 + 320);
  swift_bridgeObjectRelease();
LABEL_21:
  *(_WORD *)(a1 + 328) = *(_WORD *)(a2 + 328);
  return a1;
}

uint64_t _s18SiriRequestContextVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 330))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 72);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 328) = 0;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 330) = 1;
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 330) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext()
{
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwcp(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwca(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(unsigned char *)(a1 + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)a1 = v4;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v5 = a2[6];
  *(unsigned char *)(a1 + 28) = *((unsigned char *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v5;
  int v6 = a2[8];
  *(unsigned char *)(a1 + 36) = *((unsigned char *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v6;
  return a1;
}

__n128 _s18SiriRequestContextV18ContentRestrictionVwtk(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 29) = *(void *)(a2 + 29);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwta(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(unsigned char *)(a1 + 28) = *(unsigned char *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 36) = *(unsigned char *)(a2 + 36);
  return a1;
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 37))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextV18ContentRestrictionVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 36) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 37) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 37) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.ContentRestriction()
{
}

uint64_t _s18SiriRequestContextV4UserVwxx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s18SiriRequestContextV4UserVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s18SiriRequestContextV4UserVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 _s18SiriRequestContextV4UserVwtk(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t _s18SiriRequestContextV4UserVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

uint64_t _s18SiriRequestContextV4UserVwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 18))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextV4UserVwst(uint64_t result, unsigned int a2, unsigned int a3)
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

void type metadata accessor for StructuredContext.SiriRequestContext.User()
{
}

uint64_t _s18SiriRequestContextV4UserV14ClassificationOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s18SiriRequestContextV4UserV14ClassificationOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x253E44980);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.User.Classification()
{
}

uint64_t _s18SiriRequestContextV6MeCardVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s18SiriRequestContextV6MeCardVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s18SiriRequestContextV6MeCardVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s18SiriRequestContextV6MeCardVwtk(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t _s18SiriRequestContextV6MeCardVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18SiriRequestContextV6MeCardVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 88))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 80);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextV6MeCardVwst(uint64_t result, int a2, int a3)
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
      *(void *)(result + 80) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.MeCard()
{
}

uint64_t _s18SiriRequestContextV6MeCardV7AddressVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s18SiriRequestContextV6MeCardV7AddressVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s18SiriRequestContextV6MeCardV7AddressVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *_s18SiriRequestContextV6MeCardV7AddressVwtk(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

void *_s18SiriRequestContextV6MeCardV7AddressVwta(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18SiriRequestContextV6MeCardV7AddressVwet(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 96))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s18SiriRequestContextV6MeCardV7AddressVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 96) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 96) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.MeCard.Address()
{
}

uint64_t _s18SiriRequestContextV11DeviceIdiomOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF6)
  {
    if (a2 + 10 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 10) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 11;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v5 = v6 - 11;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s18SiriRequestContextV11DeviceIdiomOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *__n128 result = a2 + 10;
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
        JUMPOUT(0x253E45144);
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
          *__n128 result = a2 + 10;
        break;
    }
  }
  return result;
}

void type metadata accessor for StructuredContext.SiriRequestContext.DeviceIdiom()
{
}

uint64_t _s18SiriRequestContextV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xEA)
  {
    if (a2 + 22 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 22) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 23;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x17;
  int v5 = v6 - 23;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s18SiriRequestContextV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 22 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 22) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE9)
  {
    unsigned int v6 = ((a2 - 234) >> 8) + 1;
    *__n128 result = a2 + 22;
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
        JUMPOUT(0x253E452CCLL);
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
          *__n128 result = a2 + 22;
        break;
    }
  }
  return result;
}

ValueMetadata *_s18SiriRequestContextV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV10CodingKeysON;
}

ValueMetadata *_s18SiriRequestContextV6MeCardV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV6MeCardV10CodingKeysON;
}

unsigned char *_s18SiriRequestContextV6MeCardV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x253E453E8);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *_s18SiriRequestContextV6MeCardV7AddressV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV6MeCardV7AddressV10CodingKeysON;
}

unsigned char *_s18SiriRequestContextV4UserV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x253E454ECLL);
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

ValueMetadata *_s18SiriRequestContextV4UserV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV4UserV10CodingKeysON;
}

uint64_t _s18SiriRequestContextV18ContentRestrictionV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *_s18SiriRequestContextV18ContentRestrictionV10CodingKeysOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x253E45678);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *_s18SiriRequestContextV18ContentRestrictionV10CodingKeysOMa()
{
  return &_s18SiriRequestContextV18ContentRestrictionV10CodingKeysON;
}

unint64_t sub_253E456B4()
{
  unint64_t result = qword_269D975D8;
  if (!qword_269D975D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975D8);
  }
  return result;
}

unint64_t sub_253E45704()
{
  unint64_t result = qword_269D975E0;
  if (!qword_269D975E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975E0);
  }
  return result;
}

unint64_t sub_253E45754()
{
  unint64_t result = qword_269D975E8;
  if (!qword_269D975E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975E8);
  }
  return result;
}

unint64_t sub_253E457A4()
{
  unint64_t result = qword_269D975F0;
  if (!qword_269D975F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975F0);
  }
  return result;
}

unint64_t sub_253E457F4()
{
  unint64_t result = qword_269D975F8;
  if (!qword_269D975F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D975F8);
  }
  return result;
}

unint64_t sub_253E45844()
{
  unint64_t result = qword_269D97600;
  if (!qword_269D97600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97600);
  }
  return result;
}

unint64_t sub_253E45894()
{
  unint64_t result = qword_269D97608;
  if (!qword_269D97608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97608);
  }
  return result;
}

unint64_t sub_253E458E4()
{
  unint64_t result = qword_269D97610;
  if (!qword_269D97610)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97610);
  }
  return result;
}

unint64_t sub_253E45934()
{
  unint64_t result = qword_269D97618;
  if (!qword_269D97618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97618);
  }
  return result;
}

unint64_t sub_253E45984()
{
  unint64_t result = qword_269D97620;
  if (!qword_269D97620)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97620);
  }
  return result;
}

unint64_t sub_253E459D4()
{
  unint64_t result = qword_269D97628;
  if (!qword_269D97628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97628);
  }
  return result;
}

unint64_t sub_253E45A24()
{
  unint64_t result = qword_269D97630;
  if (!qword_269D97630)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97630);
  }
  return result;
}

unint64_t sub_253E45A74()
{
  unint64_t result = qword_269D97638;
  if (!qword_269D97638)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97638);
  }
  return result;
}

unint64_t sub_253E45AC4()
{
  unint64_t result = qword_269D97640;
  if (!qword_269D97640)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97640);
  }
  return result;
}

unint64_t sub_253E45B14()
{
  unint64_t result = qword_269D97648;
  if (!qword_269D97648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97648);
  }
  return result;
}

unint64_t sub_253E45B60()
{
  unint64_t result = qword_269D97650;
  if (!qword_269D97650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97650);
  }
  return result;
}

unint64_t sub_253E45BAC()
{
  unint64_t result = qword_269D97658;
  if (!qword_269D97658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97658);
  }
  return result;
}

uint64_t sub_253E45C20()
{
  return v0;
}

uint64_t sub_253E45C38()
{
  sub_253E3BE90(*(void *)(v0 + 328), *(void *)(v0 + 320));
  sub_253E3BD90(*(void *)(v0 + 352), *(void *)(v0 + 344));
  return swift_bridgeObjectRelease();
}

void sub_253E45C70()
{
  v0[31] = 0;
  v0[32] = 0;
  v0[29] = 0;
  v0[30] = 0;
  v0[27] = 0;
  v0[28] = 0;
  v0[25] = 0;
  v0[26] = 0;
  v0[23] = 0;
  v0[24] = 0;
  v0[33] = 0;
  v0[37] = 0;
  v0[38] = 0;
  v0[35] = 0;
  v0[36] = 0;
  v0[39] = 0;
  v0[41] = 0;
  v0[42] = 0;
  *(_DWORD *)(v1 - 72) = 0;
}

uint64_t sub_253E45CA4()
{
  return sub_253E825E0();
}

uint64_t sub_253E45CC4()
{
  return sub_253E825F0();
}

uint64_t sub_253E45D08()
{
  return sub_253E826F0();
}

uint64_t sub_253E45D44()
{
  return v0;
}

uint64_t sub_253E45D5C()
{
  return v0;
}

void sub_253E45D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, unint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,unint64_t a27,unint64_t a28,unint64_t a29)
{
  STACK[0x2C8] = v32;
  STACK[0x2D0] = a15;
  STACK[0x2D8] = v34;
  STACK[0x2E0] = a29;
  STACK[0x2E8] = v33;
  STACK[0x2F0] = a28;
  STACK[0x2F8] = v30;
  STACK[0x300] = a27;
  STACK[0x308] = v31;
  STACK[0x310] = v29;
  STACK[0x318] = a16;
}

void sub_253E45DB8()
{
  v0[31] = 0;
  v0[32] = 0;
  v0[29] = 0;
  v0[30] = 0;
  v0[27] = 0;
  v0[28] = 0;
  v0[25] = 0;
  v0[26] = 0;
  v0[23] = 0;
  v0[24] = 0;
  v0[33] = 0;
  v0[37] = 0;
  v0[38] = 0;
  v0[35] = 0;
  v0[36] = 0;
  v0[39] = 0;
  v0[41] = 0;
  v0[42] = 0;
  *(_DWORD *)(v1 - 72) = 0;
  v0[44] = 0;
}

uint64_t sub_253E45E14()
{
  return sub_253E825E0();
}

uint64_t sub_253E45E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v14 = v11[23];
  uint64_t v15 = v11[24];
  uint64_t v16 = v11[25];
  uint64_t v17 = v11[26];
  uint64_t v18 = v11[27];
  uint64_t v19 = v11[28];
  uint64_t v20 = v11[29];
  return sub_253E3C380(v12, v14, v15, v16, v17, v18, v19, v20, a9, a10, a11);
}

uint64_t sub_253E45E6C()
{
  return sub_253E82620();
}

uint64_t sub_253E45E94()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E45EAC()
{
  sub_253E3C0CC(v0[35], v0[36], v0[34]);
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E45EE0()
{
  return sub_253E825E0();
}

uint64_t sub_253E45EFC()
{
  return sub_253E826B0();
}

unint64_t sub_253E45F14@<X0>(uint64_t a1@<X8>)
{
  return a1 | ((unint64_t)v1 << 32);
}

uint64_t sub_253E45F28()
{
  return swift_bridgeObjectRelease();
}

void sub_253E45F40()
{
  v0[31] = 0;
  v0[32] = 0;
  v0[29] = 0;
  v0[30] = 0;
  v0[27] = 0;
  v0[28] = 0;
  v0[25] = 0;
  v0[26] = 0;
  v0[23] = 0;
  v0[24] = 0;
  v0[33] = 0;
  v0[37] = 0;
  v0[38] = 0;
  v0[35] = 0;
  v0[36] = 0;
  v0[39] = 0;
}

uint64_t sub_253E45F6C()
{
  return sub_253E826C0();
}

void sub_253E45FA8(char a1@<W8>)
{
  *(unsigned char *)(v1 - 176) = a1;
}

uint64_t sub_253E45FB4()
{
  return sub_253E82620();
}

uint64_t sub_253E45FE0()
{
  return sub_253E826B0();
}

uint64_t sub_253E46000()
{
  return swift_bridgeObjectRelease();
}

void sub_253E4601C(char a1@<W8>)
{
  *(unsigned char *)(v1 - 176) = a1;
}

uint64_t sub_253E46028()
{
  return sub_253E82780();
}

uint64_t _s22IntelligenceFlowShared17StructuredContextV011SiriRequestE0V12bargeInModesSaySSGvg_0()
{
  return swift_bridgeObjectRetain();
}

void sub_253E4604C()
{
  v0[34] = 1;
  v0[40] = 0xF000000000000000;
  v0[43] = 1;
  v0[44] = 0;
}

void sub_253E46068()
{
  v0[31] = 0;
  v0[32] = 0;
  v0[29] = 0;
  v0[30] = 0;
  v0[27] = 0;
  v0[28] = 0;
  v0[25] = 0;
  v0[26] = 0;
  v0[23] = 0;
  v0[24] = 0;
}

uint64_t sub_253E46084()
{
  return sub_253E826C0();
}

void sub_253E460AC()
{
  *(unsigned char *)(v0 - 66) = 1;
}

uint64_t sub_253E460BC()
{
  *(unsigned char *)(v0 - 66) = 1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253E460D8()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_253E460F0()
{
  return v0;
}

uint64_t sub_253E46118(uint64_t a1)
{
  return MEMORY[0x270F9F2B8](a1, v1);
}

uint64_t sub_253E46134()
{
  return sub_253E826B0();
}

uint64_t sub_253E4615C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E46178()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E46194()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E461C0()
{
  return v0;
}

void sub_253E461D8()
{
  *(unsigned char *)(v0 - 70) = 5;
}

uint64_t sub_253E461E4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E46210()
{
  return sub_253E82860();
}

uint64_t sub_253E46230()
{
  return *(void *)(v0 + 696);
}

uint64_t sub_253E46250()
{
  return *(void *)(v0 + 240);
}

void sub_253E46264(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(a1 - 256);
  *(void *)(v2 - 176) = v1;
  *(void *)(v2 - 168) = v3;
}

uint64_t sub_253E46270()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E46288()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E462A0()
{
  return swift_bridgeObjectRetain();
}

uint64_t StructuredContext.value.getter@<X0>(uint64_t a1@<X8>)
{
  sub_253E48FF4(v1, (uint64_t)v4, &qword_26B2578F0);
  sub_253E48FF4((uint64_t)v4, a1, &qword_26B2578F0);
  return sub_253E46614((uint64_t)v4);
}

void sub_253E46340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,unint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  unint64_t v41 = a30 >> 62;
  if (a30 >> 62 == 2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    if (v41 != 1)
    {
      if (!v41)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_253E3BD3C(a12, a13);
        sub_253E3BDF0(a15, a16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_253E3C044(a21, a22, a23);
        swift_bridgeObjectRetain();
        sub_253E3C268(a31, a32, a33, a34, a35, a36, a37, a38, a39, a40, a41);
      }
      return;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }

  swift_bridgeObjectRetain();
}

void *StructuredContext.value.setter(uint64_t a1)
{
  sub_253E48FF4(a1, (uint64_t)v3, &qword_26B2578F0);
  sub_253E48FF4((uint64_t)v3, (uint64_t)__src, &qword_26B2578F0);
  memcpy(__dst, v1, 0x14AuLL);
  sub_253E46614((uint64_t)__dst);
  return memcpy(v1, __src, 0x14AuLL);
}

uint64_t sub_253E46614(uint64_t a1)
{
  sub_253E4ADEC();
  uint64_t v46 = v2;
  sub_253E4AE24();
  sub_253E4665C(v3, v10, v4, v5, v6, v7, v8, v9, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46);
  return a1;
}

uint64_t sub_253E4665C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unint64_t a25,uint64_t a26,unint64_t a27,uint64_t a28,uint64_t a29,unint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t (*a43)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t result = a20;
  if (a14 >> 16 != 0xFFFFFFFF || a25 >> 40 || a27 > 1 || a30 >= 0x10000)
  {
    return a43(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41);
  }
  return result;
}

void sub_253E467E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,unint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41)
{
  unint64_t v41 = a30 >> 62;
  if (a30 >> 62 == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v41 != 1)
    {
      if (!v41)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_253E3BD90(a12, a13);
        sub_253E3BE90(a15, a16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_253E3C0CC(a21, a22, a23);
        swift_bridgeObjectRelease();
        sub_253E3C380(a31, a32, a33, a34, a35, a36, a37, a38, a39, a40, a41);
      }
      return;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
}

uint64_t (*StructuredContext.value.modify())()
{
  return nullsub_1;
}

uint64_t static StructuredContext.Value.== infix(_:_:)(void *a1, void *a2)
{
  sub_253E46D24(a1, __src);
  sub_253E46D24(a2, v36);
  sub_253E46D24(__src, v37);
  sub_253E46D24(v36, &v38);
  sub_253E46D24(__src, v39);
  int v3 = sub_253E46D38((uint64_t)v39);
  if (v3)
  {
    if (v3 == 1)
    {
      uint64_t v4 = sub_253E46F68((uint64_t)v39);
      uint64_t v5 = *(void *)v4;
      uint64_t v6 = *(void *)(v4 + 8);
      uint64_t v7 = *(void *)(v4 + 16);
      uint64_t v8 = *(void *)(v4 + 24);
      uint64_t v9 = *(void *)(v4 + 32);
      uint64_t v10 = *(void *)(v4 + 40);
      uint64_t v11 = *(void *)(v4 + 48);
      uint64_t v12 = *(void *)(v4 + 56);
      uint64_t v13 = *(void *)(v4 + 64);
      char v14 = *(unsigned char *)(v4 + 72);
      sub_253E46D24(v36, v34);
      if (sub_253E46D38((uint64_t)v34) == 1)
      {
        sub_253E46F68((uint64_t)v34);
        sub_253E4AEF8();
        __dst[0] = v5;
        __dst[1] = v6;
        __dst[2] = v7;
        __dst[3] = v8;
        __dst[4] = v9;
        __dst[5] = v10;
        __dst[6] = v11;
        __dst[7] = v12;
        __dst[8] = v13;
        LOBYTE(__dst[9]) = v14;
        sub_253E4AF40(v15);
        v32[6] = v16;
        *(_OWORD *)&v32[7] = *(_OWORD *)(v17 + 56);
        LOBYTE(v32[9]) = v18;
        char v19 = static StructuredContext.IntelligenceCommandContext.== infix(_:_:)((uint64_t)__dst, (uint64_t)v32);
LABEL_9:
        char v22 = v19;
        sub_253E46D44((uint64_t)__src);
        sub_253E46D44((uint64_t)v36);
        sub_253E46D8C((uint64_t)v37);
        return v22 & 1;
      }
    }
    else
    {
      uint64_t v23 = (uint64_t *)sub_253E46F68((uint64_t)v39);
      uint64_t v24 = *v23;
      uint64_t v25 = v23[1];
      uint64_t v26 = v23[2];
      uint64_t v27 = v23[3];
      uint64_t v28 = v23[4];
      uint64_t v29 = v23[5];
      sub_253E46D24(v36, v34);
      if (sub_253E46D38((uint64_t)v34) == 2)
      {
        unint64_t v30 = (__n128 *)sub_253E46F68((uint64_t)v34);
        __dst[0] = v24;
        __dst[1] = v25;
        __dst[2] = v26;
        __dst[3] = v27;
        __dst[4] = v28;
        __dst[5] = v29;
        sub_253E4AF40(v30);
        char v19 = static StructuredContext.AppInFocusContext.== infix(_:_:)(__dst, v32);
        goto LABEL_9;
      }
    }
LABEL_10:
    sub_253E46D44((uint64_t)__src);
    sub_253E46D44((uint64_t)v36);
    sub_253E46D8C((uint64_t)v37);
    char v22 = 0;
    return v22 & 1;
  }
  uint64_t v20 = (const void *)sub_253E46F68((uint64_t)v39);
  sub_253E46D24(v36, v34);
  if (sub_253E46D38((uint64_t)v34)) {
    goto LABEL_10;
  }
  uint64_t v21 = (const void *)sub_253E46F68((uint64_t)v34);
  memcpy(__dst, v20, 0x14AuLL);
  memcpy(v32, v21, 0x14AuLL);
  sub_253E46D44((uint64_t)v36);
  sub_253E46D44((uint64_t)__src);
  sub_253E46D44((uint64_t)__src);
  sub_253E46D44((uint64_t)v36);
  char v22 = static StructuredContext.SiriRequestContext.== infix(_:_:)((uint64_t)__dst, (uint64_t)v32);
  sub_253E46D8C((uint64_t)v37);
  sub_253E46D44((uint64_t)v36);
  sub_253E46D44((uint64_t)__src);
  return v22 & 1;
}

void *sub_253E46D24(void *__src, void *__dst)
{
  return memcpy(__dst, __src, 0x14AuLL);
}

uint64_t sub_253E46D38(uint64_t a1)
{
  return *(void *)(a1 + 232) >> 62;
}

uint64_t sub_253E46D44(uint64_t a1)
{
  sub_253E4ADEC();
  sub_253E4AE24();
  v2();
  return a1;
}

uint64_t sub_253E46D8C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 344);
  uint64_t v32 = *(void *)(a1 + 336);
  uint64_t v3 = *(void *)(a1 + 352);
  uint64_t v4 = *(void *)(a1 + 360);
  uint64_t v5 = *(void *)(a1 + 368);
  uint64_t v6 = *(void *)(a1 + 376);
  uint64_t v7 = *(void *)(a1 + 384);
  uint64_t v8 = *(void *)(a1 + 392);
  long long v30 = *(_OWORD *)(a1 + 416);
  long long v31 = *(_OWORD *)(a1 + 400);
  long long v28 = *(_OWORD *)(a1 + 448);
  long long v29 = *(_OWORD *)(a1 + 432);
  long long v26 = *(_OWORD *)(a1 + 480);
  long long v27 = *(_OWORD *)(a1 + 464);
  long long v24 = *(_OWORD *)(a1 + 512);
  long long v25 = *(_OWORD *)(a1 + 496);
  long long v22 = *(_OWORD *)(a1 + 544);
  long long v23 = *(_OWORD *)(a1 + 528);
  long long v20 = *(_OWORD *)(a1 + 576);
  long long v21 = *(_OWORD *)(a1 + 560);
  long long v18 = *(_OWORD *)(a1 + 608);
  long long v19 = *(_OWORD *)(a1 + 592);
  long long v16 = *(_OWORD *)(a1 + 640);
  long long v17 = *(_OWORD *)(a1 + 624);
  uint64_t v9 = *(void *)(a1 + 656);
  long long v14 = *(_OWORD *)(a1 + 288);
  long long v15 = *(_OWORD *)(a1 + 304);
  long long v12 = *(_OWORD *)(a1 + 256);
  long long v13 = *(_OWORD *)(a1 + 272);
  long long v11 = *(_OWORD *)(a1 + 224);
  sub_253E467E8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v11,
    *((unint64_t *)&v11 + 1),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    v12,
    *((uint64_t *)&v12 + 1),
    v13,
    *((uint64_t *)&v13 + 1),
    v14,
    *((uint64_t *)&v14 + 1),
    v15,
    *((uint64_t *)&v15 + 1),
    *(void *)(a1 + 320));
  sub_253E467E8(v32, v2, v3, v4, v5, v6, v7, v8, v31, *((uint64_t *)&v31 + 1), v30, *((uint64_t *)&v30 + 1), v29, *((uint64_t *)&v29 + 1), v28, *((unint64_t *)&v28 + 1), v27, *((uint64_t *)&v27 + 1), v26,
    *((uint64_t *)&v26 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    v24,
    *((uint64_t *)&v24 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v21,
    *((unint64_t *)&v21 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    v17,
    *((uint64_t *)&v17 + 1),
    v16,
    *((uint64_t *)&v16 + 1),
    v9);
  return a1;
}

uint64_t sub_253E46F68(uint64_t result)
{
  *(void *)(result + 232) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_253E46F78()
{
  return 12383;
}

uint64_t sub_253E46F84(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000012 && a2 == 0x8000000253E83030 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000253E83050 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000253E83350)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

unint64_t sub_253E470CC(char a1)
{
  if (!a1) {
    return 0xD000000000000012;
  }
  if (a1 == 1) {
    return 0xD000000000000013;
  }
  return 0xD000000000000011;
}

uint64_t sub_253E47128(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253E82780();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_253E4719C()
{
  return sub_253E48410();
}

uint64_t sub_253E471C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E47128(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_253E471EC(uint64_t a1)
{
  unint64_t v2 = sub_253E47870();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E47228(uint64_t a1)
{
  unint64_t v2 = sub_253E47870();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_253E47264()
{
  return sub_253E470CC(*v0);
}

uint64_t sub_253E4726C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E46F84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E47294(uint64_t a1)
{
  unint64_t v2 = sub_253E47824();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E472D0(uint64_t a1)
{
  unint64_t v2 = sub_253E47824();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E4730C(uint64_t a1)
{
  unint64_t v2 = sub_253E47908();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E47348(uint64_t a1)
{
  unint64_t v2 = sub_253E47908();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E47384(uint64_t a1)
{
  unint64_t v2 = sub_253E479A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E473C0(uint64_t a1)
{
  unint64_t v2 = sub_253E479A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void StructuredContext.Value.encode(to:)()
{
  sub_253E45CF0();
  uint64_t v1 = v0;
  char v3 = v2;
  sub_253E390C4(&qword_26B257998);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E45F88();
  sub_253E390C4(&qword_26B2579A8);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E45DFC();
  sub_253E390C4(&qword_26B2579A0);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E4AEA0();
  sub_253E390C4(&qword_26B2579B0);
  sub_253E3B950();
  uint64_t v25 = v4;
  MEMORY[0x270FA5388]();
  sub_253E4AE88();
  sub_253E46D24(v1, v33);
  sub_253E39108(v3, v3[3]);
  sub_253E47824();
  sub_253E82860();
  sub_253E46D24(v33, v34);
  int v5 = sub_253E46D38((uint64_t)v34);
  if (v5)
  {
    if (v5 == 1)
    {
      uint64_t v6 = sub_253E46F68((uint64_t)v34);
      long long v23 = *(_OWORD *)(v6 + 16);
      long long v24 = *(_OWORD *)v6;
      long long v19 = *(_OWORD *)(v6 + 48);
      long long v20 = *(_OWORD *)(v6 + 32);
      uint64_t v7 = *(void *)(v6 + 64);
      char v8 = *(unsigned char *)(v6 + 72);
      sub_253E47908();
      sub_253E4AEDC();
      sub_253E826A0();
      long long v27 = v24;
      long long v28 = v23;
      long long v29 = v20;
      long long v30 = v19;
      uint64_t v31 = v7;
      char v32 = v8;
      sub_253E47954();
    }
    else
    {
      uint64_t v15 = sub_253E46F68((uint64_t)v34);
      long long v21 = *(_OWORD *)(v15 + 16);
      long long v22 = *(_OWORD *)v15;
      uint64_t v16 = *(void *)(v15 + 32);
      uint64_t v17 = *(void *)(v15 + 40);
      sub_253E47870();
      sub_253E826A0();
      long long v27 = v22;
      long long v28 = v21;
      *(void *)&long long v29 = v16;
      *((void *)&v29 + 1) = v17;
      sub_253E478BC();
    }
    sub_253E82750();
    sub_253E4AE7C();
    v9();
    uint64_t v10 = sub_253E4AF18();
    v18(v10, v25);
  }
  else
  {
    long long v11 = (const void *)sub_253E46F68((uint64_t)v34);
    v26[0] = 0;
    sub_253E46D24(v33, &v27);
    uint64_t v12 = sub_253E46F68((uint64_t)&v27);
    sub_253E433EC(v12);
    sub_253E479A0();
    sub_253E826A0();
    memcpy(v26, v11, sizeof(v26));
    sub_253E479EC();
    sub_253E82750();
    sub_253E4AE7C();
    v13();
    sub_253E4AF18();
    sub_253E4AE7C();
    v14();
    sub_253E46D44((uint64_t)v33);
  }
  sub_253E45D2C();
}

unint64_t sub_253E47824()
{
  unint64_t result = qword_26B257968;
  if (!qword_26B257968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257968);
  }
  return result;
}

unint64_t sub_253E47870()
{
  unint64_t result = qword_26B257930;
  if (!qword_26B257930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257930);
  }
  return result;
}

unint64_t sub_253E478BC()
{
  unint64_t result = qword_26B257910;
  if (!qword_26B257910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257910);
  }
  return result;
}

unint64_t sub_253E47908()
{
  unint64_t result = qword_269D97660;
  if (!qword_269D97660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97660);
  }
  return result;
}

unint64_t sub_253E47954()
{
  unint64_t result = qword_269D97668;
  if (!qword_269D97668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97668);
  }
  return result;
}

unint64_t sub_253E479A0()
{
  unint64_t result = qword_269D97670;
  if (!qword_269D97670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97670);
  }
  return result;
}

unint64_t sub_253E479EC()
{
  unint64_t result = qword_269D97678;
  if (!qword_269D97678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97678);
  }
  return result;
}

void StructuredContext.Value.init(from:)()
{
  sub_253E45CF0();
  uint64_t v4 = v3;
  char v47 = v5;
  uint64_t v43 = sub_253E390C4(&qword_269D97680);
  sub_253E3B950();
  uint64_t v46 = v6;
  MEMORY[0x270FA5388]();
  char v48 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253E390C4(&qword_269D97688);
  sub_253E3B950();
  uint64_t v44 = v9;
  uint64_t v45 = v8;
  MEMORY[0x270FA5388]();
  sub_253E390C4(&qword_269D97690);
  sub_253E3B950();
  uint64_t v42 = v10;
  MEMORY[0x270FA5388]();
  sub_253E45DFC();
  uint64_t v11 = sub_253E390C4(&qword_269D97698);
  sub_253E3B950();
  uint64_t v49 = v12;
  MEMORY[0x270FA5388]();
  sub_253E4AEA0();
  uint64_t v13 = v4[3];
  uint64_t v50 = v4;
  sub_253E39108(v4, v13);
  sub_253E47824();
  sub_253E82850();
  if (v0) {
    goto LABEL_2;
  }
  uint64_t v40 = v1;
  uint64_t v15 = v2;
  uint64_t v16 = sub_253E82690();
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17)
  {
    uint64_t v14 = (uint64_t)v50;
LABEL_10:
    uint64_t v23 = v49;
    uint64_t v24 = sub_253E82520();
    swift_allocError();
    long long v26 = v25;
    sub_253E390C4(&qword_269D976A0);
    *long long v26 = &type metadata for StructuredContext.Value;
    sub_253E825D0();
    sub_253E82510();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, *MEMORY[0x263F8DCB0], v24);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v15, v11);
    goto LABEL_11;
  }
  uint64_t v41 = v2;
  uint64_t v39 = 0;
  int v18 = *(unsigned __int8 *)(v16 + 32);
  sub_253E4AD64(1, v17, v16, v16 + 32, 0, (2 * v17) | 1);
  uint64_t v20 = v19;
  unint64_t v22 = v21;
  swift_bridgeObjectRelease();
  if (v20 != v22 >> 1)
  {
    uint64_t v14 = (uint64_t)v50;
    uint64_t v15 = v41;
    goto LABEL_10;
  }
  if (v18)
  {
    if (v18 == 1)
    {
      LOBYTE(v52[0]) = 1;
      sub_253E47908();
      sub_253E4AEB8();
      sub_253E48C04();
      sub_253E82680();
      sub_253E4AF08();
      sub_253E4AE70();
      v29();
      swift_unknownObjectRelease();
      sub_253E4AEEC();
      v30();
      sub_253E4AE50(v51[0]);
      v52[6] = v31;
      *(_OWORD *)&v52[7] = *(_OWORD *)&v51[7];
      LOBYTE(v52[9]) = v32;
      sub_253E48C50((uint64_t)v52);
      sub_253E46D24(v52, v53);
      uint64_t v14 = (uint64_t)v50;
LABEL_17:
      sub_253E46D24(v53, v47);
      goto LABEL_11;
    }
    LOBYTE(v52[0]) = 2;
    sub_253E47870();
    sub_253E4AEB8();
    uint64_t v14 = (uint64_t)v50;
    sub_253E48B88();
    sub_253E4AEDC();
    sub_253E82680();
    sub_253E4AF08();
    sub_253E4AE70();
    v35();
    swift_unknownObjectRelease();
    sub_253E4AEEC();
    v36();
    sub_253E4AE50(v51[0]);
    sub_253E48BD4((uint64_t)v52);
    uint64_t v37 = v52;
LABEL_16:
    sub_253E46D24(v37, v53);
    goto LABEL_17;
  }
  LOBYTE(v52[0]) = 0;
  sub_253E479A0();
  sub_253E4AEDC();
  uint64_t v27 = v39;
  sub_253E825C0();
  if (!v27)
  {
    sub_253E48C80();
    sub_253E82680();
    sub_253E4AF08();
    uint64_t v14 = (uint64_t)v50;
    sub_253E4AE70();
    v33();
    swift_unknownObjectRelease();
    sub_253E4AEEC();
    v34();
    memcpy(v51, v52, 0x14AuLL);
    sub_253E48CCC((uint64_t)v51);
    uint64_t v37 = v51;
    goto LABEL_16;
  }
  swift_unknownObjectRelease();
  sub_253E4AE7C();
  v28();
LABEL_2:
  uint64_t v14 = (uint64_t)v50;
LABEL_11:
  sub_253E393E4(v14);
  sub_253E45D2C();
}

void sub_253E480CC()
{
}

void sub_253E480E4()
{
}

uint64_t static StructuredContext.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  sub_253E48FF4(a1, (uint64_t)v12, &qword_26B2578F0);
  sub_253E48FF4(a2, (uint64_t)v13, &qword_26B2578F0);
  sub_253E48FF4((uint64_t)v12, (uint64_t)v14, &qword_26B2578F0);
  if (sub_253E48CF8((uint64_t)v14) != 1)
  {
    sub_253E48FF4((uint64_t)v12, (uint64_t)__src, &qword_26B2578F0);
    sub_253E48FF4((uint64_t)v13, (uint64_t)v10, &qword_26B2578F0);
    if (sub_253E48CF8((uint64_t)v10) != 1)
    {
      sub_253E48FF4((uint64_t)v13, (uint64_t)v6, &qword_26B2578F0);
      sub_253E46D24(v6, v5);
      sub_253E48FF4((uint64_t)v12, (uint64_t)__dst, &qword_26B2578F0);
      sub_253E46614((uint64_t)v12);
      sub_253E46D44((uint64_t)__dst);
      char v3 = static StructuredContext.Value.== infix(_:_:)(__src, v5);
      sub_253E46D24(__src, v8);
      sub_253E46D44((uint64_t)v8);
      sub_253E46614((uint64_t)v12);
      return v3 & 1;
    }
    sub_253E46D24(__src, __dst);
    sub_253E48FF4((uint64_t)v12, (uint64_t)v8, &qword_26B2578F0);
    sub_253E46614((uint64_t)v12);
    sub_253E46D44((uint64_t)v8);
    sub_253E46D44((uint64_t)__dst);
    goto LABEL_6;
  }
  sub_253E48FF4((uint64_t)v13, (uint64_t)v10, &qword_26B2578F0);
  if (sub_253E48CF8((uint64_t)v10) != 1)
  {
LABEL_6:
    sub_253E48FF4((uint64_t)v12, (uint64_t)v10, &qword_26B2578F0);
    sub_253E48FF4((uint64_t)v13, (uint64_t)&v11, &qword_26B2578F0);
    sub_253E46614((uint64_t)v13);
    sub_253E48D0C((uint64_t)v10);
    char v3 = 0;
    return v3 & 1;
  }
  char v3 = 1;
  return v3 & 1;
}

uint64_t sub_253E48360()
{
  return 1;
}

uint64_t sub_253E48368()
{
  return sub_253E82810();
}

uint64_t sub_253E48390(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_253E82780();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_253E48410()
{
  return sub_253E82840();
}

uint64_t sub_253E48454()
{
  return 0x65756C6176;
}

uint64_t sub_253E48468()
{
  return sub_253E82840();
}

uint64_t sub_253E484AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E48390(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_253E484D8()
{
  return sub_253E38D88();
}

uint64_t sub_253E484F4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E48360();
  *a1 = result & 1;
  return result;
}

uint64_t sub_253E48520(uint64_t a1)
{
  unint64_t v2 = sub_253E48F08();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E4855C(uint64_t a1)
{
  unint64_t v2 = sub_253E48F08();

  return MEMORY[0x270FA00B8](a1, v2);
}

void StructuredContext.encode(to:)()
{
  sub_253E45CF0();
  char v3 = v2;
  uint64_t v4 = sub_253E390C4(&qword_26B257990);
  sub_253E3B950();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  sub_253E4AE88();
  sub_253E48FF4(v0, (uint64_t)v8, &qword_26B2578F0);
  sub_253E39108(v3, v3[3]);
  sub_253E48F08();
  sub_253E82860();
  sub_253E48FF4((uint64_t)v8, (uint64_t)&v7, &qword_26B2578F0);
  sub_253E48F54();
  sub_253E826F0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v4);
  sub_253E45D2C();
}

void StructuredContext.init(from:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  uint64_t v9 = v3;
  sub_253E390C4(&qword_269D976C0);
  sub_253E3B950();
  MEMORY[0x270FA5388]();
  sub_253E45F88();
  sub_253E39108(v2, v2[3]);
  sub_253E48F08();
  sub_253E82850();
  if (!v0)
  {
    sub_253E48FA0();
    sub_253E82620();
    uint64_t v4 = sub_253E4AF28();
    v5(v4);
    sub_253E48FF4((uint64_t)&v8, (uint64_t)v6, &qword_26B2578F0);
    sub_253E48FF4((uint64_t)v6, (uint64_t)v7, &qword_26B2578F0);
    memcpy(v9, v7, 0x14AuLL);
  }
  sub_253E393E4((uint64_t)v2);
  sub_253E45D2C();
}

void sub_253E48818()
{
}

void sub_253E48830()
{
}

uint64_t StructuredContext.init(_:)@<X0>(void *__src@<X0>, uint64_t a2@<X8>)
{
  memcpy(v4, __src, 0x14AuLL);
  sub_253E48CCC((uint64_t)v4);
  sub_253E46D24(v4, __dst);
  nullsub_1(__dst);
  return sub_253E48FF4((uint64_t)__dst, a2, &qword_26B2578F0);
}

uint64_t StructuredContext.init(_:)@<X0>(uint64_t a1@<X8>)
{
  sub_253E4AEF8();
  v9[0] = v2;
  v9[1] = v3;
  long long v5 = v4[2];
  long long v10 = v4[1];
  long long v11 = v5;
  uint64_t v12 = v6;
  long long v13 = *(_OWORD *)((char *)v4 + 56);
  char v14 = v7;
  sub_253E48C50((uint64_t)v9);
  sub_253E46D24(v9, __dst);
  nullsub_1(__dst);
  return sub_253E48FF4((uint64_t)__dst, a1, &qword_26B2578F0);
}

uint64_t StructuredContext.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v3;
  long long v4 = *(_OWORD *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 16);
  long long v8 = v4;
  sub_253E48BD4((uint64_t)v6);
  sub_253E46D24(v6, __dst);
  nullsub_1(__dst);
  return sub_253E48FF4((uint64_t)__dst, a2, &qword_26B2578F0);
}

uint64_t StructuredContext.siriRequestContext.getter@<X0>(uint64_t a1@<X8>)
{
  sub_253E48FF4(v1, (uint64_t)v8, &qword_26B2578F0);
  sub_253E48FF4((uint64_t)v8, (uint64_t)__src, &qword_26B2578F0);
  if (sub_253E48CF8((uint64_t)__src) == 1
    || (sub_253E46D24(__src, __dst), sub_253E46D38((uint64_t)__dst)))
  {
    sub_253E48FEC(__dst);
    return sub_253E48FF4((uint64_t)__dst, a1, &qword_269D976D0);
  }
  else
  {
    long long v4 = (const void *)sub_253E46F68((uint64_t)__dst);
    memcpy(v5, v4, 0x14AuLL);
    nullsub_1(v5);
    sub_253E48FF4((uint64_t)v5, a1, &qword_269D976D0);
    sub_253E48FF4((uint64_t)v8, (uint64_t)v6, &qword_26B2578F0);
    return sub_253E46D44((uint64_t)v6);
  }
}

double StructuredContext.intelligenceCommand.getter@<D0>(uint64_t a1@<X8>)
{
  sub_253E48FF4(v1, (uint64_t)v12, &qword_26B2578F0);
  sub_253E48FF4((uint64_t)v12, (uint64_t)__src, &qword_26B2578F0);
  if (sub_253E48CF8((uint64_t)__src) == 1
    || (sub_253E46D24(__src, __dst), sub_253E46D38((uint64_t)__dst) != 1))
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 57) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  else
  {
    sub_253E46F68((uint64_t)__dst);
    sub_253E4AEF8();
    *(void *)a1 = v3;
    *(void *)(a1 + 8) = v4;
    long long v6 = v5[2];
    *(_OWORD *)(a1 + 16) = v5[1];
    *(_OWORD *)(a1 + 32) = v6;
    *(void *)(a1 + 48) = v7;
    *(_OWORD *)(a1 + 56) = *(_OWORD *)((char *)v5 + 56);
    *(unsigned char *)(a1 + 72) = v8;
    sub_253E48FF4((uint64_t)v12, (uint64_t)v10, &qword_26B2578F0);
    sub_253E46D44((uint64_t)v10);
  }
  return result;
}

unint64_t sub_253E48B88()
{
  unint64_t result = qword_269D976A8;
  if (!qword_269D976A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D976A8);
  }
  return result;
}

uint64_t sub_253E48BD4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 192) & 0xFFFFFFFFFFLL;
  uint64_t v2 = *(void *)(result + 208) & 1;
  unint64_t v3 = *(unsigned __int16 *)(result + 232) | 0x8000000000000000;
  *(void *)(result + 104) = *(unsigned __int16 *)(result + 104);
  *(void *)(result + 192) = v1;
  *(void *)(result + 208) = v2;
  *(void *)(result + 232) = v3;
  return result;
}

unint64_t sub_253E48C04()
{
  unint64_t result = qword_269D976B0;
  if (!qword_269D976B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D976B0);
  }
  return result;
}

uint64_t sub_253E48C50(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 192) & 0xFFFFFFFFFFLL;
  uint64_t v2 = *(void *)(result + 208) & 1;
  uint64_t v3 = *(unsigned __int16 *)(result + 232) | 0x4000000000000000;
  *(void *)(result + 104) = *(unsigned __int16 *)(result + 104);
  *(void *)(result + 192) = v1;
  *(void *)(result + 208) = v2;
  *(void *)(result + 232) = v3;
  return result;
}

unint64_t sub_253E48C80()
{
  unint64_t result = qword_269D976B8;
  if (!qword_269D976B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D976B8);
  }
  return result;
}

uint64_t sub_253E48CCC(uint64_t result)
{
  uint64_t v1 = *(unsigned __int16 *)(result + 232);
  uint64_t v2 = *(void *)(result + 192) & 0xFFFFFFFFFFLL;
  uint64_t v3 = *(void *)(result + 208) & 1;
  *(void *)(result + 104) = *(unsigned __int16 *)(result + 104);
  *(void *)(result + 192) = v2;
  *(void *)(result + 208) = v3;
  *(void *)(result + 232) = v1;
  return result;
}

uint64_t sub_253E48CF8(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 106);
  if (v1 > 0x80000000) {
    return -v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_253E48D0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 352);
  uint64_t v34 = *(void *)(a1 + 344);
  uint64_t v35 = *(void *)(a1 + 336);
  uint64_t v3 = *(void *)(a1 + 360);
  uint64_t v4 = *(void *)(a1 + 368);
  uint64_t v5 = *(void *)(a1 + 376);
  uint64_t v6 = *(void *)(a1 + 384);
  uint64_t v7 = *(void *)(a1 + 392);
  long long v32 = *(_OWORD *)(a1 + 416);
  long long v33 = *(_OWORD *)(a1 + 400);
  long long v30 = *(_OWORD *)(a1 + 448);
  long long v31 = *(_OWORD *)(a1 + 432);
  long long v28 = *(_OWORD *)(a1 + 480);
  long long v29 = *(_OWORD *)(a1 + 464);
  long long v26 = *(_OWORD *)(a1 + 512);
  long long v27 = *(_OWORD *)(a1 + 496);
  long long v25 = *(_OWORD *)(a1 + 528);
  long long v23 = *(_OWORD *)(a1 + 560);
  long long v24 = *(_OWORD *)(a1 + 544);
  long long v21 = *(_OWORD *)(a1 + 592);
  long long v22 = *(_OWORD *)(a1 + 576);
  long long v19 = *(_OWORD *)(a1 + 624);
  long long v20 = *(_OWORD *)(a1 + 608);
  long long v18 = *(_OWORD *)(a1 + 640);
  uint64_t v8 = *(void *)(a1 + 656);
  __int16 v9 = *(_WORD *)(a1 + 664);
  LOWORD(v16) = *(_WORD *)(a1 + 328);
  long long v14 = *(_OWORD *)(a1 + 288);
  long long v15 = *(_OWORD *)(a1 + 304);
  long long v12 = *(_OWORD *)(a1 + 256);
  long long v13 = *(_OWORD *)(a1 + 272);
  long long v11 = *(_OWORD *)(a1 + 224);
  sub_253E4665C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v11,
    *((unint64_t *)&v11 + 1),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    v12,
    *((uint64_t *)&v12 + 1),
    v13,
    *((uint64_t *)&v13 + 1),
    v14,
    *((uint64_t *)&v14 + 1),
    v15,
    *((uint64_t *)&v15 + 1),
    *(void *)(a1 + 320),
    v16,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_253E467E8);
  LOWORD(v17) = v9;
  sub_253E4665C(v35, v34, v2, v3, v4, v5, v6, v7, v33, *((uint64_t *)&v33 + 1), v32, *((uint64_t *)&v32 + 1), v31, *((unint64_t *)&v31 + 1), v30, *((uint64_t *)&v30 + 1), v29, *((uint64_t *)&v29 + 1), v28,
    *((uint64_t *)&v28 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    v24,
    *((uint64_t *)&v24 + 1),
    v23,
    *((unint64_t *)&v23 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v21,
    *((uint64_t *)&v21 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    v8,
    v17,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_253E467E8);
  return a1;
}

unint64_t sub_253E48F08()
{
  unint64_t result = qword_26B257918;
  if (!qword_26B257918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257918);
  }
  return result;
}

unint64_t sub_253E48F54()
{
  unint64_t result = qword_26B257980;
  if (!qword_26B257980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257980);
  }
  return result;
}

unint64_t sub_253E48FA0()
{
  unint64_t result = qword_269D976C8;
  if (!qword_269D976C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D976C8);
  }
  return result;
}

void sub_253E48FEC(void *a1)
{
}

uint64_t sub_253E48FF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_253E390C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void destroy for StructuredContext(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 104);
  unint64_t v2 = *(void *)(a1 + 192);
  unint64_t v3 = *(void *)(a1 + 208);
  unint64_t v4 = *(void *)(a1 + 232);
  BOOL v6 = v1 >> 16 != 0xFFFFFFFF || v2 >> 40 != 0 || v3 > 1;
  if (v6 || v4 >= 0x10000)
  {
    long long v8 = *(_OWORD *)(a1 + 288);
    long long v9 = *(_OWORD *)(a1 + 304);
    long long v7 = *(_OWORD *)(a1 + 256);
    sub_253E467E8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), v1, *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
      *(void *)(a1 + 152),
      *(void *)(a1 + 160),
      *(void *)(a1 + 168),
      *(void *)(a1 + 176),
      *(void *)(a1 + 184),
      v2,
      *(void *)(a1 + 200),
      v3,
      *(void *)(a1 + 216),
      *(void *)(a1 + 224),
      v4,
      *(void *)(a1 + 240),
      *(void *)(a1 + 248),
      v7,
      *((uint64_t *)&v7 + 1),
      *(void *)(a1 + 272),
      *(void *)(a1 + 280),
      v8,
      *((uint64_t *)&v8 + 1),
      v9,
      *((uint64_t *)&v9 + 1),
      *(void *)(a1 + 320));
  }
}

uint64_t *initializeWithCopy for StructuredContext(uint64_t *__dst, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 104);
  BOOL v5 = v3 >> 16 != 0xFFFFFFFF || *(void *)(a2 + 192) >> 40 != 0 || *(void *)(a2 + 208) > 1uLL;
  if (v5 || *(void *)(a2 + 232) >= 0x10000uLL)
  {
    uint64_t v47 = *(void *)(a2 + 72);
    uint64_t v48 = *(void *)(a2 + 80);
    uint64_t v45 = *(void *)(a2 + 88);
    uint64_t v46 = *(void *)(a2 + 96);
    uint64_t v44 = *(void *)(a2 + 112);
    unint64_t v17 = *(void *)(a2 + 120);
    uint64_t v18 = *(void *)(a2 + 128);
    uint64_t v19 = *(void *)(a2 + 136);
    uint64_t v20 = *(void *)(a2 + 144);
    uint64_t v21 = *(void *)(a2 + 152);
    uint64_t v22 = *(void *)(a2 + 160);
    uint64_t v23 = *(void *)(a2 + 168);
    uint64_t v24 = *(void *)(a2 + 176);
    uint64_t v25 = *(void *)(a2 + 184);
    uint64_t v26 = *(void *)(a2 + 192);
    uint64_t v27 = *(void *)(a2 + 200);
    uint64_t v28 = *(void *)(a2 + 208);
    uint64_t v29 = *(void *)(a2 + 216);
    uint64_t v30 = *(void *)(a2 + 224);
    unint64_t v31 = *(void *)(a2 + 232);
    uint64_t v32 = *(void *)(a2 + 240);
    uint64_t v33 = *(void *)(a2 + 248);
    uint64_t v34 = *(void *)(a2 + 256);
    uint64_t v35 = *(void *)(a2 + 264);
    uint64_t v36 = *(void *)(a2 + 272);
    uint64_t v37 = *(void *)(a2 + 280);
    uint64_t v38 = *(void *)(a2 + 288);
    uint64_t v39 = *(void *)(a2 + 296);
    uint64_t v40 = *(void *)(a2 + 304);
    uint64_t v41 = *(void *)(a2 + 312);
    uint64_t v42 = *(void *)(a2 + 320);
    __int16 v43 = *(_WORD *)(a2 + 328);
    uint64_t v16 = *(void *)(a2 + 104);
    uint64_t v6 = *(void *)(a2 + 64);
    uint64_t v7 = *(void *)(a2 + 8);
    uint64_t v8 = *(void *)a2;
    uint64_t v9 = *(void *)(a2 + 24);
    uint64_t v10 = *(void *)(a2 + 16);
    uint64_t v11 = *(void *)(a2 + 40);
    uint64_t v12 = *(void *)(a2 + 32);
    uint64_t v13 = *(void *)(a2 + 56);
    uint64_t v14 = *(void *)(a2 + 48);
    sub_253E46340(*(void *)a2, v7, v10, v9, v12, v11, v14, v13, v6, v47, v48, v45, v46, v3, v44, v17, v18, v19, v20,
      v21,
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38,
      v39,
      v40,
      v41,
      v42);
    *__dst = v8;
    __dst[1] = v7;
    __dst[2] = v10;
    __dst[3] = v9;
    __dst[4] = v12;
    __dst[5] = v11;
    __dst[6] = v14;
    __dst[7] = v13;
    __dst[8] = v6;
    __dst[9] = v47;
    __dst[10] = v48;
    __dst[11] = v45;
    __dst[12] = v46;
    __dst[13] = v16;
    __dst[14] = v44;
    __dst[15] = v17;
    __dst[16] = v18;
    __dst[17] = v19;
    __dst[18] = v20;
    __dst[19] = v21;
    __dst[20] = v22;
    __dst[21] = v23;
    __dst[22] = v24;
    __dst[23] = v25;
    __dst[24] = v26;
    __dst[25] = v27;
    __dst[26] = v28;
    __dst[27] = v29;
    __dst[28] = v30;
    __dst[29] = v31;
    __dst[30] = v32;
    __dst[31] = v33;
    __dst[32] = v34;
    __dst[33] = v35;
    __dst[34] = v36;
    __dst[35] = v37;
    __dst[36] = v38;
    __dst[37] = v39;
    __dst[38] = v40;
    __dst[39] = v41;
    __dst[40] = v42;
    *((_WORD *)__dst + 164) = v43;
  }
  else
  {
    memcpy(__dst, (const void *)a2, 0x14AuLL);
  }
  return __dst;
}

uint64_t *assignWithCopy for StructuredContext(uint64_t *__dst, void *__src)
{
  unint64_t v4 = __src[13];
  unint64_t v5 = __src[26];
  BOOL v9 = v4 >> 16 == 0xFFFFFFFF && __src[24] >> 40 == 0 && v5 < 2 && __src[29] < 0x10000uLL;
  BOOL v11 = (unint64_t)__dst[13] >> 16 != 0xFFFFFFFF
     || (unint64_t)__dst[24] >> 40 != 0
     || (unint64_t)__dst[26] > 1;
  if (v11 || (unint64_t)__dst[29] >= 0x10000)
  {
    if (!v9)
    {
      unint64_t v119 = __src[29];
      uint64_t v117 = __src[26];
      uint64_t v115 = __src[24];
      uint64_t v107 = __src[9];
      uint64_t v109 = __src[8];
      uint64_t v104 = __src[11];
      uint64_t v105 = __src[10];
      uint64_t v102 = __src[12];
      uint64_t v113 = __src[14];
      unint64_t v57 = __src[15];
      uint64_t v59 = __src[16];
      uint64_t v61 = __src[17];
      uint64_t v63 = __src[18];
      uint64_t v65 = __src[19];
      uint64_t v67 = __src[20];
      uint64_t v69 = __src[21];
      uint64_t v71 = __src[22];
      uint64_t v111 = __src[23];
      uint64_t v80 = __src[25];
      uint64_t v82 = __src[27];
      uint64_t v83 = __src[28];
      uint64_t v84 = __src[30];
      uint64_t v85 = __src[31];
      uint64_t v86 = __src[32];
      uint64_t v87 = __src[33];
      uint64_t v88 = __src[34];
      uint64_t v89 = __src[35];
      uint64_t v90 = __src[36];
      uint64_t v92 = __src[37];
      uint64_t v94 = __src[38];
      uint64_t v96 = __src[39];
      uint64_t v98 = __src[40];
      __int16 v100 = *((_WORD *)__src + 164);
      uint64_t v22 = __src[1];
      uint64_t v21 = *__src;
      uint64_t v23 = __src[3];
      uint64_t v24 = __src[2];
      uint64_t v26 = __src[5];
      uint64_t v25 = __src[4];
      uint64_t v28 = __src[7];
      uint64_t v27 = __src[6];
      sub_253E46340(*__src, v22, v24, v23, v25, v26, v27, v28, v109, v107, v105, v104, v102, v4, v113, v57, v59, v61, v63,
        v65,
        v67,
        v69,
        v71,
        v111,
        v115,
        v80,
        v117,
        v82,
        v83,
        v119,
        v84,
        v85,
        v86,
        v87,
        v88,
        v89,
        v90,
        v92,
        v94,
        v96,
        v98);
      uint64_t v29 = *__dst;
      uint64_t v30 = __dst[1];
      *__dst = v21;
      __dst[1] = v22;
      uint64_t v31 = __dst[2];
      uint64_t v32 = __dst[3];
      __dst[2] = v24;
      __dst[3] = v23;
      uint64_t v33 = __dst[4];
      uint64_t v34 = __dst[5];
      __dst[4] = v25;
      __dst[5] = v26;
      uint64_t v35 = __dst[6];
      uint64_t v36 = __dst[7];
      __dst[6] = v27;
      __dst[7] = v28;
      long long v37 = *((_OWORD *)__dst + 4);
      long long v38 = *((_OWORD *)__dst + 5);
      __dst[8] = v109;
      __dst[9] = v107;
      __dst[10] = v105;
      __dst[11] = v104;
      long long v39 = *((_OWORD *)__dst + 6);
      long long v40 = *((_OWORD *)__dst + 7);
      __dst[12] = v102;
      __dst[13] = v4;
      __dst[14] = v113;
      __dst[15] = v57;
      long long v41 = *((_OWORD *)__dst + 8);
      long long v42 = *((_OWORD *)__dst + 9);
      __dst[16] = v59;
      __dst[17] = v61;
      __dst[18] = v63;
      __dst[19] = v65;
      long long v43 = *((_OWORD *)__dst + 10);
      long long v44 = *((_OWORD *)__dst + 11);
      __dst[20] = v67;
      __dst[21] = v69;
      __dst[22] = v71;
      __dst[23] = v111;
      long long v45 = *((_OWORD *)__dst + 12);
      long long v46 = *((_OWORD *)__dst + 13);
      __dst[24] = v115;
      __dst[25] = v80;
      __dst[26] = v117;
      __dst[27] = v82;
      long long v47 = *((_OWORD *)__dst + 14);
      long long v48 = *((_OWORD *)__dst + 15);
      __dst[28] = v83;
      __dst[29] = v119;
      __dst[30] = v84;
      __dst[31] = v85;
      long long v49 = *((_OWORD *)__dst + 16);
      long long v50 = *((_OWORD *)__dst + 17);
      __dst[32] = v86;
      __dst[33] = v87;
      __dst[34] = v88;
      __dst[35] = v89;
      long long v51 = *((_OWORD *)__dst + 18);
      long long v52 = *((_OWORD *)__dst + 19);
      __dst[36] = v90;
      __dst[37] = v92;
      __dst[38] = v94;
      __dst[39] = v96;
      uint64_t v53 = __dst[40];
      __dst[40] = v98;
      *((_WORD *)__dst + 164) = v100;
      sub_253E467E8(v29, v30, v31, v32, v33, v34, v35, v36, v37, *((uint64_t *)&v37 + 1), v38, *((uint64_t *)&v38 + 1), v39, *((uint64_t *)&v39 + 1), v40, *((unint64_t *)&v40 + 1), v41, *((uint64_t *)&v41 + 1), v42,
        *((uint64_t *)&v42 + 1),
        v43,
        *((uint64_t *)&v43 + 1),
        v44,
        *((uint64_t *)&v44 + 1),
        v45,
        *((uint64_t *)&v45 + 1),
        v46,
        *((uint64_t *)&v46 + 1),
        v47,
        *((unint64_t *)&v47 + 1),
        v48,
        *((uint64_t *)&v48 + 1),
        v49,
        *((uint64_t *)&v49 + 1),
        v50,
        *((uint64_t *)&v50 + 1),
        v51,
        *((uint64_t *)&v51 + 1),
        v52,
        *((uint64_t *)&v52 + 1),
        v53);
      return __dst;
    }
    sub_253E49A98((uint64_t)__dst);
    goto LABEL_25;
  }
  if (v9)
  {
LABEL_25:
    memcpy(__dst, __src, 0x14AuLL);
    return __dst;
  }
  long long v103 = *((_OWORD *)__src + 6);
  uint64_t v106 = __src[10];
  uint64_t v108 = __src[9];
  uint64_t v55 = __src[11];
  uint64_t v112 = __src[14];
  unint64_t v56 = __src[15];
  uint64_t v58 = __src[16];
  uint64_t v60 = __src[17];
  uint64_t v62 = __src[18];
  uint64_t v64 = __src[19];
  uint64_t v66 = __src[20];
  uint64_t v68 = __src[21];
  uint64_t v70 = __src[22];
  uint64_t v110 = __src[23];
  uint64_t v72 = __src[25];
  uint64_t v73 = __src[27];
  uint64_t v74 = __src[28];
  uint64_t v75 = __src[30];
  uint64_t v76 = __src[31];
  uint64_t v77 = __src[32];
  uint64_t v78 = __src[33];
  uint64_t v79 = __src[34];
  uint64_t v81 = __src[35];
  uint64_t v91 = __src[36];
  uint64_t v93 = __src[37];
  uint64_t v95 = __src[38];
  uint64_t v97 = __src[39];
  uint64_t v99 = __src[40];
  __int16 v101 = *((_WORD *)__src + 164);
  unint64_t v118 = __src[29];
  uint64_t v116 = __src[26];
  uint64_t v114 = __src[24];
  uint64_t v12 = __src[8];
  uint64_t v13 = __src[1];
  uint64_t v14 = *__src;
  uint64_t v15 = __src[3];
  uint64_t v16 = __src[2];
  uint64_t v18 = __src[5];
  uint64_t v17 = __src[4];
  uint64_t v19 = __src[7];
  uint64_t v20 = __src[6];
  sub_253E46340(*__src, v13, v16, v15, v17, v18, v20, v19, v12, v108, v106, v55, v103, *((uint64_t *)&v103 + 1), v112, v56, v58, v60, v62,
    v64,
    v66,
    v68,
    v70,
    v110,
    v114,
    v72,
    v5,
    v73,
    v74,
    v118,
    v75,
    v76,
    v77,
    v78,
    v79,
    v81,
    v91,
    v93,
    v95,
    v97,
    v99);
  *__dst = v14;
  __dst[1] = v13;
  __dst[2] = v16;
  __dst[3] = v15;
  __dst[4] = v17;
  __dst[5] = v18;
  __dst[6] = v20;
  __dst[7] = v19;
  __dst[8] = v12;
  __dst[9] = v108;
  __dst[10] = v106;
  __dst[11] = v55;
  *((_OWORD *)__dst + 6) = v103;
  __dst[14] = v112;
  __dst[15] = v56;
  __dst[16] = v58;
  __dst[17] = v60;
  __dst[18] = v62;
  __dst[19] = v64;
  __dst[20] = v66;
  __dst[21] = v68;
  __dst[22] = v70;
  __dst[23] = v110;
  __dst[24] = v114;
  __dst[25] = v72;
  __dst[26] = v116;
  __dst[27] = v73;
  __dst[28] = v74;
  __dst[29] = v118;
  __dst[30] = v75;
  __dst[31] = v76;
  __dst[32] = v77;
  __dst[33] = v78;
  __dst[34] = v79;
  __dst[35] = v81;
  __dst[36] = v91;
  __dst[37] = v93;
  __dst[38] = v95;
  __dst[39] = v97;
  __dst[40] = v99;
  *((_WORD *)__dst + 164) = v101;
  return __dst;
}

uint64_t sub_253E49A98(uint64_t a1)
{
  return a1;
}

char *assignWithTake for StructuredContext(char *__dst, char *__src)
{
  unint64_t v4 = *((void *)__dst + 13);
  unint64_t v5 = *((void *)__dst + 24);
  unint64_t v6 = *((void *)__dst + 26);
  unint64_t v7 = *((void *)__dst + 29);
  unint64_t v8 = *((void *)__src + 13);
  unint64_t v9 = *((void *)__src + 24);
  unint64_t v10 = *((void *)__src + 26);
  unint64_t v11 = *((void *)__src + 29);
  BOOL v13 = v4 >> 16 != 0xFFFFFFFF || v5 >> 40 != 0 || v6 > 1;
  if (v13 || v7 >= 0x10000)
  {
    BOOL v15 = v8 >> 16 != 0xFFFFFFFF || v9 >> 40 != 0 || v10 > 1;
    if (v15 || v11 >= 0x10000)
    {
      uint64_t v16 = *((void *)__src + 12);
      uint64_t v17 = *((void *)__src + 25);
      uint64_t v18 = *((void *)__src + 40);
      __int16 v19 = *((_WORD *)__src + 164);
      uint64_t v20 = *((void *)__dst + 1);
      uint64_t v53 = *(void *)__dst;
      uint64_t v21 = *((void *)__dst + 2);
      uint64_t v22 = *((void *)__dst + 3);
      uint64_t v23 = *((void *)__dst + 4);
      uint64_t v24 = *((void *)__dst + 5);
      uint64_t v25 = *((void *)__dst + 6);
      uint64_t v26 = *((void *)__dst + 7);
      long long v27 = *((_OWORD *)__dst + 4);
      long long v28 = *((_OWORD *)__dst + 5);
      uint64_t v29 = *((void *)__dst + 12);
      long long v30 = *((_OWORD *)__dst + 7);
      long long v31 = *((_OWORD *)__dst + 8);
      long long v32 = *((_OWORD *)__dst + 9);
      long long v33 = *((_OWORD *)__dst + 10);
      uint64_t v34 = *((void *)__dst + 22);
      uint64_t v35 = *((void *)__dst + 23);
      uint64_t v36 = *((void *)__dst + 25);
      uint64_t v37 = *((void *)__dst + 27);
      uint64_t v38 = *((void *)__dst + 28);
      long long v39 = *((_OWORD *)__dst + 15);
      long long v40 = *((_OWORD *)__dst + 16);
      long long v41 = *((_OWORD *)__dst + 17);
      long long v42 = *((_OWORD *)__dst + 18);
      long long v43 = *((_OWORD *)__dst + 19);
      uint64_t v44 = *((void *)__dst + 40);
      long long v45 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v45;
      long long v46 = *((_OWORD *)__src + 3);
      *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
      *((_OWORD *)__dst + 3) = v46;
      long long v47 = *((_OWORD *)__src + 5);
      *((_OWORD *)__dst + 4) = *((_OWORD *)__src + 4);
      *((_OWORD *)__dst + 5) = v47;
      *((void *)__dst + 12) = v16;
      *((void *)__dst + 13) = v8;
      long long v48 = *((_OWORD *)__src + 8);
      *((_OWORD *)__dst + 7) = *((_OWORD *)__src + 7);
      *((_OWORD *)__dst + 8) = v48;
      long long v49 = *((_OWORD *)__src + 10);
      *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
      *((_OWORD *)__dst + 10) = v49;
      *((_OWORD *)__dst + 11) = *((_OWORD *)__src + 11);
      *((void *)__dst + 24) = v9;
      *((void *)__dst + 25) = v17;
      *((void *)__dst + 26) = v10;
      *(_OWORD *)(__dst + 216) = *(_OWORD *)(__src + 216);
      *((void *)__dst + 29) = v11;
      long long v50 = *((_OWORD *)__src + 16);
      *((_OWORD *)__dst + 15) = *((_OWORD *)__src + 15);
      *((_OWORD *)__dst + 16) = v50;
      long long v51 = *((_OWORD *)__src + 18);
      *((_OWORD *)__dst + 17) = *((_OWORD *)__src + 17);
      *((_OWORD *)__dst + 18) = v51;
      *((_OWORD *)__dst + 19) = *((_OWORD *)__src + 19);
      *((void *)__dst + 40) = v18;
      *((_WORD *)__dst + 164) = v19;
      sub_253E467E8(v53, v20, v21, v22, v23, v24, v25, v26, v27, *((uint64_t *)&v27 + 1), v28, *((uint64_t *)&v28 + 1), v29, v4, v30, *((unint64_t *)&v30 + 1), v31, *((uint64_t *)&v31 + 1), v32,
        *((uint64_t *)&v32 + 1),
        v33,
        *((uint64_t *)&v33 + 1),
        v34,
        v35,
        v5,
        v36,
        v6,
        v37,
        v38,
        v7,
        v39,
        *((uint64_t *)&v39 + 1),
        v40,
        *((uint64_t *)&v40 + 1),
        v41,
        *((uint64_t *)&v41 + 1),
        v42,
        *((uint64_t *)&v42 + 1),
        v43,
        *((uint64_t *)&v43 + 1),
        v44);
      return __dst;
    }
    sub_253E49A98((uint64_t)__dst);
  }
  memcpy(__dst, __src, 0x14AuLL);
  return __dst;
}

uint64_t getEnumTagSinglePayload for StructuredContext(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 330))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unsigned int v3 = *(_DWORD *)(a1 + 106);
      int v4 = -2 - v3;
      if ((int)(-2 - v3) < 0) {
        int v4 = -1;
      }
      if (v3 <= 0x80000000) {
        int v2 = -1;
      }
      else {
        int v2 = v4;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

void storeEnumTagSinglePayload for StructuredContext(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(a1 + 248) = 0u;
    *(_OWORD *)(a1 + 232) = 0u;
    *(_OWORD *)(a1 + 216) = 0u;
    *(_OWORD *)(a1 + 200) = 0u;
    *(_OWORD *)(a1 + 184) = 0u;
    *(_OWORD *)(a1 + 168) = 0u;
    *(_OWORD *)(a1 + 152) = 0u;
    *(_OWORD *)(a1 + 136) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_WORD *)(a1 + 328) = 0;
    *(_OWORD *)(a1 + 312) = 0u;
    *(_OWORD *)(a1 + 296) = 0u;
    *(_OWORD *)(a1 + 280) = 0u;
    *(_OWORD *)(a1 + 264) = 0u;
    *(void *)a1 = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(a1 + 330) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(a1 + 330) = 0;
    }
    if (a2)
    {
      *(_OWORD *)(a1 + 64) = 0u;
      *(_OWORD *)(a1 + 80) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 96) = 0;
      *(void *)(a1 + 104) = (unint64_t)~a2 << 16;
      bzero((void *)(a1 + 112), 0xDAuLL);
    }
  }
}

ValueMetadata *type metadata accessor for StructuredContext()
{
  return &type metadata for StructuredContext;
}

void destroy for StructuredContext.Value(uint64_t a1)
{
  long long v4 = *(_OWORD *)(a1 + 288);
  long long v5 = *(_OWORD *)(a1 + 304);
  long long v2 = *(_OWORD *)(a1 + 256);
  long long v3 = *(_OWORD *)(a1 + 272);
  long long v1 = *(_OWORD *)(a1 + 224);
  sub_253E467E8(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v1,
    *((unint64_t *)&v1 + 1),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    v2,
    *((uint64_t *)&v2 + 1),
    v3,
    *((uint64_t *)&v3 + 1),
    v4,
    *((uint64_t *)&v4 + 1),
    v5,
    *((uint64_t *)&v5 + 1),
    *(void *)(a1 + 320));
}

uint64_t initializeWithCopy for StructuredContext.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *(void *)(a2 + 72);
  uint64_t v45 = *(void *)(a2 + 64);
  uint64_t v42 = *(void *)(a2 + 88);
  uint64_t v43 = *(void *)(a2 + 80);
  uint64_t v40 = *(void *)(a2 + 104);
  uint64_t v41 = *(void *)(a2 + 96);
  uint64_t v13 = *(void *)(a2 + 112);
  unint64_t v14 = *(void *)(a2 + 120);
  uint64_t v15 = *(void *)(a2 + 128);
  uint64_t v16 = *(void *)(a2 + 136);
  uint64_t v17 = *(void *)(a2 + 144);
  uint64_t v18 = *(void *)(a2 + 152);
  uint64_t v19 = *(void *)(a2 + 160);
  uint64_t v20 = *(void *)(a2 + 168);
  uint64_t v21 = *(void *)(a2 + 176);
  uint64_t v22 = *(void *)(a2 + 184);
  uint64_t v3 = *(void *)(a2 + 200);
  uint64_t v23 = *(void *)(a2 + 192);
  uint64_t v24 = *(void *)(a2 + 208);
  uint64_t v25 = *(void *)(a2 + 216);
  uint64_t v26 = *(void *)(a2 + 224);
  unint64_t v27 = *(void *)(a2 + 232);
  uint64_t v28 = *(void *)(a2 + 240);
  uint64_t v29 = *(void *)(a2 + 248);
  uint64_t v30 = *(void *)(a2 + 256);
  uint64_t v31 = *(void *)(a2 + 264);
  uint64_t v32 = *(void *)(a2 + 272);
  uint64_t v33 = *(void *)(a2 + 280);
  uint64_t v34 = *(void *)(a2 + 288);
  uint64_t v35 = *(void *)(a2 + 296);
  uint64_t v36 = *(void *)(a2 + 304);
  uint64_t v37 = *(void *)(a2 + 312);
  uint64_t v38 = *(void *)(a2 + 320);
  __int16 v39 = *(_WORD *)(a2 + 328);
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 48);
  sub_253E46340(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v45, v44, v43, v42, v41, v40, v13, v14, v15, v16, v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v3,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v45;
  *(void *)(a1 + 72) = v44;
  *(void *)(a1 + 80) = v43;
  *(void *)(a1 + 88) = v42;
  *(void *)(a1 + 96) = v41;
  *(void *)(a1 + 104) = v40;
  *(void *)(a1 + 112) = v13;
  *(void *)(a1 + 120) = v14;
  *(void *)(a1 + 128) = v15;
  *(void *)(a1 + 136) = v16;
  *(void *)(a1 + 144) = v17;
  *(void *)(a1 + 152) = v18;
  *(void *)(a1 + 160) = v19;
  *(void *)(a1 + 168) = v20;
  *(void *)(a1 + 176) = v21;
  *(void *)(a1 + 184) = v22;
  *(void *)(a1 + 192) = v23;
  *(void *)(a1 + 200) = v3;
  *(void *)(a1 + 208) = v24;
  *(void *)(a1 + 216) = v25;
  *(void *)(a1 + 224) = v26;
  *(void *)(a1 + 232) = v27;
  *(void *)(a1 + 240) = v28;
  *(void *)(a1 + 248) = v29;
  *(void *)(a1 + 256) = v30;
  *(void *)(a1 + 264) = v31;
  *(void *)(a1 + 272) = v32;
  *(void *)(a1 + 280) = v33;
  *(void *)(a1 + 288) = v34;
  *(void *)(a1 + 296) = v35;
  *(void *)(a1 + 304) = v36;
  *(void *)(a1 + 312) = v37;
  *(void *)(a1 + 320) = v38;
  *(_WORD *)(a1 + 328) = v39;
  return a1;
}

uint64_t assignWithCopy for StructuredContext.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v69 = *(void *)a2;
  uint64_t v70 = *(void *)(a2 + 8);
  uint64_t v67 = *(void *)(a2 + 24);
  uint64_t v68 = *(void *)(a2 + 16);
  uint64_t v65 = *(void *)(a2 + 40);
  uint64_t v66 = *(void *)(a2 + 32);
  uint64_t v63 = *(void *)(a2 + 56);
  uint64_t v64 = *(void *)(a2 + 48);
  uint64_t v61 = *(void *)(a2 + 72);
  uint64_t v62 = *(void *)(a2 + 64);
  uint64_t v59 = *(void *)(a2 + 88);
  uint64_t v60 = *(void *)(a2 + 80);
  uint64_t v57 = *(void *)(a2 + 104);
  uint64_t v58 = *(void *)(a2 + 96);
  uint64_t v38 = *(void *)(a2 + 112);
  unint64_t v39 = *(void *)(a2 + 120);
  uint64_t v3 = *(void *)(a2 + 136);
  uint64_t v4 = *(void *)(a2 + 144);
  uint64_t v5 = *(void *)(a2 + 152);
  uint64_t v6 = *(void *)(a2 + 160);
  uint64_t v7 = *(void *)(a2 + 168);
  uint64_t v8 = *(void *)(a2 + 176);
  uint64_t v9 = *(void *)(a2 + 184);
  uint64_t v10 = *(void *)(a2 + 192);
  uint64_t v11 = *(void *)(a2 + 200);
  uint64_t v40 = *(void *)(a2 + 128);
  uint64_t v41 = *(void *)(a2 + 208);
  uint64_t v42 = *(void *)(a2 + 216);
  uint64_t v43 = *(void *)(a2 + 224);
  unint64_t v44 = *(void *)(a2 + 232);
  uint64_t v45 = *(void *)(a2 + 240);
  uint64_t v46 = *(void *)(a2 + 248);
  uint64_t v47 = *(void *)(a2 + 256);
  uint64_t v48 = *(void *)(a2 + 264);
  uint64_t v49 = *(void *)(a2 + 272);
  uint64_t v50 = *(void *)(a2 + 280);
  uint64_t v51 = *(void *)(a2 + 288);
  uint64_t v52 = *(void *)(a2 + 296);
  uint64_t v53 = *(void *)(a2 + 304);
  uint64_t v54 = *(void *)(a2 + 312);
  uint64_t v55 = *(void *)(a2 + 320);
  __int16 v56 = *(_WORD *)(a2 + 328);
  sub_253E46340(*(void *)a2, v70, v68, v67, v66, v65, v64, v63, v62, v61, v60, v59, v58, v57, v38, v39, v40, v3, v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  *(void *)a1 = v69;
  *(void *)(a1 + 8) = v70;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v68;
  *(void *)(a1 + 24) = v67;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v66;
  *(void *)(a1 + 40) = v65;
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v64;
  *(void *)(a1 + 56) = v63;
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  *(void *)(a1 + 64) = v62;
  *(void *)(a1 + 72) = v61;
  *(void *)(a1 + 80) = v60;
  *(void *)(a1 + 88) = v59;
  long long v22 = *(_OWORD *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 112);
  *(void *)(a1 + 96) = v58;
  *(void *)(a1 + 104) = v57;
  *(void *)(a1 + 112) = v38;
  *(void *)(a1 + 120) = v39;
  long long v24 = *(_OWORD *)(a1 + 128);
  long long v25 = *(_OWORD *)(a1 + 144);
  *(void *)(a1 + 128) = v40;
  *(void *)(a1 + 136) = v3;
  *(void *)(a1 + 144) = v4;
  *(void *)(a1 + 152) = v5;
  long long v26 = *(_OWORD *)(a1 + 160);
  long long v27 = *(_OWORD *)(a1 + 176);
  *(void *)(a1 + 160) = v6;
  *(void *)(a1 + 168) = v7;
  *(void *)(a1 + 176) = v8;
  *(void *)(a1 + 184) = v9;
  long long v28 = *(_OWORD *)(a1 + 192);
  long long v29 = *(_OWORD *)(a1 + 208);
  *(void *)(a1 + 192) = v10;
  *(void *)(a1 + 200) = v11;
  *(void *)(a1 + 208) = v41;
  *(void *)(a1 + 216) = v42;
  long long v30 = *(_OWORD *)(a1 + 224);
  long long v31 = *(_OWORD *)(a1 + 240);
  *(void *)(a1 + 224) = v43;
  *(void *)(a1 + 232) = v44;
  *(void *)(a1 + 240) = v45;
  *(void *)(a1 + 248) = v46;
  long long v32 = *(_OWORD *)(a1 + 256);
  long long v33 = *(_OWORD *)(a1 + 272);
  *(void *)(a1 + 256) = v47;
  *(void *)(a1 + 264) = v48;
  *(void *)(a1 + 272) = v49;
  *(void *)(a1 + 280) = v50;
  long long v34 = *(_OWORD *)(a1 + 288);
  long long v35 = *(_OWORD *)(a1 + 304);
  *(void *)(a1 + 288) = v51;
  *(void *)(a1 + 296) = v52;
  *(void *)(a1 + 304) = v53;
  *(void *)(a1 + 312) = v54;
  uint64_t v36 = *(void *)(a1 + 320);
  *(void *)(a1 + 320) = v55;
  *(_WORD *)(a1 + 328) = v56;
  sub_253E467E8(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((unint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v30,
    *((unint64_t *)&v30 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v35,
    *((uint64_t *)&v35 + 1),
    v36);
  return a1;
}

uint64_t assignWithTake for StructuredContext.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 320);
  __int16 v5 = *(_WORD *)(a2 + 328);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  long long v14 = *(_OWORD *)(a1 + 64);
  long long v15 = *(_OWORD *)(a1 + 80);
  long long v16 = *(_OWORD *)(a1 + 96);
  long long v17 = *(_OWORD *)(a1 + 112);
  long long v18 = *(_OWORD *)(a1 + 128);
  long long v19 = *(_OWORD *)(a1 + 144);
  long long v20 = *(_OWORD *)(a1 + 160);
  long long v21 = *(_OWORD *)(a1 + 176);
  long long v22 = *(_OWORD *)(a1 + 192);
  long long v23 = *(_OWORD *)(a1 + 208);
  long long v24 = *(_OWORD *)(a1 + 224);
  long long v25 = *(_OWORD *)(a1 + 240);
  long long v26 = *(_OWORD *)(a1 + 256);
  long long v27 = *(_OWORD *)(a1 + 272);
  long long v28 = *(_OWORD *)(a1 + 288);
  long long v29 = *(_OWORD *)(a1 + 304);
  uint64_t v30 = *(void *)(a1 + 320);
  long long v31 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v31;
  long long v32 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v32;
  long long v33 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v33;
  long long v34 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v34;
  long long v35 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v35;
  long long v36 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v36;
  long long v37 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v37;
  long long v38 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v38;
  long long v39 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v39;
  long long v40 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 304) = v40;
  *(void *)(a1 + 320) = v4;
  *(_WORD *)(a1 + 328) = v5;
  sub_253E467E8(v6, v7, v8, v9, v10, v11, v12, v13, v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, *((unint64_t *)&v17 + 1), v18, *((uint64_t *)&v18 + 1), v19,
    *((uint64_t *)&v19 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    v21,
    *((uint64_t *)&v21 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v24,
    *((unint64_t *)&v24 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v30);
  return a1;
}

uint64_t getEnumTagSinglePayload for StructuredContext.Value(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 330))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unsigned int v2 = *(_DWORD *)(a1 + 106);
      if (v2 > 0x80000000) {
        int v3 = ~v2;
      }
      else {
        int v3 = -1;
      }
    }
  }
  else
  {
    int v3 = -1;
  }
  return (v3 + 1);
}

void storeEnumTagSinglePayload for StructuredContext.Value(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(a1 + 248) = 0u;
    *(_OWORD *)(a1 + 232) = 0u;
    *(_OWORD *)(a1 + 216) = 0u;
    *(_OWORD *)(a1 + 200) = 0u;
    *(_OWORD *)(a1 + 184) = 0u;
    *(_OWORD *)(a1 + 168) = 0u;
    *(_OWORD *)(a1 + 152) = 0u;
    *(_OWORD *)(a1 + 136) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_WORD *)(a1 + 328) = 0;
    *(_OWORD *)(a1 + 312) = 0u;
    *(_OWORD *)(a1 + 296) = 0u;
    *(_OWORD *)(a1 + 280) = 0u;
    *(_OWORD *)(a1 + 264) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(a1 + 330) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return;
      }
LABEL_8:
      *(_OWORD *)(a1 + 64) = 0u;
      *(_OWORD *)(a1 + 80) = 0u;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(void *)(a1 + 96) = 0;
      *(void *)(a1 + 104) = (unint64_t)-a2 << 16;
      bzero((void *)(a1 + 112), 0xDAuLL);
      return;
    }
    *(unsigned char *)(a1 + 330) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
}

uint64_t sub_253E4A604(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 192) & 0xFFFFFFFFFFLL;
  uint64_t v3 = *(void *)(result + 208) & 1;
  unint64_t v4 = *(unsigned __int16 *)(result + 232) | (unint64_t)(a2 << 62);
  *(void *)(result + 104) = *(unsigned __int16 *)(result + 104);
  *(void *)(result + 192) = v2;
  *(void *)(result + 208) = v3;
  *(void *)(result + 232) = v4;
  return result;
}

ValueMetadata *type metadata accessor for StructuredContext.Value()
{
  return &type metadata for StructuredContext.Value;
}

uint64_t sub_253E4A650()
{
  return 0;
}

ValueMetadata *type metadata accessor for StructuredContext.CodingKeys()
{
  return &type metadata for StructuredContext.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for StructuredContext.Value.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x253E4A734);
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

ValueMetadata *type metadata accessor for StructuredContext.Value.CodingKeys()
{
  return &type metadata for StructuredContext.Value.CodingKeys;
}

ValueMetadata *type metadata accessor for StructuredContext.Value.SiriRequestContextCodingKeys()
{
  return &type metadata for StructuredContext.Value.SiriRequestContextCodingKeys;
}

ValueMetadata *type metadata accessor for StructuredContext.Value.IntelligenceCommandCodingKeys()
{
  return &type metadata for StructuredContext.Value.IntelligenceCommandCodingKeys;
}

uint64_t _s22IntelligenceFlowShared17StructuredContextV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s22IntelligenceFlowShared17StructuredContextV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x253E4A878);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for StructuredContext.Value.AppInFocusContextCodingKeys()
{
  return &type metadata for StructuredContext.Value.AppInFocusContextCodingKeys;
}

unint64_t sub_253E4A8B4()
{
  unint64_t result = qword_269D976D8;
  if (!qword_269D976D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D976D8);
  }
  return result;
}

unint64_t sub_253E4A904()
{
  unint64_t result = qword_269D976E0;
  if (!qword_269D976E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D976E0);
  }
  return result;
}

unint64_t sub_253E4A954()
{
  unint64_t result = qword_269D976E8;
  if (!qword_269D976E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D976E8);
  }
  return result;
}

unint64_t sub_253E4A9A4()
{
  unint64_t result = qword_269D976F0;
  if (!qword_269D976F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D976F0);
  }
  return result;
}

unint64_t sub_253E4A9F4()
{
  unint64_t result = qword_269D976F8;
  if (!qword_269D976F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D976F8);
  }
  return result;
}

unint64_t sub_253E4AA44()
{
  unint64_t result = qword_26B257928;
  if (!qword_26B257928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257928);
  }
  return result;
}

unint64_t sub_253E4AA94()
{
  unint64_t result = qword_26B257920;
  if (!qword_26B257920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257920);
  }
  return result;
}

unint64_t sub_253E4AAE4()
{
  unint64_t result = qword_26B257950;
  if (!qword_26B257950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257950);
  }
  return result;
}

unint64_t sub_253E4AB34()
{
  unint64_t result = qword_26B257948;
  if (!qword_26B257948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257948);
  }
  return result;
}

unint64_t sub_253E4AB84()
{
  unint64_t result = qword_26B257960;
  if (!qword_26B257960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257960);
  }
  return result;
}

unint64_t sub_253E4ABD4()
{
  unint64_t result = qword_26B257958;
  if (!qword_26B257958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257958);
  }
  return result;
}

unint64_t sub_253E4AC24()
{
  unint64_t result = qword_26B257940;
  if (!qword_26B257940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257940);
  }
  return result;
}

unint64_t sub_253E4AC74()
{
  unint64_t result = qword_26B257938;
  if (!qword_26B257938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257938);
  }
  return result;
}

unint64_t sub_253E4ACC4()
{
  unint64_t result = qword_26B257978;
  if (!qword_26B257978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257978);
  }
  return result;
}

unint64_t sub_253E4AD14()
{
  unint64_t result = qword_26B257970;
  if (!qword_26B257970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257970);
  }
  return result;
}

uint64_t sub_253E4AD64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2) {
    goto LABEL_10;
  }
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0) {
    return swift_unknownObjectRetain();
  }
LABEL_12:
  __break(1u);
  return result;
}

__n128 sub_253E4ADEC()
{
  return v0[4];
}

__n128 sub_253E4AE50@<Q0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 440) = a1;
  *(void *)(v2 + 448) = v1;
  __n128 result = *(__n128 *)(v2 + 120);
  long long v4 = *(_OWORD *)(v2 + 136);
  *(__n128 *)(v2 + 456) = result;
  *(_OWORD *)(v2 + 472) = v4;
  return result;
}

uint64_t sub_253E4AEB8()
{
  return sub_253E825C0();
}

uint64_t sub_253E4AF18()
{
  return v0;
}

uint64_t sub_253E4AF28()
{
  return v0;
}

__n128 sub_253E4AF40(__n128 *a1)
{
  return a1[1];
}

uint64_t RetrievedContext.identifier.getter()
{
  return sub_253E39ECC();
}

uint64_t RetrievedContext.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*RetrievedContext.identifier.modify())()
{
  return nullsub_1;
}

uint64_t RetrievedContext.value.getter()
{
  sub_253E5C428();
  sub_253E82240();
  sub_253E5C174();
  uint64_t v0 = sub_253E39ECC();

  return v1(v0);
}

uint64_t type metadata accessor for RetrievedContext(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_26B257720);
}

uint64_t RetrievedContext.value.setter()
{
  type metadata accessor for RetrievedContext(0);
  sub_253E82240();
  sub_253E5C174();
  uint64_t v0 = sub_253E5C6A0();

  return v1(v0);
}

uint64_t (*RetrievedContext.value.modify())(void)
{
  return nullsub_1;
}

uint64_t RetrievedContext.typedValue.getter()
{
  uint64_t v2 = v1 + *(int *)(sub_253E5C428() + 24);

  return sub_253E4B14C(v2, v0);
}

uint64_t sub_253E4B14C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253E390C4(&qword_26B257828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t RetrievedContext.typedValue.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RetrievedContext(0) + 24);

  return sub_253E4B1F8(a1, v3);
}

uint64_t sub_253E4B1F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253E390C4(&qword_26B257828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*RetrievedContext.typedValue.modify())(void)
{
  return nullsub_1;
}

uint64_t RetrievedContext.structuredContext.getter()
{
  uint64_t v1 = sub_253E5C428();
  uint64_t v9 = sub_253E5C5CC(v0 + *(int *)(v1 + 28), v2, v3, v4, v5, v6, v7, v8, v18[0]);
  sub_253E5C354(v9, v10, v11, v12, v13, v14, v15, v16, v18[0]);
  return sub_253E4B374(v18, sub_253E46340);
}

uint64_t RetrievedContext.structuredContext.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_253E5C5E4(a1, a2, a3, a4, a5, a6, a7, a8, v18);
  uint64_t v8 = type metadata accessor for RetrievedContext(0);
  sub_253E5C658(*(int *)(v8 + 28), v19, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57,
    v58,
    v59,
    v60,
    v61,
    v62[0]);
  uint64_t v9 = sub_253E4B374(v62, sub_253E467E8);
  return sub_253E5C370(v9, v10, v11, v12, v13, v14, v15, v16, v20);
}

#error "253E4B38C: call analysis failed (funcsize=12)"

void sub_253E4B3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,unint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unint64_t a37,uint64_t a38,unint64_t a39,uint64_t a40,uint64_t a41,unint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,__int16 a54,uint64_t (*a55)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_253E5C31C();
  if (a26 >> 16 != 4294967294 || a37 >> 40 || a39 > 1 || a42 >= 0x10000)
  {
    LOWORD(v63) = a54;
    sub_253E4665C(v55, v56, v57, v58, v59, v60, v61, v62, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31,
      a32,
      a33,
      a34,
      a35,
      a36,
      a37,
      a38,
      a39,
      a40,
      a41,
      a42,
      a43,
      a44,
      a45,
      a46,
      a47,
      a48,
      a49,
      a50,
      a51,
      a52,
      a53,
      v63,
      a55);
  }
  sub_253E5C2D8();
}

uint64_t (*RetrievedContext.structuredContext.modify())(void)
{
  return nullsub_1;
}

uint64_t RetrievedContext.relevance.getter()
{
  uint64_t result = sub_253E5C428();
  uint64_t v3 = (int *)(v1 + *(int *)(result + 32));
  int v4 = *v3;
  *(unsigned char *)(v0 + 4) = *((unsigned char *)v3 + 4);
  *(_DWORD *)uint64_t v0 = v4;
  return result;
}

uint64_t RetrievedContext.relevance.setter(int *a1)
{
  int v2 = *a1;
  char v3 = *((unsigned char *)a1 + 4);
  uint64_t result = type metadata accessor for RetrievedContext(0);
  uint64_t v5 = v1 + *(int *)(result + 32);
  *(unsigned char *)(v5 + 4) = v3;
  *(_DWORD *)uint64_t v5 = v2;
  return result;
}

uint64_t (*RetrievedContext.relevance.modify())(void)
{
  return nullsub_1;
}

uint64_t RetrievedContext.type.getter()
{
  uint64_t result = sub_253E5C428();
  unsigned char *v0 = *(unsigned char *)(v1 + *(int *)(result + 36));
  return result;
}

uint64_t RetrievedContext.type.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for RetrievedContext(0);
  *(unsigned char *)(v1 + *(int *)(result + 36)) = v2;
  return result;
}

uint64_t (*RetrievedContext.type.modify())(void)
{
  return nullsub_1;
}

void *RetrievedContext.metadata.getter()
{
  uint64_t v1 = sub_253E5C428();
  uint64_t v9 = sub_253E5C5CC(v0 + *(int *)(v1 + 40), v2, v3, v4, v5, v6, v7, v8, v18[0]);
  sub_253E5C354(v9, v10, v11, v12, v13, v14, v15, v16, v18[0]);
  return sub_253E4B850((uint64_t)v18);
}

void sub_253E4B700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  if (a11)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_253E4B7A4(a21, a22);
  }
}

uint64_t sub_253E4B7A4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t RetrievedContext.metadata.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_253E5C5E4(a1, a2, a3, a4, a5, a6, a7, a8, v18);
  uint64_t v8 = type metadata accessor for RetrievedContext(0);
  sub_253E5C678(*(int *)(v8 + 40), v19, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44[0]);
  uint64_t v9 = sub_253E4B850((uint64_t)v44);
  return sub_253E5C370((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16, v20);
}

void *sub_253E4B850(uint64_t a1)
{
  uint64_t v2 = sub_253E5C614(a1);
  v3(v2, v1[1], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11], v1[12], v1[13], v1[14], v1[15], v1[16], v1[17], v1[18],
    v1[19],
    v1[20],
    v1[21],
    v1[22],
    v1[23]);
  return v1;
}

uint64_t sub_253E4B8C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t result = a11;
  if (a11)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_253E4B964(a21, a22);
  }
  return result;
}

uint64_t sub_253E4B964(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*RetrievedContext.metadata.modify())(void)
{
  return nullsub_1;
}

void RetrievedContext.init(identifier:structuredContext:typedValue:relevance:type:metadata:)()
{
  sub_253E5C31C();
  uint64_t v57 = v0;
  uint64_t v58 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v55 = v8;
  uint64_t v50 = v9;
  uint64_t v11 = v10;
  uint64_t v12 = sub_253E390C4(&qword_26B257828);
  uint64_t v13 = sub_253E5C41C(v12);
  MEMORY[0x270FA5388](v13);
  sub_253E5C0EC();
  uint64_t v59 = v14;
  uint64_t v15 = sub_253E82240();
  sub_253E3B950();
  uint64_t v17 = v16;
  MEMORY[0x270FA5388](v18);
  sub_253E5C0EC();
  uint64_t v54 = v19;
  sub_253E82140();
  sub_253E3B950();
  uint64_t v48 = v21;
  uint64_t v49 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253E4BEA8(v7, (uint64_t)v62, &qword_26B2577E8);
  unint64_t v52 = *v5 | ((unint64_t)*((unsigned __int8 *)v5 + 4) << 32);
  int v53 = *v3;
  sub_253E4BEA8(v58, (uint64_t)v63, &qword_26B2577D8);
  uint64_t v24 = (int *)type metadata accessor for RetrievedContext(0);
  uint64_t v25 = (uint64_t)v11 + v24[6];
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v25, 1, 1, v15);
  uint64_t v26 = (uint64_t)v11 + v24[7];
  sub_253E4BE10((uint64_t)v64);
  uint64_t v51 = v26;
  sub_253E4BEA8((uint64_t)v64, v26, &qword_26B2577E8);
  uint64_t v56 = v24[8];
  uint64_t v27 = (char *)v11 + v56;
  v27[4] = 3;
  *(_DWORD *)uint64_t v27 = 0;
  uint64_t v28 = (uint64_t)v11 + v24[10];
  sub_253E4BE38(v65);
  uint64_t v29 = v55;
  sub_253E4BEA8((uint64_t)v65, v28, &qword_26B2577D8);
  if (v29)
  {
    uint64_t v30 = v50;
  }
  else
  {
    sub_253E82130();
    uint64_t v30 = sub_253E82120();
    uint64_t v29 = v31;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v23, v49);
  }
  *uint64_t v11 = v30;
  v11[1] = v29;
  uint64_t v32 = v57;
  sub_253E4BE40(v57, v25);
  uint64_t v33 = v32;
  uint64_t v34 = v59;
  sub_253E4BEA8(v33, v59, &qword_26B257828);
  int v35 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v34, 1, v15);
  uint64_t v58 = v28;
  if (v35 == 1)
  {
    sub_253E82220();
    uint64_t v36 = swift_allocBox();
    *uint64_t v37 = 0;
    sub_253E5C1BC();
    sub_253E5C580();
    v38();
    uint64_t v39 = v54;
    *uint64_t v54 = v36;
    (*(void (**)(uint64_t *, void, uint64_t))(v17 + 104))(v39, *MEMORY[0x263F804E8], v15);
    sub_253E4CA94(v34, &qword_26B257828);
    uint64_t v40 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32);
  }
  else
  {
    uint64_t v41 = v34;
    uint64_t v40 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32);
    uint64_t v39 = v54;
    v40(v54, v41, v15);
  }
  char v42 = v53;
  uint64_t v43 = v51;
  unint64_t v44 = v52;
  v40((uint64_t *)((char *)v11 + v24[5]), (uint64_t)v39, v15);
  sub_253E4BEA8(v43, (uint64_t)v60, &qword_26B2577E8);
  sub_253E4B374(v60, sub_253E467E8);
  sub_253E4BEA8((uint64_t)v62, v43, &qword_26B2577E8);
  uint64_t v45 = (char *)v11 + v56;
  v45[4] = BYTE4(v44);
  *(_DWORD *)uint64_t v45 = v44;
  *((unsigned char *)v11 + v24[9]) = v42;
  uint64_t v46 = v58;
  sub_253E4BEA8(v58, (uint64_t)v61, &qword_26B2577D8);
  sub_253E4B850((uint64_t)v61);
  sub_253E4BEA8((uint64_t)v63, v46, &qword_26B2577D8);
  sub_253E5C2D8();
}

uint64_t _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

void sub_253E4BE10(uint64_t a1)
{
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0xFFFFFFFE0000;
  bzero((void *)(a1 + 112), 0xDAuLL);
}

void sub_253E4BE38(void *a1)
{
}

uint64_t sub_253E4BE40(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253E390C4(&qword_26B257828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_253E4BEA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_253E390C4(a3);
  sub_253E5C174();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

void RetrievedContext.init(structuredContext:typedValue:relevance:type:metadata:)()
{
  sub_253E5C31C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = sub_253E390C4(&qword_26B257828);
  uint64_t v12 = sub_253E5C41C(v11);
  MEMORY[0x270FA5388](v12);
  sub_253E5C184();
  sub_253E4BEA8(v10, (uint64_t)v18, &qword_26B2577E8);
  LODWORD(v10) = *(_DWORD *)v6;
  LOBYTE(v6) = *(unsigned char *)(v6 + 4);
  char v13 = *v4;
  sub_253E4BEA8(v2, (uint64_t)v19, &qword_26B2577D8);
  sub_253E4BEA8((uint64_t)v18, (uint64_t)&v17, &qword_26B2577E8);
  sub_253E4B14C(v8, v0);
  char v16 = v6;
  int v15 = v10;
  v14[199] = v13;
  sub_253E4BEA8((uint64_t)v19, (uint64_t)v14, &qword_26B2577D8);
  RetrievedContext.init(identifier:structuredContext:typedValue:relevance:type:metadata:)();
  sub_253E4CA94(v8, &qword_26B257828);
  sub_253E5C2D8();
}

void static RetrievedContext.== infix(_:_:)()
{
  sub_253E5C31C();
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  sub_253E82240();
  sub_253E3B950();
  uint64_t v43 = v7;
  uint64_t v44 = v6;
  MEMORY[0x270FA5388](v6);
  sub_253E5C0EC();
  uint64_t v41 = v8;
  uint64_t v9 = sub_253E390C4(&qword_26B257828);
  uint64_t v10 = sub_253E5C41C(v9);
  MEMORY[0x270FA5388](v10);
  sub_253E5C0EC();
  uint64_t v42 = v11;
  uint64_t v12 = sub_253E390C4(&qword_269D97700);
  sub_253E5C174();
  MEMORY[0x270FA5388](v13);
  sub_253E45F88();
  uint64_t v14 = type metadata accessor for RetrievedContext(0);
  sub_253E5C174();
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v47 = &v39[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v48 = &v39[-v19];
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = &v39[-v21];
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = &v39[-v24];
  char v26 = sub_253E3D0D8(*(unsigned __int8 *)(v5 + *(int *)(v23 + 36)), *(unsigned __int8 *)(v4 + *(int *)(v23 + 36)));
  uint64_t v45 = v5;
  sub_253E4EEBC(v5, (uint64_t)v25, (void (*)(void))type metadata accessor for RetrievedContext);
  uint64_t v46 = v4;
  sub_253E4EEBC(v4, (uint64_t)v22, (void (*)(void))type metadata accessor for RetrievedContext);
  if ((v26 & 1) == 0)
  {
    sub_253E4EF1C((uint64_t)v22, (void (*)(void))type metadata accessor for RetrievedContext);
    sub_253E4EF1C((uint64_t)v25, (void (*)(void))type metadata accessor for RetrievedContext);
LABEL_9:
    uint64_t v31 = v48;
    sub_253E4EEBC(v45, (uint64_t)v48, (void (*)(void))type metadata accessor for RetrievedContext);
    uint64_t v32 = v47;
    sub_253E4EEBC(v46, (uint64_t)v47, (void (*)(void))type metadata accessor for RetrievedContext);
    goto LABEL_10;
  }
  uint64_t v27 = *(int *)(v14 + 24);
  uint64_t v28 = (uint64_t)&v22[v27];
  uint64_t v29 = v0 + *(int *)(v12 + 48);
  sub_253E4B14C((uint64_t)&v25[v27], v0);
  sub_253E4B14C(v28, v29);
  uint64_t v30 = v44;
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v0, 1, v44) == 1)
  {
    sub_253E4EF1C((uint64_t)v22, (void (*)(void))type metadata accessor for RetrievedContext);
    sub_253E4EF1C((uint64_t)v25, (void (*)(void))type metadata accessor for RetrievedContext);
    if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v29, 1, v30) == 1)
    {
      sub_253E4CA94(v0, &qword_26B257828);
      uint64_t v31 = v48;
      sub_253E4EEBC(v45, (uint64_t)v48, (void (*)(void))type metadata accessor for RetrievedContext);
      uint64_t v32 = v47;
      sub_253E4EEBC(v46, (uint64_t)v47, (void (*)(void))type metadata accessor for RetrievedContext);
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  sub_253E4B14C(v0, v42);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v29, 1, v30) == 1)
  {
    sub_253E4EF1C((uint64_t)v22, (void (*)(void))type metadata accessor for RetrievedContext);
    sub_253E4EF1C((uint64_t)v25, (void (*)(void))type metadata accessor for RetrievedContext);
    uint64_t v33 = sub_253E5C58C();
    v34(v33, v30);
LABEL_8:
    sub_253E4CA94(v0, &qword_269D97700);
    goto LABEL_9;
  }
  uint64_t v35 = v43;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 32))(v41, v29, v30);
  sub_253E4D9FC((uint64_t)&unk_269D97708);
  int v40 = sub_253E822F0();
  uint64_t v36 = *(void (**)(uint64_t))(v35 + 8);
  uint64_t v37 = sub_253E5C524();
  v36(v37);
  sub_253E4EF1C((uint64_t)v22, (void (*)(void))type metadata accessor for RetrievedContext);
  sub_253E4EF1C((uint64_t)v25, (void (*)(void))type metadata accessor for RetrievedContext);
  uint64_t v38 = sub_253E5C524();
  v36(v38);
  sub_253E4CA94(v0, &qword_26B257828);
  uint64_t v31 = v48;
  sub_253E4EEBC(v45, (uint64_t)v48, (void (*)(void))type metadata accessor for RetrievedContext);
  uint64_t v32 = v47;
  sub_253E4EEBC(v46, (uint64_t)v47, (void (*)(void))type metadata accessor for RetrievedContext);
  if (v40)
  {
LABEL_13:
    sub_253E4BEA8((uint64_t)&v31[*(int *)(v14 + 28)], (uint64_t)v56, &qword_26B2577E8);
    sub_253E4BEA8((uint64_t)&v32[*(int *)(v14 + 28)], (uint64_t)v57, &qword_26B2577E8);
    sub_253E4BEA8((uint64_t)v56, (uint64_t)v55, &qword_26B2577E8);
    sub_253E4BEA8((uint64_t)v57, (uint64_t)&v55[336], &qword_26B2577E8);
    sub_253E4BEA8((uint64_t)v56, (uint64_t)v58, &qword_26B2577E8);
    if (sub_253E4C844((uint64_t)v58) == 1)
    {
      sub_253E4B374(v57, sub_253E46340);
      sub_253E4EF1C((uint64_t)v32, (void (*)(void))type metadata accessor for RetrievedContext);
      sub_253E4EF1C((uint64_t)v31, (void (*)(void))type metadata accessor for RetrievedContext);
      sub_253E4BEA8((uint64_t)&v55[336], (uint64_t)v54, &qword_26B2577E8);
      sub_253E4BEA8((uint64_t)v54, (uint64_t)v53, &qword_26B2577E8);
      if (sub_253E4C844((uint64_t)v53) == 1)
      {
        sub_253E4BEA8((uint64_t)v55, (uint64_t)v52, &qword_26B2577E8);
        sub_253E4B374(v52, sub_253E467E8);
        goto LABEL_11;
      }
    }
    else
    {
      sub_253E4BEA8((uint64_t)v56, (uint64_t)v54, &qword_26B2577E8);
      sub_253E4BEA8((uint64_t)v57, (uint64_t)v53, &qword_26B2577E8);
      if (sub_253E4C844((uint64_t)v53) != 1)
      {
        sub_253E4BEA8((uint64_t)v57, (uint64_t)v49, &qword_26B2577E8);
        memcpy(v52, v49, 0x14AuLL);
        sub_253E4BEA8((uint64_t)v56, (uint64_t)v50, &qword_26B2577E8);
        sub_253E4B374(v56, sub_253E46340);
        sub_253E4CA64(v50);
        static StructuredContext.== infix(_:_:)((uint64_t)v54, (uint64_t)v52);
        sub_253E4EF1C((uint64_t)v32, (void (*)(void))type metadata accessor for RetrievedContext);
        sub_253E4EF1C((uint64_t)v31, (void (*)(void))type metadata accessor for RetrievedContext);
        memcpy(v51, v54, 0x14AuLL);
        sub_253E4CA64(v51);
        sub_253E4BEA8((uint64_t)v55, (uint64_t)v52, &qword_26B2577E8);
        sub_253E4B374(v52, sub_253E467E8);
        goto LABEL_11;
      }
      sub_253E4BEA8((uint64_t)v56, (uint64_t)v50, &qword_26B2577E8);
      sub_253E4BEA8((uint64_t)v56, (uint64_t)v51, &qword_26B2577E8);
      sub_253E4CA64(v51);
      sub_253E4CA64(v50);
      sub_253E4EF1C((uint64_t)v32, (void (*)(void))type metadata accessor for RetrievedContext);
      sub_253E4EF1C((uint64_t)v31, (void (*)(void))type metadata accessor for RetrievedContext);
      memcpy(v52, v54, 0x14AuLL);
      sub_253E4CA64(v52);
    }
    memcpy(v53, v55, 0x29AuLL);
    sub_253E4C868((uint64_t)v53);
    goto LABEL_11;
  }
LABEL_10:
  sub_253E4EF1C((uint64_t)v32, (void (*)(void))type metadata accessor for RetrievedContext);
  sub_253E4EF1C((uint64_t)v31, (void (*)(void))type metadata accessor for RetrievedContext);
LABEL_11:
  sub_253E5C2D8();
}

uint64_t sub_253E4C844(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 106);
  int v2 = -2 - v1;
  if ((int)(-2 - v1) < 0) {
    int v2 = -1;
  }
  if (v1 > 0x80000000) {
    return (v2 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_253E4C868(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 352);
  uint64_t v46 = *(void *)(a1 + 344);
  uint64_t v47 = *(void *)(a1 + 336);
  uint64_t v3 = *(void *)(a1 + 360);
  uint64_t v4 = *(void *)(a1 + 368);
  uint64_t v5 = *(void *)(a1 + 376);
  uint64_t v6 = *(void *)(a1 + 384);
  uint64_t v7 = *(void *)(a1 + 392);
  long long v44 = *(_OWORD *)(a1 + 416);
  long long v45 = *(_OWORD *)(a1 + 400);
  long long v42 = *(_OWORD *)(a1 + 448);
  long long v43 = *(_OWORD *)(a1 + 432);
  long long v40 = *(_OWORD *)(a1 + 480);
  long long v41 = *(_OWORD *)(a1 + 464);
  long long v38 = *(_OWORD *)(a1 + 512);
  long long v39 = *(_OWORD *)(a1 + 496);
  long long v37 = *(_OWORD *)(a1 + 528);
  long long v35 = *(_OWORD *)(a1 + 560);
  long long v36 = *(_OWORD *)(a1 + 544);
  long long v29 = *(_OWORD *)(a1 + 592);
  long long v32 = *(_OWORD *)(a1 + 576);
  long long v23 = *(_OWORD *)(a1 + 624);
  long long v26 = *(_OWORD *)(a1 + 608);
  long long v20 = *(_OWORD *)(a1 + 640);
  uint64_t v8 = *(void *)(a1 + 656);
  __int16 v9 = *(_WORD *)(a1 + 664);
  LOWORD(v16) = *(_WORD *)(a1 + 328);
  long long v14 = *(_OWORD *)(a1 + 288);
  long long v15 = *(_OWORD *)(a1 + 304);
  long long v12 = *(_OWORD *)(a1 + 256);
  long long v13 = *(_OWORD *)(a1 + 272);
  long long v11 = *(_OWORD *)(a1 + 224);
  sub_253E4B3A4(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v11,
    *((uint64_t *)&v11 + 1),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    v12,
    *((uint64_t *)&v12 + 1),
    v13,
    *((uint64_t *)&v13 + 1),
    v14,
    *((uint64_t *)&v14 + 1),
    v15,
    *((uint64_t *)&v15 + 1),
    *(void *)(a1 + 320),
    v16,
    (uint64_t)sub_253E467E8,
    v18,
    v20,
    *((uint64_t *)&v20 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v32,
    SWORD4(v32),
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v35);
  LOWORD(v17) = v9;
  sub_253E4B3A4(v47, v46, v2, v3, v4, v5, v6, v7, v45, *((uint64_t *)&v45 + 1), v44, *((uint64_t *)&v44 + 1), v43, *((uint64_t *)&v43 + 1), v42, *((uint64_t *)&v42 + 1), v41, *((uint64_t *)&v41 + 1), v40,
    *((uint64_t *)&v40 + 1),
    v39,
    *((uint64_t *)&v39 + 1),
    v38,
    *((uint64_t *)&v38 + 1),
    v37,
    *((unint64_t *)&v37 + 1),
    v36,
    *((uint64_t *)&v36 + 1),
    v35,
    *((uint64_t *)&v35 + 1),
    v33,
    v34,
    v30,
    v31,
    v27,
    v28,
    v24,
    v25,
    v21,
    v22,
    v8,
    v17,
    (uint64_t)sub_253E467E8,
    v19,
    v21,
    v22,
    v24,
    v25,
    v27,
    v28,
    v30,
    v31,
    v33,
    v34,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v35);
  return a1;
}

uint64_t sub_253E4CA64(__n128 *a1)
{
  sub_253E5C100(a1);
  sub_253E4665C(v2, v3, v4, v5, v6, v7, v8, v9, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45);
  return v1;
}

uint64_t sub_253E4CA94(uint64_t a1, uint64_t *a2)
{
  sub_253E390C4(a2);
  sub_253E5C174();
  sub_253E4AE7C();
  v3();
  return a1;
}

uint64_t sub_253E4CAE4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x8000000253E83370 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x636E6176656C6572 && a2 == 0xE900000000000065;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 1701869940 && a2 == 0xE400000000000000;
          if (v9 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            char v11 = sub_253E82780();
            swift_bridgeObjectRelease();
            if (v11) {
              return 6;
            }
            else {
              return 7;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_253E4CDB4()
{
  return 7;
}

unint64_t sub_253E4CDBC(char a1)
{
  unint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x65756C6176;
      break;
    case 2:
      unint64_t result = 0x6C61566465707974;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0x636E6176656C6572;
      break;
    case 5:
      unint64_t result = 1701869940;
      break;
    case 6:
      unint64_t result = 0x617461646174656DLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E4CEAC()
{
  return sub_253E4CDBC(*v0);
}

uint64_t sub_253E4CEB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E4CAE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E4CEDC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E4CDB4();
  *a1 = result;
  return result;
}

uint64_t sub_253E4CF04(uint64_t a1)
{
  unint64_t v2 = sub_253E4D274();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E4CF40(uint64_t a1)
{
  unint64_t v2 = sub_253E4D274();

  return MEMORY[0x270FA00B8](a1, v2);
}

void RetrievedContext.encode(to:)()
{
  sub_253E45CF0();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  uint64_t v5 = sub_253E390C4(&qword_269D97710);
  sub_253E3B950();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253E39108(v4, v4[3]);
  sub_253E4D274();
  sub_253E5C5AC();
  v20[0] = 0;
  sub_253E82710();
  if (v1)
  {
    sub_253E45CE4();
    v11();
  }
  else
  {
    uint64_t v16 = v7;
    uint64_t v12 = (int *)type metadata accessor for RetrievedContext(0);
    v20[0] = 1;
    sub_253E82240();
    sub_253E4D9FC((uint64_t)&unk_26B257820);
    sub_253E5C480();
    sub_253E82750();
    sub_253E5C480();
    sub_253E826F0();
    sub_253E4BEA8(v2 + v12[7], (uint64_t)v20, &qword_26B2577E8);
    sub_253E4BEA8((uint64_t)v20, (uint64_t)&v18, &qword_26B2577E8);
    char v17 = 3;
    sub_253E4D2C0();
    sub_253E5C498();
    uint64_t v13 = (int *)(v2 + v12[8]);
    int v14 = *v13;
    char v19 = *((unsigned char *)v13 + 4);
    int v18 = v14;
    char v17 = 4;
    sub_253E4D30C();
    sub_253E5C498();
    sub_253E4D358();
    sub_253E82750();
    uint64_t v15 = v16;
    sub_253E4BEA8(v2 + v12[10], (uint64_t)&v18, &qword_26B2577D8);
    sub_253E4BEA8((uint64_t)&v18, (uint64_t)&v17, &qword_26B2577D8);
    sub_253E4D3A4();
    sub_253E5C498();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v5);
  }
  sub_253E45D2C();
}

unint64_t sub_253E4D274()
{
  unint64_t result = qword_269D97718;
  if (!qword_269D97718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97718);
  }
  return result;
}

unint64_t sub_253E4D2C0()
{
  unint64_t result = qword_26B2577E0;
  if (!qword_26B2577E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2577E0);
  }
  return result;
}

unint64_t sub_253E4D30C()
{
  unint64_t result = qword_269D97720;
  if (!qword_269D97720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97720);
  }
  return result;
}

unint64_t sub_253E4D358()
{
  unint64_t result = qword_269D97728;
  if (!qword_269D97728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97728);
  }
  return result;
}

unint64_t sub_253E4D3A4()
{
  unint64_t result = qword_26B2577D0;
  if (!qword_26B2577D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2577D0);
  }
  return result;
}

void RetrievedContext.init(from:)()
{
  sub_253E45CF0();
  uint64_t v5 = v4;
  uint64_t v26 = v6;
  uint64_t v7 = sub_253E390C4(&qword_26B257828);
  uint64_t v8 = sub_253E5C41C(v7);
  MEMORY[0x270FA5388](v8);
  sub_253E4AEA0();
  uint64_t v9 = sub_253E82240();
  sub_253E3B950();
  uint64_t v27 = v10;
  MEMORY[0x270FA5388](v11);
  sub_253E5C184();
  sub_253E390C4(&qword_269D97730);
  sub_253E3B950();
  MEMORY[0x270FA5388](v12);
  uint64_t v13 = sub_253E5C400();
  int v14 = (int *)type metadata accessor for RetrievedContext(v13);
  sub_253E5C174();
  MEMORY[0x270FA5388](v15);
  sub_253E4AE88();
  uint64_t v29 = (uint64_t)v2 + *(int *)(v16 + 24);
  uint64_t v28 = v9;
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v29, 1, 1, v9);
  uint64_t v17 = (uint64_t)v2 + v14[7];
  sub_253E4BE10((uint64_t)v38);
  uint64_t v30 = v17;
  sub_253E4BEA8((uint64_t)v38, v17, &qword_26B2577E8);
  uint64_t v18 = v14[8];
  char v19 = (char *)v2 + v18;
  v19[4] = 3;
  *(_DWORD *)char v19 = 0;
  uint64_t v20 = (uint64_t)v2 + v14[10];
  sub_253E4BE38(v39);
  sub_253E4BEA8((uint64_t)v39, v20, &qword_26B2577D8);
  sub_253E39108(v5, v5[3]);
  sub_253E4D274();
  sub_253E82850();
  if (v0)
  {
    sub_253E393E4((uint64_t)v5);
    sub_253E4CA94(v29, &qword_26B257828);
    sub_253E4BEA8(v30, (uint64_t)v37, &qword_26B2577E8);
    sub_253E4B374(v37, sub_253E467E8);
    sub_253E4BEA8(v20, (uint64_t)v36, &qword_26B2577D8);
    sub_253E4B850((uint64_t)v36);
  }
  else
  {
    uint64_t *v2 = sub_253E82640();
    v2[1] = v21;
    v37[0] = 1;
    sub_253E4D9FC((uint64_t)&unk_269D97738);
    sub_253E82680();
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))((char *)v2 + v14[5], v1, v28);
    v37[0] = 2;
    sub_253E82620();
    sub_253E4B1F8(v3, v29);
    sub_253E4DA3C();
    sub_253E5C2B8();
    sub_253E4BEA8((uint64_t)v37, (uint64_t)v35, &qword_26B2577E8);
    sub_253E4BEA8(v30, (uint64_t)v36, &qword_26B2577E8);
    sub_253E4B374(v36, sub_253E467E8);
    sub_253E4BEA8((uint64_t)v35, v30, &qword_26B2577E8);
    sub_253E4DA88();
    sub_253E5C2B8();
    int v22 = v33;
    uint64_t v23 = (char *)v2 + v18;
    v23[4] = v34;
    *(_DWORD *)uint64_t v23 = v22;
    v32[0] = 5;
    sub_253E4DAD4();
    sub_253E82680();
    *((unsigned char *)v2 + v14[9]) = v33;
    sub_253E4DB20();
    sub_253E5C2B8();
    uint64_t v24 = sub_253E5C270();
    v25(v24);
    sub_253E4BEA8((uint64_t)&v33, (uint64_t)v31, &qword_26B2577D8);
    sub_253E4BEA8(v20, (uint64_t)v32, &qword_26B2577D8);
    sub_253E4B850((uint64_t)v32);
    sub_253E4BEA8((uint64_t)v31, v20, &qword_26B2577D8);
    sub_253E4EEBC((uint64_t)v2, v26, (void (*)(void))type metadata accessor for RetrievedContext);
    sub_253E393E4((uint64_t)v5);
    sub_253E4EF1C((uint64_t)v2, (void (*)(void))type metadata accessor for RetrievedContext);
  }
  sub_253E45D2C();
}

unint64_t sub_253E4D9FC(uint64_t a1)
{
  unint64_t result = sub_253E5C614(a1);
  if (!result)
  {
    sub_253E82240();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_253E4DA3C()
{
  unint64_t result = qword_269D97740;
  if (!qword_269D97740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97740);
  }
  return result;
}

unint64_t sub_253E4DA88()
{
  unint64_t result = qword_269D97748;
  if (!qword_269D97748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97748);
  }
  return result;
}

unint64_t sub_253E4DAD4()
{
  unint64_t result = qword_269D97750;
  if (!qword_269D97750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97750);
  }
  return result;
}

unint64_t sub_253E4DB20()
{
  unint64_t result = qword_269D97758;
  if (!qword_269D97758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97758);
  }
  return result;
}

void sub_253E4DB6C()
{
}

void sub_253E4DB84()
{
}

uint64_t ContextValue.value.getter()
{
  sub_253E82240();
  sub_253E5C174();
  uint64_t v0 = sub_253E39ECC();

  return v1(v0);
}

uint64_t ContextValue.value.setter()
{
  sub_253E82240();
  sub_253E5C174();
  uint64_t v0 = sub_253E5C6A0();

  return v1(v0);
}

uint64_t (*ContextValue.value.modify())()
{
  return nullsub_1;
}

uint64_t ContextValue.typedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ContextValue(0) + 20);

  return sub_253E4B14C(v3, a1);
}

uint64_t type metadata accessor for ContextValue(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_26B2577C0);
}

uint64_t sub_253E4DCDC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ContextValue.typedValue.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ContextValue(0) + 20);

  return sub_253E4B1F8(a1, v3);
}

uint64_t (*ContextValue.typedValue.modify())(void)
{
  return nullsub_1;
}

uint64_t ContextValue.structuredContext.getter()
{
  uint64_t v1 = type metadata accessor for ContextValue(0);
  uint64_t v9 = sub_253E5C5CC(v0 + *(int *)(v1 + 24), v2, v3, v4, v5, v6, v7, v8, v18[0]);
  sub_253E5C354(v9, v10, v11, v12, v13, v14, v15, v16, v18[0]);
  return sub_253E4B374(v18, sub_253E46340);
}

uint64_t ContextValue.structuredContext.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_253E5C5E4(a1, a2, a3, a4, a5, a6, a7, a8, v18);
  uint64_t v8 = type metadata accessor for ContextValue(0);
  sub_253E5C658(*(int *)(v8 + 24), v19, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57,
    v58,
    v59,
    v60,
    v61,
    v62[0]);
  uint64_t v9 = sub_253E4B374(v62, sub_253E467E8);
  return sub_253E5C370(v9, v10, v11, v12, v13, v14, v15, v16, v20);
}

uint64_t (*ContextValue.structuredContext.modify())(void)
{
  return nullsub_1;
}

void *ContextValue.metadata.getter()
{
  uint64_t v1 = type metadata accessor for ContextValue(0);
  uint64_t v9 = sub_253E5C5CC(v0 + *(int *)(v1 + 28), v2, v3, v4, v5, v6, v7, v8, v18[0]);
  sub_253E5C354(v9, v10, v11, v12, v13, v14, v15, v16, v18[0]);
  return sub_253E4B850((uint64_t)v18);
}

uint64_t ContextValue.metadata.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_253E5C5E4(a1, a2, a3, a4, a5, a6, a7, a8, v18);
  uint64_t v8 = type metadata accessor for ContextValue(0);
  sub_253E5C678(*(int *)(v8 + 28), v19, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44[0]);
  uint64_t v9 = sub_253E4B850((uint64_t)v44);
  return sub_253E5C370((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16, v20);
}

uint64_t (*ContextValue.metadata.modify())(void)
{
  return nullsub_1;
}

uint64_t ContextValue.init(value:metadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_253E4BEA8(a2, (uint64_t)v13, &qword_26B2577D8);
  uint64_t v5 = (int *)type metadata accessor for ContextValue(0);
  uint64_t v6 = a3 + v5[5];
  uint64_t v7 = sub_253E82240();
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v6, 1, 1, v7);
  uint64_t v8 = a3 + v5[6];
  sub_253E4BE10((uint64_t)v14);
  sub_253E4BEA8((uint64_t)v14, v8, &qword_26B2577E8);
  uint64_t v9 = a3 + v5[7];
  sub_253E4BE38(v15);
  sub_253E4BEA8((uint64_t)v15, v9, &qword_26B2577D8);
  sub_253E5C0D8();
  uint64_t v11 = v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(a3, a1, v7);
  sub_253E4CA94(v6, &qword_26B257828);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v6, a1, v7);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v6, 0, 1, v7);
  sub_253E4BEA8(v9, (uint64_t)v16, &qword_26B2577D8);
  sub_253E4B850((uint64_t)v16);
  return sub_253E4BEA8((uint64_t)v13, v9, &qword_26B2577D8);
}

void ContextValue.init(structuredContext:typedValue:metadata:)()
{
  sub_253E5C31C();
  uint64_t v3 = v2;
  uint64_t v23 = v4;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_253E390C4(&qword_26B257828);
  uint64_t v10 = sub_253E5C41C(v9);
  MEMORY[0x270FA5388](v10);
  sub_253E45DFC();
  uint64_t v11 = sub_253E82240();
  sub_253E3B950();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  sub_253E5C184();
  sub_253E4BEA8(v6, (uint64_t)v26, &qword_26B2577E8);
  sub_253E4BEA8(v3, (uint64_t)v27, &qword_26B2577D8);
  uint64_t v15 = (int *)type metadata accessor for ContextValue(0);
  uint64_t v16 = (uint64_t)v8 + v15[5];
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v16, 1, 1, v11);
  uint64_t v17 = (uint64_t)v8 + v15[6];
  uint64_t v24 = v8;
  uint64_t v18 = (uint64_t)v8 + v15[7];
  sub_253E4BE38(v28);
  sub_253E4BEA8((uint64_t)v28, v18, &qword_26B2577D8);
  sub_253E4BEA8((uint64_t)v26, v17, &qword_26B2577E8);
  sub_253E4BE40(v23, v16);
  sub_253E4BEA8(v23, v0, &qword_26B257828);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v0, 1, v11) == 1)
  {
    sub_253E82220();
    uint64_t v19 = swift_allocBox();
    *uint64_t v20 = 0;
    sub_253E5C1BC();
    sub_253E5C580();
    v21();
    uint64_t *v1 = v19;
    (*(void (**)(uint64_t *, void, uint64_t))(v13 + 104))(v1, *MEMORY[0x263F804E8], v11);
    sub_253E4CA94(v0, &qword_26B257828);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v13 + 32))(v8, v1, v11);
  }
  else
  {
    uint64_t v22 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 32);
    v22(v1, v0, v11);
    v22(v24, (uint64_t)v1, v11);
  }
  sub_253E4BEA8(v18, (uint64_t)v25, &qword_26B2577D8);
  sub_253E4B850((uint64_t)v25);
  sub_253E4BEA8((uint64_t)v27, v18, &qword_26B2577D8);
  sub_253E5C2D8();
}

uint64_t sub_253E4E3E4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000011 && a2 == 0x8000000253E83370 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x617461646174656DLL && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v8 = sub_253E82780();
      swift_bridgeObjectRelease();
      if (v8) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

unint64_t sub_253E4E594(char a1)
{
  unint64_t result = 0x65756C6176;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6C61566465707974;
      break;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x617461646174656DLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E4E62C()
{
  return sub_253E4E594(*v0);
}

uint64_t sub_253E4E634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E4E3E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E4E65C(uint64_t a1)
{
  unint64_t v2 = sub_253E4E944();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E4E698(uint64_t a1)
{
  unint64_t v2 = sub_253E4E944();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ContextValue.encode(to:)()
{
  sub_253E45CF0();
  uint64_t v2 = v0;
  uint64_t v4 = v3;
  sub_253E390C4(qword_26B257830);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E39108(v4, v4[3]);
  sub_253E4E944();
  sub_253E5C5AC();
  v12[0] = 0;
  sub_253E82240();
  sub_253E4D9FC((uint64_t)&unk_26B257820);
  sub_253E82750();
  if (!v1)
  {
    uint64_t v6 = type metadata accessor for ContextValue(0);
    sub_253E826F0();
    sub_253E4BEA8(v2 + *(int *)(v6 + 24), (uint64_t)v12, &qword_26B2577E8);
    sub_253E4BEA8((uint64_t)v12, (uint64_t)&v11, &qword_26B2577E8);
    sub_253E4D2C0();
    sub_253E826F0();
    sub_253E4BEA8(v2 + *(int *)(v6 + 28), (uint64_t)v10, &qword_26B2577D8);
    sub_253E4BEA8((uint64_t)v10, (uint64_t)&v9, &qword_26B2577D8);
    sub_253E4D3A4();
    sub_253E826F0();
  }
  uint64_t v7 = sub_253E5C538();
  v8(v7);
  sub_253E45D2C();
}

unint64_t sub_253E4E944()
{
  unint64_t result = qword_26B2577A8;
  if (!qword_26B2577A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2577A8);
  }
  return result;
}

void ContextValue.init(from:)()
{
  sub_253E45CF0();
  uint64_t v4 = v3;
  uint64_t v18 = v5;
  uint64_t v6 = sub_253E390C4(&qword_26B257828);
  uint64_t v7 = sub_253E5C41C(v6);
  MEMORY[0x270FA5388](v7);
  sub_253E5C400();
  uint64_t v8 = sub_253E82240();
  sub_253E3B950();
  uint64_t v19 = v9;
  MEMORY[0x270FA5388](v10);
  sub_253E5C0EC();
  uint64_t v20 = v11;
  sub_253E390C4(&qword_269D97760);
  sub_253E3B950();
  MEMORY[0x270FA5388](v12);
  sub_253E5C1FC();
  uint64_t v13 = type metadata accessor for ContextValue(0);
  uint64_t v14 = (int *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  sub_253E45F88();
  uint64_t v21 = v1 + v14[7];
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v21, 1, 1, v8);
  uint64_t v15 = v1 + v14[8];
  sub_253E4BE10((uint64_t)v28);
  sub_253E4BEA8((uint64_t)v28, v15, &qword_26B2577E8);
  uint64_t v16 = v1 + v14[9];
  sub_253E4BE38(v29);
  sub_253E4BEA8((uint64_t)v29, v16, &qword_26B2577D8);
  sub_253E39108(v4, v4[3]);
  sub_253E4E944();
  sub_253E82850();
  if (v0)
  {
    sub_253E393E4((uint64_t)v4);
    sub_253E4CA94(v21, &qword_26B257828);
    sub_253E4BEA8(v15, (uint64_t)v27, &qword_26B2577E8);
    sub_253E4B374(v27, sub_253E467E8);
    sub_253E4BEA8(v16, (uint64_t)v26, &qword_26B2577D8);
    sub_253E4B850((uint64_t)v26);
  }
  else
  {
    v27[0] = 0;
    sub_253E4D9FC((uint64_t)&unk_269D97738);
    sub_253E82680();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v1, v20, v8);
    v27[0] = 1;
    sub_253E82620();
    sub_253E4B1F8(v2, v21);
    sub_253E4DA3C();
    sub_253E82620();
    sub_253E4BEA8((uint64_t)v27, (uint64_t)v25, &qword_26B2577E8);
    sub_253E4BEA8(v15, (uint64_t)v26, &qword_26B2577E8);
    sub_253E4B374(v26, sub_253E467E8);
    sub_253E4BEA8((uint64_t)v25, v15, &qword_26B2577E8);
    sub_253E4DB20();
    sub_253E82620();
    sub_253E4AE7C();
    v17();
    sub_253E4BEA8((uint64_t)&v24, (uint64_t)v22, &qword_26B2577D8);
    sub_253E4BEA8(v16, (uint64_t)v23, &qword_26B2577D8);
    sub_253E4B850((uint64_t)v23);
    sub_253E4BEA8((uint64_t)v22, v16, &qword_26B2577D8);
    sub_253E4EEBC(v1, v18, (void (*)(void))type metadata accessor for ContextValue);
    sub_253E393E4((uint64_t)v4);
    sub_253E4EF1C(v1, (void (*)(void))type metadata accessor for ContextValue);
  }
  sub_253E45D2C();
}

uint64_t sub_253E4EEBC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_253E5C174();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_253E4EF1C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_253E5C174();
  sub_253E4AE7C();
  v3();
  return a1;
}

void sub_253E4EF70()
{
}

void sub_253E4EF88()
{
}

uint64_t ContextMetadata.isSelected.getter()
{
  return *v0;
}

uint64_t ContextMetadata.isSelected.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*ContextMetadata.isSelected.modify())()
{
  return nullsub_1;
}

uint64_t ContextMetadata.isPrimary.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ContextMetadata.isPrimary.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*ContextMetadata.isPrimary.modify())()
{
  return nullsub_1;
}

uint64_t ContextMetadata.entityId.getter()
{
  return sub_253E39ECC();
}

uint64_t ContextMetadata.appBundleId.getter()
{
  return sub_253E39ECC();
}

void ContextMetadata.saliency.getter(uint64_t a1@<X8>)
{
  int v2 = *(_DWORD *)(v1 + 40);
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(v1 + 44);
  *(_DWORD *)a1 = v2;
}

void ContextMetadata.screenDimensions.getter(__n128 *a1@<X8>)
{
  sub_253E5C440(a1, v1[3]);
}

uint64_t ContextMetadata.onScreenSurroundingText.getter()
{
  return swift_bridgeObjectRetain();
}

void ContextMetadata.onScreenBoundingBox.getter(__n128 *a1@<X8>)
{
  sub_253E5C440(a1, *(__n128 *)(v1 + 88));
}

uint64_t ContextMetadata.seq.getter()
{
  return *(void *)(v0 + 120);
}

uint64_t ContextMetadata.groupId.getter()
{
  return sub_253E39ECC();
}

void ContextMetadata.dataSource.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 152);
}

uint64_t ContextMetadata.displayRepresentation.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[20];
  uint64_t v3 = v1[21];
  uint64_t v4 = v1[22];
  uint64_t v5 = v1[23];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_253E4B7A4(v2, v3);
}

void __swiftcall ContextMetadata.init(entityId:appBundleId:saliency:screenDimensions:onScreenSurroundingText:onScreenBoundingBox:seq:groupId:dataSource:displayRepresentation:isSelected:isPrimary:)(IntelligenceFlowShared::ContextMetadata *__return_ptr retstr, Swift::String_optional entityId, Swift::String_optional appBundleId, IntelligenceFlowShared::Confidence_optional *saliency, IntelligenceFlowShared::BoundingBox_optional *screenDimensions, Swift::OpaquePointer onScreenSurroundingText, IntelligenceFlowShared::BoundingBox_optional *onScreenBoundingBox, Swift::Double_optional seq, Swift::String_optional groupId, IntelligenceFlowShared::ContextDataSource_optional dataSource, IntelligenceFlowShared::ContextualEntityDisplayRepresentation_optional displayRepresentation, Swift::Bool isSelected, Swift::Bool isPrimary)
{
  Swift::Float score = saliency->value.score;
  IntelligenceFlowShared::ConfidenceBucket bucket = saliency->value.bucket;
  uint64_t v15 = *(void *)&screenDimensions->value.height;
  uint64_t v17 = *(void *)&onScreenBoundingBox->value.height;
  IntelligenceFlowShared::ContextDataSource v18 = *(unsigned char *)displayRepresentation.value.title._countAndFlagsBits;
  Swift::Bool is_nil = screenDimensions->is_nil;
  Swift::Bool v20 = onScreenBoundingBox->is_nil;
  *(_WORD *)&retstr->isSelected = displayRepresentation.value.subtitle.value._countAndFlagsBits;
  retstr->entityId = entityId;
  retstr->appBundleId = appBundleId;
  retstr->saliency.value.IntelligenceFlowShared::ConfidenceBucket bucket = bucket;
  retstr->saliency.value.Swift::Float score = score;
  *(_OWORD *)&retstr->screenDimensions.value.xCoordinate = *(_OWORD *)&screenDimensions->value.xCoordinate;
  *(void *)&retstr->screenDimensions.value.height = v15;
  retstr->screenDimensions.Swift::Bool is_nil = is_nil;
  retstr->onScreenSurroundingText = onScreenSurroundingText;
  *(_OWORD *)&retstr->onScreenBoundingBox.value.xCoordinate = *(_OWORD *)&onScreenBoundingBox->value.xCoordinate;
  *(void *)&retstr->onScreenBoundingBox.value.height = v17;
  retstr->onScreenBoundingBox.Swift::Bool is_nil = v20;
  retstr->seq.value = *(Swift::Double *)&seq.is_nil;
  retstr->seq.Swift::Bool is_nil = groupId.value._countAndFlagsBits & 1;
  retstr->groupId.value._countAndFlagsBits = (uint64_t)groupId.value._object;
  retstr->groupId.value._object = *(void **)&dataSource;
  retstr->dataSource.value = v18;
  Swift::String_optional v19 = (Swift::String_optional)*((_OWORD *)displayRepresentation.value.title._object + 1);
  retstr->displayRepresentation.value.title = *(Swift::String *)displayRepresentation.value.title._object;
  retstr->displayRepresentation.value.subtitle = v19;
}

uint64_t sub_253E4F1A4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7463656C65537369 && a2 == 0xEA00000000006465;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x72616D6972507369 && a2 == 0xE900000000000079;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6449797469746E65 && a2 == 0xE800000000000000;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x79636E65696C6173 && a2 == 0xE800000000000000;
          if (v9 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x8000000253E83390 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0xD000000000000017 && a2 == 0x8000000253E833B0 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0xD000000000000013 && a2 == 0x8000000253E833D0 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            BOOL v10 = a1 == 7431539 && a2 == 0xE300000000000000;
            if (v10 || (sub_253E82780() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 8;
            }
            else
            {
              BOOL v11 = a1 == 0x644970756F7267 && a2 == 0xE700000000000000;
              if (v11 || (sub_253E82780() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 9;
              }
              else
              {
                BOOL v12 = a1 == 0x72756F5361746164 && a2 == 0xEA00000000006563;
                if (v12 || (sub_253E82780() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else if (a1 == 0xD000000000000015 && a2 == 0x8000000253E833F0)
                {
                  swift_bridgeObjectRelease();
                  return 11;
                }
                else
                {
                  char v13 = sub_253E82780();
                  swift_bridgeObjectRelease();
                  if (v13) {
                    return 11;
                  }
                  else {
                    return 12;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_253E4F65C()
{
  return 12;
}

unint64_t sub_253E4F664(char a1)
{
  unint64_t result = 0x7463656C65537369;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x72616D6972507369;
      break;
    case 2:
      unint64_t result = 0x6449797469746E65;
      break;
    case 3:
      unint64_t result = 0x6C646E7542707061;
      break;
    case 4:
      unint64_t result = 0x79636E65696C6173;
      break;
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
      unint64_t result = 7431539;
      break;
    case 9:
      unint64_t result = 0x644970756F7267;
      break;
    case 10:
      unint64_t result = 0x72756F5361746164;
      break;
    case 11:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E4F7F0()
{
  return sub_253E4F664(*v0);
}

uint64_t sub_253E4F7F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E4F1A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E4F820@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E4F65C();
  *a1 = result;
  return result;
}

uint64_t sub_253E4F848(uint64_t a1)
{
  unint64_t v2 = sub_253E4FD7C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E4F884(uint64_t a1)
{
  unint64_t v2 = sub_253E4FD7C();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ContextMetadata.encode(to:)()
{
  sub_253E45CF0();
  uint64_t v3 = v2;
  sub_253E390C4(&qword_269D97768);
  sub_253E3B950();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  sub_253E45F88();
  uint64_t v7 = v3[3];
  BOOL v8 = v3;
  uint64_t v10 = v9;
  sub_253E39108(v8, v7);
  sub_253E4FD7C();
  sub_253E82860();
  sub_253E82720();
  if (!v0)
  {
    sub_253E82720();
    sub_253E5C64C(2);
    sub_253E826B0();
    sub_253E5C64C(3);
    sub_253E826B0();
    sub_253E4D30C();
    sub_253E826F0();
    sub_253E4FDC8();
    sub_253E5C3A0();
    sub_253E390C4(&qword_269D97780);
    sub_253E5068C((uint64_t)&unk_269D97788);
    sub_253E82750();
    sub_253E5C3A0();
    sub_253E5C64C(8);
    sub_253E826D0();
    sub_253E5C64C(9);
    sub_253E826B0();
    sub_253E4FE60();
    sub_253E826F0();
    sub_253E4FEAC();
    sub_253E826F0();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v10);
  sub_253E45D2C();
}

unint64_t sub_253E4FD7C()
{
  unint64_t result = qword_269D97770;
  if (!qword_269D97770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97770);
  }
  return result;
}

unint64_t sub_253E4FDC8()
{
  unint64_t result = qword_269D97778;
  if (!qword_269D97778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97778);
  }
  return result;
}

unint64_t sub_253E4FE14()
{
  unint64_t result = qword_269D97790;
  if (!qword_269D97790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97790);
  }
  return result;
}

unint64_t sub_253E4FE60()
{
  unint64_t result = qword_269D97798;
  if (!qword_269D97798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97798);
  }
  return result;
}

unint64_t sub_253E4FEAC()
{
  unint64_t result = qword_269D977A0;
  if (!qword_269D977A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D977A0);
  }
  return result;
}

void ContextMetadata.init(from:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_253E390C4(&qword_269D977A8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E4AE88();
  uint64_t v98 = (uint64_t)v2;
  sub_253E39108(v2, v2[3]);
  sub_253E4FD7C();
  sub_253E82850();
  if (v0)
  {
    int v8 = 0;
    unsigned int v9 = 0;
  }
  else
  {
    uint64_t v47 = v4;
    char v6 = sub_253E82650();
    sub_253E5C450(1);
    char v7 = sub_253E82650();
    uint64_t v46 = sub_253E5C334();
    char v44 = v6;
    LOBYTE(v51) = 3;
    uint64_t v11 = v10;
    swift_bridgeObjectRetain();
    uint64_t v49 = v11;
    uint64_t v43 = sub_253E5C334();
    LOBYTE(v50[0]) = 4;
    uint64_t v13 = v12;
    unint64_t v14 = sub_253E4DA88();
    swift_bridgeObjectRetain();
    sub_253E5C2F0();
    uint64_t v48 = v13;
    if (v14)
    {
      sub_253E45CE4();
      v15();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v8 = 0;
      unsigned int v9 = 12;
    }
    else
    {
      uint64_t v40 = v51;
      sub_253E50640();
      sub_253E5C56C();
      sub_253E82620();
      uint64_t v38 = v51;
      uint64_t v36 = v53;
      uint64_t v37 = v52;
      char v93 = v54;
      sub_253E390C4(&qword_269D97780);
      sub_253E5068C((uint64_t)&unk_269D977B8);
      sub_253E82680();
      LOBYTE(v50[0]) = 7;
      uint64_t v35 = v51;
      swift_bridgeObjectRetain();
      sub_253E5C56C();
      sub_253E82620();
      uint64_t v39 = v51;
      uint64_t v33 = v53;
      uint64_t v34 = v52;
      char v30 = v54;
      char v31 = v54;
      char v91 = v54;
      sub_253E5C450(8);
      uint64_t v32 = sub_253E82600();
      char v29 = v16;
      char v89 = v16 & 1;
      LOBYTE(v51) = 9;
      uint64_t v17 = sub_253E5C334();
      uint64_t v19 = v18;
      LOBYTE(v50[0]) = 10;
      unint64_t v20 = sub_253E50744();
      swift_bridgeObjectRetain();
      sub_253E5C2F0();
      if (!v20)
      {
        char v28 = v51;
        char v82 = 11;
        sub_253E50790();
        sub_253E82620();
        char v23 = v44 & 1;
        char v26 = v44 & 1;
        unint64_t v24 = v40 | ((unint64_t)BYTE4(v51) << 32);
        sub_253E4AE7C();
        v25();
        uint64_t v45 = v83;
        uint64_t v41 = v85;
        uint64_t v42 = v84;
        LOBYTE(v50[0]) = v23;
        BYTE1(v50[0]) = v7 & 1;
        v50[1] = v46;
        v50[2] = v49;
        v50[3] = v43;
        v50[4] = v48;
        uint64_t v27 = v86;
        BYTE4(v50[5]) = BYTE4(v24);
        LODWORD(v50[5]) = v24;
        v50[6] = v38;
        v50[7] = v37;
        v50[8] = v36;
        LOBYTE(v50[9]) = v31;
        v50[10] = v35;
        v50[11] = v39;
        v50[12] = v34;
        v50[13] = v33;
        LOBYTE(v50[14]) = v30;
        v50[15] = v32;
        LOBYTE(v50[16]) = v29 & 1;
        v50[17] = v17;
        v50[18] = v19;
        LOBYTE(v50[19]) = v28;
        v50[20] = v83;
        __n128 v50[21] = v84;
        v50[22] = v85;
        v50[23] = v86;
        sub_253E507DC((uint64_t)v50);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        memcpy(v47, v50, 0xC0uLL);
        sub_253E393E4(v98);
        LOBYTE(v51) = v26;
        BYTE1(v51) = v7 & 1;
        *(_DWORD *)((char *)&v51 + 2) = v96;
        HIWORD(v51) = v97;
        uint64_t v52 = v46;
        uint64_t v53 = v49;
        uint64_t v54 = v43;
        uint64_t v55 = v48;
        char v57 = BYTE4(v24);
        int v56 = v24;
        __int16 v58 = v94;
        char v59 = v95;
        uint64_t v60 = v38;
        uint64_t v61 = v37;
        uint64_t v62 = v36;
        char v63 = v93;
        *(_DWORD *)uint64_t v64 = *(_DWORD *)v92;
        *(_DWORD *)&v64[3] = *(_DWORD *)&v92[3];
        uint64_t v65 = v35;
        uint64_t v66 = v39;
        uint64_t v67 = v34;
        uint64_t v68 = v33;
        char v69 = v91;
        *(_DWORD *)uint64_t v70 = *(_DWORD *)v90;
        *(_DWORD *)&v70[3] = *(_DWORD *)&v90[3];
        uint64_t v71 = v32;
        char v72 = v89;
        *(_DWORD *)&v73[3] = *(_DWORD *)&v88[3];
        *(_DWORD *)uint64_t v73 = *(_DWORD *)v88;
        uint64_t v74 = v17;
        uint64_t v75 = v19;
        char v76 = v28;
        *(_DWORD *)&v77[3] = *(_DWORD *)&v87[3];
        *(_DWORD *)uint64_t v77 = *(_DWORD *)v87;
        uint64_t v78 = v45;
        uint64_t v79 = v42;
        uint64_t v80 = v41;
        uint64_t v81 = v27;
        sub_253E50860((uint64_t)&v51);
        goto LABEL_13;
      }
      uint64_t v21 = sub_253E5C1C8();
      v22(v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unsigned int v9 = 588;
      int v8 = 1;
    }
  }
  sub_253E393E4(v98);
  if ((v9 & 4) != 0)
  {
    swift_bridgeObjectRelease();
    if (((v9 >> 3) & 1) == 0)
    {
LABEL_6:
      if ((v9 >> 6)) {
        goto LABEL_7;
      }
      goto LABEL_11;
    }
  }
  else if ((v9 & 8) == 0)
  {
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  if ((v9 >> 6))
  {
LABEL_7:
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_11:
  if (v8) {
LABEL_12:
  }
    swift_bridgeObjectRelease();
LABEL_13:
  sub_253E45D2C();
}

unint64_t sub_253E50640()
{
  unint64_t result = qword_269D977B0;
  if (!qword_269D977B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D977B0);
  }
  return result;
}

unint64_t sub_253E5068C(uint64_t a1)
{
  unint64_t result = sub_253E5C614(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    sub_253E3AE54(&qword_269D97780);
    v4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_253E506F8()
{
  unint64_t result = qword_269D977C0;
  if (!qword_269D977C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D977C0);
  }
  return result;
}

unint64_t sub_253E50744()
{
  unint64_t result = qword_269D977C8;
  if (!qword_269D977C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D977C8);
  }
  return result;
}

unint64_t sub_253E50790()
{
  unint64_t result = qword_269D977D0;
  if (!qword_269D977D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D977D0);
  }
  return result;
}

uint64_t sub_253E507DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 160);
  uint64_t v3 = *(void *)(a1 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_253E4B7A4(v2, v3);
  return a1;
}

uint64_t sub_253E50860(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 160);
  uint64_t v3 = *(void *)(a1 + 168);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_253E4B964(v2, v3);
  return a1;
}

void sub_253E508E4()
{
}

void sub_253E508FC()
{
}

uint64_t ContextualEntityDisplayRepresentation.title.getter()
{
  return sub_253E39ECC();
}

uint64_t ContextualEntityDisplayRepresentation.subtitle.getter()
{
  return sub_253E39ECC();
}

IntelligenceFlowShared::ContextualEntityDisplayRepresentation __swiftcall ContextualEntityDisplayRepresentation.init(title:subtitle:)(Swift::String title, Swift::String_optional subtitle)
{
  v2->value = title;
  v2[1] = subtitle;
  result.subtitle = subtitle;
  result.title = title;
  return result;
}

uint64_t static ContextualEntityDisplayRepresentation.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v5 = a2[2];
  uint64_t v4 = a2[3];
  BOOL v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_253E82780(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v3)
    {
      if (v4)
      {
        if (v2 == v5 && v3 == v4) {
          return 1;
        }
        sub_253E5C6A0();
        if (sub_253E82780()) {
          return 1;
        }
      }
    }
    else if (!v4)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t ContextualEntityDisplayRepresentation.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_253E82360();
  swift_bridgeObjectRelease();
  if (!v1) {
    return sub_253E82820();
  }
  sub_253E82820();
  swift_bridgeObjectRetain();
  sub_253E82360();

  return swift_bridgeObjectRelease();
}

uint64_t sub_253E50AC8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_253E50BB0(char a1)
{
  if (a1) {
    return 0x656C746974627573;
  }
  else {
    return 0x656C746974;
  }
}

uint64_t sub_253E50BE4()
{
  return sub_253E50BB0(*v0);
}

uint64_t sub_253E50BEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E50AC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E50C14(uint64_t a1)
{
  unint64_t v2 = sub_253E50DAC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E50C50(uint64_t a1)
{
  unint64_t v2 = sub_253E50DAC();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ContextualEntityDisplayRepresentation.encode(to:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  sub_253E390C4(&qword_269D977D8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E45DFC();
  sub_253E39108(v2, v2[3]);
  sub_253E50DAC();
  sub_253E82860();
  sub_253E82710();
  if (!v0) {
    sub_253E826B0();
  }
  uint64_t v4 = sub_253E5C288();
  v5(v4);
  sub_253E45D2C();
}

unint64_t sub_253E50DAC()
{
  unint64_t result = qword_269D977E0;
  if (!qword_269D977E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D977E0);
  }
  return result;
}

uint64_t ContextualEntityDisplayRepresentation.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_253E5C468();
  swift_bridgeObjectRetain();
  sub_253E82360();
  swift_bridgeObjectRelease();
  sub_253E82820();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_253E82360();
    swift_bridgeObjectRelease();
  }
  return sub_253E82840();
}

void ContextualEntityDisplayRepresentation.init(from:)()
{
  sub_253E45CF0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_253E390C4(&qword_269D977E8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E5C24C();
  sub_253E50DAC();
  sub_253E5C4F8();
  if (v0)
  {
    sub_253E393E4(v2);
  }
  else
  {
    uint64_t v6 = sub_253E82640();
    uint64_t v8 = v7;
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_253E825E0();
    uint64_t v11 = v10;
    uint64_t v13 = v9;
    sub_253E45CE4();
    v12();
    *uint64_t v4 = v6;
    v4[1] = v8;
    v4[2] = v13;
    v4[3] = v11;
    swift_bridgeObjectRetain();
    sub_253E393E4(v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_253E45D2C();
}

void sub_253E5103C()
{
}

void sub_253E51054()
{
}

uint64_t sub_253E51078()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_253E82800();
  swift_bridgeObjectRetain();
  sub_253E82360();
  swift_bridgeObjectRelease();
  sub_253E82820();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_253E82360();
    swift_bridgeObjectRelease();
  }
  return sub_253E82840();
}

float BoundingBox.xCoordinate.getter()
{
  return *(float *)v0;
}

float BoundingBox.yCoordinate.getter()
{
  return *(float *)(v0 + 4);
}

float BoundingBox.zCoordinate.getter()
{
  return *(float *)(v0 + 8);
}

float BoundingBox.width.getter()
{
  return *(float *)(v0 + 12);
}

float BoundingBox.height.getter()
{
  return *(float *)(v0 + 16);
}

float BoundingBox.depth.getter()
{
  return *(float *)(v0 + 20);
}

void __swiftcall BoundingBox.init(xCoordinate:yCoordinate:zCoordinate:width:height:depth:)(IntelligenceFlowShared::BoundingBox *__return_ptr retstr, Swift::Float xCoordinate, Swift::Float yCoordinate, Swift::Float zCoordinate, Swift::Float width, Swift::Float height, Swift::Float depth)
{
  retstr->xCoordinate = xCoordinate;
  retstr->yCoordinate = yCoordinate;
  retstr->zCoordinate = zCoordinate;
  retstr->width = width;
  retstr->height = height;
  retstr->depth = depth;
}

BOOL static BoundingBox.== infix(_:_:)(float32x4_t *a1, float32x4_t *a2)
{
  BOOL result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*a1, *a2)), 0xFuLL))) & 1) != 0
    && a1[1].f32[0] == a2[1].f32[0])
  {
    return a1[1].f32[1] == a2[1].f32[1];
  }
  return result;
}

uint64_t sub_253E511B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6964726F6F4378 && a2 == 0xEB00000000657461;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E6964726F6F4379 && a2 == 0xEB00000000657461;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E6964726F6F437ALL && a2 == 0xEB00000000657461;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6874646977 && a2 == 0xE500000000000000;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x746867696568 && a2 == 0xE600000000000000;
          if (v9 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6874706564 && a2 == 0xE500000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_253E82780();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_253E51408(char a1)
{
  uint64_t result = 0x6E6964726F6F4378;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E6964726F6F4379;
      break;
    case 2:
      uint64_t result = 0x6E6964726F6F437ALL;
      break;
    case 3:
      uint64_t result = 0x6874646977;
      break;
    case 4:
      uint64_t result = 0x746867696568;
      break;
    case 5:
      uint64_t result = 0x6874706564;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E514B0()
{
  return sub_253E546E4();
}

uint64_t sub_253E514CC()
{
  return sub_253E51408(*v0);
}

uint64_t sub_253E514D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E511B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E514FC(uint64_t a1)
{
  unint64_t v2 = sub_253E516F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E51538(uint64_t a1)
{
  unint64_t v2 = sub_253E516F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BoundingBox.encode(to:)(void *a1)
{
  sub_253E390C4(&qword_269D977F0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E45DFC();
  sub_253E39108(a1, a1[3]);
  sub_253E516F4();
  sub_253E5C544();
  sub_253E5C1E0();
  if (!v1)
  {
    sub_253E5C1E0();
    sub_253E5C1E0();
    sub_253E5C1E0();
    sub_253E5C1E0();
    sub_253E5C1E0();
  }
  uint64_t v4 = sub_253E5C288();
  return v5(v4);
}

unint64_t sub_253E516F4()
{
  unint64_t result = qword_269D977F8;
  if (!qword_269D977F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D977F8);
  }
  return result;
}

uint64_t BoundingBox.init(from:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  sub_253E390C4(&qword_269D97800);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E5C24C();
  sub_253E516F4();
  sub_253E82850();
  if (!v2)
  {
    sub_253E5C230();
    int v7 = v6;
    sub_253E5C230();
    int v9 = v8;
    sub_253E5C230();
    int v11 = v10;
    sub_253E5C230();
    int v13 = v12;
    sub_253E5C230();
    int v16 = v15;
    sub_253E5C230();
    int v18 = v17;
    sub_253E45CE4();
    v19();
    *a2 = v7;
    a2[1] = v9;
    a2[2] = v11;
    a2[3] = v13;
    a2[4] = v16;
    a2[5] = v18;
  }
  return sub_253E393E4(a1);
}

uint64_t sub_253E51918@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  return BoundingBox.init(from:)(a1, a2);
}

uint64_t sub_253E51930(void *a1)
{
  return BoundingBox.encode(to:)(a1);
}

uint64_t SurroundingText.text.getter()
{
  return sub_253E39ECC();
}

double SurroundingText.onScreenBoundingBox.getter@<D0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  double result = *(double *)(v1 + 32);
  *(double *)(a1 + 16) = result;
  return result;
}

void __swiftcall SurroundingText.init(text:onScreenBoundingBox:)(IntelligenceFlowShared::SurroundingText *__return_ptr retstr, Swift::String text, IntelligenceFlowShared::BoundingBox *onScreenBoundingBox)
{
  retstr->text = text;
  retstr->onScreenBoundingBox = *onScreenBoundingBox;
}

uint64_t sub_253E519A4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000253E833D0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_253E51A84(char a1)
{
  if (a1) {
    return 0xD000000000000013;
  }
  else {
    return 1954047348;
  }
}

uint64_t sub_253E51AB8()
{
  return sub_253E51A84(*v0);
}

uint64_t sub_253E51AC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E519A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E51AE8(uint64_t a1)
{
  unint64_t v2 = sub_253E51CC4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E51B24(uint64_t a1)
{
  unint64_t v2 = sub_253E51CC4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SurroundingText.encode(to:)(void *a1)
{
  sub_253E390C4(&qword_269D97808);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E45DFC();
  sub_253E39108(a1, a1[3]);
  sub_253E51CC4();
  sub_253E82860();
  sub_253E82710();
  if (!v1)
  {
    sub_253E4FDC8();
    sub_253E82750();
  }
  sub_253E4AE7C();
  return v4();
}

unint64_t sub_253E51CC4()
{
  unint64_t result = qword_269D97810;
  if (!qword_269D97810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97810);
  }
  return result;
}

void SurroundingText.init(from:)()
{
  sub_253E45CF0();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_253E390C4(&qword_269D97818);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E5C24C();
  sub_253E51CC4();
  sub_253E5C4F8();
  if (v0)
  {
    sub_253E393E4(v2);
  }
  else
  {
    LOBYTE(v10) = 0;
    uint64_t v6 = sub_253E82640();
    uint64_t v8 = v7;
    sub_253E50640();
    swift_bridgeObjectRetain();
    sub_253E82680();
    sub_253E45CE4();
    v9();
    *(void *)uint64_t v4 = v6;
    *(void *)(v4 + 8) = v8;
    *(_OWORD *)(v4 + 16) = v10;
    *(void *)(v4 + 32) = v11;
    sub_253E393E4(v2);
    swift_bridgeObjectRelease();
  }
  sub_253E45D2C();
}

void sub_253E51EB4()
{
}

uint64_t sub_253E51ECC(void *a1)
{
  return SurroundingText.encode(to:)(a1);
}

float Confidence.score.getter()
{
  return *(float *)v0;
}

void Confidence.bucket.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 4);
}

uint64_t sub_253E51EF8()
{
  return sub_253E82840();
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Confidence.init(score:)(IntelligenceFlowShared::Confidence *__return_ptr retstr, Swift::Float score)
{
  if (score >= 0.5 || score < 0.0)
  {
    if (score >= 0.7)
    {
      if (score > 1.0)
      {
        sub_253E51FDC();
        sub_253E5C5FC();
        swift_willThrow();
        return;
      }
      IntelligenceFlowShared::ConfidenceBucket v2 = IntelligenceFlowShared_ConfidenceBucket_high;
    }
    else
    {
      IntelligenceFlowShared::ConfidenceBucket v2 = IntelligenceFlowShared_ConfidenceBucket_medium;
    }
  }
  else
  {
    IntelligenceFlowShared::ConfidenceBucket v2 = IntelligenceFlowShared_ConfidenceBucket_low;
  }
  retstr->Swift::Float score = score;
  retstr->IntelligenceFlowShared::ConfidenceBucket bucket = v2;
}

unint64_t sub_253E51FDC()
{
  unint64_t result = qword_269D97820;
  if (!qword_269D97820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97820);
  }
  return result;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Confidence.init(score:)(IntelligenceFlowShared::Confidence *__return_ptr retstr, Swift::Double score)
{
  float v2 = score;
  if (v2 >= 0.5 || v2 < 0.0)
  {
    if (v2 >= 0.7)
    {
      if (v2 > 1.0)
      {
        sub_253E51FDC();
        sub_253E5C5FC();
        swift_willThrow();
        return;
      }
      IntelligenceFlowShared::ConfidenceBucket v3 = IntelligenceFlowShared_ConfidenceBucket_high;
    }
    else
    {
      IntelligenceFlowShared::ConfidenceBucket v3 = IntelligenceFlowShared_ConfidenceBucket_medium;
    }
  }
  else
  {
    IntelligenceFlowShared::ConfidenceBucket v3 = IntelligenceFlowShared_ConfidenceBucket_low;
  }
  retstr->Swift::Float score = v2;
  retstr->IntelligenceFlowShared::ConfidenceBucket bucket = v3;
}

BOOL sub_253E520C0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_253E520D0()
{
  return sub_253E82810();
}

uint64_t sub_253E520F8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x65726F6373 && a2 == 0xE500000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74656B637562 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_253E521D8()
{
  return 2;
}

uint64_t sub_253E521E0()
{
  return sub_253E82840();
}

uint64_t sub_253E52220(char a1)
{
  if (a1) {
    return 0x74656B637562;
  }
  else {
    return 0x65726F6373;
  }
}

BOOL sub_253E52250(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_253E520C0(*a1, *a2);
}

uint64_t sub_253E5225C()
{
  return sub_253E521E0();
}

uint64_t sub_253E52278()
{
  return sub_253E520D0();
}

uint64_t sub_253E52280()
{
  return sub_253E52220(*v0);
}

uint64_t sub_253E52288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E520F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E522B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E521D8();
  *a1 = result;
  return result;
}

uint64_t sub_253E522D8(uint64_t a1)
{
  unint64_t v2 = sub_253E52474();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E52314(uint64_t a1)
{
  unint64_t v2 = sub_253E52474();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Confidence.encode(to:)(void *a1)
{
  sub_253E390C4(&qword_269D97828);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E45DFC();
  sub_253E39108(a1, a1[3]);
  sub_253E52474();
  sub_253E5C544();
  sub_253E5C1E0();
  if (!v1)
  {
    sub_253E524C0();
    sub_253E82750();
  }
  uint64_t v4 = sub_253E5C288();
  return v5(v4);
}

unint64_t sub_253E52474()
{
  unint64_t result = qword_269D97830;
  if (!qword_269D97830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97830);
  }
  return result;
}

unint64_t sub_253E524C0()
{
  unint64_t result = qword_269D97838;
  if (!qword_269D97838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97838);
  }
  return result;
}

uint64_t Confidence.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_253E390C4(&qword_269D97840);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E5C24C();
  sub_253E52474();
  sub_253E82850();
  if (!v2)
  {
    sub_253E82660();
    int v7 = v6;
    sub_253E52690();
    sub_253E82680();
    sub_253E45CE4();
    v8();
    *(_DWORD *)a2 = v7;
    *(unsigned char *)(a2 + 4) = v10;
  }
  return sub_253E393E4(a1);
}

unint64_t sub_253E52690()
{
  unint64_t result = qword_269D97848;
  if (!qword_269D97848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97848);
  }
  return result;
}

uint64_t sub_253E526DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return Confidence.init(from:)(a1, a2);
}

uint64_t sub_253E526F4(void *a1)
{
  return Confidence.encode(to:)(a1);
}

IntelligenceFlowShared::ContextType_optional __swiftcall ContextType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_253E82790();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 11;
  switch(v3)
  {
    case 0:
      goto LABEL_13;
    case 1:
      char v5 = 1;
      goto LABEL_13;
    case 2:
      char v5 = 2;
      goto LABEL_13;
    case 3:
      char v5 = 3;
      goto LABEL_13;
    case 4:
      char v5 = 4;
      goto LABEL_13;
    case 5:
      char v5 = 5;
      goto LABEL_13;
    case 6:
      char v5 = 6;
      goto LABEL_13;
    case 7:
      char v5 = 7;
      goto LABEL_13;
    case 8:
      char v5 = 8;
      goto LABEL_13;
    case 9:
      char v5 = 9;
      goto LABEL_13;
    case 10:
      char v5 = 10;
LABEL_13:
      char v6 = v5;
      break;
    case 11:
      break;
    case 12:
      char v6 = 12;
      break;
    case 13:
      char v6 = 13;
      break;
    case 14:
      char v6 = 14;
      break;
    case 15:
      char v6 = 15;
      break;
    case 16:
      char v6 = 16;
      break;
    case 17:
      char v6 = 17;
      break;
    case 18:
      char v6 = 18;
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    default:
      char v6 = 29;
      break;
  }
  char *v2 = v6;
  return result;
}

void *static ContextType.allCases.getter()
{
  return &unk_27036B6B0;
}

unint64_t ContextType.rawValue.getter()
{
  unint64_t result = 0xD000000000000012;
  switch(*v0)
  {
    case 1:
    case 0x16:
    case 0x17:
    case 0x18:
    case 0x1A:
      unint64_t result = sub_253E5C564(19);
      break;
    case 2:
      unint64_t result = sub_253E5C38C();
      break;
    case 3:
      unint64_t result = 0x4C746E6572727563;
      break;
    case 4:
      unint64_t result = 0x74536E6F69746F6DLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0x49664F746E696F70;
      break;
    case 7:
      unint64_t result = 0xD000000000000010;
      break;
    case 8:
      unint64_t result = 0xD000000000000010;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 0xA:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 0xB:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 0xC:
      unint64_t result = 0xD000000000000016;
      break;
    case 0xD:
      unint64_t result = 0xD000000000000018;
      break;
    case 0xE:
    case 0xF:
      unint64_t result = 0x6E65657263536E6FLL;
      break;
    case 0x10:
      unint64_t result = 0xD000000000000014;
      break;
    case 0x11:
      unint64_t result = 0xD000000000000010;
      break;
    case 0x12:
      unint64_t result = 0xD000000000000016;
      break;
    case 0x13:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 0x14:
      unint64_t result = 0xD000000000000014;
      break;
    case 0x15:
      unint64_t result = 0xD000000000000014;
      break;
    case 0x1B:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 0x1C:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E52BB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_253E3D0D8(*a1, *a2);
}

uint64_t sub_253E52BC4()
{
  return sub_253E5C6C8(*v0);
}

uint64_t sub_253E52BCC(uint64_t a1)
{
  return sub_253E5C814(a1, *v1);
}

uint64_t sub_253E52BD4(uint64_t a1)
{
  return sub_253E5CA18(a1, *v1);
}

IntelligenceFlowShared::ContextType_optional sub_253E52BDC(Swift::String *a1)
{
  return ContextType.init(rawValue:)(*a1);
}

unint64_t sub_253E52BE8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ContextType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_253E52C10()
{
  return sub_253E823F0();
}

uint64_t sub_253E52C70()
{
  return sub_253E823C0();
}

void sub_253E52CC0(void *a1@<X8>)
{
  *a1 = &unk_27036B6B0;
}

IntelligenceFlowShared::SourceType_optional __swiftcall SourceType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_253E825B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 6;
  if (v3 < 6) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

void *static SourceType.allCases.getter()
{
  return &unk_27036B7A0;
}

unint64_t SourceType.rawValue.getter()
{
  unint64_t result = 5395027;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x666E496563616C70;
      break;
    case 2:
      unint64_t result = 0x7865746E6F436975;
      break;
    case 3:
      unint64_t result = sub_253E5C564(20);
      break;
    case 4:
      unint64_t result = 0x74756374726F6873;
      break;
    case 5:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E52E10(unsigned __int8 *a1, char *a2)
{
  return sub_253E3D0F0(*a1, *a2);
}

uint64_t sub_253E52E1C()
{
  return sub_253E5C6FC();
}

uint64_t sub_253E52E24()
{
  return sub_253E5C82C();
}

uint64_t sub_253E52E2C()
{
  return sub_253E5C9D4();
}

IntelligenceFlowShared::SourceType_optional sub_253E52E34(Swift::String *a1)
{
  return SourceType.init(rawValue:)(*a1);
}

unint64_t sub_253E52E40@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SourceType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_253E52E68()
{
  return sub_253E823F0();
}

uint64_t sub_253E52EC8()
{
  return sub_253E823C0();
}

void sub_253E52F18(void *a1@<X8>)
{
  *a1 = &unk_27036B7A0;
}

IntelligenceFlowShared::EntityType_optional __swiftcall EntityType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  unint64_t v3 = sub_253E825B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 15;
  if (v3 < 0xF) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

unint64_t EntityType.rawValue.getter()
{
  unint64_t result = 0x6E6F697461636F6CLL;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x6E6F73726570;
      break;
    case 2:
      unint64_t result = 0x6D754E656E6F6870;
      break;
    case 3:
      unint64_t result = 0x6464416C69616D65;
      break;
    case 4:
      unint64_t result = 6910581;
      break;
    case 5:
      unint64_t result = 0x7469746E45707061;
      break;
    case 6:
      unint64_t result = 0x6563616C70;
      break;
    case 7:
      unint64_t result = 0x72656D6974;
      break;
    case 8:
      unint64_t result = 0x6D72616C61;
      break;
    case 9:
      unint64_t result = 0x6163696669746F6ELL;
      break;
    case 0xA:
      unint64_t result = sub_253E5C38C();
      break;
    case 0xB:
      unint64_t result = 0x7265646E696D6572;
      break;
    case 0xC:
      unint64_t result = sub_253E5C564(16);
      break;
    case 0xD:
      unint64_t result = 0x656D695465746164;
      break;
    case 0xE:
      unint64_t result = 0x657449616964656DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E53148(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_253E3D2D0(*a1, *a2);
}

uint64_t sub_253E53154()
{
  return sub_253E5C744(*v0);
}

uint64_t sub_253E5315C(uint64_t a1)
{
  return sub_253E5C940(a1, *v1);
}

uint64_t sub_253E53164(uint64_t a1)
{
  return sub_253E5C9BC(a1, *v1);
}

IntelligenceFlowShared::EntityType_optional sub_253E5316C(Swift::String *a1)
{
  return EntityType.init(rawValue:)(*a1);
}

unint64_t sub_253E53178@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = EntityType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_253E531A0()
{
  return sub_253E823F0();
}

uint64_t sub_253E53200()
{
  return sub_253E823C0();
}

uint64_t sub_253E53250(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E65657263536E6FLL && a2 == 0xE800000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x61737265766E6F63 && a2 == 0xEE006C616E6F6974;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x65636E756F6E6E61 && a2 == 0xEC000000746E656DLL;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x6163696669746F6ELL && a2 == 0xEC0000006E6F6974;
          if (v9 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6C6175736976 && a2 == 0xE600000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            char v11 = sub_253E82780();
            swift_bridgeObjectRelease();
            if (v11) {
              return 5;
            }
            else {
              return 6;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_253E5350C(char a1)
{
  uint64_t result = 0x6E65657263536E6FLL;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x61737265766E6F63;
      break;
    case 2:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    case 3:
      uint64_t result = 0x65636E756F6E6E61;
      break;
    case 4:
      uint64_t result = 0x6163696669746F6ELL;
      break;
    case 5:
      uint64_t result = 0x6C6175736976;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E535F4(uint64_t a1)
{
  unint64_t v2 = sub_253E53E28();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E53630(uint64_t a1)
{
  unint64_t v2 = sub_253E53E28();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E5366C()
{
  return sub_253E5350C(*v0);
}

uint64_t sub_253E53674@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E53250(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E5369C(uint64_t a1)
{
  unint64_t v2 = sub_253E53D44();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E536D8(uint64_t a1)
{
  unint64_t v2 = sub_253E53D44();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E53714(uint64_t a1)
{
  unint64_t v2 = sub_253E53EC0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E53750(uint64_t a1)
{
  unint64_t v2 = sub_253E53EC0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E5378C(uint64_t a1)
{
  unint64_t v2 = sub_253E53DDC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E537C8(uint64_t a1)
{
  unint64_t v2 = sub_253E53DDC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E53804(uint64_t a1)
{
  unint64_t v2 = sub_253E53F0C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E53840(uint64_t a1)
{
  unint64_t v2 = sub_253E53F0C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E5387C(uint64_t a1)
{
  unint64_t v2 = sub_253E53E74();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E538B8(uint64_t a1)
{
  unint64_t v2 = sub_253E53E74();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E538F4(uint64_t a1)
{
  unint64_t v2 = sub_253E53D90();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E53930(uint64_t a1)
{
  unint64_t v2 = sub_253E53D90();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ContextDataSource.encode(to:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  sub_253E390C4(&qword_269D97850);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E5C0EC();
  sub_253E390C4(&qword_269D97858);
  sub_253E3B950();
  MEMORY[0x270FA5388](v4);
  sub_253E5C3C8(v5, v14);
  sub_253E390C4(&qword_269D97860);
  sub_253E3B950();
  MEMORY[0x270FA5388](v6);
  sub_253E5C0EC();
  sub_253E390C4(&qword_269D97868);
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  sub_253E5C0EC();
  sub_253E390C4(&qword_269D97870);
  sub_253E3B950();
  MEMORY[0x270FA5388](v8);
  sub_253E5C1FC();
  sub_253E390C4(&qword_269D97878);
  sub_253E3B950();
  MEMORY[0x270FA5388](v9);
  sub_253E5C184();
  sub_253E390C4(&qword_269D97880);
  sub_253E3B950();
  MEMORY[0x270FA5388](v10);
  sub_253E4AE88();
  uint64_t v11 = *v0;
  sub_253E39108(v2, v2[3]);
  sub_253E53D44();
  sub_253E82860();
  switch(v11)
  {
    case 1:
      sub_253E53EC0();
      sub_253E5C19C();
      sub_253E5C58C();
      break;
    case 2:
      sub_253E53E74();
      sub_253E5C19C();
      break;
    case 3:
      sub_253E53E28();
      sub_253E5C19C();
      break;
    case 4:
      sub_253E53DDC();
      sub_253E5C19C();
      break;
    case 5:
      sub_253E53D90();
      sub_253E5C19C();
      break;
    default:
      sub_253E53F0C();
      sub_253E5C19C();
      sub_253E5C538();
      break;
  }
  sub_253E4AE7C();
  v12();
  sub_253E4AE7C();
  v13();
  sub_253E45D2C();
}

unint64_t sub_253E53D44()
{
  unint64_t result = qword_269D97888;
  if (!qword_269D97888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97888);
  }
  return result;
}

unint64_t sub_253E53D90()
{
  unint64_t result = qword_269D97890;
  if (!qword_269D97890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97890);
  }
  return result;
}

unint64_t sub_253E53DDC()
{
  unint64_t result = qword_269D97898;
  if (!qword_269D97898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97898);
  }
  return result;
}

unint64_t sub_253E53E28()
{
  unint64_t result = qword_269D978A0;
  if (!qword_269D978A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D978A0);
  }
  return result;
}

unint64_t sub_253E53E74()
{
  unint64_t result = qword_269D978A8;
  if (!qword_269D978A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D978A8);
  }
  return result;
}

unint64_t sub_253E53EC0()
{
  unint64_t result = qword_269D978B0;
  if (!qword_269D978B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D978B0);
  }
  return result;
}

unint64_t sub_253E53F0C()
{
  unint64_t result = qword_269D978B8;
  if (!qword_269D978B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D978B8);
  }
  return result;
}

void ContextDataSource.init(from:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  char v30 = v3;
  sub_253E390C4(&qword_269D978C0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v4);
  sub_253E5C3E4(v5, v27);
  sub_253E390C4(&qword_269D978C8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v6);
  sub_253E5C0EC();
  sub_253E390C4(&qword_269D978D0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  sub_253E5C0EC();
  sub_253E390C4(&qword_269D978D8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v8);
  sub_253E5C3C8(v9, v28);
  sub_253E390C4(&qword_269D978E0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v10);
  sub_253E45F88();
  sub_253E390C4(&qword_269D978E8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v11);
  sub_253E4AE88();
  sub_253E390C4(&qword_269D978F0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v12);
  sub_253E5C184();
  char v31 = v2;
  sub_253E39108(v2, v2[3]);
  sub_253E53D44();
  sub_253E82850();
  if (v0) {
    goto LABEL_12;
  }
  uint64_t v13 = sub_253E82690();
  uint64_t v14 = *(void *)(v13 + 16);
  if (!v14
    || (uint64_t v29 = *(unsigned __int8 *)(v13 + 32),
        sub_253E4AD60(1, v14, v13, v13 + 32, 0, (2 * v14) | 1),
        uint64_t v16 = v15,
        unint64_t v18 = v17,
        swift_bridgeObjectRelease(),
        v16 != v18 >> 1))
  {
    sub_253E82520();
    sub_253E5C5FC();
    unint64_t v20 = v19;
    sub_253E390C4(&qword_269D976A0);
    *unint64_t v20 = &type metadata for ContextDataSource;
    sub_253E825D0();
    sub_253E82510();
    sub_253E5C1BC();
    sub_253E5C580();
    v21();
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_253E4AE7C();
    v22();
LABEL_12:
    uint64_t v23 = (uint64_t)v31;
    goto LABEL_13;
  }
  switch(v29)
  {
    case 1:
      sub_253E53EC0();
      sub_253E5C214();
      goto LABEL_14;
    case 2:
      sub_253E53E74();
      sub_253E5C214();
      goto LABEL_14;
    case 3:
      sub_253E53E28();
      sub_253E5C214();
      sub_253E5C538();
      goto LABEL_15;
    case 4:
      sub_253E53DDC();
      sub_253E5C214();
      goto LABEL_14;
    case 5:
      sub_253E53D90();
      sub_253E5C214();
      goto LABEL_14;
    default:
      sub_253E53F0C();
      sub_253E5C214();
LABEL_14:
      sub_253E5C4D0();
LABEL_15:
      sub_253E4AE7C();
      v24();
      swift_unknownObjectRelease();
      uint64_t v25 = sub_253E5C638();
      v26(v25);
      uint64_t v23 = (uint64_t)v31;
      *char v30 = v29;
      break;
  }
LABEL_13:
  sub_253E393E4(v23);
  sub_253E45D2C();
}

void sub_253E5454C()
{
}

void sub_253E54564()
{
}

BOOL static ConfidenceBucket.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ConfidenceBucket.hash(into:)()
{
  return sub_253E82810();
}

uint64_t sub_253E545BC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7827308 && a2 == 0xE300000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6D756964656DLL && a2 == 0xE600000000000000;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 1751607656 && a2 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      char v8 = sub_253E82780();
      swift_bridgeObjectRelease();
      if (v8) {
        return 2;
      }
      else {
        return 3;
      }
    }
  }
}

uint64_t sub_253E546E4()
{
  return sub_253E82840();
}

uint64_t sub_253E54724(char a1)
{
  if (!a1) {
    return 7827308;
  }
  if (a1 == 1) {
    return 0x6D756964656DLL;
  }
  return 1751607656;
}

uint64_t sub_253E54768()
{
  return 1;
}

uint64_t sub_253E54788()
{
  return 0;
}

uint64_t sub_253E54794()
{
  return sub_253E54724(*v0);
}

uint64_t sub_253E5479C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E545BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E547C4(uint64_t a1)
{
  unint64_t v2 = sub_253E550D0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E54800(uint64_t a1)
{
  unint64_t v2 = sub_253E550D0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E5483C(uint64_t a1)
{
  unint64_t v2 = sub_253E5511C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E54878(uint64_t a1)
{
  unint64_t v2 = sub_253E5511C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E548B4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E54768();
  *a1 = result & 1;
  return result;
}

uint64_t sub_253E548E0(uint64_t a1)
{
  unint64_t v2 = sub_253E551B4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E5491C(uint64_t a1)
{
  unint64_t v2 = sub_253E551B4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E54958(uint64_t a1)
{
  unint64_t v2 = sub_253E55168();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E54994(uint64_t a1)
{
  unint64_t v2 = sub_253E55168();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ConfidenceBucket.encode(to:)()
{
  sub_253E45CF0();
  sub_253E390C4(&qword_269D978F8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v2);
  sub_253E5C3E4(v3, v14);
  sub_253E390C4(&qword_269D97900);
  sub_253E3B950();
  MEMORY[0x270FA5388](v4);
  sub_253E5C1FC();
  sub_253E390C4(&qword_269D97908);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E5C184();
  uint64_t v6 = sub_253E390C4(&qword_269D97910);
  sub_253E3B950();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_253E4AE88();
  int v10 = *v0;
  uint64_t v11 = (void *)sub_253E5C6A0();
  sub_253E39108(v11, v12);
  sub_253E550D0();
  sub_253E82860();
  if (v10)
  {
    if (v10 == 1)
    {
      sub_253E55168();
      sub_253E5C4B4();
      sub_253E5C58C();
    }
    else
    {
      sub_253E5511C();
      sub_253E5C4B4();
    }
  }
  else
  {
    sub_253E551B4();
    sub_253E5C4B4();
    sub_253E5C4D0();
  }
  sub_253E4AE7C();
  v13();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
  sub_253E45D2C();
}

uint64_t _s22IntelligenceFlowShared17ContextDataSourceO9hashValueSivg_0()
{
  return sub_253E82840();
}

void ConfidenceBucket.init(from:)()
{
  sub_253E45CF0();
  uint64_t v3 = v2;
  uint64_t v34 = v4;
  sub_253E390C4(&qword_269D97938);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E5C0EC();
  sub_253E390C4(&qword_269D97940);
  sub_253E3B950();
  MEMORY[0x270FA5388](v6);
  sub_253E45DFC();
  sub_253E390C4(&qword_269D97948);
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  sub_253E4AEA0();
  uint64_t v8 = sub_253E390C4(&qword_269D97950);
  sub_253E3B950();
  uint64_t v35 = v9;
  MEMORY[0x270FA5388](v10);
  sub_253E5C1FC();
  sub_253E39108(v3, v3[3]);
  sub_253E550D0();
  sub_253E82850();
  if (v0) {
    goto LABEL_10;
  }
  uint64_t v36 = v3;
  uint64_t v11 = v1;
  uint64_t v12 = sub_253E82690();
  uint64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
LABEL_9:
    sub_253E82520();
    sub_253E5C5FC();
    char v26 = v25;
    sub_253E390C4(&qword_269D976A0);
    *char v26 = &type metadata for ConfidenceBucket;
    sub_253E825D0();
    sub_253E82510();
    sub_253E5C1BC();
    sub_253E5C580();
    v27();
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v11, v8);
    uint64_t v3 = v36;
LABEL_10:
    uint64_t v28 = (uint64_t)v3;
    goto LABEL_11;
  }
  uint64_t v14 = v1;
  int v15 = *(unsigned __int8 *)(v12 + 32);
  sub_253E4AD60(1, v13, v12, v12 + 32, 0, (2 * v13) | 1);
  uint64_t v17 = v16;
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (v17 != v19 >> 1)
  {
    uint64_t v11 = v14;
    goto LABEL_9;
  }
  char v20 = v15;
  if (v15)
  {
    if (v15 == 1)
    {
      sub_253E55168();
      sub_253E5C4DC();
      uint64_t v21 = v34;
      sub_253E5C58C();
      sub_253E4AE7C();
      v22();
      swift_unknownObjectRelease();
      uint64_t v23 = sub_253E5C2A0();
      v24(v23);
    }
    else
    {
      sub_253E5511C();
      sub_253E5C4DC();
      uint64_t v21 = v34;
      sub_253E4AE7C();
      v31();
      swift_unknownObjectRelease();
      uint64_t v32 = sub_253E5C2A0();
      v33(v32);
      char v20 = v15;
    }
  }
  else
  {
    sub_253E551B4();
    sub_253E5C4DC();
    sub_253E5C4D0();
    sub_253E4AE7C();
    v29();
    swift_unknownObjectRelease();
    sub_253E4AE7C();
    v30();
    uint64_t v21 = v34;
  }
  *uint64_t v21 = v20;
  uint64_t v28 = (uint64_t)v36;
LABEL_11:
  sub_253E393E4(v28);
  sub_253E45D2C();
}

void sub_253E550A0()
{
}

void sub_253E550B8()
{
}

unint64_t sub_253E550D0()
{
  unint64_t result = qword_269D97918;
  if (!qword_269D97918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97918);
  }
  return result;
}

unint64_t sub_253E5511C()
{
  unint64_t result = qword_269D97920;
  if (!qword_269D97920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97920);
  }
  return result;
}

unint64_t sub_253E55168()
{
  unint64_t result = qword_269D97928;
  if (!qword_269D97928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97928);
  }
  return result;
}

unint64_t sub_253E551B4()
{
  unint64_t result = qword_269D97930;
  if (!qword_269D97930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97930);
  }
  return result;
}

unint64_t sub_253E55204()
{
  unint64_t result = qword_269D97958;
  if (!qword_269D97958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97958);
  }
  return result;
}

unint64_t sub_253E55254()
{
  unint64_t result = qword_26B257798;
  if (!qword_26B257798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257798);
  }
  return result;
}

unint64_t sub_253E552A0()
{
  return sub_253E55340((uint64_t)&unk_269D97960);
}

unint64_t sub_253E552CC()
{
  unint64_t result = qword_26B257790;
  if (!qword_26B257790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257790);
  }
  return result;
}

unint64_t sub_253E55318()
{
  return sub_253E55340((uint64_t)&unk_269D97970);
}

unint64_t sub_253E55340(uint64_t a1)
{
  unint64_t result = sub_253E5C614(a1);
  if (!result)
  {
    sub_253E3AE54(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_253E55390()
{
  unint64_t result = qword_269D97980;
  if (!qword_269D97980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97980);
  }
  return result;
}

unint64_t sub_253E553E0()
{
  unint64_t result = qword_269D97988;
  if (!qword_269D97988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97988);
  }
  return result;
}

unint64_t sub_253E55430()
{
  unint64_t result = qword_269D97990;
  if (!qword_269D97990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97990);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for RetrievedContext(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_253E82240();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)v4 + v13;
    int v15 = (char *)a2 + v13;
    if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2 + v13, 1, v11))
    {
      uint64_t v16 = sub_253E390C4(&qword_26B257828);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      v12(v14, v15, v11);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v14, 0, 1, v11);
    }
    uint64_t v18 = a3[7];
    unint64_t v19 = (void *)((char *)v4 + v18);
    char v20 = (char *)a2 + v18;
    uint64_t v21 = *(void *)((char *)a2 + v18 + 104);
    unint64_t v22 = *(void *)((char *)a2 + v18 + 192);
    unint64_t v23 = *(void *)((char *)a2 + v18 + 208);
    unint64_t v24 = *(void *)((char *)a2 + v18 + 232);
    unint64_t v25 = v22 >> 40;
    BOOL v27 = (v21 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v25 != 0 || v23 > 1;
    if ((v27 || v24 >= 0x10000)
      && ((v21 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFF0000 ? (BOOL v28 = v25 == 0) : (BOOL v28 = 0),
          v28 ? (BOOL v29 = v23 > 1) : (BOOL v29 = 1),
          v29 || v24 >= 0x10000))
    {
      uint64_t v82 = *((void *)v20 + 7);
      uint64_t v83 = *((void *)v20 + 6);
      uint64_t v80 = *((void *)v20 + 9);
      uint64_t v81 = *((void *)v20 + 8);
      uint64_t v78 = *((void *)v20 + 11);
      uint64_t v79 = *((void *)v20 + 10);
      uint64_t v77 = *((void *)v20 + 12);
      unint64_t v86 = *((void *)v20 + 15);
      uint64_t v87 = *((void *)v20 + 14);
      uint64_t v84 = *((void *)v20 + 17);
      uint64_t v85 = *((void *)v20 + 16);
      uint64_t v53 = *((void *)v20 + 18);
      uint64_t v54 = *((void *)v20 + 19);
      uint64_t v55 = *((void *)v20 + 20);
      uint64_t v56 = *((void *)v20 + 21);
      uint64_t v57 = *((void *)v20 + 22);
      uint64_t v58 = *((void *)v20 + 23);
      uint64_t v59 = *(void *)((char *)a2 + v18 + 192);
      uint64_t v60 = *((void *)v20 + 25);
      uint64_t v62 = *((void *)v20 + 27);
      uint64_t v63 = *((void *)v20 + 28);
      uint64_t v65 = *((void *)v20 + 30);
      uint64_t v66 = *((void *)v20 + 31);
      uint64_t v67 = *((void *)v20 + 32);
      uint64_t v68 = *((void *)v20 + 33);
      uint64_t v64 = *(void *)((char *)a2 + v18 + 232);
      uint64_t v69 = *((void *)v20 + 34);
      uint64_t v70 = *((void *)v20 + 35);
      uint64_t v52 = *(void *)((char *)a2 + v18 + 104);
      uint64_t v61 = *(void *)((char *)a2 + v18 + 208);
      uint64_t v71 = *((void *)v20 + 36);
      uint64_t v72 = *((void *)v20 + 37);
      uint64_t v73 = *((void *)v20 + 38);
      uint64_t v74 = *((void *)v20 + 39);
      uint64_t v75 = *((void *)v20 + 40);
      __int16 v76 = *((_WORD *)v20 + 164);
      uint64_t v31 = *((void *)v20 + 1);
      uint64_t v30 = *(void *)v20;
      uint64_t v32 = *((void *)v20 + 3);
      uint64_t v33 = *((void *)v20 + 2);
      uint64_t v34 = *((void *)v20 + 5);
      uint64_t v35 = *((void *)v20 + 4);
      sub_253E46340(*(void *)v20, v31, v33, v32, v35, v34, v83, v82, v81, v80, v79, v78, v77, v52, v87, v86, v85, v84, v53,
        v54,
        v55,
        v56,
        v57,
        v58,
        v22,
        v60,
        v23,
        v62,
        v63,
        v24,
        v65,
        v66,
        v67,
        v68,
        v69,
        v70,
        v71,
        v72,
        v73,
        v74,
        v75);
      *unint64_t v19 = v30;
      v19[1] = v31;
      v19[2] = v33;
      v19[3] = v32;
      v19[4] = v35;
      v19[5] = v34;
      v19[6] = v83;
      v19[7] = v82;
      v19[8] = v81;
      v19[9] = v80;
      v19[10] = v79;
      v19[11] = v78;
      v19[12] = v77;
      v19[13] = v52;
      v19[14] = v87;
      v19[15] = v86;
      v19[16] = v85;
      v19[17] = v84;
      v19[18] = v53;
      v19[19] = v54;
      v19[20] = v55;
      v19[21] = v56;
      v19[22] = v57;
      v19[23] = v58;
      v19[24] = v59;
      v19[25] = v60;
      v19[26] = v61;
      v19[27] = v62;
      v19[28] = v63;
      v19[29] = v64;
      v19[30] = v65;
      v19[31] = v66;
      v19[32] = v67;
      v19[33] = v68;
      v19[34] = v69;
      v19[35] = v70;
      v19[36] = v71;
      v19[37] = v72;
      v19[38] = v73;
      v19[39] = v74;
      v19[40] = v75;
      *((_WORD *)v19 + 164) = v76;
    }
    else
    {
      memcpy(v19, v20, 0x14AuLL);
    }
    uint64_t v36 = a3[8];
    uint64_t v37 = a3[9];
    uint64_t v38 = (char *)v4 + v36;
    uint64_t v39 = (char *)a2 + v36;
    *(_DWORD *)uint64_t v38 = *(_DWORD *)v39;
    v38[4] = v39[4];
    *((unsigned char *)v4 + v37) = *((unsigned char *)a2 + v37);
    uint64_t v40 = a3[10];
    uint64_t v41 = (char *)v4 + v40;
    uint64_t v42 = (char *)a2 + v40;
    uint64_t v43 = *((void *)v42 + 10);
    if (v43)
    {
      *(_WORD *)uint64_t v41 = *(_WORD *)v42;
      uint64_t v44 = *((void *)v42 + 2);
      *((void *)v41 + 1) = *((void *)v42 + 1);
      *((void *)v41 + 2) = v44;
      uint64_t v45 = *((void *)v42 + 4);
      *((void *)v41 + 3) = *((void *)v42 + 3);
      *((void *)v41 + 4) = v45;
      *((_DWORD *)v41 + 10) = *((_DWORD *)v42 + 10);
      v41[44] = v42[44];
      *((_OWORD *)v41 + 3) = *((_OWORD *)v42 + 3);
      *(_OWORD *)(v41 + 57) = *(_OWORD *)(v42 + 57);
      *((void *)v41 + 10) = v43;
      *(_OWORD *)(v41 + 88) = *(_OWORD *)(v42 + 88);
      *(_OWORD *)(v41 + 97) = *(_OWORD *)(v42 + 97);
      *((void *)v41 + 15) = *((void *)v42 + 15);
      v41[128] = v42[128];
      uint64_t v46 = *((void *)v42 + 18);
      *((void *)v41 + 17) = *((void *)v42 + 17);
      *((void *)v41 + 18) = v46;
      v41[152] = v42[152];
      uint64_t v47 = *((void *)v42 + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v47)
      {
        *((void *)v41 + 20) = *((void *)v42 + 20);
        *((void *)v41 + 21) = v47;
        uint64_t v48 = *((void *)v42 + 22);
        uint64_t v49 = *((void *)v42 + 23);
        *((void *)v41 + 22) = v48;
        *((void *)v41 + 23) = v49;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v50 = *((_OWORD *)v42 + 11);
        *((_OWORD *)v41 + 10) = *((_OWORD *)v42 + 10);
        *((_OWORD *)v41 + 11) = v50;
      }
    }
    else
    {
      memcpy((char *)v4 + v40, v42, 0xC0uLL);
    }
  }
  return v4;
}

void destroy for RetrievedContext(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_253E82240();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = a1 + a2[6];
  if (!_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v7, 1, v5)) {
    v6(v7, v5);
  }
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = *(void *)(v8 + 104);
  unint64_t v10 = *(void *)(v8 + 192);
  unint64_t v11 = *(void *)(v8 + 208);
  unint64_t v12 = *(void *)(v8 + 232);
  unint64_t v13 = v10 >> 40;
  BOOL v15 = (v9 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v13 != 0 || v11 > 1;
  if (v15 || v12 >= 0x10000)
  {
    BOOL v16 = (v9 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFF0000 && v13 == 0;
    BOOL v17 = !v16 || v11 > 1;
    if (v17 || v12 >= 0x10000)
    {
      long long v20 = *(_OWORD *)(v8 + 288);
      long long v21 = *(_OWORD *)(v8 + 304);
      long long v19 = *(_OWORD *)(v8 + 256);
      sub_253E467E8(*(void *)v8, *(void *)(v8 + 8), *(void *)(v8 + 16), *(void *)(v8 + 24), *(void *)(v8 + 32), *(void *)(v8 + 40), *(void *)(v8 + 48), *(void *)(v8 + 56), *(void *)(v8 + 64), *(void *)(v8 + 72), *(void *)(v8 + 80), *(void *)(v8 + 88), *(void *)(v8 + 96), v9, *(void *)(v8 + 112), *(void *)(v8 + 120), *(void *)(v8 + 128), *(void *)(v8 + 136), *(void *)(v8 + 144),
        *(void *)(v8 + 152),
        *(void *)(v8 + 160),
        *(void *)(v8 + 168),
        *(void *)(v8 + 176),
        *(void *)(v8 + 184),
        v10,
        *(void *)(v8 + 200),
        v11,
        *(void *)(v8 + 216),
        *(void *)(v8 + 224),
        v12,
        *(void *)(v8 + 240),
        *(void *)(v8 + 248),
        v19,
        *((uint64_t *)&v19 + 1),
        *(void *)(v8 + 272),
        *(void *)(v8 + 280),
        v20,
        *((uint64_t *)&v20 + 1),
        v21,
        *((uint64_t *)&v21 + 1),
        *(void *)(v8 + 320));
    }
  }
  uint64_t v18 = a1 + a2[10];
  if (*(void *)(v18 + 80))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(v18 + 168))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
}

void *initializeWithCopy for RetrievedContext(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_253E82240();
  unint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  unint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2 + v12, 1, v10))
  {
    uint64_t v15 = sub_253E390C4(&qword_26B257828);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v10);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v13, 0, 1, v10);
  }
  uint64_t v16 = a3[7];
  BOOL v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = *(void *)((char *)a2 + v16 + 104);
  unint64_t v20 = *(void *)((char *)a2 + v16 + 192);
  unint64_t v21 = *(void *)((char *)a2 + v16 + 208);
  unint64_t v22 = *(void *)((char *)a2 + v16 + 232);
  unint64_t v23 = v20 >> 40;
  BOOL v25 = (v19 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v23 != 0 || v21 > 1;
  if ((v25 || v22 >= 0x10000)
    && ((v19 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFF0000 ? (BOOL v26 = v23 == 0) : (BOOL v26 = 0),
        v26 ? (BOOL v27 = v21 > 1) : (BOOL v27 = 1),
        v27 || v22 >= 0x10000))
  {
    uint64_t v80 = *((void *)v18 + 7);
    uint64_t v81 = *((void *)v18 + 6);
    uint64_t v78 = *((void *)v18 + 9);
    uint64_t v79 = *((void *)v18 + 8);
    uint64_t v76 = *((void *)v18 + 11);
    uint64_t v77 = *((void *)v18 + 10);
    uint64_t v75 = *((void *)v18 + 12);
    unint64_t v84 = *((void *)v18 + 15);
    uint64_t v85 = *((void *)v18 + 14);
    uint64_t v82 = *((void *)v18 + 17);
    uint64_t v83 = *((void *)v18 + 16);
    uint64_t v51 = *((void *)v18 + 18);
    uint64_t v52 = *((void *)v18 + 19);
    uint64_t v53 = *((void *)v18 + 20);
    uint64_t v54 = *((void *)v18 + 21);
    uint64_t v55 = *((void *)v18 + 22);
    uint64_t v56 = *((void *)v18 + 23);
    uint64_t v57 = *(void *)((char *)a2 + v16 + 192);
    uint64_t v58 = *((void *)v18 + 25);
    uint64_t v60 = *((void *)v18 + 27);
    uint64_t v61 = *((void *)v18 + 28);
    uint64_t v63 = *((void *)v18 + 30);
    uint64_t v64 = *((void *)v18 + 31);
    uint64_t v65 = *((void *)v18 + 32);
    uint64_t v66 = *((void *)v18 + 33);
    uint64_t v62 = *(void *)((char *)a2 + v16 + 232);
    uint64_t v67 = *((void *)v18 + 34);
    uint64_t v68 = *((void *)v18 + 35);
    uint64_t v50 = *(void *)((char *)a2 + v16 + 104);
    uint64_t v59 = *(void *)((char *)a2 + v16 + 208);
    uint64_t v69 = *((void *)v18 + 36);
    uint64_t v70 = *((void *)v18 + 37);
    uint64_t v71 = *((void *)v18 + 38);
    uint64_t v72 = *((void *)v18 + 39);
    uint64_t v73 = *((void *)v18 + 40);
    __int16 v74 = *((_WORD *)v18 + 164);
    uint64_t v29 = *((void *)v18 + 1);
    uint64_t v28 = *(void *)v18;
    uint64_t v30 = *((void *)v18 + 3);
    uint64_t v31 = *((void *)v18 + 2);
    uint64_t v32 = *((void *)v18 + 5);
    uint64_t v33 = *((void *)v18 + 4);
    sub_253E46340(*(void *)v18, v29, v31, v30, v33, v32, v81, v80, v79, v78, v77, v76, v75, v50, v85, v84, v83, v82, v51,
      v52,
      v53,
      v54,
      v55,
      v56,
      v20,
      v58,
      v21,
      v60,
      v61,
      v22,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73);
    *BOOL v17 = v28;
    v17[1] = v29;
    v17[2] = v31;
    v17[3] = v30;
    v17[4] = v33;
    v17[5] = v32;
    _OWORD v17[6] = v81;
    v17[7] = v80;
    v17[8] = v79;
    v17[9] = v78;
    v17[10] = v77;
    v17[11] = v76;
    v17[12] = v75;
    v17[13] = v50;
    v17[14] = v85;
    v17[15] = v84;
    v17[16] = v83;
    v17[17] = v82;
    v17[18] = v51;
    v17[19] = v52;
    v17[20] = v53;
    v17[21] = v54;
    v17[22] = v55;
    v17[23] = v56;
    v17[24] = v57;
    v17[25] = v58;
    v17[26] = v59;
    v17[27] = v60;
    v17[28] = v61;
    v17[29] = v62;
    v17[30] = v63;
    v17[31] = v64;
    v17[32] = v65;
    v17[33] = v66;
    v17[34] = v67;
    v17[35] = v68;
    v17[36] = v69;
    v17[37] = v70;
    v17[38] = v71;
    v17[39] = v72;
    v17[40] = v73;
    *((_WORD *)v17 + 164) = v74;
  }
  else
  {
    memcpy(v17, v18, 0x14AuLL);
  }
  uint64_t v34 = a3[8];
  uint64_t v35 = a3[9];
  uint64_t v36 = (char *)a1 + v34;
  uint64_t v37 = (char *)a2 + v34;
  *(_DWORD *)uint64_t v36 = *(_DWORD *)v37;
  v36[4] = v37[4];
  *((unsigned char *)a1 + v35) = *((unsigned char *)a2 + v35);
  uint64_t v38 = a3[10];
  uint64_t v39 = (char *)a1 + v38;
  uint64_t v40 = (char *)a2 + v38;
  uint64_t v41 = *((void *)v40 + 10);
  if (v41)
  {
    *(_WORD *)uint64_t v39 = *(_WORD *)v40;
    uint64_t v42 = *((void *)v40 + 2);
    *((void *)v39 + 1) = *((void *)v40 + 1);
    *((void *)v39 + 2) = v42;
    uint64_t v43 = *((void *)v40 + 4);
    *((void *)v39 + 3) = *((void *)v40 + 3);
    *((void *)v39 + 4) = v43;
    *((_DWORD *)v39 + 10) = *((_DWORD *)v40 + 10);
    v39[44] = v40[44];
    *((_OWORD *)v39 + 3) = *((_OWORD *)v40 + 3);
    *(_OWORD *)(v39 + 57) = *(_OWORD *)(v40 + 57);
    *((void *)v39 + 10) = v41;
    *(_OWORD *)(v39 + 88) = *(_OWORD *)(v40 + 88);
    *(_OWORD *)(v39 + 97) = *(_OWORD *)(v40 + 97);
    *((void *)v39 + 15) = *((void *)v40 + 15);
    v39[128] = v40[128];
    uint64_t v44 = *((void *)v40 + 18);
    *((void *)v39 + 17) = *((void *)v40 + 17);
    *((void *)v39 + 18) = v44;
    v39[152] = v40[152];
    uint64_t v45 = *((void *)v40 + 21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v45)
    {
      *((void *)v39 + 20) = *((void *)v40 + 20);
      *((void *)v39 + 21) = v45;
      uint64_t v46 = *((void *)v40 + 22);
      uint64_t v47 = *((void *)v40 + 23);
      *((void *)v39 + 22) = v46;
      *((void *)v39 + 23) = v47;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v48 = *((_OWORD *)v40 + 11);
      *((_OWORD *)v39 + 10) = *((_OWORD *)v40 + 10);
      *((_OWORD *)v39 + 11) = v48;
    }
  }
  else
  {
    memcpy((char *)a1 + v38, v40, 0xC0uLL);
  }
  return a1;
}

void *assignWithCopy for RetrievedContext(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253E82240();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  uint64_t v12 = a3[6];
  unint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  int v15 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a1 + v12, 1, v9);
  int v16 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v14, 1, v9);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v14, v9);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v13, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
LABEL_6:
    uint64_t v17 = sub_253E390C4(&qword_26B257828);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  v11(v13, v14, v9);
LABEL_7:
  uint64_t v18 = a3[7];
  uint64_t v19 = (uint64_t)a1 + v18;
  unint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = *(void *)((char *)a1 + v18 + 104);
  unint64_t v22 = *(void *)((char *)a1 + v18 + 192);
  unint64_t v23 = *(void *)((char *)a1 + v18 + 208);
  unint64_t v24 = *(void *)((char *)a1 + v18 + 232);
  unint64_t v25 = v21 & 0xFFFFFFFFFFFF0000;
  uint64_t v26 = *((void *)v20 + 13);
  unint64_t v27 = *((void *)v20 + 24);
  unint64_t v28 = *((void *)v20 + 26);
  unint64_t v29 = *((void *)v20 + 29);
  unint64_t v30 = v26 & 0xFFFFFFFFFFFF0000;
  unint64_t v31 = v27 >> 40;
  BOOL v35 = (v26 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFE0000 && v31 == 0 && v28 < 2 && v29 < 0x10000;
  unint64_t v36 = v22 >> 40;
  if (v25 == 0xFFFFFFFE0000 && !v36 && v23 <= 1 && v24 < 0x10000)
  {
    if (!v35 && (v30 != 0xFFFFFFFF0000 || v31 || v28 > 1 || v29 >= 0x10000))
    {
      uint64_t v155 = *(void *)v20;
      uint64_t v147 = *((void *)v20 + 3);
      uint64_t v150 = *((void *)v20 + 2);
      uint64_t v141 = *((void *)v20 + 5);
      uint64_t v144 = *((void *)v20 + 4);
      uint64_t v139 = *((void *)v20 + 6);
      uint64_t v186 = *((void *)v20 + 9);
      uint64_t v189 = *((void *)v20 + 7);
      uint64_t v178 = *((void *)v20 + 10);
      uint64_t v181 = *((void *)v20 + 8);
      uint64_t v97 = *((void *)v20 + 11);
      uint64_t v98 = *((void *)v20 + 12);
      unint64_t v201 = *((void *)v20 + 15);
      uint64_t v204 = *((void *)v20 + 14);
      uint64_t v198 = *((void *)v20 + 16);
      uint64_t v99 = *((void *)v20 + 17);
      uint64_t v102 = *((void *)v20 + 18);
      uint64_t v192 = *((void *)v20 + 19);
      uint64_t v105 = *((void *)v20 + 20);
      uint64_t v108 = *((void *)v20 + 21);
      uint64_t v111 = *((void *)v20 + 22);
      uint64_t v195 = *((void *)v20 + 23);
      uint64_t v113 = *((void *)v20 + 25);
      uint64_t v115 = *((void *)v20 + 27);
      uint64_t v118 = *((void *)v20 + 28);
      uint64_t v121 = *((void *)v20 + 30);
      uint64_t v124 = *((void *)v20 + 31);
      uint64_t v127 = *((void *)v20 + 32);
      uint64_t v130 = *((void *)v20 + 33);
      uint64_t v133 = *((void *)v20 + 34);
      uint64_t v136 = *((void *)v20 + 35);
      uint64_t v158 = *((void *)v20 + 36);
      uint64_t v161 = *((void *)v20 + 37);
      uint64_t v164 = *((void *)v20 + 38);
      uint64_t v167 = *((void *)v20 + 39);
      uint64_t v170 = *((void *)v20 + 40);
      __int16 v175 = *((_WORD *)v20 + 164);
      uint64_t v37 = *((void *)v20 + 1);
      sub_253E46340(v155, v37, v150, v147, v144, v141, v139, v189, v181, v186, v178, v97, v98, v26, v204, v201, v198, v99, v102,
        v192,
        v105,
        v108,
        v111,
        v195,
        v27,
        v113,
        v28,
        v115,
        v118,
        v29,
        v121,
        v124,
        v127,
        v130,
        v133,
        v136,
        v158,
        v161,
        v164,
        v167,
        v170);
      *(void *)uint64_t v19 = v155;
      *(void *)(v19 + 8) = v37;
      *(void *)(v19 + 16) = v150;
      *(void *)(v19 + 24) = v147;
      *(void *)(v19 + 32) = v144;
      *(void *)(v19 + 40) = v141;
      *(void *)(v19 + 48) = v139;
      *(void *)(v19 + 56) = v189;
      *(void *)(v19 + 64) = v181;
      *(void *)(v19 + 72) = v186;
      *(void *)(v19 + 80) = v178;
      *(void *)(v19 + 88) = v97;
      *(void *)(v19 + 96) = v98;
      *(void *)(v19 + 104) = v26;
      *(void *)(v19 + 112) = v204;
      *(void *)(v19 + 120) = v201;
      *(void *)(v19 + 128) = v198;
      *(void *)(v19 + 136) = v99;
      *(void *)(v19 + 144) = v102;
      *(void *)(v19 + 152) = v192;
      *(void *)(v19 + 160) = v105;
      *(void *)(v19 + 168) = v108;
      *(void *)(v19 + 176) = v111;
      *(void *)(v19 + 184) = v195;
      *(void *)(v19 + 192) = v27;
      *(void *)(v19 + 200) = v113;
      *(void *)(v19 + 208) = v28;
      *(void *)(v19 + 216) = v115;
      *(void *)(v19 + 224) = v118;
      *(void *)(v19 + 232) = v29;
      *(void *)(v19 + 240) = v121;
      *(void *)(v19 + 248) = v124;
      *(void *)(v19 + 256) = v127;
      *(void *)(v19 + 264) = v130;
      *(void *)(v19 + 272) = v133;
      *(void *)(v19 + 280) = v136;
      *(void *)(v19 + 288) = v158;
      *(void *)(v19 + 296) = v161;
      *(void *)(v19 + 304) = v164;
      *(void *)(v19 + 312) = v167;
      *(void *)(v19 + 320) = v170;
      __int16 v38 = v175;
LABEL_49:
      *(_WORD *)(v19 + 328) = v38;
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  if (v35)
  {
    sub_253E56EF8(v19);
LABEL_53:
    memcpy((void *)v19, v20, 0x14AuLL);
    goto LABEL_54;
  }
  BOOL v42 = v30 == 0xFFFFFFFF0000 && v31 == 0 && v28 < 2 && v29 < 0x10000;
  if (v25 == 0xFFFFFFFF0000 && !v36 && v23 <= 1 && v24 < 0x10000)
  {
    if (!v42)
    {
      uint64_t v142 = *(void *)v20;
      uint64_t v187 = *((void *)v20 + 3);
      uint64_t v190 = *((void *)v20 + 2);
      uint64_t v182 = *((void *)v20 + 5);
      uint64_t v184 = *((void *)v20 + 4);
      uint64_t v176 = *((void *)v20 + 7);
      uint64_t v179 = *((void *)v20 + 6);
      uint64_t v171 = *((void *)v20 + 9);
      uint64_t v173 = *((void *)v20 + 8);
      uint64_t v165 = *((void *)v20 + 11);
      uint64_t v168 = *((void *)v20 + 10);
      uint64_t v162 = *((void *)v20 + 12);
      unint64_t v202 = *((void *)v20 + 15);
      uint64_t v205 = *((void *)v20 + 14);
      uint64_t v196 = *((void *)v20 + 17);
      uint64_t v199 = *((void *)v20 + 16);
      uint64_t v100 = *((void *)v20 + 18);
      uint64_t v193 = *((void *)v20 + 19);
      uint64_t v103 = *((void *)v20 + 20);
      uint64_t v106 = *((void *)v20 + 21);
      uint64_t v109 = *((void *)v20 + 22);
      uint64_t v112 = *((void *)v20 + 23);
      uint64_t v114 = *((void *)v20 + 25);
      uint64_t v116 = *((void *)v20 + 27);
      uint64_t v119 = *((void *)v20 + 28);
      uint64_t v122 = *((void *)v20 + 30);
      uint64_t v125 = *((void *)v20 + 31);
      uint64_t v128 = *((void *)v20 + 32);
      uint64_t v131 = *((void *)v20 + 33);
      uint64_t v134 = *((void *)v20 + 34);
      uint64_t v137 = *((void *)v20 + 35);
      uint64_t v145 = *((void *)v20 + 36);
      uint64_t v148 = *((void *)v20 + 37);
      uint64_t v151 = *((void *)v20 + 38);
      uint64_t v153 = *((void *)v20 + 39);
      uint64_t v156 = *((void *)v20 + 40);
      __int16 v159 = *((_WORD *)v20 + 164);
      uint64_t v43 = *((void *)v20 + 1);
      sub_253E46340(v142, v43, v190, v187, v184, v182, v179, v176, v173, v171, v168, v165, v162, v26, v205, v202, v199, v196, v100,
        v193,
        v103,
        v106,
        v109,
        v112,
        v27,
        v114,
        v28,
        v116,
        v119,
        v29,
        v122,
        v125,
        v128,
        v131,
        v134,
        v137,
        v145,
        v148,
        v151,
        v153,
        v156);
      *(void *)uint64_t v19 = v142;
      *(void *)(v19 + 8) = v43;
      *(void *)(v19 + 16) = v190;
      *(void *)(v19 + 24) = v187;
      *(void *)(v19 + 32) = v184;
      *(void *)(v19 + 40) = v182;
      *(void *)(v19 + 48) = v179;
      *(void *)(v19 + 56) = v176;
      *(void *)(v19 + 64) = v173;
      *(void *)(v19 + 72) = v171;
      *(void *)(v19 + 80) = v168;
      *(void *)(v19 + 88) = v165;
      *(void *)(v19 + 96) = v162;
      *(void *)(v19 + 104) = v26;
      *(void *)(v19 + 112) = v205;
      *(void *)(v19 + 120) = v202;
      *(void *)(v19 + 128) = v199;
      *(void *)(v19 + 136) = v196;
      *(void *)(v19 + 144) = v100;
      *(void *)(v19 + 152) = v193;
      *(void *)(v19 + 160) = v103;
      *(void *)(v19 + 168) = v106;
      *(void *)(v19 + 176) = v109;
      *(void *)(v19 + 184) = v112;
      *(void *)(v19 + 192) = v27;
      *(void *)(v19 + 200) = v114;
      *(void *)(v19 + 208) = v28;
      *(void *)(v19 + 216) = v116;
      *(void *)(v19 + 224) = v119;
      *(void *)(v19 + 232) = v29;
      *(void *)(v19 + 240) = v122;
      *(void *)(v19 + 248) = v125;
      *(void *)(v19 + 256) = v128;
      *(void *)(v19 + 264) = v131;
      *(void *)(v19 + 272) = v134;
      *(void *)(v19 + 280) = v137;
      *(void *)(v19 + 288) = v145;
      *(void *)(v19 + 296) = v148;
      *(void *)(v19 + 304) = v151;
      *(void *)(v19 + 312) = v153;
      *(void *)(v19 + 320) = v156;
      __int16 v38 = v159;
      goto LABEL_49;
    }
    goto LABEL_53;
  }
  if (v42)
  {
    sub_253E49A98(v19);
    goto LABEL_53;
  }
  uint64_t v188 = *((void *)v20 + 3);
  uint64_t v191 = *((void *)v20 + 2);
  uint64_t v183 = *((void *)v20 + 5);
  uint64_t v185 = *((void *)v20 + 4);
  uint64_t v177 = *((void *)v20 + 7);
  uint64_t v180 = *((void *)v20 + 6);
  uint64_t v172 = *((void *)v20 + 9);
  uint64_t v174 = *((void *)v20 + 8);
  uint64_t v166 = *((void *)v20 + 11);
  uint64_t v169 = *((void *)v20 + 10);
  uint64_t v163 = *((void *)v20 + 12);
  unint64_t v203 = *((void *)v20 + 15);
  uint64_t v206 = *((void *)v20 + 14);
  uint64_t v197 = *((void *)v20 + 17);
  uint64_t v200 = *((void *)v20 + 16);
  uint64_t v101 = *((void *)v20 + 18);
  uint64_t v194 = *((void *)v20 + 19);
  uint64_t v104 = *((void *)v20 + 20);
  uint64_t v107 = *((void *)v20 + 21);
  uint64_t v110 = *((void *)v20 + 22);
  uint64_t v117 = *((void *)v20 + 23);
  uint64_t v120 = *((void *)v20 + 25);
  uint64_t v123 = *((void *)v20 + 27);
  uint64_t v126 = *((void *)v20 + 28);
  uint64_t v129 = *((void *)v20 + 30);
  uint64_t v132 = *((void *)v20 + 31);
  uint64_t v135 = *((void *)v20 + 32);
  uint64_t v138 = *((void *)v20 + 33);
  uint64_t v140 = *((void *)v20 + 34);
  uint64_t v143 = *((void *)v20 + 35);
  uint64_t v146 = *((void *)v20 + 36);
  uint64_t v149 = *((void *)v20 + 37);
  uint64_t v152 = *((void *)v20 + 38);
  uint64_t v154 = *((void *)v20 + 39);
  uint64_t v157 = *((void *)v20 + 40);
  __int16 v160 = *((_WORD *)v20 + 164);
  uint64_t v67 = *(void *)v20;
  uint64_t v68 = *(void *)v20;
  uint64_t v69 = *((void *)v20 + 1);
  sub_253E46340(v68, v69, v191, v188, v185, v183, v180, v177, v174, v172, v169, v166, v163, v26, v206, v203, v200, v197, v101,
    v194,
    v104,
    v107,
    v110,
    v117,
    v27,
    v120,
    v28,
    v123,
    v126,
    v29,
    v129,
    v132,
    v135,
    v138,
    v140,
    v143,
    v146,
    v149,
    v152,
    v154,
    v157);
  uint64_t v70 = *(void *)v19;
  uint64_t v71 = *(void *)(v19 + 8);
  *(void *)uint64_t v19 = v67;
  *(void *)(v19 + 8) = v69;
  uint64_t v72 = *(void *)(v19 + 16);
  uint64_t v73 = *(void *)(v19 + 24);
  *(void *)(v19 + 16) = v191;
  *(void *)(v19 + 24) = v188;
  uint64_t v74 = *(void *)(v19 + 32);
  uint64_t v75 = *(void *)(v19 + 40);
  *(void *)(v19 + 32) = v185;
  *(void *)(v19 + 40) = v183;
  uint64_t v76 = *(void *)(v19 + 48);
  uint64_t v77 = *(void *)(v19 + 56);
  *(void *)(v19 + 48) = v180;
  *(void *)(v19 + 56) = v177;
  long long v78 = *(_OWORD *)(v19 + 64);
  long long v79 = *(_OWORD *)(v19 + 80);
  *(void *)(v19 + 64) = v174;
  *(void *)(v19 + 72) = v172;
  *(void *)(v19 + 80) = v169;
  *(void *)(v19 + 88) = v166;
  long long v80 = *(_OWORD *)(v19 + 96);
  long long v81 = *(_OWORD *)(v19 + 112);
  *(void *)(v19 + 96) = v163;
  *(void *)(v19 + 104) = v26;
  *(void *)(v19 + 112) = v206;
  *(void *)(v19 + 120) = v203;
  long long v82 = *(_OWORD *)(v19 + 128);
  long long v83 = *(_OWORD *)(v19 + 144);
  *(void *)(v19 + 128) = v200;
  *(void *)(v19 + 136) = v197;
  *(void *)(v19 + 144) = v101;
  *(void *)(v19 + 152) = v194;
  long long v84 = *(_OWORD *)(v19 + 160);
  long long v85 = *(_OWORD *)(v19 + 176);
  *(void *)(v19 + 160) = v104;
  *(void *)(v19 + 168) = v107;
  *(void *)(v19 + 176) = v110;
  long long v86 = *(_OWORD *)(v19 + 192);
  long long v87 = *(_OWORD *)(v19 + 208);
  *(void *)(v19 + 184) = v117;
  *(void *)(v19 + 192) = v27;
  *(void *)(v19 + 200) = v120;
  *(void *)(v19 + 208) = v28;
  *(void *)(v19 + 216) = v123;
  long long v88 = *(_OWORD *)(v19 + 224);
  long long v89 = *(_OWORD *)(v19 + 240);
  *(void *)(v19 + 224) = v126;
  *(void *)(v19 + 232) = v29;
  *(void *)(v19 + 240) = v129;
  *(void *)(v19 + 248) = v132;
  long long v90 = *(_OWORD *)(v19 + 256);
  long long v91 = *(_OWORD *)(v19 + 272);
  *(void *)(v19 + 256) = v135;
  *(void *)(v19 + 264) = v138;
  *(void *)(v19 + 272) = v140;
  *(void *)(v19 + 280) = v143;
  long long v92 = *(_OWORD *)(v19 + 288);
  long long v93 = *(_OWORD *)(v19 + 304);
  *(void *)(v19 + 288) = v146;
  *(void *)(v19 + 296) = v149;
  *(void *)(v19 + 304) = v152;
  *(void *)(v19 + 312) = v154;
  uint64_t v94 = *(void *)(v19 + 320);
  *(void *)(v19 + 320) = v157;
  *(_WORD *)(v19 + 328) = v160;
  sub_253E467E8(v70, v71, v72, v73, v74, v75, v76, v77, v78, *((uint64_t *)&v78 + 1), v79, *((uint64_t *)&v79 + 1), v80, *((uint64_t *)&v80 + 1), v81, *((unint64_t *)&v81 + 1), v82, *((uint64_t *)&v82 + 1), v83,
    *((uint64_t *)&v83 + 1),
    v84,
    *((uint64_t *)&v84 + 1),
    v85,
    *((uint64_t *)&v85 + 1),
    v86,
    *((uint64_t *)&v86 + 1),
    v87,
    *((uint64_t *)&v87 + 1),
    v88,
    *((unint64_t *)&v88 + 1),
    v89,
    *((uint64_t *)&v89 + 1),
    v90,
    *((uint64_t *)&v90 + 1),
    v91,
    *((uint64_t *)&v91 + 1),
    v92,
    *((uint64_t *)&v92 + 1),
    v93,
    *((uint64_t *)&v93 + 1),
    v94);
LABEL_54:
  uint64_t v44 = a3[8];
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  int v47 = *(_DWORD *)v46;
  v45[4] = v46[4];
  *(_DWORD *)uint64_t v45 = v47;
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  uint64_t v48 = a3[10];
  uint64_t v49 = (uint64_t)a1 + v48;
  uint64_t v50 = (char *)a2 + v48;
  uint64_t v51 = *(void *)((char *)a1 + v48 + 80);
  uint64_t v52 = *((void *)v50 + 10);
  if (!v51)
  {
    if (v52)
    {
      *(unsigned char *)uint64_t v49 = *v50;
      *(unsigned char *)(v49 + 1) = v50[1];
      *(void *)(v49 + 8) = *((void *)v50 + 1);
      *(void *)(v49 + 16) = *((void *)v50 + 2);
      *(void *)(v49 + 24) = *((void *)v50 + 3);
      *(void *)(v49 + 32) = *((void *)v50 + 4);
      int v60 = *((_DWORD *)v50 + 10);
      *(unsigned char *)(v49 + 44) = v50[44];
      *(_DWORD *)(v49 + 40) = v60;
      long long v61 = *((_OWORD *)v50 + 3);
      *(_OWORD *)(v49 + 57) = *(_OWORD *)(v50 + 57);
      *(_OWORD *)(v49 + 48) = v61;
      *(void *)(v49 + 80) = *((void *)v50 + 10);
      long long v62 = *(_OWORD *)(v50 + 88);
      *(_OWORD *)(v49 + 97) = *(_OWORD *)(v50 + 97);
      *(_OWORD *)(v49 + 88) = v62;
      uint64_t v63 = *((void *)v50 + 15);
      *(unsigned char *)(v49 + 128) = v50[128];
      *(void *)(v49 + 120) = v63;
      *(void *)(v49 + 136) = *((void *)v50 + 17);
      *(void *)(v49 + 144) = *((void *)v50 + 18);
      *(unsigned char *)(v49 + 152) = v50[152];
      uint64_t v64 = *((void *)v50 + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v64)
      {
        long long v65 = *((_OWORD *)v50 + 11);
        *(_OWORD *)(v49 + 160) = *((_OWORD *)v50 + 10);
        *(_OWORD *)(v49 + 176) = v65;
        return a1;
      }
LABEL_65:
      *(void *)(v49 + 160) = *((void *)v50 + 20);
      *(void *)(v49 + 168) = *((void *)v50 + 21);
      *(void *)(v49 + 176) = *((void *)v50 + 22);
      *(void *)(v49 + 184) = *((void *)v50 + 23);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_63:
    memcpy((void *)v49, v50, 0xC0uLL);
    return a1;
  }
  if (!v52)
  {
    sub_253E56F7C(v49);
    goto LABEL_63;
  }
  *(unsigned char *)uint64_t v49 = *v50;
  *(unsigned char *)(v49 + 1) = v50[1];
  *(void *)(v49 + 8) = *((void *)v50 + 1);
  *(void *)(v49 + 16) = *((void *)v50 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v49 + 24) = *((void *)v50 + 3);
  *(void *)(v49 + 32) = *((void *)v50 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v53 = *((_DWORD *)v50 + 10);
  *(unsigned char *)(v49 + 44) = v50[44];
  *(_DWORD *)(v49 + 40) = v53;
  long long v54 = *(_OWORD *)(v50 + 57);
  *(_OWORD *)(v49 + 48) = *((_OWORD *)v50 + 3);
  *(_OWORD *)(v49 + 57) = v54;
  *(void *)(v49 + 80) = *((void *)v50 + 10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v55 = *(_OWORD *)(v50 + 88);
  *(_OWORD *)(v49 + 97) = *(_OWORD *)(v50 + 97);
  *(_OWORD *)(v49 + 88) = v55;
  uint64_t v56 = *((void *)v50 + 15);
  *(unsigned char *)(v49 + 128) = v50[128];
  *(void *)(v49 + 120) = v56;
  *(void *)(v49 + 136) = *((void *)v50 + 17);
  *(void *)(v49 + 144) = *((void *)v50 + 18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v49 + 152) = v50[152];
  uint64_t v57 = (_OWORD *)(v49 + 160);
  uint64_t v58 = v50 + 160;
  uint64_t v59 = *((void *)v50 + 21);
  if (!*(void *)(v49 + 168))
  {
    if (!v59)
    {
      long long v95 = *((_OWORD *)v50 + 11);
      *uint64_t v57 = *v58;
      *(_OWORD *)(v49 + 176) = v95;
      return a1;
    }
    goto LABEL_65;
  }
  if (v59)
  {
    *(void *)(v49 + 160) = *((void *)v50 + 20);
    *(void *)(v49 + 168) = *((void *)v50 + 21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v49 + 176) = *((void *)v50 + 22);
    *(void *)(v49 + 184) = *((void *)v50 + 23);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_253E56F4C(v49 + 160);
    long long v66 = *((_OWORD *)v50 + 11);
    *uint64_t v57 = *v58;
    *(_OWORD *)(v49 + 176) = v66;
  }
  return a1;
}

uint64_t sub_253E56EF8(uint64_t a1)
{
  return a1;
}

uint64_t sub_253E56F4C(uint64_t a1)
{
  return a1;
}

uint64_t sub_253E56F7C(uint64_t a1)
{
  return a1;
}

_OWORD *initializeWithTake for RetrievedContext(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253E82240();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  unint64_t v13 = (char *)a2 + v11;
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2 + v11, 1, v9))
  {
    uint64_t v14 = sub_253E390C4(&qword_26B257828);
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    v10(v12, v13, v9);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v12, 0, 1, v9);
  }
  memcpy((char *)a1 + a3[7], (char *)a2 + a3[7], 0x14AuLL);
  uint64_t v15 = a3[8];
  uint64_t v16 = a3[9];
  uint64_t v17 = (char *)a1 + v15;
  uint64_t v18 = (char *)a2 + v15;
  *(_DWORD *)uint64_t v17 = *(_DWORD *)v18;
  char v19 = *((unsigned char *)a2 + v16);
  v17[4] = v18[4];
  *((unsigned char *)a1 + v16) = v19;
  memcpy((char *)a1 + a3[10], (char *)a2 + a3[10], 0xC0uLL);
  return a1;
}

void *assignWithTake for RetrievedContext(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_253E82240();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  int v16 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a1 + v13, 1, v10);
  int v17 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v15, 1, v10);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v15, v10);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v14, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
LABEL_6:
    uint64_t v18 = sub_253E390C4(&qword_26B257828);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  v12(v14, v15, v10);
LABEL_7:
  uint64_t v19 = a3[7];
  unint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (_OWORD *)((char *)a2 + v19);
  uint64_t v22 = *(void *)((char *)a1 + v19 + 104);
  unint64_t v23 = v20[24];
  unint64_t v24 = v20[26];
  unint64_t v25 = v20[29];
  unint64_t v26 = v23 >> 40;
  BOOL v28 = (v22 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v26 != 0 || v24 > 1;
  if (!v28 && v25 < 0x10000) {
    goto LABEL_33;
  }
  uint64_t v29 = *((void *)v21 + 13);
  unint64_t v30 = *((void *)v21 + 24);
  unint64_t v31 = *((void *)v21 + 26);
  unint64_t v32 = *((void *)v21 + 29);
  unint64_t v33 = v30 >> 40;
  BOOL v35 = (v29 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v33 != 0 || v31 > 1;
  if (!v35 && v32 < 0x10000)
  {
    sub_253E56EF8((uint64_t)v20);
LABEL_33:
    memcpy(v20, v21, 0x14AuLL);
    goto LABEL_34;
  }
  if ((v22 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFF0000 && !v26 && v24 <= 1 && v25 < 0x10000) {
    goto LABEL_33;
  }
  if ((v29 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFF0000 && !v33 && v31 <= 1 && v32 < 0x10000)
  {
    sub_253E49A98((uint64_t)v20);
    goto LABEL_33;
  }
  uint64_t v50 = *((void *)v21 + 12);
  uint64_t v51 = *((void *)v21 + 25);
  uint64_t v52 = *((void *)v21 + 40);
  __int16 v53 = *((_WORD *)v21 + 164);
  uint64_t v86 = *v20;
  uint64_t v85 = v20[1];
  uint64_t v84 = v20[2];
  uint64_t v54 = v20[4];
  uint64_t v83 = v20[3];
  uint64_t v55 = v20[5];
  uint64_t v56 = v20[6];
  uint64_t v57 = v20[7];
  long long v58 = *((_OWORD *)v20 + 4);
  long long v59 = *((_OWORD *)v20 + 5);
  uint64_t v60 = v20[12];
  long long v61 = *((_OWORD *)v20 + 7);
  long long v62 = *((_OWORD *)v20 + 8);
  long long v63 = *((_OWORD *)v20 + 9);
  long long v64 = *((_OWORD *)v20 + 10);
  uint64_t v65 = v20[22];
  uint64_t v66 = v20[23];
  uint64_t v67 = v20[25];
  uint64_t v68 = v20[27];
  uint64_t v69 = v20[28];
  long long v70 = *((_OWORD *)v20 + 15);
  long long v71 = *((_OWORD *)v20 + 16);
  long long v72 = *((_OWORD *)v20 + 17);
  long long v73 = *((_OWORD *)v20 + 18);
  long long v74 = *((_OWORD *)v20 + 19);
  uint64_t v75 = v20[40];
  long long v76 = v21[1];
  *(_OWORD *)unint64_t v20 = *v21;
  *((_OWORD *)v20 + 1) = v76;
  long long v77 = v21[3];
  *((_OWORD *)v20 + 2) = v21[2];
  *((_OWORD *)v20 + 3) = v77;
  long long v78 = v21[5];
  *((_OWORD *)v20 + 4) = v21[4];
  *((_OWORD *)v20 + 5) = v78;
  v20[12] = v50;
  v20[13] = v29;
  long long v79 = v21[8];
  *((_OWORD *)v20 + 7) = v21[7];
  *((_OWORD *)v20 + 8) = v79;
  long long v80 = v21[10];
  *((_OWORD *)v20 + 9) = v21[9];
  *((_OWORD *)v20 + 10) = v80;
  *((_OWORD *)v20 + 11) = v21[11];
  v20[24] = v30;
  v20[25] = v51;
  v20[26] = v31;
  *(_OWORD *)(v20 + 27) = *(_OWORD *)((char *)v21 + 216);
  v20[29] = v32;
  long long v81 = v21[16];
  *((_OWORD *)v20 + 15) = v21[15];
  *((_OWORD *)v20 + 16) = v81;
  long long v82 = v21[18];
  *((_OWORD *)v20 + 17) = v21[17];
  *((_OWORD *)v20 + 18) = v82;
  *((_OWORD *)v20 + 19) = v21[19];
  v20[40] = v52;
  *((_WORD *)v20 + 164) = v53;
  sub_253E467E8(v86, v85, v84, v83, v54, v55, v56, v57, v58, *((uint64_t *)&v58 + 1), v59, *((uint64_t *)&v59 + 1), v60, v22, v61, *((unint64_t *)&v61 + 1), v62, *((uint64_t *)&v62 + 1), v63,
    *((uint64_t *)&v63 + 1),
    v64,
    *((uint64_t *)&v64 + 1),
    v65,
    v66,
    v23,
    v67,
    v24,
    v68,
    v69,
    v25,
    v70,
    *((uint64_t *)&v70 + 1),
    v71,
    *((uint64_t *)&v71 + 1),
    v72,
    *((uint64_t *)&v72 + 1),
    v73,
    *((uint64_t *)&v73 + 1),
    v74,
    *((uint64_t *)&v74 + 1),
    v75);
LABEL_34:
  uint64_t v36 = a3[8];
  uint64_t v37 = a3[9];
  __int16 v38 = (char *)a1 + v36;
  uint64_t v39 = (char *)a2 + v36;
  *(_DWORD *)__int16 v38 = *(_DWORD *)v39;
  v38[4] = v39[4];
  *((unsigned char *)a1 + v37) = *((unsigned char *)a2 + v37);
  uint64_t v40 = a3[10];
  uint64_t v41 = (char *)a1 + v40;
  BOOL v42 = (char *)a2 + v40;
  if (!*(void *)((char *)a1 + v40 + 80))
  {
LABEL_40:
    memcpy(v41, v42, 0xC0uLL);
    return a1;
  }
  if (!*((void *)v42 + 10))
  {
    sub_253E56F7C((uint64_t)v41);
    goto LABEL_40;
  }
  *uint64_t v41 = *v42;
  v41[1] = v42[1];
  uint64_t v43 = *((void *)v42 + 2);
  *((void *)v41 + 1) = *((void *)v42 + 1);
  *((void *)v41 + 2) = v43;
  swift_bridgeObjectRelease();
  uint64_t v44 = *((void *)v42 + 4);
  *((void *)v41 + 3) = *((void *)v42 + 3);
  *((void *)v41 + 4) = v44;
  swift_bridgeObjectRelease();
  *((_DWORD *)v41 + 10) = *((_DWORD *)v42 + 10);
  v41[44] = v42[44];
  *((_OWORD *)v41 + 3) = *((_OWORD *)v42 + 3);
  *(_OWORD *)(v41 + 57) = *(_OWORD *)(v42 + 57);
  *((void *)v41 + 10) = *((void *)v42 + 10);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v41 + 88) = *(_OWORD *)(v42 + 88);
  *(_OWORD *)(v41 + 97) = *(_OWORD *)(v42 + 97);
  *((void *)v41 + 15) = *((void *)v42 + 15);
  v41[128] = v42[128];
  uint64_t v45 = *((void *)v42 + 18);
  *((void *)v41 + 17) = *((void *)v42 + 17);
  *((void *)v41 + 18) = v45;
  swift_bridgeObjectRelease();
  v41[152] = v42[152];
  if (!*((void *)v41 + 21))
  {
LABEL_43:
    long long v48 = *((_OWORD *)v42 + 11);
    *((_OWORD *)v41 + 10) = *((_OWORD *)v42 + 10);
    *((_OWORD *)v41 + 11) = v48;
    return a1;
  }
  uint64_t v46 = *((void *)v42 + 21);
  if (!v46)
  {
    sub_253E56F4C((uint64_t)(v41 + 160));
    goto LABEL_43;
  }
  *((void *)v41 + 20) = *((void *)v42 + 20);
  *((void *)v41 + 21) = v46;
  swift_bridgeObjectRelease();
  uint64_t v47 = *((void *)v42 + 23);
  *((void *)v41 + 22) = *((void *)v42 + 22);
  *((void *)v41 + 23) = v47;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RetrievedContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253E575D8);
}

uint64_t sub_253E575D8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_253E82240();
    sub_253E5C0D8();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v10 = sub_253E390C4(&qword_26B257828);
      uint64_t v11 = *(int *)(a3 + 24);
    }
    return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for RetrievedContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253E576A0);
}

uint64_t sub_253E576A0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    sub_253E82240();
    sub_253E5C0D8();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = sub_253E390C4(&qword_26B257828);
      uint64_t v11 = *(int *)(a4 + 24);
    }
    return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_253E57750()
{
  sub_253E82240();
  if (v0 <= 0x3F)
  {
    sub_253E5784C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_253E5784C()
{
  if (!qword_26B257BC8)
  {
    sub_253E82240();
    unint64_t v0 = sub_253E824A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B257BC8);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ContextValue(uint64_t *a1, uint64_t *a2, int *a3)
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
    uint64_t v7 = sub_253E82240();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2 + v9, 1, v7))
    {
      uint64_t v12 = sub_253E390C4(&qword_26B257828);
      memcpy(v10, v11, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      v8((uint64_t *)v10, (uint64_t *)v11, v7);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v7);
    }
    uint64_t v14 = a3[6];
    uint64_t v15 = (uint64_t *)((char *)a1 + v14);
    int v16 = (char *)a2 + v14;
    uint64_t v17 = *(uint64_t *)((char *)a2 + v14 + 104);
    unint64_t v18 = *(uint64_t *)((char *)a2 + v14 + 192);
    unint64_t v19 = *(uint64_t *)((char *)a2 + v14 + 208);
    unint64_t v20 = *(uint64_t *)((char *)a2 + v14 + 232);
    unint64_t v21 = v18 >> 40;
    BOOL v23 = (v17 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v21 != 0 || v19 > 1;
    if ((v23 || v20 >= 0x10000)
      && ((v17 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFF0000 ? (BOOL v24 = v21 == 0) : (BOOL v24 = 0),
          v24 ? (BOOL v25 = v19 > 1) : (BOOL v25 = 1),
          v25 || v20 >= 0x10000))
    {
      uint64_t v74 = *((void *)v16 + 7);
      uint64_t v75 = *((void *)v16 + 6);
      uint64_t v72 = *((void *)v16 + 9);
      uint64_t v73 = *((void *)v16 + 8);
      uint64_t v70 = *((void *)v16 + 11);
      uint64_t v71 = *((void *)v16 + 10);
      uint64_t v69 = *((void *)v16 + 12);
      unint64_t v78 = *((void *)v16 + 15);
      uint64_t v79 = *((void *)v16 + 14);
      uint64_t v76 = *((void *)v16 + 17);
      uint64_t v77 = *((void *)v16 + 16);
      uint64_t v45 = *((void *)v16 + 18);
      uint64_t v46 = *((void *)v16 + 19);
      uint64_t v47 = *((void *)v16 + 20);
      uint64_t v48 = *((void *)v16 + 21);
      uint64_t v49 = *((void *)v16 + 22);
      uint64_t v50 = *((void *)v16 + 23);
      uint64_t v51 = *(uint64_t *)((char *)a2 + v14 + 192);
      uint64_t v52 = *((void *)v16 + 25);
      uint64_t v54 = *((void *)v16 + 27);
      uint64_t v55 = *((void *)v16 + 28);
      uint64_t v57 = *((void *)v16 + 30);
      uint64_t v58 = *((void *)v16 + 31);
      uint64_t v59 = *((void *)v16 + 32);
      uint64_t v60 = *((void *)v16 + 33);
      uint64_t v56 = *(uint64_t *)((char *)a2 + v14 + 232);
      uint64_t v61 = *((void *)v16 + 34);
      uint64_t v62 = *((void *)v16 + 35);
      uint64_t v44 = *(uint64_t *)((char *)a2 + v14 + 104);
      uint64_t v53 = *(uint64_t *)((char *)a2 + v14 + 208);
      uint64_t v63 = *((void *)v16 + 36);
      uint64_t v64 = *((void *)v16 + 37);
      uint64_t v65 = *((void *)v16 + 38);
      uint64_t v66 = *((void *)v16 + 39);
      uint64_t v67 = *((void *)v16 + 40);
      __int16 v68 = *((_WORD *)v16 + 164);
      uint64_t v27 = *((void *)v16 + 1);
      uint64_t v26 = *(void *)v16;
      uint64_t v28 = *((void *)v16 + 3);
      uint64_t v29 = *((void *)v16 + 2);
      uint64_t v30 = *((void *)v16 + 5);
      uint64_t v31 = *((void *)v16 + 4);
      sub_253E46340(*(void *)v16, v27, v29, v28, v31, v30, v75, v74, v73, v72, v71, v70, v69, v44, v79, v78, v77, v76, v45,
        v46,
        v47,
        v48,
        v49,
        v50,
        v18,
        v52,
        v19,
        v54,
        v55,
        v20,
        v57,
        v58,
        v59,
        v60,
        v61,
        v62,
        v63,
        v64,
        v65,
        v66,
        v67);
      *uint64_t v15 = v26;
      v15[1] = v27;
      v15[2] = v29;
      v15[3] = v28;
      v15[4] = v31;
      v15[5] = v30;
      v15[6] = v75;
      v15[7] = v74;
      v15[8] = v73;
      v15[9] = v72;
      v15[10] = v71;
      v15[11] = v70;
      v15[12] = v69;
      v15[13] = v44;
      v15[14] = v79;
      v15[15] = v78;
      v15[16] = v77;
      v15[17] = v76;
      v15[18] = v45;
      v15[19] = v46;
      v15[20] = v47;
      v15[21] = v48;
      v15[22] = v49;
      v15[23] = v50;
      v15[24] = v51;
      v15[25] = v52;
      v15[26] = v53;
      v15[27] = v54;
      v15[28] = v55;
      v15[29] = v56;
      v15[30] = v57;
      v15[31] = v58;
      v15[32] = v59;
      v15[33] = v60;
      v15[34] = v61;
      v15[35] = v62;
      v15[36] = v63;
      v15[37] = v64;
      v15[38] = v65;
      v15[39] = v66;
      v15[40] = v67;
      *((_WORD *)v15 + 164) = v68;
    }
    else
    {
      memcpy(v15, v16, 0x14AuLL);
    }
    uint64_t v32 = a3[7];
    unint64_t v33 = (char *)a1 + v32;
    uint64_t v34 = (char *)a2 + v32;
    uint64_t v35 = *((void *)v34 + 10);
    if (v35)
    {
      *(_WORD *)unint64_t v33 = *(_WORD *)v34;
      uint64_t v36 = *((void *)v34 + 2);
      *((void *)v33 + 1) = *((void *)v34 + 1);
      *((void *)v33 + 2) = v36;
      uint64_t v37 = *((void *)v34 + 4);
      *((void *)v33 + 3) = *((void *)v34 + 3);
      *((void *)v33 + 4) = v37;
      *((_DWORD *)v33 + 10) = *((_DWORD *)v34 + 10);
      v33[44] = v34[44];
      *((_OWORD *)v33 + 3) = *((_OWORD *)v34 + 3);
      *(_OWORD *)(v33 + 57) = *(_OWORD *)(v34 + 57);
      *((void *)v33 + 10) = v35;
      *(_OWORD *)(v33 + 88) = *(_OWORD *)(v34 + 88);
      *(_OWORD *)(v33 + 97) = *(_OWORD *)(v34 + 97);
      *((void *)v33 + 15) = *((void *)v34 + 15);
      v33[128] = v34[128];
      uint64_t v38 = *((void *)v34 + 18);
      *((void *)v33 + 17) = *((void *)v34 + 17);
      *((void *)v33 + 18) = v38;
      v33[152] = v34[152];
      uint64_t v39 = *((void *)v34 + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v39)
      {
        *((void *)v33 + 20) = *((void *)v34 + 20);
        *((void *)v33 + 21) = v39;
        uint64_t v40 = *((void *)v34 + 22);
        uint64_t v41 = *((void *)v34 + 23);
        *((void *)v33 + 22) = v40;
        *((void *)v33 + 23) = v41;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        long long v42 = *((_OWORD *)v34 + 11);
        *((_OWORD *)v33 + 10) = *((_OWORD *)v34 + 10);
        *((_OWORD *)v33 + 11) = v42;
      }
    }
    else
    {
      memcpy((char *)a1 + v32, v34, 0xC0uLL);
    }
  }
  return a1;
}

void destroy for ContextValue(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_253E82240();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + a2[5];
  if (!_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v6, 1, v4)) {
    v5(v6, v4);
  }
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = *(void *)(v7 + 104);
  unint64_t v9 = *(void *)(v7 + 192);
  unint64_t v10 = *(void *)(v7 + 208);
  unint64_t v11 = *(void *)(v7 + 232);
  unint64_t v12 = v9 >> 40;
  BOOL v14 = (v8 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v12 != 0 || v10 > 1;
  if (v14 || v11 >= 0x10000)
  {
    BOOL v15 = (v8 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFF0000 && v12 == 0;
    BOOL v16 = !v15 || v10 > 1;
    if (v16 || v11 >= 0x10000)
    {
      long long v19 = *(_OWORD *)(v7 + 288);
      long long v20 = *(_OWORD *)(v7 + 304);
      long long v18 = *(_OWORD *)(v7 + 256);
      sub_253E467E8(*(void *)v7, *(void *)(v7 + 8), *(void *)(v7 + 16), *(void *)(v7 + 24), *(void *)(v7 + 32), *(void *)(v7 + 40), *(void *)(v7 + 48), *(void *)(v7 + 56), *(void *)(v7 + 64), *(void *)(v7 + 72), *(void *)(v7 + 80), *(void *)(v7 + 88), *(void *)(v7 + 96), v8, *(void *)(v7 + 112), *(void *)(v7 + 120), *(void *)(v7 + 128), *(void *)(v7 + 136), *(void *)(v7 + 144),
        *(void *)(v7 + 152),
        *(void *)(v7 + 160),
        *(void *)(v7 + 168),
        *(void *)(v7 + 176),
        *(void *)(v7 + 184),
        v9,
        *(void *)(v7 + 200),
        v10,
        *(void *)(v7 + 216),
        *(void *)(v7 + 224),
        v11,
        *(void *)(v7 + 240),
        *(void *)(v7 + 248),
        v18,
        *((uint64_t *)&v18 + 1),
        *(void *)(v7 + 272),
        *(void *)(v7 + 280),
        v19,
        *((uint64_t *)&v19 + 1),
        v20,
        *((uint64_t *)&v20 + 1),
        *(void *)(v7 + 320));
    }
  }
  uint64_t v17 = a1 + a2[7];
  if (*(void *)(v17 + 80))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*(void *)(v17 + 168))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t initializeWithCopy for ContextValue(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_253E82240();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  unint64_t v9 = (void *)(a1 + v8);
  unint64_t v10 = (const void *)(a2 + v8);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a2 + v8, 1, v6))
  {
    uint64_t v11 = sub_253E390C4(&qword_26B257828);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v9, 0, 1, v6);
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = (uint64_t *)(a1 + v12);
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)(a2 + v12 + 104);
  unint64_t v16 = *(void *)(a2 + v12 + 192);
  unint64_t v17 = *(void *)(a2 + v12 + 208);
  unint64_t v18 = *(void *)(a2 + v12 + 232);
  unint64_t v19 = v16 >> 40;
  BOOL v21 = (v15 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v19 != 0 || v17 > 1;
  if ((v21 || v18 >= 0x10000)
    && ((v15 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFF0000 ? (BOOL v22 = v19 == 0) : (BOOL v22 = 0),
        v22 ? (BOOL v23 = v17 > 1) : (BOOL v23 = 1),
        v23 || v18 >= 0x10000))
  {
    uint64_t v71 = a1;
    uint64_t v72 = a3;
    uint64_t v70 = a2;
    uint64_t v74 = *(void *)(v14 + 72);
    uint64_t v75 = *(void *)(v14 + 64);
    uint64_t v44 = *(void *)(v14 + 80);
    uint64_t v45 = *(void *)(v14 + 88);
    uint64_t v46 = *(void *)(v14 + 96);
    unint64_t v78 = *(void *)(v14 + 120);
    uint64_t v79 = *(void *)(v14 + 112);
    uint64_t v76 = *(void *)(v14 + 136);
    uint64_t v77 = *(void *)(v14 + 128);
    uint64_t v48 = *(void *)(v14 + 144);
    uint64_t v49 = *(void *)(v14 + 152);
    uint64_t v50 = *(void *)(v14 + 160);
    uint64_t v51 = *(void *)(v14 + 168);
    uint64_t v52 = *(void *)(v14 + 176);
    uint64_t v53 = *(void *)(v14 + 184);
    uint64_t v55 = *(void *)(v14 + 200);
    uint64_t v56 = *(void *)(v14 + 216);
    uint64_t v57 = *(void *)(v14 + 224);
    uint64_t v58 = *(void *)(a2 + v12 + 232);
    uint64_t v59 = *(void *)(v14 + 240);
    uint64_t v60 = *(void *)(v14 + 248);
    uint64_t v61 = *(void *)(v14 + 256);
    uint64_t v62 = *(void *)(v14 + 264);
    uint64_t v54 = *(void *)(a2 + v12 + 192);
    uint64_t v47 = *(void *)(a2 + v12 + 104);
    uint64_t v63 = *(void *)(v14 + 272);
    uint64_t v64 = *(void *)(v14 + 280);
    uint64_t v65 = *(void *)(v14 + 288);
    uint64_t v66 = *(void *)(v14 + 296);
    uint64_t v67 = *(void *)(v14 + 304);
    uint64_t v68 = *(void *)(v14 + 312);
    uint64_t v69 = *(void *)(v14 + 320);
    __int16 v73 = *(_WORD *)(v14 + 328);
    uint64_t v25 = *(void *)(v14 + 8);
    uint64_t v24 = *(void *)v14;
    uint64_t v27 = *(void *)(v14 + 24);
    uint64_t v26 = *(void *)(v14 + 16);
    uint64_t v28 = *(void *)(v14 + 40);
    uint64_t v29 = *(void *)(v14 + 32);
    uint64_t v30 = *(void *)(v14 + 56);
    uint64_t v31 = *(void *)(v14 + 48);
    sub_253E46340(*(void *)v14, v25, v26, v27, v29, v28, v31, v30, v75, v74, v44, v45, v46, v15, v79, v78, v77, v76, v48,
      v49,
      v50,
      v51,
      v52,
      v53,
      v16,
      v55,
      v17,
      v56,
      v57,
      v18,
      v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69);
    *uint64_t v13 = v24;
    v13[1] = v25;
    v13[2] = v26;
    v13[3] = v27;
    v13[4] = v29;
    v13[5] = v28;
    a1 = v71;
    a3 = v72;
    v13[6] = v31;
    v13[7] = v30;
    a2 = v70;
    v13[8] = v75;
    v13[9] = v74;
    v13[10] = v44;
    v13[11] = v45;
    v13[12] = v46;
    v13[13] = v47;
    v13[14] = v79;
    v13[15] = v78;
    v13[16] = v77;
    v13[17] = v76;
    v13[18] = v48;
    v13[19] = v49;
    v13[20] = v50;
    v13[21] = v51;
    v13[22] = v52;
    v13[23] = v53;
    v13[24] = v54;
    v13[25] = v55;
    v13[26] = v17;
    v13[27] = v56;
    v13[28] = v57;
    v13[29] = v58;
    v13[30] = v59;
    v13[31] = v60;
    v13[32] = v61;
    v13[33] = v62;
    v13[34] = v63;
    v13[35] = v64;
    v13[36] = v65;
    v13[37] = v66;
    v13[38] = v67;
    v13[39] = v68;
    v13[40] = v69;
    *((_WORD *)v13 + 164) = v73;
  }
  else
  {
    memcpy(v13, (const void *)v14, 0x14AuLL);
  }
  uint64_t v32 = a3[7];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = (char *)(a2 + v32);
  uint64_t v35 = *((void *)v34 + 10);
  if (v35)
  {
    *(_WORD *)uint64_t v33 = *(_WORD *)v34;
    uint64_t v36 = *((void *)v34 + 2);
    *(void *)(v33 + 8) = *((void *)v34 + 1);
    *(void *)(v33 + 16) = v36;
    uint64_t v37 = *((void *)v34 + 4);
    *(void *)(v33 + 24) = *((void *)v34 + 3);
    *(void *)(v33 + 32) = v37;
    *(_DWORD *)(v33 + 40) = *((_DWORD *)v34 + 10);
    *(unsigned char *)(v33 + 44) = v34[44];
    *(_OWORD *)(v33 + 48) = *((_OWORD *)v34 + 3);
    *(_OWORD *)(v33 + 57) = *(_OWORD *)(v34 + 57);
    *(void *)(v33 + 80) = v35;
    *(_OWORD *)(v33 + 88) = *(_OWORD *)(v34 + 88);
    *(_OWORD *)(v33 + 97) = *(_OWORD *)(v34 + 97);
    *(void *)(v33 + 120) = *((void *)v34 + 15);
    *(unsigned char *)(v33 + 128) = v34[128];
    uint64_t v38 = *((void *)v34 + 18);
    *(void *)(v33 + 136) = *((void *)v34 + 17);
    *(void *)(v33 + 144) = v38;
    *(unsigned char *)(v33 + 152) = v34[152];
    uint64_t v39 = *((void *)v34 + 21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v39)
    {
      *(void *)(v33 + 160) = *((void *)v34 + 20);
      *(void *)(v33 + 168) = v39;
      uint64_t v40 = *((void *)v34 + 22);
      uint64_t v41 = *((void *)v34 + 23);
      *(void *)(v33 + 176) = v40;
      *(void *)(v33 + 184) = v41;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      long long v42 = *((_OWORD *)v34 + 11);
      *(_OWORD *)(v33 + 160) = *((_OWORD *)v34 + 10);
      *(_OWORD *)(v33 + 176) = v42;
    }
  }
  else
  {
    memcpy((void *)(a1 + v32), v34, 0xC0uLL);
  }
  return a1;
}

uint64_t assignWithCopy for ContextValue(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_253E82240();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  unint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  int v12 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1 + v9, 1, v6);
  int v13 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v11, 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(v10, v11, v6);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    uint64_t v14 = sub_253E390C4(&qword_26B257828);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v10, (uint64_t)v11, v6);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = *(void *)(a1 + v15 + 104);
  unint64_t v19 = *(void *)(a1 + v15 + 192);
  unint64_t v20 = *(void *)(a1 + v15 + 208);
  unint64_t v21 = *(void *)(a1 + v15 + 232);
  unint64_t v22 = v18 & 0xFFFFFFFFFFFF0000;
  uint64_t v23 = *(void *)(v17 + 104);
  unint64_t v24 = *(void *)(v17 + 192);
  unint64_t v25 = *(void *)(v17 + 208);
  unint64_t v26 = *(void *)(v17 + 232);
  unint64_t v27 = v23 & 0xFFFFFFFFFFFF0000;
  unint64_t v28 = v24 >> 40;
  BOOL v32 = (v23 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFE0000 && v28 == 0 && v25 < 2 && v26 < 0x10000;
  unint64_t v33 = v19 >> 40;
  BOOL v35 = v22 != 0xFFFFFFFE0000 || v33 != 0 || v20 > 1;
  if (!v35 && v21 < 0x10000)
  {
    if (!v32 && (v27 != 0xFFFFFFFF0000 || v28 || v25 > 1 || v26 >= 0x10000))
    {
      uint64_t v155 = *(void *)v17;
      uint64_t v147 = *(void *)(v17 + 24);
      uint64_t v150 = *(void *)(v17 + 16);
      uint64_t v144 = *(void *)(v17 + 32);
      uint64_t v138 = *(void *)(v17 + 48);
      uint64_t v141 = *(void *)(v17 + 40);
      uint64_t v136 = *(void *)(v17 + 56);
      uint64_t v188 = *(void *)(v17 + 64);
      uint64_t v183 = *(void *)(v17 + 80);
      uint64_t v93 = *(void *)(v17 + 88);
      uint64_t v94 = *(void *)(v17 + 96);
      unint64_t v197 = *(void *)(v17 + 120);
      uint64_t v200 = *(void *)(v17 + 112);
      uint64_t v194 = *(void *)(v17 + 128);
      uint64_t v95 = *(void *)(v17 + 136);
      uint64_t v96 = *(void *)(v17 + 144);
      uint64_t v191 = *(void *)(v17 + 152);
      uint64_t v97 = *(void *)(v17 + 160);
      uint64_t v100 = *(void *)(v17 + 168);
      uint64_t v103 = *(void *)(v17 + 176);
      uint64_t v106 = *(void *)(v17 + 184);
      uint64_t v109 = *(void *)(v17 + 200);
      uint64_t v111 = *(void *)(v17 + 216);
      uint64_t v113 = *(void *)(v17 + 224);
      uint64_t v118 = *(void *)(v17 + 240);
      uint64_t v121 = *(void *)(v17 + 248);
      uint64_t v124 = *(void *)(v17 + 256);
      uint64_t v127 = *(void *)(v17 + 264);
      uint64_t v130 = *(void *)(v17 + 272);
      uint64_t v133 = *(void *)(v17 + 280);
      uint64_t v158 = *(void *)(v17 + 288);
      uint64_t v161 = *(void *)(v17 + 296);
      uint64_t v164 = *(void *)(v17 + 304);
      uint64_t v167 = *(void *)(v17 + 312);
      uint64_t v170 = *(void *)(v17 + 320);
      __int16 v178 = *(_WORD *)(v17 + 328);
      uint64_t v173 = a2;
      uint64_t v36 = *(void *)(v17 + 72);
      uint64_t v37 = *(void *)(v17 + 8);
      sub_253E46340(v155, v37, v150, v147, v144, v141, v138, v136, v188, v36, v183, v93, v94, v23, v200, v197, v194, v95, v96,
        v191,
        v97,
        v100,
        v103,
        v106,
        v24,
        v109,
        v25,
        v111,
        v113,
        v26,
        v118,
        v121,
        v124,
        v127,
        v130,
        v133,
        v158,
        v161,
        v164,
        v167,
        v170);
      *(void *)uint64_t v16 = v155;
      *(void *)(v16 + 8) = v37;
      *(void *)(v16 + 16) = v150;
      *(void *)(v16 + 24) = v147;
      *(void *)(v16 + 32) = v144;
      *(void *)(v16 + 40) = v141;
      *(void *)(v16 + 48) = v138;
      *(void *)(v16 + 56) = v136;
      *(void *)(v16 + 64) = v188;
      *(void *)(v16 + 72) = v36;
      a2 = v173;
      *(void *)(v16 + 80) = v183;
      *(void *)(v16 + 88) = v93;
      *(void *)(v16 + 96) = v94;
      *(void *)(v16 + 104) = v23;
      *(void *)(v16 + 112) = v200;
      *(void *)(v16 + 120) = v197;
      *(void *)(v16 + 128) = v194;
      *(void *)(v16 + 136) = v95;
      *(void *)(v16 + 144) = v96;
      *(void *)(v16 + 152) = v191;
      *(void *)(v16 + 160) = v97;
      *(void *)(v16 + 168) = v100;
      *(void *)(v16 + 176) = v103;
      *(void *)(v16 + 184) = v106;
      *(void *)(v16 + 192) = v24;
      *(void *)(v16 + 200) = v109;
      *(void *)(v16 + 208) = v25;
      *(void *)(v16 + 216) = v111;
      *(void *)(v16 + 224) = v113;
      *(void *)(v16 + 232) = v26;
      *(void *)(v16 + 240) = v118;
      *(void *)(v16 + 248) = v121;
      *(void *)(v16 + 256) = v124;
      *(void *)(v16 + 264) = v127;
      *(void *)(v16 + 272) = v130;
      *(void *)(v16 + 280) = v133;
      *(void *)(v16 + 288) = v158;
      *(void *)(v16 + 296) = v161;
      *(void *)(v16 + 304) = v164;
      *(void *)(v16 + 312) = v167;
      *(void *)(v16 + 320) = v170;
      __int16 v38 = v178;
LABEL_53:
      *(_WORD *)(v16 + 328) = v38;
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  if (v32)
  {
    sub_253E56EF8(v16);
LABEL_57:
    memcpy((void *)v16, (const void *)v17, 0x14AuLL);
    goto LABEL_58;
  }
  BOOL v42 = v27 == 0xFFFFFFFF0000 && v28 == 0 && v25 < 2 && v26 < 0x10000;
  if (v22 == 0xFFFFFFFF0000 && !v33 && v20 <= 1 && v21 < 0x10000)
  {
    if (!v42)
    {
      uint64_t v139 = *(void *)v17;
      uint64_t v184 = *(void *)(v17 + 24);
      uint64_t v186 = *(void *)(v17 + 16);
      uint64_t v179 = *(void *)(v17 + 40);
      uint64_t v181 = *(void *)(v17 + 32);
      uint64_t v174 = *(void *)(v17 + 56);
      uint64_t v176 = *(void *)(v17 + 48);
      uint64_t v168 = *(void *)(v17 + 72);
      uint64_t v171 = *(void *)(v17 + 64);
      uint64_t v162 = *(void *)(v17 + 88);
      uint64_t v165 = *(void *)(v17 + 80);
      uint64_t v159 = *(void *)(v17 + 96);
      unint64_t v198 = *(void *)(v17 + 120);
      uint64_t v201 = *(void *)(v17 + 112);
      uint64_t v192 = *(void *)(v17 + 136);
      uint64_t v195 = *(void *)(v17 + 128);
      uint64_t v98 = *(void *)(v17 + 144);
      uint64_t v189 = *(void *)(v17 + 152);
      uint64_t v101 = *(void *)(v17 + 160);
      uint64_t v104 = *(void *)(v17 + 168);
      uint64_t v107 = *(void *)(v17 + 176);
      uint64_t v110 = *(void *)(v17 + 184);
      uint64_t v112 = *(void *)(v17 + 200);
      uint64_t v114 = *(void *)(v17 + 216);
      uint64_t v116 = *(void *)(v17 + 224);
      uint64_t v119 = *(void *)(v17 + 240);
      uint64_t v122 = *(void *)(v17 + 248);
      uint64_t v125 = *(void *)(v17 + 256);
      uint64_t v128 = *(void *)(v17 + 264);
      uint64_t v131 = *(void *)(v17 + 272);
      uint64_t v134 = *(void *)(v17 + 280);
      uint64_t v142 = *(void *)(v17 + 288);
      uint64_t v145 = *(void *)(v17 + 296);
      uint64_t v148 = *(void *)(v17 + 304);
      uint64_t v151 = *(void *)(v17 + 312);
      uint64_t v153 = *(void *)(v17 + 320);
      __int16 v156 = *(_WORD *)(v17 + 328);
      uint64_t v43 = *(void *)(v17 + 8);
      sub_253E46340(v139, v43, v186, v184, v181, v179, v176, v174, v171, v168, v165, v162, v159, v23, v201, v198, v195, v192, v98,
        v189,
        v101,
        v104,
        v107,
        v110,
        v24,
        v112,
        v25,
        v114,
        v116,
        v26,
        v119,
        v122,
        v125,
        v128,
        v131,
        v134,
        v142,
        v145,
        v148,
        v151,
        v153);
      *(void *)uint64_t v16 = v139;
      *(void *)(v16 + 8) = v43;
      *(void *)(v16 + 16) = v186;
      *(void *)(v16 + 24) = v184;
      *(void *)(v16 + 32) = v181;
      *(void *)(v16 + 40) = v179;
      *(void *)(v16 + 48) = v176;
      *(void *)(v16 + 56) = v174;
      *(void *)(v16 + 64) = v171;
      *(void *)(v16 + 72) = v168;
      *(void *)(v16 + 80) = v165;
      *(void *)(v16 + 88) = v162;
      *(void *)(v16 + 96) = v159;
      *(void *)(v16 + 104) = v23;
      *(void *)(v16 + 112) = v201;
      *(void *)(v16 + 120) = v198;
      *(void *)(v16 + 128) = v195;
      *(void *)(v16 + 136) = v192;
      *(void *)(v16 + 144) = v98;
      *(void *)(v16 + 152) = v189;
      *(void *)(v16 + 160) = v101;
      *(void *)(v16 + 168) = v104;
      *(void *)(v16 + 176) = v107;
      *(void *)(v16 + 184) = v110;
      *(void *)(v16 + 192) = v24;
      *(void *)(v16 + 200) = v112;
      *(void *)(v16 + 208) = v25;
      *(void *)(v16 + 216) = v114;
      *(void *)(v16 + 224) = v116;
      *(void *)(v16 + 232) = v26;
      *(void *)(v16 + 240) = v119;
      *(void *)(v16 + 248) = v122;
      *(void *)(v16 + 256) = v125;
      *(void *)(v16 + 264) = v128;
      *(void *)(v16 + 272) = v131;
      *(void *)(v16 + 280) = v134;
      *(void *)(v16 + 288) = v142;
      *(void *)(v16 + 296) = v145;
      *(void *)(v16 + 304) = v148;
      *(void *)(v16 + 312) = v151;
      *(void *)(v16 + 320) = v153;
      __int16 v38 = v156;
      goto LABEL_53;
    }
    goto LABEL_57;
  }
  if (v42)
  {
    sub_253E49A98(v16);
    goto LABEL_57;
  }
  uint64_t v185 = *(void *)(v17 + 24);
  uint64_t v187 = *(void *)(v17 + 16);
  uint64_t v180 = *(void *)(v17 + 40);
  uint64_t v182 = *(void *)(v17 + 32);
  uint64_t v175 = *(void *)(v17 + 56);
  uint64_t v177 = *(void *)(v17 + 48);
  uint64_t v169 = *(void *)(v17 + 72);
  uint64_t v172 = *(void *)(v17 + 64);
  uint64_t v163 = *(void *)(v17 + 88);
  uint64_t v166 = *(void *)(v17 + 80);
  uint64_t v160 = *(void *)(v17 + 96);
  unint64_t v199 = *(void *)(v17 + 120);
  uint64_t v202 = *(void *)(v17 + 112);
  uint64_t v193 = *(void *)(v17 + 136);
  uint64_t v196 = *(void *)(v17 + 128);
  uint64_t v99 = *(void *)(v17 + 144);
  uint64_t v190 = *(void *)(v17 + 152);
  uint64_t v102 = *(void *)(v17 + 160);
  uint64_t v105 = *(void *)(v17 + 168);
  uint64_t v108 = *(void *)(v17 + 176);
  uint64_t v115 = *(void *)(v17 + 184);
  uint64_t v117 = *(void *)(v17 + 200);
  uint64_t v120 = *(void *)(v17 + 216);
  uint64_t v123 = *(void *)(v17 + 224);
  uint64_t v126 = *(void *)(v17 + 240);
  uint64_t v129 = *(void *)(v17 + 248);
  uint64_t v132 = *(void *)(v17 + 256);
  uint64_t v135 = *(void *)(v17 + 264);
  uint64_t v137 = *(void *)(v17 + 272);
  uint64_t v140 = *(void *)(v17 + 280);
  uint64_t v143 = *(void *)(v17 + 288);
  uint64_t v146 = *(void *)(v17 + 296);
  uint64_t v149 = *(void *)(v17 + 304);
  uint64_t v152 = *(void *)(v17 + 312);
  uint64_t v154 = *(void *)(v17 + 320);
  __int16 v157 = *(_WORD *)(v17 + 328);
  uint64_t v63 = *(void *)v17;
  uint64_t v64 = *(void *)v17;
  uint64_t v65 = *(void *)(v17 + 8);
  sub_253E46340(v64, v65, v187, v185, v182, v180, v177, v175, v172, v169, v166, v163, v160, v23, v202, v199, v196, v193, v99,
    v190,
    v102,
    v105,
    v108,
    v115,
    v24,
    v117,
    v25,
    v120,
    v123,
    v26,
    v126,
    v129,
    v132,
    v135,
    v137,
    v140,
    v143,
    v146,
    v149,
    v152,
    v154);
  uint64_t v66 = *(void *)v16;
  uint64_t v67 = *(void *)(v16 + 8);
  *(void *)uint64_t v16 = v63;
  *(void *)(v16 + 8) = v65;
  uint64_t v68 = *(void *)(v16 + 16);
  uint64_t v69 = *(void *)(v16 + 24);
  *(void *)(v16 + 16) = v187;
  *(void *)(v16 + 24) = v185;
  uint64_t v70 = *(void *)(v16 + 32);
  uint64_t v71 = *(void *)(v16 + 40);
  *(void *)(v16 + 32) = v182;
  *(void *)(v16 + 40) = v180;
  uint64_t v72 = *(void *)(v16 + 48);
  uint64_t v73 = *(void *)(v16 + 56);
  *(void *)(v16 + 48) = v177;
  *(void *)(v16 + 56) = v175;
  long long v74 = *(_OWORD *)(v16 + 64);
  long long v75 = *(_OWORD *)(v16 + 80);
  *(void *)(v16 + 64) = v172;
  *(void *)(v16 + 72) = v169;
  *(void *)(v16 + 80) = v166;
  *(void *)(v16 + 88) = v163;
  long long v76 = *(_OWORD *)(v16 + 96);
  long long v77 = *(_OWORD *)(v16 + 112);
  *(void *)(v16 + 96) = v160;
  *(void *)(v16 + 104) = v23;
  *(void *)(v16 + 112) = v202;
  *(void *)(v16 + 120) = v199;
  long long v78 = *(_OWORD *)(v16 + 128);
  long long v79 = *(_OWORD *)(v16 + 144);
  *(void *)(v16 + 128) = v196;
  *(void *)(v16 + 136) = v193;
  *(void *)(v16 + 144) = v99;
  *(void *)(v16 + 152) = v190;
  long long v80 = *(_OWORD *)(v16 + 160);
  long long v81 = *(_OWORD *)(v16 + 176);
  *(void *)(v16 + 160) = v102;
  *(void *)(v16 + 168) = v105;
  *(void *)(v16 + 176) = v108;
  long long v82 = *(_OWORD *)(v16 + 192);
  long long v83 = *(_OWORD *)(v16 + 208);
  *(void *)(v16 + 184) = v115;
  *(void *)(v16 + 192) = v24;
  *(void *)(v16 + 200) = v117;
  *(void *)(v16 + 208) = v25;
  *(void *)(v16 + 216) = v120;
  long long v84 = *(_OWORD *)(v16 + 224);
  long long v85 = *(_OWORD *)(v16 + 240);
  *(void *)(v16 + 224) = v123;
  *(void *)(v16 + 232) = v26;
  *(void *)(v16 + 240) = v126;
  *(void *)(v16 + 248) = v129;
  long long v86 = *(_OWORD *)(v16 + 256);
  long long v87 = *(_OWORD *)(v16 + 272);
  *(void *)(v16 + 256) = v132;
  *(void *)(v16 + 264) = v135;
  *(void *)(v16 + 272) = v137;
  *(void *)(v16 + 280) = v140;
  long long v88 = *(_OWORD *)(v16 + 288);
  long long v89 = *(_OWORD *)(v16 + 304);
  *(void *)(v16 + 288) = v143;
  *(void *)(v16 + 296) = v146;
  *(void *)(v16 + 304) = v149;
  *(void *)(v16 + 312) = v152;
  uint64_t v90 = *(void *)(v16 + 320);
  *(void *)(v16 + 320) = v154;
  *(_WORD *)(v16 + 328) = v157;
  sub_253E467E8(v66, v67, v68, v69, v70, v71, v72, v73, v74, *((uint64_t *)&v74 + 1), v75, *((uint64_t *)&v75 + 1), v76, *((uint64_t *)&v76 + 1), v77, *((unint64_t *)&v77 + 1), v78, *((uint64_t *)&v78 + 1), v79,
    *((uint64_t *)&v79 + 1),
    v80,
    *((uint64_t *)&v80 + 1),
    v81,
    *((uint64_t *)&v81 + 1),
    v82,
    *((uint64_t *)&v82 + 1),
    v83,
    *((uint64_t *)&v83 + 1),
    v84,
    *((unint64_t *)&v84 + 1),
    v85,
    *((uint64_t *)&v85 + 1),
    v86,
    *((uint64_t *)&v86 + 1),
    v87,
    *((uint64_t *)&v87 + 1),
    v88,
    *((uint64_t *)&v88 + 1),
    v89,
    *((uint64_t *)&v89 + 1),
    v90);
LABEL_58:
  uint64_t v44 = a3[7];
  uint64_t v45 = a1 + v44;
  uint64_t v46 = a2 + v44;
  uint64_t v47 = *(void *)(a1 + v44 + 80);
  uint64_t v48 = *(void *)(v46 + 80);
  if (!v47)
  {
    if (v48)
    {
      *(unsigned char *)uint64_t v45 = *(unsigned char *)v46;
      *(unsigned char *)(v45 + 1) = *(unsigned char *)(v46 + 1);
      *(void *)(v45 + 8) = *(void *)(v46 + 8);
      *(void *)(v45 + 16) = *(void *)(v46 + 16);
      *(void *)(v45 + 24) = *(void *)(v46 + 24);
      *(void *)(v45 + 32) = *(void *)(v46 + 32);
      int v56 = *(_DWORD *)(v46 + 40);
      *(unsigned char *)(v45 + 44) = *(unsigned char *)(v46 + 44);
      *(_DWORD *)(v45 + 40) = v56;
      long long v57 = *(_OWORD *)(v46 + 48);
      *(_OWORD *)(v45 + 57) = *(_OWORD *)(v46 + 57);
      *(_OWORD *)(v45 + 48) = v57;
      *(void *)(v45 + 80) = *(void *)(v46 + 80);
      long long v58 = *(_OWORD *)(v46 + 88);
      *(_OWORD *)(v45 + 97) = *(_OWORD *)(v46 + 97);
      *(_OWORD *)(v45 + 88) = v58;
      uint64_t v59 = *(void *)(v46 + 120);
      *(unsigned char *)(v45 + 128) = *(unsigned char *)(v46 + 128);
      *(void *)(v45 + 120) = v59;
      *(void *)(v45 + 136) = *(void *)(v46 + 136);
      *(void *)(v45 + 144) = *(void *)(v46 + 144);
      *(unsigned char *)(v45 + 152) = *(unsigned char *)(v46 + 152);
      uint64_t v60 = *(void *)(v46 + 168);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v60)
      {
        long long v61 = *(_OWORD *)(v46 + 176);
        *(_OWORD *)(v45 + 160) = *(_OWORD *)(v46 + 160);
        *(_OWORD *)(v45 + 176) = v61;
        return a1;
      }
LABEL_69:
      *(void *)(v45 + 160) = *(void *)(v46 + 160);
      *(void *)(v45 + 168) = *(void *)(v46 + 168);
      *(void *)(v45 + 176) = *(void *)(v46 + 176);
      *(void *)(v45 + 184) = *(void *)(v46 + 184);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_67:
    memcpy((void *)v45, (const void *)v46, 0xC0uLL);
    return a1;
  }
  if (!v48)
  {
    sub_253E56F7C(v45);
    goto LABEL_67;
  }
  *(unsigned char *)uint64_t v45 = *(unsigned char *)v46;
  *(unsigned char *)(v45 + 1) = *(unsigned char *)(v46 + 1);
  *(void *)(v45 + 8) = *(void *)(v46 + 8);
  *(void *)(v45 + 16) = *(void *)(v46 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v45 + 24) = *(void *)(v46 + 24);
  *(void *)(v45 + 32) = *(void *)(v46 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v49 = *(_DWORD *)(v46 + 40);
  *(unsigned char *)(v45 + 44) = *(unsigned char *)(v46 + 44);
  *(_DWORD *)(v45 + 40) = v49;
  long long v50 = *(_OWORD *)(v46 + 57);
  *(_OWORD *)(v45 + 48) = *(_OWORD *)(v46 + 48);
  *(_OWORD *)(v45 + 57) = v50;
  *(void *)(v45 + 80) = *(void *)(v46 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v51 = *(_OWORD *)(v46 + 88);
  *(_OWORD *)(v45 + 97) = *(_OWORD *)(v46 + 97);
  *(_OWORD *)(v45 + 88) = v51;
  uint64_t v52 = *(void *)(v46 + 120);
  *(unsigned char *)(v45 + 128) = *(unsigned char *)(v46 + 128);
  *(void *)(v45 + 120) = v52;
  *(void *)(v45 + 136) = *(void *)(v46 + 136);
  *(void *)(v45 + 144) = *(void *)(v46 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(v45 + 152) = *(unsigned char *)(v46 + 152);
  uint64_t v53 = (_OWORD *)(v45 + 160);
  uint64_t v54 = (_OWORD *)(v46 + 160);
  uint64_t v55 = *(void *)(v46 + 168);
  if (!*(void *)(v45 + 168))
  {
    if (!v55)
    {
      long long v91 = *(_OWORD *)(v46 + 176);
      *uint64_t v53 = *v54;
      *(_OWORD *)(v45 + 176) = v91;
      return a1;
    }
    goto LABEL_69;
  }
  if (v55)
  {
    *(void *)(v45 + 160) = *(void *)(v46 + 160);
    *(void *)(v45 + 168) = *(void *)(v46 + 168);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v45 + 176) = *(void *)(v46 + 176);
    *(void *)(v45 + 184) = *(void *)(v46 + 184);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_253E56F4C(v45 + 160);
    long long v62 = *(_OWORD *)(v46 + 176);
    *uint64_t v53 = *v54;
    *(_OWORD *)(v45 + 176) = v62;
  }
  return a1;
}

char *initializeWithTake for ContextValue(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_253E82240();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  unint64_t v10 = &a2[v8];
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)&a2[v8], 1, v6))
  {
    uint64_t v11 = sub_253E390C4(&qword_26B257828);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    v7(v9, v10, v6);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v9, 0, 1, v6);
  }
  memcpy(&a1[a3[6]], &a2[a3[6]], 0x14AuLL);
  memcpy(&a1[a3[7]], &a2[a3[7]], 0xC0uLL);
  return a1;
}

uint64_t assignWithTake for ContextValue(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_253E82240();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  uint64_t v9 = a3[5];
  unint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (const void *)(a2 + v9);
  int v12 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1 + v9, 1, v6);
  int v13 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v11, 1, v6);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(v10, v11, v6);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
LABEL_6:
    uint64_t v14 = sub_253E390C4(&qword_26B257828);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  v8((uint64_t)v10, (uint64_t)v11, v6);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = (uint64_t *)(a1 + v15);
  uint64_t v17 = (_OWORD *)(a2 + v15);
  uint64_t v18 = *(void *)(a1 + v15 + 104);
  unint64_t v19 = v16[24];
  unint64_t v20 = v16[26];
  unint64_t v21 = v16[29];
  unint64_t v22 = v19 >> 40;
  BOOL v24 = (v18 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v22 != 0 || v20 > 1;
  if (!v24 && v21 < 0x10000) {
    goto LABEL_37;
  }
  uint64_t v25 = *((void *)v17 + 13);
  unint64_t v26 = *((void *)v17 + 24);
  unint64_t v27 = *((void *)v17 + 26);
  unint64_t v28 = *((void *)v17 + 29);
  unint64_t v29 = v26 >> 40;
  BOOL v31 = (v25 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFE0000 || v29 != 0 || v27 > 1;
  if (!v31 && v28 < 0x10000)
  {
    sub_253E56EF8((uint64_t)v16);
LABEL_37:
    memcpy(v16, v17, 0x14AuLL);
    goto LABEL_38;
  }
  BOOL v33 = (v18 & 0xFFFFFFFFFFFF0000) != 0xFFFFFFFF0000 || v22 != 0 || v20 > 1;
  if (!v33 && v21 < 0x10000) {
    goto LABEL_37;
  }
  if ((v25 & 0xFFFFFFFFFFFF0000) == 0xFFFFFFFF0000 && !v29 && v27 <= 1 && v28 < 0x10000)
  {
    sub_253E49A98((uint64_t)v16);
    goto LABEL_37;
  }
  uint64_t v44 = *((void *)v17 + 12);
  uint64_t v45 = *((void *)v17 + 25);
  uint64_t v46 = *((void *)v17 + 40);
  __int16 v47 = *((_WORD *)v17 + 164);
  uint64_t v80 = *v16;
  uint64_t v79 = v16[1];
  uint64_t v78 = v16[2];
  uint64_t v48 = v16[4];
  uint64_t v77 = v16[3];
  uint64_t v49 = v16[5];
  uint64_t v50 = v16[6];
  uint64_t v51 = v16[7];
  long long v52 = *((_OWORD *)v16 + 4);
  long long v53 = *((_OWORD *)v16 + 5);
  uint64_t v54 = v16[12];
  long long v55 = *((_OWORD *)v16 + 7);
  long long v56 = *((_OWORD *)v16 + 8);
  long long v57 = *((_OWORD *)v16 + 9);
  long long v58 = *((_OWORD *)v16 + 10);
  uint64_t v59 = v16[22];
  uint64_t v60 = v16[23];
  uint64_t v61 = v16[25];
  uint64_t v62 = v16[27];
  uint64_t v63 = v16[28];
  long long v64 = *((_OWORD *)v16 + 15);
  long long v65 = *((_OWORD *)v16 + 16);
  long long v66 = *((_OWORD *)v16 + 17);
  long long v67 = *((_OWORD *)v16 + 18);
  long long v68 = *((_OWORD *)v16 + 19);
  uint64_t v69 = v16[40];
  long long v70 = v17[1];
  *(_OWORD *)uint64_t v16 = *v17;
  *((_OWORD *)v16 + 1) = v70;
  long long v71 = v17[3];
  *((_OWORD *)v16 + 2) = v17[2];
  *((_OWORD *)v16 + 3) = v71;
  long long v72 = v17[5];
  *((_OWORD *)v16 + 4) = v17[4];
  *((_OWORD *)v16 + 5) = v72;
  v16[12] = v44;
  v16[13] = v25;
  long long v73 = v17[8];
  *((_OWORD *)v16 + 7) = v17[7];
  *((_OWORD *)v16 + 8) = v73;
  long long v74 = v17[10];
  *((_OWORD *)v16 + 9) = v17[9];
  *((_OWORD *)v16 + 10) = v74;
  *((_OWORD *)v16 + 11) = v17[11];
  v16[24] = v26;
  v16[25] = v45;
  v16[26] = v27;
  *(_OWORD *)(v16 + 27) = *(_OWORD *)((char *)v17 + 216);
  v16[29] = v28;
  long long v75 = v17[16];
  *((_OWORD *)v16 + 15) = v17[15];
  *((_OWORD *)v16 + 16) = v75;
  long long v76 = v17[18];
  *((_OWORD *)v16 + 17) = v17[17];
  *((_OWORD *)v16 + 18) = v76;
  *((_OWORD *)v16 + 19) = v17[19];
  v16[40] = v46;
  *((_WORD *)v16 + 164) = v47;
  sub_253E467E8(v80, v79, v78, v77, v48, v49, v50, v51, v52, *((uint64_t *)&v52 + 1), v53, *((uint64_t *)&v53 + 1), v54, v18, v55, *((unint64_t *)&v55 + 1), v56, *((uint64_t *)&v56 + 1), v57,
    *((uint64_t *)&v57 + 1),
    v58,
    *((uint64_t *)&v58 + 1),
    v59,
    v60,
    v19,
    v61,
    v20,
    v62,
    v63,
    v21,
    v64,
    *((uint64_t *)&v64 + 1),
    v65,
    *((uint64_t *)&v65 + 1),
    v66,
    *((uint64_t *)&v66 + 1),
    v67,
    *((uint64_t *)&v67 + 1),
    v68,
    *((uint64_t *)&v68 + 1),
    v69);
LABEL_38:
  uint64_t v34 = a3[7];
  BOOL v35 = (unsigned char *)(a1 + v34);
  uint64_t v36 = (unsigned char *)(a2 + v34);
  if (!*(void *)(a1 + v34 + 80))
  {
LABEL_44:
    memcpy(v35, v36, 0xC0uLL);
    return a1;
  }
  if (!*((void *)v36 + 10))
  {
    sub_253E56F7C((uint64_t)v35);
    goto LABEL_44;
  }
  *BOOL v35 = *v36;
  v35[1] = v36[1];
  uint64_t v37 = *((void *)v36 + 2);
  *((void *)v35 + 1) = *((void *)v36 + 1);
  *((void *)v35 + 2) = v37;
  swift_bridgeObjectRelease();
  uint64_t v38 = *((void *)v36 + 4);
  *((void *)v35 + 3) = *((void *)v36 + 3);
  *((void *)v35 + 4) = v38;
  swift_bridgeObjectRelease();
  *((_DWORD *)v35 + 10) = *((_DWORD *)v36 + 10);
  v35[44] = v36[44];
  *((_OWORD *)v35 + 3) = *((_OWORD *)v36 + 3);
  *(_OWORD *)(v35 + 57) = *(_OWORD *)(v36 + 57);
  *((void *)v35 + 10) = *((void *)v36 + 10);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v35 + 88) = *(_OWORD *)(v36 + 88);
  *(_OWORD *)(v35 + 97) = *(_OWORD *)(v36 + 97);
  *((void *)v35 + 15) = *((void *)v36 + 15);
  v35[128] = v36[128];
  uint64_t v39 = *((void *)v36 + 18);
  *((void *)v35 + 17) = *((void *)v36 + 17);
  *((void *)v35 + 18) = v39;
  swift_bridgeObjectRelease();
  v35[152] = v36[152];
  if (!*((void *)v35 + 21))
  {
LABEL_47:
    long long v42 = *((_OWORD *)v36 + 11);
    *((_OWORD *)v35 + 10) = *((_OWORD *)v36 + 10);
    *((_OWORD *)v35 + 11) = v42;
    return a1;
  }
  uint64_t v40 = *((void *)v36 + 21);
  if (!v40)
  {
    sub_253E56F4C((uint64_t)(v35 + 160));
    goto LABEL_47;
  }
  *((void *)v35 + 20) = *((void *)v36 + 20);
  *((void *)v35 + 21) = v40;
  swift_bridgeObjectRelease();
  uint64_t v41 = *((void *)v36 + 23);
  *((void *)v35 + 22) = *((void *)v36 + 22);
  *((void *)v35 + 23) = v41;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContextValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253E5980C);
}

uint64_t sub_253E5980C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_253E82240();
  sub_253E5C0D8();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v9, a2, v8);
  }
  sub_253E390C4(&qword_26B257828);
  sub_253E5C0D8();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 28) + 80);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  int v14 = v13 - 1;
  if (v14 < 0) {
    int v14 = -1;
  }
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253E598F0);
}

void sub_253E598F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_253E82240();
  sub_253E5C0D8();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    sub_253E390C4(&qword_26B257828);
    sub_253E5C0D8();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28) + 80) = a2;
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }

  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v11, a2, a2, v10);
}

void sub_253E599B0()
{
  sub_253E82240();
  if (v0 <= 0x3F)
  {
    sub_253E5784C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t destroy for ContextMetadata(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 168);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ContextMetadata(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v6 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v6;
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v7 = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(void *)(a1 + 168) = v7;
    uint64_t v8 = *(void *)(a2 + 176);
    uint64_t v9 = *(void *)(a2 + 184);
    *(void *)(a1 + 176) = v8;
    *(void *)(a1 + 184) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 176) = v10;
  }
  return a1;
}

uint64_t assignWithCopy for ContextMetadata(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v4 = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(_DWORD *)(a1 + 40) = v4;
  long long v5 = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = v5;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v6 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  *(_OWORD *)(a1 + 88) = v6;
  uint64_t v7 = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 120) = v7;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  uint64_t v8 = (_OWORD *)(a1 + 160);
  uint64_t v9 = (_OWORD *)(a2 + 160);
  uint64_t v10 = *(void *)(a2 + 168);
  if (*(void *)(a1 + 168))
  {
    if (v10)
    {
      *(void *)(a1 + 160) = *(void *)(a2 + 160);
      *(void *)(a1 + 168) = *(void *)(a2 + 168);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_253E56F4C(a1 + 160);
      long long v11 = *(_OWORD *)(a2 + 176);
      *uint64_t v8 = *v9;
      *(_OWORD *)(a1 + 176) = v11;
    }
  }
  else if (v10)
  {
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(void *)(a1 + 168) = *(void *)(a2 + 168);
    *(void *)(a1 + 176) = *(void *)(a2 + 176);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v12 = *(_OWORD *)(a2 + 176);
    *uint64_t v8 = *v9;
    *(_OWORD *)(a1 + 176) = v12;
  }
  return a1;
}

void *initializeWithTake for ContextMetadata(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC0uLL);
}

uint64_t assignWithTake for ContextMetadata(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 44) = *(unsigned char *)(a2 + 44);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v6 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  if (!*(void *)(a1 + 168)) {
    goto LABEL_5;
  }
  uint64_t v7 = *(void *)(a2 + 168);
  if (!v7)
  {
    sub_253E56F4C(a1 + 160);
LABEL_5:
    long long v9 = *(_OWORD *)(a2 + 176);
    *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
    *(_OWORD *)(a1 + 176) = v9;
    return a1;
  }
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContextMetadata(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 192))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 80);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextMetadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 184) = 0;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 192) = 1;
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
      *(void *)(result + 80) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 192) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for ContextMetadata()
{
}

uint64_t destroy for ContextualEntityDisplayRepresentation()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ContextualEntityDisplayRepresentation(void *a1, void *a2)
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

void *assignWithCopy for ContextualEntityDisplayRepresentation(void *a1, void *a2)
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

__n128 initializeWithTake for ContextualEntityDisplayRepresentation(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for ContextualEntityDisplayRepresentation(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for ContextualEntityDisplayRepresentation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextualEntityDisplayRepresentation(uint64_t result, int a2, int a3)
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

void type metadata accessor for ContextualEntityDisplayRepresentation()
{
}

__n128 initializeBufferWithCopyOfBuffer for BoundingBox(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BoundingBox(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BoundingBox(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for BoundingBox()
{
}

uint64_t initializeWithCopy for SurroundingText(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SurroundingText(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  return a1;
}

__n128 initializeWithTake for SurroundingText(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SurroundingText(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SurroundingText(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SurroundingText(uint64_t result, int a2, int a3)
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

void type metadata accessor for SurroundingText()
{
}

uint64_t initializeBufferWithCopyOfBuffer for Confidence(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Confidence(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 5))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
      BOOL v4 = v3 >= 3;
      int v2 = v3 - 3;
      if (!v4) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Confidence(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 5) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 5) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = a2 + 2;
    }
  }
  return result;
}

void type metadata accessor for Confidence()
{
}

uint64_t getEnumTagSinglePayload for ContextType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE4)
  {
    if (a2 + 28 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 28) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 29;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1D;
  int v5 = v6 - 29;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContextType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 28 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 28) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE3)
  {
    unsigned int v6 = ((a2 - 228) >> 8) + 1;
    *__n128 result = a2 + 28;
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
        JUMPOUT(0x253E5A558);
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
          *__n128 result = a2 + 28;
        break;
    }
  }
  return result;
}

void type metadata accessor for ContextType()
{
}

void type metadata accessor for SourceType()
{
}

uint64_t getEnumTagSinglePayload for EntityType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF2)
  {
    if (a2 + 14 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 14) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 15;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v5 = v6 - 15;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for EntityType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *__n128 result = a2 + 14;
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
        JUMPOUT(0x253E5A6F4);
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
          *__n128 result = a2 + 14;
        break;
    }
  }
  return result;
}

void type metadata accessor for EntityType()
{
}

void type metadata accessor for ContextDataSource()
{
}

void type metadata accessor for ConfidenceBucket()
{
}

uint64_t _s22IntelligenceFlowShared16ConfidenceBucketOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_253E5C51C(-1);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 3);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 3);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_253E5C51C((*a1 | (v4 << 8)) - 3);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return sub_253E5C51C(v8);
}

unsigned char *_s22IntelligenceFlowShared16ConfidenceBucketOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        __n128 result = (unsigned char *)sub_253E5C6BC((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)sub_253E5C698((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x253E5A888);
      case 4:
        __n128 result = (unsigned char *)sub_253E5C6AC((uint64_t)result, v6);
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
          __n128 result = sub_253E5C6B4(result, a2 + 2);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfidenceBucket.CodingKeys()
{
  return &type metadata for ConfidenceBucket.CodingKeys;
}

ValueMetadata *type metadata accessor for ConfidenceBucket.LowCodingKeys()
{
  return &type metadata for ConfidenceBucket.LowCodingKeys;
}

ValueMetadata *type metadata accessor for ConfidenceBucket.MediumCodingKeys()
{
  return &type metadata for ConfidenceBucket.MediumCodingKeys;
}

ValueMetadata *type metadata accessor for ConfidenceBucket.HighCodingKeys()
{
  return &type metadata for ConfidenceBucket.HighCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.CodingKeys()
{
  return &type metadata for ContextDataSource.CodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.OnScreenCodingKeys()
{
  return &type metadata for ContextDataSource.OnScreenCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.ConversationalCodingKeys()
{
  return &type metadata for ContextDataSource.ConversationalCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.UnknownCodingKeys()
{
  return &type metadata for ContextDataSource.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.AnnouncementCodingKeys()
{
  return &type metadata for ContextDataSource.AnnouncementCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.NotificationCodingKeys()
{
  return &type metadata for ContextDataSource.NotificationCodingKeys;
}

ValueMetadata *type metadata accessor for ContextDataSource.VisualCodingKeys()
{
  return &type metadata for ContextDataSource.VisualCodingKeys;
}

unsigned char *sub_253E5A968(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Confidence.CodingKeys()
{
  return &type metadata for Confidence.CodingKeys;
}

unsigned char *sub_253E5A984(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x253E5AA20);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for Confidence.ConfidenceError()
{
}

ValueMetadata *type metadata accessor for SurroundingText.CodingKeys()
{
  return &type metadata for SurroundingText.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared17ContextDataSourceOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_253E5C51C(-1);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 6);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 6);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_253E5C51C((*a1 | (v4 << 8)) - 6);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return sub_253E5C51C(v8);
}

unsigned char *_s22IntelligenceFlowShared17ContextDataSourceOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 5;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)sub_253E5C6BC((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)sub_253E5C698((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x253E5ABA4);
      case 4:
        __n128 result = (unsigned char *)sub_253E5C6AC((uint64_t)result, v6);
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
          __n128 result = sub_253E5C6B4(result, a2 + 5);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BoundingBox.CodingKeys()
{
  return &type metadata for BoundingBox.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared10ConfidenceV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_253E5C51C(-1);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 2);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_253E5C51C((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return sub_253E5C51C(v8);
}

unsigned char *_s22IntelligenceFlowShared10ConfidenceV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        __n128 result = (unsigned char *)sub_253E5C6BC((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)sub_253E5C698((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x253E5AD1CLL);
      case 4:
        __n128 result = (unsigned char *)sub_253E5C6AC((uint64_t)result, v6);
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
          __n128 result = sub_253E5C6B4(result, a2 + 1);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextualEntityDisplayRepresentation.CodingKeys()
{
  return &type metadata for ContextualEntityDisplayRepresentation.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ContextMetadata.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF5)
  {
    if (a2 + 11 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 11) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v5 = v6 - 12;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for ContextMetadata.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *__n128 result = a2 + 11;
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
        JUMPOUT(0x253E5AEA8);
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
          *__n128 result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextMetadata.CodingKeys()
{
  return &type metadata for ContextMetadata.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for ContextValue.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x253E5AFACLL);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextValue.CodingKeys()
{
  return &type metadata for ContextValue.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RetrievedContext.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RetrievedContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x253E5B138);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RetrievedContext.CodingKeys()
{
  return &type metadata for RetrievedContext.CodingKeys;
}

unint64_t sub_253E5B174()
{
  unint64_t result = qword_269D97998;
  if (!qword_269D97998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97998);
  }
  return result;
}

unint64_t sub_253E5B1C4()
{
  unint64_t result = qword_269D979A0;
  if (!qword_269D979A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979A0);
  }
  return result;
}

unint64_t sub_253E5B214()
{
  unint64_t result = qword_269D979A8;
  if (!qword_269D979A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979A8);
  }
  return result;
}

unint64_t sub_253E5B264()
{
  unint64_t result = qword_269D979B0;
  if (!qword_269D979B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979B0);
  }
  return result;
}

unint64_t sub_253E5B2B4()
{
  unint64_t result = qword_269D979B8;
  if (!qword_269D979B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979B8);
  }
  return result;
}

unint64_t sub_253E5B304()
{
  unint64_t result = qword_269D979C0;
  if (!qword_269D979C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979C0);
  }
  return result;
}

unint64_t sub_253E5B354()
{
  unint64_t result = qword_269D979C8;
  if (!qword_269D979C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979C8);
  }
  return result;
}

unint64_t sub_253E5B3A4()
{
  unint64_t result = qword_269D979D0;
  if (!qword_269D979D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979D0);
  }
  return result;
}

unint64_t sub_253E5B3F4()
{
  unint64_t result = qword_269D979D8;
  if (!qword_269D979D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979D8);
  }
  return result;
}

unint64_t sub_253E5B444()
{
  unint64_t result = qword_269D979E0;
  if (!qword_269D979E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979E0);
  }
  return result;
}

unint64_t sub_253E5B494()
{
  unint64_t result = qword_269D979E8;
  if (!qword_269D979E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979E8);
  }
  return result;
}

unint64_t sub_253E5B4E4()
{
  unint64_t result = qword_269D979F0;
  if (!qword_269D979F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979F0);
  }
  return result;
}

unint64_t sub_253E5B534()
{
  unint64_t result = qword_269D979F8;
  if (!qword_269D979F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D979F8);
  }
  return result;
}

unint64_t sub_253E5B584()
{
  unint64_t result = qword_269D97A00;
  if (!qword_269D97A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A00);
  }
  return result;
}

unint64_t sub_253E5B5D4()
{
  unint64_t result = qword_269D97A08;
  if (!qword_269D97A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A08);
  }
  return result;
}

unint64_t sub_253E5B624()
{
  unint64_t result = qword_269D97A10;
  if (!qword_269D97A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A10);
  }
  return result;
}

unint64_t sub_253E5B674()
{
  unint64_t result = qword_269D97A18;
  if (!qword_269D97A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A18);
  }
  return result;
}

unint64_t sub_253E5B6C4()
{
  unint64_t result = qword_269D97A20;
  if (!qword_269D97A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A20);
  }
  return result;
}

unint64_t sub_253E5B714()
{
  unint64_t result = qword_269D97A28;
  if (!qword_269D97A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A28);
  }
  return result;
}

unint64_t sub_253E5B764()
{
  unint64_t result = qword_269D97A30;
  if (!qword_269D97A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A30);
  }
  return result;
}

unint64_t sub_253E5B7B4()
{
  unint64_t result = qword_269D97A38;
  if (!qword_269D97A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A38);
  }
  return result;
}

unint64_t sub_253E5B804()
{
  unint64_t result = qword_269D97A40;
  if (!qword_269D97A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A40);
  }
  return result;
}

unint64_t sub_253E5B854()
{
  unint64_t result = qword_269D97A48;
  if (!qword_269D97A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A48);
  }
  return result;
}

unint64_t sub_253E5B8A4()
{
  unint64_t result = qword_269D97A50;
  if (!qword_269D97A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A50);
  }
  return result;
}

unint64_t sub_253E5B8F4()
{
  unint64_t result = qword_269D97A58;
  if (!qword_269D97A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A58);
  }
  return result;
}

unint64_t sub_253E5B944()
{
  unint64_t result = qword_269D97A60;
  if (!qword_269D97A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A60);
  }
  return result;
}

unint64_t sub_253E5B994()
{
  unint64_t result = qword_269D97A68;
  if (!qword_269D97A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A68);
  }
  return result;
}

unint64_t sub_253E5B9E4()
{
  unint64_t result = qword_269D97A70;
  if (!qword_269D97A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A70);
  }
  return result;
}

unint64_t sub_253E5BA34()
{
  unint64_t result = qword_269D97A78;
  if (!qword_269D97A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A78);
  }
  return result;
}

unint64_t sub_253E5BA84()
{
  unint64_t result = qword_269D97A80;
  if (!qword_269D97A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A80);
  }
  return result;
}

unint64_t sub_253E5BAD4()
{
  unint64_t result = qword_269D97A88;
  if (!qword_269D97A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A88);
  }
  return result;
}

unint64_t sub_253E5BB24()
{
  unint64_t result = qword_269D97A90;
  if (!qword_269D97A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A90);
  }
  return result;
}

unint64_t sub_253E5BB74()
{
  unint64_t result = qword_269D97A98;
  if (!qword_269D97A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97A98);
  }
  return result;
}

unint64_t sub_253E5BBC4()
{
  unint64_t result = qword_269D97AA0;
  if (!qword_269D97AA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AA0);
  }
  return result;
}

unint64_t sub_253E5BC14()
{
  unint64_t result = qword_269D97AA8;
  if (!qword_269D97AA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AA8);
  }
  return result;
}

unint64_t sub_253E5BC64()
{
  unint64_t result = qword_269D97AB0;
  if (!qword_269D97AB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AB0);
  }
  return result;
}

unint64_t sub_253E5BCB4()
{
  unint64_t result = qword_269D97AB8;
  if (!qword_269D97AB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AB8);
  }
  return result;
}

unint64_t sub_253E5BD04()
{
  unint64_t result = qword_269D97AC0;
  if (!qword_269D97AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AC0);
  }
  return result;
}

unint64_t sub_253E5BD54()
{
  unint64_t result = qword_269D97AC8;
  if (!qword_269D97AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AC8);
  }
  return result;
}

unint64_t sub_253E5BDA4()
{
  unint64_t result = qword_269D97AD0;
  if (!qword_269D97AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AD0);
  }
  return result;
}

unint64_t sub_253E5BDF4()
{
  unint64_t result = qword_269D97AD8;
  if (!qword_269D97AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AD8);
  }
  return result;
}

unint64_t sub_253E5BE44()
{
  unint64_t result = qword_269D97AE0;
  if (!qword_269D97AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AE0);
  }
  return result;
}

unint64_t sub_253E5BE94()
{
  unint64_t result = qword_26B2577B8;
  if (!qword_26B2577B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2577B8);
  }
  return result;
}

unint64_t sub_253E5BEE4()
{
  unint64_t result = qword_26B2577B0;
  if (!qword_26B2577B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2577B0);
  }
  return result;
}

unint64_t sub_253E5BF34()
{
  unint64_t result = qword_269D97AE8;
  if (!qword_269D97AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AE8);
  }
  return result;
}

unint64_t sub_253E5BF84()
{
  unint64_t result = qword_269D97AF0;
  if (!qword_269D97AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AF0);
  }
  return result;
}

unint64_t sub_253E5BFD0()
{
  unint64_t result = qword_269D97AF8;
  if (!qword_269D97AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97AF8);
  }
  return result;
}

unint64_t sub_253E5C01C()
{
  unint64_t result = qword_269D97B00;
  if (!qword_269D97B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97B00);
  }
  return result;
}

unint64_t sub_253E5C068()
{
  unint64_t result = qword_26B2577A0;
  if (!qword_26B2577A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2577A0);
  }
  return result;
}

__n128 sub_253E5C100(__n128 *a1)
{
  return a1[4];
}

uint64_t sub_253E5C19C()
{
  return sub_253E826A0();
}

uint64_t sub_253E5C1C8()
{
  return v0;
}

uint64_t sub_253E5C1E0()
{
  return sub_253E82730();
}

uint64_t sub_253E5C214()
{
  return sub_253E825C0();
}

uint64_t sub_253E5C230()
{
  return sub_253E82660();
}

void *sub_253E5C24C()
{
  return sub_253E39108(v0, v0[3]);
}

uint64_t sub_253E5C270()
{
  return *(void *)(v0 + 56);
}

uint64_t sub_253E5C288()
{
  return v0;
}

uint64_t sub_253E5C2A0()
{
  return v0;
}

uint64_t sub_253E5C2B8()
{
  return sub_253E82620();
}

uint64_t sub_253E5C2F0()
{
  return sub_253E82620();
}

uint64_t sub_253E5C334()
{
  return sub_253E825E0();
}

uint64_t sub_253E5C354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_253E4BEA8((uint64_t)&a9, v9, v10);
}

uint64_t sub_253E5C370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_253E4BEA8((uint64_t)&a9, v10, v9);
}

uint64_t sub_253E5C38C()
{
  return 0x7261646E656C6163;
}

uint64_t sub_253E5C3A0()
{
  return sub_253E826F0();
}

void sub_253E5C3C8(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_253E5C3E4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_253E5C400()
{
  return 0;
}

uint64_t sub_253E5C41C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_253E5C428()
{
  return type metadata accessor for RetrievedContext(0);
}

void sub_253E5C440(__n128 *a1@<X8>, __n128 a2@<Q0>)
{
  *a1 = a2;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
}

uint64_t sub_253E5C450@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 + 368) = a1;
  return v1 + 368;
}

uint64_t sub_253E5C468()
{
  return sub_253E82800();
}

uint64_t sub_253E5C498()
{
  return sub_253E826F0();
}

uint64_t sub_253E5C4B4()
{
  return sub_253E826A0();
}

uint64_t sub_253E5C4D0()
{
  return v0;
}

uint64_t sub_253E5C4DC()
{
  return sub_253E825C0();
}

uint64_t sub_253E5C4F8()
{
  return sub_253E82850();
}

uint64_t sub_253E5C51C@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t sub_253E5C524()
{
  return v0;
}

uint64_t sub_253E5C538()
{
  return v0;
}

uint64_t sub_253E5C544()
{
  return sub_253E82860();
}

unint64_t sub_253E5C564(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t sub_253E5C58C()
{
  return v0;
}

uint64_t sub_253E5C598()
{
  return v0;
}

uint64_t sub_253E5C5AC()
{
  return sub_253E82860();
}

uint64_t sub_253E5C5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_253E4BEA8(a1, (uint64_t)&a9, v9);
}

uint64_t sub_253E5C5E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_253E4BEA8(a1, (uint64_t)&a9, v9);
}

uint64_t sub_253E5C5FC()
{
  return swift_allocError();
}

uint64_t sub_253E5C614(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_253E5C620()
{
  return type metadata accessor for RetrievedContext(0);
}

uint64_t sub_253E5C638()
{
  return v0;
}

void sub_253E5C64C(char a1@<W8>)
{
  *(unsigned char *)(v1 - 120) = a1;
}

uint64_t sub_253E5C658@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  return sub_253E4BEA8(v45 + a1, (uint64_t)&a44, v44);
}

uint64_t sub_253E5C678@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  return sub_253E4BEA8(v27 + a1, (uint64_t)&a26, v26);
}

uint64_t sub_253E5C698@<X0>(uint64_t result@<X0>, __int16 a2@<W8>)
{
  *(_WORD *)(result + 1) = a2;
  return result;
}

uint64_t sub_253E5C6A0()
{
  return v0;
}

uint64_t sub_253E5C6AC@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  *(_DWORD *)(result + 1) = a2;
  return result;
}

unsigned char *sub_253E5C6B4@<X0>(unsigned char *result@<X0>, char a2@<W8>)
{
  *unint64_t result = a2;
  return result;
}

uint64_t sub_253E5C6BC@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(result + 1) = a2;
  return result;
}

uint64_t sub_253E5C6C8(uint64_t a1)
{
  return sub_253E5CA30(0, a1, (void (*)(uint64_t))ContextType.rawValue.getter);
}

uint64_t sub_253E5C6FC()
{
  return sub_253E82840();
}

uint64_t sub_253E5C744(uint64_t a1)
{
  return sub_253E5CA30(0, a1, (void (*)(uint64_t))EntityType.rawValue.getter);
}

uint64_t sub_253E5C778()
{
  return sub_253E5CA9C();
}

uint64_t sub_253E5C784()
{
  sub_253E82360();

  return swift_bridgeObjectRelease();
}

uint64_t sub_253E5C814(uint64_t a1, uint64_t a2)
{
  return sub_253E5C958(a1, a2, (void (*)(void))ContextType.rawValue.getter);
}

uint64_t sub_253E5C82C()
{
  sub_253E82360();

  return swift_bridgeObjectRelease();
}

uint64_t sub_253E5C940(uint64_t a1, uint64_t a2)
{
  return sub_253E5C958(a1, a2, (void (*)(void))EntityType.rawValue.getter);
}

uint64_t sub_253E5C958(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_253E82360();

  return swift_bridgeObjectRelease();
}

uint64_t sub_253E5C9BC(uint64_t a1, uint64_t a2)
{
  return sub_253E5CA30(a1, a2, (void (*)(uint64_t))EntityType.rawValue.getter);
}

uint64_t sub_253E5C9D4()
{
  return sub_253E82840();
}

uint64_t sub_253E5CA18(uint64_t a1, uint64_t a2)
{
  return sub_253E5CA30(a1, a2, (void (*)(uint64_t))ContextType.rawValue.getter);
}

uint64_t sub_253E5CA30(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_253E82800();
  a3(v4);
  sub_253E82360();
  swift_bridgeObjectRelease();
  return sub_253E82840();
}

uint64_t sub_253E5CA9C()
{
  return sub_253E82840();
}

uint64_t sub_253E5CB44()
{
  return sub_253E82840();
}

IntelligenceFlowShared::EntityMatcherType_optional __swiftcall EntityMatcherType.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v2 = v1;
  unint64_t v3 = sub_253E825B0();
  result.value = swift_bridgeObjectRelease();
  char v5 = 3;
  if (v3 < 3) {
    char v5 = v3;
  }
  char *v2 = v5;
  return result;
}

uint64_t EntityMatcherType.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000011;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000013;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6E776F6E6B6E75;
  }
}

uint64_t sub_253E5CC44()
{
  return sub_253E3D008();
}

unint64_t sub_253E5CC54()
{
  unint64_t result = qword_269D97B08;
  if (!qword_269D97B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97B08);
  }
  return result;
}

uint64_t sub_253E5CCA0()
{
  return sub_253E5C778();
}

uint64_t sub_253E5CCA8()
{
  return sub_253E5C784();
}

uint64_t sub_253E5CCB0()
{
  return sub_253E5CA9C();
}

IntelligenceFlowShared::EntityMatcherType_optional sub_253E5CCB8(Swift::String *a1)
{
  return EntityMatcherType.init(rawValue:)(*a1);
}

uint64_t sub_253E5CCC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EntityMatcherType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_253E5CCEC()
{
  return sub_253E823F0();
}

uint64_t sub_253E5CD4C()
{
  return sub_253E823C0();
}

uint64_t dispatch thunk of EntitySpanMatcherProtocol.getMatcherType()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EntitySpanMatcherProtocol.matchEntitySpans(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_253E5CEBC;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_253E5CEBC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

unsigned char *storeEnumTagSinglePayload for EntityMatcherType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x253E5D084);
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

ValueMetadata *type metadata accessor for EntityMatcherType()
{
  return &type metadata for EntityMatcherType;
}

unint64_t sub_253E5D0BC()
{
  unint64_t result = qword_269D97B18;
  if (!qword_269D97B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97B18);
  }
  return result;
}

uint64_t FeatureFlag.isEnabled.getter()
{
  char v1 = *v0;
  v7[0] = *v0;
  uint64_t v2 = FeatureFlag.requirements.getter();
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    while (1)
    {
      v7[0] = *(unsigned char *)(v2 + v4 + 32);
      if ((FeatureFlag.isEnabled.getter() & 1) == 0) {
        break;
      }
      if (v3 == ++v4) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    char v5 = 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    int v8 = &type metadata for FeatureFlag;
    unint64_t v9 = sub_253E5D238();
    v7[0] = v1;
    char v5 = sub_253E82150();
    sub_253E393E4((uint64_t)v7);
  }
  return v5 & 1;
}

uint64_t FeatureFlag.requirements.getter()
{
  return qword_26539AC98[*v0];
}

uint64_t FeatureFlag.isItselfEnabled.getter()
{
  char v1 = *v0;
  char v5 = &type metadata for FeatureFlag;
  unint64_t v6 = sub_253E5D238();
  v4[0] = v1;
  char v2 = sub_253E82150();
  sub_253E393E4((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_253E5D238()
{
  unint64_t result = qword_26B257C20;
  if (!qword_26B257C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257C20);
  }
  return result;
}

uint64_t FeatureFlag.withForcedEnabled<A>(_:block:)()
{
  return MEMORY[0x270FA2498](sub_253E5D2A0, 0, 0);
}

uint64_t sub_253E5D2A0()
{
  sub_253E5D330();
  swift_allocError();
  unsigned char *v1 = 31;
  swift_willThrow();
  char v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

unint64_t sub_253E5D330()
{
  unint64_t result = qword_26B257730;
  if (!qword_26B257730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B257730);
  }
  return result;
}

const char *FeatureFlag.domain.getter()
{
  return "IntelligenceFlow";
}

const char *FeatureFlag.feature.getter()
{
  unint64_t result = "IntelligenceFlow";
  switch(*v0)
  {
    case 1:
      unint64_t result = "FullPlanner";
      break;
    case 2:
      unint64_t result = "ToolRetrieval";
      break;
    case 3:
      unint64_t result = "ToolRetrievalStageOne";
      break;
    case 4:
      unint64_t result = "ToolRetrievalStageTwo";
      break;
    case 5:
      unint64_t result = "ToolRetrievalStageThree";
      break;
    case 6:
      unint64_t result = "ToolRetrievalStageFour";
      break;
    case 7:
      unint64_t result = "ResponseGeneration";
      break;
    case 8:
      unint64_t result = "PlanOverrides";
      break;
    case 9:
      unint64_t result = "QueryDecorationRanker";
      break;
    case 0xA:
      unint64_t result = "QueryDecorationPrePlanner";
      break;
    case 0xB:
      unint64_t result = "QueryDecorationBackgroundHydration";
      break;
    case 0xC:
      unint64_t result = "QueryDecorationBackgroundToolRetrieval";
      break;
    case 0xD:
      unint64_t result = "QueryDecorationOnScreenContentRetrieval";
      break;
    case 0xE:
      unint64_t result = "ContextRetrieval";
      break;
    case 0xF:
      unint64_t result = "PlannerSpanMatcher";
      break;
    case 0x10:
      unint64_t result = "JointResolver";
      break;
    case 0x11:
      unint64_t result = "EntitySimilarity";
      break;
    case 0x12:
      unint64_t result = "InteractionStore";
      break;
    case 0x13:
      unint64_t result = "FeedbackLearning";
      break;
    case 0x14:
      unint64_t result = "JointResolverCurareLogging";
      break;
    case 0x15:
      unint64_t result = "UIIntelligence";
      break;
    case 0x16:
      unint64_t result = "ContextualEntityGrounding";
      break;
    case 0x17:
      unint64_t result = "CustomNLTagger";
      break;
    case 0x18:
      unint64_t result = "MenuCommandsAsTools";
      break;
    case 0x19:
      unint64_t result = "ToolBoxAssistantIntentProvider";
      break;
    case 0x1A:
      unint64_t result = "GlobalEntitySpanMatcher";
      break;
    case 0x1B:
      unint64_t result = "JointResolverLocationSignal";
      break;
    case 0x1C:
      unint64_t result = "ShimToolRetrieval";
      break;
    case 0x1D:
      unint64_t result = "SearchSupport";
      break;
    case 0x1E:
      unint64_t result = "SearchInCarSupport";
      break;
    default:
      return result;
  }
  return result;
}

BOOL static FeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t FeatureFlag.hash(into:)()
{
  return sub_253E82810();
}

void *static FeatureFlag.allCases.getter()
{
  return &unk_27036BAA8;
}

uint64_t FeatureFlag.hashValue.getter()
{
  return sub_253E82840();
}

const char *sub_253E5D68C()
{
  return "IntelligenceFlow";
}

const char *sub_253E5D6A0()
{
  return FeatureFlag.feature.getter();
}

void sub_253E5D6BC(void *a1@<X8>)
{
  *a1 = &unk_27036BAA8;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FeatureFlag.checkEnabled()()
{
  char v1 = *v0;
  if ((FeatureFlag.isEnabled.getter() & 1) == 0)
  {
    sub_253E5D330();
    swift_allocError();
    unsigned char *v2 = v1;
    swift_willThrow();
  }
}

unint64_t sub_253E5D73C()
{
  unint64_t result = qword_269D97B28;
  if (!qword_269D97B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97B28);
  }
  return result;
}

unint64_t sub_253E5D78C()
{
  unint64_t result = qword_269D97B30;
  if (!qword_269D97B30)
  {
    sub_253E3AE54(&qword_269D97B38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97B30);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FeatureFlag(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE2)
  {
    if (a2 + 30 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 30) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 31;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1F;
  int v5 = v6 - 31;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for FeatureFlag(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 30 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 30) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE1)
  {
    unsigned int v6 = ((a2 - 226) >> 8) + 1;
    *unint64_t result = a2 + 30;
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
        JUMPOUT(0x253E5D934);
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
          *unint64_t result = a2 + 30;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

uint64_t getEnumTagSinglePayload for FeatureFlagError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xE1)
  {
    unsigned int v2 = a2 + 31;
    if (a2 + 31 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 31;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 31;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x253E5DA18);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 31;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  BOOL v8 = v7 >= 0x1F;
  unsigned int v9 = v7 - 31;
  if (!v8) {
    unsigned int v9 = -1;
  }
  if (v9 + 1 >= 2) {
    return v9;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for FeatureFlagError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 31;
  if (a3 + 31 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xE1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xE0)
  {
    unsigned int v7 = ((a2 - 225) >> 8) + 1;
    *unint64_t result = a2 + 31;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x253E5DB00);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *unint64_t result = a2 + 31;
        break;
    }
  }
  return result;
}

uint64_t sub_253E5DB28(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 0x1F) {
    return v1 - 30;
  }
  else {
    return 0;
  }
}

unsigned char *sub_253E5DB3C(unsigned char *result, int a2)
{
  if (a2) {
    *unint64_t result = a2 + 30;
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlagError()
{
  return &type metadata for FeatureFlagError;
}

unint64_t static Logging.subsystem.getter()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_253E5DB78(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257BA0);
}

uint64_t static Logging.general.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257B98, MEMORY[0x263F90268], (uint64_t)qword_26B257BA0, a1);
}

uint64_t sub_253E5DBD0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_253E5DC08(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97B40);
}

uint64_t static Logging.signpost.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972B0, MEMORY[0x263F90268], (uint64_t)qword_269D97B40, a1);
}

uint64_t sub_253E5DC60(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97B58);
}

uint64_t static Logging.pilot.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972B8, MEMORY[0x263F90268], (uint64_t)qword_269D97B58, a1);
}

uint64_t sub_253E5DCB4(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97B70);
}

uint64_t static Logging.plannerSupport.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972C0, MEMORY[0x263F90268], (uint64_t)qword_269D97B70, a1);
}

uint64_t sub_253E5DD18(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97B88);
}

uint64_t static Logging.app.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972C8, MEMORY[0x263F90268], (uint64_t)qword_269D97B88, a1);
}

uint64_t sub_253E5DD68(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97BA0);
}

uint64_t static Logging.mail.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972D0, MEMORY[0x263F90268], (uint64_t)qword_269D97BA0, a1);
}

uint64_t sub_253E5DDB8(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97BB8);
}

uint64_t static Logging.appIntents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972D8, MEMORY[0x263F90268], (uint64_t)qword_269D97BB8, a1);
}

uint64_t sub_253E5DE14(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97BD0);
}

uint64_t static Logging.toolRetriever.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972E0, MEMORY[0x263F90268], (uint64_t)qword_269D97BD0, a1);
}

uint64_t sub_253E5DE78(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97BE8);
}

uint64_t static Logging.planOverrides.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972E8, MEMORY[0x263F90268], (uint64_t)qword_269D97BE8, a1);
}

uint64_t sub_253E5DEDC(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97C00);
}

uint64_t static Logging.promptResolver.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972F0, MEMORY[0x263F90268], (uint64_t)qword_269D97C00, a1);
}

uint64_t sub_253E5DF40(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97C18);
}

uint64_t static Logging.fullPlanner.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D972F8, MEMORY[0x263F90268], (uint64_t)qword_269D97C18, a1);
}

uint64_t sub_253E5DFA0(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97C30);
}

uint64_t static Logging.plannerHTTPClient.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97300, MEMORY[0x263F90268], (uint64_t)qword_269D97C30, a1);
}

uint64_t sub_253E5DFFC(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257A98);
}

uint64_t static Logging.responseGeneration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257AB0, MEMORY[0x263F90268], (uint64_t)qword_26B257A98, a1);
}

uint64_t sub_253E5E058(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97C48);
}

uint64_t static Logging.queryDecorationRanker.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97308, MEMORY[0x263F90268], (uint64_t)qword_269D97C48, a1);
}

uint64_t sub_253E5E0B4(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B2577F0);
}

uint64_t static Logging.contextRetrieval.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257710, MEMORY[0x263F90268], (uint64_t)qword_26B2577F0, a1);
}

uint64_t sub_253E5E110(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97C60);
}

uint64_t static Logging.plannerSpanMatcher.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97310, MEMORY[0x263F90268], (uint64_t)qword_269D97C60, a1);
}

uint64_t sub_253E5E16C(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257BD0);
}

uint64_t static Logging.queryDecoration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257BB8, MEMORY[0x263F90268], (uint64_t)qword_26B257BD0, a1);
}

uint64_t sub_253E5E1D0(uint64_t a1)
{
  return sub_253E60068(a1, qword_269D97C78);
}

uint64_t static Logging.queryDecorationService.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97318, MEMORY[0x263F90268], (uint64_t)qword_269D97C78, a1);
}

uint64_t sub_253E5E228(uint64_t a1)
{
  return sub_253E60068(a1, qword_269D97C90);
}

uint64_t static Logging.entitySpanMatcher.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97320, MEMORY[0x263F90268], (uint64_t)qword_269D97C90, a1);
}

uint64_t sub_253E5E280(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257AF8);
}

uint64_t static Logging.client.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257B10, MEMORY[0x263F90268], (uint64_t)qword_26B257AF8, a1);
}

uint64_t sub_253E5E2D4(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257808);
}

uint64_t static Logging.context.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257718, MEMORY[0x263F90268], (uint64_t)qword_26B257808, a1);
}

uint64_t sub_253E5E32C(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257BE8);
}

uint64_t static Logging.uiContext.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257BC0, MEMORY[0x263F90268], (uint64_t)qword_26B257BE8, a1);
}

uint64_t sub_253E5E388(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97CA8);
}

uint64_t static Logging.entityDetection.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97328, MEMORY[0x263F90268], (uint64_t)qword_269D97CA8, a1);
}

uint64_t sub_253E5E3EC(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257A78);
}

uint64_t static Logging.instrumentation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257A90, MEMORY[0x263F90268], (uint64_t)qword_26B257A78, a1);
}

uint64_t sub_253E5E450(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97CC0);
}

uint64_t static Logging.llmInterface.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97330, MEMORY[0x263F90268], (uint64_t)qword_269D97CC0, a1);
}

uint64_t sub_253E5E4B0(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257B78);
}

uint64_t static Logging.learning.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257B90, MEMORY[0x263F90268], (uint64_t)qword_26B257B78, a1);
}

uint64_t sub_253E5E508(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97CD8);
}

uint64_t static Logging.llm.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97338, MEMORY[0x263F90268], (uint64_t)qword_269D97CD8, a1);
}

uint64_t sub_253E5E558(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97CF0);
}

uint64_t static Logging.parser.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97340, MEMORY[0x263F90268], (uint64_t)qword_269D97CF0, a1);
}

uint64_t sub_253E5E5AC(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97D08);
}

uint64_t static Logging.flattener.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97348, MEMORY[0x263F90268], (uint64_t)qword_269D97D08, a1);
}

uint64_t sub_253E5E608(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257B18);
}

uint64_t static Logging.planner.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257B30, MEMORY[0x263F90268], (uint64_t)qword_26B257B18, a1);
}

uint64_t sub_253E5E660(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97D20);
}

uint64_t static Logging.search.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97350, MEMORY[0x263F90268], (uint64_t)qword_269D97D20, a1);
}

uint64_t sub_253E5E6B4(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257B38);
}

uint64_t static Logging.session.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257B50, MEMORY[0x263F90268], (uint64_t)qword_26B257B38, a1);
}

uint64_t sub_253E5E70C(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97D38);
}

uint64_t static Logging.injection.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97358, MEMORY[0x263F90268], (uint64_t)qword_269D97D38, a1);
}

uint64_t sub_253E5E768(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257AB8);
}

uint64_t static Logging.span.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257AD0, MEMORY[0x263F90268], (uint64_t)qword_26B257AB8, a1);
}

uint64_t sub_253E5E7B8(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97D50);
}

uint64_t static Logging.llmBridge.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97360, MEMORY[0x263F90268], (uint64_t)qword_269D97D50, a1);
}

uint64_t sub_253E5E814(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97D68);
}

uint64_t static Logging.planResolution.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97368, MEMORY[0x263F90268], (uint64_t)qword_269D97D68, a1);
}

uint64_t sub_253E5E878(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97D80);
}

uint64_t static Logging.jointResolver.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97370, MEMORY[0x263F90268], (uint64_t)qword_269D97D80, a1);
}

uint64_t sub_253E5E8DC(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97D98);
}

uint64_t static Logging.interpreter.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97378, MEMORY[0x263F90268], (uint64_t)qword_269D97D98, a1);
}

uint64_t sub_253E5E93C(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97DB0);
}

uint64_t static Logging.interactionStore.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97380, MEMORY[0x263F90268], (uint64_t)qword_269D97DB0, a1);
}

uint64_t sub_253E5E998(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97DC8);
}

uint64_t static Logging.transcript.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97388, MEMORY[0x263F90268], (uint64_t)qword_269D97DC8, a1);
}

uint64_t sub_253E5E9F4(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257A58);
}

uint64_t static Logging.persistence.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257A70, MEMORY[0x263F90268], (uint64_t)qword_26B257A58, a1);
}

uint64_t sub_253E5EA54(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257B58);
}

uint64_t static Logging.executor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257B70, MEMORY[0x263F90268], (uint64_t)qword_26B257B58, a1);
}

uint64_t sub_253E5EAAC(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97DE0);
}

uint64_t static Logging.canGen.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97390, MEMORY[0x263F90268], (uint64_t)qword_269D97DE0, a1);
}

uint64_t sub_253E5EB08(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97DF8);
}

uint64_t static Logging.previewTool.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D97398, MEMORY[0x263F90268], (uint64_t)qword_269D97DF8, a1);
}

uint64_t sub_253E5EB68(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97E10);
}

uint64_t static Logging.feedbackDataCollector.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973A0, MEMORY[0x263F90268], (uint64_t)qword_269D97E10, a1);
}

uint64_t sub_253E5EBC4(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97E28);
}

uint64_t static Logging.models.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973A8, MEMORY[0x263F90268], (uint64_t)qword_269D97E28, a1);
}

uint64_t sub_253E5EC18(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97E40);
}

uint64_t static Logging.replayer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973B0, MEMORY[0x263F90268], (uint64_t)qword_269D97E40, a1);
}

uint64_t sub_253E5EC70(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_26B257AD8);
}

uint64_t static Logging.assets.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257AF0, MEMORY[0x263F90268], (uint64_t)qword_26B257AD8, a1);
}

uint64_t sub_253E5ECC4(uint64_t a1)
{
  return sub_253E5ECEC(a1, qword_269D97E58);
}

uint64_t sub_253E5ECEC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_253E821C0();
  sub_253E60004(v3, a2);
  sub_253E5DBD0(v3, (uint64_t)a2);
  return sub_253E821B0();
}

uint64_t static Logging.quoteChecker.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973B8, MEMORY[0x263F90268], (uint64_t)qword_269D97E58, a1);
}

uint64_t sub_253E5ED9C(uint64_t a1)
{
  return sub_253E5F340(a1, qword_26B2579B8, &qword_26B257AD0, (uint64_t)qword_26B257AB8);
}

uint64_t static Signposting.span.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B2579D0, MEMORY[0x263F90228], (uint64_t)qword_26B2579B8, a1);
}

uint64_t sub_253E5EE00(uint64_t a1)
{
  return sub_253E5F340(a1, qword_26B2579F8, &qword_26B257B50, (uint64_t)qword_26B257B38);
}

uint64_t static Signposting.session.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257A10, MEMORY[0x263F90228], (uint64_t)qword_26B2579F8, a1);
}

uint64_t sub_253E5EE64(uint64_t a1)
{
  return sub_253E5F340(a1, qword_269D97E70, &qword_269D973A8, (uint64_t)qword_269D97E28);
}

uint64_t static Signposting.models.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973C0, MEMORY[0x263F90228], (uint64_t)qword_269D97E70, a1);
}

uint64_t sub_253E5EEC8(uint64_t a1)
{
  return sub_253E5F340(a1, qword_26B257C08, &qword_26B257BB8, (uint64_t)qword_26B257BD0);
}

uint64_t static Signposting.queryDecoration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257C00, MEMORY[0x263F90228], (uint64_t)qword_26B257C08, a1);
}

uint64_t sub_253E5EF2C(uint64_t a1)
{
  return sub_253E5F340(a1, qword_269D97E88, &qword_269D97300, (uint64_t)qword_269D97C30);
}

uint64_t static Signposting.plannerHTTPClient.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973C8, MEMORY[0x263F90228], (uint64_t)qword_269D97E88, a1);
}

uint64_t sub_253E5EF90(uint64_t a1)
{
  return sub_253E5F340(a1, qword_269D97EA0, &qword_269D97308, (uint64_t)qword_269D97C48);
}

uint64_t static Signposting.queryDecorationRanker.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973D0, MEMORY[0x263F90228], (uint64_t)qword_269D97EA0, a1);
}

uint64_t sub_253E5EFF4(uint64_t a1)
{
  return sub_253E5F340(a1, qword_269D97EB8, &qword_269D972E0, (uint64_t)qword_269D97BD0);
}

uint64_t static Signposting.toolRetriever.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973D8, MEMORY[0x263F90228], (uint64_t)qword_269D97EB8, a1);
}

uint64_t sub_253E5F058(uint64_t a1)
{
  return sub_253E5F340(a1, qword_269D97ED0, &qword_26B257710, (uint64_t)qword_26B2577F0);
}

uint64_t static Signposting.contextRetrieval.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973E0, MEMORY[0x263F90228], (uint64_t)qword_269D97ED0, a1);
}

uint64_t sub_253E5F0BC(uint64_t a1)
{
  return sub_253E5F340(a1, qword_26B2578D0, &qword_26B257718, (uint64_t)qword_26B257808);
}

uint64_t static Signposting.context.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B2578E8, MEMORY[0x263F90228], (uint64_t)qword_26B2578D0, a1);
}

uint64_t sub_253E5F120(uint64_t a1)
{
  return sub_253E5F340(a1, qword_269D97EE8, &qword_26B257AB0, (uint64_t)qword_26B257A98);
}

uint64_t static Signposting.responseGeneration.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973E8, MEMORY[0x263F90228], (uint64_t)qword_269D97EE8, a1);
}

uint64_t sub_253E5F184(uint64_t a1)
{
  return sub_253E5F340(a1, qword_269D97F00, &qword_269D972F8, (uint64_t)qword_269D97C18);
}

uint64_t static Signposting.fullPlanner.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973F0, MEMORY[0x263F90228], (uint64_t)qword_269D97F00, a1);
}

uint64_t sub_253E5F1E8(uint64_t a1)
{
  return sub_253E5F340(a1, qword_26B2579D8, &qword_26B257B30, (uint64_t)qword_26B257B18);
}

uint64_t static Signposting.planner.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B2579F0, MEMORY[0x263F90228], (uint64_t)qword_26B2579D8, a1);
}

uint64_t sub_253E5F24C(uint64_t a1)
{
  return sub_253E5F340(a1, qword_269D97F18, &qword_269D97368, (uint64_t)qword_269D97D68);
}

uint64_t static Signposting.planResolution.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_269D973F8, MEMORY[0x263F90228], (uint64_t)qword_269D97F18, a1);
}

uint64_t sub_253E5F2B0(uint64_t a1)
{
  return sub_253E5F340(a1, qword_26B257A38, &qword_26B257B90, (uint64_t)qword_26B257B78);
}

uint64_t static Signposting.learning.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257A50, MEMORY[0x263F90228], (uint64_t)qword_26B257A38, a1);
}

uint64_t sub_253E5F314(uint64_t a1)
{
  return sub_253E5F340(a1, qword_26B257A18, &qword_26B257B70, (uint64_t)qword_26B257B58);
}

uint64_t sub_253E5F340(uint64_t a1, uint64_t *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = sub_253E821C0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_253E82190();
  sub_253E60004(v11, a2);
  sub_253E5DBD0(v11, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_253E5DBD0(v7, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
  return sub_253E82180();
}

uint64_t static Signposting.executor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E5F4AC(&qword_26B257A30, MEMORY[0x263F90228], (uint64_t)qword_26B257A18, a1);
}

uint64_t sub_253E5F4AC@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_253E5DBD0(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

const char *static Signposting.SignpostNames.Models.ModelCacheModelLoad.getter()
{
  return "ModelCache.ModelLoad";
}

const char *static Signposting.enableTelemetry.getter()
{
  return "enableTelemetry=YES";
}

uint64_t Logger.rethrowAndLog<A>(consequence:_:)(uint64_t (*a1)(void), uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (v3)
  {
    swift_retain();
    id v6 = v3;
    swift_retain();
    id v7 = v3;
    uint64_t v8 = sub_253E821A0();
    os_log_type_t v9 = sub_253E82480();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v11 = (void *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v10 = 136315394;
      uint64_t v12 = a1();
      sub_253E5F7BC(v12, v13, &v17);
      sub_253E824B0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 12) = 2112;
      id v14 = v3;
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      sub_253E824B0();
      *uint64_t v11 = v16;
      MEMORY[0x25A271610](v3);
      MEMORY[0x25A271610](v3);
      _os_log_impl(&dword_253E37000, v8, v9, "%s error=%@", (uint8_t *)v10, 0x16u);
      sub_253E390C4(&qword_269D97F30);
      swift_arrayDestroy();
      MEMORY[0x25A271760](v11, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x25A271760](v15, -1, -1);
      MEMORY[0x25A271760](v10, -1, -1);
    }
    else
    {
      swift_release_n();

      MEMORY[0x25A271610](v3);
      MEMORY[0x25A271610](v3);
    }
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_253E5F7BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_253E5F890(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_253E5FFA4((uint64_t)v12, *a3);
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
      sub_253E5FFA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_253E393E4((uint64_t)v12);
  return v7;
}

uint64_t sub_253E5F890(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_253E5F9E8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_253E824C0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = sub_253E5FAC0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_253E82530();
    if (!v8)
    {
      uint64_t result = sub_253E82570();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_253E5F9E8(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_253E82590();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t sub_253E5FAC0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_253E5FB58(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_253E5FD34(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_253E5FD34((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_253E5FB58(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    uint64_t v2 = sub_253E82390();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = sub_253E5FCCC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_253E82500();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  sub_253E82590();
  __break(1u);
LABEL_14:
  uint64_t result = sub_253E82570();
  __break(1u);
  return result;
}

void *sub_253E5FCCC(uint64_t a1, uint64_t a2)
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
  sub_253E390C4(&qword_269D97F38);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_253E5FD34(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_253E390C4(&qword_269D97F38);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_253E5FEE4(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_253E5FE0C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_253E5FE0C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_253E82590();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_253E5FEE4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_253E82590();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void type metadata accessor for Logging()
{
}

void type metadata accessor for Signposting()
{
}

void type metadata accessor for Signposting.SignpostNames()
{
}

void type metadata accessor for Signposting.SignpostNames.Models()
{
}

uint64_t sub_253E5FFA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_253E60004(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_253E60068(uint64_t a1, uint64_t *a2)
{
  return sub_253E5ECEC(a1, a2);
}

BOOL static RetrievedTool.Stage.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RetrievedTool.Stage.hash(into:)()
{
  return sub_253E82810();
}

uint64_t sub_253E600B0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 6647407 && a2 == 0xE300000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 7305076 && a2 == 0xE300000000000000;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6565726874 && a2 == 0xE500000000000000;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 1920298854 && a2 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_253E82780();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_253E60230(char a1)
{
  uint64_t result = 6647407;
  switch(a1)
  {
    case 1:
      uint64_t result = 7305076;
      break;
    case 2:
      uint64_t result = 0x6565726874;
      break;
    case 3:
      uint64_t result = 1920298854;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E602A8()
{
  return sub_253E60230(*v0);
}

uint64_t sub_253E602B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E600B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E602D8(uint64_t a1)
{
  unint64_t v2 = sub_253E60804();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E60314(uint64_t a1)
{
  unint64_t v2 = sub_253E60804();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E60350(uint64_t a1)
{
  unint64_t v2 = sub_253E60850();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6038C(uint64_t a1)
{
  unint64_t v2 = sub_253E60850();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E603C8(uint64_t a1)
{
  unint64_t v2 = sub_253E60934();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E60404(uint64_t a1)
{
  unint64_t v2 = sub_253E60934();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E60440(uint64_t a1)
{
  unint64_t v2 = sub_253E6089C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6047C(uint64_t a1)
{
  unint64_t v2 = sub_253E6089C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E604B8(uint64_t a1)
{
  unint64_t v2 = sub_253E608E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E604F4(uint64_t a1)
{
  unint64_t v2 = sub_253E608E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void RetrievedTool.Stage.encode(to:)()
{
  sub_253E45CF0();
  uint64_t v3 = v2;
  sub_253E390C4(&qword_269D97F40);
  sub_253E3B950();
  MEMORY[0x270FA5388](v4);
  sub_253E5C3E4(v5, v18);
  sub_253E390C4(&qword_269D97F48);
  sub_253E3B950();
  MEMORY[0x270FA5388](v6);
  sub_253E7FBFC(v7, v19);
  sub_253E390C4(&qword_269D97F50);
  sub_253E3B950();
  MEMORY[0x270FA5388](v8);
  sub_253E80038(v9, v20);
  sub_253E390C4(&qword_269D97F58);
  sub_253E3B950();
  MEMORY[0x270FA5388](v10);
  sub_253E4AE88();
  uint64_t v11 = sub_253E390C4(&qword_269D97F60);
  sub_253E3B950();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  sub_253E4AEA0();
  uint64_t v15 = *v0;
  sub_253E39108(v3, v3[3]);
  sub_253E60804();
  sub_253E804A0();
  sub_253E82860();
  switch(v15)
  {
    case 1:
      sub_253E608E8();
      sub_253E7FED0();
      break;
    case 2:
      sub_253E6089C();
      sub_253E7FED0();
      break;
    case 3:
      sub_253E60850();
      sub_253E7FED0();
      break;
    default:
      sub_253E60934();
      sub_253E826A0();
      break;
  }
  sub_253E4AE7C();
  v17(v16);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v11);
  sub_253E45D2C();
}

unint64_t sub_253E60804()
{
  unint64_t result = qword_269D97F68;
  if (!qword_269D97F68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97F68);
  }
  return result;
}

unint64_t sub_253E60850()
{
  unint64_t result = qword_269D97F70;
  if (!qword_269D97F70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97F70);
  }
  return result;
}

unint64_t sub_253E6089C()
{
  unint64_t result = qword_269D97F78;
  if (!qword_269D97F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97F78);
  }
  return result;
}

unint64_t sub_253E608E8()
{
  unint64_t result = qword_269D97F80;
  if (!qword_269D97F80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97F80);
  }
  return result;
}

unint64_t sub_253E60934()
{
  unint64_t result = qword_269D97F88;
  if (!qword_269D97F88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D97F88);
  }
  return result;
}

void RetrievedTool.Stage.init(from:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  BOOL v31 = v3;
  sub_253E390C4(&qword_269D97F90);
  sub_253E3B950();
  MEMORY[0x270FA5388](v4);
  sub_253E5C0EC();
  sub_253E390C4(&qword_269D97F98);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E7FBFC(v6, v29);
  sub_253E390C4(&qword_269D97FA0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  sub_253E5C184();
  sub_253E390C4(&qword_269D97FA8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v8);
  sub_253E4AE88();
  uint64_t v9 = sub_253E390C4(&qword_269D97FB0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v10);
  sub_253E5C1FC();
  sub_253E803B0(v2);
  sub_253E60804();
  sub_253E82850();
  if (v0) {
    goto LABEL_7;
  }
  BOOL v32 = v2;
  uint64_t v11 = sub_253E82690();
  uint64_t v12 = *(void *)(v11 + 16);
  if (!v12
    || (uint64_t v30 = *(unsigned __int8 *)(v11 + 32),
        sub_253E4AD60(1, v12, v11, v11 + 32, 0, (2 * v12) | 1),
        uint64_t v14 = v13,
        unint64_t v16 = v15,
        swift_bridgeObjectRelease(),
        v14 != v16 >> 1))
  {
    sub_253E82520();
    sub_253E5C5FC();
    uint64_t v18 = v17;
    sub_253E390C4(&qword_269D976A0);
    *uint64_t v18 = &type metadata for RetrievedTool.Stage;
    sub_253E825D0();
    sub_253E7FDE4();
    sub_253E5C1BC();
    uint64_t v19 = sub_253E7FE5C();
    v20(v19);
    swift_willThrow();
    swift_unknownObjectRelease();
    uint64_t v21 = sub_253E801BC();
    v22(v21, v9);
    unint64_t v2 = v32;
LABEL_7:
    uint64_t v23 = (uint64_t)v2;
    goto LABEL_8;
  }
  switch(v30)
  {
    case 1:
      sub_253E608E8();
      sub_253E7FE40();
      goto LABEL_12;
    case 2:
      sub_253E6089C();
      sub_253E7FE40();
      goto LABEL_12;
    case 3:
      sub_253E60850();
      sub_253E7FE40();
      sub_253E7FD78();
      v26();
      swift_unknownObjectRelease();
      sub_253E7FA4C();
      v27();
      uint64_t v23 = (uint64_t)v32;
      uint64_t v28 = v31;
      goto LABEL_13;
    default:
      sub_253E60934();
      sub_253E7FE40();
LABEL_12:
      sub_253E7FFCC();
      sub_253E4AE7C();
      v24();
      swift_unknownObjectRelease();
      sub_253E7FA4C();
      v25();
      uint64_t v23 = (uint64_t)v32;
      uint64_t v28 = v31;
LABEL_13:
      *uint64_t v28 = v30;
      break;
  }
LABEL_8:
  sub_253E393E4(v23);
  sub_253E45D2C();
}

void sub_253E60E6C()
{
}

void sub_253E60E84()
{
}

void RetrievedTool.Definition.toolDefinition.getter()
{
  sub_253E5C31C();
  uint64_t v4 = v3;
  uint64_t v5 = type metadata accessor for UIControlTool(0);
  sub_253E5C174();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_253E7FC50();
  type metadata accessor for RetrievedTool.Definition(v7);
  sub_253E5C174();
  MEMORY[0x270FA5388](v8);
  sub_253E7FC34();
  uint64_t v9 = sub_253E821E0();
  sub_253E3B950();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  sub_253E4AE88();
  sub_253E7626C();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_253E80260();
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v15, v16, v17, v9);
      goto LABEL_5;
    case 4u:
      sub_253E76018();
      sub_253E773A8(v1 + *(int *)(v5 + 28), v4, &qword_269D97FB8);
LABEL_5:
      sub_253E75DB8();
      break;
    default:
      uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
      v13(v2, v0, v9);
      uint64_t v14 = sub_253E80408();
      ((void (*)(uint64_t))v13)(v14);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v4, 0, 1, v9);
      break;
  }
  sub_253E5C2D8();
}

void RetrievedTool.Definition.hash(into:)()
{
  sub_253E5C31C();
  uint64_t v0 = type metadata accessor for UIControlTool(0);
  uint64_t v1 = sub_253E5C41C(v0);
  MEMORY[0x270FA5388](v1);
  sub_253E7FC50();
  sub_253E822C0();
  sub_253E3B950();
  MEMORY[0x270FA5388](v2);
  sub_253E7FC18();
  sub_253E821E0();
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  uint64_t v4 = sub_253E7FC34();
  type metadata accessor for RetrievedTool.Definition(v4);
  sub_253E5C174();
  MEMORY[0x270FA5388](v5);
  sub_253E45F88();
  sub_253E7626C();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_253E7FA04();
      v6();
      sub_253E82810();
      sub_253E75E08(&qword_269D97FC8, MEMORY[0x263F80C28]);
      sub_253E804AC();
      sub_253E822E0();
      sub_253E7FA4C();
      v7();
      break;
    case 4u:
      sub_253E76018();
      sub_253E82810();
      UIControlTool.hash(into:)();
      sub_253E75DB8();
      break;
    default:
      sub_253E7FA04();
      v8();
      sub_253E82810();
      sub_253E75E08(&qword_269D97FC0, MEMORY[0x263F7FED0]);
      sub_253E804AC();
      sub_253E822E0();
      sub_253E7FF78();
      sub_253E45CE4();
      v9();
      break;
  }
  sub_253E5C2D8();
}

void static RetrievedTool.Definition.== infix(_:_:)()
{
  sub_253E5C31C();
  uint64_t v48 = v3;
  uint64_t v49 = v4;
  uint64_t v5 = type metadata accessor for UIControlTool(0);
  uint64_t v6 = sub_253E5C41C(v5);
  MEMORY[0x270FA5388](v6);
  sub_253E7FBFC(v7, v43[0]);
  sub_253E822C0();
  sub_253E3B950();
  uint64_t v44 = v9;
  uint64_t v45 = v8;
  MEMORY[0x270FA5388](v8);
  sub_253E7FBE0(v10, v43[0]);
  sub_253E821E0();
  sub_253E3B950();
  uint64_t v46 = v11;
  uint64_t v47 = v12;
  MEMORY[0x270FA5388](v11);
  sub_253E804F8();
  v43[1] = v13;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  v43[0] = (uint64_t)v43 - v16;
  MEMORY[0x270FA5388](v15);
  type metadata accessor for RetrievedTool.Definition(0);
  sub_253E5C174();
  MEMORY[0x270FA5388](v17);
  sub_253E80238();
  MEMORY[0x270FA5388](v18);
  sub_253E7FF34();
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  unint64_t v22 = (char *)v43 - v21;
  MEMORY[0x270FA5388](v20);
  sub_253E801E4();
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)v43 - v24;
  uint64_t v26 = sub_253E390C4(&qword_269D97FD0);
  uint64_t v27 = sub_253E5C41C(v26);
  MEMORY[0x270FA5388](v27);
  sub_253E80000();
  sub_253E7626C();
  sub_253E7626C();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_253E7FFC0();
      sub_253E7626C();
      if (sub_253E8017C() == 1)
      {
        uint64_t v31 = v44;
        uint64_t v30 = v45;
        uint64_t v32 = v43[2];
        sub_253E7FA04();
        v33();
        sub_253E822B0();
        uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
        v34(v32, v30);
        v34(v1, v30);
        goto LABEL_20;
      }
      uint64_t v29 = sub_253E5C4D0();
      goto LABEL_16;
    case 2u:
      sub_253E7626C();
      if (sub_253E8017C() == 2) {
        goto LABEL_9;
      }
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
      uint64_t v29 = (uint64_t)v22;
      goto LABEL_15;
    case 3u:
      sub_253E80408();
      sub_253E7626C();
      if (sub_253E8017C() == 3)
      {
LABEL_9:
        uint64_t v35 = v47;
        sub_253E7FA04();
        v36();
        sub_253E821D0();
        uint64_t v37 = *(void (**)(void))(v35 + 8);
        sub_253E80194();
        v37();
        sub_253E80194();
        v37();
        goto LABEL_20;
      }
      uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
      uint64_t v29 = v2;
      goto LABEL_15;
    case 4u:
      sub_253E7626C();
      if (sub_253E8017C() == 4)
      {
        sub_253E76018();
        static UIControlTool.== infix(_:_:)();
        sub_253E75DB8();
        sub_253E7FDCC();
        sub_253E75DB8();
        goto LABEL_20;
      }
      sub_253E75DB8();
      goto LABEL_17;
    default:
      sub_253E7626C();
      if (sub_253E8017C())
      {
        uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
        uint64_t v29 = (uint64_t)v25;
LABEL_15:
        uint64_t v38 = v46;
LABEL_16:
        v28(v29, v38);
LABEL_17:
        sub_253E4CA94(v0, &qword_269D97FD0);
      }
      else
      {
        uint64_t v40 = v46;
        uint64_t v39 = v47;
        sub_253E7FA04();
        v41();
        sub_253E821D0();
        long long v42 = *(void (**)(void))(v39 + 8);
        sub_253E7FD78();
        v42();
        ((void (*)(char *, uint64_t))v42)(v25, v40);
LABEL_20:
        sub_253E75DB8();
      }
      sub_253E5C2D8();
      return;
  }
}

void static UIControlTool.== infix(_:_:)()
{
  sub_253E5C31C();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = sub_253E821E0();
  sub_253E3B950();
  uint64_t v8 = v7;
  MEMORY[0x270FA5388](v9);
  sub_253E80220();
  uint64_t v10 = sub_253E390C4(&qword_269D97FD8);
  sub_253E5C174();
  MEMORY[0x270FA5388](v11);
  sub_253E7FADC();
  uint64_t v12 = sub_253E390C4(&qword_269D97FB8);
  uint64_t v13 = sub_253E5C41C(v12);
  MEMORY[0x270FA5388](v13);
  sub_253E7FE84();
  MEMORY[0x270FA5388](v14);
  sub_253E7FF34();
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v35 - v16;
  BOOL v18 = *v5 == *v3 && v5[1] == v3[1];
  if (v18 || (sub_253E82780(), sub_253E3B96C(), (v19 & 1) != 0))
  {
    BOOL v20 = v5[2] == v3[2] && v5[3] == v3[3];
    if (v20 || (sub_253E82780(), sub_253E3B96C(), (v21 & 1) != 0))
    {
      BOOL v22 = v5[4] == v3[4] && v5[5] == v3[5];
      if (v22 || (sub_253E82780(), sub_253E3B96C(), (v23 & 1) != 0))
      {
        uint64_t v36 = v8;
        uint64_t v24 = type metadata accessor for UIControlTool(0);
        sub_253E773A8((uint64_t)v5 + *(int *)(v24 + 28), (uint64_t)v17, &qword_269D97FB8);
        sub_253E773A8((uint64_t)v3 + *(int *)(v24 + 28), v1, &qword_269D97FB8);
        uint64_t v25 = v0 + *(int *)(v10 + 48);
        sub_253E773A8((uint64_t)v17, v0, &qword_269D97FB8);
        sub_253E773A8(v1, v25, &qword_269D97FB8);
        sub_253E80518(v0);
        if (!v18)
        {
          uint64_t v26 = sub_253E80414();
          sub_253E773A8(v26, v27, v28);
          sub_253E80518(v25);
          if (!v29)
          {
            uint64_t v32 = v36;
            sub_253E7FA04();
            v33();
            sub_253E75E08(&qword_269D97FE0, MEMORY[0x263F7FED0]);
            sub_253E822F0();
            uint64_t v34 = *(void (**)(void))(v32 + 8);
            sub_253E7F9F8();
            v34();
            sub_253E4CA94(v1, &qword_269D97FB8);
            sub_253E4CA94((uint64_t)v17, &qword_269D97FB8);
            sub_253E7F9F8();
            v34();
            sub_253E4CA94(v0, &qword_269D97FB8);
            goto LABEL_25;
          }
          sub_253E4CA94(v1, &qword_269D97FB8);
          sub_253E4CA94((uint64_t)v17, &qword_269D97FB8);
          uint64_t v30 = sub_253E7FFCC();
          v31(v30, v6);
LABEL_24:
          sub_253E4CA94(v0, &qword_269D97FD8);
          goto LABEL_25;
        }
        sub_253E4CA94(v1, &qword_269D97FB8);
        sub_253E4CA94((uint64_t)v17, &qword_269D97FB8);
        sub_253E80518(v25);
        if (!v18) {
          goto LABEL_24;
        }
        sub_253E4CA94(v0, &qword_269D97FB8);
      }
    }
  }
LABEL_25:
  sub_253E5C2D8();
}

uint64_t sub_253E61CE4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E656D656C706D69 && a2 == 0xEE006E6F69746174;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6E61747369737361 && a2 == 0xEF616D6568635374;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x6553797469746E65 && a2 == 0xEC00000072657474;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6341746E65696C63 && a2 == 0xEC0000006E6F6974;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x6F72746E6F436975 && a2 == 0xE90000000000006CLL)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v10 = sub_253E82780();
          swift_bridgeObjectRelease();
          if (v10) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

uint64_t sub_253E61F78()
{
  return 5;
}

uint64_t sub_253E61F80(char a1)
{
  uint64_t result = 0x6E656D656C706D69;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6E61747369737361;
      break;
    case 2:
      uint64_t result = 0x6553797469746E65;
      break;
    case 3:
      uint64_t result = 0x6341746E65696C63;
      break;
    case 4:
      uint64_t result = 0x6F72746E6F436975;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E6205C()
{
  return sub_253E51EF8();
}

uint64_t sub_253E62074(uint64_t a1)
{
  unint64_t v2 = sub_253E75F80();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E620B0(uint64_t a1)
{
  unint64_t v2 = sub_253E75F80();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E620EC(uint64_t a1)
{
  unint64_t v2 = sub_253E75EE8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E62128(uint64_t a1)
{
  unint64_t v2 = sub_253E75EE8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E62164()
{
  return sub_253E61F80(*v0);
}

uint64_t sub_253E6216C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E61CE4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E62194@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E61F78();
  *a1 = result;
  return result;
}

uint64_t sub_253E621BC(uint64_t a1)
{
  unint64_t v2 = sub_253E75E50();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E621F8(uint64_t a1)
{
  unint64_t v2 = sub_253E75E50();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E62234(uint64_t a1)
{
  unint64_t v2 = sub_253E75F34();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E62270(uint64_t a1)
{
  unint64_t v2 = sub_253E75F34();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E622AC(uint64_t a1)
{
  unint64_t v2 = sub_253E75FCC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E622E8(uint64_t a1)
{
  unint64_t v2 = sub_253E75FCC();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E62324(uint64_t a1)
{
  unint64_t v2 = sub_253E75E9C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E62360(uint64_t a1)
{
  unint64_t v2 = sub_253E75E9C();

  return MEMORY[0x270FA00B8](a1, v2);
}

void RetrievedTool.Definition.encode(to:)()
{
  sub_253E45CF0();
  uint64_t v58 = v1;
  uint64_t v60 = v0;
  uint64_t v4 = v3;
  sub_253E390C4(&qword_269D97FE8);
  sub_253E3B950();
  v53[18] = v6;
  v53[19] = v5;
  MEMORY[0x270FA5388](v5);
  v53[17] = (uint64_t)v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_253E7FF28();
  v53[14] = type metadata accessor for UIControlTool(v8);
  sub_253E5C174();
  MEMORY[0x270FA5388](v9);
  sub_253E8001C(v10, v53[0]);
  v53[15] = sub_253E390C4(&qword_269D97FF0);
  sub_253E3B950();
  v53[13] = v11;
  MEMORY[0x270FA5388](v12);
  sub_253E5C0EC();
  v53[12] = v13;
  sub_253E390C4(&qword_269D97FF8);
  sub_253E3B950();
  v53[10] = v15;
  v53[11] = v14;
  MEMORY[0x270FA5388](v14);
  sub_253E5C0EC();
  v53[9] = v16;
  sub_253E390C4(&qword_269D98000);
  sub_253E3B950();
  v53[7] = v18;
  v53[8] = v17;
  MEMORY[0x270FA5388](v17);
  sub_253E5C0EC();
  v53[4] = v19;
  sub_253E7FF28();
  v53[6] = sub_253E822C0();
  sub_253E3B950();
  v53[5] = v20;
  MEMORY[0x270FA5388](v21);
  sub_253E5C0EC();
  v53[3] = v22;
  v53[2] = sub_253E390C4(&qword_269D98008);
  sub_253E3B950();
  v53[1] = v23;
  MEMORY[0x270FA5388](v24);
  sub_253E5C0EC();
  v53[0] = v25;
  sub_253E7FF28();
  sub_253E821E0();
  sub_253E3B950();
  uint64_t v54 = v26;
  uint64_t v55 = v27;
  MEMORY[0x270FA5388](v26);
  sub_253E80238();
  uint64_t v30 = v28 - v29;
  uint64_t v32 = MEMORY[0x270FA5388](v31);
  uint64_t v34 = (char *)v53 - v33;
  MEMORY[0x270FA5388](v32);
  type metadata accessor for RetrievedTool.Definition(0);
  sub_253E5C174();
  MEMORY[0x270FA5388](v35);
  sub_253E4AE88();
  uint64_t v57 = sub_253E390C4(&qword_269D98010);
  sub_253E3B950();
  uint64_t v59 = v36;
  MEMORY[0x270FA5388](v37);
  sub_253E45F88();
  sub_253E803B0(v4);
  sub_253E75E50();
  uint64_t v56 = v2;
  sub_253E802EC();
  sub_253E82860();
  sub_253E7626C();
  sub_253E801B0();
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_253E7FA04();
      v40();
      sub_253E75F80();
      sub_253E7FC6C();
      sub_253E75E08(&qword_269D98050, MEMORY[0x263F80C28]);
      sub_253E800D4();
      sub_253E4AE7C();
      v41();
      goto LABEL_4;
    case 2u:
      uint64_t v43 = v55;
      uint64_t v44 = v54;
      sub_253E7FA04();
      v45();
      sub_253E75F34();
      sub_253E7FC6C();
      sub_253E75E08(&qword_269D98038, MEMORY[0x263F7FED0]);
      sub_253E800D4();
      sub_253E4AE7C();
      v46();
      (*(void (**)(char *, uint64_t))(v43 + 8))(v34, v44);
      goto LABEL_7;
    case 3u:
      uint64_t v47 = v55;
      uint64_t v48 = v54;
      sub_253E7FA04();
      v49();
      sub_253E75EE8();
      sub_253E7FC6C();
      sub_253E75E08(&qword_269D98038, MEMORY[0x263F7FED0]);
      sub_253E800D4();
      sub_253E4AE7C();
      v50();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v30, v48);
      goto LABEL_7;
    case 4u:
      sub_253E76018();
      sub_253E75E9C();
      sub_253E826A0();
      sub_253E75E08(&qword_269D98028, (void (*)(uint64_t))type metadata accessor for UIControlTool);
      sub_253E82750();
      sub_253E801B0();
      sub_253E4AE7C();
      v51();
      sub_253E75DB8();
      sub_253E7FFCC();
      goto LABEL_9;
    default:
      sub_253E7FA04();
      v38();
      sub_253E75FCC();
      sub_253E7FC6C();
      sub_253E75E08(&qword_269D98038, MEMORY[0x263F7FED0]);
      sub_253E82750();
      sub_253E4AE7C();
      v39();
      sub_253E802A4();
LABEL_4:
      sub_253E7FDD8();
      v42();
LABEL_7:
      sub_253E5C4D0();
LABEL_9:
      sub_253E4AE7C();
      v52();
      sub_253E45D2C();
      return;
  }
}

uint64_t RetrievedTool.Definition.hashValue.getter()
{
  return sub_253E6E740((void (*)(unsigned char *))RetrievedTool.Definition.hash(into:));
}

void RetrievedTool.Definition.init(from:)()
{
  sub_253E45CF0();
  uint64_t v73 = v1;
  uint64_t v6 = v5;
  v68[16] = v7;
  sub_253E390C4(&qword_269D98060);
  sub_253E3B950();
  v68[14] = v8;
  v68[15] = v9;
  MEMORY[0x270FA5388](v8);
  sub_253E5C3E4(v10, v68[0]);
  sub_253E390C4(&qword_269D98068);
  sub_253E3B950();
  v68[12] = v12;
  v68[13] = v11;
  MEMORY[0x270FA5388](v11);
  sub_253E7FBE0(v13, v68[0]);
  sub_253E390C4(&qword_269D98070);
  sub_253E3B950();
  v68[10] = v15;
  v68[11] = v14;
  MEMORY[0x270FA5388](v14);
  sub_253E5C3C8(v16, v68[0]);
  v68[9] = sub_253E390C4(&qword_269D98078);
  sub_253E3B950();
  v68[5] = v17;
  MEMORY[0x270FA5388](v18);
  sub_253E80038(v19, v68[0]);
  sub_253E390C4(&qword_269D98080);
  sub_253E3B950();
  v68[7] = v21;
  v68[8] = v20;
  MEMORY[0x270FA5388](v20);
  v68[17] = (uint64_t)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_253E390C4(&qword_269D98088);
  sub_253E3B950();
  uint64_t v70 = v24;
  uint64_t v71 = v23;
  MEMORY[0x270FA5388](v23);
  sub_253E7FADC();
  uint64_t v69 = type metadata accessor for RetrievedTool.Definition(0);
  sub_253E5C174();
  MEMORY[0x270FA5388](v25);
  sub_253E804F8();
  v68[6] = v26;
  MEMORY[0x270FA5388](v27);
  sub_253E801E4();
  MEMORY[0x270FA5388](v28);
  sub_253E7FE84();
  MEMORY[0x270FA5388](v29);
  sub_253E7FF34();
  uint64_t v31 = MEMORY[0x270FA5388](v30);
  uint64_t v33 = (char *)v68 - v32;
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)v68 - v34;
  uint64_t v72 = v6;
  sub_253E7F9A8();
  sub_253E75E50();
  uint64_t v36 = v73;
  sub_253E82850();
  if (v36) {
    goto LABEL_11;
  }
  v68[0] = v4;
  v68[1] = v2;
  v68[2] = (uint64_t)v33;
  v68[3] = v3;
  v68[4] = (uint64_t)v35;
  uint64_t v37 = v71;
  uint64_t v38 = sub_253E82690();
  uint64_t v39 = *(void *)(v38 + 16);
  if (!v39
    || (uint64_t v73 = v0,
        uint64_t v40 = *(unsigned __int8 *)(v38 + 32),
        sub_253E4AD60(1, v39, v38, v38 + 32, 0, (2 * v39) | 1),
        uint64_t v42 = v41,
        unint64_t v44 = v43,
        swift_bridgeObjectRelease(),
        v42 != v44 >> 1))
  {
    uint64_t v45 = v69;
    sub_253E82520();
    sub_253E5C5FC();
    uint64_t v47 = v46;
    sub_253E390C4(&qword_269D976A0);
    *uint64_t v47 = v45;
    sub_253E825D0();
    sub_253E7FDE4();
    sub_253E5C1BC();
    uint64_t v48 = sub_253E7FE5C();
    v49(v48);
    swift_willThrow();
    swift_unknownObjectRelease();
    uint64_t v50 = sub_253E801BC();
    v51(v50, v37);
LABEL_11:
    uint64_t v52 = v72;
    goto LABEL_12;
  }
  switch(v40)
  {
    case 1:
      sub_253E75F80();
      sub_253E7FA28();
      sub_253E822C0();
      sub_253E75E08(&qword_269D980A0, MEMORY[0x263F80C28]);
      sub_253E7FF48();
      sub_253E7FCB8();
      sub_253E4AE7C();
      v65();
      swift_unknownObjectRelease();
      sub_253E4AE7C();
      v66();
      sub_253E801A4();
      break;
    case 2:
      sub_253E75F34();
      sub_253E7FA28();
      sub_253E821E0();
      sub_253E75E08(&qword_269D98098, MEMORY[0x263F7FED0]);
      sub_253E7FF48();
      sub_253E7FCB8();
      sub_253E80538();
      sub_253E4AE7C();
      v56();
      swift_unknownObjectRelease();
      uint64_t v57 = sub_253E7FA10();
      v58(v57);
      sub_253E801A4();
      break;
    case 3:
      sub_253E75EE8();
      sub_253E7FA28();
      sub_253E821E0();
      sub_253E75E08(&qword_269D98098, MEMORY[0x263F7FED0]);
      sub_253E7FF48();
      sub_253E7FCB8();
      sub_253E80538();
      sub_253E4AE7C();
      v59();
      swift_unknownObjectRelease();
      uint64_t v60 = sub_253E7FA10();
      v61(v60);
      sub_253E801A4();
      break;
    case 4:
      sub_253E75E9C();
      sub_253E7FA28();
      type metadata accessor for UIControlTool(0);
      sub_253E75E08(&qword_269D98090, (void (*)(uint64_t))type metadata accessor for UIControlTool);
      sub_253E82680();
      sub_253E80538();
      sub_253E4AE7C();
      v62();
      swift_unknownObjectRelease();
      uint64_t v63 = sub_253E7FA10();
      v64(v63);
      sub_253E801A4();
      break;
    default:
      sub_253E75FCC();
      sub_253E7FA28();
      sub_253E821E0();
      sub_253E75E08(&qword_269D98098, MEMORY[0x263F7FED0]);
      sub_253E7FF48();
      sub_253E7FCB8();
      sub_253E80538();
      sub_253E4AE7C();
      v53();
      swift_unknownObjectRelease();
      uint64_t v54 = sub_253E7FA10();
      v55(v54);
      sub_253E801A4();
      break;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v67 = v72;
  sub_253E76018();
  sub_253E76018();
  uint64_t v52 = v67;
LABEL_12:
  sub_253E393E4(v52);
  sub_253E8050C();
  sub_253E45D2C();
}

uint64_t sub_253E634C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_253E6EDE4(a1, a2, a3, (void (*)(unsigned char *))RetrievedTool.Definition.hash(into:));
}

void sub_253E634E0()
{
}

void sub_253E634F8()
{
}

uint64_t RetrievedTool.definition.getter()
{
  return sub_253E7626C();
}

uint64_t RetrievedTool.definition.setter(uint64_t a1)
{
  return sub_253E7606C(a1, v1);
}

uint64_t (*RetrievedTool.definition.modify())()
{
  return nullsub_1;
}

float RetrievedTool.similarityScore.getter()
{
  return *(float *)(v0 + *(int *)(type metadata accessor for RetrievedTool(0) + 20));
}

uint64_t RetrievedTool.similarityScore.setter(float a1)
{
  uint64_t result = type metadata accessor for RetrievedTool(0);
  *(float *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*RetrievedTool.similarityScore.modify())(void)
{
  return nullsub_1;
}

uint64_t RetrievedTool.sampleInvocations.getter()
{
  type metadata accessor for RetrievedTool(0);

  return swift_bridgeObjectRetain();
}

uint64_t RetrievedTool.sampleInvocations.setter()
{
  uint64_t v2 = *(int *)(sub_253E8032C() + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v2) = v0;
  return result;
}

uint64_t (*RetrievedTool.sampleInvocations.modify())(void)
{
  return nullsub_1;
}

uint64_t RetrievedTool.stage.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for RetrievedTool(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 28));
  return result;
}

uint64_t RetrievedTool.stage.setter(char *a1)
{
  char v2 = *a1;
  uint64_t result = type metadata accessor for RetrievedTool(0);
  *(unsigned char *)(v1 + *(int *)(result + 28)) = v2;
  return result;
}

uint64_t (*RetrievedTool.stage.modify())(void)
{
  return nullsub_1;
}

int *RetrievedTool.init(definition:similarityScore:sampleInvocations:stage:)@<X0>(uint64_t a1@<X1>, char *a2@<X2>, uint64_t a3@<X8>, float a4@<S0>)
{
  char v7 = *a2;
  sub_253E76018();
  uint64_t result = (int *)type metadata accessor for RetrievedTool(0);
  *(float *)(a3 + result[5]) = a4;
  *(void *)(a3 + result[6]) = a1;
  *(unsigned char *)(a3 + result[7]) = v7;
  return result;
}

BOOL static RetrievedTool.== infix(_:_:)()
{
  sub_253E80144();
  static RetrievedTool.Definition.== infix(_:_:)();
  if ((v2 & 1) != 0
    && (uint64_t v3 = type metadata accessor for RetrievedTool(0),
        *(float *)(v1 + *(int *)(v3 + 20)) == *(float *)(v0 + *(int *)(v3 + 20)))
    && (uint64_t v4 = v3, (sub_253E3A53C(*(void *)(v1 + *(int *)(v3 + 24)), *(void *)(v0 + *(int *)(v3 + 24))) & 1) != 0))
  {
    return *(unsigned __int8 *)(v1 + *(int *)(v4 + 28)) == *(unsigned __int8 *)(v0 + *(int *)(v4 + 28));
  }
  else
  {
    return 0;
  }
}

uint64_t RetrievedTool.hash(into:)()
{
  RetrievedTool.Definition.hash(into:)();
  type metadata accessor for RetrievedTool(0);
  sub_253E82830();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_253E7FDCC();
  sub_253E75CF4(v0, v1);
  swift_bridgeObjectRelease();
  return sub_253E82810();
}

uint64_t sub_253E638D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6974696E69666564 && a2 == 0xEA00000000006E6FLL;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6972616C696D6973 && a2 == 0xEF65726F63537974;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000011 && a2 == 0x8000000253E841B0 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6567617473 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      char v8 = sub_253E82780();
      swift_bridgeObjectRelease();
      if (v8) {
        return 3;
      }
      else {
        return 4;
      }
    }
  }
}

unint64_t sub_253E63AA4(char a1)
{
  unint64_t result = 0x6974696E69666564;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6972616C696D6973;
      break;
    case 2:
      unint64_t result = 0xD000000000000011;
      break;
    case 3:
      unint64_t result = 0x6567617473;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E63B48()
{
  return sub_253E63AA4(*v0);
}

uint64_t sub_253E63B50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E638D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E63B78(uint64_t a1)
{
  unint64_t v2 = sub_253E760F0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E63BB4(uint64_t a1)
{
  unint64_t v2 = sub_253E760F0();

  return MEMORY[0x270FA00B8](a1, v2);
}

void RetrievedTool.encode(to:)()
{
  sub_253E803CC();
  sub_253E800C4();
  sub_253E390C4(&qword_269D980A8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v1);
  sub_253E7F9A8();
  sub_253E760F0();
  sub_253E5C544();
  type metadata accessor for RetrievedTool.Definition(0);
  sub_253E75E08(&qword_269D980B8, (void (*)(uint64_t))type metadata accessor for RetrievedTool.Definition);
  sub_253E7FEFC();
  if (!v0)
  {
    type metadata accessor for RetrievedTool(0);
    sub_253E7FEC0();
    sub_253E82730();
    sub_253E390C4(&qword_269D980C0);
    sub_253E77490(&qword_269D980C8, &qword_269D980C0, (void (*)(void))sub_253E7613C);
    sub_253E80444();
    sub_253E7FF84();
    sub_253E76188();
    sub_253E7FF84();
  }
  uint64_t v2 = sub_253E5C288();
  v3(v2);
  sub_253E80344();
}

uint64_t RetrievedTool.hashValue.getter()
{
  return sub_253E6E740((void (*)(unsigned char *))RetrievedTool.hash(into:));
}

void RetrievedTool.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  sub_253E45CF0();
  uint64_t v14 = v13;
  type metadata accessor for RetrievedTool.Definition(0);
  sub_253E5C174();
  MEMORY[0x270FA5388](v15);
  sub_253E7FD60();
  sub_253E390C4(&qword_269D980E0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v16);
  uint64_t v17 = sub_253E80070();
  uint64_t v18 = (int *)type metadata accessor for RetrievedTool(v17);
  sub_253E5C174();
  MEMORY[0x270FA5388](v19);
  sub_253E45F88();
  sub_253E80544(v14);
  sub_253E760F0();
  sub_253E82850();
  if (v11)
  {
    sub_253E393E4((uint64_t)v14);
  }
  else
  {
    sub_253E75E08(&qword_269D980E8, (void (*)(uint64_t))type metadata accessor for RetrievedTool.Definition);
    sub_253E8012C();
    sub_253E76018();
    sub_253E7FEC0();
    sub_253E82660();
    *(_DWORD *)(v12 + v18[5]) = v20;
    sub_253E390C4(&qword_269D980C0);
    sub_253E7FEF0();
    sub_253E77490(&qword_269D980F0, &qword_269D980C0, (void (*)(void))sub_253E761D4);
    sub_253E8012C();
    *(void *)(v12 + v18[6]) = v23;
    sub_253E76220();
    sub_253E8012C();
    uint64_t v21 = sub_253E7FD20();
    v22(v21);
    *(unsigned char *)(v12 + v18[7]) = a11;
    sub_253E7626C();
    sub_253E393E4((uint64_t)v14);
    sub_253E75DB8();
  }
  sub_253E46150();
  sub_253E45D2C();
}

void sub_253E6413C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  RetrievedTool.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, vars8[4]);
}

void sub_253E64154()
{
}

uint64_t sub_253E64178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_253E6EDE4(a1, a2, a3, (void (*)(unsigned char *))RetrievedTool.hash(into:));
}

uint64_t UIControlTool.appBundleId.getter()
{
  return sub_253E39ECC();
}

uint64_t UIControlTool.appBundleId.setter()
{
  uint64_t result = sub_253E46000();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*UIControlTool.appBundleId.modify())()
{
  return nullsub_1;
}

uint64_t UIControlTool.command.getter()
{
  return sub_253E39ECC();
}

uint64_t UIControlTool.command.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*UIControlTool.command.modify())()
{
  return nullsub_1;
}

uint64_t UIControlTool.commandId.getter()
{
  return sub_253E39ECC();
}

uint64_t UIControlTool.commandId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*UIControlTool.commandId.modify())()
{
  return nullsub_1;
}

uint64_t UIControlTool.toolDef.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UIControlTool(0);
  return sub_253E773A8(v1 + *(int *)(v3 + 28), a1, &qword_269D97FB8);
}

uint64_t UIControlTool.toolDef.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for UIControlTool(0) + 28);

  return sub_253E762B8(a1, v3);
}

uint64_t (*UIControlTool.toolDef.modify())(void)
{
  return nullsub_1;
}

unint64_t UIControlTool.identifier.getter()
{
  return 0xD000000000000030;
}

unint64_t static UIControlTool.toolName.getter()
{
  return 0xD000000000000030;
}

unint64_t static UIControlTool.toolId.getter()
{
  return 0xD000000000000013;
}

void UIControlTool.init(toolDef:appBundleId:command:commandId:)()
{
  sub_253E5C31C();
  uint64_t v8 = sub_253E7FB2C();
  sub_253E80260();
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v9, v10, v11, v8);
  sub_253E4CA94(v7, &qword_269D97FB8);
  sub_253E5C1BC();
  sub_253E7FE94();
  v12();
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v7, 0, 1, v8);
  *BOOL v6 = v5;
  v6[1] = v4;
  void v6[2] = v3;
  v6[3] = v2;
  v6[4] = v1;
  v6[5] = v0;
  sub_253E5C2D8();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_253E5C31C();
  sub_253E7FB2C();
  sub_253E80260();
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v9, v10, v11, v12);
  sub_253E762B8(v6, v8);
  *uint64_t v7 = v5;
  v7[1] = v4;
  v7[2] = v3;
  v7[3] = v2;
  v7[4] = v1;
  v7[5] = v0;
  sub_253E5C2D8();
}

uint64_t UIControlTool.init(appBundleId:command:commandId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v13 = (uint64_t)a7 + *(int *)(type metadata accessor for UIControlTool(0) + 28);
  sub_253E821E0();
  sub_253E80260();
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v14, v15, v16, v17);
  sub_253E82210();
  sub_253E82200();
  if (v7)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_253E4CA94(v13, &qword_269D97FB8);
  }
  else
  {
    static UIControlTool.toolName.getter();
    uint64_t v18 = sub_253E821F0();
    swift_bridgeObjectRelease();
    sub_253E4CA94(v13, &qword_269D97FB8);
    sub_253E64774(v18, MEMORY[0x263F7FED0], v13);
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *a7 = a1;
    a7[1] = a2;
    a7[2] = a3;
    a7[3] = a4;
    a7[4] = a5;
    a7[5] = a6;
  }
  return result;
}

uint64_t sub_253E6475C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_253E64774(a1, MEMORY[0x263F06EA8], a2);
}

uint64_t sub_253E64774@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = a2(0);
  if (v5)
  {
    sub_253E5C1BC();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v7 + 16))(a3, a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), v6);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(a3, v8, 1, v6);
}

void UIControlTool.hash(into:)()
{
  sub_253E5C31C();
  uint64_t v2 = sub_253E821E0();
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E80220();
  uint64_t v4 = sub_253E390C4(&qword_269D97FB8);
  uint64_t v5 = sub_253E5C41C(v4);
  MEMORY[0x270FA5388](v5);
  sub_253E5C184();
  swift_bridgeObjectRetain();
  sub_253E80160();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_253E80160();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_253E80160();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for UIControlTool(0);
  sub_253E773A8(v0 + *(int *)(v6 + 28), v1, &qword_269D97FB8);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v1, 1, v2) == 1)
  {
    sub_253E82820();
  }
  else
  {
    sub_253E7FA04();
    v7();
    sub_253E82820();
    sub_253E75E08(&qword_269D97FC0, MEMORY[0x263F7FED0]);
    sub_253E822E0();
    uint64_t v8 = sub_253E7FF78();
    v9(v8);
  }
  sub_253E5C2D8();
}

uint64_t sub_253E649D8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x49646E616D6D6F63 && a2 == 0xE900000000000064;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6665446C6F6F74 && a2 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        char v9 = sub_253E82780();
        swift_bridgeObjectRelease();
        if (v9) {
          return 3;
        }
        else {
          return 4;
        }
      }
    }
  }
}

uint64_t sub_253E64BAC(char a1)
{
  uint64_t result = 0x6C646E7542707061;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x646E616D6D6F63;
      break;
    case 2:
      uint64_t result = 0x49646E616D6D6F63;
      break;
    case 3:
      uint64_t result = 0x6665446C6F6F74;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E64C4C()
{
  return sub_253E64BAC(*v0);
}

uint64_t sub_253E64C54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E649D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E64C7C(uint64_t a1)
{
  unint64_t v2 = sub_253E76320();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E64CB8(uint64_t a1)
{
  unint64_t v2 = sub_253E76320();

  return MEMORY[0x270FA00B8](a1, v2);
}

void UIControlTool.encode(to:)()
{
  sub_253E803CC();
  sub_253E7FD38();
  sub_253E390C4(&qword_269D98108);
  sub_253E3B950();
  MEMORY[0x270FA5388](v1);
  sub_253E7F9A8();
  sub_253E76320();
  sub_253E5C544();
  sub_253E7FB14();
  if (!v0)
  {
    sub_253E7FB14();
    sub_253E7FEF0();
    sub_253E7FB14();
    type metadata accessor for UIControlTool(0);
    sub_253E821E0();
    sub_253E75E08(&qword_269D98038, MEMORY[0x263F7FED0]);
    sub_253E7FA58();
  }
  uint64_t v2 = sub_253E5C288();
  v3(v2);
  sub_253E80344();
}

uint64_t UIControlTool.hashValue.getter()
{
  return sub_253E6E740((void (*)(unsigned char *))UIControlTool.hash(into:));
}

void UIControlTool.init(from:)()
{
  sub_253E45CF0();
  uint64_t v3 = v2;
  uint64_t v4 = sub_253E390C4(&qword_269D97FB8);
  uint64_t v5 = sub_253E5C41C(v4);
  MEMORY[0x270FA5388](v5);
  sub_253E4AE88();
  sub_253E390C4(&qword_269D98118);
  sub_253E3B950();
  MEMORY[0x270FA5388](v6);
  sub_253E7FD60();
  uint64_t v7 = type metadata accessor for UIControlTool(0);
  uint64_t v8 = sub_253E5C41C(v7);
  MEMORY[0x270FA5388](v8);
  sub_253E5C184();
  uint64_t v10 = (uint64_t)v1 + *(int *)(v9 + 36);
  uint64_t v11 = sub_253E821E0();
  sub_253E80260();
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v12, v13, v14, v11);
  sub_253E7FEA0();
  sub_253E76320();
  sub_253E82850();
  if (v0)
  {
    sub_253E393E4(v3);
    sub_253E4CA94(v10, &qword_269D97FB8);
  }
  else
  {
    uint64_t *v1 = sub_253E82640();
    v1[1] = v15;
    sub_253E7FEC0();
    v1[2] = sub_253E82640();
    v1[3] = v16;
    sub_253E7FEF0();
    v1[4] = sub_253E82640();
    v1[5] = v17;
    sub_253E75E08(&qword_269D98098, MEMORY[0x263F7FED0]);
    sub_253E82620();
    uint64_t v18 = sub_253E7FAAC();
    v19(v18);
    sub_253E762B8(0, v10);
    sub_253E7626C();
    sub_253E393E4(v3);
    sub_253E75DB8();
  }
  sub_253E45D2C();
}

void sub_253E65198()
{
}

void sub_253E651B0()
{
}

uint64_t sub_253E651D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_253E6EDE4(a1, a2, a3, (void (*)(unsigned char *))UIControlTool.hash(into:));
}

uint64_t SampleInvocation.invocationString.getter()
{
  return sub_253E39ECC();
}

uint64_t SampleInvocation.invocationString.setter()
{
  uint64_t result = sub_253E46000();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*SampleInvocation.invocationString.modify())()
{
  return nullsub_1;
}

float SampleInvocation.score.getter()
{
  return *(float *)(v0 + 16);
}

void SampleInvocation.score.setter(float a1)
{
  *(float *)(v1 + 16) = a1;
}

uint64_t (*SampleInvocation.score.modify())()
{
  return nullsub_1;
}

IntelligenceFlowShared::SampleInvocation __swiftcall SampleInvocation.init(invocationString:score:)(Swift::String invocationString, Swift::Float score)
{
  *(Swift::String *)uint64_t v2 = invocationString;
  *(Swift::Float *)(v2 + 16) = score;
  result.invocationString = invocationString;
  result.Swift::Float score = score;
  return result;
}

uint64_t static SampleInvocation.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a1 + 16);
  float v3 = *(float *)(a2 + 16);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8)) {
    return v2 == v3;
  }
  sub_253E82780();
  uint64_t result = sub_253E3B96C();
  if (v6) {
    return v2 == v3;
  }
  return result;
}

uint64_t SampleInvocation.hash(into:)()
{
  return sub_253E82830();
}

uint64_t sub_253E65354(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000253E841D0 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_253E65438(char a1)
{
  if (a1) {
    return 0x65726F6373;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_253E65470()
{
  return sub_253E65438(*v0);
}

uint64_t sub_253E65478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E65354(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E654A0(uint64_t a1)
{
  unint64_t v2 = sub_253E7636C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E654DC(uint64_t a1)
{
  unint64_t v2 = sub_253E7636C();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SampleInvocation.encode(to:)()
{
  sub_253E7F994();
  unint64_t v2 = v1;
  sub_253E390C4(&qword_269D98120);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E45DFC();
  sub_253E39108(v2, v2[3]);
  sub_253E7636C();
  sub_253E82860();
  sub_253E82710();
  if (!v0) {
    sub_253E82730();
  }
  sub_253E802A4();
  sub_253E7FDD8();
  v4();
  sub_253E460A0();
  sub_253E7FA70();
}

uint64_t SampleInvocation.hashValue.getter()
{
  return sub_253E82840();
}

void SampleInvocation.init(from:)()
{
  sub_253E7F994();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_253E390C4(&qword_269D98130);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E7FEA0();
  sub_253E7636C();
  sub_253E804A0();
  sub_253E82850();
  if (v0)
  {
    sub_253E393E4(v2);
  }
  else
  {
    uint64_t v6 = sub_253E82640();
    uint64_t v8 = v7;
    swift_bridgeObjectRetain();
    sub_253E82660();
    int v10 = v9;
    sub_253E45CE4();
    v11();
    *(void *)uint64_t v4 = v6;
    *(void *)(v4 + 8) = v8;
    *(_DWORD *)(v4 + 16) = v10;
    sub_253E393E4(v2);
    swift_bridgeObjectRelease();
  }
  sub_253E46150();
  sub_253E7FA70();
}

void sub_253E65838()
{
}

void sub_253E65850()
{
}

uint64_t sub_253E65874()
{
  return sub_253E82840();
}

uint64_t sub_253E658E8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6374614D6E617073 && a2 == 0xEC000000676E6968;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000253E841F0 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    BOOL v6 = a1 == 0x727465526C6F6F74 && a2 == 0xED00006C61766569;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000014 && a2 == 0x8000000253E84210 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      BOOL v7 = a1 == 0x736552746E696F6ALL && a2 == 0xED00007265766C6FLL;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0xD000000000000016 && a2 == 0x8000000253E84230)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else
      {
        char v8 = sub_253E82780();
        swift_bridgeObjectRelease();
        if (v8) {
          return 5;
        }
        else {
          return 6;
        }
      }
    }
  }
}

unint64_t sub_253E65BAC(char a1)
{
  unint64_t result = 0x6374614D6E617073;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000010;
      break;
    case 2:
      unint64_t result = 0x727465526C6F6F74;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0x736552746E696F6ALL;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E65CA4()
{
  return sub_253E65BAC(*v0);
}

uint64_t sub_253E65CAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E658E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E65CD4(uint64_t a1)
{
  unint64_t v2 = sub_253E763B8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E65D10(uint64_t a1)
{
  unint64_t v2 = sub_253E763B8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E65D4C(uint64_t a1)
{
  unint64_t v2 = sub_253E76534();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E65D88(uint64_t a1)
{
  unint64_t v2 = sub_253E76534();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E65DC4(uint64_t a1)
{
  unint64_t v2 = sub_253E76450();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E65E00(uint64_t a1)
{
  unint64_t v2 = sub_253E76450();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E65E3C(uint64_t a1)
{
  unint64_t v2 = sub_253E76404();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E65E78(uint64_t a1)
{
  unint64_t v2 = sub_253E76404();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E65EB4(uint64_t a1)
{
  unint64_t v2 = sub_253E76580();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E65EF0(uint64_t a1)
{
  unint64_t v2 = sub_253E76580();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E65F2C(uint64_t a1)
{
  unint64_t v2 = sub_253E7649C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E65F68(uint64_t a1)
{
  unint64_t v2 = sub_253E7649C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E65FA4(uint64_t a1)
{
  unint64_t v2 = sub_253E764E8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E65FE0(uint64_t a1)
{
  unint64_t v2 = sub_253E764E8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void QueryDecorationCoreService.encode(to:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  sub_253E390C4(&qword_269D98138);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E7FBC4(v4, v20);
  sub_253E390C4(&qword_269D98140);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E5C3C8(v6, v21);
  sub_253E390C4(&qword_269D98148);
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  sub_253E8001C(v8, v22);
  sub_253E390C4(&qword_269D98150);
  sub_253E3B950();
  MEMORY[0x270FA5388](v9);
  sub_253E5C0EC();
  sub_253E390C4(&qword_269D98158);
  sub_253E3B950();
  MEMORY[0x270FA5388](v10);
  sub_253E5C1FC();
  sub_253E390C4(&qword_269D98160);
  sub_253E3B950();
  MEMORY[0x270FA5388](v11);
  sub_253E5C184();
  sub_253E390C4(&qword_269D98168);
  sub_253E3B950();
  MEMORY[0x270FA5388](v12);
  sub_253E4AE88();
  uint64_t v13 = *v0;
  sub_253E39108(v2, v2[3]);
  sub_253E763B8();
  sub_253E82860();
  switch(v13)
  {
    case 1:
      sub_253E76534();
      sub_253E5C19C();
      break;
    case 2:
      sub_253E764E8();
      sub_253E5C19C();
      goto LABEL_8;
    case 3:
      sub_253E7649C();
      sub_253E5C19C();
      goto LABEL_8;
    case 4:
      sub_253E76450();
      sub_253E5C19C();
      goto LABEL_8;
    case 5:
      sub_253E76404();
      sub_253E5C19C();
LABEL_8:
      sub_253E7FFCC();
      break;
    default:
      sub_253E76580();
      sub_253E5C19C();
      break;
  }
  sub_253E4AE7C();
  v16(v14, v15);
  sub_253E4AE7C();
  v19(v17, v18);
  sub_253E45D2C();
}

uint64_t _s22IntelligenceFlowShared13RetrievedToolV5StageO9hashValueSivg_0()
{
  return sub_253E82840();
}

void QueryDecorationCoreService.init(from:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  uint64_t v32 = v3;
  sub_253E390C4(&qword_269D981A8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v4);
  sub_253E5C3E4(v5, v28);
  sub_253E390C4(&qword_269D981B0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v6);
  sub_253E5C0EC();
  sub_253E390C4(&qword_269D981B8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  sub_253E7FBE0(v8, v29);
  sub_253E390C4(&qword_269D981C0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v9);
  sub_253E5C3C8(v10, v30);
  sub_253E390C4(&qword_269D981C8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v11);
  sub_253E45F88();
  sub_253E390C4(&qword_269D981D0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v12);
  sub_253E4AE88();
  sub_253E390C4(&qword_269D981D8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v13);
  sub_253E5C184();
  uint64_t v33 = v2;
  sub_253E39108(v2, v2[3]);
  sub_253E763B8();
  sub_253E82850();
  if (v0) {
    goto LABEL_12;
  }
  uint64_t v14 = sub_253E82690();
  uint64_t v15 = *(void *)(v14 + 16);
  if (!v15
    || (uint64_t v31 = *(unsigned __int8 *)(v14 + 32),
        sub_253E4AD60(1, v15, v14, v14 + 32, 0, (2 * v15) | 1),
        uint64_t v17 = v16,
        unint64_t v19 = v18,
        swift_bridgeObjectRelease(),
        v17 != v19 >> 1))
  {
    sub_253E82520();
    sub_253E5C5FC();
    uint64_t v21 = v20;
    sub_253E390C4(&qword_269D976A0);
    *uint64_t v21 = &type metadata for QueryDecorationCoreService;
    sub_253E825D0();
    sub_253E7FDE4();
    sub_253E5C1BC();
    uint64_t v22 = sub_253E7FE5C();
    v23(v22);
    swift_willThrow();
    swift_unknownObjectRelease();
    sub_253E801BC();
    sub_253E4AE7C();
    v24();
LABEL_12:
    uint64_t v25 = (uint64_t)v33;
    goto LABEL_13;
  }
  switch(v31)
  {
    case 1:
      sub_253E76534();
      sub_253E5C214();
      goto LABEL_14;
    case 2:
      sub_253E764E8();
      sub_253E5C214();
      goto LABEL_14;
    case 3:
      sub_253E7649C();
      sub_253E5C214();
      goto LABEL_15;
    case 4:
      sub_253E76450();
      sub_253E5C214();
      goto LABEL_14;
    case 5:
      sub_253E76404();
      sub_253E5C214();
      goto LABEL_14;
    default:
      sub_253E76580();
      sub_253E5C214();
LABEL_14:
      sub_253E5C4D0();
LABEL_15:
      sub_253E4AE7C();
      v26();
      swift_unknownObjectRelease();
      sub_253E7FA4C();
      v27();
      uint64_t v25 = (uint64_t)v33;
      *uint64_t v32 = v31;
      break;
  }
LABEL_13:
  sub_253E393E4(v25);
  sub_253E45D2C();
}

void sub_253E66A00()
{
}

void sub_253E66A18()
{
}

uint64_t QueryDecorationInput.query.getter()
{
  return sub_253E39ECC();
}

uint64_t QueryDecorationInput.requestId.getter()
{
  return sub_253E39ECC();
}

void QueryDecorationInput.caller.getter(_DWORD *a1@<X8>)
{
}

uint64_t QueryDecorationInput.servicesExecuted.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationInput.contextId.getter()
{
  sub_253E82140();
  sub_253E5C174();
  uint64_t v0 = sub_253E39ECC();

  return v1(v0);
}

uint64_t QueryDecorationInput.loggingSalt.getter()
{
  return sub_253E39ECC();
}

#error "253E66B7C: call analysis failed (funcsize=26)"

void QueryDecorationInput.init(query:servicesExecuted:requestId:contextId:loggingSalt:caller:requiredContextReturned:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,_DWORD *a24)
{
  sub_253E7FBA8();
  a22 = v25;
  a23 = v26;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v52 = v37;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v42 = a24;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  LODWORD(v42) = *v42;
  unint64_t v44 = &v24[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_query];
  *(void *)unint64_t v44 = v41;
  *((void *)v44 + 1) = v39;
  uint64_t v45 = &v24[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requestId];
  *(void *)uint64_t v45 = v36;
  *((void *)v45 + 1) = v34;
  uint64_t v46 = &v24[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_contextId];
  uint64_t v47 = sub_253E82140();
  sub_253E7F944();
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v46, v32, v47);
  uint64_t v49 = &v24[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_loggingSalt];
  *(void *)uint64_t v49 = v30;
  *((void *)v49 + 1) = v28;
  *(_DWORD *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_caller] = v42;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_servicesExecuted] = v52;
  a11.receiver = v24;
  a11.super_class = ObjectType;
  objc_msgSendSuper2(&a11, sel_init);
  uint64_t v50 = sub_253E80408();
  v51(v50);
  sub_253E7FB80();
}

#error "253E66D24: call analysis failed (funcsize=34)"

void QueryDecorationInput.init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:contextId:loggingSalt:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_253E7FBA8();
  a22 = v31;
  a23 = v32;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v43 = a29;
  uint64_t v44 = a30;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  swift_bridgeObjectRelease();
  int v45 = *v34;
  uint64_t v46 = &v30[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_query];
  *(void *)uint64_t v46 = v42;
  *((void *)v46 + 1) = v40;
  uint64_t v47 = &v30[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requestId];
  *(void *)uint64_t v47 = v38;
  *((void *)v47 + 1) = v36;
  sub_253E82140();
  sub_253E7F944();
  uint64_t v48 = sub_253E7FF78();
  v49(v48);
  uint64_t v50 = &v30[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_loggingSalt];
  *(void *)uint64_t v50 = v43;
  *((void *)v50 + 1) = v44;
  *(_DWORD *)&v30[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_caller] = v45;
  *(void *)&v30[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_servicesExecuted] = MEMORY[0x263F8EE78];
  a11.receiver = v30;
  a11.super_class = ObjectType;
  objc_msgSendSuper2(&a11, sel_init);
  sub_253E80414();
  sub_253E7FD78();
  v51();
  sub_253E7FB80();
}

unint64_t QueryDecorationInput.description.getter()
{
  sub_253E800FC();
  swift_bridgeObjectRetain();
  sub_253E80278();
  swift_bridgeObjectRelease();
  sub_253E7FCA0();
  sub_253E801C8();
  swift_bridgeObjectRelease();
  sub_253E824F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_253E390C4(&qword_269D98200);
  sub_253E82340();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E7FCA0();
  sub_253E801C8();
  swift_bridgeObjectRelease();
  sub_253E82380();
  sub_253E82540();
  sub_253E7FCA0();
  sub_253E801C8();
  swift_bridgeObjectRelease();
  sub_253E824F0();
  swift_bridgeObjectRelease();
  sub_253E800FC();
  uint64_t v0 = swift_bridgeObjectRetain();
  MEMORY[0x25A270F00](v0, &type metadata for QueryDecorationCoreService);
  swift_bridgeObjectRelease();
  sub_253E80278();
  swift_bridgeObjectRelease();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E82380();
  return 0xD000000000000016;
}

id QueryDecorationInput.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void QueryDecorationInput.init()()
{
}

uint64_t sub_253E67128(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7972657571 && a2 == 0xE500000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x4974736575716572 && a2 == 0xE900000000000064;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x72656C6C6163 && a2 == 0xE600000000000000;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000010 && a2 == 0x8000000253E83FC0 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x49747865746E6F63 && a2 == 0xE900000000000064;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0x53676E6967676F6CLL && a2 == 0xEB00000000746C61)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          char v10 = sub_253E82780();
          swift_bridgeObjectRelease();
          if (v10) {
            return 5;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_253E673B4(char a1)
{
  uint64_t result = 0x7972657571;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x736575716572;
      goto LABEL_6;
    case 2:
      uint64_t result = 0x72656C6C6163;
      break;
    case 3:
      uint64_t result = 0xD000000000000010;
      break;
    case 4:
      uint64_t v3 = 0x7865746E6F63;
LABEL_6:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x4974000000000000;
      break;
    case 5:
      uint64_t result = 0x53676E6967676F6CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_253E67480()
{
  return sub_253E673B4(*v0);
}

uint64_t sub_253E67488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E67128(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E674B0(uint64_t a1)
{
  unint64_t v2 = sub_253E765CC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E674EC(uint64_t a1)
{
  unint64_t v2 = sub_253E765CC();

  return MEMORY[0x270FA00B8](a1, v2);
}

void QueryDecorationInput.encode(to:)()
{
  sub_253E803CC();
  sub_253E7FD38();
  sub_253E390C4(&qword_269D98208);
  sub_253E3B950();
  MEMORY[0x270FA5388](v1);
  sub_253E7F9A8();
  sub_253E765CC();
  sub_253E5C544();
  sub_253E7FB14();
  if (!v0)
  {
    sub_253E826B0();
    sub_253E8042C();
    sub_253E76618();
    sub_253E7FCD8();
    sub_253E80420();
    sub_253E390C4(&qword_269D98220);
    sub_253E77490(&qword_269D98228, &qword_269D98220, (void (*)(void))sub_253E76664);
    sub_253E7FCD8();
    sub_253E82140();
    sub_253E75E08(&qword_269D98238, MEMORY[0x263F07508]);
    sub_253E7FCD8();
    sub_253E7FB14();
  }
  uint64_t v2 = sub_253E5C288();
  v3(v2);
  sub_253E80344();
}

void QueryDecorationInput.__allocating_init(from:)()
{
  id v1 = objc_allocWithZone(v0);
  QueryDecorationInput.init(from:)();
}

void QueryDecorationInput.init(from:)()
{
  sub_253E45CF0();
  sub_253E7FD38();
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_253E82140();
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E5C1FC();
  sub_253E390C4(&qword_269D98240);
  sub_253E3B950();
  MEMORY[0x270FA5388](v4);
  sub_253E4AEA0();
  sub_253E803B0(v0);
  sub_253E765CC();
  uint64_t v17 = v2;
  sub_253E804A0();
  sub_253E82850();
  if (v1)
  {
    sub_253E393E4((uint64_t)v0);

    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v19) = 0;
    uint64_t v5 = sub_253E82640();
    BOOL v6 = (uint64_t *)&v17[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_query];
    *BOOL v6 = v5;
    v6[1] = v7;
    sub_253E802F8(1);
    uint64_t v8 = sub_253E825E0();
    uint64_t v9 = (uint64_t *)&v17[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_requestId];
    *uint64_t v9 = v8;
    v9[1] = v10;
    sub_253E8042C();
    sub_253E766B0();
    sub_253E82680();
    *(_DWORD *)&v17[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_caller] = v19;
    sub_253E390C4(&qword_269D98220);
    sub_253E80420();
    sub_253E77490(&qword_269D98250, &qword_269D98220, (void (*)(void))sub_253E766FC);
    sub_253E82680();
    *(void *)&v17[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_servicesExecuted] = v19;
    LOBYTE(v19) = 4;
    sub_253E75E08(&qword_269D98260, MEMORY[0x263F07508]);
    sub_253E82680();
    sub_253E7FA04();
    v11();
    sub_253E802F8(5);
    uint64_t v12 = sub_253E82640();
    uint64_t v13 = (uint64_t *)&v17[OBJC_IVAR____TtC22IntelligenceFlowShared20QueryDecorationInput_loggingSalt];
    *uint64_t v13 = v12;
    v13[1] = v14;

    v18.receiver = v17;
    v18.super_class = ObjectType;
    objc_msgSendSuper2(&v18, sel_init);
    sub_253E45CE4();
    v15();
    sub_253E393E4((uint64_t)v0);
  }
  sub_253E460A0();
  sub_253E45D2C();
}

void sub_253E67D74(void *a1@<X8>)
{
  QueryDecorationInput.__allocating_init(from:)();
  if (!v1) {
    *a1 = v3;
  }
}

void sub_253E67DA0()
{
}

uint64_t QueryDecorationCaller.rawValue.getter()
{
  return *v0;
}

uint64_t sub_253E67DCC()
{
  return sub_253E82410();
}

uint64_t sub_253E67E2C()
{
  return sub_253E823E0();
}

void sub_253E67E80(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_253E67E88@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_253E67E94@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_253E67EA0@<X0>(uint64_t result@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL sub_253E67EAC(_DWORD *a1, int a2)
{
  int v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

void sub_253E67ED8(uint64_t a1@<X8>, int a2@<W0>)
{
  if ((*v2 & a2) != 0) {
    *v2 &= ~a2;
  }
  sub_253E7FF9C(a1);
}

void sub_253E67EF8(uint64_t a1@<X8>, int a2@<W0>)
{
  *v2 |= a2;
  sub_253E7FF9C(a1);
}

uint64_t sub_253E67F10(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_253E67F20(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_253E67F30(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_253E67F40@<X0>(uint64_t result@<X0>, int a2@<W1>, int *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_253E67F4C(int a1, int a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_253E67F58(int a1, int a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_253E67F64(int a1, int a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_253E67F70(int a1)
{
  return a1 == 0;
}

uint64_t sub_253E67F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t sub_253E67F94(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

BOOL sub_253E67FA4(int *a1, int *a2)
{
  return sub_253E3CFFC(*a1, *a2);
}

uint64_t sub_253E67FB0@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_253E67FC8(a1, a2);
}

uint64_t sub_253E67FC8@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = (int *)(a1 + 32);
    do
    {
      int v7 = *v5++;
      int v6 = v7;
      if ((v7 & ~v4) == 0) {
        int v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    int v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t (*DynamicEnumerationEntity.identifier.modify())()
{
  return nullsub_1;
}

uint64_t DynamicEnumerationEntity.parameterTypeInstance.getter()
{
  return sub_253E6CBE4((void (*)(void))type metadata accessor for DynamicEnumerationEntity, MEMORY[0x263F80578]);
}

uint64_t DynamicEnumerationEntity.parameterTypeInstance.setter(uint64_t a1)
{
  return sub_253E6CC88(a1, (void (*)(void))type metadata accessor for DynamicEnumerationEntity, MEMORY[0x263F80578]);
}

uint64_t (*DynamicEnumerationEntity.parameterTypeInstance.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicEnumerationEntity.typedValue.getter()
{
  type metadata accessor for DynamicEnumerationEntity(0);
  sub_253E82240();
  sub_253E5C174();
  uint64_t v0 = sub_253E39ECC();

  return v1(v0);
}

uint64_t DynamicEnumerationEntity.typedValue.setter()
{
  type metadata accessor for DynamicEnumerationEntity(0);
  sub_253E82240();
  sub_253E5C174();
  uint64_t v0 = sub_253E801F4();

  return v1(v0);
}

uint64_t (*DynamicEnumerationEntity.typedValue.modify())(void)
{
  return nullsub_1;
}

uint64_t DynamicEnumerationEntity.init(identifier:parameterTypeInstance:typedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = sub_253E82140();
  sub_253E3B950();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  sub_253E4AEA0();
  if (!a2)
  {
    sub_253E82130();
    a1 = sub_253E82120();
    a2 = v11;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v7);
  }
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for DynamicEnumerationEntity(0);
  sub_253E82260();
  sub_253E5C174();
  sub_253E7FE94();
  v12();
  sub_253E82240();
  sub_253E5C174();
  sub_253E7FE94();
  return v13();
}

uint64_t static DynamicEnumerationEntity.== infix(_:_:)()
{
  sub_253E80144();
  BOOL v3 = *v2 == *v0 && *(void *)(v1 + 8) == v0[1];
  if (!v3 && (sub_253E82780() & 1) == 0) {
    return 0;
  }
  type metadata accessor for DynamicEnumerationEntity(0);
  if ((sub_253E82250() & 1) == 0) {
    return 0;
  }

  return sub_253E82230();
}

uint64_t sub_253E683D8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000253E84250 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v7 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v7) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_253E68534(char a1)
{
  if (!a1) {
    return 0x696669746E656469;
  }
  if (a1 == 1) {
    return 0xD000000000000015;
  }
  return 0x6C61566465707974;
}

uint64_t sub_253E68594()
{
  return sub_253E68534(*v0);
}

uint64_t sub_253E6859C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E683D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E685C4(uint64_t a1)
{
  unint64_t v2 = sub_253E76768();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E68600(uint64_t a1)
{
  unint64_t v2 = sub_253E76768();

  return MEMORY[0x270FA00B8](a1, v2);
}

void DynamicEnumerationEntity.encode(to:)()
{
  sub_253E803CC();
  sub_253E7FD38();
  sub_253E390C4(&qword_269D98268);
  sub_253E3B950();
  MEMORY[0x270FA5388](v1);
  sub_253E7F9A8();
  sub_253E76768();
  sub_253E5C544();
  sub_253E7FB14();
  if (!v0)
  {
    type metadata accessor for DynamicEnumerationEntity(0);
    sub_253E82260();
    sub_253E75E08(&qword_269D98278, MEMORY[0x263F80578]);
    sub_253E80464();
    sub_253E7FCD8();
    sub_253E7FEF0();
    sub_253E82240();
    sub_253E75E08(&qword_26B257820, MEMORY[0x263F80508]);
    sub_253E7FCD8();
  }
  uint64_t v2 = sub_253E5C288();
  v3(v2);
  sub_253E80344();
}

void DynamicEnumerationEntity.init(from:)()
{
  sub_253E45CF0();
  BOOL v3 = v2;
  sub_253E82240();
  sub_253E3B950();
  MEMORY[0x270FA5388](v4);
  sub_253E7FBC4(v5, v14);
  sub_253E82260();
  sub_253E3B950();
  MEMORY[0x270FA5388](v6);
  sub_253E5C1FC();
  sub_253E390C4(&qword_269D98280);
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  uint64_t v8 = sub_253E7FC18();
  type metadata accessor for DynamicEnumerationEntity(v8);
  sub_253E5C174();
  MEMORY[0x270FA5388](v9);
  sub_253E7FADC();
  sub_253E39108(v3, v3[3]);
  sub_253E76768();
  sub_253E82850();
  if (v1)
  {
    sub_253E393E4((uint64_t)v3);
  }
  else
  {
    uint64_t *v0 = sub_253E82640();
    v0[1] = v10;
    sub_253E75E08(&qword_269D98288, MEMORY[0x263F80578]);
    sub_253E80458();
    sub_253E82680();
    sub_253E7FA04();
    v11();
    sub_253E7FEF0();
    sub_253E75E08(&qword_269D97738, MEMORY[0x263F80508]);
    sub_253E82680();
    sub_253E45CE4();
    v12();
    sub_253E7FE94();
    v13();
    sub_253E7626C();
    sub_253E393E4((uint64_t)v3);
    sub_253E75DB8();
  }
  sub_253E45D2C();
}

void sub_253E68B64()
{
}

void sub_253E68B7C()
{
}

uint64_t QueryDecorationOutput.spans.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.requiredContext.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.utteranceContext.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.originalRankedTools.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.adjustedRankedTools.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.originalRankedSpans.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.adjustedRankedSpans.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.originalRankedUtteranceContext.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.adjustedRankedUtteranceContext.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.queryDecorationToolRetrievalResponse.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse);
  uint64_t v3 = *(void *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 8);
  uint64_t v4 = *(void *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 16);
  uint64_t v5 = *(void *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 24);
  uint64_t v6 = *(void *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 32);
  uint64_t v7 = *(void *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 40);
  uint64_t v8 = *(void *)(v1
                 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse
                 + 48);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  a1[6] = v8;
  return sub_253E767B4(v2, v3);
}

uint64_t QueryDecorationOutput.dynamicEnumerationEntities.getter()
{
  return sub_253E7F95C();
}

uint64_t QueryDecorationOutput.context.getter()
{
  return sub_253E7F95C();
}

id sub_253E68C64(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  uint64_t v5 = (void *)sub_253E82300();
  swift_bridgeObjectRelease();

  return v5;
}

unint64_t QueryDecorationOutput.description.getter()
{
  swift_bridgeObjectRetain();
  sub_253E390C4(&qword_269D982F0);
  sub_253E82340();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E7FCA0();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E804B8();
  sub_253E824F0();
  swift_bridgeObjectRelease();
  sub_253E800FC();
  swift_bridgeObjectRetain();
  sub_253E390C4(&qword_269D982F8);
  sub_253E82340();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E7FCA0();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E804B8();
  sub_253E824F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_253E82340();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E7FCA0();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E804B8();
  sub_253E824F0();
  swift_bridgeObjectRelease();
  uint64_t v1 = sub_253E7FE70(v0 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse);
  sub_253E767B4(v1, v2);
  sub_253E390C4(&qword_269D98300);
  sub_253E82340();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E7FCA0();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E804B8();
  sub_253E824F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_253E390C4(&qword_269D98308);
  sub_253E82340();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E7FCA0();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E82380();
  return 0xD000000000000017;
}

id QueryDecorationOutput.__allocating_init(spans:requiredContext:utteranceContext:queryDecorationToolRetrievalResponse:dynamicEnumerationEntities:context:)()
{
  id v0 = objc_allocWithZone((Class)sub_253E7FF58());
  sub_253E80438();
  return QueryDecorationOutput.init(spans:requiredContext:utteranceContext:queryDecorationToolRetrievalResponse:dynamicEnumerationEntities:context:)();
}

id QueryDecorationOutput.init(spans:requiredContext:utteranceContext:queryDecorationToolRetrievalResponse:dynamicEnumerationEntities:context:)()
{
  sub_253E7FF58();
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = *(void *)(v3 + 48);
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans] = v6;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_requiredContext] = v5;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext] = v4;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedTools] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedTools] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedSpans] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedUtteranceContext] = 0;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext] = 0;
  uint64_t v9 = &v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse];
  long long v10 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v3;
  *((_OWORD *)v9 + 1) = v10;
  *((_OWORD *)v9 + 2) = *(_OWORD *)(v3 + 32);
  *((void *)v9 + 6) = v8;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_dynamicEnumerationEntities] = v2;
  *(void *)&v1[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_context] = v0;
  v12.receiver = v1;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, sel_init);
}

#error "253E69198: call analysis failed (funcsize=30)"

void QueryDecorationOutput.init(spans:requiredContext:utteranceContext:originalRankedTools:adjustedRankedTools:originalRankedSpans:adjustedRankedSpans:originalRankedUtteranceContext:adjustedRankedUtteranceContext:queryDecorationToolRetrievalResponse:dynamicEnumerationEntities:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_253E7FBA8();
  a22 = v34;
  a23 = v35;
  uint64_t v42 = v36;
  sub_253E7FA8C();
  uint64_t v43 = a26;
  uint64_t v38 = a24;
  uint64_t v37 = a25;
  swift_getObjectType();
  uint64_t v39 = *(void *)(v37 + 48);
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans] = v33;
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_requiredContext] = v32;
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext] = v31;
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedTools] = v30;
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedTools] = v29;
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedSpans] = v28;
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans] = v27;
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedUtteranceContext] = v42;
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext] = v38;
  *(void *)&double v40 = sub_253E8008C(v39).n128_u64[0];
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_dynamicEnumerationEntities] = v43;
  *(void *)&v26[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_context] = 0;
  a11.receiver = v26;
  a11.super_class = v41;
  objc_msgSendSuper2(&a11, sel_init, v40);
  sub_253E7FB80();
}

#error "253E69300: call analysis failed (funcsize=25)"

void QueryDecorationOutput.init(spans:requiredContext:utteranceContext:originalRankedTools:adjustedRankedTools:originalRankedSpans:adjustedRankedSpans:originalRankedUtteranceContext:adjustedRankedUtteranceContext:queryDecorationToolRetrievalResponse:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  sub_253E7FBA8();
  a22 = v33;
  a23 = v34;
  uint64_t v39 = v35;
  sub_253E7FCF0();
  swift_getObjectType();
  uint64_t v36 = *(void *)(v23 + 48);
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans] = v31;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_requiredContext] = v30;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext] = v29;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedTools] = v28;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedTools] = v27;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedSpans] = v26;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans] = v25;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedUtteranceContext] = v39;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext] = v32;
  *(void *)&double v37 = sub_253E8008C(v36).n128_u64[0];
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_dynamicEnumerationEntities] = 0;
  *(void *)&v24[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_context] = 0;
  a11.receiver = v24;
  a11.super_class = v38;
  objc_msgSendSuper2(&a11, sel_init, v37);
  sub_253E7FB80();
}

Swift::Void __swiftcall QueryDecorationOutput.osLogOutcomes()()
{
  sub_253E69424();

  sub_253E69B7C();
}

void sub_253E69424()
{
  uint64_t v1 = type metadata accessor for SpanMatchedEntity(0);
  uint64_t v38 = *(void *)(v1 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&i - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&i - v5;
  uint64_t v7 = sub_253E390C4(&qword_269D989C0);
  MEMORY[0x270FA5388](v7);
  double v37 = (char *)&i - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_253E390C4(&qword_269D989C8);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v39 = (char *)&i - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (unint64_t *)((char *)&i - v14);
  MEMORY[0x270FA5388](v13);
  objc_super v18 = (char *)&i - v17;
  uint64_t v42 = v0;
  uint64_t v19 = *(void *)(v0 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans);
  if (v19)
  {
    uint64_t v36 = v16;
    unint64_t v45 = 0xD000000000000036;
    unint64_t v46 = 0x8000000253E84420;
    swift_bridgeObjectRetain();
    unint64_t v20 = 0;
    uint64_t v41 = v19;
    for (i = v15; ; uint64_t v15 = i)
    {
      unint64_t v21 = *(void *)(v19 + 16);
      if (v20 == v21)
      {
        uint64_t v22 = 1;
      }
      else
      {
        if (v20 >= v21)
        {
          __break(1u);
LABEL_26:
          __break(1u);
          goto LABEL_27;
        }
        sub_253E7626C();
        *uint64_t v15 = v20;
        sub_253E76018();
        uint64_t v22 = 0;
        ++v20;
      }
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v15, v22, 1, v7);
      sub_253E7F868((uint64_t)v15, (uint64_t)v18, &qword_269D989C8);
      if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v18, 1, v7) == 1)
      {
        swift_bridgeObjectRelease();
        sub_253E82380();
        swift_bridgeObjectRetain();
        unint64_t v23 = 0;
        while (1)
        {
          unint64_t v24 = *(void *)(v19 + 16);
          uint64_t v25 = (uint64_t)v39;
          if (v23 == v24)
          {
            uint64_t v26 = 1;
            uint64_t v27 = (uint64_t)v36;
          }
          else
          {
            if (v23 >= v24) {
              goto LABEL_26;
            }
            sub_253E7626C();
            uint64_t v27 = (uint64_t)v36;
            *uint64_t v36 = v23;
            sub_253E76018();
            uint64_t v26 = 0;
            ++v23;
            uint64_t v25 = (uint64_t)v39;
          }
          _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v27, v26, 1, v7);
          sub_253E7F868(v27, v25, &qword_269D989C8);
          if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v25, 1, v7) == 1) {
            break;
          }
          sub_253E76018();
          if (*(void *)(*(void *)&v4[*(int *)(v1 + 20)] + 16))
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          sub_253E6A3FC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_253E82380();
          swift_bridgeObjectRelease();
          sub_253E75DB8();
          uint64_t v19 = v41;
        }
        swift_bridgeObjectRelease();
        if (qword_269D97318 == -1)
        {
LABEL_21:
          uint64_t v28 = sub_253E821C0();
          sub_253E5DBD0(v28, (uint64_t)qword_269D97C78);
          uint64_t v30 = v45;
          unint64_t v29 = v46;
          swift_bridgeObjectRetain();
          uint64_t v31 = sub_253E821A0();
          os_log_type_t v32 = sub_253E82470();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = (uint8_t *)swift_slowAlloc();
            uint64_t v34 = swift_slowAlloc();
            uint64_t v44 = v34;
            *(_DWORD *)uint64_t v33 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v43 = sub_253E5F7BC(v30, v29, &v44);
            sub_253E824B0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_253E37000, v31, v32, "%s", v33, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x25A271760](v34, -1, -1);
            MEMORY[0x25A271760](v33, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          return;
        }
LABEL_27:
        swift_once();
        goto LABEL_21;
      }
      unint64_t v40 = v20;
      sub_253E76018();
      if (*(void *)(*(void *)&v6[*(int *)(v1 + 20)] + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_253E6A3FC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_253E82380();
      swift_bridgeObjectRelease();
      sub_253E75DB8();
      unint64_t v20 = v40;
      uint64_t v19 = v41;
    }
  }
}

void sub_253E69B7C()
{
  uint64_t v44 = type metadata accessor for RetrievedContext(0);
  uint64_t v39 = *(void *)(v44 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v44);
  uint64_t v43 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v35 - v3;
  uint64_t v5 = sub_253E390C4(&qword_269D989A8);
  MEMORY[0x270FA5388](v5);
  uint64_t v38 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_253E390C4(&qword_269D989B0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (unint64_t *)((char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v42 = (char *)&v35 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (unint64_t *)((char *)&v35 - v14);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v35 - v16;
  uint64_t v45 = v0;
  uint64_t v18 = *(void *)(v0 + OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext);
  if (v18)
  {
    unint64_t v50 = 0xD000000000000035;
    unint64_t v51 = 0x8000000253E843E0;
    unint64_t v19 = *(void *)(v18 + 16);
    uint64_t v40 = v18;
    swift_bridgeObjectRetain();
    unint64_t v20 = 0;
    uint64_t v41 = v10;
    uint64_t v36 = v15;
    double v37 = v4;
    unint64_t v35 = v19;
    while (1)
    {
      if (v20 == v19)
      {
        uint64_t v21 = 1;
        unint64_t v20 = v19;
      }
      else
      {
        if (v20 >= *(void *)(v40 + 16))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
        sub_253E7626C();
        *uint64_t v15 = v20;
        sub_253E76018();
        uint64_t v21 = 0;
        ++v20;
      }
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v15, v21, 1, v5);
      sub_253E7F868((uint64_t)v15, (uint64_t)v17, &qword_269D989B0);
      if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v17, 1, v5) == 1) {
        break;
      }
      sub_253E76018();
      sub_253E7F868((uint64_t)&v4[*(int *)(v44 + 40)], (uint64_t)v48, &qword_26B2577D8);
      sub_253E7F868((uint64_t)v48, (uint64_t)v49, &qword_26B2577D8);
      if (sub_253E7F804((uint64_t)v49) != 1)
      {
        sub_253E7F868((uint64_t)v48, (uint64_t)v46, &qword_26B2577D8);
        if (v47)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          goto LABEL_13;
        }
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
LABEL_13:
      sub_253E6A3FC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_253E82380();
      swift_bridgeObjectRelease();
      uint64_t v4 = v37;
      sub_253E75DB8();
      uint64_t v10 = v41;
      unint64_t v19 = v35;
      uint64_t v15 = v36;
    }
    uint64_t v22 = v40;
    swift_bridgeObjectRelease();
    sub_253E82380();
    unint64_t v23 = *(void *)(v22 + 16);
    swift_bridgeObjectRetain();
    unint64_t v24 = 0;
    while (1)
    {
      uint64_t v25 = (uint64_t)v42;
      if (v24 == v23)
      {
        uint64_t v26 = 1;
        unint64_t v24 = v23;
      }
      else
      {
        if (v24 >= *(void *)(v40 + 16)) {
          goto LABEL_32;
        }
        sub_253E7626C();
        *uint64_t v10 = v24;
        sub_253E76018();
        uint64_t v26 = 0;
        ++v24;
        uint64_t v25 = (uint64_t)v42;
      }
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, v26, 1, v5);
      sub_253E7F868((uint64_t)v10, v25, &qword_269D989B0);
      if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v25, 1, v5) == 1)
      {
        swift_bridgeObjectRelease();
        if (qword_269D97318 == -1)
        {
LABEL_27:
          uint64_t v28 = sub_253E821C0();
          sub_253E5DBD0(v28, (uint64_t)qword_269D97C78);
          uint64_t v30 = v50;
          unint64_t v29 = v51;
          swift_bridgeObjectRetain();
          uint64_t v31 = sub_253E821A0();
          os_log_type_t v32 = sub_253E82470();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = (uint8_t *)swift_slowAlloc();
            uint64_t v34 = swift_slowAlloc();
            v49[0] = v34;
            *(_DWORD *)uint64_t v33 = 136315138;
            swift_bridgeObjectRetain();
            v48[0] = sub_253E5F7BC(v30, v29, v49);
            sub_253E824B0();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_253E37000, v31, v32, "%s", v33, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x25A271760](v34, -1, -1);
            MEMORY[0x25A271760](v33, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          return;
        }
LABEL_33:
        swift_once();
        goto LABEL_27;
      }
      uint64_t v27 = v43;
      sub_253E76018();
      sub_253E7F868((uint64_t)&v27[*(int *)(v44 + 40)], (uint64_t)v48, &qword_26B2577D8);
      sub_253E7F868((uint64_t)v48, (uint64_t)v49, &qword_26B2577D8);
      if (sub_253E7F804((uint64_t)v49) != 1)
      {
        sub_253E7F868((uint64_t)v48, (uint64_t)v46, &qword_26B2577D8);
        if (v47)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v10 = v41;
          goto LABEL_25;
        }
        swift_bridgeObjectRetain();
        uint64_t v10 = v41;
      }
      swift_bridgeObjectRelease();
LABEL_25:
      sub_253E6A3FC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_253E82380();
      swift_bridgeObjectRelease();
      sub_253E75DB8();
    }
  }
}

uint64_t sub_253E6A3FC()
{
  return 8202;
}

void QueryDecorationOutput.init()()
{
}

uint64_t sub_253E6A5F8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x736E617073 && a2 == 0xE500000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6465726975716572 && a2 == 0xEF747865746E6F43;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x8000000253E84070 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x8000000253E84090 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x8000000253E840B0 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x8000000253E840D0 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x8000000253E840F0 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 6;
    }
    else if (a1 == 0xD00000000000001ELL && a2 == 0x8000000253E84110 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 7;
    }
    else if (a1 == 0xD00000000000001ELL && a2 == 0x8000000253E84130 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 8;
    }
    else if (a1 == 0xD000000000000024 && a2 == 0x8000000253E84150 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 9;
    }
    else if (a1 == 0xD00000000000001ALL && a2 == 0x8000000253E84180 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 10;
    }
    else if (a1 == 0x747865746E6F63 && a2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      return 11;
    }
    else
    {
      char v8 = sub_253E82780();
      swift_bridgeObjectRelease();
      if (v8) {
        return 11;
      }
      else {
        return 12;
      }
    }
  }
}

unint64_t sub_253E6AA90(char a1)
{
  unint64_t result = 0x736E617073;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6465726975716572;
      break;
    case 2:
      unint64_t result = 0xD000000000000010;
      break;
    case 3:
    case 4:
    case 5:
    case 6:
      unint64_t result = 0xD000000000000013;
      break;
    case 7:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 9:
      unint64_t result = 0xD000000000000024;
      break;
    case 10:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 11:
      unint64_t result = 0x747865746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E6ABF4()
{
  return sub_253E6AA90(*v0);
}

uint64_t sub_253E6ABFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E6A5F8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E6AC24(uint64_t a1)
{
  unint64_t v2 = sub_253E76818();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6AC60(uint64_t a1)
{
  unint64_t v2 = sub_253E76818();

  return MEMORY[0x270FA00B8](a1, v2);
}

id _s22IntelligenceFlowShared20QueryDecorationInputCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void QueryDecorationOutput.encode(to:)()
{
  sub_253E45CF0();
  sub_253E7FD38();
  sub_253E390C4(&qword_269D98310);
  sub_253E3B950();
  MEMORY[0x270FA5388](v1);
  sub_253E7F9A8();
  sub_253E76818();
  sub_253E5C544();
  sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans);
  sub_253E390C4(&qword_269D98320);
  sub_253E76864();
  sub_253E7FA58();
  if (!v0)
  {
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_requiredContext);
    sub_253E390C4(&qword_269D98338);
    sub_253E76928();
    sub_253E7FA58();
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext);
    sub_253E8042C();
    sub_253E7FA58();
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedTools);
    sub_253E80420();
    sub_253E390C4(&qword_269D97480);
    sub_253E3B28C(&qword_269D97488);
    sub_253E7FA58();
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedTools);
    sub_253E7F964(4);
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedSpans);
    sub_253E7F964(5);
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans);
    sub_253E7F964(6);
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedUtteranceContext);
    sub_253E7F964(7);
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext);
    sub_253E7F964(8);
    sub_253E769CC();
    sub_253E7FA58();
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_dynamicEnumerationEntities);
    sub_253E390C4(&qword_269D98358);
    sub_253E76A18();
    sub_253E7FA58();
    sub_253E7FB9C(OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_context);
    sub_253E7FA58();
  }
  uint64_t v2 = sub_253E5C288();
  v3(v2);
  sub_253E460A0();
  sub_253E45D2C();
}

void QueryDecorationOutput.__allocating_init(from:)()
{
  id v1 = objc_allocWithZone(v0);
  QueryDecorationOutput.init(from:)();
}

void QueryDecorationOutput.init(from:)()
{
  sub_253E45CF0();
  uint64_t v3 = v2;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  sub_253E390C4(&qword_269D98370);
  sub_253E3B950();
  MEMORY[0x270FA5388](v4);
  sub_253E45F88();
  sub_253E39108(v3, v3[3]);
  sub_253E76818();
  uint64_t v5 = v0;
  sub_253E802EC();
  sub_253E82850();
  if (v1)
  {
    sub_253E393E4((uint64_t)v3);

    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_253E390C4(&qword_269D98320);
    sub_253E76B20();
    sub_253E82620();
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_spans] = v11;
    sub_253E390C4(&qword_269D98338);
    sub_253E76BC4();
    sub_253E7FE20();
    sub_253E82620();
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_requiredContext] = v11;
    sub_253E8042C();
    sub_253E7FE20();
    sub_253E82620();
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_utteranceContext] = v11;
    sub_253E390C4(&qword_269D97480);
    sub_253E80420();
    sub_253E3B28C(&qword_269D97498);
    sub_253E80478();
    sub_253E82620();
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedTools] = v11;
    sub_253E82620();
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedTools] = v11;
    sub_253E7F9C8(5);
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedSpans] = v11;
    sub_253E7F9C8(6);
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedSpans] = v11;
    sub_253E7F9C8(7);
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_originalRankedUtteranceContext] = v11;
    sub_253E7F9C8(8);
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_adjustedRankedUtteranceContext] = v11;
    sub_253E76C68();
    sub_253E82620();
    uint64_t v6 = v14;
    uint64_t v7 = &v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_queryDecorationToolRetrievalResponse];
    *(_OWORD *)uint64_t v7 = v11;
    *((_OWORD *)v7 + 1) = v12;
    *((_OWORD *)v7 + 2) = v13;
    *((void *)v7 + 6) = v6;
    sub_253E390C4(&qword_269D98358);
    sub_253E76CB4();
    sub_253E80478();
    sub_253E82620();
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_dynamicEnumerationEntities] = v11;
    sub_253E82620();
    *(void *)&v5[OBJC_IVAR____TtC22IntelligenceFlowShared21QueryDecorationOutput_context] = v11;

    v10.receiver = v5;
    v10.super_class = ObjectType;
    objc_msgSendSuper2(&v10, sel_init);
    sub_253E4AE7C();
    v8();
    sub_253E393E4((uint64_t)v3);
  }
  sub_253E45D2C();
}

void sub_253E6B8C8(void *a1@<X8>)
{
  QueryDecorationOutput.__allocating_init(from:)();
  if (!v1) {
    *a1 = v3;
  }
}

void sub_253E6B8F4()
{
}

uint64_t QueryDecorationToolRetrievalResponse.originalSubQuery.getter()
{
  return sub_253E39ECC();
}

uint64_t QueryDecorationToolRetrievalResponse.originalSubQuery.setter()
{
  uint64_t result = sub_253E46000();
  void *v1 = v2;
  v1[1] = v0;
  return result;
}

uint64_t (*QueryDecorationToolRetrievalResponse.originalSubQuery.modify())()
{
  return nullsub_1;
}

uint64_t QueryDecorationToolRetrievalResponse.rewrittenQuery.getter()
{
  return sub_253E39ECC();
}

uint64_t QueryDecorationToolRetrievalResponse.rewrittenQuery.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*QueryDecorationToolRetrievalResponse.rewrittenQuery.modify())()
{
  return nullsub_1;
}

float QueryDecorationToolRetrievalResponse.confidence.getter()
{
  return *(float *)(v0 + 32);
}

void QueryDecorationToolRetrievalResponse.confidence.setter(float a1)
{
  *(float *)(v1 + 32) = a1;
}

uint64_t (*QueryDecorationToolRetrievalResponse.confidence.modify())()
{
  return nullsub_1;
}

uint64_t QueryDecorationToolRetrievalResponse.retrievedTools.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t QueryDecorationToolRetrievalResponse.retrievedTools.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*QueryDecorationToolRetrievalResponse.retrievedTools.modify())()
{
  return nullsub_1;
}

uint64_t QueryDecorationToolRetrievalResponse.types.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t QueryDecorationToolRetrievalResponse.types.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = a1;
  return result;
}

uint64_t (*QueryDecorationToolRetrievalResponse.types.modify())()
{
  return nullsub_1;
}

uint64_t QueryDecorationToolRetrievalResponse.init(originalSubQuery:rewrittenQuery:confidence:retrievedTools:types:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>, float a8@<S0>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = a4;
  *(float *)(a7 + 32) = a8;
  *(void *)(a7 + 40) = a5;
  *(void *)(a7 + 48) = a6;
  return result;
}

uint64_t static QueryDecorationToolRetrievalResponse.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  float v4 = *(float *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  float v8 = *(float *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  BOOL v10 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (!v10 && (sub_253E82780() & 1) == 0) {
    return 0;
  }
  BOOL v11 = v2 == v6 && v3 == v7;
  if (!v11 && (sub_253E82780() & 1) == 0 || v4 != v8 || !sub_253E3A310(v5, v9)) {
    return 0;
  }
  uint64_t v12 = sub_253E39ECC();

  return sub_253E6BBEC(v12, v13);
}

uint64_t sub_253E6BBEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253E82280();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v60 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v49 - v8;
  uint64_t v66 = sub_253E822A0();
  uint64_t v59 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  uint64_t v61 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_253E390C4(&qword_269D98980);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v49 - v16;
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v58 = a2;
  int64_t v62 = 0;
  uint64_t v53 = a1;
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v50 = a1 + 64;
  uint64_t v19 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & v18;
  int64_t v51 = (unint64_t)(v19 + 63) >> 6;
  uint64_t v52 = v59 + 16;
  uint64_t v64 = v5 + 16;
  uint64_t v56 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  uint64_t v57 = (void (**)(char *, char *, uint64_t))(v59 + 32);
  uint64_t v54 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v55 = (void (**)(uint64_t, uint64_t))(v59 + 8);
  int64_t v49 = v51 - 1;
  while (1)
  {
    if (v21)
    {
      unint64_t v22 = __clz(__rbit64(v21));
      uint64_t v23 = (v21 - 1) & v21;
      unint64_t v24 = v22 | (v62 << 6);
LABEL_8:
      uint64_t v25 = v53;
      (*(void (**)(char *, unint64_t, uint64_t))(v59 + 16))(v14, *(void *)(v53 + 48) + *(void *)(v59 + 72) * v24, v66);
      unint64_t v26 = *(void *)(v25 + 56) + *(void *)(v5 + 72) * v24;
      uint64_t v27 = sub_253E390C4(&qword_269D98988);
      (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(&v14[*(int *)(v27 + 48)], v26, v4);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v14, 0, 1, v27);
      goto LABEL_30;
    }
    int64_t v28 = v62 + 1;
    if (__OFADD__(v62, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v28 < v51)
    {
      unint64_t v29 = *(void *)(v50 + 8 * v28);
      if (v29) {
        goto LABEL_12;
      }
      int64_t v30 = v62 + 2;
      ++v62;
      if (v28 + 1 < v51)
      {
        unint64_t v29 = *(void *)(v50 + 8 * v30);
        if (v29) {
          goto LABEL_15;
        }
        int64_t v62 = v28 + 1;
        if (v28 + 2 < v51)
        {
          unint64_t v29 = *(void *)(v50 + 8 * (v28 + 2));
          if (v29)
          {
            v28 += 2;
            goto LABEL_12;
          }
          int64_t v62 = v28 + 2;
          if (v28 + 3 < v51)
          {
            unint64_t v29 = *(void *)(v50 + 8 * (v28 + 3));
            if (v29)
            {
              v28 += 3;
              goto LABEL_12;
            }
            int64_t v30 = v28 + 4;
            int64_t v62 = v28 + 3;
            if (v28 + 4 < v51) {
              break;
            }
          }
        }
      }
    }
LABEL_29:
    uint64_t v31 = sub_253E390C4(&qword_269D98988);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v14, 1, 1, v31);
    uint64_t v23 = 0;
LABEL_30:
    sub_253E7F868((uint64_t)v14, (uint64_t)v17, &qword_269D98980);
    uint64_t v32 = sub_253E390C4(&qword_269D98988);
    int v33 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v17, 1, v32);
    BOOL v63 = v33 == 1;
    if (v33 == 1) {
      return v63;
    }
    unint64_t v65 = v23;
    uint64_t v34 = v14;
    uint64_t v35 = v5;
    uint64_t v36 = &v17[*(int *)(v32 + 48)];
    uint64_t v37 = (uint64_t)v61;
    uint64_t v38 = v17;
    uint64_t v39 = v66;
    (*v57)(v61, v17, v66);
    (*v56)(v9, v36, v4);
    uint64_t v40 = v58;
    unint64_t v41 = sub_253E737D8(v37);
    char v43 = v42;
    (*v55)(v37, v39);
    if ((v43 & 1) == 0)
    {
      (*v54)(v9, v4);
      return 0;
    }
    uint64_t v5 = v35;
    unint64_t v44 = *(void *)(v40 + 56) + *(void *)(v35 + 72) * v41;
    uint64_t v45 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
    unint64_t v46 = v60;
    v45(v60, v44, v4);
    sub_253E75E08(&qword_269D98990, MEMORY[0x263F805E8]);
    char v47 = sub_253E822F0();
    uint64_t v48 = *(void (**)(char *, uint64_t))(v5 + 8);
    v48(v46, v4);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v48)(v9, v4);
    uint64_t v14 = v34;
    uint64_t v17 = v38;
    unint64_t v21 = v65;
    if ((v47 & 1) == 0) {
      return v63;
    }
  }
  unint64_t v29 = *(void *)(v50 + 8 * v30);
  if (v29)
  {
LABEL_15:
    int64_t v28 = v30;
LABEL_12:
    uint64_t v23 = (v29 - 1) & v29;
    unint64_t v24 = __clz(__rbit64(v29)) + (v28 << 6);
    int64_t v62 = v28;
    goto LABEL_8;
  }
  while (1)
  {
    int64_t v28 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v28 >= v51)
    {
      int64_t v62 = v49;
      goto LABEL_29;
    }
    unint64_t v29 = *(void *)(v50 + 8 * v28);
    ++v30;
    if (v29) {
      goto LABEL_12;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_253E6C1E8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000253E84270 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v5 = a1 == 0x6574746972776572 && a2 == 0xEE0079726575516ELL;
    if (v5 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v6 = a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563;
      if (v6 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v7 = a1 == 0x6576656972746572 && a2 == 0xEE00736C6F6F5464;
        if (v7 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x7365707974 && a2 == 0xE500000000000000)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          char v9 = sub_253E82780();
          swift_bridgeObjectRelease();
          if (v9) {
            return 4;
          }
          else {
            return 5;
          }
        }
      }
    }
  }
}

unint64_t sub_253E6C440(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6574746972776572;
      break;
    case 2:
      unint64_t result = 0x6E656469666E6F63;
      break;
    case 3:
      unint64_t result = 0x6576656972746572;
      break;
    case 4:
      unint64_t result = 0x7365707974;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E6C50C()
{
  return sub_253E6C440(*v0);
}

uint64_t sub_253E6C514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E6C1E8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E6C53C(uint64_t a1)
{
  unint64_t v2 = sub_253E76D58();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6C578(uint64_t a1)
{
  unint64_t v2 = sub_253E76D58();

  return MEMORY[0x270FA00B8](a1, v2);
}

void QueryDecorationToolRetrievalResponse.encode(to:)()
{
  sub_253E7F994();
  unint64_t v2 = v1;
  sub_253E390C4(&qword_269D983B0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E7FDA8();
  sub_253E80544(v2);
  sub_253E76D58();
  sub_253E82860();
  sub_253E802B0();
  sub_253E82710();
  if (!v0)
  {
    sub_253E7FB14();
    sub_253E82730();
    sub_253E390C4(&qword_269D983C0);
    sub_253E76DA4();
    sub_253E7FCD8();
    sub_253E390C4(&qword_269D983D8);
    sub_253E76E48();
    sub_253E7FCD8();
  }
  sub_253E7FA4C();
  v4();
  sub_253E460A0();
  sub_253E7FA70();
}

void QueryDecorationToolRetrievalResponse.init(from:)()
{
  sub_253E7F994();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  sub_253E390C4(&qword_269D983F8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v5);
  sub_253E5C1FC();
  BOOL v6 = (void *)sub_253E7FFC0();
  sub_253E39108(v6, v7);
  sub_253E76D58();
  sub_253E82850();
  if (v0)
  {
    sub_253E393E4(v2);
  }
  else
  {
    uint64_t v8 = sub_253E8030C();
    uint64_t v10 = v9;
    uint64_t v18 = v8;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_253E8030C();
    uint64_t v19 = v12;
    uint64_t v17 = v11;
    LOBYTE(v20) = 2;
    swift_bridgeObjectRetain();
    sub_253E82660();
    int v14 = v13;
    sub_253E390C4(&qword_269D983C0);
    sub_253E76F24();
    sub_253E80108();
    sub_253E8012C();
    sub_253E390C4(&qword_269D983D8);
    unint64_t v15 = sub_253E76FC8();
    swift_bridgeObjectRetain();
    sub_253E80108();
    sub_253E8012C();
    sub_253E45CE4();
    v16();
    if (v15)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_253E393E4(v2);
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)uint64_t v4 = v18;
      *(void *)(v4 + 8) = v10;
      *(void *)(v4 + 16) = v17;
      *(void *)(v4 + 24) = v19;
      *(_DWORD *)(v4 + 32) = v14;
      *(void *)(v4 + 40) = v20;
      *(void *)(v4 + 48) = v20;
      sub_253E393E4(v2);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_253E46150();
  sub_253E7FA70();
}

void sub_253E6CAB4()
{
}

void sub_253E6CACC()
{
}

uint64_t ToolRetrievalType.identifier.getter()
{
  sub_253E822A0();
  sub_253E5C174();
  uint64_t v0 = sub_253E39ECC();

  return v1(v0);
}

uint64_t ToolRetrievalType.identifier.setter()
{
  sub_253E80120();
  sub_253E822A0();
  sub_253E5C174();
  uint64_t v0 = sub_253E801F4();

  return v1(v0);
}

uint64_t (*ToolRetrievalType.identifier.modify())()
{
  return nullsub_1;
}

uint64_t ToolRetrievalType.definition.getter()
{
  return sub_253E6CBE4((void (*)(void))type metadata accessor for ToolRetrievalType, MEMORY[0x263F805E8]);
}

uint64_t sub_253E6CBE4(void (*a1)(void), void (*a2)(uint64_t))
{
  a1(0);
  uint64_t v3 = sub_253E8048C();
  a2(v3);
  sub_253E5C174();
  uint64_t v4 = sub_253E7FDCC();

  return v5(v4);
}

uint64_t ToolRetrievalType.definition.setter(uint64_t a1)
{
  return sub_253E6CC88(a1, (void (*)(void))type metadata accessor for ToolRetrievalType, MEMORY[0x263F805E8]);
}

uint64_t sub_253E6CC88(uint64_t a1, void (*a2)(void), void (*a3)(uint64_t))
{
  a2(0);
  uint64_t v5 = sub_253E8048C();
  a3(v5);
  sub_253E5C174();
  uint64_t v6 = sub_253E804AC();

  return v7(v6, a1);
}

uint64_t (*ToolRetrievalType.definition.modify())(void)
{
  uint64_t v0 = sub_253E80120();
  type metadata accessor for ToolRetrievalType(v0);
  return nullsub_1;
}

uint64_t ToolRetrievalType.init(identifier:definition:)()
{
  sub_253E80144();
  sub_253E822A0();
  sub_253E5C174();
  sub_253E7FDCC();
  sub_253E7FE94();
  v0();
  type metadata accessor for ToolRetrievalType(0);
  sub_253E82280();
  sub_253E5C174();
  uint64_t v1 = sub_253E801F4();

  return v2(v1);
}

uint64_t static ToolRetrievalType.== infix(_:_:)()
{
  sub_253E80144();
  if ((sub_253E82290() & 1) == 0) {
    return 0;
  }
  uint64_t v2 = *(int *)(type metadata accessor for ToolRetrievalType(0) + 20);

  return MEMORY[0x270F80090](v1 + v2, v0 + v2);
}

uint64_t sub_253E6CE3C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6974696E69666564 && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_253E6CF3C(char a1)
{
  if (a1) {
    return 0x6974696E69666564;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_253E6CF78()
{
  return sub_253E6CF3C(*v0);
}

uint64_t sub_253E6CF80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E6CE3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E6CFA8(uint64_t a1)
{
  unint64_t v2 = sub_253E770C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6CFE4(uint64_t a1)
{
  unint64_t v2 = sub_253E770C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void ToolRetrievalType.encode(to:)()
{
  sub_253E803CC();
  sub_253E800C4();
  sub_253E390C4(&qword_269D98428);
  sub_253E3B950();
  MEMORY[0x270FA5388](v1);
  sub_253E7F9A8();
  sub_253E770C4();
  sub_253E5C544();
  sub_253E822A0();
  sub_253E75E08(&qword_269D983E8, MEMORY[0x263F80768]);
  sub_253E7FEFC();
  if (!v0)
  {
    type metadata accessor for ToolRetrievalType(0);
    sub_253E82280();
    sub_253E75E08(&qword_269D983F0, MEMORY[0x263F805E8]);
    sub_253E80464();
    sub_253E7FF84();
  }
  uint64_t v2 = sub_253E5C288();
  v3(v2);
  sub_253E80344();
}

void ToolRetrievalType.init(from:)()
{
  sub_253E45CF0();
  uint64_t v4 = v3;
  uint64_t v17 = sub_253E82280();
  sub_253E3B950();
  uint64_t v16 = v5;
  MEMORY[0x270FA5388](v6);
  sub_253E80070();
  sub_253E822A0();
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  sub_253E5C3E4(v8, v15);
  sub_253E390C4(&qword_269D98438);
  sub_253E3B950();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_253E80054();
  uint64_t v11 = type metadata accessor for ToolRetrievalType(v10);
  sub_253E5C174();
  MEMORY[0x270FA5388](v12);
  sub_253E4AE88();
  sub_253E39108(v4, v4[3]);
  sub_253E770C4();
  sub_253E82850();
  if (v0)
  {
    sub_253E393E4((uint64_t)v4);
  }
  else
  {
    sub_253E75E08(&qword_269D98418, MEMORY[0x263F80768]);
    sub_253E82680();
    sub_253E7FA04();
    v13();
    sub_253E75E08(&qword_269D98420, MEMORY[0x263F805E8]);
    sub_253E80458();
    sub_253E82680();
    sub_253E4AE7C();
    v14();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v1 + *(int *)(v11 + 20), v2, v17);
    sub_253E7626C();
    sub_253E393E4((uint64_t)v4);
    sub_253E75DB8();
  }
  sub_253E45D2C();
}

void sub_253E6D4E0()
{
}

void sub_253E6D4F8()
{
}

uint64_t QueryDecorationLookback.previousAppEntities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t QueryDecorationLookback.init(previousAppEntities:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

unint64_t QueryDecorationLookback.description.getter()
{
  return 0xD000000000000016;
}

uint64_t static QueryDecorationLookback.== infix(_:_:)(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a1)
  {
    if (v2)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = swift_bridgeObjectRetain();
      char v4 = sub_253E728CC(v3, v2);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v4) {
        return 1;
      }
    }
  }
  else if (!v2)
  {
    return 1;
  }
  return 0;
}

uint64_t sub_253E6D63C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x8000000253E84290)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_253E82780();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_253E6D6C4()
{
  return 0xD000000000000013;
}

uint64_t sub_253E6D6E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E6D63C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_253E6D710(uint64_t a1)
{
  unint64_t v2 = sub_253E77110();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6D74C(uint64_t a1)
{
  unint64_t v2 = sub_253E77110();

  return MEMORY[0x270FA00B8](a1, v2);
}

void QueryDecorationLookback.encode(to:)()
{
  sub_253E45CF0();
  uint64_t v1 = v0;
  sub_253E390C4(&qword_269D98448);
  sub_253E3B950();
  MEMORY[0x270FA5388](v2);
  sub_253E4AE88();
  sub_253E39108(v1, v1[3]);
  sub_253E77110();
  sub_253E82860();
  sub_253E390C4(&qword_269D98458);
  sub_253E7715C();
  sub_253E826F0();
  sub_253E7F9F8();
  v3();
  sub_253E45D2C();
}

void QueryDecorationLookback.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_253E45CF0();
  uint64_t v12 = v11;
  int v14 = v13;
  sub_253E390C4(&qword_269D98470);
  sub_253E3B950();
  MEMORY[0x270FA5388](v15);
  sub_253E4AE88();
  sub_253E7FEA0();
  sub_253E77110();
  sub_253E82850();
  if (!v10)
  {
    sub_253E390C4(&qword_269D98458);
    sub_253E77220();
    sub_253E82620();
    sub_253E801B0();
    sub_253E45CE4();
    v16();
    *int v14 = a10;
  }
  sub_253E393E4(v12);
  sub_253E8050C();
  sub_253E45D2C();
}

void sub_253E6D9A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  QueryDecorationLookback.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void sub_253E6D9BC()
{
}

uint64_t IdentifiedEntityValue.hash(into:)()
{
  sub_253E80120();
  sub_253E82240();
  sub_253E3B950();
  MEMORY[0x270FA5388](v0);
  uint64_t v1 = sub_253E80054();
  type metadata accessor for IdentifiedEntityValue(v1);
  sub_253E5C174();
  MEMORY[0x270FA5388](v2);
  sub_253E7FAC4();
  sub_253E7626C();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_253E390C4(&qword_269D98488);
    sub_253E7FA04();
    v3();
    sub_253E82810();
    sub_253E75E08(&qword_269D98490, MEMORY[0x263F80508]);
    sub_253E822E0();
    sub_253E82360();
    sub_253E802A4();
    sub_253E7FDD8();
    v4();
  }
  else
  {
    sub_253E82810();
    sub_253E82360();
    swift_bridgeObjectRelease();
    sub_253E82360();
  }
  return swift_bridgeObjectRelease();
}

void static IdentifiedEntityValue.== infix(_:_:)()
{
  sub_253E5C31C();
  uint64_t v3 = sub_253E82240();
  sub_253E3B950();
  uint64_t v39 = v4;
  MEMORY[0x270FA5388](v5);
  sub_253E4AEA0();
  type metadata accessor for IdentifiedEntityValue(0);
  sub_253E5C174();
  MEMORY[0x270FA5388](v6);
  sub_253E7FE84();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v38 - v8);
  uint64_t v10 = sub_253E390C4(&qword_269D98498);
  uint64_t v11 = sub_253E5C41C(v10);
  MEMORY[0x270FA5388](v11);
  sub_253E80000();
  int v13 = (void *)(v0 + v12);
  sub_253E7626C();
  sub_253E7626C();
  sub_253E7FFC0();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = v2;
    uint64_t v15 = v39;
    sub_253E80414();
    sub_253E7626C();
    uint64_t v16 = *(int *)(sub_253E390C4(&qword_269D98488) + 48);
    uint64_t v18 = *(void *)(v1 + v16);
    uint64_t v17 = *(void *)(v1 + v16 + 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = *(void *)((char *)v13 + v16 + 8);
      uint64_t v38 = *(void *)((char *)v13 + v16);
      uint64_t v20 = v15;
      uint64_t v21 = v3;
      uint64_t v22 = v14;
      sub_253E7FA04();
      v23();
      char v24 = sub_253E82230();
      uint64_t v25 = *(void (**)(void))(v20 + 8);
      sub_253E7F9F8();
      v25();
      if (v24)
      {
        if (v18 != v38 || v17 != v19)
        {
          char v27 = sub_253E82780();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_253E7F9F8();
          v25();
          if (v27) {
            goto LABEL_33;
          }
LABEL_22:
          sub_253E75DB8();
          goto LABEL_34;
        }
        swift_bridgeObjectRelease_n();
        ((void (*)(uint64_t, uint64_t))v25)(v22, v21);
        goto LABEL_33;
      }
      sub_253E7F9F8();
      v25();
      swift_bridgeObjectRelease();
LABEL_21:
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v1, v3);
  }
  else
  {
    sub_253E7626C();
    uint64_t v29 = *v9;
    uint64_t v28 = v9[1];
    uint64_t v31 = v9[2];
    uint64_t v30 = v9[3];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v33 = v13[2];
      uint64_t v32 = v13[3];
      if (v29 == *v13 && v28 == v13[1])
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v35 = sub_253E82780();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v35 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_21;
        }
      }
      if (v31 != v33 || v30 != v32)
      {
        sub_253E7FDCC();
        sub_253E80438();
        char v37 = sub_253E82780();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v37) {
          goto LABEL_33;
        }
        goto LABEL_22;
      }
      swift_bridgeObjectRelease_n();
LABEL_33:
      sub_253E75DB8();
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_253E4CA94(v0, &qword_269D98498);
LABEL_34:
  sub_253E5C2D8();
}

uint64_t sub_253E6DFA8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x676E69727473 && a2 == 0xE600000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_253E6E09C(char a1)
{
  if (a1) {
    return 0x6C61566465707974;
  }
  else {
    return 0x676E69727473;
  }
}

uint64_t sub_253E6E0D4(uint64_t a1, uint64_t a2)
{
  BOOL v4 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v4 || (sub_253E80144(), (sub_253E80378() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (v3 == 12639 && v2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_253E80378();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_253E6E178(char a1)
{
  if (a1) {
    return 12639;
  }
  else {
    return 12383;
  }
}

uint64_t sub_253E6E190()
{
  return sub_253E6E09C(*v0);
}

uint64_t sub_253E6E198@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E6DFA8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E6E1C0(uint64_t a1)
{
  unint64_t v2 = sub_253E772C4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6E1FC(uint64_t a1)
{
  unint64_t v2 = sub_253E772C4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E6E238(uint64_t a1)
{
  unint64_t v2 = sub_253E7735C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6E274(uint64_t a1)
{
  unint64_t v2 = sub_253E7735C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_253E6E2B0()
{
  return sub_253E6E178(*v0);
}

uint64_t sub_253E6E2B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E6E0D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E6E2E0(uint64_t a1)
{
  unint64_t v2 = sub_253E77310();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6E31C(uint64_t a1)
{
  unint64_t v2 = sub_253E77310();

  return MEMORY[0x270FA00B8](a1, v2);
}

void IdentifiedEntityValue.encode(to:)()
{
  sub_253E45CF0();
  sub_253E390C4(&qword_269D984A0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v2);
  sub_253E5C0EC();
  sub_253E7FF28();
  sub_253E82240();
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E45F88();
  sub_253E390C4(&qword_269D984A8);
  sub_253E3B950();
  uint64_t v13 = v5;
  uint64_t v14 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = sub_253E7FC50();
  type metadata accessor for IdentifiedEntityValue(v6);
  sub_253E5C174();
  MEMORY[0x270FA5388](v7);
  sub_253E7FADC();
  sub_253E390C4(&qword_269D984B0);
  sub_253E3B950();
  MEMORY[0x270FA5388](v8);
  sub_253E45DFC();
  sub_253E7F9A8();
  sub_253E772C4();
  sub_253E82860();
  sub_253E7626C();
  sub_253E80408();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_253E390C4(&qword_269D98488);
    sub_253E7FA04();
    v9();
    sub_253E77310();
    sub_253E826A0();
    sub_253E75E08(&qword_26B257820, MEMORY[0x263F80508]);
    sub_253E80458();
    sub_253E82750();
    if (!v0) {
      sub_253E82710();
    }
    swift_bridgeObjectRelease();
    sub_253E4AE7C();
    v10();
    sub_253E4AE7C();
    v11();
  }
  else
  {
    sub_253E7735C();
    sub_253E826A0();
    sub_253E82710();
    swift_bridgeObjectRelease();
    if (!v0) {
      sub_253E82710();
    }
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v14);
  }
  sub_253E7FFCC();
  sub_253E4AE7C();
  v12();
  sub_253E8050C();
  sub_253E45D2C();
}

uint64_t IdentifiedEntityValue.hashValue.getter()
{
  return sub_253E6E740((void (*)(unsigned char *))IdentifiedEntityValue.hash(into:));
}

uint64_t sub_253E6E740(void (*a1)(unsigned char *))
{
  sub_253E5C468();
  a1(v3);
  return sub_253E82840();
}

void IdentifiedEntityValue.init(from:)()
{
  sub_253E45CF0();
  uint64_t v62 = v0;
  uint64_t v5 = v4;
  uint64_t v54 = v6;
  uint64_t v60 = sub_253E390C4(&qword_269D984D0);
  sub_253E3B950();
  uint64_t v57 = v7;
  MEMORY[0x270FA5388](v8);
  sub_253E5C3E4(v9, v51[0]);
  sub_253E390C4(&qword_269D984D8);
  sub_253E3B950();
  uint64_t v55 = v11;
  uint64_t v56 = v10;
  MEMORY[0x270FA5388](v10);
  sub_253E7FBC4(v12, v51[0]);
  uint64_t v13 = sub_253E390C4(&qword_269D984E0);
  sub_253E3B950();
  uint64_t v59 = v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v16 = sub_253E7FC18();
  uint64_t v17 = type metadata accessor for IdentifiedEntityValue(v16);
  sub_253E5C174();
  MEMORY[0x270FA5388](v18);
  sub_253E80238();
  sub_253E801E4();
  MEMORY[0x270FA5388](v19);
  sub_253E7FE84();
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v51 - v21;
  uint64_t v23 = v5[3];
  uint64_t v61 = v5;
  sub_253E39108(v5, v23);
  sub_253E772C4();
  uint64_t v24 = v62;
  sub_253E82850();
  if (v24) {
    goto LABEL_9;
  }
  v51[0] = v1;
  v51[1] = (uint64_t)v22;
  uint64_t v52 = v2;
  uint64_t v62 = v17;
  uint64_t v25 = sub_253E82690();
  uint64_t v26 = *(void *)(v25 + 16);
  if (!v26)
  {
LABEL_7:
    uint64_t v32 = v62;
    sub_253E82520();
    sub_253E5C5FC();
    uint64_t v34 = v33;
    sub_253E390C4(&qword_269D976A0);
    *uint64_t v34 = v32;
    sub_253E825D0();
    sub_253E7FDE4();
    sub_253E5C1BC();
    (*(void (**)(uint64_t *))(v35 + 104))(v34);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v3, v13);
    goto LABEL_9;
  }
  uint64_t v53 = v13;
  char v27 = *(unsigned char *)(v25 + 32);
  sub_253E4AD60(1, v26, v25, v25 + 32, 0, (2 * v26) | 1);
  uint64_t v29 = v28;
  unint64_t v31 = v30;
  swift_bridgeObjectRelease();
  if (v29 != v31 >> 1)
  {
    uint64_t v13 = v53;
    goto LABEL_7;
  }
  if (v27)
  {
    sub_253E77310();
    sub_253E80358();
    sub_253E82240();
    sub_253E75E08(&qword_269D97738, MEMORY[0x263F80508]);
    sub_253E80458();
    sub_253E80438();
    sub_253E82680();
    uint64_t v58 = sub_253E82640();
    uint64_t v56 = v39;
    uint64_t v40 = sub_253E390C4(&qword_269D98488);
    unint64_t v41 = (uint64_t *)(v52 + *(int *)(v40 + 48));
    sub_253E4AE7C();
    v42();
    swift_unknownObjectRelease();
    sub_253E7FA4C();
    v43();
    uint64_t v44 = v56;
    *unint64_t v41 = v58;
    v41[1] = v44;
  }
  else
  {
    sub_253E7735C();
    sub_253E80358();
    uint64_t v36 = sub_253E82640();
    uint64_t v38 = v37;
    uint64_t v60 = sub_253E82640();
    uint64_t v46 = v45;
    sub_253E45CE4();
    v47();
    swift_unknownObjectRelease();
    uint64_t v48 = sub_253E80290();
    v49(v48);
    uint64_t v50 = (void *)v51[0];
    *(void *)v51[0] = v36;
    v50[1] = v38;
    v50[2] = v60;
    v50[3] = v46;
  }
  swift_storeEnumTagMultiPayload();
  sub_253E76018();
  sub_253E76018();
LABEL_9:
  sub_253E393E4((uint64_t)v61);
  sub_253E8050C();
  sub_253E45D2C();
}

uint64_t sub_253E6EDCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_253E6EDE4(a1, a2, a3, (void (*)(unsigned char *))IdentifiedEntityValue.hash(into:));
}

uint64_t sub_253E6EDE4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unsigned char *))
{
  sub_253E82800();
  a4(v6);
  return sub_253E82840();
}

void sub_253E6EE28()
{
}

void sub_253E6EE40()
{
}

uint64_t IdentifiedEntityValue.description.getter()
{
  sub_253E82240();
  sub_253E3B950();
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = sub_253E7FC34();
  type metadata accessor for IdentifiedEntityValue(v2);
  sub_253E5C174();
  MEMORY[0x270FA5388](v3);
  sub_253E7FAC4();
  sub_253E7626C();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_253E390C4(&qword_269D98488);
    sub_253E7FDCC();
    sub_253E7FA04();
    v4();
    sub_253E82540();
    sub_253E82380();
    sub_253E82380();
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
    uint64_t v6 = sub_253E7FF78();
    v7(v6);
  }
  else
  {
    uint64_t v9 = *v0;
    sub_253E82380();
    sub_253E82380();
    swift_bridgeObjectRelease();
    return v9;
  }
  return v5;
}

uint64_t SpanMatchedEntity.typedValue.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E773A8(v1, a1, &qword_26B257828);
}

uint64_t SpanMatchedEntity.matchMetadata.getter()
{
  type metadata accessor for SpanMatchedEntity(0);

  return swift_bridgeObjectRetain();
}

uint64_t static SpanMatchedEntity.== infix(_:_:)()
{
  uint64_t v2 = sub_253E80150();
  uint64_t v3 = *(int *)(type metadata accessor for SpanMatchedEntity(v2) + 20);
  uint64_t v4 = *(void **)(v1 + v3);
  if (v4[2])
  {
    uint64_t v6 = v4[8];
    uint64_t v5 = v4[9];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *(void **)(v0 + v3);
  if (v7[2])
  {
    uint64_t v9 = v7[8];
    uint64_t v8 = v7[9];
    swift_bridgeObjectRetain();
    if (v5)
    {
      if (v8)
      {
        if (v6 == v9 && v5 == v8)
        {
          swift_bridgeObjectRelease();
          char v11 = 1;
        }
        else
        {
          sub_253E7FDCC();
          char v11 = sub_253E82780();
          swift_bridgeObjectRelease();
        }
        goto LABEL_18;
      }
      goto LABEL_13;
    }
    if (v8)
    {
      char v11 = 0;
      goto LABEL_18;
    }
  }
  else if (v5)
  {
LABEL_13:
    char v11 = 0;
LABEL_18:
    swift_bridgeObjectRelease();
    return v11 & 1;
  }
  char v11 = 1;
  return v11 & 1;
}

uint64_t SpanMatchedEntity.init(typedValue:matchMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_253E7F868(a1, a3, &qword_26B257828);
  uint64_t result = type metadata accessor for SpanMatchedEntity(0);
  *(void *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

unint64_t SpanMatchedEntity.debugDescription.getter()
{
  sub_253E390C4(&qword_26B257828);
  sub_253E5C174();
  MEMORY[0x270FA5388](v0);
  sub_253E5C184();
  sub_253E800FC();
  sub_253E824F0();
  swift_bridgeObjectRelease();
  uint64_t v1 = sub_253E7FFC0();
  sub_253E773A8(v1, v2, &qword_26B257828);
  sub_253E82340();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E7FCA0();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E824F0();
  swift_bridgeObjectRelease();
  sub_253E800FC();
  type metadata accessor for SpanMatchedEntity(0);
  uint64_t v3 = swift_bridgeObjectRetain();
  MEMORY[0x25A270F00](v3, &type metadata for EntityMatch);
  swift_bridgeObjectRelease();
  sub_253E80278();
  swift_bridgeObjectRelease();
  sub_253E7FCA0();
  sub_253E82380();
  swift_bridgeObjectRelease();
  sub_253E82380();
  return 0xD000000000000013;
}

uint64_t sub_253E6F330(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74654D686374616DLL && a2 == 0xED00006174616461)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_253E6F450(char a1)
{
  if (a1) {
    return 0x74654D686374616DLL;
  }
  else {
    return 0x6C61566465707974;
  }
}

uint64_t sub_253E6F498()
{
  return sub_253E6F450(*v0);
}

uint64_t sub_253E6F4A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E6F330(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E6F4C8(uint64_t a1)
{
  unint64_t v2 = sub_253E773F8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E6F504(uint64_t a1)
{
  unint64_t v2 = sub_253E773F8();

  return MEMORY[0x270FA00B8](a1, v2);
}

void SpanMatchedEntity.encode(to:)()
{
  sub_253E803CC();
  sub_253E800C4();
  sub_253E390C4(&qword_269D984E8);
  sub_253E3B950();
  MEMORY[0x270FA5388](v1);
  sub_253E7F9A8();
  sub_253E773F8();
  sub_253E5C544();
  sub_253E82240();
  sub_253E75E08(&qword_26B257820, MEMORY[0x263F80508]);
  sub_253E826F0();
  if (!v0)
  {
    type metadata accessor for SpanMatchedEntity(0);
    sub_253E390C4(&qword_269D984F8);
    sub_253E77490(&qword_269D98500, &qword_269D984F8, (void (*)(void))sub_253E77444);
    sub_253E80444();
    sub_253E7FF84();
  }
  uint64_t v2 = sub_253E5C288();
  v3(v2);
  sub_253E80344();
}

void SpanMatchedEntity.init(from:)()
{
  sub_253E45CF0();
  uint64_t v4 = v3;
  uint64_t v5 = sub_253E390C4(&qword_26B257828);
  uint64_t v6 = sub_253E5C41C(v5);
  MEMORY[0x270FA5388](v6);
  sub_253E7FD60();
  sub_253E390C4(&qword_269D98510);
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  sub_253E45F88();
  uint64_t v8 = type metadata accessor for SpanMatchedEntity(0);
  sub_253E5C174();
  MEMORY[0x270FA5388](v9);
  sub_253E5C184();
  uint64_t v10 = (void *)sub_253E80414();
  sub_253E39108(v10, v11);
  sub_253E773F8();
  sub_253E802EC();
  sub_253E82850();
  if (v0)
  {
    sub_253E393E4(v4);
  }
  else
  {
    sub_253E82240();
    sub_253E75E08(&qword_269D97738, MEMORY[0x263F80508]);
    sub_253E82620();
    sub_253E7F868(v2, v1, &qword_26B257828);
    sub_253E390C4(&qword_269D984F8);
    sub_253E77490(&qword_269D98518, &qword_269D984F8, (void (*)(void))sub_253E774FC);
    sub_253E80438();
    sub_253E82680();
    sub_253E7F9F8();
    v12();
    *(void *)(v1 + *(int *)(v8 + 20)) = v13;
    sub_253E7626C();
    sub_253E393E4(v4);
    sub_253E75DB8();
  }
  sub_253E45D2C();
}

void sub_253E6F9B8()
{
}

void sub_253E6F9D0()
{
}

uint64_t EntityMatch.entityId.getter()
{
  return sub_253E39ECC();
}

uint64_t EntityMatch.identifier.getter()
{
  return sub_253E39ECC();
}

uint64_t EntityMatch.sourceItemIdentifier.getter()
{
  return sub_253E39ECC();
}

uint64_t EntityMatch.entityName.getter()
{
  return sub_253E39ECC();
}

uint64_t EntityMatch.startIndex.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t EntityMatch.endIndex.getter()
{
  return *(void *)(v0 + 72);
}

float EntityMatch.matchScore.getter()
{
  return *(float *)(v0 + 80);
}

void EntityMatch.matchProperties.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 104);
  char v4 = *(unsigned char *)(v1 + 112);
  int v5 = *(_DWORD *)(v1 + 116);
  char v6 = *(unsigned char *)(v1 + 120);
  *(void *)a1 = *(void *)(v1 + 88);
  *(unsigned char *)(a1 + 8) = v2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 28) = v5;
  *(unsigned char *)(a1 + 32) = v6;
}

void EntityMatch.matcherType.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 121);
}

uint64_t EntityMatch.originAppBundleId.getter()
{
  return sub_253E39ECC();
}

uint64_t EntityMatch.userUtterance.getter()
{
  return sub_253E39ECC();
}

uint64_t EntityMatch.init(identifier:sourceItemIdentifier:startStrIndex:endStrIndex:userUtterance:entityName:matchScore:matchProperties:matcherType:originAppBundleId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, float a8@<S0>, uint64_t a9, uint64_t a10, uint64_t *a11, char *a12, uint64_t a13, uint64_t a14)
{
  sub_253E82140();
  sub_253E3B950();
  MEMORY[0x270FA5388](v20);
  sub_253E7FAC4();
  char v21 = *((unsigned char *)a11 + 8);
  uint64_t v35 = a11[2];
  uint64_t v36 = *a11;
  char v22 = *((unsigned char *)a11 + 24);
  char v23 = *((unsigned char *)a11 + 32);
  char v33 = *a12;
  int v34 = *((_DWORD *)a11 + 7);
  uint64_t v24 = a6;
  uint64_t v25 = a5;
  swift_bridgeObjectRetain();
  uint64_t v32 = sub_253E823A0();
  uint64_t result = sub_253E823A0();
  char v38 = v22;
  if (a2)
  {
    uint64_t v27 = a1;
  }
  else
  {
    uint64_t v28 = result;
    sub_253E82130();
    uint64_t v27 = sub_253E82120();
    a2 = v29;
    sub_253E801BC();
    sub_253E4AE7C();
    v30();
    uint64_t result = v28;
    char v22 = v38;
  }
  *(void *)a7 = a3;
  *(void *)(a7 + 8) = a4;
  *(void *)(a7 + 16) = v27;
  *(void *)(a7 + 24) = a2;
  *(void *)(a7 + 32) = a3;
  *(void *)(a7 + 40) = a4;
  *(void *)(a7 + 48) = a9;
  *(void *)(a7 + 56) = a10;
  *(void *)(a7 + 64) = v32;
  *(void *)(a7 + 72) = result;
  *(float *)(a7 + 80) = a8;
  *(void *)(a7 + 88) = v36;
  *(unsigned char *)(a7 + 96) = v21;
  *(void *)(a7 + 104) = v35;
  *(unsigned char *)(a7 + 112) = v22;
  *(_DWORD *)(a7 + 116) = v34;
  *(unsigned char *)(a7 + 120) = v23;
  *(unsigned char *)(a7 + 121) = v33;
  *(void *)(a7 + 128) = a13;
  *(void *)(a7 + 136) = a14;
  *(void *)(a7 + 144) = v25;
  *(void *)(a7 + 152) = v24;
  return result;
}

uint64_t EntityMatch.init(identifier:sourceItemIdentifier:startIndex:endIndex:userUtterance:entityName:matchScore:matchProperties:matcherType:originAppBundleId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, float a10@<S0>, uint64_t a11, uint64_t a12, uint64_t *a13, char *a14, uint64_t a15, uint64_t a16)
{
  sub_253E82140();
  sub_253E3B950();
  MEMORY[0x270FA5388](v20);
  sub_253E7FAC4();
  char v21 = *((unsigned char *)a13 + 8);
  uint64_t v31 = a13[2];
  uint64_t v32 = *a13;
  char v22 = *((unsigned char *)a13 + 24);
  char v23 = *((unsigned char *)a13 + 32);
  char v29 = *a14;
  int v30 = *((_DWORD *)a13 + 7);
  if (a2)
  {
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v25 = a1;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_253E82130();
    uint64_t v25 = sub_253E82120();
    a2 = v26;
    sub_253E7F9F8();
    uint64_t result = v27();
  }
  *(void *)a9 = a3;
  *(void *)(a9 + 8) = a4;
  *(void *)(a9 + 16) = v25;
  *(void *)(a9 + 24) = a2;
  *(void *)(a9 + 32) = a3;
  *(void *)(a9 + 40) = a4;
  *(void *)(a9 + 48) = a11;
  *(void *)(a9 + 56) = a12;
  *(void *)(a9 + 64) = a5;
  *(void *)(a9 + 72) = a6;
  *(float *)(a9 + 80) = a10;
  *(void *)(a9 + 88) = v32;
  *(unsigned char *)(a9 + 96) = v21;
  *(void *)(a9 + 104) = v31;
  *(unsigned char *)(a9 + 112) = v22;
  *(_DWORD *)(a9 + 116) = v30;
  *(unsigned char *)(a9 + 120) = v23;
  *(unsigned char *)(a9 + 121) = v29;
  *(void *)(a9 + 128) = a15;
  *(void *)(a9 + 136) = a16;
  *(void *)(a9 + 144) = a7;
  *(void *)(a9 + 152) = a8;
  return result;
}

void *EntityMatch.init(entityName:matchedUserUtterance:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v8 = 0;
  char v9 = 1;
  uint64_t v10 = 0;
  char v11 = 1;
  int v12 = 0;
  char v13 = 1;
  char v7 = 0;
  EntityMatch.init(identifier:sourceItemIdentifier:startStrIndex:endStrIndex:userUtterance:entityName:matchScore:matchProperties:matcherType:originAppBundleId:)(0, 0, 0, 0xE000000000000000, a3, a4, (uint64_t)__src, 0.0, a1, a2, &v8, &v7, 0, 0xE000000000000000);
  return memcpy(a5, __src, 0xA0uLL);
}

uint64_t MatchProperties.init(maxTokenCount:matchedTokenCount:matchedAliasTypes:)@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X2>, char a4@<W3>, int *a5@<X4>, uint64_t a6@<X8>)
{
  int v6 = *a5;
  char v7 = *((unsigned char *)a5 + 4);
  *(void *)a6 = result;
  *(unsigned char *)(a6 + 8) = a2 & 1;
  *(void *)(a6 + 16) = a3;
  *(unsigned char *)(a6 + 24) = a4 & 1;
  *(_DWORD *)(a6 + 28) = v6;
  *(unsigned char *)(a6 + 32) = v7;
  return result;
}

void *EntityMatch.init(sourceItemIdentifier:startStrIndex:endStrIndex:userUtterance:entityName:matchScore:matchProperties:originAppBundleId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, void *a7@<X8>, float a8@<S0>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (*(unsigned char *)(a9 + 33))
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    int v14 = 0;
    char v15 = 1;
    LOBYTE(v16) = 1;
    char v17 = 1;
  }
  else
  {
    int v14 = *(_DWORD *)(a9 + 28);
    uint64_t v13 = *(void *)(a9 + 16);
    uint64_t v12 = *(void *)a9;
    char v15 = *(unsigned char *)(a9 + 8) & 1;
    int v16 = *(_DWORD *)(a9 + 24) & 1;
    char v17 = *(unsigned char *)(a9 + 32) & 1;
  }
  uint64_t v20 = v12;
  char v21 = v15;
  uint64_t v22 = v13;
  char v23 = v16;
  int v24 = v14;
  char v25 = v17;
  char v19 = 0;
  EntityMatch.init(identifier:sourceItemIdentifier:startStrIndex:endStrIndex:userUtterance:entityName:matchScore:matchProperties:matcherType:originAppBundleId:)(0, 0, a1, a2, a3, a4, (uint64_t)__src, a8, a5, a6, &v20, &v19, a10, a11);
  return memcpy(a7, __src, 0xA0uLL);
}

unint64_t EntityMatch.description.getter()
{
  return 0xD000000000000011;
}

unint64_t EntityMatch.matchedUserUtterance.getter()
{
  memcpy(__dst, v0, sizeof(__dst));
  uint64_t v1 = sub_253E82370();
  if (v2 & 1) != 0 || (v3 = v1, unint64_t result = sub_253E82370(), (v5))
  {
    if (qword_269D97320 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_253E821C0();
    sub_253E5DBD0(v7, (uint64_t)qword_269D97C90);
    sub_253E77548((uint64_t)__dst);
    uint64_t v8 = sub_253E821A0();
    os_log_type_t v9 = sub_253E82480();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 134218498;
      sub_253E824B0();
      *(_WORD *)(v10 + 12) = 2048;
      sub_253E824B0();
      *(_WORD *)(v10 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_253E7FF78();
      sub_253E5F7BC(v11, v12, v13);
      sub_253E824B0();
      swift_bridgeObjectRelease();
      sub_253E775C0((uint64_t)__dst);
      _os_log_impl(&dword_253E37000, v8, v9, "[EntityMatch] invalid index when getting matchedUserUtterance. startIndex: %ld, endIndex: %ld, userUtterance: %s", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x25A271760](v14, -1, -1);
      MEMORY[0x25A271760](v10, -1, -1);
    }
    else
    {
      sub_253E775C0((uint64_t)__dst);
    }

    return sub_253E39ECC();
  }
  if (result >> 14 >= v3 >> 14)
  {
    uint64_t v6 = sub_253E823B0();
    MEMORY[0x25A270E10](v6);
    swift_bridgeObjectRelease();
    return sub_253E39ECC();
  }
  __break(1u);
  return result;
}

uint64_t EntityMatch.debugString.getter()
{
  return 0;
}

uint64_t sub_253E707C0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6449797469746E65 && a2 == 0xE800000000000000;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
    if (v6 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000014 && a2 == 0x8000000253E842B0 || (sub_253E82780() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      BOOL v7 = a1 == 0x614E797469746E65 && a2 == 0xEA0000000000656DLL;
      if (v7 || (sub_253E82780() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        BOOL v8 = a1 == 0x646E497472617473 && a2 == 0xEA00000000007865;
        if (v8 || (sub_253E82780() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          BOOL v9 = a1 == 0x7865646E49646E65 && a2 == 0xE800000000000000;
          if (v9 || (sub_253E82780() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            BOOL v10 = a1 == 0x6F6353686374616DLL && a2 == 0xEA00000000006572;
            if (v10 || (sub_253E82780() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              BOOL v11 = a1 == 0x6F7250686374616DLL && a2 == 0xEF73656974726570;
              if (v11 || (sub_253E82780() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                BOOL v12 = a1 == 0x547265686374616DLL && a2 == 0xEB00000000657079;
                if (v12 || (sub_253E82780() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else if (a1 == 0xD000000000000011 && a2 == 0x8000000253E842D0 || (sub_253E82780() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 9;
                }
                else if (a1 == 0x6574745572657375 && a2 == 0xED000065636E6172)
                {
                  swift_bridgeObjectRelease();
                  return 10;
                }
                else
                {
                  char v14 = sub_253E82780();
                  swift_bridgeObjectRelease();
                  if (v14) {
                    return 10;
                  }
                  else {
                    return 11;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_253E70C7C()
{
  return 11;
}

unint64_t sub_253E70C84(char a1)
{
  unint64_t result = 0x6449797469746E65;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x696669746E656469;
      break;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0x614E797469746E65;
      break;
    case 4:
      unint64_t result = 0x646E497472617473;
      break;
    case 5:
      unint64_t result = 0x7865646E49646E65;
      break;
    case 6:
      unint64_t result = 0x6F6353686374616DLL;
      break;
    case 7:
      unint64_t result = 0x6F7250686374616DLL;
      break;
    case 8:
      unint64_t result = 0x547265686374616DLL;
      break;
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    case 10:
      unint64_t result = 0x6574745572657375;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_253E70E1C()
{
  return sub_253E70C84(*v0);
}

uint64_t sub_253E70E24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E707C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E70E4C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_253E70C7C();
  *a1 = result;
  return result;
}

uint64_t sub_253E70E74(uint64_t a1)
{
  unint64_t v2 = sub_253E77638();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E70EB0(uint64_t a1)
{
  unint64_t v2 = sub_253E77638();

  return MEMORY[0x270FA00B8](a1, v2);
}

void EntityMatch.encode(to:)()
{
  sub_253E7F994();
  unint64_t v2 = v1;
  sub_253E390C4(&qword_269D98528);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E7FDA8();
  sub_253E803B0(v2);
  sub_253E77638();
  sub_253E82860();
  sub_253E802B0();
  sub_253E82710();
  if (!v0)
  {
    sub_253E8026C(1);
    sub_253E7FB14();
    sub_253E8026C(2);
    sub_253E7FB14();
    sub_253E8026C(3);
    sub_253E7FB14();
    sub_253E82740();
    sub_253E82740();
    sub_253E82730();
    sub_253E77684();
    sub_253E7FCD8();
    sub_253E776D0();
    sub_253E7FCD8();
    sub_253E8026C(9);
    sub_253E7FB14();
    sub_253E8026C(10);
    sub_253E7FB14();
  }
  sub_253E802A4();
  sub_253E7FDD8();
  v4();
  sub_253E460A0();
  sub_253E7FA70();
}

void EntityMatch.init(from:)()
{
  sub_253E7F994();
  uint64_t v77 = v1;
  uint64_t v78 = v2;
  char v4 = v3;
  BOOL v6 = v5;
  sub_253E390C4(&qword_269D98548);
  sub_253E3B950();
  MEMORY[0x270FA5388](v7);
  sub_253E45F88();
  uint64_t v39 = (uint64_t)v4;
  sub_253E80544(v4);
  sub_253E77638();
  sub_253E802EC();
  sub_253E82850();
  if (v0)
  {
    sub_253E393E4((uint64_t)v4);
  }
  else
  {
    uint64_t v35 = v6;
    uint64_t v8 = sub_253E7FAF4();
    uint64_t v10 = v9;
    LOBYTE(v41) = 1;
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_253E7FAF4();
    uint64_t v34 = v8;
    sub_253E80204(2);
    uint64_t v38 = v8;
    uint64_t v32 = sub_253E7FAF4();
    sub_253E80204(3);
    uint64_t v37 = v8;
    uint64_t v31 = sub_253E7FAF4();
    sub_253E80204(4);
    uint64_t v36 = v8;
    uint64_t v30 = sub_253E82670();
    sub_253E7FD48(5);
    uint64_t v11 = sub_253E82670();
    sub_253E7FD48(6);
    sub_253E82660();
    int v13 = v12;
    sub_253E7771C();
    sub_253E7FFD8();
    uint64_t v29 = v11;
    uint64_t v26 = v41;
    uint64_t v27 = v43;
    int v28 = HIDWORD(v44);
    char v24 = v44;
    char v25 = v42;
    char v76 = v42;
    char v74 = v44;
    char v23 = v45;
    char v71 = v45;
    LOBYTE(v40[0]) = 8;
    sub_253E77768();
    sub_253E7FFD8();
    LOBYTE(v41) = 9;
    uint64_t v14 = sub_253E7FAF4();
    uint64_t v16 = v15;
    char v68 = 10;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_253E82640();
    uint64_t v22 = v18;
    uint64_t v19 = v17;
    uint64_t v20 = sub_253E45D44();
    v21(v20);
    v40[0] = v34;
    v40[1] = v10;
    v40[2] = v33;
    v40[3] = v38;
    v40[4] = v32;
    v40[5] = v37;
    v40[6] = v31;
    v40[7] = v36;
    v40[8] = v30;
    v40[9] = v29;
    LODWORD(v40[10]) = v13;
    v40[11] = v26;
    LOBYTE(v40[12]) = v25;
    v40[13] = v27;
    LOBYTE(v40[14]) = v24;
    HIDWORD(v40[14]) = v28;
    LOBYTE(v40[15]) = v23;
    BYTE1(v40[15]) = 1;
    v40[16] = v14;
    v40[17] = v16;
    v40[18] = v19;
    v40[19] = v22;
    sub_253E77548((uint64_t)v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v35, v40, 0xA0uLL);
    sub_253E393E4(v39);
    uint64_t v41 = v34;
    uint64_t v42 = v10;
    uint64_t v43 = v33;
    uint64_t v44 = v38;
    uint64_t v45 = v32;
    uint64_t v46 = v37;
    uint64_t v47 = v31;
    uint64_t v48 = v36;
    uint64_t v49 = v30;
    uint64_t v50 = v29;
    int v51 = v13;
    uint64_t v52 = v26;
    char v53 = v76;
    *(_DWORD *)uint64_t v54 = *(_DWORD *)v75;
    *(_DWORD *)&v54[3] = *(_DWORD *)&v75[3];
    uint64_t v55 = v27;
    char v56 = v74;
    char v58 = v73;
    __int16 v57 = v72;
    int v59 = v28;
    char v60 = v71;
    char v61 = 1;
    __int16 v63 = v70;
    int v62 = v69;
    uint64_t v64 = v14;
    uint64_t v65 = v16;
    uint64_t v66 = v19;
    uint64_t v67 = v22;
    sub_253E775C0((uint64_t)&v41);
  }
  sub_253E46150();
  sub_253E7FA70();
}

void sub_253E71854()
{
}

void sub_253E7186C()
{
}

uint64_t MatchProperties.maxTokenCount.getter()
{
  return *(void *)v0;
}

uint64_t MatchProperties.matchedTokenCount.getter()
{
  return *(void *)(v0 + 16);
}

void MatchProperties.matchedAliasTypes.getter(uint64_t a1@<X8>)
{
}

uint64_t sub_253E718A8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E656B6F5478616DLL && a2 == 0xED0000746E756F43;
  if (v2 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000253E842F0 || (sub_253E82780() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000253E84310)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_253E82780();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_253E71A18(char a1)
{
  if (a1) {
    return 0xD000000000000011;
  }
  else {
    return 0x6E656B6F5478616DLL;
  }
}

uint64_t sub_253E71A84()
{
  return sub_253E82840();
}

uint64_t sub_253E71AC0()
{
  return sub_253E71A18(*v0);
}

uint64_t sub_253E71AC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_253E718A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_253E71AF0(uint64_t a1)
{
  unint64_t v2 = sub_253E777B4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_253E71B2C(uint64_t a1)
{
  unint64_t v2 = sub_253E777B4();

  return MEMORY[0x270FA00B8](a1, v2);
}

void MatchProperties.encode(to:)()
{
  sub_253E45CF0();
  unint64_t v2 = v1;
  sub_253E390C4(&qword_269D98560);
  sub_253E3B950();
  MEMORY[0x270FA5388](v3);
  sub_253E45DFC();
  sub_253E80544(v2);
  sub_253E777B4();
  sub_253E82860();
  sub_253E826E0();
  if (!v0)
  {
    sub_253E826E0();
    sub_253E7FEF0();
    sub_253E77800();
    sub_253E7FA58();
  }
  sub_253E7FA4C();
  v4();
  sub_253E460A0();
  sub_253E45D2C();
}

void MatchProperties.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  sub_253E45CF0();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  sub_253E390C4(&qword_269D98578);
  sub_253E3B950();
  MEMORY[0x270FA5388](v16);
  sub_253E7FEA0();
  sub_253E777B4();
  sub_253E804A0();
  sub_253E82850();
  if (!v11)
  {
    uint64_t v17 = sub_253E82610();
    char v19 = v18;
    sub_253E7FEC0();
    uint64_t v20 = sub_253E82610();
    char v23 = v21;
    uint64_t v24 = v20;
    sub_253E7FEF0();
    sub_253E7784C();
    sub_253E82620();
    sub_253E45CE4();
    v22();
    *(void *)uint64_t v15 = v17;
    *(unsigned char *)(v15 + 8) = v19 & 1;
    *(void *)(v15 + 16) = v24;
    *(unsigned char *)(v15 + 24) = v23 & 1;
    *(_DWORD *)(v15 + 28) = a10;
    *(unsigned char *)(v15 + 32) = a11;
  }
  sub_253E393E4(v13);
  sub_253E45D2C();
}

void sub_253E71E88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  MatchProperties.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, vars8[4]);
}

void sub_253E71EA0()
{
}

uint64_t AliasTypes.rawValue.getter()
{
  return *v0;
}

uint64_t AliasTypes.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static AliasTypes.homeEntity.getter(_DWORD *a1@<X8>)
{
}

void static AliasTypes.synonym.getter(_DWORD *a1@<X8>)
{
}

void static AliasTypes.transliteration.getter(_DWORD *a1@<X8>)
{
}

void static AliasTypes.expandedEmoji.getter(_DWORD *a1@<X8>)
{
}

void static AliasTypes.contactRelationship.getter(_DWORD *a1@<X8>)
{
}

void static AliasTypes.contactHypocorism.getter(_DWORD *a1@<X8>)
{
}

void static AliasTypes.contactHandle.getter(_DWORD *a1@<X8>)
{
}

uint64_t sub_253E71F00@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return AliasTypes.init(rawValue:)(*a1, a2);
}

uint64_t sub_253E71F08()
{
  return sub_253E82410();
}

uint64_t sub_253E71F68()
{
  return sub_253E823E0();
}

uint64_t sub_253E71FB8@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_253E67E88(*a1, *v2, a2);
}

uint64_t sub_253E71FC4@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_253E67E94(*a1, *v2, a2);
}

uint64_t sub_253E71FD0@<X0>(unsigned int *a1@<X0>, _DWORD *a2@<X8>)
{
  return sub_253E67EA0(*a1, *v2, a2);
}

BOOL sub_253E71FDC(_DWORD *a1, int *a2)
{
  return sub_253E67EAC(a1, *a2);
}

void sub_253E71FE4(int *a1@<X0>, uint64_t a2@<X8>)
{
}

void sub_253E72000(int *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_253E7201C(unsigned int *a1)
{
  return sub_253E67F10(*a1);
}

uint64_t sub_253E72024(unsigned int *a1)
{
  return sub_253E67F20(*a1);
}

uint64_t sub_253E7202C(unsigned int *a1)
{
  return sub_253E67F30(*a1);
}

uint64_t sub_253E72034@<X0>(unsigned int *a1@<X0>, int *a2@<X8>)
{
  return sub_253E67F40(*a1, *v2, a2);
}

BOOL sub_253E72040(int *a1)
{
  return sub_253E67F4C(*a1, *v1);
}

BOOL sub_253E7204C(int *a1)
{
  return sub_253E67F58(*a1, *v1);
}

BOOL sub_253E72058(int *a1)
{
  return sub_253E67F64(*a1, *v1);
}

BOOL sub_253E72064()
{
  return sub_253E67F70(*v0);
}

uint64_t sub_253E7206C(unsigned int *a1)
{
  return sub_253E67F94(*a1);
}

uint64_t sub_253E72074@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = AliasTypes.init(rawValue:)(*a1, (_DWORD *)a2);
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

uint64_t sub_253E720A0@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = AliasTypes.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL static SpanMatchingError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SpanMatchingError.hash(into:)()
{
  return sub_253E82810();
}

uint64_t SpanMatchingError.hashValue.getter()
{
  return sub_253E82840();
}

uint64_t static EntityMatchFormatter.format(entities:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    strcpy((char *)v7, "The user has ");
    HIWORD(v7[1]) = -4864;
    uint64_t v3 = v1 - 1;
    swift_bridgeObjectRetain();
    for (uint64_t i = 32; ; i += 160)
    {
      memcpy(__dst, (const void *)(a1 + i), sizeof(__dst));
      if (v3)
      {
        sub_253E77548((uint64_t)__dst);
        if (i == 32) {
          goto LABEL_8;
        }
      }
      else
      {
        sub_253E77548((uint64_t)__dst);
      }
      sub_253E82380();
LABEL_8:
      sub_253E824F0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_253E82380();
      swift_bridgeObjectRelease();
      sub_253E82380();
      sub_253E775C0((uint64_t)__dst);
      sub_253E82380();
      swift_bridgeObjectRelease();
      if (!v3)
      {
        swift_bridgeObjectRelease();
        return v7[0];
      }
      --v3;
    }
  }
  return 0;
}

void Array<A>.rankPerTypeByRelevance()()
{
  sub_253E5C31C();
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RetrievedContext(0);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  char v5 = (char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)v46 - v7;
  uint64_t v9 = MEMORY[0x263F8EE80];
  v53[0] = MEMORY[0x263F8EE80];
  uint64_t v10 = *(void *)(v1 + 16);
  if (v10)
  {
    v46[0] = 0;
    v46[1] = v1;
    uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v12 = (v11 + 32) & ~v11;
    uint64_t v13 = v1 + v12;
    uint64_t v14 = *(void *)(v6 + 72);
    uint64_t v52 = v12;
    uint64_t v49 = v14 + v12;
    uint64_t v48 = v11 | 7;
    swift_bridgeObjectRetain();
    long long v47 = xmmword_253E88E00;
    uint64_t v50 = v8;
    int v51 = v5;
    do
    {
      sub_253E7626C();
      uint64_t v15 = v8[*(int *)(v2 + 36)];
      unint64_t v17 = sub_253E73870(v15);
      uint64_t v18 = *(void *)(v9 + 16);
      BOOL v19 = (v16 & 1) == 0;
      uint64_t v20 = v18 + v19;
      if (__OFADD__(v18, v19))
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
      char v21 = v16;
      if (*(void *)(v9 + 24) < v20)
      {
        sub_253E74240(v20, 1);
        uint64_t v9 = v53[0];
        unint64_t v22 = sub_253E73870(v15);
        if ((v21 & 1) != (v23 & 1)) {
          goto LABEL_49;
        }
        unint64_t v17 = v22;
      }
      if (v21)
      {
        uint64_t v24 = v2;
        uint64_t v25 = *(void *)(v9 + 56);
        sub_253E76018();
        uint64_t v26 = *(void *)(v25 + 8 * v17);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v25 + 8 * v17) = v26;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v26 = sub_253E7331C(0, *(void *)(v26 + 16) + 1, 1, v26);
          *(void *)(v25 + 8 * v17) = v26;
        }
        unint64_t v29 = *(void *)(v26 + 16);
        unint64_t v28 = *(void *)(v26 + 24);
        if (v29 >= v28 >> 1)
        {
          uint64_t v26 = sub_253E7331C(v28 > 1, v29 + 1, 1, v26);
          *(void *)(v25 + 8 * v17) = v26;
        }
        uint64_t v2 = v24;
        *(void *)(v26 + 16) = v29 + 1;
        sub_253E76018();
        uint64_t v8 = v50;
      }
      else
      {
        sub_253E390C4(&qword_269D98588);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = v47;
        sub_253E76018();
        *(void *)(v9 + 8 * (v17 >> 6) + 64) |= 1 << v17;
        *(unsigned char *)(*(void *)(v9 + 48) + v17) = v15;
        *(void *)(*(void *)(v9 + 56) + 8 * v17) = v30;
        uint64_t v31 = *(void *)(v9 + 16);
        BOOL v32 = __OFADD__(v31, 1);
        uint64_t v33 = v31 + 1;
        if (v32) {
          goto LABEL_47;
        }
        *(void *)(v9 + 16) = v33;
      }
      v13 += v14;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  v53[4] = v9;
  uint64_t v34 = v9 + 64;
  uint64_t v35 = 1 << *(unsigned char *)(v9 + 32);
  uint64_t v36 = -1;
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  unint64_t v37 = v36 & *(void *)(v9 + 64);
  int64_t v38 = (unint64_t)(v35 + 63) >> 6;
  swift_retain();
  int64_t v39 = 0;
  if (!v37) {
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v40 = __clz(__rbit64(v37));
  v37 &= v37 - 1;
  for (unint64_t i = v40 | (v39 << 6); ; unint64_t i = __clz(__rbit64(v42)) + (v39 << 6))
  {
    uint64_t v45 = sub_253E72780(v53, *(unsigned __int8 *)(*(void *)(v9 + 48) + i));
    if (*v44) {
      sub_253E72820(v44);
    }
    ((void (*)(void *, void))v45)(v53, 0);
    if (v37) {
      goto LABEL_20;
    }
LABEL_21:
    BOOL v32 = __OFADD__(v39++, 1);
    if (v32) {
      goto LABEL_46;
    }
    if (v39 >= v38)
    {
LABEL_44:
      swift_release();
      sub_253E5C2D8();
      return;
    }
    unint64_t v42 = *(void *)(v34 + 8 * v39);
    if (!v42) {
      break;
    }
LABEL_35:
    unint64_t v37 = (v42 - 1) & v42;
  }
  int64_t v43 = v39 + 1;
  if (v39 + 1 >= v38) {
    goto LABEL_44;
  }
  unint64_t v42 = *(void *)(v34 + 8 * v43);
  if (v42) {
    goto LABEL_34;
  }
  int64_t v43 = v39 + 2;
  if (v39 + 2 >= v38) {
    goto LABEL_44;
  }
  unint64_t v42 = *(void *)(v34 + 8 * v43);
  if (v42) {
    goto LABEL_34;
  }
  int64_t v43 = v39 + 3;
  if (v39 + 3 >= v38) {
    goto LABEL_44;
  }
  unint64_t v42 = *(void *)(v34 + 8 * v43);
  if (v42) {
    goto LABEL_34;
  }
  int64_t v43 = v39 + 4;
  if (v39 + 4 >= v38) {
    goto LABEL_44;
  }
  unint64_t v42 = *(void *)(v34 + 8 * v43);
  if (v42) {
    goto LABEL_34;
  }
  int64_t v43 = v39 + 5;
  if (v39 + 5 >= v38) {
    goto LABEL_44;
  }
  unint64_t v42 = *(void *)(v34 + 8 * v43);
  if (v42)
  {
LABEL_34:
    int64_t v39 = v43;
    goto LABEL_35;
  }
  while (1)
  {
    int64_t v39 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v39 >= v38) {
      goto LABEL_44;
    }
    unint64_t v42 = *(void *)(v34 + 8 * v39);
    ++v43;
    if (v42) {
      goto LABEL_35;
    }
  }
LABEL_48:
  __break(1u);
LABEL_49:
  sub_253E827A0();
  __break(1u);
}

void (*sub_253E72780(void *a1, uint64_t a2))(void **a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_253E7454C(v4, a2);
  return sub_253E727E0;
}

void sub_253E727E0(void **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = sub_253E803E0();
  v3(v2);

  free(v1);
}

uint64_t sub_253E72820(uint64_t *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for RetrievedContext(0) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_253E7F7A4(v3);
  }
  uint64_t v4 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_253E74630((unint64_t)v6);
  *a1 = v3;
  return result;
}

uint64_t sub_253E728CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253E82240();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_253E390C4(&qword_269D98498);
  MEMORY[0x270FA5388](v86);
  uint64_t v9 = (char *)v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for IdentifiedEntityValue(0);
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v78 = (char *)v65 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  char v16 = (char *)v65 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  long long v87 = (char *)v65 - v18;
  uint64_t result = MEMORY[0x270FA5388](v17);
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v23 = v4;
  char v76 = v7;
  int64_t v24 = 0;
  uint64_t v25 = *(void *)(a1 + 56);
  uint64_t v68 = a1 + 56;
  uint64_t v26 = 1 << *(unsigned char *)(a1 + 32);
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  else {
    uint64_t v27 = -1;
  }
  uint64_t v28 = v27 & v25;
  int64_t v69 = (unint64_t)(v26 + 63) >> 6;
  uint64_t v85 = a2 + 56;
  uint64_t v79 = (void (**)(uint64_t, uint64_t))(v5 + 8);
  char v73 = (void (**)(char *, char *, uint64_t))(v5 + 32);
  uint64_t v29 = a2;
  uint64_t v80 = v10;
  uint64_t v81 = a2;
  uint64_t v77 = v22;
  uint64_t v67 = a1;
  uint64_t v66 = v21;
  long long v83 = v16;
  v65[1] = (char *)v65 - v20;
  __int16 v72 = v9;
  if (!v28) {
    goto LABEL_8;
  }
  while (2)
  {
    uint64_t v70 = (v28 - 1) & v28;
    int64_t v71 = v24;
LABEL_24:
    uint64_t v84 = *(void *)(v21 + 72);
    sub_253E7626C();
    sub_253E76018();
    sub_253E82800();
    IdentifiedEntityValue.hash(into:)();
    uint64_t v34 = sub_253E82840();
    uint64_t v35 = -1 << *(unsigned char *)(v29 + 32);
    unint64_t v36 = v34 & ~v35;
    if (((*(void *)(v85 + ((v36 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v36) & 1) == 0)
    {
LABEL_60:
      sub_253E75DB8();
      return 0;
    }
    uint64_t v37 = v23;
    uint64_t v82 = ~v35;
    while (1)
    {
      sub_253E7626C();
      int64_t v38 = &v9[*(int *)(v86 + 48)];
      sub_253E7626C();
      sub_253E7626C();
      if (swift_getEnumCaseMultiPayload() == 1) {
        break;
      }
      uint64_t v51 = v37;
      uint64_t v52 = (uint64_t *)v78;
      sub_253E7626C();
      uint64_t v54 = *v52;
      uint64_t v53 = v52[1];
      uint64_t v56 = v52[2];
      uint64_t v55 = v52[3];
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v37 = v51;
LABEL_38:
        sub_253E4CA94((uint64_t)v9, &qword_269D98498);
        goto LABEL_53;
      }
      uint64_t v57 = *(void *)v38;
      uint64_t v58 = *((void *)v38 + 1);
      uint64_t v59 = *((void *)v38 + 2);
      uint64_t v60 = *((void *)v38 + 3);
      if (v54 == v57 && v53 == v58)
      {
        swift_bridgeObjectRelease_n();
LABEL_47:
        BOOL v63 = v56 == v59 && v55 == v60;
        uint64_t v29 = v81;
        if (v63)
        {
          swift_bridgeObjectRelease_n();
          uint64_t v37 = v51;
          goto LABEL_57;
        }
        char v64 = sub_253E82780();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v37 = v51;
        if (v64) {
          goto LABEL_57;
        }
LABEL_52:
        sub_253E75DB8();
        goto LABEL_53;
      }
      char v62 = sub_253E82780();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v62) {
        goto LABEL_47;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_253E75DB8();
      uint64_t v37 = v51;
LABEL_53:
      sub_253E75DB8();
      unint64_t v36 = (v36 + 1) & v82;
      if (((*(void *)(v85 + ((v36 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v36) & 1) == 0) {
        goto LABEL_60;
      }
    }
    uint64_t v39 = v37;
    uint64_t v40 = v77;
    sub_253E7626C();
    uint64_t v41 = *(int *)(sub_253E390C4(&qword_269D98488) + 48);
    uint64_t v42 = *(void *)(v40 + v41);
    uint64_t v43 = *(void *)(v40 + v41 + 8);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      swift_bridgeObjectRelease();
      uint64_t v37 = v39;
      (*v79)(v40, v39);
      goto LABEL_38;
    }
    uint64_t v75 = v42;
    uint64_t v44 = *(void *)&v38[v41 + 8];
    uint64_t v74 = *(void *)&v38[v41];
    uint64_t v45 = v76;
    (*v73)(v76, v38, v39);
    char v46 = sub_253E82230();
    uint64_t v47 = v39;
    uint64_t v48 = *v79;
    (*v79)(v40, v39);
    if ((v46 & 1) == 0)
    {
      v48((uint64_t)v45, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v9 = v72;
      sub_253E75DB8();
      uint64_t v37 = v39;
      goto LABEL_53;
    }
    if (v75 != v74 || v43 != v44)
    {
      char v50 = sub_253E82780();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v48((uint64_t)v76, v47);
      uint64_t v37 = v47;
      uint64_t v29 = v81;
      uint64_t v9 = v72;
      if (v50) {
        goto LABEL_57;
      }
      goto LABEL_52;
    }
    swift_bridgeObjectRelease_n();
    v48((uint64_t)v76, v39);
    uint64_t v37 = v39;
    uint64_t v29 = v81;
    uint64_t v9 = v72;
LABEL_57:
    uint64_t v23 = v37;
    sub_253E75DB8();
    sub_253E75DB8();
    uint64_t result = sub_253E75DB8();
    uint64_t v21 = v66;
    int64_t v24 = v71;
    uint64_t v28 = v70;
    if (v70) {
      continue;
    }
    break;
  }
LABEL_8:
  int64_t v30 = v24 + 1;
  if (__OFADD__(v24, 1))
  {
    __break(1u);
    goto LABEL_63;
  }
  if (v30 >= v69) {
    return 1;
  }
  uint64_t v31 = *(void *)(v68 + 8 * v30);
  int64_t v32 = v24 + 1;
  if (v31) {
    goto LABEL_23;
  }
  int64_t v32 = v30 + 1;
  if (v30 + 1 >= v69) {
    return 1;
  }
  uint64_t v31 = *(void *)(v68 + 8 * v32);
  if (v31) {
    goto LABEL_23;
  }
  int64_t v32 = v30 + 2;
  if (v30 + 2 >= v69) {
    return 1;
  }
  uint64_t v31 = *(void *)(v68 + 8 * v32);
  if (v31) {
    goto LABEL_23;
  }
  int64_t v32 = v30 + 3;
  if (v30 + 3 >= v69) {
    return 1;
  }
  uint64_t v31 = *(void *)(v68 + 8 * v32);
  if (v31) {
    goto LABEL_23;
  }
  int64_t v33 = v30 + 4;
  if (v33 >= v69) {
    return 1;
  }
  uint64_t v31 = *(void *)(v68 + 8 * v33);
  if (v31)
  {
    int64_t v32 = v33;
LABEL_23:
    uint64_t v70 = (v31 - 1) & v31;
    int64_t v71 = v32;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v32 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v32 >= v69) {
      return 1;
    }
    uint64_t v31 = *(void *)(v68 + 8 * v32);
    ++v33;
    if (v31) {
      goto LABEL_23;
    }
  }
LABEL_63:
  __break(1u);
  return result;
}

uint64_t sub_253E7323C(uint64_t a1)
{
  if (a1 < 0)
  {
    uint64_t result = sub_253E82570();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      type metadata accessor for RetrievedContext(0);
      uint64_t v2 = sub_253E82450();
      *(void *)(v2 + 16) = a1;
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
    }
    type metadata accessor for RetrievedContext(0);
    return v2;
  }
  return result;
}

uint64_t sub_253E7331C(char a1, int64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  sub_253E390C4(&qword_269D98588);
  uint64_t v10 = *(void *)(type metadata accessor for RetrievedContext(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_24:
    uint64_t result = sub_253E82570();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for RetrievedContext(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    sub_253E736A8(a4 + v17, v8, v18);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_253E73548(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_253E73548(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for RetrievedContext(0) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v12;
    }
  }
  uint64_t result = sub_253E82590();
  __break(1u);
  return result;
}

uint64_t sub_253E736A8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t result = sub_253E82590();
    __break(1u);
  }
  else if (a3 < a1 {
         || (uint64_t result = type metadata accessor for RetrievedContext(0),
  }
             a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    type metadata accessor for RetrievedContext(0);
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

unint64_t sub_253E737D8(uint64_t a1)
{
  sub_253E822A0();
  sub_253E75E08(&qword_269D98998, MEMORY[0x263F80768]);
  uint64_t v2 = sub_253E822D0();

  return sub_253E738B4(a1, v2);
}

unint64_t sub_253E73870(uint64_t a1)
{
  char v2 = a1;
  uint64_t v3 = sub_253E5CA18(*(void *)(v1 + 40), a1);

  return sub_253E73A74(v2, v3);
}

unint64_t sub_253E738B4(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_253E822A0();
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
    unint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_253E75E08(&qword_269D989A0, MEMORY[0x263F80768]);
      char v15 = sub_253E822F0();
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

unint64_t sub_253E73A74(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v16 = ~v3;
    while (1)
    {
      unint64_t v5 = 0xD000000000000012;
      unint64_t v6 = 0x8000000253E82D80;
      switch(*(unsigned char *)(*(void *)(v17 + 48) + v4))
      {
        case 1:
          uint64_t v7 = "appInFocusBundleId";
          goto LABEL_31;
        case 2:
          unint64_t v5 = 0x7261646E656C6163;
          unint64_t v6 = 0xEE0073746E657645;
          break;
        case 3:
          unint64_t v5 = 0x4C746E6572727563;
          unint64_t v6 = 0xEF6E6F697461636FLL;
          break;
        case 4:
          unint64_t v5 = 0x74536E6F69746F6DLL;
          unint64_t v6 = 0xEB00000000657461;
          break;
        case 5:
          unint64_t v5 = 0xD000000000000017;
          uint64_t v8 = "ts";
          goto LABEL_34;
        case 6:
          unint64_t v5 = 0x49664F746E696F70;
          unint64_t v6 = 0xEF7473657265746ELL;
          break;
        case 7:
          unint64_t v5 = 0xD000000000000010;
          uint64_t v8 = "ckState";
          goto LABEL_34;
        case 8:
          unint64_t v5 = 0xD000000000000010;
          uint64_t v8 = "recentTranscript";
          goto LABEL_34;
        case 9:
          unint64_t v5 = 0xD00000000000001BLL;
          uint64_t v8 = "semanticLocation";
          goto LABEL_34;
        case 0xA:
          unint64_t v5 = 0xD00000000000001ALL;
          uint64_t v8 = "onScreenContentEmailAddress";
          goto LABEL_34;
        case 0xB:
          unint64_t v5 = 0xD00000000000001CLL;
          uint64_t v8 = "onScreenContentPhoneNumber";
          goto LABEL_34;
        case 0xC:
          unint64_t v5 = 0xD000000000000016;
          uint64_t v8 = "onScreenContentPostalAddress";
          goto LABEL_34;
        case 0xD:
          unint64_t v5 = 0xD000000000000018;
          uint64_t v8 = "onScreenContentUriLink";
          goto LABEL_34;
        case 0xE:
          unint64_t v6 = 0xEE006E6F73726550;
          goto LABEL_19;
        case 0xF:
          unint64_t v6 = 0xEC000000656D6F48;
LABEL_19:
          unint64_t v5 = 0x6E65657263536E6FLL;
          break;
        case 0x10:
          unint64_t v5 = 0xD000000000000014;
          uint64_t v8 = "nPerson";
          goto LABEL_34;
        case 0x11:
          unint64_t v5 = 0xD000000000000010;
          uint64_t v8 = "onScreenNotification";
          goto LABEL_34;
        case 0x12:
          unint64_t v5 = 0xD000000000000016;
          uint64_t v8 = "onScreenDateTime";
          goto LABEL_34;
        case 0x13:
          unint64_t v5 = 0xD00000000000001BLL;
          uint64_t v8 = "conversationalReminder";
          goto LABEL_34;
        case 0x14:
          unint64_t v5 = 0xD000000000000014;
          uint64_t v8 = "conversationalCalendarEvent";
          goto LABEL_34;
        case 0x15:
          unint64_t v5 = 0xD000000000000014;
          uint64_t v8 = "conversationalPeople";
          goto LABEL_34;
        case 0x16:
          uint64_t v7 = "conversationalPlaces";
          goto LABEL_31;
        case 0x17:
          uint64_t v7 = "conversationalAlarm";
          goto LABEL_31;
        case 0x18:
          uint64_t v7 = "conversationalTimer";
          goto LABEL_31;
        case 0x19:
          unint64_t v6 = 0x8000000253E83030;
          unint64_t v5 = 0xD000000000000012;
          break;
        case 0x1A:
          uint64_t v7 = "siriRequestContext";
LABEL_31:
          unint64_t v6 = (unint64_t)v7 | 0x8000000000000000;
          unint64_t v5 = 0xD000000000000013;
          break;
        case 0x1B:
          unint64_t v5 = 0xD00000000000001ALL;
          uint64_t v8 = "intelligenceCommand";
          goto LABEL_34;
        case 0x1C:
          unint64_t v5 = 0xD000000000000017;
          uint64_t v8 = "hasFocusedOnScreenDocument";
LABEL_34:
          unint64_t v6 = (unint64_t)v8 | 0x8000000000000000;
          break;
        default:
          break;
      }
      unint64_t v9 = 0x8000000253E82D80;
      unint64_t v10 = 0xD000000000000012;
      switch(a1)
      {
        case 1:
          unint64_t v11 = "appInFocusBundleId";
          goto LABEL_63;
        case 2:
          unint64_t v10 = 0x7261646E656C6163;
          unint64_t v9 = 0xEE0073746E657645;
          break;
        case 3:
          unint64_t v10 = 0x4C746E6572727563;
          unint64_t v9 = 0xEF6E6F697461636FLL;
          break;
        case 4:
          unint64_t v10 = 0x74536E6F69746F6DLL;
          unint64_t v9 = 0xEB00000000657461;
          break;
        case 5:
          unint64_t v10 = 0xD000000000000017;
          uint64_t v12 = "ts";
          goto LABEL_66;
        case 6:
          unint64_t v10 = 0x49664F746E696F70;
          unint64_t v9 = 0xEF7473657265746ELL;
          break;
        case 7:
          unint64_t v10 = 0xD000000000000010;
          uint64_t v12 = "ckState";
          goto LABEL_66;
        case 8:
          unint64_t v10 = 0xD000000000000010;
          uint64_t v12 = "recentTranscript";
          goto LABEL_66;
        case 9:
          unint64_t v10 = 0xD00000000000001BLL;
          uint64_t v12 = "semanticLocation";
          goto LABEL_66;
        case 10:
          unint64_t v10 = 0xD00000000000001ALL;
          uint64_t v12 = "onScreenContentEmailAddress";
          goto LABEL_66;
        case 11:
          unint64_t v10 = 0xD00000000000001CLL;
          uint64_t v12 = "onScreenContentPhoneNumber";
          goto LABEL_66;
        case 12:
          unint64_t v10 = 0xD000000000000016;
          uint64_t v12 = "onScreenContentPostalAddress";
          goto LABEL_66;
        case 13:
          unint64_t v10 = 0xD000000000000018;
          uint64_t v12 = "onScreenContentUriLink";
          goto LABEL_66;
        case 14:
          unint64_t v9 = 0xEE006E6F73726550;
          goto LABEL_51;
        case 15:
          unint64_t v9 = 0xEC000000656D6F48;
LABEL_51:
          unint64_t v10 = 0x6E65657263536E6FLL;
          break;
        case 16:
          unint64_t v10 = 0xD000000000000014;
          uint64_t v12 = "nPerson";
          goto LABEL_66;
        case 17:
          unint64_t v10 = 0xD000000000000010;
          uint64_t v12 = "onScreenNotification";
          goto LABEL_66;
        case 18:
          unint64_t v10 = 0xD000000000000016;
          uint64_t v12 = "onScreenDateTime";
          goto LABEL_66;
        case 19:
          unint64_t v10 = 0xD00000000000001BLL;
          uint64_t v12 = "conversationalReminder";
          goto LABEL_66;
        case 20:
          unint64_t v10 = 0xD000000000000014;
          uint64_t v12 = "conversationalCalendarEvent";
          goto LABEL_66;
        case 21:
          unint64_t v10 = 0xD000000000000014;
          uint64_t v12 = "conversationalPeople";
          goto LABEL_66;
        case 22:
          unint64_t v11 = "conversationalPlaces";
          goto LABEL_63;
        case 23:
          unint64_t v11 = "conversationalAlarm";
          goto LABEL_63;
        case 24:
          unint64_t v11 = "conversationalTimer";
          goto LABEL_63;
        case 25:
          unint64_t v9 = 0x8000000253E83030;
          unint64_t v10 = 0xD000000000000012;
          break;
        case 26:
          unint64_t v11 = "siriRequestContext";
LABEL_63:
          unint64_t v9 = (unint64_t)v11 | 0x8000000000000000;
          unint64_t v10 = 0xD000000000000013;
          break;
        case 27:
          unint64_t v10 = 0xD00000000000001ALL;
          uint64_t v12 = "intelligenceCommand";
          goto LABEL_66;
        case 28:
          unint64_t v10 = 0xD000000000000017;
          uint64_t v12 = "hasFocusedOnScreenDocument";
LABEL_66:
          unint64_t v9 = (unint64_t)v12 | 0x8000000000000000;
          break;
        default:
          break;
      }
      if (v5 == v10 && v6 == v9) {
        break;
      }
      char v14 = sub_253E82780();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v16;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_253E74240(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_253E390C4(&qword_269D98960);
  char v6 = a2;
  uint64_t v7 = sub_253E82580();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = v5 + 64;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = v2;
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    if (!v11) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v14 << 6))
    {
      char v21 = *(unsigned char *)(*(void *)(v5 + 48) + i);
      uint64_t v22 = *(void *)(*(void *)(v5 + 56) + 8 * i);
      if ((v6 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_253E82800();
      ContextType.rawValue.getter();
      sub_253E82360();
      swift_bridgeObjectRelease();
      uint64_t result = sub_253E82840();
      uint64_t v23 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v24 = result & ~v23;
      unint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) == 0)
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          BOOL v29 = v25 == v28;
          if (v25 == v28) {
            unint64_t v25 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v12 + 8 * v25);
          if (v30 != -1)
          {
            unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v12 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      *(unsigned char *)(*(void *)(v8 + 48) + v26) = v21;
      *(void *)(*(void *)(v8 + 56) + 8 * v26) = v22;
      ++*(void *)(v8 + 16);
      if (v11) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_41;
      }
      if (v17 >= v33) {
        break;
      }
      uint64_t v18 = (void *)(v5 + 64);
      unint64_t v19 = *(void *)(v34 + 8 * v17);
      ++v14;
      if (!v19)
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v33) {
          goto LABEL_32;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v14);
        if (!v19)
        {
          int64_t v20 = v17 + 2;
          if (v20 >= v33)
          {
LABEL_32:
            swift_release();
            uint64_t v3 = v32;
            if ((v6 & 1) == 0) {
              goto LABEL_39;
            }
            goto LABEL_35;
          }
          unint64_t v19 = *(void *)(v34 + 8 * v20);
          if (!v19)
          {
            while (1)
            {
              int64_t v14 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                goto LABEL_42;
              }
              if (v14 >= v33) {
                goto LABEL_32;
              }
              unint64_t v19 = *(void *)(v34 + 8 * v14);
              ++v20;
              if (v19) {
                goto LABEL_18;
              }
            }
          }
          int64_t v14 = v20;
        }
      }
LABEL_18:
      unint64_t v11 = (v19 - 1) & v19;
    }
    swift_release();
    uint64_t v3 = v32;
    uint64_t v18 = (void *)(v5 + 64);
    if ((v6 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_35:
    uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
    if (v31 >= 64) {
      sub_253E75CD8(0, (unint64_t)(v31 + 63) >> 6, v18);
    }
    else {
      *uint64_t v18 = -1 << v31;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

void (*sub_253E7454C(void *a1, uint64_t a2))(uint64_t a1)
{
  unint64_t v4 = malloc(0x50uLL);
  *a1 = v4;
  swift_isUniquelyReferenced_nonNull_native();
  v4[8] = sub_253E75C58(v4);
  v4[9] = sub_253E75A84((uint64_t)(v4 + 4), a2);
  return sub_253E745DC;
}

void sub_253E745DC(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(uint64_t))(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 72))();
  uint64_t v3 = sub_253E803E0();
  v2(v3);

  free(v1);
}

uint64_t sub_253E74630(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v155 = type metadata accessor for RetrievedContext(0);
  uint64_t v148 = *(void *)(v155 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v155);
  uint64_t v143 = (char *)&v135 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  __int16 v156 = (char *)&v135 - v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v151 = (char *)&v135 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v150 = (char *)&v135 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v145 = (char *)&v135 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v144 = (char *)&v135 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v135 - v17;
  MEMORY[0x270FA5388](v16);
  int64_t v20 = (char *)&v135 - v19;
  uint64_t v21 = *(void *)(a1 + 8);
  uint64_t result = sub_253E82760();
  if (result >= v21)
  {
    if ((v21 & 0x8000000000000000) == 0)
    {
      if (v21) {
        return sub_253E751B0(0, v21, 1, (void *)a1);
      }
      return result;
    }
    goto LABEL_156;
  }
  uint64_t v23 = result;
  uint64_t result = sub_253E7323C(v21 / 2);
  uint64_t v139 = result;
  unint64_t v147 = v24;
  if (v21 <= 0)
  {
LABEL_120:
    uint64_t v26 = MEMORY[0x263F8EE78];
    unint64_t v77 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_121:
    if (v77 < 2)
    {
LABEL_132:
      uint64_t result = swift_bridgeObjectRelease();
      if (v21 >= -1) {
        goto LABEL_133;
      }
      goto LABEL_160;
    }
    uint64_t v128 = *(void *)a1;
    while (1)
    {
      a1 = v77 - 2;
      if (v77 < 2) {
        break;
      }
      if (!v128) {
        goto LABEL_164;
      }
      uint64_t v129 = v26;
      uint64_t v130 = v26 + 32;
      uint64_t v131 = *(void *)(v26 + 32 + 16 * a1);
      uint64_t v132 = *(void *)(v26 + 32 + 16 * (v77 - 1) + 8);
      uint64_t result = sub_253E75498(v128 + *(void *)(v148 + 72) * v131, v128 + *(void *)(v148 + 72) * *(void *)(v130 + 16 * (v77 - 1)), v128 + *(void *)(v148 + 72) * v132, v147);
      if (v2) {
        goto LABEL_118;
      }
      if (v132 < v131) {
        goto LABEL_151;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_253E75A70(v129);
        uint64_t v129 = result;
      }
      if (a1 >= *(void *)(v129 + 16)) {
        goto LABEL_152;
      }
      uint64_t v133 = (void *)(v129 + 32 + 16 * a1);
      *uint64_t v133 = v131;
      v133[1] = v132;
      unint64_t v134 = *(void *)(v129 + 16);
      if (v77 > v134) {
        goto LABEL_153;
      }
      uint64_t v26 = v129;
      uint64_t result = (uint64_t)memmove((void *)(v129 + 32 + 16 * (v77 - 1)), (const void *)(v129 + 32 + 16 * v77), 16 * (v134 - v77));
      *(void *)(v129 + 16) = v134 - 1;
      unint64_t v77 = v134 - 1;
      if (v134 <= 2) {
        goto LABEL_132;
      }
    }
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
    return result;
  }
  uint64_t v136 = v23;
  uint64_t v137 = v20;
  uint64_t v138 = v18;
  uint64_t v25 = 0;
  uint64_t v26 = MEMORY[0x263F8EE78];
  uint64_t v27 = v21;
  uint64_t v141 = v21;
  unint64_t v153 = a1;
  while (1)
  {
    uint64_t v28 = v25;
    uint64_t v29 = v25 + 1;
    uint64_t v146 = v25;
    uint64_t v30 = v27;
    if (v25 + 1 >= v27)
    {
      uint64_t v41 = v25 + 1;
    }
    else
    {
      uint64_t v149 = v2;
      uint64_t v31 = *(void *)a1;
      uint64_t v32 = *(void *)(v148 + 72);
      int64_t v33 = v137;
      sub_253E7626C();
      uint64_t v34 = v138;
      sub_253E7626C();
      uint64_t v35 = *(int *)(v155 + 32);
      if (v33[v35 + 4] == 3) {
        float v36 = 0.0;
      }
      else {
        float v36 = *(float *)&v33[v35];
      }
      uint64_t v37 = &v34[v35];
      uint64_t v38 = v37[4];
      float v39 = *(float *)v37;
      if (v38 == 3) {
        float v40 = 0.0;
      }
      else {
        float v40 = v39;
      }
      uint64_t v28 = v146;
      sub_253E75DB8();
      uint64_t result = sub_253E75DB8();
      uint64_t v41 = v28 + 2;
      uint64_t v152 = v31;
      uint64_t v157 = v32;
      if (v28 + 2 >= v30)
      {
        uint64_t v52 = v32;
        uint64_t v2 = v149;
      }
      else
      {
        uint64_t v140 = v26;
        uint64_t v154 = v32 * v29;
        uint64_t v42 = v31;
        while (1)
        {
          uint64_t v43 = v30;
          uint64_t v44 = v41;
          uint64_t v45 = v144;
          sub_253E7626C();
          char v46 = v145;
          sub_253E7626C();
          uint64_t v47 = *(int *)(v155 + 32);
          float v48 = *(float *)&v45[v47];
          if (v45[v47 + 4] == 3) {
            float v48 = 0.0;
          }
          uint64_t v49 = &v46[v47];
          float v50 = *(float *)v49;
          if (v49[4] == 3) {
            float v50 = 0.0;
          }
          BOOL v51 = v50 >= v48;
          sub_253E75DB8();
          uint64_t result = sub_253E75DB8();
          if (v40 < v36 == v51) {
            break;
          }
          ++v41;
          uint64_t v52 = v157;
          v42 += v157;
          uint64_t v30 = v43;
          if (v44 + 1 >= v43)
          {
            uint64_t v41 = v43;
            uint64_t v31 = v152;
            a1 = v153;
            uint64_t v26 = v140;
            uint64_t v2 = v149;
            uint64_t v28 = v146;
            goto LABEL_23;
          }
        }
        uint64_t v31 = v152;
        a1 = v153;
        uint64_t v26 = v140;
        uint64_t v2 = v149;
        uint64_t v28 = v146;
        uint64_t v30 = v43;
        uint64_t v52 = v157;
      }
LABEL_23:
      if (v40 < v36)
      {
        if (v41 < v28) {
          goto LABEL_157;
        }
        if (v28 < v41)
        {
          uint64_t v142 = v30;
          uint64_t v149 = v2;
          uint64_t v140 = v26;
          uint64_t v53 = 0;
          uint64_t v54 = v28;
          uint64_t v55 = v52 * (v41 - 1);
          uint64_t v56 = v41 * v52;
          uint64_t v57 = v54;
          uint64_t v58 = v54 * v52;
          do
          {
            if (v57 != v41 + v53 - 1)
            {
              if (!v31) {
                goto LABEL_163;
              }
              uint64_t v154 = v31 + v55;
              sub_253E76018();
              if (v58 < v55 || v31 + v58 >= (unint64_t)(v31 + v56))
              {
                swift_arrayInitWithTakeFrontToBack();
              }
              else if (v58 != v55)
              {
                swift_arrayInitWithTakeBackToFront();
              }
              uint64_t result = sub_253E76018();
              uint64_t v31 = v152;
              uint64_t v52 = v157;
            }
            ++v57;
            --v53;
            v55 -= v52;
            v56 -= v52;
            v58 += v52;
          }
          while (v57 < v41 + v53);
          uint64_t v26 = v140;
          uint64_t v2 = v149;
          uint64_t v28 = v146;
          uint64_t v30 = v142;
        }
      }
    }
    if (v41 < v30)
    {
      if (__OFSUB__(v41, v28)) {
        goto LABEL_155;
      }
      if (v41 - v28 < v136)
      {
        if (__OFADD__(v28, v136)) {
          goto LABEL_158;
        }
        if (v28 + v136 >= v30) {
          uint64_t v60 = v30;
        }
        else {
          uint64_t v60 = v28 + v136;
        }
        if (v60 < v28) {
          goto LABEL_159;
        }
        if (v41 != v60)
        {
          uint64_t v140 = v26;
          uint64_t v149 = v2;
          uint64_t v61 = *(void *)(v148 + 72);
          uint64_t v157 = v61 * (v41 - 1);
          uint64_t v152 = v61;
          uint64_t v62 = v41 * v61;
          uint64_t v142 = v60;
          do
          {
            uint64_t v63 = 0;
            uint64_t v64 = v28;
            uint64_t v154 = v41;
            while (1)
            {
              uint64_t v65 = v62;
              uint64_t v66 = v150;
              sub_253E7626C();
              uint64_t v67 = v151;
              sub_253E7626C();
              uint64_t v68 = *(int *)(v155 + 32);
              float v69 = v66[v68 + 4] == 3 ? 0.0 : *(float *)&v66[v68];
              uint64_t v70 = &v67[v68];
              uint64_t v71 = v70[4];
              float v72 = *(float *)v70;
              float v73 = v71 == 3 ? 0.0 : v72;
              sub_253E75DB8();
              uint64_t result = sub_253E75DB8();
              if (v73 >= v69) {
                break;
              }
              if (!*(void *)a1) {
                goto LABEL_161;
              }
              uint64_t v62 = v65;
              sub_253E76018();
              swift_arrayInitWithTakeFrontToBack();
              uint64_t result = sub_253E76018();
              a1 = v153;
              v63 -= v152;
              ++v64;
              uint64_t v74 = v154;
              if (v154 == v64) {
                goto LABEL_62;
              }
            }
            uint64_t v74 = v154;
            uint64_t v62 = v65;
LABEL_62:
            uint64_t v41 = v74 + 1;
            v157 += v152;
            v62 += v152;
            uint64_t v28 = v146;
          }
          while (v41 != v142);
          uint64_t v41 = v142;
          uint64_t v2 = v149;
          uint64_t v26 = v140;
        }
      }
    }
    if (v41 < v28) {
      goto LABEL_154;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v154 = v41;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_253E75978(0, *(void *)(v26 + 16) + 1, 1, (char *)v26);
      uint64_t v26 = result;
    }
    unint64_t v76 = *(void *)(v26 + 16);
    unint64_t v75 = *(void *)(v26 + 24);
    unint64_t v77 = v76 + 1;
    if (v76 >= v75 >> 1)
    {
      uint64_t result = (uint64_t)sub_253E75978((char *)(v75 > 1), v76 + 1, 1, (char *)v26);
      uint64_t v26 = result;
    }
    uint64_t v149 = v2;
    *(void *)(v26 + 16) = v77;
    uint64_t v78 = v26 + 32;
    uint64_t v79 = (void *)(v26 + 32 + 16 * v76);
    uint64_t v80 = v154;
    *uint64_t v79 = v28;
    v79[1] = v80;
    if (v76) {
      break;
    }
    unint64_t v77 = 1;
LABEL_112:
    uint64_t v27 = *(void *)(a1 + 8);
    uint64_t v25 = v154;
    uint64_t v21 = v141;
    uint64_t v2 = v149;
    if (v154 >= v27) {
      goto LABEL_121;
    }
  }
  while (1)
  {
    unint64_t v81 = v77 - 1;
    if (v77 >= 4)
    {
      unint64_t v86 = v78 + 16 * v77;
      uint64_t v87 = *(void *)(v86 - 64);
      uint64_t v88 = *(void *)(v86 - 56);
      BOOL v92 = __OFSUB__(v88, v87);
      uint64_t v89 = v88 - v87;
      if (v92) {
        goto LABEL_139;
      }
      uint64_t v91 = *(void *)(v86 - 48);
      uint64_t v90 = *(void *)(v86 - 40);
      BOOL v92 = __OFSUB__(v90, v91);
      uint64_t v84 = v90 - v91;
      char v85 = v92;
      if (v92) {
        goto LABEL_140;
      }
      unint64_t v93 = v77 - 2;
      uint64_t v94 = (uint64_t *)(v78 + 16 * (v77 - 2));
      uint64_t v96 = *v94;
      uint64_t v95 = v94[1];
      BOOL v92 = __OFSUB__(v95, v96);
      uint64_t v97 = v95 - v96;
      if (v92) {
        goto LABEL_141;
      }
      BOOL v92 = __OFADD__(v84, v97);
      uint64_t v98 = v84 + v97;
      if (v92) {
        goto LABEL_143;
      }
      if (v98 >= v89)
      {
        uint64_t v116 = (uint64_t *)(v78 + 16 * v81);
        uint64_t v118 = *v116;
        uint64_t v117 = v116[1];
        BOOL v92 = __OFSUB__(v117, v118);
        uint64_t v119 = v117 - v118;
        if (v92) {
          goto LABEL_149;
        }
        BOOL v109 = v84 < v119;
        goto LABEL_101;
      }
    }
    else
    {
      if (v77 != 3)
      {
        uint64_t v110 = *(void *)(v26 + 32);
        uint64_t v111 = *(void *)(v26 + 40);
        BOOL v92 = __OFSUB__(v111, v110);
        uint64_t v103 = v111 - v110;
        char v104 = v92;
        goto LABEL_95;
      }
      uint64_t v83 = *(void *)(v26 + 32);
      uint64_t v82 = *(void *)(v26 + 40);
      BOOL v92 = __OFSUB__(v82, v83);
      uint64_t v84 = v82 - v83;
      char v85 = v92;
    }
    if (v85) {
      goto LABEL_142;
    }
    unint64_t v93 = v77 - 2;
    uint64_t v99 = (uint64_t *)(v78 + 16 * (v77 - 2));
    uint64_t v101 = *v99;
    uint64_t v100 = v99[1];
    BOOL v102 = __OFSUB__(v100, v101);
    uint64_t v103 = v100 - v101;
    char v104 = v102;
    if (v102) {
      goto LABEL_144;
    }
    uint64_t v105 = (uint64_t *)(v78 + 16 * v81);
    uint64_t v107 = *v105;
    uint64_t v106 = v105[1];
    BOOL v92 = __OFSUB__(v106, v107);
    uint64_t v108 = v106 - v107;
    if (v92) {
      goto LABEL_146;
    }
    if (__OFADD__(v103, v108)) {
      goto LABEL_148;
    }
    if (v103 + v108 >= v84)
    {
      BOOL v109 = v84 < v108;
LABEL_101:
      if (v109) {
        unint64_t v81 = v93;
      }
      goto LABEL_103;
    }
LABEL_95:
    if (v104) {
      goto LABEL_145;
    }
    uint64_t v112 = (uint64_t *)(v78 + 16 * v81);
    uint64_t v114 = *v112;
    uint64_t v113 = v112[1];
    BOOL v92 = __OFSUB__(v113, v114);
    uint64_t v115 = v113 - v114;
    if (v92) {
      goto LABEL_147;
    }
    if (v115 < v103) {
      goto LABEL_112;
    }
LABEL_103:
    unint64_t v120 = v81 - 1;
    if (v81 - 1 >= v77)
    {
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
    uint64_t v121 = *(void *)a1;
    if (!*(void *)a1) {
      goto LABEL_162;
    }
    uint64_t v122 = v26;
    a1 = v78 + 16 * v120;
    uint64_t v123 = *(void *)a1;
    uint64_t v124 = (void *)(v78 + 16 * v81);
    uint64_t v125 = v124[1];
    uint64_t v126 = v149;
    uint64_t result = sub_253E75498(v121 + *(void *)(v148 + 72) * *(void *)a1, v121 + *(void *)(v148 + 72) * *v124, v121 + *(void *)(v148 + 72) * v125, v147);
    uint64_t v149 = v126;
    if (v126) {
      break;
    }
    if (v125 < v123) {
      goto LABEL_136;
    }
    if (v81 > *(void *)(v122 + 16)) {
      goto LABEL_137;
    }
    *(void *)a1 = v123;
    *(void *)(v78 + 16 * v120 + 8) = v125;
    unint64_t v127 = *(void *)(v122 + 16);
    if (v81 >= v127) {
      goto LABEL_138;
    }
    uint64_t v26 = v122;
    unint64_t v77 = v127 - 1;
    uint64_t result = (uint64_t)memmove((void *)(v78 + 16 * v81), v124 + 2, 16 * (v127 - 1 - v81));
    *(void *)(v122 + 16) = v127 - 1;
    a1 = v153;
    if (v127 <= 2) {
      goto LABEL_112;
    }
  }
  uint64_t v21 = v141;
  uint64_t v2 = v149;
LABEL_118:
  uint64_t result = swift_bridgeObjectRelease();
  if (v21 < -1)
  {
    __break(1u);
    goto LABEL_120;
  }
LABEL_133:
  *(void *)(v139 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_253E751B0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v26 = a1;
  uint64_t v29 = type metadata accessor for RetrievedContext(0);
  uint64_t v7 = MEMORY[0x270FA5388](v29);
  uint64_t v30 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v24 - v10;
  uint64_t result = MEMORY[0x270FA5388](v9);
  uint64_t v15 = (char *)&v24 - v14;
  uint64_t v28 = a3;
  uint64_t v25 = a2;
  if (a3 != a2)
  {
    uint64_t v27 = *(void *)(v13 + 72);
    uint64_t v31 = v27 * v28;
    uint64_t v32 = v27 * (v28 - 1);
    while (2)
    {
      uint64_t v16 = 0;
      uint64_t v17 = v26;
      do
      {
        sub_253E7626C();
        sub_253E7626C();
        uint64_t v18 = *(int *)(v29 + 32);
        if (v15[v18 + 4] == 3) {
          float v19 = 0.0;
        }
        else {
          float v19 = *(float *)&v15[v18];
        }
        int64_t v20 = &v11[v18];
        uint64_t v21 = v20[4];
        float v22 = *(float *)v20;
        if (v21 == 3) {
          float v23 = 0.0;
        }
        else {
          float v23 = v22;
        }
        sub_253E75DB8();
        uint64_t result = sub_253E75DB8();
        if (v23 >= v19) {
          break;
        }
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        sub_253E76018();
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = sub_253E76018();
        v16 -= v27;
        ++v17;
      }
      while (v28 != v17);
      v32 += v27;
      v31 += v27;
      if (++v28 != v25) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_253E75498(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v69 = type metadata accessor for RetrievedContext(0);
  uint64_t v8 = MEMORY[0x270FA5388](v69);
  uint64_t v67 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v66 = (char *)&v61 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v61 - v13;
  uint64_t result = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v61 - v16;
  uint64_t v19 = *(void *)(v18 + 72);
  if (!v19)
  {
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  int64_t v20 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_88;
  }
  int64_t v22 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v19 == -1) {
    goto LABEL_89;
  }
  unint64_t v68 = a3;
  uint64_t v62 = v19;
  uint64_t v24 = v20 / v19;
  uint64_t v25 = v22 / v19;
  if (v20 / v19 >= v22 / v19)
  {
    uint64_t result = sub_253E736A8(a2, v22 / v19, a4);
    unint64_t v27 = a4 + v25 * v19;
    if (v25 * v19 < 1 || a1 >= a2) {
      goto LABEL_82;
    }
    unint64_t v64 = a1;
    uint64_t v65 = -v19;
    unint64_t v41 = v68;
    unint64_t v63 = a4;
    while (1)
    {
      unint64_t v42 = v41;
      uint64_t v44 = v65;
      uint64_t v43 = v66;
      unint64_t v45 = v27 + v65;
      sub_253E7626C();
      unint64_t v46 = a2 + v44;
      unint64_t v47 = v27;
      float v48 = v67;
      sub_253E7626C();
      uint64_t v49 = *(int *)(v69 + 32);
      if (v43[v49 + 4] == 3) {
        float v50 = 0.0;
      }
      else {
        float v50 = *(float *)&v43[v49];
      }
      BOOL v51 = &v48[v49];
      uint64_t v52 = v51[4];
      float v53 = *(float *)v51;
      if (v52 == 3) {
        float v54 = 0.0;
      }
      else {
        float v54 = v53;
      }
      unint64_t v41 = v42 + v44;
      sub_253E75DB8();
      uint64_t result = sub_253E75DB8();
      if (v54 >= v50)
      {
        if (v42 >= v47 && v41 < v47)
        {
          unint64_t v57 = v64;
          if (v42 != v47) {
            uint64_t result = swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v27 = v45;
          goto LABEL_76;
        }
        uint64_t result = swift_arrayInitWithTakeFrontToBack();
        unint64_t v27 = v45;
      }
      else
      {
        BOOL v55 = v42 < a2 || v41 >= a2;
        unint64_t v27 = v47;
        if (!v55)
        {
          unint64_t v57 = v64;
          if (v42 != a2) {
            uint64_t result = swift_arrayInitWithTakeBackToFront();
          }
          a2 = v46;
LABEL_76:
          a4 = v63;
          goto LABEL_77;
        }
        uint64_t result = swift_arrayInitWithTakeFrontToBack();
        a2 = v46;
      }
      a4 = v63;
      unint64_t v57 = v64;
LABEL_77:
      if (v27 <= a4 || a2 <= v57)
      {
        uint64_t v19 = v62;
        goto LABEL_82;
      }
    }
  }
  uint64_t result = sub_253E736A8(a1, v20 / v19, a4);
  uint64_t v26 = v24 * v19;
  unint64_t v27 = a4 + v24 * v19;
  if (v26 >= 1 && a2 < v68)
  {
    do
    {
      sub_253E7626C();
      sub_253E7626C();
      uint64_t v29 = *(int *)(v69 + 32);
      if (v17[v29 + 4] == 3) {
        float v30 = 0.0;
      }
      else {
        float v30 = *(float *)&v17[v29];
      }
      uint64_t v31 = &v14[v29];
      uint64_t v32 = v31[4];
      float v33 = *(float *)v31;
      if (v32 == 3) {
        float v34 = 0.0;
      }
      else {
        float v34 = v33;
      }
      sub_253E75DB8();
      uint64_t result = sub_253E75DB8();
      if (v34 >= v30)
      {
        unint64_t v37 = a4 + v19;
        if (a1 < a4 || a1 >= v37)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != a4)
        {
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        unint64_t v35 = a2;
        a4 = v37;
        uint64_t v19 = v62;
      }
      else
      {
        unint64_t v35 = a2 + v19;
        if (a1 < a2 || a1 >= v35)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != a2)
        {
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
      }
      a1 += v19;
      BOOL v39 = a4 >= v27 || v35 >= v68;
      a2 = v35;
    }
    while (!v39);
  }
  a2 = a1;
LABEL_82:
  int64_t v59 = v27 - a4;
  if (v19 != -1 || v59 != 0x8000000000000000)
  {
    sub_253E736A8(a4, v59 / v19, a2);
    return 1;
  }
LABEL_90:
  __break(1u);
  return result;
}

char *sub_253E75978(char *result, int64_t a2, char a3, char *a4)
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
    sub_253E390C4(&qword_269D98968);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_253E75A70(uint64_t a1)
{
  return sub_253E75978(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t (*sub_253E75A84(uint64_t a1, uint64_t a2))(unint64_t result)
{
  uint64_t v3 = v2;
  *(void *)(a1 + 8) = v2;
  *(unsigned char *)(a1 + 24) = a2;
  uint64_t v6 = *v2;
  unint64_t v7 = sub_253E73870(a2);
  *(unsigned char *)(a1 + 25) = v8 & 1;
  if (__OFADD__(*(void *)(v6 + 16), (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v9 = v7;
  char v10 = v8;
  sub_253E390C4(&qword_269D98970);
  if (sub_253E82550())
  {
    unint64_t v11 = sub_253E73870(a2);
    if ((v10 & 1) == (v12 & 1))
    {
      unint64_t v9 = v11;
      goto LABEL_5;
    }
LABEL_10:
    uint64_t result = (unint64_t (*)(unint64_t))sub_253E827A0();
    __break(1u);
    return result;
  }
LABEL_5:
  *(void *)(a1 + 16) = v9;
  if (v10) {
    uint64_t v13 = *(void *)(*(void *)(*v3 + 56) + 8 * v9);
  }
  else {
    uint64_t v13 = 0;
  }
  *(void *)a1 = v13;
  return sub_253E75B94;
}

unint64_t sub_253E75B94(unint64_t result)
{
  uint64_t v1 = *(void *)result;
  if (*(void *)result)
  {
    uint64_t v2 = **(void ***)(result + 8);
    if (*(unsigned char *)(result + 25))
    {
      *(void *)(v2[7] + 8 * *(void *)(result + 16)) = v1;
    }
    else
    {
      char v4 = *(unsigned char *)(result + 24);
      unint64_t v5 = *(void *)(result + 16);
      return sub_253E75C94(v5, v4, v1, v2);
    }
  }
  else if (*(unsigned char *)(result + 25))
  {
    sub_253E390C4(&qword_269D98338);
    sub_253E7F7B8();
    uint64_t v3 = sub_253E39ECC();
    return MEMORY[0x270F9EF20](v3);
  }
  return result;
}

uint64_t (*sub_253E75C58(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  void *v1 = 0x8000000000000000;
  return sub_253E75C88;
}

uint64_t sub_253E75C88(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

unint64_t sub_253E75C94(unint64_t result, char a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(unsigned char *)(a4[6] + result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

uint64_t sub_253E75CD8(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_253E75CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_253E82810();
  if (v3)
  {
    uint64_t v5 = a2 + 48;
    do
    {
      v5 += 24;
      swift_bridgeObjectRetain();
      sub_253E82360();
      sub_253E82830();
      uint64_t result = swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t type metadata accessor for UIControlTool(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_269D98630);
}

uint64_t type metadata accessor for RetrievedTool.Definition(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_269D98620);
}

uint64_t sub_253E75DB8()
{
  uint64_t v1 = sub_253E80120();
  v2(v1);
  sub_253E5C174();
  sub_253E4AE7C();
  v3();
  return v0;
}

uint64_t sub_253E75E08(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_253E75E50()
{
  unint64_t result = qword_269D98018;
  if (!qword_269D98018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98018);
  }
  return result;
}

unint64_t sub_253E75E9C()
{
  unint64_t result = qword_269D98020;
  if (!qword_269D98020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98020);
  }
  return result;
}

unint64_t sub_253E75EE8()
{
  unint64_t result = qword_269D98030;
  if (!qword_269D98030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98030);
  }
  return result;
}

unint64_t sub_253E75F34()
{
  unint64_t result = qword_269D98040;
  if (!qword_269D98040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98040);
  }
  return result;
}

unint64_t sub_253E75F80()
{
  unint64_t result = qword_269D98048;
  if (!qword_269D98048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98048);
  }
  return result;
}

unint64_t sub_253E75FCC()
{
  unint64_t result = qword_269D98058;
  if (!qword_269D98058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98058);
  }
  return result;
}

uint64_t sub_253E76018()
{
  uint64_t v1 = sub_253E80150();
  v2(v1);
  sub_253E5C174();
  sub_253E7FE94();
  v3();
  return v0;
}

uint64_t sub_253E7606C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RetrievedTool.Definition(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RetrievedTool(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_269D98610);
}

unint64_t sub_253E760F0()
{
  unint64_t result = qword_269D980B0;
  if (!qword_269D980B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D980B0);
  }
  return result;
}

unint64_t sub_253E7613C()
{
  unint64_t result = qword_269D980D0;
  if (!qword_269D980D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D980D0);
  }
  return result;
}

unint64_t sub_253E76188()
{
  unint64_t result = qword_269D980D8;
  if (!qword_269D980D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D980D8);
  }
  return result;
}

unint64_t sub_253E761D4()
{
  unint64_t result = qword_269D980F8;
  if (!qword_269D980F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D980F8);
  }
  return result;
}

unint64_t sub_253E76220()
{
  unint64_t result = qword_269D98100;
  if (!qword_269D98100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98100);
  }
  return result;
}

uint64_t sub_253E7626C()
{
  uint64_t v1 = sub_253E80150();
  v2(v1);
  sub_253E5C174();
  uint64_t v3 = sub_253E803F4();
  v4(v3);
  return v0;
}

uint64_t sub_253E762B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253E390C4(&qword_269D97FB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_253E76320()
{
  unint64_t result = qword_269D98110;
  if (!qword_269D98110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98110);
  }
  return result;
}

unint64_t sub_253E7636C()
{
  unint64_t result = qword_269D98128;
  if (!qword_269D98128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98128);
  }
  return result;
}

unint64_t sub_253E763B8()
{
  unint64_t result = qword_269D98170;
  if (!qword_269D98170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98170);
  }
  return result;
}

unint64_t sub_253E76404()
{
  unint64_t result = qword_269D98178;
  if (!qword_269D98178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98178);
  }
  return result;
}

unint64_t sub_253E76450()
{
  unint64_t result = qword_269D98180;
  if (!qword_269D98180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98180);
  }
  return result;
}

unint64_t sub_253E7649C()
{
  unint64_t result = qword_269D98188;
  if (!qword_269D98188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98188);
  }
  return result;
}

unint64_t sub_253E764E8()
{
  unint64_t result = qword_269D98190;
  if (!qword_269D98190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98190);
  }
  return result;
}

unint64_t sub_253E76534()
{
  unint64_t result = qword_269D98198;
  if (!qword_269D98198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98198);
  }
  return result;
}

unint64_t sub_253E76580()
{
  unint64_t result = qword_269D981A0;
  if (!qword_269D981A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D981A0);
  }
  return result;
}

unint64_t sub_253E765CC()
{
  unint64_t result = qword_269D98210;
  if (!qword_269D98210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98210);
  }
  return result;
}

unint64_t sub_253E76618()
{
  unint64_t result = qword_269D98218;
  if (!qword_269D98218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98218);
  }
  return result;
}

unint64_t sub_253E76664()
{
  unint64_t result = qword_269D98230;
  if (!qword_269D98230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98230);
  }
  return result;
}

unint64_t sub_253E766B0()
{
  unint64_t result = qword_269D98248;
  if (!qword_269D98248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98248);
  }
  return result;
}

unint64_t sub_253E766FC()
{
  unint64_t result = qword_269D98258;
  if (!qword_269D98258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98258);
  }
  return result;
}

uint64_t type metadata accessor for DynamicEnumerationEntity(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_269D98658);
}

unint64_t sub_253E76768()
{
  unint64_t result = qword_269D98270;
  if (!qword_269D98270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98270);
  }
  return result;
}

uint64_t sub_253E767B4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_253E76818()
{
  unint64_t result = qword_269D98318;
  if (!qword_269D98318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98318);
  }
  return result;
}

unint64_t sub_253E76864()
{
  unint64_t result = qword_269D98328;
  if (!qword_269D98328)
  {
    sub_253E3AE54(&qword_269D98320);
    sub_253E75E08(&qword_269D98330, (void (*)(uint64_t))type metadata accessor for SpanMatchedEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98328);
  }
  return result;
}

uint64_t type metadata accessor for SpanMatchedEntity(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_269D98688);
}

unint64_t sub_253E76928()
{
  unint64_t result = qword_269D98340;
  if (!qword_269D98340)
  {
    sub_253E3AE54(&qword_269D98338);
    sub_253E75E08(&qword_269D98348, (void (*)(uint64_t))type metadata accessor for RetrievedContext);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98340);
  }
  return result;
}

unint64_t sub_253E769CC()
{
  unint64_t result = qword_269D98350;
  if (!qword_269D98350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98350);
  }
  return result;
}

unint64_t sub_253E76A18()
{
  unint64_t result = qword_269D98360;
  if (!qword_269D98360)
  {
    sub_253E3AE54(&qword_269D98358);
    sub_253E75E08(&qword_269D98368, (void (*)(uint64_t))type metadata accessor for DynamicEnumerationEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98360);
  }
  return result;
}

uint64_t sub_253E76ABC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_253E76B20()
{
  unint64_t result = qword_269D98378;
  if (!qword_269D98378)
  {
    sub_253E3AE54(&qword_269D98320);
    sub_253E75E08(&qword_269D98380, (void (*)(uint64_t))type metadata accessor for SpanMatchedEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98378);
  }
  return result;
}

unint64_t sub_253E76BC4()
{
  unint64_t result = qword_269D98388;
  if (!qword_269D98388)
  {
    sub_253E3AE54(&qword_269D98338);
    sub_253E75E08(&qword_269D98390, (void (*)(uint64_t))type metadata accessor for RetrievedContext);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98388);
  }
  return result;
}

unint64_t sub_253E76C68()
{
  unint64_t result = qword_269D98398;
  if (!qword_269D98398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98398);
  }
  return result;
}

unint64_t sub_253E76CB4()
{
  unint64_t result = qword_269D983A0;
  if (!qword_269D983A0)
  {
    sub_253E3AE54(&qword_269D98358);
    sub_253E75E08(&qword_269D983A8, (void (*)(uint64_t))type metadata accessor for DynamicEnumerationEntity);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D983A0);
  }
  return result;
}

unint64_t sub_253E76D58()
{
  unint64_t result = qword_269D983B8;
  if (!qword_269D983B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D983B8);
  }
  return result;
}

unint64_t sub_253E76DA4()
{
  unint64_t result = qword_269D983C8;
  if (!qword_269D983C8)
  {
    sub_253E3AE54(&qword_269D983C0);
    sub_253E75E08(&qword_269D983D0, (void (*)(uint64_t))type metadata accessor for RetrievedTool);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D983C8);
  }
  return result;
}

unint64_t sub_253E76E48()
{
  unint64_t result = qword_269D983E0;
  if (!qword_269D983E0)
  {
    sub_253E3AE54(&qword_269D983D8);
    sub_253E75E08(&qword_269D983E8, MEMORY[0x263F80768]);
    sub_253E75E08(&qword_269D983F0, MEMORY[0x263F805E8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D983E0);
  }
  return result;
}

unint64_t sub_253E76F24()
{
  unint64_t result = qword_269D98400;
  if (!qword_269D98400)
  {
    sub_253E3AE54(&qword_269D983C0);
    sub_253E75E08(&qword_269D98408, (void (*)(uint64_t))type metadata accessor for RetrievedTool);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98400);
  }
  return result;
}

unint64_t sub_253E76FC8()
{
  unint64_t result = qword_269D98410;
  if (!qword_269D98410)
  {
    sub_253E3AE54(&qword_269D983D8);
    sub_253E75E08(&qword_269D98418, MEMORY[0x263F80768]);
    sub_253E75E08(&qword_269D98420, MEMORY[0x263F805E8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98410);
  }
  return result;
}

uint64_t type metadata accessor for ToolRetrievalType(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_269D98668);
}

unint64_t sub_253E770C4()
{
  unint64_t result = qword_269D98430;
  if (!qword_269D98430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98430);
  }
  return result;
}

unint64_t sub_253E77110()
{
  unint64_t result = qword_269D98450;
  if (!qword_269D98450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98450);
  }
  return result;
}

unint64_t sub_253E7715C()
{
  unint64_t result = qword_269D98460;
  if (!qword_269D98460)
  {
    sub_253E3AE54(&qword_269D98458);
    sub_253E75E08(&qword_269D98468, (void (*)(uint64_t))type metadata accessor for IdentifiedEntityValue);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98460);
  }
  return result;
}

uint64_t type metadata accessor for IdentifiedEntityValue(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_269D98678);
}

unint64_t sub_253E77220()
{
  unint64_t result = qword_269D98478;
  if (!qword_269D98478)
  {
    sub_253E3AE54(&qword_269D98458);
    sub_253E75E08(&qword_269D98480, (void (*)(uint64_t))type metadata accessor for IdentifiedEntityValue);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98478);
  }
  return result;
}

unint64_t sub_253E772C4()
{
  unint64_t result = qword_269D984B8;
  if (!qword_269D984B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D984B8);
  }
  return result;
}

unint64_t sub_253E77310()
{
  unint64_t result = qword_269D984C0;
  if (!qword_269D984C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D984C0);
  }
  return result;
}

unint64_t sub_253E7735C()
{
  unint64_t result = qword_269D984C8;
  if (!qword_269D984C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D984C8);
  }
  return result;
}

uint64_t sub_253E773A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_253E390C4(a3);
  sub_253E5C174();
  uint64_t v4 = sub_253E803F4();
  v5(v4);
  return a2;
}

unint64_t sub_253E773F8()
{
  unint64_t result = qword_269D984F0;
  if (!qword_269D984F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D984F0);
  }
  return result;
}

unint64_t sub_253E77444()
{
  unint64_t result = qword_269D98508;
  if (!qword_269D98508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98508);
  }
  return result;
}

uint64_t sub_253E77490(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_253E3AE54(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_253E774FC()
{
  unint64_t result = qword_269D98520;
  if (!qword_269D98520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98520);
  }
  return result;
}

uint64_t sub_253E77548(uint64_t a1)
{
  return a1;
}

uint64_t sub_253E775C0(uint64_t a1)
{
  return a1;
}

unint64_t sub_253E77638()
{
  unint64_t result = qword_269D98530;
  if (!qword_269D98530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98530);
  }
  return result;
}

unint64_t sub_253E77684()
{
  unint64_t result = qword_269D98538;
  if (!qword_269D98538)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98538);
  }
  return result;
}

unint64_t sub_253E776D0()
{
  unint64_t result = qword_269D98540;
  if (!qword_269D98540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98540);
  }
  return result;
}

unint64_t sub_253E7771C()
{
  unint64_t result = qword_269D98550;
  if (!qword_269D98550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98550);
  }
  return result;
}

unint64_t sub_253E77768()
{
  unint64_t result = qword_269D98558;
  if (!qword_269D98558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98558);
  }
  return result;
}

unint64_t sub_253E777B4()
{
  unint64_t result = qword_269D98568;
  if (!qword_269D98568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98568);
  }
  return result;
}

unint64_t sub_253E77800()
{
  unint64_t result = qword_269D98570;
  if (!qword_269D98570)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98570);
  }
  return result;
}

unint64_t sub_253E7784C()
{
  unint64_t result = qword_269D98580;
  if (!qword_269D98580)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98580);
  }
  return result;
}

unint64_t sub_253E7789C()
{
  unint64_t result = qword_269D98590;
  if (!qword_269D98590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98590);
  }
  return result;
}

uint64_t sub_253E778E8()
{
  return sub_253E75E08(&qword_269D98598, (void (*)(uint64_t))type metadata accessor for RetrievedTool.Definition);
}

uint64_t sub_253E77930()
{
  return sub_253E75E08(&qword_269D985A0, (void (*)(uint64_t))type metadata accessor for RetrievedTool);
}

uint64_t sub_253E77978()
{
  return sub_253E75E08(&qword_269D985A8, (void (*)(uint64_t))type metadata accessor for UIControlTool);
}

unint64_t sub_253E779C4()
{
  unint64_t result = qword_269D985B0;
  if (!qword_269D985B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D985B0);
  }
  return result;
}

unint64_t sub_253E77A14()
{
  unint64_t result = qword_269D985B8;
  if (!qword_269D985B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D985B8);
  }
  return result;
}

unint64_t sub_253E77A64()
{
  unint64_t result = qword_269D985C0;
  if (!qword_269D985C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D985C0);
  }
  return result;
}

unint64_t sub_253E77AB4()
{
  unint64_t result = qword_269D985C8;
  if (!qword_269D985C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D985C8);
  }
  return result;
}

unint64_t sub_253E77B04()
{
  unint64_t result = qword_269D985D0;
  if (!qword_269D985D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D985D0);
  }
  return result;
}

unint64_t sub_253E77B54()
{
  unint64_t result = qword_269D985D8;
  if (!qword_269D985D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D985D8);
  }
  return result;
}

uint64_t sub_253E77BA0()
{
  return sub_253E75E08(&qword_269D985E0, (void (*)(uint64_t))type metadata accessor for IdentifiedEntityValue);
}

unint64_t sub_253E77BEC()
{
  unint64_t result = qword_269D985E8;
  if (!qword_269D985E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D985E8);
  }
  return result;
}

unint64_t sub_253E77C3C()
{
  unint64_t result = qword_269D985F0;
  if (!qword_269D985F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D985F0);
  }
  return result;
}

unint64_t sub_253E77C8C()
{
  unint64_t result = qword_269D985F8;
  if (!qword_269D985F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D985F8);
  }
  return result;
}

unint64_t sub_253E77CDC()
{
  unint64_t result = qword_269D98600;
  if (!qword_269D98600)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98600);
  }
  return result;
}

unint64_t sub_253E77D2C()
{
  unint64_t result = qword_269D98608;
  if (!qword_269D98608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98608);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for RetrievedTool(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    type metadata accessor for RetrievedTool.Definition(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v9 = sub_253E822C0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
        break;
      case 4u:
        uint64_t v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        uint64_t v11 = a2[3];
        a1[2] = a2[2];
        a1[3] = v11;
        uint64_t v12 = a2[5];
        a1[4] = a2[4];
        a1[5] = v12;
        uint64_t v13 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
        uint64_t v14 = (char *)a1 + v13;
        uint64_t v15 = (char *)a2 + v13;
        uint64_t v16 = sub_253E821E0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v15, 1, v16))
        {
          uint64_t v17 = sub_253E390C4(&qword_269D97FB8);
          memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
          _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v14, 0, 1, v16);
        }
        break;
      default:
        uint64_t v7 = sub_253E821E0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        break;
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for RetrievedTool(uint64_t a1)
{
  type metadata accessor for RetrievedTool.Definition(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 2u:
    case 3u:
      uint64_t v2 = sub_253E821E0();
      goto LABEL_4;
    case 1u:
      uint64_t v2 = sub_253E822C0();
LABEL_4:
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
      break;
    case 4u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v4 = a1 + *(int *)(type metadata accessor for UIControlTool(0) + 28);
      uint64_t v5 = sub_253E821E0();
      if (!_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v4, 1, v5)) {
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
      }
      break;
    default:
      break;
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RetrievedTool(void *a1, void *a2, int *a3)
{
  type metadata accessor for RetrievedTool.Definition(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v7 = sub_253E822C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      break;
    case 4u:
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      uint64_t v9 = a2[3];
      a1[2] = a2[2];
      a1[3] = v9;
      uint64_t v10 = a2[5];
      a1[4] = a2[4];
      a1[5] = v10;
      uint64_t v11 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
      uint64_t v12 = (char *)a1 + v11;
      uint64_t v13 = (char *)a2 + v11;
      uint64_t v14 = sub_253E821E0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v13, 1, v14))
      {
        uint64_t v15 = sub_253E390C4(&qword_269D97FB8);
        memcpy(v12, v13, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
        _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v12, 0, 1, v14);
      }
      break;
    default:
      uint64_t v6 = sub_253E821E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      break;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = a3[6];
  *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RetrievedTool(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_253E75DB8();
    type metadata accessor for RetrievedTool.Definition(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v7 = sub_253E822C0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        break;
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        uint64_t v8 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
        uint64_t v9 = (char *)a1 + v8;
        uint64_t v10 = (char *)a2 + v8;
        uint64_t v11 = sub_253E821E0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v10, 1, v11))
        {
          uint64_t v12 = sub_253E390C4(&qword_269D97FB8);
          memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
          _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v9, 0, 1, v11);
        }
        break;
      default:
        uint64_t v6 = sub_253E821E0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

_OWORD *initializeWithTake for RetrievedTool(_OWORD *a1, _OWORD *a2, int *a3)
{
  type metadata accessor for RetrievedTool.Definition(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v7 = sub_253E822C0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      break;
    case 4u:
      long long v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      a1[2] = a2[2];
      uint64_t v9 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_253E821E0();
      if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v11, 1, v12))
      {
        uint64_t v13 = sub_253E390C4(&qword_269D97FB8);
        memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
        _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v12);
      }
      break;
    default:
      uint64_t v6 = sub_253E821E0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      break;
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = a3[6];
  *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

_OWORD *assignWithTake for RetrievedTool(_OWORD *a1, _OWORD *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_253E75DB8();
    type metadata accessor for RetrievedTool.Definition(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v7 = sub_253E822C0();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
        break;
      case 4u:
        long long v8 = a2[1];
        *a1 = *a2;
        a1[1] = v8;
        a1[2] = a2[2];
        uint64_t v9 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
        uint64_t v10 = (char *)a1 + v9;
        uint64_t v11 = (char *)a2 + v9;
        uint64_t v12 = sub_253E821E0();
        if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v11, 1, v12))
        {
          uint64_t v13 = sub_253E390C4(&qword_269D97FB8);
          memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
          _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v12);
        }
        break;
      default:
        uint64_t v6 = sub_253E821E0();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = a3[6];
  *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

uint64_t getEnumTagSinglePayload for RetrievedTool(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253E78D94);
}

uint64_t sub_253E78D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_253E80120();
  type metadata accessor for RetrievedTool.Definition(v6);
  sub_253E7F944();
  if (*(_DWORD *)(v8 + 84) != a2) {
    return sub_253E7FC8C(*(void *)(v3 + *(int *)(a3 + 24)));
  }

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v3, a2, v7);
}

uint64_t storeEnumTagSinglePayload for RetrievedTool(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253E78E24);
}

void sub_253E78E24()
{
  uint64_t v4 = sub_253E80248();
  type metadata accessor for RetrievedTool.Definition(v4);
  sub_253E7F944();
  if (*(_DWORD *)(v5 + 84) == v3)
  {
    sub_253E800F0();
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v6, v7, v8, v9);
  }
  else
  {
    *(void *)(v1 + *(int *)(v2 + 24)) = (v0 - 1);
  }
}

uint64_t sub_253E78E98()
{
  uint64_t result = type metadata accessor for RetrievedTool.Definition(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for RetrievedTool.Stage()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for RetrievedTool.Definition(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v8 = sub_253E822C0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        break;
      case 4u:
        uint64_t v9 = a2[1];
        *a1 = *a2;
        a1[1] = v9;
        uint64_t v10 = a2[3];
        a1[2] = a2[2];
        a1[3] = v10;
        uint64_t v11 = a2[5];
        a1[4] = a2[4];
        a1[5] = v11;
        uint64_t v12 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
        uint64_t v13 = (char *)a1 + v12;
        uint64_t v14 = (char *)a2 + v12;
        uint64_t v15 = sub_253E821E0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v14, 1, v15))
        {
          uint64_t v16 = sub_253E390C4(&qword_269D97FB8);
          memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
          _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v13, 0, 1, v15);
        }
        break;
      default:
        uint64_t v6 = sub_253E821E0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for RetrievedTool.Definition(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 2:
    case 3:
      uint64_t v3 = sub_253E821E0();
      goto LABEL_4;
    case 1:
      uint64_t v3 = sub_253E822C0();
LABEL_4:
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t v5 = v3;
      uint64_t v6 = a1;
      goto LABEL_5;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v7 = a1 + *(int *)(type metadata accessor for UIControlTool(0) + 28);
      uint64_t v8 = sub_253E821E0();
      uint64_t result = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v7, 1, v8);
      if (result) {
        return result;
      }
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
      uint64_t v6 = v7;
      uint64_t v5 = v8;
LABEL_5:
      return v4(v6, v5);
    default:
      return result;
  }
}

void *initializeWithCopy for RetrievedTool.Definition(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v5 = sub_253E822C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
      break;
    case 4u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      uint64_t v7 = a2[3];
      a1[2] = a2[2];
      a1[3] = v7;
      uint64_t v8 = a2[5];
      a1[4] = a2[4];
      a1[5] = v8;
      uint64_t v9 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_253E821E0();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v11, 1, v12))
      {
        uint64_t v13 = sub_253E390C4(&qword_269D97FB8);
        memcpy(v10, v11, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
        _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v12);
      }
      break;
    default:
      uint64_t v4 = sub_253E821E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for RetrievedTool.Definition(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_253E75DB8();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v5 = sub_253E822C0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
        break;
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        uint64_t v6 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
        uint64_t v7 = (char *)a1 + v6;
        uint64_t v8 = (char *)a2 + v6;
        uint64_t v9 = sub_253E821E0();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v8, 1, v9))
        {
          uint64_t v10 = sub_253E390C4(&qword_269D97FB8);
          memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
          _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v7, 0, 1, v9);
        }
        break;
      default:
        uint64_t v4 = sub_253E821E0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for RetrievedTool.Definition(_OWORD *a1, _OWORD *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v5 = sub_253E822C0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      break;
    case 4u:
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      a1[2] = a2[2];
      uint64_t v7 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_253E821E0();
      if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v9, 1, v10))
      {
        uint64_t v11 = sub_253E390C4(&qword_269D97FB8);
        memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
        _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v8, 0, 1, v10);
      }
      break;
    default:
      uint64_t v4 = sub_253E821E0();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_OWORD *assignWithTake for RetrievedTool.Definition(_OWORD *a1, _OWORD *a2)
{
  if (a1 != a2)
  {
    sub_253E75DB8();
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v5 = sub_253E822C0();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
        break;
      case 4u:
        long long v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        a1[2] = a2[2];
        uint64_t v7 = *(int *)(type metadata accessor for UIControlTool(0) + 28);
        uint64_t v8 = (char *)a1 + v7;
        uint64_t v9 = (char *)a2 + v7;
        uint64_t v10 = sub_253E821E0();
        if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v9, 1, v10))
        {
          uint64_t v11 = sub_253E390C4(&qword_269D97FB8);
          memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
          _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v8, 0, 1, v10);
        }
        break;
      default:
        uint64_t v4 = sub_253E821E0();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_253E79E2C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_253E79E3C()
{
  uint64_t result = sub_253E821E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_253E822C0();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for UIControlTool(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for UIControlTool(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
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
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = sub_253E821E0();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v9, 1, v11))
    {
      uint64_t v12 = sub_253E390C4(&qword_269D97FB8);
      memcpy(v10, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v10, v9, v11);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v11);
    }
  }
  return v3;
}

uint64_t destroy for UIControlTool(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_253E821E0();
  uint64_t result = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

void *initializeWithCopy for UIControlTool(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = sub_253E821E0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v8, 1, v10))
  {
    uint64_t v11 = sub_253E390C4(&qword_269D97FB8);
    memcpy(v9, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v9, v8, v10);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v9, 0, 1, v10);
  }
  return a1;
}

void *assignWithCopy for UIControlTool(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253E821E0();
  int v10 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v7, 1, v9);
  int v11 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v8, 1, v9);
  if (!v10)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = sub_253E390C4(&qword_269D97FB8);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for UIControlTool(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_253E821E0();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = sub_253E390C4(&qword_269D97FB8);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

void *assignWithTake for UIControlTool(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(int *)(a3 + 28);
  int v10 = (char *)a1 + v9;
  int v11 = (char *)a2 + v9;
  uint64_t v12 = sub_253E821E0();
  int v13 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v10, 1, v12);
  int v14 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v11, 1, v12);
  if (!v13)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v16 = sub_253E390C4(&qword_269D97FB8);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v10, 0, 1, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for UIControlTool(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253E7A6A0);
}

uint64_t sub_253E7A6A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return sub_253E7FC8C(*(void *)(a1 + 8));
  }
  uint64_t v7 = sub_253E390C4(&qword_269D97FB8);
  uint64_t v8 = a1 + *(int *)(a3 + 28);

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for UIControlTool(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253E7A734);
}

void sub_253E7A734()
{
  sub_253E802D8();
  if (v2)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    sub_253E390C4(&qword_269D97FB8);
    sub_253E800F0();
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v3, v4, v5, v6);
  }
}

void sub_253E7A7A8()
{
  sub_253E7CCC8(319, &qword_269D98640, MEMORY[0x263F7FED0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_253E7A864(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SampleInvocation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for SampleInvocation(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SampleInvocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SampleInvocation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 20))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SampleInvocation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 20) = 1;
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
    *(unsigned char *)(result + 20) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for SampleInvocation()
{
}

void type metadata accessor for QueryDecorationCoreService()
{
}

uint64_t sub_253E7A9E4()
{
  return type metadata accessor for QueryDecorationInput(0);
}

uint64_t type metadata accessor for QueryDecorationInput(uint64_t a1)
{
  return sub_253E4DCDC(a1, (uint64_t *)&unk_269D98648);
}

uint64_t sub_253E7AA0C()
{
  uint64_t result = sub_253E82140();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for QueryDecorationInput(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QueryDecorationInput);
}

uint64_t dispatch thunk of QueryDecorationInput.__allocating_init(query:servicesExecuted:requestId:contextId:loggingSalt:caller:requiredContextReturned:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of QueryDecorationInput.__allocating_init(query:requestId:caller:maxToolsReturned:maxSpansReturned:maxUtteranceContextReturned:requiredContextReturned:spanTypeFilters:contextId:loggingSalt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))(v7 + 136))(a1, a2, a3, a4, a5, a6, a7 & 1);
}

uint64_t dispatch thunk of QueryDecorationInput.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

void type metadata accessor for QueryDecorationCaller()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for DynamicEnumerationEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    int v10 = (char *)a2 + v8;
    uint64_t v11 = sub_253E82260();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    int v14 = (char *)v4 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = sub_253E82240();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return v4;
}

uint64_t destroy for DynamicEnumerationEntity(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_253E82260();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_253E82240();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

void *initializeWithCopy for DynamicEnumerationEntity(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_253E82260();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  int v14 = (char *)a2 + v12;
  uint64_t v15 = sub_253E82240();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

void *assignWithCopy for DynamicEnumerationEntity(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253E82260();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_253E82240();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *initializeWithTake for DynamicEnumerationEntity(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_253E82260();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_253E82240();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

void *assignWithTake for DynamicEnumerationEntity(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_253E82260();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_253E82240();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for DynamicEnumerationEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253E7B134);
}

uint64_t sub_253E7B134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF) {
    return sub_253E7FC8C(*(void *)(a1 + 8));
  }
  sub_253E82260();
  sub_253E7F944();
  if (*(_DWORD *)(v8 + 84) == a2)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(int *)(a3 + 20);
  }
  else
  {
    uint64_t v9 = sub_253E82240();
    uint64_t v10 = *(int *)(a3 + 24);
  }

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1 + v10, a2, v9);
}

uint64_t storeEnumTagSinglePayload for DynamicEnumerationEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253E7B1E8);
}

void sub_253E7B1E8()
{
  sub_253E802D8();
  if (v3)
  {
    *(void *)(v1 + 8) = (v0 - 1);
  }
  else
  {
    int v4 = v2;
    sub_253E82260();
    sub_253E7F944();
    if (*(_DWORD *)(v5 + 84) != v4) {
      sub_253E82240();
    }
    sub_253E800F0();
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v6, v7, v8, v9);
  }
}

uint64_t sub_253E7B280()
{
  uint64_t result = sub_253E82260();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_253E82240();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for QueryDecorationOutput()
{
  return self;
}

uint64_t method lookup function for QueryDecorationOutput(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for QueryDecorationOutput);
}

uint64_t dispatch thunk of QueryDecorationOutput.__allocating_init(spans:requiredContext:utteranceContext:queryDecorationToolRetrievalResponse:dynamicEnumerationEntities:context:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of QueryDecorationOutput.__allocating_init(spans:requiredContext:utteranceContext:originalRankedTools:adjustedRankedTools:originalRankedSpans:adjustedRankedSpans:originalRankedUtteranceContext:adjustedRankedUtteranceContext:queryDecorationToolRetrievalResponse:dynamicEnumerationEntities:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of QueryDecorationOutput.__allocating_init(spans:requiredContext:utteranceContext:originalRankedTools:adjustedRankedTools:originalRankedSpans:adjustedRankedSpans:originalRankedUtteranceContext:adjustedRankedUtteranceContext:queryDecorationToolRetrievalResponse:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of QueryDecorationOutput.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t destroy for QueryDecorationToolRetrievalResponse()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for QueryDecorationToolRetrievalResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for QueryDecorationToolRetrievalResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for QueryDecorationToolRetrievalResponse(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for QueryDecorationToolRetrievalResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for QueryDecorationToolRetrievalResponse(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QueryDecorationToolRetrievalResponse(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for QueryDecorationToolRetrievalResponse()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for ToolRetrievalType(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_253E822A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_253E82280();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for ToolRetrievalType(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_253E822A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_253E82280();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t initializeWithCopy for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_253E822A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_253E82280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_253E822A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_253E82280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_253E822A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_253E82280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_253E822A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_253E82280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253E7BB28);
}

uint64_t sub_253E7BB28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_253E822A0();
  sub_253E7F944();
  if (*(_DWORD *)(v6 + 84) == a2)
  {
    uint64_t v7 = sub_253E804AC();
  }
  else
  {
    uint64_t v8 = sub_253E82280();
    uint64_t v7 = a1 + *(int *)(a3 + 20);
  }

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(v7, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ToolRetrievalType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253E7BBB4);
}

uint64_t sub_253E7BBB4()
{
  sub_253E80248();
  sub_253E822A0();
  sub_253E7F944();
  if (*(_DWORD *)(v1 + 84) != v0) {
    sub_253E82280();
  }
  sub_253E800F0();

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v2, v3, v4, v5);
}

uint64_t sub_253E7BC24()
{
  uint64_t result = sub_253E822A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_253E82280();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for QueryDecorationLookback(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for QueryDecorationLookback()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for QueryDecorationLookback(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for QueryDecorationLookback(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for QueryDecorationLookback(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for QueryDecorationLookback(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QueryDecorationLookback(uint64_t result, unsigned int a2, unsigned int a3)
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

void type metadata accessor for QueryDecorationLookback()
{
}

uint64_t *initializeBufferWithCopyOfBuffer for IdentifiedEntityValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_253E82240();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      uint64_t v7 = *(int *)(sub_253E390C4(&qword_269D98488) + 48);
      uint64_t v8 = (uint64_t *)((char *)a1 + v7);
      uint64_t v9 = (uint64_t *)((char *)a2 + v7);
      uint64_t v10 = v9[1];
      *uint64_t v8 = *v9;
      v8[1] = v10;
    }
    else
    {
      uint64_t v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      uint64_t v13 = a2[2];
      uint64_t v14 = a2[3];
      a1[2] = v13;
      a1[3] = v14;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for IdentifiedEntityValue(uint64_t a1)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_253E82240();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
    sub_253E390C4(&qword_269D98488);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for IdentifiedEntityValue(void *a1, void *a2)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_253E82240();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    uint64_t v5 = *(int *)(sub_253E390C4(&qword_269D98488) + 48);
    uint64_t v6 = (void *)((char *)a1 + v5);
    uint64_t v7 = (void *)((char *)a2 + v5);
    uint64_t v8 = v7[1];
    *uint64_t v6 = *v7;
    v6[1] = v8;
  }
  else
  {
    uint64_t v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    uint64_t v10 = a2[2];
    uint64_t v11 = a2[3];
    a1[2] = v10;
    a1[3] = v11;
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for IdentifiedEntityValue(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_253E75DB8();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_253E82240();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      uint64_t v5 = *(int *)(sub_253E390C4(&qword_269D98488) + 48);
      uint64_t v6 = (void *)((char *)a1 + v5);
      uint64_t v7 = (void *)((char *)a2 + v5);
      *uint64_t v6 = *v7;
      v6[1] = v7[1];
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for IdentifiedEntityValue(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_253E82240();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = sub_253E390C4(&qword_269D98488);
    *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for IdentifiedEntityValue(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_253E75DB8();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_253E82240();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = sub_253E390C4(&qword_269D98488);
      *(_OWORD *)&a1[*(int *)(v7 + 48)] = *(_OWORD *)&a2[*(int *)(v7 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_253E7C3EC()
{
  v2[4] = " ";
  uint64_t result = sub_253E82240();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SpanMatchedEntity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_253E82240();
    if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v7))
    {
      uint64_t v8 = sub_253E390C4(&qword_26B257828);
      memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v7);
    }
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for SpanMatchedEntity(uint64_t a1)
{
  uint64_t v2 = sub_253E82240();
  if (!_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }

  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for SpanMatchedEntity(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_253E82240();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = sub_253E390C4(&qword_26B257828);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for SpanMatchedEntity(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_253E82240();
  int v7 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a1, 1, v6);
  int v8 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v10 = sub_253E390C4(&qword_26B257828);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for SpanMatchedEntity(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_253E82240();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v6))
  {
    uint64_t v7 = sub_253E390C4(&qword_26B257828);
    memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v6);
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *assignWithTake for SpanMatchedEntity(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_253E82240();
  int v7 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a1, 1, v6);
  int v8 = _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)a2, 1, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v10 = sub_253E390C4(&qword_26B257828);
    memcpy(a1, a2, *(void *)(*(void *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)a1, 0, 1, v6);
LABEL_7:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SpanMatchedEntity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_253E7CAF4);
}

uint64_t sub_253E7CAF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_253E390C4(&qword_26B257828);
  sub_253E7F944();
  if (*(_DWORD *)(v7 + 84) != a2) {
    return sub_253E7FC8C(*(void *)(a1 + *(int *)(a3 + 20)));
  }

  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for SpanMatchedEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_253E7CB8C);
}

void sub_253E7CB8C(uint64_t a1, int a2, int a3, uint64_t a4)
{
  sub_253E390C4(&qword_26B257828);
  sub_253E7F944();
  if (*(_DWORD *)(v8 + 84) == a3)
  {
    sub_253E800F0();
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v9, v10, v11, v12);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
}

void sub_253E7CC14()
{
  sub_253E7CCC8(319, (unint64_t *)&qword_26B257BC8, MEMORY[0x263F80508]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_253E7CCC8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_253E824A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t destroy for EntityMatch()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EntityMatch(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_WORD *)(a1 + 120) = *(_WORD *)(a2 + 120);
  uint64_t v7 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v7;
  uint64_t v8 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EntityMatch(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  uint64_t v4 = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 88) = v4;
  uint64_t v5 = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 104) = v5;
  LODWORD(v5) = *(_DWORD *)(a2 + 116);
  *(unsigned char *)(a1 + 120) = *(unsigned char *)(a2 + 120);
  *(_DWORD *)(a1 + 116) = v5;
  *(unsigned char *)(a1 + 121) = *(unsigned char *)(a2 + 121);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for EntityMatch(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA0uLL);
}

uint64_t assignWithTake for EntityMatch(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_DWORD *)(a1 + 116) = *(_DWORD *)(a2 + 116);
  *(_WORD *)(a1 + 120) = *(_WORD *)(a2 + 120);
  uint64_t v8 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EntityMatch(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 160))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EntityMatch(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 160) = 1;
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
    *(unsigned char *)(result + 160) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for EntityMatch()
{
}

__n128 initializeWithCopy for MatchProperties(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for MatchProperties(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MatchProperties(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
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
  *(unsigned char *)(result + 33) = v3;
  return result;
}

void type metadata accessor for MatchProperties()
{
}

void type metadata accessor for AliasTypes()
{
}

void type metadata accessor for SpanMatchingError()
{
}

void type metadata accessor for EntityMatchFormatter()
{
}

ValueMetadata *type metadata accessor for MatchProperties.CodingKeys()
{
  return &type metadata for MatchProperties.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for EntityMatch.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *__n128 result = a2 + 10;
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
        JUMPOUT(0x253E7D26CLL);
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
          *__n128 result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EntityMatch.CodingKeys()
{
  return &type metadata for EntityMatch.CodingKeys;
}

ValueMetadata *type metadata accessor for SpanMatchedEntity.CodingKeys()
{
  return &type metadata for SpanMatchedEntity.CodingKeys;
}

ValueMetadata *type metadata accessor for IdentifiedEntityValue.CodingKeys()
{
  return &type metadata for IdentifiedEntityValue.CodingKeys;
}

ValueMetadata *type metadata accessor for IdentifiedEntityValue.StringCodingKeys()
{
  return &type metadata for IdentifiedEntityValue.StringCodingKeys;
}

ValueMetadata *type metadata accessor for IdentifiedEntityValue.TypedValueCodingKeys()
{
  return &type metadata for IdentifiedEntityValue.TypedValueCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationLookback.CodingKeys()
{
  return &type metadata for QueryDecorationLookback.CodingKeys;
}

ValueMetadata *type metadata accessor for ToolRetrievalType.CodingKeys()
{
  return &type metadata for ToolRetrievalType.CodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationToolRetrievalResponse.CodingKeys()
{
  return &type metadata for QueryDecorationToolRetrievalResponse.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for QueryDecorationOutput.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *__n128 result = a2 + 11;
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
        JUMPOUT(0x253E7D3ECLL);
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
          *__n128 result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QueryDecorationOutput.CodingKeys()
{
  return &type metadata for QueryDecorationOutput.CodingKeys;
}

unsigned char *_s22IntelligenceFlowShared15MatchPropertiesV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        __n128 result = (unsigned char *)sub_253E5C6BC((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)sub_253E5C698((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x253E7D4E0);
      case 4:
        __n128 result = (unsigned char *)sub_253E5C6AC((uint64_t)result, v6);
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
          __n128 result = sub_253E5C6B4(result, a2 + 2);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicEnumerationEntity.CodingKeys()
{
  return &type metadata for DynamicEnumerationEntity.CodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationInput.CodingKeys()
{
  return &type metadata for QueryDecorationInput.CodingKeys;
}

unsigned char *_s22IntelligenceFlowShared26QueryDecorationCoreServiceOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 5;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)sub_253E5C6BC((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)sub_253E5C698((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x253E7D5E4);
      case 4:
        __n128 result = (unsigned char *)sub_253E5C6AC((uint64_t)result, v6);
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
          __n128 result = sub_253E5C6B4(result, a2 + 5);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.CodingKeys()
{
  return &type metadata for QueryDecorationCoreService.CodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.SpanMatchingCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.SpanMatchingCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.ContextRetrievalCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.ContextRetrievalCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.ToolRetrievalCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.ToolRetrievalCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.ToolContextRetrievalCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.ToolContextRetrievalCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.JointResolverCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.JointResolverCodingKeys;
}

ValueMetadata *type metadata accessor for QueryDecorationCoreService.ScreenContentRetrievalCodingKeys()
{
  return &type metadata for QueryDecorationCoreService.ScreenContentRetrievalCodingKeys;
}

unsigned char *_s22IntelligenceFlowShared17SpanMatchingErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        __n128 result = (unsigned char *)sub_253E5C6BC((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)sub_253E5C698((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x253E7D738);
      case 4:
        __n128 result = (unsigned char *)sub_253E5C6AC((uint64_t)result, v6);
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
          __n128 result = sub_253E5C6B4(result, a2 + 1);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SampleInvocation.CodingKeys()
{
  return &type metadata for SampleInvocation.CodingKeys;
}

ValueMetadata *type metadata accessor for UIControlTool.CodingKeys()
{
  return &type metadata for UIControlTool.CodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.CodingKeys()
{
  return &type metadata for RetrievedTool.CodingKeys;
}

uint64_t _s22IntelligenceFlowShared36QueryDecorationToolRetrievalResponseV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_253E5C51C(-1);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 5);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 5);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_253E5C51C((*a1 | (v4 << 8)) - 5);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return sub_253E5C51C(v8);
}

unsigned char *_s22IntelligenceFlowShared36QueryDecorationToolRetrievalResponseV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)sub_253E5C6BC((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)sub_253E5C698((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x253E7D8D0);
      case 4:
        __n128 result = (unsigned char *)sub_253E5C6AC((uint64_t)result, v6);
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
          __n128 result = sub_253E5C6B4(result, a2 + 4);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.CodingKeys()
{
  return &type metadata for RetrievedTool.Definition.CodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.ImplementationCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.ImplementationCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.AssistantSchemaCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.AssistantSchemaCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.EntitySetterCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.EntitySetterCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.ClientActionCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.ClientActionCodingKeys;
}

unsigned char *_s22IntelligenceFlowShared23QueryDecorationLookbackV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x253E7D9E4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RetrievedTool.Definition.UiControlCodingKeys()
{
  return &type metadata for RetrievedTool.Definition.UiControlCodingKeys;
}

uint64_t _s22IntelligenceFlowShared13RetrievedToolV5StageOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return sub_253E5C51C(-1);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 4);
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
      return sub_253E5C51C((*a1 | (v4 << 8)) - 4);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return sub_253E5C51C((*a1 | (v4 << 8)) - 4);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return sub_253E5C51C(v8);
}

unsigned char *_s22IntelligenceFlowShared13RetrievedToolV5StageOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        __n128 result = (unsigned char *)sub_253E5C6BC((uint64_t)result, v6);
        break;
      case 2:
        __n128 result = (unsigned char *)sub_253E5C698((uint64_t)result, v6);
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x253E7DB5CLL);
      case 4:
        __n128 result = (unsigned char *)sub_253E5C6AC((uint64_t)result, v6);
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
          __n128 result = sub_253E5C6B4(result, a2 + 3);
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.CodingKeys()
{
  return &type metadata for RetrievedTool.Stage.CodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.OneCodingKeys()
{
  return &type metadata for RetrievedTool.Stage.OneCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.TwoCodingKeys()
{
  return &type metadata for RetrievedTool.Stage.TwoCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.ThreeCodingKeys()
{
  return &type metadata for RetrievedTool.Stage.ThreeCodingKeys;
}

ValueMetadata *type metadata accessor for RetrievedTool.Stage.FourCodingKeys()
{
  return &type metadata for RetrievedTool.Stage.FourCodingKeys;
}

unint64_t sub_253E7DBD8()
{
  unint64_t result = qword_269D98698;
  if (!qword_269D98698)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98698);
  }
  return result;
}

unint64_t sub_253E7DC28()
{
  unint64_t result = qword_269D986A0;
  if (!qword_269D986A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986A0);
  }
  return result;
}

unint64_t sub_253E7DC78()
{
  unint64_t result = qword_269D986A8;
  if (!qword_269D986A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986A8);
  }
  return result;
}

unint64_t sub_253E7DCC8()
{
  unint64_t result = qword_269D986B0;
  if (!qword_269D986B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986B0);
  }
  return result;
}

unint64_t sub_253E7DD18()
{
  unint64_t result = qword_269D986B8;
  if (!qword_269D986B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986B8);
  }
  return result;
}

unint64_t sub_253E7DD68()
{
  unint64_t result = qword_269D986C0;
  if (!qword_269D986C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986C0);
  }
  return result;
}

unint64_t sub_253E7DDB8()
{
  unint64_t result = qword_269D986C8;
  if (!qword_269D986C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986C8);
  }
  return result;
}

unint64_t sub_253E7DE08()
{
  unint64_t result = qword_269D986D0;
  if (!qword_269D986D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986D0);
  }
  return result;
}

unint64_t sub_253E7DE58()
{
  unint64_t result = qword_269D986D8;
  if (!qword_269D986D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986D8);
  }
  return result;
}

unint64_t sub_253E7DEA8()
{
  unint64_t result = qword_269D986E0;
  if (!qword_269D986E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986E0);
  }
  return result;
}

unint64_t sub_253E7DEF8()
{
  unint64_t result = qword_269D986E8;
  if (!qword_269D986E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986E8);
  }
  return result;
}

unint64_t sub_253E7DF48()
{
  unint64_t result = qword_269D986F0;
  if (!qword_269D986F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986F0);
  }
  return result;
}

unint64_t sub_253E7DF98()
{
  unint64_t result = qword_269D986F8;
  if (!qword_269D986F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D986F8);
  }
  return result;
}

unint64_t sub_253E7DFE8()
{
  unint64_t result = qword_269D98700;
  if (!qword_269D98700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98700);
  }
  return result;
}

unint64_t sub_253E7E038()
{
  unint64_t result = qword_269D98708;
  if (!qword_269D98708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98708);
  }
  return result;
}

unint64_t sub_253E7E088()
{
  unint64_t result = qword_269D98710;
  if (!qword_269D98710)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98710);
  }
  return result;
}

unint64_t sub_253E7E0D8()
{
  unint64_t result = qword_269D98718;
  if (!qword_269D98718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98718);
  }
  return result;
}

unint64_t sub_253E7E128()
{
  unint64_t result = qword_269D98720;
  if (!qword_269D98720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98720);
  }
  return result;
}

unint64_t sub_253E7E178()
{
  unint64_t result = qword_269D98728;
  if (!qword_269D98728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98728);
  }
  return result;
}

unint64_t sub_253E7E1C8()
{
  unint64_t result = qword_269D98730;
  if (!qword_269D98730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98730);
  }
  return result;
}

unint64_t sub_253E7E218()
{
  unint64_t result = qword_269D98738;
  if (!qword_269D98738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98738);
  }
  return result;
}

unint64_t sub_253E7E268()
{
  unint64_t result = qword_269D98740;
  if (!qword_269D98740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98740);
  }
  return result;
}

unint64_t sub_253E7E2B8()
{
  unint64_t result = qword_269D98748;
  if (!qword_269D98748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98748);
  }
  return result;
}

unint64_t sub_253E7E308()
{
  unint64_t result = qword_269D98750;
  if (!qword_269D98750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98750);
  }
  return result;
}

unint64_t sub_253E7E358()
{
  unint64_t result = qword_269D98758;
  if (!qword_269D98758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98758);
  }
  return result;
}

unint64_t sub_253E7E3A8()
{
  unint64_t result = qword_269D98760;
  if (!qword_269D98760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98760);
  }
  return result;
}

unint64_t sub_253E7E3F8()
{
  unint64_t result = qword_269D98768;
  if (!qword_269D98768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98768);
  }
  return result;
}

unint64_t sub_253E7E448()
{
  unint64_t result = qword_269D98770;
  if (!qword_269D98770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98770);
  }
  return result;
}

unint64_t sub_253E7E498()
{
  unint64_t result = qword_269D98778;
  if (!qword_269D98778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98778);
  }
  return result;
}

unint64_t sub_253E7E4E8()
{
  unint64_t result = qword_269D98780;
  if (!qword_269D98780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98780);
  }
  return result;
}

unint64_t sub_253E7E538()
{
  unint64_t result = qword_269D98788;
  if (!qword_269D98788)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98788);
  }
  return result;
}

unint64_t sub_253E7E588()
{
  unint64_t result = qword_269D98790;
  if (!qword_269D98790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98790);
  }
  return result;
}

unint64_t sub_253E7E5D8()
{
  unint64_t result = qword_269D98798;
  if (!qword_269D98798)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98798);
  }
  return result;
}

unint64_t sub_253E7E628()
{
  unint64_t result = qword_269D987A0;
  if (!qword_269D987A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987A0);
  }
  return result;
}

unint64_t sub_253E7E678()
{
  unint64_t result = qword_269D987A8;
  if (!qword_269D987A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987A8);
  }
  return result;
}

unint64_t sub_253E7E6C8()
{
  unint64_t result = qword_269D987B0;
  if (!qword_269D987B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987B0);
  }
  return result;
}

unint64_t sub_253E7E718()
{
  unint64_t result = qword_269D987B8;
  if (!qword_269D987B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987B8);
  }
  return result;
}

unint64_t sub_253E7E768()
{
  unint64_t result = qword_269D987C0;
  if (!qword_269D987C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987C0);
  }
  return result;
}

unint64_t sub_253E7E7B8()
{
  unint64_t result = qword_269D987C8;
  if (!qword_269D987C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987C8);
  }
  return result;
}

unint64_t sub_253E7E808()
{
  unint64_t result = qword_269D987D0;
  if (!qword_269D987D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987D0);
  }
  return result;
}

unint64_t sub_253E7E858()
{
  unint64_t result = qword_269D987D8;
  if (!qword_269D987D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987D8);
  }
  return result;
}

unint64_t sub_253E7E8A8()
{
  unint64_t result = qword_269D987E0;
  if (!qword_269D987E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987E0);
  }
  return result;
}

unint64_t sub_253E7E8F8()
{
  unint64_t result = qword_269D987E8;
  if (!qword_269D987E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987E8);
  }
  return result;
}

unint64_t sub_253E7E948()
{
  unint64_t result = qword_269D987F0;
  if (!qword_269D987F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987F0);
  }
  return result;
}

unint64_t sub_253E7E998()
{
  unint64_t result = qword_269D987F8;
  if (!qword_269D987F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D987F8);
  }
  return result;
}

unint64_t sub_253E7E9E8()
{
  unint64_t result = qword_269D98800;
  if (!qword_269D98800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98800);
  }
  return result;
}

unint64_t sub_253E7EA38()
{
  unint64_t result = qword_269D98808;
  if (!qword_269D98808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98808);
  }
  return result;
}

unint64_t sub_253E7EA88()
{
  unint64_t result = qword_269D98810;
  if (!qword_269D98810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98810);
  }
  return result;
}

unint64_t sub_253E7EAD8()
{
  unint64_t result = qword_269D98818;
  if (!qword_269D98818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98818);
  }
  return result;
}

unint64_t sub_253E7EB28()
{
  unint64_t result = qword_269D98820;
  if (!qword_269D98820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98820);
  }
  return result;
}

unint64_t sub_253E7EB78()
{
  unint64_t result = qword_269D98828;
  if (!qword_269D98828)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98828);
  }
  return result;
}

unint64_t sub_253E7EBC8()
{
  unint64_t result = qword_269D98830;
  if (!qword_269D98830)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98830);
  }
  return result;
}

unint64_t sub_253E7EC18()
{
  unint64_t result = qword_269D98838;
  if (!qword_269D98838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98838);
  }
  return result;
}

unint64_t sub_253E7EC68()
{
  unint64_t result = qword_269D98840;
  if (!qword_269D98840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98840);
  }
  return result;
}

unint64_t sub_253E7ECB8()
{
  unint64_t result = qword_269D98848;
  if (!qword_269D98848)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98848);
  }
  return result;
}

unint64_t sub_253E7ED08()
{
  unint64_t result = qword_269D98850;
  if (!qword_269D98850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98850);
  }
  return result;
}

unint64_t sub_253E7ED58()
{
  unint64_t result = qword_269D98858;
  if (!qword_269D98858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98858);
  }
  return result;
}

unint64_t sub_253E7EDA8()
{
  unint64_t result = qword_269D98860;
  if (!qword_269D98860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98860);
  }
  return result;
}

unint64_t sub_253E7EDF8()
{
  unint64_t result = qword_269D98868;
  if (!qword_269D98868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98868);
  }
  return result;
}

unint64_t sub_253E7EE48()
{
  unint64_t result = qword_269D98870;
  if (!qword_269D98870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98870);
  }
  return result;
}

unint64_t sub_253E7EE98()
{
  unint64_t result = qword_269D98878;
  if (!qword_269D98878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98878);
  }
  return result;
}

unint64_t sub_253E7EEE8()
{
  unint64_t result = qword_269D98880;
  if (!qword_269D98880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98880);
  }
  return result;
}

unint64_t sub_253E7EF38()
{
  unint64_t result = qword_269D98888;
  if (!qword_269D98888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98888);
  }
  return result;
}

unint64_t sub_253E7EF88()
{
  unint64_t result = qword_269D98890;
  if (!qword_269D98890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98890);
  }
  return result;
}

unint64_t sub_253E7EFD8()
{
  unint64_t result = qword_269D98898;
  if (!qword_269D98898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98898);
  }
  return result;
}

unint64_t sub_253E7F028()
{
  unint64_t result = qword_269D988A0;
  if (!qword_269D988A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988A0);
  }
  return result;
}

unint64_t sub_253E7F078()
{
  unint64_t result = qword_269D988A8;
  if (!qword_269D988A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988A8);
  }
  return result;
}

unint64_t sub_253E7F0C8()
{
  unint64_t result = qword_269D988B0;
  if (!qword_269D988B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988B0);
  }
  return result;
}

unint64_t sub_253E7F118()
{
  unint64_t result = qword_269D988B8;
  if (!qword_269D988B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988B8);
  }
  return result;
}

unint64_t sub_253E7F168()
{
  unint64_t result = qword_269D988C0;
  if (!qword_269D988C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988C0);
  }
  return result;
}

unint64_t sub_253E7F1B8()
{
  unint64_t result = qword_269D988C8;
  if (!qword_269D988C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988C8);
  }
  return result;
}

unint64_t sub_253E7F208()
{
  unint64_t result = qword_269D988D0;
  if (!qword_269D988D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988D0);
  }
  return result;
}

unint64_t sub_253E7F258()
{
  unint64_t result = qword_269D988D8;
  if (!qword_269D988D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988D8);
  }
  return result;
}

unint64_t sub_253E7F2A8()
{
  unint64_t result = qword_269D988E0;
  if (!qword_269D988E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988E0);
  }
  return result;
}

unint64_t sub_253E7F2F8()
{
  unint64_t result = qword_269D988E8;
  if (!qword_269D988E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988E8);
  }
  return result;
}

unint64_t sub_253E7F348()
{
  unint64_t result = qword_269D988F0;
  if (!qword_269D988F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988F0);
  }
  return result;
}

unint64_t sub_253E7F398()
{
  unint64_t result = qword_269D988F8;
  if (!qword_269D988F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D988F8);
  }
  return result;
}

unint64_t sub_253E7F3E8()
{
  unint64_t result = qword_269D98900;
  if (!qword_269D98900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98900);
  }
  return result;
}

unint64_t sub_253E7F438()
{
  unint64_t result = qword_269D98908;
  if (!qword_269D98908)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98908);
  }
  return result;
}

unint64_t sub_253E7F488()
{
  unint64_t result = qword_269D98910;
  if (!qword_269D98910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98910);
  }
  return result;
}

unint64_t sub_253E7F4D8()
{
  unint64_t result = qword_269D98918;
  if (!qword_269D98918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98918);
  }
  return result;
}

unint64_t sub_253E7F528()
{
  unint64_t result = qword_269D98920;
  if (!qword_269D98920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98920);
  }
  return result;
}

unint64_t sub_253E7F578()
{
  unint64_t result = qword_269D98928;
  if (!qword_269D98928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98928);
  }
  return result;
}

unint64_t sub_253E7F5C8()
{
  unint64_t result = qword_269D98930;
  if (!qword_269D98930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98930);
  }
  return result;
}

unint64_t sub_253E7F618()
{
  unint64_t result = qword_269D98938;
  if (!qword_269D98938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98938);
  }
  return result;
}

unint64_t sub_253E7F668()
{
  unint64_t result = qword_269D98940;
  if (!qword_269D98940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98940);
  }
  return result;
}

unint64_t sub_253E7F6B8()
{
  unint64_t result = qword_269D98948;
  if (!qword_269D98948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98948);
  }
  return result;
}

unint64_t sub_253E7F708()
{
  unint64_t result = qword_269D98950;
  if (!qword_269D98950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98950);
  }
  return result;
}

unint64_t sub_253E7F758()
{
  unint64_t result = qword_269D98958;
  if (!qword_269D98958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98958);
  }
  return result;
}

uint64_t sub_253E7F7A4(uint64_t a1)
{
  return sub_253E7331C(0, *(void *)(a1 + 16), 0, a1);
}

unint64_t sub_253E7F7B8()
{
  unint64_t result = qword_269D98978;
  if (!qword_269D98978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D98978);
  }
  return result;
}

uint64_t sub_253E7F804(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

unint64_t sub_253E7F81C()
{
  unint64_t result = qword_269D989B8;
  if (!qword_269D989B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269D989B8);
  }
  return result;
}

uint64_t sub_253E7F868(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_253E390C4(a3);
  sub_253E5C174();
  sub_253E7FE94();
  v4();
  return a2;
}

uint64_t sub_253E7F95C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_253E7F964@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_253E826F0();
}

void *sub_253E7F9A8()
{
  return sub_253E39108(v0, v1);
}

uint64_t sub_253E7F9C8@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 65) = a1;
  return sub_253E82620();
}

uint64_t sub_253E7FA10()
{
  return *(void *)(v0 - 96);
}

uint64_t sub_253E7FA28()
{
  return sub_253E825C0();
}

uint64_t sub_253E7FA58()
{
  return sub_253E826F0();
}

uint64_t sub_253E7FAAC()
{
  return v0;
}

uint64_t sub_253E7FAF4()
{
  return sub_253E82640();
}

uint64_t sub_253E7FB14()
{
  return sub_253E82710();
}

uint64_t sub_253E7FB2C()
{
  type metadata accessor for UIControlTool(0);
  return sub_253E821E0();
}

void sub_253E7FB9C(uint64_t a1@<X8>)
{
  *(void *)(v2 - 144) = *(void *)(v1 + a1);
}

void sub_253E7FBC4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_253E7FBE0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_253E7FBFC(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_253E7FC18()
{
  return 0;
}

uint64_t sub_253E7FC34()
{
  return 0;
}

uint64_t sub_253E7FC50()
{
  return 0;
}

uint64_t sub_253E7FC6C()
{
  return sub_253E826A0();
}

uint64_t sub_253E7FC8C@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF) {
    LODWORD(a1) = -1;
  }
  return (a1 + 1);
}

uint64_t sub_253E7FCA0()
{
  return sub_253E82380();
}

uint64_t sub_253E7FCB8()
{
  return sub_253E82680();
}

uint64_t sub_253E7FCD8()
{
  return sub_253E82750();
}

uint64_t sub_253E7FCF0()
{
  return v0;
}

void sub_253E7FD18(_DWORD *a1@<X8>)
{
  *a1 = v1;
}

uint64_t sub_253E7FD20()
{
  return v0;
}

uint64_t sub_253E7FD48@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 + 312) = a1;
  return v1 + 312;
}

uint64_t sub_253E7FD84()
{
  return v0;
}

uint64_t sub_253E7FDCC()
{
  return v0;
}

uint64_t sub_253E7FDE4()
{
  return sub_253E82510();
}

uint64_t sub_253E7FE00()
{
  return sub_253E82380();
}

uint64_t sub_253E7FE20()
{
  return v0;
}

uint64_t sub_253E7FE40()
{
  return sub_253E825C0();
}

uint64_t sub_253E7FE5C()
{
  return v0;
}

uint64_t sub_253E7FE70@<X0>(uint64_t a1@<X8>)
{
  return *(void *)a1;
}

void *sub_253E7FEA0()
{
  return sub_253E39108(v0, v1);
}

uint64_t sub_253E7FEC0()
{
  *(unsigned char *)(v0 - 66) = 1;
  return v0 - 66;
}

uint64_t sub_253E7FED0()
{
  return sub_253E826A0();
}

void sub_253E7FEF0()
{
  *(unsigned char *)(v0 - 67) = 2;
}

uint64_t sub_253E7FEFC()
{
  return sub_253E82750();
}

uint64_t sub_253E7FF28()
{
  return 0;
}

uint64_t sub_253E7FF48()
{
  return v0;
}

uint64_t sub_253E7FF58()
{
  return v0;
}

uint64_t sub_253E7FF78()
{
  return v0;
}

uint64_t sub_253E7FF84()
{
  return sub_253E82750();
}

void sub_253E7FF9C(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = v1;
  *(unsigned char *)(a1 + 4) = v2;
}

uint64_t sub_253E7FFA8()
{
  return sub_253E82380();
}

uint64_t sub_253E7FFC0()
{
  return v0;
}

uint64_t sub_253E7FFCC()
{
  return v0;
}

uint64_t sub_253E7FFD8()
{
  return sub_253E82680();
}

void sub_253E8001C(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_253E80038(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_253E80054()
{
  return 0;
}

uint64_t sub_253E80070()
{
  return 0;
}

__n128 sub_253E8008C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v4 = v3 + v1;
  long long v5 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v2;
  *(_OWORD *)(v4 + 16) = v5;
  __n128 result = *(__n128 *)(v2 + 32);
  *(__n128 *)(v4 + 32) = result;
  *(void *)(v4 + 48) = a1;
  return result;
}

uint64_t sub_253E800A8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_253E800D4()
{
  return sub_253E82750();
}

uint64_t sub_253E80108()
{
  return v0;
}

uint64_t sub_253E80120()
{
  return 0;
}

uint64_t sub_253E8012C()
{
  return sub_253E82680();
}

uint64_t sub_253E80150()
{
  return 0;
}

uint64_t sub_253E80160()
{
  return sub_253E82360();
}

uint64_t sub_253E8017C()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t sub_253E801A4()
{
  return v0;
}

uint64_t sub_253E801B0()
{
  return v0;
}

uint64_t sub_253E801BC()
{
  return v0;
}

uint64_t sub_253E801C8()
{
  return sub_253E82380();
}

uint64_t sub_253E801F4()
{
  return v0;
}

uint64_t sub_253E80204@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 + 312) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_253E80248()
{
  return 0;
}

void sub_253E8026C(char a1@<W8>)
{
  *(unsigned char *)(v1 - 128) = a1;
}

uint64_t sub_253E80278()
{
  return sub_253E82380();
}

uint64_t sub_253E80290()
{
  return v0;
}

uint64_t sub_253E802A4()
{
  return v0;
}

uint64_t sub_253E802B0()
{
  return v0;
}

uint64_t sub_253E802C4()
{
  return v0;
}

uint64_t sub_253E802F8@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t sub_253E8030C()
{
  return sub_253E82640();
}

uint64_t sub_253E8032C()
{
  return type metadata accessor for RetrievedTool(0);
}

uint64_t sub_253E80358()
{
  return sub_253E825C0();
}

uint64_t sub_253E80378()
{
  return sub_253E82780();
}

uint64_t sub_253E80398()
{
  return sub_253E82810();
}

void *sub_253E803B0(void *a1)
{
  return sub_253E39108(a1, v1);
}

uint64_t sub_253E803E0()
{
  return v0;
}

uint64_t sub_253E803F4()
{
  return v0;
}

uint64_t sub_253E80408()
{
  return v0;
}

uint64_t sub_253E80414()
{
  return v0;
}

void sub_253E80420()
{
  *(unsigned char *)(v0 - 65) = 3;
}

void sub_253E8042C()
{
  *(unsigned char *)(v0 - 65) = 2;
}

uint64_t sub_253E80444()
{
  return v0 - 80;
}

uint64_t sub_253E80464()
{
  return v0;
}

uint64_t sub_253E80478()
{
  return v0;
}

uint64_t sub_253E8048C()
{
  return 0;
}

uint64_t sub_253E804AC()
{
  return v0;
}

uint64_t sub_253E804C4()
{
  return sub_253E82540();
}

uint64_t sub_253E804E4()
{
  return v0;
}

uint64_t sub_253E80518(uint64_t a1)
{
  return _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0(a1, 1, v1);
}

void *sub_253E80544(void *a1)
{
  return sub_253E39108(a1, v1);
}

uint64_t sub_253E80560(uint64_t a1)
{
  return sub_253E80FD0(a1, (void (*)(uint64_t))sub_253E805CC, &qword_269D989D0, &qword_269D989D8);
}

uint64_t static Paths.Unprotected.baseDirectory.getter()
{
  return sub_253E810F0(&qword_269D97400, &qword_269D989D0);
}

uint64_t sub_253E805AC(uint64_t a1)
{
  return sub_253E81164(a1, qword_269D989E0, (uint64_t (*)(void))sub_253E805CC);
}

uint64_t sub_253E805CC@<X0>(char *a1@<X8>)
{
  uint64_t v70 = a1;
  v73[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_253E390C4(&qword_269D98A20);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  uint64_t v67 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v65 = (char *)&v63 - v4;
  uint64_t v5 = sub_253E82160();
  uint64_t v68 = *(void *)(v5 - 8);
  uint64_t v69 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v66 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  unint64_t v64 = (char *)&v63 - v8;
  uint64_t v9 = sub_253E820A0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_253E390C4(&qword_269D98A28);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_253E82100();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v71 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v63 - v20;
  int64_t v22 = self;
  id v23 = objc_msgSend(v22, sel_defaultManager);
  id v24 = objc_msgSend(v23, sel_URLsForDirectory_inDomains_, 5, 1);

  uint64_t v25 = sub_253E82430();
  sub_253E6475C(v25, (uint64_t)v15);
  swift_bridgeObjectRelease();
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v15, 1, v16) == 1)
  {
    unint64_t v45 = v64;
    uint64_t v44 = (uint64_t)v65;
    sub_253E81F9C((uint64_t)v15);
    if (qword_26B257B98 != -1) {
      swift_once();
    }
    uint64_t v46 = sub_253E821C0();
    uint64_t v47 = sub_253E5DBD0(v46, (uint64_t)qword_26B257BA0);
    float v48 = sub_253E821A0();
    os_log_type_t v49 = sub_253E82480();
    if (os_log_type_enabled(v48, v49))
    {
      float v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)float v50 = 0;
      _os_log_impl(&dword_253E37000, v48, v49, "No library available on this user's device", v50, 2u);
      MEMORY[0x25A271760](v50, -1, -1);
    }

    (*(void (**)(char *, void, uint64_t))(v68 + 104))(v45, *MEMORY[0x263F61818], v69);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v47, v46);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v44, 0, 1, v46);
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v21, v15, v16);
  v73[0] = (id)0xD000000000000010;
  v73[1] = (id)0x8000000253E83410;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F06E30], v9);
  sub_253E7F81C();
  uint64_t v26 = v70;
  sub_253E820F0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_bridgeObjectRelease();
  id v27 = objc_msgSend(v22, sel_defaultManager);
  uint64_t v28 = (void *)sub_253E820C0();
  v73[0] = 0;
  unsigned int v29 = objc_msgSend(v27, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v28, 1, 0, v73);

  if (!v29)
  {
    id v51 = v73[0];
    uint64_t v52 = (void *)sub_253E82090();

    swift_willThrow();
    if (qword_26B257B98 != -1) {
      swift_once();
    }
    uint64_t v53 = sub_253E821C0();
    uint64_t v54 = sub_253E5DBD0(v53, (uint64_t)qword_26B257BA0);
    id v55 = v52;
    uint64_t v56 = sub_253E821A0();
    os_log_type_t v57 = sub_253E82480();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      int64_t v59 = (void *)swift_slowAlloc();
      v73[0] = v59;
      *(_DWORD *)uint64_t v58 = 136315138;
      swift_getErrorValue();
      uint64_t v60 = sub_253E827B0();
      uint64_t v72 = sub_253E5F7BC(v60, v61, (uint64_t *)v73);
      sub_253E824B0();
      swift_bridgeObjectRelease();
      MEMORY[0x25A271610](v52);
      MEMORY[0x25A271610](v52);
      _os_log_impl(&dword_253E37000, v56, v57, "Unable to create IntelligenceFlow directory: %s.", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A271760](v59, -1, -1);
      MEMORY[0x25A271760](v58, -1, -1);
    }
    else
    {
      MEMORY[0x25A271610](v52);
      MEMORY[0x25A271610](v52);
    }

    (*(void (**)(char *, void, uint64_t))(v68 + 104))(v66, *MEMORY[0x263F61810], v69);
    uint64_t v62 = (uint64_t)v67;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v53 - 8) + 16))(v67, v54, v53);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v62, 0, 1, v53);
LABEL_19:
    uint64_t result = sub_253E82170();
    __break(1u);
    return result;
  }
  float v30 = v21;
  uint64_t v31 = qword_26B257B98;
  id v32 = v73[0];
  if (v31 != -1) {
    swift_once();
  }
  uint64_t v33 = sub_253E821C0();
  sub_253E5DBD0(v33, (uint64_t)qword_26B257BA0);
  float v34 = v71;
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v71, v26, v16);
  unint64_t v35 = sub_253E821A0();
  os_log_type_t v36 = sub_253E82490();
  if (os_log_type_enabled(v35, v36))
  {
    unint64_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = (void *)swift_slowAlloc();
    v73[0] = v38;
    uint64_t v70 = v30;
    *(_DWORD *)unint64_t v37 = 136315138;
    uint64_t v39 = sub_253E820E0();
    uint64_t v72 = sub_253E5F7BC(v39, v40, (uint64_t *)v73);
    sub_253E824B0();
    swift_bridgeObjectRelease();
    unint64_t v41 = *(void (**)(char *, uint64_t))(v17 + 8);
    v41(v34, v16);
    _os_log_impl(&dword_253E37000, v35, v36, "Obtained library directory URL: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A271760](v38, -1, -1);
    MEMORY[0x25A271760](v37, -1, -1);

    return ((uint64_t (*)(char *, uint64_t))v41)(v70, v16);
  }
  else
  {

    uint64_t v43 = *(void (**)(char *, uint64_t))(v17 + 8);
    v43(v34, v16);
    return ((uint64_t (*)(char *, uint64_t))v43)(v30, v16);
  }
}

uint64_t static Paths.Unprotected.baseDirectoryURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E81EE4(&qword_269D97408, (uint64_t)qword_269D989E0, a1);
}

unint64_t static Paths.protectedContainerGroupIdentifier.getter()
{
  return 0xD000000000000020;
}

uint64_t sub_253E80FAC(uint64_t a1)
{
  return sub_253E80FD0(a1, (void (*)(uint64_t))sub_253E811BC, &qword_269D989F8, &qword_269D98A00);
}

uint64_t sub_253E80FD0(uint64_t a1, void (*a2)(uint64_t), uint64_t *a3, void *a4)
{
  uint64_t v7 = sub_253E82100();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(v9);
  uint64_t v12 = sub_253E820B0();
  uint64_t v14 = v13;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  *a3 = v12;
  *a4 = v14;
  return result;
}

uint64_t static Paths.protectedBaseDirectory.getter()
{
  return sub_253E810F0(&qword_269D97410, &qword_269D989F8);
}

uint64_t sub_253E810F0(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_253E81144(uint64_t a1)
{
  return sub_253E81164(a1, qword_269D98A08, (uint64_t (*)(void))sub_253E811BC);
}

uint64_t sub_253E81164(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v5 = sub_253E82100();
  sub_253E60004(v5, a2);
  sub_253E5DBD0(v5, (uint64_t)a2);
  return a3();
}

uint64_t sub_253E811BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v96 = a1;
  v100[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_253E390C4(&qword_269D98A20);
  uint64_t v2 = MEMORY[0x270FA5388](v1 - 8);
  BOOL v92 = (char *)&v87 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v90 = (char *)&v87 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v88 = (char *)&v87 - v6;
  uint64_t v7 = sub_253E82160();
  uint64_t v93 = *(void *)(v7 - 8);
  uint64_t v94 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  uint64_t v91 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v89 = (char *)&v87 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v87 = (char *)&v87 - v12;
  uint64_t v95 = sub_253E820A0();
  uint64_t v13 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v15 = (char *)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_253E390C4(&qword_269D98A28);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_253E82100();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v97 = (char *)&v87 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v87 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v98 = (char *)&v87 - v26;
  id v27 = self;
  id v28 = objc_msgSend(v27, sel_defaultManager);
  unsigned int v29 = (void *)sub_253E82300();
  id v30 = objc_msgSend(v28, sel_containerURLForSecurityApplicationGroupIdentifier_, v29);

  if (!v30)
  {
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v18, 1, 1, v19);
    goto LABEL_11;
  }
  sub_253E820D0();

  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
  v31(v18, v25, v19);
  _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0((uint64_t)v18, 0, 1, v19);
  if (_s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwet_0((uint64_t)v18, 1, v19) == 1)
  {
LABEL_11:
    sub_253E81F9C((uint64_t)v18);
    if (qword_26B257B98 != -1) {
      swift_once();
    }
    uint64_t v59 = sub_253E821C0();
    uint64_t v60 = sub_253E5DBD0(v59, (uint64_t)qword_26B257BA0);
    unint64_t v61 = sub_253E821A0();
    os_log_type_t v62 = sub_253E82480();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v63 = 0;
      _os_log_impl(&dword_253E37000, v61, v62, "Could not obtain protected group container directory URL.", v63, 2u);
      MEMORY[0x25A271760](v63, -1, -1);
    }

    (*(void (**)(char *, void, uint64_t))(v93 + 104))(v87, *MEMORY[0x263F61820], v94);
    uint64_t v64 = (uint64_t)v88;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v59 - 8) + 16))(v88, v60, v59);
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v64, 0, 1, v59);
    goto LABEL_29;
  }
  id v32 = v98;
  v31(v98, v18, v19);
  v100[0] = (id)0xD000000000000010;
  v100[1] = (id)0x8000000253E83410;
  uint64_t v33 = v95;
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F06E30], v95);
  sub_253E7F81C();
  sub_253E820F0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v33);
  swift_bridgeObjectRelease();
  id v34 = objc_msgSend(v27, sel_defaultManager);
  unint64_t v35 = (void *)sub_253E820C0();
  v100[0] = 0;
  unsigned int v36 = objc_msgSend(v34, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v35, 1, 0, v100);

  if (!v36)
  {
    id v65 = v100[0];
    uint64_t v66 = (void *)sub_253E82090();

    swift_willThrow();
    if (qword_26B257B98 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_253E821C0();
    uint64_t v68 = sub_253E5DBD0(v67, (uint64_t)qword_26B257BA0);
    id v69 = v66;
    uint64_t v70 = sub_253E821A0();
    os_log_type_t v71 = sub_253E82480();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      float v73 = (void *)swift_slowAlloc();
      v100[0] = v73;
      *(_DWORD *)uint64_t v72 = 136315138;
      swift_getErrorValue();
      uint64_t v74 = sub_253E827B0();
      uint64_t v99 = sub_253E5F7BC(v74, v75, (uint64_t *)v100);
      sub_253E824B0();
      swift_bridgeObjectRelease();
      MEMORY[0x25A271610](v66);
      MEMORY[0x25A271610](v66);
      _os_log_impl(&dword_253E37000, v70, v71, "Unable to create protected group container directory: %s.", v72, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A271760](v73, -1, -1);
      MEMORY[0x25A271760](v72, -1, -1);
    }
    else
    {
      MEMORY[0x25A271610](v66);
      MEMORY[0x25A271610](v66);
    }

    (*(void (**)(char *, void, uint64_t))(v93 + 104))(v89, *MEMORY[0x263F61810], v94);
    uint64_t v86 = (uint64_t)v90;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v67 - 8) + 16))(v90, v68, v67);
    goto LABEL_28;
  }
  uint64_t v37 = v19;
  id v38 = v100[0];
  id v39 = objc_msgSend(v27, sel_defaultManager);
  unint64_t v40 = (void *)sub_253E820C0();
  sub_253E390C4((uint64_t *)&unk_269D98A30);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_253E88E00;
  unint64_t v42 = (void *)*MEMORY[0x263EFF750];
  *(void *)(v41 + 32) = *MEMORY[0x263EFF750];
  v100[0] = 0;
  id v43 = v42;
  id v44 = sub_253E81FFC((uint64_t)v40, v41, 0, (uint64_t)v100, v39);

  id v45 = v100[0];
  if (!v44)
  {
    unint64_t v76 = v45;
    unint64_t v77 = (void *)sub_253E82090();

    swift_willThrow();
    if (qword_26B257B98 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_253E821C0();
    uint64_t v78 = sub_253E5DBD0(v67, (uint64_t)qword_26B257BA0);
    id v79 = v77;
    uint64_t v80 = sub_253E821A0();
    os_log_type_t v81 = sub_253E82480();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = (uint8_t *)swift_slowAlloc();
      uint64_t v83 = (void *)swift_slowAlloc();
      v100[0] = v83;
      *(_DWORD *)uint64_t v82 = 136315138;
      swift_getErrorValue();
      uint64_t v84 = sub_253E827B0();
      uint64_t v99 = sub_253E5F7BC(v84, v85, (uint64_t *)v100);
      sub_253E824B0();
      swift_bridgeObjectRelease();
      MEMORY[0x25A271610](v77);
      MEMORY[0x25A271610](v77);
      _os_log_impl(&dword_253E37000, v80, v81, "Unable to read protected group container directory: %s.", v82, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A271760](v83, -1, -1);
      MEMORY[0x25A271760](v82, -1, -1);
    }
    else
    {
      MEMORY[0x25A271610](v77);
      MEMORY[0x25A271610](v77);
    }

    (*(void (**)(char *, void, uint64_t))(v93 + 104))(v91, *MEMORY[0x263F61808], v94);
    uint64_t v86 = (uint64_t)v92;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v67 - 8) + 16))(v92, v78, v67);
LABEL_28:
    _s22IntelligenceFlowShared13RetrievedToolV10DefinitionOwst_0(v86, 0, 1, v67);
LABEL_29:
    uint64_t result = sub_253E82170();
    __break(1u);
    return result;
  }

  uint64_t v46 = v97;
  if (qword_26B257B98 != -1) {
    swift_once();
  }
  uint64_t v47 = sub_253E821C0();
  sub_253E5DBD0(v47, (uint64_t)qword_26B257BA0);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v46, v32, v37);
  float v48 = sub_253E821A0();
  os_log_type_t v49 = sub_253E82490();
  if (os_log_type_enabled(v48, v49))
  {
    float v50 = (uint8_t *)swift_slowAlloc();
    id v51 = (void *)swift_slowAlloc();
    v100[0] = v51;
    uint64_t v96 = v37;
    *(_DWORD *)float v50 = 136315138;
    uint64_t v52 = sub_253E820E0();
    uint64_t v99 = sub_253E5F7BC(v52, v53, (uint64_t *)v100);
    sub_253E824B0();
    swift_bridgeObjectRelease();
    uint64_t v54 = *(void (**)(char *, uint64_t))(v20 + 8);
    id v55 = v46;
    uint64_t v56 = v96;
    v54(v55, v96);
    _os_log_impl(&dword_253E37000, v48, v49, "Obtained protected group container directory URL: %s", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A271760](v51, -1, -1);
    MEMORY[0x25A271760](v50, -1, -1);

    return ((uint64_t (*)(char *, uint64_t))v54)(v32, v56);
  }
  else
  {

    uint64_t v58 = *(void (**)(char *, uint64_t))(v20 + 8);
    v58(v46, v37);
    return ((uint64_t (*)(char *, uint64_t))v58)(v32, v37);
  }
}

uint64_t static Paths.protectedBaseDirectoryURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_253E81EE4(&qword_269D97418, (uint64_t)qword_269D98A08, a1);
}

uint64_t sub_253E81EE4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_253E82100();
  uint64_t v6 = sub_253E5DBD0(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Paths()
{
  return &type metadata for Paths;
}

ValueMetadata *type metadata accessor for Paths.Unprotected()
{
  return &type metadata for Paths.Unprotected;
}

uint64_t sub_253E81F9C(uint64_t a1)
{
  uint64_t v2 = sub_253E390C4(&qword_269D98A28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_253E81FFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  type metadata accessor for URLResourceKey();
  uint64_t v9 = (void *)sub_253E82420();
  swift_bridgeObjectRelease();
  id v10 = objc_msgSend(a5, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, a1, v9, a3, a4);

  return v10;
}

uint64_t sub_253E82090()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_253E820A0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_253E820B0()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_253E820C0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_253E820D0()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_253E820E0()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_253E820F0()
{
  return MEMORY[0x270EEFF40]();
}

uint64_t sub_253E82100()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_253E82110()
{
  return MEMORY[0x270EF0158]();
}

uint64_t sub_253E82120()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_253E82130()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_253E82140()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_253E82150()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_253E82160()
{
  return MEMORY[0x270F57620]();
}

uint64_t sub_253E82170()
{
  return MEMORY[0x270F57820]();
}

uint64_t sub_253E82180()
{
  return MEMORY[0x270FA2D30]();
}

uint64_t sub_253E82190()
{
  return MEMORY[0x270FA2D88]();
}

uint64_t sub_253E821A0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_253E821B0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_253E821C0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_253E821D0()
{
  return MEMORY[0x270F7F9C8]();
}

uint64_t sub_253E821E0()
{
  return MEMORY[0x270F7FA08]();
}

uint64_t sub_253E821F0()
{
  return MEMORY[0x270F7FD08]();
}

uint64_t sub_253E82200()
{
  return MEMORY[0x270F7FD28]();
}

uint64_t sub_253E82210()
{
  return MEMORY[0x270F7FD30]();
}

uint64_t sub_253E82220()
{
  return MEMORY[0x270F7FFA8]();
}

uint64_t sub_253E82230()
{
  return MEMORY[0x270F7FFE8]();
}

uint64_t sub_253E82240()
{
  return MEMORY[0x270F80000]();
}

uint64_t sub_253E82250()
{
  return MEMORY[0x270F80030]();
}

uint64_t sub_253E82260()
{
  return MEMORY[0x270F80048]();
}

uint64_t sub_253E82280()
{
  return MEMORY[0x270F800B0]();
}

uint64_t sub_253E82290()
{
  return MEMORY[0x270F800D8]();
}

uint64_t sub_253E822A0()
{
  return MEMORY[0x270F800F0]();
}

uint64_t sub_253E822B0()
{
  return MEMORY[0x270F805B8]();
}

uint64_t sub_253E822C0()
{
  return MEMORY[0x270F805E8]();
}

uint64_t sub_253E822D0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_253E822E0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_253E822F0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_253E82300()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_253E82310()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_253E82320()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_253E82330()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_253E82340()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_253E82350()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_253E82360()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_253E82370()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_253E82380()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_253E82390()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_253E823A0()
{
  return MEMORY[0x270F9D820]();
}

uint64_t sub_253E823B0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_253E823C0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_253E823D0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_253E823E0()
{
  return MEMORY[0x270F9DAD8]();
}

uint64_t sub_253E823F0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_253E82400()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_253E82410()
{
  return MEMORY[0x270F9DB58]();
}

uint64_t sub_253E82420()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_253E82430()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_253E82440()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_253E82450()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_253E82460()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_253E82470()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_253E82480()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_253E82490()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_253E824A0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_253E824B0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_253E824C0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_253E824D0()
{
  return MEMORY[0x270EF25A0]();
}

uint64_t sub_253E824F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_253E82500()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_253E82510()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_253E82520()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_253E82530()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_253E82540()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_253E82550()
{
  return MEMORY[0x270F9EF08]();
}

uint64_t sub_253E82570()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_253E82580()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_253E82590()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_253E825B0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_253E825C0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_253E825D0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_253E825E0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_253E825F0()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_253E82600()
{
  return MEMORY[0x270F9F280]();
}

uint64_t sub_253E82610()
{
  return MEMORY[0x270F9F290]();
}

uint64_t sub_253E82620()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_253E82640()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_253E82650()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_253E82660()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_253E82670()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_253E82680()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_253E82690()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_253E826A0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_253E826B0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_253E826C0()
{
  return MEMORY[0x270F9F3B8]();
}

uint64_t sub_253E826D0()
{
  return MEMORY[0x270F9F3C0]();
}

uint64_t sub_253E826E0()
{
  return MEMORY[0x270F9F3D0]();
}

uint64_t sub_253E826F0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_253E82700()
{
  return MEMORY[0x270F9F3F0]();
}

uint64_t sub_253E82710()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_253E82720()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_253E82730()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_253E82740()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_253E82750()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_253E82760()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_253E82770()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_253E82780()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_253E82790()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_253E827A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_253E827B0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_253E827C0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_253E827D0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_253E827E0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_253E827F0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_253E82800()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_253E82810()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_253E82820()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_253E82830()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_253E82840()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_253E82850()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_253E82860()
{
  return MEMORY[0x270F9FD98]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}