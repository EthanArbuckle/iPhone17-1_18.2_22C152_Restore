uint64_t TrunkStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24983A568(a1, a2);
}

uint64_t sub_24983A568(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double TrunkStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  sub_2498638A0();
  sub_24983A824();
  uint64_t v2 = sub_249863490();
  uint64_t v4 = v3;
  uint64_t v5 = swift_bridgeObjectRetain();
  double result = 3.89653885e233;
  *(_OWORD *)a1 = xmmword_2498640D0;
  *(_OWORD *)(a1 + 16) = xmmword_2498640E0;
  *(_WORD *)(a1 + 32) = 384;
  *(unsigned char *)(a1 + 34) = 0;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = v8;
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = v7;
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = 0xD00000000000003DLL;
  *(void *)(a1 + 128) = 0x80000002498669E0;
  *(void *)(a1 + 136) = v7;
  *(void *)(a1 + 144) = v8;
  *(void *)(a1 + 152) = v7;
  *(void *)(a1 + 160) = v8;
  *(unsigned char *)(a1 + 168) = v7;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = v7;
  *(void *)(a1 + 192) = v5;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = v2;
  *(void *)(a1 + 216) = v4;
  return result;
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

unint64_t sub_24983A824()
{
  unint64_t result = qword_2696D7B20;
  if (!qword_2696D7B20)
  {
    sub_2498638A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7B20);
  }
  return result;
}

uint64_t sub_24983A87C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24983A8A0()
{
  return sub_249863630();
}

uint64_t *initializeBufferWithCopyOfBuffer for TrunkStatusSnippet(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = (int *)v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + v6[5]), (uint64_t *)((char *)a2 + v6[5]), v7);
    v8((uint64_t *)((char *)a1 + v6[6]), (uint64_t *)((char *)a2 + v6[6]), v7);
    v8((uint64_t *)((char *)a1 + v6[7]), (uint64_t *)((char *)a2 + v6[7]), v7);
    v8((uint64_t *)((char *)a1 + v6[8]), (uint64_t *)((char *)a2 + v6[8]), v7);
    uint64_t v9 = v6[9];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    v8((uint64_t *)((char *)a1 + v6[10]), (uint64_t *)((char *)a2 + v6[10]), v7);
    uint64_t v13 = v6[11];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for TrunkStatusSnippet(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(a1, v2);
  uint64_t v4 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v3(a1 + v4[5], v2);
  v3(a1 + v4[6], v2);
  v3(a1 + v4[7], v2);
  v3(a1 + v4[8], v2);
  uint64_t v5 = a1 + v4[9];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v3(a1 + v4[10], v2);
  uint64_t v7 = a1 + v4[11];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  return v9(v7, v8);
}

uint64_t initializeWithCopy for TrunkStatusSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v5(a1 + v6[6], a2 + v6[6], v4);
  v5(a1 + v6[7], a2 + v6[7], v4);
  v5(a1 + v6[8], a2 + v6[8], v4);
  uint64_t v7 = v6[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  v5(a1 + v6[10], a2 + v6[10], v4);
  uint64_t v11 = v6[11];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for TrunkStatusSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v5(a1 + v6[6], a2 + v6[6], v4);
  v5(a1 + v6[7], a2 + v6[7], v4);
  v5(a1 + v6[8], a2 + v6[8], v4);
  uint64_t v7 = v6[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  v5(a1 + v6[10], a2 + v6[10], v4);
  uint64_t v11 = v6[11];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for TrunkStatusSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v5(a1 + v6[6], a2 + v6[6], v4);
  v5(a1 + v6[7], a2 + v6[7], v4);
  v5(a1 + v6[8], a2 + v6[8], v4);
  uint64_t v7 = v6[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  v5(a1 + v6[10], a2 + v6[10], v4);
  uint64_t v11 = v6[11];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for TrunkStatusSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  v5(a1 + v6[6], a2 + v6[6], v4);
  v5(a1 + v6[7], a2 + v6[7], v4);
  v5(a1 + v6[8], a2 + v6[8], v4);
  uint64_t v7 = v6[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  v5(a1 + v6[10], a2 + v6[10], v4);
  uint64_t v11 = v6[11];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrunkStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24983B330);
}

uint64_t sub_24983B330(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TrunkStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24983B3B0);
}

uint64_t sub_24983B3B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for TrunkStatusSnippet()
{
  uint64_t result = qword_2696D7B28;
  if (!qword_2696D7B28) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24983B46C()
{
  uint64_t result = type metadata accessor for CarCommandsToggleSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_24983B4FC()
{
  unint64_t result = qword_2696D7B38;
  if (!qword_2696D7B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7B38);
  }
  return result;
}

void type metadata accessor for VRXVisualResponseLocation()
{
  if (!qword_2696D7B40)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2696D7B40);
    }
  }
}

uint64_t CarCommandsToggleSnippetModel.isOn.getter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  sub_2498633A0();
  return v1;
}

uint64_t type metadata accessor for CarCommandsToggleSnippetModel(uint64_t a1)
{
  return sub_249840778(a1, (uint64_t *)&unk_2696D7CF0);
}

uint64_t CarCommandsToggleSnippetModel.onStateText.getter()
{
  return sub_24983B9C0((void (*)(void))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t CarCommandsToggleSnippetModel.offStateText.getter()
{
  return sub_249840FC4((void (*)(void))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t CarCommandsToggleSnippetModel.onTransitionText.getter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  return v1;
}

uint64_t CarCommandsToggleSnippetModel.offTransitionText.getter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  return v1;
}

uint64_t CarCommandsToggleSnippetModel.appId.getter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  return v1;
}

uint64_t CarCommandsToggleSnippetModel.carNameDirectInvocationPayloadValue.getter()
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  return v1;
}

uint64_t CarCommandsToggleSnippetModel.init(carNameText:onStateText:offStateText:onTransitionText:offTransitionText:isOn:appId:carNameDirectInvocationPayloadValue:)()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsConfirmationSnippetModel.confirmText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsConfirmationSnippetModel.denyText.getter()
{
  return sub_24983B9C0((void (*)(void))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_24983B9C0(void (*a1)(void))
{
  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  return v2;
}

uint64_t CarCommandsConfirmationSnippetModel.denyText.setter(uint64_t a1, uint64_t a2)
{
  return sub_24983C120(a1, a2, (void (*)(void))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t (*CarCommandsConfirmationSnippetModel.denyText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsConfirmationSnippetModel.init(confirmText:denyText:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24983C208(a1, a2, a3, a4, (void (*)(void))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_24983BAC8()
{
  if (*v0) {
    return 0x74786554796E6564;
  }
  else {
    return 0x546D7269666E6F63;
  }
}

uint64_t sub_24983BB0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2498462D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24983BB34()
{
  return 0;
}

void sub_24983BB40(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24983BB4C(uint64_t a1)
{
  unint64_t v2 = sub_24983D2A4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24983BB88(uint64_t a1)
{
  unint64_t v2 = sub_24983D2A4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarCommandsConfirmationSnippetModel.encode(to:)(void *a1)
{
  return sub_24983C40C(a1, &qword_2696D7B50, (void (*)(void))sub_24983D2A4, (uint64_t)&type metadata for CarCommandsConfirmationSnippetModel.CodingKeys, (uint64_t)type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t CarCommandsConfirmationSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v26 = (char *)v21 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B68);
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24983D2A4();
  sub_249863BD0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v22 = v11;
  v23 = v13;
  uint64_t v14 = v25;
  char v31 = 0;
  unint64_t v15 = sub_24983D404();
  uint64_t v16 = v26;
  uint64_t v17 = v28;
  sub_249863AF0();
  v21[1] = v15;
  v26 = *(char **)(v14 + 32);
  ((void (*)(char *, char *, uint64_t))v26)(v23, v16, v29);
  char v30 = 1;
  v18 = v6;
  sub_249863AF0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v17);
  uint64_t v19 = (uint64_t)v23;
  ((void (*)(char *, char *, uint64_t))v26)(&v23[*(int *)(v22 + 20)], v18, v29);
  sub_24983D4EC(v19, v24, type metadata accessor for CarCommandsConfirmationSnippetModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24983D554(v19, type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_24983BF7C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsConfirmationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_24983BF94(void *a1)
{
  return CarCommandsConfirmationSnippetModel.encode(to:)(a1);
}

uint64_t (*CarCommandsAppPunchoutSnippetModel.appNameText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsAppPunchoutSnippetModel.appIdentifier.getter()
{
  return sub_24983B9C0((void (*)(void))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_24983C038@<X0>(void (*a1)(void)@<X3>, void *a2@<X8>)
{
  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t result = sub_2498633A0();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_24983C09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_2498633B0();
}

uint64_t CarCommandsAppPunchoutSnippetModel.appIdentifier.setter(uint64_t a1, uint64_t a2)
{
  return sub_24983C120(a1, a2, (void (*)(void))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_24983C120(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsAppPunchoutSnippetModel.appIdentifier.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsAppPunchoutSnippetModel.init(appNameText:appIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24983C208(a1, a2, a3, a4, (void (*)(void))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_24983C208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_249863380();
}

BOOL sub_24983C288(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24983C2A0()
{
  return sub_249863BA0();
}

uint64_t sub_24983C2CC()
{
  if (*v0) {
    return 0x746E656449707061;
  }
  else {
    return 0x54656D614E707061;
  }
}

uint64_t sub_24983C31C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2498463DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24983C344(uint64_t a1)
{
  unint64_t v2 = sub_24983D498();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24983C380(uint64_t a1)
{
  unint64_t v2 = sub_24983D498();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarCommandsAppPunchoutSnippetModel.encode(to:)(void *a1)
{
  return sub_24983C40C(a1, &qword_2696D7B78, (void (*)(void))sub_24983D498, (uint64_t)&type metadata for CarCommandsAppPunchoutSnippetModel.CodingKeys, (uint64_t)type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_24983C40C(void *a1, uint64_t *a2, void (*a3)(void), uint64_t a4, uint64_t a5)
{
  v13[0] = a5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_249863BE0();
  char v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_24983D2F8();
  uint64_t v11 = v13[1];
  sub_249863B40();
  if (!v11)
  {
    ((void (*)(void))v13[0])(0);
    char v14 = 1;
    sub_249863B40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t CarCommandsAppPunchoutSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v25 = *(void *)(v29 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v29);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v26 = (char *)v21 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B88);
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24983D498();
  sub_249863BD0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v22 = v11;
  v23 = v13;
  uint64_t v14 = v25;
  char v31 = 0;
  unint64_t v15 = sub_24983D404();
  uint64_t v16 = v26;
  uint64_t v17 = v28;
  sub_249863AF0();
  v21[1] = v15;
  v26 = *(char **)(v14 + 32);
  ((void (*)(char *, char *, uint64_t))v26)(v23, v16, v29);
  char v30 = 1;
  v18 = v6;
  sub_249863AF0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v17);
  uint64_t v19 = (uint64_t)v23;
  ((void (*)(char *, char *, uint64_t))v26)(&v23[*(int *)(v22 + 20)], v18, v29);
  sub_24983D4EC(v19, v24, type metadata accessor for CarCommandsAppPunchoutSnippetModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24983D554(v19, type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_24983C920@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsAppPunchoutSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_24983C938(void *a1)
{
  return CarCommandsAppPunchoutSnippetModel.encode(to:)(a1);
}

uint64_t (*CarCommandsToggleSnippetModel.carNameText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsToggleSnippetModel.onStateText.setter(uint64_t a1, uint64_t a2)
{
  return sub_24983C120(a1, a2, (void (*)(void))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t (*CarCommandsToggleSnippetModel.onStateText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsToggleSnippetModel.offStateText.setter(uint64_t a1, uint64_t a2)
{
  return sub_249841100(a1, a2, (void (*)(void))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t (*CarCommandsToggleSnippetModel.offStateText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t sub_24983CAE8@<X0>(void *a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t result = sub_2498633A0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24983CB48()
{
  return sub_2498633B0();
}

uint64_t CarCommandsToggleSnippetModel.onTransitionText.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsToggleSnippetModel.onTransitionText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t sub_24983CC7C@<X0>(void *a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t result = sub_2498633A0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24983CCDC()
{
  return sub_2498633B0();
}

uint64_t CarCommandsToggleSnippetModel.offTransitionText.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsToggleSnippetModel.offTransitionText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t sub_24983CE10@<X0>(unsigned char *a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  uint64_t result = sub_2498633A0();
  *a1 = v3;
  return result;
}

uint64_t sub_24983CE70()
{
  return sub_2498633B0();
}

uint64_t CarCommandsToggleSnippetModel.isOn.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsToggleSnippetModel.isOn.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t sub_24983CF94@<X0>(void *a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t result = sub_2498633A0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24983CFF4()
{
  return sub_2498633B0();
}

uint64_t CarCommandsToggleSnippetModel.appId.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsToggleSnippetModel.appId.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

double sub_24983D128@<D0>(_OWORD *a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_24983D188()
{
  return sub_2498633B0();
}

uint64_t CarCommandsToggleSnippetModel.carNameDirectInvocationPayloadValue.setter()
{
  return sub_2498633B0();
}

uint64_t type metadata accessor for CarCommandsConfirmationSnippetModel(uint64_t a1)
{
  return sub_249840778(a1, (uint64_t *)&unk_2696D7CC8);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24983D2A4()
{
  unint64_t result = qword_2696D7B58;
  if (!qword_2696D7B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7B58);
  }
  return result;
}

unint64_t sub_24983D2F8()
{
  unint64_t result = qword_2696D7B60;
  if (!qword_2696D7B60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7B10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7B60);
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

unint64_t sub_24983D404()
{
  unint64_t result = qword_2696D7B70;
  if (!qword_2696D7B70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7B10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7B70);
  }
  return result;
}

uint64_t type metadata accessor for CarCommandsAppPunchoutSnippetModel(uint64_t a1)
{
  return sub_249840778(a1, (uint64_t *)&unk_2696D7CE0);
}

unint64_t sub_24983D498()
{
  unint64_t result = qword_2696D7B80;
  if (!qword_2696D7B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7B80);
  }
  return result;
}

uint64_t sub_24983D4EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24983D554(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t (*CarCommandsToggleSnippetModel.carNameDirectInvocationPayloadValue.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

unint64_t sub_24983D630(char a1)
{
  unint64_t result = 0x54656D614E726163;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x5465746174536E6FLL;
      break;
    case 2:
      unint64_t result = 0x657461745366666FLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000011;
      break;
    case 5:
      unint64_t result = 1850700649;
      break;
    case 6:
      unint64_t result = 0x6449707061;
      break;
    case 7:
      unint64_t result = 0xD000000000000023;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_24983D740()
{
  return sub_24983D630(*v0);
}

uint64_t sub_24983D748@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24984650C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24983D770(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_24983D77C(uint64_t a1)
{
  unint64_t v2 = sub_24983DB1C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24983D7B8(uint64_t a1)
{
  unint64_t v2 = sub_24983DB1C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarCommandsToggleSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B90);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24983DB1C();
  sub_249863BE0();
  char v19 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_24983D2F8();
  sub_249863B40();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for CarCommandsToggleSnippetModel(0);
    char v18 = 1;
    sub_249863B40();
    char v17 = 2;
    sub_249863B40();
    char v16 = 3;
    sub_249863B40();
    char v15 = 4;
    sub_249863B40();
    v11[1] = v3 + *(int *)(v9 + 36);
    char v14 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
    sub_24983DB70();
    sub_249863B40();
    char v13 = 6;
    sub_249863B40();
    char v12 = 7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
    sub_24983E6B0(&qword_2696D7BA8);
    sub_249863B40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24983DB1C()
{
  unint64_t result = qword_2696D7B98;
  if (!qword_2696D7B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7B98);
  }
  return result;
}

unint64_t sub_24983DB70()
{
  unint64_t result = qword_2696D7BA0;
  if (!qword_2696D7BA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7B08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7BA0);
  }
  return result;
}

uint64_t sub_24983DBE4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7B48);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t CarCommandsToggleSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  uint64_t v64 = *(void *)(v3 - 8);
  uint64_t v65 = v3;
  MEMORY[0x270FA5388](v3);
  v50 = (char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  MEMORY[0x270FA5388](v5);
  v52 = (char *)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v57 = *(void *)(v62 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v62);
  v51 = (char *)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v53 = (char *)v46 - v10;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v54 = (char *)v46 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  char v15 = (char *)v46 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  char v18 = (char *)v46 - v17;
  MEMORY[0x270FA5388](v16);
  v61 = (char *)v46 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BC0);
  uint64_t v58 = *(void *)(v20 - 8);
  uint64_t v59 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  v26 = (char *)v46 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = &v26[*(int *)(v24 + 44)];
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B48);
  v63 = v27;
  sub_249863380();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24983DB1C();
  v60 = v22;
  uint64_t v28 = v68;
  sub_249863BD0();
  if (v28)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v63, v65);
  }
  else
  {
    uint64_t v29 = v15;
    v47 = (int *)v23;
    v48 = v26;
    v68 = a1;
    LOBYTE(v66) = 0;
    sub_24983D404();
    uint64_t v30 = v62;
    sub_249863AF0();
    char v31 = v48;
    v32 = v61;
    v61 = *(char **)(v57 + 32);
    ((void (*)(char *, char *, uint64_t))v61)(v48, v32, v30);
    LOBYTE(v66) = 1;
    sub_249863AF0();
    v33 = v18;
    v34 = (void (*)(char *, char *, uint64_t))v61;
    ((void (*)(char *, char *, uint64_t))v61)(&v31[v47[5]], v33, v30);
    LOBYTE(v66) = 2;
    v46[1] = 0;
    sub_249863AF0();
    v34(&v48[v47[6]], v29, v30);
    LOBYTE(v66) = 3;
    v35 = v54;
    sub_249863AF0();
    uint64_t v36 = v65;
    v34(&v48[v47[7]], v35, v30);
    LOBYTE(v66) = 4;
    v37 = v53;
    sub_249863AF0();
    uint64_t v38 = v56;
    v34(&v48[v47[8]], v37, v30);
    LOBYTE(v66) = 5;
    sub_24983E63C();
    v39 = v52;
    sub_249863AF0();
    uint64_t v40 = (uint64_t)v68;
    v41 = v39;
    uint64_t v42 = (uint64_t)v48;
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(&v48[v47[9]], v41, v38);
    LOBYTE(v66) = 6;
    v43 = v51;
    sub_249863AF0();
    ((void (*)(uint64_t, char *, uint64_t))v61)(v42 + v47[10], v43, v30);
    LOBYTE(v66) = 7;
    sub_24983E6B0(&qword_2696D7BD0);
    v44 = v50;
    sub_249863AF0();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v59);
    (*(void (**)(char *, char *, uint64_t))(v64 + 40))(v63, v44, v36);
    sub_24983D4EC(v42, v49, type metadata accessor for CarCommandsToggleSnippetModel);
    __swift_destroy_boxed_opaque_existential_1(v40);
    return sub_24983D554(v42, type metadata accessor for CarCommandsToggleSnippetModel);
  }
}

unint64_t sub_24983E63C()
{
  unint64_t result = qword_2696D7BC8;
  if (!qword_2696D7BC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7B08);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7BC8);
  }
  return result;
}

uint64_t sub_24983E6B0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7B18);
    sub_24983DBE4(&qword_2696D7BB0);
    sub_24983DBE4(&qword_2696D7BB8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24983E768@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsToggleSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_24983E780(void *a1)
{
  return CarCommandsToggleSnippetModel.encode(to:)(a1);
}

uint64_t (*CarCommandsGaugeSnippetModel.carName.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsGaugeSnippetModel.primaryText.getter()
{
  return sub_24983B9C0((void (*)(void))type metadata accessor for CarCommandsGaugeSnippetModel);
}

uint64_t type metadata accessor for CarCommandsGaugeSnippetModel(uint64_t a1)
{
  return sub_249840778(a1, (uint64_t *)&unk_2696D7D10);
}

uint64_t CarCommandsGaugeSnippetModel.primaryText.setter(uint64_t a1, uint64_t a2)
{
  return sub_24983C120(a1, a2, (void (*)(void))type metadata accessor for CarCommandsGaugeSnippetModel);
}

uint64_t (*CarCommandsGaugeSnippetModel.primaryText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsGaugeSnippetModel.secondaryText.getter()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  return v1;
}

double sub_24983E924@<D0>(_OWORD *a1@<X8>)
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_24983E984()
{
  return sub_2498633B0();
}

uint64_t CarCommandsGaugeSnippetModel.secondaryText.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsGaugeSnippetModel.secondaryText.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

float CarCommandsGaugeSnippetModel.gaugePercentFull.getter()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  sub_2498633A0();
  return v1;
}

float sub_24983EB04@<S0>(float *a1@<X8>)
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  sub_2498633A0();
  float result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_24983EB64()
{
  return sub_2498633B0();
}

uint64_t CarCommandsGaugeSnippetModel.gaugePercentFull.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsGaugeSnippetModel.gaugePercentFull.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsGaugeSnippetModel.showGaugeAccessoryView.getter()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  sub_2498633A0();
  return v1;
}

uint64_t sub_24983ECD4@<X0>(unsigned char *a1@<X8>)
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  uint64_t result = sub_2498633A0();
  *a1 = v3;
  return result;
}

uint64_t sub_24983ED34()
{
  return sub_2498633B0();
}

uint64_t CarCommandsGaugeSnippetModel.showGaugeAccessoryView.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsGaugeSnippetModel.showGaugeAccessoryView.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsGaugeSnippetModel.appId.getter()
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  return v1;
}

uint64_t sub_24983EEA4@<X0>(void *a1@<X8>)
{
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t result = sub_2498633A0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24983EF04()
{
  return sub_2498633B0();
}

uint64_t CarCommandsGaugeSnippetModel.appId.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsGaugeSnippetModel.appId.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsGaugeSnippetModel.init(carName:primaryText:secondaryText:gaugePercentFull:showGaugeAccessoryView:appId:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for CarCommandsGaugeSnippetModel(0) + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B48);
  sub_249863380();
  sub_249863380();
  sub_249863380();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_249863380();
  sub_249863380();
  sub_249863380();
  return sub_249863380();
}

unint64_t sub_24983F1CC(char a1)
{
  unint64_t result = 0x656D614E726163;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x547972616D697270;
      break;
    case 2:
      unint64_t result = 0x7261646E6F636573;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    case 5:
      unint64_t result = 0x6449707061;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_24983F2B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_24983F2C8()
{
  return sub_24983F1CC(*v0);
}

uint64_t sub_24983F2D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249846864(a1, a2);
  *a3 = result;
  return result;
}

void sub_24983F2F8(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_24983F304(uint64_t a1)
{
  unint64_t v2 = sub_24983F660();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24983F340(uint64_t a1)
{
  unint64_t v2 = sub_24983F660();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarCommandsGaugeSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BE0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24983F660();
  sub_249863BE0();
  char v15 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_24983D2F8();
  sub_249863B40();
  if (!v1)
  {
    uint64_t v7 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
    char v14 = 1;
    sub_249863B40();
    v9[1] = v7;
    char v13 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
    sub_24983E6B0(&qword_2696D7BA8);
    sub_249863B40();
    char v12 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
    sub_24983F6B4();
    sub_249863B40();
    char v11 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
    sub_24983DB70();
    sub_249863B40();
    char v10 = 5;
    sub_249863B40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_24983F660()
{
  unint64_t result = qword_2696D7BE8;
  if (!qword_2696D7BE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7BE8);
  }
  return result;
}

unint64_t sub_24983F6B4()
{
  unint64_t result = qword_2696D7BF0;
  if (!qword_2696D7BF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7BF0);
  }
  return result;
}

uint64_t CarCommandsGaugeSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  uint64_t v56 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  v51 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  uint64_t v57 = *(void *)(v4 - 8);
  uint64_t v58 = v4;
  MEMORY[0x270FA5388](v4);
  v52 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  uint64_t v65 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v53 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  char v14 = (char *)&v44 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v44 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BF8);
  uint64_t v54 = *(void *)(v17 - 8);
  uint64_t v55 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = (int *)v21;
  uint64_t v67 = 0;
  uint64_t v24 = *(int *)(v21 + 24);
  v69 = v23;
  uint64_t v25 = &v23[v24];
  uint64_t v68 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B48);
  uint64_t v64 = v25;
  sub_249863380();
  uint64_t v26 = a1[3];
  v60 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v26);
  sub_24983F660();
  uint64_t v59 = v19;
  uint64_t v27 = v63;
  sub_249863BD0();
  if (v27)
  {
    uint64_t v29 = v62;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
    return (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v64, v29);
  }
  else
  {
    v63 = v7;
    uint64_t v49 = v11;
    LOBYTE(v67) = 0;
    unint64_t v28 = sub_24983D404();
    sub_249863AF0();
    uint64_t v30 = v16;
    char v31 = *(void (**)(char *, char *, uint64_t))(v53 + 32);
    v31(v69, v30, v8);
    LOBYTE(v67) = 1;
    sub_249863AF0();
    uint64_t v48 = v8;
    uint64_t v47 = 0;
    unint64_t v46 = v28;
    uint64_t v32 = (uint64_t)v69;
    v31(&v69[v66[5]], v14, v8);
    LOBYTE(v67) = 2;
    sub_24983E6B0(&qword_2696D7BD0);
    v33 = v63;
    v34 = (void (*)(uint64_t, char *, uint64_t))v31;
    uint64_t v35 = v62;
    sub_249863AF0();
    v45 = v34;
    (*(void (**)(char *, char *, uint64_t))(v65 + 40))(v64, v33, v35);
    LOBYTE(v67) = 3;
    sub_24983FF70();
    uint64_t v36 = v52;
    uint64_t v37 = v58;
    sub_249863AF0();
    uint64_t v38 = v66;
    (*(void (**)(uint64_t, char *, uint64_t))(v57 + 32))(v32 + v66[7], v36, v37);
    LOBYTE(v67) = 4;
    sub_24983E63C();
    v39 = v51;
    uint64_t v40 = v61;
    sub_249863AF0();
    (*(void (**)(uint64_t, char *, uint64_t))(v56 + 32))(v32 + v38[8], v39, v40);
    LOBYTE(v67) = 5;
    uint64_t v42 = v48;
    v41 = v49;
    sub_249863AF0();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v59, v55);
    v45(v32 + v66[9], v41, v42);
    sub_24983D4EC(v32, v50, type metadata accessor for CarCommandsGaugeSnippetModel);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
    return sub_24983D554(v32, type metadata accessor for CarCommandsGaugeSnippetModel);
  }
}

unint64_t sub_24983FF70()
{
  unint64_t result = qword_2696D7C00;
  if (!qword_2696D7C00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7BD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7C00);
  }
  return result;
}

uint64_t sub_24983FFE4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsGaugeSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_24983FFFC(void *a1)
{
  return CarCommandsGaugeSnippetModel.encode(to:)(a1);
}

uint64_t (*CarCommandsDisambiguationSnippetModel.title.modify(void *a1))()
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsDisambiguationSnippetModel.disambiguationOptions.getter()
{
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  sub_2498633A0();
  return v1;
}

uint64_t type metadata accessor for CarCommandsDisambiguationSnippetModel(uint64_t a1)
{
  return sub_249840778(a1, (uint64_t *)&unk_2696D7D28);
}

uint64_t sub_2498400F4@<X0>(void *a1@<X8>)
{
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  uint64_t result = sub_2498633A0();
  *a1 = v3;
  return result;
}

uint64_t sub_249840154()
{
  return sub_2498633B0();
}

uint64_t CarCommandsDisambiguationSnippetModel.disambiguationOptions.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsDisambiguationSnippetModel.disambiguationOptions.modify(void *a1))()
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsDisambiguationSnippetModel.init(title:disambiguationOptions:)()
{
  return sub_249863380();
}

uint64_t sub_2498402F8()
{
  return sub_249863BC0();
}

uint64_t sub_249840340()
{
  return sub_249863BC0();
}

uint64_t sub_249840384()
{
  if (*v0) {
    return 0xD000000000000015;
  }
  else {
    return 0x656C746974;
  }
}

uint64_t sub_2498403C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249846B10(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2498403E8(uint64_t a1)
{
  unint64_t v2 = sub_249840624();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249840424(uint64_t a1)
{
  unint64_t v2 = sub_249840624();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarCommandsDisambiguationSnippetModel.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C18);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249840624();
  sub_249863BE0();
  v8[15] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_24983D2F8();
  sub_249863B40();
  if (!v1)
  {
    type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
    v8[14] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
    sub_249840678(&qword_2696D7C28);
    sub_249863B40();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_249840624()
{
  unint64_t result = qword_2696D7C20;
  if (!qword_2696D7C20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7C20);
  }
  return result;
}

uint64_t sub_249840678(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7C08);
    sub_2498407B0(&qword_2696D7C30, &qword_2696D7C38);
    sub_2498407B0(&qword_2696D7C40, &qword_2696D7C48);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1)
{
  return sub_249840778(a1, (uint64_t *)&unk_2696D7D40);
}

uint64_t sub_249840778(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2498407B0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7C10);
    sub_249840844(a2, (void (*)(uint64_t))type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_249840844(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t CarCommandsDisambiguationSnippetModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  uint64_t v23 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v25 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v27 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C50);
  uint64_t v28 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  MEMORY[0x270FA5388](v9);
  char v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249840624();
  sub_249863BD0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v22 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v25;
  uint64_t v13 = v26;
  char v32 = 0;
  sub_24983D404();
  uint64_t v15 = v27;
  sub_249863AF0();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  uint64_t v21 = (uint64_t)v12;
  v16(v12, v15, v29);
  char v31 = 1;
  sub_249840678(&qword_2696D7C58);
  uint64_t v17 = v13;
  uint64_t v18 = v30;
  sub_249863AF0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v18);
  uint64_t v19 = v21;
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v21 + *(int *)(v22 + 20), v5, v17);
  sub_24983D4EC(v19, v24, type metadata accessor for CarCommandsDisambiguationSnippetModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24983D554(v19, type metadata accessor for CarCommandsDisambiguationSnippetModel);
}

uint64_t sub_249840C70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsDisambiguationSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_249840C88(void *a1)
{
  return CarCommandsDisambiguationSnippetModel.encode(to:)(a1);
}

uint64_t _s22CarCommandsUIFramework0aB18ToggleSnippetModelV11carNameTextSSvg_0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  return v1;
}

uint64_t sub_249840CD8()
{
  return sub_2498633B0();
}

uint64_t _s22CarCommandsUIFramework0aB24ConfirmationSnippetModelV11confirmTextSSvs_0()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsDisambiguationSnippetModel.DisambiguationOption.text.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.iconImageIdentifier.getter()
{
  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  return v1;
}

double sub_249840E18@<D0>(_OWORD *a1@<X8>)
{
  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_249840E78()
{
  return sub_2498633B0();
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.iconImageIdentifier.setter()
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsDisambiguationSnippetModel.DisambiguationOption.iconImageIdentifier.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.directInvocationPayloadValue.getter()
{
  return sub_249840FC4((void (*)(void))type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
}

uint64_t sub_249840FC4(void (*a1)(void))
{
  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  return v2;
}

uint64_t sub_249841018@<X0>(void (*a1)(void)@<X3>, void *a2@<X8>)
{
  a1(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t result = sub_2498633A0();
  *a2 = v4;
  a2[1] = v5;
  return result;
}

uint64_t sub_24984107C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return sub_2498633B0();
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.directInvocationPayloadValue.setter(uint64_t a1, uint64_t a2)
{
  return sub_249841100(a1, a2, (void (*)(void))type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
}

uint64_t sub_249841100(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  return sub_2498633B0();
}

uint64_t (*CarCommandsDisambiguationSnippetModel.DisambiguationOption.directInvocationPayloadValue.modify(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  v2[4] = sub_249863390();
  return sub_24983B9A4;
}

void sub_2498411D0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(text:iconImageIdentifier:directInvocationPayloadValue:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0) + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B48);
  sub_249863380();
  sub_249863380();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_249863380();
  return sub_249863380();
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(text:directInvocationPayloadValue:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = a1 + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0) + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B48);
  sub_249863380();
  sub_249863380();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_249863380();
  return sub_249863380();
}

uint64_t sub_249841444()
{
  unint64_t v1 = 0xD000000000000013;
  if (*v0 != 1) {
    unint64_t v1 = 0xD00000000000001CLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 1954047348;
  }
}

uint64_t sub_24984149C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_249846BF8(a1, a2);
  *a3 = result;
  return result;
}

void sub_2498414C4(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2498414D0(uint64_t a1)
{
  unint64_t v2 = sub_249841754();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24984150C(uint64_t a1)
{
  unint64_t v2 = sub_249841754();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C60);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249841754();
  sub_249863BE0();
  char v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_24983D2F8();
  sub_249863B40();
  if (!v1)
  {
    v8[1] = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
    char v10 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
    sub_24983E6B0(&qword_2696D7BA8);
    sub_249863B40();
    char v9 = 2;
    sub_249863B40();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_249841754()
{
  unint64_t result = qword_2696D7C68;
  if (!qword_2696D7C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7C68);
  }
  return result;
}

uint64_t CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  uint64_t v45 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v37 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v38 = (char *)v30 - v8;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C70);
  uint64_t v36 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  char v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = &v14[*(int *)(v12 + 20)];
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B48);
  uint64_t v40 = v15;
  sub_249863380();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249841754();
  uint64_t v16 = v42;
  sub_249863BD0();
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v40, v41);
  }
  else
  {
    uint64_t v31 = v11;
    char v32 = v7;
    uint64_t v42 = a1;
    uint64_t v18 = v36;
    uint64_t v17 = v37;
    v33 = v14;
    LOBYTE(v43) = 0;
    unint64_t v19 = sub_24983D404();
    uint64_t v20 = v38;
    uint64_t v21 = v39;
    sub_249863AF0();
    v30[1] = v19;
    uint64_t v22 = v20;
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    uint64_t v38 = (char *)v4;
    v23(v33, v22, v4);
    LOBYTE(v43) = 1;
    sub_24983E6B0(&qword_2696D7BD0);
    uint64_t v24 = v17;
    uint64_t v25 = v41;
    sub_249863AF0();
    v30[0] = v23;
    (*(void (**)(char *, char *, uint64_t))(v45 + 40))(v40, v24, v25);
    LOBYTE(v43) = 2;
    uint64_t v26 = v38;
    sub_249863AF0();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v21);
    uint64_t v27 = (uint64_t)v42;
    uint64_t v28 = (uint64_t)v33;
    ((void (*)(char *, char *, char *))v30[0])(&v33[*(int *)(v31 + 24)], v32, v26);
    sub_24983D4EC(v28, v34, type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
    __swift_destroy_boxed_opaque_existential_1(v27);
    return sub_24983D554(v28, type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
  }
}

uint64_t sub_249841C9C()
{
  return sub_249840844(&qword_2696D7C78, (void (*)(uint64_t))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_249841CE4()
{
  return sub_249840844(&qword_2696D7C80, (void (*)(uint64_t))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_249841D2C()
{
  return sub_249840844(&qword_2696D7C88, (void (*)(uint64_t))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_249841D74()
{
  return sub_249840844(&qword_2696D7C90, (void (*)(uint64_t))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_249841DBC()
{
  return sub_249840844(&qword_2696D7C98, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t sub_249841E04()
{
  return sub_249840844(&qword_2696D7CA0, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t sub_249841E4C()
{
  return sub_249840844(&qword_2696D7CA8, (void (*)(uint64_t))type metadata accessor for CarCommandsGaugeSnippetModel);
}

uint64_t sub_249841E94()
{
  return sub_249840844(&qword_2696D7CB0, (void (*)(uint64_t))type metadata accessor for CarCommandsGaugeSnippetModel);
}

uint64_t sub_249841EDC()
{
  return sub_249840844(&qword_2696D7CB8, (void (*)(uint64_t))type metadata accessor for CarCommandsDisambiguationSnippetModel);
}

uint64_t sub_249841F24()
{
  return sub_249840844(&qword_2696D7CC0, (void (*)(uint64_t))type metadata accessor for CarCommandsDisambiguationSnippetModel);
}

uint64_t sub_249841F6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsDisambiguationSnippetModel.DisambiguationOption.init(from:)(a1, a2);
}

uint64_t sub_249841F84(void *a1)
{
  return CarCommandsDisambiguationSnippetModel.DisambiguationOption.encode(to:)(a1);
}

uint64_t sub_249841FA0()
{
  return sub_249840CD8();
}

uint64_t sub_249841FB8@<X0>(void *a1@<X8>)
{
  return sub_24983C038((void (*)(void))type metadata accessor for CarCommandsConfirmationSnippetModel, a1);
}

uint64_t sub_249841FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24983C09C(a1, a2, a3, a4, (void (*)(void))type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t sub_249842014()
{
  return sub_249840CD8();
}

uint64_t sub_24984202C@<X0>(void *a1@<X8>)
{
  return sub_24983C038((void (*)(void))type metadata accessor for CarCommandsAppPunchoutSnippetModel, a1);
}

uint64_t sub_249842058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24983C09C(a1, a2, a3, a4, (void (*)(void))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
}

uint64_t sub_249842088()
{
  return sub_249840CD8();
}

uint64_t sub_2498420A0@<X0>(void *a1@<X8>)
{
  return sub_24983C038((void (*)(void))type metadata accessor for CarCommandsToggleSnippetModel, a1);
}

uint64_t sub_2498420CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24983C09C(a1, a2, a3, a4, (void (*)(void))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t sub_2498420F8@<X0>(void *a1@<X8>)
{
  return sub_249841018((void (*)(void))type metadata accessor for CarCommandsToggleSnippetModel, a1);
}

uint64_t sub_249842124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24984107C(a1, a2, a3, a4, (void (*)(void))type metadata accessor for CarCommandsToggleSnippetModel);
}

uint64_t sub_24984217C()
{
  return sub_249840CD8();
}

uint64_t sub_249842194@<X0>(void *a1@<X8>)
{
  return sub_24983C038((void (*)(void))type metadata accessor for CarCommandsGaugeSnippetModel, a1);
}

uint64_t sub_2498421C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24983C09C(a1, a2, a3, a4, (void (*)(void))type metadata accessor for CarCommandsGaugeSnippetModel);
}

uint64_t sub_249842210()
{
  return sub_249840CD8();
}

uint64_t keypath_getTm@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t result = sub_2498633A0();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24984227C()
{
  return sub_249840CD8();
}

uint64_t sub_24984229C@<X0>(void *a1@<X8>)
{
  return sub_249841018((void (*)(void))type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption, a1);
}

uint64_t sub_2498422C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24984107C(a1, a2, a3, a4, (void (*)(void))type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption);
}

uint64_t getEnumTagSinglePayload for CarCommandsConfirmationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for CarCommandsConfirmationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t *_s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
  }
  return a1;
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwxx_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  return v7(v5, v4);
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t _s22CarCommandsUIFramework35CarCommandsConfirmationSnippetModelVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsAppPunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249842754);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CarCommandsAppPunchoutSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2498427DC);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

void sub_249842854()
{
  sub_249844650(319, &qword_2696D7CD8);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsToggleSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v8((uint64_t *)((char *)a1 + a3[6]), (uint64_t *)((char *)a2 + a3[6]), v7);
    v8((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]), v7);
    v8((uint64_t *)((char *)a1 + a3[8]), (uint64_t *)((char *)a2 + a3[8]), v7);
    uint64_t v9 = a3[9];
    char v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    v8((uint64_t *)((char *)a1 + a3[10]), (uint64_t *)((char *)a2 + a3[10]), v7);
    uint64_t v13 = a3[11];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t destroy for CarCommandsToggleSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  v5(a1 + a2[6], v4);
  v5(a1 + a2[7], v4);
  v5(a1 + a2[8], v4);
  uint64_t v6 = a1 + a2[9];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5(a1 + a2[10], v4);
  uint64_t v8 = a1 + a2[11];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  char v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  return v10(v8, v9);
}

uint64_t initializeWithCopy for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v8 = a3[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  v7(a1 + a3[10], a2 + a3[10], v6);
  uint64_t v12 = a3[11];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t assignWithCopy for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v8 = a3[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  v7(a1 + a3[10], a2 + a3[10], v6);
  uint64_t v12 = a3[11];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

uint64_t initializeWithTake for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v8 = a3[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  v7(a1 + a3[10], a2 + a3[10], v6);
  uint64_t v12 = a3[11];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  return a1;
}

uint64_t assignWithTake for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v7(a1 + a3[6], a2 + a3[6], v6);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v7(a1 + a3[8], a2 + a3[8], v6);
  uint64_t v8 = a3[9];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  v7(a1 + a3[10], a2 + a3[10], v6);
  uint64_t v12 = a3[11];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249843330);
}

uint64_t sub_249843330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 36);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 44);
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24984349C);
}

uint64_t sub_24984349C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 36);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 44);
  return v17(v19, a2, a2, v18);
}

void sub_249843600()
{
  sub_249844650(319, &qword_2696D7CD8);
  if (v0 <= 0x3F)
  {
    sub_249844650(319, &qword_2696D7D00);
    if (v1 <= 0x3F)
    {
      sub_249844C80(319, &qword_2696D7D08, &qword_2696D7B48);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsGaugeSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = a3[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    v8((uint64_t *)((char *)a1 + a3[9]), (uint64_t *)((char *)a2 + a3[9]), v7);
  }
  return a1;
}

uint64_t destroy for CarCommandsGaugeSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v13)((void *)(v4 - 8), a1, v4);
  v13(a1 + a2[5], v4);
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + a2[7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = a1 + a2[9];
  return ((uint64_t (*)(uint64_t, uint64_t))v13)(v11, v4);
}

uint64_t initializeWithCopy for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  v7(a1 + a3[9], a2 + a3[9], v6);
  return a1;
}

uint64_t assignWithCopy for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  v7(a1 + a3[9], a2 + a3[9], v6);
  return a1;
}

uint64_t initializeWithTake for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  v7(a1 + a3[9], a2 + a3[9], v6);
  return a1;
}

uint64_t assignWithTake for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a3[8];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  v7(a1 + a3[9], a2 + a3[9], v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249844160);
}

uint64_t sub_249844160(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[6];
LABEL_7:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_8;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_7;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + a3[8];
  return v17(v19, a2, v18);
}

uint64_t storeEnumTagSinglePayload for CarCommandsGaugeSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24984431C);
}

uint64_t sub_24984431C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_8:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[6];
LABEL_7:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_8;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_7;
  }
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a4[8];
  return v19(v21, a2, a2, v20);
}

void sub_2498444D0()
{
  sub_249844650(319, &qword_2696D7CD8);
  if (v0 <= 0x3F)
  {
    sub_249844C80(319, &qword_2696D7D08, &qword_2696D7B48);
    if (v1 <= 0x3F)
    {
      sub_249844650(319, &qword_2696D7D20);
      if (v2 <= 0x3F)
      {
        sub_249844650(319, &qword_2696D7D00);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_249844650(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2498633C0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsDisambiguationSnippetModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t initializeWithCopy for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249844B6C);
}

uint64_t sub_249844B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_65Tm(a1, a2, a3, &qword_2696D7C08);
}

uint64_t storeEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249844B8C);
}

uint64_t sub_249844B8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_66Tm(a1, a2, a3, a4, &qword_2696D7C08);
}

void sub_249844B98()
{
  sub_249844650(319, &qword_2696D7CD8);
  if (v0 <= 0x3F)
  {
    sub_249844C80(319, &qword_2696D7D38, &qword_2696D7C10);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_249844C80(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_2498633C0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 24)), (uint64_t *)((char *)a2 + *(int *)(a3 + 24)), v7);
  }
  return a1;
}

uint64_t destroy for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v9)((void *)(v4 - 8), a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  return v9(v7, v4);
}

uint64_t initializeWithCopy for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t assignWithCopy for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24))(v9, v10, v11);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t initializeWithTake for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t assignWithTake for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2498452CC);
}

uint64_t sub_2498452CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_65Tm(a1, a2, a3, &qword_2696D7B18);
}

uint64_t __swift_get_extra_inhabitant_index_65Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a2)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
    return v10(a1, a2, v8);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(a4);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 20);
    return v13(v15, a2, v14);
  }
}

uint64_t storeEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel.DisambiguationOption(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2498453EC);
}

