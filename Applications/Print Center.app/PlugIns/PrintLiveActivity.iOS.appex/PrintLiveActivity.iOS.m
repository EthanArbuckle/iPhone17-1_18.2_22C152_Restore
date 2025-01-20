uint64_t initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PrintActivityAttributes.ContentState()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PrintActivityAttributes.ContentState(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PrintActivityAttributes.ContentState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintActivityAttributes.ContentState(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState()
{
  return &type metadata for PrintActivityAttributes.ContentState;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes()
{
  return &type metadata for PrintActivityAttributes;
}

BOOL sub_100001D70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100001D84()
{
  Swift::UInt v1 = *v0;
  sub_100006A60();
  sub_100006A70(v1);
  return sub_100006A80();
}

void sub_100001DCC()
{
  sub_100006A70(*v0);
}

Swift::Int sub_100001DF8()
{
  Swift::UInt v1 = *v0;
  sub_100006A60();
  sub_100006A70(v1);
  return sub_100006A80();
}

uint64_t sub_100001E3C()
{
  uint64_t result = 0x656C746954626F6ALL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x73656761506D756ELL;
      break;
    case 2:
      uint64_t result = 0x50746E6572727563;
      break;
    case 3:
      uint64_t result = 0x617453726F727265;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100001ED8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000028A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100001F00()
{
  return 0;
}

void sub_100001F0C(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_100001F18(uint64_t a1)
{
  unint64_t v2 = sub_100002D84();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100001F54(uint64_t a1)
{
  unint64_t v2 = sub_100002D84();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100001F90(void *a1)
{
  uint64_t v3 = sub_100002CFC(&qword_10000C100);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002D40(a1, a1[3]);
  sub_100002D84();
  sub_100006AA0();
  v8[15] = 0;
  sub_100006A30();
  if (!v1)
  {
    v8[14] = 1;
    sub_100006A40();
    v8[13] = 2;
    sub_100006A40();
    v8[12] = 3;
    sub_100006A30();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

double sub_100002140@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_100002A94(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_100002184(void *a1)
{
  return sub_100001F90(a1);
}

Swift::Int sub_10000219C()
{
  Swift::UInt v1 = *(void *)(v0 + 16);
  Swift::UInt v2 = *(void *)(v0 + 24);
  sub_100006A60();
  swift_bridgeObjectRetain();
  sub_100006A00();
  swift_bridgeObjectRelease();
  sub_100006A70(v1);
  sub_100006A70(v2);
  swift_bridgeObjectRetain();
  sub_100006A00();
  swift_bridgeObjectRelease();
  return sub_100006A80();
}

uint64_t sub_100002250()
{
  Swift::UInt v1 = *(void *)(v0 + 16);
  Swift::UInt v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_100006A00();
  swift_bridgeObjectRelease();
  sub_100006A70(v1);
  sub_100006A70(v2);
  swift_bridgeObjectRetain();
  sub_100006A00();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000022F4()
{
  Swift::UInt v1 = *(void *)(v0 + 16);
  Swift::UInt v2 = *(void *)(v0 + 24);
  sub_100006A60();
  swift_bridgeObjectRetain();
  sub_100006A00();
  swift_bridgeObjectRelease();
  sub_100006A70(v1);
  sub_100006A70(v2);
  swift_bridgeObjectRetain();
  sub_100006A00();
  swift_bridgeObjectRelease();
  return sub_100006A80();
}

uint64_t sub_1000023A4(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_1000027F4(v7, v8) & 1;
}

uint64_t sub_1000023EC()
{
  return 0;
}

uint64_t sub_1000023F8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_100002428(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100002434(uint64_t a1)
{
  unint64_t v2 = sub_100002E28();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100002470(uint64_t a1)
{
  unint64_t v2 = sub_100002E28();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000024AC(uint64_t a1)
{
  return sub_100002DD8(a1);
}

uint64_t sub_1000024D4(void *a1)
{
  uint64_t v2 = sub_100002CFC(&qword_10000C108);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  long long v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002D40(a1, a1[3]);
  sub_100002E28();
  sub_100006AA0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_1000025E8()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

unint64_t sub_100002640()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_100002698()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_1000026F0()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

unint64_t sub_100002748()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

unint64_t sub_1000027A0()
{
  unint64_t result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_1000027F4(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_100006A50(), uint64_t result = 0, (v5 & 1) != 0))
  {
    if (a1[2] == a2[2] && a1[3] == a2[3])
    {
      if (a1[4] == a2[4] && a1[5] == a2[5])
      {
        return 1;
      }
      else
      {
        return sub_100006A50();
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000028A8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746954626F6ALL && a2 == 0xE800000000000000;
  if (v2 || (sub_100006A50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656761506D756ELL && a2 == 0xE800000000000000 || (sub_100006A50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x50746E6572727563 && a2 == 0xEB00000000656761 || (sub_100006A50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x617453726F727265 && a2 == 0xEB00000000737574)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_100006A50();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_100002A94@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100002CFC(&qword_10000C0F0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002D40(a1, a1[3]);
  sub_100002D84();
  sub_100006A90();
  if (v2) {
    return sub_100002DD8((uint64_t)a1);
  }
  char v25 = 0;
  uint64_t v9 = sub_100006A10();
  uint64_t v11 = v10;
  char v24 = 1;
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_100006A20();
  char v23 = 2;
  uint64_t v20 = sub_100006A20();
  char v22 = 3;
  uint64_t v12 = sub_100006A10();
  uint64_t v14 = v13;
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v19 = v12;
  v15(v8, v5);
  swift_bridgeObjectRetain();
  sub_100002DD8((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v11;
  uint64_t v17 = v20;
  a2[2] = v21;
  a2[3] = v17;
  a2[4] = v19;
  a2[5] = v14;
  return result;
}

uint64_t sub_100002CFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_100002D40(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100002D84()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

uint64_t sub_100002DD8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100002E28()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.CodingKeys;
}

unsigned char *initializeBufferWithCopyOfBuffer for PrintActivityAttributes.ContentState.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PrintActivityAttributes.ContentState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100002FF8);
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

uint64_t sub_100003020(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000302C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PrintActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for PrintActivityAttributes.ContentState.CodingKeys;
}

unint64_t sub_100003048()
{
  unint64_t result = qword_10000C118;
  if (!qword_10000C118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C118);
  }
  return result;
}

unint64_t sub_1000030A0()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_1000030F8()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

unint64_t sub_100003150()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

unint64_t sub_1000031A8()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

uint64_t sub_1000031FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v38 = a1;
  uint64_t v3 = sub_100002CFC(&qword_10000C220);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  v37 = &v28[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  BOOL v7 = &v28[-v6];
  uint64_t v8 = sub_100002CFC(&qword_10000C1F0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = &v28[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_100006890();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = &v28[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100006880();
  (*(void (**)(unsigned char *, void, uint64_t))(v12 + 104))(v14, enum case for Image.ResizingMode.stretch(_:), v11);
  sub_1000068C0();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v15 = enum case for Image.TemplateRenderingMode.template(_:);
  uint64_t v16 = sub_1000068B0();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v17 + 104))(v10, v15, v16);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v17 + 56))(v10, 0, 1, v16);
  uint64_t v18 = sub_1000068A0();
  swift_release();
  sub_100006568((uint64_t)v10, &qword_10000C1F0);
  sub_100006900();
  sub_100006700();
  uint64_t v36 = v39;
  int v35 = v40;
  uint64_t v34 = v41;
  int v33 = v42;
  uint64_t v31 = v44;
  uint64_t v32 = v43;
  sub_100006900();
  sub_100006700();
  uint64_t v30 = v45;
  int v29 = v46;
  uint64_t v19 = v47;
  LOBYTE(v17) = v48;
  uint64_t v20 = v49;
  uint64_t v21 = v50;
  *(void *)BOOL v7 = sub_100006760();
  *((void *)v7 + 1) = 0;
  v7[16] = 1;
  uint64_t v22 = sub_100002CFC(&qword_10000C228);
  sub_100003648(v38, &v7[*(int *)(v22 + 44)]);
  char v23 = v37;
  sub_100006504((uint64_t)v7, (uint64_t)v37, &qword_10000C220);
  *(void *)a2 = v18;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v36;
  *(unsigned char *)(a2 + 32) = v35;
  *(void *)(a2 + 40) = v34;
  *(unsigned char *)(a2 + 48) = v33;
  uint64_t v24 = v31;
  *(void *)(a2 + 56) = v32;
  *(void *)(a2 + 64) = v24;
  *(void *)(a2 + 72) = 0x4028000000000000;
  *(unsigned char *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = v30;
  *(unsigned char *)(a2 + 96) = v29;
  *(void *)(a2 + 104) = v19;
  *(unsigned char *)(a2 + 112) = v17;
  *(void *)(a2 + 120) = v20;
  *(void *)(a2 + 128) = v21;
  uint64_t v25 = sub_100002CFC(&qword_10000C230);
  sub_100006504((uint64_t)v23, a2 + *(int *)(v25 + 64), &qword_10000C220);
  uint64_t v26 = a2 + *(int *)(v25 + 80);
  *(void *)uint64_t v26 = 0;
  *(unsigned char *)(v26 + 8) = 1;
  swift_retain();
  sub_100006568((uint64_t)v7, &qword_10000C220);
  sub_100006568((uint64_t)v23, &qword_10000C220);
  return swift_release();
}

uint64_t sub_100003648@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  v53 = a2;
  uint64_t v56 = sub_100002CFC(&qword_10000C238);
  uint64_t v55 = *(void *)(v56 - 8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v54 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v51 - v5;
  long long v7 = *(_OWORD *)(a1 + 24);
  long long v65 = *(_OWORD *)(a1 + 8);
  long long v66 = v7;
  long long v67 = *(_OWORD *)(a1 + 40);
  uint64_t v68 = *(void *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 24);
  long long v57 = *(_OWORD *)(a1 + 8);
  long long v58 = v8;
  long long v59 = *(_OWORD *)(a1 + 40);
  uint64_t v60 = *(void *)(a1 + 56);
  uint64_t v51 = sub_100002CFC(&qword_10000C240);
  sub_1000068E0();
  uint64_t v9 = v61;
  uint64_t v10 = v62;
  swift_bridgeObjectRelease();
  *(void *)&long long v57 = v9;
  *((void *)&v57 + 1) = v10;
  unint64_t v52 = sub_100005BC8();
  uint64_t v11 = sub_100006810();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  sub_1000067D0();
  uint64_t v16 = sub_100006800();
  uint64_t v18 = v17;
  char v20 = v19;
  uint64_t v22 = v21;
  swift_release();
  sub_100005C1C(v11, v13, v15);
  swift_bridgeObjectRelease();
  *(void *)&long long v57 = v16;
  *((void *)&v57 + 1) = v18;
  LOBYTE(v58) = v20 & 1;
  *((void *)&v58 + 1) = v22;
  char v23 = v6;
  sub_100006860();
  sub_100005C1C(v16, v18, v20 & 1);
  swift_bridgeObjectRelease();
  long long v57 = v65;
  long long v58 = v66;
  long long v59 = v67;
  uint64_t v60 = v68;
  sub_1000068E0();
  swift_bridgeObjectRelease();
  uint64_t v24 = v63;
  swift_bridgeObjectRelease();
  long long v57 = v65;
  long long v58 = v66;
  long long v59 = v67;
  uint64_t v60 = v68;
  sub_1000068E0();
  swift_bridgeObjectRelease();
  uint64_t v25 = v64;
  swift_bridgeObjectRelease();
  uint64_t v26 = sub_1000059D0(v24, v25, &qword_10000C0A8);
  if (v27)
  {
    uint64_t v28 = v26;
    uint64_t v29 = v27;
  }
  else
  {
    if (qword_10000C0B8 != -1) {
      swift_once();
    }
    uint64_t v28 = qword_10000CBB0;
    uint64_t v29 = swift_bridgeObjectRetain();
  }
  *(void *)&long long v57 = v28;
  *((void *)&v57 + 1) = v29;
  uint64_t v30 = sub_100006810();
  uint64_t v32 = v31;
  char v34 = v33 & 1;
  sub_1000067A0();
  uint64_t v35 = sub_100006800();
  uint64_t v37 = v36;
  char v39 = v38;
  unint64_t v52 = v40;
  swift_release();
  char v41 = v39 & 1;
  sub_100005C1C(v30, v32, v34);
  swift_bridgeObjectRelease();
  uint64_t v42 = v55;
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  uint64_t v44 = v54;
  uint64_t v45 = v23;
  uint64_t v46 = v56;
  v43(v54, v23, v56);
  uint64_t v47 = v53;
  v43(v53, v44, v46);
  char v48 = &v47[*(int *)(sub_100002CFC(&qword_10000C248) + 48)];
  *(void *)char v48 = v35;
  *((void *)v48 + 1) = v37;
  v48[16] = v41;
  *((void *)v48 + 3) = v52;
  sub_100005DE0(v35, v37, v41);
  uint64_t v49 = *(void (**)(char *, uint64_t))(v42 + 8);
  swift_bridgeObjectRetain();
  v49(v45, v46);
  sub_100005C1C(v35, v37, v41);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v49)(v44, v46);
}

uint64_t sub_100003AD4()
{
  return sub_100006850();
}

uint64_t sub_100003AF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100002CFC(&qword_10000C208);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = v1[1];
  v20[0] = *v1;
  v20[1] = v6;
  long long v7 = v1[3];
  v20[2] = v1[2];
  v20[3] = v7;
  *(void *)uint64_t v5 = sub_100006750();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v8 = sub_100002CFC(&qword_10000C210);
  sub_1000031FC((uint64_t)v20, (uint64_t)&v5[*(int *)(v8 + 44)]);
  char v9 = sub_100006780();
  sub_1000066F0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  sub_100006504((uint64_t)v5, a1, &qword_10000C208);
  uint64_t v18 = a1 + *(int *)(sub_100002CFC(&qword_10000C218) + 36);
  *(unsigned char *)uint64_t v18 = v9;
  *(void *)(v18 + 8) = v11;
  *(void *)(v18 + 16) = v13;
  *(void *)(v18 + 24) = v15;
  *(void *)(v18 + 32) = v17;
  *(unsigned char *)(v18 + 40) = 0;
  return sub_100006568((uint64_t)v5, &qword_10000C208);
}

__n128 sub_100003C18@<Q0>(uint64_t a1@<X8>)
{
  sub_100002CFC(&qword_10000C158);
  sub_100006920();
  sub_100006930();
  sub_1000068D0();
  sub_1000068D0();
  __n128 result = v6;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = v5;
  *(__n128 *)(a1 + 40) = v6;
  *(void *)(a1 + 56) = v7;
  return result;
}

uint64_t sub_100003CDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v31 = a5;
  uint64_t v32 = a4;
  uint64_t v28 = a1;
  uint64_t v8 = sub_100002CFC(&qword_10000C158);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v29 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v26 - v12;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v27((char *)v26 - v12, a1, v8);
  uint64_t v14 = *(unsigned __int8 *)(v9 + 80);
  v26[1] = v14 | 7;
  uint64_t v15 = (void *)swift_allocObject();
  uint64_t v30 = v15;
  uint64_t v16 = a2;
  v15[2] = a2;
  v15[3] = a3;
  uint64_t v17 = a3;
  v26[0] = a3;
  uint64_t v18 = v32;
  v15[4] = v32;
  char v19 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v19((char *)v15 + ((v14 + 40) & ~v14), v13, v8);
  char v20 = (void *)swift_allocObject();
  v20[2] = v16;
  v20[3] = v17;
  _OWORD v20[4] = v18;
  uint64_t v21 = v29;
  v27(v29, v28, v8);
  uint64_t v22 = swift_allocObject();
  v19((char *)(v22 + ((v14 + 16) & ~v14)), v21, v8);
  char v23 = (void *)swift_allocObject();
  v23[2] = v16;
  uint64_t v24 = v32;
  v23[3] = v26[0];
  v23[4] = v24;
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  sub_100002CFC(&qword_10000C160);
  sub_100002CFC(&qword_10000C168);
  sub_100006668(&qword_10000C170, &qword_10000C160);
  sub_1000056AC();
  return sub_100006910();
}

uint64_t sub_100003FE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v26 = a5;
  uint64_t v27 = sub_100002CFC(&qword_10000C198);
  uint64_t v25 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100002CFC(&qword_10000C1A0);
  uint64_t v23 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000069B0();
  __chkstk_darwin(v13 - 8);
  uint64_t v22 = sub_100002CFC(&qword_10000C1A8);
  uint64_t v14 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006990();
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v17 = sub_100002CFC(&qword_10000C1B0);
  unint64_t v18 = sub_100005C8C();
  sub_100006960();
  sub_1000069A0();
  uint64_t v31 = a4;
  sub_100002CFC(&qword_10000C1C0);
  uint64_t v19 = sub_100005664(&qword_10000C1C8);
  uint64_t v20 = sub_100006668(&qword_10000C1D0, &qword_10000C1C8);
  uint64_t v35 = v19;
  unint64_t v36 = v20;
  swift_getOpaqueTypeConformance2();
  sub_100006960();
  uint64_t v30 = v16;
  sub_100002CFC(&qword_10000C1D8);
  uint64_t v35 = v17;
  unint64_t v36 = v18;
  swift_getOpaqueTypeConformance2();
  sub_100006970();
  uint64_t v28 = v10;
  uint64_t v29 = v12;
  sub_100002CFC(&qword_10000C160);
  sub_100006668(&qword_10000C170, &qword_10000C160);
  sub_100006970();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v27);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v24);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v22);
}

double sub_100004428@<D0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  swift_retain();
  sub_100006900();
  sub_100006700();
  *(void *)a2 = a1;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v5;
  *(unsigned char *)(a2 + 32) = v6;
  *(void *)(a2 + 40) = v7;
  *(unsigned char *)(a2 + 48) = v8;
  double result = *(double *)&v9;
  *(_OWORD *)(a2 + 56) = v9;
  return result;
}

uint64_t sub_1000044B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  uint64_t v1 = sub_1000069D0();
  uint64_t v26 = *(void *)(v1 - 8);
  uint64_t v27 = v1;
  __chkstk_darwin(v1);
  uint64_t v25 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100006750();
  uint64_t v19 = sub_100006770();
  sub_100004888((uint64_t)&v75);
  unint64_t v3 = *((void *)&v75 + 1);
  unint64_t v4 = v75;
  char v5 = v76;
  long long v6 = v77;
  char v7 = v78;
  uint64_t v17 = *((void *)&v78 + 1);
  uint64_t v18 = *((void *)&v76 + 1);
  uint64_t v15 = *((void *)&v79 + 1);
  uint64_t v16 = v79;
  char v8 = v80;
  uint64_t v14 = *((void *)&v80 + 1);
  HIDWORD(v13) = v81;
  char v44 = 0;
  char v43 = v76;
  char v42 = v78;
  char v41 = v80;
  sub_100006900();
  sub_100006700();
  uint64_t v22 = v37;
  uint64_t v23 = v35;
  uint64_t v20 = v40;
  uint64_t v21 = v39;
  *(void *)&long long v45 = v19;
  *((void *)&v45 + 1) = 0xC000000000000000;
  v46[0] = 0;
  *(_OWORD *)&v46[8] = __PAIR128__(v3, v4);
  unint64_t v9 = v3;
  v46[24] = v5;
  *(void *)uint64_t v47 = v18;
  *(_OWORD *)&v47[8] = v6;
  v47[24] = v7;
  *(void *)&long long v48 = v17;
  *((void *)&v48 + 1) = v16;
  *(void *)&v49[0] = v15;
  BYTE8(v49[0]) = v8;
  *(void *)&v49[1] = v14;
  BYTE8(v49[1]) = BYTE4(v13);
  long long v57 = *(_OWORD *)&v47[16];
  long long v58 = v48;
  v59[0] = v49[0];
  long long v55 = *(_OWORD *)&v46[16];
  long long v56 = *(_OWORD *)v47;
  long long v53 = v45;
  long long v54 = *(_OWORD *)v46;
  *(_OWORD *)((char *)v59 + 9) = *(_OWORD *)((char *)v49 + 9);
  char v52 = 0;
  char v51 = v36;
  char v10 = v36;
  char v50 = v38;
  LOBYTE(v3) = v38;
  v60[0] = v19;
  v60[1] = 0xC000000000000000;
  char v61 = 0;
  unsigned long long v62 = __PAIR128__(v9, v4);
  char v63 = v5;
  uint64_t v64 = v18;
  long long v65 = v6;
  char v66 = v7;
  uint64_t v67 = v17;
  uint64_t v68 = v16;
  uint64_t v69 = v15;
  char v70 = v8;
  uint64_t v71 = v14;
  char v72 = BYTE4(v13);
  sub_100005D50((uint64_t)&v45);
  sub_100005DF0((uint64_t)v60);
  *(_OWORD *)&v73[71] = v57;
  *(_OWORD *)&v73[87] = v58;
  *(_OWORD *)&v73[103] = v59[0];
  *(_OWORD *)&v73[119] = v59[1];
  *(_OWORD *)&v73[7] = v53;
  *(_OWORD *)&v73[23] = v54;
  *(_OWORD *)&v73[39] = v55;
  *(_OWORD *)&v73[55] = v56;
  *(_OWORD *)((char *)&v30[5] + 1) = *(_OWORD *)&v73[80];
  *(_OWORD *)((char *)&v30[6] + 1) = *(_OWORD *)&v73[96];
  *(_OWORD *)((char *)&v30[7] + 1) = *(_OWORD *)&v73[112];
  *(_OWORD *)((char *)&v30[1] + 1) = *(_OWORD *)&v73[16];
  *(_OWORD *)((char *)&v30[2] + 1) = *(_OWORD *)&v73[32];
  *(_OWORD *)((char *)&v30[3] + 1) = *(_OWORD *)&v73[48];
  *(_OWORD *)((char *)&v30[4] + 1) = *(_OWORD *)&v73[64];
  char v74 = 1;
  *(_OWORD *)((char *)v30 + 1) = *(_OWORD *)v73;
  long long v29 = (unint64_t)v24;
  LOBYTE(v30[0]) = 1;
  *(void *)&v30[8] = *((void *)&v59[1] + 1);
  *((void *)&v30[8] + 1) = 0x4028000000000000;
  LOBYTE(v31) = 0;
  *((void *)&v31 + 1) = v23;
  LOBYTE(v32) = v10;
  *((void *)&v32 + 1) = v22;
  LOBYTE(v33) = v3;
  *((void *)&v33 + 1) = v21;
  uint64_t v34 = v20;
  uint64_t v11 = v25;
  sub_1000069C0();
  sub_100002CFC(&qword_10000C1C8);
  sub_100006668(&qword_10000C1D0, &qword_10000C1C8);
  sub_100006820();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v27);
  long long v85 = v31;
  long long v86 = v32;
  long long v87 = v33;
  uint64_t v88 = v34;
  long long v81 = v30[5];
  long long v82 = v30[6];
  long long v83 = v30[7];
  long long v84 = v30[8];
  long long v77 = v30[1];
  long long v78 = v30[2];
  long long v79 = v30[3];
  long long v80 = v30[4];
  long long v75 = v29;
  long long v76 = v30[0];
  return sub_100005E80((uint64_t)&v75);
}

uint64_t sub_100004888@<X0>(uint64_t a1@<X8>)
{
  sub_100002CFC(&qword_10000C158);
  sub_100006930();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006930();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000059D0(v38, v37, &qword_10000C0A8);
  if (!v2)
  {
    if (qword_10000C0B8 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
  }
  sub_100005BC8();
  uint64_t v3 = sub_100006810();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_1000067C0();
  uint64_t v8 = sub_100006800();
  uint64_t v10 = v9;
  char v12 = v11;
  swift_release();
  sub_100005C1C(v3, v5, v7);
  swift_bridgeObjectRelease();
  sub_100006870();
  uint64_t v13 = sub_1000067E0();
  uint64_t v34 = v14;
  uint64_t v35 = v13;
  char v16 = v15;
  uint64_t v36 = v17;
  swift_release();
  char v33 = v16 & 1;
  sub_100005C1C(v8, v10, v12 & 1);
  swift_bridgeObjectRelease();
  sub_100006930();
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_100006810();
  uint64_t v20 = v19;
  char v22 = v21 & 1;
  sub_100006790();
  uint64_t v23 = sub_100006800();
  uint64_t v25 = v24;
  char v27 = v26;
  uint64_t v29 = v28;
  swift_release();
  sub_100005C1C(v18, v20, v22);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = swift_getKeyPath();
  *(void *)a1 = v35;
  *(void *)(a1 + 8) = v34;
  *(unsigned char *)(a1 + 16) = v33;
  *(void *)(a1 + 24) = v36;
  *(void *)(a1 + 32) = v23;
  *(void *)(a1 + 40) = v25;
  *(unsigned char *)(a1 + 48) = v27 & 1;
  *(void *)(a1 + 56) = v29;
  *(void *)(a1 + 64) = KeyPath;
  *(void *)(a1 + 72) = 1;
  *(unsigned char *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v31;
  *(unsigned char *)(a1 + 96) = 2;
  sub_100005DE0(v35, v34, v33);
  swift_bridgeObjectRetain();
  sub_100005DE0(v23, v25, v27 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_100005C1C(v23, v25, v27 & 1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100005C1C(v35, v34, v33);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100004BE0@<X0>(uint64_t a1@<X8>)
{
  sub_100002CFC(&qword_10000C158);
  sub_100006930();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100006930();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000059D0(v22, v21, &qword_10000C0B0);
  if (!v2)
  {
    if (qword_10000C0B8 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
  }
  sub_100005BC8();
  uint64_t v3 = sub_100006810();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  uint64_t v8 = sub_1000067F0();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_100005C1C(v3, v5, v7);
  swift_bridgeObjectRelease();
  sub_1000067B0();
  uint64_t v13 = sub_100006800();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_release();
  sub_100005C1C(v8, v10, v12);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v17 & 1;
  *(void *)(a1 + 24) = v19;
  return result;
}

unint64_t sub_100004DB0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100005FC8();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_100004DDC()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  unint64_t v4 = (void *)swift_allocObject();
  v4[2] = v2;
  v4[3] = v1;
  v4[4] = v3;
  sub_100005300();
  sub_100005354();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_100006940();
}

void sub_100004EB0(uint64_t a1)
{
}

void sub_100004ED8(uint64_t a1)
{
}

void sub_100004F04(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, void *a5)
{
  uint64_t v9 = (objc_class *)[self mainBundle];
  v14._countAndFlagsBits = 0x8000000100007BA0;
  v15._countAndFlagsBits = a2;
  v15._object = a3;
  v16.value._countAndFlagsBits = 0;
  v16.value._object = 0;
  v10.super.isa = v9;
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  uint64_t v11 = sub_1000066E0(v15, v16, v10, v17, v14);
  uint64_t v13 = v12;

  *a4 = v11;
  *a5 = v13;
}

void sub_100004FBC()
{
  uint64_t v0 = (objc_class *)[self mainBundle];
  v5._countAndFlagsBits = 0x8000000100007B70;
  v6._countAndFlagsBits = 0x676E69746E697250;
  v6._object = (void *)0xE800000000000000;
  v7.value._countAndFlagsBits = 0;
  v7.value._object = 0;
  v1.super.isa = v0;
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  uint64_t v2 = sub_1000066E0(v6, v7, v1, v8, v5);
  uint64_t v4 = v3;

  qword_10000CBB0 = v2;
  *(void *)algn_10000CBB8 = v4;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000050A4()
{
  unint64_t result = qword_10000C140;
  if (!qword_10000C140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

uint64_t destroy for PrintLiveActivity()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s21PrintLiveActivity_iOS17PrintLiveActivityVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PrintLiveActivity(void *a1, void *a2)
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

__n128 initializeWithTake for PrintLiveActivity(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PrintLiveActivity(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintLiveActivity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PrintLiveActivity(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PrintLiveActivity()
{
  return &type metadata for PrintLiveActivity;
}

uint64_t sub_1000052D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000052F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100003CDC(a1, v2[2], v2[3], v2[4], a2);
}

unint64_t sub_100005300()
{
  unint64_t result = qword_10000C148;
  if (!qword_10000C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

unint64_t sub_100005354()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

uint64_t sub_1000053A8()
{
  uint64_t v1 = sub_100002CFC(&qword_10000C158);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100005480@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(sub_100002CFC(&qword_10000C158) - 8);
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (uint64_t)v1 + ((*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100003FE0(v4, v5, v6, v7, a1);
}

uint64_t sub_100005504()
{
  uint64_t v1 = sub_100002CFC(&qword_10000C158);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100005598@<X0>(uint64_t a1@<X8>)
{
  sub_100002CFC(&qword_10000C158);

  return sub_100004BE0(a1);
}

uint64_t sub_100005610()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005650@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = *(void *)(v1 + 32);
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  return swift_retain();
}

uint64_t sub_100005664(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000056AC()
{
  unint64_t result = qword_10000C178;
  if (!qword_10000C178)
  {
    sub_100005664(&qword_10000C168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C178);
  }
  return result;
}

uint64_t sub_100005720@<X0>(char *a1@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v1 = sub_100002CFC(&qword_10000C1E0);
  uint64_t v27 = *(void *)(v1 - 8);
  uint64_t v2 = v27;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - v5;
  uint64_t v7 = sub_100002CFC(&qword_10000C1D8);
  uint64_t v28 = *(void *)(v7 - 8);
  uint64_t v8 = v28;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - v12;
  sub_100002CFC(&qword_10000C198);
  sub_100006980();
  sub_100002CFC(&qword_10000C1A0);
  char v26 = v6;
  sub_100006950();
  Swift::String v14 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  Swift::String v15 = v11;
  v14(v11, v13, v7);
  Swift::String_optional v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  Swift::String v17 = v29;
  uint64_t v18 = v6;
  uint64_t v19 = v1;
  v16(v29, v18, v1);
  uint64_t v20 = v30;
  v14(v30, v15, v7);
  uint64_t v21 = sub_100002CFC(&qword_10000C1E8);
  v16(&v20[*(int *)(v21 + 48)], v17, v19);
  uint64_t v22 = *(void (**)(char *, uint64_t))(v27 + 8);
  v22(v26, v19);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v28 + 8);
  v23(v13, v7);
  v22(v17, v19);
  return ((uint64_t (*)(char *, uint64_t))v23)(v15, v7);
}

uint64_t sub_1000059D0(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1 && a2)
  {
    if (*a3 != -1) {
      swift_once();
    }
    sub_100002CFC(&qword_10000C188);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_100006FC0;
    uint64_t v6 = self;
    id v7 = [objc_allocWithZone((Class)NSNumber) initWithInteger:a2];
    id v8 = [v6 localizedStringFromNumber:v7 numberStyle:1];

    uint64_t v9 = sub_1000069F0();
    uint64_t v11 = v10;

    *(void *)(v5 + 56) = &type metadata for String;
    unint64_t v12 = sub_100005C2C();
    *(void *)(v5 + 64) = v12;
    *(void *)(v5 + 32) = v9;
    *(void *)(v5 + 40) = v11;
    id v13 = [objc_allocWithZone((Class)NSNumber) initWithInteger:a1];
    id v14 = [v6 localizedStringFromNumber:v13 numberStyle:1];

    uint64_t v15 = sub_1000069F0();
    uint64_t v17 = v16;

    *(void *)(v5 + 96) = &type metadata for String;
    *(void *)(v5 + 104) = v12;
    *(void *)(v5 + 72) = v15;
    *(void *)(v5 + 80) = v17;
    uint64_t v18 = sub_1000069E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_10000C0B8 != -1) {
      swift_once();
    }
    uint64_t v18 = qword_10000CBB0;
    swift_bridgeObjectRetain();
  }
  return v18;
}

unint64_t sub_100005BC8()
{
  unint64_t result = qword_10000C180;
  if (!qword_10000C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C180);
  }
  return result;
}

uint64_t sub_100005C1C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_100005C2C()
{
  unint64_t result = qword_10000C190;
  if (!qword_10000C190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C190);
  }
  return result;
}

double sub_100005C80@<D0>(uint64_t a1@<X8>)
{
  return sub_100004428(*(void *)(v1 + 32), a1);
}

unint64_t sub_100005C8C()
{
  unint64_t result = qword_10000C1B8;
  if (!qword_10000C1B8)
  {
    sub_100005664(&qword_10000C1B0);
    sub_1000056AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1B8);
  }
  return result;
}

uint64_t sub_100005D08@<X0>(uint64_t a1@<X8>)
{
  return sub_1000044B4(a1);
}

uint64_t sub_100005D10()
{
  return sub_100006950();
}

uint64_t sub_100005D48@<X0>(char *a1@<X8>)
{
  return sub_100005720(a1);
}

uint64_t sub_100005D50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_100005DE0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_100005DE0(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100005DE0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100005DF0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  sub_100005C1C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_100005C1C(v2, v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100005E80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  char v4 = *(unsigned char *)(a1 + 96);
  sub_100005C1C(*(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned char *)(a1 + 64));
  swift_bridgeObjectRelease();
  sub_100005C1C(v2, v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100005F10@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_100006730();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100005F44()
{
  return sub_100006740();
}

uint64_t sub_100005F74@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006710();
  *a1 = result;
  return result;
}

uint64_t sub_100005FA0()
{
  return sub_100006720();
}

unint64_t sub_100005FC8()
{
  uint64_t v0 = sub_100002CFC(&qword_10000C1F0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006890();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006880();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Image.ResizingMode.stretch(_:), v3);
  sub_1000068C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v7 = enum case for Image.TemplateRenderingMode.template(_:);
  uint64_t v8 = sub_1000068B0();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 104))(v2, v7, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v2, 0, 1, v8);
  sub_1000068A0();
  swift_release();
  sub_100006568((uint64_t)v2, &qword_10000C1F0);
  return 0xD000000000000011;
}

uint64_t destroy for PrintLiveActivityEntryView()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for PrintLiveActivityEntryView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PrintLiveActivityEntryView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for PrintLiveActivityEntryView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PrintLiveActivityEntryView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PrintLiveActivityEntryView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PrintLiveActivityEntryView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PrintLiveActivityEntryView()
{
  return &type metadata for PrintLiveActivityEntryView;
}

uint64_t sub_1000064AC()
{
  return sub_100006668(&qword_10000C1F8, &qword_10000C200);
}

uint64_t sub_1000064E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006504(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002CFC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006568(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002CFC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000065C8()
{
  unint64_t result = qword_10000C250;
  if (!qword_10000C250)
  {
    sub_100005664(&qword_10000C218);
    sub_100006668(&qword_10000C258, &qword_10000C208);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C250);
  }
  return result;
}

uint64_t sub_100006668(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005664(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000066AC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1000066E0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_1000066F0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100006700()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100006710()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100006720()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100006730()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_100006740()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100006750()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100006760()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100006770()
{
  return static HorizontalAlignment.trailing.getter();
}

uint64_t sub_100006780()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100006790()
{
  return static Font.body.getter();
}

uint64_t sub_1000067A0()
{
  return static Font.callout.getter();
}

uint64_t sub_1000067B0()
{
  return static Font.caption2.getter();
}

uint64_t sub_1000067C0()
{
  return static Font.footnote.getter();
}

uint64_t sub_1000067D0()
{
  return static Font.headline.getter();
}

uint64_t sub_1000067E0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1000067F0()
{
  return Text.monospacedDigit()();
}

uint64_t sub_100006800()
{
  return Text.font(_:)();
}

uint64_t sub_100006810()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100006820()
{
  return View.dynamicIsland(verticalPlacement:)();
}

uint64_t sub_100006830()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100006840()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100006850()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006860()
{
  return View.privacySensitive(_:)();
}

uint64_t sub_100006870()
{
  return static Color.secondary.getter();
}

uint64_t sub_100006880()
{
  return Image.init(systemName:)();
}

uint64_t sub_100006890()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000068A0()
{
  return Image.renderingMode(_:)();
}

uint64_t sub_1000068B0()
{
  return type metadata accessor for Image.TemplateRenderingMode();
}

uint64_t sub_1000068C0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_1000068D0()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_1000068E0()
{
  return State.wrappedValue.getter();
}

uint64_t sub_1000068F0()
{
  return static Widget.main()();
}

uint64_t sub_100006900()
{
  return static Alignment.center.getter();
}

uint64_t sub_100006910()
{
  return DynamicIsland.init<A, B, C, D>(expanded:compactLeading:compactTrailing:minimal:)();
}

uint64_t sub_100006920()
{
  return ActivityViewContext.attributes.getter();
}

uint64_t sub_100006930()
{
  return ActivityViewContext.state.getter();
}

uint64_t sub_100006940()
{
  return ActivityConfiguration.init<A>(for:content:dynamicIsland:)();
}

uint64_t sub_100006950()
{
  return DynamicIslandExpandedRegion._viewRepresentation.getter();
}

uint64_t sub_100006960()
{
  return DynamicIslandExpandedRegion.init(_:priority:content:)();
}

uint64_t sub_100006970()
{
  return DynamicIslandExpandedContent.init(content:)();
}

uint64_t sub_100006980()
{
  return DynamicIslandExpandedContent.content.getter();
}

uint64_t sub_100006990()
{
  return static DynamicIslandExpandedRegionPosition.leading.getter();
}

uint64_t sub_1000069A0()
{
  return static DynamicIslandExpandedRegionPosition.trailing.getter();
}

uint64_t sub_1000069B0()
{
  return type metadata accessor for DynamicIslandExpandedRegionPosition();
}

uint64_t sub_1000069C0()
{
  return static DynamicIslandExpandedRegionVerticalPlacement.belowIfTooWide.getter();
}

uint64_t sub_1000069D0()
{
  return type metadata accessor for DynamicIslandExpandedRegionVerticalPlacement();
}

uint64_t sub_1000069E0()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_1000069F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006A00()
{
  return String.hash(into:)();
}

uint64_t sub_100006A10()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006A20()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100006A30()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006A40()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_100006A50()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006A60()
{
  return Hasher.init(_seed:)();
}

void sub_100006A70(Swift::UInt a1)
{
}

Swift::Int sub_100006A80()
{
  return Hasher._finalize()();
}

uint64_t sub_100006A90()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_100006AA0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}