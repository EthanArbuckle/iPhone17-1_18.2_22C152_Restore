unint64_t ReliabilityCategory.name.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t IFTelemetrySELFMapperIssues.init(rawValue:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, BOOL *a3@<X8>)
{
  v8._countAndFlagsBits = a1;
  v5._rawValue = &off_100021020;
  v8._object = a2;
  Swift::Int v6 = sub_10001BAD0(v5, v8);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v6 != 0;
  return result;
}

unint64_t IFTelemetrySELFMapperIssues.rawValue.getter()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_1000032F0()
{
  return 1;
}

Swift::Int sub_1000032F8()
{
  return sub_10001BB60();
}

uint64_t sub_100003350()
{
  return sub_10001B8F0();
}

Swift::Int sub_10000336C()
{
  return sub_10001BB60();
}

uint64_t sub_1000033C0@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v7._countAndFlagsBits = *a1;
  v3 = (void *)a1[1];
  v4._rawValue = &off_100021058;
  v7._object = v3;
  Swift::Int v5 = sub_10001BAD0(v4, v7);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

void sub_100003414(void *a1@<X8>)
{
  *a1 = 0xD00000000000001DLL;
  a1[1] = 0x800000010001C8E0;
}

void sub_100003434(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_100003470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = sub_10001B8D0();
  Swift::Int v6 = (void *)swift_allocObject();
  v6[2] = 0xD00000000000001BLL;
  v6[3] = 0x800000010001C120;
  v6[4] = 0xD00000000000001DLL;
  v6[5] = 0x800000010001C8E0;
  v6[6] = a2;
  v6[7] = a3;
  v8[4] = sub_100003944;
  v8[5] = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100003A64;
  v8[3] = &unk_100021108;
  Swift::String v7 = _Block_copy(v8);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v7);
}

void sub_10000359C(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

void sub_1000035D8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_bridgeObjectRetain_n();
  v12 = sub_10001B860();
  os_log_type_t v13 = a4();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    sub_100003B08(a1, a2, aBlock);
    sub_10001B9C0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  NSString v15 = sub_10001B8D0();
  v16 = (void *)swift_allocObject();
  v16[2] = 0xD00000000000001BLL;
  v16[3] = 0x800000010001C120;
  v16[4] = 0xD00000000000001DLL;
  v16[5] = 0x800000010001C8E0;
  v16[6] = a1;
  v16[7] = a2;
  aBlock[4] = a6;
  aBlock[5] = (uint64_t)v16;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100003A64;
  aBlock[3] = a7;
  v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v17);
}

unint64_t sub_100003844()
{
  sub_100004414(&qword_100024CA8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001C130;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x800000010001CB90;
  *(void *)(inited + 48) = sub_10001B8D0();
  *(void *)(inited + 56) = 0x6D614E726F727265;
  *(void *)(inited + 64) = 0xE900000000000065;
  *(void *)(inited + 72) = sub_10001B8D0();
  *(void *)(inited + 80) = 0x6E6F73616572;
  *(void *)(inited + 88) = 0xE600000000000000;
  *(void *)(inited + 96) = sub_10001B8D0();
  return sub_100003948(inited);
}

unint64_t sub_100003948(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004414(&qword_100024CB0);
  v2 = (void *)sub_10001BAB0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  Swift::OpaquePointer v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    Swift::String v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10000449C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
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

Class sub_100003A64(uint64_t a1)
{
  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_10000445C();
    v4.super.isa = sub_10001B8B0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_100003AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003B00()
{
  return swift_release();
}

uint64_t sub_100003B08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100003BDC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000043B8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000043B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100004368((uint64_t)v12);
  return v7;
}

uint64_t sub_100003BDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10001B9D0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100003D98(a5, a6);
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
  uint64_t v8 = sub_10001BA20();
  if (!v8)
  {
    sub_10001BA90();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10001BAC0();
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

uint64_t sub_100003D98(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100003E30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100004010(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100004010(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100003E30(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100003FA8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10001BA00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10001BA90();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10001B910();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10001BAC0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10001BA90();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100003FA8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100004414(&qword_100024C98);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100004010(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004414(&qword_100024C98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_10001BAC0();
  __break(1u);
  return result;
}

uint64_t sub_100004168()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

unint64_t sub_1000041B0()
{
  return sub_100003844();
}

unint64_t sub_1000041C4()
{
  unint64_t result = qword_100024C90;
  if (!qword_100024C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024C90);
  }
  return result;
}

uint64_t sub_100004228()
{
  return 0;
}

ValueMetadata *type metadata accessor for ReliabilityCategory()
{
  return &type metadata for ReliabilityCategory;
}

uint64_t _s23IFTelemetrySELFIngestor27IFTelemetrySELFMapperIssuesOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s23IFTelemetrySELFIngestor27IFTelemetrySELFMapperIssuesOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100004330);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for IFTelemetrySELFMapperIssues()
{
  return &type metadata for IFTelemetrySELFMapperIssues;
}

uint64_t sub_100004368(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000043B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100004414(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000445C()
{
  unint64_t result = qword_100024CA0;
  if (!qword_100024CA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100024CA0);
  }
  return result;
}

unint64_t sub_10000449C(uint64_t a1, uint64_t a2)
{
  sub_10001BB50();
  sub_10001B8F0();
  Swift::Int v4 = sub_10001BB60();

  return sub_100004514(a1, a2, v4);
}

unint64_t sub_100004514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10001BAF0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10001BAF0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100004608()
{
  sub_10000467C();
  sub_10001B9A0();

  return sub_10001B890();
}

unint64_t sub_10000467C()
{
  unint64_t result = qword_100024CB8;
  if (!qword_100024CB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100024CB8);
  }
  return result;
}

uint64_t sub_1000046BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor21IFTelemetrySELFMapper_logger;
  uint64_t v4 = sub_10001B880();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

id sub_100004730(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = a3;
  uint64_t v25 = a1;
  v26 = a2;
  uint64_t v3 = sub_100004414(&qword_100024CC0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001B830();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v23 - v11;
  uint64_t v13 = sub_100004414(&qword_100024CC8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v23 - v17;
  uint64_t v19 = sub_10001B1C0();
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56);
  v20(v18, 1, 1, v19);
  sub_100004A1C(v24, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_100004A84((uint64_t)v5, &qword_100024CC0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    sub_10001B1B0();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    sub_100004A84((uint64_t)v18, &qword_100024CC8);
    v20(v16, 0, 1, v19);
    sub_1000059E4((uint64_t)v16, (uint64_t)v18, &qword_100024CC8);
  }
  sub_1000059E4((uint64_t)v18, v25, &qword_100024CC8);
  v21 = v26;

  return v21;
}

uint64_t sub_100004A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004414(&qword_100024CC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004A84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004414(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100004AE0(uint64_t a1)
{
  uint64_t v116 = sub_10001B830();
  v110 = *(void **)(v116 - 8);
  uint64_t v2 = __chkstk_darwin(v116);
  v107 = (char *)&v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v106 = (char *)&v96 - v4;
  uint64_t v5 = sub_100004414(&qword_100024CD0);
  uint64_t v119 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  v100 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v101 = (char *)&v96 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v120 = (uint64_t)&v96 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v114 = (uint64_t)&v96 - v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v96 - v14;
  uint64_t v16 = sub_100004414(&qword_100024CC0);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  v109 = (char *)&v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  v108 = (char *)&v96 - v20;
  __chkstk_darwin(v19);
  v22 = (char *)&v96 - v21;
  uint64_t v23 = sub_100004414(&qword_100024CC8);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  uint64_t v99 = (uint64_t)&v96 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v98 = (uint64_t)&v96 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v105 = (char *)&v96 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  v113 = (char *)&v96 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v115 = (uint64_t)&v96 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  v36 = (char *)&v96 - v35;
  __chkstk_darwin(v34);
  v38 = (char *)&v96 - v37;
  type metadata accessor for IFPlatformRequestClientEventConverter();
  v39 = sub_100017F10(a1);
  uint64_t v118 = v5;
  if (v39)
  {
    v40 = v39;
    uint64_t v41 = a1;
    sub_10001B1F0();
    sub_100004730((uint64_t)v38, v40, (uint64_t)v22);
    uint64_t v42 = (uint64_t)v22;
    sub_100004A84((uint64_t)v22, &qword_100024CC0);
    uint64_t v43 = *(int *)(v5 + 48);
    sub_1000059E4((uint64_t)v38, (uint64_t)v15, &qword_100024CC8);
    *(void *)&v15[v43] = v40;
    v44 = (void *)sub_100005808(0, 1, 1, _swiftEmptyArrayStorage);
    unint64_t v46 = v44[2];
    unint64_t v45 = v44[3];
    if (v46 >= v45 >> 1) {
      v44 = (void *)sub_100005808(v45 > 1, v46 + 1, 1, v44);
    }
    v44[2] = v46 + 1;
    sub_1000059E4((uint64_t)v15, (uint64_t)v44+ ((*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80))+ *(void *)(v119 + 72) * v46, &qword_100024CD0);
  }
  else
  {
    uint64_t v41 = a1;
    uint64_t v42 = (uint64_t)v22;
    v44 = _swiftEmptyArrayStorage;
  }
  type metadata accessor for IFPlatformClientEventConverter();
  v47 = sub_10000B964();
  uint64_t v48 = v42;
  uint64_t v49 = (uint64_t)v108;
  if (v47)
  {
    v50 = v47;
    sub_10001B1F0();
    sub_100004730((uint64_t)v36, v50, v42);
    sub_100004A84(v42, &qword_100024CC0);
    uint64_t v51 = *(int *)(v118 + 48);
    uint64_t v52 = (uint64_t)v36;
    uint64_t v53 = v114;
    sub_1000059E4(v52, v114, &qword_100024CC8);
    *(void *)(v53 + v51) = v50;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v55 = v41;
    v56 = v113;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      v44 = (void *)sub_100005808(0, v44[2] + 1, 1, v44);
    }
    unint64_t v58 = v44[2];
    unint64_t v57 = v44[3];
    if (v58 >= v57 >> 1) {
      v44 = (void *)sub_100005808(v57 > 1, v58 + 1, 1, v44);
    }
    v44[2] = v58 + 1;
    sub_1000059E4(v114, (uint64_t)v44+ ((*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80))+ *(void *)(v119 + 72) * v58, &qword_100024CD0);
  }
  else
  {
    uint64_t v55 = v41;
    v56 = v113;
  }
  type metadata accessor for IFPlanGenerationEventConverter();
  unint64_t v59 = (unint64_t)sub_100016628(v55);
  uint64_t v60 = (uint64_t)v109;
  if (v59)
  {
    uint64_t v61 = v59;
    uint64_t v97 = v48;
    if (v59 >> 62)
    {
      uint64_t result = sub_10001BAA0();
      uint64_t v117 = v55;
      if (result) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t result = *(void *)((v59 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v117 = v55;
      if (result)
      {
LABEL_16:
        if (result < 1)
        {
          __break(1u);
          return result;
        }
        v63 = 0;
        v111 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v110 + 6);
        unint64_t v112 = v61 & 0xC000000000000001;
        v103 = (void (**)(char *, char *, uint64_t))(v110 + 2);
        v104 = (void (**)(char *, uint64_t, uint64_t))(v110 + 4);
        v102 = (void (**)(char *, uint64_t))(v110 + 1);
        v113 = (char *)result;
        uint64_t v114 = v61;
        do
        {
          if (v112) {
            id v64 = (id)sub_10001BA10();
          }
          else {
            id v64 = *(id *)(v61 + 8 * (void)v63 + 32);
          }
          v65 = v64;
          sub_10001B1F0();
          uint64_t v66 = sub_10001B1C0();
          v67 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56);
          v67(v56, 1, 1, v66);
          sub_100004A1C(v49, v60);
          uint64_t v68 = (uint64_t)v56;
          uint64_t v69 = v116;
          if ((*v111)(v60, 1, v116) == 1)
          {
            sub_100004A84(v60, &qword_100024CC0);
          }
          else
          {
            v70 = v106;
            (*v104)(v106, v60, v69);
            (*v103)(v107, v70, v69);
            v110 = v44;
            v71 = v105;
            uint64_t v60 = (uint64_t)v109;
            sub_10001B1B0();
            v72 = v70;
            uint64_t v49 = (uint64_t)v108;
            (*v102)(v72, v69);
            sub_100004A84(v68, &qword_100024CC8);
            v67(v71, 0, 1, v66);
            uint64_t v73 = (uint64_t)v71;
            v44 = v110;
            sub_1000059E4(v73, v68, &qword_100024CC8);
          }
          v56 = (char *)v68;
          uint64_t v74 = v115;
          sub_1000059E4(v68, v115, &qword_100024CC8);
          id v75 = v65;
          sub_100004A84(v49, &qword_100024CC0);
          uint64_t v76 = *(int *)(v118 + 48);
          uint64_t v77 = v74;
          uint64_t v78 = v120;
          sub_1000059E4(v77, v120, &qword_100024CC8);
          *(void *)(v78 + v76) = v75;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v44 = (void *)sub_100005808(0, v44[2] + 1, 1, v44);
          }
          unint64_t v80 = v44[2];
          unint64_t v79 = v44[3];
          if (v80 >= v79 >> 1) {
            v44 = (void *)sub_100005808(v79 > 1, v80 + 1, 1, v44);
          }
          ++v63;
          v44[2] = v80 + 1;
          sub_1000059E4(v120, (uint64_t)v44+ ((*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80))+ *(void *)(v119 + 72) * v80, &qword_100024CD0);

          uint64_t v61 = v114;
        }
        while (v113 != v63);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v81 = (uint64_t)v100;
    uint64_t v55 = v117;
    uint64_t v48 = v97;
    goto LABEL_33;
  }
  uint64_t v81 = (uint64_t)v100;
LABEL_33:
  type metadata accessor for IFRequestLinkConverter();
  v82 = sub_1000062F8(v55);
  uint64_t v83 = v118;
  uint64_t v84 = (uint64_t)v101;
  if (v82)
  {
    v85 = v82;
    sub_10001B1F0();
    uint64_t v86 = v98;
    sub_100004730(v98, v85, v48);
    sub_100004A84(v48, &qword_100024CC0);
    uint64_t v87 = *(int *)(v83 + 48);
    sub_1000059E4(v86, v84, &qword_100024CC8);
    *(void *)(v84 + v87) = v85;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v44 = (void *)sub_100005808(0, v44[2] + 1, 1, v44);
    }
    unint64_t v89 = v44[2];
    unint64_t v88 = v44[3];
    if (v89 >= v88 >> 1) {
      v44 = (void *)sub_100005808(v88 > 1, v89 + 1, 1, v44);
    }
    v44[2] = v89 + 1;
    sub_1000059E4(v84, (uint64_t)v44+ ((*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80))+ *(void *)(v119 + 72) * v89, &qword_100024CD0);
  }
  type metadata accessor for IFFeedbackLearningEventConverter();
  id v90 = sub_10000C698();
  if (v90)
  {
    v91 = v90;
    sub_10001B1F0();
    uint64_t v92 = v99;
    sub_100004730(v99, v91, v48);
    sub_100004A84(v48, &qword_100024CC0);
    uint64_t v93 = *(int *)(v83 + 48);
    sub_1000059E4(v92, v81, &qword_100024CC8);
    *(void *)(v81 + v93) = v91;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      v44 = (void *)sub_100005808(0, v44[2] + 1, 1, v44);
    }
    unint64_t v95 = v44[2];
    unint64_t v94 = v44[3];
    if (v95 >= v94 >> 1) {
      v44 = (void *)sub_100005808(v94 > 1, v95 + 1, 1, v44);
    }
    v44[2] = v95 + 1;
    sub_1000059E4(v81, (uint64_t)v44+ ((*(unsigned __int8 *)(v119 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80))+ *(void *)(v119 + 72) * v95, &qword_100024CD0);
  }
  return (uint64_t)v44;
}

uint64_t IFTelemetrySELFMapper.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor21IFTelemetrySELFMapper_logger;
  uint64_t v2 = sub_10001B880();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t IFTelemetrySELFMapper.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor21IFTelemetrySELFMapper_logger;
  uint64_t v2 = sub_10001B880();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000056F8()
{
  uint64_t v0 = swift_allocObject();
  sub_10000467C();
  sub_10001B9A0();
  sub_10001B890();
  return v0;
}

uint64_t sub_100005788()
{
  sub_10000467C();
  sub_10001B9A0();
  sub_10001B890();
  return v0;
}

size_t sub_100005808(size_t result, int64_t a2, char a3, void *a4)
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
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100004414(&qword_100024D78);
  uint64_t v10 = *(void *)(sub_100004414(&qword_100024CD0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v13);
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
  uint64_t v15 = *(void *)(sub_100004414(&qword_100024CD0) - 8);
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

uint64_t sub_1000059E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004414(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005A48()
{
  return type metadata accessor for IFTelemetrySELFMapper();
}

uint64_t type metadata accessor for IFTelemetrySELFMapper()
{
  uint64_t result = qword_100025A60;
  if (!qword_100025A60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005A9C()
{
  uint64_t result = sub_10001B880();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for IFTelemetrySELFMapper(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for IFTelemetrySELFMapper);
}

uint64_t sub_100005B44()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025D30);
  sub_100005C3C(v0, (uint64_t)qword_100025D30);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_100005BD8()
{
  if (qword_100025A70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025D30);
}

uint64_t sub_100005C3C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100005C74@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025A70 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025D30);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_100005D1C()
{
  uint64_t v0 = sub_100004414(&qword_100024D80);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v22 - v4;
  id v6 = [objc_allocWithZone((Class)IFPlatformRequestSchemaIFPlatformRequestFailed) init];
  if (!v6)
  {
    if (qword_100025A70 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10001B880();
    sub_100005C3C(v13, (uint64_t)qword_100025D30);
    sub_100003434(0xD000000000000047, 0x800000010001CC10, v14);
    return 0;
  }
  int64_t v7 = v6;
  id v8 = [objc_allocWithZone((Class)IFTSchemaIFTIntelligenceFlowError) init];
  if (!v8)
  {
    if (qword_100025A70 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_10001B880();
    sub_100005C3C(v15, (uint64_t)qword_100025D30);
    sub_100003434(0xD000000000000038, 0x800000010001CC60, v16);

    return 0;
  }
  uint64_t v9 = v8;
  sub_10001B740();
  uint64_t v10 = sub_10001B700();
  uint64_t v11 = *(void *)(v10 - 8);
  unint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v5, 1, v10) == 1)
  {
    sub_100006048((uint64_t)v5);
  }
  else
  {
    uint64_t v17 = sub_10001B6E0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
    if ((v17 & 0x100000000) == 0) {
      [v9 setCode:v17];
    }
  }
  sub_10001B740();
  if (v12(v3, 1, v10) == 1)
  {
    sub_100006048((uint64_t)v3);
  }
  else
  {
    sub_10001B6F0();
    uint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v3, v10);
    if (v19)
    {
      NSString v20 = sub_10001B8D0();
      swift_bridgeObjectRelease();
      [v9 setDomain:v20];
    }
  }
  [v7 setCriticalError:v9];

  return v7;
}

uint64_t sub_100006048(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024D80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000060A8()
{
  return v0;
}

uint64_t sub_1000060B0()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_1000060C0()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for IFPlatformRequestFailedConverter()
{
  return self;
}

uint64_t *sub_1000060F4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006158()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025D48);
  sub_100005C3C(v0, (uint64_t)qword_100025D48);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_1000061EC()
{
  if (qword_100025A78 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025D48);
}

uint64_t sub_100006250@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025A78 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025D48);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_1000062F8(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024E20);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v7 = (char *)&v19 - v6;
  sub_10001B200();
  uint64_t v8 = sub_10001B1E0();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    sub_100004A84((uint64_t)v5, &qword_100024E20);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v7, v5, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  }
  unint64_t v10 = sub_1000064FC((uint64_t)v7);
  char v12 = v11;
  sub_100004A84((uint64_t)v7, &qword_100024E20);
  if (v12) {
    return 0;
  }
  id v13 = sub_100006828(a1);
  if (!v13) {
    return 0;
  }
  uint64_t v15 = v13;
  uint64_t v16 = (void *)v14;
  uint64_t v17 = sub_100007748(v10, (uint64_t)v13, HIDWORD(v10), v14);
  sub_1000079A0(v15, v16);
  return v17;
}

uint64_t sub_1000064D8(uint64_t a1)
{
  return sub_1000064FC(a1);
}

uint64_t sub_1000064FC(uint64_t a1)
{
  sub_100004414(&qword_100024E20);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001B1E0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v23 - v9;
  sub_100007A04(a1, (uint64_t)v3, &qword_100024E20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_100004A84((uint64_t)v3, &qword_100024E20);
    if (qword_100025A78 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10001B880();
    sub_100005C3C(v11, (uint64_t)qword_100025D48);
    char v12 = sub_10001B860();
    os_log_type_t v13 = sub_10001B980();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "IntelligenceFlow.Telemetry event has no target so no request link target component", v14, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v15(v10, v3, v4);
    v15(v8, v10, v4);
    int v16 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
    if (v16 == enum case for IntelligenceFlowTarget.queryDecorationServiceHandle(_:)
      || v16 == enum case for IntelligenceFlowTarget.fullPlannerTokenGeneratorInterfaceLLMCacheManagerLookupCall(_:)
      || v16 == enum case for IntelligenceFlowTarget.fullPlannerTokenGeneratorInterfaceLLMCacheManagerInsertCall(_:)
      || v16 == enum case for IntelligenceFlowTarget.fullPlannerTokenGeneratorConstrainedDecodingInterfaceLLMCacheManagerLookupCall(_:)
      || v16 == enum case for IntelligenceFlowTarget.fullPlannerTokenGeneratorConstrainedDecodingInterfaceLLMCacheManagerInsertCall(_:)
      || v16 == enum case for IntelligenceFlowTarget.planResolverServiceHandle(_:))
    {
      return 0x2E0000002DLL;
    }
    if (v16 == enum case for IntelligenceFlowTarget.sessionCoordinatorAccept(_:)) {
      return 0x2D0000002ELL;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return 0;
}

id sub_100006828(uint64_t a1)
{
  uint64_t v128 = sub_10001B790();
  uint64_t v131 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  v130 = (char *)v116 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004414(&qword_100024EC0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v132 = (uint64_t)v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v135 = (char *)v116 - v6;
  uint64_t v7 = sub_100004414(&qword_100024E20);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v133 = (uint64_t)v116 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v116 - v10;
  uint64_t v12 = sub_100004414(&qword_100024EC8);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  v129 = (char *)v116 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  int v16 = (char *)v116 - v15;
  uint64_t v17 = sub_100004414(&qword_100024ED0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  v126 = (char *)v116 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)v116 - v20;
  uint64_t v22 = sub_100004414(&qword_100024ED8);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  v127 = (char *)v116 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  v124 = (char *)v116 - v26;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)v116 - v27;
  uint64_t v139 = sub_10001B170();
  uint64_t v29 = *(void *)(v139 - 8);
  uint64_t v30 = __chkstk_darwin(v139);
  v134 = (char *)v116 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  v125 = (char *)v116 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  v123 = (char *)v116 - v35;
  __chkstk_darwin(v34);
  uint64_t v137 = a1;
  v138 = (char *)v116 - v36;
  sub_10001B230();
  uint64_t v37 = sub_10001B220();
  uint64_t v38 = *(void *)(v37 - 8);
  v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
  if (v39(v16, 1, v37) == 1)
  {
    sub_100004A84((uint64_t)v16, &qword_100024EC8);
LABEL_5:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v28, 1, 1, v139);
LABEL_6:
    sub_100004A84((uint64_t)v28, &qword_100024ED8);
    if (qword_100025A78 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_10001B880();
    sub_100005C3C(v43, (uint64_t)qword_100025D48);
    v44 = sub_10001B860();
    os_log_type_t v45 = sub_10001B980();
    if (os_log_type_enabled(v44, v45))
    {
      unint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "IntelligenceFlow.Telemetry event has no requestEventId, can't form SELF request link message", v46, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  uint64_t v136 = v29;
  v122 = v11;
  sub_10001B210();
  v40 = *(void (**)(char *, uint64_t))(v38 + 8);
  v40(v16, v37);
  uint64_t v41 = sub_10001B2A0();
  uint64_t v42 = *(void *)(v41 - 8);
  v121 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
  if (v121(v21, 1, v41) == 1)
  {
    sub_100004A84((uint64_t)v21, &qword_100024ED0);
    uint64_t v29 = v136;
    goto LABEL_5;
  }
  uint64_t v118 = (void (*)(uint64_t, uint64_t))v40;
  sub_10001B260();
  uint64_t v117 = *(void (**)(char *, uint64_t))(v42 + 8);
  v117(v21, v41);
  uint64_t v49 = v136;
  uint64_t v50 = v139;
  uint64_t v119 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v136 + 48);
  uint64_t v120 = v136 + 48;
  if (v119(v28, 1, v139) == 1) {
    goto LABEL_6;
  }
  uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v49 + 32);
  v116[1] = v49 + 32;
  v116[0] = v51;
  v51(v138, v28, v50);
  uint64_t v52 = (uint64_t)v122;
  sub_10001B200();
  uint64_t v53 = sub_10001B1E0();
  uint64_t v54 = *(void *)(v53 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v52, 1, v53) != 1)
  {
    uint64_t v55 = v133;
    sub_100007A04((uint64_t)v122, v133, &qword_100024E20);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v54 + 88))(v55, v53) == enum case for IntelligenceFlowTarget.sessionCoordinatorAccept(_:))
    {
      uint64_t v56 = (uint64_t)v129;
      sub_10001B230();
      if (v39((char *)v56, 1, v37) == 1)
      {
        sub_100004A84(v56, &qword_100024EC8);
        uint64_t v57 = (uint64_t)v122;
        unint64_t v59 = v138;
        uint64_t v58 = v139;
LABEL_45:
        if (qword_100025A78 != -1) {
          swift_once();
        }
        uint64_t v106 = sub_10001B880();
        sub_100005C3C(v106, (uint64_t)qword_100025D48);
        v107 = sub_10001B860();
        os_log_type_t v108 = sub_10001B990();
        if (os_log_type_enabled(v107, v108))
        {
          v109 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v109 = 0;
          _os_log_impl((void *)&_mh_execute_header, v107, v108, "IntelligenceFlow.Telemetry event has no clientRequestId, can't form SELF request link message", v109, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v136 + 8))(v59, v58);
        goto LABEL_50;
      }
      uint64_t v93 = (uint64_t)v126;
      sub_10001B210();
      v118(v56, v37);
      unsigned int v94 = v121((char *)v93, 1, v41);
      unint64_t v59 = v138;
      uint64_t v58 = v139;
      if (v94 == 1)
      {
        sub_100004A84(v93, &qword_100024ED0);
LABEL_44:
        uint64_t v57 = (uint64_t)v122;
        goto LABEL_45;
      }
      uint64_t v100 = sub_10001B270();
      unint64_t v102 = v101;
      v117((char *)v93, v41);
      uint64_t v103 = HIBYTE(v102) & 0xF;
      if ((v102 & 0x2000000000000000) == 0) {
        uint64_t v103 = v100 & 0xFFFFFFFFFFFFLL;
      }
      if (!v103)
      {
        swift_bridgeObjectRelease();
        goto LABEL_44;
      }
      uint64_t v104 = (uint64_t)v124;
      sub_10001B140();
      swift_bridgeObjectRelease();
      unsigned int v105 = v119((char *)v104, 1, v58);
      uint64_t v57 = (uint64_t)v122;
      if (v105 == 1)
      {
        sub_100004A84(v104, &qword_100024ED8);
        goto LABEL_45;
      }
      v110 = v123;
      ((void (*)(char *, uint64_t, uint64_t))v116[0])(v123, v104, v58);
      id v111 = objc_allocWithZone((Class)SISchemaUUID);
      Class isa = sub_10001B150().super.isa;
      id v47 = [v111 initWithNSUUID:isa];

      id v113 = objc_allocWithZone((Class)SISchemaUUID);
      Class v114 = sub_10001B150().super.isa;
      [v113 initWithNSUUID:v114];

      uint64_t v115 = *(void (**)(char *, uint64_t))(v136 + 8);
      v115(v110, v58);
      v115(v59, v58);
LABEL_37:
      sub_100004A84(v57, &qword_100024E20);
      return v47;
    }
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v55, v53);
  }
  id v60 = objc_allocWithZone((Class)SISchemaUUID);
  uint64_t v61 = v138;
  Class v62 = sub_10001B150().super.isa;
  id v47 = [v60 initWithNSUUID:v62];

  uint64_t v63 = (uint64_t)v135;
  sub_10001B250();
  uint64_t v64 = sub_10001B240();
  uint64_t v65 = *(void *)(v64 - 8);
  int v66 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48))(v63, 1, v64);
  uint64_t v57 = (uint64_t)v122;
  if (v66 == 1) {
    goto LABEL_28;
  }
  uint64_t v67 = v132;
  sub_100007A04(v63, v132, &qword_100024EC0);
  int v68 = (*(uint64_t (**)(uint64_t, uint64_t))(v65 + 88))(v67, v64);
  uint64_t v69 = v139;
  if (v68 != enum case for IntelligenceFlowTelemetry.Objective.pnr(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v67, v64);
LABEL_28:
    uint64_t v84 = v134;
    sub_10001B160();
    id v85 = objc_allocWithZone((Class)SISchemaUUID);
    Class v86 = sub_10001B150().super.isa;
    id v87 = [v85 initWithNSUUID:v86];

    unint64_t v88 = *(void (**)(char *, uint64_t))(v136 + 8);
    v88(v84, v139);
    if (qword_100025A78 != -1) {
      swift_once();
    }
    uint64_t v89 = sub_10001B880();
    sub_100005C3C(v89, (uint64_t)qword_100025D48);
    id v90 = sub_10001B860();
    os_log_type_t v91 = sub_10001B990();
    if (os_log_type_enabled(v90, v91))
    {
      uint64_t v92 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v92 = 0;
      _os_log_impl((void *)&_mh_execute_header, v90, v91, "errorMessage", v92, 2u);
      swift_slowDealloc();
    }

    v88(v61, v139);
    goto LABEL_33;
  }
  (*(void (**)(uint64_t, uint64_t))(v65 + 96))(v67, v64);
  uint64_t v70 = v131;
  uint64_t v71 = v67;
  v72 = v130;
  uint64_t v73 = v128;
  (*(void (**)(char *, uint64_t, uint64_t))(v131 + 32))(v130, v71, v128);
  uint64_t v74 = (uint64_t)v127;
  sub_10001B770();
  uint64_t v75 = v74;
  if (v119((char *)v74, 1, v69) != 1)
  {
    unint64_t v95 = v125;
    ((void (*)(char *, uint64_t, uint64_t))v116[0])(v125, v75, v69);
    uint64_t v96 = v70;
    id v97 = objc_allocWithZone((Class)SISchemaUUID);
    Class v98 = sub_10001B150().super.isa;
    [v97 initWithNSUUID:v98];

    uint64_t v99 = *(void (**)(char *, uint64_t))(v136 + 8);
    v99(v95, v69);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v72, v73);
    v99(v138, v69);
    sub_100004A84(v63, &qword_100024EC0);
    uint64_t v57 = (uint64_t)v122;
    goto LABEL_37;
  }
  uint64_t v76 = v73;
  sub_100004A84(v74, &qword_100024ED8);
  uint64_t v57 = (uint64_t)v122;
  if (qword_100025A78 != -1) {
    swift_once();
  }
  uint64_t v77 = sub_10001B880();
  sub_100005C3C(v77, (uint64_t)qword_100025D48);
  uint64_t v78 = sub_10001B860();
  os_log_type_t v79 = sub_10001B980();
  BOOL v80 = os_log_type_enabled(v78, v79);
  uint64_t v81 = v130;
  v82 = v138;
  if (v80)
  {
    uint64_t v83 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v83 = 0;
    _os_log_impl((void *)&_mh_execute_header, v78, v79, "IntelligenceFlow.Telemetry event has no contextId, can't form SELF request link message", v83, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v131 + 8))(v81, v76);
  (*(void (**)(char *, uint64_t))(v136 + 8))(v82, v69);
LABEL_33:
  sub_100004A84(v63, &qword_100024EC0);
LABEL_50:
  sub_100004A84(v57, &qword_100024E20);
  return 0;
}

void *sub_100007748(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = [objc_allocWithZone((Class)SISchemaRequestLink) init];
  if (!v8)
  {
    if (qword_100025A78 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_10001B880();
    sub_100005C3C(v14, (uint64_t)qword_100025D48);
    sub_100003434(0xD00000000000002ELL, 0x800000010001CD20, v15);
    return 0;
  }
  uint64_t v9 = v8;
  id v10 = [objc_allocWithZone((Class)SISchemaRequestLinkInfo) init];
  if (!v10)
  {
    if (qword_100025A78 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_10001B880();
    sub_100005C3C(v16, (uint64_t)qword_100025D48);
    sub_100003434(0xD00000000000002ELL, 0x800000010001CD20, v17);
    goto LABEL_14;
  }
  uint64_t v11 = v10;
  id v12 = [objc_allocWithZone((Class)SISchemaRequestLinkInfo) init];
  if (!v12)
  {
    if (qword_100025A78 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_10001B880();
    sub_100005C3C(v18, (uint64_t)qword_100025D48);
    sub_100003434(0xD00000000000002ELL, 0x800000010001CD20, v19);

LABEL_14:
    return 0;
  }
  uint64_t v13 = v12;
  [v11 setComponent:a1];
  [v11 setUuid:a2];
  [v13 setComponent:a3];
  [v13 setUuid:a4];
  [v9 setSource:v11];
  [v9 setTarget:v13];

  return v9;
}

void sub_1000079A0(void *a1, void *a2)
{
  if (a1)
  {
  }
}

uint64_t type metadata accessor for IFRequestLinkConverter()
{
  return self;
}

uint64_t sub_100007A04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004414(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007A68()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025D60);
  sub_100005C3C(v0, (uint64_t)qword_100025D60);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_100007AFC()
{
  if (qword_100025A80 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025D60);
}

uint64_t sub_100007B60@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025A80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025D60);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

id sub_100007C08(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024ED8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v60 = (char *)&v54 - v6;
  uint64_t v7 = sub_10001B170();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v54 - v12;
  uint64_t v14 = sub_100004414(&qword_100024EC8);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v54 - v18;
  uint64_t v20 = sub_100004414(&qword_100024ED0);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v23 = (char *)&v54 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v54 - v24;
  id v26 = [objc_allocWithZone((Class)IFPlatformRequestSchemaIFPlatformRequestInvoked) init];
  if (v26)
  {
    uint64_t v58 = v13;
    unint64_t v59 = v11;
    Class v62 = v5;
    id v63 = v26;
    uint64_t v61 = a1;
    sub_10000833C(a1, (uint64_t)v19);
    uint64_t v27 = sub_10001B220();
    uint64_t v28 = *(void *)(v27 - 8);
    uint64_t v29 = *(unsigned int (**)(void, void, void))(v28 + 48);
    if (v29(v19, 1, v27) == 1)
    {
      sub_100004A84((uint64_t)v19, &qword_100024EC8);
    }
    else
    {
      uint64_t v56 = v7;
      uint64_t v57 = v29;
      sub_10001B210();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v27);
      uint64_t v33 = sub_10001B2A0();
      uint64_t v34 = *(void *)(v33 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v25, 1, v33) == 1)
      {
        sub_100004A84((uint64_t)v25, &qword_100024ED0);
        uint64_t v7 = v56;
      }
      else
      {
        uint64_t v55 = v8;
        uint64_t v35 = sub_10001B270();
        unint64_t v37 = v36;
        (*(void (**)(char *, uint64_t))(v34 + 8))(v25, v33);
        uint64_t v38 = HIBYTE(v37) & 0xF;
        if ((v37 & 0x2000000000000000) == 0) {
          uint64_t v38 = v35 & 0xFFFFFFFFFFFFLL;
        }
        if (v38)
        {
          uint64_t v39 = (uint64_t)v60;
          sub_10001B140();
          swift_bridgeObjectRelease();
          uint64_t v8 = v55;
          uint64_t v7 = v56;
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v39, 1, v56) == 1)
          {
            sub_100004A84(v39, &qword_100024ED8);
          }
          else
          {
            v40 = v58;
            (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v58, v39, v7);
            id v41 = objc_allocWithZone((Class)SISchemaUUID);
            Class isa = sub_10001B150().super.isa;
            id v43 = [v41 initWithNSUUID:isa];

            [v63 setClientTraceId:v43];
            (*(void (**)(char *, uint64_t))(v8 + 8))(v40, v7);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v8 = v55;
          uint64_t v7 = v56;
        }
      }
      uint64_t v29 = v57;
    }
    sub_10000833C(v61, (uint64_t)v17);
    if (v29(v17, 1, v27) == 1)
    {
      sub_100004A84((uint64_t)v17, &qword_100024EC8);
      uint64_t v44 = (uint64_t)v62;
      id v32 = v63;
    }
    else
    {
      uint64_t v45 = v8;
      sub_10001B210();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v27);
      uint64_t v46 = sub_10001B2A0();
      uint64_t v47 = *(void *)(v46 - 8);
      int v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48))(v23, 1, v46);
      id v32 = v63;
      if (v48 != 1)
      {
        uint64_t v44 = (uint64_t)v62;
        sub_10001B290();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v23, v46);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v45 + 56))(v44, 0, 1, v7);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v44, 1, v7) != 1)
        {
          uint64_t v50 = v59;
          (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v59, v44, v7);
          id v51 = objc_allocWithZone((Class)SISchemaUUID);
          Class v52 = sub_10001B150().super.isa;
          id v53 = [v51 initWithNSUUID:v52];

          [v32 setIfSessionId:v53];
          (*(void (**)(char *, uint64_t))(v45 + 8))(v50, v7);
          return v32;
        }
        goto LABEL_22;
      }
      sub_100004A84((uint64_t)v23, &qword_100024ED0);
      uint64_t v8 = v45;
      uint64_t v44 = (uint64_t)v62;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v44, 1, 1, v7);
