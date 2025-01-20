unint64_t NFCWindowSceneEvent.description.getter()
{
  unsigned char *v0;

  if (*v0) {
    return 0xD000000000000016;
  }
  else {
    return 0xD000000000000013;
  }
}

BOOL static NFCWindowSceneEvent.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t NFCWindowSceneEvent.hash(into:)()
{
  return sub_246544400();
}

BOOL sub_246542BBC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_246542BD8()
{
  return sub_246544400();
}

uint64_t sub_246542C08()
{
  if (*v0) {
    return 0x61746E6573657270;
  }
  else {
    return 0x6544726564616572;
  }
}

uint64_t sub_246542C58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_246544038(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246542C80()
{
  return 0;
}

void sub_246542C8C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_246542C98(uint64_t a1)
{
  unint64_t v2 = sub_246543174();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246542CD4(uint64_t a1)
{
  unint64_t v2 = sub_246543174();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246542D10()
{
  return 0;
}

uint64_t sub_246542D1C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_246542D4C(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_246542D58(uint64_t a1)
{
  unint64_t v2 = sub_2465431C8();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246542D94(uint64_t a1)
{
  unint64_t v2 = sub_2465431C8();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_246542DD0(uint64_t a1)
{
  unint64_t v2 = sub_24654321C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_246542E0C(uint64_t a1)
{
  unint64_t v2 = sub_24654321C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t NFCWindowSceneEvent.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8AC10);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8AC18);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8AC20);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246543174();
  sub_246544430();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_2465431C8();
    v14 = v18;
    sub_2465443D0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24654321C();
    sub_2465443D0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_246543174()
{
  unint64_t result = qword_268F8AC28;
  if (!qword_268F8AC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC28);
  }
  return result;
}

unint64_t sub_2465431C8()
{
  unint64_t result = qword_268F8AC30;
  if (!qword_268F8AC30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC30);
  }
  return result;
}

unint64_t sub_24654321C()
{
  unint64_t result = qword_268F8AC38;
  if (!qword_268F8AC38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC38);
  }
  return result;
}

uint64_t NFCWindowSceneEvent.hashValue.getter()
{
  return sub_246544410();
}

uint64_t NFCWindowSceneEvent.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8AC40);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8AC48);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F8AC50);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246543174();
  v11 = v32;
  sub_246544420();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  v14 = v10;
  uint64_t v15 = sub_2465443C0();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_246544390();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F8AC58);
    *char v22 = &type metadata for NFCWindowSceneEvent;
    sub_2465443B0();
    sub_246544380();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_2465431C8();
    v18 = v14;
    sub_2465443A0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24654321C();
    sub_2465443A0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_246543710()
{
  return sub_246544410();
}

uint64_t sub_246543758()
{
  return sub_246544410();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2465437EC@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return NFCWindowSceneEvent.init(from:)(a1, a2);
}

uint64_t sub_246543804(void *a1)
{
  return NFCWindowSceneEvent.encode(to:)(a1);
}

unint64_t sub_24654381C()
{
  if (*v0) {
    return 0xD000000000000016;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t UISceneConnectionOptions.nfcEvent.getter()
{
  unint64_t v0 = sub_2465438AC();

  return MEMORY[0x270F82700](&type metadata for NFCEventSceneConnectionOptionDefinition, &type metadata for NFCEventSceneConnectionOptionDefinition, &type metadata for NFCWindowSceneEvent, v0);
}

unint64_t sub_2465438AC()
{
  unint64_t result = qword_268F8AC60;
  if (!qword_268F8AC60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC60);
  }
  return result;
}

uint64_t (*sub_246543900())@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_24654391C;
}

uint64_t sub_24654391C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_2465441D8(a1, (uint64_t)v5);
  uint64_t v3 = swift_allocObject();
  sub_246544274(v5, v3 + 16);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = sub_24654428C;
  *(void *)(result + 24) = v3;
  *a2 = sub_246544304;
  a2[1] = result;
  return result;
}

