id sub_100002D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id result;

  type metadata accessor for MagnifierService();
  v0 = swift_allocObject();
  v1 = v0 + OBJC_IVAR____TtC23AccessibilityAppIntents16MagnifierService____lazy_storage___logger;
  v2 = sub_100009C98();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  result = [objc_allocWithZone((Class)sub_100009C58()) init];
  *(void *)(v0 + 16) = result;
  qword_100010388 = v0;
  return result;
}

uint64_t sub_100002E14@<X0>(uint64_t a1@<X8>)
{
  sub_100003C10(&qword_1000101F8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  v7 = &v12[-v6];
  uint64_t v8 = v1 + OBJC_IVAR____TtC23AccessibilityAppIntents16MagnifierService____lazy_storage___logger;
  swift_beginAccess();
  sub_100003C58(v8, (uint64_t)v7);
  uint64_t v9 = sub_100009C98();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1) {
    return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(v10 + 32))(a1, v7, v9);
  }
  sub_100003CC0((uint64_t)v7);
  sub_100009C88();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 16))(v5, a1, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
  swift_beginAccess();
  sub_100003D20((uint64_t)v5, v8);
  return swift_endAccess();
}

void sub_100003064()
{
}

void sub_100003084(void (*a1)(void))
{
  uint64_t v3 = sub_100009C98();
  __chkstk_darwin(v3);
  id v4 = *(id *)(v1 + 16);
  a1();
}

