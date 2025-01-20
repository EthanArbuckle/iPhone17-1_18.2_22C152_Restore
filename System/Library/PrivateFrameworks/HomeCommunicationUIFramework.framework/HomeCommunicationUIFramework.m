uint64_t initializeBufferWithCopyOfBuffer for CarPlayDisambiguationListItem(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  v5 = v3;
  return a1;
}

void destroy for CarPlayDisambiguationListItem(id *a1)
{
}

uint64_t assignWithCopy for CarPlayDisambiguationListItem(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CarPlayDisambiguationListItem(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarPlayDisambiguationListItem(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CarPlayDisambiguationListItem(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarPlayDisambiguationListItem()
{
  return &type metadata for CarPlayDisambiguationListItem;
}

uint64_t sub_2519D7DBC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2519D7DD8()
{
  qword_269B994E8 = 0x4000000000000000;
}

uint64_t sub_2519D7DE8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, int a3@<W3>, uint64_t a4@<X8>)
{
  int v21 = a3;
  uint64_t v22 = a1;
  uint64_t v23 = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99508);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99510);
  MEMORY[0x270FA5388]();
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99518);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  v14 = &v20[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    id v15 = a2;
    sub_2519EE990();

    if (sub_2519EEA30() & 1) == 0 || (v21)
    {
      v18 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v6 + 16);
      v18(v8, v22, v5);
      v18(v10, (uint64_t)v8, v5);
      swift_storeEnumTagMultiPayload();
      unint64_t v19 = sub_2519D823C();
      uint64_t v24 = v5;
      unint64_t v25 = v19;
      swift_getOpaqueTypeConformance2();
      sub_2519EE700();
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      if (qword_269B994E0 != -1) {
        swift_once();
      }
      unint64_t v16 = sub_2519D823C();
      sub_2519EE790();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 16))(v10, v14, v11);
      swift_storeEnumTagMultiPayload();
      uint64_t v24 = v5;
      unint64_t v25 = v16;
      swift_getOpaqueTypeConformance2();
      sub_2519EE700();
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
  else
  {
    sub_2519EE9A0();
    sub_2519D81E4();
    uint64_t result = sub_2519EE6B0();
    __break(1u);
  }
  return result;
}

uint64_t sub_2519D8178()
{
  return sub_2519EE680();
}

uint64_t sub_2519D8194@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2519D7DE8(a1, *(void **)v2, *(unsigned __int8 *)(v2 + 16), a2);
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

unint64_t sub_2519D81E4()
{
  unint64_t result = qword_269B99520;
  if (!qword_269B99520)
  {
    sub_2519EE9A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99520);
  }
  return result;
}

unint64_t sub_2519D823C()
{
  unint64_t result = qword_269B99528;
  if (!qword_269B99528)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99508);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99528);
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

unint64_t sub_2519D82E4()
{
  unint64_t result = qword_269B99530;
  if (!qword_269B99530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99538);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99508);
    sub_2519D823C();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99530);
  }
  return result;
}

uint64_t CarPlayIntercomControlModel.playStopText.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519EE5E0();
  return v1;
}

uint64_t sub_2519D83D0()
{
  return sub_2519EE5F0();
}

uint64_t CarPlayIntercomControlModel.playStopText.setter()
{
  return sub_2519EE5F0();
}

uint64_t (*CarPlayIntercomControlModel.playStopText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  v2[4] = sub_2519EE5D0();
  return sub_2519D84C0;
}

uint64_t CarPlayIntercomControlModel.replyText.getter()
{
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519EE5E0();
  return v1;
}

uint64_t type metadata accessor for CarPlayIntercomControlModel()
{
  uint64_t result = qword_269B99598;
  if (!qword_269B99598) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2519D855C@<X0>(void *a1@<X8>)
{
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t result = sub_2519EE5E0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2519D85BC()
{
  return sub_2519EE5F0();
}

uint64_t CarPlayIntercomControlModel.replyText.setter()
{
  return sub_2519EE5F0();
}

uint64_t (*CarPlayIntercomControlModel.replyText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  v2[4] = sub_2519EE5D0();
  return sub_2519D84C0;
}

uint64_t CarPlayIntercomControlModel.isPlaying.getter()
{
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  sub_2519EE5E0();
  return v1;
}

uint64_t sub_2519D873C@<X0>(unsigned char *a1@<X8>)
{
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  uint64_t result = sub_2519EE5E0();
  *a1 = v3;
  return result;
}

uint64_t sub_2519D879C()
{
  return sub_2519EE5F0();
}

uint64_t CarPlayIntercomControlModel.isPlaying.setter()
{
  return sub_2519EE5F0();
}

uint64_t (*CarPlayIntercomControlModel.isPlaying.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  v2[4] = sub_2519EE5D0();
  return sub_2519D84C0;
}

void sub_2519D88C0(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t static CarPlayIntercomControlModel.responseViewId.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t CarPlayIntercomControlModel.init(playStopText:replyText:isPlaying:)()
{
  return sub_2519EE5C0();
}

uint64_t sub_2519D89C4(char a1)
{
  return *(void *)&aPlaystopreplyt[8 * a1];
}

BOOL sub_2519D89E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2519D89F8()
{
  return sub_2519EEBE0();
}

uint64_t sub_2519D8A40()
{
  return sub_2519EEBD0();
}

uint64_t sub_2519D8A6C()
{
  return sub_2519EEBE0();
}

uint64_t sub_2519D8AB0()
{
  return sub_2519D89C4(*v0);
}

uint64_t sub_2519D8AB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2519DA1F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2519D8AE0()
{
  return 0;
}

void sub_2519D8AEC(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2519D8AF8(uint64_t a1)
{
  unint64_t v2 = sub_2519D8DD4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519D8B34(uint64_t a1)
{
  unint64_t v2 = sub_2519D8DD4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarPlayIntercomControlModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99550);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519D8DD4();
  sub_2519EEC00();
  char v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519D93B8(&qword_269B99560);
  sub_2519EEBA0();
  if (!v1)
  {
    type metadata accessor for CarPlayIntercomControlModel();
    char v10 = 1;
    sub_2519EEBA0();
    char v9 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    sub_2519D8E28(&qword_269B99568);
    sub_2519EEBA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2519D8DD4()
{
  unint64_t result = qword_269B99558;
  if (!qword_269B99558)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99558);
  }
  return result;
}

uint64_t sub_2519D8E28(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99548);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t CarPlayIntercomControlModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  uint64_t v25 = *(void *)(v28 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v27 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v29 = *(void *)(v5 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v31 = (char *)&v22 - v9;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99570);
  uint64_t v30 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  char v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for CarPlayIntercomControlModel();
  MEMORY[0x270FA5388](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  v33 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  sub_2519D8DD4();
  sub_2519EEBF0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  }
  uint64_t v23 = v12;
  uint64_t v24 = v14;
  char v36 = 0;
  sub_2519D93B8(&qword_269B99578);
  unint64_t v16 = v31;
  sub_2519EEB60();
  v31 = *(char **)(v29 + 32);
  ((void (*)(char *, char *, uint64_t))v31)(v24, v16, v5);
  char v35 = 1;
  v17 = v8;
  sub_2519EEB60();
  uint64_t v18 = (uint64_t)v24;
  ((void (*)(char *, char *, uint64_t))v31)(&v24[*(int *)(v23 + 20)], v17, v5);
  char v34 = 2;
  sub_2519D8E28(&qword_269B99580);
  v20 = v27;
  uint64_t v19 = v28;
  sub_2519EEB60();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v32);
  (*(void (**)(uint64_t, char *, uint64_t))(v25 + 32))(v18 + *(int *)(v23 + 24), v20, v19);
  sub_2519D9420(v18, v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  return sub_2519D9484(v18);
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

uint64_t sub_2519D93B8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99540);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519D9420(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarPlayIntercomControlModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2519D9484(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CarPlayIntercomControlModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2519D94E0()
{
  return sub_2519D9548(&qword_269B99588);
}

uint64_t sub_2519D9514()
{
  return sub_2519D9548(&qword_269B99590);
}

uint64_t sub_2519D9548(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CarPlayIntercomControlModel();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519D958C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CarPlayIntercomControlModel.init(from:)(a1, a2);
}

uint64_t sub_2519D95A4(void *a1)
{
  return CarPlayIntercomControlModel.encode(to:)(a1);
}

uint64_t sub_2519D95BC@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t result = sub_2519EE5E0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for CarPlayIntercomControlModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v9;
    char v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t destroy for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

uint64_t initializeWithCopy for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t assignWithCopy for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  return a1;
}

uint64_t initializeWithTake for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t assignWithTake for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519D9BE0);
}

uint64_t sub_2519D9BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 24);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for CarPlayIntercomControlModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519D9CF4);
}

uint64_t sub_2519D9CF4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 24);
    return v13(v15, a2, a2, v14);
  }
}

void sub_2519D9E00()
{
  sub_2519D9EE8(319, (unint64_t *)&qword_269B995A8);
  if (v0 <= 0x3F)
  {
    sub_2519D9EE8(319, &qword_269B995B0);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_2519D9EE8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2519EE600();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CarPlayIntercomControlModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CarPlayIntercomControlModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2519DA09CLL);
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

uint64_t sub_2519DA0C4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2519DA0D0(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CarPlayIntercomControlModel.CodingKeys()
{
  return &type metadata for CarPlayIntercomControlModel.CodingKeys;
}

unint64_t sub_2519DA0EC()
{
  unint64_t result = qword_269B995B8;
  if (!qword_269B995B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B995B8);
  }
  return result;
}

unint64_t sub_2519DA144()
{
  unint64_t result = qword_269B995C0;
  if (!qword_269B995C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B995C0);
  }
  return result;
}

unint64_t sub_2519DA19C()
{
  unint64_t result = qword_269B995C8;
  if (!qword_269B995C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B995C8);
  }
  return result;
}

uint64_t sub_2519DA1F0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x706F745379616C70 && a2 == 0xEC00000074786554;
  if (v3 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x786554796C706572 && a2 == 0xE900000000000074 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6979616C507369 && a2 == 0xE900000000000067)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2519EEBB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t CarPlayIntercomControlView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for CarPlayIntercomControlView() + 20));
  sub_2519EE9A0();
  sub_2519DD16C((unint64_t *)&qword_269B99520, MEMORY[0x263F77980]);
  uint64_t *v4 = sub_2519EE6C0();
  v4[1] = v5;
  sub_2519EE890();
  return sub_2519DAC1C(a1, a2, (uint64_t (*)(void))type metadata accessor for CarPlayIntercomControlModel);
}

uint64_t type metadata accessor for CarPlayIntercomControlView()
{
  uint64_t result = qword_269B995E0;
  if (!qword_269B995E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CarPlayIntercomControlView.body.getter()
{
  uint64_t v1 = type metadata accessor for CarPlayIntercomControlView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  sub_2519DABB4(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_2519DAC1C((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(void))type metadata accessor for CarPlayIntercomControlView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B995D0);
  sub_2519DD0BC(&qword_269B995D8, &qword_269B995D0);
  return sub_2519EE8C0();
}

uint64_t sub_2519DA5B8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v43 = a1;
  v50 = a2;
  uint64_t v42 = sub_2519EE940();
  uint64_t v44 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v3 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99600);
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99608);
  uint64_t v48 = *(void *)(v7 - 8);
  uint64_t v49 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v47 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v52 = (char *)&v39 - v10;
  uint64_t v11 = sub_2519EE8E0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99610);
  uint64_t v15 = *(void *)(v51 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v51);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v20 = (char *)&v39 - v19;
  if (qword_269B994F0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  sub_2519EE8F0();
  sub_2519DD16C(&qword_269B99618, MEMORY[0x263F776B8]);
  int v21 = v18;
  sub_2519EE7D0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v40 = v20;
  uint64_t v41 = v15;
  uint64_t v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v20, v18, v51);
  MEMORY[0x270FA5388](v22);
  *(&v39 - 2) = v43;
  sub_2519EE930();
  uint64_t v23 = sub_2519DD16C(&qword_269B99620, MEMORY[0x263F77750]);
  uint64_t v24 = v42;
  sub_2519EE7D0();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v3, v24);
  uint64_t v53 = v24;
  uint64_t v54 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v25 = v46;
  uint64_t v26 = v47;
  sub_2519EE780();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v6, v25);
  uint64_t v27 = v48;
  uint64_t v28 = v49;
  uint64_t v29 = v52;
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v52, v26, v49);
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v31 = v20;
  uint64_t v32 = v51;
  v30(v21, v31, v51);
  v33 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v33(v26, v29, v28);
  char v34 = v50;
  v30(v50, v21, v32);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99628);
  v33(&v34[*(int *)(v35 + 48)], v26, v28);
  char v36 = *(void (**)(char *, uint64_t))(v27 + 8);
  v36(v52, v28);
  v37 = *(void (**)(char *, uint64_t))(v41 + 8);
  v37(v40, v32);
  v36(v26, v28);
  return ((uint64_t (*)(char *, uint64_t))v37)(v21, v32);
}

uint64_t sub_2519DABB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarPlayIntercomControlView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2519DAC1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2519DAC88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2519DACA4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CarPlayIntercomControlView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99630);
  uint64_t v27 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v26 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v25 = (char *)&v24 - v9;
  sub_2519DABB4(a1, (uint64_t)v5);
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v24 = v10 + v4;
  uint64_t v11 = swift_allocObject();
  sub_2519DAC1C((uint64_t)v5, v11 + v10, (uint64_t (*)(void))type metadata accessor for CarPlayIntercomControlView);
  uint64_t v29 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99638);
  sub_2519DD0BC(&qword_269B99640, &qword_269B99638);
  sub_2519EE820();
  sub_2519DABB4(a1, (uint64_t)v5);
  uint64_t v12 = swift_allocObject();
  sub_2519DAC1C((uint64_t)v5, v12 + v10, (uint64_t (*)(void))type metadata accessor for CarPlayIntercomControlView);
  uint64_t v28 = a1;
  uint64_t v13 = v26;
  sub_2519EE820();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99648);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2519EF2E0;
  *(void *)(v14 + 56) = v6;
  uint64_t v15 = sub_2519DD0BC(&qword_269B99650, &qword_269B99630);
  *(void *)(v14 + 64) = v15;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v14 + 32));
  uint64_t v17 = v27;
  uint64_t v18 = *(void (**)(uint64_t *, char *, uint64_t))(v27 + 16);
  uint64_t v19 = v25;
  v18(boxed_opaque_existential_1, v25, v6);
  *(void *)(v14 + 96) = v6;
  *(void *)(v14 + 104) = v15;
  v20 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v14 + 72));
  v18(v20, v13, v6);
  uint64_t v21 = MEMORY[0x2533A8C80](v14);
  swift_bridgeObjectRelease();
  uint64_t v22 = *(void (**)(char *, uint64_t))(v17 + 8);
  v22(v13, v6);
  v22(v19, v6);
  return v21;
}

