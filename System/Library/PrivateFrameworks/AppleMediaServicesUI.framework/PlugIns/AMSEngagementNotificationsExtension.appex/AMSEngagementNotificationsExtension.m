id sub_100003B50(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v5;
  id v6;
  objc_super v8;

  if (a2)
  {
    v5 = sub_100003D00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for UserNotificationViewController();
  v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

id sub_100003C30(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for UserNotificationViewController();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_100003CA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserNotificationViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for UserNotificationViewController()
{
  return self;
}

NSString sub_100003D00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100003D10()
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}