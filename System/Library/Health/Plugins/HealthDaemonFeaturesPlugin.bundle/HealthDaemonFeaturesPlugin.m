uint64_t type metadata accessor for _HealthDaemonFeaturesPlugin()
{
  uint64_t result;

  result = qword_8130;
  if (!qword_8130) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3D40()
{
  return swift_initClassMetadata2();
}

id sub_3D80(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_3DC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_3DF8()
{
  return type metadata accessor for _HealthDaemonFeaturesPlugin();
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