LABEL_22:
    sub_100004A84(v44, &qword_100024ED8);
    return v32;
  }
  if (qword_100025A80 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_10001B880();
  sub_100005C3C(v30, (uint64_t)qword_100025D60);
  sub_100003434(0xD00000000000003ALL, 0x800000010001CD50, v31);
  return 0;
}

uint64_t sub_10000833C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004414(&qword_100024EC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for IFPlatformRequestInvokedConverter()
{
  return self;
}

uint64_t sub_1000083C8()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025D78);
  sub_100005C3C(v0, (uint64_t)qword_100025D78);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_10000845C()
{
  if (qword_100025A88 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025D78);
}

uint64_t sub_1000084C0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025A88 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025D78);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_100008568(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024E20);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B1E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v31 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v31 - v13;
  sub_100008B6C(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100008BD4((uint64_t)v4);
    if (qword_100025A88 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_10001B880();
    sub_100005C3C(v15, (uint64_t)qword_100025D78);
    uint64_t v16 = sub_10001B860();
    os_log_type_t v17 = sub_10001B980();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "IntelligenceFlow.Telemetry event has no target so no request event target", v18, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v14, v4, v5);
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v21(v12, v14, v5);
    int v22 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v12, v5);
    if (v22 == enum case for IntelligenceFlowTarget.standardPlannerMakePlan(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 1;
      goto LABEL_22;
    }
    if (v22 == enum case for IntelligenceFlowTarget.standardPlannerSetup(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 2;
      goto LABEL_22;
    }
    if (v22 == enum case for IntelligenceFlowTarget.queryDecorationServiceSetup(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 101;
      goto LABEL_22;
    }
    if (v22 == enum case for IntelligenceFlowTarget.planOverridesServiceSetup(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 201;
      goto LABEL_22;
    }
    if (v22 == enum case for IntelligenceFlowTarget.fullPlannerServiceSetup(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 301;
      goto LABEL_22;
    }
    if (v22 == enum case for IntelligenceFlowTarget.planResolverServiceSetup(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 401;
      goto LABEL_22;
    }
    if (v22 == enum case for IntelligenceFlowTarget.responseGenerationServiceSetup(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 501;
      goto LABEL_22;
    }
    if (qword_100025A88 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_10001B880();
    sub_100005C3C(v24, (uint64_t)qword_100025D78);
    v21(v9, v14, v5);
    uint64_t v25 = sub_10001B860();
    os_log_type_t v26 = sub_10001B980();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v34 = v32;
      *(_DWORD *)uint64_t v27 = 136315138;
      uint64_t v31 = v27 + 4;
      sub_100008C34();
      uint64_t v28 = sub_10001BAE0();
      uint64_t v33 = sub_100003B08(v28, v29, &v34);
      sub_10001B9C0();
      swift_bridgeObjectRelease();
      uint64_t v30 = *(void (**)(char *, uint64_t))(v6 + 8);
      v30(v9, v5);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Unrecognized IntelligenceFlow.Telemetry target %s so no request event target", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v30 = *(void (**)(char *, uint64_t))(v6 + 8);
      v30(v9, v5);
    }
    v30(v14, v5);
    v30(v12, v5);
  }
  uint64_t v19 = 0;
  unsigned __int8 v20 = 1;
LABEL_22:
  LOBYTE(v34) = v20;
  return v19 | ((unint64_t)v20 << 32);
}

uint64_t sub_100008B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004414(&qword_100024E20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008BD4(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024E20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100008C34()
{
  unint64_t result = qword_100024F78;
  if (!qword_100024F78)
  {
    sub_10001B1E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100024F78);
  }
  return result;
}

uint64_t type metadata accessor for IFPlatformTargetConverter()
{
  return self;
}

uint64_t sub_100008CB0()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025D90);
  sub_100005C3C(v0, (uint64_t)qword_100025D90);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_100008D44()
{
  if (qword_100025A90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025D90);
}

uint64_t sub_100008DA8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025A90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025D90);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_100008E50(uint64_t a1, uint64_t a2)
{
  uint64_t v56 = a2;
  uint64_t v2 = sub_10001B750();
  uint64_t v52 = *(void *)(v2 - 8);
  uint64_t v53 = v2;
  __chkstk_darwin(v2);
  id v51 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001B730();
  uint64_t v55 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004414(&qword_100025018);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v51 - v11;
  uint64_t v13 = sub_100004414(&qword_100024ED8);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10001B170();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v20 = [objc_allocWithZone((Class)IFPlatformRequestSchemaIFPlatformRequestContext) init];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v54 = v10;
    sub_10001B770();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
    {
      sub_100004A84((uint64_t)v15, &qword_100024ED8);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
      id v24 = objc_allocWithZone((Class)SISchemaUUID);
      Class isa = sub_10001B150().super.isa;
      id v26 = [v24 initWithNSUUID:isa];

      [v21 setTraceId:v26];
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    }
    uint64_t v27 = (uint64_t)v12;
    sub_10001B780();
    uint64_t v28 = sub_10001B760();
    uint64_t v29 = *(void *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v12, 1, v28) == 1) {
      goto LABEL_10;
    }
    uint64_t v34 = (uint64_t)v54;
    sub_1000096A8((uint64_t)v12, (uint64_t)v54);
    int v35 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 88))(v34, v28);
    if (v35 != enum case for IntelligenceFlowPlatformPnR.StateInfo.started(_:))
    {
      if (v35 == enum case for IntelligenceFlowPlatformPnR.StateInfo.ended(_:))
      {
        (*(void (**)(uint64_t, uint64_t))(v29 + 96))(v34, v28);
        uint64_t v38 = v55;
        (*(void (**)(char *, uint64_t, uint64_t))(v55 + 32))(v6, v34, v4);
        type metadata accessor for IFPlatformRequestEndedConverter();
        uint64_t v39 = sub_1000098D8();
        [v21 setEnded:v39];

        (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v4);
      }
      else
      {
        if (v35 != enum case for IntelligenceFlowPlatformPnR.StateInfo.failed(_:))
        {
          (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v34, v28);
LABEL_10:
          if (qword_100025A90 != -1) {
            swift_once();
          }
          uint64_t v30 = sub_10001B880();
          sub_100005C3C(v30, (uint64_t)qword_100025D90);
          uint64_t v31 = sub_10001B860();
          os_log_type_t v32 = sub_10001B990();
          if (os_log_type_enabled(v31, v32))
          {
            uint64_t v33 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v33 = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, v32, "failed parsing pnr.stateInfo", v33, 2u);
            swift_slowDealloc();
          }

          goto LABEL_32;
        }
        (*(void (**)(uint64_t, uint64_t))(v29 + 96))(v34, v28);
        id v41 = v51;
        uint64_t v40 = v52;
        uint64_t v42 = v53;
        (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v51, v34, v53);
        type metadata accessor for IFPlatformRequestFailedConverter();
        id v43 = sub_100005D1C();
        [v21 setFailed:v43];

        (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v42);
      }
LABEL_32:
      sub_100004A84(v27, &qword_100025018);
      return v21;
    }
    id v36 = [objc_allocWithZone((Class)IFPlatformRequestSchemaIFPlatformRequestStarted) init];
    if (v36)
    {
      unint64_t v37 = v36;
      if ((v56 & 0x100000000) != 0)
      {
        if (qword_100025A90 != -1) {
          swift_once();
        }
        uint64_t v46 = sub_10001B880();
        sub_100005C3C(v46, (uint64_t)qword_100025D90);
        uint64_t v47 = sub_10001B860();
        os_log_type_t v48 = sub_10001B990();
        if (os_log_type_enabled(v47, v48))
        {
          uint64_t v49 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v49 = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "target is nil, not setting", v49, 2u);
          swift_slowDealloc();
        }

        uint64_t v34 = (uint64_t)v54;
      }
      else
      {
        objc_msgSend(v36, "setIfPlatformRequestTarget:");
      }
      [v21 setStartedOrChanged:v37];

      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v34, v28);
      goto LABEL_32;
    }
    if (qword_100025A90 != -1) {
      swift_once();
    }
    uint64_t v44 = sub_10001B880();
    sub_100005C3C(v44, (uint64_t)qword_100025D90);
    sub_100003434(0xD000000000000048, 0x800000010001CE70, v45);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v54, v28);
    sub_100004A84((uint64_t)v12, &qword_100025018);
  }
  else
  {
    if (qword_100025A90 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_10001B880();
    sub_100005C3C(v22, (uint64_t)qword_100025D90);
    sub_100003434(0xD000000000000040, 0x800000010001CE20, v23);
  }
  return 0;
}

uint64_t sub_1000096A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004414(&qword_100025018);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for IFPlatformRequestContextConverter()
{
  return self;
}

uint64_t sub_100009734()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025DA8);
  sub_100005C3C(v0, (uint64_t)qword_100025DA8);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_1000097CC()
{
  if (qword_100025A98 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025DA8);
}