uint64_t sub_2498453EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_66Tm(a1, a2, a3, a4, &qword_2696D7B18);
}

uint64_t __swift_store_extra_inhabitant_index_66Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v11 = *(void *)(v10 - 8);
  if (*(_DWORD *)(v11 + 84) == a3)
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56);
    return v12(a1, a2, a2, v10);
  }
  else
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    uint64_t v16 = v14;
    uint64_t v17 = a1 + *(int *)(a4 + 20);
    return v15(v17, a2, a2, v16);
  }
}

void sub_249845510()
{
  sub_249844650(319, &qword_2696D7CD8);
  if (v0 <= 0x3F)
  {
    sub_249844C80(319, &qword_2696D7D08, &qword_2696D7B48);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x249845764);
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

ValueMetadata *type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys()
{
  return &type metadata for CarCommandsDisambiguationSnippetModel.DisambiguationOption.CodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsDisambiguationSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsDisambiguationSnippetModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CarCommandsGaugeSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CarCommandsGaugeSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x249845914);
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

uint64_t sub_24984593C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_249845944(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsGaugeSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsGaugeSnippetModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CarCommandsToggleSnippetModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x249845AB8);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsToggleSnippetModel.CodingKeys;
}

unsigned char *sub_249845AF0(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsAppPunchoutSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsAppPunchoutSnippetModel.CodingKeys;
}

uint64_t _s22CarCommandsUIFramework37CarCommandsDisambiguationSnippetModelV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s22CarCommandsUIFramework37CarCommandsDisambiguationSnippetModelV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x249845C68);
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

ValueMetadata *type metadata accessor for CarCommandsConfirmationSnippetModel.CodingKeys()
{
  return &type metadata for CarCommandsConfirmationSnippetModel.CodingKeys;
}

unint64_t sub_249845CA4()
{
  unint64_t result = qword_2696D7D50;
  if (!qword_2696D7D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D50);
  }
  return result;
}

unint64_t sub_249845CFC()
{
  unint64_t result = qword_2696D7D58;
  if (!qword_2696D7D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D58);
  }
  return result;
}

unint64_t sub_249845D54()
{
  unint64_t result = qword_2696D7D60;
  if (!qword_2696D7D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D60);
  }
  return result;
}

unint64_t sub_249845DAC()
{
  unint64_t result = qword_2696D7D68;
  if (!qword_2696D7D68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D68);
  }
  return result;
}

unint64_t sub_249845E04()
{
  unint64_t result = qword_2696D7D70;
  if (!qword_2696D7D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D70);
  }
  return result;
}

unint64_t sub_249845E5C()
{
  unint64_t result = qword_2696D7D78;
  if (!qword_2696D7D78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D78);
  }
  return result;
}

unint64_t sub_249845EB4()
{
  unint64_t result = qword_2696D7D80;
  if (!qword_2696D7D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D80);
  }
  return result;
}

unint64_t sub_249845F0C()
{
  unint64_t result = qword_2696D7D88;
  if (!qword_2696D7D88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D88);
  }
  return result;
}

unint64_t sub_249845F64()
{
  unint64_t result = qword_2696D7D90;
  if (!qword_2696D7D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D90);
  }
  return result;
}

unint64_t sub_249845FBC()
{
  unint64_t result = qword_2696D7D98;
  if (!qword_2696D7D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7D98);
  }
  return result;
}

unint64_t sub_249846014()
{
  unint64_t result = qword_2696D7DA0;
  if (!qword_2696D7DA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7DA0);
  }
  return result;
}

unint64_t sub_24984606C()
{
  unint64_t result = qword_2696D7DA8;
  if (!qword_2696D7DA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7DA8);
  }
  return result;
}

unint64_t sub_2498460C4()
{
  unint64_t result = qword_2696D7DB0;
  if (!qword_2696D7DB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7DB0);
  }
  return result;
}

unint64_t sub_24984611C()
{
  unint64_t result = qword_2696D7DB8;
  if (!qword_2696D7DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7DB8);
  }
  return result;
}

unint64_t sub_249846174()
{
  unint64_t result = qword_2696D7DC0;
  if (!qword_2696D7DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7DC0);
  }
  return result;
}

unint64_t sub_2498461CC()
{
  unint64_t result = qword_2696D7DC8;
  if (!qword_2696D7DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7DC8);
  }
  return result;
}

unint64_t sub_249846224()
{
  unint64_t result = qword_2696D7DD0;
  if (!qword_2696D7DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7DD0);
  }
  return result;
}

unint64_t sub_24984627C()
{
  unint64_t result = qword_2696D7DD8;
  if (!qword_2696D7DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7DD8);
  }
  return result;
}

uint64_t sub_2498462D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x546D7269666E6F63 && a2 == 0xEB00000000747865;
  if (v2 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74786554796E6564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_249863B70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_2498463DC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x54656D614E707061 && a2 == 0xEB00000000747865;
  if (v2 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E656449707061 && a2 == 0xED00007265696669)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_249863B70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24984650C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x54656D614E726163 && a2 == 0xEB00000000747865;
  if (v2 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5465746174536E6FLL && a2 == 0xEB00000000747865 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x657461745366666FLL && a2 == 0xEC00000074786554 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000249866A20 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000249866A40 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1850700649 && a2 == 0xE400000000000000 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6449707061 && a2 == 0xE500000000000000 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x8000000249866A60)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = sub_249863B70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_249846864(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656D614E726163 && a2 == 0xE700000000000000;
  if (v2 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x547972616D697270 && a2 == 0xEB00000000747865 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7261646E6F636573 && a2 == 0xED00007478655479 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000249866A90 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x8000000249866AB0 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6449707061 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = sub_249863B70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t sub_249846B10(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000249866AD0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_249863B70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_249846BF8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v2 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000249866AF0 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x8000000249866B10)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_249863B70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t AudibleSignalStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24983A568(a1, a2);
}

double AudibleSignalStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  sub_2498638A0();
  sub_24983A824();
  uint64_t v2 = sub_249863490();
  uint64_t v4 = v3;
  uint64_t v5 = swift_bridgeObjectRetain();
  double result = 9.07234538e223;
  *(_OWORD *)a1 = xmmword_249864BB0;
  *(_OWORD *)(a1 + 16) = xmmword_249864BC0;
  *(_WORD *)(a1 + 32) = 129;
  *(unsigned char *)(a1 + 34) = 1;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = v8;
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = v7;
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = 0xD000000000000045;
  *(void *)(a1 + 128) = 0x8000000249866B30;
  *(void *)(a1 + 136) = v7;
  *(void *)(a1 + 144) = v8;
  *(void *)(a1 + 152) = v7;
  *(void *)(a1 + 160) = v8;
  *(unsigned char *)(a1 + 168) = v7;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = v7;
  *(void *)(a1 + 192) = v5;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = v2;
  *(void *)(a1 + 216) = v4;
  return result;
}

uint64_t sub_249846F6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for AudibleSignalStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249846FA0);
}

uint64_t sub_249846FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AudibleSignalStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249847020);
}

uint64_t sub_249847020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AudibleSignalStatusSnippet()
{
  uint64_t result = qword_2696D7DE0;
  if (!qword_2696D7DE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2498470E0(long long *a1, char *a2, char a3)
{
  uint64_t v6 = sub_249863410();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7DF0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2498475D8(a1, (uint64_t)v43);
  char v13 = v44;
  if ((v44 & 0x80) == 0)
  {
    swift_bridgeObjectRetain();
    sub_2498636A0();
    uint64_t v14 = *MEMORY[0x263F1B510];
    uint64_t v15 = sub_2498636D0();
    uint64_t v16 = *(void *)(v15 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v12, v14, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v15);
    uint64_t v17 = sub_2498636C0();
    swift_release();
    sub_2498475F0((uint64_t)a1);
    (*(void (**)(char *, uint64_t))(v7 + 8))(a2, v6);
LABEL_15:
    sub_249847664((uint64_t)v12);
    return v17;
  }
  v44 &= ~0x80u;
  if (a3)
  {
    int v36 = v13 & 1;
    uint64_t v18 = v43[0];
    uint64_t v19 = v43[1];
  }
  else
  {
    int v36 = 0;
    uint64_t v18 = v43[2];
    uint64_t v19 = v43[3];
  }
  uint64_t v35 = v18;
  swift_bridgeObjectRetain();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F18508], v6);
  char v20 = sub_249863400();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v7 + 8);
  v38(v9, v6);
  if (v20) {
    uint64_t v21 = 0x746867696C5FLL;
  }
  else {
    uint64_t v21 = 0x6B7261645FLL;
  }
  if (v20) {
    unint64_t v22 = 0xE600000000000000;
  }
  else {
    unint64_t v22 = 0xE500000000000000;
  }
  id v23 = objc_allocWithZone(MEMORY[0x263F086E0]);
  uint64_t v24 = sub_2498638C0();
  uint64_t v37 = a2;
  uint64_t v25 = (void *)v24;
  id v26 = objc_msgSend(v23, sel_initWithPath_, v24);

  if (!v36)
  {
    uint64_t v41 = v21;
    unint64_t v42 = v22;
    uint64_t v39 = v35;
    uint64_t v40 = v19;
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_249863920();
    uint64_t v40 = v28;
    sub_2498638F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    id v29 = v26;
    sub_2498636F0();
    uint64_t v30 = *MEMORY[0x263F1B510];
    uint64_t v31 = sub_2498636D0();
    uint64_t v32 = *(void *)(v31 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 104))(v12, v30, v31);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v32 + 56))(v12, 0, 1, v31);
    uint64_t v17 = sub_2498636C0();
    swift_release();
    sub_2498475F0((uint64_t)a1);

    v38(v37, v6);
    goto LABEL_15;
  }
  uint64_t v41 = v21;
  unint64_t v42 = v22;
  uint64_t v39 = v35;
  uint64_t v40 = v19;
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_249863920();
  uint64_t v40 = v27;
  sub_2498638F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = sub_2498636F0();
  sub_2498475F0((uint64_t)a1);
  v38(v37, v6);
  return v17;
}

uint64_t sub_2498475D8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2498475F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_249847628()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_249847664(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7DF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for CarCommandsThumbnail(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_2498476F8()
{
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t destroy for CarCommandsThumbnail()
{
  return sub_249847628();
}

uint64_t initializeWithCopy for CarCommandsThumbnail(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  char v7 = *((unsigned char *)a2 + 32);
  sub_2498476F8();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for CarCommandsThumbnail(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  char v7 = *((unsigned char *)a2 + 32);
  sub_2498476F8();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  sub_249847628();
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CarCommandsThumbnail(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v3;
  sub_249847628();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsThumbnail(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7F && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 127);
  }
  unsigned int v3 = (*(unsigned char *)(a1 + 32) & 0x7E | (*(unsigned __int8 *)(a1 + 32) >> 7)) ^ 0x7F;
  if (v3 >= 0x7E) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CarCommandsThumbnail(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 127;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2)
    {
      *(_OWORD *)__n128 result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(unsigned char *)(result + 32) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_24984792C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32) >> 7;
}

uint64_t sub_249847938(uint64_t result)
{
  *(unsigned char *)(result + 32) &= ~0x80u;
  return result;
}

uint64_t sub_249847948(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 1 | (a2 << 7);
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsThumbnail()
{
  return &type metadata for CarCommandsThumbnail;
}

uint64_t CarNameDisambiguationSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_249847DFC(a1, a2, type metadata accessor for CarCommandsDisambiguationSnippetModel);
}

uint64_t CarNameDisambiguationSnippet.body.getter@<X0>(void *a1@<X8>)
{
  uint64_t v31 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  uint64_t v29 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  unsigned int v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  uint64_t v30 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (uint64_t *)((char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  uint64_t v7 = v33;
  uint64_t v8 = v34;
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  sub_2498633A0();
  uint64_t v9 = v33;
  int64_t v10 = *(void *)(v33 + 16);
  if (v10)
  {
    uint64_t v26 = v8;
    uint64_t v27 = v7;
    uint64_t v28 = a1;
    uint64_t v32 = MEMORY[0x263F8EE78];
    sub_249847D1C(0, v10, 0);
    uint64_t v11 = *(unsigned __int8 *)(v29 + 80);
    uint64_t v25 = v9;
    uint64_t v12 = v9 + ((v11 + 32) & ~v11);
    uint64_t v29 = *(void *)(v29 + 72);
    do
    {
      sub_249847D3C(v12, (uint64_t)v3);
      sub_2498633A0();
      uint64_t v13 = v33;
      uint64_t v14 = v34;
      uint64_t v15 = (char *)v6 + *(int *)(v4 + 20);
      uint64_t v16 = sub_2498637B0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
      sub_2498633A0();
      uint64_t v17 = v33;
      uint64_t v18 = v34;
      void *v6 = v13;
      v6[1] = v14;
      uint64_t v19 = (void *)((char *)v6 + *(int *)(v4 + 24));
      *uint64_t v19 = v17;
      v19[1] = v18;
      sub_249847DA0((uint64_t)v3);
      uint64_t v20 = v32;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249847D1C(0, *(void *)(v20 + 16) + 1, 1);
        uint64_t v20 = v32;
      }
      unint64_t v22 = *(void *)(v20 + 16);
      unint64_t v21 = *(void *)(v20 + 24);
      if (v22 >= v21 >> 1)
      {
        sub_249847D1C(v21 > 1, v22 + 1, 1);
        uint64_t v20 = v32;
      }
      *(void *)(v20 + 16) = v22 + 1;
      sub_249847DFC((uint64_t)v6, v20+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(void *)(v30 + 72) * v22, (uint64_t (*)(void))type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption);
      v12 += v29;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    uint64_t v7 = v27;
    a1 = v28;
    uint64_t v8 = v26;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x263F8EE78];
  }
  sub_2498638A0();
  sub_24983A824();
  uint64_t result = sub_249863490();
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v20;
  a1[3] = 0xD00000000000003FLL;
  a1[4] = 0x8000000249866BE0;
  a1[5] = result;
  a1[6] = v24;
  return result;
}

uint64_t sub_249847D1C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24984AB0C(a1, a2, a3, (void *)*v3);
  *unsigned int v3 = result;
  return result;
}

uint64_t sub_249847D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249847DA0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_249847DFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_249847E64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for CarNameDisambiguationSnippet(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = (char *)a1 + v8;
    int64_t v10 = (char *)a2 + v8;
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for CarNameDisambiguationSnippet(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  uint64_t v3 = a1 + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  return v5(v3, v4);
}

uint64_t initializeWithCopy for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

uint64_t assignWithCopy for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t initializeWithTake for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249848370);
}

uint64_t sub_249848370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CarNameDisambiguationSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2498483F0);
}

uint64_t sub_2498483F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CarNameDisambiguationSnippet()
{
  uint64_t result = qword_2696D7DF8;
  if (!qword_2696D7DF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2498484AC()
{
  uint64_t result = type metadata accessor for CarCommandsDisambiguationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_24984853C()
{
  unint64_t result = qword_2696D7E08;
  if (!qword_2696D7E08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7E08);
  }
  return result;
}

uint64_t LockStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24983A568(a1, a2);
}

double LockStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  sub_2498638A0();
  sub_24983A824();
  uint64_t v2 = sub_249863490();
  uint64_t v4 = v3;
  uint64_t v5 = swift_bridgeObjectRetain();
  *(void *)&double result = 1801678700;
  *(_OWORD *)a1 = xmmword_249864CF0;
  *(_OWORD *)(a1 + 16) = xmmword_249864D00;
  *(_WORD *)(a1 + 32) = 128;
  *(unsigned char *)(a1 + 34) = 1;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = v8;
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = v7;
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = 0xD00000000000003CLL;
  *(void *)(a1 + 128) = 0x8000000249866C20;
  *(void *)(a1 + 136) = v7;
  *(void *)(a1 + 144) = v8;
  *(void *)(a1 + 152) = v7;
  *(void *)(a1 + 160) = v8;
  *(unsigned char *)(a1 + 168) = v7;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = v7;
  *(void *)(a1 + 192) = v5;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = v2;
  *(void *)(a1 + 216) = v4;
  return result;
}

uint64_t sub_2498487B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for LockStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2498487E4);
}