uint64_t sub_100003324()
{
  sub_100003CC0((uint64_t)v0 + OBJC_IVAR____TtC23AccessibilityAppIntents16MagnifierService____lazy_storage___logger);
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100003390()
{
  return type metadata accessor for MagnifierService();
}

uint64_t type metadata accessor for MagnifierService()
{
  uint64_t result = qword_100010158;
  if (!qword_100010158) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000033E4()
{
  sub_100003484();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100003484()
{
  if (!qword_100010168)
  {
    sub_100009C98();
    unint64_t v0 = sub_100009D38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010168);
    }
  }
}

BOOL sub_1000034DC(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_1000034F0@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_100003500(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000350C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000035E0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000037EC((uint64_t)v12, *a3);
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
      sub_1000037EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000379C((uint64_t)v12);
  return v7;
}

uint64_t sub_1000035E0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100009D58();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100003848(a5, a6);
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
  uint64_t v8 = sub_100009D78();
  if (!v8)
  {
    sub_100009D88();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100009D98();
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

uint64_t sub_10000379C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000037EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100003848(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000038E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100003AC0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100003AC0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000038E0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100003A58(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100009D68();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100009D88();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100009CE8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100009D98();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100009D88();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100003A58(uint64_t a1, uint64_t a2)
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
  sub_100003C10(&qword_1000101F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100003AC0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003C10(&qword_1000101F0);
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
  v13 = a4 + 32;
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
  uint64_t result = sub_100009D98();
  __break(1u);
  return result;
}

uint64_t sub_100003C10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003C58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003C10(&qword_1000101F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003CC0(uint64_t a1)
{
  uint64_t v2 = sub_100003C10(&qword_1000101F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003C10(&qword_1000101F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void type metadata accessor for AXSTripleClickOption()
{
  if (!qword_100010200)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100010200);
    }
  }
}

unint64_t sub_100003DE4()
{
  unint64_t result = qword_100010208;
  if (!qword_100010208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010208);
  }
  return result;
}

unint64_t sub_100003E3C()
{
  unint64_t result = qword_100010210;
  if (!qword_100010210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010210);
  }
  return result;
}

unint64_t sub_100003E94()
{
  unint64_t result = qword_100010218;
  if (!qword_100010218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010218);
  }
  return result;
}

unint64_t sub_100003EEC()
{
  unint64_t result = qword_100010220;
  if (!qword_100010220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010220);
  }
  return result;
}

void *sub_100003F40()
{
  return &protocol witness table for Int;
}

uint64_t sub_100003F4C()
{
  return 1;
}

void *sub_100003F54@<X0>(void *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_100003F68(void *a1@<X8>)
{
  *a1 = 0;
}

Swift::Int sub_100003F70()
{
  return sub_100009DD8();
}

void sub_100003FB4()
{
}

Swift::Int sub_100003FDC()
{
  return sub_100009DD8();
}

Swift::Int sub_10000401C()
{
  Swift::UInt v1 = *v0;
  int v2 = *((unsigned __int8 *)v0 + 4);
  sub_100009DB8();
  if (v2) {
    Swift::UInt v3 = 9000;
  }
  else {
    Swift::UInt v3 = v1;
  }
  sub_100009DC8(v3);
  return sub_100009DD8();
}

void sub_100004070()
{
  if (v0[1]) {
    Swift::UInt v1 = 9000;
  }
  else {
    Swift::UInt v1 = *v0;
  }
  sub_100009DC8(v1);
}

Swift::Int sub_1000040AC()
{
  Swift::UInt v1 = *v0;
  int v2 = *((unsigned __int8 *)v0 + 4);
  sub_100009DB8();
  if (v2) {
    Swift::UInt v3 = 9000;
  }
  else {
    Swift::UInt v3 = v1;
  }
  sub_100009DC8(v3);
  return sub_100009DD8();
}

void sub_1000040FC(void *a1@<X8>)
{
  if (v1[1]) {
    *a1 = 9000;
  }
  else {
    *a1 = *v1;
  }
}

uint64_t sub_10000411C(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a1 + 4);
  uint64_t result = *(unsigned __int8 *)(a2 + 4);
  if ((v3 & 1) == 0) {
    return (*(_DWORD *)a1 == *(_DWORD *)a2) & ~result;
  }
  return result;
}

uint64_t sub_100004144()
{
  uint64_t v0 = sub_100009BB8();
  sub_100008A6C(v0, qword_100010390);
  sub_100008A34(v0, (uint64_t)qword_100010390);
  uint64_t v1 = sub_100009BF8();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_100009BD8();
  uint64_t v3 = sub_100003C10(&qword_1000102B0);
  __chkstk_darwin(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v1);
  return sub_100009BA8();
}

uint64_t sub_1000042B0(uint64_t a1)
{
  if ((a1 & 0x100000000) != 0) {
    return sub_100009BD8();
  }
  id v1 = [self localizationKeyForTripleClickOption:a1];
  if (!v1) {
    return sub_100009BD8();
  }
  uint64_t v2 = v1;
  sub_100009CD8();

  uint64_t v3 = sub_100009CA8();
  __chkstk_darwin(v3 - 8);
  sub_100009CB8();
  uint64_t v4 = sub_100009BE8();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (unint64_t *)((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t *v7 = sub_100008994();
  (*(void (**)(unint64_t *, void, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.forClass(_:), v4);
  uint64_t v8 = sub_100009C48();
  __chkstk_darwin(v8 - 8);
  sub_100009C38();
  return sub_100009C08();
}

uint64_t sub_100004510(uint64_t a1)
{
  if ((a1 & 0x100000000) == 0)
  {
    switch((int)a1)
    {
      case '&':
        uint64_t v2 = (void *)sub_100009CC8();
        uint64_t v3 = (void *)sub_100009CC8();
        id v4 = (id)AXUILocalizedStringForKeyWithTable();

        if (v4)
        {
          sub_100009CD8();
        }
        break;
      default:
        return sub_100009BD8();
    }
  }
  return sub_100009BD8();
}

uint64_t sub_100004920(uint64_t a1)
{
  if ((a1 & 0x100000000) != 0) {
    return 0x6275622E74786574;
  }
  int v1 = a1 - 1;
  uint64_t result = 0xD000000000000012;
  switch(v1)
  {
    case 0:
      uint64_t result = 0x65766F6563696F76;
      break;
    case 1:
      uint64_t result = 0x6E692E7472616D73;
      break;
    case 3:
      uint64_t result = 0xD000000000000031;
      break;
    case 5:
    case 38:
      return result;
    case 6:
      uint64_t result = 0x7070612E6B636F6CLL;
      break;
    case 8:
      uint64_t result = 0x672E657261757173;
      break;
    case 9:
      uint64_t result = 0x662E6172656D6163;
      break;
    case 11:
      uint64_t result = 0xD000000000000014;
      break;
    case 13:
      uint64_t result = 0x2E78616D2E6E7573;
      break;
    case 14:
      uint64_t result = 0x2E63697373616C63;
      break;
    case 16:
      uint64_t result = 0x6F632E6563696F76;
      break;
    case 17:
      uint64_t result = 0x6472616F6279656BLL;
      break;
    case 19:
      uint64_t result = 0xD000000000000024;
      break;
    case 20:
      uint64_t result = 0xD000000000000017;
      break;
    case 21:
      uint64_t result = 0x646E696677656976;
      break;
    case 23:
      uint64_t result = 0xD000000000000018;
      break;
    case 24:
    case 34:
    case 35:
      uint64_t result = 0xD000000000000013;
      break;
    case 25:
      uint64_t result = 0x6E6F687064616568;
      break;
    case 27:
      uint64_t result = 0xD00000000000001CLL;
      break;
    case 28:
      uint64_t result = 0x6D726F6665766177;
      break;
    case 30:
      uint64_t result = 0xD000000000000026;
      break;
    case 32:
      uint64_t result = 0xD000000000000017;
      break;
    case 33:
      uint64_t result = 0xD00000000000001DLL;
      break;
    case 37:
      uint64_t result = 0xD00000000000001CLL;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_100004CA4@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if ((a1 & 0x1FFFFFFFFLL) == 0x24)
  {
    uint64_t v3 = sub_100009C28();
    v52 = v50;
    uint64_t v4 = *(void *)(v3 - 8);
    uint64_t v5 = *(void *)(v4 + 64);
    __chkstk_darwin(v3);
    unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_100008994();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v8 = [self bundleForClass:ObjCClassFromMetadata];
    int64_t v9 = (void *)sub_100009CC8();
    uint64_t v10 = (void *)sub_100009CC8();
    id v11 = [v8 URLForResource:v9 withExtension:v10];

    uint64_t v12 = sub_100003C10(&qword_1000102F0);
    uint64_t v13 = __chkstk_darwin(v12 - 8);
    v15 = (char *)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v11)
    {
      v51 = (char *)v50 - v6;
      __chkstk_darwin(v13);
      sub_100009C18();

      v16 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
      v16(v15, (char *)v50 - v6, v3);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v15, 0, 1, v3);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v15, 1, v3) != 1)
      {
        v17 = v51;
        v16(v51, v15, v3);
        uint64_t v18 = sub_100009BF8();
        v52 = v50;
        uint64_t v19 = *(void *)(v18 - 8);
        v50[1] = a2;
        uint64_t v20 = v19;
        __chkstk_darwin(v18);
        char v54 = 0;
        sub_1000042B0(36);
        uint64_t v21 = sub_100003C10(&qword_1000102B0);
        __chkstk_darwin(v21 - 8);
        v23 = (char *)v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
        char v53 = 0;
        sub_100004510(36);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v23, 0, 1, v18);
        uint64_t v24 = sub_100003C10(&qword_1000102C0);
        uint64_t v25 = __chkstk_darwin(v24 - 8);
        v27 = (char *)v50 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
        __chkstk_darwin(v25);
        (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v3);
        sub_100009AE8();
        uint64_t v28 = sub_100009AF8();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 0, 1, v28);
        sub_100009B08();
        return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v17, v3);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v15, 1, 1, v3);
    }
    sub_1000089D4((uint64_t)v15);
    uint64_t v41 = sub_100009BF8();
    uint64_t v42 = *(void *)(v41 - 8);
    __chkstk_darwin(v41);
    char v57 = 0;
    sub_1000042B0(36);
    uint64_t v43 = sub_100003C10(&qword_1000102B0);
    __chkstk_darwin(v43 - 8);
    v45 = (char *)v50 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v56 = 0;
    sub_100004510(36);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v42 + 56))(v45, 0, 1, v41);
    uint64_t v46 = sub_100003C10(&qword_1000102C0);
    __chkstk_darwin(v46 - 8);
    v48 = (char *)v50 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v55 = 0;
    sub_100004920(36);
    sub_100009AD8();
    uint64_t v49 = sub_100009AF8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 0, 1, v49);
    return sub_100009B08();
  }
  else
  {
    uint64_t v30 = a1;
    uint64_t v31 = HIDWORD(a1) & 1;
    uint64_t v32 = sub_100009BF8();
    uint64_t v33 = *(void *)(v32 - 8);
    __chkstk_darwin(v32);
    char v60 = v31;
    sub_1000042B0(v30 | ((unint64_t)v31 << 32));
    uint64_t v34 = sub_100003C10(&qword_1000102B0);
    __chkstk_darwin(v34 - 8);
    v36 = (char *)v50 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v59 = v31;
    sub_100004510(v30 | ((unint64_t)v31 << 32));
    (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v36, 0, 1, v32);
    uint64_t v37 = sub_100003C10(&qword_1000102C0);
    __chkstk_darwin(v37 - 8);
    v39 = (char *)v50 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    char v58 = v31;
    sub_100004920(v30 | ((unint64_t)v31 << 32));
    sub_100009AD8();
    uint64_t v40 = sub_100009AF8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v39, 0, 1, v40);
    return sub_100009B08();
  }
}

