unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

BOOL static RemoteBrowsingIdleMonitorAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RemoteBrowsingIdleMonitorAction.hash(into:)()
{
  return sub_24F2A9B10();
}

uint64_t sub_24F29AA3C()
{
  return 0;
}

uint64_t sub_24F29AA48@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24F29AA78()
{
  return 0;
}

void sub_24F29AA84(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24F29AA90(uint64_t a1)
{
  unint64_t v2 = sub_24F29B120();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F29AACC(uint64_t a1)
{
  unint64_t v2 = sub_24F29B120();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F29AB08(char a1)
{
  if (a1) {
    return 0x4F656C6449707061;
  }
  else {
    return 0x6570704177656976;
  }
}

BOOL sub_24F29AB54(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F29AB70()
{
  return sub_24F2A9B10();
}

uint64_t sub_24F29ABA0()
{
  return sub_24F29AB08(*v0);
}

uint64_t sub_24F29ABA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F29BB44(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F29ABD0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24F29ABDC(uint64_t a1)
{
  unint64_t v2 = sub_24F29B0CC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F29AC18(uint64_t a1)
{
  unint64_t v2 = sub_24F29B0CC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F29AC54(uint64_t a1)
{
  unint64_t v2 = sub_24F29B174();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F29AC90(uint64_t a1)
{
  unint64_t v2 = sub_24F29B174();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RemoteBrowsingIdleMonitorAction.hashValue.getter()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F29AD14()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F29AD5C()
{
  return sub_24F2A9B30();
}

uint64_t RemoteBrowsingIdleMonitorAction.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8948);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388]();
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8950);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8958);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F29B0CC();
  sub_24F2A9B50();
  v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24F29B120();
    v14 = v18;
    sub_24F2A9A90();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24F29B174();
    sub_24F2A9A90();
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

unint64_t sub_24F29B0CC()
{
  unint64_t result = qword_2699E8960;
  if (!qword_2699E8960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8960);
  }
  return result;
}

unint64_t sub_24F29B120()
{
  unint64_t result = qword_2699E8968;
  if (!qword_2699E8968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8968);
  }
  return result;
}

unint64_t sub_24F29B174()
{
  unint64_t result = qword_2699E8970;
  if (!qword_2699E8970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8970);
  }
  return result;
}

uint64_t RemoteBrowsingIdleMonitorAction.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8978);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8980);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8988);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F29B0CC();
  v11 = v32;
  sub_24F2A9B40();
  if (v11) {
    goto LABEL_6;
  }
  v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  v14 = v10;
  uint64_t v15 = sub_24F2A9A80();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24F2A99D0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8990);
    *char v22 = &type metadata for RemoteBrowsingIdleMonitorAction;
    sub_24F2A9A20();
    sub_24F2A99C0();
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
    sub_24F29B120();
    v18 = v14;
    sub_24F2A9A10();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24F29B174();
    sub_24F2A9A10();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
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

unint64_t sub_24F29B674()
{
  unint64_t result = qword_2699E8998;
  if (!qword_2699E8998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8998);
  }
  return result;
}

uint64_t sub_24F29B6C8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return RemoteBrowsingIdleMonitorAction.init(from:)(a1, a2);
}

uint64_t sub_24F29B6E0(void *a1)
{
  return RemoteBrowsingIdleMonitorAction.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorAction()
{
  return &type metadata for RemoteBrowsingIdleMonitorAction;
}

uint64_t getEnumTagSinglePayload for SubscriptionHandoffFeature.TaskIdentifier(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s21FitnessRemoteBrowsing31RemoteBrowsingIdleMonitorActionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F29B870);
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

uint64_t sub_24F29B898(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24F29B8A0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorAction.CodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorAction.CodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorAction.ViewAppearedCodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorAction.AppIdleOccuredCodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorAction.AppIdleOccuredCodingKeys;
}

unint64_t sub_24F29B8E0()
{
  unint64_t result = qword_2699E89A0;
  if (!qword_2699E89A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E89A0);
  }
  return result;
}

unint64_t sub_24F29B938()
{
  unint64_t result = qword_2699E89A8;
  if (!qword_2699E89A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E89A8);
  }
  return result;
}

unint64_t sub_24F29B990()
{
  unint64_t result = qword_2699E89B0;
  if (!qword_2699E89B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E89B0);
  }
  return result;
}

unint64_t sub_24F29B9E8()
{
  unint64_t result = qword_2699E89B8;
  if (!qword_2699E89B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E89B8);
  }
  return result;
}

unint64_t sub_24F29BA40()
{
  unint64_t result = qword_2699E89C0;
  if (!qword_2699E89C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E89C0);
  }
  return result;
}

unint64_t sub_24F29BA98()
{
  unint64_t result = qword_2699E89C8;
  if (!qword_2699E89C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E89C8);
  }
  return result;
}

unint64_t sub_24F29BAF0()
{
  unint64_t result = qword_2699E89D0;
  if (!qword_2699E89D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E89D0);
  }
  return result;
}

uint64_t sub_24F29BB44(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v3 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4F656C6449707061 && a2 == 0xEE00646572756363)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F2A9AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

BOOL static SubscriptionHandoffAction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SubscriptionHandoffAction.hash(into:)()
{
  return sub_24F2A9B10();
}

uint64_t sub_24F29BCA4(char a1)
{
  if (!a1) {
    return 0x6570704177656976;
  }
  if (a1 == 1) {
    return 0xD000000000000031;
  }
  return 0xD00000000000002FLL;
}

uint64_t sub_24F29BD08(uint64_t a1)
{
  unint64_t v2 = sub_24F29C38C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F29BD44(uint64_t a1)
{
  unint64_t v2 = sub_24F29C38C();
  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL sub_24F29BD80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24F29BD94()
{
  return sub_24F29BCA4(*v0);
}

uint64_t sub_24F29BD9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F29CF70(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F29BDC4(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24F29BDD0(uint64_t a1)
{
  unint64_t v2 = sub_24F29C2E4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F29BE0C(uint64_t a1)
{
  unint64_t v2 = sub_24F29C2E4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F29BE48(uint64_t a1)
{
  unint64_t v2 = sub_24F29C338();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F29BE84(uint64_t a1)
{
  unint64_t v2 = sub_24F29C338();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F29BEC0(uint64_t a1)
{
  unint64_t v2 = sub_24F29C3E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F29BEFC(uint64_t a1)
{
  unint64_t v2 = sub_24F29C3E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SubscriptionHandoffAction.hashValue.getter()
{
  return sub_24F2A9B30();
}

uint64_t SubscriptionHandoffAction.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E89D8);
  uint64_t v24 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  MEMORY[0x270FA5388]();
  uint64_t v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E89E0);
  uint64_t v21 = *(void *)(v6 - 8);
  uint64_t v22 = v6;
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E89E8);
  uint64_t v19 = *(void *)(v9 - 8);
  uint64_t v20 = v9;
  MEMORY[0x270FA5388]();
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E89F0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v16 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F29C2E4();
  sub_24F2A9B50();
  if (v16)
  {
    if (v16 == 1)
    {
      char v27 = 1;
      sub_24F29C38C();
      sub_24F2A9A90();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
    }
    else
    {
      char v28 = 2;
      sub_24F29C338();
      char v17 = v23;
      sub_24F2A9A90();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    }
  }
  else
  {
    char v26 = 0;
    sub_24F29C3E0();
    sub_24F2A9A90();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

unint64_t sub_24F29C2E4()
{
  unint64_t result = qword_2699E89F8;
  if (!qword_2699E89F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E89F8);
  }
  return result;
}

unint64_t sub_24F29C338()
{
  unint64_t result = qword_2699E8A00;
  if (!qword_2699E8A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A00);
  }
  return result;
}

unint64_t sub_24F29C38C()
{
  unint64_t result = qword_2699E8A08;
  if (!qword_2699E8A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A08);
  }
  return result;
}

unint64_t sub_24F29C3E0()
{
  unint64_t result = qword_2699E8A10;
  if (!qword_2699E8A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A10);
  }
  return result;
}

uint64_t SubscriptionHandoffAction.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  v35 = a2;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8A18);
  uint64_t v33 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388]();
  v37 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8A20);
  uint64_t v32 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8A28);
  uint64_t v31 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  int v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8A30);
  uint64_t v36 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F29C2E4();
  uint64_t v12 = (uint64_t)v39;
  sub_24F2A9B40();
  if (v12) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v29 = v6;
  uint64_t v30 = 0;
  uint64_t v14 = v37;
  uint64_t v13 = v38;
  v39 = a1;
  uint64_t v15 = v11;
  uint64_t v16 = sub_24F2A9A80();
  if (*(void *)(v16 + 16) != 1)
  {
    uint64_t v21 = sub_24F2A99D0();
    swift_allocError();
    uint64_t v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8990);
    *uint64_t v23 = &type metadata for SubscriptionHandoffAction;
    sub_24F2A9A20();
    sub_24F2A99C0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB0], v21);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v9);
    a1 = v39;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  int v17 = *(unsigned __int8 *)(v16 + 32);
  if (*(unsigned char *)(v16 + 32))
  {
    if (v17 == 1)
    {
      char v41 = 1;
      sub_24F29C38C();
      uint64_t v18 = v30;
      sub_24F2A9A10();
      uint64_t v20 = v35;
      uint64_t v19 = v36;
      uint64_t v30 = v18;
      if (v18)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
LABEL_12:
        a1 = v39;
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
      }
      (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
    }
    else
    {
      char v42 = 2;
      sub_24F29C338();
      uint64_t v25 = v30;
      sub_24F2A9A10();
      uint64_t v20 = v35;
      uint64_t v26 = v36;
      uint64_t v30 = v25;
      if (v25)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
        goto LABEL_12;
      }
      (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v13);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
    }
  }
  else
  {
    char v40 = 0;
    sub_24F29C3E0();
    uint64_t v24 = v30;
    sub_24F2A9A10();
    uint64_t v30 = v24;
    if (v24)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v9);
    uint64_t v20 = v35;
  }
  *uint64_t v20 = v17;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
}

unint64_t sub_24F29C9F0()
{
  unint64_t result = qword_2699E8A38;
  if (!qword_2699E8A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A38);
  }
  return result;
}

uint64_t sub_24F29CA44@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return SubscriptionHandoffAction.init(from:)(a1, a2);
}

uint64_t sub_24F29CA5C(void *a1)
{
  return SubscriptionHandoffAction.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction()
{
  return &type metadata for SubscriptionHandoffAction;
}

uint64_t _s21FitnessRemoteBrowsing25SubscriptionHandoffActionOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s21FitnessRemoteBrowsing25SubscriptionHandoffActionOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x24F29CBE8);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

unsigned char *sub_24F29CC10(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction.CodingKeys()
{
  return &type metadata for SubscriptionHandoffAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction.ViewAppearedCodingKeys()
{
  return &type metadata for SubscriptionHandoffAction.ViewAppearedCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction.BeginRemoteBrowsingServiceSubscriptionObservationCodingKeys()
{
  return &type metadata for SubscriptionHandoffAction.BeginRemoteBrowsingServiceSubscriptionObservationCodingKeys;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffAction.EndRemoteBrowsingServiceSubscriptionObservationCodingKeys()
{
  return &type metadata for SubscriptionHandoffAction.EndRemoteBrowsingServiceSubscriptionObservationCodingKeys;
}

unint64_t sub_24F29CC5C()
{
  unint64_t result = qword_2699E8A40;
  if (!qword_2699E8A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A40);
  }
  return result;
}

unint64_t sub_24F29CCB4()
{
  unint64_t result = qword_2699E8A48;
  if (!qword_2699E8A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A48);
  }
  return result;
}

unint64_t sub_24F29CD0C()
{
  unint64_t result = qword_2699E8A50;
  if (!qword_2699E8A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A50);
  }
  return result;
}

unint64_t sub_24F29CD64()
{
  unint64_t result = qword_2699E8A58;
  if (!qword_2699E8A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A58);
  }
  return result;
}

