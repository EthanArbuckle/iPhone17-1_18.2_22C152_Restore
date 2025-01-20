uint64_t type metadata accessor for MessagesFlowDelegatePlugin()
{
  uint64_t result;

  result = qword_80E0;
  if (!qword_80E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3D34()
{
  return swift_initClassMetadata2();
}

uint64_t sub_3D74()
{
  return sub_3DE0();
}

uint64_t sub_3DA8()
{
  uint64_t v0 = sub_3DF0();

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_3DD8()
{
  return type metadata accessor for MessagesFlowDelegatePlugin();
}

uint64_t sub_3DE0()
{
  return MessagesFlowPluginBase.init()();
}

uint64_t sub_3DF0()
{
  return MessagesFlowPluginBase.deinit();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}