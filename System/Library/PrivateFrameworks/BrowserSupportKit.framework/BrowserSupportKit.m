uint64_t (*sub_2493823F4(uint64_t a1, uint64_t a2))()
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_unknownObjectRetain();
  return sub_249382758;
}

uint64_t sub_24938247C()
{
  return sub_2493824E4(&qword_2696A63D0);
}

uint64_t sub_2493824B0()
{
  return sub_2493824E4(&qword_2696A63D8);
}

uint64_t sub_2493824E4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_249382C20();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t (*sub_249382528())@<X0>(_OWORD *a1@<X0>, void *a2@<X8>)
{
  return sub_249382544;
}

uint64_t sub_249382544@<X0>(_OWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = *a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_249382758;
  *(void *)(v5 + 24) = v4;
  *a2 = sub_24938275C;
  a2[1] = v5;
  return swift_unknownObjectRetain();
}

uint64_t sub_2493825F0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  sub_249382C50();
  return swift_release();
}

ValueMetadata *type metadata accessor for WebClipConnectionOptionDefinition()
{
  return &type metadata for WebClipConnectionOptionDefinition;
}

uint64_t sub_2493826B0()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2493826E8(uint64_t a1)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_249382720()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24938275C(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_249382788(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, a2, ObjectType, v5);
}

uint64_t static BSAction.browserSupportKit_activationActionForWebClip(withUUID:)()
{
  return sub_249382C30();
}

unint64_t sub_24938285C()
{
  unint64_t result = qword_2696A63E0;
  if (!qword_2696A63E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A63E0);
  }
  return result;
}

id sub_2493828B0()
{
  uint64_t v0 = sub_249382C20();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249382C10();
  sub_24938285C();
  uint64_t v4 = (void *)sub_249382C30();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_2493829D4()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for EmptyClass()
{
  return self;
}

id sub_249382A08(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A63E8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_249382C20();
  sub_24938285C();
  id v5 = a1;
  sub_249382C60();

  uint64_t v6 = *(void *)(v4 - 8);
  v7 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v4) != 1)
  {
    v7 = (void *)sub_249382C00();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v3, v4);
  }
  return v7;
}

uint64_t UISceneConnectionOptions.webClipID.getter()
{
  sub_249382C20();
  sub_24938285C();
  return sub_249382C60();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t dispatch thunk of WebClipSceneDelegate.windowScene(_:didActivateWebClip:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t sub_249382C00()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_249382C10()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_249382C20()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_249382C30()
{
  return MEMORY[0x270F82250]();
}

uint64_t sub_249382C40()
{
  return MEMORY[0x270F82258]();
}

uint64_t sub_249382C50()
{
  return MEMORY[0x270F82260]();
}

uint64_t sub_249382C60()
{
  return MEMORY[0x270F82700]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}