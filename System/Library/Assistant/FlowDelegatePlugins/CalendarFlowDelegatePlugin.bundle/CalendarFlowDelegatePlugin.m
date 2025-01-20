void *sub_37DC@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  void __src[15];

  swift_beginAccess();
  sub_3A80(v1 + 16, (uint64_t)__src);
  if (__src[3]) {
    return memcpy(a1, __src, 0x78uLL);
  }
  sub_3B2C((uint64_t)__src);
  sub_3CB0();
  sub_3B8C((uint64_t)a1, (uint64_t)__src);
  swift_beginAccess();
  sub_3BE8((uint64_t)__src, v1 + 16);
  return (void *)swift_endAccess();
}

double sub_3890()
{
  uint64_t v0 = swift_allocObject();
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(void *)(v0 + 128) = 0;
  return result;
}

uint64_t sub_38CC()
{
  sub_37DC(v1);
  sub_3CA0();
  return sub_3A2C((uint64_t)v1);
}

uint64_t sub_3920()
{
  sub_3B2C(v0 + 16);

  return _swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for CalendarFlowDelegatePlugin()
{
  return self;
}

uint64_t sub_397C()
{
  return sub_38CC();
}

void sub_39A0(void *a1@<X8>)
{
  sub_3890();
  *a1 = v2;
}

unint64_t sub_39E0()
{
  unint64_t result = qword_8180;
  if (!qword_8180)
  {
    type metadata accessor for CalendarFlowDelegatePlugin();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8180);
  }
  return result;
}

uint64_t sub_3A2C(uint64_t a1)
{
  return a1;
}

uint64_t sub_3A80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3AE8(&qword_8188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_3AE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_3B2C(uint64_t a1)
{
  uint64_t v2 = sub_3AE8(&qword_8188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3B8C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_3BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_3AE8(&qword_8188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_3C50()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_3C60()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_3C70()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_3C80(Swift::String refId)
{
}

void sub_3C90()
{
}

uint64_t sub_3CA0()
{
  return CalendarFlowProvider.findFlowForX(parse:)();
}

uint64_t sub_3CB0()
{
  return CalendarFlowProvider.init()();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}