uint64_t sub_2519DB050()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99670);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v24 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99678);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99680);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2519EE520();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99688);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2519EF2F0;
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  sub_2519EE5E0();
  sub_2519DB50C(MEMORY[0x263F8EE78]);
  uint64_t v13 = sub_2519EE590();
  uint64_t v14 = MEMORY[0x263F771C8];
  *(void *)(v12 + 56) = v13;
  *(void *)(v12 + 64) = v14;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v12 + 32));
  sub_2519EE580();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2519EE530();
  if (qword_269B994F8 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_2519EE640();
  __swift_project_value_buffer(v15, (uint64_t)qword_269B99AA0);
  uint64_t v16 = sub_2519EE620();
  os_log_type_t v17 = sub_2519EEA20();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_2519D6000, v16, v17, "#CarPlayIntercomControlView start/stop button tapped, performing direct action.", v18, 2u);
    MEMORY[0x2533A9370](v18, -1, -1);
  }

  type metadata accessor for CarPlayIntercomControlView();
  sub_2519EE880();
  uint64_t v19 = sub_2519EE980();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v7, 1, v19) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return sub_2519DD250((uint64_t)v7, &qword_269B99680);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v4, v11, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v8);
    uint64_t v22 = sub_2519EE8D0();
    uint64_t v23 = (uint64_t)v24;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v24, 1, 1, v22);
    sub_2519EE970();
    sub_2519DD250(v23, &qword_269B99670);
    sub_2519DD250((uint64_t)v4, &qword_269B99678);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v7, v19);
  }
}

unint64_t sub_2519DB50C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99690);
  uint64_t v2 = sub_2519EEB10();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2519DD2F0(v6, (uint64_t)v15);
    unint64_t result = sub_2519DD2AC((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_2519DD358(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2519DB63C()
{
  return sub_2519EE810();
}

uint64_t sub_2519DB744()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519EE5E0();
  sub_2519DD1B4();
  uint64_t v0 = sub_2519EE750();
  uint64_t v2 = v1;
  char v4 = v3 & 1;
  sub_2519EE7D0();
  sub_2519DD208(v0, v2, v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2519DB808@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2519EE5B0();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_2519EE860();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  sub_2519EE5E0();
  sub_2519EE5A0();
  swift_bridgeObjectRelease();
  sub_2519EE870();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v3);
}

uint64_t sub_2519DB99C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99670);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99678);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99680);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2519EE520();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99688);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2519EF2F0;
  sub_2519DB50C(MEMORY[0x263F8EE78]);
  uint64_t v14 = sub_2519EE590();
  uint64_t v15 = MEMORY[0x263F771C8];
  *(void *)(v13 + 56) = v14;
  *(void *)(v13 + 64) = v15;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v13 + 32));
  sub_2519EE580();
  swift_bridgeObjectRelease();
  sub_2519EE530();
  if (qword_269B994F8 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_2519EE640();
  __swift_project_value_buffer(v16, (uint64_t)qword_269B99AA0);
  long long v17 = sub_2519EE620();
  os_log_type_t v18 = sub_2519EEA20();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_2519D6000, v17, v18, "#CarPlayIntercomControlView reply button tapped, performing direct action.", v19, 2u);
    MEMORY[0x2533A9370](v19, -1, -1);
  }

  type metadata accessor for CarPlayIntercomControlView();
  sub_2519EE880();
  uint64_t v20 = sub_2519EE980();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v8, 1, v20) == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return sub_2519DD250((uint64_t)v8, &qword_269B99680);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v12, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
    uint64_t v23 = sub_2519EE8D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v2, 1, 1, v23);
    sub_2519EE970();
    sub_2519DD250((uint64_t)v2, &qword_269B99670);
    sub_2519DD250((uint64_t)v5, &qword_269B99678);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v8, v20);
  }
}

uint64_t sub_2519DBE00()
{
  return sub_2519EE810();
}

uint64_t sub_2519DBF04()
{
  type metadata accessor for CarPlayIntercomControlModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519EE5E0();
  sub_2519DD1B4();
  uint64_t v0 = sub_2519EE750();
  uint64_t v2 = v1;
  char v4 = v3 & 1;
  sub_2519EE7D0();
  sub_2519DD208(v0, v2, v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2519DBFD8()
{
  uint64_t v0 = sub_2519EE5B0();
  MEMORY[0x270FA5388](v0 - 8);
  sub_2519EE5A0();
  return sub_2519EE870();
}

uint64_t sub_2519DC078()
{
  return sub_2519EE7C0();
}

uint64_t sub_2519DC094(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  sub_2519DABB4(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_2519DAC1C((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(void))type metadata accessor for CarPlayIntercomControlView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B995D0);
  sub_2519DD0BC(&qword_269B995D8, &qword_269B995D0);
  return sub_2519EE8C0();
}

uint64_t *initializeBufferWithCopyOfBuffer for CarPlayIntercomControlView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = type metadata accessor for CarPlayIntercomControlModel();
    v8((uint64_t *)((char *)a1 + *(int *)(v9 + 20)), (uint64_t *)((char *)a2 + *(int *)(v9 + 20)), v7);
    uint64_t v10 = *(int *)(v9 + 24);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    uint64_t v14 = *(int *)(a3 + 20);
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (uint64_t *)((char *)a1 + v14);
    long long v17 = (char *)a2 + v14;
    uint64_t v19 = *(void **)v17;
    uint64_t v18 = *((void *)v17 + 1);
    *uint64_t v16 = v19;
    v16[1] = v18;
    uint64_t v20 = (char *)a1 + v15;
    uint64_t v21 = (char *)a2 + v15;
    uint64_t v22 = sub_2519EE8A0();
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 16);
    id v24 = v19;
    v23(v20, v21, v22);
  }
  return a1;
}

uint64_t destroy for CarPlayIntercomControlView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = type metadata accessor for CarPlayIntercomControlModel();
  v5(a1 + *(int *)(v6 + 20), v4);
  uint64_t v7 = a1 + *(int *)(v6 + 24);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  uint64_t v9 = a1 + *(int *)(a2 + 24);
  uint64_t v10 = sub_2519EE8A0();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);

  return v11(v9, v10);
}

uint64_t initializeWithCopy for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for CarPlayIntercomControlModel();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  uint64_t v9 = *(int *)(v8 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (void *)(a1 + v13);
  uint64_t v16 = a2 + v13;
  uint64_t v18 = *(void **)v16;
  uint64_t v17 = *(void *)(v16 + 8);
  *uint64_t v15 = v18;
  v15[1] = v17;
  uint64_t v19 = a1 + v14;
  uint64_t v20 = a2 + v14;
  uint64_t v21 = sub_2519EE8A0();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16);
  id v23 = v18;
  v22(v19, v20, v21);
  return a1;
}

uint64_t assignWithCopy for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for CarPlayIntercomControlModel();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  uint64_t v9 = *(int *)(v8 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = a2 + v13;
  uint64_t v16 = *(void **)(a1 + v13);
  uint64_t v17 = *(void **)(a2 + v13);
  void *v14 = v17;
  id v18 = v17;

  v14[1] = *(void *)(v15 + 8);
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = sub_2519EE8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  return a1;
}

uint64_t initializeWithTake for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for CarPlayIntercomControlModel();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  uint64_t v9 = *(int *)(v8 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_2519EE8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  return a1;
}

uint64_t assignWithTake for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for CarPlayIntercomControlModel();
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  uint64_t v9 = *(int *)(v8 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 20);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = *(void **)(a1 + v13);
  void *v14 = *v15;

  v14[1] = v15[1];
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_2519EE8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519DCA50);
}

uint64_t sub_2519DCA50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CarPlayIntercomControlModel();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 2147483646)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v12 = sub_2519EE8A0();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 24);
    return v13(v15, a2, v14);
  }
}

uint64_t storeEnumTagSinglePayload for CarPlayIntercomControlView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519DCB9C);
}

uint64_t sub_2519DCB9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for CarPlayIntercomControlModel();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  else
  {
    uint64_t v11 = sub_2519EE8A0();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_2519DCCC8()
{
  uint64_t result = type metadata accessor for CarPlayIntercomControlModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_2519EE8A0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2519DCD98()
{
  return sub_2519DD0BC(&qword_269B995F0, &qword_269B995F8);
}

uint64_t sub_2519DCDD8@<X0>(char *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for CarPlayIntercomControlView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_2519DA5B8(v4, a1);
}

uint64_t sub_2519DCE48()
{
  return sub_2519DACA4(*(void *)(v0 + 16));
}

uint64_t sub_2519DCE54()
{
  return sub_2519DD040((uint64_t (*)(uint64_t))sub_2519DB050);
}

uint64_t sub_2519DCE6C()
{
  return sub_2519DB63C();
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for CarPlayIntercomControlView() - 8);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80));
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
  uint64_t v5 = type metadata accessor for CarPlayIntercomControlModel();
  v4(v2 + *(int *)(v5 + 20), v3);
  uint64_t v6 = v2 + *(int *)(v5 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  uint64_t v8 = v2 + v1[8];
  uint64_t v9 = sub_2519EE8A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);

  return swift_deallocObject();
}

uint64_t sub_2519DD028()
{
  return sub_2519DD040((uint64_t (*)(uint64_t))sub_2519DB99C);
}

uint64_t sub_2519DD040(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for CarPlayIntercomControlView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_2519DD0B4()
{
  return sub_2519DBE00();
}

uint64_t sub_2519DD0BC(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2519DD164()
{
  return sub_2519DBF04();
}

uint64_t sub_2519DD16C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2519DD1B4()
{
  unint64_t result = qword_269B99668;
  if (!qword_269B99668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99668);
  }
  return result;
}

uint64_t sub_2519DD208(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2519DD250(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2519DD2AC(uint64_t a1)
{
  uint64_t v2 = sub_2519EEA70();

  return sub_2519DD368(a1, v2);
}

uint64_t sub_2519DD2F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_269B99698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2519DD358(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2519DD368(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2519DD430(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x2533A8E50](v9, a1);
      sub_2519DD48C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_2519DD430(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2519DD48C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2519DD4E0()
{
  return sub_2519DB744();
}

uint64_t sub_2519DD4E8@<X0>(uint64_t a1@<X8>)
{
  return sub_2519DB808(a1);
}

uint64_t sub_2519DD4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 56);
}

uint64_t sub_2519DD4F8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2519DD594(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v4 = a1;
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    uint64_t *v4 = *a2;
    unint64_t v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    unint64_t v10 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v11 = v10[1];
    uint64_t v12 = (void *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_2519DD68C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();

  return swift_release();
}

uint64_t sub_2519DD6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t sub_2519DD77C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  *int v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2519DD808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 32) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 32) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2519DD884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  *(_OWORD *)((*(void *)(v5 + 24) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(void *)(v5 + 24) + 7 + a2) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_2519DD908(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = v9 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x2519DDA54);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v17 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v17 >= 0xFFFFFFFF) {
    LODWORD(v17) = -1;
  }
  return (v17 + 1);
}

void sub_2519DDA68(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v10 = ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    unsigned int v11 = a3 - v8 + 1;
  }
  else {
    unsigned int v11 = 2;
  }
  if (v11 >= 0x10000) {
    int v12 = 4;
  }
  else {
    int v12 = 2;
  }
  if (v11 < 0x100) {
    int v12 = 1;
  }
  if (v11 >= 2) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v8 < a3) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a2 > v8)
  {
    if (((v9 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v15 = a2 - v8;
    }
    else {
      int v15 = 1;
    }
    if (((v9 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v16 = ~v8 + a2;
      bzero(a1, ((v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
      *(_DWORD *)a1 = v16;
    }
    switch(v14)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v14)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x2519DDC48);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v7 < 0x7FFFFFFF)
        {
          uint64_t v18 = (void *)((unint64_t)&a1[v9 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            uint64_t v19 = a2 ^ 0x80000000;
            v18[1] = 0;
          }
          else
          {
            uint64_t v19 = a2 - 1;
          }
          *uint64_t v18 = v19;
        }
        else
        {
          unint64_t v17 = *(void (**)(void))(v6 + 56);
          v17();
        }
      }
      return;
  }
}

uint64_t type metadata accessor for ForEachWithIndex(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for ForEachWithIndex);
}

uint64_t sub_2519DDC88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2519DDCD4@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  v47 = a2;
  uint64_t v45 = *(a1 - 1);
  uint64_t v46 = *(void *)(v45 + 64);
  uint64_t v4 = MEMORY[0x270FA5388](a1);
  uint64_t v42 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v39 = *(void *)(v4 + 32);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(v39 + 8) + 8) + 8);
  uint64_t v8 = sub_2519EEB00();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = v6;
  swift_getAssociatedTypeWitness();
  uint64_t v10 = MEMORY[0x263F8D6C8];
  swift_getTupleTypeMetadata2();
  uint64_t v11 = sub_2519EEA00();
  uint64_t v44 = v11;
  uint64_t v12 = a1[3];
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v55 = v11;
  uint64_t v56 = v10;
  uint64_t v57 = v12;
  uint64_t v58 = WitnessTable;
  uint64_t v59 = MEMORY[0x263F8D6D8];
  uint64_t v36 = sub_2519EE840();
  uint64_t v43 = *(void *)(v36 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v36);
  v38 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v40 = (char *)&v34 - v15;
  uint64_t v16 = v9;
  MEMORY[0x2533A8DC0](v9, v7);
  swift_getWitnessTable();
  uint64_t v55 = sub_2519EEA10();
  uint64_t v48 = v9;
  uint64_t v49 = v12;
  uint64_t v17 = v12;
  uint64_t v18 = a1[5];
  uint64_t v19 = a1[6];
  uint64_t v20 = v39;
  uint64_t v50 = v39;
  uint64_t v51 = v18;
  uint64_t v35 = a1[7];
  char v34 = a1;
  uint64_t v52 = v19;
  uint64_t v53 = v35;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = v45;
  uint64_t v22 = v42;
  (*(void (**)(char *, uint64_t, void *))(v45 + 16))(v42, v2, a1);
  unint64_t v23 = (*(unsigned __int8 *)(v21 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  id v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = v16;
  *((void *)v24 + 3) = v17;
  *((void *)v24 + 4) = v20;
  *((void *)v24 + 5) = v18;
  uint64_t v25 = v35;
  *((void *)v24 + 6) = v19;
  *((void *)v24 + 7) = v25;
  (*(void (**)(char *, char *, void *))(v21 + 32))(&v24[v23], v22, v34);
  uint64_t v26 = (void *)swift_allocObject();
  v26[2] = v16;
  v26[3] = v17;
  v26[4] = v20;
  v26[5] = v18;
  v26[6] = v19;
  v26[7] = v25;
  v26[8] = sub_2519DE49C;
  v26[9] = v24;
  uint64_t v27 = v38;
  sub_2519EE830();
  uint64_t v54 = v18;
  uint64_t v28 = v36;
  swift_getWitnessTable();
  uint64_t v29 = v43;
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v31 = v40;
  v30(v40, v27, v28);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v29 + 8);
  v32(v27, v28);
  v30(v47, v31, v28);
  return ((uint64_t (*)(char *, uint64_t))v32)(v31, v28);
}

uint64_t sub_2519DE178@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, char *a5@<X8>)
{
  uint64_t v10 = *(void *)(a4 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](a1);
  uint64_t v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v26 - v14;
  v26[0] = v16;
  v26[1] = v17;
  v26[2] = v18;
  v26[3] = v19;
  v26[4] = v20;
  v26[5] = v21;
  uint64_t v22 = type metadata accessor for ForEachWithIndex(0, (uint64_t)v26);
  (*(void (**)(uint64_t, uint64_t))(a3 + *(int *)(v22 + 68)))(a1, a2);
  unint64_t v23 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v23(v15, v13, a4);
  id v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v13, a4);
  v23(a5, v15, a4);
  return ((uint64_t (*)(char *, uint64_t))v24)(v15, a4);
}

uint64_t sub_2519DE2F4(char *a1, uint64_t (*a2)(uint64_t, char *))
{
  uint64_t v4 = *(void *)a1;
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return a2(v4, &a1[*(int *)(TupleTypeMetadata2 + 48)]);
}