uint64_t sub_2465439AC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  swift_retain();
  sub_246544360();

  return swift_release();
}

uint64_t NFCWindowSceneEvent.asBSAction()()
{
  return sub_246544340();
}

unint64_t sub_246543AB4()
{
  unint64_t result = qword_268F8AC68;
  if (!qword_268F8AC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC68);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for NFCWindowSceneEvent()
{
  return &type metadata for NFCWindowSceneEvent;
}

uint64_t dispatch thunk of NFCWindowSceneDelegate.windowScene(_:didReceiveNFCWindowSceneEvent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for NFCEventSceneConnectionOptionDefinition()
{
  return &type metadata for NFCEventSceneConnectionOptionDefinition;
}

uint64_t _s14_CoreNFC_UIKit19NFCWindowSceneEventOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s14_CoreNFC_UIKit19NFCWindowSceneEventOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x246543CB4);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_246543CDC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_246543CE4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NFCWindowSceneEvent.CodingKeys()
{
  return &type metadata for NFCWindowSceneEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for NFCWindowSceneEvent.ReaderDetectedCodingKeys()
{
  return &type metadata for NFCWindowSceneEvent.ReaderDetectedCodingKeys;
}

ValueMetadata *type metadata accessor for NFCWindowSceneEvent.PresentationCodingKeys()
{
  return &type metadata for NFCWindowSceneEvent.PresentationCodingKeys;
}

unint64_t sub_246543D24()
{
  unint64_t result = qword_268F8AC70;
  if (!qword_268F8AC70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC70);
  }
  return result;
}

unint64_t sub_246543D7C()
{
  unint64_t result = qword_268F8AC78;
  if (!qword_268F8AC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC78);
  }
  return result;
}

unint64_t sub_246543DD4()
{
  unint64_t result = qword_268F8AC80;
  if (!qword_268F8AC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC80);
  }
  return result;
}

unint64_t sub_246543E2C()
{
  unint64_t result = qword_268F8AC88;
  if (!qword_268F8AC88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC88);
  }
  return result;
}

unint64_t sub_246543E84()
{
  unint64_t result = qword_268F8AC90;
  if (!qword_268F8AC90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC90);
  }
  return result;
}

unint64_t sub_246543EDC()
{
  unint64_t result = qword_268F8AC98;
  if (!qword_268F8AC98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8AC98);
  }
  return result;
}

unint64_t sub_246543F34()
{
  unint64_t result = qword_268F8ACA0;
  if (!qword_268F8ACA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8ACA0);
  }
  return result;
}

unint64_t sub_246543F8C()
{
  unint64_t result = qword_268F8ACA8;
  if (!qword_268F8ACA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8ACA8);
  }
  return result;
}

unint64_t sub_246543FE4()
{
  unint64_t result = qword_268F8ACB0;
  if (!qword_268F8ACB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F8ACB0);
  }
  return result;
}

uint64_t sub_246544038(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6544726564616572 && a2 == 0xEE00646574636574;
  if (v2 || (sub_2465443E0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61746E6573657270 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2465443E0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_246544168()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2465441A0(uint64_t a1)
{
  BOOL v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  uint64_t v4 = a1;
  return v2(&v4);
}

uint64_t sub_2465441D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24654423C()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_246544274(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24654428C(uint64_t a1, char *a2)
{
  char v4 = *a2;
  uint64_t v5 = v2[5];
  uint64_t v6 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v5);
  char v8 = v4;
  return (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(v6 + 8))(a1, &v8, v5, v6);
}

uint64_t sub_246544304(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_246544340()
{
  return MEMORY[0x270F82250]();
}

uint64_t sub_246544350()
{
  return MEMORY[0x270F82258]();
}

uint64_t sub_246544360()
{
  return MEMORY[0x270F82260]();
}

uint64_t sub_246544380()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_246544390()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2465443A0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2465443B0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2465443C0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2465443D0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2465443E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2465443F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_246544400()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_246544410()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_246544420()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_246544430()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
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