id sub_1000035EC()
{
  id result;

  result = (id)DiagnosticLogHandleForCategory();
  qword_100008608 = (uint64_t)result;
  return result;
}

id sub_1000036C0()
{
  if (*(void *)&v0[OBJC_IVAR___UnpairSessionAccessoryController_accessoryResponder])
  {
    [(id)swift_unknownObjectRetain() unpairSessionAccessoryOnTestCompletion];
    id v1 = [v0 result];
    v2.super.super.isa = sub_100003928().super.super.isa;
    [v1 setStatusCode:v2.super.super.isa];
    swift_unknownObjectRelease();
  }
  else
  {
    sub_100003938();
    if (qword_100008600 != -1) {
      swift_once();
    }
    sub_100003918();
    id v1 = [v0 result];
    v2.super.super.isa = sub_100003928().super.super.isa;
    [v1 setStatusCode:v2.super.super.isa];
  }

  return [v0 setFinished:1];
}

id sub_1000038B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnpairSessionAccessoryController();
  return [super dealloc];
}

uint64_t type metadata accessor for UnpairSessionAccessoryController()
{
  return self;
}

uint64_t sub_100003918()
{
  return os_log(_:dso:log:_:_:)();
}

NSNumber sub_100003928()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100003938()
{
  return static os_log_type_t.error.getter();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}