uint64_t sub_2519DE39C()
{
  long long v1 = v0[2];
  v6[0] = v0[1];
  uint64_t v5 = *(void *)&v6[0];
  long long v2 = v0[3];
  v6[1] = v1;
  v6[2] = v2;
  uint64_t v3 = *(void *)(type metadata accessor for ForEachWithIndex(0, (uint64_t)v6) - 8);
  (*(void (**)(unint64_t))(*(void *)(v5 - 8) + 8))((unint64_t)v0 + ((*(unsigned __int8 *)(v3 + 80)
                                                                                                + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2519DE49C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v7 = v3[3];
  uint64_t v8 = v3[4];
  uint64_t v9 = v3[5];
  uint64_t v10 = v3[6];
  uint64_t v11 = v3[7];
  v14[0] = v3[2];
  v14[1] = v7;
  v14[2] = v8;
  v14[3] = v9;
  v14[4] = v10;
  v14[5] = v11;
  uint64_t v12 = *(void *)(type metadata accessor for ForEachWithIndex(0, (uint64_t)v14) - 8);
  return sub_2519DE178(a1, a2, (uint64_t)v3 + ((*(unsigned __int8 *)(v12 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), v7, a3);
}

uint64_t sub_2519DE56C()
{
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2519DE5A4(char *a1)
{
  return sub_2519DE2F4(a1, *(uint64_t (**)(uint64_t, char *))(v1 + 64));
}

uint64_t sub_2519DE5D8()
{
  return swift_getWitnessTable();
}

uint64_t HomeAppLaunchModel.bundleId.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519EE5E0();
  return v1;
}

uint64_t HomeAppLaunchModel.bundleId.setter()
{
  return sub_2519EE5F0();
}

uint64_t (*HomeAppLaunchModel.bundleId.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  v2[4] = sub_2519EE5D0();
  return sub_2519D84C0;
}

uint64_t HomeAppLaunchModel.buttonLabel.getter()
{
  type metadata accessor for HomeAppLaunchModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519EE5E0();
  return v1;
}

uint64_t type metadata accessor for HomeAppLaunchModel()
{
  uint64_t result = qword_269B99748;
  if (!qword_269B99748) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2519DE834@<X0>(void *a1@<X8>)
{
  type metadata accessor for HomeAppLaunchModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t result = sub_2519EE5E0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_2519DE894()
{
  return sub_2519EE5F0();
}

uint64_t HomeAppLaunchModel.buttonLabel.setter()
{
  return sub_2519EE5F0();
}

uint64_t (*HomeAppLaunchModel.buttonLabel.modify(void *a1))()
{
  long long v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for HomeAppLaunchModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  v2[4] = sub_2519EE5D0();
  return sub_2519D84C0;
}

unint64_t static HomeAppLaunchModel.responseViewId.getter()
{
  return 0xD00000000000001FLL;
}

uint64_t sub_2519DE9E4(char a1)
{
  if (a1) {
    return 0x614C6E6F74747562;
  }
  else {
    return 0x6449656C646E7562;
  }
}

BOOL sub_2519DEA24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2519DEA3C()
{
  return sub_2519DE9E4(*v0);
}

uint64_t sub_2519DEA44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2519DFAE8(a1, a2);
  *a3 = result;
  return result;
}

void sub_2519DEA6C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2519DEA78(uint64_t a1)
{
  unint64_t v2 = sub_2519DECA0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519DEAB4(uint64_t a1)
{
  unint64_t v2 = sub_2519DECA0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HomeAppLaunchModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99720);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519DECA0();
  sub_2519EEC00();
  v8[15] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519D93B8(&qword_269B99560);
  sub_2519EEBA0();
  if (!v1)
  {
    type metadata accessor for HomeAppLaunchModel();
    v8[14] = 1;
    sub_2519EEBA0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2519DECA0()
{
  unint64_t result = qword_269B99728;
  if (!qword_269B99728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99728);
  }
  return result;
}

uint64_t HomeAppLaunchModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v27 = *(void *)(v30 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v30);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v28 = (char *)&v21 - v7;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99730);
  uint64_t v26 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for HomeAppLaunchModel();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519DECA0();
  sub_2519EEBF0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v22 = v10;
  unint64_t v23 = v6;
  id v24 = v12;
  uint64_t v14 = v26;
  uint64_t v13 = v27;
  char v32 = 0;
  uint64_t v15 = sub_2519D93B8(&qword_269B99578);
  uint64_t v16 = v28;
  uint64_t v17 = v29;
  sub_2519EEB60();
  uint64_t v21 = v15;
  uint64_t v28 = *(char **)(v13 + 32);
  ((void (*)(char *, char *, uint64_t))v28)(v24, v16, v30);
  char v31 = 1;
  uint64_t v18 = v23;
  sub_2519EEB60();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v17);
  uint64_t v19 = (uint64_t)v24;
  ((void (*)(char *, char *, uint64_t))v28)(&v24[*(int *)(v22 + 20)], v18, v30);
  sub_2519DF060(v19, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_2519DF0C4(v19);
}

uint64_t sub_2519DF060(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeAppLaunchModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2519DF0C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HomeAppLaunchModel();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2519DF120()
{
  return sub_2519DF188(&qword_269B99738);
}

uint64_t sub_2519DF154()
{
  return sub_2519DF188(&qword_269B99740);
}

uint64_t sub_2519DF188(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HomeAppLaunchModel();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519DF1CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeAppLaunchModel.init(from:)(a1, a2);
}

uint64_t sub_2519DF1E4(void *a1)
{
  return HomeAppLaunchModel.encode(to:)(a1);
}

uint64_t sub_2519DF1FC@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t result = sub_2519EE5E0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeAppLaunchModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t destroy for HomeAppLaunchModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);

  return v7(v5, v4);
}

uint64_t initializeWithCopy for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithCopy for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t initializeWithTake for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t assignWithTake for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519DF664);
}

uint64_t sub_2519DF664(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for HomeAppLaunchModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519DF6E8);
}

uint64_t sub_2519DF6E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_2519DF75C()
{
  sub_2519DF7E8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2519DF7E8()
{
  if (!qword_269B995A8)
  {
    unint64_t v0 = sub_2519EE600();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B995A8);
    }
  }
}

uint64_t getEnumTagSinglePayload for HomeAppLaunchModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HomeAppLaunchModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x2519DF99CLL);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_2519DF9C4(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HomeAppLaunchModel.CodingKeys()
{
  return &type metadata for HomeAppLaunchModel.CodingKeys;
}

unint64_t sub_2519DF9E4()
{
  unint64_t result = qword_269B99758;
  if (!qword_269B99758)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99758);
  }
  return result;
}

unint64_t sub_2519DFA3C()
{
  unint64_t result = qword_269B99760;
  if (!qword_269B99760)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99760);
  }
  return result;
}

unint64_t sub_2519DFA94()
{
  unint64_t result = qword_269B99768;
  if (!qword_269B99768)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99768);
  }
  return result;
}

uint64_t sub_2519DFAE8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
  if (v3 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x614C6E6F74747562 && a2 == 0xEB000000006C6562)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_2519EEBB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t HomeAppLaunchView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2519EE9A0();
  sub_2519D81E4();
  *a2 = sub_2519EE6C0();
  a2[1] = v4;
  uint64_t v5 = type metadata accessor for HomeAppLaunchView();
  sub_2519EE890();
  return sub_2519DFFBC(a1, (uint64_t)a2 + *(int *)(v5 + 24), (uint64_t (*)(void))type metadata accessor for HomeAppLaunchModel);
}

uint64_t type metadata accessor for HomeAppLaunchView()
{
  uint64_t result = qword_269B99780;
  if (!qword_269B99780) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t HomeAppLaunchView.body.getter()
{
  uint64_t v1 = type metadata accessor for HomeAppLaunchView();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](v1 - 8);
  sub_2519DFF54(v0, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_2519DFFBC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(void))type metadata accessor for HomeAppLaunchView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99770);
  sub_2519DD0BC(&qword_269B99778, &qword_269B99770);
  return sub_2519EE8C0();
}

uint64_t sub_2519DFE0C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HomeAppLaunchView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_2519DFF54(a1, (uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_2519DFFBC((uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v6 + v5, (uint64_t (*)(void))type metadata accessor for HomeAppLaunchView);
  uint64_t v9 = a1;
  return sub_2519EE820();
}

uint64_t sub_2519DFF54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeAppLaunchView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2519DFFBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2519E0028()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2519E0044(uint64_t a1)
{
  uint64_t v54 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99670);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v49 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99678);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v50 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99680);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v55 = (uint64_t)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2519EE520();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_2519EE510();
  uint64_t v11 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for HomeAppLaunchView();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_269B99500 != -1) {
    swift_once();
  }
  uint64_t v17 = sub_2519EE640();
  __swift_project_value_buffer(v17, (uint64_t)qword_269B99AB8);
  sub_2519DFF54(v54, (uint64_t)v16);
  uint64_t v18 = sub_2519EE620();
  os_log_type_t v19 = sub_2519EEA20();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v51 = v10;
  uint64_t v52 = v13;
  if (v20)
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v47 = v11;
    uint64_t v23 = v22;
    uint64_t v56 = v22;
    uint64_t v48 = v8;
    *(_DWORD *)uint64_t v21 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    sub_2519EE5E0();
    uint64_t v57 = sub_2519EC618(v57, v58, &v56);
    uint64_t v13 = v52;
    uint64_t v8 = v48;
    sub_2519EEA50();
    swift_bridgeObjectRelease();
    sub_2519E15AC((uint64_t)v16);
    _os_log_impl(&dword_2519D6000, v18, v19, "#HomeAppLaunchView Launching App: %s.", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v24 = v23;
    uint64_t v11 = v47;
    MEMORY[0x2533A9370](v24, -1, -1);
    uint64_t v25 = v21;
    uint64_t v10 = v51;
    MEMORY[0x2533A9370](v25, -1, -1);
  }
  else
  {
    sub_2519E15AC((uint64_t)v16);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519EE5E0();
  sub_2519EE500();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99688);
  uint64_t v26 = v13;
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_2519EF2F0;
  uint64_t v28 = sub_2519EE590();
  uint64_t v29 = MEMORY[0x263F771C8];
  *(void *)(v27 + 56) = v28;
  *(void *)(v27 + 64) = v29;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v27 + 32));
  char v31 = v26;
  uint64_t v32 = v53;
  (*(void (**)(uint64_t *, char *, uint64_t))(v11 + 16))(boxed_opaque_existential_1, v31, v53);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v28 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F77188], v28);
  sub_2519EE530();
  uint64_t v33 = v55;
  sub_2519EE880();
  uint64_t v34 = sub_2519EE980();
  uint64_t v35 = *(void *)(v34 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v52, v32);
    return sub_2519DD250(v55, &qword_269B99680);
  }
  else
  {
    v37 = v10;
    uint64_t v38 = v8;
    uint64_t v39 = (uint64_t)v50;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v50, v37, v7);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v39, 0, 1, v7);
    uint64_t v40 = *MEMORY[0x263F77610];
    uint64_t v41 = sub_2519EE8D0();
    uint64_t v42 = v7;
    uint64_t v43 = *(void *)(v41 - 8);
    uint64_t v44 = v11;
    uint64_t v45 = (uint64_t)v49;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 104))(v49, v40, v41);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v43 + 56))(v45, 0, 1, v41);
    uint64_t v46 = v55;
    sub_2519EE970();
    sub_2519DD250(v45, &qword_269B99670);
    sub_2519DD250(v39, &qword_269B99678);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v51, v42);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v52, v53);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(v46, v34);
  }
}

uint64_t sub_2519E0744@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for HomeAppLaunchView();
  type metadata accessor for HomeAppLaunchModel();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519EE5E0();
  sub_2519DD1B4();
  uint64_t result = sub_2519EE750();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_2519E07DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  sub_2519DFF54(v1, (uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_2519DFFBC((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v5 + v4, (uint64_t (*)(void))type metadata accessor for HomeAppLaunchView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99770);
  sub_2519DD0BC(&qword_269B99778, &qword_269B99770);
  return sub_2519EE8C0();
}

char *initializeBufferWithCopyOfBuffer for HomeAppLaunchView(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  unint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_2519EE8A0();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = &v7[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
    v18(v15, v16, v17);
    uint64_t v19 = type metadata accessor for HomeAppLaunchModel();
    v18(&v15[*(int *)(v19 + 20)], v16 + *(int *)(v19 + 20), v17);
  }
  return v7;
}

uint64_t destroy for HomeAppLaunchView(id *a1, uint64_t a2)
{
  unint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_2519EE8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v10 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v10)((void *)(v7 - 8), v6, v7);
  uint64_t v8 = &v6[*(int *)(type metadata accessor for HomeAppLaunchModel() + 20)];

  return v10(v8, v7);
}

void *initializeWithCopy for HomeAppLaunchView(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2519EE8A0();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  id v13 = v7;
  v12(v9, v10, v11);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
  v18(v15, v16, v17);
  uint64_t v19 = type metadata accessor for HomeAppLaunchModel();
  v18(&v15[*(int *)(v19 + 20)], v16 + *(int *)(v19 + 20), v17);
  return a1;
}

uint64_t assignWithCopy for HomeAppLaunchView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_2519EE8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24);
  v17(v14, v15, v16);
  uint64_t v18 = type metadata accessor for HomeAppLaunchModel();
  v17(v14 + *(int *)(v18 + 20), v15 + *(int *)(v18 + 20), v16);
  return a1;
}

_OWORD *initializeWithTake for HomeAppLaunchView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2519EE8A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  uint64_t v15 = type metadata accessor for HomeAppLaunchModel();
  v14(&v11[*(int *)(v15 + 20)], &v12[*(int *)(v15 + 20)], v13);
  return a1;
}

uint64_t assignWithTake for HomeAppLaunchView(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2519EE8A0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v15 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  uint64_t v16 = type metadata accessor for HomeAppLaunchModel();
  v15(v12 + *(int *)(v16 + 20), &v13[*(int *)(v16 + 20)], v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeAppLaunchView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519E0FE0);
}

uint64_t sub_2519E0FE0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_2519EE8A0();
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = type metadata accessor for HomeAppLaunchModel();
      uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = (char *)a1 + *(int *)(a3 + 24);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t storeEnumTagSinglePayload for HomeAppLaunchView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519E112C);
}

void *sub_2519E112C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v8 = sub_2519EE8A0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for HomeAppLaunchModel();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_2519E1258()
{
  uint64_t result = sub_2519EE8A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for HomeAppLaunchModel();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2519E132C()
{
  return sub_2519DD0BC(&qword_269B99790, &qword_269B99798);
}

uint64_t sub_2519E136C()
{
  uint64_t v1 = *(void *)(type metadata accessor for HomeAppLaunchView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_2519DFE0C(v2);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v1 = (int *)(type metadata accessor for HomeAppLaunchView() - 8);
  uint64_t v2 = (id *)(v0
            + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80)));

  int v3 = (char *)v2 + v1[7];
  uint64_t v4 = sub_2519EE8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  int v5 = (char *)v2 + v1[8];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  uint64_t v8 = type metadata accessor for HomeAppLaunchModel();
  v7(&v5[*(int *)(v8 + 20)], v6);

  return swift_deallocObject();
}

