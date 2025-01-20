id GPKAccountNotificationPlugin.__allocating_init()()
{
  objc_class *v0;

  return [objc_allocWithZone(v0) init];
}

id GPKAccountNotificationPlugin.init()()
{
  id v5 = v0;
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v4, "init");
  id v1 = v3;
  id v5 = v3;

  return v3;
}

id GPKAccountNotificationPlugin.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GPKAccountNotificationPlugin()
{
  return self;
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}