uint64_t sub_100009830@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025A98 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025DA8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_1000098D8()
{
  uint64_t v0 = sub_100004414(&qword_100024D80);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v22 - v4;
  id v6 = [objc_allocWithZone((Class)IFPlatformRequestSchemaIFPlatformRequestEnded) init];
  if (!v6)
  {
    if (qword_100025A98 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10001B880();
    sub_100005C3C(v13, (uint64_t)qword_100025DA8);
    sub_100003434(0xD000000000000046, 0x800000010001CF10, v14);
    return 0;
  }
  uint64_t v7 = v6;
  id v8 = [objc_allocWithZone((Class)IFTSchemaIFTIntelligenceFlowError) init];
  if (!v8)
  {
    if (qword_100025A98 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_10001B880();
    sub_100005C3C(v15, (uint64_t)qword_100025DA8);
    sub_100003434(0xD000000000000038, 0x800000010001CC60, v16);

    return 0;
  }
  uint64_t v9 = v8;
  sub_10001B720();
  uint64_t v10 = sub_10001B700();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v5, 1, v10) == 1)
  {
    sub_100006048((uint64_t)v5);
  }
  else
  {
    uint64_t v17 = sub_10001B6E0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
    if ((v17 & 0x100000000) == 0) {
      [v9 setCode:v17];
    }
  }
  sub_10001B720();
  if (v12(v3, 1, v10) == 1)
  {
    sub_100006048((uint64_t)v3);
  }
  else
  {
    sub_10001B6F0();
    uint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v3, v10);
    if (v19)
    {
      NSString v20 = sub_10001B8D0();
      swift_bridgeObjectRelease();
      [v9 setDomain:v20];
    }
  }
  [v7 setHandledError:v9];

  return v7;
}

uint64_t type metadata accessor for IFPlatformRequestEndedConverter()
{
  return self;
}

uint64_t sub_100009C28()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025AA8);
  sub_100005C3C(v0, (uint64_t)qword_100025AA8);
  return sub_10001B870();
}

unint64_t sub_100009CA8()
{
  return 0xD000000000000021;
}

void sub_100009CC4()
{
  if (qword_100025AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();
  sub_100005C3C(v0, (uint64_t)qword_100025AA8);
  oslog = sub_10001B860();
  os_log_type_t v1 = sub_10001B980();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "IFTelemetrySELFIngestor Initializing", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100009DAC(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100025158 + dword_100025158);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10000B7C0;
  return v5(a1);
}

uint64_t sub_100009E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v43 = a3;
  uint64_t v6 = sub_100004414(&qword_100024CC8);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004414(&qword_100025188);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v45 = (uint64_t)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v37 - v12;
  uint64_t result = sub_100004AE0(a2);
  if (result)
  {
    uint64_t v16 = result;
    unint64_t v17 = 0;
    unint64_t v18 = *(void *)(result + 16);
    *(void *)&long long v15 = 136315138;
    long long v38 = v15;
    v37[1] = (char *)&type metadata for Any + 8;
    id v41 = v13;
    unint64_t v42 = v18;
    uint64_t v40 = result;
    while (1)
    {
      if (v17 == v18)
      {
        uint64_t v19 = sub_100004414(&qword_100024CD0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v45, 1, 1, v19);
        unint64_t v44 = v18;
      }
      else
      {
        if (v17 >= *(void *)(v16 + 16))
        {
          __break(1u);
          return result;
        }
        uint64_t v20 = sub_100004414(&qword_100024CD0);
        uint64_t v21 = *(void *)(v20 - 8);
        uint64_t v22 = v45;
        sub_10000B5EC(v16+ ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80))+ *(void *)(v21 + 72) * v17, v45);
        unint64_t v44 = v17 + 1;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(v22, 0, 1, v20);
        unint64_t v18 = v42;
      }
      sub_1000059E4(v45, (uint64_t)v13, &qword_100025188);
      uint64_t v23 = sub_100004414(&qword_100024CD0);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 48))(v13, 1, v23) == 1) {
        return swift_bridgeObjectRelease();
      }
      id v24 = *(void **)&v13[*(int *)(v23 + 48)];
      sub_1000059E4((uint64_t)v13, (uint64_t)v8, &qword_100024CC8);
      sub_10001B180();
      if (v4)
      {
        swift_errorRelease();
        uint64_t v4 = 0;
      }
      if (qword_100025AA0 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_10001B880();
      sub_100005C3C(v25, (uint64_t)qword_100025AA8);
      id v26 = v24;
      uint64_t v27 = sub_10001B860();
      os_log_type_t v28 = sub_10001B980();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        uint64_t v46 = v39;
        *(_DWORD *)uint64_t v29 = v38;
        id v30 = [v26 qualifiedMessageName];
        uint64_t v31 = v8;
        uint64_t v32 = v4;
        uint64_t v33 = sub_10001B8E0();
        unint64_t v35 = v34;

        uint64_t v36 = v33;
        uint64_t v4 = v32;
        id v8 = v31;
        *(void *)(v29 + 4) = sub_100003B08(v36, v35, &v46);

        unint64_t v18 = v42;
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "IFTelemetry message is appended %s to SELF staging pool", (uint8_t *)v29, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      uint64_t result = sub_10000B654((uint64_t)v8);
      uint64_t v16 = v40;
      uint64_t v13 = v41;
      unint64_t v17 = v44;
    }
  }
  return result;
}

uint64_t sub_10000A2D8()
{
  return sub_10001B1D0();
}

uint64_t sub_10000A314(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100025158 + dword_100025158);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10000A3BC;
  return v5(a1);
}

uint64_t sub_10000A3BC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000A4B0(uint64_t a1)
{
  unint64_t v2 = sub_10000B114();

  return IngestionExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

char *sub_10000A558(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100004414(&qword_100025190);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000B6B4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A668(uint64_t a1)
{
  v1[7] = a1;
  uint64_t v2 = sub_10001B190();
  v1[8] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[9] = v3;
  v1[10] = *(void *)(v3 + 64);
  v1[11] = swift_task_alloc();
  uint64_t v4 = sub_10001B130();
  v1[12] = v4;
  v1[13] = *(void *)(v4 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  return _swift_task_switch(sub_10000A7C0, 0, 0);
}

uint64_t sub_10000A7C0()
{
  id v41 = v0;
  type metadata accessor for IFDefaultsLib();
  v0[19] = IFDefaultsLib.__allocating_init(domain:)();
  sub_100004414(&qword_100025178);
  uint64_t v1 = sub_10001B710();
  uint64_t v39 = IFBiomeLib.__allocating_init(stream:)(v1);
  v0[20] = v39;
  type metadata accessor for IFTelemetrySELFMapper();
  uint64_t v38 = sub_1000056F8();
  v0[21] = v38;
  if (qword_100025AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  sub_100005C3C(v2, (uint64_t)qword_100025AA8);
  uint64_t v3 = sub_10001B860();
  os_log_type_t v4 = sub_10001B980();
  if (os_log_type_enabled(v3, v4))
  {
    char v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Begin ingesting", v5, 2u);
    swift_slowDealloc();
  }
  uint64_t v7 = v0[17];
  uint64_t v6 = v0[18];
  uint64_t v9 = v0[15];
  uint64_t v8 = v0[16];
  uint64_t v10 = v0[12];
  uint64_t v11 = v0[13];

  IFDefaultsLib.lastCollectionDate.getter(v6);
  sub_10001B120();
  uint64_t v12 = swift_allocObject();
  v0[22] = v12;
  uint64_t v37 = v12;
  *(void *)(v12 + 16) = _swiftEmptyArrayStorage;
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  v0[23] = v13;
  v0[24] = (v11 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v13(v8, v6, v10);
  v13(v9, v7, v10);
  uint64_t v14 = sub_10001B860();
  os_log_type_t v15 = sub_10001B980();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v18 = v0[15];
  uint64_t v17 = v0[16];
  uint64_t v20 = v0[12];
  uint64_t v19 = v0[13];
  if (v16)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315394;
    sub_10000B594();
    uint64_t v22 = sub_10001BAE0();
    v0[5] = sub_100003B08(v22, v23, &v40);
    sub_10001B9C0();
    swift_bridgeObjectRelease();
    id v24 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v24(v17, v20);
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v25 = sub_10001BAE0();
    v0[6] = sub_100003B08(v25, v26, &v40);
    sub_10001B9C0();
    swift_bridgeObjectRelease();
    v24(v18, v20);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Fetch range: %s, %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    id v24 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v24(v0[16], v0[12]);
    v24(v18, v20);
  }
  v0[25] = v24;
  uint64_t v27 = v0[11];
  uint64_t v28 = v0[8];
  uint64_t v29 = v0[9];
  (*(void (**)(uint64_t, void, uint64_t))(v29 + 16))(v27, v0[7], v28);
  unint64_t v30 = (*(unsigned __int8 *)(v29 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v31 = swift_allocObject();
  v0[26] = v31;
  *(void *)(v31 + 16) = v38;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v29 + 32))(v31 + v30, v27, v28);
  type = (uint64_t (*)(uint64_t, uint64_t, void (*)(uint64_t), uint64_t, void (*)(uint64_t), uint64_t))(*(void *)(*(void *)v39 + 144) + **(int **)(*(void *)v39 + 144));
  swift_retain();
  swift_retain();
  uint64_t v32 = (void *)swift_task_alloc();
  v0[27] = v32;
  *uint64_t v32 = v0;
  v32[1] = sub_10000AD10;
  uint64_t v33 = v0[17];
  uint64_t v34 = v0[18];
  return type(v34, v33, sub_10000B1B0, v37, sub_10000B4F4, v31);
}

uint64_t sub_10000AD10()
{
  swift_task_dealloc();
  swift_release();
  swift_release();
  return _swift_task_switch(sub_10000AE44, 0, 0);
}

uint64_t sub_10000AE44()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_beginAccess();
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
  if (*(void *)(*(void *)(v1 + 16) + 16))
  {
    uint64_t v3 = *(void *)(v0 + 144);
    uint64_t v4 = *(void *)(v0 + 136);
    uint64_t v5 = *(void *)(v0 + 96);
    swift_errorRetain();
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
    v2(v4, v5);
    v2(v3, v5);
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 136);
    uint64_t v7 = *(void *)(v0 + 144);
    uint64_t v9 = *(void *)(v0 + 112);
    uint64_t v10 = *(void *)(v0 + 96);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 184))(v9, v8, v10);
    IFDefaultsLib.lastCollectionDate.setter(v9);
    swift_release();
    swift_release();
    swift_release();
    v2(v8, v10);
    v2(v7, v10);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

unint64_t sub_10000B068()
{
  unint64_t result = qword_100025160;
  if (!qword_100025160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025160);
  }
  return result;
}

uint64_t sub_10000B0C0()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_10000B114()
{
  unint64_t result = qword_100025170;
  if (!qword_100025170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025170);
  }
  return result;
}

ValueMetadata *type metadata accessor for IFTelemetrySELFIngestorExtension()
{
  return &type metadata for IFTelemetrySELFIngestorExtension;
}

uint64_t sub_10000B178()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000B1B0(uint64_t a1)
{
  if (a1)
  {
    swift_errorRetain();
    if (qword_100025AA0 != -1) {
      swift_once();
    }
    uint64_t v3 = (char **)(v1 + 16);
    uint64_t v4 = sub_10001B880();
    sub_100005C3C(v4, (uint64_t)qword_100025AA8);
    uint64_t v5 = sub_10001B860();
    os_log_type_t v6 = sub_10001B990();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Error, loadBiomeEvent failed", v7, 2u);
      swift_slowDealloc();
    }

    swift_beginAccess();
    uint64_t v8 = *v3;
    swift_errorRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    NSObject *v3 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v8 = sub_10000A558(0, *((void *)v8 + 2) + 1, 1, v8);
      NSObject *v3 = v8;
    }
    unint64_t v11 = *((void *)v8 + 2);
    unint64_t v10 = *((void *)v8 + 3);
    if (v11 >= v10 >> 1)
    {
      uint64_t v8 = sub_10000A558((char *)(v10 > 1), v11 + 1, 1, v8);
      NSObject *v3 = v8;
    }
    *((void *)v8 + 2) = v11 + 1;
    *(void *)&v8[8 * v11 + 32] = a1;
    swift_endAccess();
    swift_errorRelease();
  }
  else
  {
    if (qword_100025AA0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10001B880();
    sub_100005C3C(v12, (uint64_t)qword_100025AA8);
    oslog = sub_10001B860();
    os_log_type_t v13 = sub_10001B980();
    if (os_log_type_enabled(oslog, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Ingest completed.", v14, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_10000B428()
{
  uint64_t v1 = sub_10001B190();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_10000B4F4(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_10001B190() - 8);
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  sub_100009E54(v4, a1, v5);
}

unint64_t sub_10000B594()
{
  unint64_t result = qword_100025180;
  if (!qword_100025180)
  {
    sub_10001B130();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025180);
  }
  return result;
}

uint64_t sub_10000B5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004414(&qword_100024CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B654(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024CC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B6B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_100004414(&qword_100025198);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_10001BAC0();
  __break(1u);
  return result;
}

uint64_t sub_10000B7C4()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025DC0);
  sub_100005C3C(v0, (uint64_t)qword_100025DC0);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_10000B858()
{
  if (qword_100025BC0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025DC0);
}

uint64_t sub_10000B8BC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025BC0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025DC0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_10000B964()
{
  uint64_t v0 = sub_10001B750();
  uint64_t v69 = *(void *)(v0 - 8);
  uint64_t v70 = v0;
  __chkstk_darwin(v0);
  int v68 = (char *)&v66 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_10001B730();
  uint64_t v72 = *(void *)(v2 - 8);
  uint64_t v73 = v2;
  __chkstk_darwin(v2);
  uint64_t v71 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004414(&qword_100025018);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v75 = (uint64_t)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  os_log_type_t v79 = (char *)&v66 - v7;
  uint64_t v8 = sub_100004414(&qword_100024ED8);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001B170();
  uint64_t v74 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  os_log_type_t v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004414(&qword_100024EC0);
  __chkstk_darwin(v14 - 8);
  BOOL v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10001B790();
  uint64_t v77 = *(void *)(v17 - 8);
  uint64_t v78 = v17;
  __chkstk_darwin(v17);
  uint64_t v76 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100004414(&qword_100024EC8);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100004414(&qword_100024E20);
  __chkstk_darwin(v22 - 8);
  id v24 = (char *)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IFPlatformTargetConverter();
  sub_10001B200();
  unint64_t v25 = sub_100008568((uint64_t)v24);
  sub_100004A84((uint64_t)v24, &qword_100024E20);
  unint64_t v26 = 0;
  if ((v25 & 0x100000000) == 0)
  {
    id v27 = [objc_allocWithZone((Class)IFPlatformSchemaIFPlatformClientEvent) init];
    if (v27)
    {
      unint64_t v26 = v27;
      id v28 = [objc_allocWithZone((Class)IFPlatformSchemaIFPlatformTargetContext) init];
      if (v28)
      {
        id v67 = v28;
        type metadata accessor for IFPlatformClientEventMetadataConverter();
        sub_10001B230();
        id v29 = sub_100014CDC((uint64_t)v21);
        sub_100004A84((uint64_t)v21, &qword_100024EC8);
        [v26 setEventMetadata:v29];

        sub_10001B250();
        uint64_t v30 = sub_10001B240();
        uint64_t v31 = *(void *)(v30 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v16, 1, v30) == 1)
        {

          sub_100004A84((uint64_t)v16, &qword_100024EC0);
          return v26;
        }
        if ((*(unsigned int (**)(char *, uint64_t))(v31 + 88))(v16, v30) != enum case for IntelligenceFlowTelemetry.Objective.pnr(_:))
        {

          (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v30);
          return v26;
        }
        (*(void (**)(char *, uint64_t))(v31 + 96))(v16, v30);
        uint64_t v38 = v76;
        uint64_t v37 = v77;
        uint64_t v39 = v78;
        (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v76, v16, v78);
        sub_10001B770();
        uint64_t v40 = v74;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v74 + 48))(v10, 1, v11) == 1)
        {
          sub_100004A84((uint64_t)v10, &qword_100024ED8);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v13, v10, v11);
          id v41 = objc_allocWithZone((Class)SISchemaUUID);
          Class isa = sub_10001B150().super.isa;
          id v43 = [v41 initWithNSUUID:isa];

          [v67 setTraceId:v43];
          (*(void (**)(char *, uint64_t))(v40 + 8))(v13, v11);
        }
        uint64_t v44 = (uint64_t)v79;
        sub_10001B780();
        uint64_t v45 = sub_10001B760();
        uint64_t v46 = *(void *)(v45 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45) == 1) {
          goto LABEL_20;
        }
        uint64_t v52 = v75;
        sub_1000096A8(v44, v75);
        int v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 88))(v52, v45);
        if (v53 != enum case for IntelligenceFlowPlatformPnR.StateInfo.started(_:))
        {
          if (v53 == enum case for IntelligenceFlowPlatformPnR.StateInfo.ended(_:))
          {
            uint64_t v57 = v75;
            (*(void (**)(uint64_t, uint64_t))(v46 + 96))(v75, v45);
            unint64_t v59 = v71;
            uint64_t v58 = v72;
            uint64_t v60 = v73;
            (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v71, v57, v73);
            type metadata accessor for IFPlatformTargetEndedConverter();
            uint64_t v61 = sub_1000154A4();
            Class v62 = "setEnded:";
          }
          else
          {
            if (v53 != enum case for IntelligenceFlowPlatformPnR.StateInfo.failed(_:))
            {
              (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v75, v45);
LABEL_20:
              if (qword_100025BC0 != -1) {
                swift_once();
              }
              uint64_t v47 = sub_10001B880();
              sub_100005C3C(v47, (uint64_t)qword_100025DC0);
              os_log_type_t v48 = sub_10001B860();
              os_log_type_t v49 = sub_10001B990();
              if (os_log_type_enabled(v48, v49))
              {
                uint64_t v50 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)uint64_t v50 = 0;
                _os_log_impl((void *)&_mh_execute_header, v48, v49, "failed parsing pnr.stateInfo", v50, 2u);
                swift_slowDealloc();
              }

              id v51 = v67;
              goto LABEL_33;
            }
            uint64_t v63 = v75;
            (*(void (**)(uint64_t, uint64_t))(v46 + 96))(v75, v45);
            unint64_t v59 = v68;
            uint64_t v58 = v69;
            uint64_t v60 = v70;
            (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v68, v63, v70);
            type metadata accessor for IFPlatformTargetFailedConverter();
            uint64_t v61 = sub_100016138();
            Class v62 = "setFailed:";
          }
          id v51 = v67;
          objc_msgSend(v67, v62, v61);

          (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v60);
LABEL_33:
          sub_100004A84(v44, &qword_100025018);
          [v26 setIfPlatformTargetContext:v51];

          (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
          return v26;
        }
        id v54 = [objc_allocWithZone((Class)IFPlatformSchemaIFPlatformTargetStarted) init];
        if (v54)
        {
          uint64_t v55 = v54;
          [v54 setIfPlatformTarget:v25];
          id v56 = v67;
          [v67 setStartedOrChanged:v55];

          id v51 = v56;
          (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v75, v45);
          goto LABEL_33;
        }
        if (qword_100025BC0 != -1) {
          swift_once();
        }
        uint64_t v64 = sub_10001B880();
        sub_100005C3C(v64, (uint64_t)qword_100025DC0);
        sub_100003434(0xD000000000000040, 0x800000010001D090, v65);

        (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v75, v45);
        sub_100004A84(v44, &qword_100025018);
      }
      else
      {
        if (qword_100025BC0 != -1) {
          swift_once();
        }
        uint64_t v34 = sub_10001B880();
        sub_100005C3C(v34, (uint64_t)qword_100025DC0);
        sub_100003434(0xD000000000000038, 0x800000010001D050, v35);
      }
    }
    else
    {
      if (qword_100025BC0 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_10001B880();
      sub_100005C3C(v32, (uint64_t)qword_100025DC0);
      sub_100003434(0xD000000000000030, 0x800000010001D010, v33);
    }
    return 0;
  }
  return v26;
}

uint64_t type metadata accessor for IFPlatformClientEventConverter()
{
  return self;
}

uint64_t sub_10000C4E8()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025DD8);
  sub_100005C3C(v0, (uint64_t)qword_100025DD8);
  sub_100014AA8(0, (unint64_t *)&qword_100024CB8);
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_10000C58C()
{
  if (qword_100025BD0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025DD8);
}

uint64_t sub_10000C5F0@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025BD0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025DD8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

id sub_10000C698()
{
  uint64_t v0 = sub_10001B880();
  uint64_t v17 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v1 = sub_100004414(&qword_100024EC0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10001B6D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004414(&qword_100024E20);
  __chkstk_darwin(v8 - 8);
  unint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B200();
  char v11 = sub_10000D8A0((uint64_t)v10);
  sub_100004A84((uint64_t)v10, &qword_100024E20);
  id v12 = 0;
  if (v11)
  {
    sub_10001B250();
    uint64_t v13 = sub_10001B240();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v3, 1, v13) == 1)
    {
      sub_100004A84((uint64_t)v3, &qword_100024EC0);
    }
    else
    {
      if ((*(unsigned int (**)(char *, uint64_t))(v14 + 88))(v3, v13) == enum case for IntelligenceFlowTelemetry.Objective.feedbackLearning(_:))
      {
        (*(void (**)(char *, uint64_t))(v14 + 96))(v3, v13);
        (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
        id v12 = sub_100013F08();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        return v12;
      }
      (*(void (**)(char *, uint64_t))(v14 + 8))(v3, v13);
    }
    if (qword_100025BD0 != -1) {
      swift_once();
    }
    sub_100005C3C(v0, (uint64_t)qword_100025DD8);
    sub_100003434(0xD00000000000003DLL, 0x800000010001D120, v15);
    return 0;
  }
  return v12;
}

id sub_10000CDEC()
{
  return sub_100013F08();
}

char *sub_10000CE04()
{
  return sub_10000DB5C();
}

uint64_t sub_10000CE1C()
{
  return sub_100011884();
}

uint64_t sub_10000CE34()
{
  return sub_100013994();
}

id sub_10000CE4C(uint64_t a1)
{
  return sub_10000D288(a1, (Class *)FLSchemaFLActionEvaluationStarted_ptr, 0xD000000000000021, 0x800000010001D250);
}

id sub_10000CE84(uint64_t a1)
{
  return sub_100011398(a1);
}

id sub_10000CE9C(uint64_t a1)
{
  return sub_10000D288(a1, (Class *)FLSchemaFLActionEvaluationFailed_ptr, 0xD000000000000020, 0x800000010001D280);
}

char *sub_10000CED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DFD8(a1, a2, a3);
}

id sub_10000CEEC(uint64_t a1)
{
  return sub_10000F8BC(a1);
}

id sub_10000CF04()
{
  return sub_1000110BC();
}

id sub_10000CF24(uint64_t a1)
{
  return sub_10000EA30(a1);
}

id sub_10000CF3C()
{
  return sub_10000F2B4();
}

id sub_10000CF54(uint64_t a1)
{
  return sub_1000102A4(a1);
}

uint64_t sub_10000CF6C(uint64_t a1)
{
  return sub_100010808(a1);
}

id sub_10000CF8C()
{
  id v0 = [objc_allocWithZone((Class)FLSchemaFLToolCandidateCategory) init];
  id v1 = v0;
  if (v0)
  {
    [v0 setExists:1];
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v2 = 0xD00000000000001FLL;
    *(void *)(v2 + 8) = 0x800000010001D2B0;
    *(unsigned char *)(v2 + 16) = 0;
    swift_willThrow();
  }
  return v1;
}

id sub_10000D034()
{
  return sub_100010148();
}

