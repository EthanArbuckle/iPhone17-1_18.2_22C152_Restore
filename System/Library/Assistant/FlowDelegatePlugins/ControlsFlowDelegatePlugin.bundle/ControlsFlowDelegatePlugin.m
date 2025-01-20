uint64_t sub_3AC0()
{
  uint64_t v0;

  return _swift_allocObject(v0, 16, 7);
}

uint64_t sub_3AD0()
{
  sub_3DB0();
  sub_3D20();
  uint64_t v2 = v1;
  __chkstk_darwin();
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3DA0();
  sub_3D80();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v0);
}

uint64_t sub_3B84()
{
  sub_3DB0();
  sub_3D20();
  uint64_t v2 = v1;
  __chkstk_darwin();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_3DA0();
  uint64_t v5 = sub_3D90();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  if (v5) {
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_3C34()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ControlsFlowDelegatePlugin()
{
  return self;
}

uint64_t sub_3C68()
{
  return sub_3AD0();
}

uint64_t sub_3C80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3AC0();
  *a1 = result;
  return result;
}

uint64_t sub_3CB4()
{
  return sub_3B84();
}

unint64_t sub_3CD4()
{
  unint64_t result = qword_8138;
  if (!qword_8138)
  {
    type metadata accessor for ControlsFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8138);
  }
  return result;
}

uint64_t sub_3D40()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3D50()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3D60(Swift::String refId)
{
}

void sub_3D70()
{
}

uint64_t sub_3D80()
{
  return ControlsFlowProvider.findFlowFor(parse:)();
}

uint64_t sub_3D90()
{
  return ControlsFlowProvider.makeFlow(for:)();
}

uint64_t sub_3DA0()
{
  return ControlsFlowProvider.init()();
}

uint64_t sub_3DB0()
{
  return type metadata accessor for ControlsFlowProvider();
}

uint64_t self
{
  return _self;
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}