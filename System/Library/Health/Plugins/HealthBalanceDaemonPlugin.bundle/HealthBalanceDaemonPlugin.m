id _HealthBalanceDaemonPlugin.__allocating_init()()
{
  objc_class *v0;
  id v1;
  uint64_t vars8;

  v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id _HealthBalanceDaemonPlugin.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_3D14(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

id _HealthBalanceDaemonPlugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for _HealthBalanceDaemonPlugin()
{
  uint64_t result = qword_8130;
  if (!qword_8130) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3DD8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_3E18()
{
  return type metadata accessor for _HealthBalanceDaemonPlugin();
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

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}