unint64_t sub_24F29CDBC()
{
  unint64_t result = qword_2699E8A60;
  if (!qword_2699E8A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A60);
  }
  return result;
}

unint64_t sub_24F29CE14()
{
  unint64_t result = qword_2699E8A68;
  if (!qword_2699E8A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A68);
  }
  return result;
}

unint64_t sub_24F29CE6C()
{
  unint64_t result = qword_2699E8A70;
  if (!qword_2699E8A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A70);
  }
  return result;
}

unint64_t sub_24F29CEC4()
{
  unint64_t result = qword_2699E8A78;
  if (!qword_2699E8A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A78);
  }
  return result;
}

unint64_t sub_24F29CF1C()
{
  unint64_t result = qword_2699E8A80;
  if (!qword_2699E8A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A80);
  }
  return result;
}

uint64_t sub_24F29CF70(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6570704177656976 && a2 == 0xEC00000064657261;
  if (v3 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000031 && a2 == 0x800000024F2AC740 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000002FLL && a2 == 0x800000024F2AC780)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24F2A9AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

__n128 SubscriptionHandoffFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t SubscriptionHandoffFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, uint64_t a2, unint64_t *a3, unsigned char *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8A88);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v11 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  uint64_t v14 = (char *)&v71 - v13;
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  int v17 = (char *)&v71 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v71 - v18;
  int v20 = *a4;
  if (*a4)
  {
    uint64_t v21 = *v4;
    uint64_t v22 = v4[1];
    uint64_t v24 = v4[2];
    uint64_t v23 = v4[3];
    v79 = v24;
    if (v20 == 1)
    {
      uint64_t v25 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699E8AB0);
      v78 = (unint64_t *)&v17[v25[20]];
      uint64_t v26 = v23;
      char v27 = &v17[v25[24]];
      v76 = &v17[v25[28]];
      uint64_t v28 = &v17[v25[32]];
      char v80 = 0;
      sub_24F29D914();
      sub_24F2A99A0();
      *((void *)v17 + 5) = 0x4014000000000000;
      v17[48] = 1;
      uint64_t v29 = a3;
      uint64_t v30 = *MEMORY[0x263F39580];
      uint64_t v31 = sub_24F2A9860();
      uint64_t v32 = v30;
      a3 = v29;
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v27, v32, v31);
      uint64_t v33 = *MEMORY[0x263F39570];
      uint64_t v34 = sub_24F2A9850();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 104))(v76, v33, v34);
      v35 = (void *)swift_allocObject();
      v35[2] = v21;
      v35[3] = v22;
      v35[4] = v79;
      v35[5] = v26;
      *(void *)uint64_t v28 = &unk_2699E8AC0;
      *((void *)v28 + 1) = v35;
      swift_retain();
      swift_retain();
      sub_24F2A9950();
      (*(void (**)(char *, void, uint64_t))(v8 + 104))(v17, *MEMORY[0x263F39538], v7);
      unint64_t v36 = *v29;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v36 = sub_24F29ECB4(0, *(void *)(v36 + 16) + 1, 1, v36, &qword_2699E8B20, &qword_2699E8A88);
      }
      unint64_t v38 = *(void *)(v36 + 16);
      unint64_t v37 = *(void *)(v36 + 24);
      if (v38 >= v37 >> 1) {
        unint64_t v36 = sub_24F29ECB4(v37 > 1, v38 + 1, 1, v36, &qword_2699E8B20, &qword_2699E8A88);
      }
      *(void *)(v36 + 16) = v38 + 1;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(v36+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v38, v17, v7);
    }
    else
    {
      v76 = v21;
      char v82 = 0;
      sub_24F29D914();
      sub_24F2A99A0();
      uint64_t v50 = *MEMORY[0x263F39540];
      v75 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
      v75(v14, v50, v7);
      v78 = a3;
      unint64_t v51 = *a3;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v77 = v23;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        unint64_t v51 = sub_24F29ECB4(0, *(void *)(v51 + 16) + 1, 1, v51, &qword_2699E8B20, &qword_2699E8A88);
      }
      unint64_t v54 = *(void *)(v51 + 16);
      unint64_t v53 = *(void *)(v51 + 24);
      if (v54 >= v53 >> 1) {
        unint64_t v51 = sub_24F29ECB4(v53 > 1, v54 + 1, 1, v51, &qword_2699E8B20, &qword_2699E8A88);
      }
      *(void *)(v51 + 16) = v54 + 1;
      v56 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32);
      uint64_t v55 = v8 + 32;
      unint64_t v73 = (*(unsigned __int8 *)(v55 + 48) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 48);
      v74 = v56;
      uint64_t v72 = *(void *)(v55 + 40);
      v56(v51 + v73 + v72 * v54, v14, v7);
      v57 = v78;
      unint64_t *v78 = v51;
      v58 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699E8A98);
      v71 = &v11[v58[12]];
      v59 = &v11[v58[16]];
      v60 = &v11[v58[20]];
      v61 = &v11[v58[24]];
      char v81 = 1;
      sub_24F2A99A0();
      uint64_t v62 = *MEMORY[0x263F39580];
      uint64_t v63 = sub_24F2A9860();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v63 - 8) + 104))(v59, v62, v63);
      uint64_t v64 = *MEMORY[0x263F39578];
      uint64_t v65 = sub_24F2A9850();
      v66 = v60;
      a3 = v57;
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v65 - 8) + 104))(v66, v64, v65);
      v67 = (void *)swift_allocObject();
      v68 = v77;
      v67[2] = v76;
      v67[3] = v22;
      v67[4] = v79;
      v67[5] = v68;
      *(void *)v61 = &unk_2699E8AA8;
      *((void *)v61 + 1) = v67;
      swift_retain();
      swift_retain();
      sub_24F2A9950();
      v75(v11, *MEMORY[0x263F39530], v7);
      unint64_t v36 = *v57;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v36 = sub_24F29ECB4(0, *(void *)(v36 + 16) + 1, 1, v36, &qword_2699E8B20, &qword_2699E8A88);
      }
      unint64_t v70 = *(void *)(v36 + 16);
      unint64_t v69 = *(void *)(v36 + 24);
      if (v70 >= v69 >> 1) {
        unint64_t v36 = sub_24F29ECB4(v69 > 1, v70 + 1, 1, v36, &qword_2699E8B20, &qword_2699E8A88);
      }
      *(void *)(v36 + 16) = v70 + 1;
      uint64_t result = v74(v36 + v73 + v70 * v72, v11, v7);
    }
  }
  else
  {
    char v40 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699E8A98);
    char v41 = &v19[v40[16]];
    char v42 = &v19[v40[20]];
    v43 = &v19[v40[24]];
    *(_OWORD *)uint64_t v19 = 0u;
    *((_OWORD *)v19 + 1) = 0u;
    *((void *)v19 + 4) = 0;
    *(void *)v43 = &unk_2699E8AC8;
    *((void *)v43 + 1) = 0;
    sub_24F2A9950();
    uint64_t v44 = *MEMORY[0x263F39588];
    uint64_t v45 = sub_24F2A9860();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v45 - 8) + 104))(v41, v44, v45);
    uint64_t v46 = *MEMORY[0x263F39578];
    uint64_t v47 = sub_24F2A9850();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104))(v42, v46, v47);
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v19, *MEMORY[0x263F39530], v7);
    unint64_t v36 = *a3;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v36 = sub_24F29ECB4(0, *(void *)(v36 + 16) + 1, 1, v36, &qword_2699E8B20, &qword_2699E8A88);
    }
    unint64_t v49 = *(void *)(v36 + 16);
    unint64_t v48 = *(void *)(v36 + 24);
    if (v49 >= v48 >> 1) {
      unint64_t v36 = sub_24F29ECB4(v48 > 1, v49 + 1, 1, v36, &qword_2699E8B20, &qword_2699E8A88);
    }
    *(void *)(v36 + 16) = v49 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(v36+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v49, v19, v7);
  }
  *a3 = v36;
  return result;
}

unint64_t sub_24F29D914()
{
  unint64_t result = qword_2699E8A90;
  if (!qword_2699E8A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8A90);
  }
  return result;
}

uint64_t sub_24F29D968()
{
  *(void *)(v0 + 16) = sub_24F2A9940();
  *(void *)(v0 + 24) = sub_24F2A9930();
  *(unsigned char *)(v0 + 40) = 1;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8B08);
  void *v1 = v0;
  v1[1] = sub_24F29DA44;
  return MEMORY[0x270F252C8](v0 + 40, v2);
}

uint64_t sub_24F29DA44()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24F2A9910();
  return MEMORY[0x270FA2498](sub_24F29F76C, v1, v0);
}

uint64_t sub_24F29DB80(uint64_t a1, int *a2)
{
  v2[4] = a1;
  v2[5] = sub_24F2A9940();
  v2[6] = sub_24F2A9930();
  char v6 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  v2[7] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24F29DC78;
  return v6();
}

uint64_t sub_24F29DC78()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = sub_24F2A9910();
    return MEMORY[0x270FA2498](sub_24F29DFCC, v4, v3);
  }
  else
  {
    *(unsigned char *)(v2 + 80) = 2;
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v2 + 72) = v5;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8B08);
    *uint64_t v5 = v2;
    v5[1] = sub_24F29DE2C;
    return MEMORY[0x270F252C8](v2 + 80, v6);
  }
}

uint64_t sub_24F29DE2C()
{
  swift_task_dealloc();
  uint64_t v1 = sub_24F2A9910();
  return MEMORY[0x270FA2498](sub_24F29DF68, v1, v0);
}

uint64_t sub_24F29DF68()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F29DFCC()
{
  uint64_t v14 = v0;
  swift_release();
  if (qword_2699E8940 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[8];
  uint64_t v2 = sub_24F2A9740();
  __swift_project_value_buffer(v2, (uint64_t)qword_2699ECC40);
  MEMORY[0x2533588E0](v1);
  MEMORY[0x2533588E0](v1);
  uint64_t v3 = sub_24F2A9720();
  os_log_type_t v4 = sub_24F2A9970();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = v0[8];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v13 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    v0[2] = v6;
    MEMORY[0x2533588E0](v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8B10);
    uint64_t v9 = sub_24F2A98B0();
    v0[3] = sub_24F29EF20(v9, v10, &v13);
    sub_24F2A9980();
    swift_bridgeObjectRelease();
    MEMORY[0x2533588D0](v6);
    MEMORY[0x2533588D0](v6);
    _os_log_impl(&dword_24F299000, v3, v4, "Observation of remote browsing service subscription returns %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x253358A10](v8, -1, -1);
    MEMORY[0x253358A10](v7, -1, -1);

    MEMORY[0x2533588D0](v6);
  }
  else
  {
    MEMORY[0x2533588D0](v0[8]);
    MEMORY[0x2533588D0](v6);
    MEMORY[0x2533588D0](v6);
  }
  v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24F29E200(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[2] = sub_24F2A9940();
  v4[3] = sub_24F2A9930();
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v6 = (void *)swift_task_alloc();
  v4[4] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_24F29E2F8;
  return v8(1);
}

uint64_t sub_24F29E2F8()
{
  *(void *)(*(void *)v1 + 40) = v0;
  swift_task_dealloc();
  uint64_t v3 = sub_24F2A9910();
  if (v0) {
    os_log_type_t v4 = sub_24F29E4B8;
  }
  else {
    os_log_type_t v4 = sub_24F29E454;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_24F29E454()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F29E4B8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F29E528(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F29E5E4;
  return sub_24F29E200(a1, v4, v5, v6);
}

uint64_t sub_24F29E5E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_24F29E71C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24F29F768;
  return sub_24F29DB80(a1, v4);
}

unint64_t sub_24F29E7DC()
{
  unint64_t result = qword_2699E8AD0;
  if (!qword_2699E8AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8AD0);
  }
  return result;
}

unint64_t sub_24F29E834()
{
  unint64_t result = qword_2699E8AD8;
  if (!qword_2699E8AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8AD8);
  }
  return result;
}

unint64_t sub_24F29E88C()
{
  unint64_t result = qword_2699E8AE0;
  if (!qword_2699E8AE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8AE0);
  }
  return result;
}