uint64_t sub_2498487E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for LockStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249848864);
}

uint64_t sub_249848864(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for LockStatusSnippet()
{
  uint64_t result = qword_2696D7E10;
  if (!qword_2696D7E10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ClimateStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24983A568(a1, a2);
}

double ClimateStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  sub_2498638A0();
  sub_24983A824();
  uint64_t v2 = sub_249863490();
  uint64_t v4 = v3;
  uint64_t v5 = swift_bridgeObjectRetain();
  double result = 3.51146621e151;
  *(_OWORD *)a1 = xmmword_249864D90;
  *(_OWORD *)(a1 + 16) = xmmword_249864DA0;
  *(_WORD *)(a1 + 32) = 128;
  *(unsigned char *)(a1 + 34) = 1;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = v8;
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = v7;
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = 0xD00000000000003FLL;
  *(void *)(a1 + 128) = 0x8000000249866C60;
  *(void *)(a1 + 136) = v7;
  *(void *)(a1 + 144) = v8;
  *(void *)(a1 + 152) = v7;
  *(void *)(a1 + 160) = v8;
  *(unsigned char *)(a1 + 168) = v7;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = v7;
  *(void *)(a1 + 192) = v5;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = v2;
  *(void *)(a1 + 216) = v4;
  return result;
}

uint64_t sub_249848B40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for ClimateStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249848B74);
}

uint64_t sub_249848B74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ClimateStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249848BF4);
}

uint64_t sub_249848BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ClimateStatusSnippet()
{
  uint64_t result = qword_2696D7E20;
  if (!qword_2696D7E20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_249848CB0()
{
  sub_24984C990();
  uint64_t result = sub_249863960();
  qword_2696D7E30 = result;
  return result;
}

uint64_t sub_249848D1C()
{
  uint64_t v0 = sub_2498633E0();
  __swift_allocate_value_buffer(v0, qword_2696D7E38);
  __swift_project_value_buffer(v0, (uint64_t)qword_2696D7E38);
  if (qword_2696D7AF0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_2696D7E30;
  return sub_2498633F0();
}

void sub_249848DA8()
{
  off_2696D7E50 = (_UNKNOWN *)MEMORY[0x263F8EE80];
}

uint64_t sub_249848DBC(uint64_t a1)
{
  if (qword_2696D7B00 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = off_2696D7E50;
  if (!*((void *)off_2696D7E50 + 2) || (unint64_t v3 = sub_24984AEB8(a1), (v4 & 1) == 0))
  {
    swift_endAccess();
    if (a1)
    {
      uint64_t v6 = sub_24984A344(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v8 = v6[2];
      unint64_t v7 = v6[3];
      if (v8 >= v7 >> 1) {
        uint64_t v6 = sub_24984A344((void *)(v7 > 1), v8 + 1, 1, v6);
      }
      v6[2] = v8 + 1;
      uint64_t v9 = &v6[2 * v8];
      v9[4] = 0x657372617023;
      v9[5] = 0xE600000000000000;
      if ((a1 & 2) == 0)
      {
LABEL_17:
        if ((a1 & 4) != 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v14 = v6[2];
          unint64_t v13 = v6[3];
          if (v14 >= v13 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v13 > 1), v14 + 1, 1, v6);
          }
          v6[2] = v14 + 1;
          uint64_t v15 = (char *)&v6[2 * v14];
          strcpy(v15 + 32, "#appResolution");
          v15[47] = -18;
          if ((a1 & 8) == 0)
          {
LABEL_19:
            if ((a1 & 0x10) == 0) {
              goto LABEL_20;
            }
            goto LABEL_35;
          }
        }
        else if ((a1 & 8) == 0)
        {
          goto LABEL_19;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
        }
        unint64_t v17 = v6[2];
        unint64_t v16 = v6[3];
        if (v17 >= v16 >> 1) {
          uint64_t v6 = sub_24984A344((void *)(v16 > 1), v17 + 1, 1, v6);
        }
        v6[2] = v17 + 1;
        uint64_t v18 = &v6[2 * v17];
        v18[4] = 0x747865746E6F6323;
        v18[5] = 0xE800000000000000;
        if ((a1 & 0x10) == 0)
        {
LABEL_20:
          if ((a1 & 0x20) == 0) {
            goto LABEL_21;
          }
          goto LABEL_40;
        }
LABEL_35:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
        }
        unint64_t v20 = v6[2];
        unint64_t v19 = v6[3];
        if (v20 >= v19 >> 1) {
          uint64_t v6 = sub_24984A344((void *)(v19 > 1), v20 + 1, 1, v6);
        }
        v6[2] = v20 + 1;
        unint64_t v21 = (char *)&v6[2 * v20];
        strcpy(v21 + 32, "#getPowerLevel");
        v21[47] = -18;
        if ((a1 & 0x20) == 0)
        {
LABEL_21:
          if ((a1 & 0x40) == 0) {
            goto LABEL_22;
          }
          goto LABEL_45;
        }
LABEL_40:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
        }
        unint64_t v23 = v6[2];
        unint64_t v22 = v6[3];
        if (v23 >= v22 >> 1) {
          uint64_t v6 = sub_24984A344((void *)(v22 > 1), v23 + 1, 1, v6);
        }
        v6[2] = v23 + 1;
        uint64_t v24 = (char *)&v6[2 * v23];
        strcpy(v24 + 32, "#getLockStatus");
        v24[47] = -18;
        if ((a1 & 0x40) == 0)
        {
LABEL_22:
          if ((a1 & 0x80) == 0) {
            goto LABEL_23;
          }
          goto LABEL_50;
        }
LABEL_45:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
        }
        unint64_t v26 = v6[2];
        unint64_t v25 = v6[3];
        if (v26 >= v25 >> 1) {
          uint64_t v6 = sub_24984A344((void *)(v25 > 1), v26 + 1, 1, v6);
        }
        v6[2] = v26 + 1;
        uint64_t v27 = (char *)&v6[2 * v26];
        strcpy(v27 + 32, "#setLockStatus");
        v27[47] = -18;
        if ((a1 & 0x80) == 0)
        {
LABEL_23:
          if ((a1 & 0x100) == 0) {
            goto LABEL_60;
          }
          goto LABEL_55;
        }
LABEL_50:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
        }
        unint64_t v29 = v6[2];
        unint64_t v28 = v6[3];
        if (v29 >= v28 >> 1) {
          uint64_t v6 = sub_24984A344((void *)(v28 > 1), v29 + 1, 1, v6);
        }
        v6[2] = v29 + 1;
        uint64_t v30 = &v6[2 * v29];
        v30[4] = 0x7461766974636123;
        v30[5] = 0xEF6C616E67695365;
        if ((a1 & 0x100) == 0)
        {
LABEL_60:
          if ((a1 & 0x400) != 0)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
            }
            unint64_t v35 = v6[2];
            unint64_t v34 = v6[3];
            if (v35 >= v34 >> 1) {
              uint64_t v6 = sub_24984A344((void *)(v34 > 1), v35 + 1, 1, v6);
            }
            v6[2] = v35 + 1;
            int v36 = &v6[2 * v35];
            v36[4] = 0xD000000000000016;
            v36[5] = 0x8000000249867030;
            if ((a1 & 0x800) == 0)
            {
LABEL_62:
              if ((a1 & 0x4000) == 0) {
                goto LABEL_63;
              }
              goto LABEL_89;
            }
          }
          else if ((a1 & 0x800) == 0)
          {
            goto LABEL_62;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v38 = v6[2];
          unint64_t v37 = v6[3];
          if (v38 >= v37 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v37 > 1), v38 + 1, 1, v6);
          }
          v6[2] = v38 + 1;
          uint64_t v39 = &v6[2 * v38];
          v39[4] = 0xD000000000000010;
          v39[5] = 0x8000000249867010;
          if ((a1 & 0x4000) == 0)
          {
LABEL_63:
            if ((a1 & 0x8000) == 0) {
              goto LABEL_64;
            }
            goto LABEL_94;
          }
LABEL_89:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v41 = v6[2];
          unint64_t v40 = v6[3];
          if (v41 >= v40 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v40 > 1), v41 + 1, 1, v6);
          }
          v6[2] = v41 + 1;
          unint64_t v42 = &v6[2 * v41];
          v42[4] = 0xD000000000000011;
          v42[5] = 0x8000000249866FF0;
          if ((a1 & 0x8000) == 0)
          {
LABEL_64:
            if ((a1 & 0x10000) == 0) {
              goto LABEL_65;
            }
            goto LABEL_99;
          }
LABEL_94:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v44 = v6[2];
          unint64_t v43 = v6[3];
          if (v44 >= v43 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v43 > 1), v44 + 1, 1, v6);
          }
          v6[2] = v44 + 1;
          uint64_t v45 = &v6[2 * v44];
          v45[4] = 0xD00000000000001ALL;
          v45[5] = 0x8000000249866FD0;
          if ((a1 & 0x10000) == 0)
          {
LABEL_65:
            if ((a1 & 0x20000) == 0) {
              goto LABEL_66;
            }
            goto LABEL_104;
          }
LABEL_99:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v47 = v6[2];
          unint64_t v46 = v6[3];
          if (v47 >= v46 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v46 > 1), v47 + 1, 1, v6);
          }
          v6[2] = v47 + 1;
          uint64_t v48 = &v6[2 * v47];
          v48[4] = 0x6E75725474656723;
          v48[5] = 0xEF7375746174536BLL;
          if ((a1 & 0x20000) == 0)
          {
LABEL_66:
            if ((a1 & 0x40000) == 0) {
              goto LABEL_67;
            }
            goto LABEL_109;
          }
LABEL_104:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v50 = v6[2];
          unint64_t v49 = v6[3];
          if (v50 >= v49 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v49 > 1), v50 + 1, 1, v6);
          }
          v6[2] = v50 + 1;
          v51 = &v6[2 * v50];
          v51[4] = 0xD00000000000001CLL;
          v51[5] = 0x8000000249866FB0;
          if ((a1 & 0x40000) == 0)
          {
LABEL_67:
            if ((a1 & 0x100000) == 0) {
              goto LABEL_68;
            }
            goto LABEL_114;
          }
LABEL_109:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v53 = v6[2];
          unint64_t v52 = v6[3];
          if (v53 >= v52 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v52 > 1), v53 + 1, 1, v6);
          }
          v6[2] = v53 + 1;
          uint64_t v54 = &v6[2 * v53];
          v54[4] = 0xD000000000000011;
          v54[5] = 0x8000000249866F90;
          if ((a1 & 0x100000) == 0)
          {
LABEL_68:
            if ((a1 & 0x80000) == 0) {
              goto LABEL_69;
            }
            goto LABEL_119;
          }
LABEL_114:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v56 = v6[2];
          unint64_t v55 = v6[3];
          if (v56 >= v55 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v55 > 1), v56 + 1, 1, v6);
          }
          v6[2] = v56 + 1;
          uint64_t v57 = (char *)&v6[2 * v56];
          strcpy(v57 + 32, "#openCarPlay");
          v57[45] = 0;
          *((_WORD *)v57 + 23) = -5120;
          if ((a1 & 0x80000) == 0)
          {
LABEL_69:
            if ((a1 & 0x200000) == 0) {
              goto LABEL_70;
            }
            goto LABEL_124;
          }
LABEL_119:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v59 = v6[2];
          unint64_t v58 = v6[3];
          if (v59 >= v58 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v58 > 1), v59 + 1, 1, v6);
          }
          v6[2] = v59 + 1;
          v60 = &v6[2 * v59];
          v60[4] = 0xD000000000000019;
          v60[5] = 0x8000000249866F70;
          if ((a1 & 0x200000) == 0)
          {
LABEL_70:
            if ((a1 & 0x400000) == 0) {
              goto LABEL_71;
            }
            goto LABEL_129;
          }
LABEL_124:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v62 = v6[2];
          unint64_t v61 = v6[3];
          if (v62 >= v61 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v61 > 1), v62 + 1, 1, v6);
          }
          v6[2] = v62 + 1;
          v63 = &v6[2 * v62];
          v63[4] = 0xD000000000000010;
          v63[5] = 0x8000000249866F50;
          if ((a1 & 0x400000) == 0)
          {
LABEL_71:
            if ((a1 & 0x4000000) == 0) {
              goto LABEL_72;
            }
            goto LABEL_134;
          }
LABEL_129:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v65 = v6[2];
          unint64_t v64 = v6[3];
          if (v65 >= v64 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v64 > 1), v65 + 1, 1, v6);
          }
          v6[2] = v65 + 1;
          uint64_t v66 = &v6[2 * v65];
          v66[4] = 0xD000000000000014;
          v66[5] = 0x8000000249866F30;
          if ((a1 & 0x4000000) == 0)
          {
LABEL_72:
            if ((a1 & 0x8000000) == 0) {
              goto LABEL_73;
            }
            goto LABEL_139;
          }
LABEL_134:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v68 = v6[2];
          unint64_t v67 = v6[3];
          if (v68 >= v67 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v67 > 1), v68 + 1, 1, v6);
          }
          v6[2] = v68 + 1;
          v69 = &v6[2 * v68];
          v69[4] = 0x536E614674657323;
          v69[5] = 0xEF73676E69747465;
          if ((a1 & 0x8000000) == 0)
          {
LABEL_73:
            if ((a1 & 0x20000000) == 0) {
              goto LABEL_74;
            }
            goto LABEL_144;
          }
LABEL_139:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v71 = v6[2];
          unint64_t v70 = v6[3];
          if (v71 >= v70 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v70 > 1), v71 + 1, 1, v6);
          }
          v6[2] = v71 + 1;
          v72 = (char *)&v6[2 * v71];
          strcpy(v72 + 32, "#setAutoMode");
          v72[45] = 0;
          *((_WORD *)v72 + 23) = -5120;
          if ((a1 & 0x20000000) == 0)
          {
LABEL_74:
            if ((a1 & 0x40000000) == 0) {
              goto LABEL_75;
            }
            goto LABEL_149;
          }
LABEL_144:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v74 = v6[2];
          unint64_t v73 = v6[3];
          if (v74 >= v73 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v73 > 1), v74 + 1, 1, v6);
          }
          v6[2] = v74 + 1;
          v75 = &v6[2 * v74];
          v75[4] = 0x6D696C4374657323;
          v75[5] = 0xEF636E7953657461;
          if ((a1 & 0x40000000) == 0)
          {
LABEL_75:
            if ((a1 & 0x10000000) == 0) {
              goto LABEL_76;
            }
            goto LABEL_154;
          }
LABEL_149:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v77 = v6[2];
          unint64_t v76 = v6[3];
          if (v77 >= v76 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v76 > 1), v77 + 1, 1, v6);
          }
          v6[2] = v77 + 1;
          v78 = (char *)&v6[2 * v77];
          strcpy(v78 + 32, "#setVentMode");
          v78[45] = 0;
          *((_WORD *)v78 + 23) = -5120;
          if ((a1 & 0x10000000) == 0)
          {
LABEL_76:
            if ((a1 & 0x100000000) == 0) {
              goto LABEL_77;
            }
            goto LABEL_159;
          }
LABEL_154:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v80 = v6[2];
          unint64_t v79 = v6[3];
          if (v80 >= v79 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v79 > 1), v80 + 1, 1, v6);
          }
          v6[2] = v80 + 1;
          v81 = &v6[2 * v80];
          v81[4] = 0xD000000000000012;
          v81[5] = 0x8000000249866F10;
          if ((a1 & 0x100000000) == 0)
          {
LABEL_77:
            if (!v6[2])
            {
              swift_bridgeObjectRelease();
              return 0;
            }
LABEL_164:
            v90[0] = (uint64_t)v6;
            swift_bridgeObjectRetain();
            sub_24984BB00(v90);
            swift_bridgeObjectRelease();
            __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7E68);
            sub_24984BB6C();
            uint64_t v5 = sub_2498638B0();
            uint64_t v86 = v85;
            swift_release();
            swift_beginAccess();
            swift_bridgeObjectRetain();
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v89 = off_2696D7E50;
            off_2696D7E50 = (_UNKNOWN *)0x8000000000000000;
            sub_24984B5C8(v5, v86, a1, isUniquelyReferenced_nonNull_native);
            off_2696D7E50 = v89;
            swift_bridgeObjectRelease();
            swift_endAccess();
            return v5;
          }
LABEL_159:
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
          }
          unint64_t v83 = v6[2];
          unint64_t v82 = v6[3];
          if (v83 >= v82 >> 1) {
            uint64_t v6 = sub_24984A344((void *)(v82 > 1), v83 + 1, 1, v6);
          }
          v6[2] = v83 + 1;
          v84 = &v6[2 * v83];
          v84[4] = 0xD000000000000010;
          v84[5] = 0x8000000249866EF0;
          goto LABEL_164;
        }
LABEL_55:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
        }
        unint64_t v32 = v6[2];
        unint64_t v31 = v6[3];
        if (v32 >= v31 >> 1) {
          uint64_t v6 = sub_24984A344((void *)(v31 > 1), v32 + 1, 1, v6);
        }
        v6[2] = v32 + 1;
        uint64_t v33 = &v6[2 * v32];
        v33[4] = 1667462179;
        v33[5] = 0xE400000000000000;
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x263F8EE78];
      if ((a1 & 2) == 0) {
        goto LABEL_17;
      }
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v6 = sub_24984A344(0, v6[2] + 1, 1, v6);
    }
    unint64_t v11 = v6[2];
    unint64_t v10 = v6[3];
    if (v11 >= v10 >> 1) {
      uint64_t v6 = sub_24984A344((void *)(v10 > 1), v11 + 1, 1, v6);
    }
    v6[2] = v11 + 1;
    uint64_t v12 = &v6[2 * v11];
    v12[4] = 0x776F6C6623;
    v12[5] = 0xE500000000000000;
    goto LABEL_17;
  }
  uint64_t v5 = *(void *)(v2[7] + 16 * v3);
  swift_endAccess();
  swift_bridgeObjectRetain();
  return v5;
}

void *sub_249849D40@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_249849D4C()
{
  return sub_249863BC0();
}

uint64_t sub_249849D94()
{
  return sub_249863BB0();
}

uint64_t sub_249849DC0()
{
  return sub_249863BC0();
}