uint64_t sub_10000D05C(uint64_t a1)
{
  uint64_t v2 = sub_10001B360();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.unknown(_:)) {
    return 0;
  }
  if (v6 == enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionExecutedSuccessfully(_:)) {
    return 1;
  }
  if (v6 == enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionNotExecuted(_:)) {
    return 2;
  }
  if (v6 == enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionExecutionFailed(_:)) {
    return 3;
  }
  if (v6 == enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionCriticalFailure(_:)) {
    return 4;
  }
  if (v6 == enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionCancelled(_:)) {
    return 5;
  }
  if (v6 == enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionConfirmationYes(_:)) {
    return 6;
  }
  if (v6 == enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionConfirmationNo(_:)) {
    return 7;
  }
  if (v6 != enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionConfirmationAbandon(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  return 8;
}

id sub_10000D250(uint64_t a1)
{
  return sub_10000D288(a1, (Class *)FLSchemaFLInteractionDonationStarted_ptr, 0xD000000000000024, 0x800000010001D2D0);
}

id sub_10000D288(uint64_t a1, Class *a2, uint64_t a3, uint64_t a4)
{
  id v6 = [objc_allocWithZone(*a2) init];
  id v7 = v6;
  if (v6)
  {
    [v6 setExists:1];
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v8 = a3;
    *(void *)(v8 + 8) = a4;
    *(unsigned char *)(v8 + 16) = 0;
    swift_willThrow();
  }
  return v7;
}

id sub_10000D324(uint64_t a1)
{
  return sub_100012ED0(a1);
}

double sub_10000D33C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100004414(&qword_100025240);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001B130();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007A04(a1, (uint64_t)v9, &qword_100025240);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_100004A84((uint64_t)v9, &qword_100025240);
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v14 = a2;
    *(void *)(v14 + 8) = a3;
    *(unsigned char *)(v14 + 16) = 1;
    swift_bridgeObjectRetain();
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    sub_10001B0F0();
    double v3 = v15;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  return v3;
}

uint64_t *sub_10000D530(uint64_t a1)
{
  return sub_10001239C(a1);
}

id sub_10000D548()
{
  uint64_t v1 = sub_100004414(&qword_100025248);
  __chkstk_darwin(v1 - 8);
  double v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004414(&qword_100025250);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [objc_allocWithZone((Class)FLSchemaFLCandidateInteraction) init];
  if (v7)
  {
    sub_10001B480();
    uint64_t v8 = (void *)sub_100010808((uint64_t)v6);
    sub_100004A84((uint64_t)v6, &qword_100025250);
    if (v0)
    {
    }
    else
    {
      [v7 setIdentifier:v8];

      sub_10001B490();
      uint64_t v10 = sub_1000120C8((uint64_t)v3);
      sub_100004A84((uint64_t)v3, &qword_100025248);
      [v7 setAlignment:v10];
    }
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v9 = 0xD00000000000001ELL;
    *(void *)(v9 + 8) = 0x800000010001D300;
    *(unsigned char *)(v9 + 16) = 0;
    swift_willThrow();
  }
  return v7;
}

uint64_t sub_10000D720(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D740(a1, a2, a3, *v3);
  char *v3 = (char *)result;
  return result;
}

uint64_t sub_10000D740(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004414(&qword_100025358);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_10001BAC0();
  __break(1u);
  return result;
}

uint64_t sub_10000D8A0(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024E20);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B1E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  int64_t v11 = (char *)&v20 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100024E20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100024E20);
    if (qword_100025BD0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10001B880();
    sub_100005C3C(v12, (uint64_t)qword_100025DD8);
    uint64_t v13 = sub_10001B860();
    os_log_type_t v14 = sub_10001B980();
    if (os_log_type_enabled(v13, v14))
    {
      double v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "IntelligenceFlow.Telemetry event has no target", v15, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    BOOL v16 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v16(v11, v4, v5);
    v16(v9, v11, v5);
    int v17 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v17 == enum case for IntelligenceFlowTarget.feedbackLearningEvaluateTask(_:)
      || v17 == enum case for IntelligenceFlowTarget.feedbackLearningDonateInteraction(_:))
    {
      return 1;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return 0;
}

char *sub_10000DB5C()
{
  uint64_t v0 = sub_100004414(&qword_1000253A0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100004414(&qword_1000252F0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004414(&qword_100024ED8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001B170();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v27 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001B6B0();
  uint64_t v12 = sub_10001B6A0();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v2, 1, v12) == 1)
  {
    os_log_type_t v14 = &qword_1000253A0;
    uint64_t v15 = (uint64_t)v2;
LABEL_5:
    sub_100004A84(v15, v14);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
LABEL_6:
    sub_100004A84((uint64_t)v8, &qword_100024ED8);
    sub_100014858();
    swift_allocError();
    *(_OWORD *)uint64_t v18 = xmmword_10001C550;
    *(unsigned char *)(v18 + 16) = 1;
    swift_willThrow();
    return v8;
  }
  sub_10001B690();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v2, v12);
  uint64_t v16 = sub_10001B850();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v5, 1, v16) == 1)
  {
    os_log_type_t v14 = &qword_1000252F0;
    uint64_t v15 = (uint64_t)v5;
    goto LABEL_5;
  }
  sub_10001B840();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    goto LABEL_6;
  }
  uint64_t v20 = v27;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v27, v8, v9);
  uint64_t v21 = (char *)[objc_allocWithZone((Class)FLSchemaFLClientEventMetadata) init];
  if (v21)
  {
    uint64_t v8 = v21;
    id v22 = objc_allocWithZone((Class)SISchemaUUID);
    Class isa = sub_10001B150().super.isa;
    id v24 = [v22 initWithNSUUID:isa];

    [v8 setFlId:v24];
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v25 = 0xD00000000000001DLL;
    *(void *)(v25 + 8) = 0x800000010001D710;
    *(unsigned char *)(v25 + 16) = 0;
    swift_willThrow();
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v20, v9);
  return v8;
}

char *sub_10000DFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a2;
  uint64_t v5 = sub_100004414(&qword_1000252F0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004414(&qword_100024ED8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10001B170();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  os_log_type_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007A04(a1, (uint64_t)v7, &qword_1000252F0);
  uint64_t v15 = sub_10001B850();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v15) == 1)
  {
    sub_100004A84((uint64_t)v7, &qword_1000252F0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  }
  else
  {
    sub_10001B840();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v15);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
      id v18 = objc_allocWithZone((Class)SISchemaUUID);
      Class isa = sub_10001B150().super.isa;
      uint64_t v7 = (char *)[v18 initWithNSUUID:isa];

      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      return v7;
    }
  }
  sub_100004A84((uint64_t)v10, &qword_100024ED8);
  sub_100014858();
  swift_allocError();
  *(void *)uint64_t v17 = v22;
  *(void *)(v17 + 8) = a3;
  *(unsigned char *)(v17 + 16) = 1;
  swift_bridgeObjectRetain();
  swift_willThrow();
  return v7;
}

uint64_t sub_10000E2EC(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025368);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B4B0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025368);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025368);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.ActionResolutionState.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.ActionResolutionState.incomplete(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.ActionResolutionState.complete(_:)) {
        return 2;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

uint64_t sub_10000E514(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025330);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B2B0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025330);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025330);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.TaskStatus.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskStatus.resultUnknown(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskStatus.inferredSuccess(_:)) {
        return 2;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskStatus.inferredFailureUnknown(_:)) {
        return 3;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskStatus.inferredFailureExecutionFailure(_:)) {
        return 4;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskStatus.inferredFailureCriticalFailure(_:)) {
        return 5;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskStatus.abandoned(_:)) {
        return 6;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskStatus.cancelled(_:)) {
        return 7;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

uint64_t sub_10000E7CC(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025328);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B370();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025328);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025328);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.TaskPromptStatus.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskPromptStatus.none(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskPromptStatus.confirmationYes(_:)) {
        return 2;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskPromptStatus.confirmationNo(_:)) {
        return 3;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.TaskPromptStatus.confirmationAbandon(_:)) {
        return 4;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

id sub_10000EA30(uint64_t a1)
{
  uint64_t v3 = sub_100004414(&qword_100025328);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004414(&qword_100025360);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v25 - v10;
  uint64_t v12 = sub_100004414(&qword_100025330);
  __chkstk_darwin(v12 - 8);
  os_log_type_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = [objc_allocWithZone((Class)FLSchemaFLTaskOutcome) init];
  if (v15)
  {
    uint64_t v27 = v1;
    uint64_t v26 = a1;
    sub_100007A04(a1, (uint64_t)v11, &qword_100025360);
    uint64_t v16 = sub_10001B2E0();
    uint64_t v17 = *(void *)(v16 - 8);
    id v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    if (v18(v11, 1, v16) == 1)
    {
      sub_100004A84((uint64_t)v11, &qword_100025360);
      uint64_t v19 = sub_10001B2B0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v14, 1, 1, v19);
    }
    else
    {
      sub_10001B2C0();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v11, v16);
    }
    uint64_t v21 = sub_10000E514((uint64_t)v14);
    sub_100004A84((uint64_t)v14, &qword_100025330);
    [v15 setTaskStatus:v21];
    sub_100007A04(v26, (uint64_t)v9, &qword_100025360);
    if (v18(v9, 1, v16) == 1)
    {
      sub_100004A84((uint64_t)v9, &qword_100025360);
      uint64_t v22 = sub_10001B370();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v5, 1, 1, v22);
    }
    else
    {
      sub_10001B2D0();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v16);
    }
    uint64_t v23 = sub_10000E7CC((uint64_t)v5);
    sub_100004A84((uint64_t)v5, &qword_100025328);
    [v15 setPromptStatus:v23];
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v20 = 0xD000000000000015;
    *(void *)(v20 + 8) = 0x800000010001D590;
    *(unsigned char *)(v20 + 16) = 0;
    swift_willThrow();
  }
  return v15;
}

uint64_t sub_10000EDEC(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025320);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B6C0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025320);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025320);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.Evaluator.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.Evaluator.actionPrompt(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.Evaluator.fixed(_:)) {
        return 2;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.Evaluator.taskCompletion(_:)) {
        return 3;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.Evaluator.majorityMediator(_:)) {
        return 4;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.Evaluator.waterfallMediator(_:)) {
        return 5;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

uint64_t sub_10000F06C(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025318);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B300();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025318);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025318);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.EvaluationVote.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.EvaluationVote.abstain(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.EvaluationVote.success(_:)) {
        return 2;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.EvaluationVote.failure(_:)) {
        return 3;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

id sub_10000F2B4()
{
  uint64_t v1 = sub_10001B360();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v52 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int v53 = (char *)&v36 - v5;
  uint64_t v6 = sub_100004414(&qword_100025318);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004414(&qword_100025320);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = [objc_allocWithZone((Class)FLSchemaFLTaskEvaluationNode) init];
  if (!v12)
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v33 = 0xD00000000000001CLL;
    *(void *)(v33 + 8) = 0x800000010001D570;
    *(unsigned char *)(v33 + 16) = 0;
    swift_willThrow();
    return v12;
  }
  sub_10001B3E0();
  uint64_t v13 = sub_10000EDEC((uint64_t)v11);
  sub_100004A84((uint64_t)v11, &qword_100025320);
  [v12 setEvaluator:v13];
  sub_10001B3C0();
  uint64_t v14 = sub_10000F06C((uint64_t)v8);
  sub_100004A84((uint64_t)v8, &qword_100025318);
  [v12 setResult:v14];
  uint64_t v15 = sub_10001B3D0();
  int64_t v16 = *(void *)(v15 + 16);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    uint64_t v29 = _swiftEmptyArrayStorage[2];
    if (v29) {
      goto LABEL_30;
    }
    goto LABEL_35;
  }
  id v41 = v12;
  uint64_t v42 = v0;
  id v54 = _swiftEmptyArrayStorage;
  sub_10000D720(0, v16, 0);
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  unint64_t v18 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v40 = v15;
  unint64_t v19 = v15 + v18;
  uint64_t v50 = *(void *)(v2 + 72);
  id v51 = v17;
  os_log_type_t v49 = (uint64_t (**)(char *, uint64_t))(v2 + 88);
  int v48 = enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.unknown(_:);
  int v46 = enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionExecutedSuccessfully(_:);
  int v44 = enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionExecutionFailed(_:);
  int v45 = enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionNotExecuted(_:);
  int v43 = enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionCriticalFailure(_:);
  int v39 = enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionCancelled(_:);
  int v37 = enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionConfirmationNo(_:);
  int v38 = enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionConfirmationYes(_:);
  uint64_t v20 = (void (**)(char *, uint64_t))(v2 + 8);
  int v36 = enum case for IntelligenceFlowFeedbackLearning.EvaluationSource.actionConfirmationAbandon(_:);
  uint64_t v47 = v2 + 16;
  do
  {
    uint64_t v21 = v53;
    uint64_t v22 = v51;
    v51(v53, (char *)v19, v1);
    uint64_t v23 = v52;
    v22(v52, v21, v1);
    int v24 = (*v49)(v23, v1);
    if (v24 == v48) {
      goto LABEL_5;
    }
    if (v24 == v46)
    {
      int v25 = 1;
    }
    else if (v24 == v45)
    {
      int v25 = 2;
    }
    else if (v24 == v44)
    {
      int v25 = 3;
    }
    else if (v24 == v43)
    {
      int v25 = 4;
    }
    else if (v24 == v39)
    {
      int v25 = 5;
    }
    else if (v24 == v38)
    {
      int v25 = 6;
    }
    else if (v24 == v37)
    {
      int v25 = 7;
    }
    else
    {
      if (v24 != v36)
      {
        (*v20)(v52, v1);
LABEL_5:
        int v25 = 0;
        goto LABEL_22;
      }
      int v25 = 8;
    }
LABEL_22:
    (*v20)(v53, v1);
    uint64_t v26 = v54;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_10000D720(0, v26[2] + 1, 1);
      uint64_t v26 = v54;
    }
    unint64_t v28 = v26[2];
    unint64_t v27 = v26[3];
    if (v28 >= v27 >> 1)
    {
      sub_10000D720(v27 > 1, v28 + 1, 1);
      uint64_t v26 = v54;
    }
    v26[2] = v28 + 1;
    *((_DWORD *)v26 + v28 + 8) = v25;
    v19 += v50;
    --v16;
  }
  while (v16);
  swift_bridgeObjectRelease();
  id v12 = v41;
  uint64_t v29 = v26[2];
  if (!v29)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
LABEL_30:
  id v30 = v12;
  id v54 = _swiftEmptyArrayStorage;
  sub_10001BA50();
  uint64_t v31 = 0;
  do
  {
    uint64_t v32 = v31 + 1;
    sub_10001BB40();
    sub_10001BA30();
    sub_10001BA60();
    sub_10001BA70();
    sub_10001BA40();
    uint64_t v31 = v32;
  }
  while (v29 != v32);
  swift_bridgeObjectRelease();
  id v12 = v30;
LABEL_36:
  sub_100014AA8(0, &qword_100025350);
  Class isa = sub_10001B930().super.isa;
  swift_bridgeObjectRelease();
  [v12 setSources:isa];

  return v12;
}

id sub_10000F8BC(uint64_t a1)
{
  uint64_t v44 = sub_10001B3F0();
  uint64_t v48 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  int v43 = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004414(&qword_100025360);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004414(&qword_100025378);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)v42 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v42 - v14;
  uint64_t v16 = sub_100004414(&qword_100025368);
  __chkstk_darwin(v16 - 8);
  unint64_t v18 = (char *)v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = [objc_allocWithZone((Class)FLSchemaFLTaskEvaluation) init];
  id v20 = v19;
  if (v19)
  {
    uint64_t v45 = (uint64_t)v10;
    int v46 = v1;
    id v47 = v19;
    uint64_t v21 = a1;
    sub_100007A04(a1, (uint64_t)v15, &qword_100025378);
    uint64_t v22 = sub_10001B340();
    uint64_t v23 = *(void *)(v22 - 8);
    int v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
    if (v24(v15, 1, v22) == 1)
    {
      sub_100004A84((uint64_t)v15, &qword_100025378);
      uint64_t v25 = sub_10001B4B0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v18, 1, 1, v25);
    }
    else
    {
      sub_10001B330();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v15, v22);
    }
    uint64_t v27 = sub_10000E2EC((uint64_t)v18);
    sub_100004A84((uint64_t)v18, &qword_100025368);
    [v47 setActionResolutionState:v27];
    sub_100007A04(v21, (uint64_t)v13, &qword_100025378);
    if (v24(v13, 1, v22) == 1)
    {
      sub_100004A84((uint64_t)v13, &qword_100025378);
      uint64_t v28 = sub_10001B2E0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v6, 1, 1, v28);
    }
    else
    {
      sub_10001B310();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v22);
    }
    uint64_t v29 = v46;
    id v30 = sub_10000EA30((uint64_t)v6);
    sub_100004A84((uint64_t)v6, &qword_100025360);
    if (v29)
    {
      id v20 = v47;
    }
    else
    {
      [v47 setTaskOutcome:v30];

      uint64_t v31 = v45;
      sub_100007A04(v21, v45, &qword_100025378);
      if (v24((char *)v31, 1, v22) == 1)
      {
        sub_100004A84(v31, &qword_100025378);
        Class isa = 0;
      }
      else
      {
        uint64_t v33 = sub_10001B320();
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v31, v22);
        uint64_t v34 = *(void *)(v33 + 16);
        if (v34)
        {
          os_log_type_t v49 = _swiftEmptyArrayStorage;
          sub_10001BA50();
          uint64_t v35 = *(void (**)(void, void, void))(v48 + 16);
          uint64_t v36 = *(unsigned __int8 *)(v48 + 80);
          v42[1] = v33;
          uint64_t v37 = v33 + ((v36 + 32) & ~v36);
          uint64_t v45 = *(void *)(v48 + 72);
          int v46 = v35;
          v48 += 16;
          int v38 = (void (**)(char *, uint64_t))(v48 - 8);
          int v39 = v43;
          uint64_t v40 = v44;
          do
          {
            v46(v39, v37, v40);
            sub_10000F2B4();
            (*v38)(v39, v40);
            sub_10001BA30();
            sub_10001BA60();
            sub_10001BA70();
            sub_10001BA40();
            v37 += v45;
            --v34;
          }
          while (v34);
        }
        swift_bridgeObjectRelease();
        sub_100014AA8(0, &qword_100025380);
        Class isa = sub_10001B930().super.isa;
        swift_bridgeObjectRelease();
      }
      id v20 = v47;
      [v47 setEvaluationNodes:isa];
    }
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v26 = 0xD000000000000018;
    *(void *)(v26 + 8) = 0x800000010001D5D0;
    *(unsigned char *)(v26 + 16) = 0;
    swift_willThrow();
  }
  return v20;
}

uint64_t sub_10000FF20(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025370);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B2F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025370);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025370);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.EvaluationType.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.EvaluationType.fastEvaluator(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.EvaluationType.fullEvaluator(_:)) {
        return 2;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

id sub_100010148()
{
  uint64_t v1 = sub_100004414(&qword_1000252F0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [objc_allocWithZone((Class)FLSchemaFLParameterCandidateCategory) init];
  if (v4)
  {
    sub_10001B4D0();
    uint64_t v5 = sub_10000DFD8((uint64_t)v3, 0x6574656D61726170, 0xEF6449656D614E72);
    sub_100004A84((uint64_t)v3, &qword_1000252F0);
    if (v0)
    {
    }
    else
    {
      [v4 setParameterNameId:v5];
    }
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v6 = 0xD000000000000024;
    *(void *)(v6 + 8) = 0x800000010001D500;
    *(unsigned char *)(v6 + 16) = 0;
    swift_willThrow();
  }
  return v4;
}

id sub_1000102A4(uint64_t a1)
{
  uint64_t v2 = sub_10001B4E0();
  v30[0] = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004414(&qword_100025348);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001B3B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v30 - v13;
  id v31 = [objc_allocWithZone((Class)FLSchemaFLCandidateCategory) init];
  if (v31)
  {
    sub_100007A04(a1, (uint64_t)v7, &qword_100025348);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_100004A84((uint64_t)v7, &qword_100025348);
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v15 = 0xD000000000000011;
      *(void *)(v15 + 8) = 0x800000010001D550;
      *(unsigned char *)(v15 + 16) = 1;
      swift_willThrow();
      id v16 = v31;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
      int v18 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v12, v8);
      if (v18 == enum case for IntelligenceFlowFeedbackLearning.CandidateCategory.tool(_:))
      {
        id v19 = *(void (**)(char *, uint64_t))(v9 + 8);
        v19(v12, v8);
        id v20 = [objc_allocWithZone((Class)FLSchemaFLToolCandidateCategory) init];
        if (v20)
        {
          uint64_t v21 = v20;
          [v20 setExists:1];
          id v16 = v31;
          [v31 setTool:v21];
        }
        else
        {
          sub_100014858();
          swift_allocError();
          *(void *)uint64_t v27 = 0xD00000000000001FLL;
          *(void *)(v27 + 8) = 0x800000010001D2B0;
          *(unsigned char *)(v27 + 16) = 0;
          swift_willThrow();
          id v16 = v31;
        }
        v19(v14, v8);
      }
      else if (v18 == enum case for IntelligenceFlowFeedbackLearning.CandidateCategory.parameter(_:))
      {
        (*(void (**)(char *, uint64_t))(v9 + 96))(v12, v8);
        uint64_t v22 = v30[0];
        (*(void (**)(char *, char *, uint64_t))(v30[0] + 32))(v4, v12, v2);
        uint64_t v23 = v30[1];
        id v24 = sub_100010148();
        id v16 = v31;
        if (v23)
        {
        }
        else
        {
          uint64_t v28 = v24;
          [v31 setParameter:v24];
        }
        (*(void (**)(char *, uint64_t))(v22 + 8))(v4, v2);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      }
      else
      {
        sub_100014858();
        swift_allocError();
        *(void *)uint64_t v25 = 0xD000000000000011;
        *(void *)(v25 + 8) = 0x800000010001D550;
        *(unsigned char *)(v25 + 16) = 2;
        swift_willThrow();
        id v16 = v31;

        uint64_t v26 = *(void (**)(char *, uint64_t))(v9 + 8);
        v26(v14, v8);
        v26(v12, v8);
      }
    }
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v17 = 0xD00000000000001BLL;
    *(void *)(v17 + 8) = 0x800000010001D530;
    *(unsigned char *)(v17 + 16) = 0;
    swift_willThrow();
    return v31;
  }
  return v16;
}

