uint64_t sub_100001DB0()
{
  uint64_t v0;

  v0 = sub_100003430();
  sub_100001E3C(v0, qword_1000080A0);
  sub_100001EA0(v0, (uint64_t)qword_1000080A0);
  return sub_100003420();
}

uint64_t *sub_100001E3C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100001EA0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

BOOL sub_100001ED8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100001EF0()
{
  Swift::UInt v1 = *v0;
  sub_100003590();
  sub_1000035A0(v1);
  return sub_1000035B0();
}

void sub_100001F38()
{
  sub_1000035A0(*v0);
}

Swift::Int sub_100001F64()
{
  Swift::UInt v1 = *v0;
  sub_100003590();
  sub_1000035A0(v1);
  return sub_1000035B0();
}

id sub_100001FB8(uint64_t a1)
{
  return sub_1000027E4(a1);
}

uint64_t sub_100001FD0(uint64_t a1)
{
  unint64_t v2 = sub_100002138();

  return AskToExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000207C()
{
  unint64_t result = qword_100008068;
  if (!qword_100008068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008068);
  }
  return result;
}

ValueMetadata *type metadata accessor for Appex()
{
  return &type metadata for Appex;
}

uint64_t sub_1000020E4()
{
  return *(void *)(swift_getOpaqueTypeConformance2() + 8);
}

unint64_t sub_100002138()
{
  unint64_t result = qword_100008070;
  if (!qword_100008070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008070);
  }
  return result;
}

uint64_t sub_10000218C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100002260(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100003150((uint64_t)v12, *a3);
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
      sub_100003150((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100003100(v12);
  return v7;
}

uint64_t sub_100002260(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100003500();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000241C(a5, a6);
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
  uint64_t v8 = sub_100003520();
  if (!v8)
  {
    sub_100003530();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100003540();
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

uint64_t sub_10000241C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000024B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100002694(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100002694(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000024B4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000262C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100003510();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100003530();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000034B0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100003540();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100003530();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000262C(uint64_t a1, uint64_t a2)
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
  sub_100003008(&qword_100008090);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100002694(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003008(&qword_100008090);
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
  uint64_t result = sub_100003540();
  __break(1u);
  return result;
}

id sub_1000027E4(uint64_t a1)
{
  sub_100003008(&qword_100008078);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v4 = (char *)v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000033E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v57 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v59 = (char *)v51 - v9;
  if (qword_100008060 != -1) {
    swift_once();
  }
  uint64_t v60 = v6;
  uint64_t v58 = v5;
  uint64_t v10 = sub_100003430();
  sub_100001EA0(v10, (uint64_t)qword_1000080A0);
  size_t v11 = sub_100003410();
  os_log_type_t v12 = sub_1000034E0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Creating Messages payload", v13, 2u);
    swift_slowDealloc();
  }

  id v14 = [objc_allocWithZone((Class)MSMessageTemplateLayout) init];
  v15 = (void *)sub_100003490();
  sub_100003450();

  NSString v16 = sub_1000034A0();
  swift_bridgeObjectRelease();
  [v14 setCaption:v16];

  v17 = (void *)sub_100003490();
  sub_100003460();

  NSString v18 = sub_1000034A0();
  swift_bridgeObjectRelease();
  [v14 setSubcaption:v18];

  id v19 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v14];
  if ([v19 respondsToSelector:"setRequiredCapabilities:"])
  {
    sub_100003008(&qword_100008088);
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_100003810;
    strcpy((char *)(v20 + 32), "supports-askto");
    *(unsigned char *)(v20 + 47) = -18;
    v21.super.isa = sub_1000034C0().super.isa;
    swift_bridgeObjectRelease();
    [v19 setRequiredCapabilities:v21.super.isa];
  }
  else
  {
    v21.super.isa = (Class)sub_100003410();
    os_log_type_t v22 = sub_1000034D0();
    if (os_log_type_enabled((os_log_t)v21.super.isa, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21.super.isa, v22, "MSMessage does not respond to #selector(setter: MSMessage.requiredCapabilities)!", v23, 2u);
      swift_slowDealloc();
    }
  }

  uint64_t v24 = (uint64_t)[objc_allocWithZone((Class)MSSession) init];
  id v25 = [objc_allocWithZone((Class)MSMessage) initWithSession:v24];

  [v25 setLayout:v19];
  sub_100003480();
  if (v1)
  {

    return (id)v24;
  }
  uint64_t v56 = a1;
  uint64_t v26 = v60;
  uint64_t v24 = 1;
  uint64_t v27 = v58;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v60 + 48))(v4, 1, v58) == 1)
  {
    sub_10000304C((uint64_t)v4);
    sub_1000030AC();
    swift_allocError();
    unsigned char *v28 = 1;
    swift_willThrow();

    return (id)v24;
  }
  v29 = v59;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v59, v4, v27);
  v30 = v57;
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v57, v29, v27);
  v31 = sub_100003410();
  os_log_type_t v32 = sub_1000034E0();
  int v33 = v32;
  if (os_log_type_enabled(v31, v32))
  {
    os_log_t v55 = v31;
    uint64_t v34 = swift_slowAlloc();
    int v52 = v33;
    v35 = (uint8_t *)v34;
    uint64_t v54 = swift_slowAlloc();
    uint64_t v62 = v54;
    v53 = v35;
    *(_DWORD *)v35 = 136315138;
    v51[1] = v35 + 4;
    uint64_t v36 = sub_1000033C0();
    uint64_t v61 = sub_10000218C(v36, v37, &v62);
    sub_1000034F0();
    swift_bridgeObjectRelease();
    v57 = *(char **)(v26 + 8);
    ((void (*)(char *, uint64_t))v57)(v30, v27);
    v31 = v55;
    _os_log_impl((void *)&_mh_execute_header, v55, (os_log_type_t)v52, "Generated AskTo URL: %s", v53, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v57 = *(char **)(v26 + 8);
    ((void (*)(char *, uint64_t))v57)(v30, v27);
  }

  uint64_t v38 = v27;
  sub_1000033D0(v39);
  v41 = v40;
  [v25 setURL:v40];

  v42 = (void *)sub_100003490();
  sub_100003440();
  uint64_t v44 = v43;

  if (!v44)
  {
    v45 = (void *)sub_100003490();
    sub_100003460();
  }
  uint64_t v24 = (uint64_t)sub_1000034A0();
  swift_bridgeObjectRelease();
  [v25 setSummaryText:v24];

  if (![v25 respondsToSelector:"_pluginPayloadWithAppIconData:appName:allowDataPayloads:"])
  {
    sub_1000030AC();
    swift_allocError();
    unsigned char *v50 = 0;
    swift_willThrow();

    ((void (*)(char *, uint64_t))v57)(v59, v27);
    return (id)v24;
  }
  NSString v46 = sub_1000034A0();
  id v47 = [v25 _pluginPayloadWithAppIconData:0 appName:v46 allowDataPayloads:0];

  id result = [v47 data];
  if (result)
  {
    v49 = result;
    uint64_t v24 = sub_1000033F0();

    ((void (*)(char *, uint64_t))v57)(v59, v38);
    return (id)v24;
  }
  __break(1u);
  return result;
}

