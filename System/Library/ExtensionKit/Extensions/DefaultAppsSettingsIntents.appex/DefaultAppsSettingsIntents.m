void sub_1000017D4(void *a1@<X8>)
{
  *a1 = 0xD00000000000001ALL;
  a1[1] = 0x8000000100006A60;
}

uint64_t sub_1000017F4()
{
  sub_100005FC0();
  sub_100005FB0();
  sub_100005FA0();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  return swift_release();
}

uint64_t sub_100001888()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_100001A74();
  sub_100005F80();
  return swift_release();
}

int main(int argc, const char **argv, const char **envp)
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_1000019F4();
  sub_100005F70();
  swift_release();
  return 0;
}

unint64_t sub_1000019F4()
{
  unint64_t result = qword_10000C018;
  if (!qword_10000C018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C018);
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultAppsSettingsExtensionBundle()
{
  return &type metadata for DefaultAppsSettingsExtensionBundle;
}

uint64_t sub_100001A58()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100001A74()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for DefaultAppsSettingsExtension(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for DefaultAppsSettingsExtension()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for DefaultAppsSettingsExtension(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for DefaultAppsSettingsExtension(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for DefaultAppsSettingsExtension(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DefaultAppsSettingsExtension(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DefaultAppsSettingsExtension(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultAppsSettingsExtension()
{
  return &type metadata for DefaultAppsSettingsExtension;
}

uint64_t sub_100001C18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100001C64()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_100001C80()
{
  return &protocol witness table for EmptyWidgetConfiguration;
}

unint64_t sub_100001C94()
{
  unint64_t result = qword_10000C040;
  if (!qword_10000C040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C040);
  }
  return result;
}

unint64_t sub_100001CEC()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

uint64_t sub_100001D40()
{
  uint64_t v0 = sub_100005F60();
  sub_100005148(v0, qword_10000D0E0);
  sub_100005110(v0, (uint64_t)qword_10000D0E0);
  return sub_100005F50();
}

uint64_t sub_100001DA4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100005E10();
  *a1 = v3;
  return result;
}

uint64_t sub_100001DE0()
{
  return sub_100005E20();
}

void (*sub_100001E18(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100005E00();
  return sub_100001E74;
}

void sub_100001E74(void *a1)
{
  v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100001EC4()
{
  unint64_t result = qword_10000C050;
  if (!qword_10000C050)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C050);
  }
  return result;
}

uint64_t sub_100001F18(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100005CE4();
  unint64_t v5 = sub_1000051AC();

  return static URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100001F84()
{
  unint64_t result = qword_10000C058;
  if (!qword_10000C058)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C058);
  }
  return result;
}

unint64_t sub_100001FDC()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100002034()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

uint64_t sub_100002088()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000020D8@<X0>(uint64_t a1@<X8>)
{
  return sub_100004C60(&qword_10000C000, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000D0E0, a1);
}

uint64_t sub_100002110()
{
  return 0;
}

uint64_t sub_10000211C()
{
  return 1;
}

uint64_t sub_10000212C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  unint64_t v5 = sub_100005CE4();
  unint64_t v6 = sub_100005D38();
  unint64_t v7 = sub_1000051AC();
  *unint64_t v4 = v2;
  v4[1] = sub_1000021F8;
  return URLRepresentableIntent<>.perform()(a2, v5, v6, v7);
}

uint64_t sub_1000021F8()
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

uint64_t sub_100002300@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000542C();
  *a1 = result;
  return result;
}

uint64_t sub_100002328(uint64_t a1)
{
  unint64_t v2 = sub_100001EC4();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100002364()
{
  uint64_t v0 = sub_100005068(&qword_10000C160);
  __chkstk_darwin(v0 - 8);
  unint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100005F60();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_100005F30();
  sub_100005148(v5, qword_10000D0F8);
  sub_100005110(v5, (uint64_t)qword_10000D0F8);
  sub_100005F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_100005F20();
}

unint64_t sub_1000024D4(char a1)
{
  unint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6174736E49707041;
      break;
    case 2:
      unint64_t result = 0x6C69616D45;
      break;
    case 3:
      unint64_t result = 0x6E6967617373654DLL;
      break;
    case 4:
      unint64_t result = 0x676E696C6C6143;
      break;
    case 5:
      unint64_t result = 0x746C69466C6C6143;
      break;
    case 6:
      unint64_t result = 0x41726573776F7242;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0x6C746361746E6F43;
      break;
    case 9:
      unint64_t result = 0x6472616F6279654BLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10000263C(char a1)
{
  unint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6174736E49707041;
      break;
    case 2:
      unint64_t result = 0x6C69616D45;
      break;
    case 3:
      unint64_t result = 0x6E6967617373654DLL;
      break;
    case 4:
      unint64_t result = 0x676E696C6C6143;
      break;
    case 5:
      unint64_t result = 0x746C69466C6C6143;
      break;
    case 6:
      unint64_t result = 0x41726573776F7242;
      break;
    case 7:
      unint64_t result = 0xD000000000000011;
      break;
    case 8:
      unint64_t result = 0x6C746361746E6F43;
      break;
    case 9:
      unint64_t result = 0x6472616F6279654BLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000027A4(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_10000263C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000263C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100005FE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_100002834()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

Swift::Int sub_100002888()
{
  char v1 = *v0;
  sub_100005FF0();
  sub_10000263C(v1);
  sub_100005F90();
  swift_bridgeObjectRelease();
  return sub_100006000();
}

uint64_t sub_1000028EC()
{
  sub_10000263C(*v0);
  sub_100005F90();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100002940()
{
  char v1 = *v0;
  sub_100005FF0();
  sub_10000263C(v1);
  sub_100005F90();
  swift_bridgeObjectRelease();
  return sub_100006000();
}

uint64_t sub_1000029A0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100005714(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000029D0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_10000263C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000029FC()
{
  return sub_100004D40(&qword_10000C080, &qword_10000C088);
}

uint64_t sub_100002A38(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100002A80(void *a1@<X8>)
{
  *a1 = &off_1000088A8;
}

unint64_t sub_100002A90()
{
  return sub_1000024D4(*v0);
}

uint64_t sub_100002A98@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_100005714(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_100002AE4()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

unint64_t sub_100002B3C()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

unint64_t sub_100002B94()
{
  unint64_t result = qword_10000C0A0[0];
  if (!qword_10000C0A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10000C0A0);
  }
  return result;
}

uint64_t sub_100002BE8(char a1)
{
  uint64_t v2 = sub_100005068(&qword_10000C158);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005068(&qword_10000C160);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005F60();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  switch(a1)
  {
    case 1:
    case 3:
      sub_100005F50();
      sub_100005F50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100005E40();
      uint64_t v14 = sub_100005E50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v4, 0, 1, v14);
      sub_100005068(&qword_10000C168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000062F0;
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      break;
    case 2:
    case 8:
      sub_100005F50();
      sub_100005F50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100005E40();
      uint64_t v17 = sub_100005E50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v4, 0, 1, v17);
      sub_100005068(&qword_10000C168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000062D0;
      sub_100005F50();
      sub_100005F50();
      break;
    case 4:
      sub_100005F50();
      sub_100005F50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100005E40();
      uint64_t v15 = sub_100005E50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 0, 1, v15);
      sub_100005068(&qword_10000C168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000062F0;
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      break;
    case 5:
    case 7:
      sub_100005F50();
      sub_100005F50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100005E40();
      uint64_t v16 = sub_100005E50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v4, 0, 1, v16);
      sub_100005068(&qword_10000C168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000062E0;
      sub_100005F50();
      break;
    case 6:
    case 9:
      sub_100005F50();
      sub_100005F50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      sub_100005E40();
      uint64_t v18 = sub_100005E50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v4, 0, 1, v18);
      break;
    default:
      sub_100005F50();
      sub_100005F50();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      if (qword_10000C010 != -1) {
        swift_once();
      }
      uint64_t v11 = sub_100005E50();
      uint64_t v12 = sub_100005110(v11, (uint64_t)qword_10000C028);
      uint64_t v13 = *(void *)(v11 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v4, v12, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v4, 0, 1, v11);
      sub_100005068(&qword_10000C168);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100006300;
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      sub_100005F50();
      break;
  }
  sub_100005F50();
  return sub_100005E60();
}

uint64_t sub_100003E08(uint64_t a1)
{
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10000C1B0 + dword_10000C1B0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100003EB0;
  return v5(a1);
}

uint64_t sub_100003EB0(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100003FB0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C1A8 + dword_10000C1A8);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100005D8C;
  return v4();
}

unint64_t sub_100004058()
{
  unint64_t result = qword_10000C0B8;
  if (!qword_10000C0B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0B8);
  }
  return result;
}

uint64_t sub_1000040AC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C198 + dword_10000C198);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100004150;
  return v4();
}

uint64_t sub_100004150(uint64_t a1)
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

unint64_t sub_100004268()
{
  unint64_t result = qword_10000C0C8;
  if (!qword_10000C0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0C8);
  }
  return result;
}

unint64_t sub_1000042C0()
{
  unint64_t result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_100004318()
{
  unint64_t result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    sub_100002A38(qword_10000C0E0);
    sub_1000042C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

uint64_t sub_10000438C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100004058();
  *uint64_t v5 = v2;
  v5[1] = sub_100004440;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100004440()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100004534(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_10000C188 + dword_10000C188);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_1000045D8;
  return v4();
}

uint64_t sub_1000045D8(char a1)
{
  uint64_t v3 = *(unsigned char **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  *uint64_t v3 = a1;
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

unint64_t sub_1000046F4()
{
  unint64_t result = qword_10000C0F8;
  if (!qword_10000C0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C0F8);
  }
  return result;
}

uint64_t sub_100004748()
{
  uint64_t v0 = sub_100005068(&qword_10000C178);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005068(&qword_10000C180);
  __chkstk_darwin(v4);
  sub_100002B94();
  sub_100005EE0();
  v7._object = (void *)0x80000001000072B0;
  v7._countAndFlagsBits = 0xD000000000000052;
  sub_100005ED0(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_100005EC0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_100005ED0(v8);
  return sub_100005EF0();
}

unint64_t sub_100004904()
{
  return 0xD000000000000015;
}

unint64_t sub_100004924()
{
  unint64_t result = qword_10000C100;
  if (!qword_10000C100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C100);
  }
  return result;
}

unint64_t sub_10000497C()
{
  unint64_t result = qword_10000C108;
  if (!qword_10000C108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C108);
  }
  return result;
}

unint64_t sub_1000049D4()
{
  unint64_t result = qword_10000C110;
  if (!qword_10000C110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C110);
  }
  return result;
}

uint64_t sub_100004A28()
{
  sub_1000051AC();
  uint64_t v2 = sub_100005E90();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_100005200(v3, v0, v2, v1);
}

unint64_t sub_100004AC0()
{
  unint64_t result = qword_10000C120;
  if (!qword_10000C120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C120);
  }
  return result;
}

unint64_t sub_100004B18()
{
  unint64_t result = qword_10000C128;
  if (!qword_10000C128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C128);
  }
  return result;
}

unint64_t sub_100004B70()
{
  unint64_t result = qword_10000C130;
  if (!qword_10000C130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C130);
  }
  return result;
}