unint64_t sub_10000556C()
{
  unint64_t result = qword_100010228;
  if (!qword_100010228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010228);
  }
  return result;
}

unint64_t sub_1000055C4()
{
  unint64_t result = qword_100010230;
  if (!qword_100010230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010230);
  }
  return result;
}

unint64_t sub_10000561C()
{
  unint64_t result = qword_100010238;
  if (!qword_100010238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010238);
  }
  return result;
}

unint64_t sub_100005674()
{
  unint64_t result = qword_100010240;
  if (!qword_100010240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010240);
  }
  return result;
}

void *sub_1000056C8()
{
  return &protocol witness table for Int;
}

uint64_t sub_1000056D4()
{
  return sub_100009B98();
}

uint64_t sub_1000056EC@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010118 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009BB8();
  uint64_t v3 = sub_100008A34(v2, (uint64_t)qword_100010390);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100005794()
{
  return sub_100007F28(&qword_100010248, &qword_100010250);
}

uint64_t sub_1000057C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000580C()
{
  return sub_1000099B8();
}

unint64_t sub_100005850()
{
  unint64_t result = qword_100010258;
  if (!qword_100010258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010258);
  }
  return result;
}

uint64_t sub_1000058A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100004CA4(*v1 | ((unint64_t)*((unsigned __int8 *)v1 + 4) << 32), a1);
}

uint64_t sub_1000058C4()
{
  return sub_100009BC8();
}

unint64_t sub_100005908()
{
  unint64_t result = qword_100010260;
  if (!qword_100010260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010260);
  }
  return result;
}

unint64_t sub_100005960()
{
  unint64_t result = qword_100010268;
  if (!qword_100010268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010268);
  }
  return result;
}

unint64_t sub_1000059B8()
{
  unint64_t result = qword_100010270[0];
  if (!qword_100010270[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100010270);
  }
  return result;
}

uint64_t sub_100005A0C()
{
  uint64_t v50 = sub_100003C10(&qword_1000102B8);
  uint64_t v52 = *(void *)(v50 - 8);
  uint64_t v53 = v50 - 8;
  uint64_t v69 = v52;
  v61 = *(char **)(v52 + 64);
  __chkstk_darwin(v50);
  v71 = (char *)((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = (char *)((char *)v46 - v71);
  uint64_t v1 = sub_100009BF8();
  uint64_t v65 = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1);
  uint64_t v63 = v3;
  unint64_t v60 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_100009BD8();
  uint64_t v4 = sub_100003C10(&qword_1000102B0);
  v68 = (char *)v46;
  uint64_t v58 = *(void *)(*(void *)(v4 - 8) + 64);
  __chkstk_darwin(v4 - 8);
  unint64_t v59 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v6 = (char *)v46 - v59;
  sub_100009BD8();
  char v57 = *(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56);
  uint64_t v66 = v2 + 56;
  v57(v6, 0, 1, v1);
  uint64_t v7 = sub_100003C10(&qword_1000102C0);
  uint64_t v64 = *(void *)(*(void *)(v7 - 8) + 64);
  __chkstk_darwin(v7 - 8);
  unint64_t v70 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  int64_t v9 = (char *)v46 - v70;
  sub_100009AD8();
  uint64_t v10 = sub_100009AF8();
  uint64_t v11 = *(void *)(v10 - 8);
  char v55 = *(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56);
  uint64_t v56 = v11 + 56;
  uint64_t v62 = v10;
  v55(v9, 0, 1, v10);
  unint64_t v54 = sub_10000561C();
  uint64_t v12 = sub_100009AB8();
  v51 = v46;
  uint64_t v13 = __chkstk_darwin(v12);
  v68 = (char *)((char *)v46 - v71);
  v67 = (char *)v46;
  __chkstk_darwin(v13);
  uint64_t v14 = sub_100009BD8();
  v48 = v46;
  __chkstk_darwin(v14);
  unint64_t v15 = v59;
  sub_100009BD8();
  v16 = (uint64_t (*)(char *, void, uint64_t, uint64_t))v57;
  uint64_t v17 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v57)((char *)v46 - v15, 0, 1, v65);
  uint64_t v47 = v46;
  __chkstk_darwin(v17);
  uint64_t v18 = (char *)v46 - v70;
  sub_100009AD8();
  uint64_t v19 = v55;
  v55(v18, 0, 1, v10);
  uint64_t v20 = sub_100009AB8();
  v48 = v46;
  uint64_t v21 = __chkstk_darwin(v20);
  v67 = (char *)((char *)v46 - v71);
  uint64_t v47 = v46;
  __chkstk_darwin(v21);
  uint64_t v22 = sub_100009BD8();
  v46[1] = v46;
  __chkstk_darwin(v22);
  sub_100009BD8();
  uint64_t v23 = v65;
  uint64_t v24 = v16((char *)v46 - v15, 0, 1, v65);
  __chkstk_darwin(v24);
  uint64_t v25 = (char *)v46 - v70;
  sub_100009AD8();
  v19(v25, 0, 1, v62);
  uint64_t v26 = sub_100009AB8();
  uint64_t v47 = v46;
  uint64_t v27 = __chkstk_darwin(v26);
  v61 = (char *)v46;
  v71 = (char *)v46;
  __chkstk_darwin(v27);
  uint64_t v28 = sub_100009BD8();
  __chkstk_darwin(v28);
  v29 = (char *)v46 - v59;
  sub_100009BD8();
  uint64_t v30 = ((uint64_t (*)(char *, void, uint64_t, uint64_t))v57)(v29, 0, 1, v23);
  __chkstk_darwin(v30);
  uint64_t v31 = (char *)v46 - v70;
  sub_100009AD8();
  v55(v31, 0, 1, v62);
  sub_100009AB8();
  sub_100003C10(&qword_1000102C8);
  uint64_t v32 = *(void *)(v52 + 72);
  uint64_t v33 = v69;
  unint64_t v34 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_10000A250;
  unint64_t v36 = v35 + v34;
  uint64_t v37 = *(void (**)(unint64_t, char *, uint64_t))(v33 + 16);
  uint64_t v38 = v49;
  uint64_t v39 = v50;
  v37(v36, v49, v50);
  uint64_t v40 = v68;
  v37(v36 + v32, v68, v39);
  uint64_t v41 = v67;
  v37(v36 + 2 * v32, v67, v39);
  uint64_t v42 = v61;
  v37(v36 + 3 * v32, v61, v39);
  uint64_t v43 = sub_100009AA8();
  swift_bridgeObjectRelease();
  uint64_t v44 = *(void (**)(char *, uint64_t))(v69 + 8);
  v44(v42, v39);
  v44(v41, v39);
  v44(v40, v39);
  v44(v38, v39);
  return v43;
}

