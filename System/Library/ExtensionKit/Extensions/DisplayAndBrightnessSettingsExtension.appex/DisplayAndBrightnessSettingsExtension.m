unint64_t sub_100004254()
{
  unint64_t result;

  result = qword_10001C060;
  if (!qword_10001C060)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C060);
  }
  return result;
}

unint64_t sub_1000042AC()
{
  unint64_t result = qword_10001C068;
  if (!qword_10001C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C068);
  }
  return result;
}

unint64_t sub_100004304()
{
  unint64_t result = qword_10001C070[0];
  if (!qword_10001C070[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C070);
  }
  return result;
}

uint64_t sub_100004358()
{
  uint64_t v0 = sub_100007AF0(&qword_10001C168);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007AF0(&qword_10001C170);
  __chkstk_darwin();
  id v4 = [self currentDevice];
  id v5 = [v4 userInterfaceIdiom];

  sub_100004304();
  sub_100011310();
  if (v5)
  {
    v6._countAndFlagsBits = 0xD000000000000040;
    v6._object = (void *)0x8000000100014310;
  }
  else
  {
    v6._object = (void *)0x8000000100014360;
    v6._countAndFlagsBits = 0xD000000000000030;
  }
  sub_100011300(v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_1000112F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  sub_100011300(v9);
  return sub_100011320();
}

uint64_t sub_10000458C()
{
  sub_100007AF0(&qword_10001C150);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000113A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_100011360();
  sub_100007B6C(v4, qword_10001C568);
  sub_100007B34(v4, (uint64_t)qword_10001C568);
  sub_100011380();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100011350();
}

uint64_t sub_1000046F8@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v19 = sub_100011390();
  uint64_t v3 = *(void *)(v19 - 8);
  ((void (*)(void))__chkstk_darwin)();
  id v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000113D0();
  ((void (*)(void))__chkstk_darwin)();
  sub_100011400();
  ((void (*)(void))__chkstk_darwin)();
  sub_100007AF0(&qword_10001C148);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007AF0(&qword_10001C150);
  ((void (*)(void))__chkstk_darwin)();
  Swift::String v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000113A0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  v20 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  switch(a1)
  {
    case 1:
    case 2:
      sub_100011380();
      sub_100011380();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100011270();
      uint64_t v15 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 0, 1, v15);
      sub_100007AF0(&qword_10001C158);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000116E0;
      sub_100011380();
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19);
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
      sub_100011380();
      sub_100011380();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
      sub_100011270();
      uint64_t v16 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v7, 0, 1, v16);
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19);
      break;
    default:
      sub_100011380();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
      sub_100011270();
      uint64_t v14 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 0, 1, v14);
      sub_100007AF0(&qword_10001C158);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000116E0;
      sub_100011380();
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v19);
      break;
  }
  sub_1000113B0();
  return sub_100011290();
}

BOOL sub_100005AB0(char a1)
{
  switch(a1)
  {
    case 1:
      id v7 = [self currentDevice];
      id v8 = [v7 userInterfaceIdiom];

      if (v8 != (id)1) {
        return 0;
      }
      id v6 = [self sharedManager];
      if (v6) {
        goto LABEL_12;
      }
      __break(1u);
LABEL_9:
      id v9 = [self currentDevice];
      id v10 = [v9 userInterfaceIdiom];

      if (v10) {
        return 0;
      }
      id v6 = [self sharedManager];
      if (!v6)
      {
LABEL_15:
        __break(1u);
        JUMPOUT(0x100005D40);
      }
LABEL_12:
      uint64_t v11 = v6;
      sub_100007AF0(&qword_10001C180);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_1000116E0;
      uint64_t v13 = sub_100011410();
      *(void *)(v12 + 56) = &type metadata for String;
      *(void *)(v12 + 32) = v13;
      *(void *)(v12 + 40) = v14;
      Class isa = sub_100011430().super.isa;
      swift_bridgeObjectRelease();
      id v3 = [v11 hasCapabilities:isa];

      return (BOOL)v3;
    case 2:
      goto LABEL_9;
    case 6:
    case 7:
    case 8:
      id v4 = [self currentDevice];
      id v5 = [v4 userInterfaceIdiom];

      if (v5 != (id)1) {
        return 0;
      }
      id v6 = [self sharedManager];
      if (v6) {
        goto LABEL_12;
      }
      __break(1u);
      goto LABEL_15;
    default:
      id v1 = [self currentDevice];
      id v2 = [v1 userInterfaceIdiom];

      return v2 == (id)1;
  }
}

uint64_t sub_100005D78(uint64_t a1)
{
  id v5 = (uint64_t (*)(uint64_t))((char *)&dword_10001C198 + dword_10001C198);
  id v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100005E20;
  return v5(a1);
}

uint64_t sub_100005E20(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  id v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100005F20(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C190 + dword_10001C190);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *id v2 = v1;
  v2[1] = sub_100007C38;
  return v4();
}

unint64_t sub_100005FC8()
{
  unint64_t result = qword_10001C088;
  if (!qword_10001C088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C088);
  }
  return result;
}

uint64_t sub_10000601C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C188 + dword_10001C188);
  id v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *id v2 = v1;
  v2[1] = sub_1000060C0;
  return v4();
}

uint64_t sub_1000060C0(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_1000061D8()
{
  unint64_t result = qword_10001C098;
  if (!qword_10001C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C098);
  }
  return result;
}

unint64_t sub_100006230()
{
  unint64_t result = qword_10001C0A0;
  if (!qword_10001C0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C0A0);
  }
  return result;
}

unint64_t sub_100006288()
{
  unint64_t result = qword_10001C0A8;
  if (!qword_10001C0A8)
  {
    sub_1000062FC(qword_10001C0B0);
    sub_100006230();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C0A8);
  }
  return result;
}

uint64_t sub_1000062FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006344(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005FC8();
  *uint64_t v5 = v2;
  v5[1] = sub_1000063F8;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000063F8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000064EC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C178 + dword_10001C178);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100006590;
  return v4();
}

uint64_t sub_100006590(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  unsigned char *v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_1000066AC()
{
  unint64_t result = qword_10001C0C8;
  if (!qword_10001C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C0C8);
  }
  return result;
}

uint64_t sub_100006704()
{
  uint64_t v0 = qword_10001C020;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100006740()
{
  unint64_t result = qword_10001C0D0;
  if (!qword_10001C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C0D0);
  }
  return result;
}

unint64_t sub_100006798()
{
  unint64_t result = qword_10001C0D8;
  if (!qword_10001C0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C0D8);
  }
  return result;
}

unint64_t sub_1000067F0()
{
  unint64_t result = qword_10001C0E0;
  if (!qword_10001C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C0E0);
  }
  return result;
}

unint64_t sub_100006848()
{
  unint64_t result = qword_10001C0E8;
  if (!qword_10001C0E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C0E8);
  }
  return result;
}

uint64_t sub_10000689C()
{
  sub_100007BD0();
  uint64_t v2 = sub_1000112C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007C24(v3, v0, v2, v1);
}

unint64_t sub_100006934()
{
  unint64_t result = qword_10001C0F8;
  if (!qword_10001C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C0F8);
  }
  return result;
}

unint64_t sub_10000698C()
{
  unint64_t result = qword_10001C100;
  if (!qword_10001C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C100);
  }
  return result;
}

unint64_t sub_1000069E4()
{
  unint64_t result = qword_10001C108;
  if (!qword_10001C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C108);
  }
  return result;
}

unint64_t sub_100006A3C()
{
  unint64_t result = qword_10001C110;
  if (!qword_10001C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C110);
  }
  return result;
}

