uint64_t sub_100003D78()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  sub_100003DE4(&qword_100008000);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100003ED0;
  v1 = sub_100003E80();
  v2 = sub_100003E28();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v2;
  return v0;
}

ValueMetadata *type metadata accessor for FindMyIntentsPackage()
{
  return &type metadata for FindMyIntentsPackage;
}

uint64_t sub_100003DE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003E28()
{
  unint64_t result = qword_100008008;
  if (!qword_100008008)
  {
    sub_100003E80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008008);
  }
  return result;
}

uint64_t sub_100003E80()
{
  return type metadata accessor for FindMyCoreIntentsPackage();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}