uint64_t sub_1000063B0()
{
  uint64_t v0 = sub_100003C10(&qword_1000102D0);
  uint64_t v47 = *(void *)(v0 - 8);
  uint64_t v48 = v0 - 8;
  uint64_t v1 = v47;
  uint64_t v46 = v47;
  uint64_t v2 = *(void *)(v47 + 64);
  uint64_t v3 = __chkstk_darwin(v0);
  unint64_t v4 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v58 = (char *)&v42 - v4;
  __chkstk_darwin(v3);
  int v59 = 15;
  char v60 = 0;
  sub_10000561C();
  sub_100009A38();
  sub_100009A28();
  uint64_t v5 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  uint64_t v6 = v5((char *)&v42 - v4, v0);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v49 = (char *)&v42 - v4;
  __chkstk_darwin(v7);
  int v59 = 10;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v8 = v5((char *)&v42 - v4, v0);
  uint64_t v9 = __chkstk_darwin(v8);
  char v57 = (char *)&v42 - v4;
  __chkstk_darwin(v9);
  int v59 = 22;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v10 = v5((char *)&v42 - v4, v0);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v56 = (char *)&v42 - v4;
  __chkstk_darwin(v11);
  int v59 = 21;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v12 = v5((char *)&v42 - v4, v0);
  uint64_t v13 = __chkstk_darwin(v12);
  char v55 = (char *)&v42 - v4;
  __chkstk_darwin(v13);
  int v59 = 12;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v14 = v5((char *)&v42 - v4, v0);
  uint64_t v15 = __chkstk_darwin(v14);
  unint64_t v54 = (char *)&v42 - v4;
  __chkstk_darwin(v15);
  int v59 = 36;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v16 = v5((char *)&v42 - v4, v0);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v53 = (char *)&v42 - v4;
  __chkstk_darwin(v17);
  int v59 = 24;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v18 = v5((char *)&v42 - v4, v0);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v52 = (char *)&v42 - v4;
  __chkstk_darwin(v19);
  int v59 = 20;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v20 = v5((char *)&v42 - v4, v0);
  uint64_t v21 = __chkstk_darwin(v20);
  v51 = (char *)&v42 - v4;
  __chkstk_darwin(v21);
  int v59 = 14;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v22 = v5((char *)&v42 - v4, v0);
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v50 = (char *)&v42 - v4;
  __chkstk_darwin(v23);
  int v59 = 2;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v24 = v5((char *)&v42 - v4, v0);
  uint64_t v25 = __chkstk_darwin(v24);
  v45 = (char *)&v42 - v4;
  __chkstk_darwin(v25);
  int v59 = 1;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v26 = v5((char *)&v42 - v4, v0);
  uint64_t v27 = __chkstk_darwin(v26);
  uint64_t v44 = (char *)&v42 - v4;
  __chkstk_darwin(v27);
  int v59 = 4;
  char v60 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v28 = v5((char *)&v42 - v4, v0);
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v43 = (char *)&v42 - v4;
  __chkstk_darwin(v29);
  int v59 = 0;
  char v60 = 1;
  sub_100009A38();
  sub_100009A28();
  v5((char *)&v42 - v4, v0);
  sub_100003C10(&qword_1000102D8);
  uint64_t v30 = *(void *)(v47 + 72);
  uint64_t v31 = v46;
  unint64_t v32 = (*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  uint64_t v33 = swift_allocObject();
  uint64_t v48 = v33;
  *(_OWORD *)(v33 + 16) = xmmword_10000A260;
  unint64_t v34 = v33 + v32;
  uint64_t v35 = *(void (**)(unint64_t, char *, uint64_t))(v31 + 16);
  v35(v33 + v32, v58, v0);
  v35(v34 + v30, v49, v0);
  v35(v34 + 2 * v30, v57, v0);
  v35(v34 + 3 * v30, v56, v0);
  v35(v34 + 4 * v30, v55, v0);
  v35(v34 + 5 * v30, v54, v0);
  v35(v34 + 6 * v30, v53, v0);
  v35(v34 + 7 * v30, v52, v0);
  v35(v34 + 8 * v30, v51, v0);
  v35(v34 + 9 * v30, v50, v0);
  unint64_t v36 = v45;
  v35(v34 + 10 * v30, v45, v0);
  uint64_t v37 = v44;
  v35(v34 + 11 * v30, v44, v0);
  unint64_t v38 = v34 + 12 * v30;
  uint64_t v39 = v43;
  v35(v38, v43, v0);
  uint64_t v40 = sub_100009A18();
  swift_bridgeObjectRelease();
  v5(v39, v0);
  v5(v37, v0);
  v5(v36, v0);
  v5(v50, v0);
  v5(v51, v0);
  v5(v52, v0);
  v5(v53, v0);
  v5(v54, v0);
  v5(v55, v0);
  v5(v56, v0);
  v5(v57, v0);
  v5(v49, v0);
  v5(v58, v0);
  return v40;
}

uint64_t sub_100006EE4()
{
  uint64_t v0 = sub_100003C10(&qword_1000102D0);
  uint64_t v36 = *(void *)(v0 - 8);
  uint64_t v37 = v0 - 8;
  uint64_t v1 = v36;
  uint64_t v35 = v36;
  uint64_t v2 = *(void *)(v36 + 64);
  uint64_t v3 = __chkstk_darwin(v0);
  unint64_t v4 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v39 = (char *)&v29 - v4;
  __chkstk_darwin(v3);
  int v40 = 9;
  char v41 = 0;
  sub_10000561C();
  sub_100009A38();
  sub_100009A28();
  uint64_t v5 = v1 + 8;
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  uint64_t v7 = v6((char *)&v29 - v4, v0);
  uint64_t v8 = __chkstk_darwin(v7);
  __chkstk_darwin(v8);
  int v40 = 17;
  char v41 = 0;
  sub_100009A38();
  uint64_t v29 = (char *)&v29 - v4;
  sub_100009A28();
  uint64_t v9 = v6((char *)&v29 - v4, v0);
  uint64_t v10 = __chkstk_darwin(v9);
  unint64_t v38 = (char *)&v29 - v4;
  __chkstk_darwin(v10);
  int v40 = 18;
  char v41 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v11 = v6((char *)&v29 - v4, v0);
  uint64_t v12 = __chkstk_darwin(v11);
  unint64_t v34 = (char *)&v29 - v4;
  __chkstk_darwin(v12);
  int v40 = 6;
  char v41 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v13 = v6((char *)&v29 - v4, v0);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v33 = (char *)&v29 - v4;
  __chkstk_darwin(v14);
  int v40 = 28;
  char v41 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v32 = v5;
  uint64_t v15 = v6((char *)&v29 - v4, v0);
  uint64_t v31 = (void (*)(char *, uint64_t))v6;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v30 = (char *)&v29 - v4;
  __chkstk_darwin(v16);
  int v40 = 31;
  char v41 = 0;
  sub_100009A38();
  sub_100009A28();
  v6((char *)&v29 - v4, v0);
  sub_100003C10(&qword_1000102D8);
  uint64_t v17 = *(void *)(v36 + 72);
  uint64_t v18 = v35;
  unint64_t v19 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_10000A270;
  unint64_t v21 = v20 + v19;
  uint64_t v22 = *(void (**)(unint64_t, char *, uint64_t))(v18 + 16);
  v22(v21, v39, v0);
  v22(v21 + v17, (char *)&v29 - v4, v0);
  v22(v21 + 2 * v17, v38, v0);
  uint64_t v23 = v34;
  v22(v21 + 3 * v17, v34, v0);
  uint64_t v24 = v33;
  v22(v21 + 4 * v17, v33, v0);
  uint64_t v25 = v30;
  v22(v21 + 5 * v17, v30, v0);
  uint64_t v26 = sub_100009A18();
  swift_bridgeObjectRelease();
  uint64_t v27 = v31;
  v31(v25, v0);
  v27(v24, v0);
  v27(v23, v0);
  v27(v38, v0);
  v27(v29, v0);
  v27(v39, v0);
  return v26;
}

uint64_t sub_1000074CC()
{
  uint64_t v0 = sub_100003C10(&qword_1000102D0);
  uint64_t v32 = *(void *)(v0 - 8);
  uint64_t v33 = v0 - 8;
  uint64_t v1 = v32;
  uint64_t v31 = v32;
  uint64_t v2 = *(void *)(v32 + 64);
  uint64_t v3 = __chkstk_darwin(v0);
  unint64_t v4 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v35 = (char *)&v27 - v4;
  __chkstk_darwin(v3);
  int v36 = 25;
  char v37 = 0;
  sub_10000561C();
  sub_100009A38();
  sub_100009A28();
  uint64_t v5 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  uint64_t v6 = v5((char *)&v27 - v4, v0);
  uint64_t v7 = __chkstk_darwin(v6);
  unint64_t v34 = (char *)&v27 - v4;
  __chkstk_darwin(v7);
  int v36 = 38;
  char v37 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v8 = v5((char *)&v27 - v4, v0);
  uint64_t v9 = __chkstk_darwin(v8);
  __chkstk_darwin(v9);
  int v36 = 26;
  char v37 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v10 = v5((char *)&v27 - v4, v0);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v30 = (char *)&v27 - v4;
  __chkstk_darwin(v11);
  int v36 = 29;
  char v37 = 0;
  sub_100009A38();
  sub_100009A28();
  uint64_t v29 = (void (*)(char *, uint64_t))v5;
  uint64_t v12 = v5((char *)&v27 - v4, v0);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v28 = (char *)&v27 - v4;
  __chkstk_darwin(v13);
  int v36 = 39;
  char v37 = 0;
  sub_100009A38();
  sub_100009A28();
  v5((char *)&v27 - v4, v0);
  sub_100003C10(&qword_1000102D8);
  uint64_t v14 = *(void *)(v32 + 72);
  uint64_t v15 = v31;
  unint64_t v16 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  uint64_t v33 = 4 * v14;
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_10000A280;
  unint64_t v18 = v17 + v16;
  unint64_t v19 = *(void (**)(unint64_t, char *, uint64_t))(v15 + 16);
  v19(v18, v35, v0);
  v19(v18 + v14, v34, v0);
  v19(v18 + 2 * v14, (char *)&v27 - v4, v0);
  unint64_t v20 = v18 + 3 * v14;
  unint64_t v21 = v30;
  v19(v20, v30, v0);
  unint64_t v22 = v18 + v33;
  uint64_t v23 = v28;
  v19(v22, v28, v0);
  uint64_t v24 = sub_100009A18();
  swift_bridgeObjectRelease();
  uint64_t v25 = v29;
  v29(v23, v0);
  v25(v21, v0);
  v25((char *)&v27 - v4, v0);
  v25(v34, v0);
  v25(v35, v0);
  return v24;
}

uint64_t sub_1000079F8()
{
  uint64_t v0 = sub_100003C10(&qword_1000102D0);
  uint64_t v21 = *(void *)(v0 - 8);
  uint64_t v1 = v21;
  uint64_t v2 = *(void *)(v21 + 64);
  uint64_t v3 = __chkstk_darwin(v0);
  unint64_t v4 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v20 = (char *)&v18 - v4;
  __chkstk_darwin(v3);
  int v24 = 7;
  char v25 = 0;
  sub_10000561C();
  sub_100009A38();
  sub_100009A28();
  uint64_t v5 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  uint64_t v6 = v5((char *)&v18 - v4, v0);
  unint64_t v19 = (void (*)(char *, uint64_t))v5;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v18 - v4;
  __chkstk_darwin(v7);
  int v22 = 33;
  char v23 = 0;
  sub_100009A38();
  sub_100009A28();
  v5((char *)&v18 - v4, v0);
  sub_100003C10(&qword_1000102D8);
  uint64_t v9 = *(void *)(v21 + 72);
  unint64_t v10 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10000A290;
  unint64_t v12 = v11 + v10;
  uint64_t v13 = *(void (**)(unint64_t, char *, uint64_t))(v1 + 16);
  uint64_t v14 = v20;
  v13(v11 + v10, v20, v0);
  v13(v12 + v9, v8, v0);
  uint64_t v15 = sub_100009A18();
  swift_bridgeObjectRelease();
  unint64_t v16 = v19;
  v19(v8, v0);
  v16(v14, v0);
  return v15;
}

uint64_t sub_100007CB0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100007CD0, 0, 0);
}

