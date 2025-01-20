uint64_t sub_100003A64(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100003C48();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

uint64_t sub_100003AB0()
{
  sub_100003CAC((uint64_t *)&unk_100008010);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100003DF0;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0xD000000000000019;
  *(void *)(v0 + 40) = 0x8000000100003F30;
  sub_100003D10();

  return _swift_bridgeObjectRelease(v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003BA0()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

uint64_t sub_100003BF8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003C48()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConditionalEngineAppIntentsExtension()
{
  return &type metadata for ConditionalEngineAppIntentsExtension;
}

uint64_t sub_100003CAC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003D00()
{
  return static AppExtension.main()();
}

uint64_t sub_100003D10()
{
  return print(_:separator:terminator:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}