uint64_t sub_100010808(uint64_t a1)
{
  uint64_t v3 = sub_100004414(&qword_1000252F0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004414(&qword_100025250);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10001B460();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007A04(a1, (uint64_t)v8, &qword_100025250);
  uint64_t v13 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_100004A84((uint64_t)v8, &qword_100025250);
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v14 = 0xD000000000000013;
    *(void *)(v14 + 8) = 0x800000010001D380;
    *(unsigned char *)(v14 + 16) = 1;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    id v15 = [objc_allocWithZone((Class)FLSchemaFLCandidateIdentifier) init];
    if (v15)
    {
      uint64_t v13 = (uint64_t)v15;
      sub_10001B450();
      id v16 = sub_10000DFD8((uint64_t)v5, 0xD00000000000001FLL, 0x800000010001D3C0);
      if (!v1)
      {
        int v18 = v16;
        sub_100004A84((uint64_t)v5, &qword_1000252F0);
        [(id)v13 setCandidateId:v18];

        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        return v13;
      }

      sub_100004A84((uint64_t)v5, &qword_1000252F0);
    }
    else
    {
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v17 = 0xD00000000000001DLL;
      *(void *)(v17 + 8) = 0x800000010001D3A0;
      *(unsigned char *)(v17 + 16) = 0;
      swift_willThrow();
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v13;
}

uint64_t sub_100010B30(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025340);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B470();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025340);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025340);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.CandidateResolution.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateResolution.unresolved(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateResolution.resolvedNotSelected(_:)) {
        return 2;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateResolution.resolvedSelected(_:)) {
        return 3;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateResolution.executed(_:)) {
        return 4;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

uint64_t sub_100010D94(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025338);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B350();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025338);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025338);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.confirmationAbandoned(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.confirmationConfirmed(_:)) {
        return 2;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.confirmationRejected(_:)) {
        return 3;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.disambiguationAbandoned(_:)) {
        return 4;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.disambiguationCandidateSelected(_:)) {
        return 5;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.disambiguationOtherCandidateSelected(_:)) {
        return 6;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.disambiguationRejected(_:)) {
        return 7;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.inferredSuccess(_:)) {
        return 8;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.inferredFailure(_:)) {
        return 9;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.unableToDeriveOutcome(_:)) {
        return 10;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.CandidateOutcome.inferredFromTask(_:)) {
        return 11;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

id sub_1000110BC()
{
  uint64_t v1 = sub_100004414(&qword_100025338);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004414(&qword_100025340);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100004414(&qword_100025250);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100004414(&qword_100025348);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [objc_allocWithZone((Class)FLSchemaFLCandidateEvaluation) init];
  if (v13)
  {
    sub_10001B410();
    id v14 = sub_1000102A4((uint64_t)v12);
    sub_100004A84((uint64_t)v12, &qword_100025348);
    if (v0)
    {
    }
    else
    {
      [v13 setCandidateCategory:v14];

      sub_10001B420();
      uint64_t v15 = (void *)sub_100010808((uint64_t)v9);
      sub_100004A84((uint64_t)v9, &qword_100025250);
      [v13 setCandidateIdentifier:v15];

      sub_10001B400();
      uint64_t v17 = sub_100010B30((uint64_t)v6);
      sub_100004A84((uint64_t)v6, &qword_100025340);
      [v13 setResolution:v17];
      sub_10001B430();
      uint64_t v18 = sub_100010D94((uint64_t)v3);
      sub_100004A84((uint64_t)v3, &qword_100025338);
      [v13 setOutcome:v18];
    }
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v16 = 0xD00000000000001DLL;
    *(void *)(v16 + 8) = 0x800000010001D5B0;
    *(unsigned char *)(v16 + 16) = 0;
    swift_willThrow();
  }
  return v13;
}

id sub_100011398(uint64_t a1)
{
  uint64_t v3 = sub_10001B440();
  uint64_t v35 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100004414(&qword_100025370);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004414(&qword_100025378);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100004414(&qword_1000252F0);
  __chkstk_darwin(v12 - 8);
  id v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = [objc_allocWithZone((Class)FLSchemaFLActionEvaluationEnded) init];
  if (!v15)
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v25 = 0xD00000000000001FLL;
    *(void *)(v25 + 8) = 0x800000010001D5F0;
    *(unsigned char *)(v25 + 16) = 0;
    swift_willThrow();
    return v15;
  }
  uint64_t v34 = v3;
  sub_10001B520();
  uint64_t v16 = sub_10000DFD8((uint64_t)v14, 0xD000000000000021, 0x800000010001D610);
  sub_100004A84((uint64_t)v14, &qword_1000252F0);
  if (v1)
  {
LABEL_10:

    return v15;
  }
  [v15 setIfSessionId:v16];

  uint64_t v17 = sub_10001B540();
  if ((v17 & 0x100000000) != 0)
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v26 = 0xD000000000000027;
    *(void *)(v26 + 8) = 0x800000010001D640;
    *(unsigned char *)(v26 + 16) = 1;
    swift_willThrow();
    goto LABEL_10;
  }
  [v15 setActionStatementId:v17];
  sub_10001B510();
  id v18 = sub_10000F8BC((uint64_t)v11);
  sub_100004A84((uint64_t)v11, &qword_100025378);
  [v15 setTaskEvaluation:v18];

  uint64_t v19 = sub_10001B550();
  uint64_t v20 = *(void *)(v19 + 16);
  if (v20)
  {
    v30[0] = v8;
    v30[1] = a1;
    uint64_t v36 = _swiftEmptyArrayStorage;
    sub_10001BA50();
    uint64_t v21 = v34;
    uint64_t v22 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
    unint64_t v23 = v19 + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80));
    uint64_t v24 = *(void *)(v35 + 72);
    void v30[2] = v19;
    uint64_t v31 = v24;
    v35 += 16;
    uint64_t v32 = (void (**)(char *, uint64_t))(v35 - 8);
    uint64_t v33 = v22;
    do
    {
      v33(v5, v23, v21);
      sub_1000110BC();
      (*v32)(v5, v21);
      sub_10001BA30();
      sub_10001BA60();
      sub_10001BA70();
      sub_10001BA40();
      v23 += v31;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease();
    uint64_t v8 = (char *)v30[0];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_100014AA8(0, &qword_100025388);
  Class isa = sub_10001B930().super.isa;
  swift_bridgeObjectRelease();
  [v15 setCandidateEvaluations:isa];

  sub_10001B530();
  uint64_t v29 = sub_10000FF20((uint64_t)v8);
  sub_100004A84((uint64_t)v8, &qword_100025370);
  [v15 setEvaluationType:v29];
  return v15;
}

uint64_t sub_100011884()
{
  uint64_t v1 = sub_10001B560();
  uint64_t v32 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004414(&qword_100025398);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001B570();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v31 - v12;
  sub_10001B580();
  uint64_t v14 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    id v16 = [objc_allocWithZone((Class)FLSchemaFLActionEvaluationContext) init];
    if (v16)
    {
      uint64_t v14 = (uint64_t)v16;
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
      int v17 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v11, v7);
      if (v17 == enum case for IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.StateInfo.started(_:))
      {
        id v18 = *(void (**)(char *, uint64_t))(v8 + 8);
        v18(v11, v7);
        id v19 = [objc_allocWithZone((Class)FLSchemaFLActionEvaluationStarted) init];
        if (v19)
        {
          uint64_t v20 = v19;
          [v19 setExists:1];
          [(id)v14 setStartedOrChanged:v20];
LABEL_15:

          v18(v13, v7);
          return v14;
        }
        sub_100014858();
        swift_allocError();
        uint64_t v26 = "FLSchemaFLActionEvaluationStarted";
        unint64_t v27 = 0xD000000000000021;
        goto LABEL_20;
      }
      if (v17 != enum case for IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.StateInfo.ended(_:))
      {
        if (v17 != enum case for IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.StateInfo.failed(_:))
        {
          sub_100014858();
          swift_allocError();
          *(void *)uint64_t v28 = 0xD00000000000001ALL;
          *(void *)(v28 + 8) = 0x800000010001D6C0;
          *(unsigned char *)(v28 + 16) = 2;
          swift_willThrow();

          uint64_t v14 = *(void *)(v8 + 8);
          ((void (*)(char *, uint64_t))v14)(v13, v7);
          ((void (*)(char *, uint64_t))v14)(v11, v7);
          return v14;
        }
        id v18 = *(void (**)(char *, uint64_t))(v8 + 8);
        v18(v11, v7);
        id v24 = [objc_allocWithZone((Class)FLSchemaFLActionEvaluationFailed) init];
        if (v24)
        {
          uint64_t v20 = v24;
          [v24 setExists:1];
          [(id)v14 setFailed:v20];
          goto LABEL_15;
        }
        sub_100014858();
        swift_allocError();
        uint64_t v26 = "FLSchemaFLActionEvaluationFailed";
        unint64_t v27 = 0xD000000000000020;
LABEL_20:
        *(void *)uint64_t v25 = v27;
        *(void *)(v25 + 8) = (unint64_t)(v26 - 32) | 0x8000000000000000;
        *(unsigned char *)(v25 + 16) = 0;
        swift_willThrow();

        v18(v13, v7);
        return v14;
      }
      (*(void (**)(char *, uint64_t))(v8 + 96))(v11, v7);
      uint64_t v22 = v32;
      (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v3, v11, v1);
      id v23 = sub_100011398((uint64_t)v3);
      if (!v0)
      {
        uint64_t v29 = v23;
        [(id)v14 setEnded:v23];

        (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v1);
        (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
        return v14;
      }

      (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v1);
    }
    else
    {
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v21 = 0xD000000000000021;
      *(void *)(v21 + 8) = 0x800000010001D6E0;
      *(unsigned char *)(v21 + 16) = 0;
      swift_willThrow();
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return v14;
  }
  sub_100004A84((uint64_t)v6, &qword_100025398);
  sub_100014858();
  swift_allocError();
  *(void *)uint64_t v15 = 0xD00000000000001ALL;
  *(void *)(v15 + 8) = 0x800000010001D6C0;
  *(unsigned char *)(v15 + 16) = 1;
  swift_willThrow();
  return v14;
}

uint64_t sub_100011E80(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025308);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B680();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025308);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025308);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.Trigger.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.Trigger.triggerUnknown(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.Trigger.realtimeSession(_:)) {
        return 2;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.Trigger.endOfSession(_:)) {
        return 3;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

uint64_t sub_1000120C8(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025248);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B4C0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v15 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100025248);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100025248);
  }
  else
  {
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v12(v11, v4, v5);
    v12(v9, v11, v5);
    int v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
    if (v13 != enum case for IntelligenceFlowFeedbackLearning.UserAlignmentCategory.unknown(_:))
    {
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.UserAlignmentCategory.categoryUnknown(_:)) {
        return 1;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.UserAlignmentCategory.explicitlyRejected(_:)) {
        return 2;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.UserAlignmentCategory.implicitlyRejected(_:)) {
        return 3;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.UserAlignmentCategory.executed(_:)) {
        return 4;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.UserAlignmentCategory.implicitlyAccepted(_:)) {
        return 5;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.UserAlignmentCategory.explicitlyAccepted(_:)) {
        return 6;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.UserAlignmentCategory.transientDeviceConfigurationFailure(_:)) {
        return 7;
      }
      if (v13 == enum case for IntelligenceFlowFeedbackLearning.UserAlignmentCategory.notSelected(_:)) {
        return 8;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return 0;
}

uint64_t *sub_10001239C(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024ED8);
  __chkstk_darwin(v2 - 8);
  v82 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_10001B170();
  uint64_t v70 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  BOOL v80 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004414(&qword_1000252F0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v81 = (uint64_t)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v64 - v8;
  uint64_t v10 = sub_100004414(&qword_100025250);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v83 = (uint64_t)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v89 = (uint64_t)&v64 - v13;
  uint64_t v14 = sub_10001B460();
  uint64_t v86 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v84 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  unint64_t v88 = (char *)&v64 - v17;
  uint64_t v18 = sub_100004414(&qword_100025248);
  __chkstk_darwin(v18 - 8);
  uint64_t v69 = (char *)&v64 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = &qword_1000252F8;
  uint64_t v21 = sub_100004414(&qword_1000252F8);
  __chkstk_darwin(v21 - 8);
  id v23 = (char *)&v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10001B3A0();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  unint64_t v27 = (char *)&v64 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007A04(a1, (uint64_t)v23, &qword_1000252F8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    sub_100004A84((uint64_t)v23, &qword_1000252F8);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v27, v23, v24);
    uint64_t v28 = v27;
    int v68 = (uint64_t *)[objc_allocWithZone((Class)FLSchemaFLTupleInteraction) init];
    if (v68)
    {
      uint64_t v67 = v25;
      uint64_t v66 = v27;
      uint64_t v29 = sub_10001B380();
      unint64_t v90 = (unint64_t)_swiftEmptyArrayStorage;
      uint64_t v30 = *(void *)(v29 + 16);
      if (!v30)
      {
LABEL_23:
        swift_bridgeObjectRelease();
        sub_100014AA8(0, &qword_100025300);
        Class isa = sub_10001B930().super.isa;
        swift_bridgeObjectRelease();
        uint64_t v20 = v68;
        [v68 setIdentifiers:isa];

        uint64_t v60 = (uint64_t)v69;
        uint64_t v61 = v66;
        sub_10001B390();
        uint64_t v62 = sub_1000120C8(v60);
        sub_100004A84(v60, &qword_100025248);
        [v20 setAlignment:v62];
        (*(void (**)(char *, uint64_t))(v67 + 8))(v61, v24);
        return v20;
      }
      uint64_t v65 = v24;
      uint64_t v31 = *(void (**)(void, void, void))(v86 + 16);
      unint64_t v32 = v29 + ((*(unsigned __int8 *)(v86 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80));
      uint64_t v78 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v86 + 56);
      os_log_type_t v79 = (void (*)(uint64_t, char *, uint64_t))v31;
      uint64_t v75 = (void (**)(char *, uint64_t, uint64_t))(v86 + 32);
      uint64_t v74 = (unsigned int (**)(uint64_t, uint64_t, id))(v70 + 48);
      uint64_t v72 = (void (**)(char *, uint64_t))(v70 + 8);
      uint64_t v73 = (void (**)(char *, uint64_t, uint64_t))(v70 + 32);
      uint64_t v76 = (void (**)(char *, uint64_t))(v86 + 8);
      uint64_t v77 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v86 + 48);
      v86 += 16;
      uint64_t v71 = *(void *)(v86 + 56);
      uint64_t v64 = v29;
      swift_bridgeObjectRetain();
      uint64_t v33 = v84;
      while (1)
      {
        uint64_t v34 = v88;
        uint64_t v20 = (uint64_t *)v86;
        uint64_t v35 = v79;
        v79((uint64_t)v88, (char *)v32, v14);
        uint64_t v36 = v89;
        v35(v89, v34, v14);
        (*v78)(v36, 0, 1, v14);
        uint64_t v37 = v36;
        uint64_t v38 = v83;
        sub_100007A04(v37, v83, &qword_100025250);
        if ((*v77)(v38, 1, v14) == 1)
        {
          sub_100004A84(v38, &qword_100025250);
          sub_100014858();
          swift_allocError();
          *(void *)uint64_t v55 = 0xD000000000000013;
          *(void *)(v55 + 8) = 0x800000010001D380;
          *(unsigned char *)(v55 + 16) = 1;
          swift_willThrow();
          id v56 = v76;
          goto LABEL_21;
        }
        (*v75)(v33, v38, v14);
        id v39 = [objc_allocWithZone((Class)FLSchemaFLCandidateIdentifier) init];
        if (!v39)
        {
          sub_100014858();
          swift_allocError();
          *(void *)uint64_t v57 = 0xD00000000000001DLL;
          *(void *)(v57 + 8) = 0x800000010001D3A0;
          *(unsigned char *)(v57 + 16) = 0;
          swift_willThrow();
          goto LABEL_20;
        }
        uint64_t v40 = v39;
        uint64_t v85 = v30;
        sub_10001B450();
        uint64_t v41 = v81;
        sub_100007A04((uint64_t)v9, v81, &qword_1000252F0);
        uint64_t v20 = (uint64_t *)sub_10001B850();
        uint64_t v42 = *(v20 - 1);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t *))(v42 + 48))(v41, 1, v20) == 1) {
          break;
        }
        int v43 = v9;
        uint64_t v44 = v82;
        sub_10001B840();
        uint64_t v45 = v41;
        int v46 = v20;
        uint64_t v47 = (uint64_t)v44;
        uint64_t v9 = v43;
        uint64_t v20 = (uint64_t *)v87;
        uint64_t v33 = v84;
        (*(void (**)(uint64_t, uint64_t *))(v42 + 8))(v45, v46);
        if ((*v74)(v47, 1, v20) == 1) {
          goto LABEL_19;
        }
        uint64_t v48 = v80;
        uint64_t v49 = v87;
        (*v73)(v80, v47, v87);
        id v50 = objc_allocWithZone((Class)SISchemaUUID);
        Class v51 = sub_10001B150().super.isa;
        id v52 = [v50 initWithNSUUID:v51];

        (*v72)(v48, v49);
        sub_100004A84((uint64_t)v9, &qword_1000252F0);
        [v40 setCandidateId:v52];

        int v53 = *v76;
        (*v76)(v33, v14);
        sub_100004A84(v89, &qword_100025250);
        v53(v88, v14);
        sub_10001B920();
        if (*(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10001B950();
        }
        sub_10001B960();
        sub_10001B940();
        v32 += v71;
        uint64_t v30 = v85 - 1;
        if (v85 == 1)
        {
          swift_bridgeObjectRelease();
          uint64_t v24 = v65;
          goto LABEL_23;
        }
      }
      sub_100004A84(v41, &qword_1000252F0);
      uint64_t v47 = (uint64_t)v82;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v70 + 56))(v82, 1, 1, v87);
LABEL_19:
      sub_100004A84(v47, &qword_100024ED8);
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v58 = 0xD00000000000001FLL;
      *(void *)(v58 + 8) = 0x800000010001D3C0;
      *(unsigned char *)(v58 + 16) = 1;
      swift_willThrow();

      sub_100004A84((uint64_t)v9, &qword_1000252F0);
LABEL_20:
      id v56 = v76;
      (*v76)(v33, v14);
LABEL_21:
      sub_100004A84(v89, &qword_100025250);
      (*v56)(v88, v14);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      uint64_t v24 = v65;
      uint64_t v25 = v67;
      uint64_t v28 = v66;
    }
    else
    {
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v54 = 0xD00000000000001ALL;
      *(void *)(v54 + 8) = 0x800000010001D360;
      *(unsigned char *)(v54 + 16) = 0;
      swift_willThrow();
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
  }
  return v20;
}

id sub_100012ED0(uint64_t a1)
{
  uint64_t v93 = a1;
  uint64_t v1 = sub_100004414(&qword_100025248);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v78 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004414(&qword_100025250);
  __chkstk_darwin(v4 - 8);
  uint64_t v87 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10001B4A0();
  uint64_t v88 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v78 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100004414(&qword_1000252F8);
  __chkstk_darwin(v9 - 8);
  uint64_t v85 = (char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004414(&qword_100025308);
  __chkstk_darwin(v11 - 8);
  uint64_t v86 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004414(&qword_1000252F0);
  __chkstk_darwin(v13 - 8);
  unint64_t v90 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10001B130();
  uint64_t v94 = *(void *)(v15 - 8);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v89 = (char *)&v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v78 - v18;
  uint64_t v20 = sub_100004414(&qword_100025240);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  id v23 = (char *)&v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v92 = (char *)&v78 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v78 - v27;
  __chkstk_darwin(v26);
  uint64_t v30 = (char *)&v78 - v29;
  id v31 = [objc_allocWithZone((Class)FLSchemaFLInteractionDonationEnded) init];
  if (v31)
  {
    v82 = v8;
    uint64_t v83 = v3;
    uint64_t v84 = v6;
    sub_10001B5C0();
    sub_100007A04((uint64_t)v30, (uint64_t)v28, &qword_100025240);
    unint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v94 + 48);
    if (v32(v28, 1, v15) == 1)
    {
      sub_100004A84((uint64_t)v28, &qword_100025240);
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v33 = 0xD000000000000025;
      *(void *)(v33 + 8) = 0x800000010001D410;
      *(unsigned char *)(v33 + 16) = 1;
      swift_willThrow();
      uint64_t v34 = (uint64_t)v30;
      uint64_t v35 = &qword_100025240;
LABEL_9:
      sub_100004A84(v34, v35);
LABEL_10:

      return v31;
    }
    id v81 = v31;
    uint64_t v37 = v94;
    os_log_type_t v79 = *(void (**)(char *, char *, uint64_t))(v94 + 32);
    uint64_t v80 = v94 + 32;
    v79(v19, v28, v15);
    sub_10001B0F0();
    double v39 = v38;
    uint64_t v40 = *(void (**)(char *, uint64_t))(v37 + 8);
    uint64_t v94 = v37 + 8;
    v40(v19, v15);
    uint64_t v41 = (uint64_t)v30;
    id v42 = v81;
    sub_100004A84(v41, &qword_100025240);
    [v42 setAbsoluteTime:v39];
    uint64_t v43 = (uint64_t)v92;
    sub_10001B5D0();
    sub_100007A04(v43, (uint64_t)v23, &qword_100025240);
    if (v32(v23, 1, v15) == 1)
    {
      sub_100004A84((uint64_t)v23, &qword_100025240);
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v44 = 0xD000000000000025;
      *(void *)(v44 + 8) = 0x800000010001D440;
      *(unsigned char *)(v44 + 16) = 1;
      swift_willThrow();
      sub_100004A84(v43, &qword_100025240);

      return v42;
    }
    uint64_t v45 = v89;
    v79(v89, v23, v15);
    sub_10001B0F0();
    double v47 = v46;
    v40(v45, v15);
    sub_100004A84(v43, &qword_100025240);
    [v42 setDonationTime:v47];
    uint64_t v48 = (uint64_t)v90;
    sub_10001B5B0();
    uint64_t v49 = v91;
    id v50 = sub_10000DFD8(v48, 0xD000000000000024, 0x800000010001D470);
    id v31 = v42;
    if (v49)
    {
      uint64_t v35 = &qword_1000252F0;
      uint64_t v34 = v48;
      goto LABEL_9;
    }
    id v52 = v50;
    sub_100004A84(v48, &qword_1000252F0);
    [v42 setIfSessionId:v52];

    uint64_t v53 = sub_10001B600();
    if ((v53 & 0x100000000) != 0)
    {
      sub_100014858();
      swift_allocError();
      unint64_t v58 = 0xD00000000000002ALL;
      unint64_t v59 = "InteractionDonationEnded actionStatementId";
      goto LABEL_16;
    }
    [v42 setActionStatementId:v53];
    uint64_t v54 = (uint64_t)v86;
    sub_10001B5E0();
    uint64_t v55 = sub_100011E80(v54);
    sub_100004A84(v54, &qword_100025308);
    [v42 setDonationTrigger:v55];
    char v56 = sub_10001B5F0();
    if (v56 == 2)
    {
      sub_100014858();
      swift_allocError();
      unint64_t v58 = 0xD000000000000028;
      unint64_t v59 = "InteractionDonationEnded wasTupleDonated";
LABEL_16:
      *(void *)uint64_t v57 = v58;
      *(void *)(v57 + 8) = (unint64_t)(v59 - 32) | 0x8000000000000000;
      *(unsigned char *)(v57 + 16) = 1;
      swift_willThrow();
      goto LABEL_10;
    }
    [v42 setWasTupleDonated:v56 & 1];
    uint64_t v60 = (uint64_t)v85;
    sub_10001B610();
    uint64_t v61 = sub_10001239C(v60);
    sub_100004A84(v60, &qword_1000252F8);
    [v42 setTuple:v61];

    uint64_t v62 = sub_10001B5A0();
    uint64_t v63 = *(void *)(v62 + 16);
    if (v63)
    {
      unint64_t v95 = _swiftEmptyArrayStorage;
      sub_10001BA50();
      uint64_t v64 = *(void *)(v88 + 16);
      uint64_t v65 = *(unsigned __int8 *)(v88 + 80);
      uint64_t v92 = (char *)v62;
      uint64_t v66 = v62 + ((v65 + 32) & ~v65);
      uint64_t v93 = *(void *)(v88 + 72);
      uint64_t v94 = v64;
      v88 += 16;
      uint64_t v67 = (void (**)(char *, uint64_t))(v88 - 8);
      uint64_t v68 = v84;
      uint64_t v69 = v82;
      while (1)
      {
        ((void (*)(char *, uint64_t, uint64_t))v94)(v69, v66, v68);
        id v70 = [objc_allocWithZone((Class)FLSchemaFLCandidateInteraction) init];
        if (!v70) {
          break;
        }
        uint64_t v71 = v70;
        uint64_t v72 = (uint64_t)v87;
        sub_10001B480();
        uint64_t v73 = (void *)sub_100010808(v72);
        sub_100004A84(v72, &qword_100025250);
        [v71 setIdentifier:v73];

        uint64_t v74 = (uint64_t)v83;
        sub_10001B490();
        uint64_t v75 = sub_1000120C8(v74);
        sub_100004A84(v74, &qword_100025248);
        [v71 setAlignment:v75];
        uint64_t v68 = v84;
        (*v67)(v69, v84);
        sub_10001BA30();
        sub_10001BA60();
        sub_10001BA70();
        sub_10001BA40();
        v66 += v93;
        if (!--v63)
        {
          swift_bridgeObjectRelease();
          id v31 = v81;
          goto LABEL_23;
        }
      }
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v77 = 0xD00000000000001ELL;
      *(void *)(v77 + 8) = 0x800000010001D300;
      *(unsigned char *)(v77 + 16) = 0;
      swift_willThrow();
      (*v67)(v82, v68);
      swift_bridgeObjectRelease();
      id v31 = v81;

      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
LABEL_23:
      sub_100014AA8(0, &qword_100025310);
      Class isa = sub_10001B930().super.isa;
      swift_bridgeObjectRelease();
      [v31 setCandidates:isa];
    }
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v36 = 0xD000000000000022;
    *(void *)(v36 + 8) = 0x800000010001D3E0;
    *(unsigned char *)(v36 + 16) = 0;
    swift_willThrow();
  }
  return v31;
}

