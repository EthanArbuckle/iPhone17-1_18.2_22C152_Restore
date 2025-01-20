uint64_t sub_100001F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void (*v4)(char *, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v0 = sub_100002910(&qword_10000C0F0);
  v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000028BC();
  sub_100005F80();
  v17 = sub_100005F10();
  v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_100005F80();
  v16 = sub_100005F10();
  v4(v3, v0);
  sub_100005F80();
  v15 = sub_100005F10();
  v4(v3, v0);
  sub_100005F80();
  v14 = sub_100005F10();
  v4(v3, v0);
  sub_100005F80();
  v5 = sub_100005F10();
  v4(v3, v0);
  sub_100005F80();
  v6 = sub_100005F10();
  v4(v3, v0);
  sub_100005F80();
  v7 = sub_100005F10();
  v4(v3, v0);
  sub_100005F80();
  v8 = sub_100005F10();
  v4(v3, v0);
  sub_100002910(&qword_10000C0F8);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100006320;
  v10 = v16;
  *(void *)(v9 + 32) = v17;
  *(void *)(v9 + 40) = v10;
  v11 = v14;
  *(void *)(v9 + 48) = v15;
  *(void *)(v9 + 56) = v11;
  *(void *)(v9 + 64) = v5;
  *(void *)(v9 + 72) = v6;
  *(void *)(v9 + 80) = v7;
  *(void *)(v9 + 88) = v8;
  v12 = sub_100005F00();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1000022B0()
{
  uint64_t v0 = sub_100005F70();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_100002954();
  sub_100005EF0();
  swift_release();
  sub_1000028BC();
  sub_100005F60();
  uint64_t v4 = sub_100005F50();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100002910(&qword_10000C0E8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006330;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100005F40();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100002418@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100005E80();
  *a1 = v3;
  return result;
}

uint64_t sub_100002454()
{
  return sub_100005E90();
}

uint64_t sub_10000248C()
{
  uint64_t v0 = sub_100005F30();
  sub_100002910(&qword_10000C0D0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100006330;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_100005F20();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_10000250C()
{
  uint64_t v0 = sub_100005F30();
  uint64_t v1 = sub_100005F30();
  uint64_t v2 = sub_100005F30();
  uint64_t v3 = sub_100005F30();
  sub_100002910(&qword_10000C0D0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100006340;
  *(void *)(v4 + 32) = v0;
  *(void *)(v4 + 40) = v1;
  *(void *)(v4 + 48) = v2;
  *(void *)(v4 + 56) = v3;
  uint64_t v5 = sub_100005F20();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100002614()
{
  uint64_t v0 = sub_100005FB0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_1000052A4();
  sub_1000028BC();
  sub_100005FC0();
  uint64_t v4 = sub_100005FA0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100002910(&qword_10000C0D8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006330;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100005F90();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100002774()
{
  uint64_t v0 = sub_100005EE0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000028BC();
  sub_100005ED0();
  uint64_t v4 = sub_100005EC0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100002910(&qword_10000C0C8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100006330;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100005EB0();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for SafetyCheckIntents()
{
  return &type metadata for SafetyCheckIntents;
}

unint64_t sub_1000028BC()
{
  unint64_t result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t sub_100002910(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100002954()
{
  unint64_t result = qword_10000C0E0;
  if (!qword_10000C0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0E0);
  }
  return result;
}

uint64_t sub_1000029A8(uint64_t a1)
{
  unint64_t v2 = sub_100002AFC();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100002A54()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

uint64_t sub_100002AAC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100002AFC()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafetyCheckAppIntentsExtension()
{
  return &type metadata for SafetyCheckAppIntentsExtension;
}

uint64_t sub_100002B60()
{
  sub_100005E80();
  return v1;
}

uint64_t sub_100002B94(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100002BF8(*a1, *a2);
}

unint64_t sub_100002BA4()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

uint64_t sub_100002BF8(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x535F4547414E414DLL;
    }
    else {
      uint64_t v3 = 0x434E454752454D45;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xEE00474E49524148;
    }
    else {
      unint64_t v4 = 0xEF54455345525F59;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x535F4547414E414DLL;
      }
      else {
        uint64_t v6 = 0x434E454752454D45;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xEE00474E49524148;
      }
      else {
        unint64_t v7 = 0xEF54455345525F59;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE500000000000000;
    uint64_t v3 = 0x746F6F7223;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE500000000000000;
  if (v3 != 0x746F6F7223)
  {
LABEL_21:
    char v8 = sub_100006140();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_100002D3C()
{
  return sub_100006160();
}

uint64_t sub_100002DF4()
{
  sub_100006120();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100002E98()
{
  return sub_100006160();
}

uint64_t sub_100002F4C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10000573C(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_100002F7C(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE500000000000000;
  unint64_t v4 = 0xEE00474E49524148;
  uint64_t v5 = 0x535F4547414E414DLL;
  if (v2 != 1)
  {
    uint64_t v5 = 0x434E454752454D45;
    unint64_t v4 = 0xEF54455345525F59;
  }
  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x746F6F7223;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_100002FF0()
{
  return sub_100004650(&qword_10000C138, &qword_10000C140);
}

uint64_t sub_10000302C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100003074(void *a1@<X8>)
{
  *a1 = &off_100008958;
}

uint64_t sub_100003084()
{
  uint64_t v1 = 0x535F4547414E414DLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x434E454752454D45;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x746F6F7223;
  }
}

uint64_t sub_1000030F4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_10000573C(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_100003140()
{
  unint64_t result = qword_10000C148;
  if (!qword_10000C148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C148);
  }
  return result;
}

unint64_t sub_100003198()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

unint64_t sub_1000031F0()
{
  unint64_t result = qword_10000C158[0];
  if (!qword_10000C158[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C158);
  }
  return result;
}

uint64_t sub_100003244()
{
  uint64_t v0 = sub_100002910(&qword_10000C240);
  __chkstk_darwin(v0 - 8);
  int v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100006100();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000060D0();
  sub_1000056C4(v5, qword_10000D360);
  sub_10000568C(v5, (uint64_t)qword_10000D360);
  sub_1000060F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000060C0();
}

uint64_t sub_1000033B4(char a1)
{
  uint64_t v2 = sub_100002910(&qword_10000C268);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002910(&qword_10000C240);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100006100();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  sub_1000060F0();
  sub_1000060F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  sub_100005FD0();
  uint64_t v11 = sub_100005FE0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 0, 1, v11);
  if (!a1)
  {
    sub_100002910(&qword_10000C270);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100006330;
    sub_1000060F0();
  }
  sub_1000060F0();
  return sub_100005FF0();
}

uint64_t sub_10000389C(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C2A8 + dword_10000C2A8);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_100003944;
  return v5(a1);
}

uint64_t sub_100003944(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100003A44(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C298 + dword_10000C298);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100005D88;
  return v4();
}

unint64_t sub_100003AEC()
{
  unint64_t result = qword_10000C170;
  if (!qword_10000C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C170);
  }
  return result;
}

uint64_t sub_100003B40(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C288 + dword_10000C288);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100003BE4;
  return v4();
}

uint64_t sub_100003BE4(uint64_t a1)
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

unint64_t sub_100003CFC()
{
  unint64_t result = qword_10000C180;
  if (!qword_10000C180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C180);
  }
  return result;
}

unint64_t sub_100003D58()
{
  unint64_t result = qword_10000C188;
  if (!qword_10000C188)
  {
    sub_10000302C(qword_10000C190);
    sub_100002954();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C188);
  }
  return result;
}

uint64_t sub_100003DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100003AEC();
  *uint64_t v5 = v2;
  v5[1] = sub_100003E80;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100003E80()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100003F74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100003E80;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100004034()
{
  unint64_t result = qword_10000C1A8;
  if (!qword_10000C1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1A8);
  }
  return result;
}

uint64_t sub_100004088()
{
  uint64_t v0 = sub_100002910(&qword_10000C278);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100002910(&qword_10000C280);
  __chkstk_darwin(v4);
  sub_1000031F0();
  sub_1000060A0();
  v7._object = (void *)0x80000001000072B0;
  v7._countAndFlagsBits = 0xD000000000000049;
  sub_100006090(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100006080();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100006090(v8);
  return sub_1000060B0();
}

uint64_t sub_100004244()
{
  uint64_t v0 = qword_10000C110;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100004280()
{
  unint64_t result = qword_10000C1B0;
  if (!qword_10000C1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1B0);
  }
  return result;
}

unint64_t sub_1000042D8()
{
  unint64_t result = qword_10000C1B8;
  if (!qword_10000C1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1B8);
  }
  return result;
}

unint64_t sub_100004330()
{
  unint64_t result = qword_10000C1C0;
  if (!qword_10000C1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1C0);
  }
  return result;
}

unint64_t sub_100004388()
{
  unint64_t result = qword_10000C1C8;
  if (!qword_10000C1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1C8);
  }
  return result;
}

uint64_t sub_1000043DC()
{
  sub_100005638();
  uint64_t v2 = sub_100006040();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100005728(v3, v0, v2, v1);
}

unint64_t sub_100004474()
{
  unint64_t result = qword_10000C1D8;
  if (!qword_10000C1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1D8);
  }
  return result;
}

unint64_t sub_1000044CC()
{
  unint64_t result = qword_10000C1E0;
  if (!qword_10000C1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1E0);
  }
  return result;
}

unint64_t sub_100004524()
{
  unint64_t result = qword_10000C1E8;
  if (!qword_10000C1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1E8);
  }
  return result;
}

unint64_t sub_10000457C()
{
  unint64_t result = qword_10000C1F0;
  if (!qword_10000C1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1F0);
  }
  return result;
}

void sub_1000045D0(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000045DC@<X0>(uint64_t a1@<X8>)
{
  return sub_100004BA0(&qword_10000C0B0, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000D360, a1);
}

uint64_t sub_100004614()
{
  return sub_100004650(&qword_10000C1F8, &qword_10000C200);
}

uint64_t sub_100004650(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000302C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004694(uint64_t a1)
{
  unint64_t v2 = sub_1000031F0();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000046E4()
{
  unint64_t result = qword_10000C208;
  if (!qword_10000C208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C208);
  }
  return result;
}

uint64_t sub_100004738()
{
  return sub_1000033B4(*v0);
}

uint64_t sub_100004740(uint64_t a1)
{
  unint64_t v2 = sub_100004524();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100004790()
{
  unint64_t result = qword_10000C210;
  if (!qword_10000C210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C210);
  }
  return result;
}

uint64_t sub_1000047E4()
{
  uint64_t v0 = sub_100006100();
  sub_1000056C4(v0, qword_10000D378);
  sub_10000568C(v0, (uint64_t)qword_10000D378);
  return sub_1000060F0();
}

uint64_t sub_100004848@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100005E80();
  *a1 = v3;
  return result;
}

uint64_t sub_100004884()
{
  return sub_100005E90();
}

void (*sub_1000048BC(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100005E70();
  return sub_100004918;
}

void sub_100004918(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_10000496C()
{
  unint64_t result = qword_10000C218;
  if (!qword_10000C218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C218);
  }
  return result;
}

uint64_t sub_1000049C0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005590();
  unint64_t v5 = sub_100005638();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100004A2C()
{
  uint64_t v0 = qword_10000C120;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_100004A6C()
{
  unint64_t result = qword_10000C220;
  if (!qword_10000C220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C220);
  }
  return result;
}

unint64_t sub_100004AC4()
{
  unint64_t result = qword_10000C228;
  if (!qword_10000C228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C228);
  }
  return result;
}

uint64_t sub_100004B18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100004B68@<X0>(uint64_t a1@<X8>)
{
  return sub_100004BA0(&qword_10000C0B8, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000D378, a1);
}

uint64_t sub_100004BA0@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_10000568C(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100004C44()
{
  return 0;
}

uint64_t sub_100004C50()
{
  return 1;
}

uint64_t sub_100004C60(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100005590();
  unint64_t v7 = sub_1000055E4();
  unint64_t v8 = sub_100005638();
  *unint64_t v5 = v2;
  v5[1] = sub_100004D34;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100004D34()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100004E3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000052A4();
  *a1 = result;
  return result;
}

uint64_t sub_100004E64(uint64_t a1)
{
  unint64_t v2 = sub_1000028BC();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenSafetyCheckDeepLinks()
{
  return &type metadata for OpenSafetyCheckDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for SafetyCheckDestination(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SafetyCheckDeepLinks()
{
  return &type metadata for SafetyCheckDeepLinks;
}

ValueMetadata *type metadata accessor for SafetyCheckDeepLinks.AvailableSafetyCheckDestinationQuery()
{
  return &type metadata for SafetyCheckDeepLinks.AvailableSafetyCheckDestinationQuery;
}

uint64_t _s21SafetyCheckAppIntents22SafetyCheckDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s21SafetyCheckAppIntents22SafetyCheckDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x100005044);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000506C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100005074(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SafetyCheckDestination()
{
  return &type metadata for SafetyCheckDestination;
}

char *sub_10000508C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000050CC(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_1000050AC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000051B8(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_1000050CC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100002910(&qword_10000C290);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_1000051B8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100002910(&qword_10000C2A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_1000052A4()
{
  uint64_t v16 = sub_100006030();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002910(&qword_10000C238);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100002910(&qword_10000C240);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100006100();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100002910(&qword_10000C248);
  sub_1000060F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 3;
  uint64_t v13 = sub_100005E60();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_1000031F0();
  return sub_100005EA0();
}

unint64_t sub_100005590()
{
  unint64_t result = qword_10000C250;
  if (!qword_10000C250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C250);
  }
  return result;
}

unint64_t sub_1000055E4()
{
  unint64_t result = qword_10000C258;
  if (!qword_10000C258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C258);
  }
  return result;
}

unint64_t sub_100005638()
{
  unint64_t result = qword_10000C260;
  if (!qword_10000C260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C260);
  }
  return result;
}

uint64_t sub_10000568C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000056C4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005728(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_10000573C(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000088F0;
  v6._object = a2;
  unint64_t v4 = sub_100006130(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 3) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t sub_100005788()
{
  return _swift_task_switch(sub_1000057A4, 0, 0);
}

uint64_t sub_1000057A4()
{
  sub_10000508C(0, 3, 0);
  unint64_t v2 = *((void *)&_swiftEmptyArrayStorage + 2);
  unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
  int64_t v3 = v1 >> 1;
  unint64_t v4 = v2 + 1;
  if (v1 >> 1 <= v2)
  {
    sub_10000508C((char *)(v1 > 1), v2 + 1, 1);
    unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
    int64_t v3 = v1 >> 1;
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v4;
  *((unsigned char *)&_swiftEmptyArrayStorage + v2 + 32) = 0;
  unint64_t v5 = v2 + 2;
  if (v3 < (uint64_t)(v2 + 2))
  {
    sub_10000508C((char *)(v1 > 1), v2 + 2, 1);
    unint64_t v1 = *((void *)&_swiftEmptyArrayStorage + 3);
    int64_t v3 = v1 >> 1;
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v5;
  *((unsigned char *)&_swiftEmptyArrayStorage + v4 + 32) = 1;
  if (v3 < (uint64_t)(v2 + 3)) {
    sub_10000508C((char *)(v1 > 1), v2 + 3, 1);
  }
  *((void *)&_swiftEmptyArrayStorage + 2) = v2 + 3;
  *((unsigned char *)&_swiftEmptyArrayStorage + v5 + 32) = 2;
  Swift::String v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_1000058FC()
{
  return _swift_task_switch(sub_100005918, 0, 0);
}

uint64_t sub_100005918()
{
  sub_100005A58((uint64_t)&off_100008980);
  uint64_t v2 = v1;
  int64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    sub_10000508C(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_10000508C((char *)(v7 > 1), v5 + v4 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v5 + v4 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v5 + v4++ + 32) = v6;
    }
    while (v3 != v4);
  }
  swift_bridgeObjectRelease();
  uint64_t v8 = *(uint64_t (**)(void *))(v0 + 8);
  return v8(&_swiftEmptyArrayStorage);
}

void sub_100005A58(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = 0;
    uint64_t v3 = a1 + 32;
    uint64_t v4 = &_swiftEmptyArrayStorage;
    unint64_t v19 = *(void *)(a1 + 16);
    do
    {
      v20 = v4;
      uint64_t v5 = 0;
      if (v2 <= v1) {
        unint64_t v6 = v1;
      }
      else {
        unint64_t v6 = v2;
      }
      unint64_t v7 = v2 - v6;
      for (uint64_t i = v3; ; ++i)
      {
        if (!(v7 + v5))
        {
          __break(1u);
LABEL_22:
          __break(1u);
          return;
        }
        char v9 = *(unsigned char *)(i + v2);
        id v10 = [self currentDevice];
        unsigned int v11 = objc_msgSend(v10, "sf_isiPhone");

        if (v11)
        {
          id v12 = [self sharedInstance];
          if (!v12) {
            goto LABEL_22;
          }
          uint64_t v13 = v12;
          unsigned __int8 v14 = [v12 isPhoneMirroringActive];

          if ((v14 & 1) == 0) {
            break;
          }
        }
        ++v5;
        if (v2 == --v1) {
          return;
        }
      }
      uint64_t v4 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000050AC(0, v20[2] + 1, 1);
        uint64_t v4 = v20;
      }
      unint64_t v16 = v4[2];
      unint64_t v15 = v4[3];
      if (v16 >= v15 >> 1)
      {
        sub_1000050AC((char *)(v15 > 1), v16 + 1, 1);
        uint64_t v4 = v20;
      }
      unint64_t v17 = v2 + 1;
      v2 += 1 + v5;
      v4[2] = v16 + 1;
      *((unsigned char *)v4 + v16 + 32) = v9;
      BOOL v18 = v17 == v1;
      unint64_t v1 = v19;
    }
    while (!v18);
  }
}

uint64_t sub_100005C1C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100005C3C, 0, 0);
}

uint64_t sub_100005C3C()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_100005A58(v1);
  uint64_t v3 = v2;
  swift_bridgeObjectRelease();
  int64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    sub_10000508C(0, v4, 0);
    uint64_t v5 = 0;
    uint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v7 = *(unsigned char *)(v3 + v5 + 32);
      unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v6 + v5 >= v8 >> 1) {
        sub_10000508C((char *)(v8 > 1), v6 + v5 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v6 + v5 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v6 + v5++ + 32) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  char v9 = *(uint64_t (**)(void *))(v0 + 8);
  return v9(&_swiftEmptyArrayStorage);
}

uint64_t sub_100005D8C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100005DC0()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100005DD0()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100005DE0()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100005E00()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100005E10()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100005E20()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100005E60()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100005E70()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100005E80()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100005E90()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100005EA0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100005EB0()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100005EC0()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100005ED0()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_100005EE0()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_100005EF0()
{
  return _AssistantIntent.IntentProjection.subscript.getter();
}

uint64_t sub_100005F00()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100005F10()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100005F20()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100005F30()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100005F40()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
}

uint64_t sub_100005F50()
{
  return static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)();
}

uint64_t sub_100005F60()
{
  return _AssistantIntent.Value.init<A>(for:builder:)();
}

uint64_t sub_100005F70()
{
  return type metadata accessor for _AssistantIntent.Value();
}

uint64_t sub_100005F80()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_100005F90()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_100005FA0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_100005FB0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_100005FC0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_100005FD0()
{
  return DisplayRepresentation.Image.init(named:isTemplate:)();
}

uint64_t sub_100005FE0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100005FF0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100006000()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100006020()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100006030()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100006040()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100006070()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100006080()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100006090(Swift::String a1)
{
}

uint64_t sub_1000060A0()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000060B0()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_1000060C0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000060D0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000060F0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100006100()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100006110()
{
  return static AppExtension.main()();
}

uint64_t sub_100006120()
{
  return String.hash(into:)();
}

Swift::Int sub_100006130(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100006140()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100006150()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006160()
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