uint64_t sub_2519E1544()
{
  uint64_t v1 = *(void *)(type metadata accessor for HomeAppLaunchView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_2519E0044(v2);
}

uint64_t sub_2519E15A4@<X0>(uint64_t a1@<X8>)
{
  return sub_2519E0744(a1);
}

uint64_t sub_2519E15AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HomeAppLaunchView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2519E1608()
{
  unk_269B9C297 = -18;
}

unint64_t static HomeCommunicationSnippetModel.bundleName.getter()
{
  return 0xD000000000000019;
}

uint64_t HomeCommunicationSnippetModel.snippetHidden(for:idiom:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2519EE610();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for HomeCommunicationSnippetModel();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2519E187C(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F75620], v2);
    sub_2519E3724(&qword_269B997A0, MEMORY[0x263F75668]);
    char v9 = sub_2519EE9C0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    char v10 = v9 ^ 1;
  }
  else
  {
    char v10 = 0;
  }
  sub_2519E1CEC((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for HomeCommunicationSnippetModel);
  return v10 & 1;
}

uint64_t type metadata accessor for HomeCommunicationSnippetModel()
{
  uint64_t result = qword_269B99860;
  if (!qword_269B99860) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2519E187C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HomeCommunicationSnippetModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t HomeCommunicationSnippetModel.description.getter()
{
  uint64_t v1 = type metadata accessor for HomeDisambiguationModel(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for CarPlayIntercomControlModel();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for HomeAppLaunchModel();
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for HomeCommunicationSnippetModel();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (void *)((char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2519E187C(v0, (uint64_t)v12);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_2519E362C((uint64_t)v12, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for CarPlayIntercomControlModel);
      uint64_t v20 = 0;
      unint64_t v21 = 0xE000000000000000;
      sub_2519EEA90();
      sub_2519EE9D0();
      sub_2519EEAE0();
      sub_2519EE9D0();
      uint64_t v13 = v20;
      uint64_t v14 = (uint64_t (*)(void))type metadata accessor for CarPlayIntercomControlModel;
      uint64_t v15 = (uint64_t)v6;
      goto LABEL_6;
    case 2u:
      sub_2519E362C((uint64_t)v12, (uint64_t)v3, type metadata accessor for HomeDisambiguationModel);
      uint64_t v20 = 0;
      unint64_t v21 = 0xE000000000000000;
      sub_2519EEA90();
      sub_2519EE9D0();
      sub_2519EEAE0();
      uint64_t v13 = v20;
      uint64_t v14 = type metadata accessor for HomeDisambiguationModel;
      uint64_t v15 = (uint64_t)v3;
      goto LABEL_6;
    case 3u:
      uint64_t v17 = *v12;
      uint64_t v16 = v12[1];
      uint64_t v20 = 0;
      unint64_t v21 = 0xE000000000000000;
      sub_2519EEA90();
      sub_2519EE9D0();
      v19[0] = v17;
      v19[1] = v16;
      sub_2519EEAE0();
      swift_bridgeObjectRelease();
      return v20;
    default:
      sub_2519E362C((uint64_t)v12, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for HomeAppLaunchModel);
      uint64_t v20 = 0;
      unint64_t v21 = 0xE000000000000000;
      sub_2519EE9D0();
      sub_2519EEAE0();
      uint64_t v13 = v20;
      uint64_t v14 = (uint64_t (*)(void))type metadata accessor for HomeAppLaunchModel;
      uint64_t v15 = (uint64_t)v9;
LABEL_6:
      sub_2519E1CEC(v15, v14);
      return v13;
  }
}

uint64_t sub_2519E1CEC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2519E1D4C(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000012;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      unint64_t result = 0x636E75614C707061;
      break;
  }
  return result;
}

uint64_t sub_2519E1DF0()
{
  return 1;
}

void sub_2519E1E04(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2519E1E10(uint64_t a1)
{
  unint64_t v2 = sub_2519E2B10();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519E1E4C(uint64_t a1)
{
  unint64_t v2 = sub_2519E2B10();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2519E1E88(uint64_t a1)
{
  unint64_t v2 = sub_2519E2ABC();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519E1EC4(uint64_t a1)
{
  unint64_t v2 = sub_2519E2ABC();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_2519E1F00()
{
  return sub_2519E1D4C(*v0);
}

uint64_t sub_2519E1F08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2519E5544(a1, a2);
  *a3 = result;
  return result;
}

void sub_2519E1F30(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2519E1F3C(uint64_t a1)
{
  unint64_t v2 = sub_2519E296C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519E1F78(uint64_t a1)
{
  unint64_t v2 = sub_2519E296C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2519E1FB4()
{
  return sub_2519EEBD0();
}

uint64_t sub_2519E1FDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2519E56F0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2519E2008(uint64_t a1)
{
  unint64_t v2 = sub_2519E2A68();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519E2044(uint64_t a1)
{
  unint64_t v2 = sub_2519E2A68();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2519E2080()
{
  return sub_2519EEBE0();
}

uint64_t sub_2519E20C4()
{
  return sub_2519EEBE0();
}

uint64_t sub_2519E2104(uint64_t a1)
{
  unint64_t v2 = sub_2519E29C0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519E2140(uint64_t a1)
{
  unint64_t v2 = sub_2519E29C0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HomeCommunicationSnippetModel.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B997A8);
  uint64_t v52 = *(void *)(v2 - 8);
  uint64_t v53 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v51 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B997B0);
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v48 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = type metadata accessor for HomeDisambiguationModel(0);
  MEMORY[0x270FA5388](v46);
  uint64_t v47 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B997B8);
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v43 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for CarPlayIntercomControlModel();
  MEMORY[0x270FA5388](v41);
  uint64_t v42 = (uint64_t)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B997C0);
  uint64_t v39 = *(void *)(v10 - 8);
  uint64_t v40 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for HomeAppLaunchModel();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for HomeCommunicationSnippetModel();
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (uint64_t *)((char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B997C8);
  uint64_t v54 = *(void *)(v19 - 8);
  uint64_t v55 = v19;
  MEMORY[0x270FA5388](v19);
  unint64_t v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519E296C();
  sub_2519EEC00();
  sub_2519E187C(v58, (uint64_t)v18);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v26 = v42;
      sub_2519E362C((uint64_t)v18, v42, (uint64_t (*)(void))type metadata accessor for CarPlayIntercomControlModel);
      LOBYTE(v56) = 1;
      sub_2519E2ABC();
      uint64_t v36 = v43;
      uint64_t v22 = v55;
      sub_2519EEB80();
      sub_2519E3724(&qword_269B99590, (void (*)(uint64_t))type metadata accessor for CarPlayIntercomControlModel);
      uint64_t v37 = v45;
      sub_2519EEBA0();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v36, v37);
      uint64_t v29 = type metadata accessor for CarPlayIntercomControlModel;
      goto LABEL_6;
    case 2u:
      uint64_t v26 = v47;
      sub_2519E362C((uint64_t)v18, v47, type metadata accessor for HomeDisambiguationModel);
      LOBYTE(v56) = 2;
      sub_2519E2A68();
      uint64_t v27 = v48;
      uint64_t v22 = v55;
      sub_2519EEB80();
      sub_2519E3724(&qword_269B997F0, (void (*)(uint64_t))type metadata accessor for HomeDisambiguationModel);
      uint64_t v28 = v50;
      sub_2519EEBA0();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v27, v28);
      uint64_t v29 = (uint64_t (*)())type metadata accessor for HomeDisambiguationModel;
LABEL_6:
      uint64_t v24 = v29;
      uint64_t v25 = v26;
      goto LABEL_7;
    case 3u:
      uint64_t v31 = *v18;
      uint64_t v30 = v18[1];
      LOBYTE(v56) = 3;
      sub_2519E29C0();
      uint64_t v32 = v51;
      uint64_t v33 = v55;
      sub_2519EEB80();
      uint64_t v56 = v31;
      uint64_t v57 = v30;
      sub_2519E2A14();
      uint64_t v34 = v53;
      sub_2519EEBA0();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v32, v34);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v21, v33);
      return swift_bridgeObjectRelease();
    default:
      sub_2519E362C((uint64_t)v18, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for HomeAppLaunchModel);
      LOBYTE(v56) = 0;
      sub_2519E2B10();
      uint64_t v22 = v55;
      sub_2519EEB80();
      sub_2519E3724(&qword_269B99740, (void (*)(uint64_t))type metadata accessor for HomeAppLaunchModel);
      uint64_t v23 = v40;
      sub_2519EEBA0();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v23);
      uint64_t v24 = type metadata accessor for HomeAppLaunchModel;
      uint64_t v25 = (uint64_t)v15;
LABEL_7:
      sub_2519E1CEC(v25, (uint64_t (*)(void))v24);
      return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v21, v22);
  }
}

unint64_t sub_2519E296C()
{
  unint64_t result = qword_269B997D0;
  if (!qword_269B997D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B997D0);
  }
  return result;
}

unint64_t sub_2519E29C0()
{
  unint64_t result = qword_269B997D8;
  if (!qword_269B997D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B997D8);
  }
  return result;
}

unint64_t sub_2519E2A14()
{
  unint64_t result = qword_269B997E0;
  if (!qword_269B997E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B997E0);
  }
  return result;
}

unint64_t sub_2519E2A68()
{
  unint64_t result = qword_269B997E8;
  if (!qword_269B997E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B997E8);
  }
  return result;
}

unint64_t sub_2519E2ABC()
{
  unint64_t result = qword_269B997F8;
  if (!qword_269B997F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B997F8);
  }
  return result;
}

unint64_t sub_2519E2B10()
{
  unint64_t result = qword_269B99800;
  if (!qword_269B99800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99800);
  }
  return result;
}

uint64_t HomeCommunicationSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v76 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99808);
  uint64_t v74 = *(void *)(v3 - 8);
  uint64_t v75 = v3;
  MEMORY[0x270FA5388](v3);
  v68 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99810);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v64 = v5;
  uint64_t v65 = v6;
  MEMORY[0x270FA5388](v5);
  v69 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99818);
  uint64_t v63 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  v67 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99820);
  uint64_t v61 = *(void *)(v9 - 8);
  uint64_t v62 = v9;
  MEMORY[0x270FA5388](v9);
  v66 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99828);
  uint64_t v71 = *(void *)(v11 - 8);
  uint64_t v72 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = type metadata accessor for HomeCommunicationSnippetModel();
  uint64_t v14 = MEMORY[0x270FA5388](v70);
  uint64_t v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v56 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v56 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v56 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v56 - v26;
  uint64_t v28 = a1[3];
  v77 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v28);
  sub_2519E296C();
  uint64_t v29 = (uint64_t)v79;
  sub_2519EEBF0();
  if (v29) {
    goto LABEL_10;
  }
  uint64_t v58 = v25;
  uint64_t v59 = v22;
  uint64_t v57 = v16;
  v60 = v19;
  uint64_t v31 = v73;
  uint64_t v30 = v74;
  uint64_t v33 = v75;
  uint64_t v32 = v76;
  v79 = v27;
  uint64_t v34 = v72;
  uint64_t v35 = sub_2519EEB70();
  if (*(void *)(v35 + 16) != 1)
  {
    uint64_t v41 = sub_2519EEAC0();
    swift_allocError();
    uint64_t v43 = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99830);
    *uint64_t v43 = v70;
    sub_2519EEB40();
    sub_2519EEAB0();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v41 - 8) + 104))(v43, *MEMORY[0x263F8DCB0], v41);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v13, v34);
LABEL_10:
    uint64_t v39 = (uint64_t)v77;
    return __swift_destroy_boxed_opaque_existential_1(v39);
  }
  switch(*(unsigned char *)(v35 + 32))
  {
    case 1:
      LOBYTE(v78) = 1;
      sub_2519E2ABC();
      uint64_t v44 = v67;
      sub_2519EEB30();
      type metadata accessor for CarPlayIntercomControlModel();
      sub_2519E3724(&qword_269B99588, (void (*)(uint64_t))type metadata accessor for CarPlayIntercomControlModel);
      uint64_t v45 = (uint64_t)v59;
      sub_2519EEB60();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v44, v31);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v13, v34);
      uint64_t v39 = (uint64_t)v77;
      swift_storeEnumTagMultiPayload();
      uint64_t v40 = v45;
      goto LABEL_7;
    case 2:
      LOBYTE(v78) = 2;
      sub_2519E2A68();
      uint64_t v47 = v69;
      sub_2519EEB30();
      type metadata accessor for HomeDisambiguationModel(0);
      sub_2519E3724(&qword_269B99840, (void (*)(uint64_t))type metadata accessor for HomeDisambiguationModel);
      uint64_t v48 = (uint64_t)v60;
      uint64_t v49 = v64;
      sub_2519EEB60();
      uint64_t v50 = v71;
      (*(void (**)(char *, uint64_t))(v65 + 8))(v47, v49);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v13, v34);
      swift_storeEnumTagMultiPayload();
      uint64_t v46 = (uint64_t)v79;
      sub_2519E362C(v48, (uint64_t)v79, (uint64_t (*)(void))type metadata accessor for HomeCommunicationSnippetModel);
      uint64_t v32 = v76;
      uint64_t v39 = (uint64_t)v77;
      break;
    case 3:
      LOBYTE(v78) = 3;
      sub_2519E29C0();
      uint64_t v51 = v68;
      sub_2519EEB30();
      sub_2519E35D8();
      sub_2519EEB60();
      uint64_t v53 = v51;
      uint64_t v54 = v71;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v53, v33);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v13, v34);
      uint64_t v55 = (uint64_t)v57;
      *uint64_t v57 = v78;
      swift_storeEnumTagMultiPayload();
      uint64_t v46 = (uint64_t)v79;
      sub_2519E362C(v55, (uint64_t)v79, (uint64_t (*)(void))type metadata accessor for HomeCommunicationSnippetModel);
      uint64_t v39 = (uint64_t)v77;
      break;
    default:
      LOBYTE(v78) = 0;
      sub_2519E2B10();
      uint64_t v36 = v66;
      sub_2519EEB30();
      type metadata accessor for HomeAppLaunchModel();
      sub_2519E3724(&qword_269B99738, (void (*)(uint64_t))type metadata accessor for HomeAppLaunchModel);
      uint64_t v37 = (uint64_t)v58;
      uint64_t v38 = v62;
      sub_2519EEB60();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v36, v38);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v13, v34);
      uint64_t v39 = (uint64_t)v77;
      swift_storeEnumTagMultiPayload();
      uint64_t v40 = v37;
LABEL_7:
      uint64_t v46 = (uint64_t)v79;
      sub_2519E362C(v40, (uint64_t)v79, (uint64_t (*)(void))type metadata accessor for HomeCommunicationSnippetModel);
      break;
  }
  sub_2519E362C(v46, v32, (uint64_t (*)(void))type metadata accessor for HomeCommunicationSnippetModel);
  return __swift_destroy_boxed_opaque_existential_1(v39);
}

unint64_t sub_2519E35D8()
{
  unint64_t result = qword_269B99838;
  if (!qword_269B99838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99838);
  }
  return result;
}

uint64_t sub_2519E362C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2519E3694()
{
  return sub_2519E3724(&qword_269B99848, (void (*)(uint64_t))type metadata accessor for HomeCommunicationSnippetModel);
}

uint64_t sub_2519E36DC()
{
  return sub_2519E3724(&qword_269B99850, (void (*)(uint64_t))type metadata accessor for HomeCommunicationSnippetModel);
}