uint64_t sub_100013994()
{
  uint64_t v0 = sub_10001B620();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004414(&qword_100025390);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10001B630();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v30 - v12;
  sub_10001B640();
  uint64_t v14 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_100004A84((uint64_t)v6, &qword_100025390);
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v15 = 0xD00000000000001DLL;
    *(void *)(v15 + 8) = 0x800000010001D670;
    *(unsigned char *)(v15 + 16) = 1;
    swift_willThrow();
    return v14;
  }
  id v31 = v3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  id v16 = [objc_allocWithZone((Class)FLSchemaFLInteractionDonationContext) init];
  if (!v16)
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD000000000000024;
    *(void *)(v22 + 8) = 0x800000010001D690;
    *(unsigned char *)(v22 + 16) = 0;
    swift_willThrow();
LABEL_11:
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    return v14;
  }
  uint64_t v14 = (uint64_t)v16;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v11, v7);
  if (v17 != enum case for IntelligenceFlowFeedbackLearning.Event.InteractionDonation.StateInfo.started(_:))
  {
    if (v17 != enum case for IntelligenceFlowFeedbackLearning.Event.InteractionDonation.StateInfo.ended(_:))
    {
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v26 = 0xD00000000000001DLL;
      *(void *)(v26 + 8) = 0x800000010001D670;
      *(unsigned char *)(v26 + 16) = 2;
      swift_willThrow();

      uint64_t v14 = *(void *)(v8 + 8);
      ((void (*)(char *, uint64_t))v14)(v13, v7);
      ((void (*)(char *, uint64_t))v14)(v11, v7);
      return v14;
    }
    (*(void (**)(char *, uint64_t))(v8 + 96))(v11, v7);
    uint64_t v23 = (uint64_t)v31;
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v31, v11, v0);
    uint64_t v24 = v32;
    id v25 = sub_100012ED0(v23);
    if (!v24)
    {
      uint64_t v29 = v25;
      [(id)v14 setEnded:v25];

      (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v23, v0);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      return v14;
    }

    (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v23, v0);
    goto LABEL_11;
  }
  uint64_t v18 = v13;
  uint64_t v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  id v20 = [objc_allocWithZone((Class)FLSchemaFLInteractionDonationStarted) init];
  if (v20)
  {
    uint64_t v21 = v20;
    [v20 setExists:1];
    [(id)v14 setStartedOrChanged:v21];

    v19(v18, v7);
  }
  else
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v27 = 0xD000000000000024;
    *(void *)(v27 + 8) = 0x800000010001D2D0;
    *(unsigned char *)(v27 + 16) = 0;
    swift_willThrow();

    v19(v13, v7);
  }
  return v14;
}

id sub_100013F08()
{
  uint64_t v1 = sub_10001B650();
  uint64_t v62 = *(void *)(v1 - 8);
  uint64_t v63 = v1;
  __chkstk_darwin(v1);
  uint64_t v61 = (char *)&v60 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001B590();
  uint64_t v65 = *(void *)(v3 - 8);
  uint64_t v66 = v3;
  __chkstk_darwin(v3);
  uint64_t v64 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100004414(&qword_1000253A8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_10001B4F0();
  uint64_t v8 = *(void *)(v68 - 8);
  uint64_t v9 = __chkstk_darwin(v68);
  uint64_t v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v67 = (char *)&v60 - v12;
  uint64_t v13 = sub_100004414(&qword_1000253B0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10001B660();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v69 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = [objc_allocWithZone((Class)FLSchemaFLClientEvent) init];
  id v20 = v19;
  if (!v19)
  {
    sub_100014858();
    swift_allocError();
    *(void *)uint64_t v22 = 0xD000000000000015;
    *(void *)(v22 + 8) = 0x800000010001D730;
    *(unsigned char *)(v22 + 16) = 0;
    swift_willThrow();
    return v20;
  }
  id v70 = v19;
  uint64_t v21 = sub_10000DB5C();
  if (!v0)
  {
    uint64_t v23 = v21;
    uint64_t v60 = 0;
    id v24 = v70;
    [v70 setEventMetadata:v21];

    sub_10001B670();
    uint64_t v25 = v17;
    uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    uint64_t v27 = v16;
    if (v26(v15, 1, v16) == 1)
    {
      sub_100004A84((uint64_t)v15, &qword_1000253B0);
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v28 = 0xD000000000000017;
      *(void *)(v28 + 8) = 0x800000010001D750;
      *(unsigned char *)(v28 + 16) = 1;
      swift_willThrow();

      return v24;
    }
    uint64_t v29 = v69;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v69, v15, v16);
    sub_10001B500();
    uint64_t v30 = v8;
    uint64_t v31 = v68;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, v68) == 1)
    {
      sub_100004A84((uint64_t)v7, &qword_1000253A8);
      sub_100014858();
      swift_allocError();
      *(void *)uint64_t v32 = 0xD00000000000001DLL;
      *(void *)(v32 + 8) = 0x800000010001D770;
      *(unsigned char *)(v32 + 16) = 1;
      swift_willThrow();
      id v33 = v70;

      (*(void (**)(char *, uint64_t))(v25 + 8))(v29, v27);
      return v33;
    }
    uint64_t v34 = v67;
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v67, v7, v31);
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v11, v34, v31);
    int v35 = (*(uint64_t (**)(char *, uint64_t))(v30 + 88))(v11, v31);
    if (v35 == enum case for IntelligenceFlowFeedbackLearning.Event.EventValue.actionEvaluation(_:))
    {
      (*(void (**)(char *, uint64_t))(v30 + 96))(v11, v31);
      (*(void (**)(char *, char *, uint64_t))(v65 + 32))(v64, v11, v66);
      uint64_t v36 = v60;
      if (qword_100025BD0 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_10001B880();
      sub_100005C3C(v37, (uint64_t)qword_100025DD8);
      double v38 = sub_10001B860();
      os_log_type_t v39 = sub_10001B980();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "Making Feedback Learning action Evaluation", v40, 2u);
        swift_slowDealloc();
      }

      uint64_t v41 = v64;
      uint64_t v42 = sub_100011884();
      if (v36)
      {
        id v33 = v70;

        uint64_t v44 = v65;
        uint64_t v43 = v66;
LABEL_23:
        (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v43);
        (*(void (**)(char *, uint64_t))(v30 + 8))(v67, v31);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v69, v27);
        return v33;
      }
      uint64_t v55 = (void *)v42;
      [v70 setEvaluationContext:v42];

      uint64_t v57 = v65;
      uint64_t v56 = v66;
    }
    else
    {
      uint64_t v45 = v60;
      if (v35 != enum case for IntelligenceFlowFeedbackLearning.Event.EventValue.interactionDonation(_:))
      {
        sub_100014858();
        swift_allocError();
        *(_OWORD *)uint64_t v52 = xmmword_10001C560;
        *(unsigned char *)(v52 + 16) = 2;
        swift_willThrow();
        id v53 = v70;

        uint64_t v54 = *(void (**)(char *, uint64_t))(v30 + 8);
        v54(v67, v31);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v69, v27);
        id v20 = v53;
        v54(v11, v31);
        return v20;
      }
      (*(void (**)(char *, uint64_t))(v30 + 96))(v11, v31);
      (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v61, v11, v63);
      if (qword_100025BD0 != -1) {
        swift_once();
      }
      uint64_t v46 = sub_10001B880();
      sub_100005C3C(v46, (uint64_t)qword_100025DD8);
      double v47 = sub_10001B860();
      os_log_type_t v48 = sub_10001B980();
      if (os_log_type_enabled(v47, v48))
      {
        uint64_t v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v49 = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, v48, "Making Feedback Learning interaction donation", v49, 2u);
        swift_slowDealloc();
      }

      uint64_t v41 = v61;
      uint64_t v50 = sub_100013994();
      if (v45)
      {
        id v33 = v70;

        uint64_t v44 = v62;
        uint64_t v43 = v63;
        goto LABEL_23;
      }
      unint64_t v58 = (void *)v50;
      [v70 setDonationContext:v50];

      uint64_t v57 = v62;
      uint64_t v56 = v63;
    }
    (*(void (**)(char *, uint64_t))(v57 + 8))(v41, v56);
    unint64_t v59 = v69;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v67, v31);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v59, v27);
    return v70;
  }
  id v20 = v70;

  return v20;
}

uint64_t sub_100014840(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100014858()
{
  unint64_t result = qword_100025238;
  if (!qword_100025238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025238);
  }
  return result;
}

uint64_t type metadata accessor for IFFeedbackLearningEventConverter()
{
  return self;
}

uint64_t sub_1000148D4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for IFFeedbackLearningEventConverter.ConversionError(uint64_t a1)
{
  return sub_100014840(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s23IFTelemetrySELFIngestor32IFFeedbackLearningEventConverterC15ConversionErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1000148D4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for IFFeedbackLearningEventConverter.ConversionError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1000148D4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100014840(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for IFFeedbackLearningEventConverter.ConversionError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IFFeedbackLearningEventConverter.ConversionError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100014840(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for IFFeedbackLearningEventConverter.ConversionError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IFFeedbackLearningEventConverter.ConversionError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_100014A88(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100014A90(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for IFFeedbackLearningEventConverter.ConversionError()
{
  return &type metadata for IFFeedbackLearningEventConverter.ConversionError;
}

uint64_t sub_100014AA8(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for FLSchemaFLEvaluationSource()
{
  if (!qword_1000253B8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000253B8);
    }
  }
}

uint64_t sub_100014B3C()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025DF0);
  sub_100005C3C(v0, (uint64_t)qword_100025DF0);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_100014BD0()
{
  if (qword_100025C60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025DF0);
}

uint64_t sub_100014C34@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025C60 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025DF0);
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

id sub_100014CDC(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024EC8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v44 - v6;
  uint64_t v8 = sub_100004414(&qword_100024ED0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v44 - v12;
  uint64_t v14 = sub_100004414(&qword_100024ED8);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10001B170();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  id v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = [objc_allocWithZone((Class)IFPlatformSchemaIFPlatformClientEventMetadata) init];
  if (v21)
  {
    uint64_t v46 = v20;
    uint64_t v49 = v5;
    id v51 = v21;
    sub_10000833C(a1, (uint64_t)v7);
    uint64_t v22 = sub_10001B220();
    uint64_t v23 = *(void *)(v22 - 8);
    os_log_type_t v48 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
    int v24 = v48(v7, 1, v22);
    uint64_t v50 = v23;
    if (v24 == 1)
    {
      sub_100004A84((uint64_t)v7, &qword_100024EC8);
    }
    else
    {
      uint64_t v47 = a1;
      uint64_t v45 = v11;
      sub_10001B210();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v22);
      uint64_t v28 = sub_10001B2A0();
      uint64_t v29 = *(void *)(v28 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v13, 1, v28) != 1)
      {
        sub_10001B290();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v28);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v16, 0, 1, v17);
        int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
        uint64_t v11 = v45;
        a1 = v47;
        uint64_t v30 = (uint64_t)v49;
        if (v35 != 1)
        {
          uint64_t v36 = v46;
          (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v46, v16, v17);
          id v37 = objc_allocWithZone((Class)SISchemaUUID);
          Class isa = sub_10001B150().super.isa;
          id v39 = [v37 initWithNSUUID:isa];

          [v51 setIfSessionId:v39];
          a1 = v47;
          (*(void (**)(char *, uint64_t))(v18 + 8))(v36, v17);
LABEL_11:
          uint64_t v31 = v50;
          sub_10000833C(a1, v30);
          if (v48((char *)v30, 1, v22) == 1)
          {
            sub_100004A84(v30, &qword_100024EC8);
            return v51;
          }
          else
          {
            sub_10001B210();
            (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v22);
            uint64_t v32 = sub_10001B2A0();
            uint64_t v33 = *(void *)(v32 - 8);
            int v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48))(v11, 1, v32);
            id v27 = v51;
            if (v34 == 1)
            {
              sub_100004A84((uint64_t)v11, &qword_100024ED0);
            }
            else
            {
              uint64_t v40 = sub_10001B280();
              char v42 = v41;
              (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v32);
              if ((v42 & 1) == 0) {
                [v27 setPostingSpanId:v40];
              }
            }
          }
          return v27;
        }
LABEL_10:
        sub_100004A84((uint64_t)v16, &qword_100024ED8);
        goto LABEL_11;
      }
      sub_100004A84((uint64_t)v13, &qword_100024ED0);
      uint64_t v11 = v45;
      a1 = v47;
    }
    uint64_t v30 = (uint64_t)v49;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
    goto LABEL_10;
  }
  if (qword_100025C60 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_10001B880();
  sub_100005C3C(v25, (uint64_t)qword_100025DF0);
  sub_100003434(0xD000000000000039, 0x800000010001D790, v26);
  return 0;
}

uint64_t type metadata accessor for IFPlatformClientEventMetadataConverter()
{
  return self;
}

uint64_t sub_100015304()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025E08);
  sub_100005C3C(v0, (uint64_t)qword_100025E08);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_100015398()
{
  if (qword_100025C68 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025E08);
}

uint64_t sub_1000153FC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025C68 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025E08);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_1000154A4()
{
  uint64_t v0 = sub_100004414(&qword_100024D80);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v22 - v4;
  id v6 = [objc_allocWithZone((Class)IFPlatformSchemaIFPlatformTargetEnded) init];
  if (!v6)
  {
    if (qword_100025C68 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10001B880();
    sub_100005C3C(v13, (uint64_t)qword_100025E08);
    sub_100003434(0xD00000000000003ELL, 0x800000010001D820, v14);
    return 0;
  }
  uint64_t v7 = v6;
  id v8 = [objc_allocWithZone((Class)IFTSchemaIFTIntelligenceFlowError) init];
  if (!v8)
  {
    if (qword_100025C68 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_10001B880();
    sub_100005C3C(v15, (uint64_t)qword_100025E08);
    sub_100003434(0xD000000000000038, 0x800000010001CC60, v16);

    return 0;
  }
  uint64_t v9 = v8;
  sub_10001B720();
  uint64_t v10 = sub_10001B700();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v5, 1, v10) == 1)
  {
    sub_100006048((uint64_t)v5);
  }
  else
  {
    uint64_t v17 = sub_10001B6E0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
    if ((v17 & 0x100000000) == 0) {
      [v9 setCode:v17];
    }
  }
  sub_10001B720();
  if (v12(v3, 1, v10) == 1)
  {
    sub_100006048((uint64_t)v3);
  }
  else
  {
    sub_10001B6F0();
    uint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v3, v10);
    if (v19)
    {
      NSString v20 = sub_10001B8D0();
      swift_bridgeObjectRelease();
      [v9 setDomain:v20];
    }
  }
  [v7 setHandledError:v9];

  return v7;
}

uint64_t type metadata accessor for IFPlatformTargetEndedConverter()
{
  return self;
}

uint64_t sub_1000157F4()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025E20);
  sub_100005C3C(v0, (uint64_t)qword_100025E20);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_100015888()
{
  if (qword_100025C70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025E20);
}

uint64_t sub_1000158EC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025C70 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025E20);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

id sub_100015994(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024EC8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v44 - v6;
  uint64_t v8 = sub_100004414(&qword_100024ED0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v44 - v12;
  uint64_t v14 = sub_100004414(&qword_100024ED8);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10001B170();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  NSString v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = [objc_allocWithZone((Class)IFPlatformRequestSchemaIFPlatformRequestClientEventMetadata) init];
  if (v21)
  {
    uint64_t v46 = v20;
    uint64_t v49 = v17;
    id v51 = v21;
    sub_10000833C(a1, (uint64_t)v7);
    uint64_t v22 = sub_10001B220();
    uint64_t v23 = *(void *)(v22 - 8);
    os_log_type_t v48 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
    int v24 = v48(v7, 1, v22);
    uint64_t v50 = v23;
    if (v24 == 1)
    {
      sub_100004A84((uint64_t)v7, &qword_100024EC8);
    }
    else
    {
      uint64_t v47 = a1;
      uint64_t v45 = v11;
      sub_10001B210();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v22);
      uint64_t v28 = sub_10001B2A0();
      uint64_t v29 = *(void *)(v28 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v13, 1, v28) != 1)
      {
        sub_10001B260();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v28);
        uint64_t v34 = v49;
        int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v49);
        uint64_t v11 = v45;
        a1 = v47;
        if (v35 != 1)
        {
          uint64_t v36 = v46;
          (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v46, v16, v34);
          id v37 = objc_allocWithZone((Class)SISchemaUUID);
          Class isa = sub_10001B150().super.isa;
          id v39 = [v37 initWithNSUUID:isa];

          [v51 setIfRequestId:v39];
          a1 = v47;
          (*(void (**)(char *, uint64_t))(v18 + 8))(v36, v34);
LABEL_11:
          uint64_t v30 = v50;
          sub_10000833C(a1, (uint64_t)v5);
          if (v48(v5, 1, v22) == 1)
          {
            sub_100004A84((uint64_t)v5, &qword_100024EC8);
            return v51;
          }
          else
          {
            sub_10001B210();
            (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v22);
            uint64_t v31 = sub_10001B2A0();
            uint64_t v32 = *(void *)(v31 - 8);
            int v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48))(v11, 1, v31);
            id v27 = v51;
            if (v33 == 1)
            {
              sub_100004A84((uint64_t)v11, &qword_100024ED0);
            }
            else
            {
              uint64_t v40 = sub_10001B280();
              char v42 = v41;
              (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v31);
              if ((v42 & 1) == 0) {
                [v27 setPostingSpanId:v40];
              }
            }
          }
          return v27;
        }
LABEL_10:
        sub_100004A84((uint64_t)v16, &qword_100024ED8);
        goto LABEL_11;
      }
      sub_100004A84((uint64_t)v13, &qword_100024ED0);
      uint64_t v11 = v45;
      a1 = v47;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v49);
    goto LABEL_10;
  }
  if (qword_100025C70 != -1) {
    swift_once();
  }
  uint64_t v25 = sub_10001B880();
  sub_100005C3C(v25, (uint64_t)qword_100025E20);
  sub_100003434(0xD000000000000041, 0x800000010001D8A0, v26);
  return 0;
}

uint64_t type metadata accessor for IFPlatformRequestMetadataConverter()
{
  return self;
}

uint64_t sub_100015F94()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025E38);
  sub_100005C3C(v0, (uint64_t)qword_100025E38);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_10001602C()
{
  if (qword_100025C78 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025E38);
}

uint64_t sub_100016090@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025C78 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025E38);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_100016138()
{
  uint64_t v0 = sub_100004414(&qword_100024D80);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v22 - v4;
  id v6 = [objc_allocWithZone((Class)IFPlatformSchemaIFPlatformTargetFailed) init];
  if (!v6)
  {
    if (qword_100025C78 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10001B880();
    sub_100005C3C(v13, (uint64_t)qword_100025E38);
    sub_100003434(0xD00000000000003FLL, 0x800000010001D940, v14);
    return 0;
  }
  uint64_t v7 = v6;
  id v8 = [objc_allocWithZone((Class)IFTSchemaIFTIntelligenceFlowError) init];
  if (!v8)
  {
    if (qword_100025C78 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_10001B880();
    sub_100005C3C(v15, (uint64_t)qword_100025E38);
    sub_100003434(0xD000000000000038, 0x800000010001CC60, v16);

    return 0;
  }
  uint64_t v9 = v8;
  sub_10001B740();
  uint64_t v10 = sub_10001B700();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v5, 1, v10) == 1)
  {
    sub_100006048((uint64_t)v5);
  }
  else
  {
    uint64_t v17 = sub_10001B6E0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
    if ((v17 & 0x100000000) == 0) {
      [v9 setCode:v17];
    }
  }
  sub_10001B740();
  if (v12(v3, 1, v10) == 1)
  {
    sub_100006048((uint64_t)v3);
  }
  else
  {
    sub_10001B6F0();
    uint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v3, v10);
    if (v19)
    {
      NSString v20 = sub_10001B8D0();
      swift_bridgeObjectRelease();
      [v9 setDomain:v20];
    }
  }
  [v7 setCriticalError:v9];

  return v7;
}

uint64_t type metadata accessor for IFPlatformTargetFailedConverter()
{
  return self;
}

uint64_t sub_100016488()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025E50);
  sub_100005C3C(v0, (uint64_t)qword_100025E50);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_10001651C()
{
  if (qword_100025C80 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025E50);
}