void sub_249849E04(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_249849E0C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_249849E20@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_249849E34@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_249849E48(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_249849E78@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_249849EA4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_249849EC8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_249849EDC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_249849EF0(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_249849F04@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_249849F18(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_249849F2C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_249849F40(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_249849F54()
{
  return *v0 == 0;
}

uint64_t sub_249849F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *sub_249849F7C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_249849F90@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_249849FA0(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_249849FAC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_249849FC0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_24984CC10(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void sub_24984A000(os_log_type_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v28 = a3;
  unint64_t v29 = a4;
  uint64_t v26 = 47;
  unint64_t v27 = 0xE100000000000000;
  sub_24984A2F0();
  uint64_t v14 = sub_2498639A0();
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    uint64_t v16 = v14 + 16 * v15;
    uint64_t v17 = *(void *)(v16 + 16);
    unint64_t v18 = *(void *)(v16 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_249863900();
    sub_249863900();
    a5 = v17;
    a6 = v18;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  uint64_t v28 = a5;
  unint64_t v29 = a6;
  uint64_t v26 = 58;
  unint64_t v27 = 0xE100000000000000;
  sub_249863B60();
  sub_249863900();
  swift_bridgeObjectRelease();
  sub_249863900();
  swift_bridgeObjectRelease();
  sub_249848DBC(a2);
  if (v19)
  {
    uint64_t v26 = 32;
    unint64_t v27 = 0xE100000000000000;
    sub_249863900();
    swift_bridgeObjectRelease();
    sub_249863900();
    swift_bridgeObjectRelease();
  }
  if (a9)
  {
    uint64_t v20 = HIBYTE(a9) & 0xF;
    if ((a9 & 0x2000000000000000) == 0) {
      uint64_t v20 = a8 & 0xFFFFFFFFFFFFLL;
    }
    if (v20)
    {
      uint64_t v26 = 32;
      unint64_t v27 = 0xE100000000000000;
      sub_249863900();
      sub_249863900();
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v22 = v28;
  unint64_t v21 = v29;
  swift_bridgeObjectRetain();
  unint64_t v23 = sub_2498633D0();
  if (os_log_type_enabled(v23, a1))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    swift_bridgeObjectRetain();
    sub_24984A454(v22, v21, &v26);
    sub_249863980();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_249838000, v23, a1, "%s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C5AC250](v25, -1, -1);
    MEMORY[0x24C5AC250](v24, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

unint64_t sub_24984A2F0()
{
  unint64_t result = qword_2696D7E58;
  if (!qword_2696D7E58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7E58);
  }
  return result;
}

void *sub_24984A344(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7E78);
      unint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24984C800(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24984A454(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24984A528(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24984AAAC((uint64_t)v12, *a3);
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
      sub_24984AAAC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24984A528(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_249863990();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24984A6E4(a5, a6);
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
  uint64_t v8 = sub_249863A30();
  if (!v8)
  {
    sub_249863A50();
    __break(1u);
LABEL_17:
    uint64_t result = sub_249863AA0();
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

uint64_t sub_24984A6E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24984A77C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24984A95C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24984A95C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24984A77C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24984A8F4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_249863A00();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_249863A50();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_249863910();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_249863AA0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_249863A50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24984A8F4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7E60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24984A95C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7E60);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_249863AA0();
  __break(1u);
  return result;
}

uint64_t sub_24984AAAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24984AB0C(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7EA0);
  uint64_t v10 = *(void *)(type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  unint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_249863AA0();
  __break(1u);
  return result;
}

uint64_t sub_24984AD4C(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7E78);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_249863AA0();
  __break(1u);
  return result;
}

unint64_t sub_24984AEB8(uint64_t a1)
{
  sub_249863B90();
  sub_249863BB0();
  uint64_t v2 = sub_249863BC0();
  return sub_24984B708(a1, v2);
}

unint64_t sub_24984AF24(uint64_t a1)
{
  uint64_t v2 = sub_2498639C0();
  return sub_24984B7A4(a1, v2);
}

unint64_t sub_24984AF68(uint64_t a1, uint64_t a2)
{
  sub_249863B90();
  sub_2498638E0();
  uint64_t v4 = sub_249863BC0();
  return sub_24984B86C(a1, a2, v4);
}

uint64_t sub_24984AFE0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7E80);
  char v34 = a2;
  uint64_t result = sub_249863A80();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v33 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v32 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v32) {
          goto LABEL_33;
        }
        unint64_t v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v21 = v33[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((v34 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
              if (v31 >= 64) {
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v33 = -1 << v31;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v32) {
                  goto LABEL_33;
                }
                unint64_t v21 = v33[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      uint64_t v28 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v19);
      uint64_t v29 = *v28;
      uint64_t v30 = v28[1];
      if ((v34 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_249863B90();
      sub_249863BB0();
      uint64_t result = sub_249863BC0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v27;
      unint64_t v17 = (void *)(*(void *)(v7 + 56) + 16 * v16);
      *unint64_t v17 = v29;
      v17[1] = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24984B2C8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7E98);
  uint64_t v6 = sub_249863A80();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    char v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_24984C9D0(v24, v35);
      }
      else
      {
        sub_24984AAAC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_249863B90();
      sub_2498638E0();
      uint64_t result = sub_249863BC0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_24984C9D0(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_24984B5C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_24984AEB8(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_24984B950();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      unint64_t v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_bridgeObjectRelease();
      *unint64_t v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(void *)(v18[6] + 8 * v12) = a3;
    unint64_t v21 = (void *)(v18[7] + 16 * v12);
    *unint64_t v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_24984AFE0(result, a4 & 1);
  uint64_t result = sub_24984AEB8(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    int64_t v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_249863B80();
  __break(1u);
  return result;
}

unint64_t sub_24984B708(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_24984B7A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_24984C9E0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x24C5ABBF0](v9, a1);
      sub_24984CA3C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_24984B86C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_249863B70() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_249863B70() & 1) == 0);
    }
  }
  return v6;
}

void *sub_24984B950()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7E80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_249863A70();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    *uint64_t v22 = v21;
    v22[1] = v20;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24984BB00(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24984C7EC(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_24984BBC8(v5);
  *a1 = v2;
  return result;
}

unint64_t sub_24984BB6C()
{
  unint64_t result = qword_2696D7E70;
  if (!qword_2696D7E70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7E68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7E70);
  }
  return result;
}

uint64_t sub_24984BBC8(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_249863B50();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_24984C2B4(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  uint64_t v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_24984C384((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v97 = sub_24984C7D8((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          v100 = &v97[16 * v96 + 32];
          *(void *)v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_249863930();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    unint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_249863B70();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      int64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_249863B70()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_24984C620(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_24984C620((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    unint64_t v42 = v11 + 32;
    unint64_t v43 = &v11[16 * v41 + 32];
    *(void *)unint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          unint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          uint64_t v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            unint64_t v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        unint64_t v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        unint64_t v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        uint64_t v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        v88 = v42;
        unint64_t v89 = v44;
        v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_24984C384((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        uint64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        unint64_t v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      int64_t v33 = (void *)(v10 + 16 * v9);
      do
      {
        char v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        unint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_249863B70() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)unint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  uint64_t result = sub_249863A50();
  __break(1u);
  return result;
}

uint64_t sub_24984C2B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_249863B70(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24984C384(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_249863B70() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    unint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_249863B70() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_24984C71C((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_249863AA0();
  __break(1u);
  return result;
}

char *sub_24984C620(char *result, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7E88);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24984C71C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_249863AA0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_24984C7D8(uint64_t a1)
{
  return sub_24984C620(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24984C7EC(uint64_t a1)
{
  return sub_24984AD4C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24984C800(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_249863AA0();
  __break(1u);
  return result;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24984C990()
{
  unint64_t result = qword_2696D7E90;
  if (!qword_2696D7E90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2696D7E90);
  }
  return result;
}

_OWORD *sub_24984C9D0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24984C9E0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24984CA3C(uint64_t a1)
{
  return a1;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for Log.LogType()
{
  return &type metadata for Log.LogType;
}

unint64_t sub_24984CAB4()
{
  unint64_t result = qword_2696D7EA8;
  if (!qword_2696D7EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7EA8);
  }
  return result;
}

unint64_t sub_24984CB0C()
{
  unint64_t result = qword_2696D7EB0;
  if (!qword_2696D7EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7EB0);
  }
  return result;
}

unint64_t sub_24984CB64()
{
  unint64_t result = qword_2696D7EB8;
  if (!qword_2696D7EB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7EB8);
  }
  return result;
}

unint64_t sub_24984CBBC()
{
  unint64_t result = qword_2696D7EC0;
  if (!qword_2696D7EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7EC0);
  }
  return result;
}

uint64_t sub_24984CC10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_24984CC4C(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v5 = v2;
  uint64_t v6 = type metadata accessor for CarCommandsToggleButton();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_249863410();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24984D9C0((uint64_t)v12);
  int v13 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v12, v9);
  if (v13 == *MEMORY[0x263F18508]) {
    return a1();
  }
  if (v13 == *MEMORY[0x263F184F8])
  {
    uint64_t v15 = v2 + *(int *)(v6 + 20);
    uint64_t v16 = *(void *)v15;
    uint64_t v17 = *(void *)(v15 + 8);
    LOBYTE(v15) = *(unsigned char *)(v15 + 16);
    v24[1] = v16;
    v24[2] = v17;
    char v25 = v15;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F70);
    MEMORY[0x24C5AB980](&v26, v18);
    int v19 = v26;
    sub_24984ECE4(v5, (uint64_t)v8);
    if (v19 == 1)
    {
      char v20 = v8[*(int *)(v6 + 28) + 34];
      uint64_t v21 = sub_24984ED48((uint64_t)v8);
      if (v20) {
        return a1();
      }
    }
    else
    {
      uint64_t v21 = sub_24984ED48((uint64_t)v8);
    }
    return a2(v21);
  }
  uint64_t v22 = sub_249863670();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v22;
}

uint64_t CarCommandsToggleButton.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v31 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7EC8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7ED0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7ED8);
  MEMORY[0x270FA5388](v29);
  uint64_t v30 = (uint64_t)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CarCommandsToggleButton();
  uint64_t v32 = v1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7EE0);
  sub_24984D61C();
  sub_249863740();
  uint64_t v12 = (uint64_t *)(v1 + *(int *)(v11 + 20));
  uint64_t v13 = v12[1];
  char v14 = *((unsigned char *)v12 + 16);
  uint64_t v33 = *v12;
  uint64_t v34 = v13;
  char v35 = v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F70);
  MEMORY[0x24C5AB980](&v36);
  if ((_BYTE)v36) {
    double v16 = 1.0;
  }
  else {
    double v16 = 0.7;
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v5, v2);
  *(double *)&v9[*(int *)(v7 + 44)] = v16;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  int v17 = *(unsigned __int8 *)(v1 + *(int *)(v11 + 28) + 33);
  uint64_t v18 = v12[1];
  char v19 = *((unsigned char *)v12 + 16);
  uint64_t v33 = *v12;
  uint64_t v34 = v18;
  char v35 = v19;
  MEMORY[0x24C5AB980](&v36, v15);
  if (v36 == 1)
  {
    if (byte_26FD994F8 != v17)
    {
      int v20 = byte_26FD994F9;
LABEL_10:
      BOOL v21 = v20 == v17;
      goto LABEL_11;
    }
  }
  else if (byte_26FD99520 != v17)
  {
    int v20 = byte_26FD99521;
    goto LABEL_10;
  }
  BOOL v21 = 1;
LABEL_11:
  BOOL v22 = !v21;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = v22;
  uint64_t v25 = v30;
  sub_24984EDA4((uint64_t)v9, v30, &qword_2696D7ED0);
  uint64_t v26 = (uint64_t *)(v25 + *(int *)(v29 + 36));
  uint64_t *v26 = KeyPath;
  v26[1] = (uint64_t)sub_24984DCE4;
  v26[2] = v24;
  sub_24984E368((uint64_t)v9, &qword_2696D7ED0);
  return sub_24984DCFC(v25, v31);
}

uint64_t type metadata accessor for CarCommandsToggleButton()
{
  uint64_t result = qword_2696D7F90;
  if (!qword_2696D7F90) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24984D20C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2498636B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_249863410();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CarCommandsToggleButton();
  sub_2498475D8((long long *)(a1 + *(int *)(v11 + 28)), (uint64_t)v48);
  sub_24984ECA4((uint64_t)v48);
  sub_24984D9C0((uint64_t)v10);
  uint64_t v12 = (uint64_t *)(a1 + *(int *)(v11 + 20));
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  LOBYTE(v12) = *((unsigned char *)v12 + 16);
  uint64_t v42 = v13;
  uint64_t v43 = v14;
  LOBYTE(v44) = (_BYTE)v12;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F70);
  MEMORY[0x24C5AB980](&v36, v15);
  sub_2498470E0(v48, v10, v36);
  uint64_t v16 = sub_24984CC4C(MEMORY[0x263F1B3C0], MEMORY[0x263F1B3E8]);
  uint64_t v35 = sub_24984CC4C(MEMORY[0x263F1B3E8], MEMORY[0x263F1B410]);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F1B4B8], v4);
  uint64_t v34 = sub_2498636E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  sub_249863780();
  sub_249863460();
  uint64_t v32 = v36;
  LOBYTE(v7) = v37;
  uint64_t v17 = v38;
  LOBYTE(v5) = v39;
  uint64_t v31 = v40;
  uint64_t v30 = v41;
  sub_249863780();
  sub_249863460();
  uint64_t v18 = v42;
  uint64_t v19 = v44;
  uint64_t v20 = v46;
  uint64_t v21 = v47;
  char v59 = 1;
  char v56 = (char)v7;
  char v54 = v5;
  char v52 = v43;
  char v50 = v45;
  LOBYTE(v7) = sub_249863590();
  swift_release();
  uint64_t result = swift_release();
  char v23 = v59;
  *(_DWORD *)(a2 + 18) = v57;
  *(_WORD *)(a2 + 22) = v58;
  char v24 = v56;
  *(_DWORD *)(a2 + 49) = *(_DWORD *)v55;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)&v55[3];
  char v25 = v54;
  *(_DWORD *)(a2 + 65) = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v53[3];
  char v26 = v52;
  int v27 = *(_DWORD *)v51;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v51[3];
  *(_DWORD *)(a2 + 97) = v27;
  LOBYTE(v27) = v50;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v49[3];
  *(_DWORD *)(a2 + 113) = *(_DWORD *)v49;
  *(void *)a2 = v34;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = v23;
  *(unsigned char *)(a2 + 17) = 0;
  *(void *)(a2 + 24) = KeyPath;
  *(void *)(a2 + 32) = v16;
  *(void *)(a2 + 40) = v32;
  *(unsigned char *)(a2 + 48) = v24;
  *(void *)(a2 + 56) = v17;
  *(unsigned char *)(a2 + 64) = v25;
  uint64_t v28 = v30;
  *(void *)(a2 + 72) = v31;
  *(void *)(a2 + 80) = v28;
  *(void *)(a2 + 88) = v18;
  *(unsigned char *)(a2 + 96) = v26;
  *(void *)(a2 + 104) = v19;
  *(unsigned char *)(a2 + 112) = v27;
  *(void *)(a2 + 120) = v20;
  *(void *)(a2 + 128) = v21;
  *(void *)(a2 + 136) = v35;
  *(unsigned char *)(a2 + 144) = (_BYTE)v7;
  *(_WORD *)(a2 + 145) = 256;
  return result;
}

uint64_t sub_24984D614@<X0>(uint64_t a1@<X8>)
{
  return sub_24984D20C(*(void *)(v1 + 16), a1);
}

unint64_t sub_24984D61C()
{
  unint64_t result = qword_2696D7EE8;
  if (!qword_2696D7EE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7EE0);
    sub_24984D6BC();
    sub_24984EA38(&qword_2696D7F60, &qword_2696D7F68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7EE8);
  }
  return result;
}

unint64_t sub_24984D6BC()
{
  unint64_t result = qword_2696D7EF0;
  if (!qword_2696D7EF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7EF8);
    sub_24984D7A8(&qword_2696D7F00, &qword_2696D7F08, (void (*)(void))sub_24984D780);
    sub_24984EA38(&qword_2696D7F50, &qword_2696D7F58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7EF0);
  }
  return result;
}

uint64_t sub_24984D780()
{
  return sub_24984D7A8(&qword_2696D7F10, &qword_2696D7F18, (void (*)(void))sub_24984D828);
}

uint64_t sub_24984D7A8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_24984D828()
{
  unint64_t result = qword_2696D7F20;
  if (!qword_2696D7F20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7F28);
    sub_24984D8C8();
    sub_24984EA38(&qword_2696D7F40, &qword_2696D7F48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7F20);
  }
  return result;
}

unint64_t sub_24984D8C8()
{
  unint64_t result = qword_2696D7F30;
  if (!qword_2696D7F30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7F38);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7F30);
  }
  return result;
}

uint64_t CarCommandsToggleButton.asAnyView()()
{
  type metadata accessor for CarCommandsToggleButton();
  sub_24984DD64();
  return sub_2498635B0();
}

uint64_t sub_24984D984()
{
  sub_24984DD64();
  return sub_2498635B0();
}

uint64_t sub_24984D9C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_249863550();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F80);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24984EDA4(v2, (uint64_t)v10, &qword_2696D7F80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_249863410();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_249863950();
    uint64_t v14 = sub_249863580();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v19[1] = a1;
      uint64_t v18 = v17;
      uint64_t v20 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v19[2] = sub_24984A454(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_249863980();
      _os_log_impl(&dword_249838000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C5AC250](v18, -1, -1);
      MEMORY[0x24C5AC250](v16, -1, -1);
    }

    sub_249863540();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24984DC7C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_249863500();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24984DCAC()
{
  return sub_249863510();
}

uint64_t sub_24984DCD4()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_24984DCE4(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_24984DCFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7ED8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24984DD64()
{
  unint64_t result = qword_2696D7F78;
  if (!qword_2696D7F78)
  {
    type metadata accessor for CarCommandsToggleButton();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7F78);
  }
  return result;
}

uint64_t sub_24984DDBC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsToggleButton(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_249863410();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    v11[16] = v12[16];
    uint64_t v14 = (uint64_t *)((char *)a1 + v10);
    os_log_type_t v15 = (uint64_t *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[7];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = *(uint64_t *)((char *)a2 + v17);
    uint64_t v21 = *((void *)v19 + 1);
    uint64_t v22 = *((void *)v19 + 2);
    uint64_t v23 = *((void *)v19 + 3);
    char v24 = v19[32];
    swift_retain();
    swift_retain();
    swift_retain();
    sub_2498476F8();
    *(void *)uint64_t v18 = v20;
    *((void *)v18 + 1) = v21;
    *((void *)v18 + 2) = v22;
    *((void *)v18 + 3) = v23;
    v18[32] = v24;
    *(_WORD *)(v18 + 33) = *(_WORD *)(v19 + 33);
  }
  return a1;
}

uint64_t destroy for CarCommandsToggleButton(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_249863410();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  return sub_249847628();
}

void *initializeWithCopy for CarCommandsToggleButton(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_249863410();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v7;
  uint64_t v10 = (char *)a2 + v7;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = *(void *)v10;
  *((void *)v9 + 1) = v11;
  v9[16] = v10[16];
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)((char *)a2 + v15);
  uint64_t v19 = *((void *)v17 + 1);
  uint64_t v20 = *((void *)v17 + 2);
  uint64_t v21 = *((void *)v17 + 3);
  char v22 = v17[32];
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2498476F8();
  *(void *)uint64_t v16 = v18;
  *((void *)v16 + 1) = v19;
  *((void *)v16 + 2) = v20;
  *((void *)v16 + 3) = v21;
  v16[32] = v22;
  *(_WORD *)(v16 + 33) = *(_WORD *)(v17 + 33);
  return a1;
}

void *assignWithCopy for CarCommandsToggleButton(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_24984E368((uint64_t)a1, &qword_2696D7F80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_249863410();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  unsigned char v8[16] = v9[16];
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  uint64_t v13 = v12[1];
  void *v11 = *v12;
  v11[1] = v13;
  swift_retain();
  swift_release();
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = *(void *)((char *)a2 + v14);
  uint64_t v18 = *((void *)v16 + 1);
  uint64_t v19 = *((void *)v16 + 2);
  uint64_t v20 = *((void *)v16 + 3);
  LOBYTE(v9) = v16[32];
  sub_2498476F8();
  *(void *)uint64_t v15 = v17;
  *((void *)v15 + 1) = v18;
  *((void *)v15 + 2) = v19;
  *((void *)v15 + 3) = v20;
  v15[32] = (char)v9;
  sub_249847628();
  v15[33] = v16[33];
  v15[34] = v16[34];
  return a1;
}

uint64_t sub_24984E368(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *initializeWithTake for CarCommandsToggleButton(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_249863410();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  long long v12 = *(_OWORD *)v11;
  v10[16] = v11[16];
  *(_OWORD *)uint64_t v10 = v12;
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  long long v16 = *((_OWORD *)v15 + 1);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *((_OWORD *)v14 + 1) = v16;
  *(_DWORD *)(v14 + 31) = *(_DWORD *)(v15 + 31);
  return a1;
}

char *assignWithTake for CarCommandsToggleButton(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_24984E368((uint64_t)a1, &qword_2696D7F80);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_249863410();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  v9[16] = v10[16];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  swift_release();
  uint64_t v11 = a3[7];
  long long v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  LOBYTE(v11) = v13[32];
  long long v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)long long v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  v12[32] = v11;
  sub_249847628();
  v12[33] = v13[33];
  v12[34] = v13[34];
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleButton(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24984E650);
}

uint64_t sub_24984E650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F88);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleButton(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24984E72C);
}

uint64_t sub_24984E72C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F88);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_24984E7F0()
{
  sub_24984E89C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24984E89C()
{
  if (!qword_2696D7FA0)
  {
    sub_249863410();
    unint64_t v0 = sub_249863420();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2696D7FA0);
    }
  }
}

unint64_t sub_24984E8F8()
{
  unint64_t result = qword_2696D7FA8;
  if (!qword_2696D7FA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7ED8);
    sub_24984E998();
    sub_24984EA38(&qword_2696D7FC0, &qword_2696D7FC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7FA8);
  }
  return result;
}

unint64_t sub_24984E998()
{
  unint64_t result = qword_2696D7FB0;
  if (!qword_2696D7FB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7ED0);
    sub_24984EA38(&qword_2696D7FB8, &qword_2696D7EC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7FB0);
  }
  return result;
}

uint64_t sub_24984EA38(unint64_t *a1, uint64_t *a2)
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

uint64_t initializeWithCopy for CarCommandsToggleButton.ButtonConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  char v8 = *((unsigned char *)a2 + 32);
  sub_2498476F8();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  *(_WORD *)(a1 + 33) = *(_WORD *)((char *)a2 + 33);
  return a1;
}

uint64_t assignWithCopy for CarCommandsToggleButton.ButtonConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  char v8 = *((unsigned char *)a2 + 32);
  sub_2498476F8();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  sub_249847628();
  *(unsigned char *)(a1 + 33) = *((unsigned char *)a2 + 33);
  *(unsigned char *)(a1 + 34) = *((unsigned char *)a2 + 34);
  return a1;
}

__n128 __swift_memcpy35_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 31) = *(_DWORD *)(a2 + 31);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CarCommandsToggleButton.ButtonConfiguration(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 32);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 32) = v4;
  sub_249847628();
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleButton.ButtonConfiguration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 35)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 34);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleButton.ButtonConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 34) = 0;
    *(_WORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 35) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 35) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 34) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleButton.ButtonConfiguration()
{
  return &type metadata for CarCommandsToggleButton.ButtonConfiguration;
}

uint64_t sub_24984ECA4(uint64_t a1)
{
  return a1;
}

uint64_t sub_24984ECE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24984ED48(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CarCommandsToggleButton();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24984EDA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleButton.ToggleBehavior(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CarCommandsToggleButton.ToggleBehavior(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x24984EF64);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleButton.ToggleBehavior()
{
  return &type metadata for CarCommandsToggleButton.ToggleBehavior;
}

unint64_t sub_24984EFA0()
{
  unint64_t result = qword_2696D7FD0;
  if (!qword_2696D7FD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D7FD0);
  }
  return result;
}

uint64_t CarCommandsConfirmationSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4 = (uint64_t *)(a2 + *(int *)(type metadata accessor for CarCommandsConfirmationSnippet() + 20));
  sub_2498638A0();
  sub_24984F670((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
  *unsigned int v4 = sub_249863490();
  v4[1] = v5;
  return sub_24984F604(a1, a2, type metadata accessor for CarCommandsConfirmationSnippetModel);
}

uint64_t type metadata accessor for CarCommandsConfirmationSnippet()
{
  uint64_t result = qword_2696D7FF0;
  if (!qword_2696D7FF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CarCommandsConfirmationSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CarCommandsConfirmationSnippet();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7FD8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24984F59C(v2, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  sub_24984F604((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, (uint64_t (*)(void))type metadata accessor for CarCommandsConfirmationSnippet);
  sub_2498637F0();
  sub_24984F670(&qword_2696D7FE0, MEMORY[0x263F77660]);
  sub_2498637D0();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a1, v10, v7);
  long long v14 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696D7FE8) + 36));
  uint64_t *v14 = KeyPath;
  v14[1] = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24984F334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v14[3] = a2;
  uint64_t v3 = type metadata accessor for CarCommandsConfirmationSnippet();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  uint64_t v15 = v19[0];
  uint64_t v16 = v19[1];
  sub_24984F59C(a1, (uint64_t)v6);
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = (v7 + 16) & ~v7;
  v14[1] = v7 | 7;
  uint64_t v9 = swift_allocObject();
  sub_24984F604((uint64_t)v6, v9 + v8, (uint64_t (*)(void))type metadata accessor for CarCommandsConfirmationSnippet);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8020);
  void v19[3] = v10;
  uint64_t v11 = sub_24984EA38(&qword_2696D8028, &qword_2696D8020);
  v19[4] = v11;
  __swift_allocate_boxed_opaque_existential_1(v19);
  sub_24984A2F0();
  sub_249863750();
  type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  sub_2498633A0();
  v14[4] = v15;
  v14[5] = v16;
  sub_24984F59C(a1, (uint64_t)v6);
  uint64_t v12 = swift_allocObject();
  sub_24984F604((uint64_t)v6, v12 + v8, (uint64_t (*)(void))type metadata accessor for CarCommandsConfirmationSnippet);
  uint64_t v17 = v10;
  uint64_t v18 = v11;
  __swift_allocate_boxed_opaque_existential_1(&v15);
  sub_249863750();
  return sub_2498637E0();
}

uint64_t sub_24984F59C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsConfirmationSnippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24984F604(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24984F670(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_24984F6B8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *(void **)(a1 + *(int *)(type metadata accessor for CarCommandsConfirmationSnippet() + 20));
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = (void *)a2();
    id v6 = objc_msgSend(v5, sel_identifier);

    sub_2498638D0();
    id v7 = objc_allocWithZone(MEMORY[0x263F70030]);
    swift_bridgeObjectRetain();
    uint64_t v8 = (void *)sub_2498638C0();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v7, sel_initWithIdentifier_, v8);

    id v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F70028]), sel_init);
    objc_msgSend(v10, sel_setInputOrigin_, *MEMORY[0x263F65858]);
    objc_msgSend(v10, sel_setInteractionType_, *MEMORY[0x263F658C8]);
    id v11 = objc_msgSend(self, sel_runSiriKitExecutorCommandWithContext_payload_, v10, v9);
    swift_bridgeObjectRelease();

    sub_249863890();
  }
  else
  {
    sub_2498638A0();
    sub_24984F670((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
    sub_249863480();
    __break(1u);
  }
}

uint64_t sub_24984F89C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2498634A0();
  *a1 = result;
  return result;
}

uint64_t sub_24984F8C8()
{
  return sub_2498634B0();
}

uint64_t sub_24984F8F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24984F90C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7FD8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24984F59C(v3, (uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v12 = swift_allocObject();
  sub_24984F604((uint64_t)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, (uint64_t (*)(void))type metadata accessor for CarCommandsConfirmationSnippet);
  sub_2498637F0();
  sub_24984F670(&qword_2696D7FE0, MEMORY[0x263F77660]);
  sub_2498637D0();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(a2, v10, v7);
  long long v14 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696D7FE8) + 36));
  uint64_t *v14 = KeyPath;
  v14[1] = 1;
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsConfirmationSnippet(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
    v8((uint64_t *)((char *)a1 + *(int *)(v9 + 20)), (uint64_t *)((char *)a2 + *(int *)(v9 + 20)), v7);
    uint64_t v10 = *(int *)(a3 + 20);
    unint64_t v11 = (uint64_t *)((char *)a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    long long v14 = *(void **)v12;
    uint64_t v13 = *((void *)v12 + 1);
    void *v11 = v14;
    v11[1] = v13;
    id v15 = v14;
  }
  return a1;
}

void destroy for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v5(a1 + *(int *)(v6 + 20), v4);
  uint64_t v7 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t initializeWithCopy for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = a2 + v9;
  uint64_t v13 = *(void **)v11;
  uint64_t v12 = *(void *)(v11 + 8);
  void *v10 = v13;
  v10[1] = v12;
  id v14 = v13;
  return a1;
}

uint64_t assignWithCopy for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = a2 + v9;
  uint64_t v12 = *(void **)(a1 + v9);
  uint64_t v13 = *(void **)v11;
  void *v10 = *(void *)v11;
  id v14 = v13;

  v10[1] = *(void *)(v11 + 8);
  return a1;
}

uint64_t initializeWithTake for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v7(a1 + *(int *)(v8 + 20), a2 + *(int *)(v8 + 20), v6);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = *(void **)(a1 + v9);
  void *v10 = *v11;

  v10[1] = v11[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249850018);
}

uint64_t sub_249850018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
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
}

uint64_t storeEnumTagSinglePayload for CarCommandsConfirmationSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2498500F8);
}

uint64_t sub_2498500F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t sub_2498501B4()
{
  uint64_t result = type metadata accessor for CarCommandsConfirmationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_24985024C()
{
  unint64_t result = qword_2696D8000;
  if (!qword_2696D8000)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D7FE8);
    sub_24984EA38(&qword_2696D8008, &qword_2696D7FD8);
    sub_24984EA38(&qword_2696D8010, &qword_2696D8018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8000);
  }
  return result;
}

uint64_t sub_249850314@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for CarCommandsConfirmationSnippet() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_24984F334(v4, a1);
}

void sub_249850388()
{
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

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for CarCommandsConfirmationSnippet() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  uint64_t v9 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  v8(v6 + *(int *)(v9 + 20), v7);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

void sub_249850528()
{
}

void sub_249850540(uint64_t (*a1)(void))
{
  uint64_t v3 = *(void *)(type metadata accessor for CarCommandsConfirmationSnippet() - 8);
  sub_24984F6B8(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t CarCommandsDisambiguationSnippet.body.getter()
{
  uint64_t v1 = sub_249863840();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8030);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = v0[1];
  long long v15 = *v0;
  long long v16 = v6;
  long long v17 = v0[2];
  uint64_t v18 = *((void *)v0 + 6);
  uint64_t v13 = MEMORY[0x263F8D310];
  uint64_t v14 = MEMORY[0x263F77998];
  long long v12 = v15;
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  swift_bridgeObjectRetain();
  sub_249863830();
  uint64_t v7 = swift_allocObject();
  long long v8 = v16;
  *(_OWORD *)(v7 + 16) = v15;
  *(_OWORD *)(v7 + 32) = v8;
  *(_OWORD *)(v7 + 48) = v17;
  *(void *)(v7 + 64) = v18;
  sub_249850954((uint64_t)&v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8038);
  sub_2498509A4();
  sub_249863800();
  sub_24984EA38(&qword_2696D8070, &qword_2696D8030);
  sub_249863640();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2498507C8(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v2 = swift_allocObject();
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(void *)(v2 + 64) = *(void *)(a1 + 48);
  sub_249852104((uint64_t)&v5);
  sub_249850954(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8098);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D80A0);
  sub_24984EA38(&qword_2696D80A8, &qword_2696D8098);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D8048);
  sub_249850A4C();
  swift_getOpaqueTypeConformance2();
  sub_249852438(&qword_2696D80B0, (void (*)(uint64_t))type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption);
  return sub_249863770();
}

uint64_t sub_24985094C()
{
  return sub_2498507C8(v0 + 16);
}

uint64_t sub_249850954(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_2498509A4()
{
  unint64_t result = qword_2696D8040;
  if (!qword_2696D8040)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D8038);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D8048);
    sub_249850A4C();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8040);
  }
  return result;
}

unint64_t sub_249850A4C()
{
  unint64_t result = qword_2696D8050;
  if (!qword_2696D8050)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D8048);
    sub_249852438(&qword_2696D8058, MEMORY[0x263F77720]);
    sub_24984EA38(&qword_2696D8060, &qword_2696D8068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8050);
  }
  return result;
}

uint64_t sub_249850B1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_249850B38@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v40 = a3;
  uint64_t v5 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  uint64_t v6 = v5 - 8;
  uint64_t v37 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v38 = v7;
  uint64_t v39 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_249863820();
  uint64_t v11 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8048);
  MEMORY[0x270FA5388](v36);
  long long v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D80A0);
  uint64_t v34 = *(void *)(v16 - 8);
  uint64_t v35 = v16;
  MEMORY[0x270FA5388](v16);
  uint64_t v33 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *a1;
  uint64_t v19 = a1[1];
  uint64_t v67 = MEMORY[0x263F8D310];
  uint64_t v68 = MEMORY[0x263F77998];
  uint64_t v65 = v18;
  uint64_t v66 = v19;
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
  uint64_t v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v49 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v46 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  sub_249852130((uint64_t)a1 + *(int *)(v6 + 28), (uint64_t)v10);
  uint64_t v20 = sub_2498637B0();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, v20) == 1)
  {
    swift_bridgeObjectRetain();
    sub_24984E368((uint64_t)v10, &qword_2696D8078);
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v43 = 0;
  }
  else
  {
    *((void *)&v42 + 1) = v20;
    uint64_t v43 = MEMORY[0x263F77548];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v41);
    (*(void (**)(uint64_t *, char *, uint64_t))(v21 + 32))(boxed_opaque_existential_1, v10, v20);
    swift_bridgeObjectRetain();
  }
  sub_249863810();
  uint64_t v23 = v32;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v13, v32);
  v15[*(int *)(v36 + 36)] = 0;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v23);
  uint64_t v24 = (uint64_t)a1;
  uint64_t v25 = v39;
  sub_249852198(v24, v39);
  unint64_t v26 = (*(unsigned __int8 *)(v37 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  uint64_t v27 = swift_allocObject();
  long long v28 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v27 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v27 + 32) = v28;
  *(_OWORD *)(v27 + 48) = *(_OWORD *)(a2 + 32);
  *(void *)(v27 + 64) = *(void *)(a2 + 48);
  sub_249852370(v25, v27 + v26);
  sub_249850954(a2);
  sub_249850A4C();
  uint64_t v29 = v33;
  sub_249863620();
  swift_release();
  sub_24984E368((uint64_t)v15, &qword_2696D8048);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v34 + 32))(v40, v29, v35);
}

uint64_t sub_249851004(uint64_t a1, uint64_t a2)
{
  if (qword_2696D7AF8 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_2498633E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_2696D7E38);
  os_log_type_t v5 = sub_249863940();
  sub_24984A000(v5, 8, 0xD0000000000000A2, 0x80000002498671E0, 2036625250, 0xE400000000000000, 43, 0xD000000000000033, 0x8000000249867290);
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D80B8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2498652B0;
    id v8 = v6;
    uint64_t v9 = MEMORY[0x263F8D310];
    sub_2498639E0();
    unint64_t v10 = (uint64_t *)(a2
                    + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption() + 24));
    uint64_t v12 = *v10;
    uint64_t v11 = v10[1];
    *(void *)(inited + 96) = v9;
    *(void *)(inited + 72) = v12;
    *(void *)(inited + 80) = v11;
    swift_bridgeObjectRetain();
    sub_249853044(inited);
    sub_249863880();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_249850954(a1);
    sub_2498638A0();
    sub_249852438((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
    uint64_t result = sub_249863480();
    __break(1u);
  }
  return result;
}

void destroy for CarCommandsDisambiguationSnippet(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v2 = *(void **)(a1 + 40);
}

