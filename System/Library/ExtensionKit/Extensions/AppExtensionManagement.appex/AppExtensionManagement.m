uint64_t sub_100003C14(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100003D84();

  return AppExtensionManager.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003CC0()
{
  unint64_t result = qword_100008000;
  if (!qword_100008000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008000);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionEnablement()
{
  return &type metadata for ExtensionEnablement;
}

unint64_t sub_100003D2C()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    sub_100003DD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

unint64_t sub_100003D84()
{
  unint64_t result = qword_100008010;
  if (!qword_100008010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008010);
  }
  return result;
}

uint64_t sub_100003DD8()
{
  return type metadata accessor for AppExtensionSceneConfiguration();
}

uint64_t sub_100003DF8()
{
  return static AppExtension<>.main()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}