uint64_t sub_100007CD0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = sub_1000085E0();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_100008810((uint64_t)v2, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_100007D70(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100007D90, 0, 0);
}

uint64_t sub_100007D90()
{
  sub_100003C10(&qword_1000102B0);
  uint64_t v1 = swift_task_alloc();
  uint64_t v2 = sub_100009BF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  sub_10000561C();
  sub_100009AC8();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

unint64_t sub_100007EA4()
{
  unint64_t result = qword_100010288;
  if (!qword_100010288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010288);
  }
  return result;
}

uint64_t sub_100007EF8()
{
  return sub_100007F28(&qword_100010290, qword_100010298);
}

uint64_t sub_100007F28(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000057C4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100003EEC();
  void *v5 = v2;
  v5[1] = sub_100008020;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100008020()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100008114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_100008020;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

uint64_t sub_1000081C8()
{
  return sub_100009B28() & 1;
}

ValueMetadata *type metadata accessor for AccessibilityFeatureQuery()
{
  return &type metadata for AccessibilityFeatureQuery;
}

uint64_t initializeBufferWithCopyOfBuffer for AccessibilityFeature.FeatureType(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AccessibilityFeature.FeatureType(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AccessibilityFeature.FeatureType(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AccessibilityFeature()
{
  return &type metadata for AccessibilityFeature;
}

char *sub_100008268(char *result, int64_t a2, char a3, char *a4)
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
      sub_100003C10(&qword_1000102E0);
      unint64_t v10 = (char *)swift_allocObject();
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
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
    sub_1000084F4(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100008378(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008398(a1, a2, a3, *v3);
  *char v3 = (char *)result;
  return result;
}

uint64_t sub_100008398(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003C10(&qword_1000102E0);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  size_t v15 = 8 * v8;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    memcpy(v13, v14, v15);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100009D98();
  __break(1u);
  return result;
}

char *sub_1000084F4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    int64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_100009D98();
  __break(1u);
  return result;
}

char *sub_1000085E0()
{
  sub_100003C10(&qword_1000102E0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000A2A0;
  *(_DWORD *)(inited + 32) = 28;
  *(unsigned char *)(inited + 36) = 0;
  *(_DWORD *)(inited + 40) = 6;
  *(unsigned char *)(inited + 44) = 0;
  *(_DWORD *)(inited + 48) = 25;
  *(unsigned char *)(inited + 52) = 0;
  *(_DWORD *)(inited + 56) = 15;
  *(unsigned char *)(inited + 60) = 0;
  *(_DWORD *)(inited + 64) = 10;
  *(unsigned char *)(inited + 68) = 0;
  *(_DWORD *)(inited + 72) = 18;
  *(unsigned char *)(inited + 76) = 0;
  *(_DWORD *)(inited + 80) = 7;
  *(unsigned char *)(inited + 84) = 0;
  *(_DWORD *)(inited + 88) = 21;
  *(unsigned char *)(inited + 92) = 0;
  *(_DWORD *)(inited + 96) = 26;
  *(unsigned char *)(inited + 100) = 0;
  *(_DWORD *)(inited + 104) = 29;
  *(unsigned char *)(inited + 108) = 0;
  *(_DWORD *)(inited + 112) = 33;
  *(unsigned char *)(inited + 116) = 0;
  *(_DWORD *)(inited + 120) = 24;
  *(unsigned char *)(inited + 124) = 0;
  *(_DWORD *)(inited + 128) = 20;
  *(unsigned char *)(inited + 132) = 0;
  *(_DWORD *)(inited + 136) = 14;
  *(unsigned char *)(inited + 140) = 0;
  *(_DWORD *)(inited + 144) = 2;
  *(unsigned char *)(inited + 148) = 0;
  *(_DWORD *)(inited + 152) = 34;
  *(unsigned char *)(inited + 156) = 0;
  *(_DWORD *)(inited + 160) = 9;
  *(unsigned char *)(inited + 164) = 0;
  *(_DWORD *)(inited + 168) = 1;
  *(unsigned char *)(inited + 172) = 0;
  *(_DWORD *)(inited + 176) = 17;
  *(unsigned char *)(inited + 180) = 0;
  *(_DWORD *)(inited + 184) = 4;
  *(unsigned char *)(inited + 188) = 0;
  *(_DWORD *)(inited + 192) = 31;
  *(unsigned char *)(inited + 196) = 0;
  *(_DWORD *)(inited + 200) = 22;
  *(unsigned char *)(inited + 204) = 0;
  *(_DWORD *)(inited + 208) = 12;
  *(unsigned char *)(inited + 212) = 0;
  *(_DWORD *)(inited + 216) = 0;
  *(unsigned char *)(inited + 220) = 1;
  uint64_t v1 = sub_100008268((char *)1, 25, 1, (char *)inited);
  *((void *)v1 + 2) = 25;
  *((_DWORD *)v1 + 56) = 36;
  v1[228] = 0;
  unint64_t v2 = *((void *)v1 + 3);
  if (v2 <= 0x33)
  {
    uint64_t v1 = sub_100008268((char *)(v2 > 1), 26, 1, v1);
    unint64_t v2 = *((void *)v1 + 3);
  }
  *((void *)v1 + 2) = 26;
  *((_DWORD *)v1 + 58) = 38;
  v1[236] = 0;
  if (v2 <= 0x35) {
    uint64_t v1 = sub_100008268((char *)(v2 > 1), 27, 1, v1);
  }
  *((void *)v1 + 2) = 27;
  *((_DWORD *)v1 + 60) = 39;
  v1[244] = 0;
  return v1;
}

uint64_t sub_100008810(uint64_t result, void *a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    unint64_t v4 = 0;
    uint64_t v5 = result + 32;
    do
    {
      if (v4 <= v2) {
        unint64_t v6 = v2;
      }
      else {
        unint64_t v6 = v4;
      }
      while (1)
      {
        if (v4 == v6) {
          goto LABEL_28;
        }
        int64_t v7 = (unsigned int *)(v5 + 8 * v4);
        int v8 = *v7;
        char v9 = *((unsigned char *)v7 + 4);
        ++v4;
        if (v9) {
          uint64_t v10 = 9000;
        }
        else {
          uint64_t v10 = *v7;
        }
        uint64_t v11 = a2[2];
        if (!v11) {
          goto LABEL_6;
        }
        if (a2[4] == v10) {
          break;
        }
        if (v11 == 1) {
          goto LABEL_6;
        }
        if (a2[5] == v10) {
          break;
        }
        if (v11 != 2)
        {
          uint64_t v12 = 6;
          while (1)
          {
            uint64_t v13 = v12 - 3;
            if (__OFADD__(v12 - 4, 1)) {
              break;
            }
            if (a2[v12] == v10) {
              goto LABEL_21;
            }
            ++v12;
            if (v13 == v11) {
              goto LABEL_6;
            }
          }
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
LABEL_6:
        if (v4 == v2) {
          return (uint64_t)_swiftEmptyArrayStorage;
        }
      }
LABEL_21:
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = sub_100008378(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      if (v15 >= v14 >> 1) {
        uint64_t result = sub_100008378(v14 > 1, v15 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v15 + 1;
      unint64_t v16 = (char *)&_swiftEmptyArrayStorage[v15];
      *((_DWORD *)v16 + 8) = v8;
      v16[36] = v9;
    }
    while (v4 != v2);
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

unint64_t sub_100008994()
{
  unint64_t result = qword_1000102E8;
  if (!qword_1000102E8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000102E8);
  }
  return result;
}

uint64_t sub_1000089D4(uint64_t a1)
{
  uint64_t v2 = sub_100003C10(&qword_1000102F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008A34(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100008A6C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100008AD0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100008AEC(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessibilityFeature.FeatureType()
{
  return &type metadata for AccessibilityFeature.FeatureType;
}

unint64_t sub_100008B20()
{
  unint64_t result = qword_1000102F8;
  if (!qword_1000102F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102F8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AccessibilityFeature.OneShotAction(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for AccessibilityFeature.OneShotAction(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100008C64);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100008C8C()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccessibilityFeature.OneShotAction()
{
  return &type metadata for AccessibilityFeature.OneShotAction;
}

unint64_t sub_100008CA8()
{
  unint64_t result = qword_100010300;
  if (!qword_100010300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010300);
  }
  return result;
}

unint64_t sub_100008D04()
{
  unint64_t result = qword_100010308;
  if (!qword_100010308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010308);
  }
  return result;
}

unint64_t sub_100008D5C()
{
  unint64_t result = qword_100010310;
  if (!qword_100010310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010310);
  }
  return result;
}

uint64_t sub_100008DB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008DCC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100008DE8()
{
  uint64_t v0 = sub_100009BF8();
  sub_100008A6C(v0, qword_1000103A8);
  sub_100008A34(v0, (uint64_t)qword_1000103A8);
  return sub_100009BD8();
}

uint64_t sub_100008E4C()
{
  return sub_100009A88();
}

uint64_t sub_100008E70()
{
  uint64_t v0 = sub_100003C10(&qword_100010360);
  __chkstk_darwin(v0);
  sub_1000094B8();
  sub_100009B68();
  sub_100009B58();
  swift_getKeyPath();
  sub_100003C10(&qword_100010368);
  sub_100009B48();
  swift_release();
  sub_100009B58();
  uint64_t v1 = sub_100003C10(&qword_100010370);
  __chkstk_darwin(v1 - 8);
  sub_100009B78();
  return sub_100009B38();
}

uint64_t sub_100008FFC(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100009D18();
  v2[4] = sub_100009D08();
  uint64_t v4 = sub_100009CF8();
  v2[5] = v4;
  v2[6] = v3;
  return _swift_task_switch(sub_100009094, v4, v3);
}

uint64_t sub_100009094()
{
  sub_100009A78();
  *(_DWORD *)(v0 + 64) = *(_DWORD *)(v0 + 56);
  *(unsigned char *)(v0 + 61) = *(unsigned char *)(v0 + 60);
  return _swift_task_switch(sub_100009110, 0, 0);
}

uint64_t sub_100009110()
{
  if (*(unsigned char *)(v0 + 61))
  {
    if (qword_100010110 != -1) {
      swift_once();
    }
    swift_retain();
    sub_100003064();
    swift_release();
  }
  else
  {
    [self toggleTripleClickOption:*(unsigned int *)(v0 + 64) fromSource:3];
  }
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  return _swift_task_switch(sub_1000091E8, v1, v2);
}

uint64_t sub_1000091E8()
{
  swift_release();
  sub_100009A68();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100009258@<X0>(uint64_t a1@<X8>)
{
  if (qword_100010120 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100009BF8();
  uint64_t v3 = sub_100008A34(v2, (uint64_t)qword_1000103A8);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100009300()
{
  return sub_1000099C8() & 1;
}

uint64_t sub_10000931C()
{
  return sub_1000099E8();
}

uint64_t sub_100009338()
{
  return sub_1000099D8();
}

uint64_t sub_100009350(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100008020;
  return sub_100008FFC(a1, v4);
}

uint64_t sub_1000093F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000950C();
  *a1 = result;
  return result;
}

uint64_t sub_100009418()
{
  return sub_1000099F8();
}

ValueMetadata *type metadata accessor for ToggleAccessibilityFeatureIntent()
{
  return &type metadata for ToggleAccessibilityFeatureIntent;
}

uint64_t sub_100009458()
{
  return sub_100007F28(&qword_100010320, &qword_100010328);
}

uint64_t sub_100009488()
{
  return sub_100007F28(&qword_100010330, &qword_100010338);
}

unint64_t sub_1000094B8()
{
  unint64_t result = qword_100010340;
  if (!qword_100010340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010340);
  }
  return result;
}

uint64_t sub_10000950C()
{
  sub_100003C10(&qword_100010348);
  uint64_t v0 = sub_100009BF8();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_100009BD8();
  uint64_t v2 = sub_100003C10(&qword_1000102B0);
  __chkstk_darwin(v2 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))((char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), 1, 1, v0);
  v14[2] = 0;
  __int16 v15 = 256;
  uint64_t v4 = sub_100003C10(&qword_100010350);
  uint64_t v5 = *(void *)(*(void *)(v4 - 8) + 64);
  __chkstk_darwin(v4 - 8);
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = sub_100009A58();
  int v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  uint64_t v9 = v8((char *)v14 - v6, 1, 1, v7);
  __chkstk_darwin(v9);
  v8((char *)v14 - v6, 1, 1, v7);
  uint64_t v10 = sub_100009B88();
  __chkstk_darwin(v10);
  (*(void (**)(char *, void))(v12 + 104))((char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for InputConnectionBehavior.default(_:));
  sub_1000059B8();
  return sub_100009A98();
}

uint64_t sub_1000097F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100009A88();
  *a1 = result;
  return result;
}

uint64_t sub_10000981C()
{
  return sub_100009A08();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000098B8()
{
  unint64_t result = qword_100010378;
  if (!qword_100010378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010378);
  }
  return result;
}

uint64_t sub_100009910()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100009954()
{
  unint64_t result = qword_100010380;
  if (!qword_100010380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010380);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessibilityAppIntentsExtension()
{
  return &type metadata for AccessibilityAppIntentsExtension;
}

uint64_t sub_1000099B8()
{
  return static AppEntity.defaultResolverSpecification.getter();
}

uint64_t sub_1000099C8()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_1000099D8()
{
  return static AppIntent.description.getter();
}

uint64_t sub_1000099E8()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000099F8()
{
  return static AppIntent.persistentIdentifier.getter();
}

uint64_t sub_100009A08()
{
  return AppIntentsExtension.configuration.getter();
}

uint64_t sub_100009A18()
{
  return static IntentItem.Builder.buildBlock(_:)();
}

uint64_t sub_100009A28()
{
  return static IntentItem.Builder.buildExpression<A>(_:)();
}

uint64_t sub_100009A38()
{
  return IntentItem.init(_:)();
}

uint64_t sub_100009A58()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100009A68()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100009A78()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100009A88()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_100009A98()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100009AA8()
{
  return static IntentItemSection.Builder.buildBlock(_:)();
}

uint64_t sub_100009AB8()
{
  return IntentItemSection.init(_:subtitle:image:itemsBuilder:)();
}

uint64_t sub_100009AC8()
{
  return IntentItemCollection.init(promptLabel:usesIndexedCollation:sectionsBuilder:)();
}

uint64_t sub_100009AD8()
{
  return DisplayRepresentation.Image.init(systemName:isTemplate:)();
}

uint64_t sub_100009AE8()
{
  return DisplayRepresentation.Image.init(url:isTemplate:)();
}

uint64_t sub_100009AF8()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100009B08()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_100009B28()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100009B38()
{
  return IntentParameterSummary.init(_:table:)();
}

uint64_t sub_100009B48()
{
  return ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)();
}

uint64_t sub_100009B58()
{
  return ParameterSummaryString.StringInterpolation.appendLiteral(_:)();
}

uint64_t sub_100009B68()
{
  return ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100009B78()
{
  return ParameterSummaryString.init(stringInterpolation:)();
}

uint64_t sub_100009B88()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100009B98()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100009BA8()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100009BB8()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100009BC8()
{
  return InstanceDisplayRepresentable.localizedStringResource.getter();
}

uint64_t sub_100009BD8()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100009BE8()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100009BF8()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100009C08()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100009C18()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009C28()
{
  return type metadata accessor for URL();
}

uint64_t sub_100009C38()
{
  return static Locale.current.getter();
}

uint64_t sub_100009C48()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100009C58()
{
  return type metadata accessor for MAGService();
}

uint64_t sub_100009C68()
{
  return static AppExtension.main()();
}

uint64_t sub_100009C78()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009C88()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100009C98()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100009CA8()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100009CB8()
{
  return String.LocalizationValue.init(_:)();
}

uint64_t sub_100009CC8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100009CD8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100009CE8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100009CF8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100009D08()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100009D18()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100009D28()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009D38()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100009D48()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100009D58()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100009D68()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100009D78()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100009D88()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009D98()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100009DA8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_100009DB8()
{
  return Hasher.init(_seed:)();
}

void sub_100009DC8(Swift::UInt a1)
{
}

Swift::Int sub_100009DD8()
{
  return Hasher._finalize()();
}

uint64_t AXUILocalizedStringForKeyWithTable()
{
  return _AXUILocalizedStringForKeyWithTable();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}