unint64_t sub_24F29E8E4()
{
  unint64_t result = qword_2699E8AE8;
  if (!qword_2699E8AE8)
  {
    type metadata accessor for SubscriptionHandoffState();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8AE8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SubscriptionHandoffEnvironment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SubscriptionHandoffEnvironment()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SubscriptionHandoffEnvironment(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SubscriptionHandoffEnvironment(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_OWORD *assignWithTake for SubscriptionHandoffEnvironment(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionHandoffEnvironment(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SubscriptionHandoffEnvironment(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffFeature()
{
  return &type metadata for SubscriptionHandoffFeature;
}

unsigned char *storeEnumTagSinglePayload for SubscriptionHandoffFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x24F29EC10);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffFeature.TaskIdentifier()
{
  return &type metadata for SubscriptionHandoffFeature.TaskIdentifier;
}

unint64_t sub_24F29EC4C()
{
  unint64_t result = qword_2699E8AF0;
  if (!qword_2699E8AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8AF0);
  }
  return result;
}

uint64_t sub_24F29ECA0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24F29ECB4(a1, a2, a3, a4, &qword_2699E8AF8, &qword_2699E8B00);
}

uint64_t sub_24F29ECB4(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v10 = a2;
      }
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (BOOL v18 = v14 == -1) : (BOOL v18 = 0), v18))
  {
LABEL_29:
    uint64_t result = sub_24F2A99F0();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v16 + v20;
  if (a1)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(void *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_24F29F578(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_24F29EF20(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24F29EFF4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24F29F70C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_24F29F70C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24F29EFF4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_24F2A9990();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24F29F1B0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_24F2A99E0();
  if (!v8)
  {
    sub_24F2A99F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24F2A9A00();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_24F29F1B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24F29F248(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24F29F428(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24F29F428(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24F29F248(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_24F29F3C0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24F2A99B0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24F2A99F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24F2A98E0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24F2A9A00();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24F2A99F0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24F29F3C0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8B18);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24F29F428(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8B18);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24F2A9A00();
  __break(1u);
  return result;
}

uint64_t sub_24F29F578(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(a5) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_24F2A9A00();
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24F29F70C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t RemoteBrowsingIdleMonitorEnvironment.init(invalidateRemoteBrowsing:makeAppIdleOccurredStream:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorEnvironment()
{
  return &type metadata for RemoteBrowsingIdleMonitorEnvironment;
}

__n128 RemoteBrowsingIdleMonitorFeature.init(environment:)@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t RemoteBrowsingIdleMonitorFeature.reduce(localState:sharedState:sideEffects:action:)(uint64_t a1, unsigned char *a2, unint64_t *a3, char *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8B00);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  unint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v10);
  unint64_t v15 = (char *)&v54 - v14;
  char v16 = *a4;
  uint64_t v17 = *v4;
  uint64_t v18 = v4[1];
  uint64_t v19 = v4[2];
  uint64_t v20 = v4[3];
  if (v16)
  {
    if (*a2 != 1) {
      return result;
    }
    uint64_t v55 = *v4;
    uint64_t v56 = v19;
    if (qword_2699E8940 != -1) {
      swift_once();
    }
    unint64_t v54 = a3;
    uint64_t v21 = sub_24F2A9740();
    __swift_project_value_buffer(v21, (uint64_t)qword_2699ECC40);
    uint64_t v22 = sub_24F2A9720();
    os_log_type_t v23 = sub_24F2A9970();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_24F299000, v22, v23, "App Idle Occured", v24, 2u);
      MEMORY[0x253358A10](v24, -1, -1);
    }

    uint64_t v25 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699E8A98);
    uint64_t v26 = &v12[v25[16]];
    char v27 = &v12[v25[20]];
    uint64_t v28 = &v12[v25[24]];
    char v58 = 1;
    sub_24F2A0AB0();
    sub_24F2A99A0();
    uint64_t v29 = *MEMORY[0x263F39580];
    uint64_t v30 = sub_24F2A9860();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(v26, v29, v30);
    uint64_t v31 = *MEMORY[0x263F39570];
    uint64_t v32 = sub_24F2A9850();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v32 - 8) + 104))(v27, v31, v32);
    uint64_t v33 = (void *)swift_allocObject();
    v33[2] = v55;
    v33[3] = v18;
    v33[4] = v56;
    v33[5] = v20;
    *(void *)uint64_t v28 = &unk_2699E8B38;
    *((void *)v28 + 1) = v33;
    swift_retain();
    swift_retain();
    sub_24F2A9950();
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F39530], v8);
    uint64_t v34 = v54;
    unint64_t v35 = *v54;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v35 = sub_24F29ECA0(0, *(void *)(v35 + 16) + 1, 1, v35);
    }
    unint64_t v37 = *(void *)(v35 + 16);
    unint64_t v36 = *(void *)(v35 + 24);
    if (v37 >= v36 >> 1) {
      unint64_t v35 = sub_24F29ECA0(v36 > 1, v37 + 1, 1, v35);
    }
    *(void *)(v35 + 16) = v37 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(v35+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v37, v12, v8);
  }
  else
  {
    a2[1] = 1;
    uint64_t v55 = v17;
    uint64_t v56 = v19;
    unint64_t v38 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2699E8A98);
    unint64_t v54 = (unint64_t *)&v15[v38[12]];
    v39 = &v15[v38[16]];
    char v40 = &v15[v38[20]];
    char v41 = &v15[v38[24]];
    char v57 = 0;
    sub_24F2A0AB0();
    sub_24F2A99A0();
    uint64_t v42 = v20;
    uint64_t v43 = v8;
    uint64_t v44 = a3;
    uint64_t v45 = *MEMORY[0x263F39580];
    uint64_t v46 = sub_24F2A9860();
    uint64_t v47 = v45;
    uint64_t v34 = v44;
    uint64_t v48 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 104))(v39, v47, v46);
    uint64_t v49 = *MEMORY[0x263F39570];
    uint64_t v50 = sub_24F2A9850();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v50 - 8) + 104))(v40, v49, v50);
    unint64_t v51 = (void *)swift_allocObject();
    v51[2] = v55;
    v51[3] = v18;
    v51[4] = v56;
    v51[5] = v42;
    *(void *)char v41 = &unk_2699E8B48;
    *((void *)v41 + 1) = v51;
    swift_retain();
    swift_retain();
    sub_24F2A9950();
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v15, *MEMORY[0x263F39530], v43);
    unint64_t v35 = *v34;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v35 = sub_24F29ECA0(0, *(void *)(v35 + 16) + 1, 1, v35);
    }
    unint64_t v53 = *(void *)(v35 + 16);
    unint64_t v52 = *(void *)(v35 + 24);
    if (v53 >= v52 >> 1) {
      unint64_t v35 = sub_24F29ECA0(v52 > 1, v53 + 1, 1, v35);
    }
    *(void *)(v35 + 16) = v53 + 1;
    uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(v35+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v53, v15, v48);
  }
  *uint64_t v34 = v35;
  return result;
}

uint64_t sub_24F29FD50(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  v4[12] = a1;
  v4[13] = sub_24F2A9940();
  v4[14] = sub_24F2A9930();
  uint64_t v8 = (uint64_t (*)(void *))((char *)a4 + *a4);
  unint64_t v6 = (void *)swift_task_alloc();
  v4[15] = v6;
  *unint64_t v6 = v4;
  v6[1] = sub_24F29FE58;
  return v8(v4 + 7);
}

uint64_t sub_24F29FE58()
{
  uint64_t v2 = (void *)*v1;
  v2[16] = v0;
  swift_task_dealloc();
  uint64_t v4 = sub_24F2A9910();
  v2[17] = v4;
  v2[18] = v3;
  if (v0) {
    uint64_t v5 = sub_24F2A0610;
  }
  else {
    uint64_t v5 = sub_24F29FFB8;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F29FFB8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_24F2A9960();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  uint64_t v5 = sub_24F2A9930();
  v0[19] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  unint64_t v6 = (void *)swift_task_alloc();
  v0[20] = (uint64_t)v6;
  *unint64_t v6 = v0;
  v6[1] = sub_24F2A01A8;
  uint64_t v7 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 22, v5, v7);
}

uint64_t sub_24F2A01A8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 136);
  return MEMORY[0x270FA2498](sub_24F2A02EC, v3, v2);
}

uint64_t sub_24F2A02EC()
{
  if (*(unsigned char *)(v0 + 176) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    *(unsigned char *)(v0 + 177) = 1;
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8B70);
    *uint64_t v3 = v0;
    v3[1] = sub_24F2A0404;
    return MEMORY[0x270F252C8](v0 + 177, v4);
  }
}

uint64_t sub_24F2A0404()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 144);
  uint64_t v3 = *(void *)(v1 + 136);
  return MEMORY[0x270FA2498](sub_24F2A0524, v3, v2);
}

uint64_t sub_24F2A0524()
{
  uint64_t v1 = sub_24F2A9930();
  v0[19] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[20] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24F2A01A8;
  uint64_t v3 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v0 + 22, v1, v3);
}

uint64_t sub_24F2A0610()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F2A0674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a2;
  v3[3] = a3;
  sub_24F2A9940();
  v3[4] = sub_24F2A9930();
  uint64_t v5 = sub_24F2A9910();
  v3[5] = v5;
  v3[6] = v4;
  return MEMORY[0x270FA2498](sub_24F2A070C, v5, v4);
}

uint64_t sub_24F2A070C()
{
  if (qword_2699E8940 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_24F2A9740();
  __swift_project_value_buffer(v1, (uint64_t)qword_2699ECC40);
  uint64_t v2 = sub_24F2A9720();
  os_log_type_t v3 = sub_24F2A9970();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_24F299000, v2, v3, "Invalidating Remote Browsing", v4, 2u);
    MEMORY[0x253358A10](v4, -1, -1);
  }
  uint64_t v5 = *(int **)(v0 + 16);

  uint64_t v8 = (uint64_t (*)(void))((char *)v5 + *v5);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v6;
  *unint64_t v6 = v0;
  v6[1] = sub_24F2A0898;
  return v8();
}

uint64_t sub_24F2A0898()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 64) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void *)(v2 + 40);
  if (v0) {
    uint64_t v5 = sub_24F2A0A38;
  }
  else {
    uint64_t v5 = sub_24F2A09D4;
  }
  return MEMORY[0x270FA2498](v5, v4, v3);
}

uint64_t sub_24F2A09D4()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24F2A0A38()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t RemoteBrowsingIdleMonitorFeature.dispose(localState:sharedState:)(uint64_t result)
{
  *(unsigned char *)(result + 1) = 0;
  return result;
}

void sub_24F2A0AA4(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 1) = 0;
}

unint64_t sub_24F2A0AB0()
{
  unint64_t result = qword_2699E8B28;
  if (!qword_2699E8B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2699E8B28);
  }
  return result;
}

uint64_t sub_24F2A0B08(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_24F29E5E4;
  return sub_24F2A0674(a1, v4, v5);
}