unint64_t sub_100004BC8()
{
  unint64_t result = qword_10000C138;
  if (!qword_10000C138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C138);
  }
  return result;
}

void sub_100004C1C(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004C28@<X0>(uint64_t a1@<X8>)
{
  return sub_100004C60(&qword_10000C008, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10000D0F8, a1);
}

uint64_t sub_100004C60@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100005110(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100004D04()
{
  return sub_100004D40(&qword_10000C140, &qword_10000C148);
}

uint64_t sub_100004D40(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100002A38(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004D84(uint64_t a1)
{
  unint64_t v2 = sub_100002B94();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100004DD4()
{
  unint64_t result = qword_10000C150;
  if (!qword_10000C150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

uint64_t sub_100004E28()
{
  return sub_100002BE8(*v0);
}

uint64_t sub_100004E30(uint64_t a1)
{
  unint64_t v2 = sub_100004B70();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for DefaultAppsSettingsDeepLink.DefaultAppsAvailableLinksQuery()
{
  return &type metadata for DefaultAppsSettingsDeepLink.DefaultAppsAvailableLinksQuery;
}

unsigned char *initializeBufferWithCopyOfBuffer for DefaultAppsSettingsDeepLink.Destination(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t sub_100004EA4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100004EAC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DefaultAppsSettingsDeepLink.Destination()
{
  return &type metadata for DefaultAppsSettingsDeepLink.Destination;
}

uint64_t _s26DefaultAppsSettingsIntents27DefaultAppsSettingsDeepLinkV11DestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s26DefaultAppsSettingsIntents27DefaultAppsSettingsDeepLinkV11DestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0x100005020);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DefaultAppsSettingsDeepLink()
{
  return &type metadata for DefaultAppsSettingsDeepLink;
}

ValueMetadata *type metadata accessor for OpenDefaultAppsSettingsDeepLink()
{
  return &type metadata for OpenDefaultAppsSettingsDeepLink;
}

uint64_t sub_100005068(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000050AC()
{
  uint64_t v0 = sub_100005E50();
  sub_100005148(v0, qword_10000C028);
  sub_100005110(v0, (uint64_t)qword_10000C028);
  return sub_100005E40();
}

uint64_t sub_100005110(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100005148(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_1000051AC()
{
  unint64_t result = qword_10000C170;
  if (!qword_10000C170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C170);
  }
  return result;
}

uint64_t sub_100005200(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

char *sub_100005214(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100005254(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100005234(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_100005340(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_100005254(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005068(&qword_10000C1A0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
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

char *sub_100005340(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005068(&qword_10000C190);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
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

uint64_t sub_10000542C()
{
  uint64_t v16 = sub_100005F00();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005068(&qword_10000C1B8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100005068(&qword_10000C160);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005F60();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100005068(&qword_10000C1C0);
  sub_100005F50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 10;
  uint64_t v13 = sub_100005DF0();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_100002B94();
  return sub_100005E30();
}

uint64_t sub_100005714(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_100008798;
  v6._object = a2;
  unint64_t v4 = sub_100005FD0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xA) {
    return 10;
  }
  else {
    return v4;
  }
}

uint64_t sub_100005760()
{
  return _swift_task_switch(sub_10000577C, 0, 0);
}

uint64_t sub_10000577C()
{
  uint64_t v1 = 10;
  sub_100005214(0, 10, 0);
  int v2 = &_swiftEmptyArrayStorage;
  unint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  unint64_t v4 = &byte_1000088C8;
  do
  {
    char v6 = *v4++;
    char v5 = v6;
    uint64_t v10 = v2;
    unint64_t v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_100005214((char *)(v7 > 1), v3 + 1, 1);
      int v2 = v10;
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100005880(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_1000058A0, 0, 0);
}

uint64_t sub_1000058A0()
{
  uint64_t v1 = swift_bridgeObjectRetain();
  uint64_t v2 = sub_1000059EC(v1);
  swift_bridgeObjectRelease();
  int64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    sub_100005214(0, v3, 0);
    uint64_t v4 = 0;
    uint64_t v5 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v6 = *(unsigned char *)(v2 + v4 + 32);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v5 + v4 >= v7 >> 1) {
        sub_100005214((char *)(v7 > 1), v5 + v4 + 1, 1);
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

uint64_t sub_1000059EC(uint64_t result)
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
  unint64_t v5 = v1;
  while (1)
  {
    if (v2 == v5) {
      return (uint64_t)&_swiftEmptyArrayStorage;
    }
    if (v4 == v5) {
      break;
    }
    unint64_t v1 = v5 + 1;
    if (!*(unsigned __int8 *)(v3 + v5++))
    {
      unint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        unint64_t result = (uint64_t)sub_100005234(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
      }
      unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v7 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v8 >= v7 >> 1) {
        unint64_t result = (uint64_t)sub_100005234((char *)(v7 > 1), v8 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v8 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v8 + 32) = 0;
      goto LABEL_2;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100005ADC()
{
  return _swift_task_switch(sub_100005AF8, 0, 0);
}

uint64_t sub_100005AF8()
{
  uint64_t v1 = sub_1000059EC((uint64_t)&off_1000088A8);
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    sub_100005214(0, v2, 0);
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)&_swiftEmptyArrayStorage + 2);
    do
    {
      char v5 = *(unsigned char *)(v1 + v3 + 32);
      unint64_t v6 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v4 + v3 >= v6 >> 1) {
        sub_100005214((char *)(v6 > 1), v4 + v3 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v4 + v3 + 1;
      *((unsigned char *)&_swiftEmptyArrayStorage + v4 + v3++ + 32) = v5;
    }
    while (v2 != v3);
  }
  swift_bridgeObjectRelease();
  unint64_t v7 = *(uint64_t (**)(void *))(v0 + 8);
  return v7(&_swiftEmptyArrayStorage);
}

uint64_t sub_100005C38()
{
  return _swift_task_switch(sub_100005C54, 0, 0);
}

uint64_t sub_100005C54()
{
  uint64_t v1 = sub_1000059EC((uint64_t)&off_1000088A8);
  if (*(void *)(v1 + 16)) {
    uint64_t v2 = *(unsigned __int8 *)(v1 + 32);
  }
  else {
    uint64_t v2 = 10;
  }
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

unint64_t sub_100005CE4()
{
  unint64_t result = qword_10000C1C8;
  if (!qword_10000C1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1C8);
  }
  return result;
}

unint64_t sub_100005D38()
{
  unint64_t result = qword_10000C1D0;
  if (!qword_10000C1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C1D0);
  }
  return result;
}

uint64_t sub_100005DA0()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100005DB0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100005DC0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100005DF0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100005E00()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_100005E10()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100005E20()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100005E30()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100005E40()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100005E50()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100005E60()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100005E70()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100005E80()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100005E90()
{
  return URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100005EC0()
{
  return EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_100005ED0(Swift::String a1)
{
}

uint64_t sub_100005EE0()
{
  return EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100005EF0()
{
  return EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_100005F00()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100005F10()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100005F20()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_100005F30()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100005F50()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100005F60()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100005F70()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100005F80()
{
  return static WidgetBundleBuilder.buildBlock<A>(_:)();
}

uint64_t sub_100005F90()
{
  return String.hash(into:)();
}

uint64_t sub_100005FA0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100005FB0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100005FC0()
{
  return type metadata accessor for MainActor();
}

Swift::Int sub_100005FD0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100005FE0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100005FF0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006000()
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

uint64_t swift_task_isCurrentExecutor()
{
  return _swift_task_isCurrentExecutor();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return _swift_task_reportUnexpectedExecutor();
}