void *initializeWithCopy for CarCommandsDisambiguationSnippet(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  os_log_type_t v5 = (void *)a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

void *assignWithCopy for CarCommandsDisambiguationSnippet(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[5];
  os_log_type_t v5 = (void *)a2[5];
  a1[5] = v5;
  id v6 = v5;

  a1[6] = a2[6];
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CarCommandsDisambiguationSnippet(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  long long v4 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsDisambiguationSnippet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsDisambiguationSnippet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsDisambiguationSnippet()
{
  return &type metadata for CarCommandsDisambiguationSnippet;
}

uint64_t sub_249851490()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_249851510(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  long long v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *long long v4 = *a2;
    long long v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_2498637B0();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 24);
    uint64_t v17 = (uint64_t *)((char *)v4 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_2498516AC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_2498637B0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  return swift_bridgeObjectRelease();
}

void *sub_249851780(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2498637B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_2498518CC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2498637B0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_249851A98(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_2498637B0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_249851BC8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_2498637B0();
  uint64_t v11 = *(void *)(v10 - 8);
  int v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_249851D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249851D88);
}

uint64_t sub_249851D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_249851E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249851E50);
}

uint64_t sub_249851E50(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption()
{
  uint64_t result = qword_2696D8080;
  if (!qword_2696D8080) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_249851F48()
{
  sub_249851FE0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_249851FE0()
{
  if (!qword_2696D8090)
  {
    sub_2498637B0();
    unint64_t v0 = sub_249863970();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2696D8090);
    }
  }
}

uint64_t sub_249852038()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_249852044@<X0>(void *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  swift_bridgeObjectRetain();
  uint64_t result = sub_249863900();
  *a1 = v4;
  a1[1] = v5;
  return result;
}

uint64_t objectdestroyTm_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2498520FC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_249850B38(a1, v2 + 16, a2);
}

uint64_t sub_249852104(uint64_t a1)
{
  return a1;
}

uint64_t sub_249852130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249852198(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2498521FC()
{
  uint64_t v1 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 72) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v6 = sub_2498637B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_249852370(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2498523D4()
{
  uint64_t v1 = *(void *)(type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_249851004(v0 + 16, v2);
}

uint64_t sub_249852438(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t AppDisambiguationSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_249847DFC(a1, a2, type metadata accessor for CarCommandsDisambiguationSnippetModel);
}

uint64_t AppDisambiguationSnippet.body.getter@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  sub_2498633A0();
  uint64_t v2 = sub_249852588(v5);
  swift_bridgeObjectRelease();
  sub_2498638A0();
  sub_24983A824();
  uint64_t result = sub_249863490();
  *a1 = v5;
  a1[1] = v6;
  a1[2] = v2;
  a1[3] = 0xD000000000000042;
  a1[4] = 0x8000000249867190;
  a1[5] = result;
  a1[6] = v4;
  return result;
}

uint64_t sub_249852588(uint64_t a1)
{
  uint64_t v2 = sub_249863370();
  MEMORY[0x270FA5388](v2 - 8);
  v30[1] = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  v30[0] = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v30 - v7;
  uint64_t v34 = type metadata accessor for CarCommandsDisambiguationSnippetModel.DisambiguationOption(0);
  uint64_t v9 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption();
  uint64_t v32 = *(void *)(v12 - 8);
  uint64_t v33 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v35 = (void *)((char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  int64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = MEMORY[0x263F8EE78];
  if (v14)
  {
    uint64_t v38 = MEMORY[0x263F8EE78];
    sub_249847D1C(0, v14, 0);
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v31 = *(void *)(v9 + 72);
    uint64_t v17 = v33;
    do
    {
      sub_249847D3C(v16, (uint64_t)v11);
      uint64_t v18 = sub_2498637B0();
      uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
      v19(v8, 1, 1, v18);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
      sub_2498633A0();
      if (v37)
      {
        sub_249863360();
        swift_bridgeObjectRelease();
        uint64_t v20 = v30[0];
        sub_2498637C0();
        sub_249852BF0((uint64_t)v8);
        v19((char *)v20, 0, 1, v18);
        sub_249852C50(v20, (uint64_t)v8);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      sub_2498633A0();
      uint64_t v21 = v36;
      uint64_t v22 = v37;
      uint64_t v23 = v35;
      sub_249852130((uint64_t)v8, (uint64_t)v35 + *(int *)(v17 + 20));
      sub_2498633A0();
      uint64_t v24 = v36;
      uint64_t v25 = v37;
      void *v23 = v21;
      v23[1] = v22;
      unint64_t v26 = (void *)((char *)v23 + *(int *)(v17 + 24));
      void *v26 = v24;
      v26[1] = v25;
      sub_249852BF0((uint64_t)v8);
      sub_249847DA0((uint64_t)v11);
      uint64_t v15 = v38;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249847D1C(0, *(void *)(v15 + 16) + 1, 1);
        uint64_t v15 = v38;
      }
      unint64_t v28 = *(void *)(v15 + 16);
      unint64_t v27 = *(void *)(v15 + 24);
      if (v28 >= v27 >> 1)
      {
        sub_249847D1C(v27 > 1, v28 + 1, 1);
        uint64_t v15 = v38;
      }
      *(void *)(v15 + 16) = v28 + 1;
      sub_249847DFC((uint64_t)v35, v15+ ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))+ *(void *)(v32 + 72) * v28, (uint64_t (*)(void))type metadata accessor for CarCommandsDisambiguationSnippet.DisambiguationOption);
      v16 += v31;
      --v14;
    }
    while (v14);
  }
  return v15;
}

uint64_t sub_2498529AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2498529C8@<X0>(uint64_t *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
  sub_2498633A0();
  uint64_t v2 = sub_249852588(v5);
  swift_bridgeObjectRelease();
  sub_2498638A0();
  sub_24983A824();
  uint64_t result = sub_249863490();
  *a1 = v5;
  a1[1] = v6;
  a1[2] = v2;
  a1[3] = 0xD000000000000042;
  a1[4] = 0x8000000249867190;
  a1[5] = result;
  a1[6] = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for AppDisambiguationSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249852AB4);
}

uint64_t sub_249852AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for AppDisambiguationSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249852B34);
}

uint64_t sub_249852B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AppDisambiguationSnippet()
{
  uint64_t result = qword_2696D80C0;
  if (!qword_2696D80C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_249852BF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_249852C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t VisibleSignalStatusSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24983A568(a1, a2);
}

double VisibleSignalStatusSnippet.body.getter@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for CarCommandsToggleSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  sub_2498638A0();
  sub_24983A824();
  uint64_t v2 = sub_249863490();
  uint64_t v4 = v3;
  uint64_t v5 = swift_bridgeObjectRetain();
  double result = 2.87963758e214;
  *(_OWORD *)a1 = xmmword_249865440;
  *(_OWORD *)(a1 + 16) = xmmword_249865450;
  *(_WORD *)(a1 + 32) = 768;
  *(unsigned char *)(a1 + 34) = 0;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 64) = v8;
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = v8;
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = v7;
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = 0xD000000000000045;
  *(void *)(a1 + 128) = 0x8000000249867140;
  *(void *)(a1 + 136) = v7;
  *(void *)(a1 + 144) = v8;
  *(void *)(a1 + 152) = v7;
  *(void *)(a1 + 160) = v8;
  *(unsigned char *)(a1 + 168) = v7;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 184) = v7;
  *(void *)(a1 + 192) = v5;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = v2;
  *(void *)(a1 + 216) = v4;
  return result;
}

uint64_t sub_249852ED4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for VisibleSignalStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_249852F08);
}

uint64_t sub_249852F08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for VisibleSignalStatusSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249852F88);
}

uint64_t sub_249852F88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for VisibleSignalStatusSnippet()
{
  uint64_t result = qword_2696D80D0;
  if (!qword_2696D80D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_249853044(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D81B8);
  uint64_t v2 = sub_249863A90();
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
    sub_24984EDA4(v6, (uint64_t)v15, &qword_2696D81E8);
    unint64_t result = sub_24984AF24((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_24984C9D0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_249853188(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D81D8);
  uint64_t v2 = sub_249863A90();
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
    sub_24984EDA4(v6, (uint64_t)&v15, &qword_2696D81E0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_24984AF68(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = sub_2498573C8((uint64_t)&v17, v3[7] + 32 * result);
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t CarCommandsToggleSnippetUpdateValue.toggleIsOn.getter()
{
  return *v0;
}

CarCommandsUIFramework::CarCommandsToggleSnippetUpdateValue __swiftcall CarCommandsToggleSnippetUpdateValue.init(toggleIsOn:)(CarCommandsUIFramework::CarCommandsToggleSnippetUpdateValue toggleIsOn)
{
  v1->toggleIsOn = toggleIsOn.toggleIsOn;
  return toggleIsOn;
}

uint64_t sub_2498532D0()
{
  return 1;
}

uint64_t sub_2498532DC()
{
  return sub_249863BA0();
}

uint64_t sub_249853308()
{
  return 0x7349656C67676F74;
}

uint64_t sub_249853324@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x7349656C67676F74 && a2 == 0xEA00000000006E4FLL)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_249863B70();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_2498533C8(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2498533D4(uint64_t a1)
{
  unint64_t v2 = sub_249853580();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249853410(uint64_t a1)
{
  unint64_t v2 = sub_249853580();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarCommandsToggleSnippetUpdateValue.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D80E0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249853580();
  sub_249863BE0();
  sub_249863B30();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_249853580()
{
  unint64_t result = qword_2696D80E8;
  if (!qword_2696D80E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D80E8);
  }
  return result;
}

uint64_t CarCommandsToggleSnippetUpdateValue.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D80F0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249853580();
  sub_249863BD0();
  if (!v2)
  {
    char v9 = sub_249863AE0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_249853728()
{
  return sub_249863350();
}

uint64_t sub_249853794()
{
  return sub_249863340();
}

uint64_t sub_2498537E8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return CarCommandsToggleSnippetUpdateValue.init(from:)(a1, a2);
}

uint64_t sub_249853800(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D80E0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249853580();
  sub_249863BE0();
  sub_249863B30();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t CarCommandsToggleSnippetUpdateFailure.failureText.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

CarCommandsUIFramework::CarCommandsToggleSnippetUpdateFailure __swiftcall CarCommandsToggleSnippetUpdateFailure.init(failureText:)(CarCommandsUIFramework::CarCommandsToggleSnippetUpdateFailure failureText)
{
  *uint64_t v1 = failureText;
  return failureText;
}

uint64_t sub_24985396C()
{
  return sub_249863BC0();
}

uint64_t sub_2498539B0()
{
  return sub_249863BC0();
}

uint64_t sub_2498539F0()
{
  return 0x546572756C696166;
}

uint64_t sub_249853A10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x546572756C696166 && a2 == 0xEB00000000747865)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_249863B70();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_249853AC0(uint64_t a1)
{
  unint64_t v2 = sub_249853C70();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249853AFC(uint64_t a1)
{
  unint64_t v2 = sub_249853C70();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarCommandsToggleSnippetUpdateFailure.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D80F8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249853C70();
  sub_249863BE0();
  sub_249863B20();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_249853C70()
{
  unint64_t result = qword_2696D8100;
  if (!qword_2696D8100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8100);
  }
  return result;
}

uint64_t CarCommandsToggleSnippetUpdateFailure.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8108);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249853C70();
  sub_249863BD0();
  if (!v2)
  {
    uint64_t v9 = sub_249863AD0();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_249853E34()
{
  return sub_249863350();
}

uint64_t sub_249853EA0()
{
  return sub_249863340();
}

uint64_t sub_249853EF4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return CarCommandsToggleSnippetUpdateFailure.init(from:)(a1, a2);
}

uint64_t sub_249853F0C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D80F8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249853C70();
  sub_249863BE0();
  sub_249863B20();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t CarCommandsToggleSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v84 = a1;
  uint64_t v2 = (int *)type metadata accessor for CarCommandsToggleButton();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (uint64_t *)((char *)&v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_249863860();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v76 = v5;
  uint64_t v77 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8110);
  uint64_t v79 = *(void *)(v9 - 8);
  uint64_t v80 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v74 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8118);
  MEMORY[0x270FA5388](v78);
  v75 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8120);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v82 = v12;
  uint64_t v83 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v81 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v15 = v1[11];
  v111[0] = v1[10];
  v111[1] = v15;
  long long v16 = v1[13];
  v111[2] = v1[12];
  long long v112 = v16;
  long long v17 = v1[7];
  long long v107 = v1[6];
  long long v108 = v17;
  long long v18 = v1[9];
  long long v109 = v1[8];
  long long v110 = v18;
  long long v19 = v1[3];
  v104[1] = v1[2];
  v104[2] = v19;
  long long v20 = v1[5];
  long long v105 = v1[4];
  long long v106 = v20;
  long long v21 = v1[1];
  long long v103 = *v1;
  v104[0] = v21;
  long long v85 = *(_OWORD *)((char *)&v111[1] + 8);
  unint64_t v86 = *((void *)&v111[2] + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8128);
  sub_249863710();
  unint64_t v87 = MEMORY[0x263F8D310];
  unint64_t v88 = MEMORY[0x263F77998];
  long long v85 = v100;
  uint64_t v102 = 0;
  long long v100 = 0u;
  long long v101 = 0u;
  uint64_t v99 = 0;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v115 = *(_OWORD *)((char *)&v104[1] + 8);
  uint64_t v95 = MEMORY[0x263F8D310];
  uint64_t v96 = MEMORY[0x263F77998];
  long long v94 = *(_OWORD *)((char *)&v104[1] + 8);
  uint64_t v22 = (uint64_t (*)())swift_allocObject();
  long long v23 = v111[1];
  *((_OWORD *)v22 + 11) = v111[0];
  *((_OWORD *)v22 + 12) = v23;
  long long v24 = v112;
  *((_OWORD *)v22 + 13) = v111[2];
  *((_OWORD *)v22 + 14) = v24;
  long long v25 = v108;
  *((_OWORD *)v22 + 7) = v107;
  *((_OWORD *)v22 + 8) = v25;
  long long v26 = v110;
  *((_OWORD *)v22 + 9) = v109;
  *((_OWORD *)v22 + 10) = v26;
  long long v27 = v104[2];
  *((_OWORD *)v22 + 3) = v104[1];
  *((_OWORD *)v22 + 4) = v27;
  long long v28 = v106;
  *((_OWORD *)v22 + 5) = v105;
  *((_OWORD *)v22 + 6) = v28;
  long long v29 = v104[0];
  *((_OWORD *)v22 + 1) = v103;
  *((_OWORD *)v22 + 2) = v29;
  long long v113 = *(_OWORD *)((char *)v111 + 8);
  sub_249854AB0((uint64_t)&v115);
  sub_249854ADC((uint64_t)&v103);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8130);
  sub_249863730();
  uint64_t v30 = v90[0];
  uint64_t v31 = v90[1];
  char v32 = v91;
  long long v113 = v103;
  v114[0] = v104[0];
  *(_DWORD *)((char *)v114 + 15) = *(_DWORD *)((char *)v104 + 15);
  uint64_t v92 = v2;
  uint64_t v93 = sub_249855BD4(&qword_2696D8138, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleButton);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v90);
  *uint64_t v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7F80);
  swift_storeEnumTagMultiPayload();
  uint64_t v34 = (uint64_t (**)())((char *)v4 + v2[6]);
  *uint64_t v34 = sub_249854AA8;
  v34[1] = v22;
  uint64_t v35 = (char *)v4 + v2[5];
  *(void *)uint64_t v35 = v30;
  *((void *)v35 + 1) = v31;
  v35[16] = v32;
  uint64_t v36 = (char *)v4 + v2[7];
  long long v37 = v114[0];
  *(_OWORD *)uint64_t v36 = v113;
  *((_OWORD *)v36 + 1) = v37;
  *(_DWORD *)(v36 + 31) = *(_DWORD *)((char *)v114 + 15);
  sub_249855B70((uint64_t)v4, (uint64_t)boxed_opaque_existential_1);
  sub_24984ECA4((uint64_t)&v113);
  sub_249863850();
  sub_249855BD4(&qword_2696D8140, MEMORY[0x263F778A0]);
  uint64_t v38 = v74;
  uint64_t v39 = v76;
  sub_249863640();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v8, v39);
  uint64_t v41 = *((void *)&v109 + 1);
  uint64_t v40 = v110;
  sub_2498638A0();
  sub_249855BD4((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_249863490();
  uint64_t v44 = v43;
  uint64_t v46 = v79;
  uint64_t v45 = v80;
  uint64_t v47 = (uint64_t)v75;
  (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v75, v38, v80);
  uint64_t v48 = v78;
  uint64_t v49 = (uint64_t *)(v47 + *(int *)(v78 + 36));
  *uint64_t v49 = v42;
  v49[1] = v44;
  v49[2] = v41;
  v49[3] = v40;
  (*(void (**)(char *, uint64_t))(v46 + 8))(v38, v45);
  long long v50 = (_OWORD *)swift_allocObject();
  long long v51 = v111[1];
  v50[11] = v111[0];
  v50[12] = v51;
  long long v52 = v112;
  v50[13] = v111[2];
  v50[14] = v52;
  long long v53 = v108;
  v50[7] = v107;
  v50[8] = v53;
  long long v54 = v110;
  v50[9] = v109;
  v50[10] = v54;
  long long v55 = v104[2];
  v50[3] = v104[1];
  v50[4] = v55;
  long long v56 = v106;
  v50[5] = v105;
  v50[6] = v56;
  long long v57 = v104[0];
  v50[1] = v103;
  v50[2] = v57;
  sub_249854ADC((uint64_t)&v103);
  unint64_t v58 = sub_249855C28();
  unint64_t v59 = sub_249855D58();
  unint64_t v60 = sub_249855DAC();
  unint64_t v61 = sub_249855E00();
  long long v62 = v81;
  sub_2498635D0();
  swift_release();
  sub_24984E368(v47, &qword_2696D8118);
  long long v63 = (_OWORD *)swift_allocObject();
  long long v64 = v111[1];
  v63[11] = v111[0];
  v63[12] = v64;
  long long v65 = v112;
  v63[13] = v111[2];
  v63[14] = v65;
  long long v66 = v108;
  v63[7] = v107;
  v63[8] = v66;
  long long v67 = v110;
  v63[9] = v109;
  v63[10] = v67;
  long long v68 = v104[2];
  v63[3] = v104[1];
  v63[4] = v68;
  long long v69 = v106;
  v63[5] = v105;
  v63[6] = v69;
  long long v70 = v104[0];
  v63[1] = v103;
  v63[2] = v70;
  sub_249854ADC((uint64_t)&v103);
  *(void *)&long long v85 = v48;
  *((void *)&v85 + 1) = &type metadata for CarCommandsToggleSnippetUpdateValue;
  unint64_t v86 = v58;
  unint64_t v87 = v59;
  unint64_t v88 = v60;
  unint64_t v89 = v61;
  swift_getOpaqueTypeConformance2();
  sub_249855F00();
  sub_249855F54();
  sub_249855FA8();
  uint64_t v71 = v82;
  sub_2498635D0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v62, v71);
}

uint64_t sub_2498547E8(uint64_t a1)
{
  sub_2498639F0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_249863900();
  swift_bridgeObjectRelease();
  sub_249863900();
  if (qword_2696D7AF8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2498633E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2696D7E38);
  os_log_type_t v3 = sub_249863940();
  sub_24984A000(v3, 8, 0xD00000000000009ALL, 0x80000002498672D0, 2036625250, 0xE400000000000000, 74, 0x20676E69646E6553, 0xE800000000000000);
  swift_bridgeObjectRelease();
  sub_249854ADC(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8130);
  sub_249863710();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8128);
  sub_249863720();
  uint64_t v4 = *(void **)(a1 + 208);
  if (v4)
  {
    id v5 = v4;
    sub_2498572CC(a1);
    uint64_t v6 = sub_249854BCC();
    sub_249854D50(v6);
    swift_bridgeObjectRelease();
    sub_249863880();

    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2498638A0();
    sub_249855BD4((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
    uint64_t result = sub_249863480();
    __break(1u);
  }
  return result;
}

uint64_t sub_249854AA8()
{
  return sub_2498547E8(v0 + 16);
}

uint64_t sub_249854AB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_249854ADC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 208);
  sub_2498476F8();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_249854BCC()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v4 = v0[19];
  uint64_t v3 = v0[20];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D81C0);
  uint64_t inited = swift_initStackObject();
  uint64_t v6 = inited;
  *(_OWORD *)(inited + 16) = xmmword_2498654E0;
  *(void *)(inited + 32) = 0x4449707061;
  *(void *)(inited + 40) = 0xE500000000000000;
  uint64_t v7 = MEMORY[0x263F8D310];
  *(void *)(inited + 48) = v2;
  *(void *)(inited + 56) = v1;
  *(void *)(inited + 72) = v7;
  *(void *)(inited + 80) = 0x656D614E726163;
  *(void *)(inited + 88) = 0xE700000000000000;
  if (v3)
  {
    uint64_t v8 = MEMORY[0x263F8D310];
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v8 = 0;
    *(void *)(inited + 112) = 0;
  }
  *(void *)(inited + 96) = v4;
  *(void *)(inited + 104) = v3;
  *(void *)(inited + 120) = v8;
  *(void *)(inited + 128) = 0x4974657070696E73;
  *(void *)(inited + 136) = 0xEB000000006E4F73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8130);
  sub_249863710();
  uint64_t v9 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v6 + 144) = (v13 & 1) == 0;
  *(void *)(v6 + 168) = v9;
  *(void *)(v6 + 176) = 0xD00000000000001BLL;
  *(void *)(v6 + 184) = 0x80000002498673C0;
  *(void *)(v6 + 216) = v9;
  *(unsigned char *)(v6 + 192) = 1;
  unint64_t v10 = sub_249853188(v6);
  uint64_t v11 = sub_2498555C4(v10);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_249854D50(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D81B8);
    uint64_t v2 = sub_249863A90();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_24984AAAC(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_24984C9D0(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_24984C9D0(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_24984C9D0(v36, v37);
    sub_24984C9D0(v37, &v33);
    uint64_t result = sub_2498639C0();
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_24984C9D0(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_2498573C0();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_249855118()
{
  sub_2498639F0();
  sub_249863900();
  sub_249863A40();
  if (qword_2696D7AF8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2498633E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_2696D7E38);
  os_log_type_t v1 = sub_249863940();
  sub_24984A000(v1, 8, 0xD00000000000009ALL, 0x80000002498672D0, 2036625250, 0xE400000000000000, 89, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_249863790();
  MEMORY[0x270FA5388](v2);
  sub_249863470();
  return swift_release();
}

uint64_t sub_2498552BC(uint64_t a1)
{
  return sub_2498572CC(a1);
}

uint64_t sub_2498553A8()
{
  sub_2498639F0();
  sub_249863900();
  sub_249863A40();
  sub_249863900();
  if (qword_2696D7AF8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2498633E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_2696D7E38);
  os_log_type_t v1 = sub_249863940();
  sub_24984A000(v1, 8, 0xD00000000000009ALL, 0x80000002498672D0, 2036625250, 0xE400000000000000, 97, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_249863790();
  MEMORY[0x270FA5388](v2);
  sub_249863470();
  return swift_release();
}

uint64_t sub_249855560()
{
  return sub_249863720();
}

uint64_t sub_2498555C4(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8EE80];
  uint64_t v41 = MEMORY[0x263F8EE80];
  uint64_t v31 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  uint64_t v42 = &v35;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v7 << 6);
      goto LABEL_25;
    }
    int64_t v11 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v11 >= v30) {
      goto LABEL_40;
    }
    unint64_t v12 = *(void *)(v31 + 8 * v11);
    int64_t v13 = v7 + 1;
    if (!v12)
    {
      int64_t v13 = v7 + 2;
      if (v7 + 2 >= v30) {
        goto LABEL_40;
      }
      unint64_t v12 = *(void *)(v31 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v7 + 3;
        if (v7 + 3 >= v30) {
          goto LABEL_40;
        }
        unint64_t v12 = *(void *)(v31 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v7 + 4;
          if (v7 + 4 >= v30) {
            goto LABEL_40;
          }
          unint64_t v12 = *(void *)(v31 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v7 = v13;
LABEL_25:
    int64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_24984EDA4(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40, &qword_2696D81C8);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    long long v37 = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    sub_24984EDA4((uint64_t)v38, (uint64_t)&v32, &qword_2696D81C8);
    if (v33)
    {
      sub_24984C9D0(&v32, v36);
      long long v18 = v37;
      v34[2] = v37;
      sub_2498573C8((uint64_t)v38, (uint64_t)v42);
      sub_24984C9D0(v36, v34);
      unint64_t v19 = *(void *)(v2 + 16);
      if (*(void *)(v2 + 24) <= v19)
      {
        uint64_t v20 = v19 + 1;
        swift_bridgeObjectRetain();
        sub_24984B2C8(v20, 1);
        uint64_t v2 = v41;
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      sub_249863B90();
      sub_2498638E0();
      uint64_t result = sub_249863BC0();
      uint64_t v21 = v2 + 64;
      uint64_t v22 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v2 + 64 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v2 + 64 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v28 = v24 == v27;
          if (v24 == v27) {
            unint64_t v24 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v21 + 8 * v24);
        }
        while (v29 == -1);
        unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
      }
      *(void *)(v21 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
      *(_OWORD *)(*(void *)(v2 + 48) + 16 * v25) = v18;
      sub_24984C9D0(v34, (_OWORD *)(*(void *)(v2 + 56) + 32 * v25));
      ++*(void *)(v2 + 16);
      int64_t v8 = (long long *)v42;
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_24984E368((uint64_t)&v37, &qword_2696D81D0);
      int64_t v8 = &v32;
    }
    uint64_t result = sub_24984E368((uint64_t)v8, &qword_2696D81C8);
  }
  int64_t v14 = v7 + 5;
  if (v7 + 5 >= v30)
  {
LABEL_40:
    sub_2498573C0();
    return v2;
  }
  unint64_t v12 = *(void *)(v31 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v7 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v30) {
      goto LABEL_40;
    }
    unint64_t v12 = *(void *)(v31 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t CarCommandsToggleSnippet.asAnyView()()
{
  return sub_2498635B0();
}

uint64_t sub_249855A04()
{
  return sub_2498635B0();
}

uint64_t sub_249855A80()
{
  return sub_2498634C0();
}

uint64_t sub_249855AA4(uint64_t a1)
{
  uint64_t v2 = sub_249863410();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2498634D0();
}

uint64_t sub_249855B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsToggleButton();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_249855BD4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_249855C20()
{
  return sub_249855118();
}

unint64_t sub_249855C28()
{
  unint64_t result = qword_2696D8148;
  if (!qword_2696D8148)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D8118);
    sub_249863860();
    sub_249855BD4(&qword_2696D8140, MEMORY[0x263F778A0]);
    swift_getOpaqueTypeConformance2();
    sub_249855D04();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8148);
  }
  return result;
}

unint64_t sub_249855D04()
{
  unint64_t result = qword_2696D8150;
  if (!qword_2696D8150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8150);
  }
  return result;
}

unint64_t sub_249855D58()
{
  unint64_t result = qword_2696D8158;
  if (!qword_2696D8158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8158);
  }
  return result;
}

unint64_t sub_249855DAC()
{
  unint64_t result = qword_2696D8160;
  if (!qword_2696D8160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8160);
  }
  return result;
}

unint64_t sub_249855E00()
{
  unint64_t result = qword_2696D8168;
  if (!qword_2696D8168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8168);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  sub_249847628();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 240, 7);
}

uint64_t sub_249855EF8()
{
  return sub_2498553A8();
}

unint64_t sub_249855F00()
{
  unint64_t result = qword_2696D8170;
  if (!qword_2696D8170)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8170);
  }
  return result;
}

unint64_t sub_249855F54()
{
  unint64_t result = qword_2696D8178;
  if (!qword_2696D8178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8178);
  }
  return result;
}

unint64_t sub_249855FA8()
{
  unint64_t result = qword_2696D8180;
  if (!qword_2696D8180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8180);
  }
  return result;
}

uint64_t sub_249855FFC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippetUpdateValue(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CarCommandsToggleSnippetUpdateValue(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x249856184);
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

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetUpdateValue()
{
  return &type metadata for CarCommandsToggleSnippetUpdateValue;
}

void *initializeBufferWithCopyOfBuffer for CarCommandsToggleSnippetUpdateFailure(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CarCommandsToggleSnippetUpdateFailure()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for CarCommandsToggleSnippetUpdateFailure(void *a1, void *a2)
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

void *assignWithTake for CarCommandsToggleSnippetUpdateFailure(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippetUpdateFailure(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippetUpdateFailure(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetUpdateFailure()
{
  return &type metadata for CarCommandsToggleSnippetUpdateFailure;
}

void destroy for CarCommandsToggleSnippet(uint64_t a1)
{
  sub_249847628();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v2 = *(void **)(a1 + 208);
}

uint64_t initializeWithCopy for CarCommandsToggleSnippet(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  char v8 = *((unsigned char *)a2 + 32);
  sub_2498476F8();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  *(_WORD *)(a1 + 33) = *(_WORD *)((char *)a2 + 33);
  uint64_t v9 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v9;
  uint64_t v10 = a2[8];
  *(void *)(a1 + 56) = a2[7];
  *(void *)(a1 + 64) = v10;
  uint64_t v11 = a2[10];
  *(void *)(a1 + 72) = a2[9];
  *(void *)(a1 + 80) = v11;
  uint64_t v12 = a2[12];
  *(void *)(a1 + 88) = a2[11];
  *(void *)(a1 + 96) = v12;
  uint64_t v13 = a2[14];
  *(void *)(a1 + 104) = a2[13];
  *(void *)(a1 + 112) = v13;
  uint64_t v14 = a2[16];
  *(void *)(a1 + 120) = a2[15];
  *(void *)(a1 + 128) = v14;
  uint64_t v15 = a2[18];
  *(void *)(a1 + 136) = a2[17];
  *(void *)(a1 + 144) = v15;
  uint64_t v16 = a2[20];
  *(void *)(a1 + 152) = a2[19];
  *(void *)(a1 + 160) = v16;
  *(unsigned char *)(a1 + 168) = *((unsigned char *)a2 + 168);
  uint64_t v17 = a2[23];
  *(void *)(a1 + 176) = a2[22];
  *(void *)(a1 + 184) = v17;
  uint64_t v23 = a2[25];
  *(void *)(a1 + 192) = a2[24];
  *(void *)(a1 + 200) = v23;
  unint64_t v19 = (void *)a2[26];
  uint64_t v18 = a2[27];
  *(void *)(a1 + 208) = v19;
  *(void *)(a1 + 216) = v18;
  uint64_t v20 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  id v21 = v20;
  return a1;
}

uint64_t assignWithCopy for CarCommandsToggleSnippet(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  char v8 = *((unsigned char *)a2 + 32);
  sub_2498476F8();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(unsigned char *)(a1 + 32) = v8;
  sub_249847628();
  *(unsigned char *)(a1 + 33) = *((unsigned char *)a2 + 33);
  *(unsigned char *)(a1 + 34) = *((unsigned char *)a2 + 34);
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = a2[7];
  *(void *)(a1 + 64) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = a2[9];
  *(void *)(a1 + 80) = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = a2[11];
  *(void *)(a1 + 96) = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = a2[13];
  *(void *)(a1 + 112) = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = a2[15];
  *(void *)(a1 + 128) = a2[16];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = a2[17];
  *(void *)(a1 + 144) = a2[18];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = a2[19];
  *(void *)(a1 + 160) = a2[20];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 168) = *((unsigned char *)a2 + 168);
  *(void *)(a1 + 176) = a2[22];
  swift_retain();
  swift_release();
  *(void *)(a1 + 184) = a2[23];
  *(void *)(a1 + 192) = a2[24];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = a2[25];
  swift_retain();
  swift_release();
  uint64_t v9 = *(void **)(a1 + 208);
  uint64_t v10 = (void *)a2[26];
  *(void *)(a1 + 208) = v10;
  id v11 = v10;

  *(void *)(a1 + 216) = a2[27];
  return a1;
}

__n128 __swift_memcpy224_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  __n128 result = *(__n128 *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  long long v11 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v11;
  *(__n128 *)(a1 + 160) = result;
  *(_OWORD *)(a1 + 176) = v10;
  return result;
}

uint64_t assignWithTake for CarCommandsToggleSnippet(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 32);
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 32) = v4;
  sub_249847628();
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v13;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_release();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  swift_release();
  uint64_t v14 = *(void **)(a1 + 208);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);

  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 224)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 216) = 0;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 224) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 224) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippet()
{
  return &type metadata for CarCommandsToggleSnippet;
}