uint64_t sub_24F2A0BC8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_24F29F768;
  return sub_24F29FD50(a1, v4, v5, v6);
}

unint64_t sub_24F2A0C88()
{
  unint64_t result = qword_2699E8B50;
  if (!qword_2699E8B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8B50);
  }
  return result;
}

unint64_t sub_24F2A0CE0()
{
  unint64_t result = qword_2699E8B58;
  if (!qword_2699E8B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8B58);
  }
  return result;
}

unint64_t sub_24F2A0D38()
{
  unint64_t result = qword_2699E8B60;
  if (!qword_2699E8B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8B60);
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorFeature()
{
  return &type metadata for RemoteBrowsingIdleMonitorFeature;
}

unsigned char *storeEnumTagSinglePayload for RemoteBrowsingIdleMonitorFeature.TaskIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F2A0E68);
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

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorFeature.TaskIdentifier()
{
  return &type metadata for RemoteBrowsingIdleMonitorFeature.TaskIdentifier;
}

unint64_t sub_24F2A0EA4()
{
  unint64_t result = qword_2699E8B68;
  if (!qword_2699E8B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8B68);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

void RemoteBrowsingIdleMonitorState.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 1);
}

unsigned char *RemoteBrowsingIdleMonitorState.state.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 1) = *result;
  return result;
}

uint64_t (*RemoteBrowsingIdleMonitorState.state.modify())()
{
  return nullsub_1;
}

FitnessRemoteBrowsing::RemoteBrowsingIdleMonitorState __swiftcall RemoteBrowsingIdleMonitorState.init(isRemoteBrowsingActive:state:)(Swift::Bool isRemoteBrowsingActive, FitnessRemoteBrowsing::RemoteBrowsingIdleMonitorLoadState state)
{
  char v3 = *(unsigned char *)state;
  *uint64_t v2 = isRemoteBrowsingActive;
  v2[1] = v3;
  result.isRemoteBrowsingActive = isRemoteBrowsingActive;
  return result;
}

uint64_t sub_24F2A0FF4(char a1)
{
  if (a1) {
    return 0x6574617473;
  }
  else {
    return 0xD000000000000016;
  }
}

uint64_t sub_24F2A102C()
{
  return sub_24F2A0FF4(*v0);
}

uint64_t sub_24F2A1034@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F2A1950(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F2A105C(uint64_t a1)
{
  unint64_t v2 = sub_24F2A1258();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A1098(uint64_t a1)
{
  unint64_t v2 = sub_24F2A1258();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RemoteBrowsingIdleMonitorState.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8B78);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v10 = *(unsigned __int8 *)(v1 + 1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A1258();
  sub_24F2A9B50();
  char v13 = 0;
  sub_24F2A9AD0();
  if (!v2)
  {
    char v12 = v10;
    char v11 = 1;
    sub_24F2A12AC();
    sub_24F2A9AE0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_24F2A1258()
{
  unint64_t result = qword_2699E8B80;
  if (!qword_2699E8B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8B80);
  }
  return result;
}

unint64_t sub_24F2A12AC()
{
  unint64_t result = qword_2699E8B88;
  if (!qword_2699E8B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8B88);
  }
  return result;
}

uint64_t RemoteBrowsingIdleMonitorState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8B90);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A1258();
  sub_24F2A9B40();
  if (!v2)
  {
    char v15 = 0;
    char v9 = sub_24F2A9A60();
    char v13 = 1;
    sub_24F2A14BC();
    sub_24F2A9A70();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    char v10 = v14;
    *a2 = v9 & 1;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_24F2A14BC()
{
  unint64_t result = qword_2699E8B98;
  if (!qword_2699E8B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8B98);
  }
  return result;
}

uint64_t sub_24F2A1510@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return RemoteBrowsingIdleMonitorState.init(from:)(a1, a2);
}

uint64_t sub_24F2A1528(void *a1)
{
  return RemoteBrowsingIdleMonitorState.encode(to:)(a1);
}

BOOL static RemoteBrowsingIdleMonitorState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

BOOL sub_24F2A1568(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2 | a2[1] ^ a1[1]) & 1) == 0;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RemoteBrowsingIdleMonitorState(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *(unsigned __int8 *)a1;
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoteBrowsingIdleMonitorState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24F2A170CLL);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(unsigned char *)unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorState()
{
  return &type metadata for RemoteBrowsingIdleMonitorState;
}

unsigned char *storeEnumTagSinglePayload for RemoteBrowsingIdleMonitorState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F2A1810);
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

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorState.CodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorState.CodingKeys;
}

unint64_t sub_24F2A184C()
{
  unint64_t result = qword_2699E8BA0;
  if (!qword_2699E8BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8BA0);
  }
  return result;
}

unint64_t sub_24F2A18A4()
{
  unint64_t result = qword_2699E8BA8;
  if (!qword_2699E8BA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8BA8);
  }
  return result;
}

unint64_t sub_24F2A18FC()
{
  unint64_t result = qword_2699E8BB0;
  if (!qword_2699E8BB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8BB0);
  }
  return result;
}

uint64_t sub_24F2A1950(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000016 && a2 == 0x800000024F2ACAA0 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_24F2A9AF0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t RemoteParticipantDiscoveryInterface.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_24F2A1A44@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s21FitnessRemoteBrowsing0B29ParticipantDiscoveryInterfaceO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_24F2A1A70(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24F2A1A7C()
{
  return sub_24F2A9900();
}

uint64_t sub_24F2A1ADC()
{
  return sub_24F2A98F0();
}

unint64_t _s21FitnessRemoteBrowsing0B29ParticipantDiscoveryInterfaceO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

unint64_t sub_24F2A1B40()
{
  unint64_t result = qword_2699E8BB8;
  if (!qword_2699E8BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8BB8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RemoteParticipantDiscoveryInterface(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RemoteParticipantDiscoveryInterface(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x24F2A1CF0);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantDiscoveryInterface()
{
  return &type metadata for RemoteParticipantDiscoveryInterface;
}

unint64_t sub_24F2A1D28()
{
  unint64_t result = qword_2699E8BC0;
  if (!qword_2699E8BC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8BC0);
  }
  return result;
}

uint64_t SubscriptionHandoffEnvironment.init(requireRemoteBrowsingServiceSubscription:dismiss:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffEnvironment()
{
  return &type metadata for SubscriptionHandoffEnvironment;
}

uint64_t sub_24F2A1D98()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for LocalizationBundle()
{
  return self;
}

uint64_t sub_24F2A1DCC()
{
  uint64_t v0 = sub_24F2A9740();
  __swift_allocate_value_buffer(v0, qword_2699ECC40);
  __swift_project_value_buffer(v0, (uint64_t)qword_2699ECC40);
  return sub_24F2A9730();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

BOOL static RemoteBrowsingIdleMonitorLoadState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24F2A1ECC(char a1)
{
  if (a1) {
    return 0x657669746361;
  }
  else {
    return 1701602409;
  }
}

uint64_t sub_24F2A1EF8(uint64_t a1)
{
  unint64_t v2 = sub_24F2A2388();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A1F34(uint64_t a1)
{
  unint64_t v2 = sub_24F2A2388();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2A1F70()
{
  return sub_24F2A1ECC(*v0);
}

uint64_t sub_24F2A1F78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F2A2D24(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24F2A1FA0(uint64_t a1)
{
  unint64_t v2 = sub_24F2A2334();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A1FDC(uint64_t a1)
{
  unint64_t v2 = sub_24F2A2334();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2A2018(uint64_t a1)
{
  unint64_t v2 = sub_24F2A23DC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A2054(uint64_t a1)
{
  unint64_t v2 = sub_24F2A23DC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RemoteBrowsingIdleMonitorLoadState.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8BC8);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8BD0);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8BD8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A2334();
  sub_24F2A9B50();
  char v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24F2A2388();
    char v14 = v18;
    sub_24F2A9A90();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24F2A23DC();
    sub_24F2A9A90();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24F2A2334()
{
  unint64_t result = qword_2699E8BE0;
  if (!qword_2699E8BE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8BE0);
  }
  return result;
}

unint64_t sub_24F2A2388()
{
  unint64_t result = qword_2699E8BE8;
  if (!qword_2699E8BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8BE8);
  }
  return result;
}

unint64_t sub_24F2A23DC()
{
  unint64_t result = qword_2699E8BF0;
  if (!qword_2699E8BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8BF0);
  }
  return result;
}

uint64_t RemoteBrowsingIdleMonitorLoadState.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8BF8);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8C00);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  BOOL v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8C08);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A2334();
  char v11 = v32;
  sub_24F2A9B40();
  if (v11) {
    goto LABEL_6;
  }
  uint64_t v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  char v14 = v10;
  uint64_t v15 = sub_24F2A9A80();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24F2A99D0();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8990);
    *char v22 = &type metadata for RemoteBrowsingIdleMonitorLoadState;
    sub_24F2A9A20();
    sub_24F2A99C0();
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
    sub_24F2A2388();
    uint64_t v18 = v14;
    sub_24F2A9A10();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24F2A23DC();
    sub_24F2A9A10();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24F2A2888@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return RemoteBrowsingIdleMonitorLoadState.init(from:)(a1, a2);
}

uint64_t sub_24F2A28A0(void *a1)
{
  return RemoteBrowsingIdleMonitorLoadState.encode(to:)(a1);
}

uint64_t RemoteBrowsingIdleMonitorLoadState.hash(into:)()
{
  return sub_24F2A9B10();
}

uint64_t RemoteBrowsingIdleMonitorLoadState.hashValue.getter()
{
  return sub_24F2A9B30();
}

unint64_t sub_24F2A2930()
{
  unint64_t result = qword_2699E8C10;
  if (!qword_2699E8C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C10);
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorLoadState()
{
  return &type metadata for RemoteBrowsingIdleMonitorLoadState;
}

unsigned char *_s21FitnessRemoteBrowsing34RemoteBrowsingIdleMonitorLoadStateOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24F2A2A64);
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

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorLoadState.CodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorLoadState.CodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorLoadState.IdleCodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorLoadState.IdleCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteBrowsingIdleMonitorLoadState.ActiveCodingKeys()
{
  return &type metadata for RemoteBrowsingIdleMonitorLoadState.ActiveCodingKeys;
}

unint64_t sub_24F2A2AC0()
{
  unint64_t result = qword_2699E8C18;
  if (!qword_2699E8C18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C18);
  }
  return result;
}

unint64_t sub_24F2A2B18()
{
  unint64_t result = qword_2699E8C20;
  if (!qword_2699E8C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C20);
  }
  return result;
}

unint64_t sub_24F2A2B70()
{
  unint64_t result = qword_2699E8C28;
  if (!qword_2699E8C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C28);
  }
  return result;
}

unint64_t sub_24F2A2BC8()
{
  unint64_t result = qword_2699E8C30;
  if (!qword_2699E8C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C30);
  }
  return result;
}

unint64_t sub_24F2A2C20()
{
  unint64_t result = qword_2699E8C38;
  if (!qword_2699E8C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C38);
  }
  return result;
}

unint64_t sub_24F2A2C78()
{
  unint64_t result = qword_2699E8C40;
  if (!qword_2699E8C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C40);
  }
  return result;
}

unint64_t sub_24F2A2CD0()
{
  unint64_t result = qword_2699E8C48;
  if (!qword_2699E8C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C48);
  }
  return result;
}

