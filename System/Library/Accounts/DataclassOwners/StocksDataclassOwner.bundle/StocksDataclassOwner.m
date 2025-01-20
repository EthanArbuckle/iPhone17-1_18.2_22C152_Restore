id sub_21E4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DataclassOwner()
{
  return self;
}

Class sub_2334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  if (a5())
  {
    v5.super.isa = sub_31D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

void sub_2440()
{
  if (!qword_8758)
  {
    type metadata accessor for Dataclass(255);
    unint64_t v0 = sub_3200();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_8758);
    }
  }
}

void type metadata accessor for Dataclass(uint64_t a1)
{
}

uint64_t sub_24C0(uint64_t a1, uint64_t a2)
{
  return sub_2738(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_24D8(uint64_t a1, id *a2)
{
  uint64_t result = sub_3190();
  *a2 = 0;
  return result;
}

uint64_t sub_2550(uint64_t a1, id *a2)
{
  char v3 = sub_31A0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25D0@<X0>(void *a1@<X8>)
{
  sub_31B0();
  NSString v2 = sub_3180();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2614@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_3180();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_265C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_31B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2688(uint64_t a1)
{
  uint64_t v2 = sub_3108(&qword_8790);
  uint64_t v3 = sub_3108(&qword_8798);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_2720(uint64_t a1, uint64_t a2)
{
  return sub_2738(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_2738(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_31B0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_277C()
{
  sub_31B0();
  sub_31C0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_27D0()
{
  sub_31B0();
  sub_3220();
  sub_31C0();
  Swift::Int v0 = sub_3230();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2844()
{
  uint64_t v0 = sub_31B0();
  uint64_t v2 = v1;
  if (v0 == sub_31B0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_3210();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void sub_28D0()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = sub_3180();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  NSString v3 = sub_3180();
  unsigned int v4 = [v2 BOOLForKey:v3];

  if (v4)
  {
    id v5 = objc_allocWithZone((Class)NSUserDefaults);
    NSString v6 = sub_3180();
    id v7 = [v5 initWithSuiteName:v6];

    if (v7)
    {
      NSString v8 = sub_3180();
      [v7 BOOLForKey:v8];

      return;
    }
    goto LABEL_7;
  }
}

id sub_2A30()
{
  sub_28D0();
  char v1 = v0;
  sub_3014(0, &qword_8760, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  if (v1)
  {
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_3BF0;
    NSString v3 = self;
    id result = [v3 actionWithType:5];
    if (result)
    {
      id v5 = result;
      unint64_t v6 = sub_3060();
      *(void *)(v2 + 56) = v6;
      *(void *)(v2 + 32) = v5;
      id result = [v3 actionWithType:0];
      if (result)
      {
        *(void *)(v2 + 88) = v6;
        *(void *)(v2 + 64) = result;
        return (id)v2;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_3BE0;
    id result = [self actionWithType:1];
    if (result)
    {
      id v7 = result;
      *(void *)(v2 + 56) = sub_3060();
      *(void *)(v2 + 32) = v7;
      return (id)v2;
    }
  }
  __break(1u);
  return result;
}

id sub_2B88()
{
  sub_28D0();
  char v1 = v0;
  sub_3014(0, &qword_8760, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t))&type metadata accessor for _ContiguousArrayStorage);
  if (v1)
  {
    uint64_t v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_3C00;
    NSString v3 = self;
    id result = [v3 actionWithType:3];
    if (result)
    {
      id v5 = result;
      unint64_t v6 = sub_3060();
      *(void *)(v2 + 56) = v6;
      *(void *)(v2 + 32) = v5;
      id result = [v3 actionWithType:2];
      if (result)
      {
        *(void *)(v2 + 88) = v6;
        *(void *)(v2 + 64) = result;
        id result = [v3 actionWithType:0];
        if (result)
        {
          *(void *)(v2 + 120) = v6;
          *(void *)(v2 + 96) = result;
          return (id)v2;
        }
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_3BE0;
  id result = [self actionWithType:3];
  if (result)
  {
    id v7 = result;
    *(void *)(v2 + 56) = sub_3060();
    *(void *)(v2 + 32) = v7;
    return (id)v2;
  }
LABEL_12:
  __break(1u);
  return result;
}

void sub_2D08()
{
  id v0 = objc_allocWithZone((Class)CHSTimelineController);
  NSString v1 = sub_3180();
  NSString v2 = sub_3180();
  id v3 = [v0 initForAvocadoIdentifier:v1 inBundleIdentifier:v2];

  id v4 = objc_allocWithZone((Class)CHSTimelineController);
  NSString v5 = sub_3180();
  NSString v6 = sub_3180();
  id v7 = [v4 initForAvocadoIdentifier:v5 inBundleIdentifier:v6];
}

void sub_2E54(void *a1)
{
  if (!a1)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  NSString v1 = (char *)[a1 type];
  if (v1 == (unsigned char *)&dword_4 + 2)
  {
LABEL_5:
    NSString v2 = self;
    [v2 killProcess:0];
    [v2 killProcess:1];
    sub_2D08();
    id v3 = objc_allocWithZone((Class)NSUserDefaults);
    NSString v4 = sub_3180();
    id v5 = [v3 initWithSuiteName:v4];

    if (v5) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  if (v1 != (unsigned char *)&dword_4 + 1)
  {
    if (v1 != (unsigned char *)&dword_0 + 3) {
      return;
    }
    goto LABEL_5;
  }
  NSString v6 = self;
  [v6 killProcess:0];
  [v6 killProcess:1];
  sub_2D08();
  id v7 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v8 = sub_3180();
  id v5 = [v7 initWithSuiteName:v8];

  if (!v5)
  {
LABEL_12:
    __break(1u);
    return;
  }
LABEL_8:
  NSString v9 = sub_3180();
  [v5 setBool:1 forKey:v9];
}

void sub_3014(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_3060()
{
  unint64_t result = qword_8768;
  if (!qword_8768)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_8768);
  }
  return result;
}

uint64_t sub_30A0()
{
  return sub_3108(&qword_8778);
}

uint64_t sub_30D4()
{
  return sub_3108(&qword_8780);
}

uint64_t sub_3108(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Dataclass(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_314C()
{
  return sub_3108(&qword_8788);
}

NSString sub_3180()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_3190()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_31A0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_31B0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_31C0()
{
  return String.hash(into:)();
}

NSArray sub_31D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_31E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3200()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_3210()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_3220()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_3230()
{
  return Hasher._finalize()();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

id objc_msgSend__killProcessNamed_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_killProcessNamed:bundleID:");
}