uint64_t sub_249856930()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for CarCommandsToggleSnippet.DirectInvocationConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CarCommandsToggleSnippet.DirectInvocationConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CarCommandsToggleSnippet.DirectInvocationConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for CarCommandsToggleSnippet.DirectInvocationConfiguration(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippet.DirectInvocationConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippet.DirectInvocationConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippet.DirectInvocationConfiguration()
{
  return &type metadata for CarCommandsToggleSnippet.DirectInvocationConfiguration;
}

uint64_t destroy for CarCommandsToggleSnippet.LabelConfiguration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CarCommandsToggleSnippet.LabelConfiguration(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CarCommandsToggleSnippet.LabelConfiguration(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

void *assignWithTake for CarCommandsToggleSnippet.LabelConfiguration(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsToggleSnippet.LabelConfiguration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsToggleSnippet.LabelConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippet.LabelConfiguration()
{
  return &type metadata for CarCommandsToggleSnippet.LabelConfiguration;
}

uint64_t sub_249856F40()
{
  return 0;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetUpdateFailure.CodingKeys()
{
  return &type metadata for CarCommandsToggleSnippetUpdateFailure.CodingKeys;
}

uint64_t _s22CarCommandsUIFramework37CarCommandsToggleSnippetUpdateFailureV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s22CarCommandsUIFramework37CarCommandsToggleSnippetUpdateFailureV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x249857044);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsToggleSnippetUpdateValue.CodingKeys()
{
  return &type metadata for CarCommandsToggleSnippetUpdateValue.CodingKeys;
}

unint64_t sub_249857080()
{
  unint64_t result = qword_2696D8188;
  if (!qword_2696D8188)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8188);
  }
  return result;
}

unint64_t sub_2498570D8()
{
  unint64_t result = qword_2696D8190;
  if (!qword_2696D8190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8190);
  }
  return result;
}

unint64_t sub_249857130()
{
  unint64_t result = qword_2696D8198;
  if (!qword_2696D8198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8198);
  }
  return result;
}

unint64_t sub_249857188()
{
  unint64_t result = qword_2696D81A0;
  if (!qword_2696D81A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D81A0);
  }
  return result;
}

unint64_t sub_2498571E0()
{
  unint64_t result = qword_2696D81A8;
  if (!qword_2696D81A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D81A8);
  }
  return result;
}

unint64_t sub_249857238()
{
  unint64_t result = qword_2696D81B0;
  if (!qword_2696D81B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D81B0);
  }
  return result;
}

uint64_t sub_24985728C()
{
  return sub_249855560();
}

uint64_t sub_2498572AC()
{
  return sub_2498552BC(*(void *)(v0 + 16));
}

uint64_t sub_2498572CC(uint64_t a1)
{
  int v3 = *(void **)(a1 + 208);
  sub_249847628();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return a1;
}

uint64_t sub_2498573C0()
{
  return swift_release();
}

uint64_t sub_2498573C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D81C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t static CarCommandsSnippetsPluginModel.bundleName.getter()
{
  return 0xD000000000000013;
}

unint64_t sub_249857458(char a1)
{
  unint64_t result = 0x616D7269666E6F63;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x68636E7550707061;
      break;
    case 2:
      unint64_t result = 0x746174536B636F6CLL;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0xD000000000000012;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0xD000000000000018;
      break;
    case 7:
    case 9:
      unint64_t result = 0xD000000000000015;
      break;
    case 8:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2498575B0()
{
  return 12383;
}

uint64_t sub_2498575C0(uint64_t a1)
{
  unint64_t v2 = sub_249858EF0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2498575FC(uint64_t a1)
{
  unint64_t v2 = sub_249858EF0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_249857638(uint64_t a1)
{
  unint64_t v2 = sub_24985913C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249857674(uint64_t a1)
{
  unint64_t v2 = sub_24985913C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2498576B0(uint64_t a1)
{
  unint64_t v2 = sub_249858FEC();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2498576EC(uint64_t a1)
{
  unint64_t v2 = sub_249858FEC();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_249857728(uint64_t a1)
{
  unint64_t v2 = sub_249858E9C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249857764(uint64_t a1)
{
  unint64_t v2 = sub_249858E9C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2498577A0(uint64_t a1)
{
  unint64_t v2 = sub_249859040();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2498577DC(uint64_t a1)
{
  unint64_t v2 = sub_249859040();
  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t sub_249857818()
{
  return sub_249857458(*v0);
}

uint64_t sub_249857820@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24985DD20(a1, a2);
  *a3 = result;
  return result;
}

void sub_249857848(unsigned char *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_249857854(uint64_t a1)
{
  unint64_t v2 = sub_249858DE4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249857890(uint64_t a1)
{
  unint64_t v2 = sub_249858DE4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2498578CC(uint64_t a1)
{
  unint64_t v2 = sub_249859190();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249857908(uint64_t a1)
{
  unint64_t v2 = sub_249859190();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_249857944(uint64_t a1)
{
  unint64_t v2 = sub_2498590E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249857980(uint64_t a1)
{
  unint64_t v2 = sub_2498590E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2498579BC(uint64_t a1)
{
  unint64_t v2 = sub_249858F44();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2498579F8(uint64_t a1)
{
  unint64_t v2 = sub_249858F44();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_249857A34(uint64_t a1)
{
  unint64_t v2 = sub_249859094();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249857A70(uint64_t a1)
{
  unint64_t v2 = sub_249859094();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_249857AAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_249863B70();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_249857B2C(uint64_t a1)
{
  unint64_t v2 = sub_249858F98();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_249857B68(uint64_t a1)
{
  unint64_t v2 = sub_249858F98();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CarCommandsSnippetsPluginModel.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D81F0);
  uint64_t v101 = *(void *)(v2 - 8);
  uint64_t v102 = v2;
  MEMORY[0x270FA5388](v2);
  long long v100 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D81F8);
  uint64_t v98 = *(void *)(v4 - 8);
  uint64_t v99 = v4;
  MEMORY[0x270FA5388](v4);
  long long v97 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  uint64_t v6 = MEMORY[0x270FA5388](v103);
  uint64_t v96 = (uint64_t)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v95 = (uint64_t)&v62 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8200);
  uint64_t v93 = *(void *)(v9 - 8);
  uint64_t v94 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v92 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  MEMORY[0x270FA5388](v89);
  uint64_t v91 = (uint64_t)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8208);
  uint64_t v88 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  unint64_t v87 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8210);
  uint64_t v85 = *(void *)(v86 - 8);
  MEMORY[0x270FA5388](v86);
  uint64_t v84 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8218);
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v81 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8220);
  uint64_t v79 = *(void *)(v80 - 8);
  MEMORY[0x270FA5388](v80);
  uint64_t v78 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8228);
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v74 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  uint64_t v17 = MEMORY[0x270FA5388](v104);
  uint64_t v75 = (uint64_t)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v73 = (uint64_t)&v62 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v72 = (uint64_t)&v62 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v71 = (uint64_t)&v62 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v70 = (uint64_t)&v62 - v25;
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8230);
  uint64_t v68 = *(void *)(v69 - 8);
  MEMORY[0x270FA5388](v69);
  long long v67 = (char *)&v62 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  MEMORY[0x270FA5388](v65);
  uint64_t v66 = (uint64_t)&v62 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8238);
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v29 = (char *)&v62 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  MEMORY[0x270FA5388](v30);
  long long v32 = (char *)&v62 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = type metadata accessor for CarCommandsSnippetsPluginModel();
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = (char *)&v62 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8240);
  v107[0] = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  long long v37 = (char *)&v62 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_249858DE4();
  long long v105 = v37;
  sub_249863BE0();
  sub_249858E38(v107[1], (uint64_t)v35);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v38 = type metadata accessor for CarCommandsAppPunchoutSnippetModel;
      uint64_t v43 = (uint64_t)v35;
      uint64_t v44 = v66;
      sub_24985A740(v43, v66, type metadata accessor for CarCommandsAppPunchoutSnippetModel);
      char v109 = 1;
      sub_24985913C();
      uint64_t v45 = v67;
      uint64_t v40 = v105;
      uint64_t v39 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7C90, (void (*)(uint64_t))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
      uint64_t v46 = v69;
      sub_249863B40();
      uint64_t v47 = &v100;
      goto LABEL_5;
    case 2u:
      uint64_t v38 = type metadata accessor for CarCommandsToggleSnippetModel;
      uint64_t v48 = (uint64_t)v35;
      uint64_t v44 = v70;
      sub_24985A740(v48, v70, type metadata accessor for CarCommandsToggleSnippetModel);
      v110[16] = 2;
      sub_2498590E8();
      uint64_t v45 = v74;
      uint64_t v40 = v105;
      uint64_t v39 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7CA0, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v46 = v77;
      sub_249863B40();
      uint64_t v47 = (char **)v107;
LABEL_5:
      (*((void (**)(char *, uint64_t))*(v47 - 32) + 1))(v45, v46);
      uint64_t v42 = v44;
      goto LABEL_6;
    case 3u:
      uint64_t v50 = v71;
      sub_24985A740((uint64_t)v35, v71, type metadata accessor for CarCommandsToggleSnippetModel);
      v110[17] = 3;
      sub_249859094();
      long long v51 = v78;
      long long v53 = v105;
      uint64_t v52 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7CA0, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v54 = v80;
      sub_249863B40();
      long long v55 = (uint64_t *)v110;
      goto LABEL_11;
    case 4u:
      uint64_t v50 = v72;
      sub_24985A740((uint64_t)v35, v72, type metadata accessor for CarCommandsToggleSnippetModel);
      v110[18] = 4;
      sub_249859040();
      long long v51 = v81;
      long long v53 = v105;
      uint64_t v52 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7CA0, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v54 = v83;
      sub_249863B40();
      long long v55 = &v111;
      goto LABEL_11;
    case 5u:
      uint64_t v50 = v73;
      sub_24985A740((uint64_t)v35, v73, type metadata accessor for CarCommandsToggleSnippetModel);
      v110[19] = 5;
      sub_249858FEC();
      long long v51 = v84;
      long long v53 = v105;
      uint64_t v52 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7CA0, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v54 = v86;
      sub_249863B40();
      long long v55 = &v112;
      goto LABEL_11;
    case 6u:
      uint64_t v50 = v75;
      sub_24985A740((uint64_t)v35, v75, type metadata accessor for CarCommandsToggleSnippetModel);
      v110[20] = 6;
      sub_249858F98();
      long long v51 = v87;
      long long v53 = v105;
      uint64_t v52 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7CA0, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v54 = v90;
      sub_249863B40();
      long long v55 = &v113;
LABEL_11:
      (*(void (**)(char *, uint64_t))(*(v55 - 32) + 8))(v51, v54);
      long long v56 = type metadata accessor for CarCommandsToggleSnippetModel;
      goto LABEL_16;
    case 7u:
      uint64_t v50 = v91;
      sub_24985A740((uint64_t)v35, v91, type metadata accessor for CarCommandsGaugeSnippetModel);
      v110[21] = 7;
      sub_249858F44();
      long long v57 = v92;
      long long v53 = v105;
      uint64_t v52 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7CB0, (void (*)(uint64_t))type metadata accessor for CarCommandsGaugeSnippetModel);
      uint64_t v58 = v94;
      sub_249863B40();
      (*(void (**)(char *, uint64_t))(v93 + 8))(v57, v58);
      long long v56 = type metadata accessor for CarCommandsGaugeSnippetModel;
      goto LABEL_16;
    case 8u:
      uint64_t v50 = v95;
      sub_24985A740((uint64_t)v35, v95, type metadata accessor for CarCommandsDisambiguationSnippetModel);
      v110[22] = 8;
      sub_249858EF0();
      unint64_t v59 = v97;
      long long v53 = v105;
      uint64_t v52 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7CC0, (void (*)(uint64_t))type metadata accessor for CarCommandsDisambiguationSnippetModel);
      uint64_t v60 = v99;
      sub_249863B40();
      uint64_t v61 = v98;
      goto LABEL_15;
    case 9u:
      uint64_t v50 = v96;
      sub_24985A740((uint64_t)v35, v96, type metadata accessor for CarCommandsDisambiguationSnippetModel);
      v110[23] = 9;
      sub_249858E9C();
      unint64_t v59 = v100;
      long long v53 = v105;
      uint64_t v52 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7CC0, (void (*)(uint64_t))type metadata accessor for CarCommandsDisambiguationSnippetModel);
      uint64_t v60 = v102;
      sub_249863B40();
      uint64_t v61 = v101;
LABEL_15:
      (*(void (**)(char *, uint64_t))(v61 + 8))(v59, v60);
      long long v56 = type metadata accessor for CarCommandsDisambiguationSnippetModel;
LABEL_16:
      sub_24985C2F4(v50, v56);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v107[0] + 8))(v53, v52);
      break;
    default:
      uint64_t v38 = type metadata accessor for CarCommandsConfirmationSnippetModel;
      sub_24985A740((uint64_t)v35, (uint64_t)v32, type metadata accessor for CarCommandsConfirmationSnippetModel);
      char v108 = 0;
      sub_249859190();
      uint64_t v40 = v105;
      uint64_t v39 = v106;
      sub_249863B10();
      sub_24985A838(&qword_2696D7C80, (void (*)(uint64_t))type metadata accessor for CarCommandsConfirmationSnippetModel);
      uint64_t v41 = v64;
      sub_249863B40();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v29, v41);
      uint64_t v42 = (uint64_t)v32;
LABEL_6:
      sub_24985C2F4(v42, v38);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v107[0] + 8))(v40, v39);
      break;
  }
  return result;
}

uint64_t type metadata accessor for CarCommandsSnippetsPluginModel()
{
  uint64_t result = qword_2696D8310;
  if (!qword_2696D8310) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_249858DE4()
{
  unint64_t result = qword_2696D8248;
  if (!qword_2696D8248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8248);
  }
  return result;
}

uint64_t sub_249858E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsSnippetsPluginModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_249858E9C()
{
  unint64_t result = qword_2696D8250;
  if (!qword_2696D8250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8250);
  }
  return result;
}

unint64_t sub_249858EF0()
{
  unint64_t result = qword_2696D8258;
  if (!qword_2696D8258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8258);
  }
  return result;
}

unint64_t sub_249858F44()
{
  unint64_t result = qword_2696D8260;
  if (!qword_2696D8260)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8260);
  }
  return result;
}

unint64_t sub_249858F98()
{
  unint64_t result = qword_2696D8268;
  if (!qword_2696D8268)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8268);
  }
  return result;
}

unint64_t sub_249858FEC()
{
  unint64_t result = qword_2696D8270;
  if (!qword_2696D8270)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8270);
  }
  return result;
}

unint64_t sub_249859040()
{
  unint64_t result = qword_2696D8278;
  if (!qword_2696D8278)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8278);
  }
  return result;
}

unint64_t sub_249859094()
{
  unint64_t result = qword_2696D8280;
  if (!qword_2696D8280)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8280);
  }
  return result;
}

unint64_t sub_2498590E8()
{
  unint64_t result = qword_2696D8288;
  if (!qword_2696D8288)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8288);
  }
  return result;
}

unint64_t sub_24985913C()
{
  unint64_t result = qword_2696D8290;
  if (!qword_2696D8290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8290);
  }
  return result;
}

unint64_t sub_249859190()
{
  unint64_t result = qword_2696D8298;
  if (!qword_2696D8298)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8298);
  }
  return result;
}

uint64_t CarCommandsSnippetsPluginModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v138 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82A0);
  uint64_t v129 = *(void *)(v3 - 8);
  uint64_t v130 = v3;
  MEMORY[0x270FA5388](v3);
  v144 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82A8);
  uint64_t v127 = *(void *)(v128 - 8);
  MEMORY[0x270FA5388](v128);
  v137 = (char *)&v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82B0);
  uint64_t v125 = *(void *)(v126 - 8);
  MEMORY[0x270FA5388](v126);
  v136 = (char *)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82B8);
  uint64_t v123 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  v135 = (char *)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82C0);
  uint64_t v121 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  v134 = (char *)&v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82C8);
  uint64_t v119 = *(void *)(v120 - 8);
  MEMORY[0x270FA5388](v120);
  v143 = (char *)&v100 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82D0);
  uint64_t v118 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  v142 = (char *)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82D8);
  uint64_t v115 = *(void *)(v116 - 8);
  MEMORY[0x270FA5388](v116);
  v133 = (char *)&v100 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82E0);
  uint64_t v113 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  v132 = (char *)&v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82E8);
  uint64_t v111 = *(void *)(v112 - 8);
  MEMORY[0x270FA5388](v112);
  v131 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82F0);
  uint64_t v139 = *(void *)(v141 - 8);
  MEMORY[0x270FA5388](v141);
  uint64_t v15 = (char *)&v100 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v145 = type metadata accessor for CarCommandsSnippetsPluginModel();
  uint64_t v16 = MEMORY[0x270FA5388](v145);
  long long v110 = (char *)&v100 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  char v109 = (char *)&v100 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  char v108 = (char *)&v100 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  long long v107 = (char *)&v100 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v106 = (char *)&v100 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  long long v105 = (char *)&v100 - v27;
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v30 = (char *)&v100 - v29;
  uint64_t v31 = MEMORY[0x270FA5388](v28);
  uint64_t v33 = (char *)&v100 - v32;
  uint64_t v34 = MEMORY[0x270FA5388](v31);
  uint64_t v36 = (char *)&v100 - v35;
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v39 = (char *)&v100 - v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v100 - v40;
  uint64_t v42 = a1[3];
  v146 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v42);
  sub_249858DE4();
  v140 = v15;
  uint64_t v43 = v147;
  sub_249863BD0();
  if (v43) {
    goto LABEL_25;
  }
  long long v100 = v36;
  uint64_t v101 = v33;
  uint64_t v102 = v30;
  uint64_t v103 = v39;
  uint64_t v44 = v142;
  uint64_t v45 = v143;
  uint64_t v147 = 0;
  uint64_t v46 = v144;
  uint64_t v104 = v41;
  uint64_t v47 = v145;
  uint64_t v48 = v140;
  uint64_t v49 = v141;
  uint64_t v50 = sub_249863B00();
  if (*(void *)(v50 + 16) != 1)
  {
    uint64_t v56 = sub_249863A20();
    swift_allocError();
    uint64_t v58 = v57;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696D82F8);
    *uint64_t v58 = v47;
    sub_249863AC0();
    sub_249863A10();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v56 - 8) + 104))(v58, *MEMORY[0x263F8DCB0], v56);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v139 + 8))(v48, v49);
LABEL_25:
    uint64_t v55 = (uint64_t)v146;
    return __swift_destroy_boxed_opaque_existential_1(v55);
  }
  switch(*(unsigned char *)(v50 + 32))
  {
    case 1:
      char v149 = 1;
      sub_24985913C();
      unint64_t v59 = v132;
      uint64_t v60 = v147;
      sub_249863AB0();
      if (v60) {
        goto LABEL_24;
      }
      type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
      sub_24985A838(&qword_2696D7C88, (void (*)(uint64_t))type metadata accessor for CarCommandsAppPunchoutSnippetModel);
      uint64_t v53 = (uint64_t)v100;
      uint64_t v61 = v114;
      sub_249863AF0();
      (*(void (**)(char *, uint64_t))(v113 + 8))(v59, v61);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v139 + 8))(v48, v49);
      uint64_t v55 = (uint64_t)v146;
      swift_storeEnumTagMultiPayload();
      goto LABEL_31;
    case 2:
      char v150 = 2;
      sub_2498590E8();
      uint64_t v62 = v133;
      uint64_t v63 = v147;
      sub_249863AB0();
      if (v63) {
        goto LABEL_24;
      }
      type metadata accessor for CarCommandsToggleSnippetModel(0);
      sub_24985A838(&qword_2696D7C98, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v53 = (uint64_t)v101;
      uint64_t v64 = v116;
      sub_249863AF0();
      uint64_t v65 = v139;
      (*(void (**)(char *, uint64_t))(v115 + 8))(v62, v64);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v48, v49);
      swift_storeEnumTagMultiPayload();
      goto LABEL_30;
    case 3:
      char v151 = 3;
      sub_249859094();
      uint64_t v66 = v44;
      uint64_t v67 = v147;
      sub_249863AB0();
      if (v67) {
        goto LABEL_24;
      }
      type metadata accessor for CarCommandsToggleSnippetModel(0);
      sub_24985A838(&qword_2696D7C98, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v68 = (uint64_t)v102;
      uint64_t v69 = v117;
      sub_249863AF0();
      uint64_t v70 = v139;
      (*(void (**)(char *, uint64_t))(v118 + 8))(v66, v69);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v48, v49);
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = v68;
      goto LABEL_30;
    case 4:
      char v152 = 4;
      sub_249859040();
      uint64_t v71 = v147;
      sub_249863AB0();
      if (v71) {
        goto LABEL_24;
      }
      type metadata accessor for CarCommandsToggleSnippetModel(0);
      sub_24985A838(&qword_2696D7C98, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v75 = v105;
      uint64_t v95 = v120;
      sub_249863AF0();
      uint64_t v96 = v139;
      (*(void (**)(char *, uint64_t))(v119 + 8))(v45, v95);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v96 + 8))(v48, v49);
      goto LABEL_29;
    case 5:
      char v153 = 5;
      sub_249858FEC();
      uint64_t v72 = v134;
      uint64_t v73 = v147;
      sub_249863AB0();
      if (v73) {
        goto LABEL_24;
      }
      type metadata accessor for CarCommandsToggleSnippetModel(0);
      uint64_t v74 = v72;
      sub_24985A838(&qword_2696D7C98, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v75 = v106;
      uint64_t v76 = v122;
      sub_249863AF0();
      uint64_t v77 = v139;
      (*(void (**)(char *, uint64_t))(v121 + 8))(v74, v76);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v77 + 8))(v48, v49);
      goto LABEL_29;
    case 6:
      char v154 = 6;
      sub_249858F98();
      uint64_t v78 = v135;
      uint64_t v79 = v147;
      sub_249863AB0();
      if (v79) {
        goto LABEL_24;
      }
      type metadata accessor for CarCommandsToggleSnippetModel(0);
      uint64_t v80 = v78;
      sub_24985A838(&qword_2696D7C98, (void (*)(uint64_t))type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v75 = v107;
      uint64_t v81 = v124;
      sub_249863AF0();
      uint64_t v82 = v139;
      (*(void (**)(char *, uint64_t))(v123 + 8))(v80, v81);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v48, v49);
      goto LABEL_29;
    case 7:
      char v155 = 7;
      sub_249858F44();
      uint64_t v83 = v136;
      uint64_t v84 = v147;
      sub_249863AB0();
      if (v84) {
        goto LABEL_24;
      }
      type metadata accessor for CarCommandsGaugeSnippetModel(0);
      uint64_t v85 = v83;
      sub_24985A838(&qword_2696D7CA8, (void (*)(uint64_t))type metadata accessor for CarCommandsGaugeSnippetModel);
      uint64_t v75 = v108;
      uint64_t v86 = v126;
      sub_249863AF0();
      uint64_t v87 = v139;
      (*(void (**)(char *, uint64_t))(v125 + 8))(v85, v86);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v48, v49);
      goto LABEL_29;
    case 8:
      char v156 = 8;
      sub_249858EF0();
      uint64_t v88 = v137;
      uint64_t v89 = v147;
      sub_249863AB0();
      if (v89) {
        goto LABEL_24;
      }
      type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
      uint64_t v90 = v88;
      sub_24985A838(&qword_2696D7CB8, (void (*)(uint64_t))type metadata accessor for CarCommandsDisambiguationSnippetModel);
      uint64_t v75 = v109;
      uint64_t v91 = v128;
      sub_249863AF0();
      uint64_t v92 = v139;
      (*(void (**)(char *, uint64_t))(v127 + 8))(v90, v91);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v92 + 8))(v48, v49);
      goto LABEL_29;
    case 9:
      char v157 = 9;
      sub_249858E9C();
      uint64_t v93 = v147;
      sub_249863AB0();
      if (v93) {
        goto LABEL_24;
      }
      type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
      sub_24985A838(&qword_2696D7CB8, (void (*)(uint64_t))type metadata accessor for CarCommandsDisambiguationSnippetModel);
      uint64_t v75 = v110;
      uint64_t v97 = v130;
      sub_249863AF0();
      uint64_t v98 = v139;
      (*(void (**)(char *, uint64_t))(v129 + 8))(v46, v97);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v98 + 8))(v48, v49);
LABEL_29:
      swift_storeEnumTagMultiPayload();
      uint64_t v53 = (uint64_t)v75;
LABEL_30:
      uint64_t v55 = (uint64_t)v146;
      goto LABEL_31;
    default:
      char v148 = 0;
      sub_249859190();
      long long v51 = v131;
      uint64_t v52 = v147;
      sub_249863AB0();
      if (v52)
      {
LABEL_24:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v139 + 8))(v48, v49);
        goto LABEL_25;
      }
      type metadata accessor for CarCommandsConfirmationSnippetModel(0);
      sub_24985A838(&qword_2696D7C78, (void (*)(uint64_t))type metadata accessor for CarCommandsConfirmationSnippetModel);
      uint64_t v53 = (uint64_t)v103;
      uint64_t v54 = v112;
      sub_249863AF0();
      (*(void (**)(char *, uint64_t))(v111 + 8))(v51, v54);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v139 + 8))(v48, v49);
      uint64_t v55 = (uint64_t)v146;
      swift_storeEnumTagMultiPayload();
LABEL_31:
      uint64_t v99 = (uint64_t)v104;
      sub_24985A740(v53, (uint64_t)v104, (uint64_t (*)(void))type metadata accessor for CarCommandsSnippetsPluginModel);
      sub_24985A740(v99, v138, (uint64_t (*)(void))type metadata accessor for CarCommandsSnippetsPluginModel);
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1(v55);
}