uint64_t sub_100016580@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025C80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025E50);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_100016628(uint64_t a1)
{
  uint64_t v2 = sub_10001B7B0();
  uint64_t v113 = *(void *)(v2 - 8);
  uint64_t v114 = v2;
  __chkstk_darwin(v2);
  unint64_t v112 = (char *)&v100 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100004414(&qword_100025620);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v104 = (uint64_t)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v105 = (uint64_t)&v100 - v7;
  uint64_t v8 = sub_100004414(&qword_100025628);
  __chkstk_darwin(v8 - 8);
  uint64_t v117 = (char *)&v100 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10001B7E0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v107 = v10;
  uint64_t v108 = v11;
  __chkstk_darwin(v10);
  uint64_t v106 = (char *)&v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100004414(&qword_100024EC0);
  __chkstk_darwin(v13 - 8);
  uint64_t v115 = (char *)&v100 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = sub_10001B810();
  uint64_t v109 = *(void *)(v111 - 8);
  __chkstk_darwin(v111);
  v110 = (char *)&v100 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100004414(&qword_100024EC8);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v19 = (char *)&v100 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  id v21 = (char *)&v100 - v20;
  uint64_t v22 = sub_100004414(&qword_100024ED0);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  uint64_t v25 = (char *)&v100 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  id v27 = (char *)&v100 - v26;
  uint64_t v28 = sub_100004414(&qword_100024ED8);
  __chkstk_darwin(v28 - 8);
  uint64_t v30 = (char *)&v100 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_10001B170();
  uint64_t v118 = *(void *)(v116 - 8);
  uint64_t v31 = __chkstk_darwin(v116);
  uint64_t v103 = (char *)&v100 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  uint64_t v34 = (char *)&v100 - v33;
  uint64_t v35 = sub_100004414(&qword_100024E20);
  __chkstk_darwin(v35 - 8);
  id v37 = (char *)&v100 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = a1;
  sub_10001B200();
  char v38 = sub_1000176B0((uint64_t)v37);
  sub_100004A84((uint64_t)v37, &qword_100024E20);
  id v39 = 0;
  if ((v38 & 1) == 0) {
    return v39;
  }
  id v40 = [objc_allocWithZone((Class)PGSchemaPGClientEventMetadata) init];
  if (!v40)
  {
    if (qword_100025C80 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_10001B880();
    sub_100005C3C(v43, (uint64_t)qword_100025E50);
    sub_100003434(0xD00000000000003FLL, 0x800000010001D9C0, v44);
    return 0;
  }
  id v102 = v40;
  sub_10001B230();
  uint64_t v41 = sub_10001B220();
  uint64_t v42 = *(void *)(v41 - 8);
  unint64_t v101 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
  if (v101(v21, 1, v41) == 1)
  {
    sub_100004A84((uint64_t)v21, &qword_100024EC8);
LABEL_10:
    uint64_t v47 = v116;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v118 + 56))(v30, 1, 1, v116);
LABEL_11:
    sub_100004A84((uint64_t)v30, &qword_100024ED8);
    goto LABEL_12;
  }
  sub_10001B210();
  uint64_t v100 = v42;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v21, v41);
  uint64_t v45 = sub_10001B2A0();
  uint64_t v46 = *(void *)(v45 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v27, 1, v45) == 1)
  {
    sub_100004A84((uint64_t)v27, &qword_100024ED0);
    uint64_t v42 = v100;
    goto LABEL_10;
  }
  sub_10001B260();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v27, v45);
  uint64_t v47 = v116;
  int v64 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v118 + 48))(v30, 1, v116);
  uint64_t v42 = v100;
  if (v64 == 1) {
    goto LABEL_11;
  }
  uint64_t v65 = v118;
  (*(void (**)(char *, char *, uint64_t))(v118 + 32))(v34, v30, v47);
  id v66 = objc_allocWithZone((Class)SISchemaUUID);
  Class isa = sub_10001B150().super.isa;
  id v68 = [v66 initWithNSUUID:isa];

  [v102 setIfRequestId:v68];
  uint64_t v69 = v65;
  uint64_t v42 = v100;
  (*(void (**)(char *, uint64_t))(v69 + 8))(v34, v47);
LABEL_12:
  sub_10001B230();
  unsigned int v48 = v101(v19, 1, v41);
  uint64_t v49 = (uint64_t)v115;
  if (v48 == 1)
  {
    uint64_t v50 = &qword_100024EC8;
    uint64_t v51 = (uint64_t)v19;
  }
  else
  {
    sub_10001B210();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v19, v41);
    uint64_t v52 = sub_10001B2A0();
    uint64_t v53 = *(void *)(v52 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v25, 1, v52) != 1)
    {
      uint64_t v70 = sub_10001B280();
      char v72 = v71;
      (*(void (**)(char *, uint64_t))(v53 + 8))(v25, v52);
      uint64_t v55 = v113;
      uint64_t v54 = v114;
      uint64_t v56 = v112;
      if ((v72 & 1) == 0) {
        [v102 setPostingSpanId:v70];
      }
      goto LABEL_17;
    }
    uint64_t v50 = &qword_100024ED0;
    uint64_t v51 = (uint64_t)v25;
  }
  sub_100004A84(v51, v50);
  uint64_t v55 = v113;
  uint64_t v54 = v114;
  uint64_t v56 = v112;
LABEL_17:
  sub_10001B250();
  uint64_t v57 = sub_10001B240();
  uint64_t v58 = *(void *)(v57 - 8);
  int v59 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v49, 1, v57);
  uint64_t v60 = (uint64_t)v117;
  if (v59 == 1)
  {
    sub_100004A84(v49, &qword_100024EC0);
LABEL_27:
    if (qword_100025C80 != -1) {
      swift_once();
    }
    uint64_t v73 = sub_10001B880();
    sub_100005C3C(v73, (uint64_t)qword_100025E50);
    sub_100003434(0xD00000000000003ALL, 0x800000010001DA00, v74);

    return 0;
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v58 + 88))(v49, v57) != enum case for IntelligenceFlowTelemetry.Objective.planGeneration(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v49, v57);
    goto LABEL_27;
  }
  (*(void (**)(uint64_t, uint64_t))(v58 + 96))(v49, v57);
  uint64_t v61 = v109;
  (*(void (**)(char *, uint64_t, uint64_t))(v109 + 32))(v110, v49, v111);
  sub_10001B800();
  uint64_t v62 = sub_10001B7F0();
  uint64_t v63 = *(void *)(v62 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v60, 1, v62) == 1)
  {
    sub_100004A84(v60, &qword_100025628);
LABEL_38:
    if (qword_100025C80 != -1) {
      swift_once();
    }
    uint64_t v83 = sub_10001B880();
    sub_100005C3C(v83, (uint64_t)qword_100025E50);
    sub_100003434(0xD000000000000043, 0x800000010001DA40, v84);

    (*(void (**)(char *, uint64_t))(v61 + 8))(v110, v111);
    return 0;
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v63 + 88))(v60, v62) != enum case for PlanGeneration.Event.planCreation(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v60, v62);
    goto LABEL_38;
  }
  (*(void (**)(uint64_t, uint64_t))(v63 + 96))(v60, v62);
  uint64_t v75 = swift_projectBox();
  (*(void (**)(char *, uint64_t, uint64_t))(v108 + 16))(v106, v75, v107);
  swift_release();
  uint64_t v76 = v105;
  sub_10001B7D0();
  uint64_t v77 = sub_10001B7C0();
  uint64_t v78 = *(void *)(v77 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v76, 1, v77) == 1) {
    goto LABEL_32;
  }
  uint64_t v85 = v104;
  sub_100007A04(v76, v104, &qword_100025620);
  int v86 = (*(uint64_t (**)(uint64_t, uint64_t))(v78 + 88))(v85, v77);
  if (v86 != enum case for PlanGeneration.Event.PlanCreation.StateInfo.started(_:))
  {
    if (v86 == enum case for PlanGeneration.Event.PlanCreation.StateInfo.ended(_:))
    {

      (*(void (**)(char *, uint64_t))(v108 + 8))(v106, v107);
      (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v111);
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v104, v77);
    }
    else
    {
      uint64_t v97 = v104;
      if (v86 != enum case for PlanGeneration.Event.PlanCreation.StateInfo.failed(_:))
      {
        (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v104, v77);
LABEL_32:
        if (qword_100025C80 != -1) {
          swift_once();
        }
        uint64_t v79 = sub_10001B880();
        sub_100005C3C(v79, (uint64_t)qword_100025E50);
        uint64_t v80 = sub_10001B860();
        os_log_type_t v81 = sub_10001B990();
        if (os_log_type_enabled(v80, v81))
        {
          v82 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v82 = 0;
          _os_log_impl((void *)&_mh_execute_header, v80, v81, "Unhandled plan generation state", v82, 2u);
          uint64_t v76 = v105;
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v108 + 8))(v106, v107);
        (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v111);
        goto LABEL_49;
      }

      (*(void (**)(char *, uint64_t))(v108 + 8))(v106, v107);
      (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v111);
      (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v97, v77);
    }
LABEL_49:
    uint64_t v98 = v76;
LABEL_50:
    sub_100004A84(v98, &qword_100025620);
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t))(v78 + 96))(v85, v77);
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 32))(v56, v85, v54);
  uint64_t v87 = v103;
  sub_10001B160();
  id v88 = objc_allocWithZone((Class)SISchemaUUID);
  Class v89 = sub_10001B150().super.isa;
  id v90 = [v88 initWithNSUUID:v89];

  (*(void (**)(char *, uint64_t))(v118 + 8))(v87, v47);
  id v91 = v102;
  uint64_t v92 = sub_10001795C((uint64_t)v102, (uint64_t)v90);
  if (!v92)
  {

    (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v54);
    (*(void (**)(char *, uint64_t))(v108 + 8))(v106, v107);
    (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v111);
    uint64_t v98 = v105;
    goto LABEL_50;
  }
  uint64_t v93 = v92;
  uint64_t v94 = sub_10001B7A0();
  id v39 = sub_100017B8C((uint64_t)v91, (uint64_t)v90, v94, v95);
  swift_bridgeObjectRelease();
  if (v39)
  {
    sub_100004414(&qword_100025630);
    uint64_t v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = xmmword_10001C750;
    *(void *)(v96 + 32) = v93;
    *(void *)(v96 + 40) = v39;
    uint64_t v120 = (void *)v96;
    sub_10001B940();
    id v39 = v120;
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v54);
  (*(void (**)(char *, uint64_t))(v108 + 8))(v106, v107);
  (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v111);
  sub_100004A84(v105, &qword_100025620);
  return v39;
}