uint64_t sub_2519E3724(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_2519E376C()
{
  return 0xD000000000000019;
}

uint64_t sub_2519E3788()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2519EE610();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2519E187C(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v6, *MEMORY[0x263F75620], v2);
    sub_2519E3724(&qword_269B997A0, MEMORY[0x263F75668]);
    char v9 = sub_2519EE9C0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    char v10 = v9 ^ 1;
  }
  else
  {
    char v10 = 0;
  }
  sub_2519E1CEC((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for HomeCommunicationSnippetModel);
  return v10 & 1;
}

uint64_t sub_2519E3960@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeCommunicationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_2519E3978(void *a1)
{
  return HomeCommunicationSnippetModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeCommunicationSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
        uint64_t v23 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v22 - 8) + 16);
        v23(a1, a2, v22);
        uint64_t v24 = type metadata accessor for CarPlayIntercomControlModel();
        v23((uint64_t *)((char *)a1 + *(int *)(v24 + 20)), (uint64_t *)((char *)a2 + *(int *)(v24 + 20)), v22);
        uint64_t v25 = *(int *)(v24 + 24);
        uint64_t v26 = (char *)a1 + v25;
        uint64_t v27 = (char *)a2 + v25;
        uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
        break;
      case 2u:
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
        uint64_t v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16);
        v11(a1, a2, v10);
        uint64_t v12 = (int *)type metadata accessor for HomeDisambiguationModel(0);
        uint64_t v13 = v12[5];
        uint64_t v14 = (char *)a1 + v13;
        uint64_t v15 = (char *)a2 + v13;
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
        uint64_t v17 = v12[6];
        uint64_t v18 = (char *)a1 + v17;
        uint64_t v19 = (char *)a2 + v17;
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
        v11((uint64_t *)((char *)a1 + v12[7]), (uint64_t *)((char *)a2 + v12[7]), v10);
        break;
      case 3u:
        uint64_t v21 = a2[1];
        *a1 = *a2;
        a1[1] = v21;
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
        uint64_t v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16);
        v7(a1, a2, v6);
        uint64_t v8 = type metadata accessor for HomeAppLaunchModel();
        v7((uint64_t *)((char *)a1 + *(int *)(v8 + 20)), (uint64_t *)((char *)a2 + *(int *)(v8 + 20)), v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for HomeCommunicationSnippetModel(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v18)((void *)(v3 - 8), a1, v3);
      uint64_t v4 = *(int *)(type metadata accessor for HomeAppLaunchModel() + 20);
      goto LABEL_5;
    case 1:
      uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      v6(a1, v5);
      uint64_t v7 = type metadata accessor for CarPlayIntercomControlModel();
      v6(a1 + *(int *)(v7 + 20), v5);
      uint64_t v8 = a1 + *(int *)(v7 + 24);
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
      uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
      uint64_t v11 = v9;
      uint64_t v12 = v8;
      goto LABEL_6;
    case 2:
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v18)((void *)(v3 - 8), a1, v3);
      uint64_t v13 = (int *)type metadata accessor for HomeDisambiguationModel(0);
      uint64_t v14 = a1 + v13[5];
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
      uint64_t v16 = a1 + v13[6];
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
      uint64_t v4 = v13[7];
LABEL_5:
      uint64_t v12 = a1 + v4;
      uint64_t v11 = v3;
      uint64_t v10 = v18;
LABEL_6:
      uint64_t result = v10(v12, v11);
      break;
    case 3:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for HomeCommunicationSnippetModel(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      uint64_t v20 = *(void (**)(void *, void *, uint64_t))(*(void *)(v19 - 8) + 16);
      v20(a1, a2, v19);
      uint64_t v21 = type metadata accessor for CarPlayIntercomControlModel();
      v20((void *)((char *)a1 + *(int *)(v21 + 20)), (void *)((char *)a2 + *(int *)(v21 + 20)), v19);
      uint64_t v22 = *(int *)(v21 + 24);
      uint64_t v23 = (char *)a1 + v22;
      uint64_t v24 = (char *)a2 + v22;
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
      break;
    case 2u:
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      uint64_t v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
      v8(a1, a2, v7);
      uint64_t v9 = (int *)type metadata accessor for HomeDisambiguationModel(0);
      uint64_t v10 = v9[5];
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
      uint64_t v14 = v9[6];
      uint64_t v15 = (char *)a1 + v14;
      uint64_t v16 = (char *)a2 + v14;
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
      v8((void *)((char *)a1 + v9[7]), (void *)((char *)a2 + v9[7]), v7);
      break;
    case 3u:
      uint64_t v18 = a2[1];
      *a1 = *a2;
      a1[1] = v18;
      swift_bridgeObjectRetain();
      break;
    default:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      uint64_t v5 = *(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      uint64_t v6 = type metadata accessor for HomeAppLaunchModel();
      v5((void *)((char *)a1 + *(int *)(v6 + 20)), (void *)((char *)a2 + *(int *)(v6 + 20)), v4);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for HomeCommunicationSnippetModel(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_2519E1CEC((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for HomeCommunicationSnippetModel);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
        uint64_t v8 = *(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16);
        v8(a1, a2, v7);
        uint64_t v9 = type metadata accessor for CarPlayIntercomControlModel();
        v8((void *)((char *)a1 + *(int *)(v9 + 20)), (void *)((char *)a2 + *(int *)(v9 + 20)), v7);
        uint64_t v10 = *(int *)(v9 + 24);
        uint64_t v11 = (char *)a1 + v10;
        uint64_t v12 = (char *)a2 + v10;
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
        break;
      case 2u:
        uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
        uint64_t v15 = *(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16);
        v15(a1, a2, v14);
        uint64_t v16 = (int *)type metadata accessor for HomeDisambiguationModel(0);
        uint64_t v17 = v16[5];
        uint64_t v18 = (char *)a1 + v17;
        uint64_t v19 = (char *)a2 + v17;
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
        uint64_t v21 = v16[6];
        uint64_t v22 = (char *)a1 + v21;
        uint64_t v23 = (char *)a2 + v21;
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
        v15((void *)((char *)a1 + v16[7]), (void *)((char *)a2 + v16[7]), v14);
        break;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        break;
      default:
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
        uint64_t v5 = *(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16);
        v5(a1, a2, v4);
        uint64_t v6 = type metadata accessor for HomeAppLaunchModel();
        v5((void *)((char *)a1 + *(int *)(v6 + 20)), (void *)((char *)a2 + *(int *)(v6 + 20)), v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for HomeCommunicationSnippetModel(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
    v11(a1, a2, v10);
    uint64_t v12 = (int *)type metadata accessor for HomeDisambiguationModel(0);
    uint64_t v13 = v12[5];
    uint64_t v14 = &a1[v13];
    uint64_t v15 = &a2[v13];
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
    uint64_t v17 = v12[6];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = &a2[v17];
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
    v11(&a1[v12[7]], &a2[v12[7]], v10);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32);
    v22(a1, a2, v21);
    uint64_t v23 = type metadata accessor for CarPlayIntercomControlModel();
    v22(&a1[*(int *)(v23 + 20)], &a2[*(int *)(v23 + 20)], v21);
    uint64_t v24 = *(int *)(v23 + 24);
    uint64_t v25 = &a1[v24];
    uint64_t v26 = &a2[v24];
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32);
    v8(a1, a2, v7);
    uint64_t v9 = type metadata accessor for HomeAppLaunchModel();
    v8(&a1[*(int *)(v9 + 20)], &a2[*(int *)(v9 + 20)], v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for HomeCommunicationSnippetModel(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_2519E1CEC((uint64_t)a1, (uint64_t (*)(void))type metadata accessor for HomeCommunicationSnippetModel);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
      v11(a1, a2, v10);
      uint64_t v12 = (int *)type metadata accessor for HomeDisambiguationModel(0);
      uint64_t v13 = v12[5];
      uint64_t v14 = &a1[v13];
      uint64_t v15 = &a2[v13];
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
      uint64_t v17 = v12[6];
      uint64_t v18 = &a1[v17];
      uint64_t v19 = &a2[v17];
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
      v11(&a1[v12[7]], &a2[v12[7]], v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32);
      v22(a1, a2, v21);
      uint64_t v23 = type metadata accessor for CarPlayIntercomControlModel();
      v22(&a1[*(int *)(v23 + 20)], &a2[*(int *)(v23 + 20)], v21);
      uint64_t v24 = *(int *)(v23 + 24);
      uint64_t v25 = &a1[v24];
      uint64_t v26 = &a2[v24];
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32);
      v8(a1, a2, v7);
      uint64_t v9 = type metadata accessor for HomeAppLaunchModel();
      v8(&a1[*(int *)(v9 + 20)], &a2[*(int *)(v9 + 20)], v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeCommunicationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for HomeCommunicationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2519E4C08()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2519E4C18()
{
  uint64_t result = type metadata accessor for HomeAppLaunchModel();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for CarPlayIntercomControlModel();
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for HomeDisambiguationModel(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HomeCommunicationSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for HomeCommunicationSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x2519E4E7CLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeCommunicationSnippetModel.CodingKeys()
{
  return &type metadata for HomeCommunicationSnippetModel.CodingKeys;
}

uint64_t sub_2519E4EC0()
{
  return 0;
}

ValueMetadata *type metadata accessor for HomeCommunicationSnippetModel.AppLaunchCodingKeys()
{
  return &type metadata for HomeCommunicationSnippetModel.AppLaunchCodingKeys;
}

ValueMetadata *type metadata accessor for HomeCommunicationSnippetModel.CarPlayIntercomControlCodingKeys()
{
  return &type metadata for HomeCommunicationSnippetModel.CarPlayIntercomControlCodingKeys;
}

ValueMetadata *type metadata accessor for HomeCommunicationSnippetModel.HomeDisambiguationCodingKeys()
{
  return &type metadata for HomeCommunicationSnippetModel.HomeDisambiguationCodingKeys;
}

uint64_t getEnumTagSinglePayload for SendAnnouncementNeedsValueModel.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *_s28HomeCommunicationUIFramework29HomeCommunicationSnippetModelO19AppLaunchCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2519E4FE4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeCommunicationSnippetModel.SendAnnouncementNeedsValueCodingKeys()
{
  return &type metadata for HomeCommunicationSnippetModel.SendAnnouncementNeedsValueCodingKeys;
}

unint64_t sub_2519E5020()
{
  unint64_t result = qword_269B99870;
  if (!qword_269B99870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99870);
  }
  return result;
}

unint64_t sub_2519E5078()
{
  unint64_t result = qword_269B99878;
  if (!qword_269B99878)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99878);
  }
  return result;
}

unint64_t sub_2519E50D0()
{
  unint64_t result = qword_269B99880;
  if (!qword_269B99880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99880);
  }
  return result;
}

unint64_t sub_2519E5128()
{
  unint64_t result = qword_269B99888;
  if (!qword_269B99888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99888);
  }
  return result;
}

unint64_t sub_2519E5180()
{
  unint64_t result = qword_269B99890;
  if (!qword_269B99890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99890);
  }
  return result;
}

unint64_t sub_2519E51D8()
{
  unint64_t result = qword_269B99898;
  if (!qword_269B99898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99898);
  }
  return result;
}

unint64_t sub_2519E5230()
{
  unint64_t result = qword_269B998A0;
  if (!qword_269B998A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B998A0);
  }
  return result;
}

unint64_t sub_2519E5288()
{
  unint64_t result = qword_269B998A8;
  if (!qword_269B998A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B998A8);
  }
  return result;
}

unint64_t sub_2519E52E0()
{
  unint64_t result = qword_269B998B0;
  if (!qword_269B998B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B998B0);
  }
  return result;
}

unint64_t sub_2519E5338()
{
  unint64_t result = qword_269B998B8;
  if (!qword_269B998B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B998B8);
  }
  return result;
}

unint64_t sub_2519E5390()
{
  unint64_t result = qword_269B998C0;
  if (!qword_269B998C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B998C0);
  }
  return result;
}

unint64_t sub_2519E53E8()
{
  unint64_t result = qword_269B998C8;
  if (!qword_269B998C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B998C8);
  }
  return result;
}

unint64_t sub_2519E5440()
{
  unint64_t result = qword_269B998D0;
  if (!qword_269B998D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B998D0);
  }
  return result;
}

unint64_t sub_2519E5498()
{
  unint64_t result = qword_269B998D8;
  if (!qword_269B998D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B998D8);
  }
  return result;
}

unint64_t sub_2519E54F0()
{
  unint64_t result = qword_269B998E0;
  if (!qword_269B998E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B998E0);
  }
  return result;
}

uint64_t sub_2519E5544(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x636E75614C707061 && a2 == 0xE900000000000068;
  if (v3 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002519F1F80 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002519F1FA0 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000002519F1FC0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2519EEBB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_2519E56E4()
{
  return 12383;
}

uint64_t sub_2519E56F0(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2519EEBB0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t HomeTarget.hash(into:)()
{
  sub_2519EE4F0();
  sub_2519E5D80(&qword_269B998E8, MEMORY[0x263F07508]);

  return sub_2519EE9B0();
}

uint64_t HomeTarget.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2519EE4F0();
  char v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t HomeTarget.init(id:name:selectHomeAction:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2519EE4F0();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  type metadata accessor for HomeTarget(0);
  sub_2519EE5C0();
  sub_2519E5994();
  sub_2519EE550();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
}

uint64_t type metadata accessor for HomeTarget(uint64_t a1)
{
  return sub_2519E6A7C(a1, (uint64_t *)&unk_269B99990);
}

unint64_t sub_2519E5994()
{
  unint64_t result = qword_269B998F0;
  if (!qword_269B998F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B998F0);
  }
  return result;
}

uint64_t sub_2519E59D4(char a1)
{
  if (a1 == 2) {
    return 0xD000000000000010;
  }
  if (a1 == 1) {
    return 1701667182;
  }
  return 25705;
}

uint64_t sub_2519E5A28()
{
  return sub_2519E59D4(*v0);
}

uint64_t sub_2519E5A30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2519E901C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2519E5A58(uint64_t a1)
{
  unint64_t v2 = sub_2519E5D2C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519E5A94(uint64_t a1)
{
  unint64_t v2 = sub_2519E5D2C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HomeTarget.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B998F8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519E5D2C();
  sub_2519EEC00();
  v8[15] = 0;
  sub_2519EE4F0();
  sub_2519E5D80(&qword_269B99908, MEMORY[0x263F07508]);
  sub_2519EEBA0();
  if (!v1)
  {
    type metadata accessor for HomeTarget(0);
    v8[14] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    sub_2519D93B8(&qword_269B99560);
    sub_2519EEBA0();
    v8[13] = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
    sub_2519E65C8(&qword_269B99918);
    sub_2519EEBA0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2519E5D2C()
{
  unint64_t result = qword_269B99900;
  if (!qword_269B99900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99900);
  }
  return result;
}

uint64_t sub_2519E5D80(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t HomeTarget.hashValue.getter()
{
  return sub_2519EEBE0();
}

uint64_t HomeTarget.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  uint64_t v26 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v29 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v32 = *(void *)(v4 - 8);
  uint64_t v33 = v4;
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2519EE4F0();
  uint64_t v30 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v34 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99920);
  uint64_t v31 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for HomeTarget(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519E5D2C();
  uint64_t v35 = v10;
  uint64_t v14 = v37;
  sub_2519EEBF0();
  if (v14) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v15 = v31;
  uint64_t v16 = v32;
  uint64_t v25 = v11;
  uint64_t v37 = v13;
  uint64_t v17 = v33;
  char v40 = 0;
  sub_2519E5D80(&qword_269B99928, MEMORY[0x263F07508]);
  uint64_t v18 = v34;
  sub_2519EEB60();
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
  uint64_t v34 = (char *)v7;
  v19(v37, v18, v7);
  char v39 = 1;
  sub_2519D93B8(&qword_269B99578);
  uint64_t v20 = v6;
  sub_2519EEB60();
  uint64_t v21 = (uint64_t)v37;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(&v37[*(int *)(v25 + 20)], v20, v17);
  char v38 = 2;
  sub_2519E65C8(&qword_269B99930);
  uint64_t v22 = v28;
  sub_2519EEB60();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v35, v36);
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v21 + *(int *)(v25 + 24), v29, v22);
  sub_2519E7270(v21, v27, type metadata accessor for HomeTarget);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_2519E72D8(v21, type metadata accessor for HomeTarget);
}

uint64_t sub_2519E63A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2519EE4F0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_2519E6408@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeTarget.init(from:)(a1, a2);
}

uint64_t sub_2519E6420(void *a1)
{
  return HomeTarget.encode(to:)(a1);
}

uint64_t sub_2519E6438()
{
  return sub_2519EEBE0();
}

uint64_t sub_2519E64C0()
{
  sub_2519EE4F0();
  sub_2519E5D80(&qword_269B998E8, MEMORY[0x263F07508]);

  return sub_2519EE9B0();
}

uint64_t sub_2519E6544()
{
  return sub_2519EEBE0();
}

uint64_t sub_2519E65C8(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99910);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t static HomeDisambiguationModel.responseViewId.getter()
{
  return 0xD000000000000028;
}

unint64_t sub_2519E6630(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x67726154656D6F68;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x74706D6F7270;
      break;
    default:
      unint64_t result = 0x6449656C646E7562;
      break;
  }
  return result;
}