uint64_t sub_24985A740(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24985A7A8()
{
  return sub_24985A838(&qword_2696D8300, (void (*)(uint64_t))type metadata accessor for CarCommandsSnippetsPluginModel);
}

uint64_t sub_24985A7F0()
{
  return sub_24985A838(&qword_2696D8308, (void (*)(uint64_t))type metadata accessor for CarCommandsSnippetsPluginModel);
}

uint64_t sub_24985A838(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24985A880()
{
  return 0xD000000000000013;
}

uint64_t sub_24985A8A0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CarCommandsSnippetsPluginModel.init(from:)(a1, a2);
}

uint64_t sub_24985A8B8(void *a1)
{
  return CarCommandsSnippetsPluginModel.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for CarCommandsSnippetsPluginModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16);
        v11(a1, a2, v10);
        uint64_t v12 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
        v11((uint64_t *)((char *)a1 + *(int *)(v12 + 20)), (uint64_t *)((char *)a2 + *(int *)(v12 + 20)), v10);
        break;
      case 2u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v14 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v13 - 8) + 16);
        v14(a1, a2, v13);
        uint64_t v15 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
        v14((uint64_t *)((char *)a1 + v15[5]), (uint64_t *)((char *)a2 + v15[5]), v13);
        v14((uint64_t *)((char *)a1 + v15[6]), (uint64_t *)((char *)a2 + v15[6]), v13);
        v14((uint64_t *)((char *)a1 + v15[7]), (uint64_t *)((char *)a2 + v15[7]), v13);
        v14((uint64_t *)((char *)a1 + v15[8]), (uint64_t *)((char *)a2 + v15[8]), v13);
        uint64_t v16 = v15[9];
        uint64_t v17 = (char *)a1 + v16;
        uint64_t v18 = (char *)a2 + v16;
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
        v14((uint64_t *)((char *)a1 + v15[10]), (uint64_t *)((char *)a2 + v15[10]), v13);
        uint64_t v20 = v15[11];
        uint64_t v21 = (char *)a1 + v20;
        uint64_t v22 = (char *)a2 + v20;
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
        break;
      case 7u:
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v25 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v24 - 8) + 16);
        v25(a1, a2, v24);
        uint64_t v26 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
        v25((uint64_t *)((char *)a1 + v26[5]), (uint64_t *)((char *)a2 + v26[5]), v24);
        uint64_t v27 = v26[6];
        uint64_t v28 = (char *)a1 + v27;
        uint64_t v29 = (char *)a2 + v27;
        uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
        uint64_t v31 = v26[7];
        uint64_t v32 = (char *)a1 + v31;
        uint64_t v33 = (char *)a2 + v31;
        uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
        uint64_t v35 = v26[8];
        uint64_t v36 = (char *)a1 + v35;
        uint64_t v37 = (char *)a2 + v35;
        uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
        v25((uint64_t *)((char *)a1 + v26[9]), (uint64_t *)((char *)a2 + v26[9]), v24);
        break;
      case 8u:
      case 9u:
        uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v39 - 8) + 16))(a1, a2, v39);
        uint64_t v40 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
        uint64_t v41 = (char *)a1 + v40;
        uint64_t v42 = (char *)a2 + v40;
        uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7C08);
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16))(v41, v42, v43);
        break;
      default:
        uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v7 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v6 - 8) + 16);
        v7(a1, a2, v6);
        uint64_t v8 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
        v7((uint64_t *)((char *)a1 + *(int *)(v8 + 20)), (uint64_t *)((char *)a2 + *(int *)(v8 + 20)), v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CarCommandsSnippetsPluginModel(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v25)((void *)(v15 - 8), a1, v15);
      uint64_t v16 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
      goto LABEL_7;
    case 1:
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v25)((void *)(v15 - 8), a1, v15);
      uint64_t v16 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
LABEL_7:
      uint64_t v17 = *(int *)(v16 + 20);
      goto LABEL_9;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      v4(a1, v3);
      int v5 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
      v4(a1 + v5[5], v3);
      v4(a1 + v5[6], v3);
      v4(a1 + v5[7], v3);
      v4(a1 + v5[8], v3);
      uint64_t v6 = a1 + v5[9];
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
      v4(a1 + v5[10], v3);
      uint64_t v8 = a1 + v5[11];
      uint64_t v9 = &qword_2696D7B18;
      goto LABEL_4;
    case 7:
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v25 = *(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8);
      ((void (*)(void *__return_ptr, uint64_t, uint64_t))v25)((void *)(v15 - 8), a1, v15);
      uint64_t v18 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
      v25(a1 + v18[5], v15);
      uint64_t v19 = a1 + v18[6];
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
      uint64_t v21 = a1 + v18[7];
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
      uint64_t v23 = a1 + v18[8];
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
      uint64_t v17 = v18[9];
LABEL_9:
      uint64_t v14 = a1 + v17;
      uint64_t v13 = v15;
      uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))v25;
      goto LABEL_10;
    case 8:
    case 9:
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
      uint64_t v8 = a1 + *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
      uint64_t v9 = &qword_2696D7C08;
LABEL_4:
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(v9);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
      uint64_t v13 = v11;
      uint64_t v14 = v8;
LABEL_10:
      uint64_t result = v12(v14, v13);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for CarCommandsSnippetsPluginModel(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
      v19(a1, a2, v18);
      uint64_t v20 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
      goto LABEL_7;
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
      v5(a1, a2, v4);
      uint64_t v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
      v5(a1 + v6[5], a2 + v6[5], v4);
      v5(a1 + v6[6], a2 + v6[6], v4);
      v5(a1 + v6[7], a2 + v6[7], v4);
      v5(a1 + v6[8], a2 + v6[8], v4);
      uint64_t v7 = v6[9];
      uint64_t v8 = a1 + v7;
      uint64_t v9 = a2 + v7;
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
      v5(a1 + v6[10], a2 + v6[10], v4);
      uint64_t v11 = v6[11];
      uint64_t v12 = a1 + v11;
      uint64_t v13 = a2 + v11;
      uint64_t v14 = &qword_2696D7B18;
      goto LABEL_4;
    case 7u:
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16);
      v22(a1, a2, v21);
      uint64_t v23 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
      v22(a1 + v23[5], a2 + v23[5], v21);
      uint64_t v24 = v23[6];
      uint64_t v25 = a1 + v24;
      uint64_t v26 = a2 + v24;
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
      uint64_t v28 = v23[7];
      uint64_t v29 = a1 + v28;
      uint64_t v30 = a2 + v28;
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
      uint64_t v32 = v23[8];
      uint64_t v33 = a1 + v32;
      uint64_t v34 = a2 + v32;
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
      v22(a1 + v23[9], a2 + v23[9], v21);
      break;
    case 8u:
    case 9u:
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
      uint64_t v16 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
      uint64_t v12 = a1 + v16;
      uint64_t v13 = a2 + v16;
      uint64_t v14 = &qword_2696D7C08;
LABEL_4:
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(v14);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v12, v13, v17);
      break;
    default:
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
      v19(a1, a2, v18);
      uint64_t v20 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
LABEL_7:
      v19(a1 + *(int *)(v20 + 20), a2 + *(int *)(v20 + 20), v18);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for CarCommandsSnippetsPluginModel(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24985C2F4(a1, (uint64_t (*)(void))type metadata accessor for CarCommandsSnippetsPluginModel);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
        v19(a1, a2, v18);
        uint64_t v20 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
        goto LABEL_8;
      case 2u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
        v5(a1, a2, v4);
        uint64_t v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
        v5(a1 + v6[5], a2 + v6[5], v4);
        v5(a1 + v6[6], a2 + v6[6], v4);
        v5(a1 + v6[7], a2 + v6[7], v4);
        v5(a1 + v6[8], a2 + v6[8], v4);
        uint64_t v7 = v6[9];
        uint64_t v8 = a1 + v7;
        uint64_t v9 = a2 + v7;
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
        v5(a1 + v6[10], a2 + v6[10], v4);
        uint64_t v11 = v6[11];
        uint64_t v12 = a1 + v11;
        uint64_t v13 = a2 + v11;
        uint64_t v14 = &qword_2696D7B18;
        goto LABEL_5;
      case 7u:
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16);
        v22(a1, a2, v21);
        uint64_t v23 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
        v22(a1 + v23[5], a2 + v23[5], v21);
        uint64_t v24 = v23[6];
        uint64_t v25 = a1 + v24;
        uint64_t v26 = a2 + v24;
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
        uint64_t v28 = v23[7];
        uint64_t v29 = a1 + v28;
        uint64_t v30 = a2 + v28;
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
        uint64_t v32 = v23[8];
        uint64_t v33 = a1 + v32;
        uint64_t v34 = a2 + v32;
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
        v22(a1 + v23[9], a2 + v23[9], v21);
        break;
      case 8u:
      case 9u:
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(a1, a2, v15);
        uint64_t v16 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
        uint64_t v12 = a1 + v16;
        uint64_t v13 = a2 + v16;
        uint64_t v14 = &qword_2696D7C08;
LABEL_5:
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(v14);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v12, v13, v17);
        break;
      default:
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16);
        v19(a1, a2, v18);
        uint64_t v20 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
LABEL_8:
        v19(a1 + *(int *)(v20 + 20), a2 + *(int *)(v20 + 20), v18);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24985C2F4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeWithTake for CarCommandsSnippetsPluginModel(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
      v19(a1, a2, v18);
      uint64_t v20 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
      goto LABEL_7;
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 6u:
      uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
      v5(a1, a2, v4);
      uint64_t v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
      v5(a1 + v6[5], a2 + v6[5], v4);
      v5(a1 + v6[6], a2 + v6[6], v4);
      v5(a1 + v6[7], a2 + v6[7], v4);
      v5(a1 + v6[8], a2 + v6[8], v4);
      uint64_t v7 = v6[9];
      uint64_t v8 = a1 + v7;
      uint64_t v9 = a2 + v7;
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
      v5(a1 + v6[10], a2 + v6[10], v4);
      uint64_t v11 = v6[11];
      uint64_t v12 = a1 + v11;
      uint64_t v13 = a2 + v11;
      uint64_t v14 = &qword_2696D7B18;
      goto LABEL_4;
    case 7u:
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32);
      v22(a1, a2, v21);
      uint64_t v23 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
      v22(a1 + v23[5], a2 + v23[5], v21);
      uint64_t v24 = v23[6];
      uint64_t v25 = a1 + v24;
      uint64_t v26 = a2 + v24;
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
      uint64_t v28 = v23[7];
      uint64_t v29 = a1 + v28;
      uint64_t v30 = a2 + v28;
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
      uint64_t v32 = v23[8];
      uint64_t v33 = a1 + v32;
      uint64_t v34 = a2 + v32;
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
      v22(a1 + v23[9], a2 + v23[9], v21);
      break;
    case 8u:
    case 9u:
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
      uint64_t v16 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
      uint64_t v12 = a1 + v16;
      uint64_t v13 = a2 + v16;
      uint64_t v14 = &qword_2696D7C08;
LABEL_4:
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(v14);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v12, v13, v17);
      break;
    default:
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
      v19(a1, a2, v18);
      uint64_t v20 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
LABEL_7:
      v19(a1 + *(int *)(v20 + 20), a2 + *(int *)(v20 + 20), v18);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for CarCommandsSnippetsPluginModel(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_24985C2F4(a1, (uint64_t (*)(void))type metadata accessor for CarCommandsSnippetsPluginModel);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
        v19(a1, a2, v18);
        uint64_t v20 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
        goto LABEL_8;
      case 2u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        int v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
        v5(a1, a2, v4);
        uint64_t v6 = (int *)type metadata accessor for CarCommandsToggleSnippetModel(0);
        v5(a1 + v6[5], a2 + v6[5], v4);
        v5(a1 + v6[6], a2 + v6[6], v4);
        v5(a1 + v6[7], a2 + v6[7], v4);
        v5(a1 + v6[8], a2 + v6[8], v4);
        uint64_t v7 = v6[9];
        uint64_t v8 = a1 + v7;
        uint64_t v9 = a2 + v7;
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
        v5(a1 + v6[10], a2 + v6[10], v4);
        uint64_t v11 = v6[11];
        uint64_t v12 = a1 + v11;
        uint64_t v13 = a2 + v11;
        uint64_t v14 = &qword_2696D7B18;
        goto LABEL_5;
      case 7u:
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 32);
        v22(a1, a2, v21);
        uint64_t v23 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
        v22(a1 + v23[5], a2 + v23[5], v21);
        uint64_t v24 = v23[6];
        uint64_t v25 = a1 + v24;
        uint64_t v26 = a2 + v24;
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
        uint64_t v28 = v23[7];
        uint64_t v29 = a1 + v28;
        uint64_t v30 = a2 + v28;
        uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
        uint64_t v32 = v23[8];
        uint64_t v33 = a1 + v32;
        uint64_t v34 = a2 + v32;
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
        v22(a1 + v23[9], a2 + v23[9], v21);
        break;
      case 8u:
      case 9u:
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
        uint64_t v16 = *(int *)(type metadata accessor for CarCommandsDisambiguationSnippetModel(0) + 20);
        uint64_t v12 = a1 + v16;
        uint64_t v13 = a2 + v16;
        uint64_t v14 = &qword_2696D7C08;
LABEL_5:
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(v14);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v12, v13, v17);
        break;
      default:
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
        uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32);
        v19(a1, a2, v18);
        uint64_t v20 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
LABEL_8:
        v19(a1 + *(int *)(v20 + 20), a2 + *(int *)(v20 + 20), v18);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsSnippetsPluginModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for CarCommandsSnippetsPluginModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24985CD3C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24985CD4C()
{
  uint64_t result = type metadata accessor for CarCommandsConfirmationSnippetModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for CarCommandsAppPunchoutSnippetModel(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for CarCommandsToggleSnippetModel(319);
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for CarCommandsGaugeSnippetModel(319);
        if (v4 <= 0x3F)
        {
          uint64_t result = type metadata accessor for CarCommandsDisambiguationSnippetModel(319);
          if (v5 <= 0x3F)
          {
            swift_initEnumMetadataMultiPayload();
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CarCommandsSnippetsPluginModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CarCommandsSnippetsPluginModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x24985D028);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.CodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.CodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.ConfirmationCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.ConfirmationCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.AppPunchoutCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.AppPunchoutCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.LockStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.LockStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.TrunkStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.TrunkStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.ClimateStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.ClimateStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.AudibleSignalStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.AudibleSignalStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.VisibleSignalStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.VisibleSignalStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.PowerLevelStatusModelCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.PowerLevelStatusModelCodingKeys;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.AppDisambiguationCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.AppDisambiguationCodingKeys;
}

unsigned char *_s22CarCommandsUIFramework30CarCommandsSnippetsPluginModelO22ConfirmationCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24985D190);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsSnippetsPluginModel.CarNameDisambiguationCodingKeys()
{
  return &type metadata for CarCommandsSnippetsPluginModel.CarNameDisambiguationCodingKeys;
}

unint64_t sub_24985D1CC()
{
  unint64_t result = qword_2696D8320;
  if (!qword_2696D8320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8320);
  }
  return result;
}

unint64_t sub_24985D224()
{
  unint64_t result = qword_2696D8328;
  if (!qword_2696D8328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8328);
  }
  return result;
}

unint64_t sub_24985D27C()
{
  unint64_t result = qword_2696D8330;
  if (!qword_2696D8330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8330);
  }
  return result;
}

unint64_t sub_24985D2D4()
{
  unint64_t result = qword_2696D8338;
  if (!qword_2696D8338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8338);
  }
  return result;
}

unint64_t sub_24985D32C()
{
  unint64_t result = qword_2696D8340;
  if (!qword_2696D8340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8340);
  }
  return result;
}

unint64_t sub_24985D384()
{
  unint64_t result = qword_2696D8348;
  if (!qword_2696D8348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8348);
  }
  return result;
}

unint64_t sub_24985D3DC()
{
  unint64_t result = qword_2696D8350;
  if (!qword_2696D8350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8350);
  }
  return result;
}

unint64_t sub_24985D434()
{
  unint64_t result = qword_2696D8358;
  if (!qword_2696D8358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8358);
  }
  return result;
}

unint64_t sub_24985D48C()
{
  unint64_t result = qword_2696D8360;
  if (!qword_2696D8360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8360);
  }
  return result;
}

unint64_t sub_24985D4E4()
{
  unint64_t result = qword_2696D8368;
  if (!qword_2696D8368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8368);
  }
  return result;
}

unint64_t sub_24985D53C()
{
  unint64_t result = qword_2696D8370;
  if (!qword_2696D8370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8370);
  }
  return result;
}

unint64_t sub_24985D594()
{
  unint64_t result = qword_2696D8378;
  if (!qword_2696D8378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8378);
  }
  return result;
}

unint64_t sub_24985D5EC()
{
  unint64_t result = qword_2696D8380;
  if (!qword_2696D8380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8380);
  }
  return result;
}

unint64_t sub_24985D644()
{
  unint64_t result = qword_2696D8388;
  if (!qword_2696D8388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8388);
  }
  return result;
}

unint64_t sub_24985D69C()
{
  unint64_t result = qword_2696D8390;
  if (!qword_2696D8390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8390);
  }
  return result;
}

unint64_t sub_24985D6F4()
{
  unint64_t result = qword_2696D8398;
  if (!qword_2696D8398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8398);
  }
  return result;
}

unint64_t sub_24985D74C()
{
  unint64_t result = qword_2696D83A0;
  if (!qword_2696D83A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83A0);
  }
  return result;
}

unint64_t sub_24985D7A4()
{
  unint64_t result = qword_2696D83A8;
  if (!qword_2696D83A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83A8);
  }
  return result;
}

unint64_t sub_24985D7FC()
{
  unint64_t result = qword_2696D83B0;
  if (!qword_2696D83B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83B0);
  }
  return result;
}

unint64_t sub_24985D854()
{
  unint64_t result = qword_2696D83B8;
  if (!qword_2696D83B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83B8);
  }
  return result;
}

unint64_t sub_24985D8AC()
{
  unint64_t result = qword_2696D83C0;
  if (!qword_2696D83C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83C0);
  }
  return result;
}

unint64_t sub_24985D904()
{
  unint64_t result = qword_2696D83C8;
  if (!qword_2696D83C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83C8);
  }
  return result;
}

unint64_t sub_24985D95C()
{
  unint64_t result = qword_2696D83D0;
  if (!qword_2696D83D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83D0);
  }
  return result;
}

unint64_t sub_24985D9B4()
{
  unint64_t result = qword_2696D83D8;
  if (!qword_2696D83D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83D8);
  }
  return result;
}

unint64_t sub_24985DA0C()
{
  unint64_t result = qword_2696D83E0;
  if (!qword_2696D83E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83E0);
  }
  return result;
}

unint64_t sub_24985DA64()
{
  unint64_t result = qword_2696D83E8;
  if (!qword_2696D83E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83E8);
  }
  return result;
}

unint64_t sub_24985DABC()
{
  unint64_t result = qword_2696D83F0;
  if (!qword_2696D83F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83F0);
  }
  return result;
}

unint64_t sub_24985DB14()
{
  unint64_t result = qword_2696D83F8;
  if (!qword_2696D83F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D83F8);
  }
  return result;
}

unint64_t sub_24985DB6C()
{
  unint64_t result = qword_2696D8400;
  if (!qword_2696D8400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8400);
  }
  return result;
}

unint64_t sub_24985DBC4()
{
  unint64_t result = qword_2696D8408;
  if (!qword_2696D8408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8408);
  }
  return result;
}

unint64_t sub_24985DC1C()
{
  unint64_t result = qword_2696D8410;
  if (!qword_2696D8410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8410);
  }
  return result;
}

unint64_t sub_24985DC74()
{
  unint64_t result = qword_2696D8418;
  if (!qword_2696D8418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8418);
  }
  return result;
}

unint64_t sub_24985DCCC()
{
  unint64_t result = qword_2696D8420;
  if (!qword_2696D8420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8420);
  }
  return result;
}

uint64_t sub_24985DD20(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x616D7269666E6F63 && a2 == 0xEC0000006E6F6974;
  if (v2 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x68636E7550707061 && a2 == 0xEB0000000074756FLL || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746174536B636F6CLL && a2 == 0xEF6C65646F4D7375 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000249867430 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000249867450 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000249867470 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000249867490 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000002498674B0 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002498674D0 || (sub_249863B70() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000002498674F0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    char v6 = sub_249863B70();
    swift_bridgeObjectRelease();
    if (v6) {
      return 9;
    }
    else {
      return 10;
    }
  }
}

Swift::String __swiftcall SnippetModel.responseViewId()()
{
  uint64_t v0 = sub_249863A60();
  __break(1u);
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t CarCommandsGaugeSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8428);
  MEMORY[0x270FA5388](v31);
  int v3 = (uint64_t *)((char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_249863860();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8110);
  uint64_t v7 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8118);
  MEMORY[0x270FA5388](v32);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v12 = v1[5];
  long long v55 = v1[4];
  long long v56 = v12;
  long long v57 = v1[6];
  uint64_t v58 = *((void *)v1 + 14);
  long long v13 = v1[1];
  v52[0] = *v1;
  v52[1] = v13;
  long long v14 = v1[3];
  long long v53 = v1[2];
  long long v54 = v14;
  uint64_t v15 = MEMORY[0x263F8D310];
  uint64_t v16 = MEMORY[0x263F77998];
  long long v60 = v13;
  uint64_t v50 = MEMORY[0x263F8D310];
  uint64_t v51 = MEMORY[0x263F77998];
  long long v49 = v13;
  if (!*((void *)&v53 + 1)) {
    goto LABEL_6;
  }
  uint64_t v17 = HIBYTE(*((void *)&v53 + 1)) & 0xFLL;
  if ((*((void *)&v53 + 1) & 0x2000000000000000) == 0) {
    uint64_t v17 = v53 & 0xFFFFFFFFFFFFLL;
  }
  if (v17)
  {
    *((void *)&v47 + 1) = MEMORY[0x263F8D310];
    uint64_t v48 = MEMORY[0x263F77998];
    long long v46 = v53;
    swift_bridgeObjectRetain();
  }
  else
  {
LABEL_6:
    uint64_t v48 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
  }
  uint64_t v45 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v59 = *v1;
  uint64_t v41 = v15;
  uint64_t v42 = v16;
  long long v40 = v59;
  sub_249854AB0((uint64_t)&v60);
  sub_249854AB0((uint64_t)&v59);
  *int v3 = sub_249863780();
  v3[1] = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8430);
  sub_24985E5F0((uint64_t)v52, (uint64_t)v3 + *(int *)(v19 + 44));
  sub_24984EA38(&qword_2696D8438, &qword_2696D8428);
  uint64_t v20 = sub_2498635B0();
  sub_24984E368((uint64_t)v3, &qword_2696D8428);
  uint64_t v38 = MEMORY[0x263F1B720];
  uint64_t v39 = MEMORY[0x263F774B0];
  uint64_t v37 = v20;
  sub_249863850();
  sub_24985F2B4(&qword_2696D8140, MEMORY[0x263F778A0]);
  uint64_t v21 = v34;
  sub_249863640();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v6, v21);
  uint64_t v23 = *((void *)&v56 + 1);
  uint64_t v22 = v57;
  sub_2498638A0();
  sub_24985F2B4((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_249863490();
  uint64_t v26 = v25;
  uint64_t v27 = v35;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v9, v35);
  uint64_t v28 = (uint64_t *)&v11[*(int *)(v32 + 36)];
  *uint64_t v28 = v24;
  v28[1] = v26;
  v28[2] = v23;
  v28[3] = v22;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
  return sub_24985EA3C((uint64_t)v11, v36);
}

uint64_t sub_24985E5F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_249863570();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v39 = v3;
  uint64_t v40 = v4;
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8440);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8448);
  uint64_t v11 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  long long v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8450);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = a1;
  int v44 = *(_DWORD *)(a1 + 48);
  uint64_t v43 = 0x3F80000000000000;
  uint64_t v42 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7EE0);
  sub_24984D61C();
  sub_24985F260();
  sub_249863690();
  sub_249863560();
  sub_24984EA38(&qword_2696D8460, &qword_2696D8440);
  sub_24985F2B4(&qword_2696D8468, MEMORY[0x263F1A528]);
  uint64_t v18 = v39;
  sub_249863610();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v6, v18);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v19 = sub_249863660();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = v38;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v13, v38);
  uint64_t v22 = (uint64_t *)&v17[*(int *)(v15 + 44)];
  *uint64_t v22 = KeyPath;
  v22[1] = v19;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v21);
  uint64_t v23 = sub_249863780();
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)(v37 + 64);
  if (v26)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_2498636A0();
    sub_2498637A0();
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    uint64_t v26 = 0x3FE51EB851EB851FLL;
    unint64_t v32 = 0xC044000000000000;
  }
  else
  {
    uint64_t v27 = 0;
    unint64_t v32 = 0;
    uint64_t v29 = 0;
    uint64_t v31 = 0;
  }
  uint64_t v33 = v41;
  sub_24985F3AC((uint64_t)v17, v41);
  uint64_t v34 = (uint64_t *)(v33 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696D8470) + 36));
  *uint64_t v34 = v27;
  v34[1] = 0;
  v34[2] = v32;
  _OWORD v34[3] = v26;
  v34[4] = v26;
  v34[5] = v29;
  v34[6] = v31;
  v34[7] = v23;
  v34[8] = v25;
  return sub_24984E368((uint64_t)v17, &qword_2696D8450);
}

uint64_t sub_24985EA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24985EAA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24985EAC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_2498636B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7DF0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_2498636A0();
  uint64_t v9 = *MEMORY[0x263F1B510];
  uint64_t v10 = sub_2498636D0();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_2498636C0();
  swift_release();
  sub_24984E368((uint64_t)v8, &qword_2696D7DF0);
  uint64_t v31 = sub_249863650();
  uint64_t v12 = sub_249863680();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4B8], v2);
  uint64_t v30 = sub_2498636E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  sub_249863780();
  sub_249863460();
  uint64_t v28 = v32;
  LOBYTE(v5) = v33;
  uint64_t v27 = v34;
  LOBYTE(v3) = v35;
  uint64_t v13 = v36;
  uint64_t v26 = v37;
  sub_249863780();
  sub_249863460();
  uint64_t v14 = v38;
  uint64_t v15 = v40;
  uint64_t v16 = v42;
  uint64_t v17 = v43;
  char v54 = 1;
  char v51 = (char)v5;
  char v49 = v3;
  char v47 = v39;
  char v45 = v41;
  LOBYTE(v5) = sub_249863590();
  swift_release();
  uint64_t result = swift_release();
  char v19 = v54;
  *(_DWORD *)(a1 + 18) = v52;
  *(_WORD *)(a1 + 22) = v53;
  char v20 = v51;
  *(_DWORD *)(a1 + 49) = *(_DWORD *)v50;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)&v50[3];
  char v21 = v49;
  *(_DWORD *)(a1 + 65) = *(_DWORD *)v48;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)&v48[3];
  char v22 = v47;
  int v23 = *(_DWORD *)v46;
  *(_DWORD *)(a1 + 100) = *(_DWORD *)&v46[3];
  *(_DWORD *)(a1 + 97) = v23;
  LOBYTE(v23) = v45;
  *(_DWORD *)(a1 + 116) = *(_DWORD *)&v44[3];
  *(_DWORD *)(a1 + 113) = *(_DWORD *)v44;
  *(void *)a1 = v30;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = v19;
  *(unsigned char *)(a1 + 17) = 0;
  *(void *)(a1 + 24) = KeyPath;
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v28;
  *(unsigned char *)(a1 + 48) = v20;
  *(void *)(a1 + 56) = v27;
  *(unsigned char *)(a1 + 64) = v21;
  uint64_t v24 = v26;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v24;
  *(void *)(a1 + 88) = v14;
  *(unsigned char *)(a1 + 96) = v22;
  *(void *)(a1 + 104) = v15;
  *(unsigned char *)(a1 + 112) = v23;
  *(void *)(a1 + 120) = v16;
  *(void *)(a1 + 128) = v17;
  *(void *)(a1 + 136) = v31;
  *(unsigned char *)(a1 + 144) = (_BYTE)v5;
  *(_WORD *)(a1 + 145) = 256;
  return result;
}

void destroy for CarCommandsGaugeSnippet(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 104);
}

uint64_t initializeWithCopy for CarCommandsGaugeSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  uint64_t v10 = *(void **)(a2 + 104);
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = v10;
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = v10;
  return a1;
}

uint64_t assignWithCopy for CarCommandsGaugeSnippet(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 104);
  uint64_t v5 = *(void **)(a2 + 104);
  *(void *)(a1 + 104) = v5;
  id v6 = v5;

  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for CarCommandsGaugeSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void **)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);

  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsGaugeSnippet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsGaugeSnippet(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
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
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsGaugeSnippet()
{
  return &type metadata for CarCommandsGaugeSnippet;
}

uint64_t sub_24985F258@<X0>(uint64_t a1@<X8>)
{
  return sub_24985EAC0(a1);
}

unint64_t sub_24985F260()
{
  unint64_t result = qword_2696D8458;
  if (!qword_2696D8458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8458);
  }
  return result;
}

uint64_t sub_24985F2B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24985F2FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2498634E0();
  *a1 = result;
  return result;
}

uint64_t sub_24985F328()
{
  return sub_2498634F0();
}

uint64_t sub_24985F354@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_249863520();
  *a1 = result;
  return result;
}

uint64_t sub_24985F380()
{
  return sub_249863530();
}

uint64_t sub_24985F3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24985F414@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2498634E0();
  *a1 = result;
  return result;
}

uint64_t sub_24985F440()
{
  return sub_2498634F0();
}

