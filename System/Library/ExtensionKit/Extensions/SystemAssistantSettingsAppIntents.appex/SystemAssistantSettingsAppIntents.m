uint64_t sub_100003BE0(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100003D34();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003C8C()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

uint64_t sub_100003CE4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003D34()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemAssistantSettingsAppIntentsExtension()
{
  return &type metadata for SystemAssistantSettingsAppIntentsExtension;
}

uint64_t sub_100003DA8()
{
  return static AppExtension.main()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}