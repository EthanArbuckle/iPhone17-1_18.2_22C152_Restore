uint64_t sub_1000016F0(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;

  v1[18] = a1;
  v2 = sub_100003400();
  v1[19] = v2;
  v1[20] = *(void *)(v2 - 8);
  v1[21] = swift_task_alloc();
  v3 = (void *)swift_task_alloc();
  v1[22] = v3;
  *v3 = v1;
  v3[1] = sub_1000017E4;
  return ThumbnailRequest.data.getter();
}

uint64_t sub_1000017E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v3;
  uint64_t v5 = *v3;
  *(void *)(v4 + 184) = a1;
  *(void *)(v4 + 192) = a2;
  swift_task_dealloc();
  if (v2)
  {
    swift_task_dealloc();
    v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    return _swift_task_switch(sub_100001934, 0, 0);
  }
}

uint64_t sub_100001934()
{
  v1 = self;
  Class isa = sub_100003360().super.isa;
  v0[25] = isa;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100001A64;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100001EA8;
  v0[13] = &unk_1000044A0;
  v0[14] = v3;
  [v1 contactsWithData:isa completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100001A64()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_100001E18;
  }
  else {
    uint64_t v2 = sub_100001B74;
  }
  return _swift_task_switch(v2, 0, 0);
}

void sub_100001B74()
{
  unint64_t v1 = *(void *)(v0 + 120);

  if (!(v1 >> 62))
  {
    if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_100003470();
  swift_bridgeObjectRelease();
  if (v13 != 1) {
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_100003470();
  swift_bridgeObjectRelease();
  if (!v14) {
    goto LABEL_12;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)sub_100003460();
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(v1 + 32);
  }
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  id v4 = [v3 imageData];
  if (!v4)
  {
    id v4 = [v3 thumbnailImageData];
    if (!v4)
    {

LABEL_13:
      uint64_t v16 = *(void *)(v0 + 184);
      unint64_t v15 = *(void *)(v0 + 192);
      type metadata accessor for QLThumbnailError(0);
      *(void *)(v0 + 136) = 0;
      sub_100002BCC((uint64_t)&_swiftEmptyArrayStorage);
      sub_100002680(&qword_1000080B0, type metadata accessor for QLThumbnailError);
      sub_100003350();
      swift_willThrow();
      sub_1000026C8(v16, v15);
      swift_task_dealloc();
      v12 = *(void (**)(void))(v0 + 8);
      goto LABEL_14;
    }
  }
  uint64_t v6 = *(void *)(v0 + 184);
  unint64_t v5 = *(void *)(v0 + 192);
  uint64_t v8 = *(void *)(v0 + 160);
  uint64_t v7 = *(void *)(v0 + 168);
  uint64_t v17 = *(void *)(v0 + 152);
  uint64_t v9 = sub_100003370();
  unint64_t v11 = v10;

  sub_1000033F0();
  sub_100003390();

  sub_1000026C8(v6, v5);
  sub_1000026C8(v9, v11);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v17);
  swift_task_dealloc();
  v12 = *(void (**)(void))(v0 + 8);
LABEL_14:
  v12();
}