unint64_t sub_2519E66CC()
{
  return sub_2519E6630(*v0);
}

uint64_t sub_2519E66D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2519E9138(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2519E66FC(uint64_t a1)
{
  unint64_t v2 = sub_2519E6A08();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519E6738(uint64_t a1)
{
  unint64_t v2 = sub_2519E6A08();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HomeDisambiguationModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99938);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519E6A08();
  sub_2519EEC00();
  char v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519D93B8(&qword_269B99560);
  sub_2519EEBA0();
  if (!v1)
  {
    v8[1] = type metadata accessor for HomeDisambiguationModel(0);
    char v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
    sub_2519E7190(&qword_269B99948);
    sub_2519EEBA0();
    char v10 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    sub_2519D8E28(&qword_269B99568);
    sub_2519EEBA0();
    char v9 = 3;
    sub_2519EEBA0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2519E6A08()
{
  unint64_t result = qword_269B99940;
  if (!qword_269B99940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99940);
  }
  return result;
}

uint64_t type metadata accessor for HomeDisambiguationModel(uint64_t a1)
{
  return sub_2519E6A7C(a1, (uint64_t *)&unk_269B999A8);
}

uint64_t sub_2519E6A7C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2519E6AB4(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99958);
    sub_2519E5D80(a2, (void (*)(uint64_t))type metadata accessor for HomeTarget);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t HomeDisambiguationModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  uint64_t v39 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  char v38 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  uint64_t v44 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v43 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v41 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v46 = (char *)&v32 - v9;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99978);
  uint64_t v42 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  char v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for HomeDisambiguationModel(0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519E6A08();
  uint64_t v47 = v11;
  uint64_t v15 = (uint64_t)v49;
  sub_2519EEBF0();
  if (v15) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v36 = v8;
  uint64_t v16 = (int *)v12;
  uint64_t v17 = v14;
  uint64_t v49 = a1;
  uint64_t v18 = v43;
  uint64_t v19 = v44;
  uint64_t v20 = v45;
  char v53 = 0;
  uint64_t v21 = sub_2519D93B8(&qword_269B99578);
  sub_2519EEB60();
  uint64_t v34 = v21;
  uint64_t v35 = (uint64_t)v17;
  uint64_t v22 = (char *)v5;
  uint64_t v23 = *(void (**)(char *, char *))(v41 + 32);
  uint64_t v24 = v46;
  uint64_t v46 = v22;
  v23(v17, v24);
  char v52 = 1;
  sub_2519E7190(&qword_269B99980);
  uint64_t v25 = v18;
  uint64_t v26 = v40;
  sub_2519EEB60();
  uint64_t v33 = (void (*)(uint64_t, char *, char *))v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v35 + v16[5], v25, v26);
  char v51 = 2;
  sub_2519D8E28(&qword_269B99580);
  uint64_t v27 = v38;
  uint64_t v28 = v20;
  sub_2519EEB60();
  uint64_t v29 = v35;
  (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v35 + v16[6], v27, v28);
  char v50 = 3;
  uint64_t v30 = v46;
  sub_2519EEB60();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v47, v48);
  v33(v29 + v16[7], v36, v30);
  sub_2519E7270(v29, v37, type metadata accessor for HomeDisambiguationModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
  return sub_2519E72D8(v29, type metadata accessor for HomeDisambiguationModel);
}

uint64_t sub_2519E7190(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99858);
    sub_2519E6AB4(&qword_269B99950, &qword_269B99960);
    sub_2519E6AB4(&qword_269B99968, &qword_269B99970);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2519E7270(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2519E72D8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2519E7338()
{
  return sub_2519E5D80(&qword_269B99960, (void (*)(uint64_t))type metadata accessor for HomeTarget);
}

uint64_t sub_2519E7380()
{
  return sub_2519E5D80(&qword_269B99970, (void (*)(uint64_t))type metadata accessor for HomeTarget);
}

uint64_t sub_2519E73C8()
{
  return sub_2519E5D80(&qword_269B998E8, MEMORY[0x263F07508]);
}

uint64_t sub_2519E7410()
{
  return sub_2519E5D80(&qword_269B99988, (void (*)(uint64_t))type metadata accessor for HomeTarget);
}

uint64_t sub_2519E7458()
{
  return sub_2519E5D80(&qword_269B99840, (void (*)(uint64_t))type metadata accessor for HomeDisambiguationModel);
}

uint64_t sub_2519E74A0()
{
  return sub_2519E5D80(&qword_269B997F0, (void (*)(uint64_t))type metadata accessor for HomeDisambiguationModel);
}

uint64_t sub_2519E74E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return HomeDisambiguationModel.init(from:)(a1, a2);
}

uint64_t sub_2519E7500(void *a1)
{
  return HomeDisambiguationModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeTarget(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2519EE4F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (char *)a2 + v12;
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for HomeTarget(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2519EE4F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(v7, v8);
}

uint64_t initializeWithCopy for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2519EE4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2519EE4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2519EE4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2519EE4F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519E7BC4);
}

uint64_t sub_2519E7BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2519EE4F0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for HomeTarget(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519E7D2C);
}

uint64_t sub_2519E7D2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_2519EE4F0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

void sub_2519E7E8C()
{
  sub_2519EE4F0();
  if (v0 <= 0x3F)
  {
    sub_2519D9EE8(319, (unint64_t *)&qword_269B995A8);
    if (v1 <= 0x3F)
    {
      sub_2519E7FA0();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_2519E7FA0()
{
  if (!qword_269B999A0)
  {
    sub_2519E5994();
    unint64_t v0 = sub_2519EE570();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B999A0);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for HomeDisambiguationModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
  }
  return a1;
}

uint64_t destroy for HomeDisambiguationModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v11)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[7];

  return v11(v9, v4);
}

uint64_t initializeWithCopy for HomeDisambiguationModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t assignWithCopy for HomeDisambiguationModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t initializeWithTake for HomeDisambiguationModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t assignWithTake for HomeDisambiguationModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[6];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  v7(a1 + a3[7], a2 + a3[7], v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519E87B4);
}

uint64_t sub_2519E87B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for HomeDisambiguationModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519E8920);
}

uint64_t sub_2519E8920(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

void sub_2519E8A84()
{
  sub_2519D9EE8(319, (unint64_t *)&qword_269B995A8);
  if (v0 <= 0x3F)
  {
    sub_2519E8BA8();
    if (v1 <= 0x3F)
    {
      sub_2519D9EE8(319, &qword_269B995B0);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_2519E8BA8()
{
  if (!qword_269B999B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99958);
    unint64_t v0 = sub_2519EE600();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B999B8);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for HomeDisambiguationModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x2519E8CD0);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeDisambiguationModel.CodingKeys()
{
  return &type metadata for HomeDisambiguationModel.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for HomeTarget.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2519E8DD4);
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

ValueMetadata *type metadata accessor for HomeTarget.CodingKeys()
{
  return &type metadata for HomeTarget.CodingKeys;
}

unint64_t sub_2519E8E10()
{
  unint64_t result = qword_269B999C0;
  if (!qword_269B999C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B999C0);
  }
  return result;
}

unint64_t sub_2519E8E68()
{
  unint64_t result = qword_269B999C8;
  if (!qword_269B999C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B999C8);
  }
  return result;
}

unint64_t sub_2519E8EC0()
{
  unint64_t result = qword_269B999D0;
  if (!qword_269B999D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B999D0);
  }
  return result;
}

unint64_t sub_2519E8F18()
{
  unint64_t result = qword_269B999D8;
  if (!qword_269B999D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B999D8);
  }
  return result;
}

unint64_t sub_2519E8F70()
{
  unint64_t result = qword_269B999E0;
  if (!qword_269B999E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B999E0);
  }
  return result;
}

unint64_t sub_2519E8FC8()
{
  unint64_t result = qword_269B999E8;
  if (!qword_269B999E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B999E8);
  }
  return result;
}

uint64_t sub_2519E901C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002519F2010)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2519EEBB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2519E9138(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
  if (v3 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x67726154656D6F68 && a2 == 0xEB00000000737465 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002519F2030 || (sub_2519EEBB0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74706D6F7270 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_2519EEBB0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t HomeDisambiguationView.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2519EE9A0();
  sub_2519ECCD0((unint64_t *)&qword_269B99520, MEMORY[0x263F77980]);
  *a2 = sub_2519EE6C0();
  a2[1] = v4;
  uint64_t v5 = type metadata accessor for HomeDisambiguationView();
  sub_2519EE890();
  return sub_2519EC318(a1, (uint64_t)a2 + *(int *)(v5 + 24), type metadata accessor for HomeDisambiguationModel);
}

uint64_t type metadata accessor for HomeDisambiguationView()
{
  uint64_t result = qword_269B99A38;
  if (!qword_269B99A38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t HomeDisambiguationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v34 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B999F0);
  uint64_t v32 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v31 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B999F8);
  MEMORY[0x270FA5388](v35);
  char v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2519EE960();
  MEMORY[0x270FA5388](v7 - 8);
  v28[1] = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A00);
  uint64_t v30 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  uint64_t v29 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for HomeDisambiguationView();
  uint64_t v33 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v33 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (id *)((char *)v28 - v14);
  type metadata accessor for HomeDisambiguationModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  sub_2519EE5E0();
  int v16 = v40;
  sub_2519EBFB0(v2, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
  if (v16 == 1)
  {
    if (!*v15)
    {
      sub_2519EE9A0();
      sub_2519ECCD0((unint64_t *)&qword_269B99520, MEMORY[0x263F77980]);
      uint64_t result = sub_2519EE6B0();
      __break(1u);
      return result;
    }
    id v17 = *v15;
    sub_2519EE990();

    LOBYTE(v17) = sub_2519EEA30();
    sub_2519EC5B8((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
    if ((v17 & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      sub_2519EE5E0();
      uint64_t v41 = MEMORY[0x263F8D310];
      uint64_t v42 = MEMORY[0x263F77998];
      uint64_t v39 = 0;
      long long v37 = 0u;
      long long v38 = 0u;
      sub_2519EE950();
      sub_2519EBFB0(v2, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
      unint64_t v18 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
      uint64_t v19 = swift_allocObject();
      sub_2519EC318((uint64_t)v13, v19 + v18, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A28);
      sub_2519DD0BC(&qword_269B99A30, &qword_269B99A28);
      uint64_t v20 = v29;
      sub_2519EE900();
      uint64_t v21 = v30;
      uint64_t v22 = v36;
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v6, v20, v36);
      swift_storeEnumTagMultiPayload();
      sub_2519DD0BC(&qword_269B99A18, &qword_269B99A00);
      sub_2519DD0BC(&qword_269B99A20, &qword_269B999F0);
      sub_2519EE700();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v20, v22);
    }
  }
  else
  {
    sub_2519EC5B8((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
  }
  sub_2519EBFB0(v2, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
  unint64_t v24 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  uint64_t v25 = swift_allocObject();
  sub_2519EC318((uint64_t)v13, v25 + v24, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A08);
  sub_2519DD0BC(&qword_269B99A10, &qword_269B99A08);
  uint64_t v26 = v31;
  sub_2519EE8C0();
  uint64_t v27 = v32;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v6, v26, v3);
  swift_storeEnumTagMultiPayload();
  sub_2519DD0BC(&qword_269B99A18, &qword_269B99A00);
  sub_2519DD0BC(&qword_269B99A20, &qword_269B999F0);
  sub_2519EE700();
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v26, v3);
}

uint64_t sub_2519E9AFC@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v3 = type metadata accessor for HomeDisambiguationView();
  uint64_t v4 = *(void *)(v3 - 8);
  v28[1] = v3;
  uint64_t v29 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v30 = v5;
  uint64_t v31 = (uint64_t)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2519EE8E0();
  v28[0] = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99610);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A90);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  int v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)v28 - v17;
  if (*a1)
  {
    id v19 = *a1;
    sub_2519EE990();

    if (sub_2519EEA30())
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v18, 1, 1, v9);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
      sub_2519EE5E0();
      sub_2519EE8F0();
      sub_2519ECCD0(&qword_269B99618, MEMORY[0x263F776B8]);
      sub_2519EE7D0();
      (*(void (**)(char *, uint64_t))(v28[0] + 8))(v8, v6);
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v12, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
    }
    type metadata accessor for HomeDisambiguationModel(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
    sub_2519EE5E0();
    uint64_t v20 = v33;
    uint64_t v21 = (uint64_t)a1;
    uint64_t v22 = v31;
    sub_2519EBFB0(v21, v31, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
    unint64_t v23 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
    uint64_t v24 = swift_allocObject();
    sub_2519EC318(v22, v24 + v23, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
    sub_2519ECF9C((uint64_t)v18, (uint64_t)v16);
    uint64_t v25 = v32;
    sub_2519ECF9C((uint64_t)v16, v32);
    uint64_t v26 = (void *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269B99A98) + 48));
    *uint64_t v26 = v20;
    v26[1] = sub_2519EBFAC;
    v26[2] = v24;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2519DD250((uint64_t)v18, &qword_269B99A90);
    swift_release();
    swift_bridgeObjectRelease();
    return sub_2519DD250((uint64_t)v16, &qword_269B99A90);
  }
  else
  {
    sub_2519EE9A0();
    sub_2519ECCD0((unint64_t *)&qword_269B99520, MEMORY[0x263F77980]);
    uint64_t result = sub_2519EE6B0();
    __break(1u);
  }
  return result;
}

uint64_t sub_2519E9FD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for HomeDisambiguationView() - 8);
  uint64_t v4 = (id *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)));

  return sub_2519E9AFC(v4, a1);
}