uint64_t sub_24F2A2D24(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v3 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657669746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24F2A9AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t RemoteParticipant.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteParticipant.role.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t RemoteParticipant.deviceOwner.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  sub_24F2A2E78(v1, *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  return v1;
}

uint64_t sub_24F2A2E78(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t RemoteParticipant.idsIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteParticipant.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RemoteParticipant.discoveryInterface.getter()
{
  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t RemoteParticipant.deviceType.getter()
{
  return *(unsigned __int8 *)(v0 + 81);
}

__n128 RemoteParticipant.init(identifier:role:deviceOwner:discoveryInterface:idsIdentifier:name:deviceType:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __n128 a10, uint64_t a11, char a12)
{
  __n128 result = a10;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(unsigned char *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a8;
  *(__n128 *)(a9 + 56) = a10;
  *(void *)(a9 + 72) = a11;
  *(unsigned char *)(a9 + 80) = a7;
  *(unsigned char *)(a9 + 81) = a12;
  return result;
}

unint64_t sub_24F2A2F34(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 1701605234;
      break;
    case 2:
      unint64_t result = 0x774F656369766564;
      break;
    case 3:
      unint64_t result = 0x746E656449736469;
      break;
    case 4:
      unint64_t result = 1701667182;
      break;
    case 5:
      return result;
    case 6:
      unint64_t result = 0x7954656369766564;
      break;
    default:
      unint64_t result = 0x696669746E656469;
      break;
  }
  return result;
}

unint64_t sub_24F2A3030()
{
  return sub_24F2A2F34(*v0);
}

uint64_t sub_24F2A3038@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F2A481C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F2A3060(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_24F2A306C(uint64_t a1)
{
  unint64_t v2 = sub_24F2A33D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A30A8(uint64_t a1)
{
  unint64_t v2 = sub_24F2A33D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2A30E4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t RemoteParticipant.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8C50);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v28 = *(unsigned __int8 *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v22 = *(void *)(v1 + 32);
  uint64_t v23 = v7;
  int v21 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v19 = *(void *)(v1 + 48);
  uint64_t v20 = v8;
  uint64_t v9 = *(void *)(v1 + 64);
  uint64_t v17 = *(void *)(v1 + 72);
  uint64_t v18 = v9;
  LODWORD(v9) = *(unsigned __int8 *)(v1 + 80);
  int v15 = *(unsigned __int8 *)(v1 + 81);
  int v16 = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A33D4();
  sub_24F2A9B50();
  LOBYTE(v25) = 0;
  uint64_t v10 = v24;
  sub_24F2A9AC0();
  if (!v10)
  {
    char v11 = v21;
    uint64_t v13 = v22;
    uint64_t v12 = v23;
    LOBYTE(v25) = v28;
    char v29 = 1;
    sub_24F2A3428();
    sub_24F2A9AE0();
    uint64_t v25 = v12;
    uint64_t v26 = v13;
    char v27 = v11;
    char v29 = 2;
    sub_24F2A347C();
    sub_24F2A9AE0();
    LOBYTE(v25) = 3;
    sub_24F2A9AA0();
    LOBYTE(v25) = 4;
    sub_24F2A9AA0();
    LOBYTE(v25) = v16;
    char v29 = 5;
    sub_24F2A34D0();
    sub_24F2A9AE0();
    LOBYTE(v25) = v15;
    char v29 = 6;
    sub_24F2A3524();
    sub_24F2A9AB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24F2A33D4()
{
  unint64_t result = qword_2699E8C58;
  if (!qword_2699E8C58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C58);
  }
  return result;
}

unint64_t sub_24F2A3428()
{
  unint64_t result = qword_2699E8C60;
  if (!qword_2699E8C60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C60);
  }
  return result;
}

unint64_t sub_24F2A347C()
{
  unint64_t result = qword_2699E8C68;
  if (!qword_2699E8C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C68);
  }
  return result;
}

unint64_t sub_24F2A34D0()
{
  unint64_t result = qword_2699E8C70;
  if (!qword_2699E8C70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C70);
  }
  return result;
}

unint64_t sub_24F2A3524()
{
  unint64_t result = qword_2699E8C78;
  if (!qword_2699E8C78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C78);
  }
  return result;
}

uint64_t RemoteParticipant.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8C80);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A33D4();
  sub_24F2A9B40();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  LOBYTE(v32) = 0;
  uint64_t v9 = sub_24F2A9A50();
  uint64_t v11 = v10;
  char v36 = 1;
  sub_24F2A3A90();
  swift_bridgeObjectRetain();
  sub_24F2A9A70();
  int v35 = v32;
  char v36 = 2;
  sub_24F2A3AE4();
  sub_24F2A9A70();
  uint64_t v13 = v32;
  LOBYTE(v32) = 3;
  uint64_t v30 = v33;
  uint64_t v31 = v13;
  int v29 = v34;
  sub_24F2A2E78(v13, v33, v34);
  uint64_t v14 = sub_24F2A9A30();
  uint64_t v28 = v15;
  uint64_t v25 = v14;
  LOBYTE(v32) = 4;
  swift_bridgeObjectRetain();
  uint64_t v26 = 0;
  uint64_t v24 = sub_24F2A9A30();
  char v36 = 5;
  uint64_t v17 = v16;
  sub_24F2A3B38();
  uint64_t v27 = v17;
  swift_bridgeObjectRetain();
  sub_24F2A9A70();
  HIDWORD(v23) = v32;
  char v36 = 6;
  sub_24F2A3B8C();
  sub_24F2A9A40();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LODWORD(v26) = v32;
  swift_bridgeObjectRetain();
  uint64_t v19 = v30;
  uint64_t v18 = v31;
  unsigned __int8 v20 = v29;
  sub_24F2A2E78(v31, v30, v29);
  sub_24F2A3A78(v18, v19, v20);
  swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(unsigned char *)(a2 + 16) = v35;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v19;
  *(unsigned char *)(a2 + 40) = v20;
  uint64_t v21 = v27;
  uint64_t v22 = v28;
  *(void *)(a2 + 48) = v25;
  *(void *)(a2 + 56) = v22;
  *(void *)(a2 + 64) = v24;
  *(void *)(a2 + 72) = v21;
  *(unsigned char *)(a2 + 80) = BYTE4(v23);
  *(unsigned char *)(a2 + 81) = v26;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  sub_24F2A3A78(v18, v19, v20);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24F2A3A78(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_24F2A3A90()
{
  unint64_t result = qword_2699E8C88;
  if (!qword_2699E8C88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C88);
  }
  return result;
}

unint64_t sub_24F2A3AE4()
{
  unint64_t result = qword_2699E8C90;
  if (!qword_2699E8C90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C90);
  }
  return result;
}

unint64_t sub_24F2A3B38()
{
  unint64_t result = qword_2699E8C98;
  if (!qword_2699E8C98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8C98);
  }
  return result;
}

unint64_t sub_24F2A3B8C()
{
  unint64_t result = qword_2699E8CA0;
  if (!qword_2699E8CA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8CA0);
  }
  return result;
}

uint64_t sub_24F2A3BE0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return RemoteParticipant.init(from:)(a1, a2);
}

uint64_t sub_24F2A3BF8(void *a1)
{
  return RemoteParticipant.encode(to:)(a1);
}

uint64_t RemoteParticipant.hash(into:)()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  int v3 = *(unsigned __int8 *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 72);
  int v6 = *(unsigned __int8 *)(v0 + 81);
  swift_bridgeObjectRetain();
  sub_24F2A98D0();
  swift_bridgeObjectRelease();
  sub_24F2A9B10();
  if (v3)
  {
    if (v3 == 1)
    {
      sub_24F2A9B10();
      swift_bridgeObjectRetain();
      sub_24F2A98D0();
      sub_24F2A3A78(v2, v1, 1u);
      if (!v4)
      {
LABEL_9:
        sub_24F2A9B20();
        if (!v5) {
          goto LABEL_10;
        }
LABEL_7:
        sub_24F2A9B20();
        swift_bridgeObjectRetain();
        sub_24F2A98D0();
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    else
    {
      sub_24F2A9B10();
      if (!v4) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    sub_24F2A9B10();
    swift_bridgeObjectRetain();
    sub_24F2A98D0();
    sub_24F2A3A78(v2, v1, 0);
    if (!v4) {
      goto LABEL_9;
    }
  }
  sub_24F2A9B20();
  swift_bridgeObjectRetain();
  sub_24F2A98D0();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_7;
  }
LABEL_10:
  sub_24F2A9B20();
LABEL_11:
  sub_24F2A9B10();
  if (v6 == 4) {
    return sub_24F2A9B20();
  }
  sub_24F2A9B20();
  return sub_24F2A9B10();
}

uint64_t RemoteParticipant.hashValue.getter()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F2A3E68()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F2A3EE4()
{
  return sub_24F2A9B30();
}

uint64_t _s21FitnessRemoteBrowsing0B11ParticipantV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v29 = *(void *)(a1 + 64);
  uint64_t v33 = *(void *)(a1 + 72);
  int v27 = *(unsigned __int8 *)(a1 + 81);
  int v8 = *(unsigned __int8 *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 32);
  int v11 = *(unsigned __int8 *)(a2 + 40);
  uint64_t v13 = *(void *)(a2 + 48);
  uint64_t v12 = *(void *)(a2 + 56);
  uint64_t v28 = *(void *)(a2 + 64);
  uint64_t v32 = *(void *)(a2 + 72);
  int v30 = *(unsigned __int8 *)(a2 + 80);
  int v31 = *(unsigned __int8 *)(a1 + 80);
  int v26 = *(unsigned __int8 *)(a2 + 81);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    if (v2 != v8) {
      return 0;
    }
  }
  else
  {
    int v24 = *(unsigned __int8 *)(a2 + 40);
    uint64_t v25 = *(void *)(a1 + 24);
    uint64_t v14 = *(void *)(a2 + 56);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 48);
    char v17 = sub_24F2A9AF0();
    uint64_t result = 0;
    if ((v17 & 1) == 0) {
      return result;
    }
    uint64_t v6 = v16;
    uint64_t v7 = v15;
    uint64_t v12 = v14;
    uint64_t v3 = v25;
    int v11 = v24;
    if (v2 != v8) {
      return result;
    }
  }
  if (v5)
  {
    if (v5 != 1)
    {
      if (v3 | v4)
      {
        if (v3 ^ 1 | v4)
        {
          if (v11 != 2) {
            return 0;
          }
          uint64_t result = 0;
          if (v10 != 2) {
            return result;
          }
        }
        else
        {
          if (v11 != 2) {
            return 0;
          }
          uint64_t result = 0;
          if (v10 != 1) {
            return result;
          }
        }
        if (v9) {
          return result;
        }
      }
      else
      {
        uint64_t result = 0;
        if (v11 != 2 || v9 | v10) {
          return result;
        }
      }
      goto LABEL_27;
    }
    if (v11 != 1) {
      return 0;
    }
  }
  else if (v11)
  {
    return 0;
  }
  if (v3 == v10 && v4 == v9 || (v19 = v6, v20 = sub_24F2A9AF0(), v6 = v19, v21 = v20, uint64_t result = 0, (v21 & 1) != 0))
  {
LABEL_27:
    if (v7)
    {
      if (!v12) {
        return 0;
      }
      if (v6 != v13 || v7 != v12)
      {
        char v22 = sub_24F2A9AF0();
        uint64_t result = 0;
        if ((v22 & 1) == 0) {
          return result;
        }
      }
    }
    else if (v12)
    {
      return 0;
    }
    if (!v33)
    {
      uint64_t result = 0;
      if (v32) {
        return result;
      }
      goto LABEL_43;
    }
    if (v32)
    {
      if (v29 == v28 && v33 == v32)
      {
        if (v31 != v30) {
          return 0;
        }
LABEL_44:
        if (v27 == 4)
        {
          if (v26 != 4) {
            return 0;
          }
        }
        else if (v26 == 4 || v27 != v26)
        {
          return 0;
        }
        return 1;
      }
      char v23 = sub_24F2A9AF0();
      uint64_t result = 0;
      if ((v23 & 1) == 0) {
        return result;
      }
LABEL_43:
      if (v31 != v30) {
        return result;
      }
      goto LABEL_44;
    }
    return 0;
  }
  return result;
}

