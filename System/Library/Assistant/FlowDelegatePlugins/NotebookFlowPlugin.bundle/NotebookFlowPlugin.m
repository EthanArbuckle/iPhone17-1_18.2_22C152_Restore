uint64_t sub_3A5C()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_3D60();
  return v0;
}

uint64_t sub_3AA0()
{
  return sub_3D50();
}

uint64_t sub_3ACC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC18NotebookFlowPlugin18NotebookFlowPlugin_flowProvider;
  uint64_t v2 = sub_3D70();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_3B6C()
{
  return type metadata accessor for NotebookFlowPlugin();
}

uint64_t type metadata accessor for NotebookFlowPlugin()
{
  uint64_t result = qword_8180;
  if (!qword_8180) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_3BBC()
{
  uint64_t result = sub_3D70();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_3C4C()
{
  return sub_3AA0();
}

uint64_t sub_3C70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3A5C();
  *a1 = result;
  return result;
}

unint64_t sub_3CB0()
{
  unint64_t result = qword_8168;
  if (!qword_8168)
  {
    type metadata accessor for NotebookFlowPlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8168);
  }
  return result;
}

uint64_t sub_3D00()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3D10()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_3D20()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3D30(Swift::String refId)
{
}

void sub_3D40()
{
}

uint64_t sub_3D50()
{
  return NotebookFlowProvider.findFlowForX(parse:)();
}

uint64_t sub_3D60()
{
  return NotebookFlowProvider.init()();
}

uint64_t sub_3D70()
{
  return type metadata accessor for NotebookFlowProvider();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}