void sub_100006A90(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100006A9C@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C030 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100011360();
  uint64_t v3 = sub_100007B34(v2, (uint64_t)qword_10001C568);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100006B44()
{
  return sub_100007294(&qword_10001C118, &qword_10001C120);
}

uint64_t sub_100006B80(uint64_t a1)
{
  unint64_t v2 = sub_100004304();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100006BD0()
{
  unint64_t result = qword_10001C128;
  if (!qword_10001C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C128);
  }
  return result;
}

uint64_t sub_100006C24@<X0>(uint64_t a1@<X8>)
{
  return sub_1000046F8(*v1, a1);
}

uint64_t sub_100006C2C(uint64_t a1)
{
  unint64_t v2 = sub_1000069E4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100006C78(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x4550535F5069502FLL;
      break;
    case 3:
      unint64_t result = 0x617469746C754D2FLL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000020;
      break;
    case 6:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 7:
      unint64_t result = 0xD000000000000024;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 9:
      unint64_t result = 0x746375646F72502FLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000013;
      break;
    case 11:
      unint64_t result = 0x6F54656B6168532FLL;
      break;
    case 12:
      unint64_t result = 0x4772656E726F432FLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100006E3C(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x4550535F5069502FLL;
      break;
    case 3:
      unint64_t result = 0x617469746C754D2FLL;
      break;
    case 4:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000020;
      break;
    case 6:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 7:
      unint64_t result = 0xD000000000000024;
      break;
    case 8:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 9:
      unint64_t result = 0x746375646F72502FLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000013;
      break;
    case 11:
      unint64_t result = 0x6F54656B6168532FLL;
      break;
    case 12:
      unint64_t result = 0x4772656E726F432FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100007000(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_100006E3C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_100006E3C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100011450();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100007090()
{
  unint64_t result = qword_10001C130;
  if (!qword_10001C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C130);
  }
  return result;
}

Swift::Int sub_1000070E4()
{
  char v1 = *v0;
  sub_100011460();
  sub_100006E3C(v1);
  sub_100011420();
  swift_bridgeObjectRelease();
  return sub_100011470();
}

uint64_t sub_100007148()
{
  sub_100006E3C(*v0);
  sub_100011420();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000719C()
{
  char v1 = *v0;
  sub_100011460();
  sub_100006E3C(v1);
  sub_100011420();
  swift_bridgeObjectRelease();
  return sub_100011470();
}

uint64_t sub_1000071FC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100007AA4(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10000722C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100006E3C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100007258()
{
  return sub_100007294(&qword_10001C138, &qword_10001C140);
}

uint64_t sub_100007294(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000062FC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000072D8(void *a1@<X8>)
{
  *a1 = &off_1000189D8;
}

unint64_t sub_1000072E8()
{
  return sub_100006C78(*v0);
}

uint64_t sub_1000072F0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100007AA4(a1, a2);
  *a3 = result;
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for MultitaskingAndGesturesSettingsDestination(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_100007350(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100007358(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MultitaskingAndGesturesSettingsDestination()
{
  return &type metadata for MultitaskingAndGesturesSettingsDestination;
}

uint64_t _s37DisplayAndBrightnessSettingsExtension42MultitaskingAndGesturesSettingsDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF4) {
    goto LABEL_17;
  }
  if (a2 + 12 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 12) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 12;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 12;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xD;
  int v8 = v6 - 13;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s37DisplayAndBrightnessSettingsExtension42MultitaskingAndGesturesSettingsDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 12 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 12) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF3)
  {
    unsigned int v6 = ((a2 - 244) >> 8) + 1;
    *uint64_t result = a2 + 12;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000074CCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 12;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MultitaskingAndGesturesDeepLink()
{
  return &type metadata for MultitaskingAndGesturesDeepLink;
}

ValueMetadata *type metadata accessor for MultitaskingAndGesturesDeepLink.AvailableMultitaskingAndGesturesSettingsDestinationQuery()
{
  return &type metadata for MultitaskingAndGesturesDeepLink.AvailableMultitaskingAndGesturesSettingsDestinationQuery;
}

uint64_t sub_100007514()
{
  return _swift_task_switch(sub_100007530, 0, 0);
}

uint64_t sub_100007530()
{
  uint64_t v1 = sub_100007670((uint64_t)&off_1000189D8);
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    sub_10000D5A4(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v5 = *(unsigned char *)(v1 + v3 + 32);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v4 + v3 >= v6 >> 1) {
        sub_10000D5A4((char *)(v6 > 1), v4 + v3 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v4 + v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v4 + v3++ + 32) = v5;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  BOOL v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(&_swiftEmptyArrayStorage);
}

uint64_t sub_100007670(uint64_t result)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = result + 32;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  while (1)
  {
    if (v2 == v1) {
      return (uint64_t)&_swiftEmptyArrayStorage;
    }
    if (v4 == v1) {
      break;
    }
    char v5 = *(unsigned char *)(v3 + v1++);
    uint64_t result = sub_100005AB0(v5);
    if (result)
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = (uint64_t)sub_10000D5CC(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
      }
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v7 >= v6 >> 1) {
        uint64_t result = (uint64_t)sub_10000D5CC((char *)(v6 > 1), v7 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v7 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v7 + 32) = v5;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100007768(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100007788, 0, 0);
}

uint64_t sub_100007788()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_100007670(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    sub_10000D5A4(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_10000D5A4((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  int v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

uint64_t sub_1000078D4()
{
  return _swift_task_switch(sub_1000078F0, 0, 0);
}

uint64_t sub_1000078F0()
{
  uint64_t v1 = sub_100007670((uint64_t)&off_1000189D8);
  if (*(void *)(v1 + 16)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 32);
  }
  else {
    uint64_t v2 = 13;
  }
  swift_bridgeObjectRelease();
  int64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_10000797C()
{
  return _swift_task_switch(sub_100007998, 0, 0);
}

uint64_t sub_100007998()
{
  sub_10000D5A4(0, 13, 0);
  uint64_t v1 = 0;
  uint64_t v2 = &_swiftEmptyArrayStorage;
  uint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  do
  {
    char v4 = *((unsigned char *)&off_1000189D8 + v1 + 32);
    int v8 = v2;
    unint64_t v5 = v2[3];
    if (v3 + v1 >= v5 >> 1)
    {
      sub_10000D5A4((char *)(v5 > 1), v3 + v1 + 1, 1);
      uint64_t v2 = v8;
    }
    v2[2] = v3 + v1 + 1;
    *((unsigned char *)v2 + v3 + v1++ + 32) = v4;
  }
  while (v1 != 13);
  char v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100007AA4(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100018A08;
  v6._object = a2;
  unint64_t v4 = sub_100011440(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xD) {
    return 13;
  }
  else {
    return v4;
  }
}

uint64_t sub_100007AF0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007B34(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100007B6C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100007BD0()
{
  unint64_t result = qword_10001C160;
  if (!qword_10001C160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C160);
  }
  return result;
}

uint64_t sub_100007C24(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

unint64_t sub_100007C40()
{
  unint64_t result = qword_10001C1B0;
  if (!qword_10001C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1B0);
  }
  return result;
}

unint64_t sub_100007C98()
{
  unint64_t result = qword_10001C1B8;
  if (!qword_10001C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1B8);
  }
  return result;
}

unint64_t sub_100007CF0()
{
  unint64_t result = qword_10001C1C0[0];
  if (!qword_10001C1C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C1C0);
  }
  return result;
}

uint64_t sub_100007D44(char a1, char a2)
{
  unint64_t v3 = 0xE100000000000000;
  unint64_t v4 = 47;
  switch(a1)
  {
    case 1:
      unint64_t v4 = 0xD000000000000014;
      unint64_t v5 = "/APP_DOWNLOADS_GO_TO";
      goto LABEL_7;
    case 2:
      unint64_t v4 = 0xD000000000000016;
      unint64_t v5 = "/BADGES_IN_APP_LIBRARY";
      goto LABEL_7;
    case 3:
      unint64_t v3 = 0x8000000100013130;
      unint64_t v4 = 0xD000000000000011;
      break;
    case 4:
      unint64_t v4 = 0xD000000000000023;
      unint64_t v5 = "/MULTITASKING_DOCK#SHOW_APP_LIBRARY";
      goto LABEL_7;
    case 5:
      unint64_t v4 = 0xD00000000000001FLL;
      unint64_t v5 = "/HOME_SCREEN_DOCK#ALLOW_RECENTS";
LABEL_7:
      unint64_t v3 = (unint64_t)(v5 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE100000000000000;
  unint64_t v7 = 47;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xD000000000000014;
      int v8 = "/APP_DOWNLOADS_GO_TO";
      goto LABEL_14;
    case 2:
      unint64_t v7 = 0xD000000000000016;
      int v8 = "/BADGES_IN_APP_LIBRARY";
      goto LABEL_14;
    case 3:
      unint64_t v6 = 0x8000000100013130;
      unint64_t v7 = 0xD000000000000011;
      break;
    case 4:
      unint64_t v7 = 0xD000000000000023;
      int v8 = "/MULTITASKING_DOCK#SHOW_APP_LIBRARY";
      goto LABEL_14;
    case 5:
      unint64_t v7 = 0xD00000000000001FLL;
      int v8 = "/HOME_SCREEN_DOCK#ALLOW_RECENTS";
LABEL_14:
      unint64_t v6 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v4 == v7 && v3 == v6) {
    char v9 = 1;
  }
  else {
    char v9 = sub_100011450();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

Swift::Int sub_100007F00()
{
  return sub_100011470();
}

uint64_t sub_100008014()
{
  sub_100011420();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100008114()
{
  return sub_100011470();
}

uint64_t sub_100008224()
{
  uint64_t v0 = sub_100007AF0(&qword_10001C150);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000113A0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100011360();
  sub_100007B6C(v5, qword_10001C580);
  sub_100007B34(v5, (uint64_t)qword_10001C580);
  sub_100011380();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100011350();
}

uint64_t sub_100008390@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v19 = sub_100011390();
  uint64_t v3 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  v20 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000113D0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100011400();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100007AF0(&qword_10001C148);
  __chkstk_darwin(v7 - 8);
  char v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007AF0(&qword_10001C150);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000113A0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  __chkstk_darwin(v15);
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      sub_100011380();
      sub_100011380();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
      sub_100011270();
      uint64_t v17 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 0, 1, v17);
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v20, enum case for LocalizedStringResource.BundleDescription.main(_:), v19);
      break;
    default:
      sub_100011380();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
      sub_100011270();
      uint64_t v16 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 0, 1, v16);
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v20, enum case for LocalizedStringResource.BundleDescription.main(_:), v19);
      break;
  }
  sub_1000113B0();
  return sub_100011290();
}

uint64_t sub_100008D64(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10001C2C0 + dword_10001C2C0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100005E20;
  return v5(a1);
}

uint64_t sub_100008E0C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C2B8 + dword_10001C2B8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100007C38;
  return v4();
}

unint64_t sub_100008EB4()
{
  unint64_t result = qword_10001C1D8;
  if (!qword_10001C1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1D8);
  }
  return result;
}

uint64_t sub_100008F08(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C2B0 + dword_10001C2B0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000060C0;
  return v4();
}

unint64_t sub_100008FB0()
{
  unint64_t result = qword_10001C1E8;
  if (!qword_10001C1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1E8);
  }
  return result;
}

unint64_t sub_100009008()
{
  unint64_t result = qword_10001C1F0;
  if (!qword_10001C1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1F0);
  }
  return result;
}

unint64_t sub_100009060()
{
  unint64_t result = qword_10001C1F8;
  if (!qword_10001C1F8)
  {
    sub_1000062FC(qword_10001C200);
    sub_100009008();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C1F8);
  }
  return result;
}

uint64_t sub_1000090D4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100008EB4();
  *uint64_t v5 = v2;
  v5[1] = sub_1000063F8;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100009188(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000091A8, 0, 0);
}

uint64_t sub_1000091A8()
{
  **(unsigned char **)(v0 + 16) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1000091C8()
{
  unint64_t result = qword_10001C218;
  if (!qword_10001C218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C218);
  }
  return result;
}

uint64_t sub_10000921C()
{
  uint64_t v0 = sub_100007AF0(&qword_10001C2A0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007AF0(&qword_10001C2A8);
  __chkstk_darwin(v4);
  sub_100007CF0();
  sub_100011310();
  v7._object = (void *)0x8000000100014BD0;
  v7._countAndFlagsBits = 0xD000000000000040;
  sub_100011300(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_1000112F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100011300(v8);
  return sub_100011320();
}

uint64_t sub_1000093D8()
{
  uint64_t v0 = qword_10001C1A0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100009414()
{
  unint64_t result = qword_10001C220;
  if (!qword_10001C220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C220);
  }
  return result;
}

unint64_t sub_10000946C()
{
  unint64_t result = qword_10001C228;
  if (!qword_10001C228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C228);
  }
  return result;
}

unint64_t sub_1000094C4()
{
  unint64_t result = qword_10001C230;
  if (!qword_10001C230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C230);
  }
  return result;
}

unint64_t sub_10000951C()
{
  unint64_t result = qword_10001C238;
  if (!qword_10001C238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C238);
  }
  return result;
}

uint64_t sub_100009570()
{
  sub_10000A4B4();
  uint64_t v2 = sub_1000112C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007C24(v3, v0, v2, v1);
}

unint64_t sub_100009608()
{
  unint64_t result = qword_10001C248;
  if (!qword_10001C248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C248);
  }
  return result;
}

unint64_t sub_100009660()
{
  unint64_t result = qword_10001C250;
  if (!qword_10001C250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C250);
  }
  return result;
}

unint64_t sub_1000096B8()
{
  unint64_t result = qword_10001C258;
  if (!qword_10001C258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C258);
  }
  return result;
}