uint64_t sub_24F2A4208()
{
  return MEMORY[0x263F8D320];
}

unint64_t sub_24F2A4218()
{
  unint64_t result = qword_2699E8CA8;
  if (!qword_2699E8CA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8CA8);
  }
  return result;
}

uint64_t destroy for RemoteParticipant(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_24F2A3A78(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RemoteParticipant(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  unsigned __int8 v7 = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_24F2A2E78(v5, v6, v7);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RemoteParticipant(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  unsigned __int8 v6 = *(unsigned char *)(a2 + 40);
  sub_24F2A2E78(v4, v5, v6);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = v5;
  unsigned __int8 v9 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v6;
  sub_24F2A3A78(v7, v8, v9);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
  return a1;
}

__n128 __swift_memcpy82_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for RemoteParticipant(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  unsigned __int8 v8 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v5;
  sub_24F2A3A78(v6, v7, v8);
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteParticipant(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 82)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoteParticipant(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 80) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 82) = 1;
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
    *(unsigned char *)(result + 82) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipant()
{
  return &type metadata for RemoteParticipant;
}

uint64_t getEnumTagSinglePayload for RemoteParticipantRole(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RemoteParticipant.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x24F2A46DCLL);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipant.CodingKeys()
{
  return &type metadata for RemoteParticipant.CodingKeys;
}

unint64_t sub_24F2A4718()
{
  unint64_t result = qword_2699E8CB0;
  if (!qword_2699E8CB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8CB0);
  }
  return result;
}

unint64_t sub_24F2A4770()
{
  unint64_t result = qword_2699E8CB8;
  if (!qword_2699E8CB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8CB8);
  }
  return result;
}

unint64_t sub_24F2A47C8()
{
  unint64_t result = qword_2699E8CC0;
  if (!qword_2699E8CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8CC0);
  }
  return result;
}

uint64_t sub_24F2A481C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701605234 && a2 == 0xE400000000000000 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x774F656369766564 && a2 == 0xEB0000000072656ELL || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746E656449736469 && a2 == 0xED00007265696669 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024F2ACB10 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x7954656369766564 && a2 == 0xEA00000000006570)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v5 = sub_24F2A9AF0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_24F2A4AF4(char a1)
{
  return *(void *)&aUnknown_2[8 * a1];
}

uint64_t sub_24F2A4B14()
{
  return sub_24F2A4AF4(*v0);
}

uint64_t sub_24F2A4B1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F2A5B94(a1, a2);
  *a3 = result;
  return result;
}

void sub_24F2A4B44(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24F2A4B50(uint64_t a1)
{
  unint64_t v2 = sub_24F2A599C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A4B8C(uint64_t a1)
{
  unint64_t v2 = sub_24F2A599C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2A4BC8()
{
  return 1;
}

uint64_t sub_24F2A4BD4()
{
  return sub_24F2A9B10();
}

unint64_t sub_24F2A4C00()
{
  return 0xD000000000000011;
}

uint64_t sub_24F2A4C1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F2A5D64(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24F2A4C48(uint64_t a1)
{
  unint64_t v2 = sub_24F2A5A98();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A4C84(uint64_t a1)
{
  unint64_t v2 = sub_24F2A5A98();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2A4CC0(uint64_t a1)
{
  unint64_t v2 = sub_24F2A59F0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A4CFC(uint64_t a1)
{
  unint64_t v2 = sub_24F2A59F0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2A4D38(uint64_t a1)
{
  unint64_t v2 = sub_24F2A5AEC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A4D74(uint64_t a1)
{
  unint64_t v2 = sub_24F2A5AEC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2A4DB0()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F2A4DF4()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F2A4E34(uint64_t a1)
{
  unint64_t v2 = sub_24F2A5A44();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A4E70(uint64_t a1)
{
  unint64_t v2 = sub_24F2A5A44();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24F2A4EAC(uint64_t a1)
{
  unint64_t v2 = sub_24F2A5B40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A4EE8(uint64_t a1)
{
  unint64_t v2 = sub_24F2A5B40();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t RemoteParticipantDeviceOwner.encode(to:)(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v39 = a4;
  *(void *)&long long v40 = a2;
  *((void *)&v40 + 1) = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8CC8);
  uint64_t v34 = *(void *)(v5 - 8);
  uint64_t v35 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v33 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8CD0);
  uint64_t v37 = *(void *)(v7 - 8);
  uint64_t v38 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8CD8);
  uint64_t v36 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8CE0);
  uint64_t v31 = *(void *)(v13 - 8);
  uint64_t v32 = v13;
  MEMORY[0x270FA5388](v13);
  int v30 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8CE8);
  uint64_t v29 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  char v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8CF0);
  uint64_t v41 = *(void *)(v18 - 8);
  uint64_t v42 = v18;
  MEMORY[0x270FA5388](v18);
  char v20 = (char *)&v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A599C();
  sub_24F2A9B50();
  if (!(_BYTE)v39)
  {
    char v45 = 2;
    sub_24F2A5A98();
    uint64_t v21 = v42;
    sub_24F2A9A90();
    sub_24F2A9AC0();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v20, v21);
  }
  if (v39 == 1)
  {
    char v46 = 3;
    sub_24F2A5A44();
    uint64_t v21 = v42;
    sub_24F2A9A90();
    uint64_t v22 = v38;
    sub_24F2A9AC0();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v20, v21);
  }
  if (v40 == 0)
  {
    char v43 = 0;
    sub_24F2A5B40();
    uint64_t v28 = v42;
    sub_24F2A9A90();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v20, v28);
  }
  else
  {
    if ((unint64_t)v40 ^ 1 | *((void *)&v40 + 1))
    {
      char v47 = 4;
      sub_24F2A59F0();
      int v24 = v33;
      uint64_t v25 = v42;
      sub_24F2A9A90();
      uint64_t v27 = v34;
      uint64_t v26 = v35;
    }
    else
    {
      char v44 = 1;
      sub_24F2A5AEC();
      int v24 = v30;
      uint64_t v25 = v42;
      sub_24F2A9A90();
      uint64_t v27 = v31;
      uint64_t v26 = v32;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v20, v25);
  }
}

uint64_t RemoteParticipantDeviceOwner.init(from:)(void *a1)
{
  uint64_t result = sub_24F2A5DEC(a1);
  if (v1) {
    return v3;
  }
  return result;
}

uint64_t sub_24F2A54E0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_24F2A5DEC(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(unsigned char *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_24F2A5510(void *a1)
{
  return RemoteParticipantDeviceOwner.encode(to:)(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t RemoteParticipantDeviceOwner.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 > 1u) {
    return sub_24F2A9B10();
  }
  sub_24F2A9B10();
  return sub_24F2A98D0();
}

uint64_t RemoteParticipantDeviceOwner.hashValue.getter(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    sub_24F2A98D0();
  }
  return sub_24F2A9B30();
}

uint64_t sub_24F2A5694()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_24F2A9B00();
  sub_24F2A9B10();
  if (v1 <= 1) {
    sub_24F2A98D0();
  }
  return sub_24F2A9B30();
}

uint64_t sub_24F2A5748()
{
  if (*(unsigned char *)(v0 + 16) && *(unsigned char *)(v0 + 16) != 1) {
    return sub_24F2A9B10();
  }
  sub_24F2A9B10();
  return sub_24F2A98D0();
}

uint64_t sub_24F2A57F4()
{
  unsigned int v1 = *(unsigned __int8 *)(v0 + 16);
  sub_24F2A9B00();
  sub_24F2A9B10();
  if (v1 <= 1) {
    sub_24F2A98D0();
  }
  return sub_24F2A9B30();
}

uint64_t sub_24F2A58A4(uint64_t a1, uint64_t a2)
{
  return _s21FitnessRemoteBrowsing0B22ParticipantDeviceOwnerO2eeoiySbAC_ACtFZ_0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t _s21FitnessRemoteBrowsing0B22ParticipantDeviceOwnerO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3)
  {
    if (a3 == 1)
    {
      if (a6 == 1)
      {
        if (a1 == a4 && a2 == a5) {
          return 1;
        }
        return sub_24F2A9AF0();
      }
    }
    else if (a1 | a2)
    {
      if (a1 ^ 1 | a2)
      {
        if (a6 == 2 && a4 == 2 && !a5) {
          return 1;
        }
      }
      else if (a6 == 2 && a4 == 1 && !a5)
      {
        return 1;
      }
    }
    else if (a6 == 2 && !(a5 | a4))
    {
      return 1;
    }
  }
  else if (!a6)
  {
    if (a1 == a4 && a2 == a5) {
      return 1;
    }
    return sub_24F2A9AF0();
  }
  return 0;
}

unint64_t sub_24F2A599C()
{
  unint64_t result = qword_2699E8CF8;
  if (!qword_2699E8CF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8CF8);
  }
  return result;
}

unint64_t sub_24F2A59F0()
{
  unint64_t result = qword_2699E8D00;
  if (!qword_2699E8D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D00);
  }
  return result;
}

unint64_t sub_24F2A5A44()
{
  unint64_t result = qword_2699E8D08;
  if (!qword_2699E8D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D08);
  }
  return result;
}

unint64_t sub_24F2A5A98()
{
  unint64_t result = qword_2699E8D10;
  if (!qword_2699E8D10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D10);
  }
  return result;
}

unint64_t sub_24F2A5AEC()
{
  unint64_t result = qword_2699E8D18;
  if (!qword_2699E8D18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D18);
  }
  return result;
}

unint64_t sub_24F2A5B40()
{
  unint64_t result = qword_2699E8D20;
  if (!qword_2699E8D20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D20);
  }
  return result;
}

uint64_t sub_24F2A5B94(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 25965 && a2 == 0xE200000000000000 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x796C696D6166 && a2 == 0xE600000000000000 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x646572616873 && a2 == 0xE600000000000000 || (sub_24F2A9AF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7473657567 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_24F2A9AF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_24F2A5D64(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x800000024F2ACB30)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_24F2A9AF0();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_24F2A5DEC(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8DA8);
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v39 = v2;
  MEMORY[0x270FA5388](v2);
  char v44 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8DB0);
  uint64_t v41 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  char v43 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8DB8);
  uint64_t v40 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v42 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8DC0);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8DC8);
  uint64_t v33 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8DD0);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  char v45 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v16);
  sub_24F2A599C();
  uint64_t v17 = v46;
  sub_24F2A9B40();
  if (!v17)
  {
    uint64_t v31 = v9;
    uint64_t v32 = v11;
    uint64_t v19 = v42;
    uint64_t v18 = v43;
    char v20 = v44;
    uint64_t v46 = v13;
    uint64_t v21 = sub_24F2A9A80();
    if (*(void *)(v21 + 16) == 1)
    {
      switch(*(unsigned char *)(v21 + 32))
      {
        case 1:
          char v48 = 1;
          sub_24F2A5AEC();
          sub_24F2A9A10();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v36);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v12);
          uint64_t v13 = 1;
          break;
        case 2:
          char v49 = 2;
          sub_24F2A5A98();
          sub_24F2A9A10();
          uint64_t v26 = v34;
          uint64_t v13 = sub_24F2A9A50();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v19, v26);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v12);
          break;
        case 3:
          char v50 = 3;
          sub_24F2A5A44();
          uint64_t v27 = v18;
          sub_24F2A9A10();
          uint64_t v28 = v37;
          uint64_t v13 = sub_24F2A9A50();
          uint64_t v29 = v46;
          (*(void (**)(char *, uint64_t))(v41 + 8))(v27, v28);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v29 + 8))(v15, v12);
          break;
        case 4:
          char v51 = 4;
          sub_24F2A59F0();
          sub_24F2A9A10();
          (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v39);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v12);
          uint64_t v13 = 2;
          break;
        default:
          char v47 = 0;
          sub_24F2A5B40();
          uint64_t v22 = v32;
          sub_24F2A9A10();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v22, v31);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v12);
          uint64_t v13 = 0;
          break;
      }
    }
    else
    {
      uint64_t v23 = v12;
      uint64_t v24 = sub_24F2A99D0();
      swift_allocError();
      uint64_t v13 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8990);
      *(void *)uint64_t v13 = &type metadata for RemoteParticipantDeviceOwner;
      sub_24F2A9A20();
      sub_24F2A99C0();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v24 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v24);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v23);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  return v13;
}