uint64_t sub_1000176B0(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024E20);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B1E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v18 - v10;
  sub_100007A04(a1, (uint64_t)v4, &qword_100024E20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100004A84((uint64_t)v4, &qword_100024E20);
    if (qword_100025C80 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10001B880();
    sub_100005C3C(v12, (uint64_t)qword_100025E50);
    uint64_t v13 = sub_10001B860();
    os_log_type_t v14 = sub_10001B980();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "IntelligenceFlow.Telemetry event has no target so SELF PlanGeneration client event", v15, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v16(v11, v4, v5);
    v16(v9, v11, v5);
    if ((*(unsigned int (**)(char *, uint64_t))(v6 + 88))(v9, v5) == enum case for IntelligenceFlowTarget.fullPlannerPromptGeneratorMakePlan(_:)) {
      return 1;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return 0;
}

void *sub_10001795C(uint64_t a1, uint64_t a2)
{
  id v4 = [objc_allocWithZone((Class)PGSchemaPGClientEvent) init];
  if (!v4)
  {
    if (qword_100025C80 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_10001B880();
    sub_100005C3C(v10, (uint64_t)qword_100025E50);
    sub_100003434(0xD000000000000036, 0x800000010001DAD0, v11);
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = [objc_allocWithZone((Class)PGSchemaPGRequestContext) init];
  if (!v6)
  {
    if (qword_100025C80 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_10001B880();
    sub_100005C3C(v12, (uint64_t)qword_100025E50);
    sub_100003434(0xD000000000000040, 0x800000010001DB50, v13);
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  id v8 = [objc_allocWithZone((Class)PGSchemaPGRequestStarted) init];
  if (!v8)
  {
    if (qword_100025C80 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_10001B880();
    sub_100005C3C(v14, (uint64_t)qword_100025E50);
    sub_100003434(0xD000000000000048, 0x800000010001DBA0, v15);

LABEL_14:
    return 0;
  }
  uint64_t v9 = v8;
  [v8 setLinkId:a2];
  [v7 setStartedOrChanged:v9];
  [v5 setEventMetadata:a1];
  [v5 setPgRequestContext:v7];

  return v5;
}

void *sub_100017B8C(uint64_t a1, uint64_t a2, uint64_t a3, NSString a4)
{
  id v7 = [objc_allocWithZone((Class)PGSchemaPGClientEvent) init];
  if (!v7)
  {
    if (qword_100025C80 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10001B880();
    sub_100005C3C(v11, (uint64_t)qword_100025E50);
    sub_100003434(0xD000000000000036, 0x800000010001DAD0, v12);
    return 0;
  }
  id v8 = v7;
  id v9 = [objc_allocWithZone((Class)PGSchemaPGPromptTier1) init];
  if (!v9)
  {
    if (qword_100025C80 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_10001B880();
    sub_100005C3C(v13, (uint64_t)qword_100025E50);
    sub_100003434(0xD00000000000003CLL, 0x800000010001DB10, v14);

    return 0;
  }
  uint64_t v10 = v9;
  [v9 setLinkId:a2];
  if (a4) {
    a4 = sub_10001B8D0();
  }
  [v10 setPrompt:a4];

  [v8 setEventMetadata:a1];
  [v8 setPgPromptTier1:v10];

  return v8;
}

uint64_t type metadata accessor for IFPlanGenerationEventConverter()
{
  return self;
}

uint64_t sub_100017D70()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025E68);
  sub_100005C3C(v0, (uint64_t)qword_100025E68);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_100017E04()
{
  if (qword_100025C88 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025E68);
}

uint64_t sub_100017E68@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025C88 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025E68);
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

void *sub_100017F10(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024EC0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v7 = (char *)&v34 - v6;
  uint64_t v8 = sub_10001B790();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v38 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100004414(&qword_100024EC8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100004414(&qword_100024E20);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IFPlatformRequestTargetConverter();
  sub_10001B200();
  unint64_t v17 = sub_1000185FC((uint64_t)v16);
  sub_100004A84((uint64_t)v16, &qword_100024E20);
  uint64_t v18 = 0;
  if ((v17 & 0x100000000) == 0)
  {
    id v19 = [objc_allocWithZone((Class)IFPlatformRequestSchemaIFPlatformRequestClientEvent) init];
    if (v19)
    {
      uint64_t v18 = v19;
      uint64_t v35 = v9;
      uint64_t v36 = v8;
      type metadata accessor for IFPlatformRequestMetadataConverter();
      sub_10001B230();
      id v20 = sub_100015994((uint64_t)v13);
      sub_100004A84((uint64_t)v13, &qword_100024EC8);
      [v18 setEventMetadata:v20];

      uint64_t v37 = a1;
      sub_10001B250();
      uint64_t v21 = sub_10001B240();
      uint64_t v22 = *(void *)(v21 - 8);
      uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
      if (v23(v7, 1, v21) == 1)
      {
        sub_100004A84((uint64_t)v7, &qword_100024EC0);
      }
      else
      {
        if ((*(unsigned int (**)(char *, uint64_t))(v22 + 88))(v7, v21) == enum case for IntelligenceFlowTelemetry.Objective.pnr(_:))
        {
          (*(void (**)(char *, uint64_t))(v22 + 96))(v7, v21);
          uint64_t v27 = v35;
          uint64_t v26 = v36;
          uint64_t v28 = (uint64_t)v38;
          (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v38, v7, v36);
          type metadata accessor for IFPlatformRequestContextConverter();
          char v39 = 0;
          uint64_t v29 = sub_100008E50(v28, v17);
          [v18 setIfPlatformRequestContext:v29];

          (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v26);
          return v18;
        }
        (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v21);
      }
      sub_10001B250();
      if (v23(v5, 1, v21) == 1)
      {
        sub_100004A84((uint64_t)v5, &qword_100024EC0);
      }
      else
      {
        int v30 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v5, v21);
        int v31 = enum case for IntelligenceFlowTelemetry.Objective.impendingRequestDetected(_:);
        (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v21);
        if (v30 == v31)
        {
          type metadata accessor for IFPlatformRequestInvokedConverter();
          sub_10001B230();
          id v32 = sub_100007C08((uint64_t)v13);
          sub_100004A84((uint64_t)v13, &qword_100024EC8);
          [v18 setIfPlatformRequestInvoked:v32];
        }
      }
    }
    else
    {
      if (qword_100025C88 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_10001B880();
      sub_100005C3C(v24, (uint64_t)qword_100025E68);
      sub_100003434(0xD000000000000038, 0x800000010001DC10, v25);
      return 0;
    }
  }
  return v18;
}

uint64_t type metadata accessor for IFPlatformRequestClientEventConverter()
{
  return self;
}

uint64_t sub_10001845C()
{
  uint64_t v0 = sub_10001B880();
  sub_1000060F4(v0, qword_100025E80);
  sub_100005C3C(v0, (uint64_t)qword_100025E80);
  sub_10000467C();
  sub_10001B9A0();
  return sub_10001B890();
}

uint64_t sub_1000184F0()
{
  if (qword_100025C90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001B880();

  return sub_100005C3C(v0, (uint64_t)qword_100025E80);
}

uint64_t sub_100018554@<X0>(uint64_t a1@<X8>)
{
  if (qword_100025C90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001B880();
  uint64_t v3 = sub_100005C3C(v2, (uint64_t)qword_100025E80);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_1000185FC(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100024E20);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10001B1E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v31 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v31 - v13;
  sub_100008B6C(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_100008BD4((uint64_t)v4);
    if (qword_100025C90 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_10001B880();
    sub_100005C3C(v15, (uint64_t)qword_100025E80);
    uint64_t v16 = sub_10001B860();
    os_log_type_t v17 = sub_10001B980();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "IntelligenceFlow.Telemetry event has no target so no platform request event target", v18, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v14, v4, v5);
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v21(v12, v14, v5);
    int v22 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v12, v5);
    if (v22 == enum case for IntelligenceFlowTarget.standardPlannerMakePlan(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 1;
      goto LABEL_24;
    }
    if (v22 == enum case for IntelligenceFlowTarget.standardPlannerRun(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 2;
      goto LABEL_24;
    }
    if (v22 == enum case for IntelligenceFlowTarget.queryDecorationServiceHandle(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 101;
      goto LABEL_24;
    }
    if (v22 == enum case for IntelligenceFlowTarget.planOverridesServiceHandle(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 201;
      goto LABEL_24;
    }
    if (v22 == enum case for IntelligenceFlowTarget.fullPlannerServiceHandle(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 301;
      goto LABEL_24;
    }
    if (v22 == enum case for IntelligenceFlowTarget.planResolverServiceHandle(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 401;
      goto LABEL_24;
    }
    if (v22 == enum case for IntelligenceFlowTarget.responseGenerationServiceHandle(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 501;
      goto LABEL_24;
    }
    if (v22 == enum case for IntelligenceFlowTarget.sessionCoordinatorAccept(_:))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
      unsigned __int8 v20 = 0;
      uint64_t v19 = 601;
      goto LABEL_24;
    }
    if (qword_100025C90 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_10001B880();
    sub_100005C3C(v24, (uint64_t)qword_100025E80);
    v21(v9, v14, v5);
    uint64_t v25 = sub_10001B860();
    os_log_type_t v26 = sub_10001B980();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v34 = v32;
      *(_DWORD *)uint64_t v27 = 136315138;
      int v31 = v27 + 4;
      sub_100008C34();
      uint64_t v28 = sub_10001BAE0();
      uint64_t v33 = sub_100003B08(v28, v29, &v34);
      sub_10001B9C0();
      swift_bridgeObjectRelease();
      int v30 = *(void (**)(char *, uint64_t))(v6 + 8);
      v30(v9, v5);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Unrecognized IntelligenceFlow.Telemetry target %s so no platform request event target", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      int v30 = *(void (**)(char *, uint64_t))(v6 + 8);
      v30(v9, v5);
    }
    v30(v14, v5);
    v30(v12, v5);
  }
  uint64_t v19 = 0;
  unsigned __int8 v20 = 1;
LABEL_24:
  LOBYTE(v34) = v20;
  return v19 | ((unint64_t)v20 << 32);
}

uint64_t type metadata accessor for IFPlatformRequestTargetConverter()
{
  return self;
}

void *sub_100018C5C()
{
  return &unk_100021450;
}

unint64_t static IFDefaultsLib.sharedDomain.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_100018C84()
{
  sub_10000467C();
  sub_10001B9A0();

  return sub_10001B890();
}

uint64_t sub_100018D00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor13IFDefaultsLib_logger;
  uint64_t v4 = sub_10001B880();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

void *IFDefaultsLib.userDefaults.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor13IFDefaultsLib_userDefaults);
  id v2 = v1;
  return v1;
}

uint64_t IFDefaultsLib.__allocating_init(domain:)()
{
  uint64_t v0 = swift_allocObject();
  IFDefaultsLib.init(domain:)();
  return v0;
}

uint64_t IFDefaultsLib.init(domain:)()
{
  uint64_t v1 = v0;
  sub_10000467C();
  sub_10001B9A0();
  sub_10001B890();
  id v2 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v3 = sub_10001B8D0();
  swift_bridgeObjectRelease();
  id v4 = [v2 initWithSuiteName:v3];

  *(void *)(v1 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor13IFDefaultsLib_userDefaults) = v4;
  return v1;
}

uint64_t IFDefaultsLib.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor13IFDefaultsLib_logger;
  uint64_t v2 = sub_10001B880();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t IFDefaultsLib.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor13IFDefaultsLib_logger;
  uint64_t v2 = sub_10001B880();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

void *sub_100019000()
{
  return &unk_100021460;
}

unint64_t static IFDefaultsLib.lastCollectionDateKey.getter()
{
  return 0xD000000000000015;
}

void *sub_100019028()
{
  return &unk_10001C840;
}

double sub_100019034()
{
  return 2419200.0;
}

uint64_t IFDefaultsLib.lastCollectionDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10001B130();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v25 - v8;
  sub_10001B110();
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor13IFDefaultsLib_userDefaults);
  if (v10)
  {
    NSString v11 = sub_10001B8D0();
    id v12 = [v10 valueForKey:v11];

    if (v12)
    {
      sub_10001B9E0();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v27, 0, sizeof(v27));
    }
    sub_100019AB0((uint64_t)v27, (uint64_t)&v28);
    if (*((void *)&v29 + 1))
    {
      sub_1000194D8((uint64_t)&v28);
      NSString v13 = sub_10001B8D0();
      [v10 doubleForKey:v13];
      uint64_t v15 = v14;

      uint64_t v16 = sub_10001B860();
      os_log_type_t v17 = sub_10001B980();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = swift_slowAlloc();
        uint64_t v26 = swift_slowAlloc();
        *(void *)&long long v28 = v26;
        *(_DWORD *)uint64_t v18 = 136315394;
        *(void *)&v27[0] = sub_100003B08(0xD000000000000015, 0x800000010001DD00, (uint64_t *)&v28);
        sub_10001B9C0();
        *(_WORD *)(v18 + 12) = 2048;
        *(void *)&v27[0] = v15;
        sub_10001B9C0();
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "The userdefault has key %s with the value %f", (uint8_t *)v18, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      sub_10001B0E0();
      sub_100019B18();
      if (sub_10001B8C0()) {
        uint64_t v19 = v7;
      }
      else {
        uint64_t v19 = v9;
      }
      (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))(a1, v19, v3);
      unsigned __int8 v20 = *(void (**)(char *, uint64_t))(v4 + 8);
      v20(v7, v3);
      return ((uint64_t (*)(char *, uint64_t))v20)(v9, v3);
    }
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }
  sub_1000194D8((uint64_t)&v28);
  int v22 = sub_10001B860();
  os_log_type_t v23 = sub_10001B980();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v28 = swift_slowAlloc();
    *(_DWORD *)uint64_t v24 = 136315138;
    *(void *)&v27[0] = sub_100003B08(0xD000000000000015, 0x800000010001DD00, (uint64_t *)&v28);
    sub_10001B9C0();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "The userdefault contained no value for %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v9, v3);
}

uint64_t sub_1000194D8(uint64_t a1)
{
  uint64_t v2 = sub_100004414(&qword_100025800);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100019538@<X0>(uint64_t a1@<X8>)
{
  return IFDefaultsLib.lastCollectionDate.getter(a1);
}

uint64_t sub_10001955C(uint64_t a1)
{
  uint64_t v2 = sub_10001B130();
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return IFDefaultsLib.lastCollectionDate.setter((uint64_t)v4);
}

uint64_t IFDefaultsLib.lastCollectionDate.setter(uint64_t a1)
{
  sub_10001B0F0();
  uint64_t v3 = sub_10001B860();
  os_log_type_t v4 = sub_10001B980();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    sub_100003B08(0xD000000000000015, 0x800000010001DD00, &v15);
    sub_10001B9C0();
    *(_WORD *)(v5 + 12) = 2048;
    sub_10001B9C0();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Set key %s to %f", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC23IFTelemetrySELFIngestor13IFDefaultsLib_userDefaults);
  if (v6)
  {
    id v7 = v6;
    Class isa = sub_10001B970().super.super.isa;
    NSString v9 = sub_10001B8D0();
    [v7 setValue:isa forKey:v9];
  }
  else
  {
    uint64_t v10 = sub_10001B860();
    os_log_type_t v11 = sub_10001B980();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)id v12 = 136315138;
      sub_100003B08(0xD000000000000015, 0x800000010001DD00, &v15);
      sub_10001B9C0();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Fail to set key %s due to empty userdefaults", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  uint64_t v13 = sub_10001B130();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
}

void (*IFDefaultsLib.lastCollectionDate.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = sub_10001B130();
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  id v7 = malloc(v6);
  v3[4] = v7;
  IFDefaultsLib.lastCollectionDate.getter((uint64_t)v7);
  return sub_1000199FC;
}

void sub_1000199FC(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = v2[1];
    uint64_t v6 = v2[2];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 24), v4, v5);
    IFDefaultsLib.lastCollectionDate.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    IFDefaultsLib.lastCollectionDate.setter(*(void *)(*(void *)a1 + 32));
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t sub_100019AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004414(&qword_100025800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100019B18()
{
  unint64_t result = qword_100025808;
  if (!qword_100025808)
  {
    sub_10001B130();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025808);
  }
  return result;
}

uint64_t sub_100019B70()
{
  return type metadata accessor for IFDefaultsLib();
}

uint64_t type metadata accessor for IFDefaultsLib()
{
  uint64_t result = qword_100025C98;
  if (!qword_100025C98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100019BC4()
{
  uint64_t result = sub_10001B880();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for IFDefaultsLib(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for IFDefaultsLib);
}

uint64_t dispatch thunk of IFDefaultsLib.__allocating_init(domain:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_100019C88()
{
  sub_100014AA8(0, (unint64_t *)&qword_100024CB8);
  sub_10001B9A0();

  return sub_10001B890();
}

uint64_t sub_100019D0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + qword_100025EA8;
  uint64_t v4 = sub_10001B880();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t sub_100019D80()
{
  return 0x656D656C65544649;
}

uint64_t sub_100019DA0()
{
  uint64_t v1 = *(void *)(v0 + qword_100025EB0);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_100019DDC()
{
  return *(void *)(v0 + qword_100025EB8);
}

uint64_t IFBiomeLib.__allocating_init(stream:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  IFBiomeLib.init(stream:)(a1);
  return v2;
}

uint64_t IFBiomeLib.init(stream:)(uint64_t a1)
{
  sub_100014AA8(0, (unint64_t *)&qword_100024CB8);
  sub_10001B9A0();
  sub_10001B890();
  uint64_t v3 = (void *)(v1 + qword_100025EB0);
  void *v3 = 0x656D656C65544649;
  v3[1] = 0xEB00000000797274;
  *(void *)(v1 + qword_100025EB8) = a1;
  return v1;
}

uint64_t sub_100019EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[17] = a6;
  v7[18] = v6;
  v7[15] = a4;
  v7[16] = a5;
  v7[13] = a2;
  v7[14] = a3;
  v7[12] = a1;
  v7[19] = *v6;
  sub_100004414(&qword_100025240);
  v7[20] = swift_task_alloc();
  v7[21] = swift_task_alloc();
  return _swift_task_switch(sub_100019FD0, 0, 0);
}

uint64_t sub_100019FD0()
{
  long long v29 = (void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v26 = *(void *)(v0 + 104);
  sub_100014AA8(0, &qword_1000258C0);
  uint64_t v4 = sub_10001B130();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v6(v1, v3, v4);
  id v7 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56);
  v7(v1, 0, 1, v4);
  v6(v2, v26, v4);
  v7(v2, 0, 1, v4);
  uint64_t v8 = (_OWORD *)(v0 + 16);
  uint64_t v9 = sub_10001A408(v1, v2, 0, 0, 0);
  sub_10001B820();
  long long v28 = v9;

  uint64_t v23 = *(void *)(v0 + 40);
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = v24;
  *(void *)(v24 + 16) = 0;
  if (!v23)
  {
    long long v10 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)long long v29 = *v8;
    *(_OWORD *)(v0 + 72) = v10;
    *(void *)(v0 + 88) = *(void *)(v0 + 48);
    uint64_t v11 = *(void *)(v0 + 80);
    if (!v11) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  sub_10001A598((uint64_t)v8, (uint64_t)v29);
  uint64_t v11 = *(void *)(v0 + 80);
  if (v11)
  {
LABEL_3:
    uint64_t v13 = *(void *)(v0 + 136);
    uint64_t v12 = *(void *)(v0 + 144);
    uint64_t v14 = *(void *)(v0 + 112);
    long long v27 = *(_OWORD *)(v0 + 120);
    sub_10001AB18(v29, v11);
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = v12;
    v15[3] = v25;
    v15[4] = v14;
    v15[5] = v27;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v12;
    *(void *)(v16 + 24) = v14;
    uint64_t v8 = (_OWORD *)(v0 + 16);
    *(_OWORD *)(v16 + 32) = v27;
    *(void *)(v16 + 48) = v13;
    *(void *)(v16 + 56) = v25;
    swift_retain_n();
    swift_retain_n();
    swift_retain_n();
    swift_retain();
    sub_10001B8A0();
    swift_release();
    swift_release();
    swift_release();
    sub_100004368((uint64_t)v29);
  }
LABEL_4:
  os_log_type_t v17 = sub_10001B860();
  os_log_type_t v18 = sub_10001B980();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "loadBiomeEvent completed.", v19, 2u);
    swift_slowDealloc();
    unsigned __int8 v20 = v28;
  }
  else
  {
    unsigned __int8 v20 = v17;
    os_log_type_t v17 = v28;
  }

  if (*(void *)(v0 + 40)) {
    sub_100004368((uint64_t)v8);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

id sub_10001A408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = sub_10001B130();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  Class isa = 0;
  if (v11(a1, 1, v9) != 1)
  {
    Class isa = sub_10001B100().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  if (v11(a2, 1, v9) == 1)
  {
    Class v13 = 0;
  }
  else
  {
    Class v13 = sub_10001B100().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, v9);
  }
  id v14 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithStartDate:isa endDate:v13 maxEvents:a3 lastN:a4 reversed:a5 & 1];

  return v14;
}

uint64_t sub_10001A588()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001A598(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001A5FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, void (*a5)(char *), uint64_t a6, uint64_t a7)
{
  uint64_t v32 = a7;
  uint64_t v33 = a6;
  uint64_t v34 = a5;
  uint64_t v35 = a4;
  uint64_t v36 = a3;
  uint64_t v8 = *(void *)(*(void *)a2 + 80);
  uint64_t v9 = sub_10001B9B0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v31 - v11;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v14 = __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v16 = (char *)&v31 - v15;
  uint64_t v17 = *(void *)(v8 - 8);
  __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v31 - v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v16, a1, AssociatedTypeWitness);
  char v21 = swift_dynamicCast();
  int v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  if (v21)
  {
    uint64_t v23 = (void *)(v32 + 16);
    v22(v12, 0, 1, v8);
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v12, v8);
    v34(v19);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v8);
    uint64_t result = swift_beginAccess();
    if (__OFADD__(*v23, 1)) {
      __break(1u);
    }
    else {
      ++*v23;
    }
  }
  else
  {
    v22(v12, 1, 1, v8);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_retain_n();
    uint64_t v25 = sub_10001B860();
    os_log_type_t v26 = sub_10001B990();
    if (os_log_type_enabled(v25, v26))
    {
      long long v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)long long v27 = 136315138;
      v37[0] = v28;
      uint64_t v29 = sub_10001BB70();
      v37[3] = sub_100003B08(v29, v30, v37);
      sub_10001B9C0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Error: Biome stream event type is incorrect for stream: %s", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    return v36(0);
  }
  return result;
}

uint64_t IFBiomeLib.deinit()
{
  uint64_t v1 = v0 + qword_100025EA8;
  uint64_t v2 = sub_10001B880();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t IFBiomeLib.__deallocating_deinit()
{
  IFBiomeLib.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

void *sub_10001AB18(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001AB5C()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001ABA4(uint64_t *a1)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 32);
  uint64_t v3 = *a1;
  if (*a1)
  {
    swift_errorRetain();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v4 = sub_10001B860();
    os_log_type_t v5 = sub_10001B990();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      id v7 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 138412290;
      swift_errorRetain();
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      sub_10001B9C0();
      *id v7 = v12;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error, sink failed: %@", v6, 0xCu);
      sub_100004414((uint64_t *)&unk_1000258D0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
    swift_errorRetain();
    v2(v3);
    swift_errorRelease();
    return swift_errorRelease();
  }
  else
  {
    swift_retain();
    uint64_t v8 = sub_10001B860();
    os_log_type_t v9 = sub_10001B980();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 134217984;
      swift_beginAccess();
      sub_10001B9C0();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%ld of events loaded from Biome stream", v10, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    return ((uint64_t (*)(void))v2)(0);
  }
}

uint64_t sub_10001AE54()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_10001AEA4(uint64_t a1)
{
  return sub_10001A5FC(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24), *(void *)(v1 + 32), *(void (**)(char *))(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_10001AEB8()
{
  uint64_t result = sub_10001B880();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for IFBiomeLib(uint64_t a1, uint64_t a2)
{
  return _swift_getGenericMetadata(a1, a2, &nominal type descriptor for IFBiomeLib);
}

uint64_t method lookup function for IFBiomeLib(uint64_t a1, uint64_t a2)
{
  return _swift_lookUpClassMethod(a1, a2, &nominal type descriptor for IFBiomeLib);
}

uint64_t dispatch thunk of IFBiomeLib.__allocating_init(stream:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of IFBiomeLib.loadBiomeEvent(startDate:endDate:completionHandler:receiveEventHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v6 + 144)
                                                                                     + **(int **)(*(void *)v6 + 144));
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v14;
  void *v14 = v7;
  v14[1] = sub_10000A3BC;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_10001B0E0()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t sub_10001B0F0()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

NSDate sub_10001B100()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10001B110()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_10001B120()
{
  return Date.init()();
}

uint64_t sub_10001B130()
{
  return type metadata accessor for Date();
}

uint64_t sub_10001B140()
{
  return UUID.init(uuidString:)();
}

NSUUID sub_10001B150()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_10001B160()
{
  return UUID.init()();
}

uint64_t sub_10001B170()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10001B180()
{
  return StagingPool.add(timestamp:message:)();
}

uint64_t sub_10001B190()
{
  return type metadata accessor for StagingPool();
}

uint64_t sub_10001B1B0()
{
  return MonotonicTimestamp.init(biomeTimestamp:)();
}

uint64_t sub_10001B1C0()
{
  return type metadata accessor for MonotonicTimestamp();
}

uint64_t sub_10001B1D0()
{
  return static AppExtension.main()();
}

uint64_t sub_10001B1E0()
{
  return type metadata accessor for IntelligenceFlowTarget();
}

uint64_t sub_10001B1F0()
{
  return IntelligenceFlowTelemetry.monotonicTimestamp.getter();
}

uint64_t sub_10001B200()
{
  return IntelligenceFlowTelemetry.target.getter();
}

uint64_t sub_10001B210()
{
  return IntelligenceFlowTelemetry.Metadata.intelligenceFlowIds.getter();
}

uint64_t sub_10001B220()
{
  return type metadata accessor for IntelligenceFlowTelemetry.Metadata();
}

uint64_t sub_10001B230()
{
  return IntelligenceFlowTelemetry.metadata.getter();
}

uint64_t sub_10001B240()
{
  return type metadata accessor for IntelligenceFlowTelemetry.Objective();
}

uint64_t sub_10001B250()
{
  return IntelligenceFlowTelemetry.objective.getter();
}

uint64_t sub_10001B260()
{
  return IntelligenceFlowIdentifiers.requestEventId.getter();
}

uint64_t sub_10001B270()
{
  return IntelligenceFlowIdentifiers.clientRequestId.getter();
}

uint64_t sub_10001B280()
{
  return IntelligenceFlowIdentifiers.spanId.getter();
}

uint64_t sub_10001B290()
{
  return IntelligenceFlowIdentifiers.sessionId.getter();
}

uint64_t sub_10001B2A0()
{
  return type metadata accessor for IntelligenceFlowIdentifiers();
}

uint64_t sub_10001B2B0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.TaskStatus();
}

uint64_t sub_10001B2C0()
{
  return IntelligenceFlowFeedbackLearning.TaskOutcome.taskStatus.getter();
}

uint64_t sub_10001B2D0()
{
  return IntelligenceFlowFeedbackLearning.TaskOutcome.promptStatus.getter();
}

uint64_t sub_10001B2E0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.TaskOutcome();
}

uint64_t sub_10001B2F0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.EvaluationType();
}

uint64_t sub_10001B300()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.EvaluationVote();
}

uint64_t sub_10001B310()
{
  return IntelligenceFlowFeedbackLearning.TaskEvaluation.taskOutcome.getter();
}

uint64_t sub_10001B320()
{
  return IntelligenceFlowFeedbackLearning.TaskEvaluation.evaluationNodes.getter();
}

uint64_t sub_10001B330()
{
  return IntelligenceFlowFeedbackLearning.TaskEvaluation.actionResolutionState.getter();
}

uint64_t sub_10001B340()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.TaskEvaluation();
}

uint64_t sub_10001B350()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.CandidateOutcome();
}

uint64_t sub_10001B360()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.EvaluationSource();
}

uint64_t sub_10001B370()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.TaskPromptStatus();
}

uint64_t sub_10001B380()
{
  return IntelligenceFlowFeedbackLearning.TupleInteraction.identifiers.getter();
}

uint64_t sub_10001B390()
{
  return IntelligenceFlowFeedbackLearning.TupleInteraction.alignment.getter();
}

uint64_t sub_10001B3A0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.TupleInteraction();
}

uint64_t sub_10001B3B0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.CandidateCategory();
}

uint64_t sub_10001B3C0()
{
  return IntelligenceFlowFeedbackLearning.TaskEvaluationNode.result.getter();
}

uint64_t sub_10001B3D0()
{
  return IntelligenceFlowFeedbackLearning.TaskEvaluationNode.sources.getter();
}

uint64_t sub_10001B3E0()
{
  return IntelligenceFlowFeedbackLearning.TaskEvaluationNode.evaluator.getter();
}

uint64_t sub_10001B3F0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.TaskEvaluationNode();
}

uint64_t sub_10001B400()
{
  return IntelligenceFlowFeedbackLearning.CandidateEvaluation.resolution.getter();
}

uint64_t sub_10001B410()
{
  return IntelligenceFlowFeedbackLearning.CandidateEvaluation.candidateCategory.getter();
}

uint64_t sub_10001B420()
{
  return IntelligenceFlowFeedbackLearning.CandidateEvaluation.candidateIdentifier.getter();
}

uint64_t sub_10001B430()
{
  return IntelligenceFlowFeedbackLearning.CandidateEvaluation.outcome.getter();
}

uint64_t sub_10001B440()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.CandidateEvaluation();
}

uint64_t sub_10001B450()
{
  return IntelligenceFlowFeedbackLearning.CandidateIdentifier.candidateId.getter();
}

uint64_t sub_10001B460()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.CandidateIdentifier();
}

uint64_t sub_10001B470()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.CandidateResolution();
}

uint64_t sub_10001B480()
{
  return IntelligenceFlowFeedbackLearning.CandidateInteraction.identifier.getter();
}

uint64_t sub_10001B490()
{
  return IntelligenceFlowFeedbackLearning.CandidateInteraction.alignment.getter();
}

uint64_t sub_10001B4A0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.CandidateInteraction();
}

uint64_t sub_10001B4B0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.ActionResolutionState();
}

uint64_t sub_10001B4C0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.UserAlignmentCategory();
}

uint64_t sub_10001B4D0()
{
  return IntelligenceFlowFeedbackLearning.ParameterCandidateCategory.parameterNameId.getter();
}

uint64_t sub_10001B4E0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.ParameterCandidateCategory();
}

uint64_t sub_10001B4F0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Event.EventValue();
}

uint64_t sub_10001B500()
{
  return IntelligenceFlowFeedbackLearning.Event.eventValue.getter();
}

uint64_t sub_10001B510()
{
  return IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.Ended.taskEvaluation.getter();
}

uint64_t sub_10001B520()
{
  return IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.Ended.ifSessionId.getter();
}

uint64_t sub_10001B530()
{
  return IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.Ended.evaluationType.getter();
}

uint64_t sub_10001B540()
{
  return IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.Ended.actionStatementId.getter();
}

uint64_t sub_10001B550()
{
  return IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.Ended.candidateEvaluations.getter();
}

uint64_t sub_10001B560()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.Ended();
}

uint64_t sub_10001B570()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.StateInfo();
}

uint64_t sub_10001B580()
{
  return IntelligenceFlowFeedbackLearning.Event.ActionEvaluation.stateInfo.getter();
}

uint64_t sub_10001B590()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Event.ActionEvaluation();
}

uint64_t sub_10001B5A0()
{
  return IntelligenceFlowFeedbackLearning.Event.InteractionDonation.Ended.candidates.getter();
}

uint64_t sub_10001B5B0()
{
  return IntelligenceFlowFeedbackLearning.Event.InteractionDonation.Ended.ifSessionId.getter();
}

uint64_t sub_10001B5C0()
{
  return IntelligenceFlowFeedbackLearning.Event.InteractionDonation.Ended.absoluteTime.getter();
}

uint64_t sub_10001B5D0()
{
  return IntelligenceFlowFeedbackLearning.Event.InteractionDonation.Ended.donationTime.getter();
}

uint64_t sub_10001B5E0()
{
  return IntelligenceFlowFeedbackLearning.Event.InteractionDonation.Ended.donationTrigger.getter();
}

uint64_t sub_10001B5F0()
{
  return IntelligenceFlowFeedbackLearning.Event.InteractionDonation.Ended.wasTupleDonated.getter();
}

uint64_t sub_10001B600()
{
  return IntelligenceFlowFeedbackLearning.Event.InteractionDonation.Ended.actionStatementId.getter();
}

uint64_t sub_10001B610()
{
  return IntelligenceFlowFeedbackLearning.Event.InteractionDonation.Ended.tuple.getter();
}

uint64_t sub_10001B620()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Event.InteractionDonation.Ended();
}

uint64_t sub_10001B630()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Event.InteractionDonation.StateInfo();
}

uint64_t sub_10001B640()
{
  return IntelligenceFlowFeedbackLearning.Event.InteractionDonation.stateInfo.getter();
}

uint64_t sub_10001B650()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Event.InteractionDonation();
}

uint64_t sub_10001B660()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Event();
}

uint64_t sub_10001B670()
{
  return IntelligenceFlowFeedbackLearning.event.getter();
}

uint64_t sub_10001B680()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Trigger();
}

uint64_t sub_10001B690()
{
  return IntelligenceFlowFeedbackLearning.Metadata.flId.getter();
}

uint64_t sub_10001B6A0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Metadata();
}

uint64_t sub_10001B6B0()
{
  return IntelligenceFlowFeedbackLearning.metadata.getter();
}

uint64_t sub_10001B6C0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning.Evaluator();
}

uint64_t sub_10001B6D0()
{
  return type metadata accessor for IntelligenceFlowFeedbackLearning();
}

uint64_t sub_10001B6E0()
{
  return IntelligenceFlowError.code.getter();
}

uint64_t sub_10001B6F0()
{
  return IntelligenceFlowError.domain.getter();
}

uint64_t sub_10001B700()
{
  return type metadata accessor for IntelligenceFlowError();
}

uint64_t sub_10001B710()
{
  return type metadata accessor for Library.Streams.IntelligenceFlow.Telemetry();
}

uint64_t sub_10001B720()
{
  return IntelligenceFlowPlatformPnR.Ended.handledError.getter();
}

uint64_t sub_10001B730()
{
  return type metadata accessor for IntelligenceFlowPlatformPnR.Ended();
}

uint64_t sub_10001B740()
{
  return IntelligenceFlowPlatformPnR.Failed.criticalError.getter();
}

uint64_t sub_10001B750()
{
  return type metadata accessor for IntelligenceFlowPlatformPnR.Failed();
}

uint64_t sub_10001B760()
{
  return type metadata accessor for IntelligenceFlowPlatformPnR.StateInfo();
}

uint64_t sub_10001B770()
{
  return IntelligenceFlowPlatformPnR.contextId.getter();
}

uint64_t sub_10001B780()
{
  return IntelligenceFlowPlatformPnR.stateInfo.getter();
}

uint64_t sub_10001B790()
{
  return type metadata accessor for IntelligenceFlowPlatformPnR();
}

uint64_t sub_10001B7A0()
{
  return PlanGeneration.Event.PlanCreation.Started.prompt.getter();
}

uint64_t sub_10001B7B0()
{
  return type metadata accessor for PlanGeneration.Event.PlanCreation.Started();
}

uint64_t sub_10001B7C0()
{
  return type metadata accessor for PlanGeneration.Event.PlanCreation.StateInfo();
}

uint64_t sub_10001B7D0()
{
  return PlanGeneration.Event.PlanCreation.stateInfo.getter();
}

uint64_t sub_10001B7E0()
{
  return type metadata accessor for PlanGeneration.Event.PlanCreation();
}

uint64_t sub_10001B7F0()
{
  return type metadata accessor for PlanGeneration.Event();
}

uint64_t sub_10001B800()
{
  return PlanGeneration.event.getter();
}

uint64_t sub_10001B810()
{
  return type metadata accessor for PlanGeneration();
}

uint64_t sub_10001B820()
{
  return static StreamResource.publisher(useCase:bmOptions:)();
}

uint64_t sub_10001B830()
{
  return type metadata accessor for MonotonicTimestamp();
}

uint64_t sub_10001B840()
{
  return AIML.UUID.value.getter();
}

uint64_t sub_10001B850()
{
  return type metadata accessor for AIML.UUID();
}

uint64_t sub_10001B860()
{
  return Logger.logObject.getter();
}

uint64_t sub_10001B870()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10001B880()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10001B890()
{
  return Logger.init(_:)();
}

uint64_t sub_10001B8A0()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

NSDictionary sub_10001B8B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10001B8C0()
{
  return dispatch thunk of static Comparable.>= infix(_:_:)();
}

NSString sub_10001B8D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10001B8E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10001B8F0()
{
  return String.hash(into:)();
}

void sub_10001B900(Swift::String a1)
{
}

Swift::Int sub_10001B910()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10001B920()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10001B930()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10001B940()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10001B950()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10001B960()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_10001B970()
{
  return Double._bridgeToObjectiveC()();
}

uint64_t sub_10001B980()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10001B990()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10001B9A0()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_10001B9B0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10001B9C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10001B9D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10001B9E0()
{
  return _bridgeAnyObjectToAny(_:)();
}

void sub_10001B9F0(Swift::Int a1)
{
}

uint64_t sub_10001BA00()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10001BA10()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10001BA20()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10001BA30()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10001BA40()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10001BA50()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10001BA60()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10001BA70()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10001BA80()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10001BA90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10001BAA0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10001BAB0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10001BAC0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_10001BAD0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_10001BAE0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10001BAF0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10001BB00()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10001BB10()
{
  return Error._code.getter();
}

uint64_t sub_10001BB20()
{
  return Error._domain.getter();
}

uint64_t sub_10001BB30()
{
  return Error._userInfo.getter();
}

NSNumber sub_10001BB40()
{
  return Int32._bridgeToObjectiveC()();
}

uint64_t sub_10001BB50()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10001BB60()
{
  return Hasher._finalize()();
}

uint64_t sub_10001BB70()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}