unint64_t sub_100009710()
{
  unint64_t result = qword_10001C260;
  if (!qword_10001C260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C260);
  }
  return result;
}

uint64_t sub_100009764@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C038 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100011360();
  uint64_t v3 = sub_100007B34(v2, (uint64_t)qword_10001C580);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000980C()
{
  return sub_100007294(&qword_10001C268, &qword_10001C270);
}

uint64_t sub_100009848(uint64_t a1)
{
  unint64_t v2 = sub_100007CF0();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100009898()
{
  unint64_t result = qword_10001C278;
  if (!qword_10001C278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C278);
  }
  return result;
}

uint64_t sub_1000098EC@<X0>(uint64_t a1@<X8>)
{
  return sub_100008390(*v1, a1);
}

uint64_t sub_1000098F4(uint64_t a1)
{
  unint64_t v2 = sub_1000096B8();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100009940(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000023;
      break;
    case 5:
      unint64_t result = 0xD00000000000001FLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_100009A0C(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000014;
      break;
    case 2:
      unint64_t result = 0xD000000000000016;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    case 4:
      unint64_t result = 0xD000000000000023;
      break;
    case 5:
      unint64_t result = 0xD00000000000001FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100009AD8(char *a1, char *a2)
{
  return sub_100007D44(*a1, *a2);
}

unint64_t sub_100009AE8()
{
  unint64_t result = qword_10001C280;
  if (!qword_10001C280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C280);
  }
  return result;
}

Swift::Int sub_100009B3C()
{
  return sub_100007F00();
}

uint64_t sub_100009B44()
{
  return sub_100008014();
}

Swift::Int sub_100009B4C()
{
  return sub_100008114();
}

uint64_t sub_100009B54@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000A468(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_100009B84@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100009A0C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100009BB0()
{
  return sub_100007294(&qword_10001C288, &qword_10001C290);
}

void sub_100009BEC(void *a1@<X8>)
{
  *a1 = &off_100018B88;
}

unint64_t sub_100009BFC()
{
  return sub_100009940(*v0);
}

uint64_t sub_100009C04@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_10000A468(a1, a2);
  *a3 = result;
  return result;
}

ValueMetadata *type metadata accessor for HomeScreenAndAppLibrarySettingsDestination()
{
  return &type metadata for HomeScreenAndAppLibrarySettingsDestination;
}

uint64_t _s37DisplayAndBrightnessSettingsExtension42HomeScreenAndAppLibrarySettingsDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s37DisplayAndBrightnessSettingsExtension42HomeScreenAndAppLibrarySettingsDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100009DC0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeScreenAndAppLibraryDeepLink()
{
  return &type metadata for HomeScreenAndAppLibraryDeepLink;
}

ValueMetadata *type metadata accessor for HomeScreenAndAppLibraryDeepLink.AvailableHomeScreenAndAppLibrarySettingsDestinationQuery()
{
  return &type metadata for HomeScreenAndAppLibraryDeepLink.AvailableHomeScreenAndAppLibrarySettingsDestinationQuery;
}

void sub_100009E08(uint64_t a1)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = a1 + 32;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  while (v2 != v1)
  {
    unint64_t v5 = v1;
    if (v4 == v1)
    {
      __break(1u);
      return;
    }
    unsigned int v6 = *(unsigned __int8 *)(v3 + v1);
    if (v6 >= 3)
    {
      id v7 = [self currentDevice];
      id v8 = [v7 userInterfaceIdiom];

      unint64_t v1 = v5 + 1;
      if (v8 != (id)1) {
        continue;
      }
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_10000D61C(0, _swiftEmptyArrayStorage[2] + 1, 1);
    }
    unint64_t v10 = _swiftEmptyArrayStorage[2];
    unint64_t v9 = _swiftEmptyArrayStorage[3];
    if (v10 >= v9 >> 1) {
      sub_10000D61C((char *)(v9 > 1), v10 + 1, 1);
    }
    unint64_t v1 = v5 + 1;
    _swiftEmptyArrayStorage[2] = v10 + 1;
    *((unsigned char *)&_swiftEmptyArrayStorage[4] + v10) = v6;
    goto LABEL_2;
  }
}

uint64_t sub_100009F44()
{
  return _swift_task_switch(sub_100009F60, 0, 0);
}

uint64_t sub_100009F60()
{
  sub_100009E08((uint64_t)&off_100018B60);
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    sub_10000D5F4(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = _swiftEmptyArrayStorage[2];
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v5 + v4 >= v7 >> 1) {
        sub_10000D5F4((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v5 + v4++) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  id v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(_swiftEmptyArrayStorage);
}

uint64_t sub_10000A0A0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000A0C0, 0, 0);
}

uint64_t sub_10000A0C0()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_100009E08(v1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  int64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    sub_10000D5F4(0, v4, 0);
    uint64_t v5 = 0;
    uint64_t v6 = _swiftEmptyArrayStorage[2];
    do
    {
      char v7 = *(unsigned char *)(v3 + v5 + 32);
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v6 + v5 >= v8 >> 1) {
        sub_10000D5F4((char *)(v8 > 1), v6 + v5 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v6 + v5 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v6 + v5++) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  unint64_t v9 = *(uint64_t (**)(void *))(v0 + 8);
  return v9(_swiftEmptyArrayStorage);
}

uint64_t sub_10000A20C()
{
  return _swift_task_switch(sub_10000A228, 0, 0);
}

uint64_t sub_10000A228()
{
  sub_10000D5F4(0, 6, 0);
  unint64_t v2 = _swiftEmptyArrayStorage[2];
  unint64_t v1 = _swiftEmptyArrayStorage[3];
  int64_t v3 = v1 >> 1;
  unint64_t v4 = v2 + 1;
  if (v1 >> 1 <= v2)
  {
    sub_10000D5F4((char *)(v1 > 1), v2 + 1, 1);
    unint64_t v1 = _swiftEmptyArrayStorage[3];
    int64_t v3 = v1 >> 1;
  }
  _swiftEmptyArrayStorage[2] = v4;
  *((unsigned char *)&_swiftEmptyArrayStorage[4] + v2) = 0;
  unint64_t v5 = v2 + 2;
  if (v3 < (uint64_t)(v2 + 2))
  {
    sub_10000D5F4((char *)(v1 > 1), v2 + 2, 1);
    unint64_t v1 = _swiftEmptyArrayStorage[3];
    int64_t v3 = v1 >> 1;
  }
  _swiftEmptyArrayStorage[2] = v5;
  *((unsigned char *)&_swiftEmptyArrayStorage[4] + v4) = 1;
  unint64_t v6 = v2 + 3;
  if (v3 < (uint64_t)(v2 + 3)) {
    sub_10000D5F4((char *)(v1 > 1), v2 + 3, 1);
  }
  _swiftEmptyArrayStorage[2] = v6;
  *((unsigned char *)&_swiftEmptyArrayStorage[4] + v5) = 2;
  unint64_t v7 = _swiftEmptyArrayStorage[3];
  int64_t v8 = v7 >> 1;
  unint64_t v9 = v2 + 4;
  if ((uint64_t)(v7 >> 1) < (uint64_t)(v2 + 4))
  {
    sub_10000D5F4((char *)(v7 > 1), v2 + 4, 1);
    unint64_t v7 = _swiftEmptyArrayStorage[3];
    int64_t v8 = v7 >> 1;
  }
  _swiftEmptyArrayStorage[2] = v9;
  *((unsigned char *)&_swiftEmptyArrayStorage[4] + v6) = 3;
  unint64_t v10 = v2 + 5;
  if (v8 < (uint64_t)(v2 + 5))
  {
    sub_10000D5F4((char *)(v7 > 1), v2 + 5, 1);
    unint64_t v7 = _swiftEmptyArrayStorage[3];
    int64_t v8 = v7 >> 1;
  }
  _swiftEmptyArrayStorage[2] = v10;
  *((unsigned char *)&_swiftEmptyArrayStorage[4] + v9) = 4;
  if (v8 < (uint64_t)(v2 + 6)) {
    sub_10000D5F4((char *)(v7 > 1), v2 + 6, 1);
  }
  _swiftEmptyArrayStorage[2] = v2 + 6;
  *((unsigned char *)&_swiftEmptyArrayStorage[4] + v10) = 5;
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_10000A468(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100018BD8;
  v6._object = a2;
  unint64_t v4 = sub_100011440(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 6) {
    return 6;
  }
  else {
    return v4;
  }
}

unint64_t sub_10000A4B4()
{
  unint64_t result = qword_10001C298;
  if (!qword_10001C298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C298);
  }
  return result;
}

uint64_t sub_10000A508(uint64_t a1)
{
  unint64_t v2 = sub_10000A658();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_10000A5B0()
{
  unint64_t result = qword_10001C2C8;
  if (!qword_10001C2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2C8);
  }
  return result;
}

uint64_t sub_10000A608()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000A658()
{
  unint64_t result = qword_10001C2D0;
  if (!qword_10001C2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DisplayAndBrightnessSettingsExtension()
{
  return &type metadata for DisplayAndBrightnessSettingsExtension;
}

unint64_t sub_10000A6C0()
{
  unint64_t result = qword_10001C2E8;
  if (!qword_10001C2E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2E8);
  }
  return result;
}

unint64_t sub_10000A718()
{
  unint64_t result = qword_10001C2F0;
  if (!qword_10001C2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C2F0);
  }
  return result;
}

unint64_t sub_10000A770()
{
  unint64_t result = qword_10001C2F8[0];
  if (!qword_10001C2F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10001C2F8);
  }
  return result;
}

uint64_t sub_10000A7C4()
{
  uint64_t v0 = sub_100007AF0(&qword_10001C150);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1000113A0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100011360();
  sub_100007B6C(v5, qword_10001C598);
  sub_100007B34(v5, (uint64_t)qword_10001C598);
  sub_100011380();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100011350();
}

uint64_t sub_10000A930@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v34 = sub_100011390();
  uint64_t v3 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  v35 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000113D0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_100011400();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_100007AF0(&qword_10001C148);
  __chkstk_darwin(v7 - 8);
  unint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100007AF0(&qword_10001C150);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000113A0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v31 - v18;
  switch(a1)
  {
    case 1:
      sub_100011380();
      sub_100011380();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
      sub_100011270();
      uint64_t v21 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v9, 0, 1, v21);
      sub_100007AF0(&qword_10001C158);
      v32 = v17;
      v33 = v19;
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012290;
      sub_100011380();
      sub_100011380();
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v35, enum case for LocalizedStringResource.BundleDescription.main(_:), v34);
      sub_1000113B0();
      return sub_100011290();
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
    case 12:
    case 14:
      sub_100011380();
      sub_100011380();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
      sub_100011270();
      uint64_t v29 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v9, 0, 1, v29);
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v35, enum case for LocalizedStringResource.BundleDescription.main(_:), v34);
      goto LABEL_9;
    case 8:
      sub_100011380();
      sub_100011380();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
      sub_100011270();
      uint64_t v22 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v9, 0, 1, v22);
      sub_100007AF0(&qword_10001C158);
      v32 = v17;
      v33 = v19;
      uint64_t v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_1000116E0;
      sub_1000113F0();
      sub_1000113C0();
      uint64_t v23 = enum case for LocalizedStringResource.BundleDescription.main(_:);
      v24 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
      uint64_t v25 = v34;
      v26 = v35;
      v24(v35, enum case for LocalizedStringResource.BundleDescription.main(_:), v34);
      sub_1000113B0();
      sub_1000113F0();
      sub_1000113C0();
      v24(v26, v23, v25);
      sub_1000113B0();
      return sub_100011290();
    case 11:
      sub_100011380();
      sub_100011380();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
      sub_100011270();
      uint64_t v27 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v9, 0, 1, v27);
      sub_100007AF0(&qword_10001C158);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000116E0;
      sub_100011380();
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v35, enum case for LocalizedStringResource.BundleDescription.main(_:), v34);
      sub_1000113B0();
      return sub_100011290();
    case 13:
      sub_100011380();
      sub_100011380();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
      sub_100011270();
      uint64_t v28 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v9, 0, 1, v28);
      sub_100007AF0(&qword_10001C158);
      v32 = v17;
      v33 = v19;
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012280;
      sub_100011380();
      sub_100011380();
      sub_100011380();
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v35, enum case for LocalizedStringResource.BundleDescription.main(_:), v34);
      goto LABEL_9;
    default:
      sub_100011380();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
      sub_100011270();
      uint64_t v20 = sub_100011280();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v9, 0, 1, v20);
      sub_100007AF0(&qword_10001C158);
      v32 = v17;
      v33 = v19;
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012280;
      sub_100011380();
      sub_100011380();
      sub_100011380();
      sub_1000113F0();
      sub_1000113C0();
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v35, enum case for LocalizedStringResource.BundleDescription.main(_:), v34);
LABEL_9:
      sub_1000113B0();
      return sub_100011290();
  }
}