uint64_t CarCommandsAppPunchoutSnippet.init(model:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_2498638A0();
  sub_24986025C((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
  uint64_t v4 = sub_249863490();
  uint64_t v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  sub_2498633A0();
  uint64_t result = sub_24985F558(a1);
  *a2 = v8;
  a2[1] = v9;
  a2[2] = v8;
  a2[3] = v9;
  a2[4] = v4;
  a2[5] = v6;
  return result;
}

uint64_t sub_24985F558(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t CarCommandsAppPunchoutSnippet.body.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8478);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = v0[1];
  v9[0] = *v0;
  v9[1] = v5;
  void v9[2] = v0[2];
  uint64_t v6 = (_OWORD *)swift_allocObject();
  long long v7 = v0[1];
  v6[1] = *v0;
  v6[2] = v7;
  v6[3] = v0[2];
  sub_24985F854((uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8480);
  sub_24984EA38(&qword_2696D8488, &qword_2696D8480);
  sub_2498637D0();
  sub_24984EA38(&qword_2696D8490, &qword_2696D8478);
  sub_249863640();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_24985F768(_OWORD *a1)
{
  uint64_t v2 = (_OWORD *)swift_allocObject();
  long long v3 = a1[1];
  v2[1] = *a1;
  v2[2] = v3;
  v2[3] = a1[2];
  sub_24985F854((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8498);
  sub_24984EA38(&qword_2696D84A0, &qword_2696D8498);
  return sub_249863740();
}

uint64_t sub_24985F84C()
{
  return sub_24985F768((_OWORD *)(v0 + 16));
}

uint64_t sub_24985F854(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24985F89C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24985F8B8(uint64_t a1)
{
  uint64_t v2 = sub_249863320();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = v6;
    swift_bridgeObjectRetain();
    sub_249863310();
    sub_249863870();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_24985F854(a1);
    sub_2498638A0();
    sub_24986025C((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
    uint64_t result = sub_249863480();
    __break(1u);
  }
  return result;
}

uint64_t sub_24985FA2C@<X0>(uint64_t a1@<X8>)
{
  sub_24984A2F0();
  swift_bridgeObjectRetain();
  uint64_t result = sub_2498635A0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_24985FA98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v18 = a1;
  uint64_t v1 = sub_249863330();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  char v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_249863370();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_2498637B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D84A8);
  uint64_t v10 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249863360();
  sub_2498637C0();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F76610], v1);
  uint64_t v13 = sub_24986025C(&qword_2696D84B0, MEMORY[0x263F77558]);
  sub_2498635C0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v19 = v6;
  uint64_t v20 = v13;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = v17;
  uint64_t v15 = sub_2498635B0();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v14);
  uint64_t *v18 = v15;
  return result;
}

uint64_t sub_24985FDB0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8478);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  char v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = v0[1];
  v9[0] = *v0;
  v9[1] = v5;
  void v9[2] = v0[2];
  uint64_t v6 = (_OWORD *)swift_allocObject();
  long long v7 = v0[1];
  v6[1] = *v0;
  v6[2] = v7;
  v6[3] = v0[2];
  sub_24985F854((uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8480);
  sub_24984EA38(&qword_2696D8488, &qword_2696D8480);
  sub_2498637D0();
  sub_24984EA38(&qword_2696D8490, &qword_2696D8478);
  sub_249863640();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

void destroy for CarCommandsAppPunchoutSnippet(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

void *initializeWithCopy for CarCommandsAppPunchoutSnippet(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v6 = (void *)a2[4];
  uint64_t v5 = a2[5];
  a1[4] = v6;
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v7 = v6;
  return a1;
}

void *assignWithCopy for CarCommandsAppPunchoutSnippet(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = (void *)a2[4];
  a1[4] = v5;
  id v6 = v5;

  a1[5] = a2[5];
  return a1;
}

uint64_t assignWithTake for CarCommandsAppPunchoutSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

ValueMetadata *type metadata accessor for CarCommandsAppPunchoutSnippet()
{
  return &type metadata for CarCommandsAppPunchoutSnippet;
}

uint64_t sub_2498600F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t objectdestroyTm_2()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2498601C8()
{
  return sub_24985F8B8(v0 + 16);
}

uint64_t sub_2498601D0()
{
  return sub_249863700();
}

uint64_t sub_24986024C@<X0>(uint64_t a1@<X8>)
{
  return sub_24985FA2C(a1);
}

uint64_t sub_249860254@<X0>(uint64_t *a1@<X8>)
{
  return sub_24985FA98(a1);
}

uint64_t sub_24986025C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t CarCommandsUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t CarCommandsUIPlugin.init()()
{
  return v0;
}

uint64_t CarCommandsUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  return sub_24986033C(a1);
}

uint64_t CarCommandsUIPlugin.deinit()
{
  return v0;
}

uint64_t CarCommandsUIPlugin.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2498602F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_249860324(uint64_t a1)
{
  return sub_24986033C(a1);
}

uint64_t sub_24986033C(uint64_t a1)
{
  uint64_t v142 = a1;
  uint64_t v138 = type metadata accessor for CarNameDisambiguationSnippet();
  MEMORY[0x270FA5388](v138);
  uint64_t v135 = (uint64_t)&v94 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D84C0);
  uint64_t v137 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  v136 = (char *)&v94 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = type metadata accessor for AppDisambiguationSnippet();
  MEMORY[0x270FA5388](v133);
  uint64_t v130 = (uint64_t)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D84C8);
  uint64_t v132 = *(void *)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  v131 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CarCommandsDisambiguationSnippetModel(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v140 = (uint64_t)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = type metadata accessor for PowerLevelSnippet();
  MEMORY[0x270FA5388](v128);
  uint64_t v125 = (uint64_t)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D84D0);
  uint64_t v127 = *(void *)(v129 - 8);
  MEMORY[0x270FA5388](v129);
  uint64_t v126 = (char *)&v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v124 = (uint64_t)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = type metadata accessor for VisibleSignalStatusSnippet();
  MEMORY[0x270FA5388](v122);
  uint64_t v119 = (uint64_t)&v94 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D84D8);
  uint64_t v121 = *(void *)(v123 - 8);
  MEMORY[0x270FA5388](v123);
  uint64_t v120 = (char *)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = type metadata accessor for AudibleSignalStatusSnippet();
  MEMORY[0x270FA5388](v117);
  uint64_t v114 = (uint64_t)&v94 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D84E0);
  uint64_t v116 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  uint64_t v115 = (char *)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = type metadata accessor for ClimateStatusSnippet();
  MEMORY[0x270FA5388](v112);
  uint64_t v109 = (uint64_t)&v94 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D84E8);
  uint64_t v111 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  long long v110 = (char *)&v94 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = type metadata accessor for TrunkStatusSnippet();
  MEMORY[0x270FA5388](v107);
  uint64_t v104 = (uint64_t)&v94 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D84F0);
  uint64_t v106 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  long long v105 = (char *)&v94 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = type metadata accessor for LockStatusSnippet();
  MEMORY[0x270FA5388](v99);
  uint64_t v96 = (uint64_t)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D84F8);
  uint64_t v98 = *(void *)(v100 - 8);
  MEMORY[0x270FA5388](v100);
  uint64_t v97 = (char *)&v94 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for CarCommandsToggleSnippetModel(0);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v141 = (uint64_t)&v94 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8500);
  uint64_t v102 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  uint64_t v101 = (char *)&v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for CarCommandsAppPunchoutSnippetModel(0);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v94 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v95 = (uint64_t)&v94 - v28;
  uint64_t v29 = type metadata accessor for CarCommandsConfirmationSnippet();
  MEMORY[0x270FA5388](v29);
  uint64_t v31 = (char *)&v94 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8508);
  uint64_t v94 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v34 = (char *)&v94 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for CarCommandsConfirmationSnippetModel(0);
  MEMORY[0x270FA5388](v35 - 8);
  uint64_t v37 = (char *)&v94 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for CarCommandsSnippetsPluginModel();
  MEMORY[0x270FA5388](v38);
  uint64_t v40 = (char *)&v94 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249861BC4(v142, (uint64_t)v40, (uint64_t (*)(void))type metadata accessor for CarCommandsSnippetsPluginModel);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v47 = v95;
      sub_249861B5C((uint64_t)v40, v95, type metadata accessor for CarCommandsAppPunchoutSnippetModel);
      sub_249861BC4(v47, (uint64_t)v27, type metadata accessor for CarCommandsAppPunchoutSnippetModel);
      sub_2498638A0();
      sub_249861C2C((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
      uint64_t v48 = (void *)sub_249863490();
      uint64_t v50 = v49;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
      sub_2498633A0();
      int v52 = v143;
      unint64_t v51 = v144;
      sub_2498633A0();
      __int16 v53 = v143;
      unint64_t v54 = v144;
      sub_249861C74((uint64_t)v27, type metadata accessor for CarCommandsAppPunchoutSnippetModel);
      v143 = v52;
      unint64_t v144 = v51;
      uint64_t v145 = v53;
      unint64_t v146 = v54;
      uint64_t v147 = v48;
      uint64_t v148 = v50;
      unint64_t v55 = sub_249861B08();
      long long v56 = v101;
      sub_2498635E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v143 = &type metadata for CarCommandsAppPunchoutSnippet;
      unint64_t v144 = v55;
      swift_getOpaqueTypeConformance2();
      uint64_t v57 = v103;
      uint64_t v44 = sub_2498635B0();
      (*(void (**)(char *, uint64_t))(v102 + 8))(v56, v57);
      uint64_t v46 = v47;
      char v45 = type metadata accessor for CarCommandsAppPunchoutSnippetModel;
      break;
    case 2u:
      uint64_t v58 = v141;
      sub_249861B5C((uint64_t)v40, v141, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v59 = v96;
      sub_249861BC4(v58, v96, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v60 = sub_249861C2C(&qword_2696D8548, (void (*)(uint64_t))type metadata accessor for LockStatusSnippet);
      uint64_t v61 = v97;
      uint64_t v62 = (ValueMetadata *)v99;
      sub_2498635E0();
      sub_249861C74(v59, (uint64_t (*)(void))type metadata accessor for LockStatusSnippet);
      v143 = v62;
      unint64_t v144 = v60;
      swift_getOpaqueTypeConformance2();
      uint64_t v63 = v100;
      uint64_t v44 = sub_2498635B0();
      uint64_t v64 = &v130;
      goto LABEL_9;
    case 3u:
      uint64_t v58 = v141;
      sub_249861B5C((uint64_t)v40, v141, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v65 = v104;
      sub_249861BC4(v58, v104, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v66 = sub_249861C2C(&qword_2696D8540, (void (*)(uint64_t))type metadata accessor for TrunkStatusSnippet);
      uint64_t v61 = v105;
      uint64_t v67 = (ValueMetadata *)v107;
      sub_2498635E0();
      sub_249861C74(v65, (uint64_t (*)(void))type metadata accessor for TrunkStatusSnippet);
      v143 = v67;
      unint64_t v144 = v66;
      swift_getOpaqueTypeConformance2();
      uint64_t v63 = v108;
      uint64_t v44 = sub_2498635B0();
      uint64_t v64 = &v138;
      goto LABEL_9;
    case 4u:
      uint64_t v58 = v141;
      sub_249861B5C((uint64_t)v40, v141, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v68 = v109;
      sub_249861BC4(v58, v109, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v69 = sub_249861C2C(&qword_2696D8538, (void (*)(uint64_t))type metadata accessor for ClimateStatusSnippet);
      uint64_t v61 = v110;
      uint64_t v70 = (ValueMetadata *)v112;
      sub_2498635E0();
      sub_249861C74(v68, (uint64_t (*)(void))type metadata accessor for ClimateStatusSnippet);
      v143 = v70;
      unint64_t v144 = v69;
      swift_getOpaqueTypeConformance2();
      uint64_t v63 = v113;
      uint64_t v44 = sub_2498635B0();
      uint64_t v64 = (uint64_t *)&v143;
      goto LABEL_9;
    case 5u:
      uint64_t v58 = v141;
      sub_249861B5C((uint64_t)v40, v141, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v71 = v114;
      sub_249861BC4(v58, v114, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v72 = sub_249861C2C(&qword_2696D8530, (void (*)(uint64_t))type metadata accessor for AudibleSignalStatusSnippet);
      uint64_t v61 = v115;
      uint64_t v73 = (ValueMetadata *)v117;
      sub_2498635E0();
      sub_249861C74(v71, (uint64_t (*)(void))type metadata accessor for AudibleSignalStatusSnippet);
      v143 = v73;
      unint64_t v144 = v72;
      swift_getOpaqueTypeConformance2();
      uint64_t v63 = v118;
      uint64_t v44 = sub_2498635B0();
      uint64_t v64 = &v148;
      goto LABEL_9;
    case 6u:
      uint64_t v58 = v141;
      sub_249861B5C((uint64_t)v40, v141, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v74 = v119;
      sub_249861BC4(v58, v119, type metadata accessor for CarCommandsToggleSnippetModel);
      uint64_t v75 = sub_249861C2C(&qword_2696D8528, (void (*)(uint64_t))type metadata accessor for VisibleSignalStatusSnippet);
      uint64_t v61 = v120;
      uint64_t v76 = (ValueMetadata *)v122;
      sub_2498635E0();
      sub_249861C74(v74, (uint64_t (*)(void))type metadata accessor for VisibleSignalStatusSnippet);
      v143 = v76;
      unint64_t v144 = v75;
      swift_getOpaqueTypeConformance2();
      uint64_t v63 = v123;
      uint64_t v44 = sub_2498635B0();
      uint64_t v64 = &v149;
LABEL_9:
      (*(void (**)(char *, uint64_t))(*(v64 - 32) + 8))(v61, v63);
      uint64_t v77 = type metadata accessor for CarCommandsToggleSnippetModel;
      goto LABEL_14;
    case 7u:
      uint64_t v78 = v124;
      sub_249861B5C((uint64_t)v40, v124, type metadata accessor for CarCommandsGaugeSnippetModel);
      uint64_t v79 = v125;
      sub_249861BC4(v78, v125, type metadata accessor for CarCommandsGaugeSnippetModel);
      uint64_t v80 = sub_249861C2C(&qword_2696D8520, (void (*)(uint64_t))type metadata accessor for PowerLevelSnippet);
      uint64_t v81 = v126;
      uint64_t v82 = (ValueMetadata *)v128;
      sub_2498635E0();
      sub_249861C74(v79, (uint64_t (*)(void))type metadata accessor for PowerLevelSnippet);
      v143 = v82;
      unint64_t v144 = v80;
      swift_getOpaqueTypeConformance2();
      uint64_t v83 = v129;
      uint64_t v44 = sub_2498635B0();
      (*(void (**)(char *, uint64_t))(v127 + 8))(v81, v83);
      char v45 = type metadata accessor for CarCommandsGaugeSnippetModel;
      uint64_t v46 = v78;
      break;
    case 8u:
      uint64_t v58 = v140;
      sub_249861B5C((uint64_t)v40, v140, type metadata accessor for CarCommandsDisambiguationSnippetModel);
      uint64_t v84 = v130;
      sub_249861BC4(v58, v130, type metadata accessor for CarCommandsDisambiguationSnippetModel);
      uint64_t v85 = sub_249861C2C(&qword_2696D8518, (void (*)(uint64_t))type metadata accessor for AppDisambiguationSnippet);
      uint64_t v86 = v131;
      uint64_t v87 = (ValueMetadata *)v133;
      sub_2498635E0();
      sub_249861C74(v84, (uint64_t (*)(void))type metadata accessor for AppDisambiguationSnippet);
      v143 = v87;
      unint64_t v144 = v85;
      swift_getOpaqueTypeConformance2();
      uint64_t v88 = v134;
      uint64_t v44 = sub_2498635B0();
      uint64_t v89 = v132;
      goto LABEL_13;
    case 9u:
      uint64_t v58 = v140;
      sub_249861B5C((uint64_t)v40, v140, type metadata accessor for CarCommandsDisambiguationSnippetModel);
      uint64_t v90 = v135;
      sub_249861BC4(v58, v135, type metadata accessor for CarCommandsDisambiguationSnippetModel);
      uint64_t v91 = sub_249861C2C(&qword_2696D8510, (void (*)(uint64_t))type metadata accessor for CarNameDisambiguationSnippet);
      uint64_t v86 = v136;
      uint64_t v92 = (ValueMetadata *)v138;
      sub_2498635E0();
      sub_249861C74(v90, (uint64_t (*)(void))type metadata accessor for CarNameDisambiguationSnippet);
      v143 = v92;
      unint64_t v144 = v91;
      swift_getOpaqueTypeConformance2();
      uint64_t v88 = v139;
      uint64_t v44 = sub_2498635B0();
      uint64_t v89 = v137;
LABEL_13:
      (*(void (**)(char *, uint64_t))(v89 + 8))(v86, v88);
      uint64_t v77 = type metadata accessor for CarCommandsDisambiguationSnippetModel;
LABEL_14:
      char v45 = v77;
      uint64_t v46 = v58;
      break;
    default:
      sub_249861B5C((uint64_t)v40, (uint64_t)v37, type metadata accessor for CarCommandsConfirmationSnippetModel);
      sub_249861BC4((uint64_t)v37, (uint64_t)v31, type metadata accessor for CarCommandsConfirmationSnippetModel);
      char v41 = (uint64_t *)&v31[*(int *)(v29 + 20)];
      sub_2498638A0();
      sub_249861C2C((unint64_t *)&qword_2696D7B20, MEMORY[0x263F77980]);
      uint64_t *v41 = sub_249863490();
      v41[1] = v42;
      uint64_t v43 = sub_249861C2C(&qword_2696D8558, (void (*)(uint64_t))type metadata accessor for CarCommandsConfirmationSnippet);
      sub_2498635E0();
      sub_249861C74((uint64_t)v31, (uint64_t (*)(void))type metadata accessor for CarCommandsConfirmationSnippet);
      v143 = (ValueMetadata *)v29;
      unint64_t v144 = v43;
      swift_getOpaqueTypeConformance2();
      uint64_t v44 = sub_2498635B0();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v34, v32);
      char v45 = type metadata accessor for CarCommandsConfirmationSnippetModel;
      uint64_t v46 = (uint64_t)v37;
      break;
  }
  sub_249861C74(v46, v45);
  return v44;
}

uint64_t sub_249861A70()
{
  return sub_249861C2C(&qword_2696D84B8, (void (*)(uint64_t))type metadata accessor for CarCommandsSnippetsPluginModel);
}

uint64_t type metadata accessor for CarCommandsUIPlugin()
{
  return self;
}

uint64_t method lookup function for CarCommandsUIPlugin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CarCommandsUIPlugin);
}

uint64_t dispatch thunk of CarCommandsUIPlugin.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t sub_249861B08()
{
  unint64_t result = qword_2696D8550;
  if (!qword_2696D8550)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8550);
  }
  return result;
}

uint64_t sub_249861B5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_249861BC4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_249861C2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_249861C74(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t destroy for CarCommandsBackgroundPunchoutModifier(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CarCommandsBackgroundPunchoutModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  id v4 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CarCommandsBackgroundPunchoutModifier(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for CarCommandsBackgroundPunchoutModifier(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CarCommandsBackgroundPunchoutModifier(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarCommandsBackgroundPunchoutModifier(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CarCommandsBackgroundPunchoutModifier()
{
  return &type metadata for CarCommandsBackgroundPunchoutModifier;
}

uint64_t sub_249861EB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_249861ED4(void *a1, uint64_t a2)
{
  v13[1] = a2;
  uint64_t v3 = sub_249863320();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = 0;
  unint64_t v15 = 0xE000000000000000;
  sub_2498639F0();
  sub_249863900();
  swift_bridgeObjectRetain();
  sub_249863900();
  swift_bridgeObjectRelease();
  uint64_t v7 = v14;
  unint64_t v8 = v15;
  if (qword_2696D7AF8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2498633E0();
  __swift_project_value_buffer(v9, (uint64_t)qword_2696D7E38);
  os_log_type_t v10 = sub_249863940();
  sub_24984A000(v10, 8, 0xD00000000000009BLL, 0x80000002498675D0, 0x6E6F632879646F62, 0xEE00293A746E6574, 14, v7, v8);
  swift_bridgeObjectRelease();
  if (a1)
  {
    swift_bridgeObjectRetain();
    id v11 = a1;
    sub_249863310();
    sub_249863870();

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    sub_2498638A0();
    sub_24983A824();
    uint64_t result = sub_249863480();
    __break(1u);
  }
  return result;
}

uint64_t sub_24986212C()
{
  return sub_249863450();
}

uint64_t sub_249862148(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8560);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)v1;
  uint64_t v6 = *(void *)(v1 + 8);
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8568);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v5, a1, v10);
  v5[*(int *)(v3 + 36)] = 0;
  id v11 = (void *)swift_allocObject();
  void v11[2] = v7;
  v11[3] = v6;
  v11[4] = v9;
  v11[5] = v8;
  sub_2498622E8();
  id v12 = v7;
  swift_bridgeObjectRetain();
  sub_249863620();
  swift_release();
  return sub_2498623AC((uint64_t)v5);
}

uint64_t sub_24986229C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2498622DC()
{
  return sub_249861ED4(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_2498622E8()
{
  unint64_t result = qword_2696D8570;
  if (!qword_2696D8570)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696D8560);
    sub_24984EA38(&qword_2696D8578, &qword_2696D8568);
    sub_24984EA38(&qword_2696D8060, &qword_2696D8068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8570);
  }
  return result;
}

uint64_t sub_2498623AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D8560);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24986240C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t PowerLevelSnippet.init(model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_249862470(a1, a2);
}

uint64_t sub_249862470(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t PowerLevelSnippet.body.getter@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  sub_2498633A0();
  type metadata accessor for CarCommandsGaugeSnippetModel(0);
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  sub_2498633A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  sub_2498633A0();
  if ((_BYTE)v6) {
    uint64_t v2 = 0x6C69662E746C6F62;
  }
  else {
    uint64_t v2 = 0;
  }
  if ((_BYTE)v6) {
    unint64_t v3 = 0xE90000000000006CLL;
  }
  else {
    unint64_t v3 = 0;
  }
  sub_2498633A0();
  sub_2498638A0();
  sub_24983A824();
  uint64_t result = sub_249863490();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(_DWORD *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v2;
  *(void *)(a1 + 64) = v3;
  *(void *)(a1 + 72) = 0x6C6C69662E726163;
  *(void *)(a1 + 80) = 0xE800000000000000;
  *(void *)(a1 + 88) = v6;
  *(void *)(a1 + 96) = v7;
  *(void *)(a1 + 104) = result;
  *(void *)(a1 + 112) = v5;
  return result;
}

uint64_t sub_24986266C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for PowerLevelSnippet(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = (int *)v4;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + v6[5]), (uint64_t *)((char *)a2 + v6[5]), v7);
    uint64_t v9 = v6[6];
    uint64_t v10 = (char *)a1 + v9;
    id v11 = (char *)a2 + v9;
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    uint64_t v13 = v6[7];
    uint64_t v14 = (char *)a1 + v13;
    unint64_t v15 = (char *)a2 + v13;
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    uint64_t v17 = v6[8];
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    v8((uint64_t *)((char *)a1 + v6[9]), (uint64_t *)((char *)a2 + v6[9]), v7);
  }
  return a1;
}

uint64_t destroy for PowerLevelSnippet(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v12)((void *)(v2 - 8), a1, v2);
  unint64_t v3 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v12(a1 + v3[5], v2);
  uint64_t v4 = a1 + v3[6];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + v3[7];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + v3[8];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + v3[9];
  return ((uint64_t (*)(uint64_t, uint64_t))v12)(v10, v2);
}

uint64_t initializeWithCopy for PowerLevelSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  uint64_t v7 = v6[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = v6[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = v6[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  v5(a1 + v6[9], a2 + v6[9], v4);
  return a1;
}

uint64_t assignWithCopy for PowerLevelSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  uint64_t v7 = v6[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = v6[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = v6[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 24))(v16, v17, v18);
  v5(a1 + v6[9], a2 + v6[9], v4);
  return a1;
}

uint64_t initializeWithTake for PowerLevelSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  uint64_t v7 = v6[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = v6[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
  uint64_t v15 = v6[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32))(v16, v17, v18);
  v5(a1 + v6[9], a2 + v6[9], v4);
  return a1;
}

uint64_t assignWithTake for PowerLevelSnippet(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B10);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);
  v5(a1, a2, v4);
  uint64_t v6 = (int *)type metadata accessor for CarCommandsGaugeSnippetModel(0);
  v5(a1 + v6[5], a2 + v6[5], v4);
  uint64_t v7 = v6[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = v6[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  uint64_t v15 = v6[8];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696D7B08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40))(v16, v17, v18);
  v5(a1 + v6[9], a2 + v6[9], v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PowerLevelSnippet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2498630E0);
}

uint64_t sub_2498630E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for PowerLevelSnippet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_249863160);
}

uint64_t sub_249863160(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CarCommandsGaugeSnippetModel(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for PowerLevelSnippet()
{
  uint64_t result = qword_2696D8580;
  if (!qword_2696D8580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24986321C()
{
  uint64_t result = type metadata accessor for CarCommandsGaugeSnippetModel(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_2498632AC()
{
  unint64_t result = qword_2696D8590;
  if (!qword_2696D8590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696D8590);
  }
  return result;
}

uint64_t sub_249863300()
{
  return MEMORY[0x270F739D8]();
}

uint64_t sub_249863310()
{
  return MEMORY[0x270F73A60]();
}

uint64_t sub_249863320()
{
  return MEMORY[0x270F73A80]();
}

uint64_t sub_249863330()
{
  return MEMORY[0x270F73C68]();
}

uint64_t sub_249863340()
{
  return MEMORY[0x270F74E00]();
}

uint64_t sub_249863350()
{
  return MEMORY[0x270F74E08]();
}

uint64_t sub_249863360()
{
  return MEMORY[0x270F75650]();
}

uint64_t sub_249863370()
{
  return MEMORY[0x270F75670]();
}

uint64_t sub_249863380()
{
  return MEMORY[0x270F756A0]();
}

uint64_t sub_249863390()
{
  return MEMORY[0x270F756A8]();
}

uint64_t sub_2498633A0()
{
  return MEMORY[0x270F756B0]();
}

uint64_t sub_2498633B0()
{
  return MEMORY[0x270F756B8]();
}

uint64_t sub_2498633C0()
{
  return MEMORY[0x270F756C8]();
}

uint64_t sub_2498633D0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2498633E0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2498633F0()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_249863400()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_249863410()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_249863420()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_249863430()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_249863440()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_249863450()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_249863460()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_249863470()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_249863480()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_249863490()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_2498634A0()
{
  return MEMORY[0x270F758D0]();
}

uint64_t sub_2498634B0()
{
  return MEMORY[0x270F758D8]();
}

uint64_t sub_2498634C0()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_2498634D0()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_2498634E0()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_2498634F0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_249863500()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_249863510()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_249863520()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_249863530()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_249863540()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_249863550()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_249863560()
{
  return MEMORY[0x270F02970]();
}

uint64_t sub_249863570()
{
  return MEMORY[0x270F02978]();
}

uint64_t sub_249863580()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_249863590()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2498635A0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2498635B0()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_2498635C0()
{
  return MEMORY[0x270F75990]();
}

uint64_t sub_2498635D0()
{
  return MEMORY[0x270F75A58]();
}

uint64_t sub_2498635E0()
{
  return MEMORY[0x270F75AB0]();
}

uint64_t sub_2498635F0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_249863600()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_249863610()
{
  return MEMORY[0x270F03370]();
}

uint64_t sub_249863620()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_249863630()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_249863640()
{
  return MEMORY[0x270F038B8]();
}

uint64_t sub_249863650()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_249863660()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_249863670()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_249863680()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_249863690()
{
  return MEMORY[0x270F045D0]();
}

uint64_t sub_2498636A0()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2498636B0()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2498636C0()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_2498636D0()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_2498636E0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2498636F0()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_249863700()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_249863710()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_249863720()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_249863730()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_249863740()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_249863750()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_249863760()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_249863770()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_249863780()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_249863790()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_2498637A0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_2498637B0()
{
  return MEMORY[0x270F75B20]();
}

uint64_t sub_2498637C0()
{
  return MEMORY[0x270F75B38]();
}

uint64_t sub_2498637D0()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_2498637E0()
{
  return MEMORY[0x270F75C80]();
}

uint64_t sub_2498637F0()
{
  return MEMORY[0x270F75C90]();
}

uint64_t sub_249863800()
{
  return MEMORY[0x270F75D90]();
}

uint64_t sub_249863810()
{
  return MEMORY[0x270F75DB8]();
}

uint64_t sub_249863820()
{
  return MEMORY[0x270F75DC0]();
}

uint64_t sub_249863830()
{
  return MEMORY[0x270F75E08]();
}

uint64_t sub_249863840()
{
  return MEMORY[0x270F75E18]();
}

uint64_t sub_249863850()
{
  return MEMORY[0x270F75FC8]();
}

uint64_t sub_249863860()
{
  return MEMORY[0x270F75FE0]();
}

uint64_t sub_249863870()
{
  return MEMORY[0x270F76250]();
}

uint64_t sub_249863880()
{
  return MEMORY[0x270F76260]();
}

uint64_t sub_249863890()
{
  return MEMORY[0x270F76270]();
}

uint64_t sub_2498638A0()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_2498638B0()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2498638C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2498638D0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2498638E0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2498638F0()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_249863900()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_249863910()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_249863920()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_249863930()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_249863940()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_249863950()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_249863960()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_249863970()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_249863980()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_249863990()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2498639A0()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2498639C0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2498639D0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2498639E0()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2498639F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_249863A00()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_249863A10()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_249863A20()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_249863A30()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_249863A40()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_249863A50()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_249863A60()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_249863A70()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_249863A80()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_249863A90()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_249863AA0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_249863AB0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_249863AC0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_249863AD0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_249863AE0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_249863AF0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_249863B00()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_249863B10()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_249863B20()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_249863B30()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_249863B40()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_249863B50()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_249863B60()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_249863B70()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_249863B80()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_249863B90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_249863BA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_249863BB0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_249863BC0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_249863BD0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_249863BE0()
{
  return MEMORY[0x270F9FD98]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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