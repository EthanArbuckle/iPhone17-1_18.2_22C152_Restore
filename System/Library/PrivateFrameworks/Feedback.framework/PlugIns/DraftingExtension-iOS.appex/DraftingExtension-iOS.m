uint64_t type metadata accessor for DraftingViewController()
{
  uint64_t result;

  result = qword_1000088F0;
  if (!qword_1000088F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100003048()
{
  return swift_initClassMetadata2();
}

id sub_100003088(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    sub_100003320();
    id v6 = a4;
    NSString v7 = sub_100003310();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for DraftingViewController();
  id v9 = objc_msgSendSuper2(&v11, "initWithNibName:bundle:", v7, a4);

  return v9;
}

id sub_10000312C(void *a1, uint64_t a2, uint64_t a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)type metadata accessor for DraftingViewController();
  return objc_msgSendSuper2(&v5, "initWithCoder:", a3);
}

id sub_100003178()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DraftingViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000031B0()
{
  return type metadata accessor for DraftingViewController();
}

id sub_100003274()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

uint64_t sub_1000032DC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

NSString sub_100003310()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100003320()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}