uint64_t sub_10000C19C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10001C408 + dword_10001C408);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100005E20;
  return v5(a1);
}

uint64_t sub_10000C244(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C3F8 + dword_10001C3F8);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_100007C38;
  return v4();
}

unint64_t sub_10000C2EC()
{
  unint64_t result = qword_10001C310;
  if (!qword_10001C310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C310);
  }
  return result;
}

uint64_t sub_10000C340(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10001C3E8 + dword_10001C3E8);
  unint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *unint64_t v2 = v1;
  v2[1] = sub_1000060C0;
  return v4();
}

unint64_t sub_10000C3E8()
{
  unint64_t result = qword_10001C320;
  if (!qword_10001C320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C320);
  }
  return result;
}

unint64_t sub_10000C440()
{
  unint64_t result = qword_10001C328;
  if (!qword_10001C328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C328);
  }
  return result;
}

unint64_t sub_10000C498()
{
  unint64_t result = qword_10001C330;
  if (!qword_10001C330)
  {
    sub_1000062FC(qword_10001C338);
    sub_10000C440();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C330);
  }
  return result;
}

uint64_t sub_10000C50C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_10000C2EC();
  *uint64_t v5 = v2;
  v5[1] = sub_1000063F8;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10000C5C4()
{
  unint64_t result = qword_10001C350;
  if (!qword_10001C350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C350);
  }
  return result;
}