uint64_t sub_100001E18()
{
  unint64_t v1 = (void *)v0[25];
  uint64_t v2 = v0[23];
  unint64_t v3 = v0[24];
  swift_willThrow();
  sub_1000026C8(v2, v3);

  swift_task_dealloc();
  id v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100001EA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100002CF8(&qword_1000080D0);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_100002F74();
    **(void **)(*(void *)(v3 + 64) + 40) = sub_100003440();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100001F74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1000033C0();
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100001FDC(uint64_t a1)
{
  uint64_t v2 = sub_100002680(&qword_1000080A0, (void (*)(uint64_t))type metadata accessor for ContactThumbnailExtension);

  return ThumbnailExtension.configuration.getter(a1, v2);
}

uint64_t sub_100002058()
{
  return sub_1000033B0();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for ContactThumbnailExtension()
{
  uint64_t result = qword_100008130;
  if (!qword_100008130) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000021C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000033C0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100002234(uint64_t a1)
{
  uint64_t v2 = sub_1000033C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100002298(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000033C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000022FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000033C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100002360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000033C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000023C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000033C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100002428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000243C);
}

uint64_t sub_10000243C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000033C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1000024A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000024BC);
}

uint64_t sub_1000024BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000033C0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_10000252C()
{
  uint64_t result = sub_1000033C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000025B8()
{
  return sub_100002680(&qword_100008018, (void (*)(uint64_t))type metadata accessor for ContactThumbnailExtension);
}

uint64_t sub_100002600()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002680(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000026C8(uint64_t a1, unint64_t a2)
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

void type metadata accessor for QLThumbnailError(uint64_t a1)
{
}

uint64_t sub_100002734(uint64_t a1)
{
  uint64_t v2 = sub_100002680(&qword_1000080F0, type metadata accessor for QLThumbnailError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000027A0(uint64_t a1)
{
  uint64_t v2 = sub_100002680(&qword_1000080F0, type metadata accessor for QLThumbnailError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100002810(uint64_t a1)
{
  uint64_t v2 = sub_100002680(&qword_1000080B0, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_10000287C()
{
  return *v0;
}

uint64_t sub_100002884@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_10000288C()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(QLThumbnailErrorDomain);
}

uint64_t sub_10000289C(uint64_t a1)
{
  uint64_t v2 = sub_100002680(&qword_1000080B0, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100002908(uint64_t a1)
{
  uint64_t v2 = sub_100002680(&qword_1000080B0, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100002974(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100002680(&qword_1000080B0, type metadata accessor for QLThumbnailError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100002A04()
{
  id v1 = *v0;
  uint64_t v2 = sub_100003450();

  return v2;
}

uint64_t sub_100002A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002680(&qword_1000080B0, type metadata accessor for QLThumbnailError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100002AB8()
{
  return sub_1000034E0();
}

void *sub_100002B18@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100002B28(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100002B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100002680(&qword_1000080B0, type metadata accessor for QLThumbnailError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_100002BB8(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_100002BCC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002CF8(&qword_1000080B8);
  uint64_t v2 = sub_100003480();
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
    sub_100002DB4(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100002D3C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100002E1C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100002CF8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002D3C(uint64_t a1, uint64_t a2)
{
  sub_1000034D0();
  sub_100003430();
  Swift::Int v4 = sub_1000034E0();

  return sub_100002E2C(a1, a2, v4);
}

uint64_t sub_100002DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002CF8(&qword_1000080C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100002E1C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100002E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_100003490() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_100003490() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_100003490()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_100002F74()
{
  unint64_t result = qword_1000080C8;
  if (!qword_1000080C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000080C8);
  }
  return result;
}

uint64_t sub_100002FB4()
{
  return sub_100002680(&qword_1000080E0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100002FFC()
{
  return sub_100002680(&qword_1000080E8, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100003044()
{
  return sub_100002680(&qword_1000080F0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_10000308C()
{
  return sub_100002680(&qword_1000080F8, type metadata accessor for QLThumbnailError);
}

uint64_t sub_1000030D4()
{
  return sub_100002680(&qword_100008100, type metadata accessor for QLThumbnailError);
}

uint64_t sub_10000311C()
{
  return sub_100002680(&qword_100008108, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_100003178(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000031C0()
{
  return sub_100002680(&qword_100008110, type metadata accessor for Code);
}

unint64_t sub_10000320C()
{
  unint64_t result = qword_100008118;
  if (!qword_100008118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008118);
  }
  return result;
}

uint64_t sub_100003260()
{
  return sub_100002680(&qword_100008120, type metadata accessor for Code);
}

uint64_t sub_1000032A8()
{
  return sub_100002680(&qword_1000080B0, type metadata accessor for QLThumbnailError);
}

uint64_t sub_100003350()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

NSData sub_100003360()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100003370()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003380()
{
  return static AppExtension.main()();
}

uint64_t sub_100003390()
{
  return static ThumbnailReply.data(_:contentType:attachments:)();
}

uint64_t sub_1000033B0()
{
  return ThumbnailProvider.init(contentType:generator:)();
}

uint64_t sub_1000033C0()
{
  return type metadata accessor for ThumbnailProvider();
}

uint64_t sub_1000033E0()
{
  return static UTType.item.getter();
}

uint64_t sub_1000033F0()
{
  return static UTType.image.getter();
}

uint64_t sub_100003400()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100003410()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_100003430()
{
  return String.hash(into:)();
}

uint64_t sub_100003440()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003450()
{
  return NSObject.hashValue.getter();
}

uint64_t sub_100003460()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100003470()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100003480()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100003490()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000034C0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000034D0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000034E0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}