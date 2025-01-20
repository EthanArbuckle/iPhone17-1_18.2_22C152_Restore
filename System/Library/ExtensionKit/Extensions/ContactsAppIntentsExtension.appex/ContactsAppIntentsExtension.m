uint64_t sub_100003AF4(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_100003C7C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

id sub_100003B40()
{
  v0 = self;

  return [v0 setupAppIntentDependencies];
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003BD4()
{
  unint64_t result = qword_1000080E8;
  if (!qword_1000080E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080E8);
  }
  return result;
}

uint64_t sub_100003C2C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100003C7C()
{
  unint64_t result = qword_1000080F0;
  if (!qword_1000080F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactsAppIntentsExtensionExtension()
{
  return &type metadata for ContactsAppIntentsExtensionExtension;
}

uint64_t sub_100003CF0()
{
  return static AppExtension.main()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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