uint64_t sub_10000C618()
{
  uint64_t v0 = sub_100007AF0(&qword_10001C3D8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007AF0(&qword_10001C3E0);
  __chkstk_darwin(v4);
  sub_10000A770();
  sub_100011310();
  v7._object = (void *)0x8000000100015DD0;
  v7._countAndFlagsBits = 0xD000000000000030;
  sub_100011300(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_1000112F0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100011300(v8);
  return sub_100011320();
}

uint64_t sub_10000C7D4()
{
  uint64_t v0 = qword_10001C2D8;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_10000C810()
{
  unint64_t result = qword_10001C358;
  if (!qword_10001C358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C358);
  }
  return result;
}

unint64_t sub_10000C868()
{
  unint64_t result = qword_10001C360;
  if (!qword_10001C360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C360);
  }
  return result;
}

unint64_t sub_10000C8C0()
{
  unint64_t result = qword_10001C368;
  if (!qword_10001C368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C368);
  }
  return result;
}

unint64_t sub_10000C918()
{
  unint64_t result = qword_10001C370;
  if (!qword_10001C370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C370);
  }
  return result;
}

uint64_t sub_10000C96C()
{
  sub_10000DD88();
  uint64_t v2 = sub_1000112C0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100007C24(v3, v0, v2, v1);
}

unint64_t sub_10000CA04()
{
  unint64_t result = qword_10001C380;
  if (!qword_10001C380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C380);
  }
  return result;
}

unint64_t sub_10000CA5C()
{
  unint64_t result = qword_10001C388;
  if (!qword_10001C388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C388);
  }
  return result;
}

unint64_t sub_10000CAB4()
{
  unint64_t result = qword_10001C390;
  if (!qword_10001C390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C390);
  }
  return result;
}

unint64_t sub_10000CB0C()
{
  unint64_t result = qword_10001C398;
  if (!qword_10001C398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C398);
  }
  return result;
}

uint64_t sub_10000CB60@<X0>(uint64_t a1@<X8>)
{
  if (qword_10001C040 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100011360();
  uint64_t v3 = sub_100007B34(v2, (uint64_t)qword_10001C598);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_10000CC08()
{
  return sub_100007294(&qword_10001C3A0, &qword_10001C3A8);
}

uint64_t sub_10000CC44(uint64_t a1)
{
  unint64_t v2 = sub_10000A770();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000CC94()
{
  unint64_t result = qword_10001C3B0;
  if (!qword_10001C3B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3B0);
  }
  return result;
}

uint64_t sub_10000CCE8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A930(*v1, a1);
}

uint64_t sub_10000CCF0(uint64_t a1)
{
  unint64_t v2 = sub_10000CAB4();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000CD3C(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
    case 7:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000027;
      break;
    case 5:
      unint64_t result = 0x434F4C4F5455412FLL;
      break;
    case 6:
      unint64_t result = 0x545F45534941522FLL;
      break;
    case 8:
      unint64_t result = 0x49535F545845542FLL;
      break;
    case 9:
      unint64_t result = 0x45545F444C4F422FLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000013;
      break;
    case 11:
      unint64_t result = 0x5946494E47414D2FLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000014;
      break;
    case 13:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 14:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10000CF18(char a1)
{
  unint64_t result = 47;
  switch(a1)
  {
    case 1:
    case 7:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 3:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000027;
      break;
    case 5:
      unint64_t result = 0x434F4C4F5455412FLL;
      break;
    case 6:
      unint64_t result = 0x545F45534941522FLL;
      break;
    case 8:
      unint64_t result = 0x49535F545845542FLL;
      break;
    case 9:
      unint64_t result = 0x45545F444C4F422FLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000013;
      break;
    case 11:
      unint64_t result = 0x5946494E47414D2FLL;
      break;
    case 12:
      unint64_t result = 0xD000000000000014;
      break;
    case 13:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 14:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000D0F4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10000CF18(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000CF18(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100011450();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_10000D184()
{
  unint64_t result = qword_10001C3B8;
  if (!qword_10001C3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3B8);
  }
  return result;
}

Swift::Int sub_10000D1D8()
{
  char v1 = *v0;
  sub_100011460();
  sub_10000CF18(v1);
  sub_100011420();
  swift_bridgeObjectRelease();
  return sub_100011470();
}

uint64_t sub_10000D23C()
{
  sub_10000CF18(*v0);
  sub_100011420();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000D290()
{
  char v1 = *v0;
  sub_100011460();
  sub_10000CF18(v1);
  sub_100011420();
  swift_bridgeObjectRelease();
  return sub_100011470();
}

uint64_t sub_10000D2F0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000DD3C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_10000D320@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000CF18(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000D34C()
{
  return sub_100007294(&qword_10001C3C0, &qword_10001C3C8);
}

void sub_10000D388(void *a1@<X8>)
{
  *a1 = &off_100018C88;
}

unint64_t sub_10000D398()
{
  return sub_10000CD3C(*v0);
}

uint64_t sub_10000D3A0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_10000DD3C(a1, a2);
  *a3 = result;
  return result;
}

ValueMetadata *type metadata accessor for DisplayAndBrightnessSettingsDestination()
{
  return &type metadata for DisplayAndBrightnessSettingsDestination;
}

uint64_t _s37DisplayAndBrightnessSettingsExtension39DisplayAndBrightnessSettingsDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s37DisplayAndBrightnessSettingsExtension39DisplayAndBrightnessSettingsDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *uint64_t result = a2 + 14;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000D55CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DisplayAndBrightnessDeepLink()
{
  return &type metadata for DisplayAndBrightnessDeepLink;
}

ValueMetadata *type metadata accessor for DisplayAndBrightnessDeepLink.AvailableDisplayAndBrightnessSettingsDestinationQuery()
{
  return &type metadata for DisplayAndBrightnessDeepLink.AvailableDisplayAndBrightnessSettingsDestinationQuery;
}

char *sub_10000D5A4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D694(a1, a2, a3, *v3, &qword_10001C428);
  char *v3 = result;
  return result;
}

char *sub_10000D5CC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D694(a1, a2, a3, *v3, &qword_10001C420);
  char *v3 = result;
  return result;
}

char *sub_10000D5F4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D694(a1, a2, a3, *v3, &qword_10001C410);
  char *v3 = result;
  return result;
}

char *sub_10000D61C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D694(a1, a2, a3, *v3, &qword_10001C418);
  char *v3 = result;
  return result;
}

char *sub_10000D644(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D694(a1, a2, a3, *v3, &qword_10001C3F0);
  char *v3 = result;
  return result;
}

char *sub_10000D66C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D694(a1, a2, a3, *v3, &qword_10001C400);
  char *v3 = result;
  return result;
}

char *sub_10000D694(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    sub_100007AF0(a5);
    uint64_t v11 = (char *)swift_allocObject();
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_release();
  return v11;
}

void sub_10000D77C(uint64_t a1)
{
  unint64_t v1 = 0;
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = a1 + 32;
  uint64_t v16 = _swiftEmptyArrayStorage;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  while (v2 != v1)
  {
    unint64_t v5 = v1;
    if (v4 == v1)
    {
      __break(1u);
LABEL_17:
      __break(1u);
      return;
    }
    int v6 = *(unsigned __int8 *)(v3 + v1);
    if (v6 != 6) {
      goto LABEL_10;
    }
    id v7 = [self sharedManager];
    if (!v7) {
      goto LABEL_17;
    }
    int64_t v8 = v7;
    sub_100007AF0(&qword_10001C180);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1000116E0;
    uint64_t v10 = sub_100011410();
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 32) = v10;
    *(void *)(v9 + 40) = v11;
    Class isa = sub_100011430().super.isa;
    swift_bridgeObjectRelease();
    LODWORD(v9) = [v8 hasCapabilities:isa];

    unint64_t v1 = v5 + 1;
    if (v9)
    {
LABEL_10:
      uint64_t v13 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000D66C(0, v16[2] + 1, 1);
        uint64_t v13 = v16;
      }
      unint64_t v15 = v13[2];
      unint64_t v14 = v13[3];
      if (v15 >= v14 >> 1)
      {
        sub_10000D66C((char *)(v14 > 1), v15 + 1, 1);
        uint64_t v13 = v16;
      }
      unint64_t v1 = v5 + 1;
      v13[2] = v15 + 1;
      uint64_t v16 = v13;
      *((unsigned char *)v13 + v15 + 32) = v6;
      goto LABEL_2;
    }
  }
}

