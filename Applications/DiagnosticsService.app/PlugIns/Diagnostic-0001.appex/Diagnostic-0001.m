id sub_100003634()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t inited;
  Class isa;
  id v5;
  Class v6;

  v1 = v0;
  v2 = [v0 result];
  sub_1000039C0(&qword_100008168);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100003E10;
  sub_100003CB8();
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = 0x21666F6F4DLL;
  *(void *)(inited + 80) = 0xE500000000000000;
  sub_1000037AC(inited);
  isa = sub_100003C78().super.isa;
  swift_bridgeObjectRelease();
  [v2 setData:isa];

  v5 = [v1 result];
  sub_100003A04();
  v6 = sub_100003C88(0).super.super.isa;
  [v5 setStatusCode:v6];

  return [v1 setFinished:1];
}

unint64_t sub_1000037AC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000039C0(&qword_100008178);
  uint64_t v2 = sub_100003CC8();
  v3 = (void *)v2;
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
    sub_100003A88(v6, (uint64_t)v15);
    unint64_t result = sub_100003A44((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100003AF0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
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

id sub_100003968()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClarusController();
  return [super dealloc];
}

uint64_t type metadata accessor for ClarusController()
{
  return self;
}

uint64_t sub_1000039C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003A04()
{
  unint64_t result = qword_100008170;
  if (!qword_100008170)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008170);
  }
  return result;
}

unint64_t sub_100003A44(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100003C98(*(void *)(v2 + 40));

  return sub_100003B00(a1, v4);
}

uint64_t sub_100003A88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000039C0(&qword_100008180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100003AF0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100003B00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100003BC8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100003CA8();
      sub_100003C24((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100003BC8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100003C24(uint64_t a1)
{
  return a1;
}

NSDictionary sub_100003C78()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSNumber sub_100003C88(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int sub_100003C98(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100003CA8()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100003CB8()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100003CC8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}