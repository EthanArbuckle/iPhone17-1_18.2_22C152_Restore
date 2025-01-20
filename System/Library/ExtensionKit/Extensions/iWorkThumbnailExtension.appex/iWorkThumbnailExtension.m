uint64_t sub_100002888(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v2[2] = a1;
  v2[3] = a2;
  sub_100003A10();
  v2[4] = swift_task_alloc();
  v3 = sub_100003A20();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v4 = sub_100003B10();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v5 = sub_100003A50();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v6 = swift_task_alloc();
  v2[13] = v6;
  v7 = (void *)swift_task_alloc();
  v2[14] = v7;
  *v7 = v2;
  v7[1] = sub_100002A6C;
  return ThumbnailRequest.fileURL.getter(v6);
}

uint64_t sub_100002A6C()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    v2 = sub_100002E0C;
  }
  else {
    v2 = sub_100002B80;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100002B80@<X0>(NSURL *a1@<X8>)
{
  uint64_t v3 = v1[9];
  uint64_t v2 = v1[10];
  uint64_t v4 = v1[8];
  sub_100003A40(a1);
  v6 = v5;
  sub_100003A90();
  Class isa = sub_100003AE0().super.isa;
  v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v8(v2, v4);
  id v9 = (id)QLPreviewCopyEmbeddedIWorkThumbnailDataInFile();

  if (v9)
  {
    uint64_t v11 = v1[12];
    uint64_t v10 = v1[13];
    uint64_t v12 = v1[10];
    uint64_t v25 = v1[8];
    uint64_t v26 = v1[11];
    uint64_t v13 = sub_100003A60();
    v14 = v8;
    unint64_t v16 = v15;

    sub_100003B00();
    sub_100003A80();
    sub_10000371C(v13, v16);
    v14(v12, v25);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v26);
  }
  else
  {
    uint64_t v19 = v1[12];
    uint64_t v18 = v1[13];
    uint64_t v20 = v1[11];
    uint64_t v22 = v1[6];
    uint64_t v21 = v1[7];
    uint64_t v23 = v1[5];
    sub_100003A00();
    sub_1000035A8((uint64_t)&_swiftEmptyArrayStorage);
    sub_1000036D4(&qword_100008098, (void (*)(uint64_t))&type metadata accessor for CocoaError);
    sub_100003A30();
    sub_1000039F0();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v17 = (uint64_t (*)(void))v1[1];
  return v17();
}

uint64_t sub_100002E0C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100002E9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100003AC0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100002F04(uint64_t a1)
{
  uint64_t v2 = sub_1000036D4(&qword_100008088, (void (*)(uint64_t))type metadata accessor for iWorkThumbnailExtension);

  return ThumbnailExtension.configuration.getter(a1, v2);
}

uint64_t sub_100002F80()
{
  return sub_100003AB0();
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for iWorkThumbnailExtension()
{
  uint64_t result = qword_1000080B0;
  if (!qword_1000080B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000030F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003AC0();
  v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_10000315C(uint64_t a1)
{
  uint64_t v2 = sub_100003AC0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_1000031C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100003224(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100003288(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000032EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003AC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100003350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100003364);
}

uint64_t sub_100003364(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003AC0();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1000033D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000033E4);
}

uint64_t sub_1000033E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003AC0();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_100003454()
{
  uint64_t result = sub_100003AC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000034E0()
{
  return sub_1000036D4(&qword_100008000, (void (*)(uint64_t))type metadata accessor for iWorkThumbnailExtension);
}

uint64_t sub_100003528()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000035A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003774(&qword_1000080A0);
  uint64_t v2 = sub_100003B30();
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
    sub_100003830(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000037B8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100003898(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1000036D4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000371C(uint64_t a1, unint64_t a2)
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

uint64_t sub_100003774(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000037B8(uint64_t a1, uint64_t a2)
{
  sub_100003B50();
  sub_100003B20();
  Swift::Int v4 = sub_100003B60();

  return sub_1000038A8(a1, a2, v4);
}

uint64_t sub_100003830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003774(&qword_1000080A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100003898(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1000038A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_100003B40() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_100003B40() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_100003B40()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1000039F0()
{
  return CocoaError._nsError.getter();
}

uint64_t sub_100003A00()
{
  return static CocoaError.Code.fileReadNoSuchFile.getter();
}

uint64_t sub_100003A10()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t sub_100003A20()
{
  return type metadata accessor for CocoaError();
}

uint64_t sub_100003A30()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

void sub_100003A40(NSURL *retstr@<X8>)
{
}

uint64_t sub_100003A50()
{
  return type metadata accessor for URL();
}

uint64_t sub_100003A60()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100003A70()
{
  return static AppExtension.main()();
}

uint64_t sub_100003A80()
{
  return static ThumbnailReply.data(_:contentType:attachments:)();
}

uint64_t sub_100003A90()
{
  return ThumbnailRequest.contentType.getter();
}

uint64_t sub_100003AB0()
{
  return ThumbnailProvider.init(contentType:generator:)();
}

uint64_t sub_100003AC0()
{
  return type metadata accessor for ThumbnailProvider();
}

UTType sub_100003AE0()
{
  return UTType._bridgeToObjectiveC()();
}

uint64_t sub_100003AF0()
{
  return static UTType.item.getter();
}

uint64_t sub_100003B00()
{
  return static UTType.jpeg.getter();
}

uint64_t sub_100003B10()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100003B20()
{
  return String.hash(into:)();
}

uint64_t sub_100003B30()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100003B40()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100003B50()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100003B60()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t QLPreviewCopyEmbeddedIWorkThumbnailDataInFile()
{
  return _QLPreviewCopyEmbeddedIWorkThumbnailDataInFile();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
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