uint64_t sub_10000D954()
{
  return _swift_task_switch(sub_10000D970, 0, 0);
}

uint64_t sub_10000D970()
{
  sub_10000D77C((uint64_t)&off_100018C88);
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    sub_10000D644(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = _swiftEmptyArrayStorage[2];
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = _swiftEmptyArrayStorage[3];
      if (v5 + v4 >= v7 >> 1) {
        sub_10000D644((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v5 + v4++) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  int64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(_swiftEmptyArrayStorage);
}

uint64_t sub_10000DAB0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_10000DAD0, 0, 0);
}

uint64_t sub_10000DAD0()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_10000D77C(v1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  int64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    sub_10000D644(0, v4, 0);
    uint64_t v5 = 0;
    uint64_t v6 = _swiftEmptyArrayStorage[2];
    do
    {
      char v7 = *(unsigned char *)(v3 + v5 + 32);
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      if (v6 + v5 >= v8 >> 1) {
        sub_10000D644((char *)(v8 > 1), v6 + v5 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v6 + v5 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage[4] + v6 + v5++) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = *(uint64_t (**)(void *))(v0 + 8);
  return v9(_swiftEmptyArrayStorage);
}

uint64_t sub_10000DC1C()
{
  return _swift_task_switch(sub_10000DC38, 0, 0);
}

uint64_t sub_10000DC38()
{
  uint64_t v1 = 15;
  sub_10000D644(0, 15, 0);
  uint64_t v2 = _swiftEmptyArrayStorage;
  unint64_t v3 = _swiftEmptyArrayStorage[2];
  int64_t v4 = &byte_100018CA8;
  do
  {
    char v6 = *v4++;
    char v5 = v6;
    uint64_t v10 = v2;
    unint64_t v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_10000D644((char *)(v7 > 1), v3 + 1, 1);
      uint64_t v2 = v10;
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  unint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10000DD3C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100018CB8;
  v6._object = a2;
  unint64_t v4 = sub_100011440(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xF) {
    return 15;
  }
  else {
    return v4;
  }
}

unint64_t sub_10000DD88()
{
  unint64_t result = qword_10001C3D0;
  if (!qword_10001C3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C3D0);
  }
  return result;
}

uint64_t sub_10000DDE0(uint64_t a1)
{
  v11[1] = a1;
  uint64_t v13 = sub_100007AF0(&qword_10001C498);
  uint64_t v1 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  Swift::OpaquePointer v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007AF0(&qword_10001C4A0);
  __chkstk_darwin(v4);
  sub_10000F798();
  sub_100011210();
  v14._object = (void *)0xE900000000000020;
  v14._countAndFlagsBits = 0x656874206E65704FLL;
  sub_100011200(v14);
  swift_getKeyPath();
  sub_10000C440();
  sub_100011160();
  swift_release();
  sub_1000111F0();
  swift_release();
  v15._countAndFlagsBits = 0x676E697474655320;
  v15._object = (void *)0xE900000000000073;
  sub_100011200(v15);
  sub_100011220();
  uint64_t v12 = sub_100011180();
  char v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v6 = v13;
  v5(v3, v13);
  sub_100011210();
  v16._countAndFlagsBits = 0x742065676E616843;
  v16._object = (void *)0xEB00000000206568;
  sub_100011200(v16);
  swift_getKeyPath();
  sub_100011160();
  swift_release();
  sub_1000111F0();
  swift_release();
  v17._countAndFlagsBits = 0x676E697474655320;
  v17._object = (void *)0xE900000000000073;
  sub_100011200(v17);
  sub_100011220();
  uint64_t v7 = sub_100011180();
  v5(v3, v6);
  sub_100007AF0(&qword_10001C4A8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100012290;
  *(void *)(v8 + 32) = v12;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = sub_100011170();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_10000E12C(uint64_t a1)
{
  return sub_10000F048(a1, (uint64_t)&unk_1000129B0, (void (*)(void))sub_10000C440, (void (*)(uint64_t))sub_10000F798);
}

uint64_t sub_10000E174()
{
  uint64_t v0 = sub_1000111A0();
  uint64_t v1 = sub_1000111A0();
  uint64_t v2 = sub_1000111A0();
  uint64_t v3 = sub_1000111A0();
  uint64_t v4 = sub_1000111A0();
  uint64_t v5 = sub_1000111A0();
  uint64_t v6 = sub_1000111A0();
  uint64_t v7 = sub_1000111A0();
  uint64_t v8 = sub_1000111A0();
  sub_100007AF0(&qword_10001C440);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100012800;
  *(void *)(v9 + 32) = v0;
  *(void *)(v9 + 40) = v1;
  *(void *)(v9 + 48) = v2;
  *(void *)(v9 + 56) = v3;
  *(void *)(v9 + 64) = v4;
  *(void *)(v9 + 72) = v5;
  *(void *)(v9 + 80) = v6;
  *(void *)(v9 + 88) = v7;
  *(void *)(v9 + 96) = v8;
  uint64_t v10 = sub_100011190();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000E32C()
{
  uint64_t v0 = sub_1000111A0();
  sub_100007AF0(&qword_10001C440);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1000116E0;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_100011190();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_10000E3A8()
{
  uint64_t v0 = sub_100011250();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100010560();
  sub_10000F798();
  sub_100011260();
  uint64_t v4 = sub_100011240();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100007AF0(&qword_10001C448);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000116E0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100011230();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000E508(uint64_t a1, uint64_t a2)
{
  return sub_10000F540(a1, a2, (void (*)(uint64_t))sub_10000F798);
}

uint64_t sub_10000E53C(uint64_t a1)
{
  v11[1] = a1;
  uint64_t v13 = sub_100007AF0(&qword_10001C478);
  uint64_t v1 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007AF0(&qword_10001C480);
  __chkstk_darwin(v4);
  sub_10000F740();
  sub_100011210();
  v14._object = (void *)0xE900000000000020;
  v14._countAndFlagsBits = 0x656874206E65704FLL;
  sub_100011200(v14);
  swift_getKeyPath();
  sub_100006230();
  sub_100011160();
  swift_release();
  sub_1000111F0();
  swift_release();
  v15._countAndFlagsBits = 0x676E697474655320;
  v15._object = (void *)0xE900000000000073;
  sub_100011200(v15);
  sub_100011220();
  uint64_t v12 = sub_100011180();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v6 = v13;
  v5(v3, v13);
  sub_100011210();
  v16._countAndFlagsBits = 0x742065676E616843;
  v16._object = (void *)0xEB00000000206568;
  sub_100011200(v16);
  swift_getKeyPath();
  sub_100011160();
  swift_release();
  sub_1000111F0();
  swift_release();
  v17._countAndFlagsBits = 0x676E697474655320;
  v17._object = (void *)0xE900000000000073;
  sub_100011200(v17);
  sub_100011220();
  uint64_t v7 = sub_100011180();
  v5(v3, v6);
  sub_100007AF0(&qword_10001C488);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100012290;
  *(void *)(v8 + 32) = v12;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = sub_100011170();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_10000E888(uint64_t a1)
{
  return sub_10000F048(a1, (uint64_t)&unk_100012988, (void (*)(void))sub_100006230, (void (*)(uint64_t))sub_10000F740);
}

uint64_t sub_10000E8D0()
{
  uint64_t v0 = sub_1000111A0();
  uint64_t v1 = sub_1000111A0();
  uint64_t v2 = sub_1000111A0();
  uint64_t v3 = sub_1000111A0();
  uint64_t v4 = sub_1000111A0();
  uint64_t v5 = sub_1000111A0();
  uint64_t v6 = sub_1000111A0();
  uint64_t v7 = sub_1000111A0();
  uint64_t v8 = sub_1000111A0();
  sub_100007AF0(&qword_10001C440);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100012800;
  *(void *)(v9 + 32) = v0;
  *(void *)(v9 + 40) = v1;
  *(void *)(v9 + 48) = v2;
  *(void *)(v9 + 56) = v3;
  *(void *)(v9 + 64) = v4;
  *(void *)(v9 + 72) = v5;
  *(void *)(v9 + 80) = v6;
  *(void *)(v9 + 88) = v7;
  *(void *)(v9 + 96) = v8;
  uint64_t v10 = sub_100011190();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000EA80()
{
  uint64_t v0 = sub_1000111A0();
  uint64_t v1 = sub_1000111A0();
  sub_100007AF0(&qword_10001C440);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100012290;
  *(void *)(v2 + 32) = v0;
  *(void *)(v2 + 40) = v1;
  uint64_t v3 = sub_100011190();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_10000EB24()
{
  uint64_t v0 = sub_100011250();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100010848();
  sub_10000F740();
  sub_100011260();
  uint64_t v4 = sub_100011240();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100007AF0(&qword_10001C448);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000116E0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100011230();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000EC80(uint64_t a1, uint64_t a2)
{
  return sub_10000F540(a1, a2, (void (*)(uint64_t))sub_10000F740);
}

uint64_t sub_10000ECB4(uint64_t a1)
{
  v11[1] = a1;
  uint64_t v13 = sub_100007AF0(&qword_10001C458);
  uint64_t v1 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100007AF0(&qword_10001C460);
  __chkstk_darwin(v4);
  sub_10000F6AC();
  sub_100011210();
  v14._object = (void *)0xE900000000000020;
  v14._countAndFlagsBits = 0x656874206E65704FLL;
  sub_100011200(v14);
  swift_getKeyPath();
  sub_100009008();
  sub_100011160();
  swift_release();
  sub_1000111F0();
  swift_release();
  v15._countAndFlagsBits = 0x676E697474655320;
  v15._object = (void *)0xE900000000000073;
  sub_100011200(v15);
  sub_100011220();
  uint64_t v12 = sub_100011180();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v6 = v13;
  v5(v3, v13);
  sub_100011210();
  v16._countAndFlagsBits = 0x742065676E616843;
  v16._object = (void *)0xEB00000000206568;
  sub_100011200(v16);
  swift_getKeyPath();
  sub_100011160();
  swift_release();
  sub_1000111F0();
  swift_release();
  v17._countAndFlagsBits = 0x676E697474655320;
  v17._object = (void *)0xE900000000000073;
  sub_100011200(v17);
  sub_100011220();
  uint64_t v7 = sub_100011180();
  v5(v3, v6);
  sub_100007AF0(&qword_10001C468);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100012290;
  *(void *)(v8 + 32) = v12;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = sub_100011170();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_10000F000(uint64_t a1)
{
  return sub_10000F048(a1, (uint64_t)&unk_100012960, (void (*)(void))sub_100009008, (void (*)(uint64_t))sub_10000F6AC);
}

uint64_t sub_10000F048(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6 = sub_1000111E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_100011160();
  uint64_t v10 = swift_release();
  a4(v10);
  sub_1000111D0();
  uint64_t v11 = sub_1000111C0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100007AF0(&qword_10001C450);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1000116E0;
  *(void *)(v12 + 32) = v11;
  uint64_t v13 = sub_1000111B0();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_10000F1C0()
{
  uint64_t v0 = sub_1000111A0();
  uint64_t v1 = sub_1000111A0();
  uint64_t v2 = sub_1000111A0();
  uint64_t v3 = sub_1000111A0();
  uint64_t v4 = sub_1000111A0();
  sub_100007AF0(&qword_10001C440);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100012810;
  *(void *)(v5 + 32) = v0;
  *(void *)(v5 + 40) = v1;
  *(void *)(v5 + 48) = v2;
  *(void *)(v5 + 56) = v3;
  *(void *)(v5 + 64) = v4;
  uint64_t v6 = sub_100011190();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000F2D8()
{
  uint64_t v0 = sub_1000111A0();
  uint64_t v1 = sub_1000111A0();
  uint64_t v2 = sub_1000111A0();
  sub_100007AF0(&qword_10001C440);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100012280;
  *(void *)(v3 + 32) = v0;
  *(void *)(v3 + 40) = v1;
  *(void *)(v3 + 48) = v2;
  uint64_t v4 = sub_100011190();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10000F3B0()
{
  uint64_t v0 = sub_100011250();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100010B30();
  sub_10000F6AC();
  sub_100011260();
  uint64_t v4 = sub_100011240();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100007AF0(&qword_10001C448);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1000116E0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100011230();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_10000F50C(uint64_t a1, uint64_t a2)
{
  return sub_10000F540(a1, a2, (void (*)(uint64_t))sub_10000F6AC);
}

uint64_t sub_10000F540(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = sub_100011150();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  a3(v6);
  sub_100011140();
  uint64_t v9 = sub_100011130();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  sub_100007AF0(&qword_10001C438);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1000116E0;
  *(void *)(v10 + 32) = v9;
  uint64_t v11 = sub_100011120();
  swift_bridgeObjectRelease();
  return v11;
}

ValueMetadata *type metadata accessor for HomeScreenAndAppLibrarySettingsAssistantIntents()
{
  return &type metadata for HomeScreenAndAppLibrarySettingsAssistantIntents;
}

ValueMetadata *type metadata accessor for MultitaskingAndGesturesSettingsAssistantIntents()
{
  return &type metadata for MultitaskingAndGesturesSettingsAssistantIntents;
}

ValueMetadata *type metadata accessor for DisplayAndBrightnessSettingsAssistantIntents()
{
  return &type metadata for DisplayAndBrightnessSettingsAssistantIntents;
}

unint64_t sub_10000F6AC()
{
  unint64_t result = qword_10001C430;
  if (!qword_10001C430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C430);
  }
  return result;
}

uint64_t sub_10000F700@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000110F0();
  *a1 = v3;
  return result;
}

unint64_t sub_10000F740()
{
  unint64_t result = qword_10001C470;
  if (!qword_10001C470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C470);
  }
  return result;
}

unint64_t sub_10000F798()
{
  unint64_t result = qword_10001C490;
  if (!qword_10001C490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C490);
  }
  return result;
}

uint64_t sub_10000F7F0()
{
  return sub_100011100();
}

unint64_t sub_10000F834()
{
  unint64_t result = qword_10001C4B0;
  if (!qword_10001C4B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4B0);
  }
  return result;
}

uint64_t sub_10000F888()
{
  sub_1000110F0();
  return v1;
}

uint64_t sub_10000F8BC(uint64_t a1)
{
  return sub_10000FF58(a1, qword_10001C5B0);
}

uint64_t (*sub_10000F8E0(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000110E0();
  return sub_10000F93C;
}

uint64_t sub_10000F944(uint64_t a1, uint64_t a2)
{
  return sub_1000100A8(a1, a2, (uint64_t (*)(void))sub_100010F68, (uint64_t (*)(void))sub_10000DD88);
}

unint64_t sub_10000F980()
{
  unint64_t result = qword_10001C4B8;
  if (!qword_10001C4B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4B8);
  }
  return result;
}

unint64_t sub_10000F9D8()
{
  unint64_t result = qword_10001C4C0;
  if (!qword_10001C4C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4C0);
  }
  return result;
}

unint64_t sub_10000FA30()
{
  unint64_t result = qword_10001C4C8;
  if (!qword_10001C4C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4C8);
  }
  return result;
}

uint64_t sub_10000FA84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000101E4(a1, a2, a3, (void (*)(void))sub_10000F798);
}

uint64_t sub_10000FA9C@<X0>(uint64_t a1@<X8>)
{
  return sub_10001025C(&qword_10001C048, (uint64_t)qword_10001C5B0, a1);
}

uint64_t sub_10000FAC0()
{
  return 0;
}

uint64_t sub_10000FACC()
{
  return 1;
}

uint64_t sub_10000FADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100010F68();
  unint64_t v6 = sub_100010FBC();
  unint64_t v7 = sub_10000DD88();
  *uint64_t v4 = v2;
  v4[1] = sub_100011018;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000FBA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010560();
  *a1 = result;
  return result;
}

uint64_t sub_10000FBD0(uint64_t a1)
{
  unint64_t v2 = sub_10000F798();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000FC10()
{
  unint64_t result = qword_10001C4D8;
  if (!qword_10001C4D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4D8);
  }
  return result;
}

uint64_t sub_10000FC68(uint64_t a1)
{
  return sub_10000FF58(a1, qword_10001C5C8);
}

uint64_t sub_10000FC90(uint64_t a1, uint64_t a2)
{
  return sub_1000100A8(a1, a2, (uint64_t (*)(void))sub_100010EC0, (uint64_t (*)(void))sub_100007BD0);
}

unint64_t sub_10000FCC0()
{
  unint64_t result = qword_10001C4E0;
  if (!qword_10001C4E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4E0);
  }
  return result;
}

unint64_t sub_10000FD18()
{
  unint64_t result = qword_10001C4E8;
  if (!qword_10001C4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4E8);
  }
  return result;
}

uint64_t sub_10000FD6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000101E4(a1, a2, a3, (void (*)(void))sub_10000F740);
}

uint64_t sub_10000FD84@<X0>(uint64_t a1@<X8>)
{
  return sub_10001025C(&qword_10001C050, (uint64_t)qword_10001C5C8, a1);
}

uint64_t sub_10000FDA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100010EC0();
  unint64_t v6 = sub_100010F14();
  unint64_t v7 = sub_100007BD0();
  *uint64_t v4 = v2;
  v4[1] = sub_100011018;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_10000FE74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010848();
  *a1 = result;
  return result;
}

uint64_t sub_10000FE9C(uint64_t a1)
{
  unint64_t v2 = sub_10000F740();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_10000FEDC()
{
  unint64_t result = qword_10001C4F8;
  if (!qword_10001C4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C4F8);
  }
  return result;
}

uint64_t sub_10000FF34(uint64_t a1)
{
  return sub_10000FF58(a1, qword_10001C5E0);
}

uint64_t sub_10000FF58(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000113A0();
  sub_100007B6C(v3, a2);
  sub_100007B34(v3, (uint64_t)a2);
  return sub_100011380();
}

uint64_t sub_10000FFB8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000110F0();
  *a1 = v3;
  return result;
}

uint64_t sub_10000FFF4()
{
  return sub_100011100();
}

void sub_10001002C(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t sub_10001007C(uint64_t a1, uint64_t a2)
{
  return sub_1000100A8(a1, a2, (uint64_t (*)(void))sub_100010E18, (uint64_t (*)(void))sub_10000A4B4);
}

uint64_t sub_1000100A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v7 = a3();
  uint64_t v8 = a4();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v7, a2, v8);
}

unint64_t sub_100010120()
{
  unint64_t result = qword_10001C500;
  if (!qword_10001C500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C500);
  }
  return result;
}

unint64_t sub_100010178()
{
  unint64_t result = qword_10001C508;
  if (!qword_10001C508)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C508);
  }
  return result;
}