unint64_t sub_24F2A6654()
{
  unint64_t result = qword_2699E8D28;
  if (!qword_2699E8D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D28);
  }
  return result;
}

uint64_t destroy for RemoteParticipantDeviceOwner(uint64_t a1)
{
  return sub_24F2A3A78(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s21FitnessRemoteBrowsing28RemoteParticipantDeviceOwnerOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24F2A2E78(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for RemoteParticipantDeviceOwner(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_24F2A2E78(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_24F2A3A78(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RemoteParticipantDeviceOwner(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_24F2A3A78(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteParticipantDeviceOwner(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoteParticipantDeviceOwner(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24F2A6848(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24F2A6860(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner()
{
  return &type metadata for RemoteParticipantDeviceOwner;
}

unsigned char *storeEnumTagSinglePayload for RemoteParticipantDeviceOwner.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x24F2A6954);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.CodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.CodingKeys;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.UnknownCodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.MeCodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.MeCodingKeys;
}

uint64_t sub_24F2A69B8()
{
  return 0;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.FamilyCodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.FamilyCodingKeys;
}

uint64_t getEnumTagSinglePayload for SubscriptionHandoffState.CodingKeys(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s21FitnessRemoteBrowsing28RemoteParticipantDeviceOwnerO16FamilyCodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24F2A6ABCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.SharedCodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.SharedCodingKeys;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceOwner.GuestCodingKeys()
{
  return &type metadata for RemoteParticipantDeviceOwner.GuestCodingKeys;
}

unint64_t sub_24F2A6B08()
{
  unint64_t result = qword_2699E8D30;
  if (!qword_2699E8D30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D30);
  }
  return result;
}

unint64_t sub_24F2A6B60()
{
  unint64_t result = qword_2699E8D38;
  if (!qword_2699E8D38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D38);
  }
  return result;
}

unint64_t sub_24F2A6BB8()
{
  unint64_t result = qword_2699E8D40;
  if (!qword_2699E8D40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D40);
  }
  return result;
}

unint64_t sub_24F2A6C10()
{
  unint64_t result = qword_2699E8D48;
  if (!qword_2699E8D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D48);
  }
  return result;
}

unint64_t sub_24F2A6C68()
{
  unint64_t result = qword_2699E8D50;
  if (!qword_2699E8D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D50);
  }
  return result;
}

unint64_t sub_24F2A6CC0()
{
  unint64_t result = qword_2699E8D58;
  if (!qword_2699E8D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D58);
  }
  return result;
}

unint64_t sub_24F2A6D18()
{
  unint64_t result = qword_2699E8D60;
  if (!qword_2699E8D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D60);
  }
  return result;
}

unint64_t sub_24F2A6D70()
{
  unint64_t result = qword_2699E8D68;
  if (!qword_2699E8D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D68);
  }
  return result;
}

unint64_t sub_24F2A6DC8()
{
  unint64_t result = qword_2699E8D70;
  if (!qword_2699E8D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D70);
  }
  return result;
}

unint64_t sub_24F2A6E20()
{
  unint64_t result = qword_2699E8D78;
  if (!qword_2699E8D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D78);
  }
  return result;
}

unint64_t sub_24F2A6E78()
{
  unint64_t result = qword_2699E8D80;
  if (!qword_2699E8D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D80);
  }
  return result;
}

unint64_t sub_24F2A6ED0()
{
  unint64_t result = qword_2699E8D88;
  if (!qword_2699E8D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D88);
  }
  return result;
}

unint64_t sub_24F2A6F28()
{
  unint64_t result = qword_2699E8D90;
  if (!qword_2699E8D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D90);
  }
  return result;
}

unint64_t sub_24F2A6F80()
{
  unint64_t result = qword_2699E8D98;
  if (!qword_2699E8D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8D98);
  }
  return result;
}

unint64_t sub_24F2A6FD8()
{
  unint64_t result = qword_2699E8DA0;
  if (!qword_2699E8DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8DA0);
  }
  return result;
}

uint64_t RemoteParticipantRole.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_24F2A7040@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s21FitnessRemoteBrowsing0B15ParticipantRoleO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_24F2A706C()
{
  return sub_24F2A9900();
}

uint64_t sub_24F2A70CC()
{
  return sub_24F2A98F0();
}

void *static RemoteParticipantRole.allCases.getter()
{
  return &unk_2700BB0F0;
}

void sub_24F2A7128(void *a1@<X8>)
{
  *a1 = &unk_2700BB0F0;
}

unint64_t _s21FitnessRemoteBrowsing0B15ParticipantRoleO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 7) {
    return 7;
  }
  return result;
}

unint64_t sub_24F2A714C()
{
  unint64_t result = qword_2699E8DD8;
  if (!qword_2699E8DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8DD8);
  }
  return result;
}

unint64_t sub_24F2A71A4()
{
  unint64_t result = qword_2699E8DE0;
  if (!qword_2699E8DE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699E8DE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8DE0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for RemoteParticipantRole(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x24F2A7314);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantRole()
{
  return &type metadata for RemoteParticipantRole;
}

unint64_t sub_24F2A734C()
{
  unint64_t result = qword_2699E8DF0;
  if (!qword_2699E8DF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8DF0);
  }
  return result;
}

uint64_t RemoteParticipantDeviceType.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

uint64_t sub_24F2A73B0@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s21FitnessRemoteBrowsing0B21ParticipantDeviceTypeO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_24F2A73DC(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t sub_24F2A73EC()
{
  return sub_24F2A9900();
}

uint64_t sub_24F2A744C()
{
  return sub_24F2A98F0();
}

uint64_t sub_24F2A749C()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F2A74E4()
{
  return sub_24F2A9B10();
}

uint64_t sub_24F2A7514()
{
  return sub_24F2A9B30();
}

uint64_t _s21FitnessRemoteBrowsing0B21ParticipantDeviceTypeO8rawValueACSgSi_tcfC_0(unint64_t a1)
{
  if (a1 >= 5) {
    return 4;
  }
  else {
    return (0x302010004uLL >> (8 * a1));
  }
}

unint64_t sub_24F2A7580()
{
  unint64_t result = qword_2699E8DF8;
  if (!qword_2699E8DF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8DF8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RemoteParticipantDeviceType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RemoteParticipantDeviceType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x24F2A7730);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteParticipantDeviceType()
{
  return &type metadata for RemoteParticipantDeviceType;
}

unint64_t sub_24F2A7768()
{
  unint64_t result = qword_2699E8E00;
  if (!qword_2699E8E00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8E00);
  }
  return result;
}

uint64_t SubscriptionHandoffView.init(store:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(void *)a3 = sub_24F2A7854;
  *(void *)(a3 + 8) = result;
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

uint64_t sub_24F2A781C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_24F2A7854()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t SubscriptionHandoffView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  char v5 = *((unsigned char *)v1 + 16);
  uint64_t v6 = sub_24F2A9790();
  sub_24F2A7A18((uint64_t)v16);
  *(_OWORD *)((char *)&v18[8] + 7) = v16[8];
  *(_OWORD *)((char *)&v18[9] + 7) = v16[9];
  *(_OWORD *)((char *)&v18[10] + 7) = v16[10];
  *(_OWORD *)((char *)&v18[4] + 7) = v16[4];
  *(_OWORD *)((char *)&v18[5] + 7) = v16[5];
  *(_OWORD *)((char *)&v18[6] + 7) = v16[6];
  *(_OWORD *)((char *)&v18[7] + 7) = v16[7];
  *(_OWORD *)((char *)v18 + 7) = v16[0];
  *(_OWORD *)((char *)&v18[1] + 7) = v16[1];
  *(_OWORD *)((char *)&v18[2] + 7) = v16[2];
  char v19 = 1;
  *(void *)((char *)&v18[11] + 7) = v17;
  *(_OWORD *)((char *)&v18[3] + 7) = v16[3];
  char v7 = sub_24F2A97B0();
  char v20 = 0;
  uint64_t v8 = swift_allocObject();
  long long v9 = v18[9];
  *(_OWORD *)(a1 + 145) = v18[8];
  *(_OWORD *)(a1 + 161) = v9;
  *(_OWORD *)(a1 + 177) = v18[10];
  *(_OWORD *)(a1 + 192) = *(_OWORD *)((char *)&v18[10] + 15);
  long long v10 = v18[5];
  *(_OWORD *)(a1 + 81) = v18[4];
  *(_OWORD *)(a1 + 97) = v10;
  long long v11 = v18[7];
  *(_OWORD *)(a1 + 113) = v18[6];
  *(_OWORD *)(a1 + 129) = v11;
  long long v12 = v18[1];
  *(_OWORD *)(a1 + 17) = v18[0];
  *(_OWORD *)(a1 + 33) = v12;
  long long v13 = v18[3];
  *(_OWORD *)(a1 + 49) = v18[2];
  *(void *)(v8 + 16) = v4;
  *(void *)(v8 + 24) = v3;
  *(unsigned char *)(v8 + 32) = v5;
  char v14 = v20;
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 65) = v13;
  *(unsigned char *)(a1 + 208) = v7;
  *(_OWORD *)(a1 + 216) = xmmword_24F2ABB80;
  *(_OWORD *)(a1 + 232) = xmmword_24F2ABB80;
  *(unsigned char *)(a1 + 248) = v14;
  *(void *)(a1 + 256) = sub_24F2A80B4;
  *(void *)(a1 + 264) = v8;
  *(void *)(a1 + 272) = 0;
  *(void *)(a1 + 280) = 0;
  return sub_24F2A80C0();
}

uint64_t sub_24F2A7A18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24F2A97A0();
  sub_24F2A7C50((uint64_t)&v41);
  uint64_t v4 = v41;
  uint64_t v3 = v42;
  char v5 = v43;
  uint64_t v6 = v44;
  uint64_t v7 = v45;
  uint64_t v9 = v46;
  uint64_t v8 = v47;
  char v10 = v48;
  uint64_t v11 = v49;
  uint64_t v12 = v50;
  uint64_t v31 = sub_24F2A9810();
  uint64_t KeyPath = swift_getKeyPath();
  char v64 = 0;
  char v63 = v5;
  char v62 = v10;
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v14 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v29 = sub_24F2A9820();
  sub_24F2A9830();
  sub_24F2A9760();
  uint64_t v15 = v57;
  char v16 = v58;
  uint64_t v17 = v59;
  char v18 = v60;
  char v26 = v64;
  char v27 = v63;
  char v28 = v62;
  *(void *)&long long v32 = v2;
  *((void *)&v32 + 1) = 0x4041800000000000;
  LOBYTE(v33) = v64;
  *((void *)&v33 + 1) = v4;
  *(void *)&long long v34 = v3;
  BYTE8(v34) = v63;
  *(void *)&long long v35 = v6;
  *((void *)&v35 + 1) = v7;
  *(void *)&long long v36 = v9;
  *((void *)&v36 + 1) = v8;
  LOBYTE(v37) = v62;
  *((void *)&v37 + 1) = v11;
  *(void *)uint64_t v38 = v12;
  *(void *)&v38[8] = v31;
  *(void *)&v38[16] = KeyPath;
  v38[24] = 1;
  long long v19 = v32;
  long long v20 = v33;
  long long v21 = v35;
  *(_OWORD *)(a1 + 32) = v34;
  *(_OWORD *)(a1 + 48) = v21;
  *(_OWORD *)a1 = v19;
  *(_OWORD *)(a1 + 16) = v20;
  long long v22 = v36;
  long long v23 = v37;
  long long v24 = *(_OWORD *)v38;
  *(_OWORD *)(a1 + 105) = *(_OWORD *)&v38[9];
  *(_OWORD *)(a1 + 80) = v23;
  *(_OWORD *)(a1 + 96) = v24;
  *(_OWORD *)(a1 + 64) = v22;
  char v40 = v16;
  char v39 = v18;
  *(void *)(a1 + 128) = v29;
  *(void *)(a1 + 136) = v15;
  *(unsigned char *)(a1 + 144) = v16;
  *(void *)(a1 + 152) = v17;
  *(unsigned char *)(a1 + 160) = v18;
  *(_OWORD *)(a1 + 168) = v61;
  sub_24F2A8460((uint64_t)&v32);
  uint64_t v41 = v2;
  uint64_t v42 = 0x4041800000000000;
  char v43 = v26;
  uint64_t v44 = v4;
  uint64_t v45 = v3;
  LOBYTE(v46) = v27;
  uint64_t v47 = v6;
  uint64_t v48 = v7;
  uint64_t v49 = v9;
  uint64_t v50 = v8;
  char v51 = v28;
  uint64_t v52 = v11;
  uint64_t v53 = v12;
  uint64_t v54 = v31;
  uint64_t v55 = KeyPath;
  char v56 = 1;
  return sub_24F2A8500((uint64_t)&v41);
}