uint64_t sub_100003008(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000304C(uint64_t a1)
{
  uint64_t v2 = sub_100003008(&qword_100008078);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000030AC()
{
  unint64_t result = qword_100008080;
  if (!qword_100008080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008080);
  }
  return result;
}

uint64_t sub_100003100(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003150(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for AskToExtensionError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AskToExtensionError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AskToExtensionError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000331CLL);
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

uint64_t sub_100003344(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000334C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AskToExtensionError()
{
  return &type metadata for AskToExtensionError;
}

unint64_t sub_10000336C()
{
  unint64_t result = qword_100008098;
  if (!qword_100008098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008098);
  }
  return result;
}

uint64_t sub_1000033C0()
{
  return URL.absoluteString.getter();
}

void sub_1000033D0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000033E0()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000033F0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003400()
{
  return static AppExtension.main()();
}

uint64_t sub_100003410()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003420()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003430()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003440()
{
  return ATQuestion.notificationText.getter();
}

uint64_t sub_100003450()
{
  return ATQuestion.title.getter();
}

uint64_t sub_100003460()
{
  return ATQuestion.summary.getter();
}

uint64_t sub_100003480()
{
  return static ATURL.create(using:)();
}

uint64_t sub_100003490()
{
  return ATPayload.question.getter();
}

NSString sub_1000034A0()
{
  return String._bridgeToObjectiveC()();
}

Swift::Int sub_1000034B0()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_1000034C0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000034D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000034E0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000034F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100003500()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100003510()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100003520()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100003530()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100003540()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100003550()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100003560()
{
  return Error._code.getter();
}

uint64_t sub_100003570()
{
  return Error._domain.getter();
}

uint64_t sub_100003580()
{
  return Error._userInfo.getter();
}

uint64_t sub_100003590()
{
  return Hasher.init(_seed:)();
}

void sub_1000035A0(Swift::UInt a1)
{
}

Swift::Int sub_1000035B0()
{
  return Hasher._finalize()();
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

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}