uint64_t sub_2519EA040@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for HomeDisambiguationView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  type metadata accessor for HomeDisambiguationModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  sub_2519EE5E0();
  uint64_t v7 = v11[1];
  sub_2519EBFB0(a1, (uint64_t)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  uint64_t result = sub_2519EC318((uint64_t)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
  *a2 = v7;
  a2[1] = sub_2519EBFAC;
  a2[2] = v9;
  return result;
}

uint64_t sub_2519EA1A4@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for HomeDisambiguationView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_2519EA040(v4, a1);
}

uint64_t sub_2519EA214()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2519EA230@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v52 = a4;
  uint64_t v6 = sub_2519EE540();
  uint64_t v49 = *(void *)(v6 - 8);
  uint64_t v50 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v48 = (uint64_t)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for HomeDisambiguationView();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v41 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v38 = (uint64_t)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for HomeTarget(0);
  uint64_t v37 = *(void *)(v10 - 8);
  uint64_t v11 = *(void *)(v37 + 64);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_2519EE920();
  uint64_t v42 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A58);
  uint64_t v45 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  int v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A60);
  uint64_t v46 = *(void *)(v17 - 8);
  uint64_t v47 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v40 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A68);
  MEMORY[0x270FA5388](v44);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  sub_2519EE5E0();
  uint64_t v79 = MEMORY[0x263F8D310];
  uint64_t v80 = MEMORY[0x263F77998];
  uint64_t v76 = 0;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v73 = 0;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v70 = 0;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v67 = 0;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v64 = 0;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v55 = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  sub_2519EE910();
  sub_2519EBFB0(a2, (uint64_t)v12, type metadata accessor for HomeTarget);
  uint64_t v21 = v38;
  sub_2519EBFB0(a3, v38, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
  unint64_t v22 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  unint64_t v23 = (v11 + *(unsigned __int8 *)(v41 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v24 = swift_allocObject();
  sub_2519EC318((uint64_t)v12, v24 + v22, type metadata accessor for HomeTarget);
  sub_2519EC318(v21, v24 + v23, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
  uint64_t v25 = sub_2519ECCD0(&qword_269B99A70, MEMORY[0x263F77720]);
  uint64_t v26 = v39;
  sub_2519EE770();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v14, v26);
  uint64_t v27 = v48;
  sub_2519EAF28(v48);
  uint64_t v77 = v26;
  uint64_t v78 = v25;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v40;
  uint64_t v29 = v43;
  sub_2519EE760();
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v27, v50);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v16, v29);
  LOBYTE(v29) = v51 == 0;
  sub_2519EE9A0();
  sub_2519ECCD0((unint64_t *)&qword_269B99520, MEMORY[0x263F77980]);
  uint64_t v30 = sub_2519EE6C0();
  uint64_t v32 = v31;
  uint64_t v34 = v46;
  uint64_t v33 = v47;
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v20, v28, v47);
  uint64_t v35 = &v20[*(int *)(v44 + 36)];
  *(void *)uint64_t v35 = v30;
  *((void *)v35 + 1) = v32;
  v35[16] = v29;
  (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v33);
  sub_2519EC44C();
  sub_2519EE7D0();
  return sub_2519DD250((uint64_t)v20, &qword_269B99A68);
}

uint64_t sub_2519EA914(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99670);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v35 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99678);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v34 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99680);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for HomeTarget(0);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2519EE520();
  uint64_t v38 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99688);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2519EF2F0;
  uint64_t v17 = sub_2519EE590();
  uint64_t v18 = MEMORY[0x263F771C8];
  *(void *)(v16 + 56) = v17;
  *(void *)(v16 + 64) = v18;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v16 + 32));
  v33[1] = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  uint64_t *boxed_opaque_existential_1 = sub_2519EE560();
  *((unsigned char *)boxed_opaque_existential_1 + 8) = 0;
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v17 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x263F771A0], v17);
  uint64_t v36 = v15;
  sub_2519EE530();
  if (qword_269B99500 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_2519EE640();
  __swift_project_value_buffer(v20, (uint64_t)qword_269B99AB8);
  sub_2519EBFB0(a1, (uint64_t)v12, type metadata accessor for HomeTarget);
  uint64_t v21 = sub_2519EE620();
  os_log_type_t v22 = sub_2519EEA20();
  if (os_log_type_enabled(v21, v22))
  {
    unint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    uint64_t v41 = v24;
    *(_DWORD *)unint64_t v23 = 136315138;
    v33[0] = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    sub_2519EE5E0();
    uint64_t v39 = sub_2519EC618(v39, v40, &v41);
    uint64_t v13 = v33[0];
    sub_2519EEA50();
    swift_bridgeObjectRelease();
    sub_2519EC5B8((uint64_t)v12, type metadata accessor for HomeTarget);
    _os_log_impl(&dword_2519D6000, v21, v22, "#HomeDisambiguationView target tapped, performing direct action for %s.", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2533A9370](v24, -1, -1);
    MEMORY[0x2533A9370](v23, -1, -1);
  }
  else
  {
    sub_2519EC5B8((uint64_t)v12, type metadata accessor for HomeTarget);
  }

  type metadata accessor for HomeDisambiguationView();
  sub_2519EE880();
  uint64_t v25 = sub_2519EE980();
  uint64_t v26 = *(void *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v9, 1, v25) == 1)
  {
    (*(void (**)(char *, uint64_t))(v38 + 8))(v36, v13);
    return sub_2519DD250((uint64_t)v9, &qword_269B99680);
  }
  else
  {
    uint64_t v28 = v38;
    uint64_t v29 = (uint64_t)v34;
    uint64_t v30 = v36;
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v34, v36, v13);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v29, 0, 1, v13);
    uint64_t v31 = sub_2519EE8D0();
    uint64_t v32 = (uint64_t)v35;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v35, 1, 1, v31);
    sub_2519EE970();
    sub_2519DD250(v32, &qword_269B99670);
    sub_2519DD250(v29, &qword_269B99678);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v13);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v9, v25);
  }
}

uint64_t sub_2519EAF28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v4 = type metadata accessor for HomeDisambiguationView();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (id *)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (*v1)
  {
    id v7 = *v1;
    sub_2519EE990();

    LOBYTE(v7) = sub_2519EEA30();
    sub_2519EBFB0(v2, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
    if (v7)
    {
      sub_2519EC5B8((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
      goto LABEL_6;
    }
    if (*v6)
    {
      id v8 = *v6;
      sub_2519EE990();

      LOBYTE(v8) = sub_2519EEA40();
      sub_2519EC5B8((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HomeDisambiguationView);
      if ((v8 & 1) == 0)
      {
        uint64_t v9 = (unsigned int *)MEMORY[0x263F76970];
        goto LABEL_8;
      }
LABEL_6:
      uint64_t v9 = (unsigned int *)MEMORY[0x263F76980];
LABEL_8:
      uint64_t v10 = *v9;
      uint64_t v11 = sub_2519EE540();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104))(a1, v10, v11);
    }
  }
  sub_2519EE9A0();
  sub_2519ECCD0((unint64_t *)&qword_269B99520, MEMORY[0x263F77980]);
  uint64_t result = sub_2519EE6B0();
  __break(1u);
  return result;
}

char *initializeBufferWithCopyOfBuffer for HomeDisambiguationView(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    id v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    id v7 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_2519EE8A0();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    uint64_t v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = &v7[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
    v18(v15, v16, v17);
    uint64_t v19 = (int *)type metadata accessor for HomeDisambiguationModel(0);
    uint64_t v20 = v19[5];
    uint64_t v21 = &v15[v20];
    uint64_t v22 = v16 + v20;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = v19[6];
    uint64_t v25 = &v15[v24];
    uint64_t v26 = v16 + v24;
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
    v18(&v15[v19[7]], v16 + v19[7], v17);
  }
  return v7;
}

uint64_t destroy for HomeDisambiguationView(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_2519EE8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v15)((void *)(v7 - 8), v6, v7);
  uint64_t v8 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  uint64_t v9 = &v6[v8[5]];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = &v6[v8[6]];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = &v6[v8[7]];

  return v15(v13, v7);
}

void *initializeWithCopy for HomeDisambiguationView(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_2519EE8A0();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  id v13 = v7;
  v12(v9, v10, v11);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
  v18(v15, v16, v17);
  uint64_t v19 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  uint64_t v20 = v19[5];
  uint64_t v21 = &v15[v20];
  uint64_t v22 = v16 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  uint64_t v24 = v19[6];
  uint64_t v25 = &v15[v24];
  uint64_t v26 = v16 + v24;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  v18(&v15[v19[7]], v16 + v19[7], v17);
  return a1;
}

uint64_t assignWithCopy for HomeDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_2519EE8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24);
  v17(v14, v15, v16);
  uint64_t v18 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  uint64_t v19 = v18[5];
  uint64_t v20 = v14 + v19;
  uint64_t v21 = v15 + v19;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  uint64_t v23 = v18[6];
  uint64_t v24 = v14 + v23;
  uint64_t v25 = v15 + v23;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 24))(v24, v25, v26);
  v17(v14 + v18[7], v15 + v18[7], v16);
  return a1;
}

_OWORD *initializeWithTake for HomeDisambiguationView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2519EE8A0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  uint64_t v15 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  uint64_t v16 = v15[5];
  uint64_t v17 = &v11[v16];
  uint64_t v18 = &v12[v16];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  uint64_t v20 = v15[6];
  uint64_t v21 = &v11[v20];
  uint64_t v22 = &v12[v20];
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
  v14(&v11[v15[7]], &v12[v15[7]], v13);
  return a1;
}

uint64_t assignWithTake for HomeDisambiguationView(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2519EE8A0();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v15 = *(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  uint64_t v16 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  uint64_t v17 = v16[5];
  uint64_t v18 = v12 + v17;
  uint64_t v19 = &v13[v17];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = v16[6];
  uint64_t v22 = v12 + v21;
  uint64_t v23 = &v13[v21];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  v15(v12 + v16[7], &v13[v16[7]], v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2519EBB94);
}

uint64_t sub_2519EBB94(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_2519EE8A0();
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = type metadata accessor for HomeDisambiguationModel(0);
      uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = (char *)a1 + *(int *)(a3 + 24);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t storeEnumTagSinglePayload for HomeDisambiguationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2519EBCE0);
}

void *sub_2519EBCE0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v8 = sub_2519EE8A0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = type metadata accessor for HomeDisambiguationModel(0);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_2519EBE0C()
{
  uint64_t result = sub_2519EE8A0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for HomeDisambiguationModel(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

unint64_t sub_2519EBEE4()
{
  unint64_t result = qword_269B99A48;
  if (!qword_269B99A48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99A50);
    sub_2519DD0BC(&qword_269B99A18, &qword_269B99A00);
    sub_2519DD0BC(&qword_269B99A20, &qword_269B999F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99A48);
  }
  return result;
}

uint64_t sub_2519EBFB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2519EC018()
{
  unint64_t v1 = (int *)(type metadata accessor for HomeTarget(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = *(void *)(*(void *)v1 + 64);
  uint64_t v4 = (int *)(type metadata accessor for HomeDisambiguationView() - 8);
  unint64_t v5 = (v2 + v3 + *(unsigned __int8 *)(*(void *)v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v4 + 80);
  uint64_t v6 = v0 + v2;
  uint64_t v7 = sub_2519EE4F0();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v0 + v2, v7);
  unint64_t v8 = v0 + v2 + v1[7];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  uint64_t v10 = *(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  uint64_t v11 = v6 + v1[8];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99910);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = (id *)(v0 + v5);

  uint64_t v14 = (char *)v13 + v4[7];
  uint64_t v15 = sub_2519EE8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = (char *)v13 + v4[8];
  v10((unint64_t)v16, v9);
  uint64_t v17 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  uint64_t v18 = &v16[v17[5]];
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(char *, uint64_t))(*(void *)(v19 - 8) + 8))(v18, v19);
  uint64_t v20 = &v16[v17[6]];
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  v10((unint64_t)&v16[v17[7]], v9);

  return swift_deallocObject();
}

uint64_t sub_2519EC318(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2519EC380()
{
  uint64_t v1 = *(void *)(type metadata accessor for HomeTarget(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(type metadata accessor for HomeDisambiguationView() - 8);
  uint64_t v5 = v0 + ((v2 + v3 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return sub_2519EA914(v0 + v2, v5);
}

unint64_t sub_2519EC44C()
{
  unint64_t result = qword_269B99A78;
  if (!qword_269B99A78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99A68);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99A58);
    sub_2519EE920();
    sub_2519ECCD0(&qword_269B99A70, MEMORY[0x263F77720]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_2519EC564();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99A78);
  }
  return result;
}

unint64_t sub_2519EC564()
{
  unint64_t result = qword_269B99A80;
  if (!qword_269B99A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99A80);
  }
  return result;
}

uint64_t sub_2519EC5B8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2519EC618(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2519EC6EC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2519ECC70((uint64_t)v12, *a3);
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
      sub_2519ECC70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2519EC6EC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2519EEA60();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2519EC8A8(a5, a6);
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
  uint64_t v8 = sub_2519EEAD0();
  if (!v8)
  {
    sub_2519EEAF0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2519EEB20();
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

uint64_t sub_2519EC8A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2519EC940(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2519ECB20(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2519ECB20(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2519EC940(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2519ECAB8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2519EEAA0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2519EEAF0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2519EE9E0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2519EEB20();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2519EEAF0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2519ECAB8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A88);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2519ECB20(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A88);
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
  uint64_t result = sub_2519EEB20();
  __break(1u);
  return result;
}

uint64_t sub_2519ECC70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2519ECCD0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = (int *)(type metadata accessor for HomeDisambiguationView() - 8);
  uint64_t v2 = (id *)(v0
            + ((*(unsigned __int8 *)(*(void *)v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80)));

  uint64_t v3 = (char *)v2 + v1[7];
  uint64_t v4 = sub_2519EE8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  size_t v5 = (char *)v2 + v1[8];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99540);
  int64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  int64_t v8 = (int *)type metadata accessor for HomeDisambiguationModel(0);
  int64_t v9 = &v5[v8[5]];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99858);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  size_t v11 = &v5[v8[6]];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99548);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v7(&v5[v8[7]], v6);

  return swift_deallocObject();
}

uint64_t sub_2519ECF14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void *)(type metadata accessor for HomeDisambiguationView() - 8);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_2519EA230(a1, a2, v8, a3);
}

uint64_t sub_2519ECF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99A90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2519ED004(uint64_t a1)
{
  return sub_2519ED070(a1, qword_269B99AA0);
}

uint64_t static Logger.siriHomeCommunicationUIFramework.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2519ED10C(&qword_269B994F8, (uint64_t)qword_269B99AA0, a1);
}

uint64_t sub_2519ED04C(uint64_t a1)
{
  return sub_2519ED070(a1, qword_269B99AB8);
}

uint64_t sub_2519ED070(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2519EE640();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2519EE630();
}

uint64_t static Logger.siriHomeCommunicationUIPlugin.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2519ED10C(&qword_269B99500, (uint64_t)qword_269B99AB8, a1);
}

uint64_t sub_2519ED10C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2519EE640();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
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

unint64_t static SendAnnouncementNeedsValueModel.responseViewId.getter()
{
  return 0xD000000000000026;
}

HomeCommunicationUIFramework::SendAnnouncementNeedsValueModel __swiftcall SendAnnouncementNeedsValueModel.init(targetName:)(HomeCommunicationUIFramework::SendAnnouncementNeedsValueModel targetName)
{
  *uint64_t v1 = targetName;
  return targetName;
}