id sub_24F2A7C50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24F2A9710();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_24F2A98A0();
  MEMORY[0x270FA5388](v3 - 8);
  sub_24F2A9890();
  type metadata accessor for LocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  char v5 = self;
  uint64_t v25 = ObjCClassFromMetadata;
  id v6 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24F2A9700();
  sub_24F2A98C0();
  uint64_t v7 = self;
  id result = objc_msgSend(v7, sel__preferredFontForTextStyle_addingSymbolicTraits_, *MEMORY[0x263F83610], 2);
  if (result)
  {
    sub_24F2A97C0();
    uint64_t v9 = sub_24F2A97D0();
    uint64_t v11 = v10;
    char v13 = v12;
    uint64_t v24 = v14;
    swift_bridgeObjectRelease();
    swift_release();
    sub_24F2A9890();
    id v15 = objc_msgSend(v5, sel_bundleForClass_, v25);
    sub_24F2A9700();
    sub_24F2A98C0();
    id result = objc_msgSend(v7, sel__preferredFontForTextStyle_variant_, *MEMORY[0x263F83628], 1024);
    if (result)
    {
      char v16 = v13 & 1;
      sub_24F2A97C0();
      uint64_t v17 = sub_24F2A97D0();
      uint64_t v19 = v18;
      char v21 = v20;
      uint64_t v23 = v22;
      swift_bridgeObjectRelease();
      swift_release();
      *(void *)a1 = v9;
      *(void *)(a1 + 8) = v11;
      *(unsigned char *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = v24;
      *(void *)(a1 + 32) = 0x3FE0000000000000;
      *(void *)(a1 + 40) = v17;
      *(void *)(a1 + 48) = v19;
      *(unsigned char *)(a1 + 56) = v21 & 1;
      *(void *)(a1 + 64) = v23;
      *(void *)(a1 + 72) = 0x3FD3333333333333;
      sub_24F2A84F0(v9, v11, v16);
      swift_bridgeObjectRetain();
      sub_24F2A84F0(v17, v19, v21 & 1);
      swift_bridgeObjectRetain();
      sub_24F2A8590(v17, v19, v21 & 1);
      swift_bridgeObjectRelease();
      sub_24F2A8590(v9, v11, v16);
      return (id)swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24F2A7FAC()
{
  return swift_release();
}

uint64_t sub_24F2A8070()
{
  sub_24F2A80AC();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_24F2A80AC()
{
  return swift_release();
}

uint64_t sub_24F2A80B4()
{
  return sub_24F2A7FAC();
}

uint64_t sub_24F2A80C0()
{
  return swift_retain();
}

uint64_t sub_24F2A80C8(uint64_t a1)
{
  return MEMORY[0x270FA03F0](a1, &opaque type descriptor for <<opaque return type of SubscriptionHandoffView.body>>, 1);
}

uint64_t sub_24F2A80EC()
{
  return sub_24F2A9800();
}

uint64_t destroy for SubscriptionHandoffView()
{
  return sub_24F2A80AC();
}

uint64_t _s21FitnessRemoteBrowsing23SubscriptionHandoffViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24F2A80C0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SubscriptionHandoffView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_24F2A80C0();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_24F2A80AC();
  return a1;
}

uint64_t assignWithTake for SubscriptionHandoffView(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_24F2A80AC();
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionHandoffView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SubscriptionHandoffView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)id result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffView()
{
  return &type metadata for SubscriptionHandoffView;
}

unint64_t sub_24F2A82AC()
{
  unint64_t result = qword_2699E8E08;
  if (!qword_2699E8E08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699E8E10);
    sub_24F2A8328();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8E08);
  }
  return result;
}

unint64_t sub_24F2A8328()
{
  unint64_t result = qword_2699E8E18;
  if (!qword_2699E8E18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699E8E20);
    sub_24F2A83C8(&qword_2699E8E28, &qword_2699E8E30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8E18);
  }
  return result;
}

uint64_t sub_24F2A83C8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24F2A840C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24F2A9770();
  *a1 = result;
  return result;
}

uint64_t sub_24F2A8438()
{
  return sub_24F2A9780();
}

uint64_t sub_24F2A8460(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  char v4 = *(unsigned char *)(a1 + 80);
  sub_24F2A84F0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_24F2A84F0(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_24F2A84F0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24F2A8500(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  char v4 = *(unsigned char *)(a1 + 80);
  sub_24F2A8590(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_24F2A8590(v2, v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24F2A8590(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t SubscriptionHandoffState.init(locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24F2A9710();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  return v5(a2, a1, v4);
}

uint64_t sub_24F2A8610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24F2A9638(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24F2A863C(uint64_t a1)
{
  unint64_t v2 = sub_24F2A8828();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24F2A8678(uint64_t a1)
{
  unint64_t v2 = sub_24F2A8828();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SubscriptionHandoffState.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8E48);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A8828();
  sub_24F2A9B50();
  sub_24F2A9710();
  sub_24F2A9020(&qword_2699E8E58, MEMORY[0x263F07690]);
  sub_24F2A9AE0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_24F2A8828()
{
  unint64_t result = qword_2699E8E50;
  if (!qword_2699E8E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8E50);
  }
  return result;
}

uint64_t SubscriptionHandoffState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v4 = sub_24F2A9710();
  uint64_t v14 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v17 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8E60);
  uint64_t v16 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SubscriptionHandoffState();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A8828();
  sub_24F2A9B40();
  if (!v2)
  {
    sub_24F2A9020(&qword_2699E8E68, MEMORY[0x263F07690]);
    sub_24F2A9A70();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v6);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v17, v4);
    sub_24F2A8B48((uint64_t)v11, v15);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t type metadata accessor for SubscriptionHandoffState()
{
  uint64_t result = qword_2699E8E78;
  if (!qword_2699E8E78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24F2A8B48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SubscriptionHandoffState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24F2A8BAC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SubscriptionHandoffState.init(from:)(a1, a2);
}

uint64_t sub_24F2A8BC4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699E8E48);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24F2A8828();
  sub_24F2A9B50();
  sub_24F2A9710();
  sub_24F2A9020(&qword_2699E8E58, MEMORY[0x263F07690]);
  sub_24F2A9AE0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t SubscriptionHandoffState.hash(into:)()
{
  sub_24F2A9710();
  sub_24F2A9020(&qword_2699E8E70, MEMORY[0x263F07690]);
  return sub_24F2A9880();
}

uint64_t SubscriptionHandoffState.hashValue.getter()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F2A8E48()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F2A8ED0()
{
  sub_24F2A9710();
  sub_24F2A9020(&qword_2699E8E70, MEMORY[0x263F07690]);
  return sub_24F2A9880();
}

uint64_t sub_24F2A8F54()
{
  return sub_24F2A9B30();
}

uint64_t sub_24F2A8FD8()
{
  return sub_24F2A9020((unint64_t *)&qword_2699E8AE8, (void (*)(uint64_t))type metadata accessor for SubscriptionHandoffState);
}

uint64_t sub_24F2A9020(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F2A9710();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t destroy for SubscriptionHandoffState(uint64_t a1)
{
  uint64_t v2 = sub_24F2A9710();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t initializeWithCopy for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F2A9710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F2A9710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F2A9710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SubscriptionHandoffState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F2A9710();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionHandoffState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24F2A92E0);
}

uint64_t sub_24F2A92E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F2A9710();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SubscriptionHandoffState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24F2A9360);
}

uint64_t sub_24F2A9360(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24F2A9710();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_24F2A93D0()
{
  uint64_t result = sub_24F2A9710();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for SubscriptionHandoffState.CodingKeys(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x24F2A94F8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionHandoffState.CodingKeys()
{
  return &type metadata for SubscriptionHandoffState.CodingKeys;
}

unint64_t sub_24F2A9534()
{
  unint64_t result = qword_2699E8E88;
  if (!qword_2699E8E88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8E88);
  }
  return result;
}

unint64_t sub_24F2A958C()
{
  unint64_t result = qword_2699E8E90;
  if (!qword_2699E8E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8E90);
  }
  return result;
}

unint64_t sub_24F2A95E4()
{
  unint64_t result = qword_2699E8E98;
  if (!qword_2699E8E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699E8E98);
  }
  return result;
}

uint64_t sub_24F2A9638(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24F2A9AF0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24F2A96B8()
{
  return 0x656C61636F6CLL;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_24F2A9700()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_24F2A9710()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24F2A9720()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24F2A9730()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24F2A9740()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24F2A9750()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24F2A9760()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24F2A9770()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_24F2A9780()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_24F2A9790()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24F2A97A0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24F2A97B0()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24F2A97C0()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_24F2A97D0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24F2A97E0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24F2A97F0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24F2A9800()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24F2A9810()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24F2A9820()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_24F2A9830()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24F2A9850()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24F2A9860()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24F2A9870()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24F2A9880()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24F2A9890()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24F2A98A0()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24F2A98B0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24F2A98C0()
{
  return MEMORY[0x270F2CE98]();
}

uint64_t sub_24F2A98D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24F2A98E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24F2A98F0()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_24F2A9900()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_24F2A9910()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24F2A9930()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24F2A9940()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24F2A9950()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24F2A9960()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24F2A9970()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24F2A9980()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24F2A9990()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24F2A99A0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24F2A99B0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24F2A99C0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24F2A99D0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24F2A99E0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24F2A99F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24F2A9A00()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24F2A9A10()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24F2A9A20()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24F2A9A30()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24F2A9A40()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24F2A9A50()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24F2A9A60()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24F2A9A70()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24F2A9A80()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24F2A9A90()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24F2A9AA0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24F2A9AB0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24F2A9AC0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24F2A9AD0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24F2A9AE0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24F2A9AF0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24F2A9B00()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24F2A9B10()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24F2A9B20()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24F2A9B30()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24F2A9B40()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24F2A9B50()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}