uint64_t sub_1000101CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000101E4(a1, a2, a3, (void (*)(void))sub_10000F6AC);
}

uint64_t sub_1000101E4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100010238@<X0>(uint64_t a1@<X8>)
{
  return sub_10001025C(&qword_10001C058, (uint64_t)qword_10001C5E0, a1);
}

uint64_t sub_10001025C@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1000113A0();
  uint64_t v6 = sub_100007B34(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_1000102F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100010E18();
  unint64_t v6 = sub_100010E6C();
  unint64_t v7 = sub_10000A4B4();
  *uint64_t v4 = v2;
  v4[1] = sub_1000103C4;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000103C4()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_1000104CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100010B30();
  *a1 = result;
  return result;
}

uint64_t sub_1000104F4(uint64_t a1)
{
  unint64_t v2 = sub_10000F6AC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenHomeScreenAndAppLibraryDeepLink()
{
  return &type metadata for OpenHomeScreenAndAppLibraryDeepLink;
}

ValueMetadata *type metadata accessor for OpenMultitaskingAndGesturesDeepLink()
{
  return &type metadata for OpenMultitaskingAndGesturesDeepLink;
}

ValueMetadata *type metadata accessor for OpenDisplayAndBrightnessDeepLink()
{
  return &type metadata for OpenDisplayAndBrightnessDeepLink;
}

uint64_t sub_100010560()
{
  uint64_t v17 = sub_100011330();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007AF0(&qword_10001C518);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100007AF0(&qword_10001C150);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000113A0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100007AF0(&qword_10001C550);
  sub_100011380();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 15;
  uint64_t v14 = sub_1000110D0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_10000A770();
  return sub_100011110();
}

uint64_t sub_100010848()
{
  uint64_t v17 = sub_100011330();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007AF0(&qword_10001C518);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100007AF0(&qword_10001C150);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000113A0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100007AF0(&qword_10001C538);
  sub_100011380();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 13;
  uint64_t v14 = sub_1000110D0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100004304();
  return sub_100011110();
}

uint64_t sub_100010B30()
{
  uint64_t v17 = sub_100011330();
  uint64_t v0 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  unint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100007AF0(&qword_10001C518);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  unint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v17 - v7;
  uint64_t v9 = sub_100007AF0(&qword_10001C150);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000113A0();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_100007AF0(&qword_10001C520);
  sub_100011380();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  char v18 = 6;
  uint64_t v14 = sub_1000110D0();
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v17);
  sub_100007CF0();
  return sub_100011110();
}