uint64_t sub_2519ED240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2519EDA8C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2519ED26C(uint64_t a1)
{
  unint64_t v2 = sub_2519ED41C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2519ED2A8(uint64_t a1)
{
  unint64_t v2 = sub_2519ED41C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SendAnnouncementNeedsValueModel.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99AD0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519ED41C();
  sub_2519EEC00();
  sub_2519EEB90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_2519ED41C()
{
  unint64_t result = qword_269B99AD8;
  if (!qword_269B99AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99AD8);
  }
  return result;
}

uint64_t SendAnnouncementNeedsValueModel.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99AE0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519ED41C();
  sub_2519EEBF0();
  if (!v2)
  {
    uint64_t v9 = sub_2519EEB50();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2519ED5E8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return SendAnnouncementNeedsValueModel.init(from:)(a1, a2);
}

uint64_t sub_2519ED600(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269B99AD0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2519ED41C();
  sub_2519EEC00();
  sub_2519EEB90();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *initializeBufferWithCopyOfBuffer for SendAnnouncementNeedsValueModel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SendAnnouncementNeedsValueModel()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for SendAnnouncementNeedsValueModel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for SendAnnouncementNeedsValueModel(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SendAnnouncementNeedsValueModel(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SendAnnouncementNeedsValueModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SendAnnouncementNeedsValueModel()
{
  return &type metadata for SendAnnouncementNeedsValueModel;
}

unsigned char *storeEnumTagSinglePayload for SendAnnouncementNeedsValueModel.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2519ED94CLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SendAnnouncementNeedsValueModel.CodingKeys()
{
  return &type metadata for SendAnnouncementNeedsValueModel.CodingKeys;
}

unint64_t sub_2519ED988()
{
  unint64_t result = qword_269B99AE8;
  if (!qword_269B99AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99AE8);
  }
  return result;
}

unint64_t sub_2519ED9E0()
{
  unint64_t result = qword_269B99AF0;
  if (!qword_269B99AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99AF0);
  }
  return result;
}

unint64_t sub_2519EDA38()
{
  unint64_t result = qword_269B99AF8;
  if (!qword_269B99AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99AF8);
  }
  return result;
}

uint64_t sub_2519EDA8C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x614E746567726174 && a2 == 0xEA0000000000656DLL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_2519EEBB0();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_2519EDB1C()
{
  return 0x614E746567726174;
}

HomeCommunicationUIFramework::SendAnnouncementView __swiftcall SendAnnouncementView.init(model:)(HomeCommunicationUIFramework::SendAnnouncementView model)
{
  *uint64_t v1 = *(_OWORD *)model.model.targetName.value._countAndFlagsBits;
  return model;
}

double SendAnnouncementView.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  unint64_t v4 = v1[1];
  uint64_t v35 = sub_2519EE6F0();
  sub_2519EDDB0(v3, v4, (uint64_t)v42);
  *(_OWORD *)&v44[119] = v42[7];
  *(_OWORD *)&v44[135] = v42[8];
  *(_OWORD *)&v44[151] = v42[9];
  *(_OWORD *)&v44[55] = v42[3];
  *(_OWORD *)&v44[71] = v42[4];
  *(_OWORD *)&v44[87] = v42[5];
  *(_OWORD *)&v44[103] = v42[6];
  *(_OWORD *)&v44[7] = v42[0];
  *(_OWORD *)&v44[23] = v42[1];
  char v45 = 1;
  v44[167] = v43;
  *(_OWORD *)&v44[39] = v42[2];
  uint64_t v34 = sub_2519EE7E0();
  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_mainScreen);
  objc_msgSend(v6, sel_applicationFrame);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v48.origin.x = v8;
  v48.origin.y = v10;
  v48.size.width = v12;
  v48.size.height = v14;
  CGRectGetWidth(v48);
  id v15 = objc_msgSend(v5, sel_mainScreen);
  objc_msgSend(v15, sel_applicationFrame);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v49.origin.x = v17;
  v49.origin.y = v19;
  v49.size.width = v21;
  v49.size.height = v23;
  CGRectGetHeight(v49);
  sub_2519EE850();
  sub_2519EE690();
  char v47 = v37;
  char v46 = v39;
  uint64_t v24 = sub_2519EE6A0();
  LOBYTE(v6) = sub_2519EE710();
  LOBYTE(v3) = v47;
  char v25 = v46;
  uint64_t v26 = sub_2519EE7F0();
  char v27 = sub_2519EE710();
  long long v28 = *(_OWORD *)&v44[96];
  *(_OWORD *)(a1 + 129) = *(_OWORD *)&v44[112];
  long long v29 = *(_OWORD *)&v44[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v44[128];
  *(_OWORD *)(a1 + 161) = v29;
  long long v30 = *(_OWORD *)&v44[32];
  *(_OWORD *)(a1 + 65) = *(_OWORD *)&v44[48];
  long long v31 = *(_OWORD *)&v44[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v44[64];
  *(_OWORD *)(a1 + 97) = v31;
  *(_OWORD *)(a1 + 113) = v28;
  double result = *(double *)v44;
  long long v33 = *(_OWORD *)&v44[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v44;
  *(_OWORD *)(a1 + 33) = v33;
  *(void *)a1 = v35;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 177) = *(void *)&v44[160];
  *(_OWORD *)(a1 + 49) = v30;
  *(void *)(a1 + 192) = v34;
  *(void *)(a1 + 200) = v36;
  *(unsigned char *)(a1 + 208) = v3;
  *(void *)(a1 + 216) = v38;
  *(unsigned char *)(a1 + 224) = v25;
  *(void *)(a1 + 232) = v40;
  *(void *)(a1 + 240) = v41;
  *(void *)(a1 + 248) = v24;
  *(unsigned char *)(a1 + 256) = (_BYTE)v6;
  *(void *)(a1 + 264) = v26;
  *(unsigned char *)(a1 + 272) = v27;
  return result;
}

uint64_t sub_2519EDDB0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B99B70);
  MEMORY[0x270FA5388](v6 - 8);
  CGFloat v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 1];
  uint64_t v9 = 0x6568777972657645;
  if (a2) {
    uint64_t v9 = a1;
  }
  unint64_t v10 = 0xEA00000000006572;
  if (a2) {
    unint64_t v10 = a2;
  }
  uint64_t v39 = v9;
  unint64_t v40 = v10;
  sub_2519DD1B4();
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_2519EE750();
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  char v18 = sub_2519EE720();
  sub_2519EE650();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  v15 &= 1u;
  uint64_t v27 = sub_2519EE800();
  uint64_t v28 = sub_2519EE730();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v8, 1, 1, v28);
  uint64_t v29 = sub_2519EE740();
  sub_2519EE3F8((uint64_t)v8);
  uint64_t KeyPath = swift_getKeyPath();
  char v38 = v15;
  char v36 = 0;
  char v34 = 1;
  char v32 = 1;
  *(_DWORD *)(a3 + 17) = v39;
  *(_DWORD *)(a3 + 20) = *(_DWORD *)((char *)&v39 + 3);
  *(_DWORD *)(a3 + 33) = *(_DWORD *)v37;
  *(_DWORD *)(a3 + 36) = *(_DWORD *)&v37[3];
  *(_DWORD *)(a3 + 73) = *(_DWORD *)v35;
  *(_DWORD *)(a3 + 76) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a3 + 89) = *(_DWORD *)v33;
  *(_DWORD *)(a3 + 92) = *(_DWORD *)&v33[3];
  *(void *)a3 = v11;
  *(void *)(a3 + 8) = v13;
  *(unsigned char *)(a3 + 16) = v15;
  *(void *)(a3 + 24) = v17;
  *(unsigned char *)(a3 + 32) = v18;
  *(void *)(a3 + 40) = v20;
  *(void *)(a3 + 48) = v22;
  *(void *)(a3 + 56) = v24;
  *(void *)(a3 + 64) = v26;
  *(unsigned char *)(a3 + 72) = 0;
  *(void *)(a3 + 80) = 0;
  *(unsigned char *)(a3 + 88) = 1;
  *(void *)(a3 + 96) = v27;
  *(void *)(a3 + 104) = KeyPath;
  *(void *)(a3 + 112) = v29;
  *(void *)(a3 + 120) = sub_2519EE0BC;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_OWORD *)(a3 + 144) = 0u;
  *(unsigned char *)(a3 + 160) = 1;
  sub_2519EE4B0(v11, v13, v15);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2519EE4C0((uint64_t)sub_2519EE0BC);
  sub_2519EE4C0(0);
  swift_release();
  swift_release();
  swift_release();
  sub_2519EE4D0((uint64_t)sub_2519EE0BC);
  sub_2519EE4D0(0);
  sub_2519DD208(v11, v13, v15);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2519EE0A0()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2519EE0BC()
{
  if (qword_269B99500 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2519EE640();
  __swift_project_value_buffer(v0, (uint64_t)qword_269B99AB8);
  oslog = sub_2519EE620();
  os_log_type_t v1 = sub_2519EEA20();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_2519D6000, oslog, v1, "WAVEFORM!!", v2, 2u);
    MEMORY[0x2533A9370](v2, -1, -1);
  }
}

ValueMetadata *type metadata accessor for SendAnnouncementView()
{
  return &type metadata for SendAnnouncementView;
}

unint64_t sub_2519EE1BC()
{
  unint64_t result = qword_269B99B00;
  if (!qword_269B99B00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99B08);
    sub_2519EE2B8(&qword_269B99B10, &qword_269B99B18, (void (*)(void))sub_2519EE288);
    sub_2519DD0BC(&qword_269B99B60, &qword_269B99B68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99B00);
  }
  return result;
}

uint64_t sub_2519EE288()
{
  return sub_2519EE2B8(&qword_269B99B20, &qword_269B99B28, (void (*)(void))sub_2519EE334);
}

uint64_t sub_2519EE2B8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2519EE334()
{
  unint64_t result = qword_269B99B30;
  if (!qword_269B99B30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269B99B38);
    sub_2519DD0BC(&qword_269B99B40, &qword_269B99B48);
    sub_2519DD0BC(&qword_269B99B50, &qword_269B99B58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B99B30);
  }
  return result;
}

uint64_t sub_2519EE3F8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269B99B70);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2519EE458@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2519EE6D0();
  *a1 = result;
  return result;
}

uint64_t sub_2519EE484()
{
  return sub_2519EE6E0();
}

uint64_t sub_2519EE4B0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_2519EE4C0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_2519EE4D0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t _s28HomeCommunicationUIFramework0A6TargetV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2519EE4F0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2519EE500()
{
  return MEMORY[0x270F73A60]();
}

uint64_t sub_2519EE510()
{
  return MEMORY[0x270F73A80]();
}

uint64_t sub_2519EE520()
{
  return MEMORY[0x270F74128]();
}

uint64_t sub_2519EE530()
{
  return MEMORY[0x270F74148]();
}

uint64_t sub_2519EE540()
{
  return MEMORY[0x270F741F0]();
}

uint64_t sub_2519EE550()
{
  return MEMORY[0x270F74438]();
}

uint64_t sub_2519EE560()
{
  return MEMORY[0x270F74448]();
}

uint64_t sub_2519EE570()
{
  return MEMORY[0x270F74458]();
}

uint64_t sub_2519EE580()
{
  return MEMORY[0x270F755B8]();
}

uint64_t sub_2519EE590()
{
  return MEMORY[0x270F755D0]();
}

uint64_t sub_2519EE5A0()
{
  return MEMORY[0x270F75648]();
}

uint64_t sub_2519EE5B0()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_2519EE5C0()
{
  return MEMORY[0x270F756A0]();
}

uint64_t sub_2519EE5D0()
{
  return MEMORY[0x270F756A8]();
}

uint64_t sub_2519EE5E0()
{
  return MEMORY[0x270F756B0]();
}

uint64_t sub_2519EE5F0()
{
  return MEMORY[0x270F756B8]();
}

uint64_t sub_2519EE600()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_2519EE610()
{
  return MEMORY[0x270F729E8]();
}

uint64_t sub_2519EE620()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2519EE630()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2519EE640()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2519EE650()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2519EE660()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_2519EE670()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_2519EE680()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_2519EE690()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2519EE6A0()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_2519EE6B0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_2519EE6C0()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_2519EE6D0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_2519EE6E0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_2519EE6F0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2519EE700()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2519EE710()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2519EE720()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2519EE730()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_2519EE740()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_2519EE750()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2519EE760()
{
  return MEMORY[0x270F759A0]();
}

uint64_t sub_2519EE770()
{
  return MEMORY[0x270F759D8]();
}

uint64_t sub_2519EE780()
{
  return MEMORY[0x270F759E0]();
}

uint64_t sub_2519EE790()
{
  return MEMORY[0x270F75A00]();
}

uint64_t sub_2519EE7A0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2519EE7B0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2519EE7C0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2519EE7D0()
{
  return MEMORY[0x270F038B8]();
}

uint64_t sub_2519EE7E0()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2519EE7F0()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_2519EE800()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2519EE810()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_2519EE820()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_2519EE830()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2519EE840()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_2519EE850()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2519EE860()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_2519EE870()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_2519EE880()
{
  return MEMORY[0x270F75B90]();
}

uint64_t sub_2519EE890()
{
  return MEMORY[0x270F75BA8]();
}

uint64_t sub_2519EE8A0()
{
  return MEMORY[0x270F75BB8]();
}

uint64_t sub_2519EE8B0()
{
  return MEMORY[0x270F75C18]();
}

uint64_t sub_2519EE8C0()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_2519EE8D0()
{
  return MEMORY[0x270F75C68]();
}

uint64_t sub_2519EE8E0()
{
  return MEMORY[0x270F75D18]();
}

uint64_t sub_2519EE8F0()
{
  return MEMORY[0x270F75D28]();
}

uint64_t sub_2519EE900()
{
  return MEMORY[0x270F75D90]();
}

uint64_t sub_2519EE910()
{
  return MEMORY[0x270F75DB8]();
}

uint64_t sub_2519EE920()
{
  return MEMORY[0x270F75DC0]();
}

uint64_t sub_2519EE930()
{
  return MEMORY[0x270F75DE8]();
}

uint64_t sub_2519EE940()
{
  return MEMORY[0x270F75DF8]();
}

uint64_t sub_2519EE950()
{
  return MEMORY[0x270F75E08]();
}

uint64_t sub_2519EE960()
{
  return MEMORY[0x270F75E18]();
}

uint64_t sub_2519EE970()
{
  return MEMORY[0x270F75EF0]();
}

uint64_t sub_2519EE980()
{
  return MEMORY[0x270F75F00]();
}

uint64_t sub_2519EE990()
{
  return MEMORY[0x270F76198]();
}

uint64_t sub_2519EE9A0()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_2519EE9B0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2519EE9C0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2519EE9D0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2519EE9E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2519EE9F0()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_2519EEA00()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2519EEA10()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_2519EEA20()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2519EEA30()
{
  return MEMORY[0x270F762F8]();
}

uint64_t sub_2519EEA40()
{
  return MEMORY[0x270F76300]();
}

uint64_t sub_2519EEA50()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2519EEA60()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2519EEA70()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2519EEA80()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2519EEA90()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2519EEAA0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2519EEAB0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_2519EEAC0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_2519EEAD0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2519EEAE0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2519EEAF0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2519EEB00()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_2519EEB10()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2519EEB20()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2519EEB30()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_2519EEB40()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_2519EEB50()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2519EEB60()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2519EEB70()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_2519EEB80()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_2519EEB90()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2519EEBA0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2519EEBB0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2519EEBC0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2519EEBD0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2519EEBE0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2519EEBF0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2519EEC00()
{
  return MEMORY[0x270F9FD98]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

void objc_release(id a1)
{
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}