unint64_t sub_100010E18()
{
  unint64_t result = qword_10001C528;
  if (!qword_10001C528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C528);
  }
  return result;
}

unint64_t sub_100010E6C()
{
  unint64_t result = qword_10001C530;
  if (!qword_10001C530)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C530);
  }
  return result;
}

unint64_t sub_100010EC0()
{
  unint64_t result = qword_10001C540;
  if (!qword_10001C540)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C540);
  }
  return result;
}

unint64_t sub_100010F14()
{
  unint64_t result = qword_10001C548;
  if (!qword_10001C548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C548);
  }
  return result;
}

unint64_t sub_100010F68()
{
  unint64_t result = qword_10001C558;
  if (!qword_10001C558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C558);
  }
  return result;
}

unint64_t sub_100010FBC()
{
  unint64_t result = qword_10001C560;
  if (!qword_10001C560)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001C560);
  }
  return result;
}

uint64_t sub_100011020()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100011030()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100011040()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100011050()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100011070()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100011080()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100011090()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000110D0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000110E0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000110F0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100011100()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100011110()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100011120()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100011130()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100011140()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_100011150()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_100011160()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100011170()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100011180()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100011190()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000111A0()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000111B0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_1000111C0()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_1000111D0()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_1000111E0()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_1000111F0()
{
  return _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)();
}

void sub_100011200(Swift::String a1)
{
}

uint64_t sub_100011210()
{
  return _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100011220()
{
  return _AssistantIntent.Phrase.init(stringInterpolation:)();
}

uint64_t sub_100011230()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100011240()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100011250()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100011260()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100011270()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100011280()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100011290()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_1000112A0()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_1000112B0()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_1000112C0()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_1000112F0()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100011300(Swift::String a1)
{
}

uint64_t sub_100011310()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100011320()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100011330()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100011340()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100011350()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100011360()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100011380()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100011390()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_1000113A0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000113B0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1000113C0()
{
  return static Locale.current.getter();
}

uint64_t sub_1000113D0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000113E0()
{
  return static AppExtension.main()();
}

uint64_t sub_1000113F0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_100011400()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_100011410()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100011420()
{
  return String.hash(into:)();
}

NSArray sub_100011430()
{
  return Array._bridgeToObjectiveC()();
}

Swift::Int sub_100011440(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100011450()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100011460()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100011470()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}